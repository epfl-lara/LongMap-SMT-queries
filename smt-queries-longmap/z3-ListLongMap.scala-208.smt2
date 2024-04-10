; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3932 () Bool)

(assert start!3932)

(declare-fun b_free!837 () Bool)

(declare-fun b_next!837 () Bool)

(assert (=> start!3932 (= b_free!837 (not b_next!837))))

(declare-fun tp!3931 () Bool)

(declare-fun b_and!1647 () Bool)

(assert (=> start!3932 (= tp!3931 b_and!1647)))

(declare-fun res!16589 () Bool)

(declare-fun e!18127 () Bool)

(assert (=> start!3932 (=> (not res!16589) (not e!18127))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3932 (= res!16589 (validMask!0 mask!2294))))

(assert (=> start!3932 e!18127))

(assert (=> start!3932 true))

(assert (=> start!3932 tp!3931))

(declare-datatypes ((V!1413 0))(
  ( (V!1414 (val!622 Int)) )
))
(declare-datatypes ((ValueCell!396 0))(
  ( (ValueCellFull!396 (v!1711 V!1413)) (EmptyCell!396) )
))
(declare-datatypes ((array!1623 0))(
  ( (array!1624 (arr!765 (Array (_ BitVec 32) ValueCell!396)) (size!866 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1623)

(declare-fun e!18125 () Bool)

(declare-fun array_inv!527 (array!1623) Bool)

(assert (=> start!3932 (and (array_inv!527 _values!1501) e!18125)))

(declare-datatypes ((array!1625 0))(
  ( (array!1626 (arr!766 (Array (_ BitVec 32) (_ BitVec 64))) (size!867 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1625)

(declare-fun array_inv!528 (array!1625) Bool)

(assert (=> start!3932 (array_inv!528 _keys!1833)))

(declare-fun tp_is_empty!1191 () Bool)

(assert (=> start!3932 tp_is_empty!1191))

(declare-fun b!27936 () Bool)

(declare-fun res!16592 () Bool)

(assert (=> b!27936 (=> (not res!16592) (not e!18127))))

(declare-datatypes ((List!641 0))(
  ( (Nil!638) (Cons!637 (h!1204 (_ BitVec 64)) (t!3334 List!641)) )
))
(declare-fun arrayNoDuplicates!0 (array!1625 (_ BitVec 32) List!641) Bool)

(assert (=> b!27936 (= res!16592 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!638))))

(declare-fun b!27937 () Bool)

(declare-fun e!18124 () Bool)

(declare-fun mapRes!1315 () Bool)

(assert (=> b!27937 (= e!18125 (and e!18124 mapRes!1315))))

(declare-fun condMapEmpty!1315 () Bool)

(declare-fun mapDefault!1315 () ValueCell!396)

(assert (=> b!27937 (= condMapEmpty!1315 (= (arr!765 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!396)) mapDefault!1315)))))

(declare-fun b!27938 () Bool)

(assert (=> b!27938 (= e!18127 false)))

(declare-fun lt!10730 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1625 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27938 (= lt!10730 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27939 () Bool)

(assert (=> b!27939 (= e!18124 tp_is_empty!1191)))

(declare-fun b!27940 () Bool)

(declare-fun res!16587 () Bool)

(assert (=> b!27940 (=> (not res!16587) (not e!18127))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!27940 (= res!16587 (and (= (size!866 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!867 _keys!1833) (size!866 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27941 () Bool)

(declare-fun res!16593 () Bool)

(assert (=> b!27941 (=> (not res!16593) (not e!18127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27941 (= res!16593 (validKeyInArray!0 k0!1304))))

(declare-fun b!27942 () Bool)

(declare-fun e!18128 () Bool)

(assert (=> b!27942 (= e!18128 tp_is_empty!1191)))

(declare-fun mapIsEmpty!1315 () Bool)

(assert (=> mapIsEmpty!1315 mapRes!1315))

(declare-fun b!27943 () Bool)

(declare-fun res!16590 () Bool)

(assert (=> b!27943 (=> (not res!16590) (not e!18127))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1413)

(declare-fun minValue!1443 () V!1413)

(declare-datatypes ((tuple2!1040 0))(
  ( (tuple2!1041 (_1!531 (_ BitVec 64)) (_2!531 V!1413)) )
))
(declare-datatypes ((List!642 0))(
  ( (Nil!639) (Cons!638 (h!1205 tuple2!1040) (t!3335 List!642)) )
))
(declare-datatypes ((ListLongMap!617 0))(
  ( (ListLongMap!618 (toList!324 List!642)) )
))
(declare-fun contains!264 (ListLongMap!617 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!154 (array!1625 array!1623 (_ BitVec 32) (_ BitVec 32) V!1413 V!1413 (_ BitVec 32) Int) ListLongMap!617)

(assert (=> b!27943 (= res!16590 (not (contains!264 (getCurrentListMap!154 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27944 () Bool)

(declare-fun res!16588 () Bool)

(assert (=> b!27944 (=> (not res!16588) (not e!18127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1625 (_ BitVec 32)) Bool)

(assert (=> b!27944 (= res!16588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27945 () Bool)

(declare-fun res!16591 () Bool)

(assert (=> b!27945 (=> (not res!16591) (not e!18127))))

(declare-fun arrayContainsKey!0 (array!1625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27945 (= res!16591 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1315 () Bool)

(declare-fun tp!3930 () Bool)

(assert (=> mapNonEmpty!1315 (= mapRes!1315 (and tp!3930 e!18128))))

(declare-fun mapValue!1315 () ValueCell!396)

(declare-fun mapRest!1315 () (Array (_ BitVec 32) ValueCell!396))

(declare-fun mapKey!1315 () (_ BitVec 32))

(assert (=> mapNonEmpty!1315 (= (arr!765 _values!1501) (store mapRest!1315 mapKey!1315 mapValue!1315))))

(assert (= (and start!3932 res!16589) b!27940))

(assert (= (and b!27940 res!16587) b!27944))

(assert (= (and b!27944 res!16588) b!27936))

(assert (= (and b!27936 res!16592) b!27941))

(assert (= (and b!27941 res!16593) b!27943))

(assert (= (and b!27943 res!16590) b!27945))

(assert (= (and b!27945 res!16591) b!27938))

(assert (= (and b!27937 condMapEmpty!1315) mapIsEmpty!1315))

(assert (= (and b!27937 (not condMapEmpty!1315)) mapNonEmpty!1315))

(get-info :version)

(assert (= (and mapNonEmpty!1315 ((_ is ValueCellFull!396) mapValue!1315)) b!27942))

(assert (= (and b!27937 ((_ is ValueCellFull!396) mapDefault!1315)) b!27939))

(assert (= start!3932 b!27937))

(declare-fun m!22259 () Bool)

(assert (=> b!27941 m!22259))

(declare-fun m!22261 () Bool)

(assert (=> mapNonEmpty!1315 m!22261))

(declare-fun m!22263 () Bool)

(assert (=> b!27936 m!22263))

(declare-fun m!22265 () Bool)

(assert (=> b!27945 m!22265))

(declare-fun m!22267 () Bool)

(assert (=> start!3932 m!22267))

(declare-fun m!22269 () Bool)

(assert (=> start!3932 m!22269))

(declare-fun m!22271 () Bool)

(assert (=> start!3932 m!22271))

(declare-fun m!22273 () Bool)

(assert (=> b!27938 m!22273))

(declare-fun m!22275 () Bool)

(assert (=> b!27943 m!22275))

(assert (=> b!27943 m!22275))

(declare-fun m!22277 () Bool)

(assert (=> b!27943 m!22277))

(declare-fun m!22279 () Bool)

(assert (=> b!27944 m!22279))

(check-sat (not b!27941) (not mapNonEmpty!1315) (not b!27943) (not b!27936) b_and!1647 (not b_next!837) (not b!27944) (not b!27938) (not b!27945) tp_is_empty!1191 (not start!3932))
(check-sat b_and!1647 (not b_next!837))
