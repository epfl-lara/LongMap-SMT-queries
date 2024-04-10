; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89124 () Bool)

(assert start!89124)

(declare-fun b!1021774 () Bool)

(declare-fun b_free!20165 () Bool)

(declare-fun b_next!20165 () Bool)

(assert (=> b!1021774 (= b_free!20165 (not b_next!20165))))

(declare-fun tp!71529 () Bool)

(declare-fun b_and!32363 () Bool)

(assert (=> b!1021774 (= tp!71529 b_and!32363)))

(declare-fun b!1021766 () Bool)

(declare-fun e!575523 () Bool)

(assert (=> b!1021766 (= e!575523 false)))

(declare-fun lt!450141 () Bool)

(declare-datatypes ((V!36719 0))(
  ( (V!36720 (val!11993 Int)) )
))
(declare-datatypes ((ValueCell!11239 0))(
  ( (ValueCellFull!11239 (v!14562 V!36719)) (EmptyCell!11239) )
))
(declare-datatypes ((array!63814 0))(
  ( (array!63815 (arr!30719 (Array (_ BitVec 32) (_ BitVec 64))) (size!31230 (_ BitVec 32))) )
))
(declare-datatypes ((array!63816 0))(
  ( (array!63817 (arr!30720 (Array (_ BitVec 32) ValueCell!11239)) (size!31231 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5072 0))(
  ( (LongMapFixedSize!5073 (defaultEntry!5888 Int) (mask!29465 (_ BitVec 32)) (extraKeys!5620 (_ BitVec 32)) (zeroValue!5724 V!36719) (minValue!5724 V!36719) (_size!2591 (_ BitVec 32)) (_keys!11033 array!63814) (_values!5911 array!63816) (_vacant!2591 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5072)

(declare-datatypes ((List!21662 0))(
  ( (Nil!21659) (Cons!21658 (h!22856 (_ BitVec 64)) (t!30676 List!21662)) )
))
(declare-fun arrayNoDuplicates!0 (array!63814 (_ BitVec 32) List!21662) Bool)

(assert (=> b!1021766 (= lt!450141 (arrayNoDuplicates!0 (_keys!11033 thiss!1427) #b00000000000000000000000000000000 Nil!21659))))

(declare-fun res!684562 () Bool)

(assert (=> start!89124 (=> (not res!684562) (not e!575523))))

(declare-fun valid!1935 (LongMapFixedSize!5072) Bool)

(assert (=> start!89124 (= res!684562 (valid!1935 thiss!1427))))

(assert (=> start!89124 e!575523))

(declare-fun e!575521 () Bool)

(assert (=> start!89124 e!575521))

(assert (=> start!89124 true))

(declare-fun mapIsEmpty!37245 () Bool)

(declare-fun mapRes!37245 () Bool)

(assert (=> mapIsEmpty!37245 mapRes!37245))

(declare-fun b!1021767 () Bool)

(declare-fun res!684566 () Bool)

(assert (=> b!1021767 (=> (not res!684566) (not e!575523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63814 (_ BitVec 32)) Bool)

(assert (=> b!1021767 (= res!684566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11033 thiss!1427) (mask!29465 thiss!1427)))))

(declare-fun mapNonEmpty!37245 () Bool)

(declare-fun tp!71530 () Bool)

(declare-fun e!575518 () Bool)

(assert (=> mapNonEmpty!37245 (= mapRes!37245 (and tp!71530 e!575518))))

(declare-fun mapValue!37245 () ValueCell!11239)

(declare-fun mapRest!37245 () (Array (_ BitVec 32) ValueCell!11239))

(declare-fun mapKey!37245 () (_ BitVec 32))

(assert (=> mapNonEmpty!37245 (= (arr!30720 (_values!5911 thiss!1427)) (store mapRest!37245 mapKey!37245 mapValue!37245))))

(declare-fun b!1021768 () Bool)

(declare-fun res!684563 () Bool)

(assert (=> b!1021768 (=> (not res!684563) (not e!575523))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021768 (= res!684563 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021769 () Bool)

(declare-fun res!684564 () Bool)

(assert (=> b!1021769 (=> (not res!684564) (not e!575523))))

(assert (=> b!1021769 (= res!684564 (and (= (size!31231 (_values!5911 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29465 thiss!1427))) (= (size!31230 (_keys!11033 thiss!1427)) (size!31231 (_values!5911 thiss!1427))) (bvsge (mask!29465 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5620 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5620 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5620 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5620 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5620 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5620 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5620 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021770 () Bool)

(declare-fun e!575520 () Bool)

(declare-fun tp_is_empty!23885 () Bool)

(assert (=> b!1021770 (= e!575520 tp_is_empty!23885)))

(declare-fun b!1021771 () Bool)

(assert (=> b!1021771 (= e!575518 tp_is_empty!23885)))

(declare-fun b!1021772 () Bool)

(declare-fun res!684565 () Bool)

(assert (=> b!1021772 (=> (not res!684565) (not e!575523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021772 (= res!684565 (validMask!0 (mask!29465 thiss!1427)))))

(declare-fun b!1021773 () Bool)

(declare-fun e!575522 () Bool)

(assert (=> b!1021773 (= e!575522 (and e!575520 mapRes!37245))))

(declare-fun condMapEmpty!37245 () Bool)

(declare-fun mapDefault!37245 () ValueCell!11239)

