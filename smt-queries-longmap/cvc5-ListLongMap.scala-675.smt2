; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16554 () Bool)

(assert start!16554)

(declare-fun b!164816 () Bool)

(declare-fun b_free!3859 () Bool)

(declare-fun b_next!3859 () Bool)

(assert (=> b!164816 (= b_free!3859 (not b_next!3859))))

(declare-fun tp!14178 () Bool)

(declare-fun b_and!10273 () Bool)

(assert (=> b!164816 (= tp!14178 b_and!10273)))

(declare-fun b!164810 () Bool)

(declare-fun res!78090 () Bool)

(declare-fun e!108124 () Bool)

(assert (=> b!164810 (=> (not res!78090) (not e!108124))))

(declare-datatypes ((V!4529 0))(
  ( (V!4530 (val!1875 Int)) )
))
(declare-datatypes ((ValueCell!1487 0))(
  ( (ValueCellFull!1487 (v!3740 V!4529)) (EmptyCell!1487) )
))
(declare-datatypes ((array!6419 0))(
  ( (array!6420 (arr!3045 (Array (_ BitVec 32) (_ BitVec 64))) (size!3333 (_ BitVec 32))) )
))
(declare-datatypes ((array!6421 0))(
  ( (array!6422 (arr!3046 (Array (_ BitVec 32) ValueCell!1487)) (size!3334 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1882 0))(
  ( (LongMapFixedSize!1883 (defaultEntry!3383 Int) (mask!8082 (_ BitVec 32)) (extraKeys!3124 (_ BitVec 32)) (zeroValue!3226 V!4529) (minValue!3226 V!4529) (_size!990 (_ BitVec 32)) (_keys!5208 array!6419) (_values!3366 array!6421) (_vacant!990 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1882)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6419 (_ BitVec 32)) Bool)

(assert (=> b!164810 (= res!78090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5208 thiss!1248) (mask!8082 thiss!1248)))))

(declare-fun res!78094 () Bool)

(declare-fun e!108122 () Bool)

(assert (=> start!16554 (=> (not res!78094) (not e!108122))))

(declare-fun valid!836 (LongMapFixedSize!1882) Bool)

(assert (=> start!16554 (= res!78094 (valid!836 thiss!1248))))

(assert (=> start!16554 e!108122))

(declare-fun e!108128 () Bool)

(assert (=> start!16554 e!108128))

(assert (=> start!16554 true))

(declare-fun mapIsEmpty!6210 () Bool)

(declare-fun mapRes!6210 () Bool)

(assert (=> mapIsEmpty!6210 mapRes!6210))

(declare-fun b!164811 () Bool)

(assert (=> b!164811 (= e!108124 false)))

(declare-fun lt!82957 () Bool)

(declare-datatypes ((List!2024 0))(
  ( (Nil!2021) (Cons!2020 (h!2637 (_ BitVec 64)) (t!6826 List!2024)) )
))
(declare-fun arrayNoDuplicates!0 (array!6419 (_ BitVec 32) List!2024) Bool)

(assert (=> b!164811 (= lt!82957 (arrayNoDuplicates!0 (_keys!5208 thiss!1248) #b00000000000000000000000000000000 Nil!2021))))

(declare-fun b!164812 () Bool)

(declare-fun e!108126 () Bool)

(declare-fun tp_is_empty!3661 () Bool)

(assert (=> b!164812 (= e!108126 tp_is_empty!3661)))

(declare-fun b!164813 () Bool)

(declare-fun res!78093 () Bool)

(assert (=> b!164813 (=> (not res!78093) (not e!108124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164813 (= res!78093 (validMask!0 (mask!8082 thiss!1248)))))

(declare-fun b!164814 () Bool)

(declare-fun res!78095 () Bool)

(assert (=> b!164814 (=> (not res!78095) (not e!108124))))

(assert (=> b!164814 (= res!78095 (and (= (size!3334 (_values!3366 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8082 thiss!1248))) (= (size!3333 (_keys!5208 thiss!1248)) (size!3334 (_values!3366 thiss!1248))) (bvsge (mask!8082 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3124 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3124 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164815 () Bool)

(declare-fun res!78096 () Bool)

(assert (=> b!164815 (=> (not res!78096) (not e!108124))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3042 0))(
  ( (tuple2!3043 (_1!1532 (_ BitVec 64)) (_2!1532 V!4529)) )
))
(declare-datatypes ((List!2025 0))(
  ( (Nil!2022) (Cons!2021 (h!2638 tuple2!3042) (t!6827 List!2025)) )
))
(declare-datatypes ((ListLongMap!1997 0))(
  ( (ListLongMap!1998 (toList!1014 List!2025)) )
))
(declare-fun contains!1056 (ListLongMap!1997 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!672 (array!6419 array!6421 (_ BitVec 32) (_ BitVec 32) V!4529 V!4529 (_ BitVec 32) Int) ListLongMap!1997)

(assert (=> b!164815 (= res!78096 (contains!1056 (getCurrentListMap!672 (_keys!5208 thiss!1248) (_values!3366 thiss!1248) (mask!8082 thiss!1248) (extraKeys!3124 thiss!1248) (zeroValue!3226 thiss!1248) (minValue!3226 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3383 thiss!1248)) key!828))))

(declare-fun e!108127 () Bool)

(declare-fun array_inv!1953 (array!6419) Bool)

(declare-fun array_inv!1954 (array!6421) Bool)

(assert (=> b!164816 (= e!108128 (and tp!14178 tp_is_empty!3661 (array_inv!1953 (_keys!5208 thiss!1248)) (array_inv!1954 (_values!3366 thiss!1248)) e!108127))))

(declare-fun b!164817 () Bool)

(declare-fun e!108125 () Bool)

(assert (=> b!164817 (= e!108125 tp_is_empty!3661)))

(declare-fun mapNonEmpty!6210 () Bool)

(declare-fun tp!14177 () Bool)

(assert (=> mapNonEmpty!6210 (= mapRes!6210 (and tp!14177 e!108125))))

(declare-fun mapValue!6210 () ValueCell!1487)

(declare-fun mapRest!6210 () (Array (_ BitVec 32) ValueCell!1487))

(declare-fun mapKey!6210 () (_ BitVec 32))

(assert (=> mapNonEmpty!6210 (= (arr!3046 (_values!3366 thiss!1248)) (store mapRest!6210 mapKey!6210 mapValue!6210))))

(declare-fun b!164818 () Bool)

(assert (=> b!164818 (= e!108127 (and e!108126 mapRes!6210))))

(declare-fun condMapEmpty!6210 () Bool)

(declare-fun mapDefault!6210 () ValueCell!1487)

