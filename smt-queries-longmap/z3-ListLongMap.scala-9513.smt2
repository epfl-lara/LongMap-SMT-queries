; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112902 () Bool)

(assert start!112902)

(declare-fun mapIsEmpty!57181 () Bool)

(declare-fun mapRes!57181 () Bool)

(assert (=> mapIsEmpty!57181 mapRes!57181))

(declare-fun b!1338627 () Bool)

(declare-fun e!762288 () Bool)

(declare-fun tp_is_empty!36991 () Bool)

(assert (=> b!1338627 (= e!762288 tp_is_empty!36991)))

(declare-fun b!1338628 () Bool)

(declare-fun e!762289 () Bool)

(declare-datatypes ((array!90787 0))(
  ( (array!90788 (arr!43854 (Array (_ BitVec 32) (_ BitVec 64))) (size!44406 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90787)

(assert (=> b!1338628 (= e!762289 (bvsgt #b00000000000000000000000000000000 (size!44406 _keys!1571)))))

(declare-fun b!1338629 () Bool)

(declare-fun res!888144 () Bool)

(assert (=> b!1338629 (=> (not res!888144) (not e!762289))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90787 (_ BitVec 32)) Bool)

(assert (=> b!1338629 (= res!888144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338630 () Bool)

(declare-fun e!762287 () Bool)

(assert (=> b!1338630 (= e!762287 (and e!762288 mapRes!57181))))

(declare-fun condMapEmpty!57181 () Bool)

(declare-datatypes ((V!54425 0))(
  ( (V!54426 (val!18570 Int)) )
))
(declare-datatypes ((ValueCell!17597 0))(
  ( (ValueCellFull!17597 (v!21216 V!54425)) (EmptyCell!17597) )
))
(declare-datatypes ((array!90789 0))(
  ( (array!90790 (arr!43855 (Array (_ BitVec 32) ValueCell!17597)) (size!44407 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90789)

(declare-fun mapDefault!57181 () ValueCell!17597)

(assert (=> b!1338630 (= condMapEmpty!57181 (= (arr!43855 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17597)) mapDefault!57181)))))

(declare-fun res!888146 () Bool)

(assert (=> start!112902 (=> (not res!888146) (not e!762289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112902 (= res!888146 (validMask!0 mask!1977))))

(assert (=> start!112902 e!762289))

(assert (=> start!112902 true))

(declare-fun array_inv!33261 (array!90789) Bool)

(assert (=> start!112902 (and (array_inv!33261 _values!1303) e!762287)))

(declare-fun array_inv!33262 (array!90787) Bool)

(assert (=> start!112902 (array_inv!33262 _keys!1571)))

(declare-fun b!1338631 () Bool)

(declare-fun e!762290 () Bool)

(assert (=> b!1338631 (= e!762290 tp_is_empty!36991)))

(declare-fun mapNonEmpty!57181 () Bool)

(declare-fun tp!108881 () Bool)

(assert (=> mapNonEmpty!57181 (= mapRes!57181 (and tp!108881 e!762290))))

(declare-fun mapValue!57181 () ValueCell!17597)

(declare-fun mapKey!57181 () (_ BitVec 32))

(declare-fun mapRest!57181 () (Array (_ BitVec 32) ValueCell!17597))

(assert (=> mapNonEmpty!57181 (= (arr!43855 _values!1303) (store mapRest!57181 mapKey!57181 mapValue!57181))))

(declare-fun b!1338632 () Bool)

(declare-fun res!888145 () Bool)

(assert (=> b!1338632 (=> (not res!888145) (not e!762289))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338632 (= res!888145 (and (= (size!44407 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44406 _keys!1571) (size!44407 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!112902 res!888146) b!1338632))

(assert (= (and b!1338632 res!888145) b!1338629))

(assert (= (and b!1338629 res!888144) b!1338628))

(assert (= (and b!1338630 condMapEmpty!57181) mapIsEmpty!57181))

(assert (= (and b!1338630 (not condMapEmpty!57181)) mapNonEmpty!57181))

(get-info :version)

(assert (= (and mapNonEmpty!57181 ((_ is ValueCellFull!17597) mapValue!57181)) b!1338631))

(assert (= (and b!1338630 ((_ is ValueCellFull!17597) mapDefault!57181)) b!1338627))

(assert (= start!112902 b!1338630))

(declare-fun m!1226507 () Bool)

(assert (=> b!1338629 m!1226507))

(declare-fun m!1226509 () Bool)

(assert (=> start!112902 m!1226509))

(declare-fun m!1226511 () Bool)

(assert (=> start!112902 m!1226511))

(declare-fun m!1226513 () Bool)

(assert (=> start!112902 m!1226513))

(declare-fun m!1226515 () Bool)

(assert (=> mapNonEmpty!57181 m!1226515))

(check-sat (not start!112902) (not b!1338629) (not mapNonEmpty!57181) tp_is_empty!36991)
(check-sat)
(get-model)

(declare-fun d!143965 () Bool)

(assert (=> d!143965 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!112902 d!143965))

(declare-fun d!143967 () Bool)

(assert (=> d!143967 (= (array_inv!33261 _values!1303) (bvsge (size!44407 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!112902 d!143967))

(declare-fun d!143969 () Bool)

(assert (=> d!143969 (= (array_inv!33262 _keys!1571) (bvsge (size!44406 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!112902 d!143969))

(declare-fun b!1338677 () Bool)

(declare-fun e!762328 () Bool)

(declare-fun call!65009 () Bool)

(assert (=> b!1338677 (= e!762328 call!65009)))

(declare-fun bm!65006 () Bool)

(assert (=> bm!65006 (= call!65009 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1338678 () Bool)

(declare-fun e!762329 () Bool)

(declare-fun e!762330 () Bool)

(assert (=> b!1338678 (= e!762329 e!762330)))

(declare-fun c!126271 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338678 (= c!126271 (validKeyInArray!0 (select (arr!43854 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun d!143971 () Bool)

(declare-fun res!888170 () Bool)

(assert (=> d!143971 (=> res!888170 e!762329)))

(assert (=> d!143971 (= res!888170 (bvsge #b00000000000000000000000000000000 (size!44406 _keys!1571)))))

(assert (=> d!143971 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!762329)))

(declare-fun b!1338679 () Bool)

(assert (=> b!1338679 (= e!762330 call!65009)))

(declare-fun b!1338680 () Bool)

(assert (=> b!1338680 (= e!762330 e!762328)))

(declare-fun lt!593605 () (_ BitVec 64))

(assert (=> b!1338680 (= lt!593605 (select (arr!43854 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43788 0))(
  ( (Unit!43789) )
))
(declare-fun lt!593604 () Unit!43788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90787 (_ BitVec 64) (_ BitVec 32)) Unit!43788)

(assert (=> b!1338680 (= lt!593604 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!593605 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338680 (arrayContainsKey!0 _keys!1571 lt!593605 #b00000000000000000000000000000000)))

(declare-fun lt!593606 () Unit!43788)

(assert (=> b!1338680 (= lt!593606 lt!593604)))

(declare-fun res!888169 () Bool)

(declare-datatypes ((SeekEntryResult!10051 0))(
  ( (MissingZero!10051 (index!42575 (_ BitVec 32))) (Found!10051 (index!42576 (_ BitVec 32))) (Intermediate!10051 (undefined!10863 Bool) (index!42577 (_ BitVec 32)) (x!119575 (_ BitVec 32))) (Undefined!10051) (MissingVacant!10051 (index!42578 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90787 (_ BitVec 32)) SeekEntryResult!10051)

(assert (=> b!1338680 (= res!888169 (= (seekEntryOrOpen!0 (select (arr!43854 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10051 #b00000000000000000000000000000000)))))

(assert (=> b!1338680 (=> (not res!888169) (not e!762328))))

(assert (= (and d!143971 (not res!888170)) b!1338678))

(assert (= (and b!1338678 c!126271) b!1338680))

(assert (= (and b!1338678 (not c!126271)) b!1338679))

(assert (= (and b!1338680 res!888169) b!1338677))

(assert (= (or b!1338677 b!1338679) bm!65006))

(declare-fun m!1226537 () Bool)

(assert (=> bm!65006 m!1226537))

(declare-fun m!1226539 () Bool)

(assert (=> b!1338678 m!1226539))

(assert (=> b!1338678 m!1226539))

(declare-fun m!1226541 () Bool)

(assert (=> b!1338678 m!1226541))

(assert (=> b!1338680 m!1226539))

(declare-fun m!1226543 () Bool)

(assert (=> b!1338680 m!1226543))

(declare-fun m!1226545 () Bool)

(assert (=> b!1338680 m!1226545))

(assert (=> b!1338680 m!1226539))

(declare-fun m!1226547 () Bool)

(assert (=> b!1338680 m!1226547))

(assert (=> b!1338629 d!143971))

(declare-fun mapIsEmpty!57190 () Bool)

(declare-fun mapRes!57190 () Bool)

(assert (=> mapIsEmpty!57190 mapRes!57190))

(declare-fun condMapEmpty!57190 () Bool)

(declare-fun mapDefault!57190 () ValueCell!17597)

(assert (=> mapNonEmpty!57181 (= condMapEmpty!57190 (= mapRest!57181 ((as const (Array (_ BitVec 32) ValueCell!17597)) mapDefault!57190)))))

(declare-fun e!762335 () Bool)

(assert (=> mapNonEmpty!57181 (= tp!108881 (and e!762335 mapRes!57190))))

(declare-fun b!1338687 () Bool)

(declare-fun e!762336 () Bool)

(assert (=> b!1338687 (= e!762336 tp_is_empty!36991)))

(declare-fun mapNonEmpty!57190 () Bool)

(declare-fun tp!108890 () Bool)

(assert (=> mapNonEmpty!57190 (= mapRes!57190 (and tp!108890 e!762336))))

(declare-fun mapKey!57190 () (_ BitVec 32))

(declare-fun mapValue!57190 () ValueCell!17597)

(declare-fun mapRest!57190 () (Array (_ BitVec 32) ValueCell!17597))

(assert (=> mapNonEmpty!57190 (= mapRest!57181 (store mapRest!57190 mapKey!57190 mapValue!57190))))

(declare-fun b!1338688 () Bool)

(assert (=> b!1338688 (= e!762335 tp_is_empty!36991)))

(assert (= (and mapNonEmpty!57181 condMapEmpty!57190) mapIsEmpty!57190))

(assert (= (and mapNonEmpty!57181 (not condMapEmpty!57190)) mapNonEmpty!57190))

(assert (= (and mapNonEmpty!57190 ((_ is ValueCellFull!17597) mapValue!57190)) b!1338687))

(assert (= (and mapNonEmpty!57181 ((_ is ValueCellFull!17597) mapDefault!57190)) b!1338688))

(declare-fun m!1226549 () Bool)

(assert (=> mapNonEmpty!57190 m!1226549))

(check-sat (not bm!65006) (not b!1338678) (not b!1338680) tp_is_empty!36991 (not mapNonEmpty!57190))
(check-sat)
