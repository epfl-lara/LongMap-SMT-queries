; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74422 () Bool)

(assert start!74422)

(declare-fun b_free!15165 () Bool)

(declare-fun b_next!15165 () Bool)

(assert (=> start!74422 (= b_free!15165 (not b_next!15165))))

(declare-fun tp!53173 () Bool)

(declare-fun b_and!24983 () Bool)

(assert (=> start!74422 (= tp!53173 b_and!24983)))

(declare-fun b!876388 () Bool)

(declare-fun res!595529 () Bool)

(declare-fun e!487865 () Bool)

(assert (=> b!876388 (=> (not res!595529) (not e!487865))))

(declare-datatypes ((array!50944 0))(
  ( (array!50945 (arr!24499 (Array (_ BitVec 32) (_ BitVec 64))) (size!24939 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50944)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50944 (_ BitVec 32)) Bool)

(assert (=> b!876388 (= res!595529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!38735 () Bool)

(declare-datatypes ((V!28259 0))(
  ( (V!28260 (val!8752 Int)) )
))
(declare-datatypes ((tuple2!11572 0))(
  ( (tuple2!11573 (_1!5797 (_ BitVec 64)) (_2!5797 V!28259)) )
))
(declare-datatypes ((List!17389 0))(
  ( (Nil!17386) (Cons!17385 (h!18516 tuple2!11572) (t!24458 List!17389)) )
))
(declare-datatypes ((ListLongMap!10341 0))(
  ( (ListLongMap!10342 (toList!5186 List!17389)) )
))
(declare-fun call!38738 () ListLongMap!10341)

(declare-datatypes ((ValueCell!8265 0))(
  ( (ValueCellFull!8265 (v!11185 V!28259)) (EmptyCell!8265) )
))
(declare-datatypes ((array!50946 0))(
  ( (array!50947 (arr!24500 (Array (_ BitVec 32) ValueCell!8265)) (size!24940 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50946)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28259)

(declare-fun zeroValue!654 () V!28259)

(declare-fun getCurrentListMapNoExtraKeys!3153 (array!50944 array!50946 (_ BitVec 32) (_ BitVec 32) V!28259 V!28259 (_ BitVec 32) Int) ListLongMap!10341)

(assert (=> bm!38735 (= call!38738 (getCurrentListMapNoExtraKeys!3153 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876389 () Bool)

(declare-fun e!487862 () Bool)

(declare-fun call!38739 () ListLongMap!10341)

(assert (=> b!876389 (= e!487862 (= call!38739 call!38738))))

(declare-fun v!557 () V!28259)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!876390 () Bool)

(declare-fun +!2486 (ListLongMap!10341 tuple2!11572) ListLongMap!10341)

(assert (=> b!876390 (= e!487862 (= call!38739 (+!2486 call!38738 (tuple2!11573 k0!854 v!557))))))

(declare-fun b!876391 () Bool)

(declare-fun e!487864 () Bool)

(declare-fun tp_is_empty!17409 () Bool)

(assert (=> b!876391 (= e!487864 tp_is_empty!17409)))

(declare-fun mapNonEmpty!27725 () Bool)

(declare-fun mapRes!27725 () Bool)

(declare-fun tp!53172 () Bool)

(declare-fun e!487869 () Bool)

(assert (=> mapNonEmpty!27725 (= mapRes!27725 (and tp!53172 e!487869))))

(declare-fun mapValue!27725 () ValueCell!8265)

(declare-fun mapKey!27725 () (_ BitVec 32))

(declare-fun mapRest!27725 () (Array (_ BitVec 32) ValueCell!8265))

(assert (=> mapNonEmpty!27725 (= (arr!24500 _values!688) (store mapRest!27725 mapKey!27725 mapValue!27725))))

(declare-fun b!876392 () Bool)

(declare-fun e!487868 () Bool)

(declare-fun e!487867 () Bool)

(assert (=> b!876392 (= e!487868 (not e!487867))))

(declare-fun res!595520 () Bool)

(assert (=> b!876392 (=> res!595520 e!487867)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876392 (= res!595520 (not (validKeyInArray!0 (select (arr!24499 _keys!868) from!1053))))))

(assert (=> b!876392 e!487862))

(declare-fun c!92597 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876392 (= c!92597 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29968 0))(
  ( (Unit!29969) )
))
(declare-fun lt!396468 () Unit!29968)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!677 (array!50944 array!50946 (_ BitVec 32) (_ BitVec 32) V!28259 V!28259 (_ BitVec 32) (_ BitVec 64) V!28259 (_ BitVec 32) Int) Unit!29968)

(assert (=> b!876392 (= lt!396468 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!677 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876393 () Bool)

(assert (=> b!876393 (= e!487869 tp_is_empty!17409)))

(declare-fun res!595526 () Bool)

(assert (=> start!74422 (=> (not res!595526) (not e!487865))))

(assert (=> start!74422 (= res!595526 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24939 _keys!868))))))

(assert (=> start!74422 e!487865))

(assert (=> start!74422 tp_is_empty!17409))

(assert (=> start!74422 true))

(assert (=> start!74422 tp!53173))

(declare-fun array_inv!19314 (array!50944) Bool)

(assert (=> start!74422 (array_inv!19314 _keys!868)))

(declare-fun e!487866 () Bool)

(declare-fun array_inv!19315 (array!50946) Bool)

(assert (=> start!74422 (and (array_inv!19315 _values!688) e!487866)))

(declare-fun b!876394 () Bool)

(assert (=> b!876394 (= e!487865 e!487868)))

(declare-fun res!595524 () Bool)

(assert (=> b!876394 (=> (not res!595524) (not e!487868))))

(assert (=> b!876394 (= res!595524 (= from!1053 i!612))))

(declare-fun lt!396470 () array!50946)

(declare-fun lt!396469 () ListLongMap!10341)

(assert (=> b!876394 (= lt!396469 (getCurrentListMapNoExtraKeys!3153 _keys!868 lt!396470 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!876394 (= lt!396470 (array!50947 (store (arr!24500 _values!688) i!612 (ValueCellFull!8265 v!557)) (size!24940 _values!688)))))

(declare-fun lt!396471 () ListLongMap!10341)

(assert (=> b!876394 (= lt!396471 (getCurrentListMapNoExtraKeys!3153 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!876395 () Bool)

(declare-fun res!595527 () Bool)

(assert (=> b!876395 (=> (not res!595527) (not e!487865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876395 (= res!595527 (validMask!0 mask!1196))))

(declare-fun b!876396 () Bool)

(declare-fun res!595522 () Bool)

(assert (=> b!876396 (=> (not res!595522) (not e!487865))))

(assert (=> b!876396 (= res!595522 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24939 _keys!868))))))

(declare-fun b!876397 () Bool)

(declare-fun res!595528 () Bool)

(assert (=> b!876397 (=> (not res!595528) (not e!487865))))

(declare-datatypes ((List!17390 0))(
  ( (Nil!17387) (Cons!17386 (h!18517 (_ BitVec 64)) (t!24459 List!17390)) )
))
(declare-fun arrayNoDuplicates!0 (array!50944 (_ BitVec 32) List!17390) Bool)

(assert (=> b!876397 (= res!595528 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17387))))

(declare-fun b!876398 () Bool)

(declare-fun res!595523 () Bool)

(assert (=> b!876398 (=> (not res!595523) (not e!487865))))

(assert (=> b!876398 (= res!595523 (and (= (size!24940 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24939 _keys!868) (size!24940 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876399 () Bool)

(assert (=> b!876399 (= e!487867 (bvslt from!1053 (size!24940 _values!688)))))

(declare-fun get!12883 (ValueCell!8265 V!28259) V!28259)

(declare-fun dynLambda!1213 (Int (_ BitVec 64)) V!28259)

(assert (=> b!876399 (= lt!396469 (+!2486 (getCurrentListMapNoExtraKeys!3153 _keys!868 lt!396470 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11573 (select (arr!24499 _keys!868) from!1053) (get!12883 (select (arr!24500 lt!396470) from!1053) (dynLambda!1213 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876400 () Bool)

(assert (=> b!876400 (= e!487866 (and e!487864 mapRes!27725))))

(declare-fun condMapEmpty!27725 () Bool)

(declare-fun mapDefault!27725 () ValueCell!8265)

(assert (=> b!876400 (= condMapEmpty!27725 (= (arr!24500 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8265)) mapDefault!27725)))))

(declare-fun bm!38736 () Bool)

(assert (=> bm!38736 (= call!38739 (getCurrentListMapNoExtraKeys!3153 _keys!868 lt!396470 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876401 () Bool)

(declare-fun res!595525 () Bool)

(assert (=> b!876401 (=> (not res!595525) (not e!487865))))

(assert (=> b!876401 (= res!595525 (and (= (select (arr!24499 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!876402 () Bool)

(declare-fun res!595521 () Bool)

(assert (=> b!876402 (=> (not res!595521) (not e!487865))))

(assert (=> b!876402 (= res!595521 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27725 () Bool)

(assert (=> mapIsEmpty!27725 mapRes!27725))

(assert (= (and start!74422 res!595526) b!876395))

(assert (= (and b!876395 res!595527) b!876398))

(assert (= (and b!876398 res!595523) b!876388))

(assert (= (and b!876388 res!595529) b!876397))

(assert (= (and b!876397 res!595528) b!876396))

(assert (= (and b!876396 res!595522) b!876402))

(assert (= (and b!876402 res!595521) b!876401))

(assert (= (and b!876401 res!595525) b!876394))

(assert (= (and b!876394 res!595524) b!876392))

(assert (= (and b!876392 c!92597) b!876390))

(assert (= (and b!876392 (not c!92597)) b!876389))

(assert (= (or b!876390 b!876389) bm!38736))

(assert (= (or b!876390 b!876389) bm!38735))

(assert (= (and b!876392 (not res!595520)) b!876399))

(assert (= (and b!876400 condMapEmpty!27725) mapIsEmpty!27725))

(assert (= (and b!876400 (not condMapEmpty!27725)) mapNonEmpty!27725))

(get-info :version)

(assert (= (and mapNonEmpty!27725 ((_ is ValueCellFull!8265) mapValue!27725)) b!876393))

(assert (= (and b!876400 ((_ is ValueCellFull!8265) mapDefault!27725)) b!876391))

(assert (= start!74422 b!876400))

(declare-fun b_lambda!12233 () Bool)

(assert (=> (not b_lambda!12233) (not b!876399)))

(declare-fun t!24457 () Bool)

(declare-fun tb!4925 () Bool)

(assert (=> (and start!74422 (= defaultEntry!696 defaultEntry!696) t!24457) tb!4925))

(declare-fun result!9469 () Bool)

(assert (=> tb!4925 (= result!9469 tp_is_empty!17409)))

(assert (=> b!876399 t!24457))

(declare-fun b_and!24985 () Bool)

(assert (= b_and!24983 (and (=> t!24457 result!9469) b_and!24985)))

(declare-fun m!816155 () Bool)

(assert (=> start!74422 m!816155))

(declare-fun m!816157 () Bool)

(assert (=> start!74422 m!816157))

(declare-fun m!816159 () Bool)

(assert (=> bm!38735 m!816159))

(declare-fun m!816161 () Bool)

(assert (=> mapNonEmpty!27725 m!816161))

(declare-fun m!816163 () Bool)

(assert (=> b!876388 m!816163))

(declare-fun m!816165 () Bool)

(assert (=> bm!38736 m!816165))

(declare-fun m!816167 () Bool)

(assert (=> b!876395 m!816167))

(declare-fun m!816169 () Bool)

(assert (=> b!876392 m!816169))

(assert (=> b!876392 m!816169))

(declare-fun m!816171 () Bool)

(assert (=> b!876392 m!816171))

(declare-fun m!816173 () Bool)

(assert (=> b!876392 m!816173))

(declare-fun m!816175 () Bool)

(assert (=> b!876401 m!816175))

(declare-fun m!816177 () Bool)

(assert (=> b!876399 m!816177))

(declare-fun m!816179 () Bool)

(assert (=> b!876399 m!816179))

(declare-fun m!816181 () Bool)

(assert (=> b!876399 m!816181))

(assert (=> b!876399 m!816165))

(assert (=> b!876399 m!816177))

(assert (=> b!876399 m!816165))

(declare-fun m!816183 () Bool)

(assert (=> b!876399 m!816183))

(assert (=> b!876399 m!816169))

(assert (=> b!876399 m!816179))

(declare-fun m!816185 () Bool)

(assert (=> b!876390 m!816185))

(declare-fun m!816187 () Bool)

(assert (=> b!876402 m!816187))

(declare-fun m!816189 () Bool)

(assert (=> b!876394 m!816189))

(declare-fun m!816191 () Bool)

(assert (=> b!876394 m!816191))

(declare-fun m!816193 () Bool)

(assert (=> b!876394 m!816193))

(declare-fun m!816195 () Bool)

(assert (=> b!876397 m!816195))

(check-sat (not b!876399) (not b!876390) (not bm!38736) (not b!876395) (not b!876388) (not mapNonEmpty!27725) tp_is_empty!17409 (not b!876394) (not b!876397) (not bm!38735) (not b_next!15165) b_and!24985 (not start!74422) (not b!876402) (not b!876392) (not b_lambda!12233))
(check-sat b_and!24985 (not b_next!15165))
