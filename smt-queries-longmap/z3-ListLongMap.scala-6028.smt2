; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78054 () Bool)

(assert start!78054)

(declare-fun b_free!16581 () Bool)

(declare-fun b_next!16581 () Bool)

(assert (=> start!78054 (= b_free!16581 (not b_next!16581))))

(declare-fun tp!58013 () Bool)

(declare-fun b_and!27153 () Bool)

(assert (=> start!78054 (= tp!58013 b_and!27153)))

(declare-fun b!911115 () Bool)

(declare-fun res!614749 () Bool)

(declare-fun e!510941 () Bool)

(assert (=> b!911115 (=> (not res!614749) (not e!510941))))

(declare-datatypes ((array!54002 0))(
  ( (array!54003 (arr!25957 (Array (_ BitVec 32) (_ BitVec 64))) (size!26416 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54002)

(declare-datatypes ((List!18232 0))(
  ( (Nil!18229) (Cons!18228 (h!19374 (_ BitVec 64)) (t!25817 List!18232)) )
))
(declare-fun arrayNoDuplicates!0 (array!54002 (_ BitVec 32) List!18232) Bool)

(assert (=> b!911115 (= res!614749 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18229))))

(declare-fun b!911116 () Bool)

(declare-fun e!510945 () Bool)

(declare-fun tp_is_empty!18999 () Bool)

(assert (=> b!911116 (= e!510945 tp_is_empty!18999)))

(declare-fun b!911117 () Bool)

(declare-fun res!614751 () Bool)

(assert (=> b!911117 (=> (not res!614751) (not e!510941))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54002 (_ BitVec 32)) Bool)

(assert (=> b!911117 (= res!614751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30220 () Bool)

(declare-fun mapRes!30220 () Bool)

(declare-fun tp!58014 () Bool)

(assert (=> mapNonEmpty!30220 (= mapRes!30220 (and tp!58014 e!510945))))

(declare-datatypes ((V!30297 0))(
  ( (V!30298 (val!9550 Int)) )
))
(declare-datatypes ((ValueCell!9018 0))(
  ( (ValueCellFull!9018 (v!12059 V!30297)) (EmptyCell!9018) )
))
(declare-datatypes ((array!54004 0))(
  ( (array!54005 (arr!25958 (Array (_ BitVec 32) ValueCell!9018)) (size!26417 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54004)

(declare-fun mapKey!30220 () (_ BitVec 32))

(declare-fun mapRest!30220 () (Array (_ BitVec 32) ValueCell!9018))

(declare-fun mapValue!30220 () ValueCell!9018)

(assert (=> mapNonEmpty!30220 (= (arr!25958 _values!1152) (store mapRest!30220 mapKey!30220 mapValue!30220))))

(declare-fun mapIsEmpty!30220 () Bool)

(assert (=> mapIsEmpty!30220 mapRes!30220))

(declare-fun b!911118 () Bool)

(declare-fun res!614748 () Bool)

(assert (=> b!911118 (=> (not res!614748) (not e!510941))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911118 (= res!614748 (and (= (size!26417 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26416 _keys!1386) (size!26417 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!614750 () Bool)

(assert (=> start!78054 (=> (not res!614750) (not e!510941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78054 (= res!614750 (validMask!0 mask!1756))))

(assert (=> start!78054 e!510941))

(declare-fun e!510942 () Bool)

(declare-fun array_inv!20292 (array!54004) Bool)

(assert (=> start!78054 (and (array_inv!20292 _values!1152) e!510942)))

(assert (=> start!78054 tp!58013))

(assert (=> start!78054 true))

(assert (=> start!78054 tp_is_empty!18999))

(declare-fun array_inv!20293 (array!54002) Bool)

(assert (=> start!78054 (array_inv!20293 _keys!1386)))

(declare-fun b!911119 () Bool)

(declare-fun e!510943 () Bool)

(assert (=> b!911119 (= e!510943 tp_is_empty!18999)))

(declare-fun b!911120 () Bool)

(assert (=> b!911120 (= e!510942 (and e!510943 mapRes!30220))))

(declare-fun condMapEmpty!30220 () Bool)

(declare-fun mapDefault!30220 () ValueCell!9018)

(assert (=> b!911120 (= condMapEmpty!30220 (= (arr!25958 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9018)) mapDefault!30220)))))

(declare-fun b!911121 () Bool)

(assert (=> b!911121 (= e!510941 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30297)

(declare-fun lt!410354 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30297)

(declare-datatypes ((tuple2!12442 0))(
  ( (tuple2!12443 (_1!6232 (_ BitVec 64)) (_2!6232 V!30297)) )
))
(declare-datatypes ((List!18233 0))(
  ( (Nil!18230) (Cons!18229 (h!19375 tuple2!12442) (t!25818 List!18233)) )
))
(declare-datatypes ((ListLongMap!11139 0))(
  ( (ListLongMap!11140 (toList!5585 List!18233)) )
))
(declare-fun contains!4629 (ListLongMap!11139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2847 (array!54002 array!54004 (_ BitVec 32) (_ BitVec 32) V!30297 V!30297 (_ BitVec 32) Int) ListLongMap!11139)

(assert (=> b!911121 (= lt!410354 (contains!4629 (getCurrentListMap!2847 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!78054 res!614750) b!911118))

(assert (= (and b!911118 res!614748) b!911117))

(assert (= (and b!911117 res!614751) b!911115))

(assert (= (and b!911115 res!614749) b!911121))

(assert (= (and b!911120 condMapEmpty!30220) mapIsEmpty!30220))

(assert (= (and b!911120 (not condMapEmpty!30220)) mapNonEmpty!30220))

(get-info :version)

(assert (= (and mapNonEmpty!30220 ((_ is ValueCellFull!9018) mapValue!30220)) b!911116))

(assert (= (and b!911120 ((_ is ValueCellFull!9018) mapDefault!30220)) b!911119))

(assert (= start!78054 b!911120))

(declare-fun m!845953 () Bool)

(assert (=> b!911115 m!845953))

(declare-fun m!845955 () Bool)

(assert (=> start!78054 m!845955))

(declare-fun m!845957 () Bool)

(assert (=> start!78054 m!845957))

(declare-fun m!845959 () Bool)

(assert (=> start!78054 m!845959))

(declare-fun m!845961 () Bool)

(assert (=> b!911117 m!845961))

(declare-fun m!845963 () Bool)

(assert (=> mapNonEmpty!30220 m!845963))

(declare-fun m!845965 () Bool)

(assert (=> b!911121 m!845965))

(assert (=> b!911121 m!845965))

(declare-fun m!845967 () Bool)

(assert (=> b!911121 m!845967))

(check-sat tp_is_empty!18999 (not start!78054) (not mapNonEmpty!30220) (not b!911115) (not b!911117) b_and!27153 (not b!911121) (not b_next!16581))
(check-sat b_and!27153 (not b_next!16581))
