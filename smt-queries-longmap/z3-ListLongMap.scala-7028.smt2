; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89178 () Bool)

(assert start!89178)

(declare-fun b!1022349 () Bool)

(declare-fun b_free!20221 () Bool)

(declare-fun b_next!20221 () Bool)

(assert (=> b!1022349 (= b_free!20221 (not b_next!20221))))

(declare-fun tp!71697 () Bool)

(declare-fun b_and!32399 () Bool)

(assert (=> b!1022349 (= tp!71697 b_and!32399)))

(declare-fun b!1022344 () Bool)

(declare-fun e!575936 () Bool)

(declare-fun tp_is_empty!23941 () Bool)

(assert (=> b!1022344 (= e!575936 tp_is_empty!23941)))

(declare-fun b!1022345 () Bool)

(declare-fun e!575933 () Bool)

(assert (=> b!1022345 (= e!575933 tp_is_empty!23941)))

(declare-fun b!1022346 () Bool)

(declare-fun e!575935 () Bool)

(declare-fun mapRes!37329 () Bool)

(assert (=> b!1022346 (= e!575935 (and e!575936 mapRes!37329))))

(declare-fun condMapEmpty!37329 () Bool)

(declare-datatypes ((V!36795 0))(
  ( (V!36796 (val!12021 Int)) )
))
(declare-datatypes ((ValueCell!11267 0))(
  ( (ValueCellFull!11267 (v!14589 V!36795)) (EmptyCell!11267) )
))
(declare-datatypes ((array!63865 0))(
  ( (array!63866 (arr!30744 (Array (_ BitVec 32) (_ BitVec 64))) (size!31257 (_ BitVec 32))) )
))
(declare-datatypes ((array!63867 0))(
  ( (array!63868 (arr!30745 (Array (_ BitVec 32) ValueCell!11267)) (size!31258 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5128 0))(
  ( (LongMapFixedSize!5129 (defaultEntry!5916 Int) (mask!29508 (_ BitVec 32)) (extraKeys!5648 (_ BitVec 32)) (zeroValue!5752 V!36795) (minValue!5752 V!36795) (_size!2619 (_ BitVec 32)) (_keys!11057 array!63865) (_values!5939 array!63867) (_vacant!2619 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5128)

(declare-fun mapDefault!37329 () ValueCell!11267)

(assert (=> b!1022346 (= condMapEmpty!37329 (= (arr!30745 (_values!5939 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11267)) mapDefault!37329)))))

(declare-fun res!684883 () Bool)

(declare-fun e!575934 () Bool)

(assert (=> start!89178 (=> (not res!684883) (not e!575934))))

(declare-fun valid!1955 (LongMapFixedSize!5128) Bool)

(assert (=> start!89178 (= res!684883 (valid!1955 thiss!1427))))

(assert (=> start!89178 e!575934))

(declare-fun e!575931 () Bool)

(assert (=> start!89178 e!575931))

(assert (=> start!89178 true))

(declare-fun mapNonEmpty!37329 () Bool)

(declare-fun tp!71698 () Bool)

(assert (=> mapNonEmpty!37329 (= mapRes!37329 (and tp!71698 e!575933))))

(declare-fun mapKey!37329 () (_ BitVec 32))

(declare-fun mapValue!37329 () ValueCell!11267)

(declare-fun mapRest!37329 () (Array (_ BitVec 32) ValueCell!11267))

(assert (=> mapNonEmpty!37329 (= (arr!30745 (_values!5939 thiss!1427)) (store mapRest!37329 mapKey!37329 mapValue!37329))))

(declare-fun b!1022347 () Bool)

(assert (=> b!1022347 (= e!575934 (not true))))

(declare-fun lt!450049 () Bool)

(declare-fun lt!450048 () V!36795)

(assert (=> b!1022347 (= lt!450049 (valid!1955 (LongMapFixedSize!5129 (defaultEntry!5916 thiss!1427) (mask!29508 thiss!1427) (bvand (extraKeys!5648 thiss!1427) #b00000000000000000000000000000010) lt!450048 (minValue!5752 thiss!1427) (_size!2619 thiss!1427) (_keys!11057 thiss!1427) (_values!5939 thiss!1427) (_vacant!2619 thiss!1427))))))

(declare-datatypes ((tuple2!15580 0))(
  ( (tuple2!15581 (_1!7801 (_ BitVec 64)) (_2!7801 V!36795)) )
))
(declare-datatypes ((List!21717 0))(
  ( (Nil!21714) (Cons!21713 (h!22911 tuple2!15580) (t!30730 List!21717)) )
))
(declare-datatypes ((ListLongMap!13713 0))(
  ( (ListLongMap!13714 (toList!6872 List!21717)) )
))
(declare-fun -!464 (ListLongMap!13713 (_ BitVec 64)) ListLongMap!13713)

(declare-fun getCurrentListMap!3839 (array!63865 array!63867 (_ BitVec 32) (_ BitVec 32) V!36795 V!36795 (_ BitVec 32) Int) ListLongMap!13713)

(assert (=> b!1022347 (= (-!464 (getCurrentListMap!3839 (_keys!11057 thiss!1427) (_values!5939 thiss!1427) (mask!29508 thiss!1427) (extraKeys!5648 thiss!1427) (zeroValue!5752 thiss!1427) (minValue!5752 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5916 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3839 (_keys!11057 thiss!1427) (_values!5939 thiss!1427) (mask!29508 thiss!1427) (bvand (extraKeys!5648 thiss!1427) #b00000000000000000000000000000010) lt!450048 (minValue!5752 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5916 thiss!1427)))))

(declare-datatypes ((Unit!33213 0))(
  ( (Unit!33214) )
))
(declare-fun lt!450047 () Unit!33213)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!5 (array!63865 array!63867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36795 V!36795 V!36795 Int) Unit!33213)

(assert (=> b!1022347 (= lt!450047 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!5 (_keys!11057 thiss!1427) (_values!5939 thiss!1427) (mask!29508 thiss!1427) (extraKeys!5648 thiss!1427) (bvand (extraKeys!5648 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5752 thiss!1427) lt!450048 (minValue!5752 thiss!1427) (defaultEntry!5916 thiss!1427)))))

(declare-fun dynLambda!1926 (Int (_ BitVec 64)) V!36795)

(assert (=> b!1022347 (= lt!450048 (dynLambda!1926 (defaultEntry!5916 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1022348 () Bool)

(declare-fun res!684882 () Bool)

(assert (=> b!1022348 (=> (not res!684882) (not e!575934))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022348 (= res!684882 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun array_inv!23849 (array!63865) Bool)

(declare-fun array_inv!23850 (array!63867) Bool)

(assert (=> b!1022349 (= e!575931 (and tp!71697 tp_is_empty!23941 (array_inv!23849 (_keys!11057 thiss!1427)) (array_inv!23850 (_values!5939 thiss!1427)) e!575935))))

(declare-fun mapIsEmpty!37329 () Bool)

(assert (=> mapIsEmpty!37329 mapRes!37329))

(assert (= (and start!89178 res!684883) b!1022348))

(assert (= (and b!1022348 res!684882) b!1022347))

(assert (= (and b!1022346 condMapEmpty!37329) mapIsEmpty!37329))

(assert (= (and b!1022346 (not condMapEmpty!37329)) mapNonEmpty!37329))

(get-info :version)

(assert (= (and mapNonEmpty!37329 ((_ is ValueCellFull!11267) mapValue!37329)) b!1022345))

(assert (= (and b!1022346 ((_ is ValueCellFull!11267) mapDefault!37329)) b!1022344))

(assert (= b!1022349 b!1022346))

(assert (= start!89178 b!1022349))

(declare-fun b_lambda!15655 () Bool)

(assert (=> (not b_lambda!15655) (not b!1022347)))

(declare-fun t!30729 () Bool)

(declare-fun tb!6837 () Bool)

(assert (=> (and b!1022349 (= (defaultEntry!5916 thiss!1427) (defaultEntry!5916 thiss!1427)) t!30729) tb!6837))

(declare-fun result!13991 () Bool)

(assert (=> tb!6837 (= result!13991 tp_is_empty!23941)))

(assert (=> b!1022347 t!30729))

(declare-fun b_and!32401 () Bool)

(assert (= b_and!32399 (and (=> t!30729 result!13991) b_and!32401)))

(declare-fun m!940929 () Bool)

(assert (=> start!89178 m!940929))

(declare-fun m!940931 () Bool)

(assert (=> mapNonEmpty!37329 m!940931))

(declare-fun m!940933 () Bool)

(assert (=> b!1022347 m!940933))

(declare-fun m!940935 () Bool)

(assert (=> b!1022347 m!940935))

(declare-fun m!940937 () Bool)

(assert (=> b!1022347 m!940937))

(declare-fun m!940939 () Bool)

(assert (=> b!1022347 m!940939))

(declare-fun m!940941 () Bool)

(assert (=> b!1022347 m!940941))

(declare-fun m!940943 () Bool)

(assert (=> b!1022347 m!940943))

(assert (=> b!1022347 m!940941))

(declare-fun m!940945 () Bool)

(assert (=> b!1022349 m!940945))

(declare-fun m!940947 () Bool)

(assert (=> b!1022349 m!940947))

(check-sat tp_is_empty!23941 (not mapNonEmpty!37329) (not b_lambda!15655) (not b!1022349) (not b_next!20221) (not start!89178) (not b!1022347) b_and!32401)
(check-sat b_and!32401 (not b_next!20221))
