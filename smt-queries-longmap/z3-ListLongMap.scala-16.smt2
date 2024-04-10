; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!498 () Bool)

(assert start!498)

(declare-fun b!2924 () Bool)

(declare-fun e!1237 () Bool)

(declare-fun tp_is_empty!81 () Bool)

(assert (=> b!2924 (= e!1237 tp_is_empty!81)))

(declare-fun b!2925 () Bool)

(declare-fun e!1239 () Bool)

(declare-datatypes ((List!38 0))(
  ( (Nil!35) (Cons!34 (h!600 (_ BitVec 64)) (t!2165 List!38)) )
))
(declare-fun noDuplicate!5 (List!38) Bool)

(assert (=> b!2925 (= e!1239 (not (noDuplicate!5 Nil!35)))))

(declare-fun b!2926 () Bool)

(declare-fun res!4906 () Bool)

(assert (=> b!2926 (=> (not res!4906) (not e!1239))))

(declare-datatypes ((array!97 0))(
  ( (array!98 (arr!44 (Array (_ BitVec 32) (_ BitVec 64))) (size!106 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!97)

(assert (=> b!2926 (= res!4906 (and (bvsle #b00000000000000000000000000000000 (size!106 _keys!1806)) (bvslt (size!106 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!71 () Bool)

(declare-fun mapRes!71 () Bool)

(declare-fun tp!311 () Bool)

(assert (=> mapNonEmpty!71 (= mapRes!71 (and tp!311 e!1237))))

(declare-datatypes ((V!285 0))(
  ( (V!286 (val!46 Int)) )
))
(declare-datatypes ((ValueCell!24 0))(
  ( (ValueCellFull!24 (v!1132 V!285)) (EmptyCell!24) )
))
(declare-fun mapRest!71 () (Array (_ BitVec 32) ValueCell!24))

(declare-datatypes ((array!99 0))(
  ( (array!100 (arr!45 (Array (_ BitVec 32) ValueCell!24)) (size!107 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!99)

(declare-fun mapValue!71 () ValueCell!24)

(declare-fun mapKey!71 () (_ BitVec 32))

(assert (=> mapNonEmpty!71 (= (arr!45 _values!1492) (store mapRest!71 mapKey!71 mapValue!71))))

(declare-fun res!4905 () Bool)

(assert (=> start!498 (=> (not res!4905) (not e!1239))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!498 (= res!4905 (validMask!0 mask!2250))))

(assert (=> start!498 e!1239))

(assert (=> start!498 true))

(declare-fun e!1238 () Bool)

(declare-fun array_inv!25 (array!99) Bool)

(assert (=> start!498 (and (array_inv!25 _values!1492) e!1238)))

(declare-fun array_inv!26 (array!97) Bool)

(assert (=> start!498 (array_inv!26 _keys!1806)))

(declare-fun b!2927 () Bool)

(declare-fun res!4904 () Bool)

(assert (=> b!2927 (=> (not res!4904) (not e!1239))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!2927 (= res!4904 (and (= (size!107 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!106 _keys!1806) (size!107 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!2928 () Bool)

(declare-fun e!1235 () Bool)

(assert (=> b!2928 (= e!1238 (and e!1235 mapRes!71))))

(declare-fun condMapEmpty!71 () Bool)

(declare-fun mapDefault!71 () ValueCell!24)

(assert (=> b!2928 (= condMapEmpty!71 (= (arr!45 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!24)) mapDefault!71)))))

(declare-fun mapIsEmpty!71 () Bool)

(assert (=> mapIsEmpty!71 mapRes!71))

(declare-fun b!2929 () Bool)

(declare-fun res!4907 () Bool)

(assert (=> b!2929 (=> (not res!4907) (not e!1239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97 (_ BitVec 32)) Bool)

(assert (=> b!2929 (= res!4907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!2930 () Bool)

(assert (=> b!2930 (= e!1235 tp_is_empty!81)))

(assert (= (and start!498 res!4905) b!2927))

(assert (= (and b!2927 res!4904) b!2929))

(assert (= (and b!2929 res!4907) b!2926))

(assert (= (and b!2926 res!4906) b!2925))

(assert (= (and b!2928 condMapEmpty!71) mapIsEmpty!71))

(assert (= (and b!2928 (not condMapEmpty!71)) mapNonEmpty!71))

(get-info :version)

(assert (= (and mapNonEmpty!71 ((_ is ValueCellFull!24) mapValue!71)) b!2924))

(assert (= (and b!2928 ((_ is ValueCellFull!24) mapDefault!71)) b!2930))

(assert (= start!498 b!2928))

(declare-fun m!1315 () Bool)

(assert (=> b!2925 m!1315))

(declare-fun m!1317 () Bool)

(assert (=> mapNonEmpty!71 m!1317))

(declare-fun m!1319 () Bool)

(assert (=> start!498 m!1319))

(declare-fun m!1321 () Bool)

(assert (=> start!498 m!1321))

(declare-fun m!1323 () Bool)

(assert (=> start!498 m!1323))

(declare-fun m!1325 () Bool)

(assert (=> b!2929 m!1325))

(check-sat tp_is_empty!81 (not start!498) (not b!2929) (not b!2925) (not mapNonEmpty!71))
(check-sat)
(get-model)

(declare-fun d!593 () Bool)

(declare-fun res!4924 () Bool)

(declare-fun e!1259 () Bool)

(assert (=> d!593 (=> res!4924 e!1259)))

(assert (=> d!593 (= res!4924 ((_ is Nil!35) Nil!35))))

(assert (=> d!593 (= (noDuplicate!5 Nil!35) e!1259)))

(declare-fun b!2956 () Bool)

(declare-fun e!1260 () Bool)

(assert (=> b!2956 (= e!1259 e!1260)))

(declare-fun res!4925 () Bool)

(assert (=> b!2956 (=> (not res!4925) (not e!1260))))

(declare-fun contains!10 (List!38 (_ BitVec 64)) Bool)

(assert (=> b!2956 (= res!4925 (not (contains!10 (t!2165 Nil!35) (h!600 Nil!35))))))

(declare-fun b!2957 () Bool)

(assert (=> b!2957 (= e!1260 (noDuplicate!5 (t!2165 Nil!35)))))

(assert (= (and d!593 (not res!4924)) b!2956))

(assert (= (and b!2956 res!4925) b!2957))

(declare-fun m!1339 () Bool)

(assert (=> b!2956 m!1339))

(declare-fun m!1341 () Bool)

(assert (=> b!2957 m!1341))

(assert (=> b!2925 d!593))

(declare-fun bm!35 () Bool)

(declare-fun call!38 () Bool)

(assert (=> bm!35 (= call!38 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!2966 () Bool)

(declare-fun e!1267 () Bool)

(assert (=> b!2966 (= e!1267 call!38)))

(declare-fun d!595 () Bool)

(declare-fun res!4931 () Bool)

(declare-fun e!1268 () Bool)

(assert (=> d!595 (=> res!4931 e!1268)))

(assert (=> d!595 (= res!4931 (bvsge #b00000000000000000000000000000000 (size!106 _keys!1806)))))

(assert (=> d!595 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!1268)))

(declare-fun b!2967 () Bool)

(declare-fun e!1269 () Bool)

(assert (=> b!2967 (= e!1267 e!1269)))

(declare-fun lt!403 () (_ BitVec 64))

(assert (=> b!2967 (= lt!403 (select (arr!44 _keys!1806) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!23 0))(
  ( (Unit!24) )
))
(declare-fun lt!404 () Unit!23)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97 (_ BitVec 64) (_ BitVec 32)) Unit!23)

(assert (=> b!2967 (= lt!404 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!403 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!2967 (arrayContainsKey!0 _keys!1806 lt!403 #b00000000000000000000000000000000)))

(declare-fun lt!402 () Unit!23)

(assert (=> b!2967 (= lt!402 lt!404)))

(declare-fun res!4930 () Bool)

(declare-datatypes ((SeekEntryResult!7 0))(
  ( (MissingZero!7 (index!2147 (_ BitVec 32))) (Found!7 (index!2148 (_ BitVec 32))) (Intermediate!7 (undefined!819 Bool) (index!2149 (_ BitVec 32)) (x!2181 (_ BitVec 32))) (Undefined!7) (MissingVacant!7 (index!2150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97 (_ BitVec 32)) SeekEntryResult!7)

(assert (=> b!2967 (= res!4930 (= (seekEntryOrOpen!0 (select (arr!44 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!7 #b00000000000000000000000000000000)))))

(assert (=> b!2967 (=> (not res!4930) (not e!1269))))

(declare-fun b!2968 () Bool)

(assert (=> b!2968 (= e!1269 call!38)))

(declare-fun b!2969 () Bool)

(assert (=> b!2969 (= e!1268 e!1267)))

(declare-fun c!182 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!2969 (= c!182 (validKeyInArray!0 (select (arr!44 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!595 (not res!4931)) b!2969))

(assert (= (and b!2969 c!182) b!2967))

(assert (= (and b!2969 (not c!182)) b!2966))

(assert (= (and b!2967 res!4930) b!2968))

(assert (= (or b!2968 b!2966) bm!35))

(declare-fun m!1343 () Bool)

(assert (=> bm!35 m!1343))

(declare-fun m!1345 () Bool)

(assert (=> b!2967 m!1345))

(declare-fun m!1347 () Bool)

(assert (=> b!2967 m!1347))

(declare-fun m!1349 () Bool)

(assert (=> b!2967 m!1349))

(assert (=> b!2967 m!1345))

(declare-fun m!1351 () Bool)

(assert (=> b!2967 m!1351))

(assert (=> b!2969 m!1345))

(assert (=> b!2969 m!1345))

(declare-fun m!1353 () Bool)

(assert (=> b!2969 m!1353))

(assert (=> b!2929 d!595))

(declare-fun d!597 () Bool)

(assert (=> d!597 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!498 d!597))

(declare-fun d!599 () Bool)

(assert (=> d!599 (= (array_inv!25 _values!1492) (bvsge (size!107 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!498 d!599))

(declare-fun d!601 () Bool)

(assert (=> d!601 (= (array_inv!26 _keys!1806) (bvsge (size!106 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!498 d!601))

(declare-fun mapNonEmpty!77 () Bool)

(declare-fun mapRes!77 () Bool)

(declare-fun tp!317 () Bool)

(declare-fun e!1275 () Bool)

(assert (=> mapNonEmpty!77 (= mapRes!77 (and tp!317 e!1275))))

(declare-fun mapKey!77 () (_ BitVec 32))

(declare-fun mapRest!77 () (Array (_ BitVec 32) ValueCell!24))

(declare-fun mapValue!77 () ValueCell!24)

(assert (=> mapNonEmpty!77 (= mapRest!71 (store mapRest!77 mapKey!77 mapValue!77))))

(declare-fun mapIsEmpty!77 () Bool)

(assert (=> mapIsEmpty!77 mapRes!77))

(declare-fun b!2976 () Bool)

(assert (=> b!2976 (= e!1275 tp_is_empty!81)))

(declare-fun b!2977 () Bool)

(declare-fun e!1274 () Bool)

(assert (=> b!2977 (= e!1274 tp_is_empty!81)))

(declare-fun condMapEmpty!77 () Bool)

(declare-fun mapDefault!77 () ValueCell!24)

(assert (=> mapNonEmpty!71 (= condMapEmpty!77 (= mapRest!71 ((as const (Array (_ BitVec 32) ValueCell!24)) mapDefault!77)))))

(assert (=> mapNonEmpty!71 (= tp!311 (and e!1274 mapRes!77))))

(assert (= (and mapNonEmpty!71 condMapEmpty!77) mapIsEmpty!77))

(assert (= (and mapNonEmpty!71 (not condMapEmpty!77)) mapNonEmpty!77))

(assert (= (and mapNonEmpty!77 ((_ is ValueCellFull!24) mapValue!77)) b!2976))

(assert (= (and mapNonEmpty!71 ((_ is ValueCellFull!24) mapDefault!77)) b!2977))

(declare-fun m!1355 () Bool)

(assert (=> mapNonEmpty!77 m!1355))

(check-sat (not b!2967) (not b!2956) (not b!2957) (not b!2969) (not bm!35) tp_is_empty!81 (not mapNonEmpty!77))
(check-sat)
