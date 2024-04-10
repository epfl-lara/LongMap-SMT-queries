; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16308 () Bool)

(assert start!16308)

(declare-fun b!162748 () Bool)

(declare-fun b_free!3769 () Bool)

(declare-fun b_next!3769 () Bool)

(assert (=> b!162748 (= b_free!3769 (not b_next!3769))))

(declare-fun tp!13876 () Bool)

(declare-fun b_and!10183 () Bool)

(assert (=> b!162748 (= tp!13876 b_and!10183)))

(declare-fun b!162742 () Bool)

(declare-fun res!77071 () Bool)

(declare-fun e!106741 () Bool)

(assert (=> b!162742 (=> (not res!77071) (not e!106741))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162742 (= res!77071 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162743 () Bool)

(declare-fun e!106742 () Bool)

(declare-datatypes ((V!4409 0))(
  ( (V!4410 (val!1830 Int)) )
))
(declare-datatypes ((ValueCell!1442 0))(
  ( (ValueCellFull!1442 (v!3695 V!4409)) (EmptyCell!1442) )
))
(declare-datatypes ((array!6221 0))(
  ( (array!6222 (arr!2955 (Array (_ BitVec 32) (_ BitVec 64))) (size!3239 (_ BitVec 32))) )
))
(declare-datatypes ((array!6223 0))(
  ( (array!6224 (arr!2956 (Array (_ BitVec 32) ValueCell!1442)) (size!3240 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1792 0))(
  ( (LongMapFixedSize!1793 (defaultEntry!3338 Int) (mask!7970 (_ BitVec 32)) (extraKeys!3079 (_ BitVec 32)) (zeroValue!3181 V!4409) (minValue!3181 V!4409) (_size!945 (_ BitVec 32)) (_keys!5139 array!6221) (_values!3321 array!6223) (_vacant!945 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1792)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!162743 (= e!106742 (not (validMask!0 (mask!7970 thiss!1248))))))

(declare-fun b!162744 () Bool)

(declare-fun e!106745 () Bool)

(declare-fun tp_is_empty!3571 () Bool)

(assert (=> b!162744 (= e!106745 tp_is_empty!3571)))

(declare-fun mapNonEmpty!6044 () Bool)

(declare-fun mapRes!6044 () Bool)

(declare-fun tp!13877 () Bool)

(assert (=> mapNonEmpty!6044 (= mapRes!6044 (and tp!13877 e!106745))))

(declare-fun mapValue!6044 () ValueCell!1442)

(declare-fun mapRest!6044 () (Array (_ BitVec 32) ValueCell!1442))

(declare-fun mapKey!6044 () (_ BitVec 32))

(assert (=> mapNonEmpty!6044 (= (arr!2956 (_values!3321 thiss!1248)) (store mapRest!6044 mapKey!6044 mapValue!6044))))

(declare-fun b!162745 () Bool)

(declare-fun e!106740 () Bool)

(assert (=> b!162745 (= e!106740 tp_is_empty!3571)))

(declare-fun b!162746 () Bool)

(declare-fun e!106746 () Bool)

(assert (=> b!162746 (= e!106746 (and e!106740 mapRes!6044))))

(declare-fun condMapEmpty!6044 () Bool)

(declare-fun mapDefault!6044 () ValueCell!1442)

