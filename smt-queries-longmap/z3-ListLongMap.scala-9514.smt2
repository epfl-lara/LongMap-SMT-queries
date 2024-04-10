; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112918 () Bool)

(assert start!112918)

(declare-fun res!888215 () Bool)

(declare-fun e!762396 () Bool)

(assert (=> start!112918 (=> (not res!888215) (not e!762396))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112918 (= res!888215 (validMask!0 mask!1977))))

(assert (=> start!112918 e!762396))

(assert (=> start!112918 true))

(declare-datatypes ((V!54435 0))(
  ( (V!54436 (val!18574 Int)) )
))
(declare-datatypes ((ValueCell!17601 0))(
  ( (ValueCellFull!17601 (v!21221 V!54435)) (EmptyCell!17601) )
))
(declare-datatypes ((array!90858 0))(
  ( (array!90859 (arr!43888 (Array (_ BitVec 32) ValueCell!17601)) (size!44438 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90858)

(declare-fun e!762395 () Bool)

(declare-fun array_inv!33095 (array!90858) Bool)

(assert (=> start!112918 (and (array_inv!33095 _values!1303) e!762395)))

(declare-datatypes ((array!90860 0))(
  ( (array!90861 (arr!43889 (Array (_ BitVec 32) (_ BitVec 64))) (size!44439 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90860)

(declare-fun array_inv!33096 (array!90860) Bool)

(assert (=> start!112918 (array_inv!33096 _keys!1571)))

(declare-fun b!1338789 () Bool)

(declare-fun res!888217 () Bool)

(assert (=> b!1338789 (=> (not res!888217) (not e!762396))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338789 (= res!888217 (and (= (size!44438 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44439 _keys!1571) (size!44438 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1338790 () Bool)

(declare-fun res!888216 () Bool)

(assert (=> b!1338790 (=> (not res!888216) (not e!762396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90860 (_ BitVec 32)) Bool)

(assert (=> b!1338790 (= res!888216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338791 () Bool)

(declare-fun e!762397 () Bool)

(declare-fun tp_is_empty!36999 () Bool)

(assert (=> b!1338791 (= e!762397 tp_is_empty!36999)))

(declare-fun mapNonEmpty!57196 () Bool)

(declare-fun mapRes!57196 () Bool)

(declare-fun tp!108895 () Bool)

(assert (=> mapNonEmpty!57196 (= mapRes!57196 (and tp!108895 e!762397))))

(declare-fun mapValue!57196 () ValueCell!17601)

(declare-fun mapKey!57196 () (_ BitVec 32))

(declare-fun mapRest!57196 () (Array (_ BitVec 32) ValueCell!17601))

(assert (=> mapNonEmpty!57196 (= (arr!43888 _values!1303) (store mapRest!57196 mapKey!57196 mapValue!57196))))

(declare-fun b!1338792 () Bool)

(declare-fun e!762399 () Bool)

(assert (=> b!1338792 (= e!762399 tp_is_empty!36999)))

(declare-fun b!1338793 () Bool)

(assert (=> b!1338793 (= e!762395 (and e!762399 mapRes!57196))))

(declare-fun condMapEmpty!57196 () Bool)

(declare-fun mapDefault!57196 () ValueCell!17601)

(assert (=> b!1338793 (= condMapEmpty!57196 (= (arr!43888 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17601)) mapDefault!57196)))))

(declare-fun b!1338794 () Bool)

(assert (=> b!1338794 (= e!762396 (and (bvsle #b00000000000000000000000000000000 (size!44439 _keys!1571)) (bvsge (size!44439 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!57196 () Bool)

(assert (=> mapIsEmpty!57196 mapRes!57196))

(assert (= (and start!112918 res!888215) b!1338789))

(assert (= (and b!1338789 res!888217) b!1338790))

(assert (= (and b!1338790 res!888216) b!1338794))

(assert (= (and b!1338793 condMapEmpty!57196) mapIsEmpty!57196))

(assert (= (and b!1338793 (not condMapEmpty!57196)) mapNonEmpty!57196))

(get-info :version)

(assert (= (and mapNonEmpty!57196 ((_ is ValueCellFull!17601) mapValue!57196)) b!1338791))

(assert (= (and b!1338793 ((_ is ValueCellFull!17601) mapDefault!57196)) b!1338792))

(assert (= start!112918 b!1338793))

(declare-fun m!1227077 () Bool)

(assert (=> start!112918 m!1227077))

(declare-fun m!1227079 () Bool)

(assert (=> start!112918 m!1227079))

(declare-fun m!1227081 () Bool)

(assert (=> start!112918 m!1227081))

(declare-fun m!1227083 () Bool)

(assert (=> b!1338790 m!1227083))

(declare-fun m!1227085 () Bool)

(assert (=> mapNonEmpty!57196 m!1227085))

(check-sat (not b!1338790) (not start!112918) (not mapNonEmpty!57196) tp_is_empty!36999)
(check-sat)
(get-model)

(declare-fun d!144091 () Bool)

(declare-fun res!888231 () Bool)

(declare-fun e!762422 () Bool)

(assert (=> d!144091 (=> res!888231 e!762422)))

(assert (=> d!144091 (= res!888231 (bvsge #b00000000000000000000000000000000 (size!44439 _keys!1571)))))

(assert (=> d!144091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!762422)))

(declare-fun bm!65028 () Bool)

(declare-fun call!65031 () Bool)

(assert (=> bm!65028 (= call!65031 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1338821 () Bool)

(declare-fun e!762423 () Bool)

(assert (=> b!1338821 (= e!762422 e!762423)))

(declare-fun c!126292 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338821 (= c!126292 (validKeyInArray!0 (select (arr!43889 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1338822 () Bool)

(assert (=> b!1338822 (= e!762423 call!65031)))

(declare-fun b!1338823 () Bool)

(declare-fun e!762421 () Bool)

(assert (=> b!1338823 (= e!762421 call!65031)))

(declare-fun b!1338824 () Bool)

(assert (=> b!1338824 (= e!762423 e!762421)))

(declare-fun lt!593799 () (_ BitVec 64))

(assert (=> b!1338824 (= lt!593799 (select (arr!43889 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43985 0))(
  ( (Unit!43986) )
))
(declare-fun lt!593800 () Unit!43985)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90860 (_ BitVec 64) (_ BitVec 32)) Unit!43985)

(assert (=> b!1338824 (= lt!593800 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!593799 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338824 (arrayContainsKey!0 _keys!1571 lt!593799 #b00000000000000000000000000000000)))

(declare-fun lt!593801 () Unit!43985)

(assert (=> b!1338824 (= lt!593801 lt!593800)))

(declare-fun res!888232 () Bool)

(declare-datatypes ((SeekEntryResult!10053 0))(
  ( (MissingZero!10053 (index!42583 (_ BitVec 32))) (Found!10053 (index!42584 (_ BitVec 32))) (Intermediate!10053 (undefined!10865 Bool) (index!42585 (_ BitVec 32)) (x!119590 (_ BitVec 32))) (Undefined!10053) (MissingVacant!10053 (index!42586 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90860 (_ BitVec 32)) SeekEntryResult!10053)

(assert (=> b!1338824 (= res!888232 (= (seekEntryOrOpen!0 (select (arr!43889 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10053 #b00000000000000000000000000000000)))))

(assert (=> b!1338824 (=> (not res!888232) (not e!762421))))

(assert (= (and d!144091 (not res!888231)) b!1338821))

(assert (= (and b!1338821 c!126292) b!1338824))

(assert (= (and b!1338821 (not c!126292)) b!1338822))

(assert (= (and b!1338824 res!888232) b!1338823))

(assert (= (or b!1338823 b!1338822) bm!65028))

(declare-fun m!1227097 () Bool)

(assert (=> bm!65028 m!1227097))

(declare-fun m!1227099 () Bool)

(assert (=> b!1338821 m!1227099))

(assert (=> b!1338821 m!1227099))

(declare-fun m!1227101 () Bool)

(assert (=> b!1338821 m!1227101))

(assert (=> b!1338824 m!1227099))

(declare-fun m!1227103 () Bool)

(assert (=> b!1338824 m!1227103))

(declare-fun m!1227105 () Bool)

(assert (=> b!1338824 m!1227105))

(assert (=> b!1338824 m!1227099))

(declare-fun m!1227107 () Bool)

(assert (=> b!1338824 m!1227107))

(assert (=> b!1338790 d!144091))

(declare-fun d!144093 () Bool)

(assert (=> d!144093 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!112918 d!144093))

(declare-fun d!144095 () Bool)

(assert (=> d!144095 (= (array_inv!33095 _values!1303) (bvsge (size!44438 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!112918 d!144095))

(declare-fun d!144097 () Bool)

(assert (=> d!144097 (= (array_inv!33096 _keys!1571) (bvsge (size!44439 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!112918 d!144097))

(declare-fun b!1338831 () Bool)

(declare-fun e!762429 () Bool)

(assert (=> b!1338831 (= e!762429 tp_is_empty!36999)))

(declare-fun mapNonEmpty!57202 () Bool)

(declare-fun mapRes!57202 () Bool)

(declare-fun tp!108901 () Bool)

(assert (=> mapNonEmpty!57202 (= mapRes!57202 (and tp!108901 e!762429))))

(declare-fun mapValue!57202 () ValueCell!17601)

(declare-fun mapKey!57202 () (_ BitVec 32))

(declare-fun mapRest!57202 () (Array (_ BitVec 32) ValueCell!17601))

(assert (=> mapNonEmpty!57202 (= mapRest!57196 (store mapRest!57202 mapKey!57202 mapValue!57202))))

(declare-fun b!1338832 () Bool)

(declare-fun e!762428 () Bool)

(assert (=> b!1338832 (= e!762428 tp_is_empty!36999)))

(declare-fun mapIsEmpty!57202 () Bool)

(assert (=> mapIsEmpty!57202 mapRes!57202))

(declare-fun condMapEmpty!57202 () Bool)

(declare-fun mapDefault!57202 () ValueCell!17601)

(assert (=> mapNonEmpty!57196 (= condMapEmpty!57202 (= mapRest!57196 ((as const (Array (_ BitVec 32) ValueCell!17601)) mapDefault!57202)))))

(assert (=> mapNonEmpty!57196 (= tp!108895 (and e!762428 mapRes!57202))))

(assert (= (and mapNonEmpty!57196 condMapEmpty!57202) mapIsEmpty!57202))

(assert (= (and mapNonEmpty!57196 (not condMapEmpty!57202)) mapNonEmpty!57202))

(assert (= (and mapNonEmpty!57202 ((_ is ValueCellFull!17601) mapValue!57202)) b!1338831))

(assert (= (and mapNonEmpty!57196 ((_ is ValueCellFull!17601) mapDefault!57202)) b!1338832))

(declare-fun m!1227109 () Bool)

(assert (=> mapNonEmpty!57202 m!1227109))

(check-sat (not b!1338824) (not mapNonEmpty!57202) (not bm!65028) tp_is_empty!36999 (not b!1338821))
(check-sat)
