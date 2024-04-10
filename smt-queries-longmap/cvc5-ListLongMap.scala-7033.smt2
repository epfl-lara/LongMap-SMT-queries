; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89210 () Bool)

(assert start!89210)

(declare-fun b!1022851 () Bool)

(declare-fun b_free!20251 () Bool)

(declare-fun b_next!20251 () Bool)

(assert (=> b!1022851 (= b_free!20251 (not b_next!20251))))

(declare-fun tp!71787 () Bool)

(declare-fun b_and!32473 () Bool)

(assert (=> b!1022851 (= tp!71787 b_and!32473)))

(declare-fun b!1022843 () Bool)

(declare-fun res!685100 () Bool)

(declare-fun e!576295 () Bool)

(assert (=> b!1022843 (=> (not res!685100) (not e!576295))))

(declare-datatypes ((V!36835 0))(
  ( (V!36836 (val!12036 Int)) )
))
(declare-datatypes ((ValueCell!11282 0))(
  ( (ValueCellFull!11282 (v!14605 V!36835)) (EmptyCell!11282) )
))
(declare-datatypes ((array!63986 0))(
  ( (array!63987 (arr!30805 (Array (_ BitVec 32) (_ BitVec 64))) (size!31316 (_ BitVec 32))) )
))
(declare-datatypes ((array!63988 0))(
  ( (array!63989 (arr!30806 (Array (_ BitVec 32) ValueCell!11282)) (size!31317 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5158 0))(
  ( (LongMapFixedSize!5159 (defaultEntry!5931 Int) (mask!29538 (_ BitVec 32)) (extraKeys!5663 (_ BitVec 32)) (zeroValue!5767 V!36835) (minValue!5767 V!36835) (_size!2634 (_ BitVec 32)) (_keys!11076 array!63986) (_values!5954 array!63988) (_vacant!2634 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5158)

(assert (=> b!1022843 (= res!685100 (and (= (size!31317 (_values!5954 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29538 thiss!1427))) (= (size!31316 (_keys!11076 thiss!1427)) (size!31317 (_values!5954 thiss!1427))) (bvsge (mask!29538 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5663 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5663 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5663 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022844 () Bool)

(assert (=> b!1022844 (= e!576295 false)))

(declare-fun lt!450342 () Bool)

(declare-datatypes ((List!21696 0))(
  ( (Nil!21693) (Cons!21692 (h!22890 (_ BitVec 64)) (t!30734 List!21696)) )
))
(declare-fun arrayNoDuplicates!0 (array!63986 (_ BitVec 32) List!21696) Bool)

(assert (=> b!1022844 (= lt!450342 (arrayNoDuplicates!0 (_keys!11076 thiss!1427) #b00000000000000000000000000000000 Nil!21693))))

(declare-fun b!1022845 () Bool)

(declare-fun e!576292 () Bool)

(declare-fun e!576293 () Bool)

(declare-fun mapRes!37374 () Bool)

(assert (=> b!1022845 (= e!576292 (and e!576293 mapRes!37374))))

(declare-fun condMapEmpty!37374 () Bool)

(declare-fun mapDefault!37374 () ValueCell!11282)

