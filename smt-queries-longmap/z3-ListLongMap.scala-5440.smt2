; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72426 () Bool)

(assert start!72426)

(declare-fun b_free!13611 () Bool)

(declare-fun b_next!13611 () Bool)

(assert (=> start!72426 (= b_free!13611 (not b_next!13611))))

(declare-fun tp!47932 () Bool)

(declare-fun b_and!22697 () Bool)

(assert (=> start!72426 (= tp!47932 b_and!22697)))

(declare-fun b!839726 () Bool)

(declare-fun e!468611 () Bool)

(declare-datatypes ((V!25683 0))(
  ( (V!25684 (val!7786 Int)) )
))
(declare-datatypes ((tuple2!10312 0))(
  ( (tuple2!10313 (_1!5167 (_ BitVec 64)) (_2!5167 V!25683)) )
))
(declare-datatypes ((List!16109 0))(
  ( (Nil!16106) (Cons!16105 (h!17236 tuple2!10312) (t!22480 List!16109)) )
))
(declare-datatypes ((ListLongMap!9081 0))(
  ( (ListLongMap!9082 (toList!4556 List!16109)) )
))
(declare-fun call!37066 () ListLongMap!9081)

(declare-fun call!37067 () ListLongMap!9081)

(assert (=> b!839726 (= e!468611 (= call!37066 call!37067))))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37063 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7299 0))(
  ( (ValueCellFull!7299 (v!10211 V!25683)) (EmptyCell!7299) )
))
(declare-datatypes ((array!47236 0))(
  ( (array!47237 (arr!22649 (Array (_ BitVec 32) ValueCell!7299)) (size!23089 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47236)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25683)

(declare-fun zeroValue!654 () V!25683)

(declare-datatypes ((array!47238 0))(
  ( (array!47239 (arr!22650 (Array (_ BitVec 32) (_ BitVec 64))) (size!23090 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47238)

(declare-fun getCurrentListMapNoExtraKeys!2546 (array!47238 array!47236 (_ BitVec 32) (_ BitVec 32) V!25683 V!25683 (_ BitVec 32) Int) ListLongMap!9081)

(assert (=> bm!37063 (= call!37067 (getCurrentListMapNoExtraKeys!2546 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839727 () Bool)

(declare-fun res!570928 () Bool)

(declare-fun e!468613 () Bool)

(assert (=> b!839727 (=> (not res!570928) (not e!468613))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839727 (= res!570928 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23090 _keys!868))))))

(declare-fun b!839728 () Bool)

(declare-fun e!468616 () Bool)

(declare-fun e!468615 () Bool)

(declare-fun mapRes!24815 () Bool)

(assert (=> b!839728 (= e!468616 (and e!468615 mapRes!24815))))

(declare-fun condMapEmpty!24815 () Bool)

(declare-fun mapDefault!24815 () ValueCell!7299)

(assert (=> b!839728 (= condMapEmpty!24815 (= (arr!22649 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7299)) mapDefault!24815)))))

(declare-fun v!557 () V!25683)

(declare-fun b!839729 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2027 (ListLongMap!9081 tuple2!10312) ListLongMap!9081)

(assert (=> b!839729 (= e!468611 (= call!37066 (+!2027 call!37067 (tuple2!10313 k0!854 v!557))))))

(declare-fun b!839730 () Bool)

(declare-fun res!570925 () Bool)

(assert (=> b!839730 (=> (not res!570925) (not e!468613))))

(assert (=> b!839730 (= res!570925 (and (= (size!23089 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23090 _keys!868) (size!23089 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839731 () Bool)

(declare-fun res!570924 () Bool)

(assert (=> b!839731 (=> (not res!570924) (not e!468613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47238 (_ BitVec 32)) Bool)

(assert (=> b!839731 (= res!570924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839732 () Bool)

(declare-fun res!570927 () Bool)

(assert (=> b!839732 (=> (not res!570927) (not e!468613))))

(assert (=> b!839732 (= res!570927 (and (= (select (arr!22650 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23090 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!24815 () Bool)

(assert (=> mapIsEmpty!24815 mapRes!24815))

(declare-fun b!839733 () Bool)

(assert (=> b!839733 (= e!468613 (not true))))

(assert (=> b!839733 e!468611))

(declare-fun c!91276 () Bool)

(assert (=> b!839733 (= c!91276 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28841 0))(
  ( (Unit!28842) )
))
(declare-fun lt!380782 () Unit!28841)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!266 (array!47238 array!47236 (_ BitVec 32) (_ BitVec 32) V!25683 V!25683 (_ BitVec 32) (_ BitVec 64) V!25683 (_ BitVec 32) Int) Unit!28841)

(assert (=> b!839733 (= lt!380782 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!266 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839734 () Bool)

(declare-fun e!468614 () Bool)

(declare-fun tp_is_empty!15477 () Bool)

(assert (=> b!839734 (= e!468614 tp_is_empty!15477)))

(declare-fun b!839735 () Bool)

(assert (=> b!839735 (= e!468615 tp_is_empty!15477)))

(declare-fun bm!37064 () Bool)

(assert (=> bm!37064 (= call!37066 (getCurrentListMapNoExtraKeys!2546 _keys!868 (array!47237 (store (arr!22649 _values!688) i!612 (ValueCellFull!7299 v!557)) (size!23089 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839737 () Bool)

(declare-fun res!570922 () Bool)

(assert (=> b!839737 (=> (not res!570922) (not e!468613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839737 (= res!570922 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24815 () Bool)

(declare-fun tp!47931 () Bool)

(assert (=> mapNonEmpty!24815 (= mapRes!24815 (and tp!47931 e!468614))))

(declare-fun mapValue!24815 () ValueCell!7299)

(declare-fun mapKey!24815 () (_ BitVec 32))

(declare-fun mapRest!24815 () (Array (_ BitVec 32) ValueCell!7299))

(assert (=> mapNonEmpty!24815 (= (arr!22649 _values!688) (store mapRest!24815 mapKey!24815 mapValue!24815))))

(declare-fun b!839738 () Bool)

(declare-fun res!570923 () Bool)

(assert (=> b!839738 (=> (not res!570923) (not e!468613))))

(declare-datatypes ((List!16110 0))(
  ( (Nil!16107) (Cons!16106 (h!17237 (_ BitVec 64)) (t!22481 List!16110)) )
))
(declare-fun arrayNoDuplicates!0 (array!47238 (_ BitVec 32) List!16110) Bool)

(assert (=> b!839738 (= res!570923 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16107))))

(declare-fun b!839736 () Bool)

(declare-fun res!570929 () Bool)

(assert (=> b!839736 (=> (not res!570929) (not e!468613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839736 (= res!570929 (validKeyInArray!0 k0!854))))

(declare-fun res!570926 () Bool)

(assert (=> start!72426 (=> (not res!570926) (not e!468613))))

(assert (=> start!72426 (= res!570926 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23090 _keys!868))))))

(assert (=> start!72426 e!468613))

(assert (=> start!72426 tp_is_empty!15477))

(assert (=> start!72426 true))

(assert (=> start!72426 tp!47932))

(declare-fun array_inv!18042 (array!47238) Bool)

(assert (=> start!72426 (array_inv!18042 _keys!868)))

(declare-fun array_inv!18043 (array!47236) Bool)

(assert (=> start!72426 (and (array_inv!18043 _values!688) e!468616)))

(assert (= (and start!72426 res!570926) b!839737))

(assert (= (and b!839737 res!570922) b!839730))

(assert (= (and b!839730 res!570925) b!839731))

(assert (= (and b!839731 res!570924) b!839738))

(assert (= (and b!839738 res!570923) b!839727))

(assert (= (and b!839727 res!570928) b!839736))

(assert (= (and b!839736 res!570929) b!839732))

(assert (= (and b!839732 res!570927) b!839733))

(assert (= (and b!839733 c!91276) b!839729))

(assert (= (and b!839733 (not c!91276)) b!839726))

(assert (= (or b!839729 b!839726) bm!37064))

(assert (= (or b!839729 b!839726) bm!37063))

(assert (= (and b!839728 condMapEmpty!24815) mapIsEmpty!24815))

(assert (= (and b!839728 (not condMapEmpty!24815)) mapNonEmpty!24815))

(get-info :version)

(assert (= (and mapNonEmpty!24815 ((_ is ValueCellFull!7299) mapValue!24815)) b!839734))

(assert (= (and b!839728 ((_ is ValueCellFull!7299) mapDefault!24815)) b!839735))

(assert (= start!72426 b!839728))

(declare-fun m!783737 () Bool)

(assert (=> bm!37063 m!783737))

(declare-fun m!783739 () Bool)

(assert (=> b!839733 m!783739))

(declare-fun m!783741 () Bool)

(assert (=> b!839738 m!783741))

(declare-fun m!783743 () Bool)

(assert (=> bm!37064 m!783743))

(declare-fun m!783745 () Bool)

(assert (=> bm!37064 m!783745))

(declare-fun m!783747 () Bool)

(assert (=> b!839736 m!783747))

(declare-fun m!783749 () Bool)

(assert (=> b!839732 m!783749))

(declare-fun m!783751 () Bool)

(assert (=> b!839731 m!783751))

(declare-fun m!783753 () Bool)

(assert (=> b!839737 m!783753))

(declare-fun m!783755 () Bool)

(assert (=> mapNonEmpty!24815 m!783755))

(declare-fun m!783757 () Bool)

(assert (=> start!72426 m!783757))

(declare-fun m!783759 () Bool)

(assert (=> start!72426 m!783759))

(declare-fun m!783761 () Bool)

(assert (=> b!839729 m!783761))

(check-sat (not b!839731) tp_is_empty!15477 (not b!839738) (not b!839737) (not b!839729) (not b!839733) (not bm!37063) (not b!839736) (not b_next!13611) (not start!72426) b_and!22697 (not mapNonEmpty!24815) (not bm!37064))
(check-sat b_and!22697 (not b_next!13611))
