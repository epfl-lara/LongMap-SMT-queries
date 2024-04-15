; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74564 () Bool)

(assert start!74564)

(declare-fun b_free!15271 () Bool)

(declare-fun b_next!15271 () Bool)

(assert (=> start!74564 (= b_free!15271 (not b_next!15271))))

(declare-fun tp!53495 () Bool)

(declare-fun b_and!25121 () Bool)

(assert (=> start!74564 (= tp!53495 b_and!25121)))

(declare-fun b!878581 () Bool)

(declare-fun e!488931 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((V!28401 0))(
  ( (V!28402 (val!8805 Int)) )
))
(declare-datatypes ((ValueCell!8318 0))(
  ( (ValueCellFull!8318 (v!11239 V!28401)) (EmptyCell!8318) )
))
(declare-datatypes ((array!51135 0))(
  ( (array!51136 (arr!24594 (Array (_ BitVec 32) ValueCell!8318)) (size!25036 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51135)

(assert (=> b!878581 (= e!488931 (bvslt i!612 (size!25036 _values!688)))))

(declare-fun b!878582 () Bool)

(declare-fun res!596953 () Bool)

(declare-fun e!488937 () Bool)

(assert (=> b!878582 (=> (not res!596953) (not e!488937))))

(declare-datatypes ((array!51137 0))(
  ( (array!51138 (arr!24595 (Array (_ BitVec 32) (_ BitVec 64))) (size!25037 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51137)

(assert (=> b!878582 (= res!596953 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25037 _keys!868))))))

(declare-fun b!878583 () Bool)

(declare-fun res!596954 () Bool)

(assert (=> b!878583 (=> (not res!596954) (not e!488937))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878583 (= res!596954 (validMask!0 mask!1196))))

(declare-fun b!878584 () Bool)

(declare-fun res!596956 () Bool)

(assert (=> b!878584 (=> (not res!596956) (not e!488937))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!878584 (= res!596956 (and (= (size!25036 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25037 _keys!868) (size!25036 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878585 () Bool)

(declare-fun res!596958 () Bool)

(assert (=> b!878585 (=> (not res!596958) (not e!488937))))

(declare-datatypes ((List!17462 0))(
  ( (Nil!17459) (Cons!17458 (h!18589 (_ BitVec 64)) (t!24542 List!17462)) )
))
(declare-fun arrayNoDuplicates!0 (array!51137 (_ BitVec 32) List!17462) Bool)

(assert (=> b!878585 (= res!596958 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17459))))

(declare-fun b!878587 () Bool)

(declare-fun e!488933 () Bool)

(declare-fun tp_is_empty!17515 () Bool)

(assert (=> b!878587 (= e!488933 tp_is_empty!17515)))

(declare-fun mapIsEmpty!27888 () Bool)

(declare-fun mapRes!27888 () Bool)

(assert (=> mapIsEmpty!27888 mapRes!27888))

(declare-fun mapNonEmpty!27888 () Bool)

(declare-fun tp!53496 () Bool)

(assert (=> mapNonEmpty!27888 (= mapRes!27888 (and tp!53496 e!488933))))

(declare-fun mapKey!27888 () (_ BitVec 32))

(declare-fun mapValue!27888 () ValueCell!8318)

(declare-fun mapRest!27888 () (Array (_ BitVec 32) ValueCell!8318))

(assert (=> mapNonEmpty!27888 (= (arr!24594 _values!688) (store mapRest!27888 mapKey!27888 mapValue!27888))))

(declare-fun b!878588 () Bool)

(declare-fun res!596960 () Bool)

(assert (=> b!878588 (=> (not res!596960) (not e!488937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51137 (_ BitVec 32)) Bool)

(assert (=> b!878588 (= res!596960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878589 () Bool)

(declare-fun e!488934 () Bool)

(assert (=> b!878589 (= e!488934 tp_is_empty!17515)))

(declare-fun b!878590 () Bool)

(declare-fun res!596959 () Bool)

(assert (=> b!878590 (=> (not res!596959) (not e!488937))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878590 (= res!596959 (validKeyInArray!0 k0!854))))

(declare-fun b!878591 () Bool)

(declare-fun e!488936 () Bool)

(assert (=> b!878591 (= e!488936 (and e!488934 mapRes!27888))))

(declare-fun condMapEmpty!27888 () Bool)

(declare-fun mapDefault!27888 () ValueCell!8318)

(assert (=> b!878591 (= condMapEmpty!27888 (= (arr!24594 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8318)) mapDefault!27888)))))

(declare-fun res!596952 () Bool)

(assert (=> start!74564 (=> (not res!596952) (not e!488937))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74564 (= res!596952 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25037 _keys!868))))))

(assert (=> start!74564 e!488937))

(assert (=> start!74564 tp_is_empty!17515))

(assert (=> start!74564 true))

(assert (=> start!74564 tp!53495))

(declare-fun array_inv!19424 (array!51137) Bool)

(assert (=> start!74564 (array_inv!19424 _keys!868)))

(declare-fun array_inv!19425 (array!51135) Bool)

(assert (=> start!74564 (and (array_inv!19425 _values!688) e!488936)))

(declare-fun b!878586 () Bool)

(declare-fun e!488935 () Bool)

(assert (=> b!878586 (= e!488935 (not e!488931))))

(declare-fun res!596955 () Bool)

(assert (=> b!878586 (=> res!596955 e!488931)))

(assert (=> b!878586 (= res!596955 (not (validKeyInArray!0 (select (arr!24595 _keys!868) from!1053))))))

(declare-fun v!557 () V!28401)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!397111 () array!51135)

(declare-fun minValue!654 () V!28401)

(declare-fun zeroValue!654 () V!28401)

(declare-datatypes ((tuple2!11662 0))(
  ( (tuple2!11663 (_1!5842 (_ BitVec 64)) (_2!5842 V!28401)) )
))
(declare-datatypes ((List!17463 0))(
  ( (Nil!17460) (Cons!17459 (h!18590 tuple2!11662) (t!24543 List!17463)) )
))
(declare-datatypes ((ListLongMap!10421 0))(
  ( (ListLongMap!10422 (toList!5226 List!17463)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3219 (array!51137 array!51135 (_ BitVec 32) (_ BitVec 32) V!28401 V!28401 (_ BitVec 32) Int) ListLongMap!10421)

(declare-fun +!2522 (ListLongMap!10421 tuple2!11662) ListLongMap!10421)

(assert (=> b!878586 (= (getCurrentListMapNoExtraKeys!3219 _keys!868 lt!397111 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2522 (getCurrentListMapNoExtraKeys!3219 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11663 k0!854 v!557)))))

(declare-datatypes ((Unit!29959 0))(
  ( (Unit!29960) )
))
(declare-fun lt!397110 () Unit!29959)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!691 (array!51137 array!51135 (_ BitVec 32) (_ BitVec 32) V!28401 V!28401 (_ BitVec 32) (_ BitVec 64) V!28401 (_ BitVec 32) Int) Unit!29959)

(assert (=> b!878586 (= lt!397110 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!691 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!878592 () Bool)

(declare-fun res!596957 () Bool)

(assert (=> b!878592 (=> (not res!596957) (not e!488937))))

(assert (=> b!878592 (= res!596957 (and (= (select (arr!24595 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878593 () Bool)

(assert (=> b!878593 (= e!488937 e!488935)))

(declare-fun res!596961 () Bool)

(assert (=> b!878593 (=> (not res!596961) (not e!488935))))

(assert (=> b!878593 (= res!596961 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397108 () ListLongMap!10421)

(assert (=> b!878593 (= lt!397108 (getCurrentListMapNoExtraKeys!3219 _keys!868 lt!397111 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!878593 (= lt!397111 (array!51136 (store (arr!24594 _values!688) i!612 (ValueCellFull!8318 v!557)) (size!25036 _values!688)))))

(declare-fun lt!397109 () ListLongMap!10421)

(assert (=> b!878593 (= lt!397109 (getCurrentListMapNoExtraKeys!3219 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74564 res!596952) b!878583))

(assert (= (and b!878583 res!596954) b!878584))

(assert (= (and b!878584 res!596956) b!878588))

(assert (= (and b!878588 res!596960) b!878585))

(assert (= (and b!878585 res!596958) b!878582))

(assert (= (and b!878582 res!596953) b!878590))

(assert (= (and b!878590 res!596959) b!878592))

(assert (= (and b!878592 res!596957) b!878593))

(assert (= (and b!878593 res!596961) b!878586))

(assert (= (and b!878586 (not res!596955)) b!878581))

(assert (= (and b!878591 condMapEmpty!27888) mapIsEmpty!27888))

(assert (= (and b!878591 (not condMapEmpty!27888)) mapNonEmpty!27888))

(get-info :version)

(assert (= (and mapNonEmpty!27888 ((_ is ValueCellFull!8318) mapValue!27888)) b!878587))

(assert (= (and b!878591 ((_ is ValueCellFull!8318) mapDefault!27888)) b!878589))

(assert (= start!74564 b!878591))

(declare-fun m!817821 () Bool)

(assert (=> b!878585 m!817821))

(declare-fun m!817823 () Bool)

(assert (=> b!878590 m!817823))

(declare-fun m!817825 () Bool)

(assert (=> start!74564 m!817825))

(declare-fun m!817827 () Bool)

(assert (=> start!74564 m!817827))

(declare-fun m!817829 () Bool)

(assert (=> b!878588 m!817829))

(declare-fun m!817831 () Bool)

(assert (=> b!878592 m!817831))

(declare-fun m!817833 () Bool)

(assert (=> b!878593 m!817833))

(declare-fun m!817835 () Bool)

(assert (=> b!878593 m!817835))

(declare-fun m!817837 () Bool)

(assert (=> b!878593 m!817837))

(declare-fun m!817839 () Bool)

(assert (=> mapNonEmpty!27888 m!817839))

(declare-fun m!817841 () Bool)

(assert (=> b!878583 m!817841))

(declare-fun m!817843 () Bool)

(assert (=> b!878586 m!817843))

(declare-fun m!817845 () Bool)

(assert (=> b!878586 m!817845))

(assert (=> b!878586 m!817843))

(declare-fun m!817847 () Bool)

(assert (=> b!878586 m!817847))

(declare-fun m!817849 () Bool)

(assert (=> b!878586 m!817849))

(assert (=> b!878586 m!817847))

(declare-fun m!817851 () Bool)

(assert (=> b!878586 m!817851))

(declare-fun m!817853 () Bool)

(assert (=> b!878586 m!817853))

(check-sat (not b!878583) (not b!878593) (not b!878588) (not b_next!15271) (not b!878586) (not b!878585) b_and!25121 (not mapNonEmpty!27888) tp_is_empty!17515 (not start!74564) (not b!878590))
(check-sat b_and!25121 (not b_next!15271))
