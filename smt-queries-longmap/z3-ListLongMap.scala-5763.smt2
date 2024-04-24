; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74594 () Bool)

(assert start!74594)

(declare-fun b_free!15169 () Bool)

(declare-fun b_next!15169 () Bool)

(assert (=> start!74594 (= b_free!15169 (not b_next!15169))))

(declare-fun tp!53186 () Bool)

(declare-fun b_and!25001 () Bool)

(assert (=> start!74594 (= tp!53186 b_and!25001)))

(declare-datatypes ((V!28265 0))(
  ( (V!28266 (val!8754 Int)) )
))
(declare-datatypes ((ValueCell!8267 0))(
  ( (ValueCellFull!8267 (v!11187 V!28265)) (EmptyCell!8267) )
))
(declare-datatypes ((array!50995 0))(
  ( (array!50996 (arr!24520 (Array (_ BitVec 32) ValueCell!8267)) (size!24961 (_ BitVec 32))) )
))
(declare-fun lt!396873 () array!50995)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11506 0))(
  ( (tuple2!11507 (_1!5764 (_ BitVec 64)) (_2!5764 V!28265)) )
))
(declare-datatypes ((List!17343 0))(
  ( (Nil!17340) (Cons!17339 (h!18476 tuple2!11506) (t!24408 List!17343)) )
))
(declare-datatypes ((ListLongMap!10277 0))(
  ( (ListLongMap!10278 (toList!5154 List!17343)) )
))
(declare-fun call!38796 () ListLongMap!10277)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38792 () Bool)

(declare-datatypes ((array!50997 0))(
  ( (array!50998 (arr!24521 (Array (_ BitVec 32) (_ BitVec 64))) (size!24962 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50997)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28265)

(declare-fun zeroValue!654 () V!28265)

(declare-fun getCurrentListMapNoExtraKeys!3196 (array!50997 array!50995 (_ BitVec 32) (_ BitVec 32) V!28265 V!28265 (_ BitVec 32) Int) ListLongMap!10277)

(assert (=> bm!38792 (= call!38796 (getCurrentListMapNoExtraKeys!3196 _keys!868 lt!396873 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27731 () Bool)

(declare-fun mapRes!27731 () Bool)

(assert (=> mapIsEmpty!27731 mapRes!27731))

(declare-fun b!877385 () Bool)

(declare-fun e!488494 () Bool)

(declare-fun tp_is_empty!17413 () Bool)

(assert (=> b!877385 (= e!488494 tp_is_empty!17413)))

(declare-fun b!877386 () Bool)

(declare-fun res!595927 () Bool)

(declare-fun e!488498 () Bool)

(assert (=> b!877386 (=> (not res!595927) (not e!488498))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!877386 (= res!595927 (and (= (select (arr!24521 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877388 () Bool)

(declare-fun e!488496 () Bool)

(declare-fun call!38795 () ListLongMap!10277)

(assert (=> b!877388 (= e!488496 (= call!38796 call!38795))))

(declare-fun b!877389 () Bool)

(declare-fun e!488492 () Bool)

(assert (=> b!877389 (= e!488498 e!488492)))

(declare-fun res!595924 () Bool)

(assert (=> b!877389 (=> (not res!595924) (not e!488492))))

(assert (=> b!877389 (= res!595924 (= from!1053 i!612))))

(declare-fun lt!396869 () ListLongMap!10277)

(assert (=> b!877389 (= lt!396869 (getCurrentListMapNoExtraKeys!3196 _keys!868 lt!396873 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28265)

(declare-fun _values!688 () array!50995)

(assert (=> b!877389 (= lt!396873 (array!50996 (store (arr!24520 _values!688) i!612 (ValueCellFull!8267 v!557)) (size!24961 _values!688)))))

(declare-fun lt!396868 () ListLongMap!10277)

(assert (=> b!877389 (= lt!396868 (getCurrentListMapNoExtraKeys!3196 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877390 () Bool)

(declare-fun +!2501 (ListLongMap!10277 tuple2!11506) ListLongMap!10277)

(assert (=> b!877390 (= e!488496 (= call!38796 (+!2501 call!38795 (tuple2!11507 k0!854 v!557))))))

(declare-fun b!877391 () Bool)

(declare-fun res!595925 () Bool)

(assert (=> b!877391 (=> (not res!595925) (not e!488498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877391 (= res!595925 (validKeyInArray!0 k0!854))))

(declare-fun b!877392 () Bool)

(declare-fun e!488497 () Bool)

(assert (=> b!877392 (= e!488492 (not e!488497))))

(declare-fun res!595931 () Bool)

(assert (=> b!877392 (=> res!595931 e!488497)))

(assert (=> b!877392 (= res!595931 (not (validKeyInArray!0 (select (arr!24521 _keys!868) from!1053))))))

(assert (=> b!877392 e!488496))

(declare-fun c!92885 () Bool)

(assert (=> b!877392 (= c!92885 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29948 0))(
  ( (Unit!29949) )
))
(declare-fun lt!396871 () Unit!29948)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!668 (array!50997 array!50995 (_ BitVec 32) (_ BitVec 32) V!28265 V!28265 (_ BitVec 32) (_ BitVec 64) V!28265 (_ BitVec 32) Int) Unit!29948)

(assert (=> b!877392 (= lt!396871 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!668 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877393 () Bool)

(declare-fun e!488495 () Bool)

(assert (=> b!877393 (= e!488495 (and e!488494 mapRes!27731))))

(declare-fun condMapEmpty!27731 () Bool)

(declare-fun mapDefault!27731 () ValueCell!8267)

(assert (=> b!877393 (= condMapEmpty!27731 (= (arr!24520 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8267)) mapDefault!27731)))))

(declare-fun b!877394 () Bool)

(declare-fun res!595929 () Bool)

(assert (=> b!877394 (=> (not res!595929) (not e!488498))))

(assert (=> b!877394 (= res!595929 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24962 _keys!868))))))

(declare-fun mapNonEmpty!27731 () Bool)

(declare-fun tp!53185 () Bool)

(declare-fun e!488499 () Bool)

(assert (=> mapNonEmpty!27731 (= mapRes!27731 (and tp!53185 e!488499))))

(declare-fun mapValue!27731 () ValueCell!8267)

(declare-fun mapRest!27731 () (Array (_ BitVec 32) ValueCell!8267))

(declare-fun mapKey!27731 () (_ BitVec 32))

(assert (=> mapNonEmpty!27731 (= (arr!24520 _values!688) (store mapRest!27731 mapKey!27731 mapValue!27731))))

(declare-fun res!595930 () Bool)

(assert (=> start!74594 (=> (not res!595930) (not e!488498))))

(assert (=> start!74594 (= res!595930 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24962 _keys!868))))))

(assert (=> start!74594 e!488498))

(assert (=> start!74594 tp_is_empty!17413))

(assert (=> start!74594 true))

(assert (=> start!74594 tp!53186))

(declare-fun array_inv!19378 (array!50997) Bool)

(assert (=> start!74594 (array_inv!19378 _keys!868)))

(declare-fun array_inv!19379 (array!50995) Bool)

(assert (=> start!74594 (and (array_inv!19379 _values!688) e!488495)))

(declare-fun b!877387 () Bool)

(assert (=> b!877387 (= e!488497 (bvslt i!612 (size!24961 _values!688)))))

(declare-fun lt!396872 () V!28265)

(declare-fun lt!396870 () tuple2!11506)

(declare-fun lt!396874 () ListLongMap!10277)

(assert (=> b!877387 (= (+!2501 lt!396874 lt!396870) (+!2501 (+!2501 lt!396874 (tuple2!11507 k0!854 lt!396872)) lt!396870))))

(declare-fun lt!396865 () V!28265)

(assert (=> b!877387 (= lt!396870 (tuple2!11507 k0!854 lt!396865))))

(declare-fun lt!396866 () Unit!29948)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!336 (ListLongMap!10277 (_ BitVec 64) V!28265 V!28265) Unit!29948)

(assert (=> b!877387 (= lt!396866 (addSameAsAddTwiceSameKeyDiffValues!336 lt!396874 k0!854 lt!396872 lt!396865))))

(declare-fun lt!396867 () V!28265)

(declare-fun get!12914 (ValueCell!8267 V!28265) V!28265)

(assert (=> b!877387 (= lt!396872 (get!12914 (select (arr!24520 _values!688) from!1053) lt!396867))))

(assert (=> b!877387 (= lt!396869 (+!2501 lt!396874 (tuple2!11507 (select (arr!24521 _keys!868) from!1053) lt!396865)))))

(assert (=> b!877387 (= lt!396865 (get!12914 (select (store (arr!24520 _values!688) i!612 (ValueCellFull!8267 v!557)) from!1053) lt!396867))))

(declare-fun dynLambda!1236 (Int (_ BitVec 64)) V!28265)

(assert (=> b!877387 (= lt!396867 (dynLambda!1236 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877387 (= lt!396874 (getCurrentListMapNoExtraKeys!3196 _keys!868 lt!396873 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877395 () Bool)

(declare-fun res!595926 () Bool)

(assert (=> b!877395 (=> (not res!595926) (not e!488498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877395 (= res!595926 (validMask!0 mask!1196))))

(declare-fun bm!38793 () Bool)

(assert (=> bm!38793 (= call!38795 (getCurrentListMapNoExtraKeys!3196 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877396 () Bool)

(declare-fun res!595928 () Bool)

(assert (=> b!877396 (=> (not res!595928) (not e!488498))))

(assert (=> b!877396 (= res!595928 (and (= (size!24961 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24962 _keys!868) (size!24961 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877397 () Bool)

(declare-fun res!595933 () Bool)

(assert (=> b!877397 (=> (not res!595933) (not e!488498))))

(declare-datatypes ((List!17344 0))(
  ( (Nil!17341) (Cons!17340 (h!18477 (_ BitVec 64)) (t!24409 List!17344)) )
))
(declare-fun arrayNoDuplicates!0 (array!50997 (_ BitVec 32) List!17344) Bool)

(assert (=> b!877397 (= res!595933 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17341))))

(declare-fun b!877398 () Bool)

(assert (=> b!877398 (= e!488499 tp_is_empty!17413)))

(declare-fun b!877399 () Bool)

(declare-fun res!595932 () Bool)

(assert (=> b!877399 (=> (not res!595932) (not e!488498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50997 (_ BitVec 32)) Bool)

(assert (=> b!877399 (= res!595932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74594 res!595930) b!877395))

(assert (= (and b!877395 res!595926) b!877396))

(assert (= (and b!877396 res!595928) b!877399))

(assert (= (and b!877399 res!595932) b!877397))

(assert (= (and b!877397 res!595933) b!877394))

(assert (= (and b!877394 res!595929) b!877391))

(assert (= (and b!877391 res!595925) b!877386))

(assert (= (and b!877386 res!595927) b!877389))

(assert (= (and b!877389 res!595924) b!877392))

(assert (= (and b!877392 c!92885) b!877390))

(assert (= (and b!877392 (not c!92885)) b!877388))

(assert (= (or b!877390 b!877388) bm!38792))

(assert (= (or b!877390 b!877388) bm!38793))

(assert (= (and b!877392 (not res!595931)) b!877387))

(assert (= (and b!877393 condMapEmpty!27731) mapIsEmpty!27731))

(assert (= (and b!877393 (not condMapEmpty!27731)) mapNonEmpty!27731))

(get-info :version)

(assert (= (and mapNonEmpty!27731 ((_ is ValueCellFull!8267) mapValue!27731)) b!877398))

(assert (= (and b!877393 ((_ is ValueCellFull!8267) mapDefault!27731)) b!877385))

(assert (= start!74594 b!877393))

(declare-fun b_lambda!12251 () Bool)

(assert (=> (not b_lambda!12251) (not b!877387)))

(declare-fun t!24407 () Bool)

(declare-fun tb!4921 () Bool)

(assert (=> (and start!74594 (= defaultEntry!696 defaultEntry!696) t!24407) tb!4921))

(declare-fun result!9469 () Bool)

(assert (=> tb!4921 (= result!9469 tp_is_empty!17413)))

(assert (=> b!877387 t!24407))

(declare-fun b_and!25003 () Bool)

(assert (= b_and!25001 (and (=> t!24407 result!9469) b_and!25003)))

(declare-fun m!817531 () Bool)

(assert (=> b!877387 m!817531))

(declare-fun m!817533 () Bool)

(assert (=> b!877387 m!817533))

(declare-fun m!817535 () Bool)

(assert (=> b!877387 m!817535))

(declare-fun m!817537 () Bool)

(assert (=> b!877387 m!817537))

(declare-fun m!817539 () Bool)

(assert (=> b!877387 m!817539))

(assert (=> b!877387 m!817537))

(declare-fun m!817541 () Bool)

(assert (=> b!877387 m!817541))

(declare-fun m!817543 () Bool)

(assert (=> b!877387 m!817543))

(assert (=> b!877387 m!817531))

(declare-fun m!817545 () Bool)

(assert (=> b!877387 m!817545))

(declare-fun m!817547 () Bool)

(assert (=> b!877387 m!817547))

(assert (=> b!877387 m!817541))

(declare-fun m!817549 () Bool)

(assert (=> b!877387 m!817549))

(declare-fun m!817551 () Bool)

(assert (=> b!877387 m!817551))

(declare-fun m!817553 () Bool)

(assert (=> b!877387 m!817553))

(declare-fun m!817555 () Bool)

(assert (=> b!877387 m!817555))

(declare-fun m!817557 () Bool)

(assert (=> b!877399 m!817557))

(declare-fun m!817559 () Bool)

(assert (=> b!877386 m!817559))

(declare-fun m!817561 () Bool)

(assert (=> b!877389 m!817561))

(assert (=> b!877389 m!817545))

(declare-fun m!817563 () Bool)

(assert (=> b!877389 m!817563))

(declare-fun m!817565 () Bool)

(assert (=> mapNonEmpty!27731 m!817565))

(declare-fun m!817567 () Bool)

(assert (=> b!877397 m!817567))

(declare-fun m!817569 () Bool)

(assert (=> start!74594 m!817569))

(declare-fun m!817571 () Bool)

(assert (=> start!74594 m!817571))

(assert (=> bm!38792 m!817549))

(assert (=> b!877392 m!817551))

(assert (=> b!877392 m!817551))

(declare-fun m!817573 () Bool)

(assert (=> b!877392 m!817573))

(declare-fun m!817575 () Bool)

(assert (=> b!877392 m!817575))

(declare-fun m!817577 () Bool)

(assert (=> b!877391 m!817577))

(declare-fun m!817579 () Bool)

(assert (=> b!877395 m!817579))

(declare-fun m!817581 () Bool)

(assert (=> b!877390 m!817581))

(declare-fun m!817583 () Bool)

(assert (=> bm!38793 m!817583))

(check-sat (not b_next!15169) (not b!877390) (not mapNonEmpty!27731) (not b!877389) (not b!877395) (not b_lambda!12251) (not b!877399) (not b!877391) (not b!877392) (not bm!38792) (not start!74594) (not bm!38793) b_and!25003 tp_is_empty!17413 (not b!877397) (not b!877387))
(check-sat b_and!25003 (not b_next!15169))
