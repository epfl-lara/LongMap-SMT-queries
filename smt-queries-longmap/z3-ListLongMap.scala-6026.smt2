; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78042 () Bool)

(assert start!78042)

(declare-fun b_free!16569 () Bool)

(declare-fun b_next!16569 () Bool)

(assert (=> start!78042 (= b_free!16569 (not b_next!16569))))

(declare-fun tp!57978 () Bool)

(declare-fun b_and!27141 () Bool)

(assert (=> start!78042 (= tp!57978 b_and!27141)))

(declare-fun res!614679 () Bool)

(declare-fun e!510852 () Bool)

(assert (=> start!78042 (=> (not res!614679) (not e!510852))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78042 (= res!614679 (validMask!0 mask!1756))))

(assert (=> start!78042 e!510852))

(declare-datatypes ((V!30281 0))(
  ( (V!30282 (val!9544 Int)) )
))
(declare-datatypes ((ValueCell!9012 0))(
  ( (ValueCellFull!9012 (v!12053 V!30281)) (EmptyCell!9012) )
))
(declare-datatypes ((array!53980 0))(
  ( (array!53981 (arr!25946 (Array (_ BitVec 32) ValueCell!9012)) (size!26405 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53980)

(declare-fun e!510853 () Bool)

(declare-fun array_inv!20284 (array!53980) Bool)

(assert (=> start!78042 (and (array_inv!20284 _values!1152) e!510853)))

(assert (=> start!78042 tp!57978))

(assert (=> start!78042 true))

(declare-fun tp_is_empty!18987 () Bool)

(assert (=> start!78042 tp_is_empty!18987))

(declare-datatypes ((array!53982 0))(
  ( (array!53983 (arr!25947 (Array (_ BitVec 32) (_ BitVec 64))) (size!26406 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53982)

(declare-fun array_inv!20285 (array!53982) Bool)

(assert (=> start!78042 (array_inv!20285 _keys!1386)))

(declare-fun mapNonEmpty!30202 () Bool)

(declare-fun mapRes!30202 () Bool)

(declare-fun tp!57977 () Bool)

(declare-fun e!510851 () Bool)

(assert (=> mapNonEmpty!30202 (= mapRes!30202 (and tp!57977 e!510851))))

(declare-fun mapRest!30202 () (Array (_ BitVec 32) ValueCell!9012))

(declare-fun mapKey!30202 () (_ BitVec 32))

(declare-fun mapValue!30202 () ValueCell!9012)

(assert (=> mapNonEmpty!30202 (= (arr!25946 _values!1152) (store mapRest!30202 mapKey!30202 mapValue!30202))))

(declare-fun b!910989 () Bool)

(assert (=> b!910989 (= e!510851 tp_is_empty!18987)))

(declare-fun b!910990 () Bool)

(declare-fun e!510854 () Bool)

(assert (=> b!910990 (= e!510853 (and e!510854 mapRes!30202))))

(declare-fun condMapEmpty!30202 () Bool)

(declare-fun mapDefault!30202 () ValueCell!9012)

(assert (=> b!910990 (= condMapEmpty!30202 (= (arr!25946 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9012)) mapDefault!30202)))))

(declare-fun b!910991 () Bool)

(declare-fun res!614677 () Bool)

(assert (=> b!910991 (=> (not res!614677) (not e!510852))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!910991 (= res!614677 (and (= (size!26405 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26406 _keys!1386) (size!26405 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910992 () Bool)

(declare-fun res!614676 () Bool)

(assert (=> b!910992 (=> (not res!614676) (not e!510852))))

(declare-datatypes ((List!18225 0))(
  ( (Nil!18222) (Cons!18221 (h!19367 (_ BitVec 64)) (t!25810 List!18225)) )
))
(declare-fun arrayNoDuplicates!0 (array!53982 (_ BitVec 32) List!18225) Bool)

(assert (=> b!910992 (= res!614676 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18222))))

(declare-fun b!910993 () Bool)

(assert (=> b!910993 (= e!510852 false)))

(declare-fun zeroValue!1094 () V!30281)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30281)

(declare-fun lt!410336 () Bool)

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((tuple2!12434 0))(
  ( (tuple2!12435 (_1!6228 (_ BitVec 64)) (_2!6228 V!30281)) )
))
(declare-datatypes ((List!18226 0))(
  ( (Nil!18223) (Cons!18222 (h!19368 tuple2!12434) (t!25811 List!18226)) )
))
(declare-datatypes ((ListLongMap!11131 0))(
  ( (ListLongMap!11132 (toList!5581 List!18226)) )
))
(declare-fun contains!4625 (ListLongMap!11131 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2843 (array!53982 array!53980 (_ BitVec 32) (_ BitVec 32) V!30281 V!30281 (_ BitVec 32) Int) ListLongMap!11131)

(assert (=> b!910993 (= lt!410336 (contains!4625 (getCurrentListMap!2843 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910994 () Bool)

(assert (=> b!910994 (= e!510854 tp_is_empty!18987)))

(declare-fun mapIsEmpty!30202 () Bool)

(assert (=> mapIsEmpty!30202 mapRes!30202))

(declare-fun b!910995 () Bool)

(declare-fun res!614678 () Bool)

(assert (=> b!910995 (=> (not res!614678) (not e!510852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53982 (_ BitVec 32)) Bool)

(assert (=> b!910995 (= res!614678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78042 res!614679) b!910991))

(assert (= (and b!910991 res!614677) b!910995))

(assert (= (and b!910995 res!614678) b!910992))

(assert (= (and b!910992 res!614676) b!910993))

(assert (= (and b!910990 condMapEmpty!30202) mapIsEmpty!30202))

(assert (= (and b!910990 (not condMapEmpty!30202)) mapNonEmpty!30202))

(get-info :version)

(assert (= (and mapNonEmpty!30202 ((_ is ValueCellFull!9012) mapValue!30202)) b!910989))

(assert (= (and b!910990 ((_ is ValueCellFull!9012) mapDefault!30202)) b!910994))

(assert (= start!78042 b!910990))

(declare-fun m!845857 () Bool)

(assert (=> b!910992 m!845857))

(declare-fun m!845859 () Bool)

(assert (=> b!910993 m!845859))

(assert (=> b!910993 m!845859))

(declare-fun m!845861 () Bool)

(assert (=> b!910993 m!845861))

(declare-fun m!845863 () Bool)

(assert (=> mapNonEmpty!30202 m!845863))

(declare-fun m!845865 () Bool)

(assert (=> b!910995 m!845865))

(declare-fun m!845867 () Bool)

(assert (=> start!78042 m!845867))

(declare-fun m!845869 () Bool)

(assert (=> start!78042 m!845869))

(declare-fun m!845871 () Bool)

(assert (=> start!78042 m!845871))

(check-sat (not b!910995) (not start!78042) b_and!27141 (not b!910993) tp_is_empty!18987 (not b_next!16569) (not b!910992) (not mapNonEmpty!30202))
(check-sat b_and!27141 (not b_next!16569))
