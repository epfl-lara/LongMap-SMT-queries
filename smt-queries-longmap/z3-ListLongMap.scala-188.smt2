; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3726 () Bool)

(assert start!3726)

(declare-fun b!26017 () Bool)

(declare-fun res!15465 () Bool)

(declare-fun e!16886 () Bool)

(assert (=> b!26017 (=> (not res!15465) (not e!16886))))

(declare-datatypes ((array!1365 0))(
  ( (array!1366 (arr!641 (Array (_ BitVec 32) (_ BitVec 64))) (size!742 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1365)

(assert (=> b!26017 (= res!15465 (and (bvsle #b00000000000000000000000000000000 (size!742 _keys!1833)) (bvslt (size!742 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!26018 () Bool)

(declare-fun e!16881 () Bool)

(declare-datatypes ((List!575 0))(
  ( (Nil!572) (Cons!571 (h!1138 (_ BitVec 64)) (t!3255 List!575)) )
))
(declare-fun contains!236 (List!575 (_ BitVec 64)) Bool)

(assert (=> b!26018 (= e!16881 (contains!236 Nil!572 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26019 () Bool)

(declare-fun res!15468 () Bool)

(assert (=> b!26019 (=> (not res!15468) (not e!16886))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1365 (_ BitVec 32)) Bool)

(assert (=> b!26019 (= res!15468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26020 () Bool)

(declare-fun res!15470 () Bool)

(assert (=> b!26020 (=> (not res!15470) (not e!16886))))

(declare-fun noDuplicate!11 (List!575) Bool)

(assert (=> b!26020 (= res!15470 (noDuplicate!11 Nil!572))))

(declare-fun b!26021 () Bool)

(declare-fun e!16885 () Bool)

(declare-fun e!16882 () Bool)

(declare-fun mapRes!1117 () Bool)

(assert (=> b!26021 (= e!16885 (and e!16882 mapRes!1117))))

(declare-fun condMapEmpty!1117 () Bool)

(declare-datatypes ((V!1251 0))(
  ( (V!1252 (val!561 Int)) )
))
(declare-datatypes ((ValueCell!335 0))(
  ( (ValueCellFull!335 (v!1645 V!1251)) (EmptyCell!335) )
))
(declare-datatypes ((array!1367 0))(
  ( (array!1368 (arr!642 (Array (_ BitVec 32) ValueCell!335)) (size!743 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1367)

(declare-fun mapDefault!1117 () ValueCell!335)

(assert (=> b!26021 (= condMapEmpty!1117 (= (arr!642 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!335)) mapDefault!1117)))))

(declare-fun b!26022 () Bool)

(assert (=> b!26022 (= e!16886 e!16881)))

(declare-fun res!15466 () Bool)

(assert (=> b!26022 (=> res!15466 e!16881)))

(assert (=> b!26022 (= res!15466 (contains!236 Nil!572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26023 () Bool)

(declare-fun e!16883 () Bool)

(declare-fun tp_is_empty!1069 () Bool)

(assert (=> b!26023 (= e!16883 tp_is_empty!1069)))

(declare-fun b!26024 () Bool)

(assert (=> b!26024 (= e!16882 tp_is_empty!1069)))

(declare-fun b!26025 () Bool)

(declare-fun res!15467 () Bool)

(assert (=> b!26025 (=> (not res!15467) (not e!16886))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26025 (= res!15467 (and (= (size!743 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!742 _keys!1833) (size!743 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1117 () Bool)

(declare-fun tp!3637 () Bool)

(assert (=> mapNonEmpty!1117 (= mapRes!1117 (and tp!3637 e!16883))))

(declare-fun mapKey!1117 () (_ BitVec 32))

(declare-fun mapValue!1117 () ValueCell!335)

(declare-fun mapRest!1117 () (Array (_ BitVec 32) ValueCell!335))

(assert (=> mapNonEmpty!1117 (= (arr!642 _values!1501) (store mapRest!1117 mapKey!1117 mapValue!1117))))

(declare-fun mapIsEmpty!1117 () Bool)

(assert (=> mapIsEmpty!1117 mapRes!1117))

(declare-fun res!15469 () Bool)

(assert (=> start!3726 (=> (not res!15469) (not e!16886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3726 (= res!15469 (validMask!0 mask!2294))))

(assert (=> start!3726 e!16886))

(assert (=> start!3726 true))

(declare-fun array_inv!453 (array!1367) Bool)

(assert (=> start!3726 (and (array_inv!453 _values!1501) e!16885)))

(declare-fun array_inv!454 (array!1365) Bool)

(assert (=> start!3726 (array_inv!454 _keys!1833)))

(assert (= (and start!3726 res!15469) b!26025))

(assert (= (and b!26025 res!15467) b!26019))

(assert (= (and b!26019 res!15468) b!26017))

(assert (= (and b!26017 res!15465) b!26020))

(assert (= (and b!26020 res!15470) b!26022))

(assert (= (and b!26022 (not res!15466)) b!26018))

(assert (= (and b!26021 condMapEmpty!1117) mapIsEmpty!1117))

(assert (= (and b!26021 (not condMapEmpty!1117)) mapNonEmpty!1117))

(get-info :version)

(assert (= (and mapNonEmpty!1117 ((_ is ValueCellFull!335) mapValue!1117)) b!26023))

(assert (= (and b!26021 ((_ is ValueCellFull!335) mapDefault!1117)) b!26024))

(assert (= start!3726 b!26021))

(declare-fun m!20895 () Bool)

(assert (=> b!26018 m!20895))

(declare-fun m!20897 () Bool)

(assert (=> b!26020 m!20897))

(declare-fun m!20899 () Bool)

(assert (=> start!3726 m!20899))

(declare-fun m!20901 () Bool)

(assert (=> start!3726 m!20901))

(declare-fun m!20903 () Bool)

(assert (=> start!3726 m!20903))

(declare-fun m!20905 () Bool)

(assert (=> mapNonEmpty!1117 m!20905))

(declare-fun m!20907 () Bool)

(assert (=> b!26019 m!20907))

(declare-fun m!20909 () Bool)

(assert (=> b!26022 m!20909))

(check-sat (not b!26020) (not b!26019) (not start!3726) tp_is_empty!1069 (not b!26022) (not mapNonEmpty!1117) (not b!26018))
(check-sat)
(get-model)

(declare-fun d!4825 () Bool)

(declare-fun lt!10305 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!17 (List!575) (InoxSet (_ BitVec 64)))

(assert (=> d!4825 (= lt!10305 (select (content!17 Nil!572) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16928 () Bool)

(assert (=> d!4825 (= lt!10305 e!16928)))

(declare-fun res!15512 () Bool)

(assert (=> d!4825 (=> (not res!15512) (not e!16928))))

(assert (=> d!4825 (= res!15512 ((_ is Cons!571) Nil!572))))

(assert (=> d!4825 (= (contains!236 Nil!572 #b0000000000000000000000000000000000000000000000000000000000000000) lt!10305)))

(declare-fun b!26084 () Bool)

(declare-fun e!16927 () Bool)

(assert (=> b!26084 (= e!16928 e!16927)))

(declare-fun res!15511 () Bool)

(assert (=> b!26084 (=> res!15511 e!16927)))

(assert (=> b!26084 (= res!15511 (= (h!1138 Nil!572) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26085 () Bool)

(assert (=> b!26085 (= e!16927 (contains!236 (t!3255 Nil!572) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!4825 res!15512) b!26084))

(assert (= (and b!26084 (not res!15511)) b!26085))

(declare-fun m!20943 () Bool)

(assert (=> d!4825 m!20943))

(declare-fun m!20945 () Bool)

(assert (=> d!4825 m!20945))

(declare-fun m!20947 () Bool)

(assert (=> b!26085 m!20947))

(assert (=> b!26022 d!4825))

(declare-fun d!4827 () Bool)

(declare-fun lt!10306 () Bool)

(assert (=> d!4827 (= lt!10306 (select (content!17 Nil!572) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!16930 () Bool)

(assert (=> d!4827 (= lt!10306 e!16930)))

(declare-fun res!15514 () Bool)

(assert (=> d!4827 (=> (not res!15514) (not e!16930))))

(assert (=> d!4827 (= res!15514 ((_ is Cons!571) Nil!572))))

(assert (=> d!4827 (= (contains!236 Nil!572 #b1000000000000000000000000000000000000000000000000000000000000000) lt!10306)))

(declare-fun b!26086 () Bool)

(declare-fun e!16929 () Bool)

(assert (=> b!26086 (= e!16930 e!16929)))

(declare-fun res!15513 () Bool)

(assert (=> b!26086 (=> res!15513 e!16929)))

(assert (=> b!26086 (= res!15513 (= (h!1138 Nil!572) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!26087 () Bool)

(assert (=> b!26087 (= e!16929 (contains!236 (t!3255 Nil!572) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!4827 res!15514) b!26086))

(assert (= (and b!26086 (not res!15513)) b!26087))

(assert (=> d!4827 m!20943))

(declare-fun m!20949 () Bool)

(assert (=> d!4827 m!20949))

(declare-fun m!20951 () Bool)

(assert (=> b!26087 m!20951))

(assert (=> b!26018 d!4827))

(declare-fun bm!2498 () Bool)

(declare-fun call!2501 () Bool)

(assert (=> bm!2498 (= call!2501 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!26096 () Bool)

(declare-fun e!16938 () Bool)

(assert (=> b!26096 (= e!16938 call!2501)))

(declare-fun b!26097 () Bool)

(declare-fun e!16937 () Bool)

(declare-fun e!16939 () Bool)

(assert (=> b!26097 (= e!16937 e!16939)))

(declare-fun c!3639 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26097 (= c!3639 (validKeyInArray!0 (select (arr!641 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!4829 () Bool)

(declare-fun res!15520 () Bool)

(assert (=> d!4829 (=> res!15520 e!16937)))

(assert (=> d!4829 (= res!15520 (bvsge #b00000000000000000000000000000000 (size!742 _keys!1833)))))

(assert (=> d!4829 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!16937)))

(declare-fun b!26098 () Bool)

(assert (=> b!26098 (= e!16939 call!2501)))

(declare-fun b!26099 () Bool)

(assert (=> b!26099 (= e!16939 e!16938)))

(declare-fun lt!10315 () (_ BitVec 64))

(assert (=> b!26099 (= lt!10315 (select (arr!641 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!630 0))(
  ( (Unit!631) )
))
(declare-fun lt!10314 () Unit!630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1365 (_ BitVec 64) (_ BitVec 32)) Unit!630)

(assert (=> b!26099 (= lt!10314 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10315 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!26099 (arrayContainsKey!0 _keys!1833 lt!10315 #b00000000000000000000000000000000)))

(declare-fun lt!10313 () Unit!630)

(assert (=> b!26099 (= lt!10313 lt!10314)))

(declare-fun res!15519 () Bool)

(declare-datatypes ((SeekEntryResult!61 0))(
  ( (MissingZero!61 (index!2366 (_ BitVec 32))) (Found!61 (index!2367 (_ BitVec 32))) (Intermediate!61 (undefined!873 Bool) (index!2368 (_ BitVec 32)) (x!6075 (_ BitVec 32))) (Undefined!61) (MissingVacant!61 (index!2369 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1365 (_ BitVec 32)) SeekEntryResult!61)

(assert (=> b!26099 (= res!15519 (= (seekEntryOrOpen!0 (select (arr!641 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!61 #b00000000000000000000000000000000)))))

(assert (=> b!26099 (=> (not res!15519) (not e!16938))))

(assert (= (and d!4829 (not res!15520)) b!26097))

(assert (= (and b!26097 c!3639) b!26099))

(assert (= (and b!26097 (not c!3639)) b!26098))

(assert (= (and b!26099 res!15519) b!26096))

(assert (= (or b!26096 b!26098) bm!2498))

(declare-fun m!20953 () Bool)

(assert (=> bm!2498 m!20953))

(declare-fun m!20955 () Bool)

(assert (=> b!26097 m!20955))

(assert (=> b!26097 m!20955))

(declare-fun m!20957 () Bool)

(assert (=> b!26097 m!20957))

(assert (=> b!26099 m!20955))

(declare-fun m!20959 () Bool)

(assert (=> b!26099 m!20959))

(declare-fun m!20961 () Bool)

(assert (=> b!26099 m!20961))

(assert (=> b!26099 m!20955))

(declare-fun m!20963 () Bool)

(assert (=> b!26099 m!20963))

(assert (=> b!26019 d!4829))

(declare-fun d!4831 () Bool)

(declare-fun res!15525 () Bool)

(declare-fun e!16944 () Bool)

(assert (=> d!4831 (=> res!15525 e!16944)))

(assert (=> d!4831 (= res!15525 ((_ is Nil!572) Nil!572))))

(assert (=> d!4831 (= (noDuplicate!11 Nil!572) e!16944)))

(declare-fun b!26104 () Bool)

(declare-fun e!16945 () Bool)

(assert (=> b!26104 (= e!16944 e!16945)))

(declare-fun res!15526 () Bool)

(assert (=> b!26104 (=> (not res!15526) (not e!16945))))

(assert (=> b!26104 (= res!15526 (not (contains!236 (t!3255 Nil!572) (h!1138 Nil!572))))))

(declare-fun b!26105 () Bool)

(assert (=> b!26105 (= e!16945 (noDuplicate!11 (t!3255 Nil!572)))))

(assert (= (and d!4831 (not res!15525)) b!26104))

(assert (= (and b!26104 res!15526) b!26105))

(declare-fun m!20965 () Bool)

(assert (=> b!26104 m!20965))

(declare-fun m!20967 () Bool)

(assert (=> b!26105 m!20967))

(assert (=> b!26020 d!4831))

(declare-fun d!4833 () Bool)

(assert (=> d!4833 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3726 d!4833))

(declare-fun d!4835 () Bool)

(assert (=> d!4835 (= (array_inv!453 _values!1501) (bvsge (size!743 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3726 d!4835))

(declare-fun d!4837 () Bool)

(assert (=> d!4837 (= (array_inv!454 _keys!1833) (bvsge (size!742 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3726 d!4837))

(declare-fun b!26112 () Bool)

(declare-fun e!16951 () Bool)

(assert (=> b!26112 (= e!16951 tp_is_empty!1069)))

(declare-fun condMapEmpty!1126 () Bool)

(declare-fun mapDefault!1126 () ValueCell!335)

(assert (=> mapNonEmpty!1117 (= condMapEmpty!1126 (= mapRest!1117 ((as const (Array (_ BitVec 32) ValueCell!335)) mapDefault!1126)))))

(declare-fun e!16950 () Bool)

(declare-fun mapRes!1126 () Bool)

(assert (=> mapNonEmpty!1117 (= tp!3637 (and e!16950 mapRes!1126))))

(declare-fun mapIsEmpty!1126 () Bool)

(assert (=> mapIsEmpty!1126 mapRes!1126))

(declare-fun mapNonEmpty!1126 () Bool)

(declare-fun tp!3646 () Bool)

(assert (=> mapNonEmpty!1126 (= mapRes!1126 (and tp!3646 e!16951))))

(declare-fun mapRest!1126 () (Array (_ BitVec 32) ValueCell!335))

(declare-fun mapValue!1126 () ValueCell!335)

(declare-fun mapKey!1126 () (_ BitVec 32))

(assert (=> mapNonEmpty!1126 (= mapRest!1117 (store mapRest!1126 mapKey!1126 mapValue!1126))))

(declare-fun b!26113 () Bool)

(assert (=> b!26113 (= e!16950 tp_is_empty!1069)))

(assert (= (and mapNonEmpty!1117 condMapEmpty!1126) mapIsEmpty!1126))

(assert (= (and mapNonEmpty!1117 (not condMapEmpty!1126)) mapNonEmpty!1126))

(assert (= (and mapNonEmpty!1126 ((_ is ValueCellFull!335) mapValue!1126)) b!26112))

(assert (= (and mapNonEmpty!1117 ((_ is ValueCellFull!335) mapDefault!1126)) b!26113))

(declare-fun m!20969 () Bool)

(assert (=> mapNonEmpty!1126 m!20969))

(check-sat (not d!4825) (not b!26085) (not mapNonEmpty!1126) (not b!26087) tp_is_empty!1069 (not d!4827) (not b!26105) (not b!26099) (not b!26097) (not bm!2498) (not b!26104))
(check-sat)
