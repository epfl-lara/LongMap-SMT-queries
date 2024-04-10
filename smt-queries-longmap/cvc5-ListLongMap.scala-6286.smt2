; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80394 () Bool)

(assert start!80394)

(declare-fun b!944244 () Bool)

(declare-fun b_free!18037 () Bool)

(declare-fun b_next!18037 () Bool)

(assert (=> b!944244 (= b_free!18037 (not b_next!18037))))

(declare-fun tp!62621 () Bool)

(declare-fun b_and!29455 () Bool)

(assert (=> b!944244 (= tp!62621 b_and!29455)))

(declare-fun b!944235 () Bool)

(declare-fun res!634329 () Bool)

(declare-fun e!530970 () Bool)

(assert (=> b!944235 (=> res!634329 e!530970)))

(declare-datatypes ((V!32359 0))(
  ( (V!32360 (val!10323 Int)) )
))
(declare-datatypes ((ValueCell!9791 0))(
  ( (ValueCellFull!9791 (v!12855 V!32359)) (EmptyCell!9791) )
))
(declare-datatypes ((array!57058 0))(
  ( (array!57059 (arr!27454 (Array (_ BitVec 32) ValueCell!9791)) (size!27920 (_ BitVec 32))) )
))
(declare-datatypes ((array!57060 0))(
  ( (array!57061 (arr!27455 (Array (_ BitVec 32) (_ BitVec 64))) (size!27921 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4732 0))(
  ( (LongMapFixedSize!4733 (defaultEntry!5661 Int) (mask!27307 (_ BitVec 32)) (extraKeys!5393 (_ BitVec 32)) (zeroValue!5497 V!32359) (minValue!5497 V!32359) (_size!2421 (_ BitVec 32)) (_keys!10539 array!57060) (_values!5684 array!57058) (_vacant!2421 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4732)

(declare-fun lt!425568 () (_ BitVec 32))

(assert (=> b!944235 (= res!634329 (or (not (= (size!27921 (_keys!10539 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27307 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27921 (_keys!10539 thiss!1141))) (bvslt lt!425568 #b00000000000000000000000000000000) (bvsgt lt!425568 (size!27921 (_keys!10539 thiss!1141)))))))

(declare-fun b!944236 () Bool)

(declare-fun e!530971 () Bool)

(declare-fun tp_is_empty!20545 () Bool)

(assert (=> b!944236 (= e!530971 tp_is_empty!20545)))

(declare-fun b!944237 () Bool)

(declare-fun res!634325 () Bool)

(declare-fun e!530965 () Bool)

(assert (=> b!944237 (=> (not res!634325) (not e!530965))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!944237 (= res!634325 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944238 () Bool)

(assert (=> b!944238 (= e!530965 (not e!530970))))

(declare-fun res!634326 () Bool)

(assert (=> b!944238 (=> res!634326 e!530970)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944238 (= res!634326 (not (validMask!0 (mask!27307 thiss!1141))))))

(declare-fun arrayScanForKey!0 (array!57060 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944238 (= lt!425568 (arrayScanForKey!0 (_keys!10539 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944238 (arrayContainsKey!0 (_keys!10539 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31838 0))(
  ( (Unit!31839) )
))
(declare-fun lt!425567 () Unit!31838)

(declare-fun lemmaKeyInListMapIsInArray!299 (array!57060 array!57058 (_ BitVec 32) (_ BitVec 32) V!32359 V!32359 (_ BitVec 64) Int) Unit!31838)

(assert (=> b!944238 (= lt!425567 (lemmaKeyInListMapIsInArray!299 (_keys!10539 thiss!1141) (_values!5684 thiss!1141) (mask!27307 thiss!1141) (extraKeys!5393 thiss!1141) (zeroValue!5497 thiss!1141) (minValue!5497 thiss!1141) key!756 (defaultEntry!5661 thiss!1141)))))

(declare-fun b!944239 () Bool)

(declare-fun res!634327 () Bool)

(assert (=> b!944239 (=> (not res!634327) (not e!530965))))

(declare-datatypes ((tuple2!13466 0))(
  ( (tuple2!13467 (_1!6744 (_ BitVec 64)) (_2!6744 V!32359)) )
))
(declare-datatypes ((List!19267 0))(
  ( (Nil!19264) (Cons!19263 (h!20414 tuple2!13466) (t!27584 List!19267)) )
))
(declare-datatypes ((ListLongMap!12163 0))(
  ( (ListLongMap!12164 (toList!6097 List!19267)) )
))
(declare-fun contains!5169 (ListLongMap!12163 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3331 (array!57060 array!57058 (_ BitVec 32) (_ BitVec 32) V!32359 V!32359 (_ BitVec 32) Int) ListLongMap!12163)

(assert (=> b!944239 (= res!634327 (contains!5169 (getCurrentListMap!3331 (_keys!10539 thiss!1141) (_values!5684 thiss!1141) (mask!27307 thiss!1141) (extraKeys!5393 thiss!1141) (zeroValue!5497 thiss!1141) (minValue!5497 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5661 thiss!1141)) key!756))))

(declare-fun res!634328 () Bool)

(assert (=> start!80394 (=> (not res!634328) (not e!530965))))

(declare-fun valid!1809 (LongMapFixedSize!4732) Bool)

(assert (=> start!80394 (= res!634328 (valid!1809 thiss!1141))))

(assert (=> start!80394 e!530965))

(declare-fun e!530966 () Bool)

(assert (=> start!80394 e!530966))

(assert (=> start!80394 true))

(declare-fun b!944240 () Bool)

(declare-fun e!530969 () Bool)

(declare-fun mapRes!32643 () Bool)

(assert (=> b!944240 (= e!530969 (and e!530971 mapRes!32643))))

(declare-fun condMapEmpty!32643 () Bool)

(declare-fun mapDefault!32643 () ValueCell!9791)

