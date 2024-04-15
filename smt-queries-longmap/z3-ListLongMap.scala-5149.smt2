; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69826 () Bool)

(assert start!69826)

(declare-fun b!811985 () Bool)

(declare-fun e!449678 () Bool)

(declare-fun tp_is_empty!14011 () Bool)

(assert (=> b!811985 (= e!449678 tp_is_empty!14011)))

(declare-fun mapNonEmpty!22588 () Bool)

(declare-fun mapRes!22588 () Bool)

(declare-fun tp!43696 () Bool)

(assert (=> mapNonEmpty!22588 (= mapRes!22588 (and tp!43696 e!449678))))

(declare-fun mapKey!22588 () (_ BitVec 32))

(declare-datatypes ((V!23683 0))(
  ( (V!23684 (val!7053 Int)) )
))
(declare-datatypes ((ValueCell!6590 0))(
  ( (ValueCellFull!6590 (v!9473 V!23683)) (EmptyCell!6590) )
))
(declare-datatypes ((array!44245 0))(
  ( (array!44246 (arr!21186 (Array (_ BitVec 32) ValueCell!6590)) (size!21607 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44245)

(declare-fun mapRest!22588 () (Array (_ BitVec 32) ValueCell!6590))

(declare-fun mapValue!22588 () ValueCell!6590)

(assert (=> mapNonEmpty!22588 (= (arr!21186 _values!788) (store mapRest!22588 mapKey!22588 mapValue!22588))))

(declare-fun b!811986 () Bool)

(declare-fun e!449680 () Bool)

(assert (=> b!811986 (= e!449680 tp_is_empty!14011)))

(declare-fun b!811987 () Bool)

(declare-fun e!449682 () Bool)

(declare-fun e!449679 () Bool)

(assert (=> b!811987 (= e!449682 e!449679)))

(declare-fun res!554957 () Bool)

(assert (=> b!811987 (=> res!554957 e!449679)))

(declare-datatypes ((List!15130 0))(
  ( (Nil!15127) (Cons!15126 (h!16255 (_ BitVec 64)) (t!21436 List!15130)) )
))
(declare-fun contains!4118 (List!15130 (_ BitVec 64)) Bool)

(assert (=> b!811987 (= res!554957 (contains!4118 Nil!15127 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!811988 () Bool)

(assert (=> b!811988 (= e!449679 (contains!4118 Nil!15127 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!554956 () Bool)

(assert (=> start!69826 (=> (not res!554956) (not e!449682))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69826 (= res!554956 (validMask!0 mask!1312))))

(assert (=> start!69826 e!449682))

(declare-datatypes ((array!44247 0))(
  ( (array!44248 (arr!21187 (Array (_ BitVec 32) (_ BitVec 64))) (size!21608 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44247)

(declare-fun array_inv!17061 (array!44247) Bool)

(assert (=> start!69826 (array_inv!17061 _keys!976)))

(assert (=> start!69826 true))

(declare-fun e!449683 () Bool)

(declare-fun array_inv!17062 (array!44245) Bool)

(assert (=> start!69826 (and (array_inv!17062 _values!788) e!449683)))

(declare-fun b!811989 () Bool)

(declare-fun res!554953 () Bool)

(assert (=> b!811989 (=> (not res!554953) (not e!449682))))

(assert (=> b!811989 (= res!554953 (and (bvsle #b00000000000000000000000000000000 (size!21608 _keys!976)) (bvslt (size!21608 _keys!976) #b01111111111111111111111111111111)))))

(declare-fun b!811990 () Bool)

(assert (=> b!811990 (= e!449683 (and e!449680 mapRes!22588))))

(declare-fun condMapEmpty!22588 () Bool)

(declare-fun mapDefault!22588 () ValueCell!6590)

(assert (=> b!811990 (= condMapEmpty!22588 (= (arr!21186 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6590)) mapDefault!22588)))))

(declare-fun b!811991 () Bool)

(declare-fun res!554954 () Bool)

(assert (=> b!811991 (=> (not res!554954) (not e!449682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44247 (_ BitVec 32)) Bool)

(assert (=> b!811991 (= res!554954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22588 () Bool)

(assert (=> mapIsEmpty!22588 mapRes!22588))

(declare-fun b!811992 () Bool)

(declare-fun res!554955 () Bool)

(assert (=> b!811992 (=> (not res!554955) (not e!449682))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!811992 (= res!554955 (and (= (size!21607 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21608 _keys!976) (size!21607 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!811993 () Bool)

(declare-fun res!554958 () Bool)

(assert (=> b!811993 (=> (not res!554958) (not e!449682))))

(declare-fun noDuplicate!1298 (List!15130) Bool)

(assert (=> b!811993 (= res!554958 (noDuplicate!1298 Nil!15127))))

(assert (= (and start!69826 res!554956) b!811992))

(assert (= (and b!811992 res!554955) b!811991))

(assert (= (and b!811991 res!554954) b!811989))

(assert (= (and b!811989 res!554953) b!811993))

(assert (= (and b!811993 res!554958) b!811987))

(assert (= (and b!811987 (not res!554957)) b!811988))

(assert (= (and b!811990 condMapEmpty!22588) mapIsEmpty!22588))

(assert (= (and b!811990 (not condMapEmpty!22588)) mapNonEmpty!22588))

(get-info :version)

(assert (= (and mapNonEmpty!22588 ((_ is ValueCellFull!6590) mapValue!22588)) b!811985))

(assert (= (and b!811990 ((_ is ValueCellFull!6590) mapDefault!22588)) b!811986))

(assert (= start!69826 b!811990))

(declare-fun m!753933 () Bool)

(assert (=> b!811987 m!753933))

(declare-fun m!753935 () Bool)

(assert (=> b!811988 m!753935))

(declare-fun m!753937 () Bool)

(assert (=> start!69826 m!753937))

(declare-fun m!753939 () Bool)

(assert (=> start!69826 m!753939))

(declare-fun m!753941 () Bool)

(assert (=> start!69826 m!753941))

(declare-fun m!753943 () Bool)

(assert (=> b!811991 m!753943))

(declare-fun m!753945 () Bool)

(assert (=> b!811993 m!753945))

(declare-fun m!753947 () Bool)

(assert (=> mapNonEmpty!22588 m!753947))

(check-sat (not start!69826) (not b!811993) (not b!811991) tp_is_empty!14011 (not b!811988) (not b!811987) (not mapNonEmpty!22588))
(check-sat)
(get-model)

(declare-fun b!812056 () Bool)

(declare-fun e!449727 () Bool)

(declare-fun call!35458 () Bool)

(assert (=> b!812056 (= e!449727 call!35458)))

(declare-fun b!812057 () Bool)

(declare-fun e!449728 () Bool)

(assert (=> b!812057 (= e!449728 e!449727)))

(declare-fun lt!363871 () (_ BitVec 64))

(assert (=> b!812057 (= lt!363871 (select (arr!21187 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27666 0))(
  ( (Unit!27667) )
))
(declare-fun lt!363872 () Unit!27666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44247 (_ BitVec 64) (_ BitVec 32)) Unit!27666)

(assert (=> b!812057 (= lt!363872 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!363871 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812057 (arrayContainsKey!0 _keys!976 lt!363871 #b00000000000000000000000000000000)))

(declare-fun lt!363870 () Unit!27666)

(assert (=> b!812057 (= lt!363870 lt!363872)))

(declare-fun res!554999 () Bool)

(declare-datatypes ((SeekEntryResult!8713 0))(
  ( (MissingZero!8713 (index!37223 (_ BitVec 32))) (Found!8713 (index!37224 (_ BitVec 32))) (Intermediate!8713 (undefined!9525 Bool) (index!37225 (_ BitVec 32)) (x!68193 (_ BitVec 32))) (Undefined!8713) (MissingVacant!8713 (index!37226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44247 (_ BitVec 32)) SeekEntryResult!8713)

(assert (=> b!812057 (= res!554999 (= (seekEntryOrOpen!0 (select (arr!21187 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8713 #b00000000000000000000000000000000)))))

(assert (=> b!812057 (=> (not res!554999) (not e!449727))))

(declare-fun bm!35455 () Bool)

(assert (=> bm!35455 (= call!35458 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!812058 () Bool)

(assert (=> b!812058 (= e!449728 call!35458)))

(declare-fun d!104127 () Bool)

(declare-fun res!555000 () Bool)

(declare-fun e!449726 () Bool)

(assert (=> d!104127 (=> res!555000 e!449726)))

(assert (=> d!104127 (= res!555000 (bvsge #b00000000000000000000000000000000 (size!21608 _keys!976)))))

(assert (=> d!104127 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!449726)))

(declare-fun b!812059 () Bool)

(assert (=> b!812059 (= e!449726 e!449728)))

(declare-fun c!88830 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812059 (= c!88830 (validKeyInArray!0 (select (arr!21187 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104127 (not res!555000)) b!812059))

(assert (= (and b!812059 c!88830) b!812057))

(assert (= (and b!812059 (not c!88830)) b!812058))

(assert (= (and b!812057 res!554999) b!812056))

(assert (= (or b!812056 b!812058) bm!35455))

(declare-fun m!753981 () Bool)

(assert (=> b!812057 m!753981))

(declare-fun m!753983 () Bool)

(assert (=> b!812057 m!753983))

(declare-fun m!753985 () Bool)

(assert (=> b!812057 m!753985))

(assert (=> b!812057 m!753981))

(declare-fun m!753987 () Bool)

(assert (=> b!812057 m!753987))

(declare-fun m!753989 () Bool)

(assert (=> bm!35455 m!753989))

(assert (=> b!812059 m!753981))

(assert (=> b!812059 m!753981))

(declare-fun m!753991 () Bool)

(assert (=> b!812059 m!753991))

(assert (=> b!811991 d!104127))

(declare-fun d!104129 () Bool)

(assert (=> d!104129 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69826 d!104129))

(declare-fun d!104131 () Bool)

(assert (=> d!104131 (= (array_inv!17061 _keys!976) (bvsge (size!21608 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69826 d!104131))

(declare-fun d!104133 () Bool)

(assert (=> d!104133 (= (array_inv!17062 _values!788) (bvsge (size!21607 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69826 d!104133))

(declare-fun d!104135 () Bool)

(declare-fun lt!363875 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!383 (List!15130) (InoxSet (_ BitVec 64)))

(assert (=> d!104135 (= lt!363875 (select (content!383 Nil!15127) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!449733 () Bool)

(assert (=> d!104135 (= lt!363875 e!449733)))

(declare-fun res!555005 () Bool)

(assert (=> d!104135 (=> (not res!555005) (not e!449733))))

(assert (=> d!104135 (= res!555005 ((_ is Cons!15126) Nil!15127))))

(assert (=> d!104135 (= (contains!4118 Nil!15127 #b0000000000000000000000000000000000000000000000000000000000000000) lt!363875)))

(declare-fun b!812064 () Bool)

(declare-fun e!449734 () Bool)

(assert (=> b!812064 (= e!449733 e!449734)))

(declare-fun res!555006 () Bool)

(assert (=> b!812064 (=> res!555006 e!449734)))

(assert (=> b!812064 (= res!555006 (= (h!16255 Nil!15127) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!812065 () Bool)

(assert (=> b!812065 (= e!449734 (contains!4118 (t!21436 Nil!15127) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!104135 res!555005) b!812064))

(assert (= (and b!812064 (not res!555006)) b!812065))

(declare-fun m!753993 () Bool)

(assert (=> d!104135 m!753993))

(declare-fun m!753995 () Bool)

(assert (=> d!104135 m!753995))

(declare-fun m!753997 () Bool)

(assert (=> b!812065 m!753997))

(assert (=> b!811987 d!104135))

(declare-fun d!104137 () Bool)

(declare-fun lt!363876 () Bool)

(assert (=> d!104137 (= lt!363876 (select (content!383 Nil!15127) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!449735 () Bool)

(assert (=> d!104137 (= lt!363876 e!449735)))

(declare-fun res!555007 () Bool)

(assert (=> d!104137 (=> (not res!555007) (not e!449735))))

(assert (=> d!104137 (= res!555007 ((_ is Cons!15126) Nil!15127))))

(assert (=> d!104137 (= (contains!4118 Nil!15127 #b1000000000000000000000000000000000000000000000000000000000000000) lt!363876)))

(declare-fun b!812066 () Bool)

(declare-fun e!449736 () Bool)

(assert (=> b!812066 (= e!449735 e!449736)))

(declare-fun res!555008 () Bool)

(assert (=> b!812066 (=> res!555008 e!449736)))

(assert (=> b!812066 (= res!555008 (= (h!16255 Nil!15127) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!812067 () Bool)

(assert (=> b!812067 (= e!449736 (contains!4118 (t!21436 Nil!15127) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!104137 res!555007) b!812066))

(assert (= (and b!812066 (not res!555008)) b!812067))

(assert (=> d!104137 m!753993))

(declare-fun m!753999 () Bool)

(assert (=> d!104137 m!753999))

(declare-fun m!754001 () Bool)

(assert (=> b!812067 m!754001))

(assert (=> b!811988 d!104137))

(declare-fun d!104139 () Bool)

(declare-fun res!555013 () Bool)

(declare-fun e!449741 () Bool)

(assert (=> d!104139 (=> res!555013 e!449741)))

(assert (=> d!104139 (= res!555013 ((_ is Nil!15127) Nil!15127))))

(assert (=> d!104139 (= (noDuplicate!1298 Nil!15127) e!449741)))

(declare-fun b!812072 () Bool)

(declare-fun e!449742 () Bool)

(assert (=> b!812072 (= e!449741 e!449742)))

(declare-fun res!555014 () Bool)

(assert (=> b!812072 (=> (not res!555014) (not e!449742))))

(assert (=> b!812072 (= res!555014 (not (contains!4118 (t!21436 Nil!15127) (h!16255 Nil!15127))))))

(declare-fun b!812073 () Bool)

(assert (=> b!812073 (= e!449742 (noDuplicate!1298 (t!21436 Nil!15127)))))

(assert (= (and d!104139 (not res!555013)) b!812072))

(assert (= (and b!812072 res!555014) b!812073))

(declare-fun m!754003 () Bool)

(assert (=> b!812072 m!754003))

(declare-fun m!754005 () Bool)

(assert (=> b!812073 m!754005))

(assert (=> b!811993 d!104139))

(declare-fun b!812080 () Bool)

(declare-fun e!449748 () Bool)

(assert (=> b!812080 (= e!449748 tp_is_empty!14011)))

(declare-fun mapNonEmpty!22597 () Bool)

(declare-fun mapRes!22597 () Bool)

(declare-fun tp!43705 () Bool)

(assert (=> mapNonEmpty!22597 (= mapRes!22597 (and tp!43705 e!449748))))

(declare-fun mapKey!22597 () (_ BitVec 32))

(declare-fun mapRest!22597 () (Array (_ BitVec 32) ValueCell!6590))

(declare-fun mapValue!22597 () ValueCell!6590)

(assert (=> mapNonEmpty!22597 (= mapRest!22588 (store mapRest!22597 mapKey!22597 mapValue!22597))))

(declare-fun condMapEmpty!22597 () Bool)

(declare-fun mapDefault!22597 () ValueCell!6590)

(assert (=> mapNonEmpty!22588 (= condMapEmpty!22597 (= mapRest!22588 ((as const (Array (_ BitVec 32) ValueCell!6590)) mapDefault!22597)))))

(declare-fun e!449747 () Bool)

(assert (=> mapNonEmpty!22588 (= tp!43696 (and e!449747 mapRes!22597))))

(declare-fun b!812081 () Bool)

(assert (=> b!812081 (= e!449747 tp_is_empty!14011)))

(declare-fun mapIsEmpty!22597 () Bool)

(assert (=> mapIsEmpty!22597 mapRes!22597))

(assert (= (and mapNonEmpty!22588 condMapEmpty!22597) mapIsEmpty!22597))

(assert (= (and mapNonEmpty!22588 (not condMapEmpty!22597)) mapNonEmpty!22597))

(assert (= (and mapNonEmpty!22597 ((_ is ValueCellFull!6590) mapValue!22597)) b!812080))

(assert (= (and mapNonEmpty!22588 ((_ is ValueCellFull!6590) mapDefault!22597)) b!812081))

(declare-fun m!754007 () Bool)

(assert (=> mapNonEmpty!22597 m!754007))

(check-sat (not b!812057) (not d!104137) (not b!812067) (not b!812072) (not d!104135) (not bm!35455) (not mapNonEmpty!22597) (not b!812059) (not b!812073) tp_is_empty!14011 (not b!812065))
(check-sat)
