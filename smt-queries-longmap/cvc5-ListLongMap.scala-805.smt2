; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19396 () Bool)

(assert start!19396)

(declare-fun b!190649 () Bool)

(declare-fun b_free!4669 () Bool)

(declare-fun b_next!4669 () Bool)

(assert (=> b!190649 (= b_free!4669 (not b_next!4669))))

(declare-fun tp!16850 () Bool)

(declare-fun b_and!11327 () Bool)

(assert (=> b!190649 (= tp!16850 b_and!11327)))

(declare-fun b!190645 () Bool)

(declare-datatypes ((Unit!5761 0))(
  ( (Unit!5762) )
))
(declare-fun e!125464 () Unit!5761)

(declare-fun Unit!5763 () Unit!5761)

(assert (=> b!190645 (= e!125464 Unit!5763)))

(declare-fun lt!94535 () Unit!5761)

(declare-datatypes ((V!5569 0))(
  ( (V!5570 (val!2265 Int)) )
))
(declare-datatypes ((ValueCell!1877 0))(
  ( (ValueCellFull!1877 (v!4197 V!5569)) (EmptyCell!1877) )
))
(declare-datatypes ((array!8117 0))(
  ( (array!8118 (arr!3825 (Array (_ BitVec 32) (_ BitVec 64))) (size!4146 (_ BitVec 32))) )
))
(declare-datatypes ((array!8119 0))(
  ( (array!8120 (arr!3826 (Array (_ BitVec 32) ValueCell!1877)) (size!4147 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2662 0))(
  ( (LongMapFixedSize!2663 (defaultEntry!3891 Int) (mask!9098 (_ BitVec 32)) (extraKeys!3628 (_ BitVec 32)) (zeroValue!3732 V!5569) (minValue!3732 V!5569) (_size!1380 (_ BitVec 32)) (_keys!5864 array!8117) (_values!3874 array!8119) (_vacant!1380 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2662)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!176 (array!8117 array!8119 (_ BitVec 32) (_ BitVec 32) V!5569 V!5569 (_ BitVec 64) Int) Unit!5761)

(assert (=> b!190645 (= lt!94535 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!176 (_keys!5864 thiss!1248) (_values!3874 thiss!1248) (mask!9098 thiss!1248) (extraKeys!3628 thiss!1248) (zeroValue!3732 thiss!1248) (minValue!3732 thiss!1248) key!828 (defaultEntry!3891 thiss!1248)))))

(assert (=> b!190645 false))

(declare-fun b!190646 () Bool)

(declare-fun e!125460 () Bool)

(declare-fun tp_is_empty!4441 () Bool)

(assert (=> b!190646 (= e!125460 tp_is_empty!4441)))

(declare-fun b!190647 () Bool)

(declare-fun e!125459 () Bool)

(assert (=> b!190647 (= e!125459 tp_is_empty!4441)))

(declare-fun b!190648 () Bool)

(declare-fun res!90124 () Bool)

(declare-fun e!125458 () Bool)

(assert (=> b!190648 (=> (not res!90124) (not e!125458))))

(assert (=> b!190648 (= res!90124 (not (= key!828 (bvneg key!828))))))

(declare-fun e!125457 () Bool)

(declare-fun e!125462 () Bool)

(declare-fun array_inv!2481 (array!8117) Bool)

(declare-fun array_inv!2482 (array!8119) Bool)

(assert (=> b!190649 (= e!125457 (and tp!16850 tp_is_empty!4441 (array_inv!2481 (_keys!5864 thiss!1248)) (array_inv!2482 (_values!3874 thiss!1248)) e!125462))))

(declare-fun mapIsEmpty!7667 () Bool)

(declare-fun mapRes!7667 () Bool)

(assert (=> mapIsEmpty!7667 mapRes!7667))

(declare-fun res!90122 () Bool)

(assert (=> start!19396 (=> (not res!90122) (not e!125458))))

(declare-fun valid!1093 (LongMapFixedSize!2662) Bool)

(assert (=> start!19396 (= res!90122 (valid!1093 thiss!1248))))

(assert (=> start!19396 e!125458))

(assert (=> start!19396 e!125457))

(assert (=> start!19396 true))

(assert (=> start!19396 tp_is_empty!4441))

(declare-fun mapNonEmpty!7667 () Bool)

(declare-fun tp!16849 () Bool)

(assert (=> mapNonEmpty!7667 (= mapRes!7667 (and tp!16849 e!125460))))

(declare-fun mapRest!7667 () (Array (_ BitVec 32) ValueCell!1877))

(declare-fun mapValue!7667 () ValueCell!1877)

(declare-fun mapKey!7667 () (_ BitVec 32))

(assert (=> mapNonEmpty!7667 (= (arr!3826 (_values!3874 thiss!1248)) (store mapRest!7667 mapKey!7667 mapValue!7667))))

(declare-fun b!190650 () Bool)

(assert (=> b!190650 (= e!125462 (and e!125459 mapRes!7667))))

(declare-fun condMapEmpty!7667 () Bool)

(declare-fun mapDefault!7667 () ValueCell!1877)

