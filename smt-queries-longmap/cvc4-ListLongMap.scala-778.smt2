; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18434 () Bool)

(assert start!18434)

(declare-fun b!182863 () Bool)

(declare-fun b_free!4511 () Bool)

(declare-fun b_next!4511 () Bool)

(assert (=> b!182863 (= b_free!4511 (not b_next!4511))))

(declare-fun tp!16298 () Bool)

(declare-fun b_and!11077 () Bool)

(assert (=> b!182863 (= tp!16298 b_and!11077)))

(declare-fun b!182856 () Bool)

(declare-fun res!86550 () Bool)

(declare-fun e!120397 () Bool)

(assert (=> b!182856 (=> (not res!86550) (not e!120397))))

(declare-datatypes ((V!5357 0))(
  ( (V!5358 (val!2186 Int)) )
))
(declare-datatypes ((ValueCell!1798 0))(
  ( (ValueCellFull!1798 (v!4087 V!5357)) (EmptyCell!1798) )
))
(declare-datatypes ((array!7755 0))(
  ( (array!7756 (arr!3667 (Array (_ BitVec 32) (_ BitVec 64))) (size!3979 (_ BitVec 32))) )
))
(declare-datatypes ((array!7757 0))(
  ( (array!7758 (arr!3668 (Array (_ BitVec 32) ValueCell!1798)) (size!3980 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2504 0))(
  ( (LongMapFixedSize!2505 (defaultEntry!3740 Int) (mask!8791 (_ BitVec 32)) (extraKeys!3477 (_ BitVec 32)) (zeroValue!3581 V!5357) (minValue!3581 V!5357) (_size!1301 (_ BitVec 32)) (_keys!5655 array!7755) (_values!3723 array!7757) (_vacant!1301 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2504)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3408 0))(
  ( (tuple2!3409 (_1!1715 (_ BitVec 64)) (_2!1715 V!5357)) )
))
(declare-datatypes ((List!2326 0))(
  ( (Nil!2323) (Cons!2322 (h!2951 tuple2!3408) (t!7190 List!2326)) )
))
(declare-datatypes ((ListLongMap!2325 0))(
  ( (ListLongMap!2326 (toList!1178 List!2326)) )
))
(declare-fun contains!1263 (ListLongMap!2325 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!826 (array!7755 array!7757 (_ BitVec 32) (_ BitVec 32) V!5357 V!5357 (_ BitVec 32) Int) ListLongMap!2325)

(assert (=> b!182856 (= res!86550 (contains!1263 (getCurrentListMap!826 (_keys!5655 thiss!1248) (_values!3723 thiss!1248) (mask!8791 thiss!1248) (extraKeys!3477 thiss!1248) (zeroValue!3581 thiss!1248) (minValue!3581 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3740 thiss!1248)) key!828))))

(declare-fun b!182857 () Bool)

(declare-fun res!86556 () Bool)

(assert (=> b!182857 (=> (not res!86556) (not e!120397))))

(assert (=> b!182857 (= res!86556 (and (= (size!3980 (_values!3723 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8791 thiss!1248))) (= (size!3979 (_keys!5655 thiss!1248)) (size!3980 (_values!3723 thiss!1248))) (bvsge (mask!8791 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3477 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3477 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!182858 () Bool)

(declare-fun e!120393 () Bool)

(declare-fun tp_is_empty!4283 () Bool)

(assert (=> b!182858 (= e!120393 tp_is_empty!4283)))

(declare-fun b!182859 () Bool)

(declare-fun res!86555 () Bool)

(declare-fun e!120398 () Bool)

(assert (=> b!182859 (=> (not res!86555) (not e!120398))))

(assert (=> b!182859 (= res!86555 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7352 () Bool)

(declare-fun mapRes!7352 () Bool)

(assert (=> mapIsEmpty!7352 mapRes!7352))

(declare-fun b!182860 () Bool)

(assert (=> b!182860 (= e!120398 e!120397)))

(declare-fun res!86553 () Bool)

(assert (=> b!182860 (=> (not res!86553) (not e!120397))))

(declare-datatypes ((SeekEntryResult!612 0))(
  ( (MissingZero!612 (index!4618 (_ BitVec 32))) (Found!612 (index!4619 (_ BitVec 32))) (Intermediate!612 (undefined!1424 Bool) (index!4620 (_ BitVec 32)) (x!19922 (_ BitVec 32))) (Undefined!612) (MissingVacant!612 (index!4621 (_ BitVec 32))) )
))
(declare-fun lt!90415 () SeekEntryResult!612)

(assert (=> b!182860 (= res!86553 (and (not (is-Undefined!612 lt!90415)) (not (is-MissingVacant!612 lt!90415)) (not (is-MissingZero!612 lt!90415)) (is-Found!612 lt!90415)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7755 (_ BitVec 32)) SeekEntryResult!612)

(assert (=> b!182860 (= lt!90415 (seekEntryOrOpen!0 key!828 (_keys!5655 thiss!1248) (mask!8791 thiss!1248)))))

(declare-fun b!182861 () Bool)

(declare-fun res!86554 () Bool)

(assert (=> b!182861 (=> (not res!86554) (not e!120397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7755 (_ BitVec 32)) Bool)

(assert (=> b!182861 (= res!86554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5655 thiss!1248) (mask!8791 thiss!1248)))))

(declare-fun mapNonEmpty!7352 () Bool)

(declare-fun tp!16297 () Bool)

(declare-fun e!120392 () Bool)

(assert (=> mapNonEmpty!7352 (= mapRes!7352 (and tp!16297 e!120392))))

(declare-fun mapValue!7352 () ValueCell!1798)

(declare-fun mapKey!7352 () (_ BitVec 32))

(declare-fun mapRest!7352 () (Array (_ BitVec 32) ValueCell!1798))

(assert (=> mapNonEmpty!7352 (= (arr!3668 (_values!3723 thiss!1248)) (store mapRest!7352 mapKey!7352 mapValue!7352))))

(declare-fun b!182862 () Bool)

(assert (=> b!182862 (= e!120397 false)))

(declare-fun lt!90414 () Bool)

(declare-datatypes ((List!2327 0))(
  ( (Nil!2324) (Cons!2323 (h!2952 (_ BitVec 64)) (t!7191 List!2327)) )
))
(declare-fun arrayNoDuplicates!0 (array!7755 (_ BitVec 32) List!2327) Bool)

(assert (=> b!182862 (= lt!90414 (arrayNoDuplicates!0 (_keys!5655 thiss!1248) #b00000000000000000000000000000000 Nil!2324))))

(declare-fun e!120395 () Bool)

(declare-fun e!120396 () Bool)

(declare-fun array_inv!2369 (array!7755) Bool)

(declare-fun array_inv!2370 (array!7757) Bool)

(assert (=> b!182863 (= e!120396 (and tp!16298 tp_is_empty!4283 (array_inv!2369 (_keys!5655 thiss!1248)) (array_inv!2370 (_values!3723 thiss!1248)) e!120395))))

(declare-fun b!182864 () Bool)

(assert (=> b!182864 (= e!120392 tp_is_empty!4283)))

(declare-fun b!182865 () Bool)

(declare-fun res!86551 () Bool)

(assert (=> b!182865 (=> (not res!86551) (not e!120397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182865 (= res!86551 (validMask!0 (mask!8791 thiss!1248)))))

(declare-fun res!86552 () Bool)

(assert (=> start!18434 (=> (not res!86552) (not e!120398))))

(declare-fun valid!1038 (LongMapFixedSize!2504) Bool)

(assert (=> start!18434 (= res!86552 (valid!1038 thiss!1248))))

(assert (=> start!18434 e!120398))

(assert (=> start!18434 e!120396))

(assert (=> start!18434 true))

(declare-fun b!182866 () Bool)

(assert (=> b!182866 (= e!120395 (and e!120393 mapRes!7352))))

(declare-fun condMapEmpty!7352 () Bool)

(declare-fun mapDefault!7352 () ValueCell!1798)

