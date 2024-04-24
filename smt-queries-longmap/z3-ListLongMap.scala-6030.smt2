; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78232 () Bool)

(assert start!78232)

(declare-fun b_free!16591 () Bool)

(declare-fun b_next!16591 () Bool)

(assert (=> start!78232 (= b_free!16591 (not b_next!16591))))

(declare-fun tp!58045 () Bool)

(declare-fun b_and!27173 () Bool)

(assert (=> start!78232 (= tp!58045 b_and!27173)))

(declare-fun mapIsEmpty!30235 () Bool)

(declare-fun mapRes!30235 () Bool)

(assert (=> mapIsEmpty!30235 mapRes!30235))

(declare-fun mapNonEmpty!30235 () Bool)

(declare-fun tp!58044 () Bool)

(declare-fun e!511600 () Bool)

(assert (=> mapNonEmpty!30235 (= mapRes!30235 (and tp!58044 e!511600))))

(declare-datatypes ((V!30311 0))(
  ( (V!30312 (val!9555 Int)) )
))
(declare-datatypes ((ValueCell!9023 0))(
  ( (ValueCellFull!9023 (v!12061 V!30311)) (EmptyCell!9023) )
))
(declare-datatypes ((array!54083 0))(
  ( (array!54084 (arr!25993 (Array (_ BitVec 32) ValueCell!9023)) (size!26453 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54083)

(declare-fun mapValue!30235 () ValueCell!9023)

(declare-fun mapKey!30235 () (_ BitVec 32))

(declare-fun mapRest!30235 () (Array (_ BitVec 32) ValueCell!9023))

(assert (=> mapNonEmpty!30235 (= (arr!25993 _values!1152) (store mapRest!30235 mapKey!30235 mapValue!30235))))

(declare-fun res!615155 () Bool)

(declare-fun e!511599 () Bool)

(assert (=> start!78232 (=> (not res!615155) (not e!511599))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78232 (= res!615155 (validMask!0 mask!1756))))

(assert (=> start!78232 e!511599))

(declare-fun e!511601 () Bool)

(declare-fun array_inv!20398 (array!54083) Bool)

(assert (=> start!78232 (and (array_inv!20398 _values!1152) e!511601)))

(assert (=> start!78232 tp!58045))

(assert (=> start!78232 true))

(declare-fun tp_is_empty!19009 () Bool)

(assert (=> start!78232 tp_is_empty!19009))

(declare-datatypes ((array!54085 0))(
  ( (array!54086 (arr!25994 (Array (_ BitVec 32) (_ BitVec 64))) (size!26454 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54085)

(declare-fun array_inv!20399 (array!54085) Bool)

(assert (=> start!78232 (array_inv!20399 _keys!1386)))

(declare-fun b!912123 () Bool)

(declare-fun e!511598 () Bool)

(assert (=> b!912123 (= e!511601 (and e!511598 mapRes!30235))))

(declare-fun condMapEmpty!30235 () Bool)

(declare-fun mapDefault!30235 () ValueCell!9023)

(assert (=> b!912123 (= condMapEmpty!30235 (= (arr!25993 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9023)) mapDefault!30235)))))

(declare-fun b!912124 () Bool)

(assert (=> b!912124 (= e!511599 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30311)

(declare-fun lt!410730 () Bool)

(declare-fun zeroValue!1094 () V!30311)

(declare-datatypes ((tuple2!12412 0))(
  ( (tuple2!12413 (_1!6217 (_ BitVec 64)) (_2!6217 V!30311)) )
))
(declare-datatypes ((List!18232 0))(
  ( (Nil!18229) (Cons!18228 (h!19380 tuple2!12412) (t!25809 List!18232)) )
))
(declare-datatypes ((ListLongMap!11111 0))(
  ( (ListLongMap!11112 (toList!5571 List!18232)) )
))
(declare-fun contains!4624 (ListLongMap!11111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2832 (array!54085 array!54083 (_ BitVec 32) (_ BitVec 32) V!30311 V!30311 (_ BitVec 32) Int) ListLongMap!11111)

(assert (=> b!912124 (= lt!410730 (contains!4624 (getCurrentListMap!2832 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912125 () Bool)

(declare-fun res!615153 () Bool)

(assert (=> b!912125 (=> (not res!615153) (not e!511599))))

(assert (=> b!912125 (= res!615153 (and (= (size!26453 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26454 _keys!1386) (size!26453 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912126 () Bool)

(assert (=> b!912126 (= e!511598 tp_is_empty!19009)))

(declare-fun b!912127 () Bool)

(assert (=> b!912127 (= e!511600 tp_is_empty!19009)))

(declare-fun b!912128 () Bool)

(declare-fun res!615154 () Bool)

(assert (=> b!912128 (=> (not res!615154) (not e!511599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54085 (_ BitVec 32)) Bool)

(assert (=> b!912128 (= res!615154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912129 () Bool)

(declare-fun res!615152 () Bool)

(assert (=> b!912129 (=> (not res!615152) (not e!511599))))

(declare-datatypes ((List!18233 0))(
  ( (Nil!18230) (Cons!18229 (h!19381 (_ BitVec 64)) (t!25810 List!18233)) )
))
(declare-fun arrayNoDuplicates!0 (array!54085 (_ BitVec 32) List!18233) Bool)

(assert (=> b!912129 (= res!615152 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18230))))

(assert (= (and start!78232 res!615155) b!912125))

(assert (= (and b!912125 res!615153) b!912128))

(assert (= (and b!912128 res!615154) b!912129))

(assert (= (and b!912129 res!615152) b!912124))

(assert (= (and b!912123 condMapEmpty!30235) mapIsEmpty!30235))

(assert (= (and b!912123 (not condMapEmpty!30235)) mapNonEmpty!30235))

(get-info :version)

(assert (= (and mapNonEmpty!30235 ((_ is ValueCellFull!9023) mapValue!30235)) b!912127))

(assert (= (and b!912123 ((_ is ValueCellFull!9023) mapDefault!30235)) b!912126))

(assert (= start!78232 b!912123))

(declare-fun m!847327 () Bool)

(assert (=> b!912128 m!847327))

(declare-fun m!847329 () Bool)

(assert (=> b!912129 m!847329))

(declare-fun m!847331 () Bool)

(assert (=> b!912124 m!847331))

(assert (=> b!912124 m!847331))

(declare-fun m!847333 () Bool)

(assert (=> b!912124 m!847333))

(declare-fun m!847335 () Bool)

(assert (=> start!78232 m!847335))

(declare-fun m!847337 () Bool)

(assert (=> start!78232 m!847337))

(declare-fun m!847339 () Bool)

(assert (=> start!78232 m!847339))

(declare-fun m!847341 () Bool)

(assert (=> mapNonEmpty!30235 m!847341))

(check-sat (not b_next!16591) (not b!912128) (not b!912124) tp_is_empty!19009 b_and!27173 (not start!78232) (not mapNonEmpty!30235) (not b!912129))
(check-sat b_and!27173 (not b_next!16591))
