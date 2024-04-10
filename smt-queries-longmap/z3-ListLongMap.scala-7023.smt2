; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89152 () Bool)

(assert start!89152)

(declare-fun b!1022145 () Bool)

(declare-fun b_free!20193 () Bool)

(declare-fun b_next!20193 () Bool)

(assert (=> b!1022145 (= b_free!20193 (not b_next!20193))))

(declare-fun tp!71614 () Bool)

(declare-fun b_and!32391 () Bool)

(assert (=> b!1022145 (= tp!71614 b_and!32391)))

(declare-fun b!1022144 () Bool)

(declare-fun res!684774 () Bool)

(declare-fun e!575772 () Bool)

(assert (=> b!1022144 (=> (not res!684774) (not e!575772))))

(declare-datatypes ((V!36757 0))(
  ( (V!36758 (val!12007 Int)) )
))
(declare-datatypes ((ValueCell!11253 0))(
  ( (ValueCellFull!11253 (v!14576 V!36757)) (EmptyCell!11253) )
))
(declare-datatypes ((array!63870 0))(
  ( (array!63871 (arr!30747 (Array (_ BitVec 32) (_ BitVec 64))) (size!31258 (_ BitVec 32))) )
))
(declare-datatypes ((array!63872 0))(
  ( (array!63873 (arr!30748 (Array (_ BitVec 32) ValueCell!11253)) (size!31259 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5100 0))(
  ( (LongMapFixedSize!5101 (defaultEntry!5902 Int) (mask!29489 (_ BitVec 32)) (extraKeys!5634 (_ BitVec 32)) (zeroValue!5738 V!36757) (minValue!5738 V!36757) (_size!2605 (_ BitVec 32)) (_keys!11047 array!63870) (_values!5925 array!63872) (_vacant!2605 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5100)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63870 (_ BitVec 32)) Bool)

(assert (=> b!1022144 (= res!684774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11047 thiss!1427) (mask!29489 thiss!1427)))))

(declare-fun e!575773 () Bool)

(declare-fun e!575774 () Bool)

(declare-fun tp_is_empty!23913 () Bool)

(declare-fun array_inv!23841 (array!63870) Bool)

(declare-fun array_inv!23842 (array!63872) Bool)

(assert (=> b!1022145 (= e!575774 (and tp!71614 tp_is_empty!23913 (array_inv!23841 (_keys!11047 thiss!1427)) (array_inv!23842 (_values!5925 thiss!1427)) e!575773))))

(declare-fun b!1022146 () Bool)

(declare-fun res!684775 () Bool)

(assert (=> b!1022146 (=> (not res!684775) (not e!575772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022146 (= res!684775 (validMask!0 (mask!29489 thiss!1427)))))

(declare-fun res!684772 () Bool)

(assert (=> start!89152 (=> (not res!684772) (not e!575772))))

(declare-fun valid!1943 (LongMapFixedSize!5100) Bool)

(assert (=> start!89152 (= res!684772 (valid!1943 thiss!1427))))

(assert (=> start!89152 e!575772))

(assert (=> start!89152 e!575774))

(assert (=> start!89152 true))

(declare-fun b!1022147 () Bool)

(declare-fun res!684773 () Bool)

(assert (=> b!1022147 (=> (not res!684773) (not e!575772))))

(assert (=> b!1022147 (= res!684773 (and (= (size!31259 (_values!5925 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29489 thiss!1427))) (= (size!31258 (_keys!11047 thiss!1427)) (size!31259 (_values!5925 thiss!1427))) (bvsge (mask!29489 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5634 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5634 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5634 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5634 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5634 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5634 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5634 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1022148 () Bool)

(declare-fun e!575771 () Bool)

(assert (=> b!1022148 (= e!575771 tp_is_empty!23913)))

(declare-fun mapIsEmpty!37287 () Bool)

(declare-fun mapRes!37287 () Bool)

(assert (=> mapIsEmpty!37287 mapRes!37287))

(declare-fun b!1022149 () Bool)

(assert (=> b!1022149 (= e!575772 false)))

(declare-fun lt!450183 () Bool)

(declare-datatypes ((List!21673 0))(
  ( (Nil!21670) (Cons!21669 (h!22867 (_ BitVec 64)) (t!30687 List!21673)) )
))
(declare-fun arrayNoDuplicates!0 (array!63870 (_ BitVec 32) List!21673) Bool)

(assert (=> b!1022149 (= lt!450183 (arrayNoDuplicates!0 (_keys!11047 thiss!1427) #b00000000000000000000000000000000 Nil!21670))))

(declare-fun b!1022150 () Bool)

(declare-fun e!575770 () Bool)

(assert (=> b!1022150 (= e!575773 (and e!575770 mapRes!37287))))

(declare-fun condMapEmpty!37287 () Bool)

(declare-fun mapDefault!37287 () ValueCell!11253)

(assert (=> b!1022150 (= condMapEmpty!37287 (= (arr!30748 (_values!5925 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11253)) mapDefault!37287)))))

(declare-fun mapNonEmpty!37287 () Bool)

(declare-fun tp!71613 () Bool)

(assert (=> mapNonEmpty!37287 (= mapRes!37287 (and tp!71613 e!575771))))

(declare-fun mapValue!37287 () ValueCell!11253)

(declare-fun mapKey!37287 () (_ BitVec 32))

(declare-fun mapRest!37287 () (Array (_ BitVec 32) ValueCell!11253))

(assert (=> mapNonEmpty!37287 (= (arr!30748 (_values!5925 thiss!1427)) (store mapRest!37287 mapKey!37287 mapValue!37287))))

(declare-fun b!1022151 () Bool)

(declare-fun res!684776 () Bool)

(assert (=> b!1022151 (=> (not res!684776) (not e!575772))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022151 (= res!684776 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022152 () Bool)

(assert (=> b!1022152 (= e!575770 tp_is_empty!23913)))

(assert (= (and start!89152 res!684772) b!1022151))

(assert (= (and b!1022151 res!684776) b!1022146))

(assert (= (and b!1022146 res!684775) b!1022147))

(assert (= (and b!1022147 res!684773) b!1022144))

(assert (= (and b!1022144 res!684774) b!1022149))

(assert (= (and b!1022150 condMapEmpty!37287) mapIsEmpty!37287))

(assert (= (and b!1022150 (not condMapEmpty!37287)) mapNonEmpty!37287))

(get-info :version)

(assert (= (and mapNonEmpty!37287 ((_ is ValueCellFull!11253) mapValue!37287)) b!1022148))

(assert (= (and b!1022150 ((_ is ValueCellFull!11253) mapDefault!37287)) b!1022152))

(assert (= b!1022145 b!1022150))

(assert (= start!89152 b!1022145))

(declare-fun m!941335 () Bool)

(assert (=> b!1022145 m!941335))

(declare-fun m!941337 () Bool)

(assert (=> b!1022145 m!941337))

(declare-fun m!941339 () Bool)

(assert (=> b!1022146 m!941339))

(declare-fun m!941341 () Bool)

(assert (=> start!89152 m!941341))

(declare-fun m!941343 () Bool)

(assert (=> mapNonEmpty!37287 m!941343))

(declare-fun m!941345 () Bool)

(assert (=> b!1022149 m!941345))

(declare-fun m!941347 () Bool)

(assert (=> b!1022144 m!941347))

(check-sat b_and!32391 (not b!1022145) (not b!1022144) (not b!1022146) (not b!1022149) tp_is_empty!23913 (not start!89152) (not mapNonEmpty!37287) (not b_next!20193))
(check-sat b_and!32391 (not b_next!20193))
