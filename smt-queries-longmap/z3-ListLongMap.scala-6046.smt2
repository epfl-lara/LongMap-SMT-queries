; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78364 () Bool)

(assert start!78364)

(declare-fun b_free!16687 () Bool)

(declare-fun b_next!16687 () Bool)

(assert (=> start!78364 (= b_free!16687 (not b_next!16687))))

(declare-fun tp!58338 () Bool)

(declare-fun b_and!27273 () Bool)

(assert (=> start!78364 (= tp!58338 b_and!27273)))

(declare-fun mapNonEmpty!30385 () Bool)

(declare-fun mapRes!30385 () Bool)

(declare-fun tp!58339 () Bool)

(declare-fun e!512473 () Bool)

(assert (=> mapNonEmpty!30385 (= mapRes!30385 (and tp!58339 e!512473))))

(declare-datatypes ((V!30439 0))(
  ( (V!30440 (val!9603 Int)) )
))
(declare-datatypes ((ValueCell!9071 0))(
  ( (ValueCellFull!9071 (v!12111 V!30439)) (EmptyCell!9071) )
))
(declare-datatypes ((array!54261 0))(
  ( (array!54262 (arr!26080 (Array (_ BitVec 32) ValueCell!9071)) (size!26540 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54261)

(declare-fun mapKey!30385 () (_ BitVec 32))

(declare-fun mapRest!30385 () (Array (_ BitVec 32) ValueCell!9071))

(declare-fun mapValue!30385 () ValueCell!9071)

(assert (=> mapNonEmpty!30385 (= (arr!26080 _values!1152) (store mapRest!30385 mapKey!30385 mapValue!30385))))

(declare-fun b!913466 () Bool)

(declare-fun e!512472 () Bool)

(assert (=> b!913466 (= e!512472 (not true))))

(declare-datatypes ((array!54263 0))(
  ( (array!54264 (arr!26081 (Array (_ BitVec 32) (_ BitVec 64))) (size!26541 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54263)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913466 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30868 0))(
  ( (Unit!30869) )
))
(declare-fun lt!411042 () Unit!30868)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30439)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30439)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lemmaKeyInListMapIsInArray!265 (array!54263 array!54261 (_ BitVec 32) (_ BitVec 32) V!30439 V!30439 (_ BitVec 64) Int) Unit!30868)

(assert (=> b!913466 (= lt!411042 (lemmaKeyInListMapIsInArray!265 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!913467 () Bool)

(declare-fun e!512471 () Bool)

(declare-fun e!512474 () Bool)

(assert (=> b!913467 (= e!512471 (and e!512474 mapRes!30385))))

(declare-fun condMapEmpty!30385 () Bool)

(declare-fun mapDefault!30385 () ValueCell!9071)

(assert (=> b!913467 (= condMapEmpty!30385 (= (arr!26080 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9071)) mapDefault!30385)))))

(declare-fun b!913468 () Bool)

(declare-fun res!615929 () Bool)

(assert (=> b!913468 (=> (not res!615929) (not e!512472))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!913468 (= res!615929 (and (= (select (arr!26081 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!913469 () Bool)

(declare-fun res!615933 () Bool)

(assert (=> b!913469 (=> (not res!615933) (not e!512472))))

(declare-datatypes ((List!18288 0))(
  ( (Nil!18285) (Cons!18284 (h!19436 (_ BitVec 64)) (t!25869 List!18288)) )
))
(declare-fun arrayNoDuplicates!0 (array!54263 (_ BitVec 32) List!18288) Bool)

(assert (=> b!913469 (= res!615933 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18285))))

(declare-fun b!913470 () Bool)

(declare-fun res!615935 () Bool)

(assert (=> b!913470 (=> (not res!615935) (not e!512472))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913470 (= res!615935 (inRange!0 i!717 mask!1756))))

(declare-fun b!913471 () Bool)

(declare-fun res!615930 () Bool)

(assert (=> b!913471 (=> (not res!615930) (not e!512472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54263 (_ BitVec 32)) Bool)

(assert (=> b!913471 (= res!615930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913472 () Bool)

(declare-fun res!615934 () Bool)

(assert (=> b!913472 (=> (not res!615934) (not e!512472))))

(assert (=> b!913472 (= res!615934 (and (= (size!26540 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26541 _keys!1386) (size!26540 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913473 () Bool)

(declare-fun res!615932 () Bool)

(assert (=> b!913473 (=> (not res!615932) (not e!512472))))

(declare-datatypes ((tuple2!12468 0))(
  ( (tuple2!12469 (_1!6245 (_ BitVec 64)) (_2!6245 V!30439)) )
))
(declare-datatypes ((List!18289 0))(
  ( (Nil!18286) (Cons!18285 (h!19437 tuple2!12468) (t!25870 List!18289)) )
))
(declare-datatypes ((ListLongMap!11167 0))(
  ( (ListLongMap!11168 (toList!5599 List!18289)) )
))
(declare-fun contains!4654 (ListLongMap!11167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2860 (array!54263 array!54261 (_ BitVec 32) (_ BitVec 32) V!30439 V!30439 (_ BitVec 32) Int) ListLongMap!11167)

(assert (=> b!913473 (= res!615932 (contains!4654 (getCurrentListMap!2860 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913474 () Bool)

(declare-fun tp_is_empty!19105 () Bool)

(assert (=> b!913474 (= e!512474 tp_is_empty!19105)))

(declare-fun b!913475 () Bool)

(assert (=> b!913475 (= e!512473 tp_is_empty!19105)))

(declare-fun mapIsEmpty!30385 () Bool)

(assert (=> mapIsEmpty!30385 mapRes!30385))

(declare-fun res!615931 () Bool)

(assert (=> start!78364 (=> (not res!615931) (not e!512472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78364 (= res!615931 (validMask!0 mask!1756))))

(assert (=> start!78364 e!512472))

(declare-fun array_inv!20460 (array!54261) Bool)

(assert (=> start!78364 (and (array_inv!20460 _values!1152) e!512471)))

(assert (=> start!78364 tp!58338))

(assert (=> start!78364 true))

(assert (=> start!78364 tp_is_empty!19105))

(declare-fun array_inv!20461 (array!54263) Bool)

(assert (=> start!78364 (array_inv!20461 _keys!1386)))

(assert (= (and start!78364 res!615931) b!913472))

(assert (= (and b!913472 res!615934) b!913471))

(assert (= (and b!913471 res!615930) b!913469))

(assert (= (and b!913469 res!615933) b!913473))

(assert (= (and b!913473 res!615932) b!913470))

(assert (= (and b!913470 res!615935) b!913468))

(assert (= (and b!913468 res!615929) b!913466))

(assert (= (and b!913467 condMapEmpty!30385) mapIsEmpty!30385))

(assert (= (and b!913467 (not condMapEmpty!30385)) mapNonEmpty!30385))

(get-info :version)

(assert (= (and mapNonEmpty!30385 ((_ is ValueCellFull!9071) mapValue!30385)) b!913475))

(assert (= (and b!913467 ((_ is ValueCellFull!9071) mapDefault!30385)) b!913474))

(assert (= start!78364 b!913467))

(declare-fun m!848337 () Bool)

(assert (=> b!913468 m!848337))

(declare-fun m!848339 () Bool)

(assert (=> b!913470 m!848339))

(declare-fun m!848341 () Bool)

(assert (=> b!913469 m!848341))

(declare-fun m!848343 () Bool)

(assert (=> start!78364 m!848343))

(declare-fun m!848345 () Bool)

(assert (=> start!78364 m!848345))

(declare-fun m!848347 () Bool)

(assert (=> start!78364 m!848347))

(declare-fun m!848349 () Bool)

(assert (=> b!913473 m!848349))

(assert (=> b!913473 m!848349))

(declare-fun m!848351 () Bool)

(assert (=> b!913473 m!848351))

(declare-fun m!848353 () Bool)

(assert (=> b!913466 m!848353))

(declare-fun m!848355 () Bool)

(assert (=> b!913466 m!848355))

(declare-fun m!848357 () Bool)

(assert (=> b!913471 m!848357))

(declare-fun m!848359 () Bool)

(assert (=> mapNonEmpty!30385 m!848359))

(check-sat (not mapNonEmpty!30385) tp_is_empty!19105 (not b!913473) (not b_next!16687) (not b!913470) b_and!27273 (not b!913466) (not b!913471) (not start!78364) (not b!913469))
(check-sat b_and!27273 (not b_next!16687))
