; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16146 () Bool)

(assert start!16146)

(declare-fun b!160820 () Bool)

(declare-fun b_free!3607 () Bool)

(declare-fun b_next!3607 () Bool)

(assert (=> b!160820 (= b_free!3607 (not b_next!3607))))

(declare-fun tp!13391 () Bool)

(declare-fun b_and!10021 () Bool)

(assert (=> b!160820 (= tp!13391 b_and!10021)))

(declare-fun b!160815 () Bool)

(declare-fun res!76209 () Bool)

(declare-fun e!105112 () Bool)

(assert (=> b!160815 (=> (not res!76209) (not e!105112))))

(declare-datatypes ((V!4193 0))(
  ( (V!4194 (val!1749 Int)) )
))
(declare-datatypes ((ValueCell!1361 0))(
  ( (ValueCellFull!1361 (v!3614 V!4193)) (EmptyCell!1361) )
))
(declare-datatypes ((array!5897 0))(
  ( (array!5898 (arr!2793 (Array (_ BitVec 32) (_ BitVec 64))) (size!3077 (_ BitVec 32))) )
))
(declare-datatypes ((array!5899 0))(
  ( (array!5900 (arr!2794 (Array (_ BitVec 32) ValueCell!1361)) (size!3078 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1630 0))(
  ( (LongMapFixedSize!1631 (defaultEntry!3257 Int) (mask!7835 (_ BitVec 32)) (extraKeys!2998 (_ BitVec 32)) (zeroValue!3100 V!4193) (minValue!3100 V!4193) (_size!864 (_ BitVec 32)) (_keys!5058 array!5897) (_values!3240 array!5899) (_vacant!864 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1630)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5897 (_ BitVec 32)) Bool)

(assert (=> b!160815 (= res!76209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5058 thiss!1248) (mask!7835 thiss!1248)))))

(declare-fun b!160816 () Bool)

(declare-fun res!76206 () Bool)

(assert (=> b!160816 (=> (not res!76206) (not e!105112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160816 (= res!76206 (validMask!0 (mask!7835 thiss!1248)))))

(declare-fun b!160817 () Bool)

(declare-fun res!76208 () Bool)

(assert (=> b!160817 (=> (not res!76208) (not e!105112))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2936 0))(
  ( (tuple2!2937 (_1!1479 (_ BitVec 64)) (_2!1479 V!4193)) )
))
(declare-datatypes ((List!1958 0))(
  ( (Nil!1955) (Cons!1954 (h!2567 tuple2!2936) (t!6760 List!1958)) )
))
(declare-datatypes ((ListLongMap!1923 0))(
  ( (ListLongMap!1924 (toList!977 List!1958)) )
))
(declare-fun contains!1013 (ListLongMap!1923 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!641 (array!5897 array!5899 (_ BitVec 32) (_ BitVec 32) V!4193 V!4193 (_ BitVec 32) Int) ListLongMap!1923)

(assert (=> b!160817 (= res!76208 (not (contains!1013 (getCurrentListMap!641 (_keys!5058 thiss!1248) (_values!3240 thiss!1248) (mask!7835 thiss!1248) (extraKeys!2998 thiss!1248) (zeroValue!3100 thiss!1248) (minValue!3100 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3257 thiss!1248)) key!828)))))

(declare-fun b!160818 () Bool)

(declare-fun res!76211 () Bool)

(assert (=> b!160818 (=> (not res!76211) (not e!105112))))

(assert (=> b!160818 (= res!76211 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160819 () Bool)

(declare-fun e!105110 () Bool)

(declare-fun tp_is_empty!3409 () Bool)

(assert (=> b!160819 (= e!105110 tp_is_empty!3409)))

(declare-fun e!105113 () Bool)

(declare-fun e!105109 () Bool)

(declare-fun array_inv!1785 (array!5897) Bool)

(declare-fun array_inv!1786 (array!5899) Bool)

(assert (=> b!160820 (= e!105113 (and tp!13391 tp_is_empty!3409 (array_inv!1785 (_keys!5058 thiss!1248)) (array_inv!1786 (_values!3240 thiss!1248)) e!105109))))

(declare-fun mapIsEmpty!5801 () Bool)

(declare-fun mapRes!5801 () Bool)

(assert (=> mapIsEmpty!5801 mapRes!5801))

(declare-fun b!160821 () Bool)

(declare-fun res!76210 () Bool)

(assert (=> b!160821 (=> (not res!76210) (not e!105112))))

(assert (=> b!160821 (= res!76210 (and (= (size!3078 (_values!3240 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7835 thiss!1248))) (= (size!3077 (_keys!5058 thiss!1248)) (size!3078 (_values!3240 thiss!1248))) (bvsge (mask!7835 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2998 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2998 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160822 () Bool)

(declare-fun e!105114 () Bool)

(assert (=> b!160822 (= e!105109 (and e!105114 mapRes!5801))))

(declare-fun condMapEmpty!5801 () Bool)

(declare-fun mapDefault!5801 () ValueCell!1361)

