; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72610 () Bool)

(assert start!72610)

(declare-fun b_free!13627 () Bool)

(declare-fun b_next!13627 () Bool)

(assert (=> start!72610 (= b_free!13627 (not b_next!13627))))

(declare-fun tp!47981 () Bool)

(declare-fun b_and!22723 () Bool)

(assert (=> start!72610 (= tp!47981 b_and!22723)))

(declare-fun mapNonEmpty!24839 () Bool)

(declare-fun mapRes!24839 () Bool)

(declare-fun tp!47980 () Bool)

(declare-fun e!469341 () Bool)

(assert (=> mapNonEmpty!24839 (= mapRes!24839 (and tp!47980 e!469341))))

(declare-datatypes ((V!25705 0))(
  ( (V!25706 (val!7794 Int)) )
))
(declare-datatypes ((ValueCell!7307 0))(
  ( (ValueCellFull!7307 (v!10219 V!25705)) (EmptyCell!7307) )
))
(declare-fun mapValue!24839 () ValueCell!7307)

(declare-fun mapKey!24839 () (_ BitVec 32))

(declare-fun mapRest!24839 () (Array (_ BitVec 32) ValueCell!7307))

(declare-datatypes ((array!47281 0))(
  ( (array!47282 (arr!22667 (Array (_ BitVec 32) ValueCell!7307)) (size!23108 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47281)

(assert (=> mapNonEmpty!24839 (= (arr!22667 _values!688) (store mapRest!24839 mapKey!24839 mapValue!24839))))

(declare-fun mapIsEmpty!24839 () Bool)

(assert (=> mapIsEmpty!24839 mapRes!24839))

(declare-fun b!840941 () Bool)

(declare-fun res!571458 () Bool)

(declare-fun e!469338 () Bool)

(assert (=> b!840941 (=> (not res!571458) (not e!469338))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840941 (= res!571458 (validMask!0 mask!1196))))

(declare-fun bm!37156 () Bool)

(declare-fun v!557 () V!25705)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10256 0))(
  ( (tuple2!10257 (_1!5139 (_ BitVec 64)) (_2!5139 V!25705)) )
))
(declare-datatypes ((List!16032 0))(
  ( (Nil!16029) (Cons!16028 (h!17165 tuple2!10256) (t!22395 List!16032)) )
))
(declare-datatypes ((ListLongMap!9027 0))(
  ( (ListLongMap!9028 (toList!4529 List!16032)) )
))
(declare-fun call!37159 () ListLongMap!9027)

(declare-datatypes ((array!47283 0))(
  ( (array!47284 (arr!22668 (Array (_ BitVec 32) (_ BitVec 64))) (size!23109 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47283)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25705)

(declare-fun zeroValue!654 () V!25705)

(declare-fun getCurrentListMapNoExtraKeys!2591 (array!47283 array!47281 (_ BitVec 32) (_ BitVec 32) V!25705 V!25705 (_ BitVec 32) Int) ListLongMap!9027)

(assert (=> bm!37156 (= call!37159 (getCurrentListMapNoExtraKeys!2591 _keys!868 (array!47282 (store (arr!22667 _values!688) i!612 (ValueCellFull!7307 v!557)) (size!23108 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840942 () Bool)

(declare-fun tp_is_empty!15493 () Bool)

(assert (=> b!840942 (= e!469341 tp_is_empty!15493)))

(declare-fun b!840943 () Bool)

(declare-fun res!571465 () Bool)

(assert (=> b!840943 (=> (not res!571465) (not e!469338))))

(assert (=> b!840943 (= res!571465 (and (= (size!23108 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23109 _keys!868) (size!23108 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!571459 () Bool)

(assert (=> start!72610 (=> (not res!571459) (not e!469338))))

(assert (=> start!72610 (= res!571459 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23109 _keys!868))))))

(assert (=> start!72610 e!469338))

(assert (=> start!72610 tp_is_empty!15493))

(assert (=> start!72610 true))

(assert (=> start!72610 tp!47981))

(declare-fun array_inv!18088 (array!47283) Bool)

(assert (=> start!72610 (array_inv!18088 _keys!868)))

(declare-fun e!469337 () Bool)

(declare-fun array_inv!18089 (array!47281) Bool)

(assert (=> start!72610 (and (array_inv!18089 _values!688) e!469337)))

(declare-fun call!37160 () ListLongMap!9027)

(declare-fun e!469339 () Bool)

(declare-fun b!840944 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2039 (ListLongMap!9027 tuple2!10256) ListLongMap!9027)

(assert (=> b!840944 (= e!469339 (= call!37159 (+!2039 call!37160 (tuple2!10257 k0!854 v!557))))))

(declare-fun b!840945 () Bool)

(declare-fun res!571462 () Bool)

(assert (=> b!840945 (=> (not res!571462) (not e!469338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840945 (= res!571462 (validKeyInArray!0 k0!854))))

(declare-fun b!840946 () Bool)

(assert (=> b!840946 (= e!469339 (= call!37159 call!37160))))

(declare-fun b!840947 () Bool)

(declare-fun res!571463 () Bool)

(assert (=> b!840947 (=> (not res!571463) (not e!469338))))

(assert (=> b!840947 (= res!571463 (and (= (select (arr!22668 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23109 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840948 () Bool)

(declare-fun res!571464 () Bool)

(assert (=> b!840948 (=> (not res!571464) (not e!469338))))

(assert (=> b!840948 (= res!571464 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23109 _keys!868))))))

(declare-fun b!840949 () Bool)

(assert (=> b!840949 (= e!469338 (not true))))

(assert (=> b!840949 e!469339))

(declare-fun c!91582 () Bool)

(assert (=> b!840949 (= c!91582 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28866 0))(
  ( (Unit!28867) )
))
(declare-fun lt!381167 () Unit!28866)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!269 (array!47283 array!47281 (_ BitVec 32) (_ BitVec 32) V!25705 V!25705 (_ BitVec 32) (_ BitVec 64) V!25705 (_ BitVec 32) Int) Unit!28866)

(assert (=> b!840949 (= lt!381167 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!269 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37157 () Bool)

(assert (=> bm!37157 (= call!37160 (getCurrentListMapNoExtraKeys!2591 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840950 () Bool)

(declare-fun res!571461 () Bool)

(assert (=> b!840950 (=> (not res!571461) (not e!469338))))

(declare-datatypes ((List!16033 0))(
  ( (Nil!16030) (Cons!16029 (h!17166 (_ BitVec 64)) (t!22396 List!16033)) )
))
(declare-fun arrayNoDuplicates!0 (array!47283 (_ BitVec 32) List!16033) Bool)

(assert (=> b!840950 (= res!571461 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16030))))

(declare-fun b!840951 () Bool)

(declare-fun res!571460 () Bool)

(assert (=> b!840951 (=> (not res!571460) (not e!469338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47283 (_ BitVec 32)) Bool)

(assert (=> b!840951 (= res!571460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840952 () Bool)

(declare-fun e!469342 () Bool)

(assert (=> b!840952 (= e!469342 tp_is_empty!15493)))

(declare-fun b!840953 () Bool)

(assert (=> b!840953 (= e!469337 (and e!469342 mapRes!24839))))

(declare-fun condMapEmpty!24839 () Bool)

(declare-fun mapDefault!24839 () ValueCell!7307)

(assert (=> b!840953 (= condMapEmpty!24839 (= (arr!22667 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7307)) mapDefault!24839)))))

(assert (= (and start!72610 res!571459) b!840941))

(assert (= (and b!840941 res!571458) b!840943))

(assert (= (and b!840943 res!571465) b!840951))

(assert (= (and b!840951 res!571460) b!840950))

(assert (= (and b!840950 res!571461) b!840948))

(assert (= (and b!840948 res!571464) b!840945))

(assert (= (and b!840945 res!571462) b!840947))

(assert (= (and b!840947 res!571463) b!840949))

(assert (= (and b!840949 c!91582) b!840944))

(assert (= (and b!840949 (not c!91582)) b!840946))

(assert (= (or b!840944 b!840946) bm!37156))

(assert (= (or b!840944 b!840946) bm!37157))

(assert (= (and b!840953 condMapEmpty!24839) mapIsEmpty!24839))

(assert (= (and b!840953 (not condMapEmpty!24839)) mapNonEmpty!24839))

(get-info :version)

(assert (= (and mapNonEmpty!24839 ((_ is ValueCellFull!7307) mapValue!24839)) b!840942))

(assert (= (and b!840953 ((_ is ValueCellFull!7307) mapDefault!24839)) b!840952))

(assert (= start!72610 b!840953))

(declare-fun m!785237 () Bool)

(assert (=> b!840944 m!785237))

(declare-fun m!785239 () Bool)

(assert (=> bm!37156 m!785239))

(declare-fun m!785241 () Bool)

(assert (=> bm!37156 m!785241))

(declare-fun m!785243 () Bool)

(assert (=> start!72610 m!785243))

(declare-fun m!785245 () Bool)

(assert (=> start!72610 m!785245))

(declare-fun m!785247 () Bool)

(assert (=> b!840945 m!785247))

(declare-fun m!785249 () Bool)

(assert (=> b!840947 m!785249))

(declare-fun m!785251 () Bool)

(assert (=> mapNonEmpty!24839 m!785251))

(declare-fun m!785253 () Bool)

(assert (=> b!840949 m!785253))

(declare-fun m!785255 () Bool)

(assert (=> b!840941 m!785255))

(declare-fun m!785257 () Bool)

(assert (=> bm!37157 m!785257))

(declare-fun m!785259 () Bool)

(assert (=> b!840951 m!785259))

(declare-fun m!785261 () Bool)

(assert (=> b!840950 m!785261))

(check-sat (not b!840944) (not b!840945) (not b!840941) tp_is_empty!15493 (not b_next!13627) (not b!840951) (not mapNonEmpty!24839) (not b!840950) (not b!840949) (not start!72610) (not bm!37157) (not bm!37156) b_and!22723)
(check-sat b_and!22723 (not b_next!13627))
