; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16068 () Bool)

(assert start!16068)

(declare-fun b!159535 () Bool)

(declare-fun b_free!3529 () Bool)

(declare-fun b_next!3529 () Bool)

(assert (=> b!159535 (= b_free!3529 (not b_next!3529))))

(declare-fun tp!13156 () Bool)

(declare-fun b_and!9943 () Bool)

(assert (=> b!159535 (= tp!13156 b_and!9943)))

(declare-fun b!159528 () Bool)

(declare-fun e!104409 () Bool)

(declare-fun tp_is_empty!3331 () Bool)

(assert (=> b!159528 (= e!104409 tp_is_empty!3331)))

(declare-fun mapNonEmpty!5684 () Bool)

(declare-fun mapRes!5684 () Bool)

(declare-fun tp!13157 () Bool)

(declare-fun e!104411 () Bool)

(assert (=> mapNonEmpty!5684 (= mapRes!5684 (and tp!13157 e!104411))))

(declare-fun mapKey!5684 () (_ BitVec 32))

(declare-datatypes ((V!4089 0))(
  ( (V!4090 (val!1710 Int)) )
))
(declare-datatypes ((ValueCell!1322 0))(
  ( (ValueCellFull!1322 (v!3575 V!4089)) (EmptyCell!1322) )
))
(declare-fun mapValue!5684 () ValueCell!1322)

(declare-fun mapRest!5684 () (Array (_ BitVec 32) ValueCell!1322))

(declare-datatypes ((array!5741 0))(
  ( (array!5742 (arr!2715 (Array (_ BitVec 32) (_ BitVec 64))) (size!2999 (_ BitVec 32))) )
))
(declare-datatypes ((array!5743 0))(
  ( (array!5744 (arr!2716 (Array (_ BitVec 32) ValueCell!1322)) (size!3000 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1552 0))(
  ( (LongMapFixedSize!1553 (defaultEntry!3218 Int) (mask!7770 (_ BitVec 32)) (extraKeys!2959 (_ BitVec 32)) (zeroValue!3061 V!4089) (minValue!3061 V!4089) (_size!825 (_ BitVec 32)) (_keys!5019 array!5741) (_values!3201 array!5743) (_vacant!825 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1552)

(assert (=> mapNonEmpty!5684 (= (arr!2716 (_values!3201 thiss!1248)) (store mapRest!5684 mapKey!5684 mapValue!5684))))

(declare-fun b!159529 () Bool)

(declare-fun e!104410 () Bool)

(assert (=> b!159529 (= e!104410 (and e!104409 mapRes!5684))))

(declare-fun condMapEmpty!5684 () Bool)

(declare-fun mapDefault!5684 () ValueCell!1322)

