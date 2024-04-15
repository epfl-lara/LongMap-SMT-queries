; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73978 () Bool)

(assert start!73978)

(declare-fun b_free!14911 () Bool)

(declare-fun b_next!14911 () Bool)

(assert (=> start!73978 (= b_free!14911 (not b_next!14911))))

(declare-fun tp!52237 () Bool)

(declare-fun b_and!24637 () Bool)

(assert (=> start!73978 (= tp!52237 b_and!24637)))

(declare-fun b!869812 () Bool)

(declare-fun res!591210 () Bool)

(declare-fun e!484350 () Bool)

(assert (=> b!869812 (=> (not res!591210) (not e!484350))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50229 0))(
  ( (array!50230 (arr!24146 (Array (_ BitVec 32) (_ BitVec 64))) (size!24588 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50229)

(assert (=> b!869812 (= res!591210 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24588 _keys!868))))))

(declare-fun b!869813 () Bool)

(declare-fun e!484351 () Bool)

(declare-fun tp_is_empty!17047 () Bool)

(assert (=> b!869813 (= e!484351 tp_is_empty!17047)))

(declare-fun res!591209 () Bool)

(assert (=> start!73978 (=> (not res!591209) (not e!484350))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73978 (= res!591209 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24588 _keys!868))))))

(assert (=> start!73978 e!484350))

(assert (=> start!73978 tp_is_empty!17047))

(assert (=> start!73978 true))

(assert (=> start!73978 tp!52237))

(declare-fun array_inv!19132 (array!50229) Bool)

(assert (=> start!73978 (array_inv!19132 _keys!868)))

(declare-datatypes ((V!27777 0))(
  ( (V!27778 (val!8571 Int)) )
))
(declare-datatypes ((ValueCell!8084 0))(
  ( (ValueCellFull!8084 (v!10990 V!27777)) (EmptyCell!8084) )
))
(declare-datatypes ((array!50231 0))(
  ( (array!50232 (arr!24147 (Array (_ BitVec 32) ValueCell!8084)) (size!24589 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50231)

(declare-fun e!484352 () Bool)

(declare-fun array_inv!19133 (array!50231) Bool)

(assert (=> start!73978 (and (array_inv!19133 _values!688) e!484352)))

(declare-fun mapIsEmpty!27170 () Bool)

(declare-fun mapRes!27170 () Bool)

(assert (=> mapIsEmpty!27170 mapRes!27170))

(declare-fun b!869814 () Bool)

(declare-fun res!591208 () Bool)

(assert (=> b!869814 (=> (not res!591208) (not e!484350))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!869814 (= res!591208 (and (= (size!24589 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24588 _keys!868) (size!24589 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869815 () Bool)

(assert (=> b!869815 (= e!484352 (and e!484351 mapRes!27170))))

(declare-fun condMapEmpty!27170 () Bool)

(declare-fun mapDefault!27170 () ValueCell!8084)

(assert (=> b!869815 (= condMapEmpty!27170 (= (arr!24147 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8084)) mapDefault!27170)))))

(declare-fun mapNonEmpty!27170 () Bool)

(declare-fun tp!52238 () Bool)

(declare-fun e!484348 () Bool)

(assert (=> mapNonEmpty!27170 (= mapRes!27170 (and tp!52238 e!484348))))

(declare-fun mapRest!27170 () (Array (_ BitVec 32) ValueCell!8084))

(declare-fun mapValue!27170 () ValueCell!8084)

(declare-fun mapKey!27170 () (_ BitVec 32))

(assert (=> mapNonEmpty!27170 (= (arr!24147 _values!688) (store mapRest!27170 mapKey!27170 mapValue!27170))))

(declare-fun b!869816 () Bool)

(declare-fun res!591207 () Bool)

(assert (=> b!869816 (=> (not res!591207) (not e!484350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50229 (_ BitVec 32)) Bool)

(assert (=> b!869816 (= res!591207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869817 () Bool)

(declare-fun e!484349 () Bool)

(assert (=> b!869817 (= e!484350 e!484349)))

(declare-fun res!591203 () Bool)

(assert (=> b!869817 (=> (not res!591203) (not e!484349))))

(assert (=> b!869817 (= res!591203 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394772 () array!50231)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11402 0))(
  ( (tuple2!11403 (_1!5712 (_ BitVec 64)) (_2!5712 V!27777)) )
))
(declare-datatypes ((List!17183 0))(
  ( (Nil!17180) (Cons!17179 (h!18310 tuple2!11402) (t!24211 List!17183)) )
))
(declare-datatypes ((ListLongMap!10161 0))(
  ( (ListLongMap!10162 (toList!5096 List!17183)) )
))
(declare-fun lt!394769 () ListLongMap!10161)

(declare-fun minValue!654 () V!27777)

(declare-fun zeroValue!654 () V!27777)

(declare-fun getCurrentListMapNoExtraKeys!3089 (array!50229 array!50231 (_ BitVec 32) (_ BitVec 32) V!27777 V!27777 (_ BitVec 32) Int) ListLongMap!10161)

(assert (=> b!869817 (= lt!394769 (getCurrentListMapNoExtraKeys!3089 _keys!868 lt!394772 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27777)

(assert (=> b!869817 (= lt!394772 (array!50232 (store (arr!24147 _values!688) i!612 (ValueCellFull!8084 v!557)) (size!24589 _values!688)))))

(declare-fun lt!394771 () ListLongMap!10161)

(assert (=> b!869817 (= lt!394771 (getCurrentListMapNoExtraKeys!3089 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869818 () Bool)

(declare-fun res!591205 () Bool)

(assert (=> b!869818 (=> (not res!591205) (not e!484350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869818 (= res!591205 (validMask!0 mask!1196))))

(declare-fun b!869819 () Bool)

(declare-fun res!591204 () Bool)

(assert (=> b!869819 (=> (not res!591204) (not e!484350))))

(declare-datatypes ((List!17184 0))(
  ( (Nil!17181) (Cons!17180 (h!18311 (_ BitVec 64)) (t!24212 List!17184)) )
))
(declare-fun arrayNoDuplicates!0 (array!50229 (_ BitVec 32) List!17184) Bool)

(assert (=> b!869819 (= res!591204 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17181))))

(declare-fun b!869820 () Bool)

(declare-fun res!591206 () Bool)

(assert (=> b!869820 (=> (not res!591206) (not e!484350))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869820 (= res!591206 (validKeyInArray!0 k0!854))))

(declare-fun b!869821 () Bool)

(declare-fun res!591202 () Bool)

(assert (=> b!869821 (=> (not res!591202) (not e!484350))))

(assert (=> b!869821 (= res!591202 (and (= (select (arr!24146 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869822 () Bool)

(assert (=> b!869822 (= e!484348 tp_is_empty!17047)))

(declare-fun b!869823 () Bool)

(assert (=> b!869823 (= e!484349 (not true))))

(declare-fun +!2457 (ListLongMap!10161 tuple2!11402) ListLongMap!10161)

(assert (=> b!869823 (= (getCurrentListMapNoExtraKeys!3089 _keys!868 lt!394772 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2457 (getCurrentListMapNoExtraKeys!3089 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11403 k0!854 v!557)))))

(declare-datatypes ((Unit!29801 0))(
  ( (Unit!29802) )
))
(declare-fun lt!394770 () Unit!29801)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!625 (array!50229 array!50231 (_ BitVec 32) (_ BitVec 32) V!27777 V!27777 (_ BitVec 32) (_ BitVec 64) V!27777 (_ BitVec 32) Int) Unit!29801)

(assert (=> b!869823 (= lt!394770 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!625 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73978 res!591209) b!869818))

(assert (= (and b!869818 res!591205) b!869814))

(assert (= (and b!869814 res!591208) b!869816))

(assert (= (and b!869816 res!591207) b!869819))

(assert (= (and b!869819 res!591204) b!869812))

(assert (= (and b!869812 res!591210) b!869820))

(assert (= (and b!869820 res!591206) b!869821))

(assert (= (and b!869821 res!591202) b!869817))

(assert (= (and b!869817 res!591203) b!869823))

(assert (= (and b!869815 condMapEmpty!27170) mapIsEmpty!27170))

(assert (= (and b!869815 (not condMapEmpty!27170)) mapNonEmpty!27170))

(get-info :version)

(assert (= (and mapNonEmpty!27170 ((_ is ValueCellFull!8084) mapValue!27170)) b!869822))

(assert (= (and b!869815 ((_ is ValueCellFull!8084) mapDefault!27170)) b!869813))

(assert (= start!73978 b!869815))

(declare-fun m!810729 () Bool)

(assert (=> mapNonEmpty!27170 m!810729))

(declare-fun m!810731 () Bool)

(assert (=> b!869823 m!810731))

(declare-fun m!810733 () Bool)

(assert (=> b!869823 m!810733))

(assert (=> b!869823 m!810733))

(declare-fun m!810735 () Bool)

(assert (=> b!869823 m!810735))

(declare-fun m!810737 () Bool)

(assert (=> b!869823 m!810737))

(declare-fun m!810739 () Bool)

(assert (=> b!869817 m!810739))

(declare-fun m!810741 () Bool)

(assert (=> b!869817 m!810741))

(declare-fun m!810743 () Bool)

(assert (=> b!869817 m!810743))

(declare-fun m!810745 () Bool)

(assert (=> b!869819 m!810745))

(declare-fun m!810747 () Bool)

(assert (=> b!869818 m!810747))

(declare-fun m!810749 () Bool)

(assert (=> start!73978 m!810749))

(declare-fun m!810751 () Bool)

(assert (=> start!73978 m!810751))

(declare-fun m!810753 () Bool)

(assert (=> b!869820 m!810753))

(declare-fun m!810755 () Bool)

(assert (=> b!869821 m!810755))

(declare-fun m!810757 () Bool)

(assert (=> b!869816 m!810757))

(check-sat (not b_next!14911) (not b!869823) (not mapNonEmpty!27170) (not b!869818) (not start!73978) (not b!869817) b_and!24637 (not b!869820) (not b!869819) tp_is_empty!17047 (not b!869816))
(check-sat b_and!24637 (not b_next!14911))
