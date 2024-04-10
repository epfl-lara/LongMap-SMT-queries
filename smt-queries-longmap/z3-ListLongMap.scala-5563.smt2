; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73164 () Bool)

(assert start!73164)

(declare-fun b_free!14079 () Bool)

(declare-fun b_next!14079 () Bool)

(assert (=> start!73164 (= b_free!14079 (not b_next!14079))))

(declare-fun tp!49741 () Bool)

(declare-fun b_and!23317 () Bool)

(assert (=> start!73164 (= tp!49741 b_and!23317)))

(declare-fun mapIsEmpty!25922 () Bool)

(declare-fun mapRes!25922 () Bool)

(assert (=> mapIsEmpty!25922 mapRes!25922))

(declare-fun b!852011 () Bool)

(declare-fun res!578716 () Bool)

(declare-fun e!475209 () Bool)

(assert (=> b!852011 (=> (not res!578716) (not e!475209))))

(declare-datatypes ((array!48628 0))(
  ( (array!48629 (arr!23345 (Array (_ BitVec 32) (_ BitVec 64))) (size!23785 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48628)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48628 (_ BitVec 32)) Bool)

(assert (=> b!852011 (= res!578716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852013 () Bool)

(declare-fun res!578712 () Bool)

(assert (=> b!852013 (=> (not res!578712) (not e!475209))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852013 (= res!578712 (validKeyInArray!0 k0!854))))

(declare-fun b!852014 () Bool)

(declare-fun e!475214 () Bool)

(declare-datatypes ((V!26667 0))(
  ( (V!26668 (val!8155 Int)) )
))
(declare-datatypes ((tuple2!10704 0))(
  ( (tuple2!10705 (_1!5363 (_ BitVec 64)) (_2!5363 V!26667)) )
))
(declare-datatypes ((List!16539 0))(
  ( (Nil!16536) (Cons!16535 (h!17666 tuple2!10704) (t!23064 List!16539)) )
))
(declare-datatypes ((ListLongMap!9473 0))(
  ( (ListLongMap!9474 (toList!4752 List!16539)) )
))
(declare-fun call!38093 () ListLongMap!9473)

(declare-fun call!38092 () ListLongMap!9473)

(assert (=> b!852014 (= e!475214 (= call!38093 call!38092))))

(declare-fun b!852015 () Bool)

(declare-fun res!578709 () Bool)

(assert (=> b!852015 (=> (not res!578709) (not e!475209))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7668 0))(
  ( (ValueCellFull!7668 (v!10580 V!26667)) (EmptyCell!7668) )
))
(declare-datatypes ((array!48630 0))(
  ( (array!48631 (arr!23346 (Array (_ BitVec 32) ValueCell!7668)) (size!23786 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48630)

(assert (=> b!852015 (= res!578709 (and (= (size!23786 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23785 _keys!868) (size!23786 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852016 () Bool)

(declare-fun e!475212 () Bool)

(declare-fun tp_is_empty!16215 () Bool)

(assert (=> b!852016 (= e!475212 tp_is_empty!16215)))

(declare-fun b!852017 () Bool)

(declare-fun res!578711 () Bool)

(assert (=> b!852017 (=> (not res!578711) (not e!475209))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!852017 (= res!578711 (and (= (select (arr!23345 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!578717 () Bool)

(assert (=> start!73164 (=> (not res!578717) (not e!475209))))

(assert (=> start!73164 (= res!578717 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23785 _keys!868))))))

(assert (=> start!73164 e!475209))

(assert (=> start!73164 tp_is_empty!16215))

(assert (=> start!73164 true))

(assert (=> start!73164 tp!49741))

(declare-fun array_inv!18516 (array!48628) Bool)

(assert (=> start!73164 (array_inv!18516 _keys!868)))

(declare-fun e!475213 () Bool)

(declare-fun array_inv!18517 (array!48630) Bool)

(assert (=> start!73164 (and (array_inv!18517 _values!688) e!475213)))

(declare-fun b!852012 () Bool)

(declare-fun e!475210 () Bool)

(assert (=> b!852012 (= e!475210 tp_is_empty!16215)))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!38089 () Bool)

(declare-fun minValue!654 () V!26667)

(declare-fun zeroValue!654 () V!26667)

(declare-fun getCurrentListMapNoExtraKeys!2734 (array!48628 array!48630 (_ BitVec 32) (_ BitVec 32) V!26667 V!26667 (_ BitVec 32) Int) ListLongMap!9473)

(assert (=> bm!38089 (= call!38092 (getCurrentListMapNoExtraKeys!2734 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852018 () Bool)

(declare-fun e!475215 () Bool)

(declare-fun e!475216 () Bool)

(assert (=> b!852018 (= e!475215 (not e!475216))))

(declare-fun res!578713 () Bool)

(assert (=> b!852018 (=> res!578713 e!475216)))

(assert (=> b!852018 (= res!578713 (not (validKeyInArray!0 (select (arr!23345 _keys!868) from!1053))))))

(assert (=> b!852018 e!475214))

(declare-fun c!91789 () Bool)

(assert (=> b!852018 (= c!91789 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26667)

(declare-datatypes ((Unit!29085 0))(
  ( (Unit!29086) )
))
(declare-fun lt!383830 () Unit!29085)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!383 (array!48628 array!48630 (_ BitVec 32) (_ BitVec 32) V!26667 V!26667 (_ BitVec 32) (_ BitVec 64) V!26667 (_ BitVec 32) Int) Unit!29085)

(assert (=> b!852018 (= lt!383830 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!383 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852019 () Bool)

(assert (=> b!852019 (= e!475209 e!475215)))

(declare-fun res!578710 () Bool)

(assert (=> b!852019 (=> (not res!578710) (not e!475215))))

(assert (=> b!852019 (= res!578710 (= from!1053 i!612))))

(declare-fun lt!383831 () ListLongMap!9473)

(declare-fun lt!383828 () array!48630)

(assert (=> b!852019 (= lt!383831 (getCurrentListMapNoExtraKeys!2734 _keys!868 lt!383828 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852019 (= lt!383828 (array!48631 (store (arr!23346 _values!688) i!612 (ValueCellFull!7668 v!557)) (size!23786 _values!688)))))

(declare-fun lt!383825 () ListLongMap!9473)

(assert (=> b!852019 (= lt!383825 (getCurrentListMapNoExtraKeys!2734 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25922 () Bool)

(declare-fun tp!49740 () Bool)

(assert (=> mapNonEmpty!25922 (= mapRes!25922 (and tp!49740 e!475210))))

(declare-fun mapKey!25922 () (_ BitVec 32))

(declare-fun mapValue!25922 () ValueCell!7668)

(declare-fun mapRest!25922 () (Array (_ BitVec 32) ValueCell!7668))

(assert (=> mapNonEmpty!25922 (= (arr!23346 _values!688) (store mapRest!25922 mapKey!25922 mapValue!25922))))

(declare-fun b!852020 () Bool)

(declare-fun +!2150 (ListLongMap!9473 tuple2!10704) ListLongMap!9473)

(assert (=> b!852020 (= e!475214 (= call!38093 (+!2150 call!38092 (tuple2!10705 k0!854 v!557))))))

(declare-fun b!852021 () Bool)

(declare-fun res!578708 () Bool)

(assert (=> b!852021 (=> (not res!578708) (not e!475209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852021 (= res!578708 (validMask!0 mask!1196))))

(declare-fun bm!38090 () Bool)

(assert (=> bm!38090 (= call!38093 (getCurrentListMapNoExtraKeys!2734 _keys!868 lt!383828 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852022 () Bool)

(assert (=> b!852022 (= e!475216 true)))

(declare-fun lt!383824 () ListLongMap!9473)

(declare-fun lt!383833 () V!26667)

(declare-fun lt!383826 () tuple2!10704)

(assert (=> b!852022 (= (+!2150 lt!383824 lt!383826) (+!2150 (+!2150 lt!383824 (tuple2!10705 k0!854 lt!383833)) lt!383826))))

(declare-fun lt!383829 () V!26667)

(assert (=> b!852022 (= lt!383826 (tuple2!10705 k0!854 lt!383829))))

(declare-fun lt!383832 () Unit!29085)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!280 (ListLongMap!9473 (_ BitVec 64) V!26667 V!26667) Unit!29085)

(assert (=> b!852022 (= lt!383832 (addSameAsAddTwiceSameKeyDiffValues!280 lt!383824 k0!854 lt!383833 lt!383829))))

(declare-fun lt!383827 () V!26667)

(declare-fun get!12304 (ValueCell!7668 V!26667) V!26667)

(assert (=> b!852022 (= lt!383833 (get!12304 (select (arr!23346 _values!688) from!1053) lt!383827))))

(assert (=> b!852022 (= lt!383831 (+!2150 lt!383824 (tuple2!10705 (select (arr!23345 _keys!868) from!1053) lt!383829)))))

(assert (=> b!852022 (= lt!383829 (get!12304 (select (store (arr!23346 _values!688) i!612 (ValueCellFull!7668 v!557)) from!1053) lt!383827))))

(declare-fun dynLambda!1034 (Int (_ BitVec 64)) V!26667)

(assert (=> b!852022 (= lt!383827 (dynLambda!1034 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852022 (= lt!383824 (getCurrentListMapNoExtraKeys!2734 _keys!868 lt!383828 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852023 () Bool)

(declare-fun res!578715 () Bool)

(assert (=> b!852023 (=> (not res!578715) (not e!475209))))

(assert (=> b!852023 (= res!578715 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23785 _keys!868))))))

(declare-fun b!852024 () Bool)

(declare-fun res!578714 () Bool)

(assert (=> b!852024 (=> (not res!578714) (not e!475209))))

(declare-datatypes ((List!16540 0))(
  ( (Nil!16537) (Cons!16536 (h!17667 (_ BitVec 64)) (t!23065 List!16540)) )
))
(declare-fun arrayNoDuplicates!0 (array!48628 (_ BitVec 32) List!16540) Bool)

(assert (=> b!852024 (= res!578714 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16537))))

(declare-fun b!852025 () Bool)

(assert (=> b!852025 (= e!475213 (and e!475212 mapRes!25922))))

(declare-fun condMapEmpty!25922 () Bool)

(declare-fun mapDefault!25922 () ValueCell!7668)

(assert (=> b!852025 (= condMapEmpty!25922 (= (arr!23346 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7668)) mapDefault!25922)))))

(assert (= (and start!73164 res!578717) b!852021))

(assert (= (and b!852021 res!578708) b!852015))

(assert (= (and b!852015 res!578709) b!852011))

(assert (= (and b!852011 res!578716) b!852024))

(assert (= (and b!852024 res!578714) b!852023))

(assert (= (and b!852023 res!578715) b!852013))

(assert (= (and b!852013 res!578712) b!852017))

(assert (= (and b!852017 res!578711) b!852019))

(assert (= (and b!852019 res!578710) b!852018))

(assert (= (and b!852018 c!91789) b!852020))

(assert (= (and b!852018 (not c!91789)) b!852014))

(assert (= (or b!852020 b!852014) bm!38090))

(assert (= (or b!852020 b!852014) bm!38089))

(assert (= (and b!852018 (not res!578713)) b!852022))

(assert (= (and b!852025 condMapEmpty!25922) mapIsEmpty!25922))

(assert (= (and b!852025 (not condMapEmpty!25922)) mapNonEmpty!25922))

(get-info :version)

(assert (= (and mapNonEmpty!25922 ((_ is ValueCellFull!7668) mapValue!25922)) b!852012))

(assert (= (and b!852025 ((_ is ValueCellFull!7668) mapDefault!25922)) b!852016))

(assert (= start!73164 b!852025))

(declare-fun b_lambda!11611 () Bool)

(assert (=> (not b_lambda!11611) (not b!852022)))

(declare-fun t!23063 () Bool)

(declare-fun tb!4381 () Bool)

(assert (=> (and start!73164 (= defaultEntry!696 defaultEntry!696) t!23063) tb!4381))

(declare-fun result!8373 () Bool)

(assert (=> tb!4381 (= result!8373 tp_is_empty!16215)))

(assert (=> b!852022 t!23063))

(declare-fun b_and!23319 () Bool)

(assert (= b_and!23317 (and (=> t!23063 result!8373) b_and!23319)))

(declare-fun m!793009 () Bool)

(assert (=> b!852020 m!793009))

(declare-fun m!793011 () Bool)

(assert (=> b!852011 m!793011))

(declare-fun m!793013 () Bool)

(assert (=> bm!38090 m!793013))

(declare-fun m!793015 () Bool)

(assert (=> mapNonEmpty!25922 m!793015))

(declare-fun m!793017 () Bool)

(assert (=> b!852018 m!793017))

(assert (=> b!852018 m!793017))

(declare-fun m!793019 () Bool)

(assert (=> b!852018 m!793019))

(declare-fun m!793021 () Bool)

(assert (=> b!852018 m!793021))

(declare-fun m!793023 () Bool)

(assert (=> b!852019 m!793023))

(declare-fun m!793025 () Bool)

(assert (=> b!852019 m!793025))

(declare-fun m!793027 () Bool)

(assert (=> b!852019 m!793027))

(declare-fun m!793029 () Bool)

(assert (=> b!852021 m!793029))

(declare-fun m!793031 () Bool)

(assert (=> b!852022 m!793031))

(declare-fun m!793033 () Bool)

(assert (=> b!852022 m!793033))

(assert (=> b!852022 m!793013))

(assert (=> b!852022 m!793033))

(declare-fun m!793035 () Bool)

(assert (=> b!852022 m!793035))

(declare-fun m!793037 () Bool)

(assert (=> b!852022 m!793037))

(declare-fun m!793039 () Bool)

(assert (=> b!852022 m!793039))

(declare-fun m!793041 () Bool)

(assert (=> b!852022 m!793041))

(declare-fun m!793043 () Bool)

(assert (=> b!852022 m!793043))

(assert (=> b!852022 m!793031))

(declare-fun m!793045 () Bool)

(assert (=> b!852022 m!793045))

(assert (=> b!852022 m!793025))

(assert (=> b!852022 m!793017))

(declare-fun m!793047 () Bool)

(assert (=> b!852022 m!793047))

(assert (=> b!852022 m!793043))

(declare-fun m!793049 () Bool)

(assert (=> b!852022 m!793049))

(declare-fun m!793051 () Bool)

(assert (=> b!852013 m!793051))

(declare-fun m!793053 () Bool)

(assert (=> b!852024 m!793053))

(declare-fun m!793055 () Bool)

(assert (=> bm!38089 m!793055))

(declare-fun m!793057 () Bool)

(assert (=> start!73164 m!793057))

(declare-fun m!793059 () Bool)

(assert (=> start!73164 m!793059))

(declare-fun m!793061 () Bool)

(assert (=> b!852017 m!793061))

(check-sat tp_is_empty!16215 (not b!852022) (not b!852013) (not b!852024) (not b!852019) (not b!852021) (not start!73164) b_and!23319 (not b_lambda!11611) (not b_next!14079) (not bm!38089) (not b!852020) (not bm!38090) (not b!852011) (not b!852018) (not mapNonEmpty!25922))
(check-sat b_and!23319 (not b_next!14079))
