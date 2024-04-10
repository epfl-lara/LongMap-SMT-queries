; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16110 () Bool)

(assert start!16110)

(declare-fun b!160227 () Bool)

(declare-fun b_free!3571 () Bool)

(declare-fun b_next!3571 () Bool)

(assert (=> b!160227 (= b_free!3571 (not b_next!3571))))

(declare-fun tp!13283 () Bool)

(declare-fun b_and!9985 () Bool)

(assert (=> b!160227 (= tp!13283 b_and!9985)))

(declare-fun b!160221 () Bool)

(declare-fun res!75831 () Bool)

(declare-fun e!104787 () Bool)

(assert (=> b!160221 (=> (not res!75831) (not e!104787))))

(declare-datatypes ((V!4145 0))(
  ( (V!4146 (val!1731 Int)) )
))
(declare-datatypes ((ValueCell!1343 0))(
  ( (ValueCellFull!1343 (v!3596 V!4145)) (EmptyCell!1343) )
))
(declare-datatypes ((array!5825 0))(
  ( (array!5826 (arr!2757 (Array (_ BitVec 32) (_ BitVec 64))) (size!3041 (_ BitVec 32))) )
))
(declare-datatypes ((array!5827 0))(
  ( (array!5828 (arr!2758 (Array (_ BitVec 32) ValueCell!1343)) (size!3042 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1594 0))(
  ( (LongMapFixedSize!1595 (defaultEntry!3239 Int) (mask!7805 (_ BitVec 32)) (extraKeys!2980 (_ BitVec 32)) (zeroValue!3082 V!4145) (minValue!3082 V!4145) (_size!846 (_ BitVec 32)) (_keys!5040 array!5825) (_values!3222 array!5827) (_vacant!846 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1594)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2910 0))(
  ( (tuple2!2911 (_1!1466 (_ BitVec 64)) (_2!1466 V!4145)) )
))
(declare-datatypes ((List!1934 0))(
  ( (Nil!1931) (Cons!1930 (h!2543 tuple2!2910) (t!6736 List!1934)) )
))
(declare-datatypes ((ListLongMap!1897 0))(
  ( (ListLongMap!1898 (toList!964 List!1934)) )
))
(declare-fun contains!1000 (ListLongMap!1897 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!628 (array!5825 array!5827 (_ BitVec 32) (_ BitVec 32) V!4145 V!4145 (_ BitVec 32) Int) ListLongMap!1897)

(assert (=> b!160221 (= res!75831 (not (contains!1000 (getCurrentListMap!628 (_keys!5040 thiss!1248) (_values!3222 thiss!1248) (mask!7805 thiss!1248) (extraKeys!2980 thiss!1248) (zeroValue!3082 thiss!1248) (minValue!3082 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3239 thiss!1248)) key!828)))))

(declare-fun b!160222 () Bool)

(declare-fun res!75830 () Bool)

(assert (=> b!160222 (=> (not res!75830) (not e!104787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5825 (_ BitVec 32)) Bool)

(assert (=> b!160222 (= res!75830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5040 thiss!1248) (mask!7805 thiss!1248)))))

(declare-fun b!160223 () Bool)

(declare-fun res!75828 () Bool)

(assert (=> b!160223 (=> (not res!75828) (not e!104787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160223 (= res!75828 (validMask!0 (mask!7805 thiss!1248)))))

(declare-fun res!75833 () Bool)

(assert (=> start!16110 (=> (not res!75833) (not e!104787))))

(declare-fun valid!739 (LongMapFixedSize!1594) Bool)

(assert (=> start!16110 (= res!75833 (valid!739 thiss!1248))))

(assert (=> start!16110 e!104787))

(declare-fun e!104790 () Bool)

(assert (=> start!16110 e!104790))

(assert (=> start!16110 true))

(declare-fun b!160224 () Bool)

(declare-fun e!104785 () Bool)

(declare-fun e!104788 () Bool)

(declare-fun mapRes!5747 () Bool)

(assert (=> b!160224 (= e!104785 (and e!104788 mapRes!5747))))

(declare-fun condMapEmpty!5747 () Bool)

(declare-fun mapDefault!5747 () ValueCell!1343)

