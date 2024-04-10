; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79982 () Bool)

(assert start!79982)

(declare-fun b!940244 () Bool)

(declare-fun b_free!17837 () Bool)

(declare-fun b_next!17837 () Bool)

(assert (=> b!940244 (= b_free!17837 (not b_next!17837))))

(declare-fun tp!61985 () Bool)

(declare-fun b_and!29249 () Bool)

(assert (=> b!940244 (= tp!61985 b_and!29249)))

(declare-fun b!940236 () Bool)

(declare-fun e!528333 () Bool)

(declare-fun e!528338 () Bool)

(assert (=> b!940236 (= e!528333 e!528338)))

(declare-fun res!632233 () Bool)

(assert (=> b!940236 (=> (not res!632233) (not e!528338))))

(declare-datatypes ((SeekEntryResult!8993 0))(
  ( (MissingZero!8993 (index!38343 (_ BitVec 32))) (Found!8993 (index!38344 (_ BitVec 32))) (Intermediate!8993 (undefined!9805 Bool) (index!38345 (_ BitVec 32)) (x!80630 (_ BitVec 32))) (Undefined!8993) (MissingVacant!8993 (index!38346 (_ BitVec 32))) )
))
(declare-fun lt!424649 () SeekEntryResult!8993)

(assert (=> b!940236 (= res!632233 (is-Found!8993 lt!424649))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32091 0))(
  ( (V!32092 (val!10223 Int)) )
))
(declare-datatypes ((ValueCell!9691 0))(
  ( (ValueCellFull!9691 (v!12754 V!32091)) (EmptyCell!9691) )
))
(declare-datatypes ((array!56638 0))(
  ( (array!56639 (arr!27254 (Array (_ BitVec 32) ValueCell!9691)) (size!27715 (_ BitVec 32))) )
))
(declare-datatypes ((array!56640 0))(
  ( (array!56641 (arr!27255 (Array (_ BitVec 32) (_ BitVec 64))) (size!27716 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4532 0))(
  ( (LongMapFixedSize!4533 (defaultEntry!5557 Int) (mask!27092 (_ BitVec 32)) (extraKeys!5289 (_ BitVec 32)) (zeroValue!5393 V!32091) (minValue!5393 V!32091) (_size!2321 (_ BitVec 32)) (_keys!10407 array!56640) (_values!5580 array!56638) (_vacant!2321 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4532)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56640 (_ BitVec 32)) SeekEntryResult!8993)

(assert (=> b!940236 (= lt!424649 (seekEntry!0 key!756 (_keys!10407 thiss!1141) (mask!27092 thiss!1141)))))

(declare-fun b!940237 () Bool)

(declare-fun e!528340 () Bool)

(declare-fun e!528334 () Bool)

(declare-fun mapRes!32308 () Bool)

(assert (=> b!940237 (= e!528340 (and e!528334 mapRes!32308))))

(declare-fun condMapEmpty!32308 () Bool)

(declare-fun mapDefault!32308 () ValueCell!9691)

