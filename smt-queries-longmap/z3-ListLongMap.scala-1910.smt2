; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33984 () Bool)

(assert start!33984)

(declare-fun b_free!7129 () Bool)

(declare-fun b_next!7129 () Bool)

(assert (=> start!33984 (= b_free!7129 (not b_next!7129))))

(declare-fun tp!24905 () Bool)

(declare-fun b_and!14333 () Bool)

(assert (=> start!33984 (= tp!24905 b_and!14333)))

(declare-fun mapNonEmpty!12033 () Bool)

(declare-fun mapRes!12033 () Bool)

(declare-fun tp!24906 () Bool)

(declare-fun e!207841 () Bool)

(assert (=> mapNonEmpty!12033 (= mapRes!12033 (and tp!24906 e!207841))))

(declare-datatypes ((V!10419 0))(
  ( (V!10420 (val!3585 Int)) )
))
(declare-datatypes ((ValueCell!3197 0))(
  ( (ValueCellFull!3197 (v!5753 V!10419)) (EmptyCell!3197) )
))
(declare-fun mapRest!12033 () (Array (_ BitVec 32) ValueCell!3197))

(declare-fun mapKey!12033 () (_ BitVec 32))

(declare-datatypes ((array!17740 0))(
  ( (array!17741 (arr!8395 (Array (_ BitVec 32) ValueCell!3197)) (size!8747 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17740)

(declare-fun mapValue!12033 () ValueCell!3197)

(assert (=> mapNonEmpty!12033 (= (arr!8395 _values!1525) (store mapRest!12033 mapKey!12033 mapValue!12033))))

(declare-fun b!338751 () Bool)

(declare-fun e!207835 () Bool)

(declare-fun e!207837 () Bool)

(assert (=> b!338751 (= e!207835 (and e!207837 mapRes!12033))))

(declare-fun condMapEmpty!12033 () Bool)

(declare-fun mapDefault!12033 () ValueCell!3197)

(assert (=> b!338751 (= condMapEmpty!12033 (= (arr!8395 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3197)) mapDefault!12033)))))

(declare-fun b!338752 () Bool)

(declare-fun tp_is_empty!7081 () Bool)

(assert (=> b!338752 (= e!207837 tp_is_empty!7081)))

(declare-fun res!187163 () Bool)

(declare-fun e!207836 () Bool)

(assert (=> start!33984 (=> (not res!187163) (not e!207836))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33984 (= res!187163 (validMask!0 mask!2385))))

(assert (=> start!33984 e!207836))

(assert (=> start!33984 true))

(assert (=> start!33984 tp_is_empty!7081))

(assert (=> start!33984 tp!24905))

(declare-fun array_inv!6226 (array!17740) Bool)

(assert (=> start!33984 (and (array_inv!6226 _values!1525) e!207835)))

(declare-datatypes ((array!17742 0))(
  ( (array!17743 (arr!8396 (Array (_ BitVec 32) (_ BitVec 64))) (size!8748 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17742)

(declare-fun array_inv!6227 (array!17742) Bool)

(assert (=> start!33984 (array_inv!6227 _keys!1895)))

(declare-fun b!338753 () Bool)

(assert (=> b!338753 (= e!207841 tp_is_empty!7081)))

(declare-fun b!338754 () Bool)

(declare-datatypes ((Unit!10502 0))(
  ( (Unit!10503) )
))
(declare-fun e!207840 () Unit!10502)

(declare-fun Unit!10504 () Unit!10502)

(assert (=> b!338754 (= e!207840 Unit!10504)))

(declare-fun zeroValue!1467 () V!10419)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10419)

(declare-fun lt!160925 () Unit!10502)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!285 (array!17742 array!17740 (_ BitVec 32) (_ BitVec 32) V!10419 V!10419 (_ BitVec 64) (_ BitVec 32) Int) Unit!10502)

(declare-fun arrayScanForKey!0 (array!17742 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338754 (= lt!160925 (lemmaArrayContainsKeyThenInListMap!285 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338754 false))

(declare-fun b!338755 () Bool)

(declare-fun res!187158 () Bool)

(assert (=> b!338755 (=> (not res!187158) (not e!207836))))

(declare-datatypes ((tuple2!5112 0))(
  ( (tuple2!5113 (_1!2567 (_ BitVec 64)) (_2!2567 V!10419)) )
))
(declare-datatypes ((List!4722 0))(
  ( (Nil!4719) (Cons!4718 (h!5574 tuple2!5112) (t!9812 List!4722)) )
))
(declare-datatypes ((ListLongMap!4027 0))(
  ( (ListLongMap!4028 (toList!2029 List!4722)) )
))
(declare-fun contains!2097 (ListLongMap!4027 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1558 (array!17742 array!17740 (_ BitVec 32) (_ BitVec 32) V!10419 V!10419 (_ BitVec 32) Int) ListLongMap!4027)

(assert (=> b!338755 (= res!187158 (not (contains!2097 (getCurrentListMap!1558 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!338756 () Bool)

(declare-fun Unit!10505 () Unit!10502)

(assert (=> b!338756 (= e!207840 Unit!10505)))

(declare-fun b!338757 () Bool)

(declare-fun res!187166 () Bool)

(assert (=> b!338757 (=> (not res!187166) (not e!207836))))

(declare-datatypes ((List!4723 0))(
  ( (Nil!4720) (Cons!4719 (h!5575 (_ BitVec 64)) (t!9813 List!4723)) )
))
(declare-fun arrayNoDuplicates!0 (array!17742 (_ BitVec 32) List!4723) Bool)

(assert (=> b!338757 (= res!187166 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4720))))

(declare-fun b!338758 () Bool)

(declare-fun res!187162 () Bool)

(assert (=> b!338758 (=> (not res!187162) (not e!207836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338758 (= res!187162 (validKeyInArray!0 k0!1348))))

(declare-fun b!338759 () Bool)

(declare-fun e!207839 () Bool)

(declare-fun e!207838 () Bool)

(assert (=> b!338759 (= e!207839 e!207838)))

(declare-fun res!187159 () Bool)

(assert (=> b!338759 (=> (not res!187159) (not e!207838))))

(declare-fun lt!160924 () Bool)

(assert (=> b!338759 (= res!187159 (not lt!160924))))

(declare-fun lt!160926 () Unit!10502)

(assert (=> b!338759 (= lt!160926 e!207840)))

(declare-fun c!52430 () Bool)

(assert (=> b!338759 (= c!52430 lt!160924)))

(declare-fun arrayContainsKey!0 (array!17742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338759 (= lt!160924 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12033 () Bool)

(assert (=> mapIsEmpty!12033 mapRes!12033))

(declare-fun b!338760 () Bool)

(declare-datatypes ((SeekEntryResult!3201 0))(
  ( (MissingZero!3201 (index!14983 (_ BitVec 32))) (Found!3201 (index!14984 (_ BitVec 32))) (Intermediate!3201 (undefined!4013 Bool) (index!14985 (_ BitVec 32)) (x!33710 (_ BitVec 32))) (Undefined!3201) (MissingVacant!3201 (index!14986 (_ BitVec 32))) )
))
(declare-fun lt!160927 () SeekEntryResult!3201)

(assert (=> b!338760 (= e!207838 (and (= (select (arr!8396 _keys!1895) (index!14983 lt!160927)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!8748 _keys!1895))))))

(declare-fun b!338761 () Bool)

(declare-fun res!187160 () Bool)

(assert (=> b!338761 (=> (not res!187160) (not e!207836))))

(assert (=> b!338761 (= res!187160 (and (= (size!8747 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8748 _keys!1895) (size!8747 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338762 () Bool)

(assert (=> b!338762 (= e!207836 e!207839)))

(declare-fun res!187165 () Bool)

(assert (=> b!338762 (=> (not res!187165) (not e!207839))))

(get-info :version)

(assert (=> b!338762 (= res!187165 (and (not ((_ is Found!3201) lt!160927)) ((_ is MissingZero!3201) lt!160927)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17742 (_ BitVec 32)) SeekEntryResult!3201)

(assert (=> b!338762 (= lt!160927 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338763 () Bool)

(declare-fun res!187164 () Bool)

(assert (=> b!338763 (=> (not res!187164) (not e!207838))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!338763 (= res!187164 (inRange!0 (index!14983 lt!160927) mask!2385))))

(declare-fun b!338764 () Bool)

(declare-fun res!187161 () Bool)

(assert (=> b!338764 (=> (not res!187161) (not e!207836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17742 (_ BitVec 32)) Bool)

(assert (=> b!338764 (= res!187161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33984 res!187163) b!338761))

(assert (= (and b!338761 res!187160) b!338764))

(assert (= (and b!338764 res!187161) b!338757))

(assert (= (and b!338757 res!187166) b!338758))

(assert (= (and b!338758 res!187162) b!338755))

(assert (= (and b!338755 res!187158) b!338762))

(assert (= (and b!338762 res!187165) b!338759))

(assert (= (and b!338759 c!52430) b!338754))

(assert (= (and b!338759 (not c!52430)) b!338756))

(assert (= (and b!338759 res!187159) b!338763))

(assert (= (and b!338763 res!187164) b!338760))

(assert (= (and b!338751 condMapEmpty!12033) mapIsEmpty!12033))

(assert (= (and b!338751 (not condMapEmpty!12033)) mapNonEmpty!12033))

(assert (= (and mapNonEmpty!12033 ((_ is ValueCellFull!3197) mapValue!12033)) b!338753))

(assert (= (and b!338751 ((_ is ValueCellFull!3197) mapDefault!12033)) b!338752))

(assert (= start!33984 b!338751))

(declare-fun m!342175 () Bool)

(assert (=> b!338754 m!342175))

(assert (=> b!338754 m!342175))

(declare-fun m!342177 () Bool)

(assert (=> b!338754 m!342177))

(declare-fun m!342179 () Bool)

(assert (=> b!338760 m!342179))

(declare-fun m!342181 () Bool)

(assert (=> b!338764 m!342181))

(declare-fun m!342183 () Bool)

(assert (=> b!338758 m!342183))

(declare-fun m!342185 () Bool)

(assert (=> b!338762 m!342185))

(declare-fun m!342187 () Bool)

(assert (=> b!338763 m!342187))

(declare-fun m!342189 () Bool)

(assert (=> b!338757 m!342189))

(declare-fun m!342191 () Bool)

(assert (=> b!338759 m!342191))

(declare-fun m!342193 () Bool)

(assert (=> mapNonEmpty!12033 m!342193))

(declare-fun m!342195 () Bool)

(assert (=> b!338755 m!342195))

(assert (=> b!338755 m!342195))

(declare-fun m!342197 () Bool)

(assert (=> b!338755 m!342197))

(declare-fun m!342199 () Bool)

(assert (=> start!33984 m!342199))

(declare-fun m!342201 () Bool)

(assert (=> start!33984 m!342201))

(declare-fun m!342203 () Bool)

(assert (=> start!33984 m!342203))

(check-sat (not b!338755) (not b_next!7129) (not b!338759) (not b!338758) (not b!338754) (not b!338764) (not b!338757) tp_is_empty!7081 b_and!14333 (not mapNonEmpty!12033) (not start!33984) (not b!338762) (not b!338763))
(check-sat b_and!14333 (not b_next!7129))
(get-model)

(declare-fun d!70831 () Bool)

(assert (=> d!70831 (contains!2097 (getCurrentListMap!1558 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!160954 () Unit!10502)

(declare-fun choose!1307 (array!17742 array!17740 (_ BitVec 32) (_ BitVec 32) V!10419 V!10419 (_ BitVec 64) (_ BitVec 32) Int) Unit!10502)

(assert (=> d!70831 (= lt!160954 (choose!1307 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70831 (validMask!0 mask!2385)))

(assert (=> d!70831 (= (lemmaArrayContainsKeyThenInListMap!285 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!160954)))

(declare-fun bs!11678 () Bool)

(assert (= bs!11678 d!70831))

(assert (=> bs!11678 m!342195))

(assert (=> bs!11678 m!342195))

(assert (=> bs!11678 m!342197))

(assert (=> bs!11678 m!342175))

(declare-fun m!342265 () Bool)

(assert (=> bs!11678 m!342265))

(assert (=> bs!11678 m!342199))

(assert (=> b!338754 d!70831))

(declare-fun d!70833 () Bool)

(declare-fun lt!160957 () (_ BitVec 32))

(assert (=> d!70833 (and (or (bvslt lt!160957 #b00000000000000000000000000000000) (bvsge lt!160957 (size!8748 _keys!1895)) (and (bvsge lt!160957 #b00000000000000000000000000000000) (bvslt lt!160957 (size!8748 _keys!1895)))) (bvsge lt!160957 #b00000000000000000000000000000000) (bvslt lt!160957 (size!8748 _keys!1895)) (= (select (arr!8396 _keys!1895) lt!160957) k0!1348))))

(declare-fun e!207893 () (_ BitVec 32))

(assert (=> d!70833 (= lt!160957 e!207893)))

(declare-fun c!52439 () Bool)

(assert (=> d!70833 (= c!52439 (= (select (arr!8396 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70833 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8748 _keys!1895)) (bvslt (size!8748 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70833 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!160957)))

(declare-fun b!338853 () Bool)

(assert (=> b!338853 (= e!207893 #b00000000000000000000000000000000)))

(declare-fun b!338854 () Bool)

(assert (=> b!338854 (= e!207893 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70833 c!52439) b!338853))

(assert (= (and d!70833 (not c!52439)) b!338854))

(declare-fun m!342267 () Bool)

(assert (=> d!70833 m!342267))

(declare-fun m!342269 () Bool)

(assert (=> d!70833 m!342269))

(declare-fun m!342271 () Bool)

(assert (=> b!338854 m!342271))

(assert (=> b!338754 d!70833))

(declare-fun d!70835 () Bool)

(declare-fun res!187225 () Bool)

(declare-fun e!207902 () Bool)

(assert (=> d!70835 (=> res!187225 e!207902)))

(assert (=> d!70835 (= res!187225 (bvsge #b00000000000000000000000000000000 (size!8748 _keys!1895)))))

(assert (=> d!70835 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!207902)))

(declare-fun b!338863 () Bool)

(declare-fun e!207901 () Bool)

(declare-fun e!207900 () Bool)

(assert (=> b!338863 (= e!207901 e!207900)))

(declare-fun lt!160965 () (_ BitVec 64))

(assert (=> b!338863 (= lt!160965 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160964 () Unit!10502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17742 (_ BitVec 64) (_ BitVec 32)) Unit!10502)

(assert (=> b!338863 (= lt!160964 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160965 #b00000000000000000000000000000000))))

(assert (=> b!338863 (arrayContainsKey!0 _keys!1895 lt!160965 #b00000000000000000000000000000000)))

(declare-fun lt!160966 () Unit!10502)

(assert (=> b!338863 (= lt!160966 lt!160964)))

(declare-fun res!187226 () Bool)

(assert (=> b!338863 (= res!187226 (= (seekEntryOrOpen!0 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3201 #b00000000000000000000000000000000)))))

(assert (=> b!338863 (=> (not res!187226) (not e!207900))))

(declare-fun b!338864 () Bool)

(assert (=> b!338864 (= e!207902 e!207901)))

(declare-fun c!52442 () Bool)

(assert (=> b!338864 (= c!52442 (validKeyInArray!0 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26417 () Bool)

(declare-fun call!26420 () Bool)

(assert (=> bm!26417 (= call!26420 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!338865 () Bool)

(assert (=> b!338865 (= e!207901 call!26420)))

(declare-fun b!338866 () Bool)

(assert (=> b!338866 (= e!207900 call!26420)))

(assert (= (and d!70835 (not res!187225)) b!338864))

(assert (= (and b!338864 c!52442) b!338863))

(assert (= (and b!338864 (not c!52442)) b!338865))

(assert (= (and b!338863 res!187226) b!338866))

(assert (= (or b!338866 b!338865) bm!26417))

(assert (=> b!338863 m!342269))

(declare-fun m!342273 () Bool)

(assert (=> b!338863 m!342273))

(declare-fun m!342275 () Bool)

(assert (=> b!338863 m!342275))

(assert (=> b!338863 m!342269))

(declare-fun m!342277 () Bool)

(assert (=> b!338863 m!342277))

(assert (=> b!338864 m!342269))

(assert (=> b!338864 m!342269))

(declare-fun m!342279 () Bool)

(assert (=> b!338864 m!342279))

(declare-fun m!342281 () Bool)

(assert (=> bm!26417 m!342281))

(assert (=> b!338764 d!70835))

(declare-fun d!70837 () Bool)

(declare-fun e!207907 () Bool)

(assert (=> d!70837 e!207907))

(declare-fun res!187229 () Bool)

(assert (=> d!70837 (=> res!187229 e!207907)))

(declare-fun lt!160975 () Bool)

(assert (=> d!70837 (= res!187229 (not lt!160975))))

(declare-fun lt!160977 () Bool)

(assert (=> d!70837 (= lt!160975 lt!160977)))

(declare-fun lt!160976 () Unit!10502)

(declare-fun e!207908 () Unit!10502)

(assert (=> d!70837 (= lt!160976 e!207908)))

(declare-fun c!52445 () Bool)

(assert (=> d!70837 (= c!52445 lt!160977)))

(declare-fun containsKey!321 (List!4722 (_ BitVec 64)) Bool)

(assert (=> d!70837 (= lt!160977 (containsKey!321 (toList!2029 (getCurrentListMap!1558 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70837 (= (contains!2097 (getCurrentListMap!1558 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160975)))

(declare-fun b!338873 () Bool)

(declare-fun lt!160978 () Unit!10502)

(assert (=> b!338873 (= e!207908 lt!160978)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!269 (List!4722 (_ BitVec 64)) Unit!10502)

(assert (=> b!338873 (= lt!160978 (lemmaContainsKeyImpliesGetValueByKeyDefined!269 (toList!2029 (getCurrentListMap!1558 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!336 0))(
  ( (Some!335 (v!5756 V!10419)) (None!334) )
))
(declare-fun isDefined!270 (Option!336) Bool)

(declare-fun getValueByKey!330 (List!4722 (_ BitVec 64)) Option!336)

(assert (=> b!338873 (isDefined!270 (getValueByKey!330 (toList!2029 (getCurrentListMap!1558 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!338874 () Bool)

(declare-fun Unit!10513 () Unit!10502)

(assert (=> b!338874 (= e!207908 Unit!10513)))

(declare-fun b!338875 () Bool)

(assert (=> b!338875 (= e!207907 (isDefined!270 (getValueByKey!330 (toList!2029 (getCurrentListMap!1558 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70837 c!52445) b!338873))

(assert (= (and d!70837 (not c!52445)) b!338874))

(assert (= (and d!70837 (not res!187229)) b!338875))

(declare-fun m!342283 () Bool)

(assert (=> d!70837 m!342283))

(declare-fun m!342285 () Bool)

(assert (=> b!338873 m!342285))

(declare-fun m!342287 () Bool)

(assert (=> b!338873 m!342287))

(assert (=> b!338873 m!342287))

(declare-fun m!342289 () Bool)

(assert (=> b!338873 m!342289))

(assert (=> b!338875 m!342287))

(assert (=> b!338875 m!342287))

(assert (=> b!338875 m!342289))

(assert (=> b!338755 d!70837))

(declare-fun b!338918 () Bool)

(declare-fun e!207944 () ListLongMap!4027)

(declare-fun call!26437 () ListLongMap!4027)

(assert (=> b!338918 (= e!207944 call!26437)))

(declare-fun b!338919 () Bool)

(declare-fun res!187254 () Bool)

(declare-fun e!207939 () Bool)

(assert (=> b!338919 (=> (not res!187254) (not e!207939))))

(declare-fun e!207938 () Bool)

(assert (=> b!338919 (= res!187254 e!207938)))

(declare-fun c!52460 () Bool)

(assert (=> b!338919 (= c!52460 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!338920 () Bool)

(declare-fun c!52462 () Bool)

(assert (=> b!338920 (= c!52462 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!207943 () ListLongMap!4027)

(assert (=> b!338920 (= e!207943 e!207944)))

(declare-fun bm!26432 () Bool)

(declare-fun call!26436 () Bool)

(declare-fun lt!161030 () ListLongMap!4027)

(assert (=> bm!26432 (= call!26436 (contains!2097 lt!161030 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!338921 () Bool)

(declare-fun res!187255 () Bool)

(assert (=> b!338921 (=> (not res!187255) (not e!207939))))

(declare-fun e!207935 () Bool)

(assert (=> b!338921 (= res!187255 e!207935)))

(declare-fun res!187253 () Bool)

(assert (=> b!338921 (=> res!187253 e!207935)))

(declare-fun e!207941 () Bool)

(assert (=> b!338921 (= res!187253 (not e!207941))))

(declare-fun res!187248 () Bool)

(assert (=> b!338921 (=> (not res!187248) (not e!207941))))

(assert (=> b!338921 (= res!187248 (bvslt #b00000000000000000000000000000000 (size!8748 _keys!1895)))))

(declare-fun b!338922 () Bool)

(declare-fun e!207936 () Bool)

(declare-fun apply!271 (ListLongMap!4027 (_ BitVec 64)) V!10419)

(declare-fun get!4583 (ValueCell!3197 V!10419) V!10419)

(declare-fun dynLambda!614 (Int (_ BitVec 64)) V!10419)

(assert (=> b!338922 (= e!207936 (= (apply!271 lt!161030 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000)) (get!4583 (select (arr!8395 _values!1525) #b00000000000000000000000000000000) (dynLambda!614 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!338922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8747 _values!1525)))))

(assert (=> b!338922 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8748 _keys!1895)))))

(declare-fun d!70839 () Bool)

(assert (=> d!70839 e!207939))

(declare-fun res!187256 () Bool)

(assert (=> d!70839 (=> (not res!187256) (not e!207939))))

(assert (=> d!70839 (= res!187256 (or (bvsge #b00000000000000000000000000000000 (size!8748 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8748 _keys!1895)))))))

(declare-fun lt!161037 () ListLongMap!4027)

(assert (=> d!70839 (= lt!161030 lt!161037)))

(declare-fun lt!161031 () Unit!10502)

(declare-fun e!207940 () Unit!10502)

(assert (=> d!70839 (= lt!161031 e!207940)))

(declare-fun c!52463 () Bool)

(declare-fun e!207946 () Bool)

(assert (=> d!70839 (= c!52463 e!207946)))

(declare-fun res!187251 () Bool)

(assert (=> d!70839 (=> (not res!187251) (not e!207946))))

(assert (=> d!70839 (= res!187251 (bvslt #b00000000000000000000000000000000 (size!8748 _keys!1895)))))

(declare-fun e!207947 () ListLongMap!4027)

(assert (=> d!70839 (= lt!161037 e!207947)))

(declare-fun c!52461 () Bool)

(assert (=> d!70839 (= c!52461 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70839 (validMask!0 mask!2385)))

(assert (=> d!70839 (= (getCurrentListMap!1558 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161030)))

(declare-fun bm!26433 () Bool)

(declare-fun call!26438 () Bool)

(assert (=> bm!26433 (= call!26438 (contains!2097 lt!161030 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!338923 () Bool)

(assert (=> b!338923 (= e!207938 (not call!26438))))

(declare-fun call!26441 () ListLongMap!4027)

(declare-fun call!26435 () ListLongMap!4027)

(declare-fun call!26439 () ListLongMap!4027)

(declare-fun bm!26434 () Bool)

(declare-fun c!52458 () Bool)

(declare-fun +!722 (ListLongMap!4027 tuple2!5112) ListLongMap!4027)

(assert (=> bm!26434 (= call!26439 (+!722 (ite c!52461 call!26441 (ite c!52458 call!26435 call!26437)) (ite (or c!52461 c!52458) (tuple2!5113 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26435 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!587 (array!17742 array!17740 (_ BitVec 32) (_ BitVec 32) V!10419 V!10419 (_ BitVec 32) Int) ListLongMap!4027)

(assert (=> bm!26435 (= call!26441 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!338924 () Bool)

(declare-fun e!207942 () Bool)

(declare-fun e!207945 () Bool)

(assert (=> b!338924 (= e!207942 e!207945)))

(declare-fun res!187250 () Bool)

(assert (=> b!338924 (= res!187250 call!26436)))

(assert (=> b!338924 (=> (not res!187250) (not e!207945))))

(declare-fun b!338925 () Bool)

(declare-fun e!207937 () Bool)

(assert (=> b!338925 (= e!207937 (= (apply!271 lt!161030 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!338926 () Bool)

(assert (=> b!338926 (= e!207947 (+!722 call!26439 (tuple2!5113 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!338927 () Bool)

(assert (=> b!338927 (= e!207941 (validKeyInArray!0 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338928 () Bool)

(declare-fun call!26440 () ListLongMap!4027)

(assert (=> b!338928 (= e!207944 call!26440)))

(declare-fun b!338929 () Bool)

(assert (=> b!338929 (= e!207947 e!207943)))

(assert (=> b!338929 (= c!52458 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26436 () Bool)

(assert (=> bm!26436 (= call!26435 call!26441)))

(declare-fun b!338930 () Bool)

(assert (=> b!338930 (= e!207943 call!26440)))

(declare-fun bm!26437 () Bool)

(assert (=> bm!26437 (= call!26437 call!26435)))

(declare-fun b!338931 () Bool)

(assert (=> b!338931 (= e!207945 (= (apply!271 lt!161030 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!338932 () Bool)

(assert (=> b!338932 (= e!207939 e!207942)))

(declare-fun c!52459 () Bool)

(assert (=> b!338932 (= c!52459 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26438 () Bool)

(assert (=> bm!26438 (= call!26440 call!26439)))

(declare-fun b!338933 () Bool)

(assert (=> b!338933 (= e!207942 (not call!26436))))

(declare-fun b!338934 () Bool)

(declare-fun lt!161043 () Unit!10502)

(assert (=> b!338934 (= e!207940 lt!161043)))

(declare-fun lt!161033 () ListLongMap!4027)

(assert (=> b!338934 (= lt!161033 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161027 () (_ BitVec 64))

(assert (=> b!338934 (= lt!161027 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161040 () (_ BitVec 64))

(assert (=> b!338934 (= lt!161040 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161024 () Unit!10502)

(declare-fun addStillContains!247 (ListLongMap!4027 (_ BitVec 64) V!10419 (_ BitVec 64)) Unit!10502)

(assert (=> b!338934 (= lt!161024 (addStillContains!247 lt!161033 lt!161027 zeroValue!1467 lt!161040))))

(assert (=> b!338934 (contains!2097 (+!722 lt!161033 (tuple2!5113 lt!161027 zeroValue!1467)) lt!161040)))

(declare-fun lt!161034 () Unit!10502)

(assert (=> b!338934 (= lt!161034 lt!161024)))

(declare-fun lt!161032 () ListLongMap!4027)

(assert (=> b!338934 (= lt!161032 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161035 () (_ BitVec 64))

(assert (=> b!338934 (= lt!161035 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161023 () (_ BitVec 64))

(assert (=> b!338934 (= lt!161023 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161044 () Unit!10502)

(declare-fun addApplyDifferent!247 (ListLongMap!4027 (_ BitVec 64) V!10419 (_ BitVec 64)) Unit!10502)

(assert (=> b!338934 (= lt!161044 (addApplyDifferent!247 lt!161032 lt!161035 minValue!1467 lt!161023))))

(assert (=> b!338934 (= (apply!271 (+!722 lt!161032 (tuple2!5113 lt!161035 minValue!1467)) lt!161023) (apply!271 lt!161032 lt!161023))))

(declare-fun lt!161026 () Unit!10502)

(assert (=> b!338934 (= lt!161026 lt!161044)))

(declare-fun lt!161028 () ListLongMap!4027)

(assert (=> b!338934 (= lt!161028 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161039 () (_ BitVec 64))

(assert (=> b!338934 (= lt!161039 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161038 () (_ BitVec 64))

(assert (=> b!338934 (= lt!161038 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161041 () Unit!10502)

(assert (=> b!338934 (= lt!161041 (addApplyDifferent!247 lt!161028 lt!161039 zeroValue!1467 lt!161038))))

(assert (=> b!338934 (= (apply!271 (+!722 lt!161028 (tuple2!5113 lt!161039 zeroValue!1467)) lt!161038) (apply!271 lt!161028 lt!161038))))

(declare-fun lt!161025 () Unit!10502)

(assert (=> b!338934 (= lt!161025 lt!161041)))

(declare-fun lt!161029 () ListLongMap!4027)

(assert (=> b!338934 (= lt!161029 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161042 () (_ BitVec 64))

(assert (=> b!338934 (= lt!161042 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161036 () (_ BitVec 64))

(assert (=> b!338934 (= lt!161036 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!338934 (= lt!161043 (addApplyDifferent!247 lt!161029 lt!161042 minValue!1467 lt!161036))))

(assert (=> b!338934 (= (apply!271 (+!722 lt!161029 (tuple2!5113 lt!161042 minValue!1467)) lt!161036) (apply!271 lt!161029 lt!161036))))

(declare-fun b!338935 () Bool)

(assert (=> b!338935 (= e!207938 e!207937)))

(declare-fun res!187252 () Bool)

(assert (=> b!338935 (= res!187252 call!26438)))

(assert (=> b!338935 (=> (not res!187252) (not e!207937))))

(declare-fun b!338936 () Bool)

(declare-fun Unit!10514 () Unit!10502)

(assert (=> b!338936 (= e!207940 Unit!10514)))

(declare-fun b!338937 () Bool)

(assert (=> b!338937 (= e!207935 e!207936)))

(declare-fun res!187249 () Bool)

(assert (=> b!338937 (=> (not res!187249) (not e!207936))))

(assert (=> b!338937 (= res!187249 (contains!2097 lt!161030 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!338937 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8748 _keys!1895)))))

(declare-fun b!338938 () Bool)

(assert (=> b!338938 (= e!207946 (validKeyInArray!0 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70839 c!52461) b!338926))

(assert (= (and d!70839 (not c!52461)) b!338929))

(assert (= (and b!338929 c!52458) b!338930))

(assert (= (and b!338929 (not c!52458)) b!338920))

(assert (= (and b!338920 c!52462) b!338928))

(assert (= (and b!338920 (not c!52462)) b!338918))

(assert (= (or b!338928 b!338918) bm!26437))

(assert (= (or b!338930 bm!26437) bm!26436))

(assert (= (or b!338930 b!338928) bm!26438))

(assert (= (or b!338926 bm!26436) bm!26435))

(assert (= (or b!338926 bm!26438) bm!26434))

(assert (= (and d!70839 res!187251) b!338938))

(assert (= (and d!70839 c!52463) b!338934))

(assert (= (and d!70839 (not c!52463)) b!338936))

(assert (= (and d!70839 res!187256) b!338921))

(assert (= (and b!338921 res!187248) b!338927))

(assert (= (and b!338921 (not res!187253)) b!338937))

(assert (= (and b!338937 res!187249) b!338922))

(assert (= (and b!338921 res!187255) b!338919))

(assert (= (and b!338919 c!52460) b!338935))

(assert (= (and b!338919 (not c!52460)) b!338923))

(assert (= (and b!338935 res!187252) b!338925))

(assert (= (or b!338935 b!338923) bm!26433))

(assert (= (and b!338919 res!187254) b!338932))

(assert (= (and b!338932 c!52459) b!338924))

(assert (= (and b!338932 (not c!52459)) b!338933))

(assert (= (and b!338924 res!187250) b!338931))

(assert (= (or b!338924 b!338933) bm!26432))

(declare-fun b_lambda!8445 () Bool)

(assert (=> (not b_lambda!8445) (not b!338922)))

(declare-fun t!9818 () Bool)

(declare-fun tb!3049 () Bool)

(assert (=> (and start!33984 (= defaultEntry!1528 defaultEntry!1528) t!9818) tb!3049))

(declare-fun result!5493 () Bool)

(assert (=> tb!3049 (= result!5493 tp_is_empty!7081)))

(assert (=> b!338922 t!9818))

(declare-fun b_and!14339 () Bool)

(assert (= b_and!14333 (and (=> t!9818 result!5493) b_and!14339)))

(declare-fun m!342291 () Bool)

(assert (=> bm!26434 m!342291))

(assert (=> b!338927 m!342269))

(assert (=> b!338927 m!342269))

(assert (=> b!338927 m!342279))

(assert (=> b!338937 m!342269))

(assert (=> b!338937 m!342269))

(declare-fun m!342293 () Bool)

(assert (=> b!338937 m!342293))

(assert (=> b!338934 m!342269))

(declare-fun m!342295 () Bool)

(assert (=> b!338934 m!342295))

(declare-fun m!342297 () Bool)

(assert (=> b!338934 m!342297))

(declare-fun m!342299 () Bool)

(assert (=> b!338934 m!342299))

(assert (=> b!338934 m!342295))

(declare-fun m!342301 () Bool)

(assert (=> b!338934 m!342301))

(declare-fun m!342303 () Bool)

(assert (=> b!338934 m!342303))

(declare-fun m!342305 () Bool)

(assert (=> b!338934 m!342305))

(declare-fun m!342307 () Bool)

(assert (=> b!338934 m!342307))

(declare-fun m!342309 () Bool)

(assert (=> b!338934 m!342309))

(assert (=> b!338934 m!342307))

(declare-fun m!342311 () Bool)

(assert (=> b!338934 m!342311))

(declare-fun m!342313 () Bool)

(assert (=> b!338934 m!342313))

(declare-fun m!342315 () Bool)

(assert (=> b!338934 m!342315))

(declare-fun m!342317 () Bool)

(assert (=> b!338934 m!342317))

(declare-fun m!342319 () Bool)

(assert (=> b!338934 m!342319))

(declare-fun m!342321 () Bool)

(assert (=> b!338934 m!342321))

(declare-fun m!342323 () Bool)

(assert (=> b!338934 m!342323))

(assert (=> b!338934 m!342303))

(assert (=> b!338934 m!342323))

(declare-fun m!342325 () Bool)

(assert (=> b!338934 m!342325))

(declare-fun m!342327 () Bool)

(assert (=> bm!26432 m!342327))

(declare-fun m!342329 () Bool)

(assert (=> b!338931 m!342329))

(declare-fun m!342331 () Bool)

(assert (=> bm!26433 m!342331))

(assert (=> d!70839 m!342199))

(assert (=> b!338938 m!342269))

(assert (=> b!338938 m!342269))

(assert (=> b!338938 m!342279))

(assert (=> bm!26435 m!342299))

(assert (=> b!338922 m!342269))

(declare-fun m!342333 () Bool)

(assert (=> b!338922 m!342333))

(declare-fun m!342335 () Bool)

(assert (=> b!338922 m!342335))

(declare-fun m!342337 () Bool)

(assert (=> b!338922 m!342337))

(assert (=> b!338922 m!342335))

(assert (=> b!338922 m!342269))

(declare-fun m!342339 () Bool)

(assert (=> b!338922 m!342339))

(assert (=> b!338922 m!342333))

(declare-fun m!342341 () Bool)

(assert (=> b!338925 m!342341))

(declare-fun m!342343 () Bool)

(assert (=> b!338926 m!342343))

(assert (=> b!338755 d!70839))

(declare-fun d!70841 () Bool)

(assert (=> d!70841 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!338758 d!70841))

(declare-fun d!70843 () Bool)

(assert (=> d!70843 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33984 d!70843))

(declare-fun d!70845 () Bool)

(assert (=> d!70845 (= (array_inv!6226 _values!1525) (bvsge (size!8747 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33984 d!70845))

(declare-fun d!70847 () Bool)

(assert (=> d!70847 (= (array_inv!6227 _keys!1895) (bvsge (size!8748 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33984 d!70847))

(declare-fun d!70849 () Bool)

(assert (=> d!70849 (= (inRange!0 (index!14983 lt!160927) mask!2385) (and (bvsge (index!14983 lt!160927) #b00000000000000000000000000000000) (bvslt (index!14983 lt!160927) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!338763 d!70849))

(declare-fun d!70851 () Bool)

(declare-fun res!187261 () Bool)

(declare-fun e!207952 () Bool)

(assert (=> d!70851 (=> res!187261 e!207952)))

(assert (=> d!70851 (= res!187261 (= (select (arr!8396 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70851 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!207952)))

(declare-fun b!338945 () Bool)

(declare-fun e!207953 () Bool)

(assert (=> b!338945 (= e!207952 e!207953)))

(declare-fun res!187262 () Bool)

(assert (=> b!338945 (=> (not res!187262) (not e!207953))))

(assert (=> b!338945 (= res!187262 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8748 _keys!1895)))))

(declare-fun b!338946 () Bool)

(assert (=> b!338946 (= e!207953 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70851 (not res!187261)) b!338945))

(assert (= (and b!338945 res!187262) b!338946))

(assert (=> d!70851 m!342269))

(declare-fun m!342345 () Bool)

(assert (=> b!338946 m!342345))

(assert (=> b!338759 d!70851))

(declare-fun b!338957 () Bool)

(declare-fun e!207965 () Bool)

(declare-fun call!26444 () Bool)

(assert (=> b!338957 (= e!207965 call!26444)))

(declare-fun b!338958 () Bool)

(declare-fun e!207962 () Bool)

(declare-fun e!207964 () Bool)

(assert (=> b!338958 (= e!207962 e!207964)))

(declare-fun res!187269 () Bool)

(assert (=> b!338958 (=> (not res!187269) (not e!207964))))

(declare-fun e!207963 () Bool)

(assert (=> b!338958 (= res!187269 (not e!207963))))

(declare-fun res!187271 () Bool)

(assert (=> b!338958 (=> (not res!187271) (not e!207963))))

(assert (=> b!338958 (= res!187271 (validKeyInArray!0 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338959 () Bool)

(assert (=> b!338959 (= e!207964 e!207965)))

(declare-fun c!52466 () Bool)

(assert (=> b!338959 (= c!52466 (validKeyInArray!0 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338960 () Bool)

(declare-fun contains!2100 (List!4723 (_ BitVec 64)) Bool)

(assert (=> b!338960 (= e!207963 (contains!2100 Nil!4720 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338961 () Bool)

(assert (=> b!338961 (= e!207965 call!26444)))

(declare-fun bm!26441 () Bool)

(assert (=> bm!26441 (= call!26444 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52466 (Cons!4719 (select (arr!8396 _keys!1895) #b00000000000000000000000000000000) Nil!4720) Nil!4720)))))

(declare-fun d!70853 () Bool)

(declare-fun res!187270 () Bool)

(assert (=> d!70853 (=> res!187270 e!207962)))

(assert (=> d!70853 (= res!187270 (bvsge #b00000000000000000000000000000000 (size!8748 _keys!1895)))))

(assert (=> d!70853 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4720) e!207962)))

(assert (= (and d!70853 (not res!187270)) b!338958))

(assert (= (and b!338958 res!187271) b!338960))

(assert (= (and b!338958 res!187269) b!338959))

(assert (= (and b!338959 c!52466) b!338961))

(assert (= (and b!338959 (not c!52466)) b!338957))

(assert (= (or b!338961 b!338957) bm!26441))

(assert (=> b!338958 m!342269))

(assert (=> b!338958 m!342269))

(assert (=> b!338958 m!342279))

(assert (=> b!338959 m!342269))

(assert (=> b!338959 m!342269))

(assert (=> b!338959 m!342279))

(assert (=> b!338960 m!342269))

(assert (=> b!338960 m!342269))

(declare-fun m!342347 () Bool)

(assert (=> b!338960 m!342347))

(assert (=> bm!26441 m!342269))

(declare-fun m!342349 () Bool)

(assert (=> bm!26441 m!342349))

(assert (=> b!338757 d!70853))

(declare-fun b!338974 () Bool)

(declare-fun e!207972 () SeekEntryResult!3201)

(declare-fun lt!161053 () SeekEntryResult!3201)

(assert (=> b!338974 (= e!207972 (Found!3201 (index!14985 lt!161053)))))

(declare-fun b!338975 () Bool)

(declare-fun e!207974 () SeekEntryResult!3201)

(assert (=> b!338975 (= e!207974 Undefined!3201)))

(declare-fun b!338976 () Bool)

(declare-fun c!52473 () Bool)

(declare-fun lt!161052 () (_ BitVec 64))

(assert (=> b!338976 (= c!52473 (= lt!161052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!207973 () SeekEntryResult!3201)

(assert (=> b!338976 (= e!207972 e!207973)))

(declare-fun b!338977 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17742 (_ BitVec 32)) SeekEntryResult!3201)

(assert (=> b!338977 (= e!207973 (seekKeyOrZeroReturnVacant!0 (x!33710 lt!161053) (index!14985 lt!161053) (index!14985 lt!161053) k0!1348 _keys!1895 mask!2385))))

(declare-fun d!70855 () Bool)

(declare-fun lt!161051 () SeekEntryResult!3201)

(assert (=> d!70855 (and (or ((_ is Undefined!3201) lt!161051) (not ((_ is Found!3201) lt!161051)) (and (bvsge (index!14984 lt!161051) #b00000000000000000000000000000000) (bvslt (index!14984 lt!161051) (size!8748 _keys!1895)))) (or ((_ is Undefined!3201) lt!161051) ((_ is Found!3201) lt!161051) (not ((_ is MissingZero!3201) lt!161051)) (and (bvsge (index!14983 lt!161051) #b00000000000000000000000000000000) (bvslt (index!14983 lt!161051) (size!8748 _keys!1895)))) (or ((_ is Undefined!3201) lt!161051) ((_ is Found!3201) lt!161051) ((_ is MissingZero!3201) lt!161051) (not ((_ is MissingVacant!3201) lt!161051)) (and (bvsge (index!14986 lt!161051) #b00000000000000000000000000000000) (bvslt (index!14986 lt!161051) (size!8748 _keys!1895)))) (or ((_ is Undefined!3201) lt!161051) (ite ((_ is Found!3201) lt!161051) (= (select (arr!8396 _keys!1895) (index!14984 lt!161051)) k0!1348) (ite ((_ is MissingZero!3201) lt!161051) (= (select (arr!8396 _keys!1895) (index!14983 lt!161051)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3201) lt!161051) (= (select (arr!8396 _keys!1895) (index!14986 lt!161051)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70855 (= lt!161051 e!207974)))

(declare-fun c!52474 () Bool)

(assert (=> d!70855 (= c!52474 (and ((_ is Intermediate!3201) lt!161053) (undefined!4013 lt!161053)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17742 (_ BitVec 32)) SeekEntryResult!3201)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70855 (= lt!161053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70855 (validMask!0 mask!2385)))

(assert (=> d!70855 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161051)))

(declare-fun b!338978 () Bool)

(assert (=> b!338978 (= e!207974 e!207972)))

(assert (=> b!338978 (= lt!161052 (select (arr!8396 _keys!1895) (index!14985 lt!161053)))))

(declare-fun c!52475 () Bool)

(assert (=> b!338978 (= c!52475 (= lt!161052 k0!1348))))

(declare-fun b!338979 () Bool)

(assert (=> b!338979 (= e!207973 (MissingZero!3201 (index!14985 lt!161053)))))

(assert (= (and d!70855 c!52474) b!338975))

(assert (= (and d!70855 (not c!52474)) b!338978))

(assert (= (and b!338978 c!52475) b!338974))

(assert (= (and b!338978 (not c!52475)) b!338976))

(assert (= (and b!338976 c!52473) b!338979))

(assert (= (and b!338976 (not c!52473)) b!338977))

(declare-fun m!342351 () Bool)

(assert (=> b!338977 m!342351))

(declare-fun m!342353 () Bool)

(assert (=> d!70855 m!342353))

(declare-fun m!342355 () Bool)

(assert (=> d!70855 m!342355))

(declare-fun m!342357 () Bool)

(assert (=> d!70855 m!342357))

(assert (=> d!70855 m!342355))

(declare-fun m!342359 () Bool)

(assert (=> d!70855 m!342359))

(declare-fun m!342361 () Bool)

(assert (=> d!70855 m!342361))

(assert (=> d!70855 m!342199))

(declare-fun m!342363 () Bool)

(assert (=> b!338978 m!342363))

(assert (=> b!338762 d!70855))

(declare-fun b!338986 () Bool)

(declare-fun e!207979 () Bool)

(assert (=> b!338986 (= e!207979 tp_is_empty!7081)))

(declare-fun b!338987 () Bool)

(declare-fun e!207980 () Bool)

(assert (=> b!338987 (= e!207980 tp_is_empty!7081)))

(declare-fun mapNonEmpty!12042 () Bool)

(declare-fun mapRes!12042 () Bool)

(declare-fun tp!24921 () Bool)

(assert (=> mapNonEmpty!12042 (= mapRes!12042 (and tp!24921 e!207979))))

(declare-fun mapValue!12042 () ValueCell!3197)

(declare-fun mapKey!12042 () (_ BitVec 32))

(declare-fun mapRest!12042 () (Array (_ BitVec 32) ValueCell!3197))

(assert (=> mapNonEmpty!12042 (= mapRest!12033 (store mapRest!12042 mapKey!12042 mapValue!12042))))

(declare-fun condMapEmpty!12042 () Bool)

(declare-fun mapDefault!12042 () ValueCell!3197)

(assert (=> mapNonEmpty!12033 (= condMapEmpty!12042 (= mapRest!12033 ((as const (Array (_ BitVec 32) ValueCell!3197)) mapDefault!12042)))))

(assert (=> mapNonEmpty!12033 (= tp!24906 (and e!207980 mapRes!12042))))

(declare-fun mapIsEmpty!12042 () Bool)

(assert (=> mapIsEmpty!12042 mapRes!12042))

(assert (= (and mapNonEmpty!12033 condMapEmpty!12042) mapIsEmpty!12042))

(assert (= (and mapNonEmpty!12033 (not condMapEmpty!12042)) mapNonEmpty!12042))

(assert (= (and mapNonEmpty!12042 ((_ is ValueCellFull!3197) mapValue!12042)) b!338986))

(assert (= (and mapNonEmpty!12033 ((_ is ValueCellFull!3197) mapDefault!12042)) b!338987))

(declare-fun m!342365 () Bool)

(assert (=> mapNonEmpty!12042 m!342365))

(declare-fun b_lambda!8447 () Bool)

(assert (= b_lambda!8445 (or (and start!33984 b_free!7129) b_lambda!8447)))

(check-sat (not d!70831) (not b!338977) (not b_lambda!8447) (not b!338946) (not b!338864) (not bm!26432) (not d!70837) (not bm!26441) (not b!338937) (not bm!26434) (not b!338875) (not b_next!7129) (not b!338958) (not bm!26417) b_and!14339 (not bm!26435) (not b!338927) (not b!338863) (not mapNonEmpty!12042) (not b!338931) (not b!338922) (not d!70855) (not b!338925) (not b!338959) (not b!338934) (not b!338854) (not b!338938) tp_is_empty!7081 (not d!70839) (not bm!26433) (not b!338960) (not b!338926) (not b!338873))
(check-sat b_and!14339 (not b_next!7129))
