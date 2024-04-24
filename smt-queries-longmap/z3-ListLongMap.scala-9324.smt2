; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111604 () Bool)

(assert start!111604)

(declare-fun b_free!30037 () Bool)

(declare-fun b_next!30037 () Bool)

(assert (=> start!111604 (= b_free!30037 (not b_next!30037))))

(declare-fun tp!105586 () Bool)

(declare-fun b_and!48259 () Bool)

(assert (=> start!111604 (= tp!105586 b_and!48259)))

(declare-fun b!1319263 () Bool)

(declare-fun res!875215 () Bool)

(declare-fun e!752962 () Bool)

(assert (=> b!1319263 (=> (not res!875215) (not e!752962))))

(declare-datatypes ((array!88733 0))(
  ( (array!88734 (arr!42836 (Array (_ BitVec 32) (_ BitVec 64))) (size!43387 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88733)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52913 0))(
  ( (V!52914 (val!18003 Int)) )
))
(declare-datatypes ((ValueCell!17030 0))(
  ( (ValueCellFull!17030 (v!20628 V!52913)) (EmptyCell!17030) )
))
(declare-datatypes ((array!88735 0))(
  ( (array!88736 (arr!42837 (Array (_ BitVec 32) ValueCell!17030)) (size!43388 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88735)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1319263 (= res!875215 (and (= (size!43388 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43387 _keys!1609) (size!43388 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319264 () Bool)

(declare-fun res!875214 () Bool)

(assert (=> b!1319264 (=> (not res!875214) (not e!752962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88733 (_ BitVec 32)) Bool)

(assert (=> b!1319264 (= res!875214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319265 () Bool)

(declare-fun e!752961 () Bool)

(declare-fun tp_is_empty!35857 () Bool)

(assert (=> b!1319265 (= e!752961 tp_is_empty!35857)))

(declare-fun b!1319266 () Bool)

(declare-fun res!875217 () Bool)

(assert (=> b!1319266 (=> (not res!875217) (not e!752962))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1319266 (= res!875217 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43387 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55433 () Bool)

(declare-fun mapRes!55433 () Bool)

(declare-fun tp!105587 () Bool)

(assert (=> mapNonEmpty!55433 (= mapRes!55433 (and tp!105587 e!752961))))

(declare-fun mapKey!55433 () (_ BitVec 32))

(declare-fun mapValue!55433 () ValueCell!17030)

(declare-fun mapRest!55433 () (Array (_ BitVec 32) ValueCell!17030))

(assert (=> mapNonEmpty!55433 (= (arr!42837 _values!1337) (store mapRest!55433 mapKey!55433 mapValue!55433))))

(declare-fun b!1319267 () Bool)

(declare-fun res!875218 () Bool)

(assert (=> b!1319267 (=> (not res!875218) (not e!752962))))

(declare-datatypes ((List!30363 0))(
  ( (Nil!30360) (Cons!30359 (h!31577 (_ BitVec 64)) (t!43963 List!30363)) )
))
(declare-fun arrayNoDuplicates!0 (array!88733 (_ BitVec 32) List!30363) Bool)

(assert (=> b!1319267 (= res!875218 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30360))))

(declare-fun b!1319268 () Bool)

(declare-fun e!752959 () Bool)

(declare-fun e!752958 () Bool)

(assert (=> b!1319268 (= e!752959 (and e!752958 mapRes!55433))))

(declare-fun condMapEmpty!55433 () Bool)

(declare-fun mapDefault!55433 () ValueCell!17030)

(assert (=> b!1319268 (= condMapEmpty!55433 (= (arr!42837 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17030)) mapDefault!55433)))))

(declare-fun res!875216 () Bool)

(assert (=> start!111604 (=> (not res!875216) (not e!752962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111604 (= res!875216 (validMask!0 mask!2019))))

(assert (=> start!111604 e!752962))

(declare-fun array_inv!32619 (array!88733) Bool)

(assert (=> start!111604 (array_inv!32619 _keys!1609)))

(assert (=> start!111604 true))

(assert (=> start!111604 tp_is_empty!35857))

(declare-fun array_inv!32620 (array!88735) Bool)

(assert (=> start!111604 (and (array_inv!32620 _values!1337) e!752959)))

(assert (=> start!111604 tp!105586))

(declare-fun b!1319269 () Bool)

(assert (=> b!1319269 (= e!752958 tp_is_empty!35857)))

(declare-fun mapIsEmpty!55433 () Bool)

(assert (=> mapIsEmpty!55433 mapRes!55433))

(declare-fun b!1319270 () Bool)

(assert (=> b!1319270 (= e!752962 false)))

(declare-fun zeroValue!1279 () V!52913)

(declare-fun minValue!1279 () V!52913)

(declare-fun lt!586907 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23200 0))(
  ( (tuple2!23201 (_1!11611 (_ BitVec 64)) (_2!11611 V!52913)) )
))
(declare-datatypes ((List!30364 0))(
  ( (Nil!30361) (Cons!30360 (h!31578 tuple2!23200) (t!43964 List!30364)) )
))
(declare-datatypes ((ListLongMap!20865 0))(
  ( (ListLongMap!20866 (toList!10448 List!30364)) )
))
(declare-fun contains!8615 (ListLongMap!20865 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5452 (array!88733 array!88735 (_ BitVec 32) (_ BitVec 32) V!52913 V!52913 (_ BitVec 32) Int) ListLongMap!20865)

(assert (=> b!1319270 (= lt!586907 (contains!8615 (getCurrentListMap!5452 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111604 res!875216) b!1319263))

(assert (= (and b!1319263 res!875215) b!1319264))

(assert (= (and b!1319264 res!875214) b!1319267))

(assert (= (and b!1319267 res!875218) b!1319266))

(assert (= (and b!1319266 res!875217) b!1319270))

(assert (= (and b!1319268 condMapEmpty!55433) mapIsEmpty!55433))

(assert (= (and b!1319268 (not condMapEmpty!55433)) mapNonEmpty!55433))

(get-info :version)

(assert (= (and mapNonEmpty!55433 ((_ is ValueCellFull!17030) mapValue!55433)) b!1319265))

(assert (= (and b!1319268 ((_ is ValueCellFull!17030) mapDefault!55433)) b!1319269))

(assert (= start!111604 b!1319268))

(declare-fun m!1207241 () Bool)

(assert (=> b!1319267 m!1207241))

(declare-fun m!1207243 () Bool)

(assert (=> b!1319270 m!1207243))

(assert (=> b!1319270 m!1207243))

(declare-fun m!1207245 () Bool)

(assert (=> b!1319270 m!1207245))

(declare-fun m!1207247 () Bool)

(assert (=> start!111604 m!1207247))

(declare-fun m!1207249 () Bool)

(assert (=> start!111604 m!1207249))

(declare-fun m!1207251 () Bool)

(assert (=> start!111604 m!1207251))

(declare-fun m!1207253 () Bool)

(assert (=> mapNonEmpty!55433 m!1207253))

(declare-fun m!1207255 () Bool)

(assert (=> b!1319264 m!1207255))

(check-sat (not mapNonEmpty!55433) b_and!48259 (not b_next!30037) (not b!1319267) (not start!111604) (not b!1319270) tp_is_empty!35857 (not b!1319264))
(check-sat b_and!48259 (not b_next!30037))
