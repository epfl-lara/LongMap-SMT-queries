; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80528 () Bool)

(assert start!80528)

(declare-fun b!945594 () Bool)

(declare-fun b_free!18107 () Bool)

(declare-fun b_next!18107 () Bool)

(assert (=> b!945594 (= b_free!18107 (not b_next!18107))))

(declare-fun tp!62841 () Bool)

(declare-fun b_and!29529 () Bool)

(assert (=> b!945594 (= tp!62841 b_and!29529)))

(declare-fun mapNonEmpty!32759 () Bool)

(declare-fun mapRes!32759 () Bool)

(declare-fun tp!62842 () Bool)

(declare-fun e!531888 () Bool)

(assert (=> mapNonEmpty!32759 (= mapRes!32759 (and tp!62842 e!531888))))

(declare-datatypes ((V!32451 0))(
  ( (V!32452 (val!10358 Int)) )
))
(declare-datatypes ((ValueCell!9826 0))(
  ( (ValueCellFull!9826 (v!12892 V!32451)) (EmptyCell!9826) )
))
(declare-fun mapRest!32759 () (Array (_ BitVec 32) ValueCell!9826))

(declare-datatypes ((array!57204 0))(
  ( (array!57205 (arr!27524 (Array (_ BitVec 32) ValueCell!9826)) (size!27992 (_ BitVec 32))) )
))
(declare-datatypes ((array!57206 0))(
  ( (array!57207 (arr!27525 (Array (_ BitVec 32) (_ BitVec 64))) (size!27993 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4802 0))(
  ( (LongMapFixedSize!4803 (defaultEntry!5698 Int) (mask!27369 (_ BitVec 32)) (extraKeys!5430 (_ BitVec 32)) (zeroValue!5534 V!32451) (minValue!5534 V!32451) (_size!2456 (_ BitVec 32)) (_keys!10579 array!57206) (_values!5721 array!57204) (_vacant!2456 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4802)

(declare-fun mapValue!32759 () ValueCell!9826)

(declare-fun mapKey!32759 () (_ BitVec 32))

(assert (=> mapNonEmpty!32759 (= (arr!27524 (_values!5721 thiss!1141)) (store mapRest!32759 mapKey!32759 mapValue!32759))))

(declare-fun b!945591 () Bool)

(declare-fun res!635036 () Bool)

(declare-fun e!531886 () Bool)

(assert (=> b!945591 (=> (not res!635036) (not e!531886))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!945591 (= res!635036 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945592 () Bool)

(declare-fun e!531890 () Bool)

(declare-fun tp_is_empty!20615 () Bool)

(assert (=> b!945592 (= e!531890 tp_is_empty!20615)))

(declare-fun res!635037 () Bool)

(assert (=> start!80528 (=> (not res!635037) (not e!531886))))

(declare-fun valid!1835 (LongMapFixedSize!4802) Bool)

(assert (=> start!80528 (= res!635037 (valid!1835 thiss!1141))))

(assert (=> start!80528 e!531886))

(declare-fun e!531889 () Bool)

(assert (=> start!80528 e!531889))

(assert (=> start!80528 true))

(declare-fun b!945593 () Bool)

(declare-datatypes ((SeekEntryResult!9090 0))(
  ( (MissingZero!9090 (index!38731 (_ BitVec 32))) (Found!9090 (index!38732 (_ BitVec 32))) (Intermediate!9090 (undefined!9902 Bool) (index!38733 (_ BitVec 32)) (x!81253 (_ BitVec 32))) (Undefined!9090) (MissingVacant!9090 (index!38734 (_ BitVec 32))) )
))
(declare-fun lt!426054 () SeekEntryResult!9090)

(assert (=> b!945593 (= e!531886 (and (is-Found!9090 lt!426054) (bvsge (index!38732 lt!426054) #b00000000000000000000000000000000) (bvsge (index!38732 lt!426054) (size!27993 (_keys!10579 thiss!1141)))))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57206 (_ BitVec 32)) SeekEntryResult!9090)

(assert (=> b!945593 (= lt!426054 (seekEntry!0 key!756 (_keys!10579 thiss!1141) (mask!27369 thiss!1141)))))

(declare-fun e!531887 () Bool)

(declare-fun array_inv!21380 (array!57206) Bool)

(declare-fun array_inv!21381 (array!57204) Bool)

(assert (=> b!945594 (= e!531889 (and tp!62841 tp_is_empty!20615 (array_inv!21380 (_keys!10579 thiss!1141)) (array_inv!21381 (_values!5721 thiss!1141)) e!531887))))

(declare-fun mapIsEmpty!32759 () Bool)

(assert (=> mapIsEmpty!32759 mapRes!32759))

(declare-fun b!945595 () Bool)

(assert (=> b!945595 (= e!531887 (and e!531890 mapRes!32759))))

(declare-fun condMapEmpty!32759 () Bool)

(declare-fun mapDefault!32759 () ValueCell!9826)

