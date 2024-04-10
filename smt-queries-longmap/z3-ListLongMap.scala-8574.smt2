; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104654 () Bool)

(assert start!104654)

(declare-fun b!1247832 () Bool)

(declare-fun res!832566 () Bool)

(declare-fun e!707991 () Bool)

(assert (=> b!1247832 (=> (not res!832566) (not e!707991))))

(declare-datatypes ((array!80458 0))(
  ( (array!80459 (arr!38798 (Array (_ BitVec 32) (_ BitVec 64))) (size!39334 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80458)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80458 (_ BitVec 32)) Bool)

(assert (=> b!1247832 (= res!832566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247833 () Bool)

(declare-fun res!832568 () Bool)

(assert (=> b!1247833 (=> (not res!832568) (not e!707991))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47209 0))(
  ( (V!47210 (val!15754 Int)) )
))
(declare-datatypes ((ValueCell!14928 0))(
  ( (ValueCellFull!14928 (v!18450 V!47209)) (EmptyCell!14928) )
))
(declare-datatypes ((array!80460 0))(
  ( (array!80461 (arr!38799 (Array (_ BitVec 32) ValueCell!14928)) (size!39335 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80460)

(assert (=> b!1247833 (= res!832568 (and (= (size!39335 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39334 _keys!1118) (size!39335 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247834 () Bool)

(declare-fun res!832569 () Bool)

(assert (=> b!1247834 (=> (not res!832569) (not e!707991))))

(declare-datatypes ((List!27539 0))(
  ( (Nil!27536) (Cons!27535 (h!28744 (_ BitVec 64)) (t!41008 List!27539)) )
))
(declare-fun arrayNoDuplicates!0 (array!80458 (_ BitVec 32) List!27539) Bool)

(assert (=> b!1247834 (= res!832569 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27536))))

(declare-fun b!1247835 () Bool)

(declare-fun e!707990 () Bool)

(declare-fun tp_is_empty!31383 () Bool)

(assert (=> b!1247835 (= e!707990 tp_is_empty!31383)))

(declare-fun mapIsEmpty!48829 () Bool)

(declare-fun mapRes!48829 () Bool)

(assert (=> mapIsEmpty!48829 mapRes!48829))

(declare-fun mapNonEmpty!48829 () Bool)

(declare-fun tp!92930 () Bool)

(declare-fun e!707989 () Bool)

(assert (=> mapNonEmpty!48829 (= mapRes!48829 (and tp!92930 e!707989))))

(declare-fun mapValue!48829 () ValueCell!14928)

(declare-fun mapRest!48829 () (Array (_ BitVec 32) ValueCell!14928))

(declare-fun mapKey!48829 () (_ BitVec 32))

(assert (=> mapNonEmpty!48829 (= (arr!38799 _values!914) (store mapRest!48829 mapKey!48829 mapValue!48829))))

(declare-fun b!1247836 () Bool)

(assert (=> b!1247836 (= e!707989 tp_is_empty!31383)))

(declare-fun b!1247837 () Bool)

(assert (=> b!1247837 (= e!707991 (bvsgt #b00000000000000000000000000000000 (size!39334 _keys!1118)))))

(declare-fun res!832567 () Bool)

(assert (=> start!104654 (=> (not res!832567) (not e!707991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104654 (= res!832567 (validMask!0 mask!1466))))

(assert (=> start!104654 e!707991))

(assert (=> start!104654 true))

(declare-fun array_inv!29621 (array!80458) Bool)

(assert (=> start!104654 (array_inv!29621 _keys!1118)))

(declare-fun e!707992 () Bool)

(declare-fun array_inv!29622 (array!80460) Bool)

(assert (=> start!104654 (and (array_inv!29622 _values!914) e!707992)))

(declare-fun b!1247838 () Bool)

(assert (=> b!1247838 (= e!707992 (and e!707990 mapRes!48829))))

(declare-fun condMapEmpty!48829 () Bool)

(declare-fun mapDefault!48829 () ValueCell!14928)

(assert (=> b!1247838 (= condMapEmpty!48829 (= (arr!38799 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14928)) mapDefault!48829)))))

(assert (= (and start!104654 res!832567) b!1247833))

(assert (= (and b!1247833 res!832568) b!1247832))

(assert (= (and b!1247832 res!832566) b!1247834))

(assert (= (and b!1247834 res!832569) b!1247837))

(assert (= (and b!1247838 condMapEmpty!48829) mapIsEmpty!48829))

(assert (= (and b!1247838 (not condMapEmpty!48829)) mapNonEmpty!48829))

(get-info :version)

(assert (= (and mapNonEmpty!48829 ((_ is ValueCellFull!14928) mapValue!48829)) b!1247836))

(assert (= (and b!1247838 ((_ is ValueCellFull!14928) mapDefault!48829)) b!1247835))

(assert (= start!104654 b!1247838))

(declare-fun m!1149207 () Bool)

(assert (=> b!1247832 m!1149207))

(declare-fun m!1149209 () Bool)

(assert (=> b!1247834 m!1149209))

(declare-fun m!1149211 () Bool)

(assert (=> mapNonEmpty!48829 m!1149211))

(declare-fun m!1149213 () Bool)

(assert (=> start!104654 m!1149213))

(declare-fun m!1149215 () Bool)

(assert (=> start!104654 m!1149215))

(declare-fun m!1149217 () Bool)

(assert (=> start!104654 m!1149217))

(check-sat tp_is_empty!31383 (not b!1247832) (not mapNonEmpty!48829) (not start!104654) (not b!1247834))
(check-sat)
(get-model)

(declare-fun d!137785 () Bool)

(assert (=> d!137785 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104654 d!137785))

(declare-fun d!137787 () Bool)

(assert (=> d!137787 (= (array_inv!29621 _keys!1118) (bvsge (size!39334 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104654 d!137787))

(declare-fun d!137789 () Bool)

(assert (=> d!137789 (= (array_inv!29622 _values!914) (bvsge (size!39335 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104654 d!137789))

(declare-fun b!1247868 () Bool)

(declare-fun e!708016 () Bool)

(declare-fun e!708014 () Bool)

(assert (=> b!1247868 (= e!708016 e!708014)))

(declare-fun c!122103 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247868 (= c!122103 (validKeyInArray!0 (select (arr!38798 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1247869 () Bool)

(declare-fun call!61566 () Bool)

(assert (=> b!1247869 (= e!708014 call!61566)))

(declare-fun d!137791 () Bool)

(declare-fun res!832587 () Bool)

(assert (=> d!137791 (=> res!832587 e!708016)))

(assert (=> d!137791 (= res!832587 (bvsge #b00000000000000000000000000000000 (size!39334 _keys!1118)))))

(assert (=> d!137791 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!708016)))

(declare-fun bm!61563 () Bool)

(assert (=> bm!61563 (= call!61566 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1247870 () Bool)

(declare-fun e!708015 () Bool)

(assert (=> b!1247870 (= e!708014 e!708015)))

(declare-fun lt!563327 () (_ BitVec 64))

(assert (=> b!1247870 (= lt!563327 (select (arr!38798 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41473 0))(
  ( (Unit!41474) )
))
(declare-fun lt!563329 () Unit!41473)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80458 (_ BitVec 64) (_ BitVec 32)) Unit!41473)

(assert (=> b!1247870 (= lt!563329 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563327 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1247870 (arrayContainsKey!0 _keys!1118 lt!563327 #b00000000000000000000000000000000)))

(declare-fun lt!563328 () Unit!41473)

(assert (=> b!1247870 (= lt!563328 lt!563329)))

(declare-fun res!832586 () Bool)

(declare-datatypes ((SeekEntryResult!9956 0))(
  ( (MissingZero!9956 (index!42195 (_ BitVec 32))) (Found!9956 (index!42196 (_ BitVec 32))) (Intermediate!9956 (undefined!10768 Bool) (index!42197 (_ BitVec 32)) (x!109681 (_ BitVec 32))) (Undefined!9956) (MissingVacant!9956 (index!42198 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80458 (_ BitVec 32)) SeekEntryResult!9956)

(assert (=> b!1247870 (= res!832586 (= (seekEntryOrOpen!0 (select (arr!38798 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9956 #b00000000000000000000000000000000)))))

(assert (=> b!1247870 (=> (not res!832586) (not e!708015))))

(declare-fun b!1247871 () Bool)

(assert (=> b!1247871 (= e!708015 call!61566)))

(assert (= (and d!137791 (not res!832587)) b!1247868))

(assert (= (and b!1247868 c!122103) b!1247870))

(assert (= (and b!1247868 (not c!122103)) b!1247869))

(assert (= (and b!1247870 res!832586) b!1247871))

(assert (= (or b!1247871 b!1247869) bm!61563))

(declare-fun m!1149231 () Bool)

(assert (=> b!1247868 m!1149231))

(assert (=> b!1247868 m!1149231))

(declare-fun m!1149233 () Bool)

(assert (=> b!1247868 m!1149233))

(declare-fun m!1149235 () Bool)

(assert (=> bm!61563 m!1149235))

(assert (=> b!1247870 m!1149231))

(declare-fun m!1149237 () Bool)

(assert (=> b!1247870 m!1149237))

(declare-fun m!1149239 () Bool)

(assert (=> b!1247870 m!1149239))

(assert (=> b!1247870 m!1149231))

(declare-fun m!1149241 () Bool)

(assert (=> b!1247870 m!1149241))

(assert (=> b!1247832 d!137791))

(declare-fun b!1247882 () Bool)

(declare-fun e!708028 () Bool)

(declare-fun e!708027 () Bool)

(assert (=> b!1247882 (= e!708028 e!708027)))

(declare-fun res!832595 () Bool)

(assert (=> b!1247882 (=> (not res!832595) (not e!708027))))

(declare-fun e!708026 () Bool)

(assert (=> b!1247882 (= res!832595 (not e!708026))))

(declare-fun res!832596 () Bool)

(assert (=> b!1247882 (=> (not res!832596) (not e!708026))))

(assert (=> b!1247882 (= res!832596 (validKeyInArray!0 (select (arr!38798 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1247883 () Bool)

(declare-fun contains!7468 (List!27539 (_ BitVec 64)) Bool)

(assert (=> b!1247883 (= e!708026 (contains!7468 Nil!27536 (select (arr!38798 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!137793 () Bool)

(declare-fun res!832594 () Bool)

(assert (=> d!137793 (=> res!832594 e!708028)))

(assert (=> d!137793 (= res!832594 (bvsge #b00000000000000000000000000000000 (size!39334 _keys!1118)))))

(assert (=> d!137793 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27536) e!708028)))

(declare-fun bm!61566 () Bool)

(declare-fun call!61569 () Bool)

(declare-fun c!122106 () Bool)

(assert (=> bm!61566 (= call!61569 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122106 (Cons!27535 (select (arr!38798 _keys!1118) #b00000000000000000000000000000000) Nil!27536) Nil!27536)))))

(declare-fun b!1247884 () Bool)

(declare-fun e!708025 () Bool)

(assert (=> b!1247884 (= e!708025 call!61569)))

(declare-fun b!1247885 () Bool)

(assert (=> b!1247885 (= e!708025 call!61569)))

(declare-fun b!1247886 () Bool)

(assert (=> b!1247886 (= e!708027 e!708025)))

(assert (=> b!1247886 (= c!122106 (validKeyInArray!0 (select (arr!38798 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!137793 (not res!832594)) b!1247882))

(assert (= (and b!1247882 res!832596) b!1247883))

(assert (= (and b!1247882 res!832595) b!1247886))

(assert (= (and b!1247886 c!122106) b!1247885))

(assert (= (and b!1247886 (not c!122106)) b!1247884))

(assert (= (or b!1247885 b!1247884) bm!61566))

(assert (=> b!1247882 m!1149231))

(assert (=> b!1247882 m!1149231))

(assert (=> b!1247882 m!1149233))

(assert (=> b!1247883 m!1149231))

(assert (=> b!1247883 m!1149231))

(declare-fun m!1149243 () Bool)

(assert (=> b!1247883 m!1149243))

(assert (=> bm!61566 m!1149231))

(declare-fun m!1149245 () Bool)

(assert (=> bm!61566 m!1149245))

(assert (=> b!1247886 m!1149231))

(assert (=> b!1247886 m!1149231))

(assert (=> b!1247886 m!1149233))

(assert (=> b!1247834 d!137793))

(declare-fun b!1247894 () Bool)

(declare-fun e!708034 () Bool)

(assert (=> b!1247894 (= e!708034 tp_is_empty!31383)))

(declare-fun mapIsEmpty!48835 () Bool)

(declare-fun mapRes!48835 () Bool)

(assert (=> mapIsEmpty!48835 mapRes!48835))

(declare-fun b!1247893 () Bool)

(declare-fun e!708033 () Bool)

(assert (=> b!1247893 (= e!708033 tp_is_empty!31383)))

(declare-fun mapNonEmpty!48835 () Bool)

(declare-fun tp!92936 () Bool)

(assert (=> mapNonEmpty!48835 (= mapRes!48835 (and tp!92936 e!708033))))

(declare-fun mapKey!48835 () (_ BitVec 32))

(declare-fun mapValue!48835 () ValueCell!14928)

(declare-fun mapRest!48835 () (Array (_ BitVec 32) ValueCell!14928))

(assert (=> mapNonEmpty!48835 (= mapRest!48829 (store mapRest!48835 mapKey!48835 mapValue!48835))))

(declare-fun condMapEmpty!48835 () Bool)

(declare-fun mapDefault!48835 () ValueCell!14928)

(assert (=> mapNonEmpty!48829 (= condMapEmpty!48835 (= mapRest!48829 ((as const (Array (_ BitVec 32) ValueCell!14928)) mapDefault!48835)))))

(assert (=> mapNonEmpty!48829 (= tp!92930 (and e!708034 mapRes!48835))))

(assert (= (and mapNonEmpty!48829 condMapEmpty!48835) mapIsEmpty!48835))

(assert (= (and mapNonEmpty!48829 (not condMapEmpty!48835)) mapNonEmpty!48835))

(assert (= (and mapNonEmpty!48835 ((_ is ValueCellFull!14928) mapValue!48835)) b!1247893))

(assert (= (and mapNonEmpty!48829 ((_ is ValueCellFull!14928) mapDefault!48835)) b!1247894))

(declare-fun m!1149247 () Bool)

(assert (=> mapNonEmpty!48835 m!1149247))

(check-sat (not b!1247886) (not bm!61563) (not mapNonEmpty!48835) (not bm!61566) (not b!1247883) (not b!1247870) (not b!1247882) (not b!1247868) tp_is_empty!31383)
(check-sat)
