; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73198 () Bool)

(assert start!73198)

(declare-fun b_free!13945 () Bool)

(declare-fun b_next!13945 () Bool)

(assert (=> start!73198 (= b_free!13945 (not b_next!13945))))

(declare-fun tp!49339 () Bool)

(declare-fun b_and!23059 () Bool)

(assert (=> start!73198 (= tp!49339 b_and!23059)))

(declare-fun b!849765 () Bool)

(declare-fun res!577043 () Bool)

(declare-fun e!474189 () Bool)

(assert (=> b!849765 (=> (not res!577043) (not e!474189))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48421 0))(
  ( (array!48422 (arr!23237 (Array (_ BitVec 32) (_ BitVec 64))) (size!23678 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48421)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!849765 (= res!577043 (and (= (select (arr!23237 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849766 () Bool)

(declare-fun e!474185 () Bool)

(assert (=> b!849766 (= e!474189 e!474185)))

(declare-fun res!577045 () Bool)

(assert (=> b!849766 (=> (not res!577045) (not e!474185))))

(assert (=> b!849766 (= res!577045 (= from!1053 i!612))))

(declare-datatypes ((V!26489 0))(
  ( (V!26490 (val!8088 Int)) )
))
(declare-datatypes ((tuple2!10510 0))(
  ( (tuple2!10511 (_1!5266 (_ BitVec 64)) (_2!5266 V!26489)) )
))
(declare-datatypes ((List!16379 0))(
  ( (Nil!16376) (Cons!16375 (h!17512 tuple2!10510) (t!22762 List!16379)) )
))
(declare-datatypes ((ListLongMap!9281 0))(
  ( (ListLongMap!9282 (toList!4656 List!16379)) )
))
(declare-fun lt!382487 () ListLongMap!9281)

(declare-datatypes ((ValueCell!7601 0))(
  ( (ValueCellFull!7601 (v!10513 V!26489)) (EmptyCell!7601) )
))
(declare-datatypes ((array!48423 0))(
  ( (array!48424 (arr!23238 (Array (_ BitVec 32) ValueCell!7601)) (size!23679 (_ BitVec 32))) )
))
(declare-fun lt!382490 () array!48423)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26489)

(declare-fun zeroValue!654 () V!26489)

(declare-fun getCurrentListMapNoExtraKeys!2714 (array!48421 array!48423 (_ BitVec 32) (_ BitVec 32) V!26489 V!26489 (_ BitVec 32) Int) ListLongMap!9281)

(assert (=> b!849766 (= lt!382487 (getCurrentListMapNoExtraKeys!2714 _keys!868 lt!382490 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26489)

(declare-fun _values!688 () array!48423)

(assert (=> b!849766 (= lt!382490 (array!48424 (store (arr!23238 _values!688) i!612 (ValueCellFull!7601 v!557)) (size!23679 _values!688)))))

(declare-fun lt!382488 () ListLongMap!9281)

(assert (=> b!849766 (= lt!382488 (getCurrentListMapNoExtraKeys!2714 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849767 () Bool)

(declare-fun res!577042 () Bool)

(assert (=> b!849767 (=> (not res!577042) (not e!474189))))

(declare-datatypes ((List!16380 0))(
  ( (Nil!16377) (Cons!16376 (h!17513 (_ BitVec 64)) (t!22763 List!16380)) )
))
(declare-fun arrayNoDuplicates!0 (array!48421 (_ BitVec 32) List!16380) Bool)

(assert (=> b!849767 (= res!577042 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16377))))

(declare-fun b!849768 () Bool)

(declare-fun res!577050 () Bool)

(assert (=> b!849768 (=> (not res!577050) (not e!474189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849768 (= res!577050 (validMask!0 mask!1196))))

(declare-fun b!849769 () Bool)

(declare-fun e!474190 () Bool)

(assert (=> b!849769 (= e!474185 (not e!474190))))

(declare-fun res!577051 () Bool)

(assert (=> b!849769 (=> res!577051 e!474190)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849769 (= res!577051 (not (validKeyInArray!0 (select (arr!23237 _keys!868) from!1053))))))

(declare-fun e!474187 () Bool)

(assert (=> b!849769 e!474187))

(declare-fun c!91870 () Bool)

(assert (=> b!849769 (= c!91870 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28994 0))(
  ( (Unit!28995) )
))
(declare-fun lt!382489 () Unit!28994)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!333 (array!48421 array!48423 (_ BitVec 32) (_ BitVec 32) V!26489 V!26489 (_ BitVec 32) (_ BitVec 64) V!26489 (_ BitVec 32) Int) Unit!28994)

(assert (=> b!849769 (= lt!382489 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!333 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37735 () ListLongMap!9281)

(declare-fun b!849770 () Bool)

(declare-fun call!37736 () ListLongMap!9281)

(declare-fun +!2111 (ListLongMap!9281 tuple2!10510) ListLongMap!9281)

(assert (=> b!849770 (= e!474187 (= call!37735 (+!2111 call!37736 (tuple2!10511 k0!854 v!557))))))

(declare-fun mapIsEmpty!25721 () Bool)

(declare-fun mapRes!25721 () Bool)

(assert (=> mapIsEmpty!25721 mapRes!25721))

(declare-fun b!849772 () Bool)

(declare-fun res!577046 () Bool)

(assert (=> b!849772 (=> (not res!577046) (not e!474189))))

(assert (=> b!849772 (= res!577046 (and (= (size!23679 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23678 _keys!868) (size!23679 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849773 () Bool)

(declare-fun res!577047 () Bool)

(assert (=> b!849773 (=> (not res!577047) (not e!474189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48421 (_ BitVec 32)) Bool)

(assert (=> b!849773 (= res!577047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25721 () Bool)

(declare-fun tp!49340 () Bool)

(declare-fun e!474188 () Bool)

(assert (=> mapNonEmpty!25721 (= mapRes!25721 (and tp!49340 e!474188))))

(declare-fun mapKey!25721 () (_ BitVec 32))

(declare-fun mapValue!25721 () ValueCell!7601)

(declare-fun mapRest!25721 () (Array (_ BitVec 32) ValueCell!7601))

(assert (=> mapNonEmpty!25721 (= (arr!23238 _values!688) (store mapRest!25721 mapKey!25721 mapValue!25721))))

(declare-fun b!849774 () Bool)

(assert (=> b!849774 (= e!474190 true)))

(declare-fun get!12222 (ValueCell!7601 V!26489) V!26489)

(declare-fun dynLambda!990 (Int (_ BitVec 64)) V!26489)

(assert (=> b!849774 (= lt!382487 (+!2111 (getCurrentListMapNoExtraKeys!2714 _keys!868 lt!382490 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10511 (select (arr!23237 _keys!868) from!1053) (get!12222 (select (arr!23238 lt!382490) from!1053) (dynLambda!990 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849775 () Bool)

(assert (=> b!849775 (= e!474187 (= call!37735 call!37736))))

(declare-fun bm!37732 () Bool)

(assert (=> bm!37732 (= call!37735 (getCurrentListMapNoExtraKeys!2714 _keys!868 lt!382490 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849776 () Bool)

(declare-fun tp_is_empty!16081 () Bool)

(assert (=> b!849776 (= e!474188 tp_is_empty!16081)))

(declare-fun b!849777 () Bool)

(declare-fun res!577044 () Bool)

(assert (=> b!849777 (=> (not res!577044) (not e!474189))))

(assert (=> b!849777 (= res!577044 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23678 _keys!868))))))

(declare-fun b!849778 () Bool)

(declare-fun e!474184 () Bool)

(assert (=> b!849778 (= e!474184 tp_is_empty!16081)))

(declare-fun b!849771 () Bool)

(declare-fun e!474183 () Bool)

(assert (=> b!849771 (= e!474183 (and e!474184 mapRes!25721))))

(declare-fun condMapEmpty!25721 () Bool)

(declare-fun mapDefault!25721 () ValueCell!7601)

(assert (=> b!849771 (= condMapEmpty!25721 (= (arr!23238 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7601)) mapDefault!25721)))))

(declare-fun res!577049 () Bool)

(assert (=> start!73198 (=> (not res!577049) (not e!474189))))

(assert (=> start!73198 (= res!577049 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23678 _keys!868))))))

(assert (=> start!73198 e!474189))

(assert (=> start!73198 tp_is_empty!16081))

(assert (=> start!73198 true))

(assert (=> start!73198 tp!49339))

(declare-fun array_inv!18498 (array!48421) Bool)

(assert (=> start!73198 (array_inv!18498 _keys!868)))

(declare-fun array_inv!18499 (array!48423) Bool)

(assert (=> start!73198 (and (array_inv!18499 _values!688) e!474183)))

(declare-fun bm!37733 () Bool)

(assert (=> bm!37733 (= call!37736 (getCurrentListMapNoExtraKeys!2714 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849779 () Bool)

(declare-fun res!577048 () Bool)

(assert (=> b!849779 (=> (not res!577048) (not e!474189))))

(assert (=> b!849779 (= res!577048 (validKeyInArray!0 k0!854))))

(assert (= (and start!73198 res!577049) b!849768))

(assert (= (and b!849768 res!577050) b!849772))

(assert (= (and b!849772 res!577046) b!849773))

(assert (= (and b!849773 res!577047) b!849767))

(assert (= (and b!849767 res!577042) b!849777))

(assert (= (and b!849777 res!577044) b!849779))

(assert (= (and b!849779 res!577048) b!849765))

(assert (= (and b!849765 res!577043) b!849766))

(assert (= (and b!849766 res!577045) b!849769))

(assert (= (and b!849769 c!91870) b!849770))

(assert (= (and b!849769 (not c!91870)) b!849775))

(assert (= (or b!849770 b!849775) bm!37732))

(assert (= (or b!849770 b!849775) bm!37733))

(assert (= (and b!849769 (not res!577051)) b!849774))

(assert (= (and b!849771 condMapEmpty!25721) mapIsEmpty!25721))

(assert (= (and b!849771 (not condMapEmpty!25721)) mapNonEmpty!25721))

(get-info :version)

(assert (= (and mapNonEmpty!25721 ((_ is ValueCellFull!7601) mapValue!25721)) b!849776))

(assert (= (and b!849771 ((_ is ValueCellFull!7601) mapDefault!25721)) b!849778))

(assert (= start!73198 b!849771))

(declare-fun b_lambda!11491 () Bool)

(assert (=> (not b_lambda!11491) (not b!849774)))

(declare-fun t!22761 () Bool)

(declare-fun tb!4239 () Bool)

(assert (=> (and start!73198 (= defaultEntry!696 defaultEntry!696) t!22761) tb!4239))

(declare-fun result!8097 () Bool)

(assert (=> tb!4239 (= result!8097 tp_is_empty!16081)))

(assert (=> b!849774 t!22761))

(declare-fun b_and!23061 () Bool)

(assert (= b_and!23059 (and (=> t!22761 result!8097) b_and!23061)))

(declare-fun m!790895 () Bool)

(assert (=> b!849768 m!790895))

(declare-fun m!790897 () Bool)

(assert (=> mapNonEmpty!25721 m!790897))

(declare-fun m!790899 () Bool)

(assert (=> bm!37733 m!790899))

(declare-fun m!790901 () Bool)

(assert (=> b!849767 m!790901))

(declare-fun m!790903 () Bool)

(assert (=> b!849766 m!790903))

(declare-fun m!790905 () Bool)

(assert (=> b!849766 m!790905))

(declare-fun m!790907 () Bool)

(assert (=> b!849766 m!790907))

(declare-fun m!790909 () Bool)

(assert (=> b!849779 m!790909))

(declare-fun m!790911 () Bool)

(assert (=> b!849769 m!790911))

(assert (=> b!849769 m!790911))

(declare-fun m!790913 () Bool)

(assert (=> b!849769 m!790913))

(declare-fun m!790915 () Bool)

(assert (=> b!849769 m!790915))

(declare-fun m!790917 () Bool)

(assert (=> b!849765 m!790917))

(declare-fun m!790919 () Bool)

(assert (=> start!73198 m!790919))

(declare-fun m!790921 () Bool)

(assert (=> start!73198 m!790921))

(declare-fun m!790923 () Bool)

(assert (=> b!849773 m!790923))

(declare-fun m!790925 () Bool)

(assert (=> bm!37732 m!790925))

(declare-fun m!790927 () Bool)

(assert (=> b!849770 m!790927))

(declare-fun m!790929 () Bool)

(assert (=> b!849774 m!790929))

(declare-fun m!790931 () Bool)

(assert (=> b!849774 m!790931))

(declare-fun m!790933 () Bool)

(assert (=> b!849774 m!790933))

(assert (=> b!849774 m!790929))

(assert (=> b!849774 m!790925))

(assert (=> b!849774 m!790925))

(declare-fun m!790935 () Bool)

(assert (=> b!849774 m!790935))

(assert (=> b!849774 m!790911))

(assert (=> b!849774 m!790931))

(check-sat (not b!849768) (not b_lambda!11491) (not b!849773) (not b!849774) (not b!849767) (not b!849769) (not bm!37733) (not mapNonEmpty!25721) (not bm!37732) (not b!849770) tp_is_empty!16081 (not b!849779) b_and!23061 (not b!849766) (not b_next!13945) (not start!73198))
(check-sat b_and!23061 (not b_next!13945))
