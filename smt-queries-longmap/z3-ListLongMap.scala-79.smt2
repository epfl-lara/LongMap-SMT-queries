; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1076 () Bool)

(assert start!1076)

(declare-fun b_free!379 () Bool)

(declare-fun b_next!379 () Bool)

(assert (=> start!1076 (= b_free!379 (not b_next!379))))

(declare-fun tp!1379 () Bool)

(declare-fun b_and!533 () Bool)

(assert (=> start!1076 (= tp!1379 b_and!533)))

(declare-fun b!9505 () Bool)

(declare-fun e!5440 () Bool)

(declare-fun tp_is_empty!457 () Bool)

(assert (=> b!9505 (= e!5440 tp_is_empty!457)))

(declare-fun mapIsEmpty!668 () Bool)

(declare-fun mapRes!668 () Bool)

(assert (=> mapIsEmpty!668 mapRes!668))

(declare-fun b!9506 () Bool)

(declare-fun e!5441 () Bool)

(declare-datatypes ((SeekEntryResult!36 0))(
  ( (MissingZero!36 (index!2263 (_ BitVec 32))) (Found!36 (index!2264 (_ BitVec 32))) (Intermediate!36 (undefined!848 Bool) (index!2265 (_ BitVec 32)) (x!2798 (_ BitVec 32))) (Undefined!36) (MissingVacant!36 (index!2266 (_ BitVec 32))) )
))
(declare-fun lt!2145 () SeekEntryResult!36)

(declare-datatypes ((array!829 0))(
  ( (array!830 (arr!399 (Array (_ BitVec 32) (_ BitVec 64))) (size!461 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!829)

(assert (=> b!9506 (= e!5441 (and (bvsge (index!2264 lt!2145) #b00000000000000000000000000000000) (bvslt (index!2264 lt!2145) (size!461 _keys!1806))))))

(declare-fun b!9507 () Bool)

(declare-fun e!5443 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9507 (= e!5443 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9508 () Bool)

(declare-fun e!5447 () Bool)

(assert (=> b!9508 (= e!5447 tp_is_empty!457)))

(declare-fun res!8535 () Bool)

(declare-fun e!5446 () Bool)

(assert (=> start!1076 (=> (not res!8535) (not e!5446))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1076 (= res!8535 (validMask!0 mask!2250))))

(assert (=> start!1076 e!5446))

(assert (=> start!1076 tp!1379))

(assert (=> start!1076 true))

(declare-datatypes ((V!787 0))(
  ( (V!788 (val!234 Int)) )
))
(declare-datatypes ((ValueCell!212 0))(
  ( (ValueCellFull!212 (v!1329 V!787)) (EmptyCell!212) )
))
(declare-datatypes ((array!831 0))(
  ( (array!832 (arr!400 (Array (_ BitVec 32) ValueCell!212)) (size!462 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!831)

(declare-fun e!5439 () Bool)

(declare-fun array_inv!297 (array!831) Bool)

(assert (=> start!1076 (and (array_inv!297 _values!1492) e!5439)))

(assert (=> start!1076 tp_is_empty!457))

(declare-fun array_inv!298 (array!829) Bool)

(assert (=> start!1076 (array_inv!298 _keys!1806)))

(declare-fun b!9509 () Bool)

(assert (=> b!9509 (= e!5439 (and e!5440 mapRes!668))))

(declare-fun condMapEmpty!668 () Bool)

(declare-fun mapDefault!668 () ValueCell!212)

(assert (=> b!9509 (= condMapEmpty!668 (= (arr!400 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!212)) mapDefault!668)))))

(declare-fun b!9510 () Bool)

(declare-fun e!5444 () Bool)

(assert (=> b!9510 (= e!5446 (not e!5444))))

(declare-fun res!8539 () Bool)

(assert (=> b!9510 (=> res!8539 e!5444)))

(assert (=> b!9510 (= res!8539 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!9510 e!5443))

(declare-fun c!759 () Bool)

(assert (=> b!9510 (= c!759 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!787)

(declare-datatypes ((Unit!205 0))(
  ( (Unit!206) )
))
(declare-fun lt!2144 () Unit!205)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!787)

(declare-fun lemmaKeyInListMapIsInArray!79 (array!829 array!831 (_ BitVec 32) (_ BitVec 32) V!787 V!787 (_ BitVec 64) Int) Unit!205)

(assert (=> b!9510 (= lt!2144 (lemmaKeyInListMapIsInArray!79 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!9511 () Bool)

(declare-fun res!8537 () Bool)

(assert (=> b!9511 (=> (not res!8537) (not e!5446))))

(declare-datatypes ((tuple2!268 0))(
  ( (tuple2!269 (_1!134 (_ BitVec 64)) (_2!134 V!787)) )
))
(declare-datatypes ((List!281 0))(
  ( (Nil!278) (Cons!277 (h!843 tuple2!268) (t!2424 List!281)) )
))
(declare-datatypes ((ListLongMap!273 0))(
  ( (ListLongMap!274 (toList!152 List!281)) )
))
(declare-fun contains!130 (ListLongMap!273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!111 (array!829 array!831 (_ BitVec 32) (_ BitVec 32) V!787 V!787 (_ BitVec 32) Int) ListLongMap!273)

(assert (=> b!9511 (= res!8537 (contains!130 (getCurrentListMap!111 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!9512 () Bool)

(declare-fun res!8541 () Bool)

(declare-fun e!5442 () Bool)

(assert (=> b!9512 (=> res!8541 e!5442)))

(declare-fun lt!2148 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!829 (_ BitVec 32)) SeekEntryResult!36)

(assert (=> b!9512 (= res!8541 (not (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) (Found!36 lt!2148))))))

(declare-fun b!9513 () Bool)

(assert (=> b!9513 (= e!5443 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!9514 () Bool)

(assert (=> b!9514 (= e!5442 e!5441)))

(declare-fun res!8536 () Bool)

(assert (=> b!9514 (=> res!8536 e!5441)))

(get-info :version)

(assert (=> b!9514 (= res!8536 (not ((_ is Found!36) lt!2145)))))

(assert (=> b!9514 (and ((_ is Found!36) lt!2145) (= (index!2264 lt!2145) lt!2148))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!829 (_ BitVec 32)) SeekEntryResult!36)

(assert (=> b!9514 (= lt!2145 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun lt!2146 () Unit!205)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!829 (_ BitVec 32)) Unit!205)

(assert (=> b!9514 (= lt!2146 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!2148 _keys!1806 mask!2250))))

(declare-fun b!9515 () Bool)

(declare-fun res!8532 () Bool)

(assert (=> b!9515 (=> (not res!8532) (not e!5446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9515 (= res!8532 (validKeyInArray!0 k0!1278))))

(declare-fun b!9516 () Bool)

(declare-fun res!8534 () Bool)

(assert (=> b!9516 (=> (not res!8534) (not e!5446))))

(assert (=> b!9516 (= res!8534 (and (= (size!462 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!461 _keys!1806) (size!462 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!9517 () Bool)

(assert (=> b!9517 (= e!5444 e!5442)))

(declare-fun res!8531 () Bool)

(assert (=> b!9517 (=> res!8531 e!5442)))

(assert (=> b!9517 (= res!8531 (not (= (size!461 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!829 (_ BitVec 32)) Bool)

(assert (=> b!9517 (arrayForallSeekEntryOrOpenFound!0 lt!2148 _keys!1806 mask!2250)))

(declare-fun lt!2147 () Unit!205)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!205)

(assert (=> b!9517 (= lt!2147 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2148))))

(declare-fun arrayScanForKey!0 (array!829 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9517 (= lt!2148 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9518 () Bool)

(declare-fun res!8533 () Bool)

(assert (=> b!9518 (=> res!8533 e!5441)))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9518 (= res!8533 (not (inRange!0 (index!2264 lt!2145) mask!2250)))))

(declare-fun b!9519 () Bool)

(declare-fun res!8538 () Bool)

(assert (=> b!9519 (=> (not res!8538) (not e!5446))))

(declare-datatypes ((List!282 0))(
  ( (Nil!279) (Cons!278 (h!844 (_ BitVec 64)) (t!2425 List!282)) )
))
(declare-fun arrayNoDuplicates!0 (array!829 (_ BitVec 32) List!282) Bool)

(assert (=> b!9519 (= res!8538 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!279))))

(declare-fun b!9520 () Bool)

(declare-fun res!8540 () Bool)

(assert (=> b!9520 (=> (not res!8540) (not e!5446))))

(assert (=> b!9520 (= res!8540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!668 () Bool)

(declare-fun tp!1378 () Bool)

(assert (=> mapNonEmpty!668 (= mapRes!668 (and tp!1378 e!5447))))

(declare-fun mapKey!668 () (_ BitVec 32))

(declare-fun mapValue!668 () ValueCell!212)

(declare-fun mapRest!668 () (Array (_ BitVec 32) ValueCell!212))

(assert (=> mapNonEmpty!668 (= (arr!400 _values!1492) (store mapRest!668 mapKey!668 mapValue!668))))

(assert (= (and start!1076 res!8535) b!9516))

(assert (= (and b!9516 res!8534) b!9520))

(assert (= (and b!9520 res!8540) b!9519))

(assert (= (and b!9519 res!8538) b!9511))

(assert (= (and b!9511 res!8537) b!9515))

(assert (= (and b!9515 res!8532) b!9510))

(assert (= (and b!9510 c!759) b!9507))

(assert (= (and b!9510 (not c!759)) b!9513))

(assert (= (and b!9510 (not res!8539)) b!9517))

(assert (= (and b!9517 (not res!8531)) b!9512))

(assert (= (and b!9512 (not res!8541)) b!9514))

(assert (= (and b!9514 (not res!8536)) b!9518))

(assert (= (and b!9518 (not res!8533)) b!9506))

(assert (= (and b!9509 condMapEmpty!668) mapIsEmpty!668))

(assert (= (and b!9509 (not condMapEmpty!668)) mapNonEmpty!668))

(assert (= (and mapNonEmpty!668 ((_ is ValueCellFull!212) mapValue!668)) b!9508))

(assert (= (and b!9509 ((_ is ValueCellFull!212) mapDefault!668)) b!9505))

(assert (= start!1076 b!9509))

(declare-fun m!5979 () Bool)

(assert (=> start!1076 m!5979))

(declare-fun m!5981 () Bool)

(assert (=> start!1076 m!5981))

(declare-fun m!5983 () Bool)

(assert (=> start!1076 m!5983))

(declare-fun m!5985 () Bool)

(assert (=> b!9514 m!5985))

(declare-fun m!5987 () Bool)

(assert (=> b!9514 m!5987))

(declare-fun m!5989 () Bool)

(assert (=> b!9507 m!5989))

(declare-fun m!5991 () Bool)

(assert (=> mapNonEmpty!668 m!5991))

(declare-fun m!5993 () Bool)

(assert (=> b!9518 m!5993))

(declare-fun m!5995 () Bool)

(assert (=> b!9519 m!5995))

(declare-fun m!5997 () Bool)

(assert (=> b!9512 m!5997))

(declare-fun m!5999 () Bool)

(assert (=> b!9515 m!5999))

(assert (=> b!9510 m!5989))

(declare-fun m!6001 () Bool)

(assert (=> b!9510 m!6001))

(declare-fun m!6003 () Bool)

(assert (=> b!9511 m!6003))

(assert (=> b!9511 m!6003))

(declare-fun m!6005 () Bool)

(assert (=> b!9511 m!6005))

(declare-fun m!6007 () Bool)

(assert (=> b!9520 m!6007))

(declare-fun m!6009 () Bool)

(assert (=> b!9517 m!6009))

(declare-fun m!6011 () Bool)

(assert (=> b!9517 m!6011))

(declare-fun m!6013 () Bool)

(assert (=> b!9517 m!6013))

(check-sat (not start!1076) (not b!9517) (not b_next!379) (not b!9514) (not b!9515) (not b!9512) b_and!533 tp_is_empty!457 (not mapNonEmpty!668) (not b!9519) (not b!9507) (not b!9520) (not b!9511) (not b!9510) (not b!9518))
(check-sat b_and!533 (not b_next!379))
(get-model)

(declare-fun d!925 () Bool)

(declare-fun res!8612 () Bool)

(declare-fun e!5506 () Bool)

(assert (=> d!925 (=> res!8612 e!5506)))

(assert (=> d!925 (= res!8612 (= (select (arr!399 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!925 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!5506)))

(declare-fun b!9621 () Bool)

(declare-fun e!5507 () Bool)

(assert (=> b!9621 (= e!5506 e!5507)))

(declare-fun res!8613 () Bool)

(assert (=> b!9621 (=> (not res!8613) (not e!5507))))

(assert (=> b!9621 (= res!8613 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!461 _keys!1806)))))

(declare-fun b!9622 () Bool)

(assert (=> b!9622 (= e!5507 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!925 (not res!8612)) b!9621))

(assert (= (and b!9621 res!8613) b!9622))

(declare-fun m!6087 () Bool)

(assert (=> d!925 m!6087))

(declare-fun m!6089 () Bool)

(assert (=> b!9622 m!6089))

(assert (=> b!9507 d!925))

(declare-fun b!9631 () Bool)

(declare-fun e!5514 () Bool)

(declare-fun e!5515 () Bool)

(assert (=> b!9631 (= e!5514 e!5515)))

(declare-fun lt!2185 () (_ BitVec 64))

(assert (=> b!9631 (= lt!2185 (select (arr!399 _keys!1806) lt!2148))))

(declare-fun lt!2187 () Unit!205)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!829 (_ BitVec 64) (_ BitVec 32)) Unit!205)

(assert (=> b!9631 (= lt!2187 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!2185 lt!2148))))

(assert (=> b!9631 (arrayContainsKey!0 _keys!1806 lt!2185 #b00000000000000000000000000000000)))

(declare-fun lt!2186 () Unit!205)

(assert (=> b!9631 (= lt!2186 lt!2187)))

(declare-fun res!8619 () Bool)

(assert (=> b!9631 (= res!8619 (= (seekEntryOrOpen!0 (select (arr!399 _keys!1806) lt!2148) _keys!1806 mask!2250) (Found!36 lt!2148)))))

(assert (=> b!9631 (=> (not res!8619) (not e!5515))))

(declare-fun b!9632 () Bool)

(declare-fun call!267 () Bool)

(assert (=> b!9632 (= e!5514 call!267)))

(declare-fun bm!264 () Bool)

(assert (=> bm!264 (= call!267 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!2148 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!9633 () Bool)

(declare-fun e!5516 () Bool)

(assert (=> b!9633 (= e!5516 e!5514)))

(declare-fun c!768 () Bool)

(assert (=> b!9633 (= c!768 (validKeyInArray!0 (select (arr!399 _keys!1806) lt!2148)))))

(declare-fun d!927 () Bool)

(declare-fun res!8618 () Bool)

(assert (=> d!927 (=> res!8618 e!5516)))

(assert (=> d!927 (= res!8618 (bvsge lt!2148 (size!461 _keys!1806)))))

(assert (=> d!927 (= (arrayForallSeekEntryOrOpenFound!0 lt!2148 _keys!1806 mask!2250) e!5516)))

(declare-fun b!9634 () Bool)

(assert (=> b!9634 (= e!5515 call!267)))

(assert (= (and d!927 (not res!8618)) b!9633))

(assert (= (and b!9633 c!768) b!9631))

(assert (= (and b!9633 (not c!768)) b!9632))

(assert (= (and b!9631 res!8619) b!9634))

(assert (= (or b!9634 b!9632) bm!264))

(declare-fun m!6091 () Bool)

(assert (=> b!9631 m!6091))

(declare-fun m!6093 () Bool)

(assert (=> b!9631 m!6093))

(declare-fun m!6095 () Bool)

(assert (=> b!9631 m!6095))

(assert (=> b!9631 m!6091))

(declare-fun m!6097 () Bool)

(assert (=> b!9631 m!6097))

(declare-fun m!6099 () Bool)

(assert (=> bm!264 m!6099))

(assert (=> b!9633 m!6091))

(assert (=> b!9633 m!6091))

(declare-fun m!6101 () Bool)

(assert (=> b!9633 m!6101))

(assert (=> b!9517 d!927))

(declare-fun d!929 () Bool)

(assert (=> d!929 (arrayForallSeekEntryOrOpenFound!0 lt!2148 _keys!1806 mask!2250)))

(declare-fun lt!2190 () Unit!205)

(declare-fun choose!38 (array!829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!205)

(assert (=> d!929 (= lt!2190 (choose!38 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2148))))

(assert (=> d!929 (validMask!0 mask!2250)))

(assert (=> d!929 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2148) lt!2190)))

(declare-fun bs!332 () Bool)

(assert (= bs!332 d!929))

(assert (=> bs!332 m!6009))

(declare-fun m!6103 () Bool)

(assert (=> bs!332 m!6103))

(assert (=> bs!332 m!5979))

(assert (=> b!9517 d!929))

(declare-fun d!931 () Bool)

(declare-fun lt!2193 () (_ BitVec 32))

(assert (=> d!931 (and (or (bvslt lt!2193 #b00000000000000000000000000000000) (bvsge lt!2193 (size!461 _keys!1806)) (and (bvsge lt!2193 #b00000000000000000000000000000000) (bvslt lt!2193 (size!461 _keys!1806)))) (bvsge lt!2193 #b00000000000000000000000000000000) (bvslt lt!2193 (size!461 _keys!1806)) (= (select (arr!399 _keys!1806) lt!2193) k0!1278))))

(declare-fun e!5519 () (_ BitVec 32))

(assert (=> d!931 (= lt!2193 e!5519)))

(declare-fun c!771 () Bool)

(assert (=> d!931 (= c!771 (= (select (arr!399 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!461 _keys!1806)) (bvslt (size!461 _keys!1806) #b01111111111111111111111111111111))))

(assert (=> d!931 (= (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) lt!2193)))

(declare-fun b!9639 () Bool)

(assert (=> b!9639 (= e!5519 #b00000000000000000000000000000000)))

(declare-fun b!9640 () Bool)

(assert (=> b!9640 (= e!5519 (arrayScanForKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!931 c!771) b!9639))

(assert (= (and d!931 (not c!771)) b!9640))

(declare-fun m!6105 () Bool)

(assert (=> d!931 m!6105))

(assert (=> d!931 m!6087))

(declare-fun m!6107 () Bool)

(assert (=> b!9640 m!6107))

(assert (=> b!9517 d!931))

(declare-fun b!9651 () Bool)

(declare-fun e!5531 () Bool)

(declare-fun e!5530 () Bool)

(assert (=> b!9651 (= e!5531 e!5530)))

(declare-fun c!774 () Bool)

(assert (=> b!9651 (= c!774 (validKeyInArray!0 (select (arr!399 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!267 () Bool)

(declare-fun call!270 () Bool)

(assert (=> bm!267 (= call!270 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!774 (Cons!278 (select (arr!399 _keys!1806) #b00000000000000000000000000000000) Nil!279) Nil!279)))))

(declare-fun b!9652 () Bool)

(assert (=> b!9652 (= e!5530 call!270)))

(declare-fun d!933 () Bool)

(declare-fun res!8626 () Bool)

(declare-fun e!5528 () Bool)

(assert (=> d!933 (=> res!8626 e!5528)))

(assert (=> d!933 (= res!8626 (bvsge #b00000000000000000000000000000000 (size!461 _keys!1806)))))

(assert (=> d!933 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!279) e!5528)))

(declare-fun b!9653 () Bool)

(assert (=> b!9653 (= e!5528 e!5531)))

(declare-fun res!8628 () Bool)

(assert (=> b!9653 (=> (not res!8628) (not e!5531))))

(declare-fun e!5529 () Bool)

(assert (=> b!9653 (= res!8628 (not e!5529))))

(declare-fun res!8627 () Bool)

(assert (=> b!9653 (=> (not res!8627) (not e!5529))))

(assert (=> b!9653 (= res!8627 (validKeyInArray!0 (select (arr!399 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9654 () Bool)

(declare-fun contains!133 (List!282 (_ BitVec 64)) Bool)

(assert (=> b!9654 (= e!5529 (contains!133 Nil!279 (select (arr!399 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9655 () Bool)

(assert (=> b!9655 (= e!5530 call!270)))

(assert (= (and d!933 (not res!8626)) b!9653))

(assert (= (and b!9653 res!8627) b!9654))

(assert (= (and b!9653 res!8628) b!9651))

(assert (= (and b!9651 c!774) b!9652))

(assert (= (and b!9651 (not c!774)) b!9655))

(assert (= (or b!9652 b!9655) bm!267))

(assert (=> b!9651 m!6087))

(assert (=> b!9651 m!6087))

(declare-fun m!6109 () Bool)

(assert (=> b!9651 m!6109))

(assert (=> bm!267 m!6087))

(declare-fun m!6111 () Bool)

(assert (=> bm!267 m!6111))

(assert (=> b!9653 m!6087))

(assert (=> b!9653 m!6087))

(assert (=> b!9653 m!6109))

(assert (=> b!9654 m!6087))

(assert (=> b!9654 m!6087))

(declare-fun m!6113 () Bool)

(assert (=> b!9654 m!6113))

(assert (=> b!9519 d!933))

(declare-fun d!935 () Bool)

(assert (=> d!935 (= (inRange!0 (index!2264 lt!2145) mask!2250) (and (bvsge (index!2264 lt!2145) #b00000000000000000000000000000000) (bvslt (index!2264 lt!2145) (bvadd mask!2250 #b00000000000000000000000000000001))))))

(assert (=> b!9518 d!935))

(declare-fun b!9656 () Bool)

(declare-fun e!5532 () Bool)

(declare-fun e!5533 () Bool)

(assert (=> b!9656 (= e!5532 e!5533)))

(declare-fun lt!2194 () (_ BitVec 64))

(assert (=> b!9656 (= lt!2194 (select (arr!399 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2196 () Unit!205)

(assert (=> b!9656 (= lt!2196 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!2194 #b00000000000000000000000000000000))))

(assert (=> b!9656 (arrayContainsKey!0 _keys!1806 lt!2194 #b00000000000000000000000000000000)))

(declare-fun lt!2195 () Unit!205)

(assert (=> b!9656 (= lt!2195 lt!2196)))

(declare-fun res!8630 () Bool)

(assert (=> b!9656 (= res!8630 (= (seekEntryOrOpen!0 (select (arr!399 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!36 #b00000000000000000000000000000000)))))

(assert (=> b!9656 (=> (not res!8630) (not e!5533))))

(declare-fun b!9657 () Bool)

(declare-fun call!271 () Bool)

(assert (=> b!9657 (= e!5532 call!271)))

(declare-fun bm!268 () Bool)

(assert (=> bm!268 (= call!271 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!9658 () Bool)

(declare-fun e!5534 () Bool)

(assert (=> b!9658 (= e!5534 e!5532)))

(declare-fun c!775 () Bool)

(assert (=> b!9658 (= c!775 (validKeyInArray!0 (select (arr!399 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!937 () Bool)

(declare-fun res!8629 () Bool)

(assert (=> d!937 (=> res!8629 e!5534)))

(assert (=> d!937 (= res!8629 (bvsge #b00000000000000000000000000000000 (size!461 _keys!1806)))))

(assert (=> d!937 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!5534)))

(declare-fun b!9659 () Bool)

(assert (=> b!9659 (= e!5533 call!271)))

(assert (= (and d!937 (not res!8629)) b!9658))

(assert (= (and b!9658 c!775) b!9656))

(assert (= (and b!9658 (not c!775)) b!9657))

(assert (= (and b!9656 res!8630) b!9659))

(assert (= (or b!9659 b!9657) bm!268))

(assert (=> b!9656 m!6087))

(declare-fun m!6115 () Bool)

(assert (=> b!9656 m!6115))

(declare-fun m!6117 () Bool)

(assert (=> b!9656 m!6117))

(assert (=> b!9656 m!6087))

(declare-fun m!6119 () Bool)

(assert (=> b!9656 m!6119))

(declare-fun m!6121 () Bool)

(assert (=> bm!268 m!6121))

(assert (=> b!9658 m!6087))

(assert (=> b!9658 m!6087))

(assert (=> b!9658 m!6109))

(assert (=> b!9520 d!937))

(declare-fun d!939 () Bool)

(declare-fun e!5540 () Bool)

(assert (=> d!939 e!5540))

(declare-fun res!8633 () Bool)

(assert (=> d!939 (=> res!8633 e!5540)))

(declare-fun lt!2207 () Bool)

(assert (=> d!939 (= res!8633 (not lt!2207))))

(declare-fun lt!2206 () Bool)

(assert (=> d!939 (= lt!2207 lt!2206)))

(declare-fun lt!2208 () Unit!205)

(declare-fun e!5539 () Unit!205)

(assert (=> d!939 (= lt!2208 e!5539)))

(declare-fun c!778 () Bool)

(assert (=> d!939 (= c!778 lt!2206)))

(declare-fun containsKey!9 (List!281 (_ BitVec 64)) Bool)

(assert (=> d!939 (= lt!2206 (containsKey!9 (toList!152 (getCurrentListMap!111 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!939 (= (contains!130 (getCurrentListMap!111 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!2207)))

(declare-fun b!9666 () Bool)

(declare-fun lt!2205 () Unit!205)

(assert (=> b!9666 (= e!5539 lt!2205)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!9 (List!281 (_ BitVec 64)) Unit!205)

(assert (=> b!9666 (= lt!2205 (lemmaContainsKeyImpliesGetValueByKeyDefined!9 (toList!152 (getCurrentListMap!111 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!21 0))(
  ( (Some!20 (v!1332 V!787)) (None!19) )
))
(declare-fun isDefined!10 (Option!21) Bool)

(declare-fun getValueByKey!15 (List!281 (_ BitVec 64)) Option!21)

(assert (=> b!9666 (isDefined!10 (getValueByKey!15 (toList!152 (getCurrentListMap!111 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!9667 () Bool)

(declare-fun Unit!211 () Unit!205)

(assert (=> b!9667 (= e!5539 Unit!211)))

(declare-fun b!9668 () Bool)

(assert (=> b!9668 (= e!5540 (isDefined!10 (getValueByKey!15 (toList!152 (getCurrentListMap!111 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!939 c!778) b!9666))

(assert (= (and d!939 (not c!778)) b!9667))

(assert (= (and d!939 (not res!8633)) b!9668))

(declare-fun m!6123 () Bool)

(assert (=> d!939 m!6123))

(declare-fun m!6125 () Bool)

(assert (=> b!9666 m!6125))

(declare-fun m!6127 () Bool)

(assert (=> b!9666 m!6127))

(assert (=> b!9666 m!6127))

(declare-fun m!6129 () Bool)

(assert (=> b!9666 m!6129))

(assert (=> b!9668 m!6127))

(assert (=> b!9668 m!6127))

(assert (=> b!9668 m!6129))

(assert (=> b!9511 d!939))

(declare-fun b!9711 () Bool)

(declare-fun e!5579 () Bool)

(declare-fun e!5570 () Bool)

(assert (=> b!9711 (= e!5579 e!5570)))

(declare-fun c!794 () Bool)

(assert (=> b!9711 (= c!794 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!9712 () Bool)

(declare-fun e!5568 () Bool)

(declare-fun e!5569 () Bool)

(assert (=> b!9712 (= e!5568 e!5569)))

(declare-fun res!8654 () Bool)

(assert (=> b!9712 (=> (not res!8654) (not e!5569))))

(declare-fun lt!2260 () ListLongMap!273)

(assert (=> b!9712 (= res!8654 (contains!130 lt!2260 (select (arr!399 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!9712 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!461 _keys!1806)))))

(declare-fun b!9713 () Bool)

(declare-fun e!5572 () Bool)

(assert (=> b!9713 (= e!5572 (validKeyInArray!0 (select (arr!399 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!283 () Bool)

(declare-fun call!287 () ListLongMap!273)

(declare-fun call!290 () ListLongMap!273)

(assert (=> bm!283 (= call!287 call!290)))

(declare-fun b!9714 () Bool)

(declare-fun apply!25 (ListLongMap!273 (_ BitVec 64)) V!787)

(declare-fun get!179 (ValueCell!212 V!787) V!787)

(declare-fun dynLambda!47 (Int (_ BitVec 64)) V!787)

(assert (=> b!9714 (= e!5569 (= (apply!25 lt!2260 (select (arr!399 _keys!1806) #b00000000000000000000000000000000)) (get!179 (select (arr!400 _values!1492) #b00000000000000000000000000000000) (dynLambda!47 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!462 _values!1492)))))

(assert (=> b!9714 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!461 _keys!1806)))))

(declare-fun b!9715 () Bool)

(declare-fun e!5574 () Unit!205)

(declare-fun Unit!212 () Unit!205)

(assert (=> b!9715 (= e!5574 Unit!212)))

(declare-fun b!9716 () Bool)

(declare-fun e!5575 () ListLongMap!273)

(declare-fun call!292 () ListLongMap!273)

(assert (=> b!9716 (= e!5575 call!292)))

(declare-fun bm!284 () Bool)

(declare-fun call!288 () Bool)

(assert (=> bm!284 (= call!288 (contains!130 lt!2260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!285 () Bool)

(declare-fun call!289 () Bool)

(assert (=> bm!285 (= call!289 (contains!130 lt!2260 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!9717 () Bool)

(declare-fun e!5577 () Bool)

(declare-fun e!5576 () Bool)

(assert (=> b!9717 (= e!5577 e!5576)))

(declare-fun res!8653 () Bool)

(assert (=> b!9717 (= res!8653 call!288)))

(assert (=> b!9717 (=> (not res!8653) (not e!5576))))

(declare-fun b!9719 () Bool)

(assert (=> b!9719 (= e!5577 (not call!288))))

(declare-fun b!9720 () Bool)

(declare-fun res!8659 () Bool)

(assert (=> b!9720 (=> (not res!8659) (not e!5579))))

(assert (=> b!9720 (= res!8659 e!5577)))

(declare-fun c!792 () Bool)

(assert (=> b!9720 (= c!792 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!286 () Bool)

(declare-fun c!791 () Bool)

(declare-fun c!793 () Bool)

(declare-fun call!291 () ListLongMap!273)

(declare-fun +!12 (ListLongMap!273 tuple2!268) ListLongMap!273)

(assert (=> bm!286 (= call!291 (+!12 (ite c!793 call!290 (ite c!791 call!287 call!292)) (ite (or c!793 c!791) (tuple2!269 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!269 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!9721 () Bool)

(declare-fun lt!2253 () Unit!205)

(assert (=> b!9721 (= e!5574 lt!2253)))

(declare-fun lt!2270 () ListLongMap!273)

(declare-fun getCurrentListMapNoExtraKeys!9 (array!829 array!831 (_ BitVec 32) (_ BitVec 32) V!787 V!787 (_ BitVec 32) Int) ListLongMap!273)

(assert (=> b!9721 (= lt!2270 (getCurrentListMapNoExtraKeys!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2272 () (_ BitVec 64))

(assert (=> b!9721 (= lt!2272 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2257 () (_ BitVec 64))

(assert (=> b!9721 (= lt!2257 (select (arr!399 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2265 () Unit!205)

(declare-fun addStillContains!10 (ListLongMap!273 (_ BitVec 64) V!787 (_ BitVec 64)) Unit!205)

(assert (=> b!9721 (= lt!2265 (addStillContains!10 lt!2270 lt!2272 zeroValue!1434 lt!2257))))

(assert (=> b!9721 (contains!130 (+!12 lt!2270 (tuple2!269 lt!2272 zeroValue!1434)) lt!2257)))

(declare-fun lt!2256 () Unit!205)

(assert (=> b!9721 (= lt!2256 lt!2265)))

(declare-fun lt!2261 () ListLongMap!273)

(assert (=> b!9721 (= lt!2261 (getCurrentListMapNoExtraKeys!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2264 () (_ BitVec 64))

(assert (=> b!9721 (= lt!2264 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2267 () (_ BitVec 64))

(assert (=> b!9721 (= lt!2267 (select (arr!399 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2274 () Unit!205)

(declare-fun addApplyDifferent!10 (ListLongMap!273 (_ BitVec 64) V!787 (_ BitVec 64)) Unit!205)

(assert (=> b!9721 (= lt!2274 (addApplyDifferent!10 lt!2261 lt!2264 minValue!1434 lt!2267))))

(assert (=> b!9721 (= (apply!25 (+!12 lt!2261 (tuple2!269 lt!2264 minValue!1434)) lt!2267) (apply!25 lt!2261 lt!2267))))

(declare-fun lt!2268 () Unit!205)

(assert (=> b!9721 (= lt!2268 lt!2274)))

(declare-fun lt!2259 () ListLongMap!273)

(assert (=> b!9721 (= lt!2259 (getCurrentListMapNoExtraKeys!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2269 () (_ BitVec 64))

(assert (=> b!9721 (= lt!2269 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2262 () (_ BitVec 64))

(assert (=> b!9721 (= lt!2262 (select (arr!399 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2254 () Unit!205)

(assert (=> b!9721 (= lt!2254 (addApplyDifferent!10 lt!2259 lt!2269 zeroValue!1434 lt!2262))))

(assert (=> b!9721 (= (apply!25 (+!12 lt!2259 (tuple2!269 lt!2269 zeroValue!1434)) lt!2262) (apply!25 lt!2259 lt!2262))))

(declare-fun lt!2273 () Unit!205)

(assert (=> b!9721 (= lt!2273 lt!2254)))

(declare-fun lt!2255 () ListLongMap!273)

(assert (=> b!9721 (= lt!2255 (getCurrentListMapNoExtraKeys!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2271 () (_ BitVec 64))

(assert (=> b!9721 (= lt!2271 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2258 () (_ BitVec 64))

(assert (=> b!9721 (= lt!2258 (select (arr!399 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!9721 (= lt!2253 (addApplyDifferent!10 lt!2255 lt!2271 minValue!1434 lt!2258))))

(assert (=> b!9721 (= (apply!25 (+!12 lt!2255 (tuple2!269 lt!2271 minValue!1434)) lt!2258) (apply!25 lt!2255 lt!2258))))

(declare-fun b!9722 () Bool)

(assert (=> b!9722 (= e!5570 (not call!289))))

(declare-fun b!9723 () Bool)

(declare-fun e!5578 () Bool)

(assert (=> b!9723 (= e!5570 e!5578)))

(declare-fun res!8652 () Bool)

(assert (=> b!9723 (= res!8652 call!289)))

(assert (=> b!9723 (=> (not res!8652) (not e!5578))))

(declare-fun bm!287 () Bool)

(assert (=> bm!287 (= call!290 (getCurrentListMapNoExtraKeys!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun bm!288 () Bool)

(assert (=> bm!288 (= call!292 call!287)))

(declare-fun b!9724 () Bool)

(declare-fun e!5573 () ListLongMap!273)

(assert (=> b!9724 (= e!5573 (+!12 call!291 (tuple2!269 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!9725 () Bool)

(declare-fun res!8660 () Bool)

(assert (=> b!9725 (=> (not res!8660) (not e!5579))))

(assert (=> b!9725 (= res!8660 e!5568)))

(declare-fun res!8657 () Bool)

(assert (=> b!9725 (=> res!8657 e!5568)))

(declare-fun e!5567 () Bool)

(assert (=> b!9725 (= res!8657 (not e!5567))))

(declare-fun res!8658 () Bool)

(assert (=> b!9725 (=> (not res!8658) (not e!5567))))

(assert (=> b!9725 (= res!8658 (bvslt #b00000000000000000000000000000000 (size!461 _keys!1806)))))

(declare-fun b!9726 () Bool)

(declare-fun e!5571 () ListLongMap!273)

(assert (=> b!9726 (= e!5573 e!5571)))

(assert (=> b!9726 (= c!791 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!9727 () Bool)

(declare-fun call!286 () ListLongMap!273)

(assert (=> b!9727 (= e!5571 call!286)))

(declare-fun d!941 () Bool)

(assert (=> d!941 e!5579))

(declare-fun res!8655 () Bool)

(assert (=> d!941 (=> (not res!8655) (not e!5579))))

(assert (=> d!941 (= res!8655 (or (bvsge #b00000000000000000000000000000000 (size!461 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!461 _keys!1806)))))))

(declare-fun lt!2263 () ListLongMap!273)

(assert (=> d!941 (= lt!2260 lt!2263)))

(declare-fun lt!2266 () Unit!205)

(assert (=> d!941 (= lt!2266 e!5574)))

(declare-fun c!795 () Bool)

(assert (=> d!941 (= c!795 e!5572)))

(declare-fun res!8656 () Bool)

(assert (=> d!941 (=> (not res!8656) (not e!5572))))

(assert (=> d!941 (= res!8656 (bvslt #b00000000000000000000000000000000 (size!461 _keys!1806)))))

(assert (=> d!941 (= lt!2263 e!5573)))

(assert (=> d!941 (= c!793 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!941 (validMask!0 mask!2250)))

(assert (=> d!941 (= (getCurrentListMap!111 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!2260)))

(declare-fun b!9718 () Bool)

(assert (=> b!9718 (= e!5576 (= (apply!25 lt!2260 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun b!9728 () Bool)

(assert (=> b!9728 (= e!5567 (validKeyInArray!0 (select (arr!399 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9729 () Bool)

(declare-fun c!796 () Bool)

(assert (=> b!9729 (= c!796 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!9729 (= e!5571 e!5575)))

(declare-fun b!9730 () Bool)

(assert (=> b!9730 (= e!5578 (= (apply!25 lt!2260 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun b!9731 () Bool)

(assert (=> b!9731 (= e!5575 call!286)))

(declare-fun bm!289 () Bool)

(assert (=> bm!289 (= call!286 call!291)))

(assert (= (and d!941 c!793) b!9724))

(assert (= (and d!941 (not c!793)) b!9726))

(assert (= (and b!9726 c!791) b!9727))

(assert (= (and b!9726 (not c!791)) b!9729))

(assert (= (and b!9729 c!796) b!9731))

(assert (= (and b!9729 (not c!796)) b!9716))

(assert (= (or b!9731 b!9716) bm!288))

(assert (= (or b!9727 bm!288) bm!283))

(assert (= (or b!9727 b!9731) bm!289))

(assert (= (or b!9724 bm!283) bm!287))

(assert (= (or b!9724 bm!289) bm!286))

(assert (= (and d!941 res!8656) b!9713))

(assert (= (and d!941 c!795) b!9721))

(assert (= (and d!941 (not c!795)) b!9715))

(assert (= (and d!941 res!8655) b!9725))

(assert (= (and b!9725 res!8658) b!9728))

(assert (= (and b!9725 (not res!8657)) b!9712))

(assert (= (and b!9712 res!8654) b!9714))

(assert (= (and b!9725 res!8660) b!9720))

(assert (= (and b!9720 c!792) b!9717))

(assert (= (and b!9720 (not c!792)) b!9719))

(assert (= (and b!9717 res!8653) b!9718))

(assert (= (or b!9717 b!9719) bm!284))

(assert (= (and b!9720 res!8659) b!9711))

(assert (= (and b!9711 c!794) b!9723))

(assert (= (and b!9711 (not c!794)) b!9722))

(assert (= (and b!9723 res!8652) b!9730))

(assert (= (or b!9723 b!9722) bm!285))

(declare-fun b_lambda!351 () Bool)

(assert (=> (not b_lambda!351) (not b!9714)))

(declare-fun t!2430 () Bool)

(declare-fun tb!143 () Bool)

(assert (=> (and start!1076 (= defaultEntry!1495 defaultEntry!1495) t!2430) tb!143))

(declare-fun result!231 () Bool)

(assert (=> tb!143 (= result!231 tp_is_empty!457)))

(assert (=> b!9714 t!2430))

(declare-fun b_and!539 () Bool)

(assert (= b_and!533 (and (=> t!2430 result!231) b_and!539)))

(declare-fun m!6131 () Bool)

(assert (=> b!9724 m!6131))

(declare-fun m!6133 () Bool)

(assert (=> bm!287 m!6133))

(declare-fun m!6135 () Bool)

(assert (=> b!9718 m!6135))

(declare-fun m!6137 () Bool)

(assert (=> b!9730 m!6137))

(declare-fun m!6139 () Bool)

(assert (=> bm!285 m!6139))

(declare-fun m!6141 () Bool)

(assert (=> b!9721 m!6141))

(declare-fun m!6143 () Bool)

(assert (=> b!9721 m!6143))

(declare-fun m!6145 () Bool)

(assert (=> b!9721 m!6145))

(declare-fun m!6147 () Bool)

(assert (=> b!9721 m!6147))

(declare-fun m!6149 () Bool)

(assert (=> b!9721 m!6149))

(declare-fun m!6151 () Bool)

(assert (=> b!9721 m!6151))

(declare-fun m!6153 () Bool)

(assert (=> b!9721 m!6153))

(declare-fun m!6155 () Bool)

(assert (=> b!9721 m!6155))

(declare-fun m!6157 () Bool)

(assert (=> b!9721 m!6157))

(declare-fun m!6159 () Bool)

(assert (=> b!9721 m!6159))

(declare-fun m!6161 () Bool)

(assert (=> b!9721 m!6161))

(declare-fun m!6163 () Bool)

(assert (=> b!9721 m!6163))

(declare-fun m!6165 () Bool)

(assert (=> b!9721 m!6165))

(assert (=> b!9721 m!6133))

(assert (=> b!9721 m!6147))

(assert (=> b!9721 m!6153))

(declare-fun m!6167 () Bool)

(assert (=> b!9721 m!6167))

(assert (=> b!9721 m!6163))

(assert (=> b!9721 m!6141))

(assert (=> b!9721 m!6087))

(declare-fun m!6169 () Bool)

(assert (=> b!9721 m!6169))

(declare-fun m!6171 () Bool)

(assert (=> bm!286 m!6171))

(assert (=> b!9714 m!6087))

(declare-fun m!6173 () Bool)

(assert (=> b!9714 m!6173))

(assert (=> b!9714 m!6087))

(declare-fun m!6175 () Bool)

(assert (=> b!9714 m!6175))

(declare-fun m!6177 () Bool)

(assert (=> b!9714 m!6177))

(declare-fun m!6179 () Bool)

(assert (=> b!9714 m!6179))

(assert (=> b!9714 m!6175))

(assert (=> b!9714 m!6177))

(assert (=> b!9713 m!6087))

(assert (=> b!9713 m!6087))

(assert (=> b!9713 m!6109))

(assert (=> b!9712 m!6087))

(assert (=> b!9712 m!6087))

(declare-fun m!6181 () Bool)

(assert (=> b!9712 m!6181))

(declare-fun m!6183 () Bool)

(assert (=> bm!284 m!6183))

(assert (=> d!941 m!5979))

(assert (=> b!9728 m!6087))

(assert (=> b!9728 m!6087))

(assert (=> b!9728 m!6109))

(assert (=> b!9511 d!941))

(assert (=> b!9510 d!925))

(declare-fun d!943 () Bool)

(declare-fun e!5582 () Bool)

(assert (=> d!943 e!5582))

(declare-fun c!799 () Bool)

(assert (=> d!943 (= c!799 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!2277 () Unit!205)

(declare-fun choose!142 (array!829 array!831 (_ BitVec 32) (_ BitVec 32) V!787 V!787 (_ BitVec 64) Int) Unit!205)

(assert (=> d!943 (= lt!2277 (choose!142 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!943 (validMask!0 mask!2250)))

(assert (=> d!943 (= (lemmaKeyInListMapIsInArray!79 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!2277)))

(declare-fun b!9738 () Bool)

(assert (=> b!9738 (= e!5582 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9739 () Bool)

(assert (=> b!9739 (= e!5582 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!943 c!799) b!9738))

(assert (= (and d!943 (not c!799)) b!9739))

(declare-fun m!6185 () Bool)

(assert (=> d!943 m!6185))

(assert (=> d!943 m!5979))

(assert (=> b!9738 m!5989))

(assert (=> b!9510 d!943))

(declare-fun d!945 () Bool)

(declare-fun lt!2286 () SeekEntryResult!36)

(assert (=> d!945 (and (or ((_ is Undefined!36) lt!2286) (not ((_ is Found!36) lt!2286)) (and (bvsge (index!2264 lt!2286) #b00000000000000000000000000000000) (bvslt (index!2264 lt!2286) (size!461 _keys!1806)))) (or ((_ is Undefined!36) lt!2286) ((_ is Found!36) lt!2286) (not ((_ is MissingZero!36) lt!2286)) (and (bvsge (index!2263 lt!2286) #b00000000000000000000000000000000) (bvslt (index!2263 lt!2286) (size!461 _keys!1806)))) (or ((_ is Undefined!36) lt!2286) ((_ is Found!36) lt!2286) ((_ is MissingZero!36) lt!2286) (not ((_ is MissingVacant!36) lt!2286)) (and (bvsge (index!2266 lt!2286) #b00000000000000000000000000000000) (bvslt (index!2266 lt!2286) (size!461 _keys!1806)))) (or ((_ is Undefined!36) lt!2286) (ite ((_ is Found!36) lt!2286) (= (select (arr!399 _keys!1806) (index!2264 lt!2286)) k0!1278) (ite ((_ is MissingZero!36) lt!2286) (= (select (arr!399 _keys!1806) (index!2263 lt!2286)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!36) lt!2286) (= (select (arr!399 _keys!1806) (index!2266 lt!2286)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!5589 () SeekEntryResult!36)

(assert (=> d!945 (= lt!2286 e!5589)))

(declare-fun c!806 () Bool)

(declare-fun lt!2284 () SeekEntryResult!36)

(assert (=> d!945 (= c!806 (and ((_ is Intermediate!36) lt!2284) (undefined!848 lt!2284)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!829 (_ BitVec 32)) SeekEntryResult!36)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!945 (= lt!2284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1278 mask!2250) k0!1278 _keys!1806 mask!2250))))

(assert (=> d!945 (validMask!0 mask!2250)))

(assert (=> d!945 (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) lt!2286)))

(declare-fun b!9752 () Bool)

(assert (=> b!9752 (= e!5589 Undefined!36)))

(declare-fun b!9753 () Bool)

(declare-fun e!5590 () SeekEntryResult!36)

(assert (=> b!9753 (= e!5590 (MissingZero!36 (index!2265 lt!2284)))))

(declare-fun b!9754 () Bool)

(declare-fun e!5591 () SeekEntryResult!36)

(assert (=> b!9754 (= e!5591 (Found!36 (index!2265 lt!2284)))))

(declare-fun b!9755 () Bool)

(declare-fun c!807 () Bool)

(declare-fun lt!2285 () (_ BitVec 64))

(assert (=> b!9755 (= c!807 (= lt!2285 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!9755 (= e!5591 e!5590)))

(declare-fun b!9756 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!829 (_ BitVec 32)) SeekEntryResult!36)

(assert (=> b!9756 (= e!5590 (seekKeyOrZeroReturnVacant!0 (x!2798 lt!2284) (index!2265 lt!2284) (index!2265 lt!2284) k0!1278 _keys!1806 mask!2250))))

(declare-fun b!9757 () Bool)

(assert (=> b!9757 (= e!5589 e!5591)))

(assert (=> b!9757 (= lt!2285 (select (arr!399 _keys!1806) (index!2265 lt!2284)))))

(declare-fun c!808 () Bool)

(assert (=> b!9757 (= c!808 (= lt!2285 k0!1278))))

(assert (= (and d!945 c!806) b!9752))

(assert (= (and d!945 (not c!806)) b!9757))

(assert (= (and b!9757 c!808) b!9754))

(assert (= (and b!9757 (not c!808)) b!9755))

(assert (= (and b!9755 c!807) b!9753))

(assert (= (and b!9755 (not c!807)) b!9756))

(declare-fun m!6187 () Bool)

(assert (=> d!945 m!6187))

(declare-fun m!6189 () Bool)

(assert (=> d!945 m!6189))

(declare-fun m!6191 () Bool)

(assert (=> d!945 m!6191))

(assert (=> d!945 m!5979))

(declare-fun m!6193 () Bool)

(assert (=> d!945 m!6193))

(assert (=> d!945 m!6187))

(declare-fun m!6195 () Bool)

(assert (=> d!945 m!6195))

(declare-fun m!6197 () Bool)

(assert (=> b!9756 m!6197))

(declare-fun m!6199 () Bool)

(assert (=> b!9757 m!6199))

(assert (=> b!9512 d!945))

(declare-fun d!947 () Bool)

(assert (=> d!947 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!1076 d!947))

(declare-fun d!949 () Bool)

(assert (=> d!949 (= (array_inv!297 _values!1492) (bvsge (size!462 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!1076 d!949))

(declare-fun d!951 () Bool)

(assert (=> d!951 (= (array_inv!298 _keys!1806) (bvsge (size!461 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!1076 d!951))

(declare-fun d!953 () Bool)

(assert (=> d!953 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9515 d!953))

(declare-fun b!9770 () Bool)

(declare-fun e!5600 () SeekEntryResult!36)

(declare-fun lt!2295 () SeekEntryResult!36)

(assert (=> b!9770 (= e!5600 (MissingZero!36 (index!2265 lt!2295)))))

(declare-fun b!9771 () Bool)

(declare-fun e!5598 () SeekEntryResult!36)

(declare-fun e!5599 () SeekEntryResult!36)

(assert (=> b!9771 (= e!5598 e!5599)))

(declare-fun lt!2297 () (_ BitVec 64))

(assert (=> b!9771 (= lt!2297 (select (arr!399 _keys!1806) (index!2265 lt!2295)))))

(declare-fun c!816 () Bool)

(assert (=> b!9771 (= c!816 (= lt!2297 k0!1278))))

(declare-fun b!9772 () Bool)

(assert (=> b!9772 (= e!5599 (Found!36 (index!2265 lt!2295)))))

(declare-fun d!955 () Bool)

(declare-fun lt!2298 () SeekEntryResult!36)

(assert (=> d!955 (and (or ((_ is MissingVacant!36) lt!2298) (not ((_ is Found!36) lt!2298)) (and (bvsge (index!2264 lt!2298) #b00000000000000000000000000000000) (bvslt (index!2264 lt!2298) (size!461 _keys!1806)))) (not ((_ is MissingVacant!36) lt!2298)) (or (not ((_ is Found!36) lt!2298)) (= (select (arr!399 _keys!1806) (index!2264 lt!2298)) k0!1278)))))

(assert (=> d!955 (= lt!2298 e!5598)))

(declare-fun c!815 () Bool)

(assert (=> d!955 (= c!815 (and ((_ is Intermediate!36) lt!2295) (undefined!848 lt!2295)))))

(assert (=> d!955 (= lt!2295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1278 mask!2250) k0!1278 _keys!1806 mask!2250))))

(assert (=> d!955 (validMask!0 mask!2250)))

(assert (=> d!955 (= (seekEntry!0 k0!1278 _keys!1806 mask!2250) lt!2298)))

(declare-fun b!9773 () Bool)

(declare-fun lt!2296 () SeekEntryResult!36)

(assert (=> b!9773 (= e!5600 (ite ((_ is MissingVacant!36) lt!2296) (MissingZero!36 (index!2266 lt!2296)) lt!2296))))

(assert (=> b!9773 (= lt!2296 (seekKeyOrZeroReturnVacant!0 (x!2798 lt!2295) (index!2265 lt!2295) (index!2265 lt!2295) k0!1278 _keys!1806 mask!2250))))

(declare-fun b!9774 () Bool)

(declare-fun c!817 () Bool)

(assert (=> b!9774 (= c!817 (= lt!2297 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!9774 (= e!5599 e!5600)))

(declare-fun b!9775 () Bool)

(assert (=> b!9775 (= e!5598 Undefined!36)))

(assert (= (and d!955 c!815) b!9775))

(assert (= (and d!955 (not c!815)) b!9771))

(assert (= (and b!9771 c!816) b!9772))

(assert (= (and b!9771 (not c!816)) b!9774))

(assert (= (and b!9774 c!817) b!9770))

(assert (= (and b!9774 (not c!817)) b!9773))

(declare-fun m!6201 () Bool)

(assert (=> b!9771 m!6201))

(declare-fun m!6203 () Bool)

(assert (=> d!955 m!6203))

(assert (=> d!955 m!6187))

(assert (=> d!955 m!6187))

(assert (=> d!955 m!6189))

(assert (=> d!955 m!5979))

(declare-fun m!6205 () Bool)

(assert (=> b!9773 m!6205))

(assert (=> b!9514 d!955))

(declare-fun d!957 () Bool)

(declare-fun lt!2304 () SeekEntryResult!36)

(assert (=> d!957 (and ((_ is Found!36) lt!2304) (= (index!2264 lt!2304) lt!2148))))

(assert (=> d!957 (= lt!2304 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun lt!2303 () Unit!205)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!829 (_ BitVec 32)) Unit!205)

(assert (=> d!957 (= lt!2303 (choose!0 k0!1278 lt!2148 _keys!1806 mask!2250))))

(assert (=> d!957 (validMask!0 mask!2250)))

(assert (=> d!957 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!2148 _keys!1806 mask!2250) lt!2303)))

(declare-fun bs!333 () Bool)

(assert (= bs!333 d!957))

(assert (=> bs!333 m!5985))

(declare-fun m!6207 () Bool)

(assert (=> bs!333 m!6207))

(assert (=> bs!333 m!5979))

(assert (=> b!9514 d!957))

(declare-fun b!9783 () Bool)

(declare-fun e!5606 () Bool)

(assert (=> b!9783 (= e!5606 tp_is_empty!457)))

(declare-fun mapNonEmpty!677 () Bool)

(declare-fun mapRes!677 () Bool)

(declare-fun tp!1394 () Bool)

(declare-fun e!5605 () Bool)

(assert (=> mapNonEmpty!677 (= mapRes!677 (and tp!1394 e!5605))))

(declare-fun mapValue!677 () ValueCell!212)

(declare-fun mapRest!677 () (Array (_ BitVec 32) ValueCell!212))

(declare-fun mapKey!677 () (_ BitVec 32))

(assert (=> mapNonEmpty!677 (= mapRest!668 (store mapRest!677 mapKey!677 mapValue!677))))

(declare-fun mapIsEmpty!677 () Bool)

(assert (=> mapIsEmpty!677 mapRes!677))

(declare-fun b!9782 () Bool)

(assert (=> b!9782 (= e!5605 tp_is_empty!457)))

(declare-fun condMapEmpty!677 () Bool)

(declare-fun mapDefault!677 () ValueCell!212)

(assert (=> mapNonEmpty!668 (= condMapEmpty!677 (= mapRest!668 ((as const (Array (_ BitVec 32) ValueCell!212)) mapDefault!677)))))

(assert (=> mapNonEmpty!668 (= tp!1378 (and e!5606 mapRes!677))))

(assert (= (and mapNonEmpty!668 condMapEmpty!677) mapIsEmpty!677))

(assert (= (and mapNonEmpty!668 (not condMapEmpty!677)) mapNonEmpty!677))

(assert (= (and mapNonEmpty!677 ((_ is ValueCellFull!212) mapValue!677)) b!9782))

(assert (= (and mapNonEmpty!668 ((_ is ValueCellFull!212) mapDefault!677)) b!9783))

(declare-fun m!6209 () Bool)

(assert (=> mapNonEmpty!677 m!6209))

(declare-fun b_lambda!353 () Bool)

(assert (= b_lambda!351 (or (and start!1076 b_free!379) b_lambda!353)))

(check-sat (not b!9713) (not d!945) (not bm!268) (not b!9712) (not bm!284) (not b!9730) (not d!955) (not d!941) (not b!9773) (not b!9651) (not b!9658) tp_is_empty!457 (not b!9756) (not b!9653) (not d!939) (not mapNonEmpty!677) (not bm!287) (not b!9654) (not b!9721) (not b!9656) (not b!9738) (not b_next!379) (not bm!285) (not b!9718) (not b!9633) (not b!9668) (not b!9714) (not b!9666) (not b!9640) (not b!9622) (not b!9724) b_and!539 (not bm!267) (not bm!264) (not b_lambda!353) (not b!9631) (not d!957) (not d!943) (not bm!286) (not b!9728) (not d!929))
(check-sat b_and!539 (not b_next!379))
