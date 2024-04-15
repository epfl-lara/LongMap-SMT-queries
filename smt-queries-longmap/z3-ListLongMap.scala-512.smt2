; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12516 () Bool)

(assert start!12516)

(declare-fun b!107171 () Bool)

(declare-fun b_free!2533 () Bool)

(declare-fun b_next!2533 () Bool)

(assert (=> b!107171 (= b_free!2533 (not b_next!2533))))

(declare-fun tp!9932 () Bool)

(declare-fun b_and!6585 () Bool)

(assert (=> b!107171 (= tp!9932 b_and!6585)))

(declare-fun b!107165 () Bool)

(declare-fun b_free!2535 () Bool)

(declare-fun b_next!2535 () Bool)

(assert (=> b!107165 (= b_free!2535 (not b_next!2535))))

(declare-fun tp!9931 () Bool)

(declare-fun b_and!6587 () Bool)

(assert (=> b!107165 (= tp!9931 b_and!6587)))

(declare-fun b!107164 () Bool)

(declare-fun e!69725 () Bool)

(declare-fun e!69727 () Bool)

(declare-fun mapRes!3950 () Bool)

(assert (=> b!107164 (= e!69725 (and e!69727 mapRes!3950))))

(declare-fun condMapEmpty!3950 () Bool)

(declare-datatypes ((V!3225 0))(
  ( (V!3226 (val!1386 Int)) )
))
(declare-datatypes ((array!4339 0))(
  ( (array!4340 (arr!2056 (Array (_ BitVec 32) (_ BitVec 64))) (size!2313 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!998 0))(
  ( (ValueCellFull!998 (v!2898 V!3225)) (EmptyCell!998) )
))
(declare-datatypes ((array!4341 0))(
  ( (array!4342 (arr!2057 (Array (_ BitVec 32) ValueCell!998)) (size!2314 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!904 0))(
  ( (LongMapFixedSize!905 (defaultEntry!2602 Int) (mask!6757 (_ BitVec 32)) (extraKeys!2403 (_ BitVec 32)) (zeroValue!2475 V!3225) (minValue!2475 V!3225) (_size!501 (_ BitVec 32)) (_keys!4311 array!4339) (_values!2585 array!4341) (_vacant!501 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!904)

(declare-fun mapDefault!3949 () ValueCell!998)

(assert (=> b!107164 (= condMapEmpty!3950 (= (arr!2057 (_values!2585 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!998)) mapDefault!3949)))))

(declare-fun tp_is_empty!2683 () Bool)

(declare-fun e!69723 () Bool)

(declare-fun array_inv!1299 (array!4339) Bool)

(declare-fun array_inv!1300 (array!4341) Bool)

(assert (=> b!107165 (= e!69723 (and tp!9931 tp_is_empty!2683 (array_inv!1299 (_keys!4311 newMap!16)) (array_inv!1300 (_values!2585 newMap!16)) e!69725))))

(declare-fun b!107166 () Bool)

(declare-fun e!69720 () Bool)

(declare-fun e!69733 () Bool)

(assert (=> b!107166 (= e!69720 e!69733)))

(declare-fun b!107167 () Bool)

(declare-fun res!53223 () Bool)

(declare-fun e!69731 () Bool)

(assert (=> b!107167 (=> (not res!53223) (not e!69731))))

(declare-datatypes ((Cell!694 0))(
  ( (Cell!695 (v!2899 LongMapFixedSize!904)) )
))
(declare-datatypes ((LongMap!694 0))(
  ( (LongMap!695 (underlying!358 Cell!694)) )
))
(declare-fun thiss!992 () LongMap!694)

(assert (=> b!107167 (= res!53223 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6757 newMap!16)) (_size!501 (v!2899 (underlying!358 thiss!992)))))))

(declare-fun b!107168 () Bool)

(declare-fun e!69724 () Bool)

(declare-fun e!69728 () Bool)

(assert (=> b!107168 (= e!69724 (not e!69728))))

(declare-fun res!53216 () Bool)

(assert (=> b!107168 (=> res!53216 e!69728)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!107168 (= res!53216 (not (validMask!0 (mask!6757 (v!2899 (underlying!358 thiss!992))))))))

(declare-datatypes ((tuple2!2384 0))(
  ( (tuple2!2385 (_1!1203 (_ BitVec 64)) (_2!1203 V!3225)) )
))
(declare-datatypes ((List!1618 0))(
  ( (Nil!1615) (Cons!1614 (h!2212 tuple2!2384) (t!5713 List!1618)) )
))
(declare-datatypes ((ListLongMap!1545 0))(
  ( (ListLongMap!1546 (toList!788 List!1618)) )
))
(declare-fun lt!54871 () ListLongMap!1545)

(declare-fun lt!54870 () tuple2!2384)

(declare-fun lt!54876 () tuple2!2384)

(declare-fun +!136 (ListLongMap!1545 tuple2!2384) ListLongMap!1545)

(assert (=> b!107168 (= (+!136 (+!136 lt!54871 lt!54870) lt!54876) (+!136 (+!136 lt!54871 lt!54876) lt!54870))))

(assert (=> b!107168 (= lt!54876 (tuple2!2385 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2475 (v!2899 (underlying!358 thiss!992)))))))

(declare-fun lt!54873 () V!3225)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!107168 (= lt!54870 (tuple2!2385 (select (arr!2056 (_keys!4311 (v!2899 (underlying!358 thiss!992)))) from!355) lt!54873))))

(declare-datatypes ((Unit!3299 0))(
  ( (Unit!3300) )
))
(declare-fun lt!54872 () Unit!3299)

(declare-fun addCommutativeForDiffKeys!48 (ListLongMap!1545 (_ BitVec 64) V!3225 (_ BitVec 64) V!3225) Unit!3299)

(assert (=> b!107168 (= lt!54872 (addCommutativeForDiffKeys!48 lt!54871 (select (arr!2056 (_keys!4311 (v!2899 (underlying!358 thiss!992)))) from!355) lt!54873 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2475 (v!2899 (underlying!358 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!101 (array!4339 array!4341 (_ BitVec 32) (_ BitVec 32) V!3225 V!3225 (_ BitVec 32) Int) ListLongMap!1545)

(assert (=> b!107168 (= lt!54871 (getCurrentListMapNoExtraKeys!101 (_keys!4311 (v!2899 (underlying!358 thiss!992))) (_values!2585 (v!2899 (underlying!358 thiss!992))) (mask!6757 (v!2899 (underlying!358 thiss!992))) (extraKeys!2403 (v!2899 (underlying!358 thiss!992))) (zeroValue!2475 (v!2899 (underlying!358 thiss!992))) (minValue!2475 (v!2899 (underlying!358 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2602 (v!2899 (underlying!358 thiss!992)))))))

(declare-fun b!107169 () Bool)

(declare-fun e!69722 () Bool)

(declare-fun e!69734 () Bool)

(assert (=> b!107169 (= e!69722 e!69734)))

(declare-fun res!53220 () Bool)

(assert (=> b!107169 (=> (not res!53220) (not e!69734))))

(assert (=> b!107169 (= res!53220 (and (not (= (select (arr!2056 (_keys!4311 (v!2899 (underlying!358 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2056 (_keys!4311 (v!2899 (underlying!358 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1338 (ValueCell!998 V!3225) V!3225)

(declare-fun dynLambda!385 (Int (_ BitVec 64)) V!3225)

(assert (=> b!107169 (= lt!54873 (get!1338 (select (arr!2057 (_values!2585 (v!2899 (underlying!358 thiss!992)))) from!355) (dynLambda!385 (defaultEntry!2602 (v!2899 (underlying!358 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!107170 () Bool)

(declare-fun res!53218 () Bool)

(assert (=> b!107170 (=> (not res!53218) (not e!69731))))

(declare-fun valid!425 (LongMapFixedSize!904) Bool)

(assert (=> b!107170 (= res!53218 (valid!425 newMap!16))))

(declare-fun e!69718 () Bool)

(assert (=> b!107171 (= e!69733 (and tp!9932 tp_is_empty!2683 (array_inv!1299 (_keys!4311 (v!2899 (underlying!358 thiss!992)))) (array_inv!1300 (_values!2585 (v!2899 (underlying!358 thiss!992)))) e!69718))))

(declare-fun b!107172 () Bool)

(assert (=> b!107172 (= e!69727 tp_is_empty!2683)))

(declare-fun b!107173 () Bool)

(assert (=> b!107173 (= e!69728 (or (not (= (size!2314 (_values!2585 (v!2899 (underlying!358 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6757 (v!2899 (underlying!358 thiss!992)))))) (not (= (size!2313 (_keys!4311 (v!2899 (underlying!358 thiss!992)))) (size!2314 (_values!2585 (v!2899 (underlying!358 thiss!992)))))) (bvsge (mask!6757 (v!2899 (underlying!358 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!107174 () Bool)

(declare-fun e!69732 () Unit!3299)

(declare-fun Unit!3301 () Unit!3299)

(assert (=> b!107174 (= e!69732 Unit!3301)))

(declare-fun mapNonEmpty!3949 () Bool)

(declare-fun mapRes!3949 () Bool)

(declare-fun tp!9930 () Bool)

(declare-fun e!69717 () Bool)

(assert (=> mapNonEmpty!3949 (= mapRes!3949 (and tp!9930 e!69717))))

(declare-fun mapValue!3950 () ValueCell!998)

(declare-fun mapKey!3949 () (_ BitVec 32))

(declare-fun mapRest!3950 () (Array (_ BitVec 32) ValueCell!998))

(assert (=> mapNonEmpty!3949 (= (arr!2057 (_values!2585 (v!2899 (underlying!358 thiss!992)))) (store mapRest!3950 mapKey!3949 mapValue!3950))))

(declare-fun b!107175 () Bool)

(declare-fun e!69729 () Bool)

(assert (=> b!107175 (= e!69718 (and e!69729 mapRes!3949))))

(declare-fun condMapEmpty!3949 () Bool)

(declare-fun mapDefault!3950 () ValueCell!998)

(assert (=> b!107175 (= condMapEmpty!3949 (= (arr!2057 (_values!2585 (v!2899 (underlying!358 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!998)) mapDefault!3950)))))

(declare-fun b!107176 () Bool)

(assert (=> b!107176 (= e!69729 tp_is_empty!2683)))

(declare-fun b!107177 () Bool)

(declare-fun e!69721 () Bool)

(assert (=> b!107177 (= e!69721 e!69720)))

(declare-fun b!107178 () Bool)

(assert (=> b!107178 (= e!69731 e!69722)))

(declare-fun res!53222 () Bool)

(assert (=> b!107178 (=> (not res!53222) (not e!69722))))

(declare-fun lt!54869 () ListLongMap!1545)

(declare-fun lt!54877 () ListLongMap!1545)

(assert (=> b!107178 (= res!53222 (= lt!54869 lt!54877))))

(declare-fun map!1273 (LongMapFixedSize!904) ListLongMap!1545)

(assert (=> b!107178 (= lt!54877 (map!1273 newMap!16))))

(declare-fun getCurrentListMap!465 (array!4339 array!4341 (_ BitVec 32) (_ BitVec 32) V!3225 V!3225 (_ BitVec 32) Int) ListLongMap!1545)

(assert (=> b!107178 (= lt!54869 (getCurrentListMap!465 (_keys!4311 (v!2899 (underlying!358 thiss!992))) (_values!2585 (v!2899 (underlying!358 thiss!992))) (mask!6757 (v!2899 (underlying!358 thiss!992))) (extraKeys!2403 (v!2899 (underlying!358 thiss!992))) (zeroValue!2475 (v!2899 (underlying!358 thiss!992))) (minValue!2475 (v!2899 (underlying!358 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2602 (v!2899 (underlying!358 thiss!992)))))))

(declare-fun b!107179 () Bool)

(assert (=> b!107179 (= e!69734 e!69724)))

(declare-fun res!53219 () Bool)

(assert (=> b!107179 (=> (not res!53219) (not e!69724))))

(declare-datatypes ((tuple2!2386 0))(
  ( (tuple2!2387 (_1!1204 Bool) (_2!1204 LongMapFixedSize!904)) )
))
(declare-fun lt!54875 () tuple2!2386)

(assert (=> b!107179 (= res!53219 (and (_1!1204 lt!54875) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!54874 () Unit!3299)

(assert (=> b!107179 (= lt!54874 e!69732)))

(declare-fun c!18799 () Bool)

(declare-fun contains!823 (ListLongMap!1545 (_ BitVec 64)) Bool)

(assert (=> b!107179 (= c!18799 (contains!823 lt!54877 (select (arr!2056 (_keys!4311 (v!2899 (underlying!358 thiss!992)))) from!355)))))

(declare-fun update!160 (LongMapFixedSize!904 (_ BitVec 64) V!3225) tuple2!2386)

(assert (=> b!107179 (= lt!54875 (update!160 newMap!16 (select (arr!2056 (_keys!4311 (v!2899 (underlying!358 thiss!992)))) from!355) lt!54873))))

(declare-fun mapIsEmpty!3949 () Bool)

(assert (=> mapIsEmpty!3949 mapRes!3949))

(declare-fun mapNonEmpty!3950 () Bool)

(declare-fun tp!9929 () Bool)

(declare-fun e!69719 () Bool)

(assert (=> mapNonEmpty!3950 (= mapRes!3950 (and tp!9929 e!69719))))

(declare-fun mapRest!3949 () (Array (_ BitVec 32) ValueCell!998))

(declare-fun mapValue!3949 () ValueCell!998)

(declare-fun mapKey!3950 () (_ BitVec 32))

(assert (=> mapNonEmpty!3950 (= (arr!2057 (_values!2585 newMap!16)) (store mapRest!3949 mapKey!3950 mapValue!3949))))

(declare-fun b!107180 () Bool)

(assert (=> b!107180 (= e!69719 tp_is_empty!2683)))

(declare-fun res!53221 () Bool)

(assert (=> start!12516 (=> (not res!53221) (not e!69731))))

(declare-fun valid!426 (LongMap!694) Bool)

(assert (=> start!12516 (= res!53221 (valid!426 thiss!992))))

(assert (=> start!12516 e!69731))

(assert (=> start!12516 e!69721))

(assert (=> start!12516 true))

(assert (=> start!12516 e!69723))

(declare-fun b!107181 () Bool)

(assert (=> b!107181 (= e!69717 tp_is_empty!2683)))

(declare-fun b!107182 () Bool)

(declare-fun Unit!3302 () Unit!3299)

(assert (=> b!107182 (= e!69732 Unit!3302)))

(declare-fun lt!54879 () Unit!3299)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!111 (array!4339 array!4341 (_ BitVec 32) (_ BitVec 32) V!3225 V!3225 (_ BitVec 64) (_ BitVec 32) Int) Unit!3299)

(assert (=> b!107182 (= lt!54879 (lemmaListMapContainsThenArrayContainsFrom!111 (_keys!4311 (v!2899 (underlying!358 thiss!992))) (_values!2585 (v!2899 (underlying!358 thiss!992))) (mask!6757 (v!2899 (underlying!358 thiss!992))) (extraKeys!2403 (v!2899 (underlying!358 thiss!992))) (zeroValue!2475 (v!2899 (underlying!358 thiss!992))) (minValue!2475 (v!2899 (underlying!358 thiss!992))) (select (arr!2056 (_keys!4311 (v!2899 (underlying!358 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2602 (v!2899 (underlying!358 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!107182 (arrayContainsKey!0 (_keys!4311 (v!2899 (underlying!358 thiss!992))) (select (arr!2056 (_keys!4311 (v!2899 (underlying!358 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!54878 () Unit!3299)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4339 (_ BitVec 32) (_ BitVec 32)) Unit!3299)

(assert (=> b!107182 (= lt!54878 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4311 (v!2899 (underlying!358 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1619 0))(
  ( (Nil!1616) (Cons!1615 (h!2213 (_ BitVec 64)) (t!5714 List!1619)) )
))
(declare-fun arrayNoDuplicates!0 (array!4339 (_ BitVec 32) List!1619) Bool)

(assert (=> b!107182 (arrayNoDuplicates!0 (_keys!4311 (v!2899 (underlying!358 thiss!992))) from!355 Nil!1616)))

(declare-fun lt!54868 () Unit!3299)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4339 (_ BitVec 32) (_ BitVec 64) List!1619) Unit!3299)

(assert (=> b!107182 (= lt!54868 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4311 (v!2899 (underlying!358 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2056 (_keys!4311 (v!2899 (underlying!358 thiss!992)))) from!355) (Cons!1615 (select (arr!2056 (_keys!4311 (v!2899 (underlying!358 thiss!992)))) from!355) Nil!1616)))))

(assert (=> b!107182 false))

(declare-fun mapIsEmpty!3950 () Bool)

(assert (=> mapIsEmpty!3950 mapRes!3950))

(declare-fun b!107183 () Bool)

(declare-fun res!53217 () Bool)

(assert (=> b!107183 (=> (not res!53217) (not e!69731))))

(assert (=> b!107183 (= res!53217 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2313 (_keys!4311 (v!2899 (underlying!358 thiss!992)))))))))

(assert (= (and start!12516 res!53221) b!107183))

(assert (= (and b!107183 res!53217) b!107170))

(assert (= (and b!107170 res!53218) b!107167))

(assert (= (and b!107167 res!53223) b!107178))

(assert (= (and b!107178 res!53222) b!107169))

(assert (= (and b!107169 res!53220) b!107179))

(assert (= (and b!107179 c!18799) b!107182))

(assert (= (and b!107179 (not c!18799)) b!107174))

(assert (= (and b!107179 res!53219) b!107168))

(assert (= (and b!107168 (not res!53216)) b!107173))

(assert (= (and b!107175 condMapEmpty!3949) mapIsEmpty!3949))

(assert (= (and b!107175 (not condMapEmpty!3949)) mapNonEmpty!3949))

(get-info :version)

(assert (= (and mapNonEmpty!3949 ((_ is ValueCellFull!998) mapValue!3950)) b!107181))

(assert (= (and b!107175 ((_ is ValueCellFull!998) mapDefault!3950)) b!107176))

(assert (= b!107171 b!107175))

(assert (= b!107166 b!107171))

(assert (= b!107177 b!107166))

(assert (= start!12516 b!107177))

(assert (= (and b!107164 condMapEmpty!3950) mapIsEmpty!3950))

(assert (= (and b!107164 (not condMapEmpty!3950)) mapNonEmpty!3950))

(assert (= (and mapNonEmpty!3950 ((_ is ValueCellFull!998) mapValue!3949)) b!107180))

(assert (= (and b!107164 ((_ is ValueCellFull!998) mapDefault!3949)) b!107172))

(assert (= b!107165 b!107164))

(assert (= start!12516 b!107165))

(declare-fun b_lambda!4789 () Bool)

(assert (=> (not b_lambda!4789) (not b!107169)))

(declare-fun t!5710 () Bool)

(declare-fun tb!2061 () Bool)

(assert (=> (and b!107171 (= (defaultEntry!2602 (v!2899 (underlying!358 thiss!992))) (defaultEntry!2602 (v!2899 (underlying!358 thiss!992)))) t!5710) tb!2061))

(declare-fun result!3467 () Bool)

(assert (=> tb!2061 (= result!3467 tp_is_empty!2683)))

(assert (=> b!107169 t!5710))

(declare-fun b_and!6589 () Bool)

(assert (= b_and!6585 (and (=> t!5710 result!3467) b_and!6589)))

(declare-fun tb!2063 () Bool)

(declare-fun t!5712 () Bool)

(assert (=> (and b!107165 (= (defaultEntry!2602 newMap!16) (defaultEntry!2602 (v!2899 (underlying!358 thiss!992)))) t!5712) tb!2063))

(declare-fun result!3471 () Bool)

(assert (= result!3471 result!3467))

(assert (=> b!107169 t!5712))

(declare-fun b_and!6591 () Bool)

(assert (= b_and!6587 (and (=> t!5712 result!3471) b_and!6591)))

(declare-fun m!120203 () Bool)

(assert (=> b!107168 m!120203))

(declare-fun m!120205 () Bool)

(assert (=> b!107168 m!120205))

(declare-fun m!120207 () Bool)

(assert (=> b!107168 m!120207))

(declare-fun m!120209 () Bool)

(assert (=> b!107168 m!120209))

(declare-fun m!120211 () Bool)

(assert (=> b!107168 m!120211))

(assert (=> b!107168 m!120209))

(declare-fun m!120213 () Bool)

(assert (=> b!107168 m!120213))

(declare-fun m!120215 () Bool)

(assert (=> b!107168 m!120215))

(assert (=> b!107168 m!120203))

(assert (=> b!107168 m!120213))

(declare-fun m!120217 () Bool)

(assert (=> b!107168 m!120217))

(assert (=> b!107169 m!120209))

(declare-fun m!120219 () Bool)

(assert (=> b!107169 m!120219))

(declare-fun m!120221 () Bool)

(assert (=> b!107169 m!120221))

(assert (=> b!107169 m!120219))

(assert (=> b!107169 m!120221))

(declare-fun m!120223 () Bool)

(assert (=> b!107169 m!120223))

(declare-fun m!120225 () Bool)

(assert (=> b!107171 m!120225))

(declare-fun m!120227 () Bool)

(assert (=> b!107171 m!120227))

(declare-fun m!120229 () Bool)

(assert (=> b!107170 m!120229))

(assert (=> b!107179 m!120209))

(assert (=> b!107179 m!120209))

(declare-fun m!120231 () Bool)

(assert (=> b!107179 m!120231))

(assert (=> b!107179 m!120209))

(declare-fun m!120233 () Bool)

(assert (=> b!107179 m!120233))

(declare-fun m!120235 () Bool)

(assert (=> b!107178 m!120235))

(declare-fun m!120237 () Bool)

(assert (=> b!107178 m!120237))

(declare-fun m!120239 () Bool)

(assert (=> mapNonEmpty!3950 m!120239))

(declare-fun m!120241 () Bool)

(assert (=> b!107165 m!120241))

(declare-fun m!120243 () Bool)

(assert (=> b!107165 m!120243))

(declare-fun m!120245 () Bool)

(assert (=> b!107182 m!120245))

(declare-fun m!120247 () Bool)

(assert (=> b!107182 m!120247))

(assert (=> b!107182 m!120209))

(declare-fun m!120249 () Bool)

(assert (=> b!107182 m!120249))

(assert (=> b!107182 m!120209))

(assert (=> b!107182 m!120209))

(declare-fun m!120251 () Bool)

(assert (=> b!107182 m!120251))

(assert (=> b!107182 m!120209))

(declare-fun m!120253 () Bool)

(assert (=> b!107182 m!120253))

(declare-fun m!120255 () Bool)

(assert (=> mapNonEmpty!3949 m!120255))

(declare-fun m!120257 () Bool)

(assert (=> start!12516 m!120257))

(check-sat (not b_lambda!4789) (not b!107179) (not b!107168) (not mapNonEmpty!3949) b_and!6591 (not mapNonEmpty!3950) b_and!6589 (not b!107170) (not b!107171) (not b_next!2535) (not b!107165) (not b!107178) (not b!107169) tp_is_empty!2683 (not b!107182) (not start!12516) (not b_next!2533))
(check-sat b_and!6589 b_and!6591 (not b_next!2533) (not b_next!2535))
