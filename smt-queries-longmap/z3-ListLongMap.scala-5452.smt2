; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72664 () Bool)

(assert start!72664)

(declare-fun b_free!13681 () Bool)

(declare-fun b_next!13681 () Bool)

(assert (=> start!72664 (= b_free!13681 (not b_next!13681))))

(declare-fun tp!48142 () Bool)

(declare-fun b_and!22777 () Bool)

(assert (=> start!72664 (= tp!48142 b_and!22777)))

(declare-fun b!841994 () Bool)

(declare-fun e!469827 () Bool)

(declare-fun tp_is_empty!15547 () Bool)

(assert (=> b!841994 (= e!469827 tp_is_empty!15547)))

(declare-fun b!841995 () Bool)

(declare-fun e!469824 () Bool)

(assert (=> b!841995 (= e!469824 tp_is_empty!15547)))

(declare-fun b!841996 () Bool)

(declare-fun res!572109 () Bool)

(declare-fun e!469823 () Bool)

(assert (=> b!841996 (=> (not res!572109) (not e!469823))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841996 (= res!572109 (validMask!0 mask!1196))))

(declare-fun b!841997 () Bool)

(assert (=> b!841997 (= e!469823 (not true))))

(declare-fun e!469825 () Bool)

(assert (=> b!841997 e!469825))

(declare-fun c!91663 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841997 (= c!91663 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25777 0))(
  ( (V!25778 (val!7821 Int)) )
))
(declare-fun v!557 () V!25777)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!47387 0))(
  ( (array!47388 (arr!22720 (Array (_ BitVec 32) (_ BitVec 64))) (size!23161 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47387)

(declare-datatypes ((ValueCell!7334 0))(
  ( (ValueCellFull!7334 (v!10246 V!25777)) (EmptyCell!7334) )
))
(declare-datatypes ((array!47389 0))(
  ( (array!47390 (arr!22721 (Array (_ BitVec 32) ValueCell!7334)) (size!23162 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47389)

(declare-fun zeroValue!654 () V!25777)

(declare-fun minValue!654 () V!25777)

(declare-datatypes ((Unit!28906 0))(
  ( (Unit!28907) )
))
(declare-fun lt!381248 () Unit!28906)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!289 (array!47387 array!47389 (_ BitVec 32) (_ BitVec 32) V!25777 V!25777 (_ BitVec 32) (_ BitVec 64) V!25777 (_ BitVec 32) Int) Unit!28906)

(assert (=> b!841997 (= lt!381248 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!289 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841998 () Bool)

(declare-fun res!572111 () Bool)

(assert (=> b!841998 (=> (not res!572111) (not e!469823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47387 (_ BitVec 32)) Bool)

(assert (=> b!841998 (= res!572111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841999 () Bool)

(declare-datatypes ((tuple2!10304 0))(
  ( (tuple2!10305 (_1!5163 (_ BitVec 64)) (_2!5163 V!25777)) )
))
(declare-datatypes ((List!16077 0))(
  ( (Nil!16074) (Cons!16073 (h!17210 tuple2!10304) (t!22440 List!16077)) )
))
(declare-datatypes ((ListLongMap!9075 0))(
  ( (ListLongMap!9076 (toList!4553 List!16077)) )
))
(declare-fun call!37321 () ListLongMap!9075)

(declare-fun call!37322 () ListLongMap!9075)

(assert (=> b!841999 (= e!469825 (= call!37321 call!37322))))

(declare-fun b!842000 () Bool)

(declare-fun +!2060 (ListLongMap!9075 tuple2!10304) ListLongMap!9075)

(assert (=> b!842000 (= e!469825 (= call!37321 (+!2060 call!37322 (tuple2!10305 k0!854 v!557))))))

(declare-fun bm!37318 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2613 (array!47387 array!47389 (_ BitVec 32) (_ BitVec 32) V!25777 V!25777 (_ BitVec 32) Int) ListLongMap!9075)

(assert (=> bm!37318 (= call!37322 (getCurrentListMapNoExtraKeys!2613 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842001 () Bool)

(declare-fun res!572110 () Bool)

(assert (=> b!842001 (=> (not res!572110) (not e!469823))))

(declare-datatypes ((List!16078 0))(
  ( (Nil!16075) (Cons!16074 (h!17211 (_ BitVec 64)) (t!22441 List!16078)) )
))
(declare-fun arrayNoDuplicates!0 (array!47387 (_ BitVec 32) List!16078) Bool)

(assert (=> b!842001 (= res!572110 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16075))))

(declare-fun b!842002 () Bool)

(declare-fun e!469828 () Bool)

(declare-fun mapRes!24920 () Bool)

(assert (=> b!842002 (= e!469828 (and e!469824 mapRes!24920))))

(declare-fun condMapEmpty!24920 () Bool)

(declare-fun mapDefault!24920 () ValueCell!7334)

(assert (=> b!842002 (= condMapEmpty!24920 (= (arr!22721 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7334)) mapDefault!24920)))))

(declare-fun bm!37319 () Bool)

(assert (=> bm!37319 (= call!37321 (getCurrentListMapNoExtraKeys!2613 _keys!868 (array!47390 (store (arr!22721 _values!688) i!612 (ValueCellFull!7334 v!557)) (size!23162 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842003 () Bool)

(declare-fun res!572113 () Bool)

(assert (=> b!842003 (=> (not res!572113) (not e!469823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842003 (= res!572113 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!24920 () Bool)

(assert (=> mapIsEmpty!24920 mapRes!24920))

(declare-fun b!842004 () Bool)

(declare-fun res!572107 () Bool)

(assert (=> b!842004 (=> (not res!572107) (not e!469823))))

(assert (=> b!842004 (= res!572107 (and (= (size!23162 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23161 _keys!868) (size!23162 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842005 () Bool)

(declare-fun res!572106 () Bool)

(assert (=> b!842005 (=> (not res!572106) (not e!469823))))

(assert (=> b!842005 (= res!572106 (and (= (select (arr!22720 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23161 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!842006 () Bool)

(declare-fun res!572108 () Bool)

(assert (=> b!842006 (=> (not res!572108) (not e!469823))))

(assert (=> b!842006 (= res!572108 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23161 _keys!868))))))

(declare-fun mapNonEmpty!24920 () Bool)

(declare-fun tp!48143 () Bool)

(assert (=> mapNonEmpty!24920 (= mapRes!24920 (and tp!48143 e!469827))))

(declare-fun mapKey!24920 () (_ BitVec 32))

(declare-fun mapRest!24920 () (Array (_ BitVec 32) ValueCell!7334))

(declare-fun mapValue!24920 () ValueCell!7334)

(assert (=> mapNonEmpty!24920 (= (arr!22721 _values!688) (store mapRest!24920 mapKey!24920 mapValue!24920))))

(declare-fun res!572112 () Bool)

(assert (=> start!72664 (=> (not res!572112) (not e!469823))))

(assert (=> start!72664 (= res!572112 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23161 _keys!868))))))

(assert (=> start!72664 e!469823))

(assert (=> start!72664 tp_is_empty!15547))

(assert (=> start!72664 true))

(assert (=> start!72664 tp!48142))

(declare-fun array_inv!18130 (array!47387) Bool)

(assert (=> start!72664 (array_inv!18130 _keys!868)))

(declare-fun array_inv!18131 (array!47389) Bool)

(assert (=> start!72664 (and (array_inv!18131 _values!688) e!469828)))

(assert (= (and start!72664 res!572112) b!841996))

(assert (= (and b!841996 res!572109) b!842004))

(assert (= (and b!842004 res!572107) b!841998))

(assert (= (and b!841998 res!572111) b!842001))

(assert (= (and b!842001 res!572110) b!842006))

(assert (= (and b!842006 res!572108) b!842003))

(assert (= (and b!842003 res!572113) b!842005))

(assert (= (and b!842005 res!572106) b!841997))

(assert (= (and b!841997 c!91663) b!842000))

(assert (= (and b!841997 (not c!91663)) b!841999))

(assert (= (or b!842000 b!841999) bm!37319))

(assert (= (or b!842000 b!841999) bm!37318))

(assert (= (and b!842002 condMapEmpty!24920) mapIsEmpty!24920))

(assert (= (and b!842002 (not condMapEmpty!24920)) mapNonEmpty!24920))

(get-info :version)

(assert (= (and mapNonEmpty!24920 ((_ is ValueCellFull!7334) mapValue!24920)) b!841994))

(assert (= (and b!842002 ((_ is ValueCellFull!7334) mapDefault!24920)) b!841995))

(assert (= start!72664 b!842002))

(declare-fun m!785939 () Bool)

(assert (=> mapNonEmpty!24920 m!785939))

(declare-fun m!785941 () Bool)

(assert (=> b!842001 m!785941))

(declare-fun m!785943 () Bool)

(assert (=> b!842000 m!785943))

(declare-fun m!785945 () Bool)

(assert (=> b!841997 m!785945))

(declare-fun m!785947 () Bool)

(assert (=> b!841998 m!785947))

(declare-fun m!785949 () Bool)

(assert (=> start!72664 m!785949))

(declare-fun m!785951 () Bool)

(assert (=> start!72664 m!785951))

(declare-fun m!785953 () Bool)

(assert (=> bm!37318 m!785953))

(declare-fun m!785955 () Bool)

(assert (=> b!841996 m!785955))

(declare-fun m!785957 () Bool)

(assert (=> b!842005 m!785957))

(declare-fun m!785959 () Bool)

(assert (=> bm!37319 m!785959))

(declare-fun m!785961 () Bool)

(assert (=> bm!37319 m!785961))

(declare-fun m!785963 () Bool)

(assert (=> b!842003 m!785963))

(check-sat (not bm!37319) (not b_next!13681) (not b!842000) b_and!22777 (not b!842003) (not b!841997) (not bm!37318) (not b!842001) (not b!841998) tp_is_empty!15547 (not start!72664) (not mapNonEmpty!24920) (not b!841996))
(check-sat b_and!22777 (not b_next!13681))
