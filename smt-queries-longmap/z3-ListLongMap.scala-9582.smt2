; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113354 () Bool)

(assert start!113354)

(declare-fun b_free!31405 () Bool)

(declare-fun b_next!31405 () Bool)

(assert (=> start!113354 (= b_free!31405 (not b_next!31405))))

(declare-fun tp!110020 () Bool)

(declare-fun b_and!50645 () Bool)

(assert (=> start!113354 (= tp!110020 b_and!50645)))

(declare-fun b!1345244 () Bool)

(declare-fun res!892614 () Bool)

(declare-fun e!765520 () Bool)

(assert (=> b!1345244 (=> (not res!892614) (not e!765520))))

(declare-datatypes ((array!91593 0))(
  ( (array!91594 (arr!44253 (Array (_ BitVec 32) (_ BitVec 64))) (size!44805 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91593)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345244 (= res!892614 (validKeyInArray!0 (select (arr!44253 _keys!1571) from!1960)))))

(declare-fun b!1345245 () Bool)

(declare-fun res!892621 () Bool)

(declare-fun e!765522 () Bool)

(assert (=> b!1345245 (=> (not res!892621) (not e!765522))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1345245 (= res!892621 (not (= k0!1142 (select (arr!44253 _keys!1571) from!1960))))))

(declare-fun b!1345246 () Bool)

(declare-fun e!765521 () Bool)

(declare-fun e!765519 () Bool)

(declare-fun mapRes!57814 () Bool)

(assert (=> b!1345246 (= e!765521 (and e!765519 mapRes!57814))))

(declare-fun condMapEmpty!57814 () Bool)

(declare-datatypes ((V!54977 0))(
  ( (V!54978 (val!18777 Int)) )
))
(declare-datatypes ((ValueCell!17804 0))(
  ( (ValueCellFull!17804 (v!21424 V!54977)) (EmptyCell!17804) )
))
(declare-datatypes ((array!91595 0))(
  ( (array!91596 (arr!44254 (Array (_ BitVec 32) ValueCell!17804)) (size!44806 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91595)

(declare-fun mapDefault!57814 () ValueCell!17804)

(assert (=> b!1345246 (= condMapEmpty!57814 (= (arr!44254 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17804)) mapDefault!57814)))))

(declare-fun res!892623 () Bool)

(assert (=> start!113354 (=> (not res!892623) (not e!765520))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113354 (= res!892623 (validMask!0 mask!1977))))

(assert (=> start!113354 e!765520))

(declare-fun tp_is_empty!37405 () Bool)

(assert (=> start!113354 tp_is_empty!37405))

(assert (=> start!113354 true))

(declare-fun array_inv!33543 (array!91593) Bool)

(assert (=> start!113354 (array_inv!33543 _keys!1571)))

(declare-fun array_inv!33544 (array!91595) Bool)

(assert (=> start!113354 (and (array_inv!33544 _values!1303) e!765521)))

(assert (=> start!113354 tp!110020))

(declare-fun b!1345247 () Bool)

(declare-fun res!892615 () Bool)

(assert (=> b!1345247 (=> (not res!892615) (not e!765520))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345247 (= res!892615 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44805 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345248 () Bool)

(declare-fun res!892617 () Bool)

(assert (=> b!1345248 (=> (not res!892617) (not e!765520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91593 (_ BitVec 32)) Bool)

(assert (=> b!1345248 (= res!892617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345249 () Bool)

(declare-fun e!765524 () Bool)

(assert (=> b!1345249 (= e!765524 tp_is_empty!37405)))

(declare-fun b!1345250 () Bool)

(declare-fun res!892619 () Bool)

(assert (=> b!1345250 (=> (not res!892619) (not e!765520))))

(declare-fun minValue!1245 () V!54977)

(declare-fun zeroValue!1245 () V!54977)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24266 0))(
  ( (tuple2!24267 (_1!12144 (_ BitVec 64)) (_2!12144 V!54977)) )
))
(declare-datatypes ((List!31403 0))(
  ( (Nil!31400) (Cons!31399 (h!32608 tuple2!24266) (t!45957 List!31403)) )
))
(declare-datatypes ((ListLongMap!21923 0))(
  ( (ListLongMap!21924 (toList!10977 List!31403)) )
))
(declare-fun contains!9082 (ListLongMap!21923 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5819 (array!91593 array!91595 (_ BitVec 32) (_ BitVec 32) V!54977 V!54977 (_ BitVec 32) Int) ListLongMap!21923)

(assert (=> b!1345250 (= res!892619 (contains!9082 (getCurrentListMap!5819 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345251 () Bool)

(declare-fun res!892624 () Bool)

(assert (=> b!1345251 (=> (not res!892624) (not e!765520))))

(assert (=> b!1345251 (= res!892624 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!57814 () Bool)

(declare-fun tp!110021 () Bool)

(assert (=> mapNonEmpty!57814 (= mapRes!57814 (and tp!110021 e!765524))))

(declare-fun mapRest!57814 () (Array (_ BitVec 32) ValueCell!17804))

(declare-fun mapValue!57814 () ValueCell!17804)

(declare-fun mapKey!57814 () (_ BitVec 32))

(assert (=> mapNonEmpty!57814 (= (arr!44254 _values!1303) (store mapRest!57814 mapKey!57814 mapValue!57814))))

(declare-fun b!1345252 () Bool)

(assert (=> b!1345252 (= e!765522 (not true))))

(declare-fun lt!595140 () ListLongMap!21923)

(assert (=> b!1345252 (contains!9082 lt!595140 k0!1142)))

(declare-fun lt!595139 () V!54977)

(declare-datatypes ((Unit!43946 0))(
  ( (Unit!43947) )
))
(declare-fun lt!595138 () Unit!43946)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!391 ((_ BitVec 64) (_ BitVec 64) V!54977 ListLongMap!21923) Unit!43946)

(assert (=> b!1345252 (= lt!595138 (lemmaInListMapAfterAddingDiffThenInBefore!391 k0!1142 (select (arr!44253 _keys!1571) from!1960) lt!595139 lt!595140))))

(declare-fun b!1345253 () Bool)

(assert (=> b!1345253 (= e!765520 e!765522)))

(declare-fun res!892616 () Bool)

(assert (=> b!1345253 (=> (not res!892616) (not e!765522))))

(declare-fun +!4855 (ListLongMap!21923 tuple2!24266) ListLongMap!21923)

(assert (=> b!1345253 (= res!892616 (contains!9082 (+!4855 lt!595140 (tuple2!24267 (select (arr!44253 _keys!1571) from!1960) lt!595139)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6498 (array!91593 array!91595 (_ BitVec 32) (_ BitVec 32) V!54977 V!54977 (_ BitVec 32) Int) ListLongMap!21923)

(assert (=> b!1345253 (= lt!595140 (getCurrentListMapNoExtraKeys!6498 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22363 (ValueCell!17804 V!54977) V!54977)

(declare-fun dynLambda!3785 (Int (_ BitVec 64)) V!54977)

(assert (=> b!1345253 (= lt!595139 (get!22363 (select (arr!44254 _values!1303) from!1960) (dynLambda!3785 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57814 () Bool)

(assert (=> mapIsEmpty!57814 mapRes!57814))

(declare-fun b!1345254 () Bool)

(declare-fun res!892618 () Bool)

(assert (=> b!1345254 (=> (not res!892618) (not e!765520))))

(assert (=> b!1345254 (= res!892618 (and (= (size!44806 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44805 _keys!1571) (size!44806 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345255 () Bool)

(declare-fun res!892620 () Bool)

(assert (=> b!1345255 (=> (not res!892620) (not e!765520))))

(declare-datatypes ((List!31404 0))(
  ( (Nil!31401) (Cons!31400 (h!32609 (_ BitVec 64)) (t!45958 List!31404)) )
))
(declare-fun arrayNoDuplicates!0 (array!91593 (_ BitVec 32) List!31404) Bool)

(assert (=> b!1345255 (= res!892620 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31401))))

(declare-fun b!1345256 () Bool)

(declare-fun res!892622 () Bool)

(assert (=> b!1345256 (=> (not res!892622) (not e!765520))))

(assert (=> b!1345256 (= res!892622 (not (= (select (arr!44253 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345257 () Bool)

(assert (=> b!1345257 (= e!765519 tp_is_empty!37405)))

(assert (= (and start!113354 res!892623) b!1345254))

(assert (= (and b!1345254 res!892618) b!1345248))

(assert (= (and b!1345248 res!892617) b!1345255))

(assert (= (and b!1345255 res!892620) b!1345247))

(assert (= (and b!1345247 res!892615) b!1345250))

(assert (= (and b!1345250 res!892619) b!1345256))

(assert (= (and b!1345256 res!892622) b!1345244))

(assert (= (and b!1345244 res!892614) b!1345251))

(assert (= (and b!1345251 res!892624) b!1345253))

(assert (= (and b!1345253 res!892616) b!1345245))

(assert (= (and b!1345245 res!892621) b!1345252))

(assert (= (and b!1345246 condMapEmpty!57814) mapIsEmpty!57814))

(assert (= (and b!1345246 (not condMapEmpty!57814)) mapNonEmpty!57814))

(get-info :version)

(assert (= (and mapNonEmpty!57814 ((_ is ValueCellFull!17804) mapValue!57814)) b!1345249))

(assert (= (and b!1345246 ((_ is ValueCellFull!17804) mapDefault!57814)) b!1345257))

(assert (= start!113354 b!1345246))

(declare-fun b_lambda!24517 () Bool)

(assert (=> (not b_lambda!24517) (not b!1345253)))

(declare-fun t!45956 () Bool)

(declare-fun tb!12357 () Bool)

(assert (=> (and start!113354 (= defaultEntry!1306 defaultEntry!1306) t!45956) tb!12357))

(declare-fun result!25813 () Bool)

(assert (=> tb!12357 (= result!25813 tp_is_empty!37405)))

(assert (=> b!1345253 t!45956))

(declare-fun b_and!50647 () Bool)

(assert (= b_and!50645 (and (=> t!45956 result!25813) b_and!50647)))

(declare-fun m!1232215 () Bool)

(assert (=> b!1345244 m!1232215))

(assert (=> b!1345244 m!1232215))

(declare-fun m!1232217 () Bool)

(assert (=> b!1345244 m!1232217))

(declare-fun m!1232219 () Bool)

(assert (=> mapNonEmpty!57814 m!1232219))

(assert (=> b!1345256 m!1232215))

(declare-fun m!1232221 () Bool)

(assert (=> b!1345248 m!1232221))

(assert (=> b!1345245 m!1232215))

(declare-fun m!1232223 () Bool)

(assert (=> start!113354 m!1232223))

(declare-fun m!1232225 () Bool)

(assert (=> start!113354 m!1232225))

(declare-fun m!1232227 () Bool)

(assert (=> start!113354 m!1232227))

(declare-fun m!1232229 () Bool)

(assert (=> b!1345252 m!1232229))

(assert (=> b!1345252 m!1232215))

(assert (=> b!1345252 m!1232215))

(declare-fun m!1232231 () Bool)

(assert (=> b!1345252 m!1232231))

(declare-fun m!1232233 () Bool)

(assert (=> b!1345250 m!1232233))

(assert (=> b!1345250 m!1232233))

(declare-fun m!1232235 () Bool)

(assert (=> b!1345250 m!1232235))

(declare-fun m!1232237 () Bool)

(assert (=> b!1345255 m!1232237))

(declare-fun m!1232239 () Bool)

(assert (=> b!1345253 m!1232239))

(declare-fun m!1232241 () Bool)

(assert (=> b!1345253 m!1232241))

(declare-fun m!1232243 () Bool)

(assert (=> b!1345253 m!1232243))

(declare-fun m!1232245 () Bool)

(assert (=> b!1345253 m!1232245))

(assert (=> b!1345253 m!1232241))

(declare-fun m!1232247 () Bool)

(assert (=> b!1345253 m!1232247))

(declare-fun m!1232249 () Bool)

(assert (=> b!1345253 m!1232249))

(assert (=> b!1345253 m!1232243))

(assert (=> b!1345253 m!1232215))

(assert (=> b!1345253 m!1232247))

(check-sat (not b!1345248) (not b_next!31405) (not b!1345252) b_and!50647 (not b!1345250) (not start!113354) (not b_lambda!24517) tp_is_empty!37405 (not b!1345255) (not b!1345253) (not mapNonEmpty!57814) (not b!1345244))
(check-sat b_and!50647 (not b_next!31405))
