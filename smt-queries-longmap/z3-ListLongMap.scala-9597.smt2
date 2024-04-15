; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113444 () Bool)

(assert start!113444)

(declare-fun b_free!31495 () Bool)

(declare-fun b_next!31495 () Bool)

(assert (=> start!113444 (= b_free!31495 (not b_next!31495))))

(declare-fun tp!110291 () Bool)

(declare-fun b_and!50765 () Bool)

(assert (=> start!113444 (= tp!110291 b_and!50765)))

(declare-fun b!1346639 () Bool)

(declare-fun res!893577 () Bool)

(declare-fun e!766241 () Bool)

(assert (=> b!1346639 (=> (not res!893577) (not e!766241))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91769 0))(
  ( (array!91770 (arr!44341 (Array (_ BitVec 32) (_ BitVec 64))) (size!44893 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91769)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55097 0))(
  ( (V!55098 (val!18822 Int)) )
))
(declare-datatypes ((ValueCell!17849 0))(
  ( (ValueCellFull!17849 (v!21469 V!55097)) (EmptyCell!17849) )
))
(declare-datatypes ((array!91771 0))(
  ( (array!91772 (arr!44342 (Array (_ BitVec 32) ValueCell!17849)) (size!44894 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91771)

(assert (=> b!1346639 (= res!893577 (and (= (size!44894 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44893 _keys!1571) (size!44894 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346640 () Bool)

(assert (=> b!1346640 (= e!766241 false)))

(declare-fun minValue!1245 () V!55097)

(declare-fun zeroValue!1245 () V!55097)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun lt!595350 () Bool)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24330 0))(
  ( (tuple2!24331 (_1!12176 (_ BitVec 64)) (_2!12176 V!55097)) )
))
(declare-datatypes ((List!31466 0))(
  ( (Nil!31463) (Cons!31462 (h!32671 tuple2!24330) (t!46048 List!31466)) )
))
(declare-datatypes ((ListLongMap!21987 0))(
  ( (ListLongMap!21988 (toList!11009 List!31466)) )
))
(declare-fun contains!9114 (ListLongMap!21987 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5848 (array!91769 array!91771 (_ BitVec 32) (_ BitVec 32) V!55097 V!55097 (_ BitVec 32) Int) ListLongMap!21987)

(assert (=> b!1346640 (= lt!595350 (contains!9114 (getCurrentListMap!5848 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346642 () Bool)

(declare-fun res!893575 () Bool)

(assert (=> b!1346642 (=> (not res!893575) (not e!766241))))

(declare-datatypes ((List!31467 0))(
  ( (Nil!31464) (Cons!31463 (h!32672 (_ BitVec 64)) (t!46049 List!31467)) )
))
(declare-fun arrayNoDuplicates!0 (array!91769 (_ BitVec 32) List!31467) Bool)

(assert (=> b!1346642 (= res!893575 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31464))))

(declare-fun b!1346643 () Bool)

(declare-fun e!766238 () Bool)

(declare-fun tp_is_empty!37495 () Bool)

(assert (=> b!1346643 (= e!766238 tp_is_empty!37495)))

(declare-fun b!1346644 () Bool)

(declare-fun e!766240 () Bool)

(declare-fun mapRes!57949 () Bool)

(assert (=> b!1346644 (= e!766240 (and e!766238 mapRes!57949))))

(declare-fun condMapEmpty!57949 () Bool)

(declare-fun mapDefault!57949 () ValueCell!17849)

(assert (=> b!1346644 (= condMapEmpty!57949 (= (arr!44342 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17849)) mapDefault!57949)))))

(declare-fun mapIsEmpty!57949 () Bool)

(assert (=> mapIsEmpty!57949 mapRes!57949))

(declare-fun b!1346645 () Bool)

(declare-fun res!893576 () Bool)

(assert (=> b!1346645 (=> (not res!893576) (not e!766241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91769 (_ BitVec 32)) Bool)

(assert (=> b!1346645 (= res!893576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57949 () Bool)

(declare-fun tp!110290 () Bool)

(declare-fun e!766239 () Bool)

(assert (=> mapNonEmpty!57949 (= mapRes!57949 (and tp!110290 e!766239))))

(declare-fun mapValue!57949 () ValueCell!17849)

(declare-fun mapRest!57949 () (Array (_ BitVec 32) ValueCell!17849))

(declare-fun mapKey!57949 () (_ BitVec 32))

(assert (=> mapNonEmpty!57949 (= (arr!44342 _values!1303) (store mapRest!57949 mapKey!57949 mapValue!57949))))

(declare-fun b!1346646 () Bool)

(assert (=> b!1346646 (= e!766239 tp_is_empty!37495)))

(declare-fun b!1346641 () Bool)

(declare-fun res!893574 () Bool)

(assert (=> b!1346641 (=> (not res!893574) (not e!766241))))

(assert (=> b!1346641 (= res!893574 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44893 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!893578 () Bool)

(assert (=> start!113444 (=> (not res!893578) (not e!766241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113444 (= res!893578 (validMask!0 mask!1977))))

(assert (=> start!113444 e!766241))

(assert (=> start!113444 tp_is_empty!37495))

(assert (=> start!113444 true))

(declare-fun array_inv!33603 (array!91769) Bool)

(assert (=> start!113444 (array_inv!33603 _keys!1571)))

(declare-fun array_inv!33604 (array!91771) Bool)

(assert (=> start!113444 (and (array_inv!33604 _values!1303) e!766240)))

(assert (=> start!113444 tp!110291))

(assert (= (and start!113444 res!893578) b!1346639))

(assert (= (and b!1346639 res!893577) b!1346645))

(assert (= (and b!1346645 res!893576) b!1346642))

(assert (= (and b!1346642 res!893575) b!1346641))

(assert (= (and b!1346641 res!893574) b!1346640))

(assert (= (and b!1346644 condMapEmpty!57949) mapIsEmpty!57949))

(assert (= (and b!1346644 (not condMapEmpty!57949)) mapNonEmpty!57949))

(get-info :version)

(assert (= (and mapNonEmpty!57949 ((_ is ValueCellFull!17849) mapValue!57949)) b!1346646))

(assert (= (and b!1346644 ((_ is ValueCellFull!17849) mapDefault!57949)) b!1346643))

(assert (= start!113444 b!1346644))

(declare-fun m!1233247 () Bool)

(assert (=> b!1346645 m!1233247))

(declare-fun m!1233249 () Bool)

(assert (=> b!1346642 m!1233249))

(declare-fun m!1233251 () Bool)

(assert (=> mapNonEmpty!57949 m!1233251))

(declare-fun m!1233253 () Bool)

(assert (=> start!113444 m!1233253))

(declare-fun m!1233255 () Bool)

(assert (=> start!113444 m!1233255))

(declare-fun m!1233257 () Bool)

(assert (=> start!113444 m!1233257))

(declare-fun m!1233259 () Bool)

(assert (=> b!1346640 m!1233259))

(assert (=> b!1346640 m!1233259))

(declare-fun m!1233261 () Bool)

(assert (=> b!1346640 m!1233261))

(check-sat (not b_next!31495) (not mapNonEmpty!57949) (not b!1346645) (not b!1346642) b_and!50765 tp_is_empty!37495 (not start!113444) (not b!1346640))
(check-sat b_and!50765 (not b_next!31495))
