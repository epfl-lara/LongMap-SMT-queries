; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89176 () Bool)

(assert start!89176)

(declare-fun b!1022458 () Bool)

(declare-fun b_free!20217 () Bool)

(declare-fun b_next!20217 () Bool)

(assert (=> b!1022458 (= b_free!20217 (not b_next!20217))))

(declare-fun tp!71685 () Bool)

(declare-fun b_and!32417 () Bool)

(assert (=> b!1022458 (= tp!71685 b_and!32417)))

(declare-fun b!1022455 () Bool)

(declare-fun res!684937 () Bool)

(declare-fun e!575989 () Bool)

(assert (=> b!1022455 (=> (not res!684937) (not e!575989))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022455 (= res!684937 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022456 () Bool)

(declare-fun e!575986 () Bool)

(declare-fun tp_is_empty!23937 () Bool)

(assert (=> b!1022456 (= e!575986 tp_is_empty!23937)))

(declare-fun b!1022457 () Bool)

(declare-fun e!575987 () Bool)

(assert (=> b!1022457 (= e!575987 tp_is_empty!23937)))

(declare-fun e!575988 () Bool)

(declare-datatypes ((V!36789 0))(
  ( (V!36790 (val!12019 Int)) )
))
(declare-datatypes ((ValueCell!11265 0))(
  ( (ValueCellFull!11265 (v!14588 V!36789)) (EmptyCell!11265) )
))
(declare-datatypes ((array!63918 0))(
  ( (array!63919 (arr!30771 (Array (_ BitVec 32) (_ BitVec 64))) (size!31282 (_ BitVec 32))) )
))
(declare-datatypes ((array!63920 0))(
  ( (array!63921 (arr!30772 (Array (_ BitVec 32) ValueCell!11265)) (size!31283 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5124 0))(
  ( (LongMapFixedSize!5125 (defaultEntry!5914 Int) (mask!29509 (_ BitVec 32)) (extraKeys!5646 (_ BitVec 32)) (zeroValue!5750 V!36789) (minValue!5750 V!36789) (_size!2617 (_ BitVec 32)) (_keys!11059 array!63918) (_values!5937 array!63920) (_vacant!2617 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5124)

(declare-fun e!575991 () Bool)

(declare-fun array_inv!23853 (array!63918) Bool)

(declare-fun array_inv!23854 (array!63920) Bool)

(assert (=> b!1022458 (= e!575988 (and tp!71685 tp_is_empty!23937 (array_inv!23853 (_keys!11059 thiss!1427)) (array_inv!23854 (_values!5937 thiss!1427)) e!575991))))

(declare-fun res!684938 () Bool)

(assert (=> start!89176 (=> (not res!684938) (not e!575989))))

(declare-fun valid!1951 (LongMapFixedSize!5124) Bool)

(assert (=> start!89176 (= res!684938 (valid!1951 thiss!1427))))

(assert (=> start!89176 e!575989))

(assert (=> start!89176 e!575988))

(assert (=> start!89176 true))

(declare-fun b!1022459 () Bool)

(declare-fun mapRes!37323 () Bool)

(assert (=> b!1022459 (= e!575991 (and e!575987 mapRes!37323))))

(declare-fun condMapEmpty!37323 () Bool)

(declare-fun mapDefault!37323 () ValueCell!11265)

(assert (=> b!1022459 (= condMapEmpty!37323 (= (arr!30772 (_values!5937 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11265)) mapDefault!37323)))))

(declare-fun mapIsEmpty!37323 () Bool)

(assert (=> mapIsEmpty!37323 mapRes!37323))

(declare-fun b!1022460 () Bool)

(assert (=> b!1022460 (= e!575989 (not true))))

(declare-fun lt!450231 () Bool)

(declare-fun lt!450230 () V!36789)

(assert (=> b!1022460 (= lt!450231 (valid!1951 (LongMapFixedSize!5125 (defaultEntry!5914 thiss!1427) (mask!29509 thiss!1427) (bvand (extraKeys!5646 thiss!1427) #b00000000000000000000000000000010) lt!450230 (minValue!5750 thiss!1427) (_size!2617 thiss!1427) (_keys!11059 thiss!1427) (_values!5937 thiss!1427) (_vacant!2617 thiss!1427))))))

(declare-datatypes ((tuple2!15496 0))(
  ( (tuple2!15497 (_1!7759 (_ BitVec 64)) (_2!7759 V!36789)) )
))
(declare-datatypes ((List!21682 0))(
  ( (Nil!21679) (Cons!21678 (h!22876 tuple2!15496) (t!30700 List!21682)) )
))
(declare-datatypes ((ListLongMap!13637 0))(
  ( (ListLongMap!13638 (toList!6834 List!21682)) )
))
(declare-fun -!461 (ListLongMap!13637 (_ BitVec 64)) ListLongMap!13637)

(declare-fun getCurrentListMap!3882 (array!63918 array!63920 (_ BitVec 32) (_ BitVec 32) V!36789 V!36789 (_ BitVec 32) Int) ListLongMap!13637)

(assert (=> b!1022460 (= (-!461 (getCurrentListMap!3882 (_keys!11059 thiss!1427) (_values!5937 thiss!1427) (mask!29509 thiss!1427) (extraKeys!5646 thiss!1427) (zeroValue!5750 thiss!1427) (minValue!5750 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5914 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3882 (_keys!11059 thiss!1427) (_values!5937 thiss!1427) (mask!29509 thiss!1427) (bvand (extraKeys!5646 thiss!1427) #b00000000000000000000000000000010) lt!450230 (minValue!5750 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5914 thiss!1427)))))

(declare-datatypes ((Unit!33311 0))(
  ( (Unit!33312) )
))
(declare-fun lt!450229 () Unit!33311)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!2 (array!63918 array!63920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36789 V!36789 V!36789 Int) Unit!33311)

(assert (=> b!1022460 (= lt!450229 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!2 (_keys!11059 thiss!1427) (_values!5937 thiss!1427) (mask!29509 thiss!1427) (extraKeys!5646 thiss!1427) (bvand (extraKeys!5646 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5750 thiss!1427) lt!450230 (minValue!5750 thiss!1427) (defaultEntry!5914 thiss!1427)))))

(declare-fun dynLambda!1931 (Int (_ BitVec 64)) V!36789)

(assert (=> b!1022460 (= lt!450230 (dynLambda!1931 (defaultEntry!5914 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37323 () Bool)

(declare-fun tp!71686 () Bool)

(assert (=> mapNonEmpty!37323 (= mapRes!37323 (and tp!71686 e!575986))))

(declare-fun mapRest!37323 () (Array (_ BitVec 32) ValueCell!11265))

(declare-fun mapValue!37323 () ValueCell!11265)

(declare-fun mapKey!37323 () (_ BitVec 32))

(assert (=> mapNonEmpty!37323 (= (arr!30772 (_values!5937 thiss!1427)) (store mapRest!37323 mapKey!37323 mapValue!37323))))

(assert (= (and start!89176 res!684938) b!1022455))

(assert (= (and b!1022455 res!684937) b!1022460))

(assert (= (and b!1022459 condMapEmpty!37323) mapIsEmpty!37323))

(assert (= (and b!1022459 (not condMapEmpty!37323)) mapNonEmpty!37323))

(get-info :version)

(assert (= (and mapNonEmpty!37323 ((_ is ValueCellFull!11265) mapValue!37323)) b!1022456))

(assert (= (and b!1022459 ((_ is ValueCellFull!11265) mapDefault!37323)) b!1022457))

(assert (= b!1022458 b!1022459))

(assert (= start!89176 b!1022458))

(declare-fun b_lambda!15673 () Bool)

(assert (=> (not b_lambda!15673) (not b!1022460)))

(declare-fun t!30699 () Bool)

(declare-fun tb!6841 () Bool)

(assert (=> (and b!1022458 (= (defaultEntry!5914 thiss!1427) (defaultEntry!5914 thiss!1427)) t!30699) tb!6841))

(declare-fun result!13991 () Bool)

(assert (=> tb!6841 (= result!13991 tp_is_empty!23937)))

(assert (=> b!1022460 t!30699))

(declare-fun b_and!32419 () Bool)

(assert (= b_and!32417 (and (=> t!30699 result!13991) b_and!32419)))

(declare-fun m!941509 () Bool)

(assert (=> b!1022458 m!941509))

(declare-fun m!941511 () Bool)

(assert (=> b!1022458 m!941511))

(declare-fun m!941513 () Bool)

(assert (=> start!89176 m!941513))

(declare-fun m!941515 () Bool)

(assert (=> b!1022460 m!941515))

(declare-fun m!941517 () Bool)

(assert (=> b!1022460 m!941517))

(declare-fun m!941519 () Bool)

(assert (=> b!1022460 m!941519))

(declare-fun m!941521 () Bool)

(assert (=> b!1022460 m!941521))

(declare-fun m!941523 () Bool)

(assert (=> b!1022460 m!941523))

(declare-fun m!941525 () Bool)

(assert (=> b!1022460 m!941525))

(assert (=> b!1022460 m!941523))

(declare-fun m!941527 () Bool)

(assert (=> mapNonEmpty!37323 m!941527))

(check-sat (not b_next!20217) (not b!1022458) (not b_lambda!15673) (not b!1022460) (not mapNonEmpty!37323) tp_is_empty!23937 (not start!89176) b_and!32419)
(check-sat b_and!32419 (not b_next!20217))
