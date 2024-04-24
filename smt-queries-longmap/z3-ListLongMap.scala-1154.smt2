; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24276 () Bool)

(assert start!24276)

(declare-fun b!253987 () Bool)

(declare-fun b_free!6673 () Bool)

(declare-fun b_next!6673 () Bool)

(assert (=> b!253987 (= b_free!6673 (not b_next!6673))))

(declare-fun tp!23306 () Bool)

(declare-fun b_and!13729 () Bool)

(assert (=> b!253987 (= tp!23306 b_and!13729)))

(declare-fun b!253976 () Bool)

(declare-fun e!164631 () Bool)

(declare-fun e!164640 () Bool)

(assert (=> b!253976 (= e!164631 (not e!164640))))

(declare-fun res!124335 () Bool)

(assert (=> b!253976 (=> res!124335 e!164640)))

(declare-datatypes ((V!8361 0))(
  ( (V!8362 (val!3312 Int)) )
))
(declare-datatypes ((ValueCell!2924 0))(
  ( (ValueCellFull!2924 (v!5387 V!8361)) (EmptyCell!2924) )
))
(declare-datatypes ((array!12399 0))(
  ( (array!12400 (arr!5875 (Array (_ BitVec 32) ValueCell!2924)) (size!6222 (_ BitVec 32))) )
))
(declare-datatypes ((array!12401 0))(
  ( (array!12402 (arr!5876 (Array (_ BitVec 32) (_ BitVec 64))) (size!6223 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3748 0))(
  ( (LongMapFixedSize!3749 (defaultEntry!4687 Int) (mask!10929 (_ BitVec 32)) (extraKeys!4424 (_ BitVec 32)) (zeroValue!4528 V!8361) (minValue!4528 V!8361) (_size!1923 (_ BitVec 32)) (_keys!6841 array!12401) (_values!4670 array!12399) (_vacant!1923 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3748)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!253976 (= res!124335 (not (validMask!0 (mask!10929 thiss!1504))))))

(declare-fun lt!127321 () array!12401)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12401 (_ BitVec 32)) Bool)

(assert (=> b!253976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127321 (mask!10929 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((Unit!7833 0))(
  ( (Unit!7834) )
))
(declare-fun lt!127317 () Unit!7833)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12401 (_ BitVec 32) (_ BitVec 32)) Unit!7833)

(assert (=> b!253976 (= lt!127317 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6841 thiss!1504) index!297 (mask!10929 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12401 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!253976 (= (arrayCountValidKeys!0 lt!127321 #b00000000000000000000000000000000 (size!6223 (_keys!6841 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6841 thiss!1504) #b00000000000000000000000000000000 (size!6223 (_keys!6841 thiss!1504)))))))

(declare-fun lt!127322 () Unit!7833)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12401 (_ BitVec 32) (_ BitVec 64)) Unit!7833)

(assert (=> b!253976 (= lt!127322 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6841 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3672 0))(
  ( (Nil!3669) (Cons!3668 (h!4330 (_ BitVec 64)) (t!8711 List!3672)) )
))
(declare-fun arrayNoDuplicates!0 (array!12401 (_ BitVec 32) List!3672) Bool)

(assert (=> b!253976 (arrayNoDuplicates!0 lt!127321 #b00000000000000000000000000000000 Nil!3669)))

(assert (=> b!253976 (= lt!127321 (array!12402 (store (arr!5876 (_keys!6841 thiss!1504)) index!297 key!932) (size!6223 (_keys!6841 thiss!1504))))))

(declare-fun lt!127325 () Unit!7833)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12401 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3672) Unit!7833)

(assert (=> b!253976 (= lt!127325 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6841 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3669))))

(declare-fun lt!127326 () Unit!7833)

(declare-fun e!164636 () Unit!7833)

(assert (=> b!253976 (= lt!127326 e!164636)))

(declare-fun c!42842 () Bool)

(declare-fun lt!127320 () Bool)

(assert (=> b!253976 (= c!42842 lt!127320)))

(declare-fun arrayContainsKey!0 (array!12401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!253976 (= lt!127320 (arrayContainsKey!0 (_keys!6841 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253977 () Bool)

(declare-fun e!164639 () Bool)

(assert (=> b!253977 (= e!164639 e!164631)))

(declare-fun res!124330 () Bool)

(assert (=> b!253977 (=> (not res!124330) (not e!164631))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!253977 (= res!124330 (inRange!0 index!297 (mask!10929 thiss!1504)))))

(declare-fun lt!127324 () Unit!7833)

(declare-fun e!164629 () Unit!7833)

(assert (=> b!253977 (= lt!127324 e!164629)))

(declare-fun c!42840 () Bool)

(declare-datatypes ((tuple2!4792 0))(
  ( (tuple2!4793 (_1!2407 (_ BitVec 64)) (_2!2407 V!8361)) )
))
(declare-datatypes ((List!3673 0))(
  ( (Nil!3670) (Cons!3669 (h!4331 tuple2!4792) (t!8712 List!3673)) )
))
(declare-datatypes ((ListLongMap!3707 0))(
  ( (ListLongMap!3708 (toList!1869 List!3673)) )
))
(declare-fun contains!1815 (ListLongMap!3707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1401 (array!12401 array!12399 (_ BitVec 32) (_ BitVec 32) V!8361 V!8361 (_ BitVec 32) Int) ListLongMap!3707)

(assert (=> b!253977 (= c!42840 (contains!1815 (getCurrentListMap!1401 (_keys!6841 thiss!1504) (_values!4670 thiss!1504) (mask!10929 thiss!1504) (extraKeys!4424 thiss!1504) (zeroValue!4528 thiss!1504) (minValue!4528 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4687 thiss!1504)) key!932))))

(declare-fun b!253978 () Bool)

(declare-fun c!42841 () Bool)

(declare-datatypes ((SeekEntryResult!1108 0))(
  ( (MissingZero!1108 (index!6602 (_ BitVec 32))) (Found!1108 (index!6603 (_ BitVec 32))) (Intermediate!1108 (undefined!1920 Bool) (index!6604 (_ BitVec 32)) (x!24808 (_ BitVec 32))) (Undefined!1108) (MissingVacant!1108 (index!6605 (_ BitVec 32))) )
))
(declare-fun lt!127318 () SeekEntryResult!1108)

(get-info :version)

(assert (=> b!253978 (= c!42841 ((_ is MissingVacant!1108) lt!127318))))

(declare-fun e!164632 () Bool)

(declare-fun e!164633 () Bool)

(assert (=> b!253978 (= e!164632 e!164633)))

(declare-fun b!253979 () Bool)

(declare-fun e!164634 () Bool)

(declare-fun tp_is_empty!6535 () Bool)

(assert (=> b!253979 (= e!164634 tp_is_empty!6535)))

(declare-fun bm!23949 () Bool)

(declare-fun call!23953 () Bool)

(declare-fun c!42843 () Bool)

(assert (=> bm!23949 (= call!23953 (inRange!0 (ite c!42843 (index!6602 lt!127318) (index!6605 lt!127318)) (mask!10929 thiss!1504)))))

(declare-fun bm!23950 () Bool)

(declare-fun call!23952 () Bool)

(assert (=> bm!23950 (= call!23952 (arrayContainsKey!0 (_keys!6841 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253980 () Bool)

(declare-fun res!124338 () Bool)

(assert (=> b!253980 (=> res!124338 e!164640)))

(assert (=> b!253980 (= res!124338 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6223 (_keys!6841 thiss!1504)))))))

(declare-fun b!253981 () Bool)

(declare-fun e!164630 () Bool)

(assert (=> b!253981 (= e!164630 tp_is_empty!6535)))

(declare-fun b!253982 () Bool)

(assert (=> b!253982 (= e!164640 (or (and (not (= (select (arr!5876 (_keys!6841 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5876 (_keys!6841 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000))) (not lt!127320)))))

(declare-fun b!253983 () Bool)

(declare-fun res!124327 () Bool)

(declare-fun e!164628 () Bool)

(assert (=> b!253983 (=> (not res!124327) (not e!164628))))

(assert (=> b!253983 (= res!124327 call!23953)))

(assert (=> b!253983 (= e!164632 e!164628)))

(declare-fun b!253984 () Bool)

(declare-fun Unit!7835 () Unit!7833)

(assert (=> b!253984 (= e!164636 Unit!7835)))

(declare-fun b!253985 () Bool)

(declare-fun e!164635 () Bool)

(assert (=> b!253985 (= e!164635 (not call!23952))))

(declare-fun mapIsEmpty!11118 () Bool)

(declare-fun mapRes!11118 () Bool)

(assert (=> mapIsEmpty!11118 mapRes!11118))

(declare-fun b!253986 () Bool)

(assert (=> b!253986 (= e!164633 ((_ is Undefined!1108) lt!127318))))

(declare-fun res!124332 () Bool)

(declare-fun e!164637 () Bool)

(assert (=> start!24276 (=> (not res!124332) (not e!164637))))

(declare-fun valid!1472 (LongMapFixedSize!3748) Bool)

(assert (=> start!24276 (= res!124332 (valid!1472 thiss!1504))))

(assert (=> start!24276 e!164637))

(declare-fun e!164641 () Bool)

(assert (=> start!24276 e!164641))

(assert (=> start!24276 true))

(declare-fun b!253975 () Bool)

(declare-fun res!124331 () Bool)

(assert (=> b!253975 (=> (not res!124331) (not e!164637))))

(assert (=> b!253975 (= res!124331 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!164627 () Bool)

(declare-fun array_inv!3867 (array!12401) Bool)

(declare-fun array_inv!3868 (array!12399) Bool)

(assert (=> b!253987 (= e!164641 (and tp!23306 tp_is_empty!6535 (array_inv!3867 (_keys!6841 thiss!1504)) (array_inv!3868 (_values!4670 thiss!1504)) e!164627))))

(declare-fun b!253988 () Bool)

(assert (=> b!253988 (= e!164637 e!164639)))

(declare-fun res!124325 () Bool)

(assert (=> b!253988 (=> (not res!124325) (not e!164639))))

(assert (=> b!253988 (= res!124325 (or (= lt!127318 (MissingZero!1108 index!297)) (= lt!127318 (MissingVacant!1108 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12401 (_ BitVec 32)) SeekEntryResult!1108)

(assert (=> b!253988 (= lt!127318 (seekEntryOrOpen!0 key!932 (_keys!6841 thiss!1504) (mask!10929 thiss!1504)))))

(declare-fun b!253989 () Bool)

(declare-fun lt!127323 () Unit!7833)

(assert (=> b!253989 (= e!164629 lt!127323)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!402 (array!12401 array!12399 (_ BitVec 32) (_ BitVec 32) V!8361 V!8361 (_ BitVec 64) Int) Unit!7833)

(assert (=> b!253989 (= lt!127323 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!402 (_keys!6841 thiss!1504) (_values!4670 thiss!1504) (mask!10929 thiss!1504) (extraKeys!4424 thiss!1504) (zeroValue!4528 thiss!1504) (minValue!4528 thiss!1504) key!932 (defaultEntry!4687 thiss!1504)))))

(assert (=> b!253989 (= c!42843 ((_ is MissingZero!1108) lt!127318))))

(assert (=> b!253989 e!164632))

(declare-fun b!253990 () Bool)

(assert (=> b!253990 (= e!164628 (not call!23952))))

(declare-fun b!253991 () Bool)

(declare-fun Unit!7836 () Unit!7833)

(assert (=> b!253991 (= e!164636 Unit!7836)))

(declare-fun lt!127319 () Unit!7833)

(declare-fun lemmaArrayContainsKeyThenInListMap!226 (array!12401 array!12399 (_ BitVec 32) (_ BitVec 32) V!8361 V!8361 (_ BitVec 64) (_ BitVec 32) Int) Unit!7833)

(assert (=> b!253991 (= lt!127319 (lemmaArrayContainsKeyThenInListMap!226 (_keys!6841 thiss!1504) (_values!4670 thiss!1504) (mask!10929 thiss!1504) (extraKeys!4424 thiss!1504) (zeroValue!4528 thiss!1504) (minValue!4528 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4687 thiss!1504)))))

(assert (=> b!253991 false))

(declare-fun b!253992 () Bool)

(declare-fun Unit!7837 () Unit!7833)

(assert (=> b!253992 (= e!164629 Unit!7837)))

(declare-fun lt!127327 () Unit!7833)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!408 (array!12401 array!12399 (_ BitVec 32) (_ BitVec 32) V!8361 V!8361 (_ BitVec 64) Int) Unit!7833)

(assert (=> b!253992 (= lt!127327 (lemmaInListMapThenSeekEntryOrOpenFindsIt!408 (_keys!6841 thiss!1504) (_values!4670 thiss!1504) (mask!10929 thiss!1504) (extraKeys!4424 thiss!1504) (zeroValue!4528 thiss!1504) (minValue!4528 thiss!1504) key!932 (defaultEntry!4687 thiss!1504)))))

(assert (=> b!253992 false))

(declare-fun b!253993 () Bool)

(assert (=> b!253993 (= e!164627 (and e!164634 mapRes!11118))))

(declare-fun condMapEmpty!11118 () Bool)

(declare-fun mapDefault!11118 () ValueCell!2924)

(assert (=> b!253993 (= condMapEmpty!11118 (= (arr!5875 (_values!4670 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2924)) mapDefault!11118)))))

(declare-fun b!253994 () Bool)

(declare-fun res!124337 () Bool)

(assert (=> b!253994 (=> res!124337 e!164640)))

(assert (=> b!253994 (= res!124337 (not (arrayNoDuplicates!0 (_keys!6841 thiss!1504) #b00000000000000000000000000000000 Nil!3669)))))

(declare-fun b!253995 () Bool)

(assert (=> b!253995 (= e!164633 e!164635)))

(declare-fun res!124336 () Bool)

(assert (=> b!253995 (= res!124336 call!23953)))

(assert (=> b!253995 (=> (not res!124336) (not e!164635))))

(declare-fun b!253996 () Bool)

(declare-fun res!124328 () Bool)

(assert (=> b!253996 (= res!124328 (= (select (arr!5876 (_keys!6841 thiss!1504)) (index!6605 lt!127318)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253996 (=> (not res!124328) (not e!164635))))

(declare-fun b!253997 () Bool)

(declare-fun res!124329 () Bool)

(assert (=> b!253997 (=> res!124329 e!164640)))

(assert (=> b!253997 (= res!124329 (or (not (= (size!6222 (_values!4670 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10929 thiss!1504)))) (not (= (size!6223 (_keys!6841 thiss!1504)) (size!6222 (_values!4670 thiss!1504)))) (bvslt (mask!10929 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4424 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4424 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!253998 () Bool)

(declare-fun res!124326 () Bool)

(assert (=> b!253998 (=> res!124326 e!164640)))

(assert (=> b!253998 (= res!124326 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6841 thiss!1504) (mask!10929 thiss!1504))))))

(declare-fun mapNonEmpty!11118 () Bool)

(declare-fun tp!23307 () Bool)

(assert (=> mapNonEmpty!11118 (= mapRes!11118 (and tp!23307 e!164630))))

(declare-fun mapValue!11118 () ValueCell!2924)

(declare-fun mapKey!11118 () (_ BitVec 32))

(declare-fun mapRest!11118 () (Array (_ BitVec 32) ValueCell!2924))

(assert (=> mapNonEmpty!11118 (= (arr!5875 (_values!4670 thiss!1504)) (store mapRest!11118 mapKey!11118 mapValue!11118))))

(declare-fun b!253999 () Bool)

(declare-fun res!124334 () Bool)

(assert (=> b!253999 (=> (not res!124334) (not e!164628))))

(assert (=> b!253999 (= res!124334 (= (select (arr!5876 (_keys!6841 thiss!1504)) (index!6602 lt!127318)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254000 () Bool)

(declare-fun res!124333 () Bool)

(assert (=> b!254000 (=> res!124333 e!164640)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!254000 (= res!124333 (not (validKeyInArray!0 key!932)))))

(assert (= (and start!24276 res!124332) b!253975))

(assert (= (and b!253975 res!124331) b!253988))

(assert (= (and b!253988 res!124325) b!253977))

(assert (= (and b!253977 c!42840) b!253992))

(assert (= (and b!253977 (not c!42840)) b!253989))

(assert (= (and b!253989 c!42843) b!253983))

(assert (= (and b!253989 (not c!42843)) b!253978))

(assert (= (and b!253983 res!124327) b!253999))

(assert (= (and b!253999 res!124334) b!253990))

(assert (= (and b!253978 c!42841) b!253995))

(assert (= (and b!253978 (not c!42841)) b!253986))

(assert (= (and b!253995 res!124336) b!253996))

(assert (= (and b!253996 res!124328) b!253985))

(assert (= (or b!253983 b!253995) bm!23949))

(assert (= (or b!253990 b!253985) bm!23950))

(assert (= (and b!253977 res!124330) b!253976))

(assert (= (and b!253976 c!42842) b!253991))

(assert (= (and b!253976 (not c!42842)) b!253984))

(assert (= (and b!253976 (not res!124335)) b!253997))

(assert (= (and b!253997 (not res!124329)) b!253998))

(assert (= (and b!253998 (not res!124326)) b!253994))

(assert (= (and b!253994 (not res!124337)) b!253980))

(assert (= (and b!253980 (not res!124338)) b!254000))

(assert (= (and b!254000 (not res!124333)) b!253982))

(assert (= (and b!253993 condMapEmpty!11118) mapIsEmpty!11118))

(assert (= (and b!253993 (not condMapEmpty!11118)) mapNonEmpty!11118))

(assert (= (and mapNonEmpty!11118 ((_ is ValueCellFull!2924) mapValue!11118)) b!253981))

(assert (= (and b!253993 ((_ is ValueCellFull!2924) mapDefault!11118)) b!253979))

(assert (= b!253987 b!253993))

(assert (= start!24276 b!253987))

(declare-fun m!269807 () Bool)

(assert (=> b!253994 m!269807))

(declare-fun m!269809 () Bool)

(assert (=> bm!23949 m!269809))

(declare-fun m!269811 () Bool)

(assert (=> b!253999 m!269811))

(declare-fun m!269813 () Bool)

(assert (=> b!253982 m!269813))

(declare-fun m!269815 () Bool)

(assert (=> b!253976 m!269815))

(declare-fun m!269817 () Bool)

(assert (=> b!253976 m!269817))

(declare-fun m!269819 () Bool)

(assert (=> b!253976 m!269819))

(declare-fun m!269821 () Bool)

(assert (=> b!253976 m!269821))

(declare-fun m!269823 () Bool)

(assert (=> b!253976 m!269823))

(declare-fun m!269825 () Bool)

(assert (=> b!253976 m!269825))

(declare-fun m!269827 () Bool)

(assert (=> b!253976 m!269827))

(declare-fun m!269829 () Bool)

(assert (=> b!253976 m!269829))

(declare-fun m!269831 () Bool)

(assert (=> b!253976 m!269831))

(declare-fun m!269833 () Bool)

(assert (=> b!253976 m!269833))

(declare-fun m!269835 () Bool)

(assert (=> b!253992 m!269835))

(declare-fun m!269837 () Bool)

(assert (=> start!24276 m!269837))

(declare-fun m!269839 () Bool)

(assert (=> b!253977 m!269839))

(declare-fun m!269841 () Bool)

(assert (=> b!253977 m!269841))

(assert (=> b!253977 m!269841))

(declare-fun m!269843 () Bool)

(assert (=> b!253977 m!269843))

(assert (=> bm!23950 m!269817))

(declare-fun m!269845 () Bool)

(assert (=> b!253989 m!269845))

(declare-fun m!269847 () Bool)

(assert (=> b!253998 m!269847))

(declare-fun m!269849 () Bool)

(assert (=> b!253991 m!269849))

(declare-fun m!269851 () Bool)

(assert (=> mapNonEmpty!11118 m!269851))

(declare-fun m!269853 () Bool)

(assert (=> b!253996 m!269853))

(declare-fun m!269855 () Bool)

(assert (=> b!253987 m!269855))

(declare-fun m!269857 () Bool)

(assert (=> b!253987 m!269857))

(declare-fun m!269859 () Bool)

(assert (=> b!253988 m!269859))

(declare-fun m!269861 () Bool)

(assert (=> b!254000 m!269861))

(check-sat b_and!13729 (not b!253987) (not b!253989) (not bm!23950) (not b_next!6673) (not bm!23949) (not b!253992) (not b!253988) tp_is_empty!6535 (not mapNonEmpty!11118) (not b!253976) (not b!253977) (not start!24276) (not b!253991) (not b!253998) (not b!253994) (not b!254000))
(check-sat b_and!13729 (not b_next!6673))
