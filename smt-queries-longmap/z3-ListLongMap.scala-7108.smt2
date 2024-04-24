; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90328 () Bool)

(assert start!90328)

(declare-fun b!1033453 () Bool)

(declare-fun b_free!20701 () Bool)

(declare-fun b_next!20701 () Bool)

(assert (=> b!1033453 (= b_free!20701 (not b_next!20701))))

(declare-fun tp!73174 () Bool)

(declare-fun b_and!33179 () Bool)

(assert (=> b!1033453 (= tp!73174 b_and!33179)))

(declare-fun tp_is_empty!24421 () Bool)

(declare-datatypes ((V!37435 0))(
  ( (V!37436 (val!12261 Int)) )
))
(declare-datatypes ((ValueCell!11507 0))(
  ( (ValueCellFull!11507 (v!14834 V!37435)) (EmptyCell!11507) )
))
(declare-datatypes ((array!64955 0))(
  ( (array!64956 (arr!31273 (Array (_ BitVec 32) (_ BitVec 64))) (size!31791 (_ BitVec 32))) )
))
(declare-datatypes ((array!64957 0))(
  ( (array!64958 (arr!31274 (Array (_ BitVec 32) ValueCell!11507)) (size!31792 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5608 0))(
  ( (LongMapFixedSize!5609 (defaultEntry!6178 Int) (mask!30048 (_ BitVec 32)) (extraKeys!5910 (_ BitVec 32)) (zeroValue!6014 V!37435) (minValue!6014 V!37435) (_size!2859 (_ BitVec 32)) (_keys!11389 array!64955) (_values!6201 array!64957) (_vacant!2859 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5608)

(declare-fun e!583935 () Bool)

(declare-fun e!583938 () Bool)

(declare-fun array_inv!24213 (array!64955) Bool)

(declare-fun array_inv!24214 (array!64957) Bool)

(assert (=> b!1033453 (= e!583938 (and tp!73174 tp_is_empty!24421 (array_inv!24213 (_keys!11389 thiss!1427)) (array_inv!24214 (_values!6201 thiss!1427)) e!583935))))

(declare-fun b!1033454 () Bool)

(declare-fun e!583936 () Bool)

(assert (=> b!1033454 (= e!583936 false)))

(declare-datatypes ((SeekEntryResult!9678 0))(
  ( (MissingZero!9678 (index!41083 (_ BitVec 32))) (Found!9678 (index!41084 (_ BitVec 32))) (Intermediate!9678 (undefined!10490 Bool) (index!41085 (_ BitVec 32)) (x!91932 (_ BitVec 32))) (Undefined!9678) (MissingVacant!9678 (index!41086 (_ BitVec 32))) )
))
(declare-fun lt!456511 () SeekEntryResult!9678)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64955 (_ BitVec 32)) SeekEntryResult!9678)

(assert (=> b!1033454 (= lt!456511 (seekEntry!0 key!909 (_keys!11389 thiss!1427) (mask!30048 thiss!1427)))))

(declare-fun res!690442 () Bool)

(assert (=> start!90328 (=> (not res!690442) (not e!583936))))

(declare-fun valid!2127 (LongMapFixedSize!5608) Bool)

(assert (=> start!90328 (= res!690442 (valid!2127 thiss!1427))))

(assert (=> start!90328 e!583936))

(assert (=> start!90328 e!583938))

(assert (=> start!90328 true))

(declare-fun b!1033455 () Bool)

(declare-fun e!583934 () Bool)

(assert (=> b!1033455 (= e!583934 tp_is_empty!24421)))

(declare-fun mapNonEmpty!38085 () Bool)

(declare-fun mapRes!38085 () Bool)

(declare-fun tp!73173 () Bool)

(declare-fun e!583933 () Bool)

(assert (=> mapNonEmpty!38085 (= mapRes!38085 (and tp!73173 e!583933))))

(declare-fun mapKey!38085 () (_ BitVec 32))

(declare-fun mapRest!38085 () (Array (_ BitVec 32) ValueCell!11507))

(declare-fun mapValue!38085 () ValueCell!11507)

(assert (=> mapNonEmpty!38085 (= (arr!31274 (_values!6201 thiss!1427)) (store mapRest!38085 mapKey!38085 mapValue!38085))))

(declare-fun mapIsEmpty!38085 () Bool)

(assert (=> mapIsEmpty!38085 mapRes!38085))

(declare-fun b!1033456 () Bool)

(declare-fun res!690443 () Bool)

(assert (=> b!1033456 (=> (not res!690443) (not e!583936))))

(assert (=> b!1033456 (= res!690443 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1033457 () Bool)

(assert (=> b!1033457 (= e!583933 tp_is_empty!24421)))

(declare-fun b!1033458 () Bool)

(assert (=> b!1033458 (= e!583935 (and e!583934 mapRes!38085))))

(declare-fun condMapEmpty!38085 () Bool)

(declare-fun mapDefault!38085 () ValueCell!11507)

(assert (=> b!1033458 (= condMapEmpty!38085 (= (arr!31274 (_values!6201 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11507)) mapDefault!38085)))))

(assert (= (and start!90328 res!690442) b!1033456))

(assert (= (and b!1033456 res!690443) b!1033454))

(assert (= (and b!1033458 condMapEmpty!38085) mapIsEmpty!38085))

(assert (= (and b!1033458 (not condMapEmpty!38085)) mapNonEmpty!38085))

(get-info :version)

(assert (= (and mapNonEmpty!38085 ((_ is ValueCellFull!11507) mapValue!38085)) b!1033457))

(assert (= (and b!1033458 ((_ is ValueCellFull!11507) mapDefault!38085)) b!1033455))

(assert (= b!1033453 b!1033458))

(assert (= start!90328 b!1033453))

(declare-fun m!954221 () Bool)

(assert (=> b!1033453 m!954221))

(declare-fun m!954223 () Bool)

(assert (=> b!1033453 m!954223))

(declare-fun m!954225 () Bool)

(assert (=> b!1033454 m!954225))

(declare-fun m!954227 () Bool)

(assert (=> start!90328 m!954227))

(declare-fun m!954229 () Bool)

(assert (=> mapNonEmpty!38085 m!954229))

(check-sat (not start!90328) (not b!1033454) (not b_next!20701) tp_is_empty!24421 (not b!1033453) b_and!33179 (not mapNonEmpty!38085))
(check-sat b_and!33179 (not b_next!20701))
