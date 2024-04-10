; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17588 () Bool)

(assert start!17588)

(declare-fun b!175990 () Bool)

(declare-fun b_free!4345 () Bool)

(declare-fun b_next!4345 () Bool)

(assert (=> b!175990 (= b_free!4345 (not b_next!4345))))

(declare-fun tp!15722 () Bool)

(declare-fun b_and!10833 () Bool)

(assert (=> b!175990 (= tp!15722 b_and!10833)))

(declare-fun b!175987 () Bool)

(declare-fun res!83411 () Bool)

(declare-fun e!116134 () Bool)

(assert (=> b!175987 (=> (not res!83411) (not e!116134))))

(declare-datatypes ((V!5137 0))(
  ( (V!5138 (val!2103 Int)) )
))
(declare-datatypes ((ValueCell!1715 0))(
  ( (ValueCellFull!1715 (v!3979 V!5137)) (EmptyCell!1715) )
))
(declare-datatypes ((array!7377 0))(
  ( (array!7378 (arr!3501 (Array (_ BitVec 32) (_ BitVec 64))) (size!3804 (_ BitVec 32))) )
))
(declare-datatypes ((array!7379 0))(
  ( (array!7380 (arr!3502 (Array (_ BitVec 32) ValueCell!1715)) (size!3805 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2338 0))(
  ( (LongMapFixedSize!2339 (defaultEntry!3627 Int) (mask!8536 (_ BitVec 32)) (extraKeys!3364 (_ BitVec 32)) (zeroValue!3468 V!5137) (minValue!3468 V!5137) (_size!1218 (_ BitVec 32)) (_keys!5484 array!7377) (_values!3610 array!7379) (_vacant!1218 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2338)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3270 0))(
  ( (tuple2!3271 (_1!1646 (_ BitVec 64)) (_2!1646 V!5137)) )
))
(declare-datatypes ((List!2227 0))(
  ( (Nil!2224) (Cons!2223 (h!2843 tuple2!3270) (t!7049 List!2227)) )
))
(declare-datatypes ((ListLongMap!2197 0))(
  ( (ListLongMap!2198 (toList!1114 List!2227)) )
))
(declare-fun contains!1176 (ListLongMap!2197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!766 (array!7377 array!7379 (_ BitVec 32) (_ BitVec 32) V!5137 V!5137 (_ BitVec 32) Int) ListLongMap!2197)

(assert (=> b!175987 (= res!83411 (contains!1176 (getCurrentListMap!766 (_keys!5484 thiss!1248) (_values!3610 thiss!1248) (mask!8536 thiss!1248) (extraKeys!3364 thiss!1248) (zeroValue!3468 thiss!1248) (minValue!3468 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3627 thiss!1248)) key!828))))

(declare-fun b!175988 () Bool)

(declare-fun e!116137 () Bool)

(declare-fun e!116138 () Bool)

(declare-fun mapRes!7025 () Bool)

(assert (=> b!175988 (= e!116137 (and e!116138 mapRes!7025))))

(declare-fun condMapEmpty!7025 () Bool)

(declare-fun mapDefault!7025 () ValueCell!1715)

