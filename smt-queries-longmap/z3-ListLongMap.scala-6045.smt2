; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78358 () Bool)

(assert start!78358)

(declare-fun b_free!16681 () Bool)

(declare-fun b_next!16681 () Bool)

(assert (=> start!78358 (= b_free!16681 (not b_next!16681))))

(declare-fun tp!58321 () Bool)

(declare-fun b_and!27267 () Bool)

(assert (=> start!78358 (= tp!58321 b_and!27267)))

(declare-fun b!913376 () Bool)

(declare-fun e!512429 () Bool)

(assert (=> b!913376 (= e!512429 (not true))))

(declare-datatypes ((array!54249 0))(
  ( (array!54250 (arr!26074 (Array (_ BitVec 32) (_ BitVec 64))) (size!26534 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54249)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913376 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!30431 0))(
  ( (V!30432 (val!9600 Int)) )
))
(declare-datatypes ((ValueCell!9068 0))(
  ( (ValueCellFull!9068 (v!12108 V!30431)) (EmptyCell!9068) )
))
(declare-datatypes ((array!54251 0))(
  ( (array!54252 (arr!26075 (Array (_ BitVec 32) ValueCell!9068)) (size!26535 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54251)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30431)

(declare-datatypes ((Unit!30866 0))(
  ( (Unit!30867) )
))
(declare-fun lt!411033 () Unit!30866)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30431)

(declare-fun lemmaKeyInListMapIsInArray!264 (array!54249 array!54251 (_ BitVec 32) (_ BitVec 32) V!30431 V!30431 (_ BitVec 64) Int) Unit!30866)

(assert (=> b!913376 (= lt!411033 (lemmaKeyInListMapIsInArray!264 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!913377 () Bool)

(declare-fun e!512427 () Bool)

(declare-fun tp_is_empty!19099 () Bool)

(assert (=> b!913377 (= e!512427 tp_is_empty!19099)))

(declare-fun b!913378 () Bool)

(declare-fun res!615866 () Bool)

(assert (=> b!913378 (=> (not res!615866) (not e!512429))))

(declare-datatypes ((List!18286 0))(
  ( (Nil!18283) (Cons!18282 (h!19434 (_ BitVec 64)) (t!25867 List!18286)) )
))
(declare-fun arrayNoDuplicates!0 (array!54249 (_ BitVec 32) List!18286) Bool)

(assert (=> b!913378 (= res!615866 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18283))))

(declare-fun res!615867 () Bool)

(assert (=> start!78358 (=> (not res!615867) (not e!512429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78358 (= res!615867 (validMask!0 mask!1756))))

(assert (=> start!78358 e!512429))

(declare-fun e!512430 () Bool)

(declare-fun array_inv!20458 (array!54251) Bool)

(assert (=> start!78358 (and (array_inv!20458 _values!1152) e!512430)))

(assert (=> start!78358 tp!58321))

(assert (=> start!78358 true))

(assert (=> start!78358 tp_is_empty!19099))

(declare-fun array_inv!20459 (array!54249) Bool)

(assert (=> start!78358 (array_inv!20459 _keys!1386)))

(declare-fun mapNonEmpty!30376 () Bool)

(declare-fun mapRes!30376 () Bool)

(declare-fun tp!58320 () Bool)

(assert (=> mapNonEmpty!30376 (= mapRes!30376 (and tp!58320 e!512427))))

(declare-fun mapRest!30376 () (Array (_ BitVec 32) ValueCell!9068))

(declare-fun mapValue!30376 () ValueCell!9068)

(declare-fun mapKey!30376 () (_ BitVec 32))

(assert (=> mapNonEmpty!30376 (= (arr!26075 _values!1152) (store mapRest!30376 mapKey!30376 mapValue!30376))))

(declare-fun b!913379 () Bool)

(declare-fun res!615870 () Bool)

(assert (=> b!913379 (=> (not res!615870) (not e!512429))))

(declare-datatypes ((tuple2!12466 0))(
  ( (tuple2!12467 (_1!6244 (_ BitVec 64)) (_2!6244 V!30431)) )
))
(declare-datatypes ((List!18287 0))(
  ( (Nil!18284) (Cons!18283 (h!19435 tuple2!12466) (t!25868 List!18287)) )
))
(declare-datatypes ((ListLongMap!11165 0))(
  ( (ListLongMap!11166 (toList!5598 List!18287)) )
))
(declare-fun contains!4653 (ListLongMap!11165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2859 (array!54249 array!54251 (_ BitVec 32) (_ BitVec 32) V!30431 V!30431 (_ BitVec 32) Int) ListLongMap!11165)

(assert (=> b!913379 (= res!615870 (contains!4653 (getCurrentListMap!2859 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!913380 () Bool)

(declare-fun res!615872 () Bool)

(assert (=> b!913380 (=> (not res!615872) (not e!512429))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!913380 (= res!615872 (and (= (select (arr!26074 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!30376 () Bool)

(assert (=> mapIsEmpty!30376 mapRes!30376))

(declare-fun b!913381 () Bool)

(declare-fun res!615869 () Bool)

(assert (=> b!913381 (=> (not res!615869) (not e!512429))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913381 (= res!615869 (inRange!0 i!717 mask!1756))))

(declare-fun b!913382 () Bool)

(declare-fun e!512426 () Bool)

(assert (=> b!913382 (= e!512430 (and e!512426 mapRes!30376))))

(declare-fun condMapEmpty!30376 () Bool)

(declare-fun mapDefault!30376 () ValueCell!9068)

(assert (=> b!913382 (= condMapEmpty!30376 (= (arr!26075 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9068)) mapDefault!30376)))))

(declare-fun b!913383 () Bool)

(declare-fun res!615871 () Bool)

(assert (=> b!913383 (=> (not res!615871) (not e!512429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54249 (_ BitVec 32)) Bool)

(assert (=> b!913383 (= res!615871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913384 () Bool)

(declare-fun res!615868 () Bool)

(assert (=> b!913384 (=> (not res!615868) (not e!512429))))

(assert (=> b!913384 (= res!615868 (and (= (size!26535 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26534 _keys!1386) (size!26535 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!913385 () Bool)

(assert (=> b!913385 (= e!512426 tp_is_empty!19099)))

(assert (= (and start!78358 res!615867) b!913384))

(assert (= (and b!913384 res!615868) b!913383))

(assert (= (and b!913383 res!615871) b!913378))

(assert (= (and b!913378 res!615866) b!913379))

(assert (= (and b!913379 res!615870) b!913381))

(assert (= (and b!913381 res!615869) b!913380))

(assert (= (and b!913380 res!615872) b!913376))

(assert (= (and b!913382 condMapEmpty!30376) mapIsEmpty!30376))

(assert (= (and b!913382 (not condMapEmpty!30376)) mapNonEmpty!30376))

(get-info :version)

(assert (= (and mapNonEmpty!30376 ((_ is ValueCellFull!9068) mapValue!30376)) b!913377))

(assert (= (and b!913382 ((_ is ValueCellFull!9068) mapDefault!30376)) b!913385))

(assert (= start!78358 b!913382))

(declare-fun m!848265 () Bool)

(assert (=> b!913381 m!848265))

(declare-fun m!848267 () Bool)

(assert (=> b!913380 m!848267))

(declare-fun m!848269 () Bool)

(assert (=> b!913376 m!848269))

(declare-fun m!848271 () Bool)

(assert (=> b!913376 m!848271))

(declare-fun m!848273 () Bool)

(assert (=> b!913378 m!848273))

(declare-fun m!848275 () Bool)

(assert (=> start!78358 m!848275))

(declare-fun m!848277 () Bool)

(assert (=> start!78358 m!848277))

(declare-fun m!848279 () Bool)

(assert (=> start!78358 m!848279))

(declare-fun m!848281 () Bool)

(assert (=> b!913383 m!848281))

(declare-fun m!848283 () Bool)

(assert (=> mapNonEmpty!30376 m!848283))

(declare-fun m!848285 () Bool)

(assert (=> b!913379 m!848285))

(assert (=> b!913379 m!848285))

(declare-fun m!848287 () Bool)

(assert (=> b!913379 m!848287))

(check-sat b_and!27267 (not b!913376) tp_is_empty!19099 (not b!913383) (not b_next!16681) (not start!78358) (not mapNonEmpty!30376) (not b!913378) (not b!913379) (not b!913381))
(check-sat b_and!27267 (not b_next!16681))
