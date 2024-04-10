; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80392 () Bool)

(assert start!80392)

(declare-fun b!944212 () Bool)

(declare-fun b_free!18035 () Bool)

(declare-fun b_next!18035 () Bool)

(assert (=> b!944212 (= b_free!18035 (not b_next!18035))))

(declare-fun tp!62615 () Bool)

(declare-fun b_and!29453 () Bool)

(assert (=> b!944212 (= tp!62615 b_and!29453)))

(declare-fun b!944205 () Bool)

(declare-fun res!634306 () Bool)

(declare-fun e!530948 () Bool)

(assert (=> b!944205 (=> (not res!634306) (not e!530948))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!944205 (= res!634306 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944206 () Bool)

(declare-fun res!634309 () Bool)

(assert (=> b!944206 (=> (not res!634309) (not e!530948))))

(declare-datatypes ((V!32355 0))(
  ( (V!32356 (val!10322 Int)) )
))
(declare-datatypes ((ValueCell!9790 0))(
  ( (ValueCellFull!9790 (v!12854 V!32355)) (EmptyCell!9790) )
))
(declare-datatypes ((array!57054 0))(
  ( (array!57055 (arr!27452 (Array (_ BitVec 32) ValueCell!9790)) (size!27918 (_ BitVec 32))) )
))
(declare-datatypes ((array!57056 0))(
  ( (array!57057 (arr!27453 (Array (_ BitVec 32) (_ BitVec 64))) (size!27919 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4730 0))(
  ( (LongMapFixedSize!4731 (defaultEntry!5660 Int) (mask!27304 (_ BitVec 32)) (extraKeys!5392 (_ BitVec 32)) (zeroValue!5496 V!32355) (minValue!5496 V!32355) (_size!2420 (_ BitVec 32)) (_keys!10538 array!57056) (_values!5683 array!57054) (_vacant!2420 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4730)

(declare-datatypes ((tuple2!13464 0))(
  ( (tuple2!13465 (_1!6743 (_ BitVec 64)) (_2!6743 V!32355)) )
))
(declare-datatypes ((List!19266 0))(
  ( (Nil!19263) (Cons!19262 (h!20413 tuple2!13464) (t!27583 List!19266)) )
))
(declare-datatypes ((ListLongMap!12161 0))(
  ( (ListLongMap!12162 (toList!6096 List!19266)) )
))
(declare-fun contains!5168 (ListLongMap!12161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3330 (array!57056 array!57054 (_ BitVec 32) (_ BitVec 32) V!32355 V!32355 (_ BitVec 32) Int) ListLongMap!12161)

(assert (=> b!944206 (= res!634309 (contains!5168 (getCurrentListMap!3330 (_keys!10538 thiss!1141) (_values!5683 thiss!1141) (mask!27304 thiss!1141) (extraKeys!5392 thiss!1141) (zeroValue!5496 thiss!1141) (minValue!5496 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5660 thiss!1141)) key!756))))

(declare-fun b!944207 () Bool)

(declare-fun e!530947 () Bool)

(declare-fun tp_is_empty!20543 () Bool)

(assert (=> b!944207 (= e!530947 tp_is_empty!20543)))

(declare-fun mapIsEmpty!32640 () Bool)

(declare-fun mapRes!32640 () Bool)

(assert (=> mapIsEmpty!32640 mapRes!32640))

(declare-fun b!944208 () Bool)

(declare-fun e!530949 () Bool)

(assert (=> b!944208 (= e!530949 true)))

(declare-fun lt!425558 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57056 (_ BitVec 32)) Bool)

(assert (=> b!944208 (= lt!425558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10538 thiss!1141) (mask!27304 thiss!1141)))))

(declare-fun b!944209 () Bool)

(declare-fun res!634307 () Bool)

(assert (=> b!944209 (=> res!634307 e!530949)))

(declare-fun lt!425557 () (_ BitVec 32))

(assert (=> b!944209 (= res!634307 (or (not (= (size!27919 (_keys!10538 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27304 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27919 (_keys!10538 thiss!1141))) (bvslt lt!425557 #b00000000000000000000000000000000) (bvsgt lt!425557 (size!27919 (_keys!10538 thiss!1141)))))))

(declare-fun res!634310 () Bool)

(assert (=> start!80392 (=> (not res!634310) (not e!530948))))

(declare-fun valid!1808 (LongMapFixedSize!4730) Bool)

(assert (=> start!80392 (= res!634310 (valid!1808 thiss!1141))))

(assert (=> start!80392 e!530948))

(declare-fun e!530950 () Bool)

(assert (=> start!80392 e!530950))

(assert (=> start!80392 true))

(declare-fun b!944210 () Bool)

(declare-fun res!634311 () Bool)

(assert (=> b!944210 (=> (not res!634311) (not e!530948))))

(declare-datatypes ((SeekEntryResult!9062 0))(
  ( (MissingZero!9062 (index!38619 (_ BitVec 32))) (Found!9062 (index!38620 (_ BitVec 32))) (Intermediate!9062 (undefined!9874 Bool) (index!38621 (_ BitVec 32)) (x!81089 (_ BitVec 32))) (Undefined!9062) (MissingVacant!9062 (index!38622 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57056 (_ BitVec 32)) SeekEntryResult!9062)

(assert (=> b!944210 (= res!634311 (not (is-Found!9062 (seekEntry!0 key!756 (_keys!10538 thiss!1141) (mask!27304 thiss!1141)))))))

(declare-fun mapNonEmpty!32640 () Bool)

(declare-fun tp!62614 () Bool)

(declare-fun e!530944 () Bool)

(assert (=> mapNonEmpty!32640 (= mapRes!32640 (and tp!62614 e!530944))))

(declare-fun mapValue!32640 () ValueCell!9790)

(declare-fun mapRest!32640 () (Array (_ BitVec 32) ValueCell!9790))

(declare-fun mapKey!32640 () (_ BitVec 32))

(assert (=> mapNonEmpty!32640 (= (arr!27452 (_values!5683 thiss!1141)) (store mapRest!32640 mapKey!32640 mapValue!32640))))

(declare-fun b!944211 () Bool)

(assert (=> b!944211 (= e!530944 tp_is_empty!20543)))

(declare-fun e!530945 () Bool)

(declare-fun array_inv!21330 (array!57056) Bool)

(declare-fun array_inv!21331 (array!57054) Bool)

(assert (=> b!944212 (= e!530950 (and tp!62615 tp_is_empty!20543 (array_inv!21330 (_keys!10538 thiss!1141)) (array_inv!21331 (_values!5683 thiss!1141)) e!530945))))

(declare-fun b!944213 () Bool)

(assert (=> b!944213 (= e!530945 (and e!530947 mapRes!32640))))

(declare-fun condMapEmpty!32640 () Bool)

(declare-fun mapDefault!32640 () ValueCell!9790)

