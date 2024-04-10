; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111264 () Bool)

(assert start!111264)

(declare-fun b!1316924 () Bool)

(declare-fun res!874107 () Bool)

(declare-fun e!751352 () Bool)

(assert (=> b!1316924 (=> (not res!874107) (not e!751352))))

(declare-datatypes ((array!88488 0))(
  ( (array!88489 (arr!42720 (Array (_ BitVec 32) (_ BitVec 64))) (size!43270 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88488)

(assert (=> b!1316924 (= res!874107 (and (bvsle #b00000000000000000000000000000000 (size!43270 _keys!1609)) (bvslt (size!43270 _keys!1609) #b01111111111111111111111111111111)))))

(declare-fun b!1316926 () Bool)

(declare-fun e!751353 () Bool)

(declare-fun tp_is_empty!35763 () Bool)

(assert (=> b!1316926 (= e!751353 tp_is_empty!35763)))

(declare-fun mapNonEmpty!55286 () Bool)

(declare-fun mapRes!55286 () Bool)

(declare-fun tp!105392 () Bool)

(declare-fun e!751351 () Bool)

(assert (=> mapNonEmpty!55286 (= mapRes!55286 (and tp!105392 e!751351))))

(declare-fun mapKey!55286 () (_ BitVec 32))

(declare-datatypes ((V!52787 0))(
  ( (V!52788 (val!17956 Int)) )
))
(declare-datatypes ((ValueCell!16983 0))(
  ( (ValueCellFull!16983 (v!20585 V!52787)) (EmptyCell!16983) )
))
(declare-datatypes ((array!88490 0))(
  ( (array!88491 (arr!42721 (Array (_ BitVec 32) ValueCell!16983)) (size!43271 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88490)

(declare-fun mapRest!55286 () (Array (_ BitVec 32) ValueCell!16983))

(declare-fun mapValue!55286 () ValueCell!16983)

(assert (=> mapNonEmpty!55286 (= (arr!42721 _values!1337) (store mapRest!55286 mapKey!55286 mapValue!55286))))

(declare-fun b!1316927 () Bool)

(declare-datatypes ((List!30290 0))(
  ( (Nil!30287) (Cons!30286 (h!31495 (_ BitVec 64)) (t!43898 List!30290)) )
))
(declare-fun noDuplicate!2061 (List!30290) Bool)

(assert (=> b!1316927 (= e!751352 (not (noDuplicate!2061 Nil!30287)))))

(declare-fun res!874110 () Bool)

(assert (=> start!111264 (=> (not res!874110) (not e!751352))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111264 (= res!874110 (validMask!0 mask!2019))))

(assert (=> start!111264 e!751352))

(assert (=> start!111264 true))

(declare-fun e!751354 () Bool)

(declare-fun array_inv!32263 (array!88490) Bool)

(assert (=> start!111264 (and (array_inv!32263 _values!1337) e!751354)))

(declare-fun array_inv!32264 (array!88488) Bool)

(assert (=> start!111264 (array_inv!32264 _keys!1609)))

(declare-fun b!1316925 () Bool)

(declare-fun res!874109 () Bool)

(assert (=> b!1316925 (=> (not res!874109) (not e!751352))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1316925 (= res!874109 (and (= (size!43271 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43270 _keys!1609) (size!43271 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1316928 () Bool)

(assert (=> b!1316928 (= e!751354 (and e!751353 mapRes!55286))))

(declare-fun condMapEmpty!55286 () Bool)

(declare-fun mapDefault!55286 () ValueCell!16983)

(assert (=> b!1316928 (= condMapEmpty!55286 (= (arr!42721 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16983)) mapDefault!55286)))))

(declare-fun b!1316929 () Bool)

(declare-fun res!874108 () Bool)

(assert (=> b!1316929 (=> (not res!874108) (not e!751352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88488 (_ BitVec 32)) Bool)

(assert (=> b!1316929 (= res!874108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55286 () Bool)

(assert (=> mapIsEmpty!55286 mapRes!55286))

(declare-fun b!1316930 () Bool)

(assert (=> b!1316930 (= e!751351 tp_is_empty!35763)))

(assert (= (and start!111264 res!874110) b!1316925))

(assert (= (and b!1316925 res!874109) b!1316929))

(assert (= (and b!1316929 res!874108) b!1316924))

(assert (= (and b!1316924 res!874107) b!1316927))

(assert (= (and b!1316928 condMapEmpty!55286) mapIsEmpty!55286))

(assert (= (and b!1316928 (not condMapEmpty!55286)) mapNonEmpty!55286))

(get-info :version)

(assert (= (and mapNonEmpty!55286 ((_ is ValueCellFull!16983) mapValue!55286)) b!1316930))

(assert (= (and b!1316928 ((_ is ValueCellFull!16983) mapDefault!55286)) b!1316926))

(assert (= start!111264 b!1316928))

(declare-fun m!1204961 () Bool)

(assert (=> mapNonEmpty!55286 m!1204961))

(declare-fun m!1204963 () Bool)

(assert (=> b!1316927 m!1204963))

(declare-fun m!1204965 () Bool)

(assert (=> start!111264 m!1204965))

(declare-fun m!1204967 () Bool)

(assert (=> start!111264 m!1204967))

(declare-fun m!1204969 () Bool)

(assert (=> start!111264 m!1204969))

(declare-fun m!1204971 () Bool)

(assert (=> b!1316929 m!1204971))

(check-sat (not b!1316929) (not start!111264) (not b!1316927) tp_is_empty!35763 (not mapNonEmpty!55286))
(check-sat)
(get-model)

(declare-fun d!142699 () Bool)

(assert (=> d!142699 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111264 d!142699))

(declare-fun d!142701 () Bool)

(assert (=> d!142701 (= (array_inv!32263 _values!1337) (bvsge (size!43271 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111264 d!142701))

(declare-fun d!142703 () Bool)

(assert (=> d!142703 (= (array_inv!32264 _keys!1609) (bvsge (size!43270 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111264 d!142703))

(declare-fun b!1316960 () Bool)

(declare-fun e!751378 () Bool)

(declare-fun call!64681 () Bool)

(assert (=> b!1316960 (= e!751378 call!64681)))

(declare-fun b!1316961 () Bool)

(declare-fun e!751377 () Bool)

(assert (=> b!1316961 (= e!751377 e!751378)))

(declare-fun lt!586296 () (_ BitVec 64))

(assert (=> b!1316961 (= lt!586296 (select (arr!42720 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43418 0))(
  ( (Unit!43419) )
))
(declare-fun lt!586298 () Unit!43418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88488 (_ BitVec 64) (_ BitVec 32)) Unit!43418)

(assert (=> b!1316961 (= lt!586298 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!586296 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1316961 (arrayContainsKey!0 _keys!1609 lt!586296 #b00000000000000000000000000000000)))

(declare-fun lt!586297 () Unit!43418)

(assert (=> b!1316961 (= lt!586297 lt!586298)))

(declare-fun res!874127 () Bool)

(declare-datatypes ((SeekEntryResult!10038 0))(
  ( (MissingZero!10038 (index!42523 (_ BitVec 32))) (Found!10038 (index!42524 (_ BitVec 32))) (Intermediate!10038 (undefined!10850 Bool) (index!42525 (_ BitVec 32)) (x!117081 (_ BitVec 32))) (Undefined!10038) (MissingVacant!10038 (index!42526 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88488 (_ BitVec 32)) SeekEntryResult!10038)

(assert (=> b!1316961 (= res!874127 (= (seekEntryOrOpen!0 (select (arr!42720 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10038 #b00000000000000000000000000000000)))))

(assert (=> b!1316961 (=> (not res!874127) (not e!751378))))

(declare-fun b!1316962 () Bool)

(assert (=> b!1316962 (= e!751377 call!64681)))

(declare-fun d!142705 () Bool)

(declare-fun res!874128 () Bool)

(declare-fun e!751379 () Bool)

(assert (=> d!142705 (=> res!874128 e!751379)))

(assert (=> d!142705 (= res!874128 (bvsge #b00000000000000000000000000000000 (size!43270 _keys!1609)))))

(assert (=> d!142705 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!751379)))

(declare-fun bm!64678 () Bool)

(assert (=> bm!64678 (= call!64681 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1316963 () Bool)

(assert (=> b!1316963 (= e!751379 e!751377)))

(declare-fun c!125637 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1316963 (= c!125637 (validKeyInArray!0 (select (arr!42720 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!142705 (not res!874128)) b!1316963))

(assert (= (and b!1316963 c!125637) b!1316961))

(assert (= (and b!1316963 (not c!125637)) b!1316962))

(assert (= (and b!1316961 res!874127) b!1316960))

(assert (= (or b!1316960 b!1316962) bm!64678))

(declare-fun m!1204985 () Bool)

(assert (=> b!1316961 m!1204985))

(declare-fun m!1204987 () Bool)

(assert (=> b!1316961 m!1204987))

(declare-fun m!1204989 () Bool)

(assert (=> b!1316961 m!1204989))

(assert (=> b!1316961 m!1204985))

(declare-fun m!1204991 () Bool)

(assert (=> b!1316961 m!1204991))

(declare-fun m!1204993 () Bool)

(assert (=> bm!64678 m!1204993))

(assert (=> b!1316963 m!1204985))

(assert (=> b!1316963 m!1204985))

(declare-fun m!1204995 () Bool)

(assert (=> b!1316963 m!1204995))

(assert (=> b!1316929 d!142705))

(declare-fun d!142707 () Bool)

(declare-fun res!874133 () Bool)

(declare-fun e!751384 () Bool)

(assert (=> d!142707 (=> res!874133 e!751384)))

(assert (=> d!142707 (= res!874133 ((_ is Nil!30287) Nil!30287))))

(assert (=> d!142707 (= (noDuplicate!2061 Nil!30287) e!751384)))

(declare-fun b!1316968 () Bool)

(declare-fun e!751385 () Bool)

(assert (=> b!1316968 (= e!751384 e!751385)))

(declare-fun res!874134 () Bool)

(assert (=> b!1316968 (=> (not res!874134) (not e!751385))))

(declare-fun contains!8572 (List!30290 (_ BitVec 64)) Bool)

(assert (=> b!1316968 (= res!874134 (not (contains!8572 (t!43898 Nil!30287) (h!31495 Nil!30287))))))

(declare-fun b!1316969 () Bool)

(assert (=> b!1316969 (= e!751385 (noDuplicate!2061 (t!43898 Nil!30287)))))

(assert (= (and d!142707 (not res!874133)) b!1316968))

(assert (= (and b!1316968 res!874134) b!1316969))

(declare-fun m!1204997 () Bool)

(assert (=> b!1316968 m!1204997))

(declare-fun m!1204999 () Bool)

(assert (=> b!1316969 m!1204999))

(assert (=> b!1316927 d!142707))

(declare-fun b!1316977 () Bool)

(declare-fun e!751390 () Bool)

(assert (=> b!1316977 (= e!751390 tp_is_empty!35763)))

(declare-fun mapIsEmpty!55292 () Bool)

(declare-fun mapRes!55292 () Bool)

(assert (=> mapIsEmpty!55292 mapRes!55292))

(declare-fun mapNonEmpty!55292 () Bool)

(declare-fun tp!105398 () Bool)

(declare-fun e!751391 () Bool)

(assert (=> mapNonEmpty!55292 (= mapRes!55292 (and tp!105398 e!751391))))

(declare-fun mapValue!55292 () ValueCell!16983)

(declare-fun mapRest!55292 () (Array (_ BitVec 32) ValueCell!16983))

(declare-fun mapKey!55292 () (_ BitVec 32))

(assert (=> mapNonEmpty!55292 (= mapRest!55286 (store mapRest!55292 mapKey!55292 mapValue!55292))))

(declare-fun condMapEmpty!55292 () Bool)

(declare-fun mapDefault!55292 () ValueCell!16983)

(assert (=> mapNonEmpty!55286 (= condMapEmpty!55292 (= mapRest!55286 ((as const (Array (_ BitVec 32) ValueCell!16983)) mapDefault!55292)))))

(assert (=> mapNonEmpty!55286 (= tp!105392 (and e!751390 mapRes!55292))))

(declare-fun b!1316976 () Bool)

(assert (=> b!1316976 (= e!751391 tp_is_empty!35763)))

(assert (= (and mapNonEmpty!55286 condMapEmpty!55292) mapIsEmpty!55292))

(assert (= (and mapNonEmpty!55286 (not condMapEmpty!55292)) mapNonEmpty!55292))

(assert (= (and mapNonEmpty!55292 ((_ is ValueCellFull!16983) mapValue!55292)) b!1316976))

(assert (= (and mapNonEmpty!55286 ((_ is ValueCellFull!16983) mapDefault!55292)) b!1316977))

(declare-fun m!1205001 () Bool)

(assert (=> mapNonEmpty!55292 m!1205001))

(check-sat (not b!1316969) (not mapNonEmpty!55292) (not b!1316968) tp_is_empty!35763 (not b!1316961) (not b!1316963) (not bm!64678))
(check-sat)
