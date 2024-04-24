; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84980 () Bool)

(assert start!84980)

(declare-fun res!663113 () Bool)

(declare-fun e!559754 () Bool)

(assert (=> start!84980 (=> (not res!663113) (not e!559754))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84980 (= res!663113 (validMask!0 mask!2471))))

(assert (=> start!84980 e!559754))

(assert (=> start!84980 true))

(declare-datatypes ((V!36089 0))(
  ( (V!36090 (val!11715 Int)) )
))
(declare-datatypes ((ValueCell!11183 0))(
  ( (ValueCellFull!11183 (v!14288 V!36089)) (EmptyCell!11183) )
))
(declare-datatypes ((array!62670 0))(
  ( (array!62671 (arr!30179 (Array (_ BitVec 32) ValueCell!11183)) (size!30659 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62670)

(declare-fun e!559752 () Bool)

(declare-fun array_inv!23333 (array!62670) Bool)

(assert (=> start!84980 (and (array_inv!23333 _values!1551) e!559752)))

(declare-datatypes ((array!62672 0))(
  ( (array!62673 (arr!30180 (Array (_ BitVec 32) (_ BitVec 64))) (size!30660 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62672)

(declare-fun array_inv!23334 (array!62672) Bool)

(assert (=> start!84980 (array_inv!23334 _keys!1945)))

(declare-fun b!992396 () Bool)

(declare-fun res!663112 () Bool)

(assert (=> b!992396 (=> (not res!663112) (not e!559754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62672 (_ BitVec 32)) Bool)

(assert (=> b!992396 (= res!663112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!992397 () Bool)

(declare-fun res!663114 () Bool)

(assert (=> b!992397 (=> (not res!663114) (not e!559754))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!992397 (= res!663114 (and (= (size!30659 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30660 _keys!1945) (size!30659 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!37053 () Bool)

(declare-fun mapRes!37053 () Bool)

(assert (=> mapIsEmpty!37053 mapRes!37053))

(declare-fun b!992398 () Bool)

(declare-fun e!559755 () Bool)

(declare-fun tp_is_empty!23329 () Bool)

(assert (=> b!992398 (= e!559755 tp_is_empty!23329)))

(declare-fun b!992399 () Bool)

(assert (=> b!992399 (= e!559754 (bvsgt #b00000000000000000000000000000000 (size!30660 _keys!1945)))))

(declare-fun b!992400 () Bool)

(declare-fun e!559756 () Bool)

(assert (=> b!992400 (= e!559752 (and e!559756 mapRes!37053))))

(declare-fun condMapEmpty!37053 () Bool)

(declare-fun mapDefault!37053 () ValueCell!11183)

(assert (=> b!992400 (= condMapEmpty!37053 (= (arr!30179 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11183)) mapDefault!37053)))))

(declare-fun mapNonEmpty!37053 () Bool)

(declare-fun tp!70125 () Bool)

(assert (=> mapNonEmpty!37053 (= mapRes!37053 (and tp!70125 e!559755))))

(declare-fun mapValue!37053 () ValueCell!11183)

(declare-fun mapKey!37053 () (_ BitVec 32))

(declare-fun mapRest!37053 () (Array (_ BitVec 32) ValueCell!11183))

(assert (=> mapNonEmpty!37053 (= (arr!30179 _values!1551) (store mapRest!37053 mapKey!37053 mapValue!37053))))

(declare-fun b!992401 () Bool)

(assert (=> b!992401 (= e!559756 tp_is_empty!23329)))

(assert (= (and start!84980 res!663113) b!992397))

(assert (= (and b!992397 res!663114) b!992396))

(assert (= (and b!992396 res!663112) b!992399))

(assert (= (and b!992400 condMapEmpty!37053) mapIsEmpty!37053))

(assert (= (and b!992400 (not condMapEmpty!37053)) mapNonEmpty!37053))

(get-info :version)

(assert (= (and mapNonEmpty!37053 ((_ is ValueCellFull!11183) mapValue!37053)) b!992398))

(assert (= (and b!992400 ((_ is ValueCellFull!11183) mapDefault!37053)) b!992401))

(assert (= start!84980 b!992400))

(declare-fun m!920717 () Bool)

(assert (=> start!84980 m!920717))

(declare-fun m!920719 () Bool)

(assert (=> start!84980 m!920719))

(declare-fun m!920721 () Bool)

(assert (=> start!84980 m!920721))

(declare-fun m!920723 () Bool)

(assert (=> b!992396 m!920723))

(declare-fun m!920725 () Bool)

(assert (=> mapNonEmpty!37053 m!920725))

(check-sat (not b!992396) (not start!84980) (not mapNonEmpty!37053) tp_is_empty!23329)
(check-sat)
(get-model)

(declare-fun b!992446 () Bool)

(declare-fun e!559795 () Bool)

(declare-fun e!559793 () Bool)

(assert (=> b!992446 (= e!559795 e!559793)))

(declare-fun lt!440352 () (_ BitVec 64))

(assert (=> b!992446 (= lt!440352 (select (arr!30180 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32883 0))(
  ( (Unit!32884) )
))
(declare-fun lt!440353 () Unit!32883)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62672 (_ BitVec 64) (_ BitVec 32)) Unit!32883)

(assert (=> b!992446 (= lt!440353 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!440352 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!992446 (arrayContainsKey!0 _keys!1945 lt!440352 #b00000000000000000000000000000000)))

(declare-fun lt!440351 () Unit!32883)

(assert (=> b!992446 (= lt!440351 lt!440353)))

(declare-fun res!663137 () Bool)

(declare-datatypes ((SeekEntryResult!9169 0))(
  ( (MissingZero!9169 (index!39047 (_ BitVec 32))) (Found!9169 (index!39048 (_ BitVec 32))) (Intermediate!9169 (undefined!9981 Bool) (index!39049 (_ BitVec 32)) (x!86234 (_ BitVec 32))) (Undefined!9169) (MissingVacant!9169 (index!39050 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62672 (_ BitVec 32)) SeekEntryResult!9169)

(assert (=> b!992446 (= res!663137 (= (seekEntryOrOpen!0 (select (arr!30180 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9169 #b00000000000000000000000000000000)))))

(assert (=> b!992446 (=> (not res!663137) (not e!559793))))

(declare-fun b!992447 () Bool)

(declare-fun call!42121 () Bool)

(assert (=> b!992447 (= e!559795 call!42121)))

(declare-fun d!118269 () Bool)

(declare-fun res!663138 () Bool)

(declare-fun e!559794 () Bool)

(assert (=> d!118269 (=> res!663138 e!559794)))

(assert (=> d!118269 (= res!663138 (bvsge #b00000000000000000000000000000000 (size!30660 _keys!1945)))))

(assert (=> d!118269 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559794)))

(declare-fun b!992448 () Bool)

(assert (=> b!992448 (= e!559794 e!559795)))

(declare-fun c!100909 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!992448 (= c!100909 (validKeyInArray!0 (select (arr!30180 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun bm!42118 () Bool)

(assert (=> bm!42118 (= call!42121 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun b!992449 () Bool)

(assert (=> b!992449 (= e!559793 call!42121)))

(assert (= (and d!118269 (not res!663138)) b!992448))

(assert (= (and b!992448 c!100909) b!992446))

(assert (= (and b!992448 (not c!100909)) b!992447))

(assert (= (and b!992446 res!663137) b!992449))

(assert (= (or b!992449 b!992447) bm!42118))

(declare-fun m!920747 () Bool)

(assert (=> b!992446 m!920747))

(declare-fun m!920749 () Bool)

(assert (=> b!992446 m!920749))

(declare-fun m!920751 () Bool)

(assert (=> b!992446 m!920751))

(assert (=> b!992446 m!920747))

(declare-fun m!920753 () Bool)

(assert (=> b!992446 m!920753))

(assert (=> b!992448 m!920747))

(assert (=> b!992448 m!920747))

(declare-fun m!920755 () Bool)

(assert (=> b!992448 m!920755))

(declare-fun m!920757 () Bool)

(assert (=> bm!42118 m!920757))

(assert (=> b!992396 d!118269))

(declare-fun d!118271 () Bool)

(assert (=> d!118271 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84980 d!118271))

(declare-fun d!118273 () Bool)

(assert (=> d!118273 (= (array_inv!23333 _values!1551) (bvsge (size!30659 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84980 d!118273))

(declare-fun d!118275 () Bool)

(assert (=> d!118275 (= (array_inv!23334 _keys!1945) (bvsge (size!30660 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84980 d!118275))

(declare-fun mapIsEmpty!37062 () Bool)

(declare-fun mapRes!37062 () Bool)

(assert (=> mapIsEmpty!37062 mapRes!37062))

(declare-fun b!992456 () Bool)

(declare-fun e!559801 () Bool)

(assert (=> b!992456 (= e!559801 tp_is_empty!23329)))

(declare-fun condMapEmpty!37062 () Bool)

(declare-fun mapDefault!37062 () ValueCell!11183)

(assert (=> mapNonEmpty!37053 (= condMapEmpty!37062 (= mapRest!37053 ((as const (Array (_ BitVec 32) ValueCell!11183)) mapDefault!37062)))))

(declare-fun e!559800 () Bool)

(assert (=> mapNonEmpty!37053 (= tp!70125 (and e!559800 mapRes!37062))))

(declare-fun mapNonEmpty!37062 () Bool)

(declare-fun tp!70134 () Bool)

(assert (=> mapNonEmpty!37062 (= mapRes!37062 (and tp!70134 e!559801))))

(declare-fun mapKey!37062 () (_ BitVec 32))

(declare-fun mapRest!37062 () (Array (_ BitVec 32) ValueCell!11183))

(declare-fun mapValue!37062 () ValueCell!11183)

(assert (=> mapNonEmpty!37062 (= mapRest!37053 (store mapRest!37062 mapKey!37062 mapValue!37062))))

(declare-fun b!992457 () Bool)

(assert (=> b!992457 (= e!559800 tp_is_empty!23329)))

(assert (= (and mapNonEmpty!37053 condMapEmpty!37062) mapIsEmpty!37062))

(assert (= (and mapNonEmpty!37053 (not condMapEmpty!37062)) mapNonEmpty!37062))

(assert (= (and mapNonEmpty!37062 ((_ is ValueCellFull!11183) mapValue!37062)) b!992456))

(assert (= (and mapNonEmpty!37053 ((_ is ValueCellFull!11183) mapDefault!37062)) b!992457))

(declare-fun m!920759 () Bool)

(assert (=> mapNonEmpty!37062 m!920759))

(check-sat (not mapNonEmpty!37062) (not b!992446) (not bm!42118) (not b!992448) tp_is_empty!23329)
(check-sat)
