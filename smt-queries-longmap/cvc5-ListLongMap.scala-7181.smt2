; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91932 () Bool)

(assert start!91932)

(declare-fun b!1045539 () Bool)

(declare-fun b_free!21139 () Bool)

(declare-fun b_next!21139 () Bool)

(assert (=> b!1045539 (= b_free!21139 (not b_next!21139))))

(declare-fun tp!74676 () Bool)

(declare-fun b_and!33765 () Bool)

(assert (=> b!1045539 (= tp!74676 b_and!33765)))

(declare-fun mapNonEmpty!38930 () Bool)

(declare-fun mapRes!38930 () Bool)

(declare-fun tp!74675 () Bool)

(declare-fun e!592675 () Bool)

(assert (=> mapNonEmpty!38930 (= mapRes!38930 (and tp!74675 e!592675))))

(declare-datatypes ((V!38019 0))(
  ( (V!38020 (val!12480 Int)) )
))
(declare-datatypes ((ValueCell!11726 0))(
  ( (ValueCellFull!11726 (v!15076 V!38019)) (EmptyCell!11726) )
))
(declare-fun mapRest!38930 () (Array (_ BitVec 32) ValueCell!11726))

(declare-fun mapValue!38930 () ValueCell!11726)

(declare-fun mapKey!38930 () (_ BitVec 32))

(declare-datatypes ((array!65894 0))(
  ( (array!65895 (arr!31693 (Array (_ BitVec 32) (_ BitVec 64))) (size!32228 (_ BitVec 32))) )
))
(declare-datatypes ((array!65896 0))(
  ( (array!65897 (arr!31694 (Array (_ BitVec 32) ValueCell!11726)) (size!32229 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6046 0))(
  ( (LongMapFixedSize!6047 (defaultEntry!6419 Int) (mask!30550 (_ BitVec 32)) (extraKeys!6147 (_ BitVec 32)) (zeroValue!6253 V!38019) (minValue!6253 V!38019) (_size!3078 (_ BitVec 32)) (_keys!11691 array!65894) (_values!6442 array!65896) (_vacant!3078 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6046)

(assert (=> mapNonEmpty!38930 (= (arr!31694 (_values!6442 thiss!1427)) (store mapRest!38930 mapKey!38930 mapValue!38930))))

(declare-fun e!592673 () Bool)

(declare-fun e!592674 () Bool)

(declare-fun tp_is_empty!24859 () Bool)

(declare-fun array_inv!24481 (array!65894) Bool)

(declare-fun array_inv!24482 (array!65896) Bool)

(assert (=> b!1045539 (= e!592674 (and tp!74676 tp_is_empty!24859 (array_inv!24481 (_keys!11691 thiss!1427)) (array_inv!24482 (_values!6442 thiss!1427)) e!592673))))

(declare-fun b!1045540 () Bool)

(declare-fun e!592678 () Bool)

(declare-fun e!592676 () Bool)

(assert (=> b!1045540 (= e!592678 e!592676)))

(declare-fun res!696152 () Bool)

(assert (=> b!1045540 (=> (not res!696152) (not e!592676))))

(declare-datatypes ((SeekEntryResult!9848 0))(
  ( (MissingZero!9848 (index!41763 (_ BitVec 32))) (Found!9848 (index!41764 (_ BitVec 32))) (Intermediate!9848 (undefined!10660 Bool) (index!41765 (_ BitVec 32)) (x!93390 (_ BitVec 32))) (Undefined!9848) (MissingVacant!9848 (index!41766 (_ BitVec 32))) )
))
(declare-fun lt!461594 () SeekEntryResult!9848)

(assert (=> b!1045540 (= res!696152 (is-Found!9848 lt!461594))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65894 (_ BitVec 32)) SeekEntryResult!9848)

(assert (=> b!1045540 (= lt!461594 (seekEntry!0 key!909 (_keys!11691 thiss!1427) (mask!30550 thiss!1427)))))

(declare-fun b!1045541 () Bool)

(declare-fun res!696151 () Bool)

(declare-fun e!592677 () Bool)

(assert (=> b!1045541 (=> res!696151 e!592677)))

(declare-datatypes ((Unit!34151 0))(
  ( (Unit!34152) )
))
(declare-datatypes ((tuple2!15792 0))(
  ( (tuple2!15793 (_1!7907 Unit!34151) (_2!7907 LongMapFixedSize!6046)) )
))
(declare-fun lt!461598 () tuple2!15792)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1045541 (= res!696151 (not (validMask!0 (mask!30550 (_2!7907 lt!461598)))))))

(declare-fun res!696153 () Bool)

(assert (=> start!91932 (=> (not res!696153) (not e!592678))))

(declare-fun valid!2268 (LongMapFixedSize!6046) Bool)

(assert (=> start!91932 (= res!696153 (valid!2268 thiss!1427))))

(assert (=> start!91932 e!592678))

(assert (=> start!91932 e!592674))

(assert (=> start!91932 true))

(declare-fun b!1045542 () Bool)

(declare-fun e!592679 () Bool)

(assert (=> b!1045542 (= e!592679 tp_is_empty!24859)))

(declare-fun b!1045543 () Bool)

(declare-fun res!696150 () Bool)

(assert (=> b!1045543 (=> (not res!696150) (not e!592678))))

(assert (=> b!1045543 (= res!696150 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1045544 () Bool)

(assert (=> b!1045544 (= e!592675 tp_is_empty!24859)))

(declare-fun b!1045545 () Bool)

(assert (=> b!1045545 (= e!592677 (or (not (= (size!32229 (_values!6442 (_2!7907 lt!461598))) (bvadd #b00000000000000000000000000000001 (mask!30550 (_2!7907 lt!461598))))) (not (= (size!32228 (_keys!11691 (_2!7907 lt!461598))) (size!32229 (_values!6442 (_2!7907 lt!461598))))) (bvslt (mask!30550 (_2!7907 lt!461598)) #b00000000000000000000000000000000) (bvslt (extraKeys!6147 (_2!7907 lt!461598)) #b00000000000000000000000000000000) (bvsle (extraKeys!6147 (_2!7907 lt!461598)) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!38930 () Bool)

(assert (=> mapIsEmpty!38930 mapRes!38930))

(declare-fun b!1045546 () Bool)

(assert (=> b!1045546 (= e!592673 (and e!592679 mapRes!38930))))

(declare-fun condMapEmpty!38930 () Bool)

(declare-fun mapDefault!38930 () ValueCell!11726)

