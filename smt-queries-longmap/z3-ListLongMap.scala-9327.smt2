; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111400 () Bool)

(assert start!111400)

(declare-fun b_free!30057 () Bool)

(declare-fun b_next!30057 () Bool)

(assert (=> start!111400 (= b_free!30057 (not b_next!30057))))

(declare-fun tp!105646 () Bool)

(declare-fun b_and!48277 () Bool)

(assert (=> start!111400 (= tp!105646 b_and!48277)))

(declare-fun b!1318219 () Bool)

(declare-fun res!874863 () Bool)

(declare-fun e!752267 () Bool)

(assert (=> b!1318219 (=> (not res!874863) (not e!752267))))

(declare-datatypes ((array!88702 0))(
  ( (array!88703 (arr!42825 (Array (_ BitVec 32) (_ BitVec 64))) (size!43375 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88702)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318219 (= res!874863 (validKeyInArray!0 (select (arr!42825 _keys!1609) from!2000)))))

(declare-fun b!1318220 () Bool)

(assert (=> b!1318220 (= e!752267 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000))))

(declare-fun b!1318221 () Bool)

(declare-fun res!874867 () Bool)

(assert (=> b!1318221 (=> (not res!874867) (not e!752267))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52939 0))(
  ( (V!52940 (val!18013 Int)) )
))
(declare-datatypes ((ValueCell!17040 0))(
  ( (ValueCellFull!17040 (v!20643 V!52939)) (EmptyCell!17040) )
))
(declare-datatypes ((array!88704 0))(
  ( (array!88705 (arr!42826 (Array (_ BitVec 32) ValueCell!17040)) (size!43376 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88704)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1318221 (= res!874867 (and (= (size!43376 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43375 _keys!1609) (size!43376 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55463 () Bool)

(declare-fun mapRes!55463 () Bool)

(declare-fun tp!105647 () Bool)

(declare-fun e!752265 () Bool)

(assert (=> mapNonEmpty!55463 (= mapRes!55463 (and tp!105647 e!752265))))

(declare-fun mapValue!55463 () ValueCell!17040)

(declare-fun mapRest!55463 () (Array (_ BitVec 32) ValueCell!17040))

(declare-fun mapKey!55463 () (_ BitVec 32))

(assert (=> mapNonEmpty!55463 (= (arr!42826 _values!1337) (store mapRest!55463 mapKey!55463 mapValue!55463))))

(declare-fun res!874865 () Bool)

(assert (=> start!111400 (=> (not res!874865) (not e!752267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111400 (= res!874865 (validMask!0 mask!2019))))

(assert (=> start!111400 e!752267))

(declare-fun array_inv!32343 (array!88702) Bool)

(assert (=> start!111400 (array_inv!32343 _keys!1609)))

(assert (=> start!111400 true))

(declare-fun tp_is_empty!35877 () Bool)

(assert (=> start!111400 tp_is_empty!35877))

(declare-fun e!752268 () Bool)

(declare-fun array_inv!32344 (array!88704) Bool)

(assert (=> start!111400 (and (array_inv!32344 _values!1337) e!752268)))

(assert (=> start!111400 tp!105646))

(declare-fun b!1318222 () Bool)

(declare-fun res!874862 () Bool)

(assert (=> b!1318222 (=> (not res!874862) (not e!752267))))

(declare-fun zeroValue!1279 () V!52939)

(declare-fun minValue!1279 () V!52939)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23182 0))(
  ( (tuple2!23183 (_1!11602 (_ BitVec 64)) (_2!11602 V!52939)) )
))
(declare-datatypes ((List!30338 0))(
  ( (Nil!30335) (Cons!30334 (h!31543 tuple2!23182) (t!43946 List!30338)) )
))
(declare-datatypes ((ListLongMap!20839 0))(
  ( (ListLongMap!20840 (toList!10435 List!30338)) )
))
(declare-fun contains!8590 (ListLongMap!20839 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5448 (array!88702 array!88704 (_ BitVec 32) (_ BitVec 32) V!52939 V!52939 (_ BitVec 32) Int) ListLongMap!20839)

(assert (=> b!1318222 (= res!874862 (contains!8590 (getCurrentListMap!5448 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318223 () Bool)

(declare-fun res!874864 () Bool)

(assert (=> b!1318223 (=> (not res!874864) (not e!752267))))

(assert (=> b!1318223 (= res!874864 (not (= (select (arr!42825 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1318224 () Bool)

(declare-fun res!874866 () Bool)

(assert (=> b!1318224 (=> (not res!874866) (not e!752267))))

(assert (=> b!1318224 (= res!874866 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43375 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318225 () Bool)

(declare-fun e!752269 () Bool)

(assert (=> b!1318225 (= e!752268 (and e!752269 mapRes!55463))))

(declare-fun condMapEmpty!55463 () Bool)

(declare-fun mapDefault!55463 () ValueCell!17040)

(assert (=> b!1318225 (= condMapEmpty!55463 (= (arr!42826 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17040)) mapDefault!55463)))))

(declare-fun b!1318226 () Bool)

(assert (=> b!1318226 (= e!752265 tp_is_empty!35877)))

(declare-fun b!1318227 () Bool)

(assert (=> b!1318227 (= e!752269 tp_is_empty!35877)))

(declare-fun b!1318228 () Bool)

(declare-fun res!874868 () Bool)

(assert (=> b!1318228 (=> (not res!874868) (not e!752267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88702 (_ BitVec 32)) Bool)

(assert (=> b!1318228 (= res!874868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318229 () Bool)

(declare-fun res!874861 () Bool)

(assert (=> b!1318229 (=> (not res!874861) (not e!752267))))

(declare-datatypes ((List!30339 0))(
  ( (Nil!30336) (Cons!30335 (h!31544 (_ BitVec 64)) (t!43947 List!30339)) )
))
(declare-fun arrayNoDuplicates!0 (array!88702 (_ BitVec 32) List!30339) Bool)

(assert (=> b!1318229 (= res!874861 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30336))))

(declare-fun mapIsEmpty!55463 () Bool)

(assert (=> mapIsEmpty!55463 mapRes!55463))

(assert (= (and start!111400 res!874865) b!1318221))

(assert (= (and b!1318221 res!874867) b!1318228))

(assert (= (and b!1318228 res!874868) b!1318229))

(assert (= (and b!1318229 res!874861) b!1318224))

(assert (= (and b!1318224 res!874866) b!1318222))

(assert (= (and b!1318222 res!874862) b!1318223))

(assert (= (and b!1318223 res!874864) b!1318219))

(assert (= (and b!1318219 res!874863) b!1318220))

(assert (= (and b!1318225 condMapEmpty!55463) mapIsEmpty!55463))

(assert (= (and b!1318225 (not condMapEmpty!55463)) mapNonEmpty!55463))

(get-info :version)

(assert (= (and mapNonEmpty!55463 ((_ is ValueCellFull!17040) mapValue!55463)) b!1318226))

(assert (= (and b!1318225 ((_ is ValueCellFull!17040) mapDefault!55463)) b!1318227))

(assert (= start!111400 b!1318225))

(declare-fun m!1205807 () Bool)

(assert (=> start!111400 m!1205807))

(declare-fun m!1205809 () Bool)

(assert (=> start!111400 m!1205809))

(declare-fun m!1205811 () Bool)

(assert (=> start!111400 m!1205811))

(declare-fun m!1205813 () Bool)

(assert (=> b!1318229 m!1205813))

(declare-fun m!1205815 () Bool)

(assert (=> mapNonEmpty!55463 m!1205815))

(declare-fun m!1205817 () Bool)

(assert (=> b!1318222 m!1205817))

(assert (=> b!1318222 m!1205817))

(declare-fun m!1205819 () Bool)

(assert (=> b!1318222 m!1205819))

(declare-fun m!1205821 () Bool)

(assert (=> b!1318223 m!1205821))

(declare-fun m!1205823 () Bool)

(assert (=> b!1318228 m!1205823))

(assert (=> b!1318219 m!1205821))

(assert (=> b!1318219 m!1205821))

(declare-fun m!1205825 () Bool)

(assert (=> b!1318219 m!1205825))

(check-sat (not b!1318228) (not b_next!30057) (not b!1318229) (not b!1318219) (not b!1318222) b_and!48277 (not start!111400) (not mapNonEmpty!55463) tp_is_empty!35877)
(check-sat b_and!48277 (not b_next!30057))
