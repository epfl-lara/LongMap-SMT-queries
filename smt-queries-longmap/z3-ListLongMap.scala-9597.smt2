; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113668 () Bool)

(assert start!113668)

(declare-fun b_free!31495 () Bool)

(declare-fun b_next!31495 () Bool)

(assert (=> start!113668 (= b_free!31495 (not b_next!31495))))

(declare-fun tp!110289 () Bool)

(declare-fun b_and!50785 () Bool)

(assert (=> start!113668 (= tp!110289 b_and!50785)))

(declare-fun b!1348008 () Bool)

(declare-fun e!767117 () Bool)

(assert (=> b!1348008 (= e!767117 false)))

(declare-datatypes ((V!55097 0))(
  ( (V!55098 (val!18822 Int)) )
))
(declare-fun minValue!1245 () V!55097)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91933 0))(
  ( (array!91934 (arr!44418 (Array (_ BitVec 32) (_ BitVec 64))) (size!44969 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91933)

(declare-fun zeroValue!1245 () V!55097)

(declare-fun lt!596012 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17849 0))(
  ( (ValueCellFull!17849 (v!21465 V!55097)) (EmptyCell!17849) )
))
(declare-datatypes ((array!91935 0))(
  ( (array!91936 (arr!44419 (Array (_ BitVec 32) ValueCell!17849)) (size!44970 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91935)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24310 0))(
  ( (tuple2!24311 (_1!12166 (_ BitVec 64)) (_2!12166 V!55097)) )
))
(declare-datatypes ((List!31450 0))(
  ( (Nil!31447) (Cons!31446 (h!32664 tuple2!24310) (t!46032 List!31450)) )
))
(declare-datatypes ((ListLongMap!21975 0))(
  ( (ListLongMap!21976 (toList!11003 List!31450)) )
))
(declare-fun contains!9191 (ListLongMap!21975 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5943 (array!91933 array!91935 (_ BitVec 32) (_ BitVec 32) V!55097 V!55097 (_ BitVec 32) Int) ListLongMap!21975)

(assert (=> b!1348008 (= lt!596012 (contains!9191 (getCurrentListMap!5943 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348009 () Bool)

(declare-fun e!767115 () Bool)

(declare-fun tp_is_empty!37495 () Bool)

(assert (=> b!1348009 (= e!767115 tp_is_empty!37495)))

(declare-fun mapNonEmpty!57949 () Bool)

(declare-fun mapRes!57949 () Bool)

(declare-fun tp!110290 () Bool)

(declare-fun e!767114 () Bool)

(assert (=> mapNonEmpty!57949 (= mapRes!57949 (and tp!110290 e!767114))))

(declare-fun mapRest!57949 () (Array (_ BitVec 32) ValueCell!17849))

(declare-fun mapValue!57949 () ValueCell!17849)

(declare-fun mapKey!57949 () (_ BitVec 32))

(assert (=> mapNonEmpty!57949 (= (arr!44419 _values!1303) (store mapRest!57949 mapKey!57949 mapValue!57949))))

(declare-fun b!1348010 () Bool)

(declare-fun res!894122 () Bool)

(assert (=> b!1348010 (=> (not res!894122) (not e!767117))))

(assert (=> b!1348010 (= res!894122 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44969 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348012 () Bool)

(declare-fun e!767113 () Bool)

(assert (=> b!1348012 (= e!767113 (and e!767115 mapRes!57949))))

(declare-fun condMapEmpty!57949 () Bool)

(declare-fun mapDefault!57949 () ValueCell!17849)

(assert (=> b!1348012 (= condMapEmpty!57949 (= (arr!44419 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17849)) mapDefault!57949)))))

(declare-fun b!1348013 () Bool)

(declare-fun res!894123 () Bool)

(assert (=> b!1348013 (=> (not res!894123) (not e!767117))))

(assert (=> b!1348013 (= res!894123 (and (= (size!44970 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44969 _keys!1571) (size!44970 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348014 () Bool)

(declare-fun res!894124 () Bool)

(assert (=> b!1348014 (=> (not res!894124) (not e!767117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91933 (_ BitVec 32)) Bool)

(assert (=> b!1348014 (= res!894124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348015 () Bool)

(declare-fun res!894125 () Bool)

(assert (=> b!1348015 (=> (not res!894125) (not e!767117))))

(declare-datatypes ((List!31451 0))(
  ( (Nil!31448) (Cons!31447 (h!32665 (_ BitVec 64)) (t!46033 List!31451)) )
))
(declare-fun arrayNoDuplicates!0 (array!91933 (_ BitVec 32) List!31451) Bool)

(assert (=> b!1348015 (= res!894125 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31448))))

(declare-fun mapIsEmpty!57949 () Bool)

(assert (=> mapIsEmpty!57949 mapRes!57949))

(declare-fun b!1348011 () Bool)

(assert (=> b!1348011 (= e!767114 tp_is_empty!37495)))

(declare-fun res!894121 () Bool)

(assert (=> start!113668 (=> (not res!894121) (not e!767117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113668 (= res!894121 (validMask!0 mask!1977))))

(assert (=> start!113668 e!767117))

(assert (=> start!113668 tp_is_empty!37495))

(assert (=> start!113668 true))

(declare-fun array_inv!33725 (array!91933) Bool)

(assert (=> start!113668 (array_inv!33725 _keys!1571)))

(declare-fun array_inv!33726 (array!91935) Bool)

(assert (=> start!113668 (and (array_inv!33726 _values!1303) e!767113)))

(assert (=> start!113668 tp!110289))

(assert (= (and start!113668 res!894121) b!1348013))

(assert (= (and b!1348013 res!894123) b!1348014))

(assert (= (and b!1348014 res!894124) b!1348015))

(assert (= (and b!1348015 res!894125) b!1348010))

(assert (= (and b!1348010 res!894122) b!1348008))

(assert (= (and b!1348012 condMapEmpty!57949) mapIsEmpty!57949))

(assert (= (and b!1348012 (not condMapEmpty!57949)) mapNonEmpty!57949))

(get-info :version)

(assert (= (and mapNonEmpty!57949 ((_ is ValueCellFull!17849) mapValue!57949)) b!1348011))

(assert (= (and b!1348012 ((_ is ValueCellFull!17849) mapDefault!57949)) b!1348009))

(assert (= start!113668 b!1348012))

(declare-fun m!1235361 () Bool)

(assert (=> b!1348015 m!1235361))

(declare-fun m!1235363 () Bool)

(assert (=> mapNonEmpty!57949 m!1235363))

(declare-fun m!1235365 () Bool)

(assert (=> b!1348014 m!1235365))

(declare-fun m!1235367 () Bool)

(assert (=> b!1348008 m!1235367))

(assert (=> b!1348008 m!1235367))

(declare-fun m!1235369 () Bool)

(assert (=> b!1348008 m!1235369))

(declare-fun m!1235371 () Bool)

(assert (=> start!113668 m!1235371))

(declare-fun m!1235373 () Bool)

(assert (=> start!113668 m!1235373))

(declare-fun m!1235375 () Bool)

(assert (=> start!113668 m!1235375))

(check-sat (not mapNonEmpty!57949) tp_is_empty!37495 (not b!1348015) (not b_next!31495) b_and!50785 (not b!1348014) (not start!113668) (not b!1348008))
(check-sat b_and!50785 (not b_next!31495))
