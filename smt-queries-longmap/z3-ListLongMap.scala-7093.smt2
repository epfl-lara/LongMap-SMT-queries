; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89974 () Bool)

(assert start!89974)

(declare-fun b!1030377 () Bool)

(declare-fun b_free!20613 () Bool)

(declare-fun b_next!20613 () Bool)

(assert (=> b!1030377 (= b_free!20613 (not b_next!20613))))

(declare-fun tp!72907 () Bool)

(declare-fun b_and!32987 () Bool)

(assert (=> b!1030377 (= tp!72907 b_and!32987)))

(declare-fun res!689037 () Bool)

(declare-fun e!581842 () Bool)

(assert (=> start!89974 (=> (not res!689037) (not e!581842))))

(declare-datatypes ((V!37317 0))(
  ( (V!37318 (val!12217 Int)) )
))
(declare-datatypes ((ValueCell!11463 0))(
  ( (ValueCellFull!11463 (v!14794 V!37317)) (EmptyCell!11463) )
))
(declare-datatypes ((array!64728 0))(
  ( (array!64729 (arr!31167 (Array (_ BitVec 32) (_ BitVec 64))) (size!31684 (_ BitVec 32))) )
))
(declare-datatypes ((array!64730 0))(
  ( (array!64731 (arr!31168 (Array (_ BitVec 32) ValueCell!11463)) (size!31685 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5520 0))(
  ( (LongMapFixedSize!5521 (defaultEntry!6132 Int) (mask!29908 (_ BitVec 32)) (extraKeys!5864 (_ BitVec 32)) (zeroValue!5968 V!37317) (minValue!5968 V!37317) (_size!2815 (_ BitVec 32)) (_keys!11303 array!64728) (_values!6155 array!64730) (_vacant!2815 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5520)

(declare-fun valid!2089 (LongMapFixedSize!5520) Bool)

(assert (=> start!89974 (= res!689037 (valid!2089 thiss!1427))))

(assert (=> start!89974 e!581842))

(declare-fun e!581838 () Bool)

(assert (=> start!89974 e!581838))

(assert (=> start!89974 true))

(declare-fun mapIsEmpty!37950 () Bool)

(declare-fun mapRes!37950 () Bool)

(assert (=> mapIsEmpty!37950 mapRes!37950))

(declare-fun b!1030375 () Bool)

(declare-fun e!581843 () Bool)

(declare-datatypes ((Unit!33653 0))(
  ( (Unit!33654) )
))
(declare-datatypes ((tuple2!15582 0))(
  ( (tuple2!15583 (_1!7802 Unit!33653) (_2!7802 LongMapFixedSize!5520)) )
))
(declare-fun lt!454508 () tuple2!15582)

(declare-datatypes ((List!21835 0))(
  ( (Nil!21832) (Cons!21831 (h!23033 (_ BitVec 64)) (t!30943 List!21835)) )
))
(declare-fun arrayNoDuplicates!0 (array!64728 (_ BitVec 32) List!21835) Bool)

(assert (=> b!1030375 (= e!581843 (arrayNoDuplicates!0 (_keys!11303 (_2!7802 lt!454508)) #b00000000000000000000000000000000 Nil!21832))))

(declare-fun b!1030376 () Bool)

(declare-fun e!581836 () Bool)

(declare-fun tp_is_empty!24333 () Bool)

(assert (=> b!1030376 (= e!581836 tp_is_empty!24333)))

(declare-fun e!581837 () Bool)

(declare-fun array_inv!24127 (array!64728) Bool)

(declare-fun array_inv!24128 (array!64730) Bool)

(assert (=> b!1030377 (= e!581838 (and tp!72907 tp_is_empty!24333 (array_inv!24127 (_keys!11303 thiss!1427)) (array_inv!24128 (_values!6155 thiss!1427)) e!581837))))

(declare-fun mapNonEmpty!37950 () Bool)

(declare-fun tp!72906 () Bool)

(declare-fun e!581841 () Bool)

(assert (=> mapNonEmpty!37950 (= mapRes!37950 (and tp!72906 e!581841))))

(declare-fun mapValue!37950 () ValueCell!11463)

(declare-fun mapKey!37950 () (_ BitVec 32))

(declare-fun mapRest!37950 () (Array (_ BitVec 32) ValueCell!11463))

(assert (=> mapNonEmpty!37950 (= (arr!31168 (_values!6155 thiss!1427)) (store mapRest!37950 mapKey!37950 mapValue!37950))))

(declare-fun b!1030378 () Bool)

(declare-fun res!689040 () Bool)

(assert (=> b!1030378 (=> (not res!689040) (not e!581842))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1030378 (= res!689040 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1030379 () Bool)

(declare-fun e!581840 () Bool)

(assert (=> b!1030379 (= e!581842 e!581840)))

(declare-fun res!689035 () Bool)

(assert (=> b!1030379 (=> (not res!689035) (not e!581840))))

(declare-datatypes ((SeekEntryResult!9689 0))(
  ( (MissingZero!9689 (index!41127 (_ BitVec 32))) (Found!9689 (index!41128 (_ BitVec 32))) (Intermediate!9689 (undefined!10501 Bool) (index!41129 (_ BitVec 32)) (x!91697 (_ BitVec 32))) (Undefined!9689) (MissingVacant!9689 (index!41130 (_ BitVec 32))) )
))
(declare-fun lt!454502 () SeekEntryResult!9689)

(get-info :version)

(assert (=> b!1030379 (= res!689035 ((_ is Found!9689) lt!454502))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64728 (_ BitVec 32)) SeekEntryResult!9689)

(assert (=> b!1030379 (= lt!454502 (seekEntry!0 key!909 (_keys!11303 thiss!1427) (mask!29908 thiss!1427)))))

(declare-fun b!1030380 () Bool)

(assert (=> b!1030380 (= e!581841 tp_is_empty!24333)))

(declare-fun b!1030381 () Bool)

(declare-fun res!689036 () Bool)

(assert (=> b!1030381 (=> res!689036 e!581843)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64728 (_ BitVec 32)) Bool)

(assert (=> b!1030381 (= res!689036 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11303 (_2!7802 lt!454508)) (mask!29908 (_2!7802 lt!454508)))))))

(declare-fun b!1030382 () Bool)

(assert (=> b!1030382 (= e!581837 (and e!581836 mapRes!37950))))

(declare-fun condMapEmpty!37950 () Bool)

(declare-fun mapDefault!37950 () ValueCell!11463)

(assert (=> b!1030382 (= condMapEmpty!37950 (= (arr!31168 (_values!6155 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11463)) mapDefault!37950)))))

(declare-fun b!1030383 () Bool)

(assert (=> b!1030383 (= e!581840 (not e!581843))))

(declare-fun res!689038 () Bool)

(assert (=> b!1030383 (=> res!689038 e!581843)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1030383 (= res!689038 (not (validMask!0 (mask!29908 (_2!7802 lt!454508)))))))

(declare-fun lt!454506 () array!64730)

(declare-fun lt!454509 () array!64728)

(declare-fun Unit!33655 () Unit!33653)

(declare-fun Unit!33656 () Unit!33653)

(assert (=> b!1030383 (= lt!454508 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2815 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15583 Unit!33655 (LongMapFixedSize!5521 (defaultEntry!6132 thiss!1427) (mask!29908 thiss!1427) (extraKeys!5864 thiss!1427) (zeroValue!5968 thiss!1427) (minValue!5968 thiss!1427) (bvsub (_size!2815 thiss!1427) #b00000000000000000000000000000001) lt!454509 lt!454506 (bvadd #b00000000000000000000000000000001 (_vacant!2815 thiss!1427)))) (tuple2!15583 Unit!33656 (LongMapFixedSize!5521 (defaultEntry!6132 thiss!1427) (mask!29908 thiss!1427) (extraKeys!5864 thiss!1427) (zeroValue!5968 thiss!1427) (minValue!5968 thiss!1427) (bvsub (_size!2815 thiss!1427) #b00000000000000000000000000000001) lt!454509 lt!454506 (_vacant!2815 thiss!1427)))))))

(declare-datatypes ((tuple2!15584 0))(
  ( (tuple2!15585 (_1!7803 (_ BitVec 64)) (_2!7803 V!37317)) )
))
(declare-datatypes ((List!21836 0))(
  ( (Nil!21833) (Cons!21832 (h!23034 tuple2!15584) (t!30944 List!21836)) )
))
(declare-datatypes ((ListLongMap!13695 0))(
  ( (ListLongMap!13696 (toList!6863 List!21836)) )
))
(declare-fun -!490 (ListLongMap!13695 (_ BitVec 64)) ListLongMap!13695)

(declare-fun getCurrentListMap!3911 (array!64728 array!64730 (_ BitVec 32) (_ BitVec 32) V!37317 V!37317 (_ BitVec 32) Int) ListLongMap!13695)

(assert (=> b!1030383 (= (-!490 (getCurrentListMap!3911 (_keys!11303 thiss!1427) (_values!6155 thiss!1427) (mask!29908 thiss!1427) (extraKeys!5864 thiss!1427) (zeroValue!5968 thiss!1427) (minValue!5968 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6132 thiss!1427)) key!909) (getCurrentListMap!3911 lt!454509 lt!454506 (mask!29908 thiss!1427) (extraKeys!5864 thiss!1427) (zeroValue!5968 thiss!1427) (minValue!5968 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6132 thiss!1427)))))

(declare-fun dynLambda!1960 (Int (_ BitVec 64)) V!37317)

(assert (=> b!1030383 (= lt!454506 (array!64731 (store (arr!31168 (_values!6155 thiss!1427)) (index!41128 lt!454502) (ValueCellFull!11463 (dynLambda!1960 (defaultEntry!6132 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31685 (_values!6155 thiss!1427))))))

(declare-fun lt!454507 () Unit!33653)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!16 (array!64728 array!64730 (_ BitVec 32) (_ BitVec 32) V!37317 V!37317 (_ BitVec 32) (_ BitVec 64) Int) Unit!33653)

(assert (=> b!1030383 (= lt!454507 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!16 (_keys!11303 thiss!1427) (_values!6155 thiss!1427) (mask!29908 thiss!1427) (extraKeys!5864 thiss!1427) (zeroValue!5968 thiss!1427) (minValue!5968 thiss!1427) (index!41128 lt!454502) key!909 (defaultEntry!6132 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1030383 (not (arrayContainsKey!0 lt!454509 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!454501 () Unit!33653)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64728 (_ BitVec 32) (_ BitVec 64)) Unit!33653)

(assert (=> b!1030383 (= lt!454501 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11303 thiss!1427) (index!41128 lt!454502) key!909))))

(assert (=> b!1030383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!454509 (mask!29908 thiss!1427))))

(declare-fun lt!454504 () Unit!33653)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64728 (_ BitVec 32) (_ BitVec 32)) Unit!33653)

(assert (=> b!1030383 (= lt!454504 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11303 thiss!1427) (index!41128 lt!454502) (mask!29908 thiss!1427)))))

(assert (=> b!1030383 (arrayNoDuplicates!0 lt!454509 #b00000000000000000000000000000000 Nil!21832)))

(declare-fun lt!454505 () Unit!33653)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64728 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21835) Unit!33653)

(assert (=> b!1030383 (= lt!454505 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11303 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41128 lt!454502) #b00000000000000000000000000000000 Nil!21832))))

(declare-fun arrayCountValidKeys!0 (array!64728 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1030383 (= (arrayCountValidKeys!0 lt!454509 #b00000000000000000000000000000000 (size!31684 (_keys!11303 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11303 thiss!1427) #b00000000000000000000000000000000 (size!31684 (_keys!11303 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1030383 (= lt!454509 (array!64729 (store (arr!31167 (_keys!11303 thiss!1427)) (index!41128 lt!454502) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31684 (_keys!11303 thiss!1427))))))

(declare-fun lt!454503 () Unit!33653)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64728 (_ BitVec 32) (_ BitVec 64)) Unit!33653)

(assert (=> b!1030383 (= lt!454503 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11303 thiss!1427) (index!41128 lt!454502) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1030384 () Bool)

(declare-fun res!689039 () Bool)

(assert (=> b!1030384 (=> res!689039 e!581843)))

(assert (=> b!1030384 (= res!689039 (or (not (= (size!31685 (_values!6155 (_2!7802 lt!454508))) (bvadd #b00000000000000000000000000000001 (mask!29908 (_2!7802 lt!454508))))) (not (= (size!31684 (_keys!11303 (_2!7802 lt!454508))) (size!31685 (_values!6155 (_2!7802 lt!454508))))) (bvslt (mask!29908 (_2!7802 lt!454508)) #b00000000000000000000000000000000) (bvslt (extraKeys!5864 (_2!7802 lt!454508)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5864 (_2!7802 lt!454508)) #b00000000000000000000000000000011)))))

(assert (= (and start!89974 res!689037) b!1030378))

(assert (= (and b!1030378 res!689040) b!1030379))

(assert (= (and b!1030379 res!689035) b!1030383))

(assert (= (and b!1030383 (not res!689038)) b!1030384))

(assert (= (and b!1030384 (not res!689039)) b!1030381))

(assert (= (and b!1030381 (not res!689036)) b!1030375))

(assert (= (and b!1030382 condMapEmpty!37950) mapIsEmpty!37950))

(assert (= (and b!1030382 (not condMapEmpty!37950)) mapNonEmpty!37950))

(assert (= (and mapNonEmpty!37950 ((_ is ValueCellFull!11463) mapValue!37950)) b!1030380))

(assert (= (and b!1030382 ((_ is ValueCellFull!11463) mapDefault!37950)) b!1030376))

(assert (= b!1030377 b!1030382))

(assert (= start!89974 b!1030377))

(declare-fun b_lambda!15943 () Bool)

(assert (=> (not b_lambda!15943) (not b!1030383)))

(declare-fun t!30942 () Bool)

(declare-fun tb!6931 () Bool)

(assert (=> (and b!1030377 (= (defaultEntry!6132 thiss!1427) (defaultEntry!6132 thiss!1427)) t!30942) tb!6931))

(declare-fun result!14189 () Bool)

(assert (=> tb!6931 (= result!14189 tp_is_empty!24333)))

(assert (=> b!1030383 t!30942))

(declare-fun b_and!32989 () Bool)

(assert (= b_and!32987 (and (=> t!30942 result!14189) b_and!32989)))

(declare-fun m!950093 () Bool)

(assert (=> b!1030379 m!950093))

(declare-fun m!950095 () Bool)

(assert (=> mapNonEmpty!37950 m!950095))

(declare-fun m!950097 () Bool)

(assert (=> b!1030383 m!950097))

(declare-fun m!950099 () Bool)

(assert (=> b!1030383 m!950099))

(declare-fun m!950101 () Bool)

(assert (=> b!1030383 m!950101))

(declare-fun m!950103 () Bool)

(assert (=> b!1030383 m!950103))

(declare-fun m!950105 () Bool)

(assert (=> b!1030383 m!950105))

(declare-fun m!950107 () Bool)

(assert (=> b!1030383 m!950107))

(declare-fun m!950109 () Bool)

(assert (=> b!1030383 m!950109))

(declare-fun m!950111 () Bool)

(assert (=> b!1030383 m!950111))

(declare-fun m!950113 () Bool)

(assert (=> b!1030383 m!950113))

(declare-fun m!950115 () Bool)

(assert (=> b!1030383 m!950115))

(declare-fun m!950117 () Bool)

(assert (=> b!1030383 m!950117))

(declare-fun m!950119 () Bool)

(assert (=> b!1030383 m!950119))

(declare-fun m!950121 () Bool)

(assert (=> b!1030383 m!950121))

(declare-fun m!950123 () Bool)

(assert (=> b!1030383 m!950123))

(declare-fun m!950125 () Bool)

(assert (=> b!1030383 m!950125))

(declare-fun m!950127 () Bool)

(assert (=> b!1030383 m!950127))

(declare-fun m!950129 () Bool)

(assert (=> b!1030383 m!950129))

(assert (=> b!1030383 m!950111))

(declare-fun m!950131 () Bool)

(assert (=> start!89974 m!950131))

(declare-fun m!950133 () Bool)

(assert (=> b!1030381 m!950133))

(declare-fun m!950135 () Bool)

(assert (=> b!1030377 m!950135))

(declare-fun m!950137 () Bool)

(assert (=> b!1030377 m!950137))

(declare-fun m!950139 () Bool)

(assert (=> b!1030375 m!950139))

(check-sat tp_is_empty!24333 (not b_next!20613) (not b!1030375) (not b!1030379) (not start!89974) b_and!32989 (not b_lambda!15943) (not mapNonEmpty!37950) (not b!1030377) (not b!1030383) (not b!1030381))
(check-sat b_and!32989 (not b_next!20613))
