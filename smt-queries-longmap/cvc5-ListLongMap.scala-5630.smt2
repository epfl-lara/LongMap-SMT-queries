; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73564 () Bool)

(assert start!73564)

(declare-fun b_free!14479 () Bool)

(declare-fun b_next!14479 () Bool)

(assert (=> start!73564 (= b_free!14479 (not b_next!14479))))

(declare-fun tp!50941 () Bool)

(declare-fun b_and!23937 () Bool)

(assert (=> start!73564 (= tp!50941 b_and!23937)))

(declare-fun b!860290 () Bool)

(declare-fun res!584618 () Bool)

(declare-fun e!479381 () Bool)

(assert (=> b!860290 (=> (not res!584618) (not e!479381))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860290 (= res!584618 (validMask!0 mask!1196))))

(declare-fun b!860291 () Bool)

(declare-fun res!584629 () Bool)

(declare-fun e!479387 () Bool)

(assert (=> b!860291 (=> res!584629 e!479387)))

(declare-datatypes ((List!16849 0))(
  ( (Nil!16846) (Cons!16845 (h!17976 (_ BitVec 64)) (t!23594 List!16849)) )
))
(declare-fun noDuplicate!1313 (List!16849) Bool)

(assert (=> b!860291 (= res!584629 (not (noDuplicate!1313 Nil!16846)))))

(declare-fun mapNonEmpty!26522 () Bool)

(declare-fun mapRes!26522 () Bool)

(declare-fun tp!50940 () Bool)

(declare-fun e!479382 () Bool)

(assert (=> mapNonEmpty!26522 (= mapRes!26522 (and tp!50940 e!479382))))

(declare-datatypes ((V!27201 0))(
  ( (V!27202 (val!8355 Int)) )
))
(declare-datatypes ((ValueCell!7868 0))(
  ( (ValueCellFull!7868 (v!10780 V!27201)) (EmptyCell!7868) )
))
(declare-fun mapValue!26522 () ValueCell!7868)

(declare-fun mapRest!26522 () (Array (_ BitVec 32) ValueCell!7868))

(declare-fun mapKey!26522 () (_ BitVec 32))

(declare-datatypes ((array!49406 0))(
  ( (array!49407 (arr!23734 (Array (_ BitVec 32) ValueCell!7868)) (size!24174 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49406)

(assert (=> mapNonEmpty!26522 (= (arr!23734 _values!688) (store mapRest!26522 mapKey!26522 mapValue!26522))))

(declare-fun b!860292 () Bool)

(declare-fun res!584617 () Bool)

(assert (=> b!860292 (=> (not res!584617) (not e!479381))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49408 0))(
  ( (array!49409 (arr!23735 (Array (_ BitVec 32) (_ BitVec 64))) (size!24175 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49408)

(assert (=> b!860292 (= res!584617 (and (= (size!24174 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24175 _keys!868) (size!24174 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860293 () Bool)

(declare-fun e!479389 () Bool)

(assert (=> b!860293 (= e!479389 e!479387)))

(declare-fun res!584620 () Bool)

(assert (=> b!860293 (=> res!584620 e!479387)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!860293 (= res!584620 (or (bvsge (size!24175 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24175 _keys!868)) (bvsge from!1053 (size!24175 _keys!868))))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!49408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860293 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29327 0))(
  ( (Unit!29328) )
))
(declare-fun lt!387752 () Unit!29327)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49408 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29327)

(assert (=> b!860293 (= lt!387752 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!49408 (_ BitVec 32) List!16849) Bool)

(assert (=> b!860293 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16846)))

(declare-fun lt!387747 () Unit!29327)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49408 (_ BitVec 32) (_ BitVec 32)) Unit!29327)

(assert (=> b!860293 (= lt!387747 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!860294 () Bool)

(assert (=> b!860294 (= e!479387 true)))

(declare-fun lt!387746 () Bool)

(declare-fun contains!4232 (List!16849 (_ BitVec 64)) Bool)

(assert (=> b!860294 (= lt!387746 (contains!4232 Nil!16846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!584626 () Bool)

(assert (=> start!73564 (=> (not res!584626) (not e!479381))))

(assert (=> start!73564 (= res!584626 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24175 _keys!868))))))

(assert (=> start!73564 e!479381))

(declare-fun tp_is_empty!16615 () Bool)

(assert (=> start!73564 tp_is_empty!16615))

(assert (=> start!73564 true))

(assert (=> start!73564 tp!50941))

(declare-fun array_inv!18788 (array!49408) Bool)

(assert (=> start!73564 (array_inv!18788 _keys!868)))

(declare-fun e!479383 () Bool)

(declare-fun array_inv!18789 (array!49406) Bool)

(assert (=> start!73564 (and (array_inv!18789 _values!688) e!479383)))

(declare-fun b!860295 () Bool)

(declare-fun e!479388 () Bool)

(assert (=> b!860295 (= e!479383 (and e!479388 mapRes!26522))))

(declare-fun condMapEmpty!26522 () Bool)

(declare-fun mapDefault!26522 () ValueCell!7868)

