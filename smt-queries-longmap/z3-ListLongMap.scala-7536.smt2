; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95522 () Bool)

(assert start!95522)

(declare-fun b!1078903 () Bool)

(declare-fun res!718949 () Bool)

(declare-fun e!616860 () Bool)

(assert (=> b!1078903 (=> (not res!718949) (not e!616860))))

(declare-datatypes ((array!69341 0))(
  ( (array!69342 (arr!33345 (Array (_ BitVec 32) (_ BitVec 64))) (size!33881 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69341)

(declare-datatypes ((List!23250 0))(
  ( (Nil!23247) (Cons!23246 (h!24455 (_ BitVec 64)) (t!32609 List!23250)) )
))
(declare-fun arrayNoDuplicates!0 (array!69341 (_ BitVec 32) List!23250) Bool)

(assert (=> b!1078903 (= res!718949 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23247))))

(declare-fun res!718950 () Bool)

(assert (=> start!95522 (=> (not res!718950) (not e!616860))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95522 (= res!718950 (validMask!0 mask!1414))))

(assert (=> start!95522 e!616860))

(assert (=> start!95522 true))

(declare-fun array_inv!25760 (array!69341) Bool)

(assert (=> start!95522 (array_inv!25760 _keys!1070)))

(declare-datatypes ((V!40051 0))(
  ( (V!40052 (val!13153 Int)) )
))
(declare-datatypes ((ValueCell!12387 0))(
  ( (ValueCellFull!12387 (v!15774 V!40051)) (EmptyCell!12387) )
))
(declare-datatypes ((array!69343 0))(
  ( (array!69344 (arr!33346 (Array (_ BitVec 32) ValueCell!12387)) (size!33882 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69343)

(declare-fun e!616858 () Bool)

(declare-fun array_inv!25761 (array!69343) Bool)

(assert (=> start!95522 (and (array_inv!25761 _values!874) e!616858)))

(declare-fun b!1078904 () Bool)

(declare-fun res!718952 () Bool)

(assert (=> b!1078904 (=> (not res!718952) (not e!616860))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078904 (= res!718952 (validKeyInArray!0 k0!904))))

(declare-fun b!1078905 () Bool)

(declare-fun e!616857 () Bool)

(declare-fun mapRes!41041 () Bool)

(assert (=> b!1078905 (= e!616858 (and e!616857 mapRes!41041))))

(declare-fun condMapEmpty!41041 () Bool)

(declare-fun mapDefault!41041 () ValueCell!12387)

(assert (=> b!1078905 (= condMapEmpty!41041 (= (arr!33346 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12387)) mapDefault!41041)))))

(declare-fun b!1078906 () Bool)

(declare-fun res!718957 () Bool)

(declare-fun e!616859 () Bool)

(assert (=> b!1078906 (=> (not res!718957) (not e!616859))))

(declare-fun lt!478717 () array!69341)

(assert (=> b!1078906 (= res!718957 (arrayNoDuplicates!0 lt!478717 #b00000000000000000000000000000000 Nil!23247))))

(declare-fun b!1078907 () Bool)

(assert (=> b!1078907 (= e!616859 (not (or (bvsge #b00000000000000000000000000000000 (size!33881 _keys!1070)) (bvslt (size!33881 _keys!1070) #b01111111111111111111111111111111))))))

(declare-fun arrayContainsKey!0 (array!69341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078907 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35476 0))(
  ( (Unit!35477) )
))
(declare-fun lt!478716 () Unit!35476)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69341 (_ BitVec 64) (_ BitVec 32)) Unit!35476)

(assert (=> b!1078907 (= lt!478716 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1078908 () Bool)

(declare-fun res!718955 () Bool)

(assert (=> b!1078908 (=> (not res!718955) (not e!616860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69341 (_ BitVec 32)) Bool)

(assert (=> b!1078908 (= res!718955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41041 () Bool)

(assert (=> mapIsEmpty!41041 mapRes!41041))

(declare-fun b!1078909 () Bool)

(declare-fun res!718951 () Bool)

(assert (=> b!1078909 (=> (not res!718951) (not e!616860))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078909 (= res!718951 (and (= (size!33882 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33881 _keys!1070) (size!33882 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078910 () Bool)

(assert (=> b!1078910 (= e!616860 e!616859)))

(declare-fun res!718953 () Bool)

(assert (=> b!1078910 (=> (not res!718953) (not e!616859))))

(assert (=> b!1078910 (= res!718953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478717 mask!1414))))

(assert (=> b!1078910 (= lt!478717 (array!69342 (store (arr!33345 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33881 _keys!1070)))))

(declare-fun b!1078911 () Bool)

(declare-fun tp_is_empty!26193 () Bool)

(assert (=> b!1078911 (= e!616857 tp_is_empty!26193)))

(declare-fun b!1078912 () Bool)

(declare-fun res!718954 () Bool)

(assert (=> b!1078912 (=> (not res!718954) (not e!616860))))

(assert (=> b!1078912 (= res!718954 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33881 _keys!1070))))))

(declare-fun b!1078913 () Bool)

(declare-fun e!616861 () Bool)

(assert (=> b!1078913 (= e!616861 tp_is_empty!26193)))

(declare-fun mapNonEmpty!41041 () Bool)

(declare-fun tp!78503 () Bool)

(assert (=> mapNonEmpty!41041 (= mapRes!41041 (and tp!78503 e!616861))))

(declare-fun mapKey!41041 () (_ BitVec 32))

(declare-fun mapRest!41041 () (Array (_ BitVec 32) ValueCell!12387))

(declare-fun mapValue!41041 () ValueCell!12387)

(assert (=> mapNonEmpty!41041 (= (arr!33346 _values!874) (store mapRest!41041 mapKey!41041 mapValue!41041))))

(declare-fun b!1078914 () Bool)

(declare-fun res!718956 () Bool)

(assert (=> b!1078914 (=> (not res!718956) (not e!616860))))

(assert (=> b!1078914 (= res!718956 (= (select (arr!33345 _keys!1070) i!650) k0!904))))

(assert (= (and start!95522 res!718950) b!1078909))

(assert (= (and b!1078909 res!718951) b!1078908))

(assert (= (and b!1078908 res!718955) b!1078903))

(assert (= (and b!1078903 res!718949) b!1078912))

(assert (= (and b!1078912 res!718954) b!1078904))

(assert (= (and b!1078904 res!718952) b!1078914))

(assert (= (and b!1078914 res!718956) b!1078910))

(assert (= (and b!1078910 res!718953) b!1078906))

(assert (= (and b!1078906 res!718957) b!1078907))

(assert (= (and b!1078905 condMapEmpty!41041) mapIsEmpty!41041))

(assert (= (and b!1078905 (not condMapEmpty!41041)) mapNonEmpty!41041))

(get-info :version)

(assert (= (and mapNonEmpty!41041 ((_ is ValueCellFull!12387) mapValue!41041)) b!1078913))

(assert (= (and b!1078905 ((_ is ValueCellFull!12387) mapDefault!41041)) b!1078911))

(assert (= start!95522 b!1078905))

(declare-fun m!997261 () Bool)

(assert (=> mapNonEmpty!41041 m!997261))

(declare-fun m!997263 () Bool)

(assert (=> b!1078907 m!997263))

(declare-fun m!997265 () Bool)

(assert (=> b!1078907 m!997265))

(declare-fun m!997267 () Bool)

(assert (=> b!1078903 m!997267))

(declare-fun m!997269 () Bool)

(assert (=> b!1078908 m!997269))

(declare-fun m!997271 () Bool)

(assert (=> b!1078904 m!997271))

(declare-fun m!997273 () Bool)

(assert (=> b!1078906 m!997273))

(declare-fun m!997275 () Bool)

(assert (=> b!1078914 m!997275))

(declare-fun m!997277 () Bool)

(assert (=> start!95522 m!997277))

(declare-fun m!997279 () Bool)

(assert (=> start!95522 m!997279))

(declare-fun m!997281 () Bool)

(assert (=> start!95522 m!997281))

(declare-fun m!997283 () Bool)

(assert (=> b!1078910 m!997283))

(declare-fun m!997285 () Bool)

(assert (=> b!1078910 m!997285))

(check-sat (not b!1078910) tp_is_empty!26193 (not b!1078903) (not mapNonEmpty!41041) (not b!1078906) (not b!1078908) (not b!1078904) (not b!1078907) (not start!95522))
(check-sat)
(get-model)

(declare-fun d!129931 () Bool)

(declare-fun res!718989 () Bool)

(declare-fun e!616886 () Bool)

(assert (=> d!129931 (=> res!718989 e!616886)))

(assert (=> d!129931 (= res!718989 (bvsge #b00000000000000000000000000000000 (size!33881 lt!478717)))))

(assert (=> d!129931 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478717 mask!1414) e!616886)))

(declare-fun b!1078959 () Bool)

(declare-fun e!616887 () Bool)

(declare-fun call!45743 () Bool)

(assert (=> b!1078959 (= e!616887 call!45743)))

(declare-fun bm!45740 () Bool)

(assert (=> bm!45740 (= call!45743 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!478717 mask!1414))))

(declare-fun b!1078960 () Bool)

(declare-fun e!616888 () Bool)

(assert (=> b!1078960 (= e!616887 e!616888)))

(declare-fun lt!478730 () (_ BitVec 64))

(assert (=> b!1078960 (= lt!478730 (select (arr!33345 lt!478717) #b00000000000000000000000000000000))))

(declare-fun lt!478732 () Unit!35476)

(assert (=> b!1078960 (= lt!478732 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!478717 lt!478730 #b00000000000000000000000000000000))))

(assert (=> b!1078960 (arrayContainsKey!0 lt!478717 lt!478730 #b00000000000000000000000000000000)))

(declare-fun lt!478731 () Unit!35476)

(assert (=> b!1078960 (= lt!478731 lt!478732)))

(declare-fun res!718990 () Bool)

(declare-datatypes ((SeekEntryResult!9903 0))(
  ( (MissingZero!9903 (index!41983 (_ BitVec 32))) (Found!9903 (index!41984 (_ BitVec 32))) (Intermediate!9903 (undefined!10715 Bool) (index!41985 (_ BitVec 32)) (x!96704 (_ BitVec 32))) (Undefined!9903) (MissingVacant!9903 (index!41986 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69341 (_ BitVec 32)) SeekEntryResult!9903)

(assert (=> b!1078960 (= res!718990 (= (seekEntryOrOpen!0 (select (arr!33345 lt!478717) #b00000000000000000000000000000000) lt!478717 mask!1414) (Found!9903 #b00000000000000000000000000000000)))))

(assert (=> b!1078960 (=> (not res!718990) (not e!616888))))

(declare-fun b!1078961 () Bool)

(assert (=> b!1078961 (= e!616888 call!45743)))

(declare-fun b!1078962 () Bool)

(assert (=> b!1078962 (= e!616886 e!616887)))

(declare-fun c!108337 () Bool)

(assert (=> b!1078962 (= c!108337 (validKeyInArray!0 (select (arr!33345 lt!478717) #b00000000000000000000000000000000)))))

(assert (= (and d!129931 (not res!718989)) b!1078962))

(assert (= (and b!1078962 c!108337) b!1078960))

(assert (= (and b!1078962 (not c!108337)) b!1078959))

(assert (= (and b!1078960 res!718990) b!1078961))

(assert (= (or b!1078961 b!1078959) bm!45740))

(declare-fun m!997313 () Bool)

(assert (=> bm!45740 m!997313))

(declare-fun m!997315 () Bool)

(assert (=> b!1078960 m!997315))

(declare-fun m!997317 () Bool)

(assert (=> b!1078960 m!997317))

(declare-fun m!997319 () Bool)

(assert (=> b!1078960 m!997319))

(assert (=> b!1078960 m!997315))

(declare-fun m!997321 () Bool)

(assert (=> b!1078960 m!997321))

(assert (=> b!1078962 m!997315))

(assert (=> b!1078962 m!997315))

(declare-fun m!997323 () Bool)

(assert (=> b!1078962 m!997323))

(assert (=> b!1078910 d!129931))

(declare-fun b!1078973 () Bool)

(declare-fun e!616897 () Bool)

(declare-fun e!616898 () Bool)

(assert (=> b!1078973 (= e!616897 e!616898)))

(declare-fun c!108340 () Bool)

(assert (=> b!1078973 (= c!108340 (validKeyInArray!0 (select (arr!33345 lt!478717) #b00000000000000000000000000000000)))))

(declare-fun b!1078974 () Bool)

(declare-fun e!616899 () Bool)

(declare-fun contains!6374 (List!23250 (_ BitVec 64)) Bool)

(assert (=> b!1078974 (= e!616899 (contains!6374 Nil!23247 (select (arr!33345 lt!478717) #b00000000000000000000000000000000)))))

(declare-fun d!129933 () Bool)

(declare-fun res!718999 () Bool)

(declare-fun e!616900 () Bool)

(assert (=> d!129933 (=> res!718999 e!616900)))

(assert (=> d!129933 (= res!718999 (bvsge #b00000000000000000000000000000000 (size!33881 lt!478717)))))

(assert (=> d!129933 (= (arrayNoDuplicates!0 lt!478717 #b00000000000000000000000000000000 Nil!23247) e!616900)))

(declare-fun bm!45743 () Bool)

(declare-fun call!45746 () Bool)

(assert (=> bm!45743 (= call!45746 (arrayNoDuplicates!0 lt!478717 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108340 (Cons!23246 (select (arr!33345 lt!478717) #b00000000000000000000000000000000) Nil!23247) Nil!23247)))))

(declare-fun b!1078975 () Bool)

(assert (=> b!1078975 (= e!616900 e!616897)))

(declare-fun res!718998 () Bool)

(assert (=> b!1078975 (=> (not res!718998) (not e!616897))))

(assert (=> b!1078975 (= res!718998 (not e!616899))))

(declare-fun res!718997 () Bool)

(assert (=> b!1078975 (=> (not res!718997) (not e!616899))))

(assert (=> b!1078975 (= res!718997 (validKeyInArray!0 (select (arr!33345 lt!478717) #b00000000000000000000000000000000)))))

(declare-fun b!1078976 () Bool)

(assert (=> b!1078976 (= e!616898 call!45746)))

(declare-fun b!1078977 () Bool)

(assert (=> b!1078977 (= e!616898 call!45746)))

(assert (= (and d!129933 (not res!718999)) b!1078975))

(assert (= (and b!1078975 res!718997) b!1078974))

(assert (= (and b!1078975 res!718998) b!1078973))

(assert (= (and b!1078973 c!108340) b!1078977))

(assert (= (and b!1078973 (not c!108340)) b!1078976))

(assert (= (or b!1078977 b!1078976) bm!45743))

(assert (=> b!1078973 m!997315))

(assert (=> b!1078973 m!997315))

(assert (=> b!1078973 m!997323))

(assert (=> b!1078974 m!997315))

(assert (=> b!1078974 m!997315))

(declare-fun m!997325 () Bool)

(assert (=> b!1078974 m!997325))

(assert (=> bm!45743 m!997315))

(declare-fun m!997327 () Bool)

(assert (=> bm!45743 m!997327))

(assert (=> b!1078975 m!997315))

(assert (=> b!1078975 m!997315))

(assert (=> b!1078975 m!997323))

(assert (=> b!1078906 d!129933))

(declare-fun d!129935 () Bool)

(assert (=> d!129935 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1078904 d!129935))

(declare-fun b!1078978 () Bool)

(declare-fun e!616901 () Bool)

(declare-fun e!616902 () Bool)

(assert (=> b!1078978 (= e!616901 e!616902)))

(declare-fun c!108341 () Bool)

(assert (=> b!1078978 (= c!108341 (validKeyInArray!0 (select (arr!33345 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1078979 () Bool)

(declare-fun e!616903 () Bool)

(assert (=> b!1078979 (= e!616903 (contains!6374 Nil!23247 (select (arr!33345 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!129937 () Bool)

(declare-fun res!719002 () Bool)

(declare-fun e!616904 () Bool)

(assert (=> d!129937 (=> res!719002 e!616904)))

(assert (=> d!129937 (= res!719002 (bvsge #b00000000000000000000000000000000 (size!33881 _keys!1070)))))

(assert (=> d!129937 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23247) e!616904)))

(declare-fun bm!45744 () Bool)

(declare-fun call!45747 () Bool)

(assert (=> bm!45744 (= call!45747 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108341 (Cons!23246 (select (arr!33345 _keys!1070) #b00000000000000000000000000000000) Nil!23247) Nil!23247)))))

(declare-fun b!1078980 () Bool)

(assert (=> b!1078980 (= e!616904 e!616901)))

(declare-fun res!719001 () Bool)

(assert (=> b!1078980 (=> (not res!719001) (not e!616901))))

(assert (=> b!1078980 (= res!719001 (not e!616903))))

(declare-fun res!719000 () Bool)

(assert (=> b!1078980 (=> (not res!719000) (not e!616903))))

(assert (=> b!1078980 (= res!719000 (validKeyInArray!0 (select (arr!33345 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1078981 () Bool)

(assert (=> b!1078981 (= e!616902 call!45747)))

(declare-fun b!1078982 () Bool)

(assert (=> b!1078982 (= e!616902 call!45747)))

(assert (= (and d!129937 (not res!719002)) b!1078980))

(assert (= (and b!1078980 res!719000) b!1078979))

(assert (= (and b!1078980 res!719001) b!1078978))

(assert (= (and b!1078978 c!108341) b!1078982))

(assert (= (and b!1078978 (not c!108341)) b!1078981))

(assert (= (or b!1078982 b!1078981) bm!45744))

(declare-fun m!997329 () Bool)

(assert (=> b!1078978 m!997329))

(assert (=> b!1078978 m!997329))

(declare-fun m!997331 () Bool)

(assert (=> b!1078978 m!997331))

(assert (=> b!1078979 m!997329))

(assert (=> b!1078979 m!997329))

(declare-fun m!997333 () Bool)

(assert (=> b!1078979 m!997333))

(assert (=> bm!45744 m!997329))

(declare-fun m!997335 () Bool)

(assert (=> bm!45744 m!997335))

(assert (=> b!1078980 m!997329))

(assert (=> b!1078980 m!997329))

(assert (=> b!1078980 m!997331))

(assert (=> b!1078903 d!129937))

(declare-fun d!129939 () Bool)

(declare-fun res!719003 () Bool)

(declare-fun e!616905 () Bool)

(assert (=> d!129939 (=> res!719003 e!616905)))

(assert (=> d!129939 (= res!719003 (bvsge #b00000000000000000000000000000000 (size!33881 _keys!1070)))))

(assert (=> d!129939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616905)))

(declare-fun b!1078983 () Bool)

(declare-fun e!616906 () Bool)

(declare-fun call!45748 () Bool)

(assert (=> b!1078983 (= e!616906 call!45748)))

(declare-fun bm!45745 () Bool)

(assert (=> bm!45745 (= call!45748 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1078984 () Bool)

(declare-fun e!616907 () Bool)

(assert (=> b!1078984 (= e!616906 e!616907)))

(declare-fun lt!478733 () (_ BitVec 64))

(assert (=> b!1078984 (= lt!478733 (select (arr!33345 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!478735 () Unit!35476)

(assert (=> b!1078984 (= lt!478735 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478733 #b00000000000000000000000000000000))))

(assert (=> b!1078984 (arrayContainsKey!0 _keys!1070 lt!478733 #b00000000000000000000000000000000)))

(declare-fun lt!478734 () Unit!35476)

(assert (=> b!1078984 (= lt!478734 lt!478735)))

(declare-fun res!719004 () Bool)

(assert (=> b!1078984 (= res!719004 (= (seekEntryOrOpen!0 (select (arr!33345 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9903 #b00000000000000000000000000000000)))))

(assert (=> b!1078984 (=> (not res!719004) (not e!616907))))

(declare-fun b!1078985 () Bool)

(assert (=> b!1078985 (= e!616907 call!45748)))

(declare-fun b!1078986 () Bool)

(assert (=> b!1078986 (= e!616905 e!616906)))

(declare-fun c!108342 () Bool)

(assert (=> b!1078986 (= c!108342 (validKeyInArray!0 (select (arr!33345 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!129939 (not res!719003)) b!1078986))

(assert (= (and b!1078986 c!108342) b!1078984))

(assert (= (and b!1078986 (not c!108342)) b!1078983))

(assert (= (and b!1078984 res!719004) b!1078985))

(assert (= (or b!1078985 b!1078983) bm!45745))

(declare-fun m!997337 () Bool)

(assert (=> bm!45745 m!997337))

(assert (=> b!1078984 m!997329))

(declare-fun m!997339 () Bool)

(assert (=> b!1078984 m!997339))

(declare-fun m!997341 () Bool)

(assert (=> b!1078984 m!997341))

(assert (=> b!1078984 m!997329))

(declare-fun m!997343 () Bool)

(assert (=> b!1078984 m!997343))

(assert (=> b!1078986 m!997329))

(assert (=> b!1078986 m!997329))

(assert (=> b!1078986 m!997331))

(assert (=> b!1078908 d!129939))

(declare-fun d!129941 () Bool)

(declare-fun res!719009 () Bool)

(declare-fun e!616912 () Bool)

(assert (=> d!129941 (=> res!719009 e!616912)))

(assert (=> d!129941 (= res!719009 (= (select (arr!33345 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!129941 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!616912)))

(declare-fun b!1078991 () Bool)

(declare-fun e!616913 () Bool)

(assert (=> b!1078991 (= e!616912 e!616913)))

(declare-fun res!719010 () Bool)

(assert (=> b!1078991 (=> (not res!719010) (not e!616913))))

(assert (=> b!1078991 (= res!719010 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!33881 _keys!1070)))))

(declare-fun b!1078992 () Bool)

(assert (=> b!1078992 (= e!616913 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!129941 (not res!719009)) b!1078991))

(assert (= (and b!1078991 res!719010) b!1078992))

(assert (=> d!129941 m!997329))

(declare-fun m!997345 () Bool)

(assert (=> b!1078992 m!997345))

(assert (=> b!1078907 d!129941))

(declare-fun d!129943 () Bool)

(assert (=> d!129943 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!478738 () Unit!35476)

(declare-fun choose!13 (array!69341 (_ BitVec 64) (_ BitVec 32)) Unit!35476)

(assert (=> d!129943 (= lt!478738 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!129943 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!129943 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!478738)))

(declare-fun bs!31791 () Bool)

(assert (= bs!31791 d!129943))

(assert (=> bs!31791 m!997263))

(declare-fun m!997347 () Bool)

(assert (=> bs!31791 m!997347))

(assert (=> b!1078907 d!129943))

(declare-fun d!129945 () Bool)

(assert (=> d!129945 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95522 d!129945))

(declare-fun d!129947 () Bool)

(assert (=> d!129947 (= (array_inv!25760 _keys!1070) (bvsge (size!33881 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95522 d!129947))

(declare-fun d!129949 () Bool)

(assert (=> d!129949 (= (array_inv!25761 _values!874) (bvsge (size!33882 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95522 d!129949))

(declare-fun b!1078999 () Bool)

(declare-fun e!616919 () Bool)

(assert (=> b!1078999 (= e!616919 tp_is_empty!26193)))

(declare-fun mapIsEmpty!41047 () Bool)

(declare-fun mapRes!41047 () Bool)

(assert (=> mapIsEmpty!41047 mapRes!41047))

(declare-fun mapNonEmpty!41047 () Bool)

(declare-fun tp!78509 () Bool)

(assert (=> mapNonEmpty!41047 (= mapRes!41047 (and tp!78509 e!616919))))

(declare-fun mapKey!41047 () (_ BitVec 32))

(declare-fun mapRest!41047 () (Array (_ BitVec 32) ValueCell!12387))

(declare-fun mapValue!41047 () ValueCell!12387)

(assert (=> mapNonEmpty!41047 (= mapRest!41041 (store mapRest!41047 mapKey!41047 mapValue!41047))))

(declare-fun b!1079000 () Bool)

(declare-fun e!616918 () Bool)

(assert (=> b!1079000 (= e!616918 tp_is_empty!26193)))

(declare-fun condMapEmpty!41047 () Bool)

(declare-fun mapDefault!41047 () ValueCell!12387)

(assert (=> mapNonEmpty!41041 (= condMapEmpty!41047 (= mapRest!41041 ((as const (Array (_ BitVec 32) ValueCell!12387)) mapDefault!41047)))))

(assert (=> mapNonEmpty!41041 (= tp!78503 (and e!616918 mapRes!41047))))

(assert (= (and mapNonEmpty!41041 condMapEmpty!41047) mapIsEmpty!41047))

(assert (= (and mapNonEmpty!41041 (not condMapEmpty!41047)) mapNonEmpty!41047))

(assert (= (and mapNonEmpty!41047 ((_ is ValueCellFull!12387) mapValue!41047)) b!1078999))

(assert (= (and mapNonEmpty!41041 ((_ is ValueCellFull!12387) mapDefault!41047)) b!1079000))

(declare-fun m!997349 () Bool)

(assert (=> mapNonEmpty!41047 m!997349))

(check-sat (not b!1078984) (not bm!45745) (not b!1078974) tp_is_empty!26193 (not b!1078960) (not mapNonEmpty!41047) (not b!1078975) (not b!1078962) (not b!1078980) (not bm!45744) (not b!1078986) (not b!1078978) (not bm!45740) (not d!129943) (not b!1078973) (not bm!45743) (not b!1078992) (not b!1078979))
(check-sat)
