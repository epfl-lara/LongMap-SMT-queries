; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15920 () Bool)

(assert start!15920)

(declare-fun b!158318 () Bool)

(declare-fun b_free!3479 () Bool)

(declare-fun b_next!3479 () Bool)

(assert (=> b!158318 (= b_free!3479 (not b_next!3479))))

(declare-fun tp!12986 () Bool)

(declare-fun b_and!9893 () Bool)

(assert (=> b!158318 (= tp!12986 b_and!9893)))

(declare-fun b!158315 () Bool)

(declare-fun res!74781 () Bool)

(declare-fun e!103689 () Bool)

(assert (=> b!158315 (=> (not res!74781) (not e!103689))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4021 0))(
  ( (V!4022 (val!1685 Int)) )
))
(declare-datatypes ((ValueCell!1297 0))(
  ( (ValueCellFull!1297 (v!3550 V!4021)) (EmptyCell!1297) )
))
(declare-datatypes ((array!5629 0))(
  ( (array!5630 (arr!2665 (Array (_ BitVec 32) (_ BitVec 64))) (size!2947 (_ BitVec 32))) )
))
(declare-datatypes ((array!5631 0))(
  ( (array!5632 (arr!2666 (Array (_ BitVec 32) ValueCell!1297)) (size!2948 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1502 0))(
  ( (LongMapFixedSize!1503 (defaultEntry!3193 Int) (mask!7704 (_ BitVec 32)) (extraKeys!2934 (_ BitVec 32)) (zeroValue!3036 V!4021) (minValue!3036 V!4021) (_size!800 (_ BitVec 32)) (_keys!4979 array!5629) (_values!3176 array!5631) (_vacant!800 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1502)

(declare-datatypes ((SeekEntryResult!294 0))(
  ( (MissingZero!294 (index!3344 (_ BitVec 32))) (Found!294 (index!3345 (_ BitVec 32))) (Intermediate!294 (undefined!1106 Bool) (index!3346 (_ BitVec 32)) (x!17460 (_ BitVec 32))) (Undefined!294) (MissingVacant!294 (index!3347 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5629 (_ BitVec 32)) SeekEntryResult!294)

(assert (=> b!158315 (= res!74781 (is-Undefined!294 (seekEntryOrOpen!0 key!828 (_keys!4979 thiss!1248) (mask!7704 thiss!1248))))))

(declare-fun b!158316 () Bool)

(assert (=> b!158316 (= e!103689 (and (= (size!2948 (_values!3176 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7704 thiss!1248))) (= (size!2947 (_keys!4979 thiss!1248)) (size!2948 (_values!3176 thiss!1248))) (bvslt (mask!7704 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun res!74782 () Bool)

(assert (=> start!15920 (=> (not res!74782) (not e!103689))))

(declare-fun valid!707 (LongMapFixedSize!1502) Bool)

(assert (=> start!15920 (= res!74782 (valid!707 thiss!1248))))

(assert (=> start!15920 e!103689))

(declare-fun e!103687 () Bool)

(assert (=> start!15920 e!103687))

(assert (=> start!15920 true))

(declare-fun b!158317 () Bool)

(declare-fun res!74784 () Bool)

(assert (=> b!158317 (=> (not res!74784) (not e!103689))))

(assert (=> b!158317 (= res!74784 (not (= key!828 (bvneg key!828))))))

(declare-fun e!103690 () Bool)

(declare-fun tp_is_empty!3281 () Bool)

(declare-fun array_inv!1695 (array!5629) Bool)

(declare-fun array_inv!1696 (array!5631) Bool)

(assert (=> b!158318 (= e!103687 (and tp!12986 tp_is_empty!3281 (array_inv!1695 (_keys!4979 thiss!1248)) (array_inv!1696 (_values!3176 thiss!1248)) e!103690))))

(declare-fun b!158319 () Bool)

(declare-fun e!103691 () Bool)

(assert (=> b!158319 (= e!103691 tp_is_empty!3281)))

(declare-fun b!158320 () Bool)

(declare-fun res!74783 () Bool)

(assert (=> b!158320 (=> (not res!74783) (not e!103689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158320 (= res!74783 (validMask!0 (mask!7704 thiss!1248)))))

(declare-fun mapIsEmpty!5589 () Bool)

(declare-fun mapRes!5589 () Bool)

(assert (=> mapIsEmpty!5589 mapRes!5589))

(declare-fun b!158321 () Bool)

(assert (=> b!158321 (= e!103690 (and e!103691 mapRes!5589))))

(declare-fun condMapEmpty!5589 () Bool)

(declare-fun mapDefault!5589 () ValueCell!1297)

