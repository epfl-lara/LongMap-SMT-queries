; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73550 () Bool)

(assert start!73550)

(declare-fun b_free!14465 () Bool)

(declare-fun b_next!14465 () Bool)

(assert (=> start!73550 (= b_free!14465 (not b_next!14465))))

(declare-fun tp!50898 () Bool)

(declare-fun b_and!23909 () Bool)

(assert (=> start!73550 (= tp!50898 b_and!23909)))

(declare-fun b!859919 () Bool)

(declare-fun e!479200 () Bool)

(declare-fun tp_is_empty!16601 () Bool)

(assert (=> b!859919 (= e!479200 tp_is_empty!16601)))

(declare-fun b!859920 () Bool)

(declare-fun res!584324 () Bool)

(declare-fun e!479196 () Bool)

(assert (=> b!859920 (=> res!584324 e!479196)))

(declare-datatypes ((List!16837 0))(
  ( (Nil!16834) (Cons!16833 (h!17964 (_ BitVec 64)) (t!23568 List!16837)) )
))
(declare-fun contains!4227 (List!16837 (_ BitVec 64)) Bool)

(assert (=> b!859920 (= res!584324 (contains!4227 Nil!16834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!584335 () Bool)

(declare-fun e!479197 () Bool)

(assert (=> start!73550 (=> (not res!584335) (not e!479197))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49378 0))(
  ( (array!49379 (arr!23720 (Array (_ BitVec 32) (_ BitVec 64))) (size!24160 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49378)

(assert (=> start!73550 (= res!584335 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24160 _keys!868))))))

(assert (=> start!73550 e!479197))

(assert (=> start!73550 tp_is_empty!16601))

(assert (=> start!73550 true))

(assert (=> start!73550 tp!50898))

(declare-fun array_inv!18778 (array!49378) Bool)

(assert (=> start!73550 (array_inv!18778 _keys!868)))

(declare-datatypes ((V!27181 0))(
  ( (V!27182 (val!8348 Int)) )
))
(declare-datatypes ((ValueCell!7861 0))(
  ( (ValueCellFull!7861 (v!10773 V!27181)) (EmptyCell!7861) )
))
(declare-datatypes ((array!49380 0))(
  ( (array!49381 (arr!23721 (Array (_ BitVec 32) ValueCell!7861)) (size!24161 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49380)

(declare-fun e!479193 () Bool)

(declare-fun array_inv!18779 (array!49380) Bool)

(assert (=> start!73550 (and (array_inv!18779 _values!688) e!479193)))

(declare-fun b!859921 () Bool)

(declare-fun res!584326 () Bool)

(assert (=> b!859921 (=> (not res!584326) (not e!479197))))

(declare-fun arrayNoDuplicates!0 (array!49378 (_ BitVec 32) List!16837) Bool)

(assert (=> b!859921 (= res!584326 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16834))))

(declare-fun b!859922 () Bool)

(declare-fun e!479192 () Bool)

(assert (=> b!859922 (= e!479192 e!479196)))

(declare-fun res!584331 () Bool)

(assert (=> b!859922 (=> res!584331 e!479196)))

(assert (=> b!859922 (= res!584331 (or (bvsge (size!24160 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24160 _keys!868)) (bvsge from!1053 (size!24160 _keys!868))))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!49378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859922 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29317 0))(
  ( (Unit!29318) )
))
(declare-fun lt!387537 () Unit!29317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49378 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29317)

(assert (=> b!859922 (= lt!387537 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!859922 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16834)))

(declare-fun lt!387542 () Unit!29317)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49378 (_ BitVec 32) (_ BitVec 32)) Unit!29317)

(assert (=> b!859922 (= lt!387542 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859923 () Bool)

(declare-fun res!584327 () Bool)

(assert (=> b!859923 (=> (not res!584327) (not e!479197))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859923 (= res!584327 (validMask!0 mask!1196))))

(declare-fun b!859924 () Bool)

(declare-fun res!584334 () Bool)

(assert (=> b!859924 (=> res!584334 e!479196)))

(declare-fun noDuplicate!1309 (List!16837) Bool)

(assert (=> b!859924 (= res!584334 (not (noDuplicate!1309 Nil!16834)))))

(declare-fun b!859925 () Bool)

(declare-fun res!584330 () Bool)

(assert (=> b!859925 (=> (not res!584330) (not e!479197))))

(assert (=> b!859925 (= res!584330 (and (= (select (arr!23720 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!859926 () Bool)

(declare-fun e!479198 () Bool)

(declare-fun e!479195 () Bool)

(assert (=> b!859926 (= e!479198 (not e!479195))))

(declare-fun res!584336 () Bool)

(assert (=> b!859926 (=> res!584336 e!479195)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859926 (= res!584336 (not (validKeyInArray!0 (select (arr!23720 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11028 0))(
  ( (tuple2!11029 (_1!5525 (_ BitVec 64)) (_2!5525 V!27181)) )
))
(declare-datatypes ((List!16838 0))(
  ( (Nil!16835) (Cons!16834 (h!17965 tuple2!11028) (t!23569 List!16838)) )
))
(declare-datatypes ((ListLongMap!9797 0))(
  ( (ListLongMap!9798 (toList!4914 List!16838)) )
))
(declare-fun lt!387541 () ListLongMap!9797)

(declare-fun lt!387544 () ListLongMap!9797)

(assert (=> b!859926 (= lt!387541 lt!387544)))

(declare-fun lt!387535 () ListLongMap!9797)

(declare-fun v!557 () V!27181)

(declare-fun +!2267 (ListLongMap!9797 tuple2!11028) ListLongMap!9797)

(assert (=> b!859926 (= lt!387544 (+!2267 lt!387535 (tuple2!11029 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!387536 () array!49380)

(declare-fun minValue!654 () V!27181)

(declare-fun zeroValue!654 () V!27181)

(declare-fun getCurrentListMapNoExtraKeys!2892 (array!49378 array!49380 (_ BitVec 32) (_ BitVec 32) V!27181 V!27181 (_ BitVec 32) Int) ListLongMap!9797)

(assert (=> b!859926 (= lt!387541 (getCurrentListMapNoExtraKeys!2892 _keys!868 lt!387536 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859926 (= lt!387535 (getCurrentListMapNoExtraKeys!2892 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387543 () Unit!29317)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!482 (array!49378 array!49380 (_ BitVec 32) (_ BitVec 32) V!27181 V!27181 (_ BitVec 32) (_ BitVec 64) V!27181 (_ BitVec 32) Int) Unit!29317)

(assert (=> b!859926 (= lt!387543 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!482 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859927 () Bool)

(assert (=> b!859927 (= e!479197 e!479198)))

(declare-fun res!584328 () Bool)

(assert (=> b!859927 (=> (not res!584328) (not e!479198))))

(assert (=> b!859927 (= res!584328 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387540 () ListLongMap!9797)

(assert (=> b!859927 (= lt!387540 (getCurrentListMapNoExtraKeys!2892 _keys!868 lt!387536 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!859927 (= lt!387536 (array!49381 (store (arr!23721 _values!688) i!612 (ValueCellFull!7861 v!557)) (size!24161 _values!688)))))

(declare-fun lt!387539 () ListLongMap!9797)

(assert (=> b!859927 (= lt!387539 (getCurrentListMapNoExtraKeys!2892 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859928 () Bool)

(declare-fun e!479199 () Bool)

(assert (=> b!859928 (= e!479199 tp_is_empty!16601)))

(declare-fun mapNonEmpty!26501 () Bool)

(declare-fun mapRes!26501 () Bool)

(declare-fun tp!50899 () Bool)

(assert (=> mapNonEmpty!26501 (= mapRes!26501 (and tp!50899 e!479200))))

(declare-fun mapKey!26501 () (_ BitVec 32))

(declare-fun mapRest!26501 () (Array (_ BitVec 32) ValueCell!7861))

(declare-fun mapValue!26501 () ValueCell!7861)

(assert (=> mapNonEmpty!26501 (= (arr!23721 _values!688) (store mapRest!26501 mapKey!26501 mapValue!26501))))

(declare-fun b!859929 () Bool)

(assert (=> b!859929 (= e!479196 true)))

(declare-fun lt!387538 () Bool)

(assert (=> b!859929 (= lt!387538 (contains!4227 Nil!16834 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859930 () Bool)

(assert (=> b!859930 (= e!479193 (and e!479199 mapRes!26501))))

(declare-fun condMapEmpty!26501 () Bool)

(declare-fun mapDefault!26501 () ValueCell!7861)

