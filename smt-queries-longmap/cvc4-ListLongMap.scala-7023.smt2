; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89154 () Bool)

(assert start!89154)

(declare-fun b!1022175 () Bool)

(declare-fun b_free!20195 () Bool)

(declare-fun b_next!20195 () Bool)

(assert (=> b!1022175 (= b_free!20195 (not b_next!20195))))

(declare-fun tp!71620 () Bool)

(declare-fun b_and!32393 () Bool)

(assert (=> b!1022175 (= tp!71620 b_and!32393)))

(declare-fun b!1022171 () Bool)

(declare-fun e!575790 () Bool)

(declare-fun tp_is_empty!23915 () Bool)

(assert (=> b!1022171 (= e!575790 tp_is_empty!23915)))

(declare-fun b!1022172 () Bool)

(declare-fun e!575789 () Bool)

(assert (=> b!1022172 (= e!575789 false)))

(declare-fun lt!450186 () Bool)

(declare-datatypes ((V!36759 0))(
  ( (V!36760 (val!12008 Int)) )
))
(declare-datatypes ((ValueCell!11254 0))(
  ( (ValueCellFull!11254 (v!14577 V!36759)) (EmptyCell!11254) )
))
(declare-datatypes ((array!63874 0))(
  ( (array!63875 (arr!30749 (Array (_ BitVec 32) (_ BitVec 64))) (size!31260 (_ BitVec 32))) )
))
(declare-datatypes ((array!63876 0))(
  ( (array!63877 (arr!30750 (Array (_ BitVec 32) ValueCell!11254)) (size!31261 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5102 0))(
  ( (LongMapFixedSize!5103 (defaultEntry!5903 Int) (mask!29490 (_ BitVec 32)) (extraKeys!5635 (_ BitVec 32)) (zeroValue!5739 V!36759) (minValue!5739 V!36759) (_size!2606 (_ BitVec 32)) (_keys!11048 array!63874) (_values!5926 array!63876) (_vacant!2606 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5102)

(declare-datatypes ((List!21674 0))(
  ( (Nil!21671) (Cons!21670 (h!22868 (_ BitVec 64)) (t!30688 List!21674)) )
))
(declare-fun arrayNoDuplicates!0 (array!63874 (_ BitVec 32) List!21674) Bool)

(assert (=> b!1022172 (= lt!450186 (arrayNoDuplicates!0 (_keys!11048 thiss!1427) #b00000000000000000000000000000000 Nil!21671))))

(declare-fun b!1022173 () Bool)

(declare-fun res!684790 () Bool)

(assert (=> b!1022173 (=> (not res!684790) (not e!575789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63874 (_ BitVec 32)) Bool)

(assert (=> b!1022173 (= res!684790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11048 thiss!1427) (mask!29490 thiss!1427)))))

(declare-fun b!1022174 () Bool)

(declare-fun e!575788 () Bool)

(declare-fun mapRes!37290 () Bool)

(assert (=> b!1022174 (= e!575788 (and e!575790 mapRes!37290))))

(declare-fun condMapEmpty!37290 () Bool)

(declare-fun mapDefault!37290 () ValueCell!11254)

