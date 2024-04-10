; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80476 () Bool)

(assert start!80476)

(declare-fun b!945247 () Bool)

(declare-fun b_free!18091 () Bool)

(declare-fun b_next!18091 () Bool)

(assert (=> b!945247 (= b_free!18091 (not b_next!18091))))

(declare-fun tp!62787 () Bool)

(declare-fun b_and!29511 () Bool)

(assert (=> b!945247 (= tp!62787 b_and!29511)))

(declare-fun e!531623 () Bool)

(declare-fun tp_is_empty!20599 () Bool)

(declare-datatypes ((V!32431 0))(
  ( (V!32432 (val!10350 Int)) )
))
(declare-datatypes ((ValueCell!9818 0))(
  ( (ValueCellFull!9818 (v!12883 V!32431)) (EmptyCell!9818) )
))
(declare-datatypes ((array!57168 0))(
  ( (array!57169 (arr!27508 (Array (_ BitVec 32) ValueCell!9818)) (size!27975 (_ BitVec 32))) )
))
(declare-datatypes ((array!57170 0))(
  ( (array!57171 (arr!27509 (Array (_ BitVec 32) (_ BitVec 64))) (size!27976 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4786 0))(
  ( (LongMapFixedSize!4787 (defaultEntry!5689 Int) (mask!27354 (_ BitVec 32)) (extraKeys!5421 (_ BitVec 32)) (zeroValue!5525 V!32431) (minValue!5525 V!32431) (_size!2448 (_ BitVec 32)) (_keys!10568 array!57170) (_values!5712 array!57168) (_vacant!2448 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4786)

(declare-fun e!531625 () Bool)

(declare-fun array_inv!21370 (array!57170) Bool)

(declare-fun array_inv!21371 (array!57168) Bool)

(assert (=> b!945247 (= e!531625 (and tp!62787 tp_is_empty!20599 (array_inv!21370 (_keys!10568 thiss!1141)) (array_inv!21371 (_values!5712 thiss!1141)) e!531623))))

(declare-fun b!945248 () Bool)

(declare-fun e!531627 () Bool)

(assert (=> b!945248 (= e!531627 tp_is_empty!20599)))

(declare-fun mapIsEmpty!32728 () Bool)

(declare-fun mapRes!32728 () Bool)

(assert (=> mapIsEmpty!32728 mapRes!32728))

(declare-fun mapNonEmpty!32728 () Bool)

(declare-fun tp!62786 () Bool)

(declare-fun e!531624 () Bool)

(assert (=> mapNonEmpty!32728 (= mapRes!32728 (and tp!62786 e!531624))))

(declare-fun mapRest!32728 () (Array (_ BitVec 32) ValueCell!9818))

(declare-fun mapKey!32728 () (_ BitVec 32))

(declare-fun mapValue!32728 () ValueCell!9818)

(assert (=> mapNonEmpty!32728 (= (arr!27508 (_values!5712 thiss!1141)) (store mapRest!32728 mapKey!32728 mapValue!32728))))

(declare-fun b!945250 () Bool)

(declare-fun res!634904 () Bool)

(declare-fun e!531622 () Bool)

(assert (=> b!945250 (=> (not res!634904) (not e!531622))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!945250 (= res!634904 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!945251 () Bool)

(declare-datatypes ((tuple2!13506 0))(
  ( (tuple2!13507 (_1!6764 (_ BitVec 64)) (_2!6764 V!32431)) )
))
(declare-datatypes ((List!19288 0))(
  ( (Nil!19285) (Cons!19284 (h!20435 tuple2!13506) (t!27607 List!19288)) )
))
(declare-datatypes ((ListLongMap!12203 0))(
  ( (ListLongMap!12204 (toList!6117 List!19288)) )
))
(declare-fun contains!5190 (ListLongMap!12203 (_ BitVec 64)) Bool)

(declare-fun map!13032 (LongMapFixedSize!4786) ListLongMap!12203)

(assert (=> b!945251 (= e!531622 (not (= (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (contains!5190 (map!13032 thiss!1141) key!756))))))

(declare-fun b!945252 () Bool)

(assert (=> b!945252 (= e!531623 (and e!531627 mapRes!32728))))

(declare-fun condMapEmpty!32728 () Bool)

(declare-fun mapDefault!32728 () ValueCell!9818)

