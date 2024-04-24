; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90340 () Bool)

(assert start!90340)

(declare-fun b!1033561 () Bool)

(declare-fun b_free!20713 () Bool)

(declare-fun b_next!20713 () Bool)

(assert (=> b!1033561 (= b_free!20713 (not b_next!20713))))

(declare-fun tp!73210 () Bool)

(declare-fun b_and!33191 () Bool)

(assert (=> b!1033561 (= tp!73210 b_and!33191)))

(declare-fun tp_is_empty!24433 () Bool)

(declare-fun e!584046 () Bool)

(declare-datatypes ((V!37451 0))(
  ( (V!37452 (val!12267 Int)) )
))
(declare-datatypes ((ValueCell!11513 0))(
  ( (ValueCellFull!11513 (v!14840 V!37451)) (EmptyCell!11513) )
))
(declare-datatypes ((array!64979 0))(
  ( (array!64980 (arr!31285 (Array (_ BitVec 32) (_ BitVec 64))) (size!31803 (_ BitVec 32))) )
))
(declare-datatypes ((array!64981 0))(
  ( (array!64982 (arr!31286 (Array (_ BitVec 32) ValueCell!11513)) (size!31804 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5620 0))(
  ( (LongMapFixedSize!5621 (defaultEntry!6184 Int) (mask!30058 (_ BitVec 32)) (extraKeys!5916 (_ BitVec 32)) (zeroValue!6020 V!37451) (minValue!6020 V!37451) (_size!2865 (_ BitVec 32)) (_keys!11395 array!64979) (_values!6207 array!64981) (_vacant!2865 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5620)

(declare-fun e!584043 () Bool)

(declare-fun array_inv!24223 (array!64979) Bool)

(declare-fun array_inv!24224 (array!64981) Bool)

(assert (=> b!1033561 (= e!584046 (and tp!73210 tp_is_empty!24433 (array_inv!24223 (_keys!11395 thiss!1427)) (array_inv!24224 (_values!6207 thiss!1427)) e!584043))))

(declare-fun mapNonEmpty!38103 () Bool)

(declare-fun mapRes!38103 () Bool)

(declare-fun tp!73209 () Bool)

(declare-fun e!584042 () Bool)

(assert (=> mapNonEmpty!38103 (= mapRes!38103 (and tp!73209 e!584042))))

(declare-fun mapValue!38103 () ValueCell!11513)

(declare-fun mapKey!38103 () (_ BitVec 32))

(declare-fun mapRest!38103 () (Array (_ BitVec 32) ValueCell!11513))

(assert (=> mapNonEmpty!38103 (= (arr!31286 (_values!6207 thiss!1427)) (store mapRest!38103 mapKey!38103 mapValue!38103))))

(declare-fun res!690478 () Bool)

(declare-fun e!584041 () Bool)

(assert (=> start!90340 (=> (not res!690478) (not e!584041))))

(declare-fun valid!2133 (LongMapFixedSize!5620) Bool)

(assert (=> start!90340 (= res!690478 (valid!2133 thiss!1427))))

(assert (=> start!90340 e!584041))

(assert (=> start!90340 e!584046))

(assert (=> start!90340 true))

(declare-fun b!1033562 () Bool)

(assert (=> b!1033562 (= e!584041 false)))

(declare-datatypes ((SeekEntryResult!9682 0))(
  ( (MissingZero!9682 (index!41099 (_ BitVec 32))) (Found!9682 (index!41100 (_ BitVec 32))) (Intermediate!9682 (undefined!10494 Bool) (index!41101 (_ BitVec 32)) (x!91952 (_ BitVec 32))) (Undefined!9682) (MissingVacant!9682 (index!41102 (_ BitVec 32))) )
))
(declare-fun lt!456529 () SeekEntryResult!9682)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64979 (_ BitVec 32)) SeekEntryResult!9682)

(assert (=> b!1033562 (= lt!456529 (seekEntry!0 key!909 (_keys!11395 thiss!1427) (mask!30058 thiss!1427)))))

(declare-fun mapIsEmpty!38103 () Bool)

(assert (=> mapIsEmpty!38103 mapRes!38103))

(declare-fun b!1033563 () Bool)

(declare-fun res!690479 () Bool)

(assert (=> b!1033563 (=> (not res!690479) (not e!584041))))

(assert (=> b!1033563 (= res!690479 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1033564 () Bool)

(declare-fun e!584045 () Bool)

(assert (=> b!1033564 (= e!584043 (and e!584045 mapRes!38103))))

(declare-fun condMapEmpty!38103 () Bool)

(declare-fun mapDefault!38103 () ValueCell!11513)

(assert (=> b!1033564 (= condMapEmpty!38103 (= (arr!31286 (_values!6207 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11513)) mapDefault!38103)))))

(declare-fun b!1033565 () Bool)

(assert (=> b!1033565 (= e!584042 tp_is_empty!24433)))

(declare-fun b!1033566 () Bool)

(assert (=> b!1033566 (= e!584045 tp_is_empty!24433)))

(assert (= (and start!90340 res!690478) b!1033563))

(assert (= (and b!1033563 res!690479) b!1033562))

(assert (= (and b!1033564 condMapEmpty!38103) mapIsEmpty!38103))

(assert (= (and b!1033564 (not condMapEmpty!38103)) mapNonEmpty!38103))

(get-info :version)

(assert (= (and mapNonEmpty!38103 ((_ is ValueCellFull!11513) mapValue!38103)) b!1033565))

(assert (= (and b!1033564 ((_ is ValueCellFull!11513) mapDefault!38103)) b!1033566))

(assert (= b!1033561 b!1033564))

(assert (= start!90340 b!1033561))

(declare-fun m!954281 () Bool)

(assert (=> b!1033561 m!954281))

(declare-fun m!954283 () Bool)

(assert (=> b!1033561 m!954283))

(declare-fun m!954285 () Bool)

(assert (=> mapNonEmpty!38103 m!954285))

(declare-fun m!954287 () Bool)

(assert (=> start!90340 m!954287))

(declare-fun m!954289 () Bool)

(assert (=> b!1033562 m!954289))

(check-sat (not mapNonEmpty!38103) tp_is_empty!24433 (not b!1033562) (not start!90340) (not b!1033561) b_and!33191 (not b_next!20713))
(check-sat b_and!33191 (not b_next!20713))
