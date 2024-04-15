; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78086 () Bool)

(assert start!78086)

(declare-fun b_free!16615 () Bool)

(declare-fun b_next!16615 () Bool)

(assert (=> start!78086 (= b_free!16615 (not b_next!16615))))

(declare-fun tp!58119 () Bool)

(declare-fun b_and!27163 () Bool)

(assert (=> start!78086 (= tp!58119 b_and!27163)))

(declare-fun b!911360 () Bool)

(declare-fun e!511123 () Bool)

(declare-fun tp_is_empty!19033 () Bool)

(assert (=> b!911360 (= e!511123 tp_is_empty!19033)))

(declare-fun b!911361 () Bool)

(declare-fun res!614905 () Bool)

(declare-fun e!511120 () Bool)

(assert (=> b!911361 (=> (not res!614905) (not e!511120))))

(declare-datatypes ((array!54069 0))(
  ( (array!54070 (arr!25990 (Array (_ BitVec 32) (_ BitVec 64))) (size!26451 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54069)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54069 (_ BitVec 32)) Bool)

(assert (=> b!911361 (= res!614905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911362 () Bool)

(declare-fun e!511124 () Bool)

(assert (=> b!911362 (= e!511124 tp_is_empty!19033)))

(declare-fun b!911363 () Bool)

(declare-fun res!614908 () Bool)

(assert (=> b!911363 (=> (not res!614908) (not e!511120))))

(declare-datatypes ((List!18288 0))(
  ( (Nil!18285) (Cons!18284 (h!19430 (_ BitVec 64)) (t!25866 List!18288)) )
))
(declare-fun arrayNoDuplicates!0 (array!54069 (_ BitVec 32) List!18288) Bool)

(assert (=> b!911363 (= res!614908 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18285))))

(declare-fun mapNonEmpty!30274 () Bool)

(declare-fun mapRes!30274 () Bool)

(declare-fun tp!58120 () Bool)

(assert (=> mapNonEmpty!30274 (= mapRes!30274 (and tp!58120 e!511123))))

(declare-datatypes ((V!30343 0))(
  ( (V!30344 (val!9567 Int)) )
))
(declare-datatypes ((ValueCell!9035 0))(
  ( (ValueCellFull!9035 (v!12076 V!30343)) (EmptyCell!9035) )
))
(declare-datatypes ((array!54071 0))(
  ( (array!54072 (arr!25991 (Array (_ BitVec 32) ValueCell!9035)) (size!26452 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54071)

(declare-fun mapValue!30274 () ValueCell!9035)

(declare-fun mapKey!30274 () (_ BitVec 32))

(declare-fun mapRest!30274 () (Array (_ BitVec 32) ValueCell!9035))

(assert (=> mapNonEmpty!30274 (= (arr!25991 _values!1152) (store mapRest!30274 mapKey!30274 mapValue!30274))))

(declare-fun b!911364 () Bool)

(assert (=> b!911364 (= e!511120 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30343)

(declare-fun lt!410247 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30343)

(declare-datatypes ((tuple2!12506 0))(
  ( (tuple2!12507 (_1!6264 (_ BitVec 64)) (_2!6264 V!30343)) )
))
(declare-datatypes ((List!18289 0))(
  ( (Nil!18286) (Cons!18285 (h!19431 tuple2!12506) (t!25867 List!18289)) )
))
(declare-datatypes ((ListLongMap!11193 0))(
  ( (ListLongMap!11194 (toList!5612 List!18289)) )
))
(declare-fun contains!4614 (ListLongMap!11193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2814 (array!54069 array!54071 (_ BitVec 32) (_ BitVec 32) V!30343 V!30343 (_ BitVec 32) Int) ListLongMap!11193)

(assert (=> b!911364 (= lt!410247 (contains!4614 (getCurrentListMap!2814 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!614907 () Bool)

(assert (=> start!78086 (=> (not res!614907) (not e!511120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78086 (= res!614907 (validMask!0 mask!1756))))

(assert (=> start!78086 e!511120))

(declare-fun e!511121 () Bool)

(declare-fun array_inv!20380 (array!54071) Bool)

(assert (=> start!78086 (and (array_inv!20380 _values!1152) e!511121)))

(assert (=> start!78086 tp!58119))

(assert (=> start!78086 true))

(assert (=> start!78086 tp_is_empty!19033))

(declare-fun array_inv!20381 (array!54069) Bool)

(assert (=> start!78086 (array_inv!20381 _keys!1386)))

(declare-fun mapIsEmpty!30274 () Bool)

(assert (=> mapIsEmpty!30274 mapRes!30274))

(declare-fun b!911365 () Bool)

(assert (=> b!911365 (= e!511121 (and e!511124 mapRes!30274))))

(declare-fun condMapEmpty!30274 () Bool)

(declare-fun mapDefault!30274 () ValueCell!9035)

(assert (=> b!911365 (= condMapEmpty!30274 (= (arr!25991 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9035)) mapDefault!30274)))))

(declare-fun b!911366 () Bool)

(declare-fun res!614906 () Bool)

(assert (=> b!911366 (=> (not res!614906) (not e!511120))))

(assert (=> b!911366 (= res!614906 (and (= (size!26452 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26451 _keys!1386) (size!26452 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!78086 res!614907) b!911366))

(assert (= (and b!911366 res!614906) b!911361))

(assert (= (and b!911361 res!614905) b!911363))

(assert (= (and b!911363 res!614908) b!911364))

(assert (= (and b!911365 condMapEmpty!30274) mapIsEmpty!30274))

(assert (= (and b!911365 (not condMapEmpty!30274)) mapNonEmpty!30274))

(get-info :version)

(assert (= (and mapNonEmpty!30274 ((_ is ValueCellFull!9035) mapValue!30274)) b!911360))

(assert (= (and b!911365 ((_ is ValueCellFull!9035) mapDefault!30274)) b!911362))

(assert (= start!78086 b!911365))

(declare-fun m!845553 () Bool)

(assert (=> start!78086 m!845553))

(declare-fun m!845555 () Bool)

(assert (=> start!78086 m!845555))

(declare-fun m!845557 () Bool)

(assert (=> start!78086 m!845557))

(declare-fun m!845559 () Bool)

(assert (=> b!911363 m!845559))

(declare-fun m!845561 () Bool)

(assert (=> mapNonEmpty!30274 m!845561))

(declare-fun m!845563 () Bool)

(assert (=> b!911361 m!845563))

(declare-fun m!845565 () Bool)

(assert (=> b!911364 m!845565))

(assert (=> b!911364 m!845565))

(declare-fun m!845567 () Bool)

(assert (=> b!911364 m!845567))

(check-sat tp_is_empty!19033 (not start!78086) (not mapNonEmpty!30274) (not b!911361) b_and!27163 (not b_next!16615) (not b!911364) (not b!911363))
(check-sat b_and!27163 (not b_next!16615))
