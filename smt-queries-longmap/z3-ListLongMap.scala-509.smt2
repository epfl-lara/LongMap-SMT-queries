; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12148 () Bool)

(assert start!12148)

(declare-fun b!102706 () Bool)

(declare-fun b_free!2501 () Bool)

(declare-fun b_next!2501 () Bool)

(assert (=> b!102706 (= b_free!2501 (not b_next!2501))))

(declare-fun tp!9815 () Bool)

(declare-fun b_and!6351 () Bool)

(assert (=> b!102706 (= tp!9815 b_and!6351)))

(declare-fun b!102698 () Bool)

(declare-fun b_free!2503 () Bool)

(declare-fun b_next!2503 () Bool)

(assert (=> b!102698 (= b_free!2503 (not b_next!2503))))

(declare-fun tp!9813 () Bool)

(declare-fun b_and!6353 () Bool)

(assert (=> b!102698 (= tp!9813 b_and!6353)))

(declare-fun res!51353 () Bool)

(declare-fun e!66910 () Bool)

(assert (=> start!12148 (=> (not res!51353) (not e!66910))))

(declare-datatypes ((V!3203 0))(
  ( (V!3204 (val!1378 Int)) )
))
(declare-datatypes ((array!4321 0))(
  ( (array!4322 (arr!2051 (Array (_ BitVec 32) (_ BitVec 64))) (size!2305 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!990 0))(
  ( (ValueCellFull!990 (v!2867 V!3203)) (EmptyCell!990) )
))
(declare-datatypes ((array!4323 0))(
  ( (array!4324 (arr!2052 (Array (_ BitVec 32) ValueCell!990)) (size!2306 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!888 0))(
  ( (LongMapFixedSize!889 (defaultEntry!2555 Int) (mask!6688 (_ BitVec 32)) (extraKeys!2364 (_ BitVec 32)) (zeroValue!2432 V!3203) (minValue!2432 V!3203) (_size!493 (_ BitVec 32)) (_keys!4257 array!4321) (_values!2538 array!4323) (_vacant!493 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!688 0))(
  ( (Cell!689 (v!2868 LongMapFixedSize!888)) )
))
(declare-datatypes ((LongMap!688 0))(
  ( (LongMap!689 (underlying!355 Cell!688)) )
))
(declare-fun thiss!992 () LongMap!688)

(declare-fun valid!413 (LongMap!688) Bool)

(assert (=> start!12148 (= res!51353 (valid!413 thiss!992))))

(assert (=> start!12148 e!66910))

(declare-fun e!66904 () Bool)

(assert (=> start!12148 e!66904))

(assert (=> start!12148 true))

(declare-fun e!66896 () Bool)

(assert (=> start!12148 e!66896))

(declare-fun b!102694 () Bool)

(declare-fun e!66903 () Bool)

(assert (=> b!102694 (= e!66904 e!66903)))

(declare-fun mapNonEmpty!3881 () Bool)

(declare-fun mapRes!3882 () Bool)

(declare-fun tp!9816 () Bool)

(declare-fun e!66902 () Bool)

(assert (=> mapNonEmpty!3881 (= mapRes!3882 (and tp!9816 e!66902))))

(declare-fun mapValue!3882 () ValueCell!990)

(declare-fun newMap!16 () LongMapFixedSize!888)

(declare-fun mapKey!3881 () (_ BitVec 32))

(declare-fun mapRest!3881 () (Array (_ BitVec 32) ValueCell!990))

(assert (=> mapNonEmpty!3881 (= (arr!2052 (_values!2538 newMap!16)) (store mapRest!3881 mapKey!3881 mapValue!3882))))

(declare-fun b!102695 () Bool)

(declare-fun tp_is_empty!2667 () Bool)

(assert (=> b!102695 (= e!66902 tp_is_empty!2667)))

(declare-fun b!102696 () Bool)

(declare-fun res!51354 () Bool)

(assert (=> b!102696 (=> (not res!51354) (not e!66910))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!102696 (= res!51354 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992)))))))))

(declare-fun b!102697 () Bool)

(declare-fun e!66911 () Bool)

(assert (=> b!102697 (= e!66911 tp_is_empty!2667)))

(declare-fun e!66900 () Bool)

(declare-fun array_inv!1289 (array!4321) Bool)

(declare-fun array_inv!1290 (array!4323) Bool)

(assert (=> b!102698 (= e!66896 (and tp!9813 tp_is_empty!2667 (array_inv!1289 (_keys!4257 newMap!16)) (array_inv!1290 (_values!2538 newMap!16)) e!66900))))

(declare-fun b!102699 () Bool)

(declare-fun res!51357 () Bool)

(assert (=> b!102699 (=> (not res!51357) (not e!66910))))

(assert (=> b!102699 (= res!51357 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6688 newMap!16)) (_size!493 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun mapIsEmpty!3881 () Bool)

(declare-fun mapRes!3881 () Bool)

(assert (=> mapIsEmpty!3881 mapRes!3881))

(declare-fun b!102700 () Bool)

(declare-fun e!66895 () Bool)

(declare-fun e!66899 () Bool)

(assert (=> b!102700 (= e!66895 e!66899)))

(declare-fun res!51356 () Bool)

(assert (=> b!102700 (=> (not res!51356) (not e!66899))))

(declare-datatypes ((tuple2!2390 0))(
  ( (tuple2!2391 (_1!1206 Bool) (_2!1206 LongMapFixedSize!888)) )
))
(declare-fun lt!52210 () tuple2!2390)

(assert (=> b!102700 (= res!51356 (and (_1!1206 lt!52210) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3138 0))(
  ( (Unit!3139) )
))
(declare-fun lt!52209 () Unit!3138)

(declare-fun e!66897 () Unit!3138)

(assert (=> b!102700 (= lt!52209 e!66897)))

(declare-datatypes ((tuple2!2392 0))(
  ( (tuple2!2393 (_1!1207 (_ BitVec 64)) (_2!1207 V!3203)) )
))
(declare-datatypes ((List!1606 0))(
  ( (Nil!1603) (Cons!1602 (h!2198 tuple2!2392) (t!5656 List!1606)) )
))
(declare-datatypes ((ListLongMap!1563 0))(
  ( (ListLongMap!1564 (toList!797 List!1606)) )
))
(declare-fun lt!52219 () ListLongMap!1563)

(declare-fun c!17652 () Bool)

(declare-fun contains!820 (ListLongMap!1563 (_ BitVec 64)) Bool)

(assert (=> b!102700 (= c!17652 (contains!820 lt!52219 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun lt!52215 () V!3203)

(declare-fun update!152 (LongMapFixedSize!888 (_ BitVec 64) V!3203) tuple2!2390)

(assert (=> b!102700 (= lt!52210 (update!152 newMap!16 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52215))))

(declare-fun b!102701 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!102701 (= e!66899 (not (validMask!0 (mask!6688 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun lt!52217 () ListLongMap!1563)

(declare-fun lt!52214 () tuple2!2392)

(declare-fun lt!52212 () tuple2!2392)

(declare-fun +!139 (ListLongMap!1563 tuple2!2392) ListLongMap!1563)

(assert (=> b!102701 (= (+!139 (+!139 lt!52217 lt!52214) lt!52212) (+!139 (+!139 lt!52217 lt!52212) lt!52214))))

(assert (=> b!102701 (= lt!52212 (tuple2!2393 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2432 (v!2868 (underlying!355 thiss!992)))))))

(assert (=> b!102701 (= lt!52214 (tuple2!2393 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52215))))

(declare-fun lt!52208 () Unit!3138)

(declare-fun addCommutativeForDiffKeys!51 (ListLongMap!1563 (_ BitVec 64) V!3203 (_ BitVec 64) V!3203) Unit!3138)

(assert (=> b!102701 (= lt!52208 (addCommutativeForDiffKeys!51 lt!52217 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2432 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!105 (array!4321 array!4323 (_ BitVec 32) (_ BitVec 32) V!3203 V!3203 (_ BitVec 32) Int) ListLongMap!1563)

(assert (=> b!102701 (= lt!52217 (getCurrentListMapNoExtraKeys!105 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun b!102702 () Bool)

(declare-fun e!66906 () Bool)

(assert (=> b!102702 (= e!66900 (and e!66906 mapRes!3882))))

(declare-fun condMapEmpty!3881 () Bool)

(declare-fun mapDefault!3882 () ValueCell!990)

(assert (=> b!102702 (= condMapEmpty!3881 (= (arr!2052 (_values!2538 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!990)) mapDefault!3882)))))

(declare-fun b!102703 () Bool)

(declare-fun e!66908 () Bool)

(assert (=> b!102703 (= e!66903 e!66908)))

(declare-fun b!102704 () Bool)

(declare-fun e!66898 () Bool)

(assert (=> b!102704 (= e!66910 e!66898)))

(declare-fun res!51355 () Bool)

(assert (=> b!102704 (=> (not res!51355) (not e!66898))))

(declare-fun lt!52213 () ListLongMap!1563)

(assert (=> b!102704 (= res!51355 (= lt!52213 lt!52219))))

(declare-fun map!1279 (LongMapFixedSize!888) ListLongMap!1563)

(assert (=> b!102704 (= lt!52219 (map!1279 newMap!16))))

(declare-fun getCurrentListMap!486 (array!4321 array!4323 (_ BitVec 32) (_ BitVec 32) V!3203 V!3203 (_ BitVec 32) Int) ListLongMap!1563)

(assert (=> b!102704 (= lt!52213 (getCurrentListMap!486 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun b!102705 () Bool)

(declare-fun Unit!3140 () Unit!3138)

(assert (=> b!102705 (= e!66897 Unit!3140)))

(declare-fun e!66907 () Bool)

(assert (=> b!102706 (= e!66908 (and tp!9815 tp_is_empty!2667 (array_inv!1289 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (array_inv!1290 (_values!2538 (v!2868 (underlying!355 thiss!992)))) e!66907))))

(declare-fun b!102707 () Bool)

(assert (=> b!102707 (= e!66898 e!66895)))

(declare-fun res!51352 () Bool)

(assert (=> b!102707 (=> (not res!51352) (not e!66895))))

(assert (=> b!102707 (= res!51352 (and (not (= (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1317 (ValueCell!990 V!3203) V!3203)

(declare-fun dynLambda!381 (Int (_ BitVec 64)) V!3203)

(assert (=> b!102707 (= lt!52215 (get!1317 (select (arr!2052 (_values!2538 (v!2868 (underlying!355 thiss!992)))) from!355) (dynLambda!381 (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102708 () Bool)

(declare-fun Unit!3141 () Unit!3138)

(assert (=> b!102708 (= e!66897 Unit!3141)))

(declare-fun lt!52216 () Unit!3138)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!101 (array!4321 array!4323 (_ BitVec 32) (_ BitVec 32) V!3203 V!3203 (_ BitVec 64) (_ BitVec 32) Int) Unit!3138)

(assert (=> b!102708 (= lt!52216 (lemmaListMapContainsThenArrayContainsFrom!101 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!102708 (arrayContainsKey!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!52211 () Unit!3138)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4321 (_ BitVec 32) (_ BitVec 32)) Unit!3138)

(assert (=> b!102708 (= lt!52211 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1607 0))(
  ( (Nil!1604) (Cons!1603 (h!2199 (_ BitVec 64)) (t!5657 List!1607)) )
))
(declare-fun arrayNoDuplicates!0 (array!4321 (_ BitVec 32) List!1607) Bool)

(assert (=> b!102708 (arrayNoDuplicates!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) from!355 Nil!1604)))

(declare-fun lt!52218 () Unit!3138)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4321 (_ BitVec 32) (_ BitVec 64) List!1607) Unit!3138)

(assert (=> b!102708 (= lt!52218 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (Cons!1603 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) Nil!1604)))))

(assert (=> b!102708 false))

(declare-fun b!102709 () Bool)

(assert (=> b!102709 (= e!66907 (and e!66911 mapRes!3881))))

(declare-fun condMapEmpty!3882 () Bool)

(declare-fun mapDefault!3881 () ValueCell!990)

(assert (=> b!102709 (= condMapEmpty!3882 (= (arr!2052 (_values!2538 (v!2868 (underlying!355 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!990)) mapDefault!3881)))))

(declare-fun b!102710 () Bool)

(assert (=> b!102710 (= e!66906 tp_is_empty!2667)))

(declare-fun b!102711 () Bool)

(declare-fun e!66909 () Bool)

(assert (=> b!102711 (= e!66909 tp_is_empty!2667)))

(declare-fun mapIsEmpty!3882 () Bool)

(assert (=> mapIsEmpty!3882 mapRes!3882))

(declare-fun mapNonEmpty!3882 () Bool)

(declare-fun tp!9814 () Bool)

(assert (=> mapNonEmpty!3882 (= mapRes!3881 (and tp!9814 e!66909))))

(declare-fun mapRest!3882 () (Array (_ BitVec 32) ValueCell!990))

(declare-fun mapKey!3882 () (_ BitVec 32))

(declare-fun mapValue!3881 () ValueCell!990)

(assert (=> mapNonEmpty!3882 (= (arr!2052 (_values!2538 (v!2868 (underlying!355 thiss!992)))) (store mapRest!3882 mapKey!3882 mapValue!3881))))

(declare-fun b!102712 () Bool)

(declare-fun res!51358 () Bool)

(assert (=> b!102712 (=> (not res!51358) (not e!66910))))

(declare-fun valid!414 (LongMapFixedSize!888) Bool)

(assert (=> b!102712 (= res!51358 (valid!414 newMap!16))))

(assert (= (and start!12148 res!51353) b!102696))

(assert (= (and b!102696 res!51354) b!102712))

(assert (= (and b!102712 res!51358) b!102699))

(assert (= (and b!102699 res!51357) b!102704))

(assert (= (and b!102704 res!51355) b!102707))

(assert (= (and b!102707 res!51352) b!102700))

(assert (= (and b!102700 c!17652) b!102708))

(assert (= (and b!102700 (not c!17652)) b!102705))

(assert (= (and b!102700 res!51356) b!102701))

(assert (= (and b!102709 condMapEmpty!3882) mapIsEmpty!3881))

(assert (= (and b!102709 (not condMapEmpty!3882)) mapNonEmpty!3882))

(get-info :version)

(assert (= (and mapNonEmpty!3882 ((_ is ValueCellFull!990) mapValue!3881)) b!102711))

(assert (= (and b!102709 ((_ is ValueCellFull!990) mapDefault!3881)) b!102697))

(assert (= b!102706 b!102709))

(assert (= b!102703 b!102706))

(assert (= b!102694 b!102703))

(assert (= start!12148 b!102694))

(assert (= (and b!102702 condMapEmpty!3881) mapIsEmpty!3882))

(assert (= (and b!102702 (not condMapEmpty!3881)) mapNonEmpty!3881))

(assert (= (and mapNonEmpty!3881 ((_ is ValueCellFull!990) mapValue!3882)) b!102695))

(assert (= (and b!102702 ((_ is ValueCellFull!990) mapDefault!3882)) b!102710))

(assert (= b!102698 b!102702))

(assert (= start!12148 b!102698))

(declare-fun b_lambda!4597 () Bool)

(assert (=> (not b_lambda!4597) (not b!102707)))

(declare-fun t!5653 () Bool)

(declare-fun tb!2017 () Bool)

(assert (=> (and b!102706 (= (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))) t!5653) tb!2017))

(declare-fun result!3401 () Bool)

(assert (=> tb!2017 (= result!3401 tp_is_empty!2667)))

(assert (=> b!102707 t!5653))

(declare-fun b_and!6355 () Bool)

(assert (= b_and!6351 (and (=> t!5653 result!3401) b_and!6355)))

(declare-fun tb!2019 () Bool)

(declare-fun t!5655 () Bool)

(assert (=> (and b!102698 (= (defaultEntry!2555 newMap!16) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))) t!5655) tb!2019))

(declare-fun result!3405 () Bool)

(assert (= result!3405 result!3401))

(assert (=> b!102707 t!5655))

(declare-fun b_and!6357 () Bool)

(assert (= b_and!6353 (and (=> t!5655 result!3405) b_and!6357)))

(declare-fun m!113755 () Bool)

(assert (=> b!102698 m!113755))

(declare-fun m!113757 () Bool)

(assert (=> b!102698 m!113757))

(declare-fun m!113759 () Bool)

(assert (=> b!102712 m!113759))

(declare-fun m!113761 () Bool)

(assert (=> b!102700 m!113761))

(assert (=> b!102700 m!113761))

(declare-fun m!113763 () Bool)

(assert (=> b!102700 m!113763))

(assert (=> b!102700 m!113761))

(declare-fun m!113765 () Bool)

(assert (=> b!102700 m!113765))

(declare-fun m!113767 () Bool)

(assert (=> start!12148 m!113767))

(assert (=> b!102707 m!113761))

(declare-fun m!113769 () Bool)

(assert (=> b!102707 m!113769))

(declare-fun m!113771 () Bool)

(assert (=> b!102707 m!113771))

(assert (=> b!102707 m!113769))

(assert (=> b!102707 m!113771))

(declare-fun m!113773 () Bool)

(assert (=> b!102707 m!113773))

(declare-fun m!113775 () Bool)

(assert (=> b!102708 m!113775))

(declare-fun m!113777 () Bool)

(assert (=> b!102708 m!113777))

(assert (=> b!102708 m!113761))

(declare-fun m!113779 () Bool)

(assert (=> b!102708 m!113779))

(assert (=> b!102708 m!113761))

(assert (=> b!102708 m!113761))

(declare-fun m!113781 () Bool)

(assert (=> b!102708 m!113781))

(assert (=> b!102708 m!113761))

(declare-fun m!113783 () Bool)

(assert (=> b!102708 m!113783))

(declare-fun m!113785 () Bool)

(assert (=> mapNonEmpty!3881 m!113785))

(declare-fun m!113787 () Bool)

(assert (=> b!102704 m!113787))

(declare-fun m!113789 () Bool)

(assert (=> b!102704 m!113789))

(declare-fun m!113791 () Bool)

(assert (=> mapNonEmpty!3882 m!113791))

(declare-fun m!113793 () Bool)

(assert (=> b!102701 m!113793))

(declare-fun m!113795 () Bool)

(assert (=> b!102701 m!113795))

(declare-fun m!113797 () Bool)

(assert (=> b!102701 m!113797))

(assert (=> b!102701 m!113761))

(declare-fun m!113799 () Bool)

(assert (=> b!102701 m!113799))

(assert (=> b!102701 m!113761))

(assert (=> b!102701 m!113795))

(declare-fun m!113801 () Bool)

(assert (=> b!102701 m!113801))

(assert (=> b!102701 m!113801))

(declare-fun m!113803 () Bool)

(assert (=> b!102701 m!113803))

(declare-fun m!113805 () Bool)

(assert (=> b!102701 m!113805))

(declare-fun m!113807 () Bool)

(assert (=> b!102706 m!113807))

(declare-fun m!113809 () Bool)

(assert (=> b!102706 m!113809))

(check-sat (not b_next!2501) (not b!102706) (not b_next!2503) b_and!6355 (not start!12148) b_and!6357 (not b_lambda!4597) (not b!102701) (not b!102700) (not mapNonEmpty!3882) (not b!102707) (not b!102704) tp_is_empty!2667 (not b!102712) (not b!102698) (not mapNonEmpty!3881) (not b!102708))
(check-sat b_and!6355 b_and!6357 (not b_next!2501) (not b_next!2503))
(get-model)

(declare-fun b_lambda!4601 () Bool)

(assert (= b_lambda!4597 (or (and b!102706 b_free!2501) (and b!102698 b_free!2503 (= (defaultEntry!2555 newMap!16) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))))) b_lambda!4601)))

(check-sat (not b_next!2501) (not b!102706) (not b_lambda!4601) (not b_next!2503) b_and!6355 (not start!12148) b_and!6357 (not b!102701) (not b!102700) (not mapNonEmpty!3882) (not b!102707) (not b!102704) tp_is_empty!2667 (not b!102712) (not b!102698) (not mapNonEmpty!3881) (not b!102708))
(check-sat b_and!6355 b_and!6357 (not b_next!2501) (not b_next!2503))
(get-model)

(declare-fun d!27717 () Bool)

(declare-fun res!51386 () Bool)

(declare-fun e!66965 () Bool)

(assert (=> d!27717 (=> (not res!51386) (not e!66965))))

(declare-fun simpleValid!72 (LongMapFixedSize!888) Bool)

(assert (=> d!27717 (= res!51386 (simpleValid!72 newMap!16))))

(assert (=> d!27717 (= (valid!414 newMap!16) e!66965)))

(declare-fun b!102780 () Bool)

(declare-fun res!51387 () Bool)

(assert (=> b!102780 (=> (not res!51387) (not e!66965))))

(declare-fun arrayCountValidKeys!0 (array!4321 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!102780 (= res!51387 (= (arrayCountValidKeys!0 (_keys!4257 newMap!16) #b00000000000000000000000000000000 (size!2305 (_keys!4257 newMap!16))) (_size!493 newMap!16)))))

(declare-fun b!102781 () Bool)

(declare-fun res!51388 () Bool)

(assert (=> b!102781 (=> (not res!51388) (not e!66965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4321 (_ BitVec 32)) Bool)

(assert (=> b!102781 (= res!51388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4257 newMap!16) (mask!6688 newMap!16)))))

(declare-fun b!102782 () Bool)

(assert (=> b!102782 (= e!66965 (arrayNoDuplicates!0 (_keys!4257 newMap!16) #b00000000000000000000000000000000 Nil!1604))))

(assert (= (and d!27717 res!51386) b!102780))

(assert (= (and b!102780 res!51387) b!102781))

(assert (= (and b!102781 res!51388) b!102782))

(declare-fun m!113867 () Bool)

(assert (=> d!27717 m!113867))

(declare-fun m!113869 () Bool)

(assert (=> b!102780 m!113869))

(declare-fun m!113871 () Bool)

(assert (=> b!102781 m!113871))

(declare-fun m!113873 () Bool)

(assert (=> b!102782 m!113873))

(assert (=> b!102712 d!27717))

(declare-fun d!27719 () Bool)

(assert (=> d!27719 (= (map!1279 newMap!16) (getCurrentListMap!486 (_keys!4257 newMap!16) (_values!2538 newMap!16) (mask!6688 newMap!16) (extraKeys!2364 newMap!16) (zeroValue!2432 newMap!16) (minValue!2432 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2555 newMap!16)))))

(declare-fun bs!4235 () Bool)

(assert (= bs!4235 d!27719))

(declare-fun m!113875 () Bool)

(assert (=> bs!4235 m!113875))

(assert (=> b!102704 d!27719))

(declare-fun b!102825 () Bool)

(declare-fun e!66995 () Bool)

(declare-fun e!66997 () Bool)

(assert (=> b!102825 (= e!66995 e!66997)))

(declare-fun res!51412 () Bool)

(declare-fun call!10685 () Bool)

(assert (=> b!102825 (= res!51412 call!10685)))

(assert (=> b!102825 (=> (not res!51412) (not e!66997))))

(declare-fun b!102826 () Bool)

(declare-fun res!51408 () Bool)

(declare-fun e!66998 () Bool)

(assert (=> b!102826 (=> (not res!51408) (not e!66998))))

(assert (=> b!102826 (= res!51408 e!66995)))

(declare-fun c!17670 () Bool)

(assert (=> b!102826 (= c!17670 (not (= (bvand (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!10680 () Bool)

(declare-fun lt!52303 () ListLongMap!1563)

(assert (=> bm!10680 (= call!10685 (contains!820 lt!52303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102827 () Bool)

(declare-fun e!66996 () ListLongMap!1563)

(declare-fun e!66999 () ListLongMap!1563)

(assert (=> b!102827 (= e!66996 e!66999)))

(declare-fun c!17668 () Bool)

(assert (=> b!102827 (= c!17668 (and (not (= (bvand (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!66992 () Bool)

(declare-fun b!102828 () Bool)

(declare-fun apply!96 (ListLongMap!1563 (_ BitVec 64)) V!3203)

(assert (=> b!102828 (= e!66992 (= (apply!96 lt!52303 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1317 (select (arr!2052 (_values!2538 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!381 (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!102828 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2306 (_values!2538 (v!2868 (underlying!355 thiss!992))))))))

(assert (=> b!102828 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun b!102829 () Bool)

(assert (=> b!102829 (= e!66995 (not call!10685))))

(declare-fun b!102830 () Bool)

(declare-fun call!10684 () ListLongMap!1563)

(assert (=> b!102830 (= e!66996 (+!139 call!10684 (tuple2!2393 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2432 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun bm!10681 () Bool)

(declare-fun call!10683 () ListLongMap!1563)

(assert (=> bm!10681 (= call!10683 call!10684)))

(declare-fun bm!10683 () Bool)

(declare-fun call!10686 () Bool)

(assert (=> bm!10683 (= call!10686 (contains!820 lt!52303 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102831 () Bool)

(declare-fun res!51411 () Bool)

(assert (=> b!102831 (=> (not res!51411) (not e!66998))))

(declare-fun e!67000 () Bool)

(assert (=> b!102831 (= res!51411 e!67000)))

(declare-fun res!51410 () Bool)

(assert (=> b!102831 (=> res!51410 e!67000)))

(declare-fun e!66993 () Bool)

(assert (=> b!102831 (= res!51410 (not e!66993))))

(declare-fun res!51407 () Bool)

(assert (=> b!102831 (=> (not res!51407) (not e!66993))))

(assert (=> b!102831 (= res!51407 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun bm!10684 () Bool)

(declare-fun call!10688 () ListLongMap!1563)

(declare-fun call!10689 () ListLongMap!1563)

(assert (=> bm!10684 (= call!10688 call!10689)))

(declare-fun b!102832 () Bool)

(declare-fun e!67004 () Bool)

(assert (=> b!102832 (= e!67004 (= (apply!96 lt!52303 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2432 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun bm!10685 () Bool)

(declare-fun call!10687 () ListLongMap!1563)

(assert (=> bm!10685 (= call!10689 call!10687)))

(declare-fun b!102833 () Bool)

(declare-fun e!67003 () Bool)

(assert (=> b!102833 (= e!67003 (not call!10686))))

(declare-fun b!102834 () Bool)

(assert (=> b!102834 (= e!66999 call!10683)))

(declare-fun b!102835 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!102835 (= e!66993 (validKeyInArray!0 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!102836 () Bool)

(assert (=> b!102836 (= e!66997 (= (apply!96 lt!52303 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2432 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun b!102837 () Bool)

(declare-fun e!66994 () Bool)

(assert (=> b!102837 (= e!66994 (validKeyInArray!0 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!102838 () Bool)

(assert (=> b!102838 (= e!67003 e!67004)))

(declare-fun res!51415 () Bool)

(assert (=> b!102838 (= res!51415 call!10686)))

(assert (=> b!102838 (=> (not res!51415) (not e!67004))))

(declare-fun b!102839 () Bool)

(declare-fun e!67001 () Unit!3138)

(declare-fun lt!52310 () Unit!3138)

(assert (=> b!102839 (= e!67001 lt!52310)))

(declare-fun lt!52315 () ListLongMap!1563)

(assert (=> b!102839 (= lt!52315 (getCurrentListMapNoExtraKeys!105 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun lt!52308 () (_ BitVec 64))

(assert (=> b!102839 (= lt!52308 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52320 () (_ BitVec 64))

(assert (=> b!102839 (= lt!52320 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!52309 () Unit!3138)

(declare-fun addStillContains!72 (ListLongMap!1563 (_ BitVec 64) V!3203 (_ BitVec 64)) Unit!3138)

(assert (=> b!102839 (= lt!52309 (addStillContains!72 lt!52315 lt!52308 (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) lt!52320))))

(assert (=> b!102839 (contains!820 (+!139 lt!52315 (tuple2!2393 lt!52308 (zeroValue!2432 (v!2868 (underlying!355 thiss!992))))) lt!52320)))

(declare-fun lt!52307 () Unit!3138)

(assert (=> b!102839 (= lt!52307 lt!52309)))

(declare-fun lt!52311 () ListLongMap!1563)

(assert (=> b!102839 (= lt!52311 (getCurrentListMapNoExtraKeys!105 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun lt!52304 () (_ BitVec 64))

(assert (=> b!102839 (= lt!52304 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52305 () (_ BitVec 64))

(assert (=> b!102839 (= lt!52305 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!52301 () Unit!3138)

(declare-fun addApplyDifferent!72 (ListLongMap!1563 (_ BitVec 64) V!3203 (_ BitVec 64)) Unit!3138)

(assert (=> b!102839 (= lt!52301 (addApplyDifferent!72 lt!52311 lt!52304 (minValue!2432 (v!2868 (underlying!355 thiss!992))) lt!52305))))

(assert (=> b!102839 (= (apply!96 (+!139 lt!52311 (tuple2!2393 lt!52304 (minValue!2432 (v!2868 (underlying!355 thiss!992))))) lt!52305) (apply!96 lt!52311 lt!52305))))

(declare-fun lt!52300 () Unit!3138)

(assert (=> b!102839 (= lt!52300 lt!52301)))

(declare-fun lt!52314 () ListLongMap!1563)

(assert (=> b!102839 (= lt!52314 (getCurrentListMapNoExtraKeys!105 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun lt!52319 () (_ BitVec 64))

(assert (=> b!102839 (= lt!52319 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52312 () (_ BitVec 64))

(assert (=> b!102839 (= lt!52312 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!52318 () Unit!3138)

(assert (=> b!102839 (= lt!52318 (addApplyDifferent!72 lt!52314 lt!52319 (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) lt!52312))))

(assert (=> b!102839 (= (apply!96 (+!139 lt!52314 (tuple2!2393 lt!52319 (zeroValue!2432 (v!2868 (underlying!355 thiss!992))))) lt!52312) (apply!96 lt!52314 lt!52312))))

(declare-fun lt!52316 () Unit!3138)

(assert (=> b!102839 (= lt!52316 lt!52318)))

(declare-fun lt!52317 () ListLongMap!1563)

(assert (=> b!102839 (= lt!52317 (getCurrentListMapNoExtraKeys!105 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun lt!52306 () (_ BitVec 64))

(assert (=> b!102839 (= lt!52306 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52313 () (_ BitVec 64))

(assert (=> b!102839 (= lt!52313 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!102839 (= lt!52310 (addApplyDifferent!72 lt!52317 lt!52306 (minValue!2432 (v!2868 (underlying!355 thiss!992))) lt!52313))))

(assert (=> b!102839 (= (apply!96 (+!139 lt!52317 (tuple2!2393 lt!52306 (minValue!2432 (v!2868 (underlying!355 thiss!992))))) lt!52313) (apply!96 lt!52317 lt!52313))))

(declare-fun b!102840 () Bool)

(assert (=> b!102840 (= e!67000 e!66992)))

(declare-fun res!51409 () Bool)

(assert (=> b!102840 (=> (not res!51409) (not e!66992))))

(assert (=> b!102840 (= res!51409 (contains!820 lt!52303 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!102840 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun bm!10686 () Bool)

(assert (=> bm!10686 (= call!10687 (getCurrentListMapNoExtraKeys!105 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun b!102841 () Bool)

(assert (=> b!102841 (= e!66998 e!67003)))

(declare-fun c!17673 () Bool)

(assert (=> b!102841 (= c!17673 (not (= (bvand (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!102842 () Bool)

(declare-fun c!17669 () Bool)

(assert (=> b!102842 (= c!17669 (and (not (= (bvand (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!67002 () ListLongMap!1563)

(assert (=> b!102842 (= e!66999 e!67002)))

(declare-fun b!102843 () Bool)

(assert (=> b!102843 (= e!67002 call!10688)))

(declare-fun b!102844 () Bool)

(declare-fun Unit!3144 () Unit!3138)

(assert (=> b!102844 (= e!67001 Unit!3144)))

(declare-fun b!102845 () Bool)

(assert (=> b!102845 (= e!67002 call!10683)))

(declare-fun bm!10682 () Bool)

(declare-fun c!17671 () Bool)

(assert (=> bm!10682 (= call!10684 (+!139 (ite c!17671 call!10687 (ite c!17668 call!10689 call!10688)) (ite (or c!17671 c!17668) (tuple2!2393 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2432 (v!2868 (underlying!355 thiss!992)))) (tuple2!2393 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2432 (v!2868 (underlying!355 thiss!992)))))))))

(declare-fun d!27721 () Bool)

(assert (=> d!27721 e!66998))

(declare-fun res!51414 () Bool)

(assert (=> d!27721 (=> (not res!51414) (not e!66998))))

(assert (=> d!27721 (= res!51414 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))))))))

(declare-fun lt!52302 () ListLongMap!1563)

(assert (=> d!27721 (= lt!52303 lt!52302)))

(declare-fun lt!52321 () Unit!3138)

(assert (=> d!27721 (= lt!52321 e!67001)))

(declare-fun c!17672 () Bool)

(assert (=> d!27721 (= c!17672 e!66994)))

(declare-fun res!51413 () Bool)

(assert (=> d!27721 (=> (not res!51413) (not e!66994))))

(assert (=> d!27721 (= res!51413 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))))))

(assert (=> d!27721 (= lt!52302 e!66996)))

(assert (=> d!27721 (= c!17671 (and (not (= (bvand (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27721 (validMask!0 (mask!6688 (v!2868 (underlying!355 thiss!992))))))

(assert (=> d!27721 (= (getCurrentListMap!486 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))) lt!52303)))

(assert (= (and d!27721 c!17671) b!102830))

(assert (= (and d!27721 (not c!17671)) b!102827))

(assert (= (and b!102827 c!17668) b!102834))

(assert (= (and b!102827 (not c!17668)) b!102842))

(assert (= (and b!102842 c!17669) b!102845))

(assert (= (and b!102842 (not c!17669)) b!102843))

(assert (= (or b!102845 b!102843) bm!10684))

(assert (= (or b!102834 bm!10684) bm!10685))

(assert (= (or b!102834 b!102845) bm!10681))

(assert (= (or b!102830 bm!10685) bm!10686))

(assert (= (or b!102830 bm!10681) bm!10682))

(assert (= (and d!27721 res!51413) b!102837))

(assert (= (and d!27721 c!17672) b!102839))

(assert (= (and d!27721 (not c!17672)) b!102844))

(assert (= (and d!27721 res!51414) b!102831))

(assert (= (and b!102831 res!51407) b!102835))

(assert (= (and b!102831 (not res!51410)) b!102840))

(assert (= (and b!102840 res!51409) b!102828))

(assert (= (and b!102831 res!51411) b!102826))

(assert (= (and b!102826 c!17670) b!102825))

(assert (= (and b!102826 (not c!17670)) b!102829))

(assert (= (and b!102825 res!51412) b!102836))

(assert (= (or b!102825 b!102829) bm!10680))

(assert (= (and b!102826 res!51408) b!102841))

(assert (= (and b!102841 c!17673) b!102838))

(assert (= (and b!102841 (not c!17673)) b!102833))

(assert (= (and b!102838 res!51415) b!102832))

(assert (= (or b!102838 b!102833) bm!10683))

(declare-fun b_lambda!4603 () Bool)

(assert (=> (not b_lambda!4603) (not b!102828)))

(assert (=> b!102828 t!5653))

(declare-fun b_and!6367 () Bool)

(assert (= b_and!6355 (and (=> t!5653 result!3401) b_and!6367)))

(assert (=> b!102828 t!5655))

(declare-fun b_and!6369 () Bool)

(assert (= b_and!6357 (and (=> t!5655 result!3405) b_and!6369)))

(declare-fun m!113877 () Bool)

(assert (=> bm!10683 m!113877))

(declare-fun m!113879 () Bool)

(assert (=> b!102830 m!113879))

(assert (=> d!27721 m!113793))

(declare-fun m!113881 () Bool)

(assert (=> b!102840 m!113881))

(assert (=> b!102840 m!113881))

(declare-fun m!113883 () Bool)

(assert (=> b!102840 m!113883))

(assert (=> b!102835 m!113881))

(assert (=> b!102835 m!113881))

(declare-fun m!113885 () Bool)

(assert (=> b!102835 m!113885))

(declare-fun m!113887 () Bool)

(assert (=> b!102836 m!113887))

(assert (=> b!102837 m!113881))

(assert (=> b!102837 m!113881))

(assert (=> b!102837 m!113885))

(declare-fun m!113889 () Bool)

(assert (=> bm!10682 m!113889))

(declare-fun m!113891 () Bool)

(assert (=> b!102832 m!113891))

(declare-fun m!113893 () Bool)

(assert (=> b!102828 m!113893))

(assert (=> b!102828 m!113771))

(declare-fun m!113895 () Bool)

(assert (=> b!102828 m!113895))

(assert (=> b!102828 m!113893))

(assert (=> b!102828 m!113881))

(assert (=> b!102828 m!113771))

(assert (=> b!102828 m!113881))

(declare-fun m!113897 () Bool)

(assert (=> b!102828 m!113897))

(declare-fun m!113899 () Bool)

(assert (=> bm!10680 m!113899))

(assert (=> bm!10686 m!113805))

(declare-fun m!113901 () Bool)

(assert (=> b!102839 m!113901))

(declare-fun m!113903 () Bool)

(assert (=> b!102839 m!113903))

(declare-fun m!113905 () Bool)

(assert (=> b!102839 m!113905))

(declare-fun m!113907 () Bool)

(assert (=> b!102839 m!113907))

(declare-fun m!113909 () Bool)

(assert (=> b!102839 m!113909))

(declare-fun m!113911 () Bool)

(assert (=> b!102839 m!113911))

(assert (=> b!102839 m!113907))

(declare-fun m!113913 () Bool)

(assert (=> b!102839 m!113913))

(assert (=> b!102839 m!113911))

(declare-fun m!113915 () Bool)

(assert (=> b!102839 m!113915))

(declare-fun m!113917 () Bool)

(assert (=> b!102839 m!113917))

(declare-fun m!113919 () Bool)

(assert (=> b!102839 m!113919))

(assert (=> b!102839 m!113905))

(declare-fun m!113921 () Bool)

(assert (=> b!102839 m!113921))

(assert (=> b!102839 m!113917))

(declare-fun m!113923 () Bool)

(assert (=> b!102839 m!113923))

(declare-fun m!113925 () Bool)

(assert (=> b!102839 m!113925))

(assert (=> b!102839 m!113881))

(declare-fun m!113927 () Bool)

(assert (=> b!102839 m!113927))

(declare-fun m!113929 () Bool)

(assert (=> b!102839 m!113929))

(assert (=> b!102839 m!113805))

(assert (=> b!102704 d!27721))

(declare-fun d!27723 () Bool)

(declare-fun e!67010 () Bool)

(assert (=> d!27723 e!67010))

(declare-fun res!51418 () Bool)

(assert (=> d!27723 (=> res!51418 e!67010)))

(declare-fun lt!52332 () Bool)

(assert (=> d!27723 (= res!51418 (not lt!52332))))

(declare-fun lt!52330 () Bool)

(assert (=> d!27723 (= lt!52332 lt!52330)))

(declare-fun lt!52333 () Unit!3138)

(declare-fun e!67009 () Unit!3138)

(assert (=> d!27723 (= lt!52333 e!67009)))

(declare-fun c!17676 () Bool)

(assert (=> d!27723 (= c!17676 lt!52330)))

(declare-fun containsKey!158 (List!1606 (_ BitVec 64)) Bool)

(assert (=> d!27723 (= lt!52330 (containsKey!158 (toList!797 lt!52219) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(assert (=> d!27723 (= (contains!820 lt!52219 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)) lt!52332)))

(declare-fun b!102852 () Bool)

(declare-fun lt!52331 () Unit!3138)

(assert (=> b!102852 (= e!67009 lt!52331)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!106 (List!1606 (_ BitVec 64)) Unit!3138)

(assert (=> b!102852 (= lt!52331 (lemmaContainsKeyImpliesGetValueByKeyDefined!106 (toList!797 lt!52219) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-datatypes ((Option!160 0))(
  ( (Some!159 (v!2872 V!3203)) (None!158) )
))
(declare-fun isDefined!107 (Option!160) Bool)

(declare-fun getValueByKey!154 (List!1606 (_ BitVec 64)) Option!160)

(assert (=> b!102852 (isDefined!107 (getValueByKey!154 (toList!797 lt!52219) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun b!102853 () Bool)

(declare-fun Unit!3145 () Unit!3138)

(assert (=> b!102853 (= e!67009 Unit!3145)))

(declare-fun b!102854 () Bool)

(assert (=> b!102854 (= e!67010 (isDefined!107 (getValueByKey!154 (toList!797 lt!52219) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355))))))

(assert (= (and d!27723 c!17676) b!102852))

(assert (= (and d!27723 (not c!17676)) b!102853))

(assert (= (and d!27723 (not res!51418)) b!102854))

(assert (=> d!27723 m!113761))

(declare-fun m!113931 () Bool)

(assert (=> d!27723 m!113931))

(assert (=> b!102852 m!113761))

(declare-fun m!113933 () Bool)

(assert (=> b!102852 m!113933))

(assert (=> b!102852 m!113761))

(declare-fun m!113935 () Bool)

(assert (=> b!102852 m!113935))

(assert (=> b!102852 m!113935))

(declare-fun m!113937 () Bool)

(assert (=> b!102852 m!113937))

(assert (=> b!102854 m!113761))

(assert (=> b!102854 m!113935))

(assert (=> b!102854 m!113935))

(assert (=> b!102854 m!113937))

(assert (=> b!102700 d!27723))

(declare-fun call!10742 () Unit!3138)

(declare-fun bm!10735 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!45 (array!4321 array!4323 (_ BitVec 32) (_ BitVec 32) V!3203 V!3203 (_ BitVec 64) Int) Unit!3138)

(assert (=> bm!10735 (= call!10742 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!45 (_keys!4257 newMap!16) (_values!2538 newMap!16) (mask!6688 newMap!16) (extraKeys!2364 newMap!16) (zeroValue!2432 newMap!16) (minValue!2432 newMap!16) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (defaultEntry!2555 newMap!16)))))

(declare-fun bm!10736 () Bool)

(declare-fun call!10752 () ListLongMap!1563)

(declare-fun call!10749 () ListLongMap!1563)

(assert (=> bm!10736 (= call!10752 call!10749)))

(declare-fun bm!10737 () Bool)

(declare-datatypes ((SeekEntryResult!257 0))(
  ( (MissingZero!257 (index!3175 (_ BitVec 32))) (Found!257 (index!3176 (_ BitVec 32))) (Intermediate!257 (undefined!1069 Bool) (index!3177 (_ BitVec 32)) (x!13458 (_ BitVec 32))) (Undefined!257) (MissingVacant!257 (index!3178 (_ BitVec 32))) )
))
(declare-fun call!10738 () SeekEntryResult!257)

(declare-fun call!10754 () SeekEntryResult!257)

(assert (=> bm!10737 (= call!10738 call!10754)))

(declare-fun bm!10738 () Bool)

(declare-fun call!10741 () ListLongMap!1563)

(assert (=> bm!10738 (= call!10741 (getCurrentListMap!486 (_keys!4257 newMap!16) (_values!2538 newMap!16) (mask!6688 newMap!16) (extraKeys!2364 newMap!16) (zeroValue!2432 newMap!16) (minValue!2432 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2555 newMap!16)))))

(declare-fun call!10756 () Bool)

(declare-fun bm!10739 () Bool)

(assert (=> bm!10739 (= call!10756 (arrayContainsKey!0 (_keys!4257 newMap!16) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!10741 () Bool)

(declare-fun call!10739 () Bool)

(declare-fun call!10743 () Bool)

(assert (=> bm!10741 (= call!10739 call!10743)))

(declare-fun b!102935 () Bool)

(declare-fun e!67073 () ListLongMap!1563)

(assert (=> b!102935 (= e!67073 call!10741)))

(declare-fun b!102936 () Bool)

(declare-fun res!51449 () Bool)

(declare-fun e!67057 () Bool)

(assert (=> b!102936 (=> (not res!51449) (not e!67057))))

(declare-fun call!10745 () Bool)

(assert (=> b!102936 (= res!51449 call!10745)))

(declare-fun e!67072 () Bool)

(assert (=> b!102936 (= e!67072 e!67057)))

(declare-fun b!102937 () Bool)

(declare-fun call!10746 () ListLongMap!1563)

(assert (=> b!102937 (= e!67073 call!10746)))

(declare-fun b!102938 () Bool)

(declare-fun res!51457 () Bool)

(declare-fun e!67055 () Bool)

(assert (=> b!102938 (=> (not res!51457) (not e!67055))))

(declare-fun call!10750 () Bool)

(assert (=> b!102938 (= res!51457 call!10750)))

(declare-fun e!67067 () Bool)

(assert (=> b!102938 (= e!67067 e!67055)))

(declare-fun b!102939 () Bool)

(declare-fun e!67053 () Bool)

(declare-fun e!67054 () Bool)

(assert (=> b!102939 (= e!67053 e!67054)))

(declare-fun c!17712 () Bool)

(declare-fun lt!52392 () tuple2!2390)

(assert (=> b!102939 (= c!17712 (_1!1206 lt!52392))))

(declare-fun bm!10742 () Bool)

(declare-fun call!10757 () Bool)

(assert (=> bm!10742 (= call!10757 call!10756)))

(declare-fun b!102940 () Bool)

(declare-fun e!67063 () tuple2!2390)

(declare-fun e!67069 () tuple2!2390)

(assert (=> b!102940 (= e!67063 e!67069)))

(declare-fun c!17710 () Bool)

(declare-fun lt!52398 () SeekEntryResult!257)

(assert (=> b!102940 (= c!17710 ((_ is MissingZero!257) lt!52398))))

(declare-fun bm!10743 () Bool)

(assert (=> bm!10743 (= call!10745 call!10739)))

(declare-fun b!102941 () Bool)

(declare-fun e!67059 () Unit!3138)

(declare-fun lt!52388 () Unit!3138)

(assert (=> b!102941 (= e!67059 lt!52388)))

(declare-fun call!10753 () Unit!3138)

(assert (=> b!102941 (= lt!52388 call!10753)))

(declare-fun lt!52410 () SeekEntryResult!257)

(assert (=> b!102941 (= lt!52410 call!10738)))

(declare-fun res!51456 () Bool)

(assert (=> b!102941 (= res!51456 ((_ is Found!257) lt!52410))))

(declare-fun e!67056 () Bool)

(assert (=> b!102941 (=> (not res!51456) (not e!67056))))

(assert (=> b!102941 e!67056))

(declare-fun b!102942 () Bool)

(declare-fun e!67058 () Bool)

(assert (=> b!102942 (= e!67054 e!67058)))

(declare-fun call!10747 () ListLongMap!1563)

(declare-fun res!51452 () Bool)

(assert (=> b!102942 (= res!51452 (contains!820 call!10747 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(assert (=> b!102942 (=> (not res!51452) (not e!67058))))

(declare-fun bm!10744 () Bool)

(declare-fun c!17709 () Bool)

(declare-fun call!10744 () ListLongMap!1563)

(declare-fun c!17703 () Bool)

(declare-fun call!10755 () ListLongMap!1563)

(assert (=> bm!10744 (= call!10755 (+!139 (ite c!17709 call!10744 call!10741) (ite c!17709 (ite c!17703 (tuple2!2393 #b0000000000000000000000000000000000000000000000000000000000000000 lt!52215) (tuple2!2393 #b1000000000000000000000000000000000000000000000000000000000000000 lt!52215)) (tuple2!2393 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52215))))))

(declare-fun b!102943 () Bool)

(declare-fun res!51455 () Bool)

(declare-fun lt!52396 () SeekEntryResult!257)

(assert (=> b!102943 (= res!51455 (= (select (arr!2051 (_keys!4257 newMap!16)) (index!3178 lt!52396)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!67065 () Bool)

(assert (=> b!102943 (=> (not res!51455) (not e!67065))))

(declare-fun b!102944 () Bool)

(declare-fun e!67062 () Bool)

(assert (=> b!102944 (= e!67062 ((_ is Undefined!257) lt!52396))))

(declare-fun b!102945 () Bool)

(declare-fun res!51451 () Bool)

(assert (=> b!102945 (=> (not res!51451) (not e!67057))))

(assert (=> b!102945 (= res!51451 (= (select (arr!2051 (_keys!4257 newMap!16)) (index!3175 lt!52396)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102946 () Bool)

(declare-fun lt!52397 () tuple2!2390)

(assert (=> b!102946 (= e!67063 (tuple2!2391 (_1!1206 lt!52397) (_2!1206 lt!52397)))))

(declare-fun call!10748 () tuple2!2390)

(assert (=> b!102946 (= lt!52397 call!10748)))

(declare-fun b!102947 () Bool)

(declare-fun lt!52406 () Unit!3138)

(declare-fun lt!52414 () Unit!3138)

(assert (=> b!102947 (= lt!52406 lt!52414)))

(declare-fun call!10761 () ListLongMap!1563)

(assert (=> b!102947 (= call!10761 call!10752)))

(declare-fun lt!52413 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!45 (array!4321 array!4323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3203 V!3203 V!3203 Int) Unit!3138)

(assert (=> b!102947 (= lt!52414 (lemmaChangeLongMinValueKeyThenAddPairToListMap!45 (_keys!4257 newMap!16) (_values!2538 newMap!16) (mask!6688 newMap!16) (extraKeys!2364 newMap!16) lt!52413 (zeroValue!2432 newMap!16) (minValue!2432 newMap!16) lt!52215 (defaultEntry!2555 newMap!16)))))

(assert (=> b!102947 (= lt!52413 (bvor (extraKeys!2364 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!67061 () tuple2!2390)

(assert (=> b!102947 (= e!67061 (tuple2!2391 true (LongMapFixedSize!889 (defaultEntry!2555 newMap!16) (mask!6688 newMap!16) (bvor (extraKeys!2364 newMap!16) #b00000000000000000000000000000010) (zeroValue!2432 newMap!16) lt!52215 (_size!493 newMap!16) (_keys!4257 newMap!16) (_values!2538 newMap!16) (_vacant!493 newMap!16))))))

(declare-fun b!102948 () Bool)

(declare-fun e!67066 () Unit!3138)

(declare-fun lt!52393 () Unit!3138)

(assert (=> b!102948 (= e!67066 lt!52393)))

(assert (=> b!102948 (= lt!52393 call!10742)))

(declare-fun call!10751 () SeekEntryResult!257)

(assert (=> b!102948 (= lt!52396 call!10751)))

(declare-fun c!17713 () Bool)

(assert (=> b!102948 (= c!17713 ((_ is MissingZero!257) lt!52396))))

(assert (=> b!102948 e!67072))

(declare-fun bm!10745 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!45 (array!4321 array!4323 (_ BitVec 32) (_ BitVec 32) V!3203 V!3203 (_ BitVec 64) Int) Unit!3138)

(assert (=> bm!10745 (= call!10753 (lemmaInListMapThenSeekEntryOrOpenFindsIt!45 (_keys!4257 newMap!16) (_values!2538 newMap!16) (mask!6688 newMap!16) (extraKeys!2364 newMap!16) (zeroValue!2432 newMap!16) (minValue!2432 newMap!16) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (defaultEntry!2555 newMap!16)))))

(declare-fun bm!10746 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4321 (_ BitVec 32)) SeekEntryResult!257)

(assert (=> bm!10746 (= call!10754 (seekEntryOrOpen!0 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (_keys!4257 newMap!16) (mask!6688 newMap!16)))))

(declare-fun b!102949 () Bool)

(declare-fun res!51459 () Bool)

(declare-fun lt!52394 () SeekEntryResult!257)

(assert (=> b!102949 (= res!51459 (= (select (arr!2051 (_keys!4257 newMap!16)) (index!3178 lt!52394)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!67068 () Bool)

(assert (=> b!102949 (=> (not res!51459) (not e!67068))))

(declare-fun bm!10747 () Bool)

(declare-fun call!10760 () Bool)

(assert (=> bm!10747 (= call!10750 call!10760)))

(declare-fun b!102950 () Bool)

(declare-fun res!51450 () Bool)

(assert (=> b!102950 (= res!51450 call!10739)))

(declare-fun e!67060 () Bool)

(assert (=> b!102950 (=> (not res!51450) (not e!67060))))

(declare-fun b!102951 () Bool)

(declare-fun lt!52401 () Unit!3138)

(assert (=> b!102951 (= lt!52401 e!67066)))

(declare-fun c!17707 () Bool)

(declare-fun call!10758 () Bool)

(assert (=> b!102951 (= c!17707 call!10758)))

(declare-fun e!67071 () tuple2!2390)

(assert (=> b!102951 (= e!67071 (tuple2!2391 false newMap!16))))

(declare-fun b!102952 () Bool)

(assert (=> b!102952 (= e!67056 (= (select (arr!2051 (_keys!4257 newMap!16)) (index!3176 lt!52410)) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun b!102953 () Bool)

(declare-fun e!67064 () Bool)

(assert (=> b!102953 (= e!67064 e!67068)))

(declare-fun res!51453 () Bool)

(assert (=> b!102953 (= res!51453 call!10750)))

(assert (=> b!102953 (=> (not res!51453) (not e!67068))))

(declare-fun bm!10748 () Bool)

(assert (=> bm!10748 (= call!10761 call!10755)))

(declare-fun b!102954 () Bool)

(declare-fun Unit!3146 () Unit!3138)

(assert (=> b!102954 (= e!67059 Unit!3146)))

(declare-fun lt!52391 () Unit!3138)

(assert (=> b!102954 (= lt!52391 call!10742)))

(assert (=> b!102954 (= lt!52394 call!10738)))

(declare-fun c!17708 () Bool)

(assert (=> b!102954 (= c!17708 ((_ is MissingZero!257) lt!52394))))

(assert (=> b!102954 e!67067))

(declare-fun lt!52405 () Unit!3138)

(assert (=> b!102954 (= lt!52405 lt!52391)))

(assert (=> b!102954 false))

(declare-fun bm!10740 () Bool)

(assert (=> bm!10740 (= call!10760 call!10743)))

(declare-fun d!27725 () Bool)

(assert (=> d!27725 e!67053))

(declare-fun res!51460 () Bool)

(assert (=> d!27725 (=> (not res!51460) (not e!67053))))

(assert (=> d!27725 (= res!51460 (valid!414 (_2!1206 lt!52392)))))

(declare-fun e!67070 () tuple2!2390)

(assert (=> d!27725 (= lt!52392 e!67070)))

(assert (=> d!27725 (= c!17709 (= (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (bvneg (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355))))))

(assert (=> d!27725 (valid!414 newMap!16)))

(assert (=> d!27725 (= (update!152 newMap!16 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52215) lt!52392)))

(declare-fun bm!10749 () Bool)

(declare-fun call!10759 () Bool)

(assert (=> bm!10749 (= call!10759 call!10756)))

(declare-fun bm!10750 () Bool)

(declare-fun c!17715 () Bool)

(declare-fun c!17714 () Bool)

(assert (=> bm!10750 (= c!17715 c!17714)))

(assert (=> bm!10750 (= call!10758 (contains!820 e!67073 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun b!102955 () Bool)

(assert (=> b!102955 (= e!67057 (not call!10757))))

(declare-fun bm!10751 () Bool)

(declare-fun lt!52412 () SeekEntryResult!257)

(declare-fun c!17704 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!10751 (= call!10743 (inRange!0 (ite c!17714 (ite c!17707 (index!3176 lt!52412) (ite c!17713 (index!3175 lt!52396) (index!3178 lt!52396))) (ite c!17704 (index!3176 lt!52410) (ite c!17708 (index!3175 lt!52394) (index!3178 lt!52394)))) (mask!6688 newMap!16)))))

(declare-fun b!102956 () Bool)

(assert (=> b!102956 (= e!67068 (not call!10759))))

(declare-fun b!102957 () Bool)

(assert (=> b!102957 (= e!67070 e!67071)))

(assert (=> b!102957 (= lt!52398 (seekEntryOrOpen!0 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (_keys!4257 newMap!16) (mask!6688 newMap!16)))))

(assert (=> b!102957 (= c!17714 ((_ is Undefined!257) lt!52398))))

(declare-fun bm!10752 () Bool)

(assert (=> bm!10752 (= call!10746 call!10749)))

(declare-fun b!102958 () Bool)

(declare-fun c!17706 () Bool)

(assert (=> b!102958 (= c!17706 ((_ is MissingVacant!257) lt!52398))))

(assert (=> b!102958 (= e!67071 e!67063)))

(declare-fun bm!10753 () Bool)

(declare-fun lt!52402 () (_ BitVec 32))

(declare-fun lt!52400 () array!4323)

(assert (=> bm!10753 (= call!10749 (getCurrentListMap!486 (_keys!4257 newMap!16) (ite (or c!17709 c!17714) (_values!2538 newMap!16) lt!52400) (mask!6688 newMap!16) (ite c!17709 (ite c!17703 lt!52402 lt!52413) (extraKeys!2364 newMap!16)) (ite (and c!17709 c!17703) lt!52215 (zeroValue!2432 newMap!16)) (ite c!17709 (ite c!17703 (minValue!2432 newMap!16) lt!52215) (minValue!2432 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2555 newMap!16)))))

(declare-fun b!102959 () Bool)

(declare-fun res!51454 () Bool)

(assert (=> b!102959 (= res!51454 call!10760)))

(assert (=> b!102959 (=> (not res!51454) (not e!67056))))

(declare-fun b!102960 () Bool)

(assert (=> b!102960 (= e!67070 e!67061)))

(assert (=> b!102960 (= c!17703 (= (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!102961 () Bool)

(declare-fun call!10740 () ListLongMap!1563)

(assert (=> b!102961 (= e!67054 (= call!10747 call!10740))))

(declare-fun b!102962 () Bool)

(declare-fun lt!52389 () Unit!3138)

(declare-fun lt!52409 () Unit!3138)

(assert (=> b!102962 (= lt!52389 lt!52409)))

(assert (=> b!102962 (contains!820 call!10746 (select (arr!2051 (_keys!4257 newMap!16)) (index!3176 lt!52398)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!106 (array!4321 array!4323 (_ BitVec 32) (_ BitVec 32) V!3203 V!3203 (_ BitVec 32) Int) Unit!3138)

(assert (=> b!102962 (= lt!52409 (lemmaValidKeyInArrayIsInListMap!106 (_keys!4257 newMap!16) lt!52400 (mask!6688 newMap!16) (extraKeys!2364 newMap!16) (zeroValue!2432 newMap!16) (minValue!2432 newMap!16) (index!3176 lt!52398) (defaultEntry!2555 newMap!16)))))

(assert (=> b!102962 (= lt!52400 (array!4324 (store (arr!2052 (_values!2538 newMap!16)) (index!3176 lt!52398) (ValueCellFull!990 lt!52215)) (size!2306 (_values!2538 newMap!16))))))

(declare-fun lt!52403 () Unit!3138)

(declare-fun lt!52399 () Unit!3138)

(assert (=> b!102962 (= lt!52403 lt!52399)))

(assert (=> b!102962 (= call!10755 (getCurrentListMap!486 (_keys!4257 newMap!16) (array!4324 (store (arr!2052 (_values!2538 newMap!16)) (index!3176 lt!52398) (ValueCellFull!990 lt!52215)) (size!2306 (_values!2538 newMap!16))) (mask!6688 newMap!16) (extraKeys!2364 newMap!16) (zeroValue!2432 newMap!16) (minValue!2432 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2555 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!45 (array!4321 array!4323 (_ BitVec 32) (_ BitVec 32) V!3203 V!3203 (_ BitVec 32) (_ BitVec 64) V!3203 Int) Unit!3138)

(assert (=> b!102962 (= lt!52399 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!45 (_keys!4257 newMap!16) (_values!2538 newMap!16) (mask!6688 newMap!16) (extraKeys!2364 newMap!16) (zeroValue!2432 newMap!16) (minValue!2432 newMap!16) (index!3176 lt!52398) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52215 (defaultEntry!2555 newMap!16)))))

(declare-fun lt!52404 () Unit!3138)

(assert (=> b!102962 (= lt!52404 e!67059)))

(assert (=> b!102962 (= c!17704 call!10758)))

(assert (=> b!102962 (= e!67069 (tuple2!2391 true (LongMapFixedSize!889 (defaultEntry!2555 newMap!16) (mask!6688 newMap!16) (extraKeys!2364 newMap!16) (zeroValue!2432 newMap!16) (minValue!2432 newMap!16) (_size!493 newMap!16) (_keys!4257 newMap!16) (array!4324 (store (arr!2052 (_values!2538 newMap!16)) (index!3176 lt!52398) (ValueCellFull!990 lt!52215)) (size!2306 (_values!2538 newMap!16))) (_vacant!493 newMap!16))))))

(declare-fun bm!10754 () Bool)

(assert (=> bm!10754 (= call!10751 call!10754)))

(declare-fun b!102963 () Bool)

(declare-fun c!17711 () Bool)

(assert (=> b!102963 (= c!17711 ((_ is MissingVacant!257) lt!52396))))

(assert (=> b!102963 (= e!67072 e!67062)))

(declare-fun b!102964 () Bool)

(assert (=> b!102964 (= e!67065 (not call!10757))))

(declare-fun b!102965 () Bool)

(assert (=> b!102965 (= e!67062 e!67065)))

(declare-fun res!51448 () Bool)

(assert (=> b!102965 (= res!51448 call!10745)))

(assert (=> b!102965 (=> (not res!51448) (not e!67065))))

(declare-fun b!102966 () Bool)

(assert (=> b!102966 (= e!67064 ((_ is Undefined!257) lt!52394))))

(declare-fun bm!10755 () Bool)

(assert (=> bm!10755 (= call!10747 (map!1279 (_2!1206 lt!52392)))))

(declare-fun b!102967 () Bool)

(assert (=> b!102967 (= e!67055 (not call!10759))))

(declare-fun b!102968 () Bool)

(declare-fun c!17705 () Bool)

(assert (=> b!102968 (= c!17705 ((_ is MissingVacant!257) lt!52394))))

(assert (=> b!102968 (= e!67067 e!67064)))

(declare-fun b!102969 () Bool)

(declare-fun Unit!3147 () Unit!3138)

(assert (=> b!102969 (= e!67066 Unit!3147)))

(declare-fun lt!52407 () Unit!3138)

(assert (=> b!102969 (= lt!52407 call!10753)))

(assert (=> b!102969 (= lt!52412 call!10751)))

(declare-fun res!51458 () Bool)

(assert (=> b!102969 (= res!51458 ((_ is Found!257) lt!52412))))

(assert (=> b!102969 (=> (not res!51458) (not e!67060))))

(assert (=> b!102969 e!67060))

(declare-fun lt!52408 () Unit!3138)

(assert (=> b!102969 (= lt!52408 lt!52407)))

(assert (=> b!102969 false))

(declare-fun b!102970 () Bool)

(declare-fun lt!52411 () Unit!3138)

(declare-fun lt!52395 () Unit!3138)

(assert (=> b!102970 (= lt!52411 lt!52395)))

(assert (=> b!102970 (= call!10761 call!10752)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!45 (array!4321 array!4323 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3203 V!3203 V!3203 Int) Unit!3138)

(assert (=> b!102970 (= lt!52395 (lemmaChangeZeroKeyThenAddPairToListMap!45 (_keys!4257 newMap!16) (_values!2538 newMap!16) (mask!6688 newMap!16) (extraKeys!2364 newMap!16) lt!52402 (zeroValue!2432 newMap!16) lt!52215 (minValue!2432 newMap!16) (defaultEntry!2555 newMap!16)))))

(assert (=> b!102970 (= lt!52402 (bvor (extraKeys!2364 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!102970 (= e!67061 (tuple2!2391 true (LongMapFixedSize!889 (defaultEntry!2555 newMap!16) (mask!6688 newMap!16) (bvor (extraKeys!2364 newMap!16) #b00000000000000000000000000000001) lt!52215 (minValue!2432 newMap!16) (_size!493 newMap!16) (_keys!4257 newMap!16) (_values!2538 newMap!16) (_vacant!493 newMap!16))))))

(declare-fun bm!10756 () Bool)

(assert (=> bm!10756 (= call!10744 call!10741)))

(declare-fun b!102971 () Bool)

(declare-fun lt!52390 () tuple2!2390)

(assert (=> b!102971 (= lt!52390 call!10748)))

(assert (=> b!102971 (= e!67069 (tuple2!2391 (_1!1206 lt!52390) (_2!1206 lt!52390)))))

(declare-fun b!102972 () Bool)

(assert (=> b!102972 (= e!67058 (= call!10747 (+!139 call!10740 (tuple2!2393 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52215))))))

(declare-fun bm!10757 () Bool)

(declare-fun updateHelperNewKey!45 (LongMapFixedSize!888 (_ BitVec 64) V!3203 (_ BitVec 32)) tuple2!2390)

(assert (=> bm!10757 (= call!10748 (updateHelperNewKey!45 newMap!16 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52215 (ite c!17706 (index!3178 lt!52398) (index!3175 lt!52398))))))

(declare-fun b!102973 () Bool)

(declare-fun res!51447 () Bool)

(assert (=> b!102973 (=> (not res!51447) (not e!67055))))

(assert (=> b!102973 (= res!51447 (= (select (arr!2051 (_keys!4257 newMap!16)) (index!3175 lt!52394)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10758 () Bool)

(assert (=> bm!10758 (= call!10740 (map!1279 newMap!16))))

(declare-fun b!102974 () Bool)

(assert (=> b!102974 (= e!67060 (= (select (arr!2051 (_keys!4257 newMap!16)) (index!3176 lt!52412)) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(assert (= (and d!27725 c!17709) b!102960))

(assert (= (and d!27725 (not c!17709)) b!102957))

(assert (= (and b!102960 c!17703) b!102970))

(assert (= (and b!102960 (not c!17703)) b!102947))

(assert (= (or b!102970 b!102947) bm!10736))

(assert (= (or b!102970 b!102947) bm!10756))

(assert (= (or b!102970 b!102947) bm!10748))

(assert (= (and b!102957 c!17714) b!102951))

(assert (= (and b!102957 (not c!17714)) b!102958))

(assert (= (and b!102951 c!17707) b!102969))

(assert (= (and b!102951 (not c!17707)) b!102948))

(assert (= (and b!102969 res!51458) b!102950))

(assert (= (and b!102950 res!51450) b!102974))

(assert (= (and b!102948 c!17713) b!102936))

(assert (= (and b!102948 (not c!17713)) b!102963))

(assert (= (and b!102936 res!51449) b!102945))

(assert (= (and b!102945 res!51451) b!102955))

(assert (= (and b!102963 c!17711) b!102965))

(assert (= (and b!102963 (not c!17711)) b!102944))

(assert (= (and b!102965 res!51448) b!102943))

(assert (= (and b!102943 res!51455) b!102964))

(assert (= (or b!102936 b!102965) bm!10743))

(assert (= (or b!102955 b!102964) bm!10742))

(assert (= (or b!102950 bm!10743) bm!10741))

(assert (= (or b!102969 b!102948) bm!10754))

(assert (= (and b!102958 c!17706) b!102946))

(assert (= (and b!102958 (not c!17706)) b!102940))

(assert (= (and b!102940 c!17710) b!102971))

(assert (= (and b!102940 (not c!17710)) b!102962))

(assert (= (and b!102962 c!17704) b!102941))

(assert (= (and b!102962 (not c!17704)) b!102954))

(assert (= (and b!102941 res!51456) b!102959))

(assert (= (and b!102959 res!51454) b!102952))

(assert (= (and b!102954 c!17708) b!102938))

(assert (= (and b!102954 (not c!17708)) b!102968))

(assert (= (and b!102938 res!51457) b!102973))

(assert (= (and b!102973 res!51447) b!102967))

(assert (= (and b!102968 c!17705) b!102953))

(assert (= (and b!102968 (not c!17705)) b!102966))

(assert (= (and b!102953 res!51453) b!102949))

(assert (= (and b!102949 res!51459) b!102956))

(assert (= (or b!102938 b!102953) bm!10747))

(assert (= (or b!102967 b!102956) bm!10749))

(assert (= (or b!102959 bm!10747) bm!10740))

(assert (= (or b!102941 b!102954) bm!10737))

(assert (= (or b!102946 b!102971) bm!10757))

(assert (= (or bm!10742 bm!10749) bm!10739))

(assert (= (or b!102951 b!102962) bm!10752))

(assert (= (or b!102969 b!102941) bm!10745))

(assert (= (or bm!10754 bm!10737) bm!10746))

(assert (= (or bm!10741 bm!10740) bm!10751))

(assert (= (or b!102948 b!102954) bm!10735))

(assert (= (or b!102951 b!102962) bm!10750))

(assert (= (and bm!10750 c!17715) b!102937))

(assert (= (and bm!10750 (not c!17715)) b!102935))

(assert (= (or bm!10736 bm!10752) bm!10753))

(assert (= (or bm!10756 b!102962 b!102935) bm!10738))

(assert (= (or bm!10748 b!102962) bm!10744))

(assert (= (and d!27725 res!51460) b!102939))

(assert (= (and b!102939 c!17712) b!102942))

(assert (= (and b!102939 (not c!17712)) b!102961))

(assert (= (and b!102942 res!51452) b!102972))

(assert (= (or b!102972 b!102961) bm!10758))

(assert (= (or b!102942 b!102972 b!102961) bm!10755))

(assert (=> bm!10738 m!113875))

(assert (=> b!102957 m!113761))

(declare-fun m!113939 () Bool)

(assert (=> b!102957 m!113939))

(declare-fun m!113941 () Bool)

(assert (=> b!102949 m!113941))

(assert (=> bm!10757 m!113761))

(declare-fun m!113943 () Bool)

(assert (=> bm!10757 m!113943))

(declare-fun m!113945 () Bool)

(assert (=> b!102943 m!113945))

(declare-fun m!113947 () Bool)

(assert (=> bm!10755 m!113947))

(declare-fun m!113949 () Bool)

(assert (=> b!102972 m!113949))

(declare-fun m!113951 () Bool)

(assert (=> b!102973 m!113951))

(assert (=> bm!10758 m!113787))

(assert (=> bm!10746 m!113761))

(assert (=> bm!10746 m!113939))

(declare-fun m!113953 () Bool)

(assert (=> b!102947 m!113953))

(declare-fun m!113955 () Bool)

(assert (=> bm!10751 m!113955))

(assert (=> bm!10739 m!113761))

(declare-fun m!113957 () Bool)

(assert (=> bm!10739 m!113957))

(declare-fun m!113959 () Bool)

(assert (=> b!102974 m!113959))

(assert (=> bm!10735 m!113761))

(declare-fun m!113961 () Bool)

(assert (=> bm!10735 m!113961))

(declare-fun m!113963 () Bool)

(assert (=> b!102945 m!113963))

(declare-fun m!113965 () Bool)

(assert (=> b!102970 m!113965))

(assert (=> bm!10745 m!113761))

(declare-fun m!113967 () Bool)

(assert (=> bm!10745 m!113967))

(declare-fun m!113969 () Bool)

(assert (=> d!27725 m!113969))

(assert (=> d!27725 m!113759))

(declare-fun m!113971 () Bool)

(assert (=> bm!10753 m!113971))

(declare-fun m!113973 () Bool)

(assert (=> bm!10744 m!113973))

(assert (=> bm!10750 m!113761))

(declare-fun m!113975 () Bool)

(assert (=> bm!10750 m!113975))

(declare-fun m!113977 () Bool)

(assert (=> b!102962 m!113977))

(declare-fun m!113979 () Bool)

(assert (=> b!102962 m!113979))

(assert (=> b!102962 m!113761))

(declare-fun m!113981 () Bool)

(assert (=> b!102962 m!113981))

(assert (=> b!102962 m!113977))

(declare-fun m!113983 () Bool)

(assert (=> b!102962 m!113983))

(declare-fun m!113985 () Bool)

(assert (=> b!102962 m!113985))

(declare-fun m!113987 () Bool)

(assert (=> b!102962 m!113987))

(declare-fun m!113989 () Bool)

(assert (=> b!102952 m!113989))

(assert (=> b!102942 m!113761))

(declare-fun m!113991 () Bool)

(assert (=> b!102942 m!113991))

(assert (=> b!102700 d!27725))

(declare-fun d!27727 () Bool)

(declare-fun e!67076 () Bool)

(assert (=> d!27727 e!67076))

(declare-fun res!51465 () Bool)

(assert (=> d!27727 (=> (not res!51465) (not e!67076))))

(declare-fun lt!52426 () ListLongMap!1563)

(assert (=> d!27727 (= res!51465 (contains!820 lt!52426 (_1!1207 lt!52214)))))

(declare-fun lt!52423 () List!1606)

(assert (=> d!27727 (= lt!52426 (ListLongMap!1564 lt!52423))))

(declare-fun lt!52424 () Unit!3138)

(declare-fun lt!52425 () Unit!3138)

(assert (=> d!27727 (= lt!52424 lt!52425)))

(assert (=> d!27727 (= (getValueByKey!154 lt!52423 (_1!1207 lt!52214)) (Some!159 (_2!1207 lt!52214)))))

(declare-fun lemmaContainsTupThenGetReturnValue!70 (List!1606 (_ BitVec 64) V!3203) Unit!3138)

(assert (=> d!27727 (= lt!52425 (lemmaContainsTupThenGetReturnValue!70 lt!52423 (_1!1207 lt!52214) (_2!1207 lt!52214)))))

(declare-fun insertStrictlySorted!73 (List!1606 (_ BitVec 64) V!3203) List!1606)

(assert (=> d!27727 (= lt!52423 (insertStrictlySorted!73 (toList!797 lt!52217) (_1!1207 lt!52214) (_2!1207 lt!52214)))))

(assert (=> d!27727 (= (+!139 lt!52217 lt!52214) lt!52426)))

(declare-fun b!102979 () Bool)

(declare-fun res!51466 () Bool)

(assert (=> b!102979 (=> (not res!51466) (not e!67076))))

(assert (=> b!102979 (= res!51466 (= (getValueByKey!154 (toList!797 lt!52426) (_1!1207 lt!52214)) (Some!159 (_2!1207 lt!52214))))))

(declare-fun b!102980 () Bool)

(declare-fun contains!822 (List!1606 tuple2!2392) Bool)

(assert (=> b!102980 (= e!67076 (contains!822 (toList!797 lt!52426) lt!52214))))

(assert (= (and d!27727 res!51465) b!102979))

(assert (= (and b!102979 res!51466) b!102980))

(declare-fun m!113993 () Bool)

(assert (=> d!27727 m!113993))

(declare-fun m!113995 () Bool)

(assert (=> d!27727 m!113995))

(declare-fun m!113997 () Bool)

(assert (=> d!27727 m!113997))

(declare-fun m!113999 () Bool)

(assert (=> d!27727 m!113999))

(declare-fun m!114001 () Bool)

(assert (=> b!102979 m!114001))

(declare-fun m!114003 () Bool)

(assert (=> b!102980 m!114003))

(assert (=> b!102701 d!27727))

(declare-fun b!103005 () Bool)

(declare-fun e!67097 () ListLongMap!1563)

(declare-fun e!67093 () ListLongMap!1563)

(assert (=> b!103005 (= e!67097 e!67093)))

(declare-fun c!17727 () Bool)

(assert (=> b!103005 (= c!17727 (validKeyInArray!0 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!103006 () Bool)

(assert (=> b!103006 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))))))

(assert (=> b!103006 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2306 (_values!2538 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun lt!52445 () ListLongMap!1563)

(declare-fun e!67091 () Bool)

(assert (=> b!103006 (= e!67091 (= (apply!96 lt!52445 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1317 (select (arr!2052 (_values!2538 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!381 (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!103007 () Bool)

(declare-fun e!67095 () Bool)

(declare-fun isEmpty!366 (ListLongMap!1563) Bool)

(assert (=> b!103007 (= e!67095 (isEmpty!366 lt!52445))))

(declare-fun d!27729 () Bool)

(declare-fun e!67096 () Bool)

(assert (=> d!27729 e!67096))

(declare-fun res!51475 () Bool)

(assert (=> d!27729 (=> (not res!51475) (not e!67096))))

(assert (=> d!27729 (= res!51475 (not (contains!820 lt!52445 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27729 (= lt!52445 e!67097)))

(declare-fun c!17724 () Bool)

(assert (=> d!27729 (= c!17724 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))))))

(assert (=> d!27729 (validMask!0 (mask!6688 (v!2868 (underlying!355 thiss!992))))))

(assert (=> d!27729 (= (getCurrentListMapNoExtraKeys!105 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))) lt!52445)))

(declare-fun b!103008 () Bool)

(declare-fun e!67092 () Bool)

(assert (=> b!103008 (= e!67092 e!67095)))

(declare-fun c!17725 () Bool)

(assert (=> b!103008 (= c!17725 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun b!103009 () Bool)

(declare-fun lt!52443 () Unit!3138)

(declare-fun lt!52446 () Unit!3138)

(assert (=> b!103009 (= lt!52443 lt!52446)))

(declare-fun lt!52447 () (_ BitVec 64))

(declare-fun lt!52442 () V!3203)

(declare-fun lt!52444 () ListLongMap!1563)

(declare-fun lt!52441 () (_ BitVec 64))

(assert (=> b!103009 (not (contains!820 (+!139 lt!52444 (tuple2!2393 lt!52447 lt!52442)) lt!52441))))

(declare-fun addStillNotContains!44 (ListLongMap!1563 (_ BitVec 64) V!3203 (_ BitVec 64)) Unit!3138)

(assert (=> b!103009 (= lt!52446 (addStillNotContains!44 lt!52444 lt!52447 lt!52442 lt!52441))))

(assert (=> b!103009 (= lt!52441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!103009 (= lt!52442 (get!1317 (select (arr!2052 (_values!2538 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!381 (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103009 (= lt!52447 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!10764 () ListLongMap!1563)

(assert (=> b!103009 (= lt!52444 call!10764)))

(assert (=> b!103009 (= e!67093 (+!139 call!10764 (tuple2!2393 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1317 (select (arr!2052 (_values!2538 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!381 (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!103010 () Bool)

(assert (=> b!103010 (= e!67097 (ListLongMap!1564 Nil!1603))))

(declare-fun b!103011 () Bool)

(assert (=> b!103011 (= e!67096 e!67092)))

(declare-fun c!17726 () Bool)

(declare-fun e!67094 () Bool)

(assert (=> b!103011 (= c!17726 e!67094)))

(declare-fun res!51476 () Bool)

(assert (=> b!103011 (=> (not res!51476) (not e!67094))))

(assert (=> b!103011 (= res!51476 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun b!103012 () Bool)

(assert (=> b!103012 (= e!67092 e!67091)))

(assert (=> b!103012 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun res!51478 () Bool)

(assert (=> b!103012 (= res!51478 (contains!820 lt!52445 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!103012 (=> (not res!51478) (not e!67091))))

(declare-fun b!103013 () Bool)

(assert (=> b!103013 (= e!67094 (validKeyInArray!0 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!103013 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun bm!10761 () Bool)

(assert (=> bm!10761 (= call!10764 (getCurrentListMapNoExtraKeys!105 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))))))

(declare-fun b!103014 () Bool)

(declare-fun res!51477 () Bool)

(assert (=> b!103014 (=> (not res!51477) (not e!67096))))

(assert (=> b!103014 (= res!51477 (not (contains!820 lt!52445 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!103015 () Bool)

(assert (=> b!103015 (= e!67093 call!10764)))

(declare-fun b!103016 () Bool)

(assert (=> b!103016 (= e!67095 (= lt!52445 (getCurrentListMapNoExtraKeys!105 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))))))))

(assert (= (and d!27729 c!17724) b!103010))

(assert (= (and d!27729 (not c!17724)) b!103005))

(assert (= (and b!103005 c!17727) b!103009))

(assert (= (and b!103005 (not c!17727)) b!103015))

(assert (= (or b!103009 b!103015) bm!10761))

(assert (= (and d!27729 res!51475) b!103014))

(assert (= (and b!103014 res!51477) b!103011))

(assert (= (and b!103011 res!51476) b!103013))

(assert (= (and b!103011 c!17726) b!103012))

(assert (= (and b!103011 (not c!17726)) b!103008))

(assert (= (and b!103012 res!51478) b!103006))

(assert (= (and b!103008 c!17725) b!103016))

(assert (= (and b!103008 (not c!17725)) b!103007))

(declare-fun b_lambda!4605 () Bool)

(assert (=> (not b_lambda!4605) (not b!103006)))

(assert (=> b!103006 t!5653))

(declare-fun b_and!6371 () Bool)

(assert (= b_and!6367 (and (=> t!5653 result!3401) b_and!6371)))

(assert (=> b!103006 t!5655))

(declare-fun b_and!6373 () Bool)

(assert (= b_and!6369 (and (=> t!5655 result!3405) b_and!6373)))

(declare-fun b_lambda!4607 () Bool)

(assert (=> (not b_lambda!4607) (not b!103009)))

(assert (=> b!103009 t!5653))

(declare-fun b_and!6375 () Bool)

(assert (= b_and!6371 (and (=> t!5653 result!3401) b_and!6375)))

(assert (=> b!103009 t!5655))

(declare-fun b_and!6377 () Bool)

(assert (= b_and!6373 (and (=> t!5655 result!3405) b_and!6377)))

(assert (=> b!103005 m!113881))

(assert (=> b!103005 m!113881))

(assert (=> b!103005 m!113885))

(declare-fun m!114005 () Bool)

(assert (=> d!27729 m!114005))

(assert (=> d!27729 m!113793))

(declare-fun m!114007 () Bool)

(assert (=> b!103016 m!114007))

(declare-fun m!114009 () Bool)

(assert (=> b!103014 m!114009))

(declare-fun m!114011 () Bool)

(assert (=> b!103007 m!114011))

(assert (=> b!103006 m!113771))

(assert (=> b!103006 m!113893))

(assert (=> b!103006 m!113771))

(assert (=> b!103006 m!113895))

(assert (=> b!103006 m!113893))

(assert (=> b!103006 m!113881))

(declare-fun m!114013 () Bool)

(assert (=> b!103006 m!114013))

(assert (=> b!103006 m!113881))

(declare-fun m!114015 () Bool)

(assert (=> b!103009 m!114015))

(assert (=> b!103009 m!113893))

(assert (=> b!103009 m!113771))

(assert (=> b!103009 m!113895))

(declare-fun m!114017 () Bool)

(assert (=> b!103009 m!114017))

(assert (=> b!103009 m!113893))

(declare-fun m!114019 () Bool)

(assert (=> b!103009 m!114019))

(assert (=> b!103009 m!113881))

(assert (=> b!103009 m!114015))

(declare-fun m!114021 () Bool)

(assert (=> b!103009 m!114021))

(assert (=> b!103009 m!113771))

(assert (=> b!103012 m!113881))

(assert (=> b!103012 m!113881))

(declare-fun m!114023 () Bool)

(assert (=> b!103012 m!114023))

(assert (=> bm!10761 m!114007))

(assert (=> b!103013 m!113881))

(assert (=> b!103013 m!113881))

(assert (=> b!103013 m!113885))

(assert (=> b!102701 d!27729))

(declare-fun d!27731 () Bool)

(declare-fun e!67098 () Bool)

(assert (=> d!27731 e!67098))

(declare-fun res!51479 () Bool)

(assert (=> d!27731 (=> (not res!51479) (not e!67098))))

(declare-fun lt!52451 () ListLongMap!1563)

(assert (=> d!27731 (= res!51479 (contains!820 lt!52451 (_1!1207 lt!52212)))))

(declare-fun lt!52448 () List!1606)

(assert (=> d!27731 (= lt!52451 (ListLongMap!1564 lt!52448))))

(declare-fun lt!52449 () Unit!3138)

(declare-fun lt!52450 () Unit!3138)

(assert (=> d!27731 (= lt!52449 lt!52450)))

(assert (=> d!27731 (= (getValueByKey!154 lt!52448 (_1!1207 lt!52212)) (Some!159 (_2!1207 lt!52212)))))

(assert (=> d!27731 (= lt!52450 (lemmaContainsTupThenGetReturnValue!70 lt!52448 (_1!1207 lt!52212) (_2!1207 lt!52212)))))

(assert (=> d!27731 (= lt!52448 (insertStrictlySorted!73 (toList!797 (+!139 lt!52217 lt!52214)) (_1!1207 lt!52212) (_2!1207 lt!52212)))))

(assert (=> d!27731 (= (+!139 (+!139 lt!52217 lt!52214) lt!52212) lt!52451)))

(declare-fun b!103017 () Bool)

(declare-fun res!51480 () Bool)

(assert (=> b!103017 (=> (not res!51480) (not e!67098))))

(assert (=> b!103017 (= res!51480 (= (getValueByKey!154 (toList!797 lt!52451) (_1!1207 lt!52212)) (Some!159 (_2!1207 lt!52212))))))

(declare-fun b!103018 () Bool)

(assert (=> b!103018 (= e!67098 (contains!822 (toList!797 lt!52451) lt!52212))))

(assert (= (and d!27731 res!51479) b!103017))

(assert (= (and b!103017 res!51480) b!103018))

(declare-fun m!114025 () Bool)

(assert (=> d!27731 m!114025))

(declare-fun m!114027 () Bool)

(assert (=> d!27731 m!114027))

(declare-fun m!114029 () Bool)

(assert (=> d!27731 m!114029))

(declare-fun m!114031 () Bool)

(assert (=> d!27731 m!114031))

(declare-fun m!114033 () Bool)

(assert (=> b!103017 m!114033))

(declare-fun m!114035 () Bool)

(assert (=> b!103018 m!114035))

(assert (=> b!102701 d!27731))

(declare-fun d!27733 () Bool)

(declare-fun e!67099 () Bool)

(assert (=> d!27733 e!67099))

(declare-fun res!51481 () Bool)

(assert (=> d!27733 (=> (not res!51481) (not e!67099))))

(declare-fun lt!52455 () ListLongMap!1563)

(assert (=> d!27733 (= res!51481 (contains!820 lt!52455 (_1!1207 lt!52212)))))

(declare-fun lt!52452 () List!1606)

(assert (=> d!27733 (= lt!52455 (ListLongMap!1564 lt!52452))))

(declare-fun lt!52453 () Unit!3138)

(declare-fun lt!52454 () Unit!3138)

(assert (=> d!27733 (= lt!52453 lt!52454)))

(assert (=> d!27733 (= (getValueByKey!154 lt!52452 (_1!1207 lt!52212)) (Some!159 (_2!1207 lt!52212)))))

(assert (=> d!27733 (= lt!52454 (lemmaContainsTupThenGetReturnValue!70 lt!52452 (_1!1207 lt!52212) (_2!1207 lt!52212)))))

(assert (=> d!27733 (= lt!52452 (insertStrictlySorted!73 (toList!797 lt!52217) (_1!1207 lt!52212) (_2!1207 lt!52212)))))

(assert (=> d!27733 (= (+!139 lt!52217 lt!52212) lt!52455)))

(declare-fun b!103019 () Bool)

(declare-fun res!51482 () Bool)

(assert (=> b!103019 (=> (not res!51482) (not e!67099))))

(assert (=> b!103019 (= res!51482 (= (getValueByKey!154 (toList!797 lt!52455) (_1!1207 lt!52212)) (Some!159 (_2!1207 lt!52212))))))

(declare-fun b!103020 () Bool)

(assert (=> b!103020 (= e!67099 (contains!822 (toList!797 lt!52455) lt!52212))))

(assert (= (and d!27733 res!51481) b!103019))

(assert (= (and b!103019 res!51482) b!103020))

(declare-fun m!114037 () Bool)

(assert (=> d!27733 m!114037))

(declare-fun m!114039 () Bool)

(assert (=> d!27733 m!114039))

(declare-fun m!114041 () Bool)

(assert (=> d!27733 m!114041))

(declare-fun m!114043 () Bool)

(assert (=> d!27733 m!114043))

(declare-fun m!114045 () Bool)

(assert (=> b!103019 m!114045))

(declare-fun m!114047 () Bool)

(assert (=> b!103020 m!114047))

(assert (=> b!102701 d!27733))

(declare-fun d!27735 () Bool)

(declare-fun e!67100 () Bool)

(assert (=> d!27735 e!67100))

(declare-fun res!51483 () Bool)

(assert (=> d!27735 (=> (not res!51483) (not e!67100))))

(declare-fun lt!52459 () ListLongMap!1563)

(assert (=> d!27735 (= res!51483 (contains!820 lt!52459 (_1!1207 lt!52214)))))

(declare-fun lt!52456 () List!1606)

(assert (=> d!27735 (= lt!52459 (ListLongMap!1564 lt!52456))))

(declare-fun lt!52457 () Unit!3138)

(declare-fun lt!52458 () Unit!3138)

(assert (=> d!27735 (= lt!52457 lt!52458)))

(assert (=> d!27735 (= (getValueByKey!154 lt!52456 (_1!1207 lt!52214)) (Some!159 (_2!1207 lt!52214)))))

(assert (=> d!27735 (= lt!52458 (lemmaContainsTupThenGetReturnValue!70 lt!52456 (_1!1207 lt!52214) (_2!1207 lt!52214)))))

(assert (=> d!27735 (= lt!52456 (insertStrictlySorted!73 (toList!797 (+!139 lt!52217 lt!52212)) (_1!1207 lt!52214) (_2!1207 lt!52214)))))

(assert (=> d!27735 (= (+!139 (+!139 lt!52217 lt!52212) lt!52214) lt!52459)))

(declare-fun b!103021 () Bool)

(declare-fun res!51484 () Bool)

(assert (=> b!103021 (=> (not res!51484) (not e!67100))))

(assert (=> b!103021 (= res!51484 (= (getValueByKey!154 (toList!797 lt!52459) (_1!1207 lt!52214)) (Some!159 (_2!1207 lt!52214))))))

(declare-fun b!103022 () Bool)

(assert (=> b!103022 (= e!67100 (contains!822 (toList!797 lt!52459) lt!52214))))

(assert (= (and d!27735 res!51483) b!103021))

(assert (= (and b!103021 res!51484) b!103022))

(declare-fun m!114049 () Bool)

(assert (=> d!27735 m!114049))

(declare-fun m!114051 () Bool)

(assert (=> d!27735 m!114051))

(declare-fun m!114053 () Bool)

(assert (=> d!27735 m!114053))

(declare-fun m!114055 () Bool)

(assert (=> d!27735 m!114055))

(declare-fun m!114057 () Bool)

(assert (=> b!103021 m!114057))

(declare-fun m!114059 () Bool)

(assert (=> b!103022 m!114059))

(assert (=> b!102701 d!27735))

(declare-fun d!27737 () Bool)

(assert (=> d!27737 (= (+!139 (+!139 lt!52217 (tuple2!2393 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52215)) (tuple2!2393 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2432 (v!2868 (underlying!355 thiss!992))))) (+!139 (+!139 lt!52217 (tuple2!2393 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2432 (v!2868 (underlying!355 thiss!992))))) (tuple2!2393 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52215)))))

(declare-fun lt!52462 () Unit!3138)

(declare-fun choose!635 (ListLongMap!1563 (_ BitVec 64) V!3203 (_ BitVec 64) V!3203) Unit!3138)

(assert (=> d!27737 (= lt!52462 (choose!635 lt!52217 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2432 (v!2868 (underlying!355 thiss!992)))))))

(assert (=> d!27737 (not (= (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27737 (= (addCommutativeForDiffKeys!51 lt!52217 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) lt!52215 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2432 (v!2868 (underlying!355 thiss!992)))) lt!52462)))

(declare-fun bs!4236 () Bool)

(assert (= bs!4236 d!27737))

(declare-fun m!114061 () Bool)

(assert (=> bs!4236 m!114061))

(declare-fun m!114063 () Bool)

(assert (=> bs!4236 m!114063))

(assert (=> bs!4236 m!113761))

(declare-fun m!114065 () Bool)

(assert (=> bs!4236 m!114065))

(declare-fun m!114067 () Bool)

(assert (=> bs!4236 m!114067))

(assert (=> bs!4236 m!114061))

(assert (=> bs!4236 m!114067))

(declare-fun m!114069 () Bool)

(assert (=> bs!4236 m!114069))

(assert (=> b!102701 d!27737))

(declare-fun d!27739 () Bool)

(assert (=> d!27739 (= (validMask!0 (mask!6688 (v!2868 (underlying!355 thiss!992)))) (and (or (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000001111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000011111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000001111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000011111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000001111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000011111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000001111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000011111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000000111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000001111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000011111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000000111111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000001111111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000011111111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000000111111111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000001111111111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000011111111111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000000111111111111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000001111111111111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000011111111111111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00000111111111111111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00001111111111111111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00011111111111111111111111111111) (= (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6688 (v!2868 (underlying!355 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!102701 d!27739))

(declare-fun d!27741 () Bool)

(assert (=> d!27741 (= (array_inv!1289 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvsge (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!102706 d!27741))

(declare-fun d!27743 () Bool)

(assert (=> d!27743 (= (array_inv!1290 (_values!2538 (v!2868 (underlying!355 thiss!992)))) (bvsge (size!2306 (_values!2538 (v!2868 (underlying!355 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!102706 d!27743))

(declare-fun d!27745 () Bool)

(declare-fun c!17730 () Bool)

(assert (=> d!27745 (= c!17730 ((_ is ValueCellFull!990) (select (arr!2052 (_values!2538 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun e!67103 () V!3203)

(assert (=> d!27745 (= (get!1317 (select (arr!2052 (_values!2538 (v!2868 (underlying!355 thiss!992)))) from!355) (dynLambda!381 (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!67103)))

(declare-fun b!103027 () Bool)

(declare-fun get!1319 (ValueCell!990 V!3203) V!3203)

(assert (=> b!103027 (= e!67103 (get!1319 (select (arr!2052 (_values!2538 (v!2868 (underlying!355 thiss!992)))) from!355) (dynLambda!381 (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!103028 () Bool)

(declare-fun get!1320 (ValueCell!990 V!3203) V!3203)

(assert (=> b!103028 (= e!67103 (get!1320 (select (arr!2052 (_values!2538 (v!2868 (underlying!355 thiss!992)))) from!355) (dynLambda!381 (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27745 c!17730) b!103027))

(assert (= (and d!27745 (not c!17730)) b!103028))

(assert (=> b!103027 m!113769))

(assert (=> b!103027 m!113771))

(declare-fun m!114071 () Bool)

(assert (=> b!103027 m!114071))

(assert (=> b!103028 m!113769))

(assert (=> b!103028 m!113771))

(declare-fun m!114073 () Bool)

(assert (=> b!103028 m!114073))

(assert (=> b!102707 d!27745))

(declare-fun d!27747 () Bool)

(assert (=> d!27747 (= (array_inv!1289 (_keys!4257 newMap!16)) (bvsge (size!2305 (_keys!4257 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!102698 d!27747))

(declare-fun d!27749 () Bool)

(assert (=> d!27749 (= (array_inv!1290 (_values!2538 newMap!16)) (bvsge (size!2306 (_values!2538 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!102698 d!27749))

(declare-fun d!27751 () Bool)

(assert (=> d!27751 (not (arrayContainsKey!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!52465 () Unit!3138)

(declare-fun choose!68 (array!4321 (_ BitVec 32) (_ BitVec 64) List!1607) Unit!3138)

(assert (=> d!27751 (= lt!52465 (choose!68 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (Cons!1603 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) Nil!1604)))))

(assert (=> d!27751 (bvslt (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27751 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (Cons!1603 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) Nil!1604)) lt!52465)))

(declare-fun bs!4237 () Bool)

(assert (= bs!4237 d!27751))

(assert (=> bs!4237 m!113761))

(assert (=> bs!4237 m!113781))

(assert (=> bs!4237 m!113761))

(declare-fun m!114075 () Bool)

(assert (=> bs!4237 m!114075))

(assert (=> b!102708 d!27751))

(declare-fun d!27753 () Bool)

(assert (=> d!27753 (arrayNoDuplicates!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) from!355 Nil!1604)))

(declare-fun lt!52468 () Unit!3138)

(declare-fun choose!39 (array!4321 (_ BitVec 32) (_ BitVec 32)) Unit!3138)

(assert (=> d!27753 (= lt!52468 (choose!39 (_keys!4257 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!27753 (bvslt (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27753 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000000 from!355) lt!52468)))

(declare-fun bs!4238 () Bool)

(assert (= bs!4238 d!27753))

(assert (=> bs!4238 m!113777))

(declare-fun m!114077 () Bool)

(assert (=> bs!4238 m!114077))

(assert (=> b!102708 d!27753))

(declare-fun d!27755 () Bool)

(declare-fun res!51489 () Bool)

(declare-fun e!67108 () Bool)

(assert (=> d!27755 (=> res!51489 e!67108)))

(assert (=> d!27755 (= res!51489 (= (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(assert (=> d!27755 (= (arrayContainsKey!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!67108)))

(declare-fun b!103033 () Bool)

(declare-fun e!67109 () Bool)

(assert (=> b!103033 (= e!67108 e!67109)))

(declare-fun res!51490 () Bool)

(assert (=> b!103033 (=> (not res!51490) (not e!67109))))

(assert (=> b!103033 (= res!51490 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))))))

(declare-fun b!103034 () Bool)

(assert (=> b!103034 (= e!67109 (arrayContainsKey!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!27755 (not res!51489)) b!103033))

(assert (= (and b!103033 res!51490) b!103034))

(assert (=> d!27755 m!113881))

(assert (=> b!103034 m!113761))

(declare-fun m!114079 () Bool)

(assert (=> b!103034 m!114079))

(assert (=> b!102708 d!27755))

(declare-fun d!27757 () Bool)

(declare-fun e!67112 () Bool)

(assert (=> d!27757 e!67112))

(declare-fun c!17733 () Bool)

(assert (=> d!27757 (= c!17733 (and (not (= (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!52471 () Unit!3138)

(declare-fun choose!636 (array!4321 array!4323 (_ BitVec 32) (_ BitVec 32) V!3203 V!3203 (_ BitVec 64) (_ BitVec 32) Int) Unit!3138)

(assert (=> d!27757 (= lt!52471 (choose!636 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))))))

(assert (=> d!27757 (validMask!0 (mask!6688 (v!2868 (underlying!355 thiss!992))))))

(assert (=> d!27757 (= (lemmaListMapContainsThenArrayContainsFrom!101 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (_values!2538 (v!2868 (underlying!355 thiss!992))) (mask!6688 (v!2868 (underlying!355 thiss!992))) (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) (zeroValue!2432 (v!2868 (underlying!355 thiss!992))) (minValue!2432 (v!2868 (underlying!355 thiss!992))) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992)))) lt!52471)))

(declare-fun b!103039 () Bool)

(assert (=> b!103039 (= e!67112 (arrayContainsKey!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!103040 () Bool)

(assert (=> b!103040 (= e!67112 (ite (= (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2364 (v!2868 (underlying!355 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27757 c!17733) b!103039))

(assert (= (and d!27757 (not c!17733)) b!103040))

(assert (=> d!27757 m!113761))

(declare-fun m!114081 () Bool)

(assert (=> d!27757 m!114081))

(assert (=> d!27757 m!113793))

(assert (=> b!103039 m!113761))

(assert (=> b!103039 m!113781))

(assert (=> b!102708 d!27757))

(declare-fun d!27759 () Bool)

(declare-fun res!51499 () Bool)

(declare-fun e!67123 () Bool)

(assert (=> d!27759 (=> res!51499 e!67123)))

(assert (=> d!27759 (= res!51499 (bvsge from!355 (size!2305 (_keys!4257 (v!2868 (underlying!355 thiss!992))))))))

(assert (=> d!27759 (= (arrayNoDuplicates!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) from!355 Nil!1604) e!67123)))

(declare-fun b!103051 () Bool)

(declare-fun e!67122 () Bool)

(assert (=> b!103051 (= e!67123 e!67122)))

(declare-fun res!51498 () Bool)

(assert (=> b!103051 (=> (not res!51498) (not e!67122))))

(declare-fun e!67121 () Bool)

(assert (=> b!103051 (= res!51498 (not e!67121))))

(declare-fun res!51497 () Bool)

(assert (=> b!103051 (=> (not res!51497) (not e!67121))))

(assert (=> b!103051 (= res!51497 (validKeyInArray!0 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun call!10767 () Bool)

(declare-fun bm!10764 () Bool)

(declare-fun c!17736 () Bool)

(assert (=> bm!10764 (= call!10767 (arrayNoDuplicates!0 (_keys!4257 (v!2868 (underlying!355 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17736 (Cons!1603 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355) Nil!1604) Nil!1604)))))

(declare-fun b!103052 () Bool)

(declare-fun e!67124 () Bool)

(assert (=> b!103052 (= e!67124 call!10767)))

(declare-fun b!103053 () Bool)

(assert (=> b!103053 (= e!67124 call!10767)))

(declare-fun b!103054 () Bool)

(assert (=> b!103054 (= e!67122 e!67124)))

(assert (=> b!103054 (= c!17736 (validKeyInArray!0 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(declare-fun b!103055 () Bool)

(declare-fun contains!823 (List!1607 (_ BitVec 64)) Bool)

(assert (=> b!103055 (= e!67121 (contains!823 Nil!1604 (select (arr!2051 (_keys!4257 (v!2868 (underlying!355 thiss!992)))) from!355)))))

(assert (= (and d!27759 (not res!51499)) b!103051))

(assert (= (and b!103051 res!51497) b!103055))

(assert (= (and b!103051 res!51498) b!103054))

(assert (= (and b!103054 c!17736) b!103053))

(assert (= (and b!103054 (not c!17736)) b!103052))

(assert (= (or b!103053 b!103052) bm!10764))

(assert (=> b!103051 m!113761))

(assert (=> b!103051 m!113761))

(declare-fun m!114083 () Bool)

(assert (=> b!103051 m!114083))

(assert (=> bm!10764 m!113761))

(declare-fun m!114085 () Bool)

(assert (=> bm!10764 m!114085))

(assert (=> b!103054 m!113761))

(assert (=> b!103054 m!113761))

(assert (=> b!103054 m!114083))

(assert (=> b!103055 m!113761))

(assert (=> b!103055 m!113761))

(declare-fun m!114087 () Bool)

(assert (=> b!103055 m!114087))

(assert (=> b!102708 d!27759))

(declare-fun d!27761 () Bool)

(assert (=> d!27761 (= (valid!413 thiss!992) (valid!414 (v!2868 (underlying!355 thiss!992))))))

(declare-fun bs!4239 () Bool)

(assert (= bs!4239 d!27761))

(declare-fun m!114089 () Bool)

(assert (=> bs!4239 m!114089))

(assert (=> start!12148 d!27761))

(declare-fun mapIsEmpty!3891 () Bool)

(declare-fun mapRes!3891 () Bool)

(assert (=> mapIsEmpty!3891 mapRes!3891))

(declare-fun b!103063 () Bool)

(declare-fun e!67130 () Bool)

(assert (=> b!103063 (= e!67130 tp_is_empty!2667)))

(declare-fun condMapEmpty!3891 () Bool)

(declare-fun mapDefault!3891 () ValueCell!990)

(assert (=> mapNonEmpty!3881 (= condMapEmpty!3891 (= mapRest!3881 ((as const (Array (_ BitVec 32) ValueCell!990)) mapDefault!3891)))))

(assert (=> mapNonEmpty!3881 (= tp!9816 (and e!67130 mapRes!3891))))

(declare-fun b!103062 () Bool)

(declare-fun e!67129 () Bool)

(assert (=> b!103062 (= e!67129 tp_is_empty!2667)))

(declare-fun mapNonEmpty!3891 () Bool)

(declare-fun tp!9831 () Bool)

(assert (=> mapNonEmpty!3891 (= mapRes!3891 (and tp!9831 e!67129))))

(declare-fun mapValue!3891 () ValueCell!990)

(declare-fun mapRest!3891 () (Array (_ BitVec 32) ValueCell!990))

(declare-fun mapKey!3891 () (_ BitVec 32))

(assert (=> mapNonEmpty!3891 (= mapRest!3881 (store mapRest!3891 mapKey!3891 mapValue!3891))))

(assert (= (and mapNonEmpty!3881 condMapEmpty!3891) mapIsEmpty!3891))

(assert (= (and mapNonEmpty!3881 (not condMapEmpty!3891)) mapNonEmpty!3891))

(assert (= (and mapNonEmpty!3891 ((_ is ValueCellFull!990) mapValue!3891)) b!103062))

(assert (= (and mapNonEmpty!3881 ((_ is ValueCellFull!990) mapDefault!3891)) b!103063))

(declare-fun m!114091 () Bool)

(assert (=> mapNonEmpty!3891 m!114091))

(declare-fun mapIsEmpty!3892 () Bool)

(declare-fun mapRes!3892 () Bool)

(assert (=> mapIsEmpty!3892 mapRes!3892))

(declare-fun b!103065 () Bool)

(declare-fun e!67132 () Bool)

(assert (=> b!103065 (= e!67132 tp_is_empty!2667)))

(declare-fun condMapEmpty!3892 () Bool)

(declare-fun mapDefault!3892 () ValueCell!990)

(assert (=> mapNonEmpty!3882 (= condMapEmpty!3892 (= mapRest!3882 ((as const (Array (_ BitVec 32) ValueCell!990)) mapDefault!3892)))))

(assert (=> mapNonEmpty!3882 (= tp!9814 (and e!67132 mapRes!3892))))

(declare-fun b!103064 () Bool)

(declare-fun e!67131 () Bool)

(assert (=> b!103064 (= e!67131 tp_is_empty!2667)))

(declare-fun mapNonEmpty!3892 () Bool)

(declare-fun tp!9832 () Bool)

(assert (=> mapNonEmpty!3892 (= mapRes!3892 (and tp!9832 e!67131))))

(declare-fun mapKey!3892 () (_ BitVec 32))

(declare-fun mapRest!3892 () (Array (_ BitVec 32) ValueCell!990))

(declare-fun mapValue!3892 () ValueCell!990)

(assert (=> mapNonEmpty!3892 (= mapRest!3882 (store mapRest!3892 mapKey!3892 mapValue!3892))))

(assert (= (and mapNonEmpty!3882 condMapEmpty!3892) mapIsEmpty!3892))

(assert (= (and mapNonEmpty!3882 (not condMapEmpty!3892)) mapNonEmpty!3892))

(assert (= (and mapNonEmpty!3892 ((_ is ValueCellFull!990) mapValue!3892)) b!103064))

(assert (= (and mapNonEmpty!3882 ((_ is ValueCellFull!990) mapDefault!3892)) b!103065))

(declare-fun m!114093 () Bool)

(assert (=> mapNonEmpty!3892 m!114093))

(declare-fun b_lambda!4609 () Bool)

(assert (= b_lambda!4605 (or (and b!102706 b_free!2501) (and b!102698 b_free!2503 (= (defaultEntry!2555 newMap!16) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))))) b_lambda!4609)))

(declare-fun b_lambda!4611 () Bool)

(assert (= b_lambda!4607 (or (and b!102706 b_free!2501) (and b!102698 b_free!2503 (= (defaultEntry!2555 newMap!16) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))))) b_lambda!4611)))

(declare-fun b_lambda!4613 () Bool)

(assert (= b_lambda!4603 (or (and b!102706 b_free!2501) (and b!102698 b_free!2503 (= (defaultEntry!2555 newMap!16) (defaultEntry!2555 (v!2868 (underlying!355 thiss!992))))) b_lambda!4613)))

(check-sat (not bm!10761) (not d!27717) (not b!102781) (not d!27751) (not b!102852) (not bm!10753) (not b!102972) (not b!102942) (not d!27725) (not bm!10682) (not b!102782) (not mapNonEmpty!3892) (not bm!10751) (not d!27753) (not b_lambda!4611) (not b_next!2501) (not b!102979) (not bm!10735) (not bm!10683) (not d!27721) (not b!102836) (not b!103009) (not b!103051) (not b!102835) (not b!102837) (not b_lambda!4601) (not b!102832) (not b!102780) (not b!103007) (not bm!10746) (not b!103014) (not b!103055) (not b!102962) (not d!27733) (not b!103012) (not b!103022) (not b!102970) (not b!103019) (not d!27729) tp_is_empty!2667 (not b!102840) (not d!27757) (not b!103054) (not d!27727) (not b_lambda!4609) (not b!102957) (not b_next!2503) (not b!103017) (not bm!10739) (not b!103006) (not bm!10680) (not d!27761) (not d!27735) (not b_lambda!4613) (not d!27737) (not b!103027) (not d!27719) (not b!102828) (not b!102854) (not bm!10750) b_and!6377 (not bm!10755) (not bm!10686) (not mapNonEmpty!3891) (not b!103016) b_and!6375 (not b!103034) (not b!102830) (not d!27723) (not b!103021) (not b!103039) (not b!103018) (not b!103005) (not bm!10758) (not b!103028) (not bm!10764) (not bm!10744) (not bm!10757) (not d!27731) (not b!102980) (not b!103020) (not b!102947) (not b!102839) (not bm!10745) (not b!103013) (not bm!10738))
(check-sat b_and!6375 b_and!6377 (not b_next!2501) (not b_next!2503))
