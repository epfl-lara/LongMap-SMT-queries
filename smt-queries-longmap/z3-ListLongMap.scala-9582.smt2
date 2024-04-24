; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113578 () Bool)

(assert start!113578)

(declare-fun b_free!31405 () Bool)

(declare-fun b_next!31405 () Bool)

(assert (=> start!113578 (= b_free!31405 (not b_next!31405))))

(declare-fun tp!110019 () Bool)

(declare-fun b_and!50665 () Bool)

(assert (=> start!113578 (= tp!110019 b_and!50665)))

(declare-fun b!1346613 () Bool)

(declare-fun res!893167 () Bool)

(declare-fun e!766399 () Bool)

(assert (=> b!1346613 (=> (not res!893167) (not e!766399))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346613 (= res!893167 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!893162 () Bool)

(assert (=> start!113578 (=> (not res!893162) (not e!766399))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113578 (= res!893162 (validMask!0 mask!1977))))

(assert (=> start!113578 e!766399))

(declare-fun tp_is_empty!37405 () Bool)

(assert (=> start!113578 tp_is_empty!37405))

(assert (=> start!113578 true))

(declare-datatypes ((array!91757 0))(
  ( (array!91758 (arr!44330 (Array (_ BitVec 32) (_ BitVec 64))) (size!44881 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91757)

(declare-fun array_inv!33673 (array!91757) Bool)

(assert (=> start!113578 (array_inv!33673 _keys!1571)))

(declare-datatypes ((V!54977 0))(
  ( (V!54978 (val!18777 Int)) )
))
(declare-datatypes ((ValueCell!17804 0))(
  ( (ValueCellFull!17804 (v!21420 V!54977)) (EmptyCell!17804) )
))
(declare-datatypes ((array!91759 0))(
  ( (array!91760 (arr!44331 (Array (_ BitVec 32) ValueCell!17804)) (size!44882 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91759)

(declare-fun e!766397 () Bool)

(declare-fun array_inv!33674 (array!91759) Bool)

(assert (=> start!113578 (and (array_inv!33674 _values!1303) e!766397)))

(assert (=> start!113578 tp!110019))

(declare-fun b!1346614 () Bool)

(declare-fun res!893165 () Bool)

(assert (=> b!1346614 (=> (not res!893165) (not e!766399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91757 (_ BitVec 32)) Bool)

(assert (=> b!1346614 (= res!893165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346615 () Bool)

(declare-fun res!893169 () Bool)

(assert (=> b!1346615 (=> (not res!893169) (not e!766399))))

(declare-datatypes ((List!31387 0))(
  ( (Nil!31384) (Cons!31383 (h!32601 (_ BitVec 64)) (t!45941 List!31387)) )
))
(declare-fun arrayNoDuplicates!0 (array!91757 (_ BitVec 32) List!31387) Bool)

(assert (=> b!1346615 (= res!893169 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31384))))

(declare-fun mapIsEmpty!57814 () Bool)

(declare-fun mapRes!57814 () Bool)

(assert (=> mapIsEmpty!57814 mapRes!57814))

(declare-fun b!1346616 () Bool)

(declare-fun res!893163 () Bool)

(assert (=> b!1346616 (=> (not res!893163) (not e!766399))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346616 (= res!893163 (not (= (select (arr!44330 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1346617 () Bool)

(declare-fun e!766398 () Bool)

(assert (=> b!1346617 (= e!766399 e!766398)))

(declare-fun res!893171 () Bool)

(assert (=> b!1346617 (=> (not res!893171) (not e!766398))))

(declare-datatypes ((tuple2!24242 0))(
  ( (tuple2!24243 (_1!12132 (_ BitVec 64)) (_2!12132 V!54977)) )
))
(declare-datatypes ((List!31388 0))(
  ( (Nil!31385) (Cons!31384 (h!32602 tuple2!24242) (t!45942 List!31388)) )
))
(declare-datatypes ((ListLongMap!21907 0))(
  ( (ListLongMap!21908 (toList!10969 List!31388)) )
))
(declare-fun lt!595800 () ListLongMap!21907)

(declare-fun lt!595802 () V!54977)

(declare-fun contains!9157 (ListLongMap!21907 (_ BitVec 64)) Bool)

(declare-fun +!4863 (ListLongMap!21907 tuple2!24242) ListLongMap!21907)

(assert (=> b!1346617 (= res!893171 (contains!9157 (+!4863 lt!595800 (tuple2!24243 (select (arr!44330 _keys!1571) from!1960) lt!595802)) k0!1142))))

(declare-fun minValue!1245 () V!54977)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!54977)

(declare-fun getCurrentListMapNoExtraKeys!6512 (array!91757 array!91759 (_ BitVec 32) (_ BitVec 32) V!54977 V!54977 (_ BitVec 32) Int) ListLongMap!21907)

(assert (=> b!1346617 (= lt!595800 (getCurrentListMapNoExtraKeys!6512 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22407 (ValueCell!17804 V!54977) V!54977)

(declare-fun dynLambda!3817 (Int (_ BitVec 64)) V!54977)

(assert (=> b!1346617 (= lt!595802 (get!22407 (select (arr!44331 _values!1303) from!1960) (dynLambda!3817 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57814 () Bool)

(declare-fun tp!110020 () Bool)

(declare-fun e!766400 () Bool)

(assert (=> mapNonEmpty!57814 (= mapRes!57814 (and tp!110020 e!766400))))

(declare-fun mapValue!57814 () ValueCell!17804)

(declare-fun mapKey!57814 () (_ BitVec 32))

(declare-fun mapRest!57814 () (Array (_ BitVec 32) ValueCell!17804))

(assert (=> mapNonEmpty!57814 (= (arr!44331 _values!1303) (store mapRest!57814 mapKey!57814 mapValue!57814))))

(declare-fun b!1346618 () Bool)

(declare-fun res!893166 () Bool)

(assert (=> b!1346618 (=> (not res!893166) (not e!766398))))

(assert (=> b!1346618 (= res!893166 (not (= k0!1142 (select (arr!44330 _keys!1571) from!1960))))))

(declare-fun b!1346619 () Bool)

(assert (=> b!1346619 (= e!766398 (not true))))

(assert (=> b!1346619 (contains!9157 lt!595800 k0!1142)))

(declare-datatypes ((Unit!44056 0))(
  ( (Unit!44057) )
))
(declare-fun lt!595801 () Unit!44056)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!384 ((_ BitVec 64) (_ BitVec 64) V!54977 ListLongMap!21907) Unit!44056)

(assert (=> b!1346619 (= lt!595801 (lemmaInListMapAfterAddingDiffThenInBefore!384 k0!1142 (select (arr!44330 _keys!1571) from!1960) lt!595802 lt!595800))))

(declare-fun b!1346620 () Bool)

(declare-fun res!893164 () Bool)

(assert (=> b!1346620 (=> (not res!893164) (not e!766399))))

(assert (=> b!1346620 (= res!893164 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44881 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346621 () Bool)

(declare-fun e!766395 () Bool)

(assert (=> b!1346621 (= e!766395 tp_is_empty!37405)))

(declare-fun b!1346622 () Bool)

(assert (=> b!1346622 (= e!766400 tp_is_empty!37405)))

(declare-fun b!1346623 () Bool)

(declare-fun res!893168 () Bool)

(assert (=> b!1346623 (=> (not res!893168) (not e!766399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346623 (= res!893168 (validKeyInArray!0 (select (arr!44330 _keys!1571) from!1960)))))

(declare-fun b!1346624 () Bool)

(declare-fun res!893161 () Bool)

(assert (=> b!1346624 (=> (not res!893161) (not e!766399))))

(declare-fun getCurrentListMap!5911 (array!91757 array!91759 (_ BitVec 32) (_ BitVec 32) V!54977 V!54977 (_ BitVec 32) Int) ListLongMap!21907)

(assert (=> b!1346624 (= res!893161 (contains!9157 (getCurrentListMap!5911 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346625 () Bool)

(declare-fun res!893170 () Bool)

(assert (=> b!1346625 (=> (not res!893170) (not e!766399))))

(assert (=> b!1346625 (= res!893170 (and (= (size!44882 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44881 _keys!1571) (size!44882 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346626 () Bool)

(assert (=> b!1346626 (= e!766397 (and e!766395 mapRes!57814))))

(declare-fun condMapEmpty!57814 () Bool)

(declare-fun mapDefault!57814 () ValueCell!17804)

(assert (=> b!1346626 (= condMapEmpty!57814 (= (arr!44331 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17804)) mapDefault!57814)))))

(assert (= (and start!113578 res!893162) b!1346625))

(assert (= (and b!1346625 res!893170) b!1346614))

(assert (= (and b!1346614 res!893165) b!1346615))

(assert (= (and b!1346615 res!893169) b!1346620))

(assert (= (and b!1346620 res!893164) b!1346624))

(assert (= (and b!1346624 res!893161) b!1346616))

(assert (= (and b!1346616 res!893163) b!1346623))

(assert (= (and b!1346623 res!893168) b!1346613))

(assert (= (and b!1346613 res!893167) b!1346617))

(assert (= (and b!1346617 res!893171) b!1346618))

(assert (= (and b!1346618 res!893166) b!1346619))

(assert (= (and b!1346626 condMapEmpty!57814) mapIsEmpty!57814))

(assert (= (and b!1346626 (not condMapEmpty!57814)) mapNonEmpty!57814))

(get-info :version)

(assert (= (and mapNonEmpty!57814 ((_ is ValueCellFull!17804) mapValue!57814)) b!1346622))

(assert (= (and b!1346626 ((_ is ValueCellFull!17804) mapDefault!57814)) b!1346621))

(assert (= start!113578 b!1346626))

(declare-fun b_lambda!24521 () Bool)

(assert (=> (not b_lambda!24521) (not b!1346617)))

(declare-fun t!45940 () Bool)

(declare-fun tb!12357 () Bool)

(assert (=> (and start!113578 (= defaultEntry!1306 defaultEntry!1306) t!45940) tb!12357))

(declare-fun result!25813 () Bool)

(assert (=> tb!12357 (= result!25813 tp_is_empty!37405)))

(assert (=> b!1346617 t!45940))

(declare-fun b_and!50667 () Bool)

(assert (= b_and!50665 (and (=> t!45940 result!25813) b_and!50667)))

(declare-fun m!1234329 () Bool)

(assert (=> b!1346618 m!1234329))

(assert (=> b!1346623 m!1234329))

(assert (=> b!1346623 m!1234329))

(declare-fun m!1234331 () Bool)

(assert (=> b!1346623 m!1234331))

(declare-fun m!1234333 () Bool)

(assert (=> b!1346615 m!1234333))

(declare-fun m!1234335 () Bool)

(assert (=> start!113578 m!1234335))

(declare-fun m!1234337 () Bool)

(assert (=> start!113578 m!1234337))

(declare-fun m!1234339 () Bool)

(assert (=> start!113578 m!1234339))

(declare-fun m!1234341 () Bool)

(assert (=> b!1346619 m!1234341))

(assert (=> b!1346619 m!1234329))

(assert (=> b!1346619 m!1234329))

(declare-fun m!1234343 () Bool)

(assert (=> b!1346619 m!1234343))

(declare-fun m!1234345 () Bool)

(assert (=> b!1346614 m!1234345))

(declare-fun m!1234347 () Bool)

(assert (=> mapNonEmpty!57814 m!1234347))

(assert (=> b!1346616 m!1234329))

(declare-fun m!1234349 () Bool)

(assert (=> b!1346624 m!1234349))

(assert (=> b!1346624 m!1234349))

(declare-fun m!1234351 () Bool)

(assert (=> b!1346624 m!1234351))

(declare-fun m!1234353 () Bool)

(assert (=> b!1346617 m!1234353))

(declare-fun m!1234355 () Bool)

(assert (=> b!1346617 m!1234355))

(declare-fun m!1234357 () Bool)

(assert (=> b!1346617 m!1234357))

(declare-fun m!1234359 () Bool)

(assert (=> b!1346617 m!1234359))

(assert (=> b!1346617 m!1234355))

(assert (=> b!1346617 m!1234357))

(declare-fun m!1234361 () Bool)

(assert (=> b!1346617 m!1234361))

(assert (=> b!1346617 m!1234329))

(assert (=> b!1346617 m!1234361))

(declare-fun m!1234363 () Bool)

(assert (=> b!1346617 m!1234363))

(check-sat (not b!1346615) (not mapNonEmpty!57814) (not b_lambda!24521) (not b!1346614) (not b!1346617) tp_is_empty!37405 (not b_next!31405) (not b!1346623) b_and!50667 (not start!113578) (not b!1346624) (not b!1346619))
(check-sat b_and!50667 (not b_next!31405))
