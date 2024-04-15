; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95456 () Bool)

(assert start!95456)

(declare-fun b!1077927 () Bool)

(declare-fun res!718280 () Bool)

(declare-fun e!616326 () Bool)

(assert (=> b!1077927 (=> (not res!718280) (not e!616326))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077927 (= res!718280 (validKeyInArray!0 k0!904))))

(declare-fun b!1077928 () Bool)

(declare-fun res!718282 () Bool)

(assert (=> b!1077928 (=> (not res!718282) (not e!616326))))

(declare-datatypes ((array!69180 0))(
  ( (array!69181 (arr!33266 (Array (_ BitVec 32) (_ BitVec 64))) (size!33804 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69180)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69180 (_ BitVec 32)) Bool)

(assert (=> b!1077928 (= res!718282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69181 (store (arr!33266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33804 _keys!1070)) mask!1414))))

(declare-fun mapIsEmpty!40972 () Bool)

(declare-fun mapRes!40972 () Bool)

(assert (=> mapIsEmpty!40972 mapRes!40972))

(declare-fun b!1077929 () Bool)

(declare-fun res!718283 () Bool)

(assert (=> b!1077929 (=> (not res!718283) (not e!616326))))

(declare-datatypes ((List!23282 0))(
  ( (Nil!23279) (Cons!23278 (h!24487 (_ BitVec 64)) (t!32632 List!23282)) )
))
(declare-fun noDuplicate!1590 (List!23282) Bool)

(assert (=> b!1077929 (= res!718283 (noDuplicate!1590 Nil!23279))))

(declare-fun b!1077930 () Bool)

(declare-fun res!718285 () Bool)

(assert (=> b!1077930 (=> (not res!718285) (not e!616326))))

(declare-fun arrayNoDuplicates!0 (array!69180 (_ BitVec 32) List!23282) Bool)

(assert (=> b!1077930 (= res!718285 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23279))))

(declare-fun b!1077931 () Bool)

(declare-fun e!616327 () Bool)

(declare-fun tp_is_empty!26149 () Bool)

(assert (=> b!1077931 (= e!616327 tp_is_empty!26149)))

(declare-fun b!1077932 () Bool)

(declare-fun res!718277 () Bool)

(assert (=> b!1077932 (=> (not res!718277) (not e!616326))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!39993 0))(
  ( (V!39994 (val!13131 Int)) )
))
(declare-datatypes ((ValueCell!12365 0))(
  ( (ValueCellFull!12365 (v!15750 V!39993)) (EmptyCell!12365) )
))
(declare-datatypes ((array!69182 0))(
  ( (array!69183 (arr!33267 (Array (_ BitVec 32) ValueCell!12365)) (size!33805 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69182)

(assert (=> b!1077932 (= res!718277 (and (= (size!33805 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33804 _keys!1070) (size!33805 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!718278 () Bool)

(assert (=> start!95456 (=> (not res!718278) (not e!616326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95456 (= res!718278 (validMask!0 mask!1414))))

(assert (=> start!95456 e!616326))

(assert (=> start!95456 true))

(declare-fun array_inv!25722 (array!69180) Bool)

(assert (=> start!95456 (array_inv!25722 _keys!1070)))

(declare-fun e!616324 () Bool)

(declare-fun array_inv!25723 (array!69182) Bool)

(assert (=> start!95456 (and (array_inv!25723 _values!874) e!616324)))

(declare-fun b!1077933 () Bool)

(declare-fun e!616323 () Bool)

(assert (=> b!1077933 (= e!616326 e!616323)))

(declare-fun res!718284 () Bool)

(assert (=> b!1077933 (=> res!718284 e!616323)))

(declare-fun contains!6341 (List!23282 (_ BitVec 64)) Bool)

(assert (=> b!1077933 (= res!718284 (contains!6341 Nil!23279 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077934 () Bool)

(assert (=> b!1077934 (= e!616324 (and e!616327 mapRes!40972))))

(declare-fun condMapEmpty!40972 () Bool)

(declare-fun mapDefault!40972 () ValueCell!12365)

(assert (=> b!1077934 (= condMapEmpty!40972 (= (arr!33267 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12365)) mapDefault!40972)))))

(declare-fun b!1077935 () Bool)

(assert (=> b!1077935 (= e!616323 (contains!6341 Nil!23279 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077936 () Bool)

(declare-fun res!718279 () Bool)

(assert (=> b!1077936 (=> (not res!718279) (not e!616326))))

(assert (=> b!1077936 (= res!718279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077937 () Bool)

(declare-fun res!718281 () Bool)

(assert (=> b!1077937 (=> (not res!718281) (not e!616326))))

(assert (=> b!1077937 (= res!718281 (= (select (arr!33266 _keys!1070) i!650) k0!904))))

(declare-fun b!1077938 () Bool)

(declare-fun e!616328 () Bool)

(assert (=> b!1077938 (= e!616328 tp_is_empty!26149)))

(declare-fun mapNonEmpty!40972 () Bool)

(declare-fun tp!78434 () Bool)

(assert (=> mapNonEmpty!40972 (= mapRes!40972 (and tp!78434 e!616328))))

(declare-fun mapKey!40972 () (_ BitVec 32))

(declare-fun mapRest!40972 () (Array (_ BitVec 32) ValueCell!12365))

(declare-fun mapValue!40972 () ValueCell!12365)

(assert (=> mapNonEmpty!40972 (= (arr!33267 _values!874) (store mapRest!40972 mapKey!40972 mapValue!40972))))

(declare-fun b!1077939 () Bool)

(declare-fun res!718287 () Bool)

(assert (=> b!1077939 (=> (not res!718287) (not e!616326))))

(assert (=> b!1077939 (= res!718287 (and (bvsle #b00000000000000000000000000000000 (size!33804 _keys!1070)) (bvslt (size!33804 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1077940 () Bool)

(declare-fun res!718286 () Bool)

(assert (=> b!1077940 (=> (not res!718286) (not e!616326))))

(assert (=> b!1077940 (= res!718286 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33804 _keys!1070))))))

(assert (= (and start!95456 res!718278) b!1077932))

(assert (= (and b!1077932 res!718277) b!1077936))

(assert (= (and b!1077936 res!718279) b!1077930))

(assert (= (and b!1077930 res!718285) b!1077940))

(assert (= (and b!1077940 res!718286) b!1077927))

(assert (= (and b!1077927 res!718280) b!1077937))

(assert (= (and b!1077937 res!718281) b!1077928))

(assert (= (and b!1077928 res!718282) b!1077939))

(assert (= (and b!1077939 res!718287) b!1077929))

(assert (= (and b!1077929 res!718283) b!1077933))

(assert (= (and b!1077933 (not res!718284)) b!1077935))

(assert (= (and b!1077934 condMapEmpty!40972) mapIsEmpty!40972))

(assert (= (and b!1077934 (not condMapEmpty!40972)) mapNonEmpty!40972))

(get-info :version)

(assert (= (and mapNonEmpty!40972 ((_ is ValueCellFull!12365) mapValue!40972)) b!1077938))

(assert (= (and b!1077934 ((_ is ValueCellFull!12365) mapDefault!40972)) b!1077931))

(assert (= start!95456 b!1077934))

(declare-fun m!996067 () Bool)

(assert (=> b!1077930 m!996067))

(declare-fun m!996069 () Bool)

(assert (=> b!1077935 m!996069))

(declare-fun m!996071 () Bool)

(assert (=> b!1077927 m!996071))

(declare-fun m!996073 () Bool)

(assert (=> mapNonEmpty!40972 m!996073))

(declare-fun m!996075 () Bool)

(assert (=> b!1077933 m!996075))

(declare-fun m!996077 () Bool)

(assert (=> b!1077937 m!996077))

(declare-fun m!996079 () Bool)

(assert (=> b!1077929 m!996079))

(declare-fun m!996081 () Bool)

(assert (=> start!95456 m!996081))

(declare-fun m!996083 () Bool)

(assert (=> start!95456 m!996083))

(declare-fun m!996085 () Bool)

(assert (=> start!95456 m!996085))

(declare-fun m!996087 () Bool)

(assert (=> b!1077936 m!996087))

(declare-fun m!996089 () Bool)

(assert (=> b!1077928 m!996089))

(declare-fun m!996091 () Bool)

(assert (=> b!1077928 m!996091))

(check-sat (not b!1077936) tp_is_empty!26149 (not b!1077933) (not b!1077935) (not start!95456) (not b!1077929) (not b!1077928) (not b!1077927) (not b!1077930) (not mapNonEmpty!40972))
(check-sat)
(get-model)

(declare-fun d!129741 () Bool)

(declare-fun lt!478384 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!535 (List!23282) (InoxSet (_ BitVec 64)))

(assert (=> d!129741 (= lt!478384 (select (content!535 Nil!23279) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!616370 () Bool)

(assert (=> d!129741 (= lt!478384 e!616370)))

(declare-fun res!718358 () Bool)

(assert (=> d!129741 (=> (not res!718358) (not e!616370))))

(assert (=> d!129741 (= res!718358 ((_ is Cons!23278) Nil!23279))))

(assert (=> d!129741 (= (contains!6341 Nil!23279 #b1000000000000000000000000000000000000000000000000000000000000000) lt!478384)))

(declare-fun b!1078029 () Bool)

(declare-fun e!616369 () Bool)

(assert (=> b!1078029 (= e!616370 e!616369)))

(declare-fun res!718359 () Bool)

(assert (=> b!1078029 (=> res!718359 e!616369)))

(assert (=> b!1078029 (= res!718359 (= (h!24487 Nil!23279) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1078030 () Bool)

(assert (=> b!1078030 (= e!616369 (contains!6341 (t!32632 Nil!23279) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129741 res!718358) b!1078029))

(assert (= (and b!1078029 (not res!718359)) b!1078030))

(declare-fun m!996145 () Bool)

(assert (=> d!129741 m!996145))

(declare-fun m!996147 () Bool)

(assert (=> d!129741 m!996147))

(declare-fun m!996149 () Bool)

(assert (=> b!1078030 m!996149))

(assert (=> b!1077935 d!129741))

(declare-fun b!1078041 () Bool)

(declare-fun e!616379 () Bool)

(assert (=> b!1078041 (= e!616379 (contains!6341 Nil!23279 (select (arr!33266 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45710 () Bool)

(declare-fun call!45713 () Bool)

(declare-fun c!108291 () Bool)

(assert (=> bm!45710 (= call!45713 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108291 (Cons!23278 (select (arr!33266 _keys!1070) #b00000000000000000000000000000000) Nil!23279) Nil!23279)))))

(declare-fun b!1078043 () Bool)

(declare-fun e!616381 () Bool)

(assert (=> b!1078043 (= e!616381 call!45713)))

(declare-fun b!1078042 () Bool)

(declare-fun e!616380 () Bool)

(assert (=> b!1078042 (= e!616380 e!616381)))

(assert (=> b!1078042 (= c!108291 (validKeyInArray!0 (select (arr!33266 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!129743 () Bool)

(declare-fun res!718368 () Bool)

(declare-fun e!616382 () Bool)

(assert (=> d!129743 (=> res!718368 e!616382)))

(assert (=> d!129743 (= res!718368 (bvsge #b00000000000000000000000000000000 (size!33804 _keys!1070)))))

(assert (=> d!129743 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23279) e!616382)))

(declare-fun b!1078044 () Bool)

(assert (=> b!1078044 (= e!616381 call!45713)))

(declare-fun b!1078045 () Bool)

(assert (=> b!1078045 (= e!616382 e!616380)))

(declare-fun res!718366 () Bool)

(assert (=> b!1078045 (=> (not res!718366) (not e!616380))))

(assert (=> b!1078045 (= res!718366 (not e!616379))))

(declare-fun res!718367 () Bool)

(assert (=> b!1078045 (=> (not res!718367) (not e!616379))))

(assert (=> b!1078045 (= res!718367 (validKeyInArray!0 (select (arr!33266 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!129743 (not res!718368)) b!1078045))

(assert (= (and b!1078045 res!718367) b!1078041))

(assert (= (and b!1078045 res!718366) b!1078042))

(assert (= (and b!1078042 c!108291) b!1078043))

(assert (= (and b!1078042 (not c!108291)) b!1078044))

(assert (= (or b!1078043 b!1078044) bm!45710))

(declare-fun m!996151 () Bool)

(assert (=> b!1078041 m!996151))

(assert (=> b!1078041 m!996151))

(declare-fun m!996153 () Bool)

(assert (=> b!1078041 m!996153))

(assert (=> bm!45710 m!996151))

(declare-fun m!996155 () Bool)

(assert (=> bm!45710 m!996155))

(assert (=> b!1078042 m!996151))

(assert (=> b!1078042 m!996151))

(declare-fun m!996157 () Bool)

(assert (=> b!1078042 m!996157))

(assert (=> b!1078045 m!996151))

(assert (=> b!1078045 m!996151))

(assert (=> b!1078045 m!996157))

(assert (=> b!1077930 d!129743))

(declare-fun b!1078054 () Bool)

(declare-fun e!616390 () Bool)

(declare-fun e!616389 () Bool)

(assert (=> b!1078054 (= e!616390 e!616389)))

(declare-fun c!108294 () Bool)

(assert (=> b!1078054 (= c!108294 (validKeyInArray!0 (select (arr!33266 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!129745 () Bool)

(declare-fun res!718373 () Bool)

(assert (=> d!129745 (=> res!718373 e!616390)))

(assert (=> d!129745 (= res!718373 (bvsge #b00000000000000000000000000000000 (size!33804 _keys!1070)))))

(assert (=> d!129745 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616390)))

(declare-fun bm!45713 () Bool)

(declare-fun call!45716 () Bool)

(assert (=> bm!45713 (= call!45716 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1078055 () Bool)

(assert (=> b!1078055 (= e!616389 call!45716)))

(declare-fun b!1078056 () Bool)

(declare-fun e!616391 () Bool)

(assert (=> b!1078056 (= e!616391 call!45716)))

(declare-fun b!1078057 () Bool)

(assert (=> b!1078057 (= e!616389 e!616391)))

(declare-fun lt!478391 () (_ BitVec 64))

(assert (=> b!1078057 (= lt!478391 (select (arr!33266 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35307 0))(
  ( (Unit!35308) )
))
(declare-fun lt!478393 () Unit!35307)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69180 (_ BitVec 64) (_ BitVec 32)) Unit!35307)

(assert (=> b!1078057 (= lt!478393 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478391 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078057 (arrayContainsKey!0 _keys!1070 lt!478391 #b00000000000000000000000000000000)))

(declare-fun lt!478392 () Unit!35307)

(assert (=> b!1078057 (= lt!478392 lt!478393)))

(declare-fun res!718374 () Bool)

(declare-datatypes ((SeekEntryResult!9901 0))(
  ( (MissingZero!9901 (index!41975 (_ BitVec 32))) (Found!9901 (index!41976 (_ BitVec 32))) (Intermediate!9901 (undefined!10713 Bool) (index!41977 (_ BitVec 32)) (x!96641 (_ BitVec 32))) (Undefined!9901) (MissingVacant!9901 (index!41978 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69180 (_ BitVec 32)) SeekEntryResult!9901)

(assert (=> b!1078057 (= res!718374 (= (seekEntryOrOpen!0 (select (arr!33266 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9901 #b00000000000000000000000000000000)))))

(assert (=> b!1078057 (=> (not res!718374) (not e!616391))))

(assert (= (and d!129745 (not res!718373)) b!1078054))

(assert (= (and b!1078054 c!108294) b!1078057))

(assert (= (and b!1078054 (not c!108294)) b!1078055))

(assert (= (and b!1078057 res!718374) b!1078056))

(assert (= (or b!1078056 b!1078055) bm!45713))

(assert (=> b!1078054 m!996151))

(assert (=> b!1078054 m!996151))

(assert (=> b!1078054 m!996157))

(declare-fun m!996159 () Bool)

(assert (=> bm!45713 m!996159))

(assert (=> b!1078057 m!996151))

(declare-fun m!996161 () Bool)

(assert (=> b!1078057 m!996161))

(declare-fun m!996163 () Bool)

(assert (=> b!1078057 m!996163))

(assert (=> b!1078057 m!996151))

(declare-fun m!996165 () Bool)

(assert (=> b!1078057 m!996165))

(assert (=> b!1077936 d!129745))

(declare-fun d!129747 () Bool)

(declare-fun res!718379 () Bool)

(declare-fun e!616396 () Bool)

(assert (=> d!129747 (=> res!718379 e!616396)))

(assert (=> d!129747 (= res!718379 ((_ is Nil!23279) Nil!23279))))

(assert (=> d!129747 (= (noDuplicate!1590 Nil!23279) e!616396)))

(declare-fun b!1078062 () Bool)

(declare-fun e!616397 () Bool)

(assert (=> b!1078062 (= e!616396 e!616397)))

(declare-fun res!718380 () Bool)

(assert (=> b!1078062 (=> (not res!718380) (not e!616397))))

(assert (=> b!1078062 (= res!718380 (not (contains!6341 (t!32632 Nil!23279) (h!24487 Nil!23279))))))

(declare-fun b!1078063 () Bool)

(assert (=> b!1078063 (= e!616397 (noDuplicate!1590 (t!32632 Nil!23279)))))

(assert (= (and d!129747 (not res!718379)) b!1078062))

(assert (= (and b!1078062 res!718380) b!1078063))

(declare-fun m!996167 () Bool)

(assert (=> b!1078062 m!996167))

(declare-fun m!996169 () Bool)

(assert (=> b!1078063 m!996169))

(assert (=> b!1077929 d!129747))

(declare-fun b!1078064 () Bool)

(declare-fun e!616399 () Bool)

(declare-fun e!616398 () Bool)

(assert (=> b!1078064 (= e!616399 e!616398)))

(declare-fun c!108295 () Bool)

(assert (=> b!1078064 (= c!108295 (validKeyInArray!0 (select (arr!33266 (array!69181 (store (arr!33266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33804 _keys!1070))) #b00000000000000000000000000000000)))))

(declare-fun d!129749 () Bool)

(declare-fun res!718381 () Bool)

(assert (=> d!129749 (=> res!718381 e!616399)))

(assert (=> d!129749 (= res!718381 (bvsge #b00000000000000000000000000000000 (size!33804 (array!69181 (store (arr!33266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33804 _keys!1070)))))))

(assert (=> d!129749 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69181 (store (arr!33266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33804 _keys!1070)) mask!1414) e!616399)))

(declare-fun bm!45714 () Bool)

(declare-fun call!45717 () Bool)

(assert (=> bm!45714 (= call!45717 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!69181 (store (arr!33266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33804 _keys!1070)) mask!1414))))

(declare-fun b!1078065 () Bool)

(assert (=> b!1078065 (= e!616398 call!45717)))

(declare-fun b!1078066 () Bool)

(declare-fun e!616400 () Bool)

(assert (=> b!1078066 (= e!616400 call!45717)))

(declare-fun b!1078067 () Bool)

(assert (=> b!1078067 (= e!616398 e!616400)))

(declare-fun lt!478394 () (_ BitVec 64))

(assert (=> b!1078067 (= lt!478394 (select (arr!33266 (array!69181 (store (arr!33266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33804 _keys!1070))) #b00000000000000000000000000000000))))

(declare-fun lt!478396 () Unit!35307)

(assert (=> b!1078067 (= lt!478396 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69181 (store (arr!33266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33804 _keys!1070)) lt!478394 #b00000000000000000000000000000000))))

(assert (=> b!1078067 (arrayContainsKey!0 (array!69181 (store (arr!33266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33804 _keys!1070)) lt!478394 #b00000000000000000000000000000000)))

(declare-fun lt!478395 () Unit!35307)

(assert (=> b!1078067 (= lt!478395 lt!478396)))

(declare-fun res!718382 () Bool)

(assert (=> b!1078067 (= res!718382 (= (seekEntryOrOpen!0 (select (arr!33266 (array!69181 (store (arr!33266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33804 _keys!1070))) #b00000000000000000000000000000000) (array!69181 (store (arr!33266 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33804 _keys!1070)) mask!1414) (Found!9901 #b00000000000000000000000000000000)))))

(assert (=> b!1078067 (=> (not res!718382) (not e!616400))))

(assert (= (and d!129749 (not res!718381)) b!1078064))

(assert (= (and b!1078064 c!108295) b!1078067))

(assert (= (and b!1078064 (not c!108295)) b!1078065))

(assert (= (and b!1078067 res!718382) b!1078066))

(assert (= (or b!1078066 b!1078065) bm!45714))

(declare-fun m!996171 () Bool)

(assert (=> b!1078064 m!996171))

(assert (=> b!1078064 m!996171))

(declare-fun m!996173 () Bool)

(assert (=> b!1078064 m!996173))

(declare-fun m!996175 () Bool)

(assert (=> bm!45714 m!996175))

(assert (=> b!1078067 m!996171))

(declare-fun m!996177 () Bool)

(assert (=> b!1078067 m!996177))

(declare-fun m!996179 () Bool)

(assert (=> b!1078067 m!996179))

(assert (=> b!1078067 m!996171))

(declare-fun m!996181 () Bool)

(assert (=> b!1078067 m!996181))

(assert (=> b!1077928 d!129749))

(declare-fun d!129751 () Bool)

(declare-fun lt!478397 () Bool)

(assert (=> d!129751 (= lt!478397 (select (content!535 Nil!23279) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!616402 () Bool)

(assert (=> d!129751 (= lt!478397 e!616402)))

(declare-fun res!718383 () Bool)

(assert (=> d!129751 (=> (not res!718383) (not e!616402))))

(assert (=> d!129751 (= res!718383 ((_ is Cons!23278) Nil!23279))))

(assert (=> d!129751 (= (contains!6341 Nil!23279 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478397)))

(declare-fun b!1078068 () Bool)

(declare-fun e!616401 () Bool)

(assert (=> b!1078068 (= e!616402 e!616401)))

(declare-fun res!718384 () Bool)

(assert (=> b!1078068 (=> res!718384 e!616401)))

(assert (=> b!1078068 (= res!718384 (= (h!24487 Nil!23279) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1078069 () Bool)

(assert (=> b!1078069 (= e!616401 (contains!6341 (t!32632 Nil!23279) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!129751 res!718383) b!1078068))

(assert (= (and b!1078068 (not res!718384)) b!1078069))

(assert (=> d!129751 m!996145))

(declare-fun m!996183 () Bool)

(assert (=> d!129751 m!996183))

(declare-fun m!996185 () Bool)

(assert (=> b!1078069 m!996185))

(assert (=> b!1077933 d!129751))

(declare-fun d!129753 () Bool)

(assert (=> d!129753 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95456 d!129753))

(declare-fun d!129755 () Bool)

(assert (=> d!129755 (= (array_inv!25722 _keys!1070) (bvsge (size!33804 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95456 d!129755))

(declare-fun d!129757 () Bool)

(assert (=> d!129757 (= (array_inv!25723 _values!874) (bvsge (size!33805 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95456 d!129757))

(declare-fun d!129759 () Bool)

(assert (=> d!129759 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1077927 d!129759))

(declare-fun mapNonEmpty!40981 () Bool)

(declare-fun mapRes!40981 () Bool)

(declare-fun tp!78443 () Bool)

(declare-fun e!616408 () Bool)

(assert (=> mapNonEmpty!40981 (= mapRes!40981 (and tp!78443 e!616408))))

(declare-fun mapRest!40981 () (Array (_ BitVec 32) ValueCell!12365))

(declare-fun mapValue!40981 () ValueCell!12365)

(declare-fun mapKey!40981 () (_ BitVec 32))

(assert (=> mapNonEmpty!40981 (= mapRest!40972 (store mapRest!40981 mapKey!40981 mapValue!40981))))

(declare-fun mapIsEmpty!40981 () Bool)

(assert (=> mapIsEmpty!40981 mapRes!40981))

(declare-fun condMapEmpty!40981 () Bool)

(declare-fun mapDefault!40981 () ValueCell!12365)

(assert (=> mapNonEmpty!40972 (= condMapEmpty!40981 (= mapRest!40972 ((as const (Array (_ BitVec 32) ValueCell!12365)) mapDefault!40981)))))

(declare-fun e!616407 () Bool)

(assert (=> mapNonEmpty!40972 (= tp!78434 (and e!616407 mapRes!40981))))

(declare-fun b!1078077 () Bool)

(assert (=> b!1078077 (= e!616407 tp_is_empty!26149)))

(declare-fun b!1078076 () Bool)

(assert (=> b!1078076 (= e!616408 tp_is_empty!26149)))

(assert (= (and mapNonEmpty!40972 condMapEmpty!40981) mapIsEmpty!40981))

(assert (= (and mapNonEmpty!40972 (not condMapEmpty!40981)) mapNonEmpty!40981))

(assert (= (and mapNonEmpty!40981 ((_ is ValueCellFull!12365) mapValue!40981)) b!1078076))

(assert (= (and mapNonEmpty!40972 ((_ is ValueCellFull!12365) mapDefault!40981)) b!1078077))

(declare-fun m!996187 () Bool)

(assert (=> mapNonEmpty!40981 m!996187))

(check-sat (not b!1078064) (not b!1078062) (not b!1078054) (not d!129741) (not b!1078042) (not b!1078067) (not b!1078041) (not b!1078057) (not b!1078069) (not bm!45713) (not d!129751) (not mapNonEmpty!40981) (not b!1078045) tp_is_empty!26149 (not b!1078063) (not bm!45714) (not bm!45710) (not b!1078030))
(check-sat)
