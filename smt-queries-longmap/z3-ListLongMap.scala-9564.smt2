; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113248 () Bool)

(assert start!113248)

(declare-fun b_free!31299 () Bool)

(declare-fun b_next!31299 () Bool)

(assert (=> start!113248 (= b_free!31299 (not b_next!31299))))

(declare-fun tp!109702 () Bool)

(declare-fun b_and!50505 () Bool)

(assert (=> start!113248 (= tp!109702 b_and!50505)))

(declare-fun b!1343575 () Bool)

(declare-fun res!891440 () Bool)

(declare-fun e!764723 () Bool)

(assert (=> b!1343575 (=> (not res!891440) (not e!764723))))

(declare-datatypes ((V!54835 0))(
  ( (V!54836 (val!18724 Int)) )
))
(declare-fun minValue!1245 () V!54835)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91442 0))(
  ( (array!91443 (arr!44177 (Array (_ BitVec 32) (_ BitVec 64))) (size!44727 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91442)

(declare-fun zeroValue!1245 () V!54835)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17751 0))(
  ( (ValueCellFull!17751 (v!21372 V!54835)) (EmptyCell!17751) )
))
(declare-datatypes ((array!91444 0))(
  ( (array!91445 (arr!44178 (Array (_ BitVec 32) ValueCell!17751)) (size!44728 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91444)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((tuple2!24122 0))(
  ( (tuple2!24123 (_1!12072 (_ BitVec 64)) (_2!12072 V!54835)) )
))
(declare-datatypes ((List!31279 0))(
  ( (Nil!31276) (Cons!31275 (h!32484 tuple2!24122) (t!45789 List!31279)) )
))
(declare-datatypes ((ListLongMap!21779 0))(
  ( (ListLongMap!21780 (toList!10905 List!31279)) )
))
(declare-fun contains!9081 (ListLongMap!21779 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5864 (array!91442 array!91444 (_ BitVec 32) (_ BitVec 32) V!54835 V!54835 (_ BitVec 32) Int) ListLongMap!21779)

(assert (=> b!1343575 (= res!891440 (contains!9081 (getCurrentListMap!5864 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343576 () Bool)

(declare-fun res!891433 () Bool)

(assert (=> b!1343576 (=> (not res!891433) (not e!764723))))

(assert (=> b!1343576 (= res!891433 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343577 () Bool)

(declare-fun e!764719 () Bool)

(declare-fun e!764721 () Bool)

(declare-fun mapRes!57655 () Bool)

(assert (=> b!1343577 (= e!764719 (and e!764721 mapRes!57655))))

(declare-fun condMapEmpty!57655 () Bool)

(declare-fun mapDefault!57655 () ValueCell!17751)

(assert (=> b!1343577 (= condMapEmpty!57655 (= (arr!44178 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17751)) mapDefault!57655)))))

(declare-fun b!1343578 () Bool)

(declare-fun res!891438 () Bool)

(assert (=> b!1343578 (=> (not res!891438) (not e!764723))))

(declare-datatypes ((List!31280 0))(
  ( (Nil!31277) (Cons!31276 (h!32485 (_ BitVec 64)) (t!45790 List!31280)) )
))
(declare-fun arrayNoDuplicates!0 (array!91442 (_ BitVec 32) List!31280) Bool)

(assert (=> b!1343578 (= res!891438 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31277))))

(declare-fun mapNonEmpty!57655 () Bool)

(declare-fun tp!109701 () Bool)

(declare-fun e!764722 () Bool)

(assert (=> mapNonEmpty!57655 (= mapRes!57655 (and tp!109701 e!764722))))

(declare-fun mapRest!57655 () (Array (_ BitVec 32) ValueCell!17751))

(declare-fun mapKey!57655 () (_ BitVec 32))

(declare-fun mapValue!57655 () ValueCell!17751)

(assert (=> mapNonEmpty!57655 (= (arr!44178 _values!1303) (store mapRest!57655 mapKey!57655 mapValue!57655))))

(declare-fun b!1343579 () Bool)

(declare-fun res!891441 () Bool)

(assert (=> b!1343579 (=> (not res!891441) (not e!764723))))

(assert (=> b!1343579 (= res!891441 (not (= (select (arr!44177 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!891434 () Bool)

(assert (=> start!113248 (=> (not res!891434) (not e!764723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113248 (= res!891434 (validMask!0 mask!1977))))

(assert (=> start!113248 e!764723))

(declare-fun tp_is_empty!37299 () Bool)

(assert (=> start!113248 tp_is_empty!37299))

(assert (=> start!113248 true))

(declare-fun array_inv!33299 (array!91442) Bool)

(assert (=> start!113248 (array_inv!33299 _keys!1571)))

(declare-fun array_inv!33300 (array!91444) Bool)

(assert (=> start!113248 (and (array_inv!33300 _values!1303) e!764719)))

(assert (=> start!113248 tp!109702))

(declare-fun b!1343580 () Bool)

(declare-fun res!891435 () Bool)

(assert (=> b!1343580 (=> (not res!891435) (not e!764723))))

(assert (=> b!1343580 (= res!891435 (and (= (size!44728 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44727 _keys!1571) (size!44728 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343581 () Bool)

(assert (=> b!1343581 (= e!764722 tp_is_empty!37299)))

(declare-fun b!1343582 () Bool)

(declare-fun res!891439 () Bool)

(assert (=> b!1343582 (=> (not res!891439) (not e!764723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91442 (_ BitVec 32)) Bool)

(assert (=> b!1343582 (= res!891439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57655 () Bool)

(assert (=> mapIsEmpty!57655 mapRes!57655))

(declare-fun b!1343583 () Bool)

(assert (=> b!1343583 (= e!764723 (not true))))

(declare-fun lt!594991 () ListLongMap!21779)

(declare-fun +!4813 (ListLongMap!21779 tuple2!24122) ListLongMap!21779)

(assert (=> b!1343583 (contains!9081 (+!4813 lt!594991 (tuple2!24123 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44103 0))(
  ( (Unit!44104) )
))
(declare-fun lt!594988 () Unit!44103)

(declare-fun addStillContains!1206 (ListLongMap!21779 (_ BitVec 64) V!54835 (_ BitVec 64)) Unit!44103)

(assert (=> b!1343583 (= lt!594988 (addStillContains!1206 lt!594991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343583 (contains!9081 lt!594991 k0!1142)))

(declare-fun lt!594992 () Unit!44103)

(declare-fun lt!594993 () V!54835)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!382 ((_ BitVec 64) (_ BitVec 64) V!54835 ListLongMap!21779) Unit!44103)

(assert (=> b!1343583 (= lt!594992 (lemmaInListMapAfterAddingDiffThenInBefore!382 k0!1142 (select (arr!44177 _keys!1571) from!1960) lt!594993 lt!594991))))

(declare-fun lt!594990 () ListLongMap!21779)

(assert (=> b!1343583 (contains!9081 lt!594990 k0!1142)))

(declare-fun lt!594989 () Unit!44103)

(assert (=> b!1343583 (= lt!594989 (lemmaInListMapAfterAddingDiffThenInBefore!382 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594990))))

(assert (=> b!1343583 (= lt!594990 (+!4813 lt!594991 (tuple2!24123 (select (arr!44177 _keys!1571) from!1960) lt!594993)))))

(declare-fun get!22318 (ValueCell!17751 V!54835) V!54835)

(declare-fun dynLambda!3752 (Int (_ BitVec 64)) V!54835)

(assert (=> b!1343583 (= lt!594993 (get!22318 (select (arr!44178 _values!1303) from!1960) (dynLambda!3752 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6455 (array!91442 array!91444 (_ BitVec 32) (_ BitVec 32) V!54835 V!54835 (_ BitVec 32) Int) ListLongMap!21779)

(assert (=> b!1343583 (= lt!594991 (getCurrentListMapNoExtraKeys!6455 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343584 () Bool)

(assert (=> b!1343584 (= e!764721 tp_is_empty!37299)))

(declare-fun b!1343585 () Bool)

(declare-fun res!891437 () Bool)

(assert (=> b!1343585 (=> (not res!891437) (not e!764723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343585 (= res!891437 (validKeyInArray!0 (select (arr!44177 _keys!1571) from!1960)))))

(declare-fun b!1343586 () Bool)

(declare-fun res!891436 () Bool)

(assert (=> b!1343586 (=> (not res!891436) (not e!764723))))

(assert (=> b!1343586 (= res!891436 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44727 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113248 res!891434) b!1343580))

(assert (= (and b!1343580 res!891435) b!1343582))

(assert (= (and b!1343582 res!891439) b!1343578))

(assert (= (and b!1343578 res!891438) b!1343586))

(assert (= (and b!1343586 res!891436) b!1343575))

(assert (= (and b!1343575 res!891440) b!1343579))

(assert (= (and b!1343579 res!891441) b!1343585))

(assert (= (and b!1343585 res!891437) b!1343576))

(assert (= (and b!1343576 res!891433) b!1343583))

(assert (= (and b!1343577 condMapEmpty!57655) mapIsEmpty!57655))

(assert (= (and b!1343577 (not condMapEmpty!57655)) mapNonEmpty!57655))

(get-info :version)

(assert (= (and mapNonEmpty!57655 ((_ is ValueCellFull!17751) mapValue!57655)) b!1343581))

(assert (= (and b!1343577 ((_ is ValueCellFull!17751) mapDefault!57655)) b!1343584))

(assert (= start!113248 b!1343577))

(declare-fun b_lambda!24475 () Bool)

(assert (=> (not b_lambda!24475) (not b!1343583)))

(declare-fun t!45788 () Bool)

(declare-fun tb!12313 () Bool)

(assert (=> (and start!113248 (= defaultEntry!1306 defaultEntry!1306) t!45788) tb!12313))

(declare-fun result!25717 () Bool)

(assert (=> tb!12313 (= result!25717 tp_is_empty!37299)))

(assert (=> b!1343583 t!45788))

(declare-fun b_and!50507 () Bool)

(assert (= b_and!50505 (and (=> t!45788 result!25717) b_and!50507)))

(declare-fun m!1231311 () Bool)

(assert (=> b!1343585 m!1231311))

(assert (=> b!1343585 m!1231311))

(declare-fun m!1231313 () Bool)

(assert (=> b!1343585 m!1231313))

(declare-fun m!1231315 () Bool)

(assert (=> mapNonEmpty!57655 m!1231315))

(declare-fun m!1231317 () Bool)

(assert (=> start!113248 m!1231317))

(declare-fun m!1231319 () Bool)

(assert (=> start!113248 m!1231319))

(declare-fun m!1231321 () Bool)

(assert (=> start!113248 m!1231321))

(declare-fun m!1231323 () Bool)

(assert (=> b!1343575 m!1231323))

(assert (=> b!1343575 m!1231323))

(declare-fun m!1231325 () Bool)

(assert (=> b!1343575 m!1231325))

(declare-fun m!1231327 () Bool)

(assert (=> b!1343578 m!1231327))

(declare-fun m!1231329 () Bool)

(assert (=> b!1343583 m!1231329))

(declare-fun m!1231331 () Bool)

(assert (=> b!1343583 m!1231331))

(declare-fun m!1231333 () Bool)

(assert (=> b!1343583 m!1231333))

(declare-fun m!1231335 () Bool)

(assert (=> b!1343583 m!1231335))

(declare-fun m!1231337 () Bool)

(assert (=> b!1343583 m!1231337))

(declare-fun m!1231339 () Bool)

(assert (=> b!1343583 m!1231339))

(assert (=> b!1343583 m!1231329))

(assert (=> b!1343583 m!1231311))

(declare-fun m!1231341 () Bool)

(assert (=> b!1343583 m!1231341))

(declare-fun m!1231343 () Bool)

(assert (=> b!1343583 m!1231343))

(declare-fun m!1231345 () Bool)

(assert (=> b!1343583 m!1231345))

(declare-fun m!1231347 () Bool)

(assert (=> b!1343583 m!1231347))

(assert (=> b!1343583 m!1231337))

(declare-fun m!1231349 () Bool)

(assert (=> b!1343583 m!1231349))

(assert (=> b!1343583 m!1231347))

(assert (=> b!1343583 m!1231311))

(declare-fun m!1231351 () Bool)

(assert (=> b!1343583 m!1231351))

(declare-fun m!1231353 () Bool)

(assert (=> b!1343582 m!1231353))

(assert (=> b!1343579 m!1231311))

(check-sat b_and!50507 tp_is_empty!37299 (not mapNonEmpty!57655) (not b!1343575) (not b_lambda!24475) (not b!1343585) (not b!1343583) (not start!113248) (not b!1343582) (not b!1343578) (not b_next!31299))
(check-sat b_and!50507 (not b_next!31299))
