; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74056 () Bool)

(assert start!74056)

(declare-fun b_free!14803 () Bool)

(declare-fun b_next!14803 () Bool)

(assert (=> start!74056 (= b_free!14803 (not b_next!14803))))

(declare-fun tp!51914 () Bool)

(declare-fun b_and!24565 () Bool)

(assert (=> start!74056 (= tp!51914 b_and!24565)))

(declare-fun b!869010 () Bool)

(declare-fun e!484111 () Bool)

(declare-fun tp_is_empty!16939 () Bool)

(assert (=> b!869010 (= e!484111 tp_is_empty!16939)))

(declare-fun b!869011 () Bool)

(declare-fun res!590201 () Bool)

(declare-fun e!484106 () Bool)

(assert (=> b!869011 (=> (not res!590201) (not e!484106))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869011 (= res!590201 (validKeyInArray!0 k0!854))))

(declare-fun b!869012 () Bool)

(declare-fun res!590206 () Bool)

(assert (=> b!869012 (=> (not res!590206) (not e!484106))))

(declare-datatypes ((array!50087 0))(
  ( (array!50088 (arr!24070 (Array (_ BitVec 32) (_ BitVec 64))) (size!24511 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50087)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50087 (_ BitVec 32)) Bool)

(assert (=> b!869012 (= res!590206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869013 () Bool)

(declare-fun res!590199 () Bool)

(assert (=> b!869013 (=> (not res!590199) (not e!484106))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27633 0))(
  ( (V!27634 (val!8517 Int)) )
))
(declare-datatypes ((ValueCell!8030 0))(
  ( (ValueCellFull!8030 (v!10942 V!27633)) (EmptyCell!8030) )
))
(declare-datatypes ((array!50089 0))(
  ( (array!50090 (arr!24071 (Array (_ BitVec 32) ValueCell!8030)) (size!24512 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50089)

(assert (=> b!869013 (= res!590199 (and (= (size!24512 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24511 _keys!868) (size!24512 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869014 () Bool)

(declare-fun e!484107 () Bool)

(assert (=> b!869014 (= e!484106 e!484107)))

(declare-fun res!590198 () Bool)

(assert (=> b!869014 (=> (not res!590198) (not e!484107))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869014 (= res!590198 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11228 0))(
  ( (tuple2!11229 (_1!5625 (_ BitVec 64)) (_2!5625 V!27633)) )
))
(declare-datatypes ((List!17056 0))(
  ( (Nil!17053) (Cons!17052 (h!18189 tuple2!11228) (t!24085 List!17056)) )
))
(declare-datatypes ((ListLongMap!9999 0))(
  ( (ListLongMap!10000 (toList!5015 List!17056)) )
))
(declare-fun lt!394721 () ListLongMap!9999)

(declare-fun lt!394718 () array!50089)

(declare-fun minValue!654 () V!27633)

(declare-fun zeroValue!654 () V!27633)

(declare-fun getCurrentListMapNoExtraKeys!3059 (array!50087 array!50089 (_ BitVec 32) (_ BitVec 32) V!27633 V!27633 (_ BitVec 32) Int) ListLongMap!9999)

(assert (=> b!869014 (= lt!394721 (getCurrentListMapNoExtraKeys!3059 _keys!868 lt!394718 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27633)

(assert (=> b!869014 (= lt!394718 (array!50090 (store (arr!24071 _values!688) i!612 (ValueCellFull!8030 v!557)) (size!24512 _values!688)))))

(declare-fun lt!394719 () ListLongMap!9999)

(assert (=> b!869014 (= lt!394719 (getCurrentListMapNoExtraKeys!3059 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!590204 () Bool)

(assert (=> start!74056 (=> (not res!590204) (not e!484106))))

(assert (=> start!74056 (= res!590204 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24511 _keys!868))))))

(assert (=> start!74056 e!484106))

(assert (=> start!74056 tp_is_empty!16939))

(assert (=> start!74056 true))

(assert (=> start!74056 tp!51914))

(declare-fun array_inv!19074 (array!50087) Bool)

(assert (=> start!74056 (array_inv!19074 _keys!868)))

(declare-fun e!484110 () Bool)

(declare-fun array_inv!19075 (array!50089) Bool)

(assert (=> start!74056 (and (array_inv!19075 _values!688) e!484110)))

(declare-fun b!869015 () Bool)

(declare-fun res!590203 () Bool)

(assert (=> b!869015 (=> (not res!590203) (not e!484106))))

(assert (=> b!869015 (= res!590203 (and (= (select (arr!24070 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869016 () Bool)

(assert (=> b!869016 (= e!484107 (not true))))

(declare-fun +!2415 (ListLongMap!9999 tuple2!11228) ListLongMap!9999)

(assert (=> b!869016 (= (getCurrentListMapNoExtraKeys!3059 _keys!868 lt!394718 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2415 (getCurrentListMapNoExtraKeys!3059 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11229 k0!854 v!557)))))

(declare-datatypes ((Unit!29780 0))(
  ( (Unit!29781) )
))
(declare-fun lt!394720 () Unit!29780)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!586 (array!50087 array!50089 (_ BitVec 32) (_ BitVec 32) V!27633 V!27633 (_ BitVec 32) (_ BitVec 64) V!27633 (_ BitVec 32) Int) Unit!29780)

(assert (=> b!869016 (= lt!394720 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!586 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869017 () Bool)

(declare-fun res!590202 () Bool)

(assert (=> b!869017 (=> (not res!590202) (not e!484106))))

(assert (=> b!869017 (= res!590202 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24511 _keys!868))))))

(declare-fun mapIsEmpty!27008 () Bool)

(declare-fun mapRes!27008 () Bool)

(assert (=> mapIsEmpty!27008 mapRes!27008))

(declare-fun b!869018 () Bool)

(declare-fun e!484109 () Bool)

(assert (=> b!869018 (= e!484110 (and e!484109 mapRes!27008))))

(declare-fun condMapEmpty!27008 () Bool)

(declare-fun mapDefault!27008 () ValueCell!8030)

(assert (=> b!869018 (= condMapEmpty!27008 (= (arr!24071 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8030)) mapDefault!27008)))))

(declare-fun b!869019 () Bool)

(assert (=> b!869019 (= e!484109 tp_is_empty!16939)))

(declare-fun mapNonEmpty!27008 () Bool)

(declare-fun tp!51913 () Bool)

(assert (=> mapNonEmpty!27008 (= mapRes!27008 (and tp!51913 e!484111))))

(declare-fun mapKey!27008 () (_ BitVec 32))

(declare-fun mapValue!27008 () ValueCell!8030)

(declare-fun mapRest!27008 () (Array (_ BitVec 32) ValueCell!8030))

(assert (=> mapNonEmpty!27008 (= (arr!24071 _values!688) (store mapRest!27008 mapKey!27008 mapValue!27008))))

(declare-fun b!869020 () Bool)

(declare-fun res!590200 () Bool)

(assert (=> b!869020 (=> (not res!590200) (not e!484106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869020 (= res!590200 (validMask!0 mask!1196))))

(declare-fun b!869021 () Bool)

(declare-fun res!590205 () Bool)

(assert (=> b!869021 (=> (not res!590205) (not e!484106))))

(declare-datatypes ((List!17057 0))(
  ( (Nil!17054) (Cons!17053 (h!18190 (_ BitVec 64)) (t!24086 List!17057)) )
))
(declare-fun arrayNoDuplicates!0 (array!50087 (_ BitVec 32) List!17057) Bool)

(assert (=> b!869021 (= res!590205 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17054))))

(assert (= (and start!74056 res!590204) b!869020))

(assert (= (and b!869020 res!590200) b!869013))

(assert (= (and b!869013 res!590199) b!869012))

(assert (= (and b!869012 res!590206) b!869021))

(assert (= (and b!869021 res!590205) b!869017))

(assert (= (and b!869017 res!590202) b!869011))

(assert (= (and b!869011 res!590201) b!869015))

(assert (= (and b!869015 res!590203) b!869014))

(assert (= (and b!869014 res!590198) b!869016))

(assert (= (and b!869018 condMapEmpty!27008) mapIsEmpty!27008))

(assert (= (and b!869018 (not condMapEmpty!27008)) mapNonEmpty!27008))

(get-info :version)

(assert (= (and mapNonEmpty!27008 ((_ is ValueCellFull!8030) mapValue!27008)) b!869010))

(assert (= (and b!869018 ((_ is ValueCellFull!8030) mapDefault!27008)) b!869019))

(assert (= start!74056 b!869018))

(declare-fun m!811157 () Bool)

(assert (=> b!869015 m!811157))

(declare-fun m!811159 () Bool)

(assert (=> b!869016 m!811159))

(declare-fun m!811161 () Bool)

(assert (=> b!869016 m!811161))

(assert (=> b!869016 m!811161))

(declare-fun m!811163 () Bool)

(assert (=> b!869016 m!811163))

(declare-fun m!811165 () Bool)

(assert (=> b!869016 m!811165))

(declare-fun m!811167 () Bool)

(assert (=> b!869014 m!811167))

(declare-fun m!811169 () Bool)

(assert (=> b!869014 m!811169))

(declare-fun m!811171 () Bool)

(assert (=> b!869014 m!811171))

(declare-fun m!811173 () Bool)

(assert (=> b!869012 m!811173))

(declare-fun m!811175 () Bool)

(assert (=> b!869011 m!811175))

(declare-fun m!811177 () Bool)

(assert (=> mapNonEmpty!27008 m!811177))

(declare-fun m!811179 () Bool)

(assert (=> b!869020 m!811179))

(declare-fun m!811181 () Bool)

(assert (=> b!869021 m!811181))

(declare-fun m!811183 () Bool)

(assert (=> start!74056 m!811183))

(declare-fun m!811185 () Bool)

(assert (=> start!74056 m!811185))

(check-sat (not b!869011) (not b!869012) (not mapNonEmpty!27008) b_and!24565 (not b!869016) (not b!869014) (not start!74056) (not b!869021) (not b_next!14803) tp_is_empty!16939 (not b!869020))
(check-sat b_and!24565 (not b_next!14803))
