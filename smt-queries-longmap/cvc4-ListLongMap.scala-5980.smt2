; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77710 () Bool)

(assert start!77710)

(declare-fun b_free!16295 () Bool)

(declare-fun b_next!16295 () Bool)

(assert (=> start!77710 (= b_free!16295 (not b_next!16295))))

(declare-fun tp!57146 () Bool)

(declare-fun b_and!26743 () Bool)

(assert (=> start!77710 (= tp!57146 b_and!26743)))

(declare-fun b!906558 () Bool)

(declare-fun e!508038 () Bool)

(declare-fun tp_is_empty!18713 () Bool)

(assert (=> b!906558 (= e!508038 tp_is_empty!18713)))

(declare-fun b!906559 () Bool)

(declare-fun res!611811 () Bool)

(declare-fun e!508034 () Bool)

(assert (=> b!906559 (=> (not res!611811) (not e!508034))))

(declare-datatypes ((V!29915 0))(
  ( (V!29916 (val!9407 Int)) )
))
(declare-datatypes ((ValueCell!8875 0))(
  ( (ValueCellFull!8875 (v!11912 V!29915)) (EmptyCell!8875) )
))
(declare-datatypes ((array!53468 0))(
  ( (array!53469 (arr!25693 (Array (_ BitVec 32) ValueCell!8875)) (size!26152 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53468)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53470 0))(
  ( (array!53471 (arr!25694 (Array (_ BitVec 32) (_ BitVec 64))) (size!26153 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53470)

(assert (=> b!906559 (= res!611811 (and (= (size!26152 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26153 _keys!1386) (size!26152 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906560 () Bool)

(declare-fun e!508036 () Bool)

(declare-fun e!508040 () Bool)

(assert (=> b!906560 (= e!508036 (not e!508040))))

(declare-fun res!611816 () Bool)

(assert (=> b!906560 (=> res!611816 e!508040)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!906560 (= res!611816 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26153 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!408965 () V!29915)

(declare-fun get!13508 (ValueCell!8875 V!29915) V!29915)

(declare-fun dynLambda!1350 (Int (_ BitVec 64)) V!29915)

(assert (=> b!906560 (= lt!408965 (get!13508 (select (arr!25693 _values!1152) i!717) (dynLambda!1350 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906560 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!29915)

(declare-datatypes ((Unit!30768 0))(
  ( (Unit!30769) )
))
(declare-fun lt!408962 () Unit!30768)

(declare-fun minValue!1094 () V!29915)

(declare-fun lemmaKeyInListMapIsInArray!222 (array!53470 array!53468 (_ BitVec 32) (_ BitVec 32) V!29915 V!29915 (_ BitVec 64) Int) Unit!30768)

(assert (=> b!906560 (= lt!408962 (lemmaKeyInListMapIsInArray!222 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!906561 () Bool)

(declare-fun res!611818 () Bool)

(assert (=> b!906561 (=> (not res!611818) (not e!508036))))

(assert (=> b!906561 (= res!611818 (and (= (select (arr!25694 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906562 () Bool)

(assert (=> b!906562 (= e!508034 e!508036)))

(declare-fun res!611813 () Bool)

(assert (=> b!906562 (=> (not res!611813) (not e!508036))))

(declare-datatypes ((tuple2!12246 0))(
  ( (tuple2!12247 (_1!6134 (_ BitVec 64)) (_2!6134 V!29915)) )
))
(declare-datatypes ((List!18052 0))(
  ( (Nil!18049) (Cons!18048 (h!19194 tuple2!12246) (t!25519 List!18052)) )
))
(declare-datatypes ((ListLongMap!10943 0))(
  ( (ListLongMap!10944 (toList!5487 List!18052)) )
))
(declare-fun lt!408963 () ListLongMap!10943)

(declare-fun contains!4532 (ListLongMap!10943 (_ BitVec 64)) Bool)

(assert (=> b!906562 (= res!611813 (contains!4532 lt!408963 k!1033))))

(declare-fun getCurrentListMap!2753 (array!53470 array!53468 (_ BitVec 32) (_ BitVec 32) V!29915 V!29915 (_ BitVec 32) Int) ListLongMap!10943)

(assert (=> b!906562 (= lt!408963 (getCurrentListMap!2753 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906563 () Bool)

(declare-fun e!508037 () Bool)

(assert (=> b!906563 (= e!508037 true)))

(declare-fun apply!473 (ListLongMap!10943 (_ BitVec 64)) V!29915)

(assert (=> b!906563 (= (apply!473 lt!408963 k!1033) lt!408965)))

(declare-fun lt!408966 () Unit!30768)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!28 (array!53470 array!53468 (_ BitVec 32) (_ BitVec 32) V!29915 V!29915 (_ BitVec 64) V!29915 (_ BitVec 32) Int) Unit!30768)

(assert (=> b!906563 (= lt!408966 (lemmaListMapApplyFromThenApplyFromZero!28 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408965 i!717 defaultEntry!1160))))

(declare-fun b!906564 () Bool)

(declare-fun res!611817 () Bool)

(assert (=> b!906564 (=> res!611817 e!508037)))

(declare-fun lt!408964 () ListLongMap!10943)

(assert (=> b!906564 (= res!611817 (not (= (apply!473 lt!408964 k!1033) lt!408965)))))

(declare-fun b!906565 () Bool)

(declare-fun e!508035 () Bool)

(declare-fun mapRes!29782 () Bool)

(assert (=> b!906565 (= e!508035 (and e!508038 mapRes!29782))))

(declare-fun condMapEmpty!29782 () Bool)

(declare-fun mapDefault!29782 () ValueCell!8875)

