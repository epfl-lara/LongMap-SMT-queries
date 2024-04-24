; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78320 () Bool)

(assert start!78320)

(declare-fun b_free!16663 () Bool)

(declare-fun b_next!16663 () Bool)

(assert (=> start!78320 (= b_free!16663 (not b_next!16663))))

(declare-fun tp!58263 () Bool)

(declare-fun b_and!27247 () Bool)

(assert (=> start!78320 (= tp!58263 b_and!27247)))

(declare-fun b!913006 () Bool)

(declare-fun e!512210 () Bool)

(assert (=> b!913006 (= e!512210 false)))

(declare-datatypes ((V!30407 0))(
  ( (V!30408 (val!9591 Int)) )
))
(declare-datatypes ((ValueCell!9059 0))(
  ( (ValueCellFull!9059 (v!12098 V!30407)) (EmptyCell!9059) )
))
(declare-datatypes ((array!54215 0))(
  ( (array!54216 (arr!26058 (Array (_ BitVec 32) ValueCell!9059)) (size!26518 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54215)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54217 0))(
  ( (array!54218 (arr!26059 (Array (_ BitVec 32) (_ BitVec 64))) (size!26519 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54217)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30407)

(declare-fun lt!410916 () Bool)

(declare-fun zeroValue!1094 () V!30407)

(declare-datatypes ((tuple2!12458 0))(
  ( (tuple2!12459 (_1!6240 (_ BitVec 64)) (_2!6240 V!30407)) )
))
(declare-datatypes ((List!18277 0))(
  ( (Nil!18274) (Cons!18273 (h!19425 tuple2!12458) (t!25856 List!18277)) )
))
(declare-datatypes ((ListLongMap!11157 0))(
  ( (ListLongMap!11158 (toList!5594 List!18277)) )
))
(declare-fun contains!4648 (ListLongMap!11157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2855 (array!54217 array!54215 (_ BitVec 32) (_ BitVec 32) V!30407 V!30407 (_ BitVec 32) Int) ListLongMap!11157)

(assert (=> b!913006 (= lt!410916 (contains!4648 (getCurrentListMap!2855 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!615649 () Bool)

(assert (=> start!78320 (=> (not res!615649) (not e!512210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78320 (= res!615649 (validMask!0 mask!1756))))

(assert (=> start!78320 e!512210))

(declare-fun e!512213 () Bool)

(declare-fun array_inv!20448 (array!54215) Bool)

(assert (=> start!78320 (and (array_inv!20448 _values!1152) e!512213)))

(assert (=> start!78320 tp!58263))

(assert (=> start!78320 true))

(declare-fun tp_is_empty!19081 () Bool)

(assert (=> start!78320 tp_is_empty!19081))

(declare-fun array_inv!20449 (array!54217) Bool)

(assert (=> start!78320 (array_inv!20449 _keys!1386)))

(declare-fun b!913007 () Bool)

(declare-fun res!615648 () Bool)

(assert (=> b!913007 (=> (not res!615648) (not e!512210))))

(declare-datatypes ((List!18278 0))(
  ( (Nil!18275) (Cons!18274 (h!19426 (_ BitVec 64)) (t!25857 List!18278)) )
))
(declare-fun arrayNoDuplicates!0 (array!54217 (_ BitVec 32) List!18278) Bool)

(assert (=> b!913007 (= res!615648 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18275))))

(declare-fun b!913008 () Bool)

(declare-fun e!512211 () Bool)

(declare-fun mapRes!30346 () Bool)

(assert (=> b!913008 (= e!512213 (and e!512211 mapRes!30346))))

(declare-fun condMapEmpty!30346 () Bool)

(declare-fun mapDefault!30346 () ValueCell!9059)

(assert (=> b!913008 (= condMapEmpty!30346 (= (arr!26058 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9059)) mapDefault!30346)))))

(declare-fun mapNonEmpty!30346 () Bool)

(declare-fun tp!58264 () Bool)

(declare-fun e!512214 () Bool)

(assert (=> mapNonEmpty!30346 (= mapRes!30346 (and tp!58264 e!512214))))

(declare-fun mapValue!30346 () ValueCell!9059)

(declare-fun mapKey!30346 () (_ BitVec 32))

(declare-fun mapRest!30346 () (Array (_ BitVec 32) ValueCell!9059))

(assert (=> mapNonEmpty!30346 (= (arr!26058 _values!1152) (store mapRest!30346 mapKey!30346 mapValue!30346))))

(declare-fun b!913009 () Bool)

(assert (=> b!913009 (= e!512211 tp_is_empty!19081)))

(declare-fun mapIsEmpty!30346 () Bool)

(assert (=> mapIsEmpty!30346 mapRes!30346))

(declare-fun b!913010 () Bool)

(declare-fun res!615647 () Bool)

(assert (=> b!913010 (=> (not res!615647) (not e!512210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54217 (_ BitVec 32)) Bool)

(assert (=> b!913010 (= res!615647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913011 () Bool)

(assert (=> b!913011 (= e!512214 tp_is_empty!19081)))

(declare-fun b!913012 () Bool)

(declare-fun res!615650 () Bool)

(assert (=> b!913012 (=> (not res!615650) (not e!512210))))

(assert (=> b!913012 (= res!615650 (and (= (size!26518 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26519 _keys!1386) (size!26518 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!78320 res!615649) b!913012))

(assert (= (and b!913012 res!615650) b!913010))

(assert (= (and b!913010 res!615647) b!913007))

(assert (= (and b!913007 res!615648) b!913006))

(assert (= (and b!913008 condMapEmpty!30346) mapIsEmpty!30346))

(assert (= (and b!913008 (not condMapEmpty!30346)) mapNonEmpty!30346))

(get-info :version)

(assert (= (and mapNonEmpty!30346 ((_ is ValueCellFull!9059) mapValue!30346)) b!913011))

(assert (= (and b!913008 ((_ is ValueCellFull!9059) mapDefault!30346)) b!913009))

(assert (= start!78320 b!913008))

(declare-fun m!847989 () Bool)

(assert (=> start!78320 m!847989))

(declare-fun m!847991 () Bool)

(assert (=> start!78320 m!847991))

(declare-fun m!847993 () Bool)

(assert (=> start!78320 m!847993))

(declare-fun m!847995 () Bool)

(assert (=> b!913010 m!847995))

(declare-fun m!847997 () Bool)

(assert (=> mapNonEmpty!30346 m!847997))

(declare-fun m!847999 () Bool)

(assert (=> b!913007 m!847999))

(declare-fun m!848001 () Bool)

(assert (=> b!913006 m!848001))

(assert (=> b!913006 m!848001))

(declare-fun m!848003 () Bool)

(assert (=> b!913006 m!848003))

(check-sat (not b_next!16663) b_and!27247 (not b!913010) tp_is_empty!19081 (not mapNonEmpty!30346) (not start!78320) (not b!913007) (not b!913006))
(check-sat b_and!27247 (not b_next!16663))
