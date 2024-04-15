; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89160 () Bool)

(assert start!89160)

(declare-fun b!1022132 () Bool)

(declare-fun b_free!20203 () Bool)

(declare-fun b_next!20203 () Bool)

(assert (=> b!1022132 (= b_free!20203 (not b_next!20203))))

(declare-fun tp!71644 () Bool)

(declare-fun b_and!32375 () Bool)

(assert (=> b!1022132 (= tp!71644 b_and!32375)))

(declare-fun mapNonEmpty!37302 () Bool)

(declare-fun mapRes!37302 () Bool)

(declare-fun tp!71643 () Bool)

(declare-fun e!575772 () Bool)

(assert (=> mapNonEmpty!37302 (= mapRes!37302 (and tp!71643 e!575772))))

(declare-fun mapKey!37302 () (_ BitVec 32))

(declare-datatypes ((V!36771 0))(
  ( (V!36772 (val!12012 Int)) )
))
(declare-datatypes ((ValueCell!11258 0))(
  ( (ValueCellFull!11258 (v!14580 V!36771)) (EmptyCell!11258) )
))
(declare-datatypes ((array!63829 0))(
  ( (array!63830 (arr!30726 (Array (_ BitVec 32) (_ BitVec 64))) (size!31239 (_ BitVec 32))) )
))
(declare-datatypes ((array!63831 0))(
  ( (array!63832 (arr!30727 (Array (_ BitVec 32) ValueCell!11258)) (size!31240 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5110 0))(
  ( (LongMapFixedSize!5111 (defaultEntry!5907 Int) (mask!29493 (_ BitVec 32)) (extraKeys!5639 (_ BitVec 32)) (zeroValue!5743 V!36771) (minValue!5743 V!36771) (_size!2610 (_ BitVec 32)) (_keys!11048 array!63829) (_values!5930 array!63831) (_vacant!2610 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5110)

(declare-fun mapRest!37302 () (Array (_ BitVec 32) ValueCell!11258))

(declare-fun mapValue!37302 () ValueCell!11258)

(assert (=> mapNonEmpty!37302 (= (arr!30727 (_values!5930 thiss!1427)) (store mapRest!37302 mapKey!37302 mapValue!37302))))

(declare-fun b!1022128 () Bool)

(declare-fun res!684782 () Bool)

(declare-fun e!575770 () Bool)

(assert (=> b!1022128 (=> (not res!684782) (not e!575770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022128 (= res!684782 (validMask!0 (mask!29493 thiss!1427)))))

(declare-fun b!1022129 () Bool)

(assert (=> b!1022129 (= e!575770 false)))

(declare-fun lt!449998 () Bool)

(declare-datatypes ((List!21710 0))(
  ( (Nil!21707) (Cons!21706 (h!22904 (_ BitVec 64)) (t!30715 List!21710)) )
))
(declare-fun arrayNoDuplicates!0 (array!63829 (_ BitVec 32) List!21710) Bool)

(assert (=> b!1022129 (= lt!449998 (arrayNoDuplicates!0 (_keys!11048 thiss!1427) #b00000000000000000000000000000000 Nil!21707))))

(declare-fun b!1022130 () Bool)

(declare-fun res!684780 () Bool)

(assert (=> b!1022130 (=> (not res!684780) (not e!575770))))

(assert (=> b!1022130 (= res!684780 (and (= (size!31240 (_values!5930 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29493 thiss!1427))) (= (size!31239 (_keys!11048 thiss!1427)) (size!31240 (_values!5930 thiss!1427))) (bvsge (mask!29493 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5639 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5639 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1022131 () Bool)

(declare-fun res!684781 () Bool)

(assert (=> b!1022131 (=> (not res!684781) (not e!575770))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022131 (= res!684781 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun tp_is_empty!23923 () Bool)

(declare-fun e!575769 () Bool)

(declare-fun e!575771 () Bool)

(declare-fun array_inv!23837 (array!63829) Bool)

(declare-fun array_inv!23838 (array!63831) Bool)

(assert (=> b!1022132 (= e!575769 (and tp!71644 tp_is_empty!23923 (array_inv!23837 (_keys!11048 thiss!1427)) (array_inv!23838 (_values!5930 thiss!1427)) e!575771))))

(declare-fun b!1022133 () Bool)

(declare-fun e!575774 () Bool)

(assert (=> b!1022133 (= e!575771 (and e!575774 mapRes!37302))))

(declare-fun condMapEmpty!37302 () Bool)

(declare-fun mapDefault!37302 () ValueCell!11258)

(assert (=> b!1022133 (= condMapEmpty!37302 (= (arr!30727 (_values!5930 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11258)) mapDefault!37302)))))

(declare-fun b!1022134 () Bool)

(assert (=> b!1022134 (= e!575772 tp_is_empty!23923)))

(declare-fun b!1022135 () Bool)

(declare-fun res!684783 () Bool)

(assert (=> b!1022135 (=> (not res!684783) (not e!575770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63829 (_ BitVec 32)) Bool)

(assert (=> b!1022135 (= res!684783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11048 thiss!1427) (mask!29493 thiss!1427)))))

(declare-fun res!684784 () Bool)

(assert (=> start!89160 (=> (not res!684784) (not e!575770))))

(declare-fun valid!1947 (LongMapFixedSize!5110) Bool)

(assert (=> start!89160 (= res!684784 (valid!1947 thiss!1427))))

(assert (=> start!89160 e!575770))

(assert (=> start!89160 e!575769))

(assert (=> start!89160 true))

(declare-fun mapIsEmpty!37302 () Bool)

(assert (=> mapIsEmpty!37302 mapRes!37302))

(declare-fun b!1022136 () Bool)

(assert (=> b!1022136 (= e!575774 tp_is_empty!23923)))

(assert (= (and start!89160 res!684784) b!1022131))

(assert (= (and b!1022131 res!684781) b!1022128))

(assert (= (and b!1022128 res!684782) b!1022130))

(assert (= (and b!1022130 res!684780) b!1022135))

(assert (= (and b!1022135 res!684783) b!1022129))

(assert (= (and b!1022133 condMapEmpty!37302) mapIsEmpty!37302))

(assert (= (and b!1022133 (not condMapEmpty!37302)) mapNonEmpty!37302))

(get-info :version)

(assert (= (and mapNonEmpty!37302 ((_ is ValueCellFull!11258) mapValue!37302)) b!1022134))

(assert (= (and b!1022133 ((_ is ValueCellFull!11258) mapDefault!37302)) b!1022136))

(assert (= b!1022132 b!1022133))

(assert (= start!89160 b!1022132))

(declare-fun m!940785 () Bool)

(assert (=> b!1022132 m!940785))

(declare-fun m!940787 () Bool)

(assert (=> b!1022132 m!940787))

(declare-fun m!940789 () Bool)

(assert (=> b!1022135 m!940789))

(declare-fun m!940791 () Bool)

(assert (=> mapNonEmpty!37302 m!940791))

(declare-fun m!940793 () Bool)

(assert (=> b!1022129 m!940793))

(declare-fun m!940795 () Bool)

(assert (=> b!1022128 m!940795))

(declare-fun m!940797 () Bool)

(assert (=> start!89160 m!940797))

(check-sat tp_is_empty!23923 (not b!1022128) b_and!32375 (not b!1022132) (not b!1022135) (not b!1022129) (not mapNonEmpty!37302) (not b_next!20203) (not start!89160))
(check-sat b_and!32375 (not b_next!20203))
