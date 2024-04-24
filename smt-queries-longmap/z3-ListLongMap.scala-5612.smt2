; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73624 () Bool)

(assert start!73624)

(declare-fun b_free!14371 () Bool)

(declare-fun b_next!14371 () Bool)

(assert (=> start!73624 (= b_free!14371 (not b_next!14371))))

(declare-fun tp!50618 () Bool)

(declare-fun b_and!23737 () Bool)

(assert (=> start!73624 (= tp!50618 b_and!23737)))

(declare-fun b!858707 () Bool)

(declare-fun res!583070 () Bool)

(declare-fun e!478668 () Bool)

(assert (=> b!858707 (=> (not res!583070) (not e!478668))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858707 (= res!583070 (validMask!0 mask!1196))))

(declare-fun b!858708 () Bool)

(declare-fun e!478665 () Bool)

(declare-fun e!478669 () Bool)

(declare-fun mapRes!26360 () Bool)

(assert (=> b!858708 (= e!478665 (and e!478669 mapRes!26360))))

(declare-fun condMapEmpty!26360 () Bool)

(declare-datatypes ((V!27057 0))(
  ( (V!27058 (val!8301 Int)) )
))
(declare-datatypes ((ValueCell!7814 0))(
  ( (ValueCellFull!7814 (v!10726 V!27057)) (EmptyCell!7814) )
))
(declare-datatypes ((array!49245 0))(
  ( (array!49246 (arr!23649 (Array (_ BitVec 32) ValueCell!7814)) (size!24090 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49245)

(declare-fun mapDefault!26360 () ValueCell!7814)

(assert (=> b!858708 (= condMapEmpty!26360 (= (arr!23649 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7814)) mapDefault!26360)))))

(declare-fun b!858709 () Bool)

(declare-fun res!583065 () Bool)

(assert (=> b!858709 (=> (not res!583065) (not e!478668))))

(declare-datatypes ((array!49247 0))(
  ( (array!49248 (arr!23650 (Array (_ BitVec 32) (_ BitVec 64))) (size!24091 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49247)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49247 (_ BitVec 32)) Bool)

(assert (=> b!858709 (= res!583065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858710 () Bool)

(declare-fun e!478664 () Bool)

(declare-fun tp_is_empty!16507 () Bool)

(assert (=> b!858710 (= e!478664 tp_is_empty!16507)))

(declare-fun mapIsEmpty!26360 () Bool)

(assert (=> mapIsEmpty!26360 mapRes!26360))

(declare-fun b!858712 () Bool)

(declare-fun res!583068 () Bool)

(assert (=> b!858712 (=> (not res!583068) (not e!478668))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858712 (= res!583068 (validKeyInArray!0 k0!854))))

(declare-fun b!858713 () Bool)

(assert (=> b!858713 (= e!478669 tp_is_empty!16507)))

(declare-fun b!858714 () Bool)

(declare-fun e!478666 () Bool)

(assert (=> b!858714 (= e!478668 e!478666)))

(declare-fun res!583063 () Bool)

(assert (=> b!858714 (=> (not res!583063) (not e!478666))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858714 (= res!583063 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!10874 0))(
  ( (tuple2!10875 (_1!5448 (_ BitVec 64)) (_2!5448 V!27057)) )
))
(declare-datatypes ((List!16717 0))(
  ( (Nil!16714) (Cons!16713 (h!17850 tuple2!10874) (t!23350 List!16717)) )
))
(declare-datatypes ((ListLongMap!9645 0))(
  ( (ListLongMap!9646 (toList!4838 List!16717)) )
))
(declare-fun lt!386773 () ListLongMap!9645)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!386772 () array!49245)

(declare-fun minValue!654 () V!27057)

(declare-fun zeroValue!654 () V!27057)

(declare-fun getCurrentListMapNoExtraKeys!2894 (array!49247 array!49245 (_ BitVec 32) (_ BitVec 32) V!27057 V!27057 (_ BitVec 32) Int) ListLongMap!9645)

(assert (=> b!858714 (= lt!386773 (getCurrentListMapNoExtraKeys!2894 _keys!868 lt!386772 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27057)

(assert (=> b!858714 (= lt!386772 (array!49246 (store (arr!23649 _values!688) i!612 (ValueCellFull!7814 v!557)) (size!24090 _values!688)))))

(declare-fun lt!386771 () ListLongMap!9645)

(assert (=> b!858714 (= lt!386771 (getCurrentListMapNoExtraKeys!2894 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!583067 () Bool)

(assert (=> start!73624 (=> (not res!583067) (not e!478668))))

(assert (=> start!73624 (= res!583067 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24091 _keys!868))))))

(assert (=> start!73624 e!478668))

(assert (=> start!73624 tp_is_empty!16507))

(assert (=> start!73624 true))

(assert (=> start!73624 tp!50618))

(declare-fun array_inv!18778 (array!49247) Bool)

(assert (=> start!73624 (array_inv!18778 _keys!868)))

(declare-fun array_inv!18779 (array!49245) Bool)

(assert (=> start!73624 (and (array_inv!18779 _values!688) e!478665)))

(declare-fun b!858711 () Bool)

(declare-fun res!583064 () Bool)

(assert (=> b!858711 (=> (not res!583064) (not e!478668))))

(assert (=> b!858711 (= res!583064 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24091 _keys!868))))))

(declare-fun b!858715 () Bool)

(declare-fun res!583066 () Bool)

(assert (=> b!858715 (=> (not res!583066) (not e!478668))))

(assert (=> b!858715 (= res!583066 (and (= (select (arr!23650 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858716 () Bool)

(declare-fun e!478667 () Bool)

(assert (=> b!858716 (= e!478666 (not e!478667))))

(declare-fun res!583069 () Bool)

(assert (=> b!858716 (=> res!583069 e!478667)))

(assert (=> b!858716 (= res!583069 (not (validKeyInArray!0 (select (arr!23650 _keys!868) from!1053))))))

(declare-fun +!2246 (ListLongMap!9645 tuple2!10874) ListLongMap!9645)

(assert (=> b!858716 (= (getCurrentListMapNoExtraKeys!2894 _keys!868 lt!386772 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2246 (getCurrentListMapNoExtraKeys!2894 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10875 k0!854 v!557)))))

(declare-datatypes ((Unit!29248 0))(
  ( (Unit!29249) )
))
(declare-fun lt!386774 () Unit!29248)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!444 (array!49247 array!49245 (_ BitVec 32) (_ BitVec 32) V!27057 V!27057 (_ BitVec 32) (_ BitVec 64) V!27057 (_ BitVec 32) Int) Unit!29248)

(assert (=> b!858716 (= lt!386774 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!444 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858717 () Bool)

(assert (=> b!858717 (= e!478667 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24091 _keys!868))))))

(declare-fun b!858718 () Bool)

(declare-fun res!583071 () Bool)

(assert (=> b!858718 (=> (not res!583071) (not e!478668))))

(declare-datatypes ((List!16718 0))(
  ( (Nil!16715) (Cons!16714 (h!17851 (_ BitVec 64)) (t!23351 List!16718)) )
))
(declare-fun arrayNoDuplicates!0 (array!49247 (_ BitVec 32) List!16718) Bool)

(assert (=> b!858718 (= res!583071 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16715))))

(declare-fun b!858719 () Bool)

(declare-fun res!583072 () Bool)

(assert (=> b!858719 (=> (not res!583072) (not e!478668))))

(assert (=> b!858719 (= res!583072 (and (= (size!24090 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24091 _keys!868) (size!24090 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26360 () Bool)

(declare-fun tp!50617 () Bool)

(assert (=> mapNonEmpty!26360 (= mapRes!26360 (and tp!50617 e!478664))))

(declare-fun mapKey!26360 () (_ BitVec 32))

(declare-fun mapRest!26360 () (Array (_ BitVec 32) ValueCell!7814))

(declare-fun mapValue!26360 () ValueCell!7814)

(assert (=> mapNonEmpty!26360 (= (arr!23649 _values!688) (store mapRest!26360 mapKey!26360 mapValue!26360))))

(assert (= (and start!73624 res!583067) b!858707))

(assert (= (and b!858707 res!583070) b!858719))

(assert (= (and b!858719 res!583072) b!858709))

(assert (= (and b!858709 res!583065) b!858718))

(assert (= (and b!858718 res!583071) b!858711))

(assert (= (and b!858711 res!583064) b!858712))

(assert (= (and b!858712 res!583068) b!858715))

(assert (= (and b!858715 res!583066) b!858714))

(assert (= (and b!858714 res!583063) b!858716))

(assert (= (and b!858716 (not res!583069)) b!858717))

(assert (= (and b!858708 condMapEmpty!26360) mapIsEmpty!26360))

(assert (= (and b!858708 (not condMapEmpty!26360)) mapNonEmpty!26360))

(get-info :version)

(assert (= (and mapNonEmpty!26360 ((_ is ValueCellFull!7814) mapValue!26360)) b!858710))

(assert (= (and b!858708 ((_ is ValueCellFull!7814) mapDefault!26360)) b!858713))

(assert (= start!73624 b!858708))

(declare-fun m!799811 () Bool)

(assert (=> b!858715 m!799811))

(declare-fun m!799813 () Bool)

(assert (=> b!858716 m!799813))

(declare-fun m!799815 () Bool)

(assert (=> b!858716 m!799815))

(declare-fun m!799817 () Bool)

(assert (=> b!858716 m!799817))

(assert (=> b!858716 m!799813))

(declare-fun m!799819 () Bool)

(assert (=> b!858716 m!799819))

(declare-fun m!799821 () Bool)

(assert (=> b!858716 m!799821))

(assert (=> b!858716 m!799819))

(declare-fun m!799823 () Bool)

(assert (=> b!858716 m!799823))

(declare-fun m!799825 () Bool)

(assert (=> b!858707 m!799825))

(declare-fun m!799827 () Bool)

(assert (=> b!858718 m!799827))

(declare-fun m!799829 () Bool)

(assert (=> b!858709 m!799829))

(declare-fun m!799831 () Bool)

(assert (=> start!73624 m!799831))

(declare-fun m!799833 () Bool)

(assert (=> start!73624 m!799833))

(declare-fun m!799835 () Bool)

(assert (=> b!858714 m!799835))

(declare-fun m!799837 () Bool)

(assert (=> b!858714 m!799837))

(declare-fun m!799839 () Bool)

(assert (=> b!858714 m!799839))

(declare-fun m!799841 () Bool)

(assert (=> b!858712 m!799841))

(declare-fun m!799843 () Bool)

(assert (=> mapNonEmpty!26360 m!799843))

(check-sat (not b!858712) tp_is_empty!16507 (not b!858716) (not b!858707) (not mapNonEmpty!26360) (not start!73624) (not b!858718) (not b!858709) b_and!23737 (not b!858714) (not b_next!14371))
(check-sat b_and!23737 (not b_next!14371))
