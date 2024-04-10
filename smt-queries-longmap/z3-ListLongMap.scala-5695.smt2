; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73956 () Bool)

(assert start!73956)

(declare-fun b_free!14871 () Bool)

(declare-fun b_next!14871 () Bool)

(assert (=> start!73956 (= b_free!14871 (not b_next!14871))))

(declare-fun tp!52116 () Bool)

(declare-fun b_and!24623 () Bool)

(assert (=> start!73956 (= tp!52116 b_and!24623)))

(declare-fun b!869331 () Bool)

(declare-fun e!484139 () Bool)

(declare-fun e!484137 () Bool)

(assert (=> b!869331 (= e!484139 e!484137)))

(declare-fun res!590780 () Bool)

(assert (=> b!869331 (=> (not res!590780) (not e!484137))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!869331 (= res!590780 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27723 0))(
  ( (V!27724 (val!8551 Int)) )
))
(declare-datatypes ((ValueCell!8064 0))(
  ( (ValueCellFull!8064 (v!10976 V!27723)) (EmptyCell!8064) )
))
(declare-datatypes ((array!50162 0))(
  ( (array!50163 (arr!24112 (Array (_ BitVec 32) ValueCell!8064)) (size!24552 (_ BitVec 32))) )
))
(declare-fun lt!394768 () array!50162)

(declare-datatypes ((tuple2!11358 0))(
  ( (tuple2!11359 (_1!5690 (_ BitVec 64)) (_2!5690 V!27723)) )
))
(declare-datatypes ((List!17148 0))(
  ( (Nil!17145) (Cons!17144 (h!18275 tuple2!11358) (t!24185 List!17148)) )
))
(declare-datatypes ((ListLongMap!10127 0))(
  ( (ListLongMap!10128 (toList!5079 List!17148)) )
))
(declare-fun lt!394766 () ListLongMap!10127)

(declare-datatypes ((array!50164 0))(
  ( (array!50165 (arr!24113 (Array (_ BitVec 32) (_ BitVec 64))) (size!24553 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50164)

(declare-fun minValue!654 () V!27723)

(declare-fun zeroValue!654 () V!27723)

(declare-fun getCurrentListMapNoExtraKeys!3048 (array!50164 array!50162 (_ BitVec 32) (_ BitVec 32) V!27723 V!27723 (_ BitVec 32) Int) ListLongMap!10127)

(assert (=> b!869331 (= lt!394766 (getCurrentListMapNoExtraKeys!3048 _keys!868 lt!394768 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27723)

(declare-fun _values!688 () array!50162)

(assert (=> b!869331 (= lt!394768 (array!50163 (store (arr!24112 _values!688) i!612 (ValueCellFull!8064 v!557)) (size!24552 _values!688)))))

(declare-fun lt!394765 () ListLongMap!10127)

(assert (=> b!869331 (= lt!394765 (getCurrentListMapNoExtraKeys!3048 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869332 () Bool)

(assert (=> b!869332 (= e!484137 (not true))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2419 (ListLongMap!10127 tuple2!11358) ListLongMap!10127)

(assert (=> b!869332 (= (getCurrentListMapNoExtraKeys!3048 _keys!868 lt!394768 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2419 (getCurrentListMapNoExtraKeys!3048 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11359 k0!854 v!557)))))

(declare-datatypes ((Unit!29836 0))(
  ( (Unit!29837) )
))
(declare-fun lt!394767 () Unit!29836)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!613 (array!50164 array!50162 (_ BitVec 32) (_ BitVec 32) V!27723 V!27723 (_ BitVec 32) (_ BitVec 64) V!27723 (_ BitVec 32) Int) Unit!29836)

(assert (=> b!869332 (= lt!394767 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!613 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27110 () Bool)

(declare-fun mapRes!27110 () Bool)

(declare-fun tp!52117 () Bool)

(declare-fun e!484140 () Bool)

(assert (=> mapNonEmpty!27110 (= mapRes!27110 (and tp!52117 e!484140))))

(declare-fun mapValue!27110 () ValueCell!8064)

(declare-fun mapKey!27110 () (_ BitVec 32))

(declare-fun mapRest!27110 () (Array (_ BitVec 32) ValueCell!8064))

(assert (=> mapNonEmpty!27110 (= (arr!24112 _values!688) (store mapRest!27110 mapKey!27110 mapValue!27110))))

(declare-fun b!869333 () Bool)

(declare-fun e!484136 () Bool)

(declare-fun tp_is_empty!17007 () Bool)

(assert (=> b!869333 (= e!484136 tp_is_empty!17007)))

(declare-fun b!869334 () Bool)

(declare-fun res!590776 () Bool)

(assert (=> b!869334 (=> (not res!590776) (not e!484139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869334 (= res!590776 (validMask!0 mask!1196))))

(declare-fun b!869335 () Bool)

(declare-fun res!590773 () Bool)

(assert (=> b!869335 (=> (not res!590773) (not e!484139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50164 (_ BitVec 32)) Bool)

(assert (=> b!869335 (= res!590773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!869336 () Bool)

(declare-fun res!590777 () Bool)

(assert (=> b!869336 (=> (not res!590777) (not e!484139))))

(declare-datatypes ((List!17149 0))(
  ( (Nil!17146) (Cons!17145 (h!18276 (_ BitVec 64)) (t!24186 List!17149)) )
))
(declare-fun arrayNoDuplicates!0 (array!50164 (_ BitVec 32) List!17149) Bool)

(assert (=> b!869336 (= res!590777 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17146))))

(declare-fun b!869337 () Bool)

(declare-fun res!590775 () Bool)

(assert (=> b!869337 (=> (not res!590775) (not e!484139))))

(assert (=> b!869337 (= res!590775 (and (= (size!24552 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24553 _keys!868) (size!24552 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869338 () Bool)

(declare-fun res!590774 () Bool)

(assert (=> b!869338 (=> (not res!590774) (not e!484139))))

(assert (=> b!869338 (= res!590774 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24553 _keys!868))))))

(declare-fun res!590779 () Bool)

(assert (=> start!73956 (=> (not res!590779) (not e!484139))))

(assert (=> start!73956 (= res!590779 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24553 _keys!868))))))

(assert (=> start!73956 e!484139))

(assert (=> start!73956 tp_is_empty!17007))

(assert (=> start!73956 true))

(assert (=> start!73956 tp!52116))

(declare-fun array_inv!19046 (array!50164) Bool)

(assert (=> start!73956 (array_inv!19046 _keys!868)))

(declare-fun e!484138 () Bool)

(declare-fun array_inv!19047 (array!50162) Bool)

(assert (=> start!73956 (and (array_inv!19047 _values!688) e!484138)))

(declare-fun b!869339 () Bool)

(declare-fun res!590778 () Bool)

(assert (=> b!869339 (=> (not res!590778) (not e!484139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869339 (= res!590778 (validKeyInArray!0 k0!854))))

(declare-fun b!869340 () Bool)

(declare-fun res!590772 () Bool)

(assert (=> b!869340 (=> (not res!590772) (not e!484139))))

(assert (=> b!869340 (= res!590772 (and (= (select (arr!24113 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869341 () Bool)

(assert (=> b!869341 (= e!484140 tp_is_empty!17007)))

(declare-fun b!869342 () Bool)

(assert (=> b!869342 (= e!484138 (and e!484136 mapRes!27110))))

(declare-fun condMapEmpty!27110 () Bool)

(declare-fun mapDefault!27110 () ValueCell!8064)

(assert (=> b!869342 (= condMapEmpty!27110 (= (arr!24112 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8064)) mapDefault!27110)))))

(declare-fun mapIsEmpty!27110 () Bool)

(assert (=> mapIsEmpty!27110 mapRes!27110))

(assert (= (and start!73956 res!590779) b!869334))

(assert (= (and b!869334 res!590776) b!869337))

(assert (= (and b!869337 res!590775) b!869335))

(assert (= (and b!869335 res!590773) b!869336))

(assert (= (and b!869336 res!590777) b!869338))

(assert (= (and b!869338 res!590774) b!869339))

(assert (= (and b!869339 res!590778) b!869340))

(assert (= (and b!869340 res!590772) b!869331))

(assert (= (and b!869331 res!590780) b!869332))

(assert (= (and b!869342 condMapEmpty!27110) mapIsEmpty!27110))

(assert (= (and b!869342 (not condMapEmpty!27110)) mapNonEmpty!27110))

(get-info :version)

(assert (= (and mapNonEmpty!27110 ((_ is ValueCellFull!8064) mapValue!27110)) b!869341))

(assert (= (and b!869342 ((_ is ValueCellFull!8064) mapDefault!27110)) b!869333))

(assert (= start!73956 b!869342))

(declare-fun m!810887 () Bool)

(assert (=> b!869339 m!810887))

(declare-fun m!810889 () Bool)

(assert (=> b!869332 m!810889))

(declare-fun m!810891 () Bool)

(assert (=> b!869332 m!810891))

(assert (=> b!869332 m!810891))

(declare-fun m!810893 () Bool)

(assert (=> b!869332 m!810893))

(declare-fun m!810895 () Bool)

(assert (=> b!869332 m!810895))

(declare-fun m!810897 () Bool)

(assert (=> b!869331 m!810897))

(declare-fun m!810899 () Bool)

(assert (=> b!869331 m!810899))

(declare-fun m!810901 () Bool)

(assert (=> b!869331 m!810901))

(declare-fun m!810903 () Bool)

(assert (=> b!869335 m!810903))

(declare-fun m!810905 () Bool)

(assert (=> b!869336 m!810905))

(declare-fun m!810907 () Bool)

(assert (=> start!73956 m!810907))

(declare-fun m!810909 () Bool)

(assert (=> start!73956 m!810909))

(declare-fun m!810911 () Bool)

(assert (=> b!869340 m!810911))

(declare-fun m!810913 () Bool)

(assert (=> b!869334 m!810913))

(declare-fun m!810915 () Bool)

(assert (=> mapNonEmpty!27110 m!810915))

(check-sat (not b!869331) b_and!24623 (not mapNonEmpty!27110) (not b!869332) (not b_next!14871) (not b!869335) (not start!73956) (not b!869339) tp_is_empty!17007 (not b!869334) (not b!869336))
(check-sat b_and!24623 (not b_next!14871))
