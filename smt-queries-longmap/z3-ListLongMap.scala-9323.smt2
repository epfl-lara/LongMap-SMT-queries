; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111374 () Bool)

(assert start!111374)

(declare-fun b_free!30031 () Bool)

(declare-fun b_next!30031 () Bool)

(assert (=> start!111374 (= b_free!30031 (not b_next!30031))))

(declare-fun tp!105569 () Bool)

(declare-fun b_and!48233 () Bool)

(assert (=> start!111374 (= tp!105569 b_and!48233)))

(declare-fun b!1317822 () Bool)

(declare-fun e!752038 () Bool)

(assert (=> b!1317822 (= e!752038 false)))

(declare-datatypes ((array!88571 0))(
  ( (array!88572 (arr!42760 (Array (_ BitVec 32) (_ BitVec 64))) (size!43312 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88571)

(declare-fun lt!586236 () Bool)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52905 0))(
  ( (V!52906 (val!18000 Int)) )
))
(declare-fun zeroValue!1279 () V!52905)

(declare-datatypes ((ValueCell!17027 0))(
  ( (ValueCellFull!17027 (v!20629 V!52905)) (EmptyCell!17027) )
))
(declare-datatypes ((array!88573 0))(
  ( (array!88574 (arr!42761 (Array (_ BitVec 32) ValueCell!17027)) (size!43313 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88573)

(declare-fun minValue!1279 () V!52905)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23246 0))(
  ( (tuple2!23247 (_1!11634 (_ BitVec 64)) (_2!11634 V!52905)) )
))
(declare-datatypes ((List!30385 0))(
  ( (Nil!30382) (Cons!30381 (h!31590 tuple2!23246) (t!43985 List!30385)) )
))
(declare-datatypes ((ListLongMap!20903 0))(
  ( (ListLongMap!20904 (toList!10467 List!30385)) )
))
(declare-fun contains!8550 (ListLongMap!20903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5362 (array!88571 array!88573 (_ BitVec 32) (_ BitVec 32) V!52905 V!52905 (_ BitVec 32) Int) ListLongMap!20903)

(assert (=> b!1317822 (= lt!586236 (contains!8550 (getCurrentListMap!5362 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1317823 () Bool)

(declare-fun e!752039 () Bool)

(declare-fun e!752037 () Bool)

(declare-fun mapRes!55424 () Bool)

(assert (=> b!1317823 (= e!752039 (and e!752037 mapRes!55424))))

(declare-fun condMapEmpty!55424 () Bool)

(declare-fun mapDefault!55424 () ValueCell!17027)

(assert (=> b!1317823 (= condMapEmpty!55424 (= (arr!42761 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17027)) mapDefault!55424)))))

(declare-fun b!1317824 () Bool)

(declare-fun res!874626 () Bool)

(assert (=> b!1317824 (=> (not res!874626) (not e!752038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88571 (_ BitVec 32)) Bool)

(assert (=> b!1317824 (= res!874626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317825 () Bool)

(declare-fun res!874624 () Bool)

(assert (=> b!1317825 (=> (not res!874624) (not e!752038))))

(declare-datatypes ((List!30386 0))(
  ( (Nil!30383) (Cons!30382 (h!31591 (_ BitVec 64)) (t!43986 List!30386)) )
))
(declare-fun arrayNoDuplicates!0 (array!88571 (_ BitVec 32) List!30386) Bool)

(assert (=> b!1317825 (= res!874624 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30383))))

(declare-fun b!1317827 () Bool)

(declare-fun tp_is_empty!35851 () Bool)

(assert (=> b!1317827 (= e!752037 tp_is_empty!35851)))

(declare-fun b!1317828 () Bool)

(declare-fun res!874625 () Bool)

(assert (=> b!1317828 (=> (not res!874625) (not e!752038))))

(assert (=> b!1317828 (= res!874625 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43312 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55424 () Bool)

(assert (=> mapIsEmpty!55424 mapRes!55424))

(declare-fun mapNonEmpty!55424 () Bool)

(declare-fun tp!105570 () Bool)

(declare-fun e!752041 () Bool)

(assert (=> mapNonEmpty!55424 (= mapRes!55424 (and tp!105570 e!752041))))

(declare-fun mapKey!55424 () (_ BitVec 32))

(declare-fun mapValue!55424 () ValueCell!17027)

(declare-fun mapRest!55424 () (Array (_ BitVec 32) ValueCell!17027))

(assert (=> mapNonEmpty!55424 (= (arr!42761 _values!1337) (store mapRest!55424 mapKey!55424 mapValue!55424))))

(declare-fun b!1317829 () Bool)

(assert (=> b!1317829 (= e!752041 tp_is_empty!35851)))

(declare-fun res!874622 () Bool)

(assert (=> start!111374 (=> (not res!874622) (not e!752038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111374 (= res!874622 (validMask!0 mask!2019))))

(assert (=> start!111374 e!752038))

(declare-fun array_inv!32471 (array!88571) Bool)

(assert (=> start!111374 (array_inv!32471 _keys!1609)))

(assert (=> start!111374 true))

(assert (=> start!111374 tp_is_empty!35851))

(declare-fun array_inv!32472 (array!88573) Bool)

(assert (=> start!111374 (and (array_inv!32472 _values!1337) e!752039)))

(assert (=> start!111374 tp!105569))

(declare-fun b!1317826 () Bool)

(declare-fun res!874623 () Bool)

(assert (=> b!1317826 (=> (not res!874623) (not e!752038))))

(assert (=> b!1317826 (= res!874623 (and (= (size!43313 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43312 _keys!1609) (size!43313 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111374 res!874622) b!1317826))

(assert (= (and b!1317826 res!874623) b!1317824))

(assert (= (and b!1317824 res!874626) b!1317825))

(assert (= (and b!1317825 res!874624) b!1317828))

(assert (= (and b!1317828 res!874625) b!1317822))

(assert (= (and b!1317823 condMapEmpty!55424) mapIsEmpty!55424))

(assert (= (and b!1317823 (not condMapEmpty!55424)) mapNonEmpty!55424))

(get-info :version)

(assert (= (and mapNonEmpty!55424 ((_ is ValueCellFull!17027) mapValue!55424)) b!1317829))

(assert (= (and b!1317823 ((_ is ValueCellFull!17027) mapDefault!55424)) b!1317827))

(assert (= start!111374 b!1317823))

(declare-fun m!1205079 () Bool)

(assert (=> mapNonEmpty!55424 m!1205079))

(declare-fun m!1205081 () Bool)

(assert (=> b!1317825 m!1205081))

(declare-fun m!1205083 () Bool)

(assert (=> b!1317824 m!1205083))

(declare-fun m!1205085 () Bool)

(assert (=> b!1317822 m!1205085))

(assert (=> b!1317822 m!1205085))

(declare-fun m!1205087 () Bool)

(assert (=> b!1317822 m!1205087))

(declare-fun m!1205089 () Bool)

(assert (=> start!111374 m!1205089))

(declare-fun m!1205091 () Bool)

(assert (=> start!111374 m!1205091))

(declare-fun m!1205093 () Bool)

(assert (=> start!111374 m!1205093))

(check-sat (not b!1317825) b_and!48233 (not b!1317824) tp_is_empty!35851 (not mapNonEmpty!55424) (not b_next!30031) (not start!111374) (not b!1317822))
(check-sat b_and!48233 (not b_next!30031))
