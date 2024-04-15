; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13062 () Bool)

(assert start!13062)

(declare-fun b!113626 () Bool)

(declare-fun b_free!2593 () Bool)

(declare-fun b_next!2593 () Bool)

(assert (=> b!113626 (= b_free!2593 (not b_next!2593))))

(declare-fun tp!10140 () Bool)

(declare-fun b_and!6965 () Bool)

(assert (=> b!113626 (= tp!10140 b_and!6965)))

(declare-fun b!113622 () Bool)

(declare-fun b_free!2595 () Bool)

(declare-fun b_next!2595 () Bool)

(assert (=> b!113622 (= b_free!2595 (not b_next!2595))))

(declare-fun tp!10138 () Bool)

(declare-fun b_and!6967 () Bool)

(assert (=> b!113622 (= tp!10138 b_and!6967)))

(declare-datatypes ((V!3265 0))(
  ( (V!3266 (val!1401 Int)) )
))
(declare-datatypes ((array!4407 0))(
  ( (array!4408 (arr!2086 (Array (_ BitVec 32) (_ BitVec 64))) (size!2347 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1013 0))(
  ( (ValueCellFull!1013 (v!2961 V!3265)) (EmptyCell!1013) )
))
(declare-datatypes ((array!4409 0))(
  ( (array!4410 (arr!2087 (Array (_ BitVec 32) ValueCell!1013)) (size!2348 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!934 0))(
  ( (LongMapFixedSize!935 (defaultEntry!2673 Int) (mask!6862 (_ BitVec 32)) (extraKeys!2462 (_ BitVec 32)) (zeroValue!2540 V!3265) (minValue!2540 V!3265) (_size!516 (_ BitVec 32)) (_keys!4394 array!4407) (_values!2656 array!4409) (_vacant!516 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!934)

(declare-fun e!73841 () Bool)

(declare-fun e!73831 () Bool)

(declare-fun tp_is_empty!2713 () Bool)

(declare-fun array_inv!1319 (array!4407) Bool)

(declare-fun array_inv!1320 (array!4409) Bool)

(assert (=> b!113622 (= e!73841 (and tp!10138 tp_is_empty!2713 (array_inv!1319 (_keys!4394 newMap!16)) (array_inv!1320 (_values!2656 newMap!16)) e!73831))))

(declare-fun b!113623 () Bool)

(declare-datatypes ((Unit!3534 0))(
  ( (Unit!3535) )
))
(declare-fun e!73833 () Unit!3534)

(declare-fun Unit!3536 () Unit!3534)

(assert (=> b!113623 (= e!73833 Unit!3536)))

(declare-fun b!113624 () Bool)

(declare-fun res!55990 () Bool)

(declare-fun e!73835 () Bool)

(assert (=> b!113624 (=> (not res!55990) (not e!73835))))

(declare-datatypes ((Cell!722 0))(
  ( (Cell!723 (v!2962 LongMapFixedSize!934)) )
))
(declare-datatypes ((LongMap!722 0))(
  ( (LongMap!723 (underlying!372 Cell!722)) )
))
(declare-fun thiss!992 () LongMap!722)

(assert (=> b!113624 (= res!55990 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6862 newMap!16)) (_size!516 (v!2962 (underlying!372 thiss!992)))))))

(declare-fun b!113625 () Bool)

(declare-fun e!73826 () Bool)

(assert (=> b!113625 (= e!73826 tp_is_empty!2713)))

(declare-fun e!73824 () Bool)

(declare-fun e!73832 () Bool)

(assert (=> b!113626 (= e!73832 (and tp!10140 tp_is_empty!2713 (array_inv!1319 (_keys!4394 (v!2962 (underlying!372 thiss!992)))) (array_inv!1320 (_values!2656 (v!2962 (underlying!372 thiss!992)))) e!73824))))

(declare-fun b!113627 () Bool)

(declare-fun e!73836 () Bool)

(declare-fun e!73840 () Bool)

(assert (=> b!113627 (= e!73836 e!73840)))

(declare-fun res!55988 () Bool)

(assert (=> b!113627 (=> (not res!55988) (not e!73840))))

(declare-datatypes ((tuple2!2416 0))(
  ( (tuple2!2417 (_1!1219 Bool) (_2!1219 LongMapFixedSize!934)) )
))
(declare-fun lt!58982 () tuple2!2416)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!113627 (= res!55988 (and (_1!1219 lt!58982) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!58984 () Unit!3534)

(assert (=> b!113627 (= lt!58984 e!73833)))

(declare-fun c!20365 () Bool)

(declare-datatypes ((tuple2!2418 0))(
  ( (tuple2!2419 (_1!1220 (_ BitVec 64)) (_2!1220 V!3265)) )
))
(declare-datatypes ((List!1635 0))(
  ( (Nil!1632) (Cons!1631 (h!2231 tuple2!2418) (t!5816 List!1635)) )
))
(declare-datatypes ((ListLongMap!1565 0))(
  ( (ListLongMap!1566 (toList!798 List!1635)) )
))
(declare-fun lt!58987 () ListLongMap!1565)

(declare-fun contains!837 (ListLongMap!1565 (_ BitVec 64)) Bool)

(assert (=> b!113627 (= c!20365 (contains!837 lt!58987 (select (arr!2086 (_keys!4394 (v!2962 (underlying!372 thiss!992)))) from!355)))))

(declare-fun lt!58983 () V!3265)

(declare-fun update!166 (LongMapFixedSize!934 (_ BitVec 64) V!3265) tuple2!2416)

(assert (=> b!113627 (= lt!58982 (update!166 newMap!16 (select (arr!2086 (_keys!4394 (v!2962 (underlying!372 thiss!992)))) from!355) lt!58983))))

(declare-fun b!113629 () Bool)

(declare-fun e!73837 () Bool)

(declare-fun mapRes!4067 () Bool)

(assert (=> b!113629 (= e!73824 (and e!73837 mapRes!4067))))

(declare-fun condMapEmpty!4067 () Bool)

(declare-fun mapDefault!4068 () ValueCell!1013)

(assert (=> b!113629 (= condMapEmpty!4067 (= (arr!2087 (_values!2656 (v!2962 (underlying!372 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1013)) mapDefault!4068)))))

(declare-fun b!113630 () Bool)

(declare-fun e!73834 () Bool)

(assert (=> b!113630 (= e!73840 (not e!73834))))

(declare-fun res!55992 () Bool)

(assert (=> b!113630 (=> res!55992 e!73834)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!113630 (= res!55992 (not (validMask!0 (mask!6862 (v!2962 (underlying!372 thiss!992))))))))

(declare-fun lt!58988 () ListLongMap!1565)

(declare-fun lt!58985 () tuple2!2418)

(declare-fun lt!58986 () tuple2!2418)

(declare-fun +!144 (ListLongMap!1565 tuple2!2418) ListLongMap!1565)

(assert (=> b!113630 (= (+!144 (+!144 lt!58988 lt!58985) lt!58986) (+!144 (+!144 lt!58988 lt!58986) lt!58985))))

(assert (=> b!113630 (= lt!58986 (tuple2!2419 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2540 (v!2962 (underlying!372 thiss!992)))))))

(assert (=> b!113630 (= lt!58985 (tuple2!2419 (select (arr!2086 (_keys!4394 (v!2962 (underlying!372 thiss!992)))) from!355) lt!58983))))

(declare-fun lt!58991 () Unit!3534)

(declare-fun addCommutativeForDiffKeys!56 (ListLongMap!1565 (_ BitVec 64) V!3265 (_ BitVec 64) V!3265) Unit!3534)

(assert (=> b!113630 (= lt!58991 (addCommutativeForDiffKeys!56 lt!58988 (select (arr!2086 (_keys!4394 (v!2962 (underlying!372 thiss!992)))) from!355) lt!58983 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2540 (v!2962 (underlying!372 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!109 (array!4407 array!4409 (_ BitVec 32) (_ BitVec 32) V!3265 V!3265 (_ BitVec 32) Int) ListLongMap!1565)

(assert (=> b!113630 (= lt!58988 (getCurrentListMapNoExtraKeys!109 (_keys!4394 (v!2962 (underlying!372 thiss!992))) (_values!2656 (v!2962 (underlying!372 thiss!992))) (mask!6862 (v!2962 (underlying!372 thiss!992))) (extraKeys!2462 (v!2962 (underlying!372 thiss!992))) (zeroValue!2540 (v!2962 (underlying!372 thiss!992))) (minValue!2540 (v!2962 (underlying!372 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2673 (v!2962 (underlying!372 thiss!992)))))))

(declare-fun b!113631 () Bool)

(declare-fun e!73829 () Bool)

(assert (=> b!113631 (= e!73829 e!73836)))

(declare-fun res!55987 () Bool)

(assert (=> b!113631 (=> (not res!55987) (not e!73836))))

(assert (=> b!113631 (= res!55987 (and (not (= (select (arr!2086 (_keys!4394 (v!2962 (underlying!372 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2086 (_keys!4394 (v!2962 (underlying!372 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1365 (ValueCell!1013 V!3265) V!3265)

(declare-fun dynLambda!390 (Int (_ BitVec 64)) V!3265)

(assert (=> b!113631 (= lt!58983 (get!1365 (select (arr!2087 (_values!2656 (v!2962 (underlying!372 thiss!992)))) from!355) (dynLambda!390 (defaultEntry!2673 (v!2962 (underlying!372 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113632 () Bool)

(assert (=> b!113632 (= e!73835 e!73829)))

(declare-fun res!55984 () Bool)

(assert (=> b!113632 (=> (not res!55984) (not e!73829))))

(declare-fun lt!58980 () ListLongMap!1565)

(assert (=> b!113632 (= res!55984 (= lt!58980 lt!58987))))

(declare-fun map!1291 (LongMapFixedSize!934) ListLongMap!1565)

(assert (=> b!113632 (= lt!58987 (map!1291 newMap!16))))

(declare-fun getCurrentListMap!473 (array!4407 array!4409 (_ BitVec 32) (_ BitVec 32) V!3265 V!3265 (_ BitVec 32) Int) ListLongMap!1565)

(assert (=> b!113632 (= lt!58980 (getCurrentListMap!473 (_keys!4394 (v!2962 (underlying!372 thiss!992))) (_values!2656 (v!2962 (underlying!372 thiss!992))) (mask!6862 (v!2962 (underlying!372 thiss!992))) (extraKeys!2462 (v!2962 (underlying!372 thiss!992))) (zeroValue!2540 (v!2962 (underlying!372 thiss!992))) (minValue!2540 (v!2962 (underlying!372 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2673 (v!2962 (underlying!372 thiss!992)))))))

(declare-fun b!113633 () Bool)

(declare-fun e!73828 () Bool)

(declare-fun e!73838 () Bool)

(assert (=> b!113633 (= e!73828 e!73838)))

(declare-fun mapIsEmpty!4067 () Bool)

(declare-fun mapRes!4068 () Bool)

(assert (=> mapIsEmpty!4067 mapRes!4068))

(declare-fun b!113634 () Bool)

(declare-fun res!55985 () Bool)

(assert (=> b!113634 (=> res!55985 e!73834)))

(declare-datatypes ((List!1636 0))(
  ( (Nil!1633) (Cons!1632 (h!2232 (_ BitVec 64)) (t!5817 List!1636)) )
))
(declare-fun arrayNoDuplicates!0 (array!4407 (_ BitVec 32) List!1636) Bool)

(assert (=> b!113634 (= res!55985 (not (arrayNoDuplicates!0 (_keys!4394 (v!2962 (underlying!372 thiss!992))) #b00000000000000000000000000000000 Nil!1633)))))

(declare-fun b!113635 () Bool)

(declare-fun res!55983 () Bool)

(assert (=> b!113635 (=> res!55983 e!73834)))

(assert (=> b!113635 (= res!55983 (or (not (= (size!2348 (_values!2656 (v!2962 (underlying!372 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6862 (v!2962 (underlying!372 thiss!992)))))) (not (= (size!2347 (_keys!4394 (v!2962 (underlying!372 thiss!992)))) (size!2348 (_values!2656 (v!2962 (underlying!372 thiss!992)))))) (bvslt (mask!6862 (v!2962 (underlying!372 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2462 (v!2962 (underlying!372 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2462 (v!2962 (underlying!372 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!113636 () Bool)

(declare-fun res!55989 () Bool)

(assert (=> b!113636 (=> res!55989 e!73834)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4407 (_ BitVec 32)) Bool)

(assert (=> b!113636 (= res!55989 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4394 (v!2962 (underlying!372 thiss!992))) (mask!6862 (v!2962 (underlying!372 thiss!992))))))))

(declare-fun b!113637 () Bool)

(declare-fun e!73830 () Bool)

(assert (=> b!113637 (= e!73830 tp_is_empty!2713)))

(declare-fun b!113638 () Bool)

(assert (=> b!113638 (= e!73831 (and e!73826 mapRes!4068))))

(declare-fun condMapEmpty!4068 () Bool)

(declare-fun mapDefault!4067 () ValueCell!1013)

(assert (=> b!113638 (= condMapEmpty!4068 (= (arr!2087 (_values!2656 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1013)) mapDefault!4067)))))

(declare-fun mapIsEmpty!4068 () Bool)

(assert (=> mapIsEmpty!4068 mapRes!4067))

(declare-fun b!113639 () Bool)

(declare-fun Unit!3537 () Unit!3534)

(assert (=> b!113639 (= e!73833 Unit!3537)))

(declare-fun lt!58990 () Unit!3534)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!118 (array!4407 array!4409 (_ BitVec 32) (_ BitVec 32) V!3265 V!3265 (_ BitVec 64) (_ BitVec 32) Int) Unit!3534)

(assert (=> b!113639 (= lt!58990 (lemmaListMapContainsThenArrayContainsFrom!118 (_keys!4394 (v!2962 (underlying!372 thiss!992))) (_values!2656 (v!2962 (underlying!372 thiss!992))) (mask!6862 (v!2962 (underlying!372 thiss!992))) (extraKeys!2462 (v!2962 (underlying!372 thiss!992))) (zeroValue!2540 (v!2962 (underlying!372 thiss!992))) (minValue!2540 (v!2962 (underlying!372 thiss!992))) (select (arr!2086 (_keys!4394 (v!2962 (underlying!372 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2673 (v!2962 (underlying!372 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!113639 (arrayContainsKey!0 (_keys!4394 (v!2962 (underlying!372 thiss!992))) (select (arr!2086 (_keys!4394 (v!2962 (underlying!372 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!58981 () Unit!3534)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4407 (_ BitVec 32) (_ BitVec 32)) Unit!3534)

(assert (=> b!113639 (= lt!58981 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4394 (v!2962 (underlying!372 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!113639 (arrayNoDuplicates!0 (_keys!4394 (v!2962 (underlying!372 thiss!992))) from!355 Nil!1633)))

(declare-fun lt!58989 () Unit!3534)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4407 (_ BitVec 32) (_ BitVec 64) List!1636) Unit!3534)

(assert (=> b!113639 (= lt!58989 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4394 (v!2962 (underlying!372 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2086 (_keys!4394 (v!2962 (underlying!372 thiss!992)))) from!355) (Cons!1632 (select (arr!2086 (_keys!4394 (v!2962 (underlying!372 thiss!992)))) from!355) Nil!1633)))))

(assert (=> b!113639 false))

(declare-fun mapNonEmpty!4067 () Bool)

(declare-fun tp!10139 () Bool)

(assert (=> mapNonEmpty!4067 (= mapRes!4068 (and tp!10139 e!73830))))

(declare-fun mapValue!4068 () ValueCell!1013)

(declare-fun mapRest!4068 () (Array (_ BitVec 32) ValueCell!1013))

(declare-fun mapKey!4068 () (_ BitVec 32))

(assert (=> mapNonEmpty!4067 (= (arr!2087 (_values!2656 newMap!16)) (store mapRest!4068 mapKey!4068 mapValue!4068))))

(declare-fun b!113640 () Bool)

(declare-fun e!73839 () Bool)

(assert (=> b!113640 (= e!73839 tp_is_empty!2713)))

(declare-fun b!113641 () Bool)

(assert (=> b!113641 (= e!73838 e!73832)))

(declare-fun res!55991 () Bool)

(assert (=> start!13062 (=> (not res!55991) (not e!73835))))

(declare-fun valid!437 (LongMap!722) Bool)

(assert (=> start!13062 (= res!55991 (valid!437 thiss!992))))

(assert (=> start!13062 e!73835))

(assert (=> start!13062 e!73828))

(assert (=> start!13062 true))

(assert (=> start!13062 e!73841))

(declare-fun b!113628 () Bool)

(declare-fun res!55982 () Bool)

(assert (=> b!113628 (=> (not res!55982) (not e!73835))))

(declare-fun valid!438 (LongMapFixedSize!934) Bool)

(assert (=> b!113628 (= res!55982 (valid!438 newMap!16))))

(declare-fun b!113642 () Bool)

(declare-fun res!55986 () Bool)

(assert (=> b!113642 (=> (not res!55986) (not e!73835))))

(assert (=> b!113642 (= res!55986 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2347 (_keys!4394 (v!2962 (underlying!372 thiss!992)))))))))

(declare-fun b!113643 () Bool)

(assert (=> b!113643 (= e!73834 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!113644 () Bool)

(assert (=> b!113644 (= e!73837 tp_is_empty!2713)))

(declare-fun mapNonEmpty!4068 () Bool)

(declare-fun tp!10137 () Bool)

(assert (=> mapNonEmpty!4068 (= mapRes!4067 (and tp!10137 e!73839))))

(declare-fun mapRest!4067 () (Array (_ BitVec 32) ValueCell!1013))

(declare-fun mapValue!4067 () ValueCell!1013)

(declare-fun mapKey!4067 () (_ BitVec 32))

(assert (=> mapNonEmpty!4068 (= (arr!2087 (_values!2656 (v!2962 (underlying!372 thiss!992)))) (store mapRest!4067 mapKey!4067 mapValue!4067))))

(assert (= (and start!13062 res!55991) b!113642))

(assert (= (and b!113642 res!55986) b!113628))

(assert (= (and b!113628 res!55982) b!113624))

(assert (= (and b!113624 res!55990) b!113632))

(assert (= (and b!113632 res!55984) b!113631))

(assert (= (and b!113631 res!55987) b!113627))

(assert (= (and b!113627 c!20365) b!113639))

(assert (= (and b!113627 (not c!20365)) b!113623))

(assert (= (and b!113627 res!55988) b!113630))

(assert (= (and b!113630 (not res!55992)) b!113635))

(assert (= (and b!113635 (not res!55983)) b!113636))

(assert (= (and b!113636 (not res!55989)) b!113634))

(assert (= (and b!113634 (not res!55985)) b!113643))

(assert (= (and b!113629 condMapEmpty!4067) mapIsEmpty!4068))

(assert (= (and b!113629 (not condMapEmpty!4067)) mapNonEmpty!4068))

(get-info :version)

(assert (= (and mapNonEmpty!4068 ((_ is ValueCellFull!1013) mapValue!4067)) b!113640))

(assert (= (and b!113629 ((_ is ValueCellFull!1013) mapDefault!4068)) b!113644))

(assert (= b!113626 b!113629))

(assert (= b!113641 b!113626))

(assert (= b!113633 b!113641))

(assert (= start!13062 b!113633))

(assert (= (and b!113638 condMapEmpty!4068) mapIsEmpty!4067))

(assert (= (and b!113638 (not condMapEmpty!4068)) mapNonEmpty!4067))

(assert (= (and mapNonEmpty!4067 ((_ is ValueCellFull!1013) mapValue!4068)) b!113637))

(assert (= (and b!113638 ((_ is ValueCellFull!1013) mapDefault!4067)) b!113625))

(assert (= b!113622 b!113638))

(assert (= start!13062 b!113622))

(declare-fun b_lambda!5083 () Bool)

(assert (=> (not b_lambda!5083) (not b!113631)))

(declare-fun t!5813 () Bool)

(declare-fun tb!2145 () Bool)

(assert (=> (and b!113626 (= (defaultEntry!2673 (v!2962 (underlying!372 thiss!992))) (defaultEntry!2673 (v!2962 (underlying!372 thiss!992)))) t!5813) tb!2145))

(declare-fun result!3589 () Bool)

(assert (=> tb!2145 (= result!3589 tp_is_empty!2713)))

(assert (=> b!113631 t!5813))

(declare-fun b_and!6969 () Bool)

(assert (= b_and!6965 (and (=> t!5813 result!3589) b_and!6969)))

(declare-fun t!5815 () Bool)

(declare-fun tb!2147 () Bool)

(assert (=> (and b!113622 (= (defaultEntry!2673 newMap!16) (defaultEntry!2673 (v!2962 (underlying!372 thiss!992)))) t!5815) tb!2147))

(declare-fun result!3593 () Bool)

(assert (= result!3593 result!3589))

(assert (=> b!113631 t!5815))

(declare-fun b_and!6971 () Bool)

(assert (= b_and!6967 (and (=> t!5815 result!3593) b_and!6971)))

(declare-fun m!129787 () Bool)

(assert (=> b!113630 m!129787))

(declare-fun m!129789 () Bool)

(assert (=> b!113630 m!129789))

(assert (=> b!113630 m!129787))

(declare-fun m!129791 () Bool)

(assert (=> b!113630 m!129791))

(assert (=> b!113630 m!129789))

(declare-fun m!129793 () Bool)

(assert (=> b!113630 m!129793))

(declare-fun m!129795 () Bool)

(assert (=> b!113630 m!129795))

(declare-fun m!129797 () Bool)

(assert (=> b!113630 m!129797))

(declare-fun m!129799 () Bool)

(assert (=> b!113630 m!129799))

(assert (=> b!113630 m!129797))

(declare-fun m!129801 () Bool)

(assert (=> b!113630 m!129801))

(declare-fun m!129803 () Bool)

(assert (=> mapNonEmpty!4068 m!129803))

(declare-fun m!129805 () Bool)

(assert (=> b!113639 m!129805))

(declare-fun m!129807 () Bool)

(assert (=> b!113639 m!129807))

(assert (=> b!113639 m!129789))

(declare-fun m!129809 () Bool)

(assert (=> b!113639 m!129809))

(assert (=> b!113639 m!129789))

(assert (=> b!113639 m!129789))

(declare-fun m!129811 () Bool)

(assert (=> b!113639 m!129811))

(assert (=> b!113639 m!129789))

(declare-fun m!129813 () Bool)

(assert (=> b!113639 m!129813))

(declare-fun m!129815 () Bool)

(assert (=> start!13062 m!129815))

(declare-fun m!129817 () Bool)

(assert (=> mapNonEmpty!4067 m!129817))

(assert (=> b!113627 m!129789))

(assert (=> b!113627 m!129789))

(declare-fun m!129819 () Bool)

(assert (=> b!113627 m!129819))

(assert (=> b!113627 m!129789))

(declare-fun m!129821 () Bool)

(assert (=> b!113627 m!129821))

(assert (=> b!113631 m!129789))

(declare-fun m!129823 () Bool)

(assert (=> b!113631 m!129823))

(declare-fun m!129825 () Bool)

(assert (=> b!113631 m!129825))

(assert (=> b!113631 m!129823))

(assert (=> b!113631 m!129825))

(declare-fun m!129827 () Bool)

(assert (=> b!113631 m!129827))

(declare-fun m!129829 () Bool)

(assert (=> b!113626 m!129829))

(declare-fun m!129831 () Bool)

(assert (=> b!113626 m!129831))

(declare-fun m!129833 () Bool)

(assert (=> b!113622 m!129833))

(declare-fun m!129835 () Bool)

(assert (=> b!113622 m!129835))

(declare-fun m!129837 () Bool)

(assert (=> b!113634 m!129837))

(declare-fun m!129839 () Bool)

(assert (=> b!113632 m!129839))

(declare-fun m!129841 () Bool)

(assert (=> b!113632 m!129841))

(declare-fun m!129843 () Bool)

(assert (=> b!113636 m!129843))

(declare-fun m!129845 () Bool)

(assert (=> b!113628 m!129845))

(check-sat (not b!113627) (not b!113628) (not b!113639) (not b!113622) tp_is_empty!2713 (not mapNonEmpty!4067) (not b_next!2593) b_and!6971 (not b!113630) (not b!113626) (not b_next!2595) (not b!113631) (not b!113632) (not b!113634) (not start!13062) b_and!6969 (not b!113636) (not mapNonEmpty!4068) (not b_lambda!5083))
(check-sat b_and!6969 b_and!6971 (not b_next!2593) (not b_next!2595))
