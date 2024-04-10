; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74814 () Bool)

(assert start!74814)

(declare-fun b_free!15391 () Bool)

(declare-fun b_next!15391 () Bool)

(assert (=> start!74814 (= b_free!15391 (not b_next!15391))))

(declare-fun tp!53870 () Bool)

(declare-fun b_and!25449 () Bool)

(assert (=> start!74814 (= tp!53870 b_and!25449)))

(declare-fun b!882040 () Bool)

(declare-fun res!599244 () Bool)

(declare-fun e!490880 () Bool)

(assert (=> b!882040 (=> (not res!599244) (not e!490880))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882040 (= res!599244 (validMask!0 mask!1196))))

(declare-fun b!882041 () Bool)

(declare-fun res!599242 () Bool)

(assert (=> b!882041 (=> (not res!599242) (not e!490880))))

(declare-datatypes ((array!51398 0))(
  ( (array!51399 (arr!24720 (Array (_ BitVec 32) (_ BitVec 64))) (size!25160 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51398)

(declare-datatypes ((List!17548 0))(
  ( (Nil!17545) (Cons!17544 (h!18675 (_ BitVec 64)) (t!24741 List!17548)) )
))
(declare-fun arrayNoDuplicates!0 (array!51398 (_ BitVec 32) List!17548) Bool)

(assert (=> b!882041 (= res!599242 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17545))))

(declare-fun mapIsEmpty!28083 () Bool)

(declare-fun mapRes!28083 () Bool)

(assert (=> mapIsEmpty!28083 mapRes!28083))

(declare-fun mapNonEmpty!28083 () Bool)

(declare-fun tp!53869 () Bool)

(declare-fun e!490875 () Bool)

(assert (=> mapNonEmpty!28083 (= mapRes!28083 (and tp!53869 e!490875))))

(declare-fun mapKey!28083 () (_ BitVec 32))

(declare-datatypes ((V!28561 0))(
  ( (V!28562 (val!8865 Int)) )
))
(declare-datatypes ((ValueCell!8378 0))(
  ( (ValueCellFull!8378 (v!11325 V!28561)) (EmptyCell!8378) )
))
(declare-fun mapRest!28083 () (Array (_ BitVec 32) ValueCell!8378))

(declare-fun mapValue!28083 () ValueCell!8378)

(declare-datatypes ((array!51400 0))(
  ( (array!51401 (arr!24721 (Array (_ BitVec 32) ValueCell!8378)) (size!25161 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51400)

(assert (=> mapNonEmpty!28083 (= (arr!24721 _values!688) (store mapRest!28083 mapKey!28083 mapValue!28083))))

(declare-fun b!882042 () Bool)

(declare-fun e!490874 () Bool)

(assert (=> b!882042 (= e!490880 e!490874)))

(declare-fun res!599240 () Bool)

(assert (=> b!882042 (=> (not res!599240) (not e!490874))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!882042 (= res!599240 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11738 0))(
  ( (tuple2!11739 (_1!5880 (_ BitVec 64)) (_2!5880 V!28561)) )
))
(declare-datatypes ((List!17549 0))(
  ( (Nil!17546) (Cons!17545 (h!18676 tuple2!11738) (t!24742 List!17549)) )
))
(declare-datatypes ((ListLongMap!10507 0))(
  ( (ListLongMap!10508 (toList!5269 List!17549)) )
))
(declare-fun lt!399022 () ListLongMap!10507)

(declare-fun lt!399025 () array!51400)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28561)

(declare-fun zeroValue!654 () V!28561)

(declare-fun getCurrentListMapNoExtraKeys!3231 (array!51398 array!51400 (_ BitVec 32) (_ BitVec 32) V!28561 V!28561 (_ BitVec 32) Int) ListLongMap!10507)

(assert (=> b!882042 (= lt!399022 (getCurrentListMapNoExtraKeys!3231 _keys!868 lt!399025 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28561)

(assert (=> b!882042 (= lt!399025 (array!51401 (store (arr!24721 _values!688) i!612 (ValueCellFull!8378 v!557)) (size!25161 _values!688)))))

(declare-fun lt!399028 () ListLongMap!10507)

(assert (=> b!882042 (= lt!399028 (getCurrentListMapNoExtraKeys!3231 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882043 () Bool)

(declare-fun res!599238 () Bool)

(assert (=> b!882043 (=> (not res!599238) (not e!490880))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!882043 (= res!599238 (and (= (select (arr!24720 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!882044 () Bool)

(declare-fun res!599243 () Bool)

(assert (=> b!882044 (=> (not res!599243) (not e!490880))))

(assert (=> b!882044 (= res!599243 (and (= (size!25161 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25160 _keys!868) (size!25161 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882045 () Bool)

(declare-fun e!490877 () Bool)

(declare-fun tp_is_empty!17635 () Bool)

(assert (=> b!882045 (= e!490877 tp_is_empty!17635)))

(declare-fun b!882046 () Bool)

(declare-fun e!490879 () Bool)

(assert (=> b!882046 (= e!490879 (or (bvsge (size!25160 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25160 _keys!868)) (bvslt from!1053 (size!25160 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882046 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!30096 0))(
  ( (Unit!30097) )
))
(declare-fun lt!399027 () Unit!30096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51398 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30096)

(assert (=> b!882046 (= lt!399027 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882046 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17545)))

(declare-fun lt!399023 () Unit!30096)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51398 (_ BitVec 32) (_ BitVec 32)) Unit!30096)

(assert (=> b!882046 (= lt!399023 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882047 () Bool)

(declare-fun e!490878 () Bool)

(assert (=> b!882047 (= e!490878 (and e!490877 mapRes!28083))))

(declare-fun condMapEmpty!28083 () Bool)

(declare-fun mapDefault!28083 () ValueCell!8378)

