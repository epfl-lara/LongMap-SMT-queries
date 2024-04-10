; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80406 () Bool)

(assert start!80406)

(declare-fun b!944428 () Bool)

(declare-fun b_free!18049 () Bool)

(declare-fun b_next!18049 () Bool)

(assert (=> b!944428 (= b_free!18049 (not b_next!18049))))

(declare-fun tp!62657 () Bool)

(declare-fun b_and!29467 () Bool)

(assert (=> b!944428 (= tp!62657 b_and!29467)))

(declare-fun b!944419 () Bool)

(declare-fun res!634441 () Bool)

(declare-fun e!531095 () Bool)

(assert (=> b!944419 (=> (not res!634441) (not e!531095))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!944419 (= res!634441 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944420 () Bool)

(declare-fun res!634438 () Bool)

(declare-fun e!531091 () Bool)

(assert (=> b!944420 (=> res!634438 e!531091)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944420 (= res!634438 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944421 () Bool)

(declare-fun e!531096 () Bool)

(declare-fun tp_is_empty!20557 () Bool)

(assert (=> b!944421 (= e!531096 tp_is_empty!20557)))

(declare-fun b!944422 () Bool)

(declare-fun res!634437 () Bool)

(assert (=> b!944422 (=> (not res!634437) (not e!531095))))

(declare-datatypes ((V!32375 0))(
  ( (V!32376 (val!10329 Int)) )
))
(declare-datatypes ((ValueCell!9797 0))(
  ( (ValueCellFull!9797 (v!12861 V!32375)) (EmptyCell!9797) )
))
(declare-datatypes ((array!57082 0))(
  ( (array!57083 (arr!27466 (Array (_ BitVec 32) ValueCell!9797)) (size!27932 (_ BitVec 32))) )
))
(declare-datatypes ((array!57084 0))(
  ( (array!57085 (arr!27467 (Array (_ BitVec 32) (_ BitVec 64))) (size!27933 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4744 0))(
  ( (LongMapFixedSize!4745 (defaultEntry!5667 Int) (mask!27317 (_ BitVec 32)) (extraKeys!5399 (_ BitVec 32)) (zeroValue!5503 V!32375) (minValue!5503 V!32375) (_size!2427 (_ BitVec 32)) (_keys!10545 array!57084) (_values!5690 array!57082) (_vacant!2427 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4744)

(declare-datatypes ((tuple2!13478 0))(
  ( (tuple2!13479 (_1!6750 (_ BitVec 64)) (_2!6750 V!32375)) )
))
(declare-datatypes ((List!19273 0))(
  ( (Nil!19270) (Cons!19269 (h!20420 tuple2!13478) (t!27590 List!19273)) )
))
(declare-datatypes ((ListLongMap!12175 0))(
  ( (ListLongMap!12176 (toList!6103 List!19273)) )
))
(declare-fun contains!5175 (ListLongMap!12175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3337 (array!57084 array!57082 (_ BitVec 32) (_ BitVec 32) V!32375 V!32375 (_ BitVec 32) Int) ListLongMap!12175)

(assert (=> b!944422 (= res!634437 (contains!5175 (getCurrentListMap!3337 (_keys!10545 thiss!1141) (_values!5690 thiss!1141) (mask!27317 thiss!1141) (extraKeys!5399 thiss!1141) (zeroValue!5503 thiss!1141) (minValue!5503 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5667 thiss!1141)) key!756))))

(declare-fun b!944423 () Bool)

(assert (=> b!944423 (= e!531095 (not e!531091))))

(declare-fun res!634443 () Bool)

(assert (=> b!944423 (=> res!634443 e!531091)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944423 (= res!634443 (not (validMask!0 (mask!27317 thiss!1141))))))

(declare-fun lt!425623 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57084 (_ BitVec 32)) Bool)

(assert (=> b!944423 (arrayForallSeekEntryOrOpenFound!0 lt!425623 (_keys!10545 thiss!1141) (mask!27317 thiss!1141))))

(declare-datatypes ((Unit!31848 0))(
  ( (Unit!31849) )
))
(declare-fun lt!425622 () Unit!31848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31848)

(assert (=> b!944423 (= lt!425622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10545 thiss!1141) (mask!27317 thiss!1141) #b00000000000000000000000000000000 lt!425623))))

(declare-fun arrayScanForKey!0 (array!57084 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944423 (= lt!425623 (arrayScanForKey!0 (_keys!10545 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944423 (arrayContainsKey!0 (_keys!10545 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425625 () Unit!31848)

(declare-fun lemmaKeyInListMapIsInArray!304 (array!57084 array!57082 (_ BitVec 32) (_ BitVec 32) V!32375 V!32375 (_ BitVec 64) Int) Unit!31848)

(assert (=> b!944423 (= lt!425625 (lemmaKeyInListMapIsInArray!304 (_keys!10545 thiss!1141) (_values!5690 thiss!1141) (mask!27317 thiss!1141) (extraKeys!5399 thiss!1141) (zeroValue!5503 thiss!1141) (minValue!5503 thiss!1141) key!756 (defaultEntry!5667 thiss!1141)))))

(declare-fun b!944424 () Bool)

(declare-fun res!634439 () Bool)

(assert (=> b!944424 (=> res!634439 e!531091)))

(assert (=> b!944424 (= res!634439 (not (= (size!27933 (_keys!10545 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27317 thiss!1141)))))))

(declare-fun b!944425 () Bool)

(assert (=> b!944425 (= e!531091 true)))

(declare-datatypes ((SeekEntryResult!9067 0))(
  ( (MissingZero!9067 (index!38639 (_ BitVec 32))) (Found!9067 (index!38640 (_ BitVec 32))) (Intermediate!9067 (undefined!9879 Bool) (index!38641 (_ BitVec 32)) (x!81118 (_ BitVec 32))) (Undefined!9067) (MissingVacant!9067 (index!38642 (_ BitVec 32))) )
))
(declare-fun lt!425624 () SeekEntryResult!9067)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57084 (_ BitVec 32)) SeekEntryResult!9067)

(assert (=> b!944425 (= lt!425624 (seekEntryOrOpen!0 key!756 (_keys!10545 thiss!1141) (mask!27317 thiss!1141)))))

(declare-fun mapIsEmpty!32661 () Bool)

(declare-fun mapRes!32661 () Bool)

(assert (=> mapIsEmpty!32661 mapRes!32661))

(declare-fun b!944426 () Bool)

(declare-fun e!531097 () Bool)

(declare-fun e!531093 () Bool)

(assert (=> b!944426 (= e!531097 (and e!531093 mapRes!32661))))

(declare-fun condMapEmpty!32661 () Bool)

(declare-fun mapDefault!32661 () ValueCell!9797)

