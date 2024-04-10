; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111102 () Bool)

(assert start!111102)

(declare-fun b_free!29937 () Bool)

(declare-fun b_next!29937 () Bool)

(assert (=> start!111102 (= b_free!29937 (not b_next!29937))))

(declare-fun tp!105133 () Bool)

(declare-fun b_and!48145 () Bool)

(assert (=> start!111102 (= tp!105133 b_and!48145)))

(declare-fun b!1315454 () Bool)

(declare-fun res!873283 () Bool)

(declare-fun e!750389 () Bool)

(assert (=> b!1315454 (=> (not res!873283) (not e!750389))))

(declare-datatypes ((array!88296 0))(
  ( (array!88297 (arr!42628 (Array (_ BitVec 32) (_ BitVec 64))) (size!43178 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88296)

(declare-datatypes ((List!30239 0))(
  ( (Nil!30236) (Cons!30235 (h!31444 (_ BitVec 64)) (t!43845 List!30239)) )
))
(declare-fun arrayNoDuplicates!0 (array!88296 (_ BitVec 32) List!30239) Bool)

(assert (=> b!1315454 (= res!873283 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30236))))

(declare-fun res!873284 () Bool)

(assert (=> start!111102 (=> (not res!873284) (not e!750389))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111102 (= res!873284 (validMask!0 mask!2040))))

(assert (=> start!111102 e!750389))

(assert (=> start!111102 tp!105133))

(declare-fun array_inv!32197 (array!88296) Bool)

(assert (=> start!111102 (array_inv!32197 _keys!1628)))

(assert (=> start!111102 true))

(declare-fun tp_is_empty!35667 () Bool)

(assert (=> start!111102 tp_is_empty!35667))

(declare-datatypes ((V!52659 0))(
  ( (V!52660 (val!17908 Int)) )
))
(declare-datatypes ((ValueCell!16935 0))(
  ( (ValueCellFull!16935 (v!20535 V!52659)) (EmptyCell!16935) )
))
(declare-datatypes ((array!88298 0))(
  ( (array!88299 (arr!42629 (Array (_ BitVec 32) ValueCell!16935)) (size!43179 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88298)

(declare-fun e!750391 () Bool)

(declare-fun array_inv!32198 (array!88298) Bool)

(assert (=> start!111102 (and (array_inv!32198 _values!1354) e!750391)))

(declare-fun mapIsEmpty!55129 () Bool)

(declare-fun mapRes!55129 () Bool)

(assert (=> mapIsEmpty!55129 mapRes!55129))

(declare-fun b!1315455 () Bool)

(declare-fun res!873285 () Bool)

(assert (=> b!1315455 (=> (not res!873285) (not e!750389))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315455 (= res!873285 (and (= (size!43179 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43178 _keys!1628) (size!43179 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55129 () Bool)

(declare-fun tp!105132 () Bool)

(declare-fun e!750392 () Bool)

(assert (=> mapNonEmpty!55129 (= mapRes!55129 (and tp!105132 e!750392))))

(declare-fun mapRest!55129 () (Array (_ BitVec 32) ValueCell!16935))

(declare-fun mapKey!55129 () (_ BitVec 32))

(declare-fun mapValue!55129 () ValueCell!16935)

(assert (=> mapNonEmpty!55129 (= (arr!42629 _values!1354) (store mapRest!55129 mapKey!55129 mapValue!55129))))

(declare-fun b!1315456 () Bool)

(declare-fun e!750390 () Bool)

(assert (=> b!1315456 (= e!750390 tp_is_empty!35667)))

(declare-fun b!1315457 () Bool)

(assert (=> b!1315457 (= e!750391 (and e!750390 mapRes!55129))))

(declare-fun condMapEmpty!55129 () Bool)

(declare-fun mapDefault!55129 () ValueCell!16935)

(assert (=> b!1315457 (= condMapEmpty!55129 (= (arr!42629 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16935)) mapDefault!55129)))))

(declare-fun b!1315458 () Bool)

(assert (=> b!1315458 (= e!750389 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52659)

(declare-fun zeroValue!1296 () V!52659)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585915 () Bool)

(declare-datatypes ((tuple2!23104 0))(
  ( (tuple2!23105 (_1!11563 (_ BitVec 64)) (_2!11563 V!52659)) )
))
(declare-datatypes ((List!30240 0))(
  ( (Nil!30237) (Cons!30236 (h!31445 tuple2!23104) (t!43846 List!30240)) )
))
(declare-datatypes ((ListLongMap!20761 0))(
  ( (ListLongMap!20762 (toList!10396 List!30240)) )
))
(declare-fun contains!8546 (ListLongMap!20761 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5409 (array!88296 array!88298 (_ BitVec 32) (_ BitVec 32) V!52659 V!52659 (_ BitVec 32) Int) ListLongMap!20761)

(assert (=> b!1315458 (= lt!585915 (contains!8546 (getCurrentListMap!5409 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315459 () Bool)

(assert (=> b!1315459 (= e!750392 tp_is_empty!35667)))

(declare-fun b!1315460 () Bool)

(declare-fun res!873281 () Bool)

(assert (=> b!1315460 (=> (not res!873281) (not e!750389))))

(assert (=> b!1315460 (= res!873281 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43178 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315461 () Bool)

(declare-fun res!873282 () Bool)

(assert (=> b!1315461 (=> (not res!873282) (not e!750389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88296 (_ BitVec 32)) Bool)

(assert (=> b!1315461 (= res!873282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!111102 res!873284) b!1315455))

(assert (= (and b!1315455 res!873285) b!1315461))

(assert (= (and b!1315461 res!873282) b!1315454))

(assert (= (and b!1315454 res!873283) b!1315460))

(assert (= (and b!1315460 res!873281) b!1315458))

(assert (= (and b!1315457 condMapEmpty!55129) mapIsEmpty!55129))

(assert (= (and b!1315457 (not condMapEmpty!55129)) mapNonEmpty!55129))

(get-info :version)

(assert (= (and mapNonEmpty!55129 ((_ is ValueCellFull!16935) mapValue!55129)) b!1315459))

(assert (= (and b!1315457 ((_ is ValueCellFull!16935) mapDefault!55129)) b!1315456))

(assert (= start!111102 b!1315457))

(declare-fun m!1203643 () Bool)

(assert (=> b!1315454 m!1203643))

(declare-fun m!1203645 () Bool)

(assert (=> b!1315458 m!1203645))

(assert (=> b!1315458 m!1203645))

(declare-fun m!1203647 () Bool)

(assert (=> b!1315458 m!1203647))

(declare-fun m!1203649 () Bool)

(assert (=> start!111102 m!1203649))

(declare-fun m!1203651 () Bool)

(assert (=> start!111102 m!1203651))

(declare-fun m!1203653 () Bool)

(assert (=> start!111102 m!1203653))

(declare-fun m!1203655 () Bool)

(assert (=> mapNonEmpty!55129 m!1203655))

(declare-fun m!1203657 () Bool)

(assert (=> b!1315461 m!1203657))

(check-sat (not b!1315454) (not b!1315458) (not start!111102) (not b_next!29937) (not mapNonEmpty!55129) b_and!48145 (not b!1315461) tp_is_empty!35667)
(check-sat b_and!48145 (not b_next!29937))
