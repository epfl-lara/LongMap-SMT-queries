; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111790 () Bool)

(assert start!111790)

(declare-fun b_free!30447 () Bool)

(declare-fun b_next!30447 () Bool)

(assert (=> start!111790 (= b_free!30447 (not b_next!30447))))

(declare-fun tp!106817 () Bool)

(declare-fun b_and!48985 () Bool)

(assert (=> start!111790 (= tp!106817 b_and!48985)))

(declare-fun mapIsEmpty!56048 () Bool)

(declare-fun mapRes!56048 () Bool)

(assert (=> mapIsEmpty!56048 mapRes!56048))

(declare-fun b!1324702 () Bool)

(declare-fun res!879277 () Bool)

(declare-fun e!755191 () Bool)

(assert (=> b!1324702 (=> (not res!879277) (not e!755191))))

(declare-datatypes ((array!89444 0))(
  ( (array!89445 (arr!43196 (Array (_ BitVec 32) (_ BitVec 64))) (size!43746 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89444)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324702 (= res!879277 (validKeyInArray!0 (select (arr!43196 _keys!1609) from!2000)))))

(declare-fun res!879271 () Bool)

(assert (=> start!111790 (=> (not res!879271) (not e!755191))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111790 (= res!879271 (validMask!0 mask!2019))))

(assert (=> start!111790 e!755191))

(declare-fun array_inv!32605 (array!89444) Bool)

(assert (=> start!111790 (array_inv!32605 _keys!1609)))

(assert (=> start!111790 true))

(declare-fun tp_is_empty!36267 () Bool)

(assert (=> start!111790 tp_is_empty!36267))

(declare-datatypes ((V!53459 0))(
  ( (V!53460 (val!18208 Int)) )
))
(declare-datatypes ((ValueCell!17235 0))(
  ( (ValueCellFull!17235 (v!20838 V!53459)) (EmptyCell!17235) )
))
(declare-datatypes ((array!89446 0))(
  ( (array!89447 (arr!43197 (Array (_ BitVec 32) ValueCell!17235)) (size!43747 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89446)

(declare-fun e!755192 () Bool)

(declare-fun array_inv!32606 (array!89446) Bool)

(assert (=> start!111790 (and (array_inv!32606 _values!1337) e!755192)))

(assert (=> start!111790 tp!106817))

(declare-fun b!1324703 () Bool)

(declare-fun e!755194 () Bool)

(assert (=> b!1324703 (= e!755194 tp_is_empty!36267)))

(declare-fun mapNonEmpty!56048 () Bool)

(declare-fun tp!106816 () Bool)

(declare-fun e!755193 () Bool)

(assert (=> mapNonEmpty!56048 (= mapRes!56048 (and tp!106816 e!755193))))

(declare-fun mapKey!56048 () (_ BitVec 32))

(declare-fun mapValue!56048 () ValueCell!17235)

(declare-fun mapRest!56048 () (Array (_ BitVec 32) ValueCell!17235))

(assert (=> mapNonEmpty!56048 (= (arr!43197 _values!1337) (store mapRest!56048 mapKey!56048 mapValue!56048))))

(declare-fun b!1324704 () Bool)

(declare-fun res!879275 () Bool)

(assert (=> b!1324704 (=> (not res!879275) (not e!755191))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324704 (= res!879275 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43746 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324705 () Bool)

(assert (=> b!1324705 (= e!755191 false)))

(declare-datatypes ((tuple2!23480 0))(
  ( (tuple2!23481 (_1!11751 (_ BitVec 64)) (_2!11751 V!53459)) )
))
(declare-datatypes ((List!30620 0))(
  ( (Nil!30617) (Cons!30616 (h!31825 tuple2!23480) (t!44546 List!30620)) )
))
(declare-datatypes ((ListLongMap!21137 0))(
  ( (ListLongMap!21138 (toList!10584 List!30620)) )
))
(declare-fun lt!589494 () ListLongMap!21137)

(declare-fun zeroValue!1279 () V!53459)

(declare-fun minValue!1279 () V!53459)

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6246 (array!89444 array!89446 (_ BitVec 32) (_ BitVec 32) V!53459 V!53459 (_ BitVec 32) Int) ListLongMap!21137)

(assert (=> b!1324705 (= lt!589494 (getCurrentListMapNoExtraKeys!6246 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1324706 () Bool)

(declare-fun res!879272 () Bool)

(assert (=> b!1324706 (=> (not res!879272) (not e!755191))))

(assert (=> b!1324706 (= res!879272 (and (= (size!43747 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43746 _keys!1609) (size!43747 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324707 () Bool)

(declare-fun res!879274 () Bool)

(assert (=> b!1324707 (=> (not res!879274) (not e!755191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89444 (_ BitVec 32)) Bool)

(assert (=> b!1324707 (= res!879274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324708 () Bool)

(declare-fun res!879278 () Bool)

(assert (=> b!1324708 (=> (not res!879278) (not e!755191))))

(declare-fun contains!8739 (ListLongMap!21137 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5580 (array!89444 array!89446 (_ BitVec 32) (_ BitVec 32) V!53459 V!53459 (_ BitVec 32) Int) ListLongMap!21137)

(assert (=> b!1324708 (= res!879278 (contains!8739 (getCurrentListMap!5580 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324709 () Bool)

(assert (=> b!1324709 (= e!755193 tp_is_empty!36267)))

(declare-fun b!1324710 () Bool)

(declare-fun res!879273 () Bool)

(assert (=> b!1324710 (=> (not res!879273) (not e!755191))))

(declare-datatypes ((List!30621 0))(
  ( (Nil!30618) (Cons!30617 (h!31826 (_ BitVec 64)) (t!44547 List!30621)) )
))
(declare-fun arrayNoDuplicates!0 (array!89444 (_ BitVec 32) List!30621) Bool)

(assert (=> b!1324710 (= res!879273 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30618))))

(declare-fun b!1324711 () Bool)

(declare-fun res!879276 () Bool)

(assert (=> b!1324711 (=> (not res!879276) (not e!755191))))

(assert (=> b!1324711 (= res!879276 (not (= (select (arr!43196 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324712 () Bool)

(assert (=> b!1324712 (= e!755192 (and e!755194 mapRes!56048))))

(declare-fun condMapEmpty!56048 () Bool)

(declare-fun mapDefault!56048 () ValueCell!17235)

(assert (=> b!1324712 (= condMapEmpty!56048 (= (arr!43197 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17235)) mapDefault!56048)))))

(assert (= (and start!111790 res!879271) b!1324706))

(assert (= (and b!1324706 res!879272) b!1324707))

(assert (= (and b!1324707 res!879274) b!1324710))

(assert (= (and b!1324710 res!879273) b!1324704))

(assert (= (and b!1324704 res!879275) b!1324708))

(assert (= (and b!1324708 res!879278) b!1324711))

(assert (= (and b!1324711 res!879276) b!1324702))

(assert (= (and b!1324702 res!879277) b!1324705))

(assert (= (and b!1324712 condMapEmpty!56048) mapIsEmpty!56048))

(assert (= (and b!1324712 (not condMapEmpty!56048)) mapNonEmpty!56048))

(get-info :version)

(assert (= (and mapNonEmpty!56048 ((_ is ValueCellFull!17235) mapValue!56048)) b!1324709))

(assert (= (and b!1324712 ((_ is ValueCellFull!17235) mapDefault!56048)) b!1324703))

(assert (= start!111790 b!1324712))

(declare-fun m!1213465 () Bool)

(assert (=> b!1324708 m!1213465))

(assert (=> b!1324708 m!1213465))

(declare-fun m!1213467 () Bool)

(assert (=> b!1324708 m!1213467))

(declare-fun m!1213469 () Bool)

(assert (=> b!1324711 m!1213469))

(declare-fun m!1213471 () Bool)

(assert (=> b!1324705 m!1213471))

(declare-fun m!1213473 () Bool)

(assert (=> mapNonEmpty!56048 m!1213473))

(declare-fun m!1213475 () Bool)

(assert (=> start!111790 m!1213475))

(declare-fun m!1213477 () Bool)

(assert (=> start!111790 m!1213477))

(declare-fun m!1213479 () Bool)

(assert (=> start!111790 m!1213479))

(declare-fun m!1213481 () Bool)

(assert (=> b!1324710 m!1213481))

(assert (=> b!1324702 m!1213469))

(assert (=> b!1324702 m!1213469))

(declare-fun m!1213483 () Bool)

(assert (=> b!1324702 m!1213483))

(declare-fun m!1213485 () Bool)

(assert (=> b!1324707 m!1213485))

(check-sat (not b!1324707) (not b!1324710) (not b_next!30447) (not b!1324708) (not b!1324705) (not b!1324702) b_and!48985 tp_is_empty!36267 (not start!111790) (not mapNonEmpty!56048))
(check-sat b_and!48985 (not b_next!30447))
