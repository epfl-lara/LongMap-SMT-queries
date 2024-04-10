; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71036 () Bool)

(assert start!71036)

(declare-fun b_free!13239 () Bool)

(declare-fun b_next!13239 () Bool)

(assert (=> start!71036 (= b_free!13239 (not b_next!13239))))

(declare-fun tp!46470 () Bool)

(declare-fun b_and!22143 () Bool)

(assert (=> start!71036 (= tp!46470 b_and!22143)))

(declare-fun b!824908 () Bool)

(declare-fun e!459038 () Bool)

(declare-datatypes ((array!46086 0))(
  ( (array!46087 (arr!22090 (Array (_ BitVec 32) (_ BitVec 64))) (size!22511 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46086)

(assert (=> b!824908 (= e!459038 (bvsle #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(declare-datatypes ((V!24933 0))(
  ( (V!24934 (val!7522 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24933)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24933)

(declare-datatypes ((ValueCell!7059 0))(
  ( (ValueCellFull!7059 (v!9955 V!24933)) (EmptyCell!7059) )
))
(declare-datatypes ((array!46088 0))(
  ( (array!46089 (arr!22091 (Array (_ BitVec 32) ValueCell!7059)) (size!22512 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46088)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9958 0))(
  ( (tuple2!9959 (_1!4990 (_ BitVec 64)) (_2!4990 V!24933)) )
))
(declare-datatypes ((List!15764 0))(
  ( (Nil!15761) (Cons!15760 (h!16889 tuple2!9958) (t!22107 List!15764)) )
))
(declare-datatypes ((ListLongMap!8781 0))(
  ( (ListLongMap!8782 (toList!4406 List!15764)) )
))
(declare-fun lt!372059 () ListLongMap!8781)

(declare-fun getCurrentListMap!2543 (array!46086 array!46088 (_ BitVec 32) (_ BitVec 32) V!24933 V!24933 (_ BitVec 32) Int) ListLongMap!8781)

(assert (=> b!824908 (= lt!372059 (getCurrentListMap!2543 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824909 () Bool)

(declare-fun e!459036 () Bool)

(assert (=> b!824909 (= e!459036 (not e!459038))))

(declare-fun res!562373 () Bool)

(assert (=> b!824909 (=> res!562373 e!459038)))

(assert (=> b!824909 (= res!562373 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!372060 () ListLongMap!8781)

(declare-fun lt!372061 () ListLongMap!8781)

(assert (=> b!824909 (= lt!372060 lt!372061)))

(declare-fun zeroValueAfter!34 () V!24933)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28276 0))(
  ( (Unit!28277) )
))
(declare-fun lt!372062 () Unit!28276)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!529 (array!46086 array!46088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24933 V!24933 V!24933 V!24933 (_ BitVec 32) Int) Unit!28276)

(assert (=> b!824909 (= lt!372062 (lemmaNoChangeToArrayThenSameMapNoExtras!529 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2419 (array!46086 array!46088 (_ BitVec 32) (_ BitVec 32) V!24933 V!24933 (_ BitVec 32) Int) ListLongMap!8781)

(assert (=> b!824909 (= lt!372061 (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824909 (= lt!372060 (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824910 () Bool)

(declare-fun e!459041 () Bool)

(declare-fun tp_is_empty!14949 () Bool)

(assert (=> b!824910 (= e!459041 tp_is_empty!14949)))

(declare-fun b!824911 () Bool)

(declare-fun res!562375 () Bool)

(assert (=> b!824911 (=> (not res!562375) (not e!459036))))

(declare-datatypes ((List!15765 0))(
  ( (Nil!15762) (Cons!15761 (h!16890 (_ BitVec 64)) (t!22108 List!15765)) )
))
(declare-fun arrayNoDuplicates!0 (array!46086 (_ BitVec 32) List!15765) Bool)

(assert (=> b!824911 (= res!562375 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15762))))

(declare-fun b!824912 () Bool)

(declare-fun e!459037 () Bool)

(assert (=> b!824912 (= e!459037 tp_is_empty!14949)))

(declare-fun res!562374 () Bool)

(assert (=> start!71036 (=> (not res!562374) (not e!459036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71036 (= res!562374 (validMask!0 mask!1312))))

(assert (=> start!71036 e!459036))

(assert (=> start!71036 tp_is_empty!14949))

(declare-fun array_inv!17617 (array!46086) Bool)

(assert (=> start!71036 (array_inv!17617 _keys!976)))

(assert (=> start!71036 true))

(declare-fun e!459040 () Bool)

(declare-fun array_inv!17618 (array!46088) Bool)

(assert (=> start!71036 (and (array_inv!17618 _values!788) e!459040)))

(assert (=> start!71036 tp!46470))

(declare-fun b!824913 () Bool)

(declare-fun res!562377 () Bool)

(assert (=> b!824913 (=> (not res!562377) (not e!459036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46086 (_ BitVec 32)) Bool)

(assert (=> b!824913 (= res!562377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24043 () Bool)

(declare-fun mapRes!24043 () Bool)

(assert (=> mapIsEmpty!24043 mapRes!24043))

(declare-fun mapNonEmpty!24043 () Bool)

(declare-fun tp!46471 () Bool)

(assert (=> mapNonEmpty!24043 (= mapRes!24043 (and tp!46471 e!459041))))

(declare-fun mapRest!24043 () (Array (_ BitVec 32) ValueCell!7059))

(declare-fun mapKey!24043 () (_ BitVec 32))

(declare-fun mapValue!24043 () ValueCell!7059)

(assert (=> mapNonEmpty!24043 (= (arr!22091 _values!788) (store mapRest!24043 mapKey!24043 mapValue!24043))))

(declare-fun b!824914 () Bool)

(declare-fun res!562376 () Bool)

(assert (=> b!824914 (=> (not res!562376) (not e!459036))))

(assert (=> b!824914 (= res!562376 (and (= (size!22512 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22511 _keys!976) (size!22512 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824915 () Bool)

(assert (=> b!824915 (= e!459040 (and e!459037 mapRes!24043))))

(declare-fun condMapEmpty!24043 () Bool)

(declare-fun mapDefault!24043 () ValueCell!7059)

(assert (=> b!824915 (= condMapEmpty!24043 (= (arr!22091 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7059)) mapDefault!24043)))))

(assert (= (and start!71036 res!562374) b!824914))

(assert (= (and b!824914 res!562376) b!824913))

(assert (= (and b!824913 res!562377) b!824911))

(assert (= (and b!824911 res!562375) b!824909))

(assert (= (and b!824909 (not res!562373)) b!824908))

(assert (= (and b!824915 condMapEmpty!24043) mapIsEmpty!24043))

(assert (= (and b!824915 (not condMapEmpty!24043)) mapNonEmpty!24043))

(get-info :version)

(assert (= (and mapNonEmpty!24043 ((_ is ValueCellFull!7059) mapValue!24043)) b!824910))

(assert (= (and b!824915 ((_ is ValueCellFull!7059) mapDefault!24043)) b!824912))

(assert (= start!71036 b!824915))

(declare-fun m!766917 () Bool)

(assert (=> b!824909 m!766917))

(declare-fun m!766919 () Bool)

(assert (=> b!824909 m!766919))

(declare-fun m!766921 () Bool)

(assert (=> b!824909 m!766921))

(declare-fun m!766923 () Bool)

(assert (=> b!824913 m!766923))

(declare-fun m!766925 () Bool)

(assert (=> b!824911 m!766925))

(declare-fun m!766927 () Bool)

(assert (=> mapNonEmpty!24043 m!766927))

(declare-fun m!766929 () Bool)

(assert (=> b!824908 m!766929))

(declare-fun m!766931 () Bool)

(assert (=> start!71036 m!766931))

(declare-fun m!766933 () Bool)

(assert (=> start!71036 m!766933))

(declare-fun m!766935 () Bool)

(assert (=> start!71036 m!766935))

(check-sat tp_is_empty!14949 (not b!824913) (not b!824909) (not b!824911) b_and!22143 (not b!824908) (not b_next!13239) (not start!71036) (not mapNonEmpty!24043))
(check-sat b_and!22143 (not b_next!13239))
(get-model)

(declare-fun bm!35839 () Bool)

(declare-fun call!35842 () Bool)

(declare-fun c!89393 () Bool)

(assert (=> bm!35839 (= call!35842 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89393 (Cons!15761 (select (arr!22090 _keys!976) #b00000000000000000000000000000000) Nil!15762) Nil!15762)))))

(declare-fun b!824951 () Bool)

(declare-fun e!459068 () Bool)

(assert (=> b!824951 (= e!459068 call!35842)))

(declare-fun b!824952 () Bool)

(declare-fun e!459069 () Bool)

(assert (=> b!824952 (= e!459069 e!459068)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!824952 (= c!89393 (validKeyInArray!0 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824950 () Bool)

(declare-fun e!459071 () Bool)

(assert (=> b!824950 (= e!459071 e!459069)))

(declare-fun res!562400 () Bool)

(assert (=> b!824950 (=> (not res!562400) (not e!459069))))

(declare-fun e!459070 () Bool)

(assert (=> b!824950 (= res!562400 (not e!459070))))

(declare-fun res!562401 () Bool)

(assert (=> b!824950 (=> (not res!562401) (not e!459070))))

(assert (=> b!824950 (= res!562401 (validKeyInArray!0 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104959 () Bool)

(declare-fun res!562399 () Bool)

(assert (=> d!104959 (=> res!562399 e!459071)))

(assert (=> d!104959 (= res!562399 (bvsge #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(assert (=> d!104959 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15762) e!459071)))

(declare-fun b!824953 () Bool)

(assert (=> b!824953 (= e!459068 call!35842)))

(declare-fun b!824954 () Bool)

(declare-fun contains!4177 (List!15765 (_ BitVec 64)) Bool)

(assert (=> b!824954 (= e!459070 (contains!4177 Nil!15762 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104959 (not res!562399)) b!824950))

(assert (= (and b!824950 res!562401) b!824954))

(assert (= (and b!824950 res!562400) b!824952))

(assert (= (and b!824952 c!89393) b!824951))

(assert (= (and b!824952 (not c!89393)) b!824953))

(assert (= (or b!824951 b!824953) bm!35839))

(declare-fun m!766957 () Bool)

(assert (=> bm!35839 m!766957))

(declare-fun m!766959 () Bool)

(assert (=> bm!35839 m!766959))

(assert (=> b!824952 m!766957))

(assert (=> b!824952 m!766957))

(declare-fun m!766961 () Bool)

(assert (=> b!824952 m!766961))

(assert (=> b!824950 m!766957))

(assert (=> b!824950 m!766957))

(assert (=> b!824950 m!766961))

(assert (=> b!824954 m!766957))

(assert (=> b!824954 m!766957))

(declare-fun m!766963 () Bool)

(assert (=> b!824954 m!766963))

(assert (=> b!824911 d!104959))

(declare-fun b!824963 () Bool)

(declare-fun e!459080 () Bool)

(declare-fun call!35845 () Bool)

(assert (=> b!824963 (= e!459080 call!35845)))

(declare-fun b!824964 () Bool)

(declare-fun e!459078 () Bool)

(assert (=> b!824964 (= e!459078 e!459080)))

(declare-fun c!89396 () Bool)

(assert (=> b!824964 (= c!89396 (validKeyInArray!0 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824965 () Bool)

(declare-fun e!459079 () Bool)

(assert (=> b!824965 (= e!459079 call!35845)))

(declare-fun bm!35842 () Bool)

(assert (=> bm!35842 (= call!35845 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!824966 () Bool)

(assert (=> b!824966 (= e!459080 e!459079)))

(declare-fun lt!372081 () (_ BitVec 64))

(assert (=> b!824966 (= lt!372081 (select (arr!22090 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!372083 () Unit!28276)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46086 (_ BitVec 64) (_ BitVec 32)) Unit!28276)

(assert (=> b!824966 (= lt!372083 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!372081 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!824966 (arrayContainsKey!0 _keys!976 lt!372081 #b00000000000000000000000000000000)))

(declare-fun lt!372082 () Unit!28276)

(assert (=> b!824966 (= lt!372082 lt!372083)))

(declare-fun res!562407 () Bool)

(declare-datatypes ((SeekEntryResult!8733 0))(
  ( (MissingZero!8733 (index!37303 (_ BitVec 32))) (Found!8733 (index!37304 (_ BitVec 32))) (Intermediate!8733 (undefined!9545 Bool) (index!37305 (_ BitVec 32)) (x!69633 (_ BitVec 32))) (Undefined!8733) (MissingVacant!8733 (index!37306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46086 (_ BitVec 32)) SeekEntryResult!8733)

(assert (=> b!824966 (= res!562407 (= (seekEntryOrOpen!0 (select (arr!22090 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8733 #b00000000000000000000000000000000)))))

(assert (=> b!824966 (=> (not res!562407) (not e!459079))))

(declare-fun d!104961 () Bool)

(declare-fun res!562406 () Bool)

(assert (=> d!104961 (=> res!562406 e!459078)))

(assert (=> d!104961 (= res!562406 (bvsge #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(assert (=> d!104961 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!459078)))

(assert (= (and d!104961 (not res!562406)) b!824964))

(assert (= (and b!824964 c!89396) b!824966))

(assert (= (and b!824964 (not c!89396)) b!824963))

(assert (= (and b!824966 res!562407) b!824965))

(assert (= (or b!824965 b!824963) bm!35842))

(assert (=> b!824964 m!766957))

(assert (=> b!824964 m!766957))

(assert (=> b!824964 m!766961))

(declare-fun m!766965 () Bool)

(assert (=> bm!35842 m!766965))

(assert (=> b!824966 m!766957))

(declare-fun m!766967 () Bool)

(assert (=> b!824966 m!766967))

(declare-fun m!766969 () Bool)

(assert (=> b!824966 m!766969))

(assert (=> b!824966 m!766957))

(declare-fun m!766971 () Bool)

(assert (=> b!824966 m!766971))

(assert (=> b!824913 d!104961))

(declare-fun d!104963 () Bool)

(assert (=> d!104963 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71036 d!104963))

(declare-fun d!104965 () Bool)

(assert (=> d!104965 (= (array_inv!17617 _keys!976) (bvsge (size!22511 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71036 d!104965))

(declare-fun d!104967 () Bool)

(assert (=> d!104967 (= (array_inv!17618 _values!788) (bvsge (size!22512 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71036 d!104967))

(declare-fun d!104969 () Bool)

(assert (=> d!104969 (= (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!372086 () Unit!28276)

(declare-fun choose!1404 (array!46086 array!46088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24933 V!24933 V!24933 V!24933 (_ BitVec 32) Int) Unit!28276)

(assert (=> d!104969 (= lt!372086 (choose!1404 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104969 (validMask!0 mask!1312)))

(assert (=> d!104969 (= (lemmaNoChangeToArrayThenSameMapNoExtras!529 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!372086)))

(declare-fun bs!23043 () Bool)

(assert (= bs!23043 d!104969))

(assert (=> bs!23043 m!766921))

(assert (=> bs!23043 m!766919))

(declare-fun m!766973 () Bool)

(assert (=> bs!23043 m!766973))

(assert (=> bs!23043 m!766931))

(assert (=> b!824909 d!104969))

(declare-fun b!824991 () Bool)

(declare-fun e!459097 () Bool)

(declare-fun e!459100 () Bool)

(assert (=> b!824991 (= e!459097 e!459100)))

(declare-fun c!89405 () Bool)

(assert (=> b!824991 (= c!89405 (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(declare-fun d!104971 () Bool)

(declare-fun e!459096 () Bool)

(assert (=> d!104971 e!459096))

(declare-fun res!562416 () Bool)

(assert (=> d!104971 (=> (not res!562416) (not e!459096))))

(declare-fun lt!372106 () ListLongMap!8781)

(declare-fun contains!4178 (ListLongMap!8781 (_ BitVec 64)) Bool)

(assert (=> d!104971 (= res!562416 (not (contains!4178 lt!372106 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!459099 () ListLongMap!8781)

(assert (=> d!104971 (= lt!372106 e!459099)))

(declare-fun c!89408 () Bool)

(assert (=> d!104971 (= c!89408 (bvsge #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(assert (=> d!104971 (validMask!0 mask!1312)))

(assert (=> d!104971 (= (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!372106)))

(declare-fun call!35848 () ListLongMap!8781)

(declare-fun bm!35845 () Bool)

(assert (=> bm!35845 (= call!35848 (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!824992 () Bool)

(declare-fun res!562418 () Bool)

(assert (=> b!824992 (=> (not res!562418) (not e!459096))))

(assert (=> b!824992 (= res!562418 (not (contains!4178 lt!372106 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!824993 () Bool)

(assert (=> b!824993 (= e!459099 (ListLongMap!8782 Nil!15761))))

(declare-fun b!824994 () Bool)

(declare-fun e!459098 () ListLongMap!8781)

(assert (=> b!824994 (= e!459098 call!35848)))

(declare-fun b!824995 () Bool)

(declare-fun e!459095 () Bool)

(assert (=> b!824995 (= e!459097 e!459095)))

(assert (=> b!824995 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(declare-fun res!562419 () Bool)

(assert (=> b!824995 (= res!562419 (contains!4178 lt!372106 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824995 (=> (not res!562419) (not e!459095))))

(declare-fun b!824996 () Bool)

(declare-fun lt!372105 () Unit!28276)

(declare-fun lt!372103 () Unit!28276)

(assert (=> b!824996 (= lt!372105 lt!372103)))

(declare-fun lt!372101 () (_ BitVec 64))

(declare-fun lt!372107 () V!24933)

(declare-fun lt!372104 () ListLongMap!8781)

(declare-fun lt!372102 () (_ BitVec 64))

(declare-fun +!1915 (ListLongMap!8781 tuple2!9958) ListLongMap!8781)

(assert (=> b!824996 (not (contains!4178 (+!1915 lt!372104 (tuple2!9959 lt!372101 lt!372107)) lt!372102))))

(declare-fun addStillNotContains!186 (ListLongMap!8781 (_ BitVec 64) V!24933 (_ BitVec 64)) Unit!28276)

(assert (=> b!824996 (= lt!372103 (addStillNotContains!186 lt!372104 lt!372101 lt!372107 lt!372102))))

(assert (=> b!824996 (= lt!372102 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11720 (ValueCell!7059 V!24933) V!24933)

(declare-fun dynLambda!972 (Int (_ BitVec 64)) V!24933)

(assert (=> b!824996 (= lt!372107 (get!11720 (select (arr!22091 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!824996 (= lt!372101 (select (arr!22090 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!824996 (= lt!372104 call!35848)))

(assert (=> b!824996 (= e!459098 (+!1915 call!35848 (tuple2!9959 (select (arr!22090 _keys!976) #b00000000000000000000000000000000) (get!11720 (select (arr!22091 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!824997 () Bool)

(assert (=> b!824997 (= e!459099 e!459098)))

(declare-fun c!89406 () Bool)

(assert (=> b!824997 (= c!89406 (validKeyInArray!0 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824998 () Bool)

(assert (=> b!824998 (= e!459100 (= lt!372106 (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!824999 () Bool)

(assert (=> b!824999 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(assert (=> b!824999 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22512 _values!788)))))

(declare-fun apply!361 (ListLongMap!8781 (_ BitVec 64)) V!24933)

(assert (=> b!824999 (= e!459095 (= (apply!361 lt!372106 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)) (get!11720 (select (arr!22091 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!825000 () Bool)

(assert (=> b!825000 (= e!459096 e!459097)))

(declare-fun c!89407 () Bool)

(declare-fun e!459101 () Bool)

(assert (=> b!825000 (= c!89407 e!459101)))

(declare-fun res!562417 () Bool)

(assert (=> b!825000 (=> (not res!562417) (not e!459101))))

(assert (=> b!825000 (= res!562417 (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(declare-fun b!825001 () Bool)

(declare-fun isEmpty!643 (ListLongMap!8781) Bool)

(assert (=> b!825001 (= e!459100 (isEmpty!643 lt!372106))))

(declare-fun b!825002 () Bool)

(assert (=> b!825002 (= e!459101 (validKeyInArray!0 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825002 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!104971 c!89408) b!824993))

(assert (= (and d!104971 (not c!89408)) b!824997))

(assert (= (and b!824997 c!89406) b!824996))

(assert (= (and b!824997 (not c!89406)) b!824994))

(assert (= (or b!824996 b!824994) bm!35845))

(assert (= (and d!104971 res!562416) b!824992))

(assert (= (and b!824992 res!562418) b!825000))

(assert (= (and b!825000 res!562417) b!825002))

(assert (= (and b!825000 c!89407) b!824995))

(assert (= (and b!825000 (not c!89407)) b!824991))

(assert (= (and b!824995 res!562419) b!824999))

(assert (= (and b!824991 c!89405) b!824998))

(assert (= (and b!824991 (not c!89405)) b!825001))

(declare-fun b_lambda!11095 () Bool)

(assert (=> (not b_lambda!11095) (not b!824996)))

(declare-fun t!22110 () Bool)

(declare-fun tb!4203 () Bool)

(assert (=> (and start!71036 (= defaultEntry!796 defaultEntry!796) t!22110) tb!4203))

(declare-fun result!7949 () Bool)

(assert (=> tb!4203 (= result!7949 tp_is_empty!14949)))

(assert (=> b!824996 t!22110))

(declare-fun b_and!22147 () Bool)

(assert (= b_and!22143 (and (=> t!22110 result!7949) b_and!22147)))

(declare-fun b_lambda!11097 () Bool)

(assert (=> (not b_lambda!11097) (not b!824999)))

(assert (=> b!824999 t!22110))

(declare-fun b_and!22149 () Bool)

(assert (= b_and!22147 (and (=> t!22110 result!7949) b_and!22149)))

(declare-fun m!766975 () Bool)

(assert (=> bm!35845 m!766975))

(assert (=> b!824998 m!766975))

(declare-fun m!766977 () Bool)

(assert (=> b!824996 m!766977))

(declare-fun m!766979 () Bool)

(assert (=> b!824996 m!766979))

(assert (=> b!824996 m!766977))

(declare-fun m!766981 () Bool)

(assert (=> b!824996 m!766981))

(declare-fun m!766983 () Bool)

(assert (=> b!824996 m!766983))

(assert (=> b!824996 m!766981))

(declare-fun m!766985 () Bool)

(assert (=> b!824996 m!766985))

(assert (=> b!824996 m!766957))

(declare-fun m!766987 () Bool)

(assert (=> b!824996 m!766987))

(declare-fun m!766989 () Bool)

(assert (=> b!824996 m!766989))

(assert (=> b!824996 m!766987))

(assert (=> b!824995 m!766957))

(assert (=> b!824995 m!766957))

(declare-fun m!766991 () Bool)

(assert (=> b!824995 m!766991))

(assert (=> b!825002 m!766957))

(assert (=> b!825002 m!766957))

(assert (=> b!825002 m!766961))

(assert (=> b!824999 m!766977))

(assert (=> b!824999 m!766977))

(assert (=> b!824999 m!766981))

(assert (=> b!824999 m!766983))

(assert (=> b!824999 m!766981))

(assert (=> b!824999 m!766957))

(declare-fun m!766993 () Bool)

(assert (=> b!824999 m!766993))

(assert (=> b!824999 m!766957))

(assert (=> b!824997 m!766957))

(assert (=> b!824997 m!766957))

(assert (=> b!824997 m!766961))

(declare-fun m!766995 () Bool)

(assert (=> b!825001 m!766995))

(declare-fun m!766997 () Bool)

(assert (=> b!824992 m!766997))

(declare-fun m!766999 () Bool)

(assert (=> d!104971 m!766999))

(assert (=> d!104971 m!766931))

(assert (=> b!824909 d!104971))

(declare-fun b!825005 () Bool)

(declare-fun e!459104 () Bool)

(declare-fun e!459107 () Bool)

(assert (=> b!825005 (= e!459104 e!459107)))

(declare-fun c!89409 () Bool)

(assert (=> b!825005 (= c!89409 (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(declare-fun d!104973 () Bool)

(declare-fun e!459103 () Bool)

(assert (=> d!104973 e!459103))

(declare-fun res!562420 () Bool)

(assert (=> d!104973 (=> (not res!562420) (not e!459103))))

(declare-fun lt!372113 () ListLongMap!8781)

(assert (=> d!104973 (= res!562420 (not (contains!4178 lt!372113 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!459106 () ListLongMap!8781)

(assert (=> d!104973 (= lt!372113 e!459106)))

(declare-fun c!89412 () Bool)

(assert (=> d!104973 (= c!89412 (bvsge #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(assert (=> d!104973 (validMask!0 mask!1312)))

(assert (=> d!104973 (= (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!372113)))

(declare-fun call!35849 () ListLongMap!8781)

(declare-fun bm!35846 () Bool)

(assert (=> bm!35846 (= call!35849 (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!825006 () Bool)

(declare-fun res!562422 () Bool)

(assert (=> b!825006 (=> (not res!562422) (not e!459103))))

(assert (=> b!825006 (= res!562422 (not (contains!4178 lt!372113 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!825007 () Bool)

(assert (=> b!825007 (= e!459106 (ListLongMap!8782 Nil!15761))))

(declare-fun b!825008 () Bool)

(declare-fun e!459105 () ListLongMap!8781)

(assert (=> b!825008 (= e!459105 call!35849)))

(declare-fun b!825009 () Bool)

(declare-fun e!459102 () Bool)

(assert (=> b!825009 (= e!459104 e!459102)))

(assert (=> b!825009 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(declare-fun res!562423 () Bool)

(assert (=> b!825009 (= res!562423 (contains!4178 lt!372113 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825009 (=> (not res!562423) (not e!459102))))

(declare-fun b!825010 () Bool)

(declare-fun lt!372112 () Unit!28276)

(declare-fun lt!372110 () Unit!28276)

(assert (=> b!825010 (= lt!372112 lt!372110)))

(declare-fun lt!372111 () ListLongMap!8781)

(declare-fun lt!372108 () (_ BitVec 64))

(declare-fun lt!372109 () (_ BitVec 64))

(declare-fun lt!372114 () V!24933)

(assert (=> b!825010 (not (contains!4178 (+!1915 lt!372111 (tuple2!9959 lt!372108 lt!372114)) lt!372109))))

(assert (=> b!825010 (= lt!372110 (addStillNotContains!186 lt!372111 lt!372108 lt!372114 lt!372109))))

(assert (=> b!825010 (= lt!372109 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!825010 (= lt!372114 (get!11720 (select (arr!22091 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!825010 (= lt!372108 (select (arr!22090 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!825010 (= lt!372111 call!35849)))

(assert (=> b!825010 (= e!459105 (+!1915 call!35849 (tuple2!9959 (select (arr!22090 _keys!976) #b00000000000000000000000000000000) (get!11720 (select (arr!22091 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!825011 () Bool)

(assert (=> b!825011 (= e!459106 e!459105)))

(declare-fun c!89410 () Bool)

(assert (=> b!825011 (= c!89410 (validKeyInArray!0 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825012 () Bool)

(assert (=> b!825012 (= e!459107 (= lt!372113 (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!825013 () Bool)

(assert (=> b!825013 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(assert (=> b!825013 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22512 _values!788)))))

(assert (=> b!825013 (= e!459102 (= (apply!361 lt!372113 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)) (get!11720 (select (arr!22091 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!825014 () Bool)

(assert (=> b!825014 (= e!459103 e!459104)))

(declare-fun c!89411 () Bool)

(declare-fun e!459108 () Bool)

(assert (=> b!825014 (= c!89411 e!459108)))

(declare-fun res!562421 () Bool)

(assert (=> b!825014 (=> (not res!562421) (not e!459108))))

(assert (=> b!825014 (= res!562421 (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(declare-fun b!825015 () Bool)

(assert (=> b!825015 (= e!459107 (isEmpty!643 lt!372113))))

(declare-fun b!825016 () Bool)

(assert (=> b!825016 (= e!459108 (validKeyInArray!0 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825016 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!104973 c!89412) b!825007))

(assert (= (and d!104973 (not c!89412)) b!825011))

(assert (= (and b!825011 c!89410) b!825010))

(assert (= (and b!825011 (not c!89410)) b!825008))

(assert (= (or b!825010 b!825008) bm!35846))

(assert (= (and d!104973 res!562420) b!825006))

(assert (= (and b!825006 res!562422) b!825014))

(assert (= (and b!825014 res!562421) b!825016))

(assert (= (and b!825014 c!89411) b!825009))

(assert (= (and b!825014 (not c!89411)) b!825005))

(assert (= (and b!825009 res!562423) b!825013))

(assert (= (and b!825005 c!89409) b!825012))

(assert (= (and b!825005 (not c!89409)) b!825015))

(declare-fun b_lambda!11099 () Bool)

(assert (=> (not b_lambda!11099) (not b!825010)))

(assert (=> b!825010 t!22110))

(declare-fun b_and!22151 () Bool)

(assert (= b_and!22149 (and (=> t!22110 result!7949) b_and!22151)))

(declare-fun b_lambda!11101 () Bool)

(assert (=> (not b_lambda!11101) (not b!825013)))

(assert (=> b!825013 t!22110))

(declare-fun b_and!22153 () Bool)

(assert (= b_and!22151 (and (=> t!22110 result!7949) b_and!22153)))

(declare-fun m!767001 () Bool)

(assert (=> bm!35846 m!767001))

(assert (=> b!825012 m!767001))

(assert (=> b!825010 m!766977))

(declare-fun m!767003 () Bool)

(assert (=> b!825010 m!767003))

(assert (=> b!825010 m!766977))

(assert (=> b!825010 m!766981))

(assert (=> b!825010 m!766983))

(assert (=> b!825010 m!766981))

(declare-fun m!767005 () Bool)

(assert (=> b!825010 m!767005))

(assert (=> b!825010 m!766957))

(declare-fun m!767007 () Bool)

(assert (=> b!825010 m!767007))

(declare-fun m!767009 () Bool)

(assert (=> b!825010 m!767009))

(assert (=> b!825010 m!767007))

(assert (=> b!825009 m!766957))

(assert (=> b!825009 m!766957))

(declare-fun m!767011 () Bool)

(assert (=> b!825009 m!767011))

(assert (=> b!825016 m!766957))

(assert (=> b!825016 m!766957))

(assert (=> b!825016 m!766961))

(assert (=> b!825013 m!766977))

(assert (=> b!825013 m!766977))

(assert (=> b!825013 m!766981))

(assert (=> b!825013 m!766983))

(assert (=> b!825013 m!766981))

(assert (=> b!825013 m!766957))

(declare-fun m!767013 () Bool)

(assert (=> b!825013 m!767013))

(assert (=> b!825013 m!766957))

(assert (=> b!825011 m!766957))

(assert (=> b!825011 m!766957))

(assert (=> b!825011 m!766961))

(declare-fun m!767015 () Bool)

(assert (=> b!825015 m!767015))

(declare-fun m!767017 () Bool)

(assert (=> b!825006 m!767017))

(declare-fun m!767019 () Bool)

(assert (=> d!104973 m!767019))

(assert (=> d!104973 m!766931))

(assert (=> b!824909 d!104973))

(declare-fun call!35864 () ListLongMap!8781)

(declare-fun bm!35861 () Bool)

(assert (=> bm!35861 (= call!35864 (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825059 () Bool)

(declare-fun e!459135 () Bool)

(declare-fun call!35865 () Bool)

(assert (=> b!825059 (= e!459135 (not call!35865))))

(declare-fun b!825061 () Bool)

(declare-fun e!459142 () Bool)

(declare-fun e!459140 () Bool)

(assert (=> b!825061 (= e!459142 e!459140)))

(declare-fun res!562445 () Bool)

(assert (=> b!825061 (=> (not res!562445) (not e!459140))))

(declare-fun lt!372166 () ListLongMap!8781)

(assert (=> b!825061 (= res!562445 (contains!4178 lt!372166 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825061 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(declare-fun bm!35862 () Bool)

(assert (=> bm!35862 (= call!35865 (contains!4178 lt!372166 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!825062 () Bool)

(declare-fun e!459137 () Bool)

(declare-fun call!35870 () Bool)

(assert (=> b!825062 (= e!459137 (not call!35870))))

(declare-fun b!825063 () Bool)

(declare-fun e!459138 () ListLongMap!8781)

(declare-fun call!35869 () ListLongMap!8781)

(assert (=> b!825063 (= e!459138 call!35869)))

(declare-fun bm!35863 () Bool)

(declare-fun call!35868 () ListLongMap!8781)

(declare-fun call!35867 () ListLongMap!8781)

(assert (=> bm!35863 (= call!35868 call!35867)))

(declare-fun b!825064 () Bool)

(declare-fun e!459141 () ListLongMap!8781)

(assert (=> b!825064 (= e!459141 call!35869)))

(declare-fun b!825065 () Bool)

(declare-fun res!562443 () Bool)

(declare-fun e!459136 () Bool)

(assert (=> b!825065 (=> (not res!562443) (not e!459136))))

(assert (=> b!825065 (= res!562443 e!459137)))

(declare-fun c!89428 () Bool)

(assert (=> b!825065 (= c!89428 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!825066 () Bool)

(declare-fun e!459143 () Bool)

(assert (=> b!825066 (= e!459143 (validKeyInArray!0 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825067 () Bool)

(declare-fun res!562449 () Bool)

(assert (=> b!825067 (=> (not res!562449) (not e!459136))))

(assert (=> b!825067 (= res!562449 e!459142)))

(declare-fun res!562447 () Bool)

(assert (=> b!825067 (=> res!562447 e!459142)))

(assert (=> b!825067 (= res!562447 (not e!459143))))

(declare-fun res!562450 () Bool)

(assert (=> b!825067 (=> (not res!562450) (not e!459143))))

(assert (=> b!825067 (= res!562450 (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(declare-fun b!825068 () Bool)

(declare-fun e!459144 () Bool)

(assert (=> b!825068 (= e!459137 e!459144)))

(declare-fun res!562442 () Bool)

(assert (=> b!825068 (= res!562442 call!35870)))

(assert (=> b!825068 (=> (not res!562442) (not e!459144))))

(declare-fun b!825060 () Bool)

(declare-fun e!459145 () Unit!28276)

(declare-fun Unit!28278 () Unit!28276)

(assert (=> b!825060 (= e!459145 Unit!28278)))

(declare-fun d!104975 () Bool)

(assert (=> d!104975 e!459136))

(declare-fun res!562446 () Bool)

(assert (=> d!104975 (=> (not res!562446) (not e!459136))))

(assert (=> d!104975 (= res!562446 (or (bvsge #b00000000000000000000000000000000 (size!22511 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))))

(declare-fun lt!372165 () ListLongMap!8781)

(assert (=> d!104975 (= lt!372166 lt!372165)))

(declare-fun lt!372173 () Unit!28276)

(assert (=> d!104975 (= lt!372173 e!459145)))

(declare-fun c!89425 () Bool)

(declare-fun e!459139 () Bool)

(assert (=> d!104975 (= c!89425 e!459139)))

(declare-fun res!562444 () Bool)

(assert (=> d!104975 (=> (not res!562444) (not e!459139))))

(assert (=> d!104975 (= res!562444 (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(declare-fun e!459147 () ListLongMap!8781)

(assert (=> d!104975 (= lt!372165 e!459147)))

(declare-fun c!89426 () Bool)

(assert (=> d!104975 (= c!89426 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104975 (validMask!0 mask!1312)))

(assert (=> d!104975 (= (getCurrentListMap!2543 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!372166)))

(declare-fun b!825069 () Bool)

(declare-fun call!35866 () ListLongMap!8781)

(assert (=> b!825069 (= e!459147 (+!1915 call!35866 (tuple2!9959 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!825070 () Bool)

(assert (=> b!825070 (= e!459136 e!459135)))

(declare-fun c!89429 () Bool)

(assert (=> b!825070 (= c!89429 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!825071 () Bool)

(assert (=> b!825071 (= e!459144 (= (apply!361 lt!372166 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun bm!35864 () Bool)

(assert (=> bm!35864 (= call!35870 (contains!4178 lt!372166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35865 () Bool)

(assert (=> bm!35865 (= call!35867 call!35864)))

(declare-fun b!825072 () Bool)

(assert (=> b!825072 (= e!459140 (= (apply!361 lt!372166 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)) (get!11720 (select (arr!22091 _values!788) #b00000000000000000000000000000000) (dynLambda!972 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!825072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22512 _values!788)))))

(assert (=> b!825072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22511 _keys!976)))))

(declare-fun b!825073 () Bool)

(declare-fun lt!372180 () Unit!28276)

(assert (=> b!825073 (= e!459145 lt!372180)))

(declare-fun lt!372162 () ListLongMap!8781)

(assert (=> b!825073 (= lt!372162 (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!372172 () (_ BitVec 64))

(assert (=> b!825073 (= lt!372172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!372176 () (_ BitVec 64))

(assert (=> b!825073 (= lt!372176 (select (arr!22090 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!372177 () Unit!28276)

(declare-fun addStillContains!313 (ListLongMap!8781 (_ BitVec 64) V!24933 (_ BitVec 64)) Unit!28276)

(assert (=> b!825073 (= lt!372177 (addStillContains!313 lt!372162 lt!372172 zeroValueBefore!34 lt!372176))))

(assert (=> b!825073 (contains!4178 (+!1915 lt!372162 (tuple2!9959 lt!372172 zeroValueBefore!34)) lt!372176)))

(declare-fun lt!372164 () Unit!28276)

(assert (=> b!825073 (= lt!372164 lt!372177)))

(declare-fun lt!372174 () ListLongMap!8781)

(assert (=> b!825073 (= lt!372174 (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!372168 () (_ BitVec 64))

(assert (=> b!825073 (= lt!372168 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!372179 () (_ BitVec 64))

(assert (=> b!825073 (= lt!372179 (select (arr!22090 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!372161 () Unit!28276)

(declare-fun addApplyDifferent!313 (ListLongMap!8781 (_ BitVec 64) V!24933 (_ BitVec 64)) Unit!28276)

(assert (=> b!825073 (= lt!372161 (addApplyDifferent!313 lt!372174 lt!372168 minValue!754 lt!372179))))

(assert (=> b!825073 (= (apply!361 (+!1915 lt!372174 (tuple2!9959 lt!372168 minValue!754)) lt!372179) (apply!361 lt!372174 lt!372179))))

(declare-fun lt!372171 () Unit!28276)

(assert (=> b!825073 (= lt!372171 lt!372161)))

(declare-fun lt!372167 () ListLongMap!8781)

(assert (=> b!825073 (= lt!372167 (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!372163 () (_ BitVec 64))

(assert (=> b!825073 (= lt!372163 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!372160 () (_ BitVec 64))

(assert (=> b!825073 (= lt!372160 (select (arr!22090 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!372170 () Unit!28276)

(assert (=> b!825073 (= lt!372170 (addApplyDifferent!313 lt!372167 lt!372163 zeroValueBefore!34 lt!372160))))

(assert (=> b!825073 (= (apply!361 (+!1915 lt!372167 (tuple2!9959 lt!372163 zeroValueBefore!34)) lt!372160) (apply!361 lt!372167 lt!372160))))

(declare-fun lt!372175 () Unit!28276)

(assert (=> b!825073 (= lt!372175 lt!372170)))

(declare-fun lt!372178 () ListLongMap!8781)

(assert (=> b!825073 (= lt!372178 (getCurrentListMapNoExtraKeys!2419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!372169 () (_ BitVec 64))

(assert (=> b!825073 (= lt!372169 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!372159 () (_ BitVec 64))

(assert (=> b!825073 (= lt!372159 (select (arr!22090 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!825073 (= lt!372180 (addApplyDifferent!313 lt!372178 lt!372169 minValue!754 lt!372159))))

(assert (=> b!825073 (= (apply!361 (+!1915 lt!372178 (tuple2!9959 lt!372169 minValue!754)) lt!372159) (apply!361 lt!372178 lt!372159))))

(declare-fun b!825074 () Bool)

(declare-fun e!459146 () Bool)

(assert (=> b!825074 (= e!459135 e!459146)))

(declare-fun res!562448 () Bool)

(assert (=> b!825074 (= res!562448 call!35865)))

(assert (=> b!825074 (=> (not res!562448) (not e!459146))))

(declare-fun b!825075 () Bool)

(assert (=> b!825075 (= e!459146 (= (apply!361 lt!372166 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!825076 () Bool)

(assert (=> b!825076 (= e!459139 (validKeyInArray!0 (select (arr!22090 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825077 () Bool)

(assert (=> b!825077 (= e!459138 call!35868)))

(declare-fun b!825078 () Bool)

(declare-fun c!89427 () Bool)

(assert (=> b!825078 (= c!89427 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825078 (= e!459141 e!459138)))

(declare-fun b!825079 () Bool)

(assert (=> b!825079 (= e!459147 e!459141)))

(declare-fun c!89430 () Bool)

(assert (=> b!825079 (= c!89430 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35866 () Bool)

(assert (=> bm!35866 (= call!35869 call!35866)))

(declare-fun bm!35867 () Bool)

(assert (=> bm!35867 (= call!35866 (+!1915 (ite c!89426 call!35864 (ite c!89430 call!35867 call!35868)) (ite (or c!89426 c!89430) (tuple2!9959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9959 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!104975 c!89426) b!825069))

(assert (= (and d!104975 (not c!89426)) b!825079))

(assert (= (and b!825079 c!89430) b!825064))

(assert (= (and b!825079 (not c!89430)) b!825078))

(assert (= (and b!825078 c!89427) b!825063))

(assert (= (and b!825078 (not c!89427)) b!825077))

(assert (= (or b!825063 b!825077) bm!35863))

(assert (= (or b!825064 bm!35863) bm!35865))

(assert (= (or b!825064 b!825063) bm!35866))

(assert (= (or b!825069 bm!35865) bm!35861))

(assert (= (or b!825069 bm!35866) bm!35867))

(assert (= (and d!104975 res!562444) b!825076))

(assert (= (and d!104975 c!89425) b!825073))

(assert (= (and d!104975 (not c!89425)) b!825060))

(assert (= (and d!104975 res!562446) b!825067))

(assert (= (and b!825067 res!562450) b!825066))

(assert (= (and b!825067 (not res!562447)) b!825061))

(assert (= (and b!825061 res!562445) b!825072))

(assert (= (and b!825067 res!562449) b!825065))

(assert (= (and b!825065 c!89428) b!825068))

(assert (= (and b!825065 (not c!89428)) b!825062))

(assert (= (and b!825068 res!562442) b!825071))

(assert (= (or b!825068 b!825062) bm!35864))

(assert (= (and b!825065 res!562443) b!825070))

(assert (= (and b!825070 c!89429) b!825074))

(assert (= (and b!825070 (not c!89429)) b!825059))

(assert (= (and b!825074 res!562448) b!825075))

(assert (= (or b!825074 b!825059) bm!35862))

(declare-fun b_lambda!11103 () Bool)

(assert (=> (not b_lambda!11103) (not b!825072)))

(assert (=> b!825072 t!22110))

(declare-fun b_and!22155 () Bool)

(assert (= b_and!22153 (and (=> t!22110 result!7949) b_and!22155)))

(assert (=> bm!35861 m!766921))

(declare-fun m!767021 () Bool)

(assert (=> b!825075 m!767021))

(assert (=> b!825066 m!766957))

(assert (=> b!825066 m!766957))

(assert (=> b!825066 m!766961))

(assert (=> b!825072 m!766957))

(declare-fun m!767023 () Bool)

(assert (=> b!825072 m!767023))

(assert (=> b!825072 m!766977))

(assert (=> b!825072 m!766977))

(assert (=> b!825072 m!766981))

(assert (=> b!825072 m!766983))

(assert (=> b!825072 m!766957))

(assert (=> b!825072 m!766981))

(assert (=> b!825076 m!766957))

(assert (=> b!825076 m!766957))

(assert (=> b!825076 m!766961))

(assert (=> d!104975 m!766931))

(declare-fun m!767025 () Bool)

(assert (=> bm!35864 m!767025))

(declare-fun m!767027 () Bool)

(assert (=> b!825071 m!767027))

(declare-fun m!767029 () Bool)

(assert (=> bm!35867 m!767029))

(declare-fun m!767031 () Bool)

(assert (=> b!825069 m!767031))

(declare-fun m!767033 () Bool)

(assert (=> b!825073 m!767033))

(declare-fun m!767035 () Bool)

(assert (=> b!825073 m!767035))

(declare-fun m!767037 () Bool)

(assert (=> b!825073 m!767037))

(declare-fun m!767039 () Bool)

(assert (=> b!825073 m!767039))

(declare-fun m!767041 () Bool)

(assert (=> b!825073 m!767041))

(declare-fun m!767043 () Bool)

(assert (=> b!825073 m!767043))

(declare-fun m!767045 () Bool)

(assert (=> b!825073 m!767045))

(declare-fun m!767047 () Bool)

(assert (=> b!825073 m!767047))

(declare-fun m!767049 () Bool)

(assert (=> b!825073 m!767049))

(assert (=> b!825073 m!766921))

(declare-fun m!767051 () Bool)

(assert (=> b!825073 m!767051))

(declare-fun m!767053 () Bool)

(assert (=> b!825073 m!767053))

(declare-fun m!767055 () Bool)

(assert (=> b!825073 m!767055))

(declare-fun m!767057 () Bool)

(assert (=> b!825073 m!767057))

(assert (=> b!825073 m!766957))

(assert (=> b!825073 m!767047))

(assert (=> b!825073 m!767051))

(declare-fun m!767059 () Bool)

(assert (=> b!825073 m!767059))

(assert (=> b!825073 m!767033))

(assert (=> b!825073 m!767041))

(declare-fun m!767061 () Bool)

(assert (=> b!825073 m!767061))

(declare-fun m!767063 () Bool)

(assert (=> bm!35862 m!767063))

(assert (=> b!825061 m!766957))

(assert (=> b!825061 m!766957))

(declare-fun m!767065 () Bool)

(assert (=> b!825061 m!767065))

(assert (=> b!824908 d!104975))

(declare-fun mapNonEmpty!24049 () Bool)

(declare-fun mapRes!24049 () Bool)

(declare-fun tp!46480 () Bool)

(declare-fun e!459152 () Bool)

(assert (=> mapNonEmpty!24049 (= mapRes!24049 (and tp!46480 e!459152))))

(declare-fun mapRest!24049 () (Array (_ BitVec 32) ValueCell!7059))

(declare-fun mapValue!24049 () ValueCell!7059)

(declare-fun mapKey!24049 () (_ BitVec 32))

(assert (=> mapNonEmpty!24049 (= mapRest!24043 (store mapRest!24049 mapKey!24049 mapValue!24049))))

(declare-fun b!825086 () Bool)

(assert (=> b!825086 (= e!459152 tp_is_empty!14949)))

(declare-fun mapIsEmpty!24049 () Bool)

(assert (=> mapIsEmpty!24049 mapRes!24049))

(declare-fun condMapEmpty!24049 () Bool)

(declare-fun mapDefault!24049 () ValueCell!7059)

(assert (=> mapNonEmpty!24043 (= condMapEmpty!24049 (= mapRest!24043 ((as const (Array (_ BitVec 32) ValueCell!7059)) mapDefault!24049)))))

(declare-fun e!459153 () Bool)

(assert (=> mapNonEmpty!24043 (= tp!46471 (and e!459153 mapRes!24049))))

(declare-fun b!825087 () Bool)

(assert (=> b!825087 (= e!459153 tp_is_empty!14949)))

(assert (= (and mapNonEmpty!24043 condMapEmpty!24049) mapIsEmpty!24049))

(assert (= (and mapNonEmpty!24043 (not condMapEmpty!24049)) mapNonEmpty!24049))

(assert (= (and mapNonEmpty!24049 ((_ is ValueCellFull!7059) mapValue!24049)) b!825086))

(assert (= (and mapNonEmpty!24043 ((_ is ValueCellFull!7059) mapDefault!24049)) b!825087))

(declare-fun m!767067 () Bool)

(assert (=> mapNonEmpty!24049 m!767067))

(declare-fun b_lambda!11105 () Bool)

(assert (= b_lambda!11103 (or (and start!71036 b_free!13239) b_lambda!11105)))

(declare-fun b_lambda!11107 () Bool)

(assert (= b_lambda!11099 (or (and start!71036 b_free!13239) b_lambda!11107)))

(declare-fun b_lambda!11109 () Bool)

(assert (= b_lambda!11097 (or (and start!71036 b_free!13239) b_lambda!11109)))

(declare-fun b_lambda!11111 () Bool)

(assert (= b_lambda!11101 (or (and start!71036 b_free!13239) b_lambda!11111)))

(declare-fun b_lambda!11113 () Bool)

(assert (= b_lambda!11095 (or (and start!71036 b_free!13239) b_lambda!11113)))

(check-sat (not b!824999) (not d!104973) (not b_lambda!11107) (not b!824992) (not b!825015) (not b!824966) (not b!825012) (not b!825073) (not b!824964) (not b_next!13239) (not b!824996) (not b!824950) tp_is_empty!14949 (not d!104975) (not bm!35867) (not b!825016) (not b!825061) (not b!824997) (not bm!35864) (not b!824995) (not bm!35861) (not b!825006) (not bm!35862) (not bm!35839) (not mapNonEmpty!24049) (not b!825009) (not b_lambda!11105) (not b!824954) (not b!825066) (not bm!35842) (not b!825013) (not b!825072) (not b!824998) (not bm!35845) (not b!825002) (not d!104971) (not b_lambda!11111) (not b!825076) (not d!104969) (not b!825075) (not b!824952) (not bm!35846) (not b!825011) (not b_lambda!11113) b_and!22155 (not b_lambda!11109) (not b!825010) (not b!825001) (not b!825071) (not b!825069))
(check-sat b_and!22155 (not b_next!13239))
