; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73930 () Bool)

(assert start!73930)

(declare-fun b_free!14863 () Bool)

(declare-fun b_next!14863 () Bool)

(assert (=> start!73930 (= b_free!14863 (not b_next!14863))))

(declare-fun tp!52093 () Bool)

(declare-fun b_and!24589 () Bool)

(assert (=> start!73930 (= tp!52093 b_and!24589)))

(declare-fun b!868948 () Bool)

(declare-fun res!590562 () Bool)

(declare-fun e!483918 () Bool)

(assert (=> b!868948 (=> (not res!590562) (not e!483918))))

(declare-datatypes ((array!50139 0))(
  ( (array!50140 (arr!24101 (Array (_ BitVec 32) (_ BitVec 64))) (size!24543 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50139)

(declare-datatypes ((List!17152 0))(
  ( (Nil!17149) (Cons!17148 (h!18279 (_ BitVec 64)) (t!24180 List!17152)) )
))
(declare-fun arrayNoDuplicates!0 (array!50139 (_ BitVec 32) List!17152) Bool)

(assert (=> b!868948 (= res!590562 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17149))))

(declare-fun b!868949 () Bool)

(declare-fun e!483919 () Bool)

(declare-fun e!483917 () Bool)

(declare-fun mapRes!27098 () Bool)

(assert (=> b!868949 (= e!483919 (and e!483917 mapRes!27098))))

(declare-fun condMapEmpty!27098 () Bool)

(declare-datatypes ((V!27713 0))(
  ( (V!27714 (val!8547 Int)) )
))
(declare-datatypes ((ValueCell!8060 0))(
  ( (ValueCellFull!8060 (v!10966 V!27713)) (EmptyCell!8060) )
))
(declare-datatypes ((array!50141 0))(
  ( (array!50142 (arr!24102 (Array (_ BitVec 32) ValueCell!8060)) (size!24544 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50141)

(declare-fun mapDefault!27098 () ValueCell!8060)

(assert (=> b!868949 (= condMapEmpty!27098 (= (arr!24102 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8060)) mapDefault!27098)))))

(declare-fun b!868950 () Bool)

(declare-fun res!590558 () Bool)

(assert (=> b!868950 (=> (not res!590558) (not e!483918))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50139 (_ BitVec 32)) Bool)

(assert (=> b!868950 (= res!590558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868951 () Bool)

(declare-fun res!590561 () Bool)

(assert (=> b!868951 (=> (not res!590561) (not e!483918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868951 (= res!590561 (validMask!0 mask!1196))))

(declare-fun res!590555 () Bool)

(assert (=> start!73930 (=> (not res!590555) (not e!483918))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73930 (= res!590555 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24543 _keys!868))))))

(assert (=> start!73930 e!483918))

(declare-fun tp_is_empty!16999 () Bool)

(assert (=> start!73930 tp_is_empty!16999))

(assert (=> start!73930 true))

(assert (=> start!73930 tp!52093))

(declare-fun array_inv!19104 (array!50139) Bool)

(assert (=> start!73930 (array_inv!19104 _keys!868)))

(declare-fun array_inv!19105 (array!50141) Bool)

(assert (=> start!73930 (and (array_inv!19105 _values!688) e!483919)))

(declare-fun mapNonEmpty!27098 () Bool)

(declare-fun tp!52094 () Bool)

(declare-fun e!483916 () Bool)

(assert (=> mapNonEmpty!27098 (= mapRes!27098 (and tp!52094 e!483916))))

(declare-fun mapRest!27098 () (Array (_ BitVec 32) ValueCell!8060))

(declare-fun mapKey!27098 () (_ BitVec 32))

(declare-fun mapValue!27098 () ValueCell!8060)

(assert (=> mapNonEmpty!27098 (= (arr!24102 _values!688) (store mapRest!27098 mapKey!27098 mapValue!27098))))

(declare-fun b!868952 () Bool)

(declare-fun e!483920 () Bool)

(assert (=> b!868952 (= e!483920 (not true))))

(declare-fun v!557 () V!27713)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!27713)

(declare-fun zeroValue!654 () V!27713)

(declare-fun lt!394484 () array!50141)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11368 0))(
  ( (tuple2!11369 (_1!5695 (_ BitVec 64)) (_2!5695 V!27713)) )
))
(declare-datatypes ((List!17153 0))(
  ( (Nil!17150) (Cons!17149 (h!18280 tuple2!11368) (t!24181 List!17153)) )
))
(declare-datatypes ((ListLongMap!10127 0))(
  ( (ListLongMap!10128 (toList!5079 List!17153)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3072 (array!50139 array!50141 (_ BitVec 32) (_ BitVec 32) V!27713 V!27713 (_ BitVec 32) Int) ListLongMap!10127)

(declare-fun +!2441 (ListLongMap!10127 tuple2!11368) ListLongMap!10127)

(assert (=> b!868952 (= (getCurrentListMapNoExtraKeys!3072 _keys!868 lt!394484 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2441 (getCurrentListMapNoExtraKeys!3072 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11369 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29769 0))(
  ( (Unit!29770) )
))
(declare-fun lt!394481 () Unit!29769)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!609 (array!50139 array!50141 (_ BitVec 32) (_ BitVec 32) V!27713 V!27713 (_ BitVec 32) (_ BitVec 64) V!27713 (_ BitVec 32) Int) Unit!29769)

(assert (=> b!868952 (= lt!394481 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!609 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868953 () Bool)

(assert (=> b!868953 (= e!483918 e!483920)))

(declare-fun res!590554 () Bool)

(assert (=> b!868953 (=> (not res!590554) (not e!483920))))

(assert (=> b!868953 (= res!590554 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394482 () ListLongMap!10127)

(assert (=> b!868953 (= lt!394482 (getCurrentListMapNoExtraKeys!3072 _keys!868 lt!394484 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868953 (= lt!394484 (array!50142 (store (arr!24102 _values!688) i!612 (ValueCellFull!8060 v!557)) (size!24544 _values!688)))))

(declare-fun lt!394483 () ListLongMap!10127)

(assert (=> b!868953 (= lt!394483 (getCurrentListMapNoExtraKeys!3072 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868954 () Bool)

(declare-fun res!590560 () Bool)

(assert (=> b!868954 (=> (not res!590560) (not e!483918))))

(assert (=> b!868954 (= res!590560 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24543 _keys!868))))))

(declare-fun b!868955 () Bool)

(declare-fun res!590559 () Bool)

(assert (=> b!868955 (=> (not res!590559) (not e!483918))))

(assert (=> b!868955 (= res!590559 (and (= (select (arr!24101 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868956 () Bool)

(assert (=> b!868956 (= e!483917 tp_is_empty!16999)))

(declare-fun b!868957 () Bool)

(assert (=> b!868957 (= e!483916 tp_is_empty!16999)))

(declare-fun b!868958 () Bool)

(declare-fun res!590556 () Bool)

(assert (=> b!868958 (=> (not res!590556) (not e!483918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868958 (= res!590556 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27098 () Bool)

(assert (=> mapIsEmpty!27098 mapRes!27098))

(declare-fun b!868959 () Bool)

(declare-fun res!590557 () Bool)

(assert (=> b!868959 (=> (not res!590557) (not e!483918))))

(assert (=> b!868959 (= res!590557 (and (= (size!24544 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24543 _keys!868) (size!24544 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73930 res!590555) b!868951))

(assert (= (and b!868951 res!590561) b!868959))

(assert (= (and b!868959 res!590557) b!868950))

(assert (= (and b!868950 res!590558) b!868948))

(assert (= (and b!868948 res!590562) b!868954))

(assert (= (and b!868954 res!590560) b!868958))

(assert (= (and b!868958 res!590556) b!868955))

(assert (= (and b!868955 res!590559) b!868953))

(assert (= (and b!868953 res!590554) b!868952))

(assert (= (and b!868949 condMapEmpty!27098) mapIsEmpty!27098))

(assert (= (and b!868949 (not condMapEmpty!27098)) mapNonEmpty!27098))

(get-info :version)

(assert (= (and mapNonEmpty!27098 ((_ is ValueCellFull!8060) mapValue!27098)) b!868957))

(assert (= (and b!868949 ((_ is ValueCellFull!8060) mapDefault!27098)) b!868956))

(assert (= start!73930 b!868949))

(declare-fun m!810009 () Bool)

(assert (=> b!868948 m!810009))

(declare-fun m!810011 () Bool)

(assert (=> b!868951 m!810011))

(declare-fun m!810013 () Bool)

(assert (=> b!868952 m!810013))

(declare-fun m!810015 () Bool)

(assert (=> b!868952 m!810015))

(assert (=> b!868952 m!810015))

(declare-fun m!810017 () Bool)

(assert (=> b!868952 m!810017))

(declare-fun m!810019 () Bool)

(assert (=> b!868952 m!810019))

(declare-fun m!810021 () Bool)

(assert (=> b!868953 m!810021))

(declare-fun m!810023 () Bool)

(assert (=> b!868953 m!810023))

(declare-fun m!810025 () Bool)

(assert (=> b!868953 m!810025))

(declare-fun m!810027 () Bool)

(assert (=> start!73930 m!810027))

(declare-fun m!810029 () Bool)

(assert (=> start!73930 m!810029))

(declare-fun m!810031 () Bool)

(assert (=> b!868955 m!810031))

(declare-fun m!810033 () Bool)

(assert (=> mapNonEmpty!27098 m!810033))

(declare-fun m!810035 () Bool)

(assert (=> b!868950 m!810035))

(declare-fun m!810037 () Bool)

(assert (=> b!868958 m!810037))

(check-sat (not start!73930) tp_is_empty!16999 (not b!868958) (not b!868952) b_and!24589 (not mapNonEmpty!27098) (not b!868951) (not b_next!14863) (not b!868948) (not b!868950) (not b!868953))
(check-sat b_and!24589 (not b_next!14863))
