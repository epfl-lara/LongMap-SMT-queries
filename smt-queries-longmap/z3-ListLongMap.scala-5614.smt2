; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73450 () Bool)

(assert start!73450)

(declare-fun b_free!14383 () Bool)

(declare-fun b_next!14383 () Bool)

(assert (=> start!73450 (= b_free!14383 (not b_next!14383))))

(declare-fun tp!50654 () Bool)

(declare-fun b_and!23719 () Bool)

(assert (=> start!73450 (= tp!50654 b_and!23719)))

(declare-fun b!857805 () Bool)

(declare-fun e!478063 () Bool)

(declare-fun tp_is_empty!16519 () Bool)

(assert (=> b!857805 (= e!478063 tp_is_empty!16519)))

(declare-fun b!857806 () Bool)

(declare-fun res!582790 () Bool)

(declare-fun e!478060 () Bool)

(assert (=> b!857806 (=> (not res!582790) (not e!478060))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857806 (= res!582790 (validKeyInArray!0 k0!854))))

(declare-fun b!857807 () Bool)

(declare-fun res!582798 () Bool)

(assert (=> b!857807 (=> (not res!582798) (not e!478060))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49207 0))(
  ( (array!49208 (arr!23635 (Array (_ BitVec 32) (_ BitVec 64))) (size!24077 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49207)

(assert (=> b!857807 (= res!582798 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24077 _keys!868))))))

(declare-fun b!857808 () Bool)

(declare-fun res!582791 () Bool)

(assert (=> b!857808 (=> (not res!582791) (not e!478060))))

(declare-datatypes ((List!16771 0))(
  ( (Nil!16768) (Cons!16767 (h!17898 (_ BitVec 64)) (t!23411 List!16771)) )
))
(declare-fun arrayNoDuplicates!0 (array!49207 (_ BitVec 32) List!16771) Bool)

(assert (=> b!857808 (= res!582791 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16768))))

(declare-fun b!857809 () Bool)

(declare-fun res!582797 () Bool)

(assert (=> b!857809 (=> (not res!582797) (not e!478060))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49207 (_ BitVec 32)) Bool)

(assert (=> b!857809 (= res!582797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857810 () Bool)

(declare-fun e!478061 () Bool)

(assert (=> b!857810 (= e!478060 e!478061)))

(declare-fun res!582795 () Bool)

(assert (=> b!857810 (=> (not res!582795) (not e!478061))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!857810 (= res!582795 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27073 0))(
  ( (V!27074 (val!8307 Int)) )
))
(declare-datatypes ((tuple2!10968 0))(
  ( (tuple2!10969 (_1!5495 (_ BitVec 64)) (_2!5495 V!27073)) )
))
(declare-datatypes ((List!16772 0))(
  ( (Nil!16769) (Cons!16768 (h!17899 tuple2!10968) (t!23412 List!16772)) )
))
(declare-datatypes ((ListLongMap!9727 0))(
  ( (ListLongMap!9728 (toList!4879 List!16772)) )
))
(declare-fun lt!386283 () ListLongMap!9727)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7820 0))(
  ( (ValueCellFull!7820 (v!10726 V!27073)) (EmptyCell!7820) )
))
(declare-datatypes ((array!49209 0))(
  ( (array!49210 (arr!23636 (Array (_ BitVec 32) ValueCell!7820)) (size!24078 (_ BitVec 32))) )
))
(declare-fun lt!386285 () array!49209)

(declare-fun minValue!654 () V!27073)

(declare-fun zeroValue!654 () V!27073)

(declare-fun getCurrentListMapNoExtraKeys!2886 (array!49207 array!49209 (_ BitVec 32) (_ BitVec 32) V!27073 V!27073 (_ BitVec 32) Int) ListLongMap!9727)

(assert (=> b!857810 (= lt!386283 (getCurrentListMapNoExtraKeys!2886 _keys!868 lt!386285 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27073)

(declare-fun _values!688 () array!49209)

(assert (=> b!857810 (= lt!386285 (array!49210 (store (arr!23636 _values!688) i!612 (ValueCellFull!7820 v!557)) (size!24078 _values!688)))))

(declare-fun lt!386280 () ListLongMap!9727)

(assert (=> b!857810 (= lt!386280 (getCurrentListMapNoExtraKeys!2886 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857811 () Bool)

(declare-fun e!478065 () Bool)

(declare-fun mapRes!26378 () Bool)

(assert (=> b!857811 (= e!478065 (and e!478063 mapRes!26378))))

(declare-fun condMapEmpty!26378 () Bool)

(declare-fun mapDefault!26378 () ValueCell!7820)

(assert (=> b!857811 (= condMapEmpty!26378 (= (arr!23636 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7820)) mapDefault!26378)))))

(declare-fun mapIsEmpty!26378 () Bool)

(assert (=> mapIsEmpty!26378 mapRes!26378))

(declare-fun b!857812 () Bool)

(declare-fun res!582792 () Bool)

(assert (=> b!857812 (=> (not res!582792) (not e!478060))))

(assert (=> b!857812 (= res!582792 (and (= (size!24078 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24077 _keys!868) (size!24078 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!582793 () Bool)

(assert (=> start!73450 (=> (not res!582793) (not e!478060))))

(assert (=> start!73450 (= res!582793 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24077 _keys!868))))))

(assert (=> start!73450 e!478060))

(assert (=> start!73450 tp_is_empty!16519))

(assert (=> start!73450 true))

(assert (=> start!73450 tp!50654))

(declare-fun array_inv!18782 (array!49207) Bool)

(assert (=> start!73450 (array_inv!18782 _keys!868)))

(declare-fun array_inv!18783 (array!49209) Bool)

(assert (=> start!73450 (and (array_inv!18783 _values!688) e!478065)))

(declare-fun b!857813 () Bool)

(declare-fun e!478064 () Bool)

(assert (=> b!857813 (= e!478064 tp_is_empty!16519)))

(declare-fun b!857814 () Bool)

(declare-fun e!478062 () Bool)

(assert (=> b!857814 (= e!478062 true)))

(declare-fun lt!386282 () ListLongMap!9727)

(declare-fun +!2254 (ListLongMap!9727 tuple2!10968) ListLongMap!9727)

(declare-fun get!12451 (ValueCell!7820 V!27073) V!27073)

(declare-fun dynLambda!1076 (Int (_ BitVec 64)) V!27073)

(assert (=> b!857814 (= lt!386283 (+!2254 lt!386282 (tuple2!10969 (select (arr!23635 _keys!868) from!1053) (get!12451 (select (arr!23636 _values!688) from!1053) (dynLambda!1076 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!857815 () Bool)

(declare-fun res!582789 () Bool)

(assert (=> b!857815 (=> (not res!582789) (not e!478060))))

(assert (=> b!857815 (= res!582789 (and (= (select (arr!23635 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857816 () Bool)

(declare-fun res!582794 () Bool)

(assert (=> b!857816 (=> (not res!582794) (not e!478060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857816 (= res!582794 (validMask!0 mask!1196))))

(declare-fun b!857817 () Bool)

(assert (=> b!857817 (= e!478061 (not e!478062))))

(declare-fun res!582796 () Bool)

(assert (=> b!857817 (=> res!582796 e!478062)))

(assert (=> b!857817 (= res!582796 (not (validKeyInArray!0 (select (arr!23635 _keys!868) from!1053))))))

(declare-fun lt!386279 () ListLongMap!9727)

(assert (=> b!857817 (= lt!386279 lt!386282)))

(declare-fun lt!386281 () ListLongMap!9727)

(assert (=> b!857817 (= lt!386282 (+!2254 lt!386281 (tuple2!10969 k0!854 v!557)))))

(assert (=> b!857817 (= lt!386279 (getCurrentListMapNoExtraKeys!2886 _keys!868 lt!386285 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!857817 (= lt!386281 (getCurrentListMapNoExtraKeys!2886 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29177 0))(
  ( (Unit!29178) )
))
(declare-fun lt!386284 () Unit!29177)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!451 (array!49207 array!49209 (_ BitVec 32) (_ BitVec 32) V!27073 V!27073 (_ BitVec 32) (_ BitVec 64) V!27073 (_ BitVec 32) Int) Unit!29177)

(assert (=> b!857817 (= lt!386284 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!451 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26378 () Bool)

(declare-fun tp!50653 () Bool)

(assert (=> mapNonEmpty!26378 (= mapRes!26378 (and tp!50653 e!478064))))

(declare-fun mapValue!26378 () ValueCell!7820)

(declare-fun mapRest!26378 () (Array (_ BitVec 32) ValueCell!7820))

(declare-fun mapKey!26378 () (_ BitVec 32))

(assert (=> mapNonEmpty!26378 (= (arr!23636 _values!688) (store mapRest!26378 mapKey!26378 mapValue!26378))))

(assert (= (and start!73450 res!582793) b!857816))

(assert (= (and b!857816 res!582794) b!857812))

(assert (= (and b!857812 res!582792) b!857809))

(assert (= (and b!857809 res!582797) b!857808))

(assert (= (and b!857808 res!582791) b!857807))

(assert (= (and b!857807 res!582798) b!857806))

(assert (= (and b!857806 res!582790) b!857815))

(assert (= (and b!857815 res!582789) b!857810))

(assert (= (and b!857810 res!582795) b!857817))

(assert (= (and b!857817 (not res!582796)) b!857814))

(assert (= (and b!857811 condMapEmpty!26378) mapIsEmpty!26378))

(assert (= (and b!857811 (not condMapEmpty!26378)) mapNonEmpty!26378))

(get-info :version)

(assert (= (and mapNonEmpty!26378 ((_ is ValueCellFull!7820) mapValue!26378)) b!857813))

(assert (= (and b!857811 ((_ is ValueCellFull!7820) mapDefault!26378)) b!857805))

(assert (= start!73450 b!857811))

(declare-fun b_lambda!11717 () Bool)

(assert (=> (not b_lambda!11717) (not b!857814)))

(declare-fun t!23410 () Bool)

(declare-fun tb!4497 () Bool)

(assert (=> (and start!73450 (= defaultEntry!696 defaultEntry!696) t!23410) tb!4497))

(declare-fun result!8613 () Bool)

(assert (=> tb!4497 (= result!8613 tp_is_empty!16519)))

(assert (=> b!857814 t!23410))

(declare-fun b_and!23721 () Bool)

(assert (= b_and!23719 (and (=> t!23410 result!8613) b_and!23721)))

(declare-fun m!797991 () Bool)

(assert (=> start!73450 m!797991))

(declare-fun m!797993 () Bool)

(assert (=> start!73450 m!797993))

(declare-fun m!797995 () Bool)

(assert (=> b!857810 m!797995))

(declare-fun m!797997 () Bool)

(assert (=> b!857810 m!797997))

(declare-fun m!797999 () Bool)

(assert (=> b!857810 m!797999))

(declare-fun m!798001 () Bool)

(assert (=> b!857816 m!798001))

(declare-fun m!798003 () Bool)

(assert (=> b!857817 m!798003))

(declare-fun m!798005 () Bool)

(assert (=> b!857817 m!798005))

(declare-fun m!798007 () Bool)

(assert (=> b!857817 m!798007))

(assert (=> b!857817 m!798005))

(declare-fun m!798009 () Bool)

(assert (=> b!857817 m!798009))

(declare-fun m!798011 () Bool)

(assert (=> b!857817 m!798011))

(declare-fun m!798013 () Bool)

(assert (=> b!857817 m!798013))

(declare-fun m!798015 () Bool)

(assert (=> mapNonEmpty!26378 m!798015))

(declare-fun m!798017 () Bool)

(assert (=> b!857809 m!798017))

(declare-fun m!798019 () Bool)

(assert (=> b!857815 m!798019))

(declare-fun m!798021 () Bool)

(assert (=> b!857806 m!798021))

(declare-fun m!798023 () Bool)

(assert (=> b!857808 m!798023))

(declare-fun m!798025 () Bool)

(assert (=> b!857814 m!798025))

(declare-fun m!798027 () Bool)

(assert (=> b!857814 m!798027))

(declare-fun m!798029 () Bool)

(assert (=> b!857814 m!798029))

(declare-fun m!798031 () Bool)

(assert (=> b!857814 m!798031))

(assert (=> b!857814 m!798027))

(assert (=> b!857814 m!798005))

(assert (=> b!857814 m!798029))

(check-sat (not b!857809) (not b!857808) (not b_next!14383) (not b!857810) (not b_lambda!11717) tp_is_empty!16519 (not b!857814) (not start!73450) (not b!857806) b_and!23721 (not mapNonEmpty!26378) (not b!857816) (not b!857817))
(check-sat b_and!23721 (not b_next!14383))
