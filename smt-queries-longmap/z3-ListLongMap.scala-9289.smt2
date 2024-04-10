; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111084 () Bool)

(assert start!111084)

(declare-fun b_free!29919 () Bool)

(declare-fun b_next!29919 () Bool)

(assert (=> start!111084 (= b_free!29919 (not b_next!29919))))

(declare-fun tp!105078 () Bool)

(declare-fun b_and!48127 () Bool)

(assert (=> start!111084 (= tp!105078 b_and!48127)))

(declare-fun b!1315222 () Bool)

(declare-fun e!750256 () Bool)

(assert (=> b!1315222 (= e!750256 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88262 0))(
  ( (array!88263 (arr!42611 (Array (_ BitVec 32) (_ BitVec 64))) (size!43161 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88262)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52635 0))(
  ( (V!52636 (val!17899 Int)) )
))
(declare-datatypes ((ValueCell!16926 0))(
  ( (ValueCellFull!16926 (v!20526 V!52635)) (EmptyCell!16926) )
))
(declare-datatypes ((array!88264 0))(
  ( (array!88265 (arr!42612 (Array (_ BitVec 32) ValueCell!16926)) (size!43162 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88264)

(declare-fun zeroValue!1296 () V!52635)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52635)

(declare-datatypes ((tuple2!23088 0))(
  ( (tuple2!23089 (_1!11555 (_ BitVec 64)) (_2!11555 V!52635)) )
))
(declare-datatypes ((List!30223 0))(
  ( (Nil!30220) (Cons!30219 (h!31428 tuple2!23088) (t!43829 List!30223)) )
))
(declare-datatypes ((ListLongMap!20745 0))(
  ( (ListLongMap!20746 (toList!10388 List!30223)) )
))
(declare-fun contains!8538 (ListLongMap!20745 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5401 (array!88262 array!88264 (_ BitVec 32) (_ BitVec 32) V!52635 V!52635 (_ BitVec 32) Int) ListLongMap!20745)

(assert (=> b!1315222 (contains!8538 (getCurrentListMap!5401 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43392 0))(
  ( (Unit!43393) )
))
(declare-fun lt!585888 () Unit!43392)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!21 (array!88262 array!88264 (_ BitVec 32) (_ BitVec 32) V!52635 V!52635 (_ BitVec 64) (_ BitVec 32) Int) Unit!43392)

(assert (=> b!1315222 (= lt!585888 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!21 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1315223 () Bool)

(declare-fun res!873138 () Bool)

(assert (=> b!1315223 (=> (not res!873138) (not e!750256))))

(assert (=> b!1315223 (= res!873138 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43161 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315224 () Bool)

(declare-fun res!873134 () Bool)

(assert (=> b!1315224 (=> (not res!873134) (not e!750256))))

(assert (=> b!1315224 (= res!873134 (and (= (size!43162 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43161 _keys!1628) (size!43162 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315225 () Bool)

(declare-fun e!750253 () Bool)

(declare-fun tp_is_empty!35649 () Bool)

(assert (=> b!1315225 (= e!750253 tp_is_empty!35649)))

(declare-fun mapNonEmpty!55102 () Bool)

(declare-fun mapRes!55102 () Bool)

(declare-fun tp!105079 () Bool)

(declare-fun e!750257 () Bool)

(assert (=> mapNonEmpty!55102 (= mapRes!55102 (and tp!105079 e!750257))))

(declare-fun mapKey!55102 () (_ BitVec 32))

(declare-fun mapValue!55102 () ValueCell!16926)

(declare-fun mapRest!55102 () (Array (_ BitVec 32) ValueCell!16926))

(assert (=> mapNonEmpty!55102 (= (arr!42612 _values!1354) (store mapRest!55102 mapKey!55102 mapValue!55102))))

(declare-fun b!1315226 () Bool)

(declare-fun res!873135 () Bool)

(assert (=> b!1315226 (=> (not res!873135) (not e!750256))))

(declare-datatypes ((List!30224 0))(
  ( (Nil!30221) (Cons!30220 (h!31429 (_ BitVec 64)) (t!43830 List!30224)) )
))
(declare-fun arrayNoDuplicates!0 (array!88262 (_ BitVec 32) List!30224) Bool)

(assert (=> b!1315226 (= res!873135 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30221))))

(declare-fun b!1315227 () Bool)

(assert (=> b!1315227 (= e!750257 tp_is_empty!35649)))

(declare-fun b!1315228 () Bool)

(declare-fun res!873133 () Bool)

(assert (=> b!1315228 (=> (not res!873133) (not e!750256))))

(assert (=> b!1315228 (= res!873133 (not (= (select (arr!42611 _keys!1628) from!2020) k0!1175)))))

(declare-fun res!873137 () Bool)

(assert (=> start!111084 (=> (not res!873137) (not e!750256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111084 (= res!873137 (validMask!0 mask!2040))))

(assert (=> start!111084 e!750256))

(assert (=> start!111084 tp!105078))

(declare-fun array_inv!32181 (array!88262) Bool)

(assert (=> start!111084 (array_inv!32181 _keys!1628)))

(assert (=> start!111084 true))

(assert (=> start!111084 tp_is_empty!35649))

(declare-fun e!750255 () Bool)

(declare-fun array_inv!32182 (array!88264) Bool)

(assert (=> start!111084 (and (array_inv!32182 _values!1354) e!750255)))

(declare-fun b!1315229 () Bool)

(declare-fun res!873132 () Bool)

(assert (=> b!1315229 (=> (not res!873132) (not e!750256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88262 (_ BitVec 32)) Bool)

(assert (=> b!1315229 (= res!873132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315230 () Bool)

(declare-fun res!873136 () Bool)

(assert (=> b!1315230 (=> (not res!873136) (not e!750256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1315230 (= res!873136 (validKeyInArray!0 (select (arr!42611 _keys!1628) from!2020)))))

(declare-fun b!1315231 () Bool)

(declare-fun res!873130 () Bool)

(assert (=> b!1315231 (=> (not res!873130) (not e!750256))))

(assert (=> b!1315231 (= res!873130 (contains!8538 (getCurrentListMap!5401 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315232 () Bool)

(assert (=> b!1315232 (= e!750255 (and e!750253 mapRes!55102))))

(declare-fun condMapEmpty!55102 () Bool)

(declare-fun mapDefault!55102 () ValueCell!16926)

(assert (=> b!1315232 (= condMapEmpty!55102 (= (arr!42612 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16926)) mapDefault!55102)))))

(declare-fun b!1315233 () Bool)

(declare-fun res!873131 () Bool)

(assert (=> b!1315233 (=> (not res!873131) (not e!750256))))

(assert (=> b!1315233 (= res!873131 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!55102 () Bool)

(assert (=> mapIsEmpty!55102 mapRes!55102))

(assert (= (and start!111084 res!873137) b!1315224))

(assert (= (and b!1315224 res!873134) b!1315229))

(assert (= (and b!1315229 res!873132) b!1315226))

(assert (= (and b!1315226 res!873135) b!1315223))

(assert (= (and b!1315223 res!873138) b!1315231))

(assert (= (and b!1315231 res!873130) b!1315228))

(assert (= (and b!1315228 res!873133) b!1315230))

(assert (= (and b!1315230 res!873136) b!1315233))

(assert (= (and b!1315233 res!873131) b!1315222))

(assert (= (and b!1315232 condMapEmpty!55102) mapIsEmpty!55102))

(assert (= (and b!1315232 (not condMapEmpty!55102)) mapNonEmpty!55102))

(get-info :version)

(assert (= (and mapNonEmpty!55102 ((_ is ValueCellFull!16926) mapValue!55102)) b!1315227))

(assert (= (and b!1315232 ((_ is ValueCellFull!16926) mapDefault!55102)) b!1315225))

(assert (= start!111084 b!1315232))

(declare-fun m!1203479 () Bool)

(assert (=> b!1315230 m!1203479))

(assert (=> b!1315230 m!1203479))

(declare-fun m!1203481 () Bool)

(assert (=> b!1315230 m!1203481))

(declare-fun m!1203483 () Bool)

(assert (=> mapNonEmpty!55102 m!1203483))

(declare-fun m!1203485 () Bool)

(assert (=> start!111084 m!1203485))

(declare-fun m!1203487 () Bool)

(assert (=> start!111084 m!1203487))

(declare-fun m!1203489 () Bool)

(assert (=> start!111084 m!1203489))

(declare-fun m!1203491 () Bool)

(assert (=> b!1315229 m!1203491))

(declare-fun m!1203493 () Bool)

(assert (=> b!1315231 m!1203493))

(assert (=> b!1315231 m!1203493))

(declare-fun m!1203495 () Bool)

(assert (=> b!1315231 m!1203495))

(assert (=> b!1315228 m!1203479))

(declare-fun m!1203497 () Bool)

(assert (=> b!1315222 m!1203497))

(assert (=> b!1315222 m!1203497))

(declare-fun m!1203499 () Bool)

(assert (=> b!1315222 m!1203499))

(declare-fun m!1203501 () Bool)

(assert (=> b!1315222 m!1203501))

(declare-fun m!1203503 () Bool)

(assert (=> b!1315226 m!1203503))

(check-sat b_and!48127 (not b!1315229) (not b!1315222) (not b_next!29919) (not b!1315231) (not mapNonEmpty!55102) (not b!1315226) (not b!1315230) (not start!111084) tp_is_empty!35649)
(check-sat b_and!48127 (not b_next!29919))
