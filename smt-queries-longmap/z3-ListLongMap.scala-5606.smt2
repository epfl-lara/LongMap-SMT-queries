; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73402 () Bool)

(assert start!73402)

(declare-fun b_free!14335 () Bool)

(declare-fun b_next!14335 () Bool)

(assert (=> start!73402 (= b_free!14335 (not b_next!14335))))

(declare-fun tp!50510 () Bool)

(declare-fun b_and!23665 () Bool)

(assert (=> start!73402 (= tp!50510 b_and!23665)))

(declare-fun b!856915 () Bool)

(declare-fun e!477608 () Bool)

(declare-fun tp_is_empty!16471 () Bool)

(assert (=> b!856915 (= e!477608 tp_is_empty!16471)))

(declare-fun b!856916 () Bool)

(declare-fun e!477610 () Bool)

(assert (=> b!856916 (= e!477610 tp_is_empty!16471)))

(declare-fun b!856917 () Bool)

(declare-fun res!582122 () Bool)

(declare-fun e!477607 () Bool)

(assert (=> b!856917 (=> (not res!582122) (not e!477607))))

(declare-datatypes ((array!49113 0))(
  ( (array!49114 (arr!23588 (Array (_ BitVec 32) (_ BitVec 64))) (size!24030 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49113)

(declare-datatypes ((List!16736 0))(
  ( (Nil!16733) (Cons!16732 (h!17863 (_ BitVec 64)) (t!23368 List!16736)) )
))
(declare-fun arrayNoDuplicates!0 (array!49113 (_ BitVec 32) List!16736) Bool)

(assert (=> b!856917 (= res!582122 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16733))))

(declare-fun b!856918 () Bool)

(declare-fun res!582126 () Bool)

(assert (=> b!856918 (=> (not res!582126) (not e!477607))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856918 (= res!582126 (validMask!0 mask!1196))))

(declare-fun b!856919 () Bool)

(declare-fun e!477609 () Bool)

(declare-fun mapRes!26306 () Bool)

(assert (=> b!856919 (= e!477609 (and e!477608 mapRes!26306))))

(declare-fun condMapEmpty!26306 () Bool)

(declare-datatypes ((V!27009 0))(
  ( (V!27010 (val!8283 Int)) )
))
(declare-datatypes ((ValueCell!7796 0))(
  ( (ValueCellFull!7796 (v!10702 V!27009)) (EmptyCell!7796) )
))
(declare-datatypes ((array!49115 0))(
  ( (array!49116 (arr!23589 (Array (_ BitVec 32) ValueCell!7796)) (size!24031 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49115)

(declare-fun mapDefault!26306 () ValueCell!7796)

(assert (=> b!856919 (= condMapEmpty!26306 (= (arr!23589 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7796)) mapDefault!26306)))))

(declare-fun b!856920 () Bool)

(declare-fun res!582124 () Bool)

(assert (=> b!856920 (=> (not res!582124) (not e!477607))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856920 (= res!582124 (and (= (select (arr!23588 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26306 () Bool)

(declare-fun tp!50509 () Bool)

(assert (=> mapNonEmpty!26306 (= mapRes!26306 (and tp!50509 e!477610))))

(declare-fun mapRest!26306 () (Array (_ BitVec 32) ValueCell!7796))

(declare-fun mapValue!26306 () ValueCell!7796)

(declare-fun mapKey!26306 () (_ BitVec 32))

(assert (=> mapNonEmpty!26306 (= (arr!23589 _values!688) (store mapRest!26306 mapKey!26306 mapValue!26306))))

(declare-fun res!582129 () Bool)

(assert (=> start!73402 (=> (not res!582129) (not e!477607))))

(assert (=> start!73402 (= res!582129 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24030 _keys!868))))))

(assert (=> start!73402 e!477607))

(assert (=> start!73402 tp_is_empty!16471))

(assert (=> start!73402 true))

(assert (=> start!73402 tp!50510))

(declare-fun array_inv!18748 (array!49113) Bool)

(assert (=> start!73402 (array_inv!18748 _keys!868)))

(declare-fun array_inv!18749 (array!49115) Bool)

(assert (=> start!73402 (and (array_inv!18749 _values!688) e!477609)))

(declare-fun b!856921 () Bool)

(declare-fun res!582121 () Bool)

(assert (=> b!856921 (=> (not res!582121) (not e!477607))))

(assert (=> b!856921 (= res!582121 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24030 _keys!868))))))

(declare-fun mapIsEmpty!26306 () Bool)

(assert (=> mapIsEmpty!26306 mapRes!26306))

(declare-fun b!856922 () Bool)

(declare-fun res!582128 () Bool)

(assert (=> b!856922 (=> (not res!582128) (not e!477607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856922 (= res!582128 (validKeyInArray!0 k0!854))))

(declare-fun b!856923 () Bool)

(declare-fun e!477611 () Bool)

(assert (=> b!856923 (= e!477607 e!477611)))

(declare-fun res!582123 () Bool)

(assert (=> b!856923 (=> (not res!582123) (not e!477611))))

(assert (=> b!856923 (= res!582123 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385961 () array!49115)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10930 0))(
  ( (tuple2!10931 (_1!5476 (_ BitVec 64)) (_2!5476 V!27009)) )
))
(declare-datatypes ((List!16737 0))(
  ( (Nil!16734) (Cons!16733 (h!17864 tuple2!10930) (t!23369 List!16737)) )
))
(declare-datatypes ((ListLongMap!9689 0))(
  ( (ListLongMap!9690 (toList!4860 List!16737)) )
))
(declare-fun lt!385960 () ListLongMap!9689)

(declare-fun minValue!654 () V!27009)

(declare-fun zeroValue!654 () V!27009)

(declare-fun getCurrentListMapNoExtraKeys!2867 (array!49113 array!49115 (_ BitVec 32) (_ BitVec 32) V!27009 V!27009 (_ BitVec 32) Int) ListLongMap!9689)

(assert (=> b!856923 (= lt!385960 (getCurrentListMapNoExtraKeys!2867 _keys!868 lt!385961 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27009)

(assert (=> b!856923 (= lt!385961 (array!49116 (store (arr!23589 _values!688) i!612 (ValueCellFull!7796 v!557)) (size!24031 _values!688)))))

(declare-fun lt!385959 () ListLongMap!9689)

(assert (=> b!856923 (= lt!385959 (getCurrentListMapNoExtraKeys!2867 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856924 () Bool)

(declare-fun res!582127 () Bool)

(assert (=> b!856924 (=> (not res!582127) (not e!477607))))

(assert (=> b!856924 (= res!582127 (and (= (size!24031 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24030 _keys!868) (size!24031 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856925 () Bool)

(declare-fun res!582125 () Bool)

(assert (=> b!856925 (=> (not res!582125) (not e!477607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49113 (_ BitVec 32)) Bool)

(assert (=> b!856925 (= res!582125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856926 () Bool)

(assert (=> b!856926 (= e!477611 (not true))))

(declare-fun +!2237 (ListLongMap!9689 tuple2!10930) ListLongMap!9689)

(assert (=> b!856926 (= (getCurrentListMapNoExtraKeys!2867 _keys!868 lt!385961 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2237 (getCurrentListMapNoExtraKeys!2867 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10931 k0!854 v!557)))))

(declare-datatypes ((Unit!29143 0))(
  ( (Unit!29144) )
))
(declare-fun lt!385958 () Unit!29143)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!434 (array!49113 array!49115 (_ BitVec 32) (_ BitVec 32) V!27009 V!27009 (_ BitVec 32) (_ BitVec 64) V!27009 (_ BitVec 32) Int) Unit!29143)

(assert (=> b!856926 (= lt!385958 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!434 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73402 res!582129) b!856918))

(assert (= (and b!856918 res!582126) b!856924))

(assert (= (and b!856924 res!582127) b!856925))

(assert (= (and b!856925 res!582125) b!856917))

(assert (= (and b!856917 res!582122) b!856921))

(assert (= (and b!856921 res!582121) b!856922))

(assert (= (and b!856922 res!582128) b!856920))

(assert (= (and b!856920 res!582124) b!856923))

(assert (= (and b!856923 res!582123) b!856926))

(assert (= (and b!856919 condMapEmpty!26306) mapIsEmpty!26306))

(assert (= (and b!856919 (not condMapEmpty!26306)) mapNonEmpty!26306))

(get-info :version)

(assert (= (and mapNonEmpty!26306 ((_ is ValueCellFull!7796) mapValue!26306)) b!856916))

(assert (= (and b!856919 ((_ is ValueCellFull!7796) mapDefault!26306)) b!856915))

(assert (= start!73402 b!856919))

(declare-fun m!797223 () Bool)

(assert (=> b!856923 m!797223))

(declare-fun m!797225 () Bool)

(assert (=> b!856923 m!797225))

(declare-fun m!797227 () Bool)

(assert (=> b!856923 m!797227))

(declare-fun m!797229 () Bool)

(assert (=> b!856925 m!797229))

(declare-fun m!797231 () Bool)

(assert (=> b!856922 m!797231))

(declare-fun m!797233 () Bool)

(assert (=> b!856926 m!797233))

(declare-fun m!797235 () Bool)

(assert (=> b!856926 m!797235))

(assert (=> b!856926 m!797235))

(declare-fun m!797237 () Bool)

(assert (=> b!856926 m!797237))

(declare-fun m!797239 () Bool)

(assert (=> b!856926 m!797239))

(declare-fun m!797241 () Bool)

(assert (=> start!73402 m!797241))

(declare-fun m!797243 () Bool)

(assert (=> start!73402 m!797243))

(declare-fun m!797245 () Bool)

(assert (=> mapNonEmpty!26306 m!797245))

(declare-fun m!797247 () Bool)

(assert (=> b!856918 m!797247))

(declare-fun m!797249 () Bool)

(assert (=> b!856920 m!797249))

(declare-fun m!797251 () Bool)

(assert (=> b!856917 m!797251))

(check-sat (not b!856925) (not b!856922) (not b!856917) (not b!856926) (not b!856918) tp_is_empty!16471 (not mapNonEmpty!26306) (not start!73402) b_and!23665 (not b!856923) (not b_next!14335))
(check-sat b_and!23665 (not b_next!14335))
