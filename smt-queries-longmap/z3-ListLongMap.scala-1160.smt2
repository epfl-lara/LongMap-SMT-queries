; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24426 () Bool)

(assert start!24426)

(declare-fun b!255874 () Bool)

(declare-fun b_free!6709 () Bool)

(declare-fun b_next!6709 () Bool)

(assert (=> b!255874 (= b_free!6709 (not b_next!6709))))

(declare-fun tp!23424 () Bool)

(declare-fun b_and!13777 () Bool)

(assert (=> b!255874 (= tp!23424 b_and!13777)))

(declare-fun b!255859 () Bool)

(declare-datatypes ((Unit!7909 0))(
  ( (Unit!7910) )
))
(declare-fun e!165849 () Unit!7909)

(declare-fun Unit!7911 () Unit!7909)

(assert (=> b!255859 (= e!165849 Unit!7911)))

(declare-fun b!255860 () Bool)

(declare-fun e!165853 () Bool)

(declare-fun e!165848 () Bool)

(assert (=> b!255860 (= e!165853 e!165848)))

(declare-fun res!125198 () Bool)

(assert (=> b!255860 (=> (not res!125198) (not e!165848))))

(declare-datatypes ((SeekEntryResult!1126 0))(
  ( (MissingZero!1126 (index!6674 (_ BitVec 32))) (Found!1126 (index!6675 (_ BitVec 32))) (Intermediate!1126 (undefined!1938 Bool) (index!6676 (_ BitVec 32)) (x!24904 (_ BitVec 32))) (Undefined!1126) (MissingVacant!1126 (index!6677 (_ BitVec 32))) )
))
(declare-fun lt!128425 () SeekEntryResult!1126)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!255860 (= res!125198 (or (= lt!128425 (MissingZero!1126 index!297)) (= lt!128425 (MissingVacant!1126 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8409 0))(
  ( (V!8410 (val!3330 Int)) )
))
(declare-datatypes ((ValueCell!2942 0))(
  ( (ValueCellFull!2942 (v!5414 V!8409)) (EmptyCell!2942) )
))
(declare-datatypes ((array!12477 0))(
  ( (array!12478 (arr!5911 (Array (_ BitVec 32) ValueCell!2942)) (size!6258 (_ BitVec 32))) )
))
(declare-datatypes ((array!12479 0))(
  ( (array!12480 (arr!5912 (Array (_ BitVec 32) (_ BitVec 64))) (size!6259 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3784 0))(
  ( (LongMapFixedSize!3785 (defaultEntry!4720 Int) (mask!10986 (_ BitVec 32)) (extraKeys!4457 (_ BitVec 32)) (zeroValue!4561 V!8409) (minValue!4561 V!8409) (_size!1941 (_ BitVec 32)) (_keys!6880 array!12479) (_values!4703 array!12477) (_vacant!1941 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3784)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12479 (_ BitVec 32)) SeekEntryResult!1126)

(assert (=> b!255860 (= lt!128425 (seekEntryOrOpen!0 key!932 (_keys!6880 thiss!1504) (mask!10986 thiss!1504)))))

(declare-fun b!255861 () Bool)

(declare-fun e!165842 () Bool)

(declare-fun call!24193 () Bool)

(assert (=> b!255861 (= e!165842 (not call!24193))))

(declare-fun b!255862 () Bool)

(declare-fun e!165840 () Bool)

(assert (=> b!255862 (= e!165848 e!165840)))

(declare-fun res!125195 () Bool)

(assert (=> b!255862 (=> (not res!125195) (not e!165840))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255862 (= res!125195 (inRange!0 index!297 (mask!10986 thiss!1504)))))

(declare-fun lt!128432 () Unit!7909)

(declare-fun e!165851 () Unit!7909)

(assert (=> b!255862 (= lt!128432 e!165851)))

(declare-fun c!43225 () Bool)

(declare-datatypes ((tuple2!4818 0))(
  ( (tuple2!4819 (_1!2420 (_ BitVec 64)) (_2!2420 V!8409)) )
))
(declare-datatypes ((List!3697 0))(
  ( (Nil!3694) (Cons!3693 (h!4355 tuple2!4818) (t!8742 List!3697)) )
))
(declare-datatypes ((ListLongMap!3733 0))(
  ( (ListLongMap!3734 (toList!1882 List!3697)) )
))
(declare-fun lt!128430 () ListLongMap!3733)

(declare-fun contains!1833 (ListLongMap!3733 (_ BitVec 64)) Bool)

(assert (=> b!255862 (= c!43225 (contains!1833 lt!128430 key!932))))

(declare-fun getCurrentListMap!1414 (array!12479 array!12477 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 32) Int) ListLongMap!3733)

(assert (=> b!255862 (= lt!128430 (getCurrentListMap!1414 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun b!255863 () Bool)

(declare-fun e!165852 () Bool)

(declare-fun e!165843 () Bool)

(declare-fun mapRes!11181 () Bool)

(assert (=> b!255863 (= e!165852 (and e!165843 mapRes!11181))))

(declare-fun condMapEmpty!11181 () Bool)

(declare-fun mapDefault!11181 () ValueCell!2942)

(assert (=> b!255863 (= condMapEmpty!11181 (= (arr!5911 (_values!4703 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2942)) mapDefault!11181)))))

(declare-fun bm!24189 () Bool)

(declare-fun arrayContainsKey!0 (array!12479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24189 (= call!24193 (arrayContainsKey!0 (_keys!6880 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255864 () Bool)

(declare-fun lt!128431 () Unit!7909)

(assert (=> b!255864 (= e!165851 lt!128431)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!414 (array!12479 array!12477 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) Int) Unit!7909)

(assert (=> b!255864 (= lt!128431 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!414 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)))))

(declare-fun c!43226 () Bool)

(get-info :version)

(assert (=> b!255864 (= c!43226 ((_ is MissingZero!1126) lt!128425))))

(declare-fun e!165845 () Bool)

(assert (=> b!255864 e!165845))

(declare-fun b!255865 () Bool)

(declare-fun c!43224 () Bool)

(assert (=> b!255865 (= c!43224 ((_ is MissingVacant!1126) lt!128425))))

(declare-fun e!165844 () Bool)

(assert (=> b!255865 (= e!165845 e!165844)))

(declare-fun mapIsEmpty!11181 () Bool)

(assert (=> mapIsEmpty!11181 mapRes!11181))

(declare-fun mapNonEmpty!11181 () Bool)

(declare-fun tp!23423 () Bool)

(declare-fun e!165846 () Bool)

(assert (=> mapNonEmpty!11181 (= mapRes!11181 (and tp!23423 e!165846))))

(declare-fun mapKey!11181 () (_ BitVec 32))

(declare-fun mapValue!11181 () ValueCell!2942)

(declare-fun mapRest!11181 () (Array (_ BitVec 32) ValueCell!2942))

(assert (=> mapNonEmpty!11181 (= (arr!5911 (_values!4703 thiss!1504)) (store mapRest!11181 mapKey!11181 mapValue!11181))))

(declare-fun b!255866 () Bool)

(assert (=> b!255866 (= e!165840 (not (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6259 (_keys!6880 thiss!1504))) (bvslt (size!6259 (_keys!6880 thiss!1504)) #b01111111111111111111111111111111))))))

(declare-fun v!346 () V!8409)

(declare-fun lt!128424 () array!12479)

(declare-fun +!680 (ListLongMap!3733 tuple2!4818) ListLongMap!3733)

(assert (=> b!255866 (= (+!680 lt!128430 (tuple2!4819 key!932 v!346)) (getCurrentListMap!1414 lt!128424 (array!12478 (store (arr!5911 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6258 (_values!4703 thiss!1504))) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128434 () Unit!7909)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!95 (array!12479 array!12477 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 32) (_ BitVec 64) V!8409 Int) Unit!7909)

(assert (=> b!255866 (= lt!128434 (lemmaAddValidKeyToArrayThenAddPairToListMap!95 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) index!297 key!932 v!346 (defaultEntry!4720 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12479 (_ BitVec 32)) Bool)

(assert (=> b!255866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128424 (mask!10986 thiss!1504))))

(declare-fun lt!128433 () Unit!7909)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12479 (_ BitVec 32) (_ BitVec 32)) Unit!7909)

(assert (=> b!255866 (= lt!128433 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6880 thiss!1504) index!297 (mask!10986 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12479 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!255866 (= (arrayCountValidKeys!0 lt!128424 #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6880 thiss!1504) #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504)))))))

(declare-fun lt!128427 () Unit!7909)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12479 (_ BitVec 32) (_ BitVec 64)) Unit!7909)

(assert (=> b!255866 (= lt!128427 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6880 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3698 0))(
  ( (Nil!3695) (Cons!3694 (h!4356 (_ BitVec 64)) (t!8743 List!3698)) )
))
(declare-fun arrayNoDuplicates!0 (array!12479 (_ BitVec 32) List!3698) Bool)

(assert (=> b!255866 (arrayNoDuplicates!0 lt!128424 #b00000000000000000000000000000000 Nil!3695)))

(assert (=> b!255866 (= lt!128424 (array!12480 (store (arr!5912 (_keys!6880 thiss!1504)) index!297 key!932) (size!6259 (_keys!6880 thiss!1504))))))

(declare-fun lt!128426 () Unit!7909)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12479 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3698) Unit!7909)

(assert (=> b!255866 (= lt!128426 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6880 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3695))))

(declare-fun lt!128423 () Unit!7909)

(assert (=> b!255866 (= lt!128423 e!165849)))

(declare-fun c!43227 () Bool)

(assert (=> b!255866 (= c!43227 (arrayContainsKey!0 (_keys!6880 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!255867 () Bool)

(declare-fun res!125200 () Bool)

(assert (=> b!255867 (=> (not res!125200) (not e!165842))))

(assert (=> b!255867 (= res!125200 (= (select (arr!5912 (_keys!6880 thiss!1504)) (index!6674 lt!128425)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!255868 () Bool)

(declare-fun tp_is_empty!6571 () Bool)

(assert (=> b!255868 (= e!165843 tp_is_empty!6571)))

(declare-fun b!255869 () Bool)

(declare-fun e!165850 () Bool)

(assert (=> b!255869 (= e!165850 (not call!24193))))

(declare-fun b!255870 () Bool)

(assert (=> b!255870 (= e!165846 tp_is_empty!6571)))

(declare-fun b!255871 () Bool)

(declare-fun res!125199 () Bool)

(assert (=> b!255871 (=> (not res!125199) (not e!165842))))

(declare-fun call!24192 () Bool)

(assert (=> b!255871 (= res!125199 call!24192)))

(assert (=> b!255871 (= e!165845 e!165842)))

(declare-fun b!255872 () Bool)

(assert (=> b!255872 (= e!165844 e!165850)))

(declare-fun res!125201 () Bool)

(assert (=> b!255872 (= res!125201 call!24192)))

(assert (=> b!255872 (=> (not res!125201) (not e!165850))))

(declare-fun res!125196 () Bool)

(assert (=> start!24426 (=> (not res!125196) (not e!165853))))

(declare-fun valid!1486 (LongMapFixedSize!3784) Bool)

(assert (=> start!24426 (= res!125196 (valid!1486 thiss!1504))))

(assert (=> start!24426 e!165853))

(declare-fun e!165841 () Bool)

(assert (=> start!24426 e!165841))

(assert (=> start!24426 true))

(assert (=> start!24426 tp_is_empty!6571))

(declare-fun b!255873 () Bool)

(declare-fun res!125197 () Bool)

(assert (=> b!255873 (= res!125197 (= (select (arr!5912 (_keys!6880 thiss!1504)) (index!6677 lt!128425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!255873 (=> (not res!125197) (not e!165850))))

(declare-fun array_inv!3889 (array!12479) Bool)

(declare-fun array_inv!3890 (array!12477) Bool)

(assert (=> b!255874 (= e!165841 (and tp!23424 tp_is_empty!6571 (array_inv!3889 (_keys!6880 thiss!1504)) (array_inv!3890 (_values!4703 thiss!1504)) e!165852))))

(declare-fun bm!24190 () Bool)

(assert (=> bm!24190 (= call!24192 (inRange!0 (ite c!43226 (index!6674 lt!128425) (index!6677 lt!128425)) (mask!10986 thiss!1504)))))

(declare-fun b!255875 () Bool)

(assert (=> b!255875 (= e!165844 ((_ is Undefined!1126) lt!128425))))

(declare-fun b!255876 () Bool)

(declare-fun res!125202 () Bool)

(assert (=> b!255876 (=> (not res!125202) (not e!165853))))

(assert (=> b!255876 (= res!125202 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!255877 () Bool)

(declare-fun Unit!7912 () Unit!7909)

(assert (=> b!255877 (= e!165851 Unit!7912)))

(declare-fun lt!128428 () Unit!7909)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!420 (array!12479 array!12477 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) Int) Unit!7909)

(assert (=> b!255877 (= lt!128428 (lemmaInListMapThenSeekEntryOrOpenFindsIt!420 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)))))

(assert (=> b!255877 false))

(declare-fun b!255878 () Bool)

(declare-fun Unit!7913 () Unit!7909)

(assert (=> b!255878 (= e!165849 Unit!7913)))

(declare-fun lt!128429 () Unit!7909)

(declare-fun lemmaArrayContainsKeyThenInListMap!237 (array!12479 array!12477 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) (_ BitVec 32) Int) Unit!7909)

(assert (=> b!255878 (= lt!128429 (lemmaArrayContainsKeyThenInListMap!237 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(assert (=> b!255878 false))

(assert (= (and start!24426 res!125196) b!255876))

(assert (= (and b!255876 res!125202) b!255860))

(assert (= (and b!255860 res!125198) b!255862))

(assert (= (and b!255862 c!43225) b!255877))

(assert (= (and b!255862 (not c!43225)) b!255864))

(assert (= (and b!255864 c!43226) b!255871))

(assert (= (and b!255864 (not c!43226)) b!255865))

(assert (= (and b!255871 res!125199) b!255867))

(assert (= (and b!255867 res!125200) b!255861))

(assert (= (and b!255865 c!43224) b!255872))

(assert (= (and b!255865 (not c!43224)) b!255875))

(assert (= (and b!255872 res!125201) b!255873))

(assert (= (and b!255873 res!125197) b!255869))

(assert (= (or b!255871 b!255872) bm!24190))

(assert (= (or b!255861 b!255869) bm!24189))

(assert (= (and b!255862 res!125195) b!255866))

(assert (= (and b!255866 c!43227) b!255878))

(assert (= (and b!255866 (not c!43227)) b!255859))

(assert (= (and b!255863 condMapEmpty!11181) mapIsEmpty!11181))

(assert (= (and b!255863 (not condMapEmpty!11181)) mapNonEmpty!11181))

(assert (= (and mapNonEmpty!11181 ((_ is ValueCellFull!2942) mapValue!11181)) b!255870))

(assert (= (and b!255863 ((_ is ValueCellFull!2942) mapDefault!11181)) b!255868))

(assert (= b!255874 b!255863))

(assert (= start!24426 b!255874))

(declare-fun m!271427 () Bool)

(assert (=> b!255864 m!271427))

(declare-fun m!271429 () Bool)

(assert (=> bm!24189 m!271429))

(declare-fun m!271431 () Bool)

(assert (=> b!255873 m!271431))

(declare-fun m!271433 () Bool)

(assert (=> b!255867 m!271433))

(declare-fun m!271435 () Bool)

(assert (=> b!255862 m!271435))

(declare-fun m!271437 () Bool)

(assert (=> b!255862 m!271437))

(declare-fun m!271439 () Bool)

(assert (=> b!255862 m!271439))

(declare-fun m!271441 () Bool)

(assert (=> bm!24190 m!271441))

(assert (=> b!255866 m!271429))

(declare-fun m!271443 () Bool)

(assert (=> b!255866 m!271443))

(declare-fun m!271445 () Bool)

(assert (=> b!255866 m!271445))

(declare-fun m!271447 () Bool)

(assert (=> b!255866 m!271447))

(declare-fun m!271449 () Bool)

(assert (=> b!255866 m!271449))

(declare-fun m!271451 () Bool)

(assert (=> b!255866 m!271451))

(declare-fun m!271453 () Bool)

(assert (=> b!255866 m!271453))

(declare-fun m!271455 () Bool)

(assert (=> b!255866 m!271455))

(declare-fun m!271457 () Bool)

(assert (=> b!255866 m!271457))

(declare-fun m!271459 () Bool)

(assert (=> b!255866 m!271459))

(declare-fun m!271461 () Bool)

(assert (=> b!255866 m!271461))

(declare-fun m!271463 () Bool)

(assert (=> b!255866 m!271463))

(declare-fun m!271465 () Bool)

(assert (=> b!255866 m!271465))

(declare-fun m!271467 () Bool)

(assert (=> b!255878 m!271467))

(declare-fun m!271469 () Bool)

(assert (=> b!255874 m!271469))

(declare-fun m!271471 () Bool)

(assert (=> b!255874 m!271471))

(declare-fun m!271473 () Bool)

(assert (=> b!255860 m!271473))

(declare-fun m!271475 () Bool)

(assert (=> b!255877 m!271475))

(declare-fun m!271477 () Bool)

(assert (=> mapNonEmpty!11181 m!271477))

(declare-fun m!271479 () Bool)

(assert (=> start!24426 m!271479))

(check-sat b_and!13777 (not b!255874) (not start!24426) (not b_next!6709) (not bm!24189) (not b!255862) tp_is_empty!6571 (not b!255864) (not b!255866) (not mapNonEmpty!11181) (not b!255860) (not b!255877) (not b!255878) (not bm!24190))
(check-sat b_and!13777 (not b_next!6709))
(get-model)

(declare-fun b!256007 () Bool)

(declare-fun res!125262 () Bool)

(declare-fun e!165943 () Bool)

(assert (=> b!256007 (=> (not res!125262) (not e!165943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!256007 (= res!125262 (not (validKeyInArray!0 (select (arr!5912 (_keys!6880 thiss!1504)) index!297))))))

(declare-fun b!256008 () Bool)

(declare-fun res!125260 () Bool)

(assert (=> b!256008 (=> (not res!125260) (not e!165943))))

(assert (=> b!256008 (= res!125260 (validKeyInArray!0 key!932))))

(declare-fun b!256009 () Bool)

(assert (=> b!256009 (= e!165943 (bvslt (size!6259 (_keys!6880 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun e!165942 () Bool)

(declare-fun b!256010 () Bool)

(assert (=> b!256010 (= e!165942 (= (arrayCountValidKeys!0 (array!12480 (store (arr!5912 (_keys!6880 thiss!1504)) index!297 key!932) (size!6259 (_keys!6880 thiss!1504))) #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6880 thiss!1504) #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!61697 () Bool)

(assert (=> d!61697 e!165942))

(declare-fun res!125261 () Bool)

(assert (=> d!61697 (=> (not res!125261) (not e!165942))))

(assert (=> d!61697 (= res!125261 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6259 (_keys!6880 thiss!1504)))))))

(declare-fun lt!128509 () Unit!7909)

(declare-fun choose!1 (array!12479 (_ BitVec 32) (_ BitVec 64)) Unit!7909)

(assert (=> d!61697 (= lt!128509 (choose!1 (_keys!6880 thiss!1504) index!297 key!932))))

(assert (=> d!61697 e!165943))

(declare-fun res!125259 () Bool)

(assert (=> d!61697 (=> (not res!125259) (not e!165943))))

(assert (=> d!61697 (= res!125259 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6259 (_keys!6880 thiss!1504)))))))

(assert (=> d!61697 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6880 thiss!1504) index!297 key!932) lt!128509)))

(assert (= (and d!61697 res!125259) b!256007))

(assert (= (and b!256007 res!125262) b!256008))

(assert (= (and b!256008 res!125260) b!256009))

(assert (= (and d!61697 res!125261) b!256010))

(declare-fun m!271589 () Bool)

(assert (=> b!256007 m!271589))

(assert (=> b!256007 m!271589))

(declare-fun m!271591 () Bool)

(assert (=> b!256007 m!271591))

(declare-fun m!271593 () Bool)

(assert (=> b!256008 m!271593))

(assert (=> b!256010 m!271461))

(declare-fun m!271595 () Bool)

(assert (=> b!256010 m!271595))

(assert (=> b!256010 m!271463))

(declare-fun m!271597 () Bool)

(assert (=> d!61697 m!271597))

(assert (=> b!255866 d!61697))

(declare-fun b!256021 () Bool)

(declare-fun e!165954 () Bool)

(declare-fun e!165952 () Bool)

(assert (=> b!256021 (= e!165954 e!165952)))

(declare-fun res!125271 () Bool)

(assert (=> b!256021 (=> (not res!125271) (not e!165952))))

(declare-fun e!165953 () Bool)

(assert (=> b!256021 (= res!125271 (not e!165953))))

(declare-fun res!125269 () Bool)

(assert (=> b!256021 (=> (not res!125269) (not e!165953))))

(assert (=> b!256021 (= res!125269 (validKeyInArray!0 (select (arr!5912 lt!128424) #b00000000000000000000000000000000)))))

(declare-fun b!256022 () Bool)

(declare-fun e!165955 () Bool)

(declare-fun call!24208 () Bool)

(assert (=> b!256022 (= e!165955 call!24208)))

(declare-fun b!256023 () Bool)

(assert (=> b!256023 (= e!165955 call!24208)))

(declare-fun bm!24205 () Bool)

(declare-fun c!43254 () Bool)

(assert (=> bm!24205 (= call!24208 (arrayNoDuplicates!0 lt!128424 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!43254 (Cons!3694 (select (arr!5912 lt!128424) #b00000000000000000000000000000000) Nil!3695) Nil!3695)))))

(declare-fun b!256024 () Bool)

(assert (=> b!256024 (= e!165952 e!165955)))

(assert (=> b!256024 (= c!43254 (validKeyInArray!0 (select (arr!5912 lt!128424) #b00000000000000000000000000000000)))))

(declare-fun b!256025 () Bool)

(declare-fun contains!1835 (List!3698 (_ BitVec 64)) Bool)

(assert (=> b!256025 (= e!165953 (contains!1835 Nil!3695 (select (arr!5912 lt!128424) #b00000000000000000000000000000000)))))

(declare-fun d!61699 () Bool)

(declare-fun res!125270 () Bool)

(assert (=> d!61699 (=> res!125270 e!165954)))

(assert (=> d!61699 (= res!125270 (bvsge #b00000000000000000000000000000000 (size!6259 lt!128424)))))

(assert (=> d!61699 (= (arrayNoDuplicates!0 lt!128424 #b00000000000000000000000000000000 Nil!3695) e!165954)))

(assert (= (and d!61699 (not res!125270)) b!256021))

(assert (= (and b!256021 res!125269) b!256025))

(assert (= (and b!256021 res!125271) b!256024))

(assert (= (and b!256024 c!43254) b!256022))

(assert (= (and b!256024 (not c!43254)) b!256023))

(assert (= (or b!256022 b!256023) bm!24205))

(declare-fun m!271599 () Bool)

(assert (=> b!256021 m!271599))

(assert (=> b!256021 m!271599))

(declare-fun m!271601 () Bool)

(assert (=> b!256021 m!271601))

(assert (=> bm!24205 m!271599))

(declare-fun m!271603 () Bool)

(assert (=> bm!24205 m!271603))

(assert (=> b!256024 m!271599))

(assert (=> b!256024 m!271599))

(assert (=> b!256024 m!271601))

(assert (=> b!256025 m!271599))

(assert (=> b!256025 m!271599))

(declare-fun m!271605 () Bool)

(assert (=> b!256025 m!271605))

(assert (=> b!255866 d!61699))

(declare-fun b!256034 () Bool)

(declare-fun e!165961 () (_ BitVec 32))

(assert (=> b!256034 (= e!165961 #b00000000000000000000000000000000)))

(declare-fun b!256035 () Bool)

(declare-fun e!165960 () (_ BitVec 32))

(declare-fun call!24211 () (_ BitVec 32))

(assert (=> b!256035 (= e!165960 call!24211)))

(declare-fun d!61701 () Bool)

(declare-fun lt!128512 () (_ BitVec 32))

(assert (=> d!61701 (and (bvsge lt!128512 #b00000000000000000000000000000000) (bvsle lt!128512 (bvsub (size!6259 (_keys!6880 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61701 (= lt!128512 e!165961)))

(declare-fun c!43259 () Bool)

(assert (=> d!61701 (= c!43259 (bvsge #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))))))

(assert (=> d!61701 (and (bvsle #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6259 (_keys!6880 thiss!1504)) (size!6259 (_keys!6880 thiss!1504))))))

(assert (=> d!61701 (= (arrayCountValidKeys!0 (_keys!6880 thiss!1504) #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))) lt!128512)))

(declare-fun b!256036 () Bool)

(assert (=> b!256036 (= e!165961 e!165960)))

(declare-fun c!43260 () Bool)

(assert (=> b!256036 (= c!43260 (validKeyInArray!0 (select (arr!5912 (_keys!6880 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24208 () Bool)

(assert (=> bm!24208 (= call!24211 (arrayCountValidKeys!0 (_keys!6880 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6259 (_keys!6880 thiss!1504))))))

(declare-fun b!256037 () Bool)

(assert (=> b!256037 (= e!165960 (bvadd #b00000000000000000000000000000001 call!24211))))

(assert (= (and d!61701 c!43259) b!256034))

(assert (= (and d!61701 (not c!43259)) b!256036))

(assert (= (and b!256036 c!43260) b!256037))

(assert (= (and b!256036 (not c!43260)) b!256035))

(assert (= (or b!256037 b!256035) bm!24208))

(declare-fun m!271607 () Bool)

(assert (=> b!256036 m!271607))

(assert (=> b!256036 m!271607))

(declare-fun m!271609 () Bool)

(assert (=> b!256036 m!271609))

(declare-fun m!271611 () Bool)

(assert (=> bm!24208 m!271611))

(assert (=> b!255866 d!61701))

(declare-fun d!61703 () Bool)

(declare-fun e!165964 () Bool)

(assert (=> d!61703 e!165964))

(declare-fun res!125274 () Bool)

(assert (=> d!61703 (=> (not res!125274) (not e!165964))))

(assert (=> d!61703 (= res!125274 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6259 (_keys!6880 thiss!1504))) (bvslt index!297 (size!6258 (_values!4703 thiss!1504)))))))

(declare-fun lt!128515 () Unit!7909)

(declare-fun choose!1231 (array!12479 array!12477 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 32) (_ BitVec 64) V!8409 Int) Unit!7909)

(assert (=> d!61703 (= lt!128515 (choose!1231 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) index!297 key!932 v!346 (defaultEntry!4720 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!61703 (validMask!0 (mask!10986 thiss!1504))))

(assert (=> d!61703 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!95 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) index!297 key!932 v!346 (defaultEntry!4720 thiss!1504)) lt!128515)))

(declare-fun b!256040 () Bool)

(assert (=> b!256040 (= e!165964 (= (+!680 (getCurrentListMap!1414 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)) (tuple2!4819 key!932 v!346)) (getCurrentListMap!1414 (array!12480 (store (arr!5912 (_keys!6880 thiss!1504)) index!297 key!932) (size!6259 (_keys!6880 thiss!1504))) (array!12478 (store (arr!5911 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6258 (_values!4703 thiss!1504))) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504))))))

(assert (= (and d!61703 res!125274) b!256040))

(declare-fun m!271613 () Bool)

(assert (=> d!61703 m!271613))

(declare-fun m!271615 () Bool)

(assert (=> d!61703 m!271615))

(assert (=> b!256040 m!271439))

(declare-fun m!271617 () Bool)

(assert (=> b!256040 m!271617))

(assert (=> b!256040 m!271461))

(assert (=> b!256040 m!271439))

(declare-fun m!271619 () Bool)

(assert (=> b!256040 m!271619))

(assert (=> b!256040 m!271449))

(assert (=> b!255866 d!61703))

(declare-fun d!61705 () Bool)

(declare-fun e!165967 () Bool)

(assert (=> d!61705 e!165967))

(declare-fun res!125279 () Bool)

(assert (=> d!61705 (=> (not res!125279) (not e!165967))))

(declare-fun lt!128527 () ListLongMap!3733)

(assert (=> d!61705 (= res!125279 (contains!1833 lt!128527 (_1!2420 (tuple2!4819 key!932 v!346))))))

(declare-fun lt!128525 () List!3697)

(assert (=> d!61705 (= lt!128527 (ListLongMap!3734 lt!128525))))

(declare-fun lt!128524 () Unit!7909)

(declare-fun lt!128526 () Unit!7909)

(assert (=> d!61705 (= lt!128524 lt!128526)))

(declare-datatypes ((Option!315 0))(
  ( (Some!314 (v!5419 V!8409)) (None!313) )
))
(declare-fun getValueByKey!309 (List!3697 (_ BitVec 64)) Option!315)

(assert (=> d!61705 (= (getValueByKey!309 lt!128525 (_1!2420 (tuple2!4819 key!932 v!346))) (Some!314 (_2!2420 (tuple2!4819 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!165 (List!3697 (_ BitVec 64) V!8409) Unit!7909)

(assert (=> d!61705 (= lt!128526 (lemmaContainsTupThenGetReturnValue!165 lt!128525 (_1!2420 (tuple2!4819 key!932 v!346)) (_2!2420 (tuple2!4819 key!932 v!346))))))

(declare-fun insertStrictlySorted!168 (List!3697 (_ BitVec 64) V!8409) List!3697)

(assert (=> d!61705 (= lt!128525 (insertStrictlySorted!168 (toList!1882 lt!128430) (_1!2420 (tuple2!4819 key!932 v!346)) (_2!2420 (tuple2!4819 key!932 v!346))))))

(assert (=> d!61705 (= (+!680 lt!128430 (tuple2!4819 key!932 v!346)) lt!128527)))

(declare-fun b!256045 () Bool)

(declare-fun res!125280 () Bool)

(assert (=> b!256045 (=> (not res!125280) (not e!165967))))

(assert (=> b!256045 (= res!125280 (= (getValueByKey!309 (toList!1882 lt!128527) (_1!2420 (tuple2!4819 key!932 v!346))) (Some!314 (_2!2420 (tuple2!4819 key!932 v!346)))))))

(declare-fun b!256046 () Bool)

(declare-fun contains!1836 (List!3697 tuple2!4818) Bool)

(assert (=> b!256046 (= e!165967 (contains!1836 (toList!1882 lt!128527) (tuple2!4819 key!932 v!346)))))

(assert (= (and d!61705 res!125279) b!256045))

(assert (= (and b!256045 res!125280) b!256046))

(declare-fun m!271621 () Bool)

(assert (=> d!61705 m!271621))

(declare-fun m!271623 () Bool)

(assert (=> d!61705 m!271623))

(declare-fun m!271625 () Bool)

(assert (=> d!61705 m!271625))

(declare-fun m!271627 () Bool)

(assert (=> d!61705 m!271627))

(declare-fun m!271629 () Bool)

(assert (=> b!256045 m!271629))

(declare-fun m!271631 () Bool)

(assert (=> b!256046 m!271631))

(assert (=> b!255866 d!61705))

(declare-fun b!256055 () Bool)

(declare-fun e!165974 () Bool)

(declare-fun e!165976 () Bool)

(assert (=> b!256055 (= e!165974 e!165976)))

(declare-fun c!43263 () Bool)

(assert (=> b!256055 (= c!43263 (validKeyInArray!0 (select (arr!5912 lt!128424) #b00000000000000000000000000000000)))))

(declare-fun b!256056 () Bool)

(declare-fun call!24214 () Bool)

(assert (=> b!256056 (= e!165976 call!24214)))

(declare-fun b!256057 () Bool)

(declare-fun e!165975 () Bool)

(assert (=> b!256057 (= e!165976 e!165975)))

(declare-fun lt!128534 () (_ BitVec 64))

(assert (=> b!256057 (= lt!128534 (select (arr!5912 lt!128424) #b00000000000000000000000000000000))))

(declare-fun lt!128536 () Unit!7909)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12479 (_ BitVec 64) (_ BitVec 32)) Unit!7909)

(assert (=> b!256057 (= lt!128536 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!128424 lt!128534 #b00000000000000000000000000000000))))

(assert (=> b!256057 (arrayContainsKey!0 lt!128424 lt!128534 #b00000000000000000000000000000000)))

(declare-fun lt!128535 () Unit!7909)

(assert (=> b!256057 (= lt!128535 lt!128536)))

(declare-fun res!125286 () Bool)

(assert (=> b!256057 (= res!125286 (= (seekEntryOrOpen!0 (select (arr!5912 lt!128424) #b00000000000000000000000000000000) lt!128424 (mask!10986 thiss!1504)) (Found!1126 #b00000000000000000000000000000000)))))

(assert (=> b!256057 (=> (not res!125286) (not e!165975))))

(declare-fun bm!24211 () Bool)

(assert (=> bm!24211 (= call!24214 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!128424 (mask!10986 thiss!1504)))))

(declare-fun d!61707 () Bool)

(declare-fun res!125285 () Bool)

(assert (=> d!61707 (=> res!125285 e!165974)))

(assert (=> d!61707 (= res!125285 (bvsge #b00000000000000000000000000000000 (size!6259 lt!128424)))))

(assert (=> d!61707 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128424 (mask!10986 thiss!1504)) e!165974)))

(declare-fun b!256058 () Bool)

(assert (=> b!256058 (= e!165975 call!24214)))

(assert (= (and d!61707 (not res!125285)) b!256055))

(assert (= (and b!256055 c!43263) b!256057))

(assert (= (and b!256055 (not c!43263)) b!256056))

(assert (= (and b!256057 res!125286) b!256058))

(assert (= (or b!256058 b!256056) bm!24211))

(assert (=> b!256055 m!271599))

(assert (=> b!256055 m!271599))

(assert (=> b!256055 m!271601))

(assert (=> b!256057 m!271599))

(declare-fun m!271633 () Bool)

(assert (=> b!256057 m!271633))

(declare-fun m!271635 () Bool)

(assert (=> b!256057 m!271635))

(assert (=> b!256057 m!271599))

(declare-fun m!271637 () Bool)

(assert (=> b!256057 m!271637))

(declare-fun m!271639 () Bool)

(assert (=> bm!24211 m!271639))

(assert (=> b!255866 d!61707))

(declare-fun b!256101 () Bool)

(declare-fun e!166005 () ListLongMap!3733)

(declare-fun call!24233 () ListLongMap!3733)

(assert (=> b!256101 (= e!166005 call!24233)))

(declare-fun b!256102 () Bool)

(declare-fun res!125313 () Bool)

(declare-fun e!166011 () Bool)

(assert (=> b!256102 (=> (not res!125313) (not e!166011))))

(declare-fun e!166004 () Bool)

(assert (=> b!256102 (= res!125313 e!166004)))

(declare-fun res!125309 () Bool)

(assert (=> b!256102 (=> res!125309 e!166004)))

(declare-fun e!166007 () Bool)

(assert (=> b!256102 (= res!125309 (not e!166007))))

(declare-fun res!125310 () Bool)

(assert (=> b!256102 (=> (not res!125310) (not e!166007))))

(assert (=> b!256102 (= res!125310 (bvslt #b00000000000000000000000000000000 (size!6259 lt!128424)))))

(declare-fun b!256103 () Bool)

(declare-fun e!166010 () Bool)

(assert (=> b!256103 (= e!166011 e!166010)))

(declare-fun c!43280 () Bool)

(assert (=> b!256103 (= c!43280 (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256104 () Bool)

(declare-fun e!166008 () Unit!7909)

(declare-fun Unit!7919 () Unit!7909)

(assert (=> b!256104 (= e!166008 Unit!7919)))

(declare-fun bm!24226 () Bool)

(declare-fun call!24231 () ListLongMap!3733)

(assert (=> bm!24226 (= call!24233 call!24231)))

(declare-fun d!61709 () Bool)

(assert (=> d!61709 e!166011))

(declare-fun res!125311 () Bool)

(assert (=> d!61709 (=> (not res!125311) (not e!166011))))

(assert (=> d!61709 (= res!125311 (or (bvsge #b00000000000000000000000000000000 (size!6259 lt!128424)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6259 lt!128424)))))))

(declare-fun lt!128588 () ListLongMap!3733)

(declare-fun lt!128600 () ListLongMap!3733)

(assert (=> d!61709 (= lt!128588 lt!128600)))

(declare-fun lt!128584 () Unit!7909)

(assert (=> d!61709 (= lt!128584 e!166008)))

(declare-fun c!43277 () Bool)

(declare-fun e!166013 () Bool)

(assert (=> d!61709 (= c!43277 e!166013)))

(declare-fun res!125308 () Bool)

(assert (=> d!61709 (=> (not res!125308) (not e!166013))))

(assert (=> d!61709 (= res!125308 (bvslt #b00000000000000000000000000000000 (size!6259 lt!128424)))))

(declare-fun e!166015 () ListLongMap!3733)

(assert (=> d!61709 (= lt!128600 e!166015)))

(declare-fun c!43276 () Bool)

(assert (=> d!61709 (= c!43276 (and (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61709 (validMask!0 (mask!10986 thiss!1504))))

(assert (=> d!61709 (= (getCurrentListMap!1414 lt!128424 (array!12478 (store (arr!5911 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6258 (_values!4703 thiss!1504))) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)) lt!128588)))

(declare-fun b!256105 () Bool)

(assert (=> b!256105 (= e!166007 (validKeyInArray!0 (select (arr!5912 lt!128424) #b00000000000000000000000000000000)))))

(declare-fun b!256106 () Bool)

(declare-fun c!43278 () Bool)

(assert (=> b!256106 (= c!43278 (and (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!166012 () ListLongMap!3733)

(assert (=> b!256106 (= e!166012 e!166005)))

(declare-fun b!256107 () Bool)

(declare-fun e!166003 () Bool)

(declare-fun apply!250 (ListLongMap!3733 (_ BitVec 64)) V!8409)

(assert (=> b!256107 (= e!166003 (= (apply!250 lt!128588 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4561 thiss!1504)))))

(declare-fun b!256108 () Bool)

(declare-fun e!166006 () Bool)

(assert (=> b!256108 (= e!166006 (= (apply!250 lt!128588 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4561 thiss!1504)))))

(declare-fun b!256109 () Bool)

(declare-fun e!166014 () Bool)

(declare-fun call!24232 () Bool)

(assert (=> b!256109 (= e!166014 (not call!24232))))

(declare-fun b!256110 () Bool)

(declare-fun e!166009 () Bool)

(declare-fun get!3047 (ValueCell!2942 V!8409) V!8409)

(declare-fun dynLambda!593 (Int (_ BitVec 64)) V!8409)

(assert (=> b!256110 (= e!166009 (= (apply!250 lt!128588 (select (arr!5912 lt!128424) #b00000000000000000000000000000000)) (get!3047 (select (arr!5911 (array!12478 (store (arr!5911 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6258 (_values!4703 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4720 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256110 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6258 (array!12478 (store (arr!5911 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6258 (_values!4703 thiss!1504))))))))

(assert (=> b!256110 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6259 lt!128424)))))

(declare-fun b!256111 () Bool)

(declare-fun lt!128598 () Unit!7909)

(assert (=> b!256111 (= e!166008 lt!128598)))

(declare-fun lt!128595 () ListLongMap!3733)

(declare-fun getCurrentListMapNoExtraKeys!566 (array!12479 array!12477 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 32) Int) ListLongMap!3733)

(assert (=> b!256111 (= lt!128595 (getCurrentListMapNoExtraKeys!566 lt!128424 (array!12478 (store (arr!5911 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6258 (_values!4703 thiss!1504))) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128593 () (_ BitVec 64))

(assert (=> b!256111 (= lt!128593 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128594 () (_ BitVec 64))

(assert (=> b!256111 (= lt!128594 (select (arr!5912 lt!128424) #b00000000000000000000000000000000))))

(declare-fun lt!128597 () Unit!7909)

(declare-fun addStillContains!226 (ListLongMap!3733 (_ BitVec 64) V!8409 (_ BitVec 64)) Unit!7909)

(assert (=> b!256111 (= lt!128597 (addStillContains!226 lt!128595 lt!128593 (zeroValue!4561 thiss!1504) lt!128594))))

(assert (=> b!256111 (contains!1833 (+!680 lt!128595 (tuple2!4819 lt!128593 (zeroValue!4561 thiss!1504))) lt!128594)))

(declare-fun lt!128581 () Unit!7909)

(assert (=> b!256111 (= lt!128581 lt!128597)))

(declare-fun lt!128585 () ListLongMap!3733)

(assert (=> b!256111 (= lt!128585 (getCurrentListMapNoExtraKeys!566 lt!128424 (array!12478 (store (arr!5911 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6258 (_values!4703 thiss!1504))) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128589 () (_ BitVec 64))

(assert (=> b!256111 (= lt!128589 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128583 () (_ BitVec 64))

(assert (=> b!256111 (= lt!128583 (select (arr!5912 lt!128424) #b00000000000000000000000000000000))))

(declare-fun lt!128596 () Unit!7909)

(declare-fun addApplyDifferent!226 (ListLongMap!3733 (_ BitVec 64) V!8409 (_ BitVec 64)) Unit!7909)

(assert (=> b!256111 (= lt!128596 (addApplyDifferent!226 lt!128585 lt!128589 (minValue!4561 thiss!1504) lt!128583))))

(assert (=> b!256111 (= (apply!250 (+!680 lt!128585 (tuple2!4819 lt!128589 (minValue!4561 thiss!1504))) lt!128583) (apply!250 lt!128585 lt!128583))))

(declare-fun lt!128601 () Unit!7909)

(assert (=> b!256111 (= lt!128601 lt!128596)))

(declare-fun lt!128592 () ListLongMap!3733)

(assert (=> b!256111 (= lt!128592 (getCurrentListMapNoExtraKeys!566 lt!128424 (array!12478 (store (arr!5911 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6258 (_values!4703 thiss!1504))) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128602 () (_ BitVec 64))

(assert (=> b!256111 (= lt!128602 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128590 () (_ BitVec 64))

(assert (=> b!256111 (= lt!128590 (select (arr!5912 lt!128424) #b00000000000000000000000000000000))))

(declare-fun lt!128586 () Unit!7909)

(assert (=> b!256111 (= lt!128586 (addApplyDifferent!226 lt!128592 lt!128602 (zeroValue!4561 thiss!1504) lt!128590))))

(assert (=> b!256111 (= (apply!250 (+!680 lt!128592 (tuple2!4819 lt!128602 (zeroValue!4561 thiss!1504))) lt!128590) (apply!250 lt!128592 lt!128590))))

(declare-fun lt!128591 () Unit!7909)

(assert (=> b!256111 (= lt!128591 lt!128586)))

(declare-fun lt!128582 () ListLongMap!3733)

(assert (=> b!256111 (= lt!128582 (getCurrentListMapNoExtraKeys!566 lt!128424 (array!12478 (store (arr!5911 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6258 (_values!4703 thiss!1504))) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128587 () (_ BitVec 64))

(assert (=> b!256111 (= lt!128587 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128599 () (_ BitVec 64))

(assert (=> b!256111 (= lt!128599 (select (arr!5912 lt!128424) #b00000000000000000000000000000000))))

(assert (=> b!256111 (= lt!128598 (addApplyDifferent!226 lt!128582 lt!128587 (minValue!4561 thiss!1504) lt!128599))))

(assert (=> b!256111 (= (apply!250 (+!680 lt!128582 (tuple2!4819 lt!128587 (minValue!4561 thiss!1504))) lt!128599) (apply!250 lt!128582 lt!128599))))

(declare-fun b!256112 () Bool)

(assert (=> b!256112 (= e!166014 e!166003)))

(declare-fun res!125307 () Bool)

(assert (=> b!256112 (= res!125307 call!24232)))

(assert (=> b!256112 (=> (not res!125307) (not e!166003))))

(declare-fun b!256113 () Bool)

(declare-fun call!24230 () Bool)

(assert (=> b!256113 (= e!166010 (not call!24230))))

(declare-fun b!256114 () Bool)

(declare-fun call!24229 () ListLongMap!3733)

(assert (=> b!256114 (= e!166005 call!24229)))

(declare-fun b!256115 () Bool)

(assert (=> b!256115 (= e!166015 e!166012)))

(declare-fun c!43281 () Bool)

(assert (=> b!256115 (= c!43281 (and (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256116 () Bool)

(assert (=> b!256116 (= e!166010 e!166006)))

(declare-fun res!125312 () Bool)

(assert (=> b!256116 (= res!125312 call!24230)))

(assert (=> b!256116 (=> (not res!125312) (not e!166006))))

(declare-fun b!256117 () Bool)

(declare-fun res!125305 () Bool)

(assert (=> b!256117 (=> (not res!125305) (not e!166011))))

(assert (=> b!256117 (= res!125305 e!166014)))

(declare-fun c!43279 () Bool)

(assert (=> b!256117 (= c!43279 (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24227 () Bool)

(declare-fun call!24235 () ListLongMap!3733)

(declare-fun call!24234 () ListLongMap!3733)

(assert (=> bm!24227 (= call!24235 (+!680 (ite c!43276 call!24234 (ite c!43281 call!24231 call!24233)) (ite (or c!43276 c!43281) (tuple2!4819 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4561 thiss!1504)) (tuple2!4819 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4561 thiss!1504)))))))

(declare-fun b!256118 () Bool)

(assert (=> b!256118 (= e!166012 call!24229)))

(declare-fun bm!24228 () Bool)

(assert (=> bm!24228 (= call!24231 call!24234)))

(declare-fun bm!24229 () Bool)

(assert (=> bm!24229 (= call!24232 (contains!1833 lt!128588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256119 () Bool)

(assert (=> b!256119 (= e!166015 (+!680 call!24235 (tuple2!4819 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4561 thiss!1504))))))

(declare-fun bm!24230 () Bool)

(assert (=> bm!24230 (= call!24230 (contains!1833 lt!128588 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24231 () Bool)

(assert (=> bm!24231 (= call!24229 call!24235)))

(declare-fun bm!24232 () Bool)

(assert (=> bm!24232 (= call!24234 (getCurrentListMapNoExtraKeys!566 lt!128424 (array!12478 (store (arr!5911 (_values!4703 thiss!1504)) index!297 (ValueCellFull!2942 v!346)) (size!6258 (_values!4703 thiss!1504))) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun b!256120 () Bool)

(assert (=> b!256120 (= e!166013 (validKeyInArray!0 (select (arr!5912 lt!128424) #b00000000000000000000000000000000)))))

(declare-fun b!256121 () Bool)

(assert (=> b!256121 (= e!166004 e!166009)))

(declare-fun res!125306 () Bool)

(assert (=> b!256121 (=> (not res!125306) (not e!166009))))

(assert (=> b!256121 (= res!125306 (contains!1833 lt!128588 (select (arr!5912 lt!128424) #b00000000000000000000000000000000)))))

(assert (=> b!256121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6259 lt!128424)))))

(assert (= (and d!61709 c!43276) b!256119))

(assert (= (and d!61709 (not c!43276)) b!256115))

(assert (= (and b!256115 c!43281) b!256118))

(assert (= (and b!256115 (not c!43281)) b!256106))

(assert (= (and b!256106 c!43278) b!256114))

(assert (= (and b!256106 (not c!43278)) b!256101))

(assert (= (or b!256114 b!256101) bm!24226))

(assert (= (or b!256118 bm!24226) bm!24228))

(assert (= (or b!256118 b!256114) bm!24231))

(assert (= (or b!256119 bm!24228) bm!24232))

(assert (= (or b!256119 bm!24231) bm!24227))

(assert (= (and d!61709 res!125308) b!256120))

(assert (= (and d!61709 c!43277) b!256111))

(assert (= (and d!61709 (not c!43277)) b!256104))

(assert (= (and d!61709 res!125311) b!256102))

(assert (= (and b!256102 res!125310) b!256105))

(assert (= (and b!256102 (not res!125309)) b!256121))

(assert (= (and b!256121 res!125306) b!256110))

(assert (= (and b!256102 res!125313) b!256117))

(assert (= (and b!256117 c!43279) b!256112))

(assert (= (and b!256117 (not c!43279)) b!256109))

(assert (= (and b!256112 res!125307) b!256107))

(assert (= (or b!256112 b!256109) bm!24229))

(assert (= (and b!256117 res!125305) b!256103))

(assert (= (and b!256103 c!43280) b!256116))

(assert (= (and b!256103 (not c!43280)) b!256113))

(assert (= (and b!256116 res!125312) b!256108))

(assert (= (or b!256116 b!256113) bm!24230))

(declare-fun b_lambda!8177 () Bool)

(assert (=> (not b_lambda!8177) (not b!256110)))

(declare-fun t!8747 () Bool)

(declare-fun tb!3005 () Bool)

(assert (=> (and b!255874 (= (defaultEntry!4720 thiss!1504) (defaultEntry!4720 thiss!1504)) t!8747) tb!3005))

(declare-fun result!5353 () Bool)

(assert (=> tb!3005 (= result!5353 tp_is_empty!6571)))

(assert (=> b!256110 t!8747))

(declare-fun b_and!13783 () Bool)

(assert (= b_and!13777 (and (=> t!8747 result!5353) b_and!13783)))

(declare-fun m!271641 () Bool)

(assert (=> bm!24227 m!271641))

(declare-fun m!271643 () Bool)

(assert (=> bm!24232 m!271643))

(declare-fun m!271645 () Bool)

(assert (=> b!256110 m!271645))

(declare-fun m!271647 () Bool)

(assert (=> b!256110 m!271647))

(declare-fun m!271649 () Bool)

(assert (=> b!256110 m!271649))

(assert (=> b!256110 m!271599))

(assert (=> b!256110 m!271599))

(declare-fun m!271651 () Bool)

(assert (=> b!256110 m!271651))

(assert (=> b!256110 m!271647))

(assert (=> b!256110 m!271645))

(declare-fun m!271653 () Bool)

(assert (=> b!256108 m!271653))

(assert (=> b!256120 m!271599))

(assert (=> b!256120 m!271599))

(assert (=> b!256120 m!271601))

(declare-fun m!271655 () Bool)

(assert (=> b!256111 m!271655))

(declare-fun m!271657 () Bool)

(assert (=> b!256111 m!271657))

(declare-fun m!271659 () Bool)

(assert (=> b!256111 m!271659))

(declare-fun m!271661 () Bool)

(assert (=> b!256111 m!271661))

(declare-fun m!271663 () Bool)

(assert (=> b!256111 m!271663))

(declare-fun m!271665 () Bool)

(assert (=> b!256111 m!271665))

(assert (=> b!256111 m!271655))

(declare-fun m!271667 () Bool)

(assert (=> b!256111 m!271667))

(declare-fun m!271669 () Bool)

(assert (=> b!256111 m!271669))

(assert (=> b!256111 m!271663))

(declare-fun m!271671 () Bool)

(assert (=> b!256111 m!271671))

(declare-fun m!271673 () Bool)

(assert (=> b!256111 m!271673))

(declare-fun m!271675 () Bool)

(assert (=> b!256111 m!271675))

(declare-fun m!271677 () Bool)

(assert (=> b!256111 m!271677))

(assert (=> b!256111 m!271643))

(declare-fun m!271679 () Bool)

(assert (=> b!256111 m!271679))

(assert (=> b!256111 m!271671))

(declare-fun m!271681 () Bool)

(assert (=> b!256111 m!271681))

(assert (=> b!256111 m!271599))

(assert (=> b!256111 m!271659))

(declare-fun m!271683 () Bool)

(assert (=> b!256111 m!271683))

(assert (=> b!256105 m!271599))

(assert (=> b!256105 m!271599))

(assert (=> b!256105 m!271601))

(assert (=> b!256121 m!271599))

(assert (=> b!256121 m!271599))

(declare-fun m!271685 () Bool)

(assert (=> b!256121 m!271685))

(assert (=> d!61709 m!271615))

(declare-fun m!271687 () Bool)

(assert (=> b!256119 m!271687))

(declare-fun m!271689 () Bool)

(assert (=> bm!24229 m!271689))

(declare-fun m!271691 () Bool)

(assert (=> bm!24230 m!271691))

(declare-fun m!271693 () Bool)

(assert (=> b!256107 m!271693))

(assert (=> b!255866 d!61709))

(declare-fun b!256124 () Bool)

(declare-fun e!166017 () (_ BitVec 32))

(assert (=> b!256124 (= e!166017 #b00000000000000000000000000000000)))

(declare-fun b!256125 () Bool)

(declare-fun e!166016 () (_ BitVec 32))

(declare-fun call!24236 () (_ BitVec 32))

(assert (=> b!256125 (= e!166016 call!24236)))

(declare-fun d!61711 () Bool)

(declare-fun lt!128603 () (_ BitVec 32))

(assert (=> d!61711 (and (bvsge lt!128603 #b00000000000000000000000000000000) (bvsle lt!128603 (bvsub (size!6259 lt!128424) #b00000000000000000000000000000000)))))

(assert (=> d!61711 (= lt!128603 e!166017)))

(declare-fun c!43282 () Bool)

(assert (=> d!61711 (= c!43282 (bvsge #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))))))

(assert (=> d!61711 (and (bvsle #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6259 (_keys!6880 thiss!1504)) (size!6259 lt!128424)))))

(assert (=> d!61711 (= (arrayCountValidKeys!0 lt!128424 #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))) lt!128603)))

(declare-fun b!256126 () Bool)

(assert (=> b!256126 (= e!166017 e!166016)))

(declare-fun c!43283 () Bool)

(assert (=> b!256126 (= c!43283 (validKeyInArray!0 (select (arr!5912 lt!128424) #b00000000000000000000000000000000)))))

(declare-fun bm!24233 () Bool)

(assert (=> bm!24233 (= call!24236 (arrayCountValidKeys!0 lt!128424 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6259 (_keys!6880 thiss!1504))))))

(declare-fun b!256127 () Bool)

(assert (=> b!256127 (= e!166016 (bvadd #b00000000000000000000000000000001 call!24236))))

(assert (= (and d!61711 c!43282) b!256124))

(assert (= (and d!61711 (not c!43282)) b!256126))

(assert (= (and b!256126 c!43283) b!256127))

(assert (= (and b!256126 (not c!43283)) b!256125))

(assert (= (or b!256127 b!256125) bm!24233))

(assert (=> b!256126 m!271599))

(assert (=> b!256126 m!271599))

(assert (=> b!256126 m!271601))

(declare-fun m!271695 () Bool)

(assert (=> bm!24233 m!271695))

(assert (=> b!255866 d!61711))

(declare-fun d!61713 () Bool)

(declare-fun e!166020 () Bool)

(assert (=> d!61713 e!166020))

(declare-fun res!125316 () Bool)

(assert (=> d!61713 (=> (not res!125316) (not e!166020))))

(assert (=> d!61713 (= res!125316 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6259 (_keys!6880 thiss!1504)))))))

(declare-fun lt!128606 () Unit!7909)

(declare-fun choose!41 (array!12479 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3698) Unit!7909)

(assert (=> d!61713 (= lt!128606 (choose!41 (_keys!6880 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3695))))

(assert (=> d!61713 (bvslt (size!6259 (_keys!6880 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61713 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6880 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3695) lt!128606)))

(declare-fun b!256130 () Bool)

(assert (=> b!256130 (= e!166020 (arrayNoDuplicates!0 (array!12480 (store (arr!5912 (_keys!6880 thiss!1504)) index!297 key!932) (size!6259 (_keys!6880 thiss!1504))) #b00000000000000000000000000000000 Nil!3695))))

(assert (= (and d!61713 res!125316) b!256130))

(declare-fun m!271697 () Bool)

(assert (=> d!61713 m!271697))

(assert (=> b!256130 m!271461))

(declare-fun m!271699 () Bool)

(assert (=> b!256130 m!271699))

(assert (=> b!255866 d!61713))

(declare-fun d!61715 () Bool)

(declare-fun res!125321 () Bool)

(declare-fun e!166025 () Bool)

(assert (=> d!61715 (=> res!125321 e!166025)))

(assert (=> d!61715 (= res!125321 (= (select (arr!5912 (_keys!6880 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61715 (= (arrayContainsKey!0 (_keys!6880 thiss!1504) key!932 #b00000000000000000000000000000000) e!166025)))

(declare-fun b!256135 () Bool)

(declare-fun e!166026 () Bool)

(assert (=> b!256135 (= e!166025 e!166026)))

(declare-fun res!125322 () Bool)

(assert (=> b!256135 (=> (not res!125322) (not e!166026))))

(assert (=> b!256135 (= res!125322 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6259 (_keys!6880 thiss!1504))))))

(declare-fun b!256136 () Bool)

(assert (=> b!256136 (= e!166026 (arrayContainsKey!0 (_keys!6880 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61715 (not res!125321)) b!256135))

(assert (= (and b!256135 res!125322) b!256136))

(assert (=> d!61715 m!271607))

(declare-fun m!271701 () Bool)

(assert (=> b!256136 m!271701))

(assert (=> b!255866 d!61715))

(declare-fun d!61717 () Bool)

(declare-fun e!166029 () Bool)

(assert (=> d!61717 e!166029))

(declare-fun res!125325 () Bool)

(assert (=> d!61717 (=> (not res!125325) (not e!166029))))

(assert (=> d!61717 (= res!125325 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6259 (_keys!6880 thiss!1504)))))))

(declare-fun lt!128609 () Unit!7909)

(declare-fun choose!102 ((_ BitVec 64) array!12479 (_ BitVec 32) (_ BitVec 32)) Unit!7909)

(assert (=> d!61717 (= lt!128609 (choose!102 key!932 (_keys!6880 thiss!1504) index!297 (mask!10986 thiss!1504)))))

(assert (=> d!61717 (validMask!0 (mask!10986 thiss!1504))))

(assert (=> d!61717 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6880 thiss!1504) index!297 (mask!10986 thiss!1504)) lt!128609)))

(declare-fun b!256139 () Bool)

(assert (=> b!256139 (= e!166029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12480 (store (arr!5912 (_keys!6880 thiss!1504)) index!297 key!932) (size!6259 (_keys!6880 thiss!1504))) (mask!10986 thiss!1504)))))

(assert (= (and d!61717 res!125325) b!256139))

(declare-fun m!271703 () Bool)

(assert (=> d!61717 m!271703))

(assert (=> d!61717 m!271615))

(assert (=> b!256139 m!271461))

(declare-fun m!271705 () Bool)

(assert (=> b!256139 m!271705))

(assert (=> b!255866 d!61717))

(assert (=> bm!24189 d!61715))

(declare-fun d!61719 () Bool)

(assert (=> d!61719 (contains!1833 (getCurrentListMap!1414 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)) key!932)))

(declare-fun lt!128612 () Unit!7909)

(declare-fun choose!1232 (array!12479 array!12477 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) (_ BitVec 32) Int) Unit!7909)

(assert (=> d!61719 (= lt!128612 (choose!1232 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(assert (=> d!61719 (validMask!0 (mask!10986 thiss!1504))))

(assert (=> d!61719 (= (lemmaArrayContainsKeyThenInListMap!237 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)) lt!128612)))

(declare-fun bs!9086 () Bool)

(assert (= bs!9086 d!61719))

(assert (=> bs!9086 m!271439))

(assert (=> bs!9086 m!271439))

(declare-fun m!271707 () Bool)

(assert (=> bs!9086 m!271707))

(declare-fun m!271709 () Bool)

(assert (=> bs!9086 m!271709))

(assert (=> bs!9086 m!271615))

(assert (=> b!255878 d!61719))

(declare-fun b!256156 () Bool)

(declare-fun e!166041 () Bool)

(declare-fun call!24241 () Bool)

(assert (=> b!256156 (= e!166041 (not call!24241))))

(declare-fun b!256157 () Bool)

(declare-fun e!166038 () Bool)

(declare-fun lt!128617 () SeekEntryResult!1126)

(assert (=> b!256157 (= e!166038 ((_ is Undefined!1126) lt!128617))))

(declare-fun b!256158 () Bool)

(declare-fun e!166039 () Bool)

(assert (=> b!256158 (= e!166039 e!166038)))

(declare-fun c!43289 () Bool)

(assert (=> b!256158 (= c!43289 ((_ is MissingVacant!1126) lt!128617))))

(declare-fun b!256159 () Bool)

(assert (=> b!256159 (and (bvsge (index!6674 lt!128617) #b00000000000000000000000000000000) (bvslt (index!6674 lt!128617) (size!6259 (_keys!6880 thiss!1504))))))

(declare-fun res!125335 () Bool)

(assert (=> b!256159 (= res!125335 (= (select (arr!5912 (_keys!6880 thiss!1504)) (index!6674 lt!128617)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256159 (=> (not res!125335) (not e!166041))))

(declare-fun b!256160 () Bool)

(declare-fun res!125336 () Bool)

(declare-fun e!166040 () Bool)

(assert (=> b!256160 (=> (not res!125336) (not e!166040))))

(declare-fun call!24242 () Bool)

(assert (=> b!256160 (= res!125336 call!24242)))

(assert (=> b!256160 (= e!166038 e!166040)))

(declare-fun b!256161 () Bool)

(assert (=> b!256161 (= e!166040 (not call!24241))))

(declare-fun b!256162 () Bool)

(declare-fun res!125337 () Bool)

(assert (=> b!256162 (=> (not res!125337) (not e!166040))))

(assert (=> b!256162 (= res!125337 (= (select (arr!5912 (_keys!6880 thiss!1504)) (index!6677 lt!128617)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256162 (and (bvsge (index!6677 lt!128617) #b00000000000000000000000000000000) (bvslt (index!6677 lt!128617) (size!6259 (_keys!6880 thiss!1504))))))

(declare-fun d!61721 () Bool)

(assert (=> d!61721 e!166039))

(declare-fun c!43288 () Bool)

(assert (=> d!61721 (= c!43288 ((_ is MissingZero!1126) lt!128617))))

(assert (=> d!61721 (= lt!128617 (seekEntryOrOpen!0 key!932 (_keys!6880 thiss!1504) (mask!10986 thiss!1504)))))

(declare-fun lt!128618 () Unit!7909)

(declare-fun choose!1233 (array!12479 array!12477 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) Int) Unit!7909)

(assert (=> d!61721 (= lt!128618 (choose!1233 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)))))

(assert (=> d!61721 (validMask!0 (mask!10986 thiss!1504))))

(assert (=> d!61721 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!414 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)) lt!128618)))

(declare-fun bm!24238 () Bool)

(assert (=> bm!24238 (= call!24242 (inRange!0 (ite c!43288 (index!6674 lt!128617) (index!6677 lt!128617)) (mask!10986 thiss!1504)))))

(declare-fun bm!24239 () Bool)

(assert (=> bm!24239 (= call!24241 (arrayContainsKey!0 (_keys!6880 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256163 () Bool)

(assert (=> b!256163 (= e!166039 e!166041)))

(declare-fun res!125334 () Bool)

(assert (=> b!256163 (= res!125334 call!24242)))

(assert (=> b!256163 (=> (not res!125334) (not e!166041))))

(assert (= (and d!61721 c!43288) b!256163))

(assert (= (and d!61721 (not c!43288)) b!256158))

(assert (= (and b!256163 res!125334) b!256159))

(assert (= (and b!256159 res!125335) b!256156))

(assert (= (and b!256158 c!43289) b!256160))

(assert (= (and b!256158 (not c!43289)) b!256157))

(assert (= (and b!256160 res!125336) b!256162))

(assert (= (and b!256162 res!125337) b!256161))

(assert (= (or b!256163 b!256160) bm!24238))

(assert (= (or b!256156 b!256161) bm!24239))

(declare-fun m!271711 () Bool)

(assert (=> bm!24238 m!271711))

(declare-fun m!271713 () Bool)

(assert (=> b!256159 m!271713))

(declare-fun m!271715 () Bool)

(assert (=> b!256162 m!271715))

(assert (=> bm!24239 m!271429))

(assert (=> d!61721 m!271473))

(declare-fun m!271717 () Bool)

(assert (=> d!61721 m!271717))

(assert (=> d!61721 m!271615))

(assert (=> b!255864 d!61721))

(declare-fun d!61723 () Bool)

(declare-fun e!166044 () Bool)

(assert (=> d!61723 e!166044))

(declare-fun res!125342 () Bool)

(assert (=> d!61723 (=> (not res!125342) (not e!166044))))

(declare-fun lt!128624 () SeekEntryResult!1126)

(assert (=> d!61723 (= res!125342 ((_ is Found!1126) lt!128624))))

(assert (=> d!61723 (= lt!128624 (seekEntryOrOpen!0 key!932 (_keys!6880 thiss!1504) (mask!10986 thiss!1504)))))

(declare-fun lt!128623 () Unit!7909)

(declare-fun choose!1234 (array!12479 array!12477 (_ BitVec 32) (_ BitVec 32) V!8409 V!8409 (_ BitVec 64) Int) Unit!7909)

(assert (=> d!61723 (= lt!128623 (choose!1234 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)))))

(assert (=> d!61723 (validMask!0 (mask!10986 thiss!1504))))

(assert (=> d!61723 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!420 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) key!932 (defaultEntry!4720 thiss!1504)) lt!128623)))

(declare-fun b!256168 () Bool)

(declare-fun res!125343 () Bool)

(assert (=> b!256168 (=> (not res!125343) (not e!166044))))

(assert (=> b!256168 (= res!125343 (inRange!0 (index!6675 lt!128624) (mask!10986 thiss!1504)))))

(declare-fun b!256169 () Bool)

(assert (=> b!256169 (= e!166044 (= (select (arr!5912 (_keys!6880 thiss!1504)) (index!6675 lt!128624)) key!932))))

(assert (=> b!256169 (and (bvsge (index!6675 lt!128624) #b00000000000000000000000000000000) (bvslt (index!6675 lt!128624) (size!6259 (_keys!6880 thiss!1504))))))

(assert (= (and d!61723 res!125342) b!256168))

(assert (= (and b!256168 res!125343) b!256169))

(assert (=> d!61723 m!271473))

(declare-fun m!271719 () Bool)

(assert (=> d!61723 m!271719))

(assert (=> d!61723 m!271615))

(declare-fun m!271721 () Bool)

(assert (=> b!256168 m!271721))

(declare-fun m!271723 () Bool)

(assert (=> b!256169 m!271723))

(assert (=> b!255877 d!61723))

(declare-fun b!256182 () Bool)

(declare-fun e!166053 () SeekEntryResult!1126)

(declare-fun lt!128631 () SeekEntryResult!1126)

(assert (=> b!256182 (= e!166053 (Found!1126 (index!6676 lt!128631)))))

(declare-fun b!256183 () Bool)

(declare-fun e!166051 () SeekEntryResult!1126)

(assert (=> b!256183 (= e!166051 (MissingZero!1126 (index!6676 lt!128631)))))

(declare-fun b!256184 () Bool)

(declare-fun e!166052 () SeekEntryResult!1126)

(assert (=> b!256184 (= e!166052 Undefined!1126)))

(declare-fun b!256186 () Bool)

(declare-fun c!43296 () Bool)

(declare-fun lt!128633 () (_ BitVec 64))

(assert (=> b!256186 (= c!43296 (= lt!128633 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!256186 (= e!166053 e!166051)))

(declare-fun b!256187 () Bool)

(assert (=> b!256187 (= e!166052 e!166053)))

(assert (=> b!256187 (= lt!128633 (select (arr!5912 (_keys!6880 thiss!1504)) (index!6676 lt!128631)))))

(declare-fun c!43297 () Bool)

(assert (=> b!256187 (= c!43297 (= lt!128633 key!932))))

(declare-fun b!256185 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12479 (_ BitVec 32)) SeekEntryResult!1126)

(assert (=> b!256185 (= e!166051 (seekKeyOrZeroReturnVacant!0 (x!24904 lt!128631) (index!6676 lt!128631) (index!6676 lt!128631) key!932 (_keys!6880 thiss!1504) (mask!10986 thiss!1504)))))

(declare-fun d!61725 () Bool)

(declare-fun lt!128632 () SeekEntryResult!1126)

(assert (=> d!61725 (and (or ((_ is Undefined!1126) lt!128632) (not ((_ is Found!1126) lt!128632)) (and (bvsge (index!6675 lt!128632) #b00000000000000000000000000000000) (bvslt (index!6675 lt!128632) (size!6259 (_keys!6880 thiss!1504))))) (or ((_ is Undefined!1126) lt!128632) ((_ is Found!1126) lt!128632) (not ((_ is MissingZero!1126) lt!128632)) (and (bvsge (index!6674 lt!128632) #b00000000000000000000000000000000) (bvslt (index!6674 lt!128632) (size!6259 (_keys!6880 thiss!1504))))) (or ((_ is Undefined!1126) lt!128632) ((_ is Found!1126) lt!128632) ((_ is MissingZero!1126) lt!128632) (not ((_ is MissingVacant!1126) lt!128632)) (and (bvsge (index!6677 lt!128632) #b00000000000000000000000000000000) (bvslt (index!6677 lt!128632) (size!6259 (_keys!6880 thiss!1504))))) (or ((_ is Undefined!1126) lt!128632) (ite ((_ is Found!1126) lt!128632) (= (select (arr!5912 (_keys!6880 thiss!1504)) (index!6675 lt!128632)) key!932) (ite ((_ is MissingZero!1126) lt!128632) (= (select (arr!5912 (_keys!6880 thiss!1504)) (index!6674 lt!128632)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1126) lt!128632) (= (select (arr!5912 (_keys!6880 thiss!1504)) (index!6677 lt!128632)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61725 (= lt!128632 e!166052)))

(declare-fun c!43298 () Bool)

(assert (=> d!61725 (= c!43298 (and ((_ is Intermediate!1126) lt!128631) (undefined!1938 lt!128631)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12479 (_ BitVec 32)) SeekEntryResult!1126)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61725 (= lt!128631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10986 thiss!1504)) key!932 (_keys!6880 thiss!1504) (mask!10986 thiss!1504)))))

(assert (=> d!61725 (validMask!0 (mask!10986 thiss!1504))))

(assert (=> d!61725 (= (seekEntryOrOpen!0 key!932 (_keys!6880 thiss!1504) (mask!10986 thiss!1504)) lt!128632)))

(assert (= (and d!61725 c!43298) b!256184))

(assert (= (and d!61725 (not c!43298)) b!256187))

(assert (= (and b!256187 c!43297) b!256182))

(assert (= (and b!256187 (not c!43297)) b!256186))

(assert (= (and b!256186 c!43296) b!256183))

(assert (= (and b!256186 (not c!43296)) b!256185))

(declare-fun m!271725 () Bool)

(assert (=> b!256187 m!271725))

(declare-fun m!271727 () Bool)

(assert (=> b!256185 m!271727))

(declare-fun m!271729 () Bool)

(assert (=> d!61725 m!271729))

(declare-fun m!271731 () Bool)

(assert (=> d!61725 m!271731))

(assert (=> d!61725 m!271729))

(declare-fun m!271733 () Bool)

(assert (=> d!61725 m!271733))

(declare-fun m!271735 () Bool)

(assert (=> d!61725 m!271735))

(declare-fun m!271737 () Bool)

(assert (=> d!61725 m!271737))

(assert (=> d!61725 m!271615))

(assert (=> b!255860 d!61725))

(declare-fun d!61727 () Bool)

(assert (=> d!61727 (= (inRange!0 index!297 (mask!10986 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10986 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!255862 d!61727))

(declare-fun d!61729 () Bool)

(declare-fun e!166058 () Bool)

(assert (=> d!61729 e!166058))

(declare-fun res!125346 () Bool)

(assert (=> d!61729 (=> res!125346 e!166058)))

(declare-fun lt!128642 () Bool)

(assert (=> d!61729 (= res!125346 (not lt!128642))))

(declare-fun lt!128643 () Bool)

(assert (=> d!61729 (= lt!128642 lt!128643)))

(declare-fun lt!128645 () Unit!7909)

(declare-fun e!166059 () Unit!7909)

(assert (=> d!61729 (= lt!128645 e!166059)))

(declare-fun c!43301 () Bool)

(assert (=> d!61729 (= c!43301 lt!128643)))

(declare-fun containsKey!300 (List!3697 (_ BitVec 64)) Bool)

(assert (=> d!61729 (= lt!128643 (containsKey!300 (toList!1882 lt!128430) key!932))))

(assert (=> d!61729 (= (contains!1833 lt!128430 key!932) lt!128642)))

(declare-fun b!256194 () Bool)

(declare-fun lt!128644 () Unit!7909)

(assert (=> b!256194 (= e!166059 lt!128644)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!248 (List!3697 (_ BitVec 64)) Unit!7909)

(assert (=> b!256194 (= lt!128644 (lemmaContainsKeyImpliesGetValueByKeyDefined!248 (toList!1882 lt!128430) key!932))))

(declare-fun isDefined!249 (Option!315) Bool)

(assert (=> b!256194 (isDefined!249 (getValueByKey!309 (toList!1882 lt!128430) key!932))))

(declare-fun b!256195 () Bool)

(declare-fun Unit!7920 () Unit!7909)

(assert (=> b!256195 (= e!166059 Unit!7920)))

(declare-fun b!256196 () Bool)

(assert (=> b!256196 (= e!166058 (isDefined!249 (getValueByKey!309 (toList!1882 lt!128430) key!932)))))

(assert (= (and d!61729 c!43301) b!256194))

(assert (= (and d!61729 (not c!43301)) b!256195))

(assert (= (and d!61729 (not res!125346)) b!256196))

(declare-fun m!271739 () Bool)

(assert (=> d!61729 m!271739))

(declare-fun m!271741 () Bool)

(assert (=> b!256194 m!271741))

(declare-fun m!271743 () Bool)

(assert (=> b!256194 m!271743))

(assert (=> b!256194 m!271743))

(declare-fun m!271745 () Bool)

(assert (=> b!256194 m!271745))

(assert (=> b!256196 m!271743))

(assert (=> b!256196 m!271743))

(assert (=> b!256196 m!271745))

(assert (=> b!255862 d!61729))

(declare-fun b!256197 () Bool)

(declare-fun e!166062 () ListLongMap!3733)

(declare-fun call!24247 () ListLongMap!3733)

(assert (=> b!256197 (= e!166062 call!24247)))

(declare-fun b!256198 () Bool)

(declare-fun res!125355 () Bool)

(declare-fun e!166068 () Bool)

(assert (=> b!256198 (=> (not res!125355) (not e!166068))))

(declare-fun e!166061 () Bool)

(assert (=> b!256198 (= res!125355 e!166061)))

(declare-fun res!125351 () Bool)

(assert (=> b!256198 (=> res!125351 e!166061)))

(declare-fun e!166064 () Bool)

(assert (=> b!256198 (= res!125351 (not e!166064))))

(declare-fun res!125352 () Bool)

(assert (=> b!256198 (=> (not res!125352) (not e!166064))))

(assert (=> b!256198 (= res!125352 (bvslt #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))))))

(declare-fun b!256199 () Bool)

(declare-fun e!166067 () Bool)

(assert (=> b!256199 (= e!166068 e!166067)))

(declare-fun c!43306 () Bool)

(assert (=> b!256199 (= c!43306 (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256200 () Bool)

(declare-fun e!166065 () Unit!7909)

(declare-fun Unit!7921 () Unit!7909)

(assert (=> b!256200 (= e!166065 Unit!7921)))

(declare-fun bm!24240 () Bool)

(declare-fun call!24245 () ListLongMap!3733)

(assert (=> bm!24240 (= call!24247 call!24245)))

(declare-fun d!61731 () Bool)

(assert (=> d!61731 e!166068))

(declare-fun res!125353 () Bool)

(assert (=> d!61731 (=> (not res!125353) (not e!166068))))

(assert (=> d!61731 (= res!125353 (or (bvsge #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))))))))

(declare-fun lt!128653 () ListLongMap!3733)

(declare-fun lt!128665 () ListLongMap!3733)

(assert (=> d!61731 (= lt!128653 lt!128665)))

(declare-fun lt!128649 () Unit!7909)

(assert (=> d!61731 (= lt!128649 e!166065)))

(declare-fun c!43303 () Bool)

(declare-fun e!166070 () Bool)

(assert (=> d!61731 (= c!43303 e!166070)))

(declare-fun res!125350 () Bool)

(assert (=> d!61731 (=> (not res!125350) (not e!166070))))

(assert (=> d!61731 (= res!125350 (bvslt #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))))))

(declare-fun e!166072 () ListLongMap!3733)

(assert (=> d!61731 (= lt!128665 e!166072)))

(declare-fun c!43302 () Bool)

(assert (=> d!61731 (= c!43302 (and (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61731 (validMask!0 (mask!10986 thiss!1504))))

(assert (=> d!61731 (= (getCurrentListMap!1414 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)) lt!128653)))

(declare-fun b!256201 () Bool)

(assert (=> b!256201 (= e!166064 (validKeyInArray!0 (select (arr!5912 (_keys!6880 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256202 () Bool)

(declare-fun c!43304 () Bool)

(assert (=> b!256202 (= c!43304 (and (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!166069 () ListLongMap!3733)

(assert (=> b!256202 (= e!166069 e!166062)))

(declare-fun b!256203 () Bool)

(declare-fun e!166060 () Bool)

(assert (=> b!256203 (= e!166060 (= (apply!250 lt!128653 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4561 thiss!1504)))))

(declare-fun b!256204 () Bool)

(declare-fun e!166063 () Bool)

(assert (=> b!256204 (= e!166063 (= (apply!250 lt!128653 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4561 thiss!1504)))))

(declare-fun b!256205 () Bool)

(declare-fun e!166071 () Bool)

(declare-fun call!24246 () Bool)

(assert (=> b!256205 (= e!166071 (not call!24246))))

(declare-fun b!256206 () Bool)

(declare-fun e!166066 () Bool)

(assert (=> b!256206 (= e!166066 (= (apply!250 lt!128653 (select (arr!5912 (_keys!6880 thiss!1504)) #b00000000000000000000000000000000)) (get!3047 (select (arr!5911 (_values!4703 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!593 (defaultEntry!4720 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!256206 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6258 (_values!4703 thiss!1504))))))

(assert (=> b!256206 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))))))

(declare-fun b!256207 () Bool)

(declare-fun lt!128663 () Unit!7909)

(assert (=> b!256207 (= e!166065 lt!128663)))

(declare-fun lt!128660 () ListLongMap!3733)

(assert (=> b!256207 (= lt!128660 (getCurrentListMapNoExtraKeys!566 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128658 () (_ BitVec 64))

(assert (=> b!256207 (= lt!128658 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128659 () (_ BitVec 64))

(assert (=> b!256207 (= lt!128659 (select (arr!5912 (_keys!6880 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128662 () Unit!7909)

(assert (=> b!256207 (= lt!128662 (addStillContains!226 lt!128660 lt!128658 (zeroValue!4561 thiss!1504) lt!128659))))

(assert (=> b!256207 (contains!1833 (+!680 lt!128660 (tuple2!4819 lt!128658 (zeroValue!4561 thiss!1504))) lt!128659)))

(declare-fun lt!128646 () Unit!7909)

(assert (=> b!256207 (= lt!128646 lt!128662)))

(declare-fun lt!128650 () ListLongMap!3733)

(assert (=> b!256207 (= lt!128650 (getCurrentListMapNoExtraKeys!566 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128654 () (_ BitVec 64))

(assert (=> b!256207 (= lt!128654 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128648 () (_ BitVec 64))

(assert (=> b!256207 (= lt!128648 (select (arr!5912 (_keys!6880 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128661 () Unit!7909)

(assert (=> b!256207 (= lt!128661 (addApplyDifferent!226 lt!128650 lt!128654 (minValue!4561 thiss!1504) lt!128648))))

(assert (=> b!256207 (= (apply!250 (+!680 lt!128650 (tuple2!4819 lt!128654 (minValue!4561 thiss!1504))) lt!128648) (apply!250 lt!128650 lt!128648))))

(declare-fun lt!128666 () Unit!7909)

(assert (=> b!256207 (= lt!128666 lt!128661)))

(declare-fun lt!128657 () ListLongMap!3733)

(assert (=> b!256207 (= lt!128657 (getCurrentListMapNoExtraKeys!566 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128667 () (_ BitVec 64))

(assert (=> b!256207 (= lt!128667 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128655 () (_ BitVec 64))

(assert (=> b!256207 (= lt!128655 (select (arr!5912 (_keys!6880 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!128651 () Unit!7909)

(assert (=> b!256207 (= lt!128651 (addApplyDifferent!226 lt!128657 lt!128667 (zeroValue!4561 thiss!1504) lt!128655))))

(assert (=> b!256207 (= (apply!250 (+!680 lt!128657 (tuple2!4819 lt!128667 (zeroValue!4561 thiss!1504))) lt!128655) (apply!250 lt!128657 lt!128655))))

(declare-fun lt!128656 () Unit!7909)

(assert (=> b!256207 (= lt!128656 lt!128651)))

(declare-fun lt!128647 () ListLongMap!3733)

(assert (=> b!256207 (= lt!128647 (getCurrentListMapNoExtraKeys!566 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun lt!128652 () (_ BitVec 64))

(assert (=> b!256207 (= lt!128652 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!128664 () (_ BitVec 64))

(assert (=> b!256207 (= lt!128664 (select (arr!5912 (_keys!6880 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!256207 (= lt!128663 (addApplyDifferent!226 lt!128647 lt!128652 (minValue!4561 thiss!1504) lt!128664))))

(assert (=> b!256207 (= (apply!250 (+!680 lt!128647 (tuple2!4819 lt!128652 (minValue!4561 thiss!1504))) lt!128664) (apply!250 lt!128647 lt!128664))))

(declare-fun b!256208 () Bool)

(assert (=> b!256208 (= e!166071 e!166060)))

(declare-fun res!125349 () Bool)

(assert (=> b!256208 (= res!125349 call!24246)))

(assert (=> b!256208 (=> (not res!125349) (not e!166060))))

(declare-fun b!256209 () Bool)

(declare-fun call!24244 () Bool)

(assert (=> b!256209 (= e!166067 (not call!24244))))

(declare-fun b!256210 () Bool)

(declare-fun call!24243 () ListLongMap!3733)

(assert (=> b!256210 (= e!166062 call!24243)))

(declare-fun b!256211 () Bool)

(assert (=> b!256211 (= e!166072 e!166069)))

(declare-fun c!43307 () Bool)

(assert (=> b!256211 (= c!43307 (and (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!256212 () Bool)

(assert (=> b!256212 (= e!166067 e!166063)))

(declare-fun res!125354 () Bool)

(assert (=> b!256212 (= res!125354 call!24244)))

(assert (=> b!256212 (=> (not res!125354) (not e!166063))))

(declare-fun b!256213 () Bool)

(declare-fun res!125347 () Bool)

(assert (=> b!256213 (=> (not res!125347) (not e!166068))))

(assert (=> b!256213 (= res!125347 e!166071)))

(declare-fun c!43305 () Bool)

(assert (=> b!256213 (= c!43305 (not (= (bvand (extraKeys!4457 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!24241 () Bool)

(declare-fun call!24248 () ListLongMap!3733)

(declare-fun call!24249 () ListLongMap!3733)

(assert (=> bm!24241 (= call!24249 (+!680 (ite c!43302 call!24248 (ite c!43307 call!24245 call!24247)) (ite (or c!43302 c!43307) (tuple2!4819 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4561 thiss!1504)) (tuple2!4819 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4561 thiss!1504)))))))

(declare-fun b!256214 () Bool)

(assert (=> b!256214 (= e!166069 call!24243)))

(declare-fun bm!24242 () Bool)

(assert (=> bm!24242 (= call!24245 call!24248)))

(declare-fun bm!24243 () Bool)

(assert (=> bm!24243 (= call!24246 (contains!1833 lt!128653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256215 () Bool)

(assert (=> b!256215 (= e!166072 (+!680 call!24249 (tuple2!4819 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4561 thiss!1504))))))

(declare-fun bm!24244 () Bool)

(assert (=> bm!24244 (= call!24244 (contains!1833 lt!128653 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24245 () Bool)

(assert (=> bm!24245 (= call!24243 call!24249)))

(declare-fun bm!24246 () Bool)

(assert (=> bm!24246 (= call!24248 (getCurrentListMapNoExtraKeys!566 (_keys!6880 thiss!1504) (_values!4703 thiss!1504) (mask!10986 thiss!1504) (extraKeys!4457 thiss!1504) (zeroValue!4561 thiss!1504) (minValue!4561 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4720 thiss!1504)))))

(declare-fun b!256216 () Bool)

(assert (=> b!256216 (= e!166070 (validKeyInArray!0 (select (arr!5912 (_keys!6880 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!256217 () Bool)

(assert (=> b!256217 (= e!166061 e!166066)))

(declare-fun res!125348 () Bool)

(assert (=> b!256217 (=> (not res!125348) (not e!166066))))

(assert (=> b!256217 (= res!125348 (contains!1833 lt!128653 (select (arr!5912 (_keys!6880 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!256217 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))))))

(assert (= (and d!61731 c!43302) b!256215))

(assert (= (and d!61731 (not c!43302)) b!256211))

(assert (= (and b!256211 c!43307) b!256214))

(assert (= (and b!256211 (not c!43307)) b!256202))

(assert (= (and b!256202 c!43304) b!256210))

(assert (= (and b!256202 (not c!43304)) b!256197))

(assert (= (or b!256210 b!256197) bm!24240))

(assert (= (or b!256214 bm!24240) bm!24242))

(assert (= (or b!256214 b!256210) bm!24245))

(assert (= (or b!256215 bm!24242) bm!24246))

(assert (= (or b!256215 bm!24245) bm!24241))

(assert (= (and d!61731 res!125350) b!256216))

(assert (= (and d!61731 c!43303) b!256207))

(assert (= (and d!61731 (not c!43303)) b!256200))

(assert (= (and d!61731 res!125353) b!256198))

(assert (= (and b!256198 res!125352) b!256201))

(assert (= (and b!256198 (not res!125351)) b!256217))

(assert (= (and b!256217 res!125348) b!256206))

(assert (= (and b!256198 res!125355) b!256213))

(assert (= (and b!256213 c!43305) b!256208))

(assert (= (and b!256213 (not c!43305)) b!256205))

(assert (= (and b!256208 res!125349) b!256203))

(assert (= (or b!256208 b!256205) bm!24243))

(assert (= (and b!256213 res!125347) b!256199))

(assert (= (and b!256199 c!43306) b!256212))

(assert (= (and b!256199 (not c!43306)) b!256209))

(assert (= (and b!256212 res!125354) b!256204))

(assert (= (or b!256212 b!256209) bm!24244))

(declare-fun b_lambda!8179 () Bool)

(assert (=> (not b_lambda!8179) (not b!256206)))

(assert (=> b!256206 t!8747))

(declare-fun b_and!13785 () Bool)

(assert (= b_and!13783 (and (=> t!8747 result!5353) b_and!13785)))

(declare-fun m!271747 () Bool)

(assert (=> bm!24241 m!271747))

(declare-fun m!271749 () Bool)

(assert (=> bm!24246 m!271749))

(declare-fun m!271751 () Bool)

(assert (=> b!256206 m!271751))

(assert (=> b!256206 m!271647))

(declare-fun m!271753 () Bool)

(assert (=> b!256206 m!271753))

(assert (=> b!256206 m!271607))

(assert (=> b!256206 m!271607))

(declare-fun m!271755 () Bool)

(assert (=> b!256206 m!271755))

(assert (=> b!256206 m!271647))

(assert (=> b!256206 m!271751))

(declare-fun m!271757 () Bool)

(assert (=> b!256204 m!271757))

(assert (=> b!256216 m!271607))

(assert (=> b!256216 m!271607))

(assert (=> b!256216 m!271609))

(declare-fun m!271759 () Bool)

(assert (=> b!256207 m!271759))

(declare-fun m!271761 () Bool)

(assert (=> b!256207 m!271761))

(declare-fun m!271763 () Bool)

(assert (=> b!256207 m!271763))

(declare-fun m!271765 () Bool)

(assert (=> b!256207 m!271765))

(declare-fun m!271767 () Bool)

(assert (=> b!256207 m!271767))

(declare-fun m!271769 () Bool)

(assert (=> b!256207 m!271769))

(assert (=> b!256207 m!271759))

(declare-fun m!271771 () Bool)

(assert (=> b!256207 m!271771))

(declare-fun m!271773 () Bool)

(assert (=> b!256207 m!271773))

(assert (=> b!256207 m!271767))

(declare-fun m!271775 () Bool)

(assert (=> b!256207 m!271775))

(declare-fun m!271777 () Bool)

(assert (=> b!256207 m!271777))

(declare-fun m!271779 () Bool)

(assert (=> b!256207 m!271779))

(declare-fun m!271781 () Bool)

(assert (=> b!256207 m!271781))

(assert (=> b!256207 m!271749))

(declare-fun m!271783 () Bool)

(assert (=> b!256207 m!271783))

(assert (=> b!256207 m!271775))

(declare-fun m!271785 () Bool)

(assert (=> b!256207 m!271785))

(assert (=> b!256207 m!271607))

(assert (=> b!256207 m!271763))

(declare-fun m!271787 () Bool)

(assert (=> b!256207 m!271787))

(assert (=> b!256201 m!271607))

(assert (=> b!256201 m!271607))

(assert (=> b!256201 m!271609))

(assert (=> b!256217 m!271607))

(assert (=> b!256217 m!271607))

(declare-fun m!271789 () Bool)

(assert (=> b!256217 m!271789))

(assert (=> d!61731 m!271615))

(declare-fun m!271791 () Bool)

(assert (=> b!256215 m!271791))

(declare-fun m!271793 () Bool)

(assert (=> bm!24243 m!271793))

(declare-fun m!271795 () Bool)

(assert (=> bm!24244 m!271795))

(declare-fun m!271797 () Bool)

(assert (=> b!256203 m!271797))

(assert (=> b!255862 d!61731))

(declare-fun d!61733 () Bool)

(assert (=> d!61733 (= (inRange!0 (ite c!43226 (index!6674 lt!128425) (index!6677 lt!128425)) (mask!10986 thiss!1504)) (and (bvsge (ite c!43226 (index!6674 lt!128425) (index!6677 lt!128425)) #b00000000000000000000000000000000) (bvslt (ite c!43226 (index!6674 lt!128425) (index!6677 lt!128425)) (bvadd (mask!10986 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24190 d!61733))

(declare-fun d!61735 () Bool)

(assert (=> d!61735 (= (array_inv!3889 (_keys!6880 thiss!1504)) (bvsge (size!6259 (_keys!6880 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255874 d!61735))

(declare-fun d!61737 () Bool)

(assert (=> d!61737 (= (array_inv!3890 (_values!4703 thiss!1504)) (bvsge (size!6258 (_values!4703 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!255874 d!61737))

(declare-fun d!61739 () Bool)

(declare-fun res!125362 () Bool)

(declare-fun e!166075 () Bool)

(assert (=> d!61739 (=> (not res!125362) (not e!166075))))

(declare-fun simpleValid!273 (LongMapFixedSize!3784) Bool)

(assert (=> d!61739 (= res!125362 (simpleValid!273 thiss!1504))))

(assert (=> d!61739 (= (valid!1486 thiss!1504) e!166075)))

(declare-fun b!256224 () Bool)

(declare-fun res!125363 () Bool)

(assert (=> b!256224 (=> (not res!125363) (not e!166075))))

(assert (=> b!256224 (= res!125363 (= (arrayCountValidKeys!0 (_keys!6880 thiss!1504) #b00000000000000000000000000000000 (size!6259 (_keys!6880 thiss!1504))) (_size!1941 thiss!1504)))))

(declare-fun b!256225 () Bool)

(declare-fun res!125364 () Bool)

(assert (=> b!256225 (=> (not res!125364) (not e!166075))))

(assert (=> b!256225 (= res!125364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6880 thiss!1504) (mask!10986 thiss!1504)))))

(declare-fun b!256226 () Bool)

(assert (=> b!256226 (= e!166075 (arrayNoDuplicates!0 (_keys!6880 thiss!1504) #b00000000000000000000000000000000 Nil!3695))))

(assert (= (and d!61739 res!125362) b!256224))

(assert (= (and b!256224 res!125363) b!256225))

(assert (= (and b!256225 res!125364) b!256226))

(declare-fun m!271799 () Bool)

(assert (=> d!61739 m!271799))

(assert (=> b!256224 m!271463))

(declare-fun m!271801 () Bool)

(assert (=> b!256225 m!271801))

(declare-fun m!271803 () Bool)

(assert (=> b!256226 m!271803))

(assert (=> start!24426 d!61739))

(declare-fun condMapEmpty!11190 () Bool)

(declare-fun mapDefault!11190 () ValueCell!2942)

(assert (=> mapNonEmpty!11181 (= condMapEmpty!11190 (= mapRest!11181 ((as const (Array (_ BitVec 32) ValueCell!2942)) mapDefault!11190)))))

(declare-fun e!166081 () Bool)

(declare-fun mapRes!11190 () Bool)

(assert (=> mapNonEmpty!11181 (= tp!23423 (and e!166081 mapRes!11190))))

(declare-fun mapIsEmpty!11190 () Bool)

(assert (=> mapIsEmpty!11190 mapRes!11190))

(declare-fun b!256234 () Bool)

(assert (=> b!256234 (= e!166081 tp_is_empty!6571)))

(declare-fun b!256233 () Bool)

(declare-fun e!166080 () Bool)

(assert (=> b!256233 (= e!166080 tp_is_empty!6571)))

(declare-fun mapNonEmpty!11190 () Bool)

(declare-fun tp!23439 () Bool)

(assert (=> mapNonEmpty!11190 (= mapRes!11190 (and tp!23439 e!166080))))

(declare-fun mapRest!11190 () (Array (_ BitVec 32) ValueCell!2942))

(declare-fun mapValue!11190 () ValueCell!2942)

(declare-fun mapKey!11190 () (_ BitVec 32))

(assert (=> mapNonEmpty!11190 (= mapRest!11181 (store mapRest!11190 mapKey!11190 mapValue!11190))))

(assert (= (and mapNonEmpty!11181 condMapEmpty!11190) mapIsEmpty!11190))

(assert (= (and mapNonEmpty!11181 (not condMapEmpty!11190)) mapNonEmpty!11190))

(assert (= (and mapNonEmpty!11190 ((_ is ValueCellFull!2942) mapValue!11190)) b!256233))

(assert (= (and mapNonEmpty!11181 ((_ is ValueCellFull!2942) mapDefault!11190)) b!256234))

(declare-fun m!271805 () Bool)

(assert (=> mapNonEmpty!11190 m!271805))

(declare-fun b_lambda!8181 () Bool)

(assert (= b_lambda!8179 (or (and b!255874 b_free!6709) b_lambda!8181)))

(declare-fun b_lambda!8183 () Bool)

(assert (= b_lambda!8177 (or (and b!255874 b_free!6709) b_lambda!8183)))

(check-sat (not bm!24211) (not b!256203) (not b!256045) (not b!256225) (not bm!24238) (not d!61723) (not d!61731) (not bm!24243) (not b!256040) (not b!256008) (not bm!24239) (not b!256010) (not b!256121) (not b!256201) (not b!256217) (not b!256105) (not b_lambda!8183) (not bm!24233) (not b!256226) (not d!61705) (not b!256168) (not d!61719) (not b!256025) (not b_lambda!8181) (not b_next!6709) (not bm!24241) (not b!256021) (not b!256057) (not b!256194) (not b!256196) (not b!256119) (not b!256216) (not b!256207) (not d!61729) (not b!256007) (not bm!24246) (not b!256120) b_and!13785 (not bm!24229) (not bm!24232) (not d!61703) tp_is_empty!6571 (not d!61717) (not b!256130) (not d!61713) (not b!256215) (not d!61709) (not b!256046) (not d!61739) (not b!256111) (not d!61721) (not b!256126) (not b!256136) (not b!256108) (not b!256107) (not bm!24208) (not bm!24230) (not b!256139) (not bm!24205) (not b!256185) (not b!256206) (not b!256204) (not d!61697) (not b!256055) (not mapNonEmpty!11190) (not bm!24227) (not b!256224) (not d!61725) (not b!256036) (not b!256110) (not bm!24244) (not b!256024))
(check-sat b_and!13785 (not b_next!6709))
