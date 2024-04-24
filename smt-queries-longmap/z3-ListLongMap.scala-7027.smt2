; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89408 () Bool)

(assert start!89408)

(declare-fun b!1023753 () Bool)

(declare-fun b_free!20215 () Bool)

(declare-fun b_next!20215 () Bool)

(assert (=> b!1023753 (= b_free!20215 (not b_next!20215))))

(declare-fun tp!71679 () Bool)

(declare-fun b_and!32423 () Bool)

(assert (=> b!1023753 (= tp!71679 b_and!32423)))

(declare-fun b!1023750 () Bool)

(declare-fun e!576816 () Bool)

(declare-fun tp_is_empty!23935 () Bool)

(assert (=> b!1023750 (= e!576816 tp_is_empty!23935)))

(declare-fun b!1023751 () Bool)

(declare-fun e!576811 () Bool)

(assert (=> b!1023751 (= e!576811 (not true))))

(declare-fun lt!450736 () Bool)

(declare-datatypes ((V!36787 0))(
  ( (V!36788 (val!12018 Int)) )
))
(declare-datatypes ((ValueCell!11264 0))(
  ( (ValueCellFull!11264 (v!14583 V!36787)) (EmptyCell!11264) )
))
(declare-datatypes ((array!63963 0))(
  ( (array!63964 (arr!30787 (Array (_ BitVec 32) (_ BitVec 64))) (size!31299 (_ BitVec 32))) )
))
(declare-datatypes ((array!63965 0))(
  ( (array!63966 (arr!30788 (Array (_ BitVec 32) ValueCell!11264)) (size!31300 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5122 0))(
  ( (LongMapFixedSize!5123 (defaultEntry!5913 Int) (mask!29568 (_ BitVec 32)) (extraKeys!5645 (_ BitVec 32)) (zeroValue!5749 V!36787) (minValue!5749 V!36787) (_size!2616 (_ BitVec 32)) (_keys!11096 array!63963) (_values!5936 array!63965) (_vacant!2616 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5122)

(declare-fun lt!450737 () V!36787)

(declare-fun valid!1956 (LongMapFixedSize!5122) Bool)

(assert (=> b!1023751 (= lt!450736 (valid!1956 (LongMapFixedSize!5123 (defaultEntry!5913 thiss!1427) (mask!29568 thiss!1427) (bvand (extraKeys!5645 thiss!1427) #b00000000000000000000000000000010) lt!450737 (minValue!5749 thiss!1427) (_size!2616 thiss!1427) (_keys!11096 thiss!1427) (_values!5936 thiss!1427) (_vacant!2616 thiss!1427))))))

(declare-datatypes ((tuple2!15496 0))(
  ( (tuple2!15497 (_1!7759 (_ BitVec 64)) (_2!7759 V!36787)) )
))
(declare-datatypes ((List!21669 0))(
  ( (Nil!21666) (Cons!21665 (h!22872 tuple2!15496) (t!30677 List!21669)) )
))
(declare-datatypes ((ListLongMap!13641 0))(
  ( (ListLongMap!13642 (toList!6836 List!21669)) )
))
(declare-fun -!459 (ListLongMap!13641 (_ BitVec 64)) ListLongMap!13641)

(declare-fun getCurrentListMap!3882 (array!63963 array!63965 (_ BitVec 32) (_ BitVec 32) V!36787 V!36787 (_ BitVec 32) Int) ListLongMap!13641)

(assert (=> b!1023751 (= (-!459 (getCurrentListMap!3882 (_keys!11096 thiss!1427) (_values!5936 thiss!1427) (mask!29568 thiss!1427) (extraKeys!5645 thiss!1427) (zeroValue!5749 thiss!1427) (minValue!5749 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5913 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3882 (_keys!11096 thiss!1427) (_values!5936 thiss!1427) (mask!29568 thiss!1427) (bvand (extraKeys!5645 thiss!1427) #b00000000000000000000000000000010) lt!450737 (minValue!5749 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5913 thiss!1427)))))

(declare-datatypes ((Unit!33312 0))(
  ( (Unit!33313) )
))
(declare-fun lt!450735 () Unit!33312)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!2 (array!63963 array!63965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36787 V!36787 V!36787 Int) Unit!33312)

(assert (=> b!1023751 (= lt!450735 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!2 (_keys!11096 thiss!1427) (_values!5936 thiss!1427) (mask!29568 thiss!1427) (extraKeys!5645 thiss!1427) (bvand (extraKeys!5645 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5749 thiss!1427) lt!450737 (minValue!5749 thiss!1427) (defaultEntry!5913 thiss!1427)))))

(declare-fun dynLambda!1953 (Int (_ BitVec 64)) V!36787)

(assert (=> b!1023751 (= lt!450737 (dynLambda!1953 (defaultEntry!5913 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!685442 () Bool)

(assert (=> start!89408 (=> (not res!685442) (not e!576811))))

(assert (=> start!89408 (= res!685442 (valid!1956 thiss!1427))))

(assert (=> start!89408 e!576811))

(declare-fun e!576813 () Bool)

(assert (=> start!89408 e!576813))

(assert (=> start!89408 true))

(declare-fun b!1023752 () Bool)

(declare-fun e!576815 () Bool)

(declare-fun mapRes!37320 () Bool)

(assert (=> b!1023752 (= e!576815 (and e!576816 mapRes!37320))))

(declare-fun condMapEmpty!37320 () Bool)

(declare-fun mapDefault!37320 () ValueCell!11264)

(assert (=> b!1023752 (= condMapEmpty!37320 (= (arr!30788 (_values!5936 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11264)) mapDefault!37320)))))

(declare-fun mapIsEmpty!37320 () Bool)

(assert (=> mapIsEmpty!37320 mapRes!37320))

(declare-fun array_inv!23881 (array!63963) Bool)

(declare-fun array_inv!23882 (array!63965) Bool)

(assert (=> b!1023753 (= e!576813 (and tp!71679 tp_is_empty!23935 (array_inv!23881 (_keys!11096 thiss!1427)) (array_inv!23882 (_values!5936 thiss!1427)) e!576815))))

(declare-fun b!1023754 () Bool)

(declare-fun e!576812 () Bool)

(assert (=> b!1023754 (= e!576812 tp_is_empty!23935)))

(declare-fun b!1023755 () Bool)

(declare-fun res!685441 () Bool)

(assert (=> b!1023755 (=> (not res!685441) (not e!576811))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023755 (= res!685441 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37320 () Bool)

(declare-fun tp!71680 () Bool)

(assert (=> mapNonEmpty!37320 (= mapRes!37320 (and tp!71680 e!576812))))

(declare-fun mapValue!37320 () ValueCell!11264)

(declare-fun mapKey!37320 () (_ BitVec 32))

(declare-fun mapRest!37320 () (Array (_ BitVec 32) ValueCell!11264))

(assert (=> mapNonEmpty!37320 (= (arr!30788 (_values!5936 thiss!1427)) (store mapRest!37320 mapKey!37320 mapValue!37320))))

(assert (= (and start!89408 res!685442) b!1023755))

(assert (= (and b!1023755 res!685441) b!1023751))

(assert (= (and b!1023752 condMapEmpty!37320) mapIsEmpty!37320))

(assert (= (and b!1023752 (not condMapEmpty!37320)) mapNonEmpty!37320))

(get-info :version)

(assert (= (and mapNonEmpty!37320 ((_ is ValueCellFull!11264) mapValue!37320)) b!1023754))

(assert (= (and b!1023752 ((_ is ValueCellFull!11264) mapDefault!37320)) b!1023750))

(assert (= b!1023753 b!1023752))

(assert (= start!89408 b!1023753))

(declare-fun b_lambda!15681 () Bool)

(assert (=> (not b_lambda!15681) (not b!1023751)))

(declare-fun t!30676 () Bool)

(declare-fun tb!6831 () Bool)

(assert (=> (and b!1023753 (= (defaultEntry!5913 thiss!1427) (defaultEntry!5913 thiss!1427)) t!30676) tb!6831))

(declare-fun result!13979 () Bool)

(assert (=> tb!6831 (= result!13979 tp_is_empty!23935)))

(assert (=> b!1023751 t!30676))

(declare-fun b_and!32425 () Bool)

(assert (= b_and!32423 (and (=> t!30676 result!13979) b_and!32425)))

(declare-fun m!943153 () Bool)

(assert (=> b!1023751 m!943153))

(declare-fun m!943155 () Bool)

(assert (=> b!1023751 m!943155))

(declare-fun m!943157 () Bool)

(assert (=> b!1023751 m!943157))

(declare-fun m!943159 () Bool)

(assert (=> b!1023751 m!943159))

(declare-fun m!943161 () Bool)

(assert (=> b!1023751 m!943161))

(declare-fun m!943163 () Bool)

(assert (=> b!1023751 m!943163))

(assert (=> b!1023751 m!943161))

(declare-fun m!943165 () Bool)

(assert (=> start!89408 m!943165))

(declare-fun m!943167 () Bool)

(assert (=> b!1023753 m!943167))

(declare-fun m!943169 () Bool)

(assert (=> b!1023753 m!943169))

(declare-fun m!943171 () Bool)

(assert (=> mapNonEmpty!37320 m!943171))

(check-sat (not b!1023751) (not b_lambda!15681) (not start!89408) (not b!1023753) tp_is_empty!23935 (not mapNonEmpty!37320) (not b_next!20215) b_and!32425)
(check-sat b_and!32425 (not b_next!20215))
