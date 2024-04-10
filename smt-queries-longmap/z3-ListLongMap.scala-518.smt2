; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13066 () Bool)

(assert start!13066)

(declare-fun b!114022 () Bool)

(declare-fun b_free!2609 () Bool)

(declare-fun b_next!2609 () Bool)

(assert (=> b!114022 (= b_free!2609 (not b_next!2609))))

(declare-fun tp!10185 () Bool)

(declare-fun b_and!7011 () Bool)

(assert (=> b!114022 (= tp!10185 b_and!7011)))

(declare-fun b!114007 () Bool)

(declare-fun b_free!2611 () Bool)

(declare-fun b_next!2611 () Bool)

(assert (=> b!114007 (= b_free!2611 (not b_next!2611))))

(declare-fun tp!10188 () Bool)

(declare-fun b_and!7013 () Bool)

(assert (=> b!114007 (= tp!10188 b_and!7013)))

(declare-fun b!114006 () Bool)

(declare-fun e!74120 () Bool)

(declare-fun e!74126 () Bool)

(assert (=> b!114006 (= e!74120 e!74126)))

(declare-fun res!56156 () Bool)

(assert (=> b!114006 (=> (not res!56156) (not e!74126))))

(declare-datatypes ((V!3275 0))(
  ( (V!3276 (val!1405 Int)) )
))
(declare-datatypes ((tuple2!2470 0))(
  ( (tuple2!2471 (_1!1246 (_ BitVec 64)) (_2!1246 V!3275)) )
))
(declare-datatypes ((List!1647 0))(
  ( (Nil!1644) (Cons!1643 (h!2243 tuple2!2470) (t!5849 List!1647)) )
))
(declare-datatypes ((ListLongMap!1609 0))(
  ( (ListLongMap!1610 (toList!820 List!1647)) )
))
(declare-fun lt!59232 () ListLongMap!1609)

(declare-fun lt!59227 () ListLongMap!1609)

(assert (=> b!114006 (= res!56156 (= lt!59232 lt!59227))))

(declare-datatypes ((array!4443 0))(
  ( (array!4444 (arr!2105 (Array (_ BitVec 32) (_ BitVec 64))) (size!2365 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1017 0))(
  ( (ValueCellFull!1017 (v!2977 V!3275)) (EmptyCell!1017) )
))
(declare-datatypes ((array!4445 0))(
  ( (array!4446 (arr!2106 (Array (_ BitVec 32) ValueCell!1017)) (size!2366 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!942 0))(
  ( (LongMapFixedSize!943 (defaultEntry!2677 Int) (mask!6869 (_ BitVec 32)) (extraKeys!2466 (_ BitVec 32)) (zeroValue!2544 V!3275) (minValue!2544 V!3275) (_size!520 (_ BitVec 32)) (_keys!4399 array!4443) (_values!2660 array!4445) (_vacant!520 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!942)

(declare-fun map!1314 (LongMapFixedSize!942) ListLongMap!1609)

(assert (=> b!114006 (= lt!59227 (map!1314 newMap!16))))

(declare-datatypes ((Cell!742 0))(
  ( (Cell!743 (v!2978 LongMapFixedSize!942)) )
))
(declare-datatypes ((LongMap!742 0))(
  ( (LongMap!743 (underlying!382 Cell!742)) )
))
(declare-fun thiss!992 () LongMap!742)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!503 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) V!3275 V!3275 (_ BitVec 32) Int) ListLongMap!1609)

(assert (=> b!114006 (= lt!59232 (getCurrentListMap!503 (_keys!4399 (v!2978 (underlying!382 thiss!992))) (_values!2660 (v!2978 (underlying!382 thiss!992))) (mask!6869 (v!2978 (underlying!382 thiss!992))) (extraKeys!2466 (v!2978 (underlying!382 thiss!992))) (zeroValue!2544 (v!2978 (underlying!382 thiss!992))) (minValue!2544 (v!2978 (underlying!382 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2677 (v!2978 (underlying!382 thiss!992)))))))

(declare-fun mapNonEmpty!4091 () Bool)

(declare-fun mapRes!4092 () Bool)

(declare-fun tp!10186 () Bool)

(declare-fun e!74113 () Bool)

(assert (=> mapNonEmpty!4091 (= mapRes!4092 (and tp!10186 e!74113))))

(declare-fun mapKey!4091 () (_ BitVec 32))

(declare-fun mapRest!4092 () (Array (_ BitVec 32) ValueCell!1017))

(declare-fun mapValue!4091 () ValueCell!1017)

(assert (=> mapNonEmpty!4091 (= (arr!2106 (_values!2660 (v!2978 (underlying!382 thiss!992)))) (store mapRest!4092 mapKey!4091 mapValue!4091))))

(declare-fun e!74115 () Bool)

(declare-fun e!74129 () Bool)

(declare-fun tp_is_empty!2721 () Bool)

(declare-fun array_inv!1323 (array!4443) Bool)

(declare-fun array_inv!1324 (array!4445) Bool)

(assert (=> b!114007 (= e!74115 (and tp!10188 tp_is_empty!2721 (array_inv!1323 (_keys!4399 newMap!16)) (array_inv!1324 (_values!2660 newMap!16)) e!74129))))

(declare-fun b!114008 () Bool)

(declare-fun e!74119 () Bool)

(declare-fun e!74121 () Bool)

(assert (=> b!114008 (= e!74119 e!74121)))

(declare-fun res!56153 () Bool)

(assert (=> b!114008 (=> (not res!56153) (not e!74121))))

(declare-datatypes ((tuple2!2472 0))(
  ( (tuple2!2473 (_1!1247 Bool) (_2!1247 LongMapFixedSize!942)) )
))
(declare-fun lt!59226 () tuple2!2472)

(assert (=> b!114008 (= res!56153 (and (_1!1247 lt!59226) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3561 0))(
  ( (Unit!3562) )
))
(declare-fun lt!59233 () Unit!3561)

(declare-fun e!74128 () Unit!3561)

(assert (=> b!114008 (= lt!59233 e!74128)))

(declare-fun c!20408 () Bool)

(declare-fun contains!851 (ListLongMap!1609 (_ BitVec 64)) Bool)

(assert (=> b!114008 (= c!20408 (contains!851 lt!59227 (select (arr!2105 (_keys!4399 (v!2978 (underlying!382 thiss!992)))) from!355)))))

(declare-fun lt!59229 () V!3275)

(declare-fun update!169 (LongMapFixedSize!942 (_ BitVec 64) V!3275) tuple2!2472)

(assert (=> b!114008 (= lt!59226 (update!169 newMap!16 (select (arr!2105 (_keys!4399 (v!2978 (underlying!382 thiss!992)))) from!355) lt!59229))))

(declare-fun b!114009 () Bool)

(declare-fun e!74123 () Bool)

(declare-fun e!74117 () Bool)

(assert (=> b!114009 (= e!74123 (and e!74117 mapRes!4092))))

(declare-fun condMapEmpty!4091 () Bool)

(declare-fun mapDefault!4092 () ValueCell!1017)

(assert (=> b!114009 (= condMapEmpty!4091 (= (arr!2106 (_values!2660 (v!2978 (underlying!382 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1017)) mapDefault!4092)))))

(declare-fun b!114010 () Bool)

(declare-fun e!74127 () Bool)

(declare-fun e!74122 () Bool)

(assert (=> b!114010 (= e!74127 e!74122)))

(declare-fun b!114011 () Bool)

(declare-fun res!56155 () Bool)

(assert (=> b!114011 (=> (not res!56155) (not e!74120))))

(assert (=> b!114011 (= res!56155 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6869 newMap!16)) (_size!520 (v!2978 (underlying!382 thiss!992)))))))

(declare-fun b!114012 () Bool)

(assert (=> b!114012 (= e!74117 tp_is_empty!2721)))

(declare-fun mapIsEmpty!4092 () Bool)

(assert (=> mapIsEmpty!4092 mapRes!4092))

(declare-fun b!114013 () Bool)

(declare-fun res!56154 () Bool)

(assert (=> b!114013 (=> (not res!56154) (not e!74120))))

(assert (=> b!114013 (= res!56154 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2365 (_keys!4399 (v!2978 (underlying!382 thiss!992)))))))))

(declare-fun b!114014 () Bool)

(declare-fun Unit!3563 () Unit!3561)

(assert (=> b!114014 (= e!74128 Unit!3563)))

(declare-fun lt!59230 () Unit!3561)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!118 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) V!3275 V!3275 (_ BitVec 64) (_ BitVec 32) Int) Unit!3561)

(assert (=> b!114014 (= lt!59230 (lemmaListMapContainsThenArrayContainsFrom!118 (_keys!4399 (v!2978 (underlying!382 thiss!992))) (_values!2660 (v!2978 (underlying!382 thiss!992))) (mask!6869 (v!2978 (underlying!382 thiss!992))) (extraKeys!2466 (v!2978 (underlying!382 thiss!992))) (zeroValue!2544 (v!2978 (underlying!382 thiss!992))) (minValue!2544 (v!2978 (underlying!382 thiss!992))) (select (arr!2105 (_keys!4399 (v!2978 (underlying!382 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2677 (v!2978 (underlying!382 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114014 (arrayContainsKey!0 (_keys!4399 (v!2978 (underlying!382 thiss!992))) (select (arr!2105 (_keys!4399 (v!2978 (underlying!382 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59223 () Unit!3561)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4443 (_ BitVec 32) (_ BitVec 32)) Unit!3561)

(assert (=> b!114014 (= lt!59223 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4399 (v!2978 (underlying!382 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1648 0))(
  ( (Nil!1645) (Cons!1644 (h!2244 (_ BitVec 64)) (t!5850 List!1648)) )
))
(declare-fun arrayNoDuplicates!0 (array!4443 (_ BitVec 32) List!1648) Bool)

(assert (=> b!114014 (arrayNoDuplicates!0 (_keys!4399 (v!2978 (underlying!382 thiss!992))) from!355 Nil!1645)))

(declare-fun lt!59224 () Unit!3561)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4443 (_ BitVec 32) (_ BitVec 64) List!1648) Unit!3561)

(assert (=> b!114014 (= lt!59224 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4399 (v!2978 (underlying!382 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2105 (_keys!4399 (v!2978 (underlying!382 thiss!992)))) from!355) (Cons!1644 (select (arr!2105 (_keys!4399 (v!2978 (underlying!382 thiss!992)))) from!355) Nil!1645)))))

(assert (=> b!114014 false))

(declare-fun b!114015 () Bool)

(declare-fun Unit!3564 () Unit!3561)

(assert (=> b!114015 (= e!74128 Unit!3564)))

(declare-fun b!114016 () Bool)

(assert (=> b!114016 (= e!74121 (not true))))

(declare-fun lt!59225 () ListLongMap!1609)

(declare-fun lt!59231 () tuple2!2470)

(declare-fun lt!59228 () tuple2!2470)

(declare-fun +!158 (ListLongMap!1609 tuple2!2470) ListLongMap!1609)

(assert (=> b!114016 (= (+!158 (+!158 lt!59225 lt!59231) lt!59228) (+!158 (+!158 lt!59225 lt!59228) lt!59231))))

(assert (=> b!114016 (= lt!59228 (tuple2!2471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2544 (v!2978 (underlying!382 thiss!992)))))))

(assert (=> b!114016 (= lt!59231 (tuple2!2471 (select (arr!2105 (_keys!4399 (v!2978 (underlying!382 thiss!992)))) from!355) lt!59229))))

(declare-fun lt!59234 () Unit!3561)

(declare-fun addCommutativeForDiffKeys!70 (ListLongMap!1609 (_ BitVec 64) V!3275 (_ BitVec 64) V!3275) Unit!3561)

(assert (=> b!114016 (= lt!59234 (addCommutativeForDiffKeys!70 lt!59225 (select (arr!2105 (_keys!4399 (v!2978 (underlying!382 thiss!992)))) from!355) lt!59229 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2544 (v!2978 (underlying!382 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!124 (array!4443 array!4445 (_ BitVec 32) (_ BitVec 32) V!3275 V!3275 (_ BitVec 32) Int) ListLongMap!1609)

(assert (=> b!114016 (= lt!59225 (getCurrentListMapNoExtraKeys!124 (_keys!4399 (v!2978 (underlying!382 thiss!992))) (_values!2660 (v!2978 (underlying!382 thiss!992))) (mask!6869 (v!2978 (underlying!382 thiss!992))) (extraKeys!2466 (v!2978 (underlying!382 thiss!992))) (zeroValue!2544 (v!2978 (underlying!382 thiss!992))) (minValue!2544 (v!2978 (underlying!382 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2677 (v!2978 (underlying!382 thiss!992)))))))

(declare-fun b!114017 () Bool)

(declare-fun e!74116 () Bool)

(assert (=> b!114017 (= e!74122 e!74116)))

(declare-fun mapNonEmpty!4092 () Bool)

(declare-fun mapRes!4091 () Bool)

(declare-fun tp!10187 () Bool)

(declare-fun e!74125 () Bool)

(assert (=> mapNonEmpty!4092 (= mapRes!4091 (and tp!10187 e!74125))))

(declare-fun mapKey!4092 () (_ BitVec 32))

(declare-fun mapRest!4091 () (Array (_ BitVec 32) ValueCell!1017))

(declare-fun mapValue!4092 () ValueCell!1017)

(assert (=> mapNonEmpty!4092 (= (arr!2106 (_values!2660 newMap!16)) (store mapRest!4091 mapKey!4092 mapValue!4092))))

(declare-fun b!114018 () Bool)

(assert (=> b!114018 (= e!74113 tp_is_empty!2721)))

(declare-fun b!114019 () Bool)

(declare-fun res!56152 () Bool)

(assert (=> b!114019 (=> (not res!56152) (not e!74120))))

(declare-fun valid!443 (LongMapFixedSize!942) Bool)

(assert (=> b!114019 (= res!56152 (valid!443 newMap!16))))

(declare-fun b!114020 () Bool)

(assert (=> b!114020 (= e!74126 e!74119)))

(declare-fun res!56158 () Bool)

(assert (=> b!114020 (=> (not res!56158) (not e!74119))))

(assert (=> b!114020 (= res!56158 (and (not (= (select (arr!2105 (_keys!4399 (v!2978 (underlying!382 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2105 (_keys!4399 (v!2978 (underlying!382 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1370 (ValueCell!1017 V!3275) V!3275)

(declare-fun dynLambda!396 (Int (_ BitVec 64)) V!3275)

(assert (=> b!114020 (= lt!59229 (get!1370 (select (arr!2106 (_values!2660 (v!2978 (underlying!382 thiss!992)))) from!355) (dynLambda!396 (defaultEntry!2677 (v!2978 (underlying!382 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!4091 () Bool)

(assert (=> mapIsEmpty!4091 mapRes!4091))

(declare-fun res!56157 () Bool)

(assert (=> start!13066 (=> (not res!56157) (not e!74120))))

(declare-fun valid!444 (LongMap!742) Bool)

(assert (=> start!13066 (= res!56157 (valid!444 thiss!992))))

(assert (=> start!13066 e!74120))

(assert (=> start!13066 e!74127))

(assert (=> start!13066 true))

(assert (=> start!13066 e!74115))

(declare-fun b!114021 () Bool)

(assert (=> b!114021 (= e!74125 tp_is_empty!2721)))

(assert (=> b!114022 (= e!74116 (and tp!10185 tp_is_empty!2721 (array_inv!1323 (_keys!4399 (v!2978 (underlying!382 thiss!992)))) (array_inv!1324 (_values!2660 (v!2978 (underlying!382 thiss!992)))) e!74123))))

(declare-fun b!114023 () Bool)

(declare-fun e!74118 () Bool)

(assert (=> b!114023 (= e!74129 (and e!74118 mapRes!4091))))

(declare-fun condMapEmpty!4092 () Bool)

(declare-fun mapDefault!4091 () ValueCell!1017)

(assert (=> b!114023 (= condMapEmpty!4092 (= (arr!2106 (_values!2660 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1017)) mapDefault!4091)))))

(declare-fun b!114024 () Bool)

(assert (=> b!114024 (= e!74118 tp_is_empty!2721)))

(assert (= (and start!13066 res!56157) b!114013))

(assert (= (and b!114013 res!56154) b!114019))

(assert (= (and b!114019 res!56152) b!114011))

(assert (= (and b!114011 res!56155) b!114006))

(assert (= (and b!114006 res!56156) b!114020))

(assert (= (and b!114020 res!56158) b!114008))

(assert (= (and b!114008 c!20408) b!114014))

(assert (= (and b!114008 (not c!20408)) b!114015))

(assert (= (and b!114008 res!56153) b!114016))

(assert (= (and b!114009 condMapEmpty!4091) mapIsEmpty!4092))

(assert (= (and b!114009 (not condMapEmpty!4091)) mapNonEmpty!4091))

(get-info :version)

(assert (= (and mapNonEmpty!4091 ((_ is ValueCellFull!1017) mapValue!4091)) b!114018))

(assert (= (and b!114009 ((_ is ValueCellFull!1017) mapDefault!4092)) b!114012))

(assert (= b!114022 b!114009))

(assert (= b!114017 b!114022))

(assert (= b!114010 b!114017))

(assert (= start!13066 b!114010))

(assert (= (and b!114023 condMapEmpty!4092) mapIsEmpty!4091))

(assert (= (and b!114023 (not condMapEmpty!4092)) mapNonEmpty!4092))

(assert (= (and mapNonEmpty!4092 ((_ is ValueCellFull!1017) mapValue!4092)) b!114021))

(assert (= (and b!114023 ((_ is ValueCellFull!1017) mapDefault!4091)) b!114024))

(assert (= b!114007 b!114023))

(assert (= start!13066 b!114007))

(declare-fun b_lambda!5101 () Bool)

(assert (=> (not b_lambda!5101) (not b!114020)))

(declare-fun t!5846 () Bool)

(declare-fun tb!2165 () Bool)

(assert (=> (and b!114022 (= (defaultEntry!2677 (v!2978 (underlying!382 thiss!992))) (defaultEntry!2677 (v!2978 (underlying!382 thiss!992)))) t!5846) tb!2165))

(declare-fun result!3617 () Bool)

(assert (=> tb!2165 (= result!3617 tp_is_empty!2721)))

(assert (=> b!114020 t!5846))

(declare-fun b_and!7015 () Bool)

(assert (= b_and!7011 (and (=> t!5846 result!3617) b_and!7015)))

(declare-fun tb!2167 () Bool)

(declare-fun t!5848 () Bool)

(assert (=> (and b!114007 (= (defaultEntry!2677 newMap!16) (defaultEntry!2677 (v!2978 (underlying!382 thiss!992)))) t!5848) tb!2167))

(declare-fun result!3621 () Bool)

(assert (= result!3621 result!3617))

(assert (=> b!114020 t!5848))

(declare-fun b_and!7017 () Bool)

(assert (= b_and!7013 (and (=> t!5848 result!3621) b_and!7017)))

(declare-fun m!130365 () Bool)

(assert (=> b!114014 m!130365))

(declare-fun m!130367 () Bool)

(assert (=> b!114014 m!130367))

(declare-fun m!130369 () Bool)

(assert (=> b!114014 m!130369))

(declare-fun m!130371 () Bool)

(assert (=> b!114014 m!130371))

(assert (=> b!114014 m!130369))

(assert (=> b!114014 m!130369))

(declare-fun m!130373 () Bool)

(assert (=> b!114014 m!130373))

(assert (=> b!114014 m!130369))

(declare-fun m!130375 () Bool)

(assert (=> b!114014 m!130375))

(assert (=> b!114020 m!130369))

(declare-fun m!130377 () Bool)

(assert (=> b!114020 m!130377))

(declare-fun m!130379 () Bool)

(assert (=> b!114020 m!130379))

(assert (=> b!114020 m!130377))

(assert (=> b!114020 m!130379))

(declare-fun m!130381 () Bool)

(assert (=> b!114020 m!130381))

(declare-fun m!130383 () Bool)

(assert (=> mapNonEmpty!4092 m!130383))

(declare-fun m!130385 () Bool)

(assert (=> b!114019 m!130385))

(declare-fun m!130387 () Bool)

(assert (=> b!114006 m!130387))

(declare-fun m!130389 () Bool)

(assert (=> b!114006 m!130389))

(assert (=> b!114008 m!130369))

(assert (=> b!114008 m!130369))

(declare-fun m!130391 () Bool)

(assert (=> b!114008 m!130391))

(assert (=> b!114008 m!130369))

(declare-fun m!130393 () Bool)

(assert (=> b!114008 m!130393))

(declare-fun m!130395 () Bool)

(assert (=> b!114022 m!130395))

(declare-fun m!130397 () Bool)

(assert (=> b!114022 m!130397))

(declare-fun m!130399 () Bool)

(assert (=> b!114007 m!130399))

(declare-fun m!130401 () Bool)

(assert (=> b!114007 m!130401))

(declare-fun m!130403 () Bool)

(assert (=> start!13066 m!130403))

(declare-fun m!130405 () Bool)

(assert (=> mapNonEmpty!4091 m!130405))

(declare-fun m!130407 () Bool)

(assert (=> b!114016 m!130407))

(declare-fun m!130409 () Bool)

(assert (=> b!114016 m!130409))

(declare-fun m!130411 () Bool)

(assert (=> b!114016 m!130411))

(assert (=> b!114016 m!130369))

(assert (=> b!114016 m!130407))

(assert (=> b!114016 m!130369))

(declare-fun m!130413 () Bool)

(assert (=> b!114016 m!130413))

(assert (=> b!114016 m!130411))

(declare-fun m!130415 () Bool)

(assert (=> b!114016 m!130415))

(declare-fun m!130417 () Bool)

(assert (=> b!114016 m!130417))

(check-sat (not b_lambda!5101) b_and!7015 (not mapNonEmpty!4092) (not b!114014) (not b!114022) (not b!114006) (not b!114008) tp_is_empty!2721 (not mapNonEmpty!4091) (not b!114016) b_and!7017 (not b!114007) (not b!114020) (not b!114019) (not b_next!2609) (not b_next!2611) (not start!13066))
(check-sat b_and!7015 b_and!7017 (not b_next!2609) (not b_next!2611))
