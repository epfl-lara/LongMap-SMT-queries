; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111610 () Bool)

(assert start!111610)

(declare-fun b_free!30043 () Bool)

(declare-fun b_next!30043 () Bool)

(assert (=> start!111610 (= b_free!30043 (not b_next!30043))))

(declare-fun tp!105605 () Bool)

(declare-fun b_and!48265 () Bool)

(assert (=> start!111610 (= tp!105605 b_and!48265)))

(declare-fun b!1319335 () Bool)

(declare-fun e!753005 () Bool)

(assert (=> b!1319335 (= e!753005 false)))

(declare-datatypes ((array!88745 0))(
  ( (array!88746 (arr!42842 (Array (_ BitVec 32) (_ BitVec 64))) (size!43393 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88745)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52921 0))(
  ( (V!52922 (val!18006 Int)) )
))
(declare-fun zeroValue!1279 () V!52921)

(declare-fun minValue!1279 () V!52921)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun lt!586916 () Bool)

(declare-datatypes ((ValueCell!17033 0))(
  ( (ValueCellFull!17033 (v!20631 V!52921)) (EmptyCell!17033) )
))
(declare-datatypes ((array!88747 0))(
  ( (array!88748 (arr!42843 (Array (_ BitVec 32) ValueCell!17033)) (size!43394 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88747)

(declare-datatypes ((tuple2!23202 0))(
  ( (tuple2!23203 (_1!11612 (_ BitVec 64)) (_2!11612 V!52921)) )
))
(declare-datatypes ((List!30365 0))(
  ( (Nil!30362) (Cons!30361 (h!31579 tuple2!23202) (t!43965 List!30365)) )
))
(declare-datatypes ((ListLongMap!20867 0))(
  ( (ListLongMap!20868 (toList!10449 List!30365)) )
))
(declare-fun contains!8616 (ListLongMap!20867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5453 (array!88745 array!88747 (_ BitVec 32) (_ BitVec 32) V!52921 V!52921 (_ BitVec 32) Int) ListLongMap!20867)

(assert (=> b!1319335 (= lt!586916 (contains!8616 (getCurrentListMap!5453 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!875260 () Bool)

(assert (=> start!111610 (=> (not res!875260) (not e!753005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111610 (= res!875260 (validMask!0 mask!2019))))

(assert (=> start!111610 e!753005))

(declare-fun array_inv!32625 (array!88745) Bool)

(assert (=> start!111610 (array_inv!32625 _keys!1609)))

(assert (=> start!111610 true))

(declare-fun tp_is_empty!35863 () Bool)

(assert (=> start!111610 tp_is_empty!35863))

(declare-fun e!753006 () Bool)

(declare-fun array_inv!32626 (array!88747) Bool)

(assert (=> start!111610 (and (array_inv!32626 _values!1337) e!753006)))

(assert (=> start!111610 tp!105605))

(declare-fun b!1319336 () Bool)

(declare-fun res!875262 () Bool)

(assert (=> b!1319336 (=> (not res!875262) (not e!753005))))

(declare-datatypes ((List!30366 0))(
  ( (Nil!30363) (Cons!30362 (h!31580 (_ BitVec 64)) (t!43966 List!30366)) )
))
(declare-fun arrayNoDuplicates!0 (array!88745 (_ BitVec 32) List!30366) Bool)

(assert (=> b!1319336 (= res!875262 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30363))))

(declare-fun b!1319337 () Bool)

(declare-fun e!753007 () Bool)

(declare-fun mapRes!55442 () Bool)

(assert (=> b!1319337 (= e!753006 (and e!753007 mapRes!55442))))

(declare-fun condMapEmpty!55442 () Bool)

(declare-fun mapDefault!55442 () ValueCell!17033)

(assert (=> b!1319337 (= condMapEmpty!55442 (= (arr!42843 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17033)) mapDefault!55442)))))

(declare-fun mapIsEmpty!55442 () Bool)

(assert (=> mapIsEmpty!55442 mapRes!55442))

(declare-fun b!1319338 () Bool)

(declare-fun res!875261 () Bool)

(assert (=> b!1319338 (=> (not res!875261) (not e!753005))))

(assert (=> b!1319338 (= res!875261 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43393 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319339 () Bool)

(declare-fun e!753004 () Bool)

(assert (=> b!1319339 (= e!753004 tp_is_empty!35863)))

(declare-fun b!1319340 () Bool)

(assert (=> b!1319340 (= e!753007 tp_is_empty!35863)))

(declare-fun b!1319341 () Bool)

(declare-fun res!875259 () Bool)

(assert (=> b!1319341 (=> (not res!875259) (not e!753005))))

(assert (=> b!1319341 (= res!875259 (and (= (size!43394 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43393 _keys!1609) (size!43394 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55442 () Bool)

(declare-fun tp!105604 () Bool)

(assert (=> mapNonEmpty!55442 (= mapRes!55442 (and tp!105604 e!753004))))

(declare-fun mapRest!55442 () (Array (_ BitVec 32) ValueCell!17033))

(declare-fun mapKey!55442 () (_ BitVec 32))

(declare-fun mapValue!55442 () ValueCell!17033)

(assert (=> mapNonEmpty!55442 (= (arr!42843 _values!1337) (store mapRest!55442 mapKey!55442 mapValue!55442))))

(declare-fun b!1319342 () Bool)

(declare-fun res!875263 () Bool)

(assert (=> b!1319342 (=> (not res!875263) (not e!753005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88745 (_ BitVec 32)) Bool)

(assert (=> b!1319342 (= res!875263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111610 res!875260) b!1319341))

(assert (= (and b!1319341 res!875259) b!1319342))

(assert (= (and b!1319342 res!875263) b!1319336))

(assert (= (and b!1319336 res!875262) b!1319338))

(assert (= (and b!1319338 res!875261) b!1319335))

(assert (= (and b!1319337 condMapEmpty!55442) mapIsEmpty!55442))

(assert (= (and b!1319337 (not condMapEmpty!55442)) mapNonEmpty!55442))

(get-info :version)

(assert (= (and mapNonEmpty!55442 ((_ is ValueCellFull!17033) mapValue!55442)) b!1319339))

(assert (= (and b!1319337 ((_ is ValueCellFull!17033) mapDefault!55442)) b!1319340))

(assert (= start!111610 b!1319337))

(declare-fun m!1207289 () Bool)

(assert (=> b!1319335 m!1207289))

(assert (=> b!1319335 m!1207289))

(declare-fun m!1207291 () Bool)

(assert (=> b!1319335 m!1207291))

(declare-fun m!1207293 () Bool)

(assert (=> start!111610 m!1207293))

(declare-fun m!1207295 () Bool)

(assert (=> start!111610 m!1207295))

(declare-fun m!1207297 () Bool)

(assert (=> start!111610 m!1207297))

(declare-fun m!1207299 () Bool)

(assert (=> b!1319342 m!1207299))

(declare-fun m!1207301 () Bool)

(assert (=> mapNonEmpty!55442 m!1207301))

(declare-fun m!1207303 () Bool)

(assert (=> b!1319336 m!1207303))

(check-sat (not mapNonEmpty!55442) (not b_next!30043) (not b!1319342) (not b!1319335) (not b!1319336) b_and!48265 (not start!111610) tp_is_empty!35863)
(check-sat b_and!48265 (not b_next!30043))
