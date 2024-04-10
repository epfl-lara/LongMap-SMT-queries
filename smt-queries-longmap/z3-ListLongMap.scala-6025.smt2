; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78036 () Bool)

(assert start!78036)

(declare-fun b_free!16563 () Bool)

(declare-fun b_next!16563 () Bool)

(assert (=> start!78036 (= b_free!16563 (not b_next!16563))))

(declare-fun tp!57960 () Bool)

(declare-fun b_and!27135 () Bool)

(assert (=> start!78036 (= tp!57960 b_and!27135)))

(declare-fun b!910926 () Bool)

(declare-fun e!510808 () Bool)

(assert (=> b!910926 (= e!510808 false)))

(declare-datatypes ((V!30273 0))(
  ( (V!30274 (val!9541 Int)) )
))
(declare-datatypes ((ValueCell!9009 0))(
  ( (ValueCellFull!9009 (v!12050 V!30273)) (EmptyCell!9009) )
))
(declare-datatypes ((array!53970 0))(
  ( (array!53971 (arr!25941 (Array (_ BitVec 32) ValueCell!9009)) (size!26400 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53970)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun lt!410327 () Bool)

(declare-fun zeroValue!1094 () V!30273)

(declare-datatypes ((array!53972 0))(
  ( (array!53973 (arr!25942 (Array (_ BitVec 32) (_ BitVec 64))) (size!26401 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53972)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30273)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12432 0))(
  ( (tuple2!12433 (_1!6227 (_ BitVec 64)) (_2!6227 V!30273)) )
))
(declare-datatypes ((List!18223 0))(
  ( (Nil!18220) (Cons!18219 (h!19365 tuple2!12432) (t!25808 List!18223)) )
))
(declare-datatypes ((ListLongMap!11129 0))(
  ( (ListLongMap!11130 (toList!5580 List!18223)) )
))
(declare-fun contains!4624 (ListLongMap!11129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2842 (array!53972 array!53970 (_ BitVec 32) (_ BitVec 32) V!30273 V!30273 (_ BitVec 32) Int) ListLongMap!11129)

(assert (=> b!910926 (= lt!410327 (contains!4624 (getCurrentListMap!2842 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910927 () Bool)

(declare-fun e!510807 () Bool)

(declare-fun tp_is_empty!18981 () Bool)

(assert (=> b!910927 (= e!510807 tp_is_empty!18981)))

(declare-fun b!910928 () Bool)

(declare-fun e!510810 () Bool)

(declare-fun mapRes!30193 () Bool)

(assert (=> b!910928 (= e!510810 (and e!510807 mapRes!30193))))

(declare-fun condMapEmpty!30193 () Bool)

(declare-fun mapDefault!30193 () ValueCell!9009)

(assert (=> b!910928 (= condMapEmpty!30193 (= (arr!25941 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9009)) mapDefault!30193)))))

(declare-fun b!910929 () Bool)

(declare-fun res!614643 () Bool)

(assert (=> b!910929 (=> (not res!614643) (not e!510808))))

(assert (=> b!910929 (= res!614643 (and (= (size!26400 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26401 _keys!1386) (size!26400 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910930 () Bool)

(declare-fun res!614640 () Bool)

(assert (=> b!910930 (=> (not res!614640) (not e!510808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53972 (_ BitVec 32)) Bool)

(assert (=> b!910930 (= res!614640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!614642 () Bool)

(assert (=> start!78036 (=> (not res!614642) (not e!510808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78036 (= res!614642 (validMask!0 mask!1756))))

(assert (=> start!78036 e!510808))

(declare-fun array_inv!20280 (array!53970) Bool)

(assert (=> start!78036 (and (array_inv!20280 _values!1152) e!510810)))

(assert (=> start!78036 tp!57960))

(assert (=> start!78036 true))

(assert (=> start!78036 tp_is_empty!18981))

(declare-fun array_inv!20281 (array!53972) Bool)

(assert (=> start!78036 (array_inv!20281 _keys!1386)))

(declare-fun b!910931 () Bool)

(declare-fun e!510806 () Bool)

(assert (=> b!910931 (= e!510806 tp_is_empty!18981)))

(declare-fun mapNonEmpty!30193 () Bool)

(declare-fun tp!57959 () Bool)

(assert (=> mapNonEmpty!30193 (= mapRes!30193 (and tp!57959 e!510806))))

(declare-fun mapRest!30193 () (Array (_ BitVec 32) ValueCell!9009))

(declare-fun mapKey!30193 () (_ BitVec 32))

(declare-fun mapValue!30193 () ValueCell!9009)

(assert (=> mapNonEmpty!30193 (= (arr!25941 _values!1152) (store mapRest!30193 mapKey!30193 mapValue!30193))))

(declare-fun b!910932 () Bool)

(declare-fun res!614641 () Bool)

(assert (=> b!910932 (=> (not res!614641) (not e!510808))))

(declare-datatypes ((List!18224 0))(
  ( (Nil!18221) (Cons!18220 (h!19366 (_ BitVec 64)) (t!25809 List!18224)) )
))
(declare-fun arrayNoDuplicates!0 (array!53972 (_ BitVec 32) List!18224) Bool)

(assert (=> b!910932 (= res!614641 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18221))))

(declare-fun mapIsEmpty!30193 () Bool)

(assert (=> mapIsEmpty!30193 mapRes!30193))

(assert (= (and start!78036 res!614642) b!910929))

(assert (= (and b!910929 res!614643) b!910930))

(assert (= (and b!910930 res!614640) b!910932))

(assert (= (and b!910932 res!614641) b!910926))

(assert (= (and b!910928 condMapEmpty!30193) mapIsEmpty!30193))

(assert (= (and b!910928 (not condMapEmpty!30193)) mapNonEmpty!30193))

(get-info :version)

(assert (= (and mapNonEmpty!30193 ((_ is ValueCellFull!9009) mapValue!30193)) b!910931))

(assert (= (and b!910928 ((_ is ValueCellFull!9009) mapDefault!30193)) b!910927))

(assert (= start!78036 b!910928))

(declare-fun m!845809 () Bool)

(assert (=> start!78036 m!845809))

(declare-fun m!845811 () Bool)

(assert (=> start!78036 m!845811))

(declare-fun m!845813 () Bool)

(assert (=> start!78036 m!845813))

(declare-fun m!845815 () Bool)

(assert (=> b!910930 m!845815))

(declare-fun m!845817 () Bool)

(assert (=> b!910932 m!845817))

(declare-fun m!845819 () Bool)

(assert (=> b!910926 m!845819))

(assert (=> b!910926 m!845819))

(declare-fun m!845821 () Bool)

(assert (=> b!910926 m!845821))

(declare-fun m!845823 () Bool)

(assert (=> mapNonEmpty!30193 m!845823))

(check-sat (not mapNonEmpty!30193) (not b!910930) (not b!910926) tp_is_empty!18981 b_and!27135 (not b!910932) (not start!78036) (not b_next!16563))
(check-sat b_and!27135 (not b_next!16563))
