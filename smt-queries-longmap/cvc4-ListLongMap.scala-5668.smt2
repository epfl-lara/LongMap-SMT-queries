; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73796 () Bool)

(assert start!73796)

(declare-fun b_free!14711 () Bool)

(declare-fun b_next!14711 () Bool)

(assert (=> start!73796 (= b_free!14711 (not b_next!14711))))

(declare-fun tp!51637 () Bool)

(declare-fun b_and!24401 () Bool)

(assert (=> start!73796 (= tp!51637 b_and!24401)))

(declare-fun b!866025 () Bool)

(declare-datatypes ((Unit!29678 0))(
  ( (Unit!29679) )
))
(declare-fun e!482424 () Unit!29678)

(declare-fun Unit!29680 () Unit!29678)

(assert (=> b!866025 (= e!482424 Unit!29680)))

(declare-fun lt!392719 () Unit!29678)

(declare-datatypes ((array!49854 0))(
  ( (array!49855 (arr!23958 (Array (_ BitVec 32) (_ BitVec 64))) (size!24398 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49854)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49854 (_ BitVec 32) (_ BitVec 32)) Unit!29678)

(assert (=> b!866025 (= lt!392719 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17033 0))(
  ( (Nil!17030) (Cons!17029 (h!18160 (_ BitVec 64)) (t!24010 List!17033)) )
))
(declare-fun arrayNoDuplicates!0 (array!49854 (_ BitVec 32) List!17033) Bool)

(assert (=> b!866025 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17030)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lt!392726 () Unit!29678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49854 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29678)

(assert (=> b!866025 (= lt!392726 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866025 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392722 () Unit!29678)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49854 (_ BitVec 64) (_ BitVec 32) List!17033) Unit!29678)

(assert (=> b!866025 (= lt!392722 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17030))))

(assert (=> b!866025 false))

(declare-fun b!866026 () Bool)

(declare-fun res!588436 () Bool)

(declare-fun e!482425 () Bool)

(assert (=> b!866026 (=> (not res!588436) (not e!482425))))

(assert (=> b!866026 (= res!588436 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17030))))

(declare-fun res!588432 () Bool)

(assert (=> start!73796 (=> (not res!588432) (not e!482425))))

(assert (=> start!73796 (= res!588432 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24398 _keys!868))))))

(assert (=> start!73796 e!482425))

(declare-fun tp_is_empty!16847 () Bool)

(assert (=> start!73796 tp_is_empty!16847))

(assert (=> start!73796 true))

(assert (=> start!73796 tp!51637))

(declare-fun array_inv!18938 (array!49854) Bool)

(assert (=> start!73796 (array_inv!18938 _keys!868)))

(declare-datatypes ((V!27509 0))(
  ( (V!27510 (val!8471 Int)) )
))
(declare-datatypes ((ValueCell!7984 0))(
  ( (ValueCellFull!7984 (v!10896 V!27509)) (EmptyCell!7984) )
))
(declare-datatypes ((array!49856 0))(
  ( (array!49857 (arr!23959 (Array (_ BitVec 32) ValueCell!7984)) (size!24399 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49856)

(declare-fun e!482430 () Bool)

(declare-fun array_inv!18939 (array!49856) Bool)

(assert (=> start!73796 (and (array_inv!18939 _values!688) e!482430)))

(declare-fun b!866027 () Bool)

(declare-fun e!482427 () Bool)

(declare-fun mapRes!26870 () Bool)

(assert (=> b!866027 (= e!482430 (and e!482427 mapRes!26870))))

(declare-fun condMapEmpty!26870 () Bool)

(declare-fun mapDefault!26870 () ValueCell!7984)

