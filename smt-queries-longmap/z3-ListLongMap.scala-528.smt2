; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13198 () Bool)

(assert start!13198)

(declare-fun b!116116 () Bool)

(declare-fun b_free!2729 () Bool)

(declare-fun b_next!2729 () Bool)

(assert (=> b!116116 (= b_free!2729 (not b_next!2729))))

(declare-fun tp!10555 () Bool)

(declare-fun b_and!7227 () Bool)

(assert (=> b!116116 (= tp!10555 b_and!7227)))

(declare-fun b!116114 () Bool)

(declare-fun b_free!2731 () Bool)

(declare-fun b_next!2731 () Bool)

(assert (=> b!116114 (= b_free!2731 (not b_next!2731))))

(declare-fun tp!10558 () Bool)

(declare-fun b_and!7229 () Bool)

(assert (=> b!116114 (= tp!10558 b_and!7229)))

(declare-fun mapNonEmpty!4281 () Bool)

(declare-fun mapRes!4281 () Bool)

(declare-fun tp!10557 () Bool)

(declare-fun e!75789 () Bool)

(assert (=> mapNonEmpty!4281 (= mapRes!4281 (and tp!10557 e!75789))))

(declare-datatypes ((V!3355 0))(
  ( (V!3356 (val!1435 Int)) )
))
(declare-datatypes ((ValueCell!1047 0))(
  ( (ValueCellFull!1047 (v!3039 V!3355)) (EmptyCell!1047) )
))
(declare-fun mapValue!4282 () ValueCell!1047)

(declare-datatypes ((array!4567 0))(
  ( (array!4568 (arr!2165 (Array (_ BitVec 32) (_ BitVec 64))) (size!2426 (_ BitVec 32))) )
))
(declare-datatypes ((array!4569 0))(
  ( (array!4570 (arr!2166 (Array (_ BitVec 32) ValueCell!1047)) (size!2427 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1002 0))(
  ( (LongMapFixedSize!1003 (defaultEntry!2712 Int) (mask!6926 (_ BitVec 32)) (extraKeys!2501 (_ BitVec 32)) (zeroValue!2579 V!3355) (minValue!2579 V!3355) (_size!550 (_ BitVec 32)) (_keys!4435 array!4567) (_values!2695 array!4569) (_vacant!550 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!800 0))(
  ( (Cell!801 (v!3040 LongMapFixedSize!1002)) )
))
(declare-datatypes ((LongMap!800 0))(
  ( (LongMap!801 (underlying!411 Cell!800)) )
))
(declare-fun thiss!992 () LongMap!800)

(declare-fun mapKey!4282 () (_ BitVec 32))

(declare-fun mapRest!4282 () (Array (_ BitVec 32) ValueCell!1047))

(assert (=> mapNonEmpty!4281 (= (arr!2166 (_values!2695 (v!3040 (underlying!411 thiss!992)))) (store mapRest!4282 mapKey!4282 mapValue!4282))))

(declare-fun b!116106 () Bool)

(declare-fun res!56919 () Bool)

(declare-fun e!75795 () Bool)

(assert (=> b!116106 (=> (not res!56919) (not e!75795))))

(declare-fun newMap!16 () LongMapFixedSize!1002)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2526 0))(
  ( (tuple2!2527 (_1!1274 (_ BitVec 64)) (_2!1274 V!3355)) )
))
(declare-datatypes ((List!1676 0))(
  ( (Nil!1673) (Cons!1672 (h!2272 tuple2!2526) (t!5938 List!1676)) )
))
(declare-datatypes ((ListLongMap!1649 0))(
  ( (ListLongMap!1650 (toList!840 List!1676)) )
))
(declare-fun getCurrentListMap!521 (array!4567 array!4569 (_ BitVec 32) (_ BitVec 32) V!3355 V!3355 (_ BitVec 32) Int) ListLongMap!1649)

(declare-fun map!1352 (LongMapFixedSize!1002) ListLongMap!1649)

(assert (=> b!116106 (= res!56919 (= (getCurrentListMap!521 (_keys!4435 (v!3040 (underlying!411 thiss!992))) (_values!2695 (v!3040 (underlying!411 thiss!992))) (mask!6926 (v!3040 (underlying!411 thiss!992))) (extraKeys!2501 (v!3040 (underlying!411 thiss!992))) (zeroValue!2579 (v!3040 (underlying!411 thiss!992))) (minValue!2579 (v!3040 (underlying!411 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2712 (v!3040 (underlying!411 thiss!992)))) (map!1352 newMap!16)))))

(declare-fun mapIsEmpty!4281 () Bool)

(declare-fun mapRes!4282 () Bool)

(assert (=> mapIsEmpty!4281 mapRes!4282))

(declare-fun b!116107 () Bool)

(declare-fun res!56920 () Bool)

(assert (=> b!116107 (=> (not res!56920) (not e!75795))))

(assert (=> b!116107 (= res!56920 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6926 newMap!16)) (_size!550 (v!3040 (underlying!411 thiss!992)))))))

(declare-fun b!116108 () Bool)

(declare-fun e!75793 () Bool)

(declare-fun e!75794 () Bool)

(assert (=> b!116108 (= e!75793 e!75794)))

(declare-fun b!116109 () Bool)

(declare-fun tp_is_empty!2781 () Bool)

(assert (=> b!116109 (= e!75789 tp_is_empty!2781)))

(declare-fun res!56917 () Bool)

(assert (=> start!13198 (=> (not res!56917) (not e!75795))))

(declare-fun valid!474 (LongMap!800) Bool)

(assert (=> start!13198 (= res!56917 (valid!474 thiss!992))))

(assert (=> start!13198 e!75795))

(assert (=> start!13198 e!75793))

(assert (=> start!13198 true))

(declare-fun e!75800 () Bool)

(assert (=> start!13198 e!75800))

(declare-fun b!116110 () Bool)

(declare-fun e!75790 () Bool)

(assert (=> b!116110 (= e!75790 tp_is_empty!2781)))

(declare-fun b!116111 () Bool)

(declare-fun res!56918 () Bool)

(assert (=> b!116111 (=> (not res!56918) (not e!75795))))

(assert (=> b!116111 (= res!56918 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2426 (_keys!4435 (v!3040 (underlying!411 thiss!992)))))))))

(declare-fun b!116112 () Bool)

(declare-fun e!75791 () Bool)

(assert (=> b!116112 (= e!75791 (and e!75790 mapRes!4282))))

(declare-fun condMapEmpty!4281 () Bool)

(declare-fun mapDefault!4281 () ValueCell!1047)

(assert (=> b!116112 (= condMapEmpty!4281 (= (arr!2166 (_values!2695 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1047)) mapDefault!4281)))))

(declare-fun b!116113 () Bool)

(declare-fun res!56921 () Bool)

(assert (=> b!116113 (=> (not res!56921) (not e!75795))))

(declare-fun valid!475 (LongMapFixedSize!1002) Bool)

(assert (=> b!116113 (= res!56921 (valid!475 newMap!16))))

(declare-fun array_inv!1361 (array!4567) Bool)

(declare-fun array_inv!1362 (array!4569) Bool)

(assert (=> b!116114 (= e!75800 (and tp!10558 tp_is_empty!2781 (array_inv!1361 (_keys!4435 newMap!16)) (array_inv!1362 (_values!2695 newMap!16)) e!75791))))

(declare-fun b!116115 () Bool)

(declare-fun res!56916 () Bool)

(assert (=> b!116115 (=> (not res!56916) (not e!75795))))

(assert (=> b!116115 (= res!56916 (and (or (= (select (arr!2165 (_keys!4435 (v!3040 (underlying!411 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2165 (_keys!4435 (v!3040 (underlying!411 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun e!75798 () Bool)

(declare-fun e!75787 () Bool)

(assert (=> b!116116 (= e!75787 (and tp!10555 tp_is_empty!2781 (array_inv!1361 (_keys!4435 (v!3040 (underlying!411 thiss!992)))) (array_inv!1362 (_values!2695 (v!3040 (underlying!411 thiss!992)))) e!75798))))

(declare-fun b!116117 () Bool)

(declare-fun e!75797 () Bool)

(assert (=> b!116117 (= e!75797 tp_is_empty!2781)))

(declare-fun b!116118 () Bool)

(assert (=> b!116118 (= e!75794 e!75787)))

(declare-fun b!116119 () Bool)

(declare-fun e!75792 () Bool)

(assert (=> b!116119 (= e!75798 (and e!75792 mapRes!4281))))

(declare-fun condMapEmpty!4282 () Bool)

(declare-fun mapDefault!4282 () ValueCell!1047)

(assert (=> b!116119 (= condMapEmpty!4282 (= (arr!2166 (_values!2695 (v!3040 (underlying!411 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1047)) mapDefault!4282)))))

(declare-fun b!116120 () Bool)

(assert (=> b!116120 (= e!75792 tp_is_empty!2781)))

(declare-fun mapIsEmpty!4282 () Bool)

(assert (=> mapIsEmpty!4282 mapRes!4281))

(declare-fun b!116121 () Bool)

(declare-fun e!75799 () Bool)

(assert (=> b!116121 (= e!75795 e!75799)))

(declare-fun res!56922 () Bool)

(assert (=> b!116121 (=> (not res!56922) (not e!75799))))

(declare-datatypes ((tuple2!2528 0))(
  ( (tuple2!2529 (_1!1275 Bool) (_2!1275 LongMapFixedSize!1002)) )
))
(declare-fun lt!60299 () tuple2!2528)

(assert (=> b!116121 (= res!56922 (_1!1275 lt!60299))))

(declare-fun repackFrom!14 (LongMap!800 LongMapFixedSize!1002 (_ BitVec 32)) tuple2!2528)

(assert (=> b!116121 (= lt!60299 (repackFrom!14 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!116122 () Bool)

(assert (=> b!116122 (= e!75799 false)))

(declare-fun lt!60300 () Bool)

(assert (=> b!116122 (= lt!60300 (valid!475 (_2!1275 lt!60299)))))

(declare-fun mapNonEmpty!4282 () Bool)

(declare-fun tp!10556 () Bool)

(assert (=> mapNonEmpty!4282 (= mapRes!4282 (and tp!10556 e!75797))))

(declare-fun mapRest!4281 () (Array (_ BitVec 32) ValueCell!1047))

(declare-fun mapValue!4281 () ValueCell!1047)

(declare-fun mapKey!4281 () (_ BitVec 32))

(assert (=> mapNonEmpty!4282 (= (arr!2166 (_values!2695 newMap!16)) (store mapRest!4281 mapKey!4281 mapValue!4281))))

(assert (= (and start!13198 res!56917) b!116111))

(assert (= (and b!116111 res!56918) b!116113))

(assert (= (and b!116113 res!56921) b!116107))

(assert (= (and b!116107 res!56920) b!116106))

(assert (= (and b!116106 res!56919) b!116115))

(assert (= (and b!116115 res!56916) b!116121))

(assert (= (and b!116121 res!56922) b!116122))

(assert (= (and b!116119 condMapEmpty!4282) mapIsEmpty!4282))

(assert (= (and b!116119 (not condMapEmpty!4282)) mapNonEmpty!4281))

(get-info :version)

(assert (= (and mapNonEmpty!4281 ((_ is ValueCellFull!1047) mapValue!4282)) b!116109))

(assert (= (and b!116119 ((_ is ValueCellFull!1047) mapDefault!4282)) b!116120))

(assert (= b!116116 b!116119))

(assert (= b!116118 b!116116))

(assert (= b!116108 b!116118))

(assert (= start!13198 b!116108))

(assert (= (and b!116112 condMapEmpty!4281) mapIsEmpty!4281))

(assert (= (and b!116112 (not condMapEmpty!4281)) mapNonEmpty!4282))

(assert (= (and mapNonEmpty!4282 ((_ is ValueCellFull!1047) mapValue!4281)) b!116117))

(assert (= (and b!116112 ((_ is ValueCellFull!1047) mapDefault!4281)) b!116110))

(assert (= b!116114 b!116112))

(assert (= start!13198 b!116114))

(declare-fun m!132319 () Bool)

(assert (=> b!116122 m!132319))

(declare-fun m!132321 () Bool)

(assert (=> start!13198 m!132321))

(declare-fun m!132323 () Bool)

(assert (=> b!116116 m!132323))

(declare-fun m!132325 () Bool)

(assert (=> b!116116 m!132325))

(declare-fun m!132327 () Bool)

(assert (=> b!116106 m!132327))

(declare-fun m!132329 () Bool)

(assert (=> b!116106 m!132329))

(declare-fun m!132331 () Bool)

(assert (=> mapNonEmpty!4282 m!132331))

(declare-fun m!132333 () Bool)

(assert (=> mapNonEmpty!4281 m!132333))

(declare-fun m!132335 () Bool)

(assert (=> b!116114 m!132335))

(declare-fun m!132337 () Bool)

(assert (=> b!116114 m!132337))

(declare-fun m!132339 () Bool)

(assert (=> b!116115 m!132339))

(declare-fun m!132341 () Bool)

(assert (=> b!116121 m!132341))

(declare-fun m!132343 () Bool)

(assert (=> b!116113 m!132343))

(check-sat tp_is_empty!2781 (not mapNonEmpty!4282) (not b!116116) (not b_next!2729) b_and!7227 (not b_next!2731) (not b!116114) (not b!116122) b_and!7229 (not start!13198) (not b!116113) (not b!116121) (not b!116106) (not mapNonEmpty!4281))
(check-sat b_and!7227 b_and!7229 (not b_next!2729) (not b_next!2731))
