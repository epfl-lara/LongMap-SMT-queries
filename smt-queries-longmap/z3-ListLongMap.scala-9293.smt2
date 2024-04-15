; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111106 () Bool)

(assert start!111106)

(declare-fun b_free!29941 () Bool)

(declare-fun b_next!29941 () Bool)

(assert (=> start!111106 (= b_free!29941 (not b_next!29941))))

(declare-fun tp!105145 () Bool)

(declare-fun b_and!48131 () Bool)

(assert (=> start!111106 (= tp!105145 b_and!48131)))

(declare-fun b!1315432 () Bool)

(declare-fun res!873286 () Bool)

(declare-fun e!750388 () Bool)

(assert (=> b!1315432 (=> (not res!873286) (not e!750388))))

(declare-datatypes ((array!88215 0))(
  ( (array!88216 (arr!42588 (Array (_ BitVec 32) (_ BitVec 64))) (size!43140 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88215)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52665 0))(
  ( (V!52666 (val!17910 Int)) )
))
(declare-datatypes ((ValueCell!16937 0))(
  ( (ValueCellFull!16937 (v!20536 V!52665)) (EmptyCell!16937) )
))
(declare-datatypes ((array!88217 0))(
  ( (array!88218 (arr!42589 (Array (_ BitVec 32) ValueCell!16937)) (size!43141 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88217)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315432 (= res!873286 (and (= (size!43141 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43140 _keys!1628) (size!43141 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315433 () Bool)

(declare-fun res!873284 () Bool)

(assert (=> b!1315433 (=> (not res!873284) (not e!750388))))

(declare-datatypes ((List!30308 0))(
  ( (Nil!30305) (Cons!30304 (h!31513 (_ BitVec 64)) (t!43906 List!30308)) )
))
(declare-fun arrayNoDuplicates!0 (array!88215 (_ BitVec 32) List!30308) Bool)

(assert (=> b!1315433 (= res!873284 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30305))))

(declare-fun res!873285 () Bool)

(assert (=> start!111106 (=> (not res!873285) (not e!750388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111106 (= res!873285 (validMask!0 mask!2040))))

(assert (=> start!111106 e!750388))

(assert (=> start!111106 tp!105145))

(declare-fun array_inv!32353 (array!88215) Bool)

(assert (=> start!111106 (array_inv!32353 _keys!1628)))

(assert (=> start!111106 true))

(declare-fun tp_is_empty!35671 () Bool)

(assert (=> start!111106 tp_is_empty!35671))

(declare-fun e!750386 () Bool)

(declare-fun array_inv!32354 (array!88217) Bool)

(assert (=> start!111106 (and (array_inv!32354 _values!1354) e!750386)))

(declare-fun b!1315434 () Bool)

(declare-fun e!750385 () Bool)

(assert (=> b!1315434 (= e!750385 tp_is_empty!35671)))

(declare-fun b!1315435 () Bool)

(declare-fun res!873283 () Bool)

(assert (=> b!1315435 (=> (not res!873283) (not e!750388))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315435 (= res!873283 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43140 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315436 () Bool)

(declare-fun res!873282 () Bool)

(assert (=> b!1315436 (=> (not res!873282) (not e!750388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88215 (_ BitVec 32)) Bool)

(assert (=> b!1315436 (= res!873282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315437 () Bool)

(declare-fun e!750389 () Bool)

(declare-fun mapRes!55135 () Bool)

(assert (=> b!1315437 (= e!750386 (and e!750389 mapRes!55135))))

(declare-fun condMapEmpty!55135 () Bool)

(declare-fun mapDefault!55135 () ValueCell!16937)

(assert (=> b!1315437 (= condMapEmpty!55135 (= (arr!42589 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16937)) mapDefault!55135)))))

(declare-fun b!1315438 () Bool)

(assert (=> b!1315438 (= e!750389 tp_is_empty!35671)))

(declare-fun b!1315439 () Bool)

(assert (=> b!1315439 (= e!750388 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52665)

(declare-fun zeroValue!1296 () V!52665)

(declare-fun lt!585735 () Bool)

(declare-datatypes ((tuple2!23194 0))(
  ( (tuple2!23195 (_1!11608 (_ BitVec 64)) (_2!11608 V!52665)) )
))
(declare-datatypes ((List!30309 0))(
  ( (Nil!30306) (Cons!30305 (h!31514 tuple2!23194) (t!43907 List!30309)) )
))
(declare-datatypes ((ListLongMap!20851 0))(
  ( (ListLongMap!20852 (toList!10441 List!30309)) )
))
(declare-fun contains!8518 (ListLongMap!20851 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5336 (array!88215 array!88217 (_ BitVec 32) (_ BitVec 32) V!52665 V!52665 (_ BitVec 32) Int) ListLongMap!20851)

(assert (=> b!1315439 (= lt!585735 (contains!8518 (getCurrentListMap!5336 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!55135 () Bool)

(assert (=> mapIsEmpty!55135 mapRes!55135))

(declare-fun mapNonEmpty!55135 () Bool)

(declare-fun tp!105146 () Bool)

(assert (=> mapNonEmpty!55135 (= mapRes!55135 (and tp!105146 e!750385))))

(declare-fun mapRest!55135 () (Array (_ BitVec 32) ValueCell!16937))

(declare-fun mapKey!55135 () (_ BitVec 32))

(declare-fun mapValue!55135 () ValueCell!16937)

(assert (=> mapNonEmpty!55135 (= (arr!42589 _values!1354) (store mapRest!55135 mapKey!55135 mapValue!55135))))

(assert (= (and start!111106 res!873285) b!1315432))

(assert (= (and b!1315432 res!873286) b!1315436))

(assert (= (and b!1315436 res!873282) b!1315433))

(assert (= (and b!1315433 res!873284) b!1315435))

(assert (= (and b!1315435 res!873283) b!1315439))

(assert (= (and b!1315437 condMapEmpty!55135) mapIsEmpty!55135))

(assert (= (and b!1315437 (not condMapEmpty!55135)) mapNonEmpty!55135))

(get-info :version)

(assert (= (and mapNonEmpty!55135 ((_ is ValueCellFull!16937) mapValue!55135)) b!1315434))

(assert (= (and b!1315437 ((_ is ValueCellFull!16937) mapDefault!55135)) b!1315438))

(assert (= start!111106 b!1315437))

(declare-fun m!1203159 () Bool)

(assert (=> mapNonEmpty!55135 m!1203159))

(declare-fun m!1203161 () Bool)

(assert (=> b!1315439 m!1203161))

(assert (=> b!1315439 m!1203161))

(declare-fun m!1203163 () Bool)

(assert (=> b!1315439 m!1203163))

(declare-fun m!1203165 () Bool)

(assert (=> b!1315433 m!1203165))

(declare-fun m!1203167 () Bool)

(assert (=> start!111106 m!1203167))

(declare-fun m!1203169 () Bool)

(assert (=> start!111106 m!1203169))

(declare-fun m!1203171 () Bool)

(assert (=> start!111106 m!1203171))

(declare-fun m!1203173 () Bool)

(assert (=> b!1315436 m!1203173))

(check-sat b_and!48131 (not b!1315436) (not b!1315433) (not start!111106) (not mapNonEmpty!55135) (not b_next!29941) (not b!1315439) tp_is_empty!35671)
(check-sat b_and!48131 (not b_next!29941))
