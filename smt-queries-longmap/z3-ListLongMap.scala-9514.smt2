; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112916 () Bool)

(assert start!112916)

(declare-fun mapNonEmpty!57193 () Bool)

(declare-fun mapRes!57193 () Bool)

(declare-fun tp!108893 () Bool)

(declare-fun e!762348 () Bool)

(assert (=> mapNonEmpty!57193 (= mapRes!57193 (and tp!108893 e!762348))))

(declare-fun mapKey!57193 () (_ BitVec 32))

(declare-datatypes ((V!54433 0))(
  ( (V!54434 (val!18573 Int)) )
))
(declare-datatypes ((ValueCell!17600 0))(
  ( (ValueCellFull!17600 (v!21219 V!54433)) (EmptyCell!17600) )
))
(declare-fun mapValue!57193 () ValueCell!17600)

(declare-fun mapRest!57193 () (Array (_ BitVec 32) ValueCell!17600))

(declare-datatypes ((array!90801 0))(
  ( (array!90802 (arr!43860 (Array (_ BitVec 32) ValueCell!17600)) (size!44412 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90801)

(assert (=> mapNonEmpty!57193 (= (arr!43860 _values!1303) (store mapRest!57193 mapKey!57193 mapValue!57193))))

(declare-fun b!1338701 () Bool)

(declare-fun tp_is_empty!36997 () Bool)

(assert (=> b!1338701 (= e!762348 tp_is_empty!36997)))

(declare-fun b!1338702 () Bool)

(declare-fun e!762347 () Bool)

(declare-fun e!762349 () Bool)

(assert (=> b!1338702 (= e!762347 (and e!762349 mapRes!57193))))

(declare-fun condMapEmpty!57193 () Bool)

(declare-fun mapDefault!57193 () ValueCell!17600)

(assert (=> b!1338702 (= condMapEmpty!57193 (= (arr!43860 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17600)) mapDefault!57193)))))

(declare-fun b!1338703 () Bool)

(declare-fun res!888177 () Bool)

(declare-fun e!762350 () Bool)

(assert (=> b!1338703 (=> (not res!888177) (not e!762350))))

(declare-datatypes ((array!90803 0))(
  ( (array!90804 (arr!43861 (Array (_ BitVec 32) (_ BitVec 64))) (size!44413 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90803)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90803 (_ BitVec 32)) Bool)

(assert (=> b!1338703 (= res!888177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338704 () Bool)

(assert (=> b!1338704 (= e!762350 (and (bvsle #b00000000000000000000000000000000 (size!44413 _keys!1571)) (bvsge (size!44413 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!57193 () Bool)

(assert (=> mapIsEmpty!57193 mapRes!57193))

(declare-fun b!1338705 () Bool)

(declare-fun res!888178 () Bool)

(assert (=> b!1338705 (=> (not res!888178) (not e!762350))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338705 (= res!888178 (and (= (size!44412 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44413 _keys!1571) (size!44412 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888179 () Bool)

(assert (=> start!112916 (=> (not res!888179) (not e!762350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112916 (= res!888179 (validMask!0 mask!1977))))

(assert (=> start!112916 e!762350))

(assert (=> start!112916 true))

(declare-fun array_inv!33267 (array!90801) Bool)

(assert (=> start!112916 (and (array_inv!33267 _values!1303) e!762347)))

(declare-fun array_inv!33268 (array!90803) Bool)

(assert (=> start!112916 (array_inv!33268 _keys!1571)))

(declare-fun b!1338706 () Bool)

(assert (=> b!1338706 (= e!762349 tp_is_empty!36997)))

(assert (= (and start!112916 res!888179) b!1338705))

(assert (= (and b!1338705 res!888178) b!1338703))

(assert (= (and b!1338703 res!888177) b!1338704))

(assert (= (and b!1338702 condMapEmpty!57193) mapIsEmpty!57193))

(assert (= (and b!1338702 (not condMapEmpty!57193)) mapNonEmpty!57193))

(get-info :version)

(assert (= (and mapNonEmpty!57193 ((_ is ValueCellFull!17600) mapValue!57193)) b!1338701))

(assert (= (and b!1338702 ((_ is ValueCellFull!17600) mapDefault!57193)) b!1338706))

(assert (= start!112916 b!1338702))

(declare-fun m!1226551 () Bool)

(assert (=> mapNonEmpty!57193 m!1226551))

(declare-fun m!1226553 () Bool)

(assert (=> b!1338703 m!1226553))

(declare-fun m!1226555 () Bool)

(assert (=> start!112916 m!1226555))

(declare-fun m!1226557 () Bool)

(assert (=> start!112916 m!1226557))

(declare-fun m!1226559 () Bool)

(assert (=> start!112916 m!1226559))

(check-sat (not b!1338703) (not start!112916) (not mapNonEmpty!57193) tp_is_empty!36997)
(check-sat)
(get-model)

(declare-fun b!1338751 () Bool)

(declare-fun e!762389 () Bool)

(declare-fun e!762388 () Bool)

(assert (=> b!1338751 (= e!762389 e!762388)))

(declare-fun lt!593615 () (_ BitVec 64))

(assert (=> b!1338751 (= lt!593615 (select (arr!43861 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43790 0))(
  ( (Unit!43791) )
))
(declare-fun lt!593613 () Unit!43790)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90803 (_ BitVec 64) (_ BitVec 32)) Unit!43790)

(assert (=> b!1338751 (= lt!593613 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!593615 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338751 (arrayContainsKey!0 _keys!1571 lt!593615 #b00000000000000000000000000000000)))

(declare-fun lt!593614 () Unit!43790)

(assert (=> b!1338751 (= lt!593614 lt!593613)))

(declare-fun res!888203 () Bool)

(declare-datatypes ((SeekEntryResult!10052 0))(
  ( (MissingZero!10052 (index!42579 (_ BitVec 32))) (Found!10052 (index!42580 (_ BitVec 32))) (Intermediate!10052 (undefined!10864 Bool) (index!42581 (_ BitVec 32)) (x!119586 (_ BitVec 32))) (Undefined!10052) (MissingVacant!10052 (index!42582 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90803 (_ BitVec 32)) SeekEntryResult!10052)

(assert (=> b!1338751 (= res!888203 (= (seekEntryOrOpen!0 (select (arr!43861 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10052 #b00000000000000000000000000000000)))))

(assert (=> b!1338751 (=> (not res!888203) (not e!762388))))

(declare-fun b!1338752 () Bool)

(declare-fun call!65012 () Bool)

(assert (=> b!1338752 (= e!762388 call!65012)))

(declare-fun b!1338753 () Bool)

(assert (=> b!1338753 (= e!762389 call!65012)))

(declare-fun b!1338754 () Bool)

(declare-fun e!762390 () Bool)

(assert (=> b!1338754 (= e!762390 e!762389)))

(declare-fun c!126274 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338754 (= c!126274 (validKeyInArray!0 (select (arr!43861 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun bm!65009 () Bool)

(assert (=> bm!65009 (= call!65012 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun d!143975 () Bool)

(declare-fun res!888202 () Bool)

(assert (=> d!143975 (=> res!888202 e!762390)))

(assert (=> d!143975 (= res!888202 (bvsge #b00000000000000000000000000000000 (size!44413 _keys!1571)))))

(assert (=> d!143975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!762390)))

(assert (= (and d!143975 (not res!888202)) b!1338754))

(assert (= (and b!1338754 c!126274) b!1338751))

(assert (= (and b!1338754 (not c!126274)) b!1338753))

(assert (= (and b!1338751 res!888203) b!1338752))

(assert (= (or b!1338752 b!1338753) bm!65009))

(declare-fun m!1226581 () Bool)

(assert (=> b!1338751 m!1226581))

(declare-fun m!1226583 () Bool)

(assert (=> b!1338751 m!1226583))

(declare-fun m!1226585 () Bool)

(assert (=> b!1338751 m!1226585))

(assert (=> b!1338751 m!1226581))

(declare-fun m!1226587 () Bool)

(assert (=> b!1338751 m!1226587))

(assert (=> b!1338754 m!1226581))

(assert (=> b!1338754 m!1226581))

(declare-fun m!1226589 () Bool)

(assert (=> b!1338754 m!1226589))

(declare-fun m!1226591 () Bool)

(assert (=> bm!65009 m!1226591))

(assert (=> b!1338703 d!143975))

(declare-fun d!143977 () Bool)

(assert (=> d!143977 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!112916 d!143977))

(declare-fun d!143979 () Bool)

(assert (=> d!143979 (= (array_inv!33267 _values!1303) (bvsge (size!44412 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!112916 d!143979))

(declare-fun d!143981 () Bool)

(assert (=> d!143981 (= (array_inv!33268 _keys!1571) (bvsge (size!44413 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!112916 d!143981))

(declare-fun condMapEmpty!57202 () Bool)

(declare-fun mapDefault!57202 () ValueCell!17600)

(assert (=> mapNonEmpty!57193 (= condMapEmpty!57202 (= mapRest!57193 ((as const (Array (_ BitVec 32) ValueCell!17600)) mapDefault!57202)))))

(declare-fun e!762395 () Bool)

(declare-fun mapRes!57202 () Bool)

(assert (=> mapNonEmpty!57193 (= tp!108893 (and e!762395 mapRes!57202))))

(declare-fun b!1338762 () Bool)

(assert (=> b!1338762 (= e!762395 tp_is_empty!36997)))

(declare-fun b!1338761 () Bool)

(declare-fun e!762396 () Bool)

(assert (=> b!1338761 (= e!762396 tp_is_empty!36997)))

(declare-fun mapIsEmpty!57202 () Bool)

(assert (=> mapIsEmpty!57202 mapRes!57202))

(declare-fun mapNonEmpty!57202 () Bool)

(declare-fun tp!108902 () Bool)

(assert (=> mapNonEmpty!57202 (= mapRes!57202 (and tp!108902 e!762396))))

(declare-fun mapRest!57202 () (Array (_ BitVec 32) ValueCell!17600))

(declare-fun mapValue!57202 () ValueCell!17600)

(declare-fun mapKey!57202 () (_ BitVec 32))

(assert (=> mapNonEmpty!57202 (= mapRest!57193 (store mapRest!57202 mapKey!57202 mapValue!57202))))

(assert (= (and mapNonEmpty!57193 condMapEmpty!57202) mapIsEmpty!57202))

(assert (= (and mapNonEmpty!57193 (not condMapEmpty!57202)) mapNonEmpty!57202))

(assert (= (and mapNonEmpty!57202 ((_ is ValueCellFull!17600) mapValue!57202)) b!1338761))

(assert (= (and mapNonEmpty!57193 ((_ is ValueCellFull!17600) mapDefault!57202)) b!1338762))

(declare-fun m!1226593 () Bool)

(assert (=> mapNonEmpty!57202 m!1226593))

(check-sat tp_is_empty!36997 (not bm!65009) (not b!1338754) (not mapNonEmpty!57202) (not b!1338751))
(check-sat)
