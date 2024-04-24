; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73126 () Bool)

(assert start!73126)

(declare-fun b_free!13873 () Bool)

(declare-fun b_next!13873 () Bool)

(assert (=> start!73126 (= b_free!13873 (not b_next!13873))))

(declare-fun tp!49124 () Bool)

(declare-fun b_and!22969 () Bool)

(assert (=> start!73126 (= tp!49124 b_and!22969)))

(declare-fun b!848197 () Bool)

(declare-fun e!473394 () Bool)

(declare-datatypes ((V!26393 0))(
  ( (V!26394 (val!8052 Int)) )
))
(declare-datatypes ((tuple2!10442 0))(
  ( (tuple2!10443 (_1!5232 (_ BitVec 64)) (_2!5232 V!26393)) )
))
(declare-datatypes ((List!16314 0))(
  ( (Nil!16311) (Cons!16310 (h!17447 tuple2!10442) (t!22677 List!16314)) )
))
(declare-datatypes ((ListLongMap!9213 0))(
  ( (ListLongMap!9214 (toList!4622 List!16314)) )
))
(declare-fun call!37519 () ListLongMap!9213)

(declare-fun call!37520 () ListLongMap!9213)

(assert (=> b!848197 (= e!473394 (= call!37519 call!37520))))

(declare-fun b!848198 () Bool)

(declare-fun e!473391 () Bool)

(declare-fun e!473393 () Bool)

(assert (=> b!848198 (= e!473391 e!473393)))

(declare-fun res!576037 () Bool)

(assert (=> b!848198 (=> (not res!576037) (not e!473393))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848198 (= res!576037 (= from!1053 i!612))))

(declare-fun lt!382055 () ListLongMap!9213)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48281 0))(
  ( (array!48282 (arr!23167 (Array (_ BitVec 32) (_ BitVec 64))) (size!23608 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48281)

(declare-fun minValue!654 () V!26393)

(declare-fun zeroValue!654 () V!26393)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7565 0))(
  ( (ValueCellFull!7565 (v!10477 V!26393)) (EmptyCell!7565) )
))
(declare-datatypes ((array!48283 0))(
  ( (array!48284 (arr!23168 (Array (_ BitVec 32) ValueCell!7565)) (size!23609 (_ BitVec 32))) )
))
(declare-fun lt!382057 () array!48283)

(declare-fun getCurrentListMapNoExtraKeys!2680 (array!48281 array!48283 (_ BitVec 32) (_ BitVec 32) V!26393 V!26393 (_ BitVec 32) Int) ListLongMap!9213)

(assert (=> b!848198 (= lt!382055 (getCurrentListMapNoExtraKeys!2680 _keys!868 lt!382057 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26393)

(declare-fun _values!688 () array!48283)

(assert (=> b!848198 (= lt!382057 (array!48284 (store (arr!23168 _values!688) i!612 (ValueCellFull!7565 v!557)) (size!23609 _values!688)))))

(declare-fun lt!382056 () ListLongMap!9213)

(assert (=> b!848198 (= lt!382056 (getCurrentListMapNoExtraKeys!2680 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848199 () Bool)

(declare-fun res!576039 () Bool)

(assert (=> b!848199 (=> (not res!576039) (not e!473391))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!848199 (= res!576039 (and (= (select (arr!23167 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848200 () Bool)

(declare-fun +!2084 (ListLongMap!9213 tuple2!10442) ListLongMap!9213)

(assert (=> b!848200 (= e!473394 (= call!37519 (+!2084 call!37520 (tuple2!10443 k0!854 v!557))))))

(declare-fun bm!37516 () Bool)

(assert (=> bm!37516 (= call!37520 (getCurrentListMapNoExtraKeys!2680 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848201 () Bool)

(declare-fun res!576035 () Bool)

(assert (=> b!848201 (=> (not res!576035) (not e!473391))))

(assert (=> b!848201 (= res!576035 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23608 _keys!868))))))

(declare-fun b!848202 () Bool)

(declare-fun res!576038 () Bool)

(assert (=> b!848202 (=> (not res!576038) (not e!473391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848202 (= res!576038 (validMask!0 mask!1196))))

(declare-fun b!848203 () Bool)

(declare-fun res!576036 () Bool)

(assert (=> b!848203 (=> (not res!576036) (not e!473391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48281 (_ BitVec 32)) Bool)

(assert (=> b!848203 (= res!576036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848204 () Bool)

(assert (=> b!848204 (= e!473393 (not true))))

(assert (=> b!848204 e!473394))

(declare-fun c!91762 () Bool)

(assert (=> b!848204 (= c!91762 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28948 0))(
  ( (Unit!28949) )
))
(declare-fun lt!382058 () Unit!28948)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!310 (array!48281 array!48283 (_ BitVec 32) (_ BitVec 32) V!26393 V!26393 (_ BitVec 32) (_ BitVec 64) V!26393 (_ BitVec 32) Int) Unit!28948)

(assert (=> b!848204 (= lt!382058 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!310 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848205 () Bool)

(declare-fun e!473390 () Bool)

(declare-fun tp_is_empty!16009 () Bool)

(assert (=> b!848205 (= e!473390 tp_is_empty!16009)))

(declare-fun b!848206 () Bool)

(declare-fun res!576032 () Bool)

(assert (=> b!848206 (=> (not res!576032) (not e!473391))))

(assert (=> b!848206 (= res!576032 (and (= (size!23609 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23608 _keys!868) (size!23609 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848207 () Bool)

(declare-fun res!576033 () Bool)

(assert (=> b!848207 (=> (not res!576033) (not e!473391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848207 (= res!576033 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25613 () Bool)

(declare-fun mapRes!25613 () Bool)

(assert (=> mapIsEmpty!25613 mapRes!25613))

(declare-fun b!848208 () Bool)

(declare-fun res!576040 () Bool)

(assert (=> b!848208 (=> (not res!576040) (not e!473391))))

(declare-datatypes ((List!16315 0))(
  ( (Nil!16312) (Cons!16311 (h!17448 (_ BitVec 64)) (t!22678 List!16315)) )
))
(declare-fun arrayNoDuplicates!0 (array!48281 (_ BitVec 32) List!16315) Bool)

(assert (=> b!848208 (= res!576040 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16312))))

(declare-fun res!576034 () Bool)

(assert (=> start!73126 (=> (not res!576034) (not e!473391))))

(assert (=> start!73126 (= res!576034 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23608 _keys!868))))))

(assert (=> start!73126 e!473391))

(assert (=> start!73126 tp_is_empty!16009))

(assert (=> start!73126 true))

(assert (=> start!73126 tp!49124))

(declare-fun array_inv!18452 (array!48281) Bool)

(assert (=> start!73126 (array_inv!18452 _keys!868)))

(declare-fun e!473389 () Bool)

(declare-fun array_inv!18453 (array!48283) Bool)

(assert (=> start!73126 (and (array_inv!18453 _values!688) e!473389)))

(declare-fun b!848209 () Bool)

(declare-fun e!473392 () Bool)

(assert (=> b!848209 (= e!473392 tp_is_empty!16009)))

(declare-fun b!848210 () Bool)

(assert (=> b!848210 (= e!473389 (and e!473392 mapRes!25613))))

(declare-fun condMapEmpty!25613 () Bool)

(declare-fun mapDefault!25613 () ValueCell!7565)

(assert (=> b!848210 (= condMapEmpty!25613 (= (arr!23168 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7565)) mapDefault!25613)))))

(declare-fun bm!37517 () Bool)

(assert (=> bm!37517 (= call!37519 (getCurrentListMapNoExtraKeys!2680 _keys!868 lt!382057 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25613 () Bool)

(declare-fun tp!49123 () Bool)

(assert (=> mapNonEmpty!25613 (= mapRes!25613 (and tp!49123 e!473390))))

(declare-fun mapRest!25613 () (Array (_ BitVec 32) ValueCell!7565))

(declare-fun mapKey!25613 () (_ BitVec 32))

(declare-fun mapValue!25613 () ValueCell!7565)

(assert (=> mapNonEmpty!25613 (= (arr!23168 _values!688) (store mapRest!25613 mapKey!25613 mapValue!25613))))

(assert (= (and start!73126 res!576034) b!848202))

(assert (= (and b!848202 res!576038) b!848206))

(assert (= (and b!848206 res!576032) b!848203))

(assert (= (and b!848203 res!576036) b!848208))

(assert (= (and b!848208 res!576040) b!848201))

(assert (= (and b!848201 res!576035) b!848207))

(assert (= (and b!848207 res!576033) b!848199))

(assert (= (and b!848199 res!576039) b!848198))

(assert (= (and b!848198 res!576037) b!848204))

(assert (= (and b!848204 c!91762) b!848200))

(assert (= (and b!848204 (not c!91762)) b!848197))

(assert (= (or b!848200 b!848197) bm!37517))

(assert (= (or b!848200 b!848197) bm!37516))

(assert (= (and b!848210 condMapEmpty!25613) mapIsEmpty!25613))

(assert (= (and b!848210 (not condMapEmpty!25613)) mapNonEmpty!25613))

(get-info :version)

(assert (= (and mapNonEmpty!25613 ((_ is ValueCellFull!7565) mapValue!25613)) b!848205))

(assert (= (and b!848210 ((_ is ValueCellFull!7565) mapDefault!25613)) b!848209))

(assert (= start!73126 b!848210))

(declare-fun m!789695 () Bool)

(assert (=> bm!37516 m!789695))

(declare-fun m!789697 () Bool)

(assert (=> b!848200 m!789697))

(declare-fun m!789699 () Bool)

(assert (=> mapNonEmpty!25613 m!789699))

(declare-fun m!789701 () Bool)

(assert (=> b!848204 m!789701))

(declare-fun m!789703 () Bool)

(assert (=> b!848203 m!789703))

(declare-fun m!789705 () Bool)

(assert (=> start!73126 m!789705))

(declare-fun m!789707 () Bool)

(assert (=> start!73126 m!789707))

(declare-fun m!789709 () Bool)

(assert (=> bm!37517 m!789709))

(declare-fun m!789711 () Bool)

(assert (=> b!848208 m!789711))

(declare-fun m!789713 () Bool)

(assert (=> b!848198 m!789713))

(declare-fun m!789715 () Bool)

(assert (=> b!848198 m!789715))

(declare-fun m!789717 () Bool)

(assert (=> b!848198 m!789717))

(declare-fun m!789719 () Bool)

(assert (=> b!848199 m!789719))

(declare-fun m!789721 () Bool)

(assert (=> b!848207 m!789721))

(declare-fun m!789723 () Bool)

(assert (=> b!848202 m!789723))

(check-sat (not bm!37516) (not b_next!13873) b_and!22969 (not b!848207) (not bm!37517) (not b!848202) (not start!73126) tp_is_empty!16009 (not b!848204) (not mapNonEmpty!25613) (not b!848208) (not b!848203) (not b!848200) (not b!848198))
(check-sat b_and!22969 (not b_next!13873))
