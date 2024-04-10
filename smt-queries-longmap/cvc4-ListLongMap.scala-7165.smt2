; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91376 () Bool)

(assert start!91376)

(declare-fun b!1041679 () Bool)

(declare-fun b_free!21047 () Bool)

(declare-fun b_next!21047 () Bool)

(assert (=> b!1041679 (= b_free!21047 (not b_next!21047))))

(declare-fun tp!74356 () Bool)

(declare-fun b_and!33579 () Bool)

(assert (=> b!1041679 (= tp!74356 b_and!33579)))

(declare-fun b!1041677 () Bool)

(declare-fun e!589974 () Bool)

(declare-fun tp_is_empty!24767 () Bool)

(assert (=> b!1041677 (= e!589974 tp_is_empty!24767)))

(declare-fun b!1041678 () Bool)

(declare-fun e!589971 () Bool)

(declare-fun e!589976 () Bool)

(assert (=> b!1041678 (= e!589971 e!589976)))

(declare-fun res!694242 () Bool)

(assert (=> b!1041678 (=> (not res!694242) (not e!589976))))

(declare-datatypes ((SeekEntryResult!9811 0))(
  ( (MissingZero!9811 (index!41615 (_ BitVec 32))) (Found!9811 (index!41616 (_ BitVec 32))) (Intermediate!9811 (undefined!10623 Bool) (index!41617 (_ BitVec 32)) (x!92997 (_ BitVec 32))) (Undefined!9811) (MissingVacant!9811 (index!41618 (_ BitVec 32))) )
))
(declare-fun lt!459139 () SeekEntryResult!9811)

(assert (=> b!1041678 (= res!694242 (is-Found!9811 lt!459139))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37895 0))(
  ( (V!37896 (val!12434 Int)) )
))
(declare-datatypes ((ValueCell!11680 0))(
  ( (ValueCellFull!11680 (v!15023 V!37895)) (EmptyCell!11680) )
))
(declare-datatypes ((array!65682 0))(
  ( (array!65683 (arr!31601 (Array (_ BitVec 32) (_ BitVec 64))) (size!32134 (_ BitVec 32))) )
))
(declare-datatypes ((array!65684 0))(
  ( (array!65685 (arr!31602 (Array (_ BitVec 32) ValueCell!11680)) (size!32135 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5954 0))(
  ( (LongMapFixedSize!5955 (defaultEntry!6359 Int) (mask!30394 (_ BitVec 32)) (extraKeys!6087 (_ BitVec 32)) (zeroValue!6193 V!37895) (minValue!6193 V!37895) (_size!3032 (_ BitVec 32)) (_keys!11597 array!65682) (_values!6382 array!65684) (_vacant!3032 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5954)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65682 (_ BitVec 32)) SeekEntryResult!9811)

(assert (=> b!1041678 (= lt!459139 (seekEntry!0 key!909 (_keys!11597 thiss!1427) (mask!30394 thiss!1427)))))

(declare-fun e!589972 () Bool)

(declare-fun e!589973 () Bool)

(declare-fun array_inv!24417 (array!65682) Bool)

(declare-fun array_inv!24418 (array!65684) Bool)

(assert (=> b!1041679 (= e!589972 (and tp!74356 tp_is_empty!24767 (array_inv!24417 (_keys!11597 thiss!1427)) (array_inv!24418 (_values!6382 thiss!1427)) e!589973))))

(declare-fun res!694239 () Bool)

(assert (=> start!91376 (=> (not res!694239) (not e!589971))))

(declare-fun valid!2237 (LongMapFixedSize!5954) Bool)

(assert (=> start!91376 (= res!694239 (valid!2237 thiss!1427))))

(assert (=> start!91376 e!589971))

(assert (=> start!91376 e!589972))

(assert (=> start!91376 true))

(declare-fun mapNonEmpty!38748 () Bool)

(declare-fun mapRes!38748 () Bool)

(declare-fun tp!74355 () Bool)

(assert (=> mapNonEmpty!38748 (= mapRes!38748 (and tp!74355 e!589974))))

(declare-fun mapKey!38748 () (_ BitVec 32))

(declare-fun mapRest!38748 () (Array (_ BitVec 32) ValueCell!11680))

(declare-fun mapValue!38748 () ValueCell!11680)

(assert (=> mapNonEmpty!38748 (= (arr!31602 (_values!6382 thiss!1427)) (store mapRest!38748 mapKey!38748 mapValue!38748))))

(declare-fun mapIsEmpty!38748 () Bool)

(assert (=> mapIsEmpty!38748 mapRes!38748))

(declare-fun b!1041680 () Bool)

(declare-fun e!589969 () Bool)

(assert (=> b!1041680 (= e!589969 (or (not (= (size!32135 (_values!6382 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30394 thiss!1427)))) (not (= (size!32134 (_keys!11597 thiss!1427)) (size!32135 (_values!6382 thiss!1427)))) (bvslt (mask!30394 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!6087 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1041681 () Bool)

(declare-fun e!589970 () Bool)

(assert (=> b!1041681 (= e!589973 (and e!589970 mapRes!38748))))

(declare-fun condMapEmpty!38748 () Bool)

(declare-fun mapDefault!38748 () ValueCell!11680)

