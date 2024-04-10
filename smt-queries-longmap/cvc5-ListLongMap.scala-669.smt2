; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16518 () Bool)

(assert start!16518)

(declare-fun b!164219 () Bool)

(declare-fun b_free!3823 () Bool)

(declare-fun b_next!3823 () Bool)

(assert (=> b!164219 (= b_free!3823 (not b_next!3823))))

(declare-fun tp!14069 () Bool)

(declare-fun b_and!10237 () Bool)

(assert (=> b!164219 (= tp!14069 b_and!10237)))

(declare-fun b!164216 () Bool)

(declare-fun res!77713 () Bool)

(declare-fun e!107748 () Bool)

(assert (=> b!164216 (=> (not res!77713) (not e!107748))))

(declare-datatypes ((V!4481 0))(
  ( (V!4482 (val!1857 Int)) )
))
(declare-datatypes ((ValueCell!1469 0))(
  ( (ValueCellFull!1469 (v!3722 V!4481)) (EmptyCell!1469) )
))
(declare-datatypes ((array!6347 0))(
  ( (array!6348 (arr!3009 (Array (_ BitVec 32) (_ BitVec 64))) (size!3297 (_ BitVec 32))) )
))
(declare-datatypes ((array!6349 0))(
  ( (array!6350 (arr!3010 (Array (_ BitVec 32) ValueCell!1469)) (size!3298 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1846 0))(
  ( (LongMapFixedSize!1847 (defaultEntry!3365 Int) (mask!8052 (_ BitVec 32)) (extraKeys!3106 (_ BitVec 32)) (zeroValue!3208 V!4481) (minValue!3208 V!4481) (_size!972 (_ BitVec 32)) (_keys!5190 array!6347) (_values!3348 array!6349) (_vacant!972 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1846)

(assert (=> b!164216 (= res!77713 (and (= (size!3298 (_values!3348 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8052 thiss!1248))) (= (size!3297 (_keys!5190 thiss!1248)) (size!3298 (_values!3348 thiss!1248))) (bvsge (mask!8052 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3106 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3106 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164217 () Bool)

(declare-fun res!77715 () Bool)

(declare-fun e!107744 () Bool)

(assert (=> b!164217 (=> (not res!77715) (not e!107744))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!164217 (= res!77715 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6156 () Bool)

(declare-fun mapRes!6156 () Bool)

(declare-fun tp!14070 () Bool)

(declare-fun e!107745 () Bool)

(assert (=> mapNonEmpty!6156 (= mapRes!6156 (and tp!14070 e!107745))))

(declare-fun mapKey!6156 () (_ BitVec 32))

(declare-fun mapValue!6156 () ValueCell!1469)

(declare-fun mapRest!6156 () (Array (_ BitVec 32) ValueCell!1469))

(assert (=> mapNonEmpty!6156 (= (arr!3010 (_values!3348 thiss!1248)) (store mapRest!6156 mapKey!6156 mapValue!6156))))

(declare-fun b!164218 () Bool)

(declare-fun e!107746 () Bool)

(declare-fun tp_is_empty!3625 () Bool)

(assert (=> b!164218 (= e!107746 tp_is_empty!3625)))

(declare-fun e!107750 () Bool)

(declare-fun e!107747 () Bool)

(declare-fun array_inv!1925 (array!6347) Bool)

(declare-fun array_inv!1926 (array!6349) Bool)

(assert (=> b!164219 (= e!107747 (and tp!14069 tp_is_empty!3625 (array_inv!1925 (_keys!5190 thiss!1248)) (array_inv!1926 (_values!3348 thiss!1248)) e!107750))))

(declare-fun mapIsEmpty!6156 () Bool)

(assert (=> mapIsEmpty!6156 mapRes!6156))

(declare-fun b!164220 () Bool)

(assert (=> b!164220 (= e!107745 tp_is_empty!3625)))

(declare-fun b!164221 () Bool)

(declare-fun res!77712 () Bool)

(assert (=> b!164221 (=> (not res!77712) (not e!107748))))

(declare-datatypes ((tuple2!3014 0))(
  ( (tuple2!3015 (_1!1518 (_ BitVec 64)) (_2!1518 V!4481)) )
))
(declare-datatypes ((List!1997 0))(
  ( (Nil!1994) (Cons!1993 (h!2610 tuple2!3014) (t!6799 List!1997)) )
))
(declare-datatypes ((ListLongMap!1969 0))(
  ( (ListLongMap!1970 (toList!1000 List!1997)) )
))
(declare-fun contains!1042 (ListLongMap!1969 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!658 (array!6347 array!6349 (_ BitVec 32) (_ BitVec 32) V!4481 V!4481 (_ BitVec 32) Int) ListLongMap!1969)

(assert (=> b!164221 (= res!77712 (contains!1042 (getCurrentListMap!658 (_keys!5190 thiss!1248) (_values!3348 thiss!1248) (mask!8052 thiss!1248) (extraKeys!3106 thiss!1248) (zeroValue!3208 thiss!1248) (minValue!3208 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3365 thiss!1248)) key!828))))

(declare-fun b!164222 () Bool)

(assert (=> b!164222 (= e!107750 (and e!107746 mapRes!6156))))

(declare-fun condMapEmpty!6156 () Bool)

(declare-fun mapDefault!6156 () ValueCell!1469)

