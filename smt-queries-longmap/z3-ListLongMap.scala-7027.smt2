; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89172 () Bool)

(assert start!89172)

(declare-fun b!1022286 () Bool)

(declare-fun b_free!20215 () Bool)

(declare-fun b_next!20215 () Bool)

(assert (=> b!1022286 (= b_free!20215 (not b_next!20215))))

(declare-fun tp!71680 () Bool)

(declare-fun b_and!32387 () Bool)

(assert (=> b!1022286 (= tp!71680 b_and!32387)))

(declare-fun res!684865 () Bool)

(declare-fun e!575881 () Bool)

(assert (=> start!89172 (=> (not res!684865) (not e!575881))))

(declare-datatypes ((V!36787 0))(
  ( (V!36788 (val!12018 Int)) )
))
(declare-datatypes ((ValueCell!11264 0))(
  ( (ValueCellFull!11264 (v!14586 V!36787)) (EmptyCell!11264) )
))
(declare-datatypes ((array!63853 0))(
  ( (array!63854 (arr!30738 (Array (_ BitVec 32) (_ BitVec 64))) (size!31251 (_ BitVec 32))) )
))
(declare-datatypes ((array!63855 0))(
  ( (array!63856 (arr!30739 (Array (_ BitVec 32) ValueCell!11264)) (size!31252 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5122 0))(
  ( (LongMapFixedSize!5123 (defaultEntry!5913 Int) (mask!29503 (_ BitVec 32)) (extraKeys!5645 (_ BitVec 32)) (zeroValue!5749 V!36787) (minValue!5749 V!36787) (_size!2616 (_ BitVec 32)) (_keys!11054 array!63853) (_values!5936 array!63855) (_vacant!2616 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5122)

(declare-fun valid!1952 (LongMapFixedSize!5122) Bool)

(assert (=> start!89172 (= res!684865 (valid!1952 thiss!1427))))

(assert (=> start!89172 e!575881))

(declare-fun e!575877 () Bool)

(assert (=> start!89172 e!575877))

(assert (=> start!89172 true))

(declare-fun b!1022284 () Bool)

(assert (=> b!1022284 (= e!575881 (not true))))

(declare-fun lt!450022 () Bool)

(declare-fun lt!450020 () V!36787)

(assert (=> b!1022284 (= lt!450022 (valid!1952 (LongMapFixedSize!5123 (defaultEntry!5913 thiss!1427) (mask!29503 thiss!1427) (bvand (extraKeys!5645 thiss!1427) #b00000000000000000000000000000010) lt!450020 (minValue!5749 thiss!1427) (_size!2616 thiss!1427) (_keys!11054 thiss!1427) (_values!5936 thiss!1427) (_vacant!2616 thiss!1427))))))

(declare-datatypes ((tuple2!15574 0))(
  ( (tuple2!15575 (_1!7798 (_ BitVec 64)) (_2!7798 V!36787)) )
))
(declare-datatypes ((List!21714 0))(
  ( (Nil!21711) (Cons!21710 (h!22908 tuple2!15574) (t!30721 List!21714)) )
))
(declare-datatypes ((ListLongMap!13707 0))(
  ( (ListLongMap!13708 (toList!6869 List!21714)) )
))
(declare-fun -!461 (ListLongMap!13707 (_ BitVec 64)) ListLongMap!13707)

(declare-fun getCurrentListMap!3836 (array!63853 array!63855 (_ BitVec 32) (_ BitVec 32) V!36787 V!36787 (_ BitVec 32) Int) ListLongMap!13707)

(assert (=> b!1022284 (= (-!461 (getCurrentListMap!3836 (_keys!11054 thiss!1427) (_values!5936 thiss!1427) (mask!29503 thiss!1427) (extraKeys!5645 thiss!1427) (zeroValue!5749 thiss!1427) (minValue!5749 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5913 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3836 (_keys!11054 thiss!1427) (_values!5936 thiss!1427) (mask!29503 thiss!1427) (bvand (extraKeys!5645 thiss!1427) #b00000000000000000000000000000010) lt!450020 (minValue!5749 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5913 thiss!1427)))))

(declare-datatypes ((Unit!33207 0))(
  ( (Unit!33208) )
))
(declare-fun lt!450021 () Unit!33207)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!2 (array!63853 array!63855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36787 V!36787 V!36787 Int) Unit!33207)

(assert (=> b!1022284 (= lt!450021 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!2 (_keys!11054 thiss!1427) (_values!5936 thiss!1427) (mask!29503 thiss!1427) (extraKeys!5645 thiss!1427) (bvand (extraKeys!5645 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5749 thiss!1427) lt!450020 (minValue!5749 thiss!1427) (defaultEntry!5913 thiss!1427)))))

(declare-fun dynLambda!1923 (Int (_ BitVec 64)) V!36787)

(assert (=> b!1022284 (= lt!450020 (dynLambda!1923 (defaultEntry!5913 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1022285 () Bool)

(declare-fun e!575880 () Bool)

(declare-fun e!575882 () Bool)

(declare-fun mapRes!37320 () Bool)

(assert (=> b!1022285 (= e!575880 (and e!575882 mapRes!37320))))

(declare-fun condMapEmpty!37320 () Bool)

(declare-fun mapDefault!37320 () ValueCell!11264)

(assert (=> b!1022285 (= condMapEmpty!37320 (= (arr!30739 (_values!5936 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11264)) mapDefault!37320)))))

(declare-fun mapNonEmpty!37320 () Bool)

(declare-fun tp!71679 () Bool)

(declare-fun e!575878 () Bool)

(assert (=> mapNonEmpty!37320 (= mapRes!37320 (and tp!71679 e!575878))))

(declare-fun mapRest!37320 () (Array (_ BitVec 32) ValueCell!11264))

(declare-fun mapValue!37320 () ValueCell!11264)

(declare-fun mapKey!37320 () (_ BitVec 32))

(assert (=> mapNonEmpty!37320 (= (arr!30739 (_values!5936 thiss!1427)) (store mapRest!37320 mapKey!37320 mapValue!37320))))

(declare-fun tp_is_empty!23935 () Bool)

(declare-fun array_inv!23845 (array!63853) Bool)

(declare-fun array_inv!23846 (array!63855) Bool)

(assert (=> b!1022286 (= e!575877 (and tp!71680 tp_is_empty!23935 (array_inv!23845 (_keys!11054 thiss!1427)) (array_inv!23846 (_values!5936 thiss!1427)) e!575880))))

(declare-fun b!1022287 () Bool)

(assert (=> b!1022287 (= e!575878 tp_is_empty!23935)))

(declare-fun mapIsEmpty!37320 () Bool)

(assert (=> mapIsEmpty!37320 mapRes!37320))

(declare-fun b!1022288 () Bool)

(declare-fun res!684864 () Bool)

(assert (=> b!1022288 (=> (not res!684864) (not e!575881))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022288 (= res!684864 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022289 () Bool)

(assert (=> b!1022289 (= e!575882 tp_is_empty!23935)))

(assert (= (and start!89172 res!684865) b!1022288))

(assert (= (and b!1022288 res!684864) b!1022284))

(assert (= (and b!1022285 condMapEmpty!37320) mapIsEmpty!37320))

(assert (= (and b!1022285 (not condMapEmpty!37320)) mapNonEmpty!37320))

(get-info :version)

(assert (= (and mapNonEmpty!37320 ((_ is ValueCellFull!11264) mapValue!37320)) b!1022287))

(assert (= (and b!1022285 ((_ is ValueCellFull!11264) mapDefault!37320)) b!1022289))

(assert (= b!1022286 b!1022285))

(assert (= start!89172 b!1022286))

(declare-fun b_lambda!15649 () Bool)

(assert (=> (not b_lambda!15649) (not b!1022284)))

(declare-fun t!30720 () Bool)

(declare-fun tb!6831 () Bool)

(assert (=> (and b!1022286 (= (defaultEntry!5913 thiss!1427) (defaultEntry!5913 thiss!1427)) t!30720) tb!6831))

(declare-fun result!13979 () Bool)

(assert (=> tb!6831 (= result!13979 tp_is_empty!23935)))

(assert (=> b!1022284 t!30720))

(declare-fun b_and!32389 () Bool)

(assert (= b_and!32387 (and (=> t!30720 result!13979) b_and!32389)))

(declare-fun m!940869 () Bool)

(assert (=> start!89172 m!940869))

(declare-fun m!940871 () Bool)

(assert (=> b!1022284 m!940871))

(declare-fun m!940873 () Bool)

(assert (=> b!1022284 m!940873))

(declare-fun m!940875 () Bool)

(assert (=> b!1022284 m!940875))

(declare-fun m!940877 () Bool)

(assert (=> b!1022284 m!940877))

(assert (=> b!1022284 m!940875))

(declare-fun m!940879 () Bool)

(assert (=> b!1022284 m!940879))

(declare-fun m!940881 () Bool)

(assert (=> b!1022284 m!940881))

(declare-fun m!940883 () Bool)

(assert (=> mapNonEmpty!37320 m!940883))

(declare-fun m!940885 () Bool)

(assert (=> b!1022286 m!940885))

(declare-fun m!940887 () Bool)

(assert (=> b!1022286 m!940887))

(check-sat (not b_next!20215) tp_is_empty!23935 (not mapNonEmpty!37320) (not b_lambda!15649) (not start!89172) (not b!1022286) (not b!1022284) b_and!32389)
(check-sat b_and!32389 (not b_next!20215))
