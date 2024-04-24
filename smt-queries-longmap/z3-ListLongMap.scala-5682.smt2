; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74044 () Bool)

(assert start!74044)

(declare-fun b_free!14791 () Bool)

(declare-fun b_next!14791 () Bool)

(assert (=> start!74044 (= b_free!14791 (not b_next!14791))))

(declare-fun tp!51877 () Bool)

(declare-fun b_and!24553 () Bool)

(assert (=> start!74044 (= tp!51877 b_and!24553)))

(declare-fun b!868794 () Bool)

(declare-fun e!483998 () Bool)

(declare-fun tp_is_empty!16927 () Bool)

(assert (=> b!868794 (= e!483998 tp_is_empty!16927)))

(declare-fun b!868795 () Bool)

(declare-fun res!590042 () Bool)

(declare-fun e!484002 () Bool)

(assert (=> b!868795 (=> (not res!590042) (not e!484002))))

(declare-datatypes ((array!50063 0))(
  ( (array!50064 (arr!24058 (Array (_ BitVec 32) (_ BitVec 64))) (size!24499 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50063)

(declare-datatypes ((List!17047 0))(
  ( (Nil!17044) (Cons!17043 (h!18180 (_ BitVec 64)) (t!24076 List!17047)) )
))
(declare-fun arrayNoDuplicates!0 (array!50063 (_ BitVec 32) List!17047) Bool)

(assert (=> b!868795 (= res!590042 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17044))))

(declare-fun b!868796 () Bool)

(declare-fun res!590043 () Bool)

(assert (=> b!868796 (=> (not res!590043) (not e!484002))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868796 (= res!590043 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26990 () Bool)

(declare-fun mapRes!26990 () Bool)

(assert (=> mapIsEmpty!26990 mapRes!26990))

(declare-fun b!868797 () Bool)

(declare-fun e!484001 () Bool)

(assert (=> b!868797 (= e!484001 tp_is_empty!16927)))

(declare-fun b!868798 () Bool)

(declare-fun res!590036 () Bool)

(assert (=> b!868798 (=> (not res!590036) (not e!484002))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27617 0))(
  ( (V!27618 (val!8511 Int)) )
))
(declare-datatypes ((ValueCell!8024 0))(
  ( (ValueCellFull!8024 (v!10936 V!27617)) (EmptyCell!8024) )
))
(declare-datatypes ((array!50065 0))(
  ( (array!50066 (arr!24059 (Array (_ BitVec 32) ValueCell!8024)) (size!24500 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50065)

(assert (=> b!868798 (= res!590036 (and (= (size!24500 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24499 _keys!868) (size!24500 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868799 () Bool)

(declare-fun e!484003 () Bool)

(assert (=> b!868799 (= e!484002 e!484003)))

(declare-fun res!590038 () Bool)

(assert (=> b!868799 (=> (not res!590038) (not e!484003))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868799 (= res!590038 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11218 0))(
  ( (tuple2!11219 (_1!5620 (_ BitVec 64)) (_2!5620 V!27617)) )
))
(declare-datatypes ((List!17048 0))(
  ( (Nil!17045) (Cons!17044 (h!18181 tuple2!11218) (t!24077 List!17048)) )
))
(declare-datatypes ((ListLongMap!9989 0))(
  ( (ListLongMap!9990 (toList!5010 List!17048)) )
))
(declare-fun lt!394648 () ListLongMap!9989)

(declare-fun minValue!654 () V!27617)

(declare-fun zeroValue!654 () V!27617)

(declare-fun lt!394649 () array!50065)

(declare-fun getCurrentListMapNoExtraKeys!3054 (array!50063 array!50065 (_ BitVec 32) (_ BitVec 32) V!27617 V!27617 (_ BitVec 32) Int) ListLongMap!9989)

(assert (=> b!868799 (= lt!394648 (getCurrentListMapNoExtraKeys!3054 _keys!868 lt!394649 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27617)

(assert (=> b!868799 (= lt!394649 (array!50066 (store (arr!24059 _values!688) i!612 (ValueCellFull!8024 v!557)) (size!24500 _values!688)))))

(declare-fun lt!394646 () ListLongMap!9989)

(assert (=> b!868799 (= lt!394646 (getCurrentListMapNoExtraKeys!3054 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868800 () Bool)

(declare-fun res!590039 () Bool)

(assert (=> b!868800 (=> (not res!590039) (not e!484002))))

(assert (=> b!868800 (= res!590039 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24499 _keys!868))))))

(declare-fun b!868801 () Bool)

(declare-fun res!590037 () Bool)

(assert (=> b!868801 (=> (not res!590037) (not e!484002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50063 (_ BitVec 32)) Bool)

(assert (=> b!868801 (= res!590037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!590044 () Bool)

(assert (=> start!74044 (=> (not res!590044) (not e!484002))))

(assert (=> start!74044 (= res!590044 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24499 _keys!868))))))

(assert (=> start!74044 e!484002))

(assert (=> start!74044 tp_is_empty!16927))

(assert (=> start!74044 true))

(assert (=> start!74044 tp!51877))

(declare-fun array_inv!19062 (array!50063) Bool)

(assert (=> start!74044 (array_inv!19062 _keys!868)))

(declare-fun e!483999 () Bool)

(declare-fun array_inv!19063 (array!50065) Bool)

(assert (=> start!74044 (and (array_inv!19063 _values!688) e!483999)))

(declare-fun b!868802 () Bool)

(assert (=> b!868802 (= e!483999 (and e!484001 mapRes!26990))))

(declare-fun condMapEmpty!26990 () Bool)

(declare-fun mapDefault!26990 () ValueCell!8024)

(assert (=> b!868802 (= condMapEmpty!26990 (= (arr!24059 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8024)) mapDefault!26990)))))

(declare-fun mapNonEmpty!26990 () Bool)

(declare-fun tp!51878 () Bool)

(assert (=> mapNonEmpty!26990 (= mapRes!26990 (and tp!51878 e!483998))))

(declare-fun mapValue!26990 () ValueCell!8024)

(declare-fun mapRest!26990 () (Array (_ BitVec 32) ValueCell!8024))

(declare-fun mapKey!26990 () (_ BitVec 32))

(assert (=> mapNonEmpty!26990 (= (arr!24059 _values!688) (store mapRest!26990 mapKey!26990 mapValue!26990))))

(declare-fun b!868803 () Bool)

(assert (=> b!868803 (= e!484003 (not true))))

(declare-fun +!2411 (ListLongMap!9989 tuple2!11218) ListLongMap!9989)

(assert (=> b!868803 (= (getCurrentListMapNoExtraKeys!3054 _keys!868 lt!394649 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2411 (getCurrentListMapNoExtraKeys!3054 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11219 k0!854 v!557)))))

(declare-datatypes ((Unit!29772 0))(
  ( (Unit!29773) )
))
(declare-fun lt!394647 () Unit!29772)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!582 (array!50063 array!50065 (_ BitVec 32) (_ BitVec 32) V!27617 V!27617 (_ BitVec 32) (_ BitVec 64) V!27617 (_ BitVec 32) Int) Unit!29772)

(assert (=> b!868803 (= lt!394647 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!582 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868804 () Bool)

(declare-fun res!590040 () Bool)

(assert (=> b!868804 (=> (not res!590040) (not e!484002))))

(assert (=> b!868804 (= res!590040 (and (= (select (arr!24058 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868805 () Bool)

(declare-fun res!590041 () Bool)

(assert (=> b!868805 (=> (not res!590041) (not e!484002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868805 (= res!590041 (validMask!0 mask!1196))))

(assert (= (and start!74044 res!590044) b!868805))

(assert (= (and b!868805 res!590041) b!868798))

(assert (= (and b!868798 res!590036) b!868801))

(assert (= (and b!868801 res!590037) b!868795))

(assert (= (and b!868795 res!590042) b!868800))

(assert (= (and b!868800 res!590039) b!868796))

(assert (= (and b!868796 res!590043) b!868804))

(assert (= (and b!868804 res!590040) b!868799))

(assert (= (and b!868799 res!590038) b!868803))

(assert (= (and b!868802 condMapEmpty!26990) mapIsEmpty!26990))

(assert (= (and b!868802 (not condMapEmpty!26990)) mapNonEmpty!26990))

(get-info :version)

(assert (= (and mapNonEmpty!26990 ((_ is ValueCellFull!8024) mapValue!26990)) b!868794))

(assert (= (and b!868802 ((_ is ValueCellFull!8024) mapDefault!26990)) b!868797))

(assert (= start!74044 b!868802))

(declare-fun m!810977 () Bool)

(assert (=> b!868799 m!810977))

(declare-fun m!810979 () Bool)

(assert (=> b!868799 m!810979))

(declare-fun m!810981 () Bool)

(assert (=> b!868799 m!810981))

(declare-fun m!810983 () Bool)

(assert (=> mapNonEmpty!26990 m!810983))

(declare-fun m!810985 () Bool)

(assert (=> b!868803 m!810985))

(declare-fun m!810987 () Bool)

(assert (=> b!868803 m!810987))

(assert (=> b!868803 m!810987))

(declare-fun m!810989 () Bool)

(assert (=> b!868803 m!810989))

(declare-fun m!810991 () Bool)

(assert (=> b!868803 m!810991))

(declare-fun m!810993 () Bool)

(assert (=> b!868801 m!810993))

(declare-fun m!810995 () Bool)

(assert (=> b!868804 m!810995))

(declare-fun m!810997 () Bool)

(assert (=> start!74044 m!810997))

(declare-fun m!810999 () Bool)

(assert (=> start!74044 m!810999))

(declare-fun m!811001 () Bool)

(assert (=> b!868796 m!811001))

(declare-fun m!811003 () Bool)

(assert (=> b!868805 m!811003))

(declare-fun m!811005 () Bool)

(assert (=> b!868795 m!811005))

(check-sat tp_is_empty!16927 (not b!868795) (not b!868803) (not start!74044) b_and!24553 (not b!868799) (not b_next!14791) (not b!868805) (not b!868801) (not mapNonEmpty!26990) (not b!868796))
(check-sat b_and!24553 (not b_next!14791))
