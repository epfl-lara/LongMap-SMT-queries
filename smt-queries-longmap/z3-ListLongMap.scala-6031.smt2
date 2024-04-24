; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78238 () Bool)

(assert start!78238)

(declare-fun b_free!16597 () Bool)

(declare-fun b_next!16597 () Bool)

(assert (=> start!78238 (= b_free!16597 (not b_next!16597))))

(declare-fun tp!58062 () Bool)

(declare-fun b_and!27179 () Bool)

(assert (=> start!78238 (= tp!58062 b_and!27179)))

(declare-fun mapIsEmpty!30244 () Bool)

(declare-fun mapRes!30244 () Bool)

(assert (=> mapIsEmpty!30244 mapRes!30244))

(declare-fun b!912186 () Bool)

(declare-fun e!511644 () Bool)

(assert (=> b!912186 (= e!511644 false)))

(declare-datatypes ((V!30319 0))(
  ( (V!30320 (val!9558 Int)) )
))
(declare-datatypes ((ValueCell!9026 0))(
  ( (ValueCellFull!9026 (v!12064 V!30319)) (EmptyCell!9026) )
))
(declare-datatypes ((array!54093 0))(
  ( (array!54094 (arr!25998 (Array (_ BitVec 32) ValueCell!9026)) (size!26458 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54093)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30319)

(declare-datatypes ((array!54095 0))(
  ( (array!54096 (arr!25999 (Array (_ BitVec 32) (_ BitVec 64))) (size!26459 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54095)

(declare-fun lt!410739 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30319)

(declare-datatypes ((tuple2!12414 0))(
  ( (tuple2!12415 (_1!6218 (_ BitVec 64)) (_2!6218 V!30319)) )
))
(declare-datatypes ((List!18234 0))(
  ( (Nil!18231) (Cons!18230 (h!19382 tuple2!12414) (t!25811 List!18234)) )
))
(declare-datatypes ((ListLongMap!11113 0))(
  ( (ListLongMap!11114 (toList!5572 List!18234)) )
))
(declare-fun contains!4625 (ListLongMap!11113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2833 (array!54095 array!54093 (_ BitVec 32) (_ BitVec 32) V!30319 V!30319 (_ BitVec 32) Int) ListLongMap!11113)

(assert (=> b!912186 (= lt!410739 (contains!4625 (getCurrentListMap!2833 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912187 () Bool)

(declare-fun e!511646 () Bool)

(declare-fun e!511647 () Bool)

(assert (=> b!912187 (= e!511646 (and e!511647 mapRes!30244))))

(declare-fun condMapEmpty!30244 () Bool)

(declare-fun mapDefault!30244 () ValueCell!9026)

(assert (=> b!912187 (= condMapEmpty!30244 (= (arr!25998 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9026)) mapDefault!30244)))))

(declare-fun b!912188 () Bool)

(declare-fun tp_is_empty!19015 () Bool)

(assert (=> b!912188 (= e!511647 tp_is_empty!19015)))

(declare-fun b!912189 () Bool)

(declare-fun res!615188 () Bool)

(assert (=> b!912189 (=> (not res!615188) (not e!511644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54095 (_ BitVec 32)) Bool)

(assert (=> b!912189 (= res!615188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!615189 () Bool)

(assert (=> start!78238 (=> (not res!615189) (not e!511644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78238 (= res!615189 (validMask!0 mask!1756))))

(assert (=> start!78238 e!511644))

(declare-fun array_inv!20402 (array!54093) Bool)

(assert (=> start!78238 (and (array_inv!20402 _values!1152) e!511646)))

(assert (=> start!78238 tp!58062))

(assert (=> start!78238 true))

(assert (=> start!78238 tp_is_empty!19015))

(declare-fun array_inv!20403 (array!54095) Bool)

(assert (=> start!78238 (array_inv!20403 _keys!1386)))

(declare-fun mapNonEmpty!30244 () Bool)

(declare-fun tp!58063 () Bool)

(declare-fun e!511643 () Bool)

(assert (=> mapNonEmpty!30244 (= mapRes!30244 (and tp!58063 e!511643))))

(declare-fun mapValue!30244 () ValueCell!9026)

(declare-fun mapRest!30244 () (Array (_ BitVec 32) ValueCell!9026))

(declare-fun mapKey!30244 () (_ BitVec 32))

(assert (=> mapNonEmpty!30244 (= (arr!25998 _values!1152) (store mapRest!30244 mapKey!30244 mapValue!30244))))

(declare-fun b!912190 () Bool)

(declare-fun res!615190 () Bool)

(assert (=> b!912190 (=> (not res!615190) (not e!511644))))

(assert (=> b!912190 (= res!615190 (and (= (size!26458 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26459 _keys!1386) (size!26458 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912191 () Bool)

(declare-fun res!615191 () Bool)

(assert (=> b!912191 (=> (not res!615191) (not e!511644))))

(declare-datatypes ((List!18235 0))(
  ( (Nil!18232) (Cons!18231 (h!19383 (_ BitVec 64)) (t!25812 List!18235)) )
))
(declare-fun arrayNoDuplicates!0 (array!54095 (_ BitVec 32) List!18235) Bool)

(assert (=> b!912191 (= res!615191 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18232))))

(declare-fun b!912192 () Bool)

(assert (=> b!912192 (= e!511643 tp_is_empty!19015)))

(assert (= (and start!78238 res!615189) b!912190))

(assert (= (and b!912190 res!615190) b!912189))

(assert (= (and b!912189 res!615188) b!912191))

(assert (= (and b!912191 res!615191) b!912186))

(assert (= (and b!912187 condMapEmpty!30244) mapIsEmpty!30244))

(assert (= (and b!912187 (not condMapEmpty!30244)) mapNonEmpty!30244))

(get-info :version)

(assert (= (and mapNonEmpty!30244 ((_ is ValueCellFull!9026) mapValue!30244)) b!912192))

(assert (= (and b!912187 ((_ is ValueCellFull!9026) mapDefault!30244)) b!912188))

(assert (= start!78238 b!912187))

(declare-fun m!847375 () Bool)

(assert (=> mapNonEmpty!30244 m!847375))

(declare-fun m!847377 () Bool)

(assert (=> start!78238 m!847377))

(declare-fun m!847379 () Bool)

(assert (=> start!78238 m!847379))

(declare-fun m!847381 () Bool)

(assert (=> start!78238 m!847381))

(declare-fun m!847383 () Bool)

(assert (=> b!912191 m!847383))

(declare-fun m!847385 () Bool)

(assert (=> b!912189 m!847385))

(declare-fun m!847387 () Bool)

(assert (=> b!912186 m!847387))

(assert (=> b!912186 m!847387))

(declare-fun m!847389 () Bool)

(assert (=> b!912186 m!847389))

(check-sat (not b!912186) (not b!912191) (not b_next!16597) (not start!78238) (not b!912189) tp_is_empty!19015 (not mapNonEmpty!30244) b_and!27179)
(check-sat b_and!27179 (not b_next!16597))
