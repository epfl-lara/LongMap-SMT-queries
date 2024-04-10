; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111150 () Bool)

(assert start!111150)

(declare-fun b_free!29985 () Bool)

(declare-fun b_next!29985 () Bool)

(assert (=> start!111150 (= b_free!29985 (not b_next!29985))))

(declare-fun tp!105277 () Bool)

(declare-fun b_and!48193 () Bool)

(assert (=> start!111150 (= tp!105277 b_and!48193)))

(declare-fun b!1316030 () Bool)

(declare-fun e!750751 () Bool)

(declare-fun tp_is_empty!35715 () Bool)

(assert (=> b!1316030 (= e!750751 tp_is_empty!35715)))

(declare-fun b!1316031 () Bool)

(declare-fun e!750748 () Bool)

(assert (=> b!1316031 (= e!750748 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88388 0))(
  ( (array!88389 (arr!42674 (Array (_ BitVec 32) (_ BitVec 64))) (size!43224 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88388)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52723 0))(
  ( (V!52724 (val!17932 Int)) )
))
(declare-fun minValue!1296 () V!52723)

(declare-datatypes ((ValueCell!16959 0))(
  ( (ValueCellFull!16959 (v!20559 V!52723)) (EmptyCell!16959) )
))
(declare-datatypes ((array!88390 0))(
  ( (array!88391 (arr!42675 (Array (_ BitVec 32) ValueCell!16959)) (size!43225 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88390)

(declare-fun zeroValue!1296 () V!52723)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585987 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((tuple2!23134 0))(
  ( (tuple2!23135 (_1!11578 (_ BitVec 64)) (_2!11578 V!52723)) )
))
(declare-datatypes ((List!30273 0))(
  ( (Nil!30270) (Cons!30269 (h!31478 tuple2!23134) (t!43879 List!30273)) )
))
(declare-datatypes ((ListLongMap!20791 0))(
  ( (ListLongMap!20792 (toList!10411 List!30273)) )
))
(declare-fun contains!8561 (ListLongMap!20791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5424 (array!88388 array!88390 (_ BitVec 32) (_ BitVec 32) V!52723 V!52723 (_ BitVec 32) Int) ListLongMap!20791)

(assert (=> b!1316031 (= lt!585987 (contains!8561 (getCurrentListMap!5424 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1316032 () Bool)

(declare-fun res!873644 () Bool)

(assert (=> b!1316032 (=> (not res!873644) (not e!750748))))

(assert (=> b!1316032 (= res!873644 (and (= (size!43225 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43224 _keys!1628) (size!43225 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316033 () Bool)

(declare-fun res!873642 () Bool)

(assert (=> b!1316033 (=> (not res!873642) (not e!750748))))

(declare-datatypes ((List!30274 0))(
  ( (Nil!30271) (Cons!30270 (h!31479 (_ BitVec 64)) (t!43880 List!30274)) )
))
(declare-fun arrayNoDuplicates!0 (array!88388 (_ BitVec 32) List!30274) Bool)

(assert (=> b!1316033 (= res!873642 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30271))))

(declare-fun res!873641 () Bool)

(assert (=> start!111150 (=> (not res!873641) (not e!750748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111150 (= res!873641 (validMask!0 mask!2040))))

(assert (=> start!111150 e!750748))

(assert (=> start!111150 tp!105277))

(declare-fun array_inv!32229 (array!88388) Bool)

(assert (=> start!111150 (array_inv!32229 _keys!1628)))

(assert (=> start!111150 true))

(assert (=> start!111150 tp_is_empty!35715))

(declare-fun e!750752 () Bool)

(declare-fun array_inv!32230 (array!88390) Bool)

(assert (=> start!111150 (and (array_inv!32230 _values!1354) e!750752)))

(declare-fun b!1316034 () Bool)

(declare-fun e!750749 () Bool)

(declare-fun mapRes!55201 () Bool)

(assert (=> b!1316034 (= e!750752 (and e!750749 mapRes!55201))))

(declare-fun condMapEmpty!55201 () Bool)

(declare-fun mapDefault!55201 () ValueCell!16959)

(assert (=> b!1316034 (= condMapEmpty!55201 (= (arr!42675 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16959)) mapDefault!55201)))))

(declare-fun b!1316035 () Bool)

(declare-fun res!873643 () Bool)

(assert (=> b!1316035 (=> (not res!873643) (not e!750748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88388 (_ BitVec 32)) Bool)

(assert (=> b!1316035 (= res!873643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!55201 () Bool)

(assert (=> mapIsEmpty!55201 mapRes!55201))

(declare-fun mapNonEmpty!55201 () Bool)

(declare-fun tp!105276 () Bool)

(assert (=> mapNonEmpty!55201 (= mapRes!55201 (and tp!105276 e!750751))))

(declare-fun mapKey!55201 () (_ BitVec 32))

(declare-fun mapValue!55201 () ValueCell!16959)

(declare-fun mapRest!55201 () (Array (_ BitVec 32) ValueCell!16959))

(assert (=> mapNonEmpty!55201 (= (arr!42675 _values!1354) (store mapRest!55201 mapKey!55201 mapValue!55201))))

(declare-fun b!1316036 () Bool)

(assert (=> b!1316036 (= e!750749 tp_is_empty!35715)))

(declare-fun b!1316037 () Bool)

(declare-fun res!873645 () Bool)

(assert (=> b!1316037 (=> (not res!873645) (not e!750748))))

(assert (=> b!1316037 (= res!873645 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43224 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111150 res!873641) b!1316032))

(assert (= (and b!1316032 res!873644) b!1316035))

(assert (= (and b!1316035 res!873643) b!1316033))

(assert (= (and b!1316033 res!873642) b!1316037))

(assert (= (and b!1316037 res!873645) b!1316031))

(assert (= (and b!1316034 condMapEmpty!55201) mapIsEmpty!55201))

(assert (= (and b!1316034 (not condMapEmpty!55201)) mapNonEmpty!55201))

(get-info :version)

(assert (= (and mapNonEmpty!55201 ((_ is ValueCellFull!16959) mapValue!55201)) b!1316030))

(assert (= (and b!1316034 ((_ is ValueCellFull!16959) mapDefault!55201)) b!1316036))

(assert (= start!111150 b!1316034))

(declare-fun m!1204027 () Bool)

(assert (=> b!1316035 m!1204027))

(declare-fun m!1204029 () Bool)

(assert (=> b!1316031 m!1204029))

(assert (=> b!1316031 m!1204029))

(declare-fun m!1204031 () Bool)

(assert (=> b!1316031 m!1204031))

(declare-fun m!1204033 () Bool)

(assert (=> start!111150 m!1204033))

(declare-fun m!1204035 () Bool)

(assert (=> start!111150 m!1204035))

(declare-fun m!1204037 () Bool)

(assert (=> start!111150 m!1204037))

(declare-fun m!1204039 () Bool)

(assert (=> b!1316033 m!1204039))

(declare-fun m!1204041 () Bool)

(assert (=> mapNonEmpty!55201 m!1204041))

(check-sat (not mapNonEmpty!55201) b_and!48193 (not b!1316033) (not b!1316035) (not start!111150) (not b!1316031) tp_is_empty!35715 (not b_next!29985))
(check-sat b_and!48193 (not b_next!29985))
