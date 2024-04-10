; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74824 () Bool)

(assert start!74824)

(declare-fun b_free!15401 () Bool)

(declare-fun b_next!15401 () Bool)

(assert (=> start!74824 (= b_free!15401 (not b_next!15401))))

(declare-fun tp!53899 () Bool)

(declare-fun b_and!25469 () Bool)

(assert (=> start!74824 (= tp!53899 b_and!25469)))

(declare-fun res!599408 () Bool)

(declare-fun e!491004 () Bool)

(assert (=> start!74824 (=> (not res!599408) (not e!491004))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51416 0))(
  ( (array!51417 (arr!24729 (Array (_ BitVec 32) (_ BitVec 64))) (size!25169 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51416)

(assert (=> start!74824 (= res!599408 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25169 _keys!868))))))

(assert (=> start!74824 e!491004))

(declare-fun tp_is_empty!17645 () Bool)

(assert (=> start!74824 tp_is_empty!17645))

(assert (=> start!74824 true))

(assert (=> start!74824 tp!53899))

(declare-fun array_inv!19472 (array!51416) Bool)

(assert (=> start!74824 (array_inv!19472 _keys!868)))

(declare-datatypes ((V!28573 0))(
  ( (V!28574 (val!8870 Int)) )
))
(declare-datatypes ((ValueCell!8383 0))(
  ( (ValueCellFull!8383 (v!11330 V!28573)) (EmptyCell!8383) )
))
(declare-datatypes ((array!51418 0))(
  ( (array!51419 (arr!24730 (Array (_ BitVec 32) ValueCell!8383)) (size!25170 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51418)

(declare-fun e!491002 () Bool)

(declare-fun array_inv!19473 (array!51418) Bool)

(assert (=> start!74824 (and (array_inv!19473 _values!688) e!491002)))

(declare-fun b!882268 () Bool)

(declare-fun e!491008 () Bool)

(assert (=> b!882268 (= e!491004 e!491008)))

(declare-fun res!599417 () Bool)

(assert (=> b!882268 (=> (not res!599417) (not e!491008))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!882268 (= res!599417 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399158 () array!51418)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11746 0))(
  ( (tuple2!11747 (_1!5884 (_ BitVec 64)) (_2!5884 V!28573)) )
))
(declare-datatypes ((List!17555 0))(
  ( (Nil!17552) (Cons!17551 (h!18682 tuple2!11746) (t!24758 List!17555)) )
))
(declare-datatypes ((ListLongMap!10515 0))(
  ( (ListLongMap!10516 (toList!5273 List!17555)) )
))
(declare-fun lt!399157 () ListLongMap!10515)

(declare-fun minValue!654 () V!28573)

(declare-fun zeroValue!654 () V!28573)

(declare-fun getCurrentListMapNoExtraKeys!3234 (array!51416 array!51418 (_ BitVec 32) (_ BitVec 32) V!28573 V!28573 (_ BitVec 32) Int) ListLongMap!10515)

(assert (=> b!882268 (= lt!399157 (getCurrentListMapNoExtraKeys!3234 _keys!868 lt!399158 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28573)

(assert (=> b!882268 (= lt!399158 (array!51419 (store (arr!24730 _values!688) i!612 (ValueCellFull!8383 v!557)) (size!25170 _values!688)))))

(declare-fun lt!399164 () ListLongMap!10515)

(assert (=> b!882268 (= lt!399164 (getCurrentListMapNoExtraKeys!3234 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882269 () Bool)

(declare-fun res!599409 () Bool)

(assert (=> b!882269 (=> (not res!599409) (not e!491004))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!882269 (= res!599409 (and (= (select (arr!24729 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!882270 () Bool)

(declare-fun res!599410 () Bool)

(assert (=> b!882270 (=> (not res!599410) (not e!491004))))

(assert (=> b!882270 (= res!599410 (and (= (size!25170 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25169 _keys!868) (size!25170 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882271 () Bool)

(declare-fun e!491009 () Bool)

(declare-datatypes ((List!17556 0))(
  ( (Nil!17553) (Cons!17552 (h!18683 (_ BitVec 64)) (t!24759 List!17556)) )
))
(declare-fun noDuplicate!1320 (List!17556) Bool)

(assert (=> b!882271 (= e!491009 (noDuplicate!1320 Nil!17553))))

(declare-fun b!882272 () Bool)

(declare-fun e!491005 () Bool)

(assert (=> b!882272 (= e!491005 tp_is_empty!17645)))

(declare-fun b!882273 () Bool)

(declare-fun res!599413 () Bool)

(assert (=> b!882273 (=> (not res!599413) (not e!491004))))

(assert (=> b!882273 (= res!599413 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25169 _keys!868))))))

(declare-fun b!882274 () Bool)

(declare-fun res!599416 () Bool)

(assert (=> b!882274 (=> (not res!599416) (not e!491004))))

(declare-fun arrayNoDuplicates!0 (array!51416 (_ BitVec 32) List!17556) Bool)

(assert (=> b!882274 (= res!599416 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17553))))

(declare-fun b!882275 () Bool)

(declare-fun res!599411 () Bool)

(assert (=> b!882275 (=> (not res!599411) (not e!491004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882275 (= res!599411 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!28098 () Bool)

(declare-fun mapRes!28098 () Bool)

(assert (=> mapIsEmpty!28098 mapRes!28098))

(declare-fun b!882276 () Bool)

(declare-fun e!491010 () Bool)

(assert (=> b!882276 (= e!491010 e!491009)))

(declare-fun res!599407 () Bool)

(assert (=> b!882276 (=> res!599407 e!491009)))

(assert (=> b!882276 (= res!599407 (or (bvsge (size!25169 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25169 _keys!868)) (bvsge from!1053 (size!25169 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882276 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!30102 0))(
  ( (Unit!30103) )
))
(declare-fun lt!399156 () Unit!30102)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51416 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30102)

(assert (=> b!882276 (= lt!399156 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882276 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17553)))

(declare-fun lt!399163 () Unit!30102)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51416 (_ BitVec 32) (_ BitVec 32)) Unit!30102)

(assert (=> b!882276 (= lt!399163 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882277 () Bool)

(declare-fun e!491007 () Bool)

(assert (=> b!882277 (= e!491007 tp_is_empty!17645)))

(declare-fun b!882278 () Bool)

(declare-fun e!491003 () Bool)

(assert (=> b!882278 (= e!491008 (not e!491003))))

(declare-fun res!599412 () Bool)

(assert (=> b!882278 (=> res!599412 e!491003)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882278 (= res!599412 (not (validKeyInArray!0 (select (arr!24729 _keys!868) from!1053))))))

(declare-fun lt!399161 () ListLongMap!10515)

(declare-fun lt!399162 () ListLongMap!10515)

(assert (=> b!882278 (= lt!399161 lt!399162)))

(declare-fun lt!399160 () ListLongMap!10515)

(declare-fun +!2543 (ListLongMap!10515 tuple2!11746) ListLongMap!10515)

(assert (=> b!882278 (= lt!399162 (+!2543 lt!399160 (tuple2!11747 k!854 v!557)))))

(assert (=> b!882278 (= lt!399161 (getCurrentListMapNoExtraKeys!3234 _keys!868 lt!399158 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882278 (= lt!399160 (getCurrentListMapNoExtraKeys!3234 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399159 () Unit!30102)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!730 (array!51416 array!51418 (_ BitVec 32) (_ BitVec 32) V!28573 V!28573 (_ BitVec 32) (_ BitVec 64) V!28573 (_ BitVec 32) Int) Unit!30102)

(assert (=> b!882278 (= lt!399159 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!730 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882279 () Bool)

(assert (=> b!882279 (= e!491002 (and e!491007 mapRes!28098))))

(declare-fun condMapEmpty!28098 () Bool)

(declare-fun mapDefault!28098 () ValueCell!8383)

