; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111124 () Bool)

(assert start!111124)

(declare-fun b_free!29959 () Bool)

(declare-fun b_next!29959 () Bool)

(assert (=> start!111124 (= b_free!29959 (not b_next!29959))))

(declare-fun tp!105199 () Bool)

(declare-fun b_and!48149 () Bool)

(assert (=> start!111124 (= tp!105199 b_and!48149)))

(declare-fun res!873417 () Bool)

(declare-fun e!750523 () Bool)

(assert (=> start!111124 (=> (not res!873417) (not e!750523))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111124 (= res!873417 (validMask!0 mask!2040))))

(assert (=> start!111124 e!750523))

(assert (=> start!111124 tp!105199))

(declare-datatypes ((array!88249 0))(
  ( (array!88250 (arr!42605 (Array (_ BitVec 32) (_ BitVec 64))) (size!43157 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88249)

(declare-fun array_inv!32363 (array!88249) Bool)

(assert (=> start!111124 (array_inv!32363 _keys!1628)))

(assert (=> start!111124 true))

(declare-fun tp_is_empty!35689 () Bool)

(assert (=> start!111124 tp_is_empty!35689))

(declare-datatypes ((V!52689 0))(
  ( (V!52690 (val!17919 Int)) )
))
(declare-datatypes ((ValueCell!16946 0))(
  ( (ValueCellFull!16946 (v!20545 V!52689)) (EmptyCell!16946) )
))
(declare-datatypes ((array!88251 0))(
  ( (array!88252 (arr!42606 (Array (_ BitVec 32) ValueCell!16946)) (size!43158 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88251)

(declare-fun e!750522 () Bool)

(declare-fun array_inv!32364 (array!88251) Bool)

(assert (=> start!111124 (and (array_inv!32364 _values!1354) e!750522)))

(declare-fun b!1315648 () Bool)

(declare-fun res!873420 () Bool)

(assert (=> b!1315648 (=> (not res!873420) (not e!750523))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315648 (= res!873420 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43157 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315649 () Bool)

(declare-fun e!750520 () Bool)

(declare-fun mapRes!55162 () Bool)

(assert (=> b!1315649 (= e!750522 (and e!750520 mapRes!55162))))

(declare-fun condMapEmpty!55162 () Bool)

(declare-fun mapDefault!55162 () ValueCell!16946)

(assert (=> b!1315649 (= condMapEmpty!55162 (= (arr!42606 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16946)) mapDefault!55162)))))

(declare-fun mapIsEmpty!55162 () Bool)

(assert (=> mapIsEmpty!55162 mapRes!55162))

(declare-fun b!1315650 () Bool)

(assert (=> b!1315650 (= e!750520 tp_is_empty!35689)))

(declare-fun mapNonEmpty!55162 () Bool)

(declare-fun tp!105200 () Bool)

(declare-fun e!750524 () Bool)

(assert (=> mapNonEmpty!55162 (= mapRes!55162 (and tp!105200 e!750524))))

(declare-fun mapValue!55162 () ValueCell!16946)

(declare-fun mapKey!55162 () (_ BitVec 32))

(declare-fun mapRest!55162 () (Array (_ BitVec 32) ValueCell!16946))

(assert (=> mapNonEmpty!55162 (= (arr!42606 _values!1354) (store mapRest!55162 mapKey!55162 mapValue!55162))))

(declare-fun b!1315651 () Bool)

(assert (=> b!1315651 (= e!750524 tp_is_empty!35689)))

(declare-fun b!1315652 () Bool)

(declare-fun res!873418 () Bool)

(assert (=> b!1315652 (=> (not res!873418) (not e!750523))))

(declare-datatypes ((List!30318 0))(
  ( (Nil!30315) (Cons!30314 (h!31523 (_ BitVec 64)) (t!43916 List!30318)) )
))
(declare-fun arrayNoDuplicates!0 (array!88249 (_ BitVec 32) List!30318) Bool)

(assert (=> b!1315652 (= res!873418 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30315))))

(declare-fun b!1315653 () Bool)

(assert (=> b!1315653 (= e!750523 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52689)

(declare-fun zeroValue!1296 () V!52689)

(declare-fun lt!585762 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23204 0))(
  ( (tuple2!23205 (_1!11613 (_ BitVec 64)) (_2!11613 V!52689)) )
))
(declare-datatypes ((List!30319 0))(
  ( (Nil!30316) (Cons!30315 (h!31524 tuple2!23204) (t!43917 List!30319)) )
))
(declare-datatypes ((ListLongMap!20861 0))(
  ( (ListLongMap!20862 (toList!10446 List!30319)) )
))
(declare-fun contains!8523 (ListLongMap!20861 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5341 (array!88249 array!88251 (_ BitVec 32) (_ BitVec 32) V!52689 V!52689 (_ BitVec 32) Int) ListLongMap!20861)

(assert (=> b!1315653 (= lt!585762 (contains!8523 (getCurrentListMap!5341 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315654 () Bool)

(declare-fun res!873419 () Bool)

(assert (=> b!1315654 (=> (not res!873419) (not e!750523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88249 (_ BitVec 32)) Bool)

(assert (=> b!1315654 (= res!873419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315655 () Bool)

(declare-fun res!873421 () Bool)

(assert (=> b!1315655 (=> (not res!873421) (not e!750523))))

(assert (=> b!1315655 (= res!873421 (and (= (size!43158 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43157 _keys!1628) (size!43158 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!111124 res!873417) b!1315655))

(assert (= (and b!1315655 res!873421) b!1315654))

(assert (= (and b!1315654 res!873419) b!1315652))

(assert (= (and b!1315652 res!873418) b!1315648))

(assert (= (and b!1315648 res!873420) b!1315653))

(assert (= (and b!1315649 condMapEmpty!55162) mapIsEmpty!55162))

(assert (= (and b!1315649 (not condMapEmpty!55162)) mapNonEmpty!55162))

(get-info :version)

(assert (= (and mapNonEmpty!55162 ((_ is ValueCellFull!16946) mapValue!55162)) b!1315651))

(assert (= (and b!1315649 ((_ is ValueCellFull!16946) mapDefault!55162)) b!1315650))

(assert (= start!111124 b!1315649))

(declare-fun m!1203303 () Bool)

(assert (=> b!1315654 m!1203303))

(declare-fun m!1203305 () Bool)

(assert (=> b!1315652 m!1203305))

(declare-fun m!1203307 () Bool)

(assert (=> mapNonEmpty!55162 m!1203307))

(declare-fun m!1203309 () Bool)

(assert (=> start!111124 m!1203309))

(declare-fun m!1203311 () Bool)

(assert (=> start!111124 m!1203311))

(declare-fun m!1203313 () Bool)

(assert (=> start!111124 m!1203313))

(declare-fun m!1203315 () Bool)

(assert (=> b!1315653 m!1203315))

(assert (=> b!1315653 m!1203315))

(declare-fun m!1203317 () Bool)

(assert (=> b!1315653 m!1203317))

(check-sat (not b!1315653) b_and!48149 tp_is_empty!35689 (not b_next!29959) (not mapNonEmpty!55162) (not b!1315652) (not start!111124) (not b!1315654))
(check-sat b_and!48149 (not b_next!29959))
