; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15962 () Bool)

(assert start!15962)

(declare-fun b!158586 () Bool)

(declare-fun b_free!3487 () Bool)

(declare-fun b_next!3487 () Bool)

(assert (=> b!158586 (= b_free!3487 (not b_next!3487))))

(declare-fun tp!13017 () Bool)

(declare-fun b_and!9901 () Bool)

(assert (=> b!158586 (= tp!13017 b_and!9901)))

(declare-fun b!158579 () Bool)

(declare-fun e!103850 () Bool)

(declare-fun tp_is_empty!3289 () Bool)

(assert (=> b!158579 (= e!103850 tp_is_empty!3289)))

(declare-fun b!158580 () Bool)

(declare-fun res!74885 () Bool)

(declare-fun e!103852 () Bool)

(assert (=> b!158580 (=> (not res!74885) (not e!103852))))

(declare-datatypes ((V!4033 0))(
  ( (V!4034 (val!1689 Int)) )
))
(declare-datatypes ((ValueCell!1301 0))(
  ( (ValueCellFull!1301 (v!3554 V!4033)) (EmptyCell!1301) )
))
(declare-datatypes ((array!5649 0))(
  ( (array!5650 (arr!2673 (Array (_ BitVec 32) (_ BitVec 64))) (size!2956 (_ BitVec 32))) )
))
(declare-datatypes ((array!5651 0))(
  ( (array!5652 (arr!2674 (Array (_ BitVec 32) ValueCell!1301)) (size!2957 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1510 0))(
  ( (LongMapFixedSize!1511 (defaultEntry!3197 Int) (mask!7720 (_ BitVec 32)) (extraKeys!2938 (_ BitVec 32)) (zeroValue!3040 V!4033) (minValue!3040 V!4033) (_size!804 (_ BitVec 32)) (_keys!4988 array!5649) (_values!3180 array!5651) (_vacant!804 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1510)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158580 (= res!74885 (validMask!0 (mask!7720 thiss!1248)))))

(declare-fun mapNonEmpty!5608 () Bool)

(declare-fun mapRes!5608 () Bool)

(declare-fun tp!13018 () Bool)

(declare-fun e!103854 () Bool)

(assert (=> mapNonEmpty!5608 (= mapRes!5608 (and tp!13018 e!103854))))

(declare-fun mapRest!5608 () (Array (_ BitVec 32) ValueCell!1301))

(declare-fun mapValue!5608 () ValueCell!1301)

(declare-fun mapKey!5608 () (_ BitVec 32))

(assert (=> mapNonEmpty!5608 (= (arr!2674 (_values!3180 thiss!1248)) (store mapRest!5608 mapKey!5608 mapValue!5608))))

(declare-fun b!158581 () Bool)

(declare-fun res!74886 () Bool)

(assert (=> b!158581 (=> (not res!74886) (not e!103852))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158581 (= res!74886 (not (= key!828 (bvneg key!828))))))

(declare-fun b!158582 () Bool)

(declare-fun res!74887 () Bool)

(assert (=> b!158582 (=> (not res!74887) (not e!103852))))

(declare-datatypes ((SeekEntryResult!297 0))(
  ( (MissingZero!297 (index!3356 (_ BitVec 32))) (Found!297 (index!3357 (_ BitVec 32))) (Intermediate!297 (undefined!1109 Bool) (index!3358 (_ BitVec 32)) (x!17504 (_ BitVec 32))) (Undefined!297) (MissingVacant!297 (index!3359 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5649 (_ BitVec 32)) SeekEntryResult!297)

(assert (=> b!158582 (= res!74887 (is-Undefined!297 (seekEntryOrOpen!0 key!828 (_keys!4988 thiss!1248) (mask!7720 thiss!1248))))))

(declare-fun b!158583 () Bool)

(assert (=> b!158583 (= e!103854 tp_is_empty!3289)))

(declare-fun mapIsEmpty!5608 () Bool)

(assert (=> mapIsEmpty!5608 mapRes!5608))

(declare-fun b!158584 () Bool)

(assert (=> b!158584 (= e!103852 (and (= (size!2957 (_values!3180 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7720 thiss!1248))) (= (size!2956 (_keys!4988 thiss!1248)) (size!2957 (_values!3180 thiss!1248))) (bvsge (mask!7720 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2938 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!2938 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!74884 () Bool)

(assert (=> start!15962 (=> (not res!74884) (not e!103852))))

(declare-fun valid!711 (LongMapFixedSize!1510) Bool)

(assert (=> start!15962 (= res!74884 (valid!711 thiss!1248))))

(assert (=> start!15962 e!103852))

(declare-fun e!103855 () Bool)

(assert (=> start!15962 e!103855))

(assert (=> start!15962 true))

(declare-fun b!158585 () Bool)

(declare-fun e!103853 () Bool)

(assert (=> b!158585 (= e!103853 (and e!103850 mapRes!5608))))

(declare-fun condMapEmpty!5608 () Bool)

(declare-fun mapDefault!5608 () ValueCell!1301)

