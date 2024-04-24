; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90322 () Bool)

(assert start!90322)

(declare-fun b!1033361 () Bool)

(declare-fun b_free!20695 () Bool)

(declare-fun b_next!20695 () Bool)

(assert (=> b!1033361 (= b_free!20695 (not b_next!20695))))

(declare-fun tp!73156 () Bool)

(declare-fun b_and!33167 () Bool)

(assert (=> b!1033361 (= tp!73156 b_and!33167)))

(declare-fun b!1033351 () Bool)

(declare-fun e!583860 () Bool)

(assert (=> b!1033351 (= e!583860 false)))

(declare-fun mapIsEmpty!38076 () Bool)

(declare-fun mapRes!38076 () Bool)

(assert (=> mapIsEmpty!38076 mapRes!38076))

(declare-fun b!1033352 () Bool)

(declare-fun res!690411 () Bool)

(declare-fun e!583853 () Bool)

(assert (=> b!1033352 (=> (not res!690411) (not e!583853))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033352 (= res!690411 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1033353 () Bool)

(declare-fun e!583859 () Bool)

(declare-fun e!583858 () Bool)

(assert (=> b!1033353 (= e!583859 (and e!583858 mapRes!38076))))

(declare-fun condMapEmpty!38076 () Bool)

(declare-datatypes ((V!37427 0))(
  ( (V!37428 (val!12258 Int)) )
))
(declare-datatypes ((ValueCell!11504 0))(
  ( (ValueCellFull!11504 (v!14831 V!37427)) (EmptyCell!11504) )
))
(declare-datatypes ((array!64943 0))(
  ( (array!64944 (arr!31267 (Array (_ BitVec 32) (_ BitVec 64))) (size!31785 (_ BitVec 32))) )
))
(declare-datatypes ((array!64945 0))(
  ( (array!64946 (arr!31268 (Array (_ BitVec 32) ValueCell!11504)) (size!31786 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5602 0))(
  ( (LongMapFixedSize!5603 (defaultEntry!6175 Int) (mask!30043 (_ BitVec 32)) (extraKeys!5907 (_ BitVec 32)) (zeroValue!6011 V!37427) (minValue!6011 V!37427) (_size!2856 (_ BitVec 32)) (_keys!11386 array!64943) (_values!6198 array!64945) (_vacant!2856 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5602)

(declare-fun mapDefault!38076 () ValueCell!11504)

(assert (=> b!1033353 (= condMapEmpty!38076 (= (arr!31268 (_values!6198 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11504)) mapDefault!38076)))))

(declare-fun b!1033354 () Bool)

(declare-fun tp_is_empty!24415 () Bool)

(assert (=> b!1033354 (= e!583858 tp_is_empty!24415)))

(declare-fun res!690410 () Bool)

(assert (=> start!90322 (=> (not res!690410) (not e!583853))))

(declare-fun valid!2125 (LongMapFixedSize!5602) Bool)

(assert (=> start!90322 (= res!690410 (valid!2125 thiss!1427))))

(assert (=> start!90322 e!583853))

(declare-fun e!583857 () Bool)

(assert (=> start!90322 e!583857))

(assert (=> start!90322 true))

(declare-fun mapNonEmpty!38076 () Bool)

(declare-fun tp!73155 () Bool)

(declare-fun e!583855 () Bool)

(assert (=> mapNonEmpty!38076 (= mapRes!38076 (and tp!73155 e!583855))))

(declare-fun mapRest!38076 () (Array (_ BitVec 32) ValueCell!11504))

(declare-fun mapValue!38076 () ValueCell!11504)

(declare-fun mapKey!38076 () (_ BitVec 32))

(assert (=> mapNonEmpty!38076 (= (arr!31268 (_values!6198 thiss!1427)) (store mapRest!38076 mapKey!38076 mapValue!38076))))

(declare-fun b!1033355 () Bool)

(declare-fun e!583852 () Bool)

(declare-datatypes ((Unit!33810 0))(
  ( (Unit!33811) )
))
(declare-datatypes ((tuple2!15718 0))(
  ( (tuple2!15719 (_1!7870 Unit!33810) (_2!7870 LongMapFixedSize!5602)) )
))
(declare-fun lt!456427 () tuple2!15718)

(assert (=> b!1033355 (= e!583852 (ite (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5907 (_2!7870 lt!456427)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5907 (_2!7870 lt!456427)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1033356 () Bool)

(declare-fun e!583856 () Unit!33810)

(declare-fun Unit!33812 () Unit!33810)

(assert (=> b!1033356 (= e!583856 Unit!33812)))

(declare-fun b!1033357 () Bool)

(declare-fun e!583851 () Bool)

(assert (=> b!1033357 (= e!583853 e!583851)))

(declare-fun res!690413 () Bool)

(assert (=> b!1033357 (=> (not res!690413) (not e!583851))))

(declare-datatypes ((SeekEntryResult!9675 0))(
  ( (MissingZero!9675 (index!41071 (_ BitVec 32))) (Found!9675 (index!41072 (_ BitVec 32))) (Intermediate!9675 (undefined!10487 Bool) (index!41073 (_ BitVec 32)) (x!91917 (_ BitVec 32))) (Undefined!9675) (MissingVacant!9675 (index!41074 (_ BitVec 32))) )
))
(declare-fun lt!456430 () SeekEntryResult!9675)

(get-info :version)

(assert (=> b!1033357 (= res!690413 ((_ is Found!9675) lt!456430))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64943 (_ BitVec 32)) SeekEntryResult!9675)

(assert (=> b!1033357 (= lt!456430 (seekEntry!0 key!909 (_keys!11386 thiss!1427) (mask!30043 thiss!1427)))))

(declare-fun b!1033358 () Bool)

(declare-fun Unit!33813 () Unit!33810)

(assert (=> b!1033358 (= e!583856 Unit!33813)))

(declare-fun lt!456433 () Unit!33810)

(declare-fun lemmaKeyInListMapIsInArray!348 (array!64943 array!64945 (_ BitVec 32) (_ BitVec 32) V!37427 V!37427 (_ BitVec 64) Int) Unit!33810)

(assert (=> b!1033358 (= lt!456433 (lemmaKeyInListMapIsInArray!348 (_keys!11386 (_2!7870 lt!456427)) (_values!6198 (_2!7870 lt!456427)) (mask!30043 (_2!7870 lt!456427)) (extraKeys!5907 (_2!7870 lt!456427)) (zeroValue!6011 (_2!7870 lt!456427)) (minValue!6011 (_2!7870 lt!456427)) key!909 (defaultEntry!6175 (_2!7870 lt!456427))))))

(declare-fun c!104699 () Bool)

(assert (=> b!1033358 (= c!104699 (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!690412 () Bool)

(assert (=> b!1033358 (= res!690412 e!583852)))

(assert (=> b!1033358 (=> (not res!690412) (not e!583860))))

(assert (=> b!1033358 e!583860))

(declare-fun b!1033359 () Bool)

(assert (=> b!1033359 (= e!583851 (not true))))

(declare-fun lt!456425 () Bool)

(assert (=> b!1033359 (= lt!456425 (valid!2125 (_2!7870 lt!456427)))))

(declare-fun lt!456426 () Unit!33810)

(assert (=> b!1033359 (= lt!456426 e!583856)))

(declare-fun c!104698 () Bool)

(declare-datatypes ((tuple2!15720 0))(
  ( (tuple2!15721 (_1!7871 (_ BitVec 64)) (_2!7871 V!37427)) )
))
(declare-datatypes ((List!21880 0))(
  ( (Nil!21877) (Cons!21876 (h!23087 tuple2!15720) (t!31062 List!21880)) )
))
(declare-datatypes ((ListLongMap!13759 0))(
  ( (ListLongMap!13760 (toList!6895 List!21880)) )
))
(declare-fun contains!6030 (ListLongMap!13759 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3941 (array!64943 array!64945 (_ BitVec 32) (_ BitVec 32) V!37427 V!37427 (_ BitVec 32) Int) ListLongMap!13759)

(assert (=> b!1033359 (= c!104698 (contains!6030 (getCurrentListMap!3941 (_keys!11386 (_2!7870 lt!456427)) (_values!6198 (_2!7870 lt!456427)) (mask!30043 (_2!7870 lt!456427)) (extraKeys!5907 (_2!7870 lt!456427)) (zeroValue!6011 (_2!7870 lt!456427)) (minValue!6011 (_2!7870 lt!456427)) #b00000000000000000000000000000000 (defaultEntry!6175 (_2!7870 lt!456427))) key!909))))

(declare-fun lt!456434 () array!64945)

(declare-fun lt!456429 () array!64943)

(declare-fun Unit!33814 () Unit!33810)

(declare-fun Unit!33815 () Unit!33810)

(assert (=> b!1033359 (= lt!456427 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2856 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15719 Unit!33814 (LongMapFixedSize!5603 (defaultEntry!6175 thiss!1427) (mask!30043 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) (bvsub (_size!2856 thiss!1427) #b00000000000000000000000000000001) lt!456429 lt!456434 (bvadd #b00000000000000000000000000000001 (_vacant!2856 thiss!1427)))) (tuple2!15719 Unit!33815 (LongMapFixedSize!5603 (defaultEntry!6175 thiss!1427) (mask!30043 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) (bvsub (_size!2856 thiss!1427) #b00000000000000000000000000000001) lt!456429 lt!456434 (_vacant!2856 thiss!1427)))))))

(declare-fun -!518 (ListLongMap!13759 (_ BitVec 64)) ListLongMap!13759)

(assert (=> b!1033359 (= (-!518 (getCurrentListMap!3941 (_keys!11386 thiss!1427) (_values!6198 thiss!1427) (mask!30043 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6175 thiss!1427)) key!909) (getCurrentListMap!3941 lt!456429 lt!456434 (mask!30043 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6175 thiss!1427)))))

(declare-fun dynLambda!2012 (Int (_ BitVec 64)) V!37427)

(assert (=> b!1033359 (= lt!456434 (array!64946 (store (arr!31268 (_values!6198 thiss!1427)) (index!41072 lt!456430) (ValueCellFull!11504 (dynLambda!2012 (defaultEntry!6175 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31786 (_values!6198 thiss!1427))))))

(declare-fun lt!456431 () Unit!33810)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!44 (array!64943 array!64945 (_ BitVec 32) (_ BitVec 32) V!37427 V!37427 (_ BitVec 32) (_ BitVec 64) Int) Unit!33810)

(assert (=> b!1033359 (= lt!456431 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!44 (_keys!11386 thiss!1427) (_values!6198 thiss!1427) (mask!30043 thiss!1427) (extraKeys!5907 thiss!1427) (zeroValue!6011 thiss!1427) (minValue!6011 thiss!1427) (index!41072 lt!456430) key!909 (defaultEntry!6175 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033359 (not (arrayContainsKey!0 lt!456429 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!456428 () Unit!33810)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64943 (_ BitVec 32) (_ BitVec 64)) Unit!33810)

(assert (=> b!1033359 (= lt!456428 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11386 thiss!1427) (index!41072 lt!456430) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64943 (_ BitVec 32)) Bool)

(assert (=> b!1033359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!456429 (mask!30043 thiss!1427))))

(declare-fun lt!456435 () Unit!33810)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64943 (_ BitVec 32) (_ BitVec 32)) Unit!33810)

(assert (=> b!1033359 (= lt!456435 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11386 thiss!1427) (index!41072 lt!456430) (mask!30043 thiss!1427)))))

(declare-datatypes ((List!21881 0))(
  ( (Nil!21878) (Cons!21877 (h!23088 (_ BitVec 64)) (t!31063 List!21881)) )
))
(declare-fun arrayNoDuplicates!0 (array!64943 (_ BitVec 32) List!21881) Bool)

(assert (=> b!1033359 (arrayNoDuplicates!0 lt!456429 #b00000000000000000000000000000000 Nil!21878)))

(declare-fun lt!456432 () Unit!33810)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64943 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21881) Unit!33810)

(assert (=> b!1033359 (= lt!456432 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11386 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41072 lt!456430) #b00000000000000000000000000000000 Nil!21878))))

(declare-fun arrayCountValidKeys!0 (array!64943 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033359 (= (arrayCountValidKeys!0 lt!456429 #b00000000000000000000000000000000 (size!31785 (_keys!11386 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11386 thiss!1427) #b00000000000000000000000000000000 (size!31785 (_keys!11386 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1033359 (= lt!456429 (array!64944 (store (arr!31267 (_keys!11386 thiss!1427)) (index!41072 lt!456430) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31785 (_keys!11386 thiss!1427))))))

(declare-fun lt!456436 () Unit!33810)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64943 (_ BitVec 32) (_ BitVec 64)) Unit!33810)

(assert (=> b!1033359 (= lt!456436 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11386 thiss!1427) (index!41072 lt!456430) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033360 () Bool)

(assert (=> b!1033360 (= e!583852 (arrayContainsKey!0 (_keys!11386 (_2!7870 lt!456427)) key!909 #b00000000000000000000000000000000))))

(declare-fun array_inv!24211 (array!64943) Bool)

(declare-fun array_inv!24212 (array!64945) Bool)

(assert (=> b!1033361 (= e!583857 (and tp!73156 tp_is_empty!24415 (array_inv!24211 (_keys!11386 thiss!1427)) (array_inv!24212 (_values!6198 thiss!1427)) e!583859))))

(declare-fun b!1033362 () Bool)

(assert (=> b!1033362 (= e!583855 tp_is_empty!24415)))

(assert (= (and start!90322 res!690410) b!1033352))

(assert (= (and b!1033352 res!690411) b!1033357))

(assert (= (and b!1033357 res!690413) b!1033359))

(assert (= (and b!1033359 c!104698) b!1033358))

(assert (= (and b!1033359 (not c!104698)) b!1033356))

(assert (= (and b!1033358 c!104699) b!1033360))

(assert (= (and b!1033358 (not c!104699)) b!1033355))

(assert (= (and b!1033358 res!690412) b!1033351))

(assert (= (and b!1033353 condMapEmpty!38076) mapIsEmpty!38076))

(assert (= (and b!1033353 (not condMapEmpty!38076)) mapNonEmpty!38076))

(assert (= (and mapNonEmpty!38076 ((_ is ValueCellFull!11504) mapValue!38076)) b!1033362))

(assert (= (and b!1033353 ((_ is ValueCellFull!11504) mapDefault!38076)) b!1033354))

(assert (= b!1033361 b!1033353))

(assert (= start!90322 b!1033361))

(declare-fun b_lambda!16049 () Bool)

(assert (=> (not b_lambda!16049) (not b!1033359)))

(declare-fun t!31061 () Bool)

(declare-fun tb!7005 () Bool)

(assert (=> (and b!1033361 (= (defaultEntry!6175 thiss!1427) (defaultEntry!6175 thiss!1427)) t!31061) tb!7005))

(declare-fun result!14347 () Bool)

(assert (=> tb!7005 (= result!14347 tp_is_empty!24415)))

(assert (=> b!1033359 t!31061))

(declare-fun b_and!33169 () Bool)

(assert (= b_and!33167 (and (=> t!31061 result!14347) b_and!33169)))

(declare-fun m!954065 () Bool)

(assert (=> b!1033357 m!954065))

(declare-fun m!954067 () Bool)

(assert (=> b!1033360 m!954067))

(declare-fun m!954069 () Bool)

(assert (=> b!1033361 m!954069))

(declare-fun m!954071 () Bool)

(assert (=> b!1033361 m!954071))

(declare-fun m!954073 () Bool)

(assert (=> mapNonEmpty!38076 m!954073))

(declare-fun m!954075 () Bool)

(assert (=> start!90322 m!954075))

(declare-fun m!954077 () Bool)

(assert (=> b!1033358 m!954077))

(declare-fun m!954079 () Bool)

(assert (=> b!1033359 m!954079))

(declare-fun m!954081 () Bool)

(assert (=> b!1033359 m!954081))

(declare-fun m!954083 () Bool)

(assert (=> b!1033359 m!954083))

(declare-fun m!954085 () Bool)

(assert (=> b!1033359 m!954085))

(declare-fun m!954087 () Bool)

(assert (=> b!1033359 m!954087))

(declare-fun m!954089 () Bool)

(assert (=> b!1033359 m!954089))

(declare-fun m!954091 () Bool)

(assert (=> b!1033359 m!954091))

(declare-fun m!954093 () Bool)

(assert (=> b!1033359 m!954093))

(declare-fun m!954095 () Bool)

(assert (=> b!1033359 m!954095))

(assert (=> b!1033359 m!954079))

(declare-fun m!954097 () Bool)

(assert (=> b!1033359 m!954097))

(declare-fun m!954099 () Bool)

(assert (=> b!1033359 m!954099))

(declare-fun m!954101 () Bool)

(assert (=> b!1033359 m!954101))

(declare-fun m!954103 () Bool)

(assert (=> b!1033359 m!954103))

(declare-fun m!954105 () Bool)

(assert (=> b!1033359 m!954105))

(declare-fun m!954107 () Bool)

(assert (=> b!1033359 m!954107))

(declare-fun m!954109 () Bool)

(assert (=> b!1033359 m!954109))

(assert (=> b!1033359 m!954089))

(declare-fun m!954111 () Bool)

(assert (=> b!1033359 m!954111))

(declare-fun m!954113 () Bool)

(assert (=> b!1033359 m!954113))

(declare-fun m!954115 () Bool)

(assert (=> b!1033359 m!954115))

(check-sat (not b!1033357) (not b_next!20695) tp_is_empty!24415 (not b!1033360) (not start!90322) (not b!1033359) (not mapNonEmpty!38076) (not b!1033361) b_and!33169 (not b_lambda!16049) (not b!1033358))
(check-sat b_and!33169 (not b_next!20695))
