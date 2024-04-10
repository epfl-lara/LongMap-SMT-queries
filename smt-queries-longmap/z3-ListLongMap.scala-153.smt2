; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2990 () Bool)

(assert start!2990)

(declare-fun b!17366 () Bool)

(declare-fun b_free!597 () Bool)

(declare-fun b_next!597 () Bool)

(assert (=> b!17366 (= b_free!597 (not b_next!597))))

(declare-fun tp!2982 () Bool)

(declare-fun b_and!1245 () Bool)

(assert (=> b!17366 (= tp!2982 b_and!1245)))

(declare-fun b!17362 () Bool)

(declare-fun e!10861 () Bool)

(declare-fun e!10858 () Bool)

(assert (=> b!17362 (= e!10861 e!10858)))

(declare-fun res!12561 () Bool)

(assert (=> b!17362 (=> (not res!12561) (not e!10858))))

(declare-datatypes ((V!973 0))(
  ( (V!974 (val!457 Int)) )
))
(declare-datatypes ((ValueCell!231 0))(
  ( (ValueCellFull!231 (v!1418 V!973)) (EmptyCell!231) )
))
(declare-datatypes ((array!927 0))(
  ( (array!928 (arr!445 (Array (_ BitVec 32) ValueCell!231)) (size!535 (_ BitVec 32))) )
))
(declare-datatypes ((array!929 0))(
  ( (array!930 (arr!446 (Array (_ BitVec 32) (_ BitVec 64))) (size!536 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!48 0))(
  ( (LongMapFixedSize!49 (defaultEntry!1635 Int) (mask!4550 (_ BitVec 32)) (extraKeys!1548 (_ BitVec 32)) (zeroValue!1571 V!973) (minValue!1571 V!973) (_size!56 (_ BitVec 32)) (_keys!3060 array!929) (_values!1632 array!927) (_vacant!56 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!48 0))(
  ( (Cell!49 (v!1419 LongMapFixedSize!48)) )
))
(declare-datatypes ((LongMap!48 0))(
  ( (LongMap!49 (underlying!35 Cell!48)) )
))
(declare-datatypes ((tuple2!720 0))(
  ( (tuple2!721 (_1!361 Bool) (_2!361 LongMap!48)) )
))
(declare-fun lt!4510 () tuple2!720)

(assert (=> b!17362 (= res!12561 (_1!361 lt!4510))))

(declare-fun e!10854 () tuple2!720)

(assert (=> b!17362 (= lt!4510 e!10854)))

(declare-fun c!1744 () Bool)

(declare-fun thiss!848 () LongMap!48)

(declare-fun imbalanced!8 (LongMap!48) Bool)

(assert (=> b!17362 (= c!1744 (imbalanced!8 thiss!848))))

(declare-fun b!17363 () Bool)

(declare-fun e!10864 () Bool)

(declare-fun e!10856 () Bool)

(assert (=> b!17363 (= e!10864 e!10856)))

(declare-fun b!17364 () Bool)

(declare-fun res!12560 () Bool)

(declare-fun e!10863 () Bool)

(assert (=> b!17364 (=> (not res!12560) (not e!10863))))

(declare-datatypes ((tuple2!722 0))(
  ( (tuple2!723 (_1!362 Bool) (_2!362 LongMapFixedSize!48)) )
))
(declare-fun lt!4508 () tuple2!722)

(assert (=> b!17364 (= res!12560 (_1!362 lt!4508))))

(declare-fun b!17365 () Bool)

(declare-fun e!10859 () Bool)

(assert (=> b!17365 (= e!10859 e!10864)))

(declare-fun tp_is_empty!861 () Bool)

(declare-fun e!10857 () Bool)

(declare-fun array_inv!311 (array!929) Bool)

(declare-fun array_inv!312 (array!927) Bool)

(assert (=> b!17366 (= e!10856 (and tp!2982 tp_is_empty!861 (array_inv!311 (_keys!3060 (v!1419 (underlying!35 thiss!848)))) (array_inv!312 (_values!1632 (v!1419 (underlying!35 thiss!848)))) e!10857))))

(declare-fun b!17367 () Bool)

(assert (=> b!17367 (= e!10858 e!10863)))

(declare-fun res!12559 () Bool)

(assert (=> b!17367 (=> (not res!12559) (not e!10863))))

(declare-fun lt!4509 () LongMap!48)

(declare-fun valid!25 (LongMap!48) Bool)

(assert (=> b!17367 (= res!12559 (valid!25 lt!4509))))

(assert (=> b!17367 (= lt!4509 (LongMap!49 (Cell!49 (_2!362 lt!4508))))))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun v!259 () V!973)

(declare-fun update!5 (LongMapFixedSize!48 (_ BitVec 64) V!973) tuple2!722)

(assert (=> b!17367 (= lt!4508 (update!5 (v!1419 (underlying!35 (_2!361 lt!4510))) key!682 v!259))))

(declare-fun b!17368 () Bool)

(declare-fun repack!5 (LongMap!48) tuple2!720)

(assert (=> b!17368 (= e!10854 (repack!5 thiss!848))))

(declare-fun b!17369 () Bool)

(assert (=> b!17369 (= e!10854 (tuple2!721 true thiss!848))))

(declare-fun b!17370 () Bool)

(declare-fun e!10862 () Bool)

(assert (=> b!17370 (= e!10862 tp_is_empty!861)))

(declare-fun mapNonEmpty!726 () Bool)

(declare-fun mapRes!726 () Bool)

(declare-fun tp!2981 () Bool)

(declare-fun e!10855 () Bool)

(assert (=> mapNonEmpty!726 (= mapRes!726 (and tp!2981 e!10855))))

(declare-fun mapKey!726 () (_ BitVec 32))

(declare-fun mapValue!726 () ValueCell!231)

(declare-fun mapRest!726 () (Array (_ BitVec 32) ValueCell!231))

(assert (=> mapNonEmpty!726 (= (arr!445 (_values!1632 (v!1419 (underlying!35 thiss!848)))) (store mapRest!726 mapKey!726 mapValue!726))))

(declare-fun mapIsEmpty!726 () Bool)

(assert (=> mapIsEmpty!726 mapRes!726))

(declare-fun b!17371 () Bool)

(assert (=> b!17371 (= e!10855 tp_is_empty!861)))

(declare-fun res!12562 () Bool)

(assert (=> start!2990 (=> (not res!12562) (not e!10861))))

(assert (=> start!2990 (= res!12562 (valid!25 thiss!848))))

(assert (=> start!2990 e!10861))

(assert (=> start!2990 e!10859))

(assert (=> start!2990 true))

(assert (=> start!2990 tp_is_empty!861))

(declare-fun b!17372 () Bool)

(assert (=> b!17372 (= e!10863 false)))

(declare-fun lt!4507 () Bool)

(declare-datatypes ((tuple2!724 0))(
  ( (tuple2!725 (_1!363 (_ BitVec 64)) (_2!363 V!973)) )
))
(declare-datatypes ((List!535 0))(
  ( (Nil!532) (Cons!531 (h!1097 tuple2!724) (t!3174 List!535)) )
))
(declare-datatypes ((ListLongMap!529 0))(
  ( (ListLongMap!530 (toList!280 List!535)) )
))
(declare-fun contains!212 (ListLongMap!529 (_ BitVec 64)) Bool)

(declare-fun map!333 (LongMap!48) ListLongMap!529)

(assert (=> b!17372 (= lt!4507 (contains!212 (map!333 lt!4509) key!682))))

(declare-fun b!17373 () Bool)

(assert (=> b!17373 (= e!10857 (and e!10862 mapRes!726))))

(declare-fun condMapEmpty!726 () Bool)

(declare-fun mapDefault!726 () ValueCell!231)

(assert (=> b!17373 (= condMapEmpty!726 (= (arr!445 (_values!1632 (v!1419 (underlying!35 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!231)) mapDefault!726)))))

(assert (= (and start!2990 res!12562) b!17362))

(assert (= (and b!17362 c!1744) b!17368))

(assert (= (and b!17362 (not c!1744)) b!17369))

(assert (= (and b!17362 res!12561) b!17367))

(assert (= (and b!17367 res!12559) b!17364))

(assert (= (and b!17364 res!12560) b!17372))

(assert (= (and b!17373 condMapEmpty!726) mapIsEmpty!726))

(assert (= (and b!17373 (not condMapEmpty!726)) mapNonEmpty!726))

(get-info :version)

(assert (= (and mapNonEmpty!726 ((_ is ValueCellFull!231) mapValue!726)) b!17371))

(assert (= (and b!17373 ((_ is ValueCellFull!231) mapDefault!726)) b!17370))

(assert (= b!17366 b!17373))

(assert (= b!17363 b!17366))

(assert (= b!17365 b!17363))

(assert (= start!2990 b!17365))

(declare-fun m!12233 () Bool)

(assert (=> b!17367 m!12233))

(declare-fun m!12235 () Bool)

(assert (=> b!17367 m!12235))

(declare-fun m!12237 () Bool)

(assert (=> b!17372 m!12237))

(assert (=> b!17372 m!12237))

(declare-fun m!12239 () Bool)

(assert (=> b!17372 m!12239))

(declare-fun m!12241 () Bool)

(assert (=> b!17366 m!12241))

(declare-fun m!12243 () Bool)

(assert (=> b!17366 m!12243))

(declare-fun m!12245 () Bool)

(assert (=> b!17368 m!12245))

(declare-fun m!12247 () Bool)

(assert (=> start!2990 m!12247))

(declare-fun m!12249 () Bool)

(assert (=> b!17362 m!12249))

(declare-fun m!12251 () Bool)

(assert (=> mapNonEmpty!726 m!12251))

(check-sat (not start!2990) (not mapNonEmpty!726) b_and!1245 (not b!17367) tp_is_empty!861 (not b!17372) (not b!17366) (not b!17368) (not b!17362) (not b_next!597))
(check-sat b_and!1245 (not b_next!597))
