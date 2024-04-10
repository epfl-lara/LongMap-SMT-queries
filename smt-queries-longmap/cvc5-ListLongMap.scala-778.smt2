; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18430 () Bool)

(assert start!18430)

(declare-fun b!182794 () Bool)

(declare-fun b_free!4507 () Bool)

(declare-fun b_next!4507 () Bool)

(assert (=> b!182794 (= b_free!4507 (not b_next!4507))))

(declare-fun tp!16286 () Bool)

(declare-fun b_and!11073 () Bool)

(assert (=> b!182794 (= tp!16286 b_and!11073)))

(declare-fun b!182790 () Bool)

(declare-fun res!86512 () Bool)

(declare-fun e!120352 () Bool)

(assert (=> b!182790 (=> (not res!86512) (not e!120352))))

(declare-datatypes ((V!5353 0))(
  ( (V!5354 (val!2184 Int)) )
))
(declare-datatypes ((ValueCell!1796 0))(
  ( (ValueCellFull!1796 (v!4085 V!5353)) (EmptyCell!1796) )
))
(declare-datatypes ((array!7747 0))(
  ( (array!7748 (arr!3663 (Array (_ BitVec 32) (_ BitVec 64))) (size!3975 (_ BitVec 32))) )
))
(declare-datatypes ((array!7749 0))(
  ( (array!7750 (arr!3664 (Array (_ BitVec 32) ValueCell!1796)) (size!3976 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2500 0))(
  ( (LongMapFixedSize!2501 (defaultEntry!3738 Int) (mask!8789 (_ BitVec 32)) (extraKeys!3475 (_ BitVec 32)) (zeroValue!3579 V!5353) (minValue!3579 V!5353) (_size!1299 (_ BitVec 32)) (_keys!5653 array!7747) (_values!3721 array!7749) (_vacant!1299 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2500)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7747 (_ BitVec 32)) Bool)

(assert (=> b!182790 (= res!86512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5653 thiss!1248) (mask!8789 thiss!1248)))))

(declare-fun b!182791 () Bool)

(declare-fun e!120356 () Bool)

(declare-fun tp_is_empty!4279 () Bool)

(assert (=> b!182791 (= e!120356 tp_is_empty!4279)))

(declare-fun b!182792 () Bool)

(assert (=> b!182792 (= e!120352 false)))

(declare-fun lt!90402 () Bool)

(declare-datatypes ((List!2322 0))(
  ( (Nil!2319) (Cons!2318 (h!2947 (_ BitVec 64)) (t!7186 List!2322)) )
))
(declare-fun arrayNoDuplicates!0 (array!7747 (_ BitVec 32) List!2322) Bool)

(assert (=> b!182792 (= lt!90402 (arrayNoDuplicates!0 (_keys!5653 thiss!1248) #b00000000000000000000000000000000 Nil!2319))))

(declare-fun b!182793 () Bool)

(declare-fun e!120354 () Bool)

(assert (=> b!182793 (= e!120354 e!120352)))

(declare-fun res!86508 () Bool)

(assert (=> b!182793 (=> (not res!86508) (not e!120352))))

(declare-datatypes ((SeekEntryResult!610 0))(
  ( (MissingZero!610 (index!4610 (_ BitVec 32))) (Found!610 (index!4611 (_ BitVec 32))) (Intermediate!610 (undefined!1422 Bool) (index!4612 (_ BitVec 32)) (x!19920 (_ BitVec 32))) (Undefined!610) (MissingVacant!610 (index!4613 (_ BitVec 32))) )
))
(declare-fun lt!90403 () SeekEntryResult!610)

(assert (=> b!182793 (= res!86508 (and (not (is-Undefined!610 lt!90403)) (not (is-MissingVacant!610 lt!90403)) (not (is-MissingZero!610 lt!90403)) (is-Found!610 lt!90403)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7747 (_ BitVec 32)) SeekEntryResult!610)

(assert (=> b!182793 (= lt!90403 (seekEntryOrOpen!0 key!828 (_keys!5653 thiss!1248) (mask!8789 thiss!1248)))))

(declare-fun res!86509 () Bool)

(assert (=> start!18430 (=> (not res!86509) (not e!120354))))

(declare-fun valid!1036 (LongMapFixedSize!2500) Bool)

(assert (=> start!18430 (= res!86509 (valid!1036 thiss!1248))))

(assert (=> start!18430 e!120354))

(declare-fun e!120350 () Bool)

(assert (=> start!18430 e!120350))

(assert (=> start!18430 true))

(declare-fun mapNonEmpty!7346 () Bool)

(declare-fun mapRes!7346 () Bool)

(declare-fun tp!16285 () Bool)

(declare-fun e!120355 () Bool)

(assert (=> mapNonEmpty!7346 (= mapRes!7346 (and tp!16285 e!120355))))

(declare-fun mapKey!7346 () (_ BitVec 32))

(declare-fun mapValue!7346 () ValueCell!1796)

(declare-fun mapRest!7346 () (Array (_ BitVec 32) ValueCell!1796))

(assert (=> mapNonEmpty!7346 (= (arr!3664 (_values!3721 thiss!1248)) (store mapRest!7346 mapKey!7346 mapValue!7346))))

(declare-fun e!120353 () Bool)

(declare-fun array_inv!2365 (array!7747) Bool)

(declare-fun array_inv!2366 (array!7749) Bool)

(assert (=> b!182794 (= e!120350 (and tp!16286 tp_is_empty!4279 (array_inv!2365 (_keys!5653 thiss!1248)) (array_inv!2366 (_values!3721 thiss!1248)) e!120353))))

(declare-fun b!182795 () Bool)

(declare-fun res!86514 () Bool)

(assert (=> b!182795 (=> (not res!86514) (not e!120352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182795 (= res!86514 (validMask!0 (mask!8789 thiss!1248)))))

(declare-fun b!182796 () Bool)

(declare-fun res!86511 () Bool)

(assert (=> b!182796 (=> (not res!86511) (not e!120354))))

(assert (=> b!182796 (= res!86511 (not (= key!828 (bvneg key!828))))))

(declare-fun b!182797 () Bool)

(assert (=> b!182797 (= e!120355 tp_is_empty!4279)))

(declare-fun b!182798 () Bool)

(declare-fun res!86513 () Bool)

(assert (=> b!182798 (=> (not res!86513) (not e!120352))))

(declare-datatypes ((tuple2!3404 0))(
  ( (tuple2!3405 (_1!1713 (_ BitVec 64)) (_2!1713 V!5353)) )
))
(declare-datatypes ((List!2323 0))(
  ( (Nil!2320) (Cons!2319 (h!2948 tuple2!3404) (t!7187 List!2323)) )
))
(declare-datatypes ((ListLongMap!2321 0))(
  ( (ListLongMap!2322 (toList!1176 List!2323)) )
))
(declare-fun contains!1261 (ListLongMap!2321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!824 (array!7747 array!7749 (_ BitVec 32) (_ BitVec 32) V!5353 V!5353 (_ BitVec 32) Int) ListLongMap!2321)

(assert (=> b!182798 (= res!86513 (contains!1261 (getCurrentListMap!824 (_keys!5653 thiss!1248) (_values!3721 thiss!1248) (mask!8789 thiss!1248) (extraKeys!3475 thiss!1248) (zeroValue!3579 thiss!1248) (minValue!3579 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3738 thiss!1248)) key!828))))

(declare-fun b!182799 () Bool)

(assert (=> b!182799 (= e!120353 (and e!120356 mapRes!7346))))

(declare-fun condMapEmpty!7346 () Bool)

(declare-fun mapDefault!7346 () ValueCell!1796)

