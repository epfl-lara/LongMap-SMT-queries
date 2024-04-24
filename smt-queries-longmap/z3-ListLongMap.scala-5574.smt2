; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73396 () Bool)

(assert start!73396)

(declare-fun b_free!14143 () Bool)

(declare-fun b_next!14143 () Bool)

(assert (=> start!73396 (= b_free!14143 (not b_next!14143))))

(declare-fun tp!49934 () Bool)

(declare-fun b_and!23455 () Bool)

(assert (=> start!73396 (= tp!49934 b_and!23455)))

(declare-fun b!854418 () Bool)

(declare-fun e!476559 () Bool)

(declare-fun tp_is_empty!16279 () Bool)

(assert (=> b!854418 (= e!476559 tp_is_empty!16279)))

(declare-fun b!854419 () Bool)

(declare-fun res!580018 () Bool)

(declare-fun e!476566 () Bool)

(assert (=> b!854419 (=> (not res!580018) (not e!476566))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854419 (= res!580018 (validKeyInArray!0 k0!854))))

(declare-fun b!854420 () Bool)

(declare-fun res!580012 () Bool)

(assert (=> b!854420 (=> (not res!580012) (not e!476566))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48805 0))(
  ( (array!48806 (arr!23429 (Array (_ BitVec 32) (_ BitVec 64))) (size!23870 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48805)

(declare-datatypes ((V!26753 0))(
  ( (V!26754 (val!8187 Int)) )
))
(declare-datatypes ((ValueCell!7700 0))(
  ( (ValueCellFull!7700 (v!10612 V!26753)) (EmptyCell!7700) )
))
(declare-datatypes ((array!48807 0))(
  ( (array!48808 (arr!23430 (Array (_ BitVec 32) ValueCell!7700)) (size!23871 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48807)

(assert (=> b!854420 (= res!580012 (and (= (size!23871 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23870 _keys!868) (size!23871 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854421 () Bool)

(declare-fun res!580020 () Bool)

(assert (=> b!854421 (=> (not res!580020) (not e!476566))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854421 (= res!580020 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23870 _keys!868))))))

(declare-fun mapNonEmpty!26018 () Bool)

(declare-fun mapRes!26018 () Bool)

(declare-fun tp!49933 () Bool)

(assert (=> mapNonEmpty!26018 (= mapRes!26018 (and tp!49933 e!476559))))

(declare-fun mapKey!26018 () (_ BitVec 32))

(declare-fun mapValue!26018 () ValueCell!7700)

(declare-fun mapRest!26018 () (Array (_ BitVec 32) ValueCell!7700))

(assert (=> mapNonEmpty!26018 (= (arr!23430 _values!688) (store mapRest!26018 mapKey!26018 mapValue!26018))))

(declare-fun b!854422 () Bool)

(declare-fun e!476563 () Bool)

(assert (=> b!854422 (= e!476563 tp_is_empty!16279)))

(declare-fun b!854423 () Bool)

(declare-fun res!580017 () Bool)

(assert (=> b!854423 (=> (not res!580017) (not e!476566))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!854423 (= res!580017 (and (= (select (arr!23429 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-datatypes ((tuple2!10690 0))(
  ( (tuple2!10691 (_1!5356 (_ BitVec 64)) (_2!5356 V!26753)) )
))
(declare-datatypes ((List!16540 0))(
  ( (Nil!16537) (Cons!16536 (h!17673 tuple2!10690) (t!23121 List!16540)) )
))
(declare-datatypes ((ListLongMap!9461 0))(
  ( (ListLongMap!9462 (toList!4746 List!16540)) )
))
(declare-fun call!38330 () ListLongMap!9461)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!385150 () array!48807)

(declare-fun minValue!654 () V!26753)

(declare-fun zeroValue!654 () V!26753)

(declare-fun bm!38326 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2803 (array!48805 array!48807 (_ BitVec 32) (_ BitVec 32) V!26753 V!26753 (_ BitVec 32) Int) ListLongMap!9461)

(assert (=> bm!38326 (= call!38330 (getCurrentListMapNoExtraKeys!2803 _keys!868 lt!385150 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854424 () Bool)

(declare-fun res!580021 () Bool)

(assert (=> b!854424 (=> (not res!580021) (not e!476566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854424 (= res!580021 (validMask!0 mask!1196))))

(declare-fun b!854425 () Bool)

(declare-fun res!580015 () Bool)

(assert (=> b!854425 (=> (not res!580015) (not e!476566))))

(declare-datatypes ((List!16541 0))(
  ( (Nil!16538) (Cons!16537 (h!17674 (_ BitVec 64)) (t!23122 List!16541)) )
))
(declare-fun arrayNoDuplicates!0 (array!48805 (_ BitVec 32) List!16541) Bool)

(assert (=> b!854425 (= res!580015 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16538))))

(declare-fun b!854426 () Bool)

(declare-fun e!476561 () Bool)

(declare-fun e!476565 () Bool)

(assert (=> b!854426 (= e!476561 (not e!476565))))

(declare-fun res!580016 () Bool)

(assert (=> b!854426 (=> res!580016 e!476565)))

(assert (=> b!854426 (= res!580016 (not (validKeyInArray!0 (select (arr!23429 _keys!868) from!1053))))))

(declare-fun e!476562 () Bool)

(assert (=> b!854426 e!476562))

(declare-fun c!92167 () Bool)

(assert (=> b!854426 (= c!92167 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29138 0))(
  ( (Unit!29139) )
))
(declare-fun lt!385152 () Unit!29138)

(declare-fun v!557 () V!26753)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!394 (array!48805 array!48807 (_ BitVec 32) (_ BitVec 32) V!26753 V!26753 (_ BitVec 32) (_ BitVec 64) V!26753 (_ BitVec 32) Int) Unit!29138)

(assert (=> b!854426 (= lt!385152 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!394 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854427 () Bool)

(declare-fun res!580013 () Bool)

(assert (=> b!854427 (=> (not res!580013) (not e!476566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48805 (_ BitVec 32)) Bool)

(assert (=> b!854427 (= res!580013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854428 () Bool)

(declare-fun call!38329 () ListLongMap!9461)

(assert (=> b!854428 (= e!476562 (= call!38330 call!38329))))

(declare-fun bm!38327 () Bool)

(assert (=> bm!38327 (= call!38329 (getCurrentListMapNoExtraKeys!2803 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854430 () Bool)

(assert (=> b!854430 (= e!476566 e!476561)))

(declare-fun res!580014 () Bool)

(assert (=> b!854430 (=> (not res!580014) (not e!476561))))

(assert (=> b!854430 (= res!580014 (= from!1053 i!612))))

(declare-fun lt!385148 () ListLongMap!9461)

(assert (=> b!854430 (= lt!385148 (getCurrentListMapNoExtraKeys!2803 _keys!868 lt!385150 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!854430 (= lt!385150 (array!48808 (store (arr!23430 _values!688) i!612 (ValueCellFull!7700 v!557)) (size!23871 _values!688)))))

(declare-fun lt!385151 () ListLongMap!9461)

(assert (=> b!854430 (= lt!385151 (getCurrentListMapNoExtraKeys!2803 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26018 () Bool)

(assert (=> mapIsEmpty!26018 mapRes!26018))

(declare-fun b!854431 () Bool)

(assert (=> b!854431 (= e!476565 true)))

(declare-fun lt!385149 () ListLongMap!9461)

(declare-fun lt!385147 () V!26753)

(declare-fun lt!385146 () tuple2!10690)

(declare-fun +!2189 (ListLongMap!9461 tuple2!10690) ListLongMap!9461)

(assert (=> b!854431 (= (+!2189 lt!385149 lt!385146) (+!2189 (+!2189 lt!385149 (tuple2!10691 k0!854 lt!385147)) lt!385146))))

(declare-fun lt!385145 () V!26753)

(assert (=> b!854431 (= lt!385146 (tuple2!10691 k0!854 lt!385145))))

(declare-fun lt!385153 () Unit!29138)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!313 (ListLongMap!9461 (_ BitVec 64) V!26753 V!26753) Unit!29138)

(assert (=> b!854431 (= lt!385153 (addSameAsAddTwiceSameKeyDiffValues!313 lt!385149 k0!854 lt!385147 lt!385145))))

(declare-fun lt!385154 () V!26753)

(declare-fun get!12358 (ValueCell!7700 V!26753) V!26753)

(assert (=> b!854431 (= lt!385147 (get!12358 (select (arr!23430 _values!688) from!1053) lt!385154))))

(assert (=> b!854431 (= lt!385148 (+!2189 lt!385149 (tuple2!10691 (select (arr!23429 _keys!868) from!1053) lt!385145)))))

(assert (=> b!854431 (= lt!385145 (get!12358 (select (store (arr!23430 _values!688) i!612 (ValueCellFull!7700 v!557)) from!1053) lt!385154))))

(declare-fun dynLambda!1060 (Int (_ BitVec 64)) V!26753)

(assert (=> b!854431 (= lt!385154 (dynLambda!1060 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854431 (= lt!385149 (getCurrentListMapNoExtraKeys!2803 _keys!868 lt!385150 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854432 () Bool)

(declare-fun e!476560 () Bool)

(assert (=> b!854432 (= e!476560 (and e!476563 mapRes!26018))))

(declare-fun condMapEmpty!26018 () Bool)

(declare-fun mapDefault!26018 () ValueCell!7700)

(assert (=> b!854432 (= condMapEmpty!26018 (= (arr!23430 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7700)) mapDefault!26018)))))

(declare-fun b!854429 () Bool)

(assert (=> b!854429 (= e!476562 (= call!38330 (+!2189 call!38329 (tuple2!10691 k0!854 v!557))))))

(declare-fun res!580019 () Bool)

(assert (=> start!73396 (=> (not res!580019) (not e!476566))))

(assert (=> start!73396 (= res!580019 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23870 _keys!868))))))

(assert (=> start!73396 e!476566))

(assert (=> start!73396 tp_is_empty!16279))

(assert (=> start!73396 true))

(assert (=> start!73396 tp!49934))

(declare-fun array_inv!18624 (array!48805) Bool)

(assert (=> start!73396 (array_inv!18624 _keys!868)))

(declare-fun array_inv!18625 (array!48807) Bool)

(assert (=> start!73396 (and (array_inv!18625 _values!688) e!476560)))

(assert (= (and start!73396 res!580019) b!854424))

(assert (= (and b!854424 res!580021) b!854420))

(assert (= (and b!854420 res!580012) b!854427))

(assert (= (and b!854427 res!580013) b!854425))

(assert (= (and b!854425 res!580015) b!854421))

(assert (= (and b!854421 res!580020) b!854419))

(assert (= (and b!854419 res!580018) b!854423))

(assert (= (and b!854423 res!580017) b!854430))

(assert (= (and b!854430 res!580014) b!854426))

(assert (= (and b!854426 c!92167) b!854429))

(assert (= (and b!854426 (not c!92167)) b!854428))

(assert (= (or b!854429 b!854428) bm!38327))

(assert (= (or b!854429 b!854428) bm!38326))

(assert (= (and b!854426 (not res!580016)) b!854431))

(assert (= (and b!854432 condMapEmpty!26018) mapIsEmpty!26018))

(assert (= (and b!854432 (not condMapEmpty!26018)) mapNonEmpty!26018))

(get-info :version)

(assert (= (and mapNonEmpty!26018 ((_ is ValueCellFull!7700) mapValue!26018)) b!854418))

(assert (= (and b!854432 ((_ is ValueCellFull!7700) mapDefault!26018)) b!854422))

(assert (= start!73396 b!854432))

(declare-fun b_lambda!11689 () Bool)

(assert (=> (not b_lambda!11689) (not b!854431)))

(declare-fun t!23120 () Bool)

(declare-fun tb!4437 () Bool)

(assert (=> (and start!73396 (= defaultEntry!696 defaultEntry!696) t!23120) tb!4437))

(declare-fun result!8493 () Bool)

(assert (=> tb!4437 (= result!8493 tp_is_empty!16279)))

(assert (=> b!854431 t!23120))

(declare-fun b_and!23457 () Bool)

(assert (= b_and!23455 (and (=> t!23120 result!8493) b_and!23457)))

(declare-fun m!796029 () Bool)

(assert (=> b!854427 m!796029))

(declare-fun m!796031 () Bool)

(assert (=> b!854423 m!796031))

(declare-fun m!796033 () Bool)

(assert (=> b!854431 m!796033))

(declare-fun m!796035 () Bool)

(assert (=> b!854431 m!796035))

(declare-fun m!796037 () Bool)

(assert (=> b!854431 m!796037))

(declare-fun m!796039 () Bool)

(assert (=> b!854431 m!796039))

(declare-fun m!796041 () Bool)

(assert (=> b!854431 m!796041))

(assert (=> b!854431 m!796041))

(declare-fun m!796043 () Bool)

(assert (=> b!854431 m!796043))

(declare-fun m!796045 () Bool)

(assert (=> b!854431 m!796045))

(assert (=> b!854431 m!796037))

(declare-fun m!796047 () Bool)

(assert (=> b!854431 m!796047))

(assert (=> b!854431 m!796035))

(declare-fun m!796049 () Bool)

(assert (=> b!854431 m!796049))

(declare-fun m!796051 () Bool)

(assert (=> b!854431 m!796051))

(declare-fun m!796053 () Bool)

(assert (=> b!854431 m!796053))

(declare-fun m!796055 () Bool)

(assert (=> b!854431 m!796055))

(declare-fun m!796057 () Bool)

(assert (=> b!854431 m!796057))

(declare-fun m!796059 () Bool)

(assert (=> b!854425 m!796059))

(declare-fun m!796061 () Bool)

(assert (=> b!854419 m!796061))

(declare-fun m!796063 () Bool)

(assert (=> start!73396 m!796063))

(declare-fun m!796065 () Bool)

(assert (=> start!73396 m!796065))

(declare-fun m!796067 () Bool)

(assert (=> bm!38327 m!796067))

(declare-fun m!796069 () Bool)

(assert (=> b!854430 m!796069))

(assert (=> b!854430 m!796047))

(declare-fun m!796071 () Bool)

(assert (=> b!854430 m!796071))

(declare-fun m!796073 () Bool)

(assert (=> b!854429 m!796073))

(assert (=> b!854426 m!796055))

(assert (=> b!854426 m!796055))

(declare-fun m!796075 () Bool)

(assert (=> b!854426 m!796075))

(declare-fun m!796077 () Bool)

(assert (=> b!854426 m!796077))

(declare-fun m!796079 () Bool)

(assert (=> b!854424 m!796079))

(declare-fun m!796081 () Bool)

(assert (=> mapNonEmpty!26018 m!796081))

(assert (=> bm!38326 m!796051))

(check-sat (not b!854427) (not b!854431) (not b_lambda!11689) tp_is_empty!16279 (not b_next!14143) (not b!854424) (not b!854429) (not b!854425) (not b!854430) (not mapNonEmpty!26018) (not b!854419) b_and!23457 (not bm!38327) (not bm!38326) (not start!73396) (not b!854426))
(check-sat b_and!23457 (not b_next!14143))
