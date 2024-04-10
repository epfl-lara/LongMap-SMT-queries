; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16122 () Bool)

(assert start!16122)

(declare-fun b!160419 () Bool)

(declare-fun b_free!3583 () Bool)

(declare-fun b_next!3583 () Bool)

(assert (=> b!160419 (= b_free!3583 (not b_next!3583))))

(declare-fun tp!13319 () Bool)

(declare-fun b_and!9997 () Bool)

(assert (=> b!160419 (= tp!13319 b_and!9997)))

(declare-fun e!104894 () Bool)

(declare-fun e!104893 () Bool)

(declare-datatypes ((V!4161 0))(
  ( (V!4162 (val!1737 Int)) )
))
(declare-datatypes ((ValueCell!1349 0))(
  ( (ValueCellFull!1349 (v!3602 V!4161)) (EmptyCell!1349) )
))
(declare-datatypes ((array!5849 0))(
  ( (array!5850 (arr!2769 (Array (_ BitVec 32) (_ BitVec 64))) (size!3053 (_ BitVec 32))) )
))
(declare-datatypes ((array!5851 0))(
  ( (array!5852 (arr!2770 (Array (_ BitVec 32) ValueCell!1349)) (size!3054 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1606 0))(
  ( (LongMapFixedSize!1607 (defaultEntry!3245 Int) (mask!7815 (_ BitVec 32)) (extraKeys!2986 (_ BitVec 32)) (zeroValue!3088 V!4161) (minValue!3088 V!4161) (_size!852 (_ BitVec 32)) (_keys!5046 array!5849) (_values!3228 array!5851) (_vacant!852 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1606)

(declare-fun tp_is_empty!3385 () Bool)

(declare-fun array_inv!1765 (array!5849) Bool)

(declare-fun array_inv!1766 (array!5851) Bool)

(assert (=> b!160419 (= e!104894 (and tp!13319 tp_is_empty!3385 (array_inv!1765 (_keys!5046 thiss!1248)) (array_inv!1766 (_values!3228 thiss!1248)) e!104893))))

(declare-fun mapNonEmpty!5765 () Bool)

(declare-fun mapRes!5765 () Bool)

(declare-fun tp!13318 () Bool)

(declare-fun e!104895 () Bool)

(assert (=> mapNonEmpty!5765 (= mapRes!5765 (and tp!13318 e!104895))))

(declare-fun mapKey!5765 () (_ BitVec 32))

(declare-fun mapValue!5765 () ValueCell!1349)

(declare-fun mapRest!5765 () (Array (_ BitVec 32) ValueCell!1349))

(assert (=> mapNonEmpty!5765 (= (arr!2770 (_values!3228 thiss!1248)) (store mapRest!5765 mapKey!5765 mapValue!5765))))

(declare-fun b!160420 () Bool)

(declare-fun res!75959 () Bool)

(declare-fun e!104896 () Bool)

(assert (=> b!160420 (=> (not res!75959) (not e!104896))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2918 0))(
  ( (tuple2!2919 (_1!1470 (_ BitVec 64)) (_2!1470 V!4161)) )
))
(declare-datatypes ((List!1941 0))(
  ( (Nil!1938) (Cons!1937 (h!2550 tuple2!2918) (t!6743 List!1941)) )
))
(declare-datatypes ((ListLongMap!1905 0))(
  ( (ListLongMap!1906 (toList!968 List!1941)) )
))
(declare-fun contains!1004 (ListLongMap!1905 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!632 (array!5849 array!5851 (_ BitVec 32) (_ BitVec 32) V!4161 V!4161 (_ BitVec 32) Int) ListLongMap!1905)

(assert (=> b!160420 (= res!75959 (not (contains!1004 (getCurrentListMap!632 (_keys!5046 thiss!1248) (_values!3228 thiss!1248) (mask!7815 thiss!1248) (extraKeys!2986 thiss!1248) (zeroValue!3088 thiss!1248) (minValue!3088 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3245 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!5765 () Bool)

(assert (=> mapIsEmpty!5765 mapRes!5765))

(declare-fun res!75953 () Bool)

(assert (=> start!16122 (=> (not res!75953) (not e!104896))))

(declare-fun valid!744 (LongMapFixedSize!1606) Bool)

(assert (=> start!16122 (= res!75953 (valid!744 thiss!1248))))

(assert (=> start!16122 e!104896))

(assert (=> start!16122 e!104894))

(assert (=> start!16122 true))

(declare-fun b!160421 () Bool)

(declare-fun res!75955 () Bool)

(assert (=> b!160421 (=> (not res!75955) (not e!104896))))

(declare-datatypes ((SeekEntryResult!331 0))(
  ( (MissingZero!331 (index!3492 (_ BitVec 32))) (Found!331 (index!3493 (_ BitVec 32))) (Intermediate!331 (undefined!1143 Bool) (index!3494 (_ BitVec 32)) (x!17707 (_ BitVec 32))) (Undefined!331) (MissingVacant!331 (index!3495 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5849 (_ BitVec 32)) SeekEntryResult!331)

(assert (=> b!160421 (= res!75955 (is-Undefined!331 (seekEntryOrOpen!0 key!828 (_keys!5046 thiss!1248) (mask!7815 thiss!1248))))))

(declare-fun b!160422 () Bool)

(declare-fun e!104897 () Bool)

(assert (=> b!160422 (= e!104893 (and e!104897 mapRes!5765))))

(declare-fun condMapEmpty!5765 () Bool)

(declare-fun mapDefault!5765 () ValueCell!1349)

