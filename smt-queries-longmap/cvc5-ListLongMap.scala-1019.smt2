; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21714 () Bool)

(assert start!21714)

(declare-fun b!218260 () Bool)

(declare-fun b_free!5863 () Bool)

(declare-fun b_next!5863 () Bool)

(assert (=> b!218260 (= b_free!5863 (not b_next!5863))))

(declare-fun tp!20723 () Bool)

(declare-fun b_and!12753 () Bool)

(assert (=> b!218260 (= tp!20723 b_and!12753)))

(declare-fun b!218251 () Bool)

(declare-fun res!106991 () Bool)

(declare-fun e!141971 () Bool)

(assert (=> b!218251 (=> (not res!106991) (not e!141971))))

(declare-datatypes ((V!7281 0))(
  ( (V!7282 (val!2907 Int)) )
))
(declare-datatypes ((ValueCell!2519 0))(
  ( (ValueCellFull!2519 (v!4925 V!7281)) (EmptyCell!2519) )
))
(declare-datatypes ((array!10689 0))(
  ( (array!10690 (arr!5066 (Array (_ BitVec 32) ValueCell!2519)) (size!5398 (_ BitVec 32))) )
))
(declare-datatypes ((array!10691 0))(
  ( (array!10692 (arr!5067 (Array (_ BitVec 32) (_ BitVec 64))) (size!5399 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2938 0))(
  ( (LongMapFixedSize!2939 (defaultEntry!4119 Int) (mask!9892 (_ BitVec 32)) (extraKeys!3856 (_ BitVec 32)) (zeroValue!3960 V!7281) (minValue!3960 V!7281) (_size!1518 (_ BitVec 32)) (_keys!6168 array!10691) (_values!4102 array!10689) (_vacant!1518 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2938)

(assert (=> b!218251 (= res!106991 (and (= (size!5398 (_values!4102 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9892 thiss!1504))) (= (size!5399 (_keys!6168 thiss!1504)) (size!5398 (_values!4102 thiss!1504))) (bvsge (mask!9892 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3856 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3856 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!106990 () Bool)

(declare-fun e!141974 () Bool)

(assert (=> start!21714 (=> (not res!106990) (not e!141974))))

(declare-fun valid!1191 (LongMapFixedSize!2938) Bool)

(assert (=> start!21714 (= res!106990 (valid!1191 thiss!1504))))

(assert (=> start!21714 e!141974))

(declare-fun e!141972 () Bool)

(assert (=> start!21714 e!141972))

(assert (=> start!21714 true))

(declare-fun b!218252 () Bool)

(assert (=> b!218252 (= e!141974 e!141971)))

(declare-fun res!106992 () Bool)

(assert (=> b!218252 (=> (not res!106992) (not e!141971))))

(declare-datatypes ((SeekEntryResult!784 0))(
  ( (MissingZero!784 (index!5306 (_ BitVec 32))) (Found!784 (index!5307 (_ BitVec 32))) (Intermediate!784 (undefined!1596 Bool) (index!5308 (_ BitVec 32)) (x!22824 (_ BitVec 32))) (Undefined!784) (MissingVacant!784 (index!5309 (_ BitVec 32))) )
))
(declare-fun lt!111494 () SeekEntryResult!784)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218252 (= res!106992 (or (= lt!111494 (MissingZero!784 index!297)) (= lt!111494 (MissingVacant!784 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10691 (_ BitVec 32)) SeekEntryResult!784)

(assert (=> b!218252 (= lt!111494 (seekEntryOrOpen!0 key!932 (_keys!6168 thiss!1504) (mask!9892 thiss!1504)))))

(declare-fun b!218253 () Bool)

(declare-fun e!141970 () Bool)

(declare-fun tp_is_empty!5725 () Bool)

(assert (=> b!218253 (= e!141970 tp_is_empty!5725)))

(declare-fun b!218254 () Bool)

(declare-fun res!106988 () Bool)

(assert (=> b!218254 (=> (not res!106988) (not e!141971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218254 (= res!106988 (validMask!0 (mask!9892 thiss!1504)))))

(declare-fun b!218255 () Bool)

(declare-fun res!106989 () Bool)

(assert (=> b!218255 (=> (not res!106989) (not e!141971))))

(declare-datatypes ((tuple2!4320 0))(
  ( (tuple2!4321 (_1!2171 (_ BitVec 64)) (_2!2171 V!7281)) )
))
(declare-datatypes ((List!3226 0))(
  ( (Nil!3223) (Cons!3222 (h!3869 tuple2!4320) (t!8181 List!3226)) )
))
(declare-datatypes ((ListLongMap!3233 0))(
  ( (ListLongMap!3234 (toList!1632 List!3226)) )
))
(declare-fun contains!1473 (ListLongMap!3233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1160 (array!10691 array!10689 (_ BitVec 32) (_ BitVec 32) V!7281 V!7281 (_ BitVec 32) Int) ListLongMap!3233)

(assert (=> b!218255 (= res!106989 (not (contains!1473 (getCurrentListMap!1160 (_keys!6168 thiss!1504) (_values!4102 thiss!1504) (mask!9892 thiss!1504) (extraKeys!3856 thiss!1504) (zeroValue!3960 thiss!1504) (minValue!3960 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4119 thiss!1504)) key!932)))))

(declare-fun b!218256 () Bool)

(declare-fun res!106986 () Bool)

(assert (=> b!218256 (=> (not res!106986) (not e!141974))))

(assert (=> b!218256 (= res!106986 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218257 () Bool)

(declare-fun e!141975 () Bool)

(declare-fun e!141976 () Bool)

(declare-fun mapRes!9750 () Bool)

(assert (=> b!218257 (= e!141975 (and e!141976 mapRes!9750))))

(declare-fun condMapEmpty!9750 () Bool)

(declare-fun mapDefault!9750 () ValueCell!2519)

