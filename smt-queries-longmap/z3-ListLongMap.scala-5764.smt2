; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74414 () Bool)

(assert start!74414)

(declare-fun b_free!15175 () Bool)

(declare-fun b_next!15175 () Bool)

(assert (=> start!74414 (= b_free!15175 (not b_next!15175))))

(declare-fun tp!53203 () Bool)

(declare-fun b_and!24977 () Bool)

(assert (=> start!74414 (= tp!53203 b_and!24977)))

(declare-fun b!876384 () Bool)

(declare-fun res!595562 () Bool)

(declare-fun e!487836 () Bool)

(assert (=> b!876384 (=> (not res!595562) (not e!487836))))

(declare-datatypes ((array!50943 0))(
  ( (array!50944 (arr!24499 (Array (_ BitVec 32) (_ BitVec 64))) (size!24941 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50943)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50943 (_ BitVec 32)) Bool)

(assert (=> b!876384 (= res!595562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876386 () Bool)

(declare-fun e!487840 () Bool)

(declare-fun tp_is_empty!17419 () Bool)

(assert (=> b!876386 (= e!487840 tp_is_empty!17419)))

(declare-fun b!876387 () Bool)

(declare-fun e!487838 () Bool)

(declare-fun e!487835 () Bool)

(assert (=> b!876387 (= e!487838 (not e!487835))))

(declare-fun res!595569 () Bool)

(assert (=> b!876387 (=> res!595569 e!487835)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876387 (= res!595569 (not (validKeyInArray!0 (select (arr!24499 _keys!868) from!1053))))))

(declare-fun e!487837 () Bool)

(assert (=> b!876387 e!487837))

(declare-fun c!92547 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876387 (= c!92547 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!28273 0))(
  ( (V!28274 (val!8757 Int)) )
))
(declare-fun v!557 () V!28273)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((Unit!29921 0))(
  ( (Unit!29922) )
))
(declare-fun lt!396364 () Unit!29921)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!8270 0))(
  ( (ValueCellFull!8270 (v!11184 V!28273)) (EmptyCell!8270) )
))
(declare-datatypes ((array!50945 0))(
  ( (array!50946 (arr!24500 (Array (_ BitVec 32) ValueCell!8270)) (size!24942 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50945)

(declare-fun minValue!654 () V!28273)

(declare-fun zeroValue!654 () V!28273)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!683 (array!50943 array!50945 (_ BitVec 32) (_ BitVec 32) V!28273 V!28273 (_ BitVec 32) (_ BitVec 64) V!28273 (_ BitVec 32) Int) Unit!29921)

(assert (=> b!876387 (= lt!396364 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!683 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876388 () Bool)

(declare-fun res!595560 () Bool)

(assert (=> b!876388 (=> (not res!595560) (not e!487836))))

(assert (=> b!876388 (= res!595560 (and (= (size!24942 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24941 _keys!868) (size!24942 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876389 () Bool)

(declare-fun e!487839 () Bool)

(declare-fun e!487834 () Bool)

(declare-fun mapRes!27740 () Bool)

(assert (=> b!876389 (= e!487839 (and e!487834 mapRes!27740))))

(declare-fun condMapEmpty!27740 () Bool)

(declare-fun mapDefault!27740 () ValueCell!8270)

(assert (=> b!876389 (= condMapEmpty!27740 (= (arr!24500 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8270)) mapDefault!27740)))))

(declare-fun mapNonEmpty!27740 () Bool)

(declare-fun tp!53204 () Bool)

(assert (=> mapNonEmpty!27740 (= mapRes!27740 (and tp!53204 e!487840))))

(declare-fun mapKey!27740 () (_ BitVec 32))

(declare-fun mapRest!27740 () (Array (_ BitVec 32) ValueCell!8270))

(declare-fun mapValue!27740 () ValueCell!8270)

(assert (=> mapNonEmpty!27740 (= (arr!24500 _values!688) (store mapRest!27740 mapKey!27740 mapValue!27740))))

(declare-fun b!876390 () Bool)

(assert (=> b!876390 (= e!487836 e!487838)))

(declare-fun res!595563 () Bool)

(assert (=> b!876390 (=> (not res!595563) (not e!487838))))

(assert (=> b!876390 (= res!595563 (= from!1053 i!612))))

(declare-fun lt!396366 () array!50945)

(declare-datatypes ((tuple2!11588 0))(
  ( (tuple2!11589 (_1!5805 (_ BitVec 64)) (_2!5805 V!28273)) )
))
(declare-datatypes ((List!17392 0))(
  ( (Nil!17389) (Cons!17388 (h!18519 tuple2!11588) (t!24462 List!17392)) )
))
(declare-datatypes ((ListLongMap!10347 0))(
  ( (ListLongMap!10348 (toList!5189 List!17392)) )
))
(declare-fun lt!396365 () ListLongMap!10347)

(declare-fun getCurrentListMapNoExtraKeys!3182 (array!50943 array!50945 (_ BitVec 32) (_ BitVec 32) V!28273 V!28273 (_ BitVec 32) Int) ListLongMap!10347)

(assert (=> b!876390 (= lt!396365 (getCurrentListMapNoExtraKeys!3182 _keys!868 lt!396366 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!876390 (= lt!396366 (array!50946 (store (arr!24500 _values!688) i!612 (ValueCellFull!8270 v!557)) (size!24942 _values!688)))))

(declare-fun lt!396362 () ListLongMap!10347)

(assert (=> b!876390 (= lt!396362 (getCurrentListMapNoExtraKeys!3182 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!38739 () Bool)

(declare-fun call!38742 () ListLongMap!10347)

(assert (=> bm!38739 (= call!38742 (getCurrentListMapNoExtraKeys!3182 _keys!868 lt!396366 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!595561 () Bool)

(assert (=> start!74414 (=> (not res!595561) (not e!487836))))

(assert (=> start!74414 (= res!595561 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24941 _keys!868))))))

(assert (=> start!74414 e!487836))

(assert (=> start!74414 tp_is_empty!17419))

(assert (=> start!74414 true))

(assert (=> start!74414 tp!53203))

(declare-fun array_inv!19356 (array!50943) Bool)

(assert (=> start!74414 (array_inv!19356 _keys!868)))

(declare-fun array_inv!19357 (array!50945) Bool)

(assert (=> start!74414 (and (array_inv!19357 _values!688) e!487839)))

(declare-fun b!876385 () Bool)

(assert (=> b!876385 (= e!487835 true)))

(declare-fun lt!396367 () V!28273)

(declare-fun lt!396359 () ListLongMap!10347)

(declare-fun lt!396361 () tuple2!11588)

(declare-fun +!2514 (ListLongMap!10347 tuple2!11588) ListLongMap!10347)

(assert (=> b!876385 (= (+!2514 lt!396359 lt!396361) (+!2514 (+!2514 lt!396359 (tuple2!11589 k0!854 lt!396367)) lt!396361))))

(declare-fun lt!396360 () V!28273)

(assert (=> b!876385 (= lt!396361 (tuple2!11589 k0!854 lt!396360))))

(declare-fun lt!396363 () Unit!29921)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!324 (ListLongMap!10347 (_ BitVec 64) V!28273 V!28273) Unit!29921)

(assert (=> b!876385 (= lt!396363 (addSameAsAddTwiceSameKeyDiffValues!324 lt!396359 k0!854 lt!396367 lt!396360))))

(declare-fun lt!396358 () V!28273)

(declare-fun get!12893 (ValueCell!8270 V!28273) V!28273)

(assert (=> b!876385 (= lt!396367 (get!12893 (select (arr!24500 _values!688) from!1053) lt!396358))))

(assert (=> b!876385 (= lt!396365 (+!2514 lt!396359 (tuple2!11589 (select (arr!24499 _keys!868) from!1053) lt!396360)))))

(assert (=> b!876385 (= lt!396360 (get!12893 (select (store (arr!24500 _values!688) i!612 (ValueCellFull!8270 v!557)) from!1053) lt!396358))))

(declare-fun dynLambda!1216 (Int (_ BitVec 64)) V!28273)

(assert (=> b!876385 (= lt!396358 (dynLambda!1216 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!876385 (= lt!396359 (getCurrentListMapNoExtraKeys!3182 _keys!868 lt!396366 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38740 () Bool)

(declare-fun call!38743 () ListLongMap!10347)

(assert (=> bm!38740 (= call!38743 (getCurrentListMapNoExtraKeys!3182 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876391 () Bool)

(declare-fun res!595564 () Bool)

(assert (=> b!876391 (=> (not res!595564) (not e!487836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876391 (= res!595564 (validMask!0 mask!1196))))

(declare-fun b!876392 () Bool)

(declare-fun res!595568 () Bool)

(assert (=> b!876392 (=> (not res!595568) (not e!487836))))

(assert (=> b!876392 (= res!595568 (validKeyInArray!0 k0!854))))

(declare-fun b!876393 () Bool)

(assert (=> b!876393 (= e!487837 (= call!38742 (+!2514 call!38743 (tuple2!11589 k0!854 v!557))))))

(declare-fun b!876394 () Bool)

(assert (=> b!876394 (= e!487837 (= call!38742 call!38743))))

(declare-fun b!876395 () Bool)

(declare-fun res!595565 () Bool)

(assert (=> b!876395 (=> (not res!595565) (not e!487836))))

(declare-datatypes ((List!17393 0))(
  ( (Nil!17390) (Cons!17389 (h!18520 (_ BitVec 64)) (t!24463 List!17393)) )
))
(declare-fun arrayNoDuplicates!0 (array!50943 (_ BitVec 32) List!17393) Bool)

(assert (=> b!876395 (= res!595565 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17390))))

(declare-fun b!876396 () Bool)

(declare-fun res!595567 () Bool)

(assert (=> b!876396 (=> (not res!595567) (not e!487836))))

(assert (=> b!876396 (= res!595567 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24941 _keys!868))))))

(declare-fun b!876397 () Bool)

(assert (=> b!876397 (= e!487834 tp_is_empty!17419)))

(declare-fun b!876398 () Bool)

(declare-fun res!595566 () Bool)

(assert (=> b!876398 (=> (not res!595566) (not e!487836))))

(assert (=> b!876398 (= res!595566 (and (= (select (arr!24499 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27740 () Bool)

(assert (=> mapIsEmpty!27740 mapRes!27740))

(assert (= (and start!74414 res!595561) b!876391))

(assert (= (and b!876391 res!595564) b!876388))

(assert (= (and b!876388 res!595560) b!876384))

(assert (= (and b!876384 res!595562) b!876395))

(assert (= (and b!876395 res!595565) b!876396))

(assert (= (and b!876396 res!595567) b!876392))

(assert (= (and b!876392 res!595568) b!876398))

(assert (= (and b!876398 res!595566) b!876390))

(assert (= (and b!876390 res!595563) b!876387))

(assert (= (and b!876387 c!92547) b!876393))

(assert (= (and b!876387 (not c!92547)) b!876394))

(assert (= (or b!876393 b!876394) bm!38739))

(assert (= (or b!876393 b!876394) bm!38740))

(assert (= (and b!876387 (not res!595569)) b!876385))

(assert (= (and b!876389 condMapEmpty!27740) mapIsEmpty!27740))

(assert (= (and b!876389 (not condMapEmpty!27740)) mapNonEmpty!27740))

(get-info :version)

(assert (= (and mapNonEmpty!27740 ((_ is ValueCellFull!8270) mapValue!27740)) b!876386))

(assert (= (and b!876389 ((_ is ValueCellFull!8270) mapDefault!27740)) b!876397))

(assert (= start!74414 b!876389))

(declare-fun b_lambda!12225 () Bool)

(assert (=> (not b_lambda!12225) (not b!876385)))

(declare-fun t!24461 () Bool)

(declare-fun tb!4927 () Bool)

(assert (=> (and start!74414 (= defaultEntry!696 defaultEntry!696) t!24461) tb!4927))

(declare-fun result!9481 () Bool)

(assert (=> tb!4927 (= result!9481 tp_is_empty!17419)))

(assert (=> b!876385 t!24461))

(declare-fun b_and!24979 () Bool)

(assert (= b_and!24977 (and (=> t!24461 result!9481) b_and!24979)))

(declare-fun m!815643 () Bool)

(assert (=> b!876390 m!815643))

(declare-fun m!815645 () Bool)

(assert (=> b!876390 m!815645))

(declare-fun m!815647 () Bool)

(assert (=> b!876390 m!815647))

(declare-fun m!815649 () Bool)

(assert (=> bm!38739 m!815649))

(declare-fun m!815651 () Bool)

(assert (=> b!876398 m!815651))

(declare-fun m!815653 () Bool)

(assert (=> b!876387 m!815653))

(assert (=> b!876387 m!815653))

(declare-fun m!815655 () Bool)

(assert (=> b!876387 m!815655))

(declare-fun m!815657 () Bool)

(assert (=> b!876387 m!815657))

(declare-fun m!815659 () Bool)

(assert (=> b!876391 m!815659))

(declare-fun m!815661 () Bool)

(assert (=> b!876395 m!815661))

(declare-fun m!815663 () Bool)

(assert (=> b!876392 m!815663))

(declare-fun m!815665 () Bool)

(assert (=> b!876385 m!815665))

(declare-fun m!815667 () Bool)

(assert (=> b!876385 m!815667))

(declare-fun m!815669 () Bool)

(assert (=> b!876385 m!815669))

(declare-fun m!815671 () Bool)

(assert (=> b!876385 m!815671))

(assert (=> b!876385 m!815665))

(declare-fun m!815673 () Bool)

(assert (=> b!876385 m!815673))

(declare-fun m!815675 () Bool)

(assert (=> b!876385 m!815675))

(declare-fun m!815677 () Bool)

(assert (=> b!876385 m!815677))

(assert (=> b!876385 m!815669))

(declare-fun m!815679 () Bool)

(assert (=> b!876385 m!815679))

(assert (=> b!876385 m!815649))

(assert (=> b!876385 m!815653))

(declare-fun m!815681 () Bool)

(assert (=> b!876385 m!815681))

(declare-fun m!815683 () Bool)

(assert (=> b!876385 m!815683))

(assert (=> b!876385 m!815673))

(assert (=> b!876385 m!815645))

(declare-fun m!815685 () Bool)

(assert (=> start!74414 m!815685))

(declare-fun m!815687 () Bool)

(assert (=> start!74414 m!815687))

(declare-fun m!815689 () Bool)

(assert (=> bm!38740 m!815689))

(declare-fun m!815691 () Bool)

(assert (=> mapNonEmpty!27740 m!815691))

(declare-fun m!815693 () Bool)

(assert (=> b!876393 m!815693))

(declare-fun m!815695 () Bool)

(assert (=> b!876384 m!815695))

(check-sat (not b!876395) (not b_lambda!12225) b_and!24979 (not b!876387) (not start!74414) (not b!876392) (not b_next!15175) (not b!876385) (not bm!38739) (not b!876391) (not mapNonEmpty!27740) (not b!876393) (not bm!38740) (not b!876390) tp_is_empty!17419 (not b!876384))
(check-sat b_and!24979 (not b_next!15175))
