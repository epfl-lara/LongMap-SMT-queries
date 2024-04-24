; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2984 () Bool)

(assert start!2984)

(declare-fun b!17286 () Bool)

(declare-fun b_free!595 () Bool)

(declare-fun b_next!595 () Bool)

(assert (=> b!17286 (= b_free!595 (not b_next!595))))

(declare-fun tp!2975 () Bool)

(declare-fun b_and!1237 () Bool)

(assert (=> b!17286 (= tp!2975 b_and!1237)))

(declare-fun b!17284 () Bool)

(declare-fun e!10794 () Bool)

(declare-fun e!10790 () Bool)

(assert (=> b!17284 (= e!10794 e!10790)))

(declare-fun b!17285 () Bool)

(declare-fun res!12528 () Bool)

(declare-fun e!10789 () Bool)

(assert (=> b!17285 (=> (not res!12528) (not e!10789))))

(declare-datatypes ((V!971 0))(
  ( (V!972 (val!456 Int)) )
))
(declare-datatypes ((ValueCell!230 0))(
  ( (ValueCellFull!230 (v!1416 V!971)) (EmptyCell!230) )
))
(declare-datatypes ((array!905 0))(
  ( (array!906 (arr!434 (Array (_ BitVec 32) (_ BitVec 64))) (size!524 (_ BitVec 32))) )
))
(declare-datatypes ((array!907 0))(
  ( (array!908 (arr!435 (Array (_ BitVec 32) ValueCell!230)) (size!525 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!46 0))(
  ( (LongMapFixedSize!47 (defaultEntry!1634 Int) (mask!4549 (_ BitVec 32)) (extraKeys!1547 (_ BitVec 32)) (zeroValue!1570 V!971) (minValue!1570 V!971) (_size!55 (_ BitVec 32)) (_keys!3059 array!905) (_values!1631 array!907) (_vacant!55 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!712 0))(
  ( (tuple2!713 (_1!357 Bool) (_2!357 LongMapFixedSize!46)) )
))
(declare-fun lt!4496 () tuple2!712)

(assert (=> b!17285 (= res!12528 (_1!357 lt!4496))))

(declare-fun mapIsEmpty!723 () Bool)

(declare-fun mapRes!723 () Bool)

(assert (=> mapIsEmpty!723 mapRes!723))

(declare-fun res!12525 () Bool)

(declare-fun e!10799 () Bool)

(assert (=> start!2984 (=> (not res!12525) (not e!10799))))

(declare-datatypes ((Cell!46 0))(
  ( (Cell!47 (v!1417 LongMapFixedSize!46)) )
))
(declare-datatypes ((LongMap!46 0))(
  ( (LongMap!47 (underlying!34 Cell!46)) )
))
(declare-fun thiss!848 () LongMap!46)

(declare-fun valid!31 (LongMap!46) Bool)

(assert (=> start!2984 (= res!12525 (valid!31 thiss!848))))

(assert (=> start!2984 e!10799))

(assert (=> start!2984 e!10794))

(assert (=> start!2984 true))

(declare-fun tp_is_empty!859 () Bool)

(assert (=> start!2984 tp_is_empty!859))

(declare-fun e!10798 () Bool)

(declare-fun e!10792 () Bool)

(declare-fun array_inv!315 (array!905) Bool)

(declare-fun array_inv!316 (array!907) Bool)

(assert (=> b!17286 (= e!10798 (and tp!2975 tp_is_empty!859 (array_inv!315 (_keys!3059 (v!1417 (underlying!34 thiss!848)))) (array_inv!316 (_values!1631 (v!1417 (underlying!34 thiss!848)))) e!10792))))

(declare-fun b!17287 () Bool)

(assert (=> b!17287 (= e!10790 e!10798)))

(declare-fun b!17288 () Bool)

(declare-fun e!10795 () Bool)

(assert (=> b!17288 (= e!10799 e!10795)))

(declare-fun res!12527 () Bool)

(assert (=> b!17288 (=> (not res!12527) (not e!10795))))

(declare-datatypes ((tuple2!714 0))(
  ( (tuple2!715 (_1!358 Bool) (_2!358 LongMap!46)) )
))
(declare-fun lt!4495 () tuple2!714)

(assert (=> b!17288 (= res!12527 (_1!358 lt!4495))))

(declare-fun e!10793 () tuple2!714)

(assert (=> b!17288 (= lt!4495 e!10793)))

(declare-fun c!1731 () Bool)

(declare-fun imbalanced!7 (LongMap!46) Bool)

(assert (=> b!17288 (= c!1731 (imbalanced!7 thiss!848))))

(declare-fun b!17289 () Bool)

(assert (=> b!17289 (= e!10793 (tuple2!715 true thiss!848))))

(declare-fun mapNonEmpty!723 () Bool)

(declare-fun tp!2976 () Bool)

(declare-fun e!10796 () Bool)

(assert (=> mapNonEmpty!723 (= mapRes!723 (and tp!2976 e!10796))))

(declare-fun mapRest!723 () (Array (_ BitVec 32) ValueCell!230))

(declare-fun mapValue!723 () ValueCell!230)

(declare-fun mapKey!723 () (_ BitVec 32))

(assert (=> mapNonEmpty!723 (= (arr!435 (_values!1631 (v!1417 (underlying!34 thiss!848)))) (store mapRest!723 mapKey!723 mapValue!723))))

(declare-fun b!17290 () Bool)

(declare-fun e!10791 () Bool)

(assert (=> b!17290 (= e!10791 tp_is_empty!859)))

(declare-fun b!17291 () Bool)

(assert (=> b!17291 (= e!10796 tp_is_empty!859)))

(declare-fun b!17292 () Bool)

(declare-fun repack!4 (LongMap!46) tuple2!714)

(assert (=> b!17292 (= e!10793 (repack!4 thiss!848))))

(declare-fun b!17293 () Bool)

(assert (=> b!17293 (= e!10789 false)))

(declare-fun lt!4497 () Bool)

(declare-fun lt!4498 () LongMap!46)

(declare-fun key!682 () (_ BitVec 64))

(declare-datatypes ((tuple2!716 0))(
  ( (tuple2!717 (_1!359 (_ BitVec 64)) (_2!359 V!971)) )
))
(declare-datatypes ((List!530 0))(
  ( (Nil!527) (Cons!526 (h!1092 tuple2!716) (t!3163 List!530)) )
))
(declare-datatypes ((ListLongMap!523 0))(
  ( (ListLongMap!524 (toList!277 List!530)) )
))
(declare-fun contains!208 (ListLongMap!523 (_ BitVec 64)) Bool)

(declare-fun map!332 (LongMap!46) ListLongMap!523)

(assert (=> b!17293 (= lt!4497 (contains!208 (map!332 lt!4498) key!682))))

(declare-fun b!17294 () Bool)

(assert (=> b!17294 (= e!10795 e!10789)))

(declare-fun res!12526 () Bool)

(assert (=> b!17294 (=> (not res!12526) (not e!10789))))

(assert (=> b!17294 (= res!12526 (valid!31 lt!4498))))

(assert (=> b!17294 (= lt!4498 (LongMap!47 (Cell!47 (_2!357 lt!4496))))))

(declare-fun v!259 () V!971)

(declare-fun update!5 (LongMapFixedSize!46 (_ BitVec 64) V!971) tuple2!712)

(assert (=> b!17294 (= lt!4496 (update!5 (v!1417 (underlying!34 (_2!358 lt!4495))) key!682 v!259))))

(declare-fun b!17295 () Bool)

(assert (=> b!17295 (= e!10792 (and e!10791 mapRes!723))))

(declare-fun condMapEmpty!723 () Bool)

(declare-fun mapDefault!723 () ValueCell!230)

(assert (=> b!17295 (= condMapEmpty!723 (= (arr!435 (_values!1631 (v!1417 (underlying!34 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!230)) mapDefault!723)))))

(assert (= (and start!2984 res!12525) b!17288))

(assert (= (and b!17288 c!1731) b!17292))

(assert (= (and b!17288 (not c!1731)) b!17289))

(assert (= (and b!17288 res!12527) b!17294))

(assert (= (and b!17294 res!12526) b!17285))

(assert (= (and b!17285 res!12528) b!17293))

(assert (= (and b!17295 condMapEmpty!723) mapIsEmpty!723))

(assert (= (and b!17295 (not condMapEmpty!723)) mapNonEmpty!723))

(get-info :version)

(assert (= (and mapNonEmpty!723 ((_ is ValueCellFull!230) mapValue!723)) b!17291))

(assert (= (and b!17295 ((_ is ValueCellFull!230) mapDefault!723)) b!17290))

(assert (= b!17286 b!17295))

(assert (= b!17287 b!17286))

(assert (= b!17284 b!17287))

(assert (= start!2984 b!17284))

(declare-fun m!12165 () Bool)

(assert (=> b!17288 m!12165))

(declare-fun m!12167 () Bool)

(assert (=> b!17293 m!12167))

(assert (=> b!17293 m!12167))

(declare-fun m!12169 () Bool)

(assert (=> b!17293 m!12169))

(declare-fun m!12171 () Bool)

(assert (=> b!17294 m!12171))

(declare-fun m!12173 () Bool)

(assert (=> b!17294 m!12173))

(declare-fun m!12175 () Bool)

(assert (=> start!2984 m!12175))

(declare-fun m!12177 () Bool)

(assert (=> b!17292 m!12177))

(declare-fun m!12179 () Bool)

(assert (=> mapNonEmpty!723 m!12179))

(declare-fun m!12181 () Bool)

(assert (=> b!17286 m!12181))

(declare-fun m!12183 () Bool)

(assert (=> b!17286 m!12183))

(check-sat (not start!2984) (not b!17294) (not b!17293) (not b!17286) tp_is_empty!859 (not b_next!595) b_and!1237 (not b!17288) (not b!17292) (not mapNonEmpty!723))
(check-sat b_and!1237 (not b_next!595))
