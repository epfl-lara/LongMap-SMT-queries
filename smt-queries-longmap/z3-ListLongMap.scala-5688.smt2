; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73914 () Bool)

(assert start!73914)

(declare-fun b_free!14829 () Bool)

(declare-fun b_next!14829 () Bool)

(assert (=> start!73914 (= b_free!14829 (not b_next!14829))))

(declare-fun tp!51990 () Bool)

(declare-fun b_and!24581 () Bool)

(assert (=> start!73914 (= tp!51990 b_and!24581)))

(declare-fun b!868575 () Bool)

(declare-fun res!590211 () Bool)

(declare-fun e!483762 () Bool)

(assert (=> b!868575 (=> (not res!590211) (not e!483762))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868575 (= res!590211 (validMask!0 mask!1196))))

(declare-fun b!868576 () Bool)

(declare-fun e!483758 () Bool)

(declare-fun tp_is_empty!16965 () Bool)

(assert (=> b!868576 (= e!483758 tp_is_empty!16965)))

(declare-fun mapIsEmpty!27047 () Bool)

(declare-fun mapRes!27047 () Bool)

(assert (=> mapIsEmpty!27047 mapRes!27047))

(declare-fun b!868577 () Bool)

(declare-fun res!590213 () Bool)

(assert (=> b!868577 (=> (not res!590213) (not e!483762))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868577 (= res!590213 (validKeyInArray!0 k0!854))))

(declare-fun b!868578 () Bool)

(declare-fun e!483763 () Bool)

(assert (=> b!868578 (= e!483763 (and e!483758 mapRes!27047))))

(declare-fun condMapEmpty!27047 () Bool)

(declare-datatypes ((V!27667 0))(
  ( (V!27668 (val!8530 Int)) )
))
(declare-datatypes ((ValueCell!8043 0))(
  ( (ValueCellFull!8043 (v!10955 V!27667)) (EmptyCell!8043) )
))
(declare-datatypes ((array!50082 0))(
  ( (array!50083 (arr!24072 (Array (_ BitVec 32) ValueCell!8043)) (size!24512 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50082)

(declare-fun mapDefault!27047 () ValueCell!8043)

(assert (=> b!868578 (= condMapEmpty!27047 (= (arr!24072 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8043)) mapDefault!27047)))))

(declare-fun b!868579 () Bool)

(declare-fun e!483761 () Bool)

(assert (=> b!868579 (= e!483761 tp_is_empty!16965)))

(declare-fun b!868580 () Bool)

(declare-fun e!483760 () Bool)

(assert (=> b!868580 (= e!483762 e!483760)))

(declare-fun res!590205 () Bool)

(assert (=> b!868580 (=> (not res!590205) (not e!483760))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868580 (= res!590205 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394516 () array!50082)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11324 0))(
  ( (tuple2!11325 (_1!5673 (_ BitVec 64)) (_2!5673 V!27667)) )
))
(declare-datatypes ((List!17119 0))(
  ( (Nil!17116) (Cons!17115 (h!18246 tuple2!11324) (t!24156 List!17119)) )
))
(declare-datatypes ((ListLongMap!10093 0))(
  ( (ListLongMap!10094 (toList!5062 List!17119)) )
))
(declare-fun lt!394513 () ListLongMap!10093)

(declare-fun minValue!654 () V!27667)

(declare-fun zeroValue!654 () V!27667)

(declare-datatypes ((array!50084 0))(
  ( (array!50085 (arr!24073 (Array (_ BitVec 32) (_ BitVec 64))) (size!24513 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50084)

(declare-fun getCurrentListMapNoExtraKeys!3031 (array!50084 array!50082 (_ BitVec 32) (_ BitVec 32) V!27667 V!27667 (_ BitVec 32) Int) ListLongMap!10093)

(assert (=> b!868580 (= lt!394513 (getCurrentListMapNoExtraKeys!3031 _keys!868 lt!394516 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27667)

(assert (=> b!868580 (= lt!394516 (array!50083 (store (arr!24072 _values!688) i!612 (ValueCellFull!8043 v!557)) (size!24512 _values!688)))))

(declare-fun lt!394514 () ListLongMap!10093)

(assert (=> b!868580 (= lt!394514 (getCurrentListMapNoExtraKeys!3031 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868581 () Bool)

(declare-fun res!590207 () Bool)

(assert (=> b!868581 (=> (not res!590207) (not e!483762))))

(assert (=> b!868581 (= res!590207 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24513 _keys!868))))))

(declare-fun b!868582 () Bool)

(declare-fun res!590212 () Bool)

(assert (=> b!868582 (=> (not res!590212) (not e!483762))))

(assert (=> b!868582 (= res!590212 (and (= (select (arr!24073 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868583 () Bool)

(declare-fun res!590210 () Bool)

(assert (=> b!868583 (=> (not res!590210) (not e!483762))))

(assert (=> b!868583 (= res!590210 (and (= (size!24512 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24513 _keys!868) (size!24512 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868584 () Bool)

(declare-fun res!590208 () Bool)

(assert (=> b!868584 (=> (not res!590208) (not e!483762))))

(declare-datatypes ((List!17120 0))(
  ( (Nil!17117) (Cons!17116 (h!18247 (_ BitVec 64)) (t!24157 List!17120)) )
))
(declare-fun arrayNoDuplicates!0 (array!50084 (_ BitVec 32) List!17120) Bool)

(assert (=> b!868584 (= res!590208 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17117))))

(declare-fun mapNonEmpty!27047 () Bool)

(declare-fun tp!51991 () Bool)

(assert (=> mapNonEmpty!27047 (= mapRes!27047 (and tp!51991 e!483761))))

(declare-fun mapRest!27047 () (Array (_ BitVec 32) ValueCell!8043))

(declare-fun mapValue!27047 () ValueCell!8043)

(declare-fun mapKey!27047 () (_ BitVec 32))

(assert (=> mapNonEmpty!27047 (= (arr!24072 _values!688) (store mapRest!27047 mapKey!27047 mapValue!27047))))

(declare-fun res!590206 () Bool)

(assert (=> start!73914 (=> (not res!590206) (not e!483762))))

(assert (=> start!73914 (= res!590206 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24513 _keys!868))))))

(assert (=> start!73914 e!483762))

(assert (=> start!73914 tp_is_empty!16965))

(assert (=> start!73914 true))

(assert (=> start!73914 tp!51990))

(declare-fun array_inv!19016 (array!50084) Bool)

(assert (=> start!73914 (array_inv!19016 _keys!868)))

(declare-fun array_inv!19017 (array!50082) Bool)

(assert (=> start!73914 (and (array_inv!19017 _values!688) e!483763)))

(declare-fun b!868585 () Bool)

(assert (=> b!868585 (= e!483760 (not true))))

(declare-fun +!2404 (ListLongMap!10093 tuple2!11324) ListLongMap!10093)

(assert (=> b!868585 (= (getCurrentListMapNoExtraKeys!3031 _keys!868 lt!394516 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2404 (getCurrentListMapNoExtraKeys!3031 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11325 k0!854 v!557)))))

(declare-datatypes ((Unit!29806 0))(
  ( (Unit!29807) )
))
(declare-fun lt!394515 () Unit!29806)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!598 (array!50084 array!50082 (_ BitVec 32) (_ BitVec 32) V!27667 V!27667 (_ BitVec 32) (_ BitVec 64) V!27667 (_ BitVec 32) Int) Unit!29806)

(assert (=> b!868585 (= lt!394515 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!598 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868586 () Bool)

(declare-fun res!590209 () Bool)

(assert (=> b!868586 (=> (not res!590209) (not e!483762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50084 (_ BitVec 32)) Bool)

(assert (=> b!868586 (= res!590209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73914 res!590206) b!868575))

(assert (= (and b!868575 res!590211) b!868583))

(assert (= (and b!868583 res!590210) b!868586))

(assert (= (and b!868586 res!590209) b!868584))

(assert (= (and b!868584 res!590208) b!868581))

(assert (= (and b!868581 res!590207) b!868577))

(assert (= (and b!868577 res!590213) b!868582))

(assert (= (and b!868582 res!590212) b!868580))

(assert (= (and b!868580 res!590205) b!868585))

(assert (= (and b!868578 condMapEmpty!27047) mapIsEmpty!27047))

(assert (= (and b!868578 (not condMapEmpty!27047)) mapNonEmpty!27047))

(get-info :version)

(assert (= (and mapNonEmpty!27047 ((_ is ValueCellFull!8043) mapValue!27047)) b!868579))

(assert (= (and b!868578 ((_ is ValueCellFull!8043) mapDefault!27047)) b!868576))

(assert (= start!73914 b!868578))

(declare-fun m!810257 () Bool)

(assert (=> b!868585 m!810257))

(declare-fun m!810259 () Bool)

(assert (=> b!868585 m!810259))

(assert (=> b!868585 m!810259))

(declare-fun m!810261 () Bool)

(assert (=> b!868585 m!810261))

(declare-fun m!810263 () Bool)

(assert (=> b!868585 m!810263))

(declare-fun m!810265 () Bool)

(assert (=> b!868580 m!810265))

(declare-fun m!810267 () Bool)

(assert (=> b!868580 m!810267))

(declare-fun m!810269 () Bool)

(assert (=> b!868580 m!810269))

(declare-fun m!810271 () Bool)

(assert (=> b!868577 m!810271))

(declare-fun m!810273 () Bool)

(assert (=> b!868582 m!810273))

(declare-fun m!810275 () Bool)

(assert (=> mapNonEmpty!27047 m!810275))

(declare-fun m!810277 () Bool)

(assert (=> b!868584 m!810277))

(declare-fun m!810279 () Bool)

(assert (=> b!868586 m!810279))

(declare-fun m!810281 () Bool)

(assert (=> b!868575 m!810281))

(declare-fun m!810283 () Bool)

(assert (=> start!73914 m!810283))

(declare-fun m!810285 () Bool)

(assert (=> start!73914 m!810285))

(check-sat (not b!868586) tp_is_empty!16965 (not b!868584) (not b!868580) (not b!868585) (not mapNonEmpty!27047) b_and!24581 (not b!868577) (not b!868575) (not start!73914) (not b_next!14829))
(check-sat b_and!24581 (not b_next!14829))
