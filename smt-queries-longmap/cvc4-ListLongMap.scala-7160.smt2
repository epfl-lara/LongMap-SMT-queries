; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91172 () Bool)

(assert start!91172)

(declare-fun b!1040555 () Bool)

(declare-fun b_free!21017 () Bool)

(declare-fun b_next!21017 () Bool)

(assert (=> b!1040555 (= b_free!21017 (not b_next!21017))))

(declare-fun tp!74248 () Bool)

(declare-fun b_and!33549 () Bool)

(assert (=> b!1040555 (= tp!74248 b_and!33549)))

(declare-fun res!693719 () Bool)

(declare-fun e!589134 () Bool)

(assert (=> start!91172 (=> (not res!693719) (not e!589134))))

(declare-datatypes ((V!37855 0))(
  ( (V!37856 (val!12419 Int)) )
))
(declare-datatypes ((ValueCell!11665 0))(
  ( (ValueCellFull!11665 (v!15006 V!37855)) (EmptyCell!11665) )
))
(declare-datatypes ((array!65612 0))(
  ( (array!65613 (arr!31571 (Array (_ BitVec 32) (_ BitVec 64))) (size!32102 (_ BitVec 32))) )
))
(declare-datatypes ((array!65614 0))(
  ( (array!65615 (arr!31572 (Array (_ BitVec 32) ValueCell!11665)) (size!32103 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5924 0))(
  ( (LongMapFixedSize!5925 (defaultEntry!6344 Int) (mask!30340 (_ BitVec 32)) (extraKeys!6072 (_ BitVec 32)) (zeroValue!6178 V!37855) (minValue!6178 V!37855) (_size!3017 (_ BitVec 32)) (_keys!11566 array!65612) (_values!6367 array!65614) (_vacant!3017 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5924)

(declare-fun valid!2224 (LongMapFixedSize!5924) Bool)

(assert (=> start!91172 (= res!693719 (valid!2224 thiss!1427))))

(assert (=> start!91172 e!589134))

(declare-fun e!589133 () Bool)

(assert (=> start!91172 e!589133))

(assert (=> start!91172 true))

(declare-fun b!1040547 () Bool)

(declare-fun e!589132 () Bool)

(declare-fun tp_is_empty!24737 () Bool)

(assert (=> b!1040547 (= e!589132 tp_is_empty!24737)))

(declare-fun mapNonEmpty!38686 () Bool)

(declare-fun mapRes!38686 () Bool)

(declare-fun tp!74249 () Bool)

(declare-fun e!589136 () Bool)

(assert (=> mapNonEmpty!38686 (= mapRes!38686 (and tp!74249 e!589136))))

(declare-fun mapValue!38686 () ValueCell!11665)

(declare-fun mapKey!38686 () (_ BitVec 32))

(declare-fun mapRest!38686 () (Array (_ BitVec 32) ValueCell!11665))

(assert (=> mapNonEmpty!38686 (= (arr!31572 (_values!6367 thiss!1427)) (store mapRest!38686 mapKey!38686 mapValue!38686))))

(declare-fun b!1040548 () Bool)

(assert (=> b!1040548 (= e!589136 tp_is_empty!24737)))

(declare-fun b!1040549 () Bool)

(declare-fun e!589129 () Bool)

(assert (=> b!1040549 (= e!589134 e!589129)))

(declare-fun res!693721 () Bool)

(assert (=> b!1040549 (=> (not res!693721) (not e!589129))))

(declare-datatypes ((SeekEntryResult!9798 0))(
  ( (MissingZero!9798 (index!41563 (_ BitVec 32))) (Found!9798 (index!41564 (_ BitVec 32))) (Intermediate!9798 (undefined!10610 Bool) (index!41565 (_ BitVec 32)) (x!92886 (_ BitVec 32))) (Undefined!9798) (MissingVacant!9798 (index!41566 (_ BitVec 32))) )
))
(declare-fun lt!458598 () SeekEntryResult!9798)

(assert (=> b!1040549 (= res!693721 (is-Found!9798 lt!458598))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65612 (_ BitVec 32)) SeekEntryResult!9798)

(assert (=> b!1040549 (= lt!458598 (seekEntry!0 key!909 (_keys!11566 thiss!1427) (mask!30340 thiss!1427)))))

(declare-fun b!1040550 () Bool)

(declare-fun res!693722 () Bool)

(declare-fun e!589135 () Bool)

(assert (=> b!1040550 (=> res!693722 e!589135)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040550 (= res!693722 (not (validKeyInArray!0 key!909)))))

(declare-fun mapIsEmpty!38686 () Bool)

(assert (=> mapIsEmpty!38686 mapRes!38686))

(declare-fun b!1040551 () Bool)

(declare-fun e!589131 () Bool)

(assert (=> b!1040551 (= e!589131 (and e!589132 mapRes!38686))))

(declare-fun condMapEmpty!38686 () Bool)

(declare-fun mapDefault!38686 () ValueCell!11665)

