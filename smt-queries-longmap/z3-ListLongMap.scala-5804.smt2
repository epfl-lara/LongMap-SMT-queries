; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74898 () Bool)

(assert start!74898)

(declare-fun b_free!15417 () Bool)

(declare-fun b_next!15417 () Bool)

(assert (=> start!74898 (= b_free!15417 (not b_next!15417))))

(declare-fun tp!53954 () Bool)

(declare-fun b_and!25533 () Bool)

(assert (=> start!74898 (= tp!53954 b_and!25533)))

(declare-fun b!882992 () Bool)

(declare-fun e!491432 () Bool)

(declare-fun e!491438 () Bool)

(assert (=> b!882992 (= e!491432 e!491438)))

(declare-fun res!599886 () Bool)

(assert (=> b!882992 (=> (not res!599886) (not e!491438))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!882992 (= res!599886 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28595 0))(
  ( (V!28596 (val!8878 Int)) )
))
(declare-datatypes ((ValueCell!8391 0))(
  ( (ValueCellFull!8391 (v!11347 V!28595)) (EmptyCell!8391) )
))
(declare-datatypes ((array!51448 0))(
  ( (array!51449 (arr!24743 (Array (_ BitVec 32) ValueCell!8391)) (size!25183 (_ BitVec 32))) )
))
(declare-fun lt!399548 () array!51448)

(declare-datatypes ((array!51450 0))(
  ( (array!51451 (arr!24744 (Array (_ BitVec 32) (_ BitVec 64))) (size!25184 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51450)

(declare-datatypes ((tuple2!11758 0))(
  ( (tuple2!11759 (_1!5890 (_ BitVec 64)) (_2!5890 V!28595)) )
))
(declare-datatypes ((List!17567 0))(
  ( (Nil!17564) (Cons!17563 (h!18694 tuple2!11758) (t!24786 List!17567)) )
))
(declare-datatypes ((ListLongMap!10527 0))(
  ( (ListLongMap!10528 (toList!5279 List!17567)) )
))
(declare-fun lt!399545 () ListLongMap!10527)

(declare-fun minValue!654 () V!28595)

(declare-fun zeroValue!654 () V!28595)

(declare-fun getCurrentListMapNoExtraKeys!3240 (array!51450 array!51448 (_ BitVec 32) (_ BitVec 32) V!28595 V!28595 (_ BitVec 32) Int) ListLongMap!10527)

(assert (=> b!882992 (= lt!399545 (getCurrentListMapNoExtraKeys!3240 _keys!868 lt!399548 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28595)

(declare-fun _values!688 () array!51448)

(assert (=> b!882992 (= lt!399548 (array!51449 (store (arr!24743 _values!688) i!612 (ValueCellFull!8391 v!557)) (size!25183 _values!688)))))

(declare-fun lt!399549 () ListLongMap!10527)

(assert (=> b!882992 (= lt!399549 (getCurrentListMapNoExtraKeys!3240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882993 () Bool)

(declare-fun res!599885 () Bool)

(assert (=> b!882993 (=> (not res!599885) (not e!491432))))

(assert (=> b!882993 (= res!599885 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25184 _keys!868))))))

(declare-fun b!882994 () Bool)

(declare-fun res!599890 () Bool)

(assert (=> b!882994 (=> (not res!599890) (not e!491432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882994 (= res!599890 (validMask!0 mask!1196))))

(declare-fun b!882995 () Bool)

(declare-fun e!491433 () Bool)

(declare-fun e!491439 () Bool)

(assert (=> b!882995 (= e!491433 e!491439)))

(declare-fun res!599883 () Bool)

(assert (=> b!882995 (=> res!599883 e!491439)))

(assert (=> b!882995 (= res!599883 (or (bvsge (size!25184 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25184 _keys!868)) (bvsge from!1053 (size!25184 _keys!868))))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!51450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882995 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!30112 0))(
  ( (Unit!30113) )
))
(declare-fun lt!399546 () Unit!30112)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51450 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30112)

(assert (=> b!882995 (= lt!399546 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!17568 0))(
  ( (Nil!17565) (Cons!17564 (h!18695 (_ BitVec 64)) (t!24787 List!17568)) )
))
(declare-fun arrayNoDuplicates!0 (array!51450 (_ BitVec 32) List!17568) Bool)

(assert (=> b!882995 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17565)))

(declare-fun lt!399543 () Unit!30112)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51450 (_ BitVec 32) (_ BitVec 32)) Unit!30112)

(assert (=> b!882995 (= lt!399543 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapNonEmpty!28128 () Bool)

(declare-fun mapRes!28128 () Bool)

(declare-fun tp!53953 () Bool)

(declare-fun e!491437 () Bool)

(assert (=> mapNonEmpty!28128 (= mapRes!28128 (and tp!53953 e!491437))))

(declare-fun mapKey!28128 () (_ BitVec 32))

(declare-fun mapValue!28128 () ValueCell!8391)

(declare-fun mapRest!28128 () (Array (_ BitVec 32) ValueCell!8391))

(assert (=> mapNonEmpty!28128 (= (arr!24743 _values!688) (store mapRest!28128 mapKey!28128 mapValue!28128))))

(declare-fun b!882996 () Bool)

(declare-fun res!599879 () Bool)

(assert (=> b!882996 (=> (not res!599879) (not e!491432))))

(assert (=> b!882996 (= res!599879 (and (= (size!25183 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25184 _keys!868) (size!25183 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28128 () Bool)

(assert (=> mapIsEmpty!28128 mapRes!28128))

(declare-fun b!882997 () Bool)

(declare-fun tp_is_empty!17661 () Bool)

(assert (=> b!882997 (= e!491437 tp_is_empty!17661)))

(declare-fun res!599887 () Bool)

(assert (=> start!74898 (=> (not res!599887) (not e!491432))))

(assert (=> start!74898 (= res!599887 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25184 _keys!868))))))

(assert (=> start!74898 e!491432))

(assert (=> start!74898 tp_is_empty!17661))

(assert (=> start!74898 true))

(assert (=> start!74898 tp!53954))

(declare-fun array_inv!19480 (array!51450) Bool)

(assert (=> start!74898 (array_inv!19480 _keys!868)))

(declare-fun e!491435 () Bool)

(declare-fun array_inv!19481 (array!51448) Bool)

(assert (=> start!74898 (and (array_inv!19481 _values!688) e!491435)))

(declare-fun b!882998 () Bool)

(declare-fun e!491431 () Bool)

(assert (=> b!882998 (= e!491435 (and e!491431 mapRes!28128))))

(declare-fun condMapEmpty!28128 () Bool)

(declare-fun mapDefault!28128 () ValueCell!8391)

(assert (=> b!882998 (= condMapEmpty!28128 (= (arr!24743 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8391)) mapDefault!28128)))))

(declare-fun b!882999 () Bool)

(assert (=> b!882999 (= e!491439 true)))

(declare-fun lt!399542 () Bool)

(declare-fun contains!4276 (List!17568 (_ BitVec 64)) Bool)

(assert (=> b!882999 (= lt!399542 (contains!4276 Nil!17565 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!883000 () Bool)

(declare-fun res!599884 () Bool)

(assert (=> b!883000 (=> res!599884 e!491439)))

(declare-fun noDuplicate!1325 (List!17568) Bool)

(assert (=> b!883000 (= res!599884 (not (noDuplicate!1325 Nil!17565)))))

(declare-fun b!883001 () Bool)

(declare-fun res!599889 () Bool)

(assert (=> b!883001 (=> (not res!599889) (not e!491432))))

(assert (=> b!883001 (= res!599889 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17565))))

(declare-fun b!883002 () Bool)

(declare-fun e!491434 () Bool)

(assert (=> b!883002 (= e!491434 e!491433)))

(declare-fun res!599891 () Bool)

(assert (=> b!883002 (=> res!599891 e!491433)))

(assert (=> b!883002 (= res!599891 (not (= (select (arr!24744 _keys!868) from!1053) k0!854)))))

(declare-fun lt!399547 () ListLongMap!10527)

(declare-fun +!2548 (ListLongMap!10527 tuple2!11758) ListLongMap!10527)

(declare-fun get!13032 (ValueCell!8391 V!28595) V!28595)

(declare-fun dynLambda!1261 (Int (_ BitVec 64)) V!28595)

(assert (=> b!883002 (= lt!399545 (+!2548 lt!399547 (tuple2!11759 (select (arr!24744 _keys!868) from!1053) (get!13032 (select (arr!24743 _values!688) from!1053) (dynLambda!1261 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883003 () Bool)

(assert (=> b!883003 (= e!491431 tp_is_empty!17661)))

(declare-fun b!883004 () Bool)

(declare-fun res!599882 () Bool)

(assert (=> b!883004 (=> (not res!599882) (not e!491432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883004 (= res!599882 (validKeyInArray!0 k0!854))))

(declare-fun b!883005 () Bool)

(declare-fun res!599888 () Bool)

(assert (=> b!883005 (=> (not res!599888) (not e!491432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51450 (_ BitVec 32)) Bool)

(assert (=> b!883005 (= res!599888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883006 () Bool)

(declare-fun res!599892 () Bool)

(assert (=> b!883006 (=> (not res!599892) (not e!491432))))

(assert (=> b!883006 (= res!599892 (and (= (select (arr!24744 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883007 () Bool)

(assert (=> b!883007 (= e!491438 (not e!491434))))

(declare-fun res!599881 () Bool)

(assert (=> b!883007 (=> res!599881 e!491434)))

(assert (=> b!883007 (= res!599881 (not (validKeyInArray!0 (select (arr!24744 _keys!868) from!1053))))))

(declare-fun lt!399550 () ListLongMap!10527)

(assert (=> b!883007 (= lt!399550 lt!399547)))

(declare-fun lt!399544 () ListLongMap!10527)

(assert (=> b!883007 (= lt!399547 (+!2548 lt!399544 (tuple2!11759 k0!854 v!557)))))

(assert (=> b!883007 (= lt!399550 (getCurrentListMapNoExtraKeys!3240 _keys!868 lt!399548 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883007 (= lt!399544 (getCurrentListMapNoExtraKeys!3240 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399551 () Unit!30112)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!735 (array!51450 array!51448 (_ BitVec 32) (_ BitVec 32) V!28595 V!28595 (_ BitVec 32) (_ BitVec 64) V!28595 (_ BitVec 32) Int) Unit!30112)

(assert (=> b!883007 (= lt!399551 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!735 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883008 () Bool)

(declare-fun res!599880 () Bool)

(assert (=> b!883008 (=> res!599880 e!491439)))

(assert (=> b!883008 (= res!599880 (contains!4276 Nil!17565 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!74898 res!599887) b!882994))

(assert (= (and b!882994 res!599890) b!882996))

(assert (= (and b!882996 res!599879) b!883005))

(assert (= (and b!883005 res!599888) b!883001))

(assert (= (and b!883001 res!599889) b!882993))

(assert (= (and b!882993 res!599885) b!883004))

(assert (= (and b!883004 res!599882) b!883006))

(assert (= (and b!883006 res!599892) b!882992))

(assert (= (and b!882992 res!599886) b!883007))

(assert (= (and b!883007 (not res!599881)) b!883002))

(assert (= (and b!883002 (not res!599891)) b!882995))

(assert (= (and b!882995 (not res!599883)) b!883000))

(assert (= (and b!883000 (not res!599884)) b!883008))

(assert (= (and b!883008 (not res!599880)) b!882999))

(assert (= (and b!882998 condMapEmpty!28128) mapIsEmpty!28128))

(assert (= (and b!882998 (not condMapEmpty!28128)) mapNonEmpty!28128))

(get-info :version)

(assert (= (and mapNonEmpty!28128 ((_ is ValueCellFull!8391) mapValue!28128)) b!882997))

(assert (= (and b!882998 ((_ is ValueCellFull!8391) mapDefault!28128)) b!883003))

(assert (= start!74898 b!882998))

(declare-fun b_lambda!12695 () Bool)

(assert (=> (not b_lambda!12695) (not b!883002)))

(declare-fun t!24785 () Bool)

(declare-fun tb!5075 () Bool)

(assert (=> (and start!74898 (= defaultEntry!696 defaultEntry!696) t!24785) tb!5075))

(declare-fun result!9785 () Bool)

(assert (=> tb!5075 (= result!9785 tp_is_empty!17661)))

(assert (=> b!883002 t!24785))

(declare-fun b_and!25535 () Bool)

(assert (= b_and!25533 (and (=> t!24785 result!9785) b_and!25535)))

(declare-fun m!822997 () Bool)

(assert (=> start!74898 m!822997))

(declare-fun m!822999 () Bool)

(assert (=> start!74898 m!822999))

(declare-fun m!823001 () Bool)

(assert (=> b!883004 m!823001))

(declare-fun m!823003 () Bool)

(assert (=> b!883001 m!823003))

(declare-fun m!823005 () Bool)

(assert (=> mapNonEmpty!28128 m!823005))

(declare-fun m!823007 () Bool)

(assert (=> b!882995 m!823007))

(declare-fun m!823009 () Bool)

(assert (=> b!882995 m!823009))

(declare-fun m!823011 () Bool)

(assert (=> b!882995 m!823011))

(declare-fun m!823013 () Bool)

(assert (=> b!882995 m!823013))

(declare-fun m!823015 () Bool)

(assert (=> b!883007 m!823015))

(declare-fun m!823017 () Bool)

(assert (=> b!883007 m!823017))

(declare-fun m!823019 () Bool)

(assert (=> b!883007 m!823019))

(declare-fun m!823021 () Bool)

(assert (=> b!883007 m!823021))

(declare-fun m!823023 () Bool)

(assert (=> b!883007 m!823023))

(assert (=> b!883007 m!823021))

(declare-fun m!823025 () Bool)

(assert (=> b!883007 m!823025))

(declare-fun m!823027 () Bool)

(assert (=> b!883008 m!823027))

(declare-fun m!823029 () Bool)

(assert (=> b!883000 m!823029))

(declare-fun m!823031 () Bool)

(assert (=> b!883005 m!823031))

(declare-fun m!823033 () Bool)

(assert (=> b!882994 m!823033))

(declare-fun m!823035 () Bool)

(assert (=> b!882999 m!823035))

(declare-fun m!823037 () Bool)

(assert (=> b!883006 m!823037))

(declare-fun m!823039 () Bool)

(assert (=> b!883002 m!823039))

(declare-fun m!823041 () Bool)

(assert (=> b!883002 m!823041))

(declare-fun m!823043 () Bool)

(assert (=> b!883002 m!823043))

(declare-fun m!823045 () Bool)

(assert (=> b!883002 m!823045))

(assert (=> b!883002 m!823041))

(assert (=> b!883002 m!823021))

(assert (=> b!883002 m!823043))

(declare-fun m!823047 () Bool)

(assert (=> b!882992 m!823047))

(declare-fun m!823049 () Bool)

(assert (=> b!882992 m!823049))

(declare-fun m!823051 () Bool)

(assert (=> b!882992 m!823051))

(check-sat (not b!882995) (not b!883000) b_and!25535 tp_is_empty!17661 (not b!883007) (not b!882994) (not b_next!15417) (not start!74898) (not mapNonEmpty!28128) (not b!882992) (not b!883002) (not b!883001) (not b_lambda!12695) (not b!883005) (not b!883004) (not b!882999) (not b!883008))
(check-sat b_and!25535 (not b_next!15417))
