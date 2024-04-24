; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78314 () Bool)

(assert start!78314)

(declare-fun b_free!16657 () Bool)

(declare-fun b_next!16657 () Bool)

(assert (=> start!78314 (= b_free!16657 (not b_next!16657))))

(declare-fun tp!58246 () Bool)

(declare-fun b_and!27241 () Bool)

(assert (=> start!78314 (= tp!58246 b_and!27241)))

(declare-fun b!912943 () Bool)

(declare-fun e!512166 () Bool)

(declare-fun tp_is_empty!19075 () Bool)

(assert (=> b!912943 (= e!512166 tp_is_empty!19075)))

(declare-fun b!912944 () Bool)

(declare-fun res!615613 () Bool)

(declare-fun e!512169 () Bool)

(assert (=> b!912944 (=> (not res!615613) (not e!512169))))

(declare-datatypes ((V!30399 0))(
  ( (V!30400 (val!9588 Int)) )
))
(declare-datatypes ((ValueCell!9056 0))(
  ( (ValueCellFull!9056 (v!12095 V!30399)) (EmptyCell!9056) )
))
(declare-datatypes ((array!54203 0))(
  ( (array!54204 (arr!26052 (Array (_ BitVec 32) ValueCell!9056)) (size!26512 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54203)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54205 0))(
  ( (array!54206 (arr!26053 (Array (_ BitVec 32) (_ BitVec 64))) (size!26513 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54205)

(assert (=> b!912944 (= res!615613 (and (= (size!26512 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26513 _keys!1386) (size!26512 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912945 () Bool)

(declare-fun res!615612 () Bool)

(assert (=> b!912945 (=> (not res!615612) (not e!512169))))

(declare-datatypes ((List!18272 0))(
  ( (Nil!18269) (Cons!18268 (h!19420 (_ BitVec 64)) (t!25851 List!18272)) )
))
(declare-fun arrayNoDuplicates!0 (array!54205 (_ BitVec 32) List!18272) Bool)

(assert (=> b!912945 (= res!615612 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18269))))

(declare-fun b!912946 () Bool)

(declare-fun e!512168 () Bool)

(assert (=> b!912946 (= e!512168 tp_is_empty!19075)))

(declare-fun mapNonEmpty!30337 () Bool)

(declare-fun mapRes!30337 () Bool)

(declare-fun tp!58245 () Bool)

(assert (=> mapNonEmpty!30337 (= mapRes!30337 (and tp!58245 e!512166))))

(declare-fun mapRest!30337 () (Array (_ BitVec 32) ValueCell!9056))

(declare-fun mapKey!30337 () (_ BitVec 32))

(declare-fun mapValue!30337 () ValueCell!9056)

(assert (=> mapNonEmpty!30337 (= (arr!26052 _values!1152) (store mapRest!30337 mapKey!30337 mapValue!30337))))

(declare-fun res!615614 () Bool)

(assert (=> start!78314 (=> (not res!615614) (not e!512169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78314 (= res!615614 (validMask!0 mask!1756))))

(assert (=> start!78314 e!512169))

(declare-fun e!512167 () Bool)

(declare-fun array_inv!20442 (array!54203) Bool)

(assert (=> start!78314 (and (array_inv!20442 _values!1152) e!512167)))

(assert (=> start!78314 tp!58246))

(assert (=> start!78314 true))

(assert (=> start!78314 tp_is_empty!19075))

(declare-fun array_inv!20443 (array!54205) Bool)

(assert (=> start!78314 (array_inv!20443 _keys!1386)))

(declare-fun b!912947 () Bool)

(assert (=> b!912947 (= e!512169 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30399)

(declare-fun lt!410907 () Bool)

(declare-fun minValue!1094 () V!30399)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12452 0))(
  ( (tuple2!12453 (_1!6237 (_ BitVec 64)) (_2!6237 V!30399)) )
))
(declare-datatypes ((List!18273 0))(
  ( (Nil!18270) (Cons!18269 (h!19421 tuple2!12452) (t!25852 List!18273)) )
))
(declare-datatypes ((ListLongMap!11151 0))(
  ( (ListLongMap!11152 (toList!5591 List!18273)) )
))
(declare-fun contains!4645 (ListLongMap!11151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2852 (array!54205 array!54203 (_ BitVec 32) (_ BitVec 32) V!30399 V!30399 (_ BitVec 32) Int) ListLongMap!11151)

(assert (=> b!912947 (= lt!410907 (contains!4645 (getCurrentListMap!2852 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912948 () Bool)

(declare-fun res!615611 () Bool)

(assert (=> b!912948 (=> (not res!615611) (not e!512169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54205 (_ BitVec 32)) Bool)

(assert (=> b!912948 (= res!615611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30337 () Bool)

(assert (=> mapIsEmpty!30337 mapRes!30337))

(declare-fun b!912949 () Bool)

(assert (=> b!912949 (= e!512167 (and e!512168 mapRes!30337))))

(declare-fun condMapEmpty!30337 () Bool)

(declare-fun mapDefault!30337 () ValueCell!9056)

(assert (=> b!912949 (= condMapEmpty!30337 (= (arr!26052 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9056)) mapDefault!30337)))))

(assert (= (and start!78314 res!615614) b!912944))

(assert (= (and b!912944 res!615613) b!912948))

(assert (= (and b!912948 res!615611) b!912945))

(assert (= (and b!912945 res!615612) b!912947))

(assert (= (and b!912949 condMapEmpty!30337) mapIsEmpty!30337))

(assert (= (and b!912949 (not condMapEmpty!30337)) mapNonEmpty!30337))

(get-info :version)

(assert (= (and mapNonEmpty!30337 ((_ is ValueCellFull!9056) mapValue!30337)) b!912943))

(assert (= (and b!912949 ((_ is ValueCellFull!9056) mapDefault!30337)) b!912946))

(assert (= start!78314 b!912949))

(declare-fun m!847941 () Bool)

(assert (=> b!912948 m!847941))

(declare-fun m!847943 () Bool)

(assert (=> b!912945 m!847943))

(declare-fun m!847945 () Bool)

(assert (=> mapNonEmpty!30337 m!847945))

(declare-fun m!847947 () Bool)

(assert (=> b!912947 m!847947))

(assert (=> b!912947 m!847947))

(declare-fun m!847949 () Bool)

(assert (=> b!912947 m!847949))

(declare-fun m!847951 () Bool)

(assert (=> start!78314 m!847951))

(declare-fun m!847953 () Bool)

(assert (=> start!78314 m!847953))

(declare-fun m!847955 () Bool)

(assert (=> start!78314 m!847955))

(check-sat (not mapNonEmpty!30337) (not b!912948) tp_is_empty!19075 (not b_next!16657) b_and!27241 (not start!78314) (not b!912947) (not b!912945))
(check-sat b_and!27241 (not b_next!16657))
