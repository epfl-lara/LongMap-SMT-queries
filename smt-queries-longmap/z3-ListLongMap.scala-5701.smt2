; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74158 () Bool)

(assert start!74158)

(declare-fun b_free!14905 () Bool)

(declare-fun b_next!14905 () Bool)

(assert (=> start!74158 (= b_free!14905 (not b_next!14905))))

(declare-fun tp!52220 () Bool)

(declare-fun b_and!24667 () Bool)

(assert (=> start!74158 (= tp!52220 b_and!24667)))

(declare-fun b!870846 () Bool)

(declare-fun res!591580 () Bool)

(declare-fun e!485024 () Bool)

(assert (=> b!870846 (=> (not res!591580) (not e!485024))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50285 0))(
  ( (array!50286 (arr!24169 (Array (_ BitVec 32) (_ BitVec 64))) (size!24610 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50285)

(declare-datatypes ((V!27769 0))(
  ( (V!27770 (val!8568 Int)) )
))
(declare-datatypes ((ValueCell!8081 0))(
  ( (ValueCellFull!8081 (v!10993 V!27769)) (EmptyCell!8081) )
))
(declare-datatypes ((array!50287 0))(
  ( (array!50288 (arr!24170 (Array (_ BitVec 32) ValueCell!8081)) (size!24611 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50287)

(assert (=> b!870846 (= res!591580 (and (= (size!24611 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24610 _keys!868) (size!24611 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870847 () Bool)

(declare-fun e!485026 () Bool)

(assert (=> b!870847 (= e!485026 (not true))))

(declare-fun lt!395331 () array!50287)

(declare-fun v!557 () V!27769)

(declare-fun defaultEntry!696 () Int)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27769)

(declare-fun zeroValue!654 () V!27769)

(declare-datatypes ((tuple2!11308 0))(
  ( (tuple2!11309 (_1!5665 (_ BitVec 64)) (_2!5665 V!27769)) )
))
(declare-datatypes ((List!17128 0))(
  ( (Nil!17125) (Cons!17124 (h!18261 tuple2!11308) (t!24157 List!17128)) )
))
(declare-datatypes ((ListLongMap!10079 0))(
  ( (ListLongMap!10080 (toList!5055 List!17128)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3099 (array!50285 array!50287 (_ BitVec 32) (_ BitVec 32) V!27769 V!27769 (_ BitVec 32) Int) ListLongMap!10079)

(declare-fun +!2448 (ListLongMap!10079 tuple2!11308) ListLongMap!10079)

(assert (=> b!870847 (= (getCurrentListMapNoExtraKeys!3099 _keys!868 lt!395331 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2448 (getCurrentListMapNoExtraKeys!3099 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11309 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29846 0))(
  ( (Unit!29847) )
))
(declare-fun lt!395333 () Unit!29846)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!619 (array!50285 array!50287 (_ BitVec 32) (_ BitVec 32) V!27769 V!27769 (_ BitVec 32) (_ BitVec 64) V!27769 (_ BitVec 32) Int) Unit!29846)

(assert (=> b!870847 (= lt!395333 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!619 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870848 () Bool)

(declare-fun e!485029 () Bool)

(declare-fun tp_is_empty!17041 () Bool)

(assert (=> b!870848 (= e!485029 tp_is_empty!17041)))

(declare-fun b!870849 () Bool)

(declare-fun res!591575 () Bool)

(assert (=> b!870849 (=> (not res!591575) (not e!485024))))

(declare-datatypes ((List!17129 0))(
  ( (Nil!17126) (Cons!17125 (h!18262 (_ BitVec 64)) (t!24158 List!17129)) )
))
(declare-fun arrayNoDuplicates!0 (array!50285 (_ BitVec 32) List!17129) Bool)

(assert (=> b!870849 (= res!591575 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17126))))

(declare-fun b!870850 () Bool)

(declare-fun e!485027 () Bool)

(assert (=> b!870850 (= e!485027 tp_is_empty!17041)))

(declare-fun b!870851 () Bool)

(declare-fun res!591583 () Bool)

(assert (=> b!870851 (=> (not res!591583) (not e!485024))))

(assert (=> b!870851 (= res!591583 (and (= (select (arr!24169 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870852 () Bool)

(declare-fun res!591576 () Bool)

(assert (=> b!870852 (=> (not res!591576) (not e!485024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870852 (= res!591576 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27161 () Bool)

(declare-fun mapRes!27161 () Bool)

(declare-fun tp!52219 () Bool)

(assert (=> mapNonEmpty!27161 (= mapRes!27161 (and tp!52219 e!485029))))

(declare-fun mapKey!27161 () (_ BitVec 32))

(declare-fun mapValue!27161 () ValueCell!8081)

(declare-fun mapRest!27161 () (Array (_ BitVec 32) ValueCell!8081))

(assert (=> mapNonEmpty!27161 (= (arr!24170 _values!688) (store mapRest!27161 mapKey!27161 mapValue!27161))))

(declare-fun res!591579 () Bool)

(assert (=> start!74158 (=> (not res!591579) (not e!485024))))

(assert (=> start!74158 (= res!591579 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24610 _keys!868))))))

(assert (=> start!74158 e!485024))

(assert (=> start!74158 tp_is_empty!17041))

(assert (=> start!74158 true))

(assert (=> start!74158 tp!52220))

(declare-fun array_inv!19144 (array!50285) Bool)

(assert (=> start!74158 (array_inv!19144 _keys!868)))

(declare-fun e!485028 () Bool)

(declare-fun array_inv!19145 (array!50287) Bool)

(assert (=> start!74158 (and (array_inv!19145 _values!688) e!485028)))

(declare-fun mapIsEmpty!27161 () Bool)

(assert (=> mapIsEmpty!27161 mapRes!27161))

(declare-fun b!870853 () Bool)

(declare-fun res!591581 () Bool)

(assert (=> b!870853 (=> (not res!591581) (not e!485024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50285 (_ BitVec 32)) Bool)

(assert (=> b!870853 (= res!591581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870854 () Bool)

(assert (=> b!870854 (= e!485028 (and e!485027 mapRes!27161))))

(declare-fun condMapEmpty!27161 () Bool)

(declare-fun mapDefault!27161 () ValueCell!8081)

(assert (=> b!870854 (= condMapEmpty!27161 (= (arr!24170 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8081)) mapDefault!27161)))))

(declare-fun b!870855 () Bool)

(declare-fun res!591577 () Bool)

(assert (=> b!870855 (=> (not res!591577) (not e!485024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870855 (= res!591577 (validKeyInArray!0 k0!854))))

(declare-fun b!870856 () Bool)

(assert (=> b!870856 (= e!485024 e!485026)))

(declare-fun res!591578 () Bool)

(assert (=> b!870856 (=> (not res!591578) (not e!485026))))

(assert (=> b!870856 (= res!591578 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395332 () ListLongMap!10079)

(assert (=> b!870856 (= lt!395332 (getCurrentListMapNoExtraKeys!3099 _keys!868 lt!395331 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870856 (= lt!395331 (array!50288 (store (arr!24170 _values!688) i!612 (ValueCellFull!8081 v!557)) (size!24611 _values!688)))))

(declare-fun lt!395330 () ListLongMap!10079)

(assert (=> b!870856 (= lt!395330 (getCurrentListMapNoExtraKeys!3099 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870857 () Bool)

(declare-fun res!591582 () Bool)

(assert (=> b!870857 (=> (not res!591582) (not e!485024))))

(assert (=> b!870857 (= res!591582 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24610 _keys!868))))))

(assert (= (and start!74158 res!591579) b!870852))

(assert (= (and b!870852 res!591576) b!870846))

(assert (= (and b!870846 res!591580) b!870853))

(assert (= (and b!870853 res!591581) b!870849))

(assert (= (and b!870849 res!591575) b!870857))

(assert (= (and b!870857 res!591582) b!870855))

(assert (= (and b!870855 res!591577) b!870851))

(assert (= (and b!870851 res!591583) b!870856))

(assert (= (and b!870856 res!591578) b!870847))

(assert (= (and b!870854 condMapEmpty!27161) mapIsEmpty!27161))

(assert (= (and b!870854 (not condMapEmpty!27161)) mapNonEmpty!27161))

(get-info :version)

(assert (= (and mapNonEmpty!27161 ((_ is ValueCellFull!8081) mapValue!27161)) b!870848))

(assert (= (and b!870854 ((_ is ValueCellFull!8081) mapDefault!27161)) b!870850))

(assert (= start!74158 b!870854))

(declare-fun m!812687 () Bool)

(assert (=> b!870855 m!812687))

(declare-fun m!812689 () Bool)

(assert (=> b!870847 m!812689))

(declare-fun m!812691 () Bool)

(assert (=> b!870847 m!812691))

(assert (=> b!870847 m!812691))

(declare-fun m!812693 () Bool)

(assert (=> b!870847 m!812693))

(declare-fun m!812695 () Bool)

(assert (=> b!870847 m!812695))

(declare-fun m!812697 () Bool)

(assert (=> b!870849 m!812697))

(declare-fun m!812699 () Bool)

(assert (=> mapNonEmpty!27161 m!812699))

(declare-fun m!812701 () Bool)

(assert (=> start!74158 m!812701))

(declare-fun m!812703 () Bool)

(assert (=> start!74158 m!812703))

(declare-fun m!812705 () Bool)

(assert (=> b!870853 m!812705))

(declare-fun m!812707 () Bool)

(assert (=> b!870856 m!812707))

(declare-fun m!812709 () Bool)

(assert (=> b!870856 m!812709))

(declare-fun m!812711 () Bool)

(assert (=> b!870856 m!812711))

(declare-fun m!812713 () Bool)

(assert (=> b!870852 m!812713))

(declare-fun m!812715 () Bool)

(assert (=> b!870851 m!812715))

(check-sat (not b!870855) tp_is_empty!17041 b_and!24667 (not b!870847) (not start!74158) (not b!870853) (not b!870852) (not b_next!14905) (not b!870856) (not b!870849) (not mapNonEmpty!27161))
(check-sat b_and!24667 (not b_next!14905))
