; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111760 () Bool)

(assert start!111760)

(declare-fun b_free!30417 () Bool)

(declare-fun b_next!30417 () Bool)

(assert (=> start!111760 (= b_free!30417 (not b_next!30417))))

(declare-fun tp!106727 () Bool)

(declare-fun b_and!48955 () Bool)

(assert (=> start!111760 (= tp!106727 b_and!48955)))

(declare-fun b!1324300 () Bool)

(declare-fun res!879005 () Bool)

(declare-fun e!754969 () Bool)

(assert (=> b!1324300 (=> (not res!879005) (not e!754969))))

(declare-datatypes ((array!89390 0))(
  ( (array!89391 (arr!43169 (Array (_ BitVec 32) (_ BitVec 64))) (size!43719 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89390)

(declare-datatypes ((List!30601 0))(
  ( (Nil!30598) (Cons!30597 (h!31806 (_ BitVec 64)) (t!44527 List!30601)) )
))
(declare-fun arrayNoDuplicates!0 (array!89390 (_ BitVec 32) List!30601) Bool)

(assert (=> b!1324300 (= res!879005 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30598))))

(declare-fun b!1324301 () Bool)

(assert (=> b!1324301 (= e!754969 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53419 0))(
  ( (V!53420 (val!18193 Int)) )
))
(declare-fun zeroValue!1279 () V!53419)

(declare-datatypes ((ValueCell!17220 0))(
  ( (ValueCellFull!17220 (v!20823 V!53419)) (EmptyCell!17220) )
))
(declare-datatypes ((array!89392 0))(
  ( (array!89393 (arr!43170 (Array (_ BitVec 32) ValueCell!17220)) (size!43720 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89392)

(declare-fun minValue!1279 () V!53419)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun lt!589458 () Bool)

(declare-datatypes ((tuple2!23460 0))(
  ( (tuple2!23461 (_1!11741 (_ BitVec 64)) (_2!11741 V!53419)) )
))
(declare-datatypes ((List!30602 0))(
  ( (Nil!30599) (Cons!30598 (h!31807 tuple2!23460) (t!44528 List!30602)) )
))
(declare-datatypes ((ListLongMap!21117 0))(
  ( (ListLongMap!21118 (toList!10574 List!30602)) )
))
(declare-fun contains!8729 (ListLongMap!21117 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5570 (array!89390 array!89392 (_ BitVec 32) (_ BitVec 32) V!53419 V!53419 (_ BitVec 32) Int) ListLongMap!21117)

(assert (=> b!1324301 (= lt!589458 (contains!8729 (getCurrentListMap!5570 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324302 () Bool)

(declare-fun e!754967 () Bool)

(declare-fun tp_is_empty!36237 () Bool)

(assert (=> b!1324302 (= e!754967 tp_is_empty!36237)))

(declare-fun mapNonEmpty!56003 () Bool)

(declare-fun mapRes!56003 () Bool)

(declare-fun tp!106726 () Bool)

(declare-fun e!754966 () Bool)

(assert (=> mapNonEmpty!56003 (= mapRes!56003 (and tp!106726 e!754966))))

(declare-fun mapKey!56003 () (_ BitVec 32))

(declare-fun mapValue!56003 () ValueCell!17220)

(declare-fun mapRest!56003 () (Array (_ BitVec 32) ValueCell!17220))

(assert (=> mapNonEmpty!56003 (= (arr!43170 _values!1337) (store mapRest!56003 mapKey!56003 mapValue!56003))))

(declare-fun mapIsEmpty!56003 () Bool)

(assert (=> mapIsEmpty!56003 mapRes!56003))

(declare-fun b!1324304 () Bool)

(assert (=> b!1324304 (= e!754966 tp_is_empty!36237)))

(declare-fun b!1324305 () Bool)

(declare-fun res!879008 () Bool)

(assert (=> b!1324305 (=> (not res!879008) (not e!754969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89390 (_ BitVec 32)) Bool)

(assert (=> b!1324305 (= res!879008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324306 () Bool)

(declare-fun res!879006 () Bool)

(assert (=> b!1324306 (=> (not res!879006) (not e!754969))))

(assert (=> b!1324306 (= res!879006 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43719 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324307 () Bool)

(declare-fun e!754965 () Bool)

(assert (=> b!1324307 (= e!754965 (and e!754967 mapRes!56003))))

(declare-fun condMapEmpty!56003 () Bool)

(declare-fun mapDefault!56003 () ValueCell!17220)

(assert (=> b!1324307 (= condMapEmpty!56003 (= (arr!43170 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17220)) mapDefault!56003)))))

(declare-fun res!879007 () Bool)

(assert (=> start!111760 (=> (not res!879007) (not e!754969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111760 (= res!879007 (validMask!0 mask!2019))))

(assert (=> start!111760 e!754969))

(declare-fun array_inv!32587 (array!89390) Bool)

(assert (=> start!111760 (array_inv!32587 _keys!1609)))

(assert (=> start!111760 true))

(assert (=> start!111760 tp_is_empty!36237))

(declare-fun array_inv!32588 (array!89392) Bool)

(assert (=> start!111760 (and (array_inv!32588 _values!1337) e!754965)))

(assert (=> start!111760 tp!106727))

(declare-fun b!1324303 () Bool)

(declare-fun res!879004 () Bool)

(assert (=> b!1324303 (=> (not res!879004) (not e!754969))))

(assert (=> b!1324303 (= res!879004 (and (= (size!43720 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43719 _keys!1609) (size!43720 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111760 res!879007) b!1324303))

(assert (= (and b!1324303 res!879004) b!1324305))

(assert (= (and b!1324305 res!879008) b!1324300))

(assert (= (and b!1324300 res!879005) b!1324306))

(assert (= (and b!1324306 res!879006) b!1324301))

(assert (= (and b!1324307 condMapEmpty!56003) mapIsEmpty!56003))

(assert (= (and b!1324307 (not condMapEmpty!56003)) mapNonEmpty!56003))

(get-info :version)

(assert (= (and mapNonEmpty!56003 ((_ is ValueCellFull!17220) mapValue!56003)) b!1324304))

(assert (= (and b!1324307 ((_ is ValueCellFull!17220) mapDefault!56003)) b!1324302))

(assert (= start!111760 b!1324307))

(declare-fun m!1213207 () Bool)

(assert (=> b!1324305 m!1213207))

(declare-fun m!1213209 () Bool)

(assert (=> start!111760 m!1213209))

(declare-fun m!1213211 () Bool)

(assert (=> start!111760 m!1213211))

(declare-fun m!1213213 () Bool)

(assert (=> start!111760 m!1213213))

(declare-fun m!1213215 () Bool)

(assert (=> b!1324301 m!1213215))

(assert (=> b!1324301 m!1213215))

(declare-fun m!1213217 () Bool)

(assert (=> b!1324301 m!1213217))

(declare-fun m!1213219 () Bool)

(assert (=> b!1324300 m!1213219))

(declare-fun m!1213221 () Bool)

(assert (=> mapNonEmpty!56003 m!1213221))

(check-sat (not b!1324301) (not b_next!30417) (not b!1324305) (not b!1324300) b_and!48955 tp_is_empty!36237 (not mapNonEmpty!56003) (not start!111760))
(check-sat b_and!48955 (not b_next!30417))
