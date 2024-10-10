#[test_only]
module task2::faucet_coin_test {
    use sui::tx_context::{TxContext};
    use sui::coin;
    use sui::transfer::{public_freeze_object, public_share_object};
    use sui::url::Url;

    public struct SHARE_COIN has drop {}

    fun init(witness: SHARE_COIN, ctx: &mut TxContext) {

        let icon_url = option::none<Url>();

        let  (treasury_cap,coin_meta_data) =  coin::create_currency(witness, 6,b"EAS",b"EAS币",b"this is a EAS SHARE_COIN",icon_url, ctx);

        // 所有权共享  不可变共享
        public_freeze_object(coin_meta_data);

        // 共享 控制管理权限
        public_share_object(treasury_cap);
    }
}