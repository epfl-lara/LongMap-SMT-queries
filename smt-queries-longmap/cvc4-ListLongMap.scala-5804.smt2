; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74900 () Bool)

(assert start!74900)

(declare-fun b_free!15419 () Bool)

(declare-fun b_next!15419 () Bool)

(assert (=> start!74900 (= b_free!15419 (not b_next!15419))))

(declare-fun tp!53960 () Bool)

(declare-fun b_and!25537 () Bool)

(assert (=> start!74900 (= tp!53960 b_and!25537)))

(declare-fun b!883045 () Bool)

(declare-fun e!491462 () Bool)

(declare-fun e!491466 () Bool)

(assert (=> b!883045 (= e!491462 e!491466)))

(declare-fun res!599927 () Bool)

(assert (=> b!883045 (=> res!599927 e!491466)))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!51452 0))(
  ( (array!51453 (arr!24745 (Array (_ BitVec 32) (_ BitVec 64))) (size!25185 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51452)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!883045 (= res!599927 (not (= (select (arr!24745 _keys!868) from!1053) k!854)))))

(declare-datatypes ((V!28597 0))(
  ( (V!28598 (val!8879 Int)) )
))
(declare-datatypes ((tuple2!11760 0))(
  ( (tuple2!11761 (_1!5891 (_ BitVec 64)) (_2!5891 V!28597)) )
))
(declare-datatypes ((List!17569 0))(
  ( (Nil!17566) (Cons!17565 (h!18696 tuple2!11760) (t!24790 List!17569)) )
))
(declare-datatypes ((ListLongMap!10529 0))(
  ( (ListLongMap!10530 (toList!5280 List!17569)) )
))
(declare-fun lt!399573 () ListLongMap!10529)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8392 0))(
  ( (ValueCellFull!8392 (v!11348 V!28597)) (EmptyCell!8392) )
))
(declare-datatypes ((array!51454 0))(
  ( (array!51455 (arr!24746 (Array (_ BitVec 32) ValueCell!8392)) (size!25186 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51454)

(declare-fun lt!399577 () ListLongMap!10529)

(declare-fun +!2549 (ListLongMap!10529 tuple2!11760) ListLongMap!10529)

(declare-fun get!13033 (ValueCell!8392 V!28597) V!28597)

(declare-fun dynLambda!1262 (Int (_ BitVec 64)) V!28597)

(assert (=> b!883045 (= lt!399577 (+!2549 lt!399573 (tuple2!11761 (select (arr!24745 _keys!868) from!1053) (get!13033 (select (arr!24746 _values!688) from!1053) (dynLambda!1262 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883046 () Bool)

(declare-fun res!599930 () Bool)

(declare-fun e!491464 () Bool)

(assert (=> b!883046 (=> (not res!599930) (not e!491464))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!883046 (= res!599930 (and (= (size!25186 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25185 _keys!868) (size!25186 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883047 () Bool)

(declare-fun e!491458 () Bool)

(assert (=> b!883047 (= e!491466 e!491458)))

(declare-fun res!599926 () Bool)

(assert (=> b!883047 (=> res!599926 e!491458)))

(assert (=> b!883047 (= res!599926 (or (bvsge (size!25185 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25185 _keys!868)) (bvsge from!1053 (size!25185 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883047 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30114 0))(
  ( (Unit!30115) )
))
(declare-fun lt!399575 () Unit!30114)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51452 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30114)

(assert (=> b!883047 (= lt!399575 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!17570 0))(
  ( (Nil!17567) (Cons!17566 (h!18697 (_ BitVec 64)) (t!24791 List!17570)) )
))
(declare-fun arrayNoDuplicates!0 (array!51452 (_ BitVec 32) List!17570) Bool)

(assert (=> b!883047 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17567)))

(declare-fun lt!399572 () Unit!30114)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51452 (_ BitVec 32) (_ BitVec 32)) Unit!30114)

(assert (=> b!883047 (= lt!399572 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!883048 () Bool)

(declare-fun res!599923 () Bool)

(assert (=> b!883048 (=> res!599923 e!491458)))

(declare-fun noDuplicate!1326 (List!17570) Bool)

(assert (=> b!883048 (= res!599923 (not (noDuplicate!1326 Nil!17567)))))

(declare-fun b!883049 () Bool)

(declare-fun res!599931 () Bool)

(assert (=> b!883049 (=> (not res!599931) (not e!491464))))

(assert (=> b!883049 (= res!599931 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17567))))

(declare-fun b!883050 () Bool)

(declare-fun res!599929 () Bool)

(assert (=> b!883050 (=> (not res!599929) (not e!491464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883050 (= res!599929 (validKeyInArray!0 k!854))))

(declare-fun res!599932 () Bool)

(assert (=> start!74900 (=> (not res!599932) (not e!491464))))

(assert (=> start!74900 (= res!599932 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25185 _keys!868))))))

(assert (=> start!74900 e!491464))

(declare-fun tp_is_empty!17663 () Bool)

(assert (=> start!74900 tp_is_empty!17663))

(assert (=> start!74900 true))

(assert (=> start!74900 tp!53960))

(declare-fun array_inv!19482 (array!51452) Bool)

(assert (=> start!74900 (array_inv!19482 _keys!868)))

(declare-fun e!491465 () Bool)

(declare-fun array_inv!19483 (array!51454) Bool)

(assert (=> start!74900 (and (array_inv!19483 _values!688) e!491465)))

(declare-fun b!883051 () Bool)

(declare-fun e!491460 () Bool)

(assert (=> b!883051 (= e!491464 e!491460)))

(declare-fun res!599928 () Bool)

(assert (=> b!883051 (=> (not res!599928) (not e!491460))))

(assert (=> b!883051 (= res!599928 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399576 () array!51454)

(declare-fun minValue!654 () V!28597)

(declare-fun zeroValue!654 () V!28597)

(declare-fun getCurrentListMapNoExtraKeys!3241 (array!51452 array!51454 (_ BitVec 32) (_ BitVec 32) V!28597 V!28597 (_ BitVec 32) Int) ListLongMap!10529)

(assert (=> b!883051 (= lt!399577 (getCurrentListMapNoExtraKeys!3241 _keys!868 lt!399576 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28597)

(assert (=> b!883051 (= lt!399576 (array!51455 (store (arr!24746 _values!688) i!612 (ValueCellFull!8392 v!557)) (size!25186 _values!688)))))

(declare-fun lt!399580 () ListLongMap!10529)

(assert (=> b!883051 (= lt!399580 (getCurrentListMapNoExtraKeys!3241 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883052 () Bool)

(declare-fun e!491461 () Bool)

(assert (=> b!883052 (= e!491461 tp_is_empty!17663)))

(declare-fun b!883053 () Bool)

(declare-fun res!599925 () Bool)

(assert (=> b!883053 (=> (not res!599925) (not e!491464))))

(assert (=> b!883053 (= res!599925 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25185 _keys!868))))))

(declare-fun b!883054 () Bool)

(assert (=> b!883054 (= e!491460 (not e!491462))))

(declare-fun res!599922 () Bool)

(assert (=> b!883054 (=> res!599922 e!491462)))

(assert (=> b!883054 (= res!599922 (not (validKeyInArray!0 (select (arr!24745 _keys!868) from!1053))))))

(declare-fun lt!399574 () ListLongMap!10529)

(assert (=> b!883054 (= lt!399574 lt!399573)))

(declare-fun lt!399581 () ListLongMap!10529)

(assert (=> b!883054 (= lt!399573 (+!2549 lt!399581 (tuple2!11761 k!854 v!557)))))

(assert (=> b!883054 (= lt!399574 (getCurrentListMapNoExtraKeys!3241 _keys!868 lt!399576 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883054 (= lt!399581 (getCurrentListMapNoExtraKeys!3241 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399578 () Unit!30114)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!736 (array!51452 array!51454 (_ BitVec 32) (_ BitVec 32) V!28597 V!28597 (_ BitVec 32) (_ BitVec 64) V!28597 (_ BitVec 32) Int) Unit!30114)

(assert (=> b!883054 (= lt!399578 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!736 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883055 () Bool)

(declare-fun res!599921 () Bool)

(assert (=> b!883055 (=> (not res!599921) (not e!491464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51452 (_ BitVec 32)) Bool)

(assert (=> b!883055 (= res!599921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883056 () Bool)

(assert (=> b!883056 (= e!491458 true)))

(declare-fun lt!399579 () Bool)

(declare-fun contains!4277 (List!17570 (_ BitVec 64)) Bool)

(assert (=> b!883056 (= lt!399579 (contains!4277 Nil!17567 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!28131 () Bool)

(declare-fun mapRes!28131 () Bool)

(assert (=> mapIsEmpty!28131 mapRes!28131))

(declare-fun b!883057 () Bool)

(declare-fun res!599934 () Bool)

(assert (=> b!883057 (=> (not res!599934) (not e!491464))))

(assert (=> b!883057 (= res!599934 (and (= (select (arr!24745 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!883058 () Bool)

(declare-fun res!599933 () Bool)

(assert (=> b!883058 (=> res!599933 e!491458)))

(assert (=> b!883058 (= res!599933 (contains!4277 Nil!17567 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!28131 () Bool)

(declare-fun tp!53959 () Bool)

(declare-fun e!491459 () Bool)

(assert (=> mapNonEmpty!28131 (= mapRes!28131 (and tp!53959 e!491459))))

(declare-fun mapRest!28131 () (Array (_ BitVec 32) ValueCell!8392))

(declare-fun mapKey!28131 () (_ BitVec 32))

(declare-fun mapValue!28131 () ValueCell!8392)

(assert (=> mapNonEmpty!28131 (= (arr!24746 _values!688) (store mapRest!28131 mapKey!28131 mapValue!28131))))

(declare-fun b!883059 () Bool)

(assert (=> b!883059 (= e!491465 (and e!491461 mapRes!28131))))

(declare-fun condMapEmpty!28131 () Bool)

(declare-fun mapDefault!28131 () ValueCell!8392)

