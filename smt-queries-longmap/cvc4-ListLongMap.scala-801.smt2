; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19258 () Bool)

(assert start!19258)

(declare-fun b!189499 () Bool)

(declare-fun b_free!4649 () Bool)

(declare-fun b_next!4649 () Bool)

(assert (=> b!189499 (= b_free!4649 (not b_next!4649))))

(declare-fun tp!16779 () Bool)

(declare-fun b_and!11287 () Bool)

(assert (=> b!189499 (= tp!16779 b_and!11287)))

(declare-fun b!189497 () Bool)

(declare-fun e!124695 () Bool)

(declare-fun tp_is_empty!4421 () Bool)

(assert (=> b!189497 (= e!124695 tp_is_empty!4421)))

(declare-fun mapIsEmpty!7627 () Bool)

(declare-fun mapRes!7627 () Bool)

(assert (=> mapIsEmpty!7627 mapRes!7627))

(declare-fun b!189498 () Bool)

(declare-datatypes ((Unit!5717 0))(
  ( (Unit!5718) )
))
(declare-fun e!124697 () Unit!5717)

(declare-fun lt!93770 () Unit!5717)

(assert (=> b!189498 (= e!124697 lt!93770)))

(declare-datatypes ((V!5541 0))(
  ( (V!5542 (val!2255 Int)) )
))
(declare-datatypes ((ValueCell!1867 0))(
  ( (ValueCellFull!1867 (v!4176 V!5541)) (EmptyCell!1867) )
))
(declare-datatypes ((array!8071 0))(
  ( (array!8072 (arr!3805 (Array (_ BitVec 32) (_ BitVec 64))) (size!4125 (_ BitVec 32))) )
))
(declare-datatypes ((array!8073 0))(
  ( (array!8074 (arr!3806 (Array (_ BitVec 32) ValueCell!1867)) (size!4126 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2642 0))(
  ( (LongMapFixedSize!2643 (defaultEntry!3865 Int) (mask!9052 (_ BitVec 32)) (extraKeys!3602 (_ BitVec 32)) (zeroValue!3706 V!5541) (minValue!3706 V!5541) (_size!1370 (_ BitVec 32)) (_keys!5832 array!8071) (_values!3848 array!8073) (_vacant!1370 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2642)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!164 (array!8071 array!8073 (_ BitVec 32) (_ BitVec 32) V!5541 V!5541 (_ BitVec 64) Int) Unit!5717)

(assert (=> b!189498 (= lt!93770 (lemmaInListMapThenSeekEntryOrOpenFindsIt!164 (_keys!5832 thiss!1248) (_values!3848 thiss!1248) (mask!9052 thiss!1248) (extraKeys!3602 thiss!1248) (zeroValue!3706 thiss!1248) (minValue!3706 thiss!1248) key!828 (defaultEntry!3865 thiss!1248)))))

(declare-fun res!89619 () Bool)

(declare-datatypes ((SeekEntryResult!664 0))(
  ( (MissingZero!664 (index!4826 (_ BitVec 32))) (Found!664 (index!4827 (_ BitVec 32))) (Intermediate!664 (undefined!1476 Bool) (index!4828 (_ BitVec 32)) (x!20422 (_ BitVec 32))) (Undefined!664) (MissingVacant!664 (index!4829 (_ BitVec 32))) )
))
(declare-fun lt!93772 () SeekEntryResult!664)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189498 (= res!89619 (inRange!0 (index!4827 lt!93772) (mask!9052 thiss!1248)))))

(declare-fun e!124694 () Bool)

(assert (=> b!189498 (=> (not res!89619) (not e!124694))))

(assert (=> b!189498 e!124694))

(declare-fun e!124698 () Bool)

(declare-fun e!124696 () Bool)

(declare-fun array_inv!2467 (array!8071) Bool)

(declare-fun array_inv!2468 (array!8073) Bool)

(assert (=> b!189499 (= e!124696 (and tp!16779 tp_is_empty!4421 (array_inv!2467 (_keys!5832 thiss!1248)) (array_inv!2468 (_values!3848 thiss!1248)) e!124698))))

(declare-fun b!189500 () Bool)

(declare-fun res!89613 () Bool)

(declare-fun e!124692 () Bool)

(assert (=> b!189500 (=> (not res!89613) (not e!124692))))

(assert (=> b!189500 (= res!89613 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189502 () Bool)

(declare-fun e!124693 () Bool)

(assert (=> b!189502 (= e!124698 (and e!124693 mapRes!7627))))

(declare-fun condMapEmpty!7627 () Bool)

(declare-fun mapDefault!7627 () ValueCell!1867)

