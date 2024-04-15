; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77946 () Bool)

(assert start!77946)

(declare-fun b_free!16507 () Bool)

(declare-fun b_next!16507 () Bool)

(assert (=> start!77946 (= b_free!16507 (not b_next!16507))))

(declare-fun tp!57790 () Bool)

(declare-fun b_and!27051 () Bool)

(assert (=> start!77946 (= tp!57790 b_and!27051)))

(declare-fun b!909972 () Bool)

(declare-fun e!510168 () Bool)

(declare-fun tp_is_empty!18925 () Bool)

(assert (=> b!909972 (= e!510168 tp_is_empty!18925)))

(declare-fun mapNonEmpty!30106 () Bool)

(declare-fun mapRes!30106 () Bool)

(declare-fun tp!57789 () Bool)

(assert (=> mapNonEmpty!30106 (= mapRes!30106 (and tp!57789 e!510168))))

(declare-datatypes ((V!30199 0))(
  ( (V!30200 (val!9513 Int)) )
))
(declare-datatypes ((ValueCell!8981 0))(
  ( (ValueCellFull!8981 (v!12020 V!30199)) (EmptyCell!8981) )
))
(declare-datatypes ((array!53853 0))(
  ( (array!53854 (arr!25884 (Array (_ BitVec 32) ValueCell!8981)) (size!26345 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53853)

(declare-fun mapValue!30106 () ValueCell!8981)

(declare-fun mapKey!30106 () (_ BitVec 32))

(declare-fun mapRest!30106 () (Array (_ BitVec 32) ValueCell!8981))

(assert (=> mapNonEmpty!30106 (= (arr!25884 _values!1152) (store mapRest!30106 mapKey!30106 mapValue!30106))))

(declare-fun res!614131 () Bool)

(declare-fun e!510169 () Bool)

(assert (=> start!77946 (=> (not res!614131) (not e!510169))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77946 (= res!614131 (validMask!0 mask!1756))))

(assert (=> start!77946 e!510169))

(declare-fun e!510167 () Bool)

(declare-fun array_inv!20294 (array!53853) Bool)

(assert (=> start!77946 (and (array_inv!20294 _values!1152) e!510167)))

(assert (=> start!77946 tp!57790))

(assert (=> start!77946 true))

(assert (=> start!77946 tp_is_empty!18925))

(declare-datatypes ((array!53855 0))(
  ( (array!53856 (arr!25885 (Array (_ BitVec 32) (_ BitVec 64))) (size!26346 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53855)

(declare-fun array_inv!20295 (array!53855) Bool)

(assert (=> start!77946 (array_inv!20295 _keys!1386)))

(declare-fun b!909973 () Bool)

(declare-fun e!510166 () Bool)

(assert (=> b!909973 (= e!510167 (and e!510166 mapRes!30106))))

(declare-fun condMapEmpty!30106 () Bool)

(declare-fun mapDefault!30106 () ValueCell!8981)

(assert (=> b!909973 (= condMapEmpty!30106 (= (arr!25884 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8981)) mapDefault!30106)))))

(declare-fun b!909974 () Bool)

(declare-fun res!614132 () Bool)

(assert (=> b!909974 (=> (not res!614132) (not e!510169))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!909974 (= res!614132 (and (= (size!26345 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26346 _keys!1386) (size!26345 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909975 () Bool)

(declare-fun res!614134 () Bool)

(assert (=> b!909975 (=> (not res!614134) (not e!510169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53855 (_ BitVec 32)) Bool)

(assert (=> b!909975 (= res!614134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909976 () Bool)

(assert (=> b!909976 (= e!510169 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30199)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30199)

(declare-fun lt!409929 () Bool)

(declare-datatypes ((tuple2!12428 0))(
  ( (tuple2!12429 (_1!6225 (_ BitVec 64)) (_2!6225 V!30199)) )
))
(declare-datatypes ((List!18213 0))(
  ( (Nil!18210) (Cons!18209 (h!19355 tuple2!12428) (t!25787 List!18213)) )
))
(declare-datatypes ((ListLongMap!11115 0))(
  ( (ListLongMap!11116 (toList!5573 List!18213)) )
))
(declare-fun contains!4573 (ListLongMap!11115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2775 (array!53855 array!53853 (_ BitVec 32) (_ BitVec 32) V!30199 V!30199 (_ BitVec 32) Int) ListLongMap!11115)

(assert (=> b!909976 (= lt!409929 (contains!4573 (getCurrentListMap!2775 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909977 () Bool)

(assert (=> b!909977 (= e!510166 tp_is_empty!18925)))

(declare-fun b!909978 () Bool)

(declare-fun res!614133 () Bool)

(assert (=> b!909978 (=> (not res!614133) (not e!510169))))

(declare-datatypes ((List!18214 0))(
  ( (Nil!18211) (Cons!18210 (h!19356 (_ BitVec 64)) (t!25788 List!18214)) )
))
(declare-fun arrayNoDuplicates!0 (array!53855 (_ BitVec 32) List!18214) Bool)

(assert (=> b!909978 (= res!614133 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18211))))

(declare-fun mapIsEmpty!30106 () Bool)

(assert (=> mapIsEmpty!30106 mapRes!30106))

(assert (= (and start!77946 res!614131) b!909974))

(assert (= (and b!909974 res!614132) b!909975))

(assert (= (and b!909975 res!614134) b!909978))

(assert (= (and b!909978 res!614133) b!909976))

(assert (= (and b!909973 condMapEmpty!30106) mapIsEmpty!30106))

(assert (= (and b!909973 (not condMapEmpty!30106)) mapNonEmpty!30106))

(get-info :version)

(assert (= (and mapNonEmpty!30106 ((_ is ValueCellFull!8981) mapValue!30106)) b!909972))

(assert (= (and b!909973 ((_ is ValueCellFull!8981) mapDefault!30106)) b!909977))

(assert (= start!77946 b!909973))

(declare-fun m!844511 () Bool)

(assert (=> start!77946 m!844511))

(declare-fun m!844513 () Bool)

(assert (=> start!77946 m!844513))

(declare-fun m!844515 () Bool)

(assert (=> start!77946 m!844515))

(declare-fun m!844517 () Bool)

(assert (=> mapNonEmpty!30106 m!844517))

(declare-fun m!844519 () Bool)

(assert (=> b!909975 m!844519))

(declare-fun m!844521 () Bool)

(assert (=> b!909978 m!844521))

(declare-fun m!844523 () Bool)

(assert (=> b!909976 m!844523))

(assert (=> b!909976 m!844523))

(declare-fun m!844525 () Bool)

(assert (=> b!909976 m!844525))

(check-sat (not b!909976) (not b!909978) (not mapNonEmpty!30106) tp_is_empty!18925 (not b!909975) (not b_next!16507) (not start!77946) b_and!27051)
(check-sat b_and!27051 (not b_next!16507))
