; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90092 () Bool)

(assert start!90092)

(declare-fun b!1031988 () Bool)

(declare-fun b_free!20701 () Bool)

(declare-fun b_next!20701 () Bool)

(assert (=> b!1031988 (= b_free!20701 (not b_next!20701))))

(declare-fun tp!73174 () Bool)

(declare-fun b_and!33143 () Bool)

(assert (=> b!1031988 (= tp!73174 b_and!33143)))

(declare-fun b!1031987 () Bool)

(declare-fun e!583001 () Bool)

(assert (=> b!1031987 (= e!583001 false)))

(declare-datatypes ((SeekEntryResult!9713 0))(
  ( (MissingZero!9713 (index!41223 (_ BitVec 32))) (Found!9713 (index!41224 (_ BitVec 32))) (Intermediate!9713 (undefined!10525 Bool) (index!41225 (_ BitVec 32)) (x!91942 (_ BitVec 32))) (Undefined!9713) (MissingVacant!9713 (index!41226 (_ BitVec 32))) )
))
(declare-fun lt!455796 () SeekEntryResult!9713)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37435 0))(
  ( (V!37436 (val!12261 Int)) )
))
(declare-datatypes ((ValueCell!11507 0))(
  ( (ValueCellFull!11507 (v!14837 V!37435)) (EmptyCell!11507) )
))
(declare-datatypes ((array!64845 0))(
  ( (array!64846 (arr!31224 (Array (_ BitVec 32) (_ BitVec 64))) (size!31743 (_ BitVec 32))) )
))
(declare-datatypes ((array!64847 0))(
  ( (array!64848 (arr!31225 (Array (_ BitVec 32) ValueCell!11507)) (size!31744 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5608 0))(
  ( (LongMapFixedSize!5609 (defaultEntry!6178 Int) (mask!29983 (_ BitVec 32)) (extraKeys!5910 (_ BitVec 32)) (zeroValue!6014 V!37435) (minValue!6014 V!37435) (_size!2859 (_ BitVec 32)) (_keys!11347 array!64845) (_values!6201 array!64847) (_vacant!2859 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5608)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64845 (_ BitVec 32)) SeekEntryResult!9713)

(assert (=> b!1031987 (= lt!455796 (seekEntry!0 key!909 (_keys!11347 thiss!1427) (mask!29983 thiss!1427)))))

(declare-fun mapNonEmpty!38085 () Bool)

(declare-fun mapRes!38085 () Bool)

(declare-fun tp!73173 () Bool)

(declare-fun e!582999 () Bool)

(assert (=> mapNonEmpty!38085 (= mapRes!38085 (and tp!73173 e!582999))))

(declare-fun mapRest!38085 () (Array (_ BitVec 32) ValueCell!11507))

(declare-fun mapValue!38085 () ValueCell!11507)

(declare-fun mapKey!38085 () (_ BitVec 32))

(assert (=> mapNonEmpty!38085 (= (arr!31225 (_values!6201 thiss!1427)) (store mapRest!38085 mapKey!38085 mapValue!38085))))

(declare-fun tp_is_empty!24421 () Bool)

(declare-fun e!583003 () Bool)

(declare-fun e!583000 () Bool)

(declare-fun array_inv!24163 (array!64845) Bool)

(declare-fun array_inv!24164 (array!64847) Bool)

(assert (=> b!1031988 (= e!583000 (and tp!73174 tp_is_empty!24421 (array_inv!24163 (_keys!11347 thiss!1427)) (array_inv!24164 (_values!6201 thiss!1427)) e!583003))))

(declare-fun b!1031989 () Bool)

(declare-fun e!583002 () Bool)

(assert (=> b!1031989 (= e!583002 tp_is_empty!24421)))

(declare-fun b!1031990 () Bool)

(assert (=> b!1031990 (= e!582999 tp_is_empty!24421)))

(declare-fun b!1031991 () Bool)

(assert (=> b!1031991 (= e!583003 (and e!583002 mapRes!38085))))

(declare-fun condMapEmpty!38085 () Bool)

(declare-fun mapDefault!38085 () ValueCell!11507)

(assert (=> b!1031991 (= condMapEmpty!38085 (= (arr!31225 (_values!6201 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11507)) mapDefault!38085)))))

(declare-fun b!1031992 () Bool)

(declare-fun res!689866 () Bool)

(assert (=> b!1031992 (=> (not res!689866) (not e!583001))))

(assert (=> b!1031992 (= res!689866 (not (= key!909 (bvneg key!909))))))

(declare-fun res!689865 () Bool)

(assert (=> start!90092 (=> (not res!689865) (not e!583001))))

(declare-fun valid!2112 (LongMapFixedSize!5608) Bool)

(assert (=> start!90092 (= res!689865 (valid!2112 thiss!1427))))

(assert (=> start!90092 e!583001))

(assert (=> start!90092 e!583000))

(assert (=> start!90092 true))

(declare-fun mapIsEmpty!38085 () Bool)

(assert (=> mapIsEmpty!38085 mapRes!38085))

(assert (= (and start!90092 res!689865) b!1031992))

(assert (= (and b!1031992 res!689866) b!1031987))

(assert (= (and b!1031991 condMapEmpty!38085) mapIsEmpty!38085))

(assert (= (and b!1031991 (not condMapEmpty!38085)) mapNonEmpty!38085))

(get-info :version)

(assert (= (and mapNonEmpty!38085 ((_ is ValueCellFull!11507) mapValue!38085)) b!1031990))

(assert (= (and b!1031991 ((_ is ValueCellFull!11507) mapDefault!38085)) b!1031989))

(assert (= b!1031988 b!1031991))

(assert (= start!90092 b!1031988))

(declare-fun m!951937 () Bool)

(assert (=> b!1031987 m!951937))

(declare-fun m!951939 () Bool)

(assert (=> mapNonEmpty!38085 m!951939))

(declare-fun m!951941 () Bool)

(assert (=> b!1031988 m!951941))

(declare-fun m!951943 () Bool)

(assert (=> b!1031988 m!951943))

(declare-fun m!951945 () Bool)

(assert (=> start!90092 m!951945))

(check-sat (not start!90092) (not b!1031988) (not b!1031987) b_and!33143 tp_is_empty!24421 (not mapNonEmpty!38085) (not b_next!20701))
(check-sat b_and!33143 (not b_next!20701))
