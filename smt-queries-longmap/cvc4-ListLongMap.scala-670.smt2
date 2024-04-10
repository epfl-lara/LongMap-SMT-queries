; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16528 () Bool)

(assert start!16528)

(declare-fun b!164388 () Bool)

(declare-fun b_free!3833 () Bool)

(declare-fun b_next!3833 () Bool)

(assert (=> b!164388 (= b_free!3833 (not b_next!3833))))

(declare-fun tp!14099 () Bool)

(declare-fun b_and!10247 () Bool)

(assert (=> b!164388 (= tp!14099 b_and!10247)))

(declare-fun b!164381 () Bool)

(declare-fun e!107852 () Bool)

(declare-fun e!107851 () Bool)

(assert (=> b!164381 (= e!107852 e!107851)))

(declare-fun res!77821 () Bool)

(assert (=> b!164381 (=> (not res!77821) (not e!107851))))

(declare-datatypes ((SeekEntryResult!415 0))(
  ( (MissingZero!415 (index!3828 (_ BitVec 32))) (Found!415 (index!3829 (_ BitVec 32))) (Intermediate!415 (undefined!1227 Bool) (index!3830 (_ BitVec 32)) (x!18227 (_ BitVec 32))) (Undefined!415) (MissingVacant!415 (index!3831 (_ BitVec 32))) )
))
(declare-fun lt!82878 () SeekEntryResult!415)

(assert (=> b!164381 (= res!77821 (and (not (is-Undefined!415 lt!82878)) (not (is-MissingVacant!415 lt!82878)) (not (is-MissingZero!415 lt!82878)) (is-Found!415 lt!82878)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4493 0))(
  ( (V!4494 (val!1862 Int)) )
))
(declare-datatypes ((ValueCell!1474 0))(
  ( (ValueCellFull!1474 (v!3727 V!4493)) (EmptyCell!1474) )
))
(declare-datatypes ((array!6367 0))(
  ( (array!6368 (arr!3019 (Array (_ BitVec 32) (_ BitVec 64))) (size!3307 (_ BitVec 32))) )
))
(declare-datatypes ((array!6369 0))(
  ( (array!6370 (arr!3020 (Array (_ BitVec 32) ValueCell!1474)) (size!3308 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1856 0))(
  ( (LongMapFixedSize!1857 (defaultEntry!3370 Int) (mask!8059 (_ BitVec 32)) (extraKeys!3111 (_ BitVec 32)) (zeroValue!3213 V!4493) (minValue!3213 V!4493) (_size!977 (_ BitVec 32)) (_keys!5195 array!6367) (_values!3353 array!6369) (_vacant!977 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1856)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6367 (_ BitVec 32)) SeekEntryResult!415)

(assert (=> b!164381 (= lt!82878 (seekEntryOrOpen!0 key!828 (_keys!5195 thiss!1248) (mask!8059 thiss!1248)))))

(declare-fun mapIsEmpty!6171 () Bool)

(declare-fun mapRes!6171 () Bool)

(assert (=> mapIsEmpty!6171 mapRes!6171))

(declare-fun b!164382 () Bool)

(declare-fun res!77817 () Bool)

(assert (=> b!164382 (=> (not res!77817) (not e!107851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164382 (= res!77817 (validMask!0 (mask!8059 thiss!1248)))))

(declare-fun res!77823 () Bool)

(assert (=> start!16528 (=> (not res!77823) (not e!107852))))

(declare-fun valid!826 (LongMapFixedSize!1856) Bool)

(assert (=> start!16528 (= res!77823 (valid!826 thiss!1248))))

(assert (=> start!16528 e!107852))

(declare-fun e!107855 () Bool)

(assert (=> start!16528 e!107855))

(assert (=> start!16528 true))

(declare-fun b!164383 () Bool)

(declare-fun res!77818 () Bool)

(assert (=> b!164383 (=> (not res!77818) (not e!107851))))

(assert (=> b!164383 (= res!77818 (and (= (size!3308 (_values!3353 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8059 thiss!1248))) (= (size!3307 (_keys!5195 thiss!1248)) (size!3308 (_values!3353 thiss!1248))) (bvsge (mask!8059 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3111 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3111 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164384 () Bool)

(declare-fun res!77819 () Bool)

(assert (=> b!164384 (=> (not res!77819) (not e!107852))))

(assert (=> b!164384 (= res!77819 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6171 () Bool)

(declare-fun tp!14100 () Bool)

(declare-fun e!107853 () Bool)

(assert (=> mapNonEmpty!6171 (= mapRes!6171 (and tp!14100 e!107853))))

(declare-fun mapValue!6171 () ValueCell!1474)

(declare-fun mapRest!6171 () (Array (_ BitVec 32) ValueCell!1474))

(declare-fun mapKey!6171 () (_ BitVec 32))

(assert (=> mapNonEmpty!6171 (= (arr!3020 (_values!3353 thiss!1248)) (store mapRest!6171 mapKey!6171 mapValue!6171))))

(declare-fun b!164385 () Bool)

(declare-fun res!77820 () Bool)

(assert (=> b!164385 (=> (not res!77820) (not e!107851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6367 (_ BitVec 32)) Bool)

(assert (=> b!164385 (= res!77820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5195 thiss!1248) (mask!8059 thiss!1248)))))

(declare-fun b!164386 () Bool)

(declare-fun e!107849 () Bool)

(declare-fun tp_is_empty!3635 () Bool)

(assert (=> b!164386 (= e!107849 tp_is_empty!3635)))

(declare-fun b!164387 () Bool)

(assert (=> b!164387 (= e!107853 tp_is_empty!3635)))

(declare-fun e!107854 () Bool)

(declare-fun array_inv!1933 (array!6367) Bool)

(declare-fun array_inv!1934 (array!6369) Bool)

(assert (=> b!164388 (= e!107855 (and tp!14099 tp_is_empty!3635 (array_inv!1933 (_keys!5195 thiss!1248)) (array_inv!1934 (_values!3353 thiss!1248)) e!107854))))

(declare-fun b!164389 () Bool)

(assert (=> b!164389 (= e!107851 false)))

(declare-fun lt!82879 () Bool)

(declare-datatypes ((List!2004 0))(
  ( (Nil!2001) (Cons!2000 (h!2617 (_ BitVec 64)) (t!6806 List!2004)) )
))
(declare-fun arrayNoDuplicates!0 (array!6367 (_ BitVec 32) List!2004) Bool)

(assert (=> b!164389 (= lt!82879 (arrayNoDuplicates!0 (_keys!5195 thiss!1248) #b00000000000000000000000000000000 Nil!2001))))

(declare-fun b!164390 () Bool)

(declare-fun res!77822 () Bool)

(assert (=> b!164390 (=> (not res!77822) (not e!107851))))

(declare-datatypes ((tuple2!3022 0))(
  ( (tuple2!3023 (_1!1522 (_ BitVec 64)) (_2!1522 V!4493)) )
))
(declare-datatypes ((List!2005 0))(
  ( (Nil!2002) (Cons!2001 (h!2618 tuple2!3022) (t!6807 List!2005)) )
))
(declare-datatypes ((ListLongMap!1977 0))(
  ( (ListLongMap!1978 (toList!1004 List!2005)) )
))
(declare-fun contains!1046 (ListLongMap!1977 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!662 (array!6367 array!6369 (_ BitVec 32) (_ BitVec 32) V!4493 V!4493 (_ BitVec 32) Int) ListLongMap!1977)

(assert (=> b!164390 (= res!77822 (contains!1046 (getCurrentListMap!662 (_keys!5195 thiss!1248) (_values!3353 thiss!1248) (mask!8059 thiss!1248) (extraKeys!3111 thiss!1248) (zeroValue!3213 thiss!1248) (minValue!3213 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3370 thiss!1248)) key!828))))

(declare-fun b!164391 () Bool)

(assert (=> b!164391 (= e!107854 (and e!107849 mapRes!6171))))

(declare-fun condMapEmpty!6171 () Bool)

(declare-fun mapDefault!6171 () ValueCell!1474)

