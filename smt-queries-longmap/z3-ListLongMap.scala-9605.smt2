; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113550 () Bool)

(assert start!113550)

(declare-fun b_free!31543 () Bool)

(declare-fun b_next!31543 () Bool)

(assert (=> start!113550 (= b_free!31543 (not b_next!31543))))

(declare-fun tp!110438 () Bool)

(declare-fun b_and!50857 () Bool)

(assert (=> start!113550 (= tp!110438 b_and!50857)))

(declare-fun b!1347889 () Bool)

(declare-fun res!894360 () Bool)

(declare-fun e!766841 () Bool)

(assert (=> b!1347889 (=> (not res!894360) (not e!766841))))

(declare-datatypes ((V!55161 0))(
  ( (V!55162 (val!18846 Int)) )
))
(declare-fun minValue!1245 () V!55161)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55161)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17873 0))(
  ( (ValueCellFull!17873 (v!21496 V!55161)) (EmptyCell!17873) )
))
(declare-datatypes ((array!91863 0))(
  ( (array!91864 (arr!44387 (Array (_ BitVec 32) ValueCell!17873)) (size!44939 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91863)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91865 0))(
  ( (array!91866 (arr!44388 (Array (_ BitVec 32) (_ BitVec 64))) (size!44940 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91865)

(declare-datatypes ((tuple2!24374 0))(
  ( (tuple2!24375 (_1!12198 (_ BitVec 64)) (_2!12198 V!55161)) )
))
(declare-datatypes ((List!31507 0))(
  ( (Nil!31504) (Cons!31503 (h!32712 tuple2!24374) (t!46121 List!31507)) )
))
(declare-datatypes ((ListLongMap!22031 0))(
  ( (ListLongMap!22032 (toList!11031 List!31507)) )
))
(declare-fun contains!9136 (ListLongMap!22031 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5863 (array!91865 array!91863 (_ BitVec 32) (_ BitVec 32) V!55161 V!55161 (_ BitVec 32) Int) ListLongMap!22031)

(assert (=> b!1347889 (= res!894360 (contains!9136 (getCurrentListMap!5863 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!894363 () Bool)

(assert (=> start!113550 (=> (not res!894363) (not e!766841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113550 (= res!894363 (validMask!0 mask!1977))))

(assert (=> start!113550 e!766841))

(declare-fun tp_is_empty!37543 () Bool)

(assert (=> start!113550 tp_is_empty!37543))

(assert (=> start!113550 true))

(declare-fun array_inv!33635 (array!91865) Bool)

(assert (=> start!113550 (array_inv!33635 _keys!1571)))

(declare-fun e!766842 () Bool)

(declare-fun array_inv!33636 (array!91863) Bool)

(assert (=> start!113550 (and (array_inv!33636 _values!1303) e!766842)))

(assert (=> start!113550 tp!110438))

(declare-fun b!1347890 () Bool)

(declare-fun e!766844 () Bool)

(declare-fun mapRes!58025 () Bool)

(assert (=> b!1347890 (= e!766842 (and e!766844 mapRes!58025))))

(declare-fun condMapEmpty!58025 () Bool)

(declare-fun mapDefault!58025 () ValueCell!17873)

(assert (=> b!1347890 (= condMapEmpty!58025 (= (arr!44387 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17873)) mapDefault!58025)))))

(declare-fun b!1347891 () Bool)

(declare-fun res!894361 () Bool)

(assert (=> b!1347891 (=> (not res!894361) (not e!766841))))

(assert (=> b!1347891 (= res!894361 (not (= (select (arr!44388 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!58025 () Bool)

(assert (=> mapIsEmpty!58025 mapRes!58025))

(declare-fun b!1347892 () Bool)

(assert (=> b!1347892 (= e!766844 tp_is_empty!37543)))

(declare-fun b!1347893 () Bool)

(assert (=> b!1347893 (= e!766841 (not (not (= k0!1142 (select (arr!44388 _keys!1571) from!1960)))))))

(declare-fun lt!595702 () ListLongMap!22031)

(assert (=> b!1347893 (contains!9136 lt!595702 k0!1142)))

(declare-datatypes ((Unit!44001 0))(
  ( (Unit!44002) )
))
(declare-fun lt!595701 () Unit!44001)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!411 ((_ BitVec 64) (_ BitVec 64) V!55161 ListLongMap!22031) Unit!44001)

(assert (=> b!1347893 (= lt!595701 (lemmaInListMapAfterAddingDiffThenInBefore!411 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595702))))

(declare-fun +!4878 (ListLongMap!22031 tuple2!24374) ListLongMap!22031)

(declare-fun getCurrentListMapNoExtraKeys!6526 (array!91865 array!91863 (_ BitVec 32) (_ BitVec 32) V!55161 V!55161 (_ BitVec 32) Int) ListLongMap!22031)

(declare-fun get!22435 (ValueCell!17873 V!55161) V!55161)

(declare-fun dynLambda!3808 (Int (_ BitVec 64)) V!55161)

(assert (=> b!1347893 (= lt!595702 (+!4878 (getCurrentListMapNoExtraKeys!6526 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24375 (select (arr!44388 _keys!1571) from!1960) (get!22435 (select (arr!44387 _values!1303) from!1960) (dynLambda!3808 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1347894 () Bool)

(declare-fun res!894355 () Bool)

(assert (=> b!1347894 (=> (not res!894355) (not e!766841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347894 (= res!894355 (validKeyInArray!0 (select (arr!44388 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!58025 () Bool)

(declare-fun tp!110439 () Bool)

(declare-fun e!766840 () Bool)

(assert (=> mapNonEmpty!58025 (= mapRes!58025 (and tp!110439 e!766840))))

(declare-fun mapValue!58025 () ValueCell!17873)

(declare-fun mapKey!58025 () (_ BitVec 32))

(declare-fun mapRest!58025 () (Array (_ BitVec 32) ValueCell!17873))

(assert (=> mapNonEmpty!58025 (= (arr!44387 _values!1303) (store mapRest!58025 mapKey!58025 mapValue!58025))))

(declare-fun b!1347895 () Bool)

(declare-fun res!894362 () Bool)

(assert (=> b!1347895 (=> (not res!894362) (not e!766841))))

(declare-datatypes ((List!31508 0))(
  ( (Nil!31505) (Cons!31504 (h!32713 (_ BitVec 64)) (t!46122 List!31508)) )
))
(declare-fun arrayNoDuplicates!0 (array!91865 (_ BitVec 32) List!31508) Bool)

(assert (=> b!1347895 (= res!894362 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31505))))

(declare-fun b!1347896 () Bool)

(declare-fun res!894359 () Bool)

(assert (=> b!1347896 (=> (not res!894359) (not e!766841))))

(assert (=> b!1347896 (= res!894359 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347897 () Bool)

(declare-fun res!894356 () Bool)

(assert (=> b!1347897 (=> (not res!894356) (not e!766841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91865 (_ BitVec 32)) Bool)

(assert (=> b!1347897 (= res!894356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347898 () Bool)

(declare-fun res!894358 () Bool)

(assert (=> b!1347898 (=> (not res!894358) (not e!766841))))

(assert (=> b!1347898 (= res!894358 (and (= (size!44939 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44940 _keys!1571) (size!44939 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347899 () Bool)

(declare-fun res!894357 () Bool)

(assert (=> b!1347899 (=> (not res!894357) (not e!766841))))

(assert (=> b!1347899 (= res!894357 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44940 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347900 () Bool)

(assert (=> b!1347900 (= e!766840 tp_is_empty!37543)))

(assert (= (and start!113550 res!894363) b!1347898))

(assert (= (and b!1347898 res!894358) b!1347897))

(assert (= (and b!1347897 res!894356) b!1347895))

(assert (= (and b!1347895 res!894362) b!1347899))

(assert (= (and b!1347899 res!894357) b!1347889))

(assert (= (and b!1347889 res!894360) b!1347891))

(assert (= (and b!1347891 res!894361) b!1347894))

(assert (= (and b!1347894 res!894355) b!1347896))

(assert (= (and b!1347896 res!894359) b!1347893))

(assert (= (and b!1347890 condMapEmpty!58025) mapIsEmpty!58025))

(assert (= (and b!1347890 (not condMapEmpty!58025)) mapNonEmpty!58025))

(get-info :version)

(assert (= (and mapNonEmpty!58025 ((_ is ValueCellFull!17873) mapValue!58025)) b!1347900))

(assert (= (and b!1347890 ((_ is ValueCellFull!17873) mapDefault!58025)) b!1347892))

(assert (= start!113550 b!1347890))

(declare-fun b_lambda!24607 () Bool)

(assert (=> (not b_lambda!24607) (not b!1347893)))

(declare-fun t!46120 () Bool)

(declare-fun tb!12417 () Bool)

(assert (=> (and start!113550 (= defaultEntry!1306 defaultEntry!1306) t!46120) tb!12417))

(declare-fun result!25935 () Bool)

(assert (=> tb!12417 (= result!25935 tp_is_empty!37543)))

(assert (=> b!1347893 t!46120))

(declare-fun b_and!50859 () Bool)

(assert (= b_and!50857 (and (=> t!46120 result!25935) b_and!50859)))

(declare-fun m!1234475 () Bool)

(assert (=> b!1347897 m!1234475))

(declare-fun m!1234477 () Bool)

(assert (=> b!1347891 m!1234477))

(declare-fun m!1234479 () Bool)

(assert (=> b!1347895 m!1234479))

(declare-fun m!1234481 () Bool)

(assert (=> mapNonEmpty!58025 m!1234481))

(declare-fun m!1234483 () Bool)

(assert (=> b!1347889 m!1234483))

(assert (=> b!1347889 m!1234483))

(declare-fun m!1234485 () Bool)

(assert (=> b!1347889 m!1234485))

(declare-fun m!1234487 () Bool)

(assert (=> b!1347893 m!1234487))

(declare-fun m!1234489 () Bool)

(assert (=> b!1347893 m!1234489))

(declare-fun m!1234491 () Bool)

(assert (=> b!1347893 m!1234491))

(declare-fun m!1234493 () Bool)

(assert (=> b!1347893 m!1234493))

(assert (=> b!1347893 m!1234487))

(declare-fun m!1234495 () Bool)

(assert (=> b!1347893 m!1234495))

(assert (=> b!1347893 m!1234489))

(assert (=> b!1347893 m!1234491))

(declare-fun m!1234497 () Bool)

(assert (=> b!1347893 m!1234497))

(assert (=> b!1347893 m!1234477))

(declare-fun m!1234499 () Bool)

(assert (=> b!1347893 m!1234499))

(declare-fun m!1234501 () Bool)

(assert (=> start!113550 m!1234501))

(declare-fun m!1234503 () Bool)

(assert (=> start!113550 m!1234503))

(declare-fun m!1234505 () Bool)

(assert (=> start!113550 m!1234505))

(assert (=> b!1347894 m!1234477))

(assert (=> b!1347894 m!1234477))

(declare-fun m!1234507 () Bool)

(assert (=> b!1347894 m!1234507))

(check-sat (not mapNonEmpty!58025) b_and!50859 (not b!1347889) (not b_lambda!24607) (not b!1347895) (not b!1347897) (not b!1347893) (not b_next!31543) tp_is_empty!37543 (not b!1347894) (not start!113550))
(check-sat b_and!50859 (not b_next!31543))
