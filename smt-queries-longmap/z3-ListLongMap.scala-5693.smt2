; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73944 () Bool)

(assert start!73944)

(declare-fun b_free!14859 () Bool)

(declare-fun b_next!14859 () Bool)

(assert (=> start!73944 (= b_free!14859 (not b_next!14859))))

(declare-fun tp!52081 () Bool)

(declare-fun b_and!24611 () Bool)

(assert (=> start!73944 (= tp!52081 b_and!24611)))

(declare-fun b!869115 () Bool)

(declare-fun res!590617 () Bool)

(declare-fun e!484028 () Bool)

(assert (=> b!869115 (=> (not res!590617) (not e!484028))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50138 0))(
  ( (array!50139 (arr!24100 (Array (_ BitVec 32) (_ BitVec 64))) (size!24540 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50138)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869115 (= res!590617 (and (= (select (arr!24100 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27092 () Bool)

(declare-fun mapRes!27092 () Bool)

(assert (=> mapIsEmpty!27092 mapRes!27092))

(declare-fun b!869116 () Bool)

(declare-fun res!590616 () Bool)

(assert (=> b!869116 (=> (not res!590616) (not e!484028))))

(assert (=> b!869116 (= res!590616 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24540 _keys!868))))))

(declare-fun b!869117 () Bool)

(declare-fun res!590612 () Bool)

(assert (=> b!869117 (=> (not res!590612) (not e!484028))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50138 (_ BitVec 32)) Bool)

(assert (=> b!869117 (= res!590612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869118 () Bool)

(declare-fun e!484033 () Bool)

(declare-fun tp_is_empty!16995 () Bool)

(assert (=> b!869118 (= e!484033 tp_is_empty!16995)))

(declare-fun b!869119 () Bool)

(declare-fun res!590615 () Bool)

(assert (=> b!869119 (=> (not res!590615) (not e!484028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869119 (= res!590615 (validMask!0 mask!1196))))

(declare-fun b!869120 () Bool)

(declare-fun res!590618 () Bool)

(assert (=> b!869120 (=> (not res!590618) (not e!484028))))

(declare-datatypes ((List!17140 0))(
  ( (Nil!17137) (Cons!17136 (h!18267 (_ BitVec 64)) (t!24177 List!17140)) )
))
(declare-fun arrayNoDuplicates!0 (array!50138 (_ BitVec 32) List!17140) Bool)

(assert (=> b!869120 (= res!590618 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17137))))

(declare-fun b!869122 () Bool)

(declare-fun e!484030 () Bool)

(assert (=> b!869122 (= e!484028 e!484030)))

(declare-fun res!590613 () Bool)

(assert (=> b!869122 (=> (not res!590613) (not e!484030))))

(assert (=> b!869122 (= res!590613 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27707 0))(
  ( (V!27708 (val!8545 Int)) )
))
(declare-datatypes ((tuple2!11348 0))(
  ( (tuple2!11349 (_1!5685 (_ BitVec 64)) (_2!5685 V!27707)) )
))
(declare-datatypes ((List!17141 0))(
  ( (Nil!17138) (Cons!17137 (h!18268 tuple2!11348) (t!24178 List!17141)) )
))
(declare-datatypes ((ListLongMap!10117 0))(
  ( (ListLongMap!10118 (toList!5074 List!17141)) )
))
(declare-fun lt!394696 () ListLongMap!10117)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8058 0))(
  ( (ValueCellFull!8058 (v!10970 V!27707)) (EmptyCell!8058) )
))
(declare-datatypes ((array!50140 0))(
  ( (array!50141 (arr!24101 (Array (_ BitVec 32) ValueCell!8058)) (size!24541 (_ BitVec 32))) )
))
(declare-fun lt!394695 () array!50140)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27707)

(declare-fun zeroValue!654 () V!27707)

(declare-fun getCurrentListMapNoExtraKeys!3043 (array!50138 array!50140 (_ BitVec 32) (_ BitVec 32) V!27707 V!27707 (_ BitVec 32) Int) ListLongMap!10117)

(assert (=> b!869122 (= lt!394696 (getCurrentListMapNoExtraKeys!3043 _keys!868 lt!394695 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27707)

(declare-fun _values!688 () array!50140)

(assert (=> b!869122 (= lt!394695 (array!50141 (store (arr!24101 _values!688) i!612 (ValueCellFull!8058 v!557)) (size!24541 _values!688)))))

(declare-fun lt!394693 () ListLongMap!10117)

(assert (=> b!869122 (= lt!394693 (getCurrentListMapNoExtraKeys!3043 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869123 () Bool)

(declare-fun e!484032 () Bool)

(assert (=> b!869123 (= e!484032 tp_is_empty!16995)))

(declare-fun b!869124 () Bool)

(assert (=> b!869124 (= e!484030 (not true))))

(declare-fun +!2415 (ListLongMap!10117 tuple2!11348) ListLongMap!10117)

(assert (=> b!869124 (= (getCurrentListMapNoExtraKeys!3043 _keys!868 lt!394695 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2415 (getCurrentListMapNoExtraKeys!3043 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11349 k0!854 v!557)))))

(declare-datatypes ((Unit!29828 0))(
  ( (Unit!29829) )
))
(declare-fun lt!394694 () Unit!29828)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!609 (array!50138 array!50140 (_ BitVec 32) (_ BitVec 32) V!27707 V!27707 (_ BitVec 32) (_ BitVec 64) V!27707 (_ BitVec 32) Int) Unit!29828)

(assert (=> b!869124 (= lt!394694 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!609 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27092 () Bool)

(declare-fun tp!52080 () Bool)

(assert (=> mapNonEmpty!27092 (= mapRes!27092 (and tp!52080 e!484032))))

(declare-fun mapRest!27092 () (Array (_ BitVec 32) ValueCell!8058))

(declare-fun mapKey!27092 () (_ BitVec 32))

(declare-fun mapValue!27092 () ValueCell!8058)

(assert (=> mapNonEmpty!27092 (= (arr!24101 _values!688) (store mapRest!27092 mapKey!27092 mapValue!27092))))

(declare-fun b!869125 () Bool)

(declare-fun e!484029 () Bool)

(assert (=> b!869125 (= e!484029 (and e!484033 mapRes!27092))))

(declare-fun condMapEmpty!27092 () Bool)

(declare-fun mapDefault!27092 () ValueCell!8058)

(assert (=> b!869125 (= condMapEmpty!27092 (= (arr!24101 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8058)) mapDefault!27092)))))

(declare-fun b!869126 () Bool)

(declare-fun res!590610 () Bool)

(assert (=> b!869126 (=> (not res!590610) (not e!484028))))

(assert (=> b!869126 (= res!590610 (and (= (size!24541 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24540 _keys!868) (size!24541 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!590611 () Bool)

(assert (=> start!73944 (=> (not res!590611) (not e!484028))))

(assert (=> start!73944 (= res!590611 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24540 _keys!868))))))

(assert (=> start!73944 e!484028))

(assert (=> start!73944 tp_is_empty!16995))

(assert (=> start!73944 true))

(assert (=> start!73944 tp!52081))

(declare-fun array_inv!19036 (array!50138) Bool)

(assert (=> start!73944 (array_inv!19036 _keys!868)))

(declare-fun array_inv!19037 (array!50140) Bool)

(assert (=> start!73944 (and (array_inv!19037 _values!688) e!484029)))

(declare-fun b!869121 () Bool)

(declare-fun res!590614 () Bool)

(assert (=> b!869121 (=> (not res!590614) (not e!484028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869121 (= res!590614 (validKeyInArray!0 k0!854))))

(assert (= (and start!73944 res!590611) b!869119))

(assert (= (and b!869119 res!590615) b!869126))

(assert (= (and b!869126 res!590610) b!869117))

(assert (= (and b!869117 res!590612) b!869120))

(assert (= (and b!869120 res!590618) b!869116))

(assert (= (and b!869116 res!590616) b!869121))

(assert (= (and b!869121 res!590614) b!869115))

(assert (= (and b!869115 res!590617) b!869122))

(assert (= (and b!869122 res!590613) b!869124))

(assert (= (and b!869125 condMapEmpty!27092) mapIsEmpty!27092))

(assert (= (and b!869125 (not condMapEmpty!27092)) mapNonEmpty!27092))

(get-info :version)

(assert (= (and mapNonEmpty!27092 ((_ is ValueCellFull!8058) mapValue!27092)) b!869123))

(assert (= (and b!869125 ((_ is ValueCellFull!8058) mapDefault!27092)) b!869118))

(assert (= start!73944 b!869125))

(declare-fun m!810707 () Bool)

(assert (=> b!869119 m!810707))

(declare-fun m!810709 () Bool)

(assert (=> mapNonEmpty!27092 m!810709))

(declare-fun m!810711 () Bool)

(assert (=> b!869120 m!810711))

(declare-fun m!810713 () Bool)

(assert (=> b!869115 m!810713))

(declare-fun m!810715 () Bool)

(assert (=> start!73944 m!810715))

(declare-fun m!810717 () Bool)

(assert (=> start!73944 m!810717))

(declare-fun m!810719 () Bool)

(assert (=> b!869122 m!810719))

(declare-fun m!810721 () Bool)

(assert (=> b!869122 m!810721))

(declare-fun m!810723 () Bool)

(assert (=> b!869122 m!810723))

(declare-fun m!810725 () Bool)

(assert (=> b!869117 m!810725))

(declare-fun m!810727 () Bool)

(assert (=> b!869124 m!810727))

(declare-fun m!810729 () Bool)

(assert (=> b!869124 m!810729))

(assert (=> b!869124 m!810729))

(declare-fun m!810731 () Bool)

(assert (=> b!869124 m!810731))

(declare-fun m!810733 () Bool)

(assert (=> b!869124 m!810733))

(declare-fun m!810735 () Bool)

(assert (=> b!869121 m!810735))

(check-sat (not b_next!14859) (not b!869124) (not mapNonEmpty!27092) (not b!869122) (not b!869117) (not b!869119) tp_is_empty!16995 b_and!24611 (not start!73944) (not b!869121) (not b!869120))
(check-sat b_and!24611 (not b_next!14859))
