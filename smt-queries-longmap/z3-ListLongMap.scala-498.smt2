; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11274 () Bool)

(assert start!11274)

(declare-fun b!92925 () Bool)

(declare-fun b_free!2365 () Bool)

(declare-fun b_next!2365 () Bool)

(assert (=> b!92925 (= b_free!2365 (not b_next!2365))))

(declare-fun tp!9353 () Bool)

(declare-fun b_and!5653 () Bool)

(assert (=> b!92925 (= tp!9353 b_and!5653)))

(declare-fun b!92922 () Bool)

(declare-fun b_free!2367 () Bool)

(declare-fun b_next!2367 () Bool)

(assert (=> b!92922 (= b_free!2367 (not b_next!2367))))

(declare-fun tp!9354 () Bool)

(declare-fun b_and!5655 () Bool)

(assert (=> b!92922 (= tp!9354 b_and!5655)))

(declare-fun b!92914 () Bool)

(declare-fun e!60639 () Bool)

(declare-fun e!60650 () Bool)

(declare-fun mapRes!3625 () Bool)

(assert (=> b!92914 (= e!60639 (and e!60650 mapRes!3625))))

(declare-fun condMapEmpty!3625 () Bool)

(declare-datatypes ((V!3113 0))(
  ( (V!3114 (val!1344 Int)) )
))
(declare-datatypes ((array!4155 0))(
  ( (array!4156 (arr!1976 (Array (_ BitVec 32) (_ BitVec 64))) (size!2224 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!956 0))(
  ( (ValueCellFull!956 (v!2747 V!3113)) (EmptyCell!956) )
))
(declare-datatypes ((array!4157 0))(
  ( (array!4158 (arr!1977 (Array (_ BitVec 32) ValueCell!956)) (size!2225 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!820 0))(
  ( (LongMapFixedSize!821 (defaultEntry!2424 Int) (mask!6494 (_ BitVec 32)) (extraKeys!2253 (_ BitVec 32)) (zeroValue!2311 V!3113) (minValue!2311 V!3113) (_size!459 (_ BitVec 32)) (_keys!4106 array!4155) (_values!2407 array!4157) (_vacant!459 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!626 0))(
  ( (Cell!627 (v!2748 LongMapFixedSize!820)) )
))
(declare-datatypes ((LongMap!626 0))(
  ( (LongMap!627 (underlying!324 Cell!626)) )
))
(declare-fun thiss!992 () LongMap!626)

(declare-fun mapDefault!3625 () ValueCell!956)

(assert (=> b!92914 (= condMapEmpty!3625 (= (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!956)) mapDefault!3625)))))

(declare-fun b!92915 () Bool)

(declare-fun e!60644 () Bool)

(declare-fun tp_is_empty!2599 () Bool)

(assert (=> b!92915 (= e!60644 tp_is_empty!2599)))

(declare-fun b!92916 () Bool)

(declare-fun e!60643 () Bool)

(assert (=> b!92916 (= e!60643 tp_is_empty!2599)))

(declare-fun b!92917 () Bool)

(assert (=> b!92917 (= e!60650 tp_is_empty!2599)))

(declare-fun b!92918 () Bool)

(declare-fun e!60646 () Bool)

(declare-fun e!60649 () Bool)

(assert (=> b!92918 (= e!60646 e!60649)))

(declare-fun res!47206 () Bool)

(assert (=> b!92918 (=> res!47206 e!60649)))

(declare-datatypes ((tuple2!2268 0))(
  ( (tuple2!2269 (_1!1145 Bool) (_2!1145 LongMapFixedSize!820)) )
))
(declare-fun lt!45787 () tuple2!2268)

(assert (=> b!92918 (= res!47206 (not (_1!1145 lt!45787)))))

(declare-fun lt!45792 () tuple2!2268)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun repackFrom!10 (LongMap!626 LongMapFixedSize!820 (_ BitVec 32)) tuple2!2268)

(assert (=> b!92918 (= lt!45787 (repackFrom!10 thiss!992 (_2!1145 lt!45792) (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!92919 () Bool)

(declare-fun res!47207 () Bool)

(declare-fun e!60642 () Bool)

(assert (=> b!92919 (=> (not res!47207) (not e!60642))))

(declare-fun newMap!16 () LongMapFixedSize!820)

(assert (=> b!92919 (= res!47207 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6494 newMap!16)) (_size!459 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun b!92920 () Bool)

(declare-fun res!47213 () Bool)

(assert (=> b!92920 (=> res!47213 e!60649)))

(declare-fun valid!377 (LongMapFixedSize!820) Bool)

(assert (=> b!92920 (= res!47213 (not (valid!377 (_2!1145 lt!45787))))))

(declare-fun mapNonEmpty!3625 () Bool)

(declare-fun tp!9356 () Bool)

(assert (=> mapNonEmpty!3625 (= mapRes!3625 (and tp!9356 e!60644))))

(declare-fun mapKey!3625 () (_ BitVec 32))

(declare-fun mapRest!3626 () (Array (_ BitVec 32) ValueCell!956))

(declare-fun mapValue!3625 () ValueCell!956)

(assert (=> mapNonEmpty!3625 (= (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) (store mapRest!3626 mapKey!3625 mapValue!3625))))

(declare-fun b!92921 () Bool)

(declare-fun e!60640 () Bool)

(assert (=> b!92921 (= e!60640 (not e!60646))))

(declare-fun res!47211 () Bool)

(assert (=> b!92921 (=> res!47211 e!60646)))

(declare-datatypes ((tuple2!2270 0))(
  ( (tuple2!2271 (_1!1146 (_ BitVec 64)) (_2!1146 V!3113)) )
))
(declare-datatypes ((List!1548 0))(
  ( (Nil!1545) (Cons!1544 (h!2136 tuple2!2270) (t!5418 List!1548)) )
))
(declare-datatypes ((ListLongMap!1483 0))(
  ( (ListLongMap!1484 (toList!757 List!1548)) )
))
(declare-fun getCurrentListMap!447 (array!4155 array!4157 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 32) Int) ListLongMap!1483)

(declare-fun map!1235 (LongMapFixedSize!820) ListLongMap!1483)

(assert (=> b!92921 (= res!47211 (not (= (getCurrentListMap!447 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) from!355 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))) (map!1235 (_2!1145 lt!45792)))))))

(declare-fun lt!45776 () tuple2!2270)

(declare-fun lt!45777 () ListLongMap!1483)

(declare-fun lt!45775 () tuple2!2270)

(declare-fun lt!45791 () ListLongMap!1483)

(declare-fun +!126 (ListLongMap!1483 tuple2!2270) ListLongMap!1483)

(assert (=> b!92921 (= (+!126 lt!45777 lt!45776) (+!126 (+!126 lt!45791 lt!45776) lt!45775))))

(assert (=> b!92921 (= lt!45776 (tuple2!2271 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2748 (underlying!324 thiss!992)))))))

(declare-datatypes ((Unit!2761 0))(
  ( (Unit!2762) )
))
(declare-fun lt!45785 () Unit!2761)

(declare-fun lt!45790 () V!3113)

(declare-fun addCommutativeForDiffKeys!46 (ListLongMap!1483 (_ BitVec 64) V!3113 (_ BitVec 64) V!3113) Unit!2761)

(assert (=> b!92921 (= lt!45785 (addCommutativeForDiffKeys!46 lt!45791 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun lt!45774 () ListLongMap!1483)

(assert (=> b!92921 (= lt!45774 lt!45777)))

(assert (=> b!92921 (= lt!45777 (+!126 lt!45791 lt!45775))))

(declare-fun lt!45788 () ListLongMap!1483)

(declare-fun lt!45778 () tuple2!2270)

(assert (=> b!92921 (= lt!45774 (+!126 lt!45788 lt!45778))))

(declare-fun lt!45784 () ListLongMap!1483)

(assert (=> b!92921 (= lt!45791 (+!126 lt!45784 lt!45778))))

(assert (=> b!92921 (= lt!45778 (tuple2!2271 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))))))

(assert (=> b!92921 (= lt!45788 (+!126 lt!45784 lt!45775))))

(assert (=> b!92921 (= lt!45775 (tuple2!2271 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790))))

(declare-fun lt!45789 () Unit!2761)

(assert (=> b!92921 (= lt!45789 (addCommutativeForDiffKeys!46 lt!45784 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!91 (array!4155 array!4157 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 32) Int) ListLongMap!1483)

(assert (=> b!92921 (= lt!45784 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun e!60635 () Bool)

(declare-fun e!60647 () Bool)

(declare-fun array_inv!1219 (array!4155) Bool)

(declare-fun array_inv!1220 (array!4157) Bool)

(assert (=> b!92922 (= e!60647 (and tp!9354 tp_is_empty!2599 (array_inv!1219 (_keys!4106 newMap!16)) (array_inv!1220 (_values!2407 newMap!16)) e!60635))))

(declare-fun b!92923 () Bool)

(declare-fun mapRes!3626 () Bool)

(assert (=> b!92923 (= e!60635 (and e!60643 mapRes!3626))))

(declare-fun condMapEmpty!3626 () Bool)

(declare-fun mapDefault!3626 () ValueCell!956)

(assert (=> b!92923 (= condMapEmpty!3626 (= (arr!1977 (_values!2407 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!956)) mapDefault!3626)))))

(declare-fun b!92924 () Bool)

(declare-fun e!60652 () Bool)

(assert (=> b!92924 (= e!60652 e!60640)))

(declare-fun res!47212 () Bool)

(assert (=> b!92924 (=> (not res!47212) (not e!60640))))

(assert (=> b!92924 (= res!47212 (and (_1!1145 lt!45792) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!45782 () Unit!2761)

(declare-fun e!60651 () Unit!2761)

(assert (=> b!92924 (= lt!45782 e!60651)))

(declare-fun c!15449 () Bool)

(declare-fun lt!45781 () ListLongMap!1483)

(declare-fun contains!775 (ListLongMap!1483 (_ BitVec 64)) Bool)

(assert (=> b!92924 (= c!15449 (contains!775 lt!45781 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(declare-fun update!139 (LongMapFixedSize!820 (_ BitVec 64) V!3113) tuple2!2268)

(assert (=> b!92924 (= lt!45792 (update!139 newMap!16 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790))))

(declare-fun e!60645 () Bool)

(assert (=> b!92925 (= e!60645 (and tp!9353 tp_is_empty!2599 (array_inv!1219 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (array_inv!1220 (_values!2407 (v!2748 (underlying!324 thiss!992)))) e!60639))))

(declare-fun res!47208 () Bool)

(assert (=> start!11274 (=> (not res!47208) (not e!60642))))

(declare-fun valid!378 (LongMap!626) Bool)

(assert (=> start!11274 (= res!47208 (valid!378 thiss!992))))

(assert (=> start!11274 e!60642))

(declare-fun e!60636 () Bool)

(assert (=> start!11274 e!60636))

(assert (=> start!11274 true))

(assert (=> start!11274 e!60647))

(declare-fun b!92926 () Bool)

(declare-fun e!60641 () Bool)

(assert (=> b!92926 (= e!60636 e!60641)))

(declare-fun b!92927 () Bool)

(declare-fun Unit!2763 () Unit!2761)

(assert (=> b!92927 (= e!60651 Unit!2763)))

(declare-fun lt!45779 () Unit!2761)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!78 (array!4155 array!4157 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 64) (_ BitVec 32) Int) Unit!2761)

(assert (=> b!92927 (= lt!45779 (lemmaListMapContainsThenArrayContainsFrom!78 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!92927 (arrayContainsKey!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!45783 () Unit!2761)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4155 (_ BitVec 32) (_ BitVec 32)) Unit!2761)

(assert (=> b!92927 (= lt!45783 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1549 0))(
  ( (Nil!1546) (Cons!1545 (h!2137 (_ BitVec 64)) (t!5419 List!1549)) )
))
(declare-fun arrayNoDuplicates!0 (array!4155 (_ BitVec 32) List!1549) Bool)

(assert (=> b!92927 (arrayNoDuplicates!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) from!355 Nil!1546)))

(declare-fun lt!45780 () Unit!2761)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4155 (_ BitVec 32) (_ BitVec 64) List!1549) Unit!2761)

(assert (=> b!92927 (= lt!45780 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (Cons!1545 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) Nil!1546)))))

(assert (=> b!92927 false))

(declare-fun b!92928 () Bool)

(declare-fun e!60648 () Bool)

(assert (=> b!92928 (= e!60648 e!60652)))

(declare-fun res!47209 () Bool)

(assert (=> b!92928 (=> (not res!47209) (not e!60652))))

(assert (=> b!92928 (= res!47209 (and (not (= (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1262 (ValueCell!956 V!3113) V!3113)

(declare-fun dynLambda!364 (Int (_ BitVec 64)) V!3113)

(assert (=> b!92928 (= lt!45790 (get!1262 (select (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) from!355) (dynLambda!364 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92929 () Bool)

(declare-fun res!47214 () Bool)

(assert (=> b!92929 (=> (not res!47214) (not e!60642))))

(assert (=> b!92929 (= res!47214 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992)))))))))

(declare-fun mapNonEmpty!3626 () Bool)

(declare-fun tp!9355 () Bool)

(declare-fun e!60638 () Bool)

(assert (=> mapNonEmpty!3626 (= mapRes!3626 (and tp!9355 e!60638))))

(declare-fun mapRest!3625 () (Array (_ BitVec 32) ValueCell!956))

(declare-fun mapKey!3626 () (_ BitVec 32))

(declare-fun mapValue!3626 () ValueCell!956)

(assert (=> mapNonEmpty!3626 (= (arr!1977 (_values!2407 newMap!16)) (store mapRest!3625 mapKey!3626 mapValue!3626))))

(declare-fun b!92930 () Bool)

(assert (=> b!92930 (= e!60638 tp_is_empty!2599)))

(declare-fun b!92931 () Bool)

(assert (=> b!92931 (= e!60649 (valid!377 (v!2748 (underlying!324 thiss!992))))))

(declare-fun b!92932 () Bool)

(assert (=> b!92932 (= e!60641 e!60645)))

(declare-fun b!92933 () Bool)

(declare-fun res!47210 () Bool)

(assert (=> b!92933 (=> (not res!47210) (not e!60642))))

(assert (=> b!92933 (= res!47210 (valid!377 newMap!16))))

(declare-fun b!92934 () Bool)

(declare-fun Unit!2764 () Unit!2761)

(assert (=> b!92934 (= e!60651 Unit!2764)))

(declare-fun mapIsEmpty!3625 () Bool)

(assert (=> mapIsEmpty!3625 mapRes!3626))

(declare-fun b!92935 () Bool)

(assert (=> b!92935 (= e!60642 e!60648)))

(declare-fun res!47215 () Bool)

(assert (=> b!92935 (=> (not res!47215) (not e!60648))))

(declare-fun lt!45786 () ListLongMap!1483)

(assert (=> b!92935 (= res!47215 (= lt!45786 lt!45781))))

(assert (=> b!92935 (= lt!45781 (map!1235 newMap!16))))

(assert (=> b!92935 (= lt!45786 (getCurrentListMap!447 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun mapIsEmpty!3626 () Bool)

(assert (=> mapIsEmpty!3626 mapRes!3625))

(assert (= (and start!11274 res!47208) b!92929))

(assert (= (and b!92929 res!47214) b!92933))

(assert (= (and b!92933 res!47210) b!92919))

(assert (= (and b!92919 res!47207) b!92935))

(assert (= (and b!92935 res!47215) b!92928))

(assert (= (and b!92928 res!47209) b!92924))

(assert (= (and b!92924 c!15449) b!92927))

(assert (= (and b!92924 (not c!15449)) b!92934))

(assert (= (and b!92924 res!47212) b!92921))

(assert (= (and b!92921 (not res!47211)) b!92918))

(assert (= (and b!92918 (not res!47206)) b!92920))

(assert (= (and b!92920 (not res!47213)) b!92931))

(assert (= (and b!92914 condMapEmpty!3625) mapIsEmpty!3626))

(assert (= (and b!92914 (not condMapEmpty!3625)) mapNonEmpty!3625))

(get-info :version)

(assert (= (and mapNonEmpty!3625 ((_ is ValueCellFull!956) mapValue!3625)) b!92915))

(assert (= (and b!92914 ((_ is ValueCellFull!956) mapDefault!3625)) b!92917))

(assert (= b!92925 b!92914))

(assert (= b!92932 b!92925))

(assert (= b!92926 b!92932))

(assert (= start!11274 b!92926))

(assert (= (and b!92923 condMapEmpty!3626) mapIsEmpty!3625))

(assert (= (and b!92923 (not condMapEmpty!3626)) mapNonEmpty!3626))

(assert (= (and mapNonEmpty!3626 ((_ is ValueCellFull!956) mapValue!3626)) b!92930))

(assert (= (and b!92923 ((_ is ValueCellFull!956) mapDefault!3626)) b!92916))

(assert (= b!92922 b!92923))

(assert (= start!11274 b!92922))

(declare-fun b_lambda!4099 () Bool)

(assert (=> (not b_lambda!4099) (not b!92928)))

(declare-fun t!5415 () Bool)

(declare-fun tb!1837 () Bool)

(assert (=> (and b!92925 (= (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))) t!5415) tb!1837))

(declare-fun result!3137 () Bool)

(assert (=> tb!1837 (= result!3137 tp_is_empty!2599)))

(assert (=> b!92928 t!5415))

(declare-fun b_and!5657 () Bool)

(assert (= b_and!5653 (and (=> t!5415 result!3137) b_and!5657)))

(declare-fun tb!1839 () Bool)

(declare-fun t!5417 () Bool)

(assert (=> (and b!92922 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))) t!5417) tb!1839))

(declare-fun result!3141 () Bool)

(assert (= result!3141 result!3137))

(assert (=> b!92928 t!5417))

(declare-fun b_and!5659 () Bool)

(assert (= b_and!5655 (and (=> t!5417 result!3141) b_and!5659)))

(declare-fun m!100237 () Bool)

(assert (=> b!92935 m!100237))

(declare-fun m!100239 () Bool)

(assert (=> b!92935 m!100239))

(declare-fun m!100241 () Bool)

(assert (=> b!92920 m!100241))

(declare-fun m!100243 () Bool)

(assert (=> b!92933 m!100243))

(declare-fun m!100245 () Bool)

(assert (=> mapNonEmpty!3626 m!100245))

(declare-fun m!100247 () Bool)

(assert (=> mapNonEmpty!3625 m!100247))

(declare-fun m!100249 () Bool)

(assert (=> b!92921 m!100249))

(declare-fun m!100251 () Bool)

(assert (=> b!92921 m!100251))

(declare-fun m!100253 () Bool)

(assert (=> b!92921 m!100253))

(declare-fun m!100255 () Bool)

(assert (=> b!92921 m!100255))

(declare-fun m!100257 () Bool)

(assert (=> b!92921 m!100257))

(declare-fun m!100259 () Bool)

(assert (=> b!92921 m!100259))

(declare-fun m!100261 () Bool)

(assert (=> b!92921 m!100261))

(assert (=> b!92921 m!100251))

(declare-fun m!100263 () Bool)

(assert (=> b!92921 m!100263))

(declare-fun m!100265 () Bool)

(assert (=> b!92921 m!100265))

(assert (=> b!92921 m!100255))

(assert (=> b!92921 m!100255))

(declare-fun m!100267 () Bool)

(assert (=> b!92921 m!100267))

(declare-fun m!100269 () Bool)

(assert (=> b!92921 m!100269))

(declare-fun m!100271 () Bool)

(assert (=> b!92921 m!100271))

(declare-fun m!100273 () Bool)

(assert (=> b!92921 m!100273))

(declare-fun m!100275 () Bool)

(assert (=> b!92925 m!100275))

(declare-fun m!100277 () Bool)

(assert (=> b!92925 m!100277))

(declare-fun m!100279 () Bool)

(assert (=> b!92918 m!100279))

(assert (=> b!92924 m!100255))

(assert (=> b!92924 m!100255))

(declare-fun m!100281 () Bool)

(assert (=> b!92924 m!100281))

(assert (=> b!92924 m!100255))

(declare-fun m!100283 () Bool)

(assert (=> b!92924 m!100283))

(declare-fun m!100285 () Bool)

(assert (=> b!92931 m!100285))

(declare-fun m!100287 () Bool)

(assert (=> start!11274 m!100287))

(declare-fun m!100289 () Bool)

(assert (=> b!92927 m!100289))

(declare-fun m!100291 () Bool)

(assert (=> b!92927 m!100291))

(assert (=> b!92927 m!100255))

(declare-fun m!100293 () Bool)

(assert (=> b!92927 m!100293))

(assert (=> b!92927 m!100255))

(assert (=> b!92927 m!100255))

(declare-fun m!100295 () Bool)

(assert (=> b!92927 m!100295))

(assert (=> b!92927 m!100255))

(declare-fun m!100297 () Bool)

(assert (=> b!92927 m!100297))

(declare-fun m!100299 () Bool)

(assert (=> b!92922 m!100299))

(declare-fun m!100301 () Bool)

(assert (=> b!92922 m!100301))

(assert (=> b!92928 m!100255))

(declare-fun m!100303 () Bool)

(assert (=> b!92928 m!100303))

(declare-fun m!100305 () Bool)

(assert (=> b!92928 m!100305))

(assert (=> b!92928 m!100303))

(assert (=> b!92928 m!100305))

(declare-fun m!100307 () Bool)

(assert (=> b!92928 m!100307))

(check-sat (not b!92933) (not b_lambda!4099) (not b!92922) (not b!92931) (not b!92920) (not b!92918) (not mapNonEmpty!3626) (not mapNonEmpty!3625) b_and!5659 (not start!11274) tp_is_empty!2599 (not b!92921) (not b!92928) (not b!92935) (not b!92927) (not b!92925) (not b_next!2365) b_and!5657 (not b!92924) (not b_next!2367))
(check-sat b_and!5657 b_and!5659 (not b_next!2365) (not b_next!2367))
(get-model)

(declare-fun b_lambda!4105 () Bool)

(assert (= b_lambda!4099 (or (and b!92925 b_free!2365) (and b!92922 b_free!2367 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))))) b_lambda!4105)))

(check-sat (not b!92933) (not b!92922) (not b!92931) (not b!92920) (not b!92918) (not b_lambda!4105) (not mapNonEmpty!3626) (not mapNonEmpty!3625) b_and!5659 (not start!11274) tp_is_empty!2599 (not b!92921) (not b!92928) (not b!92935) (not b!92927) (not b!92925) (not b_next!2365) b_and!5657 (not b!92924) (not b_next!2367))
(check-sat b_and!5657 b_and!5659 (not b_next!2365) (not b_next!2367))
(get-model)

(declare-fun d!24473 () Bool)

(assert (=> d!24473 (= (array_inv!1219 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvsge (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!92925 d!24473))

(declare-fun d!24475 () Bool)

(assert (=> d!24475 (= (array_inv!1220 (_values!2407 (v!2748 (underlying!324 thiss!992)))) (bvsge (size!2225 (_values!2407 (v!2748 (underlying!324 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!92925 d!24475))

(declare-fun d!24477 () Bool)

(assert (=> d!24477 (not (arrayContainsKey!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!45909 () Unit!2761)

(declare-fun choose!68 (array!4155 (_ BitVec 32) (_ BitVec 64) List!1549) Unit!2761)

(assert (=> d!24477 (= lt!45909 (choose!68 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (Cons!1545 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) Nil!1546)))))

(assert (=> d!24477 (bvslt (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24477 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (Cons!1545 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) Nil!1546)) lt!45909)))

(declare-fun bs!3850 () Bool)

(assert (= bs!3850 d!24477))

(assert (=> bs!3850 m!100255))

(assert (=> bs!3850 m!100295))

(assert (=> bs!3850 m!100255))

(declare-fun m!100453 () Bool)

(assert (=> bs!3850 m!100453))

(assert (=> b!92927 d!24477))

(declare-fun d!24479 () Bool)

(assert (=> d!24479 (arrayNoDuplicates!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) from!355 Nil!1546)))

(declare-fun lt!45912 () Unit!2761)

(declare-fun choose!39 (array!4155 (_ BitVec 32) (_ BitVec 32)) Unit!2761)

(assert (=> d!24479 (= lt!45912 (choose!39 (_keys!4106 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24479 (bvslt (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24479 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000000 from!355) lt!45912)))

(declare-fun bs!3851 () Bool)

(assert (= bs!3851 d!24479))

(assert (=> bs!3851 m!100291))

(declare-fun m!100455 () Bool)

(assert (=> bs!3851 m!100455))

(assert (=> b!92927 d!24479))

(declare-fun d!24481 () Bool)

(declare-fun res!47280 () Bool)

(declare-fun e!60771 () Bool)

(assert (=> d!24481 (=> res!47280 e!60771)))

(assert (=> d!24481 (= res!47280 (= (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(assert (=> d!24481 (= (arrayContainsKey!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!60771)))

(declare-fun b!93078 () Bool)

(declare-fun e!60772 () Bool)

(assert (=> b!93078 (= e!60771 e!60772)))

(declare-fun res!47281 () Bool)

(assert (=> b!93078 (=> (not res!47281) (not e!60772))))

(assert (=> b!93078 (= res!47281 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun b!93079 () Bool)

(assert (=> b!93079 (= e!60772 (arrayContainsKey!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24481 (not res!47280)) b!93078))

(assert (= (and b!93078 res!47281) b!93079))

(declare-fun m!100457 () Bool)

(assert (=> d!24481 m!100457))

(assert (=> b!93079 m!100255))

(declare-fun m!100459 () Bool)

(assert (=> b!93079 m!100459))

(assert (=> b!92927 d!24481))

(declare-fun d!24483 () Bool)

(declare-fun e!60775 () Bool)

(assert (=> d!24483 e!60775))

(declare-fun c!15458 () Bool)

(assert (=> d!24483 (= c!15458 (and (not (= (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!45915 () Unit!2761)

(declare-fun choose!563 (array!4155 array!4157 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 64) (_ BitVec 32) Int) Unit!2761)

(assert (=> d!24483 (= lt!45915 (choose!563 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!24483 (validMask!0 (mask!6494 (v!2748 (underlying!324 thiss!992))))))

(assert (=> d!24483 (= (lemmaListMapContainsThenArrayContainsFrom!78 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))) lt!45915)))

(declare-fun b!93084 () Bool)

(assert (=> b!93084 (= e!60775 (arrayContainsKey!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!93085 () Bool)

(assert (=> b!93085 (= e!60775 (ite (= (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24483 c!15458) b!93084))

(assert (= (and d!24483 (not c!15458)) b!93085))

(assert (=> d!24483 m!100255))

(declare-fun m!100461 () Bool)

(assert (=> d!24483 m!100461))

(declare-fun m!100463 () Bool)

(assert (=> d!24483 m!100463))

(assert (=> b!93084 m!100255))

(assert (=> b!93084 m!100295))

(assert (=> b!92927 d!24483))

(declare-fun c!15461 () Bool)

(declare-fun bm!9104 () Bool)

(declare-fun call!9107 () Bool)

(assert (=> bm!9104 (= call!9107 (arrayNoDuplicates!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15461 (Cons!1545 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) Nil!1546) Nil!1546)))))

(declare-fun b!93096 () Bool)

(declare-fun e!60786 () Bool)

(declare-fun contains!776 (List!1549 (_ BitVec 64)) Bool)

(assert (=> b!93096 (= e!60786 (contains!776 Nil!1546 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(declare-fun b!93097 () Bool)

(declare-fun e!60785 () Bool)

(declare-fun e!60787 () Bool)

(assert (=> b!93097 (= e!60785 e!60787)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!93097 (= c!15461 (validKeyInArray!0 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(declare-fun b!93098 () Bool)

(assert (=> b!93098 (= e!60787 call!9107)))

(declare-fun b!93100 () Bool)

(assert (=> b!93100 (= e!60787 call!9107)))

(declare-fun b!93099 () Bool)

(declare-fun e!60784 () Bool)

(assert (=> b!93099 (= e!60784 e!60785)))

(declare-fun res!47289 () Bool)

(assert (=> b!93099 (=> (not res!47289) (not e!60785))))

(assert (=> b!93099 (= res!47289 (not e!60786))))

(declare-fun res!47290 () Bool)

(assert (=> b!93099 (=> (not res!47290) (not e!60786))))

(assert (=> b!93099 (= res!47290 (validKeyInArray!0 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(declare-fun d!24485 () Bool)

(declare-fun res!47288 () Bool)

(assert (=> d!24485 (=> res!47288 e!60784)))

(assert (=> d!24485 (= res!47288 (bvsge from!355 (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(assert (=> d!24485 (= (arrayNoDuplicates!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) from!355 Nil!1546) e!60784)))

(assert (= (and d!24485 (not res!47288)) b!93099))

(assert (= (and b!93099 res!47290) b!93096))

(assert (= (and b!93099 res!47289) b!93097))

(assert (= (and b!93097 c!15461) b!93100))

(assert (= (and b!93097 (not c!15461)) b!93098))

(assert (= (or b!93100 b!93098) bm!9104))

(assert (=> bm!9104 m!100255))

(declare-fun m!100465 () Bool)

(assert (=> bm!9104 m!100465))

(assert (=> b!93096 m!100255))

(assert (=> b!93096 m!100255))

(declare-fun m!100467 () Bool)

(assert (=> b!93096 m!100467))

(assert (=> b!93097 m!100255))

(assert (=> b!93097 m!100255))

(declare-fun m!100469 () Bool)

(assert (=> b!93097 m!100469))

(assert (=> b!93099 m!100255))

(assert (=> b!93099 m!100255))

(assert (=> b!93099 m!100469))

(assert (=> b!92927 d!24485))

(declare-fun d!24487 () Bool)

(assert (=> d!24487 (= (map!1235 newMap!16) (getCurrentListMap!447 (_keys!4106 newMap!16) (_values!2407 newMap!16) (mask!6494 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2424 newMap!16)))))

(declare-fun bs!3852 () Bool)

(assert (= bs!3852 d!24487))

(declare-fun m!100471 () Bool)

(assert (=> bs!3852 m!100471))

(assert (=> b!92935 d!24487))

(declare-fun b!93143 () Bool)

(declare-fun e!60816 () Bool)

(assert (=> b!93143 (= e!60816 (validKeyInArray!0 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!93144 () Bool)

(declare-fun e!60822 () Bool)

(declare-fun lt!45975 () ListLongMap!1483)

(declare-fun apply!88 (ListLongMap!1483 (_ BitVec 64)) V!3113)

(assert (=> b!93144 (= e!60822 (= (apply!88 lt!45975 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun e!60818 () Bool)

(declare-fun b!93145 () Bool)

(assert (=> b!93145 (= e!60818 (= (apply!88 lt!45975 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1262 (select (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!364 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!93145 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2225 (_values!2407 (v!2748 (underlying!324 thiss!992))))))))

(assert (=> b!93145 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun b!93146 () Bool)

(declare-fun e!60814 () ListLongMap!1483)

(declare-fun call!9123 () ListLongMap!1483)

(assert (=> b!93146 (= e!60814 call!9123)))

(declare-fun b!93147 () Bool)

(declare-fun e!60824 () Unit!2761)

(declare-fun lt!45968 () Unit!2761)

(assert (=> b!93147 (= e!60824 lt!45968)))

(declare-fun lt!45973 () ListLongMap!1483)

(assert (=> b!93147 (= lt!45973 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun lt!45963 () (_ BitVec 64))

(assert (=> b!93147 (= lt!45963 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45976 () (_ BitVec 64))

(assert (=> b!93147 (= lt!45976 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!45965 () Unit!2761)

(declare-fun addStillContains!64 (ListLongMap!1483 (_ BitVec 64) V!3113 (_ BitVec 64)) Unit!2761)

(assert (=> b!93147 (= lt!45965 (addStillContains!64 lt!45973 lt!45963 (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) lt!45976))))

(assert (=> b!93147 (contains!775 (+!126 lt!45973 (tuple2!2271 lt!45963 (zeroValue!2311 (v!2748 (underlying!324 thiss!992))))) lt!45976)))

(declare-fun lt!45961 () Unit!2761)

(assert (=> b!93147 (= lt!45961 lt!45965)))

(declare-fun lt!45972 () ListLongMap!1483)

(assert (=> b!93147 (= lt!45972 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun lt!45964 () (_ BitVec 64))

(assert (=> b!93147 (= lt!45964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45962 () (_ BitVec 64))

(assert (=> b!93147 (= lt!45962 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!45970 () Unit!2761)

(declare-fun addApplyDifferent!64 (ListLongMap!1483 (_ BitVec 64) V!3113 (_ BitVec 64)) Unit!2761)

(assert (=> b!93147 (= lt!45970 (addApplyDifferent!64 lt!45972 lt!45964 (minValue!2311 (v!2748 (underlying!324 thiss!992))) lt!45962))))

(assert (=> b!93147 (= (apply!88 (+!126 lt!45972 (tuple2!2271 lt!45964 (minValue!2311 (v!2748 (underlying!324 thiss!992))))) lt!45962) (apply!88 lt!45972 lt!45962))))

(declare-fun lt!45981 () Unit!2761)

(assert (=> b!93147 (= lt!45981 lt!45970)))

(declare-fun lt!45960 () ListLongMap!1483)

(assert (=> b!93147 (= lt!45960 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun lt!45967 () (_ BitVec 64))

(assert (=> b!93147 (= lt!45967 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45971 () (_ BitVec 64))

(assert (=> b!93147 (= lt!45971 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!45980 () Unit!2761)

(assert (=> b!93147 (= lt!45980 (addApplyDifferent!64 lt!45960 lt!45967 (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) lt!45971))))

(assert (=> b!93147 (= (apply!88 (+!126 lt!45960 (tuple2!2271 lt!45967 (zeroValue!2311 (v!2748 (underlying!324 thiss!992))))) lt!45971) (apply!88 lt!45960 lt!45971))))

(declare-fun lt!45978 () Unit!2761)

(assert (=> b!93147 (= lt!45978 lt!45980)))

(declare-fun lt!45969 () ListLongMap!1483)

(assert (=> b!93147 (= lt!45969 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun lt!45979 () (_ BitVec 64))

(assert (=> b!93147 (= lt!45979 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45974 () (_ BitVec 64))

(assert (=> b!93147 (= lt!45974 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!93147 (= lt!45968 (addApplyDifferent!64 lt!45969 lt!45979 (minValue!2311 (v!2748 (underlying!324 thiss!992))) lt!45974))))

(assert (=> b!93147 (= (apply!88 (+!126 lt!45969 (tuple2!2271 lt!45979 (minValue!2311 (v!2748 (underlying!324 thiss!992))))) lt!45974) (apply!88 lt!45969 lt!45974))))

(declare-fun bm!9119 () Bool)

(declare-fun call!9125 () ListLongMap!1483)

(declare-fun call!9124 () ListLongMap!1483)

(assert (=> bm!9119 (= call!9125 call!9124)))

(declare-fun bm!9120 () Bool)

(declare-fun call!9122 () ListLongMap!1483)

(declare-fun call!9127 () ListLongMap!1483)

(assert (=> bm!9120 (= call!9122 call!9127)))

(declare-fun b!93148 () Bool)

(declare-fun e!60821 () Bool)

(assert (=> b!93148 (= e!60821 (= (apply!88 lt!45975 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2311 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun b!93149 () Bool)

(declare-fun c!15479 () Bool)

(assert (=> b!93149 (= c!15479 (and (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!60823 () ListLongMap!1483)

(assert (=> b!93149 (= e!60823 e!60814)))

(declare-fun b!93150 () Bool)

(declare-fun e!60820 () Bool)

(declare-fun call!9126 () Bool)

(assert (=> b!93150 (= e!60820 (not call!9126))))

(declare-fun b!93151 () Bool)

(declare-fun e!60815 () Bool)

(assert (=> b!93151 (= e!60815 e!60818)))

(declare-fun res!47312 () Bool)

(assert (=> b!93151 (=> (not res!47312) (not e!60818))))

(assert (=> b!93151 (= res!47312 (contains!775 lt!45975 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!93151 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun bm!9121 () Bool)

(assert (=> bm!9121 (= call!9126 (contains!775 lt!45975 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93152 () Bool)

(declare-fun e!60819 () ListLongMap!1483)

(assert (=> b!93152 (= e!60819 (+!126 call!9127 (tuple2!2271 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun b!93153 () Bool)

(declare-fun e!60817 () Bool)

(assert (=> b!93153 (= e!60817 (validKeyInArray!0 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!93154 () Bool)

(assert (=> b!93154 (= e!60819 e!60823)))

(declare-fun c!15478 () Bool)

(assert (=> b!93154 (= c!15478 (and (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93155 () Bool)

(declare-fun e!60825 () Bool)

(assert (=> b!93155 (= e!60825 e!60820)))

(declare-fun c!15477 () Bool)

(assert (=> b!93155 (= c!15477 (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93156 () Bool)

(assert (=> b!93156 (= e!60823 call!9122)))

(declare-fun b!93157 () Bool)

(assert (=> b!93157 (= e!60814 call!9122)))

(declare-fun b!93158 () Bool)

(declare-fun res!47317 () Bool)

(assert (=> b!93158 (=> (not res!47317) (not e!60825))))

(declare-fun e!60826 () Bool)

(assert (=> b!93158 (= res!47317 e!60826)))

(declare-fun c!15475 () Bool)

(assert (=> b!93158 (= c!15475 (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!93159 () Bool)

(declare-fun res!47309 () Bool)

(assert (=> b!93159 (=> (not res!47309) (not e!60825))))

(assert (=> b!93159 (= res!47309 e!60815)))

(declare-fun res!47315 () Bool)

(assert (=> b!93159 (=> res!47315 e!60815)))

(assert (=> b!93159 (= res!47315 (not e!60816))))

(declare-fun res!47314 () Bool)

(assert (=> b!93159 (=> (not res!47314) (not e!60816))))

(assert (=> b!93159 (= res!47314 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun b!93160 () Bool)

(assert (=> b!93160 (= e!60820 e!60821)))

(declare-fun res!47311 () Bool)

(assert (=> b!93160 (= res!47311 call!9126)))

(assert (=> b!93160 (=> (not res!47311) (not e!60821))))

(declare-fun b!93161 () Bool)

(assert (=> b!93161 (= e!60826 e!60822)))

(declare-fun res!47313 () Bool)

(declare-fun call!9128 () Bool)

(assert (=> b!93161 (= res!47313 call!9128)))

(assert (=> b!93161 (=> (not res!47313) (not e!60822))))

(declare-fun d!24489 () Bool)

(assert (=> d!24489 e!60825))

(declare-fun res!47310 () Bool)

(assert (=> d!24489 (=> (not res!47310) (not e!60825))))

(assert (=> d!24489 (= res!47310 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))))

(declare-fun lt!45977 () ListLongMap!1483)

(assert (=> d!24489 (= lt!45975 lt!45977)))

(declare-fun lt!45966 () Unit!2761)

(assert (=> d!24489 (= lt!45966 e!60824)))

(declare-fun c!15476 () Bool)

(assert (=> d!24489 (= c!15476 e!60817)))

(declare-fun res!47316 () Bool)

(assert (=> d!24489 (=> (not res!47316) (not e!60817))))

(assert (=> d!24489 (= res!47316 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(assert (=> d!24489 (= lt!45977 e!60819)))

(declare-fun c!15474 () Bool)

(assert (=> d!24489 (= c!15474 (and (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24489 (validMask!0 (mask!6494 (v!2748 (underlying!324 thiss!992))))))

(assert (=> d!24489 (= (getCurrentListMap!447 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))) lt!45975)))

(declare-fun bm!9122 () Bool)

(assert (=> bm!9122 (= call!9127 (+!126 (ite c!15474 call!9124 (ite c!15478 call!9125 call!9123)) (ite (or c!15474 c!15478) (tuple2!2271 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))) (tuple2!2271 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2748 (underlying!324 thiss!992)))))))))

(declare-fun bm!9123 () Bool)

(assert (=> bm!9123 (= call!9123 call!9125)))

(declare-fun b!93162 () Bool)

(assert (=> b!93162 (= e!60826 (not call!9128))))

(declare-fun bm!9124 () Bool)

(assert (=> bm!9124 (= call!9128 (contains!775 lt!45975 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9125 () Bool)

(assert (=> bm!9125 (= call!9124 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun b!93163 () Bool)

(declare-fun Unit!2768 () Unit!2761)

(assert (=> b!93163 (= e!60824 Unit!2768)))

(assert (= (and d!24489 c!15474) b!93152))

(assert (= (and d!24489 (not c!15474)) b!93154))

(assert (= (and b!93154 c!15478) b!93156))

(assert (= (and b!93154 (not c!15478)) b!93149))

(assert (= (and b!93149 c!15479) b!93157))

(assert (= (and b!93149 (not c!15479)) b!93146))

(assert (= (or b!93157 b!93146) bm!9123))

(assert (= (or b!93156 bm!9123) bm!9119))

(assert (= (or b!93156 b!93157) bm!9120))

(assert (= (or b!93152 bm!9119) bm!9125))

(assert (= (or b!93152 bm!9120) bm!9122))

(assert (= (and d!24489 res!47316) b!93153))

(assert (= (and d!24489 c!15476) b!93147))

(assert (= (and d!24489 (not c!15476)) b!93163))

(assert (= (and d!24489 res!47310) b!93159))

(assert (= (and b!93159 res!47314) b!93143))

(assert (= (and b!93159 (not res!47315)) b!93151))

(assert (= (and b!93151 res!47312) b!93145))

(assert (= (and b!93159 res!47309) b!93158))

(assert (= (and b!93158 c!15475) b!93161))

(assert (= (and b!93158 (not c!15475)) b!93162))

(assert (= (and b!93161 res!47313) b!93144))

(assert (= (or b!93161 b!93162) bm!9124))

(assert (= (and b!93158 res!47317) b!93155))

(assert (= (and b!93155 c!15477) b!93160))

(assert (= (and b!93155 (not c!15477)) b!93150))

(assert (= (and b!93160 res!47311) b!93148))

(assert (= (or b!93160 b!93150) bm!9121))

(declare-fun b_lambda!4107 () Bool)

(assert (=> (not b_lambda!4107) (not b!93145)))

(assert (=> b!93145 t!5415))

(declare-fun b_and!5677 () Bool)

(assert (= b_and!5657 (and (=> t!5415 result!3137) b_and!5677)))

(assert (=> b!93145 t!5417))

(declare-fun b_and!5679 () Bool)

(assert (= b_and!5659 (and (=> t!5417 result!3141) b_and!5679)))

(declare-fun m!100473 () Bool)

(assert (=> b!93152 m!100473))

(declare-fun m!100475 () Bool)

(assert (=> b!93145 m!100475))

(assert (=> b!93145 m!100457))

(assert (=> b!93145 m!100457))

(declare-fun m!100477 () Bool)

(assert (=> b!93145 m!100477))

(assert (=> b!93145 m!100305))

(assert (=> b!93145 m!100475))

(assert (=> b!93145 m!100305))

(declare-fun m!100479 () Bool)

(assert (=> b!93145 m!100479))

(assert (=> b!93153 m!100457))

(assert (=> b!93153 m!100457))

(declare-fun m!100481 () Bool)

(assert (=> b!93153 m!100481))

(declare-fun m!100483 () Bool)

(assert (=> bm!9121 m!100483))

(assert (=> bm!9125 m!100273))

(declare-fun m!100485 () Bool)

(assert (=> b!93147 m!100485))

(declare-fun m!100487 () Bool)

(assert (=> b!93147 m!100487))

(declare-fun m!100489 () Bool)

(assert (=> b!93147 m!100489))

(declare-fun m!100491 () Bool)

(assert (=> b!93147 m!100491))

(assert (=> b!93147 m!100487))

(declare-fun m!100493 () Bool)

(assert (=> b!93147 m!100493))

(declare-fun m!100495 () Bool)

(assert (=> b!93147 m!100495))

(declare-fun m!100497 () Bool)

(assert (=> b!93147 m!100497))

(assert (=> b!93147 m!100491))

(declare-fun m!100499 () Bool)

(assert (=> b!93147 m!100499))

(declare-fun m!100501 () Bool)

(assert (=> b!93147 m!100501))

(declare-fun m!100503 () Bool)

(assert (=> b!93147 m!100503))

(assert (=> b!93147 m!100273))

(assert (=> b!93147 m!100501))

(declare-fun m!100505 () Bool)

(assert (=> b!93147 m!100505))

(assert (=> b!93147 m!100495))

(assert (=> b!93147 m!100457))

(declare-fun m!100507 () Bool)

(assert (=> b!93147 m!100507))

(declare-fun m!100509 () Bool)

(assert (=> b!93147 m!100509))

(declare-fun m!100511 () Bool)

(assert (=> b!93147 m!100511))

(declare-fun m!100513 () Bool)

(assert (=> b!93147 m!100513))

(declare-fun m!100515 () Bool)

(assert (=> bm!9122 m!100515))

(declare-fun m!100517 () Bool)

(assert (=> b!93148 m!100517))

(assert (=> b!93143 m!100457))

(assert (=> b!93143 m!100457))

(assert (=> b!93143 m!100481))

(assert (=> b!93151 m!100457))

(assert (=> b!93151 m!100457))

(declare-fun m!100519 () Bool)

(assert (=> b!93151 m!100519))

(assert (=> d!24489 m!100463))

(declare-fun m!100521 () Bool)

(assert (=> b!93144 m!100521))

(declare-fun m!100523 () Bool)

(assert (=> bm!9124 m!100523))

(assert (=> b!92935 d!24489))

(declare-fun d!24491 () Bool)

(declare-fun res!47324 () Bool)

(declare-fun e!60829 () Bool)

(assert (=> d!24491 (=> (not res!47324) (not e!60829))))

(declare-fun simpleValid!64 (LongMapFixedSize!820) Bool)

(assert (=> d!24491 (= res!47324 (simpleValid!64 newMap!16))))

(assert (=> d!24491 (= (valid!377 newMap!16) e!60829)))

(declare-fun b!93170 () Bool)

(declare-fun res!47325 () Bool)

(assert (=> b!93170 (=> (not res!47325) (not e!60829))))

(declare-fun arrayCountValidKeys!0 (array!4155 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!93170 (= res!47325 (= (arrayCountValidKeys!0 (_keys!4106 newMap!16) #b00000000000000000000000000000000 (size!2224 (_keys!4106 newMap!16))) (_size!459 newMap!16)))))

(declare-fun b!93171 () Bool)

(declare-fun res!47326 () Bool)

(assert (=> b!93171 (=> (not res!47326) (not e!60829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4155 (_ BitVec 32)) Bool)

(assert (=> b!93171 (= res!47326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4106 newMap!16) (mask!6494 newMap!16)))))

(declare-fun b!93172 () Bool)

(assert (=> b!93172 (= e!60829 (arrayNoDuplicates!0 (_keys!4106 newMap!16) #b00000000000000000000000000000000 Nil!1546))))

(assert (= (and d!24491 res!47324) b!93170))

(assert (= (and b!93170 res!47325) b!93171))

(assert (= (and b!93171 res!47326) b!93172))

(declare-fun m!100525 () Bool)

(assert (=> d!24491 m!100525))

(declare-fun m!100527 () Bool)

(assert (=> b!93170 m!100527))

(declare-fun m!100529 () Bool)

(assert (=> b!93171 m!100529))

(declare-fun m!100531 () Bool)

(assert (=> b!93172 m!100531))

(assert (=> b!92933 d!24491))

(declare-fun d!24493 () Bool)

(declare-fun e!60834 () Bool)

(assert (=> d!24493 e!60834))

(declare-fun res!47329 () Bool)

(assert (=> d!24493 (=> res!47329 e!60834)))

(declare-fun lt!45991 () Bool)

(assert (=> d!24493 (= res!47329 (not lt!45991))))

(declare-fun lt!45993 () Bool)

(assert (=> d!24493 (= lt!45991 lt!45993)))

(declare-fun lt!45992 () Unit!2761)

(declare-fun e!60835 () Unit!2761)

(assert (=> d!24493 (= lt!45992 e!60835)))

(declare-fun c!15482 () Bool)

(assert (=> d!24493 (= c!15482 lt!45993)))

(declare-fun containsKey!150 (List!1548 (_ BitVec 64)) Bool)

(assert (=> d!24493 (= lt!45993 (containsKey!150 (toList!757 lt!45781) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(assert (=> d!24493 (= (contains!775 lt!45781 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)) lt!45991)))

(declare-fun b!93179 () Bool)

(declare-fun lt!45990 () Unit!2761)

(assert (=> b!93179 (= e!60835 lt!45990)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!98 (List!1548 (_ BitVec 64)) Unit!2761)

(assert (=> b!93179 (= lt!45990 (lemmaContainsKeyImpliesGetValueByKeyDefined!98 (toList!757 lt!45781) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(declare-datatypes ((Option!153 0))(
  ( (Some!152 (v!2754 V!3113)) (None!151) )
))
(declare-fun isDefined!99 (Option!153) Bool)

(declare-fun getValueByKey!147 (List!1548 (_ BitVec 64)) Option!153)

(assert (=> b!93179 (isDefined!99 (getValueByKey!147 (toList!757 lt!45781) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(declare-fun b!93180 () Bool)

(declare-fun Unit!2769 () Unit!2761)

(assert (=> b!93180 (= e!60835 Unit!2769)))

(declare-fun b!93181 () Bool)

(assert (=> b!93181 (= e!60834 (isDefined!99 (getValueByKey!147 (toList!757 lt!45781) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355))))))

(assert (= (and d!24493 c!15482) b!93179))

(assert (= (and d!24493 (not c!15482)) b!93180))

(assert (= (and d!24493 (not res!47329)) b!93181))

(assert (=> d!24493 m!100255))

(declare-fun m!100533 () Bool)

(assert (=> d!24493 m!100533))

(assert (=> b!93179 m!100255))

(declare-fun m!100535 () Bool)

(assert (=> b!93179 m!100535))

(assert (=> b!93179 m!100255))

(declare-fun m!100537 () Bool)

(assert (=> b!93179 m!100537))

(assert (=> b!93179 m!100537))

(declare-fun m!100539 () Bool)

(assert (=> b!93179 m!100539))

(assert (=> b!93181 m!100255))

(assert (=> b!93181 m!100537))

(assert (=> b!93181 m!100537))

(assert (=> b!93181 m!100539))

(assert (=> b!92924 d!24493))

(declare-fun b!93266 () Bool)

(declare-fun lt!46067 () tuple2!2268)

(declare-fun call!9180 () tuple2!2268)

(assert (=> b!93266 (= lt!46067 call!9180)))

(declare-fun e!60894 () tuple2!2268)

(assert (=> b!93266 (= e!60894 (tuple2!2269 (_1!1145 lt!46067) (_2!1145 lt!46067)))))

(declare-fun b!93267 () Bool)

(declare-fun c!15519 () Bool)

(declare-datatypes ((SeekEntryResult!243 0))(
  ( (MissingZero!243 (index!3113 (_ BitVec 32))) (Found!243 (index!3114 (_ BitVec 32))) (Intermediate!243 (undefined!1055 Bool) (index!3115 (_ BitVec 32)) (x!12567 (_ BitVec 32))) (Undefined!243) (MissingVacant!243 (index!3116 (_ BitVec 32))) )
))
(declare-fun lt!46068 () SeekEntryResult!243)

(assert (=> b!93267 (= c!15519 ((_ is MissingVacant!243) lt!46068))))

(declare-fun e!60885 () tuple2!2268)

(declare-fun e!60881 () tuple2!2268)

(assert (=> b!93267 (= e!60885 e!60881)))

(declare-fun bm!9174 () Bool)

(declare-fun call!9200 () SeekEntryResult!243)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4155 (_ BitVec 32)) SeekEntryResult!243)

(assert (=> bm!9174 (= call!9200 (seekEntryOrOpen!0 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (_keys!4106 newMap!16) (mask!6494 newMap!16)))))

(declare-fun bm!9175 () Bool)

(declare-fun call!9196 () Bool)

(assert (=> bm!9175 (= call!9196 (arrayContainsKey!0 (_keys!4106 newMap!16) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!9176 () Bool)

(declare-fun updateHelperNewKey!37 (LongMapFixedSize!820 (_ BitVec 64) V!3113 (_ BitVec 32)) tuple2!2268)

(assert (=> bm!9176 (= call!9180 (updateHelperNewKey!37 newMap!16 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790 (ite c!15519 (index!3116 lt!46068) (index!3113 lt!46068))))))

(declare-fun b!93268 () Bool)

(declare-fun e!60882 () Bool)

(declare-fun e!60884 () Bool)

(assert (=> b!93268 (= e!60882 e!60884)))

(declare-fun c!15521 () Bool)

(declare-fun lt!46072 () tuple2!2268)

(assert (=> b!93268 (= c!15521 (_1!1145 lt!46072))))

(declare-fun b!93269 () Bool)

(declare-fun res!47369 () Bool)

(declare-fun e!60896 () Bool)

(assert (=> b!93269 (=> (not res!47369) (not e!60896))))

(declare-fun call!9185 () Bool)

(assert (=> b!93269 (= res!47369 call!9185)))

(declare-fun e!60893 () Bool)

(assert (=> b!93269 (= e!60893 e!60896)))

(declare-fun bm!9177 () Bool)

(declare-fun call!9184 () Bool)

(declare-fun call!9189 () Bool)

(assert (=> bm!9177 (= call!9184 call!9189)))

(declare-fun b!93270 () Bool)

(declare-fun lt!46048 () Unit!2761)

(declare-fun lt!46059 () Unit!2761)

(assert (=> b!93270 (= lt!46048 lt!46059)))

(declare-fun call!9191 () ListLongMap!1483)

(declare-fun call!9194 () ListLongMap!1483)

(assert (=> b!93270 (= call!9191 call!9194)))

(declare-fun lt!46070 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!37 (array!4155 array!4157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 V!3113 Int) Unit!2761)

(assert (=> b!93270 (= lt!46059 (lemmaChangeLongMinValueKeyThenAddPairToListMap!37 (_keys!4106 newMap!16) (_values!2407 newMap!16) (mask!6494 newMap!16) (extraKeys!2253 newMap!16) lt!46070 (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) lt!45790 (defaultEntry!2424 newMap!16)))))

(assert (=> b!93270 (= lt!46070 (bvor (extraKeys!2253 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!60880 () tuple2!2268)

(assert (=> b!93270 (= e!60880 (tuple2!2269 true (LongMapFixedSize!821 (defaultEntry!2424 newMap!16) (mask!6494 newMap!16) (bvor (extraKeys!2253 newMap!16) #b00000000000000000000000000000010) (zeroValue!2311 newMap!16) lt!45790 (_size!459 newMap!16) (_keys!4106 newMap!16) (_values!2407 newMap!16) (_vacant!459 newMap!16))))))

(declare-fun b!93271 () Bool)

(declare-fun e!60889 () Bool)

(declare-fun call!9190 () Bool)

(assert (=> b!93271 (= e!60889 (not call!9190))))

(declare-fun bm!9178 () Bool)

(declare-fun call!9187 () ListLongMap!1483)

(declare-fun call!9178 () ListLongMap!1483)

(assert (=> bm!9178 (= call!9187 call!9178)))

(declare-fun e!60890 () ListLongMap!1483)

(declare-fun c!15517 () Bool)

(declare-fun b!93272 () Bool)

(assert (=> b!93272 (= e!60890 (ite c!15517 call!9194 call!9187))))

(declare-fun b!93273 () Bool)

(assert (=> b!93273 (= e!60890 (getCurrentListMap!447 (_keys!4106 newMap!16) (_values!2407 newMap!16) (mask!6494 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2424 newMap!16)))))

(declare-fun b!93274 () Bool)

(declare-fun lt!46069 () Unit!2761)

(declare-fun e!60883 () Unit!2761)

(assert (=> b!93274 (= lt!46069 e!60883)))

(declare-fun c!15524 () Bool)

(declare-fun call!9177 () Bool)

(assert (=> b!93274 (= c!15524 call!9177)))

(assert (=> b!93274 (= e!60885 (tuple2!2269 false newMap!16))))

(declare-fun b!93275 () Bool)

(declare-fun e!60886 () Bool)

(declare-fun lt!46056 () SeekEntryResult!243)

(assert (=> b!93275 (= e!60886 ((_ is Undefined!243) lt!46056))))

(declare-fun b!93276 () Bool)

(declare-fun e!60895 () Bool)

(assert (=> b!93276 (= e!60884 e!60895)))

(declare-fun call!9183 () ListLongMap!1483)

(declare-fun res!47359 () Bool)

(assert (=> b!93276 (= res!47359 (contains!775 call!9183 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(assert (=> b!93276 (=> (not res!47359) (not e!60895))))

(declare-fun b!93277 () Bool)

(declare-fun e!60888 () Unit!2761)

(declare-fun lt!46049 () Unit!2761)

(assert (=> b!93277 (= e!60888 lt!46049)))

(declare-fun call!9182 () Unit!2761)

(assert (=> b!93277 (= lt!46049 call!9182)))

(declare-fun lt!46062 () SeekEntryResult!243)

(declare-fun call!9199 () SeekEntryResult!243)

(assert (=> b!93277 (= lt!46062 call!9199)))

(declare-fun res!47368 () Bool)

(assert (=> b!93277 (= res!47368 ((_ is Found!243) lt!46062))))

(declare-fun e!60900 () Bool)

(assert (=> b!93277 (=> (not res!47368) (not e!60900))))

(assert (=> b!93277 e!60900))

(declare-fun c!15515 () Bool)

(declare-fun c!15522 () Bool)

(declare-fun lt!46058 () SeekEntryResult!243)

(declare-fun c!15511 () Bool)

(declare-fun lt!46052 () SeekEntryResult!243)

(declare-fun c!15516 () Bool)

(declare-fun bm!9179 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!9179 (= call!9189 (inRange!0 (ite c!15515 (ite c!15524 (index!3114 lt!46052) (ite c!15522 (index!3113 lt!46056) (index!3116 lt!46056))) (ite c!15516 (index!3114 lt!46062) (ite c!15511 (index!3113 lt!46058) (index!3116 lt!46058)))) (mask!6494 newMap!16)))))

(declare-fun bm!9180 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!37 (array!4155 array!4157 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 64) Int) Unit!2761)

(assert (=> bm!9180 (= call!9182 (lemmaInListMapThenSeekEntryOrOpenFindsIt!37 (_keys!4106 newMap!16) (_values!2407 newMap!16) (mask!6494 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (defaultEntry!2424 newMap!16)))))

(declare-fun b!93278 () Bool)

(assert (=> b!93278 (= e!60900 (= (select (arr!1976 (_keys!4106 newMap!16)) (index!3114 lt!46062)) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(declare-fun b!93279 () Bool)

(declare-fun Unit!2770 () Unit!2761)

(assert (=> b!93279 (= e!60883 Unit!2770)))

(declare-fun lt!46051 () Unit!2761)

(assert (=> b!93279 (= lt!46051 call!9182)))

(declare-fun call!9181 () SeekEntryResult!243)

(assert (=> b!93279 (= lt!46052 call!9181)))

(declare-fun res!47358 () Bool)

(assert (=> b!93279 (= res!47358 ((_ is Found!243) lt!46052))))

(declare-fun e!60892 () Bool)

(assert (=> b!93279 (=> (not res!47358) (not e!60892))))

(assert (=> b!93279 e!60892))

(declare-fun lt!46073 () Unit!2761)

(assert (=> b!93279 (= lt!46073 lt!46051)))

(assert (=> b!93279 false))

(declare-fun b!93280 () Bool)

(declare-fun c!15513 () Bool)

(assert (=> b!93280 (= c!15513 ((_ is MissingVacant!243) lt!46058))))

(declare-fun e!60887 () Bool)

(assert (=> b!93280 (= e!60893 e!60887)))

(declare-fun b!93281 () Bool)

(declare-fun res!47367 () Bool)

(assert (=> b!93281 (= res!47367 call!9184)))

(assert (=> b!93281 (=> (not res!47367) (not e!60900))))

(declare-fun b!93282 () Bool)

(declare-fun res!47363 () Bool)

(assert (=> b!93282 (= res!47363 (= (select (arr!1976 (_keys!4106 newMap!16)) (index!3116 lt!46058)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!60899 () Bool)

(assert (=> b!93282 (=> (not res!47363) (not e!60899))))

(declare-fun b!93283 () Bool)

(assert (=> b!93283 (= e!60892 (= (select (arr!1976 (_keys!4106 newMap!16)) (index!3114 lt!46052)) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(declare-fun b!93284 () Bool)

(declare-fun lt!46060 () tuple2!2268)

(assert (=> b!93284 (= e!60881 (tuple2!2269 (_1!1145 lt!46060) (_2!1145 lt!46060)))))

(assert (=> b!93284 (= lt!46060 call!9180)))

(declare-fun b!93285 () Bool)

(assert (=> b!93285 (= e!60881 e!60894)))

(declare-fun c!15512 () Bool)

(assert (=> b!93285 (= c!15512 ((_ is MissingZero!243) lt!46068))))

(declare-fun bm!9181 () Bool)

(declare-fun call!9195 () ListLongMap!1483)

(declare-fun call!9192 () ListLongMap!1483)

(assert (=> bm!9181 (= call!9195 call!9192)))

(declare-fun bm!9182 () Bool)

(declare-fun call!9193 () Bool)

(assert (=> bm!9182 (= call!9193 call!9189)))

(declare-fun b!93286 () Bool)

(declare-fun res!47364 () Bool)

(assert (=> b!93286 (=> (not res!47364) (not e!60889))))

(declare-fun call!9179 () Bool)

(assert (=> b!93286 (= res!47364 call!9179)))

(declare-fun e!60901 () Bool)

(assert (=> b!93286 (= e!60901 e!60889)))

(declare-fun b!93287 () Bool)

(declare-fun c!15520 () Bool)

(assert (=> b!93287 (= c!15520 ((_ is MissingVacant!243) lt!46056))))

(assert (=> b!93287 (= e!60901 e!60886)))

(declare-fun b!93288 () Bool)

(declare-fun call!9198 () ListLongMap!1483)

(assert (=> b!93288 (= e!60895 (= call!9183 (+!126 call!9198 (tuple2!2271 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790))))))

(declare-fun b!93289 () Bool)

(declare-fun e!60891 () Bool)

(assert (=> b!93289 (= e!60886 e!60891)))

(declare-fun res!47361 () Bool)

(assert (=> b!93289 (= res!47361 call!9179)))

(assert (=> b!93289 (=> (not res!47361) (not e!60891))))

(declare-fun b!93290 () Bool)

(assert (=> b!93290 (= e!60887 ((_ is Undefined!243) lt!46058))))

(declare-fun b!93291 () Bool)

(declare-fun Unit!2771 () Unit!2761)

(assert (=> b!93291 (= e!60888 Unit!2771)))

(declare-fun lt!46055 () Unit!2761)

(declare-fun call!9188 () Unit!2761)

(assert (=> b!93291 (= lt!46055 call!9188)))

(assert (=> b!93291 (= lt!46058 call!9199)))

(assert (=> b!93291 (= c!15511 ((_ is MissingZero!243) lt!46058))))

(assert (=> b!93291 e!60893))

(declare-fun lt!46066 () Unit!2761)

(assert (=> b!93291 (= lt!46066 lt!46055)))

(assert (=> b!93291 false))

(declare-fun bm!9183 () Bool)

(assert (=> bm!9183 (= call!9179 call!9193)))

(declare-fun b!93292 () Bool)

(assert (=> b!93292 (= e!60891 (not call!9190))))

(declare-fun b!93293 () Bool)

(assert (=> b!93293 (= e!60887 e!60899)))

(declare-fun res!47365 () Bool)

(assert (=> b!93293 (= res!47365 call!9185)))

(assert (=> b!93293 (=> (not res!47365) (not e!60899))))

(declare-fun b!93294 () Bool)

(declare-fun lt!46053 () Unit!2761)

(declare-fun lt!46064 () Unit!2761)

(assert (=> b!93294 (= lt!46053 lt!46064)))

(assert (=> b!93294 (contains!775 call!9195 (select (arr!1976 (_keys!4106 newMap!16)) (index!3114 lt!46068)))))

(declare-fun lt!46061 () array!4157)

(declare-fun lemmaValidKeyInArrayIsInListMap!97 (array!4155 array!4157 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 32) Int) Unit!2761)

(assert (=> b!93294 (= lt!46064 (lemmaValidKeyInArrayIsInListMap!97 (_keys!4106 newMap!16) lt!46061 (mask!6494 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) (index!3114 lt!46068) (defaultEntry!2424 newMap!16)))))

(assert (=> b!93294 (= lt!46061 (array!4158 (store (arr!1977 (_values!2407 newMap!16)) (index!3114 lt!46068) (ValueCellFull!956 lt!45790)) (size!2225 (_values!2407 newMap!16))))))

(declare-fun lt!46054 () Unit!2761)

(declare-fun lt!46063 () Unit!2761)

(assert (=> b!93294 (= lt!46054 lt!46063)))

(declare-fun call!9186 () ListLongMap!1483)

(assert (=> b!93294 (= call!9186 call!9178)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!37 (array!4155 array!4157 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 32) (_ BitVec 64) V!3113 Int) Unit!2761)

(assert (=> b!93294 (= lt!46063 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!37 (_keys!4106 newMap!16) (_values!2407 newMap!16) (mask!6494 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) (index!3114 lt!46068) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790 (defaultEntry!2424 newMap!16)))))

(declare-fun lt!46071 () Unit!2761)

(assert (=> b!93294 (= lt!46071 e!60888)))

(assert (=> b!93294 (= c!15516 call!9177)))

(assert (=> b!93294 (= e!60894 (tuple2!2269 true (LongMapFixedSize!821 (defaultEntry!2424 newMap!16) (mask!6494 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) (_size!459 newMap!16) (_keys!4106 newMap!16) (array!4158 (store (arr!1977 (_values!2407 newMap!16)) (index!3114 lt!46068) (ValueCellFull!956 lt!45790)) (size!2225 (_values!2407 newMap!16))) (_vacant!459 newMap!16))))))

(declare-fun b!93295 () Bool)

(declare-fun lt!46057 () Unit!2761)

(assert (=> b!93295 (= e!60883 lt!46057)))

(assert (=> b!93295 (= lt!46057 call!9188)))

(assert (=> b!93295 (= lt!46056 call!9181)))

(assert (=> b!93295 (= c!15522 ((_ is MissingZero!243) lt!46056))))

(assert (=> b!93295 e!60901))

(declare-fun c!15518 () Bool)

(declare-fun bm!9184 () Bool)

(assert (=> bm!9184 (= call!9192 (getCurrentListMap!447 (_keys!4106 newMap!16) (ite (or c!15518 c!15515) (_values!2407 newMap!16) lt!46061) (mask!6494 newMap!16) (ite c!15518 (ite c!15517 (extraKeys!2253 newMap!16) lt!46070) (extraKeys!2253 newMap!16)) (zeroValue!2311 newMap!16) (ite c!15518 (ite c!15517 (minValue!2311 newMap!16) lt!45790) (minValue!2311 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2424 newMap!16)))))

(declare-fun b!93296 () Bool)

(declare-fun res!47360 () Bool)

(assert (=> b!93296 (= res!47360 (= (select (arr!1976 (_keys!4106 newMap!16)) (index!3116 lt!46056)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!93296 (=> (not res!47360) (not e!60891))))

(declare-fun b!93297 () Bool)

(declare-fun call!9197 () Bool)

(assert (=> b!93297 (= e!60896 (not call!9197))))

(declare-fun bm!9185 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!37 (array!4155 array!4157 (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 (_ BitVec 64) Int) Unit!2761)

(assert (=> bm!9185 (= call!9188 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!37 (_keys!4106 newMap!16) (_values!2407 newMap!16) (mask!6494 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (defaultEntry!2424 newMap!16)))))

(declare-fun bm!9186 () Bool)

(assert (=> bm!9186 (= call!9185 call!9184)))

(declare-fun b!93298 () Bool)

(declare-fun e!60898 () tuple2!2268)

(assert (=> b!93298 (= e!60898 e!60885)))

(assert (=> b!93298 (= lt!46068 (seekEntryOrOpen!0 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (_keys!4106 newMap!16) (mask!6494 newMap!16)))))

(assert (=> b!93298 (= c!15515 ((_ is Undefined!243) lt!46068))))

(declare-fun bm!9187 () Bool)

(assert (=> bm!9187 (= call!9183 (map!1235 (_2!1145 lt!46072)))))

(declare-fun b!93299 () Bool)

(declare-fun e!60897 () ListLongMap!1483)

(assert (=> b!93299 (= e!60897 (getCurrentListMap!447 (_keys!4106 newMap!16) (_values!2407 newMap!16) (mask!6494 newMap!16) (extraKeys!2253 newMap!16) (zeroValue!2311 newMap!16) (minValue!2311 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2424 newMap!16)))))

(declare-fun b!93300 () Bool)

(declare-fun res!47370 () Bool)

(assert (=> b!93300 (=> (not res!47370) (not e!60896))))

(assert (=> b!93300 (= res!47370 (= (select (arr!1976 (_keys!4106 newMap!16)) (index!3113 lt!46058)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9188 () Bool)

(assert (=> bm!9188 (= call!9191 call!9186)))

(declare-fun bm!9189 () Bool)

(assert (=> bm!9189 (= call!9186 (+!126 e!60890 (ite c!15518 (ite c!15517 (tuple2!2271 #b0000000000000000000000000000000000000000000000000000000000000000 lt!45790) (tuple2!2271 #b1000000000000000000000000000000000000000000000000000000000000000 lt!45790)) (tuple2!2271 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790))))))

(declare-fun c!15514 () Bool)

(assert (=> bm!9189 (= c!15514 c!15518)))

(declare-fun bm!9190 () Bool)

(assert (=> bm!9190 (= call!9190 call!9196)))

(declare-fun d!24495 () Bool)

(assert (=> d!24495 e!60882))

(declare-fun res!47362 () Bool)

(assert (=> d!24495 (=> (not res!47362) (not e!60882))))

(assert (=> d!24495 (= res!47362 (valid!377 (_2!1145 lt!46072)))))

(assert (=> d!24495 (= lt!46072 e!60898)))

(assert (=> d!24495 (= c!15518 (= (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) (bvneg (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355))))))

(assert (=> d!24495 (valid!377 newMap!16)))

(assert (=> d!24495 (= (update!139 newMap!16 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790) lt!46072)))

(declare-fun b!93301 () Bool)

(declare-fun res!47371 () Bool)

(assert (=> b!93301 (=> (not res!47371) (not e!60889))))

(assert (=> b!93301 (= res!47371 (= (select (arr!1976 (_keys!4106 newMap!16)) (index!3113 lt!46056)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9191 () Bool)

(assert (=> bm!9191 (= call!9197 call!9196)))

(declare-fun b!93302 () Bool)

(declare-fun lt!46050 () Unit!2761)

(declare-fun lt!46074 () Unit!2761)

(assert (=> b!93302 (= lt!46050 lt!46074)))

(assert (=> b!93302 (= call!9191 call!9187)))

(declare-fun lt!46065 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!37 (array!4155 array!4157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3113 V!3113 V!3113 Int) Unit!2761)

(assert (=> b!93302 (= lt!46074 (lemmaChangeZeroKeyThenAddPairToListMap!37 (_keys!4106 newMap!16) (_values!2407 newMap!16) (mask!6494 newMap!16) (extraKeys!2253 newMap!16) lt!46065 (zeroValue!2311 newMap!16) lt!45790 (minValue!2311 newMap!16) (defaultEntry!2424 newMap!16)))))

(assert (=> b!93302 (= lt!46065 (bvor (extraKeys!2253 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!93302 (= e!60880 (tuple2!2269 true (LongMapFixedSize!821 (defaultEntry!2424 newMap!16) (mask!6494 newMap!16) (bvor (extraKeys!2253 newMap!16) #b00000000000000000000000000000001) lt!45790 (minValue!2311 newMap!16) (_size!459 newMap!16) (_keys!4106 newMap!16) (_values!2407 newMap!16) (_vacant!459 newMap!16))))))

(declare-fun bm!9192 () Bool)

(declare-fun c!15523 () Bool)

(assert (=> bm!9192 (= c!15523 c!15515)))

(assert (=> bm!9192 (= call!9177 (contains!775 e!60897 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(declare-fun bm!9193 () Bool)

(assert (=> bm!9193 (= call!9199 call!9200)))

(declare-fun bm!9194 () Bool)

(assert (=> bm!9194 (= call!9194 call!9192)))

(declare-fun bm!9195 () Bool)

(assert (=> bm!9195 (= call!9198 (map!1235 newMap!16))))

(declare-fun b!93303 () Bool)

(assert (=> b!93303 (= e!60898 e!60880)))

(assert (=> b!93303 (= c!15517 (= (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9196 () Bool)

(assert (=> bm!9196 (= call!9178 (getCurrentListMap!447 (_keys!4106 newMap!16) (ite c!15518 (_values!2407 newMap!16) (array!4158 (store (arr!1977 (_values!2407 newMap!16)) (index!3114 lt!46068) (ValueCellFull!956 lt!45790)) (size!2225 (_values!2407 newMap!16)))) (mask!6494 newMap!16) (ite (and c!15518 c!15517) lt!46065 (extraKeys!2253 newMap!16)) (ite (and c!15518 c!15517) lt!45790 (zeroValue!2311 newMap!16)) (minValue!2311 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2424 newMap!16)))))

(declare-fun bm!9197 () Bool)

(assert (=> bm!9197 (= call!9181 call!9200)))

(declare-fun b!93304 () Bool)

(assert (=> b!93304 (= e!60899 (not call!9197))))

(declare-fun b!93305 () Bool)

(assert (=> b!93305 (= e!60897 call!9195)))

(declare-fun b!93306 () Bool)

(assert (=> b!93306 (= e!60884 (= call!9183 call!9198))))

(declare-fun b!93307 () Bool)

(declare-fun res!47366 () Bool)

(assert (=> b!93307 (= res!47366 call!9193)))

(assert (=> b!93307 (=> (not res!47366) (not e!60892))))

(assert (= (and d!24495 c!15518) b!93303))

(assert (= (and d!24495 (not c!15518)) b!93298))

(assert (= (and b!93303 c!15517) b!93302))

(assert (= (and b!93303 (not c!15517)) b!93270))

(assert (= (or b!93302 b!93270) bm!9178))

(assert (= (or b!93302 b!93270) bm!9194))

(assert (= (or b!93302 b!93270) bm!9188))

(assert (= (and b!93298 c!15515) b!93274))

(assert (= (and b!93298 (not c!15515)) b!93267))

(assert (= (and b!93274 c!15524) b!93279))

(assert (= (and b!93274 (not c!15524)) b!93295))

(assert (= (and b!93279 res!47358) b!93307))

(assert (= (and b!93307 res!47366) b!93283))

(assert (= (and b!93295 c!15522) b!93286))

(assert (= (and b!93295 (not c!15522)) b!93287))

(assert (= (and b!93286 res!47364) b!93301))

(assert (= (and b!93301 res!47371) b!93271))

(assert (= (and b!93287 c!15520) b!93289))

(assert (= (and b!93287 (not c!15520)) b!93275))

(assert (= (and b!93289 res!47361) b!93296))

(assert (= (and b!93296 res!47360) b!93292))

(assert (= (or b!93286 b!93289) bm!9183))

(assert (= (or b!93271 b!93292) bm!9190))

(assert (= (or b!93307 bm!9183) bm!9182))

(assert (= (or b!93279 b!93295) bm!9197))

(assert (= (and b!93267 c!15519) b!93284))

(assert (= (and b!93267 (not c!15519)) b!93285))

(assert (= (and b!93285 c!15512) b!93266))

(assert (= (and b!93285 (not c!15512)) b!93294))

(assert (= (and b!93294 c!15516) b!93277))

(assert (= (and b!93294 (not c!15516)) b!93291))

(assert (= (and b!93277 res!47368) b!93281))

(assert (= (and b!93281 res!47367) b!93278))

(assert (= (and b!93291 c!15511) b!93269))

(assert (= (and b!93291 (not c!15511)) b!93280))

(assert (= (and b!93269 res!47369) b!93300))

(assert (= (and b!93300 res!47370) b!93297))

(assert (= (and b!93280 c!15513) b!93293))

(assert (= (and b!93280 (not c!15513)) b!93290))

(assert (= (and b!93293 res!47365) b!93282))

(assert (= (and b!93282 res!47363) b!93304))

(assert (= (or b!93269 b!93293) bm!9186))

(assert (= (or b!93297 b!93304) bm!9191))

(assert (= (or b!93281 bm!9186) bm!9177))

(assert (= (or b!93277 b!93291) bm!9193))

(assert (= (or b!93284 b!93266) bm!9176))

(assert (= (or bm!9190 bm!9191) bm!9175))

(assert (= (or b!93295 b!93291) bm!9185))

(assert (= (or b!93274 b!93294) bm!9181))

(assert (= (or bm!9182 bm!9177) bm!9179))

(assert (= (or bm!9197 bm!9193) bm!9174))

(assert (= (or b!93279 b!93277) bm!9180))

(assert (= (or b!93274 b!93294) bm!9192))

(assert (= (and bm!9192 c!15523) b!93305))

(assert (= (and bm!9192 (not c!15523)) b!93299))

(assert (= (or bm!9178 b!93294) bm!9196))

(assert (= (or bm!9194 bm!9181) bm!9184))

(assert (= (or bm!9188 b!93294) bm!9189))

(assert (= (and bm!9189 c!15514) b!93272))

(assert (= (and bm!9189 (not c!15514)) b!93273))

(assert (= (and d!24495 res!47362) b!93268))

(assert (= (and b!93268 c!15521) b!93276))

(assert (= (and b!93268 (not c!15521)) b!93306))

(assert (= (and b!93276 res!47359) b!93288))

(assert (= (or b!93276 b!93288 b!93306) bm!9187))

(assert (= (or b!93288 b!93306) bm!9195))

(declare-fun m!100541 () Bool)

(assert (=> b!93288 m!100541))

(declare-fun m!100543 () Bool)

(assert (=> bm!9189 m!100543))

(assert (=> b!93273 m!100471))

(declare-fun m!100545 () Bool)

(assert (=> b!93300 m!100545))

(declare-fun m!100547 () Bool)

(assert (=> bm!9179 m!100547))

(assert (=> bm!9176 m!100255))

(declare-fun m!100549 () Bool)

(assert (=> bm!9176 m!100549))

(declare-fun m!100551 () Bool)

(assert (=> bm!9184 m!100551))

(declare-fun m!100553 () Bool)

(assert (=> b!93278 m!100553))

(assert (=> bm!9195 m!100237))

(declare-fun m!100555 () Bool)

(assert (=> b!93283 m!100555))

(declare-fun m!100557 () Bool)

(assert (=> b!93296 m!100557))

(declare-fun m!100559 () Bool)

(assert (=> bm!9187 m!100559))

(declare-fun m!100561 () Bool)

(assert (=> bm!9196 m!100561))

(declare-fun m!100563 () Bool)

(assert (=> bm!9196 m!100563))

(assert (=> bm!9185 m!100255))

(declare-fun m!100565 () Bool)

(assert (=> bm!9185 m!100565))

(declare-fun m!100567 () Bool)

(assert (=> b!93301 m!100567))

(assert (=> bm!9174 m!100255))

(declare-fun m!100569 () Bool)

(assert (=> bm!9174 m!100569))

(assert (=> bm!9180 m!100255))

(declare-fun m!100571 () Bool)

(assert (=> bm!9180 m!100571))

(declare-fun m!100573 () Bool)

(assert (=> b!93270 m!100573))

(declare-fun m!100575 () Bool)

(assert (=> b!93302 m!100575))

(assert (=> b!93276 m!100255))

(declare-fun m!100577 () Bool)

(assert (=> b!93276 m!100577))

(assert (=> bm!9175 m!100255))

(declare-fun m!100579 () Bool)

(assert (=> bm!9175 m!100579))

(declare-fun m!100581 () Bool)

(assert (=> d!24495 m!100581))

(assert (=> d!24495 m!100243))

(declare-fun m!100583 () Bool)

(assert (=> b!93282 m!100583))

(declare-fun m!100585 () Bool)

(assert (=> b!93294 m!100585))

(assert (=> b!93294 m!100561))

(assert (=> b!93294 m!100585))

(declare-fun m!100587 () Bool)

(assert (=> b!93294 m!100587))

(assert (=> b!93294 m!100255))

(declare-fun m!100589 () Bool)

(assert (=> b!93294 m!100589))

(declare-fun m!100591 () Bool)

(assert (=> b!93294 m!100591))

(assert (=> b!93298 m!100255))

(assert (=> b!93298 m!100569))

(assert (=> b!93299 m!100471))

(assert (=> bm!9192 m!100255))

(declare-fun m!100593 () Bool)

(assert (=> bm!9192 m!100593))

(assert (=> b!92924 d!24495))

(declare-fun d!24497 () Bool)

(assert (=> d!24497 (= (array_inv!1219 (_keys!4106 newMap!16)) (bvsge (size!2224 (_keys!4106 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!92922 d!24497))

(declare-fun d!24499 () Bool)

(assert (=> d!24499 (= (array_inv!1220 (_values!2407 newMap!16)) (bvsge (size!2225 (_values!2407 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!92922 d!24499))

(declare-fun d!24501 () Bool)

(assert (=> d!24501 (= (+!126 (+!126 lt!45784 (tuple2!2271 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790)) (tuple2!2271 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2748 (underlying!324 thiss!992))))) (+!126 (+!126 lt!45784 (tuple2!2271 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2748 (underlying!324 thiss!992))))) (tuple2!2271 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790)))))

(declare-fun lt!46077 () Unit!2761)

(declare-fun choose!564 (ListLongMap!1483 (_ BitVec 64) V!3113 (_ BitVec 64) V!3113) Unit!2761)

(assert (=> d!24501 (= lt!46077 (choose!564 lt!45784 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))))))

(assert (=> d!24501 (not (= (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24501 (= (addCommutativeForDiffKeys!46 lt!45784 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))) lt!46077)))

(declare-fun bs!3853 () Bool)

(assert (= bs!3853 d!24501))

(declare-fun m!100595 () Bool)

(assert (=> bs!3853 m!100595))

(declare-fun m!100597 () Bool)

(assert (=> bs!3853 m!100597))

(assert (=> bs!3853 m!100255))

(declare-fun m!100599 () Bool)

(assert (=> bs!3853 m!100599))

(assert (=> bs!3853 m!100595))

(declare-fun m!100601 () Bool)

(assert (=> bs!3853 m!100601))

(assert (=> bs!3853 m!100597))

(declare-fun m!100603 () Bool)

(assert (=> bs!3853 m!100603))

(assert (=> b!92921 d!24501))

(declare-fun d!24503 () Bool)

(declare-fun e!60904 () Bool)

(assert (=> d!24503 e!60904))

(declare-fun res!47376 () Bool)

(assert (=> d!24503 (=> (not res!47376) (not e!60904))))

(declare-fun lt!46088 () ListLongMap!1483)

(assert (=> d!24503 (= res!47376 (contains!775 lt!46088 (_1!1146 lt!45776)))))

(declare-fun lt!46089 () List!1548)

(assert (=> d!24503 (= lt!46088 (ListLongMap!1484 lt!46089))))

(declare-fun lt!46087 () Unit!2761)

(declare-fun lt!46086 () Unit!2761)

(assert (=> d!24503 (= lt!46087 lt!46086)))

(assert (=> d!24503 (= (getValueByKey!147 lt!46089 (_1!1146 lt!45776)) (Some!152 (_2!1146 lt!45776)))))

(declare-fun lemmaContainsTupThenGetReturnValue!64 (List!1548 (_ BitVec 64) V!3113) Unit!2761)

(assert (=> d!24503 (= lt!46086 (lemmaContainsTupThenGetReturnValue!64 lt!46089 (_1!1146 lt!45776) (_2!1146 lt!45776)))))

(declare-fun insertStrictlySorted!67 (List!1548 (_ BitVec 64) V!3113) List!1548)

(assert (=> d!24503 (= lt!46089 (insertStrictlySorted!67 (toList!757 lt!45791) (_1!1146 lt!45776) (_2!1146 lt!45776)))))

(assert (=> d!24503 (= (+!126 lt!45791 lt!45776) lt!46088)))

(declare-fun b!93312 () Bool)

(declare-fun res!47377 () Bool)

(assert (=> b!93312 (=> (not res!47377) (not e!60904))))

(assert (=> b!93312 (= res!47377 (= (getValueByKey!147 (toList!757 lt!46088) (_1!1146 lt!45776)) (Some!152 (_2!1146 lt!45776))))))

(declare-fun b!93313 () Bool)

(declare-fun contains!777 (List!1548 tuple2!2270) Bool)

(assert (=> b!93313 (= e!60904 (contains!777 (toList!757 lt!46088) lt!45776))))

(assert (= (and d!24503 res!47376) b!93312))

(assert (= (and b!93312 res!47377) b!93313))

(declare-fun m!100605 () Bool)

(assert (=> d!24503 m!100605))

(declare-fun m!100607 () Bool)

(assert (=> d!24503 m!100607))

(declare-fun m!100609 () Bool)

(assert (=> d!24503 m!100609))

(declare-fun m!100611 () Bool)

(assert (=> d!24503 m!100611))

(declare-fun m!100613 () Bool)

(assert (=> b!93312 m!100613))

(declare-fun m!100615 () Bool)

(assert (=> b!93313 m!100615))

(assert (=> b!92921 d!24503))

(declare-fun b!93314 () Bool)

(declare-fun e!60907 () Bool)

(assert (=> b!93314 (= e!60907 (validKeyInArray!0 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(declare-fun b!93315 () Bool)

(declare-fun e!60913 () Bool)

(declare-fun lt!46105 () ListLongMap!1483)

(assert (=> b!93315 (= e!60913 (= (apply!88 lt!46105 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun b!93316 () Bool)

(declare-fun e!60909 () Bool)

(assert (=> b!93316 (= e!60909 (= (apply!88 lt!46105 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)) (get!1262 (select (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) from!355) (dynLambda!364 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!93316 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2225 (_values!2407 (v!2748 (underlying!324 thiss!992))))))))

(assert (=> b!93316 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun b!93317 () Bool)

(declare-fun e!60905 () ListLongMap!1483)

(declare-fun call!9202 () ListLongMap!1483)

(assert (=> b!93317 (= e!60905 call!9202)))

(declare-fun b!93318 () Bool)

(declare-fun e!60915 () Unit!2761)

(declare-fun lt!46098 () Unit!2761)

(assert (=> b!93318 (= e!60915 lt!46098)))

(declare-fun lt!46103 () ListLongMap!1483)

(assert (=> b!93318 (= lt!46103 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) from!355 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun lt!46093 () (_ BitVec 64))

(assert (=> b!93318 (= lt!46093 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46106 () (_ BitVec 64))

(assert (=> b!93318 (= lt!46106 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355))))

(declare-fun lt!46095 () Unit!2761)

(assert (=> b!93318 (= lt!46095 (addStillContains!64 lt!46103 lt!46093 (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) lt!46106))))

(assert (=> b!93318 (contains!775 (+!126 lt!46103 (tuple2!2271 lt!46093 (zeroValue!2311 (v!2748 (underlying!324 thiss!992))))) lt!46106)))

(declare-fun lt!46091 () Unit!2761)

(assert (=> b!93318 (= lt!46091 lt!46095)))

(declare-fun lt!46102 () ListLongMap!1483)

(assert (=> b!93318 (= lt!46102 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) from!355 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun lt!46094 () (_ BitVec 64))

(assert (=> b!93318 (= lt!46094 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46092 () (_ BitVec 64))

(assert (=> b!93318 (= lt!46092 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355))))

(declare-fun lt!46100 () Unit!2761)

(assert (=> b!93318 (= lt!46100 (addApplyDifferent!64 lt!46102 lt!46094 (minValue!2311 (v!2748 (underlying!324 thiss!992))) lt!46092))))

(assert (=> b!93318 (= (apply!88 (+!126 lt!46102 (tuple2!2271 lt!46094 (minValue!2311 (v!2748 (underlying!324 thiss!992))))) lt!46092) (apply!88 lt!46102 lt!46092))))

(declare-fun lt!46111 () Unit!2761)

(assert (=> b!93318 (= lt!46111 lt!46100)))

(declare-fun lt!46090 () ListLongMap!1483)

(assert (=> b!93318 (= lt!46090 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) from!355 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun lt!46097 () (_ BitVec 64))

(assert (=> b!93318 (= lt!46097 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46101 () (_ BitVec 64))

(assert (=> b!93318 (= lt!46101 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355))))

(declare-fun lt!46110 () Unit!2761)

(assert (=> b!93318 (= lt!46110 (addApplyDifferent!64 lt!46090 lt!46097 (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) lt!46101))))

(assert (=> b!93318 (= (apply!88 (+!126 lt!46090 (tuple2!2271 lt!46097 (zeroValue!2311 (v!2748 (underlying!324 thiss!992))))) lt!46101) (apply!88 lt!46090 lt!46101))))

(declare-fun lt!46108 () Unit!2761)

(assert (=> b!93318 (= lt!46108 lt!46110)))

(declare-fun lt!46099 () ListLongMap!1483)

(assert (=> b!93318 (= lt!46099 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) from!355 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun lt!46109 () (_ BitVec 64))

(assert (=> b!93318 (= lt!46109 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46104 () (_ BitVec 64))

(assert (=> b!93318 (= lt!46104 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355))))

(assert (=> b!93318 (= lt!46098 (addApplyDifferent!64 lt!46099 lt!46109 (minValue!2311 (v!2748 (underlying!324 thiss!992))) lt!46104))))

(assert (=> b!93318 (= (apply!88 (+!126 lt!46099 (tuple2!2271 lt!46109 (minValue!2311 (v!2748 (underlying!324 thiss!992))))) lt!46104) (apply!88 lt!46099 lt!46104))))

(declare-fun bm!9198 () Bool)

(declare-fun call!9204 () ListLongMap!1483)

(declare-fun call!9203 () ListLongMap!1483)

(assert (=> bm!9198 (= call!9204 call!9203)))

(declare-fun bm!9199 () Bool)

(declare-fun call!9201 () ListLongMap!1483)

(declare-fun call!9206 () ListLongMap!1483)

(assert (=> bm!9199 (= call!9201 call!9206)))

(declare-fun b!93319 () Bool)

(declare-fun e!60912 () Bool)

(assert (=> b!93319 (= e!60912 (= (apply!88 lt!46105 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2311 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun b!93320 () Bool)

(declare-fun c!15530 () Bool)

(assert (=> b!93320 (= c!15530 (and (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!60914 () ListLongMap!1483)

(assert (=> b!93320 (= e!60914 e!60905)))

(declare-fun b!93321 () Bool)

(declare-fun e!60911 () Bool)

(declare-fun call!9205 () Bool)

(assert (=> b!93321 (= e!60911 (not call!9205))))

(declare-fun b!93322 () Bool)

(declare-fun e!60906 () Bool)

(assert (=> b!93322 (= e!60906 e!60909)))

(declare-fun res!47381 () Bool)

(assert (=> b!93322 (=> (not res!47381) (not e!60909))))

(assert (=> b!93322 (= res!47381 (contains!775 lt!46105 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(assert (=> b!93322 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun bm!9200 () Bool)

(assert (=> bm!9200 (= call!9205 (contains!775 lt!46105 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!93323 () Bool)

(declare-fun e!60910 () ListLongMap!1483)

(assert (=> b!93323 (= e!60910 (+!126 call!9206 (tuple2!2271 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun b!93324 () Bool)

(declare-fun e!60908 () Bool)

(assert (=> b!93324 (= e!60908 (validKeyInArray!0 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(declare-fun b!93325 () Bool)

(assert (=> b!93325 (= e!60910 e!60914)))

(declare-fun c!15529 () Bool)

(assert (=> b!93325 (= c!15529 (and (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93326 () Bool)

(declare-fun e!60916 () Bool)

(assert (=> b!93326 (= e!60916 e!60911)))

(declare-fun c!15528 () Bool)

(assert (=> b!93326 (= c!15528 (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!93327 () Bool)

(assert (=> b!93327 (= e!60914 call!9201)))

(declare-fun b!93328 () Bool)

(assert (=> b!93328 (= e!60905 call!9201)))

(declare-fun b!93329 () Bool)

(declare-fun res!47386 () Bool)

(assert (=> b!93329 (=> (not res!47386) (not e!60916))))

(declare-fun e!60917 () Bool)

(assert (=> b!93329 (= res!47386 e!60917)))

(declare-fun c!15526 () Bool)

(assert (=> b!93329 (= c!15526 (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!93330 () Bool)

(declare-fun res!47378 () Bool)

(assert (=> b!93330 (=> (not res!47378) (not e!60916))))

(assert (=> b!93330 (= res!47378 e!60906)))

(declare-fun res!47384 () Bool)

(assert (=> b!93330 (=> res!47384 e!60906)))

(assert (=> b!93330 (= res!47384 (not e!60907))))

(declare-fun res!47383 () Bool)

(assert (=> b!93330 (=> (not res!47383) (not e!60907))))

(assert (=> b!93330 (= res!47383 (bvslt from!355 (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun b!93331 () Bool)

(assert (=> b!93331 (= e!60911 e!60912)))

(declare-fun res!47380 () Bool)

(assert (=> b!93331 (= res!47380 call!9205)))

(assert (=> b!93331 (=> (not res!47380) (not e!60912))))

(declare-fun b!93332 () Bool)

(assert (=> b!93332 (= e!60917 e!60913)))

(declare-fun res!47382 () Bool)

(declare-fun call!9207 () Bool)

(assert (=> b!93332 (= res!47382 call!9207)))

(assert (=> b!93332 (=> (not res!47382) (not e!60913))))

(declare-fun d!24505 () Bool)

(assert (=> d!24505 e!60916))

(declare-fun res!47379 () Bool)

(assert (=> d!24505 (=> (not res!47379) (not e!60916))))

(assert (=> d!24505 (= res!47379 (or (bvsge from!355 (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))) (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))))

(declare-fun lt!46107 () ListLongMap!1483)

(assert (=> d!24505 (= lt!46105 lt!46107)))

(declare-fun lt!46096 () Unit!2761)

(assert (=> d!24505 (= lt!46096 e!60915)))

(declare-fun c!15527 () Bool)

(assert (=> d!24505 (= c!15527 e!60908)))

(declare-fun res!47385 () Bool)

(assert (=> d!24505 (=> (not res!47385) (not e!60908))))

(assert (=> d!24505 (= res!47385 (bvslt from!355 (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(assert (=> d!24505 (= lt!46107 e!60910)))

(declare-fun c!15525 () Bool)

(assert (=> d!24505 (= c!15525 (and (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24505 (validMask!0 (mask!6494 (v!2748 (underlying!324 thiss!992))))))

(assert (=> d!24505 (= (getCurrentListMap!447 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) from!355 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))) lt!46105)))

(declare-fun bm!9201 () Bool)

(assert (=> bm!9201 (= call!9206 (+!126 (ite c!15525 call!9203 (ite c!15529 call!9204 call!9202)) (ite (or c!15525 c!15529) (tuple2!2271 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))) (tuple2!2271 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2748 (underlying!324 thiss!992)))))))))

(declare-fun bm!9202 () Bool)

(assert (=> bm!9202 (= call!9202 call!9204)))

(declare-fun b!93333 () Bool)

(assert (=> b!93333 (= e!60917 (not call!9207))))

(declare-fun bm!9203 () Bool)

(assert (=> bm!9203 (= call!9207 (contains!775 lt!46105 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9204 () Bool)

(assert (=> bm!9204 (= call!9203 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) from!355 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun b!93334 () Bool)

(declare-fun Unit!2772 () Unit!2761)

(assert (=> b!93334 (= e!60915 Unit!2772)))

(assert (= (and d!24505 c!15525) b!93323))

(assert (= (and d!24505 (not c!15525)) b!93325))

(assert (= (and b!93325 c!15529) b!93327))

(assert (= (and b!93325 (not c!15529)) b!93320))

(assert (= (and b!93320 c!15530) b!93328))

(assert (= (and b!93320 (not c!15530)) b!93317))

(assert (= (or b!93328 b!93317) bm!9202))

(assert (= (or b!93327 bm!9202) bm!9198))

(assert (= (or b!93327 b!93328) bm!9199))

(assert (= (or b!93323 bm!9198) bm!9204))

(assert (= (or b!93323 bm!9199) bm!9201))

(assert (= (and d!24505 res!47385) b!93324))

(assert (= (and d!24505 c!15527) b!93318))

(assert (= (and d!24505 (not c!15527)) b!93334))

(assert (= (and d!24505 res!47379) b!93330))

(assert (= (and b!93330 res!47383) b!93314))

(assert (= (and b!93330 (not res!47384)) b!93322))

(assert (= (and b!93322 res!47381) b!93316))

(assert (= (and b!93330 res!47378) b!93329))

(assert (= (and b!93329 c!15526) b!93332))

(assert (= (and b!93329 (not c!15526)) b!93333))

(assert (= (and b!93332 res!47382) b!93315))

(assert (= (or b!93332 b!93333) bm!9203))

(assert (= (and b!93329 res!47386) b!93326))

(assert (= (and b!93326 c!15528) b!93331))

(assert (= (and b!93326 (not c!15528)) b!93321))

(assert (= (and b!93331 res!47380) b!93319))

(assert (= (or b!93331 b!93321) bm!9200))

(declare-fun b_lambda!4109 () Bool)

(assert (=> (not b_lambda!4109) (not b!93316)))

(assert (=> b!93316 t!5415))

(declare-fun b_and!5681 () Bool)

(assert (= b_and!5677 (and (=> t!5415 result!3137) b_and!5681)))

(assert (=> b!93316 t!5417))

(declare-fun b_and!5683 () Bool)

(assert (= b_and!5679 (and (=> t!5417 result!3141) b_and!5683)))

(declare-fun m!100617 () Bool)

(assert (=> b!93323 m!100617))

(assert (=> b!93316 m!100303))

(assert (=> b!93316 m!100255))

(assert (=> b!93316 m!100255))

(declare-fun m!100619 () Bool)

(assert (=> b!93316 m!100619))

(assert (=> b!93316 m!100305))

(assert (=> b!93316 m!100303))

(assert (=> b!93316 m!100305))

(assert (=> b!93316 m!100307))

(assert (=> b!93324 m!100255))

(assert (=> b!93324 m!100255))

(assert (=> b!93324 m!100469))

(declare-fun m!100621 () Bool)

(assert (=> bm!9200 m!100621))

(declare-fun m!100623 () Bool)

(assert (=> bm!9204 m!100623))

(declare-fun m!100625 () Bool)

(assert (=> b!93318 m!100625))

(declare-fun m!100627 () Bool)

(assert (=> b!93318 m!100627))

(declare-fun m!100629 () Bool)

(assert (=> b!93318 m!100629))

(declare-fun m!100631 () Bool)

(assert (=> b!93318 m!100631))

(assert (=> b!93318 m!100627))

(declare-fun m!100633 () Bool)

(assert (=> b!93318 m!100633))

(declare-fun m!100635 () Bool)

(assert (=> b!93318 m!100635))

(declare-fun m!100637 () Bool)

(assert (=> b!93318 m!100637))

(assert (=> b!93318 m!100631))

(declare-fun m!100639 () Bool)

(assert (=> b!93318 m!100639))

(declare-fun m!100641 () Bool)

(assert (=> b!93318 m!100641))

(declare-fun m!100643 () Bool)

(assert (=> b!93318 m!100643))

(assert (=> b!93318 m!100623))

(assert (=> b!93318 m!100641))

(declare-fun m!100645 () Bool)

(assert (=> b!93318 m!100645))

(assert (=> b!93318 m!100635))

(assert (=> b!93318 m!100255))

(declare-fun m!100647 () Bool)

(assert (=> b!93318 m!100647))

(declare-fun m!100649 () Bool)

(assert (=> b!93318 m!100649))

(declare-fun m!100651 () Bool)

(assert (=> b!93318 m!100651))

(declare-fun m!100653 () Bool)

(assert (=> b!93318 m!100653))

(declare-fun m!100655 () Bool)

(assert (=> bm!9201 m!100655))

(declare-fun m!100657 () Bool)

(assert (=> b!93319 m!100657))

(assert (=> b!93314 m!100255))

(assert (=> b!93314 m!100255))

(assert (=> b!93314 m!100469))

(assert (=> b!93322 m!100255))

(assert (=> b!93322 m!100255))

(declare-fun m!100659 () Bool)

(assert (=> b!93322 m!100659))

(assert (=> d!24505 m!100463))

(declare-fun m!100661 () Bool)

(assert (=> b!93315 m!100661))

(declare-fun m!100663 () Bool)

(assert (=> bm!9203 m!100663))

(assert (=> b!92921 d!24505))

(declare-fun d!24507 () Bool)

(declare-fun e!60918 () Bool)

(assert (=> d!24507 e!60918))

(declare-fun res!47387 () Bool)

(assert (=> d!24507 (=> (not res!47387) (not e!60918))))

(declare-fun lt!46114 () ListLongMap!1483)

(assert (=> d!24507 (= res!47387 (contains!775 lt!46114 (_1!1146 lt!45776)))))

(declare-fun lt!46115 () List!1548)

(assert (=> d!24507 (= lt!46114 (ListLongMap!1484 lt!46115))))

(declare-fun lt!46113 () Unit!2761)

(declare-fun lt!46112 () Unit!2761)

(assert (=> d!24507 (= lt!46113 lt!46112)))

(assert (=> d!24507 (= (getValueByKey!147 lt!46115 (_1!1146 lt!45776)) (Some!152 (_2!1146 lt!45776)))))

(assert (=> d!24507 (= lt!46112 (lemmaContainsTupThenGetReturnValue!64 lt!46115 (_1!1146 lt!45776) (_2!1146 lt!45776)))))

(assert (=> d!24507 (= lt!46115 (insertStrictlySorted!67 (toList!757 lt!45777) (_1!1146 lt!45776) (_2!1146 lt!45776)))))

(assert (=> d!24507 (= (+!126 lt!45777 lt!45776) lt!46114)))

(declare-fun b!93335 () Bool)

(declare-fun res!47388 () Bool)

(assert (=> b!93335 (=> (not res!47388) (not e!60918))))

(assert (=> b!93335 (= res!47388 (= (getValueByKey!147 (toList!757 lt!46114) (_1!1146 lt!45776)) (Some!152 (_2!1146 lt!45776))))))

(declare-fun b!93336 () Bool)

(assert (=> b!93336 (= e!60918 (contains!777 (toList!757 lt!46114) lt!45776))))

(assert (= (and d!24507 res!47387) b!93335))

(assert (= (and b!93335 res!47388) b!93336))

(declare-fun m!100665 () Bool)

(assert (=> d!24507 m!100665))

(declare-fun m!100667 () Bool)

(assert (=> d!24507 m!100667))

(declare-fun m!100669 () Bool)

(assert (=> d!24507 m!100669))

(declare-fun m!100671 () Bool)

(assert (=> d!24507 m!100671))

(declare-fun m!100673 () Bool)

(assert (=> b!93335 m!100673))

(declare-fun m!100675 () Bool)

(assert (=> b!93336 m!100675))

(assert (=> b!92921 d!24507))

(declare-fun d!24509 () Bool)

(assert (=> d!24509 (= (+!126 (+!126 lt!45791 (tuple2!2271 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790)) (tuple2!2271 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2748 (underlying!324 thiss!992))))) (+!126 (+!126 lt!45791 (tuple2!2271 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2748 (underlying!324 thiss!992))))) (tuple2!2271 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790)))))

(declare-fun lt!46116 () Unit!2761)

(assert (=> d!24509 (= lt!46116 (choose!564 lt!45791 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2748 (underlying!324 thiss!992)))))))

(assert (=> d!24509 (not (= (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24509 (= (addCommutativeForDiffKeys!46 lt!45791 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) from!355) lt!45790 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2311 (v!2748 (underlying!324 thiss!992)))) lt!46116)))

(declare-fun bs!3854 () Bool)

(assert (= bs!3854 d!24509))

(declare-fun m!100677 () Bool)

(assert (=> bs!3854 m!100677))

(declare-fun m!100679 () Bool)

(assert (=> bs!3854 m!100679))

(assert (=> bs!3854 m!100255))

(declare-fun m!100681 () Bool)

(assert (=> bs!3854 m!100681))

(assert (=> bs!3854 m!100677))

(declare-fun m!100683 () Bool)

(assert (=> bs!3854 m!100683))

(assert (=> bs!3854 m!100679))

(declare-fun m!100685 () Bool)

(assert (=> bs!3854 m!100685))

(assert (=> b!92921 d!24509))

(declare-fun b!93361 () Bool)

(assert (=> b!93361 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(assert (=> b!93361 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2225 (_values!2407 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun lt!46132 () ListLongMap!1483)

(declare-fun e!60933 () Bool)

(assert (=> b!93361 (= e!60933 (= (apply!88 lt!46132 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1262 (select (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!364 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!93362 () Bool)

(declare-fun e!60938 () Bool)

(assert (=> b!93362 (= e!60938 (validKeyInArray!0 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!93362 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!93363 () Bool)

(declare-fun res!47399 () Bool)

(declare-fun e!60934 () Bool)

(assert (=> b!93363 (=> (not res!47399) (not e!60934))))

(assert (=> b!93363 (= res!47399 (not (contains!775 lt!46132 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93364 () Bool)

(declare-fun e!60939 () Bool)

(assert (=> b!93364 (= e!60939 e!60933)))

(assert (=> b!93364 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun res!47397 () Bool)

(assert (=> b!93364 (= res!47397 (contains!775 lt!46132 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!93364 (=> (not res!47397) (not e!60933))))

(declare-fun d!24511 () Bool)

(assert (=> d!24511 e!60934))

(declare-fun res!47400 () Bool)

(assert (=> d!24511 (=> (not res!47400) (not e!60934))))

(assert (=> d!24511 (= res!47400 (not (contains!775 lt!46132 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!60937 () ListLongMap!1483)

(assert (=> d!24511 (= lt!46132 e!60937)))

(declare-fun c!15539 () Bool)

(assert (=> d!24511 (= c!15539 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(assert (=> d!24511 (validMask!0 (mask!6494 (v!2748 (underlying!324 thiss!992))))))

(assert (=> d!24511 (= (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))) lt!46132)))

(declare-fun b!93365 () Bool)

(declare-fun e!60935 () ListLongMap!1483)

(assert (=> b!93365 (= e!60937 e!60935)))

(declare-fun c!15542 () Bool)

(assert (=> b!93365 (= c!15542 (validKeyInArray!0 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!93366 () Bool)

(assert (=> b!93366 (= e!60937 (ListLongMap!1484 Nil!1545))))

(declare-fun b!93367 () Bool)

(declare-fun call!9210 () ListLongMap!1483)

(assert (=> b!93367 (= e!60935 call!9210)))

(declare-fun b!93368 () Bool)

(assert (=> b!93368 (= e!60934 e!60939)))

(declare-fun c!15541 () Bool)

(assert (=> b!93368 (= c!15541 e!60938)))

(declare-fun res!47398 () Bool)

(assert (=> b!93368 (=> (not res!47398) (not e!60938))))

(assert (=> b!93368 (= res!47398 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun b!93369 () Bool)

(declare-fun lt!46131 () Unit!2761)

(declare-fun lt!46136 () Unit!2761)

(assert (=> b!93369 (= lt!46131 lt!46136)))

(declare-fun lt!46135 () ListLongMap!1483)

(declare-fun lt!46137 () (_ BitVec 64))

(declare-fun lt!46133 () (_ BitVec 64))

(declare-fun lt!46134 () V!3113)

(assert (=> b!93369 (not (contains!775 (+!126 lt!46135 (tuple2!2271 lt!46133 lt!46134)) lt!46137))))

(declare-fun addStillNotContains!39 (ListLongMap!1483 (_ BitVec 64) V!3113 (_ BitVec 64)) Unit!2761)

(assert (=> b!93369 (= lt!46136 (addStillNotContains!39 lt!46135 lt!46133 lt!46134 lt!46137))))

(assert (=> b!93369 (= lt!46137 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!93369 (= lt!46134 (get!1262 (select (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!364 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!93369 (= lt!46133 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!93369 (= lt!46135 call!9210)))

(assert (=> b!93369 (= e!60935 (+!126 call!9210 (tuple2!2271 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1262 (select (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!364 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!93370 () Bool)

(declare-fun e!60936 () Bool)

(assert (=> b!93370 (= e!60939 e!60936)))

(declare-fun c!15540 () Bool)

(assert (=> b!93370 (= c!15540 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))))))

(declare-fun b!93371 () Bool)

(declare-fun isEmpty!355 (ListLongMap!1483) Bool)

(assert (=> b!93371 (= e!60936 (isEmpty!355 lt!46132))))

(declare-fun bm!9207 () Bool)

(assert (=> bm!9207 (= call!9210 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun b!93372 () Bool)

(assert (=> b!93372 (= e!60936 (= lt!46132 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))))))))

(assert (= (and d!24511 c!15539) b!93366))

(assert (= (and d!24511 (not c!15539)) b!93365))

(assert (= (and b!93365 c!15542) b!93369))

(assert (= (and b!93365 (not c!15542)) b!93367))

(assert (= (or b!93369 b!93367) bm!9207))

(assert (= (and d!24511 res!47400) b!93363))

(assert (= (and b!93363 res!47399) b!93368))

(assert (= (and b!93368 res!47398) b!93362))

(assert (= (and b!93368 c!15541) b!93364))

(assert (= (and b!93368 (not c!15541)) b!93370))

(assert (= (and b!93364 res!47397) b!93361))

(assert (= (and b!93370 c!15540) b!93372))

(assert (= (and b!93370 (not c!15540)) b!93371))

(declare-fun b_lambda!4111 () Bool)

(assert (=> (not b_lambda!4111) (not b!93361)))

(assert (=> b!93361 t!5415))

(declare-fun b_and!5685 () Bool)

(assert (= b_and!5681 (and (=> t!5415 result!3137) b_and!5685)))

(assert (=> b!93361 t!5417))

(declare-fun b_and!5687 () Bool)

(assert (= b_and!5683 (and (=> t!5417 result!3141) b_and!5687)))

(declare-fun b_lambda!4113 () Bool)

(assert (=> (not b_lambda!4113) (not b!93369)))

(assert (=> b!93369 t!5415))

(declare-fun b_and!5689 () Bool)

(assert (= b_and!5685 (and (=> t!5415 result!3137) b_and!5689)))

(assert (=> b!93369 t!5417))

(declare-fun b_and!5691 () Bool)

(assert (= b_and!5687 (and (=> t!5417 result!3141) b_and!5691)))

(assert (=> b!93362 m!100457))

(assert (=> b!93362 m!100457))

(assert (=> b!93362 m!100481))

(assert (=> b!93365 m!100457))

(assert (=> b!93365 m!100457))

(assert (=> b!93365 m!100481))

(assert (=> b!93361 m!100305))

(assert (=> b!93361 m!100475))

(assert (=> b!93361 m!100305))

(assert (=> b!93361 m!100479))

(assert (=> b!93361 m!100457))

(assert (=> b!93361 m!100475))

(assert (=> b!93361 m!100457))

(declare-fun m!100687 () Bool)

(assert (=> b!93361 m!100687))

(declare-fun m!100689 () Bool)

(assert (=> b!93372 m!100689))

(declare-fun m!100691 () Bool)

(assert (=> b!93371 m!100691))

(assert (=> bm!9207 m!100689))

(declare-fun m!100693 () Bool)

(assert (=> b!93363 m!100693))

(assert (=> b!93364 m!100457))

(assert (=> b!93364 m!100457))

(declare-fun m!100695 () Bool)

(assert (=> b!93364 m!100695))

(declare-fun m!100697 () Bool)

(assert (=> d!24511 m!100697))

(assert (=> d!24511 m!100463))

(declare-fun m!100699 () Bool)

(assert (=> b!93369 m!100699))

(declare-fun m!100701 () Bool)

(assert (=> b!93369 m!100701))

(assert (=> b!93369 m!100305))

(assert (=> b!93369 m!100475))

(assert (=> b!93369 m!100305))

(assert (=> b!93369 m!100479))

(assert (=> b!93369 m!100457))

(declare-fun m!100703 () Bool)

(assert (=> b!93369 m!100703))

(assert (=> b!93369 m!100475))

(assert (=> b!93369 m!100701))

(declare-fun m!100705 () Bool)

(assert (=> b!93369 m!100705))

(assert (=> b!92921 d!24511))

(declare-fun d!24513 () Bool)

(declare-fun e!60940 () Bool)

(assert (=> d!24513 e!60940))

(declare-fun res!47401 () Bool)

(assert (=> d!24513 (=> (not res!47401) (not e!60940))))

(declare-fun lt!46140 () ListLongMap!1483)

(assert (=> d!24513 (= res!47401 (contains!775 lt!46140 (_1!1146 lt!45775)))))

(declare-fun lt!46141 () List!1548)

(assert (=> d!24513 (= lt!46140 (ListLongMap!1484 lt!46141))))

(declare-fun lt!46139 () Unit!2761)

(declare-fun lt!46138 () Unit!2761)

(assert (=> d!24513 (= lt!46139 lt!46138)))

(assert (=> d!24513 (= (getValueByKey!147 lt!46141 (_1!1146 lt!45775)) (Some!152 (_2!1146 lt!45775)))))

(assert (=> d!24513 (= lt!46138 (lemmaContainsTupThenGetReturnValue!64 lt!46141 (_1!1146 lt!45775) (_2!1146 lt!45775)))))

(assert (=> d!24513 (= lt!46141 (insertStrictlySorted!67 (toList!757 lt!45791) (_1!1146 lt!45775) (_2!1146 lt!45775)))))

(assert (=> d!24513 (= (+!126 lt!45791 lt!45775) lt!46140)))

(declare-fun b!93373 () Bool)

(declare-fun res!47402 () Bool)

(assert (=> b!93373 (=> (not res!47402) (not e!60940))))

(assert (=> b!93373 (= res!47402 (= (getValueByKey!147 (toList!757 lt!46140) (_1!1146 lt!45775)) (Some!152 (_2!1146 lt!45775))))))

(declare-fun b!93374 () Bool)

(assert (=> b!93374 (= e!60940 (contains!777 (toList!757 lt!46140) lt!45775))))

(assert (= (and d!24513 res!47401) b!93373))

(assert (= (and b!93373 res!47402) b!93374))

(declare-fun m!100707 () Bool)

(assert (=> d!24513 m!100707))

(declare-fun m!100709 () Bool)

(assert (=> d!24513 m!100709))

(declare-fun m!100711 () Bool)

(assert (=> d!24513 m!100711))

(declare-fun m!100713 () Bool)

(assert (=> d!24513 m!100713))

(declare-fun m!100715 () Bool)

(assert (=> b!93373 m!100715))

(declare-fun m!100717 () Bool)

(assert (=> b!93374 m!100717))

(assert (=> b!92921 d!24513))

(declare-fun d!24515 () Bool)

(declare-fun e!60941 () Bool)

(assert (=> d!24515 e!60941))

(declare-fun res!47403 () Bool)

(assert (=> d!24515 (=> (not res!47403) (not e!60941))))

(declare-fun lt!46144 () ListLongMap!1483)

(assert (=> d!24515 (= res!47403 (contains!775 lt!46144 (_1!1146 lt!45775)))))

(declare-fun lt!46145 () List!1548)

(assert (=> d!24515 (= lt!46144 (ListLongMap!1484 lt!46145))))

(declare-fun lt!46143 () Unit!2761)

(declare-fun lt!46142 () Unit!2761)

(assert (=> d!24515 (= lt!46143 lt!46142)))

(assert (=> d!24515 (= (getValueByKey!147 lt!46145 (_1!1146 lt!45775)) (Some!152 (_2!1146 lt!45775)))))

(assert (=> d!24515 (= lt!46142 (lemmaContainsTupThenGetReturnValue!64 lt!46145 (_1!1146 lt!45775) (_2!1146 lt!45775)))))

(assert (=> d!24515 (= lt!46145 (insertStrictlySorted!67 (toList!757 lt!45784) (_1!1146 lt!45775) (_2!1146 lt!45775)))))

(assert (=> d!24515 (= (+!126 lt!45784 lt!45775) lt!46144)))

(declare-fun b!93375 () Bool)

(declare-fun res!47404 () Bool)

(assert (=> b!93375 (=> (not res!47404) (not e!60941))))

(assert (=> b!93375 (= res!47404 (= (getValueByKey!147 (toList!757 lt!46144) (_1!1146 lt!45775)) (Some!152 (_2!1146 lt!45775))))))

(declare-fun b!93376 () Bool)

(assert (=> b!93376 (= e!60941 (contains!777 (toList!757 lt!46144) lt!45775))))

(assert (= (and d!24515 res!47403) b!93375))

(assert (= (and b!93375 res!47404) b!93376))

(declare-fun m!100719 () Bool)

(assert (=> d!24515 m!100719))

(declare-fun m!100721 () Bool)

(assert (=> d!24515 m!100721))

(declare-fun m!100723 () Bool)

(assert (=> d!24515 m!100723))

(declare-fun m!100725 () Bool)

(assert (=> d!24515 m!100725))

(declare-fun m!100727 () Bool)

(assert (=> b!93375 m!100727))

(declare-fun m!100729 () Bool)

(assert (=> b!93376 m!100729))

(assert (=> b!92921 d!24515))

(declare-fun d!24517 () Bool)

(declare-fun e!60942 () Bool)

(assert (=> d!24517 e!60942))

(declare-fun res!47405 () Bool)

(assert (=> d!24517 (=> (not res!47405) (not e!60942))))

(declare-fun lt!46148 () ListLongMap!1483)

(assert (=> d!24517 (= res!47405 (contains!775 lt!46148 (_1!1146 lt!45778)))))

(declare-fun lt!46149 () List!1548)

(assert (=> d!24517 (= lt!46148 (ListLongMap!1484 lt!46149))))

(declare-fun lt!46147 () Unit!2761)

(declare-fun lt!46146 () Unit!2761)

(assert (=> d!24517 (= lt!46147 lt!46146)))

(assert (=> d!24517 (= (getValueByKey!147 lt!46149 (_1!1146 lt!45778)) (Some!152 (_2!1146 lt!45778)))))

(assert (=> d!24517 (= lt!46146 (lemmaContainsTupThenGetReturnValue!64 lt!46149 (_1!1146 lt!45778) (_2!1146 lt!45778)))))

(assert (=> d!24517 (= lt!46149 (insertStrictlySorted!67 (toList!757 lt!45788) (_1!1146 lt!45778) (_2!1146 lt!45778)))))

(assert (=> d!24517 (= (+!126 lt!45788 lt!45778) lt!46148)))

(declare-fun b!93377 () Bool)

(declare-fun res!47406 () Bool)

(assert (=> b!93377 (=> (not res!47406) (not e!60942))))

(assert (=> b!93377 (= res!47406 (= (getValueByKey!147 (toList!757 lt!46148) (_1!1146 lt!45778)) (Some!152 (_2!1146 lt!45778))))))

(declare-fun b!93378 () Bool)

(assert (=> b!93378 (= e!60942 (contains!777 (toList!757 lt!46148) lt!45778))))

(assert (= (and d!24517 res!47405) b!93377))

(assert (= (and b!93377 res!47406) b!93378))

(declare-fun m!100731 () Bool)

(assert (=> d!24517 m!100731))

(declare-fun m!100733 () Bool)

(assert (=> d!24517 m!100733))

(declare-fun m!100735 () Bool)

(assert (=> d!24517 m!100735))

(declare-fun m!100737 () Bool)

(assert (=> d!24517 m!100737))

(declare-fun m!100739 () Bool)

(assert (=> b!93377 m!100739))

(declare-fun m!100741 () Bool)

(assert (=> b!93378 m!100741))

(assert (=> b!92921 d!24517))

(declare-fun d!24519 () Bool)

(declare-fun e!60943 () Bool)

(assert (=> d!24519 e!60943))

(declare-fun res!47407 () Bool)

(assert (=> d!24519 (=> (not res!47407) (not e!60943))))

(declare-fun lt!46152 () ListLongMap!1483)

(assert (=> d!24519 (= res!47407 (contains!775 lt!46152 (_1!1146 lt!45778)))))

(declare-fun lt!46153 () List!1548)

(assert (=> d!24519 (= lt!46152 (ListLongMap!1484 lt!46153))))

(declare-fun lt!46151 () Unit!2761)

(declare-fun lt!46150 () Unit!2761)

(assert (=> d!24519 (= lt!46151 lt!46150)))

(assert (=> d!24519 (= (getValueByKey!147 lt!46153 (_1!1146 lt!45778)) (Some!152 (_2!1146 lt!45778)))))

(assert (=> d!24519 (= lt!46150 (lemmaContainsTupThenGetReturnValue!64 lt!46153 (_1!1146 lt!45778) (_2!1146 lt!45778)))))

(assert (=> d!24519 (= lt!46153 (insertStrictlySorted!67 (toList!757 lt!45784) (_1!1146 lt!45778) (_2!1146 lt!45778)))))

(assert (=> d!24519 (= (+!126 lt!45784 lt!45778) lt!46152)))

(declare-fun b!93379 () Bool)

(declare-fun res!47408 () Bool)

(assert (=> b!93379 (=> (not res!47408) (not e!60943))))

(assert (=> b!93379 (= res!47408 (= (getValueByKey!147 (toList!757 lt!46152) (_1!1146 lt!45778)) (Some!152 (_2!1146 lt!45778))))))

(declare-fun b!93380 () Bool)

(assert (=> b!93380 (= e!60943 (contains!777 (toList!757 lt!46152) lt!45778))))

(assert (= (and d!24519 res!47407) b!93379))

(assert (= (and b!93379 res!47408) b!93380))

(declare-fun m!100743 () Bool)

(assert (=> d!24519 m!100743))

(declare-fun m!100745 () Bool)

(assert (=> d!24519 m!100745))

(declare-fun m!100747 () Bool)

(assert (=> d!24519 m!100747))

(declare-fun m!100749 () Bool)

(assert (=> d!24519 m!100749))

(declare-fun m!100751 () Bool)

(assert (=> b!93379 m!100751))

(declare-fun m!100753 () Bool)

(assert (=> b!93380 m!100753))

(assert (=> b!92921 d!24519))

(declare-fun d!24521 () Bool)

(assert (=> d!24521 (= (map!1235 (_2!1145 lt!45792)) (getCurrentListMap!447 (_keys!4106 (_2!1145 lt!45792)) (_values!2407 (_2!1145 lt!45792)) (mask!6494 (_2!1145 lt!45792)) (extraKeys!2253 (_2!1145 lt!45792)) (zeroValue!2311 (_2!1145 lt!45792)) (minValue!2311 (_2!1145 lt!45792)) #b00000000000000000000000000000000 (defaultEntry!2424 (_2!1145 lt!45792))))))

(declare-fun bs!3855 () Bool)

(assert (= bs!3855 d!24521))

(declare-fun m!100755 () Bool)

(assert (=> bs!3855 m!100755))

(assert (=> b!92921 d!24521))

(declare-fun d!24523 () Bool)

(declare-fun e!60944 () Bool)

(assert (=> d!24523 e!60944))

(declare-fun res!47409 () Bool)

(assert (=> d!24523 (=> (not res!47409) (not e!60944))))

(declare-fun lt!46156 () ListLongMap!1483)

(assert (=> d!24523 (= res!47409 (contains!775 lt!46156 (_1!1146 lt!45775)))))

(declare-fun lt!46157 () List!1548)

(assert (=> d!24523 (= lt!46156 (ListLongMap!1484 lt!46157))))

(declare-fun lt!46155 () Unit!2761)

(declare-fun lt!46154 () Unit!2761)

(assert (=> d!24523 (= lt!46155 lt!46154)))

(assert (=> d!24523 (= (getValueByKey!147 lt!46157 (_1!1146 lt!45775)) (Some!152 (_2!1146 lt!45775)))))

(assert (=> d!24523 (= lt!46154 (lemmaContainsTupThenGetReturnValue!64 lt!46157 (_1!1146 lt!45775) (_2!1146 lt!45775)))))

(assert (=> d!24523 (= lt!46157 (insertStrictlySorted!67 (toList!757 (+!126 lt!45791 lt!45776)) (_1!1146 lt!45775) (_2!1146 lt!45775)))))

(assert (=> d!24523 (= (+!126 (+!126 lt!45791 lt!45776) lt!45775) lt!46156)))

(declare-fun b!93381 () Bool)

(declare-fun res!47410 () Bool)

(assert (=> b!93381 (=> (not res!47410) (not e!60944))))

(assert (=> b!93381 (= res!47410 (= (getValueByKey!147 (toList!757 lt!46156) (_1!1146 lt!45775)) (Some!152 (_2!1146 lt!45775))))))

(declare-fun b!93382 () Bool)

(assert (=> b!93382 (= e!60944 (contains!777 (toList!757 lt!46156) lt!45775))))

(assert (= (and d!24523 res!47409) b!93381))

(assert (= (and b!93381 res!47410) b!93382))

(declare-fun m!100757 () Bool)

(assert (=> d!24523 m!100757))

(declare-fun m!100759 () Bool)

(assert (=> d!24523 m!100759))

(declare-fun m!100761 () Bool)

(assert (=> d!24523 m!100761))

(declare-fun m!100763 () Bool)

(assert (=> d!24523 m!100763))

(declare-fun m!100765 () Bool)

(assert (=> b!93381 m!100765))

(declare-fun m!100767 () Bool)

(assert (=> b!93382 m!100767))

(assert (=> b!92921 d!24523))

(declare-fun d!24525 () Bool)

(declare-fun res!47411 () Bool)

(declare-fun e!60945 () Bool)

(assert (=> d!24525 (=> (not res!47411) (not e!60945))))

(assert (=> d!24525 (= res!47411 (simpleValid!64 (v!2748 (underlying!324 thiss!992))))))

(assert (=> d!24525 (= (valid!377 (v!2748 (underlying!324 thiss!992))) e!60945)))

(declare-fun b!93383 () Bool)

(declare-fun res!47412 () Bool)

(assert (=> b!93383 (=> (not res!47412) (not e!60945))))

(assert (=> b!93383 (= res!47412 (= (arrayCountValidKeys!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000000 (size!2224 (_keys!4106 (v!2748 (underlying!324 thiss!992))))) (_size!459 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun b!93384 () Bool)

(declare-fun res!47413 () Bool)

(assert (=> b!93384 (=> (not res!47413) (not e!60945))))

(assert (=> b!93384 (= res!47413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun b!93385 () Bool)

(assert (=> b!93385 (= e!60945 (arrayNoDuplicates!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000000 Nil!1546))))

(assert (= (and d!24525 res!47411) b!93383))

(assert (= (and b!93383 res!47412) b!93384))

(assert (= (and b!93384 res!47413) b!93385))

(declare-fun m!100769 () Bool)

(assert (=> d!24525 m!100769))

(declare-fun m!100771 () Bool)

(assert (=> b!93383 m!100771))

(declare-fun m!100773 () Bool)

(assert (=> b!93384 m!100773))

(declare-fun m!100775 () Bool)

(assert (=> b!93385 m!100775))

(assert (=> b!92931 d!24525))

(declare-fun b!93414 () Bool)

(declare-fun e!60962 () tuple2!2268)

(declare-fun lt!46232 () tuple2!2268)

(assert (=> b!93414 (= e!60962 (tuple2!2269 true (_2!1145 lt!46232)))))

(declare-fun lt!46246 () ListLongMap!1483)

(declare-fun call!9246 () ListLongMap!1483)

(assert (=> b!93414 (= lt!46246 call!9246)))

(declare-fun lt!46223 () (_ BitVec 64))

(assert (=> b!93414 (= lt!46223 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46249 () Unit!2761)

(declare-fun call!9243 () Unit!2761)

(assert (=> b!93414 (= lt!46249 call!9243)))

(declare-fun call!9242 () ListLongMap!1483)

(declare-fun call!9244 () ListLongMap!1483)

(assert (=> b!93414 (= call!9242 call!9244)))

(declare-fun lt!46226 () Unit!2761)

(assert (=> b!93414 (= lt!46226 lt!46249)))

(declare-fun lt!46222 () ListLongMap!1483)

(declare-fun call!9241 () ListLongMap!1483)

(assert (=> b!93414 (= lt!46222 call!9241)))

(declare-fun lt!46239 () (_ BitVec 64))

(assert (=> b!93414 (= lt!46239 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46225 () Unit!2761)

(declare-fun call!9239 () Unit!2761)

(assert (=> b!93414 (= lt!46225 call!9239)))

(declare-fun call!9247 () ListLongMap!1483)

(declare-fun call!9238 () ListLongMap!1483)

(assert (=> b!93414 (= call!9247 call!9238)))

(declare-fun lt!46241 () Unit!2761)

(assert (=> b!93414 (= lt!46241 lt!46225)))

(declare-fun lt!46245 () (_ BitVec 64))

(declare-fun bm!9234 () Bool)

(declare-fun lt!46242 () ListLongMap!1483)

(declare-fun lt!46250 () (_ BitVec 64))

(declare-fun lt!46240 () V!3113)

(declare-fun c!15558 () Bool)

(assert (=> bm!9234 (= call!9243 (addCommutativeForDiffKeys!46 (ite c!15558 lt!46242 lt!46246) lt!46245 lt!46240 (ite c!15558 lt!46250 lt!46223) (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun bm!9235 () Bool)

(declare-fun c!15556 () Bool)

(declare-fun call!9245 () tuple2!2268)

(assert (=> bm!9235 (= call!9245 (repackFrom!10 thiss!992 (ite c!15556 (_2!1145 lt!46232) (_2!1145 lt!45792)) (bvsub (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun b!93415 () Bool)

(declare-fun e!60965 () Bool)

(assert (=> b!93415 (= e!60965 (ite (= lt!46245 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!9240 () ListLongMap!1483)

(declare-fun bm!9236 () Bool)

(declare-fun call!9237 () ListLongMap!1483)

(assert (=> bm!9236 (= call!9238 (+!126 (ite c!15558 call!9237 call!9240) (tuple2!2271 lt!46245 lt!46240)))))

(declare-fun lt!46224 () (_ BitVec 64))

(declare-fun bm!9237 () Bool)

(assert (=> bm!9237 (= call!9241 (+!126 (ite c!15558 call!9240 call!9246) (ite c!15558 (tuple2!2271 lt!46224 (minValue!2311 (v!2748 (underlying!324 thiss!992)))) (tuple2!2271 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))))))))

(declare-fun b!93416 () Bool)

(declare-fun e!60967 () tuple2!2268)

(declare-fun e!60964 () tuple2!2268)

(assert (=> b!93416 (= e!60967 e!60964)))

(declare-fun c!15557 () Bool)

(assert (=> b!93416 (= c!15557 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!93417 () Bool)

(declare-fun e!60966 () Unit!2761)

(declare-fun Unit!2773 () Unit!2761)

(assert (=> b!93417 (= e!60966 Unit!2773)))

(declare-fun lt!46252 () ListLongMap!1483)

(declare-fun bm!9238 () Bool)

(assert (=> bm!9238 (= call!9239 (addCommutativeForDiffKeys!46 (ite c!15558 lt!46252 lt!46222) lt!46245 lt!46240 (ite c!15558 lt!46224 lt!46239) (minValue!2311 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun bm!9239 () Bool)

(declare-fun call!9248 () ListLongMap!1483)

(assert (=> bm!9239 (= call!9242 (+!126 (ite c!15558 call!9248 call!9237) (ite c!15558 (tuple2!2271 lt!46245 lt!46240) (tuple2!2271 lt!46223 (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))))))))

(declare-fun b!93418 () Bool)

(declare-fun e!60968 () tuple2!2268)

(assert (=> b!93418 (= e!60968 (tuple2!2269 false (_2!1145 lt!46232)))))

(declare-fun b!93419 () Bool)

(assert (=> b!93419 (= e!60967 e!60968)))

(assert (=> b!93419 (= lt!46232 (update!139 (_2!1145 lt!45792) lt!46245 lt!46240))))

(declare-fun c!15555 () Bool)

(declare-fun lt!46251 () ListLongMap!1483)

(assert (=> b!93419 (= c!15555 (contains!775 lt!46251 lt!46245))))

(declare-fun lt!46234 () Unit!2761)

(assert (=> b!93419 (= lt!46234 e!60966)))

(declare-fun c!15560 () Bool)

(assert (=> b!93419 (= c!15560 (_1!1145 lt!46232))))

(declare-fun b!93420 () Bool)

(declare-fun lt!46235 () (_ BitVec 32))

(assert (=> b!93420 (= e!60965 (arrayContainsKey!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) lt!46245 lt!46235))))

(declare-fun b!93421 () Bool)

(declare-fun lt!46233 () tuple2!2268)

(assert (=> b!93421 (= e!60962 (tuple2!2269 (_1!1145 lt!46233) (_2!1145 lt!46233)))))

(assert (=> b!93421 (= lt!46242 call!9246)))

(assert (=> b!93421 (= lt!46250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46247 () Unit!2761)

(assert (=> b!93421 (= lt!46247 call!9243)))

(assert (=> b!93421 (= call!9244 call!9242)))

(declare-fun lt!46253 () Unit!2761)

(assert (=> b!93421 (= lt!46253 lt!46247)))

(assert (=> b!93421 (= lt!46252 call!9247)))

(assert (=> b!93421 (= lt!46224 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46243 () Unit!2761)

(assert (=> b!93421 (= lt!46243 call!9239)))

(assert (=> b!93421 (= call!9241 call!9238)))

(declare-fun lt!46230 () Unit!2761)

(assert (=> b!93421 (= lt!46230 lt!46243)))

(assert (=> b!93421 (= lt!46233 call!9245)))

(declare-fun call!9249 () ListLongMap!1483)

(declare-fun bm!9240 () Bool)

(assert (=> bm!9240 (= call!9249 (+!126 (ite c!15558 lt!46242 lt!46246) (ite c!15558 (tuple2!2271 lt!46245 lt!46240) (tuple2!2271 lt!46223 (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))))))))

(declare-fun bm!9241 () Bool)

(assert (=> bm!9241 (= call!9237 (+!126 (ite c!15558 lt!46252 lt!46246) (ite c!15558 (tuple2!2271 lt!46224 (minValue!2311 (v!2748 (underlying!324 thiss!992)))) (tuple2!2271 lt!46245 lt!46240))))))

(declare-fun b!93422 () Bool)

(declare-fun lt!46228 () tuple2!2268)

(assert (=> b!93422 (= lt!46228 call!9245)))

(assert (=> b!93422 (= e!60964 (tuple2!2269 (_1!1145 lt!46228) (_2!1145 lt!46228)))))

(declare-fun bm!9242 () Bool)

(assert (=> bm!9242 (= call!9244 (+!126 call!9249 (ite c!15558 (tuple2!2271 lt!46250 (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))) (tuple2!2271 lt!46245 lt!46240))))))

(declare-fun bm!9243 () Bool)

(assert (=> bm!9243 (= call!9248 (+!126 (ite c!15558 lt!46242 lt!46222) (ite c!15558 (tuple2!2271 lt!46250 (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))) (tuple2!2271 lt!46245 lt!46240))))))

(declare-fun b!93423 () Bool)

(assert (=> b!93423 (= c!15558 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!93423 (= e!60968 e!60962)))

(declare-fun b!93424 () Bool)

(assert (=> b!93424 false))

(declare-fun lt!46238 () Unit!2761)

(declare-fun lt!46244 () Unit!2761)

(assert (=> b!93424 (= lt!46238 lt!46244)))

(declare-fun lt!46237 () (_ BitVec 32))

(assert (=> b!93424 (not (arrayContainsKey!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) lt!46245 lt!46237))))

(assert (=> b!93424 (= lt!46244 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) lt!46237 lt!46245 (Cons!1545 lt!46245 Nil!1546)))))

(assert (=> b!93424 (= lt!46237 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!46248 () Unit!2761)

(declare-fun lt!46236 () Unit!2761)

(assert (=> b!93424 (= lt!46248 lt!46236)))

(assert (=> b!93424 (arrayNoDuplicates!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (bvsub from!355 #b00000000000000000000000000000001) Nil!1546)))

(assert (=> b!93424 (= lt!46236 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4106 (v!2748 (underlying!324 thiss!992))) #b00000000000000000000000000000000 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun lt!46229 () Unit!2761)

(declare-fun lt!46231 () Unit!2761)

(assert (=> b!93424 (= lt!46229 lt!46231)))

(assert (=> b!93424 e!60965))

(declare-fun c!15559 () Bool)

(assert (=> b!93424 (= c!15559 (and (not (= lt!46245 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!46245 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!93424 (= lt!46231 (lemmaListMapContainsThenArrayContainsFrom!78 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) lt!46245 lt!46235 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(assert (=> b!93424 (= lt!46235 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!2774 () Unit!2761)

(assert (=> b!93424 (= e!60966 Unit!2774)))

(declare-fun bm!9244 () Bool)

(assert (=> bm!9244 (= call!9247 (+!126 (ite c!15558 call!9246 call!9248) (ite c!15558 (tuple2!2271 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2311 (v!2748 (underlying!324 thiss!992)))) (tuple2!2271 lt!46239 (minValue!2311 (v!2748 (underlying!324 thiss!992)))))))))

(declare-fun b!93425 () Bool)

(declare-fun e!60963 () Bool)

(declare-fun e!60969 () Bool)

(assert (=> b!93425 (= e!60963 e!60969)))

(declare-fun res!47418 () Bool)

(assert (=> b!93425 (=> (not res!47418) (not e!60969))))

(declare-fun lt!46227 () tuple2!2268)

(assert (=> b!93425 (= res!47418 (valid!377 (_2!1145 lt!46227)))))

(declare-fun b!93426 () Bool)

(assert (=> b!93426 (= e!60964 (tuple2!2269 true (_2!1145 lt!45792)))))

(declare-fun bm!9245 () Bool)

(assert (=> bm!9245 (= call!9246 (getCurrentListMapNoExtraKeys!91 (_keys!4106 (v!2748 (underlying!324 thiss!992))) (_values!2407 (v!2748 (underlying!324 thiss!992))) (mask!6494 (v!2748 (underlying!324 thiss!992))) (extraKeys!2253 (v!2748 (underlying!324 thiss!992))) (zeroValue!2311 (v!2748 (underlying!324 thiss!992))) (minValue!2311 (v!2748 (underlying!324 thiss!992))) (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun b!93427 () Bool)

(assert (=> b!93427 (= e!60969 (= (map!1235 (_2!1145 lt!46227)) (map!1235 (v!2748 (underlying!324 thiss!992)))))))

(declare-fun bm!9246 () Bool)

(assert (=> bm!9246 (= call!9240 (+!126 (ite c!15558 lt!46252 lt!46222) (ite c!15558 (tuple2!2271 lt!46245 lt!46240) (tuple2!2271 lt!46239 (minValue!2311 (v!2748 (underlying!324 thiss!992)))))))))

(declare-fun d!24527 () Bool)

(assert (=> d!24527 e!60963))

(declare-fun res!47419 () Bool)

(assert (=> d!24527 (=> res!47419 e!60963)))

(assert (=> d!24527 (= res!47419 (not (_1!1145 lt!46227)))))

(assert (=> d!24527 (= lt!46227 e!60967)))

(assert (=> d!24527 (= c!15556 (and (not (= lt!46245 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!46245 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!24527 (= lt!46251 (map!1235 (_2!1145 lt!45792)))))

(assert (=> d!24527 (= lt!46240 (get!1262 (select (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)) (dynLambda!364 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24527 (= lt!46245 (select (arr!1976 (_keys!4106 (v!2748 (underlying!324 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> d!24527 (valid!378 thiss!992)))

(assert (=> d!24527 (= (repackFrom!10 thiss!992 (_2!1145 lt!45792) (bvsub from!355 #b00000000000000000000000000000001)) lt!46227)))

(assert (= (and d!24527 c!15556) b!93419))

(assert (= (and d!24527 (not c!15556)) b!93416))

(assert (= (and b!93419 c!15555) b!93424))

(assert (= (and b!93419 (not c!15555)) b!93417))

(assert (= (and b!93424 c!15559) b!93420))

(assert (= (and b!93424 (not c!15559)) b!93415))

(assert (= (and b!93419 c!15560) b!93423))

(assert (= (and b!93419 (not c!15560)) b!93418))

(assert (= (and b!93423 c!15558) b!93421))

(assert (= (and b!93423 (not c!15558)) b!93414))

(assert (= (or b!93421 b!93414) bm!9241))

(assert (= (or b!93421 b!93414) bm!9243))

(assert (= (or b!93421 b!93414) bm!9245))

(assert (= (or b!93421 b!93414) bm!9238))

(assert (= (or b!93421 b!93414) bm!9246))

(assert (= (or b!93421 b!93414) bm!9234))

(assert (= (or b!93421 b!93414) bm!9240))

(assert (= (or b!93421 b!93414) bm!9237))

(assert (= (or b!93421 b!93414) bm!9242))

(assert (= (or b!93421 b!93414) bm!9236))

(assert (= (or b!93421 b!93414) bm!9239))

(assert (= (or b!93421 b!93414) bm!9244))

(assert (= (and b!93416 c!15557) b!93422))

(assert (= (and b!93416 (not c!15557)) b!93426))

(assert (= (or b!93421 b!93422) bm!9235))

(assert (= (and d!24527 (not res!47419)) b!93425))

(assert (= (and b!93425 res!47418) b!93427))

(declare-fun b_lambda!4115 () Bool)

(assert (=> (not b_lambda!4115) (not d!24527)))

(assert (=> d!24527 t!5415))

(declare-fun b_and!5693 () Bool)

(assert (= b_and!5689 (and (=> t!5415 result!3137) b_and!5693)))

(assert (=> d!24527 t!5417))

(declare-fun b_and!5695 () Bool)

(assert (= b_and!5691 (and (=> t!5417 result!3141) b_and!5695)))

(declare-fun m!100777 () Bool)

(assert (=> b!93419 m!100777))

(declare-fun m!100779 () Bool)

(assert (=> b!93419 m!100779))

(declare-fun m!100781 () Bool)

(assert (=> bm!9244 m!100781))

(declare-fun m!100783 () Bool)

(assert (=> bm!9239 m!100783))

(declare-fun m!100785 () Bool)

(assert (=> b!93424 m!100785))

(declare-fun m!100787 () Bool)

(assert (=> b!93424 m!100787))

(declare-fun m!100789 () Bool)

(assert (=> b!93424 m!100789))

(declare-fun m!100791 () Bool)

(assert (=> b!93424 m!100791))

(declare-fun m!100793 () Bool)

(assert (=> b!93424 m!100793))

(declare-fun m!100795 () Bool)

(assert (=> b!93427 m!100795))

(declare-fun m!100797 () Bool)

(assert (=> b!93427 m!100797))

(declare-fun m!100799 () Bool)

(assert (=> bm!9234 m!100799))

(declare-fun m!100801 () Bool)

(assert (=> bm!9242 m!100801))

(declare-fun m!100803 () Bool)

(assert (=> bm!9237 m!100803))

(declare-fun m!100805 () Bool)

(assert (=> b!93425 m!100805))

(declare-fun m!100807 () Bool)

(assert (=> bm!9236 m!100807))

(declare-fun m!100809 () Bool)

(assert (=> bm!9246 m!100809))

(declare-fun m!100811 () Bool)

(assert (=> bm!9243 m!100811))

(declare-fun m!100813 () Bool)

(assert (=> bm!9241 m!100813))

(declare-fun m!100815 () Bool)

(assert (=> bm!9235 m!100815))

(declare-fun m!100817 () Bool)

(assert (=> bm!9245 m!100817))

(declare-fun m!100819 () Bool)

(assert (=> bm!9238 m!100819))

(declare-fun m!100821 () Bool)

(assert (=> d!24527 m!100821))

(assert (=> d!24527 m!100305))

(assert (=> d!24527 m!100287))

(declare-fun m!100823 () Bool)

(assert (=> d!24527 m!100823))

(assert (=> d!24527 m!100823))

(assert (=> d!24527 m!100305))

(declare-fun m!100825 () Bool)

(assert (=> d!24527 m!100825))

(assert (=> d!24527 m!100265))

(declare-fun m!100827 () Bool)

(assert (=> bm!9240 m!100827))

(declare-fun m!100829 () Bool)

(assert (=> b!93420 m!100829))

(assert (=> b!92918 d!24527))

(declare-fun d!24529 () Bool)

(declare-fun c!15563 () Bool)

(assert (=> d!24529 (= c!15563 ((_ is ValueCellFull!956) (select (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) from!355)))))

(declare-fun e!60972 () V!3113)

(assert (=> d!24529 (= (get!1262 (select (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) from!355) (dynLambda!364 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!60972)))

(declare-fun b!93432 () Bool)

(declare-fun get!1263 (ValueCell!956 V!3113) V!3113)

(assert (=> b!93432 (= e!60972 (get!1263 (select (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) from!355) (dynLambda!364 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!93433 () Bool)

(declare-fun get!1264 (ValueCell!956 V!3113) V!3113)

(assert (=> b!93433 (= e!60972 (get!1264 (select (arr!1977 (_values!2407 (v!2748 (underlying!324 thiss!992)))) from!355) (dynLambda!364 (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24529 c!15563) b!93432))

(assert (= (and d!24529 (not c!15563)) b!93433))

(assert (=> b!93432 m!100303))

(assert (=> b!93432 m!100305))

(declare-fun m!100831 () Bool)

(assert (=> b!93432 m!100831))

(assert (=> b!93433 m!100303))

(assert (=> b!93433 m!100305))

(declare-fun m!100833 () Bool)

(assert (=> b!93433 m!100833))

(assert (=> b!92928 d!24529))

(declare-fun d!24531 () Bool)

(declare-fun res!47420 () Bool)

(declare-fun e!60973 () Bool)

(assert (=> d!24531 (=> (not res!47420) (not e!60973))))

(assert (=> d!24531 (= res!47420 (simpleValid!64 (_2!1145 lt!45787)))))

(assert (=> d!24531 (= (valid!377 (_2!1145 lt!45787)) e!60973)))

(declare-fun b!93434 () Bool)

(declare-fun res!47421 () Bool)

(assert (=> b!93434 (=> (not res!47421) (not e!60973))))

(assert (=> b!93434 (= res!47421 (= (arrayCountValidKeys!0 (_keys!4106 (_2!1145 lt!45787)) #b00000000000000000000000000000000 (size!2224 (_keys!4106 (_2!1145 lt!45787)))) (_size!459 (_2!1145 lt!45787))))))

(declare-fun b!93435 () Bool)

(declare-fun res!47422 () Bool)

(assert (=> b!93435 (=> (not res!47422) (not e!60973))))

(assert (=> b!93435 (= res!47422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4106 (_2!1145 lt!45787)) (mask!6494 (_2!1145 lt!45787))))))

(declare-fun b!93436 () Bool)

(assert (=> b!93436 (= e!60973 (arrayNoDuplicates!0 (_keys!4106 (_2!1145 lt!45787)) #b00000000000000000000000000000000 Nil!1546))))

(assert (= (and d!24531 res!47420) b!93434))

(assert (= (and b!93434 res!47421) b!93435))

(assert (= (and b!93435 res!47422) b!93436))

(declare-fun m!100835 () Bool)

(assert (=> d!24531 m!100835))

(declare-fun m!100837 () Bool)

(assert (=> b!93434 m!100837))

(declare-fun m!100839 () Bool)

(assert (=> b!93435 m!100839))

(declare-fun m!100841 () Bool)

(assert (=> b!93436 m!100841))

(assert (=> b!92920 d!24531))

(declare-fun d!24533 () Bool)

(assert (=> d!24533 (= (valid!378 thiss!992) (valid!377 (v!2748 (underlying!324 thiss!992))))))

(declare-fun bs!3856 () Bool)

(assert (= bs!3856 d!24533))

(assert (=> bs!3856 m!100285))

(assert (=> start!11274 d!24533))

(declare-fun mapNonEmpty!3641 () Bool)

(declare-fun mapRes!3641 () Bool)

(declare-fun tp!9383 () Bool)

(declare-fun e!60978 () Bool)

(assert (=> mapNonEmpty!3641 (= mapRes!3641 (and tp!9383 e!60978))))

(declare-fun mapValue!3641 () ValueCell!956)

(declare-fun mapRest!3641 () (Array (_ BitVec 32) ValueCell!956))

(declare-fun mapKey!3641 () (_ BitVec 32))

(assert (=> mapNonEmpty!3641 (= mapRest!3626 (store mapRest!3641 mapKey!3641 mapValue!3641))))

(declare-fun mapIsEmpty!3641 () Bool)

(assert (=> mapIsEmpty!3641 mapRes!3641))

(declare-fun b!93444 () Bool)

(declare-fun e!60979 () Bool)

(assert (=> b!93444 (= e!60979 tp_is_empty!2599)))

(declare-fun b!93443 () Bool)

(assert (=> b!93443 (= e!60978 tp_is_empty!2599)))

(declare-fun condMapEmpty!3641 () Bool)

(declare-fun mapDefault!3641 () ValueCell!956)

(assert (=> mapNonEmpty!3625 (= condMapEmpty!3641 (= mapRest!3626 ((as const (Array (_ BitVec 32) ValueCell!956)) mapDefault!3641)))))

(assert (=> mapNonEmpty!3625 (= tp!9356 (and e!60979 mapRes!3641))))

(assert (= (and mapNonEmpty!3625 condMapEmpty!3641) mapIsEmpty!3641))

(assert (= (and mapNonEmpty!3625 (not condMapEmpty!3641)) mapNonEmpty!3641))

(assert (= (and mapNonEmpty!3641 ((_ is ValueCellFull!956) mapValue!3641)) b!93443))

(assert (= (and mapNonEmpty!3625 ((_ is ValueCellFull!956) mapDefault!3641)) b!93444))

(declare-fun m!100843 () Bool)

(assert (=> mapNonEmpty!3641 m!100843))

(declare-fun mapNonEmpty!3642 () Bool)

(declare-fun mapRes!3642 () Bool)

(declare-fun tp!9384 () Bool)

(declare-fun e!60980 () Bool)

(assert (=> mapNonEmpty!3642 (= mapRes!3642 (and tp!9384 e!60980))))

(declare-fun mapKey!3642 () (_ BitVec 32))

(declare-fun mapValue!3642 () ValueCell!956)

(declare-fun mapRest!3642 () (Array (_ BitVec 32) ValueCell!956))

(assert (=> mapNonEmpty!3642 (= mapRest!3625 (store mapRest!3642 mapKey!3642 mapValue!3642))))

(declare-fun mapIsEmpty!3642 () Bool)

(assert (=> mapIsEmpty!3642 mapRes!3642))

(declare-fun b!93446 () Bool)

(declare-fun e!60981 () Bool)

(assert (=> b!93446 (= e!60981 tp_is_empty!2599)))

(declare-fun b!93445 () Bool)

(assert (=> b!93445 (= e!60980 tp_is_empty!2599)))

(declare-fun condMapEmpty!3642 () Bool)

(declare-fun mapDefault!3642 () ValueCell!956)

(assert (=> mapNonEmpty!3626 (= condMapEmpty!3642 (= mapRest!3625 ((as const (Array (_ BitVec 32) ValueCell!956)) mapDefault!3642)))))

(assert (=> mapNonEmpty!3626 (= tp!9355 (and e!60981 mapRes!3642))))

(assert (= (and mapNonEmpty!3626 condMapEmpty!3642) mapIsEmpty!3642))

(assert (= (and mapNonEmpty!3626 (not condMapEmpty!3642)) mapNonEmpty!3642))

(assert (= (and mapNonEmpty!3642 ((_ is ValueCellFull!956) mapValue!3642)) b!93445))

(assert (= (and mapNonEmpty!3626 ((_ is ValueCellFull!956) mapDefault!3642)) b!93446))

(declare-fun m!100845 () Bool)

(assert (=> mapNonEmpty!3642 m!100845))

(declare-fun b_lambda!4117 () Bool)

(assert (= b_lambda!4115 (or (and b!92925 b_free!2365) (and b!92922 b_free!2367 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))))) b_lambda!4117)))

(declare-fun b_lambda!4119 () Bool)

(assert (= b_lambda!4109 (or (and b!92925 b_free!2365) (and b!92922 b_free!2367 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))))) b_lambda!4119)))

(declare-fun b_lambda!4121 () Bool)

(assert (= b_lambda!4111 (or (and b!92925 b_free!2365) (and b!92922 b_free!2367 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))))) b_lambda!4121)))

(declare-fun b_lambda!4123 () Bool)

(assert (= b_lambda!4107 (or (and b!92925 b_free!2365) (and b!92922 b_free!2367 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))))) b_lambda!4123)))

(declare-fun b_lambda!4125 () Bool)

(assert (= b_lambda!4113 (or (and b!92925 b_free!2365) (and b!92922 b_free!2367 (= (defaultEntry!2424 newMap!16) (defaultEntry!2424 (v!2748 (underlying!324 thiss!992))))) b_lambda!4125)))

(check-sat (not b!93316) (not b!93314) (not d!24533) (not b!93427) (not b!93336) (not bm!9104) (not b!93079) (not b!93153) (not bm!9242) (not b!93097) (not b!93369) (not bm!9234) (not b_lambda!4117) (not b!93151) (not bm!9179) (not b!93432) (not b!93288) (not bm!9195) (not bm!9122) (not bm!9200) (not d!24479) (not bm!9184) (not b_lambda!4123) (not bm!9245) (not b!93382) (not bm!9192) (not bm!9241) b_and!5693 (not b!93276) (not d!24495) (not d!24521) (not b!93144) (not bm!9189) (not d!24489) (not d!24525) (not b!93148) (not b_lambda!4125) (not b!93384) (not b!93379) (not b!93424) (not b!93383) (not bm!9201) (not b!93181) (not b!93375) (not b!93420) (not d!24487) (not b!93362) (not d!24483) (not b!93374) (not b!93099) (not b!93312) (not b!93425) (not bm!9175) (not b_next!2365) (not b_lambda!4119) (not b!93363) (not b!93319) (not d!24505) (not b_lambda!4121) b_and!5695 (not b!93302) (not bm!9235) (not b!93318) (not b!93435) (not d!24493) (not bm!9236) (not b!93172) (not b!93170) (not mapNonEmpty!3641) (not b_lambda!4105) (not d!24531) (not b!93372) (not b!93385) (not b!93273) (not d!24491) (not b!93179) (not bm!9196) (not bm!9237) (not bm!9174) (not bm!9240) (not b!93299) (not b!93147) (not mapNonEmpty!3642) (not b!93381) (not b!93152) (not bm!9244) (not d!24513) (not bm!9204) (not bm!9243) (not bm!9124) (not b!93436) (not b!93298) (not d!24515) (not d!24503) (not bm!9125) (not d!24477) (not b!93376) (not d!24509) (not b!93096) (not b!93324) (not d!24501) (not d!24517) (not b!93380) (not b!93371) (not b!93378) (not b!93323) (not b!93270) (not d!24511) (not b!93434) tp_is_empty!2599 (not b!93322) (not d!24523) (not bm!9246) (not bm!9238) (not b!93365) (not b!93313) (not b!93373) (not bm!9185) (not bm!9203) (not b!93335) (not b!93084) (not b!93419) (not b!93143) (not b!93315) (not b!93145) (not bm!9207) (not bm!9180) (not b!93433) (not b!93377) (not bm!9239) (not b!93294) (not b!93361) (not bm!9121) (not b_next!2367) (not d!24527) (not b!93171) (not d!24519) (not d!24507) (not bm!9187) (not bm!9176) (not b!93364))
(check-sat b_and!5693 b_and!5695 (not b_next!2365) (not b_next!2367))
