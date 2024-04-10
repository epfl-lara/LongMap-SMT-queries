; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73044 () Bool)

(assert start!73044)

(declare-fun b_free!13959 () Bool)

(declare-fun b_next!13959 () Bool)

(assert (=> start!73044 (= b_free!13959 (not b_next!13959))))

(declare-fun tp!49381 () Bool)

(declare-fun b_and!23077 () Bool)

(assert (=> start!73044 (= tp!49381 b_and!23077)))

(declare-fun b!849191 () Bool)

(declare-fun e!473771 () Bool)

(declare-fun e!473773 () Bool)

(declare-fun mapRes!25742 () Bool)

(assert (=> b!849191 (= e!473771 (and e!473773 mapRes!25742))))

(declare-fun condMapEmpty!25742 () Bool)

(declare-datatypes ((V!26507 0))(
  ( (V!26508 (val!8095 Int)) )
))
(declare-datatypes ((ValueCell!7608 0))(
  ( (ValueCellFull!7608 (v!10520 V!26507)) (EmptyCell!7608) )
))
(declare-datatypes ((array!48396 0))(
  ( (array!48397 (arr!23229 (Array (_ BitVec 32) ValueCell!7608)) (size!23669 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48396)

(declare-fun mapDefault!25742 () ValueCell!7608)

(assert (=> b!849191 (= condMapEmpty!25742 (= (arr!23229 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7608)) mapDefault!25742)))))

(declare-fun mapNonEmpty!25742 () Bool)

(declare-fun tp!49380 () Bool)

(declare-fun e!473769 () Bool)

(assert (=> mapNonEmpty!25742 (= mapRes!25742 (and tp!49380 e!473769))))

(declare-fun mapRest!25742 () (Array (_ BitVec 32) ValueCell!7608))

(declare-fun mapValue!25742 () ValueCell!7608)

(declare-fun mapKey!25742 () (_ BitVec 32))

(assert (=> mapNonEmpty!25742 (= (arr!23229 _values!688) (store mapRest!25742 mapKey!25742 mapValue!25742))))

(declare-fun b!849192 () Bool)

(declare-fun tp_is_empty!16095 () Bool)

(assert (=> b!849192 (= e!473769 tp_is_empty!16095)))

(declare-fun b!849193 () Bool)

(declare-fun e!473774 () Bool)

(declare-datatypes ((tuple2!10596 0))(
  ( (tuple2!10597 (_1!5309 (_ BitVec 64)) (_2!5309 V!26507)) )
))
(declare-datatypes ((List!16445 0))(
  ( (Nil!16442) (Cons!16441 (h!17572 tuple2!10596) (t!22850 List!16445)) )
))
(declare-datatypes ((ListLongMap!9365 0))(
  ( (ListLongMap!9366 (toList!4698 List!16445)) )
))
(declare-fun call!37733 () ListLongMap!9365)

(declare-fun call!37732 () ListLongMap!9365)

(assert (=> b!849193 (= e!473774 (= call!37733 call!37732))))

(declare-fun b!849194 () Bool)

(declare-fun e!473775 () Bool)

(assert (=> b!849194 (= e!473775 true)))

(declare-fun lt!382210 () ListLongMap!9365)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!382211 () array!48396)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48398 0))(
  ( (array!48399 (arr!23230 (Array (_ BitVec 32) (_ BitVec 64))) (size!23670 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48398)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26507)

(declare-fun zeroValue!654 () V!26507)

(declare-fun +!2103 (ListLongMap!9365 tuple2!10596) ListLongMap!9365)

(declare-fun getCurrentListMapNoExtraKeys!2680 (array!48398 array!48396 (_ BitVec 32) (_ BitVec 32) V!26507 V!26507 (_ BitVec 32) Int) ListLongMap!9365)

(declare-fun get!12224 (ValueCell!7608 V!26507) V!26507)

(declare-fun dynLambda!994 (Int (_ BitVec 64)) V!26507)

(assert (=> b!849194 (= lt!382210 (+!2103 (getCurrentListMapNoExtraKeys!2680 _keys!868 lt!382211 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10597 (select (arr!23230 _keys!868) from!1053) (get!12224 (select (arr!23229 lt!382211) from!1053) (dynLambda!994 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!37729 () Bool)

(assert (=> bm!37729 (= call!37732 (getCurrentListMapNoExtraKeys!2680 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849196 () Bool)

(declare-fun res!576911 () Bool)

(declare-fun e!473772 () Bool)

(assert (=> b!849196 (=> (not res!576911) (not e!473772))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849196 (= res!576911 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23670 _keys!868))))))

(declare-fun b!849197 () Bool)

(declare-fun res!576917 () Bool)

(assert (=> b!849197 (=> (not res!576917) (not e!473772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849197 (= res!576917 (validMask!0 mask!1196))))

(declare-fun v!557 () V!26507)

(declare-fun b!849198 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!849198 (= e!473774 (= call!37733 (+!2103 call!37732 (tuple2!10597 k0!854 v!557))))))

(declare-fun b!849199 () Bool)

(assert (=> b!849199 (= e!473773 tp_is_empty!16095)))

(declare-fun b!849200 () Bool)

(declare-fun res!576908 () Bool)

(assert (=> b!849200 (=> (not res!576908) (not e!473772))))

(declare-datatypes ((List!16446 0))(
  ( (Nil!16443) (Cons!16442 (h!17573 (_ BitVec 64)) (t!22851 List!16446)) )
))
(declare-fun arrayNoDuplicates!0 (array!48398 (_ BitVec 32) List!16446) Bool)

(assert (=> b!849200 (= res!576908 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16443))))

(declare-fun b!849201 () Bool)

(declare-fun res!576910 () Bool)

(assert (=> b!849201 (=> (not res!576910) (not e!473772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48398 (_ BitVec 32)) Bool)

(assert (=> b!849201 (= res!576910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849202 () Bool)

(declare-fun e!473770 () Bool)

(assert (=> b!849202 (= e!473770 (not e!473775))))

(declare-fun res!576916 () Bool)

(assert (=> b!849202 (=> res!576916 e!473775)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849202 (= res!576916 (not (validKeyInArray!0 (select (arr!23230 _keys!868) from!1053))))))

(assert (=> b!849202 e!473774))

(declare-fun c!91609 () Bool)

(assert (=> b!849202 (= c!91609 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28997 0))(
  ( (Unit!28998) )
))
(declare-fun lt!382213 () Unit!28997)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!344 (array!48398 array!48396 (_ BitVec 32) (_ BitVec 32) V!26507 V!26507 (_ BitVec 32) (_ BitVec 64) V!26507 (_ BitVec 32) Int) Unit!28997)

(assert (=> b!849202 (= lt!382213 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!344 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849203 () Bool)

(declare-fun res!576913 () Bool)

(assert (=> b!849203 (=> (not res!576913) (not e!473772))))

(assert (=> b!849203 (= res!576913 (and (= (size!23669 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23670 _keys!868) (size!23669 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849204 () Bool)

(declare-fun res!576909 () Bool)

(assert (=> b!849204 (=> (not res!576909) (not e!473772))))

(assert (=> b!849204 (= res!576909 (and (= (select (arr!23230 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!37730 () Bool)

(assert (=> bm!37730 (= call!37733 (getCurrentListMapNoExtraKeys!2680 _keys!868 lt!382211 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!576914 () Bool)

(assert (=> start!73044 (=> (not res!576914) (not e!473772))))

(assert (=> start!73044 (= res!576914 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23670 _keys!868))))))

(assert (=> start!73044 e!473772))

(assert (=> start!73044 tp_is_empty!16095))

(assert (=> start!73044 true))

(assert (=> start!73044 tp!49381))

(declare-fun array_inv!18436 (array!48398) Bool)

(assert (=> start!73044 (array_inv!18436 _keys!868)))

(declare-fun array_inv!18437 (array!48396) Bool)

(assert (=> start!73044 (and (array_inv!18437 _values!688) e!473771)))

(declare-fun b!849195 () Bool)

(declare-fun res!576912 () Bool)

(assert (=> b!849195 (=> (not res!576912) (not e!473772))))

(assert (=> b!849195 (= res!576912 (validKeyInArray!0 k0!854))))

(declare-fun b!849205 () Bool)

(assert (=> b!849205 (= e!473772 e!473770)))

(declare-fun res!576915 () Bool)

(assert (=> b!849205 (=> (not res!576915) (not e!473770))))

(assert (=> b!849205 (= res!576915 (= from!1053 i!612))))

(assert (=> b!849205 (= lt!382210 (getCurrentListMapNoExtraKeys!2680 _keys!868 lt!382211 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849205 (= lt!382211 (array!48397 (store (arr!23229 _values!688) i!612 (ValueCellFull!7608 v!557)) (size!23669 _values!688)))))

(declare-fun lt!382212 () ListLongMap!9365)

(assert (=> b!849205 (= lt!382212 (getCurrentListMapNoExtraKeys!2680 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!25742 () Bool)

(assert (=> mapIsEmpty!25742 mapRes!25742))

(assert (= (and start!73044 res!576914) b!849197))

(assert (= (and b!849197 res!576917) b!849203))

(assert (= (and b!849203 res!576913) b!849201))

(assert (= (and b!849201 res!576910) b!849200))

(assert (= (and b!849200 res!576908) b!849196))

(assert (= (and b!849196 res!576911) b!849195))

(assert (= (and b!849195 res!576912) b!849204))

(assert (= (and b!849204 res!576909) b!849205))

(assert (= (and b!849205 res!576915) b!849202))

(assert (= (and b!849202 c!91609) b!849198))

(assert (= (and b!849202 (not c!91609)) b!849193))

(assert (= (or b!849198 b!849193) bm!37730))

(assert (= (or b!849198 b!849193) bm!37729))

(assert (= (and b!849202 (not res!576916)) b!849194))

(assert (= (and b!849191 condMapEmpty!25742) mapIsEmpty!25742))

(assert (= (and b!849191 (not condMapEmpty!25742)) mapNonEmpty!25742))

(get-info :version)

(assert (= (and mapNonEmpty!25742 ((_ is ValueCellFull!7608) mapValue!25742)) b!849192))

(assert (= (and b!849191 ((_ is ValueCellFull!7608) mapDefault!25742)) b!849199))

(assert (= start!73044 b!849191))

(declare-fun b_lambda!11491 () Bool)

(assert (=> (not b_lambda!11491) (not b!849194)))

(declare-fun t!22849 () Bool)

(declare-fun tb!4261 () Bool)

(assert (=> (and start!73044 (= defaultEntry!696 defaultEntry!696) t!22849) tb!4261))

(declare-fun result!8133 () Bool)

(assert (=> tb!4261 (= result!8133 tp_is_empty!16095)))

(assert (=> b!849194 t!22849))

(declare-fun b_and!23079 () Bool)

(assert (= b_and!23077 (and (=> t!22849 result!8133) b_and!23079)))

(declare-fun m!789897 () Bool)

(assert (=> b!849197 m!789897))

(declare-fun m!789899 () Bool)

(assert (=> mapNonEmpty!25742 m!789899))

(declare-fun m!789901 () Bool)

(assert (=> bm!37729 m!789901))

(declare-fun m!789903 () Bool)

(assert (=> b!849201 m!789903))

(declare-fun m!789905 () Bool)

(assert (=> b!849200 m!789905))

(declare-fun m!789907 () Bool)

(assert (=> b!849204 m!789907))

(declare-fun m!789909 () Bool)

(assert (=> b!849205 m!789909))

(declare-fun m!789911 () Bool)

(assert (=> b!849205 m!789911))

(declare-fun m!789913 () Bool)

(assert (=> b!849205 m!789913))

(declare-fun m!789915 () Bool)

(assert (=> b!849194 m!789915))

(assert (=> b!849194 m!789915))

(declare-fun m!789917 () Bool)

(assert (=> b!849194 m!789917))

(declare-fun m!789919 () Bool)

(assert (=> b!849194 m!789919))

(declare-fun m!789921 () Bool)

(assert (=> b!849194 m!789921))

(declare-fun m!789923 () Bool)

(assert (=> b!849194 m!789923))

(assert (=> b!849194 m!789919))

(declare-fun m!789925 () Bool)

(assert (=> b!849194 m!789925))

(assert (=> b!849194 m!789921))

(declare-fun m!789927 () Bool)

(assert (=> b!849195 m!789927))

(assert (=> b!849202 m!789925))

(assert (=> b!849202 m!789925))

(declare-fun m!789929 () Bool)

(assert (=> b!849202 m!789929))

(declare-fun m!789931 () Bool)

(assert (=> b!849202 m!789931))

(declare-fun m!789933 () Bool)

(assert (=> b!849198 m!789933))

(assert (=> bm!37730 m!789915))

(declare-fun m!789935 () Bool)

(assert (=> start!73044 m!789935))

(declare-fun m!789937 () Bool)

(assert (=> start!73044 m!789937))

(check-sat (not bm!37730) (not b!849197) (not b!849200) (not b_lambda!11491) (not b!849205) (not b!849202) (not bm!37729) b_and!23079 (not b!849198) (not start!73044) (not b!849201) (not mapNonEmpty!25742) tp_is_empty!16095 (not b!849194) (not b!849195) (not b_next!13959))
(check-sat b_and!23079 (not b_next!13959))
