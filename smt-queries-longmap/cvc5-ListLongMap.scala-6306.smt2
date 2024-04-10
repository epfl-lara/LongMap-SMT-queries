; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80768 () Bool)

(assert start!80768)

(declare-fun b!947013 () Bool)

(declare-fun b_free!18157 () Bool)

(declare-fun b_next!18157 () Bool)

(assert (=> b!947013 (= b_free!18157 (not b_next!18157))))

(declare-fun tp!63023 () Bool)

(declare-fun b_and!29579 () Bool)

(assert (=> b!947013 (= tp!63023 b_and!29579)))

(declare-fun b!947010 () Bool)

(declare-fun res!635617 () Bool)

(declare-fun e!532945 () Bool)

(assert (=> b!947010 (=> res!635617 e!532945)))

(declare-datatypes ((V!32519 0))(
  ( (V!32520 (val!10383 Int)) )
))
(declare-datatypes ((ValueCell!9851 0))(
  ( (ValueCellFull!9851 (v!12917 V!32519)) (EmptyCell!9851) )
))
(declare-datatypes ((array!57322 0))(
  ( (array!57323 (arr!27574 (Array (_ BitVec 32) ValueCell!9851)) (size!28047 (_ BitVec 32))) )
))
(declare-datatypes ((array!57324 0))(
  ( (array!57325 (arr!27575 (Array (_ BitVec 32) (_ BitVec 64))) (size!28048 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4852 0))(
  ( (LongMapFixedSize!4853 (defaultEntry!5723 Int) (mask!27448 (_ BitVec 32)) (extraKeys!5455 (_ BitVec 32)) (zeroValue!5559 V!32519) (minValue!5559 V!32519) (_size!2481 (_ BitVec 32)) (_keys!10628 array!57324) (_values!5746 array!57322) (_vacant!2481 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4852)

(assert (=> b!947010 (= res!635617 (or (not (= (size!28047 (_values!5746 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27448 thiss!1141)))) (not (= (size!28048 (_keys!10628 thiss!1141)) (size!28047 (_values!5746 thiss!1141)))) (bvslt (mask!27448 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5455 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5455 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!947011 () Bool)

(declare-fun res!635620 () Bool)

(declare-fun e!532943 () Bool)

(assert (=> b!947011 (=> (not res!635620) (not e!532943))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!947011 (= res!635620 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32866 () Bool)

(declare-fun mapRes!32866 () Bool)

(declare-fun tp!63024 () Bool)

(declare-fun e!532941 () Bool)

(assert (=> mapNonEmpty!32866 (= mapRes!32866 (and tp!63024 e!532941))))

(declare-fun mapRest!32866 () (Array (_ BitVec 32) ValueCell!9851))

(declare-fun mapValue!32866 () ValueCell!9851)

(declare-fun mapKey!32866 () (_ BitVec 32))

(assert (=> mapNonEmpty!32866 (= (arr!27574 (_values!5746 thiss!1141)) (store mapRest!32866 mapKey!32866 mapValue!32866))))

(declare-fun b!947012 () Bool)

(declare-fun e!532939 () Bool)

(assert (=> b!947012 (= e!532939 (not e!532945))))

(declare-fun res!635619 () Bool)

(assert (=> b!947012 (=> res!635619 e!532945)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947012 (= res!635619 (not (validMask!0 (mask!27448 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947012 (arrayContainsKey!0 (_keys!10628 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31912 0))(
  ( (Unit!31913) )
))
(declare-fun lt!426462 () Unit!31912)

(declare-datatypes ((SeekEntryResult!9107 0))(
  ( (MissingZero!9107 (index!38799 (_ BitVec 32))) (Found!9107 (index!38800 (_ BitVec 32))) (Intermediate!9107 (undefined!9919 Bool) (index!38801 (_ BitVec 32)) (x!81459 (_ BitVec 32))) (Undefined!9107) (MissingVacant!9107 (index!38802 (_ BitVec 32))) )
))
(declare-fun lt!426461 () SeekEntryResult!9107)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57324 (_ BitVec 64) (_ BitVec 32)) Unit!31912)

(assert (=> b!947012 (= lt!426462 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10628 thiss!1141) key!756 (index!38800 lt!426461)))))

(declare-fun res!635618 () Bool)

(assert (=> start!80768 (=> (not res!635618) (not e!532943))))

(declare-fun valid!1848 (LongMapFixedSize!4852) Bool)

(assert (=> start!80768 (= res!635618 (valid!1848 thiss!1141))))

(assert (=> start!80768 e!532943))

(declare-fun e!532944 () Bool)

(assert (=> start!80768 e!532944))

(assert (=> start!80768 true))

(declare-fun e!532942 () Bool)

(declare-fun tp_is_empty!20665 () Bool)

(declare-fun array_inv!21406 (array!57324) Bool)

(declare-fun array_inv!21407 (array!57322) Bool)

(assert (=> b!947013 (= e!532944 (and tp!63023 tp_is_empty!20665 (array_inv!21406 (_keys!10628 thiss!1141)) (array_inv!21407 (_values!5746 thiss!1141)) e!532942))))

(declare-fun b!947014 () Bool)

(declare-fun e!532946 () Bool)

(assert (=> b!947014 (= e!532946 tp_is_empty!20665)))

(declare-fun b!947015 () Bool)

(assert (=> b!947015 (= e!532943 e!532939)))

(declare-fun res!635616 () Bool)

(assert (=> b!947015 (=> (not res!635616) (not e!532939))))

(assert (=> b!947015 (= res!635616 (is-Found!9107 lt!426461))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57324 (_ BitVec 32)) SeekEntryResult!9107)

(assert (=> b!947015 (= lt!426461 (seekEntry!0 key!756 (_keys!10628 thiss!1141) (mask!27448 thiss!1141)))))

(declare-fun b!947016 () Bool)

(assert (=> b!947016 (= e!532942 (and e!532946 mapRes!32866))))

(declare-fun condMapEmpty!32866 () Bool)

(declare-fun mapDefault!32866 () ValueCell!9851)

