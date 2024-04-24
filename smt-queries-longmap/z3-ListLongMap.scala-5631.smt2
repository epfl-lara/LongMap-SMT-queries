; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73738 () Bool)

(assert start!73738)

(declare-fun b_free!14485 () Bool)

(declare-fun b_next!14485 () Bool)

(assert (=> start!73738 (= b_free!14485 (not b_next!14485))))

(declare-fun tp!50959 () Bool)

(declare-fun b_and!23959 () Bool)

(assert (=> start!73738 (= tp!50959 b_and!23959)))

(declare-fun b!861352 () Bool)

(declare-fun res!585091 () Bool)

(declare-fun e!480049 () Bool)

(assert (=> b!861352 (=> (not res!585091) (not e!480049))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49467 0))(
  ( (array!49468 (arr!23760 (Array (_ BitVec 32) (_ BitVec 64))) (size!24201 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49467)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861352 (= res!585091 (and (= (select (arr!23760 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861353 () Bool)

(declare-fun res!585099 () Bool)

(declare-fun e!480046 () Bool)

(assert (=> b!861353 (=> res!585099 e!480046)))

(declare-datatypes ((List!16808 0))(
  ( (Nil!16805) (Cons!16804 (h!17941 (_ BitVec 64)) (t!23551 List!16808)) )
))
(declare-fun contains!4212 (List!16808 (_ BitVec 64)) Bool)

(assert (=> b!861353 (= res!585099 (contains!4212 Nil!16805 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!861354 () Bool)

(declare-fun e!480047 () Bool)

(declare-fun tp_is_empty!16621 () Bool)

(assert (=> b!861354 (= e!480047 tp_is_empty!16621)))

(declare-fun b!861355 () Bool)

(declare-fun res!585087 () Bool)

(assert (=> b!861355 (=> (not res!585087) (not e!480049))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861355 (= res!585087 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26531 () Bool)

(declare-fun mapRes!26531 () Bool)

(assert (=> mapIsEmpty!26531 mapRes!26531))

(declare-fun b!861356 () Bool)

(declare-fun res!585100 () Bool)

(assert (=> b!861356 (=> (not res!585100) (not e!480049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861356 (= res!585100 (validKeyInArray!0 k0!854))))

(declare-fun b!861358 () Bool)

(declare-fun res!585090 () Bool)

(assert (=> b!861358 (=> res!585090 e!480046)))

(declare-fun noDuplicate!1317 (List!16808) Bool)

(assert (=> b!861358 (= res!585090 (not (noDuplicate!1317 Nil!16805)))))

(declare-fun mapNonEmpty!26531 () Bool)

(declare-fun tp!50960 () Bool)

(declare-fun e!480048 () Bool)

(assert (=> mapNonEmpty!26531 (= mapRes!26531 (and tp!50960 e!480048))))

(declare-datatypes ((V!27209 0))(
  ( (V!27210 (val!8358 Int)) )
))
(declare-datatypes ((ValueCell!7871 0))(
  ( (ValueCellFull!7871 (v!10783 V!27209)) (EmptyCell!7871) )
))
(declare-fun mapValue!26531 () ValueCell!7871)

(declare-fun mapRest!26531 () (Array (_ BitVec 32) ValueCell!7871))

(declare-datatypes ((array!49469 0))(
  ( (array!49470 (arr!23761 (Array (_ BitVec 32) ValueCell!7871)) (size!24202 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49469)

(declare-fun mapKey!26531 () (_ BitVec 32))

(assert (=> mapNonEmpty!26531 (= (arr!23761 _values!688) (store mapRest!26531 mapKey!26531 mapValue!26531))))

(declare-fun b!861359 () Bool)

(declare-fun res!585095 () Bool)

(assert (=> b!861359 (=> (not res!585095) (not e!480049))))

(declare-fun arrayNoDuplicates!0 (array!49467 (_ BitVec 32) List!16808) Bool)

(assert (=> b!861359 (= res!585095 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16805))))

(declare-fun b!861360 () Bool)

(assert (=> b!861360 (= e!480048 tp_is_empty!16621)))

(declare-fun b!861361 () Bool)

(declare-fun res!585089 () Bool)

(assert (=> b!861361 (=> (not res!585089) (not e!480049))))

(assert (=> b!861361 (= res!585089 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24201 _keys!868))))))

(declare-fun b!861362 () Bool)

(declare-fun e!480051 () Bool)

(assert (=> b!861362 (= e!480051 (and e!480047 mapRes!26531))))

(declare-fun condMapEmpty!26531 () Bool)

(declare-fun mapDefault!26531 () ValueCell!7871)

(assert (=> b!861362 (= condMapEmpty!26531 (= (arr!23761 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7871)) mapDefault!26531)))))

(declare-fun b!861363 () Bool)

(declare-fun e!480050 () Bool)

(assert (=> b!861363 (= e!480049 e!480050)))

(declare-fun res!585088 () Bool)

(assert (=> b!861363 (=> (not res!585088) (not e!480050))))

(assert (=> b!861363 (= res!585088 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!10968 0))(
  ( (tuple2!10969 (_1!5495 (_ BitVec 64)) (_2!5495 V!27209)) )
))
(declare-datatypes ((List!16809 0))(
  ( (Nil!16806) (Cons!16805 (h!17942 tuple2!10968) (t!23552 List!16809)) )
))
(declare-datatypes ((ListLongMap!9739 0))(
  ( (ListLongMap!9740 (toList!4885 List!16809)) )
))
(declare-fun lt!388198 () ListLongMap!9739)

(declare-fun lt!388202 () array!49469)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27209)

(declare-fun zeroValue!654 () V!27209)

(declare-fun getCurrentListMapNoExtraKeys!2938 (array!49467 array!49469 (_ BitVec 32) (_ BitVec 32) V!27209 V!27209 (_ BitVec 32) Int) ListLongMap!9739)

(assert (=> b!861363 (= lt!388198 (getCurrentListMapNoExtraKeys!2938 _keys!868 lt!388202 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27209)

(assert (=> b!861363 (= lt!388202 (array!49470 (store (arr!23761 _values!688) i!612 (ValueCellFull!7871 v!557)) (size!24202 _values!688)))))

(declare-fun lt!388197 () ListLongMap!9739)

(assert (=> b!861363 (= lt!388197 (getCurrentListMapNoExtraKeys!2938 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861357 () Bool)

(declare-fun res!585097 () Bool)

(assert (=> b!861357 (=> (not res!585097) (not e!480049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49467 (_ BitVec 32)) Bool)

(assert (=> b!861357 (= res!585097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!585098 () Bool)

(assert (=> start!73738 (=> (not res!585098) (not e!480049))))

(assert (=> start!73738 (= res!585098 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24201 _keys!868))))))

(assert (=> start!73738 e!480049))

(assert (=> start!73738 tp_is_empty!16621))

(assert (=> start!73738 true))

(assert (=> start!73738 tp!50959))

(declare-fun array_inv!18856 (array!49467) Bool)

(assert (=> start!73738 (array_inv!18856 _keys!868)))

(declare-fun array_inv!18857 (array!49469) Bool)

(assert (=> start!73738 (and (array_inv!18857 _values!688) e!480051)))

(declare-fun b!861364 () Bool)

(declare-fun e!480045 () Bool)

(declare-fun e!480044 () Bool)

(assert (=> b!861364 (= e!480045 e!480044)))

(declare-fun res!585093 () Bool)

(assert (=> b!861364 (=> res!585093 e!480044)))

(assert (=> b!861364 (= res!585093 (not (= (select (arr!23760 _keys!868) from!1053) k0!854)))))

(declare-fun lt!388200 () ListLongMap!9739)

(declare-fun +!2289 (ListLongMap!9739 tuple2!10968) ListLongMap!9739)

(declare-fun get!12533 (ValueCell!7871 V!27209) V!27209)

(declare-fun dynLambda!1121 (Int (_ BitVec 64)) V!27209)

(assert (=> b!861364 (= lt!388198 (+!2289 lt!388200 (tuple2!10969 (select (arr!23760 _keys!868) from!1053) (get!12533 (select (arr!23761 _values!688) from!1053) (dynLambda!1121 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861365 () Bool)

(declare-fun res!585092 () Bool)

(assert (=> b!861365 (=> (not res!585092) (not e!480049))))

(assert (=> b!861365 (= res!585092 (and (= (size!24202 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24201 _keys!868) (size!24202 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861366 () Bool)

(assert (=> b!861366 (= e!480044 e!480046)))

(declare-fun res!585096 () Bool)

(assert (=> b!861366 (=> res!585096 e!480046)))

(assert (=> b!861366 (= res!585096 (or (bvsge (size!24201 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24201 _keys!868)) (bvsge from!1053 (size!24201 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861366 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!29330 0))(
  ( (Unit!29331) )
))
(declare-fun lt!388199 () Unit!29330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49467 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29330)

(assert (=> b!861366 (= lt!388199 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!861366 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16805)))

(declare-fun lt!388205 () Unit!29330)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49467 (_ BitVec 32) (_ BitVec 32)) Unit!29330)

(assert (=> b!861366 (= lt!388205 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!861367 () Bool)

(assert (=> b!861367 (= e!480046 true)))

(declare-fun lt!388196 () Bool)

(assert (=> b!861367 (= lt!388196 (contains!4212 Nil!16805 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!861368 () Bool)

(assert (=> b!861368 (= e!480050 (not e!480045))))

(declare-fun res!585094 () Bool)

(assert (=> b!861368 (=> res!585094 e!480045)))

(assert (=> b!861368 (= res!585094 (not (validKeyInArray!0 (select (arr!23760 _keys!868) from!1053))))))

(declare-fun lt!388201 () ListLongMap!9739)

(assert (=> b!861368 (= lt!388201 lt!388200)))

(declare-fun lt!388203 () ListLongMap!9739)

(assert (=> b!861368 (= lt!388200 (+!2289 lt!388203 (tuple2!10969 k0!854 v!557)))))

(assert (=> b!861368 (= lt!388201 (getCurrentListMapNoExtraKeys!2938 _keys!868 lt!388202 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861368 (= lt!388203 (getCurrentListMapNoExtraKeys!2938 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388204 () Unit!29330)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!480 (array!49467 array!49469 (_ BitVec 32) (_ BitVec 32) V!27209 V!27209 (_ BitVec 32) (_ BitVec 64) V!27209 (_ BitVec 32) Int) Unit!29330)

(assert (=> b!861368 (= lt!388204 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!480 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73738 res!585098) b!861355))

(assert (= (and b!861355 res!585087) b!861365))

(assert (= (and b!861365 res!585092) b!861357))

(assert (= (and b!861357 res!585097) b!861359))

(assert (= (and b!861359 res!585095) b!861361))

(assert (= (and b!861361 res!585089) b!861356))

(assert (= (and b!861356 res!585100) b!861352))

(assert (= (and b!861352 res!585091) b!861363))

(assert (= (and b!861363 res!585088) b!861368))

(assert (= (and b!861368 (not res!585094)) b!861364))

(assert (= (and b!861364 (not res!585093)) b!861366))

(assert (= (and b!861366 (not res!585096)) b!861358))

(assert (= (and b!861358 (not res!585090)) b!861353))

(assert (= (and b!861353 (not res!585099)) b!861367))

(assert (= (and b!861362 condMapEmpty!26531) mapIsEmpty!26531))

(assert (= (and b!861362 (not condMapEmpty!26531)) mapNonEmpty!26531))

(get-info :version)

(assert (= (and mapNonEmpty!26531 ((_ is ValueCellFull!7871) mapValue!26531)) b!861360))

(assert (= (and b!861362 ((_ is ValueCellFull!7871) mapDefault!26531)) b!861354))

(assert (= start!73738 b!861362))

(declare-fun b_lambda!11851 () Bool)

(assert (=> (not b_lambda!11851) (not b!861364)))

(declare-fun t!23550 () Bool)

(declare-fun tb!4599 () Bool)

(assert (=> (and start!73738 (= defaultEntry!696 defaultEntry!696) t!23550) tb!4599))

(declare-fun result!8817 () Bool)

(assert (=> tb!4599 (= result!8817 tp_is_empty!16621)))

(assert (=> b!861364 t!23550))

(declare-fun b_and!23961 () Bool)

(assert (= b_and!23959 (and (=> t!23550 result!8817) b_and!23961)))

(declare-fun m!802547 () Bool)

(assert (=> b!861353 m!802547))

(declare-fun m!802549 () Bool)

(assert (=> b!861367 m!802549))

(declare-fun m!802551 () Bool)

(assert (=> b!861364 m!802551))

(declare-fun m!802553 () Bool)

(assert (=> b!861364 m!802553))

(declare-fun m!802555 () Bool)

(assert (=> b!861364 m!802555))

(declare-fun m!802557 () Bool)

(assert (=> b!861364 m!802557))

(assert (=> b!861364 m!802553))

(declare-fun m!802559 () Bool)

(assert (=> b!861364 m!802559))

(assert (=> b!861364 m!802555))

(declare-fun m!802561 () Bool)

(assert (=> b!861359 m!802561))

(declare-fun m!802563 () Bool)

(assert (=> b!861358 m!802563))

(declare-fun m!802565 () Bool)

(assert (=> b!861357 m!802565))

(declare-fun m!802567 () Bool)

(assert (=> b!861363 m!802567))

(declare-fun m!802569 () Bool)

(assert (=> b!861363 m!802569))

(declare-fun m!802571 () Bool)

(assert (=> b!861363 m!802571))

(declare-fun m!802573 () Bool)

(assert (=> b!861352 m!802573))

(declare-fun m!802575 () Bool)

(assert (=> mapNonEmpty!26531 m!802575))

(declare-fun m!802577 () Bool)

(assert (=> b!861368 m!802577))

(declare-fun m!802579 () Bool)

(assert (=> b!861368 m!802579))

(declare-fun m!802581 () Bool)

(assert (=> b!861368 m!802581))

(assert (=> b!861368 m!802559))

(declare-fun m!802583 () Bool)

(assert (=> b!861368 m!802583))

(assert (=> b!861368 m!802559))

(declare-fun m!802585 () Bool)

(assert (=> b!861368 m!802585))

(declare-fun m!802587 () Bool)

(assert (=> b!861366 m!802587))

(declare-fun m!802589 () Bool)

(assert (=> b!861366 m!802589))

(declare-fun m!802591 () Bool)

(assert (=> b!861366 m!802591))

(declare-fun m!802593 () Bool)

(assert (=> b!861366 m!802593))

(declare-fun m!802595 () Bool)

(assert (=> start!73738 m!802595))

(declare-fun m!802597 () Bool)

(assert (=> start!73738 m!802597))

(declare-fun m!802599 () Bool)

(assert (=> b!861356 m!802599))

(declare-fun m!802601 () Bool)

(assert (=> b!861355 m!802601))

(check-sat (not b_lambda!11851) tp_is_empty!16621 (not start!73738) (not b!861366) b_and!23961 (not b!861353) (not b!861363) (not b!861355) (not b!861359) (not mapNonEmpty!26531) (not b!861357) (not b!861368) (not b_next!14485) (not b!861367) (not b!861356) (not b!861364) (not b!861358))
(check-sat b_and!23961 (not b_next!14485))
