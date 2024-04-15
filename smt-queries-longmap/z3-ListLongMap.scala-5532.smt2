; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72958 () Bool)

(assert start!72958)

(declare-fun b_free!13891 () Bool)

(declare-fun b_next!13891 () Bool)

(assert (=> start!72958 (= b_free!13891 (not b_next!13891))))

(declare-fun tp!49177 () Bool)

(declare-fun b_and!22951 () Bool)

(assert (=> start!72958 (= tp!49177 b_and!22951)))

(declare-fun b!847433 () Bool)

(declare-fun e!472851 () Bool)

(assert (=> b!847433 (= e!472851 (not true))))

(declare-fun e!472854 () Bool)

(assert (=> b!847433 e!472854))

(declare-fun c!91442 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847433 (= c!91442 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26417 0))(
  ( (V!26418 (val!8061 Int)) )
))
(declare-fun v!557 () V!26417)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((Unit!28891 0))(
  ( (Unit!28892) )
))
(declare-fun lt!381568 () Unit!28891)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48263 0))(
  ( (array!48264 (arr!23163 (Array (_ BitVec 32) (_ BitVec 64))) (size!23605 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48263)

(declare-datatypes ((ValueCell!7574 0))(
  ( (ValueCellFull!7574 (v!10480 V!26417)) (EmptyCell!7574) )
))
(declare-datatypes ((array!48265 0))(
  ( (array!48266 (arr!23164 (Array (_ BitVec 32) ValueCell!7574)) (size!23606 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48265)

(declare-fun minValue!654 () V!26417)

(declare-fun zeroValue!654 () V!26417)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!320 (array!48263 array!48265 (_ BitVec 32) (_ BitVec 32) V!26417 V!26417 (_ BitVec 32) (_ BitVec 64) V!26417 (_ BitVec 32) Int) Unit!28891)

(assert (=> b!847433 (= lt!381568 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!320 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!575826 () Bool)

(declare-fun e!472853 () Bool)

(assert (=> start!72958 (=> (not res!575826) (not e!472853))))

(assert (=> start!72958 (= res!575826 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23605 _keys!868))))))

(assert (=> start!72958 e!472853))

(declare-fun tp_is_empty!16027 () Bool)

(assert (=> start!72958 tp_is_empty!16027))

(assert (=> start!72958 true))

(assert (=> start!72958 tp!49177))

(declare-fun array_inv!18470 (array!48263) Bool)

(assert (=> start!72958 (array_inv!18470 _keys!868)))

(declare-fun e!472848 () Bool)

(declare-fun array_inv!18471 (array!48265) Bool)

(assert (=> start!72958 (and (array_inv!18471 _values!688) e!472848)))

(declare-fun b!847434 () Bool)

(declare-fun res!575828 () Bool)

(assert (=> b!847434 (=> (not res!575828) (not e!472853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48263 (_ BitVec 32)) Bool)

(assert (=> b!847434 (= res!575828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847435 () Bool)

(declare-fun e!472850 () Bool)

(declare-fun mapRes!25640 () Bool)

(assert (=> b!847435 (= e!472848 (and e!472850 mapRes!25640))))

(declare-fun condMapEmpty!25640 () Bool)

(declare-fun mapDefault!25640 () ValueCell!7574)

(assert (=> b!847435 (= condMapEmpty!25640 (= (arr!23164 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7574)) mapDefault!25640)))))

(declare-fun mapIsEmpty!25640 () Bool)

(assert (=> mapIsEmpty!25640 mapRes!25640))

(declare-fun b!847436 () Bool)

(declare-fun res!575824 () Bool)

(assert (=> b!847436 (=> (not res!575824) (not e!472853))))

(assert (=> b!847436 (= res!575824 (and (= (size!23606 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23605 _keys!868) (size!23606 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847437 () Bool)

(declare-fun res!575827 () Bool)

(assert (=> b!847437 (=> (not res!575827) (not e!472853))))

(assert (=> b!847437 (= res!575827 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23605 _keys!868))))))

(declare-fun b!847438 () Bool)

(assert (=> b!847438 (= e!472850 tp_is_empty!16027)))

(declare-fun bm!37499 () Bool)

(declare-datatypes ((tuple2!10560 0))(
  ( (tuple2!10561 (_1!5291 (_ BitVec 64)) (_2!5291 V!26417)) )
))
(declare-datatypes ((List!16416 0))(
  ( (Nil!16413) (Cons!16412 (h!17543 tuple2!10560) (t!22778 List!16416)) )
))
(declare-datatypes ((ListLongMap!9319 0))(
  ( (ListLongMap!9320 (toList!4675 List!16416)) )
))
(declare-fun call!37502 () ListLongMap!9319)

(declare-fun getCurrentListMapNoExtraKeys!2688 (array!48263 array!48265 (_ BitVec 32) (_ BitVec 32) V!26417 V!26417 (_ BitVec 32) Int) ListLongMap!9319)

(assert (=> bm!37499 (= call!37502 (getCurrentListMapNoExtraKeys!2688 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37500 () Bool)

(declare-fun call!37503 () ListLongMap!9319)

(declare-fun lt!381567 () array!48265)

(assert (=> bm!37500 (= call!37503 (getCurrentListMapNoExtraKeys!2688 _keys!868 lt!381567 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847439 () Bool)

(declare-fun res!575829 () Bool)

(assert (=> b!847439 (=> (not res!575829) (not e!472853))))

(assert (=> b!847439 (= res!575829 (and (= (select (arr!23163 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847440 () Bool)

(declare-fun res!575825 () Bool)

(assert (=> b!847440 (=> (not res!575825) (not e!472853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847440 (= res!575825 (validKeyInArray!0 k0!854))))

(declare-fun b!847441 () Bool)

(declare-fun +!2106 (ListLongMap!9319 tuple2!10560) ListLongMap!9319)

(assert (=> b!847441 (= e!472854 (= call!37503 (+!2106 call!37502 (tuple2!10561 k0!854 v!557))))))

(declare-fun b!847442 () Bool)

(declare-fun res!575823 () Bool)

(assert (=> b!847442 (=> (not res!575823) (not e!472853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847442 (= res!575823 (validMask!0 mask!1196))))

(declare-fun b!847443 () Bool)

(declare-fun res!575822 () Bool)

(assert (=> b!847443 (=> (not res!575822) (not e!472853))))

(declare-datatypes ((List!16417 0))(
  ( (Nil!16414) (Cons!16413 (h!17544 (_ BitVec 64)) (t!22779 List!16417)) )
))
(declare-fun arrayNoDuplicates!0 (array!48263 (_ BitVec 32) List!16417) Bool)

(assert (=> b!847443 (= res!575822 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16414))))

(declare-fun b!847444 () Bool)

(assert (=> b!847444 (= e!472853 e!472851)))

(declare-fun res!575821 () Bool)

(assert (=> b!847444 (=> (not res!575821) (not e!472851))))

(assert (=> b!847444 (= res!575821 (= from!1053 i!612))))

(declare-fun lt!381566 () ListLongMap!9319)

(assert (=> b!847444 (= lt!381566 (getCurrentListMapNoExtraKeys!2688 _keys!868 lt!381567 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!847444 (= lt!381567 (array!48266 (store (arr!23164 _values!688) i!612 (ValueCellFull!7574 v!557)) (size!23606 _values!688)))))

(declare-fun lt!381569 () ListLongMap!9319)

(assert (=> b!847444 (= lt!381569 (getCurrentListMapNoExtraKeys!2688 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847445 () Bool)

(assert (=> b!847445 (= e!472854 (= call!37503 call!37502))))

(declare-fun b!847446 () Bool)

(declare-fun e!472849 () Bool)

(assert (=> b!847446 (= e!472849 tp_is_empty!16027)))

(declare-fun mapNonEmpty!25640 () Bool)

(declare-fun tp!49178 () Bool)

(assert (=> mapNonEmpty!25640 (= mapRes!25640 (and tp!49178 e!472849))))

(declare-fun mapKey!25640 () (_ BitVec 32))

(declare-fun mapRest!25640 () (Array (_ BitVec 32) ValueCell!7574))

(declare-fun mapValue!25640 () ValueCell!7574)

(assert (=> mapNonEmpty!25640 (= (arr!23164 _values!688) (store mapRest!25640 mapKey!25640 mapValue!25640))))

(assert (= (and start!72958 res!575826) b!847442))

(assert (= (and b!847442 res!575823) b!847436))

(assert (= (and b!847436 res!575824) b!847434))

(assert (= (and b!847434 res!575828) b!847443))

(assert (= (and b!847443 res!575822) b!847437))

(assert (= (and b!847437 res!575827) b!847440))

(assert (= (and b!847440 res!575825) b!847439))

(assert (= (and b!847439 res!575829) b!847444))

(assert (= (and b!847444 res!575821) b!847433))

(assert (= (and b!847433 c!91442) b!847441))

(assert (= (and b!847433 (not c!91442)) b!847445))

(assert (= (or b!847441 b!847445) bm!37500))

(assert (= (or b!847441 b!847445) bm!37499))

(assert (= (and b!847435 condMapEmpty!25640) mapIsEmpty!25640))

(assert (= (and b!847435 (not condMapEmpty!25640)) mapNonEmpty!25640))

(get-info :version)

(assert (= (and mapNonEmpty!25640 ((_ is ValueCellFull!7574) mapValue!25640)) b!847446))

(assert (= (and b!847435 ((_ is ValueCellFull!7574) mapDefault!25640)) b!847438))

(assert (= start!72958 b!847435))

(declare-fun m!787919 () Bool)

(assert (=> start!72958 m!787919))

(declare-fun m!787921 () Bool)

(assert (=> start!72958 m!787921))

(declare-fun m!787923 () Bool)

(assert (=> mapNonEmpty!25640 m!787923))

(declare-fun m!787925 () Bool)

(assert (=> b!847443 m!787925))

(declare-fun m!787927 () Bool)

(assert (=> bm!37499 m!787927))

(declare-fun m!787929 () Bool)

(assert (=> b!847444 m!787929))

(declare-fun m!787931 () Bool)

(assert (=> b!847444 m!787931))

(declare-fun m!787933 () Bool)

(assert (=> b!847444 m!787933))

(declare-fun m!787935 () Bool)

(assert (=> bm!37500 m!787935))

(declare-fun m!787937 () Bool)

(assert (=> b!847433 m!787937))

(declare-fun m!787939 () Bool)

(assert (=> b!847440 m!787939))

(declare-fun m!787941 () Bool)

(assert (=> b!847442 m!787941))

(declare-fun m!787943 () Bool)

(assert (=> b!847441 m!787943))

(declare-fun m!787945 () Bool)

(assert (=> b!847434 m!787945))

(declare-fun m!787947 () Bool)

(assert (=> b!847439 m!787947))

(check-sat (not b_next!13891) (not bm!37500) (not b!847443) (not b!847440) (not start!72958) (not b!847441) (not b!847433) (not b!847444) tp_is_empty!16027 b_and!22951 (not mapNonEmpty!25640) (not b!847434) (not bm!37499) (not b!847442))
(check-sat b_and!22951 (not b_next!13891))
