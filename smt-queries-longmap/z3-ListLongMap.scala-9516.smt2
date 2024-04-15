; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112946 () Bool)

(assert start!112946)

(declare-fun mapIsEmpty!57217 () Bool)

(declare-fun mapRes!57217 () Bool)

(assert (=> mapIsEmpty!57217 mapRes!57217))

(declare-fun b!1338870 () Bool)

(declare-fun res!888264 () Bool)

(declare-fun e!762478 () Bool)

(assert (=> b!1338870 (=> (not res!888264) (not e!762478))))

(declare-datatypes ((List!31137 0))(
  ( (Nil!31134) (Cons!31133 (h!32342 (_ BitVec 64)) (t!45461 List!31137)) )
))
(declare-fun noDuplicate!2093 (List!31137) Bool)

(assert (=> b!1338870 (= res!888264 (noDuplicate!2093 Nil!31134))))

(declare-fun b!1338871 () Bool)

(declare-fun res!888267 () Bool)

(assert (=> b!1338871 (=> (not res!888267) (not e!762478))))

(declare-datatypes ((array!90825 0))(
  ( (array!90826 (arr!43870 (Array (_ BitVec 32) (_ BitVec 64))) (size!44422 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90825)

(assert (=> b!1338871 (= res!888267 (and (bvsle #b00000000000000000000000000000000 (size!44422 _keys!1571)) (bvslt (size!44422 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun res!888266 () Bool)

(assert (=> start!112946 (=> (not res!888266) (not e!762478))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112946 (= res!888266 (validMask!0 mask!1977))))

(assert (=> start!112946 e!762478))

(assert (=> start!112946 true))

(declare-datatypes ((V!54449 0))(
  ( (V!54450 (val!18579 Int)) )
))
(declare-datatypes ((ValueCell!17606 0))(
  ( (ValueCellFull!17606 (v!21225 V!54449)) (EmptyCell!17606) )
))
(declare-datatypes ((array!90827 0))(
  ( (array!90828 (arr!43871 (Array (_ BitVec 32) ValueCell!17606)) (size!44423 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90827)

(declare-fun e!762480 () Bool)

(declare-fun array_inv!33273 (array!90827) Bool)

(assert (=> start!112946 (and (array_inv!33273 _values!1303) e!762480)))

(declare-fun array_inv!33274 (array!90825) Bool)

(assert (=> start!112946 (array_inv!33274 _keys!1571)))

(declare-fun b!1338872 () Bool)

(declare-fun e!762476 () Bool)

(declare-fun tp_is_empty!37009 () Bool)

(assert (=> b!1338872 (= e!762476 tp_is_empty!37009)))

(declare-fun b!1338873 () Bool)

(declare-fun res!888265 () Bool)

(assert (=> b!1338873 (=> (not res!888265) (not e!762478))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338873 (= res!888265 (and (= (size!44423 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44422 _keys!1571) (size!44423 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1338874 () Bool)

(declare-fun res!888268 () Bool)

(assert (=> b!1338874 (=> (not res!888268) (not e!762478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90825 (_ BitVec 32)) Bool)

(assert (=> b!1338874 (= res!888268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338875 () Bool)

(declare-fun e!762477 () Bool)

(declare-fun contains!8951 (List!31137 (_ BitVec 64)) Bool)

(assert (=> b!1338875 (= e!762477 (contains!8951 Nil!31134 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338876 () Bool)

(declare-fun e!762479 () Bool)

(assert (=> b!1338876 (= e!762480 (and e!762479 mapRes!57217))))

(declare-fun condMapEmpty!57217 () Bool)

(declare-fun mapDefault!57217 () ValueCell!17606)

(assert (=> b!1338876 (= condMapEmpty!57217 (= (arr!43871 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17606)) mapDefault!57217)))))

(declare-fun mapNonEmpty!57217 () Bool)

(declare-fun tp!108917 () Bool)

(assert (=> mapNonEmpty!57217 (= mapRes!57217 (and tp!108917 e!762476))))

(declare-fun mapRest!57217 () (Array (_ BitVec 32) ValueCell!17606))

(declare-fun mapKey!57217 () (_ BitVec 32))

(declare-fun mapValue!57217 () ValueCell!17606)

(assert (=> mapNonEmpty!57217 (= (arr!43871 _values!1303) (store mapRest!57217 mapKey!57217 mapValue!57217))))

(declare-fun b!1338877 () Bool)

(assert (=> b!1338877 (= e!762479 tp_is_empty!37009)))

(declare-fun b!1338878 () Bool)

(assert (=> b!1338878 (= e!762478 e!762477)))

(declare-fun res!888269 () Bool)

(assert (=> b!1338878 (=> res!888269 e!762477)))

(assert (=> b!1338878 (= res!888269 (contains!8951 Nil!31134 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!112946 res!888266) b!1338873))

(assert (= (and b!1338873 res!888265) b!1338874))

(assert (= (and b!1338874 res!888268) b!1338871))

(assert (= (and b!1338871 res!888267) b!1338870))

(assert (= (and b!1338870 res!888264) b!1338878))

(assert (= (and b!1338878 (not res!888269)) b!1338875))

(assert (= (and b!1338876 condMapEmpty!57217) mapIsEmpty!57217))

(assert (= (and b!1338876 (not condMapEmpty!57217)) mapNonEmpty!57217))

(get-info :version)

(assert (= (and mapNonEmpty!57217 ((_ is ValueCellFull!17606) mapValue!57217)) b!1338872))

(assert (= (and b!1338876 ((_ is ValueCellFull!17606) mapDefault!57217)) b!1338877))

(assert (= start!112946 b!1338876))

(declare-fun m!1226649 () Bool)

(assert (=> b!1338870 m!1226649))

(declare-fun m!1226651 () Bool)

(assert (=> b!1338874 m!1226651))

(declare-fun m!1226653 () Bool)

(assert (=> b!1338878 m!1226653))

(declare-fun m!1226655 () Bool)

(assert (=> start!112946 m!1226655))

(declare-fun m!1226657 () Bool)

(assert (=> start!112946 m!1226657))

(declare-fun m!1226659 () Bool)

(assert (=> start!112946 m!1226659))

(declare-fun m!1226661 () Bool)

(assert (=> b!1338875 m!1226661))

(declare-fun m!1226663 () Bool)

(assert (=> mapNonEmpty!57217 m!1226663))

(check-sat (not b!1338874) (not start!112946) (not b!1338875) (not b!1338878) (not b!1338870) (not mapNonEmpty!57217) tp_is_empty!37009)
(check-sat)
(get-model)

(declare-fun d!143997 () Bool)

(declare-fun lt!593627 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!660 (List!31137) (InoxSet (_ BitVec 64)))

(assert (=> d!143997 (= lt!593627 (select (content!660 Nil!31134) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!762521 () Bool)

(assert (=> d!143997 (= lt!593627 e!762521)))

(declare-fun res!888311 () Bool)

(assert (=> d!143997 (=> (not res!888311) (not e!762521))))

(assert (=> d!143997 (= res!888311 ((_ is Cons!31133) Nil!31134))))

(assert (=> d!143997 (= (contains!8951 Nil!31134 #b1000000000000000000000000000000000000000000000000000000000000000) lt!593627)))

(declare-fun b!1338937 () Bool)

(declare-fun e!762522 () Bool)

(assert (=> b!1338937 (= e!762521 e!762522)))

(declare-fun res!888310 () Bool)

(assert (=> b!1338937 (=> res!888310 e!762522)))

(assert (=> b!1338937 (= res!888310 (= (h!32342 Nil!31134) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338938 () Bool)

(assert (=> b!1338938 (= e!762522 (contains!8951 (t!45461 Nil!31134) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!143997 res!888311) b!1338937))

(assert (= (and b!1338937 (not res!888310)) b!1338938))

(declare-fun m!1226697 () Bool)

(assert (=> d!143997 m!1226697))

(declare-fun m!1226699 () Bool)

(assert (=> d!143997 m!1226699))

(declare-fun m!1226701 () Bool)

(assert (=> b!1338938 m!1226701))

(assert (=> b!1338875 d!143997))

(declare-fun bm!65015 () Bool)

(declare-fun call!65018 () Bool)

(assert (=> bm!65015 (= call!65018 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1338947 () Bool)

(declare-fun e!762529 () Bool)

(declare-fun e!762531 () Bool)

(assert (=> b!1338947 (= e!762529 e!762531)))

(declare-fun lt!593635 () (_ BitVec 64))

(assert (=> b!1338947 (= lt!593635 (select (arr!43870 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43794 0))(
  ( (Unit!43795) )
))
(declare-fun lt!593634 () Unit!43794)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90825 (_ BitVec 64) (_ BitVec 32)) Unit!43794)

(assert (=> b!1338947 (= lt!593634 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!593635 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338947 (arrayContainsKey!0 _keys!1571 lt!593635 #b00000000000000000000000000000000)))

(declare-fun lt!593636 () Unit!43794)

(assert (=> b!1338947 (= lt!593636 lt!593634)))

(declare-fun res!888316 () Bool)

(declare-datatypes ((SeekEntryResult!10054 0))(
  ( (MissingZero!10054 (index!42587 (_ BitVec 32))) (Found!10054 (index!42588 (_ BitVec 32))) (Intermediate!10054 (undefined!10866 Bool) (index!42589 (_ BitVec 32)) (x!119608 (_ BitVec 32))) (Undefined!10054) (MissingVacant!10054 (index!42590 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90825 (_ BitVec 32)) SeekEntryResult!10054)

(assert (=> b!1338947 (= res!888316 (= (seekEntryOrOpen!0 (select (arr!43870 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10054 #b00000000000000000000000000000000)))))

(assert (=> b!1338947 (=> (not res!888316) (not e!762531))))

(declare-fun b!1338948 () Bool)

(assert (=> b!1338948 (= e!762529 call!65018)))

(declare-fun b!1338949 () Bool)

(declare-fun e!762530 () Bool)

(assert (=> b!1338949 (= e!762530 e!762529)))

(declare-fun c!126280 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338949 (= c!126280 (validKeyInArray!0 (select (arr!43870 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1338950 () Bool)

(assert (=> b!1338950 (= e!762531 call!65018)))

(declare-fun d!143999 () Bool)

(declare-fun res!888317 () Bool)

(assert (=> d!143999 (=> res!888317 e!762530)))

(assert (=> d!143999 (= res!888317 (bvsge #b00000000000000000000000000000000 (size!44422 _keys!1571)))))

(assert (=> d!143999 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!762530)))

(assert (= (and d!143999 (not res!888317)) b!1338949))

(assert (= (and b!1338949 c!126280) b!1338947))

(assert (= (and b!1338949 (not c!126280)) b!1338948))

(assert (= (and b!1338947 res!888316) b!1338950))

(assert (= (or b!1338950 b!1338948) bm!65015))

(declare-fun m!1226703 () Bool)

(assert (=> bm!65015 m!1226703))

(declare-fun m!1226705 () Bool)

(assert (=> b!1338947 m!1226705))

(declare-fun m!1226707 () Bool)

(assert (=> b!1338947 m!1226707))

(declare-fun m!1226709 () Bool)

(assert (=> b!1338947 m!1226709))

(assert (=> b!1338947 m!1226705))

(declare-fun m!1226711 () Bool)

(assert (=> b!1338947 m!1226711))

(assert (=> b!1338949 m!1226705))

(assert (=> b!1338949 m!1226705))

(declare-fun m!1226713 () Bool)

(assert (=> b!1338949 m!1226713))

(assert (=> b!1338874 d!143999))

(declare-fun d!144001 () Bool)

(declare-fun res!888322 () Bool)

(declare-fun e!762536 () Bool)

(assert (=> d!144001 (=> res!888322 e!762536)))

(assert (=> d!144001 (= res!888322 ((_ is Nil!31134) Nil!31134))))

(assert (=> d!144001 (= (noDuplicate!2093 Nil!31134) e!762536)))

(declare-fun b!1338955 () Bool)

(declare-fun e!762537 () Bool)

(assert (=> b!1338955 (= e!762536 e!762537)))

(declare-fun res!888323 () Bool)

(assert (=> b!1338955 (=> (not res!888323) (not e!762537))))

(assert (=> b!1338955 (= res!888323 (not (contains!8951 (t!45461 Nil!31134) (h!32342 Nil!31134))))))

(declare-fun b!1338956 () Bool)

(assert (=> b!1338956 (= e!762537 (noDuplicate!2093 (t!45461 Nil!31134)))))

(assert (= (and d!144001 (not res!888322)) b!1338955))

(assert (= (and b!1338955 res!888323) b!1338956))

(declare-fun m!1226715 () Bool)

(assert (=> b!1338955 m!1226715))

(declare-fun m!1226717 () Bool)

(assert (=> b!1338956 m!1226717))

(assert (=> b!1338870 d!144001))

(declare-fun d!144003 () Bool)

(assert (=> d!144003 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!112946 d!144003))

(declare-fun d!144005 () Bool)

(assert (=> d!144005 (= (array_inv!33273 _values!1303) (bvsge (size!44423 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!112946 d!144005))

(declare-fun d!144007 () Bool)

(assert (=> d!144007 (= (array_inv!33274 _keys!1571) (bvsge (size!44422 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!112946 d!144007))

(declare-fun d!144009 () Bool)

(declare-fun lt!593637 () Bool)

(assert (=> d!144009 (= lt!593637 (select (content!660 Nil!31134) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!762538 () Bool)

(assert (=> d!144009 (= lt!593637 e!762538)))

(declare-fun res!888325 () Bool)

(assert (=> d!144009 (=> (not res!888325) (not e!762538))))

(assert (=> d!144009 (= res!888325 ((_ is Cons!31133) Nil!31134))))

(assert (=> d!144009 (= (contains!8951 Nil!31134 #b0000000000000000000000000000000000000000000000000000000000000000) lt!593637)))

(declare-fun b!1338957 () Bool)

(declare-fun e!762539 () Bool)

(assert (=> b!1338957 (= e!762538 e!762539)))

(declare-fun res!888324 () Bool)

(assert (=> b!1338957 (=> res!888324 e!762539)))

(assert (=> b!1338957 (= res!888324 (= (h!32342 Nil!31134) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1338958 () Bool)

(assert (=> b!1338958 (= e!762539 (contains!8951 (t!45461 Nil!31134) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144009 res!888325) b!1338957))

(assert (= (and b!1338957 (not res!888324)) b!1338958))

(assert (=> d!144009 m!1226697))

(declare-fun m!1226719 () Bool)

(assert (=> d!144009 m!1226719))

(declare-fun m!1226721 () Bool)

(assert (=> b!1338958 m!1226721))

(assert (=> b!1338878 d!144009))

(declare-fun mapNonEmpty!57226 () Bool)

(declare-fun mapRes!57226 () Bool)

(declare-fun tp!108926 () Bool)

(declare-fun e!762544 () Bool)

(assert (=> mapNonEmpty!57226 (= mapRes!57226 (and tp!108926 e!762544))))

(declare-fun mapValue!57226 () ValueCell!17606)

(declare-fun mapKey!57226 () (_ BitVec 32))

(declare-fun mapRest!57226 () (Array (_ BitVec 32) ValueCell!17606))

(assert (=> mapNonEmpty!57226 (= mapRest!57217 (store mapRest!57226 mapKey!57226 mapValue!57226))))

(declare-fun mapIsEmpty!57226 () Bool)

(assert (=> mapIsEmpty!57226 mapRes!57226))

(declare-fun b!1338966 () Bool)

(declare-fun e!762545 () Bool)

(assert (=> b!1338966 (= e!762545 tp_is_empty!37009)))

(declare-fun b!1338965 () Bool)

(assert (=> b!1338965 (= e!762544 tp_is_empty!37009)))

(declare-fun condMapEmpty!57226 () Bool)

(declare-fun mapDefault!57226 () ValueCell!17606)

(assert (=> mapNonEmpty!57217 (= condMapEmpty!57226 (= mapRest!57217 ((as const (Array (_ BitVec 32) ValueCell!17606)) mapDefault!57226)))))

(assert (=> mapNonEmpty!57217 (= tp!108917 (and e!762545 mapRes!57226))))

(assert (= (and mapNonEmpty!57217 condMapEmpty!57226) mapIsEmpty!57226))

(assert (= (and mapNonEmpty!57217 (not condMapEmpty!57226)) mapNonEmpty!57226))

(assert (= (and mapNonEmpty!57226 ((_ is ValueCellFull!17606) mapValue!57226)) b!1338965))

(assert (= (and mapNonEmpty!57217 ((_ is ValueCellFull!17606) mapDefault!57226)) b!1338966))

(declare-fun m!1226723 () Bool)

(assert (=> mapNonEmpty!57226 m!1226723))

(check-sat (not b!1338947) (not d!143997) (not b!1338938) (not bm!65015) tp_is_empty!37009 (not d!144009) (not b!1338949) (not b!1338956) (not mapNonEmpty!57226) (not b!1338958) (not b!1338955))
(check-sat)
