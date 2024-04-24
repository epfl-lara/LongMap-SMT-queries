; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78050 () Bool)

(assert start!78050)

(declare-fun b_free!16441 () Bool)

(declare-fun b_next!16441 () Bool)

(assert (=> start!78050 (= b_free!16441 (not b_next!16441))))

(declare-fun tp!57589 () Bool)

(declare-fun b_and!27019 () Bool)

(assert (=> start!78050 (= tp!57589 b_and!27019)))

(declare-fun b!910294 () Bool)

(declare-fun res!614129 () Bool)

(declare-fun e!510329 () Bool)

(assert (=> b!910294 (=> (not res!614129) (not e!510329))))

(declare-datatypes ((V!30111 0))(
  ( (V!30112 (val!9480 Int)) )
))
(declare-datatypes ((ValueCell!8948 0))(
  ( (ValueCellFull!8948 (v!11984 V!30111)) (EmptyCell!8948) )
))
(declare-datatypes ((array!53793 0))(
  ( (array!53794 (arr!25850 (Array (_ BitVec 32) ValueCell!8948)) (size!26310 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53793)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53795 0))(
  ( (array!53796 (arr!25851 (Array (_ BitVec 32) (_ BitVec 64))) (size!26311 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53795)

(assert (=> b!910294 (= res!614129 (and (= (size!26310 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26311 _keys!1386) (size!26310 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910295 () Bool)

(declare-fun e!510332 () Bool)

(declare-fun tp_is_empty!18859 () Bool)

(assert (=> b!910295 (= e!510332 tp_is_empty!18859)))

(declare-fun mapNonEmpty!30004 () Bool)

(declare-fun mapRes!30004 () Bool)

(declare-fun tp!57588 () Bool)

(assert (=> mapNonEmpty!30004 (= mapRes!30004 (and tp!57588 e!510332))))

(declare-fun mapKey!30004 () (_ BitVec 32))

(declare-fun mapRest!30004 () (Array (_ BitVec 32) ValueCell!8948))

(declare-fun mapValue!30004 () ValueCell!8948)

(assert (=> mapNonEmpty!30004 (= (arr!25850 _values!1152) (store mapRest!30004 mapKey!30004 mapValue!30004))))

(declare-fun b!910296 () Bool)

(declare-fun res!614128 () Bool)

(assert (=> b!910296 (=> (not res!614128) (not e!510329))))

(declare-datatypes ((List!18129 0))(
  ( (Nil!18126) (Cons!18125 (h!19277 (_ BitVec 64)) (t!25702 List!18129)) )
))
(declare-fun arrayNoDuplicates!0 (array!53795 (_ BitVec 32) List!18129) Bool)

(assert (=> b!910296 (= res!614128 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18126))))

(declare-fun b!910297 () Bool)

(declare-fun e!510330 () Bool)

(declare-fun e!510331 () Bool)

(assert (=> b!910297 (= e!510330 (and e!510331 mapRes!30004))))

(declare-fun condMapEmpty!30004 () Bool)

(declare-fun mapDefault!30004 () ValueCell!8948)

(assert (=> b!910297 (= condMapEmpty!30004 (= (arr!25850 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8948)) mapDefault!30004)))))

(declare-fun mapIsEmpty!30004 () Bool)

(assert (=> mapIsEmpty!30004 mapRes!30004))

(declare-fun b!910299 () Bool)

(assert (=> b!910299 (= e!510331 tp_is_empty!18859)))

(declare-fun b!910300 () Bool)

(assert (=> b!910300 (= e!510329 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410349 () Bool)

(declare-fun zeroValue!1094 () V!30111)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30111)

(declare-datatypes ((tuple2!12310 0))(
  ( (tuple2!12311 (_1!6166 (_ BitVec 64)) (_2!6166 V!30111)) )
))
(declare-datatypes ((List!18130 0))(
  ( (Nil!18127) (Cons!18126 (h!19278 tuple2!12310) (t!25703 List!18130)) )
))
(declare-datatypes ((ListLongMap!11009 0))(
  ( (ListLongMap!11010 (toList!5520 List!18130)) )
))
(declare-fun contains!4571 (ListLongMap!11009 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2781 (array!53795 array!53793 (_ BitVec 32) (_ BitVec 32) V!30111 V!30111 (_ BitVec 32) Int) ListLongMap!11009)

(assert (=> b!910300 (= lt!410349 (contains!4571 (getCurrentListMap!2781 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!614127 () Bool)

(assert (=> start!78050 (=> (not res!614127) (not e!510329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78050 (= res!614127 (validMask!0 mask!1756))))

(assert (=> start!78050 e!510329))

(declare-fun array_inv!20290 (array!53793) Bool)

(assert (=> start!78050 (and (array_inv!20290 _values!1152) e!510330)))

(assert (=> start!78050 tp!57589))

(assert (=> start!78050 true))

(assert (=> start!78050 tp_is_empty!18859))

(declare-fun array_inv!20291 (array!53795) Bool)

(assert (=> start!78050 (array_inv!20291 _keys!1386)))

(declare-fun b!910298 () Bool)

(declare-fun res!614126 () Bool)

(assert (=> b!910298 (=> (not res!614126) (not e!510329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53795 (_ BitVec 32)) Bool)

(assert (=> b!910298 (= res!614126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78050 res!614127) b!910294))

(assert (= (and b!910294 res!614129) b!910298))

(assert (= (and b!910298 res!614126) b!910296))

(assert (= (and b!910296 res!614128) b!910300))

(assert (= (and b!910297 condMapEmpty!30004) mapIsEmpty!30004))

(assert (= (and b!910297 (not condMapEmpty!30004)) mapNonEmpty!30004))

(get-info :version)

(assert (= (and mapNonEmpty!30004 ((_ is ValueCellFull!8948) mapValue!30004)) b!910295))

(assert (= (and b!910297 ((_ is ValueCellFull!8948) mapDefault!30004)) b!910299))

(assert (= start!78050 b!910297))

(declare-fun m!845943 () Bool)

(assert (=> b!910298 m!845943))

(declare-fun m!845945 () Bool)

(assert (=> start!78050 m!845945))

(declare-fun m!845947 () Bool)

(assert (=> start!78050 m!845947))

(declare-fun m!845949 () Bool)

(assert (=> start!78050 m!845949))

(declare-fun m!845951 () Bool)

(assert (=> b!910296 m!845951))

(declare-fun m!845953 () Bool)

(assert (=> b!910300 m!845953))

(assert (=> b!910300 m!845953))

(declare-fun m!845955 () Bool)

(assert (=> b!910300 m!845955))

(declare-fun m!845957 () Bool)

(assert (=> mapNonEmpty!30004 m!845957))

(check-sat (not b!910296) (not b!910300) (not b!910298) (not start!78050) (not b_next!16441) b_and!27019 tp_is_empty!18859 (not mapNonEmpty!30004))
(check-sat b_and!27019 (not b_next!16441))
