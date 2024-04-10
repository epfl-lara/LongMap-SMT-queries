; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78222 () Bool)

(assert start!78222)

(declare-fun b_free!16713 () Bool)

(declare-fun b_next!16713 () Bool)

(assert (=> start!78222 (= b_free!16713 (not b_next!16713))))

(declare-fun tp!58416 () Bool)

(declare-fun b_and!27289 () Bool)

(assert (=> start!78222 (= tp!58416 b_and!27289)))

(declare-fun b!912953 () Bool)

(declare-fun res!615864 () Bool)

(declare-fun e!512086 () Bool)

(assert (=> b!912953 (=> (not res!615864) (not e!512086))))

(declare-datatypes ((V!30473 0))(
  ( (V!30474 (val!9616 Int)) )
))
(declare-datatypes ((ValueCell!9084 0))(
  ( (ValueCellFull!9084 (v!12127 V!30473)) (EmptyCell!9084) )
))
(declare-datatypes ((array!54254 0))(
  ( (array!54255 (arr!26081 (Array (_ BitVec 32) ValueCell!9084)) (size!26540 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54254)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54256 0))(
  ( (array!54257 (arr!26082 (Array (_ BitVec 32) (_ BitVec 64))) (size!26541 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54256)

(assert (=> b!912953 (= res!615864 (and (= (size!26540 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26541 _keys!1386) (size!26540 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912954 () Bool)

(declare-fun e!512085 () Bool)

(declare-fun tp_is_empty!19131 () Bool)

(assert (=> b!912954 (= e!512085 tp_is_empty!19131)))

(declare-fun b!912955 () Bool)

(declare-fun res!615862 () Bool)

(assert (=> b!912955 (=> (not res!615862) (not e!512086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54256 (_ BitVec 32)) Bool)

(assert (=> b!912955 (= res!615862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!30424 () Bool)

(declare-fun mapRes!30424 () Bool)

(assert (=> mapIsEmpty!30424 mapRes!30424))

(declare-fun mapNonEmpty!30424 () Bool)

(declare-fun tp!58415 () Bool)

(declare-fun e!512084 () Bool)

(assert (=> mapNonEmpty!30424 (= mapRes!30424 (and tp!58415 e!512084))))

(declare-fun mapKey!30424 () (_ BitVec 32))

(declare-fun mapValue!30424 () ValueCell!9084)

(declare-fun mapRest!30424 () (Array (_ BitVec 32) ValueCell!9084))

(assert (=> mapNonEmpty!30424 (= (arr!26081 _values!1152) (store mapRest!30424 mapKey!30424 mapValue!30424))))

(declare-fun b!912956 () Bool)

(declare-fun res!615859 () Bool)

(assert (=> b!912956 (=> (not res!615859) (not e!512086))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912956 (= res!615859 (inRange!0 i!717 mask!1756))))

(declare-fun b!912957 () Bool)

(declare-fun e!512088 () Bool)

(assert (=> b!912957 (= e!512088 (and e!512085 mapRes!30424))))

(declare-fun condMapEmpty!30424 () Bool)

(declare-fun mapDefault!30424 () ValueCell!9084)

(assert (=> b!912957 (= condMapEmpty!30424 (= (arr!26081 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9084)) mapDefault!30424)))))

(declare-fun b!912958 () Bool)

(declare-fun res!615860 () Bool)

(assert (=> b!912958 (=> (not res!615860) (not e!512086))))

(declare-datatypes ((List!18318 0))(
  ( (Nil!18315) (Cons!18314 (h!19460 (_ BitVec 64)) (t!25907 List!18318)) )
))
(declare-fun arrayNoDuplicates!0 (array!54256 (_ BitVec 32) List!18318) Bool)

(assert (=> b!912958 (= res!615860 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18315))))

(declare-fun b!912959 () Bool)

(assert (=> b!912959 (= e!512084 tp_is_empty!19131)))

(declare-fun b!912960 () Bool)

(assert (=> b!912960 (= e!512086 (not true))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912960 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30473)

(declare-datatypes ((Unit!30902 0))(
  ( (Unit!30903) )
))
(declare-fun lt!410720 () Unit!30902)

(declare-fun minValue!1094 () V!30473)

(declare-fun lemmaKeyInListMapIsInArray!276 (array!54256 array!54254 (_ BitVec 32) (_ BitVec 32) V!30473 V!30473 (_ BitVec 64) Int) Unit!30902)

(assert (=> b!912960 (= lt!410720 (lemmaKeyInListMapIsInArray!276 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun res!615861 () Bool)

(assert (=> start!78222 (=> (not res!615861) (not e!512086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78222 (= res!615861 (validMask!0 mask!1756))))

(assert (=> start!78222 e!512086))

(declare-fun array_inv!20372 (array!54254) Bool)

(assert (=> start!78222 (and (array_inv!20372 _values!1152) e!512088)))

(assert (=> start!78222 tp!58416))

(assert (=> start!78222 true))

(assert (=> start!78222 tp_is_empty!19131))

(declare-fun array_inv!20373 (array!54256) Bool)

(assert (=> start!78222 (array_inv!20373 _keys!1386)))

(declare-fun b!912961 () Bool)

(declare-fun res!615863 () Bool)

(assert (=> b!912961 (=> (not res!615863) (not e!512086))))

(assert (=> b!912961 (= res!615863 (and (= (select (arr!26082 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912962 () Bool)

(declare-fun res!615858 () Bool)

(assert (=> b!912962 (=> (not res!615858) (not e!512086))))

(declare-datatypes ((tuple2!12530 0))(
  ( (tuple2!12531 (_1!6276 (_ BitVec 64)) (_2!6276 V!30473)) )
))
(declare-datatypes ((List!18319 0))(
  ( (Nil!18316) (Cons!18315 (h!19461 tuple2!12530) (t!25908 List!18319)) )
))
(declare-datatypes ((ListLongMap!11227 0))(
  ( (ListLongMap!11228 (toList!5629 List!18319)) )
))
(declare-fun contains!4675 (ListLongMap!11227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2891 (array!54256 array!54254 (_ BitVec 32) (_ BitVec 32) V!30473 V!30473 (_ BitVec 32) Int) ListLongMap!11227)

(assert (=> b!912962 (= res!615858 (contains!4675 (getCurrentListMap!2891 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!78222 res!615861) b!912953))

(assert (= (and b!912953 res!615864) b!912955))

(assert (= (and b!912955 res!615862) b!912958))

(assert (= (and b!912958 res!615860) b!912962))

(assert (= (and b!912962 res!615858) b!912956))

(assert (= (and b!912956 res!615859) b!912961))

(assert (= (and b!912961 res!615863) b!912960))

(assert (= (and b!912957 condMapEmpty!30424) mapIsEmpty!30424))

(assert (= (and b!912957 (not condMapEmpty!30424)) mapNonEmpty!30424))

(get-info :version)

(assert (= (and mapNonEmpty!30424 ((_ is ValueCellFull!9084) mapValue!30424)) b!912959))

(assert (= (and b!912957 ((_ is ValueCellFull!9084) mapDefault!30424)) b!912954))

(assert (= start!78222 b!912957))

(declare-fun m!847355 () Bool)

(assert (=> b!912955 m!847355))

(declare-fun m!847357 () Bool)

(assert (=> b!912962 m!847357))

(assert (=> b!912962 m!847357))

(declare-fun m!847359 () Bool)

(assert (=> b!912962 m!847359))

(declare-fun m!847361 () Bool)

(assert (=> mapNonEmpty!30424 m!847361))

(declare-fun m!847363 () Bool)

(assert (=> b!912960 m!847363))

(declare-fun m!847365 () Bool)

(assert (=> b!912960 m!847365))

(declare-fun m!847367 () Bool)

(assert (=> start!78222 m!847367))

(declare-fun m!847369 () Bool)

(assert (=> start!78222 m!847369))

(declare-fun m!847371 () Bool)

(assert (=> start!78222 m!847371))

(declare-fun m!847373 () Bool)

(assert (=> b!912961 m!847373))

(declare-fun m!847375 () Bool)

(assert (=> b!912956 m!847375))

(declare-fun m!847377 () Bool)

(assert (=> b!912958 m!847377))

(check-sat b_and!27289 tp_is_empty!19131 (not b_next!16713) (not start!78222) (not b!912960) (not mapNonEmpty!30424) (not b!912955) (not b!912958) (not b!912962) (not b!912956))
(check-sat b_and!27289 (not b_next!16713))
