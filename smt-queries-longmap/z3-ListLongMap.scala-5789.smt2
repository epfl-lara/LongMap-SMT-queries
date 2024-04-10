; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74678 () Bool)

(assert start!74678)

(declare-fun b_free!15327 () Bool)

(declare-fun b_next!15327 () Bool)

(assert (=> start!74678 (= b_free!15327 (not b_next!15327))))

(declare-fun tp!53669 () Bool)

(declare-fun b_and!25273 () Bool)

(assert (=> start!74678 (= tp!53669 b_and!25273)))

(declare-fun b!880210 () Bool)

(declare-fun e!489832 () Bool)

(declare-fun e!489837 () Bool)

(assert (=> b!880210 (= e!489832 (not e!489837))))

(declare-fun res!598010 () Bool)

(assert (=> b!880210 (=> res!598010 e!489837)))

(declare-datatypes ((array!51272 0))(
  ( (array!51273 (arr!24660 (Array (_ BitVec 32) (_ BitVec 64))) (size!25100 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51272)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880210 (= res!598010 (not (validKeyInArray!0 (select (arr!24660 _keys!868) from!1053))))))

(declare-datatypes ((V!28475 0))(
  ( (V!28476 (val!8833 Int)) )
))
(declare-datatypes ((tuple2!11690 0))(
  ( (tuple2!11691 (_1!5856 (_ BitVec 64)) (_2!5856 V!28475)) )
))
(declare-datatypes ((List!17503 0))(
  ( (Nil!17500) (Cons!17499 (h!18630 tuple2!11690) (t!24632 List!17503)) )
))
(declare-datatypes ((ListLongMap!10459 0))(
  ( (ListLongMap!10460 (toList!5245 List!17503)) )
))
(declare-fun lt!397997 () ListLongMap!10459)

(declare-fun lt!398001 () ListLongMap!10459)

(assert (=> b!880210 (= lt!397997 lt!398001)))

(declare-fun v!557 () V!28475)

(declare-fun lt!398002 () ListLongMap!10459)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2517 (ListLongMap!10459 tuple2!11690) ListLongMap!10459)

(assert (=> b!880210 (= lt!398001 (+!2517 lt!398002 (tuple2!11691 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8346 0))(
  ( (ValueCellFull!8346 (v!11281 V!28475)) (EmptyCell!8346) )
))
(declare-datatypes ((array!51274 0))(
  ( (array!51275 (arr!24661 (Array (_ BitVec 32) ValueCell!8346)) (size!25101 (_ BitVec 32))) )
))
(declare-fun lt!398003 () array!51274)

(declare-fun minValue!654 () V!28475)

(declare-fun zeroValue!654 () V!28475)

(declare-fun getCurrentListMapNoExtraKeys!3208 (array!51272 array!51274 (_ BitVec 32) (_ BitVec 32) V!28475 V!28475 (_ BitVec 32) Int) ListLongMap!10459)

(assert (=> b!880210 (= lt!397997 (getCurrentListMapNoExtraKeys!3208 _keys!868 lt!398003 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51274)

(assert (=> b!880210 (= lt!398002 (getCurrentListMapNoExtraKeys!3208 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30050 0))(
  ( (Unit!30051) )
))
(declare-fun lt!398000 () Unit!30050)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!707 (array!51272 array!51274 (_ BitVec 32) (_ BitVec 32) V!28475 V!28475 (_ BitVec 32) (_ BitVec 64) V!28475 (_ BitVec 32) Int) Unit!30050)

(assert (=> b!880210 (= lt!398000 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!707 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880211 () Bool)

(declare-fun e!489834 () Bool)

(assert (=> b!880211 (= e!489834 e!489832)))

(declare-fun res!598011 () Bool)

(assert (=> b!880211 (=> (not res!598011) (not e!489832))))

(assert (=> b!880211 (= res!598011 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397999 () ListLongMap!10459)

(assert (=> b!880211 (= lt!397999 (getCurrentListMapNoExtraKeys!3208 _keys!868 lt!398003 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880211 (= lt!398003 (array!51275 (store (arr!24661 _values!688) i!612 (ValueCellFull!8346 v!557)) (size!25101 _values!688)))))

(declare-fun lt!397998 () ListLongMap!10459)

(assert (=> b!880211 (= lt!397998 (getCurrentListMapNoExtraKeys!3208 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880212 () Bool)

(declare-fun res!598005 () Bool)

(assert (=> b!880212 (=> (not res!598005) (not e!489834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51272 (_ BitVec 32)) Bool)

(assert (=> b!880212 (= res!598005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880213 () Bool)

(declare-fun res!598009 () Bool)

(assert (=> b!880213 (=> (not res!598009) (not e!489834))))

(declare-datatypes ((List!17504 0))(
  ( (Nil!17501) (Cons!17500 (h!18631 (_ BitVec 64)) (t!24633 List!17504)) )
))
(declare-fun arrayNoDuplicates!0 (array!51272 (_ BitVec 32) List!17504) Bool)

(assert (=> b!880213 (= res!598009 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17501))))

(declare-fun b!880214 () Bool)

(declare-fun res!598008 () Bool)

(assert (=> b!880214 (=> (not res!598008) (not e!489834))))

(assert (=> b!880214 (= res!598008 (validKeyInArray!0 k0!854))))

(declare-fun b!880215 () Bool)

(declare-fun res!598004 () Bool)

(assert (=> b!880215 (=> (not res!598004) (not e!489834))))

(assert (=> b!880215 (= res!598004 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25100 _keys!868))))))

(declare-fun b!880216 () Bool)

(assert (=> b!880216 (= e!489837 true)))

(declare-fun get!12965 (ValueCell!8346 V!28475) V!28475)

(declare-fun dynLambda!1234 (Int (_ BitVec 64)) V!28475)

(assert (=> b!880216 (= lt!397999 (+!2517 lt!398001 (tuple2!11691 (select (arr!24660 _keys!868) from!1053) (get!12965 (select (arr!24661 _values!688) from!1053) (dynLambda!1234 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880217 () Bool)

(declare-fun e!489833 () Bool)

(declare-fun e!489831 () Bool)

(declare-fun mapRes!27978 () Bool)

(assert (=> b!880217 (= e!489833 (and e!489831 mapRes!27978))))

(declare-fun condMapEmpty!27978 () Bool)

(declare-fun mapDefault!27978 () ValueCell!8346)

(assert (=> b!880217 (= condMapEmpty!27978 (= (arr!24661 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8346)) mapDefault!27978)))))

(declare-fun mapNonEmpty!27978 () Bool)

(declare-fun tp!53668 () Bool)

(declare-fun e!489836 () Bool)

(assert (=> mapNonEmpty!27978 (= mapRes!27978 (and tp!53668 e!489836))))

(declare-fun mapKey!27978 () (_ BitVec 32))

(declare-fun mapRest!27978 () (Array (_ BitVec 32) ValueCell!8346))

(declare-fun mapValue!27978 () ValueCell!8346)

(assert (=> mapNonEmpty!27978 (= (arr!24661 _values!688) (store mapRest!27978 mapKey!27978 mapValue!27978))))

(declare-fun res!598006 () Bool)

(assert (=> start!74678 (=> (not res!598006) (not e!489834))))

(assert (=> start!74678 (= res!598006 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25100 _keys!868))))))

(assert (=> start!74678 e!489834))

(declare-fun tp_is_empty!17571 () Bool)

(assert (=> start!74678 tp_is_empty!17571))

(assert (=> start!74678 true))

(assert (=> start!74678 tp!53669))

(declare-fun array_inv!19422 (array!51272) Bool)

(assert (=> start!74678 (array_inv!19422 _keys!868)))

(declare-fun array_inv!19423 (array!51274) Bool)

(assert (=> start!74678 (and (array_inv!19423 _values!688) e!489833)))

(declare-fun b!880218 () Bool)

(assert (=> b!880218 (= e!489836 tp_is_empty!17571)))

(declare-fun b!880219 () Bool)

(declare-fun res!598007 () Bool)

(assert (=> b!880219 (=> (not res!598007) (not e!489834))))

(assert (=> b!880219 (= res!598007 (and (= (select (arr!24660 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27978 () Bool)

(assert (=> mapIsEmpty!27978 mapRes!27978))

(declare-fun b!880220 () Bool)

(declare-fun res!598003 () Bool)

(assert (=> b!880220 (=> (not res!598003) (not e!489834))))

(assert (=> b!880220 (= res!598003 (and (= (size!25101 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25100 _keys!868) (size!25101 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880221 () Bool)

(assert (=> b!880221 (= e!489831 tp_is_empty!17571)))

(declare-fun b!880222 () Bool)

(declare-fun res!598002 () Bool)

(assert (=> b!880222 (=> (not res!598002) (not e!489834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880222 (= res!598002 (validMask!0 mask!1196))))

(assert (= (and start!74678 res!598006) b!880222))

(assert (= (and b!880222 res!598002) b!880220))

(assert (= (and b!880220 res!598003) b!880212))

(assert (= (and b!880212 res!598005) b!880213))

(assert (= (and b!880213 res!598009) b!880215))

(assert (= (and b!880215 res!598004) b!880214))

(assert (= (and b!880214 res!598008) b!880219))

(assert (= (and b!880219 res!598007) b!880211))

(assert (= (and b!880211 res!598011) b!880210))

(assert (= (and b!880210 (not res!598010)) b!880216))

(assert (= (and b!880217 condMapEmpty!27978) mapIsEmpty!27978))

(assert (= (and b!880217 (not condMapEmpty!27978)) mapNonEmpty!27978))

(get-info :version)

(assert (= (and mapNonEmpty!27978 ((_ is ValueCellFull!8346) mapValue!27978)) b!880218))

(assert (= (and b!880217 ((_ is ValueCellFull!8346) mapDefault!27978)) b!880221))

(assert (= start!74678 b!880217))

(declare-fun b_lambda!12435 () Bool)

(assert (=> (not b_lambda!12435) (not b!880216)))

(declare-fun t!24631 () Bool)

(declare-fun tb!4985 () Bool)

(assert (=> (and start!74678 (= defaultEntry!696 defaultEntry!696) t!24631) tb!4985))

(declare-fun result!9595 () Bool)

(assert (=> tb!4985 (= result!9595 tp_is_empty!17571)))

(assert (=> b!880216 t!24631))

(declare-fun b_and!25275 () Bool)

(assert (= b_and!25273 (and (=> t!24631 result!9595) b_and!25275)))

(declare-fun m!819979 () Bool)

(assert (=> b!880219 m!819979))

(declare-fun m!819981 () Bool)

(assert (=> b!880222 m!819981))

(declare-fun m!819983 () Bool)

(assert (=> b!880216 m!819983))

(declare-fun m!819985 () Bool)

(assert (=> b!880216 m!819985))

(declare-fun m!819987 () Bool)

(assert (=> b!880216 m!819987))

(assert (=> b!880216 m!819983))

(declare-fun m!819989 () Bool)

(assert (=> b!880216 m!819989))

(declare-fun m!819991 () Bool)

(assert (=> b!880216 m!819991))

(assert (=> b!880216 m!819985))

(declare-fun m!819993 () Bool)

(assert (=> b!880210 m!819993))

(assert (=> b!880210 m!819991))

(declare-fun m!819995 () Bool)

(assert (=> b!880210 m!819995))

(assert (=> b!880210 m!819991))

(declare-fun m!819997 () Bool)

(assert (=> b!880210 m!819997))

(declare-fun m!819999 () Bool)

(assert (=> b!880210 m!819999))

(declare-fun m!820001 () Bool)

(assert (=> b!880210 m!820001))

(declare-fun m!820003 () Bool)

(assert (=> mapNonEmpty!27978 m!820003))

(declare-fun m!820005 () Bool)

(assert (=> b!880213 m!820005))

(declare-fun m!820007 () Bool)

(assert (=> start!74678 m!820007))

(declare-fun m!820009 () Bool)

(assert (=> start!74678 m!820009))

(declare-fun m!820011 () Bool)

(assert (=> b!880212 m!820011))

(declare-fun m!820013 () Bool)

(assert (=> b!880214 m!820013))

(declare-fun m!820015 () Bool)

(assert (=> b!880211 m!820015))

(declare-fun m!820017 () Bool)

(assert (=> b!880211 m!820017))

(declare-fun m!820019 () Bool)

(assert (=> b!880211 m!820019))

(check-sat (not b!880212) (not b_lambda!12435) (not b!880214) (not b!880222) (not b!880213) (not start!74678) (not b_next!15327) (not b!880210) tp_is_empty!17571 (not mapNonEmpty!27978) b_and!25275 (not b!880211) (not b!880216))
(check-sat b_and!25275 (not b_next!15327))
