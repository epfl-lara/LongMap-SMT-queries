; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73990 () Bool)

(assert start!73990)

(declare-fun b_free!14923 () Bool)

(declare-fun b_next!14923 () Bool)

(assert (=> start!73990 (= b_free!14923 (not b_next!14923))))

(declare-fun tp!52274 () Bool)

(declare-fun b_and!24649 () Bool)

(assert (=> start!73990 (= tp!52274 b_and!24649)))

(declare-fun b!870028 () Bool)

(declare-fun res!591371 () Bool)

(declare-fun e!484461 () Bool)

(assert (=> b!870028 (=> (not res!591371) (not e!484461))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870028 (= res!591371 (validMask!0 mask!1196))))

(declare-fun b!870029 () Bool)

(declare-fun res!591368 () Bool)

(assert (=> b!870029 (=> (not res!591368) (not e!484461))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870029 (= res!591368 (validKeyInArray!0 k0!854))))

(declare-fun b!870030 () Bool)

(declare-fun res!591370 () Bool)

(assert (=> b!870030 (=> (not res!591370) (not e!484461))))

(declare-datatypes ((array!50251 0))(
  ( (array!50252 (arr!24157 (Array (_ BitVec 32) (_ BitVec 64))) (size!24599 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50251)

(declare-datatypes ((List!17190 0))(
  ( (Nil!17187) (Cons!17186 (h!18317 (_ BitVec 64)) (t!24218 List!17190)) )
))
(declare-fun arrayNoDuplicates!0 (array!50251 (_ BitVec 32) List!17190) Bool)

(assert (=> b!870030 (= res!591370 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17187))))

(declare-fun b!870031 () Bool)

(declare-fun e!484459 () Bool)

(assert (=> b!870031 (= e!484459 (not true))))

(declare-datatypes ((V!27793 0))(
  ( (V!27794 (val!8577 Int)) )
))
(declare-fun v!557 () V!27793)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27793)

(declare-fun zeroValue!654 () V!27793)

(declare-datatypes ((ValueCell!8090 0))(
  ( (ValueCellFull!8090 (v!10996 V!27793)) (EmptyCell!8090) )
))
(declare-datatypes ((array!50253 0))(
  ( (array!50254 (arr!24158 (Array (_ BitVec 32) ValueCell!8090)) (size!24600 (_ BitVec 32))) )
))
(declare-fun lt!394842 () array!50253)

(declare-fun _values!688 () array!50253)

(declare-datatypes ((tuple2!11410 0))(
  ( (tuple2!11411 (_1!5716 (_ BitVec 64)) (_2!5716 V!27793)) )
))
(declare-datatypes ((List!17191 0))(
  ( (Nil!17188) (Cons!17187 (h!18318 tuple2!11410) (t!24219 List!17191)) )
))
(declare-datatypes ((ListLongMap!10169 0))(
  ( (ListLongMap!10170 (toList!5100 List!17191)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3093 (array!50251 array!50253 (_ BitVec 32) (_ BitVec 32) V!27793 V!27793 (_ BitVec 32) Int) ListLongMap!10169)

(declare-fun +!2461 (ListLongMap!10169 tuple2!11410) ListLongMap!10169)

(assert (=> b!870031 (= (getCurrentListMapNoExtraKeys!3093 _keys!868 lt!394842 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2461 (getCurrentListMapNoExtraKeys!3093 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11411 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29809 0))(
  ( (Unit!29810) )
))
(declare-fun lt!394841 () Unit!29809)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!629 (array!50251 array!50253 (_ BitVec 32) (_ BitVec 32) V!27793 V!27793 (_ BitVec 32) (_ BitVec 64) V!27793 (_ BitVec 32) Int) Unit!29809)

(assert (=> b!870031 (= lt!394841 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!629 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870032 () Bool)

(assert (=> b!870032 (= e!484461 e!484459)))

(declare-fun res!591364 () Bool)

(assert (=> b!870032 (=> (not res!591364) (not e!484459))))

(assert (=> b!870032 (= res!591364 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394844 () ListLongMap!10169)

(assert (=> b!870032 (= lt!394844 (getCurrentListMapNoExtraKeys!3093 _keys!868 lt!394842 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870032 (= lt!394842 (array!50254 (store (arr!24158 _values!688) i!612 (ValueCellFull!8090 v!557)) (size!24600 _values!688)))))

(declare-fun lt!394843 () ListLongMap!10169)

(assert (=> b!870032 (= lt!394843 (getCurrentListMapNoExtraKeys!3093 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870033 () Bool)

(declare-fun res!591365 () Bool)

(assert (=> b!870033 (=> (not res!591365) (not e!484461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50251 (_ BitVec 32)) Bool)

(assert (=> b!870033 (= res!591365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870034 () Bool)

(declare-fun res!591369 () Bool)

(assert (=> b!870034 (=> (not res!591369) (not e!484461))))

(assert (=> b!870034 (= res!591369 (and (= (select (arr!24157 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870036 () Bool)

(declare-fun e!484460 () Bool)

(declare-fun e!484456 () Bool)

(declare-fun mapRes!27188 () Bool)

(assert (=> b!870036 (= e!484460 (and e!484456 mapRes!27188))))

(declare-fun condMapEmpty!27188 () Bool)

(declare-fun mapDefault!27188 () ValueCell!8090)

(assert (=> b!870036 (= condMapEmpty!27188 (= (arr!24158 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8090)) mapDefault!27188)))))

(declare-fun mapIsEmpty!27188 () Bool)

(assert (=> mapIsEmpty!27188 mapRes!27188))

(declare-fun b!870037 () Bool)

(declare-fun res!591366 () Bool)

(assert (=> b!870037 (=> (not res!591366) (not e!484461))))

(assert (=> b!870037 (= res!591366 (and (= (size!24600 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24599 _keys!868) (size!24600 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870038 () Bool)

(declare-fun e!484458 () Bool)

(declare-fun tp_is_empty!17059 () Bool)

(assert (=> b!870038 (= e!484458 tp_is_empty!17059)))

(declare-fun b!870035 () Bool)

(declare-fun res!591367 () Bool)

(assert (=> b!870035 (=> (not res!591367) (not e!484461))))

(assert (=> b!870035 (= res!591367 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24599 _keys!868))))))

(declare-fun res!591372 () Bool)

(assert (=> start!73990 (=> (not res!591372) (not e!484461))))

(assert (=> start!73990 (= res!591372 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24599 _keys!868))))))

(assert (=> start!73990 e!484461))

(assert (=> start!73990 tp_is_empty!17059))

(assert (=> start!73990 true))

(assert (=> start!73990 tp!52274))

(declare-fun array_inv!19140 (array!50251) Bool)

(assert (=> start!73990 (array_inv!19140 _keys!868)))

(declare-fun array_inv!19141 (array!50253) Bool)

(assert (=> start!73990 (and (array_inv!19141 _values!688) e!484460)))

(declare-fun mapNonEmpty!27188 () Bool)

(declare-fun tp!52273 () Bool)

(assert (=> mapNonEmpty!27188 (= mapRes!27188 (and tp!52273 e!484458))))

(declare-fun mapKey!27188 () (_ BitVec 32))

(declare-fun mapValue!27188 () ValueCell!8090)

(declare-fun mapRest!27188 () (Array (_ BitVec 32) ValueCell!8090))

(assert (=> mapNonEmpty!27188 (= (arr!24158 _values!688) (store mapRest!27188 mapKey!27188 mapValue!27188))))

(declare-fun b!870039 () Bool)

(assert (=> b!870039 (= e!484456 tp_is_empty!17059)))

(assert (= (and start!73990 res!591372) b!870028))

(assert (= (and b!870028 res!591371) b!870037))

(assert (= (and b!870037 res!591366) b!870033))

(assert (= (and b!870033 res!591365) b!870030))

(assert (= (and b!870030 res!591370) b!870035))

(assert (= (and b!870035 res!591367) b!870029))

(assert (= (and b!870029 res!591368) b!870034))

(assert (= (and b!870034 res!591369) b!870032))

(assert (= (and b!870032 res!591364) b!870031))

(assert (= (and b!870036 condMapEmpty!27188) mapIsEmpty!27188))

(assert (= (and b!870036 (not condMapEmpty!27188)) mapNonEmpty!27188))

(get-info :version)

(assert (= (and mapNonEmpty!27188 ((_ is ValueCellFull!8090) mapValue!27188)) b!870038))

(assert (= (and b!870036 ((_ is ValueCellFull!8090) mapDefault!27188)) b!870039))

(assert (= start!73990 b!870036))

(declare-fun m!810909 () Bool)

(assert (=> b!870028 m!810909))

(declare-fun m!810911 () Bool)

(assert (=> b!870033 m!810911))

(declare-fun m!810913 () Bool)

(assert (=> b!870032 m!810913))

(declare-fun m!810915 () Bool)

(assert (=> b!870032 m!810915))

(declare-fun m!810917 () Bool)

(assert (=> b!870032 m!810917))

(declare-fun m!810919 () Bool)

(assert (=> b!870031 m!810919))

(declare-fun m!810921 () Bool)

(assert (=> b!870031 m!810921))

(assert (=> b!870031 m!810921))

(declare-fun m!810923 () Bool)

(assert (=> b!870031 m!810923))

(declare-fun m!810925 () Bool)

(assert (=> b!870031 m!810925))

(declare-fun m!810927 () Bool)

(assert (=> start!73990 m!810927))

(declare-fun m!810929 () Bool)

(assert (=> start!73990 m!810929))

(declare-fun m!810931 () Bool)

(assert (=> b!870034 m!810931))

(declare-fun m!810933 () Bool)

(assert (=> mapNonEmpty!27188 m!810933))

(declare-fun m!810935 () Bool)

(assert (=> b!870030 m!810935))

(declare-fun m!810937 () Bool)

(assert (=> b!870029 m!810937))

(check-sat (not b_next!14923) b_and!24649 (not b!870029) (not b!870030) (not b!870033) tp_is_empty!17059 (not mapNonEmpty!27188) (not b!870028) (not start!73990) (not b!870032) (not b!870031))
(check-sat b_and!24649 (not b_next!14923))
