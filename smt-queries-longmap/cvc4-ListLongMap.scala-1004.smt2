; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21628 () Bool)

(assert start!21628)

(declare-fun b!216832 () Bool)

(declare-fun b_free!5777 () Bool)

(declare-fun b_next!5777 () Bool)

(assert (=> b!216832 (= b_free!5777 (not b_next!5777))))

(declare-fun tp!20466 () Bool)

(declare-fun b_and!12667 () Bool)

(assert (=> b!216832 (= tp!20466 b_and!12667)))

(declare-fun b!216833 () Bool)

(declare-fun res!106086 () Bool)

(declare-fun e!141071 () Bool)

(assert (=> b!216833 (=> (not res!106086) (not e!141071))))

(declare-datatypes ((V!7165 0))(
  ( (V!7166 (val!2864 Int)) )
))
(declare-datatypes ((ValueCell!2476 0))(
  ( (ValueCellFull!2476 (v!4882 V!7165)) (EmptyCell!2476) )
))
(declare-datatypes ((array!10517 0))(
  ( (array!10518 (arr!4980 (Array (_ BitVec 32) ValueCell!2476)) (size!5312 (_ BitVec 32))) )
))
(declare-datatypes ((array!10519 0))(
  ( (array!10520 (arr!4981 (Array (_ BitVec 32) (_ BitVec 64))) (size!5313 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2852 0))(
  ( (LongMapFixedSize!2853 (defaultEntry!4076 Int) (mask!9819 (_ BitVec 32)) (extraKeys!3813 (_ BitVec 32)) (zeroValue!3917 V!7165) (minValue!3917 V!7165) (_size!1475 (_ BitVec 32)) (_keys!6125 array!10519) (_values!4059 array!10517) (_vacant!1475 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2852)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4262 0))(
  ( (tuple2!4263 (_1!2142 (_ BitVec 64)) (_2!2142 V!7165)) )
))
(declare-datatypes ((List!3166 0))(
  ( (Nil!3163) (Cons!3162 (h!3809 tuple2!4262) (t!8121 List!3166)) )
))
(declare-datatypes ((ListLongMap!3175 0))(
  ( (ListLongMap!3176 (toList!1603 List!3166)) )
))
(declare-fun contains!1444 (ListLongMap!3175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1131 (array!10519 array!10517 (_ BitVec 32) (_ BitVec 32) V!7165 V!7165 (_ BitVec 32) Int) ListLongMap!3175)

(assert (=> b!216833 (= res!106086 (contains!1444 (getCurrentListMap!1131 (_keys!6125 thiss!1504) (_values!4059 thiss!1504) (mask!9819 thiss!1504) (extraKeys!3813 thiss!1504) (zeroValue!3917 thiss!1504) (minValue!3917 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4076 thiss!1504)) key!932))))

(declare-fun b!216834 () Bool)

(declare-fun res!106084 () Bool)

(assert (=> b!216834 (=> (not res!106084) (not e!141071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10519 (_ BitVec 32)) Bool)

(assert (=> b!216834 (= res!106084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6125 thiss!1504) (mask!9819 thiss!1504)))))

(declare-fun b!216835 () Bool)

(declare-fun e!141069 () Bool)

(declare-fun e!141070 () Bool)

(declare-fun mapRes!9621 () Bool)

(assert (=> b!216835 (= e!141069 (and e!141070 mapRes!9621))))

(declare-fun condMapEmpty!9621 () Bool)

(declare-fun mapDefault!9621 () ValueCell!2476)

