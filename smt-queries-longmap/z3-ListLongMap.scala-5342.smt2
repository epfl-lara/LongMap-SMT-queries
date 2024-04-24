; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71544 () Bool)

(assert start!71544)

(declare-fun b_free!13459 () Bool)

(declare-fun b_next!13459 () Bool)

(assert (=> start!71544 (= b_free!13459 (not b_next!13459))))

(declare-fun tp!47152 () Bool)

(declare-fun b_and!22451 () Bool)

(assert (=> start!71544 (= tp!47152 b_and!22451)))

(declare-fun b!829875 () Bool)

(declare-fun e!462598 () Bool)

(declare-fun tp_is_empty!15169 () Bool)

(assert (=> b!829875 (= e!462598 tp_is_empty!15169)))

(declare-fun res!565149 () Bool)

(declare-fun e!462599 () Bool)

(assert (=> start!71544 (=> (not res!565149) (not e!462599))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71544 (= res!565149 (validMask!0 mask!1312))))

(assert (=> start!71544 e!462599))

(assert (=> start!71544 tp_is_empty!15169))

(declare-datatypes ((array!46515 0))(
  ( (array!46516 (arr!22293 (Array (_ BitVec 32) (_ BitVec 64))) (size!22713 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46515)

(declare-fun array_inv!17801 (array!46515) Bool)

(assert (=> start!71544 (array_inv!17801 _keys!976)))

(assert (=> start!71544 true))

(declare-datatypes ((V!25227 0))(
  ( (V!25228 (val!7632 Int)) )
))
(declare-datatypes ((ValueCell!7169 0))(
  ( (ValueCellFull!7169 (v!10070 V!25227)) (EmptyCell!7169) )
))
(declare-datatypes ((array!46517 0))(
  ( (array!46518 (arr!22294 (Array (_ BitVec 32) ValueCell!7169)) (size!22714 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46517)

(declare-fun e!462595 () Bool)

(declare-fun array_inv!17802 (array!46517) Bool)

(assert (=> start!71544 (and (array_inv!17802 _values!788) e!462595)))

(assert (=> start!71544 tp!47152))

(declare-fun b!829876 () Bool)

(declare-fun e!462600 () Bool)

(assert (=> b!829876 (= e!462599 (not e!462600))))

(declare-fun res!565148 () Bool)

(assert (=> b!829876 (=> res!565148 e!462600)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829876 (= res!565148 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10046 0))(
  ( (tuple2!10047 (_1!5034 (_ BitVec 64)) (_2!5034 V!25227)) )
))
(declare-datatypes ((List!15820 0))(
  ( (Nil!15817) (Cons!15816 (h!16951 tuple2!10046) (t!22169 List!15820)) )
))
(declare-datatypes ((ListLongMap!8871 0))(
  ( (ListLongMap!8872 (toList!4451 List!15820)) )
))
(declare-fun lt!376153 () ListLongMap!8871)

(declare-fun lt!376152 () ListLongMap!8871)

(assert (=> b!829876 (= lt!376153 lt!376152)))

(declare-fun zeroValueBefore!34 () V!25227)

(declare-fun zeroValueAfter!34 () V!25227)

(declare-fun minValue!754 () V!25227)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28418 0))(
  ( (Unit!28419) )
))
(declare-fun lt!376151 () Unit!28418)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!593 (array!46515 array!46517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25227 V!25227 V!25227 V!25227 (_ BitVec 32) Int) Unit!28418)

(assert (=> b!829876 (= lt!376151 (lemmaNoChangeToArrayThenSameMapNoExtras!593 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2526 (array!46515 array!46517 (_ BitVec 32) (_ BitVec 32) V!25227 V!25227 (_ BitVec 32) Int) ListLongMap!8871)

(assert (=> b!829876 (= lt!376152 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829876 (= lt!376153 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829877 () Bool)

(declare-fun mapRes!24394 () Bool)

(assert (=> b!829877 (= e!462595 (and e!462598 mapRes!24394))))

(declare-fun condMapEmpty!24394 () Bool)

(declare-fun mapDefault!24394 () ValueCell!7169)

(assert (=> b!829877 (= condMapEmpty!24394 (= (arr!22294 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7169)) mapDefault!24394)))))

(declare-fun b!829878 () Bool)

(declare-fun res!565151 () Bool)

(assert (=> b!829878 (=> (not res!565151) (not e!462599))))

(declare-datatypes ((List!15821 0))(
  ( (Nil!15818) (Cons!15817 (h!16952 (_ BitVec 64)) (t!22170 List!15821)) )
))
(declare-fun arrayNoDuplicates!0 (array!46515 (_ BitVec 32) List!15821) Bool)

(assert (=> b!829878 (= res!565151 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15818))))

(declare-fun b!829879 () Bool)

(declare-fun e!462597 () Bool)

(assert (=> b!829879 (= e!462597 tp_is_empty!15169)))

(declare-fun b!829880 () Bool)

(declare-fun getCurrentListMap!2546 (array!46515 array!46517 (_ BitVec 32) (_ BitVec 32) V!25227 V!25227 (_ BitVec 32) Int) ListLongMap!8871)

(declare-fun +!1974 (ListLongMap!8871 tuple2!10046) ListLongMap!8871)

(assert (=> b!829880 (= e!462600 (= (getCurrentListMap!2546 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1974 lt!376153 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376150 () ListLongMap!8871)

(assert (=> b!829880 (= lt!376150 (getCurrentListMap!2546 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24394 () Bool)

(assert (=> mapIsEmpty!24394 mapRes!24394))

(declare-fun b!829881 () Bool)

(declare-fun res!565150 () Bool)

(assert (=> b!829881 (=> (not res!565150) (not e!462599))))

(assert (=> b!829881 (= res!565150 (and (= (size!22714 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22713 _keys!976) (size!22714 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!24394 () Bool)

(declare-fun tp!47151 () Bool)

(assert (=> mapNonEmpty!24394 (= mapRes!24394 (and tp!47151 e!462597))))

(declare-fun mapRest!24394 () (Array (_ BitVec 32) ValueCell!7169))

(declare-fun mapValue!24394 () ValueCell!7169)

(declare-fun mapKey!24394 () (_ BitVec 32))

(assert (=> mapNonEmpty!24394 (= (arr!22294 _values!788) (store mapRest!24394 mapKey!24394 mapValue!24394))))

(declare-fun b!829882 () Bool)

(declare-fun res!565152 () Bool)

(assert (=> b!829882 (=> (not res!565152) (not e!462599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46515 (_ BitVec 32)) Bool)

(assert (=> b!829882 (= res!565152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71544 res!565149) b!829881))

(assert (= (and b!829881 res!565150) b!829882))

(assert (= (and b!829882 res!565152) b!829878))

(assert (= (and b!829878 res!565151) b!829876))

(assert (= (and b!829876 (not res!565148)) b!829880))

(assert (= (and b!829877 condMapEmpty!24394) mapIsEmpty!24394))

(assert (= (and b!829877 (not condMapEmpty!24394)) mapNonEmpty!24394))

(get-info :version)

(assert (= (and mapNonEmpty!24394 ((_ is ValueCellFull!7169) mapValue!24394)) b!829879))

(assert (= (and b!829877 ((_ is ValueCellFull!7169) mapDefault!24394)) b!829875))

(assert (= start!71544 b!829877))

(declare-fun m!773247 () Bool)

(assert (=> b!829880 m!773247))

(declare-fun m!773249 () Bool)

(assert (=> b!829880 m!773249))

(declare-fun m!773251 () Bool)

(assert (=> b!829880 m!773251))

(declare-fun m!773253 () Bool)

(assert (=> b!829878 m!773253))

(declare-fun m!773255 () Bool)

(assert (=> b!829876 m!773255))

(declare-fun m!773257 () Bool)

(assert (=> b!829876 m!773257))

(declare-fun m!773259 () Bool)

(assert (=> b!829876 m!773259))

(declare-fun m!773261 () Bool)

(assert (=> mapNonEmpty!24394 m!773261))

(declare-fun m!773263 () Bool)

(assert (=> b!829882 m!773263))

(declare-fun m!773265 () Bool)

(assert (=> start!71544 m!773265))

(declare-fun m!773267 () Bool)

(assert (=> start!71544 m!773267))

(declare-fun m!773269 () Bool)

(assert (=> start!71544 m!773269))

(check-sat (not start!71544) (not b!829878) b_and!22451 (not b_next!13459) tp_is_empty!15169 (not b!829880) (not mapNonEmpty!24394) (not b!829876) (not b!829882))
(check-sat b_and!22451 (not b_next!13459))
(get-model)

(declare-fun b!829941 () Bool)

(declare-fun e!462645 () Bool)

(declare-fun e!462648 () Bool)

(assert (=> b!829941 (= e!462645 e!462648)))

(declare-fun res!565189 () Bool)

(assert (=> b!829941 (=> (not res!565189) (not e!462648))))

(declare-fun e!462647 () Bool)

(assert (=> b!829941 (= res!565189 (not e!462647))))

(declare-fun res!565191 () Bool)

(assert (=> b!829941 (=> (not res!565191) (not e!462647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!829941 (= res!565191 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829942 () Bool)

(declare-fun e!462646 () Bool)

(declare-fun call!36118 () Bool)

(assert (=> b!829942 (= e!462646 call!36118)))

(declare-fun bm!36115 () Bool)

(declare-fun c!89962 () Bool)

(assert (=> bm!36115 (= call!36118 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89962 (Cons!15817 (select (arr!22293 _keys!976) #b00000000000000000000000000000000) Nil!15818) Nil!15818)))))

(declare-fun b!829943 () Bool)

(assert (=> b!829943 (= e!462648 e!462646)))

(assert (=> b!829943 (= c!89962 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105545 () Bool)

(declare-fun res!565190 () Bool)

(assert (=> d!105545 (=> res!565190 e!462645)))

(assert (=> d!105545 (= res!565190 (bvsge #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(assert (=> d!105545 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15818) e!462645)))

(declare-fun b!829944 () Bool)

(declare-fun contains!4174 (List!15821 (_ BitVec 64)) Bool)

(assert (=> b!829944 (= e!462647 (contains!4174 Nil!15818 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829945 () Bool)

(assert (=> b!829945 (= e!462646 call!36118)))

(assert (= (and d!105545 (not res!565190)) b!829941))

(assert (= (and b!829941 res!565191) b!829944))

(assert (= (and b!829941 res!565189) b!829943))

(assert (= (and b!829943 c!89962) b!829945))

(assert (= (and b!829943 (not c!89962)) b!829942))

(assert (= (or b!829945 b!829942) bm!36115))

(declare-fun m!773319 () Bool)

(assert (=> b!829941 m!773319))

(assert (=> b!829941 m!773319))

(declare-fun m!773321 () Bool)

(assert (=> b!829941 m!773321))

(assert (=> bm!36115 m!773319))

(declare-fun m!773323 () Bool)

(assert (=> bm!36115 m!773323))

(assert (=> b!829943 m!773319))

(assert (=> b!829943 m!773319))

(assert (=> b!829943 m!773321))

(assert (=> b!829944 m!773319))

(assert (=> b!829944 m!773319))

(declare-fun m!773325 () Bool)

(assert (=> b!829944 m!773325))

(assert (=> b!829878 d!105545))

(declare-fun b!829954 () Bool)

(declare-fun e!462657 () Bool)

(declare-fun e!462655 () Bool)

(assert (=> b!829954 (= e!462657 e!462655)))

(declare-fun c!89965 () Bool)

(assert (=> b!829954 (= c!89965 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105547 () Bool)

(declare-fun res!565197 () Bool)

(assert (=> d!105547 (=> res!565197 e!462657)))

(assert (=> d!105547 (= res!565197 (bvsge #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(assert (=> d!105547 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462657)))

(declare-fun b!829955 () Bool)

(declare-fun call!36121 () Bool)

(assert (=> b!829955 (= e!462655 call!36121)))

(declare-fun b!829956 () Bool)

(declare-fun e!462656 () Bool)

(assert (=> b!829956 (= e!462656 call!36121)))

(declare-fun bm!36118 () Bool)

(assert (=> bm!36118 (= call!36121 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!829957 () Bool)

(assert (=> b!829957 (= e!462655 e!462656)))

(declare-fun lt!376184 () (_ BitVec 64))

(assert (=> b!829957 (= lt!376184 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376185 () Unit!28418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46515 (_ BitVec 64) (_ BitVec 32)) Unit!28418)

(assert (=> b!829957 (= lt!376185 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376184 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!829957 (arrayContainsKey!0 _keys!976 lt!376184 #b00000000000000000000000000000000)))

(declare-fun lt!376186 () Unit!28418)

(assert (=> b!829957 (= lt!376186 lt!376185)))

(declare-fun res!565196 () Bool)

(declare-datatypes ((SeekEntryResult!8691 0))(
  ( (MissingZero!8691 (index!37135 (_ BitVec 32))) (Found!8691 (index!37136 (_ BitVec 32))) (Intermediate!8691 (undefined!9503 Bool) (index!37137 (_ BitVec 32)) (x!69978 (_ BitVec 32))) (Undefined!8691) (MissingVacant!8691 (index!37138 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46515 (_ BitVec 32)) SeekEntryResult!8691)

(assert (=> b!829957 (= res!565196 (= (seekEntryOrOpen!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8691 #b00000000000000000000000000000000)))))

(assert (=> b!829957 (=> (not res!565196) (not e!462656))))

(assert (= (and d!105547 (not res!565197)) b!829954))

(assert (= (and b!829954 c!89965) b!829957))

(assert (= (and b!829954 (not c!89965)) b!829955))

(assert (= (and b!829957 res!565196) b!829956))

(assert (= (or b!829956 b!829955) bm!36118))

(assert (=> b!829954 m!773319))

(assert (=> b!829954 m!773319))

(assert (=> b!829954 m!773321))

(declare-fun m!773327 () Bool)

(assert (=> bm!36118 m!773327))

(assert (=> b!829957 m!773319))

(declare-fun m!773329 () Bool)

(assert (=> b!829957 m!773329))

(declare-fun m!773331 () Bool)

(assert (=> b!829957 m!773331))

(assert (=> b!829957 m!773319))

(declare-fun m!773333 () Bool)

(assert (=> b!829957 m!773333))

(assert (=> b!829882 d!105547))

(declare-fun d!105549 () Bool)

(assert (=> d!105549 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71544 d!105549))

(declare-fun d!105551 () Bool)

(assert (=> d!105551 (= (array_inv!17801 _keys!976) (bvsge (size!22713 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71544 d!105551))

(declare-fun d!105553 () Bool)

(assert (=> d!105553 (= (array_inv!17802 _values!788) (bvsge (size!22714 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71544 d!105553))

(declare-fun b!830000 () Bool)

(declare-fun e!462696 () Unit!28418)

(declare-fun Unit!28420 () Unit!28418)

(assert (=> b!830000 (= e!462696 Unit!28420)))

(declare-fun b!830001 () Bool)

(declare-fun res!565221 () Bool)

(declare-fun e!462694 () Bool)

(assert (=> b!830001 (=> (not res!565221) (not e!462694))))

(declare-fun e!462686 () Bool)

(assert (=> b!830001 (= res!565221 e!462686)))

(declare-fun res!565217 () Bool)

(assert (=> b!830001 (=> res!565217 e!462686)))

(declare-fun e!462695 () Bool)

(assert (=> b!830001 (= res!565217 (not e!462695))))

(declare-fun res!565216 () Bool)

(assert (=> b!830001 (=> (not res!565216) (not e!462695))))

(assert (=> b!830001 (= res!565216 (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(declare-fun b!830002 () Bool)

(declare-fun e!462685 () Bool)

(assert (=> b!830002 (= e!462694 e!462685)))

(declare-fun c!89980 () Bool)

(assert (=> b!830002 (= c!89980 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830003 () Bool)

(declare-fun e!462687 () ListLongMap!8871)

(declare-fun e!462691 () ListLongMap!8871)

(assert (=> b!830003 (= e!462687 e!462691)))

(declare-fun c!89978 () Bool)

(assert (=> b!830003 (= c!89978 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830004 () Bool)

(declare-fun e!462693 () Bool)

(declare-fun e!462684 () Bool)

(assert (=> b!830004 (= e!462693 e!462684)))

(declare-fun res!565222 () Bool)

(declare-fun call!36136 () Bool)

(assert (=> b!830004 (= res!565222 call!36136)))

(assert (=> b!830004 (=> (not res!565222) (not e!462684))))

(declare-fun b!830005 () Bool)

(declare-fun c!89981 () Bool)

(assert (=> b!830005 (= c!89981 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462690 () ListLongMap!8871)

(assert (=> b!830005 (= e!462691 e!462690)))

(declare-fun bm!36133 () Bool)

(declare-fun call!36139 () ListLongMap!8871)

(declare-fun call!36137 () ListLongMap!8871)

(assert (=> bm!36133 (= call!36139 call!36137)))

(declare-fun b!830006 () Bool)

(declare-fun call!36140 () Bool)

(assert (=> b!830006 (= e!462685 (not call!36140))))

(declare-fun bm!36134 () Bool)

(declare-fun lt!376248 () ListLongMap!8871)

(declare-fun contains!4175 (ListLongMap!8871 (_ BitVec 64)) Bool)

(assert (=> bm!36134 (= call!36136 (contains!4175 lt!376248 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!36138 () ListLongMap!8871)

(declare-fun c!89983 () Bool)

(declare-fun call!36142 () ListLongMap!8871)

(declare-fun call!36141 () ListLongMap!8871)

(declare-fun bm!36135 () Bool)

(assert (=> bm!36135 (= call!36137 (+!1974 (ite c!89983 call!36142 (ite c!89978 call!36138 call!36141)) (ite (or c!89983 c!89978) (tuple2!10047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36136 () Bool)

(assert (=> bm!36136 (= call!36142 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830007 () Bool)

(assert (=> b!830007 (= e!462690 call!36139)))

(declare-fun d!105555 () Bool)

(assert (=> d!105555 e!462694))

(declare-fun res!565220 () Bool)

(assert (=> d!105555 (=> (not res!565220) (not e!462694))))

(assert (=> d!105555 (= res!565220 (or (bvsge #b00000000000000000000000000000000 (size!22713 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))))

(declare-fun lt!376244 () ListLongMap!8871)

(assert (=> d!105555 (= lt!376248 lt!376244)))

(declare-fun lt!376236 () Unit!28418)

(assert (=> d!105555 (= lt!376236 e!462696)))

(declare-fun c!89982 () Bool)

(declare-fun e!462688 () Bool)

(assert (=> d!105555 (= c!89982 e!462688)))

(declare-fun res!565224 () Bool)

(assert (=> d!105555 (=> (not res!565224) (not e!462688))))

(assert (=> d!105555 (= res!565224 (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(assert (=> d!105555 (= lt!376244 e!462687)))

(assert (=> d!105555 (= c!89983 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105555 (validMask!0 mask!1312)))

(assert (=> d!105555 (= (getCurrentListMap!2546 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376248)))

(declare-fun b!830008 () Bool)

(declare-fun lt!376240 () Unit!28418)

(assert (=> b!830008 (= e!462696 lt!376240)))

(declare-fun lt!376241 () ListLongMap!8871)

(assert (=> b!830008 (= lt!376241 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376238 () (_ BitVec 64))

(assert (=> b!830008 (= lt!376238 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376246 () (_ BitVec 64))

(assert (=> b!830008 (= lt!376246 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376233 () Unit!28418)

(declare-fun addStillContains!319 (ListLongMap!8871 (_ BitVec 64) V!25227 (_ BitVec 64)) Unit!28418)

(assert (=> b!830008 (= lt!376233 (addStillContains!319 lt!376241 lt!376238 zeroValueBefore!34 lt!376246))))

(assert (=> b!830008 (contains!4175 (+!1974 lt!376241 (tuple2!10047 lt!376238 zeroValueBefore!34)) lt!376246)))

(declare-fun lt!376245 () Unit!28418)

(assert (=> b!830008 (= lt!376245 lt!376233)))

(declare-fun lt!376243 () ListLongMap!8871)

(assert (=> b!830008 (= lt!376243 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376250 () (_ BitVec 64))

(assert (=> b!830008 (= lt!376250 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376231 () (_ BitVec 64))

(assert (=> b!830008 (= lt!376231 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376232 () Unit!28418)

(declare-fun addApplyDifferent!319 (ListLongMap!8871 (_ BitVec 64) V!25227 (_ BitVec 64)) Unit!28418)

(assert (=> b!830008 (= lt!376232 (addApplyDifferent!319 lt!376243 lt!376250 minValue!754 lt!376231))))

(declare-fun apply!368 (ListLongMap!8871 (_ BitVec 64)) V!25227)

(assert (=> b!830008 (= (apply!368 (+!1974 lt!376243 (tuple2!10047 lt!376250 minValue!754)) lt!376231) (apply!368 lt!376243 lt!376231))))

(declare-fun lt!376242 () Unit!28418)

(assert (=> b!830008 (= lt!376242 lt!376232)))

(declare-fun lt!376252 () ListLongMap!8871)

(assert (=> b!830008 (= lt!376252 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376237 () (_ BitVec 64))

(assert (=> b!830008 (= lt!376237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376247 () (_ BitVec 64))

(assert (=> b!830008 (= lt!376247 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376234 () Unit!28418)

(assert (=> b!830008 (= lt!376234 (addApplyDifferent!319 lt!376252 lt!376237 zeroValueBefore!34 lt!376247))))

(assert (=> b!830008 (= (apply!368 (+!1974 lt!376252 (tuple2!10047 lt!376237 zeroValueBefore!34)) lt!376247) (apply!368 lt!376252 lt!376247))))

(declare-fun lt!376235 () Unit!28418)

(assert (=> b!830008 (= lt!376235 lt!376234)))

(declare-fun lt!376239 () ListLongMap!8871)

(assert (=> b!830008 (= lt!376239 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376249 () (_ BitVec 64))

(assert (=> b!830008 (= lt!376249 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376251 () (_ BitVec 64))

(assert (=> b!830008 (= lt!376251 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830008 (= lt!376240 (addApplyDifferent!319 lt!376239 lt!376249 minValue!754 lt!376251))))

(assert (=> b!830008 (= (apply!368 (+!1974 lt!376239 (tuple2!10047 lt!376249 minValue!754)) lt!376251) (apply!368 lt!376239 lt!376251))))

(declare-fun b!830009 () Bool)

(assert (=> b!830009 (= e!462688 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830010 () Bool)

(assert (=> b!830010 (= e!462695 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830011 () Bool)

(declare-fun e!462689 () Bool)

(assert (=> b!830011 (= e!462689 (= (apply!368 lt!376248 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!830012 () Bool)

(declare-fun e!462692 () Bool)

(assert (=> b!830012 (= e!462686 e!462692)))

(declare-fun res!565218 () Bool)

(assert (=> b!830012 (=> (not res!565218) (not e!462692))))

(assert (=> b!830012 (= res!565218 (contains!4175 lt!376248 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830012 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(declare-fun bm!36137 () Bool)

(assert (=> bm!36137 (= call!36141 call!36138)))

(declare-fun b!830013 () Bool)

(declare-fun res!565223 () Bool)

(assert (=> b!830013 (=> (not res!565223) (not e!462694))))

(assert (=> b!830013 (= res!565223 e!462693)))

(declare-fun c!89979 () Bool)

(assert (=> b!830013 (= c!89979 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830014 () Bool)

(declare-fun get!11804 (ValueCell!7169 V!25227) V!25227)

(declare-fun dynLambda!976 (Int (_ BitVec 64)) V!25227)

(assert (=> b!830014 (= e!462692 (= (apply!368 lt!376248 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)) (get!11804 (select (arr!22294 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830014 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _values!788)))))

(assert (=> b!830014 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(declare-fun b!830015 () Bool)

(assert (=> b!830015 (= e!462693 (not call!36136))))

(declare-fun bm!36138 () Bool)

(assert (=> bm!36138 (= call!36138 call!36142)))

(declare-fun b!830016 () Bool)

(assert (=> b!830016 (= e!462684 (= (apply!368 lt!376248 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!830017 () Bool)

(assert (=> b!830017 (= e!462687 (+!1974 call!36137 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!830018 () Bool)

(assert (=> b!830018 (= e!462685 e!462689)))

(declare-fun res!565219 () Bool)

(assert (=> b!830018 (= res!565219 call!36140)))

(assert (=> b!830018 (=> (not res!565219) (not e!462689))))

(declare-fun bm!36139 () Bool)

(assert (=> bm!36139 (= call!36140 (contains!4175 lt!376248 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830019 () Bool)

(assert (=> b!830019 (= e!462691 call!36139)))

(declare-fun b!830020 () Bool)

(assert (=> b!830020 (= e!462690 call!36141)))

(assert (= (and d!105555 c!89983) b!830017))

(assert (= (and d!105555 (not c!89983)) b!830003))

(assert (= (and b!830003 c!89978) b!830019))

(assert (= (and b!830003 (not c!89978)) b!830005))

(assert (= (and b!830005 c!89981) b!830007))

(assert (= (and b!830005 (not c!89981)) b!830020))

(assert (= (or b!830007 b!830020) bm!36137))

(assert (= (or b!830019 bm!36137) bm!36138))

(assert (= (or b!830019 b!830007) bm!36133))

(assert (= (or b!830017 bm!36138) bm!36136))

(assert (= (or b!830017 bm!36133) bm!36135))

(assert (= (and d!105555 res!565224) b!830009))

(assert (= (and d!105555 c!89982) b!830008))

(assert (= (and d!105555 (not c!89982)) b!830000))

(assert (= (and d!105555 res!565220) b!830001))

(assert (= (and b!830001 res!565216) b!830010))

(assert (= (and b!830001 (not res!565217)) b!830012))

(assert (= (and b!830012 res!565218) b!830014))

(assert (= (and b!830001 res!565221) b!830013))

(assert (= (and b!830013 c!89979) b!830004))

(assert (= (and b!830013 (not c!89979)) b!830015))

(assert (= (and b!830004 res!565222) b!830016))

(assert (= (or b!830004 b!830015) bm!36134))

(assert (= (and b!830013 res!565223) b!830002))

(assert (= (and b!830002 c!89980) b!830018))

(assert (= (and b!830002 (not c!89980)) b!830006))

(assert (= (and b!830018 res!565219) b!830011))

(assert (= (or b!830018 b!830006) bm!36139))

(declare-fun b_lambda!11265 () Bool)

(assert (=> (not b_lambda!11265) (not b!830014)))

(declare-fun t!22174 () Bool)

(declare-fun tb!4209 () Bool)

(assert (=> (and start!71544 (= defaultEntry!796 defaultEntry!796) t!22174) tb!4209))

(declare-fun result!7983 () Bool)

(assert (=> tb!4209 (= result!7983 tp_is_empty!15169)))

(assert (=> b!830014 t!22174))

(declare-fun b_and!22457 () Bool)

(assert (= b_and!22451 (and (=> t!22174 result!7983) b_and!22457)))

(assert (=> b!830009 m!773319))

(assert (=> b!830009 m!773319))

(assert (=> b!830009 m!773321))

(assert (=> b!830012 m!773319))

(assert (=> b!830012 m!773319))

(declare-fun m!773335 () Bool)

(assert (=> b!830012 m!773335))

(declare-fun m!773337 () Bool)

(assert (=> bm!36134 m!773337))

(assert (=> d!105555 m!773265))

(assert (=> b!830014 m!773319))

(assert (=> b!830014 m!773319))

(declare-fun m!773339 () Bool)

(assert (=> b!830014 m!773339))

(declare-fun m!773341 () Bool)

(assert (=> b!830014 m!773341))

(declare-fun m!773343 () Bool)

(assert (=> b!830014 m!773343))

(assert (=> b!830014 m!773341))

(assert (=> b!830014 m!773343))

(declare-fun m!773345 () Bool)

(assert (=> b!830014 m!773345))

(declare-fun m!773347 () Bool)

(assert (=> b!830008 m!773347))

(declare-fun m!773349 () Bool)

(assert (=> b!830008 m!773349))

(declare-fun m!773351 () Bool)

(assert (=> b!830008 m!773351))

(declare-fun m!773353 () Bool)

(assert (=> b!830008 m!773353))

(declare-fun m!773355 () Bool)

(assert (=> b!830008 m!773355))

(declare-fun m!773357 () Bool)

(assert (=> b!830008 m!773357))

(declare-fun m!773359 () Bool)

(assert (=> b!830008 m!773359))

(declare-fun m!773361 () Bool)

(assert (=> b!830008 m!773361))

(declare-fun m!773363 () Bool)

(assert (=> b!830008 m!773363))

(declare-fun m!773365 () Bool)

(assert (=> b!830008 m!773365))

(assert (=> b!830008 m!773353))

(declare-fun m!773367 () Bool)

(assert (=> b!830008 m!773367))

(assert (=> b!830008 m!773347))

(assert (=> b!830008 m!773355))

(declare-fun m!773369 () Bool)

(assert (=> b!830008 m!773369))

(declare-fun m!773371 () Bool)

(assert (=> b!830008 m!773371))

(declare-fun m!773373 () Bool)

(assert (=> b!830008 m!773373))

(assert (=> b!830008 m!773319))

(declare-fun m!773375 () Bool)

(assert (=> b!830008 m!773375))

(assert (=> b!830008 m!773259))

(assert (=> b!830008 m!773371))

(declare-fun m!773377 () Bool)

(assert (=> b!830011 m!773377))

(declare-fun m!773379 () Bool)

(assert (=> bm!36139 m!773379))

(assert (=> bm!36136 m!773259))

(declare-fun m!773381 () Bool)

(assert (=> b!830017 m!773381))

(declare-fun m!773383 () Bool)

(assert (=> b!830016 m!773383))

(assert (=> b!830010 m!773319))

(assert (=> b!830010 m!773319))

(assert (=> b!830010 m!773321))

(declare-fun m!773385 () Bool)

(assert (=> bm!36135 m!773385))

(assert (=> b!829880 d!105555))

(declare-fun d!105557 () Bool)

(declare-fun e!462699 () Bool)

(assert (=> d!105557 e!462699))

(declare-fun res!565230 () Bool)

(assert (=> d!105557 (=> (not res!565230) (not e!462699))))

(declare-fun lt!376264 () ListLongMap!8871)

(assert (=> d!105557 (= res!565230 (contains!4175 lt!376264 (_1!5034 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376263 () List!15820)

(assert (=> d!105557 (= lt!376264 (ListLongMap!8872 lt!376263))))

(declare-fun lt!376262 () Unit!28418)

(declare-fun lt!376261 () Unit!28418)

(assert (=> d!105557 (= lt!376262 lt!376261)))

(declare-datatypes ((Option!418 0))(
  ( (Some!417 (v!10073 V!25227)) (None!416) )
))
(declare-fun getValueByKey!412 (List!15820 (_ BitVec 64)) Option!418)

(assert (=> d!105557 (= (getValueByKey!412 lt!376263 (_1!5034 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!417 (_2!5034 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lemmaContainsTupThenGetReturnValue!226 (List!15820 (_ BitVec 64) V!25227) Unit!28418)

(assert (=> d!105557 (= lt!376261 (lemmaContainsTupThenGetReturnValue!226 lt!376263 (_1!5034 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5034 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun insertStrictlySorted!265 (List!15820 (_ BitVec 64) V!25227) List!15820)

(assert (=> d!105557 (= lt!376263 (insertStrictlySorted!265 (toList!4451 lt!376153) (_1!5034 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5034 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105557 (= (+!1974 lt!376153 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376264)))

(declare-fun b!830027 () Bool)

(declare-fun res!565229 () Bool)

(assert (=> b!830027 (=> (not res!565229) (not e!462699))))

(assert (=> b!830027 (= res!565229 (= (getValueByKey!412 (toList!4451 lt!376264) (_1!5034 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!417 (_2!5034 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830028 () Bool)

(declare-fun contains!4176 (List!15820 tuple2!10046) Bool)

(assert (=> b!830028 (= e!462699 (contains!4176 (toList!4451 lt!376264) (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105557 res!565230) b!830027))

(assert (= (and b!830027 res!565229) b!830028))

(declare-fun m!773387 () Bool)

(assert (=> d!105557 m!773387))

(declare-fun m!773389 () Bool)

(assert (=> d!105557 m!773389))

(declare-fun m!773391 () Bool)

(assert (=> d!105557 m!773391))

(declare-fun m!773393 () Bool)

(assert (=> d!105557 m!773393))

(declare-fun m!773395 () Bool)

(assert (=> b!830027 m!773395))

(declare-fun m!773397 () Bool)

(assert (=> b!830028 m!773397))

(assert (=> b!829880 d!105557))

(declare-fun b!830029 () Bool)

(declare-fun e!462712 () Unit!28418)

(declare-fun Unit!28421 () Unit!28418)

(assert (=> b!830029 (= e!462712 Unit!28421)))

(declare-fun b!830030 () Bool)

(declare-fun res!565236 () Bool)

(declare-fun e!462710 () Bool)

(assert (=> b!830030 (=> (not res!565236) (not e!462710))))

(declare-fun e!462702 () Bool)

(assert (=> b!830030 (= res!565236 e!462702)))

(declare-fun res!565232 () Bool)

(assert (=> b!830030 (=> res!565232 e!462702)))

(declare-fun e!462711 () Bool)

(assert (=> b!830030 (= res!565232 (not e!462711))))

(declare-fun res!565231 () Bool)

(assert (=> b!830030 (=> (not res!565231) (not e!462711))))

(assert (=> b!830030 (= res!565231 (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(declare-fun b!830031 () Bool)

(declare-fun e!462701 () Bool)

(assert (=> b!830031 (= e!462710 e!462701)))

(declare-fun c!89986 () Bool)

(assert (=> b!830031 (= c!89986 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830032 () Bool)

(declare-fun e!462703 () ListLongMap!8871)

(declare-fun e!462707 () ListLongMap!8871)

(assert (=> b!830032 (= e!462703 e!462707)))

(declare-fun c!89984 () Bool)

(assert (=> b!830032 (= c!89984 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830033 () Bool)

(declare-fun e!462709 () Bool)

(declare-fun e!462700 () Bool)

(assert (=> b!830033 (= e!462709 e!462700)))

(declare-fun res!565237 () Bool)

(declare-fun call!36143 () Bool)

(assert (=> b!830033 (= res!565237 call!36143)))

(assert (=> b!830033 (=> (not res!565237) (not e!462700))))

(declare-fun b!830034 () Bool)

(declare-fun c!89987 () Bool)

(assert (=> b!830034 (= c!89987 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462706 () ListLongMap!8871)

(assert (=> b!830034 (= e!462707 e!462706)))

(declare-fun bm!36140 () Bool)

(declare-fun call!36146 () ListLongMap!8871)

(declare-fun call!36144 () ListLongMap!8871)

(assert (=> bm!36140 (= call!36146 call!36144)))

(declare-fun b!830035 () Bool)

(declare-fun call!36147 () Bool)

(assert (=> b!830035 (= e!462701 (not call!36147))))

(declare-fun bm!36141 () Bool)

(declare-fun lt!376282 () ListLongMap!8871)

(assert (=> bm!36141 (= call!36143 (contains!4175 lt!376282 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!36148 () ListLongMap!8871)

(declare-fun call!36149 () ListLongMap!8871)

(declare-fun c!89989 () Bool)

(declare-fun call!36145 () ListLongMap!8871)

(declare-fun bm!36142 () Bool)

(assert (=> bm!36142 (= call!36144 (+!1974 (ite c!89989 call!36149 (ite c!89984 call!36145 call!36148)) (ite (or c!89989 c!89984) (tuple2!10047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36143 () Bool)

(assert (=> bm!36143 (= call!36149 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830036 () Bool)

(assert (=> b!830036 (= e!462706 call!36146)))

(declare-fun d!105559 () Bool)

(assert (=> d!105559 e!462710))

(declare-fun res!565235 () Bool)

(assert (=> d!105559 (=> (not res!565235) (not e!462710))))

(assert (=> d!105559 (= res!565235 (or (bvsge #b00000000000000000000000000000000 (size!22713 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))))

(declare-fun lt!376278 () ListLongMap!8871)

(assert (=> d!105559 (= lt!376282 lt!376278)))

(declare-fun lt!376270 () Unit!28418)

(assert (=> d!105559 (= lt!376270 e!462712)))

(declare-fun c!89988 () Bool)

(declare-fun e!462704 () Bool)

(assert (=> d!105559 (= c!89988 e!462704)))

(declare-fun res!565239 () Bool)

(assert (=> d!105559 (=> (not res!565239) (not e!462704))))

(assert (=> d!105559 (= res!565239 (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(assert (=> d!105559 (= lt!376278 e!462703)))

(assert (=> d!105559 (= c!89989 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105559 (validMask!0 mask!1312)))

(assert (=> d!105559 (= (getCurrentListMap!2546 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376282)))

(declare-fun b!830037 () Bool)

(declare-fun lt!376274 () Unit!28418)

(assert (=> b!830037 (= e!462712 lt!376274)))

(declare-fun lt!376275 () ListLongMap!8871)

(assert (=> b!830037 (= lt!376275 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376272 () (_ BitVec 64))

(assert (=> b!830037 (= lt!376272 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376280 () (_ BitVec 64))

(assert (=> b!830037 (= lt!376280 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376267 () Unit!28418)

(assert (=> b!830037 (= lt!376267 (addStillContains!319 lt!376275 lt!376272 zeroValueAfter!34 lt!376280))))

(assert (=> b!830037 (contains!4175 (+!1974 lt!376275 (tuple2!10047 lt!376272 zeroValueAfter!34)) lt!376280)))

(declare-fun lt!376279 () Unit!28418)

(assert (=> b!830037 (= lt!376279 lt!376267)))

(declare-fun lt!376277 () ListLongMap!8871)

(assert (=> b!830037 (= lt!376277 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376284 () (_ BitVec 64))

(assert (=> b!830037 (= lt!376284 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376265 () (_ BitVec 64))

(assert (=> b!830037 (= lt!376265 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376266 () Unit!28418)

(assert (=> b!830037 (= lt!376266 (addApplyDifferent!319 lt!376277 lt!376284 minValue!754 lt!376265))))

(assert (=> b!830037 (= (apply!368 (+!1974 lt!376277 (tuple2!10047 lt!376284 minValue!754)) lt!376265) (apply!368 lt!376277 lt!376265))))

(declare-fun lt!376276 () Unit!28418)

(assert (=> b!830037 (= lt!376276 lt!376266)))

(declare-fun lt!376286 () ListLongMap!8871)

(assert (=> b!830037 (= lt!376286 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376271 () (_ BitVec 64))

(assert (=> b!830037 (= lt!376271 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376281 () (_ BitVec 64))

(assert (=> b!830037 (= lt!376281 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376268 () Unit!28418)

(assert (=> b!830037 (= lt!376268 (addApplyDifferent!319 lt!376286 lt!376271 zeroValueAfter!34 lt!376281))))

(assert (=> b!830037 (= (apply!368 (+!1974 lt!376286 (tuple2!10047 lt!376271 zeroValueAfter!34)) lt!376281) (apply!368 lt!376286 lt!376281))))

(declare-fun lt!376269 () Unit!28418)

(assert (=> b!830037 (= lt!376269 lt!376268)))

(declare-fun lt!376273 () ListLongMap!8871)

(assert (=> b!830037 (= lt!376273 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376283 () (_ BitVec 64))

(assert (=> b!830037 (= lt!376283 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376285 () (_ BitVec 64))

(assert (=> b!830037 (= lt!376285 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830037 (= lt!376274 (addApplyDifferent!319 lt!376273 lt!376283 minValue!754 lt!376285))))

(assert (=> b!830037 (= (apply!368 (+!1974 lt!376273 (tuple2!10047 lt!376283 minValue!754)) lt!376285) (apply!368 lt!376273 lt!376285))))

(declare-fun b!830038 () Bool)

(assert (=> b!830038 (= e!462704 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830039 () Bool)

(assert (=> b!830039 (= e!462711 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830040 () Bool)

(declare-fun e!462705 () Bool)

(assert (=> b!830040 (= e!462705 (= (apply!368 lt!376282 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!830041 () Bool)

(declare-fun e!462708 () Bool)

(assert (=> b!830041 (= e!462702 e!462708)))

(declare-fun res!565233 () Bool)

(assert (=> b!830041 (=> (not res!565233) (not e!462708))))

(assert (=> b!830041 (= res!565233 (contains!4175 lt!376282 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830041 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(declare-fun bm!36144 () Bool)

(assert (=> bm!36144 (= call!36148 call!36145)))

(declare-fun b!830042 () Bool)

(declare-fun res!565238 () Bool)

(assert (=> b!830042 (=> (not res!565238) (not e!462710))))

(assert (=> b!830042 (= res!565238 e!462709)))

(declare-fun c!89985 () Bool)

(assert (=> b!830042 (= c!89985 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830043 () Bool)

(assert (=> b!830043 (= e!462708 (= (apply!368 lt!376282 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)) (get!11804 (select (arr!22294 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _values!788)))))

(assert (=> b!830043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(declare-fun b!830044 () Bool)

(assert (=> b!830044 (= e!462709 (not call!36143))))

(declare-fun bm!36145 () Bool)

(assert (=> bm!36145 (= call!36145 call!36149)))

(declare-fun b!830045 () Bool)

(assert (=> b!830045 (= e!462700 (= (apply!368 lt!376282 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!830046 () Bool)

(assert (=> b!830046 (= e!462703 (+!1974 call!36144 (tuple2!10047 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!830047 () Bool)

(assert (=> b!830047 (= e!462701 e!462705)))

(declare-fun res!565234 () Bool)

(assert (=> b!830047 (= res!565234 call!36147)))

(assert (=> b!830047 (=> (not res!565234) (not e!462705))))

(declare-fun bm!36146 () Bool)

(assert (=> bm!36146 (= call!36147 (contains!4175 lt!376282 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830048 () Bool)

(assert (=> b!830048 (= e!462707 call!36146)))

(declare-fun b!830049 () Bool)

(assert (=> b!830049 (= e!462706 call!36148)))

(assert (= (and d!105559 c!89989) b!830046))

(assert (= (and d!105559 (not c!89989)) b!830032))

(assert (= (and b!830032 c!89984) b!830048))

(assert (= (and b!830032 (not c!89984)) b!830034))

(assert (= (and b!830034 c!89987) b!830036))

(assert (= (and b!830034 (not c!89987)) b!830049))

(assert (= (or b!830036 b!830049) bm!36144))

(assert (= (or b!830048 bm!36144) bm!36145))

(assert (= (or b!830048 b!830036) bm!36140))

(assert (= (or b!830046 bm!36145) bm!36143))

(assert (= (or b!830046 bm!36140) bm!36142))

(assert (= (and d!105559 res!565239) b!830038))

(assert (= (and d!105559 c!89988) b!830037))

(assert (= (and d!105559 (not c!89988)) b!830029))

(assert (= (and d!105559 res!565235) b!830030))

(assert (= (and b!830030 res!565231) b!830039))

(assert (= (and b!830030 (not res!565232)) b!830041))

(assert (= (and b!830041 res!565233) b!830043))

(assert (= (and b!830030 res!565236) b!830042))

(assert (= (and b!830042 c!89985) b!830033))

(assert (= (and b!830042 (not c!89985)) b!830044))

(assert (= (and b!830033 res!565237) b!830045))

(assert (= (or b!830033 b!830044) bm!36141))

(assert (= (and b!830042 res!565238) b!830031))

(assert (= (and b!830031 c!89986) b!830047))

(assert (= (and b!830031 (not c!89986)) b!830035))

(assert (= (and b!830047 res!565234) b!830040))

(assert (= (or b!830047 b!830035) bm!36146))

(declare-fun b_lambda!11267 () Bool)

(assert (=> (not b_lambda!11267) (not b!830043)))

(assert (=> b!830043 t!22174))

(declare-fun b_and!22459 () Bool)

(assert (= b_and!22457 (and (=> t!22174 result!7983) b_and!22459)))

(assert (=> b!830038 m!773319))

(assert (=> b!830038 m!773319))

(assert (=> b!830038 m!773321))

(assert (=> b!830041 m!773319))

(assert (=> b!830041 m!773319))

(declare-fun m!773399 () Bool)

(assert (=> b!830041 m!773399))

(declare-fun m!773401 () Bool)

(assert (=> bm!36141 m!773401))

(assert (=> d!105559 m!773265))

(assert (=> b!830043 m!773319))

(assert (=> b!830043 m!773319))

(declare-fun m!773403 () Bool)

(assert (=> b!830043 m!773403))

(assert (=> b!830043 m!773341))

(assert (=> b!830043 m!773343))

(assert (=> b!830043 m!773341))

(assert (=> b!830043 m!773343))

(assert (=> b!830043 m!773345))

(declare-fun m!773405 () Bool)

(assert (=> b!830037 m!773405))

(declare-fun m!773407 () Bool)

(assert (=> b!830037 m!773407))

(declare-fun m!773409 () Bool)

(assert (=> b!830037 m!773409))

(declare-fun m!773411 () Bool)

(assert (=> b!830037 m!773411))

(declare-fun m!773413 () Bool)

(assert (=> b!830037 m!773413))

(declare-fun m!773415 () Bool)

(assert (=> b!830037 m!773415))

(declare-fun m!773417 () Bool)

(assert (=> b!830037 m!773417))

(declare-fun m!773419 () Bool)

(assert (=> b!830037 m!773419))

(declare-fun m!773421 () Bool)

(assert (=> b!830037 m!773421))

(declare-fun m!773423 () Bool)

(assert (=> b!830037 m!773423))

(assert (=> b!830037 m!773411))

(declare-fun m!773425 () Bool)

(assert (=> b!830037 m!773425))

(assert (=> b!830037 m!773405))

(assert (=> b!830037 m!773413))

(declare-fun m!773427 () Bool)

(assert (=> b!830037 m!773427))

(declare-fun m!773429 () Bool)

(assert (=> b!830037 m!773429))

(declare-fun m!773431 () Bool)

(assert (=> b!830037 m!773431))

(assert (=> b!830037 m!773319))

(declare-fun m!773433 () Bool)

(assert (=> b!830037 m!773433))

(assert (=> b!830037 m!773257))

(assert (=> b!830037 m!773429))

(declare-fun m!773435 () Bool)

(assert (=> b!830040 m!773435))

(declare-fun m!773437 () Bool)

(assert (=> bm!36146 m!773437))

(assert (=> bm!36143 m!773257))

(declare-fun m!773439 () Bool)

(assert (=> b!830046 m!773439))

(declare-fun m!773441 () Bool)

(assert (=> b!830045 m!773441))

(assert (=> b!830039 m!773319))

(assert (=> b!830039 m!773319))

(assert (=> b!830039 m!773321))

(declare-fun m!773443 () Bool)

(assert (=> bm!36142 m!773443))

(assert (=> b!829880 d!105559))

(declare-fun d!105561 () Bool)

(assert (=> d!105561 (= (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376289 () Unit!28418)

(declare-fun choose!1418 (array!46515 array!46517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25227 V!25227 V!25227 V!25227 (_ BitVec 32) Int) Unit!28418)

(assert (=> d!105561 (= lt!376289 (choose!1418 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105561 (validMask!0 mask!1312)))

(assert (=> d!105561 (= (lemmaNoChangeToArrayThenSameMapNoExtras!593 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376289)))

(declare-fun bs!23176 () Bool)

(assert (= bs!23176 d!105561))

(assert (=> bs!23176 m!773259))

(assert (=> bs!23176 m!773257))

(declare-fun m!773445 () Bool)

(assert (=> bs!23176 m!773445))

(assert (=> bs!23176 m!773265))

(assert (=> b!829876 d!105561))

(declare-fun b!830074 () Bool)

(declare-fun e!462731 () Bool)

(declare-fun e!462733 () Bool)

(assert (=> b!830074 (= e!462731 e!462733)))

(assert (=> b!830074 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(declare-fun res!565250 () Bool)

(declare-fun lt!376310 () ListLongMap!8871)

(assert (=> b!830074 (= res!565250 (contains!4175 lt!376310 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830074 (=> (not res!565250) (not e!462733))))

(declare-fun b!830075 () Bool)

(declare-fun e!462727 () ListLongMap!8871)

(declare-fun e!462729 () ListLongMap!8871)

(assert (=> b!830075 (= e!462727 e!462729)))

(declare-fun c!89998 () Bool)

(assert (=> b!830075 (= c!89998 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105563 () Bool)

(declare-fun e!462730 () Bool)

(assert (=> d!105563 e!462730))

(declare-fun res!565249 () Bool)

(assert (=> d!105563 (=> (not res!565249) (not e!462730))))

(assert (=> d!105563 (= res!565249 (not (contains!4175 lt!376310 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105563 (= lt!376310 e!462727)))

(declare-fun c!90001 () Bool)

(assert (=> d!105563 (= c!90001 (bvsge #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(assert (=> d!105563 (validMask!0 mask!1312)))

(assert (=> d!105563 (= (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376310)))

(declare-fun bm!36149 () Bool)

(declare-fun call!36152 () ListLongMap!8871)

(assert (=> bm!36149 (= call!36152 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830076 () Bool)

(assert (=> b!830076 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(assert (=> b!830076 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _values!788)))))

(assert (=> b!830076 (= e!462733 (= (apply!368 lt!376310 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)) (get!11804 (select (arr!22294 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830077 () Bool)

(declare-fun lt!376309 () Unit!28418)

(declare-fun lt!376308 () Unit!28418)

(assert (=> b!830077 (= lt!376309 lt!376308)))

(declare-fun lt!376306 () (_ BitVec 64))

(declare-fun lt!376307 () (_ BitVec 64))

(declare-fun lt!376304 () ListLongMap!8871)

(declare-fun lt!376305 () V!25227)

(assert (=> b!830077 (not (contains!4175 (+!1974 lt!376304 (tuple2!10047 lt!376307 lt!376305)) lt!376306))))

(declare-fun addStillNotContains!195 (ListLongMap!8871 (_ BitVec 64) V!25227 (_ BitVec 64)) Unit!28418)

(assert (=> b!830077 (= lt!376308 (addStillNotContains!195 lt!376304 lt!376307 lt!376305 lt!376306))))

(assert (=> b!830077 (= lt!376306 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830077 (= lt!376305 (get!11804 (select (arr!22294 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830077 (= lt!376307 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830077 (= lt!376304 call!36152)))

(assert (=> b!830077 (= e!462729 (+!1974 call!36152 (tuple2!10047 (select (arr!22293 _keys!976) #b00000000000000000000000000000000) (get!11804 (select (arr!22294 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830078 () Bool)

(declare-fun res!565251 () Bool)

(assert (=> b!830078 (=> (not res!565251) (not e!462730))))

(assert (=> b!830078 (= res!565251 (not (contains!4175 lt!376310 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830079 () Bool)

(declare-fun e!462732 () Bool)

(assert (=> b!830079 (= e!462731 e!462732)))

(declare-fun c!89999 () Bool)

(assert (=> b!830079 (= c!89999 (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(declare-fun b!830080 () Bool)

(declare-fun e!462728 () Bool)

(assert (=> b!830080 (= e!462728 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830080 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!830081 () Bool)

(assert (=> b!830081 (= e!462732 (= lt!376310 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830082 () Bool)

(declare-fun isEmpty!656 (ListLongMap!8871) Bool)

(assert (=> b!830082 (= e!462732 (isEmpty!656 lt!376310))))

(declare-fun b!830083 () Bool)

(assert (=> b!830083 (= e!462729 call!36152)))

(declare-fun b!830084 () Bool)

(assert (=> b!830084 (= e!462730 e!462731)))

(declare-fun c!90000 () Bool)

(assert (=> b!830084 (= c!90000 e!462728)))

(declare-fun res!565248 () Bool)

(assert (=> b!830084 (=> (not res!565248) (not e!462728))))

(assert (=> b!830084 (= res!565248 (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(declare-fun b!830085 () Bool)

(assert (=> b!830085 (= e!462727 (ListLongMap!8872 Nil!15817))))

(assert (= (and d!105563 c!90001) b!830085))

(assert (= (and d!105563 (not c!90001)) b!830075))

(assert (= (and b!830075 c!89998) b!830077))

(assert (= (and b!830075 (not c!89998)) b!830083))

(assert (= (or b!830077 b!830083) bm!36149))

(assert (= (and d!105563 res!565249) b!830078))

(assert (= (and b!830078 res!565251) b!830084))

(assert (= (and b!830084 res!565248) b!830080))

(assert (= (and b!830084 c!90000) b!830074))

(assert (= (and b!830084 (not c!90000)) b!830079))

(assert (= (and b!830074 res!565250) b!830076))

(assert (= (and b!830079 c!89999) b!830081))

(assert (= (and b!830079 (not c!89999)) b!830082))

(declare-fun b_lambda!11269 () Bool)

(assert (=> (not b_lambda!11269) (not b!830076)))

(assert (=> b!830076 t!22174))

(declare-fun b_and!22461 () Bool)

(assert (= b_and!22459 (and (=> t!22174 result!7983) b_and!22461)))

(declare-fun b_lambda!11271 () Bool)

(assert (=> (not b_lambda!11271) (not b!830077)))

(assert (=> b!830077 t!22174))

(declare-fun b_and!22463 () Bool)

(assert (= b_and!22461 (and (=> t!22174 result!7983) b_and!22463)))

(declare-fun m!773447 () Bool)

(assert (=> b!830081 m!773447))

(assert (=> b!830080 m!773319))

(assert (=> b!830080 m!773319))

(assert (=> b!830080 m!773321))

(assert (=> bm!36149 m!773447))

(declare-fun m!773449 () Bool)

(assert (=> b!830082 m!773449))

(declare-fun m!773451 () Bool)

(assert (=> d!105563 m!773451))

(assert (=> d!105563 m!773265))

(assert (=> b!830075 m!773319))

(assert (=> b!830075 m!773319))

(assert (=> b!830075 m!773321))

(declare-fun m!773453 () Bool)

(assert (=> b!830078 m!773453))

(assert (=> b!830074 m!773319))

(assert (=> b!830074 m!773319))

(declare-fun m!773455 () Bool)

(assert (=> b!830074 m!773455))

(assert (=> b!830077 m!773341))

(assert (=> b!830077 m!773343))

(assert (=> b!830077 m!773345))

(declare-fun m!773457 () Bool)

(assert (=> b!830077 m!773457))

(declare-fun m!773459 () Bool)

(assert (=> b!830077 m!773459))

(declare-fun m!773461 () Bool)

(assert (=> b!830077 m!773461))

(declare-fun m!773463 () Bool)

(assert (=> b!830077 m!773463))

(assert (=> b!830077 m!773319))

(assert (=> b!830077 m!773341))

(assert (=> b!830077 m!773457))

(assert (=> b!830077 m!773343))

(assert (=> b!830076 m!773341))

(assert (=> b!830076 m!773343))

(assert (=> b!830076 m!773345))

(assert (=> b!830076 m!773319))

(declare-fun m!773465 () Bool)

(assert (=> b!830076 m!773465))

(assert (=> b!830076 m!773319))

(assert (=> b!830076 m!773341))

(assert (=> b!830076 m!773343))

(assert (=> b!829876 d!105563))

(declare-fun b!830086 () Bool)

(declare-fun e!462738 () Bool)

(declare-fun e!462740 () Bool)

(assert (=> b!830086 (= e!462738 e!462740)))

(assert (=> b!830086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(declare-fun res!565254 () Bool)

(declare-fun lt!376317 () ListLongMap!8871)

(assert (=> b!830086 (= res!565254 (contains!4175 lt!376317 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830086 (=> (not res!565254) (not e!462740))))

(declare-fun b!830087 () Bool)

(declare-fun e!462734 () ListLongMap!8871)

(declare-fun e!462736 () ListLongMap!8871)

(assert (=> b!830087 (= e!462734 e!462736)))

(declare-fun c!90002 () Bool)

(assert (=> b!830087 (= c!90002 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105565 () Bool)

(declare-fun e!462737 () Bool)

(assert (=> d!105565 e!462737))

(declare-fun res!565253 () Bool)

(assert (=> d!105565 (=> (not res!565253) (not e!462737))))

(assert (=> d!105565 (= res!565253 (not (contains!4175 lt!376317 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105565 (= lt!376317 e!462734)))

(declare-fun c!90005 () Bool)

(assert (=> d!105565 (= c!90005 (bvsge #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(assert (=> d!105565 (validMask!0 mask!1312)))

(assert (=> d!105565 (= (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376317)))

(declare-fun call!36153 () ListLongMap!8871)

(declare-fun bm!36150 () Bool)

(assert (=> bm!36150 (= call!36153 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830088 () Bool)

(assert (=> b!830088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(assert (=> b!830088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22714 _values!788)))))

(assert (=> b!830088 (= e!462740 (= (apply!368 lt!376317 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)) (get!11804 (select (arr!22294 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830089 () Bool)

(declare-fun lt!376316 () Unit!28418)

(declare-fun lt!376315 () Unit!28418)

(assert (=> b!830089 (= lt!376316 lt!376315)))

(declare-fun lt!376312 () V!25227)

(declare-fun lt!376314 () (_ BitVec 64))

(declare-fun lt!376313 () (_ BitVec 64))

(declare-fun lt!376311 () ListLongMap!8871)

(assert (=> b!830089 (not (contains!4175 (+!1974 lt!376311 (tuple2!10047 lt!376314 lt!376312)) lt!376313))))

(assert (=> b!830089 (= lt!376315 (addStillNotContains!195 lt!376311 lt!376314 lt!376312 lt!376313))))

(assert (=> b!830089 (= lt!376313 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830089 (= lt!376312 (get!11804 (select (arr!22294 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830089 (= lt!376314 (select (arr!22293 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830089 (= lt!376311 call!36153)))

(assert (=> b!830089 (= e!462736 (+!1974 call!36153 (tuple2!10047 (select (arr!22293 _keys!976) #b00000000000000000000000000000000) (get!11804 (select (arr!22294 _values!788) #b00000000000000000000000000000000) (dynLambda!976 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830090 () Bool)

(declare-fun res!565255 () Bool)

(assert (=> b!830090 (=> (not res!565255) (not e!462737))))

(assert (=> b!830090 (= res!565255 (not (contains!4175 lt!376317 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!830091 () Bool)

(declare-fun e!462739 () Bool)

(assert (=> b!830091 (= e!462738 e!462739)))

(declare-fun c!90003 () Bool)

(assert (=> b!830091 (= c!90003 (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(declare-fun b!830092 () Bool)

(declare-fun e!462735 () Bool)

(assert (=> b!830092 (= e!462735 (validKeyInArray!0 (select (arr!22293 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830092 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!830093 () Bool)

(assert (=> b!830093 (= e!462739 (= lt!376317 (getCurrentListMapNoExtraKeys!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830094 () Bool)

(assert (=> b!830094 (= e!462739 (isEmpty!656 lt!376317))))

(declare-fun b!830095 () Bool)

(assert (=> b!830095 (= e!462736 call!36153)))

(declare-fun b!830096 () Bool)

(assert (=> b!830096 (= e!462737 e!462738)))

(declare-fun c!90004 () Bool)

(assert (=> b!830096 (= c!90004 e!462735)))

(declare-fun res!565252 () Bool)

(assert (=> b!830096 (=> (not res!565252) (not e!462735))))

(assert (=> b!830096 (= res!565252 (bvslt #b00000000000000000000000000000000 (size!22713 _keys!976)))))

(declare-fun b!830097 () Bool)

(assert (=> b!830097 (= e!462734 (ListLongMap!8872 Nil!15817))))

(assert (= (and d!105565 c!90005) b!830097))

(assert (= (and d!105565 (not c!90005)) b!830087))

(assert (= (and b!830087 c!90002) b!830089))

(assert (= (and b!830087 (not c!90002)) b!830095))

(assert (= (or b!830089 b!830095) bm!36150))

(assert (= (and d!105565 res!565253) b!830090))

(assert (= (and b!830090 res!565255) b!830096))

(assert (= (and b!830096 res!565252) b!830092))

(assert (= (and b!830096 c!90004) b!830086))

(assert (= (and b!830096 (not c!90004)) b!830091))

(assert (= (and b!830086 res!565254) b!830088))

(assert (= (and b!830091 c!90003) b!830093))

(assert (= (and b!830091 (not c!90003)) b!830094))

(declare-fun b_lambda!11273 () Bool)

(assert (=> (not b_lambda!11273) (not b!830088)))

(assert (=> b!830088 t!22174))

(declare-fun b_and!22465 () Bool)

(assert (= b_and!22463 (and (=> t!22174 result!7983) b_and!22465)))

(declare-fun b_lambda!11275 () Bool)

(assert (=> (not b_lambda!11275) (not b!830089)))

(assert (=> b!830089 t!22174))

(declare-fun b_and!22467 () Bool)

(assert (= b_and!22465 (and (=> t!22174 result!7983) b_and!22467)))

(declare-fun m!773467 () Bool)

(assert (=> b!830093 m!773467))

(assert (=> b!830092 m!773319))

(assert (=> b!830092 m!773319))

(assert (=> b!830092 m!773321))

(assert (=> bm!36150 m!773467))

(declare-fun m!773469 () Bool)

(assert (=> b!830094 m!773469))

(declare-fun m!773471 () Bool)

(assert (=> d!105565 m!773471))

(assert (=> d!105565 m!773265))

(assert (=> b!830087 m!773319))

(assert (=> b!830087 m!773319))

(assert (=> b!830087 m!773321))

(declare-fun m!773473 () Bool)

(assert (=> b!830090 m!773473))

(assert (=> b!830086 m!773319))

(assert (=> b!830086 m!773319))

(declare-fun m!773475 () Bool)

(assert (=> b!830086 m!773475))

(assert (=> b!830089 m!773341))

(assert (=> b!830089 m!773343))

(assert (=> b!830089 m!773345))

(declare-fun m!773477 () Bool)

(assert (=> b!830089 m!773477))

(declare-fun m!773479 () Bool)

(assert (=> b!830089 m!773479))

(declare-fun m!773481 () Bool)

(assert (=> b!830089 m!773481))

(declare-fun m!773483 () Bool)

(assert (=> b!830089 m!773483))

(assert (=> b!830089 m!773319))

(assert (=> b!830089 m!773341))

(assert (=> b!830089 m!773477))

(assert (=> b!830089 m!773343))

(assert (=> b!830088 m!773341))

(assert (=> b!830088 m!773343))

(assert (=> b!830088 m!773345))

(assert (=> b!830088 m!773319))

(declare-fun m!773485 () Bool)

(assert (=> b!830088 m!773485))

(assert (=> b!830088 m!773319))

(assert (=> b!830088 m!773341))

(assert (=> b!830088 m!773343))

(assert (=> b!829876 d!105565))

(declare-fun mapIsEmpty!24403 () Bool)

(declare-fun mapRes!24403 () Bool)

(assert (=> mapIsEmpty!24403 mapRes!24403))

(declare-fun condMapEmpty!24403 () Bool)

(declare-fun mapDefault!24403 () ValueCell!7169)

(assert (=> mapNonEmpty!24394 (= condMapEmpty!24403 (= mapRest!24394 ((as const (Array (_ BitVec 32) ValueCell!7169)) mapDefault!24403)))))

(declare-fun e!462745 () Bool)

(assert (=> mapNonEmpty!24394 (= tp!47151 (and e!462745 mapRes!24403))))

(declare-fun b!830105 () Bool)

(assert (=> b!830105 (= e!462745 tp_is_empty!15169)))

(declare-fun b!830104 () Bool)

(declare-fun e!462746 () Bool)

(assert (=> b!830104 (= e!462746 tp_is_empty!15169)))

(declare-fun mapNonEmpty!24403 () Bool)

(declare-fun tp!47167 () Bool)

(assert (=> mapNonEmpty!24403 (= mapRes!24403 (and tp!47167 e!462746))))

(declare-fun mapKey!24403 () (_ BitVec 32))

(declare-fun mapRest!24403 () (Array (_ BitVec 32) ValueCell!7169))

(declare-fun mapValue!24403 () ValueCell!7169)

(assert (=> mapNonEmpty!24403 (= mapRest!24394 (store mapRest!24403 mapKey!24403 mapValue!24403))))

(assert (= (and mapNonEmpty!24394 condMapEmpty!24403) mapIsEmpty!24403))

(assert (= (and mapNonEmpty!24394 (not condMapEmpty!24403)) mapNonEmpty!24403))

(assert (= (and mapNonEmpty!24403 ((_ is ValueCellFull!7169) mapValue!24403)) b!830104))

(assert (= (and mapNonEmpty!24394 ((_ is ValueCellFull!7169) mapDefault!24403)) b!830105))

(declare-fun m!773487 () Bool)

(assert (=> mapNonEmpty!24403 m!773487))

(declare-fun b_lambda!11277 () Bool)

(assert (= b_lambda!11273 (or (and start!71544 b_free!13459) b_lambda!11277)))

(declare-fun b_lambda!11279 () Bool)

(assert (= b_lambda!11271 (or (and start!71544 b_free!13459) b_lambda!11279)))

(declare-fun b_lambda!11281 () Bool)

(assert (= b_lambda!11275 (or (and start!71544 b_free!13459) b_lambda!11281)))

(declare-fun b_lambda!11283 () Bool)

(assert (= b_lambda!11265 (or (and start!71544 b_free!13459) b_lambda!11283)))

(declare-fun b_lambda!11285 () Bool)

(assert (= b_lambda!11269 (or (and start!71544 b_free!13459) b_lambda!11285)))

(declare-fun b_lambda!11287 () Bool)

(assert (= b_lambda!11267 (or (and start!71544 b_free!13459) b_lambda!11287)))

(check-sat (not b!830093) (not b!830088) (not b!829944) (not d!105559) (not b!829954) (not bm!36115) (not b!830028) (not b!830011) (not b_lambda!11277) (not b!830039) (not d!105565) (not b!830092) (not bm!36143) (not b!830010) (not b!830086) (not b_lambda!11279) (not b!830087) (not b!829943) (not bm!36136) (not b!829941) (not b!830041) (not b_lambda!11285) (not bm!36150) (not b!829957) (not b!830094) (not bm!36139) (not b!830017) (not b_lambda!11281) (not b!830080) (not d!105561) (not b!830089) (not b!830082) (not bm!36135) (not d!105557) (not b!830090) (not b!830043) (not b_lambda!11283) (not b!830012) (not bm!36118) (not b!830009) (not b!830078) (not b!830081) (not bm!36146) b_and!22467 (not b!830077) (not b_lambda!11287) (not bm!36142) (not bm!36134) (not b!830045) (not b!830008) (not b!830076) (not d!105555) (not b_next!13459) (not b!830014) (not b!830040) (not mapNonEmpty!24403) (not b!830075) (not b!830074) tp_is_empty!15169 (not bm!36141) (not bm!36149) (not b!830046) (not b!830037) (not b!830027) (not b!830038) (not b!830016) (not d!105563))
(check-sat b_and!22467 (not b_next!13459))
