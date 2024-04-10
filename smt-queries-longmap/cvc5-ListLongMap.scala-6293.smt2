; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80436 () Bool)

(assert start!80436)

(declare-fun b!944959 () Bool)

(declare-fun b_free!18079 () Bool)

(declare-fun b_next!18079 () Bool)

(assert (=> b!944959 (= b_free!18079 (not b_next!18079))))

(declare-fun tp!62747 () Bool)

(declare-fun b_and!29497 () Bool)

(assert (=> b!944959 (= tp!62747 b_and!29497)))

(declare-fun b!944953 () Bool)

(declare-fun e!531406 () Bool)

(declare-fun tp_is_empty!20587 () Bool)

(assert (=> b!944953 (= e!531406 tp_is_empty!20587)))

(declare-fun b!944954 () Bool)

(declare-datatypes ((Unit!31874 0))(
  ( (Unit!31875) )
))
(declare-fun e!531408 () Unit!31874)

(declare-fun Unit!31876 () Unit!31874)

(assert (=> b!944954 (= e!531408 Unit!31876)))

(declare-fun b!944955 () Bool)

(declare-fun res!634788 () Bool)

(declare-fun e!531411 () Bool)

(assert (=> b!944955 (=> (not res!634788) (not e!531411))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32415 0))(
  ( (V!32416 (val!10344 Int)) )
))
(declare-datatypes ((ValueCell!9812 0))(
  ( (ValueCellFull!9812 (v!12876 V!32415)) (EmptyCell!9812) )
))
(declare-datatypes ((array!57142 0))(
  ( (array!57143 (arr!27496 (Array (_ BitVec 32) ValueCell!9812)) (size!27962 (_ BitVec 32))) )
))
(declare-datatypes ((array!57144 0))(
  ( (array!57145 (arr!27497 (Array (_ BitVec 32) (_ BitVec 64))) (size!27963 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4774 0))(
  ( (LongMapFixedSize!4775 (defaultEntry!5682 Int) (mask!27342 (_ BitVec 32)) (extraKeys!5414 (_ BitVec 32)) (zeroValue!5518 V!32415) (minValue!5518 V!32415) (_size!2442 (_ BitVec 32)) (_keys!10560 array!57144) (_values!5705 array!57142) (_vacant!2442 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4774)

(declare-datatypes ((SeekEntryResult!9081 0))(
  ( (MissingZero!9081 (index!38695 (_ BitVec 32))) (Found!9081 (index!38696 (_ BitVec 32))) (Intermediate!9081 (undefined!9893 Bool) (index!38697 (_ BitVec 32)) (x!81172 (_ BitVec 32))) (Undefined!9081) (MissingVacant!9081 (index!38698 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57144 (_ BitVec 32)) SeekEntryResult!9081)

(assert (=> b!944955 (= res!634788 (not (is-Found!9081 (seekEntry!0 key!756 (_keys!10560 thiss!1141) (mask!27342 thiss!1141)))))))

(declare-fun mapIsEmpty!32706 () Bool)

(declare-fun mapRes!32706 () Bool)

(assert (=> mapIsEmpty!32706 mapRes!32706))

(declare-fun res!634786 () Bool)

(assert (=> start!80436 (=> (not res!634786) (not e!531411))))

(declare-fun valid!1825 (LongMapFixedSize!4774) Bool)

(assert (=> start!80436 (= res!634786 (valid!1825 thiss!1141))))

(assert (=> start!80436 e!531411))

(declare-fun e!531410 () Bool)

(assert (=> start!80436 e!531410))

(assert (=> start!80436 true))

(declare-fun b!944956 () Bool)

(declare-fun res!634787 () Bool)

(assert (=> b!944956 (=> (not res!634787) (not e!531411))))

(assert (=> b!944956 (= res!634787 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944957 () Bool)

(declare-fun Unit!31877 () Unit!31874)

(assert (=> b!944957 (= e!531408 Unit!31877)))

(declare-fun lt!425807 () Unit!31874)

(declare-fun lemmaKeyInListMapIsInArray!317 (array!57144 array!57142 (_ BitVec 32) (_ BitVec 32) V!32415 V!32415 (_ BitVec 64) Int) Unit!31874)

(assert (=> b!944957 (= lt!425807 (lemmaKeyInListMapIsInArray!317 (_keys!10560 thiss!1141) (_values!5705 thiss!1141) (mask!27342 thiss!1141) (extraKeys!5414 thiss!1141) (zeroValue!5518 thiss!1141) (minValue!5518 thiss!1141) key!756 (defaultEntry!5682 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944957 (arrayContainsKey!0 (_keys!10560 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425805 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57144 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944957 (= lt!425805 (arrayScanForKey!0 (_keys!10560 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun lt!425808 () Unit!31874)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31874)

(assert (=> b!944957 (= lt!425808 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10560 thiss!1141) (mask!27342 thiss!1141) #b00000000000000000000000000000000 lt!425805))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57144 (_ BitVec 32)) Bool)

(assert (=> b!944957 (arrayForallSeekEntryOrOpenFound!0 lt!425805 (_keys!10560 thiss!1141) (mask!27342 thiss!1141))))

(declare-fun lt!425804 () Unit!31874)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57144 (_ BitVec 32)) Unit!31874)

(assert (=> b!944957 (= lt!425804 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!425805 (_keys!10560 thiss!1141) (mask!27342 thiss!1141)))))

(assert (=> b!944957 false))

(declare-fun b!944958 () Bool)

(declare-fun e!531409 () Bool)

(declare-fun e!531407 () Bool)

(assert (=> b!944958 (= e!531409 (and e!531407 mapRes!32706))))

(declare-fun condMapEmpty!32706 () Bool)

(declare-fun mapDefault!32706 () ValueCell!9812)

