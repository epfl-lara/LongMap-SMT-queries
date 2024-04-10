; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75504 () Bool)

(assert start!75504)

(declare-fun b!888467 () Bool)

(declare-fun b_free!15575 () Bool)

(declare-fun b_next!15575 () Bool)

(assert (=> b!888467 (= b_free!15575 (not b_next!15575))))

(declare-fun tp!54675 () Bool)

(declare-fun b_and!25813 () Bool)

(assert (=> b!888467 (= tp!54675 b_and!25813)))

(declare-fun mapIsEmpty!28391 () Bool)

(declare-fun mapRes!28391 () Bool)

(assert (=> mapIsEmpty!28391 mapRes!28391))

(declare-fun b!888463 () Bool)

(declare-fun e!495069 () Bool)

(declare-fun tp_is_empty!17903 () Bool)

(assert (=> b!888463 (= e!495069 tp_is_empty!17903)))

(declare-fun b!888464 () Bool)

(declare-fun res!602390 () Bool)

(declare-fun e!495074 () Bool)

(assert (=> b!888464 (=> (not res!602390) (not e!495074))))

(declare-fun key!785 () (_ BitVec 64))

(declare-datatypes ((array!51776 0))(
  ( (array!51777 (arr!24899 (Array (_ BitVec 32) (_ BitVec 64))) (size!25340 (_ BitVec 32))) )
))
(declare-datatypes ((V!28835 0))(
  ( (V!28836 (val!9002 Int)) )
))
(declare-datatypes ((ValueCell!8470 0))(
  ( (ValueCellFull!8470 (v!11477 V!28835)) (EmptyCell!8470) )
))
(declare-datatypes ((array!51778 0))(
  ( (array!51779 (arr!24900 (Array (_ BitVec 32) ValueCell!8470)) (size!25341 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3956 0))(
  ( (LongMapFixedSize!3957 (defaultEntry!5172 Int) (mask!25594 (_ BitVec 32)) (extraKeys!4866 (_ BitVec 32)) (zeroValue!4970 V!28835) (minValue!4970 V!28835) (_size!2033 (_ BitVec 32)) (_keys!9851 array!51776) (_values!5157 array!51778) (_vacant!2033 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3956)

(assert (=> b!888464 (= res!602390 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4866 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4866 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!28391 () Bool)

(declare-fun tp!54676 () Bool)

(assert (=> mapNonEmpty!28391 (= mapRes!28391 (and tp!54676 e!495069))))

(declare-fun mapRest!28391 () (Array (_ BitVec 32) ValueCell!8470))

(declare-fun mapValue!28391 () ValueCell!8470)

(declare-fun mapKey!28391 () (_ BitVec 32))

(assert (=> mapNonEmpty!28391 (= (arr!24900 (_values!5157 thiss!1181)) (store mapRest!28391 mapKey!28391 mapValue!28391))))

(declare-fun b!888465 () Bool)

(declare-fun res!602389 () Bool)

(assert (=> b!888465 (=> (not res!602389) (not e!495074))))

(declare-fun contains!4325 (LongMapFixedSize!3956 (_ BitVec 64)) Bool)

(assert (=> b!888465 (= res!602389 (contains!4325 thiss!1181 key!785))))

(declare-fun res!602388 () Bool)

(assert (=> start!75504 (=> (not res!602388) (not e!495074))))

(declare-fun valid!1543 (LongMapFixedSize!3956) Bool)

(assert (=> start!75504 (= res!602388 (valid!1543 thiss!1181))))

(assert (=> start!75504 e!495074))

(declare-fun e!495072 () Bool)

(assert (=> start!75504 e!495072))

(assert (=> start!75504 true))

(declare-fun b!888466 () Bool)

(declare-fun e!495071 () Bool)

(assert (=> b!888466 (= e!495071 tp_is_empty!17903)))

(declare-fun e!495073 () Bool)

(declare-fun array_inv!19594 (array!51776) Bool)

(declare-fun array_inv!19595 (array!51778) Bool)

(assert (=> b!888467 (= e!495072 (and tp!54675 tp_is_empty!17903 (array_inv!19594 (_keys!9851 thiss!1181)) (array_inv!19595 (_values!5157 thiss!1181)) e!495073))))

(declare-fun b!888468 () Bool)

(declare-datatypes ((Option!448 0))(
  ( (Some!447 (v!11478 V!28835)) (None!446) )
))
(declare-fun isDefined!321 (Option!448) Bool)

(declare-datatypes ((tuple2!11936 0))(
  ( (tuple2!11937 (_1!5979 (_ BitVec 64)) (_2!5979 V!28835)) )
))
(declare-datatypes ((List!17691 0))(
  ( (Nil!17688) (Cons!17687 (h!18818 tuple2!11936) (t!24988 List!17691)) )
))
(declare-fun getValueByKey!442 (List!17691 (_ BitVec 64)) Option!448)

(declare-datatypes ((ListLongMap!10633 0))(
  ( (ListLongMap!10634 (toList!5332 List!17691)) )
))
(declare-fun map!12115 (LongMapFixedSize!3956) ListLongMap!10633)

(assert (=> b!888468 (= e!495074 (not (isDefined!321 (getValueByKey!442 (toList!5332 (map!12115 thiss!1181)) key!785))))))

(declare-fun b!888469 () Bool)

(assert (=> b!888469 (= e!495073 (and e!495071 mapRes!28391))))

(declare-fun condMapEmpty!28391 () Bool)

(declare-fun mapDefault!28391 () ValueCell!8470)

