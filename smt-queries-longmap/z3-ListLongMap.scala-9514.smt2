; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113140 () Bool)

(assert start!113140)

(declare-fun b!1340070 () Bool)

(declare-fun res!888725 () Bool)

(declare-fun e!763224 () Bool)

(assert (=> b!1340070 (=> (not res!888725) (not e!763224))))

(declare-datatypes ((array!90977 0))(
  ( (array!90978 (arr!43943 (Array (_ BitVec 32) (_ BitVec 64))) (size!44494 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90977)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90977 (_ BitVec 32)) Bool)

(assert (=> b!1340070 (= res!888725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340071 () Bool)

(declare-fun res!888726 () Bool)

(assert (=> b!1340071 (=> (not res!888726) (not e!763224))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54433 0))(
  ( (V!54434 (val!18573 Int)) )
))
(declare-datatypes ((ValueCell!17600 0))(
  ( (ValueCellFull!17600 (v!21215 V!54433)) (EmptyCell!17600) )
))
(declare-datatypes ((array!90979 0))(
  ( (array!90980 (arr!43944 (Array (_ BitVec 32) ValueCell!17600)) (size!44495 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90979)

(assert (=> b!1340071 (= res!888726 (and (= (size!44495 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44494 _keys!1571) (size!44495 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340072 () Bool)

(assert (=> b!1340072 (= e!763224 (and (bvsle #b00000000000000000000000000000000 (size!44494 _keys!1571)) (bvsge (size!44494 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun b!1340073 () Bool)

(declare-fun e!763225 () Bool)

(declare-fun tp_is_empty!36997 () Bool)

(assert (=> b!1340073 (= e!763225 tp_is_empty!36997)))

(declare-fun b!1340074 () Bool)

(declare-fun e!763226 () Bool)

(declare-fun mapRes!57193 () Bool)

(assert (=> b!1340074 (= e!763226 (and e!763225 mapRes!57193))))

(declare-fun condMapEmpty!57193 () Bool)

(declare-fun mapDefault!57193 () ValueCell!17600)

(assert (=> b!1340074 (= condMapEmpty!57193 (= (arr!43944 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17600)) mapDefault!57193)))))

(declare-fun b!1340075 () Bool)

(declare-fun e!763223 () Bool)

(assert (=> b!1340075 (= e!763223 tp_is_empty!36997)))

(declare-fun mapIsEmpty!57193 () Bool)

(assert (=> mapIsEmpty!57193 mapRes!57193))

(declare-fun res!888724 () Bool)

(assert (=> start!113140 (=> (not res!888724) (not e!763224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113140 (= res!888724 (validMask!0 mask!1977))))

(assert (=> start!113140 e!763224))

(assert (=> start!113140 true))

(declare-fun array_inv!33403 (array!90979) Bool)

(assert (=> start!113140 (and (array_inv!33403 _values!1303) e!763226)))

(declare-fun array_inv!33404 (array!90977) Bool)

(assert (=> start!113140 (array_inv!33404 _keys!1571)))

(declare-fun mapNonEmpty!57193 () Bool)

(declare-fun tp!108892 () Bool)

(assert (=> mapNonEmpty!57193 (= mapRes!57193 (and tp!108892 e!763223))))

(declare-fun mapValue!57193 () ValueCell!17600)

(declare-fun mapKey!57193 () (_ BitVec 32))

(declare-fun mapRest!57193 () (Array (_ BitVec 32) ValueCell!17600))

(assert (=> mapNonEmpty!57193 (= (arr!43944 _values!1303) (store mapRest!57193 mapKey!57193 mapValue!57193))))

(assert (= (and start!113140 res!888724) b!1340071))

(assert (= (and b!1340071 res!888726) b!1340070))

(assert (= (and b!1340070 res!888725) b!1340072))

(assert (= (and b!1340074 condMapEmpty!57193) mapIsEmpty!57193))

(assert (= (and b!1340074 (not condMapEmpty!57193)) mapNonEmpty!57193))

(get-info :version)

(assert (= (and mapNonEmpty!57193 ((_ is ValueCellFull!17600) mapValue!57193)) b!1340075))

(assert (= (and b!1340074 ((_ is ValueCellFull!17600) mapDefault!57193)) b!1340073))

(assert (= start!113140 b!1340074))

(declare-fun m!1228665 () Bool)

(assert (=> b!1340070 m!1228665))

(declare-fun m!1228667 () Bool)

(assert (=> start!113140 m!1228667))

(declare-fun m!1228669 () Bool)

(assert (=> start!113140 m!1228669))

(declare-fun m!1228671 () Bool)

(assert (=> start!113140 m!1228671))

(declare-fun m!1228673 () Bool)

(assert (=> mapNonEmpty!57193 m!1228673))

(check-sat (not start!113140) (not b!1340070) (not mapNonEmpty!57193) tp_is_empty!36997)
(check-sat)
(get-model)

(declare-fun d!144535 () Bool)

(assert (=> d!144535 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113140 d!144535))

(declare-fun d!144537 () Bool)

(assert (=> d!144537 (= (array_inv!33403 _values!1303) (bvsge (size!44495 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113140 d!144537))

(declare-fun d!144539 () Bool)

(assert (=> d!144539 (= (array_inv!33404 _keys!1571) (bvsge (size!44494 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113140 d!144539))

(declare-fun d!144541 () Bool)

(declare-fun res!888750 () Bool)

(declare-fun e!763266 () Bool)

(assert (=> d!144541 (=> res!888750 e!763266)))

(assert (=> d!144541 (= res!888750 (bvsge #b00000000000000000000000000000000 (size!44494 _keys!1571)))))

(assert (=> d!144541 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!763266)))

(declare-fun b!1340120 () Bool)

(declare-fun e!763264 () Bool)

(declare-fun e!763265 () Bool)

(assert (=> b!1340120 (= e!763264 e!763265)))

(declare-fun lt!594277 () (_ BitVec 64))

(assert (=> b!1340120 (= lt!594277 (select (arr!43943 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43922 0))(
  ( (Unit!43923) )
))
(declare-fun lt!594275 () Unit!43922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90977 (_ BitVec 64) (_ BitVec 32)) Unit!43922)

(assert (=> b!1340120 (= lt!594275 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!594277 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1340120 (arrayContainsKey!0 _keys!1571 lt!594277 #b00000000000000000000000000000000)))

(declare-fun lt!594276 () Unit!43922)

(assert (=> b!1340120 (= lt!594276 lt!594275)))

(declare-fun res!888749 () Bool)

(declare-datatypes ((SeekEntryResult!10009 0))(
  ( (MissingZero!10009 (index!42407 (_ BitVec 32))) (Found!10009 (index!42408 (_ BitVec 32))) (Intermediate!10009 (undefined!10821 Bool) (index!42409 (_ BitVec 32)) (x!119568 (_ BitVec 32))) (Undefined!10009) (MissingVacant!10009 (index!42410 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90977 (_ BitVec 32)) SeekEntryResult!10009)

(assert (=> b!1340120 (= res!888749 (= (seekEntryOrOpen!0 (select (arr!43943 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10009 #b00000000000000000000000000000000)))))

(assert (=> b!1340120 (=> (not res!888749) (not e!763265))))

(declare-fun b!1340121 () Bool)

(assert (=> b!1340121 (= e!763266 e!763264)))

(declare-fun c!126690 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340121 (= c!126690 (validKeyInArray!0 (select (arr!43943 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1340122 () Bool)

(declare-fun call!65096 () Bool)

(assert (=> b!1340122 (= e!763264 call!65096)))

(declare-fun b!1340123 () Bool)

(assert (=> b!1340123 (= e!763265 call!65096)))

(declare-fun bm!65093 () Bool)

(assert (=> bm!65093 (= call!65096 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(assert (= (and d!144541 (not res!888750)) b!1340121))

(assert (= (and b!1340121 c!126690) b!1340120))

(assert (= (and b!1340121 (not c!126690)) b!1340122))

(assert (= (and b!1340120 res!888749) b!1340123))

(assert (= (or b!1340123 b!1340122) bm!65093))

(declare-fun m!1228695 () Bool)

(assert (=> b!1340120 m!1228695))

(declare-fun m!1228697 () Bool)

(assert (=> b!1340120 m!1228697))

(declare-fun m!1228699 () Bool)

(assert (=> b!1340120 m!1228699))

(assert (=> b!1340120 m!1228695))

(declare-fun m!1228701 () Bool)

(assert (=> b!1340120 m!1228701))

(assert (=> b!1340121 m!1228695))

(assert (=> b!1340121 m!1228695))

(declare-fun m!1228703 () Bool)

(assert (=> b!1340121 m!1228703))

(declare-fun m!1228705 () Bool)

(assert (=> bm!65093 m!1228705))

(assert (=> b!1340070 d!144541))

(declare-fun mapNonEmpty!57202 () Bool)

(declare-fun mapRes!57202 () Bool)

(declare-fun tp!108901 () Bool)

(declare-fun e!763271 () Bool)

(assert (=> mapNonEmpty!57202 (= mapRes!57202 (and tp!108901 e!763271))))

(declare-fun mapRest!57202 () (Array (_ BitVec 32) ValueCell!17600))

(declare-fun mapValue!57202 () ValueCell!17600)

(declare-fun mapKey!57202 () (_ BitVec 32))

(assert (=> mapNonEmpty!57202 (= mapRest!57193 (store mapRest!57202 mapKey!57202 mapValue!57202))))

(declare-fun mapIsEmpty!57202 () Bool)

(assert (=> mapIsEmpty!57202 mapRes!57202))

(declare-fun b!1340131 () Bool)

(declare-fun e!763272 () Bool)

(assert (=> b!1340131 (= e!763272 tp_is_empty!36997)))

(declare-fun condMapEmpty!57202 () Bool)

(declare-fun mapDefault!57202 () ValueCell!17600)

(assert (=> mapNonEmpty!57193 (= condMapEmpty!57202 (= mapRest!57193 ((as const (Array (_ BitVec 32) ValueCell!17600)) mapDefault!57202)))))

(assert (=> mapNonEmpty!57193 (= tp!108892 (and e!763272 mapRes!57202))))

(declare-fun b!1340130 () Bool)

(assert (=> b!1340130 (= e!763271 tp_is_empty!36997)))

(assert (= (and mapNonEmpty!57193 condMapEmpty!57202) mapIsEmpty!57202))

(assert (= (and mapNonEmpty!57193 (not condMapEmpty!57202)) mapNonEmpty!57202))

(assert (= (and mapNonEmpty!57202 ((_ is ValueCellFull!17600) mapValue!57202)) b!1340130))

(assert (= (and mapNonEmpty!57193 ((_ is ValueCellFull!17600) mapDefault!57202)) b!1340131))

(declare-fun m!1228707 () Bool)

(assert (=> mapNonEmpty!57202 m!1228707))

(check-sat (not b!1340121) (not mapNonEmpty!57202) (not bm!65093) tp_is_empty!36997 (not b!1340120))
(check-sat)
