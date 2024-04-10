; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89188 () Bool)

(assert start!89188)

(declare-fun b!1022575 () Bool)

(declare-fun b_free!20229 () Bool)

(declare-fun b_next!20229 () Bool)

(assert (=> b!1022575 (= b_free!20229 (not b_next!20229))))

(declare-fun tp!71721 () Bool)

(declare-fun b_and!32441 () Bool)

(assert (=> b!1022575 (= tp!71721 b_and!32441)))

(declare-fun e!576096 () Bool)

(declare-fun e!576098 () Bool)

(declare-datatypes ((V!36805 0))(
  ( (V!36806 (val!12025 Int)) )
))
(declare-datatypes ((ValueCell!11271 0))(
  ( (ValueCellFull!11271 (v!14594 V!36805)) (EmptyCell!11271) )
))
(declare-datatypes ((array!63942 0))(
  ( (array!63943 (arr!30783 (Array (_ BitVec 32) (_ BitVec 64))) (size!31294 (_ BitVec 32))) )
))
(declare-datatypes ((array!63944 0))(
  ( (array!63945 (arr!30784 (Array (_ BitVec 32) ValueCell!11271)) (size!31295 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5136 0))(
  ( (LongMapFixedSize!5137 (defaultEntry!5920 Int) (mask!29519 (_ BitVec 32)) (extraKeys!5652 (_ BitVec 32)) (zeroValue!5756 V!36805) (minValue!5756 V!36805) (_size!2623 (_ BitVec 32)) (_keys!11065 array!63942) (_values!5943 array!63944) (_vacant!2623 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5136)

(declare-fun tp_is_empty!23949 () Bool)

(declare-fun array_inv!23859 (array!63942) Bool)

(declare-fun array_inv!23860 (array!63944) Bool)

(assert (=> b!1022575 (= e!576098 (and tp!71721 tp_is_empty!23949 (array_inv!23859 (_keys!11065 thiss!1427)) (array_inv!23860 (_values!5943 thiss!1427)) e!576096))))

(declare-fun res!684974 () Bool)

(declare-fun e!576094 () Bool)

(assert (=> start!89188 (=> (not res!684974) (not e!576094))))

(declare-fun valid!1956 (LongMapFixedSize!5136) Bool)

(assert (=> start!89188 (= res!684974 (valid!1956 thiss!1427))))

(assert (=> start!89188 e!576094))

(assert (=> start!89188 e!576098))

(assert (=> start!89188 true))

(declare-fun b!1022576 () Bool)

(declare-fun e!576099 () Bool)

(declare-fun mapRes!37341 () Bool)

(assert (=> b!1022576 (= e!576096 (and e!576099 mapRes!37341))))

(declare-fun condMapEmpty!37341 () Bool)

(declare-fun mapDefault!37341 () ValueCell!11271)

(assert (=> b!1022576 (= condMapEmpty!37341 (= (arr!30784 (_values!5943 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11271)) mapDefault!37341)))))

(declare-fun b!1022577 () Bool)

(assert (=> b!1022577 (= e!576099 tp_is_empty!23949)))

(declare-fun b!1022578 () Bool)

(assert (=> b!1022578 (= e!576094 (not true))))

(declare-fun lt!450285 () Bool)

(declare-fun lt!450283 () V!36805)

(assert (=> b!1022578 (= lt!450285 (valid!1956 (LongMapFixedSize!5137 (defaultEntry!5920 thiss!1427) (mask!29519 thiss!1427) (bvand (extraKeys!5652 thiss!1427) #b00000000000000000000000000000010) lt!450283 (minValue!5756 thiss!1427) (_size!2623 thiss!1427) (_keys!11065 thiss!1427) (_values!5943 thiss!1427) (_vacant!2623 thiss!1427))))))

(declare-datatypes ((tuple2!15504 0))(
  ( (tuple2!15505 (_1!7763 (_ BitVec 64)) (_2!7763 V!36805)) )
))
(declare-datatypes ((List!21686 0))(
  ( (Nil!21683) (Cons!21682 (h!22880 tuple2!15504) (t!30716 List!21686)) )
))
(declare-datatypes ((ListLongMap!13645 0))(
  ( (ListLongMap!13646 (toList!6838 List!21686)) )
))
(declare-fun -!465 (ListLongMap!13645 (_ BitVec 64)) ListLongMap!13645)

(declare-fun getCurrentListMap!3886 (array!63942 array!63944 (_ BitVec 32) (_ BitVec 32) V!36805 V!36805 (_ BitVec 32) Int) ListLongMap!13645)

(assert (=> b!1022578 (= (-!465 (getCurrentListMap!3886 (_keys!11065 thiss!1427) (_values!5943 thiss!1427) (mask!29519 thiss!1427) (extraKeys!5652 thiss!1427) (zeroValue!5756 thiss!1427) (minValue!5756 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5920 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3886 (_keys!11065 thiss!1427) (_values!5943 thiss!1427) (mask!29519 thiss!1427) (bvand (extraKeys!5652 thiss!1427) #b00000000000000000000000000000010) lt!450283 (minValue!5756 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5920 thiss!1427)))))

(declare-datatypes ((Unit!33319 0))(
  ( (Unit!33320) )
))
(declare-fun lt!450284 () Unit!33319)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!6 (array!63942 array!63944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36805 V!36805 V!36805 Int) Unit!33319)

(assert (=> b!1022578 (= lt!450284 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!6 (_keys!11065 thiss!1427) (_values!5943 thiss!1427) (mask!29519 thiss!1427) (extraKeys!5652 thiss!1427) (bvand (extraKeys!5652 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5756 thiss!1427) lt!450283 (minValue!5756 thiss!1427) (defaultEntry!5920 thiss!1427)))))

(declare-fun dynLambda!1935 (Int (_ BitVec 64)) V!36805)

(assert (=> b!1022578 (= lt!450283 (dynLambda!1935 (defaultEntry!5920 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37341 () Bool)

(declare-fun tp!71722 () Bool)

(declare-fun e!576095 () Bool)

(assert (=> mapNonEmpty!37341 (= mapRes!37341 (and tp!71722 e!576095))))

(declare-fun mapValue!37341 () ValueCell!11271)

(declare-fun mapKey!37341 () (_ BitVec 32))

(declare-fun mapRest!37341 () (Array (_ BitVec 32) ValueCell!11271))

(assert (=> mapNonEmpty!37341 (= (arr!30784 (_values!5943 thiss!1427)) (store mapRest!37341 mapKey!37341 mapValue!37341))))

(declare-fun b!1022579 () Bool)

(assert (=> b!1022579 (= e!576095 tp_is_empty!23949)))

(declare-fun mapIsEmpty!37341 () Bool)

(assert (=> mapIsEmpty!37341 mapRes!37341))

(declare-fun b!1022580 () Bool)

(declare-fun res!684973 () Bool)

(assert (=> b!1022580 (=> (not res!684973) (not e!576094))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022580 (= res!684973 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!89188 res!684974) b!1022580))

(assert (= (and b!1022580 res!684973) b!1022578))

(assert (= (and b!1022576 condMapEmpty!37341) mapIsEmpty!37341))

(assert (= (and b!1022576 (not condMapEmpty!37341)) mapNonEmpty!37341))

(get-info :version)

(assert (= (and mapNonEmpty!37341 ((_ is ValueCellFull!11271) mapValue!37341)) b!1022579))

(assert (= (and b!1022576 ((_ is ValueCellFull!11271) mapDefault!37341)) b!1022577))

(assert (= b!1022575 b!1022576))

(assert (= start!89188 b!1022575))

(declare-fun b_lambda!15685 () Bool)

(assert (=> (not b_lambda!15685) (not b!1022578)))

(declare-fun t!30715 () Bool)

(declare-fun tb!6853 () Bool)

(assert (=> (and b!1022575 (= (defaultEntry!5920 thiss!1427) (defaultEntry!5920 thiss!1427)) t!30715) tb!6853))

(declare-fun result!14015 () Bool)

(assert (=> tb!6853 (= result!14015 tp_is_empty!23949)))

(assert (=> b!1022578 t!30715))

(declare-fun b_and!32443 () Bool)

(assert (= b_and!32441 (and (=> t!30715 result!14015) b_and!32443)))

(declare-fun m!941629 () Bool)

(assert (=> b!1022575 m!941629))

(declare-fun m!941631 () Bool)

(assert (=> b!1022575 m!941631))

(declare-fun m!941633 () Bool)

(assert (=> start!89188 m!941633))

(declare-fun m!941635 () Bool)

(assert (=> b!1022578 m!941635))

(declare-fun m!941637 () Bool)

(assert (=> b!1022578 m!941637))

(declare-fun m!941639 () Bool)

(assert (=> b!1022578 m!941639))

(declare-fun m!941641 () Bool)

(assert (=> b!1022578 m!941641))

(declare-fun m!941643 () Bool)

(assert (=> b!1022578 m!941643))

(declare-fun m!941645 () Bool)

(assert (=> b!1022578 m!941645))

(assert (=> b!1022578 m!941643))

(declare-fun m!941647 () Bool)

(assert (=> mapNonEmpty!37341 m!941647))

(check-sat b_and!32443 (not start!89188) (not b!1022575) (not b_next!20229) (not b_lambda!15685) tp_is_empty!23949 (not mapNonEmpty!37341) (not b!1022578))
(check-sat b_and!32443 (not b_next!20229))
