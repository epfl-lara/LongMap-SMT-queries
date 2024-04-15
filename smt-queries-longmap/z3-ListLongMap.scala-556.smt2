; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15066 () Bool)

(assert start!15066)

(declare-fun b!144677 () Bool)

(declare-fun b_free!3061 () Bool)

(declare-fun b_next!3061 () Bool)

(assert (=> b!144677 (= b_free!3061 (not b_next!3061))))

(declare-fun tp!11676 () Bool)

(declare-fun b_and!8993 () Bool)

(assert (=> b!144677 (= tp!11676 b_and!8993)))

(declare-fun b!144678 () Bool)

(declare-fun b_free!3063 () Bool)

(declare-fun b_next!3063 () Bool)

(assert (=> b!144678 (= b_free!3063 (not b_next!3063))))

(declare-fun tp!11678 () Bool)

(declare-fun b_and!8995 () Bool)

(assert (=> b!144678 (= tp!11678 b_and!8995)))

(declare-fun b!144676 () Bool)

(declare-fun e!94274 () Bool)

(declare-fun e!94262 () Bool)

(declare-fun mapRes!4904 () Bool)

(assert (=> b!144676 (= e!94274 (and e!94262 mapRes!4904))))

(declare-fun condMapEmpty!4904 () Bool)

(declare-datatypes ((V!3577 0))(
  ( (V!3578 (val!1518 Int)) )
))
(declare-datatypes ((array!4915 0))(
  ( (array!4916 (arr!2320 (Array (_ BitVec 32) (_ BitVec 64))) (size!2596 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1130 0))(
  ( (ValueCellFull!1130 (v!3313 V!3577)) (EmptyCell!1130) )
))
(declare-datatypes ((array!4917 0))(
  ( (array!4918 (arr!2321 (Array (_ BitVec 32) ValueCell!1130)) (size!2597 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1168 0))(
  ( (LongMapFixedSize!1169 (defaultEntry!2988 Int) (mask!7351 (_ BitVec 32)) (extraKeys!2735 (_ BitVec 32)) (zeroValue!2834 V!3577) (minValue!2834 V!3577) (_size!633 (_ BitVec 32)) (_keys!4754 array!4915) (_values!2971 array!4917) (_vacant!633 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!948 0))(
  ( (Cell!949 (v!3314 LongMapFixedSize!1168)) )
))
(declare-datatypes ((LongMap!948 0))(
  ( (LongMap!949 (underlying!485 Cell!948)) )
))
(declare-fun thiss!992 () LongMap!948)

(declare-fun mapDefault!4904 () ValueCell!1130)

(assert (=> b!144676 (= condMapEmpty!4904 (= (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1130)) mapDefault!4904)))))

(declare-fun e!94264 () Bool)

(declare-fun tp_is_empty!2947 () Bool)

(declare-fun array_inv!1485 (array!4915) Bool)

(declare-fun array_inv!1486 (array!4917) Bool)

(assert (=> b!144677 (= e!94264 (and tp!11676 tp_is_empty!2947 (array_inv!1485 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (array_inv!1486 (_values!2971 (v!3314 (underlying!485 thiss!992)))) e!94274))))

(declare-fun e!94268 () Bool)

(declare-fun e!94273 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1168)

(assert (=> b!144678 (= e!94268 (and tp!11678 tp_is_empty!2947 (array_inv!1485 (_keys!4754 newMap!16)) (array_inv!1486 (_values!2971 newMap!16)) e!94273))))

(declare-fun b!144679 () Bool)

(declare-fun e!94270 () Bool)

(assert (=> b!144679 (= e!94270 tp_is_empty!2947)))

(declare-fun b!144680 () Bool)

(declare-fun res!68856 () Bool)

(declare-fun e!94260 () Bool)

(assert (=> b!144680 (=> res!68856 e!94260)))

(declare-datatypes ((List!1754 0))(
  ( (Nil!1751) (Cons!1750 (h!2358 (_ BitVec 64)) (t!6386 List!1754)) )
))
(declare-fun lt!75877 () List!1754)

(declare-fun noDuplicate!55 (List!1754) Bool)

(assert (=> b!144680 (= res!68856 (not (noDuplicate!55 lt!75877)))))

(declare-fun b!144681 () Bool)

(declare-fun res!68849 () Bool)

(declare-fun e!94267 () Bool)

(assert (=> b!144681 (=> (not res!68849) (not e!94267))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!144681 (= res!68849 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992)))))))))

(declare-fun b!144682 () Bool)

(declare-fun e!94271 () Bool)

(assert (=> b!144682 (= e!94271 e!94264)))

(declare-fun b!144683 () Bool)

(declare-fun e!94266 () Bool)

(assert (=> b!144683 (= e!94266 (not e!94260))))

(declare-fun res!68850 () Bool)

(assert (=> b!144683 (=> res!68850 e!94260)))

(assert (=> b!144683 (= res!68850 (or (bvsge (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> b!144683 (= lt!75877 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) Nil!1751))))

(declare-fun arrayNoDuplicates!0 (array!4915 (_ BitVec 32) List!1754) Bool)

(assert (=> b!144683 (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) from!355 Nil!1751)))

(declare-datatypes ((Unit!4581 0))(
  ( (Unit!4582) )
))
(declare-fun lt!75878 () Unit!4581)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4915 (_ BitVec 32) (_ BitVec 32)) Unit!4581)

(assert (=> b!144683 (= lt!75878 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144683 (arrayContainsKey!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!75879 () Unit!4581)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!151 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) (_ BitVec 32) Int) Unit!4581)

(assert (=> b!144683 (= lt!75879 (lemmaListMapContainsThenArrayContainsFrom!151 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun b!144684 () Bool)

(declare-fun res!68851 () Bool)

(assert (=> b!144684 (=> (not res!68851) (not e!94267))))

(assert (=> b!144684 (= res!68851 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7351 newMap!16)) (_size!633 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun b!144685 () Bool)

(declare-fun e!94269 () Bool)

(declare-fun mapRes!4903 () Bool)

(assert (=> b!144685 (= e!94273 (and e!94269 mapRes!4903))))

(declare-fun condMapEmpty!4903 () Bool)

(declare-fun mapDefault!4903 () ValueCell!1130)

(assert (=> b!144685 (= condMapEmpty!4903 (= (arr!2321 (_values!2971 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1130)) mapDefault!4903)))))

(declare-fun mapIsEmpty!4903 () Bool)

(assert (=> mapIsEmpty!4903 mapRes!4904))

(declare-fun b!144686 () Bool)

(assert (=> b!144686 (= e!94262 tp_is_empty!2947)))

(declare-fun b!144687 () Bool)

(declare-fun res!68848 () Bool)

(assert (=> b!144687 (=> (not res!68848) (not e!94267))))

(declare-fun valid!570 (LongMapFixedSize!1168) Bool)

(assert (=> b!144687 (= res!68848 (valid!570 newMap!16))))

(declare-fun b!144688 () Bool)

(declare-fun res!68857 () Bool)

(assert (=> b!144688 (=> res!68857 e!94260)))

(declare-fun contains!923 (List!1754 (_ BitVec 64)) Bool)

(assert (=> b!144688 (= res!68857 (contains!923 lt!75877 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144689 () Bool)

(declare-fun e!94272 () Bool)

(assert (=> b!144689 (= e!94267 e!94272)))

(declare-fun res!68854 () Bool)

(assert (=> b!144689 (=> (not res!68854) (not e!94272))))

(declare-datatypes ((tuple2!2684 0))(
  ( (tuple2!2685 (_1!1353 (_ BitVec 64)) (_2!1353 V!3577)) )
))
(declare-datatypes ((List!1755 0))(
  ( (Nil!1752) (Cons!1751 (h!2359 tuple2!2684) (t!6387 List!1755)) )
))
(declare-datatypes ((ListLongMap!1725 0))(
  ( (ListLongMap!1726 (toList!878 List!1755)) )
))
(declare-fun lt!75876 () ListLongMap!1725)

(declare-fun lt!75875 () ListLongMap!1725)

(assert (=> b!144689 (= res!68854 (and (= lt!75875 lt!75876) (not (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1433 (LongMapFixedSize!1168) ListLongMap!1725)

(assert (=> b!144689 (= lt!75876 (map!1433 newMap!16))))

(declare-fun getCurrentListMap!537 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) Int) ListLongMap!1725)

(assert (=> b!144689 (= lt!75875 (getCurrentListMap!537 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun mapNonEmpty!4903 () Bool)

(declare-fun tp!11675 () Bool)

(assert (=> mapNonEmpty!4903 (= mapRes!4903 (and tp!11675 e!94270))))

(declare-fun mapKey!4903 () (_ BitVec 32))

(declare-fun mapValue!4903 () ValueCell!1130)

(declare-fun mapRest!4903 () (Array (_ BitVec 32) ValueCell!1130))

(assert (=> mapNonEmpty!4903 (= (arr!2321 (_values!2971 newMap!16)) (store mapRest!4903 mapKey!4903 mapValue!4903))))

(declare-fun res!68853 () Bool)

(assert (=> start!15066 (=> (not res!68853) (not e!94267))))

(declare-fun valid!571 (LongMap!948) Bool)

(assert (=> start!15066 (= res!68853 (valid!571 thiss!992))))

(assert (=> start!15066 e!94267))

(declare-fun e!94263 () Bool)

(assert (=> start!15066 e!94263))

(assert (=> start!15066 true))

(assert (=> start!15066 e!94268))

(declare-fun b!144690 () Bool)

(declare-fun e!94261 () Bool)

(assert (=> b!144690 (= e!94261 tp_is_empty!2947)))

(declare-fun b!144691 () Bool)

(assert (=> b!144691 (= e!94260 (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!75877))))

(declare-fun b!144692 () Bool)

(declare-fun res!68855 () Bool)

(assert (=> b!144692 (=> res!68855 e!94260)))

(assert (=> b!144692 (= res!68855 (contains!923 lt!75877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144693 () Bool)

(assert (=> b!144693 (= e!94272 e!94266)))

(declare-fun res!68852 () Bool)

(assert (=> b!144693 (=> (not res!68852) (not e!94266))))

(declare-fun contains!924 (ListLongMap!1725 (_ BitVec 64)) Bool)

(assert (=> b!144693 (= res!68852 (contains!924 lt!75876 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2686 0))(
  ( (tuple2!2687 (_1!1354 Bool) (_2!1354 LongMapFixedSize!1168)) )
))
(declare-fun lt!75880 () tuple2!2686)

(declare-fun update!215 (LongMapFixedSize!1168 (_ BitVec 64) V!3577) tuple2!2686)

(declare-fun get!1545 (ValueCell!1130 V!3577) V!3577)

(declare-fun dynLambda!441 (Int (_ BitVec 64)) V!3577)

(assert (=> b!144693 (= lt!75880 (update!215 newMap!16 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!4904 () Bool)

(declare-fun tp!11677 () Bool)

(assert (=> mapNonEmpty!4904 (= mapRes!4904 (and tp!11677 e!94261))))

(declare-fun mapValue!4904 () ValueCell!1130)

(declare-fun mapRest!4904 () (Array (_ BitVec 32) ValueCell!1130))

(declare-fun mapKey!4904 () (_ BitVec 32))

(assert (=> mapNonEmpty!4904 (= (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) (store mapRest!4904 mapKey!4904 mapValue!4904))))

(declare-fun b!144694 () Bool)

(assert (=> b!144694 (= e!94263 e!94271)))

(declare-fun mapIsEmpty!4904 () Bool)

(assert (=> mapIsEmpty!4904 mapRes!4903))

(declare-fun b!144695 () Bool)

(assert (=> b!144695 (= e!94269 tp_is_empty!2947)))

(assert (= (and start!15066 res!68853) b!144681))

(assert (= (and b!144681 res!68849) b!144687))

(assert (= (and b!144687 res!68848) b!144684))

(assert (= (and b!144684 res!68851) b!144689))

(assert (= (and b!144689 res!68854) b!144693))

(assert (= (and b!144693 res!68852) b!144683))

(assert (= (and b!144683 (not res!68850)) b!144680))

(assert (= (and b!144680 (not res!68856)) b!144692))

(assert (= (and b!144692 (not res!68855)) b!144688))

(assert (= (and b!144688 (not res!68857)) b!144691))

(assert (= (and b!144676 condMapEmpty!4904) mapIsEmpty!4903))

(assert (= (and b!144676 (not condMapEmpty!4904)) mapNonEmpty!4904))

(get-info :version)

(assert (= (and mapNonEmpty!4904 ((_ is ValueCellFull!1130) mapValue!4904)) b!144690))

(assert (= (and b!144676 ((_ is ValueCellFull!1130) mapDefault!4904)) b!144686))

(assert (= b!144677 b!144676))

(assert (= b!144682 b!144677))

(assert (= b!144694 b!144682))

(assert (= start!15066 b!144694))

(assert (= (and b!144685 condMapEmpty!4903) mapIsEmpty!4904))

(assert (= (and b!144685 (not condMapEmpty!4903)) mapNonEmpty!4903))

(assert (= (and mapNonEmpty!4903 ((_ is ValueCellFull!1130) mapValue!4903)) b!144679))

(assert (= (and b!144685 ((_ is ValueCellFull!1130) mapDefault!4903)) b!144695))

(assert (= b!144678 b!144685))

(assert (= start!15066 b!144678))

(declare-fun b_lambda!6481 () Bool)

(assert (=> (not b_lambda!6481) (not b!144693)))

(declare-fun t!6383 () Bool)

(declare-fun tb!2593 () Bool)

(assert (=> (and b!144677 (= (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))) t!6383) tb!2593))

(declare-fun result!4247 () Bool)

(assert (=> tb!2593 (= result!4247 tp_is_empty!2947)))

(assert (=> b!144693 t!6383))

(declare-fun b_and!8997 () Bool)

(assert (= b_and!8993 (and (=> t!6383 result!4247) b_and!8997)))

(declare-fun tb!2595 () Bool)

(declare-fun t!6385 () Bool)

(assert (=> (and b!144678 (= (defaultEntry!2988 newMap!16) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))) t!6385) tb!2595))

(declare-fun result!4251 () Bool)

(assert (= result!4251 result!4247))

(assert (=> b!144693 t!6385))

(declare-fun b_and!8999 () Bool)

(assert (= b_and!8995 (and (=> t!6385 result!4251) b_and!8999)))

(declare-fun m!174237 () Bool)

(assert (=> b!144688 m!174237))

(declare-fun m!174239 () Bool)

(assert (=> b!144677 m!174239))

(declare-fun m!174241 () Bool)

(assert (=> b!144677 m!174241))

(declare-fun m!174243 () Bool)

(assert (=> b!144692 m!174243))

(declare-fun m!174245 () Bool)

(assert (=> b!144687 m!174245))

(declare-fun m!174247 () Bool)

(assert (=> b!144693 m!174247))

(declare-fun m!174249 () Bool)

(assert (=> b!144693 m!174249))

(declare-fun m!174251 () Bool)

(assert (=> b!144693 m!174251))

(declare-fun m!174253 () Bool)

(assert (=> b!144693 m!174253))

(declare-fun m!174255 () Bool)

(assert (=> b!144693 m!174255))

(assert (=> b!144693 m!174253))

(assert (=> b!144693 m!174249))

(assert (=> b!144693 m!174253))

(assert (=> b!144693 m!174251))

(declare-fun m!174257 () Bool)

(assert (=> b!144693 m!174257))

(assert (=> b!144693 m!174247))

(declare-fun m!174259 () Bool)

(assert (=> b!144691 m!174259))

(declare-fun m!174261 () Bool)

(assert (=> mapNonEmpty!4903 m!174261))

(declare-fun m!174263 () Bool)

(assert (=> b!144683 m!174263))

(declare-fun m!174265 () Bool)

(assert (=> b!144683 m!174265))

(assert (=> b!144683 m!174253))

(declare-fun m!174267 () Bool)

(assert (=> b!144683 m!174267))

(assert (=> b!144683 m!174253))

(assert (=> b!144683 m!174253))

(declare-fun m!174269 () Bool)

(assert (=> b!144683 m!174269))

(declare-fun m!174271 () Bool)

(assert (=> mapNonEmpty!4904 m!174271))

(declare-fun m!174273 () Bool)

(assert (=> start!15066 m!174273))

(declare-fun m!174275 () Bool)

(assert (=> b!144680 m!174275))

(assert (=> b!144689 m!174253))

(declare-fun m!174277 () Bool)

(assert (=> b!144689 m!174277))

(declare-fun m!174279 () Bool)

(assert (=> b!144689 m!174279))

(declare-fun m!174281 () Bool)

(assert (=> b!144678 m!174281))

(declare-fun m!174283 () Bool)

(assert (=> b!144678 m!174283))

(check-sat (not b!144691) (not b!144677) b_and!8997 (not mapNonEmpty!4904) (not mapNonEmpty!4903) (not b!144692) (not start!15066) b_and!8999 (not b!144687) (not b_next!3061) tp_is_empty!2947 (not b!144680) (not b_lambda!6481) (not b!144678) (not b_next!3063) (not b!144689) (not b!144683) (not b!144688) (not b!144693))
(check-sat b_and!8997 b_and!8999 (not b_next!3061) (not b_next!3063))
(get-model)

(declare-fun b_lambda!6487 () Bool)

(assert (= b_lambda!6481 (or (and b!144677 b_free!3061) (and b!144678 b_free!3063 (= (defaultEntry!2988 newMap!16) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))))) b_lambda!6487)))

(check-sat (not b!144691) (not b!144677) b_and!8997 (not mapNonEmpty!4904) (not b!144680) (not b_lambda!6487) (not mapNonEmpty!4903) (not b!144692) (not start!15066) b_and!8999 (not b!144687) (not b_next!3061) tp_is_empty!2947 (not b!144678) (not b_next!3063) (not b!144689) (not b!144683) (not b!144688) (not b!144693))
(check-sat b_and!8997 b_and!8999 (not b_next!3061) (not b_next!3063))
(get-model)

(declare-fun d!46125 () Bool)

(assert (=> d!46125 (= (map!1433 newMap!16) (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun bs!6090 () Bool)

(assert (= bs!6090 d!46125))

(declare-fun m!174381 () Bool)

(assert (=> bs!6090 m!174381))

(assert (=> b!144689 d!46125))

(declare-fun b!144864 () Bool)

(declare-fun e!94399 () ListLongMap!1725)

(declare-fun call!16115 () ListLongMap!1725)

(assert (=> b!144864 (= e!94399 call!16115)))

(declare-fun b!144865 () Bool)

(declare-fun e!94405 () Unit!4581)

(declare-fun lt!75975 () Unit!4581)

(assert (=> b!144865 (= e!94405 lt!75975)))

(declare-fun lt!75971 () ListLongMap!1725)

(declare-fun getCurrentListMapNoExtraKeys!135 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) Int) ListLongMap!1725)

(assert (=> b!144865 (= lt!75971 (getCurrentListMapNoExtraKeys!135 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun lt!75976 () (_ BitVec 64))

(assert (=> b!144865 (= lt!75976 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75978 () (_ BitVec 64))

(assert (=> b!144865 (= lt!75978 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75963 () Unit!4581)

(declare-fun addStillContains!99 (ListLongMap!1725 (_ BitVec 64) V!3577 (_ BitVec 64)) Unit!4581)

(assert (=> b!144865 (= lt!75963 (addStillContains!99 lt!75971 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) lt!75978))))

(declare-fun +!170 (ListLongMap!1725 tuple2!2684) ListLongMap!1725)

(assert (=> b!144865 (contains!924 (+!170 lt!75971 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!75978)))

(declare-fun lt!75961 () Unit!4581)

(assert (=> b!144865 (= lt!75961 lt!75963)))

(declare-fun lt!75969 () ListLongMap!1725)

(assert (=> b!144865 (= lt!75969 (getCurrentListMapNoExtraKeys!135 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun lt!75962 () (_ BitVec 64))

(assert (=> b!144865 (= lt!75962 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75972 () (_ BitVec 64))

(assert (=> b!144865 (= lt!75972 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75982 () Unit!4581)

(declare-fun addApplyDifferent!99 (ListLongMap!1725 (_ BitVec 64) V!3577 (_ BitVec 64)) Unit!4581)

(assert (=> b!144865 (= lt!75982 (addApplyDifferent!99 lt!75969 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992))) lt!75972))))

(declare-fun apply!123 (ListLongMap!1725 (_ BitVec 64)) V!3577)

(assert (=> b!144865 (= (apply!123 (+!170 lt!75969 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!75972) (apply!123 lt!75969 lt!75972))))

(declare-fun lt!75973 () Unit!4581)

(assert (=> b!144865 (= lt!75973 lt!75982)))

(declare-fun lt!75965 () ListLongMap!1725)

(assert (=> b!144865 (= lt!75965 (getCurrentListMapNoExtraKeys!135 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun lt!75967 () (_ BitVec 64))

(assert (=> b!144865 (= lt!75967 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75966 () (_ BitVec 64))

(assert (=> b!144865 (= lt!75966 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75980 () Unit!4581)

(assert (=> b!144865 (= lt!75980 (addApplyDifferent!99 lt!75965 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) lt!75966))))

(assert (=> b!144865 (= (apply!123 (+!170 lt!75965 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!75966) (apply!123 lt!75965 lt!75966))))

(declare-fun lt!75974 () Unit!4581)

(assert (=> b!144865 (= lt!75974 lt!75980)))

(declare-fun lt!75964 () ListLongMap!1725)

(assert (=> b!144865 (= lt!75964 (getCurrentListMapNoExtraKeys!135 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun lt!75981 () (_ BitVec 64))

(assert (=> b!144865 (= lt!75981 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75977 () (_ BitVec 64))

(assert (=> b!144865 (= lt!75977 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!144865 (= lt!75975 (addApplyDifferent!99 lt!75964 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992))) lt!75977))))

(assert (=> b!144865 (= (apply!123 (+!170 lt!75964 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!75977) (apply!123 lt!75964 lt!75977))))

(declare-fun b!144866 () Bool)

(declare-fun res!68938 () Bool)

(declare-fun e!94406 () Bool)

(assert (=> b!144866 (=> (not res!68938) (not e!94406))))

(declare-fun e!94407 () Bool)

(assert (=> b!144866 (= res!68938 e!94407)))

(declare-fun res!68943 () Bool)

(assert (=> b!144866 (=> res!68943 e!94407)))

(declare-fun e!94408 () Bool)

(assert (=> b!144866 (= res!68943 (not e!94408))))

(declare-fun res!68941 () Bool)

(assert (=> b!144866 (=> (not res!68941) (not e!94408))))

(assert (=> b!144866 (= res!68941 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(declare-fun b!144867 () Bool)

(declare-fun e!94397 () ListLongMap!1725)

(assert (=> b!144867 (= e!94397 call!16115)))

(declare-fun b!144868 () Bool)

(declare-fun Unit!4585 () Unit!4581)

(assert (=> b!144868 (= e!94405 Unit!4585)))

(declare-fun b!144869 () Bool)

(declare-fun e!94402 () Bool)

(declare-fun e!94400 () Bool)

(assert (=> b!144869 (= e!94402 e!94400)))

(declare-fun res!68944 () Bool)

(declare-fun call!16112 () Bool)

(assert (=> b!144869 (= res!68944 call!16112)))

(assert (=> b!144869 (=> (not res!68944) (not e!94400))))

(declare-fun b!144870 () Bool)

(declare-fun e!94404 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!144870 (= e!94404 (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!16106 () Bool)

(declare-fun call!16111 () ListLongMap!1725)

(declare-fun call!16109 () ListLongMap!1725)

(assert (=> bm!16106 (= call!16111 call!16109)))

(declare-fun b!144871 () Bool)

(declare-fun lt!75968 () ListLongMap!1725)

(assert (=> b!144871 (= e!94400 (= (apply!123 lt!75968 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun b!144872 () Bool)

(declare-fun e!94409 () ListLongMap!1725)

(assert (=> b!144872 (= e!94409 e!94397)))

(declare-fun c!27451 () Bool)

(assert (=> b!144872 (= c!27451 (and (not (= (bvand (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144873 () Bool)

(assert (=> b!144873 (= e!94408 (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144874 () Bool)

(declare-fun e!94398 () Bool)

(declare-fun call!16113 () Bool)

(assert (=> b!144874 (= e!94398 (not call!16113))))

(declare-fun b!144875 () Bool)

(declare-fun e!94401 () Bool)

(assert (=> b!144875 (= e!94407 e!94401)))

(declare-fun res!68939 () Bool)

(assert (=> b!144875 (=> (not res!68939) (not e!94401))))

(assert (=> b!144875 (= res!68939 (contains!924 lt!75968 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144875 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(declare-fun b!144876 () Bool)

(declare-fun res!68942 () Bool)

(assert (=> b!144876 (=> (not res!68942) (not e!94406))))

(assert (=> b!144876 (= res!68942 e!94402)))

(declare-fun c!27455 () Bool)

(assert (=> b!144876 (= c!27455 (not (= (bvand (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!46127 () Bool)

(assert (=> d!46127 e!94406))

(declare-fun res!68937 () Bool)

(assert (=> d!46127 (=> (not res!68937) (not e!94406))))

(assert (=> d!46127 (= res!68937 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))))

(declare-fun lt!75979 () ListLongMap!1725)

(assert (=> d!46127 (= lt!75968 lt!75979)))

(declare-fun lt!75970 () Unit!4581)

(assert (=> d!46127 (= lt!75970 e!94405)))

(declare-fun c!27452 () Bool)

(assert (=> d!46127 (= c!27452 e!94404)))

(declare-fun res!68940 () Bool)

(assert (=> d!46127 (=> (not res!68940) (not e!94404))))

(assert (=> d!46127 (= res!68940 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(assert (=> d!46127 (= lt!75979 e!94409)))

(declare-fun c!27456 () Bool)

(assert (=> d!46127 (= c!27456 (and (not (= (bvand (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!46127 (validMask!0 (mask!7351 (v!3314 (underlying!485 thiss!992))))))

(assert (=> d!46127 (= (getCurrentListMap!537 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))) lt!75968)))

(declare-fun b!144877 () Bool)

(declare-fun call!16110 () ListLongMap!1725)

(assert (=> b!144877 (= e!94409 (+!170 call!16110 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))))

(declare-fun b!144878 () Bool)

(assert (=> b!144878 (= e!94402 (not call!16112))))

(declare-fun b!144879 () Bool)

(declare-fun e!94403 () Bool)

(assert (=> b!144879 (= e!94398 e!94403)))

(declare-fun res!68936 () Bool)

(assert (=> b!144879 (= res!68936 call!16113)))

(assert (=> b!144879 (=> (not res!68936) (not e!94403))))

(declare-fun b!144880 () Bool)

(assert (=> b!144880 (= e!94401 (= (apply!123 lt!75968 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144880 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2597 (_values!2971 (v!3314 (underlying!485 thiss!992))))))))

(assert (=> b!144880 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(declare-fun b!144881 () Bool)

(assert (=> b!144881 (= e!94399 call!16111)))

(declare-fun b!144882 () Bool)

(assert (=> b!144882 (= e!94403 (= (apply!123 lt!75968 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun bm!16107 () Bool)

(declare-fun call!16114 () ListLongMap!1725)

(assert (=> bm!16107 (= call!16114 (getCurrentListMapNoExtraKeys!135 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun bm!16108 () Bool)

(assert (=> bm!16108 (= call!16110 (+!170 (ite c!27456 call!16114 (ite c!27451 call!16109 call!16111)) (ite (or c!27456 c!27451) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(declare-fun bm!16109 () Bool)

(assert (=> bm!16109 (= call!16115 call!16110)))

(declare-fun bm!16110 () Bool)

(assert (=> bm!16110 (= call!16109 call!16114)))

(declare-fun b!144883 () Bool)

(assert (=> b!144883 (= e!94406 e!94398)))

(declare-fun c!27454 () Bool)

(assert (=> b!144883 (= c!27454 (not (= (bvand (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16111 () Bool)

(assert (=> bm!16111 (= call!16112 (contains!924 lt!75968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144884 () Bool)

(declare-fun c!27453 () Bool)

(assert (=> b!144884 (= c!27453 (and (not (= (bvand (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!144884 (= e!94397 e!94399)))

(declare-fun bm!16112 () Bool)

(assert (=> bm!16112 (= call!16113 (contains!924 lt!75968 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46127 c!27456) b!144877))

(assert (= (and d!46127 (not c!27456)) b!144872))

(assert (= (and b!144872 c!27451) b!144867))

(assert (= (and b!144872 (not c!27451)) b!144884))

(assert (= (and b!144884 c!27453) b!144864))

(assert (= (and b!144884 (not c!27453)) b!144881))

(assert (= (or b!144864 b!144881) bm!16106))

(assert (= (or b!144867 bm!16106) bm!16110))

(assert (= (or b!144867 b!144864) bm!16109))

(assert (= (or b!144877 bm!16110) bm!16107))

(assert (= (or b!144877 bm!16109) bm!16108))

(assert (= (and d!46127 res!68940) b!144870))

(assert (= (and d!46127 c!27452) b!144865))

(assert (= (and d!46127 (not c!27452)) b!144868))

(assert (= (and d!46127 res!68937) b!144866))

(assert (= (and b!144866 res!68941) b!144873))

(assert (= (and b!144866 (not res!68943)) b!144875))

(assert (= (and b!144875 res!68939) b!144880))

(assert (= (and b!144866 res!68938) b!144876))

(assert (= (and b!144876 c!27455) b!144869))

(assert (= (and b!144876 (not c!27455)) b!144878))

(assert (= (and b!144869 res!68944) b!144871))

(assert (= (or b!144869 b!144878) bm!16111))

(assert (= (and b!144876 res!68942) b!144883))

(assert (= (and b!144883 c!27454) b!144879))

(assert (= (and b!144883 (not c!27454)) b!144874))

(assert (= (and b!144879 res!68936) b!144882))

(assert (= (or b!144879 b!144874) bm!16112))

(declare-fun b_lambda!6489 () Bool)

(assert (=> (not b_lambda!6489) (not b!144880)))

(assert (=> b!144880 t!6383))

(declare-fun b_and!9017 () Bool)

(assert (= b_and!8997 (and (=> t!6383 result!4247) b_and!9017)))

(assert (=> b!144880 t!6385))

(declare-fun b_and!9019 () Bool)

(assert (= b_and!8999 (and (=> t!6385 result!4251) b_and!9019)))

(declare-fun m!174383 () Bool)

(assert (=> d!46127 m!174383))

(declare-fun m!174385 () Bool)

(assert (=> bm!16107 m!174385))

(declare-fun m!174387 () Bool)

(assert (=> bm!16112 m!174387))

(declare-fun m!174389 () Bool)

(assert (=> b!144877 m!174389))

(declare-fun m!174391 () Bool)

(assert (=> bm!16111 m!174391))

(declare-fun m!174393 () Bool)

(assert (=> bm!16108 m!174393))

(declare-fun m!174395 () Bool)

(assert (=> b!144871 m!174395))

(declare-fun m!174397 () Bool)

(assert (=> b!144880 m!174397))

(declare-fun m!174399 () Bool)

(assert (=> b!144880 m!174399))

(declare-fun m!174401 () Bool)

(assert (=> b!144880 m!174401))

(assert (=> b!144880 m!174399))

(assert (=> b!144880 m!174397))

(assert (=> b!144880 m!174249))

(declare-fun m!174403 () Bool)

(assert (=> b!144880 m!174403))

(assert (=> b!144880 m!174249))

(assert (=> b!144875 m!174399))

(assert (=> b!144875 m!174399))

(declare-fun m!174405 () Bool)

(assert (=> b!144875 m!174405))

(declare-fun m!174407 () Bool)

(assert (=> b!144882 m!174407))

(assert (=> b!144873 m!174399))

(assert (=> b!144873 m!174399))

(declare-fun m!174409 () Bool)

(assert (=> b!144873 m!174409))

(declare-fun m!174411 () Bool)

(assert (=> b!144865 m!174411))

(assert (=> b!144865 m!174385))

(assert (=> b!144865 m!174399))

(assert (=> b!144865 m!174411))

(declare-fun m!174413 () Bool)

(assert (=> b!144865 m!174413))

(declare-fun m!174415 () Bool)

(assert (=> b!144865 m!174415))

(declare-fun m!174417 () Bool)

(assert (=> b!144865 m!174417))

(declare-fun m!174419 () Bool)

(assert (=> b!144865 m!174419))

(declare-fun m!174421 () Bool)

(assert (=> b!144865 m!174421))

(declare-fun m!174423 () Bool)

(assert (=> b!144865 m!174423))

(declare-fun m!174425 () Bool)

(assert (=> b!144865 m!174425))

(assert (=> b!144865 m!174417))

(assert (=> b!144865 m!174415))

(declare-fun m!174427 () Bool)

(assert (=> b!144865 m!174427))

(assert (=> b!144865 m!174421))

(declare-fun m!174429 () Bool)

(assert (=> b!144865 m!174429))

(declare-fun m!174431 () Bool)

(assert (=> b!144865 m!174431))

(declare-fun m!174433 () Bool)

(assert (=> b!144865 m!174433))

(declare-fun m!174435 () Bool)

(assert (=> b!144865 m!174435))

(declare-fun m!174437 () Bool)

(assert (=> b!144865 m!174437))

(declare-fun m!174439 () Bool)

(assert (=> b!144865 m!174439))

(assert (=> b!144870 m!174399))

(assert (=> b!144870 m!174399))

(assert (=> b!144870 m!174409))

(assert (=> b!144689 d!46127))

(declare-fun d!46129 () Bool)

(declare-fun res!68949 () Bool)

(declare-fun e!94414 () Bool)

(assert (=> d!46129 (=> res!68949 e!94414)))

(assert (=> d!46129 (= res!68949 ((_ is Nil!1751) lt!75877))))

(assert (=> d!46129 (= (noDuplicate!55 lt!75877) e!94414)))

(declare-fun b!144889 () Bool)

(declare-fun e!94415 () Bool)

(assert (=> b!144889 (= e!94414 e!94415)))

(declare-fun res!68950 () Bool)

(assert (=> b!144889 (=> (not res!68950) (not e!94415))))

(assert (=> b!144889 (= res!68950 (not (contains!923 (t!6386 lt!75877) (h!2358 lt!75877))))))

(declare-fun b!144890 () Bool)

(assert (=> b!144890 (= e!94415 (noDuplicate!55 (t!6386 lt!75877)))))

(assert (= (and d!46129 (not res!68949)) b!144889))

(assert (= (and b!144889 res!68950) b!144890))

(declare-fun m!174441 () Bool)

(assert (=> b!144889 m!174441))

(declare-fun m!174443 () Bool)

(assert (=> b!144890 m!174443))

(assert (=> b!144680 d!46129))

(declare-fun b!144901 () Bool)

(declare-fun e!94426 () Bool)

(declare-fun call!16118 () Bool)

(assert (=> b!144901 (= e!94426 call!16118)))

(declare-fun d!46131 () Bool)

(declare-fun res!68957 () Bool)

(declare-fun e!94427 () Bool)

(assert (=> d!46131 (=> res!68957 e!94427)))

(assert (=> d!46131 (= res!68957 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(assert (=> d!46131 (= (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!75877) e!94427)))

(declare-fun b!144902 () Bool)

(assert (=> b!144902 (= e!94426 call!16118)))

(declare-fun e!94424 () Bool)

(declare-fun b!144903 () Bool)

(assert (=> b!144903 (= e!94424 (contains!923 lt!75877 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!16115 () Bool)

(declare-fun c!27459 () Bool)

(assert (=> bm!16115 (= call!16118 (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (ite c!27459 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75877) lt!75877)))))

(declare-fun b!144904 () Bool)

(declare-fun e!94425 () Bool)

(assert (=> b!144904 (= e!94425 e!94426)))

(assert (=> b!144904 (= c!27459 (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144905 () Bool)

(assert (=> b!144905 (= e!94427 e!94425)))

(declare-fun res!68959 () Bool)

(assert (=> b!144905 (=> (not res!68959) (not e!94425))))

(assert (=> b!144905 (= res!68959 (not e!94424))))

(declare-fun res!68958 () Bool)

(assert (=> b!144905 (=> (not res!68958) (not e!94424))))

(assert (=> b!144905 (= res!68958 (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!46131 (not res!68957)) b!144905))

(assert (= (and b!144905 res!68958) b!144903))

(assert (= (and b!144905 res!68959) b!144904))

(assert (= (and b!144904 c!27459) b!144901))

(assert (= (and b!144904 (not c!27459)) b!144902))

(assert (= (or b!144901 b!144902) bm!16115))

(assert (=> b!144903 m!174399))

(assert (=> b!144903 m!174399))

(declare-fun m!174445 () Bool)

(assert (=> b!144903 m!174445))

(assert (=> bm!16115 m!174399))

(declare-fun m!174447 () Bool)

(assert (=> bm!16115 m!174447))

(assert (=> b!144904 m!174399))

(assert (=> b!144904 m!174399))

(assert (=> b!144904 m!174409))

(assert (=> b!144905 m!174399))

(assert (=> b!144905 m!174399))

(assert (=> b!144905 m!174409))

(assert (=> b!144691 d!46131))

(declare-fun d!46133 () Bool)

(assert (=> d!46133 (= (array_inv!1485 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvsge (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!144677 d!46133))

(declare-fun d!46135 () Bool)

(assert (=> d!46135 (= (array_inv!1486 (_values!2971 (v!3314 (underlying!485 thiss!992)))) (bvsge (size!2597 (_values!2971 (v!3314 (underlying!485 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!144677 d!46135))

(declare-fun d!46137 () Bool)

(declare-fun lt!75985 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!141 (List!1754) (InoxSet (_ BitVec 64)))

(assert (=> d!46137 (= lt!75985 (select (content!141 lt!75877) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94432 () Bool)

(assert (=> d!46137 (= lt!75985 e!94432)))

(declare-fun res!68965 () Bool)

(assert (=> d!46137 (=> (not res!68965) (not e!94432))))

(assert (=> d!46137 (= res!68965 ((_ is Cons!1750) lt!75877))))

(assert (=> d!46137 (= (contains!923 lt!75877 #b0000000000000000000000000000000000000000000000000000000000000000) lt!75985)))

(declare-fun b!144910 () Bool)

(declare-fun e!94433 () Bool)

(assert (=> b!144910 (= e!94432 e!94433)))

(declare-fun res!68964 () Bool)

(assert (=> b!144910 (=> res!68964 e!94433)))

(assert (=> b!144910 (= res!68964 (= (h!2358 lt!75877) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144911 () Bool)

(assert (=> b!144911 (= e!94433 (contains!923 (t!6386 lt!75877) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46137 res!68965) b!144910))

(assert (= (and b!144910 (not res!68964)) b!144911))

(declare-fun m!174449 () Bool)

(assert (=> d!46137 m!174449))

(declare-fun m!174451 () Bool)

(assert (=> d!46137 m!174451))

(declare-fun m!174453 () Bool)

(assert (=> b!144911 m!174453))

(assert (=> b!144692 d!46137))

(declare-fun d!46139 () Bool)

(declare-fun res!68972 () Bool)

(declare-fun e!94436 () Bool)

(assert (=> d!46139 (=> (not res!68972) (not e!94436))))

(declare-fun simpleValid!99 (LongMapFixedSize!1168) Bool)

(assert (=> d!46139 (= res!68972 (simpleValid!99 newMap!16))))

(assert (=> d!46139 (= (valid!570 newMap!16) e!94436)))

(declare-fun b!144918 () Bool)

(declare-fun res!68973 () Bool)

(assert (=> b!144918 (=> (not res!68973) (not e!94436))))

(declare-fun arrayCountValidKeys!0 (array!4915 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!144918 (= res!68973 (= (arrayCountValidKeys!0 (_keys!4754 newMap!16) #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))) (_size!633 newMap!16)))))

(declare-fun b!144919 () Bool)

(declare-fun res!68974 () Bool)

(assert (=> b!144919 (=> (not res!68974) (not e!94436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4915 (_ BitVec 32)) Bool)

(assert (=> b!144919 (= res!68974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4754 newMap!16) (mask!7351 newMap!16)))))

(declare-fun b!144920 () Bool)

(assert (=> b!144920 (= e!94436 (arrayNoDuplicates!0 (_keys!4754 newMap!16) #b00000000000000000000000000000000 Nil!1751))))

(assert (= (and d!46139 res!68972) b!144918))

(assert (= (and b!144918 res!68973) b!144919))

(assert (= (and b!144919 res!68974) b!144920))

(declare-fun m!174455 () Bool)

(assert (=> d!46139 m!174455))

(declare-fun m!174457 () Bool)

(assert (=> b!144918 m!174457))

(declare-fun m!174459 () Bool)

(assert (=> b!144919 m!174459))

(declare-fun m!174461 () Bool)

(assert (=> b!144920 m!174461))

(assert (=> b!144687 d!46139))

(declare-fun d!46141 () Bool)

(assert (=> d!46141 (= (valid!571 thiss!992) (valid!570 (v!3314 (underlying!485 thiss!992))))))

(declare-fun bs!6091 () Bool)

(assert (= bs!6091 d!46141))

(declare-fun m!174463 () Bool)

(assert (=> bs!6091 m!174463))

(assert (=> start!15066 d!46141))

(declare-fun b!144921 () Bool)

(declare-fun e!94439 () Bool)

(declare-fun call!16119 () Bool)

(assert (=> b!144921 (= e!94439 call!16119)))

(declare-fun d!46143 () Bool)

(declare-fun res!68975 () Bool)

(declare-fun e!94440 () Bool)

(assert (=> d!46143 (=> res!68975 e!94440)))

(assert (=> d!46143 (= res!68975 (bvsge from!355 (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(assert (=> d!46143 (= (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) from!355 Nil!1751) e!94440)))

(declare-fun b!144922 () Bool)

(assert (=> b!144922 (= e!94439 call!16119)))

(declare-fun b!144923 () Bool)

(declare-fun e!94437 () Bool)

(assert (=> b!144923 (= e!94437 (contains!923 Nil!1751 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun c!27460 () Bool)

(declare-fun bm!16116 () Bool)

(assert (=> bm!16116 (= call!16119 (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27460 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) Nil!1751) Nil!1751)))))

(declare-fun b!144924 () Bool)

(declare-fun e!94438 () Bool)

(assert (=> b!144924 (= e!94438 e!94439)))

(assert (=> b!144924 (= c!27460 (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144925 () Bool)

(assert (=> b!144925 (= e!94440 e!94438)))

(declare-fun res!68977 () Bool)

(assert (=> b!144925 (=> (not res!68977) (not e!94438))))

(assert (=> b!144925 (= res!68977 (not e!94437))))

(declare-fun res!68976 () Bool)

(assert (=> b!144925 (=> (not res!68976) (not e!94437))))

(assert (=> b!144925 (= res!68976 (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (= (and d!46143 (not res!68975)) b!144925))

(assert (= (and b!144925 res!68976) b!144923))

(assert (= (and b!144925 res!68977) b!144924))

(assert (= (and b!144924 c!27460) b!144921))

(assert (= (and b!144924 (not c!27460)) b!144922))

(assert (= (or b!144921 b!144922) bm!16116))

(assert (=> b!144923 m!174253))

(assert (=> b!144923 m!174253))

(declare-fun m!174465 () Bool)

(assert (=> b!144923 m!174465))

(assert (=> bm!16116 m!174253))

(declare-fun m!174467 () Bool)

(assert (=> bm!16116 m!174467))

(assert (=> b!144924 m!174253))

(assert (=> b!144924 m!174253))

(declare-fun m!174469 () Bool)

(assert (=> b!144924 m!174469))

(assert (=> b!144925 m!174253))

(assert (=> b!144925 m!174253))

(assert (=> b!144925 m!174469))

(assert (=> b!144683 d!46143))

(declare-fun d!46145 () Bool)

(assert (=> d!46145 (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) from!355 Nil!1751)))

(declare-fun lt!75988 () Unit!4581)

(declare-fun choose!39 (array!4915 (_ BitVec 32) (_ BitVec 32)) Unit!4581)

(assert (=> d!46145 (= lt!75988 (choose!39 (_keys!4754 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!46145 (bvslt (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!46145 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000000 from!355) lt!75988)))

(declare-fun bs!6092 () Bool)

(assert (= bs!6092 d!46145))

(assert (=> bs!6092 m!174265))

(declare-fun m!174471 () Bool)

(assert (=> bs!6092 m!174471))

(assert (=> b!144683 d!46145))

(declare-fun d!46147 () Bool)

(declare-fun res!68982 () Bool)

(declare-fun e!94445 () Bool)

(assert (=> d!46147 (=> res!68982 e!94445)))

(assert (=> d!46147 (= res!68982 (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46147 (= (arrayContainsKey!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!94445)))

(declare-fun b!144930 () Bool)

(declare-fun e!94446 () Bool)

(assert (=> b!144930 (= e!94445 e!94446)))

(declare-fun res!68983 () Bool)

(assert (=> b!144930 (=> (not res!68983) (not e!94446))))

(assert (=> b!144930 (= res!68983 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(declare-fun b!144931 () Bool)

(assert (=> b!144931 (= e!94446 (arrayContainsKey!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!46147 (not res!68982)) b!144930))

(assert (= (and b!144930 res!68983) b!144931))

(assert (=> d!46147 m!174399))

(assert (=> b!144931 m!174253))

(declare-fun m!174473 () Bool)

(assert (=> b!144931 m!174473))

(assert (=> b!144683 d!46147))

(declare-fun d!46149 () Bool)

(declare-fun e!94449 () Bool)

(assert (=> d!46149 e!94449))

(declare-fun c!27463 () Bool)

(assert (=> d!46149 (= c!27463 (and (not (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!75991 () Unit!4581)

(declare-fun choose!896 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) (_ BitVec 32) Int) Unit!4581)

(assert (=> d!46149 (= lt!75991 (choose!896 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))))))

(assert (=> d!46149 (validMask!0 (mask!7351 (v!3314 (underlying!485 thiss!992))))))

(assert (=> d!46149 (= (lemmaListMapContainsThenArrayContainsFrom!151 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))) lt!75991)))

(declare-fun b!144936 () Bool)

(assert (=> b!144936 (= e!94449 (arrayContainsKey!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!144937 () Bool)

(assert (=> b!144937 (= e!94449 (ite (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46149 c!27463) b!144936))

(assert (= (and d!46149 (not c!27463)) b!144937))

(assert (=> d!46149 m!174253))

(declare-fun m!174475 () Bool)

(assert (=> d!46149 m!174475))

(assert (=> d!46149 m!174383))

(assert (=> b!144936 m!174253))

(assert (=> b!144936 m!174269))

(assert (=> b!144683 d!46149))

(declare-fun d!46151 () Bool)

(assert (=> d!46151 (= (array_inv!1485 (_keys!4754 newMap!16)) (bvsge (size!2596 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144678 d!46151))

(declare-fun d!46153 () Bool)

(assert (=> d!46153 (= (array_inv!1486 (_values!2971 newMap!16)) (bvsge (size!2597 (_values!2971 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144678 d!46153))

(declare-fun d!46155 () Bool)

(declare-fun e!94455 () Bool)

(assert (=> d!46155 e!94455))

(declare-fun res!68986 () Bool)

(assert (=> d!46155 (=> res!68986 e!94455)))

(declare-fun lt!76001 () Bool)

(assert (=> d!46155 (= res!68986 (not lt!76001))))

(declare-fun lt!76000 () Bool)

(assert (=> d!46155 (= lt!76001 lt!76000)))

(declare-fun lt!76003 () Unit!4581)

(declare-fun e!94454 () Unit!4581)

(assert (=> d!46155 (= lt!76003 e!94454)))

(declare-fun c!27466 () Bool)

(assert (=> d!46155 (= c!27466 lt!76000)))

(declare-fun containsKey!181 (List!1755 (_ BitVec 64)) Bool)

(assert (=> d!46155 (= lt!76000 (containsKey!181 (toList!878 lt!75876) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46155 (= (contains!924 lt!75876 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) lt!76001)))

(declare-fun b!144944 () Bool)

(declare-fun lt!76002 () Unit!4581)

(assert (=> b!144944 (= e!94454 lt!76002)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!130 (List!1755 (_ BitVec 64)) Unit!4581)

(assert (=> b!144944 (= lt!76002 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!878 lt!75876) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-datatypes ((Option!183 0))(
  ( (Some!182 (v!3321 V!3577)) (None!181) )
))
(declare-fun isDefined!131 (Option!183) Bool)

(declare-fun getValueByKey!177 (List!1755 (_ BitVec 64)) Option!183)

(assert (=> b!144944 (isDefined!131 (getValueByKey!177 (toList!878 lt!75876) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!144945 () Bool)

(declare-fun Unit!4586 () Unit!4581)

(assert (=> b!144945 (= e!94454 Unit!4586)))

(declare-fun b!144946 () Bool)

(assert (=> b!144946 (= e!94455 (isDefined!131 (getValueByKey!177 (toList!878 lt!75876) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355))))))

(assert (= (and d!46155 c!27466) b!144944))

(assert (= (and d!46155 (not c!27466)) b!144945))

(assert (= (and d!46155 (not res!68986)) b!144946))

(assert (=> d!46155 m!174253))

(declare-fun m!174477 () Bool)

(assert (=> d!46155 m!174477))

(assert (=> b!144944 m!174253))

(declare-fun m!174479 () Bool)

(assert (=> b!144944 m!174479))

(assert (=> b!144944 m!174253))

(declare-fun m!174481 () Bool)

(assert (=> b!144944 m!174481))

(assert (=> b!144944 m!174481))

(declare-fun m!174483 () Bool)

(assert (=> b!144944 m!174483))

(assert (=> b!144946 m!174253))

(assert (=> b!144946 m!174481))

(assert (=> b!144946 m!174481))

(assert (=> b!144946 m!174483))

(assert (=> b!144693 d!46155))

(declare-fun b!145031 () Bool)

(declare-fun e!94507 () Bool)

(declare-fun e!94511 () Bool)

(assert (=> b!145031 (= e!94507 e!94511)))

(declare-fun c!27498 () Bool)

(declare-fun lt!76072 () tuple2!2686)

(assert (=> b!145031 (= c!27498 (_1!1354 lt!76072))))

(declare-fun b!145032 () Bool)

(declare-fun res!69018 () Bool)

(declare-fun call!16174 () Bool)

(assert (=> b!145032 (= res!69018 call!16174)))

(declare-fun e!94517 () Bool)

(assert (=> b!145032 (=> (not res!69018) (not e!94517))))

(declare-fun b!145033 () Bool)

(declare-fun e!94519 () Unit!4581)

(declare-fun lt!76082 () Unit!4581)

(assert (=> b!145033 (= e!94519 lt!76082)))

(declare-fun call!16186 () Unit!4581)

(assert (=> b!145033 (= lt!76082 call!16186)))

(declare-datatypes ((SeekEntryResult!285 0))(
  ( (MissingZero!285 (index!3306 (_ BitVec 32))) (Found!285 (index!3307 (_ BitVec 32))) (Intermediate!285 (undefined!1097 Bool) (index!3308 (_ BitVec 32)) (x!16516 (_ BitVec 32))) (Undefined!285) (MissingVacant!285 (index!3309 (_ BitVec 32))) )
))
(declare-fun lt!76058 () SeekEntryResult!285)

(declare-fun call!16177 () SeekEntryResult!285)

(assert (=> b!145033 (= lt!76058 call!16177)))

(declare-fun res!69022 () Bool)

(assert (=> b!145033 (= res!69022 ((_ is Found!285) lt!76058))))

(declare-fun e!94500 () Bool)

(assert (=> b!145033 (=> (not res!69022) (not e!94500))))

(assert (=> b!145033 e!94500))

(declare-fun call!16171 () SeekEntryResult!285)

(declare-fun bm!16165 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4915 (_ BitVec 32)) SeekEntryResult!285)

(assert (=> bm!16165 (= call!16171 (seekEntryOrOpen!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (_keys!4754 newMap!16) (mask!7351 newMap!16)))))

(declare-fun b!145034 () Bool)

(declare-fun e!94505 () Unit!4581)

(declare-fun lt!76073 () Unit!4581)

(assert (=> b!145034 (= e!94505 lt!76073)))

(declare-fun call!16182 () Unit!4581)

(assert (=> b!145034 (= lt!76073 call!16182)))

(declare-fun lt!76069 () SeekEntryResult!285)

(declare-fun call!16173 () SeekEntryResult!285)

(assert (=> b!145034 (= lt!76069 call!16173)))

(declare-fun c!27506 () Bool)

(assert (=> b!145034 (= c!27506 ((_ is MissingZero!285) lt!76069))))

(declare-fun e!94510 () Bool)

(assert (=> b!145034 e!94510))

(declare-fun bm!16166 () Bool)

(declare-fun call!16190 () Bool)

(declare-fun call!16178 () Bool)

(assert (=> bm!16166 (= call!16190 call!16178)))

(declare-fun b!145035 () Bool)

(declare-fun e!94508 () tuple2!2686)

(declare-fun e!94509 () tuple2!2686)

(assert (=> b!145035 (= e!94508 e!94509)))

(declare-fun c!27500 () Bool)

(declare-fun lt!76060 () SeekEntryResult!285)

(assert (=> b!145035 (= c!27500 ((_ is MissingZero!285) lt!76060))))

(declare-fun b!145036 () Bool)

(declare-fun lt!76076 () Unit!4581)

(assert (=> b!145036 (= lt!76076 e!94505)))

(declare-fun c!27503 () Bool)

(declare-fun call!16172 () Bool)

(assert (=> b!145036 (= c!27503 call!16172)))

(declare-fun e!94521 () tuple2!2686)

(assert (=> b!145036 (= e!94521 (tuple2!2687 false newMap!16))))

(declare-fun bm!16167 () Bool)

(declare-fun call!16187 () Bool)

(assert (=> bm!16167 (= call!16187 call!16174)))

(declare-fun bm!16168 () Bool)

(declare-fun call!16191 () ListLongMap!1725)

(declare-fun call!16184 () ListLongMap!1725)

(assert (=> bm!16168 (= call!16191 call!16184)))

(declare-fun bm!16169 () Bool)

(declare-fun c!27499 () Bool)

(declare-fun c!27495 () Bool)

(assert (=> bm!16169 (= c!27499 c!27495)))

(declare-fun e!94516 () ListLongMap!1725)

(assert (=> bm!16169 (= call!16172 (contains!924 e!94516 (ite c!27495 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (select (arr!2320 (_keys!4754 newMap!16)) (index!3307 lt!76060)))))))

(declare-fun bm!16170 () Bool)

(declare-fun call!16188 () ListLongMap!1725)

(assert (=> bm!16170 (= call!16188 (map!1433 newMap!16))))

(declare-fun bm!16171 () Bool)

(declare-fun call!16180 () ListLongMap!1725)

(declare-fun call!16175 () ListLongMap!1725)

(assert (=> bm!16171 (= call!16180 call!16175)))

(declare-fun b!145037 () Bool)

(declare-fun lt!76062 () tuple2!2686)

(assert (=> b!145037 (= e!94508 (tuple2!2687 (_1!1354 lt!76062) (_2!1354 lt!76062)))))

(declare-fun call!16176 () tuple2!2686)

(assert (=> b!145037 (= lt!76062 call!16176)))

(declare-fun bm!16172 () Bool)

(declare-fun call!16181 () Bool)

(declare-fun call!16169 () Bool)

(assert (=> bm!16172 (= call!16181 call!16169)))

(declare-fun lt!76067 () SeekEntryResult!285)

(declare-fun b!145038 () Bool)

(assert (=> b!145038 (= e!94517 (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3307 lt!76067)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!145039 () Bool)

(declare-fun e!94514 () Bool)

(assert (=> b!145039 (= e!94514 (not call!16181))))

(declare-fun b!145040 () Bool)

(declare-fun e!94518 () Bool)

(declare-fun call!16168 () Bool)

(assert (=> b!145040 (= e!94518 (not call!16168))))

(declare-fun bm!16173 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!68 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) Int) Unit!4581)

(assert (=> bm!16173 (= call!16182 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!68 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)))))

(declare-fun bm!16174 () Bool)

(declare-fun call!16170 () ListLongMap!1725)

(assert (=> bm!16174 (= call!16170 (map!1433 (_2!1354 lt!76072)))))

(declare-fun b!145041 () Bool)

(declare-fun c!27497 () Bool)

(declare-fun lt!76083 () SeekEntryResult!285)

(assert (=> b!145041 (= c!27497 ((_ is MissingVacant!285) lt!76083))))

(declare-fun e!94503 () Bool)

(declare-fun e!94502 () Bool)

(assert (=> b!145041 (= e!94503 e!94502)))

(declare-fun b!145042 () Bool)

(declare-fun Unit!4587 () Unit!4581)

(assert (=> b!145042 (= e!94519 Unit!4587)))

(declare-fun lt!76078 () Unit!4581)

(assert (=> b!145042 (= lt!76078 call!16182)))

(assert (=> b!145042 (= lt!76083 call!16177)))

(declare-fun c!27504 () Bool)

(assert (=> b!145042 (= c!27504 ((_ is MissingZero!285) lt!76083))))

(assert (=> b!145042 e!94503))

(declare-fun lt!76061 () Unit!4581)

(assert (=> b!145042 (= lt!76061 lt!76078)))

(assert (=> b!145042 false))

(declare-fun bm!16175 () Bool)

(assert (=> bm!16175 (= call!16173 call!16171)))

(declare-fun e!94501 () ListLongMap!1725)

(declare-fun c!27496 () Bool)

(declare-fun bm!16176 () Bool)

(declare-fun c!27501 () Bool)

(assert (=> bm!16176 (= call!16175 (+!170 e!94501 (ite c!27501 (ite c!27496 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!27505 () Bool)

(assert (=> bm!16176 (= c!27505 c!27501)))

(declare-fun b!145043 () Bool)

(declare-fun lt!76064 () Unit!4581)

(declare-fun lt!76075 () Unit!4581)

(assert (=> b!145043 (= lt!76064 lt!76075)))

(declare-fun call!16185 () ListLongMap!1725)

(assert (=> b!145043 (= call!16180 call!16185)))

(declare-fun lt!76074 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!68 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 V!3577 Int) Unit!4581)

(assert (=> b!145043 (= lt!76075 (lemmaChangeZeroKeyThenAddPairToListMap!68 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) lt!76074 (zeroValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2834 newMap!16) (defaultEntry!2988 newMap!16)))))

(assert (=> b!145043 (= lt!76074 (bvor (extraKeys!2735 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!94515 () tuple2!2686)

(assert (=> b!145043 (= e!94515 (tuple2!2687 true (LongMapFixedSize!1169 (defaultEntry!2988 newMap!16) (mask!7351 newMap!16) (bvor (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2834 newMap!16) (_size!633 newMap!16) (_keys!4754 newMap!16) (_values!2971 newMap!16) (_vacant!633 newMap!16))))))

(declare-fun c!27507 () Bool)

(declare-fun call!16189 () Bool)

(declare-fun bm!16177 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!16177 (= call!16189 (inRange!0 (ite c!27495 (ite c!27503 (index!3307 lt!76067) (ite c!27506 (index!3306 lt!76069) (index!3309 lt!76069))) (ite c!27507 (index!3307 lt!76058) (ite c!27504 (index!3306 lt!76083) (index!3309 lt!76083)))) (mask!7351 newMap!16)))))

(declare-fun b!145044 () Bool)

(declare-fun call!16183 () ListLongMap!1725)

(assert (=> b!145044 (= e!94516 call!16183)))

(declare-fun b!145045 () Bool)

(declare-fun c!27508 () Bool)

(assert (=> b!145045 (= c!27508 ((_ is MissingVacant!285) lt!76069))))

(declare-fun e!94506 () Bool)

(assert (=> b!145045 (= e!94510 e!94506)))

(declare-fun bm!16178 () Bool)

(assert (=> bm!16178 (= call!16178 call!16189)))

(declare-fun b!145046 () Bool)

(assert (=> b!145046 (= e!94511 (= call!16170 call!16188))))

(declare-fun b!145047 () Bool)

(declare-fun e!94513 () Bool)

(assert (=> b!145047 (= e!94502 e!94513)))

(declare-fun res!69019 () Bool)

(assert (=> b!145047 (= res!69019 call!16190)))

(assert (=> b!145047 (=> (not res!69019) (not e!94513))))

(declare-fun bm!16179 () Bool)

(declare-fun c!27502 () Bool)

(declare-fun updateHelperNewKey!68 (LongMapFixedSize!1168 (_ BitVec 64) V!3577 (_ BitVec 32)) tuple2!2686)

(assert (=> bm!16179 (= call!16176 (updateHelperNewKey!68 newMap!16 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060))))))

(declare-fun d!46157 () Bool)

(assert (=> d!46157 e!94507))

(declare-fun res!69027 () Bool)

(assert (=> d!46157 (=> (not res!69027) (not e!94507))))

(assert (=> d!46157 (= res!69027 (valid!570 (_2!1354 lt!76072)))))

(declare-fun e!94504 () tuple2!2686)

(assert (=> d!46157 (= lt!76072 e!94504)))

(assert (=> d!46157 (= c!27501 (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvneg (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355))))))

(assert (=> d!46157 (valid!570 newMap!16)))

(assert (=> d!46157 (= (update!215 newMap!16 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!76072)))

(declare-fun b!145048 () Bool)

(declare-fun res!69025 () Bool)

(assert (=> b!145048 (=> (not res!69025) (not e!94514))))

(assert (=> b!145048 (= res!69025 call!16190)))

(assert (=> b!145048 (= e!94503 e!94514)))

(declare-fun bm!16180 () Bool)

(assert (=> bm!16180 (= call!16168 call!16169)))

(declare-fun b!145049 () Bool)

(assert (=> b!145049 (= e!94504 e!94515)))

(assert (=> b!145049 (= c!27496 (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145050 () Bool)

(declare-fun lt!76068 () Unit!4581)

(declare-fun lt!76079 () Unit!4581)

(assert (=> b!145050 (= lt!76068 lt!76079)))

(assert (=> b!145050 call!16172))

(declare-fun lt!76081 () array!4917)

(declare-fun lemmaValidKeyInArrayIsInListMap!127 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) Int) Unit!4581)

(assert (=> b!145050 (= lt!76079 (lemmaValidKeyInArrayIsInListMap!127 (_keys!4754 newMap!16) lt!76081 (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (index!3307 lt!76060) (defaultEntry!2988 newMap!16)))))

(assert (=> b!145050 (= lt!76081 (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (index!3307 lt!76060) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16))))))

(declare-fun lt!76084 () Unit!4581)

(declare-fun lt!76070 () Unit!4581)

(assert (=> b!145050 (= lt!76084 lt!76070)))

(assert (=> b!145050 (= call!16175 call!16183)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!68 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) (_ BitVec 64) V!3577 Int) Unit!4581)

(assert (=> b!145050 (= lt!76070 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!68 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (index!3307 lt!76060) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76063 () Unit!4581)

(assert (=> b!145050 (= lt!76063 e!94519)))

(assert (=> b!145050 (= c!27507 (contains!924 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!145050 (= e!94509 (tuple2!2687 true (LongMapFixedSize!1169 (defaultEntry!2988 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (_size!633 newMap!16) (_keys!4754 newMap!16) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (index!3307 lt!76060) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16))) (_vacant!633 newMap!16))))))

(declare-fun b!145051 () Bool)

(declare-fun res!69020 () Bool)

(assert (=> b!145051 (= res!69020 (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3309 lt!76083)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145051 (=> (not res!69020) (not e!94513))))

(declare-fun b!145052 () Bool)

(assert (=> b!145052 (= e!94500 (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3307 lt!76058)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun bm!16181 () Bool)

(declare-fun call!16179 () ListLongMap!1725)

(assert (=> bm!16181 (= call!16185 call!16179)))

(declare-fun b!145053 () Bool)

(declare-fun res!69024 () Bool)

(declare-fun e!94512 () Bool)

(assert (=> b!145053 (=> (not res!69024) (not e!94512))))

(assert (=> b!145053 (= res!69024 (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3306 lt!76069)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145054 () Bool)

(declare-fun res!69016 () Bool)

(assert (=> b!145054 (=> (not res!69016) (not e!94512))))

(assert (=> b!145054 (= res!69016 call!16187)))

(assert (=> b!145054 (= e!94510 e!94512)))

(declare-fun b!145055 () Bool)

(assert (=> b!145055 (= e!94506 ((_ is Undefined!285) lt!76069))))

(declare-fun b!145056 () Bool)

(assert (=> b!145056 (= e!94513 (not call!16181))))

(declare-fun bm!16182 () Bool)

(assert (=> bm!16182 (= call!16174 call!16189)))

(declare-fun b!145057 () Bool)

(assert (=> b!145057 (= e!94506 e!94518)))

(declare-fun res!69026 () Bool)

(assert (=> b!145057 (= res!69026 call!16187)))

(assert (=> b!145057 (=> (not res!69026) (not e!94518))))

(declare-fun b!145058 () Bool)

(declare-fun e!94520 () Bool)

(assert (=> b!145058 (= e!94511 e!94520)))

(declare-fun res!69028 () Bool)

(assert (=> b!145058 (= res!69028 (contains!924 call!16170 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!145058 (=> (not res!69028) (not e!94520))))

(declare-fun b!145059 () Bool)

(declare-fun lt!76077 () Unit!4581)

(declare-fun lt!76080 () Unit!4581)

(assert (=> b!145059 (= lt!76077 lt!76080)))

(assert (=> b!145059 (= call!16180 call!16191)))

(declare-fun lt!76065 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!68 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 V!3577 Int) Unit!4581)

(assert (=> b!145059 (= lt!76080 (lemmaChangeLongMinValueKeyThenAddPairToListMap!68 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) lt!76065 (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)))))

(assert (=> b!145059 (= lt!76065 (bvor (extraKeys!2735 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!145059 (= e!94515 (tuple2!2687 true (LongMapFixedSize!1169 (defaultEntry!2988 newMap!16) (mask!7351 newMap!16) (bvor (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) (zeroValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!633 newMap!16) (_keys!4754 newMap!16) (_values!2971 newMap!16) (_vacant!633 newMap!16))))))

(declare-fun bm!16183 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!68 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) Int) Unit!4581)

(assert (=> bm!16183 (= call!16186 (lemmaInListMapThenSeekEntryOrOpenFindsIt!68 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)))))

(declare-fun b!145060 () Bool)

(assert (=> b!145060 (= e!94501 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun bm!16184 () Bool)

(assert (=> bm!16184 (= call!16183 call!16179)))

(declare-fun bm!16185 () Bool)

(assert (=> bm!16185 (= call!16184 (getCurrentListMap!537 (_keys!4754 newMap!16) (ite c!27501 (_values!2971 newMap!16) lt!76081) (mask!7351 newMap!16) (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) (zeroValue!2834 newMap!16) (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun b!145061 () Bool)

(assert (=> b!145061 (= e!94502 ((_ is Undefined!285) lt!76083))))

(declare-fun bm!16186 () Bool)

(assert (=> bm!16186 (= call!16177 call!16171)))

(declare-fun b!145062 () Bool)

(assert (=> b!145062 (= c!27502 ((_ is MissingVacant!285) lt!76060))))

(assert (=> b!145062 (= e!94521 e!94508)))

(declare-fun b!145063 () Bool)

(assert (=> b!145063 (= e!94516 call!16184)))

(declare-fun bm!16187 () Bool)

(assert (=> bm!16187 (= call!16169 (arrayContainsKey!0 (_keys!4754 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!145064 () Bool)

(declare-fun res!69015 () Bool)

(assert (=> b!145064 (=> (not res!69015) (not e!94514))))

(assert (=> b!145064 (= res!69015 (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3306 lt!76083)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145065 () Bool)

(declare-fun res!69017 () Bool)

(assert (=> b!145065 (= res!69017 call!16178)))

(assert (=> b!145065 (=> (not res!69017) (not e!94500))))

(declare-fun b!145066 () Bool)

(assert (=> b!145066 (= e!94504 e!94521)))

(assert (=> b!145066 (= lt!76060 (seekEntryOrOpen!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (_keys!4754 newMap!16) (mask!7351 newMap!16)))))

(assert (=> b!145066 (= c!27495 ((_ is Undefined!285) lt!76060))))

(declare-fun b!145067 () Bool)

(declare-fun res!69021 () Bool)

(assert (=> b!145067 (= res!69021 (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3309 lt!76069)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145067 (=> (not res!69021) (not e!94518))))

(declare-fun b!145068 () Bool)

(assert (=> b!145068 (= e!94512 (not call!16168))))

(declare-fun bm!16188 () Bool)

(assert (=> bm!16188 (= call!16179 (getCurrentListMap!537 (_keys!4754 newMap!16) (ite (or c!27501 c!27495) (_values!2971 newMap!16) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (index!3307 lt!76060) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16)))) (mask!7351 newMap!16) (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun b!145069 () Bool)

(declare-fun lt!76071 () tuple2!2686)

(assert (=> b!145069 (= lt!76071 call!16176)))

(assert (=> b!145069 (= e!94509 (tuple2!2687 (_1!1354 lt!76071) (_2!1354 lt!76071)))))

(declare-fun b!145070 () Bool)

(assert (=> b!145070 (= e!94501 (ite c!27496 call!16191 call!16185))))

(declare-fun b!145071 () Bool)

(declare-fun Unit!4588 () Unit!4581)

(assert (=> b!145071 (= e!94505 Unit!4588)))

(declare-fun lt!76066 () Unit!4581)

(assert (=> b!145071 (= lt!76066 call!16186)))

(assert (=> b!145071 (= lt!76067 call!16173)))

(declare-fun res!69023 () Bool)

(assert (=> b!145071 (= res!69023 ((_ is Found!285) lt!76067))))

(assert (=> b!145071 (=> (not res!69023) (not e!94517))))

(assert (=> b!145071 e!94517))

(declare-fun lt!76059 () Unit!4581)

(assert (=> b!145071 (= lt!76059 lt!76066)))

(assert (=> b!145071 false))

(declare-fun b!145072 () Bool)

(assert (=> b!145072 (= e!94520 (= call!16170 (+!170 call!16188 (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!46157 c!27501) b!145049))

(assert (= (and d!46157 (not c!27501)) b!145066))

(assert (= (and b!145049 c!27496) b!145043))

(assert (= (and b!145049 (not c!27496)) b!145059))

(assert (= (or b!145043 b!145059) bm!16168))

(assert (= (or b!145043 b!145059) bm!16181))

(assert (= (or b!145043 b!145059) bm!16171))

(assert (= (and b!145066 c!27495) b!145036))

(assert (= (and b!145066 (not c!27495)) b!145062))

(assert (= (and b!145036 c!27503) b!145071))

(assert (= (and b!145036 (not c!27503)) b!145034))

(assert (= (and b!145071 res!69023) b!145032))

(assert (= (and b!145032 res!69018) b!145038))

(assert (= (and b!145034 c!27506) b!145054))

(assert (= (and b!145034 (not c!27506)) b!145045))

(assert (= (and b!145054 res!69016) b!145053))

(assert (= (and b!145053 res!69024) b!145068))

(assert (= (and b!145045 c!27508) b!145057))

(assert (= (and b!145045 (not c!27508)) b!145055))

(assert (= (and b!145057 res!69026) b!145067))

(assert (= (and b!145067 res!69021) b!145040))

(assert (= (or b!145054 b!145057) bm!16167))

(assert (= (or b!145068 b!145040) bm!16180))

(assert (= (or b!145032 bm!16167) bm!16182))

(assert (= (or b!145071 b!145034) bm!16175))

(assert (= (and b!145062 c!27502) b!145037))

(assert (= (and b!145062 (not c!27502)) b!145035))

(assert (= (and b!145035 c!27500) b!145069))

(assert (= (and b!145035 (not c!27500)) b!145050))

(assert (= (and b!145050 c!27507) b!145033))

(assert (= (and b!145050 (not c!27507)) b!145042))

(assert (= (and b!145033 res!69022) b!145065))

(assert (= (and b!145065 res!69017) b!145052))

(assert (= (and b!145042 c!27504) b!145048))

(assert (= (and b!145042 (not c!27504)) b!145041))

(assert (= (and b!145048 res!69025) b!145064))

(assert (= (and b!145064 res!69015) b!145039))

(assert (= (and b!145041 c!27497) b!145047))

(assert (= (and b!145041 (not c!27497)) b!145061))

(assert (= (and b!145047 res!69019) b!145051))

(assert (= (and b!145051 res!69020) b!145056))

(assert (= (or b!145048 b!145047) bm!16166))

(assert (= (or b!145039 b!145056) bm!16172))

(assert (= (or b!145065 bm!16166) bm!16178))

(assert (= (or b!145033 b!145042) bm!16186))

(assert (= (or b!145037 b!145069) bm!16179))

(assert (= (or b!145036 b!145050) bm!16184))

(assert (= (or b!145034 b!145042) bm!16173))

(assert (= (or bm!16182 bm!16178) bm!16177))

(assert (= (or bm!16180 bm!16172) bm!16187))

(assert (= (or bm!16175 bm!16186) bm!16165))

(assert (= (or b!145071 b!145033) bm!16183))

(assert (= (or b!145036 b!145050) bm!16169))

(assert (= (and bm!16169 c!27499) b!145044))

(assert (= (and bm!16169 (not c!27499)) b!145063))

(assert (= (or bm!16181 bm!16184) bm!16188))

(assert (= (or bm!16168 b!145063) bm!16185))

(assert (= (or bm!16171 b!145050) bm!16176))

(assert (= (and bm!16176 c!27505) b!145070))

(assert (= (and bm!16176 (not c!27505)) b!145060))

(assert (= (and d!46157 res!69027) b!145031))

(assert (= (and b!145031 c!27498) b!145058))

(assert (= (and b!145031 (not c!27498)) b!145046))

(assert (= (and b!145058 res!69028) b!145072))

(assert (= (or b!145058 b!145072 b!145046) bm!16174))

(assert (= (or b!145072 b!145046) bm!16170))

(declare-fun m!174485 () Bool)

(assert (=> bm!16169 m!174485))

(declare-fun m!174487 () Bool)

(assert (=> bm!16169 m!174487))

(declare-fun m!174489 () Bool)

(assert (=> bm!16185 m!174489))

(declare-fun m!174491 () Bool)

(assert (=> b!145072 m!174491))

(declare-fun m!174493 () Bool)

(assert (=> b!145064 m!174493))

(assert (=> bm!16170 m!174277))

(assert (=> b!145066 m!174253))

(declare-fun m!174495 () Bool)

(assert (=> b!145066 m!174495))

(assert (=> bm!16183 m!174253))

(declare-fun m!174497 () Bool)

(assert (=> bm!16183 m!174497))

(declare-fun m!174499 () Bool)

(assert (=> b!145052 m!174499))

(assert (=> b!145058 m!174253))

(declare-fun m!174501 () Bool)

(assert (=> b!145058 m!174501))

(declare-fun m!174503 () Bool)

(assert (=> bm!16176 m!174503))

(declare-fun m!174505 () Bool)

(assert (=> d!46157 m!174505))

(assert (=> d!46157 m!174245))

(assert (=> bm!16187 m!174253))

(declare-fun m!174507 () Bool)

(assert (=> bm!16187 m!174507))

(assert (=> bm!16165 m!174253))

(assert (=> bm!16165 m!174495))

(declare-fun m!174509 () Bool)

(assert (=> bm!16174 m!174509))

(declare-fun m!174511 () Bool)

(assert (=> b!145053 m!174511))

(assert (=> bm!16173 m!174253))

(declare-fun m!174513 () Bool)

(assert (=> bm!16173 m!174513))

(declare-fun m!174515 () Bool)

(assert (=> bm!16177 m!174515))

(assert (=> bm!16179 m!174253))

(assert (=> bm!16179 m!174251))

(declare-fun m!174517 () Bool)

(assert (=> bm!16179 m!174517))

(declare-fun m!174519 () Bool)

(assert (=> b!145051 m!174519))

(assert (=> b!145060 m!174381))

(assert (=> b!145059 m!174251))

(declare-fun m!174521 () Bool)

(assert (=> b!145059 m!174521))

(declare-fun m!174523 () Bool)

(assert (=> b!145038 m!174523))

(declare-fun m!174525 () Bool)

(assert (=> bm!16188 m!174525))

(declare-fun m!174527 () Bool)

(assert (=> bm!16188 m!174527))

(assert (=> b!145043 m!174251))

(declare-fun m!174529 () Bool)

(assert (=> b!145043 m!174529))

(declare-fun m!174531 () Bool)

(assert (=> b!145067 m!174531))

(assert (=> b!145050 m!174253))

(assert (=> b!145050 m!174251))

(declare-fun m!174533 () Bool)

(assert (=> b!145050 m!174533))

(declare-fun m!174535 () Bool)

(assert (=> b!145050 m!174535))

(assert (=> b!145050 m!174381))

(assert (=> b!145050 m!174253))

(declare-fun m!174537 () Bool)

(assert (=> b!145050 m!174537))

(assert (=> b!145050 m!174525))

(assert (=> b!145050 m!174381))

(assert (=> b!144693 d!46157))

(declare-fun d!46159 () Bool)

(declare-fun c!27511 () Bool)

(assert (=> d!46159 (= c!27511 ((_ is ValueCellFull!1130) (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun e!94524 () V!3577)

(assert (=> d!46159 (= (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!94524)))

(declare-fun b!145077 () Bool)

(declare-fun get!1547 (ValueCell!1130 V!3577) V!3577)

(assert (=> b!145077 (= e!94524 (get!1547 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!145078 () Bool)

(declare-fun get!1548 (ValueCell!1130 V!3577) V!3577)

(assert (=> b!145078 (= e!94524 (get!1548 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46159 c!27511) b!145077))

(assert (= (and d!46159 (not c!27511)) b!145078))

(assert (=> b!145077 m!174247))

(assert (=> b!145077 m!174249))

(declare-fun m!174539 () Bool)

(assert (=> b!145077 m!174539))

(assert (=> b!145078 m!174247))

(assert (=> b!145078 m!174249))

(declare-fun m!174541 () Bool)

(assert (=> b!145078 m!174541))

(assert (=> b!144693 d!46159))

(declare-fun d!46161 () Bool)

(declare-fun lt!76085 () Bool)

(assert (=> d!46161 (= lt!76085 (select (content!141 lt!75877) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94525 () Bool)

(assert (=> d!46161 (= lt!76085 e!94525)))

(declare-fun res!69030 () Bool)

(assert (=> d!46161 (=> (not res!69030) (not e!94525))))

(assert (=> d!46161 (= res!69030 ((_ is Cons!1750) lt!75877))))

(assert (=> d!46161 (= (contains!923 lt!75877 #b1000000000000000000000000000000000000000000000000000000000000000) lt!76085)))

(declare-fun b!145079 () Bool)

(declare-fun e!94526 () Bool)

(assert (=> b!145079 (= e!94525 e!94526)))

(declare-fun res!69029 () Bool)

(assert (=> b!145079 (=> res!69029 e!94526)))

(assert (=> b!145079 (= res!69029 (= (h!2358 lt!75877) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145080 () Bool)

(assert (=> b!145080 (= e!94526 (contains!923 (t!6386 lt!75877) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46161 res!69030) b!145079))

(assert (= (and b!145079 (not res!69029)) b!145080))

(assert (=> d!46161 m!174449))

(declare-fun m!174543 () Bool)

(assert (=> d!46161 m!174543))

(declare-fun m!174545 () Bool)

(assert (=> b!145080 m!174545))

(assert (=> b!144688 d!46161))

(declare-fun mapNonEmpty!4919 () Bool)

(declare-fun mapRes!4919 () Bool)

(declare-fun tp!11705 () Bool)

(declare-fun e!94532 () Bool)

(assert (=> mapNonEmpty!4919 (= mapRes!4919 (and tp!11705 e!94532))))

(declare-fun mapValue!4919 () ValueCell!1130)

(declare-fun mapKey!4919 () (_ BitVec 32))

(declare-fun mapRest!4919 () (Array (_ BitVec 32) ValueCell!1130))

(assert (=> mapNonEmpty!4919 (= mapRest!4904 (store mapRest!4919 mapKey!4919 mapValue!4919))))

(declare-fun b!145088 () Bool)

(declare-fun e!94531 () Bool)

(assert (=> b!145088 (= e!94531 tp_is_empty!2947)))

(declare-fun condMapEmpty!4919 () Bool)

(declare-fun mapDefault!4919 () ValueCell!1130)

(assert (=> mapNonEmpty!4904 (= condMapEmpty!4919 (= mapRest!4904 ((as const (Array (_ BitVec 32) ValueCell!1130)) mapDefault!4919)))))

(assert (=> mapNonEmpty!4904 (= tp!11677 (and e!94531 mapRes!4919))))

(declare-fun b!145087 () Bool)

(assert (=> b!145087 (= e!94532 tp_is_empty!2947)))

(declare-fun mapIsEmpty!4919 () Bool)

(assert (=> mapIsEmpty!4919 mapRes!4919))

(assert (= (and mapNonEmpty!4904 condMapEmpty!4919) mapIsEmpty!4919))

(assert (= (and mapNonEmpty!4904 (not condMapEmpty!4919)) mapNonEmpty!4919))

(assert (= (and mapNonEmpty!4919 ((_ is ValueCellFull!1130) mapValue!4919)) b!145087))

(assert (= (and mapNonEmpty!4904 ((_ is ValueCellFull!1130) mapDefault!4919)) b!145088))

(declare-fun m!174547 () Bool)

(assert (=> mapNonEmpty!4919 m!174547))

(declare-fun mapNonEmpty!4920 () Bool)

(declare-fun mapRes!4920 () Bool)

(declare-fun tp!11706 () Bool)

(declare-fun e!94534 () Bool)

(assert (=> mapNonEmpty!4920 (= mapRes!4920 (and tp!11706 e!94534))))

(declare-fun mapValue!4920 () ValueCell!1130)

(declare-fun mapRest!4920 () (Array (_ BitVec 32) ValueCell!1130))

(declare-fun mapKey!4920 () (_ BitVec 32))

(assert (=> mapNonEmpty!4920 (= mapRest!4903 (store mapRest!4920 mapKey!4920 mapValue!4920))))

(declare-fun b!145090 () Bool)

(declare-fun e!94533 () Bool)

(assert (=> b!145090 (= e!94533 tp_is_empty!2947)))

(declare-fun condMapEmpty!4920 () Bool)

(declare-fun mapDefault!4920 () ValueCell!1130)

(assert (=> mapNonEmpty!4903 (= condMapEmpty!4920 (= mapRest!4903 ((as const (Array (_ BitVec 32) ValueCell!1130)) mapDefault!4920)))))

(assert (=> mapNonEmpty!4903 (= tp!11675 (and e!94533 mapRes!4920))))

(declare-fun b!145089 () Bool)

(assert (=> b!145089 (= e!94534 tp_is_empty!2947)))

(declare-fun mapIsEmpty!4920 () Bool)

(assert (=> mapIsEmpty!4920 mapRes!4920))

(assert (= (and mapNonEmpty!4903 condMapEmpty!4920) mapIsEmpty!4920))

(assert (= (and mapNonEmpty!4903 (not condMapEmpty!4920)) mapNonEmpty!4920))

(assert (= (and mapNonEmpty!4920 ((_ is ValueCellFull!1130) mapValue!4920)) b!145089))

(assert (= (and mapNonEmpty!4903 ((_ is ValueCellFull!1130) mapDefault!4920)) b!145090))

(declare-fun m!174549 () Bool)

(assert (=> mapNonEmpty!4920 m!174549))

(declare-fun b_lambda!6491 () Bool)

(assert (= b_lambda!6489 (or (and b!144677 b_free!3061) (and b!144678 b_free!3063 (= (defaultEntry!2988 newMap!16) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))))) b_lambda!6491)))

(check-sat (not bm!16112) (not bm!16115) (not bm!16188) (not b!144936) (not b!145058) (not d!46155) (not b!144925) (not mapNonEmpty!4919) (not bm!16176) (not b!144944) (not bm!16169) (not b!144918) (not b!144880) b_and!9019 (not b!145066) (not b!144923) (not b!145050) (not b!144931) (not b!144904) (not bm!16165) (not b!144882) (not b!144870) (not b!144865) (not b_lambda!6487) (not b_next!3063) (not d!46161) (not bm!16174) (not b!144875) (not d!46145) (not b!145080) (not b!145077) (not d!46139) (not bm!16170) (not bm!16185) (not b!144920) (not b!144924) (not b!145060) (not d!46157) (not b!144919) (not bm!16111) (not b!145072) (not b!144871) (not b!145078) (not d!46137) (not b!144905) (not b!144890) (not b!144877) (not bm!16183) (not d!46141) (not b!144911) (not b!144889) (not d!46125) (not d!46149) (not bm!16107) (not mapNonEmpty!4920) (not b!144946) (not bm!16177) (not b_lambda!6491) b_and!9017 (not b!144903) (not bm!16179) (not b_next!3061) (not bm!16116) (not bm!16108) tp_is_empty!2947 (not b!145059) (not bm!16173) (not b!144873) (not b!145043) (not bm!16187) (not d!46127))
(check-sat b_and!9017 b_and!9019 (not b_next!3061) (not b_next!3063))
(get-model)

(declare-fun d!46163 () Bool)

(declare-fun e!94537 () Bool)

(assert (=> d!46163 e!94537))

(declare-fun res!69036 () Bool)

(assert (=> d!46163 (=> (not res!69036) (not e!94537))))

(declare-fun lt!76094 () ListLongMap!1725)

(assert (=> d!46163 (= res!69036 (contains!924 lt!76094 (_1!1353 (ite c!27501 (ite c!27496 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!76095 () List!1755)

(assert (=> d!46163 (= lt!76094 (ListLongMap!1726 lt!76095))))

(declare-fun lt!76097 () Unit!4581)

(declare-fun lt!76096 () Unit!4581)

(assert (=> d!46163 (= lt!76097 lt!76096)))

(assert (=> d!46163 (= (getValueByKey!177 lt!76095 (_1!1353 (ite c!27501 (ite c!27496 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!182 (_2!1353 (ite c!27501 (ite c!27496 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!94 (List!1755 (_ BitVec 64) V!3577) Unit!4581)

(assert (=> d!46163 (= lt!76096 (lemmaContainsTupThenGetReturnValue!94 lt!76095 (_1!1353 (ite c!27501 (ite c!27496 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1353 (ite c!27501 (ite c!27496 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun insertStrictlySorted!97 (List!1755 (_ BitVec 64) V!3577) List!1755)

(assert (=> d!46163 (= lt!76095 (insertStrictlySorted!97 (toList!878 e!94501) (_1!1353 (ite c!27501 (ite c!27496 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1353 (ite c!27501 (ite c!27496 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46163 (= (+!170 e!94501 (ite c!27501 (ite c!27496 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!76094)))

(declare-fun b!145095 () Bool)

(declare-fun res!69035 () Bool)

(assert (=> b!145095 (=> (not res!69035) (not e!94537))))

(assert (=> b!145095 (= res!69035 (= (getValueByKey!177 (toList!878 lt!76094) (_1!1353 (ite c!27501 (ite c!27496 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!182 (_2!1353 (ite c!27501 (ite c!27496 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!145096 () Bool)

(declare-fun contains!927 (List!1755 tuple2!2684) Bool)

(assert (=> b!145096 (= e!94537 (contains!927 (toList!878 lt!76094) (ite c!27501 (ite c!27496 (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!46163 res!69036) b!145095))

(assert (= (and b!145095 res!69035) b!145096))

(declare-fun m!174551 () Bool)

(assert (=> d!46163 m!174551))

(declare-fun m!174553 () Bool)

(assert (=> d!46163 m!174553))

(declare-fun m!174555 () Bool)

(assert (=> d!46163 m!174555))

(declare-fun m!174557 () Bool)

(assert (=> d!46163 m!174557))

(declare-fun m!174559 () Bool)

(assert (=> b!145095 m!174559))

(declare-fun m!174561 () Bool)

(assert (=> b!145096 m!174561))

(assert (=> bm!16176 d!46163))

(declare-fun d!46165 () Bool)

(declare-fun e!94538 () Bool)

(assert (=> d!46165 e!94538))

(declare-fun res!69038 () Bool)

(assert (=> d!46165 (=> (not res!69038) (not e!94538))))

(declare-fun lt!76098 () ListLongMap!1725)

(assert (=> d!46165 (= res!69038 (contains!924 lt!76098 (_1!1353 (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!76099 () List!1755)

(assert (=> d!46165 (= lt!76098 (ListLongMap!1726 lt!76099))))

(declare-fun lt!76101 () Unit!4581)

(declare-fun lt!76100 () Unit!4581)

(assert (=> d!46165 (= lt!76101 lt!76100)))

(assert (=> d!46165 (= (getValueByKey!177 lt!76099 (_1!1353 (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!182 (_2!1353 (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46165 (= lt!76100 (lemmaContainsTupThenGetReturnValue!94 lt!76099 (_1!1353 (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1353 (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46165 (= lt!76099 (insertStrictlySorted!97 (toList!878 call!16188) (_1!1353 (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1353 (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46165 (= (+!170 call!16188 (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!76098)))

(declare-fun b!145097 () Bool)

(declare-fun res!69037 () Bool)

(assert (=> b!145097 (=> (not res!69037) (not e!94538))))

(assert (=> b!145097 (= res!69037 (= (getValueByKey!177 (toList!878 lt!76098) (_1!1353 (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!182 (_2!1353 (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!145098 () Bool)

(assert (=> b!145098 (= e!94538 (contains!927 (toList!878 lt!76098) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!46165 res!69038) b!145097))

(assert (= (and b!145097 res!69037) b!145098))

(declare-fun m!174563 () Bool)

(assert (=> d!46165 m!174563))

(declare-fun m!174565 () Bool)

(assert (=> d!46165 m!174565))

(declare-fun m!174567 () Bool)

(assert (=> d!46165 m!174567))

(declare-fun m!174569 () Bool)

(assert (=> d!46165 m!174569))

(declare-fun m!174571 () Bool)

(assert (=> b!145097 m!174571))

(declare-fun m!174573 () Bool)

(assert (=> b!145098 m!174573))

(assert (=> b!145072 d!46165))

(declare-fun d!46167 () Bool)

(assert (=> d!46167 (= (map!1433 (_2!1354 lt!76072)) (getCurrentListMap!537 (_keys!4754 (_2!1354 lt!76072)) (_values!2971 (_2!1354 lt!76072)) (mask!7351 (_2!1354 lt!76072)) (extraKeys!2735 (_2!1354 lt!76072)) (zeroValue!2834 (_2!1354 lt!76072)) (minValue!2834 (_2!1354 lt!76072)) #b00000000000000000000000000000000 (defaultEntry!2988 (_2!1354 lt!76072))))))

(declare-fun bs!6093 () Bool)

(assert (= bs!6093 d!46167))

(declare-fun m!174575 () Bool)

(assert (=> bs!6093 m!174575))

(assert (=> bm!16174 d!46167))

(declare-fun b!145099 () Bool)

(declare-fun e!94541 () ListLongMap!1725)

(declare-fun call!16198 () ListLongMap!1725)

(assert (=> b!145099 (= e!94541 call!16198)))

(declare-fun b!145100 () Bool)

(declare-fun e!94547 () Unit!4581)

(declare-fun lt!76116 () Unit!4581)

(assert (=> b!145100 (= e!94547 lt!76116)))

(declare-fun lt!76112 () ListLongMap!1725)

(assert (=> b!145100 (= lt!76112 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (ite c!27501 (_values!2971 newMap!16) lt!76081) (mask!7351 newMap!16) (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) (zeroValue!2834 newMap!16) (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76117 () (_ BitVec 64))

(assert (=> b!145100 (= lt!76117 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76119 () (_ BitVec 64))

(assert (=> b!145100 (= lt!76119 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76104 () Unit!4581)

(assert (=> b!145100 (= lt!76104 (addStillContains!99 lt!76112 lt!76117 (zeroValue!2834 newMap!16) lt!76119))))

(assert (=> b!145100 (contains!924 (+!170 lt!76112 (tuple2!2685 lt!76117 (zeroValue!2834 newMap!16))) lt!76119)))

(declare-fun lt!76102 () Unit!4581)

(assert (=> b!145100 (= lt!76102 lt!76104)))

(declare-fun lt!76110 () ListLongMap!1725)

(assert (=> b!145100 (= lt!76110 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (ite c!27501 (_values!2971 newMap!16) lt!76081) (mask!7351 newMap!16) (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) (zeroValue!2834 newMap!16) (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76103 () (_ BitVec 64))

(assert (=> b!145100 (= lt!76103 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76113 () (_ BitVec 64))

(assert (=> b!145100 (= lt!76113 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76123 () Unit!4581)

(assert (=> b!145100 (= lt!76123 (addApplyDifferent!99 lt!76110 lt!76103 (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) lt!76113))))

(assert (=> b!145100 (= (apply!123 (+!170 lt!76110 (tuple2!2685 lt!76103 (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)))) lt!76113) (apply!123 lt!76110 lt!76113))))

(declare-fun lt!76114 () Unit!4581)

(assert (=> b!145100 (= lt!76114 lt!76123)))

(declare-fun lt!76106 () ListLongMap!1725)

(assert (=> b!145100 (= lt!76106 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (ite c!27501 (_values!2971 newMap!16) lt!76081) (mask!7351 newMap!16) (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) (zeroValue!2834 newMap!16) (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76108 () (_ BitVec 64))

(assert (=> b!145100 (= lt!76108 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76107 () (_ BitVec 64))

(assert (=> b!145100 (= lt!76107 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76121 () Unit!4581)

(assert (=> b!145100 (= lt!76121 (addApplyDifferent!99 lt!76106 lt!76108 (zeroValue!2834 newMap!16) lt!76107))))

(assert (=> b!145100 (= (apply!123 (+!170 lt!76106 (tuple2!2685 lt!76108 (zeroValue!2834 newMap!16))) lt!76107) (apply!123 lt!76106 lt!76107))))

(declare-fun lt!76115 () Unit!4581)

(assert (=> b!145100 (= lt!76115 lt!76121)))

(declare-fun lt!76105 () ListLongMap!1725)

(assert (=> b!145100 (= lt!76105 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (ite c!27501 (_values!2971 newMap!16) lt!76081) (mask!7351 newMap!16) (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) (zeroValue!2834 newMap!16) (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76122 () (_ BitVec 64))

(assert (=> b!145100 (= lt!76122 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76118 () (_ BitVec 64))

(assert (=> b!145100 (= lt!76118 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145100 (= lt!76116 (addApplyDifferent!99 lt!76105 lt!76122 (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) lt!76118))))

(assert (=> b!145100 (= (apply!123 (+!170 lt!76105 (tuple2!2685 lt!76122 (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)))) lt!76118) (apply!123 lt!76105 lt!76118))))

(declare-fun b!145101 () Bool)

(declare-fun res!69041 () Bool)

(declare-fun e!94548 () Bool)

(assert (=> b!145101 (=> (not res!69041) (not e!94548))))

(declare-fun e!94549 () Bool)

(assert (=> b!145101 (= res!69041 e!94549)))

(declare-fun res!69046 () Bool)

(assert (=> b!145101 (=> res!69046 e!94549)))

(declare-fun e!94550 () Bool)

(assert (=> b!145101 (= res!69046 (not e!94550))))

(declare-fun res!69044 () Bool)

(assert (=> b!145101 (=> (not res!69044) (not e!94550))))

(assert (=> b!145101 (= res!69044 (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(declare-fun b!145102 () Bool)

(declare-fun e!94539 () ListLongMap!1725)

(assert (=> b!145102 (= e!94539 call!16198)))

(declare-fun b!145103 () Bool)

(declare-fun Unit!4589 () Unit!4581)

(assert (=> b!145103 (= e!94547 Unit!4589)))

(declare-fun b!145104 () Bool)

(declare-fun e!94544 () Bool)

(declare-fun e!94542 () Bool)

(assert (=> b!145104 (= e!94544 e!94542)))

(declare-fun res!69047 () Bool)

(declare-fun call!16195 () Bool)

(assert (=> b!145104 (= res!69047 call!16195)))

(assert (=> b!145104 (=> (not res!69047) (not e!94542))))

(declare-fun b!145105 () Bool)

(declare-fun e!94546 () Bool)

(assert (=> b!145105 (= e!94546 (validKeyInArray!0 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!16189 () Bool)

(declare-fun call!16194 () ListLongMap!1725)

(declare-fun call!16192 () ListLongMap!1725)

(assert (=> bm!16189 (= call!16194 call!16192)))

(declare-fun b!145106 () Bool)

(declare-fun lt!76109 () ListLongMap!1725)

(assert (=> b!145106 (= e!94542 (= (apply!123 lt!76109 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2834 newMap!16)))))

(declare-fun b!145107 () Bool)

(declare-fun e!94551 () ListLongMap!1725)

(assert (=> b!145107 (= e!94551 e!94539)))

(declare-fun c!27512 () Bool)

(assert (=> b!145107 (= c!27512 (and (not (= (bvand (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!145108 () Bool)

(assert (=> b!145108 (= e!94550 (validKeyInArray!0 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145109 () Bool)

(declare-fun e!94540 () Bool)

(declare-fun call!16196 () Bool)

(assert (=> b!145109 (= e!94540 (not call!16196))))

(declare-fun b!145110 () Bool)

(declare-fun e!94543 () Bool)

(assert (=> b!145110 (= e!94549 e!94543)))

(declare-fun res!69042 () Bool)

(assert (=> b!145110 (=> (not res!69042) (not e!94543))))

(assert (=> b!145110 (= res!69042 (contains!924 lt!76109 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!145110 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(declare-fun b!145111 () Bool)

(declare-fun res!69045 () Bool)

(assert (=> b!145111 (=> (not res!69045) (not e!94548))))

(assert (=> b!145111 (= res!69045 e!94544)))

(declare-fun c!27516 () Bool)

(assert (=> b!145111 (= c!27516 (not (= (bvand (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!46169 () Bool)

(assert (=> d!46169 e!94548))

(declare-fun res!69040 () Bool)

(assert (=> d!46169 (=> (not res!69040) (not e!94548))))

(assert (=> d!46169 (= res!69040 (or (bvsge #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))))

(declare-fun lt!76120 () ListLongMap!1725)

(assert (=> d!46169 (= lt!76109 lt!76120)))

(declare-fun lt!76111 () Unit!4581)

(assert (=> d!46169 (= lt!76111 e!94547)))

(declare-fun c!27513 () Bool)

(assert (=> d!46169 (= c!27513 e!94546)))

(declare-fun res!69043 () Bool)

(assert (=> d!46169 (=> (not res!69043) (not e!94546))))

(assert (=> d!46169 (= res!69043 (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(assert (=> d!46169 (= lt!76120 e!94551)))

(declare-fun c!27517 () Bool)

(assert (=> d!46169 (= c!27517 (and (not (= (bvand (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46169 (validMask!0 (mask!7351 newMap!16))))

(assert (=> d!46169 (= (getCurrentListMap!537 (_keys!4754 newMap!16) (ite c!27501 (_values!2971 newMap!16) lt!76081) (mask!7351 newMap!16) (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) (zeroValue!2834 newMap!16) (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) lt!76109)))

(declare-fun call!16193 () ListLongMap!1725)

(declare-fun b!145112 () Bool)

(assert (=> b!145112 (= e!94551 (+!170 call!16193 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)))))))

(declare-fun b!145113 () Bool)

(assert (=> b!145113 (= e!94544 (not call!16195))))

(declare-fun b!145114 () Bool)

(declare-fun e!94545 () Bool)

(assert (=> b!145114 (= e!94540 e!94545)))

(declare-fun res!69039 () Bool)

(assert (=> b!145114 (= res!69039 call!16196)))

(assert (=> b!145114 (=> (not res!69039) (not e!94545))))

(declare-fun b!145115 () Bool)

(assert (=> b!145115 (= e!94543 (= (apply!123 lt!76109 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)) (get!1545 (select (arr!2321 (ite c!27501 (_values!2971 newMap!16) lt!76081)) #b00000000000000000000000000000000) (dynLambda!441 (defaultEntry!2988 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145115 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2597 (ite c!27501 (_values!2971 newMap!16) lt!76081))))))

(assert (=> b!145115 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(declare-fun b!145116 () Bool)

(assert (=> b!145116 (= e!94541 call!16194)))

(declare-fun b!145117 () Bool)

(assert (=> b!145117 (= e!94545 (= (apply!123 lt!76109 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16))))))

(declare-fun bm!16190 () Bool)

(declare-fun call!16197 () ListLongMap!1725)

(assert (=> bm!16190 (= call!16197 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (ite c!27501 (_values!2971 newMap!16) lt!76081) (mask!7351 newMap!16) (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) (zeroValue!2834 newMap!16) (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun bm!16191 () Bool)

(assert (=> bm!16191 (= call!16193 (+!170 (ite c!27517 call!16197 (ite c!27512 call!16192 call!16194)) (ite (or c!27517 c!27512) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 newMap!16)) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27501 (ite c!27496 (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2834 newMap!16))))))))

(declare-fun bm!16192 () Bool)

(assert (=> bm!16192 (= call!16198 call!16193)))

(declare-fun bm!16193 () Bool)

(assert (=> bm!16193 (= call!16192 call!16197)))

(declare-fun b!145118 () Bool)

(assert (=> b!145118 (= e!94548 e!94540)))

(declare-fun c!27515 () Bool)

(assert (=> b!145118 (= c!27515 (not (= (bvand (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16194 () Bool)

(assert (=> bm!16194 (= call!16195 (contains!924 lt!76109 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145119 () Bool)

(declare-fun c!27514 () Bool)

(assert (=> b!145119 (= c!27514 (and (not (= (bvand (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!27501 (ite c!27496 (extraKeys!2735 newMap!16) lt!76065) (extraKeys!2735 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!145119 (= e!94539 e!94541)))

(declare-fun bm!16195 () Bool)

(assert (=> bm!16195 (= call!16196 (contains!924 lt!76109 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46169 c!27517) b!145112))

(assert (= (and d!46169 (not c!27517)) b!145107))

(assert (= (and b!145107 c!27512) b!145102))

(assert (= (and b!145107 (not c!27512)) b!145119))

(assert (= (and b!145119 c!27514) b!145099))

(assert (= (and b!145119 (not c!27514)) b!145116))

(assert (= (or b!145099 b!145116) bm!16189))

(assert (= (or b!145102 bm!16189) bm!16193))

(assert (= (or b!145102 b!145099) bm!16192))

(assert (= (or b!145112 bm!16193) bm!16190))

(assert (= (or b!145112 bm!16192) bm!16191))

(assert (= (and d!46169 res!69043) b!145105))

(assert (= (and d!46169 c!27513) b!145100))

(assert (= (and d!46169 (not c!27513)) b!145103))

(assert (= (and d!46169 res!69040) b!145101))

(assert (= (and b!145101 res!69044) b!145108))

(assert (= (and b!145101 (not res!69046)) b!145110))

(assert (= (and b!145110 res!69042) b!145115))

(assert (= (and b!145101 res!69041) b!145111))

(assert (= (and b!145111 c!27516) b!145104))

(assert (= (and b!145111 (not c!27516)) b!145113))

(assert (= (and b!145104 res!69047) b!145106))

(assert (= (or b!145104 b!145113) bm!16194))

(assert (= (and b!145111 res!69045) b!145118))

(assert (= (and b!145118 c!27515) b!145114))

(assert (= (and b!145118 (not c!27515)) b!145109))

(assert (= (and b!145114 res!69039) b!145117))

(assert (= (or b!145114 b!145109) bm!16195))

(declare-fun b_lambda!6493 () Bool)

(assert (=> (not b_lambda!6493) (not b!145115)))

(declare-fun t!6400 () Bool)

(declare-fun tb!2605 () Bool)

(assert (=> (and b!144677 (= (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) (defaultEntry!2988 newMap!16)) t!6400) tb!2605))

(declare-fun result!4267 () Bool)

(assert (=> tb!2605 (= result!4267 tp_is_empty!2947)))

(assert (=> b!145115 t!6400))

(declare-fun b_and!9021 () Bool)

(assert (= b_and!9017 (and (=> t!6400 result!4267) b_and!9021)))

(declare-fun t!6402 () Bool)

(declare-fun tb!2607 () Bool)

(assert (=> (and b!144678 (= (defaultEntry!2988 newMap!16) (defaultEntry!2988 newMap!16)) t!6402) tb!2607))

(declare-fun result!4269 () Bool)

(assert (= result!4269 result!4267))

(assert (=> b!145115 t!6402))

(declare-fun b_and!9023 () Bool)

(assert (= b_and!9019 (and (=> t!6402 result!4269) b_and!9023)))

(declare-fun m!174577 () Bool)

(assert (=> d!46169 m!174577))

(declare-fun m!174579 () Bool)

(assert (=> bm!16190 m!174579))

(declare-fun m!174581 () Bool)

(assert (=> bm!16195 m!174581))

(declare-fun m!174583 () Bool)

(assert (=> b!145112 m!174583))

(declare-fun m!174585 () Bool)

(assert (=> bm!16194 m!174585))

(declare-fun m!174587 () Bool)

(assert (=> bm!16191 m!174587))

(declare-fun m!174589 () Bool)

(assert (=> b!145106 m!174589))

(declare-fun m!174591 () Bool)

(assert (=> b!145115 m!174591))

(declare-fun m!174593 () Bool)

(assert (=> b!145115 m!174593))

(declare-fun m!174595 () Bool)

(assert (=> b!145115 m!174595))

(assert (=> b!145115 m!174593))

(assert (=> b!145115 m!174591))

(declare-fun m!174597 () Bool)

(assert (=> b!145115 m!174597))

(declare-fun m!174599 () Bool)

(assert (=> b!145115 m!174599))

(assert (=> b!145115 m!174597))

(assert (=> b!145110 m!174593))

(assert (=> b!145110 m!174593))

(declare-fun m!174601 () Bool)

(assert (=> b!145110 m!174601))

(declare-fun m!174603 () Bool)

(assert (=> b!145117 m!174603))

(assert (=> b!145108 m!174593))

(assert (=> b!145108 m!174593))

(declare-fun m!174605 () Bool)

(assert (=> b!145108 m!174605))

(declare-fun m!174607 () Bool)

(assert (=> b!145100 m!174607))

(assert (=> b!145100 m!174579))

(assert (=> b!145100 m!174593))

(assert (=> b!145100 m!174607))

(declare-fun m!174609 () Bool)

(assert (=> b!145100 m!174609))

(declare-fun m!174611 () Bool)

(assert (=> b!145100 m!174611))

(declare-fun m!174613 () Bool)

(assert (=> b!145100 m!174613))

(declare-fun m!174615 () Bool)

(assert (=> b!145100 m!174615))

(declare-fun m!174617 () Bool)

(assert (=> b!145100 m!174617))

(declare-fun m!174619 () Bool)

(assert (=> b!145100 m!174619))

(declare-fun m!174621 () Bool)

(assert (=> b!145100 m!174621))

(assert (=> b!145100 m!174613))

(assert (=> b!145100 m!174611))

(declare-fun m!174623 () Bool)

(assert (=> b!145100 m!174623))

(assert (=> b!145100 m!174617))

(declare-fun m!174625 () Bool)

(assert (=> b!145100 m!174625))

(declare-fun m!174627 () Bool)

(assert (=> b!145100 m!174627))

(declare-fun m!174629 () Bool)

(assert (=> b!145100 m!174629))

(declare-fun m!174631 () Bool)

(assert (=> b!145100 m!174631))

(declare-fun m!174633 () Bool)

(assert (=> b!145100 m!174633))

(declare-fun m!174635 () Bool)

(assert (=> b!145100 m!174635))

(assert (=> b!145105 m!174593))

(assert (=> b!145105 m!174593))

(assert (=> b!145105 m!174605))

(assert (=> bm!16185 d!46169))

(declare-fun d!46171 () Bool)

(assert (=> d!46171 (= (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144905 d!46171))

(declare-fun d!46173 () Bool)

(declare-fun res!69048 () Bool)

(declare-fun e!94552 () Bool)

(assert (=> d!46173 (=> (not res!69048) (not e!94552))))

(assert (=> d!46173 (= res!69048 (simpleValid!99 (_2!1354 lt!76072)))))

(assert (=> d!46173 (= (valid!570 (_2!1354 lt!76072)) e!94552)))

(declare-fun b!145120 () Bool)

(declare-fun res!69049 () Bool)

(assert (=> b!145120 (=> (not res!69049) (not e!94552))))

(assert (=> b!145120 (= res!69049 (= (arrayCountValidKeys!0 (_keys!4754 (_2!1354 lt!76072)) #b00000000000000000000000000000000 (size!2596 (_keys!4754 (_2!1354 lt!76072)))) (_size!633 (_2!1354 lt!76072))))))

(declare-fun b!145121 () Bool)

(declare-fun res!69050 () Bool)

(assert (=> b!145121 (=> (not res!69050) (not e!94552))))

(assert (=> b!145121 (= res!69050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4754 (_2!1354 lt!76072)) (mask!7351 (_2!1354 lt!76072))))))

(declare-fun b!145122 () Bool)

(assert (=> b!145122 (= e!94552 (arrayNoDuplicates!0 (_keys!4754 (_2!1354 lt!76072)) #b00000000000000000000000000000000 Nil!1751))))

(assert (= (and d!46173 res!69048) b!145120))

(assert (= (and b!145120 res!69049) b!145121))

(assert (= (and b!145121 res!69050) b!145122))

(declare-fun m!174637 () Bool)

(assert (=> d!46173 m!174637))

(declare-fun m!174639 () Bool)

(assert (=> b!145120 m!174639))

(declare-fun m!174641 () Bool)

(assert (=> b!145121 m!174641))

(declare-fun m!174643 () Bool)

(assert (=> b!145122 m!174643))

(assert (=> d!46157 d!46173))

(assert (=> d!46157 d!46139))

(declare-fun d!46175 () Bool)

(declare-fun e!94553 () Bool)

(assert (=> d!46175 e!94553))

(declare-fun res!69052 () Bool)

(assert (=> d!46175 (=> (not res!69052) (not e!94553))))

(declare-fun lt!76124 () ListLongMap!1725)

(assert (=> d!46175 (= res!69052 (contains!924 lt!76124 (_1!1353 (ite (or c!27456 c!27451) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))))))

(declare-fun lt!76125 () List!1755)

(assert (=> d!46175 (= lt!76124 (ListLongMap!1726 lt!76125))))

(declare-fun lt!76127 () Unit!4581)

(declare-fun lt!76126 () Unit!4581)

(assert (=> d!46175 (= lt!76127 lt!76126)))

(assert (=> d!46175 (= (getValueByKey!177 lt!76125 (_1!1353 (ite (or c!27456 c!27451) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))) (Some!182 (_2!1353 (ite (or c!27456 c!27451) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))))))

(assert (=> d!46175 (= lt!76126 (lemmaContainsTupThenGetReturnValue!94 lt!76125 (_1!1353 (ite (or c!27456 c!27451) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))) (_2!1353 (ite (or c!27456 c!27451) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))))))

(assert (=> d!46175 (= lt!76125 (insertStrictlySorted!97 (toList!878 (ite c!27456 call!16114 (ite c!27451 call!16109 call!16111))) (_1!1353 (ite (or c!27456 c!27451) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))) (_2!1353 (ite (or c!27456 c!27451) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))))))

(assert (=> d!46175 (= (+!170 (ite c!27456 call!16114 (ite c!27451 call!16109 call!16111)) (ite (or c!27456 c!27451) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))) lt!76124)))

(declare-fun b!145123 () Bool)

(declare-fun res!69051 () Bool)

(assert (=> b!145123 (=> (not res!69051) (not e!94553))))

(assert (=> b!145123 (= res!69051 (= (getValueByKey!177 (toList!878 lt!76124) (_1!1353 (ite (or c!27456 c!27451) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))) (Some!182 (_2!1353 (ite (or c!27456 c!27451) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))))

(declare-fun b!145124 () Bool)

(assert (=> b!145124 (= e!94553 (contains!927 (toList!878 lt!76124) (ite (or c!27456 c!27451) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (= (and d!46175 res!69052) b!145123))

(assert (= (and b!145123 res!69051) b!145124))

(declare-fun m!174645 () Bool)

(assert (=> d!46175 m!174645))

(declare-fun m!174647 () Bool)

(assert (=> d!46175 m!174647))

(declare-fun m!174649 () Bool)

(assert (=> d!46175 m!174649))

(declare-fun m!174651 () Bool)

(assert (=> d!46175 m!174651))

(declare-fun m!174653 () Bool)

(assert (=> b!145123 m!174653))

(declare-fun m!174655 () Bool)

(assert (=> b!145124 m!174655))

(assert (=> bm!16108 d!46175))

(declare-fun b!145125 () Bool)

(declare-fun e!94556 () ListLongMap!1725)

(declare-fun call!16205 () ListLongMap!1725)

(assert (=> b!145125 (= e!94556 call!16205)))

(declare-fun b!145126 () Bool)

(declare-fun e!94562 () Unit!4581)

(declare-fun lt!76142 () Unit!4581)

(assert (=> b!145126 (= e!94562 lt!76142)))

(declare-fun lt!76138 () ListLongMap!1725)

(assert (=> b!145126 (= lt!76138 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76143 () (_ BitVec 64))

(assert (=> b!145126 (= lt!76143 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76145 () (_ BitVec 64))

(assert (=> b!145126 (= lt!76145 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76130 () Unit!4581)

(assert (=> b!145126 (= lt!76130 (addStillContains!99 lt!76138 lt!76143 (zeroValue!2834 newMap!16) lt!76145))))

(assert (=> b!145126 (contains!924 (+!170 lt!76138 (tuple2!2685 lt!76143 (zeroValue!2834 newMap!16))) lt!76145)))

(declare-fun lt!76128 () Unit!4581)

(assert (=> b!145126 (= lt!76128 lt!76130)))

(declare-fun lt!76136 () ListLongMap!1725)

(assert (=> b!145126 (= lt!76136 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76129 () (_ BitVec 64))

(assert (=> b!145126 (= lt!76129 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76139 () (_ BitVec 64))

(assert (=> b!145126 (= lt!76139 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76149 () Unit!4581)

(assert (=> b!145126 (= lt!76149 (addApplyDifferent!99 lt!76136 lt!76129 (minValue!2834 newMap!16) lt!76139))))

(assert (=> b!145126 (= (apply!123 (+!170 lt!76136 (tuple2!2685 lt!76129 (minValue!2834 newMap!16))) lt!76139) (apply!123 lt!76136 lt!76139))))

(declare-fun lt!76140 () Unit!4581)

(assert (=> b!145126 (= lt!76140 lt!76149)))

(declare-fun lt!76132 () ListLongMap!1725)

(assert (=> b!145126 (= lt!76132 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76134 () (_ BitVec 64))

(assert (=> b!145126 (= lt!76134 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76133 () (_ BitVec 64))

(assert (=> b!145126 (= lt!76133 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76147 () Unit!4581)

(assert (=> b!145126 (= lt!76147 (addApplyDifferent!99 lt!76132 lt!76134 (zeroValue!2834 newMap!16) lt!76133))))

(assert (=> b!145126 (= (apply!123 (+!170 lt!76132 (tuple2!2685 lt!76134 (zeroValue!2834 newMap!16))) lt!76133) (apply!123 lt!76132 lt!76133))))

(declare-fun lt!76141 () Unit!4581)

(assert (=> b!145126 (= lt!76141 lt!76147)))

(declare-fun lt!76131 () ListLongMap!1725)

(assert (=> b!145126 (= lt!76131 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76148 () (_ BitVec 64))

(assert (=> b!145126 (= lt!76148 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76144 () (_ BitVec 64))

(assert (=> b!145126 (= lt!76144 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145126 (= lt!76142 (addApplyDifferent!99 lt!76131 lt!76148 (minValue!2834 newMap!16) lt!76144))))

(assert (=> b!145126 (= (apply!123 (+!170 lt!76131 (tuple2!2685 lt!76148 (minValue!2834 newMap!16))) lt!76144) (apply!123 lt!76131 lt!76144))))

(declare-fun b!145127 () Bool)

(declare-fun res!69055 () Bool)

(declare-fun e!94563 () Bool)

(assert (=> b!145127 (=> (not res!69055) (not e!94563))))

(declare-fun e!94564 () Bool)

(assert (=> b!145127 (= res!69055 e!94564)))

(declare-fun res!69060 () Bool)

(assert (=> b!145127 (=> res!69060 e!94564)))

(declare-fun e!94565 () Bool)

(assert (=> b!145127 (= res!69060 (not e!94565))))

(declare-fun res!69058 () Bool)

(assert (=> b!145127 (=> (not res!69058) (not e!94565))))

(assert (=> b!145127 (= res!69058 (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(declare-fun b!145128 () Bool)

(declare-fun e!94554 () ListLongMap!1725)

(assert (=> b!145128 (= e!94554 call!16205)))

(declare-fun b!145129 () Bool)

(declare-fun Unit!4590 () Unit!4581)

(assert (=> b!145129 (= e!94562 Unit!4590)))

(declare-fun b!145130 () Bool)

(declare-fun e!94559 () Bool)

(declare-fun e!94557 () Bool)

(assert (=> b!145130 (= e!94559 e!94557)))

(declare-fun res!69061 () Bool)

(declare-fun call!16202 () Bool)

(assert (=> b!145130 (= res!69061 call!16202)))

(assert (=> b!145130 (=> (not res!69061) (not e!94557))))

(declare-fun b!145131 () Bool)

(declare-fun e!94561 () Bool)

(assert (=> b!145131 (= e!94561 (validKeyInArray!0 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!16196 () Bool)

(declare-fun call!16201 () ListLongMap!1725)

(declare-fun call!16199 () ListLongMap!1725)

(assert (=> bm!16196 (= call!16201 call!16199)))

(declare-fun b!145132 () Bool)

(declare-fun lt!76135 () ListLongMap!1725)

(assert (=> b!145132 (= e!94557 (= (apply!123 lt!76135 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2834 newMap!16)))))

(declare-fun b!145133 () Bool)

(declare-fun e!94566 () ListLongMap!1725)

(assert (=> b!145133 (= e!94566 e!94554)))

(declare-fun c!27518 () Bool)

(assert (=> b!145133 (= c!27518 (and (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!145134 () Bool)

(assert (=> b!145134 (= e!94565 (validKeyInArray!0 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145135 () Bool)

(declare-fun e!94555 () Bool)

(declare-fun call!16203 () Bool)

(assert (=> b!145135 (= e!94555 (not call!16203))))

(declare-fun b!145136 () Bool)

(declare-fun e!94558 () Bool)

(assert (=> b!145136 (= e!94564 e!94558)))

(declare-fun res!69056 () Bool)

(assert (=> b!145136 (=> (not res!69056) (not e!94558))))

(assert (=> b!145136 (= res!69056 (contains!924 lt!76135 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!145136 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(declare-fun b!145137 () Bool)

(declare-fun res!69059 () Bool)

(assert (=> b!145137 (=> (not res!69059) (not e!94563))))

(assert (=> b!145137 (= res!69059 e!94559)))

(declare-fun c!27522 () Bool)

(assert (=> b!145137 (= c!27522 (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!46177 () Bool)

(assert (=> d!46177 e!94563))

(declare-fun res!69054 () Bool)

(assert (=> d!46177 (=> (not res!69054) (not e!94563))))

(assert (=> d!46177 (= res!69054 (or (bvsge #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))))

(declare-fun lt!76146 () ListLongMap!1725)

(assert (=> d!46177 (= lt!76135 lt!76146)))

(declare-fun lt!76137 () Unit!4581)

(assert (=> d!46177 (= lt!76137 e!94562)))

(declare-fun c!27519 () Bool)

(assert (=> d!46177 (= c!27519 e!94561)))

(declare-fun res!69057 () Bool)

(assert (=> d!46177 (=> (not res!69057) (not e!94561))))

(assert (=> d!46177 (= res!69057 (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(assert (=> d!46177 (= lt!76146 e!94566)))

(declare-fun c!27523 () Bool)

(assert (=> d!46177 (= c!27523 (and (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46177 (validMask!0 (mask!7351 newMap!16))))

(assert (=> d!46177 (= (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) lt!76135)))

(declare-fun b!145138 () Bool)

(declare-fun call!16200 () ListLongMap!1725)

(assert (=> b!145138 (= e!94566 (+!170 call!16200 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 newMap!16))))))

(declare-fun b!145139 () Bool)

(assert (=> b!145139 (= e!94559 (not call!16202))))

(declare-fun b!145140 () Bool)

(declare-fun e!94560 () Bool)

(assert (=> b!145140 (= e!94555 e!94560)))

(declare-fun res!69053 () Bool)

(assert (=> b!145140 (= res!69053 call!16203)))

(assert (=> b!145140 (=> (not res!69053) (not e!94560))))

(declare-fun b!145141 () Bool)

(assert (=> b!145141 (= e!94558 (= (apply!123 lt!76135 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)) (get!1545 (select (arr!2321 (_values!2971 newMap!16)) #b00000000000000000000000000000000) (dynLambda!441 (defaultEntry!2988 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2597 (_values!2971 newMap!16))))))

(assert (=> b!145141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(declare-fun b!145142 () Bool)

(assert (=> b!145142 (= e!94556 call!16201)))

(declare-fun b!145143 () Bool)

(assert (=> b!145143 (= e!94560 (= (apply!123 lt!76135 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2834 newMap!16)))))

(declare-fun bm!16197 () Bool)

(declare-fun call!16204 () ListLongMap!1725)

(assert (=> bm!16197 (= call!16204 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun bm!16198 () Bool)

(assert (=> bm!16198 (= call!16200 (+!170 (ite c!27523 call!16204 (ite c!27518 call!16199 call!16201)) (ite (or c!27523 c!27518) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2834 newMap!16)) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 newMap!16)))))))

(declare-fun bm!16199 () Bool)

(assert (=> bm!16199 (= call!16205 call!16200)))

(declare-fun bm!16200 () Bool)

(assert (=> bm!16200 (= call!16199 call!16204)))

(declare-fun b!145144 () Bool)

(assert (=> b!145144 (= e!94563 e!94555)))

(declare-fun c!27521 () Bool)

(assert (=> b!145144 (= c!27521 (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16201 () Bool)

(assert (=> bm!16201 (= call!16202 (contains!924 lt!76135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145145 () Bool)

(declare-fun c!27520 () Bool)

(assert (=> b!145145 (= c!27520 (and (not (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!145145 (= e!94554 e!94556)))

(declare-fun bm!16202 () Bool)

(assert (=> bm!16202 (= call!16203 (contains!924 lt!76135 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46177 c!27523) b!145138))

(assert (= (and d!46177 (not c!27523)) b!145133))

(assert (= (and b!145133 c!27518) b!145128))

(assert (= (and b!145133 (not c!27518)) b!145145))

(assert (= (and b!145145 c!27520) b!145125))

(assert (= (and b!145145 (not c!27520)) b!145142))

(assert (= (or b!145125 b!145142) bm!16196))

(assert (= (or b!145128 bm!16196) bm!16200))

(assert (= (or b!145128 b!145125) bm!16199))

(assert (= (or b!145138 bm!16200) bm!16197))

(assert (= (or b!145138 bm!16199) bm!16198))

(assert (= (and d!46177 res!69057) b!145131))

(assert (= (and d!46177 c!27519) b!145126))

(assert (= (and d!46177 (not c!27519)) b!145129))

(assert (= (and d!46177 res!69054) b!145127))

(assert (= (and b!145127 res!69058) b!145134))

(assert (= (and b!145127 (not res!69060)) b!145136))

(assert (= (and b!145136 res!69056) b!145141))

(assert (= (and b!145127 res!69055) b!145137))

(assert (= (and b!145137 c!27522) b!145130))

(assert (= (and b!145137 (not c!27522)) b!145139))

(assert (= (and b!145130 res!69061) b!145132))

(assert (= (or b!145130 b!145139) bm!16201))

(assert (= (and b!145137 res!69059) b!145144))

(assert (= (and b!145144 c!27521) b!145140))

(assert (= (and b!145144 (not c!27521)) b!145135))

(assert (= (and b!145140 res!69053) b!145143))

(assert (= (or b!145140 b!145135) bm!16202))

(declare-fun b_lambda!6495 () Bool)

(assert (=> (not b_lambda!6495) (not b!145141)))

(assert (=> b!145141 t!6400))

(declare-fun b_and!9025 () Bool)

(assert (= b_and!9021 (and (=> t!6400 result!4267) b_and!9025)))

(assert (=> b!145141 t!6402))

(declare-fun b_and!9027 () Bool)

(assert (= b_and!9023 (and (=> t!6402 result!4269) b_and!9027)))

(assert (=> d!46177 m!174577))

(declare-fun m!174657 () Bool)

(assert (=> bm!16197 m!174657))

(declare-fun m!174659 () Bool)

(assert (=> bm!16202 m!174659))

(declare-fun m!174661 () Bool)

(assert (=> b!145138 m!174661))

(declare-fun m!174663 () Bool)

(assert (=> bm!16201 m!174663))

(declare-fun m!174665 () Bool)

(assert (=> bm!16198 m!174665))

(declare-fun m!174667 () Bool)

(assert (=> b!145132 m!174667))

(declare-fun m!174669 () Bool)

(assert (=> b!145141 m!174669))

(assert (=> b!145141 m!174593))

(declare-fun m!174671 () Bool)

(assert (=> b!145141 m!174671))

(assert (=> b!145141 m!174593))

(assert (=> b!145141 m!174669))

(assert (=> b!145141 m!174597))

(declare-fun m!174673 () Bool)

(assert (=> b!145141 m!174673))

(assert (=> b!145141 m!174597))

(assert (=> b!145136 m!174593))

(assert (=> b!145136 m!174593))

(declare-fun m!174675 () Bool)

(assert (=> b!145136 m!174675))

(declare-fun m!174677 () Bool)

(assert (=> b!145143 m!174677))

(assert (=> b!145134 m!174593))

(assert (=> b!145134 m!174593))

(assert (=> b!145134 m!174605))

(declare-fun m!174679 () Bool)

(assert (=> b!145126 m!174679))

(assert (=> b!145126 m!174657))

(assert (=> b!145126 m!174593))

(assert (=> b!145126 m!174679))

(declare-fun m!174681 () Bool)

(assert (=> b!145126 m!174681))

(declare-fun m!174683 () Bool)

(assert (=> b!145126 m!174683))

(declare-fun m!174685 () Bool)

(assert (=> b!145126 m!174685))

(declare-fun m!174687 () Bool)

(assert (=> b!145126 m!174687))

(declare-fun m!174689 () Bool)

(assert (=> b!145126 m!174689))

(declare-fun m!174691 () Bool)

(assert (=> b!145126 m!174691))

(declare-fun m!174693 () Bool)

(assert (=> b!145126 m!174693))

(assert (=> b!145126 m!174685))

(assert (=> b!145126 m!174683))

(declare-fun m!174695 () Bool)

(assert (=> b!145126 m!174695))

(assert (=> b!145126 m!174689))

(declare-fun m!174697 () Bool)

(assert (=> b!145126 m!174697))

(declare-fun m!174699 () Bool)

(assert (=> b!145126 m!174699))

(declare-fun m!174701 () Bool)

(assert (=> b!145126 m!174701))

(declare-fun m!174703 () Bool)

(assert (=> b!145126 m!174703))

(declare-fun m!174705 () Bool)

(assert (=> b!145126 m!174705))

(declare-fun m!174707 () Bool)

(assert (=> b!145126 m!174707))

(assert (=> b!145131 m!174593))

(assert (=> b!145131 m!174593))

(assert (=> b!145131 m!174605))

(assert (=> b!145060 d!46177))

(declare-fun b!145146 () Bool)

(declare-fun e!94569 () Bool)

(declare-fun call!16206 () Bool)

(assert (=> b!145146 (= e!94569 call!16206)))

(declare-fun d!46179 () Bool)

(declare-fun res!69062 () Bool)

(declare-fun e!94570 () Bool)

(assert (=> d!46179 (=> res!69062 e!94570)))

(assert (=> d!46179 (= res!69062 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(assert (=> d!46179 (= (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (ite c!27459 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75877) lt!75877)) e!94570)))

(declare-fun b!145147 () Bool)

(assert (=> b!145147 (= e!94569 call!16206)))

(declare-fun e!94567 () Bool)

(declare-fun b!145148 () Bool)

(assert (=> b!145148 (= e!94567 (contains!923 (ite c!27459 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75877) lt!75877) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun c!27524 () Bool)

(declare-fun bm!16203 () Bool)

(assert (=> bm!16203 (= call!16206 (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!27524 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (ite c!27459 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75877) lt!75877)) (ite c!27459 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75877) lt!75877))))))

(declare-fun b!145149 () Bool)

(declare-fun e!94568 () Bool)

(assert (=> b!145149 (= e!94568 e!94569)))

(assert (=> b!145149 (= c!27524 (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!145150 () Bool)

(assert (=> b!145150 (= e!94570 e!94568)))

(declare-fun res!69064 () Bool)

(assert (=> b!145150 (=> (not res!69064) (not e!94568))))

(assert (=> b!145150 (= res!69064 (not e!94567))))

(declare-fun res!69063 () Bool)

(assert (=> b!145150 (=> (not res!69063) (not e!94567))))

(assert (=> b!145150 (= res!69063 (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!46179 (not res!69062)) b!145150))

(assert (= (and b!145150 res!69063) b!145148))

(assert (= (and b!145150 res!69064) b!145149))

(assert (= (and b!145149 c!27524) b!145146))

(assert (= (and b!145149 (not c!27524)) b!145147))

(assert (= (or b!145146 b!145147) bm!16203))

(declare-fun m!174709 () Bool)

(assert (=> b!145148 m!174709))

(assert (=> b!145148 m!174709))

(declare-fun m!174711 () Bool)

(assert (=> b!145148 m!174711))

(assert (=> bm!16203 m!174709))

(declare-fun m!174713 () Bool)

(assert (=> bm!16203 m!174713))

(assert (=> b!145149 m!174709))

(assert (=> b!145149 m!174709))

(declare-fun m!174715 () Bool)

(assert (=> b!145149 m!174715))

(assert (=> b!145150 m!174709))

(assert (=> b!145150 m!174709))

(assert (=> b!145150 m!174715))

(assert (=> bm!16115 d!46179))

(declare-fun d!46181 () Bool)

(assert (=> d!46181 (= (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) (and (not (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144924 d!46181))

(declare-fun d!46183 () Bool)

(declare-fun get!1549 (Option!183) V!3577)

(assert (=> d!46183 (= (apply!123 lt!75968 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1549 (getValueByKey!177 (toList!878 lt!75968) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6094 () Bool)

(assert (= bs!6094 d!46183))

(declare-fun m!174717 () Bool)

(assert (=> bs!6094 m!174717))

(assert (=> bs!6094 m!174717))

(declare-fun m!174719 () Bool)

(assert (=> bs!6094 m!174719))

(assert (=> b!144882 d!46183))

(declare-fun d!46185 () Bool)

(assert (=> d!46185 (= (+!170 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) lt!76065 (zeroValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76152 () Unit!4581)

(declare-fun choose!897 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 V!3577 Int) Unit!4581)

(assert (=> d!46185 (= lt!76152 (choose!897 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) lt!76065 (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46185 (validMask!0 (mask!7351 newMap!16))))

(assert (=> d!46185 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!68 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) lt!76065 (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)) lt!76152)))

(declare-fun bs!6095 () Bool)

(assert (= bs!6095 d!46185))

(assert (=> bs!6095 m!174381))

(assert (=> bs!6095 m!174251))

(declare-fun m!174721 () Bool)

(assert (=> bs!6095 m!174721))

(assert (=> bs!6095 m!174381))

(declare-fun m!174723 () Bool)

(assert (=> bs!6095 m!174723))

(assert (=> bs!6095 m!174577))

(assert (=> bs!6095 m!174251))

(declare-fun m!174725 () Bool)

(assert (=> bs!6095 m!174725))

(assert (=> b!145059 d!46185))

(declare-fun d!46187 () Bool)

(assert (=> d!46187 (= (inRange!0 (ite c!27495 (ite c!27503 (index!3307 lt!76067) (ite c!27506 (index!3306 lt!76069) (index!3309 lt!76069))) (ite c!27507 (index!3307 lt!76058) (ite c!27504 (index!3306 lt!76083) (index!3309 lt!76083)))) (mask!7351 newMap!16)) (and (bvsge (ite c!27495 (ite c!27503 (index!3307 lt!76067) (ite c!27506 (index!3306 lt!76069) (index!3309 lt!76069))) (ite c!27507 (index!3307 lt!76058) (ite c!27504 (index!3306 lt!76083) (index!3309 lt!76083)))) #b00000000000000000000000000000000) (bvslt (ite c!27495 (ite c!27503 (index!3307 lt!76067) (ite c!27506 (index!3306 lt!76069) (index!3309 lt!76069))) (ite c!27507 (index!3307 lt!76058) (ite c!27504 (index!3306 lt!76083) (index!3309 lt!76083)))) (bvadd (mask!7351 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!16177 d!46187))

(declare-fun d!46189 () Bool)

(declare-fun lt!76153 () Bool)

(assert (=> d!46189 (= lt!76153 (select (content!141 Nil!1751) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun e!94571 () Bool)

(assert (=> d!46189 (= lt!76153 e!94571)))

(declare-fun res!69066 () Bool)

(assert (=> d!46189 (=> (not res!69066) (not e!94571))))

(assert (=> d!46189 (= res!69066 ((_ is Cons!1750) Nil!1751))))

(assert (=> d!46189 (= (contains!923 Nil!1751 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) lt!76153)))

(declare-fun b!145151 () Bool)

(declare-fun e!94572 () Bool)

(assert (=> b!145151 (= e!94571 e!94572)))

(declare-fun res!69065 () Bool)

(assert (=> b!145151 (=> res!69065 e!94572)))

(assert (=> b!145151 (= res!69065 (= (h!2358 Nil!1751) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!145152 () Bool)

(assert (=> b!145152 (= e!94572 (contains!923 (t!6386 Nil!1751) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (= (and d!46189 res!69066) b!145151))

(assert (= (and b!145151 (not res!69065)) b!145152))

(declare-fun m!174727 () Bool)

(assert (=> d!46189 m!174727))

(assert (=> d!46189 m!174253))

(declare-fun m!174729 () Bool)

(assert (=> d!46189 m!174729))

(assert (=> b!145152 m!174253))

(declare-fun m!174731 () Bool)

(assert (=> b!145152 m!174731))

(assert (=> b!144923 d!46189))

(declare-fun d!46191 () Bool)

(assert (=> d!46191 (= (apply!123 lt!75968 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1549 (getValueByKey!177 (toList!878 lt!75968) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6096 () Bool)

(assert (= bs!6096 d!46191))

(assert (=> bs!6096 m!174399))

(declare-fun m!174733 () Bool)

(assert (=> bs!6096 m!174733))

(assert (=> bs!6096 m!174733))

(declare-fun m!174735 () Bool)

(assert (=> bs!6096 m!174735))

(assert (=> b!144880 d!46191))

(declare-fun d!46193 () Bool)

(declare-fun c!27525 () Bool)

(assert (=> d!46193 (= c!27525 ((_ is ValueCellFull!1130) (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!94573 () V!3577)

(assert (=> d!46193 (= (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!94573)))

(declare-fun b!145153 () Bool)

(assert (=> b!145153 (= e!94573 (get!1547 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!145154 () Bool)

(assert (=> b!145154 (= e!94573 (get!1548 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46193 c!27525) b!145153))

(assert (= (and d!46193 (not c!27525)) b!145154))

(assert (=> b!145153 m!174397))

(assert (=> b!145153 m!174249))

(declare-fun m!174737 () Bool)

(assert (=> b!145153 m!174737))

(assert (=> b!145154 m!174397))

(assert (=> b!145154 m!174249))

(declare-fun m!174739 () Bool)

(assert (=> b!145154 m!174739))

(assert (=> b!144880 d!46193))

(declare-fun d!46195 () Bool)

(declare-fun e!94575 () Bool)

(assert (=> d!46195 e!94575))

(declare-fun res!69067 () Bool)

(assert (=> d!46195 (=> res!69067 e!94575)))

(declare-fun lt!76155 () Bool)

(assert (=> d!46195 (= res!69067 (not lt!76155))))

(declare-fun lt!76154 () Bool)

(assert (=> d!46195 (= lt!76155 lt!76154)))

(declare-fun lt!76157 () Unit!4581)

(declare-fun e!94574 () Unit!4581)

(assert (=> d!46195 (= lt!76157 e!94574)))

(declare-fun c!27526 () Bool)

(assert (=> d!46195 (= c!27526 lt!76154)))

(assert (=> d!46195 (= lt!76154 (containsKey!181 (toList!878 lt!75968) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46195 (= (contains!924 lt!75968 #b1000000000000000000000000000000000000000000000000000000000000000) lt!76155)))

(declare-fun b!145155 () Bool)

(declare-fun lt!76156 () Unit!4581)

(assert (=> b!145155 (= e!94574 lt!76156)))

(assert (=> b!145155 (= lt!76156 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!878 lt!75968) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145155 (isDefined!131 (getValueByKey!177 (toList!878 lt!75968) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145156 () Bool)

(declare-fun Unit!4591 () Unit!4581)

(assert (=> b!145156 (= e!94574 Unit!4591)))

(declare-fun b!145157 () Bool)

(assert (=> b!145157 (= e!94575 (isDefined!131 (getValueByKey!177 (toList!878 lt!75968) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46195 c!27526) b!145155))

(assert (= (and d!46195 (not c!27526)) b!145156))

(assert (= (and d!46195 (not res!69067)) b!145157))

(declare-fun m!174741 () Bool)

(assert (=> d!46195 m!174741))

(declare-fun m!174743 () Bool)

(assert (=> b!145155 m!174743))

(assert (=> b!145155 m!174717))

(assert (=> b!145155 m!174717))

(declare-fun m!174745 () Bool)

(assert (=> b!145155 m!174745))

(assert (=> b!145157 m!174717))

(assert (=> b!145157 m!174717))

(assert (=> b!145157 m!174745))

(assert (=> bm!16112 d!46195))

(declare-fun d!46197 () Bool)

(declare-fun e!94577 () Bool)

(assert (=> d!46197 e!94577))

(declare-fun res!69068 () Bool)

(assert (=> d!46197 (=> res!69068 e!94577)))

(declare-fun lt!76159 () Bool)

(assert (=> d!46197 (= res!69068 (not lt!76159))))

(declare-fun lt!76158 () Bool)

(assert (=> d!46197 (= lt!76159 lt!76158)))

(declare-fun lt!76161 () Unit!4581)

(declare-fun e!94576 () Unit!4581)

(assert (=> d!46197 (= lt!76161 e!94576)))

(declare-fun c!27527 () Bool)

(assert (=> d!46197 (= c!27527 lt!76158)))

(assert (=> d!46197 (= lt!76158 (containsKey!181 (toList!878 lt!75968) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46197 (= (contains!924 lt!75968 #b0000000000000000000000000000000000000000000000000000000000000000) lt!76159)))

(declare-fun b!145158 () Bool)

(declare-fun lt!76160 () Unit!4581)

(assert (=> b!145158 (= e!94576 lt!76160)))

(assert (=> b!145158 (= lt!76160 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!878 lt!75968) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145158 (isDefined!131 (getValueByKey!177 (toList!878 lt!75968) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145159 () Bool)

(declare-fun Unit!4592 () Unit!4581)

(assert (=> b!145159 (= e!94576 Unit!4592)))

(declare-fun b!145160 () Bool)

(assert (=> b!145160 (= e!94577 (isDefined!131 (getValueByKey!177 (toList!878 lt!75968) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46197 c!27527) b!145158))

(assert (= (and d!46197 (not c!27527)) b!145159))

(assert (= (and d!46197 (not res!69068)) b!145160))

(declare-fun m!174747 () Bool)

(assert (=> d!46197 m!174747))

(declare-fun m!174749 () Bool)

(assert (=> b!145158 m!174749))

(declare-fun m!174751 () Bool)

(assert (=> b!145158 m!174751))

(assert (=> b!145158 m!174751))

(declare-fun m!174753 () Bool)

(assert (=> b!145158 m!174753))

(assert (=> b!145160 m!174751))

(assert (=> b!145160 m!174751))

(assert (=> b!145160 m!174753))

(assert (=> bm!16111 d!46197))

(declare-fun d!46199 () Bool)

(declare-fun e!94579 () Bool)

(assert (=> d!46199 e!94579))

(declare-fun res!69069 () Bool)

(assert (=> d!46199 (=> res!69069 e!94579)))

(declare-fun lt!76163 () Bool)

(assert (=> d!46199 (= res!69069 (not lt!76163))))

(declare-fun lt!76162 () Bool)

(assert (=> d!46199 (= lt!76163 lt!76162)))

(declare-fun lt!76165 () Unit!4581)

(declare-fun e!94578 () Unit!4581)

(assert (=> d!46199 (= lt!76165 e!94578)))

(declare-fun c!27528 () Bool)

(assert (=> d!46199 (= c!27528 lt!76162)))

(assert (=> d!46199 (= lt!76162 (containsKey!181 (toList!878 e!94516) (ite c!27495 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (select (arr!2320 (_keys!4754 newMap!16)) (index!3307 lt!76060)))))))

(assert (=> d!46199 (= (contains!924 e!94516 (ite c!27495 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (select (arr!2320 (_keys!4754 newMap!16)) (index!3307 lt!76060)))) lt!76163)))

(declare-fun b!145161 () Bool)

(declare-fun lt!76164 () Unit!4581)

(assert (=> b!145161 (= e!94578 lt!76164)))

(assert (=> b!145161 (= lt!76164 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!878 e!94516) (ite c!27495 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (select (arr!2320 (_keys!4754 newMap!16)) (index!3307 lt!76060)))))))

(assert (=> b!145161 (isDefined!131 (getValueByKey!177 (toList!878 e!94516) (ite c!27495 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (select (arr!2320 (_keys!4754 newMap!16)) (index!3307 lt!76060)))))))

(declare-fun b!145162 () Bool)

(declare-fun Unit!4593 () Unit!4581)

(assert (=> b!145162 (= e!94578 Unit!4593)))

(declare-fun b!145163 () Bool)

(assert (=> b!145163 (= e!94579 (isDefined!131 (getValueByKey!177 (toList!878 e!94516) (ite c!27495 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (select (arr!2320 (_keys!4754 newMap!16)) (index!3307 lt!76060))))))))

(assert (= (and d!46199 c!27528) b!145161))

(assert (= (and d!46199 (not c!27528)) b!145162))

(assert (= (and d!46199 (not res!69069)) b!145163))

(declare-fun m!174755 () Bool)

(assert (=> d!46199 m!174755))

(declare-fun m!174757 () Bool)

(assert (=> b!145161 m!174757))

(declare-fun m!174759 () Bool)

(assert (=> b!145161 m!174759))

(assert (=> b!145161 m!174759))

(declare-fun m!174761 () Bool)

(assert (=> b!145161 m!174761))

(assert (=> b!145163 m!174759))

(assert (=> b!145163 m!174759))

(assert (=> b!145163 m!174761))

(assert (=> bm!16169 d!46199))

(declare-fun d!46201 () Bool)

(assert (=> d!46201 (= (get!1547 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3313 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!145077 d!46201))

(declare-fun bm!16208 () Bool)

(declare-fun call!16212 () Bool)

(assert (=> bm!16208 (= call!16212 (arrayContainsKey!0 (_keys!4754 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!145180 () Bool)

(declare-fun e!94591 () Bool)

(assert (=> b!145180 (= e!94591 (not call!16212))))

(declare-fun b!145181 () Bool)

(declare-fun e!94589 () Bool)

(declare-fun e!94590 () Bool)

(assert (=> b!145181 (= e!94589 e!94590)))

(declare-fun c!27534 () Bool)

(declare-fun lt!76170 () SeekEntryResult!285)

(assert (=> b!145181 (= c!27534 ((_ is MissingVacant!285) lt!76170))))

(declare-fun b!145182 () Bool)

(declare-fun e!94588 () Bool)

(assert (=> b!145182 (= e!94588 (not call!16212))))

(declare-fun b!145183 () Bool)

(assert (=> b!145183 (= e!94590 ((_ is Undefined!285) lt!76170))))

(declare-fun bm!16209 () Bool)

(declare-fun c!27533 () Bool)

(declare-fun call!16211 () Bool)

(assert (=> bm!16209 (= call!16211 (inRange!0 (ite c!27533 (index!3306 lt!76170) (index!3309 lt!76170)) (mask!7351 newMap!16)))))

(declare-fun b!145185 () Bool)

(assert (=> b!145185 (and (bvsge (index!3306 lt!76170) #b00000000000000000000000000000000) (bvslt (index!3306 lt!76170) (size!2596 (_keys!4754 newMap!16))))))

(declare-fun res!69080 () Bool)

(assert (=> b!145185 (= res!69080 (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3306 lt!76170)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145185 (=> (not res!69080) (not e!94588))))

(declare-fun b!145186 () Bool)

(assert (=> b!145186 (= e!94589 e!94588)))

(declare-fun res!69079 () Bool)

(assert (=> b!145186 (= res!69079 call!16211)))

(assert (=> b!145186 (=> (not res!69079) (not e!94588))))

(declare-fun b!145187 () Bool)

(declare-fun res!69081 () Bool)

(assert (=> b!145187 (=> (not res!69081) (not e!94591))))

(assert (=> b!145187 (= res!69081 (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3309 lt!76170)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145187 (and (bvsge (index!3309 lt!76170) #b00000000000000000000000000000000) (bvslt (index!3309 lt!76170) (size!2596 (_keys!4754 newMap!16))))))

(declare-fun d!46203 () Bool)

(assert (=> d!46203 e!94589))

(assert (=> d!46203 (= c!27533 ((_ is MissingZero!285) lt!76170))))

(assert (=> d!46203 (= lt!76170 (seekEntryOrOpen!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (_keys!4754 newMap!16) (mask!7351 newMap!16)))))

(declare-fun lt!76171 () Unit!4581)

(declare-fun choose!898 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) Int) Unit!4581)

(assert (=> d!46203 (= lt!76171 (choose!898 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46203 (validMask!0 (mask!7351 newMap!16))))

(assert (=> d!46203 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!68 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)) lt!76171)))

(declare-fun b!145184 () Bool)

(declare-fun res!69078 () Bool)

(assert (=> b!145184 (=> (not res!69078) (not e!94591))))

(assert (=> b!145184 (= res!69078 call!16211)))

(assert (=> b!145184 (= e!94590 e!94591)))

(assert (= (and d!46203 c!27533) b!145186))

(assert (= (and d!46203 (not c!27533)) b!145181))

(assert (= (and b!145186 res!69079) b!145185))

(assert (= (and b!145185 res!69080) b!145182))

(assert (= (and b!145181 c!27534) b!145184))

(assert (= (and b!145181 (not c!27534)) b!145183))

(assert (= (and b!145184 res!69078) b!145187))

(assert (= (and b!145187 res!69081) b!145180))

(assert (= (or b!145186 b!145184) bm!16209))

(assert (= (or b!145182 b!145180) bm!16208))

(assert (=> bm!16208 m!174253))

(assert (=> bm!16208 m!174507))

(declare-fun m!174763 () Bool)

(assert (=> bm!16209 m!174763))

(declare-fun m!174765 () Bool)

(assert (=> b!145187 m!174765))

(assert (=> d!46203 m!174253))

(assert (=> d!46203 m!174495))

(assert (=> d!46203 m!174253))

(declare-fun m!174767 () Bool)

(assert (=> d!46203 m!174767))

(assert (=> d!46203 m!174577))

(declare-fun m!174769 () Bool)

(assert (=> b!145185 m!174769))

(assert (=> bm!16173 d!46203))

(assert (=> b!144873 d!46171))

(assert (=> d!46125 d!46177))

(declare-fun e!94598 () SeekEntryResult!285)

(declare-fun lt!76179 () SeekEntryResult!285)

(declare-fun b!145200 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4915 (_ BitVec 32)) SeekEntryResult!285)

(assert (=> b!145200 (= e!94598 (seekKeyOrZeroReturnVacant!0 (x!16516 lt!76179) (index!3308 lt!76179) (index!3308 lt!76179) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (_keys!4754 newMap!16) (mask!7351 newMap!16)))))

(declare-fun b!145201 () Bool)

(declare-fun e!94600 () SeekEntryResult!285)

(declare-fun e!94599 () SeekEntryResult!285)

(assert (=> b!145201 (= e!94600 e!94599)))

(declare-fun lt!76180 () (_ BitVec 64))

(assert (=> b!145201 (= lt!76180 (select (arr!2320 (_keys!4754 newMap!16)) (index!3308 lt!76179)))))

(declare-fun c!27541 () Bool)

(assert (=> b!145201 (= c!27541 (= lt!76180 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!145202 () Bool)

(assert (=> b!145202 (= e!94600 Undefined!285)))

(declare-fun lt!76178 () SeekEntryResult!285)

(declare-fun d!46205 () Bool)

(assert (=> d!46205 (and (or ((_ is Undefined!285) lt!76178) (not ((_ is Found!285) lt!76178)) (and (bvsge (index!3307 lt!76178) #b00000000000000000000000000000000) (bvslt (index!3307 lt!76178) (size!2596 (_keys!4754 newMap!16))))) (or ((_ is Undefined!285) lt!76178) ((_ is Found!285) lt!76178) (not ((_ is MissingZero!285) lt!76178)) (and (bvsge (index!3306 lt!76178) #b00000000000000000000000000000000) (bvslt (index!3306 lt!76178) (size!2596 (_keys!4754 newMap!16))))) (or ((_ is Undefined!285) lt!76178) ((_ is Found!285) lt!76178) ((_ is MissingZero!285) lt!76178) (not ((_ is MissingVacant!285) lt!76178)) (and (bvsge (index!3309 lt!76178) #b00000000000000000000000000000000) (bvslt (index!3309 lt!76178) (size!2596 (_keys!4754 newMap!16))))) (or ((_ is Undefined!285) lt!76178) (ite ((_ is Found!285) lt!76178) (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3307 lt!76178)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) (ite ((_ is MissingZero!285) lt!76178) (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3306 lt!76178)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!285) lt!76178) (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3309 lt!76178)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46205 (= lt!76178 e!94600)))

(declare-fun c!27542 () Bool)

(assert (=> d!46205 (= c!27542 (and ((_ is Intermediate!285) lt!76179) (undefined!1097 lt!76179)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4915 (_ BitVec 32)) SeekEntryResult!285)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!46205 (= lt!76179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (mask!7351 newMap!16)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (_keys!4754 newMap!16) (mask!7351 newMap!16)))))

(assert (=> d!46205 (validMask!0 (mask!7351 newMap!16))))

(assert (=> d!46205 (= (seekEntryOrOpen!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (_keys!4754 newMap!16) (mask!7351 newMap!16)) lt!76178)))

(declare-fun b!145203 () Bool)

(assert (=> b!145203 (= e!94598 (MissingZero!285 (index!3308 lt!76179)))))

(declare-fun b!145204 () Bool)

(assert (=> b!145204 (= e!94599 (Found!285 (index!3308 lt!76179)))))

(declare-fun b!145205 () Bool)

(declare-fun c!27543 () Bool)

(assert (=> b!145205 (= c!27543 (= lt!76180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145205 (= e!94599 e!94598)))

(assert (= (and d!46205 c!27542) b!145202))

(assert (= (and d!46205 (not c!27542)) b!145201))

(assert (= (and b!145201 c!27541) b!145204))

(assert (= (and b!145201 (not c!27541)) b!145205))

(assert (= (and b!145205 c!27543) b!145203))

(assert (= (and b!145205 (not c!27543)) b!145200))

(assert (=> b!145200 m!174253))

(declare-fun m!174771 () Bool)

(assert (=> b!145200 m!174771))

(declare-fun m!174773 () Bool)

(assert (=> b!145201 m!174773))

(declare-fun m!174775 () Bool)

(assert (=> d!46205 m!174775))

(declare-fun m!174777 () Bool)

(assert (=> d!46205 m!174777))

(assert (=> d!46205 m!174253))

(declare-fun m!174779 () Bool)

(assert (=> d!46205 m!174779))

(assert (=> d!46205 m!174577))

(assert (=> d!46205 m!174253))

(assert (=> d!46205 m!174777))

(declare-fun m!174781 () Bool)

(assert (=> d!46205 m!174781))

(declare-fun m!174783 () Bool)

(assert (=> d!46205 m!174783))

(assert (=> b!145066 d!46205))

(declare-fun d!46207 () Bool)

(assert (=> d!46207 (= (apply!123 lt!75968 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1549 (getValueByKey!177 (toList!878 lt!75968) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6097 () Bool)

(assert (= bs!6097 d!46207))

(assert (=> bs!6097 m!174751))

(assert (=> bs!6097 m!174751))

(declare-fun m!174785 () Bool)

(assert (=> bs!6097 m!174785))

(assert (=> b!144871 d!46207))

(declare-fun b!145206 () Bool)

(declare-fun e!94603 () Bool)

(declare-fun call!16213 () Bool)

(assert (=> b!145206 (= e!94603 call!16213)))

(declare-fun d!46209 () Bool)

(declare-fun res!69082 () Bool)

(declare-fun e!94604 () Bool)

(assert (=> d!46209 (=> res!69082 e!94604)))

(assert (=> d!46209 (= res!69082 (bvsge #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(assert (=> d!46209 (= (arrayNoDuplicates!0 (_keys!4754 newMap!16) #b00000000000000000000000000000000 Nil!1751) e!94604)))

(declare-fun b!145207 () Bool)

(assert (=> b!145207 (= e!94603 call!16213)))

(declare-fun b!145208 () Bool)

(declare-fun e!94601 () Bool)

(assert (=> b!145208 (= e!94601 (contains!923 Nil!1751 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!16210 () Bool)

(declare-fun c!27544 () Bool)

(assert (=> bm!16210 (= call!16213 (arrayNoDuplicates!0 (_keys!4754 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!27544 (Cons!1750 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000) Nil!1751) Nil!1751)))))

(declare-fun b!145209 () Bool)

(declare-fun e!94602 () Bool)

(assert (=> b!145209 (= e!94602 e!94603)))

(assert (=> b!145209 (= c!27544 (validKeyInArray!0 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145210 () Bool)

(assert (=> b!145210 (= e!94604 e!94602)))

(declare-fun res!69084 () Bool)

(assert (=> b!145210 (=> (not res!69084) (not e!94602))))

(assert (=> b!145210 (= res!69084 (not e!94601))))

(declare-fun res!69083 () Bool)

(assert (=> b!145210 (=> (not res!69083) (not e!94601))))

(assert (=> b!145210 (= res!69083 (validKeyInArray!0 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!46209 (not res!69082)) b!145210))

(assert (= (and b!145210 res!69083) b!145208))

(assert (= (and b!145210 res!69084) b!145209))

(assert (= (and b!145209 c!27544) b!145206))

(assert (= (and b!145209 (not c!27544)) b!145207))

(assert (= (or b!145206 b!145207) bm!16210))

(assert (=> b!145208 m!174593))

(assert (=> b!145208 m!174593))

(declare-fun m!174787 () Bool)

(assert (=> b!145208 m!174787))

(assert (=> bm!16210 m!174593))

(declare-fun m!174789 () Bool)

(assert (=> bm!16210 m!174789))

(assert (=> b!145209 m!174593))

(assert (=> b!145209 m!174593))

(assert (=> b!145209 m!174605))

(assert (=> b!145210 m!174593))

(assert (=> b!145210 m!174593))

(assert (=> b!145210 m!174605))

(assert (=> b!144920 d!46209))

(assert (=> b!144870 d!46171))

(declare-fun d!46211 () Bool)

(declare-fun e!94607 () Bool)

(assert (=> d!46211 e!94607))

(declare-fun res!69087 () Bool)

(assert (=> d!46211 (=> (not res!69087) (not e!94607))))

(assert (=> d!46211 (= res!69087 (and (bvsge (index!3307 lt!76060) #b00000000000000000000000000000000) (bvslt (index!3307 lt!76060) (size!2596 (_keys!4754 newMap!16)))))))

(declare-fun lt!76183 () Unit!4581)

(declare-fun choose!899 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) Int) Unit!4581)

(assert (=> d!46211 (= lt!76183 (choose!899 (_keys!4754 newMap!16) lt!76081 (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (index!3307 lt!76060) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46211 (validMask!0 (mask!7351 newMap!16))))

(assert (=> d!46211 (= (lemmaValidKeyInArrayIsInListMap!127 (_keys!4754 newMap!16) lt!76081 (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (index!3307 lt!76060) (defaultEntry!2988 newMap!16)) lt!76183)))

(declare-fun b!145213 () Bool)

(assert (=> b!145213 (= e!94607 (contains!924 (getCurrentListMap!537 (_keys!4754 newMap!16) lt!76081 (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (select (arr!2320 (_keys!4754 newMap!16)) (index!3307 lt!76060))))))

(assert (= (and d!46211 res!69087) b!145213))

(declare-fun m!174791 () Bool)

(assert (=> d!46211 m!174791))

(assert (=> d!46211 m!174577))

(declare-fun m!174793 () Bool)

(assert (=> b!145213 m!174793))

(assert (=> b!145213 m!174485))

(assert (=> b!145213 m!174793))

(assert (=> b!145213 m!174485))

(declare-fun m!174795 () Bool)

(assert (=> b!145213 m!174795))

(assert (=> b!145050 d!46211))

(declare-fun d!46213 () Bool)

(declare-fun e!94610 () Bool)

(assert (=> d!46213 e!94610))

(declare-fun res!69090 () Bool)

(assert (=> d!46213 (=> (not res!69090) (not e!94610))))

(assert (=> d!46213 (= res!69090 (and (bvsge (index!3307 lt!76060) #b00000000000000000000000000000000) (bvslt (index!3307 lt!76060) (size!2597 (_values!2971 newMap!16)))))))

(declare-fun lt!76186 () Unit!4581)

(declare-fun choose!900 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) (_ BitVec 64) V!3577 Int) Unit!4581)

(assert (=> d!46213 (= lt!76186 (choose!900 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (index!3307 lt!76060) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46213 (validMask!0 (mask!7351 newMap!16))))

(assert (=> d!46213 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!68 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (index!3307 lt!76060) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)) lt!76186)))

(declare-fun b!145216 () Bool)

(assert (=> b!145216 (= e!94610 (= (+!170 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!537 (_keys!4754 newMap!16) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (index!3307 lt!76060) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16))) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16))))))

(assert (= (and d!46213 res!69090) b!145216))

(assert (=> d!46213 m!174253))

(assert (=> d!46213 m!174251))

(declare-fun m!174797 () Bool)

(assert (=> d!46213 m!174797))

(assert (=> d!46213 m!174577))

(assert (=> b!145216 m!174381))

(assert (=> b!145216 m!174381))

(declare-fun m!174799 () Bool)

(assert (=> b!145216 m!174799))

(assert (=> b!145216 m!174525))

(declare-fun m!174801 () Bool)

(assert (=> b!145216 m!174801))

(assert (=> b!145050 d!46213))

(declare-fun d!46215 () Bool)

(declare-fun e!94612 () Bool)

(assert (=> d!46215 e!94612))

(declare-fun res!69091 () Bool)

(assert (=> d!46215 (=> res!69091 e!94612)))

(declare-fun lt!76188 () Bool)

(assert (=> d!46215 (= res!69091 (not lt!76188))))

(declare-fun lt!76187 () Bool)

(assert (=> d!46215 (= lt!76188 lt!76187)))

(declare-fun lt!76190 () Unit!4581)

(declare-fun e!94611 () Unit!4581)

(assert (=> d!46215 (= lt!76190 e!94611)))

(declare-fun c!27545 () Bool)

(assert (=> d!46215 (= c!27545 lt!76187)))

(assert (=> d!46215 (= lt!76187 (containsKey!181 (toList!878 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46215 (= (contains!924 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) lt!76188)))

(declare-fun b!145217 () Bool)

(declare-fun lt!76189 () Unit!4581)

(assert (=> b!145217 (= e!94611 lt!76189)))

(assert (=> b!145217 (= lt!76189 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!878 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!145217 (isDefined!131 (getValueByKey!177 (toList!878 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!145218 () Bool)

(declare-fun Unit!4594 () Unit!4581)

(assert (=> b!145218 (= e!94611 Unit!4594)))

(declare-fun b!145219 () Bool)

(assert (=> b!145219 (= e!94612 (isDefined!131 (getValueByKey!177 (toList!878 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355))))))

(assert (= (and d!46215 c!27545) b!145217))

(assert (= (and d!46215 (not c!27545)) b!145218))

(assert (= (and d!46215 (not res!69091)) b!145219))

(assert (=> d!46215 m!174253))

(declare-fun m!174803 () Bool)

(assert (=> d!46215 m!174803))

(assert (=> b!145217 m!174253))

(declare-fun m!174805 () Bool)

(assert (=> b!145217 m!174805))

(assert (=> b!145217 m!174253))

(declare-fun m!174807 () Bool)

(assert (=> b!145217 m!174807))

(assert (=> b!145217 m!174807))

(declare-fun m!174809 () Bool)

(assert (=> b!145217 m!174809))

(assert (=> b!145219 m!174253))

(assert (=> b!145219 m!174807))

(assert (=> b!145219 m!174807))

(assert (=> b!145219 m!174809))

(assert (=> b!145050 d!46215))

(assert (=> b!145050 d!46177))

(declare-fun b!145228 () Bool)

(declare-fun e!94617 () (_ BitVec 32))

(declare-fun call!16216 () (_ BitVec 32))

(assert (=> b!145228 (= e!94617 (bvadd #b00000000000000000000000000000001 call!16216))))

(declare-fun d!46217 () Bool)

(declare-fun lt!76193 () (_ BitVec 32))

(assert (=> d!46217 (and (bvsge lt!76193 #b00000000000000000000000000000000) (bvsle lt!76193 (bvsub (size!2596 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!94618 () (_ BitVec 32))

(assert (=> d!46217 (= lt!76193 e!94618)))

(declare-fun c!27551 () Bool)

(assert (=> d!46217 (= c!27551 (bvsge #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(assert (=> d!46217 (and (bvsle #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2596 (_keys!4754 newMap!16)) (size!2596 (_keys!4754 newMap!16))))))

(assert (=> d!46217 (= (arrayCountValidKeys!0 (_keys!4754 newMap!16) #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))) lt!76193)))

(declare-fun b!145229 () Bool)

(assert (=> b!145229 (= e!94618 e!94617)))

(declare-fun c!27550 () Bool)

(assert (=> b!145229 (= c!27550 (validKeyInArray!0 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145230 () Bool)

(assert (=> b!145230 (= e!94617 call!16216)))

(declare-fun bm!16213 () Bool)

(assert (=> bm!16213 (= call!16216 (arrayCountValidKeys!0 (_keys!4754 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2596 (_keys!4754 newMap!16))))))

(declare-fun b!145231 () Bool)

(assert (=> b!145231 (= e!94618 #b00000000000000000000000000000000)))

(assert (= (and d!46217 c!27551) b!145231))

(assert (= (and d!46217 (not c!27551)) b!145229))

(assert (= (and b!145229 c!27550) b!145228))

(assert (= (and b!145229 (not c!27550)) b!145230))

(assert (= (or b!145228 b!145230) bm!16213))

(assert (=> b!145229 m!174593))

(assert (=> b!145229 m!174593))

(assert (=> b!145229 m!174605))

(declare-fun m!174811 () Bool)

(assert (=> bm!16213 m!174811))

(assert (=> b!144918 d!46217))

(declare-fun d!46219 () Bool)

(declare-fun lt!76194 () Bool)

(assert (=> d!46219 (= lt!76194 (select (content!141 (t!6386 lt!75877)) (h!2358 lt!75877)))))

(declare-fun e!94619 () Bool)

(assert (=> d!46219 (= lt!76194 e!94619)))

(declare-fun res!69093 () Bool)

(assert (=> d!46219 (=> (not res!69093) (not e!94619))))

(assert (=> d!46219 (= res!69093 ((_ is Cons!1750) (t!6386 lt!75877)))))

(assert (=> d!46219 (= (contains!923 (t!6386 lt!75877) (h!2358 lt!75877)) lt!76194)))

(declare-fun b!145232 () Bool)

(declare-fun e!94620 () Bool)

(assert (=> b!145232 (= e!94619 e!94620)))

(declare-fun res!69092 () Bool)

(assert (=> b!145232 (=> res!69092 e!94620)))

(assert (=> b!145232 (= res!69092 (= (h!2358 (t!6386 lt!75877)) (h!2358 lt!75877)))))

(declare-fun b!145233 () Bool)

(assert (=> b!145233 (= e!94620 (contains!923 (t!6386 (t!6386 lt!75877)) (h!2358 lt!75877)))))

(assert (= (and d!46219 res!69093) b!145232))

(assert (= (and b!145232 (not res!69092)) b!145233))

(declare-fun m!174813 () Bool)

(assert (=> d!46219 m!174813))

(declare-fun m!174815 () Bool)

(assert (=> d!46219 m!174815))

(declare-fun m!174817 () Bool)

(assert (=> b!145233 m!174817))

(assert (=> b!144889 d!46219))

(declare-fun d!46221 () Bool)

(declare-fun e!94622 () Bool)

(assert (=> d!46221 e!94622))

(declare-fun res!69094 () Bool)

(assert (=> d!46221 (=> res!69094 e!94622)))

(declare-fun lt!76196 () Bool)

(assert (=> d!46221 (= res!69094 (not lt!76196))))

(declare-fun lt!76195 () Bool)

(assert (=> d!46221 (= lt!76196 lt!76195)))

(declare-fun lt!76198 () Unit!4581)

(declare-fun e!94621 () Unit!4581)

(assert (=> d!46221 (= lt!76198 e!94621)))

(declare-fun c!27552 () Bool)

(assert (=> d!46221 (= c!27552 lt!76195)))

(assert (=> d!46221 (= lt!76195 (containsKey!181 (toList!878 call!16170) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46221 (= (contains!924 call!16170 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) lt!76196)))

(declare-fun b!145234 () Bool)

(declare-fun lt!76197 () Unit!4581)

(assert (=> b!145234 (= e!94621 lt!76197)))

(assert (=> b!145234 (= lt!76197 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!878 call!16170) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!145234 (isDefined!131 (getValueByKey!177 (toList!878 call!16170) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!145235 () Bool)

(declare-fun Unit!4595 () Unit!4581)

(assert (=> b!145235 (= e!94621 Unit!4595)))

(declare-fun b!145236 () Bool)

(assert (=> b!145236 (= e!94622 (isDefined!131 (getValueByKey!177 (toList!878 call!16170) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355))))))

(assert (= (and d!46221 c!27552) b!145234))

(assert (= (and d!46221 (not c!27552)) b!145235))

(assert (= (and d!46221 (not res!69094)) b!145236))

(assert (=> d!46221 m!174253))

(declare-fun m!174819 () Bool)

(assert (=> d!46221 m!174819))

(assert (=> b!145234 m!174253))

(declare-fun m!174821 () Bool)

(assert (=> b!145234 m!174821))

(assert (=> b!145234 m!174253))

(declare-fun m!174823 () Bool)

(assert (=> b!145234 m!174823))

(assert (=> b!145234 m!174823))

(declare-fun m!174825 () Bool)

(assert (=> b!145234 m!174825))

(assert (=> b!145236 m!174253))

(assert (=> b!145236 m!174823))

(assert (=> b!145236 m!174823))

(assert (=> b!145236 m!174825))

(assert (=> b!145058 d!46221))

(declare-fun d!46223 () Bool)

(declare-fun c!27555 () Bool)

(assert (=> d!46223 (= c!27555 ((_ is Nil!1751) lt!75877))))

(declare-fun e!94625 () (InoxSet (_ BitVec 64)))

(assert (=> d!46223 (= (content!141 lt!75877) e!94625)))

(declare-fun b!145241 () Bool)

(assert (=> b!145241 (= e!94625 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!145242 () Bool)

(assert (=> b!145242 (= e!94625 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!2358 lt!75877) true) (content!141 (t!6386 lt!75877))))))

(assert (= (and d!46223 c!27555) b!145241))

(assert (= (and d!46223 (not c!27555)) b!145242))

(declare-fun m!174827 () Bool)

(assert (=> b!145242 m!174827))

(assert (=> b!145242 m!174813))

(assert (=> d!46137 d!46223))

(declare-fun d!46225 () Bool)

(declare-fun lt!76199 () Bool)

(assert (=> d!46225 (= lt!76199 (select (content!141 (t!6386 lt!75877)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94626 () Bool)

(assert (=> d!46225 (= lt!76199 e!94626)))

(declare-fun res!69096 () Bool)

(assert (=> d!46225 (=> (not res!69096) (not e!94626))))

(assert (=> d!46225 (= res!69096 ((_ is Cons!1750) (t!6386 lt!75877)))))

(assert (=> d!46225 (= (contains!923 (t!6386 lt!75877) #b1000000000000000000000000000000000000000000000000000000000000000) lt!76199)))

(declare-fun b!145243 () Bool)

(declare-fun e!94627 () Bool)

(assert (=> b!145243 (= e!94626 e!94627)))

(declare-fun res!69095 () Bool)

(assert (=> b!145243 (=> res!69095 e!94627)))

(assert (=> b!145243 (= res!69095 (= (h!2358 (t!6386 lt!75877)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145244 () Bool)

(assert (=> b!145244 (= e!94627 (contains!923 (t!6386 (t!6386 lt!75877)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46225 res!69096) b!145243))

(assert (= (and b!145243 (not res!69095)) b!145244))

(assert (=> d!46225 m!174813))

(declare-fun m!174829 () Bool)

(assert (=> d!46225 m!174829))

(declare-fun m!174831 () Bool)

(assert (=> b!145244 m!174831))

(assert (=> b!145080 d!46225))

(declare-fun d!46227 () Bool)

(declare-fun e!94628 () Bool)

(assert (=> d!46227 e!94628))

(declare-fun res!69098 () Bool)

(assert (=> d!46227 (=> (not res!69098) (not e!94628))))

(declare-fun lt!76200 () ListLongMap!1725)

(assert (=> d!46227 (= res!69098 (contains!924 lt!76200 (_1!1353 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(declare-fun lt!76201 () List!1755)

(assert (=> d!46227 (= lt!76200 (ListLongMap!1726 lt!76201))))

(declare-fun lt!76203 () Unit!4581)

(declare-fun lt!76202 () Unit!4581)

(assert (=> d!46227 (= lt!76203 lt!76202)))

(assert (=> d!46227 (= (getValueByKey!177 lt!76201 (_1!1353 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))) (Some!182 (_2!1353 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46227 (= lt!76202 (lemmaContainsTupThenGetReturnValue!94 lt!76201 (_1!1353 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) (_2!1353 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46227 (= lt!76201 (insertStrictlySorted!97 (toList!878 call!16110) (_1!1353 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) (_2!1353 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46227 (= (+!170 call!16110 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!76200)))

(declare-fun b!145245 () Bool)

(declare-fun res!69097 () Bool)

(assert (=> b!145245 (=> (not res!69097) (not e!94628))))

(assert (=> b!145245 (= res!69097 (= (getValueByKey!177 (toList!878 lt!76200) (_1!1353 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))) (Some!182 (_2!1353 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))))))

(declare-fun b!145246 () Bool)

(assert (=> b!145246 (= e!94628 (contains!927 (toList!878 lt!76200) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))))

(assert (= (and d!46227 res!69098) b!145245))

(assert (= (and b!145245 res!69097) b!145246))

(declare-fun m!174833 () Bool)

(assert (=> d!46227 m!174833))

(declare-fun m!174835 () Bool)

(assert (=> d!46227 m!174835))

(declare-fun m!174837 () Bool)

(assert (=> d!46227 m!174837))

(declare-fun m!174839 () Bool)

(assert (=> d!46227 m!174839))

(declare-fun m!174841 () Bool)

(assert (=> b!145245 m!174841))

(declare-fun m!174843 () Bool)

(assert (=> b!145246 m!174843))

(assert (=> b!144877 d!46227))

(declare-fun d!46229 () Bool)

(declare-fun e!94630 () Bool)

(assert (=> d!46229 e!94630))

(declare-fun res!69099 () Bool)

(assert (=> d!46229 (=> res!69099 e!94630)))

(declare-fun lt!76205 () Bool)

(assert (=> d!46229 (= res!69099 (not lt!76205))))

(declare-fun lt!76204 () Bool)

(assert (=> d!46229 (= lt!76205 lt!76204)))

(declare-fun lt!76207 () Unit!4581)

(declare-fun e!94629 () Unit!4581)

(assert (=> d!46229 (= lt!76207 e!94629)))

(declare-fun c!27556 () Bool)

(assert (=> d!46229 (= c!27556 lt!76204)))

(assert (=> d!46229 (= lt!76204 (containsKey!181 (toList!878 lt!75968) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!46229 (= (contains!924 lt!75968 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!76205)))

(declare-fun b!145247 () Bool)

(declare-fun lt!76206 () Unit!4581)

(assert (=> b!145247 (= e!94629 lt!76206)))

(assert (=> b!145247 (= lt!76206 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!878 lt!75968) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!145247 (isDefined!131 (getValueByKey!177 (toList!878 lt!75968) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145248 () Bool)

(declare-fun Unit!4596 () Unit!4581)

(assert (=> b!145248 (= e!94629 Unit!4596)))

(declare-fun b!145249 () Bool)

(assert (=> b!145249 (= e!94630 (isDefined!131 (getValueByKey!177 (toList!878 lt!75968) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!46229 c!27556) b!145247))

(assert (= (and d!46229 (not c!27556)) b!145248))

(assert (= (and d!46229 (not res!69099)) b!145249))

(assert (=> d!46229 m!174399))

(declare-fun m!174845 () Bool)

(assert (=> d!46229 m!174845))

(assert (=> b!145247 m!174399))

(declare-fun m!174847 () Bool)

(assert (=> b!145247 m!174847))

(assert (=> b!145247 m!174399))

(assert (=> b!145247 m!174733))

(assert (=> b!145247 m!174733))

(declare-fun m!174849 () Bool)

(assert (=> b!145247 m!174849))

(assert (=> b!145249 m!174399))

(assert (=> b!145249 m!174733))

(assert (=> b!145249 m!174733))

(assert (=> b!145249 m!174849))

(assert (=> b!144875 d!46229))

(declare-fun d!46231 () Bool)

(declare-fun res!69100 () Bool)

(declare-fun e!94631 () Bool)

(assert (=> d!46231 (=> res!69100 e!94631)))

(assert (=> d!46231 (= res!69100 (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46231 (= (arrayContainsKey!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!94631)))

(declare-fun b!145250 () Bool)

(declare-fun e!94632 () Bool)

(assert (=> b!145250 (= e!94631 e!94632)))

(declare-fun res!69101 () Bool)

(assert (=> b!145250 (=> (not res!69101) (not e!94632))))

(assert (=> b!145250 (= res!69101 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(declare-fun b!145251 () Bool)

(assert (=> b!145251 (= e!94632 (arrayContainsKey!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!46231 (not res!69100)) b!145250))

(assert (= (and b!145250 res!69101) b!145251))

(assert (=> d!46231 m!174709))

(assert (=> b!145251 m!174253))

(declare-fun m!174851 () Bool)

(assert (=> b!145251 m!174851))

(assert (=> b!144931 d!46231))

(assert (=> b!144925 d!46181))

(declare-fun b!145276 () Bool)

(declare-fun e!94649 () Bool)

(assert (=> b!145276 (= e!94649 (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!145276 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!145277 () Bool)

(assert (=> b!145277 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(assert (=> b!145277 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2597 (_values!2971 (v!3314 (underlying!485 thiss!992))))))))

(declare-fun lt!76227 () ListLongMap!1725)

(declare-fun e!94648 () Bool)

(assert (=> b!145277 (= e!94648 (= (apply!123 lt!76227 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!16216 () Bool)

(declare-fun call!16219 () ListLongMap!1725)

(assert (=> bm!16216 (= call!16219 (getCurrentListMapNoExtraKeys!135 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun b!145278 () Bool)

(declare-fun e!94651 () ListLongMap!1725)

(assert (=> b!145278 (= e!94651 (ListLongMap!1726 Nil!1752))))

(declare-fun b!145279 () Bool)

(declare-fun e!94652 () Bool)

(assert (=> b!145279 (= e!94652 e!94648)))

(assert (=> b!145279 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(declare-fun res!69110 () Bool)

(assert (=> b!145279 (= res!69110 (contains!924 lt!76227 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!145279 (=> (not res!69110) (not e!94648))))

(declare-fun b!145280 () Bool)

(declare-fun e!94650 () Bool)

(assert (=> b!145280 (= e!94652 e!94650)))

(declare-fun c!27565 () Bool)

(assert (=> b!145280 (= c!27565 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(declare-fun d!46233 () Bool)

(declare-fun e!94653 () Bool)

(assert (=> d!46233 e!94653))

(declare-fun res!69113 () Bool)

(assert (=> d!46233 (=> (not res!69113) (not e!94653))))

(assert (=> d!46233 (= res!69113 (not (contains!924 lt!76227 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46233 (= lt!76227 e!94651)))

(declare-fun c!27566 () Bool)

(assert (=> d!46233 (= c!27566 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(assert (=> d!46233 (validMask!0 (mask!7351 (v!3314 (underlying!485 thiss!992))))))

(assert (=> d!46233 (= (getCurrentListMapNoExtraKeys!135 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))) lt!76227)))

(declare-fun b!145281 () Bool)

(assert (=> b!145281 (= e!94650 (= lt!76227 (getCurrentListMapNoExtraKeys!135 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))))))))

(declare-fun b!145282 () Bool)

(declare-fun res!69111 () Bool)

(assert (=> b!145282 (=> (not res!69111) (not e!94653))))

(assert (=> b!145282 (= res!69111 (not (contains!924 lt!76227 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!145283 () Bool)

(declare-fun lt!76222 () Unit!4581)

(declare-fun lt!76225 () Unit!4581)

(assert (=> b!145283 (= lt!76222 lt!76225)))

(declare-fun lt!76223 () (_ BitVec 64))

(declare-fun lt!76224 () ListLongMap!1725)

(declare-fun lt!76228 () (_ BitVec 64))

(declare-fun lt!76226 () V!3577)

(assert (=> b!145283 (not (contains!924 (+!170 lt!76224 (tuple2!2685 lt!76223 lt!76226)) lt!76228))))

(declare-fun addStillNotContains!68 (ListLongMap!1725 (_ BitVec 64) V!3577 (_ BitVec 64)) Unit!4581)

(assert (=> b!145283 (= lt!76225 (addStillNotContains!68 lt!76224 lt!76223 lt!76226 lt!76228))))

(assert (=> b!145283 (= lt!76228 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!145283 (= lt!76226 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145283 (= lt!76223 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!145283 (= lt!76224 call!16219)))

(declare-fun e!94647 () ListLongMap!1725)

(assert (=> b!145283 (= e!94647 (+!170 call!16219 (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!145284 () Bool)

(assert (=> b!145284 (= e!94653 e!94652)))

(declare-fun c!27567 () Bool)

(assert (=> b!145284 (= c!27567 e!94649)))

(declare-fun res!69112 () Bool)

(assert (=> b!145284 (=> (not res!69112) (not e!94649))))

(assert (=> b!145284 (= res!69112 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(declare-fun b!145285 () Bool)

(assert (=> b!145285 (= e!94647 call!16219)))

(declare-fun b!145286 () Bool)

(assert (=> b!145286 (= e!94651 e!94647)))

(declare-fun c!27568 () Bool)

(assert (=> b!145286 (= c!27568 (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145287 () Bool)

(declare-fun isEmpty!428 (ListLongMap!1725) Bool)

(assert (=> b!145287 (= e!94650 (isEmpty!428 lt!76227))))

(assert (= (and d!46233 c!27566) b!145278))

(assert (= (and d!46233 (not c!27566)) b!145286))

(assert (= (and b!145286 c!27568) b!145283))

(assert (= (and b!145286 (not c!27568)) b!145285))

(assert (= (or b!145283 b!145285) bm!16216))

(assert (= (and d!46233 res!69113) b!145282))

(assert (= (and b!145282 res!69111) b!145284))

(assert (= (and b!145284 res!69112) b!145276))

(assert (= (and b!145284 c!27567) b!145279))

(assert (= (and b!145284 (not c!27567)) b!145280))

(assert (= (and b!145279 res!69110) b!145277))

(assert (= (and b!145280 c!27565) b!145281))

(assert (= (and b!145280 (not c!27565)) b!145287))

(declare-fun b_lambda!6497 () Bool)

(assert (=> (not b_lambda!6497) (not b!145277)))

(assert (=> b!145277 t!6383))

(declare-fun b_and!9029 () Bool)

(assert (= b_and!9025 (and (=> t!6383 result!4247) b_and!9029)))

(assert (=> b!145277 t!6385))

(declare-fun b_and!9031 () Bool)

(assert (= b_and!9027 (and (=> t!6385 result!4251) b_and!9031)))

(declare-fun b_lambda!6499 () Bool)

(assert (=> (not b_lambda!6499) (not b!145283)))

(assert (=> b!145283 t!6383))

(declare-fun b_and!9033 () Bool)

(assert (= b_and!9029 (and (=> t!6383 result!4247) b_and!9033)))

(assert (=> b!145283 t!6385))

(declare-fun b_and!9035 () Bool)

(assert (= b_and!9031 (and (=> t!6385 result!4251) b_and!9035)))

(assert (=> b!145277 m!174249))

(assert (=> b!145277 m!174399))

(declare-fun m!174853 () Bool)

(assert (=> b!145277 m!174853))

(assert (=> b!145277 m!174399))

(assert (=> b!145277 m!174397))

(assert (=> b!145277 m!174397))

(assert (=> b!145277 m!174249))

(assert (=> b!145277 m!174403))

(declare-fun m!174855 () Bool)

(assert (=> b!145287 m!174855))

(declare-fun m!174857 () Bool)

(assert (=> b!145281 m!174857))

(assert (=> b!145279 m!174399))

(assert (=> b!145279 m!174399))

(declare-fun m!174859 () Bool)

(assert (=> b!145279 m!174859))

(assert (=> b!145286 m!174399))

(assert (=> b!145286 m!174399))

(assert (=> b!145286 m!174409))

(assert (=> b!145276 m!174399))

(assert (=> b!145276 m!174399))

(assert (=> b!145276 m!174409))

(assert (=> b!145283 m!174249))

(assert (=> b!145283 m!174399))

(assert (=> b!145283 m!174397))

(declare-fun m!174861 () Bool)

(assert (=> b!145283 m!174861))

(declare-fun m!174863 () Bool)

(assert (=> b!145283 m!174863))

(declare-fun m!174865 () Bool)

(assert (=> b!145283 m!174865))

(declare-fun m!174867 () Bool)

(assert (=> b!145283 m!174867))

(assert (=> b!145283 m!174861))

(assert (=> b!145283 m!174397))

(assert (=> b!145283 m!174249))

(assert (=> b!145283 m!174403))

(declare-fun m!174869 () Bool)

(assert (=> d!46233 m!174869))

(assert (=> d!46233 m!174383))

(declare-fun m!174871 () Bool)

(assert (=> b!145282 m!174871))

(assert (=> bm!16216 m!174857))

(assert (=> bm!16107 d!46233))

(assert (=> b!144904 d!46171))

(declare-fun d!46235 () Bool)

(declare-fun lt!76229 () Bool)

(assert (=> d!46235 (= lt!76229 (select (content!141 (t!6386 lt!75877)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94654 () Bool)

(assert (=> d!46235 (= lt!76229 e!94654)))

(declare-fun res!69115 () Bool)

(assert (=> d!46235 (=> (not res!69115) (not e!94654))))

(assert (=> d!46235 (= res!69115 ((_ is Cons!1750) (t!6386 lt!75877)))))

(assert (=> d!46235 (= (contains!923 (t!6386 lt!75877) #b0000000000000000000000000000000000000000000000000000000000000000) lt!76229)))

(declare-fun b!145288 () Bool)

(declare-fun e!94655 () Bool)

(assert (=> b!145288 (= e!94654 e!94655)))

(declare-fun res!69114 () Bool)

(assert (=> b!145288 (=> res!69114 e!94655)))

(assert (=> b!145288 (= res!69114 (= (h!2358 (t!6386 lt!75877)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145289 () Bool)

(assert (=> b!145289 (= e!94655 (contains!923 (t!6386 (t!6386 lt!75877)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46235 res!69115) b!145288))

(assert (= (and b!145288 (not res!69114)) b!145289))

(assert (=> d!46235 m!174813))

(declare-fun m!174873 () Bool)

(assert (=> d!46235 m!174873))

(declare-fun m!174875 () Bool)

(assert (=> b!145289 m!174875))

(assert (=> b!144911 d!46235))

(declare-fun b!145290 () Bool)

(declare-fun e!94658 () Bool)

(declare-fun call!16220 () Bool)

(assert (=> b!145290 (= e!94658 call!16220)))

(declare-fun d!46237 () Bool)

(declare-fun res!69116 () Bool)

(declare-fun e!94659 () Bool)

(assert (=> d!46237 (=> res!69116 e!94659)))

(assert (=> d!46237 (= res!69116 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))))))

(assert (=> d!46237 (= (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27460 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) Nil!1751) Nil!1751)) e!94659)))

(declare-fun b!145291 () Bool)

(assert (=> b!145291 (= e!94658 call!16220)))

(declare-fun b!145292 () Bool)

(declare-fun e!94656 () Bool)

(assert (=> b!145292 (= e!94656 (contains!923 (ite c!27460 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) Nil!1751) Nil!1751) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!16217 () Bool)

(declare-fun c!27569 () Bool)

(assert (=> bm!16217 (= call!16220 (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!27569 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!27460 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) Nil!1751) Nil!1751)) (ite c!27460 (Cons!1750 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) Nil!1751) Nil!1751))))))

(declare-fun b!145293 () Bool)

(declare-fun e!94657 () Bool)

(assert (=> b!145293 (= e!94657 e!94658)))

(assert (=> b!145293 (= c!27569 (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!145294 () Bool)

(assert (=> b!145294 (= e!94659 e!94657)))

(declare-fun res!69118 () Bool)

(assert (=> b!145294 (=> (not res!69118) (not e!94657))))

(assert (=> b!145294 (= res!69118 (not e!94656))))

(declare-fun res!69117 () Bool)

(assert (=> b!145294 (=> (not res!69117) (not e!94656))))

(assert (=> b!145294 (= res!69117 (validKeyInArray!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!46237 (not res!69116)) b!145294))

(assert (= (and b!145294 res!69117) b!145292))

(assert (= (and b!145294 res!69118) b!145293))

(assert (= (and b!145293 c!27569) b!145290))

(assert (= (and b!145293 (not c!27569)) b!145291))

(assert (= (or b!145290 b!145291) bm!16217))

(declare-fun m!174877 () Bool)

(assert (=> b!145292 m!174877))

(assert (=> b!145292 m!174877))

(declare-fun m!174879 () Bool)

(assert (=> b!145292 m!174879))

(assert (=> bm!16217 m!174877))

(declare-fun m!174881 () Bool)

(assert (=> bm!16217 m!174881))

(assert (=> b!145293 m!174877))

(assert (=> b!145293 m!174877))

(declare-fun m!174883 () Bool)

(assert (=> b!145293 m!174883))

(assert (=> b!145294 m!174877))

(assert (=> b!145294 m!174877))

(assert (=> b!145294 m!174883))

(assert (=> bm!16116 d!46237))

(declare-fun d!46239 () Bool)

(assert (=> d!46239 (= (validMask!0 (mask!7351 (v!3314 (underlying!485 thiss!992)))) (and (or (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000001111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000011111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000001111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000011111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000001111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000011111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000001111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000011111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000000111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000001111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000011111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000000111111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000001111111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000011111111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000000111111111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000001111111111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000011111111111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000000111111111111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000001111111111111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000011111111111111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00000111111111111111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00001111111111111111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00011111111111111111111111111111) (= (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7351 (v!3314 (underlying!485 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!46127 d!46239))

(declare-fun d!46241 () Bool)

(declare-fun e!94662 () Bool)

(assert (=> d!46241 e!94662))

(declare-fun res!69124 () Bool)

(assert (=> d!46241 (=> (not res!69124) (not e!94662))))

(declare-fun lt!76235 () SeekEntryResult!285)

(assert (=> d!46241 (= res!69124 ((_ is Found!285) lt!76235))))

(assert (=> d!46241 (= lt!76235 (seekEntryOrOpen!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (_keys!4754 newMap!16) (mask!7351 newMap!16)))))

(declare-fun lt!76234 () Unit!4581)

(declare-fun choose!901 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) Int) Unit!4581)

(assert (=> d!46241 (= lt!76234 (choose!901 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46241 (validMask!0 (mask!7351 newMap!16))))

(assert (=> d!46241 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!68 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)) lt!76234)))

(declare-fun b!145299 () Bool)

(declare-fun res!69123 () Bool)

(assert (=> b!145299 (=> (not res!69123) (not e!94662))))

(assert (=> b!145299 (= res!69123 (inRange!0 (index!3307 lt!76235) (mask!7351 newMap!16)))))

(declare-fun b!145300 () Bool)

(assert (=> b!145300 (= e!94662 (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3307 lt!76235)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> b!145300 (and (bvsge (index!3307 lt!76235) #b00000000000000000000000000000000) (bvslt (index!3307 lt!76235) (size!2596 (_keys!4754 newMap!16))))))

(assert (= (and d!46241 res!69124) b!145299))

(assert (= (and b!145299 res!69123) b!145300))

(assert (=> d!46241 m!174253))

(assert (=> d!46241 m!174495))

(assert (=> d!46241 m!174253))

(declare-fun m!174885 () Bool)

(assert (=> d!46241 m!174885))

(assert (=> d!46241 m!174577))

(declare-fun m!174887 () Bool)

(assert (=> b!145299 m!174887))

(declare-fun m!174889 () Bool)

(assert (=> b!145300 m!174889))

(assert (=> bm!16183 d!46241))

(declare-fun d!46243 () Bool)

(declare-fun res!69125 () Bool)

(declare-fun e!94663 () Bool)

(assert (=> d!46243 (=> (not res!69125) (not e!94663))))

(assert (=> d!46243 (= res!69125 (simpleValid!99 (v!3314 (underlying!485 thiss!992))))))

(assert (=> d!46243 (= (valid!570 (v!3314 (underlying!485 thiss!992))) e!94663)))

(declare-fun b!145301 () Bool)

(declare-fun res!69126 () Bool)

(assert (=> b!145301 (=> (not res!69126) (not e!94663))))

(assert (=> b!145301 (= res!69126 (= (arrayCountValidKeys!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000000 (size!2596 (_keys!4754 (v!3314 (underlying!485 thiss!992))))) (_size!633 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun b!145302 () Bool)

(declare-fun res!69127 () Bool)

(assert (=> b!145302 (=> (not res!69127) (not e!94663))))

(assert (=> b!145302 (= res!69127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992)))))))

(declare-fun b!145303 () Bool)

(assert (=> b!145303 (= e!94663 (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000000 Nil!1751))))

(assert (= (and d!46243 res!69125) b!145301))

(assert (= (and b!145301 res!69126) b!145302))

(assert (= (and b!145302 res!69127) b!145303))

(declare-fun m!174891 () Bool)

(assert (=> d!46243 m!174891))

(declare-fun m!174893 () Bool)

(assert (=> b!145301 m!174893))

(declare-fun m!174895 () Bool)

(assert (=> b!145302 m!174895))

(declare-fun m!174897 () Bool)

(assert (=> b!145303 m!174897))

(assert (=> d!46141 d!46243))

(declare-fun d!46245 () Bool)

(declare-fun lt!76236 () Bool)

(assert (=> d!46245 (= lt!76236 (select (content!141 lt!75877) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!94664 () Bool)

(assert (=> d!46245 (= lt!76236 e!94664)))

(declare-fun res!69129 () Bool)

(assert (=> d!46245 (=> (not res!69129) (not e!94664))))

(assert (=> d!46245 (= res!69129 ((_ is Cons!1750) lt!75877))))

(assert (=> d!46245 (= (contains!923 lt!75877 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!76236)))

(declare-fun b!145304 () Bool)

(declare-fun e!94665 () Bool)

(assert (=> b!145304 (= e!94664 e!94665)))

(declare-fun res!69128 () Bool)

(assert (=> b!145304 (=> res!69128 e!94665)))

(assert (=> b!145304 (= res!69128 (= (h!2358 lt!75877) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145305 () Bool)

(assert (=> b!145305 (= e!94665 (contains!923 (t!6386 lt!75877) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!46245 res!69129) b!145304))

(assert (= (and b!145304 (not res!69128)) b!145305))

(assert (=> d!46245 m!174449))

(assert (=> d!46245 m!174399))

(declare-fun m!174899 () Bool)

(assert (=> d!46245 m!174899))

(assert (=> b!145305 m!174399))

(declare-fun m!174901 () Bool)

(assert (=> b!145305 m!174901))

(assert (=> b!144903 d!46245))

(declare-fun d!46247 () Bool)

(assert (=> d!46247 (= (+!170 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) lt!76074 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76239 () Unit!4581)

(declare-fun choose!902 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 V!3577 Int) Unit!4581)

(assert (=> d!46247 (= lt!76239 (choose!902 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) lt!76074 (zeroValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2834 newMap!16) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46247 (validMask!0 (mask!7351 newMap!16))))

(assert (=> d!46247 (= (lemmaChangeZeroKeyThenAddPairToListMap!68 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) lt!76074 (zeroValue!2834 newMap!16) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2834 newMap!16) (defaultEntry!2988 newMap!16)) lt!76239)))

(declare-fun bs!6098 () Bool)

(assert (= bs!6098 d!46247))

(assert (=> bs!6098 m!174577))

(assert (=> bs!6098 m!174251))

(declare-fun m!174903 () Bool)

(assert (=> bs!6098 m!174903))

(assert (=> bs!6098 m!174251))

(declare-fun m!174905 () Bool)

(assert (=> bs!6098 m!174905))

(assert (=> bs!6098 m!174381))

(declare-fun m!174907 () Bool)

(assert (=> bs!6098 m!174907))

(assert (=> bs!6098 m!174381))

(assert (=> b!145043 d!46247))

(declare-fun d!46249 () Bool)

(declare-fun res!69134 () Bool)

(declare-fun e!94670 () Bool)

(assert (=> d!46249 (=> res!69134 e!94670)))

(assert (=> d!46249 (= res!69134 (and ((_ is Cons!1751) (toList!878 lt!75876)) (= (_1!1353 (h!2359 (toList!878 lt!75876))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355))))))

(assert (=> d!46249 (= (containsKey!181 (toList!878 lt!75876) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) e!94670)))

(declare-fun b!145310 () Bool)

(declare-fun e!94671 () Bool)

(assert (=> b!145310 (= e!94670 e!94671)))

(declare-fun res!69135 () Bool)

(assert (=> b!145310 (=> (not res!69135) (not e!94671))))

(assert (=> b!145310 (= res!69135 (and (or (not ((_ is Cons!1751) (toList!878 lt!75876))) (bvsle (_1!1353 (h!2359 (toList!878 lt!75876))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355))) ((_ is Cons!1751) (toList!878 lt!75876)) (bvslt (_1!1353 (h!2359 (toList!878 lt!75876))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355))))))

(declare-fun b!145311 () Bool)

(assert (=> b!145311 (= e!94671 (containsKey!181 (t!6387 (toList!878 lt!75876)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (= (and d!46249 (not res!69134)) b!145310))

(assert (= (and b!145310 res!69135) b!145311))

(assert (=> b!145311 m!174253))

(declare-fun m!174909 () Bool)

(assert (=> b!145311 m!174909))

(assert (=> d!46155 d!46249))

(assert (=> bm!16165 d!46205))

(declare-fun b!145322 () Bool)

(declare-fun res!69145 () Bool)

(declare-fun e!94674 () Bool)

(assert (=> b!145322 (=> (not res!69145) (not e!94674))))

(declare-fun size!2602 (LongMapFixedSize!1168) (_ BitVec 32))

(assert (=> b!145322 (= res!69145 (= (size!2602 newMap!16) (bvadd (_size!633 newMap!16) (bvsdiv (bvadd (extraKeys!2735 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!46251 () Bool)

(declare-fun res!69144 () Bool)

(assert (=> d!46251 (=> (not res!69144) (not e!94674))))

(assert (=> d!46251 (= res!69144 (validMask!0 (mask!7351 newMap!16)))))

(assert (=> d!46251 (= (simpleValid!99 newMap!16) e!94674)))

(declare-fun b!145321 () Bool)

(declare-fun res!69147 () Bool)

(assert (=> b!145321 (=> (not res!69147) (not e!94674))))

(assert (=> b!145321 (= res!69147 (bvsge (size!2602 newMap!16) (_size!633 newMap!16)))))

(declare-fun b!145323 () Bool)

(assert (=> b!145323 (= e!94674 (and (bvsge (extraKeys!2735 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2735 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!633 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!145320 () Bool)

(declare-fun res!69146 () Bool)

(assert (=> b!145320 (=> (not res!69146) (not e!94674))))

(assert (=> b!145320 (= res!69146 (and (= (size!2597 (_values!2971 newMap!16)) (bvadd (mask!7351 newMap!16) #b00000000000000000000000000000001)) (= (size!2596 (_keys!4754 newMap!16)) (size!2597 (_values!2971 newMap!16))) (bvsge (_size!633 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!633 newMap!16) (bvadd (mask!7351 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!46251 res!69144) b!145320))

(assert (= (and b!145320 res!69146) b!145321))

(assert (= (and b!145321 res!69147) b!145322))

(assert (= (and b!145322 res!69145) b!145323))

(declare-fun m!174911 () Bool)

(assert (=> b!145322 m!174911))

(assert (=> d!46251 m!174577))

(assert (=> b!145321 m!174911))

(assert (=> d!46139 d!46251))

(declare-fun d!46253 () Bool)

(declare-fun res!69148 () Bool)

(declare-fun e!94675 () Bool)

(assert (=> d!46253 (=> res!69148 e!94675)))

(assert (=> d!46253 (= res!69148 (= (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46253 (= (arrayContainsKey!0 (_keys!4754 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000) e!94675)))

(declare-fun b!145324 () Bool)

(declare-fun e!94676 () Bool)

(assert (=> b!145324 (= e!94675 e!94676)))

(declare-fun res!69149 () Bool)

(assert (=> b!145324 (=> (not res!69149) (not e!94676))))

(assert (=> b!145324 (= res!69149 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2596 (_keys!4754 newMap!16))))))

(declare-fun b!145325 () Bool)

(assert (=> b!145325 (= e!94676 (arrayContainsKey!0 (_keys!4754 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!46253 (not res!69148)) b!145324))

(assert (= (and b!145324 res!69149) b!145325))

(assert (=> d!46253 m!174593))

(assert (=> b!145325 m!174253))

(declare-fun m!174913 () Bool)

(assert (=> b!145325 m!174913))

(assert (=> bm!16187 d!46253))

(declare-fun d!46255 () Bool)

(declare-fun e!94679 () Bool)

(assert (=> d!46255 e!94679))

(declare-fun c!27572 () Bool)

(assert (=> d!46255 (= c!27572 (and (not (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!46255 true))

(declare-fun _$29!174 () Unit!4581)

(assert (=> d!46255 (= (choose!896 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (_values!2971 (v!3314 (underlying!485 thiss!992))) (mask!7351 (v!3314 (underlying!485 thiss!992))) (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) (minValue!2834 (v!3314 (underlying!485 thiss!992))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992)))) _$29!174)))

(declare-fun b!145330 () Bool)

(assert (=> b!145330 (= e!94679 (arrayContainsKey!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!145331 () Bool)

(assert (=> b!145331 (= e!94679 (ite (= (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2735 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46255 c!27572) b!145330))

(assert (= (and d!46255 (not c!27572)) b!145331))

(assert (=> b!145330 m!174253))

(assert (=> b!145330 m!174269))

(assert (=> d!46149 d!46255))

(assert (=> d!46149 d!46239))

(assert (=> bm!16170 d!46125))

(declare-fun lt!76303 () tuple2!2686)

(declare-fun b!145366 () Bool)

(declare-fun e!94700 () Bool)

(assert (=> b!145366 (= e!94700 (= (map!1433 (_2!1354 lt!76303)) (+!170 (map!1433 newMap!16) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!145367 () Bool)

(declare-fun e!94696 () Bool)

(declare-fun call!16229 () Bool)

(assert (=> b!145367 (= e!94696 (not call!16229))))

(declare-fun b!145368 () Bool)

(declare-fun res!69169 () Bool)

(assert (=> b!145368 (=> (not res!69169) (not e!94696))))

(declare-fun call!16231 () Bool)

(assert (=> b!145368 (= res!69169 call!16231)))

(declare-fun e!94701 () Bool)

(assert (=> b!145368 (= e!94701 e!94696)))

(declare-fun b!145369 () Bool)

(declare-fun e!94697 () Unit!4581)

(declare-fun Unit!4597 () Unit!4581)

(assert (=> b!145369 (= e!94697 Unit!4597)))

(declare-fun lt!76325 () Unit!4581)

(declare-fun lemmaArrayContainsKeyThenInListMap!48 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 64) (_ BitVec 32) Int) Unit!4581)

(assert (=> b!145369 (= lt!76325 (lemmaArrayContainsKeyThenInListMap!48 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(assert (=> b!145369 (contains!924 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355))))

(declare-fun lt!76316 () Unit!4581)

(assert (=> b!145369 (= lt!76316 lt!76325)))

(assert (=> b!145369 false))

(declare-fun d!46257 () Bool)

(assert (=> d!46257 e!94700))

(declare-fun res!69168 () Bool)

(assert (=> d!46257 (=> (not res!69168) (not e!94700))))

(assert (=> d!46257 (= res!69168 (_1!1354 lt!76303))))

(assert (=> d!46257 (= lt!76303 (tuple2!2687 true (LongMapFixedSize!1169 (defaultEntry!2988 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (bvadd (_size!633 newMap!16) #b00000000000000000000000000000001) (array!4916 (store (arr!2320 (_keys!4754 newMap!16)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) (size!2596 (_keys!4754 newMap!16))) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16))) (_vacant!633 newMap!16))))))

(declare-fun lt!76308 () Unit!4581)

(declare-fun lt!76315 () Unit!4581)

(assert (=> d!46257 (= lt!76308 lt!76315)))

(declare-fun lt!76313 () array!4915)

(declare-fun lt!76320 () array!4917)

(assert (=> d!46257 (contains!924 (getCurrentListMap!537 lt!76313 lt!76320 (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (select (store (arr!2320 (_keys!4754 newMap!16)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060))))))

(assert (=> d!46257 (= lt!76315 (lemmaValidKeyInArrayIsInListMap!127 lt!76313 lt!76320 (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (defaultEntry!2988 newMap!16)))))

(assert (=> d!46257 (= lt!76320 (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16))))))

(assert (=> d!46257 (= lt!76313 (array!4916 (store (arr!2320 (_keys!4754 newMap!16)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) (size!2596 (_keys!4754 newMap!16))))))

(declare-fun lt!76321 () Unit!4581)

(declare-fun lt!76306 () Unit!4581)

(assert (=> d!46257 (= lt!76321 lt!76306)))

(declare-fun lt!76328 () array!4915)

(assert (=> d!46257 (= (arrayCountValidKeys!0 lt!76328 (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (bvadd (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4915 (_ BitVec 32)) Unit!4581)

(assert (=> d!46257 (= lt!76306 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!76328 (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060))))))

(assert (=> d!46257 (= lt!76328 (array!4916 (store (arr!2320 (_keys!4754 newMap!16)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) (size!2596 (_keys!4754 newMap!16))))))

(declare-fun lt!76327 () Unit!4581)

(declare-fun lt!76310 () Unit!4581)

(assert (=> d!46257 (= lt!76327 lt!76310)))

(declare-fun lt!76311 () array!4915)

(assert (=> d!46257 (arrayContainsKey!0 lt!76311 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4915 (_ BitVec 64) (_ BitVec 32)) Unit!4581)

(assert (=> d!46257 (= lt!76310 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!76311 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060))))))

(assert (=> d!46257 (= lt!76311 (array!4916 (store (arr!2320 (_keys!4754 newMap!16)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) (size!2596 (_keys!4754 newMap!16))))))

(declare-fun lt!76318 () Unit!4581)

(declare-fun lt!76301 () Unit!4581)

(assert (=> d!46257 (= lt!76318 lt!76301)))

(assert (=> d!46257 (= (+!170 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (tuple2!2685 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!537 (array!4916 (store (arr!2320 (_keys!4754 newMap!16)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) (size!2596 (_keys!4754 newMap!16))) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16))) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!48 (array!4915 array!4917 (_ BitVec 32) (_ BitVec 32) V!3577 V!3577 (_ BitVec 32) (_ BitVec 64) V!3577 Int) Unit!4581)

(assert (=> d!46257 (= lt!76301 (lemmaAddValidKeyToArrayThenAddPairToListMap!48 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76326 () Unit!4581)

(declare-fun lt!76329 () Unit!4581)

(assert (=> d!46257 (= lt!76326 lt!76329)))

(assert (=> d!46257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4916 (store (arr!2320 (_keys!4754 newMap!16)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) (size!2596 (_keys!4754 newMap!16))) (mask!7351 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4915 (_ BitVec 32) (_ BitVec 32)) Unit!4581)

(assert (=> d!46257 (= lt!76329 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (_keys!4754 newMap!16) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (mask!7351 newMap!16)))))

(declare-fun lt!76314 () Unit!4581)

(declare-fun lt!76302 () Unit!4581)

(assert (=> d!46257 (= lt!76314 lt!76302)))

(assert (=> d!46257 (= (arrayCountValidKeys!0 (array!4916 (store (arr!2320 (_keys!4754 newMap!16)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) (size!2596 (_keys!4754 newMap!16))) #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4754 newMap!16) #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4915 (_ BitVec 32) (_ BitVec 64)) Unit!4581)

(assert (=> d!46257 (= lt!76302 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4754 newMap!16) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun lt!76319 () Unit!4581)

(declare-fun lt!76300 () Unit!4581)

(assert (=> d!46257 (= lt!76319 lt!76300)))

(declare-fun lt!76304 () (_ BitVec 32))

(declare-fun lt!76324 () List!1754)

(assert (=> d!46257 (arrayNoDuplicates!0 (array!4916 (store (arr!2320 (_keys!4754 newMap!16)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) (size!2596 (_keys!4754 newMap!16))) lt!76304 lt!76324)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4915 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1754) Unit!4581)

(assert (=> d!46257 (= lt!76300 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4754 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060)) lt!76304 lt!76324))))

(assert (=> d!46257 (= lt!76324 Nil!1751)))

(assert (=> d!46257 (= lt!76304 #b00000000000000000000000000000000)))

(declare-fun lt!76322 () Unit!4581)

(assert (=> d!46257 (= lt!76322 e!94697)))

(declare-fun c!27583 () Bool)

(assert (=> d!46257 (= c!27583 (arrayContainsKey!0 (_keys!4754 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!76317 () Unit!4581)

(declare-fun e!94703 () Unit!4581)

(assert (=> d!46257 (= lt!76317 e!94703)))

(declare-fun c!27581 () Bool)

(assert (=> d!46257 (= c!27581 (contains!924 (getCurrentListMap!537 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (=> d!46257 (valid!570 newMap!16)))

(assert (=> d!46257 (= (updateHelperNewKey!68 newMap!16 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27502 (index!3309 lt!76060) (index!3306 lt!76060))) lt!76303)))

(declare-fun bm!16226 () Bool)

(declare-fun call!16232 () Bool)

(assert (=> bm!16226 (= call!16231 call!16232)))

(declare-fun bm!16227 () Bool)

(declare-fun call!16230 () SeekEntryResult!285)

(assert (=> bm!16227 (= call!16230 (seekEntryOrOpen!0 (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (_keys!4754 newMap!16) (mask!7351 newMap!16)))))

(declare-fun b!145370 () Bool)

(declare-fun res!69176 () Bool)

(declare-fun lt!76309 () SeekEntryResult!285)

(assert (=> b!145370 (= res!69176 (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3309 lt!76309)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94702 () Bool)

(assert (=> b!145370 (=> (not res!69176) (not e!94702))))

(declare-fun b!145371 () Bool)

(declare-fun res!69173 () Bool)

(assert (=> b!145371 (= res!69173 call!16232)))

(declare-fun e!94699 () Bool)

(assert (=> b!145371 (=> (not res!69173) (not e!94699))))

(declare-fun b!145372 () Bool)

(declare-fun res!69171 () Bool)

(assert (=> b!145372 (=> (not res!69171) (not e!94700))))

(assert (=> b!145372 (= res!69171 (valid!570 (_2!1354 lt!76303)))))

(declare-fun b!145373 () Bool)

(declare-fun res!69175 () Bool)

(assert (=> b!145373 (=> (not res!69175) (not e!94696))))

(assert (=> b!145373 (= res!69175 (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3306 lt!76309)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145374 () Bool)

(assert (=> b!145374 (= e!94702 (not call!16229))))

(declare-fun b!145375 () Bool)

(declare-fun Unit!4598 () Unit!4581)

(assert (=> b!145375 (= e!94697 Unit!4598)))

(declare-fun bm!16228 () Bool)

(assert (=> bm!16228 (= call!16229 (arrayContainsKey!0 (_keys!4754 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!145376 () Bool)

(declare-fun lt!76307 () Unit!4581)

(assert (=> b!145376 (= e!94703 lt!76307)))

(assert (=> b!145376 (= lt!76307 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!68 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)))))

(assert (=> b!145376 (= lt!76309 call!16230)))

(declare-fun c!27584 () Bool)

(assert (=> b!145376 (= c!27584 ((_ is MissingZero!285) lt!76309))))

(assert (=> b!145376 e!94701))

(declare-fun lt!76305 () SeekEntryResult!285)

(declare-fun bm!16229 () Bool)

(assert (=> bm!16229 (= call!16232 (inRange!0 (ite c!27581 (index!3307 lt!76305) (ite c!27584 (index!3306 lt!76309) (index!3309 lt!76309))) (mask!7351 newMap!16)))))

(declare-fun b!145377 () Bool)

(assert (=> b!145377 (= e!94699 (= (select (arr!2320 (_keys!4754 newMap!16)) (index!3307 lt!76305)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!145378 () Bool)

(declare-fun res!69174 () Bool)

(assert (=> b!145378 (=> (not res!69174) (not e!94700))))

(assert (=> b!145378 (= res!69174 (contains!924 (map!1433 (_2!1354 lt!76303)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!145379 () Bool)

(declare-fun e!94698 () Bool)

(assert (=> b!145379 (= e!94698 ((_ is Undefined!285) lt!76309))))

(declare-fun b!145380 () Bool)

(declare-fun c!27582 () Bool)

(assert (=> b!145380 (= c!27582 ((_ is MissingVacant!285) lt!76309))))

(assert (=> b!145380 (= e!94701 e!94698)))

(declare-fun b!145381 () Bool)

(assert (=> b!145381 (= e!94698 e!94702)))

(declare-fun res!69170 () Bool)

(assert (=> b!145381 (= res!69170 call!16231)))

(assert (=> b!145381 (=> (not res!69170) (not e!94702))))

(declare-fun b!145382 () Bool)

(declare-fun Unit!4599 () Unit!4581)

(assert (=> b!145382 (= e!94703 Unit!4599)))

(declare-fun lt!76323 () Unit!4581)

(assert (=> b!145382 (= lt!76323 (lemmaInListMapThenSeekEntryOrOpenFindsIt!68 (_keys!4754 newMap!16) (_values!2971 newMap!16) (mask!7351 newMap!16) (extraKeys!2735 newMap!16) (zeroValue!2834 newMap!16) (minValue!2834 newMap!16) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355) (defaultEntry!2988 newMap!16)))))

(assert (=> b!145382 (= lt!76305 call!16230)))

(declare-fun res!69172 () Bool)

(assert (=> b!145382 (= res!69172 ((_ is Found!285) lt!76305))))

(assert (=> b!145382 (=> (not res!69172) (not e!94699))))

(assert (=> b!145382 e!94699))

(declare-fun lt!76312 () Unit!4581)

(assert (=> b!145382 (= lt!76312 lt!76323)))

(assert (=> b!145382 false))

(assert (= (and d!46257 c!27581) b!145382))

(assert (= (and d!46257 (not c!27581)) b!145376))

(assert (= (and b!145382 res!69172) b!145371))

(assert (= (and b!145371 res!69173) b!145377))

(assert (= (and b!145376 c!27584) b!145368))

(assert (= (and b!145376 (not c!27584)) b!145380))

(assert (= (and b!145368 res!69169) b!145373))

(assert (= (and b!145373 res!69175) b!145367))

(assert (= (and b!145380 c!27582) b!145381))

(assert (= (and b!145380 (not c!27582)) b!145379))

(assert (= (and b!145381 res!69170) b!145370))

(assert (= (and b!145370 res!69176) b!145374))

(assert (= (or b!145368 b!145381) bm!16226))

(assert (= (or b!145367 b!145374) bm!16228))

(assert (= (or b!145371 bm!16226) bm!16229))

(assert (= (or b!145382 b!145376) bm!16227))

(assert (= (and d!46257 c!27583) b!145369))

(assert (= (and d!46257 (not c!27583)) b!145375))

(assert (= (and d!46257 res!69168) b!145372))

(assert (= (and b!145372 res!69171) b!145378))

(assert (= (and b!145378 res!69174) b!145366))

(declare-fun m!174915 () Bool)

(assert (=> bm!16229 m!174915))

(declare-fun m!174917 () Bool)

(assert (=> b!145377 m!174917))

(assert (=> b!145382 m!174253))

(assert (=> b!145382 m!174497))

(declare-fun m!174919 () Bool)

(assert (=> b!145378 m!174919))

(assert (=> b!145378 m!174919))

(assert (=> b!145378 m!174253))

(declare-fun m!174921 () Bool)

(assert (=> b!145378 m!174921))

(declare-fun m!174923 () Bool)

(assert (=> b!145372 m!174923))

(assert (=> b!145369 m!174253))

(declare-fun m!174925 () Bool)

(assert (=> b!145369 m!174925))

(assert (=> b!145369 m!174381))

(assert (=> b!145369 m!174381))

(assert (=> b!145369 m!174253))

(assert (=> b!145369 m!174537))

(assert (=> b!145366 m!174919))

(assert (=> b!145366 m!174277))

(assert (=> b!145366 m!174277))

(declare-fun m!174927 () Bool)

(assert (=> b!145366 m!174927))

(assert (=> bm!16227 m!174253))

(assert (=> bm!16227 m!174495))

(declare-fun m!174929 () Bool)

(assert (=> d!46257 m!174929))

(assert (=> d!46257 m!174253))

(declare-fun m!174931 () Bool)

(assert (=> d!46257 m!174931))

(assert (=> d!46257 m!174929))

(declare-fun m!174933 () Bool)

(assert (=> d!46257 m!174933))

(declare-fun m!174935 () Bool)

(assert (=> d!46257 m!174935))

(assert (=> d!46257 m!174381))

(assert (=> d!46257 m!174253))

(assert (=> d!46257 m!174537))

(assert (=> d!46257 m!174253))

(assert (=> d!46257 m!174507))

(assert (=> d!46257 m!174253))

(assert (=> d!46257 m!174251))

(declare-fun m!174937 () Bool)

(assert (=> d!46257 m!174937))

(declare-fun m!174939 () Bool)

(assert (=> d!46257 m!174939))

(declare-fun m!174941 () Bool)

(assert (=> d!46257 m!174941))

(declare-fun m!174943 () Bool)

(assert (=> d!46257 m!174943))

(declare-fun m!174945 () Bool)

(assert (=> d!46257 m!174945))

(assert (=> d!46257 m!174245))

(assert (=> d!46257 m!174253))

(declare-fun m!174947 () Bool)

(assert (=> d!46257 m!174947))

(declare-fun m!174949 () Bool)

(assert (=> d!46257 m!174949))

(declare-fun m!174951 () Bool)

(assert (=> d!46257 m!174951))

(declare-fun m!174953 () Bool)

(assert (=> d!46257 m!174953))

(assert (=> d!46257 m!174381))

(assert (=> d!46257 m!174799))

(declare-fun m!174955 () Bool)

(assert (=> d!46257 m!174955))

(assert (=> d!46257 m!174253))

(declare-fun m!174957 () Bool)

(assert (=> d!46257 m!174957))

(assert (=> d!46257 m!174457))

(assert (=> d!46257 m!174253))

(declare-fun m!174959 () Bool)

(assert (=> d!46257 m!174959))

(assert (=> d!46257 m!174253))

(declare-fun m!174961 () Bool)

(assert (=> d!46257 m!174961))

(assert (=> d!46257 m!174933))

(assert (=> d!46257 m!174381))

(declare-fun m!174963 () Bool)

(assert (=> d!46257 m!174963))

(assert (=> bm!16228 m!174253))

(assert (=> bm!16228 m!174507))

(assert (=> b!145376 m!174253))

(assert (=> b!145376 m!174513))

(declare-fun m!174965 () Bool)

(assert (=> b!145370 m!174965))

(declare-fun m!174967 () Bool)

(assert (=> b!145373 m!174967))

(assert (=> bm!16179 d!46257))

(declare-fun d!46259 () Bool)

(assert (=> d!46259 (= (get!1548 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145078 d!46259))

(declare-fun d!46261 () Bool)

(declare-fun e!94704 () Bool)

(assert (=> d!46261 e!94704))

(declare-fun res!69178 () Bool)

(assert (=> d!46261 (=> (not res!69178) (not e!94704))))

(declare-fun lt!76330 () ListLongMap!1725)

(assert (=> d!46261 (= res!69178 (contains!924 lt!76330 (_1!1353 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(declare-fun lt!76331 () List!1755)

(assert (=> d!46261 (= lt!76330 (ListLongMap!1726 lt!76331))))

(declare-fun lt!76333 () Unit!4581)

(declare-fun lt!76332 () Unit!4581)

(assert (=> d!46261 (= lt!76333 lt!76332)))

(assert (=> d!46261 (= (getValueByKey!177 lt!76331 (_1!1353 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))) (Some!182 (_2!1353 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46261 (= lt!76332 (lemmaContainsTupThenGetReturnValue!94 lt!76331 (_1!1353 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))) (_2!1353 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46261 (= lt!76331 (insertStrictlySorted!97 (toList!878 lt!75971) (_1!1353 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))) (_2!1353 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46261 (= (+!170 lt!75971 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!76330)))

(declare-fun b!145383 () Bool)

(declare-fun res!69177 () Bool)

(assert (=> b!145383 (=> (not res!69177) (not e!94704))))

(assert (=> b!145383 (= res!69177 (= (getValueByKey!177 (toList!878 lt!76330) (_1!1353 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))) (Some!182 (_2!1353 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))))))))

(declare-fun b!145384 () Bool)

(assert (=> b!145384 (= e!94704 (contains!927 (toList!878 lt!76330) (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))))))

(assert (= (and d!46261 res!69178) b!145383))

(assert (= (and b!145383 res!69177) b!145384))

(declare-fun m!174969 () Bool)

(assert (=> d!46261 m!174969))

(declare-fun m!174971 () Bool)

(assert (=> d!46261 m!174971))

(declare-fun m!174973 () Bool)

(assert (=> d!46261 m!174973))

(declare-fun m!174975 () Bool)

(assert (=> d!46261 m!174975))

(declare-fun m!174977 () Bool)

(assert (=> b!145383 m!174977))

(declare-fun m!174979 () Bool)

(assert (=> b!145384 m!174979))

(assert (=> b!144865 d!46261))

(declare-fun d!46263 () Bool)

(assert (=> d!46263 (= (apply!123 (+!170 lt!75969 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!75972) (apply!123 lt!75969 lt!75972))))

(declare-fun lt!76336 () Unit!4581)

(declare-fun choose!903 (ListLongMap!1725 (_ BitVec 64) V!3577 (_ BitVec 64)) Unit!4581)

(assert (=> d!46263 (= lt!76336 (choose!903 lt!75969 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992))) lt!75972))))

(declare-fun e!94707 () Bool)

(assert (=> d!46263 e!94707))

(declare-fun res!69181 () Bool)

(assert (=> d!46263 (=> (not res!69181) (not e!94707))))

(assert (=> d!46263 (= res!69181 (contains!924 lt!75969 lt!75972))))

(assert (=> d!46263 (= (addApplyDifferent!99 lt!75969 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992))) lt!75972) lt!76336)))

(declare-fun b!145388 () Bool)

(assert (=> b!145388 (= e!94707 (not (= lt!75972 lt!75962)))))

(assert (= (and d!46263 res!69181) b!145388))

(assert (=> d!46263 m!174421))

(declare-fun m!174981 () Bool)

(assert (=> d!46263 m!174981))

(assert (=> d!46263 m!174423))

(assert (=> d!46263 m!174421))

(assert (=> d!46263 m!174429))

(declare-fun m!174983 () Bool)

(assert (=> d!46263 m!174983))

(assert (=> b!144865 d!46263))

(declare-fun d!46265 () Bool)

(assert (=> d!46265 (= (apply!123 (+!170 lt!75964 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!75977) (apply!123 lt!75964 lt!75977))))

(declare-fun lt!76337 () Unit!4581)

(assert (=> d!46265 (= lt!76337 (choose!903 lt!75964 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992))) lt!75977))))

(declare-fun e!94708 () Bool)

(assert (=> d!46265 e!94708))

(declare-fun res!69182 () Bool)

(assert (=> d!46265 (=> (not res!69182) (not e!94708))))

(assert (=> d!46265 (= res!69182 (contains!924 lt!75964 lt!75977))))

(assert (=> d!46265 (= (addApplyDifferent!99 lt!75964 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992))) lt!75977) lt!76337)))

(declare-fun b!145389 () Bool)

(assert (=> b!145389 (= e!94708 (not (= lt!75977 lt!75981)))))

(assert (= (and d!46265 res!69182) b!145389))

(assert (=> d!46265 m!174411))

(declare-fun m!174985 () Bool)

(assert (=> d!46265 m!174985))

(assert (=> d!46265 m!174425))

(assert (=> d!46265 m!174411))

(assert (=> d!46265 m!174413))

(declare-fun m!174987 () Bool)

(assert (=> d!46265 m!174987))

(assert (=> b!144865 d!46265))

(declare-fun d!46267 () Bool)

(assert (=> d!46267 (= (apply!123 (+!170 lt!75964 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!75977) (get!1549 (getValueByKey!177 (toList!878 (+!170 lt!75964 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))) lt!75977)))))

(declare-fun bs!6099 () Bool)

(assert (= bs!6099 d!46267))

(declare-fun m!174989 () Bool)

(assert (=> bs!6099 m!174989))

(assert (=> bs!6099 m!174989))

(declare-fun m!174991 () Bool)

(assert (=> bs!6099 m!174991))

(assert (=> b!144865 d!46267))

(declare-fun d!46269 () Bool)

(declare-fun e!94709 () Bool)

(assert (=> d!46269 e!94709))

(declare-fun res!69184 () Bool)

(assert (=> d!46269 (=> (not res!69184) (not e!94709))))

(declare-fun lt!76338 () ListLongMap!1725)

(assert (=> d!46269 (= res!69184 (contains!924 lt!76338 (_1!1353 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(declare-fun lt!76339 () List!1755)

(assert (=> d!46269 (= lt!76338 (ListLongMap!1726 lt!76339))))

(declare-fun lt!76341 () Unit!4581)

(declare-fun lt!76340 () Unit!4581)

(assert (=> d!46269 (= lt!76341 lt!76340)))

(assert (=> d!46269 (= (getValueByKey!177 lt!76339 (_1!1353 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))) (Some!182 (_2!1353 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46269 (= lt!76340 (lemmaContainsTupThenGetReturnValue!94 lt!76339 (_1!1353 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))) (_2!1353 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46269 (= lt!76339 (insertStrictlySorted!97 (toList!878 lt!75965) (_1!1353 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))) (_2!1353 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46269 (= (+!170 lt!75965 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!76338)))

(declare-fun b!145390 () Bool)

(declare-fun res!69183 () Bool)

(assert (=> b!145390 (=> (not res!69183) (not e!94709))))

(assert (=> b!145390 (= res!69183 (= (getValueByKey!177 (toList!878 lt!76338) (_1!1353 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))) (Some!182 (_2!1353 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))))))))

(declare-fun b!145391 () Bool)

(assert (=> b!145391 (= e!94709 (contains!927 (toList!878 lt!76338) (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))))))

(assert (= (and d!46269 res!69184) b!145390))

(assert (= (and b!145390 res!69183) b!145391))

(declare-fun m!174993 () Bool)

(assert (=> d!46269 m!174993))

(declare-fun m!174995 () Bool)

(assert (=> d!46269 m!174995))

(declare-fun m!174997 () Bool)

(assert (=> d!46269 m!174997))

(declare-fun m!174999 () Bool)

(assert (=> d!46269 m!174999))

(declare-fun m!175001 () Bool)

(assert (=> b!145390 m!175001))

(declare-fun m!175003 () Bool)

(assert (=> b!145391 m!175003))

(assert (=> b!144865 d!46269))

(declare-fun d!46271 () Bool)

(assert (=> d!46271 (= (apply!123 (+!170 lt!75965 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!75966) (get!1549 (getValueByKey!177 (toList!878 (+!170 lt!75965 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))) lt!75966)))))

(declare-fun bs!6100 () Bool)

(assert (= bs!6100 d!46271))

(declare-fun m!175005 () Bool)

(assert (=> bs!6100 m!175005))

(assert (=> bs!6100 m!175005))

(declare-fun m!175007 () Bool)

(assert (=> bs!6100 m!175007))

(assert (=> b!144865 d!46271))

(declare-fun d!46273 () Bool)

(declare-fun e!94710 () Bool)

(assert (=> d!46273 e!94710))

(declare-fun res!69186 () Bool)

(assert (=> d!46273 (=> (not res!69186) (not e!94710))))

(declare-fun lt!76342 () ListLongMap!1725)

(assert (=> d!46273 (= res!69186 (contains!924 lt!76342 (_1!1353 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(declare-fun lt!76343 () List!1755)

(assert (=> d!46273 (= lt!76342 (ListLongMap!1726 lt!76343))))

(declare-fun lt!76345 () Unit!4581)

(declare-fun lt!76344 () Unit!4581)

(assert (=> d!46273 (= lt!76345 lt!76344)))

(assert (=> d!46273 (= (getValueByKey!177 lt!76343 (_1!1353 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))) (Some!182 (_2!1353 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46273 (= lt!76344 (lemmaContainsTupThenGetReturnValue!94 lt!76343 (_1!1353 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) (_2!1353 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46273 (= lt!76343 (insertStrictlySorted!97 (toList!878 lt!75964) (_1!1353 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) (_2!1353 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46273 (= (+!170 lt!75964 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!76342)))

(declare-fun b!145392 () Bool)

(declare-fun res!69185 () Bool)

(assert (=> b!145392 (=> (not res!69185) (not e!94710))))

(assert (=> b!145392 (= res!69185 (= (getValueByKey!177 (toList!878 lt!76342) (_1!1353 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))) (Some!182 (_2!1353 (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))))))

(declare-fun b!145393 () Bool)

(assert (=> b!145393 (= e!94710 (contains!927 (toList!878 lt!76342) (tuple2!2685 lt!75981 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))))

(assert (= (and d!46273 res!69186) b!145392))

(assert (= (and b!145392 res!69185) b!145393))

(declare-fun m!175009 () Bool)

(assert (=> d!46273 m!175009))

(declare-fun m!175011 () Bool)

(assert (=> d!46273 m!175011))

(declare-fun m!175013 () Bool)

(assert (=> d!46273 m!175013))

(declare-fun m!175015 () Bool)

(assert (=> d!46273 m!175015))

(declare-fun m!175017 () Bool)

(assert (=> b!145392 m!175017))

(declare-fun m!175019 () Bool)

(assert (=> b!145393 m!175019))

(assert (=> b!144865 d!46273))

(declare-fun d!46275 () Bool)

(assert (=> d!46275 (= (apply!123 (+!170 lt!75969 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!75972) (get!1549 (getValueByKey!177 (toList!878 (+!170 lt!75969 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))) lt!75972)))))

(declare-fun bs!6101 () Bool)

(assert (= bs!6101 d!46275))

(declare-fun m!175021 () Bool)

(assert (=> bs!6101 m!175021))

(assert (=> bs!6101 m!175021))

(declare-fun m!175023 () Bool)

(assert (=> bs!6101 m!175023))

(assert (=> b!144865 d!46275))

(declare-fun d!46277 () Bool)

(declare-fun e!94711 () Bool)

(assert (=> d!46277 e!94711))

(declare-fun res!69188 () Bool)

(assert (=> d!46277 (=> (not res!69188) (not e!94711))))

(declare-fun lt!76346 () ListLongMap!1725)

(assert (=> d!46277 (= res!69188 (contains!924 lt!76346 (_1!1353 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(declare-fun lt!76347 () List!1755)

(assert (=> d!46277 (= lt!76346 (ListLongMap!1726 lt!76347))))

(declare-fun lt!76349 () Unit!4581)

(declare-fun lt!76348 () Unit!4581)

(assert (=> d!46277 (= lt!76349 lt!76348)))

(assert (=> d!46277 (= (getValueByKey!177 lt!76347 (_1!1353 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))) (Some!182 (_2!1353 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46277 (= lt!76348 (lemmaContainsTupThenGetReturnValue!94 lt!76347 (_1!1353 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) (_2!1353 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46277 (= lt!76347 (insertStrictlySorted!97 (toList!878 lt!75969) (_1!1353 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) (_2!1353 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))))))

(assert (=> d!46277 (= (+!170 lt!75969 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!76346)))

(declare-fun b!145394 () Bool)

(declare-fun res!69187 () Bool)

(assert (=> b!145394 (=> (not res!69187) (not e!94711))))

(assert (=> b!145394 (= res!69187 (= (getValueByKey!177 (toList!878 lt!76346) (_1!1353 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992)))))) (Some!182 (_2!1353 (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))))))

(declare-fun b!145395 () Bool)

(assert (=> b!145395 (= e!94711 (contains!927 (toList!878 lt!76346) (tuple2!2685 lt!75962 (minValue!2834 (v!3314 (underlying!485 thiss!992))))))))

(assert (= (and d!46277 res!69188) b!145394))

(assert (= (and b!145394 res!69187) b!145395))

(declare-fun m!175025 () Bool)

(assert (=> d!46277 m!175025))

(declare-fun m!175027 () Bool)

(assert (=> d!46277 m!175027))

(declare-fun m!175029 () Bool)

(assert (=> d!46277 m!175029))

(declare-fun m!175031 () Bool)

(assert (=> d!46277 m!175031))

(declare-fun m!175033 () Bool)

(assert (=> b!145394 m!175033))

(declare-fun m!175035 () Bool)

(assert (=> b!145395 m!175035))

(assert (=> b!144865 d!46277))

(declare-fun d!46279 () Bool)

(declare-fun e!94713 () Bool)

(assert (=> d!46279 e!94713))

(declare-fun res!69189 () Bool)

(assert (=> d!46279 (=> res!69189 e!94713)))

(declare-fun lt!76351 () Bool)

(assert (=> d!46279 (= res!69189 (not lt!76351))))

(declare-fun lt!76350 () Bool)

(assert (=> d!46279 (= lt!76351 lt!76350)))

(declare-fun lt!76353 () Unit!4581)

(declare-fun e!94712 () Unit!4581)

(assert (=> d!46279 (= lt!76353 e!94712)))

(declare-fun c!27585 () Bool)

(assert (=> d!46279 (= c!27585 lt!76350)))

(assert (=> d!46279 (= lt!76350 (containsKey!181 (toList!878 (+!170 lt!75971 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))) lt!75978))))

(assert (=> d!46279 (= (contains!924 (+!170 lt!75971 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!75978) lt!76351)))

(declare-fun b!145396 () Bool)

(declare-fun lt!76352 () Unit!4581)

(assert (=> b!145396 (= e!94712 lt!76352)))

(assert (=> b!145396 (= lt!76352 (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!878 (+!170 lt!75971 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))) lt!75978))))

(assert (=> b!145396 (isDefined!131 (getValueByKey!177 (toList!878 (+!170 lt!75971 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))) lt!75978))))

(declare-fun b!145397 () Bool)

(declare-fun Unit!4600 () Unit!4581)

(assert (=> b!145397 (= e!94712 Unit!4600)))

(declare-fun b!145398 () Bool)

(assert (=> b!145398 (= e!94713 (isDefined!131 (getValueByKey!177 (toList!878 (+!170 lt!75971 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992)))))) lt!75978)))))

(assert (= (and d!46279 c!27585) b!145396))

(assert (= (and d!46279 (not c!27585)) b!145397))

(assert (= (and d!46279 (not res!69189)) b!145398))

(declare-fun m!175037 () Bool)

(assert (=> d!46279 m!175037))

(declare-fun m!175039 () Bool)

(assert (=> b!145396 m!175039))

(declare-fun m!175041 () Bool)

(assert (=> b!145396 m!175041))

(assert (=> b!145396 m!175041))

(declare-fun m!175043 () Bool)

(assert (=> b!145396 m!175043))

(assert (=> b!145398 m!175041))

(assert (=> b!145398 m!175041))

(assert (=> b!145398 m!175043))

(assert (=> b!144865 d!46279))

(declare-fun d!46281 () Bool)

(assert (=> d!46281 (= (apply!123 lt!75969 lt!75972) (get!1549 (getValueByKey!177 (toList!878 lt!75969) lt!75972)))))

(declare-fun bs!6102 () Bool)

(assert (= bs!6102 d!46281))

(declare-fun m!175045 () Bool)

(assert (=> bs!6102 m!175045))

(assert (=> bs!6102 m!175045))

(declare-fun m!175047 () Bool)

(assert (=> bs!6102 m!175047))

(assert (=> b!144865 d!46281))

(declare-fun d!46283 () Bool)

(assert (=> d!46283 (= (apply!123 lt!75964 lt!75977) (get!1549 (getValueByKey!177 (toList!878 lt!75964) lt!75977)))))

(declare-fun bs!6103 () Bool)

(assert (= bs!6103 d!46283))

(declare-fun m!175049 () Bool)

(assert (=> bs!6103 m!175049))

(assert (=> bs!6103 m!175049))

(declare-fun m!175051 () Bool)

(assert (=> bs!6103 m!175051))

(assert (=> b!144865 d!46283))

(declare-fun d!46285 () Bool)

(assert (=> d!46285 (contains!924 (+!170 lt!75971 (tuple2!2685 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!75978)))

(declare-fun lt!76356 () Unit!4581)

(declare-fun choose!904 (ListLongMap!1725 (_ BitVec 64) V!3577 (_ BitVec 64)) Unit!4581)

(assert (=> d!46285 (= lt!76356 (choose!904 lt!75971 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) lt!75978))))

(assert (=> d!46285 (contains!924 lt!75971 lt!75978)))

(assert (=> d!46285 (= (addStillContains!99 lt!75971 lt!75976 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) lt!75978) lt!76356)))

(declare-fun bs!6104 () Bool)

(assert (= bs!6104 d!46285))

(assert (=> bs!6104 m!174415))

(assert (=> bs!6104 m!174415))

(assert (=> bs!6104 m!174427))

(declare-fun m!175053 () Bool)

(assert (=> bs!6104 m!175053))

(declare-fun m!175055 () Bool)

(assert (=> bs!6104 m!175055))

(assert (=> b!144865 d!46285))

(assert (=> b!144865 d!46233))

(declare-fun d!46287 () Bool)

(assert (=> d!46287 (= (apply!123 lt!75965 lt!75966) (get!1549 (getValueByKey!177 (toList!878 lt!75965) lt!75966)))))

(declare-fun bs!6105 () Bool)

(assert (= bs!6105 d!46287))

(declare-fun m!175057 () Bool)

(assert (=> bs!6105 m!175057))

(assert (=> bs!6105 m!175057))

(declare-fun m!175059 () Bool)

(assert (=> bs!6105 m!175059))

(assert (=> b!144865 d!46287))

(declare-fun d!46289 () Bool)

(assert (=> d!46289 (= (apply!123 (+!170 lt!75965 (tuple2!2685 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))))) lt!75966) (apply!123 lt!75965 lt!75966))))

(declare-fun lt!76357 () Unit!4581)

(assert (=> d!46289 (= lt!76357 (choose!903 lt!75965 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) lt!75966))))

(declare-fun e!94714 () Bool)

(assert (=> d!46289 e!94714))

(declare-fun res!69190 () Bool)

(assert (=> d!46289 (=> (not res!69190) (not e!94714))))

(assert (=> d!46289 (= res!69190 (contains!924 lt!75965 lt!75966))))

(assert (=> d!46289 (= (addApplyDifferent!99 lt!75965 lt!75967 (zeroValue!2834 (v!3314 (underlying!485 thiss!992))) lt!75966) lt!76357)))

(declare-fun b!145400 () Bool)

(assert (=> b!145400 (= e!94714 (not (= lt!75966 lt!75967)))))

(assert (= (and d!46289 res!69190) b!145400))

(assert (=> d!46289 m!174417))

(declare-fun m!175061 () Bool)

(assert (=> d!46289 m!175061))

(assert (=> d!46289 m!174439))

(assert (=> d!46289 m!174417))

(assert (=> d!46289 m!174419))

(declare-fun m!175063 () Bool)

(assert (=> d!46289 m!175063))

(assert (=> b!144865 d!46289))

(declare-fun b!145401 () Bool)

(declare-fun e!94717 () ListLongMap!1725)

(declare-fun call!16239 () ListLongMap!1725)

(assert (=> b!145401 (= e!94717 call!16239)))

(declare-fun b!145402 () Bool)

(declare-fun e!94723 () Unit!4581)

(declare-fun lt!76372 () Unit!4581)

(assert (=> b!145402 (= e!94723 lt!76372)))

(declare-fun lt!76368 () ListLongMap!1725)

(assert (=> b!145402 (= lt!76368 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (ite (or c!27501 c!27495) (_values!2971 newMap!16) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (index!3307 lt!76060) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16)))) (mask!7351 newMap!16) (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76373 () (_ BitVec 64))

(assert (=> b!145402 (= lt!76373 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76375 () (_ BitVec 64))

(assert (=> b!145402 (= lt!76375 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76360 () Unit!4581)

(assert (=> b!145402 (= lt!76360 (addStillContains!99 lt!76368 lt!76373 (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) lt!76375))))

(assert (=> b!145402 (contains!924 (+!170 lt!76368 (tuple2!2685 lt!76373 (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)))) lt!76375)))

(declare-fun lt!76358 () Unit!4581)

(assert (=> b!145402 (= lt!76358 lt!76360)))

(declare-fun lt!76366 () ListLongMap!1725)

(assert (=> b!145402 (= lt!76366 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (ite (or c!27501 c!27495) (_values!2971 newMap!16) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (index!3307 lt!76060) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16)))) (mask!7351 newMap!16) (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76359 () (_ BitVec 64))

(assert (=> b!145402 (= lt!76359 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76369 () (_ BitVec 64))

(assert (=> b!145402 (= lt!76369 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76379 () Unit!4581)

(assert (=> b!145402 (= lt!76379 (addApplyDifferent!99 lt!76366 lt!76359 (minValue!2834 newMap!16) lt!76369))))

(assert (=> b!145402 (= (apply!123 (+!170 lt!76366 (tuple2!2685 lt!76359 (minValue!2834 newMap!16))) lt!76369) (apply!123 lt!76366 lt!76369))))

(declare-fun lt!76370 () Unit!4581)

(assert (=> b!145402 (= lt!76370 lt!76379)))

(declare-fun lt!76362 () ListLongMap!1725)

(assert (=> b!145402 (= lt!76362 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (ite (or c!27501 c!27495) (_values!2971 newMap!16) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (index!3307 lt!76060) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16)))) (mask!7351 newMap!16) (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76364 () (_ BitVec 64))

(assert (=> b!145402 (= lt!76364 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76363 () (_ BitVec 64))

(assert (=> b!145402 (= lt!76363 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76377 () Unit!4581)

(assert (=> b!145402 (= lt!76377 (addApplyDifferent!99 lt!76362 lt!76364 (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) lt!76363))))

(assert (=> b!145402 (= (apply!123 (+!170 lt!76362 (tuple2!2685 lt!76364 (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)))) lt!76363) (apply!123 lt!76362 lt!76363))))

(declare-fun lt!76371 () Unit!4581)

(assert (=> b!145402 (= lt!76371 lt!76377)))

(declare-fun lt!76361 () ListLongMap!1725)

(assert (=> b!145402 (= lt!76361 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (ite (or c!27501 c!27495) (_values!2971 newMap!16) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (index!3307 lt!76060) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16)))) (mask!7351 newMap!16) (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun lt!76378 () (_ BitVec 64))

(assert (=> b!145402 (= lt!76378 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76374 () (_ BitVec 64))

(assert (=> b!145402 (= lt!76374 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145402 (= lt!76372 (addApplyDifferent!99 lt!76361 lt!76378 (minValue!2834 newMap!16) lt!76374))))

(assert (=> b!145402 (= (apply!123 (+!170 lt!76361 (tuple2!2685 lt!76378 (minValue!2834 newMap!16))) lt!76374) (apply!123 lt!76361 lt!76374))))

(declare-fun b!145403 () Bool)

(declare-fun res!69193 () Bool)

(declare-fun e!94724 () Bool)

(assert (=> b!145403 (=> (not res!69193) (not e!94724))))

(declare-fun e!94725 () Bool)

(assert (=> b!145403 (= res!69193 e!94725)))

(declare-fun res!69198 () Bool)

(assert (=> b!145403 (=> res!69198 e!94725)))

(declare-fun e!94726 () Bool)

(assert (=> b!145403 (= res!69198 (not e!94726))))

(declare-fun res!69196 () Bool)

(assert (=> b!145403 (=> (not res!69196) (not e!94726))))

(assert (=> b!145403 (= res!69196 (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(declare-fun b!145404 () Bool)

(declare-fun e!94715 () ListLongMap!1725)

(assert (=> b!145404 (= e!94715 call!16239)))

(declare-fun b!145405 () Bool)

(declare-fun Unit!4601 () Unit!4581)

(assert (=> b!145405 (= e!94723 Unit!4601)))

(declare-fun b!145406 () Bool)

(declare-fun e!94720 () Bool)

(declare-fun e!94718 () Bool)

(assert (=> b!145406 (= e!94720 e!94718)))

(declare-fun res!69199 () Bool)

(declare-fun call!16236 () Bool)

(assert (=> b!145406 (= res!69199 call!16236)))

(assert (=> b!145406 (=> (not res!69199) (not e!94718))))

(declare-fun b!145407 () Bool)

(declare-fun e!94722 () Bool)

(assert (=> b!145407 (= e!94722 (validKeyInArray!0 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!16230 () Bool)

(declare-fun call!16235 () ListLongMap!1725)

(declare-fun call!16233 () ListLongMap!1725)

(assert (=> bm!16230 (= call!16235 call!16233)))

(declare-fun lt!76365 () ListLongMap!1725)

(declare-fun b!145408 () Bool)

(assert (=> b!145408 (= e!94718 (= (apply!123 lt!76365 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16))))))

(declare-fun b!145409 () Bool)

(declare-fun e!94727 () ListLongMap!1725)

(assert (=> b!145409 (= e!94727 e!94715)))

(declare-fun c!27586 () Bool)

(assert (=> b!145409 (= c!27586 (and (not (= (bvand (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!145410 () Bool)

(assert (=> b!145410 (= e!94726 (validKeyInArray!0 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145411 () Bool)

(declare-fun e!94716 () Bool)

(declare-fun call!16237 () Bool)

(assert (=> b!145411 (= e!94716 (not call!16237))))

(declare-fun b!145412 () Bool)

(declare-fun e!94719 () Bool)

(assert (=> b!145412 (= e!94725 e!94719)))

(declare-fun res!69194 () Bool)

(assert (=> b!145412 (=> (not res!69194) (not e!94719))))

(assert (=> b!145412 (= res!69194 (contains!924 lt!76365 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!145412 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(declare-fun b!145413 () Bool)

(declare-fun res!69197 () Bool)

(assert (=> b!145413 (=> (not res!69197) (not e!94724))))

(assert (=> b!145413 (= res!69197 e!94720)))

(declare-fun c!27590 () Bool)

(assert (=> b!145413 (= c!27590 (not (= (bvand (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!46291 () Bool)

(assert (=> d!46291 e!94724))

(declare-fun res!69192 () Bool)

(assert (=> d!46291 (=> (not res!69192) (not e!94724))))

(assert (=> d!46291 (= res!69192 (or (bvsge #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))))

(declare-fun lt!76376 () ListLongMap!1725)

(assert (=> d!46291 (= lt!76365 lt!76376)))

(declare-fun lt!76367 () Unit!4581)

(assert (=> d!46291 (= lt!76367 e!94723)))

(declare-fun c!27587 () Bool)

(assert (=> d!46291 (= c!27587 e!94722)))

(declare-fun res!69195 () Bool)

(assert (=> d!46291 (=> (not res!69195) (not e!94722))))

(assert (=> d!46291 (= res!69195 (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(assert (=> d!46291 (= lt!76376 e!94727)))

(declare-fun c!27591 () Bool)

(assert (=> d!46291 (= c!27591 (and (not (= (bvand (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46291 (validMask!0 (mask!7351 newMap!16))))

(assert (=> d!46291 (= (getCurrentListMap!537 (_keys!4754 newMap!16) (ite (or c!27501 c!27495) (_values!2971 newMap!16) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (index!3307 lt!76060) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16)))) (mask!7351 newMap!16) (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)) lt!76365)))

(declare-fun b!145414 () Bool)

(declare-fun call!16234 () ListLongMap!1725)

(assert (=> b!145414 (= e!94727 (+!170 call!16234 (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 newMap!16))))))

(declare-fun b!145415 () Bool)

(assert (=> b!145415 (= e!94720 (not call!16236))))

(declare-fun b!145416 () Bool)

(declare-fun e!94721 () Bool)

(assert (=> b!145416 (= e!94716 e!94721)))

(declare-fun res!69191 () Bool)

(assert (=> b!145416 (= res!69191 call!16237)))

(assert (=> b!145416 (=> (not res!69191) (not e!94721))))

(declare-fun b!145417 () Bool)

(assert (=> b!145417 (= e!94719 (= (apply!123 lt!76365 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)) (get!1545 (select (arr!2321 (ite (or c!27501 c!27495) (_values!2971 newMap!16) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (index!3307 lt!76060) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!441 (defaultEntry!2988 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2597 (ite (or c!27501 c!27495) (_values!2971 newMap!16) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (index!3307 lt!76060) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16)))))))))

(assert (=> b!145417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(declare-fun b!145418 () Bool)

(assert (=> b!145418 (= e!94717 call!16235)))

(declare-fun b!145419 () Bool)

(assert (=> b!145419 (= e!94721 (= (apply!123 lt!76365 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2834 newMap!16)))))

(declare-fun bm!16231 () Bool)

(declare-fun call!16238 () ListLongMap!1725)

(assert (=> bm!16231 (= call!16238 (getCurrentListMapNoExtraKeys!135 (_keys!4754 newMap!16) (ite (or c!27501 c!27495) (_values!2971 newMap!16) (array!4918 (store (arr!2321 (_values!2971 newMap!16)) (index!3307 lt!76060) (ValueCellFull!1130 (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2597 (_values!2971 newMap!16)))) (mask!7351 newMap!16) (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16)) (minValue!2834 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2988 newMap!16)))))

(declare-fun bm!16232 () Bool)

(assert (=> bm!16232 (= call!16234 (+!170 (ite c!27591 call!16238 (ite c!27586 call!16233 call!16235)) (ite (or c!27591 c!27586) (tuple2!2685 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!27501 c!27496) (get!1545 (select (arr!2321 (_values!2971 (v!3314 (underlying!485 thiss!992)))) from!355) (dynLambda!441 (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2834 newMap!16))) (tuple2!2685 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2834 newMap!16)))))))

(declare-fun bm!16233 () Bool)

(assert (=> bm!16233 (= call!16239 call!16234)))

(declare-fun bm!16234 () Bool)

(assert (=> bm!16234 (= call!16233 call!16238)))

(declare-fun b!145420 () Bool)

(assert (=> b!145420 (= e!94724 e!94716)))

(declare-fun c!27589 () Bool)

(assert (=> b!145420 (= c!27589 (not (= (bvand (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16235 () Bool)

(assert (=> bm!16235 (= call!16236 (contains!924 lt!76365 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145421 () Bool)

(declare-fun c!27588 () Bool)

(assert (=> b!145421 (= c!27588 (and (not (= (bvand (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!27501 c!27496) lt!76074 (extraKeys!2735 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!145421 (= e!94715 e!94717)))

(declare-fun bm!16236 () Bool)

(assert (=> bm!16236 (= call!16237 (contains!924 lt!76365 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46291 c!27591) b!145414))

(assert (= (and d!46291 (not c!27591)) b!145409))

(assert (= (and b!145409 c!27586) b!145404))

(assert (= (and b!145409 (not c!27586)) b!145421))

(assert (= (and b!145421 c!27588) b!145401))

(assert (= (and b!145421 (not c!27588)) b!145418))

(assert (= (or b!145401 b!145418) bm!16230))

(assert (= (or b!145404 bm!16230) bm!16234))

(assert (= (or b!145404 b!145401) bm!16233))

(assert (= (or b!145414 bm!16234) bm!16231))

(assert (= (or b!145414 bm!16233) bm!16232))

(assert (= (and d!46291 res!69195) b!145407))

(assert (= (and d!46291 c!27587) b!145402))

(assert (= (and d!46291 (not c!27587)) b!145405))

(assert (= (and d!46291 res!69192) b!145403))

(assert (= (and b!145403 res!69196) b!145410))

(assert (= (and b!145403 (not res!69198)) b!145412))

(assert (= (and b!145412 res!69194) b!145417))

(assert (= (and b!145403 res!69193) b!145413))

(assert (= (and b!145413 c!27590) b!145406))

(assert (= (and b!145413 (not c!27590)) b!145415))

(assert (= (and b!145406 res!69199) b!145408))

(assert (= (or b!145406 b!145415) bm!16235))

(assert (= (and b!145413 res!69197) b!145420))

(assert (= (and b!145420 c!27589) b!145416))

(assert (= (and b!145420 (not c!27589)) b!145411))

(assert (= (and b!145416 res!69191) b!145419))

(assert (= (or b!145416 b!145411) bm!16236))

(declare-fun b_lambda!6501 () Bool)

(assert (=> (not b_lambda!6501) (not b!145417)))

(assert (=> b!145417 t!6400))

(declare-fun b_and!9037 () Bool)

(assert (= b_and!9033 (and (=> t!6400 result!4267) b_and!9037)))

(assert (=> b!145417 t!6402))

(declare-fun b_and!9039 () Bool)

(assert (= b_and!9035 (and (=> t!6402 result!4269) b_and!9039)))

(assert (=> d!46291 m!174577))

(declare-fun m!175065 () Bool)

(assert (=> bm!16231 m!175065))

(declare-fun m!175067 () Bool)

(assert (=> bm!16236 m!175067))

(declare-fun m!175069 () Bool)

(assert (=> b!145414 m!175069))

(declare-fun m!175071 () Bool)

(assert (=> bm!16235 m!175071))

(declare-fun m!175073 () Bool)

(assert (=> bm!16232 m!175073))

(declare-fun m!175075 () Bool)

(assert (=> b!145408 m!175075))

(declare-fun m!175077 () Bool)

(assert (=> b!145417 m!175077))

(assert (=> b!145417 m!174593))

(declare-fun m!175079 () Bool)

(assert (=> b!145417 m!175079))

(assert (=> b!145417 m!174593))

(assert (=> b!145417 m!175077))

(assert (=> b!145417 m!174597))

(declare-fun m!175081 () Bool)

(assert (=> b!145417 m!175081))

(assert (=> b!145417 m!174597))

(assert (=> b!145412 m!174593))

(assert (=> b!145412 m!174593))

(declare-fun m!175083 () Bool)

(assert (=> b!145412 m!175083))

(declare-fun m!175085 () Bool)

(assert (=> b!145419 m!175085))

(assert (=> b!145410 m!174593))

(assert (=> b!145410 m!174593))

(assert (=> b!145410 m!174605))

(declare-fun m!175087 () Bool)

(assert (=> b!145402 m!175087))

(assert (=> b!145402 m!175065))

(assert (=> b!145402 m!174593))

(assert (=> b!145402 m!175087))

(declare-fun m!175089 () Bool)

(assert (=> b!145402 m!175089))

(declare-fun m!175091 () Bool)

(assert (=> b!145402 m!175091))

(declare-fun m!175093 () Bool)

(assert (=> b!145402 m!175093))

(declare-fun m!175095 () Bool)

(assert (=> b!145402 m!175095))

(declare-fun m!175097 () Bool)

(assert (=> b!145402 m!175097))

(declare-fun m!175099 () Bool)

(assert (=> b!145402 m!175099))

(declare-fun m!175101 () Bool)

(assert (=> b!145402 m!175101))

(assert (=> b!145402 m!175093))

(assert (=> b!145402 m!175091))

(declare-fun m!175103 () Bool)

(assert (=> b!145402 m!175103))

(assert (=> b!145402 m!175097))

(declare-fun m!175105 () Bool)

(assert (=> b!145402 m!175105))

(declare-fun m!175107 () Bool)

(assert (=> b!145402 m!175107))

(declare-fun m!175109 () Bool)

(assert (=> b!145402 m!175109))

(declare-fun m!175111 () Bool)

(assert (=> b!145402 m!175111))

(declare-fun m!175113 () Bool)

(assert (=> b!145402 m!175113))

(declare-fun m!175115 () Bool)

(assert (=> b!145402 m!175115))

(assert (=> b!145407 m!174593))

(assert (=> b!145407 m!174593))

(assert (=> b!145407 m!174605))

(assert (=> bm!16188 d!46291))

(declare-fun d!46293 () Bool)

(declare-fun isEmpty!429 (Option!183) Bool)

(assert (=> d!46293 (= (isDefined!131 (getValueByKey!177 (toList!878 lt!75876) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355))) (not (isEmpty!429 (getValueByKey!177 (toList!878 lt!75876) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))))

(declare-fun bs!6106 () Bool)

(assert (= bs!6106 d!46293))

(assert (=> bs!6106 m!174481))

(declare-fun m!175117 () Bool)

(assert (=> bs!6106 m!175117))

(assert (=> b!144946 d!46293))

(declare-fun b!145431 () Bool)

(declare-fun e!94732 () Option!183)

(declare-fun e!94733 () Option!183)

(assert (=> b!145431 (= e!94732 e!94733)))

(declare-fun c!27597 () Bool)

(assert (=> b!145431 (= c!27597 (and ((_ is Cons!1751) (toList!878 lt!75876)) (not (= (_1!1353 (h!2359 (toList!878 lt!75876))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))))

(declare-fun b!145433 () Bool)

(assert (=> b!145433 (= e!94733 None!181)))

(declare-fun c!27596 () Bool)

(declare-fun d!46295 () Bool)

(assert (=> d!46295 (= c!27596 (and ((_ is Cons!1751) (toList!878 lt!75876)) (= (_1!1353 (h!2359 (toList!878 lt!75876))) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355))))))

(assert (=> d!46295 (= (getValueByKey!177 (toList!878 lt!75876) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) e!94732)))

(declare-fun b!145432 () Bool)

(assert (=> b!145432 (= e!94733 (getValueByKey!177 (t!6387 (toList!878 lt!75876)) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun b!145430 () Bool)

(assert (=> b!145430 (= e!94732 (Some!182 (_2!1353 (h!2359 (toList!878 lt!75876)))))))

(assert (= (and d!46295 c!27596) b!145430))

(assert (= (and d!46295 (not c!27596)) b!145431))

(assert (= (and b!145431 c!27597) b!145432))

(assert (= (and b!145431 (not c!27597)) b!145433))

(assert (=> b!145432 m!174253))

(declare-fun m!175119 () Bool)

(assert (=> b!145432 m!175119))

(assert (=> b!144946 d!46295))

(declare-fun d!46297 () Bool)

(assert (=> d!46297 (isDefined!131 (getValueByKey!177 (toList!878 lt!75876) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun lt!76382 () Unit!4581)

(declare-fun choose!905 (List!1755 (_ BitVec 64)) Unit!4581)

(assert (=> d!46297 (= lt!76382 (choose!905 (toList!878 lt!75876) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(declare-fun e!94736 () Bool)

(assert (=> d!46297 e!94736))

(declare-fun res!69202 () Bool)

(assert (=> d!46297 (=> (not res!69202) (not e!94736))))

(declare-fun isStrictlySorted!323 (List!1755) Bool)

(assert (=> d!46297 (= res!69202 (isStrictlySorted!323 (toList!878 lt!75876)))))

(assert (=> d!46297 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!130 (toList!878 lt!75876) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)) lt!76382)))

(declare-fun b!145436 () Bool)

(assert (=> b!145436 (= e!94736 (containsKey!181 (toList!878 lt!75876) (select (arr!2320 (_keys!4754 (v!3314 (underlying!485 thiss!992)))) from!355)))))

(assert (= (and d!46297 res!69202) b!145436))

(assert (=> d!46297 m!174253))

(assert (=> d!46297 m!174481))

(assert (=> d!46297 m!174481))

(assert (=> d!46297 m!174483))

(assert (=> d!46297 m!174253))

(declare-fun m!175121 () Bool)

(assert (=> d!46297 m!175121))

(declare-fun m!175123 () Bool)

(assert (=> d!46297 m!175123))

(assert (=> b!145436 m!174253))

(assert (=> b!145436 m!174477))

(assert (=> b!144944 d!46297))

(assert (=> b!144944 d!46293))

(assert (=> b!144944 d!46295))

(declare-fun b!145445 () Bool)

(declare-fun e!94743 () Bool)

(declare-fun call!16242 () Bool)

(assert (=> b!145445 (= e!94743 call!16242)))

(declare-fun b!145446 () Bool)

(declare-fun e!94744 () Bool)

(declare-fun e!94745 () Bool)

(assert (=> b!145446 (= e!94744 e!94745)))

(declare-fun c!27600 () Bool)

(assert (=> b!145446 (= c!27600 (validKeyInArray!0 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145447 () Bool)

(assert (=> b!145447 (= e!94745 call!16242)))

(declare-fun b!145448 () Bool)

(assert (=> b!145448 (= e!94745 e!94743)))

(declare-fun lt!76391 () (_ BitVec 64))

(assert (=> b!145448 (= lt!76391 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76389 () Unit!4581)

(assert (=> b!145448 (= lt!76389 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4754 newMap!16) lt!76391 #b00000000000000000000000000000000))))

(assert (=> b!145448 (arrayContainsKey!0 (_keys!4754 newMap!16) lt!76391 #b00000000000000000000000000000000)))

(declare-fun lt!76390 () Unit!4581)

(assert (=> b!145448 (= lt!76390 lt!76389)))

(declare-fun res!69208 () Bool)

(assert (=> b!145448 (= res!69208 (= (seekEntryOrOpen!0 (select (arr!2320 (_keys!4754 newMap!16)) #b00000000000000000000000000000000) (_keys!4754 newMap!16) (mask!7351 newMap!16)) (Found!285 #b00000000000000000000000000000000)))))

(assert (=> b!145448 (=> (not res!69208) (not e!94743))))

(declare-fun d!46299 () Bool)

(declare-fun res!69207 () Bool)

(assert (=> d!46299 (=> res!69207 e!94744)))

(assert (=> d!46299 (= res!69207 (bvsge #b00000000000000000000000000000000 (size!2596 (_keys!4754 newMap!16))))))

(assert (=> d!46299 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4754 newMap!16) (mask!7351 newMap!16)) e!94744)))

(declare-fun bm!16239 () Bool)

(assert (=> bm!16239 (= call!16242 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4754 newMap!16) (mask!7351 newMap!16)))))

(assert (= (and d!46299 (not res!69207)) b!145446))

(assert (= (and b!145446 c!27600) b!145448))

(assert (= (and b!145446 (not c!27600)) b!145447))

(assert (= (and b!145448 res!69208) b!145445))

(assert (= (or b!145445 b!145447) bm!16239))

(assert (=> b!145446 m!174593))

(assert (=> b!145446 m!174593))

(assert (=> b!145446 m!174605))

(assert (=> b!145448 m!174593))

(declare-fun m!175125 () Bool)

(assert (=> b!145448 m!175125))

(declare-fun m!175127 () Bool)

(assert (=> b!145448 m!175127))

(assert (=> b!145448 m!174593))

(declare-fun m!175129 () Bool)

(assert (=> b!145448 m!175129))

(declare-fun m!175131 () Bool)

(assert (=> bm!16239 m!175131))

(assert (=> b!144919 d!46299))

(declare-fun d!46301 () Bool)

(declare-fun res!69209 () Bool)

(declare-fun e!94746 () Bool)

(assert (=> d!46301 (=> res!69209 e!94746)))

(assert (=> d!46301 (= res!69209 ((_ is Nil!1751) (t!6386 lt!75877)))))

(assert (=> d!46301 (= (noDuplicate!55 (t!6386 lt!75877)) e!94746)))

(declare-fun b!145449 () Bool)

(declare-fun e!94747 () Bool)

(assert (=> b!145449 (= e!94746 e!94747)))

(declare-fun res!69210 () Bool)

(assert (=> b!145449 (=> (not res!69210) (not e!94747))))

(assert (=> b!145449 (= res!69210 (not (contains!923 (t!6386 (t!6386 lt!75877)) (h!2358 (t!6386 lt!75877)))))))

(declare-fun b!145450 () Bool)

(assert (=> b!145450 (= e!94747 (noDuplicate!55 (t!6386 (t!6386 lt!75877))))))

(assert (= (and d!46301 (not res!69209)) b!145449))

(assert (= (and b!145449 res!69210) b!145450))

(declare-fun m!175133 () Bool)

(assert (=> b!145449 m!175133))

(declare-fun m!175135 () Bool)

(assert (=> b!145450 m!175135))

(assert (=> b!144890 d!46301))

(assert (=> d!46161 d!46223))

(assert (=> b!144936 d!46147))

(assert (=> d!46145 d!46143))

(declare-fun d!46303 () Bool)

(assert (=> d!46303 (arrayNoDuplicates!0 (_keys!4754 (v!3314 (underlying!485 thiss!992))) from!355 Nil!1751)))

(assert (=> d!46303 true))

(declare-fun _$71!174 () Unit!4581)

(assert (=> d!46303 (= (choose!39 (_keys!4754 (v!3314 (underlying!485 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!174)))

(declare-fun bs!6107 () Bool)

(assert (= bs!6107 d!46303))

(assert (=> bs!6107 m!174265))

(assert (=> d!46145 d!46303))

(declare-fun mapNonEmpty!4921 () Bool)

(declare-fun mapRes!4921 () Bool)

(declare-fun tp!11707 () Bool)

(declare-fun e!94749 () Bool)

(assert (=> mapNonEmpty!4921 (= mapRes!4921 (and tp!11707 e!94749))))

(declare-fun mapRest!4921 () (Array (_ BitVec 32) ValueCell!1130))

(declare-fun mapValue!4921 () ValueCell!1130)

(declare-fun mapKey!4921 () (_ BitVec 32))

(assert (=> mapNonEmpty!4921 (= mapRest!4920 (store mapRest!4921 mapKey!4921 mapValue!4921))))

(declare-fun b!145452 () Bool)

(declare-fun e!94748 () Bool)

(assert (=> b!145452 (= e!94748 tp_is_empty!2947)))

(declare-fun condMapEmpty!4921 () Bool)

(declare-fun mapDefault!4921 () ValueCell!1130)

(assert (=> mapNonEmpty!4920 (= condMapEmpty!4921 (= mapRest!4920 ((as const (Array (_ BitVec 32) ValueCell!1130)) mapDefault!4921)))))

(assert (=> mapNonEmpty!4920 (= tp!11706 (and e!94748 mapRes!4921))))

(declare-fun b!145451 () Bool)

(assert (=> b!145451 (= e!94749 tp_is_empty!2947)))

(declare-fun mapIsEmpty!4921 () Bool)

(assert (=> mapIsEmpty!4921 mapRes!4921))

(assert (= (and mapNonEmpty!4920 condMapEmpty!4921) mapIsEmpty!4921))

(assert (= (and mapNonEmpty!4920 (not condMapEmpty!4921)) mapNonEmpty!4921))

(assert (= (and mapNonEmpty!4921 ((_ is ValueCellFull!1130) mapValue!4921)) b!145451))

(assert (= (and mapNonEmpty!4920 ((_ is ValueCellFull!1130) mapDefault!4921)) b!145452))

(declare-fun m!175137 () Bool)

(assert (=> mapNonEmpty!4921 m!175137))

(declare-fun mapNonEmpty!4922 () Bool)

(declare-fun mapRes!4922 () Bool)

(declare-fun tp!11708 () Bool)

(declare-fun e!94751 () Bool)

(assert (=> mapNonEmpty!4922 (= mapRes!4922 (and tp!11708 e!94751))))

(declare-fun mapValue!4922 () ValueCell!1130)

(declare-fun mapRest!4922 () (Array (_ BitVec 32) ValueCell!1130))

(declare-fun mapKey!4922 () (_ BitVec 32))

(assert (=> mapNonEmpty!4922 (= mapRest!4919 (store mapRest!4922 mapKey!4922 mapValue!4922))))

(declare-fun b!145454 () Bool)

(declare-fun e!94750 () Bool)

(assert (=> b!145454 (= e!94750 tp_is_empty!2947)))

(declare-fun condMapEmpty!4922 () Bool)

(declare-fun mapDefault!4922 () ValueCell!1130)

(assert (=> mapNonEmpty!4919 (= condMapEmpty!4922 (= mapRest!4919 ((as const (Array (_ BitVec 32) ValueCell!1130)) mapDefault!4922)))))

(assert (=> mapNonEmpty!4919 (= tp!11705 (and e!94750 mapRes!4922))))

(declare-fun b!145453 () Bool)

(assert (=> b!145453 (= e!94751 tp_is_empty!2947)))

(declare-fun mapIsEmpty!4922 () Bool)

(assert (=> mapIsEmpty!4922 mapRes!4922))

(assert (= (and mapNonEmpty!4919 condMapEmpty!4922) mapIsEmpty!4922))

(assert (= (and mapNonEmpty!4919 (not condMapEmpty!4922)) mapNonEmpty!4922))

(assert (= (and mapNonEmpty!4922 ((_ is ValueCellFull!1130) mapValue!4922)) b!145453))

(assert (= (and mapNonEmpty!4919 ((_ is ValueCellFull!1130) mapDefault!4922)) b!145454))

(declare-fun m!175139 () Bool)

(assert (=> mapNonEmpty!4922 m!175139))

(declare-fun b_lambda!6503 () Bool)

(assert (= b_lambda!6497 (or (and b!144677 b_free!3061) (and b!144678 b_free!3063 (= (defaultEntry!2988 newMap!16) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))))) b_lambda!6503)))

(declare-fun b_lambda!6505 () Bool)

(assert (= b_lambda!6501 (or (and b!144677 b_free!3061 (= (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) (defaultEntry!2988 newMap!16))) (and b!144678 b_free!3063) b_lambda!6505)))

(declare-fun b_lambda!6507 () Bool)

(assert (= b_lambda!6499 (or (and b!144677 b_free!3061) (and b!144678 b_free!3063 (= (defaultEntry!2988 newMap!16) (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))))) b_lambda!6507)))

(declare-fun b_lambda!6509 () Bool)

(assert (= b_lambda!6495 (or (and b!144677 b_free!3061 (= (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) (defaultEntry!2988 newMap!16))) (and b!144678 b_free!3063) b_lambda!6509)))

(declare-fun b_lambda!6511 () Bool)

(assert (= b_lambda!6493 (or (and b!144677 b_free!3061 (= (defaultEntry!2988 (v!3314 (underlying!485 thiss!992))) (defaultEntry!2988 newMap!16))) (and b!144678 b_free!3063) b_lambda!6511)))

(check-sat (not mapNonEmpty!4922) (not d!46211) (not b!145154) (not bm!16194) (not d!46303) (not b!145446) (not b!145097) (not b!145277) (not b!145229) (not b!145213) (not b!145141) (not d!46219) (not b!145390) (not b!145299) (not b!145398) (not b!145209) (not b!145148) (not b!145396) (not d!46267) (not b!145124) (not b!145245) (not b!145408) (not b!145286) (not bm!16202) (not d!46297) (not d!46207) (not b!145219) (not b!145384) (not b!145282) (not b!145372) (not b_lambda!6509) (not b_lambda!6487) (not bm!16228) (not d!46257) (not bm!16216) (not d!46175) (not b_next!3063) (not d!46287) (not d!46227) (not bm!16229) (not b!145208) (not b!145281) (not b!145366) (not d!46173) (not b!145376) (not bm!16201) (not b!145136) (not bm!16232) (not b!145122) (not d!46269) (not b!145234) (not b!145106) (not d!46177) (not bm!16236) (not b!145378) (not b!145110) (not b!145143) (not b!145322) (not b!145279) (not b!145383) (not b!145449) (not d!46281) (not b!145132) (not b!145407) (not b!145419) (not b!145216) (not d!46203) (not b!145402) (not b!145244) (not d!46225) (not b!145096) (not b!145117) (not d!46285) (not d!46163) (not b!145131) (not b!145448) (not d!46169) (not d!46243) (not b!145325) (not bm!16209) (not b!145247) (not d!46197) (not b!145163) (not bm!16217) (not b!145210) (not bm!16210) (not d!46273) (not bm!16195) (not b!145150) (not b!145095) (not b!145200) (not bm!16239) (not d!46283) (not b!145098) (not bm!16197) (not d!46233) (not bm!16208) (not d!46263) (not b!145330) (not b!145153) (not d!46213) (not d!46271) (not b_lambda!6507) (not bm!16227) (not b!145108) (not b_lambda!6505) (not b!145249) (not b_lambda!6491) (not b!145311) (not b!145392) (not bm!16190) (not d!46191) (not b!145157) (not d!46245) (not d!46183) (not d!46215) (not b!145100) (not b!145303) (not b!145283) (not d!46261) (not b!145289) (not b!145246) (not bm!16191) (not b!145301) (not b!145123) (not b!145369) (not bm!16235) (not b!145321) (not b!145391) (not b!145382) (not d!46279) (not mapNonEmpty!4921) (not bm!16213) b_and!9037 (not b!145287) (not b!145155) (not b!145294) (not b!145158) (not b!145432) (not b!145236) (not bm!16231) (not b!145302) (not d!46195) (not d!46235) (not b_next!3061) (not b!145161) (not b!145134) (not b!145436) (not d!46241) (not d!46289) (not b!145138) (not d!46265) (not d!46291) (not b_lambda!6511) (not b!145394) (not b!145126) (not b!145120) (not d!46221) (not b!145276) (not d!46167) (not b!145417) (not b!145293) (not b!145152) (not bm!16203) (not d!46165) tp_is_empty!2947 (not b!145121) b_and!9039 (not d!46277) (not d!46185) (not b!145251) (not d!46199) (not d!46229) (not b!145410) (not b!145233) (not b!145412) (not b!145450) (not bm!16198) (not b!145112) (not b!145395) (not b!145305) (not b!145115) (not d!46275) (not d!46293) (not b!145149) (not b!145292) (not b!145217) (not b!145242) (not d!46247) (not d!46251) (not d!46189) (not b_lambda!6503) (not b!145414) (not b!145105) (not b!145393) (not d!46205) (not b!145160))
(check-sat b_and!9037 b_and!9039 (not b_next!3061) (not b_next!3063))
