; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89538 () Bool)

(assert start!89538)

(declare-fun b!1027006 () Bool)

(declare-fun b_free!20537 () Bool)

(declare-fun b_next!20537 () Bool)

(assert (=> b!1027006 (= b_free!20537 (not b_next!20537))))

(declare-fun tp!72657 () Bool)

(declare-fun b_and!32783 () Bool)

(assert (=> b!1027006 (= tp!72657 b_and!32783)))

(declare-fun b!1027001 () Bool)

(declare-fun res!687445 () Bool)

(declare-fun e!579500 () Bool)

(assert (=> b!1027001 (=> res!687445 e!579500)))

(declare-datatypes ((V!37215 0))(
  ( (V!37216 (val!12179 Int)) )
))
(declare-datatypes ((ValueCell!11425 0))(
  ( (ValueCellFull!11425 (v!14748 V!37215)) (EmptyCell!11425) )
))
(declare-datatypes ((array!64564 0))(
  ( (array!64565 (arr!31091 (Array (_ BitVec 32) (_ BitVec 64))) (size!31604 (_ BitVec 32))) )
))
(declare-datatypes ((array!64566 0))(
  ( (array!64567 (arr!31092 (Array (_ BitVec 32) ValueCell!11425)) (size!31605 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5444 0))(
  ( (LongMapFixedSize!5445 (defaultEntry!6074 Int) (mask!29780 (_ BitVec 32)) (extraKeys!5806 (_ BitVec 32)) (zeroValue!5910 V!37215) (minValue!5910 V!37215) (_size!2777 (_ BitVec 32)) (_keys!11221 array!64564) (_values!6097 array!64566) (_vacant!2777 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5444)

(assert (=> b!1027001 (= res!687445 (or (not (= (size!31605 (_values!6097 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29780 thiss!1427)))) (not (= (size!31604 (_keys!11221 thiss!1427)) (size!31605 (_values!6097 thiss!1427)))) (bvslt (mask!29780 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5806 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5806 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027002 () Bool)

(declare-fun e!579497 () Bool)

(declare-fun e!579496 () Bool)

(assert (=> b!1027002 (= e!579497 e!579496)))

(declare-fun res!687442 () Bool)

(assert (=> b!1027002 (=> (not res!687442) (not e!579496))))

(declare-datatypes ((SeekEntryResult!9661 0))(
  ( (MissingZero!9661 (index!41015 (_ BitVec 32))) (Found!9661 (index!41016 (_ BitVec 32))) (Intermediate!9661 (undefined!10473 Bool) (index!41017 (_ BitVec 32)) (x!91371 (_ BitVec 32))) (Undefined!9661) (MissingVacant!9661 (index!41018 (_ BitVec 32))) )
))
(declare-fun lt!451952 () SeekEntryResult!9661)

(assert (=> b!1027002 (= res!687442 (is-Found!9661 lt!451952))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64564 (_ BitVec 32)) SeekEntryResult!9661)

(assert (=> b!1027002 (= lt!451952 (seekEntry!0 key!909 (_keys!11221 thiss!1427) (mask!29780 thiss!1427)))))

(declare-fun res!687446 () Bool)

(assert (=> start!89538 (=> (not res!687446) (not e!579497))))

(declare-fun valid!2065 (LongMapFixedSize!5444) Bool)

(assert (=> start!89538 (= res!687446 (valid!2065 thiss!1427))))

(assert (=> start!89538 e!579497))

(declare-fun e!579499 () Bool)

(assert (=> start!89538 e!579499))

(assert (=> start!89538 true))

(declare-fun mapIsEmpty!37814 () Bool)

(declare-fun mapRes!37814 () Bool)

(assert (=> mapIsEmpty!37814 mapRes!37814))

(declare-fun b!1027003 () Bool)

(declare-fun e!579498 () Bool)

(declare-fun tp_is_empty!24257 () Bool)

(assert (=> b!1027003 (= e!579498 tp_is_empty!24257)))

(declare-fun b!1027004 () Bool)

(declare-fun e!579502 () Bool)

(assert (=> b!1027004 (= e!579502 (and e!579498 mapRes!37814))))

(declare-fun condMapEmpty!37814 () Bool)

(declare-fun mapDefault!37814 () ValueCell!11425)

