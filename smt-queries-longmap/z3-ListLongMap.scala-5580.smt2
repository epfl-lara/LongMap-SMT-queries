; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73266 () Bool)

(assert start!73266)

(declare-fun b_free!14181 () Bool)

(declare-fun b_next!14181 () Bool)

(assert (=> start!73266 (= b_free!14181 (not b_next!14181))))

(declare-fun tp!50047 () Bool)

(declare-fun b_and!23521 () Bool)

(assert (=> start!73266 (= tp!50047 b_and!23521)))

(declare-fun mapIsEmpty!26075 () Bool)

(declare-fun mapRes!26075 () Bool)

(assert (=> mapIsEmpty!26075 mapRes!26075))

(declare-fun b!854408 () Bool)

(declare-fun e!476439 () Bool)

(declare-fun tp_is_empty!16317 () Bool)

(assert (=> b!854408 (= e!476439 tp_is_empty!16317)))

(declare-fun bm!38395 () Bool)

(declare-datatypes ((V!26803 0))(
  ( (V!26804 (val!8206 Int)) )
))
(declare-datatypes ((tuple2!10802 0))(
  ( (tuple2!10803 (_1!5412 (_ BitVec 64)) (_2!5412 V!26803)) )
))
(declare-datatypes ((List!16619 0))(
  ( (Nil!16616) (Cons!16615 (h!17746 tuple2!10802) (t!23246 List!16619)) )
))
(declare-datatypes ((ListLongMap!9571 0))(
  ( (ListLongMap!9572 (toList!4801 List!16619)) )
))
(declare-fun call!38399 () ListLongMap!9571)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48832 0))(
  ( (array!48833 (arr!23447 (Array (_ BitVec 32) (_ BitVec 64))) (size!23887 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48832)

(declare-datatypes ((ValueCell!7719 0))(
  ( (ValueCellFull!7719 (v!10631 V!26803)) (EmptyCell!7719) )
))
(declare-datatypes ((array!48834 0))(
  ( (array!48835 (arr!23448 (Array (_ BitVec 32) ValueCell!7719)) (size!23888 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48834)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26803)

(declare-fun zeroValue!654 () V!26803)

(declare-fun getCurrentListMapNoExtraKeys!2782 (array!48832 array!48834 (_ BitVec 32) (_ BitVec 32) V!26803 V!26803 (_ BitVec 32) Int) ListLongMap!9571)

(assert (=> bm!38395 (= call!38399 (getCurrentListMapNoExtraKeys!2782 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854409 () Bool)

(declare-fun e!476436 () Bool)

(assert (=> b!854409 (= e!476436 tp_is_empty!16317)))

(declare-fun bm!38396 () Bool)

(declare-fun lt!385362 () array!48834)

(declare-fun call!38398 () ListLongMap!9571)

(assert (=> bm!38396 (= call!38398 (getCurrentListMapNoExtraKeys!2782 _keys!868 lt!385362 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!580240 () Bool)

(declare-fun e!476434 () Bool)

(assert (=> start!73266 (=> (not res!580240) (not e!476434))))

(assert (=> start!73266 (= res!580240 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23887 _keys!868))))))

(assert (=> start!73266 e!476434))

(assert (=> start!73266 tp_is_empty!16317))

(assert (=> start!73266 true))

(assert (=> start!73266 tp!50047))

(declare-fun array_inv!18584 (array!48832) Bool)

(assert (=> start!73266 (array_inv!18584 _keys!868)))

(declare-fun e!476437 () Bool)

(declare-fun array_inv!18585 (array!48834) Bool)

(assert (=> start!73266 (and (array_inv!18585 _values!688) e!476437)))

(declare-fun v!557 () V!26803)

(declare-fun b!854410 () Bool)

(declare-fun e!476440 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2190 (ListLongMap!9571 tuple2!10802) ListLongMap!9571)

(assert (=> b!854410 (= e!476440 (= call!38398 (+!2190 call!38399 (tuple2!10803 k0!854 v!557))))))

(declare-fun b!854411 () Bool)

(declare-fun res!580245 () Bool)

(assert (=> b!854411 (=> (not res!580245) (not e!476434))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854411 (= res!580245 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23887 _keys!868))))))

(declare-fun b!854412 () Bool)

(assert (=> b!854412 (= e!476440 (= call!38398 call!38399))))

(declare-fun b!854413 () Bool)

(declare-fun res!580246 () Bool)

(assert (=> b!854413 (=> (not res!580246) (not e!476434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854413 (= res!580246 (validKeyInArray!0 k0!854))))

(declare-fun b!854414 () Bool)

(declare-fun res!580242 () Bool)

(assert (=> b!854414 (=> (not res!580242) (not e!476434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854414 (= res!580242 (validMask!0 mask!1196))))

(declare-fun b!854415 () Bool)

(declare-fun res!580247 () Bool)

(assert (=> b!854415 (=> (not res!580247) (not e!476434))))

(assert (=> b!854415 (= res!580247 (and (= (select (arr!23447 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854416 () Bool)

(declare-fun res!580243 () Bool)

(assert (=> b!854416 (=> (not res!580243) (not e!476434))))

(declare-datatypes ((List!16620 0))(
  ( (Nil!16617) (Cons!16616 (h!17747 (_ BitVec 64)) (t!23247 List!16620)) )
))
(declare-fun arrayNoDuplicates!0 (array!48832 (_ BitVec 32) List!16620) Bool)

(assert (=> b!854416 (= res!580243 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16617))))

(declare-fun b!854417 () Bool)

(declare-fun e!476433 () Bool)

(declare-fun e!476435 () Bool)

(assert (=> b!854417 (= e!476433 (not e!476435))))

(declare-fun res!580239 () Bool)

(assert (=> b!854417 (=> res!580239 e!476435)))

(assert (=> b!854417 (= res!580239 (not (validKeyInArray!0 (select (arr!23447 _keys!868) from!1053))))))

(assert (=> b!854417 e!476440))

(declare-fun c!91942 () Bool)

(assert (=> b!854417 (= c!91942 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29165 0))(
  ( (Unit!29166) )
))
(declare-fun lt!385360 () Unit!29165)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!411 (array!48832 array!48834 (_ BitVec 32) (_ BitVec 32) V!26803 V!26803 (_ BitVec 32) (_ BitVec 64) V!26803 (_ BitVec 32) Int) Unit!29165)

(assert (=> b!854417 (= lt!385360 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!411 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854418 () Bool)

(declare-fun res!580244 () Bool)

(assert (=> b!854418 (=> (not res!580244) (not e!476434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48832 (_ BitVec 32)) Bool)

(assert (=> b!854418 (= res!580244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854419 () Bool)

(declare-fun res!580241 () Bool)

(assert (=> b!854419 (=> (not res!580241) (not e!476434))))

(assert (=> b!854419 (= res!580241 (and (= (size!23888 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23887 _keys!868) (size!23888 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854420 () Bool)

(assert (=> b!854420 (= e!476437 (and e!476439 mapRes!26075))))

(declare-fun condMapEmpty!26075 () Bool)

(declare-fun mapDefault!26075 () ValueCell!7719)

(assert (=> b!854420 (= condMapEmpty!26075 (= (arr!23448 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7719)) mapDefault!26075)))))

(declare-fun b!854421 () Bool)

(assert (=> b!854421 (= e!476434 e!476433)))

(declare-fun res!580238 () Bool)

(assert (=> b!854421 (=> (not res!580238) (not e!476433))))

(assert (=> b!854421 (= res!580238 (= from!1053 i!612))))

(declare-fun lt!385355 () ListLongMap!9571)

(assert (=> b!854421 (= lt!385355 (getCurrentListMapNoExtraKeys!2782 _keys!868 lt!385362 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!854421 (= lt!385362 (array!48835 (store (arr!23448 _values!688) i!612 (ValueCellFull!7719 v!557)) (size!23888 _values!688)))))

(declare-fun lt!385363 () ListLongMap!9571)

(assert (=> b!854421 (= lt!385363 (getCurrentListMapNoExtraKeys!2782 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26075 () Bool)

(declare-fun tp!50046 () Bool)

(assert (=> mapNonEmpty!26075 (= mapRes!26075 (and tp!50046 e!476436))))

(declare-fun mapValue!26075 () ValueCell!7719)

(declare-fun mapKey!26075 () (_ BitVec 32))

(declare-fun mapRest!26075 () (Array (_ BitVec 32) ValueCell!7719))

(assert (=> mapNonEmpty!26075 (= (arr!23448 _values!688) (store mapRest!26075 mapKey!26075 mapValue!26075))))

(declare-fun b!854422 () Bool)

(assert (=> b!854422 (= e!476435 true)))

(declare-fun lt!385354 () V!26803)

(declare-fun lt!385357 () tuple2!10802)

(declare-fun lt!385359 () ListLongMap!9571)

(assert (=> b!854422 (= (+!2190 lt!385359 lt!385357) (+!2190 (+!2190 lt!385359 (tuple2!10803 k0!854 lt!385354)) lt!385357))))

(declare-fun lt!385361 () V!26803)

(assert (=> b!854422 (= lt!385357 (tuple2!10803 k0!854 lt!385361))))

(declare-fun lt!385358 () Unit!29165)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!315 (ListLongMap!9571 (_ BitVec 64) V!26803 V!26803) Unit!29165)

(assert (=> b!854422 (= lt!385358 (addSameAsAddTwiceSameKeyDiffValues!315 lt!385359 k0!854 lt!385354 lt!385361))))

(declare-fun lt!385356 () V!26803)

(declare-fun get!12373 (ValueCell!7719 V!26803) V!26803)

(assert (=> b!854422 (= lt!385354 (get!12373 (select (arr!23448 _values!688) from!1053) lt!385356))))

(assert (=> b!854422 (= lt!385355 (+!2190 lt!385359 (tuple2!10803 (select (arr!23447 _keys!868) from!1053) lt!385361)))))

(assert (=> b!854422 (= lt!385361 (get!12373 (select (store (arr!23448 _values!688) i!612 (ValueCellFull!7719 v!557)) from!1053) lt!385356))))

(declare-fun dynLambda!1069 (Int (_ BitVec 64)) V!26803)

(assert (=> b!854422 (= lt!385356 (dynLambda!1069 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854422 (= lt!385359 (getCurrentListMapNoExtraKeys!2782 _keys!868 lt!385362 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73266 res!580240) b!854414))

(assert (= (and b!854414 res!580242) b!854419))

(assert (= (and b!854419 res!580241) b!854418))

(assert (= (and b!854418 res!580244) b!854416))

(assert (= (and b!854416 res!580243) b!854411))

(assert (= (and b!854411 res!580245) b!854413))

(assert (= (and b!854413 res!580246) b!854415))

(assert (= (and b!854415 res!580247) b!854421))

(assert (= (and b!854421 res!580238) b!854417))

(assert (= (and b!854417 c!91942) b!854410))

(assert (= (and b!854417 (not c!91942)) b!854412))

(assert (= (or b!854410 b!854412) bm!38395))

(assert (= (or b!854410 b!854412) bm!38396))

(assert (= (and b!854417 (not res!580239)) b!854422))

(assert (= (and b!854420 condMapEmpty!26075) mapIsEmpty!26075))

(assert (= (and b!854420 (not condMapEmpty!26075)) mapNonEmpty!26075))

(get-info :version)

(assert (= (and mapNonEmpty!26075 ((_ is ValueCellFull!7719) mapValue!26075)) b!854409))

(assert (= (and b!854420 ((_ is ValueCellFull!7719) mapDefault!26075)) b!854408))

(assert (= start!73266 b!854420))

(declare-fun b_lambda!11713 () Bool)

(assert (=> (not b_lambda!11713) (not b!854422)))

(declare-fun t!23245 () Bool)

(declare-fun tb!4483 () Bool)

(assert (=> (and start!73266 (= defaultEntry!696 defaultEntry!696) t!23245) tb!4483))

(declare-fun result!8577 () Bool)

(assert (=> tb!4483 (= result!8577 tp_is_empty!16317)))

(assert (=> b!854422 t!23245))

(declare-fun b_and!23523 () Bool)

(assert (= b_and!23521 (and (=> t!23245 result!8577) b_and!23523)))

(declare-fun m!795767 () Bool)

(assert (=> b!854418 m!795767))

(declare-fun m!795769 () Bool)

(assert (=> mapNonEmpty!26075 m!795769))

(declare-fun m!795771 () Bool)

(assert (=> b!854410 m!795771))

(declare-fun m!795773 () Bool)

(assert (=> b!854417 m!795773))

(assert (=> b!854417 m!795773))

(declare-fun m!795775 () Bool)

(assert (=> b!854417 m!795775))

(declare-fun m!795777 () Bool)

(assert (=> b!854417 m!795777))

(declare-fun m!795779 () Bool)

(assert (=> b!854413 m!795779))

(declare-fun m!795781 () Bool)

(assert (=> start!73266 m!795781))

(declare-fun m!795783 () Bool)

(assert (=> start!73266 m!795783))

(declare-fun m!795785 () Bool)

(assert (=> b!854421 m!795785))

(declare-fun m!795787 () Bool)

(assert (=> b!854421 m!795787))

(declare-fun m!795789 () Bool)

(assert (=> b!854421 m!795789))

(declare-fun m!795791 () Bool)

(assert (=> bm!38396 m!795791))

(declare-fun m!795793 () Bool)

(assert (=> b!854416 m!795793))

(declare-fun m!795795 () Bool)

(assert (=> bm!38395 m!795795))

(declare-fun m!795797 () Bool)

(assert (=> b!854422 m!795797))

(declare-fun m!795799 () Bool)

(assert (=> b!854422 m!795799))

(assert (=> b!854422 m!795791))

(declare-fun m!795801 () Bool)

(assert (=> b!854422 m!795801))

(declare-fun m!795803 () Bool)

(assert (=> b!854422 m!795803))

(declare-fun m!795805 () Bool)

(assert (=> b!854422 m!795805))

(assert (=> b!854422 m!795787))

(assert (=> b!854422 m!795773))

(declare-fun m!795807 () Bool)

(assert (=> b!854422 m!795807))

(assert (=> b!854422 m!795799))

(declare-fun m!795809 () Bool)

(assert (=> b!854422 m!795809))

(declare-fun m!795811 () Bool)

(assert (=> b!854422 m!795811))

(declare-fun m!795813 () Bool)

(assert (=> b!854422 m!795813))

(declare-fun m!795815 () Bool)

(assert (=> b!854422 m!795815))

(assert (=> b!854422 m!795811))

(assert (=> b!854422 m!795803))

(declare-fun m!795817 () Bool)

(assert (=> b!854414 m!795817))

(declare-fun m!795819 () Bool)

(assert (=> b!854415 m!795819))

(check-sat (not bm!38396) (not b!854422) (not start!73266) b_and!23523 (not b!854421) (not b!854410) (not b!854418) (not mapNonEmpty!26075) tp_is_empty!16317 (not bm!38395) (not b!854413) (not b!854414) (not b!854417) (not b_next!14181) (not b_lambda!11713) (not b!854416))
(check-sat b_and!23523 (not b_next!14181))
