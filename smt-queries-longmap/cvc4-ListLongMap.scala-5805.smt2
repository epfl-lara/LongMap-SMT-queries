; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74906 () Bool)

(assert start!74906)

(declare-fun b_free!15425 () Bool)

(declare-fun b_next!15425 () Bool)

(assert (=> start!74906 (= b_free!15425 (not b_next!15425))))

(declare-fun tp!53977 () Bool)

(declare-fun b_and!25549 () Bool)

(assert (=> start!74906 (= tp!53977 b_and!25549)))

(declare-fun mapIsEmpty!28140 () Bool)

(declare-fun mapRes!28140 () Bool)

(assert (=> mapIsEmpty!28140 mapRes!28140))

(declare-fun res!600031 () Bool)

(declare-fun e!491536 () Bool)

(assert (=> start!74906 (=> (not res!600031) (not e!491536))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51464 0))(
  ( (array!51465 (arr!24751 (Array (_ BitVec 32) (_ BitVec 64))) (size!25191 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51464)

(assert (=> start!74906 (= res!600031 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25191 _keys!868))))))

(assert (=> start!74906 e!491536))

(declare-fun tp_is_empty!17669 () Bool)

(assert (=> start!74906 tp_is_empty!17669))

(assert (=> start!74906 true))

(assert (=> start!74906 tp!53977))

(declare-fun array_inv!19488 (array!51464) Bool)

(assert (=> start!74906 (array_inv!19488 _keys!868)))

(declare-datatypes ((V!28605 0))(
  ( (V!28606 (val!8882 Int)) )
))
(declare-datatypes ((ValueCell!8395 0))(
  ( (ValueCellFull!8395 (v!11351 V!28605)) (EmptyCell!8395) )
))
(declare-datatypes ((array!51466 0))(
  ( (array!51467 (arr!24752 (Array (_ BitVec 32) ValueCell!8395)) (size!25192 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51466)

(declare-fun e!491531 () Bool)

(declare-fun array_inv!19489 (array!51466) Bool)

(assert (=> start!74906 (and (array_inv!19489 _values!688) e!491531)))

(declare-fun b!883180 () Bool)

(declare-fun res!600027 () Bool)

(assert (=> b!883180 (=> (not res!600027) (not e!491536))))

(declare-datatypes ((List!17575 0))(
  ( (Nil!17572) (Cons!17571 (h!18702 (_ BitVec 64)) (t!24802 List!17575)) )
))
(declare-fun arrayNoDuplicates!0 (array!51464 (_ BitVec 32) List!17575) Bool)

(assert (=> b!883180 (= res!600027 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17572))))

(declare-fun b!883181 () Bool)

(declare-fun e!491535 () Bool)

(assert (=> b!883181 (= e!491535 tp_is_empty!17669)))

(declare-fun b!883182 () Bool)

(declare-fun res!600029 () Bool)

(assert (=> b!883182 (=> (not res!600029) (not e!491536))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!883182 (= res!600029 (and (= (select (arr!24751 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!883183 () Bool)

(declare-fun res!600025 () Bool)

(assert (=> b!883183 (=> (not res!600025) (not e!491536))))

(assert (=> b!883183 (= res!600025 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25191 _keys!868))))))

(declare-fun b!883184 () Bool)

(declare-fun e!491534 () Bool)

(assert (=> b!883184 (= e!491534 tp_is_empty!17669)))

(declare-fun b!883185 () Bool)

(declare-fun e!491533 () Bool)

(declare-fun e!491537 () Bool)

(assert (=> b!883185 (= e!491533 (not e!491537))))

(declare-fun res!600032 () Bool)

(assert (=> b!883185 (=> res!600032 e!491537)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883185 (= res!600032 (not (validKeyInArray!0 (select (arr!24751 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11766 0))(
  ( (tuple2!11767 (_1!5894 (_ BitVec 64)) (_2!5894 V!28605)) )
))
(declare-datatypes ((List!17576 0))(
  ( (Nil!17573) (Cons!17572 (h!18703 tuple2!11766) (t!24803 List!17576)) )
))
(declare-datatypes ((ListLongMap!10535 0))(
  ( (ListLongMap!10536 (toList!5283 List!17576)) )
))
(declare-fun lt!399670 () ListLongMap!10535)

(declare-fun lt!399664 () ListLongMap!10535)

(assert (=> b!883185 (= lt!399670 lt!399664)))

(declare-fun v!557 () V!28605)

(declare-fun lt!399662 () ListLongMap!10535)

(declare-fun +!2552 (ListLongMap!10535 tuple2!11766) ListLongMap!10535)

(assert (=> b!883185 (= lt!399664 (+!2552 lt!399662 (tuple2!11767 k!854 v!557)))))

(declare-fun lt!399663 () array!51466)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28605)

(declare-fun zeroValue!654 () V!28605)

(declare-fun getCurrentListMapNoExtraKeys!3243 (array!51464 array!51466 (_ BitVec 32) (_ BitVec 32) V!28605 V!28605 (_ BitVec 32) Int) ListLongMap!10535)

(assert (=> b!883185 (= lt!399670 (getCurrentListMapNoExtraKeys!3243 _keys!868 lt!399663 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883185 (= lt!399662 (getCurrentListMapNoExtraKeys!3243 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30120 0))(
  ( (Unit!30121) )
))
(declare-fun lt!399669 () Unit!30120)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!738 (array!51464 array!51466 (_ BitVec 32) (_ BitVec 32) V!28605 V!28605 (_ BitVec 32) (_ BitVec 64) V!28605 (_ BitVec 32) Int) Unit!30120)

(assert (=> b!883185 (= lt!399669 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!738 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883186 () Bool)

(declare-fun e!491538 () Bool)

(assert (=> b!883186 (= e!491538 true)))

(assert (=> b!883186 false))

(declare-fun lt!399666 () Unit!30120)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51464 (_ BitVec 64) (_ BitVec 32) List!17575) Unit!30120)

(assert (=> b!883186 (= lt!399666 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17572))))

(declare-fun arrayContainsKey!0 (array!51464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883186 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399665 () Unit!30120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51464 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30120)

(assert (=> b!883186 (= lt!399665 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!883186 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17572)))

(declare-fun lt!399667 () Unit!30120)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51464 (_ BitVec 32) (_ BitVec 32)) Unit!30120)

(assert (=> b!883186 (= lt!399667 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!883187 () Bool)

(declare-fun res!600024 () Bool)

(assert (=> b!883187 (=> (not res!600024) (not e!491536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883187 (= res!600024 (validMask!0 mask!1196))))

(declare-fun b!883188 () Bool)

(declare-fun res!600033 () Bool)

(assert (=> b!883188 (=> (not res!600033) (not e!491536))))

(assert (=> b!883188 (= res!600033 (validKeyInArray!0 k!854))))

(declare-fun b!883189 () Bool)

(declare-fun res!600030 () Bool)

(assert (=> b!883189 (=> (not res!600030) (not e!491536))))

(assert (=> b!883189 (= res!600030 (and (= (size!25192 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25191 _keys!868) (size!25192 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883190 () Bool)

(assert (=> b!883190 (= e!491536 e!491533)))

(declare-fun res!600026 () Bool)

(assert (=> b!883190 (=> (not res!600026) (not e!491533))))

(assert (=> b!883190 (= res!600026 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399668 () ListLongMap!10535)

(assert (=> b!883190 (= lt!399668 (getCurrentListMapNoExtraKeys!3243 _keys!868 lt!399663 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883190 (= lt!399663 (array!51467 (store (arr!24752 _values!688) i!612 (ValueCellFull!8395 v!557)) (size!25192 _values!688)))))

(declare-fun lt!399671 () ListLongMap!10535)

(assert (=> b!883190 (= lt!399671 (getCurrentListMapNoExtraKeys!3243 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!28140 () Bool)

(declare-fun tp!53978 () Bool)

(assert (=> mapNonEmpty!28140 (= mapRes!28140 (and tp!53978 e!491535))))

(declare-fun mapKey!28140 () (_ BitVec 32))

(declare-fun mapRest!28140 () (Array (_ BitVec 32) ValueCell!8395))

(declare-fun mapValue!28140 () ValueCell!8395)

(assert (=> mapNonEmpty!28140 (= (arr!24752 _values!688) (store mapRest!28140 mapKey!28140 mapValue!28140))))

(declare-fun b!883191 () Bool)

(assert (=> b!883191 (= e!491537 e!491538)))

(declare-fun res!600023 () Bool)

(assert (=> b!883191 (=> res!600023 e!491538)))

(assert (=> b!883191 (= res!600023 (not (= (select (arr!24751 _keys!868) from!1053) k!854)))))

(declare-fun get!13038 (ValueCell!8395 V!28605) V!28605)

(declare-fun dynLambda!1265 (Int (_ BitVec 64)) V!28605)

(assert (=> b!883191 (= lt!399668 (+!2552 lt!399664 (tuple2!11767 (select (arr!24751 _keys!868) from!1053) (get!13038 (select (arr!24752 _values!688) from!1053) (dynLambda!1265 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883192 () Bool)

(declare-fun res!600028 () Bool)

(assert (=> b!883192 (=> (not res!600028) (not e!491536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51464 (_ BitVec 32)) Bool)

(assert (=> b!883192 (= res!600028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883193 () Bool)

(assert (=> b!883193 (= e!491531 (and e!491534 mapRes!28140))))

(declare-fun condMapEmpty!28140 () Bool)

(declare-fun mapDefault!28140 () ValueCell!8395)

