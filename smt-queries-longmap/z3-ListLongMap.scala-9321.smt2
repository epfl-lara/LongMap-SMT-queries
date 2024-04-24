; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111586 () Bool)

(assert start!111586)

(declare-fun b_free!30019 () Bool)

(declare-fun b_next!30019 () Bool)

(assert (=> start!111586 (= b_free!30019 (not b_next!30019))))

(declare-fun tp!105532 () Bool)

(declare-fun b_and!48241 () Bool)

(assert (=> start!111586 (= tp!105532 b_and!48241)))

(declare-fun res!875081 () Bool)

(declare-fun e!752824 () Bool)

(assert (=> start!111586 (=> (not res!875081) (not e!752824))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111586 (= res!875081 (validMask!0 mask!2019))))

(assert (=> start!111586 e!752824))

(declare-datatypes ((array!88699 0))(
  ( (array!88700 (arr!42819 (Array (_ BitVec 32) (_ BitVec 64))) (size!43370 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88699)

(declare-fun array_inv!32611 (array!88699) Bool)

(assert (=> start!111586 (array_inv!32611 _keys!1609)))

(assert (=> start!111586 true))

(declare-fun tp_is_empty!35839 () Bool)

(assert (=> start!111586 tp_is_empty!35839))

(declare-datatypes ((V!52889 0))(
  ( (V!52890 (val!17994 Int)) )
))
(declare-datatypes ((ValueCell!17021 0))(
  ( (ValueCellFull!17021 (v!20619 V!52889)) (EmptyCell!17021) )
))
(declare-datatypes ((array!88701 0))(
  ( (array!88702 (arr!42820 (Array (_ BitVec 32) ValueCell!17021)) (size!43371 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88701)

(declare-fun e!752825 () Bool)

(declare-fun array_inv!32612 (array!88701) Bool)

(assert (=> start!111586 (and (array_inv!32612 _values!1337) e!752825)))

(assert (=> start!111586 tp!105532))

(declare-fun mapIsEmpty!55406 () Bool)

(declare-fun mapRes!55406 () Bool)

(assert (=> mapIsEmpty!55406 mapRes!55406))

(declare-fun b!1319047 () Bool)

(declare-fun e!752823 () Bool)

(assert (=> b!1319047 (= e!752823 tp_is_empty!35839)))

(declare-fun mapNonEmpty!55406 () Bool)

(declare-fun tp!105533 () Bool)

(declare-fun e!752826 () Bool)

(assert (=> mapNonEmpty!55406 (= mapRes!55406 (and tp!105533 e!752826))))

(declare-fun mapRest!55406 () (Array (_ BitVec 32) ValueCell!17021))

(declare-fun mapValue!55406 () ValueCell!17021)

(declare-fun mapKey!55406 () (_ BitVec 32))

(assert (=> mapNonEmpty!55406 (= (arr!42820 _values!1337) (store mapRest!55406 mapKey!55406 mapValue!55406))))

(declare-fun b!1319048 () Bool)

(declare-fun res!875080 () Bool)

(assert (=> b!1319048 (=> (not res!875080) (not e!752824))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1319048 (= res!875080 (and (= (size!43371 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43370 _keys!1609) (size!43371 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319049 () Bool)

(declare-fun res!875079 () Bool)

(assert (=> b!1319049 (=> (not res!875079) (not e!752824))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1319049 (= res!875079 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43370 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319050 () Bool)

(assert (=> b!1319050 (= e!752824 false)))

(declare-fun zeroValue!1279 () V!52889)

(declare-fun minValue!1279 () V!52889)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!586880 () Bool)

(declare-datatypes ((tuple2!23188 0))(
  ( (tuple2!23189 (_1!11605 (_ BitVec 64)) (_2!11605 V!52889)) )
))
(declare-datatypes ((List!30352 0))(
  ( (Nil!30349) (Cons!30348 (h!31566 tuple2!23188) (t!43952 List!30352)) )
))
(declare-datatypes ((ListLongMap!20853 0))(
  ( (ListLongMap!20854 (toList!10442 List!30352)) )
))
(declare-fun contains!8609 (ListLongMap!20853 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5446 (array!88699 array!88701 (_ BitVec 32) (_ BitVec 32) V!52889 V!52889 (_ BitVec 32) Int) ListLongMap!20853)

(assert (=> b!1319050 (= lt!586880 (contains!8609 (getCurrentListMap!5446 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319051 () Bool)

(declare-fun res!875082 () Bool)

(assert (=> b!1319051 (=> (not res!875082) (not e!752824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88699 (_ BitVec 32)) Bool)

(assert (=> b!1319051 (= res!875082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319052 () Bool)

(assert (=> b!1319052 (= e!752826 tp_is_empty!35839)))

(declare-fun b!1319053 () Bool)

(assert (=> b!1319053 (= e!752825 (and e!752823 mapRes!55406))))

(declare-fun condMapEmpty!55406 () Bool)

(declare-fun mapDefault!55406 () ValueCell!17021)

(assert (=> b!1319053 (= condMapEmpty!55406 (= (arr!42820 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17021)) mapDefault!55406)))))

(declare-fun b!1319054 () Bool)

(declare-fun res!875083 () Bool)

(assert (=> b!1319054 (=> (not res!875083) (not e!752824))))

(declare-datatypes ((List!30353 0))(
  ( (Nil!30350) (Cons!30349 (h!31567 (_ BitVec 64)) (t!43953 List!30353)) )
))
(declare-fun arrayNoDuplicates!0 (array!88699 (_ BitVec 32) List!30353) Bool)

(assert (=> b!1319054 (= res!875083 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30350))))

(assert (= (and start!111586 res!875081) b!1319048))

(assert (= (and b!1319048 res!875080) b!1319051))

(assert (= (and b!1319051 res!875082) b!1319054))

(assert (= (and b!1319054 res!875083) b!1319049))

(assert (= (and b!1319049 res!875079) b!1319050))

(assert (= (and b!1319053 condMapEmpty!55406) mapIsEmpty!55406))

(assert (= (and b!1319053 (not condMapEmpty!55406)) mapNonEmpty!55406))

(get-info :version)

(assert (= (and mapNonEmpty!55406 ((_ is ValueCellFull!17021) mapValue!55406)) b!1319052))

(assert (= (and b!1319053 ((_ is ValueCellFull!17021) mapDefault!55406)) b!1319047))

(assert (= start!111586 b!1319053))

(declare-fun m!1207097 () Bool)

(assert (=> b!1319051 m!1207097))

(declare-fun m!1207099 () Bool)

(assert (=> mapNonEmpty!55406 m!1207099))

(declare-fun m!1207101 () Bool)

(assert (=> start!111586 m!1207101))

(declare-fun m!1207103 () Bool)

(assert (=> start!111586 m!1207103))

(declare-fun m!1207105 () Bool)

(assert (=> start!111586 m!1207105))

(declare-fun m!1207107 () Bool)

(assert (=> b!1319050 m!1207107))

(assert (=> b!1319050 m!1207107))

(declare-fun m!1207109 () Bool)

(assert (=> b!1319050 m!1207109))

(declare-fun m!1207111 () Bool)

(assert (=> b!1319054 m!1207111))

(check-sat (not b_next!30019) (not mapNonEmpty!55406) b_and!48241 tp_is_empty!35839 (not b!1319050) (not b!1319051) (not start!111586) (not b!1319054))
(check-sat b_and!48241 (not b_next!30019))
