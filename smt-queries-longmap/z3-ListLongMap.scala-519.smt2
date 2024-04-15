; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13074 () Bool)

(assert start!13074)

(declare-fun b!114020 () Bool)

(declare-fun b_free!2617 () Bool)

(declare-fun b_next!2617 () Bool)

(assert (=> b!114020 (= b_free!2617 (not b_next!2617))))

(declare-fun tp!10209 () Bool)

(declare-fun b_and!7013 () Bool)

(assert (=> b!114020 (= tp!10209 b_and!7013)))

(declare-fun b!114013 () Bool)

(declare-fun b_free!2619 () Bool)

(declare-fun b_next!2619 () Bool)

(assert (=> b!114013 (= b_free!2619 (not b_next!2619))))

(declare-fun tp!10211 () Bool)

(declare-fun b_and!7015 () Bool)

(assert (=> b!114013 (= tp!10211 b_and!7015)))

(declare-fun b!114004 () Bool)

(declare-fun e!74139 () Bool)

(assert (=> b!114004 (= e!74139 (not true))))

(declare-fun lt!59219 () Bool)

(declare-datatypes ((V!3281 0))(
  ( (V!3282 (val!1407 Int)) )
))
(declare-datatypes ((array!4431 0))(
  ( (array!4432 (arr!2098 (Array (_ BitVec 32) (_ BitVec 64))) (size!2359 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1019 0))(
  ( (ValueCellFull!1019 (v!2973 V!3281)) (EmptyCell!1019) )
))
(declare-datatypes ((array!4433 0))(
  ( (array!4434 (arr!2099 (Array (_ BitVec 32) ValueCell!1019)) (size!2360 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!946 0))(
  ( (LongMapFixedSize!947 (defaultEntry!2679 Int) (mask!6872 (_ BitVec 32)) (extraKeys!2468 (_ BitVec 32)) (zeroValue!2546 V!3281) (minValue!2546 V!3281) (_size!522 (_ BitVec 32)) (_keys!4400 array!4431) (_values!2662 array!4433) (_vacant!522 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2434 0))(
  ( (tuple2!2435 (_1!1228 Bool) (_2!1228 LongMapFixedSize!946)) )
))
(declare-fun lt!59227 () tuple2!2434)

(declare-fun valid!444 (LongMapFixedSize!946) Bool)

(assert (=> b!114004 (= lt!59219 (valid!444 (_2!1228 lt!59227)))))

(declare-datatypes ((tuple2!2436 0))(
  ( (tuple2!2437 (_1!1229 (_ BitVec 64)) (_2!1229 V!3281)) )
))
(declare-datatypes ((List!1643 0))(
  ( (Nil!1640) (Cons!1639 (h!2239 tuple2!2436) (t!5848 List!1643)) )
))
(declare-datatypes ((ListLongMap!1575 0))(
  ( (ListLongMap!1576 (toList!803 List!1643)) )
))
(declare-fun lt!59228 () ListLongMap!1575)

(declare-fun lt!59225 () ListLongMap!1575)

(declare-fun lt!59216 () tuple2!2436)

(declare-fun lt!59223 () tuple2!2436)

(declare-fun +!148 (ListLongMap!1575 tuple2!2436) ListLongMap!1575)

(assert (=> b!114004 (= (+!148 lt!59225 lt!59223) (+!148 (+!148 lt!59228 lt!59223) lt!59216))))

(declare-datatypes ((Cell!734 0))(
  ( (Cell!735 (v!2974 LongMapFixedSize!946)) )
))
(declare-datatypes ((LongMap!734 0))(
  ( (LongMap!735 (underlying!378 Cell!734)) )
))
(declare-fun thiss!992 () LongMap!734)

(assert (=> b!114004 (= lt!59223 (tuple2!2437 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2546 (v!2974 (underlying!378 thiss!992)))))))

(declare-fun lt!59222 () V!3281)

(declare-datatypes ((Unit!3552 0))(
  ( (Unit!3553) )
))
(declare-fun lt!59212 () Unit!3552)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!60 (ListLongMap!1575 (_ BitVec 64) V!3281 (_ BitVec 64) V!3281) Unit!3552)

(assert (=> b!114004 (= lt!59212 (addCommutativeForDiffKeys!60 lt!59228 (select (arr!2098 (_keys!4400 (v!2974 (underlying!378 thiss!992)))) from!355) lt!59222 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2546 (v!2974 (underlying!378 thiss!992)))))))

(declare-fun lt!59213 () ListLongMap!1575)

(assert (=> b!114004 (= lt!59213 lt!59225)))

(assert (=> b!114004 (= lt!59225 (+!148 lt!59228 lt!59216))))

(declare-fun lt!59218 () ListLongMap!1575)

(declare-fun lt!59220 () tuple2!2436)

(assert (=> b!114004 (= lt!59213 (+!148 lt!59218 lt!59220))))

(declare-fun lt!59214 () ListLongMap!1575)

(assert (=> b!114004 (= lt!59228 (+!148 lt!59214 lt!59220))))

(assert (=> b!114004 (= lt!59220 (tuple2!2437 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2546 (v!2974 (underlying!378 thiss!992)))))))

(assert (=> b!114004 (= lt!59218 (+!148 lt!59214 lt!59216))))

(assert (=> b!114004 (= lt!59216 (tuple2!2437 (select (arr!2098 (_keys!4400 (v!2974 (underlying!378 thiss!992)))) from!355) lt!59222))))

(declare-fun lt!59224 () Unit!3552)

(assert (=> b!114004 (= lt!59224 (addCommutativeForDiffKeys!60 lt!59214 (select (arr!2098 (_keys!4400 (v!2974 (underlying!378 thiss!992)))) from!355) lt!59222 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2546 (v!2974 (underlying!378 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!113 (array!4431 array!4433 (_ BitVec 32) (_ BitVec 32) V!3281 V!3281 (_ BitVec 32) Int) ListLongMap!1575)

(assert (=> b!114004 (= lt!59214 (getCurrentListMapNoExtraKeys!113 (_keys!4400 (v!2974 (underlying!378 thiss!992))) (_values!2662 (v!2974 (underlying!378 thiss!992))) (mask!6872 (v!2974 (underlying!378 thiss!992))) (extraKeys!2468 (v!2974 (underlying!378 thiss!992))) (zeroValue!2546 (v!2974 (underlying!378 thiss!992))) (minValue!2546 (v!2974 (underlying!378 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2679 (v!2974 (underlying!378 thiss!992)))))))

(declare-fun b!114005 () Bool)

(declare-fun e!74151 () Bool)

(declare-fun e!74140 () Bool)

(assert (=> b!114005 (= e!74151 e!74140)))

(declare-fun b!114006 () Bool)

(declare-fun res!56140 () Bool)

(declare-fun e!74150 () Bool)

(assert (=> b!114006 (=> (not res!56140) (not e!74150))))

(declare-fun newMap!16 () LongMapFixedSize!946)

(assert (=> b!114006 (= res!56140 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6872 newMap!16)) (_size!522 (v!2974 (underlying!378 thiss!992)))))))

(declare-fun mapNonEmpty!4103 () Bool)

(declare-fun mapRes!4103 () Bool)

(declare-fun tp!10210 () Bool)

(declare-fun e!74138 () Bool)

(assert (=> mapNonEmpty!4103 (= mapRes!4103 (and tp!10210 e!74138))))

(declare-fun mapRest!4103 () (Array (_ BitVec 32) ValueCell!1019))

(declare-fun mapKey!4103 () (_ BitVec 32))

(declare-fun mapValue!4104 () ValueCell!1019)

(assert (=> mapNonEmpty!4103 (= (arr!2099 (_values!2662 newMap!16)) (store mapRest!4103 mapKey!4103 mapValue!4104))))

(declare-fun b!114007 () Bool)

(declare-fun e!74143 () Unit!3552)

(declare-fun Unit!3554 () Unit!3552)

(assert (=> b!114007 (= e!74143 Unit!3554)))

(declare-fun b!114008 () Bool)

(declare-fun e!74148 () Bool)

(assert (=> b!114008 (= e!74150 e!74148)))

(declare-fun res!56137 () Bool)

(assert (=> b!114008 (=> (not res!56137) (not e!74148))))

(declare-fun lt!59221 () ListLongMap!1575)

(declare-fun lt!59211 () ListLongMap!1575)

(assert (=> b!114008 (= res!56137 (= lt!59221 lt!59211))))

(declare-fun map!1299 (LongMapFixedSize!946) ListLongMap!1575)

(assert (=> b!114008 (= lt!59211 (map!1299 newMap!16))))

(declare-fun getCurrentListMap!477 (array!4431 array!4433 (_ BitVec 32) (_ BitVec 32) V!3281 V!3281 (_ BitVec 32) Int) ListLongMap!1575)

(assert (=> b!114008 (= lt!59221 (getCurrentListMap!477 (_keys!4400 (v!2974 (underlying!378 thiss!992))) (_values!2662 (v!2974 (underlying!378 thiss!992))) (mask!6872 (v!2974 (underlying!378 thiss!992))) (extraKeys!2468 (v!2974 (underlying!378 thiss!992))) (zeroValue!2546 (v!2974 (underlying!378 thiss!992))) (minValue!2546 (v!2974 (underlying!378 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2679 (v!2974 (underlying!378 thiss!992)))))))

(declare-fun mapIsEmpty!4103 () Bool)

(assert (=> mapIsEmpty!4103 mapRes!4103))

(declare-fun b!114009 () Bool)

(declare-fun res!56138 () Bool)

(assert (=> b!114009 (=> (not res!56138) (not e!74150))))

(assert (=> b!114009 (= res!56138 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2359 (_keys!4400 (v!2974 (underlying!378 thiss!992)))))))))

(declare-fun res!56139 () Bool)

(assert (=> start!13074 (=> (not res!56139) (not e!74150))))

(declare-fun valid!445 (LongMap!734) Bool)

(assert (=> start!13074 (= res!56139 (valid!445 thiss!992))))

(assert (=> start!13074 e!74150))

(declare-fun e!74145 () Bool)

(assert (=> start!13074 e!74145))

(assert (=> start!13074 true))

(declare-fun e!74152 () Bool)

(assert (=> start!13074 e!74152))

(declare-fun mapIsEmpty!4104 () Bool)

(declare-fun mapRes!4104 () Bool)

(assert (=> mapIsEmpty!4104 mapRes!4104))

(declare-fun b!114010 () Bool)

(declare-fun res!56142 () Bool)

(assert (=> b!114010 (=> (not res!56142) (not e!74150))))

(assert (=> b!114010 (= res!56142 (valid!444 newMap!16))))

(declare-fun b!114011 () Bool)

(declare-fun e!74149 () Bool)

(assert (=> b!114011 (= e!74148 e!74149)))

(declare-fun res!56141 () Bool)

(assert (=> b!114011 (=> (not res!56141) (not e!74149))))

(assert (=> b!114011 (= res!56141 (and (not (= (select (arr!2098 (_keys!4400 (v!2974 (underlying!378 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2098 (_keys!4400 (v!2974 (underlying!378 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1372 (ValueCell!1019 V!3281) V!3281)

(declare-fun dynLambda!393 (Int (_ BitVec 64)) V!3281)

(assert (=> b!114011 (= lt!59222 (get!1372 (select (arr!2099 (_values!2662 (v!2974 (underlying!378 thiss!992)))) from!355) (dynLambda!393 (defaultEntry!2679 (v!2974 (underlying!378 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114012 () Bool)

(declare-fun e!74147 () Bool)

(declare-fun e!74153 () Bool)

(assert (=> b!114012 (= e!74147 (and e!74153 mapRes!4104))))

(declare-fun condMapEmpty!4104 () Bool)

(declare-fun mapDefault!4103 () ValueCell!1019)

(assert (=> b!114012 (= condMapEmpty!4104 (= (arr!2099 (_values!2662 (v!2974 (underlying!378 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1019)) mapDefault!4103)))))

(declare-fun tp_is_empty!2725 () Bool)

(declare-fun e!74137 () Bool)

(declare-fun array_inv!1331 (array!4431) Bool)

(declare-fun array_inv!1332 (array!4433) Bool)

(assert (=> b!114013 (= e!74152 (and tp!10211 tp_is_empty!2725 (array_inv!1331 (_keys!4400 newMap!16)) (array_inv!1332 (_values!2662 newMap!16)) e!74137))))

(declare-fun b!114014 () Bool)

(declare-fun e!74142 () Bool)

(assert (=> b!114014 (= e!74137 (and e!74142 mapRes!4103))))

(declare-fun condMapEmpty!4103 () Bool)

(declare-fun mapDefault!4104 () ValueCell!1019)

(assert (=> b!114014 (= condMapEmpty!4103 (= (arr!2099 (_values!2662 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1019)) mapDefault!4104)))))

(declare-fun b!114015 () Bool)

(assert (=> b!114015 (= e!74149 e!74139)))

(declare-fun res!56136 () Bool)

(assert (=> b!114015 (=> (not res!56136) (not e!74139))))

(assert (=> b!114015 (= res!56136 (and (_1!1228 lt!59227) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!59210 () Unit!3552)

(assert (=> b!114015 (= lt!59210 e!74143)))

(declare-fun c!20383 () Bool)

(declare-fun contains!841 (ListLongMap!1575 (_ BitVec 64)) Bool)

(assert (=> b!114015 (= c!20383 (contains!841 lt!59211 (select (arr!2098 (_keys!4400 (v!2974 (underlying!378 thiss!992)))) from!355)))))

(declare-fun update!170 (LongMapFixedSize!946 (_ BitVec 64) V!3281) tuple2!2434)

(assert (=> b!114015 (= lt!59227 (update!170 newMap!16 (select (arr!2098 (_keys!4400 (v!2974 (underlying!378 thiss!992)))) from!355) lt!59222))))

(declare-fun b!114016 () Bool)

(assert (=> b!114016 (= e!74153 tp_is_empty!2725)))

(declare-fun b!114017 () Bool)

(assert (=> b!114017 (= e!74145 e!74151)))

(declare-fun b!114018 () Bool)

(declare-fun e!74141 () Bool)

(assert (=> b!114018 (= e!74141 tp_is_empty!2725)))

(declare-fun b!114019 () Bool)

(assert (=> b!114019 (= e!74142 tp_is_empty!2725)))

(declare-fun mapNonEmpty!4104 () Bool)

(declare-fun tp!10212 () Bool)

(assert (=> mapNonEmpty!4104 (= mapRes!4104 (and tp!10212 e!74141))))

(declare-fun mapKey!4104 () (_ BitVec 32))

(declare-fun mapRest!4104 () (Array (_ BitVec 32) ValueCell!1019))

(declare-fun mapValue!4103 () ValueCell!1019)

(assert (=> mapNonEmpty!4104 (= (arr!2099 (_values!2662 (v!2974 (underlying!378 thiss!992)))) (store mapRest!4104 mapKey!4104 mapValue!4103))))

(assert (=> b!114020 (= e!74140 (and tp!10209 tp_is_empty!2725 (array_inv!1331 (_keys!4400 (v!2974 (underlying!378 thiss!992)))) (array_inv!1332 (_values!2662 (v!2974 (underlying!378 thiss!992)))) e!74147))))

(declare-fun b!114021 () Bool)

(assert (=> b!114021 (= e!74138 tp_is_empty!2725)))

(declare-fun b!114022 () Bool)

(declare-fun Unit!3555 () Unit!3552)

(assert (=> b!114022 (= e!74143 Unit!3555)))

(declare-fun lt!59226 () Unit!3552)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!121 (array!4431 array!4433 (_ BitVec 32) (_ BitVec 32) V!3281 V!3281 (_ BitVec 64) (_ BitVec 32) Int) Unit!3552)

(assert (=> b!114022 (= lt!59226 (lemmaListMapContainsThenArrayContainsFrom!121 (_keys!4400 (v!2974 (underlying!378 thiss!992))) (_values!2662 (v!2974 (underlying!378 thiss!992))) (mask!6872 (v!2974 (underlying!378 thiss!992))) (extraKeys!2468 (v!2974 (underlying!378 thiss!992))) (zeroValue!2546 (v!2974 (underlying!378 thiss!992))) (minValue!2546 (v!2974 (underlying!378 thiss!992))) (select (arr!2098 (_keys!4400 (v!2974 (underlying!378 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2679 (v!2974 (underlying!378 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114022 (arrayContainsKey!0 (_keys!4400 (v!2974 (underlying!378 thiss!992))) (select (arr!2098 (_keys!4400 (v!2974 (underlying!378 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59215 () Unit!3552)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4431 (_ BitVec 32) (_ BitVec 32)) Unit!3552)

(assert (=> b!114022 (= lt!59215 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4400 (v!2974 (underlying!378 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1644 0))(
  ( (Nil!1641) (Cons!1640 (h!2240 (_ BitVec 64)) (t!5849 List!1644)) )
))
(declare-fun arrayNoDuplicates!0 (array!4431 (_ BitVec 32) List!1644) Bool)

(assert (=> b!114022 (arrayNoDuplicates!0 (_keys!4400 (v!2974 (underlying!378 thiss!992))) from!355 Nil!1641)))

(declare-fun lt!59217 () Unit!3552)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4431 (_ BitVec 32) (_ BitVec 64) List!1644) Unit!3552)

(assert (=> b!114022 (= lt!59217 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4400 (v!2974 (underlying!378 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2098 (_keys!4400 (v!2974 (underlying!378 thiss!992)))) from!355) (Cons!1640 (select (arr!2098 (_keys!4400 (v!2974 (underlying!378 thiss!992)))) from!355) Nil!1641)))))

(assert (=> b!114022 false))

(assert (= (and start!13074 res!56139) b!114009))

(assert (= (and b!114009 res!56138) b!114010))

(assert (= (and b!114010 res!56142) b!114006))

(assert (= (and b!114006 res!56140) b!114008))

(assert (= (and b!114008 res!56137) b!114011))

(assert (= (and b!114011 res!56141) b!114015))

(assert (= (and b!114015 c!20383) b!114022))

(assert (= (and b!114015 (not c!20383)) b!114007))

(assert (= (and b!114015 res!56136) b!114004))

(assert (= (and b!114012 condMapEmpty!4104) mapIsEmpty!4104))

(assert (= (and b!114012 (not condMapEmpty!4104)) mapNonEmpty!4104))

(get-info :version)

(assert (= (and mapNonEmpty!4104 ((_ is ValueCellFull!1019) mapValue!4103)) b!114018))

(assert (= (and b!114012 ((_ is ValueCellFull!1019) mapDefault!4103)) b!114016))

(assert (= b!114020 b!114012))

(assert (= b!114005 b!114020))

(assert (= b!114017 b!114005))

(assert (= start!13074 b!114017))

(assert (= (and b!114014 condMapEmpty!4103) mapIsEmpty!4103))

(assert (= (and b!114014 (not condMapEmpty!4103)) mapNonEmpty!4103))

(assert (= (and mapNonEmpty!4103 ((_ is ValueCellFull!1019) mapValue!4104)) b!114021))

(assert (= (and b!114014 ((_ is ValueCellFull!1019) mapDefault!4104)) b!114019))

(assert (= b!114013 b!114014))

(assert (= start!13074 b!114013))

(declare-fun b_lambda!5095 () Bool)

(assert (=> (not b_lambda!5095) (not b!114011)))

(declare-fun t!5845 () Bool)

(declare-fun tb!2169 () Bool)

(assert (=> (and b!114020 (= (defaultEntry!2679 (v!2974 (underlying!378 thiss!992))) (defaultEntry!2679 (v!2974 (underlying!378 thiss!992)))) t!5845) tb!2169))

(declare-fun result!3625 () Bool)

(assert (=> tb!2169 (= result!3625 tp_is_empty!2725)))

(assert (=> b!114011 t!5845))

(declare-fun b_and!7017 () Bool)

(assert (= b_and!7013 (and (=> t!5845 result!3625) b_and!7017)))

(declare-fun tb!2171 () Bool)

(declare-fun t!5847 () Bool)

(assert (=> (and b!114013 (= (defaultEntry!2679 newMap!16) (defaultEntry!2679 (v!2974 (underlying!378 thiss!992)))) t!5847) tb!2171))

(declare-fun result!3629 () Bool)

(assert (= result!3629 result!3625))

(assert (=> b!114011 t!5847))

(declare-fun b_and!7019 () Bool)

(assert (= b_and!7015 (and (=> t!5847 result!3629) b_and!7019)))

(declare-fun m!130129 () Bool)

(assert (=> b!114020 m!130129))

(declare-fun m!130131 () Bool)

(assert (=> b!114020 m!130131))

(declare-fun m!130133 () Bool)

(assert (=> b!114015 m!130133))

(assert (=> b!114015 m!130133))

(declare-fun m!130135 () Bool)

(assert (=> b!114015 m!130135))

(assert (=> b!114015 m!130133))

(declare-fun m!130137 () Bool)

(assert (=> b!114015 m!130137))

(declare-fun m!130139 () Bool)

(assert (=> b!114013 m!130139))

(declare-fun m!130141 () Bool)

(assert (=> b!114013 m!130141))

(declare-fun m!130143 () Bool)

(assert (=> mapNonEmpty!4104 m!130143))

(declare-fun m!130145 () Bool)

(assert (=> b!114022 m!130145))

(declare-fun m!130147 () Bool)

(assert (=> b!114022 m!130147))

(assert (=> b!114022 m!130133))

(declare-fun m!130149 () Bool)

(assert (=> b!114022 m!130149))

(assert (=> b!114022 m!130133))

(assert (=> b!114022 m!130133))

(declare-fun m!130151 () Bool)

(assert (=> b!114022 m!130151))

(assert (=> b!114022 m!130133))

(declare-fun m!130153 () Bool)

(assert (=> b!114022 m!130153))

(declare-fun m!130155 () Bool)

(assert (=> b!114010 m!130155))

(declare-fun m!130157 () Bool)

(assert (=> start!13074 m!130157))

(declare-fun m!130159 () Bool)

(assert (=> b!114008 m!130159))

(declare-fun m!130161 () Bool)

(assert (=> b!114008 m!130161))

(declare-fun m!130163 () Bool)

(assert (=> mapNonEmpty!4103 m!130163))

(declare-fun m!130165 () Bool)

(assert (=> b!114004 m!130165))

(declare-fun m!130167 () Bool)

(assert (=> b!114004 m!130167))

(declare-fun m!130169 () Bool)

(assert (=> b!114004 m!130169))

(declare-fun m!130171 () Bool)

(assert (=> b!114004 m!130171))

(assert (=> b!114004 m!130133))

(assert (=> b!114004 m!130133))

(declare-fun m!130173 () Bool)

(assert (=> b!114004 m!130173))

(declare-fun m!130175 () Bool)

(assert (=> b!114004 m!130175))

(declare-fun m!130177 () Bool)

(assert (=> b!114004 m!130177))

(assert (=> b!114004 m!130133))

(declare-fun m!130179 () Bool)

(assert (=> b!114004 m!130179))

(assert (=> b!114004 m!130175))

(declare-fun m!130181 () Bool)

(assert (=> b!114004 m!130181))

(declare-fun m!130183 () Bool)

(assert (=> b!114004 m!130183))

(declare-fun m!130185 () Bool)

(assert (=> b!114004 m!130185))

(assert (=> b!114011 m!130133))

(declare-fun m!130187 () Bool)

(assert (=> b!114011 m!130187))

(declare-fun m!130189 () Bool)

(assert (=> b!114011 m!130189))

(assert (=> b!114011 m!130187))

(assert (=> b!114011 m!130189))

(declare-fun m!130191 () Bool)

(assert (=> b!114011 m!130191))

(check-sat b_and!7019 (not b!114015) (not b!114004) (not b_next!2617) (not mapNonEmpty!4104) (not mapNonEmpty!4103) (not start!13074) (not b!114010) (not b!114020) (not b!114011) tp_is_empty!2725 (not b_next!2619) (not b!114022) (not b!114008) (not b_lambda!5095) (not b!114013) b_and!7017)
(check-sat b_and!7017 b_and!7019 (not b_next!2617) (not b_next!2619))
