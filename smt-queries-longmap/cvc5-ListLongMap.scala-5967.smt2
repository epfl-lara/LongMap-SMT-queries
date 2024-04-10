; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77628 () Bool)

(assert start!77628)

(declare-fun b_free!16213 () Bool)

(declare-fun b_next!16213 () Bool)

(assert (=> start!77628 (= b_free!16213 (not b_next!16213))))

(declare-fun tp!56900 () Bool)

(declare-fun b_and!26579 () Bool)

(assert (=> start!77628 (= tp!56900 b_and!26579)))

(declare-fun b!904877 () Bool)

(declare-fun res!610582 () Bool)

(declare-fun e!507050 () Bool)

(assert (=> b!904877 (=> (not res!610582) (not e!507050))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904877 (= res!610582 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29659 () Bool)

(declare-fun mapRes!29659 () Bool)

(declare-fun tp!56901 () Bool)

(declare-fun e!507056 () Bool)

(assert (=> mapNonEmpty!29659 (= mapRes!29659 (and tp!56901 e!507056))))

(declare-datatypes ((V!29807 0))(
  ( (V!29808 (val!9366 Int)) )
))
(declare-datatypes ((ValueCell!8834 0))(
  ( (ValueCellFull!8834 (v!11871 V!29807)) (EmptyCell!8834) )
))
(declare-datatypes ((array!53306 0))(
  ( (array!53307 (arr!25612 (Array (_ BitVec 32) ValueCell!8834)) (size!26071 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53306)

(declare-fun mapRest!29659 () (Array (_ BitVec 32) ValueCell!8834))

(declare-fun mapKey!29659 () (_ BitVec 32))

(declare-fun mapValue!29659 () ValueCell!8834)

(assert (=> mapNonEmpty!29659 (= (arr!25612 _values!1152) (store mapRest!29659 mapKey!29659 mapValue!29659))))

(declare-fun b!904878 () Bool)

(declare-fun e!507051 () Bool)

(assert (=> b!904878 (= e!507051 e!507050)))

(declare-fun res!610585 () Bool)

(assert (=> b!904878 (=> (not res!610585) (not e!507050))))

(declare-datatypes ((tuple2!12174 0))(
  ( (tuple2!12175 (_1!6098 (_ BitVec 64)) (_2!6098 V!29807)) )
))
(declare-datatypes ((List!17987 0))(
  ( (Nil!17984) (Cons!17983 (h!19129 tuple2!12174) (t!25372 List!17987)) )
))
(declare-datatypes ((ListLongMap!10871 0))(
  ( (ListLongMap!10872 (toList!5451 List!17987)) )
))
(declare-fun lt!408347 () ListLongMap!10871)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4498 (ListLongMap!10871 (_ BitVec 64)) Bool)

(assert (=> b!904878 (= res!610585 (contains!4498 lt!408347 k!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29807)

(declare-datatypes ((array!53308 0))(
  ( (array!53309 (arr!25613 (Array (_ BitVec 32) (_ BitVec 64))) (size!26072 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53308)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29807)

(declare-fun getCurrentListMap!2719 (array!53308 array!53306 (_ BitVec 32) (_ BitVec 32) V!29807 V!29807 (_ BitVec 32) Int) ListLongMap!10871)

(assert (=> b!904878 (= lt!408347 (getCurrentListMap!2719 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!904879 () Bool)

(declare-fun e!507054 () Bool)

(assert (=> b!904879 (= e!507050 (not e!507054))))

(declare-fun res!610589 () Bool)

(assert (=> b!904879 (=> res!610589 e!507054)))

(assert (=> b!904879 (= res!610589 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26072 _keys!1386))))))

(declare-fun lt!408351 () V!29807)

(declare-fun get!13451 (ValueCell!8834 V!29807) V!29807)

(declare-fun dynLambda!1319 (Int (_ BitVec 64)) V!29807)

(assert (=> b!904879 (= lt!408351 (get!13451 (select (arr!25612 _values!1152) i!717) (dynLambda!1319 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904879 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30696 0))(
  ( (Unit!30697) )
))
(declare-fun lt!408348 () Unit!30696)

(declare-fun lemmaKeyInListMapIsInArray!191 (array!53308 array!53306 (_ BitVec 32) (_ BitVec 32) V!29807 V!29807 (_ BitVec 64) Int) Unit!30696)

(assert (=> b!904879 (= lt!408348 (lemmaKeyInListMapIsInArray!191 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!904880 () Bool)

(declare-fun res!610583 () Bool)

(assert (=> b!904880 (=> (not res!610583) (not e!507050))))

(assert (=> b!904880 (= res!610583 (and (= (select (arr!25613 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904881 () Bool)

(declare-fun tp_is_empty!18631 () Bool)

(assert (=> b!904881 (= e!507056 tp_is_empty!18631)))

(declare-fun b!904882 () Bool)

(declare-fun res!610584 () Bool)

(declare-fun e!507053 () Bool)

(assert (=> b!904882 (=> res!610584 e!507053)))

(declare-fun lt!408350 () ListLongMap!10871)

(declare-fun apply!443 (ListLongMap!10871 (_ BitVec 64)) V!29807)

(assert (=> b!904882 (= res!610584 (not (= (apply!443 lt!408350 k!1033) lt!408351)))))

(declare-fun mapIsEmpty!29659 () Bool)

(assert (=> mapIsEmpty!29659 mapRes!29659))

(declare-fun b!904883 () Bool)

(declare-fun e!507057 () Bool)

(assert (=> b!904883 (= e!507057 tp_is_empty!18631)))

(declare-fun b!904884 () Bool)

(declare-fun res!610580 () Bool)

(assert (=> b!904884 (=> (not res!610580) (not e!507051))))

(assert (=> b!904884 (= res!610580 (and (= (size!26071 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26072 _keys!1386) (size!26071 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!610587 () Bool)

(assert (=> start!77628 (=> (not res!610587) (not e!507051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77628 (= res!610587 (validMask!0 mask!1756))))

(assert (=> start!77628 e!507051))

(declare-fun e!507055 () Bool)

(declare-fun array_inv!20066 (array!53306) Bool)

(assert (=> start!77628 (and (array_inv!20066 _values!1152) e!507055)))

(assert (=> start!77628 tp!56900))

(assert (=> start!77628 true))

(assert (=> start!77628 tp_is_empty!18631))

(declare-fun array_inv!20067 (array!53308) Bool)

(assert (=> start!77628 (array_inv!20067 _keys!1386)))

(declare-fun b!904885 () Bool)

(assert (=> b!904885 (= e!507053 true)))

(assert (=> b!904885 (= (apply!443 lt!408347 k!1033) lt!408351)))

(declare-fun lt!408349 () Unit!30696)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!1 (array!53308 array!53306 (_ BitVec 32) (_ BitVec 32) V!29807 V!29807 (_ BitVec 64) V!29807 (_ BitVec 32) Int) Unit!30696)

(assert (=> b!904885 (= lt!408349 (lemmaListMapApplyFromThenApplyFromZero!1 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408351 i!717 defaultEntry!1160))))

(declare-fun b!904886 () Bool)

(declare-fun res!610588 () Bool)

(assert (=> b!904886 (=> (not res!610588) (not e!507051))))

(declare-datatypes ((List!17988 0))(
  ( (Nil!17985) (Cons!17984 (h!19130 (_ BitVec 64)) (t!25373 List!17988)) )
))
(declare-fun arrayNoDuplicates!0 (array!53308 (_ BitVec 32) List!17988) Bool)

(assert (=> b!904886 (= res!610588 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17985))))

(declare-fun b!904887 () Bool)

(assert (=> b!904887 (= e!507055 (and e!507057 mapRes!29659))))

(declare-fun condMapEmpty!29659 () Bool)

(declare-fun mapDefault!29659 () ValueCell!8834)

