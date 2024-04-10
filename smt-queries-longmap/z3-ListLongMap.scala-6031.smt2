; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78072 () Bool)

(assert start!78072)

(declare-fun b_free!16599 () Bool)

(declare-fun b_next!16599 () Bool)

(assert (=> start!78072 (= b_free!16599 (not b_next!16599))))

(declare-fun tp!58067 () Bool)

(declare-fun b_and!27171 () Bool)

(assert (=> start!78072 (= tp!58067 b_and!27171)))

(declare-fun b!911304 () Bool)

(declare-fun res!614858 () Bool)

(declare-fun e!511078 () Bool)

(assert (=> b!911304 (=> (not res!614858) (not e!511078))))

(declare-datatypes ((array!54034 0))(
  ( (array!54035 (arr!25973 (Array (_ BitVec 32) (_ BitVec 64))) (size!26432 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54034)

(declare-datatypes ((List!18243 0))(
  ( (Nil!18240) (Cons!18239 (h!19385 (_ BitVec 64)) (t!25828 List!18243)) )
))
(declare-fun arrayNoDuplicates!0 (array!54034 (_ BitVec 32) List!18243) Bool)

(assert (=> b!911304 (= res!614858 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18240))))

(declare-fun b!911305 () Bool)

(declare-fun e!511080 () Bool)

(declare-fun tp_is_empty!19017 () Bool)

(assert (=> b!911305 (= e!511080 tp_is_empty!19017)))

(declare-fun b!911306 () Bool)

(declare-fun e!511079 () Bool)

(assert (=> b!911306 (= e!511079 tp_is_empty!19017)))

(declare-fun mapNonEmpty!30247 () Bool)

(declare-fun mapRes!30247 () Bool)

(declare-fun tp!58068 () Bool)

(assert (=> mapNonEmpty!30247 (= mapRes!30247 (and tp!58068 e!511079))))

(declare-datatypes ((V!30321 0))(
  ( (V!30322 (val!9559 Int)) )
))
(declare-datatypes ((ValueCell!9027 0))(
  ( (ValueCellFull!9027 (v!12068 V!30321)) (EmptyCell!9027) )
))
(declare-fun mapValue!30247 () ValueCell!9027)

(declare-fun mapKey!30247 () (_ BitVec 32))

(declare-fun mapRest!30247 () (Array (_ BitVec 32) ValueCell!9027))

(declare-datatypes ((array!54036 0))(
  ( (array!54037 (arr!25974 (Array (_ BitVec 32) ValueCell!9027)) (size!26433 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54036)

(assert (=> mapNonEmpty!30247 (= (arr!25974 _values!1152) (store mapRest!30247 mapKey!30247 mapValue!30247))))

(declare-fun res!614859 () Bool)

(assert (=> start!78072 (=> (not res!614859) (not e!511078))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78072 (= res!614859 (validMask!0 mask!1756))))

(assert (=> start!78072 e!511078))

(declare-fun e!511077 () Bool)

(declare-fun array_inv!20304 (array!54036) Bool)

(assert (=> start!78072 (and (array_inv!20304 _values!1152) e!511077)))

(assert (=> start!78072 tp!58067))

(assert (=> start!78072 true))

(assert (=> start!78072 tp_is_empty!19017))

(declare-fun array_inv!20305 (array!54034) Bool)

(assert (=> start!78072 (array_inv!20305 _keys!1386)))

(declare-fun mapIsEmpty!30247 () Bool)

(assert (=> mapIsEmpty!30247 mapRes!30247))

(declare-fun b!911307 () Bool)

(assert (=> b!911307 (= e!511078 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30321)

(declare-fun lt!410381 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30321)

(declare-datatypes ((tuple2!12452 0))(
  ( (tuple2!12453 (_1!6237 (_ BitVec 64)) (_2!6237 V!30321)) )
))
(declare-datatypes ((List!18244 0))(
  ( (Nil!18241) (Cons!18240 (h!19386 tuple2!12452) (t!25829 List!18244)) )
))
(declare-datatypes ((ListLongMap!11149 0))(
  ( (ListLongMap!11150 (toList!5590 List!18244)) )
))
(declare-fun contains!4634 (ListLongMap!11149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2852 (array!54034 array!54036 (_ BitVec 32) (_ BitVec 32) V!30321 V!30321 (_ BitVec 32) Int) ListLongMap!11149)

(assert (=> b!911307 (= lt!410381 (contains!4634 (getCurrentListMap!2852 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911308 () Bool)

(declare-fun res!614856 () Bool)

(assert (=> b!911308 (=> (not res!614856) (not e!511078))))

(assert (=> b!911308 (= res!614856 (and (= (size!26433 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26432 _keys!1386) (size!26433 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911309 () Bool)

(declare-fun res!614857 () Bool)

(assert (=> b!911309 (=> (not res!614857) (not e!511078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54034 (_ BitVec 32)) Bool)

(assert (=> b!911309 (= res!614857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911310 () Bool)

(assert (=> b!911310 (= e!511077 (and e!511080 mapRes!30247))))

(declare-fun condMapEmpty!30247 () Bool)

(declare-fun mapDefault!30247 () ValueCell!9027)

(assert (=> b!911310 (= condMapEmpty!30247 (= (arr!25974 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9027)) mapDefault!30247)))))

(assert (= (and start!78072 res!614859) b!911308))

(assert (= (and b!911308 res!614856) b!911309))

(assert (= (and b!911309 res!614857) b!911304))

(assert (= (and b!911304 res!614858) b!911307))

(assert (= (and b!911310 condMapEmpty!30247) mapIsEmpty!30247))

(assert (= (and b!911310 (not condMapEmpty!30247)) mapNonEmpty!30247))

(get-info :version)

(assert (= (and mapNonEmpty!30247 ((_ is ValueCellFull!9027) mapValue!30247)) b!911306))

(assert (= (and b!911310 ((_ is ValueCellFull!9027) mapDefault!30247)) b!911305))

(assert (= start!78072 b!911310))

(declare-fun m!846097 () Bool)

(assert (=> start!78072 m!846097))

(declare-fun m!846099 () Bool)

(assert (=> start!78072 m!846099))

(declare-fun m!846101 () Bool)

(assert (=> start!78072 m!846101))

(declare-fun m!846103 () Bool)

(assert (=> mapNonEmpty!30247 m!846103))

(declare-fun m!846105 () Bool)

(assert (=> b!911309 m!846105))

(declare-fun m!846107 () Bool)

(assert (=> b!911304 m!846107))

(declare-fun m!846109 () Bool)

(assert (=> b!911307 m!846109))

(assert (=> b!911307 m!846109))

(declare-fun m!846111 () Bool)

(assert (=> b!911307 m!846111))

(check-sat (not b!911304) (not mapNonEmpty!30247) tp_is_empty!19017 (not b!911307) (not b!911309) (not start!78072) b_and!27171 (not b_next!16599))
(check-sat b_and!27171 (not b_next!16599))
