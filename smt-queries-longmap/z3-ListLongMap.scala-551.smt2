; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14674 () Bool)

(assert start!14674)

(declare-fun b!139006 () Bool)

(declare-fun b_free!3001 () Bool)

(declare-fun b_next!3001 () Bool)

(assert (=> b!139006 (= b_free!3001 (not b_next!3001))))

(declare-fun tp!11471 () Bool)

(declare-fun b_and!8665 () Bool)

(assert (=> b!139006 (= tp!11471 b_and!8665)))

(declare-fun b!139003 () Bool)

(declare-fun b_free!3003 () Bool)

(declare-fun b_next!3003 () Bool)

(assert (=> b!139003 (= b_free!3003 (not b_next!3003))))

(declare-fun tp!11469 () Bool)

(declare-fun b_and!8667 () Bool)

(assert (=> b!139003 (= tp!11469 b_and!8667)))

(declare-fun b!138997 () Bool)

(declare-fun e!90587 () Bool)

(declare-fun e!90586 () Bool)

(assert (=> b!138997 (= e!90587 e!90586)))

(declare-fun res!66520 () Bool)

(assert (=> b!138997 (=> (not res!66520) (not e!90586))))

(declare-datatypes ((V!3537 0))(
  ( (V!3538 (val!1503 Int)) )
))
(declare-datatypes ((array!4853 0))(
  ( (array!4854 (arr!2294 (Array (_ BitVec 32) (_ BitVec 64))) (size!2566 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1115 0))(
  ( (ValueCellFull!1115 (v!3264 V!3537)) (EmptyCell!1115) )
))
(declare-datatypes ((array!4855 0))(
  ( (array!4856 (arr!2295 (Array (_ BitVec 32) ValueCell!1115)) (size!2567 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1138 0))(
  ( (LongMapFixedSize!1139 (defaultEntry!2931 Int) (mask!7267 (_ BitVec 32)) (extraKeys!2686 (_ BitVec 32)) (zeroValue!2781 V!3537) (minValue!2781 V!3537) (_size!618 (_ BitVec 32)) (_keys!4690 array!4853) (_values!2914 array!4855) (_vacant!618 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!924 0))(
  ( (Cell!925 (v!3265 LongMapFixedSize!1138)) )
))
(declare-datatypes ((LongMap!924 0))(
  ( (LongMap!925 (underlying!473 Cell!924)) )
))
(declare-fun thiss!992 () LongMap!924)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2610 0))(
  ( (tuple2!2611 (_1!1316 (_ BitVec 64)) (_2!1316 V!3537)) )
))
(declare-datatypes ((List!1711 0))(
  ( (Nil!1708) (Cons!1707 (h!2314 tuple2!2610) (t!6263 List!1711)) )
))
(declare-datatypes ((ListLongMap!1679 0))(
  ( (ListLongMap!1680 (toList!855 List!1711)) )
))
(declare-fun lt!72750 () ListLongMap!1679)

(declare-fun contains!900 (ListLongMap!1679 (_ BitVec 64)) Bool)

(assert (=> b!138997 (= res!66520 (contains!900 lt!72750 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!1138)

(declare-datatypes ((tuple2!2612 0))(
  ( (tuple2!2613 (_1!1317 Bool) (_2!1317 LongMapFixedSize!1138)) )
))
(declare-fun lt!72751 () tuple2!2612)

(declare-fun update!206 (LongMapFixedSize!1138 (_ BitVec 64) V!3537) tuple2!2612)

(declare-fun get!1522 (ValueCell!1115 V!3537) V!3537)

(declare-fun dynLambda!436 (Int (_ BitVec 64)) V!3537)

(assert (=> b!138997 (= lt!72751 (update!206 newMap!16 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!138998 () Bool)

(declare-fun e!90592 () Bool)

(declare-fun tp_is_empty!2917 () Bool)

(assert (=> b!138998 (= e!90592 tp_is_empty!2917)))

(declare-fun mapNonEmpty!4787 () Bool)

(declare-fun mapRes!4788 () Bool)

(declare-fun tp!11472 () Bool)

(declare-fun e!90599 () Bool)

(assert (=> mapNonEmpty!4787 (= mapRes!4788 (and tp!11472 e!90599))))

(declare-fun mapValue!4788 () ValueCell!1115)

(declare-fun mapRest!4788 () (Array (_ BitVec 32) ValueCell!1115))

(declare-fun mapKey!4787 () (_ BitVec 32))

(assert (=> mapNonEmpty!4787 (= (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) (store mapRest!4788 mapKey!4787 mapValue!4788))))

(declare-fun b!138999 () Bool)

(declare-fun e!90595 () Bool)

(assert (=> b!138999 (= e!90595 tp_is_empty!2917)))

(declare-fun b!139000 () Bool)

(declare-fun e!90585 () Bool)

(assert (=> b!139000 (= e!90585 tp_is_empty!2917)))

(declare-fun mapIsEmpty!4787 () Bool)

(assert (=> mapIsEmpty!4787 mapRes!4788))

(declare-fun b!139001 () Bool)

(declare-fun res!66518 () Bool)

(declare-fun e!90594 () Bool)

(assert (=> b!139001 (=> (not res!66518) (not e!90594))))

(assert (=> b!139001 (= res!66518 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2566 (_keys!4690 (v!3265 (underlying!473 thiss!992)))))))))

(declare-fun res!66519 () Bool)

(assert (=> start!14674 (=> (not res!66519) (not e!90594))))

(declare-fun valid!560 (LongMap!924) Bool)

(assert (=> start!14674 (= res!66519 (valid!560 thiss!992))))

(assert (=> start!14674 e!90594))

(declare-fun e!90590 () Bool)

(assert (=> start!14674 e!90590))

(assert (=> start!14674 true))

(declare-fun e!90591 () Bool)

(assert (=> start!14674 e!90591))

(declare-fun b!139002 () Bool)

(declare-fun e!90589 () Bool)

(declare-fun e!90596 () Bool)

(assert (=> b!139002 (= e!90589 e!90596)))

(declare-fun e!90588 () Bool)

(declare-fun array_inv!1431 (array!4853) Bool)

(declare-fun array_inv!1432 (array!4855) Bool)

(assert (=> b!139003 (= e!90591 (and tp!11469 tp_is_empty!2917 (array_inv!1431 (_keys!4690 newMap!16)) (array_inv!1432 (_values!2914 newMap!16)) e!90588))))

(declare-fun b!139004 () Bool)

(declare-fun e!90597 () Bool)

(assert (=> b!139004 (= e!90597 (and e!90595 mapRes!4788))))

(declare-fun condMapEmpty!4787 () Bool)

(declare-fun mapDefault!4787 () ValueCell!1115)

(assert (=> b!139004 (= condMapEmpty!4787 (= (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1115)) mapDefault!4787)))))

(declare-fun b!139005 () Bool)

(declare-fun res!66522 () Bool)

(assert (=> b!139005 (=> (not res!66522) (not e!90594))))

(assert (=> b!139005 (= res!66522 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7267 newMap!16)) (_size!618 (v!3265 (underlying!473 thiss!992)))))))

(assert (=> b!139006 (= e!90596 (and tp!11471 tp_is_empty!2917 (array_inv!1431 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) (array_inv!1432 (_values!2914 (v!3265 (underlying!473 thiss!992)))) e!90597))))

(declare-fun b!139007 () Bool)

(assert (=> b!139007 (= e!90594 e!90587)))

(declare-fun res!66521 () Bool)

(assert (=> b!139007 (=> (not res!66521) (not e!90587))))

(declare-fun lt!72753 () ListLongMap!1679)

(assert (=> b!139007 (= res!66521 (and (= lt!72753 lt!72750) (not (= (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1422 (LongMapFixedSize!1138) ListLongMap!1679)

(assert (=> b!139007 (= lt!72750 (map!1422 newMap!16))))

(declare-fun getCurrentListMap!528 (array!4853 array!4855 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 32) Int) ListLongMap!1679)

(assert (=> b!139007 (= lt!72753 (getCurrentListMap!528 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (_values!2914 (v!3265 (underlying!473 thiss!992))) (mask!7267 (v!3265 (underlying!473 thiss!992))) (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) (zeroValue!2781 (v!3265 (underlying!473 thiss!992))) (minValue!2781 (v!3265 (underlying!473 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992)))))))

(declare-fun mapNonEmpty!4788 () Bool)

(declare-fun mapRes!4787 () Bool)

(declare-fun tp!11470 () Bool)

(assert (=> mapNonEmpty!4788 (= mapRes!4787 (and tp!11470 e!90592))))

(declare-fun mapRest!4787 () (Array (_ BitVec 32) ValueCell!1115))

(declare-fun mapKey!4788 () (_ BitVec 32))

(declare-fun mapValue!4787 () ValueCell!1115)

(assert (=> mapNonEmpty!4788 (= (arr!2295 (_values!2914 newMap!16)) (store mapRest!4787 mapKey!4788 mapValue!4787))))

(declare-fun b!139008 () Bool)

(assert (=> b!139008 (= e!90586 (not (bvslt (size!2566 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) #b01111111111111111111111111111111)))))

(declare-datatypes ((List!1712 0))(
  ( (Nil!1709) (Cons!1708 (h!2315 (_ BitVec 64)) (t!6264 List!1712)) )
))
(declare-fun arrayNoDuplicates!0 (array!4853 (_ BitVec 32) List!1712) Bool)

(assert (=> b!139008 (arrayNoDuplicates!0 (_keys!4690 (v!3265 (underlying!473 thiss!992))) from!355 Nil!1709)))

(declare-datatypes ((Unit!4373 0))(
  ( (Unit!4374) )
))
(declare-fun lt!72752 () Unit!4373)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4853 (_ BitVec 32) (_ BitVec 32)) Unit!4373)

(assert (=> b!139008 (= lt!72752 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4690 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139008 (arrayContainsKey!0 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!72754 () Unit!4373)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!134 (array!4853 array!4855 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 64) (_ BitVec 32) Int) Unit!4373)

(assert (=> b!139008 (= lt!72754 (lemmaListMapContainsThenArrayContainsFrom!134 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (_values!2914 (v!3265 (underlying!473 thiss!992))) (mask!7267 (v!3265 (underlying!473 thiss!992))) (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) (zeroValue!2781 (v!3265 (underlying!473 thiss!992))) (minValue!2781 (v!3265 (underlying!473 thiss!992))) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992)))))))

(declare-fun mapIsEmpty!4788 () Bool)

(assert (=> mapIsEmpty!4788 mapRes!4787))

(declare-fun b!139009 () Bool)

(declare-fun res!66523 () Bool)

(assert (=> b!139009 (=> (not res!66523) (not e!90594))))

(declare-fun valid!561 (LongMapFixedSize!1138) Bool)

(assert (=> b!139009 (= res!66523 (valid!561 newMap!16))))

(declare-fun b!139010 () Bool)

(assert (=> b!139010 (= e!90588 (and e!90585 mapRes!4787))))

(declare-fun condMapEmpty!4788 () Bool)

(declare-fun mapDefault!4788 () ValueCell!1115)

(assert (=> b!139010 (= condMapEmpty!4788 (= (arr!2295 (_values!2914 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1115)) mapDefault!4788)))))

(declare-fun b!139011 () Bool)

(assert (=> b!139011 (= e!90590 e!90589)))

(declare-fun b!139012 () Bool)

(assert (=> b!139012 (= e!90599 tp_is_empty!2917)))

(assert (= (and start!14674 res!66519) b!139001))

(assert (= (and b!139001 res!66518) b!139009))

(assert (= (and b!139009 res!66523) b!139005))

(assert (= (and b!139005 res!66522) b!139007))

(assert (= (and b!139007 res!66521) b!138997))

(assert (= (and b!138997 res!66520) b!139008))

(assert (= (and b!139004 condMapEmpty!4787) mapIsEmpty!4787))

(assert (= (and b!139004 (not condMapEmpty!4787)) mapNonEmpty!4787))

(get-info :version)

(assert (= (and mapNonEmpty!4787 ((_ is ValueCellFull!1115) mapValue!4788)) b!139012))

(assert (= (and b!139004 ((_ is ValueCellFull!1115) mapDefault!4787)) b!138999))

(assert (= b!139006 b!139004))

(assert (= b!139002 b!139006))

(assert (= b!139011 b!139002))

(assert (= start!14674 b!139011))

(assert (= (and b!139010 condMapEmpty!4788) mapIsEmpty!4788))

(assert (= (and b!139010 (not condMapEmpty!4788)) mapNonEmpty!4788))

(assert (= (and mapNonEmpty!4788 ((_ is ValueCellFull!1115) mapValue!4787)) b!138998))

(assert (= (and b!139010 ((_ is ValueCellFull!1115) mapDefault!4788)) b!139000))

(assert (= b!139003 b!139010))

(assert (= start!14674 b!139003))

(declare-fun b_lambda!6241 () Bool)

(assert (=> (not b_lambda!6241) (not b!138997)))

(declare-fun t!6260 () Bool)

(declare-fun tb!2513 () Bool)

(assert (=> (and b!139006 (= (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992)))) t!6260) tb!2513))

(declare-fun result!4129 () Bool)

(assert (=> tb!2513 (= result!4129 tp_is_empty!2917)))

(assert (=> b!138997 t!6260))

(declare-fun b_and!8669 () Bool)

(assert (= b_and!8665 (and (=> t!6260 result!4129) b_and!8669)))

(declare-fun t!6262 () Bool)

(declare-fun tb!2515 () Bool)

(assert (=> (and b!139003 (= (defaultEntry!2931 newMap!16) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992)))) t!6262) tb!2515))

(declare-fun result!4133 () Bool)

(assert (= result!4133 result!4129))

(assert (=> b!138997 t!6262))

(declare-fun b_and!8671 () Bool)

(assert (= b_and!8667 (and (=> t!6262 result!4133) b_and!8671)))

(declare-fun m!166237 () Bool)

(assert (=> b!139007 m!166237))

(declare-fun m!166239 () Bool)

(assert (=> b!139007 m!166239))

(declare-fun m!166241 () Bool)

(assert (=> b!139007 m!166241))

(declare-fun m!166243 () Bool)

(assert (=> b!139008 m!166243))

(declare-fun m!166245 () Bool)

(assert (=> b!139008 m!166245))

(assert (=> b!139008 m!166237))

(declare-fun m!166247 () Bool)

(assert (=> b!139008 m!166247))

(assert (=> b!139008 m!166237))

(assert (=> b!139008 m!166237))

(declare-fun m!166249 () Bool)

(assert (=> b!139008 m!166249))

(declare-fun m!166251 () Bool)

(assert (=> mapNonEmpty!4788 m!166251))

(declare-fun m!166253 () Bool)

(assert (=> b!139006 m!166253))

(declare-fun m!166255 () Bool)

(assert (=> b!139006 m!166255))

(declare-fun m!166257 () Bool)

(assert (=> b!138997 m!166257))

(declare-fun m!166259 () Bool)

(assert (=> b!138997 m!166259))

(declare-fun m!166261 () Bool)

(assert (=> b!138997 m!166261))

(assert (=> b!138997 m!166237))

(declare-fun m!166263 () Bool)

(assert (=> b!138997 m!166263))

(assert (=> b!138997 m!166237))

(assert (=> b!138997 m!166259))

(assert (=> b!138997 m!166237))

(assert (=> b!138997 m!166261))

(declare-fun m!166265 () Bool)

(assert (=> b!138997 m!166265))

(assert (=> b!138997 m!166257))

(declare-fun m!166267 () Bool)

(assert (=> b!139009 m!166267))

(declare-fun m!166269 () Bool)

(assert (=> b!139003 m!166269))

(declare-fun m!166271 () Bool)

(assert (=> b!139003 m!166271))

(declare-fun m!166273 () Bool)

(assert (=> mapNonEmpty!4787 m!166273))

(declare-fun m!166275 () Bool)

(assert (=> start!14674 m!166275))

(check-sat tp_is_empty!2917 (not b!138997) (not b_next!3003) b_and!8669 (not b!139003) (not b!139009) (not start!14674) (not b_next!3001) (not b!139008) (not mapNonEmpty!4787) (not b!139007) b_and!8671 (not b_lambda!6241) (not b!139006) (not mapNonEmpty!4788))
(check-sat b_and!8669 b_and!8671 (not b_next!3001) (not b_next!3003))
(get-model)

(declare-fun b_lambda!6247 () Bool)

(assert (= b_lambda!6241 (or (and b!139006 b_free!3001) (and b!139003 b_free!3003 (= (defaultEntry!2931 newMap!16) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))))) b_lambda!6247)))

(check-sat tp_is_empty!2917 (not b!138997) (not b_next!3003) b_and!8669 (not b_lambda!6247) (not b!139003) (not b!139009) (not start!14674) (not b_next!3001) (not b!139008) (not mapNonEmpty!4787) (not b!139007) b_and!8671 (not b!139006) (not mapNonEmpty!4788))
(check-sat b_and!8669 b_and!8671 (not b_next!3001) (not b_next!3003))
(get-model)

(declare-fun d!43497 () Bool)

(declare-fun e!90695 () Bool)

(assert (=> d!43497 e!90695))

(declare-fun res!66562 () Bool)

(assert (=> d!43497 (=> res!66562 e!90695)))

(declare-fun lt!72796 () Bool)

(assert (=> d!43497 (= res!66562 (not lt!72796))))

(declare-fun lt!72795 () Bool)

(assert (=> d!43497 (= lt!72796 lt!72795)))

(declare-fun lt!72794 () Unit!4373)

(declare-fun e!90694 () Unit!4373)

(assert (=> d!43497 (= lt!72794 e!90694)))

(declare-fun c!26041 () Bool)

(assert (=> d!43497 (= c!26041 lt!72795)))

(declare-fun containsKey!179 (List!1711 (_ BitVec 64)) Bool)

(assert (=> d!43497 (= lt!72795 (containsKey!179 (toList!855 lt!72750) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(assert (=> d!43497 (= (contains!900 lt!72750 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)) lt!72796)))

(declare-fun b!139121 () Bool)

(declare-fun lt!72793 () Unit!4373)

(assert (=> b!139121 (= e!90694 lt!72793)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!127 (List!1711 (_ BitVec 64)) Unit!4373)

(assert (=> b!139121 (= lt!72793 (lemmaContainsKeyImpliesGetValueByKeyDefined!127 (toList!855 lt!72750) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(declare-datatypes ((Option!182 0))(
  ( (Some!181 (v!3271 V!3537)) (None!180) )
))
(declare-fun isDefined!128 (Option!182) Bool)

(declare-fun getValueByKey!176 (List!1711 (_ BitVec 64)) Option!182)

(assert (=> b!139121 (isDefined!128 (getValueByKey!176 (toList!855 lt!72750) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(declare-fun b!139122 () Bool)

(declare-fun Unit!4379 () Unit!4373)

(assert (=> b!139122 (= e!90694 Unit!4379)))

(declare-fun b!139123 () Bool)

(assert (=> b!139123 (= e!90695 (isDefined!128 (getValueByKey!176 (toList!855 lt!72750) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355))))))

(assert (= (and d!43497 c!26041) b!139121))

(assert (= (and d!43497 (not c!26041)) b!139122))

(assert (= (and d!43497 (not res!66562)) b!139123))

(assert (=> d!43497 m!166237))

(declare-fun m!166357 () Bool)

(assert (=> d!43497 m!166357))

(assert (=> b!139121 m!166237))

(declare-fun m!166359 () Bool)

(assert (=> b!139121 m!166359))

(assert (=> b!139121 m!166237))

(declare-fun m!166361 () Bool)

(assert (=> b!139121 m!166361))

(assert (=> b!139121 m!166361))

(declare-fun m!166363 () Bool)

(assert (=> b!139121 m!166363))

(assert (=> b!139123 m!166237))

(assert (=> b!139123 m!166361))

(assert (=> b!139123 m!166361))

(assert (=> b!139123 m!166363))

(assert (=> b!138997 d!43497))

(declare-fun b!139204 () Bool)

(declare-fun e!90752 () Bool)

(declare-fun e!90748 () Bool)

(assert (=> b!139204 (= e!90752 e!90748)))

(declare-fun c!26077 () Bool)

(declare-fun lt!72870 () tuple2!2612)

(assert (=> b!139204 (= c!26077 (_1!1317 lt!72870))))

(declare-fun e!90742 () Bool)

(declare-datatypes ((SeekEntryResult!272 0))(
  ( (MissingZero!272 (index!3251 (_ BitVec 32))) (Found!272 (index!3252 (_ BitVec 32))) (Intermediate!272 (undefined!1084 Bool) (index!3253 (_ BitVec 32)) (x!16075 (_ BitVec 32))) (Undefined!272) (MissingVacant!272 (index!3254 (_ BitVec 32))) )
))
(declare-fun lt!72863 () SeekEntryResult!272)

(declare-fun b!139205 () Bool)

(assert (=> b!139205 (= e!90742 (= (select (arr!2294 (_keys!4690 newMap!16)) (index!3252 lt!72863)) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(declare-fun bm!15357 () Bool)

(declare-fun call!15368 () ListLongMap!1679)

(assert (=> bm!15357 (= call!15368 (getCurrentListMap!528 (_keys!4690 newMap!16) (_values!2914 newMap!16) (mask!7267 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2931 newMap!16)))))

(declare-fun b!139206 () Bool)

(declare-fun e!90741 () Bool)

(declare-fun call!15366 () Bool)

(assert (=> b!139206 (= e!90741 (not call!15366))))

(declare-fun bm!15358 () Bool)

(declare-fun call!15375 () SeekEntryResult!272)

(declare-fun call!15377 () SeekEntryResult!272)

(assert (=> bm!15358 (= call!15375 call!15377)))

(declare-fun b!139207 () Bool)

(declare-fun res!66594 () Bool)

(assert (=> b!139207 (=> (not res!66594) (not e!90741))))

(declare-fun call!15376 () Bool)

(assert (=> b!139207 (= res!66594 call!15376)))

(declare-fun e!90739 () Bool)

(assert (=> b!139207 (= e!90739 e!90741)))

(declare-fun call!15381 () Unit!4373)

(declare-fun bm!15359 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!64 (array!4853 array!4855 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 64) Int) Unit!4373)

(assert (=> bm!15359 (= call!15381 (lemmaInListMapThenSeekEntryOrOpenFindsIt!64 (_keys!4690 newMap!16) (_values!2914 newMap!16) (mask!7267 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (defaultEntry!2931 newMap!16)))))

(declare-fun b!139208 () Bool)

(declare-fun e!90757 () Bool)

(assert (=> b!139208 (= e!90748 e!90757)))

(declare-fun call!15363 () ListLongMap!1679)

(declare-fun res!66601 () Bool)

(assert (=> b!139208 (= res!66601 (contains!900 call!15363 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(assert (=> b!139208 (=> (not res!66601) (not e!90757))))

(declare-fun c!26070 () Bool)

(declare-fun lt!72860 () (_ BitVec 32))

(declare-fun lt!72862 () (_ BitVec 32))

(declare-fun lt!72866 () array!4855)

(declare-fun c!26072 () Bool)

(declare-fun call!15360 () ListLongMap!1679)

(declare-fun c!26069 () Bool)

(declare-fun bm!15360 () Bool)

(assert (=> bm!15360 (= call!15360 (getCurrentListMap!528 (_keys!4690 newMap!16) (ite (or c!26070 c!26072) (_values!2914 newMap!16) lt!72866) (mask!7267 newMap!16) (ite c!26070 (ite c!26069 lt!72860 lt!72862) (extraKeys!2686 newMap!16)) (ite (and c!26070 c!26069) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2781 newMap!16)) (ite c!26070 (ite c!26069 (minValue!2781 newMap!16) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2781 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2931 newMap!16)))))

(declare-fun call!15374 () Bool)

(declare-fun bm!15361 () Bool)

(assert (=> bm!15361 (= call!15374 (arrayContainsKey!0 (_keys!4690 newMap!16) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!15362 () Bool)

(declare-fun call!15370 () Bool)

(assert (=> bm!15362 (= call!15370 call!15374)))

(declare-fun b!139209 () Bool)

(declare-fun e!90738 () Bool)

(declare-fun e!90749 () Bool)

(assert (=> b!139209 (= e!90738 e!90749)))

(declare-fun res!66604 () Bool)

(declare-fun call!15380 () Bool)

(assert (=> b!139209 (= res!66604 call!15380)))

(assert (=> b!139209 (=> (not res!66604) (not e!90749))))

(declare-fun b!139210 () Bool)

(declare-fun c!26075 () Bool)

(declare-fun lt!72857 () SeekEntryResult!272)

(assert (=> b!139210 (= c!26075 ((_ is MissingVacant!272) lt!72857))))

(declare-fun e!90743 () Bool)

(assert (=> b!139210 (= e!90743 e!90738)))

(declare-fun b!139211 () Bool)

(declare-fun lt!72871 () Unit!4373)

(declare-fun e!90755 () Unit!4373)

(assert (=> b!139211 (= lt!72871 e!90755)))

(declare-fun c!26076 () Bool)

(declare-fun call!15373 () Bool)

(assert (=> b!139211 (= c!26076 call!15373)))

(declare-fun e!90745 () tuple2!2612)

(assert (=> b!139211 (= e!90745 (tuple2!2613 false newMap!16))))

(declare-fun b!139212 () Bool)

(declare-fun e!90758 () ListLongMap!1679)

(assert (=> b!139212 (= e!90758 call!15368)))

(declare-fun b!139213 () Bool)

(declare-fun lt!72864 () Unit!4373)

(assert (=> b!139213 (= e!90755 lt!72864)))

(declare-fun call!15361 () Unit!4373)

(assert (=> b!139213 (= lt!72864 call!15361)))

(assert (=> b!139213 (= lt!72857 call!15375)))

(declare-fun c!26071 () Bool)

(assert (=> b!139213 (= c!26071 ((_ is MissingZero!272) lt!72857))))

(assert (=> b!139213 e!90743))

(declare-fun call!15379 () ListLongMap!1679)

(declare-fun bm!15363 () Bool)

(declare-fun call!15378 () ListLongMap!1679)

(declare-fun +!172 (ListLongMap!1679 tuple2!2610) ListLongMap!1679)

(assert (=> bm!15363 (= call!15378 (+!172 (ite c!26070 call!15379 call!15368) (ite c!26070 (ite c!26069 (tuple2!2611 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2611 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2611 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!139214 () Bool)

(declare-fun res!66591 () Bool)

(assert (=> b!139214 (= res!66591 (= (select (arr!2294 (_keys!4690 newMap!16)) (index!3254 lt!72857)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!139214 (=> (not res!66591) (not e!90749))))

(declare-fun b!139215 () Bool)

(declare-fun res!66603 () Bool)

(declare-fun call!15364 () Bool)

(assert (=> b!139215 (= res!66603 call!15364)))

(declare-fun e!90756 () Bool)

(assert (=> b!139215 (=> (not res!66603) (not e!90756))))

(declare-fun b!139216 () Bool)

(declare-fun e!90746 () Unit!4373)

(declare-fun Unit!4380 () Unit!4373)

(assert (=> b!139216 (= e!90746 Unit!4380)))

(declare-fun lt!72854 () Unit!4373)

(assert (=> b!139216 (= lt!72854 call!15361)))

(declare-fun lt!72868 () SeekEntryResult!272)

(declare-fun call!15371 () SeekEntryResult!272)

(assert (=> b!139216 (= lt!72868 call!15371)))

(declare-fun c!26074 () Bool)

(assert (=> b!139216 (= c!26074 ((_ is MissingZero!272) lt!72868))))

(assert (=> b!139216 e!90739))

(declare-fun lt!72861 () Unit!4373)

(assert (=> b!139216 (= lt!72861 lt!72854)))

(assert (=> b!139216 false))

(declare-fun bm!15364 () Bool)

(declare-fun call!15383 () ListLongMap!1679)

(assert (=> bm!15364 (= call!15383 call!15360)))

(declare-fun bm!15365 () Bool)

(assert (=> bm!15365 (= call!15379 call!15368)))

(declare-fun bm!15366 () Bool)

(declare-fun call!15382 () Bool)

(assert (=> bm!15366 (= call!15364 call!15382)))

(declare-fun b!139217 () Bool)

(declare-fun res!66599 () Bool)

(assert (=> b!139217 (= res!66599 (= (select (arr!2294 (_keys!4690 newMap!16)) (index!3254 lt!72868)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!90751 () Bool)

(assert (=> b!139217 (=> (not res!66599) (not e!90751))))

(declare-fun b!139218 () Bool)

(assert (=> b!139218 (= e!90749 (not call!15370))))

(declare-fun bm!15367 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!64 (array!4853 array!4855 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 64) Int) Unit!4373)

(assert (=> bm!15367 (= call!15361 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!64 (_keys!4690 newMap!16) (_values!2914 newMap!16) (mask!7267 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (defaultEntry!2931 newMap!16)))))

(declare-fun bm!15368 () Bool)

(assert (=> bm!15368 (= call!15376 call!15364)))

(declare-fun b!139219 () Bool)

(declare-fun res!66593 () Bool)

(assert (=> b!139219 (=> (not res!66593) (not e!90741))))

(assert (=> b!139219 (= res!66593 (= (select (arr!2294 (_keys!4690 newMap!16)) (index!3251 lt!72868)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!26068 () Bool)

(declare-fun lt!72859 () SeekEntryResult!272)

(declare-fun call!15369 () tuple2!2612)

(declare-fun bm!15369 () Bool)

(declare-fun updateHelperNewKey!64 (LongMapFixedSize!1138 (_ BitVec 64) V!3537 (_ BitVec 32)) tuple2!2612)

(assert (=> bm!15369 (= call!15369 (updateHelperNewKey!64 newMap!16 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!26068 (index!3254 lt!72859) (index!3251 lt!72859))))))

(declare-fun b!139220 () Bool)

(declare-fun e!90750 () tuple2!2612)

(assert (=> b!139220 (= e!90750 e!90745)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4853 (_ BitVec 32)) SeekEntryResult!272)

(assert (=> b!139220 (= lt!72859 (seekEntryOrOpen!0 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (_keys!4690 newMap!16) (mask!7267 newMap!16)))))

(assert (=> b!139220 (= c!26072 ((_ is Undefined!272) lt!72859))))

(declare-fun b!139221 () Bool)

(declare-fun lt!72865 () tuple2!2612)

(assert (=> b!139221 (= lt!72865 call!15369)))

(declare-fun e!90753 () tuple2!2612)

(assert (=> b!139221 (= e!90753 (tuple2!2613 (_1!1317 lt!72865) (_2!1317 lt!72865)))))

(declare-fun bm!15370 () Bool)

(declare-fun call!15365 () ListLongMap!1679)

(assert (=> bm!15370 (= call!15365 (map!1422 newMap!16))))

(declare-fun bm!15371 () Bool)

(declare-fun lt!72852 () SeekEntryResult!272)

(declare-fun c!26080 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!15371 (= call!15382 (inRange!0 (ite c!26072 (ite c!26076 (index!3252 lt!72863) (ite c!26071 (index!3251 lt!72857) (index!3254 lt!72857))) (ite c!26080 (index!3252 lt!72852) (ite c!26074 (index!3251 lt!72868) (index!3254 lt!72868)))) (mask!7267 newMap!16)))))

(declare-fun b!139222 () Bool)

(declare-fun lt!72856 () Unit!4373)

(declare-fun lt!72855 () Unit!4373)

(assert (=> b!139222 (= lt!72856 lt!72855)))

(declare-fun call!15367 () ListLongMap!1679)

(assert (=> b!139222 (= call!15367 call!15383)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!64 (array!4853 array!4855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 V!3537 Int) Unit!4373)

(assert (=> b!139222 (= lt!72855 (lemmaChangeZeroKeyThenAddPairToListMap!64 (_keys!4690 newMap!16) (_values!2914 newMap!16) (mask!7267 newMap!16) (extraKeys!2686 newMap!16) lt!72860 (zeroValue!2781 newMap!16) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2781 newMap!16) (defaultEntry!2931 newMap!16)))))

(assert (=> b!139222 (= lt!72860 (bvor (extraKeys!2686 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!90740 () tuple2!2612)

(assert (=> b!139222 (= e!90740 (tuple2!2613 true (LongMapFixedSize!1139 (defaultEntry!2931 newMap!16) (mask!7267 newMap!16) (bvor (extraKeys!2686 newMap!16) #b00000000000000000000000000000001) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2781 newMap!16) (_size!618 newMap!16) (_keys!4690 newMap!16) (_values!2914 newMap!16) (_vacant!618 newMap!16))))))

(declare-fun bm!15372 () Bool)

(assert (=> bm!15372 (= call!15377 (seekEntryOrOpen!0 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (_keys!4690 newMap!16) (mask!7267 newMap!16)))))

(declare-fun bm!15373 () Bool)

(declare-fun call!15372 () Bool)

(assert (=> bm!15373 (= call!15380 call!15372)))

(declare-fun b!139223 () Bool)

(declare-fun lt!72867 () Unit!4373)

(assert (=> b!139223 (= e!90746 lt!72867)))

(assert (=> b!139223 (= lt!72867 call!15381)))

(assert (=> b!139223 (= lt!72852 call!15371)))

(declare-fun res!66600 () Bool)

(assert (=> b!139223 (= res!66600 ((_ is Found!272) lt!72852))))

(assert (=> b!139223 (=> (not res!66600) (not e!90756))))

(assert (=> b!139223 e!90756))

(declare-fun b!139224 () Bool)

(assert (=> b!139224 (= e!90756 (= (select (arr!2294 (_keys!4690 newMap!16)) (index!3252 lt!72852)) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(declare-fun b!139225 () Bool)

(declare-fun c!26078 () Bool)

(assert (=> b!139225 (= c!26078 ((_ is MissingVacant!272) lt!72868))))

(declare-fun e!90747 () Bool)

(assert (=> b!139225 (= e!90739 e!90747)))

(declare-fun b!139226 () Bool)

(declare-fun res!66602 () Bool)

(declare-fun e!90744 () Bool)

(assert (=> b!139226 (=> (not res!66602) (not e!90744))))

(assert (=> b!139226 (= res!66602 (= (select (arr!2294 (_keys!4690 newMap!16)) (index!3251 lt!72857)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!139227 () Bool)

(assert (=> b!139227 (= e!90744 (not call!15370))))

(declare-fun b!139228 () Bool)

(assert (=> b!139228 (= e!90738 ((_ is Undefined!272) lt!72857))))

(declare-fun b!139229 () Bool)

(assert (=> b!139229 (= e!90747 e!90751)))

(declare-fun res!66595 () Bool)

(assert (=> b!139229 (= res!66595 call!15376)))

(assert (=> b!139229 (=> (not res!66595) (not e!90751))))

(declare-fun b!139230 () Bool)

(declare-fun Unit!4381 () Unit!4373)

(assert (=> b!139230 (= e!90755 Unit!4381)))

(declare-fun lt!72869 () Unit!4373)

(assert (=> b!139230 (= lt!72869 call!15381)))

(assert (=> b!139230 (= lt!72863 call!15375)))

(declare-fun res!66596 () Bool)

(assert (=> b!139230 (= res!66596 ((_ is Found!272) lt!72863))))

(assert (=> b!139230 (=> (not res!66596) (not e!90742))))

(assert (=> b!139230 e!90742))

(declare-fun lt!72874 () Unit!4373)

(assert (=> b!139230 (= lt!72874 lt!72869)))

(assert (=> b!139230 false))

(declare-fun b!139231 () Bool)

(declare-fun call!15362 () ListLongMap!1679)

(assert (=> b!139231 (= e!90758 call!15362)))

(declare-fun bm!15374 () Bool)

(assert (=> bm!15374 (= call!15372 call!15382)))

(declare-fun b!139232 () Bool)

(declare-fun e!90754 () tuple2!2612)

(assert (=> b!139232 (= e!90754 e!90753)))

(declare-fun c!26073 () Bool)

(assert (=> b!139232 (= c!26073 ((_ is MissingZero!272) lt!72859))))

(declare-fun bm!15375 () Bool)

(declare-fun c!26079 () Bool)

(assert (=> bm!15375 (= c!26079 c!26072)))

(assert (=> bm!15375 (= call!15373 (contains!900 e!90758 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(declare-fun b!139233 () Bool)

(declare-fun res!66597 () Bool)

(assert (=> b!139233 (=> (not res!66597) (not e!90744))))

(assert (=> b!139233 (= res!66597 call!15380)))

(assert (=> b!139233 (= e!90743 e!90744)))

(declare-fun b!139234 () Bool)

(assert (=> b!139234 (= e!90757 (= call!15363 (+!172 call!15365 (tuple2!2611 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!139235 () Bool)

(assert (=> b!139235 (= c!26068 ((_ is MissingVacant!272) lt!72859))))

(assert (=> b!139235 (= e!90745 e!90754)))

(declare-fun b!139236 () Bool)

(assert (=> b!139236 (= e!90748 (= call!15363 call!15365))))

(declare-fun b!139237 () Bool)

(declare-fun lt!72872 () tuple2!2612)

(assert (=> b!139237 (= e!90754 (tuple2!2613 (_1!1317 lt!72872) (_2!1317 lt!72872)))))

(assert (=> b!139237 (= lt!72872 call!15369)))

(declare-fun bm!15376 () Bool)

(assert (=> bm!15376 (= call!15366 call!15374)))

(declare-fun b!139238 () Bool)

(declare-fun lt!72873 () Unit!4373)

(declare-fun lt!72858 () Unit!4373)

(assert (=> b!139238 (= lt!72873 lt!72858)))

(assert (=> b!139238 (= call!15367 call!15383)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!64 (array!4853 array!4855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 V!3537 Int) Unit!4373)

(assert (=> b!139238 (= lt!72858 (lemmaChangeLongMinValueKeyThenAddPairToListMap!64 (_keys!4690 newMap!16) (_values!2914 newMap!16) (mask!7267 newMap!16) (extraKeys!2686 newMap!16) lt!72862 (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2931 newMap!16)))))

(assert (=> b!139238 (= lt!72862 (bvor (extraKeys!2686 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!139238 (= e!90740 (tuple2!2613 true (LongMapFixedSize!1139 (defaultEntry!2931 newMap!16) (mask!7267 newMap!16) (bvor (extraKeys!2686 newMap!16) #b00000000000000000000000000000010) (zeroValue!2781 newMap!16) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!618 newMap!16) (_keys!4690 newMap!16) (_values!2914 newMap!16) (_vacant!618 newMap!16))))))

(declare-fun b!139239 () Bool)

(declare-fun lt!72851 () Unit!4373)

(declare-fun lt!72875 () Unit!4373)

(assert (=> b!139239 (= lt!72851 lt!72875)))

(assert (=> b!139239 (contains!900 call!15362 (select (arr!2294 (_keys!4690 newMap!16)) (index!3252 lt!72859)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!124 (array!4853 array!4855 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 32) Int) Unit!4373)

(assert (=> b!139239 (= lt!72875 (lemmaValidKeyInArrayIsInListMap!124 (_keys!4690 newMap!16) lt!72866 (mask!7267 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) (index!3252 lt!72859) (defaultEntry!2931 newMap!16)))))

(assert (=> b!139239 (= lt!72866 (array!4856 (store (arr!2295 (_values!2914 newMap!16)) (index!3252 lt!72859) (ValueCellFull!1115 (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2567 (_values!2914 newMap!16))))))

(declare-fun lt!72877 () Unit!4373)

(declare-fun lt!72876 () Unit!4373)

(assert (=> b!139239 (= lt!72877 lt!72876)))

(assert (=> b!139239 (= call!15378 (getCurrentListMap!528 (_keys!4690 newMap!16) (array!4856 (store (arr!2295 (_values!2914 newMap!16)) (index!3252 lt!72859) (ValueCellFull!1115 (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2567 (_values!2914 newMap!16))) (mask!7267 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2931 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!64 (array!4853 array!4855 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 32) (_ BitVec 64) V!3537 Int) Unit!4373)

(assert (=> b!139239 (= lt!72876 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!64 (_keys!4690 newMap!16) (_values!2914 newMap!16) (mask!7267 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) (index!3252 lt!72859) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2931 newMap!16)))))

(declare-fun lt!72853 () Unit!4373)

(assert (=> b!139239 (= lt!72853 e!90746)))

(assert (=> b!139239 (= c!26080 call!15373)))

(assert (=> b!139239 (= e!90753 (tuple2!2613 true (LongMapFixedSize!1139 (defaultEntry!2931 newMap!16) (mask!7267 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) (_size!618 newMap!16) (_keys!4690 newMap!16) (array!4856 (store (arr!2295 (_values!2914 newMap!16)) (index!3252 lt!72859) (ValueCellFull!1115 (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2567 (_values!2914 newMap!16))) (_vacant!618 newMap!16))))))

(declare-fun bm!15377 () Bool)

(assert (=> bm!15377 (= call!15363 (map!1422 (_2!1317 lt!72870)))))

(declare-fun d!43499 () Bool)

(assert (=> d!43499 e!90752))

(declare-fun res!66598 () Bool)

(assert (=> d!43499 (=> (not res!66598) (not e!90752))))

(assert (=> d!43499 (= res!66598 (valid!561 (_2!1317 lt!72870)))))

(assert (=> d!43499 (= lt!72870 e!90750)))

(assert (=> d!43499 (= c!26070 (= (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (bvneg (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355))))))

(assert (=> d!43499 (valid!561 newMap!16)))

(assert (=> d!43499 (= (update!206 newMap!16 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!72870)))

(declare-fun bm!15378 () Bool)

(assert (=> bm!15378 (= call!15367 call!15378)))

(declare-fun b!139240 () Bool)

(assert (=> b!139240 (= e!90750 e!90740)))

(assert (=> b!139240 (= c!26069 (= (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15379 () Bool)

(assert (=> bm!15379 (= call!15371 call!15377)))

(declare-fun b!139241 () Bool)

(declare-fun res!66592 () Bool)

(assert (=> b!139241 (= res!66592 call!15372)))

(assert (=> b!139241 (=> (not res!66592) (not e!90742))))

(declare-fun bm!15380 () Bool)

(assert (=> bm!15380 (= call!15362 call!15360)))

(declare-fun b!139242 () Bool)

(assert (=> b!139242 (= e!90751 (not call!15366))))

(declare-fun b!139243 () Bool)

(assert (=> b!139243 (= e!90747 ((_ is Undefined!272) lt!72868))))

(assert (= (and d!43499 c!26070) b!139240))

(assert (= (and d!43499 (not c!26070)) b!139220))

(assert (= (and b!139240 c!26069) b!139222))

(assert (= (and b!139240 (not c!26069)) b!139238))

(assert (= (or b!139222 b!139238) bm!15364))

(assert (= (or b!139222 b!139238) bm!15365))

(assert (= (or b!139222 b!139238) bm!15378))

(assert (= (and b!139220 c!26072) b!139211))

(assert (= (and b!139220 (not c!26072)) b!139235))

(assert (= (and b!139211 c!26076) b!139230))

(assert (= (and b!139211 (not c!26076)) b!139213))

(assert (= (and b!139230 res!66596) b!139241))

(assert (= (and b!139241 res!66592) b!139205))

(assert (= (and b!139213 c!26071) b!139233))

(assert (= (and b!139213 (not c!26071)) b!139210))

(assert (= (and b!139233 res!66597) b!139226))

(assert (= (and b!139226 res!66602) b!139227))

(assert (= (and b!139210 c!26075) b!139209))

(assert (= (and b!139210 (not c!26075)) b!139228))

(assert (= (and b!139209 res!66604) b!139214))

(assert (= (and b!139214 res!66591) b!139218))

(assert (= (or b!139233 b!139209) bm!15373))

(assert (= (or b!139227 b!139218) bm!15362))

(assert (= (or b!139241 bm!15373) bm!15374))

(assert (= (or b!139230 b!139213) bm!15358))

(assert (= (and b!139235 c!26068) b!139237))

(assert (= (and b!139235 (not c!26068)) b!139232))

(assert (= (and b!139232 c!26073) b!139221))

(assert (= (and b!139232 (not c!26073)) b!139239))

(assert (= (and b!139239 c!26080) b!139223))

(assert (= (and b!139239 (not c!26080)) b!139216))

(assert (= (and b!139223 res!66600) b!139215))

(assert (= (and b!139215 res!66603) b!139224))

(assert (= (and b!139216 c!26074) b!139207))

(assert (= (and b!139216 (not c!26074)) b!139225))

(assert (= (and b!139207 res!66594) b!139219))

(assert (= (and b!139219 res!66593) b!139206))

(assert (= (and b!139225 c!26078) b!139229))

(assert (= (and b!139225 (not c!26078)) b!139243))

(assert (= (and b!139229 res!66595) b!139217))

(assert (= (and b!139217 res!66599) b!139242))

(assert (= (or b!139207 b!139229) bm!15368))

(assert (= (or b!139206 b!139242) bm!15376))

(assert (= (or b!139215 bm!15368) bm!15366))

(assert (= (or b!139223 b!139216) bm!15379))

(assert (= (or b!139237 b!139221) bm!15369))

(assert (= (or b!139213 b!139216) bm!15367))

(assert (= (or b!139211 b!139239) bm!15380))

(assert (= (or bm!15362 bm!15376) bm!15361))

(assert (= (or bm!15374 bm!15366) bm!15371))

(assert (= (or b!139230 b!139223) bm!15359))

(assert (= (or bm!15358 bm!15379) bm!15372))

(assert (= (or b!139211 b!139239) bm!15375))

(assert (= (and bm!15375 c!26079) b!139231))

(assert (= (and bm!15375 (not c!26079)) b!139212))

(assert (= (or bm!15364 bm!15380) bm!15360))

(assert (= (or bm!15365 b!139239 b!139212) bm!15357))

(assert (= (or bm!15378 b!139239) bm!15363))

(assert (= (and d!43499 res!66598) b!139204))

(assert (= (and b!139204 c!26077) b!139208))

(assert (= (and b!139204 (not c!26077)) b!139236))

(assert (= (and b!139208 res!66601) b!139234))

(assert (= (or b!139208 b!139234 b!139236) bm!15377))

(assert (= (or b!139234 b!139236) bm!15370))

(declare-fun m!166365 () Bool)

(assert (=> b!139205 m!166365))

(declare-fun m!166367 () Bool)

(assert (=> d!43499 m!166367))

(assert (=> d!43499 m!166267))

(declare-fun m!166369 () Bool)

(assert (=> bm!15363 m!166369))

(assert (=> bm!15359 m!166237))

(declare-fun m!166371 () Bool)

(assert (=> bm!15359 m!166371))

(assert (=> bm!15372 m!166237))

(declare-fun m!166373 () Bool)

(assert (=> bm!15372 m!166373))

(declare-fun m!166375 () Bool)

(assert (=> b!139219 m!166375))

(declare-fun m!166377 () Bool)

(assert (=> bm!15360 m!166377))

(assert (=> b!139208 m!166237))

(declare-fun m!166379 () Bool)

(assert (=> b!139208 m!166379))

(assert (=> bm!15367 m!166237))

(declare-fun m!166381 () Bool)

(assert (=> bm!15367 m!166381))

(assert (=> b!139222 m!166261))

(declare-fun m!166383 () Bool)

(assert (=> b!139222 m!166383))

(assert (=> bm!15375 m!166237))

(declare-fun m!166385 () Bool)

(assert (=> bm!15375 m!166385))

(declare-fun m!166387 () Bool)

(assert (=> bm!15371 m!166387))

(assert (=> bm!15361 m!166237))

(declare-fun m!166389 () Bool)

(assert (=> bm!15361 m!166389))

(declare-fun m!166391 () Bool)

(assert (=> bm!15357 m!166391))

(assert (=> b!139239 m!166237))

(assert (=> b!139239 m!166261))

(declare-fun m!166393 () Bool)

(assert (=> b!139239 m!166393))

(declare-fun m!166395 () Bool)

(assert (=> b!139239 m!166395))

(declare-fun m!166397 () Bool)

(assert (=> b!139239 m!166397))

(declare-fun m!166399 () Bool)

(assert (=> b!139239 m!166399))

(declare-fun m!166401 () Bool)

(assert (=> b!139239 m!166401))

(assert (=> b!139239 m!166395))

(declare-fun m!166403 () Bool)

(assert (=> b!139239 m!166403))

(declare-fun m!166405 () Bool)

(assert (=> b!139214 m!166405))

(declare-fun m!166407 () Bool)

(assert (=> b!139217 m!166407))

(declare-fun m!166409 () Bool)

(assert (=> b!139224 m!166409))

(declare-fun m!166411 () Bool)

(assert (=> b!139226 m!166411))

(assert (=> b!139238 m!166261))

(declare-fun m!166413 () Bool)

(assert (=> b!139238 m!166413))

(assert (=> bm!15370 m!166239))

(declare-fun m!166415 () Bool)

(assert (=> b!139234 m!166415))

(declare-fun m!166417 () Bool)

(assert (=> bm!15377 m!166417))

(assert (=> b!139220 m!166237))

(assert (=> b!139220 m!166373))

(assert (=> bm!15369 m!166237))

(assert (=> bm!15369 m!166261))

(declare-fun m!166419 () Bool)

(assert (=> bm!15369 m!166419))

(assert (=> b!138997 d!43499))

(declare-fun d!43501 () Bool)

(declare-fun c!26083 () Bool)

(assert (=> d!43501 (= c!26083 ((_ is ValueCellFull!1115) (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(declare-fun e!90761 () V!3537)

(assert (=> d!43501 (= (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!90761)))

(declare-fun b!139248 () Bool)

(declare-fun get!1524 (ValueCell!1115 V!3537) V!3537)

(assert (=> b!139248 (= e!90761 (get!1524 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!139249 () Bool)

(declare-fun get!1525 (ValueCell!1115 V!3537) V!3537)

(assert (=> b!139249 (= e!90761 (get!1525 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) from!355) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!43501 c!26083) b!139248))

(assert (= (and d!43501 (not c!26083)) b!139249))

(assert (=> b!139248 m!166257))

(assert (=> b!139248 m!166259))

(declare-fun m!166421 () Bool)

(assert (=> b!139248 m!166421))

(assert (=> b!139249 m!166257))

(assert (=> b!139249 m!166259))

(declare-fun m!166423 () Bool)

(assert (=> b!139249 m!166423))

(assert (=> b!138997 d!43501))

(declare-fun d!43503 () Bool)

(declare-fun res!66611 () Bool)

(declare-fun e!90764 () Bool)

(assert (=> d!43503 (=> (not res!66611) (not e!90764))))

(declare-fun simpleValid!95 (LongMapFixedSize!1138) Bool)

(assert (=> d!43503 (= res!66611 (simpleValid!95 newMap!16))))

(assert (=> d!43503 (= (valid!561 newMap!16) e!90764)))

(declare-fun b!139256 () Bool)

(declare-fun res!66612 () Bool)

(assert (=> b!139256 (=> (not res!66612) (not e!90764))))

(declare-fun arrayCountValidKeys!0 (array!4853 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!139256 (= res!66612 (= (arrayCountValidKeys!0 (_keys!4690 newMap!16) #b00000000000000000000000000000000 (size!2566 (_keys!4690 newMap!16))) (_size!618 newMap!16)))))

(declare-fun b!139257 () Bool)

(declare-fun res!66613 () Bool)

(assert (=> b!139257 (=> (not res!66613) (not e!90764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4853 (_ BitVec 32)) Bool)

(assert (=> b!139257 (= res!66613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4690 newMap!16) (mask!7267 newMap!16)))))

(declare-fun b!139258 () Bool)

(assert (=> b!139258 (= e!90764 (arrayNoDuplicates!0 (_keys!4690 newMap!16) #b00000000000000000000000000000000 Nil!1709))))

(assert (= (and d!43503 res!66611) b!139256))

(assert (= (and b!139256 res!66612) b!139257))

(assert (= (and b!139257 res!66613) b!139258))

(declare-fun m!166425 () Bool)

(assert (=> d!43503 m!166425))

(declare-fun m!166427 () Bool)

(assert (=> b!139256 m!166427))

(declare-fun m!166429 () Bool)

(assert (=> b!139257 m!166429))

(declare-fun m!166431 () Bool)

(assert (=> b!139258 m!166431))

(assert (=> b!139009 d!43503))

(declare-fun d!43505 () Bool)

(assert (=> d!43505 (= (array_inv!1431 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) (bvsge (size!2566 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!139006 d!43505))

(declare-fun d!43507 () Bool)

(assert (=> d!43507 (= (array_inv!1432 (_values!2914 (v!3265 (underlying!473 thiss!992)))) (bvsge (size!2567 (_values!2914 (v!3265 (underlying!473 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!139006 d!43507))

(declare-fun d!43509 () Bool)

(assert (=> d!43509 (= (map!1422 newMap!16) (getCurrentListMap!528 (_keys!4690 newMap!16) (_values!2914 newMap!16) (mask!7267 newMap!16) (extraKeys!2686 newMap!16) (zeroValue!2781 newMap!16) (minValue!2781 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2931 newMap!16)))))

(declare-fun bs!5835 () Bool)

(assert (= bs!5835 d!43509))

(assert (=> bs!5835 m!166391))

(assert (=> b!139007 d!43509))

(declare-fun call!15404 () ListLongMap!1679)

(declare-fun call!15403 () ListLongMap!1679)

(declare-fun call!15402 () ListLongMap!1679)

(declare-fun call!15400 () ListLongMap!1679)

(declare-fun c!26101 () Bool)

(declare-fun c!26100 () Bool)

(declare-fun bm!15395 () Bool)

(assert (=> bm!15395 (= call!15404 (+!172 (ite c!26101 call!15400 (ite c!26100 call!15403 call!15402)) (ite (or c!26101 c!26100) (tuple2!2611 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2781 (v!3265 (underlying!473 thiss!992)))) (tuple2!2611 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2781 (v!3265 (underlying!473 thiss!992)))))))))

(declare-fun bm!15396 () Bool)

(declare-fun call!15401 () ListLongMap!1679)

(assert (=> bm!15396 (= call!15401 call!15404)))

(declare-fun lt!72942 () ListLongMap!1679)

(declare-fun b!139301 () Bool)

(declare-fun e!90797 () Bool)

(declare-fun apply!119 (ListLongMap!1679 (_ BitVec 64)) V!3537)

(assert (=> b!139301 (= e!90797 (= (apply!119 lt!72942 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1522 (select (arr!2295 (_values!2914 (v!3265 (underlying!473 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!436 (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!139301 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2567 (_values!2914 (v!3265 (underlying!473 thiss!992))))))))

(assert (=> b!139301 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2566 (_keys!4690 (v!3265 (underlying!473 thiss!992))))))))

(declare-fun b!139302 () Bool)

(declare-fun e!90798 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!139302 (= e!90798 (validKeyInArray!0 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!139303 () Bool)

(declare-fun e!90800 () Bool)

(declare-fun e!90796 () Bool)

(assert (=> b!139303 (= e!90800 e!90796)))

(declare-fun c!26099 () Bool)

(assert (=> b!139303 (= c!26099 (not (= (bvand (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!43511 () Bool)

(assert (=> d!43511 e!90800))

(declare-fun res!66638 () Bool)

(assert (=> d!43511 (=> (not res!66638) (not e!90800))))

(assert (=> d!43511 (= res!66638 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2566 (_keys!4690 (v!3265 (underlying!473 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2566 (_keys!4690 (v!3265 (underlying!473 thiss!992))))))))))

(declare-fun lt!72933 () ListLongMap!1679)

(assert (=> d!43511 (= lt!72942 lt!72933)))

(declare-fun lt!72922 () Unit!4373)

(declare-fun e!90803 () Unit!4373)

(assert (=> d!43511 (= lt!72922 e!90803)))

(declare-fun c!26096 () Bool)

(declare-fun e!90793 () Bool)

(assert (=> d!43511 (= c!26096 e!90793)))

(declare-fun res!66635 () Bool)

(assert (=> d!43511 (=> (not res!66635) (not e!90793))))

(assert (=> d!43511 (= res!66635 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2566 (_keys!4690 (v!3265 (underlying!473 thiss!992))))))))

(declare-fun e!90799 () ListLongMap!1679)

(assert (=> d!43511 (= lt!72933 e!90799)))

(assert (=> d!43511 (= c!26101 (and (not (= (bvand (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!43511 (validMask!0 (mask!7267 (v!3265 (underlying!473 thiss!992))))))

(assert (=> d!43511 (= (getCurrentListMap!528 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (_values!2914 (v!3265 (underlying!473 thiss!992))) (mask!7267 (v!3265 (underlying!473 thiss!992))) (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) (zeroValue!2781 (v!3265 (underlying!473 thiss!992))) (minValue!2781 (v!3265 (underlying!473 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992)))) lt!72942)))

(declare-fun b!139304 () Bool)

(assert (=> b!139304 (= e!90799 (+!172 call!15404 (tuple2!2611 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2781 (v!3265 (underlying!473 thiss!992))))))))

(declare-fun b!139305 () Bool)

(declare-fun e!90795 () Bool)

(assert (=> b!139305 (= e!90795 (= (apply!119 lt!72942 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2781 (v!3265 (underlying!473 thiss!992)))))))

(declare-fun b!139306 () Bool)

(assert (=> b!139306 (= e!90793 (validKeyInArray!0 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!15397 () Bool)

(declare-fun call!15398 () Bool)

(assert (=> bm!15397 (= call!15398 (contains!900 lt!72942 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15398 () Bool)

(declare-fun call!15399 () Bool)

(assert (=> bm!15398 (= call!15399 (contains!900 lt!72942 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15399 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!139 (array!4853 array!4855 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 32) Int) ListLongMap!1679)

(assert (=> bm!15399 (= call!15400 (getCurrentListMapNoExtraKeys!139 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (_values!2914 (v!3265 (underlying!473 thiss!992))) (mask!7267 (v!3265 (underlying!473 thiss!992))) (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) (zeroValue!2781 (v!3265 (underlying!473 thiss!992))) (minValue!2781 (v!3265 (underlying!473 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992)))))))

(declare-fun b!139307 () Bool)

(assert (=> b!139307 (= e!90796 e!90795)))

(declare-fun res!66640 () Bool)

(assert (=> b!139307 (= res!66640 call!15399)))

(assert (=> b!139307 (=> (not res!66640) (not e!90795))))

(declare-fun b!139308 () Bool)

(declare-fun e!90801 () Bool)

(assert (=> b!139308 (= e!90801 e!90797)))

(declare-fun res!66639 () Bool)

(assert (=> b!139308 (=> (not res!66639) (not e!90797))))

(assert (=> b!139308 (= res!66639 (contains!900 lt!72942 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!139308 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2566 (_keys!4690 (v!3265 (underlying!473 thiss!992))))))))

(declare-fun b!139309 () Bool)

(declare-fun e!90794 () Bool)

(assert (=> b!139309 (= e!90794 (not call!15398))))

(declare-fun b!139310 () Bool)

(declare-fun e!90791 () ListLongMap!1679)

(assert (=> b!139310 (= e!90791 call!15401)))

(declare-fun b!139311 () Bool)

(declare-fun c!26097 () Bool)

(assert (=> b!139311 (= c!26097 (and (not (= (bvand (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!90792 () ListLongMap!1679)

(assert (=> b!139311 (= e!90791 e!90792)))

(declare-fun b!139312 () Bool)

(declare-fun Unit!4382 () Unit!4373)

(assert (=> b!139312 (= e!90803 Unit!4382)))

(declare-fun b!139313 () Bool)

(declare-fun res!66633 () Bool)

(assert (=> b!139313 (=> (not res!66633) (not e!90800))))

(assert (=> b!139313 (= res!66633 e!90794)))

(declare-fun c!26098 () Bool)

(assert (=> b!139313 (= c!26098 (not (= (bvand (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!139314 () Bool)

(assert (=> b!139314 (= e!90792 call!15402)))

(declare-fun b!139315 () Bool)

(declare-fun lt!72934 () Unit!4373)

(assert (=> b!139315 (= e!90803 lt!72934)))

(declare-fun lt!72939 () ListLongMap!1679)

(assert (=> b!139315 (= lt!72939 (getCurrentListMapNoExtraKeys!139 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (_values!2914 (v!3265 (underlying!473 thiss!992))) (mask!7267 (v!3265 (underlying!473 thiss!992))) (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) (zeroValue!2781 (v!3265 (underlying!473 thiss!992))) (minValue!2781 (v!3265 (underlying!473 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992)))))))

(declare-fun lt!72928 () (_ BitVec 64))

(assert (=> b!139315 (= lt!72928 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72927 () (_ BitVec 64))

(assert (=> b!139315 (= lt!72927 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72925 () Unit!4373)

(declare-fun addStillContains!95 (ListLongMap!1679 (_ BitVec 64) V!3537 (_ BitVec 64)) Unit!4373)

(assert (=> b!139315 (= lt!72925 (addStillContains!95 lt!72939 lt!72928 (zeroValue!2781 (v!3265 (underlying!473 thiss!992))) lt!72927))))

(assert (=> b!139315 (contains!900 (+!172 lt!72939 (tuple2!2611 lt!72928 (zeroValue!2781 (v!3265 (underlying!473 thiss!992))))) lt!72927)))

(declare-fun lt!72940 () Unit!4373)

(assert (=> b!139315 (= lt!72940 lt!72925)))

(declare-fun lt!72930 () ListLongMap!1679)

(assert (=> b!139315 (= lt!72930 (getCurrentListMapNoExtraKeys!139 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (_values!2914 (v!3265 (underlying!473 thiss!992))) (mask!7267 (v!3265 (underlying!473 thiss!992))) (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) (zeroValue!2781 (v!3265 (underlying!473 thiss!992))) (minValue!2781 (v!3265 (underlying!473 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992)))))))

(declare-fun lt!72926 () (_ BitVec 64))

(assert (=> b!139315 (= lt!72926 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72924 () (_ BitVec 64))

(assert (=> b!139315 (= lt!72924 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72923 () Unit!4373)

(declare-fun addApplyDifferent!95 (ListLongMap!1679 (_ BitVec 64) V!3537 (_ BitVec 64)) Unit!4373)

(assert (=> b!139315 (= lt!72923 (addApplyDifferent!95 lt!72930 lt!72926 (minValue!2781 (v!3265 (underlying!473 thiss!992))) lt!72924))))

(assert (=> b!139315 (= (apply!119 (+!172 lt!72930 (tuple2!2611 lt!72926 (minValue!2781 (v!3265 (underlying!473 thiss!992))))) lt!72924) (apply!119 lt!72930 lt!72924))))

(declare-fun lt!72929 () Unit!4373)

(assert (=> b!139315 (= lt!72929 lt!72923)))

(declare-fun lt!72935 () ListLongMap!1679)

(assert (=> b!139315 (= lt!72935 (getCurrentListMapNoExtraKeys!139 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (_values!2914 (v!3265 (underlying!473 thiss!992))) (mask!7267 (v!3265 (underlying!473 thiss!992))) (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) (zeroValue!2781 (v!3265 (underlying!473 thiss!992))) (minValue!2781 (v!3265 (underlying!473 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992)))))))

(declare-fun lt!72937 () (_ BitVec 64))

(assert (=> b!139315 (= lt!72937 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72943 () (_ BitVec 64))

(assert (=> b!139315 (= lt!72943 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!72936 () Unit!4373)

(assert (=> b!139315 (= lt!72936 (addApplyDifferent!95 lt!72935 lt!72937 (zeroValue!2781 (v!3265 (underlying!473 thiss!992))) lt!72943))))

(assert (=> b!139315 (= (apply!119 (+!172 lt!72935 (tuple2!2611 lt!72937 (zeroValue!2781 (v!3265 (underlying!473 thiss!992))))) lt!72943) (apply!119 lt!72935 lt!72943))))

(declare-fun lt!72938 () Unit!4373)

(assert (=> b!139315 (= lt!72938 lt!72936)))

(declare-fun lt!72941 () ListLongMap!1679)

(assert (=> b!139315 (= lt!72941 (getCurrentListMapNoExtraKeys!139 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (_values!2914 (v!3265 (underlying!473 thiss!992))) (mask!7267 (v!3265 (underlying!473 thiss!992))) (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) (zeroValue!2781 (v!3265 (underlying!473 thiss!992))) (minValue!2781 (v!3265 (underlying!473 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992)))))))

(declare-fun lt!72932 () (_ BitVec 64))

(assert (=> b!139315 (= lt!72932 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72931 () (_ BitVec 64))

(assert (=> b!139315 (= lt!72931 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!139315 (= lt!72934 (addApplyDifferent!95 lt!72941 lt!72932 (minValue!2781 (v!3265 (underlying!473 thiss!992))) lt!72931))))

(assert (=> b!139315 (= (apply!119 (+!172 lt!72941 (tuple2!2611 lt!72932 (minValue!2781 (v!3265 (underlying!473 thiss!992))))) lt!72931) (apply!119 lt!72941 lt!72931))))

(declare-fun b!139316 () Bool)

(declare-fun e!90802 () Bool)

(assert (=> b!139316 (= e!90794 e!90802)))

(declare-fun res!66634 () Bool)

(assert (=> b!139316 (= res!66634 call!15398)))

(assert (=> b!139316 (=> (not res!66634) (not e!90802))))

(declare-fun b!139317 () Bool)

(declare-fun res!66637 () Bool)

(assert (=> b!139317 (=> (not res!66637) (not e!90800))))

(assert (=> b!139317 (= res!66637 e!90801)))

(declare-fun res!66636 () Bool)

(assert (=> b!139317 (=> res!66636 e!90801)))

(assert (=> b!139317 (= res!66636 (not e!90798))))

(declare-fun res!66632 () Bool)

(assert (=> b!139317 (=> (not res!66632) (not e!90798))))

(assert (=> b!139317 (= res!66632 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2566 (_keys!4690 (v!3265 (underlying!473 thiss!992))))))))

(declare-fun b!139318 () Bool)

(assert (=> b!139318 (= e!90802 (= (apply!119 lt!72942 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2781 (v!3265 (underlying!473 thiss!992)))))))

(declare-fun b!139319 () Bool)

(assert (=> b!139319 (= e!90799 e!90791)))

(assert (=> b!139319 (= c!26100 (and (not (= (bvand (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!139320 () Bool)

(assert (=> b!139320 (= e!90796 (not call!15399))))

(declare-fun bm!15400 () Bool)

(assert (=> bm!15400 (= call!15402 call!15403)))

(declare-fun bm!15401 () Bool)

(assert (=> bm!15401 (= call!15403 call!15400)))

(declare-fun b!139321 () Bool)

(assert (=> b!139321 (= e!90792 call!15401)))

(assert (= (and d!43511 c!26101) b!139304))

(assert (= (and d!43511 (not c!26101)) b!139319))

(assert (= (and b!139319 c!26100) b!139310))

(assert (= (and b!139319 (not c!26100)) b!139311))

(assert (= (and b!139311 c!26097) b!139321))

(assert (= (and b!139311 (not c!26097)) b!139314))

(assert (= (or b!139321 b!139314) bm!15400))

(assert (= (or b!139310 bm!15400) bm!15401))

(assert (= (or b!139310 b!139321) bm!15396))

(assert (= (or b!139304 bm!15401) bm!15399))

(assert (= (or b!139304 bm!15396) bm!15395))

(assert (= (and d!43511 res!66635) b!139306))

(assert (= (and d!43511 c!26096) b!139315))

(assert (= (and d!43511 (not c!26096)) b!139312))

(assert (= (and d!43511 res!66638) b!139317))

(assert (= (and b!139317 res!66632) b!139302))

(assert (= (and b!139317 (not res!66636)) b!139308))

(assert (= (and b!139308 res!66639) b!139301))

(assert (= (and b!139317 res!66637) b!139313))

(assert (= (and b!139313 c!26098) b!139316))

(assert (= (and b!139313 (not c!26098)) b!139309))

(assert (= (and b!139316 res!66634) b!139318))

(assert (= (or b!139316 b!139309) bm!15397))

(assert (= (and b!139313 res!66633) b!139303))

(assert (= (and b!139303 c!26099) b!139307))

(assert (= (and b!139303 (not c!26099)) b!139320))

(assert (= (and b!139307 res!66640) b!139305))

(assert (= (or b!139307 b!139320) bm!15398))

(declare-fun b_lambda!6249 () Bool)

(assert (=> (not b_lambda!6249) (not b!139301)))

(assert (=> b!139301 t!6260))

(declare-fun b_and!8689 () Bool)

(assert (= b_and!8669 (and (=> t!6260 result!4129) b_and!8689)))

(assert (=> b!139301 t!6262))

(declare-fun b_and!8691 () Bool)

(assert (= b_and!8671 (and (=> t!6262 result!4133) b_and!8691)))

(declare-fun m!166433 () Bool)

(assert (=> b!139308 m!166433))

(assert (=> b!139308 m!166433))

(declare-fun m!166435 () Bool)

(assert (=> b!139308 m!166435))

(declare-fun m!166437 () Bool)

(assert (=> bm!15398 m!166437))

(declare-fun m!166439 () Bool)

(assert (=> b!139304 m!166439))

(assert (=> b!139301 m!166433))

(declare-fun m!166441 () Bool)

(assert (=> b!139301 m!166441))

(declare-fun m!166443 () Bool)

(assert (=> b!139301 m!166443))

(assert (=> b!139301 m!166433))

(assert (=> b!139301 m!166259))

(assert (=> b!139301 m!166443))

(assert (=> b!139301 m!166259))

(declare-fun m!166445 () Bool)

(assert (=> b!139301 m!166445))

(declare-fun m!166447 () Bool)

(assert (=> b!139315 m!166447))

(declare-fun m!166449 () Bool)

(assert (=> b!139315 m!166449))

(declare-fun m!166451 () Bool)

(assert (=> b!139315 m!166451))

(declare-fun m!166453 () Bool)

(assert (=> b!139315 m!166453))

(declare-fun m!166455 () Bool)

(assert (=> b!139315 m!166455))

(assert (=> b!139315 m!166433))

(declare-fun m!166457 () Bool)

(assert (=> b!139315 m!166457))

(assert (=> b!139315 m!166447))

(declare-fun m!166459 () Bool)

(assert (=> b!139315 m!166459))

(declare-fun m!166461 () Bool)

(assert (=> b!139315 m!166461))

(declare-fun m!166463 () Bool)

(assert (=> b!139315 m!166463))

(declare-fun m!166465 () Bool)

(assert (=> b!139315 m!166465))

(declare-fun m!166467 () Bool)

(assert (=> b!139315 m!166467))

(assert (=> b!139315 m!166453))

(declare-fun m!166469 () Bool)

(assert (=> b!139315 m!166469))

(declare-fun m!166471 () Bool)

(assert (=> b!139315 m!166471))

(assert (=> b!139315 m!166469))

(declare-fun m!166473 () Bool)

(assert (=> b!139315 m!166473))

(declare-fun m!166475 () Bool)

(assert (=> b!139315 m!166475))

(assert (=> b!139315 m!166451))

(declare-fun m!166477 () Bool)

(assert (=> b!139315 m!166477))

(declare-fun m!166479 () Bool)

(assert (=> d!43511 m!166479))

(assert (=> bm!15399 m!166475))

(assert (=> b!139302 m!166433))

(assert (=> b!139302 m!166433))

(declare-fun m!166481 () Bool)

(assert (=> b!139302 m!166481))

(declare-fun m!166483 () Bool)

(assert (=> b!139318 m!166483))

(declare-fun m!166485 () Bool)

(assert (=> bm!15395 m!166485))

(declare-fun m!166487 () Bool)

(assert (=> b!139305 m!166487))

(assert (=> b!139306 m!166433))

(assert (=> b!139306 m!166433))

(assert (=> b!139306 m!166481))

(declare-fun m!166489 () Bool)

(assert (=> bm!15397 m!166489))

(assert (=> b!139007 d!43511))

(declare-fun d!43513 () Bool)

(assert (=> d!43513 (= (valid!560 thiss!992) (valid!561 (v!3265 (underlying!473 thiss!992))))))

(declare-fun bs!5836 () Bool)

(assert (= bs!5836 d!43513))

(declare-fun m!166491 () Bool)

(assert (=> bs!5836 m!166491))

(assert (=> start!14674 d!43513))

(declare-fun d!43515 () Bool)

(assert (=> d!43515 (= (array_inv!1431 (_keys!4690 newMap!16)) (bvsge (size!2566 (_keys!4690 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!139003 d!43515))

(declare-fun d!43517 () Bool)

(assert (=> d!43517 (= (array_inv!1432 (_values!2914 newMap!16)) (bvsge (size!2567 (_values!2914 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!139003 d!43517))

(declare-fun b!139332 () Bool)

(declare-fun e!90813 () Bool)

(declare-fun call!15407 () Bool)

(assert (=> b!139332 (= e!90813 call!15407)))

(declare-fun b!139333 () Bool)

(declare-fun e!90812 () Bool)

(declare-fun contains!902 (List!1712 (_ BitVec 64)) Bool)

(assert (=> b!139333 (= e!90812 (contains!902 Nil!1709 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(declare-fun b!139334 () Bool)

(declare-fun e!90815 () Bool)

(assert (=> b!139334 (= e!90815 e!90813)))

(declare-fun c!26104 () Bool)

(assert (=> b!139334 (= c!26104 (validKeyInArray!0 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(declare-fun b!139335 () Bool)

(assert (=> b!139335 (= e!90813 call!15407)))

(declare-fun b!139336 () Bool)

(declare-fun e!90814 () Bool)

(assert (=> b!139336 (= e!90814 e!90815)))

(declare-fun res!66647 () Bool)

(assert (=> b!139336 (=> (not res!66647) (not e!90815))))

(assert (=> b!139336 (= res!66647 (not e!90812))))

(declare-fun res!66648 () Bool)

(assert (=> b!139336 (=> (not res!66648) (not e!90812))))

(assert (=> b!139336 (= res!66648 (validKeyInArray!0 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(declare-fun d!43519 () Bool)

(declare-fun res!66649 () Bool)

(assert (=> d!43519 (=> res!66649 e!90814)))

(assert (=> d!43519 (= res!66649 (bvsge from!355 (size!2566 (_keys!4690 (v!3265 (underlying!473 thiss!992))))))))

(assert (=> d!43519 (= (arrayNoDuplicates!0 (_keys!4690 (v!3265 (underlying!473 thiss!992))) from!355 Nil!1709) e!90814)))

(declare-fun bm!15404 () Bool)

(assert (=> bm!15404 (= call!15407 (arrayNoDuplicates!0 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!26104 (Cons!1708 (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) Nil!1709) Nil!1709)))))

(assert (= (and d!43519 (not res!66649)) b!139336))

(assert (= (and b!139336 res!66648) b!139333))

(assert (= (and b!139336 res!66647) b!139334))

(assert (= (and b!139334 c!26104) b!139332))

(assert (= (and b!139334 (not c!26104)) b!139335))

(assert (= (or b!139332 b!139335) bm!15404))

(assert (=> b!139333 m!166237))

(assert (=> b!139333 m!166237))

(declare-fun m!166493 () Bool)

(assert (=> b!139333 m!166493))

(assert (=> b!139334 m!166237))

(assert (=> b!139334 m!166237))

(declare-fun m!166495 () Bool)

(assert (=> b!139334 m!166495))

(assert (=> b!139336 m!166237))

(assert (=> b!139336 m!166237))

(assert (=> b!139336 m!166495))

(assert (=> bm!15404 m!166237))

(declare-fun m!166497 () Bool)

(assert (=> bm!15404 m!166497))

(assert (=> b!139008 d!43519))

(declare-fun d!43521 () Bool)

(assert (=> d!43521 (arrayNoDuplicates!0 (_keys!4690 (v!3265 (underlying!473 thiss!992))) from!355 Nil!1709)))

(declare-fun lt!72946 () Unit!4373)

(declare-fun choose!39 (array!4853 (_ BitVec 32) (_ BitVec 32)) Unit!4373)

(assert (=> d!43521 (= lt!72946 (choose!39 (_keys!4690 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!43521 (bvslt (size!2566 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!43521 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4690 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000000 from!355) lt!72946)))

(declare-fun bs!5837 () Bool)

(assert (= bs!5837 d!43521))

(assert (=> bs!5837 m!166245))

(declare-fun m!166499 () Bool)

(assert (=> bs!5837 m!166499))

(assert (=> b!139008 d!43521))

(declare-fun d!43523 () Bool)

(declare-fun res!66654 () Bool)

(declare-fun e!90820 () Bool)

(assert (=> d!43523 (=> res!66654 e!90820)))

(assert (=> d!43523 (= res!66654 (= (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355)))))

(assert (=> d!43523 (= (arrayContainsKey!0 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!90820)))

(declare-fun b!139341 () Bool)

(declare-fun e!90821 () Bool)

(assert (=> b!139341 (= e!90820 e!90821)))

(declare-fun res!66655 () Bool)

(assert (=> b!139341 (=> (not res!66655) (not e!90821))))

(assert (=> b!139341 (= res!66655 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2566 (_keys!4690 (v!3265 (underlying!473 thiss!992))))))))

(declare-fun b!139342 () Bool)

(assert (=> b!139342 (= e!90821 (arrayContainsKey!0 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!43523 (not res!66654)) b!139341))

(assert (= (and b!139341 res!66655) b!139342))

(assert (=> d!43523 m!166433))

(assert (=> b!139342 m!166237))

(declare-fun m!166501 () Bool)

(assert (=> b!139342 m!166501))

(assert (=> b!139008 d!43523))

(declare-fun d!43525 () Bool)

(declare-fun e!90824 () Bool)

(assert (=> d!43525 e!90824))

(declare-fun c!26107 () Bool)

(assert (=> d!43525 (= c!26107 (and (not (= (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!72949 () Unit!4373)

(declare-fun choose!861 (array!4853 array!4855 (_ BitVec 32) (_ BitVec 32) V!3537 V!3537 (_ BitVec 64) (_ BitVec 32) Int) Unit!4373)

(assert (=> d!43525 (= lt!72949 (choose!861 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (_values!2914 (v!3265 (underlying!473 thiss!992))) (mask!7267 (v!3265 (underlying!473 thiss!992))) (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) (zeroValue!2781 (v!3265 (underlying!473 thiss!992))) (minValue!2781 (v!3265 (underlying!473 thiss!992))) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992)))))))

(assert (=> d!43525 (validMask!0 (mask!7267 (v!3265 (underlying!473 thiss!992))))))

(assert (=> d!43525 (= (lemmaListMapContainsThenArrayContainsFrom!134 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (_values!2914 (v!3265 (underlying!473 thiss!992))) (mask!7267 (v!3265 (underlying!473 thiss!992))) (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) (zeroValue!2781 (v!3265 (underlying!473 thiss!992))) (minValue!2781 (v!3265 (underlying!473 thiss!992))) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992)))) lt!72949)))

(declare-fun b!139347 () Bool)

(assert (=> b!139347 (= e!90824 (arrayContainsKey!0 (_keys!4690 (v!3265 (underlying!473 thiss!992))) (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!139348 () Bool)

(assert (=> b!139348 (= e!90824 (ite (= (select (arr!2294 (_keys!4690 (v!3265 (underlying!473 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2686 (v!3265 (underlying!473 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!43525 c!26107) b!139347))

(assert (= (and d!43525 (not c!26107)) b!139348))

(assert (=> d!43525 m!166237))

(declare-fun m!166503 () Bool)

(assert (=> d!43525 m!166503))

(assert (=> d!43525 m!166479))

(assert (=> b!139347 m!166237))

(assert (=> b!139347 m!166249))

(assert (=> b!139008 d!43525))

(declare-fun mapIsEmpty!4803 () Bool)

(declare-fun mapRes!4803 () Bool)

(assert (=> mapIsEmpty!4803 mapRes!4803))

(declare-fun b!139356 () Bool)

(declare-fun e!90830 () Bool)

(assert (=> b!139356 (= e!90830 tp_is_empty!2917)))

(declare-fun b!139355 () Bool)

(declare-fun e!90829 () Bool)

(assert (=> b!139355 (= e!90829 tp_is_empty!2917)))

(declare-fun condMapEmpty!4803 () Bool)

(declare-fun mapDefault!4803 () ValueCell!1115)

(assert (=> mapNonEmpty!4787 (= condMapEmpty!4803 (= mapRest!4788 ((as const (Array (_ BitVec 32) ValueCell!1115)) mapDefault!4803)))))

(assert (=> mapNonEmpty!4787 (= tp!11472 (and e!90830 mapRes!4803))))

(declare-fun mapNonEmpty!4803 () Bool)

(declare-fun tp!11499 () Bool)

(assert (=> mapNonEmpty!4803 (= mapRes!4803 (and tp!11499 e!90829))))

(declare-fun mapKey!4803 () (_ BitVec 32))

(declare-fun mapValue!4803 () ValueCell!1115)

(declare-fun mapRest!4803 () (Array (_ BitVec 32) ValueCell!1115))

(assert (=> mapNonEmpty!4803 (= mapRest!4788 (store mapRest!4803 mapKey!4803 mapValue!4803))))

(assert (= (and mapNonEmpty!4787 condMapEmpty!4803) mapIsEmpty!4803))

(assert (= (and mapNonEmpty!4787 (not condMapEmpty!4803)) mapNonEmpty!4803))

(assert (= (and mapNonEmpty!4803 ((_ is ValueCellFull!1115) mapValue!4803)) b!139355))

(assert (= (and mapNonEmpty!4787 ((_ is ValueCellFull!1115) mapDefault!4803)) b!139356))

(declare-fun m!166505 () Bool)

(assert (=> mapNonEmpty!4803 m!166505))

(declare-fun mapIsEmpty!4804 () Bool)

(declare-fun mapRes!4804 () Bool)

(assert (=> mapIsEmpty!4804 mapRes!4804))

(declare-fun b!139358 () Bool)

(declare-fun e!90832 () Bool)

(assert (=> b!139358 (= e!90832 tp_is_empty!2917)))

(declare-fun b!139357 () Bool)

(declare-fun e!90831 () Bool)

(assert (=> b!139357 (= e!90831 tp_is_empty!2917)))

(declare-fun condMapEmpty!4804 () Bool)

(declare-fun mapDefault!4804 () ValueCell!1115)

(assert (=> mapNonEmpty!4788 (= condMapEmpty!4804 (= mapRest!4787 ((as const (Array (_ BitVec 32) ValueCell!1115)) mapDefault!4804)))))

(assert (=> mapNonEmpty!4788 (= tp!11470 (and e!90832 mapRes!4804))))

(declare-fun mapNonEmpty!4804 () Bool)

(declare-fun tp!11500 () Bool)

(assert (=> mapNonEmpty!4804 (= mapRes!4804 (and tp!11500 e!90831))))

(declare-fun mapValue!4804 () ValueCell!1115)

(declare-fun mapKey!4804 () (_ BitVec 32))

(declare-fun mapRest!4804 () (Array (_ BitVec 32) ValueCell!1115))

(assert (=> mapNonEmpty!4804 (= mapRest!4787 (store mapRest!4804 mapKey!4804 mapValue!4804))))

(assert (= (and mapNonEmpty!4788 condMapEmpty!4804) mapIsEmpty!4804))

(assert (= (and mapNonEmpty!4788 (not condMapEmpty!4804)) mapNonEmpty!4804))

(assert (= (and mapNonEmpty!4804 ((_ is ValueCellFull!1115) mapValue!4804)) b!139357))

(assert (= (and mapNonEmpty!4788 ((_ is ValueCellFull!1115) mapDefault!4804)) b!139358))

(declare-fun m!166507 () Bool)

(assert (=> mapNonEmpty!4804 m!166507))

(declare-fun b_lambda!6251 () Bool)

(assert (= b_lambda!6249 (or (and b!139006 b_free!3001) (and b!139003 b_free!3003 (= (defaultEntry!2931 newMap!16) (defaultEntry!2931 (v!3265 (underlying!473 thiss!992))))) b_lambda!6251)))

(check-sat (not b!139342) (not bm!15363) (not bm!15404) (not b!139347) (not b!139301) (not bm!15397) (not bm!15361) tp_is_empty!2917 b_and!8691 (not b!139220) (not b_lambda!6251) (not b!139222) (not b!139333) (not bm!15367) (not b_next!3003) (not b!139248) (not b!139302) (not b!139308) (not b_lambda!6247) (not b!139334) (not b!139123) (not bm!15369) (not b!139304) (not bm!15377) (not bm!15395) (not d!43509) (not b!139239) (not b!139336) (not b!139249) (not d!43499) (not b_next!3001) (not b!139257) (not d!43503) (not mapNonEmpty!4803) (not d!43525) (not b!139256) (not d!43521) (not b!139121) b_and!8689 (not bm!15399) (not b!139315) (not b!139306) (not bm!15359) (not b!139208) (not bm!15398) (not bm!15370) (not b!139238) (not b!139305) (not b!139234) (not bm!15371) (not bm!15360) (not d!43511) (not b!139258) (not bm!15357) (not bm!15375) (not bm!15372) (not d!43497) (not mapNonEmpty!4804) (not d!43513) (not b!139318))
(check-sat b_and!8689 b_and!8691 (not b_next!3001) (not b_next!3003))
