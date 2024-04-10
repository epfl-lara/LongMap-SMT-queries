; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90110 () Bool)

(assert start!90110)

(declare-fun b!1032285 () Bool)

(declare-fun b_free!20717 () Bool)

(declare-fun b_next!20717 () Bool)

(assert (=> b!1032285 (= b_free!20717 (not b_next!20717))))

(declare-fun tp!73222 () Bool)

(declare-fun b_and!33185 () Bool)

(assert (=> b!1032285 (= tp!73222 b_and!33185)))

(declare-fun b!1032282 () Bool)

(declare-fun e!583236 () Bool)

(assert (=> b!1032282 (= e!583236 false)))

(declare-datatypes ((SeekEntryResult!9728 0))(
  ( (MissingZero!9728 (index!41283 (_ BitVec 32))) (Found!9728 (index!41284 (_ BitVec 32))) (Intermediate!9728 (undefined!10540 Bool) (index!41285 (_ BitVec 32)) (x!91976 (_ BitVec 32))) (Undefined!9728) (MissingVacant!9728 (index!41286 (_ BitVec 32))) )
))
(declare-fun lt!456020 () SeekEntryResult!9728)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37455 0))(
  ( (V!37456 (val!12269 Int)) )
))
(declare-datatypes ((ValueCell!11515 0))(
  ( (ValueCellFull!11515 (v!14846 V!37455)) (EmptyCell!11515) )
))
(declare-datatypes ((array!64938 0))(
  ( (array!64939 (arr!31271 (Array (_ BitVec 32) (_ BitVec 64))) (size!31788 (_ BitVec 32))) )
))
(declare-datatypes ((array!64940 0))(
  ( (array!64941 (arr!31272 (Array (_ BitVec 32) ValueCell!11515)) (size!31789 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5624 0))(
  ( (LongMapFixedSize!5625 (defaultEntry!6186 Int) (mask!30000 (_ BitVec 32)) (extraKeys!5918 (_ BitVec 32)) (zeroValue!6022 V!37455) (minValue!6022 V!37455) (_size!2867 (_ BitVec 32)) (_keys!11359 array!64938) (_values!6209 array!64940) (_vacant!2867 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5624)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64938 (_ BitVec 32)) SeekEntryResult!9728)

(assert (=> b!1032282 (= lt!456020 (seekEntry!0 key!909 (_keys!11359 thiss!1427) (mask!30000 thiss!1427)))))

(declare-fun b!1032283 () Bool)

(declare-fun e!583234 () Bool)

(declare-fun tp_is_empty!24437 () Bool)

(assert (=> b!1032283 (= e!583234 tp_is_empty!24437)))

(declare-fun mapNonEmpty!38109 () Bool)

(declare-fun mapRes!38109 () Bool)

(declare-fun tp!73221 () Bool)

(declare-fun e!583238 () Bool)

(assert (=> mapNonEmpty!38109 (= mapRes!38109 (and tp!73221 e!583238))))

(declare-fun mapValue!38109 () ValueCell!11515)

(declare-fun mapRest!38109 () (Array (_ BitVec 32) ValueCell!11515))

(declare-fun mapKey!38109 () (_ BitVec 32))

(assert (=> mapNonEmpty!38109 (= (arr!31272 (_values!6209 thiss!1427)) (store mapRest!38109 mapKey!38109 mapValue!38109))))

(declare-fun b!1032284 () Bool)

(assert (=> b!1032284 (= e!583238 tp_is_empty!24437)))

(declare-fun e!583239 () Bool)

(declare-fun e!583237 () Bool)

(declare-fun array_inv!24205 (array!64938) Bool)

(declare-fun array_inv!24206 (array!64940) Bool)

(assert (=> b!1032285 (= e!583239 (and tp!73222 tp_is_empty!24437 (array_inv!24205 (_keys!11359 thiss!1427)) (array_inv!24206 (_values!6209 thiss!1427)) e!583237))))

(declare-fun mapIsEmpty!38109 () Bool)

(assert (=> mapIsEmpty!38109 mapRes!38109))

(declare-fun b!1032286 () Bool)

(assert (=> b!1032286 (= e!583237 (and e!583234 mapRes!38109))))

(declare-fun condMapEmpty!38109 () Bool)

(declare-fun mapDefault!38109 () ValueCell!11515)

