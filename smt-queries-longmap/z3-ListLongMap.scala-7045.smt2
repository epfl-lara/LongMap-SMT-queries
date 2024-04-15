; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89280 () Bool)

(assert start!89280)

(declare-fun b!1023619 () Bool)

(declare-fun b_free!20323 () Bool)

(declare-fun b_next!20323 () Bool)

(assert (=> b!1023619 (= b_free!20323 (not b_next!20323))))

(declare-fun tp!72004 () Bool)

(declare-fun b_and!32531 () Bool)

(assert (=> b!1023619 (= tp!72004 b_and!32531)))

(declare-fun b!1023616 () Bool)

(declare-fun e!576850 () Bool)

(declare-fun tp_is_empty!24043 () Bool)

(assert (=> b!1023616 (= e!576850 tp_is_empty!24043)))

(declare-fun mapNonEmpty!37482 () Bool)

(declare-fun mapRes!37482 () Bool)

(declare-fun tp!72003 () Bool)

(declare-fun e!576849 () Bool)

(assert (=> mapNonEmpty!37482 (= mapRes!37482 (and tp!72003 e!576849))))

(declare-fun mapKey!37482 () (_ BitVec 32))

(declare-datatypes ((V!36931 0))(
  ( (V!36932 (val!12072 Int)) )
))
(declare-datatypes ((ValueCell!11318 0))(
  ( (ValueCellFull!11318 (v!14640 V!36931)) (EmptyCell!11318) )
))
(declare-fun mapValue!37482 () ValueCell!11318)

(declare-fun mapRest!37482 () (Array (_ BitVec 32) ValueCell!11318))

(declare-datatypes ((array!64069 0))(
  ( (array!64070 (arr!30846 (Array (_ BitVec 32) (_ BitVec 64))) (size!31359 (_ BitVec 32))) )
))
(declare-datatypes ((array!64071 0))(
  ( (array!64072 (arr!30847 (Array (_ BitVec 32) ValueCell!11318)) (size!31360 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5230 0))(
  ( (LongMapFixedSize!5231 (defaultEntry!5967 Int) (mask!29593 (_ BitVec 32)) (extraKeys!5699 (_ BitVec 32)) (zeroValue!5803 V!36931) (minValue!5803 V!36931) (_size!2670 (_ BitVec 32)) (_keys!11108 array!64069) (_values!5990 array!64071) (_vacant!2670 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5230)

(assert (=> mapNonEmpty!37482 (= (arr!30847 (_values!5990 thiss!1427)) (store mapRest!37482 mapKey!37482 mapValue!37482))))

(declare-fun mapIsEmpty!37482 () Bool)

(assert (=> mapIsEmpty!37482 mapRes!37482))

(declare-fun b!1023617 () Bool)

(declare-fun e!576854 () Bool)

(assert (=> b!1023617 (= e!576854 (and e!576850 mapRes!37482))))

(declare-fun condMapEmpty!37482 () Bool)

(declare-fun mapDefault!37482 () ValueCell!11318)

(assert (=> b!1023617 (= condMapEmpty!37482 (= (arr!30847 (_values!5990 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11318)) mapDefault!37482)))))

(declare-fun b!1023618 () Bool)

(declare-fun res!685512 () Bool)

(declare-fun e!576852 () Bool)

(assert (=> b!1023618 (=> (not res!685512) (not e!576852))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023618 (= res!685512 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!576853 () Bool)

(declare-fun array_inv!23913 (array!64069) Bool)

(declare-fun array_inv!23914 (array!64071) Bool)

(assert (=> b!1023619 (= e!576853 (and tp!72004 tp_is_empty!24043 (array_inv!23913 (_keys!11108 thiss!1427)) (array_inv!23914 (_values!5990 thiss!1427)) e!576854))))

(declare-fun b!1023620 () Bool)

(assert (=> b!1023620 (= e!576849 tp_is_empty!24043)))

(declare-fun res!685513 () Bool)

(assert (=> start!89280 (=> (not res!685513) (not e!576852))))

(declare-fun valid!1989 (LongMapFixedSize!5230) Bool)

(assert (=> start!89280 (= res!685513 (valid!1989 thiss!1427))))

(assert (=> start!89280 e!576852))

(assert (=> start!89280 e!576853))

(assert (=> start!89280 true))

(declare-fun b!1023621 () Bool)

(assert (=> b!1023621 (= e!576852 (not true))))

(declare-fun lt!450291 () Bool)

(declare-fun lt!450292 () V!36931)

(assert (=> b!1023621 (= lt!450291 (valid!1989 (LongMapFixedSize!5231 (defaultEntry!5967 thiss!1427) (mask!29593 thiss!1427) (bvand (extraKeys!5699 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5803 thiss!1427) lt!450292 (_size!2670 thiss!1427) (_keys!11108 thiss!1427) (_values!5990 thiss!1427) (_vacant!2670 thiss!1427))))))

(declare-datatypes ((tuple2!15600 0))(
  ( (tuple2!15601 (_1!7811 (_ BitVec 64)) (_2!7811 V!36931)) )
))
(declare-datatypes ((List!21751 0))(
  ( (Nil!21748) (Cons!21747 (h!22945 tuple2!15600) (t!30794 List!21751)) )
))
(declare-datatypes ((ListLongMap!13733 0))(
  ( (ListLongMap!13734 (toList!6882 List!21751)) )
))
(declare-fun -!474 (ListLongMap!13733 (_ BitVec 64)) ListLongMap!13733)

(declare-fun getCurrentListMap!3849 (array!64069 array!64071 (_ BitVec 32) (_ BitVec 32) V!36931 V!36931 (_ BitVec 32) Int) ListLongMap!13733)

(assert (=> b!1023621 (= (-!474 (getCurrentListMap!3849 (_keys!11108 thiss!1427) (_values!5990 thiss!1427) (mask!29593 thiss!1427) (extraKeys!5699 thiss!1427) (zeroValue!5803 thiss!1427) (minValue!5803 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5967 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3849 (_keys!11108 thiss!1427) (_values!5990 thiss!1427) (mask!29593 thiss!1427) (bvand (extraKeys!5699 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5803 thiss!1427) lt!450292 #b00000000000000000000000000000000 (defaultEntry!5967 thiss!1427)))))

(declare-datatypes ((Unit!33233 0))(
  ( (Unit!33234) )
))
(declare-fun lt!450290 () Unit!33233)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!6 (array!64069 array!64071 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36931 V!36931 V!36931 Int) Unit!33233)

(assert (=> b!1023621 (= lt!450290 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!6 (_keys!11108 thiss!1427) (_values!5990 thiss!1427) (mask!29593 thiss!1427) (extraKeys!5699 thiss!1427) (bvand (extraKeys!5699 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5803 thiss!1427) (minValue!5803 thiss!1427) lt!450292 (defaultEntry!5967 thiss!1427)))))

(declare-fun dynLambda!1936 (Int (_ BitVec 64)) V!36931)

(assert (=> b!1023621 (= lt!450292 (dynLambda!1936 (defaultEntry!5967 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89280 res!685513) b!1023618))

(assert (= (and b!1023618 res!685512) b!1023621))

(assert (= (and b!1023617 condMapEmpty!37482) mapIsEmpty!37482))

(assert (= (and b!1023617 (not condMapEmpty!37482)) mapNonEmpty!37482))

(get-info :version)

(assert (= (and mapNonEmpty!37482 ((_ is ValueCellFull!11318) mapValue!37482)) b!1023620))

(assert (= (and b!1023617 ((_ is ValueCellFull!11318) mapDefault!37482)) b!1023616))

(assert (= b!1023619 b!1023617))

(assert (= start!89280 b!1023619))

(declare-fun b_lambda!15685 () Bool)

(assert (=> (not b_lambda!15685) (not b!1023621)))

(declare-fun t!30793 () Bool)

(declare-fun tb!6867 () Bool)

(assert (=> (and b!1023619 (= (defaultEntry!5967 thiss!1427) (defaultEntry!5967 thiss!1427)) t!30793) tb!6867))

(declare-fun result!14051 () Bool)

(assert (=> tb!6867 (= result!14051 tp_is_empty!24043)))

(assert (=> b!1023621 t!30793))

(declare-fun b_and!32533 () Bool)

(assert (= b_and!32531 (and (=> t!30793 result!14051) b_and!32533)))

(declare-fun m!941733 () Bool)

(assert (=> mapNonEmpty!37482 m!941733))

(declare-fun m!941735 () Bool)

(assert (=> b!1023619 m!941735))

(declare-fun m!941737 () Bool)

(assert (=> b!1023619 m!941737))

(declare-fun m!941739 () Bool)

(assert (=> start!89280 m!941739))

(declare-fun m!941741 () Bool)

(assert (=> b!1023621 m!941741))

(declare-fun m!941743 () Bool)

(assert (=> b!1023621 m!941743))

(declare-fun m!941745 () Bool)

(assert (=> b!1023621 m!941745))

(declare-fun m!941747 () Bool)

(assert (=> b!1023621 m!941747))

(assert (=> b!1023621 m!941743))

(declare-fun m!941749 () Bool)

(assert (=> b!1023621 m!941749))

(declare-fun m!941751 () Bool)

(assert (=> b!1023621 m!941751))

(check-sat (not start!89280) (not b_next!20323) tp_is_empty!24043 (not b_lambda!15685) (not mapNonEmpty!37482) b_and!32533 (not b!1023619) (not b!1023621))
(check-sat b_and!32533 (not b_next!20323))
