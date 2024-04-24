; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89414 () Bool)

(assert start!89414)

(declare-fun b!1023810 () Bool)

(declare-fun b_free!20221 () Bool)

(declare-fun b_next!20221 () Bool)

(assert (=> b!1023810 (= b_free!20221 (not b_next!20221))))

(declare-fun tp!71698 () Bool)

(declare-fun b_and!32435 () Bool)

(assert (=> b!1023810 (= tp!71698 b_and!32435)))

(declare-fun tp_is_empty!23941 () Bool)

(declare-fun e!576869 () Bool)

(declare-fun e!576870 () Bool)

(declare-datatypes ((V!36795 0))(
  ( (V!36796 (val!12021 Int)) )
))
(declare-datatypes ((ValueCell!11267 0))(
  ( (ValueCellFull!11267 (v!14586 V!36795)) (EmptyCell!11267) )
))
(declare-datatypes ((array!63975 0))(
  ( (array!63976 (arr!30793 (Array (_ BitVec 32) (_ BitVec 64))) (size!31305 (_ BitVec 32))) )
))
(declare-datatypes ((array!63977 0))(
  ( (array!63978 (arr!30794 (Array (_ BitVec 32) ValueCell!11267)) (size!31306 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5128 0))(
  ( (LongMapFixedSize!5129 (defaultEntry!5916 Int) (mask!29573 (_ BitVec 32)) (extraKeys!5648 (_ BitVec 32)) (zeroValue!5752 V!36795) (minValue!5752 V!36795) (_size!2619 (_ BitVec 32)) (_keys!11099 array!63975) (_values!5939 array!63977) (_vacant!2619 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5128)

(declare-fun array_inv!23887 (array!63975) Bool)

(declare-fun array_inv!23888 (array!63977) Bool)

(assert (=> b!1023810 (= e!576869 (and tp!71698 tp_is_empty!23941 (array_inv!23887 (_keys!11099 thiss!1427)) (array_inv!23888 (_values!5939 thiss!1427)) e!576870))))

(declare-fun b!1023811 () Bool)

(declare-fun res!685460 () Bool)

(declare-fun e!576868 () Bool)

(assert (=> b!1023811 (=> (not res!685460) (not e!576868))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023811 (= res!685460 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1023812 () Bool)

(declare-fun e!576866 () Bool)

(declare-fun mapRes!37329 () Bool)

(assert (=> b!1023812 (= e!576870 (and e!576866 mapRes!37329))))

(declare-fun condMapEmpty!37329 () Bool)

(declare-fun mapDefault!37329 () ValueCell!11267)

(assert (=> b!1023812 (= condMapEmpty!37329 (= (arr!30794 (_values!5939 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11267)) mapDefault!37329)))))

(declare-fun mapIsEmpty!37329 () Bool)

(assert (=> mapIsEmpty!37329 mapRes!37329))

(declare-fun res!685459 () Bool)

(assert (=> start!89414 (=> (not res!685459) (not e!576868))))

(declare-fun valid!1959 (LongMapFixedSize!5128) Bool)

(assert (=> start!89414 (= res!685459 (valid!1959 thiss!1427))))

(assert (=> start!89414 e!576868))

(assert (=> start!89414 e!576869))

(assert (=> start!89414 true))

(declare-fun b!1023813 () Bool)

(assert (=> b!1023813 (= e!576868 (not true))))

(declare-fun lt!450763 () Bool)

(declare-fun lt!450762 () V!36795)

(assert (=> b!1023813 (= lt!450763 (valid!1959 (LongMapFixedSize!5129 (defaultEntry!5916 thiss!1427) (mask!29573 thiss!1427) (bvand (extraKeys!5648 thiss!1427) #b00000000000000000000000000000010) lt!450762 (minValue!5752 thiss!1427) (_size!2619 thiss!1427) (_keys!11099 thiss!1427) (_values!5939 thiss!1427) (_vacant!2619 thiss!1427))))))

(declare-datatypes ((tuple2!15502 0))(
  ( (tuple2!15503 (_1!7762 (_ BitVec 64)) (_2!7762 V!36795)) )
))
(declare-datatypes ((List!21672 0))(
  ( (Nil!21669) (Cons!21668 (h!22875 tuple2!15502) (t!30686 List!21672)) )
))
(declare-datatypes ((ListLongMap!13647 0))(
  ( (ListLongMap!13648 (toList!6839 List!21672)) )
))
(declare-fun -!462 (ListLongMap!13647 (_ BitVec 64)) ListLongMap!13647)

(declare-fun getCurrentListMap!3885 (array!63975 array!63977 (_ BitVec 32) (_ BitVec 32) V!36795 V!36795 (_ BitVec 32) Int) ListLongMap!13647)

(assert (=> b!1023813 (= (-!462 (getCurrentListMap!3885 (_keys!11099 thiss!1427) (_values!5939 thiss!1427) (mask!29573 thiss!1427) (extraKeys!5648 thiss!1427) (zeroValue!5752 thiss!1427) (minValue!5752 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5916 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3885 (_keys!11099 thiss!1427) (_values!5939 thiss!1427) (mask!29573 thiss!1427) (bvand (extraKeys!5648 thiss!1427) #b00000000000000000000000000000010) lt!450762 (minValue!5752 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5916 thiss!1427)))))

(declare-datatypes ((Unit!33318 0))(
  ( (Unit!33319) )
))
(declare-fun lt!450764 () Unit!33318)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!5 (array!63975 array!63977 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36795 V!36795 V!36795 Int) Unit!33318)

(assert (=> b!1023813 (= lt!450764 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!5 (_keys!11099 thiss!1427) (_values!5939 thiss!1427) (mask!29573 thiss!1427) (extraKeys!5648 thiss!1427) (bvand (extraKeys!5648 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5752 thiss!1427) lt!450762 (minValue!5752 thiss!1427) (defaultEntry!5916 thiss!1427)))))

(declare-fun dynLambda!1956 (Int (_ BitVec 64)) V!36795)

(assert (=> b!1023813 (= lt!450762 (dynLambda!1956 (defaultEntry!5916 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37329 () Bool)

(declare-fun tp!71697 () Bool)

(declare-fun e!576867 () Bool)

(assert (=> mapNonEmpty!37329 (= mapRes!37329 (and tp!71697 e!576867))))

(declare-fun mapValue!37329 () ValueCell!11267)

(declare-fun mapRest!37329 () (Array (_ BitVec 32) ValueCell!11267))

(declare-fun mapKey!37329 () (_ BitVec 32))

(assert (=> mapNonEmpty!37329 (= (arr!30794 (_values!5939 thiss!1427)) (store mapRest!37329 mapKey!37329 mapValue!37329))))

(declare-fun b!1023814 () Bool)

(assert (=> b!1023814 (= e!576867 tp_is_empty!23941)))

(declare-fun b!1023815 () Bool)

(assert (=> b!1023815 (= e!576866 tp_is_empty!23941)))

(assert (= (and start!89414 res!685459) b!1023811))

(assert (= (and b!1023811 res!685460) b!1023813))

(assert (= (and b!1023812 condMapEmpty!37329) mapIsEmpty!37329))

(assert (= (and b!1023812 (not condMapEmpty!37329)) mapNonEmpty!37329))

(get-info :version)

(assert (= (and mapNonEmpty!37329 ((_ is ValueCellFull!11267) mapValue!37329)) b!1023814))

(assert (= (and b!1023812 ((_ is ValueCellFull!11267) mapDefault!37329)) b!1023815))

(assert (= b!1023810 b!1023812))

(assert (= start!89414 b!1023810))

(declare-fun b_lambda!15687 () Bool)

(assert (=> (not b_lambda!15687) (not b!1023813)))

(declare-fun t!30685 () Bool)

(declare-fun tb!6837 () Bool)

(assert (=> (and b!1023810 (= (defaultEntry!5916 thiss!1427) (defaultEntry!5916 thiss!1427)) t!30685) tb!6837))

(declare-fun result!13991 () Bool)

(assert (=> tb!6837 (= result!13991 tp_is_empty!23941)))

(assert (=> b!1023813 t!30685))

(declare-fun b_and!32437 () Bool)

(assert (= b_and!32435 (and (=> t!30685 result!13991) b_and!32437)))

(declare-fun m!943213 () Bool)

(assert (=> b!1023810 m!943213))

(declare-fun m!943215 () Bool)

(assert (=> b!1023810 m!943215))

(declare-fun m!943217 () Bool)

(assert (=> start!89414 m!943217))

(declare-fun m!943219 () Bool)

(assert (=> b!1023813 m!943219))

(declare-fun m!943221 () Bool)

(assert (=> b!1023813 m!943221))

(declare-fun m!943223 () Bool)

(assert (=> b!1023813 m!943223))

(declare-fun m!943225 () Bool)

(assert (=> b!1023813 m!943225))

(assert (=> b!1023813 m!943223))

(declare-fun m!943227 () Bool)

(assert (=> b!1023813 m!943227))

(declare-fun m!943229 () Bool)

(assert (=> b!1023813 m!943229))

(declare-fun m!943231 () Bool)

(assert (=> mapNonEmpty!37329 m!943231))

(check-sat (not b!1023810) b_and!32437 (not start!89414) (not b!1023813) (not b_next!20221) (not b_lambda!15687) (not mapNonEmpty!37329) tp_is_empty!23941)
(check-sat b_and!32437 (not b_next!20221))
