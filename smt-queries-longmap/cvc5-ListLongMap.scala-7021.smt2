; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89138 () Bool)

(assert start!89138)

(declare-fun b!1021962 () Bool)

(declare-fun b_free!20179 () Bool)

(declare-fun b_next!20179 () Bool)

(assert (=> b!1021962 (= b_free!20179 (not b_next!20179))))

(declare-fun tp!71571 () Bool)

(declare-fun b_and!32377 () Bool)

(assert (=> b!1021962 (= tp!71571 b_and!32377)))

(declare-fun b!1021955 () Bool)

(declare-fun res!684671 () Bool)

(declare-fun e!575647 () Bool)

(assert (=> b!1021955 (=> (not res!684671) (not e!575647))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021955 (= res!684671 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021956 () Bool)

(declare-fun res!684668 () Bool)

(assert (=> b!1021956 (=> (not res!684668) (not e!575647))))

(declare-datatypes ((V!36739 0))(
  ( (V!36740 (val!12000 Int)) )
))
(declare-datatypes ((ValueCell!11246 0))(
  ( (ValueCellFull!11246 (v!14569 V!36739)) (EmptyCell!11246) )
))
(declare-datatypes ((array!63842 0))(
  ( (array!63843 (arr!30733 (Array (_ BitVec 32) (_ BitVec 64))) (size!31244 (_ BitVec 32))) )
))
(declare-datatypes ((array!63844 0))(
  ( (array!63845 (arr!30734 (Array (_ BitVec 32) ValueCell!11246)) (size!31245 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5086 0))(
  ( (LongMapFixedSize!5087 (defaultEntry!5895 Int) (mask!29478 (_ BitVec 32)) (extraKeys!5627 (_ BitVec 32)) (zeroValue!5731 V!36739) (minValue!5731 V!36739) (_size!2598 (_ BitVec 32)) (_keys!11040 array!63842) (_values!5918 array!63844) (_vacant!2598 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5086)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021956 (= res!684668 (validMask!0 (mask!29478 thiss!1427)))))

(declare-fun b!1021957 () Bool)

(declare-fun res!684669 () Bool)

(assert (=> b!1021957 (=> (not res!684669) (not e!575647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63842 (_ BitVec 32)) Bool)

(assert (=> b!1021957 (= res!684669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11040 thiss!1427) (mask!29478 thiss!1427)))))

(declare-fun b!1021958 () Bool)

(declare-fun res!684667 () Bool)

(assert (=> b!1021958 (=> (not res!684667) (not e!575647))))

(assert (=> b!1021958 (= res!684667 (and (= (size!31245 (_values!5918 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29478 thiss!1427))) (= (size!31244 (_keys!11040 thiss!1427)) (size!31245 (_values!5918 thiss!1427))) (bvsge (mask!29478 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5627 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5627 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5627 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021959 () Bool)

(declare-fun e!575648 () Bool)

(declare-fun tp_is_empty!23899 () Bool)

(assert (=> b!1021959 (= e!575648 tp_is_empty!23899)))

(declare-fun b!1021960 () Bool)

(declare-fun e!575645 () Bool)

(assert (=> b!1021960 (= e!575645 tp_is_empty!23899)))

(declare-fun b!1021961 () Bool)

(assert (=> b!1021961 (= e!575647 false)))

(declare-fun lt!450162 () Bool)

(declare-datatypes ((List!21668 0))(
  ( (Nil!21665) (Cons!21664 (h!22862 (_ BitVec 64)) (t!30682 List!21668)) )
))
(declare-fun arrayNoDuplicates!0 (array!63842 (_ BitVec 32) List!21668) Bool)

(assert (=> b!1021961 (= lt!450162 (arrayNoDuplicates!0 (_keys!11040 thiss!1427) #b00000000000000000000000000000000 Nil!21665))))

(declare-fun mapIsEmpty!37266 () Bool)

(declare-fun mapRes!37266 () Bool)

(assert (=> mapIsEmpty!37266 mapRes!37266))

(declare-fun mapNonEmpty!37266 () Bool)

(declare-fun tp!71572 () Bool)

(assert (=> mapNonEmpty!37266 (= mapRes!37266 (and tp!71572 e!575648))))

(declare-fun mapKey!37266 () (_ BitVec 32))

(declare-fun mapRest!37266 () (Array (_ BitVec 32) ValueCell!11246))

(declare-fun mapValue!37266 () ValueCell!11246)

(assert (=> mapNonEmpty!37266 (= (arr!30734 (_values!5918 thiss!1427)) (store mapRest!37266 mapKey!37266 mapValue!37266))))

(declare-fun e!575644 () Bool)

(declare-fun e!575649 () Bool)

(declare-fun array_inv!23827 (array!63842) Bool)

(declare-fun array_inv!23828 (array!63844) Bool)

(assert (=> b!1021962 (= e!575649 (and tp!71571 tp_is_empty!23899 (array_inv!23827 (_keys!11040 thiss!1427)) (array_inv!23828 (_values!5918 thiss!1427)) e!575644))))

(declare-fun b!1021963 () Bool)

(assert (=> b!1021963 (= e!575644 (and e!575645 mapRes!37266))))

(declare-fun condMapEmpty!37266 () Bool)

(declare-fun mapDefault!37266 () ValueCell!11246)

