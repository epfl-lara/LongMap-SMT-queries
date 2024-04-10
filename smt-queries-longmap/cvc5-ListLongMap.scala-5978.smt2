; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77694 () Bool)

(assert start!77694)

(declare-fun b_free!16279 () Bool)

(declare-fun b_next!16279 () Bool)

(assert (=> start!77694 (= b_free!16279 (not b_next!16279))))

(declare-fun tp!57098 () Bool)

(declare-fun b_and!26711 () Bool)

(assert (=> start!77694 (= tp!57098 b_and!26711)))

(declare-fun b!906230 () Bool)

(declare-fun res!611578 () Bool)

(declare-fun e!507849 () Bool)

(assert (=> b!906230 (=> (not res!611578) (not e!507849))))

(declare-datatypes ((array!53436 0))(
  ( (array!53437 (arr!25677 (Array (_ BitVec 32) (_ BitVec 64))) (size!26136 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53436)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53436 (_ BitVec 32)) Bool)

(assert (=> b!906230 (= res!611578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906231 () Bool)

(declare-fun e!507842 () Bool)

(assert (=> b!906231 (= e!507849 e!507842)))

(declare-fun res!611576 () Bool)

(assert (=> b!906231 (=> (not res!611576) (not e!507842))))

(declare-datatypes ((V!29895 0))(
  ( (V!29896 (val!9399 Int)) )
))
(declare-datatypes ((tuple2!12232 0))(
  ( (tuple2!12233 (_1!6127 (_ BitVec 64)) (_2!6127 V!29895)) )
))
(declare-datatypes ((List!18039 0))(
  ( (Nil!18036) (Cons!18035 (h!19181 tuple2!12232) (t!25490 List!18039)) )
))
(declare-datatypes ((ListLongMap!10929 0))(
  ( (ListLongMap!10930 (toList!5480 List!18039)) )
))
(declare-fun lt!408844 () ListLongMap!10929)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4525 (ListLongMap!10929 (_ BitVec 64)) Bool)

(assert (=> b!906231 (= res!611576 (contains!4525 lt!408844 k!1033))))

(declare-datatypes ((ValueCell!8867 0))(
  ( (ValueCellFull!8867 (v!11904 V!29895)) (EmptyCell!8867) )
))
(declare-datatypes ((array!53438 0))(
  ( (array!53439 (arr!25678 (Array (_ BitVec 32) ValueCell!8867)) (size!26137 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53438)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29895)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29895)

(declare-fun getCurrentListMap!2746 (array!53436 array!53438 (_ BitVec 32) (_ BitVec 32) V!29895 V!29895 (_ BitVec 32) Int) ListLongMap!10929)

(assert (=> b!906231 (= lt!408844 (getCurrentListMap!2746 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906232 () Bool)

(declare-fun res!611577 () Bool)

(assert (=> b!906232 (=> (not res!611577) (not e!507842))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906232 (= res!611577 (inRange!0 i!717 mask!1756))))

(declare-fun b!906233 () Bool)

(declare-fun e!507846 () Bool)

(assert (=> b!906233 (= e!507846 true)))

(declare-fun lt!408845 () V!29895)

(declare-fun apply!467 (ListLongMap!10929 (_ BitVec 64)) V!29895)

(assert (=> b!906233 (= (apply!467 lt!408844 k!1033) lt!408845)))

(declare-datatypes ((Unit!30754 0))(
  ( (Unit!30755) )
))
(declare-fun lt!408842 () Unit!30754)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!22 (array!53436 array!53438 (_ BitVec 32) (_ BitVec 32) V!29895 V!29895 (_ BitVec 64) V!29895 (_ BitVec 32) Int) Unit!30754)

(assert (=> b!906233 (= lt!408842 (lemmaListMapApplyFromThenApplyFromZero!22 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408845 i!717 defaultEntry!1160))))

(declare-fun res!611574 () Bool)

(assert (=> start!77694 (=> (not res!611574) (not e!507849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77694 (= res!611574 (validMask!0 mask!1756))))

(assert (=> start!77694 e!507849))

(declare-fun e!507844 () Bool)

(declare-fun array_inv!20116 (array!53438) Bool)

(assert (=> start!77694 (and (array_inv!20116 _values!1152) e!507844)))

(assert (=> start!77694 tp!57098))

(assert (=> start!77694 true))

(declare-fun tp_is_empty!18697 () Bool)

(assert (=> start!77694 tp_is_empty!18697))

(declare-fun array_inv!20117 (array!53436) Bool)

(assert (=> start!77694 (array_inv!20117 _keys!1386)))

(declare-fun b!906234 () Bool)

(declare-fun e!507847 () Bool)

(assert (=> b!906234 (= e!507842 (not e!507847))))

(declare-fun res!611570 () Bool)

(assert (=> b!906234 (=> res!611570 e!507847)))

(assert (=> b!906234 (= res!611570 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26136 _keys!1386))))))

(declare-fun get!13497 (ValueCell!8867 V!29895) V!29895)

(declare-fun dynLambda!1343 (Int (_ BitVec 64)) V!29895)

(assert (=> b!906234 (= lt!408845 (get!13497 (select (arr!25678 _values!1152) i!717) (dynLambda!1343 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906234 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408843 () Unit!30754)

(declare-fun lemmaKeyInListMapIsInArray!215 (array!53436 array!53438 (_ BitVec 32) (_ BitVec 32) V!29895 V!29895 (_ BitVec 64) Int) Unit!30754)

(assert (=> b!906234 (= lt!408843 (lemmaKeyInListMapIsInArray!215 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!906235 () Bool)

(declare-fun e!507848 () Bool)

(assert (=> b!906235 (= e!507848 tp_is_empty!18697)))

(declare-fun b!906236 () Bool)

(declare-fun res!611572 () Bool)

(assert (=> b!906236 (=> (not res!611572) (not e!507842))))

(assert (=> b!906236 (= res!611572 (and (= (select (arr!25677 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906237 () Bool)

(assert (=> b!906237 (= e!507847 e!507846)))

(declare-fun res!611575 () Bool)

(assert (=> b!906237 (=> res!611575 e!507846)))

(declare-fun lt!408846 () ListLongMap!10929)

(assert (=> b!906237 (= res!611575 (not (contains!4525 lt!408846 k!1033)))))

(assert (=> b!906237 (= lt!408846 (getCurrentListMap!2746 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906238 () Bool)

(declare-fun res!611573 () Bool)

(assert (=> b!906238 (=> (not res!611573) (not e!507849))))

(declare-datatypes ((List!18040 0))(
  ( (Nil!18037) (Cons!18036 (h!19182 (_ BitVec 64)) (t!25491 List!18040)) )
))
(declare-fun arrayNoDuplicates!0 (array!53436 (_ BitVec 32) List!18040) Bool)

(assert (=> b!906238 (= res!611573 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18037))))

(declare-fun mapNonEmpty!29758 () Bool)

(declare-fun mapRes!29758 () Bool)

(declare-fun tp!57099 () Bool)

(assert (=> mapNonEmpty!29758 (= mapRes!29758 (and tp!57099 e!507848))))

(declare-fun mapValue!29758 () ValueCell!8867)

(declare-fun mapRest!29758 () (Array (_ BitVec 32) ValueCell!8867))

(declare-fun mapKey!29758 () (_ BitVec 32))

(assert (=> mapNonEmpty!29758 (= (arr!25678 _values!1152) (store mapRest!29758 mapKey!29758 mapValue!29758))))

(declare-fun b!906239 () Bool)

(declare-fun e!507845 () Bool)

(assert (=> b!906239 (= e!507845 tp_is_empty!18697)))

(declare-fun b!906240 () Bool)

(declare-fun res!611571 () Bool)

(assert (=> b!906240 (=> (not res!611571) (not e!507849))))

(assert (=> b!906240 (= res!611571 (and (= (size!26137 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26136 _keys!1386) (size!26137 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906241 () Bool)

(assert (=> b!906241 (= e!507844 (and e!507845 mapRes!29758))))

(declare-fun condMapEmpty!29758 () Bool)

(declare-fun mapDefault!29758 () ValueCell!8867)

