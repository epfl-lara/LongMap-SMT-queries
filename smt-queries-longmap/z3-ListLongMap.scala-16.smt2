; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!496 () Bool)

(assert start!496)

(declare-fun b!2903 () Bool)

(declare-fun res!4892 () Bool)

(declare-fun e!1223 () Bool)

(assert (=> b!2903 (=> (not res!4892) (not e!1223))))

(declare-datatypes ((array!91 0))(
  ( (array!92 (arr!41 (Array (_ BitVec 32) (_ BitVec 64))) (size!103 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!91)

(assert (=> b!2903 (= res!4892 (and (bvsle #b00000000000000000000000000000000 (size!103 _keys!1806)) (bvslt (size!103 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun b!2904 () Bool)

(declare-fun e!1222 () Bool)

(declare-fun tp_is_empty!79 () Bool)

(assert (=> b!2904 (= e!1222 tp_is_empty!79)))

(declare-fun b!2905 () Bool)

(declare-fun res!4894 () Bool)

(assert (=> b!2905 (=> (not res!4894) (not e!1223))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!283 0))(
  ( (V!284 (val!45 Int)) )
))
(declare-datatypes ((ValueCell!23 0))(
  ( (ValueCellFull!23 (v!1131 V!283)) (EmptyCell!23) )
))
(declare-datatypes ((array!93 0))(
  ( (array!94 (arr!42 (Array (_ BitVec 32) ValueCell!23)) (size!104 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!93)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!2905 (= res!4894 (and (= (size!104 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!103 _keys!1806) (size!104 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!68 () Bool)

(declare-fun mapRes!68 () Bool)

(declare-fun tp!308 () Bool)

(assert (=> mapNonEmpty!68 (= mapRes!68 (and tp!308 e!1222))))

(declare-fun mapValue!68 () ValueCell!23)

(declare-fun mapRest!68 () (Array (_ BitVec 32) ValueCell!23))

(declare-fun mapKey!68 () (_ BitVec 32))

(assert (=> mapNonEmpty!68 (= (arr!42 _values!1492) (store mapRest!68 mapKey!68 mapValue!68))))

(declare-fun res!4895 () Bool)

(assert (=> start!496 (=> (not res!4895) (not e!1223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!496 (= res!4895 (validMask!0 mask!2250))))

(assert (=> start!496 e!1223))

(assert (=> start!496 true))

(declare-fun e!1224 () Bool)

(declare-fun array_inv!23 (array!93) Bool)

(assert (=> start!496 (and (array_inv!23 _values!1492) e!1224)))

(declare-fun array_inv!24 (array!91) Bool)

(assert (=> start!496 (array_inv!24 _keys!1806)))

(declare-fun b!2906 () Bool)

(declare-fun res!4893 () Bool)

(assert (=> b!2906 (=> (not res!4893) (not e!1223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91 (_ BitVec 32)) Bool)

(assert (=> b!2906 (= res!4893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!68 () Bool)

(assert (=> mapIsEmpty!68 mapRes!68))

(declare-fun b!2907 () Bool)

(declare-fun e!1221 () Bool)

(assert (=> b!2907 (= e!1224 (and e!1221 mapRes!68))))

(declare-fun condMapEmpty!68 () Bool)

(declare-fun mapDefault!68 () ValueCell!23)

(assert (=> b!2907 (= condMapEmpty!68 (= (arr!42 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!23)) mapDefault!68)))))

(declare-fun b!2908 () Bool)

(assert (=> b!2908 (= e!1221 tp_is_empty!79)))

(declare-fun b!2909 () Bool)

(declare-datatypes ((List!37 0))(
  ( (Nil!34) (Cons!33 (h!599 (_ BitVec 64)) (t!2164 List!37)) )
))
(declare-fun noDuplicate!4 (List!37) Bool)

(assert (=> b!2909 (= e!1223 (not (noDuplicate!4 Nil!34)))))

(assert (= (and start!496 res!4895) b!2905))

(assert (= (and b!2905 res!4894) b!2906))

(assert (= (and b!2906 res!4893) b!2903))

(assert (= (and b!2903 res!4892) b!2909))

(assert (= (and b!2907 condMapEmpty!68) mapIsEmpty!68))

(assert (= (and b!2907 (not condMapEmpty!68)) mapNonEmpty!68))

(get-info :version)

(assert (= (and mapNonEmpty!68 ((_ is ValueCellFull!23) mapValue!68)) b!2904))

(assert (= (and b!2907 ((_ is ValueCellFull!23) mapDefault!68)) b!2908))

(assert (= start!496 b!2907))

(declare-fun m!1303 () Bool)

(assert (=> mapNonEmpty!68 m!1303))

(declare-fun m!1305 () Bool)

(assert (=> start!496 m!1305))

(declare-fun m!1307 () Bool)

(assert (=> start!496 m!1307))

(declare-fun m!1309 () Bool)

(assert (=> start!496 m!1309))

(declare-fun m!1311 () Bool)

(assert (=> b!2906 m!1311))

(declare-fun m!1313 () Bool)

(assert (=> b!2909 m!1313))

(check-sat (not b!2909) (not mapNonEmpty!68) tp_is_empty!79 (not b!2906) (not start!496))
(check-sat)
(get-model)

(declare-fun d!593 () Bool)

(declare-fun res!4924 () Bool)

(declare-fun e!1259 () Bool)

(assert (=> d!593 (=> res!4924 e!1259)))

(assert (=> d!593 (= res!4924 ((_ is Nil!34) Nil!34))))

(assert (=> d!593 (= (noDuplicate!4 Nil!34) e!1259)))

(declare-fun b!2956 () Bool)

(declare-fun e!1260 () Bool)

(assert (=> b!2956 (= e!1259 e!1260)))

(declare-fun res!4925 () Bool)

(assert (=> b!2956 (=> (not res!4925) (not e!1260))))

(declare-fun contains!11 (List!37 (_ BitVec 64)) Bool)

(assert (=> b!2956 (= res!4925 (not (contains!11 (t!2164 Nil!34) (h!599 Nil!34))))))

(declare-fun b!2957 () Bool)

(assert (=> b!2957 (= e!1260 (noDuplicate!4 (t!2164 Nil!34)))))

(assert (= (and d!593 (not res!4924)) b!2956))

(assert (= (and b!2956 res!4925) b!2957))

(declare-fun m!1339 () Bool)

(assert (=> b!2956 m!1339))

(declare-fun m!1341 () Bool)

(assert (=> b!2957 m!1341))

(assert (=> b!2909 d!593))

(declare-fun d!595 () Bool)

(assert (=> d!595 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!496 d!595))

(declare-fun d!597 () Bool)

(assert (=> d!597 (= (array_inv!23 _values!1492) (bvsge (size!104 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!496 d!597))

(declare-fun d!599 () Bool)

(assert (=> d!599 (= (array_inv!24 _keys!1806) (bvsge (size!103 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!496 d!599))

(declare-fun b!2966 () Bool)

(declare-fun e!1269 () Bool)

(declare-fun call!38 () Bool)

(assert (=> b!2966 (= e!1269 call!38)))

(declare-fun d!601 () Bool)

(declare-fun res!4930 () Bool)

(declare-fun e!1268 () Bool)

(assert (=> d!601 (=> res!4930 e!1268)))

(assert (=> d!601 (= res!4930 (bvsge #b00000000000000000000000000000000 (size!103 _keys!1806)))))

(assert (=> d!601 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!1268)))

(declare-fun b!2967 () Bool)

(declare-fun e!1267 () Bool)

(assert (=> b!2967 (= e!1267 e!1269)))

(declare-fun lt!403 () (_ BitVec 64))

(assert (=> b!2967 (= lt!403 (select (arr!41 _keys!1806) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!23 0))(
  ( (Unit!24) )
))
(declare-fun lt!402 () Unit!23)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!91 (_ BitVec 64) (_ BitVec 32)) Unit!23)

(assert (=> b!2967 (= lt!402 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!403 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!91 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!2967 (arrayContainsKey!0 _keys!1806 lt!403 #b00000000000000000000000000000000)))

(declare-fun lt!404 () Unit!23)

(assert (=> b!2967 (= lt!404 lt!402)))

(declare-fun res!4931 () Bool)

(declare-datatypes ((SeekEntryResult!7 0))(
  ( (MissingZero!7 (index!2147 (_ BitVec 32))) (Found!7 (index!2148 (_ BitVec 32))) (Intermediate!7 (undefined!819 Bool) (index!2149 (_ BitVec 32)) (x!2181 (_ BitVec 32))) (Undefined!7) (MissingVacant!7 (index!2150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!91 (_ BitVec 32)) SeekEntryResult!7)

(assert (=> b!2967 (= res!4931 (= (seekEntryOrOpen!0 (select (arr!41 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!7 #b00000000000000000000000000000000)))))

(assert (=> b!2967 (=> (not res!4931) (not e!1269))))

(declare-fun b!2968 () Bool)

(assert (=> b!2968 (= e!1268 e!1267)))

(declare-fun c!182 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!2968 (= c!182 (validKeyInArray!0 (select (arr!41 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!35 () Bool)

(assert (=> bm!35 (= call!38 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!2969 () Bool)

(assert (=> b!2969 (= e!1267 call!38)))

(assert (= (and d!601 (not res!4930)) b!2968))

(assert (= (and b!2968 c!182) b!2967))

(assert (= (and b!2968 (not c!182)) b!2969))

(assert (= (and b!2967 res!4931) b!2966))

(assert (= (or b!2966 b!2969) bm!35))

(declare-fun m!1343 () Bool)

(assert (=> b!2967 m!1343))

(declare-fun m!1345 () Bool)

(assert (=> b!2967 m!1345))

(declare-fun m!1347 () Bool)

(assert (=> b!2967 m!1347))

(assert (=> b!2967 m!1343))

(declare-fun m!1349 () Bool)

(assert (=> b!2967 m!1349))

(assert (=> b!2968 m!1343))

(assert (=> b!2968 m!1343))

(declare-fun m!1351 () Bool)

(assert (=> b!2968 m!1351))

(declare-fun m!1353 () Bool)

(assert (=> bm!35 m!1353))

(assert (=> b!2906 d!601))

(declare-fun b!2977 () Bool)

(declare-fun e!1274 () Bool)

(assert (=> b!2977 (= e!1274 tp_is_empty!79)))

(declare-fun b!2976 () Bool)

(declare-fun e!1275 () Bool)

(assert (=> b!2976 (= e!1275 tp_is_empty!79)))

(declare-fun mapNonEmpty!77 () Bool)

(declare-fun mapRes!77 () Bool)

(declare-fun tp!317 () Bool)

(assert (=> mapNonEmpty!77 (= mapRes!77 (and tp!317 e!1275))))

(declare-fun mapRest!77 () (Array (_ BitVec 32) ValueCell!23))

(declare-fun mapKey!77 () (_ BitVec 32))

(declare-fun mapValue!77 () ValueCell!23)

(assert (=> mapNonEmpty!77 (= mapRest!68 (store mapRest!77 mapKey!77 mapValue!77))))

(declare-fun condMapEmpty!77 () Bool)

(declare-fun mapDefault!77 () ValueCell!23)

(assert (=> mapNonEmpty!68 (= condMapEmpty!77 (= mapRest!68 ((as const (Array (_ BitVec 32) ValueCell!23)) mapDefault!77)))))

(assert (=> mapNonEmpty!68 (= tp!308 (and e!1274 mapRes!77))))

(declare-fun mapIsEmpty!77 () Bool)

(assert (=> mapIsEmpty!77 mapRes!77))

(assert (= (and mapNonEmpty!68 condMapEmpty!77) mapIsEmpty!77))

(assert (= (and mapNonEmpty!68 (not condMapEmpty!77)) mapNonEmpty!77))

(assert (= (and mapNonEmpty!77 ((_ is ValueCellFull!23) mapValue!77)) b!2976))

(assert (= (and mapNonEmpty!68 ((_ is ValueCellFull!23) mapDefault!77)) b!2977))

(declare-fun m!1355 () Bool)

(assert (=> mapNonEmpty!77 m!1355))

(check-sat (not b!2968) tp_is_empty!79 (not mapNonEmpty!77) (not b!2956) (not bm!35) (not b!2957) (not b!2967))
(check-sat)
