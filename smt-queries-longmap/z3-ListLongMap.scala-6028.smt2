; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78220 () Bool)

(assert start!78220)

(declare-fun b_free!16579 () Bool)

(declare-fun b_next!16579 () Bool)

(assert (=> start!78220 (= b_free!16579 (not b_next!16579))))

(declare-fun tp!58009 () Bool)

(declare-fun b_and!27161 () Bool)

(assert (=> start!78220 (= tp!58009 b_and!27161)))

(declare-fun b!911997 () Bool)

(declare-fun e!511509 () Bool)

(declare-fun tp_is_empty!18997 () Bool)

(assert (=> b!911997 (= e!511509 tp_is_empty!18997)))

(declare-fun mapIsEmpty!30217 () Bool)

(declare-fun mapRes!30217 () Bool)

(assert (=> mapIsEmpty!30217 mapRes!30217))

(declare-fun b!911998 () Bool)

(declare-fun res!615081 () Bool)

(declare-fun e!511511 () Bool)

(assert (=> b!911998 (=> (not res!615081) (not e!511511))))

(declare-datatypes ((array!54061 0))(
  ( (array!54062 (arr!25982 (Array (_ BitVec 32) (_ BitVec 64))) (size!26442 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54061)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54061 (_ BitVec 32)) Bool)

(assert (=> b!911998 (= res!615081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911999 () Bool)

(declare-fun e!511508 () Bool)

(assert (=> b!911999 (= e!511508 tp_is_empty!18997)))

(declare-fun res!615082 () Bool)

(assert (=> start!78220 (=> (not res!615082) (not e!511511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78220 (= res!615082 (validMask!0 mask!1756))))

(assert (=> start!78220 e!511511))

(declare-datatypes ((V!30295 0))(
  ( (V!30296 (val!9549 Int)) )
))
(declare-datatypes ((ValueCell!9017 0))(
  ( (ValueCellFull!9017 (v!12055 V!30295)) (EmptyCell!9017) )
))
(declare-datatypes ((array!54063 0))(
  ( (array!54064 (arr!25983 (Array (_ BitVec 32) ValueCell!9017)) (size!26443 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54063)

(declare-fun e!511512 () Bool)

(declare-fun array_inv!20388 (array!54063) Bool)

(assert (=> start!78220 (and (array_inv!20388 _values!1152) e!511512)))

(assert (=> start!78220 tp!58009))

(assert (=> start!78220 true))

(assert (=> start!78220 tp_is_empty!18997))

(declare-fun array_inv!20389 (array!54061) Bool)

(assert (=> start!78220 (array_inv!20389 _keys!1386)))

(declare-fun b!912000 () Bool)

(declare-fun res!615080 () Bool)

(assert (=> b!912000 (=> (not res!615080) (not e!511511))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!912000 (= res!615080 (and (= (size!26443 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26442 _keys!1386) (size!26443 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30217 () Bool)

(declare-fun tp!58008 () Bool)

(assert (=> mapNonEmpty!30217 (= mapRes!30217 (and tp!58008 e!511509))))

(declare-fun mapValue!30217 () ValueCell!9017)

(declare-fun mapKey!30217 () (_ BitVec 32))

(declare-fun mapRest!30217 () (Array (_ BitVec 32) ValueCell!9017))

(assert (=> mapNonEmpty!30217 (= (arr!25983 _values!1152) (store mapRest!30217 mapKey!30217 mapValue!30217))))

(declare-fun b!912001 () Bool)

(assert (=> b!912001 (= e!511512 (and e!511508 mapRes!30217))))

(declare-fun condMapEmpty!30217 () Bool)

(declare-fun mapDefault!30217 () ValueCell!9017)

(assert (=> b!912001 (= condMapEmpty!30217 (= (arr!25983 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9017)) mapDefault!30217)))))

(declare-fun b!912002 () Bool)

(declare-fun res!615083 () Bool)

(assert (=> b!912002 (=> (not res!615083) (not e!511511))))

(declare-datatypes ((List!18225 0))(
  ( (Nil!18222) (Cons!18221 (h!19373 (_ BitVec 64)) (t!25802 List!18225)) )
))
(declare-fun arrayNoDuplicates!0 (array!54061 (_ BitVec 32) List!18225) Bool)

(assert (=> b!912002 (= res!615083 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18222))))

(declare-fun b!912003 () Bool)

(assert (=> b!912003 (= e!511511 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30295)

(declare-fun lt!410712 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30295)

(declare-datatypes ((tuple2!12404 0))(
  ( (tuple2!12405 (_1!6213 (_ BitVec 64)) (_2!6213 V!30295)) )
))
(declare-datatypes ((List!18226 0))(
  ( (Nil!18223) (Cons!18222 (h!19374 tuple2!12404) (t!25803 List!18226)) )
))
(declare-datatypes ((ListLongMap!11103 0))(
  ( (ListLongMap!11104 (toList!5567 List!18226)) )
))
(declare-fun contains!4620 (ListLongMap!11103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2828 (array!54061 array!54063 (_ BitVec 32) (_ BitVec 32) V!30295 V!30295 (_ BitVec 32) Int) ListLongMap!11103)

(assert (=> b!912003 (= lt!410712 (contains!4620 (getCurrentListMap!2828 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!78220 res!615082) b!912000))

(assert (= (and b!912000 res!615080) b!911998))

(assert (= (and b!911998 res!615081) b!912002))

(assert (= (and b!912002 res!615083) b!912003))

(assert (= (and b!912001 condMapEmpty!30217) mapIsEmpty!30217))

(assert (= (and b!912001 (not condMapEmpty!30217)) mapNonEmpty!30217))

(get-info :version)

(assert (= (and mapNonEmpty!30217 ((_ is ValueCellFull!9017) mapValue!30217)) b!911997))

(assert (= (and b!912001 ((_ is ValueCellFull!9017) mapDefault!30217)) b!911999))

(assert (= start!78220 b!912001))

(declare-fun m!847231 () Bool)

(assert (=> b!912002 m!847231))

(declare-fun m!847233 () Bool)

(assert (=> mapNonEmpty!30217 m!847233))

(declare-fun m!847235 () Bool)

(assert (=> b!912003 m!847235))

(assert (=> b!912003 m!847235))

(declare-fun m!847237 () Bool)

(assert (=> b!912003 m!847237))

(declare-fun m!847239 () Bool)

(assert (=> start!78220 m!847239))

(declare-fun m!847241 () Bool)

(assert (=> start!78220 m!847241))

(declare-fun m!847243 () Bool)

(assert (=> start!78220 m!847243))

(declare-fun m!847245 () Bool)

(assert (=> b!911998 m!847245))

(check-sat (not b!912003) (not b!912002) b_and!27161 (not b!911998) (not b_next!16579) (not start!78220) tp_is_empty!18997 (not mapNonEmpty!30217))
(check-sat b_and!27161 (not b_next!16579))
