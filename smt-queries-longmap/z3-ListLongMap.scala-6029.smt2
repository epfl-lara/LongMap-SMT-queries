; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78226 () Bool)

(assert start!78226)

(declare-fun b_free!16585 () Bool)

(declare-fun b_next!16585 () Bool)

(assert (=> start!78226 (= b_free!16585 (not b_next!16585))))

(declare-fun tp!58026 () Bool)

(declare-fun b_and!27167 () Bool)

(assert (=> start!78226 (= tp!58026 b_and!27167)))

(declare-fun b!912060 () Bool)

(declare-fun e!511554 () Bool)

(assert (=> b!912060 (= e!511554 false)))

(declare-datatypes ((V!30303 0))(
  ( (V!30304 (val!9552 Int)) )
))
(declare-datatypes ((ValueCell!9020 0))(
  ( (ValueCellFull!9020 (v!12058 V!30303)) (EmptyCell!9020) )
))
(declare-datatypes ((array!54071 0))(
  ( (array!54072 (arr!25987 (Array (_ BitVec 32) ValueCell!9020)) (size!26447 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54071)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30303)

(declare-datatypes ((array!54073 0))(
  ( (array!54074 (arr!25988 (Array (_ BitVec 32) (_ BitVec 64))) (size!26448 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54073)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410721 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30303)

(declare-datatypes ((tuple2!12408 0))(
  ( (tuple2!12409 (_1!6215 (_ BitVec 64)) (_2!6215 V!30303)) )
))
(declare-datatypes ((List!18229 0))(
  ( (Nil!18226) (Cons!18225 (h!19377 tuple2!12408) (t!25806 List!18229)) )
))
(declare-datatypes ((ListLongMap!11107 0))(
  ( (ListLongMap!11108 (toList!5569 List!18229)) )
))
(declare-fun contains!4622 (ListLongMap!11107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2830 (array!54073 array!54071 (_ BitVec 32) (_ BitVec 32) V!30303 V!30303 (_ BitVec 32) Int) ListLongMap!11107)

(assert (=> b!912060 (= lt!410721 (contains!4622 (getCurrentListMap!2830 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!30226 () Bool)

(declare-fun mapRes!30226 () Bool)

(assert (=> mapIsEmpty!30226 mapRes!30226))

(declare-fun b!912061 () Bool)

(declare-fun e!511553 () Bool)

(declare-fun tp_is_empty!19003 () Bool)

(assert (=> b!912061 (= e!511553 tp_is_empty!19003)))

(declare-fun res!615117 () Bool)

(assert (=> start!78226 (=> (not res!615117) (not e!511554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78226 (= res!615117 (validMask!0 mask!1756))))

(assert (=> start!78226 e!511554))

(declare-fun e!511557 () Bool)

(declare-fun array_inv!20392 (array!54071) Bool)

(assert (=> start!78226 (and (array_inv!20392 _values!1152) e!511557)))

(assert (=> start!78226 tp!58026))

(assert (=> start!78226 true))

(assert (=> start!78226 tp_is_empty!19003))

(declare-fun array_inv!20393 (array!54073) Bool)

(assert (=> start!78226 (array_inv!20393 _keys!1386)))

(declare-fun b!912062 () Bool)

(declare-fun e!511556 () Bool)

(assert (=> b!912062 (= e!511556 tp_is_empty!19003)))

(declare-fun b!912063 () Bool)

(declare-fun res!615118 () Bool)

(assert (=> b!912063 (=> (not res!615118) (not e!511554))))

(declare-datatypes ((List!18230 0))(
  ( (Nil!18227) (Cons!18226 (h!19378 (_ BitVec 64)) (t!25807 List!18230)) )
))
(declare-fun arrayNoDuplicates!0 (array!54073 (_ BitVec 32) List!18230) Bool)

(assert (=> b!912063 (= res!615118 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18227))))

(declare-fun b!912064 () Bool)

(assert (=> b!912064 (= e!511557 (and e!511556 mapRes!30226))))

(declare-fun condMapEmpty!30226 () Bool)

(declare-fun mapDefault!30226 () ValueCell!9020)

(assert (=> b!912064 (= condMapEmpty!30226 (= (arr!25987 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9020)) mapDefault!30226)))))

(declare-fun mapNonEmpty!30226 () Bool)

(declare-fun tp!58027 () Bool)

(assert (=> mapNonEmpty!30226 (= mapRes!30226 (and tp!58027 e!511553))))

(declare-fun mapValue!30226 () ValueCell!9020)

(declare-fun mapKey!30226 () (_ BitVec 32))

(declare-fun mapRest!30226 () (Array (_ BitVec 32) ValueCell!9020))

(assert (=> mapNonEmpty!30226 (= (arr!25987 _values!1152) (store mapRest!30226 mapKey!30226 mapValue!30226))))

(declare-fun b!912065 () Bool)

(declare-fun res!615116 () Bool)

(assert (=> b!912065 (=> (not res!615116) (not e!511554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54073 (_ BitVec 32)) Bool)

(assert (=> b!912065 (= res!615116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912066 () Bool)

(declare-fun res!615119 () Bool)

(assert (=> b!912066 (=> (not res!615119) (not e!511554))))

(assert (=> b!912066 (= res!615119 (and (= (size!26447 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26448 _keys!1386) (size!26447 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!78226 res!615117) b!912066))

(assert (= (and b!912066 res!615119) b!912065))

(assert (= (and b!912065 res!615116) b!912063))

(assert (= (and b!912063 res!615118) b!912060))

(assert (= (and b!912064 condMapEmpty!30226) mapIsEmpty!30226))

(assert (= (and b!912064 (not condMapEmpty!30226)) mapNonEmpty!30226))

(get-info :version)

(assert (= (and mapNonEmpty!30226 ((_ is ValueCellFull!9020) mapValue!30226)) b!912061))

(assert (= (and b!912064 ((_ is ValueCellFull!9020) mapDefault!30226)) b!912062))

(assert (= start!78226 b!912064))

(declare-fun m!847279 () Bool)

(assert (=> b!912065 m!847279))

(declare-fun m!847281 () Bool)

(assert (=> start!78226 m!847281))

(declare-fun m!847283 () Bool)

(assert (=> start!78226 m!847283))

(declare-fun m!847285 () Bool)

(assert (=> start!78226 m!847285))

(declare-fun m!847287 () Bool)

(assert (=> b!912063 m!847287))

(declare-fun m!847289 () Bool)

(assert (=> b!912060 m!847289))

(assert (=> b!912060 m!847289))

(declare-fun m!847291 () Bool)

(assert (=> b!912060 m!847291))

(declare-fun m!847293 () Bool)

(assert (=> mapNonEmpty!30226 m!847293))

(check-sat b_and!27167 (not b!912060) (not b!912063) (not b!912065) (not mapNonEmpty!30226) (not b_next!16585) (not start!78226) tp_is_empty!19003)
(check-sat b_and!27167 (not b_next!16585))
