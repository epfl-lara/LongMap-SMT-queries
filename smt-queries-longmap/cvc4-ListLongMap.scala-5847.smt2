; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75560 () Bool)

(assert start!75560)

(declare-fun b!888790 () Bool)

(declare-fun b_free!15587 () Bool)

(declare-fun b_next!15587 () Bool)

(assert (=> b!888790 (= b_free!15587 (not b_next!15587))))

(declare-fun tp!54715 () Bool)

(declare-fun b_and!25827 () Bool)

(assert (=> b!888790 (= tp!54715 b_and!25827)))

(declare-fun res!602485 () Bool)

(declare-fun e!495306 () Bool)

(assert (=> start!75560 (=> (not res!602485) (not e!495306))))

(declare-datatypes ((array!51802 0))(
  ( (array!51803 (arr!24911 (Array (_ BitVec 32) (_ BitVec 64))) (size!25353 (_ BitVec 32))) )
))
(declare-datatypes ((V!28851 0))(
  ( (V!28852 (val!9008 Int)) )
))
(declare-datatypes ((ValueCell!8476 0))(
  ( (ValueCellFull!8476 (v!11484 V!28851)) (EmptyCell!8476) )
))
(declare-datatypes ((array!51804 0))(
  ( (array!51805 (arr!24912 (Array (_ BitVec 32) ValueCell!8476)) (size!25354 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3968 0))(
  ( (LongMapFixedSize!3969 (defaultEntry!5181 Int) (mask!25611 (_ BitVec 32)) (extraKeys!4875 (_ BitVec 32)) (zeroValue!4979 V!28851) (minValue!4979 V!28851) (_size!2039 (_ BitVec 32)) (_keys!9862 array!51802) (_values!5166 array!51804) (_vacant!2039 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3968)

(declare-fun valid!1548 (LongMapFixedSize!3968) Bool)

(assert (=> start!75560 (= res!602485 (valid!1548 thiss!1181))))

(assert (=> start!75560 e!495306))

(declare-fun e!495308 () Bool)

(assert (=> start!75560 e!495308))

(assert (=> start!75560 true))

(declare-fun e!495310 () Bool)

(declare-fun tp_is_empty!17915 () Bool)

(declare-fun array_inv!19602 (array!51802) Bool)

(declare-fun array_inv!19603 (array!51804) Bool)

(assert (=> b!888790 (= e!495308 (and tp!54715 tp_is_empty!17915 (array_inv!19602 (_keys!9862 thiss!1181)) (array_inv!19603 (_values!5166 thiss!1181)) e!495310))))

(declare-fun b!888791 () Bool)

(declare-fun e!495307 () Bool)

(assert (=> b!888791 (= e!495307 tp_is_empty!17915)))

(declare-fun b!888792 () Bool)

(assert (=> b!888792 (= e!495306 false)))

(declare-fun lt!401923 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4330 (LongMapFixedSize!3968 (_ BitVec 64)) Bool)

(assert (=> b!888792 (= lt!401923 (contains!4330 thiss!1181 key!785))))

(declare-fun b!888793 () Bool)

(declare-fun res!602486 () Bool)

(assert (=> b!888793 (=> (not res!602486) (not e!495306))))

(assert (=> b!888793 (= res!602486 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4875 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (or (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4875 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!28413 () Bool)

(declare-fun mapRes!28413 () Bool)

(assert (=> mapIsEmpty!28413 mapRes!28413))

(declare-fun mapNonEmpty!28413 () Bool)

(declare-fun tp!54716 () Bool)

(assert (=> mapNonEmpty!28413 (= mapRes!28413 (and tp!54716 e!495307))))

(declare-fun mapValue!28413 () ValueCell!8476)

(declare-fun mapKey!28413 () (_ BitVec 32))

(declare-fun mapRest!28413 () (Array (_ BitVec 32) ValueCell!8476))

(assert (=> mapNonEmpty!28413 (= (arr!24912 (_values!5166 thiss!1181)) (store mapRest!28413 mapKey!28413 mapValue!28413))))

(declare-fun b!888794 () Bool)

(declare-fun e!495311 () Bool)

(assert (=> b!888794 (= e!495311 tp_is_empty!17915)))

(declare-fun b!888795 () Bool)

(assert (=> b!888795 (= e!495310 (and e!495311 mapRes!28413))))

(declare-fun condMapEmpty!28413 () Bool)

(declare-fun mapDefault!28413 () ValueCell!8476)

