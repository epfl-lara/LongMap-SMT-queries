; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78352 () Bool)

(assert start!78352)

(declare-fun b_free!16675 () Bool)

(declare-fun b_next!16675 () Bool)

(assert (=> start!78352 (= b_free!16675 (not b_next!16675))))

(declare-fun tp!58303 () Bool)

(declare-fun b_and!27261 () Bool)

(assert (=> start!78352 (= tp!58303 b_and!27261)))

(declare-fun b!913286 () Bool)

(declare-fun res!615803 () Bool)

(declare-fun e!512383 () Bool)

(assert (=> b!913286 (=> (not res!615803) (not e!512383))))

(declare-datatypes ((V!30423 0))(
  ( (V!30424 (val!9597 Int)) )
))
(declare-datatypes ((ValueCell!9065 0))(
  ( (ValueCellFull!9065 (v!12105 V!30423)) (EmptyCell!9065) )
))
(declare-datatypes ((array!54237 0))(
  ( (array!54238 (arr!26068 (Array (_ BitVec 32) ValueCell!9065)) (size!26528 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54237)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30423)

(declare-datatypes ((array!54239 0))(
  ( (array!54240 (arr!26069 (Array (_ BitVec 32) (_ BitVec 64))) (size!26529 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54239)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30423)

(declare-datatypes ((tuple2!12462 0))(
  ( (tuple2!12463 (_1!6242 (_ BitVec 64)) (_2!6242 V!30423)) )
))
(declare-datatypes ((List!18282 0))(
  ( (Nil!18279) (Cons!18278 (h!19430 tuple2!12462) (t!25863 List!18282)) )
))
(declare-datatypes ((ListLongMap!11161 0))(
  ( (ListLongMap!11162 (toList!5596 List!18282)) )
))
(declare-fun contains!4651 (ListLongMap!11161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2857 (array!54239 array!54237 (_ BitVec 32) (_ BitVec 32) V!30423 V!30423 (_ BitVec 32) Int) ListLongMap!11161)

(assert (=> b!913286 (= res!615803 (contains!4651 (getCurrentListMap!2857 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913287 () Bool)

(declare-fun e!512385 () Bool)

(declare-fun tp_is_empty!19093 () Bool)

(assert (=> b!913287 (= e!512385 tp_is_empty!19093)))

(declare-fun res!615808 () Bool)

(assert (=> start!78352 (=> (not res!615808) (not e!512383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78352 (= res!615808 (validMask!0 mask!1756))))

(assert (=> start!78352 e!512383))

(declare-fun e!512384 () Bool)

(declare-fun array_inv!20454 (array!54237) Bool)

(assert (=> start!78352 (and (array_inv!20454 _values!1152) e!512384)))

(assert (=> start!78352 tp!58303))

(assert (=> start!78352 true))

(assert (=> start!78352 tp_is_empty!19093))

(declare-fun array_inv!20455 (array!54239) Bool)

(assert (=> start!78352 (array_inv!20455 _keys!1386)))

(declare-fun b!913288 () Bool)

(declare-fun res!615806 () Bool)

(assert (=> b!913288 (=> (not res!615806) (not e!512383))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!913288 (= res!615806 (and (= (select (arr!26069 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913289 () Bool)

(assert (=> b!913289 (= e!512383 (not true))))

(declare-fun arrayContainsKey!0 (array!54239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913289 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30864 0))(
  ( (Unit!30865) )
))
(declare-fun lt!411024 () Unit!30864)

(declare-fun lemmaKeyInListMapIsInArray!263 (array!54239 array!54237 (_ BitVec 32) (_ BitVec 32) V!30423 V!30423 (_ BitVec 64) Int) Unit!30864)

(assert (=> b!913289 (= lt!411024 (lemmaKeyInListMapIsInArray!263 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!913290 () Bool)

(declare-fun res!615804 () Bool)

(assert (=> b!913290 (=> (not res!615804) (not e!512383))))

(assert (=> b!913290 (= res!615804 (and (= (size!26528 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26529 _keys!1386) (size!26528 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30367 () Bool)

(declare-fun mapRes!30367 () Bool)

(declare-fun tp!58302 () Bool)

(declare-fun e!512381 () Bool)

(assert (=> mapNonEmpty!30367 (= mapRes!30367 (and tp!58302 e!512381))))

(declare-fun mapValue!30367 () ValueCell!9065)

(declare-fun mapRest!30367 () (Array (_ BitVec 32) ValueCell!9065))

(declare-fun mapKey!30367 () (_ BitVec 32))

(assert (=> mapNonEmpty!30367 (= (arr!26068 _values!1152) (store mapRest!30367 mapKey!30367 mapValue!30367))))

(declare-fun b!913291 () Bool)

(declare-fun res!615807 () Bool)

(assert (=> b!913291 (=> (not res!615807) (not e!512383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54239 (_ BitVec 32)) Bool)

(assert (=> b!913291 (= res!615807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913292 () Bool)

(assert (=> b!913292 (= e!512381 tp_is_empty!19093)))

(declare-fun b!913293 () Bool)

(assert (=> b!913293 (= e!512384 (and e!512385 mapRes!30367))))

(declare-fun condMapEmpty!30367 () Bool)

(declare-fun mapDefault!30367 () ValueCell!9065)

(assert (=> b!913293 (= condMapEmpty!30367 (= (arr!26068 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9065)) mapDefault!30367)))))

(declare-fun b!913294 () Bool)

(declare-fun res!615805 () Bool)

(assert (=> b!913294 (=> (not res!615805) (not e!512383))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913294 (= res!615805 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!30367 () Bool)

(assert (=> mapIsEmpty!30367 mapRes!30367))

(declare-fun b!913295 () Bool)

(declare-fun res!615809 () Bool)

(assert (=> b!913295 (=> (not res!615809) (not e!512383))))

(declare-datatypes ((List!18283 0))(
  ( (Nil!18280) (Cons!18279 (h!19431 (_ BitVec 64)) (t!25864 List!18283)) )
))
(declare-fun arrayNoDuplicates!0 (array!54239 (_ BitVec 32) List!18283) Bool)

(assert (=> b!913295 (= res!615809 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18280))))

(assert (= (and start!78352 res!615808) b!913290))

(assert (= (and b!913290 res!615804) b!913291))

(assert (= (and b!913291 res!615807) b!913295))

(assert (= (and b!913295 res!615809) b!913286))

(assert (= (and b!913286 res!615803) b!913294))

(assert (= (and b!913294 res!615805) b!913288))

(assert (= (and b!913288 res!615806) b!913289))

(assert (= (and b!913293 condMapEmpty!30367) mapIsEmpty!30367))

(assert (= (and b!913293 (not condMapEmpty!30367)) mapNonEmpty!30367))

(get-info :version)

(assert (= (and mapNonEmpty!30367 ((_ is ValueCellFull!9065) mapValue!30367)) b!913292))

(assert (= (and b!913293 ((_ is ValueCellFull!9065) mapDefault!30367)) b!913287))

(assert (= start!78352 b!913293))

(declare-fun m!848193 () Bool)

(assert (=> b!913294 m!848193))

(declare-fun m!848195 () Bool)

(assert (=> b!913286 m!848195))

(assert (=> b!913286 m!848195))

(declare-fun m!848197 () Bool)

(assert (=> b!913286 m!848197))

(declare-fun m!848199 () Bool)

(assert (=> start!78352 m!848199))

(declare-fun m!848201 () Bool)

(assert (=> start!78352 m!848201))

(declare-fun m!848203 () Bool)

(assert (=> start!78352 m!848203))

(declare-fun m!848205 () Bool)

(assert (=> b!913295 m!848205))

(declare-fun m!848207 () Bool)

(assert (=> b!913289 m!848207))

(declare-fun m!848209 () Bool)

(assert (=> b!913289 m!848209))

(declare-fun m!848211 () Bool)

(assert (=> b!913291 m!848211))

(declare-fun m!848213 () Bool)

(assert (=> mapNonEmpty!30367 m!848213))

(declare-fun m!848215 () Bool)

(assert (=> b!913288 m!848215))

(check-sat (not b!913289) tp_is_empty!19093 (not mapNonEmpty!30367) (not b_next!16675) (not start!78352) (not b!913295) (not b!913294) b_and!27261 (not b!913291) (not b!913286))
(check-sat b_and!27261 (not b_next!16675))
