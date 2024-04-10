; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91812 () Bool)

(assert start!91812)

(declare-fun b!1044615 () Bool)

(declare-fun b_free!21121 () Bool)

(declare-fun b_next!21121 () Bool)

(assert (=> b!1044615 (= b_free!21121 (not b_next!21121))))

(declare-fun tp!74613 () Bool)

(declare-fun b_and!33705 () Bool)

(assert (=> b!1044615 (= tp!74613 b_and!33705)))

(declare-fun mapIsEmpty!38894 () Bool)

(declare-fun mapRes!38894 () Bool)

(assert (=> mapIsEmpty!38894 mapRes!38894))

(declare-fun b!1044612 () Bool)

(declare-fun e!592030 () Bool)

(declare-fun e!592031 () Bool)

(assert (=> b!1044612 (= e!592030 e!592031)))

(declare-fun res!695710 () Bool)

(assert (=> b!1044612 (=> (not res!695710) (not e!592031))))

(declare-datatypes ((SeekEntryResult!9841 0))(
  ( (MissingZero!9841 (index!41735 (_ BitVec 32))) (Found!9841 (index!41736 (_ BitVec 32))) (Intermediate!9841 (undefined!10653 Bool) (index!41737 (_ BitVec 32)) (x!93287 (_ BitVec 32))) (Undefined!9841) (MissingVacant!9841 (index!41738 (_ BitVec 32))) )
))
(declare-fun lt!460862 () SeekEntryResult!9841)

(assert (=> b!1044612 (= res!695710 (is-Found!9841 lt!460862))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37995 0))(
  ( (V!37996 (val!12471 Int)) )
))
(declare-datatypes ((ValueCell!11717 0))(
  ( (ValueCellFull!11717 (v!15064 V!37995)) (EmptyCell!11717) )
))
(declare-datatypes ((array!65852 0))(
  ( (array!65853 (arr!31675 (Array (_ BitVec 32) (_ BitVec 64))) (size!32210 (_ BitVec 32))) )
))
(declare-datatypes ((array!65854 0))(
  ( (array!65855 (arr!31676 (Array (_ BitVec 32) ValueCell!11717)) (size!32211 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6028 0))(
  ( (LongMapFixedSize!6029 (defaultEntry!6404 Int) (mask!30517 (_ BitVec 32)) (extraKeys!6132 (_ BitVec 32)) (zeroValue!6238 V!37995) (minValue!6238 V!37995) (_size!3069 (_ BitVec 32)) (_keys!11670 array!65852) (_values!6427 array!65854) (_vacant!3069 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6028)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65852 (_ BitVec 32)) SeekEntryResult!9841)

(assert (=> b!1044612 (= lt!460862 (seekEntry!0 key!909 (_keys!11670 thiss!1427) (mask!30517 thiss!1427)))))

(declare-fun b!1044613 () Bool)

(declare-fun e!592032 () Bool)

(declare-fun e!592033 () Bool)

(assert (=> b!1044613 (= e!592032 (and e!592033 mapRes!38894))))

(declare-fun condMapEmpty!38894 () Bool)

(declare-fun mapDefault!38894 () ValueCell!11717)

