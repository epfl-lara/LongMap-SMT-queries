; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90346 () Bool)

(assert start!90346)

(declare-fun b!1033616 () Bool)

(declare-fun b_free!20719 () Bool)

(declare-fun b_next!20719 () Bool)

(assert (=> b!1033616 (= b_free!20719 (not b_next!20719))))

(declare-fun tp!73227 () Bool)

(declare-fun b_and!33197 () Bool)

(assert (=> b!1033616 (= tp!73227 b_and!33197)))

(declare-fun b!1033615 () Bool)

(declare-fun e!584098 () Bool)

(declare-fun tp_is_empty!24439 () Bool)

(assert (=> b!1033615 (= e!584098 tp_is_empty!24439)))

(declare-fun e!584097 () Bool)

(declare-fun e!584095 () Bool)

(declare-datatypes ((V!37459 0))(
  ( (V!37460 (val!12270 Int)) )
))
(declare-datatypes ((ValueCell!11516 0))(
  ( (ValueCellFull!11516 (v!14843 V!37459)) (EmptyCell!11516) )
))
(declare-datatypes ((array!64991 0))(
  ( (array!64992 (arr!31291 (Array (_ BitVec 32) (_ BitVec 64))) (size!31809 (_ BitVec 32))) )
))
(declare-datatypes ((array!64993 0))(
  ( (array!64994 (arr!31292 (Array (_ BitVec 32) ValueCell!11516)) (size!31810 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5626 0))(
  ( (LongMapFixedSize!5627 (defaultEntry!6187 Int) (mask!30063 (_ BitVec 32)) (extraKeys!5919 (_ BitVec 32)) (zeroValue!6023 V!37459) (minValue!6023 V!37459) (_size!2868 (_ BitVec 32)) (_keys!11398 array!64991) (_values!6210 array!64993) (_vacant!2868 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5626)

(declare-fun array_inv!24225 (array!64991) Bool)

(declare-fun array_inv!24226 (array!64993) Bool)

(assert (=> b!1033616 (= e!584097 (and tp!73227 tp_is_empty!24439 (array_inv!24225 (_keys!11398 thiss!1427)) (array_inv!24226 (_values!6210 thiss!1427)) e!584095))))

(declare-fun b!1033617 () Bool)

(declare-fun e!584096 () Bool)

(assert (=> b!1033617 (= e!584096 false)))

(declare-datatypes ((SeekEntryResult!9685 0))(
  ( (MissingZero!9685 (index!41111 (_ BitVec 32))) (Found!9685 (index!41112 (_ BitVec 32))) (Intermediate!9685 (undefined!10497 Bool) (index!41113 (_ BitVec 32)) (x!91963 (_ BitVec 32))) (Undefined!9685) (MissingVacant!9685 (index!41114 (_ BitVec 32))) )
))
(declare-fun lt!456538 () SeekEntryResult!9685)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64991 (_ BitVec 32)) SeekEntryResult!9685)

(assert (=> b!1033617 (= lt!456538 (seekEntry!0 key!909 (_keys!11398 thiss!1427) (mask!30063 thiss!1427)))))

(declare-fun res!690497 () Bool)

(assert (=> start!90346 (=> (not res!690497) (not e!584096))))

(declare-fun valid!2136 (LongMapFixedSize!5626) Bool)

(assert (=> start!90346 (= res!690497 (valid!2136 thiss!1427))))

(assert (=> start!90346 e!584096))

(assert (=> start!90346 e!584097))

(assert (=> start!90346 true))

(declare-fun b!1033618 () Bool)

(declare-fun mapRes!38112 () Bool)

(assert (=> b!1033618 (= e!584095 (and e!584098 mapRes!38112))))

(declare-fun condMapEmpty!38112 () Bool)

(declare-fun mapDefault!38112 () ValueCell!11516)

(assert (=> b!1033618 (= condMapEmpty!38112 (= (arr!31292 (_values!6210 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11516)) mapDefault!38112)))))

(declare-fun b!1033619 () Bool)

(declare-fun e!584099 () Bool)

(assert (=> b!1033619 (= e!584099 tp_is_empty!24439)))

(declare-fun mapIsEmpty!38112 () Bool)

(assert (=> mapIsEmpty!38112 mapRes!38112))

(declare-fun b!1033620 () Bool)

(declare-fun res!690496 () Bool)

(assert (=> b!1033620 (=> (not res!690496) (not e!584096))))

(assert (=> b!1033620 (= res!690496 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38112 () Bool)

(declare-fun tp!73228 () Bool)

(assert (=> mapNonEmpty!38112 (= mapRes!38112 (and tp!73228 e!584099))))

(declare-fun mapKey!38112 () (_ BitVec 32))

(declare-fun mapValue!38112 () ValueCell!11516)

(declare-fun mapRest!38112 () (Array (_ BitVec 32) ValueCell!11516))

(assert (=> mapNonEmpty!38112 (= (arr!31292 (_values!6210 thiss!1427)) (store mapRest!38112 mapKey!38112 mapValue!38112))))

(assert (= (and start!90346 res!690497) b!1033620))

(assert (= (and b!1033620 res!690496) b!1033617))

(assert (= (and b!1033618 condMapEmpty!38112) mapIsEmpty!38112))

(assert (= (and b!1033618 (not condMapEmpty!38112)) mapNonEmpty!38112))

(get-info :version)

(assert (= (and mapNonEmpty!38112 ((_ is ValueCellFull!11516) mapValue!38112)) b!1033619))

(assert (= (and b!1033618 ((_ is ValueCellFull!11516) mapDefault!38112)) b!1033615))

(assert (= b!1033616 b!1033618))

(assert (= start!90346 b!1033616))

(declare-fun m!954311 () Bool)

(assert (=> b!1033616 m!954311))

(declare-fun m!954313 () Bool)

(assert (=> b!1033616 m!954313))

(declare-fun m!954315 () Bool)

(assert (=> b!1033617 m!954315))

(declare-fun m!954317 () Bool)

(assert (=> start!90346 m!954317))

(declare-fun m!954319 () Bool)

(assert (=> mapNonEmpty!38112 m!954319))

(check-sat (not b!1033617) (not b_next!20719) tp_is_empty!24439 (not mapNonEmpty!38112) (not b!1033616) (not start!90346) b_and!33197)
(check-sat b_and!33197 (not b_next!20719))
