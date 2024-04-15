; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113186 () Bool)

(assert start!113186)

(declare-fun b_free!31237 () Bool)

(declare-fun b_next!31237 () Bool)

(assert (=> start!113186 (= b_free!31237 (not b_next!31237))))

(declare-fun tp!109516 () Bool)

(declare-fun b_and!50363 () Bool)

(assert (=> start!113186 (= tp!109516 b_and!50363)))

(declare-fun b!1342327 () Bool)

(declare-fun e!764225 () Bool)

(declare-fun tp_is_empty!37237 () Bool)

(assert (=> b!1342327 (= e!764225 tp_is_empty!37237)))

(declare-fun b!1342328 () Bool)

(declare-fun res!890572 () Bool)

(declare-fun e!764222 () Bool)

(assert (=> b!1342328 (=> (not res!890572) (not e!764222))))

(declare-datatypes ((V!54753 0))(
  ( (V!54754 (val!18693 Int)) )
))
(declare-fun minValue!1245 () V!54753)

(declare-datatypes ((array!91267 0))(
  ( (array!91268 (arr!44090 (Array (_ BitVec 32) (_ BitVec 64))) (size!44642 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91267)

(declare-fun zeroValue!1245 () V!54753)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17720 0))(
  ( (ValueCellFull!17720 (v!21340 V!54753)) (EmptyCell!17720) )
))
(declare-datatypes ((array!91269 0))(
  ( (array!91270 (arr!44091 (Array (_ BitVec 32) ValueCell!17720)) (size!44643 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91269)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((tuple2!24136 0))(
  ( (tuple2!24137 (_1!12079 (_ BitVec 64)) (_2!12079 V!54753)) )
))
(declare-datatypes ((List!31281 0))(
  ( (Nil!31278) (Cons!31277 (h!32486 tuple2!24136) (t!45721 List!31281)) )
))
(declare-datatypes ((ListLongMap!21793 0))(
  ( (ListLongMap!21794 (toList!10912 List!31281)) )
))
(declare-fun contains!9017 (ListLongMap!21793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5763 (array!91267 array!91269 (_ BitVec 32) (_ BitVec 32) V!54753 V!54753 (_ BitVec 32) Int) ListLongMap!21793)

(assert (=> b!1342328 (= res!890572 (contains!9017 (getCurrentListMap!5763 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342329 () Bool)

(declare-fun e!764223 () Bool)

(declare-fun mapRes!57562 () Bool)

(assert (=> b!1342329 (= e!764223 (and e!764225 mapRes!57562))))

(declare-fun condMapEmpty!57562 () Bool)

(declare-fun mapDefault!57562 () ValueCell!17720)

(assert (=> b!1342329 (= condMapEmpty!57562 (= (arr!44091 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17720)) mapDefault!57562)))))

(declare-fun b!1342330 () Bool)

(declare-fun res!890573 () Bool)

(assert (=> b!1342330 (=> (not res!890573) (not e!764222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342330 (= res!890573 (validKeyInArray!0 (select (arr!44090 _keys!1571) from!1960)))))

(declare-fun b!1342331 () Bool)

(declare-fun res!890568 () Bool)

(assert (=> b!1342331 (=> (not res!890568) (not e!764222))))

(assert (=> b!1342331 (= res!890568 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44642 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342332 () Bool)

(declare-fun res!890575 () Bool)

(assert (=> b!1342332 (=> (not res!890575) (not e!764222))))

(assert (=> b!1342332 (= res!890575 (not (= (select (arr!44090 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57562 () Bool)

(assert (=> mapIsEmpty!57562 mapRes!57562))

(declare-fun b!1342333 () Bool)

(assert (=> b!1342333 (= e!764222 (not true))))

(declare-fun lt!594281 () ListLongMap!21793)

(assert (=> b!1342333 (contains!9017 lt!594281 k0!1142)))

(declare-datatypes ((Unit!43872 0))(
  ( (Unit!43873) )
))
(declare-fun lt!594279 () Unit!43872)

(declare-fun lt!594278 () V!54753)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!354 ((_ BitVec 64) (_ BitVec 64) V!54753 ListLongMap!21793) Unit!43872)

(assert (=> b!1342333 (= lt!594279 (lemmaInListMapAfterAddingDiffThenInBefore!354 k0!1142 (select (arr!44090 _keys!1571) from!1960) lt!594278 lt!594281))))

(declare-fun lt!594280 () ListLongMap!21793)

(assert (=> b!1342333 (contains!9017 lt!594280 k0!1142)))

(declare-fun lt!594282 () Unit!43872)

(assert (=> b!1342333 (= lt!594282 (lemmaInListMapAfterAddingDiffThenInBefore!354 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594280))))

(declare-fun +!4815 (ListLongMap!21793 tuple2!24136) ListLongMap!21793)

(assert (=> b!1342333 (= lt!594280 (+!4815 lt!594281 (tuple2!24137 (select (arr!44090 _keys!1571) from!1960) lt!594278)))))

(declare-fun get!22267 (ValueCell!17720 V!54753) V!54753)

(declare-fun dynLambda!3745 (Int (_ BitVec 64)) V!54753)

(assert (=> b!1342333 (= lt!594278 (get!22267 (select (arr!44091 _values!1303) from!1960) (dynLambda!3745 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6458 (array!91267 array!91269 (_ BitVec 32) (_ BitVec 32) V!54753 V!54753 (_ BitVec 32) Int) ListLongMap!21793)

(assert (=> b!1342333 (= lt!594281 (getCurrentListMapNoExtraKeys!6458 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun res!890571 () Bool)

(assert (=> start!113186 (=> (not res!890571) (not e!764222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113186 (= res!890571 (validMask!0 mask!1977))))

(assert (=> start!113186 e!764222))

(assert (=> start!113186 tp_is_empty!37237))

(assert (=> start!113186 true))

(declare-fun array_inv!33429 (array!91267) Bool)

(assert (=> start!113186 (array_inv!33429 _keys!1571)))

(declare-fun array_inv!33430 (array!91269) Bool)

(assert (=> start!113186 (and (array_inv!33430 _values!1303) e!764223)))

(assert (=> start!113186 tp!109516))

(declare-fun b!1342334 () Bool)

(declare-fun res!890570 () Bool)

(assert (=> b!1342334 (=> (not res!890570) (not e!764222))))

(assert (=> b!1342334 (= res!890570 (and (= (size!44643 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44642 _keys!1571) (size!44643 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342335 () Bool)

(declare-fun e!764224 () Bool)

(assert (=> b!1342335 (= e!764224 tp_is_empty!37237)))

(declare-fun mapNonEmpty!57562 () Bool)

(declare-fun tp!109517 () Bool)

(assert (=> mapNonEmpty!57562 (= mapRes!57562 (and tp!109517 e!764224))))

(declare-fun mapRest!57562 () (Array (_ BitVec 32) ValueCell!17720))

(declare-fun mapValue!57562 () ValueCell!17720)

(declare-fun mapKey!57562 () (_ BitVec 32))

(assert (=> mapNonEmpty!57562 (= (arr!44091 _values!1303) (store mapRest!57562 mapKey!57562 mapValue!57562))))

(declare-fun b!1342336 () Bool)

(declare-fun res!890567 () Bool)

(assert (=> b!1342336 (=> (not res!890567) (not e!764222))))

(assert (=> b!1342336 (= res!890567 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342337 () Bool)

(declare-fun res!890574 () Bool)

(assert (=> b!1342337 (=> (not res!890574) (not e!764222))))

(declare-datatypes ((List!31282 0))(
  ( (Nil!31279) (Cons!31278 (h!32487 (_ BitVec 64)) (t!45722 List!31282)) )
))
(declare-fun arrayNoDuplicates!0 (array!91267 (_ BitVec 32) List!31282) Bool)

(assert (=> b!1342337 (= res!890574 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31279))))

(declare-fun b!1342338 () Bool)

(declare-fun res!890569 () Bool)

(assert (=> b!1342338 (=> (not res!890569) (not e!764222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91267 (_ BitVec 32)) Bool)

(assert (=> b!1342338 (= res!890569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113186 res!890571) b!1342334))

(assert (= (and b!1342334 res!890570) b!1342338))

(assert (= (and b!1342338 res!890569) b!1342337))

(assert (= (and b!1342337 res!890574) b!1342331))

(assert (= (and b!1342331 res!890568) b!1342328))

(assert (= (and b!1342328 res!890572) b!1342332))

(assert (= (and b!1342332 res!890575) b!1342330))

(assert (= (and b!1342330 res!890573) b!1342336))

(assert (= (and b!1342336 res!890567) b!1342333))

(assert (= (and b!1342329 condMapEmpty!57562) mapIsEmpty!57562))

(assert (= (and b!1342329 (not condMapEmpty!57562)) mapNonEmpty!57562))

(get-info :version)

(assert (= (and mapNonEmpty!57562 ((_ is ValueCellFull!17720) mapValue!57562)) b!1342335))

(assert (= (and b!1342329 ((_ is ValueCellFull!17720) mapDefault!57562)) b!1342327))

(assert (= start!113186 b!1342329))

(declare-fun b_lambda!24403 () Bool)

(assert (=> (not b_lambda!24403) (not b!1342333)))

(declare-fun t!45720 () Bool)

(declare-fun tb!12243 () Bool)

(assert (=> (and start!113186 (= defaultEntry!1306 defaultEntry!1306) t!45720) tb!12243))

(declare-fun result!25585 () Bool)

(assert (=> tb!12243 (= result!25585 tp_is_empty!37237)))

(assert (=> b!1342333 t!45720))

(declare-fun b_and!50365 () Bool)

(assert (= b_and!50363 (and (=> t!45720 result!25585) b_and!50365)))

(declare-fun m!1229503 () Bool)

(assert (=> b!1342332 m!1229503))

(declare-fun m!1229505 () Bool)

(assert (=> b!1342333 m!1229505))

(declare-fun m!1229507 () Bool)

(assert (=> b!1342333 m!1229507))

(declare-fun m!1229509 () Bool)

(assert (=> b!1342333 m!1229509))

(declare-fun m!1229511 () Bool)

(assert (=> b!1342333 m!1229511))

(assert (=> b!1342333 m!1229507))

(assert (=> b!1342333 m!1229509))

(declare-fun m!1229513 () Bool)

(assert (=> b!1342333 m!1229513))

(assert (=> b!1342333 m!1229503))

(declare-fun m!1229515 () Bool)

(assert (=> b!1342333 m!1229515))

(declare-fun m!1229517 () Bool)

(assert (=> b!1342333 m!1229517))

(declare-fun m!1229519 () Bool)

(assert (=> b!1342333 m!1229519))

(assert (=> b!1342333 m!1229503))

(declare-fun m!1229521 () Bool)

(assert (=> b!1342333 m!1229521))

(assert (=> b!1342330 m!1229503))

(assert (=> b!1342330 m!1229503))

(declare-fun m!1229523 () Bool)

(assert (=> b!1342330 m!1229523))

(declare-fun m!1229525 () Bool)

(assert (=> start!113186 m!1229525))

(declare-fun m!1229527 () Bool)

(assert (=> start!113186 m!1229527))

(declare-fun m!1229529 () Bool)

(assert (=> start!113186 m!1229529))

(declare-fun m!1229531 () Bool)

(assert (=> b!1342328 m!1229531))

(assert (=> b!1342328 m!1229531))

(declare-fun m!1229533 () Bool)

(assert (=> b!1342328 m!1229533))

(declare-fun m!1229535 () Bool)

(assert (=> mapNonEmpty!57562 m!1229535))

(declare-fun m!1229537 () Bool)

(assert (=> b!1342338 m!1229537))

(declare-fun m!1229539 () Bool)

(assert (=> b!1342337 m!1229539))

(check-sat (not b_lambda!24403) (not b!1342330) (not start!113186) b_and!50365 (not b_next!31237) (not b!1342338) (not b!1342333) (not mapNonEmpty!57562) (not b!1342337) (not b!1342328) tp_is_empty!37237)
(check-sat b_and!50365 (not b_next!31237))
