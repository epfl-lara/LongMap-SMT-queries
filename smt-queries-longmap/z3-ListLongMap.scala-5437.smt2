; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72408 () Bool)

(assert start!72408)

(declare-fun b_free!13593 () Bool)

(declare-fun b_next!13593 () Bool)

(assert (=> start!72408 (= b_free!13593 (not b_next!13593))))

(declare-fun tp!47877 () Bool)

(declare-fun b_and!22679 () Bool)

(assert (=> start!72408 (= tp!47877 b_and!22679)))

(declare-fun b!839375 () Bool)

(declare-fun res!570707 () Bool)

(declare-fun e!468449 () Bool)

(assert (=> b!839375 (=> (not res!570707) (not e!468449))))

(declare-datatypes ((array!47200 0))(
  ( (array!47201 (arr!22631 (Array (_ BitVec 32) (_ BitVec 64))) (size!23071 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47200)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47200 (_ BitVec 32)) Bool)

(assert (=> b!839375 (= res!570707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839376 () Bool)

(declare-fun e!468451 () Bool)

(declare-fun tp_is_empty!15459 () Bool)

(assert (=> b!839376 (= e!468451 tp_is_empty!15459)))

(declare-datatypes ((V!25659 0))(
  ( (V!25660 (val!7777 Int)) )
))
(declare-datatypes ((tuple2!10294 0))(
  ( (tuple2!10295 (_1!5158 (_ BitVec 64)) (_2!5158 V!25659)) )
))
(declare-datatypes ((List!16093 0))(
  ( (Nil!16090) (Cons!16089 (h!17220 tuple2!10294) (t!22464 List!16093)) )
))
(declare-datatypes ((ListLongMap!9063 0))(
  ( (ListLongMap!9064 (toList!4547 List!16093)) )
))
(declare-fun call!37013 () ListLongMap!9063)

(declare-fun v!557 () V!25659)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37009 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7290 0))(
  ( (ValueCellFull!7290 (v!10202 V!25659)) (EmptyCell!7290) )
))
(declare-datatypes ((array!47202 0))(
  ( (array!47203 (arr!22632 (Array (_ BitVec 32) ValueCell!7290)) (size!23072 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47202)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25659)

(declare-fun zeroValue!654 () V!25659)

(declare-fun getCurrentListMapNoExtraKeys!2537 (array!47200 array!47202 (_ BitVec 32) (_ BitVec 32) V!25659 V!25659 (_ BitVec 32) Int) ListLongMap!9063)

(assert (=> bm!37009 (= call!37013 (getCurrentListMapNoExtraKeys!2537 _keys!868 (array!47203 (store (arr!22632 _values!688) i!612 (ValueCellFull!7290 v!557)) (size!23072 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37012 () ListLongMap!9063)

(declare-fun bm!37010 () Bool)

(assert (=> bm!37010 (= call!37012 (getCurrentListMapNoExtraKeys!2537 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839377 () Bool)

(declare-fun res!570711 () Bool)

(assert (=> b!839377 (=> (not res!570711) (not e!468449))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!839377 (= res!570711 (and (= (select (arr!22631 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23071 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839378 () Bool)

(declare-fun e!468453 () Bool)

(assert (=> b!839378 (= e!468453 (= call!37013 call!37012))))

(declare-fun b!839379 () Bool)

(declare-fun e!468454 () Bool)

(declare-fun mapRes!24788 () Bool)

(assert (=> b!839379 (= e!468454 (and e!468451 mapRes!24788))))

(declare-fun condMapEmpty!24788 () Bool)

(declare-fun mapDefault!24788 () ValueCell!7290)

(assert (=> b!839379 (= condMapEmpty!24788 (= (arr!22632 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7290)) mapDefault!24788)))))

(declare-fun b!839380 () Bool)

(assert (=> b!839380 (= e!468449 (not true))))

(assert (=> b!839380 e!468453))

(declare-fun c!91249 () Bool)

(assert (=> b!839380 (= c!91249 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28827 0))(
  ( (Unit!28828) )
))
(declare-fun lt!380755 () Unit!28827)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!259 (array!47200 array!47202 (_ BitVec 32) (_ BitVec 32) V!25659 V!25659 (_ BitVec 32) (_ BitVec 64) V!25659 (_ BitVec 32) Int) Unit!28827)

(assert (=> b!839380 (= lt!380755 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!259 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!570712 () Bool)

(assert (=> start!72408 (=> (not res!570712) (not e!468449))))

(assert (=> start!72408 (= res!570712 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23071 _keys!868))))))

(assert (=> start!72408 e!468449))

(assert (=> start!72408 tp_is_empty!15459))

(assert (=> start!72408 true))

(assert (=> start!72408 tp!47877))

(declare-fun array_inv!18028 (array!47200) Bool)

(assert (=> start!72408 (array_inv!18028 _keys!868)))

(declare-fun array_inv!18029 (array!47202) Bool)

(assert (=> start!72408 (and (array_inv!18029 _values!688) e!468454)))

(declare-fun b!839381 () Bool)

(declare-fun +!2019 (ListLongMap!9063 tuple2!10294) ListLongMap!9063)

(assert (=> b!839381 (= e!468453 (= call!37013 (+!2019 call!37012 (tuple2!10295 k0!854 v!557))))))

(declare-fun b!839382 () Bool)

(declare-fun res!570709 () Bool)

(assert (=> b!839382 (=> (not res!570709) (not e!468449))))

(assert (=> b!839382 (= res!570709 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23071 _keys!868))))))

(declare-fun b!839383 () Bool)

(declare-fun res!570710 () Bool)

(assert (=> b!839383 (=> (not res!570710) (not e!468449))))

(declare-datatypes ((List!16094 0))(
  ( (Nil!16091) (Cons!16090 (h!17221 (_ BitVec 64)) (t!22465 List!16094)) )
))
(declare-fun arrayNoDuplicates!0 (array!47200 (_ BitVec 32) List!16094) Bool)

(assert (=> b!839383 (= res!570710 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16091))))

(declare-fun mapIsEmpty!24788 () Bool)

(assert (=> mapIsEmpty!24788 mapRes!24788))

(declare-fun b!839384 () Bool)

(declare-fun res!570706 () Bool)

(assert (=> b!839384 (=> (not res!570706) (not e!468449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839384 (= res!570706 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24788 () Bool)

(declare-fun tp!47878 () Bool)

(declare-fun e!468452 () Bool)

(assert (=> mapNonEmpty!24788 (= mapRes!24788 (and tp!47878 e!468452))))

(declare-fun mapKey!24788 () (_ BitVec 32))

(declare-fun mapRest!24788 () (Array (_ BitVec 32) ValueCell!7290))

(declare-fun mapValue!24788 () ValueCell!7290)

(assert (=> mapNonEmpty!24788 (= (arr!22632 _values!688) (store mapRest!24788 mapKey!24788 mapValue!24788))))

(declare-fun b!839385 () Bool)

(assert (=> b!839385 (= e!468452 tp_is_empty!15459)))

(declare-fun b!839386 () Bool)

(declare-fun res!570708 () Bool)

(assert (=> b!839386 (=> (not res!570708) (not e!468449))))

(assert (=> b!839386 (= res!570708 (and (= (size!23072 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23071 _keys!868) (size!23072 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839387 () Bool)

(declare-fun res!570713 () Bool)

(assert (=> b!839387 (=> (not res!570713) (not e!468449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839387 (= res!570713 (validKeyInArray!0 k0!854))))

(assert (= (and start!72408 res!570712) b!839384))

(assert (= (and b!839384 res!570706) b!839386))

(assert (= (and b!839386 res!570708) b!839375))

(assert (= (and b!839375 res!570707) b!839383))

(assert (= (and b!839383 res!570710) b!839382))

(assert (= (and b!839382 res!570709) b!839387))

(assert (= (and b!839387 res!570713) b!839377))

(assert (= (and b!839377 res!570711) b!839380))

(assert (= (and b!839380 c!91249) b!839381))

(assert (= (and b!839380 (not c!91249)) b!839378))

(assert (= (or b!839381 b!839378) bm!37009))

(assert (= (or b!839381 b!839378) bm!37010))

(assert (= (and b!839379 condMapEmpty!24788) mapIsEmpty!24788))

(assert (= (and b!839379 (not condMapEmpty!24788)) mapNonEmpty!24788))

(get-info :version)

(assert (= (and mapNonEmpty!24788 ((_ is ValueCellFull!7290) mapValue!24788)) b!839385))

(assert (= (and b!839379 ((_ is ValueCellFull!7290) mapDefault!24788)) b!839376))

(assert (= start!72408 b!839379))

(declare-fun m!783503 () Bool)

(assert (=> bm!37009 m!783503))

(declare-fun m!783505 () Bool)

(assert (=> bm!37009 m!783505))

(declare-fun m!783507 () Bool)

(assert (=> b!839387 m!783507))

(declare-fun m!783509 () Bool)

(assert (=> start!72408 m!783509))

(declare-fun m!783511 () Bool)

(assert (=> start!72408 m!783511))

(declare-fun m!783513 () Bool)

(assert (=> b!839383 m!783513))

(declare-fun m!783515 () Bool)

(assert (=> b!839381 m!783515))

(declare-fun m!783517 () Bool)

(assert (=> bm!37010 m!783517))

(declare-fun m!783519 () Bool)

(assert (=> b!839375 m!783519))

(declare-fun m!783521 () Bool)

(assert (=> b!839380 m!783521))

(declare-fun m!783523 () Bool)

(assert (=> b!839377 m!783523))

(declare-fun m!783525 () Bool)

(assert (=> mapNonEmpty!24788 m!783525))

(declare-fun m!783527 () Bool)

(assert (=> b!839384 m!783527))

(check-sat (not bm!37009) (not b!839375) (not start!72408) (not b!839384) tp_is_empty!15459 (not b!839381) (not b!839383) b_and!22679 (not b!839387) (not b!839380) (not mapNonEmpty!24788) (not b_next!13593) (not bm!37010))
(check-sat b_and!22679 (not b_next!13593))
