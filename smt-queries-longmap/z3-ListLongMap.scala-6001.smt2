; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78026 () Bool)

(assert start!78026)

(declare-fun b_free!16417 () Bool)

(declare-fun b_next!16417 () Bool)

(assert (=> start!78026 (= b_free!16417 (not b_next!16417))))

(declare-fun tp!57516 () Bool)

(declare-fun b_and!26995 () Bool)

(assert (=> start!78026 (= tp!57516 b_and!26995)))

(declare-fun b!910042 () Bool)

(declare-fun res!613985 () Bool)

(declare-fun e!510152 () Bool)

(assert (=> b!910042 (=> (not res!613985) (not e!510152))))

(declare-datatypes ((array!53745 0))(
  ( (array!53746 (arr!25826 (Array (_ BitVec 32) (_ BitVec 64))) (size!26286 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53745)

(declare-datatypes ((List!18110 0))(
  ( (Nil!18107) (Cons!18106 (h!19258 (_ BitVec 64)) (t!25683 List!18110)) )
))
(declare-fun arrayNoDuplicates!0 (array!53745 (_ BitVec 32) List!18110) Bool)

(assert (=> b!910042 (= res!613985 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18107))))

(declare-fun b!910043 () Bool)

(declare-fun res!613983 () Bool)

(assert (=> b!910043 (=> (not res!613983) (not e!510152))))

(declare-datatypes ((V!30079 0))(
  ( (V!30080 (val!9468 Int)) )
))
(declare-datatypes ((ValueCell!8936 0))(
  ( (ValueCellFull!8936 (v!11972 V!30079)) (EmptyCell!8936) )
))
(declare-datatypes ((array!53747 0))(
  ( (array!53748 (arr!25827 (Array (_ BitVec 32) ValueCell!8936)) (size!26287 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53747)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!910043 (= res!613983 (and (= (size!26287 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26286 _keys!1386) (size!26287 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910044 () Bool)

(declare-fun e!510149 () Bool)

(declare-fun tp_is_empty!18835 () Bool)

(assert (=> b!910044 (= e!510149 tp_is_empty!18835)))

(declare-fun b!910045 () Bool)

(declare-fun e!510151 () Bool)

(assert (=> b!910045 (= e!510151 tp_is_empty!18835)))

(declare-fun b!910046 () Bool)

(declare-fun e!510150 () Bool)

(declare-fun mapRes!29968 () Bool)

(assert (=> b!910046 (= e!510150 (and e!510151 mapRes!29968))))

(declare-fun condMapEmpty!29968 () Bool)

(declare-fun mapDefault!29968 () ValueCell!8936)

(assert (=> b!910046 (= condMapEmpty!29968 (= (arr!25827 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8936)) mapDefault!29968)))))

(declare-fun res!613982 () Bool)

(assert (=> start!78026 (=> (not res!613982) (not e!510152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78026 (= res!613982 (validMask!0 mask!1756))))

(assert (=> start!78026 e!510152))

(declare-fun array_inv!20276 (array!53747) Bool)

(assert (=> start!78026 (and (array_inv!20276 _values!1152) e!510150)))

(assert (=> start!78026 tp!57516))

(assert (=> start!78026 true))

(assert (=> start!78026 tp_is_empty!18835))

(declare-fun array_inv!20277 (array!53745) Bool)

(assert (=> start!78026 (array_inv!20277 _keys!1386)))

(declare-fun b!910047 () Bool)

(declare-fun res!613984 () Bool)

(assert (=> b!910047 (=> (not res!613984) (not e!510152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53745 (_ BitVec 32)) Bool)

(assert (=> b!910047 (= res!613984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29968 () Bool)

(assert (=> mapIsEmpty!29968 mapRes!29968))

(declare-fun mapNonEmpty!29968 () Bool)

(declare-fun tp!57517 () Bool)

(assert (=> mapNonEmpty!29968 (= mapRes!29968 (and tp!57517 e!510149))))

(declare-fun mapRest!29968 () (Array (_ BitVec 32) ValueCell!8936))

(declare-fun mapKey!29968 () (_ BitVec 32))

(declare-fun mapValue!29968 () ValueCell!8936)

(assert (=> mapNonEmpty!29968 (= (arr!25827 _values!1152) (store mapRest!29968 mapKey!29968 mapValue!29968))))

(declare-fun b!910048 () Bool)

(assert (=> b!910048 (= e!510152 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30079)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30079)

(declare-fun lt!410313 () Bool)

(declare-datatypes ((tuple2!12290 0))(
  ( (tuple2!12291 (_1!6156 (_ BitVec 64)) (_2!6156 V!30079)) )
))
(declare-datatypes ((List!18111 0))(
  ( (Nil!18108) (Cons!18107 (h!19259 tuple2!12290) (t!25684 List!18111)) )
))
(declare-datatypes ((ListLongMap!10989 0))(
  ( (ListLongMap!10990 (toList!5510 List!18111)) )
))
(declare-fun contains!4561 (ListLongMap!10989 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2771 (array!53745 array!53747 (_ BitVec 32) (_ BitVec 32) V!30079 V!30079 (_ BitVec 32) Int) ListLongMap!10989)

(assert (=> b!910048 (= lt!410313 (contains!4561 (getCurrentListMap!2771 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!78026 res!613982) b!910043))

(assert (= (and b!910043 res!613983) b!910047))

(assert (= (and b!910047 res!613984) b!910042))

(assert (= (and b!910042 res!613985) b!910048))

(assert (= (and b!910046 condMapEmpty!29968) mapIsEmpty!29968))

(assert (= (and b!910046 (not condMapEmpty!29968)) mapNonEmpty!29968))

(get-info :version)

(assert (= (and mapNonEmpty!29968 ((_ is ValueCellFull!8936) mapValue!29968)) b!910044))

(assert (= (and b!910046 ((_ is ValueCellFull!8936) mapDefault!29968)) b!910045))

(assert (= start!78026 b!910046))

(declare-fun m!845751 () Bool)

(assert (=> b!910047 m!845751))

(declare-fun m!845753 () Bool)

(assert (=> b!910042 m!845753))

(declare-fun m!845755 () Bool)

(assert (=> start!78026 m!845755))

(declare-fun m!845757 () Bool)

(assert (=> start!78026 m!845757))

(declare-fun m!845759 () Bool)

(assert (=> start!78026 m!845759))

(declare-fun m!845761 () Bool)

(assert (=> mapNonEmpty!29968 m!845761))

(declare-fun m!845763 () Bool)

(assert (=> b!910048 m!845763))

(assert (=> b!910048 m!845763))

(declare-fun m!845765 () Bool)

(assert (=> b!910048 m!845765))

(check-sat tp_is_empty!18835 (not b!910048) b_and!26995 (not b!910047) (not b_next!16417) (not b!910042) (not start!78026) (not mapNonEmpty!29968))
(check-sat b_and!26995 (not b_next!16417))
