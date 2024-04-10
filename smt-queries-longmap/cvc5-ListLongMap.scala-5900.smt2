; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76264 () Bool)

(assert start!76264)

(declare-fun b!895271 () Bool)

(declare-fun b_free!15901 () Bool)

(declare-fun b_next!15901 () Bool)

(assert (=> b!895271 (= b_free!15901 (not b_next!15901))))

(declare-fun tp!55709 () Bool)

(declare-fun b_and!26193 () Bool)

(assert (=> b!895271 (= tp!55709 b_and!26193)))

(declare-fun b!895269 () Bool)

(declare-fun e!500190 () Bool)

(declare-fun e!500189 () Bool)

(assert (=> b!895269 (= e!500190 e!500189)))

(declare-fun res!605647 () Bool)

(assert (=> b!895269 (=> (not res!605647) (not e!500189))))

(declare-datatypes ((array!52458 0))(
  ( (array!52459 (arr!25225 (Array (_ BitVec 32) (_ BitVec 64))) (size!25674 (_ BitVec 32))) )
))
(declare-datatypes ((V!29271 0))(
  ( (V!29272 (val!9165 Int)) )
))
(declare-datatypes ((ValueCell!8633 0))(
  ( (ValueCellFull!8633 (v!11655 V!29271)) (EmptyCell!8633) )
))
(declare-datatypes ((array!52460 0))(
  ( (array!52461 (arr!25226 (Array (_ BitVec 32) ValueCell!8633)) (size!25675 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4282 0))(
  ( (LongMapFixedSize!4283 (defaultEntry!5353 Int) (mask!25944 (_ BitVec 32)) (extraKeys!5049 (_ BitVec 32)) (zeroValue!5153 V!29271) (minValue!5153 V!29271) (_size!2196 (_ BitVec 32)) (_keys!10064 array!52458) (_values!5340 array!52460) (_vacant!2196 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4282)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895269 (= res!605647 (validMask!0 (mask!25944 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8877 0))(
  ( (MissingZero!8877 (index!37879 (_ BitVec 32))) (Found!8877 (index!37880 (_ BitVec 32))) (Intermediate!8877 (undefined!9689 Bool) (index!37881 (_ BitVec 32)) (x!76164 (_ BitVec 32))) (Undefined!8877) (MissingVacant!8877 (index!37882 (_ BitVec 32))) )
))
(declare-fun lt!404482 () SeekEntryResult!8877)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52458 (_ BitVec 32)) SeekEntryResult!8877)

(assert (=> b!895269 (= lt!404482 (seekEntry!0 key!785 (_keys!10064 thiss!1181) (mask!25944 thiss!1181)))))

(declare-fun b!895270 () Bool)

(declare-fun e!500192 () Bool)

(declare-fun tp_is_empty!18229 () Bool)

(assert (=> b!895270 (= e!500192 tp_is_empty!18229)))

(declare-fun e!500188 () Bool)

(declare-fun e!500193 () Bool)

(declare-fun array_inv!19804 (array!52458) Bool)

(declare-fun array_inv!19805 (array!52460) Bool)

(assert (=> b!895271 (= e!500193 (and tp!55709 tp_is_empty!18229 (array_inv!19804 (_keys!10064 thiss!1181)) (array_inv!19805 (_values!5340 thiss!1181)) e!500188))))

(declare-fun b!895272 () Bool)

(declare-fun e!500187 () Bool)

(assert (=> b!895272 (= e!500187 tp_is_empty!18229)))

(declare-fun res!605645 () Bool)

(assert (=> start!76264 (=> (not res!605645) (not e!500190))))

(declare-fun valid!1652 (LongMapFixedSize!4282) Bool)

(assert (=> start!76264 (= res!605645 (valid!1652 thiss!1181))))

(assert (=> start!76264 e!500190))

(assert (=> start!76264 e!500193))

(assert (=> start!76264 true))

(declare-fun mapNonEmpty!28935 () Bool)

(declare-fun mapRes!28935 () Bool)

(declare-fun tp!55708 () Bool)

(assert (=> mapNonEmpty!28935 (= mapRes!28935 (and tp!55708 e!500192))))

(declare-fun mapKey!28935 () (_ BitVec 32))

(declare-fun mapValue!28935 () ValueCell!8633)

(declare-fun mapRest!28935 () (Array (_ BitVec 32) ValueCell!8633))

(assert (=> mapNonEmpty!28935 (= (arr!25226 (_values!5340 thiss!1181)) (store mapRest!28935 mapKey!28935 mapValue!28935))))

(declare-fun b!895273 () Bool)

(declare-fun res!605646 () Bool)

(assert (=> b!895273 (=> (not res!605646) (not e!500190))))

(assert (=> b!895273 (= res!605646 (not (= key!785 (bvneg key!785))))))

(declare-fun b!895274 () Bool)

(assert (=> b!895274 (= e!500189 (and (= (size!25675 (_values!5340 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25944 thiss!1181))) (= (size!25674 (_keys!10064 thiss!1181)) (size!25675 (_values!5340 thiss!1181))) (bvsge (mask!25944 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5049 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5049 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28935 () Bool)

(assert (=> mapIsEmpty!28935 mapRes!28935))

(declare-fun b!895275 () Bool)

(assert (=> b!895275 (= e!500188 (and e!500187 mapRes!28935))))

(declare-fun condMapEmpty!28935 () Bool)

(declare-fun mapDefault!28935 () ValueCell!8633)

