; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73942 () Bool)

(assert start!73942)

(declare-fun b_free!14875 () Bool)

(declare-fun b_next!14875 () Bool)

(assert (=> start!73942 (= b_free!14875 (not b_next!14875))))

(declare-fun tp!52129 () Bool)

(declare-fun b_and!24601 () Bool)

(assert (=> start!73942 (= tp!52129 b_and!24601)))

(declare-fun res!590719 () Bool)

(declare-fun e!484029 () Bool)

(assert (=> start!73942 (=> (not res!590719) (not e!484029))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50159 0))(
  ( (array!50160 (arr!24111 (Array (_ BitVec 32) (_ BitVec 64))) (size!24553 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50159)

(assert (=> start!73942 (= res!590719 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24553 _keys!868))))))

(assert (=> start!73942 e!484029))

(declare-fun tp_is_empty!17011 () Bool)

(assert (=> start!73942 tp_is_empty!17011))

(assert (=> start!73942 true))

(assert (=> start!73942 tp!52129))

(declare-fun array_inv!19108 (array!50159) Bool)

(assert (=> start!73942 (array_inv!19108 _keys!868)))

(declare-datatypes ((V!27729 0))(
  ( (V!27730 (val!8553 Int)) )
))
(declare-datatypes ((ValueCell!8066 0))(
  ( (ValueCellFull!8066 (v!10972 V!27729)) (EmptyCell!8066) )
))
(declare-datatypes ((array!50161 0))(
  ( (array!50162 (arr!24112 (Array (_ BitVec 32) ValueCell!8066)) (size!24554 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50161)

(declare-fun e!484027 () Bool)

(declare-fun array_inv!19109 (array!50161) Bool)

(assert (=> start!73942 (and (array_inv!19109 _values!688) e!484027)))

(declare-fun b!869164 () Bool)

(declare-fun res!590724 () Bool)

(assert (=> b!869164 (=> (not res!590724) (not e!484029))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869164 (= res!590724 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27116 () Bool)

(declare-fun mapRes!27116 () Bool)

(declare-fun tp!52130 () Bool)

(declare-fun e!484025 () Bool)

(assert (=> mapNonEmpty!27116 (= mapRes!27116 (and tp!52130 e!484025))))

(declare-fun mapRest!27116 () (Array (_ BitVec 32) ValueCell!8066))

(declare-fun mapValue!27116 () ValueCell!8066)

(declare-fun mapKey!27116 () (_ BitVec 32))

(assert (=> mapNonEmpty!27116 (= (arr!24112 _values!688) (store mapRest!27116 mapKey!27116 mapValue!27116))))

(declare-fun b!869165 () Bool)

(declare-fun res!590716 () Bool)

(assert (=> b!869165 (=> (not res!590716) (not e!484029))))

(declare-datatypes ((List!17159 0))(
  ( (Nil!17156) (Cons!17155 (h!18286 (_ BitVec 64)) (t!24187 List!17159)) )
))
(declare-fun arrayNoDuplicates!0 (array!50159 (_ BitVec 32) List!17159) Bool)

(assert (=> b!869165 (= res!590716 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17156))))

(declare-fun b!869166 () Bool)

(declare-fun res!590721 () Bool)

(assert (=> b!869166 (=> (not res!590721) (not e!484029))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!869166 (= res!590721 (and (= (select (arr!24111 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869167 () Bool)

(declare-fun res!590722 () Bool)

(assert (=> b!869167 (=> (not res!590722) (not e!484029))))

(assert (=> b!869167 (= res!590722 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24553 _keys!868))))))

(declare-fun b!869168 () Bool)

(declare-fun res!590717 () Bool)

(assert (=> b!869168 (=> (not res!590717) (not e!484029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50159 (_ BitVec 32)) Bool)

(assert (=> b!869168 (= res!590717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869169 () Bool)

(declare-fun res!590720 () Bool)

(assert (=> b!869169 (=> (not res!590720) (not e!484029))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!869169 (= res!590720 (and (= (size!24554 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24553 _keys!868) (size!24554 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27116 () Bool)

(assert (=> mapIsEmpty!27116 mapRes!27116))

(declare-fun b!869170 () Bool)

(declare-fun e!484024 () Bool)

(assert (=> b!869170 (= e!484029 e!484024)))

(declare-fun res!590723 () Bool)

(assert (=> b!869170 (=> (not res!590723) (not e!484024))))

(assert (=> b!869170 (= res!590723 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394555 () array!50161)

(declare-fun minValue!654 () V!27729)

(declare-datatypes ((tuple2!11374 0))(
  ( (tuple2!11375 (_1!5698 (_ BitVec 64)) (_2!5698 V!27729)) )
))
(declare-datatypes ((List!17160 0))(
  ( (Nil!17157) (Cons!17156 (h!18287 tuple2!11374) (t!24188 List!17160)) )
))
(declare-datatypes ((ListLongMap!10133 0))(
  ( (ListLongMap!10134 (toList!5082 List!17160)) )
))
(declare-fun lt!394554 () ListLongMap!10133)

(declare-fun zeroValue!654 () V!27729)

(declare-fun getCurrentListMapNoExtraKeys!3075 (array!50159 array!50161 (_ BitVec 32) (_ BitVec 32) V!27729 V!27729 (_ BitVec 32) Int) ListLongMap!10133)

(assert (=> b!869170 (= lt!394554 (getCurrentListMapNoExtraKeys!3075 _keys!868 lt!394555 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27729)

(assert (=> b!869170 (= lt!394555 (array!50162 (store (arr!24112 _values!688) i!612 (ValueCellFull!8066 v!557)) (size!24554 _values!688)))))

(declare-fun lt!394556 () ListLongMap!10133)

(assert (=> b!869170 (= lt!394556 (getCurrentListMapNoExtraKeys!3075 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869171 () Bool)

(declare-fun e!484028 () Bool)

(assert (=> b!869171 (= e!484027 (and e!484028 mapRes!27116))))

(declare-fun condMapEmpty!27116 () Bool)

(declare-fun mapDefault!27116 () ValueCell!8066)

(assert (=> b!869171 (= condMapEmpty!27116 (= (arr!24112 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8066)) mapDefault!27116)))))

(declare-fun b!869172 () Bool)

(declare-fun res!590718 () Bool)

(assert (=> b!869172 (=> (not res!590718) (not e!484029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869172 (= res!590718 (validKeyInArray!0 k0!854))))

(declare-fun b!869173 () Bool)

(assert (=> b!869173 (= e!484024 (not true))))

(declare-fun +!2444 (ListLongMap!10133 tuple2!11374) ListLongMap!10133)

(assert (=> b!869173 (= (getCurrentListMapNoExtraKeys!3075 _keys!868 lt!394555 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2444 (getCurrentListMapNoExtraKeys!3075 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11375 k0!854 v!557)))))

(declare-datatypes ((Unit!29775 0))(
  ( (Unit!29776) )
))
(declare-fun lt!394553 () Unit!29775)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!612 (array!50159 array!50161 (_ BitVec 32) (_ BitVec 32) V!27729 V!27729 (_ BitVec 32) (_ BitVec 64) V!27729 (_ BitVec 32) Int) Unit!29775)

(assert (=> b!869173 (= lt!394553 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!612 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869174 () Bool)

(assert (=> b!869174 (= e!484025 tp_is_empty!17011)))

(declare-fun b!869175 () Bool)

(assert (=> b!869175 (= e!484028 tp_is_empty!17011)))

(assert (= (and start!73942 res!590719) b!869164))

(assert (= (and b!869164 res!590724) b!869169))

(assert (= (and b!869169 res!590720) b!869168))

(assert (= (and b!869168 res!590717) b!869165))

(assert (= (and b!869165 res!590716) b!869167))

(assert (= (and b!869167 res!590722) b!869172))

(assert (= (and b!869172 res!590718) b!869166))

(assert (= (and b!869166 res!590721) b!869170))

(assert (= (and b!869170 res!590723) b!869173))

(assert (= (and b!869171 condMapEmpty!27116) mapIsEmpty!27116))

(assert (= (and b!869171 (not condMapEmpty!27116)) mapNonEmpty!27116))

(get-info :version)

(assert (= (and mapNonEmpty!27116 ((_ is ValueCellFull!8066) mapValue!27116)) b!869174))

(assert (= (and b!869171 ((_ is ValueCellFull!8066) mapDefault!27116)) b!869175))

(assert (= start!73942 b!869171))

(declare-fun m!810189 () Bool)

(assert (=> b!869173 m!810189))

(declare-fun m!810191 () Bool)

(assert (=> b!869173 m!810191))

(assert (=> b!869173 m!810191))

(declare-fun m!810193 () Bool)

(assert (=> b!869173 m!810193))

(declare-fun m!810195 () Bool)

(assert (=> b!869173 m!810195))

(declare-fun m!810197 () Bool)

(assert (=> mapNonEmpty!27116 m!810197))

(declare-fun m!810199 () Bool)

(assert (=> b!869172 m!810199))

(declare-fun m!810201 () Bool)

(assert (=> b!869164 m!810201))

(declare-fun m!810203 () Bool)

(assert (=> b!869166 m!810203))

(declare-fun m!810205 () Bool)

(assert (=> b!869170 m!810205))

(declare-fun m!810207 () Bool)

(assert (=> b!869170 m!810207))

(declare-fun m!810209 () Bool)

(assert (=> b!869170 m!810209))

(declare-fun m!810211 () Bool)

(assert (=> start!73942 m!810211))

(declare-fun m!810213 () Bool)

(assert (=> start!73942 m!810213))

(declare-fun m!810215 () Bool)

(assert (=> b!869168 m!810215))

(declare-fun m!810217 () Bool)

(assert (=> b!869165 m!810217))

(check-sat tp_is_empty!17011 (not b!869165) (not b!869164) (not b!869172) (not b!869173) (not mapNonEmpty!27116) (not start!73942) (not b!869170) (not b_next!14875) (not b!869168) b_and!24601)
(check-sat b_and!24601 (not b_next!14875))
