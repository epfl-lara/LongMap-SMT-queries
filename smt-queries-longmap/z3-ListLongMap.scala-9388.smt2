; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111766 () Bool)

(assert start!111766)

(declare-fun b_free!30423 () Bool)

(declare-fun b_next!30423 () Bool)

(assert (=> start!111766 (= b_free!30423 (not b_next!30423))))

(declare-fun tp!106745 () Bool)

(declare-fun b_and!48961 () Bool)

(assert (=> start!111766 (= tp!106745 b_and!48961)))

(declare-fun b!1324372 () Bool)

(declare-fun res!879051 () Bool)

(declare-fun e!755013 () Bool)

(assert (=> b!1324372 (=> (not res!879051) (not e!755013))))

(declare-datatypes ((array!89402 0))(
  ( (array!89403 (arr!43175 (Array (_ BitVec 32) (_ BitVec 64))) (size!43725 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89402)

(declare-datatypes ((List!30605 0))(
  ( (Nil!30602) (Cons!30601 (h!31810 (_ BitVec 64)) (t!44531 List!30605)) )
))
(declare-fun arrayNoDuplicates!0 (array!89402 (_ BitVec 32) List!30605) Bool)

(assert (=> b!1324372 (= res!879051 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30602))))

(declare-fun mapIsEmpty!56012 () Bool)

(declare-fun mapRes!56012 () Bool)

(assert (=> mapIsEmpty!56012 mapRes!56012))

(declare-fun res!879053 () Bool)

(assert (=> start!111766 (=> (not res!879053) (not e!755013))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111766 (= res!879053 (validMask!0 mask!2019))))

(assert (=> start!111766 e!755013))

(declare-fun array_inv!32593 (array!89402) Bool)

(assert (=> start!111766 (array_inv!32593 _keys!1609)))

(assert (=> start!111766 true))

(declare-fun tp_is_empty!36243 () Bool)

(assert (=> start!111766 tp_is_empty!36243))

(declare-datatypes ((V!53427 0))(
  ( (V!53428 (val!18196 Int)) )
))
(declare-datatypes ((ValueCell!17223 0))(
  ( (ValueCellFull!17223 (v!20826 V!53427)) (EmptyCell!17223) )
))
(declare-datatypes ((array!89404 0))(
  ( (array!89405 (arr!43176 (Array (_ BitVec 32) ValueCell!17223)) (size!43726 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89404)

(declare-fun e!755010 () Bool)

(declare-fun array_inv!32594 (array!89404) Bool)

(assert (=> start!111766 (and (array_inv!32594 _values!1337) e!755010)))

(assert (=> start!111766 tp!106745))

(declare-fun b!1324373 () Bool)

(declare-fun e!755011 () Bool)

(assert (=> b!1324373 (= e!755011 tp_is_empty!36243)))

(declare-fun b!1324374 () Bool)

(assert (=> b!1324374 (= e!755013 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53427)

(declare-fun minValue!1279 () V!53427)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun lt!589467 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23462 0))(
  ( (tuple2!23463 (_1!11742 (_ BitVec 64)) (_2!11742 V!53427)) )
))
(declare-datatypes ((List!30606 0))(
  ( (Nil!30603) (Cons!30602 (h!31811 tuple2!23462) (t!44532 List!30606)) )
))
(declare-datatypes ((ListLongMap!21119 0))(
  ( (ListLongMap!21120 (toList!10575 List!30606)) )
))
(declare-fun contains!8730 (ListLongMap!21119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5571 (array!89402 array!89404 (_ BitVec 32) (_ BitVec 32) V!53427 V!53427 (_ BitVec 32) Int) ListLongMap!21119)

(assert (=> b!1324374 (= lt!589467 (contains!8730 (getCurrentListMap!5571 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324375 () Bool)

(declare-fun res!879049 () Bool)

(assert (=> b!1324375 (=> (not res!879049) (not e!755013))))

(assert (=> b!1324375 (= res!879049 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43725 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56012 () Bool)

(declare-fun tp!106744 () Bool)

(assert (=> mapNonEmpty!56012 (= mapRes!56012 (and tp!106744 e!755011))))

(declare-fun mapValue!56012 () ValueCell!17223)

(declare-fun mapRest!56012 () (Array (_ BitVec 32) ValueCell!17223))

(declare-fun mapKey!56012 () (_ BitVec 32))

(assert (=> mapNonEmpty!56012 (= (arr!43176 _values!1337) (store mapRest!56012 mapKey!56012 mapValue!56012))))

(declare-fun b!1324376 () Bool)

(declare-fun res!879050 () Bool)

(assert (=> b!1324376 (=> (not res!879050) (not e!755013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89402 (_ BitVec 32)) Bool)

(assert (=> b!1324376 (= res!879050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324377 () Bool)

(declare-fun res!879052 () Bool)

(assert (=> b!1324377 (=> (not res!879052) (not e!755013))))

(assert (=> b!1324377 (= res!879052 (and (= (size!43726 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43725 _keys!1609) (size!43726 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324378 () Bool)

(declare-fun e!755012 () Bool)

(assert (=> b!1324378 (= e!755012 tp_is_empty!36243)))

(declare-fun b!1324379 () Bool)

(assert (=> b!1324379 (= e!755010 (and e!755012 mapRes!56012))))

(declare-fun condMapEmpty!56012 () Bool)

(declare-fun mapDefault!56012 () ValueCell!17223)

(assert (=> b!1324379 (= condMapEmpty!56012 (= (arr!43176 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17223)) mapDefault!56012)))))

(assert (= (and start!111766 res!879053) b!1324377))

(assert (= (and b!1324377 res!879052) b!1324376))

(assert (= (and b!1324376 res!879050) b!1324372))

(assert (= (and b!1324372 res!879051) b!1324375))

(assert (= (and b!1324375 res!879049) b!1324374))

(assert (= (and b!1324379 condMapEmpty!56012) mapIsEmpty!56012))

(assert (= (and b!1324379 (not condMapEmpty!56012)) mapNonEmpty!56012))

(get-info :version)

(assert (= (and mapNonEmpty!56012 ((_ is ValueCellFull!17223) mapValue!56012)) b!1324373))

(assert (= (and b!1324379 ((_ is ValueCellFull!17223) mapDefault!56012)) b!1324378))

(assert (= start!111766 b!1324379))

(declare-fun m!1213255 () Bool)

(assert (=> b!1324372 m!1213255))

(declare-fun m!1213257 () Bool)

(assert (=> b!1324376 m!1213257))

(declare-fun m!1213259 () Bool)

(assert (=> mapNonEmpty!56012 m!1213259))

(declare-fun m!1213261 () Bool)

(assert (=> b!1324374 m!1213261))

(assert (=> b!1324374 m!1213261))

(declare-fun m!1213263 () Bool)

(assert (=> b!1324374 m!1213263))

(declare-fun m!1213265 () Bool)

(assert (=> start!111766 m!1213265))

(declare-fun m!1213267 () Bool)

(assert (=> start!111766 m!1213267))

(declare-fun m!1213269 () Bool)

(assert (=> start!111766 m!1213269))

(check-sat (not start!111766) (not b!1324372) (not b_next!30423) (not mapNonEmpty!56012) tp_is_empty!36243 b_and!48961 (not b!1324376) (not b!1324374))
(check-sat b_and!48961 (not b_next!30423))
