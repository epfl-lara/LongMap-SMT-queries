; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74784 () Bool)

(assert start!74784)

(declare-fun b_free!15379 () Bool)

(declare-fun b_next!15379 () Bool)

(assert (=> start!74784 (= b_free!15379 (not b_next!15379))))

(declare-fun tp!53834 () Bool)

(declare-fun b_and!25399 () Bool)

(assert (=> start!74784 (= tp!53834 b_and!25399)))

(declare-fun b!881537 () Bool)

(declare-fun res!598936 () Bool)

(declare-fun e!490585 () Bool)

(assert (=> b!881537 (=> (not res!598936) (not e!490585))))

(declare-datatypes ((array!51357 0))(
  ( (array!51358 (arr!24700 (Array (_ BitVec 32) (_ BitVec 64))) (size!25142 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51357)

(declare-datatypes ((List!17545 0))(
  ( (Nil!17542) (Cons!17541 (h!18672 (_ BitVec 64)) (t!24717 List!17545)) )
))
(declare-fun arrayNoDuplicates!0 (array!51357 (_ BitVec 32) List!17545) Bool)

(assert (=> b!881537 (= res!598936 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17542))))

(declare-fun b!881538 () Bool)

(declare-fun res!598932 () Bool)

(assert (=> b!881538 (=> (not res!598932) (not e!490585))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28545 0))(
  ( (V!28546 (val!8859 Int)) )
))
(declare-datatypes ((ValueCell!8372 0))(
  ( (ValueCellFull!8372 (v!11313 V!28545)) (EmptyCell!8372) )
))
(declare-datatypes ((array!51359 0))(
  ( (array!51360 (arr!24701 (Array (_ BitVec 32) ValueCell!8372)) (size!25143 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51359)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!881538 (= res!598932 (and (= (size!25143 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25142 _keys!868) (size!25143 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881539 () Bool)

(declare-fun e!490584 () Bool)

(declare-fun e!490589 () Bool)

(assert (=> b!881539 (= e!490584 e!490589)))

(declare-fun res!598934 () Bool)

(assert (=> b!881539 (=> res!598934 e!490589)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!881539 (= res!598934 (not (= (select (arr!24700 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((tuple2!11752 0))(
  ( (tuple2!11753 (_1!5887 (_ BitVec 64)) (_2!5887 V!28545)) )
))
(declare-datatypes ((List!17546 0))(
  ( (Nil!17543) (Cons!17542 (h!18673 tuple2!11752) (t!24718 List!17546)) )
))
(declare-datatypes ((ListLongMap!10511 0))(
  ( (ListLongMap!10512 (toList!5271 List!17546)) )
))
(declare-fun lt!398628 () ListLongMap!10511)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398629 () ListLongMap!10511)

(declare-fun +!2564 (ListLongMap!10511 tuple2!11752) ListLongMap!10511)

(declare-fun get!13010 (ValueCell!8372 V!28545) V!28545)

(declare-fun dynLambda!1252 (Int (_ BitVec 64)) V!28545)

(assert (=> b!881539 (= lt!398629 (+!2564 lt!398628 (tuple2!11753 (select (arr!24700 _keys!868) from!1053) (get!13010 (select (arr!24701 _values!688) from!1053) (dynLambda!1252 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!598928 () Bool)

(assert (=> start!74784 (=> (not res!598928) (not e!490585))))

(assert (=> start!74784 (= res!598928 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25142 _keys!868))))))

(assert (=> start!74784 e!490585))

(declare-fun tp_is_empty!17623 () Bool)

(assert (=> start!74784 tp_is_empty!17623))

(assert (=> start!74784 true))

(assert (=> start!74784 tp!53834))

(declare-fun array_inv!19500 (array!51357) Bool)

(assert (=> start!74784 (array_inv!19500 _keys!868)))

(declare-fun e!490586 () Bool)

(declare-fun array_inv!19501 (array!51359) Bool)

(assert (=> start!74784 (and (array_inv!19501 _values!688) e!490586)))

(declare-fun b!881540 () Bool)

(declare-fun e!490587 () Bool)

(assert (=> b!881540 (= e!490587 (not e!490584))))

(declare-fun res!598927 () Bool)

(assert (=> b!881540 (=> res!598927 e!490584)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881540 (= res!598927 (not (validKeyInArray!0 (select (arr!24700 _keys!868) from!1053))))))

(declare-fun lt!398627 () ListLongMap!10511)

(assert (=> b!881540 (= lt!398627 lt!398628)))

(declare-fun lt!398631 () ListLongMap!10511)

(declare-fun v!557 () V!28545)

(assert (=> b!881540 (= lt!398628 (+!2564 lt!398631 (tuple2!11753 k0!854 v!557)))))

(declare-fun minValue!654 () V!28545)

(declare-fun zeroValue!654 () V!28545)

(declare-fun lt!398624 () array!51359)

(declare-fun getCurrentListMapNoExtraKeys!3262 (array!51357 array!51359 (_ BitVec 32) (_ BitVec 32) V!28545 V!28545 (_ BitVec 32) Int) ListLongMap!10511)

(assert (=> b!881540 (= lt!398627 (getCurrentListMapNoExtraKeys!3262 _keys!868 lt!398624 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881540 (= lt!398631 (getCurrentListMapNoExtraKeys!3262 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30039 0))(
  ( (Unit!30040) )
))
(declare-fun lt!398626 () Unit!30039)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!729 (array!51357 array!51359 (_ BitVec 32) (_ BitVec 32) V!28545 V!28545 (_ BitVec 32) (_ BitVec 64) V!28545 (_ BitVec 32) Int) Unit!30039)

(assert (=> b!881540 (= lt!398626 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!729 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881541 () Bool)

(declare-fun e!490582 () Bool)

(declare-fun mapRes!28065 () Bool)

(assert (=> b!881541 (= e!490586 (and e!490582 mapRes!28065))))

(declare-fun condMapEmpty!28065 () Bool)

(declare-fun mapDefault!28065 () ValueCell!8372)

(assert (=> b!881541 (= condMapEmpty!28065 (= (arr!24701 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8372)) mapDefault!28065)))))

(declare-fun mapNonEmpty!28065 () Bool)

(declare-fun tp!53835 () Bool)

(declare-fun e!490588 () Bool)

(assert (=> mapNonEmpty!28065 (= mapRes!28065 (and tp!53835 e!490588))))

(declare-fun mapKey!28065 () (_ BitVec 32))

(declare-fun mapValue!28065 () ValueCell!8372)

(declare-fun mapRest!28065 () (Array (_ BitVec 32) ValueCell!8372))

(assert (=> mapNonEmpty!28065 (= (arr!24701 _values!688) (store mapRest!28065 mapKey!28065 mapValue!28065))))

(declare-fun b!881542 () Bool)

(assert (=> b!881542 (= e!490589 true)))

(declare-fun arrayContainsKey!0 (array!51357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881542 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!398623 () Unit!30039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51357 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30039)

(assert (=> b!881542 (= lt!398623 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881542 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17542)))

(declare-fun lt!398630 () Unit!30039)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51357 (_ BitVec 32) (_ BitVec 32)) Unit!30039)

(assert (=> b!881542 (= lt!398630 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881543 () Bool)

(assert (=> b!881543 (= e!490582 tp_is_empty!17623)))

(declare-fun b!881544 () Bool)

(declare-fun res!598929 () Bool)

(assert (=> b!881544 (=> (not res!598929) (not e!490585))))

(assert (=> b!881544 (= res!598929 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!28065 () Bool)

(assert (=> mapIsEmpty!28065 mapRes!28065))

(declare-fun b!881545 () Bool)

(declare-fun res!598935 () Bool)

(assert (=> b!881545 (=> (not res!598935) (not e!490585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51357 (_ BitVec 32)) Bool)

(assert (=> b!881545 (= res!598935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881546 () Bool)

(assert (=> b!881546 (= e!490585 e!490587)))

(declare-fun res!598931 () Bool)

(assert (=> b!881546 (=> (not res!598931) (not e!490587))))

(assert (=> b!881546 (= res!598931 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!881546 (= lt!398629 (getCurrentListMapNoExtraKeys!3262 _keys!868 lt!398624 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!881546 (= lt!398624 (array!51360 (store (arr!24701 _values!688) i!612 (ValueCellFull!8372 v!557)) (size!25143 _values!688)))))

(declare-fun lt!398625 () ListLongMap!10511)

(assert (=> b!881546 (= lt!398625 (getCurrentListMapNoExtraKeys!3262 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881547 () Bool)

(declare-fun res!598930 () Bool)

(assert (=> b!881547 (=> (not res!598930) (not e!490585))))

(assert (=> b!881547 (= res!598930 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25142 _keys!868))))))

(declare-fun b!881548 () Bool)

(assert (=> b!881548 (= e!490588 tp_is_empty!17623)))

(declare-fun b!881549 () Bool)

(declare-fun res!598926 () Bool)

(assert (=> b!881549 (=> (not res!598926) (not e!490585))))

(assert (=> b!881549 (= res!598926 (and (= (select (arr!24700 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!881550 () Bool)

(declare-fun res!598933 () Bool)

(assert (=> b!881550 (=> (not res!598933) (not e!490585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881550 (= res!598933 (validMask!0 mask!1196))))

(assert (= (and start!74784 res!598928) b!881550))

(assert (= (and b!881550 res!598933) b!881538))

(assert (= (and b!881538 res!598932) b!881545))

(assert (= (and b!881545 res!598935) b!881537))

(assert (= (and b!881537 res!598936) b!881547))

(assert (= (and b!881547 res!598930) b!881544))

(assert (= (and b!881544 res!598929) b!881549))

(assert (= (and b!881549 res!598926) b!881546))

(assert (= (and b!881546 res!598931) b!881540))

(assert (= (and b!881540 (not res!598927)) b!881539))

(assert (= (and b!881539 (not res!598934)) b!881542))

(assert (= (and b!881541 condMapEmpty!28065) mapIsEmpty!28065))

(assert (= (and b!881541 (not condMapEmpty!28065)) mapNonEmpty!28065))

(get-info :version)

(assert (= (and mapNonEmpty!28065 ((_ is ValueCellFull!8372) mapValue!28065)) b!881548))

(assert (= (and b!881541 ((_ is ValueCellFull!8372) mapDefault!28065)) b!881543))

(assert (= start!74784 b!881541))

(declare-fun b_lambda!12571 () Bool)

(assert (=> (not b_lambda!12571) (not b!881539)))

(declare-fun t!24716 () Bool)

(declare-fun tb!5029 () Bool)

(assert (=> (and start!74784 (= defaultEntry!696 defaultEntry!696) t!24716) tb!5029))

(declare-fun result!9697 () Bool)

(assert (=> tb!5029 (= result!9697 tp_is_empty!17623)))

(assert (=> b!881539 t!24716))

(declare-fun b_and!25401 () Bool)

(assert (= b_and!25399 (and (=> t!24716 result!9697) b_and!25401)))

(declare-fun m!820907 () Bool)

(assert (=> mapNonEmpty!28065 m!820907))

(declare-fun m!820909 () Bool)

(assert (=> b!881540 m!820909))

(declare-fun m!820911 () Bool)

(assert (=> b!881540 m!820911))

(declare-fun m!820913 () Bool)

(assert (=> b!881540 m!820913))

(declare-fun m!820915 () Bool)

(assert (=> b!881540 m!820915))

(assert (=> b!881540 m!820913))

(declare-fun m!820917 () Bool)

(assert (=> b!881540 m!820917))

(declare-fun m!820919 () Bool)

(assert (=> b!881540 m!820919))

(declare-fun m!820921 () Bool)

(assert (=> b!881544 m!820921))

(declare-fun m!820923 () Bool)

(assert (=> b!881542 m!820923))

(declare-fun m!820925 () Bool)

(assert (=> b!881542 m!820925))

(declare-fun m!820927 () Bool)

(assert (=> b!881542 m!820927))

(declare-fun m!820929 () Bool)

(assert (=> b!881542 m!820929))

(declare-fun m!820931 () Bool)

(assert (=> b!881550 m!820931))

(declare-fun m!820933 () Bool)

(assert (=> b!881546 m!820933))

(declare-fun m!820935 () Bool)

(assert (=> b!881546 m!820935))

(declare-fun m!820937 () Bool)

(assert (=> b!881546 m!820937))

(declare-fun m!820939 () Bool)

(assert (=> b!881539 m!820939))

(declare-fun m!820941 () Bool)

(assert (=> b!881539 m!820941))

(declare-fun m!820943 () Bool)

(assert (=> b!881539 m!820943))

(declare-fun m!820945 () Bool)

(assert (=> b!881539 m!820945))

(assert (=> b!881539 m!820941))

(assert (=> b!881539 m!820913))

(assert (=> b!881539 m!820943))

(declare-fun m!820947 () Bool)

(assert (=> b!881549 m!820947))

(declare-fun m!820949 () Bool)

(assert (=> start!74784 m!820949))

(declare-fun m!820951 () Bool)

(assert (=> start!74784 m!820951))

(declare-fun m!820953 () Bool)

(assert (=> b!881537 m!820953))

(declare-fun m!820955 () Bool)

(assert (=> b!881545 m!820955))

(check-sat (not b!881542) (not start!74784) (not b_next!15379) b_and!25401 (not b_lambda!12571) (not b!881544) (not mapNonEmpty!28065) tp_is_empty!17623 (not b!881537) (not b!881545) (not b!881546) (not b!881540) (not b!881539) (not b!881550))
(check-sat b_and!25401 (not b_next!15379))
