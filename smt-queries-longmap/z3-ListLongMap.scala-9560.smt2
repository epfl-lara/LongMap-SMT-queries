; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113446 () Bool)

(assert start!113446)

(declare-fun b_free!31273 () Bool)

(declare-fun b_next!31273 () Bool)

(assert (=> start!113446 (= b_free!31273 (not b_next!31273))))

(declare-fun tp!109624 () Bool)

(declare-fun b_and!50455 () Bool)

(assert (=> start!113446 (= tp!109624 b_and!50455)))

(declare-fun b!1344380 () Bool)

(declare-fun res!891606 () Bool)

(declare-fun e!765367 () Bool)

(assert (=> b!1344380 (=> (not res!891606) (not e!765367))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1344380 (= res!891606 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1344381 () Bool)

(declare-fun e!765369 () Bool)

(declare-fun tp_is_empty!37273 () Bool)

(assert (=> b!1344381 (= e!765369 tp_is_empty!37273)))

(declare-fun b!1344382 () Bool)

(declare-fun res!891607 () Bool)

(assert (=> b!1344382 (=> (not res!891607) (not e!765367))))

(declare-datatypes ((array!91509 0))(
  ( (array!91510 (arr!44206 (Array (_ BitVec 32) (_ BitVec 64))) (size!44757 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91509)

(declare-datatypes ((List!31300 0))(
  ( (Nil!31297) (Cons!31296 (h!32514 (_ BitVec 64)) (t!45776 List!31300)) )
))
(declare-fun arrayNoDuplicates!0 (array!91509 (_ BitVec 32) List!31300) Bool)

(assert (=> b!1344382 (= res!891607 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31297))))

(declare-fun b!1344383 () Bool)

(assert (=> b!1344383 (= e!765367 (not true))))

(declare-datatypes ((V!54801 0))(
  ( (V!54802 (val!18711 Int)) )
))
(declare-datatypes ((tuple2!24154 0))(
  ( (tuple2!24155 (_1!12088 (_ BitVec 64)) (_2!12088 V!54801)) )
))
(declare-datatypes ((List!31301 0))(
  ( (Nil!31298) (Cons!31297 (h!32515 tuple2!24154) (t!45777 List!31301)) )
))
(declare-datatypes ((ListLongMap!21819 0))(
  ( (ListLongMap!21820 (toList!10925 List!31301)) )
))
(declare-fun lt!595232 () ListLongMap!21819)

(declare-fun zeroValue!1245 () V!54801)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9113 (ListLongMap!21819 (_ BitVec 64)) Bool)

(declare-fun +!4839 (ListLongMap!21819 tuple2!24154) ListLongMap!21819)

(assert (=> b!1344383 (contains!9113 (+!4839 lt!595232 (tuple2!24155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44018 0))(
  ( (Unit!44019) )
))
(declare-fun lt!595233 () Unit!44018)

(declare-fun addStillContains!1201 (ListLongMap!21819 (_ BitVec 64) V!54801 (_ BitVec 64)) Unit!44018)

(assert (=> b!1344383 (= lt!595233 (addStillContains!1201 lt!595232 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1344383 (contains!9113 lt!595232 k0!1142)))

(declare-fun lt!595230 () V!54801)

(declare-fun lt!595235 () Unit!44018)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!365 ((_ BitVec 64) (_ BitVec 64) V!54801 ListLongMap!21819) Unit!44018)

(assert (=> b!1344383 (= lt!595235 (lemmaInListMapAfterAddingDiffThenInBefore!365 k0!1142 (select (arr!44206 _keys!1571) from!1960) lt!595230 lt!595232))))

(declare-fun lt!595231 () ListLongMap!21819)

(assert (=> b!1344383 (contains!9113 lt!595231 k0!1142)))

(declare-fun lt!595234 () Unit!44018)

(assert (=> b!1344383 (= lt!595234 (lemmaInListMapAfterAddingDiffThenInBefore!365 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595231))))

(assert (=> b!1344383 (= lt!595231 (+!4839 lt!595232 (tuple2!24155 (select (arr!44206 _keys!1571) from!1960) lt!595230)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17738 0))(
  ( (ValueCellFull!17738 (v!21354 V!54801)) (EmptyCell!17738) )
))
(declare-datatypes ((array!91511 0))(
  ( (array!91512 (arr!44207 (Array (_ BitVec 32) ValueCell!17738)) (size!44758 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91511)

(declare-fun get!22339 (ValueCell!17738 V!54801) V!54801)

(declare-fun dynLambda!3793 (Int (_ BitVec 64)) V!54801)

(assert (=> b!1344383 (= lt!595230 (get!22339 (select (arr!44207 _values!1303) from!1960) (dynLambda!3793 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54801)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6488 (array!91509 array!91511 (_ BitVec 32) (_ BitVec 32) V!54801 V!54801 (_ BitVec 32) Int) ListLongMap!21819)

(assert (=> b!1344383 (= lt!595232 (getCurrentListMapNoExtraKeys!6488 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1344384 () Bool)

(declare-fun res!891608 () Bool)

(assert (=> b!1344384 (=> (not res!891608) (not e!765367))))

(assert (=> b!1344384 (= res!891608 (not (= (select (arr!44206 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1344385 () Bool)

(declare-fun res!891602 () Bool)

(assert (=> b!1344385 (=> (not res!891602) (not e!765367))))

(assert (=> b!1344385 (= res!891602 (and (= (size!44758 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44757 _keys!1571) (size!44758 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57616 () Bool)

(declare-fun mapRes!57616 () Bool)

(declare-fun tp!109623 () Bool)

(declare-fun e!765371 () Bool)

(assert (=> mapNonEmpty!57616 (= mapRes!57616 (and tp!109623 e!765371))))

(declare-fun mapKey!57616 () (_ BitVec 32))

(declare-fun mapRest!57616 () (Array (_ BitVec 32) ValueCell!17738))

(declare-fun mapValue!57616 () ValueCell!17738)

(assert (=> mapNonEmpty!57616 (= (arr!44207 _values!1303) (store mapRest!57616 mapKey!57616 mapValue!57616))))

(declare-fun b!1344386 () Bool)

(declare-fun res!891600 () Bool)

(assert (=> b!1344386 (=> (not res!891600) (not e!765367))))

(assert (=> b!1344386 (= res!891600 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44757 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344387 () Bool)

(declare-fun res!891604 () Bool)

(assert (=> b!1344387 (=> (not res!891604) (not e!765367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91509 (_ BitVec 32)) Bool)

(assert (=> b!1344387 (= res!891604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344388 () Bool)

(declare-fun res!891603 () Bool)

(assert (=> b!1344388 (=> (not res!891603) (not e!765367))))

(declare-fun getCurrentListMap!5871 (array!91509 array!91511 (_ BitVec 32) (_ BitVec 32) V!54801 V!54801 (_ BitVec 32) Int) ListLongMap!21819)

(assert (=> b!1344388 (= res!891603 (contains!9113 (getCurrentListMap!5871 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344389 () Bool)

(assert (=> b!1344389 (= e!765371 tp_is_empty!37273)))

(declare-fun b!1344390 () Bool)

(declare-fun e!765368 () Bool)

(assert (=> b!1344390 (= e!765368 (and e!765369 mapRes!57616))))

(declare-fun condMapEmpty!57616 () Bool)

(declare-fun mapDefault!57616 () ValueCell!17738)

(assert (=> b!1344390 (= condMapEmpty!57616 (= (arr!44207 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17738)) mapDefault!57616)))))

(declare-fun b!1344391 () Bool)

(declare-fun res!891601 () Bool)

(assert (=> b!1344391 (=> (not res!891601) (not e!765367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344391 (= res!891601 (validKeyInArray!0 (select (arr!44206 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57616 () Bool)

(assert (=> mapIsEmpty!57616 mapRes!57616))

(declare-fun res!891605 () Bool)

(assert (=> start!113446 (=> (not res!891605) (not e!765367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113446 (= res!891605 (validMask!0 mask!1977))))

(assert (=> start!113446 e!765367))

(assert (=> start!113446 tp_is_empty!37273))

(assert (=> start!113446 true))

(declare-fun array_inv!33593 (array!91509) Bool)

(assert (=> start!113446 (array_inv!33593 _keys!1571)))

(declare-fun array_inv!33594 (array!91511) Bool)

(assert (=> start!113446 (and (array_inv!33594 _values!1303) e!765368)))

(assert (=> start!113446 tp!109624))

(assert (= (and start!113446 res!891605) b!1344385))

(assert (= (and b!1344385 res!891602) b!1344387))

(assert (= (and b!1344387 res!891604) b!1344382))

(assert (= (and b!1344382 res!891607) b!1344386))

(assert (= (and b!1344386 res!891600) b!1344388))

(assert (= (and b!1344388 res!891603) b!1344384))

(assert (= (and b!1344384 res!891608) b!1344391))

(assert (= (and b!1344391 res!891601) b!1344380))

(assert (= (and b!1344380 res!891606) b!1344383))

(assert (= (and b!1344390 condMapEmpty!57616) mapIsEmpty!57616))

(assert (= (and b!1344390 (not condMapEmpty!57616)) mapNonEmpty!57616))

(get-info :version)

(assert (= (and mapNonEmpty!57616 ((_ is ValueCellFull!17738) mapValue!57616)) b!1344389))

(assert (= (and b!1344390 ((_ is ValueCellFull!17738) mapDefault!57616)) b!1344381))

(assert (= start!113446 b!1344390))

(declare-fun b_lambda!24443 () Bool)

(assert (=> (not b_lambda!24443) (not b!1344383)))

(declare-fun t!45775 () Bool)

(declare-fun tb!12279 () Bool)

(assert (=> (and start!113446 (= defaultEntry!1306 defaultEntry!1306) t!45775) tb!12279))

(declare-fun result!25657 () Bool)

(assert (=> tb!12279 (= result!25657 tp_is_empty!37273)))

(assert (=> b!1344383 t!45775))

(declare-fun b_and!50457 () Bool)

(assert (= b_and!50455 (and (=> t!45775 result!25657) b_and!50457)))

(declare-fun m!1232337 () Bool)

(assert (=> mapNonEmpty!57616 m!1232337))

(declare-fun m!1232339 () Bool)

(assert (=> b!1344382 m!1232339))

(declare-fun m!1232341 () Bool)

(assert (=> b!1344388 m!1232341))

(assert (=> b!1344388 m!1232341))

(declare-fun m!1232343 () Bool)

(assert (=> b!1344388 m!1232343))

(declare-fun m!1232345 () Bool)

(assert (=> b!1344383 m!1232345))

(declare-fun m!1232347 () Bool)

(assert (=> b!1344383 m!1232347))

(declare-fun m!1232349 () Bool)

(assert (=> b!1344383 m!1232349))

(declare-fun m!1232351 () Bool)

(assert (=> b!1344383 m!1232351))

(declare-fun m!1232353 () Bool)

(assert (=> b!1344383 m!1232353))

(assert (=> b!1344383 m!1232349))

(declare-fun m!1232355 () Bool)

(assert (=> b!1344383 m!1232355))

(declare-fun m!1232357 () Bool)

(assert (=> b!1344383 m!1232357))

(assert (=> b!1344383 m!1232345))

(declare-fun m!1232359 () Bool)

(assert (=> b!1344383 m!1232359))

(assert (=> b!1344383 m!1232351))

(declare-fun m!1232361 () Bool)

(assert (=> b!1344383 m!1232361))

(declare-fun m!1232363 () Bool)

(assert (=> b!1344383 m!1232363))

(declare-fun m!1232365 () Bool)

(assert (=> b!1344383 m!1232365))

(declare-fun m!1232367 () Bool)

(assert (=> b!1344383 m!1232367))

(assert (=> b!1344383 m!1232355))

(declare-fun m!1232369 () Bool)

(assert (=> b!1344383 m!1232369))

(assert (=> b!1344391 m!1232355))

(assert (=> b!1344391 m!1232355))

(declare-fun m!1232371 () Bool)

(assert (=> b!1344391 m!1232371))

(declare-fun m!1232373 () Bool)

(assert (=> b!1344387 m!1232373))

(declare-fun m!1232375 () Bool)

(assert (=> start!113446 m!1232375))

(declare-fun m!1232377 () Bool)

(assert (=> start!113446 m!1232377))

(declare-fun m!1232379 () Bool)

(assert (=> start!113446 m!1232379))

(assert (=> b!1344384 m!1232355))

(check-sat (not b!1344388) (not b!1344387) (not mapNonEmpty!57616) (not b_lambda!24443) (not b!1344382) tp_is_empty!37273 (not start!113446) (not b_next!31273) (not b!1344383) (not b!1344391) b_and!50457)
(check-sat b_and!50457 (not b_next!31273))
