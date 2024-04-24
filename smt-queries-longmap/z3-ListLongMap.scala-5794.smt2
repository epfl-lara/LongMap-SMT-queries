; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74874 () Bool)

(assert start!74874)

(declare-fun b_free!15355 () Bool)

(declare-fun b_next!15355 () Bool)

(assert (=> start!74874 (= b_free!15355 (not b_next!15355))))

(declare-fun tp!53754 () Bool)

(declare-fun b_and!25339 () Bool)

(assert (=> start!74874 (= tp!53754 b_and!25339)))

(declare-fun b!881725 () Bool)

(declare-fun res!598804 () Bool)

(declare-fun e!490752 () Bool)

(assert (=> b!881725 (=> (not res!598804) (not e!490752))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51359 0))(
  ( (array!51360 (arr!24699 (Array (_ BitVec 32) (_ BitVec 64))) (size!25140 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51359)

(assert (=> b!881725 (= res!598804 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25140 _keys!868))))))

(declare-fun b!881726 () Bool)

(declare-fun e!490751 () Bool)

(declare-fun tp_is_empty!17599 () Bool)

(assert (=> b!881726 (= e!490751 tp_is_empty!17599)))

(declare-fun res!598806 () Bool)

(assert (=> start!74874 (=> (not res!598806) (not e!490752))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74874 (= res!598806 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25140 _keys!868))))))

(assert (=> start!74874 e!490752))

(assert (=> start!74874 tp_is_empty!17599))

(assert (=> start!74874 true))

(assert (=> start!74874 tp!53754))

(declare-fun array_inv!19496 (array!51359) Bool)

(assert (=> start!74874 (array_inv!19496 _keys!868)))

(declare-datatypes ((V!28513 0))(
  ( (V!28514 (val!8847 Int)) )
))
(declare-datatypes ((ValueCell!8360 0))(
  ( (ValueCellFull!8360 (v!11295 V!28513)) (EmptyCell!8360) )
))
(declare-datatypes ((array!51361 0))(
  ( (array!51362 (arr!24700 (Array (_ BitVec 32) ValueCell!8360)) (size!25141 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51361)

(declare-fun e!490745 () Bool)

(declare-fun array_inv!19497 (array!51361) Bool)

(assert (=> start!74874 (and (array_inv!19497 _values!688) e!490745)))

(declare-fun b!881727 () Bool)

(declare-fun res!598808 () Bool)

(assert (=> b!881727 (=> (not res!598808) (not e!490752))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881727 (= res!598808 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!28020 () Bool)

(declare-fun mapRes!28020 () Bool)

(declare-fun tp!53753 () Bool)

(declare-fun e!490748 () Bool)

(assert (=> mapNonEmpty!28020 (= mapRes!28020 (and tp!53753 e!490748))))

(declare-fun mapKey!28020 () (_ BitVec 32))

(declare-fun mapRest!28020 () (Array (_ BitVec 32) ValueCell!8360))

(declare-fun mapValue!28020 () ValueCell!8360)

(assert (=> mapNonEmpty!28020 (= (arr!24700 _values!688) (store mapRest!28020 mapKey!28020 mapValue!28020))))

(declare-fun b!881728 () Bool)

(declare-fun res!598812 () Bool)

(assert (=> b!881728 (=> (not res!598812) (not e!490752))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51359 (_ BitVec 32)) Bool)

(assert (=> b!881728 (= res!598812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881729 () Bool)

(declare-fun res!598809 () Bool)

(assert (=> b!881729 (=> (not res!598809) (not e!490752))))

(declare-datatypes ((List!17477 0))(
  ( (Nil!17474) (Cons!17473 (h!18610 (_ BitVec 64)) (t!24626 List!17477)) )
))
(declare-fun arrayNoDuplicates!0 (array!51359 (_ BitVec 32) List!17477) Bool)

(assert (=> b!881729 (= res!598809 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17474))))

(declare-fun mapIsEmpty!28020 () Bool)

(assert (=> mapIsEmpty!28020 mapRes!28020))

(declare-fun b!881730 () Bool)

(declare-fun e!490747 () Bool)

(assert (=> b!881730 (= e!490752 e!490747)))

(declare-fun res!598805 () Bool)

(assert (=> b!881730 (=> (not res!598805) (not e!490747))))

(assert (=> b!881730 (= res!598805 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!398692 () array!51361)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28513)

(declare-datatypes ((tuple2!11648 0))(
  ( (tuple2!11649 (_1!5835 (_ BitVec 64)) (_2!5835 V!28513)) )
))
(declare-datatypes ((List!17478 0))(
  ( (Nil!17475) (Cons!17474 (h!18611 tuple2!11648) (t!24627 List!17478)) )
))
(declare-datatypes ((ListLongMap!10419 0))(
  ( (ListLongMap!10420 (toList!5225 List!17478)) )
))
(declare-fun lt!398696 () ListLongMap!10419)

(declare-fun zeroValue!654 () V!28513)

(declare-fun getCurrentListMapNoExtraKeys!3265 (array!51359 array!51361 (_ BitVec 32) (_ BitVec 32) V!28513 V!28513 (_ BitVec 32) Int) ListLongMap!10419)

(assert (=> b!881730 (= lt!398696 (getCurrentListMapNoExtraKeys!3265 _keys!868 lt!398692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28513)

(assert (=> b!881730 (= lt!398692 (array!51362 (store (arr!24700 _values!688) i!612 (ValueCellFull!8360 v!557)) (size!25141 _values!688)))))

(declare-fun lt!398697 () ListLongMap!10419)

(assert (=> b!881730 (= lt!398697 (getCurrentListMapNoExtraKeys!3265 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881731 () Bool)

(assert (=> b!881731 (= e!490748 tp_is_empty!17599)))

(declare-fun b!881732 () Bool)

(assert (=> b!881732 (= e!490745 (and e!490751 mapRes!28020))))

(declare-fun condMapEmpty!28020 () Bool)

(declare-fun mapDefault!28020 () ValueCell!8360)

(assert (=> b!881732 (= condMapEmpty!28020 (= (arr!24700 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8360)) mapDefault!28020)))))

(declare-fun b!881733 () Bool)

(declare-fun e!490750 () Bool)

(assert (=> b!881733 (= e!490750 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (size!25140 _keys!868) #b01111111111111111111111111111111)))))

(assert (=> b!881733 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17474)))

(declare-datatypes ((Unit!30046 0))(
  ( (Unit!30047) )
))
(declare-fun lt!398694 () Unit!30046)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51359 (_ BitVec 32) (_ BitVec 32)) Unit!30046)

(assert (=> b!881733 (= lt!398694 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881734 () Bool)

(declare-fun e!490749 () Bool)

(assert (=> b!881734 (= e!490747 (not e!490749))))

(declare-fun res!598813 () Bool)

(assert (=> b!881734 (=> res!598813 e!490749)))

(assert (=> b!881734 (= res!598813 (not (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053))))))

(declare-fun lt!398695 () ListLongMap!10419)

(declare-fun lt!398691 () ListLongMap!10419)

(assert (=> b!881734 (= lt!398695 lt!398691)))

(declare-fun lt!398690 () ListLongMap!10419)

(declare-fun +!2540 (ListLongMap!10419 tuple2!11648) ListLongMap!10419)

(assert (=> b!881734 (= lt!398691 (+!2540 lt!398690 (tuple2!11649 k0!854 v!557)))))

(assert (=> b!881734 (= lt!398695 (getCurrentListMapNoExtraKeys!3265 _keys!868 lt!398692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881734 (= lt!398690 (getCurrentListMapNoExtraKeys!3265 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398693 () Unit!30046)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!705 (array!51359 array!51361 (_ BitVec 32) (_ BitVec 32) V!28513 V!28513 (_ BitVec 32) (_ BitVec 64) V!28513 (_ BitVec 32) Int) Unit!30046)

(assert (=> b!881734 (= lt!398693 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!705 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881735 () Bool)

(declare-fun res!598811 () Bool)

(assert (=> b!881735 (=> (not res!598811) (not e!490752))))

(assert (=> b!881735 (= res!598811 (and (= (size!25141 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25140 _keys!868) (size!25141 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881736 () Bool)

(declare-fun res!598814 () Bool)

(assert (=> b!881736 (=> (not res!598814) (not e!490752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881736 (= res!598814 (validMask!0 mask!1196))))

(declare-fun b!881737 () Bool)

(assert (=> b!881737 (= e!490749 e!490750)))

(declare-fun res!598810 () Bool)

(assert (=> b!881737 (=> res!598810 e!490750)))

(assert (=> b!881737 (= res!598810 (not (= (select (arr!24699 _keys!868) from!1053) k0!854)))))

(declare-fun get!13011 (ValueCell!8360 V!28513) V!28513)

(declare-fun dynLambda!1264 (Int (_ BitVec 64)) V!28513)

(assert (=> b!881737 (= lt!398696 (+!2540 lt!398691 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881738 () Bool)

(declare-fun res!598807 () Bool)

(assert (=> b!881738 (=> (not res!598807) (not e!490752))))

(assert (=> b!881738 (= res!598807 (and (= (select (arr!24699 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74874 res!598806) b!881736))

(assert (= (and b!881736 res!598814) b!881735))

(assert (= (and b!881735 res!598811) b!881728))

(assert (= (and b!881728 res!598812) b!881729))

(assert (= (and b!881729 res!598809) b!881725))

(assert (= (and b!881725 res!598804) b!881727))

(assert (= (and b!881727 res!598808) b!881738))

(assert (= (and b!881738 res!598807) b!881730))

(assert (= (and b!881730 res!598805) b!881734))

(assert (= (and b!881734 (not res!598813)) b!881737))

(assert (= (and b!881737 (not res!598810)) b!881733))

(assert (= (and b!881732 condMapEmpty!28020) mapIsEmpty!28020))

(assert (= (and b!881732 (not condMapEmpty!28020)) mapNonEmpty!28020))

(get-info :version)

(assert (= (and mapNonEmpty!28020 ((_ is ValueCellFull!8360) mapValue!28020)) b!881731))

(assert (= (and b!881732 ((_ is ValueCellFull!8360) mapDefault!28020)) b!881726))

(assert (= start!74874 b!881732))

(declare-fun b_lambda!12477 () Bool)

(assert (=> (not b_lambda!12477) (not b!881737)))

(declare-fun t!24625 () Bool)

(declare-fun tb!5005 () Bool)

(assert (=> (and start!74874 (= defaultEntry!696 defaultEntry!696) t!24625) tb!5005))

(declare-fun result!9643 () Bool)

(assert (=> tb!5005 (= result!9643 tp_is_empty!17599)))

(assert (=> b!881737 t!24625))

(declare-fun b_and!25341 () Bool)

(assert (= b_and!25339 (and (=> t!24625 result!9643) b_and!25341)))

(declare-fun m!821909 () Bool)

(assert (=> b!881734 m!821909))

(declare-fun m!821911 () Bool)

(assert (=> b!881734 m!821911))

(assert (=> b!881734 m!821909))

(declare-fun m!821913 () Bool)

(assert (=> b!881734 m!821913))

(declare-fun m!821915 () Bool)

(assert (=> b!881734 m!821915))

(declare-fun m!821917 () Bool)

(assert (=> b!881734 m!821917))

(declare-fun m!821919 () Bool)

(assert (=> b!881734 m!821919))

(declare-fun m!821921 () Bool)

(assert (=> b!881736 m!821921))

(declare-fun m!821923 () Bool)

(assert (=> b!881733 m!821923))

(declare-fun m!821925 () Bool)

(assert (=> b!881733 m!821925))

(declare-fun m!821927 () Bool)

(assert (=> mapNonEmpty!28020 m!821927))

(declare-fun m!821929 () Bool)

(assert (=> b!881738 m!821929))

(declare-fun m!821931 () Bool)

(assert (=> start!74874 m!821931))

(declare-fun m!821933 () Bool)

(assert (=> start!74874 m!821933))

(declare-fun m!821935 () Bool)

(assert (=> b!881727 m!821935))

(declare-fun m!821937 () Bool)

(assert (=> b!881728 m!821937))

(declare-fun m!821939 () Bool)

(assert (=> b!881737 m!821939))

(declare-fun m!821941 () Bool)

(assert (=> b!881737 m!821941))

(declare-fun m!821943 () Bool)

(assert (=> b!881737 m!821943))

(assert (=> b!881737 m!821939))

(declare-fun m!821945 () Bool)

(assert (=> b!881737 m!821945))

(assert (=> b!881737 m!821909))

(assert (=> b!881737 m!821941))

(declare-fun m!821947 () Bool)

(assert (=> b!881730 m!821947))

(declare-fun m!821949 () Bool)

(assert (=> b!881730 m!821949))

(declare-fun m!821951 () Bool)

(assert (=> b!881730 m!821951))

(declare-fun m!821953 () Bool)

(assert (=> b!881729 m!821953))

(check-sat (not b!881734) (not b!881736) (not b!881730) (not b!881737) tp_is_empty!17599 (not b_next!15355) (not start!74874) (not b!881733) (not b_lambda!12477) (not b!881728) (not b!881729) (not b!881727) (not mapNonEmpty!28020) b_and!25341)
(check-sat b_and!25341 (not b_next!15355))
(get-model)

(declare-fun b_lambda!12483 () Bool)

(assert (= b_lambda!12477 (or (and start!74874 b_free!15355) b_lambda!12483)))

(check-sat (not b_lambda!12483) (not b!881734) (not b!881736) (not b!881730) (not b!881728) (not b!881737) tp_is_empty!17599 (not b_next!15355) (not start!74874) (not b!881733) (not b!881729) (not b!881727) (not mapNonEmpty!28020) b_and!25341)
(check-sat b_and!25341 (not b_next!15355))
(get-model)

(declare-fun d!109299 () Bool)

(declare-fun e!490817 () Bool)

(assert (=> d!109299 e!490817))

(declare-fun res!598889 () Bool)

(assert (=> d!109299 (=> (not res!598889) (not e!490817))))

(declare-fun lt!398764 () ListLongMap!10419)

(declare-fun contains!4235 (ListLongMap!10419 (_ BitVec 64)) Bool)

(assert (=> d!109299 (= res!598889 (not (contains!4235 lt!398764 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!490816 () ListLongMap!10419)

(assert (=> d!109299 (= lt!398764 e!490816)))

(declare-fun c!93151 () Bool)

(assert (=> d!109299 (= c!93151 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 _keys!868)))))

(assert (=> d!109299 (validMask!0 mask!1196)))

(assert (=> d!109299 (= (getCurrentListMapNoExtraKeys!3265 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398764)))

(declare-fun b!881853 () Bool)

(assert (=> b!881853 (= e!490816 (ListLongMap!10420 Nil!17475))))

(declare-fun bm!38935 () Bool)

(declare-fun call!38938 () ListLongMap!10419)

(assert (=> bm!38935 (= call!38938 (getCurrentListMapNoExtraKeys!3265 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881854 () Bool)

(declare-fun e!490815 () Bool)

(declare-fun e!490821 () Bool)

(assert (=> b!881854 (= e!490815 e!490821)))

(assert (=> b!881854 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 _keys!868)))))

(declare-fun res!598891 () Bool)

(assert (=> b!881854 (= res!598891 (contains!4235 lt!398764 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881854 (=> (not res!598891) (not e!490821))))

(declare-fun b!881855 () Bool)

(declare-fun e!490818 () Bool)

(declare-fun isEmpty!673 (ListLongMap!10419) Bool)

(assert (=> b!881855 (= e!490818 (isEmpty!673 lt!398764))))

(declare-fun b!881856 () Bool)

(assert (=> b!881856 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 _keys!868)))))

(assert (=> b!881856 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25141 _values!688)))))

(declare-fun apply!380 (ListLongMap!10419 (_ BitVec 64)) V!28513)

(assert (=> b!881856 (= e!490821 (= (apply!380 lt!398764 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13011 (select (arr!24700 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881857 () Bool)

(assert (=> b!881857 (= e!490815 e!490818)))

(declare-fun c!93150 () Bool)

(assert (=> b!881857 (= c!93150 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 _keys!868)))))

(declare-fun b!881858 () Bool)

(declare-fun e!490819 () ListLongMap!10419)

(assert (=> b!881858 (= e!490819 call!38938)))

(declare-fun b!881859 () Bool)

(declare-fun e!490820 () Bool)

(assert (=> b!881859 (= e!490820 (validKeyInArray!0 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881859 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!881860 () Bool)

(assert (=> b!881860 (= e!490816 e!490819)))

(declare-fun c!93149 () Bool)

(assert (=> b!881860 (= c!93149 (validKeyInArray!0 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!881861 () Bool)

(declare-fun lt!398761 () Unit!30046)

(declare-fun lt!398765 () Unit!30046)

(assert (=> b!881861 (= lt!398761 lt!398765)))

(declare-fun lt!398760 () (_ BitVec 64))

(declare-fun lt!398763 () (_ BitVec 64))

(declare-fun lt!398766 () V!28513)

(declare-fun lt!398762 () ListLongMap!10419)

(assert (=> b!881861 (not (contains!4235 (+!2540 lt!398762 (tuple2!11649 lt!398763 lt!398766)) lt!398760))))

(declare-fun addStillNotContains!207 (ListLongMap!10419 (_ BitVec 64) V!28513 (_ BitVec 64)) Unit!30046)

(assert (=> b!881861 (= lt!398765 (addStillNotContains!207 lt!398762 lt!398763 lt!398766 lt!398760))))

(assert (=> b!881861 (= lt!398760 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881861 (= lt!398766 (get!13011 (select (arr!24700 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881861 (= lt!398763 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881861 (= lt!398762 call!38938)))

(assert (=> b!881861 (= e!490819 (+!2540 call!38938 (tuple2!11649 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13011 (select (arr!24700 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881862 () Bool)

(assert (=> b!881862 (= e!490817 e!490815)))

(declare-fun c!93152 () Bool)

(assert (=> b!881862 (= c!93152 e!490820)))

(declare-fun res!598890 () Bool)

(assert (=> b!881862 (=> (not res!598890) (not e!490820))))

(assert (=> b!881862 (= res!598890 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 _keys!868)))))

(declare-fun b!881863 () Bool)

(assert (=> b!881863 (= e!490818 (= lt!398764 (getCurrentListMapNoExtraKeys!3265 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881864 () Bool)

(declare-fun res!598892 () Bool)

(assert (=> b!881864 (=> (not res!598892) (not e!490817))))

(assert (=> b!881864 (= res!598892 (not (contains!4235 lt!398764 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109299 c!93151) b!881853))

(assert (= (and d!109299 (not c!93151)) b!881860))

(assert (= (and b!881860 c!93149) b!881861))

(assert (= (and b!881860 (not c!93149)) b!881858))

(assert (= (or b!881861 b!881858) bm!38935))

(assert (= (and d!109299 res!598889) b!881864))

(assert (= (and b!881864 res!598892) b!881862))

(assert (= (and b!881862 res!598890) b!881859))

(assert (= (and b!881862 c!93152) b!881854))

(assert (= (and b!881862 (not c!93152)) b!881857))

(assert (= (and b!881854 res!598891) b!881856))

(assert (= (and b!881857 c!93150) b!881863))

(assert (= (and b!881857 (not c!93150)) b!881855))

(declare-fun b_lambda!12485 () Bool)

(assert (=> (not b_lambda!12485) (not b!881856)))

(assert (=> b!881856 t!24625))

(declare-fun b_and!25351 () Bool)

(assert (= b_and!25341 (and (=> t!24625 result!9643) b_and!25351)))

(declare-fun b_lambda!12487 () Bool)

(assert (=> (not b_lambda!12487) (not b!881861)))

(assert (=> b!881861 t!24625))

(declare-fun b_and!25353 () Bool)

(assert (= b_and!25351 (and (=> t!24625 result!9643) b_and!25353)))

(declare-fun m!822047 () Bool)

(assert (=> b!881863 m!822047))

(declare-fun m!822049 () Bool)

(assert (=> b!881860 m!822049))

(assert (=> b!881860 m!822049))

(declare-fun m!822051 () Bool)

(assert (=> b!881860 m!822051))

(declare-fun m!822053 () Bool)

(assert (=> d!109299 m!822053))

(assert (=> d!109299 m!821921))

(assert (=> b!881856 m!822049))

(declare-fun m!822055 () Bool)

(assert (=> b!881856 m!822055))

(declare-fun m!822057 () Bool)

(assert (=> b!881856 m!822057))

(assert (=> b!881856 m!821941))

(declare-fun m!822059 () Bool)

(assert (=> b!881856 m!822059))

(assert (=> b!881856 m!822049))

(assert (=> b!881856 m!822057))

(assert (=> b!881856 m!821941))

(declare-fun m!822061 () Bool)

(assert (=> b!881855 m!822061))

(assert (=> bm!38935 m!822047))

(declare-fun m!822063 () Bool)

(assert (=> b!881864 m!822063))

(assert (=> b!881854 m!822049))

(assert (=> b!881854 m!822049))

(declare-fun m!822065 () Bool)

(assert (=> b!881854 m!822065))

(assert (=> b!881859 m!822049))

(assert (=> b!881859 m!822049))

(assert (=> b!881859 m!822051))

(declare-fun m!822067 () Bool)

(assert (=> b!881861 m!822067))

(declare-fun m!822069 () Bool)

(assert (=> b!881861 m!822069))

(assert (=> b!881861 m!822057))

(assert (=> b!881861 m!821941))

(assert (=> b!881861 m!822059))

(assert (=> b!881861 m!822067))

(declare-fun m!822071 () Bool)

(assert (=> b!881861 m!822071))

(assert (=> b!881861 m!822049))

(assert (=> b!881861 m!822057))

(assert (=> b!881861 m!821941))

(declare-fun m!822073 () Bool)

(assert (=> b!881861 m!822073))

(assert (=> b!881734 d!109299))

(declare-fun d!109301 () Bool)

(declare-fun e!490824 () Bool)

(assert (=> d!109301 e!490824))

(declare-fun res!598893 () Bool)

(assert (=> d!109301 (=> (not res!598893) (not e!490824))))

(declare-fun lt!398771 () ListLongMap!10419)

(assert (=> d!109301 (= res!598893 (not (contains!4235 lt!398771 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!490823 () ListLongMap!10419)

(assert (=> d!109301 (= lt!398771 e!490823)))

(declare-fun c!93155 () Bool)

(assert (=> d!109301 (= c!93155 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 _keys!868)))))

(assert (=> d!109301 (validMask!0 mask!1196)))

(assert (=> d!109301 (= (getCurrentListMapNoExtraKeys!3265 _keys!868 lt!398692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398771)))

(declare-fun b!881865 () Bool)

(assert (=> b!881865 (= e!490823 (ListLongMap!10420 Nil!17475))))

(declare-fun call!38939 () ListLongMap!10419)

(declare-fun bm!38936 () Bool)

(assert (=> bm!38936 (= call!38939 (getCurrentListMapNoExtraKeys!3265 _keys!868 lt!398692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881866 () Bool)

(declare-fun e!490822 () Bool)

(declare-fun e!490828 () Bool)

(assert (=> b!881866 (= e!490822 e!490828)))

(assert (=> b!881866 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 _keys!868)))))

(declare-fun res!598895 () Bool)

(assert (=> b!881866 (= res!598895 (contains!4235 lt!398771 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881866 (=> (not res!598895) (not e!490828))))

(declare-fun b!881867 () Bool)

(declare-fun e!490825 () Bool)

(assert (=> b!881867 (= e!490825 (isEmpty!673 lt!398771))))

(declare-fun b!881868 () Bool)

(assert (=> b!881868 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 _keys!868)))))

(assert (=> b!881868 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25141 lt!398692)))))

(assert (=> b!881868 (= e!490828 (= (apply!380 lt!398771 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13011 (select (arr!24700 lt!398692) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881869 () Bool)

(assert (=> b!881869 (= e!490822 e!490825)))

(declare-fun c!93154 () Bool)

(assert (=> b!881869 (= c!93154 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 _keys!868)))))

(declare-fun b!881870 () Bool)

(declare-fun e!490826 () ListLongMap!10419)

(assert (=> b!881870 (= e!490826 call!38939)))

(declare-fun b!881871 () Bool)

(declare-fun e!490827 () Bool)

(assert (=> b!881871 (= e!490827 (validKeyInArray!0 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!881871 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!881872 () Bool)

(assert (=> b!881872 (= e!490823 e!490826)))

(declare-fun c!93153 () Bool)

(assert (=> b!881872 (= c!93153 (validKeyInArray!0 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!881873 () Bool)

(declare-fun lt!398768 () Unit!30046)

(declare-fun lt!398772 () Unit!30046)

(assert (=> b!881873 (= lt!398768 lt!398772)))

(declare-fun lt!398770 () (_ BitVec 64))

(declare-fun lt!398767 () (_ BitVec 64))

(declare-fun lt!398773 () V!28513)

(declare-fun lt!398769 () ListLongMap!10419)

(assert (=> b!881873 (not (contains!4235 (+!2540 lt!398769 (tuple2!11649 lt!398770 lt!398773)) lt!398767))))

(assert (=> b!881873 (= lt!398772 (addStillNotContains!207 lt!398769 lt!398770 lt!398773 lt!398767))))

(assert (=> b!881873 (= lt!398767 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881873 (= lt!398773 (get!13011 (select (arr!24700 lt!398692) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881873 (= lt!398770 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881873 (= lt!398769 call!38939)))

(assert (=> b!881873 (= e!490826 (+!2540 call!38939 (tuple2!11649 (select (arr!24699 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13011 (select (arr!24700 lt!398692) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881874 () Bool)

(assert (=> b!881874 (= e!490824 e!490822)))

(declare-fun c!93156 () Bool)

(assert (=> b!881874 (= c!93156 e!490827)))

(declare-fun res!598894 () Bool)

(assert (=> b!881874 (=> (not res!598894) (not e!490827))))

(assert (=> b!881874 (= res!598894 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 _keys!868)))))

(declare-fun b!881875 () Bool)

(assert (=> b!881875 (= e!490825 (= lt!398771 (getCurrentListMapNoExtraKeys!3265 _keys!868 lt!398692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881876 () Bool)

(declare-fun res!598896 () Bool)

(assert (=> b!881876 (=> (not res!598896) (not e!490824))))

(assert (=> b!881876 (= res!598896 (not (contains!4235 lt!398771 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109301 c!93155) b!881865))

(assert (= (and d!109301 (not c!93155)) b!881872))

(assert (= (and b!881872 c!93153) b!881873))

(assert (= (and b!881872 (not c!93153)) b!881870))

(assert (= (or b!881873 b!881870) bm!38936))

(assert (= (and d!109301 res!598893) b!881876))

(assert (= (and b!881876 res!598896) b!881874))

(assert (= (and b!881874 res!598894) b!881871))

(assert (= (and b!881874 c!93156) b!881866))

(assert (= (and b!881874 (not c!93156)) b!881869))

(assert (= (and b!881866 res!598895) b!881868))

(assert (= (and b!881869 c!93154) b!881875))

(assert (= (and b!881869 (not c!93154)) b!881867))

(declare-fun b_lambda!12489 () Bool)

(assert (=> (not b_lambda!12489) (not b!881868)))

(assert (=> b!881868 t!24625))

(declare-fun b_and!25355 () Bool)

(assert (= b_and!25353 (and (=> t!24625 result!9643) b_and!25355)))

(declare-fun b_lambda!12491 () Bool)

(assert (=> (not b_lambda!12491) (not b!881873)))

(assert (=> b!881873 t!24625))

(declare-fun b_and!25357 () Bool)

(assert (= b_and!25355 (and (=> t!24625 result!9643) b_and!25357)))

(declare-fun m!822075 () Bool)

(assert (=> b!881875 m!822075))

(assert (=> b!881872 m!822049))

(assert (=> b!881872 m!822049))

(assert (=> b!881872 m!822051))

(declare-fun m!822077 () Bool)

(assert (=> d!109301 m!822077))

(assert (=> d!109301 m!821921))

(assert (=> b!881868 m!822049))

(declare-fun m!822079 () Bool)

(assert (=> b!881868 m!822079))

(declare-fun m!822081 () Bool)

(assert (=> b!881868 m!822081))

(assert (=> b!881868 m!821941))

(declare-fun m!822083 () Bool)

(assert (=> b!881868 m!822083))

(assert (=> b!881868 m!822049))

(assert (=> b!881868 m!822081))

(assert (=> b!881868 m!821941))

(declare-fun m!822085 () Bool)

(assert (=> b!881867 m!822085))

(assert (=> bm!38936 m!822075))

(declare-fun m!822087 () Bool)

(assert (=> b!881876 m!822087))

(assert (=> b!881866 m!822049))

(assert (=> b!881866 m!822049))

(declare-fun m!822089 () Bool)

(assert (=> b!881866 m!822089))

(assert (=> b!881871 m!822049))

(assert (=> b!881871 m!822049))

(assert (=> b!881871 m!822051))

(declare-fun m!822091 () Bool)

(assert (=> b!881873 m!822091))

(declare-fun m!822093 () Bool)

(assert (=> b!881873 m!822093))

(assert (=> b!881873 m!822081))

(assert (=> b!881873 m!821941))

(assert (=> b!881873 m!822083))

(assert (=> b!881873 m!822091))

(declare-fun m!822095 () Bool)

(assert (=> b!881873 m!822095))

(assert (=> b!881873 m!822049))

(assert (=> b!881873 m!822081))

(assert (=> b!881873 m!821941))

(declare-fun m!822097 () Bool)

(assert (=> b!881873 m!822097))

(assert (=> b!881734 d!109301))

(declare-fun d!109303 () Bool)

(declare-fun e!490834 () Bool)

(assert (=> d!109303 e!490834))

(declare-fun res!598899 () Bool)

(assert (=> d!109303 (=> (not res!598899) (not e!490834))))

(assert (=> d!109303 (= res!598899 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25141 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25141 _values!688))))))))

(declare-fun lt!398776 () Unit!30046)

(declare-fun choose!1442 (array!51359 array!51361 (_ BitVec 32) (_ BitVec 32) V!28513 V!28513 (_ BitVec 32) (_ BitVec 64) V!28513 (_ BitVec 32) Int) Unit!30046)

(assert (=> d!109303 (= lt!398776 (choose!1442 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109303 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25140 _keys!868)))))

(assert (=> d!109303 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!705 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!398776)))

(declare-fun bm!38941 () Bool)

(declare-fun call!38944 () ListLongMap!10419)

(assert (=> bm!38941 (= call!38944 (getCurrentListMapNoExtraKeys!3265 _keys!868 (array!51362 (store (arr!24700 _values!688) i!612 (ValueCellFull!8360 v!557)) (size!25141 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!38945 () ListLongMap!10419)

(declare-fun bm!38942 () Bool)

(assert (=> bm!38942 (= call!38945 (getCurrentListMapNoExtraKeys!3265 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881883 () Bool)

(declare-fun e!490833 () Bool)

(assert (=> b!881883 (= e!490833 (= call!38944 call!38945))))

(declare-fun b!881884 () Bool)

(assert (=> b!881884 (= e!490833 (= call!38944 (+!2540 call!38945 (tuple2!11649 k0!854 v!557))))))

(declare-fun b!881885 () Bool)

(assert (=> b!881885 (= e!490834 e!490833)))

(declare-fun c!93159 () Bool)

(assert (=> b!881885 (= c!93159 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(assert (= (and d!109303 res!598899) b!881885))

(assert (= (and b!881885 c!93159) b!881884))

(assert (= (and b!881885 (not c!93159)) b!881883))

(assert (= (or b!881884 b!881883) bm!38942))

(assert (= (or b!881884 b!881883) bm!38941))

(declare-fun m!822099 () Bool)

(assert (=> d!109303 m!822099))

(assert (=> bm!38941 m!821949))

(declare-fun m!822101 () Bool)

(assert (=> bm!38941 m!822101))

(assert (=> bm!38942 m!821919))

(declare-fun m!822103 () Bool)

(assert (=> b!881884 m!822103))

(assert (=> b!881734 d!109303))

(declare-fun d!109305 () Bool)

(declare-fun e!490837 () Bool)

(assert (=> d!109305 e!490837))

(declare-fun res!598905 () Bool)

(assert (=> d!109305 (=> (not res!598905) (not e!490837))))

(declare-fun lt!398787 () ListLongMap!10419)

(assert (=> d!109305 (= res!598905 (contains!4235 lt!398787 (_1!5835 (tuple2!11649 k0!854 v!557))))))

(declare-fun lt!398788 () List!17478)

(assert (=> d!109305 (= lt!398787 (ListLongMap!10420 lt!398788))))

(declare-fun lt!398785 () Unit!30046)

(declare-fun lt!398786 () Unit!30046)

(assert (=> d!109305 (= lt!398785 lt!398786)))

(declare-datatypes ((Option!429 0))(
  ( (Some!428 (v!11301 V!28513)) (None!427) )
))
(declare-fun getValueByKey!423 (List!17478 (_ BitVec 64)) Option!429)

(assert (=> d!109305 (= (getValueByKey!423 lt!398788 (_1!5835 (tuple2!11649 k0!854 v!557))) (Some!428 (_2!5835 (tuple2!11649 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!237 (List!17478 (_ BitVec 64) V!28513) Unit!30046)

(assert (=> d!109305 (= lt!398786 (lemmaContainsTupThenGetReturnValue!237 lt!398788 (_1!5835 (tuple2!11649 k0!854 v!557)) (_2!5835 (tuple2!11649 k0!854 v!557))))))

(declare-fun insertStrictlySorted!276 (List!17478 (_ BitVec 64) V!28513) List!17478)

(assert (=> d!109305 (= lt!398788 (insertStrictlySorted!276 (toList!5225 lt!398690) (_1!5835 (tuple2!11649 k0!854 v!557)) (_2!5835 (tuple2!11649 k0!854 v!557))))))

(assert (=> d!109305 (= (+!2540 lt!398690 (tuple2!11649 k0!854 v!557)) lt!398787)))

(declare-fun b!881890 () Bool)

(declare-fun res!598904 () Bool)

(assert (=> b!881890 (=> (not res!598904) (not e!490837))))

(assert (=> b!881890 (= res!598904 (= (getValueByKey!423 (toList!5225 lt!398787) (_1!5835 (tuple2!11649 k0!854 v!557))) (Some!428 (_2!5835 (tuple2!11649 k0!854 v!557)))))))

(declare-fun b!881891 () Bool)

(declare-fun contains!4236 (List!17478 tuple2!11648) Bool)

(assert (=> b!881891 (= e!490837 (contains!4236 (toList!5225 lt!398787) (tuple2!11649 k0!854 v!557)))))

(assert (= (and d!109305 res!598905) b!881890))

(assert (= (and b!881890 res!598904) b!881891))

(declare-fun m!822105 () Bool)

(assert (=> d!109305 m!822105))

(declare-fun m!822107 () Bool)

(assert (=> d!109305 m!822107))

(declare-fun m!822109 () Bool)

(assert (=> d!109305 m!822109))

(declare-fun m!822111 () Bool)

(assert (=> d!109305 m!822111))

(declare-fun m!822113 () Bool)

(assert (=> b!881890 m!822113))

(declare-fun m!822115 () Bool)

(assert (=> b!881891 m!822115))

(assert (=> b!881734 d!109305))

(declare-fun d!109307 () Bool)

(assert (=> d!109307 (= (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)) (and (not (= (select (arr!24699 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24699 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!881734 d!109307))

(declare-fun b!881903 () Bool)

(declare-fun e!490846 () Bool)

(declare-fun e!490847 () Bool)

(assert (=> b!881903 (= e!490846 e!490847)))

(declare-fun res!598913 () Bool)

(assert (=> b!881903 (=> (not res!598913) (not e!490847))))

(declare-fun e!490849 () Bool)

(assert (=> b!881903 (= res!598913 (not e!490849))))

(declare-fun res!598912 () Bool)

(assert (=> b!881903 (=> (not res!598912) (not e!490849))))

(assert (=> b!881903 (= res!598912 (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)))))

(declare-fun b!881904 () Bool)

(declare-fun e!490848 () Bool)

(declare-fun call!38948 () Bool)

(assert (=> b!881904 (= e!490848 call!38948)))

(declare-fun b!881905 () Bool)

(declare-fun contains!4237 (List!17477 (_ BitVec 64)) Bool)

(assert (=> b!881905 (= e!490849 (contains!4237 Nil!17474 (select (arr!24699 _keys!868) from!1053)))))

(declare-fun b!881906 () Bool)

(assert (=> b!881906 (= e!490848 call!38948)))

(declare-fun bm!38945 () Bool)

(declare-fun c!93162 () Bool)

(assert (=> bm!38945 (= call!38948 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!93162 (Cons!17473 (select (arr!24699 _keys!868) from!1053) Nil!17474) Nil!17474)))))

(declare-fun b!881902 () Bool)

(assert (=> b!881902 (= e!490847 e!490848)))

(assert (=> b!881902 (= c!93162 (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)))))

(declare-fun d!109309 () Bool)

(declare-fun res!598914 () Bool)

(assert (=> d!109309 (=> res!598914 e!490846)))

(assert (=> d!109309 (= res!598914 (bvsge from!1053 (size!25140 _keys!868)))))

(assert (=> d!109309 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17474) e!490846)))

(assert (= (and d!109309 (not res!598914)) b!881903))

(assert (= (and b!881903 res!598912) b!881905))

(assert (= (and b!881903 res!598913) b!881902))

(assert (= (and b!881902 c!93162) b!881904))

(assert (= (and b!881902 (not c!93162)) b!881906))

(assert (= (or b!881904 b!881906) bm!38945))

(assert (=> b!881903 m!821909))

(assert (=> b!881903 m!821909))

(assert (=> b!881903 m!821911))

(assert (=> b!881905 m!821909))

(assert (=> b!881905 m!821909))

(declare-fun m!822117 () Bool)

(assert (=> b!881905 m!822117))

(assert (=> bm!38945 m!821909))

(declare-fun m!822119 () Bool)

(assert (=> bm!38945 m!822119))

(assert (=> b!881902 m!821909))

(assert (=> b!881902 m!821909))

(assert (=> b!881902 m!821911))

(assert (=> b!881733 d!109309))

(declare-fun d!109311 () Bool)

(assert (=> d!109311 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17474)))

(declare-fun lt!398791 () Unit!30046)

(declare-fun choose!39 (array!51359 (_ BitVec 32) (_ BitVec 32)) Unit!30046)

(assert (=> d!109311 (= lt!398791 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!109311 (bvslt (size!25140 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109311 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!398791)))

(declare-fun bs!24730 () Bool)

(assert (= bs!24730 d!109311))

(assert (=> bs!24730 m!821923))

(declare-fun m!822121 () Bool)

(assert (=> bs!24730 m!822121))

(assert (=> b!881733 d!109311))

(declare-fun b!881908 () Bool)

(declare-fun e!490850 () Bool)

(declare-fun e!490851 () Bool)

(assert (=> b!881908 (= e!490850 e!490851)))

(declare-fun res!598916 () Bool)

(assert (=> b!881908 (=> (not res!598916) (not e!490851))))

(declare-fun e!490853 () Bool)

(assert (=> b!881908 (= res!598916 (not e!490853))))

(declare-fun res!598915 () Bool)

(assert (=> b!881908 (=> (not res!598915) (not e!490853))))

(assert (=> b!881908 (= res!598915 (validKeyInArray!0 (select (arr!24699 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881909 () Bool)

(declare-fun e!490852 () Bool)

(declare-fun call!38949 () Bool)

(assert (=> b!881909 (= e!490852 call!38949)))

(declare-fun b!881910 () Bool)

(assert (=> b!881910 (= e!490853 (contains!4237 Nil!17474 (select (arr!24699 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!881911 () Bool)

(assert (=> b!881911 (= e!490852 call!38949)))

(declare-fun bm!38946 () Bool)

(declare-fun c!93163 () Bool)

(assert (=> bm!38946 (= call!38949 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93163 (Cons!17473 (select (arr!24699 _keys!868) #b00000000000000000000000000000000) Nil!17474) Nil!17474)))))

(declare-fun b!881907 () Bool)

(assert (=> b!881907 (= e!490851 e!490852)))

(assert (=> b!881907 (= c!93163 (validKeyInArray!0 (select (arr!24699 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!109313 () Bool)

(declare-fun res!598917 () Bool)

(assert (=> d!109313 (=> res!598917 e!490850)))

(assert (=> d!109313 (= res!598917 (bvsge #b00000000000000000000000000000000 (size!25140 _keys!868)))))

(assert (=> d!109313 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17474) e!490850)))

(assert (= (and d!109313 (not res!598917)) b!881908))

(assert (= (and b!881908 res!598915) b!881910))

(assert (= (and b!881908 res!598916) b!881907))

(assert (= (and b!881907 c!93163) b!881909))

(assert (= (and b!881907 (not c!93163)) b!881911))

(assert (= (or b!881909 b!881911) bm!38946))

(declare-fun m!822123 () Bool)

(assert (=> b!881908 m!822123))

(assert (=> b!881908 m!822123))

(declare-fun m!822125 () Bool)

(assert (=> b!881908 m!822125))

(assert (=> b!881910 m!822123))

(assert (=> b!881910 m!822123))

(declare-fun m!822127 () Bool)

(assert (=> b!881910 m!822127))

(assert (=> bm!38946 m!822123))

(declare-fun m!822129 () Bool)

(assert (=> bm!38946 m!822129))

(assert (=> b!881907 m!822123))

(assert (=> b!881907 m!822123))

(assert (=> b!881907 m!822125))

(assert (=> b!881729 d!109313))

(declare-fun b!881920 () Bool)

(declare-fun e!490862 () Bool)

(declare-fun call!38952 () Bool)

(assert (=> b!881920 (= e!490862 call!38952)))

(declare-fun b!881921 () Bool)

(declare-fun e!490860 () Bool)

(declare-fun e!490861 () Bool)

(assert (=> b!881921 (= e!490860 e!490861)))

(declare-fun c!93166 () Bool)

(assert (=> b!881921 (= c!93166 (validKeyInArray!0 (select (arr!24699 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38949 () Bool)

(assert (=> bm!38949 (= call!38952 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!881923 () Bool)

(assert (=> b!881923 (= e!490861 call!38952)))

(declare-fun d!109315 () Bool)

(declare-fun res!598923 () Bool)

(assert (=> d!109315 (=> res!598923 e!490860)))

(assert (=> d!109315 (= res!598923 (bvsge #b00000000000000000000000000000000 (size!25140 _keys!868)))))

(assert (=> d!109315 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!490860)))

(declare-fun b!881922 () Bool)

(assert (=> b!881922 (= e!490861 e!490862)))

(declare-fun lt!398800 () (_ BitVec 64))

(assert (=> b!881922 (= lt!398800 (select (arr!24699 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!398799 () Unit!30046)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51359 (_ BitVec 64) (_ BitVec 32)) Unit!30046)

(assert (=> b!881922 (= lt!398799 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!398800 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881922 (arrayContainsKey!0 _keys!868 lt!398800 #b00000000000000000000000000000000)))

(declare-fun lt!398798 () Unit!30046)

(assert (=> b!881922 (= lt!398798 lt!398799)))

(declare-fun res!598922 () Bool)

(declare-datatypes ((SeekEntryResult!8707 0))(
  ( (MissingZero!8707 (index!37199 (_ BitVec 32))) (Found!8707 (index!37200 (_ BitVec 32))) (Intermediate!8707 (undefined!9519 Bool) (index!37201 (_ BitVec 32)) (x!74615 (_ BitVec 32))) (Undefined!8707) (MissingVacant!8707 (index!37202 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51359 (_ BitVec 32)) SeekEntryResult!8707)

(assert (=> b!881922 (= res!598922 (= (seekEntryOrOpen!0 (select (arr!24699 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8707 #b00000000000000000000000000000000)))))

(assert (=> b!881922 (=> (not res!598922) (not e!490862))))

(assert (= (and d!109315 (not res!598923)) b!881921))

(assert (= (and b!881921 c!93166) b!881922))

(assert (= (and b!881921 (not c!93166)) b!881923))

(assert (= (and b!881922 res!598922) b!881920))

(assert (= (or b!881920 b!881923) bm!38949))

(assert (=> b!881921 m!822123))

(assert (=> b!881921 m!822123))

(assert (=> b!881921 m!822125))

(declare-fun m!822131 () Bool)

(assert (=> bm!38949 m!822131))

(assert (=> b!881922 m!822123))

(declare-fun m!822133 () Bool)

(assert (=> b!881922 m!822133))

(declare-fun m!822135 () Bool)

(assert (=> b!881922 m!822135))

(assert (=> b!881922 m!822123))

(declare-fun m!822137 () Bool)

(assert (=> b!881922 m!822137))

(assert (=> b!881728 d!109315))

(declare-fun d!109317 () Bool)

(assert (=> d!109317 (= (array_inv!19496 _keys!868) (bvsge (size!25140 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74874 d!109317))

(declare-fun d!109319 () Bool)

(assert (=> d!109319 (= (array_inv!19497 _values!688) (bvsge (size!25141 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74874 d!109319))

(declare-fun d!109321 () Bool)

(declare-fun e!490863 () Bool)

(assert (=> d!109321 e!490863))

(declare-fun res!598925 () Bool)

(assert (=> d!109321 (=> (not res!598925) (not e!490863))))

(declare-fun lt!398803 () ListLongMap!10419)

(assert (=> d!109321 (= res!598925 (contains!4235 lt!398803 (_1!5835 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!398804 () List!17478)

(assert (=> d!109321 (= lt!398803 (ListLongMap!10420 lt!398804))))

(declare-fun lt!398801 () Unit!30046)

(declare-fun lt!398802 () Unit!30046)

(assert (=> d!109321 (= lt!398801 lt!398802)))

(assert (=> d!109321 (= (getValueByKey!423 lt!398804 (_1!5835 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!428 (_2!5835 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109321 (= lt!398802 (lemmaContainsTupThenGetReturnValue!237 lt!398804 (_1!5835 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5835 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109321 (= lt!398804 (insertStrictlySorted!276 (toList!5225 lt!398691) (_1!5835 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5835 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109321 (= (+!2540 lt!398691 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!398803)))

(declare-fun b!881924 () Bool)

(declare-fun res!598924 () Bool)

(assert (=> b!881924 (=> (not res!598924) (not e!490863))))

(assert (=> b!881924 (= res!598924 (= (getValueByKey!423 (toList!5225 lt!398803) (_1!5835 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!428 (_2!5835 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!881925 () Bool)

(assert (=> b!881925 (= e!490863 (contains!4236 (toList!5225 lt!398803) (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109321 res!598925) b!881924))

(assert (= (and b!881924 res!598924) b!881925))

(declare-fun m!822139 () Bool)

(assert (=> d!109321 m!822139))

(declare-fun m!822141 () Bool)

(assert (=> d!109321 m!822141))

(declare-fun m!822143 () Bool)

(assert (=> d!109321 m!822143))

(declare-fun m!822145 () Bool)

(assert (=> d!109321 m!822145))

(declare-fun m!822147 () Bool)

(assert (=> b!881924 m!822147))

(declare-fun m!822149 () Bool)

(assert (=> b!881925 m!822149))

(assert (=> b!881737 d!109321))

(declare-fun d!109323 () Bool)

(declare-fun c!93169 () Bool)

(assert (=> d!109323 (= c!93169 ((_ is ValueCellFull!8360) (select (arr!24700 _values!688) from!1053)))))

(declare-fun e!490866 () V!28513)

(assert (=> d!109323 (= (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!490866)))

(declare-fun b!881930 () Bool)

(declare-fun get!13013 (ValueCell!8360 V!28513) V!28513)

(assert (=> b!881930 (= e!490866 (get!13013 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!881931 () Bool)

(declare-fun get!13014 (ValueCell!8360 V!28513) V!28513)

(assert (=> b!881931 (= e!490866 (get!13014 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109323 c!93169) b!881930))

(assert (= (and d!109323 (not c!93169)) b!881931))

(assert (=> b!881930 m!821939))

(assert (=> b!881930 m!821941))

(declare-fun m!822151 () Bool)

(assert (=> b!881930 m!822151))

(assert (=> b!881931 m!821939))

(assert (=> b!881931 m!821941))

(declare-fun m!822153 () Bool)

(assert (=> b!881931 m!822153))

(assert (=> b!881737 d!109323))

(declare-fun d!109325 () Bool)

(assert (=> d!109325 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!881727 d!109325))

(declare-fun d!109327 () Bool)

(assert (=> d!109327 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!881736 d!109327))

(declare-fun d!109329 () Bool)

(declare-fun e!490869 () Bool)

(assert (=> d!109329 e!490869))

(declare-fun res!598926 () Bool)

(assert (=> d!109329 (=> (not res!598926) (not e!490869))))

(declare-fun lt!398809 () ListLongMap!10419)

(assert (=> d!109329 (= res!598926 (not (contains!4235 lt!398809 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!490868 () ListLongMap!10419)

(assert (=> d!109329 (= lt!398809 e!490868)))

(declare-fun c!93172 () Bool)

(assert (=> d!109329 (= c!93172 (bvsge from!1053 (size!25140 _keys!868)))))

(assert (=> d!109329 (validMask!0 mask!1196)))

(assert (=> d!109329 (= (getCurrentListMapNoExtraKeys!3265 _keys!868 lt!398692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398809)))

(declare-fun b!881932 () Bool)

(assert (=> b!881932 (= e!490868 (ListLongMap!10420 Nil!17475))))

(declare-fun call!38953 () ListLongMap!10419)

(declare-fun bm!38950 () Bool)

(assert (=> bm!38950 (= call!38953 (getCurrentListMapNoExtraKeys!3265 _keys!868 lt!398692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881933 () Bool)

(declare-fun e!490867 () Bool)

(declare-fun e!490873 () Bool)

(assert (=> b!881933 (= e!490867 e!490873)))

(assert (=> b!881933 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25140 _keys!868)))))

(declare-fun res!598928 () Bool)

(assert (=> b!881933 (= res!598928 (contains!4235 lt!398809 (select (arr!24699 _keys!868) from!1053)))))

(assert (=> b!881933 (=> (not res!598928) (not e!490873))))

(declare-fun b!881934 () Bool)

(declare-fun e!490870 () Bool)

(assert (=> b!881934 (= e!490870 (isEmpty!673 lt!398809))))

(declare-fun b!881935 () Bool)

(assert (=> b!881935 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25140 _keys!868)))))

(assert (=> b!881935 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25141 lt!398692)))))

(assert (=> b!881935 (= e!490873 (= (apply!380 lt!398809 (select (arr!24699 _keys!868) from!1053)) (get!13011 (select (arr!24700 lt!398692) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881936 () Bool)

(assert (=> b!881936 (= e!490867 e!490870)))

(declare-fun c!93171 () Bool)

(assert (=> b!881936 (= c!93171 (bvslt from!1053 (size!25140 _keys!868)))))

(declare-fun b!881937 () Bool)

(declare-fun e!490871 () ListLongMap!10419)

(assert (=> b!881937 (= e!490871 call!38953)))

(declare-fun b!881938 () Bool)

(declare-fun e!490872 () Bool)

(assert (=> b!881938 (= e!490872 (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)))))

(assert (=> b!881938 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!881939 () Bool)

(assert (=> b!881939 (= e!490868 e!490871)))

(declare-fun c!93170 () Bool)

(assert (=> b!881939 (= c!93170 (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)))))

(declare-fun b!881940 () Bool)

(declare-fun lt!398806 () Unit!30046)

(declare-fun lt!398810 () Unit!30046)

(assert (=> b!881940 (= lt!398806 lt!398810)))

(declare-fun lt!398811 () V!28513)

(declare-fun lt!398805 () (_ BitVec 64))

(declare-fun lt!398807 () ListLongMap!10419)

(declare-fun lt!398808 () (_ BitVec 64))

(assert (=> b!881940 (not (contains!4235 (+!2540 lt!398807 (tuple2!11649 lt!398808 lt!398811)) lt!398805))))

(assert (=> b!881940 (= lt!398810 (addStillNotContains!207 lt!398807 lt!398808 lt!398811 lt!398805))))

(assert (=> b!881940 (= lt!398805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881940 (= lt!398811 (get!13011 (select (arr!24700 lt!398692) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881940 (= lt!398808 (select (arr!24699 _keys!868) from!1053))))

(assert (=> b!881940 (= lt!398807 call!38953)))

(assert (=> b!881940 (= e!490871 (+!2540 call!38953 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 lt!398692) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881941 () Bool)

(assert (=> b!881941 (= e!490869 e!490867)))

(declare-fun c!93173 () Bool)

(assert (=> b!881941 (= c!93173 e!490872)))

(declare-fun res!598927 () Bool)

(assert (=> b!881941 (=> (not res!598927) (not e!490872))))

(assert (=> b!881941 (= res!598927 (bvslt from!1053 (size!25140 _keys!868)))))

(declare-fun b!881942 () Bool)

(assert (=> b!881942 (= e!490870 (= lt!398809 (getCurrentListMapNoExtraKeys!3265 _keys!868 lt!398692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881943 () Bool)

(declare-fun res!598929 () Bool)

(assert (=> b!881943 (=> (not res!598929) (not e!490869))))

(assert (=> b!881943 (= res!598929 (not (contains!4235 lt!398809 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109329 c!93172) b!881932))

(assert (= (and d!109329 (not c!93172)) b!881939))

(assert (= (and b!881939 c!93170) b!881940))

(assert (= (and b!881939 (not c!93170)) b!881937))

(assert (= (or b!881940 b!881937) bm!38950))

(assert (= (and d!109329 res!598926) b!881943))

(assert (= (and b!881943 res!598929) b!881941))

(assert (= (and b!881941 res!598927) b!881938))

(assert (= (and b!881941 c!93173) b!881933))

(assert (= (and b!881941 (not c!93173)) b!881936))

(assert (= (and b!881933 res!598928) b!881935))

(assert (= (and b!881936 c!93171) b!881942))

(assert (= (and b!881936 (not c!93171)) b!881934))

(declare-fun b_lambda!12493 () Bool)

(assert (=> (not b_lambda!12493) (not b!881935)))

(assert (=> b!881935 t!24625))

(declare-fun b_and!25359 () Bool)

(assert (= b_and!25357 (and (=> t!24625 result!9643) b_and!25359)))

(declare-fun b_lambda!12495 () Bool)

(assert (=> (not b_lambda!12495) (not b!881940)))

(assert (=> b!881940 t!24625))

(declare-fun b_and!25361 () Bool)

(assert (= b_and!25359 (and (=> t!24625 result!9643) b_and!25361)))

(declare-fun m!822155 () Bool)

(assert (=> b!881942 m!822155))

(assert (=> b!881939 m!821909))

(assert (=> b!881939 m!821909))

(assert (=> b!881939 m!821911))

(declare-fun m!822157 () Bool)

(assert (=> d!109329 m!822157))

(assert (=> d!109329 m!821921))

(assert (=> b!881935 m!821909))

(declare-fun m!822159 () Bool)

(assert (=> b!881935 m!822159))

(declare-fun m!822161 () Bool)

(assert (=> b!881935 m!822161))

(assert (=> b!881935 m!821941))

(declare-fun m!822163 () Bool)

(assert (=> b!881935 m!822163))

(assert (=> b!881935 m!821909))

(assert (=> b!881935 m!822161))

(assert (=> b!881935 m!821941))

(declare-fun m!822165 () Bool)

(assert (=> b!881934 m!822165))

(assert (=> bm!38950 m!822155))

(declare-fun m!822167 () Bool)

(assert (=> b!881943 m!822167))

(assert (=> b!881933 m!821909))

(assert (=> b!881933 m!821909))

(declare-fun m!822169 () Bool)

(assert (=> b!881933 m!822169))

(assert (=> b!881938 m!821909))

(assert (=> b!881938 m!821909))

(assert (=> b!881938 m!821911))

(declare-fun m!822171 () Bool)

(assert (=> b!881940 m!822171))

(declare-fun m!822173 () Bool)

(assert (=> b!881940 m!822173))

(assert (=> b!881940 m!822161))

(assert (=> b!881940 m!821941))

(assert (=> b!881940 m!822163))

(assert (=> b!881940 m!822171))

(declare-fun m!822175 () Bool)

(assert (=> b!881940 m!822175))

(assert (=> b!881940 m!821909))

(assert (=> b!881940 m!822161))

(assert (=> b!881940 m!821941))

(declare-fun m!822177 () Bool)

(assert (=> b!881940 m!822177))

(assert (=> b!881730 d!109329))

(declare-fun d!109331 () Bool)

(declare-fun e!490876 () Bool)

(assert (=> d!109331 e!490876))

(declare-fun res!598930 () Bool)

(assert (=> d!109331 (=> (not res!598930) (not e!490876))))

(declare-fun lt!398816 () ListLongMap!10419)

(assert (=> d!109331 (= res!598930 (not (contains!4235 lt!398816 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!490875 () ListLongMap!10419)

(assert (=> d!109331 (= lt!398816 e!490875)))

(declare-fun c!93176 () Bool)

(assert (=> d!109331 (= c!93176 (bvsge from!1053 (size!25140 _keys!868)))))

(assert (=> d!109331 (validMask!0 mask!1196)))

(assert (=> d!109331 (= (getCurrentListMapNoExtraKeys!3265 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!398816)))

(declare-fun b!881944 () Bool)

(assert (=> b!881944 (= e!490875 (ListLongMap!10420 Nil!17475))))

(declare-fun bm!38951 () Bool)

(declare-fun call!38954 () ListLongMap!10419)

(assert (=> bm!38951 (= call!38954 (getCurrentListMapNoExtraKeys!3265 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!881945 () Bool)

(declare-fun e!490874 () Bool)

(declare-fun e!490880 () Bool)

(assert (=> b!881945 (= e!490874 e!490880)))

(assert (=> b!881945 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25140 _keys!868)))))

(declare-fun res!598932 () Bool)

(assert (=> b!881945 (= res!598932 (contains!4235 lt!398816 (select (arr!24699 _keys!868) from!1053)))))

(assert (=> b!881945 (=> (not res!598932) (not e!490880))))

(declare-fun b!881946 () Bool)

(declare-fun e!490877 () Bool)

(assert (=> b!881946 (= e!490877 (isEmpty!673 lt!398816))))

(declare-fun b!881947 () Bool)

(assert (=> b!881947 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25140 _keys!868)))))

(assert (=> b!881947 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25141 _values!688)))))

(assert (=> b!881947 (= e!490880 (= (apply!380 lt!398816 (select (arr!24699 _keys!868) from!1053)) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!881948 () Bool)

(assert (=> b!881948 (= e!490874 e!490877)))

(declare-fun c!93175 () Bool)

(assert (=> b!881948 (= c!93175 (bvslt from!1053 (size!25140 _keys!868)))))

(declare-fun b!881949 () Bool)

(declare-fun e!490878 () ListLongMap!10419)

(assert (=> b!881949 (= e!490878 call!38954)))

(declare-fun b!881950 () Bool)

(declare-fun e!490879 () Bool)

(assert (=> b!881950 (= e!490879 (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)))))

(assert (=> b!881950 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!881951 () Bool)

(assert (=> b!881951 (= e!490875 e!490878)))

(declare-fun c!93174 () Bool)

(assert (=> b!881951 (= c!93174 (validKeyInArray!0 (select (arr!24699 _keys!868) from!1053)))))

(declare-fun b!881952 () Bool)

(declare-fun lt!398813 () Unit!30046)

(declare-fun lt!398817 () Unit!30046)

(assert (=> b!881952 (= lt!398813 lt!398817)))

(declare-fun lt!398812 () (_ BitVec 64))

(declare-fun lt!398818 () V!28513)

(declare-fun lt!398814 () ListLongMap!10419)

(declare-fun lt!398815 () (_ BitVec 64))

(assert (=> b!881952 (not (contains!4235 (+!2540 lt!398814 (tuple2!11649 lt!398815 lt!398818)) lt!398812))))

(assert (=> b!881952 (= lt!398817 (addStillNotContains!207 lt!398814 lt!398815 lt!398818 lt!398812))))

(assert (=> b!881952 (= lt!398812 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!881952 (= lt!398818 (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!881952 (= lt!398815 (select (arr!24699 _keys!868) from!1053))))

(assert (=> b!881952 (= lt!398814 call!38954)))

(assert (=> b!881952 (= e!490878 (+!2540 call!38954 (tuple2!11649 (select (arr!24699 _keys!868) from!1053) (get!13011 (select (arr!24700 _values!688) from!1053) (dynLambda!1264 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881953 () Bool)

(assert (=> b!881953 (= e!490876 e!490874)))

(declare-fun c!93177 () Bool)

(assert (=> b!881953 (= c!93177 e!490879)))

(declare-fun res!598931 () Bool)

(assert (=> b!881953 (=> (not res!598931) (not e!490879))))

(assert (=> b!881953 (= res!598931 (bvslt from!1053 (size!25140 _keys!868)))))

(declare-fun b!881954 () Bool)

(assert (=> b!881954 (= e!490877 (= lt!398816 (getCurrentListMapNoExtraKeys!3265 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!881955 () Bool)

(declare-fun res!598933 () Bool)

(assert (=> b!881955 (=> (not res!598933) (not e!490876))))

(assert (=> b!881955 (= res!598933 (not (contains!4235 lt!398816 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109331 c!93176) b!881944))

(assert (= (and d!109331 (not c!93176)) b!881951))

(assert (= (and b!881951 c!93174) b!881952))

(assert (= (and b!881951 (not c!93174)) b!881949))

(assert (= (or b!881952 b!881949) bm!38951))

(assert (= (and d!109331 res!598930) b!881955))

(assert (= (and b!881955 res!598933) b!881953))

(assert (= (and b!881953 res!598931) b!881950))

(assert (= (and b!881953 c!93177) b!881945))

(assert (= (and b!881953 (not c!93177)) b!881948))

(assert (= (and b!881945 res!598932) b!881947))

(assert (= (and b!881948 c!93175) b!881954))

(assert (= (and b!881948 (not c!93175)) b!881946))

(declare-fun b_lambda!12497 () Bool)

(assert (=> (not b_lambda!12497) (not b!881947)))

(assert (=> b!881947 t!24625))

(declare-fun b_and!25363 () Bool)

(assert (= b_and!25361 (and (=> t!24625 result!9643) b_and!25363)))

(declare-fun b_lambda!12499 () Bool)

(assert (=> (not b_lambda!12499) (not b!881952)))

(assert (=> b!881952 t!24625))

(declare-fun b_and!25365 () Bool)

(assert (= b_and!25363 (and (=> t!24625 result!9643) b_and!25365)))

(declare-fun m!822179 () Bool)

(assert (=> b!881954 m!822179))

(assert (=> b!881951 m!821909))

(assert (=> b!881951 m!821909))

(assert (=> b!881951 m!821911))

(declare-fun m!822181 () Bool)

(assert (=> d!109331 m!822181))

(assert (=> d!109331 m!821921))

(assert (=> b!881947 m!821909))

(declare-fun m!822183 () Bool)

(assert (=> b!881947 m!822183))

(assert (=> b!881947 m!821939))

(assert (=> b!881947 m!821941))

(assert (=> b!881947 m!821943))

(assert (=> b!881947 m!821909))

(assert (=> b!881947 m!821939))

(assert (=> b!881947 m!821941))

(declare-fun m!822185 () Bool)

(assert (=> b!881946 m!822185))

(assert (=> bm!38951 m!822179))

(declare-fun m!822187 () Bool)

(assert (=> b!881955 m!822187))

(assert (=> b!881945 m!821909))

(assert (=> b!881945 m!821909))

(declare-fun m!822189 () Bool)

(assert (=> b!881945 m!822189))

(assert (=> b!881950 m!821909))

(assert (=> b!881950 m!821909))

(assert (=> b!881950 m!821911))

(declare-fun m!822191 () Bool)

(assert (=> b!881952 m!822191))

(declare-fun m!822193 () Bool)

(assert (=> b!881952 m!822193))

(assert (=> b!881952 m!821939))

(assert (=> b!881952 m!821941))

(assert (=> b!881952 m!821943))

(assert (=> b!881952 m!822191))

(declare-fun m!822195 () Bool)

(assert (=> b!881952 m!822195))

(assert (=> b!881952 m!821909))

(assert (=> b!881952 m!821939))

(assert (=> b!881952 m!821941))

(declare-fun m!822197 () Bool)

(assert (=> b!881952 m!822197))

(assert (=> b!881730 d!109331))

(declare-fun mapIsEmpty!28029 () Bool)

(declare-fun mapRes!28029 () Bool)

(assert (=> mapIsEmpty!28029 mapRes!28029))

(declare-fun condMapEmpty!28029 () Bool)

(declare-fun mapDefault!28029 () ValueCell!8360)

(assert (=> mapNonEmpty!28020 (= condMapEmpty!28029 (= mapRest!28020 ((as const (Array (_ BitVec 32) ValueCell!8360)) mapDefault!28029)))))

(declare-fun e!490886 () Bool)

(assert (=> mapNonEmpty!28020 (= tp!53753 (and e!490886 mapRes!28029))))

(declare-fun mapNonEmpty!28029 () Bool)

(declare-fun tp!53769 () Bool)

(declare-fun e!490885 () Bool)

(assert (=> mapNonEmpty!28029 (= mapRes!28029 (and tp!53769 e!490885))))

(declare-fun mapValue!28029 () ValueCell!8360)

(declare-fun mapRest!28029 () (Array (_ BitVec 32) ValueCell!8360))

(declare-fun mapKey!28029 () (_ BitVec 32))

(assert (=> mapNonEmpty!28029 (= mapRest!28020 (store mapRest!28029 mapKey!28029 mapValue!28029))))

(declare-fun b!881962 () Bool)

(assert (=> b!881962 (= e!490885 tp_is_empty!17599)))

(declare-fun b!881963 () Bool)

(assert (=> b!881963 (= e!490886 tp_is_empty!17599)))

(assert (= (and mapNonEmpty!28020 condMapEmpty!28029) mapIsEmpty!28029))

(assert (= (and mapNonEmpty!28020 (not condMapEmpty!28029)) mapNonEmpty!28029))

(assert (= (and mapNonEmpty!28029 ((_ is ValueCellFull!8360) mapValue!28029)) b!881962))

(assert (= (and mapNonEmpty!28020 ((_ is ValueCellFull!8360) mapDefault!28029)) b!881963))

(declare-fun m!822199 () Bool)

(assert (=> mapNonEmpty!28029 m!822199))

(declare-fun b_lambda!12501 () Bool)

(assert (= b_lambda!12485 (or (and start!74874 b_free!15355) b_lambda!12501)))

(declare-fun b_lambda!12503 () Bool)

(assert (= b_lambda!12491 (or (and start!74874 b_free!15355) b_lambda!12503)))

(declare-fun b_lambda!12505 () Bool)

(assert (= b_lambda!12497 (or (and start!74874 b_free!15355) b_lambda!12505)))

(declare-fun b_lambda!12507 () Bool)

(assert (= b_lambda!12493 (or (and start!74874 b_free!15355) b_lambda!12507)))

(declare-fun b_lambda!12509 () Bool)

(assert (= b_lambda!12495 (or (and start!74874 b_free!15355) b_lambda!12509)))

(declare-fun b_lambda!12511 () Bool)

(assert (= b_lambda!12499 (or (and start!74874 b_free!15355) b_lambda!12511)))

(declare-fun b_lambda!12513 () Bool)

(assert (= b_lambda!12487 (or (and start!74874 b_free!15355) b_lambda!12513)))

(declare-fun b_lambda!12515 () Bool)

(assert (= b_lambda!12489 (or (and start!74874 b_free!15355) b_lambda!12515)))

(check-sat (not b!881856) (not d!109331) (not b_lambda!12509) (not b_next!15355) (not bm!38949) (not b!881934) (not bm!38946) (not b_lambda!12505) (not b!881955) (not b!881907) (not b_lambda!12507) (not b!881922) (not bm!38942) (not mapNonEmpty!28029) (not bm!38951) (not d!109329) (not b_lambda!12483) (not b!881942) (not b!881855) (not b!881933) (not b!881861) (not b!881925) (not d!109305) (not b!881876) (not b!881875) b_and!25365 (not b!881940) (not b!881950) (not b_lambda!12501) (not bm!38950) (not b!881890) (not b!881951) (not b!881863) (not d!109321) (not b!881868) (not d!109299) (not b!881938) (not b!881884) (not bm!38935) (not b_lambda!12511) (not b!881954) (not b!881905) (not b!881902) (not bm!38936) (not b!881952) (not d!109301) (not b!881921) (not b_lambda!12503) tp_is_empty!17599 (not d!109303) (not b!881935) (not b_lambda!12513) (not bm!38941) (not b!881908) (not b!881864) (not b_lambda!12515) (not b!881871) (not b!881859) (not b!881924) (not b!881939) (not b!881873) (not b!881943) (not bm!38945) (not b!881860) (not b!881872) (not b!881903) (not b!881854) (not b!881947) (not b!881891) (not b!881945) (not b!881946) (not d!109311) (not b!881930) (not b!881867) (not b!881931) (not b!881866) (not b!881910))
(check-sat b_and!25365 (not b_next!15355))
