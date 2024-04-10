; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16324 () Bool)

(assert start!16324)

(declare-fun b!162846 () Bool)

(declare-fun b_free!3775 () Bool)

(declare-fun b_next!3775 () Bool)

(assert (=> b!162846 (= b_free!3775 (not b_next!3775))))

(declare-fun tp!13897 () Bool)

(declare-fun b_and!10189 () Bool)

(assert (=> b!162846 (= tp!13897 b_and!10189)))

(declare-fun b!162842 () Bool)

(declare-fun e!106827 () Bool)

(declare-fun tp_is_empty!3577 () Bool)

(assert (=> b!162842 (= e!106827 tp_is_empty!3577)))

(declare-fun b!162843 () Bool)

(declare-fun res!77111 () Bool)

(declare-fun e!106824 () Bool)

(assert (=> b!162843 (=> (not res!77111) (not e!106824))))

(declare-datatypes ((V!4417 0))(
  ( (V!4418 (val!1833 Int)) )
))
(declare-datatypes ((ValueCell!1445 0))(
  ( (ValueCellFull!1445 (v!3698 V!4417)) (EmptyCell!1445) )
))
(declare-datatypes ((array!6235 0))(
  ( (array!6236 (arr!2961 (Array (_ BitVec 32) (_ BitVec 64))) (size!3245 (_ BitVec 32))) )
))
(declare-datatypes ((array!6237 0))(
  ( (array!6238 (arr!2962 (Array (_ BitVec 32) ValueCell!1445)) (size!3246 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1798 0))(
  ( (LongMapFixedSize!1799 (defaultEntry!3341 Int) (mask!7977 (_ BitVec 32)) (extraKeys!3082 (_ BitVec 32)) (zeroValue!3184 V!4417) (minValue!3184 V!4417) (_size!948 (_ BitVec 32)) (_keys!5143 array!6235) (_values!3324 array!6237) (_vacant!948 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1798)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!162843 (= res!77111 (validMask!0 (mask!7977 thiss!1248)))))

(declare-fun res!77108 () Bool)

(declare-fun e!106823 () Bool)

(assert (=> start!16324 (=> (not res!77108) (not e!106823))))

(declare-fun valid!808 (LongMapFixedSize!1798) Bool)

(assert (=> start!16324 (= res!77108 (valid!808 thiss!1248))))

(assert (=> start!16324 e!106823))

(declare-fun e!106821 () Bool)

(assert (=> start!16324 e!106821))

(assert (=> start!16324 true))

(declare-fun b!162844 () Bool)

(assert (=> b!162844 (= e!106823 e!106824)))

(declare-fun res!77109 () Bool)

(assert (=> b!162844 (=> (not res!77109) (not e!106824))))

(declare-datatypes ((SeekEntryResult!392 0))(
  ( (MissingZero!392 (index!3736 (_ BitVec 32))) (Found!392 (index!3737 (_ BitVec 32))) (Intermediate!392 (undefined!1204 Bool) (index!3738 (_ BitVec 32)) (x!18032 (_ BitVec 32))) (Undefined!392) (MissingVacant!392 (index!3739 (_ BitVec 32))) )
))
(declare-fun lt!82555 () SeekEntryResult!392)

(assert (=> b!162844 (= res!77109 (and (not (is-Undefined!392 lt!82555)) (not (is-MissingVacant!392 lt!82555)) (not (is-MissingZero!392 lt!82555)) (is-Found!392 lt!82555)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6235 (_ BitVec 32)) SeekEntryResult!392)

(assert (=> b!162844 (= lt!82555 (seekEntryOrOpen!0 key!828 (_keys!5143 thiss!1248) (mask!7977 thiss!1248)))))

(declare-fun mapNonEmpty!6056 () Bool)

(declare-fun mapRes!6056 () Bool)

(declare-fun tp!13898 () Bool)

(assert (=> mapNonEmpty!6056 (= mapRes!6056 (and tp!13898 e!106827))))

(declare-fun mapValue!6056 () ValueCell!1445)

(declare-fun mapRest!6056 () (Array (_ BitVec 32) ValueCell!1445))

(declare-fun mapKey!6056 () (_ BitVec 32))

(assert (=> mapNonEmpty!6056 (= (arr!2962 (_values!3324 thiss!1248)) (store mapRest!6056 mapKey!6056 mapValue!6056))))

(declare-fun mapIsEmpty!6056 () Bool)

(assert (=> mapIsEmpty!6056 mapRes!6056))

(declare-fun b!162845 () Bool)

(declare-fun e!106822 () Bool)

(assert (=> b!162845 (= e!106822 tp_is_empty!3577)))

(declare-fun e!106825 () Bool)

(declare-fun array_inv!1891 (array!6235) Bool)

(declare-fun array_inv!1892 (array!6237) Bool)

(assert (=> b!162846 (= e!106821 (and tp!13897 tp_is_empty!3577 (array_inv!1891 (_keys!5143 thiss!1248)) (array_inv!1892 (_values!3324 thiss!1248)) e!106825))))

(declare-fun b!162847 () Bool)

(assert (=> b!162847 (= e!106825 (and e!106822 mapRes!6056))))

(declare-fun condMapEmpty!6056 () Bool)

(declare-fun mapDefault!6056 () ValueCell!1445)

