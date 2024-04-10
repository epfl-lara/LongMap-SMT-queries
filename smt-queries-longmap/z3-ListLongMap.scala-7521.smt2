; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95378 () Bool)

(assert start!95378)

(declare-fun mapNonEmpty!40894 () Bool)

(declare-fun mapRes!40894 () Bool)

(declare-fun tp!78356 () Bool)

(declare-fun e!615971 () Bool)

(assert (=> mapNonEmpty!40894 (= mapRes!40894 (and tp!78356 e!615971))))

(declare-datatypes ((V!39931 0))(
  ( (V!39932 (val!13108 Int)) )
))
(declare-datatypes ((ValueCell!12342 0))(
  ( (ValueCellFull!12342 (v!15727 V!39931)) (EmptyCell!12342) )
))
(declare-datatypes ((array!69157 0))(
  ( (array!69158 (arr!33257 (Array (_ BitVec 32) ValueCell!12342)) (size!33793 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69157)

(declare-fun mapValue!40894 () ValueCell!12342)

(declare-fun mapRest!40894 () (Array (_ BitVec 32) ValueCell!12342))

(declare-fun mapKey!40894 () (_ BitVec 32))

(assert (=> mapNonEmpty!40894 (= (arr!33257 _values!874) (store mapRest!40894 mapKey!40894 mapValue!40894))))

(declare-fun b!1077322 () Bool)

(declare-fun e!615972 () Bool)

(declare-datatypes ((List!23216 0))(
  ( (Nil!23213) (Cons!23212 (h!24421 (_ BitVec 64)) (t!32575 List!23216)) )
))
(declare-fun contains!6367 (List!23216 (_ BitVec 64)) Bool)

(assert (=> b!1077322 (= e!615972 (contains!6367 Nil!23213 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!717856 () Bool)

(declare-fun e!615975 () Bool)

(assert (=> start!95378 (=> (not res!717856) (not e!615975))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95378 (= res!717856 (validMask!0 mask!1414))))

(assert (=> start!95378 e!615975))

(assert (=> start!95378 true))

(declare-fun e!615974 () Bool)

(declare-fun array_inv!25692 (array!69157) Bool)

(assert (=> start!95378 (and (array_inv!25692 _values!874) e!615974)))

(declare-datatypes ((array!69159 0))(
  ( (array!69160 (arr!33258 (Array (_ BitVec 32) (_ BitVec 64))) (size!33794 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69159)

(declare-fun array_inv!25693 (array!69159) Bool)

(assert (=> start!95378 (array_inv!25693 _keys!1070)))

(declare-fun b!1077323 () Bool)

(declare-fun res!717858 () Bool)

(assert (=> b!1077323 (=> (not res!717858) (not e!615975))))

(assert (=> b!1077323 (= res!717858 (and (bvsle #b00000000000000000000000000000000 (size!33794 _keys!1070)) (bvslt (size!33794 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1077324 () Bool)

(declare-fun res!717857 () Bool)

(assert (=> b!1077324 (=> (not res!717857) (not e!615975))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077324 (= res!717857 (and (= (size!33793 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33794 _keys!1070) (size!33793 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077325 () Bool)

(declare-fun e!615970 () Bool)

(assert (=> b!1077325 (= e!615974 (and e!615970 mapRes!40894))))

(declare-fun condMapEmpty!40894 () Bool)

(declare-fun mapDefault!40894 () ValueCell!12342)

(assert (=> b!1077325 (= condMapEmpty!40894 (= (arr!33257 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12342)) mapDefault!40894)))))

(declare-fun b!1077326 () Bool)

(declare-fun res!717855 () Bool)

(assert (=> b!1077326 (=> (not res!717855) (not e!615975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69159 (_ BitVec 32)) Bool)

(assert (=> b!1077326 (= res!717855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077327 () Bool)

(declare-fun tp_is_empty!26103 () Bool)

(assert (=> b!1077327 (= e!615971 tp_is_empty!26103)))

(declare-fun b!1077328 () Bool)

(assert (=> b!1077328 (= e!615975 e!615972)))

(declare-fun res!717853 () Bool)

(assert (=> b!1077328 (=> res!717853 e!615972)))

(assert (=> b!1077328 (= res!717853 (contains!6367 Nil!23213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!40894 () Bool)

(assert (=> mapIsEmpty!40894 mapRes!40894))

(declare-fun b!1077329 () Bool)

(assert (=> b!1077329 (= e!615970 tp_is_empty!26103)))

(declare-fun b!1077330 () Bool)

(declare-fun res!717854 () Bool)

(assert (=> b!1077330 (=> (not res!717854) (not e!615975))))

(declare-fun noDuplicate!1575 (List!23216) Bool)

(assert (=> b!1077330 (= res!717854 (noDuplicate!1575 Nil!23213))))

(assert (= (and start!95378 res!717856) b!1077324))

(assert (= (and b!1077324 res!717857) b!1077326))

(assert (= (and b!1077326 res!717855) b!1077323))

(assert (= (and b!1077323 res!717858) b!1077330))

(assert (= (and b!1077330 res!717854) b!1077328))

(assert (= (and b!1077328 (not res!717853)) b!1077322))

(assert (= (and b!1077325 condMapEmpty!40894) mapIsEmpty!40894))

(assert (= (and b!1077325 (not condMapEmpty!40894)) mapNonEmpty!40894))

(get-info :version)

(assert (= (and mapNonEmpty!40894 ((_ is ValueCellFull!12342) mapValue!40894)) b!1077327))

(assert (= (and b!1077325 ((_ is ValueCellFull!12342) mapDefault!40894)) b!1077329))

(assert (= start!95378 b!1077325))

(declare-fun m!996215 () Bool)

(assert (=> b!1077330 m!996215))

(declare-fun m!996217 () Bool)

(assert (=> start!95378 m!996217))

(declare-fun m!996219 () Bool)

(assert (=> start!95378 m!996219))

(declare-fun m!996221 () Bool)

(assert (=> start!95378 m!996221))

(declare-fun m!996223 () Bool)

(assert (=> b!1077326 m!996223))

(declare-fun m!996225 () Bool)

(assert (=> mapNonEmpty!40894 m!996225))

(declare-fun m!996227 () Bool)

(assert (=> b!1077322 m!996227))

(declare-fun m!996229 () Bool)

(assert (=> b!1077328 m!996229))

(check-sat (not b!1077326) (not mapNonEmpty!40894) tp_is_empty!26103 (not b!1077328) (not b!1077322) (not b!1077330) (not start!95378))
(check-sat)
(get-model)

(declare-fun b!1077366 () Bool)

(declare-fun e!616000 () Bool)

(declare-fun call!45719 () Bool)

(assert (=> b!1077366 (= e!616000 call!45719)))

(declare-fun d!129837 () Bool)

(declare-fun res!717881 () Bool)

(declare-fun e!616002 () Bool)

(assert (=> d!129837 (=> res!717881 e!616002)))

(assert (=> d!129837 (= res!717881 (bvsge #b00000000000000000000000000000000 (size!33794 _keys!1070)))))

(assert (=> d!129837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616002)))

(declare-fun bm!45716 () Bool)

(assert (=> bm!45716 (= call!45719 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1077367 () Bool)

(declare-fun e!616001 () Bool)

(assert (=> b!1077367 (= e!616000 e!616001)))

(declare-fun lt!478533 () (_ BitVec 64))

(assert (=> b!1077367 (= lt!478533 (select (arr!33258 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35458 0))(
  ( (Unit!35459) )
))
(declare-fun lt!478534 () Unit!35458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69159 (_ BitVec 64) (_ BitVec 32)) Unit!35458)

(assert (=> b!1077367 (= lt!478534 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478533 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077367 (arrayContainsKey!0 _keys!1070 lt!478533 #b00000000000000000000000000000000)))

(declare-fun lt!478535 () Unit!35458)

(assert (=> b!1077367 (= lt!478535 lt!478534)))

(declare-fun res!717882 () Bool)

(declare-datatypes ((SeekEntryResult!9899 0))(
  ( (MissingZero!9899 (index!41967 (_ BitVec 32))) (Found!9899 (index!41968 (_ BitVec 32))) (Intermediate!9899 (undefined!10711 Bool) (index!41969 (_ BitVec 32)) (x!96572 (_ BitVec 32))) (Undefined!9899) (MissingVacant!9899 (index!41970 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69159 (_ BitVec 32)) SeekEntryResult!9899)

(assert (=> b!1077367 (= res!717882 (= (seekEntryOrOpen!0 (select (arr!33258 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9899 #b00000000000000000000000000000000)))))

(assert (=> b!1077367 (=> (not res!717882) (not e!616001))))

(declare-fun b!1077368 () Bool)

(assert (=> b!1077368 (= e!616002 e!616000)))

(declare-fun c!108313 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077368 (= c!108313 (validKeyInArray!0 (select (arr!33258 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1077369 () Bool)

(assert (=> b!1077369 (= e!616001 call!45719)))

(assert (= (and d!129837 (not res!717881)) b!1077368))

(assert (= (and b!1077368 c!108313) b!1077367))

(assert (= (and b!1077368 (not c!108313)) b!1077366))

(assert (= (and b!1077367 res!717882) b!1077369))

(assert (= (or b!1077369 b!1077366) bm!45716))

(declare-fun m!996247 () Bool)

(assert (=> bm!45716 m!996247))

(declare-fun m!996249 () Bool)

(assert (=> b!1077367 m!996249))

(declare-fun m!996251 () Bool)

(assert (=> b!1077367 m!996251))

(declare-fun m!996253 () Bool)

(assert (=> b!1077367 m!996253))

(assert (=> b!1077367 m!996249))

(declare-fun m!996255 () Bool)

(assert (=> b!1077367 m!996255))

(assert (=> b!1077368 m!996249))

(assert (=> b!1077368 m!996249))

(declare-fun m!996257 () Bool)

(assert (=> b!1077368 m!996257))

(assert (=> b!1077326 d!129837))

(declare-fun d!129839 () Bool)

(declare-fun res!717887 () Bool)

(declare-fun e!616007 () Bool)

(assert (=> d!129839 (=> res!717887 e!616007)))

(assert (=> d!129839 (= res!717887 ((_ is Nil!23213) Nil!23213))))

(assert (=> d!129839 (= (noDuplicate!1575 Nil!23213) e!616007)))

(declare-fun b!1077374 () Bool)

(declare-fun e!616008 () Bool)

(assert (=> b!1077374 (= e!616007 e!616008)))

(declare-fun res!717888 () Bool)

(assert (=> b!1077374 (=> (not res!717888) (not e!616008))))

(assert (=> b!1077374 (= res!717888 (not (contains!6367 (t!32575 Nil!23213) (h!24421 Nil!23213))))))

(declare-fun b!1077375 () Bool)

(assert (=> b!1077375 (= e!616008 (noDuplicate!1575 (t!32575 Nil!23213)))))

(assert (= (and d!129839 (not res!717887)) b!1077374))

(assert (= (and b!1077374 res!717888) b!1077375))

(declare-fun m!996259 () Bool)

(assert (=> b!1077374 m!996259))

(declare-fun m!996261 () Bool)

(assert (=> b!1077375 m!996261))

(assert (=> b!1077330 d!129839))

(declare-fun d!129841 () Bool)

(assert (=> d!129841 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95378 d!129841))

(declare-fun d!129843 () Bool)

(assert (=> d!129843 (= (array_inv!25692 _values!874) (bvsge (size!33793 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95378 d!129843))

(declare-fun d!129845 () Bool)

(assert (=> d!129845 (= (array_inv!25693 _keys!1070) (bvsge (size!33794 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95378 d!129845))

(declare-fun d!129847 () Bool)

(declare-fun lt!478538 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!535 (List!23216) (InoxSet (_ BitVec 64)))

(assert (=> d!129847 (= lt!478538 (select (content!535 Nil!23213) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!616013 () Bool)

(assert (=> d!129847 (= lt!478538 e!616013)))

(declare-fun res!717894 () Bool)

(assert (=> d!129847 (=> (not res!717894) (not e!616013))))

(assert (=> d!129847 (= res!717894 ((_ is Cons!23212) Nil!23213))))

(assert (=> d!129847 (= (contains!6367 Nil!23213 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478538)))

(declare-fun b!1077380 () Bool)

(declare-fun e!616014 () Bool)

(assert (=> b!1077380 (= e!616013 e!616014)))

(declare-fun res!717893 () Bool)

(assert (=> b!1077380 (=> res!717893 e!616014)))

(assert (=> b!1077380 (= res!717893 (= (h!24421 Nil!23213) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077381 () Bool)

(assert (=> b!1077381 (= e!616014 (contains!6367 (t!32575 Nil!23213) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129847 res!717894) b!1077380))

(assert (= (and b!1077380 (not res!717893)) b!1077381))

(declare-fun m!996263 () Bool)

(assert (=> d!129847 m!996263))

(declare-fun m!996265 () Bool)

(assert (=> d!129847 m!996265))

(declare-fun m!996267 () Bool)

(assert (=> b!1077381 m!996267))

(assert (=> b!1077328 d!129847))

(declare-fun d!129849 () Bool)

(declare-fun lt!478539 () Bool)

(assert (=> d!129849 (= lt!478539 (select (content!535 Nil!23213) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!616015 () Bool)

(assert (=> d!129849 (= lt!478539 e!616015)))

(declare-fun res!717896 () Bool)

(assert (=> d!129849 (=> (not res!717896) (not e!616015))))

(assert (=> d!129849 (= res!717896 ((_ is Cons!23212) Nil!23213))))

(assert (=> d!129849 (= (contains!6367 Nil!23213 #b1000000000000000000000000000000000000000000000000000000000000000) lt!478539)))

(declare-fun b!1077382 () Bool)

(declare-fun e!616016 () Bool)

(assert (=> b!1077382 (= e!616015 e!616016)))

(declare-fun res!717895 () Bool)

(assert (=> b!1077382 (=> res!717895 e!616016)))

(assert (=> b!1077382 (= res!717895 (= (h!24421 Nil!23213) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077383 () Bool)

(assert (=> b!1077383 (= e!616016 (contains!6367 (t!32575 Nil!23213) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129849 res!717896) b!1077382))

(assert (= (and b!1077382 (not res!717895)) b!1077383))

(assert (=> d!129849 m!996263))

(declare-fun m!996269 () Bool)

(assert (=> d!129849 m!996269))

(declare-fun m!996271 () Bool)

(assert (=> b!1077383 m!996271))

(assert (=> b!1077322 d!129849))

(declare-fun b!1077391 () Bool)

(declare-fun e!616021 () Bool)

(assert (=> b!1077391 (= e!616021 tp_is_empty!26103)))

(declare-fun b!1077390 () Bool)

(declare-fun e!616022 () Bool)

(assert (=> b!1077390 (= e!616022 tp_is_empty!26103)))

(declare-fun mapNonEmpty!40900 () Bool)

(declare-fun mapRes!40900 () Bool)

(declare-fun tp!78362 () Bool)

(assert (=> mapNonEmpty!40900 (= mapRes!40900 (and tp!78362 e!616022))))

(declare-fun mapValue!40900 () ValueCell!12342)

(declare-fun mapKey!40900 () (_ BitVec 32))

(declare-fun mapRest!40900 () (Array (_ BitVec 32) ValueCell!12342))

(assert (=> mapNonEmpty!40900 (= mapRest!40894 (store mapRest!40900 mapKey!40900 mapValue!40900))))

(declare-fun condMapEmpty!40900 () Bool)

(declare-fun mapDefault!40900 () ValueCell!12342)

(assert (=> mapNonEmpty!40894 (= condMapEmpty!40900 (= mapRest!40894 ((as const (Array (_ BitVec 32) ValueCell!12342)) mapDefault!40900)))))

(assert (=> mapNonEmpty!40894 (= tp!78356 (and e!616021 mapRes!40900))))

(declare-fun mapIsEmpty!40900 () Bool)

(assert (=> mapIsEmpty!40900 mapRes!40900))

(assert (= (and mapNonEmpty!40894 condMapEmpty!40900) mapIsEmpty!40900))

(assert (= (and mapNonEmpty!40894 (not condMapEmpty!40900)) mapNonEmpty!40900))

(assert (= (and mapNonEmpty!40900 ((_ is ValueCellFull!12342) mapValue!40900)) b!1077390))

(assert (= (and mapNonEmpty!40894 ((_ is ValueCellFull!12342) mapDefault!40900)) b!1077391))

(declare-fun m!996273 () Bool)

(assert (=> mapNonEmpty!40900 m!996273))

(check-sat (not d!129849) (not mapNonEmpty!40900) (not bm!45716) (not b!1077368) (not d!129847) (not b!1077381) (not b!1077374) (not b!1077383) (not b!1077375) tp_is_empty!26103 (not b!1077367))
(check-sat)
