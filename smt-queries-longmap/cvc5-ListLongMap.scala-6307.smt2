; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80790 () Bool)

(assert start!80790)

(declare-fun b!947152 () Bool)

(declare-fun b_free!18163 () Bool)

(declare-fun b_next!18163 () Bool)

(assert (=> b!947152 (= b_free!18163 (not b_next!18163))))

(declare-fun tp!63044 () Bool)

(declare-fun b_and!29585 () Bool)

(assert (=> b!947152 (= tp!63044 b_and!29585)))

(declare-fun b!947146 () Bool)

(declare-fun res!635686 () Bool)

(declare-fun e!533049 () Bool)

(assert (=> b!947146 (=> (not res!635686) (not e!533049))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!947146 (= res!635686 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!947147 () Bool)

(declare-fun e!533046 () Bool)

(assert (=> b!947147 (= e!533049 e!533046)))

(declare-fun res!635689 () Bool)

(assert (=> b!947147 (=> (not res!635689) (not e!533046))))

(declare-datatypes ((SeekEntryResult!9109 0))(
  ( (MissingZero!9109 (index!38807 (_ BitVec 32))) (Found!9109 (index!38808 (_ BitVec 32))) (Intermediate!9109 (undefined!9921 Bool) (index!38809 (_ BitVec 32)) (x!81477 (_ BitVec 32))) (Undefined!9109) (MissingVacant!9109 (index!38810 (_ BitVec 32))) )
))
(declare-fun lt!426503 () SeekEntryResult!9109)

(assert (=> b!947147 (= res!635689 (is-Found!9109 lt!426503))))

(declare-datatypes ((V!32527 0))(
  ( (V!32528 (val!10386 Int)) )
))
(declare-datatypes ((ValueCell!9854 0))(
  ( (ValueCellFull!9854 (v!12920 V!32527)) (EmptyCell!9854) )
))
(declare-datatypes ((array!57336 0))(
  ( (array!57337 (arr!27580 (Array (_ BitVec 32) ValueCell!9854)) (size!28053 (_ BitVec 32))) )
))
(declare-datatypes ((array!57338 0))(
  ( (array!57339 (arr!27581 (Array (_ BitVec 32) (_ BitVec 64))) (size!28054 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4858 0))(
  ( (LongMapFixedSize!4859 (defaultEntry!5726 Int) (mask!27456 (_ BitVec 32)) (extraKeys!5458 (_ BitVec 32)) (zeroValue!5562 V!32527) (minValue!5562 V!32527) (_size!2484 (_ BitVec 32)) (_keys!10633 array!57338) (_values!5749 array!57336) (_vacant!2484 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4858)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57338 (_ BitVec 32)) SeekEntryResult!9109)

(assert (=> b!947147 (= lt!426503 (seekEntry!0 key!756 (_keys!10633 thiss!1141) (mask!27456 thiss!1141)))))

(declare-fun res!635685 () Bool)

(assert (=> start!80790 (=> (not res!635685) (not e!533049))))

(declare-fun valid!1850 (LongMapFixedSize!4858) Bool)

(assert (=> start!80790 (= res!635685 (valid!1850 thiss!1141))))

(assert (=> start!80790 e!533049))

(declare-fun e!533051 () Bool)

(assert (=> start!80790 e!533051))

(assert (=> start!80790 true))

(declare-fun b!947148 () Bool)

(declare-fun e!533050 () Bool)

(declare-fun e!533048 () Bool)

(declare-fun mapRes!32878 () Bool)

(assert (=> b!947148 (= e!533050 (and e!533048 mapRes!32878))))

(declare-fun condMapEmpty!32878 () Bool)

(declare-fun mapDefault!32878 () ValueCell!9854)

