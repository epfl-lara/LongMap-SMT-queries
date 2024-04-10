; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112932 () Bool)

(assert start!112932)

(declare-fun b!1338868 () Bool)

(declare-fun e!762456 () Bool)

(declare-fun tp_is_empty!37005 () Bool)

(assert (=> b!1338868 (= e!762456 tp_is_empty!37005)))

(declare-fun mapIsEmpty!57208 () Bool)

(declare-fun mapRes!57208 () Bool)

(assert (=> mapIsEmpty!57208 mapRes!57208))

(declare-fun b!1338870 () Bool)

(declare-fun res!888256 () Bool)

(declare-fun e!762455 () Bool)

(assert (=> b!1338870 (=> (not res!888256) (not e!762455))))

(declare-datatypes ((array!90872 0))(
  ( (array!90873 (arr!43894 (Array (_ BitVec 32) (_ BitVec 64))) (size!44444 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90872)

(assert (=> b!1338870 (= res!888256 (and (bvsle #b00000000000000000000000000000000 (size!44444 _keys!1571)) (bvslt (size!44444 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun b!1338871 () Bool)

(declare-fun res!888255 () Bool)

(assert (=> b!1338871 (=> (not res!888255) (not e!762455))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90872 (_ BitVec 32)) Bool)

(assert (=> b!1338871 (= res!888255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338872 () Bool)

(declare-datatypes ((List!31091 0))(
  ( (Nil!31088) (Cons!31087 (h!32296 (_ BitVec 64)) (t!45423 List!31091)) )
))
(declare-fun noDuplicate!2068 (List!31091) Bool)

(assert (=> b!1338872 (= e!762455 (not (noDuplicate!2068 Nil!31088)))))

(declare-fun mapNonEmpty!57208 () Bool)

(declare-fun tp!108907 () Bool)

(declare-fun e!762457 () Bool)

(assert (=> mapNonEmpty!57208 (= mapRes!57208 (and tp!108907 e!762457))))

(declare-fun mapKey!57208 () (_ BitVec 32))

(declare-datatypes ((V!54443 0))(
  ( (V!54444 (val!18577 Int)) )
))
(declare-datatypes ((ValueCell!17604 0))(
  ( (ValueCellFull!17604 (v!21224 V!54443)) (EmptyCell!17604) )
))
(declare-fun mapRest!57208 () (Array (_ BitVec 32) ValueCell!17604))

(declare-fun mapValue!57208 () ValueCell!17604)

(declare-datatypes ((array!90874 0))(
  ( (array!90875 (arr!43895 (Array (_ BitVec 32) ValueCell!17604)) (size!44445 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90874)

(assert (=> mapNonEmpty!57208 (= (arr!43895 _values!1303) (store mapRest!57208 mapKey!57208 mapValue!57208))))

(declare-fun b!1338869 () Bool)

(declare-fun res!888253 () Bool)

(assert (=> b!1338869 (=> (not res!888253) (not e!762455))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338869 (= res!888253 (and (= (size!44445 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44444 _keys!1571) (size!44445 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888254 () Bool)

(assert (=> start!112932 (=> (not res!888254) (not e!762455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112932 (= res!888254 (validMask!0 mask!1977))))

(assert (=> start!112932 e!762455))

(assert (=> start!112932 true))

(declare-fun e!762459 () Bool)

(declare-fun array_inv!33101 (array!90874) Bool)

(assert (=> start!112932 (and (array_inv!33101 _values!1303) e!762459)))

(declare-fun array_inv!33102 (array!90872) Bool)

(assert (=> start!112932 (array_inv!33102 _keys!1571)))

(declare-fun b!1338873 () Bool)

(assert (=> b!1338873 (= e!762459 (and e!762456 mapRes!57208))))

(declare-fun condMapEmpty!57208 () Bool)

(declare-fun mapDefault!57208 () ValueCell!17604)

(assert (=> b!1338873 (= condMapEmpty!57208 (= (arr!43895 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17604)) mapDefault!57208)))))

(declare-fun b!1338874 () Bool)

(assert (=> b!1338874 (= e!762457 tp_is_empty!37005)))

(assert (= (and start!112932 res!888254) b!1338869))

(assert (= (and b!1338869 res!888253) b!1338871))

(assert (= (and b!1338871 res!888255) b!1338870))

(assert (= (and b!1338870 res!888256) b!1338872))

(assert (= (and b!1338873 condMapEmpty!57208) mapIsEmpty!57208))

(assert (= (and b!1338873 (not condMapEmpty!57208)) mapNonEmpty!57208))

(get-info :version)

(assert (= (and mapNonEmpty!57208 ((_ is ValueCellFull!17604) mapValue!57208)) b!1338874))

(assert (= (and b!1338873 ((_ is ValueCellFull!17604) mapDefault!57208)) b!1338868))

(assert (= start!112932 b!1338873))

(declare-fun m!1227123 () Bool)

(assert (=> b!1338871 m!1227123))

(declare-fun m!1227125 () Bool)

(assert (=> b!1338872 m!1227125))

(declare-fun m!1227127 () Bool)

(assert (=> mapNonEmpty!57208 m!1227127))

(declare-fun m!1227129 () Bool)

(assert (=> start!112932 m!1227129))

(declare-fun m!1227131 () Bool)

(assert (=> start!112932 m!1227131))

(declare-fun m!1227133 () Bool)

(assert (=> start!112932 m!1227133))

(check-sat tp_is_empty!37005 (not start!112932) (not b!1338872) (not b!1338871) (not mapNonEmpty!57208))
(check-sat)
(get-model)

(declare-fun b!1338904 () Bool)

(declare-fun e!762483 () Bool)

(declare-fun e!762482 () Bool)

(assert (=> b!1338904 (= e!762483 e!762482)))

(declare-fun lt!593809 () (_ BitVec 64))

(assert (=> b!1338904 (= lt!593809 (select (arr!43894 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43987 0))(
  ( (Unit!43988) )
))
(declare-fun lt!593810 () Unit!43987)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90872 (_ BitVec 64) (_ BitVec 32)) Unit!43987)

(assert (=> b!1338904 (= lt!593810 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!593809 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338904 (arrayContainsKey!0 _keys!1571 lt!593809 #b00000000000000000000000000000000)))

(declare-fun lt!593808 () Unit!43987)

(assert (=> b!1338904 (= lt!593808 lt!593810)))

(declare-fun res!888273 () Bool)

(declare-datatypes ((SeekEntryResult!10054 0))(
  ( (MissingZero!10054 (index!42587 (_ BitVec 32))) (Found!10054 (index!42588 (_ BitVec 32))) (Intermediate!10054 (undefined!10866 Bool) (index!42589 (_ BitVec 32)) (x!119601 (_ BitVec 32))) (Undefined!10054) (MissingVacant!10054 (index!42590 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90872 (_ BitVec 32)) SeekEntryResult!10054)

(assert (=> b!1338904 (= res!888273 (= (seekEntryOrOpen!0 (select (arr!43894 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10054 #b00000000000000000000000000000000)))))

(assert (=> b!1338904 (=> (not res!888273) (not e!762482))))

(declare-fun b!1338905 () Bool)

(declare-fun call!65034 () Bool)

(assert (=> b!1338905 (= e!762482 call!65034)))

(declare-fun b!1338906 () Bool)

(declare-fun e!762481 () Bool)

(assert (=> b!1338906 (= e!762481 e!762483)))

(declare-fun c!126295 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338906 (= c!126295 (validKeyInArray!0 (select (arr!43894 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun bm!65031 () Bool)

(assert (=> bm!65031 (= call!65034 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun d!144101 () Bool)

(declare-fun res!888274 () Bool)

(assert (=> d!144101 (=> res!888274 e!762481)))

(assert (=> d!144101 (= res!888274 (bvsge #b00000000000000000000000000000000 (size!44444 _keys!1571)))))

(assert (=> d!144101 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!762481)))

(declare-fun b!1338907 () Bool)

(assert (=> b!1338907 (= e!762483 call!65034)))

(assert (= (and d!144101 (not res!888274)) b!1338906))

(assert (= (and b!1338906 c!126295) b!1338904))

(assert (= (and b!1338906 (not c!126295)) b!1338907))

(assert (= (and b!1338904 res!888273) b!1338905))

(assert (= (or b!1338905 b!1338907) bm!65031))

(declare-fun m!1227147 () Bool)

(assert (=> b!1338904 m!1227147))

(declare-fun m!1227149 () Bool)

(assert (=> b!1338904 m!1227149))

(declare-fun m!1227151 () Bool)

(assert (=> b!1338904 m!1227151))

(assert (=> b!1338904 m!1227147))

(declare-fun m!1227153 () Bool)

(assert (=> b!1338904 m!1227153))

(assert (=> b!1338906 m!1227147))

(assert (=> b!1338906 m!1227147))

(declare-fun m!1227155 () Bool)

(assert (=> b!1338906 m!1227155))

(declare-fun m!1227157 () Bool)

(assert (=> bm!65031 m!1227157))

(assert (=> b!1338871 d!144101))

(declare-fun d!144103 () Bool)

(assert (=> d!144103 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!112932 d!144103))

(declare-fun d!144105 () Bool)

(assert (=> d!144105 (= (array_inv!33101 _values!1303) (bvsge (size!44445 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!112932 d!144105))

(declare-fun d!144107 () Bool)

(assert (=> d!144107 (= (array_inv!33102 _keys!1571) (bvsge (size!44444 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!112932 d!144107))

(declare-fun d!144109 () Bool)

(declare-fun res!888279 () Bool)

(declare-fun e!762488 () Bool)

(assert (=> d!144109 (=> res!888279 e!762488)))

(assert (=> d!144109 (= res!888279 ((_ is Nil!31088) Nil!31088))))

(assert (=> d!144109 (= (noDuplicate!2068 Nil!31088) e!762488)))

(declare-fun b!1338912 () Bool)

(declare-fun e!762489 () Bool)

(assert (=> b!1338912 (= e!762488 e!762489)))

(declare-fun res!888280 () Bool)

(assert (=> b!1338912 (=> (not res!888280) (not e!762489))))

(declare-fun contains!8991 (List!31091 (_ BitVec 64)) Bool)

(assert (=> b!1338912 (= res!888280 (not (contains!8991 (t!45423 Nil!31088) (h!32296 Nil!31088))))))

(declare-fun b!1338913 () Bool)

(assert (=> b!1338913 (= e!762489 (noDuplicate!2068 (t!45423 Nil!31088)))))

(assert (= (and d!144109 (not res!888279)) b!1338912))

(assert (= (and b!1338912 res!888280) b!1338913))

(declare-fun m!1227159 () Bool)

(assert (=> b!1338912 m!1227159))

(declare-fun m!1227161 () Bool)

(assert (=> b!1338913 m!1227161))

(assert (=> b!1338872 d!144109))

(declare-fun condMapEmpty!57214 () Bool)

(declare-fun mapDefault!57214 () ValueCell!17604)

(assert (=> mapNonEmpty!57208 (= condMapEmpty!57214 (= mapRest!57208 ((as const (Array (_ BitVec 32) ValueCell!17604)) mapDefault!57214)))))

(declare-fun e!762494 () Bool)

(declare-fun mapRes!57214 () Bool)

(assert (=> mapNonEmpty!57208 (= tp!108907 (and e!762494 mapRes!57214))))

(declare-fun b!1338921 () Bool)

(assert (=> b!1338921 (= e!762494 tp_is_empty!37005)))

(declare-fun mapIsEmpty!57214 () Bool)

(assert (=> mapIsEmpty!57214 mapRes!57214))

(declare-fun b!1338920 () Bool)

(declare-fun e!762495 () Bool)

(assert (=> b!1338920 (= e!762495 tp_is_empty!37005)))

(declare-fun mapNonEmpty!57214 () Bool)

(declare-fun tp!108913 () Bool)

(assert (=> mapNonEmpty!57214 (= mapRes!57214 (and tp!108913 e!762495))))

(declare-fun mapValue!57214 () ValueCell!17604)

(declare-fun mapRest!57214 () (Array (_ BitVec 32) ValueCell!17604))

(declare-fun mapKey!57214 () (_ BitVec 32))

(assert (=> mapNonEmpty!57214 (= mapRest!57208 (store mapRest!57214 mapKey!57214 mapValue!57214))))

(assert (= (and mapNonEmpty!57208 condMapEmpty!57214) mapIsEmpty!57214))

(assert (= (and mapNonEmpty!57208 (not condMapEmpty!57214)) mapNonEmpty!57214))

(assert (= (and mapNonEmpty!57214 ((_ is ValueCellFull!17604) mapValue!57214)) b!1338920))

(assert (= (and mapNonEmpty!57208 ((_ is ValueCellFull!17604) mapDefault!57214)) b!1338921))

(declare-fun m!1227163 () Bool)

(assert (=> mapNonEmpty!57214 m!1227163))

(check-sat (not bm!65031) tp_is_empty!37005 (not b!1338913) (not b!1338906) (not b!1338912) (not mapNonEmpty!57214) (not b!1338904))
(check-sat)
