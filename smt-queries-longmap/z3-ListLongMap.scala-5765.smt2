; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74606 () Bool)

(assert start!74606)

(declare-fun b_free!15181 () Bool)

(declare-fun b_next!15181 () Bool)

(assert (=> start!74606 (= b_free!15181 (not b_next!15181))))

(declare-fun tp!53222 () Bool)

(declare-fun b_and!25025 () Bool)

(assert (=> start!74606 (= tp!53222 b_and!25025)))

(declare-fun b!877667 () Bool)

(declare-fun res!596104 () Bool)

(declare-fun e!488638 () Bool)

(assert (=> b!877667 (=> (not res!596104) (not e!488638))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877667 (= res!596104 (validKeyInArray!0 k0!854))))

(declare-fun b!877668 () Bool)

(declare-fun res!596112 () Bool)

(assert (=> b!877668 (=> (not res!596112) (not e!488638))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51019 0))(
  ( (array!51020 (arr!24532 (Array (_ BitVec 32) (_ BitVec 64))) (size!24973 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51019)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!877668 (= res!596112 (and (= (select (arr!24532 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-datatypes ((V!28281 0))(
  ( (V!28282 (val!8760 Int)) )
))
(declare-datatypes ((tuple2!11518 0))(
  ( (tuple2!11519 (_1!5770 (_ BitVec 64)) (_2!5770 V!28281)) )
))
(declare-datatypes ((List!17355 0))(
  ( (Nil!17352) (Cons!17351 (h!18488 tuple2!11518) (t!24432 List!17355)) )
))
(declare-datatypes ((ListLongMap!10289 0))(
  ( (ListLongMap!10290 (toList!5160 List!17355)) )
))
(declare-fun call!38831 () ListLongMap!10289)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8273 0))(
  ( (ValueCellFull!8273 (v!11193 V!28281)) (EmptyCell!8273) )
))
(declare-datatypes ((array!51021 0))(
  ( (array!51022 (arr!24533 (Array (_ BitVec 32) ValueCell!8273)) (size!24974 (_ BitVec 32))) )
))
(declare-fun lt!397049 () array!51021)

(declare-fun minValue!654 () V!28281)

(declare-fun zeroValue!654 () V!28281)

(declare-fun bm!38828 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3202 (array!51019 array!51021 (_ BitVec 32) (_ BitVec 32) V!28281 V!28281 (_ BitVec 32) Int) ListLongMap!10289)

(assert (=> bm!38828 (= call!38831 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877669 () Bool)

(declare-fun e!488639 () Bool)

(declare-fun call!38832 () ListLongMap!10289)

(assert (=> b!877669 (= e!488639 (= call!38831 call!38832))))

(declare-fun res!596105 () Bool)

(assert (=> start!74606 (=> (not res!596105) (not e!488638))))

(assert (=> start!74606 (= res!596105 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24973 _keys!868))))))

(assert (=> start!74606 e!488638))

(declare-fun tp_is_empty!17425 () Bool)

(assert (=> start!74606 tp_is_empty!17425))

(assert (=> start!74606 true))

(assert (=> start!74606 tp!53222))

(declare-fun array_inv!19388 (array!51019) Bool)

(assert (=> start!74606 (array_inv!19388 _keys!868)))

(declare-fun _values!688 () array!51021)

(declare-fun e!488642 () Bool)

(declare-fun array_inv!19389 (array!51021) Bool)

(assert (=> start!74606 (and (array_inv!19389 _values!688) e!488642)))

(declare-fun b!877670 () Bool)

(declare-fun res!596106 () Bool)

(assert (=> b!877670 (=> (not res!596106) (not e!488638))))

(assert (=> b!877670 (= res!596106 (and (= (size!24974 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24973 _keys!868) (size!24974 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877671 () Bool)

(declare-fun v!557 () V!28281)

(declare-fun +!2505 (ListLongMap!10289 tuple2!11518) ListLongMap!10289)

(assert (=> b!877671 (= e!488639 (= call!38831 (+!2505 call!38832 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!877672 () Bool)

(declare-fun res!596113 () Bool)

(assert (=> b!877672 (=> (not res!596113) (not e!488638))))

(assert (=> b!877672 (= res!596113 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24973 _keys!868))))))

(declare-fun b!877673 () Bool)

(declare-fun e!488641 () Bool)

(declare-fun e!488636 () Bool)

(assert (=> b!877673 (= e!488641 (not e!488636))))

(declare-fun res!596109 () Bool)

(assert (=> b!877673 (=> res!596109 e!488636)))

(assert (=> b!877673 (= res!596109 (not (validKeyInArray!0 (select (arr!24532 _keys!868) from!1053))))))

(assert (=> b!877673 e!488639))

(declare-fun c!92903 () Bool)

(assert (=> b!877673 (= c!92903 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29960 0))(
  ( (Unit!29961) )
))
(declare-fun lt!397046 () Unit!29960)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!673 (array!51019 array!51021 (_ BitVec 32) (_ BitVec 32) V!28281 V!28281 (_ BitVec 32) (_ BitVec 64) V!28281 (_ BitVec 32) Int) Unit!29960)

(assert (=> b!877673 (= lt!397046 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!673 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877674 () Bool)

(declare-fun res!596108 () Bool)

(assert (=> b!877674 (=> (not res!596108) (not e!488638))))

(declare-datatypes ((List!17356 0))(
  ( (Nil!17353) (Cons!17352 (h!18489 (_ BitVec 64)) (t!24433 List!17356)) )
))
(declare-fun arrayNoDuplicates!0 (array!51019 (_ BitVec 32) List!17356) Bool)

(assert (=> b!877674 (= res!596108 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17353))))

(declare-fun b!877675 () Bool)

(declare-fun e!488637 () Bool)

(declare-fun mapRes!27749 () Bool)

(assert (=> b!877675 (= e!488642 (and e!488637 mapRes!27749))))

(declare-fun condMapEmpty!27749 () Bool)

(declare-fun mapDefault!27749 () ValueCell!8273)

(assert (=> b!877675 (= condMapEmpty!27749 (= (arr!24533 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8273)) mapDefault!27749)))))

(declare-fun mapIsEmpty!27749 () Bool)

(assert (=> mapIsEmpty!27749 mapRes!27749))

(declare-fun b!877676 () Bool)

(declare-fun e!488643 () Bool)

(assert (=> b!877676 (= e!488643 tp_is_empty!17425)))

(declare-fun b!877677 () Bool)

(declare-fun res!596107 () Bool)

(assert (=> b!877677 (=> (not res!596107) (not e!488638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877677 (= res!596107 (validMask!0 mask!1196))))

(declare-fun bm!38829 () Bool)

(assert (=> bm!38829 (= call!38832 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877678 () Bool)

(assert (=> b!877678 (= e!488638 e!488641)))

(declare-fun res!596110 () Bool)

(assert (=> b!877678 (=> (not res!596110) (not e!488641))))

(assert (=> b!877678 (= res!596110 (= from!1053 i!612))))

(declare-fun lt!397045 () ListLongMap!10289)

(assert (=> b!877678 (= lt!397045 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!877678 (= lt!397049 (array!51022 (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24974 _values!688)))))

(declare-fun lt!397054 () ListLongMap!10289)

(assert (=> b!877678 (= lt!397054 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877679 () Bool)

(declare-fun res!596111 () Bool)

(assert (=> b!877679 (=> (not res!596111) (not e!488638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51019 (_ BitVec 32)) Bool)

(assert (=> b!877679 (= res!596111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877680 () Bool)

(assert (=> b!877680 (= e!488637 tp_is_empty!17425)))

(declare-fun b!877681 () Bool)

(assert (=> b!877681 (= e!488636 (= lt!397045 (+!2505 lt!397054 (tuple2!11519 k0!854 v!557))))))

(declare-fun lt!397053 () ListLongMap!10289)

(declare-fun lt!397048 () tuple2!11518)

(declare-fun lt!397052 () V!28281)

(assert (=> b!877681 (= (+!2505 lt!397053 lt!397048) (+!2505 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)) lt!397048))))

(declare-fun lt!397047 () V!28281)

(assert (=> b!877681 (= lt!397048 (tuple2!11519 k0!854 lt!397047))))

(declare-fun lt!397050 () Unit!29960)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!340 (ListLongMap!10289 (_ BitVec 64) V!28281 V!28281) Unit!29960)

(assert (=> b!877681 (= lt!397050 (addSameAsAddTwiceSameKeyDiffValues!340 lt!397053 k0!854 lt!397052 lt!397047))))

(declare-fun lt!397051 () V!28281)

(declare-fun get!12922 (ValueCell!8273 V!28281) V!28281)

(assert (=> b!877681 (= lt!397052 (get!12922 (select (arr!24533 _values!688) from!1053) lt!397051))))

(assert (=> b!877681 (= lt!397045 (+!2505 lt!397053 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))

(assert (=> b!877681 (= lt!397047 (get!12922 (select (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!397051))))

(declare-fun dynLambda!1240 (Int (_ BitVec 64)) V!28281)

(assert (=> b!877681 (= lt!397051 (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877681 (= lt!397053 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27749 () Bool)

(declare-fun tp!53221 () Bool)

(assert (=> mapNonEmpty!27749 (= mapRes!27749 (and tp!53221 e!488643))))

(declare-fun mapRest!27749 () (Array (_ BitVec 32) ValueCell!8273))

(declare-fun mapValue!27749 () ValueCell!8273)

(declare-fun mapKey!27749 () (_ BitVec 32))

(assert (=> mapNonEmpty!27749 (= (arr!24533 _values!688) (store mapRest!27749 mapKey!27749 mapValue!27749))))

(assert (= (and start!74606 res!596105) b!877677))

(assert (= (and b!877677 res!596107) b!877670))

(assert (= (and b!877670 res!596106) b!877679))

(assert (= (and b!877679 res!596111) b!877674))

(assert (= (and b!877674 res!596108) b!877672))

(assert (= (and b!877672 res!596113) b!877667))

(assert (= (and b!877667 res!596104) b!877668))

(assert (= (and b!877668 res!596112) b!877678))

(assert (= (and b!877678 res!596110) b!877673))

(assert (= (and b!877673 c!92903) b!877671))

(assert (= (and b!877673 (not c!92903)) b!877669))

(assert (= (or b!877671 b!877669) bm!38828))

(assert (= (or b!877671 b!877669) bm!38829))

(assert (= (and b!877673 (not res!596109)) b!877681))

(assert (= (and b!877675 condMapEmpty!27749) mapIsEmpty!27749))

(assert (= (and b!877675 (not condMapEmpty!27749)) mapNonEmpty!27749))

(get-info :version)

(assert (= (and mapNonEmpty!27749 ((_ is ValueCellFull!8273) mapValue!27749)) b!877676))

(assert (= (and b!877675 ((_ is ValueCellFull!8273) mapDefault!27749)) b!877680))

(assert (= start!74606 b!877675))

(declare-fun b_lambda!12263 () Bool)

(assert (=> (not b_lambda!12263) (not b!877681)))

(declare-fun t!24431 () Bool)

(declare-fun tb!4933 () Bool)

(assert (=> (and start!74606 (= defaultEntry!696 defaultEntry!696) t!24431) tb!4933))

(declare-fun result!9493 () Bool)

(assert (=> tb!4933 (= result!9493 tp_is_empty!17425)))

(assert (=> b!877681 t!24431))

(declare-fun b_and!25027 () Bool)

(assert (= b_and!25025 (and (=> t!24431 result!9493) b_and!25027)))

(declare-fun m!817857 () Bool)

(assert (=> bm!38829 m!817857))

(declare-fun m!817859 () Bool)

(assert (=> b!877681 m!817859))

(declare-fun m!817861 () Bool)

(assert (=> b!877681 m!817861))

(declare-fun m!817863 () Bool)

(assert (=> b!877681 m!817863))

(assert (=> b!877681 m!817863))

(declare-fun m!817865 () Bool)

(assert (=> b!877681 m!817865))

(declare-fun m!817867 () Bool)

(assert (=> b!877681 m!817867))

(declare-fun m!817869 () Bool)

(assert (=> b!877681 m!817869))

(declare-fun m!817871 () Bool)

(assert (=> b!877681 m!817871))

(declare-fun m!817873 () Bool)

(assert (=> b!877681 m!817873))

(declare-fun m!817875 () Bool)

(assert (=> b!877681 m!817875))

(declare-fun m!817877 () Bool)

(assert (=> b!877681 m!817877))

(assert (=> b!877681 m!817871))

(declare-fun m!817879 () Bool)

(assert (=> b!877681 m!817879))

(assert (=> b!877681 m!817873))

(declare-fun m!817881 () Bool)

(assert (=> b!877681 m!817881))

(declare-fun m!817883 () Bool)

(assert (=> b!877681 m!817883))

(declare-fun m!817885 () Bool)

(assert (=> b!877681 m!817885))

(declare-fun m!817887 () Bool)

(assert (=> b!877668 m!817887))

(declare-fun m!817889 () Bool)

(assert (=> b!877674 m!817889))

(declare-fun m!817891 () Bool)

(assert (=> b!877671 m!817891))

(declare-fun m!817893 () Bool)

(assert (=> b!877667 m!817893))

(assert (=> bm!38828 m!817881))

(declare-fun m!817895 () Bool)

(assert (=> start!74606 m!817895))

(declare-fun m!817897 () Bool)

(assert (=> start!74606 m!817897))

(declare-fun m!817899 () Bool)

(assert (=> b!877678 m!817899))

(assert (=> b!877678 m!817877))

(declare-fun m!817901 () Bool)

(assert (=> b!877678 m!817901))

(declare-fun m!817903 () Bool)

(assert (=> b!877679 m!817903))

(declare-fun m!817905 () Bool)

(assert (=> mapNonEmpty!27749 m!817905))

(assert (=> b!877673 m!817883))

(assert (=> b!877673 m!817883))

(declare-fun m!817907 () Bool)

(assert (=> b!877673 m!817907))

(declare-fun m!817909 () Bool)

(assert (=> b!877673 m!817909))

(declare-fun m!817911 () Bool)

(assert (=> b!877677 m!817911))

(check-sat (not start!74606) (not b!877681) (not bm!38829) (not b!877677) tp_is_empty!17425 (not b!877678) (not bm!38828) (not b!877667) (not mapNonEmpty!27749) (not b!877671) (not b_lambda!12263) (not b!877673) b_and!25027 (not b!877674) (not b!877679) (not b_next!15181))
(check-sat b_and!25027 (not b_next!15181))
(get-model)

(declare-fun b_lambda!12269 () Bool)

(assert (= b_lambda!12263 (or (and start!74606 b_free!15181) b_lambda!12269)))

(check-sat (not start!74606) (not b!877681) (not bm!38829) (not b!877677) tp_is_empty!17425 (not b_lambda!12269) (not b!877678) (not bm!38828) (not b!877667) (not mapNonEmpty!27749) (not b!877671) (not b!877673) b_and!25027 (not b!877674) (not b!877679) (not b_next!15181))
(check-sat b_and!25027 (not b_next!15181))
(get-model)

(declare-fun b!877802 () Bool)

(declare-fun e!488706 () ListLongMap!10289)

(assert (=> b!877802 (= e!488706 (ListLongMap!10290 Nil!17352))))

(declare-fun b!877803 () Bool)

(declare-fun lt!397130 () Unit!29960)

(declare-fun lt!397132 () Unit!29960)

(assert (=> b!877803 (= lt!397130 lt!397132)))

(declare-fun lt!397133 () (_ BitVec 64))

(declare-fun lt!397135 () (_ BitVec 64))

(declare-fun lt!397131 () V!28281)

(declare-fun lt!397134 () ListLongMap!10289)

(declare-fun contains!4226 (ListLongMap!10289 (_ BitVec 64)) Bool)

(assert (=> b!877803 (not (contains!4226 (+!2505 lt!397134 (tuple2!11519 lt!397135 lt!397131)) lt!397133))))

(declare-fun addStillNotContains!204 (ListLongMap!10289 (_ BitVec 64) V!28281 (_ BitVec 64)) Unit!29960)

(assert (=> b!877803 (= lt!397132 (addStillNotContains!204 lt!397134 lt!397135 lt!397131 lt!397133))))

(assert (=> b!877803 (= lt!397133 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!877803 (= lt!397131 (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!877803 (= lt!397135 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38847 () ListLongMap!10289)

(assert (=> b!877803 (= lt!397134 call!38847)))

(declare-fun e!488711 () ListLongMap!10289)

(assert (=> b!877803 (= e!488711 (+!2505 call!38847 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877804 () Bool)

(declare-fun e!488710 () Bool)

(declare-fun e!488708 () Bool)

(assert (=> b!877804 (= e!488710 e!488708)))

(declare-fun c!92918 () Bool)

(assert (=> b!877804 (= c!92918 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(declare-fun b!877805 () Bool)

(declare-fun e!488707 () Bool)

(assert (=> b!877805 (= e!488707 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!877805 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!877806 () Bool)

(declare-fun res!596183 () Bool)

(declare-fun e!488709 () Bool)

(assert (=> b!877806 (=> (not res!596183) (not e!488709))))

(declare-fun lt!397129 () ListLongMap!10289)

(assert (=> b!877806 (= res!596183 (not (contains!4226 lt!397129 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877807 () Bool)

(assert (=> b!877807 (= e!488706 e!488711)))

(declare-fun c!92919 () Bool)

(assert (=> b!877807 (= c!92919 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!877808 () Bool)

(declare-fun isEmpty!669 (ListLongMap!10289) Bool)

(assert (=> b!877808 (= e!488708 (isEmpty!669 lt!397129))))

(declare-fun d!108943 () Bool)

(assert (=> d!108943 e!488709))

(declare-fun res!596185 () Bool)

(assert (=> d!108943 (=> (not res!596185) (not e!488709))))

(assert (=> d!108943 (= res!596185 (not (contains!4226 lt!397129 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108943 (= lt!397129 e!488706)))

(declare-fun c!92921 () Bool)

(assert (=> d!108943 (= c!92921 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(assert (=> d!108943 (validMask!0 mask!1196)))

(assert (=> d!108943 (= (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397129)))

(declare-fun b!877809 () Bool)

(declare-fun e!488712 () Bool)

(assert (=> b!877809 (= e!488710 e!488712)))

(assert (=> b!877809 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(declare-fun res!596184 () Bool)

(assert (=> b!877809 (= res!596184 (contains!4226 lt!397129 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!877809 (=> (not res!596184) (not e!488712))))

(declare-fun b!877810 () Bool)

(assert (=> b!877810 (= e!488709 e!488710)))

(declare-fun c!92920 () Bool)

(assert (=> b!877810 (= c!92920 e!488707)))

(declare-fun res!596182 () Bool)

(assert (=> b!877810 (=> (not res!596182) (not e!488707))))

(assert (=> b!877810 (= res!596182 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(declare-fun b!877811 () Bool)

(assert (=> b!877811 (= e!488711 call!38847)))

(declare-fun b!877812 () Bool)

(assert (=> b!877812 (= e!488708 (= lt!397129 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!877813 () Bool)

(assert (=> b!877813 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(assert (=> b!877813 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24974 _values!688)))))

(declare-fun apply!377 (ListLongMap!10289 (_ BitVec 64)) V!28281)

(assert (=> b!877813 (= e!488712 (= (apply!377 lt!397129 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38844 () Bool)

(assert (=> bm!38844 (= call!38847 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108943 c!92921) b!877802))

(assert (= (and d!108943 (not c!92921)) b!877807))

(assert (= (and b!877807 c!92919) b!877803))

(assert (= (and b!877807 (not c!92919)) b!877811))

(assert (= (or b!877803 b!877811) bm!38844))

(assert (= (and d!108943 res!596185) b!877806))

(assert (= (and b!877806 res!596183) b!877810))

(assert (= (and b!877810 res!596182) b!877805))

(assert (= (and b!877810 c!92920) b!877809))

(assert (= (and b!877810 (not c!92920)) b!877804))

(assert (= (and b!877809 res!596184) b!877813))

(assert (= (and b!877804 c!92918) b!877812))

(assert (= (and b!877804 (not c!92918)) b!877808))

(declare-fun b_lambda!12271 () Bool)

(assert (=> (not b_lambda!12271) (not b!877803)))

(assert (=> b!877803 t!24431))

(declare-fun b_and!25037 () Bool)

(assert (= b_and!25027 (and (=> t!24431 result!9493) b_and!25037)))

(declare-fun b_lambda!12273 () Bool)

(assert (=> (not b_lambda!12273) (not b!877813)))

(assert (=> b!877813 t!24431))

(declare-fun b_and!25039 () Bool)

(assert (= b_and!25037 (and (=> t!24431 result!9493) b_and!25039)))

(declare-fun m!818025 () Bool)

(assert (=> b!877805 m!818025))

(assert (=> b!877805 m!818025))

(declare-fun m!818027 () Bool)

(assert (=> b!877805 m!818027))

(declare-fun m!818029 () Bool)

(assert (=> b!877806 m!818029))

(declare-fun m!818031 () Bool)

(assert (=> b!877813 m!818031))

(assert (=> b!877813 m!817885))

(declare-fun m!818033 () Bool)

(assert (=> b!877813 m!818033))

(assert (=> b!877813 m!817885))

(assert (=> b!877813 m!818025))

(declare-fun m!818035 () Bool)

(assert (=> b!877813 m!818035))

(assert (=> b!877813 m!818025))

(assert (=> b!877813 m!818031))

(declare-fun m!818037 () Bool)

(assert (=> b!877803 m!818037))

(declare-fun m!818039 () Bool)

(assert (=> b!877803 m!818039))

(assert (=> b!877803 m!817885))

(assert (=> b!877803 m!818031))

(declare-fun m!818041 () Bool)

(assert (=> b!877803 m!818041))

(declare-fun m!818043 () Bool)

(assert (=> b!877803 m!818043))

(assert (=> b!877803 m!818031))

(assert (=> b!877803 m!817885))

(assert (=> b!877803 m!818033))

(assert (=> b!877803 m!818025))

(assert (=> b!877803 m!818041))

(declare-fun m!818045 () Bool)

(assert (=> bm!38844 m!818045))

(declare-fun m!818047 () Bool)

(assert (=> b!877808 m!818047))

(assert (=> b!877809 m!818025))

(assert (=> b!877809 m!818025))

(declare-fun m!818049 () Bool)

(assert (=> b!877809 m!818049))

(declare-fun m!818051 () Bool)

(assert (=> d!108943 m!818051))

(assert (=> d!108943 m!817911))

(assert (=> b!877807 m!818025))

(assert (=> b!877807 m!818025))

(assert (=> b!877807 m!818027))

(assert (=> b!877812 m!818045))

(assert (=> bm!38829 d!108943))

(declare-fun b!877814 () Bool)

(declare-fun e!488713 () ListLongMap!10289)

(assert (=> b!877814 (= e!488713 (ListLongMap!10290 Nil!17352))))

(declare-fun b!877815 () Bool)

(declare-fun lt!397137 () Unit!29960)

(declare-fun lt!397139 () Unit!29960)

(assert (=> b!877815 (= lt!397137 lt!397139)))

(declare-fun lt!397138 () V!28281)

(declare-fun lt!397140 () (_ BitVec 64))

(declare-fun lt!397141 () ListLongMap!10289)

(declare-fun lt!397142 () (_ BitVec 64))

(assert (=> b!877815 (not (contains!4226 (+!2505 lt!397141 (tuple2!11519 lt!397142 lt!397138)) lt!397140))))

(assert (=> b!877815 (= lt!397139 (addStillNotContains!204 lt!397141 lt!397142 lt!397138 lt!397140))))

(assert (=> b!877815 (= lt!397140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!877815 (= lt!397138 (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!877815 (= lt!397142 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38848 () ListLongMap!10289)

(assert (=> b!877815 (= lt!397141 call!38848)))

(declare-fun e!488718 () ListLongMap!10289)

(assert (=> b!877815 (= e!488718 (+!2505 call!38848 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877816 () Bool)

(declare-fun e!488717 () Bool)

(declare-fun e!488715 () Bool)

(assert (=> b!877816 (= e!488717 e!488715)))

(declare-fun c!92922 () Bool)

(assert (=> b!877816 (= c!92922 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(declare-fun b!877817 () Bool)

(declare-fun e!488714 () Bool)

(assert (=> b!877817 (= e!488714 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!877817 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!877818 () Bool)

(declare-fun res!596187 () Bool)

(declare-fun e!488716 () Bool)

(assert (=> b!877818 (=> (not res!596187) (not e!488716))))

(declare-fun lt!397136 () ListLongMap!10289)

(assert (=> b!877818 (= res!596187 (not (contains!4226 lt!397136 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877819 () Bool)

(assert (=> b!877819 (= e!488713 e!488718)))

(declare-fun c!92923 () Bool)

(assert (=> b!877819 (= c!92923 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!877820 () Bool)

(assert (=> b!877820 (= e!488715 (isEmpty!669 lt!397136))))

(declare-fun d!108945 () Bool)

(assert (=> d!108945 e!488716))

(declare-fun res!596189 () Bool)

(assert (=> d!108945 (=> (not res!596189) (not e!488716))))

(assert (=> d!108945 (= res!596189 (not (contains!4226 lt!397136 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108945 (= lt!397136 e!488713)))

(declare-fun c!92925 () Bool)

(assert (=> d!108945 (= c!92925 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(assert (=> d!108945 (validMask!0 mask!1196)))

(assert (=> d!108945 (= (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397136)))

(declare-fun b!877821 () Bool)

(declare-fun e!488719 () Bool)

(assert (=> b!877821 (= e!488717 e!488719)))

(assert (=> b!877821 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(declare-fun res!596188 () Bool)

(assert (=> b!877821 (= res!596188 (contains!4226 lt!397136 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!877821 (=> (not res!596188) (not e!488719))))

(declare-fun b!877822 () Bool)

(assert (=> b!877822 (= e!488716 e!488717)))

(declare-fun c!92924 () Bool)

(assert (=> b!877822 (= c!92924 e!488714)))

(declare-fun res!596186 () Bool)

(assert (=> b!877822 (=> (not res!596186) (not e!488714))))

(assert (=> b!877822 (= res!596186 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(declare-fun b!877823 () Bool)

(assert (=> b!877823 (= e!488718 call!38848)))

(declare-fun b!877824 () Bool)

(assert (=> b!877824 (= e!488715 (= lt!397136 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!877825 () Bool)

(assert (=> b!877825 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(assert (=> b!877825 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24974 lt!397049)))))

(assert (=> b!877825 (= e!488719 (= (apply!377 lt!397136 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38845 () Bool)

(assert (=> bm!38845 (= call!38848 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108945 c!92925) b!877814))

(assert (= (and d!108945 (not c!92925)) b!877819))

(assert (= (and b!877819 c!92923) b!877815))

(assert (= (and b!877819 (not c!92923)) b!877823))

(assert (= (or b!877815 b!877823) bm!38845))

(assert (= (and d!108945 res!596189) b!877818))

(assert (= (and b!877818 res!596187) b!877822))

(assert (= (and b!877822 res!596186) b!877817))

(assert (= (and b!877822 c!92924) b!877821))

(assert (= (and b!877822 (not c!92924)) b!877816))

(assert (= (and b!877821 res!596188) b!877825))

(assert (= (and b!877816 c!92922) b!877824))

(assert (= (and b!877816 (not c!92922)) b!877820))

(declare-fun b_lambda!12275 () Bool)

(assert (=> (not b_lambda!12275) (not b!877815)))

(assert (=> b!877815 t!24431))

(declare-fun b_and!25041 () Bool)

(assert (= b_and!25039 (and (=> t!24431 result!9493) b_and!25041)))

(declare-fun b_lambda!12277 () Bool)

(assert (=> (not b_lambda!12277) (not b!877825)))

(assert (=> b!877825 t!24431))

(declare-fun b_and!25043 () Bool)

(assert (= b_and!25041 (and (=> t!24431 result!9493) b_and!25043)))

(assert (=> b!877817 m!818025))

(assert (=> b!877817 m!818025))

(assert (=> b!877817 m!818027))

(declare-fun m!818053 () Bool)

(assert (=> b!877818 m!818053))

(declare-fun m!818055 () Bool)

(assert (=> b!877825 m!818055))

(assert (=> b!877825 m!817885))

(declare-fun m!818057 () Bool)

(assert (=> b!877825 m!818057))

(assert (=> b!877825 m!817885))

(assert (=> b!877825 m!818025))

(declare-fun m!818059 () Bool)

(assert (=> b!877825 m!818059))

(assert (=> b!877825 m!818025))

(assert (=> b!877825 m!818055))

(declare-fun m!818061 () Bool)

(assert (=> b!877815 m!818061))

(declare-fun m!818063 () Bool)

(assert (=> b!877815 m!818063))

(assert (=> b!877815 m!817885))

(assert (=> b!877815 m!818055))

(declare-fun m!818065 () Bool)

(assert (=> b!877815 m!818065))

(declare-fun m!818067 () Bool)

(assert (=> b!877815 m!818067))

(assert (=> b!877815 m!818055))

(assert (=> b!877815 m!817885))

(assert (=> b!877815 m!818057))

(assert (=> b!877815 m!818025))

(assert (=> b!877815 m!818065))

(declare-fun m!818069 () Bool)

(assert (=> bm!38845 m!818069))

(declare-fun m!818071 () Bool)

(assert (=> b!877820 m!818071))

(assert (=> b!877821 m!818025))

(assert (=> b!877821 m!818025))

(declare-fun m!818073 () Bool)

(assert (=> b!877821 m!818073))

(declare-fun m!818075 () Bool)

(assert (=> d!108945 m!818075))

(assert (=> d!108945 m!817911))

(assert (=> b!877819 m!818025))

(assert (=> b!877819 m!818025))

(assert (=> b!877819 m!818027))

(assert (=> b!877824 m!818069))

(assert (=> bm!38828 d!108945))

(declare-fun d!108947 () Bool)

(assert (=> d!108947 (= (array_inv!19388 _keys!868) (bvsge (size!24973 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74606 d!108947))

(declare-fun d!108949 () Bool)

(assert (=> d!108949 (= (array_inv!19389 _values!688) (bvsge (size!24974 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74606 d!108949))

(declare-fun d!108951 () Bool)

(assert (=> d!108951 (= (validKeyInArray!0 (select (arr!24532 _keys!868) from!1053)) (and (not (= (select (arr!24532 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24532 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!877673 d!108951))

(declare-fun d!108953 () Bool)

(declare-fun e!488725 () Bool)

(assert (=> d!108953 e!488725))

(declare-fun res!596192 () Bool)

(assert (=> d!108953 (=> (not res!596192) (not e!488725))))

(assert (=> d!108953 (= res!596192 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24974 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24974 _values!688))))))))

(declare-fun lt!397145 () Unit!29960)

(declare-fun choose!1436 (array!51019 array!51021 (_ BitVec 32) (_ BitVec 32) V!28281 V!28281 (_ BitVec 32) (_ BitVec 64) V!28281 (_ BitVec 32) Int) Unit!29960)

(assert (=> d!108953 (= lt!397145 (choose!1436 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108953 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(assert (=> d!108953 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!673 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397145)))

(declare-fun bm!38850 () Bool)

(declare-fun call!38853 () ListLongMap!10289)

(assert (=> bm!38850 (= call!38853 (getCurrentListMapNoExtraKeys!3202 _keys!868 (array!51022 (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24974 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!38854 () ListLongMap!10289)

(declare-fun bm!38851 () Bool)

(assert (=> bm!38851 (= call!38854 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun e!488724 () Bool)

(declare-fun b!877832 () Bool)

(assert (=> b!877832 (= e!488724 (= call!38853 (+!2505 call!38854 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!877833 () Bool)

(assert (=> b!877833 (= e!488725 e!488724)))

(declare-fun c!92928 () Bool)

(assert (=> b!877833 (= c!92928 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun b!877834 () Bool)

(assert (=> b!877834 (= e!488724 (= call!38853 call!38854))))

(assert (= (and d!108953 res!596192) b!877833))

(assert (= (and b!877833 c!92928) b!877832))

(assert (= (and b!877833 (not c!92928)) b!877834))

(assert (= (or b!877832 b!877834) bm!38851))

(assert (= (or b!877832 b!877834) bm!38850))

(declare-fun m!818077 () Bool)

(assert (=> d!108953 m!818077))

(assert (=> bm!38850 m!817877))

(declare-fun m!818079 () Bool)

(assert (=> bm!38850 m!818079))

(assert (=> bm!38851 m!817857))

(declare-fun m!818081 () Bool)

(assert (=> b!877832 m!818081))

(assert (=> b!877673 d!108953))

(declare-fun d!108955 () Bool)

(assert (=> d!108955 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!877677 d!108955))

(declare-fun d!108957 () Bool)

(declare-fun e!488728 () Bool)

(assert (=> d!108957 e!488728))

(declare-fun res!596197 () Bool)

(assert (=> d!108957 (=> (not res!596197) (not e!488728))))

(declare-fun lt!397156 () ListLongMap!10289)

(assert (=> d!108957 (= res!596197 (contains!4226 lt!397156 (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun lt!397155 () List!17355)

(assert (=> d!108957 (= lt!397156 (ListLongMap!10290 lt!397155))))

(declare-fun lt!397157 () Unit!29960)

(declare-fun lt!397154 () Unit!29960)

(assert (=> d!108957 (= lt!397157 lt!397154)))

(declare-datatypes ((Option!426 0))(
  ( (Some!425 (v!11199 V!28281)) (None!424) )
))
(declare-fun getValueByKey!420 (List!17355 (_ BitVec 64)) Option!426)

(assert (=> d!108957 (= (getValueByKey!420 lt!397155 (_1!5770 (tuple2!11519 k0!854 v!557))) (Some!425 (_2!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!234 (List!17355 (_ BitVec 64) V!28281) Unit!29960)

(assert (=> d!108957 (= lt!397154 (lemmaContainsTupThenGetReturnValue!234 lt!397155 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun insertStrictlySorted!273 (List!17355 (_ BitVec 64) V!28281) List!17355)

(assert (=> d!108957 (= lt!397155 (insertStrictlySorted!273 (toList!5160 lt!397054) (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))))))

(assert (=> d!108957 (= (+!2505 lt!397054 (tuple2!11519 k0!854 v!557)) lt!397156)))

(declare-fun b!877839 () Bool)

(declare-fun res!596198 () Bool)

(assert (=> b!877839 (=> (not res!596198) (not e!488728))))

(assert (=> b!877839 (= res!596198 (= (getValueByKey!420 (toList!5160 lt!397156) (_1!5770 (tuple2!11519 k0!854 v!557))) (Some!425 (_2!5770 (tuple2!11519 k0!854 v!557)))))))

(declare-fun b!877840 () Bool)

(declare-fun contains!4227 (List!17355 tuple2!11518) Bool)

(assert (=> b!877840 (= e!488728 (contains!4227 (toList!5160 lt!397156) (tuple2!11519 k0!854 v!557)))))

(assert (= (and d!108957 res!596197) b!877839))

(assert (= (and b!877839 res!596198) b!877840))

(declare-fun m!818083 () Bool)

(assert (=> d!108957 m!818083))

(declare-fun m!818085 () Bool)

(assert (=> d!108957 m!818085))

(declare-fun m!818087 () Bool)

(assert (=> d!108957 m!818087))

(declare-fun m!818089 () Bool)

(assert (=> d!108957 m!818089))

(declare-fun m!818091 () Bool)

(assert (=> b!877839 m!818091))

(declare-fun m!818093 () Bool)

(assert (=> b!877840 m!818093))

(assert (=> b!877681 d!108957))

(declare-fun d!108959 () Bool)

(declare-fun e!488729 () Bool)

(assert (=> d!108959 e!488729))

(declare-fun res!596199 () Bool)

(assert (=> d!108959 (=> (not res!596199) (not e!488729))))

(declare-fun lt!397160 () ListLongMap!10289)

(assert (=> d!108959 (= res!596199 (contains!4226 lt!397160 (_1!5770 (tuple2!11519 k0!854 lt!397052))))))

(declare-fun lt!397159 () List!17355)

(assert (=> d!108959 (= lt!397160 (ListLongMap!10290 lt!397159))))

(declare-fun lt!397161 () Unit!29960)

(declare-fun lt!397158 () Unit!29960)

(assert (=> d!108959 (= lt!397161 lt!397158)))

(assert (=> d!108959 (= (getValueByKey!420 lt!397159 (_1!5770 (tuple2!11519 k0!854 lt!397052))) (Some!425 (_2!5770 (tuple2!11519 k0!854 lt!397052))))))

(assert (=> d!108959 (= lt!397158 (lemmaContainsTupThenGetReturnValue!234 lt!397159 (_1!5770 (tuple2!11519 k0!854 lt!397052)) (_2!5770 (tuple2!11519 k0!854 lt!397052))))))

(assert (=> d!108959 (= lt!397159 (insertStrictlySorted!273 (toList!5160 lt!397053) (_1!5770 (tuple2!11519 k0!854 lt!397052)) (_2!5770 (tuple2!11519 k0!854 lt!397052))))))

(assert (=> d!108959 (= (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)) lt!397160)))

(declare-fun b!877841 () Bool)

(declare-fun res!596200 () Bool)

(assert (=> b!877841 (=> (not res!596200) (not e!488729))))

(assert (=> b!877841 (= res!596200 (= (getValueByKey!420 (toList!5160 lt!397160) (_1!5770 (tuple2!11519 k0!854 lt!397052))) (Some!425 (_2!5770 (tuple2!11519 k0!854 lt!397052)))))))

(declare-fun b!877842 () Bool)

(assert (=> b!877842 (= e!488729 (contains!4227 (toList!5160 lt!397160) (tuple2!11519 k0!854 lt!397052)))))

(assert (= (and d!108959 res!596199) b!877841))

(assert (= (and b!877841 res!596200) b!877842))

(declare-fun m!818095 () Bool)

(assert (=> d!108959 m!818095))

(declare-fun m!818097 () Bool)

(assert (=> d!108959 m!818097))

(declare-fun m!818099 () Bool)

(assert (=> d!108959 m!818099))

(declare-fun m!818101 () Bool)

(assert (=> d!108959 m!818101))

(declare-fun m!818103 () Bool)

(assert (=> b!877841 m!818103))

(declare-fun m!818105 () Bool)

(assert (=> b!877842 m!818105))

(assert (=> b!877681 d!108959))

(declare-fun d!108961 () Bool)

(declare-fun e!488730 () Bool)

(assert (=> d!108961 e!488730))

(declare-fun res!596201 () Bool)

(assert (=> d!108961 (=> (not res!596201) (not e!488730))))

(declare-fun lt!397164 () ListLongMap!10289)

(assert (=> d!108961 (= res!596201 (contains!4226 lt!397164 (_1!5770 lt!397048)))))

(declare-fun lt!397163 () List!17355)

(assert (=> d!108961 (= lt!397164 (ListLongMap!10290 lt!397163))))

(declare-fun lt!397165 () Unit!29960)

(declare-fun lt!397162 () Unit!29960)

(assert (=> d!108961 (= lt!397165 lt!397162)))

(assert (=> d!108961 (= (getValueByKey!420 lt!397163 (_1!5770 lt!397048)) (Some!425 (_2!5770 lt!397048)))))

(assert (=> d!108961 (= lt!397162 (lemmaContainsTupThenGetReturnValue!234 lt!397163 (_1!5770 lt!397048) (_2!5770 lt!397048)))))

(assert (=> d!108961 (= lt!397163 (insertStrictlySorted!273 (toList!5160 lt!397053) (_1!5770 lt!397048) (_2!5770 lt!397048)))))

(assert (=> d!108961 (= (+!2505 lt!397053 lt!397048) lt!397164)))

(declare-fun b!877843 () Bool)

(declare-fun res!596202 () Bool)

(assert (=> b!877843 (=> (not res!596202) (not e!488730))))

(assert (=> b!877843 (= res!596202 (= (getValueByKey!420 (toList!5160 lt!397164) (_1!5770 lt!397048)) (Some!425 (_2!5770 lt!397048))))))

(declare-fun b!877844 () Bool)

(assert (=> b!877844 (= e!488730 (contains!4227 (toList!5160 lt!397164) lt!397048))))

(assert (= (and d!108961 res!596201) b!877843))

(assert (= (and b!877843 res!596202) b!877844))

(declare-fun m!818107 () Bool)

(assert (=> d!108961 m!818107))

(declare-fun m!818109 () Bool)

(assert (=> d!108961 m!818109))

(declare-fun m!818111 () Bool)

(assert (=> d!108961 m!818111))

(declare-fun m!818113 () Bool)

(assert (=> d!108961 m!818113))

(declare-fun m!818115 () Bool)

(assert (=> b!877843 m!818115))

(declare-fun m!818117 () Bool)

(assert (=> b!877844 m!818117))

(assert (=> b!877681 d!108961))

(assert (=> b!877681 d!108945))

(declare-fun d!108963 () Bool)

(declare-fun c!92931 () Bool)

(assert (=> d!108963 (= c!92931 ((_ is ValueCellFull!8273) (select (arr!24533 _values!688) from!1053)))))

(declare-fun e!488733 () V!28281)

(assert (=> d!108963 (= (get!12922 (select (arr!24533 _values!688) from!1053) lt!397051) e!488733)))

(declare-fun b!877849 () Bool)

(declare-fun get!12924 (ValueCell!8273 V!28281) V!28281)

(assert (=> b!877849 (= e!488733 (get!12924 (select (arr!24533 _values!688) from!1053) lt!397051))))

(declare-fun b!877850 () Bool)

(declare-fun get!12925 (ValueCell!8273 V!28281) V!28281)

(assert (=> b!877850 (= e!488733 (get!12925 (select (arr!24533 _values!688) from!1053) lt!397051))))

(assert (= (and d!108963 c!92931) b!877849))

(assert (= (and d!108963 (not c!92931)) b!877850))

(assert (=> b!877849 m!817871))

(declare-fun m!818119 () Bool)

(assert (=> b!877849 m!818119))

(assert (=> b!877850 m!817871))

(declare-fun m!818121 () Bool)

(assert (=> b!877850 m!818121))

(assert (=> b!877681 d!108963))

(declare-fun d!108965 () Bool)

(assert (=> d!108965 (= (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397047)) (+!2505 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)) (tuple2!11519 k0!854 lt!397047)))))

(declare-fun lt!397168 () Unit!29960)

(declare-fun choose!1437 (ListLongMap!10289 (_ BitVec 64) V!28281 V!28281) Unit!29960)

(assert (=> d!108965 (= lt!397168 (choose!1437 lt!397053 k0!854 lt!397052 lt!397047))))

(assert (=> d!108965 (= (addSameAsAddTwiceSameKeyDiffValues!340 lt!397053 k0!854 lt!397052 lt!397047) lt!397168)))

(declare-fun bs!24632 () Bool)

(assert (= bs!24632 d!108965))

(declare-fun m!818123 () Bool)

(assert (=> bs!24632 m!818123))

(assert (=> bs!24632 m!817873))

(assert (=> bs!24632 m!817873))

(declare-fun m!818125 () Bool)

(assert (=> bs!24632 m!818125))

(declare-fun m!818127 () Bool)

(assert (=> bs!24632 m!818127))

(assert (=> b!877681 d!108965))

(declare-fun d!108967 () Bool)

(declare-fun c!92932 () Bool)

(assert (=> d!108967 (= c!92932 ((_ is ValueCellFull!8273) (select (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053)))))

(declare-fun e!488734 () V!28281)

(assert (=> d!108967 (= (get!12922 (select (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!397051) e!488734)))

(declare-fun b!877851 () Bool)

(assert (=> b!877851 (= e!488734 (get!12924 (select (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!397051))))

(declare-fun b!877852 () Bool)

(assert (=> b!877852 (= e!488734 (get!12925 (select (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!397051))))

(assert (= (and d!108967 c!92932) b!877851))

(assert (= (and d!108967 (not c!92932)) b!877852))

(assert (=> b!877851 m!817863))

(declare-fun m!818129 () Bool)

(assert (=> b!877851 m!818129))

(assert (=> b!877852 m!817863))

(declare-fun m!818131 () Bool)

(assert (=> b!877852 m!818131))

(assert (=> b!877681 d!108967))

(declare-fun d!108969 () Bool)

(declare-fun e!488735 () Bool)

(assert (=> d!108969 e!488735))

(declare-fun res!596203 () Bool)

(assert (=> d!108969 (=> (not res!596203) (not e!488735))))

(declare-fun lt!397171 () ListLongMap!10289)

(assert (=> d!108969 (= res!596203 (contains!4226 lt!397171 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(declare-fun lt!397170 () List!17355)

(assert (=> d!108969 (= lt!397171 (ListLongMap!10290 lt!397170))))

(declare-fun lt!397172 () Unit!29960)

(declare-fun lt!397169 () Unit!29960)

(assert (=> d!108969 (= lt!397172 lt!397169)))

(assert (=> d!108969 (= (getValueByKey!420 lt!397170 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))) (Some!425 (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(assert (=> d!108969 (= lt!397169 (lemmaContainsTupThenGetReturnValue!234 lt!397170 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(assert (=> d!108969 (= lt!397170 (insertStrictlySorted!273 (toList!5160 lt!397053) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(assert (=> d!108969 (= (+!2505 lt!397053 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)) lt!397171)))

(declare-fun b!877853 () Bool)

(declare-fun res!596204 () Bool)

(assert (=> b!877853 (=> (not res!596204) (not e!488735))))

(assert (=> b!877853 (= res!596204 (= (getValueByKey!420 (toList!5160 lt!397171) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))) (Some!425 (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))))

(declare-fun b!877854 () Bool)

(assert (=> b!877854 (= e!488735 (contains!4227 (toList!5160 lt!397171) (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))

(assert (= (and d!108969 res!596203) b!877853))

(assert (= (and b!877853 res!596204) b!877854))

(declare-fun m!818133 () Bool)

(assert (=> d!108969 m!818133))

(declare-fun m!818135 () Bool)

(assert (=> d!108969 m!818135))

(declare-fun m!818137 () Bool)

(assert (=> d!108969 m!818137))

(declare-fun m!818139 () Bool)

(assert (=> d!108969 m!818139))

(declare-fun m!818141 () Bool)

(assert (=> b!877853 m!818141))

(declare-fun m!818143 () Bool)

(assert (=> b!877854 m!818143))

(assert (=> b!877681 d!108969))

(declare-fun d!108971 () Bool)

(declare-fun e!488736 () Bool)

(assert (=> d!108971 e!488736))

(declare-fun res!596205 () Bool)

(assert (=> d!108971 (=> (not res!596205) (not e!488736))))

(declare-fun lt!397175 () ListLongMap!10289)

(assert (=> d!108971 (= res!596205 (contains!4226 lt!397175 (_1!5770 lt!397048)))))

(declare-fun lt!397174 () List!17355)

(assert (=> d!108971 (= lt!397175 (ListLongMap!10290 lt!397174))))

(declare-fun lt!397176 () Unit!29960)

(declare-fun lt!397173 () Unit!29960)

(assert (=> d!108971 (= lt!397176 lt!397173)))

(assert (=> d!108971 (= (getValueByKey!420 lt!397174 (_1!5770 lt!397048)) (Some!425 (_2!5770 lt!397048)))))

(assert (=> d!108971 (= lt!397173 (lemmaContainsTupThenGetReturnValue!234 lt!397174 (_1!5770 lt!397048) (_2!5770 lt!397048)))))

(assert (=> d!108971 (= lt!397174 (insertStrictlySorted!273 (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052))) (_1!5770 lt!397048) (_2!5770 lt!397048)))))

(assert (=> d!108971 (= (+!2505 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)) lt!397048) lt!397175)))

(declare-fun b!877855 () Bool)

(declare-fun res!596206 () Bool)

(assert (=> b!877855 (=> (not res!596206) (not e!488736))))

(assert (=> b!877855 (= res!596206 (= (getValueByKey!420 (toList!5160 lt!397175) (_1!5770 lt!397048)) (Some!425 (_2!5770 lt!397048))))))

(declare-fun b!877856 () Bool)

(assert (=> b!877856 (= e!488736 (contains!4227 (toList!5160 lt!397175) lt!397048))))

(assert (= (and d!108971 res!596205) b!877855))

(assert (= (and b!877855 res!596206) b!877856))

(declare-fun m!818145 () Bool)

(assert (=> d!108971 m!818145))

(declare-fun m!818147 () Bool)

(assert (=> d!108971 m!818147))

(declare-fun m!818149 () Bool)

(assert (=> d!108971 m!818149))

(declare-fun m!818151 () Bool)

(assert (=> d!108971 m!818151))

(declare-fun m!818153 () Bool)

(assert (=> b!877855 m!818153))

(declare-fun m!818155 () Bool)

(assert (=> b!877856 m!818155))

(assert (=> b!877681 d!108971))

(declare-fun d!108973 () Bool)

(assert (=> d!108973 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!877667 d!108973))

(declare-fun d!108975 () Bool)

(declare-fun e!488737 () Bool)

(assert (=> d!108975 e!488737))

(declare-fun res!596207 () Bool)

(assert (=> d!108975 (=> (not res!596207) (not e!488737))))

(declare-fun lt!397179 () ListLongMap!10289)

(assert (=> d!108975 (= res!596207 (contains!4226 lt!397179 (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun lt!397178 () List!17355)

(assert (=> d!108975 (= lt!397179 (ListLongMap!10290 lt!397178))))

(declare-fun lt!397180 () Unit!29960)

(declare-fun lt!397177 () Unit!29960)

(assert (=> d!108975 (= lt!397180 lt!397177)))

(assert (=> d!108975 (= (getValueByKey!420 lt!397178 (_1!5770 (tuple2!11519 k0!854 v!557))) (Some!425 (_2!5770 (tuple2!11519 k0!854 v!557))))))

(assert (=> d!108975 (= lt!397177 (lemmaContainsTupThenGetReturnValue!234 lt!397178 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))))))

(assert (=> d!108975 (= lt!397178 (insertStrictlySorted!273 (toList!5160 call!38832) (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))))))

(assert (=> d!108975 (= (+!2505 call!38832 (tuple2!11519 k0!854 v!557)) lt!397179)))

(declare-fun b!877857 () Bool)

(declare-fun res!596208 () Bool)

(assert (=> b!877857 (=> (not res!596208) (not e!488737))))

(assert (=> b!877857 (= res!596208 (= (getValueByKey!420 (toList!5160 lt!397179) (_1!5770 (tuple2!11519 k0!854 v!557))) (Some!425 (_2!5770 (tuple2!11519 k0!854 v!557)))))))

(declare-fun b!877858 () Bool)

(assert (=> b!877858 (= e!488737 (contains!4227 (toList!5160 lt!397179) (tuple2!11519 k0!854 v!557)))))

(assert (= (and d!108975 res!596207) b!877857))

(assert (= (and b!877857 res!596208) b!877858))

(declare-fun m!818157 () Bool)

(assert (=> d!108975 m!818157))

(declare-fun m!818159 () Bool)

(assert (=> d!108975 m!818159))

(declare-fun m!818161 () Bool)

(assert (=> d!108975 m!818161))

(declare-fun m!818163 () Bool)

(assert (=> d!108975 m!818163))

(declare-fun m!818165 () Bool)

(assert (=> b!877857 m!818165))

(declare-fun m!818167 () Bool)

(assert (=> b!877858 m!818167))

(assert (=> b!877671 d!108975))

(declare-fun b!877867 () Bool)

(declare-fun e!488744 () Bool)

(declare-fun call!38857 () Bool)

(assert (=> b!877867 (= e!488744 call!38857)))

(declare-fun b!877868 () Bool)

(declare-fun e!488746 () Bool)

(assert (=> b!877868 (= e!488744 e!488746)))

(declare-fun lt!397188 () (_ BitVec 64))

(assert (=> b!877868 (= lt!397188 (select (arr!24532 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!397187 () Unit!29960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51019 (_ BitVec 64) (_ BitVec 32)) Unit!29960)

(assert (=> b!877868 (= lt!397187 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!397188 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!877868 (arrayContainsKey!0 _keys!868 lt!397188 #b00000000000000000000000000000000)))

(declare-fun lt!397189 () Unit!29960)

(assert (=> b!877868 (= lt!397189 lt!397187)))

(declare-fun res!596214 () Bool)

(declare-datatypes ((SeekEntryResult!8704 0))(
  ( (MissingZero!8704 (index!37187 (_ BitVec 32))) (Found!8704 (index!37188 (_ BitVec 32))) (Intermediate!8704 (undefined!9516 Bool) (index!37189 (_ BitVec 32)) (x!74271 (_ BitVec 32))) (Undefined!8704) (MissingVacant!8704 (index!37190 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51019 (_ BitVec 32)) SeekEntryResult!8704)

(assert (=> b!877868 (= res!596214 (= (seekEntryOrOpen!0 (select (arr!24532 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8704 #b00000000000000000000000000000000)))))

(assert (=> b!877868 (=> (not res!596214) (not e!488746))))

(declare-fun b!877869 () Bool)

(assert (=> b!877869 (= e!488746 call!38857)))

(declare-fun d!108977 () Bool)

(declare-fun res!596213 () Bool)

(declare-fun e!488745 () Bool)

(assert (=> d!108977 (=> res!596213 e!488745)))

(assert (=> d!108977 (= res!596213 (bvsge #b00000000000000000000000000000000 (size!24973 _keys!868)))))

(assert (=> d!108977 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!488745)))

(declare-fun b!877870 () Bool)

(assert (=> b!877870 (= e!488745 e!488744)))

(declare-fun c!92935 () Bool)

(assert (=> b!877870 (= c!92935 (validKeyInArray!0 (select (arr!24532 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38854 () Bool)

(assert (=> bm!38854 (= call!38857 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(assert (= (and d!108977 (not res!596213)) b!877870))

(assert (= (and b!877870 c!92935) b!877868))

(assert (= (and b!877870 (not c!92935)) b!877867))

(assert (= (and b!877868 res!596214) b!877869))

(assert (= (or b!877869 b!877867) bm!38854))

(declare-fun m!818169 () Bool)

(assert (=> b!877868 m!818169))

(declare-fun m!818171 () Bool)

(assert (=> b!877868 m!818171))

(declare-fun m!818173 () Bool)

(assert (=> b!877868 m!818173))

(assert (=> b!877868 m!818169))

(declare-fun m!818175 () Bool)

(assert (=> b!877868 m!818175))

(assert (=> b!877870 m!818169))

(assert (=> b!877870 m!818169))

(declare-fun m!818177 () Bool)

(assert (=> b!877870 m!818177))

(declare-fun m!818179 () Bool)

(assert (=> bm!38854 m!818179))

(assert (=> b!877679 d!108977))

(declare-fun b!877871 () Bool)

(declare-fun e!488747 () ListLongMap!10289)

(assert (=> b!877871 (= e!488747 (ListLongMap!10290 Nil!17352))))

(declare-fun b!877872 () Bool)

(declare-fun lt!397191 () Unit!29960)

(declare-fun lt!397193 () Unit!29960)

(assert (=> b!877872 (= lt!397191 lt!397193)))

(declare-fun lt!397194 () (_ BitVec 64))

(declare-fun lt!397195 () ListLongMap!10289)

(declare-fun lt!397196 () (_ BitVec 64))

(declare-fun lt!397192 () V!28281)

(assert (=> b!877872 (not (contains!4226 (+!2505 lt!397195 (tuple2!11519 lt!397196 lt!397192)) lt!397194))))

(assert (=> b!877872 (= lt!397193 (addStillNotContains!204 lt!397195 lt!397196 lt!397192 lt!397194))))

(assert (=> b!877872 (= lt!397194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!877872 (= lt!397192 (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!877872 (= lt!397196 (select (arr!24532 _keys!868) from!1053))))

(declare-fun call!38858 () ListLongMap!10289)

(assert (=> b!877872 (= lt!397195 call!38858)))

(declare-fun e!488752 () ListLongMap!10289)

(assert (=> b!877872 (= e!488752 (+!2505 call!38858 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877873 () Bool)

(declare-fun e!488751 () Bool)

(declare-fun e!488749 () Bool)

(assert (=> b!877873 (= e!488751 e!488749)))

(declare-fun c!92936 () Bool)

(assert (=> b!877873 (= c!92936 (bvslt from!1053 (size!24973 _keys!868)))))

(declare-fun b!877874 () Bool)

(declare-fun e!488748 () Bool)

(assert (=> b!877874 (= e!488748 (validKeyInArray!0 (select (arr!24532 _keys!868) from!1053)))))

(assert (=> b!877874 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!877875 () Bool)

(declare-fun res!596216 () Bool)

(declare-fun e!488750 () Bool)

(assert (=> b!877875 (=> (not res!596216) (not e!488750))))

(declare-fun lt!397190 () ListLongMap!10289)

(assert (=> b!877875 (= res!596216 (not (contains!4226 lt!397190 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877876 () Bool)

(assert (=> b!877876 (= e!488747 e!488752)))

(declare-fun c!92937 () Bool)

(assert (=> b!877876 (= c!92937 (validKeyInArray!0 (select (arr!24532 _keys!868) from!1053)))))

(declare-fun b!877877 () Bool)

(assert (=> b!877877 (= e!488749 (isEmpty!669 lt!397190))))

(declare-fun d!108979 () Bool)

(assert (=> d!108979 e!488750))

(declare-fun res!596218 () Bool)

(assert (=> d!108979 (=> (not res!596218) (not e!488750))))

(assert (=> d!108979 (= res!596218 (not (contains!4226 lt!397190 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108979 (= lt!397190 e!488747)))

(declare-fun c!92939 () Bool)

(assert (=> d!108979 (= c!92939 (bvsge from!1053 (size!24973 _keys!868)))))

(assert (=> d!108979 (validMask!0 mask!1196)))

(assert (=> d!108979 (= (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!397190)))

(declare-fun b!877878 () Bool)

(declare-fun e!488753 () Bool)

(assert (=> b!877878 (= e!488751 e!488753)))

(assert (=> b!877878 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24973 _keys!868)))))

(declare-fun res!596217 () Bool)

(assert (=> b!877878 (= res!596217 (contains!4226 lt!397190 (select (arr!24532 _keys!868) from!1053)))))

(assert (=> b!877878 (=> (not res!596217) (not e!488753))))

(declare-fun b!877879 () Bool)

(assert (=> b!877879 (= e!488750 e!488751)))

(declare-fun c!92938 () Bool)

(assert (=> b!877879 (= c!92938 e!488748)))

(declare-fun res!596215 () Bool)

(assert (=> b!877879 (=> (not res!596215) (not e!488748))))

(assert (=> b!877879 (= res!596215 (bvslt from!1053 (size!24973 _keys!868)))))

(declare-fun b!877880 () Bool)

(assert (=> b!877880 (= e!488752 call!38858)))

(declare-fun b!877881 () Bool)

(assert (=> b!877881 (= e!488749 (= lt!397190 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!877882 () Bool)

(assert (=> b!877882 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24973 _keys!868)))))

(assert (=> b!877882 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24974 lt!397049)))))

(assert (=> b!877882 (= e!488753 (= (apply!377 lt!397190 (select (arr!24532 _keys!868) from!1053)) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38855 () Bool)

(assert (=> bm!38855 (= call!38858 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108979 c!92939) b!877871))

(assert (= (and d!108979 (not c!92939)) b!877876))

(assert (= (and b!877876 c!92937) b!877872))

(assert (= (and b!877876 (not c!92937)) b!877880))

(assert (= (or b!877872 b!877880) bm!38855))

(assert (= (and d!108979 res!596218) b!877875))

(assert (= (and b!877875 res!596216) b!877879))

(assert (= (and b!877879 res!596215) b!877874))

(assert (= (and b!877879 c!92938) b!877878))

(assert (= (and b!877879 (not c!92938)) b!877873))

(assert (= (and b!877878 res!596217) b!877882))

(assert (= (and b!877873 c!92936) b!877881))

(assert (= (and b!877873 (not c!92936)) b!877877))

(declare-fun b_lambda!12279 () Bool)

(assert (=> (not b_lambda!12279) (not b!877872)))

(assert (=> b!877872 t!24431))

(declare-fun b_and!25045 () Bool)

(assert (= b_and!25043 (and (=> t!24431 result!9493) b_and!25045)))

(declare-fun b_lambda!12281 () Bool)

(assert (=> (not b_lambda!12281) (not b!877882)))

(assert (=> b!877882 t!24431))

(declare-fun b_and!25047 () Bool)

(assert (= b_and!25045 (and (=> t!24431 result!9493) b_and!25047)))

(assert (=> b!877874 m!817883))

(assert (=> b!877874 m!817883))

(assert (=> b!877874 m!817907))

(declare-fun m!818181 () Bool)

(assert (=> b!877875 m!818181))

(declare-fun m!818183 () Bool)

(assert (=> b!877882 m!818183))

(assert (=> b!877882 m!817885))

(declare-fun m!818185 () Bool)

(assert (=> b!877882 m!818185))

(assert (=> b!877882 m!817885))

(assert (=> b!877882 m!817883))

(declare-fun m!818187 () Bool)

(assert (=> b!877882 m!818187))

(assert (=> b!877882 m!817883))

(assert (=> b!877882 m!818183))

(declare-fun m!818189 () Bool)

(assert (=> b!877872 m!818189))

(declare-fun m!818191 () Bool)

(assert (=> b!877872 m!818191))

(assert (=> b!877872 m!817885))

(assert (=> b!877872 m!818183))

(declare-fun m!818193 () Bool)

(assert (=> b!877872 m!818193))

(declare-fun m!818195 () Bool)

(assert (=> b!877872 m!818195))

(assert (=> b!877872 m!818183))

(assert (=> b!877872 m!817885))

(assert (=> b!877872 m!818185))

(assert (=> b!877872 m!817883))

(assert (=> b!877872 m!818193))

(declare-fun m!818197 () Bool)

(assert (=> bm!38855 m!818197))

(declare-fun m!818199 () Bool)

(assert (=> b!877877 m!818199))

(assert (=> b!877878 m!817883))

(assert (=> b!877878 m!817883))

(declare-fun m!818201 () Bool)

(assert (=> b!877878 m!818201))

(declare-fun m!818203 () Bool)

(assert (=> d!108979 m!818203))

(assert (=> d!108979 m!817911))

(assert (=> b!877876 m!817883))

(assert (=> b!877876 m!817883))

(assert (=> b!877876 m!817907))

(assert (=> b!877881 m!818197))

(assert (=> b!877678 d!108979))

(declare-fun b!877883 () Bool)

(declare-fun e!488754 () ListLongMap!10289)

(assert (=> b!877883 (= e!488754 (ListLongMap!10290 Nil!17352))))

(declare-fun b!877884 () Bool)

(declare-fun lt!397198 () Unit!29960)

(declare-fun lt!397200 () Unit!29960)

(assert (=> b!877884 (= lt!397198 lt!397200)))

(declare-fun lt!397199 () V!28281)

(declare-fun lt!397203 () (_ BitVec 64))

(declare-fun lt!397202 () ListLongMap!10289)

(declare-fun lt!397201 () (_ BitVec 64))

(assert (=> b!877884 (not (contains!4226 (+!2505 lt!397202 (tuple2!11519 lt!397203 lt!397199)) lt!397201))))

(assert (=> b!877884 (= lt!397200 (addStillNotContains!204 lt!397202 lt!397203 lt!397199 lt!397201))))

(assert (=> b!877884 (= lt!397201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!877884 (= lt!397199 (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!877884 (= lt!397203 (select (arr!24532 _keys!868) from!1053))))

(declare-fun call!38859 () ListLongMap!10289)

(assert (=> b!877884 (= lt!397202 call!38859)))

(declare-fun e!488759 () ListLongMap!10289)

(assert (=> b!877884 (= e!488759 (+!2505 call!38859 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877885 () Bool)

(declare-fun e!488758 () Bool)

(declare-fun e!488756 () Bool)

(assert (=> b!877885 (= e!488758 e!488756)))

(declare-fun c!92940 () Bool)

(assert (=> b!877885 (= c!92940 (bvslt from!1053 (size!24973 _keys!868)))))

(declare-fun b!877886 () Bool)

(declare-fun e!488755 () Bool)

(assert (=> b!877886 (= e!488755 (validKeyInArray!0 (select (arr!24532 _keys!868) from!1053)))))

(assert (=> b!877886 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!877887 () Bool)

(declare-fun res!596220 () Bool)

(declare-fun e!488757 () Bool)

(assert (=> b!877887 (=> (not res!596220) (not e!488757))))

(declare-fun lt!397197 () ListLongMap!10289)

(assert (=> b!877887 (= res!596220 (not (contains!4226 lt!397197 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877888 () Bool)

(assert (=> b!877888 (= e!488754 e!488759)))

(declare-fun c!92941 () Bool)

(assert (=> b!877888 (= c!92941 (validKeyInArray!0 (select (arr!24532 _keys!868) from!1053)))))

(declare-fun b!877889 () Bool)

(assert (=> b!877889 (= e!488756 (isEmpty!669 lt!397197))))

(declare-fun d!108981 () Bool)

(assert (=> d!108981 e!488757))

(declare-fun res!596222 () Bool)

(assert (=> d!108981 (=> (not res!596222) (not e!488757))))

(assert (=> d!108981 (= res!596222 (not (contains!4226 lt!397197 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108981 (= lt!397197 e!488754)))

(declare-fun c!92943 () Bool)

(assert (=> d!108981 (= c!92943 (bvsge from!1053 (size!24973 _keys!868)))))

(assert (=> d!108981 (validMask!0 mask!1196)))

(assert (=> d!108981 (= (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!397197)))

(declare-fun b!877890 () Bool)

(declare-fun e!488760 () Bool)

(assert (=> b!877890 (= e!488758 e!488760)))

(assert (=> b!877890 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24973 _keys!868)))))

(declare-fun res!596221 () Bool)

(assert (=> b!877890 (= res!596221 (contains!4226 lt!397197 (select (arr!24532 _keys!868) from!1053)))))

(assert (=> b!877890 (=> (not res!596221) (not e!488760))))

(declare-fun b!877891 () Bool)

(assert (=> b!877891 (= e!488757 e!488758)))

(declare-fun c!92942 () Bool)

(assert (=> b!877891 (= c!92942 e!488755)))

(declare-fun res!596219 () Bool)

(assert (=> b!877891 (=> (not res!596219) (not e!488755))))

(assert (=> b!877891 (= res!596219 (bvslt from!1053 (size!24973 _keys!868)))))

(declare-fun b!877892 () Bool)

(assert (=> b!877892 (= e!488759 call!38859)))

(declare-fun b!877893 () Bool)

(assert (=> b!877893 (= e!488756 (= lt!397197 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!877894 () Bool)

(assert (=> b!877894 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24973 _keys!868)))))

(assert (=> b!877894 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24974 _values!688)))))

(assert (=> b!877894 (= e!488760 (= (apply!377 lt!397197 (select (arr!24532 _keys!868) from!1053)) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38856 () Bool)

(assert (=> bm!38856 (= call!38859 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108981 c!92943) b!877883))

(assert (= (and d!108981 (not c!92943)) b!877888))

(assert (= (and b!877888 c!92941) b!877884))

(assert (= (and b!877888 (not c!92941)) b!877892))

(assert (= (or b!877884 b!877892) bm!38856))

(assert (= (and d!108981 res!596222) b!877887))

(assert (= (and b!877887 res!596220) b!877891))

(assert (= (and b!877891 res!596219) b!877886))

(assert (= (and b!877891 c!92942) b!877890))

(assert (= (and b!877891 (not c!92942)) b!877885))

(assert (= (and b!877890 res!596221) b!877894))

(assert (= (and b!877885 c!92940) b!877893))

(assert (= (and b!877885 (not c!92940)) b!877889))

(declare-fun b_lambda!12283 () Bool)

(assert (=> (not b_lambda!12283) (not b!877884)))

(assert (=> b!877884 t!24431))

(declare-fun b_and!25049 () Bool)

(assert (= b_and!25047 (and (=> t!24431 result!9493) b_and!25049)))

(declare-fun b_lambda!12285 () Bool)

(assert (=> (not b_lambda!12285) (not b!877894)))

(assert (=> b!877894 t!24431))

(declare-fun b_and!25051 () Bool)

(assert (= b_and!25049 (and (=> t!24431 result!9493) b_and!25051)))

(assert (=> b!877886 m!817883))

(assert (=> b!877886 m!817883))

(assert (=> b!877886 m!817907))

(declare-fun m!818205 () Bool)

(assert (=> b!877887 m!818205))

(assert (=> b!877894 m!817871))

(assert (=> b!877894 m!817885))

(declare-fun m!818207 () Bool)

(assert (=> b!877894 m!818207))

(assert (=> b!877894 m!817885))

(assert (=> b!877894 m!817883))

(declare-fun m!818209 () Bool)

(assert (=> b!877894 m!818209))

(assert (=> b!877894 m!817883))

(assert (=> b!877894 m!817871))

(declare-fun m!818211 () Bool)

(assert (=> b!877884 m!818211))

(declare-fun m!818213 () Bool)

(assert (=> b!877884 m!818213))

(assert (=> b!877884 m!817885))

(assert (=> b!877884 m!817871))

(declare-fun m!818215 () Bool)

(assert (=> b!877884 m!818215))

(declare-fun m!818217 () Bool)

(assert (=> b!877884 m!818217))

(assert (=> b!877884 m!817871))

(assert (=> b!877884 m!817885))

(assert (=> b!877884 m!818207))

(assert (=> b!877884 m!817883))

(assert (=> b!877884 m!818215))

(declare-fun m!818219 () Bool)

(assert (=> bm!38856 m!818219))

(declare-fun m!818221 () Bool)

(assert (=> b!877889 m!818221))

(assert (=> b!877890 m!817883))

(assert (=> b!877890 m!817883))

(declare-fun m!818223 () Bool)

(assert (=> b!877890 m!818223))

(declare-fun m!818225 () Bool)

(assert (=> d!108981 m!818225))

(assert (=> d!108981 m!817911))

(assert (=> b!877888 m!817883))

(assert (=> b!877888 m!817883))

(assert (=> b!877888 m!817907))

(assert (=> b!877893 m!818219))

(assert (=> b!877678 d!108981))

(declare-fun bm!38859 () Bool)

(declare-fun call!38862 () Bool)

(declare-fun c!92946 () Bool)

(assert (=> bm!38859 (= call!38862 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92946 (Cons!17352 (select (arr!24532 _keys!868) #b00000000000000000000000000000000) Nil!17353) Nil!17353)))))

(declare-fun b!877905 () Bool)

(declare-fun e!488772 () Bool)

(declare-fun contains!4228 (List!17356 (_ BitVec 64)) Bool)

(assert (=> b!877905 (= e!488772 (contains!4228 Nil!17353 (select (arr!24532 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!877906 () Bool)

(declare-fun e!488769 () Bool)

(declare-fun e!488771 () Bool)

(assert (=> b!877906 (= e!488769 e!488771)))

(declare-fun res!596229 () Bool)

(assert (=> b!877906 (=> (not res!596229) (not e!488771))))

(assert (=> b!877906 (= res!596229 (not e!488772))))

(declare-fun res!596230 () Bool)

(assert (=> b!877906 (=> (not res!596230) (not e!488772))))

(assert (=> b!877906 (= res!596230 (validKeyInArray!0 (select (arr!24532 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!877907 () Bool)

(declare-fun e!488770 () Bool)

(assert (=> b!877907 (= e!488770 call!38862)))

(declare-fun d!108983 () Bool)

(declare-fun res!596231 () Bool)

(assert (=> d!108983 (=> res!596231 e!488769)))

(assert (=> d!108983 (= res!596231 (bvsge #b00000000000000000000000000000000 (size!24973 _keys!868)))))

(assert (=> d!108983 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17353) e!488769)))

(declare-fun b!877908 () Bool)

(assert (=> b!877908 (= e!488771 e!488770)))

(assert (=> b!877908 (= c!92946 (validKeyInArray!0 (select (arr!24532 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!877909 () Bool)

(assert (=> b!877909 (= e!488770 call!38862)))

(assert (= (and d!108983 (not res!596231)) b!877906))

(assert (= (and b!877906 res!596230) b!877905))

(assert (= (and b!877906 res!596229) b!877908))

(assert (= (and b!877908 c!92946) b!877907))

(assert (= (and b!877908 (not c!92946)) b!877909))

(assert (= (or b!877907 b!877909) bm!38859))

(assert (=> bm!38859 m!818169))

(declare-fun m!818227 () Bool)

(assert (=> bm!38859 m!818227))

(assert (=> b!877905 m!818169))

(assert (=> b!877905 m!818169))

(declare-fun m!818229 () Bool)

(assert (=> b!877905 m!818229))

(assert (=> b!877906 m!818169))

(assert (=> b!877906 m!818169))

(assert (=> b!877906 m!818177))

(assert (=> b!877908 m!818169))

(assert (=> b!877908 m!818169))

(assert (=> b!877908 m!818177))

(assert (=> b!877674 d!108983))

(declare-fun b!877916 () Bool)

(declare-fun e!488778 () Bool)

(assert (=> b!877916 (= e!488778 tp_is_empty!17425)))

(declare-fun mapIsEmpty!27758 () Bool)

(declare-fun mapRes!27758 () Bool)

(assert (=> mapIsEmpty!27758 mapRes!27758))

(declare-fun condMapEmpty!27758 () Bool)

(declare-fun mapDefault!27758 () ValueCell!8273)

(assert (=> mapNonEmpty!27749 (= condMapEmpty!27758 (= mapRest!27749 ((as const (Array (_ BitVec 32) ValueCell!8273)) mapDefault!27758)))))

(declare-fun e!488777 () Bool)

(assert (=> mapNonEmpty!27749 (= tp!53221 (and e!488777 mapRes!27758))))

(declare-fun b!877917 () Bool)

(assert (=> b!877917 (= e!488777 tp_is_empty!17425)))

(declare-fun mapNonEmpty!27758 () Bool)

(declare-fun tp!53237 () Bool)

(assert (=> mapNonEmpty!27758 (= mapRes!27758 (and tp!53237 e!488778))))

(declare-fun mapRest!27758 () (Array (_ BitVec 32) ValueCell!8273))

(declare-fun mapValue!27758 () ValueCell!8273)

(declare-fun mapKey!27758 () (_ BitVec 32))

(assert (=> mapNonEmpty!27758 (= mapRest!27749 (store mapRest!27758 mapKey!27758 mapValue!27758))))

(assert (= (and mapNonEmpty!27749 condMapEmpty!27758) mapIsEmpty!27758))

(assert (= (and mapNonEmpty!27749 (not condMapEmpty!27758)) mapNonEmpty!27758))

(assert (= (and mapNonEmpty!27758 ((_ is ValueCellFull!8273) mapValue!27758)) b!877916))

(assert (= (and mapNonEmpty!27749 ((_ is ValueCellFull!8273) mapDefault!27758)) b!877917))

(declare-fun m!818231 () Bool)

(assert (=> mapNonEmpty!27758 m!818231))

(declare-fun b_lambda!12287 () Bool)

(assert (= b_lambda!12271 (or (and start!74606 b_free!15181) b_lambda!12287)))

(declare-fun b_lambda!12289 () Bool)

(assert (= b_lambda!12273 (or (and start!74606 b_free!15181) b_lambda!12289)))

(declare-fun b_lambda!12291 () Bool)

(assert (= b_lambda!12277 (or (and start!74606 b_free!15181) b_lambda!12291)))

(declare-fun b_lambda!12293 () Bool)

(assert (= b_lambda!12285 (or (and start!74606 b_free!15181) b_lambda!12293)))

(declare-fun b_lambda!12295 () Bool)

(assert (= b_lambda!12279 (or (and start!74606 b_free!15181) b_lambda!12295)))

(declare-fun b_lambda!12297 () Bool)

(assert (= b_lambda!12283 (or (and start!74606 b_free!15181) b_lambda!12297)))

(declare-fun b_lambda!12299 () Bool)

(assert (= b_lambda!12281 (or (and start!74606 b_free!15181) b_lambda!12299)))

(declare-fun b_lambda!12301 () Bool)

(assert (= b_lambda!12275 (or (and start!74606 b_free!15181) b_lambda!12301)))

(check-sat (not b!877818) (not d!108961) (not b!877855) (not bm!38851) (not b!877906) (not b!877839) (not b!877812) (not b!877858) (not b!877825) (not bm!38844) (not b!877809) (not b!877851) (not d!108965) (not bm!38859) (not b!877890) (not d!108969) (not b!877881) (not b!877856) (not b!877832) (not d!108953) (not b!877876) (not b!877853) (not b_lambda!12291) (not b!877908) (not d!108959) (not b!877815) (not b!877817) (not b!877850) (not b!877870) (not b!877877) (not b!877806) (not b!877857) (not b!877874) tp_is_empty!17425 (not b!877893) (not b!877889) (not b!877841) (not b!877887) (not b!877808) (not b!877872) (not b!877820) (not b!877805) (not b_lambda!12269) (not b!877842) (not b!877878) (not bm!38845) (not bm!38850) (not b!877852) (not b!877905) (not b!877840) b_and!25051 (not d!108957) (not d!108943) (not b_lambda!12301) (not b_lambda!12299) (not d!108975) (not b!877868) (not b!877843) (not b!877886) (not b!877813) (not bm!38855) (not b_lambda!12293) (not b_next!15181) (not d!108979) (not d!108945) (not b!877854) (not b!877821) (not d!108981) (not b!877894) (not b!877807) (not b!877819) (not bm!38854) (not b!877803) (not b_lambda!12289) (not b!877882) (not b_lambda!12287) (not b!877844) (not d!108971) (not b_lambda!12297) (not b!877849) (not b!877824) (not b!877875) (not bm!38856) (not b!877884) (not b_lambda!12295) (not mapNonEmpty!27758) (not b!877888))
(check-sat b_and!25051 (not b_next!15181))
(get-model)

(declare-fun d!108985 () Bool)

(declare-fun e!488784 () Bool)

(assert (=> d!108985 e!488784))

(declare-fun res!596234 () Bool)

(assert (=> d!108985 (=> res!596234 e!488784)))

(declare-fun lt!397212 () Bool)

(assert (=> d!108985 (= res!596234 (not lt!397212))))

(declare-fun lt!397214 () Bool)

(assert (=> d!108985 (= lt!397212 lt!397214)))

(declare-fun lt!397215 () Unit!29960)

(declare-fun e!488783 () Unit!29960)

(assert (=> d!108985 (= lt!397215 e!488783)))

(declare-fun c!92949 () Bool)

(assert (=> d!108985 (= c!92949 lt!397214)))

(declare-fun containsKey!403 (List!17355 (_ BitVec 64)) Bool)

(assert (=> d!108985 (= lt!397214 (containsKey!403 (toList!5160 lt!397190) (select (arr!24532 _keys!868) from!1053)))))

(assert (=> d!108985 (= (contains!4226 lt!397190 (select (arr!24532 _keys!868) from!1053)) lt!397212)))

(declare-fun b!877924 () Bool)

(declare-fun lt!397213 () Unit!29960)

(assert (=> b!877924 (= e!488783 lt!397213)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!312 (List!17355 (_ BitVec 64)) Unit!29960)

(assert (=> b!877924 (= lt!397213 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397190) (select (arr!24532 _keys!868) from!1053)))))

(declare-fun isDefined!313 (Option!426) Bool)

(assert (=> b!877924 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397190) (select (arr!24532 _keys!868) from!1053)))))

(declare-fun b!877925 () Bool)

(declare-fun Unit!29964 () Unit!29960)

(assert (=> b!877925 (= e!488783 Unit!29964)))

(declare-fun b!877926 () Bool)

(assert (=> b!877926 (= e!488784 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397190) (select (arr!24532 _keys!868) from!1053))))))

(assert (= (and d!108985 c!92949) b!877924))

(assert (= (and d!108985 (not c!92949)) b!877925))

(assert (= (and d!108985 (not res!596234)) b!877926))

(assert (=> d!108985 m!817883))

(declare-fun m!818233 () Bool)

(assert (=> d!108985 m!818233))

(assert (=> b!877924 m!817883))

(declare-fun m!818235 () Bool)

(assert (=> b!877924 m!818235))

(assert (=> b!877924 m!817883))

(declare-fun m!818237 () Bool)

(assert (=> b!877924 m!818237))

(assert (=> b!877924 m!818237))

(declare-fun m!818239 () Bool)

(assert (=> b!877924 m!818239))

(assert (=> b!877926 m!817883))

(assert (=> b!877926 m!818237))

(assert (=> b!877926 m!818237))

(assert (=> b!877926 m!818239))

(assert (=> b!877878 d!108985))

(declare-fun d!108987 () Bool)

(assert (=> d!108987 (= (get!12925 (select (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!397051) lt!397051)))

(assert (=> b!877852 d!108987))

(declare-fun d!108989 () Bool)

(declare-fun isEmpty!670 (List!17355) Bool)

(assert (=> d!108989 (= (isEmpty!669 lt!397136) (isEmpty!670 (toList!5160 lt!397136)))))

(declare-fun bs!24633 () Bool)

(assert (= bs!24633 d!108989))

(declare-fun m!818241 () Bool)

(assert (=> bs!24633 m!818241))

(assert (=> b!877820 d!108989))

(declare-fun lt!397218 () Bool)

(declare-fun d!108991 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!391 (List!17355) (InoxSet tuple2!11518))

(assert (=> d!108991 (= lt!397218 (select (content!391 (toList!5160 lt!397179)) (tuple2!11519 k0!854 v!557)))))

(declare-fun e!488789 () Bool)

(assert (=> d!108991 (= lt!397218 e!488789)))

(declare-fun res!596239 () Bool)

(assert (=> d!108991 (=> (not res!596239) (not e!488789))))

(assert (=> d!108991 (= res!596239 ((_ is Cons!17351) (toList!5160 lt!397179)))))

(assert (=> d!108991 (= (contains!4227 (toList!5160 lt!397179) (tuple2!11519 k0!854 v!557)) lt!397218)))

(declare-fun b!877931 () Bool)

(declare-fun e!488790 () Bool)

(assert (=> b!877931 (= e!488789 e!488790)))

(declare-fun res!596240 () Bool)

(assert (=> b!877931 (=> res!596240 e!488790)))

(assert (=> b!877931 (= res!596240 (= (h!18488 (toList!5160 lt!397179)) (tuple2!11519 k0!854 v!557)))))

(declare-fun b!877932 () Bool)

(assert (=> b!877932 (= e!488790 (contains!4227 (t!24432 (toList!5160 lt!397179)) (tuple2!11519 k0!854 v!557)))))

(assert (= (and d!108991 res!596239) b!877931))

(assert (= (and b!877931 (not res!596240)) b!877932))

(declare-fun m!818243 () Bool)

(assert (=> d!108991 m!818243))

(declare-fun m!818245 () Bool)

(assert (=> d!108991 m!818245))

(declare-fun m!818247 () Bool)

(assert (=> b!877932 m!818247))

(assert (=> b!877858 d!108991))

(assert (=> b!877876 d!108951))

(declare-fun b!877933 () Bool)

(declare-fun e!488791 () ListLongMap!10289)

(assert (=> b!877933 (= e!488791 (ListLongMap!10290 Nil!17352))))

(declare-fun b!877934 () Bool)

(declare-fun lt!397220 () Unit!29960)

(declare-fun lt!397222 () Unit!29960)

(assert (=> b!877934 (= lt!397220 lt!397222)))

(declare-fun lt!397223 () (_ BitVec 64))

(declare-fun lt!397225 () (_ BitVec 64))

(declare-fun lt!397221 () V!28281)

(declare-fun lt!397224 () ListLongMap!10289)

(assert (=> b!877934 (not (contains!4226 (+!2505 lt!397224 (tuple2!11519 lt!397225 lt!397221)) lt!397223))))

(assert (=> b!877934 (= lt!397222 (addStillNotContains!204 lt!397224 lt!397225 lt!397221 lt!397223))))

(assert (=> b!877934 (= lt!397223 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!877934 (= lt!397221 (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!877934 (= lt!397225 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(declare-fun call!38863 () ListLongMap!10289)

(assert (=> b!877934 (= lt!397224 call!38863)))

(declare-fun e!488796 () ListLongMap!10289)

(assert (=> b!877934 (= e!488796 (+!2505 call!38863 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877935 () Bool)

(declare-fun e!488795 () Bool)

(declare-fun e!488793 () Bool)

(assert (=> b!877935 (= e!488795 e!488793)))

(declare-fun c!92950 () Bool)

(assert (=> b!877935 (= c!92950 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun b!877936 () Bool)

(declare-fun e!488792 () Bool)

(assert (=> b!877936 (= e!488792 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!877936 (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!877937 () Bool)

(declare-fun res!596242 () Bool)

(declare-fun e!488794 () Bool)

(assert (=> b!877937 (=> (not res!596242) (not e!488794))))

(declare-fun lt!397219 () ListLongMap!10289)

(assert (=> b!877937 (= res!596242 (not (contains!4226 lt!397219 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877938 () Bool)

(assert (=> b!877938 (= e!488791 e!488796)))

(declare-fun c!92951 () Bool)

(assert (=> b!877938 (= c!92951 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(declare-fun b!877939 () Bool)

(assert (=> b!877939 (= e!488793 (isEmpty!669 lt!397219))))

(declare-fun d!108993 () Bool)

(assert (=> d!108993 e!488794))

(declare-fun res!596244 () Bool)

(assert (=> d!108993 (=> (not res!596244) (not e!488794))))

(assert (=> d!108993 (= res!596244 (not (contains!4226 lt!397219 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108993 (= lt!397219 e!488791)))

(declare-fun c!92953 () Bool)

(assert (=> d!108993 (= c!92953 (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(assert (=> d!108993 (validMask!0 mask!1196)))

(assert (=> d!108993 (= (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696) lt!397219)))

(declare-fun b!877940 () Bool)

(declare-fun e!488797 () Bool)

(assert (=> b!877940 (= e!488795 e!488797)))

(assert (=> b!877940 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun res!596243 () Bool)

(assert (=> b!877940 (= res!596243 (contains!4226 lt!397219 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!877940 (=> (not res!596243) (not e!488797))))

(declare-fun b!877941 () Bool)

(assert (=> b!877941 (= e!488794 e!488795)))

(declare-fun c!92952 () Bool)

(assert (=> b!877941 (= c!92952 e!488792)))

(declare-fun res!596241 () Bool)

(assert (=> b!877941 (=> (not res!596241) (not e!488792))))

(assert (=> b!877941 (= res!596241 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun b!877942 () Bool)

(assert (=> b!877942 (= e!488796 call!38863)))

(declare-fun b!877943 () Bool)

(assert (=> b!877943 (= e!488793 (= lt!397219 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!877944 () Bool)

(assert (=> b!877944 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(assert (=> b!877944 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24974 lt!397049)))))

(assert (=> b!877944 (= e!488797 (= (apply!377 lt!397219 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38860 () Bool)

(assert (=> bm!38860 (= call!38863 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108993 c!92953) b!877933))

(assert (= (and d!108993 (not c!92953)) b!877938))

(assert (= (and b!877938 c!92951) b!877934))

(assert (= (and b!877938 (not c!92951)) b!877942))

(assert (= (or b!877934 b!877942) bm!38860))

(assert (= (and d!108993 res!596244) b!877937))

(assert (= (and b!877937 res!596242) b!877941))

(assert (= (and b!877941 res!596241) b!877936))

(assert (= (and b!877941 c!92952) b!877940))

(assert (= (and b!877941 (not c!92952)) b!877935))

(assert (= (and b!877940 res!596243) b!877944))

(assert (= (and b!877935 c!92950) b!877943))

(assert (= (and b!877935 (not c!92950)) b!877939))

(declare-fun b_lambda!12303 () Bool)

(assert (=> (not b_lambda!12303) (not b!877934)))

(assert (=> b!877934 t!24431))

(declare-fun b_and!25053 () Bool)

(assert (= b_and!25051 (and (=> t!24431 result!9493) b_and!25053)))

(declare-fun b_lambda!12305 () Bool)

(assert (=> (not b_lambda!12305) (not b!877944)))

(assert (=> b!877944 t!24431))

(declare-fun b_and!25055 () Bool)

(assert (= b_and!25053 (and (=> t!24431 result!9493) b_and!25055)))

(declare-fun m!818249 () Bool)

(assert (=> b!877936 m!818249))

(assert (=> b!877936 m!818249))

(declare-fun m!818251 () Bool)

(assert (=> b!877936 m!818251))

(declare-fun m!818253 () Bool)

(assert (=> b!877937 m!818253))

(declare-fun m!818255 () Bool)

(assert (=> b!877944 m!818255))

(assert (=> b!877944 m!817885))

(declare-fun m!818257 () Bool)

(assert (=> b!877944 m!818257))

(assert (=> b!877944 m!817885))

(assert (=> b!877944 m!818249))

(declare-fun m!818259 () Bool)

(assert (=> b!877944 m!818259))

(assert (=> b!877944 m!818249))

(assert (=> b!877944 m!818255))

(declare-fun m!818261 () Bool)

(assert (=> b!877934 m!818261))

(declare-fun m!818263 () Bool)

(assert (=> b!877934 m!818263))

(assert (=> b!877934 m!817885))

(assert (=> b!877934 m!818255))

(declare-fun m!818265 () Bool)

(assert (=> b!877934 m!818265))

(declare-fun m!818267 () Bool)

(assert (=> b!877934 m!818267))

(assert (=> b!877934 m!818255))

(assert (=> b!877934 m!817885))

(assert (=> b!877934 m!818257))

(assert (=> b!877934 m!818249))

(assert (=> b!877934 m!818265))

(declare-fun m!818269 () Bool)

(assert (=> bm!38860 m!818269))

(declare-fun m!818271 () Bool)

(assert (=> b!877939 m!818271))

(assert (=> b!877940 m!818249))

(assert (=> b!877940 m!818249))

(declare-fun m!818273 () Bool)

(assert (=> b!877940 m!818273))

(declare-fun m!818275 () Bool)

(assert (=> d!108993 m!818275))

(assert (=> d!108993 m!817911))

(assert (=> b!877938 m!818249))

(assert (=> b!877938 m!818249))

(assert (=> b!877938 m!818251))

(assert (=> b!877943 m!818269))

(assert (=> b!877824 d!108993))

(declare-fun b!877954 () Bool)

(declare-fun e!488802 () Option!426)

(declare-fun e!488803 () Option!426)

(assert (=> b!877954 (= e!488802 e!488803)))

(declare-fun c!92959 () Bool)

(assert (=> b!877954 (= c!92959 (and ((_ is Cons!17351) (toList!5160 lt!397160)) (not (= (_1!5770 (h!18488 (toList!5160 lt!397160))) (_1!5770 (tuple2!11519 k0!854 lt!397052))))))))

(declare-fun b!877955 () Bool)

(assert (=> b!877955 (= e!488803 (getValueByKey!420 (t!24432 (toList!5160 lt!397160)) (_1!5770 (tuple2!11519 k0!854 lt!397052))))))

(declare-fun b!877953 () Bool)

(assert (=> b!877953 (= e!488802 (Some!425 (_2!5770 (h!18488 (toList!5160 lt!397160)))))))

(declare-fun d!108995 () Bool)

(declare-fun c!92958 () Bool)

(assert (=> d!108995 (= c!92958 (and ((_ is Cons!17351) (toList!5160 lt!397160)) (= (_1!5770 (h!18488 (toList!5160 lt!397160))) (_1!5770 (tuple2!11519 k0!854 lt!397052)))))))

(assert (=> d!108995 (= (getValueByKey!420 (toList!5160 lt!397160) (_1!5770 (tuple2!11519 k0!854 lt!397052))) e!488802)))

(declare-fun b!877956 () Bool)

(assert (=> b!877956 (= e!488803 None!424)))

(assert (= (and d!108995 c!92958) b!877953))

(assert (= (and d!108995 (not c!92958)) b!877954))

(assert (= (and b!877954 c!92959) b!877955))

(assert (= (and b!877954 (not c!92959)) b!877956))

(declare-fun m!818277 () Bool)

(assert (=> b!877955 m!818277))

(assert (=> b!877841 d!108995))

(declare-fun b!877958 () Bool)

(declare-fun e!488804 () Option!426)

(declare-fun e!488805 () Option!426)

(assert (=> b!877958 (= e!488804 e!488805)))

(declare-fun c!92961 () Bool)

(assert (=> b!877958 (= c!92961 (and ((_ is Cons!17351) (toList!5160 lt!397156)) (not (= (_1!5770 (h!18488 (toList!5160 lt!397156))) (_1!5770 (tuple2!11519 k0!854 v!557))))))))

(declare-fun b!877959 () Bool)

(assert (=> b!877959 (= e!488805 (getValueByKey!420 (t!24432 (toList!5160 lt!397156)) (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!877957 () Bool)

(assert (=> b!877957 (= e!488804 (Some!425 (_2!5770 (h!18488 (toList!5160 lt!397156)))))))

(declare-fun c!92960 () Bool)

(declare-fun d!108997 () Bool)

(assert (=> d!108997 (= c!92960 (and ((_ is Cons!17351) (toList!5160 lt!397156)) (= (_1!5770 (h!18488 (toList!5160 lt!397156))) (_1!5770 (tuple2!11519 k0!854 v!557)))))))

(assert (=> d!108997 (= (getValueByKey!420 (toList!5160 lt!397156) (_1!5770 (tuple2!11519 k0!854 v!557))) e!488804)))

(declare-fun b!877960 () Bool)

(assert (=> b!877960 (= e!488805 None!424)))

(assert (= (and d!108997 c!92960) b!877957))

(assert (= (and d!108997 (not c!92960)) b!877958))

(assert (= (and b!877958 c!92961) b!877959))

(assert (= (and b!877958 (not c!92961)) b!877960))

(declare-fun m!818279 () Bool)

(assert (=> b!877959 m!818279))

(assert (=> b!877839 d!108997))

(declare-fun d!108999 () Bool)

(assert (=> d!108999 (= (isEmpty!669 lt!397197) (isEmpty!670 (toList!5160 lt!397197)))))

(declare-fun bs!24634 () Bool)

(assert (= bs!24634 d!108999))

(declare-fun m!818281 () Bool)

(assert (=> bs!24634 m!818281))

(assert (=> b!877889 d!108999))

(declare-fun d!109001 () Bool)

(declare-fun e!488807 () Bool)

(assert (=> d!109001 e!488807))

(declare-fun res!596245 () Bool)

(assert (=> d!109001 (=> res!596245 e!488807)))

(declare-fun lt!397226 () Bool)

(assert (=> d!109001 (= res!596245 (not lt!397226))))

(declare-fun lt!397228 () Bool)

(assert (=> d!109001 (= lt!397226 lt!397228)))

(declare-fun lt!397229 () Unit!29960)

(declare-fun e!488806 () Unit!29960)

(assert (=> d!109001 (= lt!397229 e!488806)))

(declare-fun c!92962 () Bool)

(assert (=> d!109001 (= c!92962 lt!397228)))

(assert (=> d!109001 (= lt!397228 (containsKey!403 (toList!5160 lt!397171) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(assert (=> d!109001 (= (contains!4226 lt!397171 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))) lt!397226)))

(declare-fun b!877961 () Bool)

(declare-fun lt!397227 () Unit!29960)

(assert (=> b!877961 (= e!488806 lt!397227)))

(assert (=> b!877961 (= lt!397227 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397171) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(assert (=> b!877961 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397171) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(declare-fun b!877962 () Bool)

(declare-fun Unit!29965 () Unit!29960)

(assert (=> b!877962 (= e!488806 Unit!29965)))

(declare-fun b!877963 () Bool)

(assert (=> b!877963 (= e!488807 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397171) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))))

(assert (= (and d!109001 c!92962) b!877961))

(assert (= (and d!109001 (not c!92962)) b!877962))

(assert (= (and d!109001 (not res!596245)) b!877963))

(declare-fun m!818283 () Bool)

(assert (=> d!109001 m!818283))

(declare-fun m!818285 () Bool)

(assert (=> b!877961 m!818285))

(assert (=> b!877961 m!818141))

(assert (=> b!877961 m!818141))

(declare-fun m!818287 () Bool)

(assert (=> b!877961 m!818287))

(assert (=> b!877963 m!818141))

(assert (=> b!877963 m!818141))

(assert (=> b!877963 m!818287))

(assert (=> d!108969 d!109001))

(declare-fun b!877965 () Bool)

(declare-fun e!488808 () Option!426)

(declare-fun e!488809 () Option!426)

(assert (=> b!877965 (= e!488808 e!488809)))

(declare-fun c!92964 () Bool)

(assert (=> b!877965 (= c!92964 (and ((_ is Cons!17351) lt!397170) (not (= (_1!5770 (h!18488 lt!397170)) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))))

(declare-fun b!877966 () Bool)

(assert (=> b!877966 (= e!488809 (getValueByKey!420 (t!24432 lt!397170) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(declare-fun b!877964 () Bool)

(assert (=> b!877964 (= e!488808 (Some!425 (_2!5770 (h!18488 lt!397170))))))

(declare-fun c!92963 () Bool)

(declare-fun d!109003 () Bool)

(assert (=> d!109003 (= c!92963 (and ((_ is Cons!17351) lt!397170) (= (_1!5770 (h!18488 lt!397170)) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))))

(assert (=> d!109003 (= (getValueByKey!420 lt!397170 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))) e!488808)))

(declare-fun b!877967 () Bool)

(assert (=> b!877967 (= e!488809 None!424)))

(assert (= (and d!109003 c!92963) b!877964))

(assert (= (and d!109003 (not c!92963)) b!877965))

(assert (= (and b!877965 c!92964) b!877966))

(assert (= (and b!877965 (not c!92964)) b!877967))

(declare-fun m!818289 () Bool)

(assert (=> b!877966 m!818289))

(assert (=> d!108969 d!109003))

(declare-fun d!109005 () Bool)

(assert (=> d!109005 (= (getValueByKey!420 lt!397170 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))) (Some!425 (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(declare-fun lt!397232 () Unit!29960)

(declare-fun choose!1438 (List!17355 (_ BitVec 64) V!28281) Unit!29960)

(assert (=> d!109005 (= lt!397232 (choose!1438 lt!397170 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(declare-fun e!488812 () Bool)

(assert (=> d!109005 e!488812))

(declare-fun res!596250 () Bool)

(assert (=> d!109005 (=> (not res!596250) (not e!488812))))

(declare-fun isStrictlySorted!449 (List!17355) Bool)

(assert (=> d!109005 (= res!596250 (isStrictlySorted!449 lt!397170))))

(assert (=> d!109005 (= (lemmaContainsTupThenGetReturnValue!234 lt!397170 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))) lt!397232)))

(declare-fun b!877972 () Bool)

(declare-fun res!596251 () Bool)

(assert (=> b!877972 (=> (not res!596251) (not e!488812))))

(assert (=> b!877972 (= res!596251 (containsKey!403 lt!397170 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(declare-fun b!877973 () Bool)

(assert (=> b!877973 (= e!488812 (contains!4227 lt!397170 (tuple2!11519 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))))

(assert (= (and d!109005 res!596250) b!877972))

(assert (= (and b!877972 res!596251) b!877973))

(assert (=> d!109005 m!818135))

(declare-fun m!818291 () Bool)

(assert (=> d!109005 m!818291))

(declare-fun m!818293 () Bool)

(assert (=> d!109005 m!818293))

(declare-fun m!818295 () Bool)

(assert (=> b!877972 m!818295))

(declare-fun m!818297 () Bool)

(assert (=> b!877973 m!818297))

(assert (=> d!108969 d!109005))

(declare-fun b!877994 () Bool)

(declare-fun e!488824 () List!17355)

(declare-fun call!38872 () List!17355)

(assert (=> b!877994 (= e!488824 call!38872)))

(declare-fun e!488827 () List!17355)

(declare-fun c!92973 () Bool)

(declare-fun c!92976 () Bool)

(declare-fun b!877995 () Bool)

(assert (=> b!877995 (= e!488827 (ite c!92973 (t!24432 (toList!5160 lt!397053)) (ite c!92976 (Cons!17351 (h!18488 (toList!5160 lt!397053)) (t!24432 (toList!5160 lt!397053))) Nil!17352)))))

(declare-fun b!877996 () Bool)

(declare-fun res!596256 () Bool)

(declare-fun e!488826 () Bool)

(assert (=> b!877996 (=> (not res!596256) (not e!488826))))

(declare-fun lt!397235 () List!17355)

(assert (=> b!877996 (= res!596256 (containsKey!403 lt!397235 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(declare-fun b!877997 () Bool)

(declare-fun e!488823 () List!17355)

(assert (=> b!877997 (= e!488823 e!488824)))

(assert (=> b!877997 (= c!92973 (and ((_ is Cons!17351) (toList!5160 lt!397053)) (= (_1!5770 (h!18488 (toList!5160 lt!397053))) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))))

(declare-fun b!877999 () Bool)

(declare-fun e!488825 () List!17355)

(declare-fun call!38871 () List!17355)

(assert (=> b!877999 (= e!488825 call!38871)))

(declare-fun b!878000 () Bool)

(assert (=> b!878000 (= e!488827 (insertStrictlySorted!273 (t!24432 (toList!5160 lt!397053)) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(declare-fun b!878001 () Bool)

(declare-fun call!38870 () List!17355)

(assert (=> b!878001 (= e!488823 call!38870)))

(declare-fun b!878002 () Bool)

(assert (=> b!878002 (= c!92976 (and ((_ is Cons!17351) (toList!5160 lt!397053)) (bvsgt (_1!5770 (h!18488 (toList!5160 lt!397053))) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))))

(assert (=> b!878002 (= e!488824 e!488825)))

(declare-fun b!878003 () Bool)

(assert (=> b!878003 (= e!488826 (contains!4227 lt!397235 (tuple2!11519 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))))

(declare-fun bm!38867 () Bool)

(assert (=> bm!38867 (= call!38871 call!38872)))

(declare-fun b!877998 () Bool)

(assert (=> b!877998 (= e!488825 call!38871)))

(declare-fun d!109007 () Bool)

(assert (=> d!109007 e!488826))

(declare-fun res!596257 () Bool)

(assert (=> d!109007 (=> (not res!596257) (not e!488826))))

(assert (=> d!109007 (= res!596257 (isStrictlySorted!449 lt!397235))))

(assert (=> d!109007 (= lt!397235 e!488823)))

(declare-fun c!92975 () Bool)

(assert (=> d!109007 (= c!92975 (and ((_ is Cons!17351) (toList!5160 lt!397053)) (bvslt (_1!5770 (h!18488 (toList!5160 lt!397053))) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))))

(assert (=> d!109007 (isStrictlySorted!449 (toList!5160 lt!397053))))

(assert (=> d!109007 (= (insertStrictlySorted!273 (toList!5160 lt!397053) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))) lt!397235)))

(declare-fun bm!38868 () Bool)

(declare-fun $colon$colon!535 (List!17355 tuple2!11518) List!17355)

(assert (=> bm!38868 (= call!38870 ($colon$colon!535 e!488827 (ite c!92975 (h!18488 (toList!5160 lt!397053)) (tuple2!11519 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))))

(declare-fun c!92974 () Bool)

(assert (=> bm!38868 (= c!92974 c!92975)))

(declare-fun bm!38869 () Bool)

(assert (=> bm!38869 (= call!38872 call!38870)))

(assert (= (and d!109007 c!92975) b!878001))

(assert (= (and d!109007 (not c!92975)) b!877997))

(assert (= (and b!877997 c!92973) b!877994))

(assert (= (and b!877997 (not c!92973)) b!878002))

(assert (= (and b!878002 c!92976) b!877998))

(assert (= (and b!878002 (not c!92976)) b!877999))

(assert (= (or b!877998 b!877999) bm!38867))

(assert (= (or b!877994 bm!38867) bm!38869))

(assert (= (or b!878001 bm!38869) bm!38868))

(assert (= (and bm!38868 c!92974) b!878000))

(assert (= (and bm!38868 (not c!92974)) b!877995))

(assert (= (and d!109007 res!596257) b!877996))

(assert (= (and b!877996 res!596256) b!878003))

(declare-fun m!818299 () Bool)

(assert (=> b!878000 m!818299))

(declare-fun m!818301 () Bool)

(assert (=> bm!38868 m!818301))

(declare-fun m!818303 () Bool)

(assert (=> b!877996 m!818303))

(declare-fun m!818305 () Bool)

(assert (=> b!878003 m!818305))

(declare-fun m!818307 () Bool)

(assert (=> d!109007 m!818307))

(declare-fun m!818309 () Bool)

(assert (=> d!109007 m!818309))

(assert (=> d!108969 d!109007))

(assert (=> bm!38845 d!108993))

(declare-fun d!109009 () Bool)

(declare-fun lt!397238 () Bool)

(declare-fun content!392 (List!17356) (InoxSet (_ BitVec 64)))

(assert (=> d!109009 (= lt!397238 (select (content!392 Nil!17353) (select (arr!24532 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun e!488832 () Bool)

(assert (=> d!109009 (= lt!397238 e!488832)))

(declare-fun res!596263 () Bool)

(assert (=> d!109009 (=> (not res!596263) (not e!488832))))

(assert (=> d!109009 (= res!596263 ((_ is Cons!17352) Nil!17353))))

(assert (=> d!109009 (= (contains!4228 Nil!17353 (select (arr!24532 _keys!868) #b00000000000000000000000000000000)) lt!397238)))

(declare-fun b!878008 () Bool)

(declare-fun e!488833 () Bool)

(assert (=> b!878008 (= e!488832 e!488833)))

(declare-fun res!596262 () Bool)

(assert (=> b!878008 (=> res!596262 e!488833)))

(assert (=> b!878008 (= res!596262 (= (h!18489 Nil!17353) (select (arr!24532 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!878009 () Bool)

(assert (=> b!878009 (= e!488833 (contains!4228 (t!24433 Nil!17353) (select (arr!24532 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!109009 res!596263) b!878008))

(assert (= (and b!878008 (not res!596262)) b!878009))

(declare-fun m!818311 () Bool)

(assert (=> d!109009 m!818311))

(assert (=> d!109009 m!818169))

(declare-fun m!818313 () Bool)

(assert (=> d!109009 m!818313))

(assert (=> b!878009 m!818169))

(declare-fun m!818315 () Bool)

(assert (=> b!878009 m!818315))

(assert (=> b!877905 d!109009))

(declare-fun b!878011 () Bool)

(declare-fun e!488834 () Option!426)

(declare-fun e!488835 () Option!426)

(assert (=> b!878011 (= e!488834 e!488835)))

(declare-fun c!92978 () Bool)

(assert (=> b!878011 (= c!92978 (and ((_ is Cons!17351) (toList!5160 lt!397164)) (not (= (_1!5770 (h!18488 (toList!5160 lt!397164))) (_1!5770 lt!397048)))))))

(declare-fun b!878012 () Bool)

(assert (=> b!878012 (= e!488835 (getValueByKey!420 (t!24432 (toList!5160 lt!397164)) (_1!5770 lt!397048)))))

(declare-fun b!878010 () Bool)

(assert (=> b!878010 (= e!488834 (Some!425 (_2!5770 (h!18488 (toList!5160 lt!397164)))))))

(declare-fun d!109011 () Bool)

(declare-fun c!92977 () Bool)

(assert (=> d!109011 (= c!92977 (and ((_ is Cons!17351) (toList!5160 lt!397164)) (= (_1!5770 (h!18488 (toList!5160 lt!397164))) (_1!5770 lt!397048))))))

(assert (=> d!109011 (= (getValueByKey!420 (toList!5160 lt!397164) (_1!5770 lt!397048)) e!488834)))

(declare-fun b!878013 () Bool)

(assert (=> b!878013 (= e!488835 None!424)))

(assert (= (and d!109011 c!92977) b!878010))

(assert (= (and d!109011 (not c!92977)) b!878011))

(assert (= (and b!878011 c!92978) b!878012))

(assert (= (and b!878011 (not c!92978)) b!878013))

(declare-fun m!818317 () Bool)

(assert (=> b!878012 m!818317))

(assert (=> b!877843 d!109011))

(declare-fun d!109013 () Bool)

(declare-fun e!488837 () Bool)

(assert (=> d!109013 e!488837))

(declare-fun res!596264 () Bool)

(assert (=> d!109013 (=> res!596264 e!488837)))

(declare-fun lt!397239 () Bool)

(assert (=> d!109013 (= res!596264 (not lt!397239))))

(declare-fun lt!397241 () Bool)

(assert (=> d!109013 (= lt!397239 lt!397241)))

(declare-fun lt!397242 () Unit!29960)

(declare-fun e!488836 () Unit!29960)

(assert (=> d!109013 (= lt!397242 e!488836)))

(declare-fun c!92979 () Bool)

(assert (=> d!109013 (= c!92979 lt!397241)))

(assert (=> d!109013 (= lt!397241 (containsKey!403 (toList!5160 lt!397129) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109013 (= (contains!4226 lt!397129 #b0000000000000000000000000000000000000000000000000000000000000000) lt!397239)))

(declare-fun b!878014 () Bool)

(declare-fun lt!397240 () Unit!29960)

(assert (=> b!878014 (= e!488836 lt!397240)))

(assert (=> b!878014 (= lt!397240 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397129) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!878014 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397129) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!878015 () Bool)

(declare-fun Unit!29966 () Unit!29960)

(assert (=> b!878015 (= e!488836 Unit!29966)))

(declare-fun b!878016 () Bool)

(assert (=> b!878016 (= e!488837 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397129) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109013 c!92979) b!878014))

(assert (= (and d!109013 (not c!92979)) b!878015))

(assert (= (and d!109013 (not res!596264)) b!878016))

(declare-fun m!818319 () Bool)

(assert (=> d!109013 m!818319))

(declare-fun m!818321 () Bool)

(assert (=> b!878014 m!818321))

(declare-fun m!818323 () Bool)

(assert (=> b!878014 m!818323))

(assert (=> b!878014 m!818323))

(declare-fun m!818325 () Bool)

(assert (=> b!878014 m!818325))

(assert (=> b!878016 m!818323))

(assert (=> b!878016 m!818323))

(assert (=> b!878016 m!818325))

(assert (=> d!108943 d!109013))

(assert (=> d!108943 d!108955))

(declare-fun d!109015 () Bool)

(declare-fun get!12926 (Option!426) V!28281)

(assert (=> d!109015 (= (apply!377 lt!397190 (select (arr!24532 _keys!868) from!1053)) (get!12926 (getValueByKey!420 (toList!5160 lt!397190) (select (arr!24532 _keys!868) from!1053))))))

(declare-fun bs!24635 () Bool)

(assert (= bs!24635 d!109015))

(assert (=> bs!24635 m!817883))

(assert (=> bs!24635 m!818237))

(assert (=> bs!24635 m!818237))

(declare-fun m!818327 () Bool)

(assert (=> bs!24635 m!818327))

(assert (=> b!877882 d!109015))

(declare-fun d!109017 () Bool)

(declare-fun c!92980 () Bool)

(assert (=> d!109017 (= c!92980 ((_ is ValueCellFull!8273) (select (arr!24533 lt!397049) from!1053)))))

(declare-fun e!488838 () V!28281)

(assert (=> d!109017 (= (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488838)))

(declare-fun b!878017 () Bool)

(assert (=> b!878017 (= e!488838 (get!12924 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!878018 () Bool)

(assert (=> b!878018 (= e!488838 (get!12925 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109017 c!92980) b!878017))

(assert (= (and d!109017 (not c!92980)) b!878018))

(assert (=> b!878017 m!818183))

(assert (=> b!878017 m!817885))

(declare-fun m!818329 () Bool)

(assert (=> b!878017 m!818329))

(assert (=> b!878018 m!818183))

(assert (=> b!878018 m!817885))

(declare-fun m!818331 () Bool)

(assert (=> b!878018 m!818331))

(assert (=> b!877882 d!109017))

(declare-fun d!109019 () Bool)

(declare-fun e!488840 () Bool)

(assert (=> d!109019 e!488840))

(declare-fun res!596265 () Bool)

(assert (=> d!109019 (=> res!596265 e!488840)))

(declare-fun lt!397243 () Bool)

(assert (=> d!109019 (= res!596265 (not lt!397243))))

(declare-fun lt!397245 () Bool)

(assert (=> d!109019 (= lt!397243 lt!397245)))

(declare-fun lt!397246 () Unit!29960)

(declare-fun e!488839 () Unit!29960)

(assert (=> d!109019 (= lt!397246 e!488839)))

(declare-fun c!92981 () Bool)

(assert (=> d!109019 (= c!92981 lt!397245)))

(assert (=> d!109019 (= lt!397245 (containsKey!403 (toList!5160 lt!397197) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109019 (= (contains!4226 lt!397197 #b1000000000000000000000000000000000000000000000000000000000000000) lt!397243)))

(declare-fun b!878019 () Bool)

(declare-fun lt!397244 () Unit!29960)

(assert (=> b!878019 (= e!488839 lt!397244)))

(assert (=> b!878019 (= lt!397244 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397197) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!878019 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397197) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!878020 () Bool)

(declare-fun Unit!29967 () Unit!29960)

(assert (=> b!878020 (= e!488839 Unit!29967)))

(declare-fun b!878021 () Bool)

(assert (=> b!878021 (= e!488840 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397197) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109019 c!92981) b!878019))

(assert (= (and d!109019 (not c!92981)) b!878020))

(assert (= (and d!109019 (not res!596265)) b!878021))

(declare-fun m!818333 () Bool)

(assert (=> d!109019 m!818333))

(declare-fun m!818335 () Bool)

(assert (=> b!878019 m!818335))

(declare-fun m!818337 () Bool)

(assert (=> b!878019 m!818337))

(assert (=> b!878019 m!818337))

(declare-fun m!818339 () Bool)

(assert (=> b!878019 m!818339))

(assert (=> b!878021 m!818337))

(assert (=> b!878021 m!818337))

(assert (=> b!878021 m!818339))

(assert (=> b!877887 d!109019))

(declare-fun d!109021 () Bool)

(declare-fun e!488842 () Bool)

(assert (=> d!109021 e!488842))

(declare-fun res!596266 () Bool)

(assert (=> d!109021 (=> res!596266 e!488842)))

(declare-fun lt!397247 () Bool)

(assert (=> d!109021 (= res!596266 (not lt!397247))))

(declare-fun lt!397249 () Bool)

(assert (=> d!109021 (= lt!397247 lt!397249)))

(declare-fun lt!397250 () Unit!29960)

(declare-fun e!488841 () Unit!29960)

(assert (=> d!109021 (= lt!397250 e!488841)))

(declare-fun c!92982 () Bool)

(assert (=> d!109021 (= c!92982 lt!397249)))

(assert (=> d!109021 (= lt!397249 (containsKey!403 (toList!5160 lt!397129) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109021 (= (contains!4226 lt!397129 #b1000000000000000000000000000000000000000000000000000000000000000) lt!397247)))

(declare-fun b!878022 () Bool)

(declare-fun lt!397248 () Unit!29960)

(assert (=> b!878022 (= e!488841 lt!397248)))

(assert (=> b!878022 (= lt!397248 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397129) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!878022 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397129) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!878023 () Bool)

(declare-fun Unit!29968 () Unit!29960)

(assert (=> b!878023 (= e!488841 Unit!29968)))

(declare-fun b!878024 () Bool)

(assert (=> b!878024 (= e!488842 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397129) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109021 c!92982) b!878022))

(assert (= (and d!109021 (not c!92982)) b!878023))

(assert (= (and d!109021 (not res!596266)) b!878024))

(declare-fun m!818341 () Bool)

(assert (=> d!109021 m!818341))

(declare-fun m!818343 () Bool)

(assert (=> b!878022 m!818343))

(declare-fun m!818345 () Bool)

(assert (=> b!878022 m!818345))

(assert (=> b!878022 m!818345))

(declare-fun m!818347 () Bool)

(assert (=> b!878022 m!818347))

(assert (=> b!878024 m!818345))

(assert (=> b!878024 m!818345))

(assert (=> b!878024 m!818347))

(assert (=> b!877806 d!109021))

(declare-fun d!109023 () Bool)

(declare-fun e!488844 () Bool)

(assert (=> d!109023 e!488844))

(declare-fun res!596267 () Bool)

(assert (=> d!109023 (=> res!596267 e!488844)))

(declare-fun lt!397251 () Bool)

(assert (=> d!109023 (= res!596267 (not lt!397251))))

(declare-fun lt!397253 () Bool)

(assert (=> d!109023 (= lt!397251 lt!397253)))

(declare-fun lt!397254 () Unit!29960)

(declare-fun e!488843 () Unit!29960)

(assert (=> d!109023 (= lt!397254 e!488843)))

(declare-fun c!92983 () Bool)

(assert (=> d!109023 (= c!92983 lt!397253)))

(assert (=> d!109023 (= lt!397253 (containsKey!403 (toList!5160 lt!397175) (_1!5770 lt!397048)))))

(assert (=> d!109023 (= (contains!4226 lt!397175 (_1!5770 lt!397048)) lt!397251)))

(declare-fun b!878025 () Bool)

(declare-fun lt!397252 () Unit!29960)

(assert (=> b!878025 (= e!488843 lt!397252)))

(assert (=> b!878025 (= lt!397252 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397175) (_1!5770 lt!397048)))))

(assert (=> b!878025 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397175) (_1!5770 lt!397048)))))

(declare-fun b!878026 () Bool)

(declare-fun Unit!29969 () Unit!29960)

(assert (=> b!878026 (= e!488843 Unit!29969)))

(declare-fun b!878027 () Bool)

(assert (=> b!878027 (= e!488844 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397175) (_1!5770 lt!397048))))))

(assert (= (and d!109023 c!92983) b!878025))

(assert (= (and d!109023 (not c!92983)) b!878026))

(assert (= (and d!109023 (not res!596267)) b!878027))

(declare-fun m!818349 () Bool)

(assert (=> d!109023 m!818349))

(declare-fun m!818351 () Bool)

(assert (=> b!878025 m!818351))

(assert (=> b!878025 m!818153))

(assert (=> b!878025 m!818153))

(declare-fun m!818353 () Bool)

(assert (=> b!878025 m!818353))

(assert (=> b!878027 m!818153))

(assert (=> b!878027 m!818153))

(assert (=> b!878027 m!818353))

(assert (=> d!108971 d!109023))

(declare-fun b!878029 () Bool)

(declare-fun e!488845 () Option!426)

(declare-fun e!488846 () Option!426)

(assert (=> b!878029 (= e!488845 e!488846)))

(declare-fun c!92985 () Bool)

(assert (=> b!878029 (= c!92985 (and ((_ is Cons!17351) lt!397174) (not (= (_1!5770 (h!18488 lt!397174)) (_1!5770 lt!397048)))))))

(declare-fun b!878030 () Bool)

(assert (=> b!878030 (= e!488846 (getValueByKey!420 (t!24432 lt!397174) (_1!5770 lt!397048)))))

(declare-fun b!878028 () Bool)

(assert (=> b!878028 (= e!488845 (Some!425 (_2!5770 (h!18488 lt!397174))))))

(declare-fun d!109025 () Bool)

(declare-fun c!92984 () Bool)

(assert (=> d!109025 (= c!92984 (and ((_ is Cons!17351) lt!397174) (= (_1!5770 (h!18488 lt!397174)) (_1!5770 lt!397048))))))

(assert (=> d!109025 (= (getValueByKey!420 lt!397174 (_1!5770 lt!397048)) e!488845)))

(declare-fun b!878031 () Bool)

(assert (=> b!878031 (= e!488846 None!424)))

(assert (= (and d!109025 c!92984) b!878028))

(assert (= (and d!109025 (not c!92984)) b!878029))

(assert (= (and b!878029 c!92985) b!878030))

(assert (= (and b!878029 (not c!92985)) b!878031))

(declare-fun m!818355 () Bool)

(assert (=> b!878030 m!818355))

(assert (=> d!108971 d!109025))

(declare-fun d!109027 () Bool)

(assert (=> d!109027 (= (getValueByKey!420 lt!397174 (_1!5770 lt!397048)) (Some!425 (_2!5770 lt!397048)))))

(declare-fun lt!397255 () Unit!29960)

(assert (=> d!109027 (= lt!397255 (choose!1438 lt!397174 (_1!5770 lt!397048) (_2!5770 lt!397048)))))

(declare-fun e!488847 () Bool)

(assert (=> d!109027 e!488847))

(declare-fun res!596268 () Bool)

(assert (=> d!109027 (=> (not res!596268) (not e!488847))))

(assert (=> d!109027 (= res!596268 (isStrictlySorted!449 lt!397174))))

(assert (=> d!109027 (= (lemmaContainsTupThenGetReturnValue!234 lt!397174 (_1!5770 lt!397048) (_2!5770 lt!397048)) lt!397255)))

(declare-fun b!878032 () Bool)

(declare-fun res!596269 () Bool)

(assert (=> b!878032 (=> (not res!596269) (not e!488847))))

(assert (=> b!878032 (= res!596269 (containsKey!403 lt!397174 (_1!5770 lt!397048)))))

(declare-fun b!878033 () Bool)

(assert (=> b!878033 (= e!488847 (contains!4227 lt!397174 (tuple2!11519 (_1!5770 lt!397048) (_2!5770 lt!397048))))))

(assert (= (and d!109027 res!596268) b!878032))

(assert (= (and b!878032 res!596269) b!878033))

(assert (=> d!109027 m!818147))

(declare-fun m!818357 () Bool)

(assert (=> d!109027 m!818357))

(declare-fun m!818359 () Bool)

(assert (=> d!109027 m!818359))

(declare-fun m!818361 () Bool)

(assert (=> b!878032 m!818361))

(declare-fun m!818363 () Bool)

(assert (=> b!878033 m!818363))

(assert (=> d!108971 d!109027))

(declare-fun b!878034 () Bool)

(declare-fun e!488849 () List!17355)

(declare-fun call!38875 () List!17355)

(assert (=> b!878034 (= e!488849 call!38875)))

(declare-fun c!92989 () Bool)

(declare-fun e!488852 () List!17355)

(declare-fun b!878035 () Bool)

(declare-fun c!92986 () Bool)

(assert (=> b!878035 (= e!488852 (ite c!92986 (t!24432 (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)))) (ite c!92989 (Cons!17351 (h!18488 (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)))) (t!24432 (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052))))) Nil!17352)))))

(declare-fun b!878036 () Bool)

(declare-fun res!596270 () Bool)

(declare-fun e!488851 () Bool)

(assert (=> b!878036 (=> (not res!596270) (not e!488851))))

(declare-fun lt!397256 () List!17355)

(assert (=> b!878036 (= res!596270 (containsKey!403 lt!397256 (_1!5770 lt!397048)))))

(declare-fun b!878037 () Bool)

(declare-fun e!488848 () List!17355)

(assert (=> b!878037 (= e!488848 e!488849)))

(assert (=> b!878037 (= c!92986 (and ((_ is Cons!17351) (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)))) (= (_1!5770 (h!18488 (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052))))) (_1!5770 lt!397048))))))

(declare-fun b!878039 () Bool)

(declare-fun e!488850 () List!17355)

(declare-fun call!38874 () List!17355)

(assert (=> b!878039 (= e!488850 call!38874)))

(declare-fun b!878040 () Bool)

(assert (=> b!878040 (= e!488852 (insertStrictlySorted!273 (t!24432 (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)))) (_1!5770 lt!397048) (_2!5770 lt!397048)))))

(declare-fun b!878041 () Bool)

(declare-fun call!38873 () List!17355)

(assert (=> b!878041 (= e!488848 call!38873)))

(declare-fun b!878042 () Bool)

(assert (=> b!878042 (= c!92989 (and ((_ is Cons!17351) (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)))) (bvsgt (_1!5770 (h!18488 (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052))))) (_1!5770 lt!397048))))))

(assert (=> b!878042 (= e!488849 e!488850)))

(declare-fun b!878043 () Bool)

(assert (=> b!878043 (= e!488851 (contains!4227 lt!397256 (tuple2!11519 (_1!5770 lt!397048) (_2!5770 lt!397048))))))

(declare-fun bm!38870 () Bool)

(assert (=> bm!38870 (= call!38874 call!38875)))

(declare-fun b!878038 () Bool)

(assert (=> b!878038 (= e!488850 call!38874)))

(declare-fun d!109029 () Bool)

(assert (=> d!109029 e!488851))

(declare-fun res!596271 () Bool)

(assert (=> d!109029 (=> (not res!596271) (not e!488851))))

(assert (=> d!109029 (= res!596271 (isStrictlySorted!449 lt!397256))))

(assert (=> d!109029 (= lt!397256 e!488848)))

(declare-fun c!92988 () Bool)

(assert (=> d!109029 (= c!92988 (and ((_ is Cons!17351) (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)))) (bvslt (_1!5770 (h!18488 (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052))))) (_1!5770 lt!397048))))))

(assert (=> d!109029 (isStrictlySorted!449 (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052))))))

(assert (=> d!109029 (= (insertStrictlySorted!273 (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052))) (_1!5770 lt!397048) (_2!5770 lt!397048)) lt!397256)))

(declare-fun bm!38871 () Bool)

(assert (=> bm!38871 (= call!38873 ($colon$colon!535 e!488852 (ite c!92988 (h!18488 (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)))) (tuple2!11519 (_1!5770 lt!397048) (_2!5770 lt!397048)))))))

(declare-fun c!92987 () Bool)

(assert (=> bm!38871 (= c!92987 c!92988)))

(declare-fun bm!38872 () Bool)

(assert (=> bm!38872 (= call!38875 call!38873)))

(assert (= (and d!109029 c!92988) b!878041))

(assert (= (and d!109029 (not c!92988)) b!878037))

(assert (= (and b!878037 c!92986) b!878034))

(assert (= (and b!878037 (not c!92986)) b!878042))

(assert (= (and b!878042 c!92989) b!878038))

(assert (= (and b!878042 (not c!92989)) b!878039))

(assert (= (or b!878038 b!878039) bm!38870))

(assert (= (or b!878034 bm!38870) bm!38872))

(assert (= (or b!878041 bm!38872) bm!38871))

(assert (= (and bm!38871 c!92987) b!878040))

(assert (= (and bm!38871 (not c!92987)) b!878035))

(assert (= (and d!109029 res!596271) b!878036))

(assert (= (and b!878036 res!596270) b!878043))

(declare-fun m!818365 () Bool)

(assert (=> b!878040 m!818365))

(declare-fun m!818367 () Bool)

(assert (=> bm!38871 m!818367))

(declare-fun m!818369 () Bool)

(assert (=> b!878036 m!818369))

(declare-fun m!818371 () Bool)

(assert (=> b!878043 m!818371))

(declare-fun m!818373 () Bool)

(assert (=> d!109029 m!818373))

(declare-fun m!818375 () Bool)

(assert (=> d!109029 m!818375))

(assert (=> d!108971 d!109029))

(declare-fun d!109031 () Bool)

(assert (=> d!109031 (= (apply!377 lt!397197 (select (arr!24532 _keys!868) from!1053)) (get!12926 (getValueByKey!420 (toList!5160 lt!397197) (select (arr!24532 _keys!868) from!1053))))))

(declare-fun bs!24636 () Bool)

(assert (= bs!24636 d!109031))

(assert (=> bs!24636 m!817883))

(declare-fun m!818377 () Bool)

(assert (=> bs!24636 m!818377))

(assert (=> bs!24636 m!818377))

(declare-fun m!818379 () Bool)

(assert (=> bs!24636 m!818379))

(assert (=> b!877894 d!109031))

(declare-fun d!109033 () Bool)

(declare-fun c!92990 () Bool)

(assert (=> d!109033 (= c!92990 ((_ is ValueCellFull!8273) (select (arr!24533 _values!688) from!1053)))))

(declare-fun e!488853 () V!28281)

(assert (=> d!109033 (= (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488853)))

(declare-fun b!878044 () Bool)

(assert (=> b!878044 (= e!488853 (get!12924 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!878045 () Bool)

(assert (=> b!878045 (= e!488853 (get!12925 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109033 c!92990) b!878044))

(assert (= (and d!109033 (not c!92990)) b!878045))

(assert (=> b!878044 m!817871))

(assert (=> b!878044 m!817885))

(declare-fun m!818381 () Bool)

(assert (=> b!878044 m!818381))

(assert (=> b!878045 m!817871))

(assert (=> b!878045 m!817885))

(declare-fun m!818383 () Bool)

(assert (=> b!878045 m!818383))

(assert (=> b!877894 d!109033))

(declare-fun d!109035 () Bool)

(assert (=> d!109035 (= (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (and (not (= (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!877807 d!109035))

(declare-fun d!109037 () Bool)

(assert (=> d!109037 (= (get!12924 (select (arr!24533 _values!688) from!1053) lt!397051) (v!11193 (select (arr!24533 _values!688) from!1053)))))

(assert (=> b!877849 d!109037))

(declare-fun d!109039 () Bool)

(declare-fun e!488855 () Bool)

(assert (=> d!109039 e!488855))

(declare-fun res!596272 () Bool)

(assert (=> d!109039 (=> res!596272 e!488855)))

(declare-fun lt!397257 () Bool)

(assert (=> d!109039 (= res!596272 (not lt!397257))))

(declare-fun lt!397259 () Bool)

(assert (=> d!109039 (= lt!397257 lt!397259)))

(declare-fun lt!397260 () Unit!29960)

(declare-fun e!488854 () Unit!29960)

(assert (=> d!109039 (= lt!397260 e!488854)))

(declare-fun c!92991 () Bool)

(assert (=> d!109039 (= c!92991 lt!397259)))

(assert (=> d!109039 (= lt!397259 (containsKey!403 (toList!5160 lt!397190) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109039 (= (contains!4226 lt!397190 #b0000000000000000000000000000000000000000000000000000000000000000) lt!397257)))

(declare-fun b!878046 () Bool)

(declare-fun lt!397258 () Unit!29960)

(assert (=> b!878046 (= e!488854 lt!397258)))

(assert (=> b!878046 (= lt!397258 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397190) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!878046 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397190) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!878047 () Bool)

(declare-fun Unit!29970 () Unit!29960)

(assert (=> b!878047 (= e!488854 Unit!29970)))

(declare-fun b!878048 () Bool)

(assert (=> b!878048 (= e!488855 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397190) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109039 c!92991) b!878046))

(assert (= (and d!109039 (not c!92991)) b!878047))

(assert (= (and d!109039 (not res!596272)) b!878048))

(declare-fun m!818385 () Bool)

(assert (=> d!109039 m!818385))

(declare-fun m!818387 () Bool)

(assert (=> b!878046 m!818387))

(declare-fun m!818389 () Bool)

(assert (=> b!878046 m!818389))

(assert (=> b!878046 m!818389))

(declare-fun m!818391 () Bool)

(assert (=> b!878046 m!818391))

(assert (=> b!878048 m!818389))

(assert (=> b!878048 m!818389))

(assert (=> b!878048 m!818391))

(assert (=> d!108979 d!109039))

(assert (=> d!108979 d!108955))

(declare-fun b!878054 () Bool)

(declare-fun e!488858 () Bool)

(declare-fun call!38881 () ListLongMap!10289)

(declare-fun call!38880 () ListLongMap!10289)

(assert (=> b!878054 (= e!488858 (= call!38881 call!38880))))

(declare-fun bm!38878 () Bool)

(assert (=> bm!38878 (= call!38881 (getCurrentListMapNoExtraKeys!3202 _keys!868 (array!51022 (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24974 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun d!109041 () Bool)

(assert (=> d!109041 e!488858))

(declare-fun c!92994 () Bool)

(assert (=> d!109041 (= c!92994 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(assert (=> d!109041 true))

(declare-fun _$6!59 () Unit!29960)

(assert (=> d!109041 (= (choose!1436 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) _$6!59)))

(declare-fun b!878053 () Bool)

(assert (=> b!878053 (= e!488858 (= call!38881 (+!2505 call!38880 (tuple2!11519 k0!854 v!557))))))

(declare-fun bm!38877 () Bool)

(assert (=> bm!38877 (= call!38880 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!109041 c!92994) b!878053))

(assert (= (and d!109041 (not c!92994)) b!878054))

(assert (= (or b!878053 b!878054) bm!38877))

(assert (= (or b!878053 b!878054) bm!38878))

(assert (=> bm!38878 m!817877))

(assert (=> bm!38878 m!818079))

(declare-fun m!818393 () Bool)

(assert (=> b!878053 m!818393))

(assert (=> bm!38877 m!817857))

(assert (=> d!108953 d!109041))

(declare-fun d!109043 () Bool)

(declare-fun e!488860 () Bool)

(assert (=> d!109043 e!488860))

(declare-fun res!596273 () Bool)

(assert (=> d!109043 (=> res!596273 e!488860)))

(declare-fun lt!397261 () Bool)

(assert (=> d!109043 (= res!596273 (not lt!397261))))

(declare-fun lt!397263 () Bool)

(assert (=> d!109043 (= lt!397261 lt!397263)))

(declare-fun lt!397264 () Unit!29960)

(declare-fun e!488859 () Unit!29960)

(assert (=> d!109043 (= lt!397264 e!488859)))

(declare-fun c!92995 () Bool)

(assert (=> d!109043 (= c!92995 lt!397263)))

(assert (=> d!109043 (= lt!397263 (containsKey!403 (toList!5160 lt!397129) (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> d!109043 (= (contains!4226 lt!397129 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) lt!397261)))

(declare-fun b!878055 () Bool)

(declare-fun lt!397262 () Unit!29960)

(assert (=> b!878055 (= e!488859 lt!397262)))

(assert (=> b!878055 (= lt!397262 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397129) (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!878055 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397129) (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!878056 () Bool)

(declare-fun Unit!29971 () Unit!29960)

(assert (=> b!878056 (= e!488859 Unit!29971)))

(declare-fun b!878057 () Bool)

(assert (=> b!878057 (= e!488860 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397129) (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))))

(assert (= (and d!109043 c!92995) b!878055))

(assert (= (and d!109043 (not c!92995)) b!878056))

(assert (= (and d!109043 (not res!596273)) b!878057))

(assert (=> d!109043 m!818025))

(declare-fun m!818395 () Bool)

(assert (=> d!109043 m!818395))

(assert (=> b!878055 m!818025))

(declare-fun m!818397 () Bool)

(assert (=> b!878055 m!818397))

(assert (=> b!878055 m!818025))

(declare-fun m!818399 () Bool)

(assert (=> b!878055 m!818399))

(assert (=> b!878055 m!818399))

(declare-fun m!818401 () Bool)

(assert (=> b!878055 m!818401))

(assert (=> b!878057 m!818025))

(assert (=> b!878057 m!818399))

(assert (=> b!878057 m!818399))

(assert (=> b!878057 m!818401))

(assert (=> b!877809 d!109043))

(declare-fun d!109045 () Bool)

(assert (=> d!109045 (arrayContainsKey!0 _keys!868 lt!397188 #b00000000000000000000000000000000)))

(declare-fun lt!397267 () Unit!29960)

(declare-fun choose!13 (array!51019 (_ BitVec 64) (_ BitVec 32)) Unit!29960)

(assert (=> d!109045 (= lt!397267 (choose!13 _keys!868 lt!397188 #b00000000000000000000000000000000))))

(assert (=> d!109045 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!109045 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!397188 #b00000000000000000000000000000000) lt!397267)))

(declare-fun bs!24637 () Bool)

(assert (= bs!24637 d!109045))

(assert (=> bs!24637 m!818173))

(declare-fun m!818403 () Bool)

(assert (=> bs!24637 m!818403))

(assert (=> b!877868 d!109045))

(declare-fun d!109047 () Bool)

(declare-fun res!596278 () Bool)

(declare-fun e!488865 () Bool)

(assert (=> d!109047 (=> res!596278 e!488865)))

(assert (=> d!109047 (= res!596278 (= (select (arr!24532 _keys!868) #b00000000000000000000000000000000) lt!397188))))

(assert (=> d!109047 (= (arrayContainsKey!0 _keys!868 lt!397188 #b00000000000000000000000000000000) e!488865)))

(declare-fun b!878062 () Bool)

(declare-fun e!488866 () Bool)

(assert (=> b!878062 (= e!488865 e!488866)))

(declare-fun res!596279 () Bool)

(assert (=> b!878062 (=> (not res!596279) (not e!488866))))

(assert (=> b!878062 (= res!596279 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun b!878063 () Bool)

(assert (=> b!878063 (= e!488866 (arrayContainsKey!0 _keys!868 lt!397188 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!109047 (not res!596278)) b!878062))

(assert (= (and b!878062 res!596279) b!878063))

(assert (=> d!109047 m!818169))

(declare-fun m!818405 () Bool)

(assert (=> b!878063 m!818405))

(assert (=> b!877868 d!109047))

(declare-fun b!878076 () Bool)

(declare-fun e!488875 () SeekEntryResult!8704)

(declare-fun e!488873 () SeekEntryResult!8704)

(assert (=> b!878076 (= e!488875 e!488873)))

(declare-fun lt!397276 () (_ BitVec 64))

(declare-fun lt!397275 () SeekEntryResult!8704)

(assert (=> b!878076 (= lt!397276 (select (arr!24532 _keys!868) (index!37189 lt!397275)))))

(declare-fun c!93002 () Bool)

(assert (=> b!878076 (= c!93002 (= lt!397276 (select (arr!24532 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!878077 () Bool)

(assert (=> b!878077 (= e!488873 (Found!8704 (index!37189 lt!397275)))))

(declare-fun b!878078 () Bool)

(declare-fun c!93003 () Bool)

(assert (=> b!878078 (= c!93003 (= lt!397276 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!488874 () SeekEntryResult!8704)

(assert (=> b!878078 (= e!488873 e!488874)))

(declare-fun d!109049 () Bool)

(declare-fun lt!397274 () SeekEntryResult!8704)

(assert (=> d!109049 (and (or ((_ is Undefined!8704) lt!397274) (not ((_ is Found!8704) lt!397274)) (and (bvsge (index!37188 lt!397274) #b00000000000000000000000000000000) (bvslt (index!37188 lt!397274) (size!24973 _keys!868)))) (or ((_ is Undefined!8704) lt!397274) ((_ is Found!8704) lt!397274) (not ((_ is MissingZero!8704) lt!397274)) (and (bvsge (index!37187 lt!397274) #b00000000000000000000000000000000) (bvslt (index!37187 lt!397274) (size!24973 _keys!868)))) (or ((_ is Undefined!8704) lt!397274) ((_ is Found!8704) lt!397274) ((_ is MissingZero!8704) lt!397274) (not ((_ is MissingVacant!8704) lt!397274)) (and (bvsge (index!37190 lt!397274) #b00000000000000000000000000000000) (bvslt (index!37190 lt!397274) (size!24973 _keys!868)))) (or ((_ is Undefined!8704) lt!397274) (ite ((_ is Found!8704) lt!397274) (= (select (arr!24532 _keys!868) (index!37188 lt!397274)) (select (arr!24532 _keys!868) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8704) lt!397274) (= (select (arr!24532 _keys!868) (index!37187 lt!397274)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8704) lt!397274) (= (select (arr!24532 _keys!868) (index!37190 lt!397274)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109049 (= lt!397274 e!488875)))

(declare-fun c!93004 () Bool)

(assert (=> d!109049 (= c!93004 (and ((_ is Intermediate!8704) lt!397275) (undefined!9516 lt!397275)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51019 (_ BitVec 32)) SeekEntryResult!8704)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!109049 (= lt!397275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!24532 _keys!868) #b00000000000000000000000000000000) mask!1196) (select (arr!24532 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196))))

(assert (=> d!109049 (validMask!0 mask!1196)))

(assert (=> d!109049 (= (seekEntryOrOpen!0 (select (arr!24532 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) lt!397274)))

(declare-fun b!878079 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51019 (_ BitVec 32)) SeekEntryResult!8704)

(assert (=> b!878079 (= e!488874 (seekKeyOrZeroReturnVacant!0 (x!74271 lt!397275) (index!37189 lt!397275) (index!37189 lt!397275) (select (arr!24532 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196))))

(declare-fun b!878080 () Bool)

(assert (=> b!878080 (= e!488874 (MissingZero!8704 (index!37189 lt!397275)))))

(declare-fun b!878081 () Bool)

(assert (=> b!878081 (= e!488875 Undefined!8704)))

(assert (= (and d!109049 c!93004) b!878081))

(assert (= (and d!109049 (not c!93004)) b!878076))

(assert (= (and b!878076 c!93002) b!878077))

(assert (= (and b!878076 (not c!93002)) b!878078))

(assert (= (and b!878078 c!93003) b!878080))

(assert (= (and b!878078 (not c!93003)) b!878079))

(declare-fun m!818407 () Bool)

(assert (=> b!878076 m!818407))

(declare-fun m!818409 () Bool)

(assert (=> d!109049 m!818409))

(assert (=> d!109049 m!817911))

(assert (=> d!109049 m!818169))

(declare-fun m!818411 () Bool)

(assert (=> d!109049 m!818411))

(assert (=> d!109049 m!818411))

(assert (=> d!109049 m!818169))

(declare-fun m!818413 () Bool)

(assert (=> d!109049 m!818413))

(declare-fun m!818415 () Bool)

(assert (=> d!109049 m!818415))

(declare-fun m!818417 () Bool)

(assert (=> d!109049 m!818417))

(assert (=> b!878079 m!818169))

(declare-fun m!818419 () Bool)

(assert (=> b!878079 m!818419))

(assert (=> b!877868 d!109049))

(declare-fun d!109051 () Bool)

(assert (=> d!109051 (= (apply!377 lt!397129 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12926 (getValueByKey!420 (toList!5160 lt!397129) (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))))

(declare-fun bs!24638 () Bool)

(assert (= bs!24638 d!109051))

(assert (=> bs!24638 m!818025))

(assert (=> bs!24638 m!818399))

(assert (=> bs!24638 m!818399))

(declare-fun m!818421 () Bool)

(assert (=> bs!24638 m!818421))

(assert (=> b!877813 d!109051))

(declare-fun d!109053 () Bool)

(declare-fun c!93005 () Bool)

(assert (=> d!109053 (= c!93005 ((_ is ValueCellFull!8273) (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun e!488876 () V!28281)

(assert (=> d!109053 (= (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488876)))

(declare-fun b!878082 () Bool)

(assert (=> b!878082 (= e!488876 (get!12924 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!878083 () Bool)

(assert (=> b!878083 (= e!488876 (get!12925 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109053 c!93005) b!878082))

(assert (= (and d!109053 (not c!93005)) b!878083))

(assert (=> b!878082 m!818031))

(assert (=> b!878082 m!817885))

(declare-fun m!818423 () Bool)

(assert (=> b!878082 m!818423))

(assert (=> b!878083 m!818031))

(assert (=> b!878083 m!817885))

(declare-fun m!818425 () Bool)

(assert (=> b!878083 m!818425))

(assert (=> b!877813 d!109053))

(declare-fun d!109055 () Bool)

(assert (=> d!109055 (not (contains!4226 (+!2505 lt!397195 (tuple2!11519 lt!397196 lt!397192)) lt!397194))))

(declare-fun lt!397279 () Unit!29960)

(declare-fun choose!1439 (ListLongMap!10289 (_ BitVec 64) V!28281 (_ BitVec 64)) Unit!29960)

(assert (=> d!109055 (= lt!397279 (choose!1439 lt!397195 lt!397196 lt!397192 lt!397194))))

(declare-fun e!488879 () Bool)

(assert (=> d!109055 e!488879))

(declare-fun res!596282 () Bool)

(assert (=> d!109055 (=> (not res!596282) (not e!488879))))

(assert (=> d!109055 (= res!596282 (not (contains!4226 lt!397195 lt!397194)))))

(assert (=> d!109055 (= (addStillNotContains!204 lt!397195 lt!397196 lt!397192 lt!397194) lt!397279)))

(declare-fun b!878087 () Bool)

(assert (=> b!878087 (= e!488879 (not (= lt!397196 lt!397194)))))

(assert (= (and d!109055 res!596282) b!878087))

(assert (=> d!109055 m!818193))

(assert (=> d!109055 m!818193))

(assert (=> d!109055 m!818195))

(declare-fun m!818427 () Bool)

(assert (=> d!109055 m!818427))

(declare-fun m!818429 () Bool)

(assert (=> d!109055 m!818429))

(assert (=> b!877872 d!109055))

(declare-fun d!109057 () Bool)

(declare-fun e!488880 () Bool)

(assert (=> d!109057 e!488880))

(declare-fun res!596283 () Bool)

(assert (=> d!109057 (=> (not res!596283) (not e!488880))))

(declare-fun lt!397282 () ListLongMap!10289)

(assert (=> d!109057 (= res!596283 (contains!4226 lt!397282 (_1!5770 (tuple2!11519 lt!397196 lt!397192))))))

(declare-fun lt!397281 () List!17355)

(assert (=> d!109057 (= lt!397282 (ListLongMap!10290 lt!397281))))

(declare-fun lt!397283 () Unit!29960)

(declare-fun lt!397280 () Unit!29960)

(assert (=> d!109057 (= lt!397283 lt!397280)))

(assert (=> d!109057 (= (getValueByKey!420 lt!397281 (_1!5770 (tuple2!11519 lt!397196 lt!397192))) (Some!425 (_2!5770 (tuple2!11519 lt!397196 lt!397192))))))

(assert (=> d!109057 (= lt!397280 (lemmaContainsTupThenGetReturnValue!234 lt!397281 (_1!5770 (tuple2!11519 lt!397196 lt!397192)) (_2!5770 (tuple2!11519 lt!397196 lt!397192))))))

(assert (=> d!109057 (= lt!397281 (insertStrictlySorted!273 (toList!5160 lt!397195) (_1!5770 (tuple2!11519 lt!397196 lt!397192)) (_2!5770 (tuple2!11519 lt!397196 lt!397192))))))

(assert (=> d!109057 (= (+!2505 lt!397195 (tuple2!11519 lt!397196 lt!397192)) lt!397282)))

(declare-fun b!878088 () Bool)

(declare-fun res!596284 () Bool)

(assert (=> b!878088 (=> (not res!596284) (not e!488880))))

(assert (=> b!878088 (= res!596284 (= (getValueByKey!420 (toList!5160 lt!397282) (_1!5770 (tuple2!11519 lt!397196 lt!397192))) (Some!425 (_2!5770 (tuple2!11519 lt!397196 lt!397192)))))))

(declare-fun b!878089 () Bool)

(assert (=> b!878089 (= e!488880 (contains!4227 (toList!5160 lt!397282) (tuple2!11519 lt!397196 lt!397192)))))

(assert (= (and d!109057 res!596283) b!878088))

(assert (= (and b!878088 res!596284) b!878089))

(declare-fun m!818431 () Bool)

(assert (=> d!109057 m!818431))

(declare-fun m!818433 () Bool)

(assert (=> d!109057 m!818433))

(declare-fun m!818435 () Bool)

(assert (=> d!109057 m!818435))

(declare-fun m!818437 () Bool)

(assert (=> d!109057 m!818437))

(declare-fun m!818439 () Bool)

(assert (=> b!878088 m!818439))

(declare-fun m!818441 () Bool)

(assert (=> b!878089 m!818441))

(assert (=> b!877872 d!109057))

(declare-fun d!109059 () Bool)

(declare-fun e!488882 () Bool)

(assert (=> d!109059 e!488882))

(declare-fun res!596285 () Bool)

(assert (=> d!109059 (=> res!596285 e!488882)))

(declare-fun lt!397284 () Bool)

(assert (=> d!109059 (= res!596285 (not lt!397284))))

(declare-fun lt!397286 () Bool)

(assert (=> d!109059 (= lt!397284 lt!397286)))

(declare-fun lt!397287 () Unit!29960)

(declare-fun e!488881 () Unit!29960)

(assert (=> d!109059 (= lt!397287 e!488881)))

(declare-fun c!93006 () Bool)

(assert (=> d!109059 (= c!93006 lt!397286)))

(assert (=> d!109059 (= lt!397286 (containsKey!403 (toList!5160 (+!2505 lt!397195 (tuple2!11519 lt!397196 lt!397192))) lt!397194))))

(assert (=> d!109059 (= (contains!4226 (+!2505 lt!397195 (tuple2!11519 lt!397196 lt!397192)) lt!397194) lt!397284)))

(declare-fun b!878090 () Bool)

(declare-fun lt!397285 () Unit!29960)

(assert (=> b!878090 (= e!488881 lt!397285)))

(assert (=> b!878090 (= lt!397285 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 (+!2505 lt!397195 (tuple2!11519 lt!397196 lt!397192))) lt!397194))))

(assert (=> b!878090 (isDefined!313 (getValueByKey!420 (toList!5160 (+!2505 lt!397195 (tuple2!11519 lt!397196 lt!397192))) lt!397194))))

(declare-fun b!878091 () Bool)

(declare-fun Unit!29972 () Unit!29960)

(assert (=> b!878091 (= e!488881 Unit!29972)))

(declare-fun b!878092 () Bool)

(assert (=> b!878092 (= e!488882 (isDefined!313 (getValueByKey!420 (toList!5160 (+!2505 lt!397195 (tuple2!11519 lt!397196 lt!397192))) lt!397194)))))

(assert (= (and d!109059 c!93006) b!878090))

(assert (= (and d!109059 (not c!93006)) b!878091))

(assert (= (and d!109059 (not res!596285)) b!878092))

(declare-fun m!818443 () Bool)

(assert (=> d!109059 m!818443))

(declare-fun m!818445 () Bool)

(assert (=> b!878090 m!818445))

(declare-fun m!818447 () Bool)

(assert (=> b!878090 m!818447))

(assert (=> b!878090 m!818447))

(declare-fun m!818449 () Bool)

(assert (=> b!878090 m!818449))

(assert (=> b!878092 m!818447))

(assert (=> b!878092 m!818447))

(assert (=> b!878092 m!818449))

(assert (=> b!877872 d!109059))

(assert (=> b!877872 d!109017))

(declare-fun d!109061 () Bool)

(declare-fun e!488883 () Bool)

(assert (=> d!109061 e!488883))

(declare-fun res!596286 () Bool)

(assert (=> d!109061 (=> (not res!596286) (not e!488883))))

(declare-fun lt!397290 () ListLongMap!10289)

(assert (=> d!109061 (= res!596286 (contains!4226 lt!397290 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!397289 () List!17355)

(assert (=> d!109061 (= lt!397290 (ListLongMap!10290 lt!397289))))

(declare-fun lt!397291 () Unit!29960)

(declare-fun lt!397288 () Unit!29960)

(assert (=> d!109061 (= lt!397291 lt!397288)))

(assert (=> d!109061 (= (getValueByKey!420 lt!397289 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!425 (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109061 (= lt!397288 (lemmaContainsTupThenGetReturnValue!234 lt!397289 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109061 (= lt!397289 (insertStrictlySorted!273 (toList!5160 call!38858) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109061 (= (+!2505 call!38858 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!397290)))

(declare-fun b!878093 () Bool)

(declare-fun res!596287 () Bool)

(assert (=> b!878093 (=> (not res!596287) (not e!488883))))

(assert (=> b!878093 (= res!596287 (= (getValueByKey!420 (toList!5160 lt!397290) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!425 (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!878094 () Bool)

(assert (=> b!878094 (= e!488883 (contains!4227 (toList!5160 lt!397290) (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 lt!397049) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109061 res!596286) b!878093))

(assert (= (and b!878093 res!596287) b!878094))

(declare-fun m!818451 () Bool)

(assert (=> d!109061 m!818451))

(declare-fun m!818453 () Bool)

(assert (=> d!109061 m!818453))

(declare-fun m!818455 () Bool)

(assert (=> d!109061 m!818455))

(declare-fun m!818457 () Bool)

(assert (=> d!109061 m!818457))

(declare-fun m!818459 () Bool)

(assert (=> b!878093 m!818459))

(declare-fun m!818461 () Bool)

(assert (=> b!878094 m!818461))

(assert (=> b!877872 d!109061))

(declare-fun d!109063 () Bool)

(declare-fun lt!397292 () Bool)

(assert (=> d!109063 (= lt!397292 (select (content!391 (toList!5160 lt!397175)) lt!397048))))

(declare-fun e!488884 () Bool)

(assert (=> d!109063 (= lt!397292 e!488884)))

(declare-fun res!596288 () Bool)

(assert (=> d!109063 (=> (not res!596288) (not e!488884))))

(assert (=> d!109063 (= res!596288 ((_ is Cons!17351) (toList!5160 lt!397175)))))

(assert (=> d!109063 (= (contains!4227 (toList!5160 lt!397175) lt!397048) lt!397292)))

(declare-fun b!878095 () Bool)

(declare-fun e!488885 () Bool)

(assert (=> b!878095 (= e!488884 e!488885)))

(declare-fun res!596289 () Bool)

(assert (=> b!878095 (=> res!596289 e!488885)))

(assert (=> b!878095 (= res!596289 (= (h!18488 (toList!5160 lt!397175)) lt!397048))))

(declare-fun b!878096 () Bool)

(assert (=> b!878096 (= e!488885 (contains!4227 (t!24432 (toList!5160 lt!397175)) lt!397048))))

(assert (= (and d!109063 res!596288) b!878095))

(assert (= (and b!878095 (not res!596289)) b!878096))

(declare-fun m!818463 () Bool)

(assert (=> d!109063 m!818463))

(declare-fun m!818465 () Bool)

(assert (=> d!109063 m!818465))

(declare-fun m!818467 () Bool)

(assert (=> b!878096 m!818467))

(assert (=> b!877856 d!109063))

(declare-fun d!109065 () Bool)

(declare-fun e!488887 () Bool)

(assert (=> d!109065 e!488887))

(declare-fun res!596290 () Bool)

(assert (=> d!109065 (=> res!596290 e!488887)))

(declare-fun lt!397293 () Bool)

(assert (=> d!109065 (= res!596290 (not lt!397293))))

(declare-fun lt!397295 () Bool)

(assert (=> d!109065 (= lt!397293 lt!397295)))

(declare-fun lt!397296 () Unit!29960)

(declare-fun e!488886 () Unit!29960)

(assert (=> d!109065 (= lt!397296 e!488886)))

(declare-fun c!93007 () Bool)

(assert (=> d!109065 (= c!93007 lt!397295)))

(assert (=> d!109065 (= lt!397295 (containsKey!403 (toList!5160 lt!397160) (_1!5770 (tuple2!11519 k0!854 lt!397052))))))

(assert (=> d!109065 (= (contains!4226 lt!397160 (_1!5770 (tuple2!11519 k0!854 lt!397052))) lt!397293)))

(declare-fun b!878097 () Bool)

(declare-fun lt!397294 () Unit!29960)

(assert (=> b!878097 (= e!488886 lt!397294)))

(assert (=> b!878097 (= lt!397294 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397160) (_1!5770 (tuple2!11519 k0!854 lt!397052))))))

(assert (=> b!878097 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397160) (_1!5770 (tuple2!11519 k0!854 lt!397052))))))

(declare-fun b!878098 () Bool)

(declare-fun Unit!29973 () Unit!29960)

(assert (=> b!878098 (= e!488886 Unit!29973)))

(declare-fun b!878099 () Bool)

(assert (=> b!878099 (= e!488887 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397160) (_1!5770 (tuple2!11519 k0!854 lt!397052)))))))

(assert (= (and d!109065 c!93007) b!878097))

(assert (= (and d!109065 (not c!93007)) b!878098))

(assert (= (and d!109065 (not res!596290)) b!878099))

(declare-fun m!818469 () Bool)

(assert (=> d!109065 m!818469))

(declare-fun m!818471 () Bool)

(assert (=> b!878097 m!818471))

(assert (=> b!878097 m!818103))

(assert (=> b!878097 m!818103))

(declare-fun m!818473 () Bool)

(assert (=> b!878097 m!818473))

(assert (=> b!878099 m!818103))

(assert (=> b!878099 m!818103))

(assert (=> b!878099 m!818473))

(assert (=> d!108959 d!109065))

(declare-fun b!878101 () Bool)

(declare-fun e!488888 () Option!426)

(declare-fun e!488889 () Option!426)

(assert (=> b!878101 (= e!488888 e!488889)))

(declare-fun c!93009 () Bool)

(assert (=> b!878101 (= c!93009 (and ((_ is Cons!17351) lt!397159) (not (= (_1!5770 (h!18488 lt!397159)) (_1!5770 (tuple2!11519 k0!854 lt!397052))))))))

(declare-fun b!878102 () Bool)

(assert (=> b!878102 (= e!488889 (getValueByKey!420 (t!24432 lt!397159) (_1!5770 (tuple2!11519 k0!854 lt!397052))))))

(declare-fun b!878100 () Bool)

(assert (=> b!878100 (= e!488888 (Some!425 (_2!5770 (h!18488 lt!397159))))))

(declare-fun c!93008 () Bool)

(declare-fun d!109067 () Bool)

(assert (=> d!109067 (= c!93008 (and ((_ is Cons!17351) lt!397159) (= (_1!5770 (h!18488 lt!397159)) (_1!5770 (tuple2!11519 k0!854 lt!397052)))))))

(assert (=> d!109067 (= (getValueByKey!420 lt!397159 (_1!5770 (tuple2!11519 k0!854 lt!397052))) e!488888)))

(declare-fun b!878103 () Bool)

(assert (=> b!878103 (= e!488889 None!424)))

(assert (= (and d!109067 c!93008) b!878100))

(assert (= (and d!109067 (not c!93008)) b!878101))

(assert (= (and b!878101 c!93009) b!878102))

(assert (= (and b!878101 (not c!93009)) b!878103))

(declare-fun m!818475 () Bool)

(assert (=> b!878102 m!818475))

(assert (=> d!108959 d!109067))

(declare-fun d!109069 () Bool)

(assert (=> d!109069 (= (getValueByKey!420 lt!397159 (_1!5770 (tuple2!11519 k0!854 lt!397052))) (Some!425 (_2!5770 (tuple2!11519 k0!854 lt!397052))))))

(declare-fun lt!397297 () Unit!29960)

(assert (=> d!109069 (= lt!397297 (choose!1438 lt!397159 (_1!5770 (tuple2!11519 k0!854 lt!397052)) (_2!5770 (tuple2!11519 k0!854 lt!397052))))))

(declare-fun e!488890 () Bool)

(assert (=> d!109069 e!488890))

(declare-fun res!596291 () Bool)

(assert (=> d!109069 (=> (not res!596291) (not e!488890))))

(assert (=> d!109069 (= res!596291 (isStrictlySorted!449 lt!397159))))

(assert (=> d!109069 (= (lemmaContainsTupThenGetReturnValue!234 lt!397159 (_1!5770 (tuple2!11519 k0!854 lt!397052)) (_2!5770 (tuple2!11519 k0!854 lt!397052))) lt!397297)))

(declare-fun b!878104 () Bool)

(declare-fun res!596292 () Bool)

(assert (=> b!878104 (=> (not res!596292) (not e!488890))))

(assert (=> b!878104 (= res!596292 (containsKey!403 lt!397159 (_1!5770 (tuple2!11519 k0!854 lt!397052))))))

(declare-fun b!878105 () Bool)

(assert (=> b!878105 (= e!488890 (contains!4227 lt!397159 (tuple2!11519 (_1!5770 (tuple2!11519 k0!854 lt!397052)) (_2!5770 (tuple2!11519 k0!854 lt!397052)))))))

(assert (= (and d!109069 res!596291) b!878104))

(assert (= (and b!878104 res!596292) b!878105))

(assert (=> d!109069 m!818097))

(declare-fun m!818477 () Bool)

(assert (=> d!109069 m!818477))

(declare-fun m!818479 () Bool)

(assert (=> d!109069 m!818479))

(declare-fun m!818481 () Bool)

(assert (=> b!878104 m!818481))

(declare-fun m!818483 () Bool)

(assert (=> b!878105 m!818483))

(assert (=> d!108959 d!109069))

(declare-fun b!878106 () Bool)

(declare-fun e!488892 () List!17355)

(declare-fun call!38884 () List!17355)

(assert (=> b!878106 (= e!488892 call!38884)))

(declare-fun c!93013 () Bool)

(declare-fun e!488895 () List!17355)

(declare-fun c!93010 () Bool)

(declare-fun b!878107 () Bool)

(assert (=> b!878107 (= e!488895 (ite c!93010 (t!24432 (toList!5160 lt!397053)) (ite c!93013 (Cons!17351 (h!18488 (toList!5160 lt!397053)) (t!24432 (toList!5160 lt!397053))) Nil!17352)))))

(declare-fun b!878108 () Bool)

(declare-fun res!596293 () Bool)

(declare-fun e!488894 () Bool)

(assert (=> b!878108 (=> (not res!596293) (not e!488894))))

(declare-fun lt!397298 () List!17355)

(assert (=> b!878108 (= res!596293 (containsKey!403 lt!397298 (_1!5770 (tuple2!11519 k0!854 lt!397052))))))

(declare-fun b!878109 () Bool)

(declare-fun e!488891 () List!17355)

(assert (=> b!878109 (= e!488891 e!488892)))

(assert (=> b!878109 (= c!93010 (and ((_ is Cons!17351) (toList!5160 lt!397053)) (= (_1!5770 (h!18488 (toList!5160 lt!397053))) (_1!5770 (tuple2!11519 k0!854 lt!397052)))))))

(declare-fun b!878111 () Bool)

(declare-fun e!488893 () List!17355)

(declare-fun call!38883 () List!17355)

(assert (=> b!878111 (= e!488893 call!38883)))

(declare-fun b!878112 () Bool)

(assert (=> b!878112 (= e!488895 (insertStrictlySorted!273 (t!24432 (toList!5160 lt!397053)) (_1!5770 (tuple2!11519 k0!854 lt!397052)) (_2!5770 (tuple2!11519 k0!854 lt!397052))))))

(declare-fun b!878113 () Bool)

(declare-fun call!38882 () List!17355)

(assert (=> b!878113 (= e!488891 call!38882)))

(declare-fun b!878114 () Bool)

(assert (=> b!878114 (= c!93013 (and ((_ is Cons!17351) (toList!5160 lt!397053)) (bvsgt (_1!5770 (h!18488 (toList!5160 lt!397053))) (_1!5770 (tuple2!11519 k0!854 lt!397052)))))))

(assert (=> b!878114 (= e!488892 e!488893)))

(declare-fun b!878115 () Bool)

(assert (=> b!878115 (= e!488894 (contains!4227 lt!397298 (tuple2!11519 (_1!5770 (tuple2!11519 k0!854 lt!397052)) (_2!5770 (tuple2!11519 k0!854 lt!397052)))))))

(declare-fun bm!38879 () Bool)

(assert (=> bm!38879 (= call!38883 call!38884)))

(declare-fun b!878110 () Bool)

(assert (=> b!878110 (= e!488893 call!38883)))

(declare-fun d!109071 () Bool)

(assert (=> d!109071 e!488894))

(declare-fun res!596294 () Bool)

(assert (=> d!109071 (=> (not res!596294) (not e!488894))))

(assert (=> d!109071 (= res!596294 (isStrictlySorted!449 lt!397298))))

(assert (=> d!109071 (= lt!397298 e!488891)))

(declare-fun c!93012 () Bool)

(assert (=> d!109071 (= c!93012 (and ((_ is Cons!17351) (toList!5160 lt!397053)) (bvslt (_1!5770 (h!18488 (toList!5160 lt!397053))) (_1!5770 (tuple2!11519 k0!854 lt!397052)))))))

(assert (=> d!109071 (isStrictlySorted!449 (toList!5160 lt!397053))))

(assert (=> d!109071 (= (insertStrictlySorted!273 (toList!5160 lt!397053) (_1!5770 (tuple2!11519 k0!854 lt!397052)) (_2!5770 (tuple2!11519 k0!854 lt!397052))) lt!397298)))

(declare-fun bm!38880 () Bool)

(assert (=> bm!38880 (= call!38882 ($colon$colon!535 e!488895 (ite c!93012 (h!18488 (toList!5160 lt!397053)) (tuple2!11519 (_1!5770 (tuple2!11519 k0!854 lt!397052)) (_2!5770 (tuple2!11519 k0!854 lt!397052))))))))

(declare-fun c!93011 () Bool)

(assert (=> bm!38880 (= c!93011 c!93012)))

(declare-fun bm!38881 () Bool)

(assert (=> bm!38881 (= call!38884 call!38882)))

(assert (= (and d!109071 c!93012) b!878113))

(assert (= (and d!109071 (not c!93012)) b!878109))

(assert (= (and b!878109 c!93010) b!878106))

(assert (= (and b!878109 (not c!93010)) b!878114))

(assert (= (and b!878114 c!93013) b!878110))

(assert (= (and b!878114 (not c!93013)) b!878111))

(assert (= (or b!878110 b!878111) bm!38879))

(assert (= (or b!878106 bm!38879) bm!38881))

(assert (= (or b!878113 bm!38881) bm!38880))

(assert (= (and bm!38880 c!93011) b!878112))

(assert (= (and bm!38880 (not c!93011)) b!878107))

(assert (= (and d!109071 res!596294) b!878108))

(assert (= (and b!878108 res!596293) b!878115))

(declare-fun m!818485 () Bool)

(assert (=> b!878112 m!818485))

(declare-fun m!818487 () Bool)

(assert (=> bm!38880 m!818487))

(declare-fun m!818489 () Bool)

(assert (=> b!878108 m!818489))

(declare-fun m!818491 () Bool)

(assert (=> b!878115 m!818491))

(declare-fun m!818493 () Bool)

(assert (=> d!109071 m!818493))

(assert (=> d!109071 m!818309))

(assert (=> d!108959 d!109071))

(declare-fun lt!397299 () Bool)

(declare-fun d!109073 () Bool)

(assert (=> d!109073 (= lt!397299 (select (content!391 (toList!5160 lt!397171)) (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))

(declare-fun e!488896 () Bool)

(assert (=> d!109073 (= lt!397299 e!488896)))

(declare-fun res!596295 () Bool)

(assert (=> d!109073 (=> (not res!596295) (not e!488896))))

(assert (=> d!109073 (= res!596295 ((_ is Cons!17351) (toList!5160 lt!397171)))))

(assert (=> d!109073 (= (contains!4227 (toList!5160 lt!397171) (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)) lt!397299)))

(declare-fun b!878116 () Bool)

(declare-fun e!488897 () Bool)

(assert (=> b!878116 (= e!488896 e!488897)))

(declare-fun res!596296 () Bool)

(assert (=> b!878116 (=> res!596296 e!488897)))

(assert (=> b!878116 (= res!596296 (= (h!18488 (toList!5160 lt!397171)) (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))

(declare-fun b!878117 () Bool)

(assert (=> b!878117 (= e!488897 (contains!4227 (t!24432 (toList!5160 lt!397171)) (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))

(assert (= (and d!109073 res!596295) b!878116))

(assert (= (and b!878116 (not res!596296)) b!878117))

(declare-fun m!818495 () Bool)

(assert (=> d!109073 m!818495))

(declare-fun m!818497 () Bool)

(assert (=> d!109073 m!818497))

(declare-fun m!818499 () Bool)

(assert (=> b!878117 m!818499))

(assert (=> b!877854 d!109073))

(assert (=> bm!38851 d!108943))

(declare-fun d!109075 () Bool)

(assert (=> d!109075 (= (validKeyInArray!0 (select (arr!24532 _keys!868) #b00000000000000000000000000000000)) (and (not (= (select (arr!24532 _keys!868) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24532 _keys!868) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!877870 d!109075))

(declare-fun d!109077 () Bool)

(declare-fun e!488899 () Bool)

(assert (=> d!109077 e!488899))

(declare-fun res!596297 () Bool)

(assert (=> d!109077 (=> res!596297 e!488899)))

(declare-fun lt!397300 () Bool)

(assert (=> d!109077 (= res!596297 (not lt!397300))))

(declare-fun lt!397302 () Bool)

(assert (=> d!109077 (= lt!397300 lt!397302)))

(declare-fun lt!397303 () Unit!29960)

(declare-fun e!488898 () Unit!29960)

(assert (=> d!109077 (= lt!397303 e!488898)))

(declare-fun c!93014 () Bool)

(assert (=> d!109077 (= c!93014 lt!397302)))

(assert (=> d!109077 (= lt!397302 (containsKey!403 (toList!5160 lt!397136) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109077 (= (contains!4226 lt!397136 #b1000000000000000000000000000000000000000000000000000000000000000) lt!397300)))

(declare-fun b!878118 () Bool)

(declare-fun lt!397301 () Unit!29960)

(assert (=> b!878118 (= e!488898 lt!397301)))

(assert (=> b!878118 (= lt!397301 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397136) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!878118 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397136) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!878119 () Bool)

(declare-fun Unit!29974 () Unit!29960)

(assert (=> b!878119 (= e!488898 Unit!29974)))

(declare-fun b!878120 () Bool)

(assert (=> b!878120 (= e!488899 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397136) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109077 c!93014) b!878118))

(assert (= (and d!109077 (not c!93014)) b!878119))

(assert (= (and d!109077 (not res!596297)) b!878120))

(declare-fun m!818501 () Bool)

(assert (=> d!109077 m!818501))

(declare-fun m!818503 () Bool)

(assert (=> b!878118 m!818503))

(declare-fun m!818505 () Bool)

(assert (=> b!878118 m!818505))

(assert (=> b!878118 m!818505))

(declare-fun m!818507 () Bool)

(assert (=> b!878118 m!818507))

(assert (=> b!878120 m!818505))

(assert (=> b!878120 m!818505))

(assert (=> b!878120 m!818507))

(assert (=> b!877818 d!109077))

(declare-fun d!109079 () Bool)

(declare-fun e!488901 () Bool)

(assert (=> d!109079 e!488901))

(declare-fun res!596298 () Bool)

(assert (=> d!109079 (=> res!596298 e!488901)))

(declare-fun lt!397304 () Bool)

(assert (=> d!109079 (= res!596298 (not lt!397304))))

(declare-fun lt!397306 () Bool)

(assert (=> d!109079 (= lt!397304 lt!397306)))

(declare-fun lt!397307 () Unit!29960)

(declare-fun e!488900 () Unit!29960)

(assert (=> d!109079 (= lt!397307 e!488900)))

(declare-fun c!93015 () Bool)

(assert (=> d!109079 (= c!93015 lt!397306)))

(assert (=> d!109079 (= lt!397306 (containsKey!403 (toList!5160 lt!397164) (_1!5770 lt!397048)))))

(assert (=> d!109079 (= (contains!4226 lt!397164 (_1!5770 lt!397048)) lt!397304)))

(declare-fun b!878121 () Bool)

(declare-fun lt!397305 () Unit!29960)

(assert (=> b!878121 (= e!488900 lt!397305)))

(assert (=> b!878121 (= lt!397305 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397164) (_1!5770 lt!397048)))))

(assert (=> b!878121 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397164) (_1!5770 lt!397048)))))

(declare-fun b!878122 () Bool)

(declare-fun Unit!29975 () Unit!29960)

(assert (=> b!878122 (= e!488900 Unit!29975)))

(declare-fun b!878123 () Bool)

(assert (=> b!878123 (= e!488901 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397164) (_1!5770 lt!397048))))))

(assert (= (and d!109079 c!93015) b!878121))

(assert (= (and d!109079 (not c!93015)) b!878122))

(assert (= (and d!109079 (not res!596298)) b!878123))

(declare-fun m!818509 () Bool)

(assert (=> d!109079 m!818509))

(declare-fun m!818511 () Bool)

(assert (=> b!878121 m!818511))

(assert (=> b!878121 m!818115))

(assert (=> b!878121 m!818115))

(declare-fun m!818513 () Bool)

(assert (=> b!878121 m!818513))

(assert (=> b!878123 m!818115))

(assert (=> b!878123 m!818115))

(assert (=> b!878123 m!818513))

(assert (=> d!108961 d!109079))

(declare-fun b!878125 () Bool)

(declare-fun e!488902 () Option!426)

(declare-fun e!488903 () Option!426)

(assert (=> b!878125 (= e!488902 e!488903)))

(declare-fun c!93017 () Bool)

(assert (=> b!878125 (= c!93017 (and ((_ is Cons!17351) lt!397163) (not (= (_1!5770 (h!18488 lt!397163)) (_1!5770 lt!397048)))))))

(declare-fun b!878126 () Bool)

(assert (=> b!878126 (= e!488903 (getValueByKey!420 (t!24432 lt!397163) (_1!5770 lt!397048)))))

(declare-fun b!878124 () Bool)

(assert (=> b!878124 (= e!488902 (Some!425 (_2!5770 (h!18488 lt!397163))))))

(declare-fun d!109081 () Bool)

(declare-fun c!93016 () Bool)

(assert (=> d!109081 (= c!93016 (and ((_ is Cons!17351) lt!397163) (= (_1!5770 (h!18488 lt!397163)) (_1!5770 lt!397048))))))

(assert (=> d!109081 (= (getValueByKey!420 lt!397163 (_1!5770 lt!397048)) e!488902)))

(declare-fun b!878127 () Bool)

(assert (=> b!878127 (= e!488903 None!424)))

(assert (= (and d!109081 c!93016) b!878124))

(assert (= (and d!109081 (not c!93016)) b!878125))

(assert (= (and b!878125 c!93017) b!878126))

(assert (= (and b!878125 (not c!93017)) b!878127))

(declare-fun m!818515 () Bool)

(assert (=> b!878126 m!818515))

(assert (=> d!108961 d!109081))

(declare-fun d!109083 () Bool)

(assert (=> d!109083 (= (getValueByKey!420 lt!397163 (_1!5770 lt!397048)) (Some!425 (_2!5770 lt!397048)))))

(declare-fun lt!397308 () Unit!29960)

(assert (=> d!109083 (= lt!397308 (choose!1438 lt!397163 (_1!5770 lt!397048) (_2!5770 lt!397048)))))

(declare-fun e!488904 () Bool)

(assert (=> d!109083 e!488904))

(declare-fun res!596299 () Bool)

(assert (=> d!109083 (=> (not res!596299) (not e!488904))))

(assert (=> d!109083 (= res!596299 (isStrictlySorted!449 lt!397163))))

(assert (=> d!109083 (= (lemmaContainsTupThenGetReturnValue!234 lt!397163 (_1!5770 lt!397048) (_2!5770 lt!397048)) lt!397308)))

(declare-fun b!878128 () Bool)

(declare-fun res!596300 () Bool)

(assert (=> b!878128 (=> (not res!596300) (not e!488904))))

(assert (=> b!878128 (= res!596300 (containsKey!403 lt!397163 (_1!5770 lt!397048)))))

(declare-fun b!878129 () Bool)

(assert (=> b!878129 (= e!488904 (contains!4227 lt!397163 (tuple2!11519 (_1!5770 lt!397048) (_2!5770 lt!397048))))))

(assert (= (and d!109083 res!596299) b!878128))

(assert (= (and b!878128 res!596300) b!878129))

(assert (=> d!109083 m!818109))

(declare-fun m!818517 () Bool)

(assert (=> d!109083 m!818517))

(declare-fun m!818519 () Bool)

(assert (=> d!109083 m!818519))

(declare-fun m!818521 () Bool)

(assert (=> b!878128 m!818521))

(declare-fun m!818523 () Bool)

(assert (=> b!878129 m!818523))

(assert (=> d!108961 d!109083))

(declare-fun b!878130 () Bool)

(declare-fun e!488906 () List!17355)

(declare-fun call!38887 () List!17355)

(assert (=> b!878130 (= e!488906 call!38887)))

(declare-fun c!93021 () Bool)

(declare-fun e!488909 () List!17355)

(declare-fun b!878131 () Bool)

(declare-fun c!93018 () Bool)

(assert (=> b!878131 (= e!488909 (ite c!93018 (t!24432 (toList!5160 lt!397053)) (ite c!93021 (Cons!17351 (h!18488 (toList!5160 lt!397053)) (t!24432 (toList!5160 lt!397053))) Nil!17352)))))

(declare-fun b!878132 () Bool)

(declare-fun res!596301 () Bool)

(declare-fun e!488908 () Bool)

(assert (=> b!878132 (=> (not res!596301) (not e!488908))))

(declare-fun lt!397309 () List!17355)

(assert (=> b!878132 (= res!596301 (containsKey!403 lt!397309 (_1!5770 lt!397048)))))

(declare-fun b!878133 () Bool)

(declare-fun e!488905 () List!17355)

(assert (=> b!878133 (= e!488905 e!488906)))

(assert (=> b!878133 (= c!93018 (and ((_ is Cons!17351) (toList!5160 lt!397053)) (= (_1!5770 (h!18488 (toList!5160 lt!397053))) (_1!5770 lt!397048))))))

(declare-fun b!878135 () Bool)

(declare-fun e!488907 () List!17355)

(declare-fun call!38886 () List!17355)

(assert (=> b!878135 (= e!488907 call!38886)))

(declare-fun b!878136 () Bool)

(assert (=> b!878136 (= e!488909 (insertStrictlySorted!273 (t!24432 (toList!5160 lt!397053)) (_1!5770 lt!397048) (_2!5770 lt!397048)))))

(declare-fun b!878137 () Bool)

(declare-fun call!38885 () List!17355)

(assert (=> b!878137 (= e!488905 call!38885)))

(declare-fun b!878138 () Bool)

(assert (=> b!878138 (= c!93021 (and ((_ is Cons!17351) (toList!5160 lt!397053)) (bvsgt (_1!5770 (h!18488 (toList!5160 lt!397053))) (_1!5770 lt!397048))))))

(assert (=> b!878138 (= e!488906 e!488907)))

(declare-fun b!878139 () Bool)

(assert (=> b!878139 (= e!488908 (contains!4227 lt!397309 (tuple2!11519 (_1!5770 lt!397048) (_2!5770 lt!397048))))))

(declare-fun bm!38882 () Bool)

(assert (=> bm!38882 (= call!38886 call!38887)))

(declare-fun b!878134 () Bool)

(assert (=> b!878134 (= e!488907 call!38886)))

(declare-fun d!109085 () Bool)

(assert (=> d!109085 e!488908))

(declare-fun res!596302 () Bool)

(assert (=> d!109085 (=> (not res!596302) (not e!488908))))

(assert (=> d!109085 (= res!596302 (isStrictlySorted!449 lt!397309))))

(assert (=> d!109085 (= lt!397309 e!488905)))

(declare-fun c!93020 () Bool)

(assert (=> d!109085 (= c!93020 (and ((_ is Cons!17351) (toList!5160 lt!397053)) (bvslt (_1!5770 (h!18488 (toList!5160 lt!397053))) (_1!5770 lt!397048))))))

(assert (=> d!109085 (isStrictlySorted!449 (toList!5160 lt!397053))))

(assert (=> d!109085 (= (insertStrictlySorted!273 (toList!5160 lt!397053) (_1!5770 lt!397048) (_2!5770 lt!397048)) lt!397309)))

(declare-fun bm!38883 () Bool)

(assert (=> bm!38883 (= call!38885 ($colon$colon!535 e!488909 (ite c!93020 (h!18488 (toList!5160 lt!397053)) (tuple2!11519 (_1!5770 lt!397048) (_2!5770 lt!397048)))))))

(declare-fun c!93019 () Bool)

(assert (=> bm!38883 (= c!93019 c!93020)))

(declare-fun bm!38884 () Bool)

(assert (=> bm!38884 (= call!38887 call!38885)))

(assert (= (and d!109085 c!93020) b!878137))

(assert (= (and d!109085 (not c!93020)) b!878133))

(assert (= (and b!878133 c!93018) b!878130))

(assert (= (and b!878133 (not c!93018)) b!878138))

(assert (= (and b!878138 c!93021) b!878134))

(assert (= (and b!878138 (not c!93021)) b!878135))

(assert (= (or b!878134 b!878135) bm!38882))

(assert (= (or b!878130 bm!38882) bm!38884))

(assert (= (or b!878137 bm!38884) bm!38883))

(assert (= (and bm!38883 c!93019) b!878136))

(assert (= (and bm!38883 (not c!93019)) b!878131))

(assert (= (and d!109085 res!596302) b!878132))

(assert (= (and b!878132 res!596301) b!878139))

(declare-fun m!818525 () Bool)

(assert (=> b!878136 m!818525))

(declare-fun m!818527 () Bool)

(assert (=> bm!38883 m!818527))

(declare-fun m!818529 () Bool)

(assert (=> b!878132 m!818529))

(declare-fun m!818531 () Bool)

(assert (=> b!878139 m!818531))

(declare-fun m!818533 () Bool)

(assert (=> d!109085 m!818533))

(assert (=> d!109085 m!818309))

(assert (=> d!108961 d!109085))

(assert (=> b!877874 d!108951))

(declare-fun d!109087 () Bool)

(declare-fun e!488911 () Bool)

(assert (=> d!109087 e!488911))

(declare-fun res!596303 () Bool)

(assert (=> d!109087 (=> res!596303 e!488911)))

(declare-fun lt!397310 () Bool)

(assert (=> d!109087 (= res!596303 (not lt!397310))))

(declare-fun lt!397312 () Bool)

(assert (=> d!109087 (= lt!397310 lt!397312)))

(declare-fun lt!397313 () Unit!29960)

(declare-fun e!488910 () Unit!29960)

(assert (=> d!109087 (= lt!397313 e!488910)))

(declare-fun c!93022 () Bool)

(assert (=> d!109087 (= c!93022 lt!397312)))

(assert (=> d!109087 (= lt!397312 (containsKey!403 (toList!5160 lt!397136) (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> d!109087 (= (contains!4226 lt!397136 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) lt!397310)))

(declare-fun b!878140 () Bool)

(declare-fun lt!397311 () Unit!29960)

(assert (=> b!878140 (= e!488910 lt!397311)))

(assert (=> b!878140 (= lt!397311 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397136) (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!878140 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397136) (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!878141 () Bool)

(declare-fun Unit!29976 () Unit!29960)

(assert (=> b!878141 (= e!488910 Unit!29976)))

(declare-fun b!878142 () Bool)

(assert (=> b!878142 (= e!488911 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397136) (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))))

(assert (= (and d!109087 c!93022) b!878140))

(assert (= (and d!109087 (not c!93022)) b!878141))

(assert (= (and d!109087 (not res!596303)) b!878142))

(assert (=> d!109087 m!818025))

(declare-fun m!818535 () Bool)

(assert (=> d!109087 m!818535))

(assert (=> b!878140 m!818025))

(declare-fun m!818537 () Bool)

(assert (=> b!878140 m!818537))

(assert (=> b!878140 m!818025))

(declare-fun m!818539 () Bool)

(assert (=> b!878140 m!818539))

(assert (=> b!878140 m!818539))

(declare-fun m!818541 () Bool)

(assert (=> b!878140 m!818541))

(assert (=> b!878142 m!818025))

(assert (=> b!878142 m!818539))

(assert (=> b!878142 m!818539))

(assert (=> b!878142 m!818541))

(assert (=> b!877821 d!109087))

(declare-fun d!109089 () Bool)

(declare-fun e!488912 () Bool)

(assert (=> d!109089 e!488912))

(declare-fun res!596304 () Bool)

(assert (=> d!109089 (=> (not res!596304) (not e!488912))))

(declare-fun lt!397316 () ListLongMap!10289)

(assert (=> d!109089 (= res!596304 (contains!4226 lt!397316 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!397315 () List!17355)

(assert (=> d!109089 (= lt!397316 (ListLongMap!10290 lt!397315))))

(declare-fun lt!397317 () Unit!29960)

(declare-fun lt!397314 () Unit!29960)

(assert (=> d!109089 (= lt!397317 lt!397314)))

(assert (=> d!109089 (= (getValueByKey!420 lt!397315 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!425 (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109089 (= lt!397314 (lemmaContainsTupThenGetReturnValue!234 lt!397315 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109089 (= lt!397315 (insertStrictlySorted!273 (toList!5160 call!38859) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109089 (= (+!2505 call!38859 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!397316)))

(declare-fun b!878143 () Bool)

(declare-fun res!596305 () Bool)

(assert (=> b!878143 (=> (not res!596305) (not e!488912))))

(assert (=> b!878143 (= res!596305 (= (getValueByKey!420 (toList!5160 lt!397316) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!425 (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!878144 () Bool)

(assert (=> b!878144 (= e!488912 (contains!4227 (toList!5160 lt!397316) (tuple2!11519 (select (arr!24532 _keys!868) from!1053) (get!12922 (select (arr!24533 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109089 res!596304) b!878143))

(assert (= (and b!878143 res!596305) b!878144))

(declare-fun m!818543 () Bool)

(assert (=> d!109089 m!818543))

(declare-fun m!818545 () Bool)

(assert (=> d!109089 m!818545))

(declare-fun m!818547 () Bool)

(assert (=> d!109089 m!818547))

(declare-fun m!818549 () Bool)

(assert (=> d!109089 m!818549))

(declare-fun m!818551 () Bool)

(assert (=> b!878143 m!818551))

(declare-fun m!818553 () Bool)

(assert (=> b!878144 m!818553))

(assert (=> b!877884 d!109089))

(assert (=> b!877884 d!109033))

(declare-fun d!109091 () Bool)

(assert (=> d!109091 (not (contains!4226 (+!2505 lt!397202 (tuple2!11519 lt!397203 lt!397199)) lt!397201))))

(declare-fun lt!397318 () Unit!29960)

(assert (=> d!109091 (= lt!397318 (choose!1439 lt!397202 lt!397203 lt!397199 lt!397201))))

(declare-fun e!488913 () Bool)

(assert (=> d!109091 e!488913))

(declare-fun res!596306 () Bool)

(assert (=> d!109091 (=> (not res!596306) (not e!488913))))

(assert (=> d!109091 (= res!596306 (not (contains!4226 lt!397202 lt!397201)))))

(assert (=> d!109091 (= (addStillNotContains!204 lt!397202 lt!397203 lt!397199 lt!397201) lt!397318)))

(declare-fun b!878145 () Bool)

(assert (=> b!878145 (= e!488913 (not (= lt!397203 lt!397201)))))

(assert (= (and d!109091 res!596306) b!878145))

(assert (=> d!109091 m!818215))

(assert (=> d!109091 m!818215))

(assert (=> d!109091 m!818217))

(declare-fun m!818555 () Bool)

(assert (=> d!109091 m!818555))

(declare-fun m!818557 () Bool)

(assert (=> d!109091 m!818557))

(assert (=> b!877884 d!109091))

(declare-fun d!109093 () Bool)

(declare-fun e!488915 () Bool)

(assert (=> d!109093 e!488915))

(declare-fun res!596307 () Bool)

(assert (=> d!109093 (=> res!596307 e!488915)))

(declare-fun lt!397319 () Bool)

(assert (=> d!109093 (= res!596307 (not lt!397319))))

(declare-fun lt!397321 () Bool)

(assert (=> d!109093 (= lt!397319 lt!397321)))

(declare-fun lt!397322 () Unit!29960)

(declare-fun e!488914 () Unit!29960)

(assert (=> d!109093 (= lt!397322 e!488914)))

(declare-fun c!93023 () Bool)

(assert (=> d!109093 (= c!93023 lt!397321)))

(assert (=> d!109093 (= lt!397321 (containsKey!403 (toList!5160 (+!2505 lt!397202 (tuple2!11519 lt!397203 lt!397199))) lt!397201))))

(assert (=> d!109093 (= (contains!4226 (+!2505 lt!397202 (tuple2!11519 lt!397203 lt!397199)) lt!397201) lt!397319)))

(declare-fun b!878146 () Bool)

(declare-fun lt!397320 () Unit!29960)

(assert (=> b!878146 (= e!488914 lt!397320)))

(assert (=> b!878146 (= lt!397320 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 (+!2505 lt!397202 (tuple2!11519 lt!397203 lt!397199))) lt!397201))))

(assert (=> b!878146 (isDefined!313 (getValueByKey!420 (toList!5160 (+!2505 lt!397202 (tuple2!11519 lt!397203 lt!397199))) lt!397201))))

(declare-fun b!878147 () Bool)

(declare-fun Unit!29977 () Unit!29960)

(assert (=> b!878147 (= e!488914 Unit!29977)))

(declare-fun b!878148 () Bool)

(assert (=> b!878148 (= e!488915 (isDefined!313 (getValueByKey!420 (toList!5160 (+!2505 lt!397202 (tuple2!11519 lt!397203 lt!397199))) lt!397201)))))

(assert (= (and d!109093 c!93023) b!878146))

(assert (= (and d!109093 (not c!93023)) b!878147))

(assert (= (and d!109093 (not res!596307)) b!878148))

(declare-fun m!818559 () Bool)

(assert (=> d!109093 m!818559))

(declare-fun m!818561 () Bool)

(assert (=> b!878146 m!818561))

(declare-fun m!818563 () Bool)

(assert (=> b!878146 m!818563))

(assert (=> b!878146 m!818563))

(declare-fun m!818565 () Bool)

(assert (=> b!878146 m!818565))

(assert (=> b!878148 m!818563))

(assert (=> b!878148 m!818563))

(assert (=> b!878148 m!818565))

(assert (=> b!877884 d!109093))

(declare-fun d!109095 () Bool)

(declare-fun e!488916 () Bool)

(assert (=> d!109095 e!488916))

(declare-fun res!596308 () Bool)

(assert (=> d!109095 (=> (not res!596308) (not e!488916))))

(declare-fun lt!397325 () ListLongMap!10289)

(assert (=> d!109095 (= res!596308 (contains!4226 lt!397325 (_1!5770 (tuple2!11519 lt!397203 lt!397199))))))

(declare-fun lt!397324 () List!17355)

(assert (=> d!109095 (= lt!397325 (ListLongMap!10290 lt!397324))))

(declare-fun lt!397326 () Unit!29960)

(declare-fun lt!397323 () Unit!29960)

(assert (=> d!109095 (= lt!397326 lt!397323)))

(assert (=> d!109095 (= (getValueByKey!420 lt!397324 (_1!5770 (tuple2!11519 lt!397203 lt!397199))) (Some!425 (_2!5770 (tuple2!11519 lt!397203 lt!397199))))))

(assert (=> d!109095 (= lt!397323 (lemmaContainsTupThenGetReturnValue!234 lt!397324 (_1!5770 (tuple2!11519 lt!397203 lt!397199)) (_2!5770 (tuple2!11519 lt!397203 lt!397199))))))

(assert (=> d!109095 (= lt!397324 (insertStrictlySorted!273 (toList!5160 lt!397202) (_1!5770 (tuple2!11519 lt!397203 lt!397199)) (_2!5770 (tuple2!11519 lt!397203 lt!397199))))))

(assert (=> d!109095 (= (+!2505 lt!397202 (tuple2!11519 lt!397203 lt!397199)) lt!397325)))

(declare-fun b!878149 () Bool)

(declare-fun res!596309 () Bool)

(assert (=> b!878149 (=> (not res!596309) (not e!488916))))

(assert (=> b!878149 (= res!596309 (= (getValueByKey!420 (toList!5160 lt!397325) (_1!5770 (tuple2!11519 lt!397203 lt!397199))) (Some!425 (_2!5770 (tuple2!11519 lt!397203 lt!397199)))))))

(declare-fun b!878150 () Bool)

(assert (=> b!878150 (= e!488916 (contains!4227 (toList!5160 lt!397325) (tuple2!11519 lt!397203 lt!397199)))))

(assert (= (and d!109095 res!596308) b!878149))

(assert (= (and b!878149 res!596309) b!878150))

(declare-fun m!818567 () Bool)

(assert (=> d!109095 m!818567))

(declare-fun m!818569 () Bool)

(assert (=> d!109095 m!818569))

(declare-fun m!818571 () Bool)

(assert (=> d!109095 m!818571))

(declare-fun m!818573 () Bool)

(assert (=> d!109095 m!818573))

(declare-fun m!818575 () Bool)

(assert (=> b!878149 m!818575))

(declare-fun m!818577 () Bool)

(assert (=> b!878150 m!818577))

(assert (=> b!877884 d!109095))

(declare-fun d!109097 () Bool)

(assert (=> d!109097 (= (isEmpty!669 lt!397190) (isEmpty!670 (toList!5160 lt!397190)))))

(declare-fun bs!24639 () Bool)

(assert (= bs!24639 d!109097))

(declare-fun m!818579 () Bool)

(assert (=> bs!24639 m!818579))

(assert (=> b!877877 d!109097))

(declare-fun b!878151 () Bool)

(declare-fun e!488917 () Bool)

(declare-fun call!38888 () Bool)

(assert (=> b!878151 (= e!488917 call!38888)))

(declare-fun b!878152 () Bool)

(declare-fun e!488919 () Bool)

(assert (=> b!878152 (= e!488917 e!488919)))

(declare-fun lt!397328 () (_ BitVec 64))

(assert (=> b!878152 (= lt!397328 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!397327 () Unit!29960)

(assert (=> b!878152 (= lt!397327 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!397328 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!878152 (arrayContainsKey!0 _keys!868 lt!397328 #b00000000000000000000000000000000)))

(declare-fun lt!397329 () Unit!29960)

(assert (=> b!878152 (= lt!397329 lt!397327)))

(declare-fun res!596311 () Bool)

(assert (=> b!878152 (= res!596311 (= (seekEntryOrOpen!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!868 mask!1196) (Found!8704 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!878152 (=> (not res!596311) (not e!488919))))

(declare-fun b!878153 () Bool)

(assert (=> b!878153 (= e!488919 call!38888)))

(declare-fun d!109099 () Bool)

(declare-fun res!596310 () Bool)

(declare-fun e!488918 () Bool)

(assert (=> d!109099 (=> res!596310 e!488918)))

(assert (=> d!109099 (= res!596310 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(assert (=> d!109099 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196) e!488918)))

(declare-fun b!878154 () Bool)

(assert (=> b!878154 (= e!488918 e!488917)))

(declare-fun c!93024 () Bool)

(assert (=> b!878154 (= c!93024 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!38885 () Bool)

(assert (=> bm!38885 (= call!38888 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(assert (= (and d!109099 (not res!596310)) b!878154))

(assert (= (and b!878154 c!93024) b!878152))

(assert (= (and b!878154 (not c!93024)) b!878151))

(assert (= (and b!878152 res!596311) b!878153))

(assert (= (or b!878153 b!878151) bm!38885))

(declare-fun m!818581 () Bool)

(assert (=> b!878152 m!818581))

(declare-fun m!818583 () Bool)

(assert (=> b!878152 m!818583))

(declare-fun m!818585 () Bool)

(assert (=> b!878152 m!818585))

(assert (=> b!878152 m!818581))

(declare-fun m!818587 () Bool)

(assert (=> b!878152 m!818587))

(assert (=> b!878154 m!818581))

(assert (=> b!878154 m!818581))

(declare-fun m!818589 () Bool)

(assert (=> b!878154 m!818589))

(declare-fun m!818591 () Bool)

(assert (=> bm!38885 m!818591))

(assert (=> bm!38854 d!109099))

(declare-fun d!109101 () Bool)

(assert (=> d!109101 (= (get!12924 (select (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!397051) (v!11193 (select (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053)))))

(assert (=> b!877851 d!109101))

(assert (=> b!877819 d!109035))

(declare-fun d!109103 () Bool)

(declare-fun e!488920 () Bool)

(assert (=> d!109103 e!488920))

(declare-fun res!596312 () Bool)

(assert (=> d!109103 (=> (not res!596312) (not e!488920))))

(declare-fun lt!397332 () ListLongMap!10289)

(assert (=> d!109103 (= res!596312 (contains!4226 lt!397332 (_1!5770 (tuple2!11519 k0!854 lt!397047))))))

(declare-fun lt!397331 () List!17355)

(assert (=> d!109103 (= lt!397332 (ListLongMap!10290 lt!397331))))

(declare-fun lt!397333 () Unit!29960)

(declare-fun lt!397330 () Unit!29960)

(assert (=> d!109103 (= lt!397333 lt!397330)))

(assert (=> d!109103 (= (getValueByKey!420 lt!397331 (_1!5770 (tuple2!11519 k0!854 lt!397047))) (Some!425 (_2!5770 (tuple2!11519 k0!854 lt!397047))))))

(assert (=> d!109103 (= lt!397330 (lemmaContainsTupThenGetReturnValue!234 lt!397331 (_1!5770 (tuple2!11519 k0!854 lt!397047)) (_2!5770 (tuple2!11519 k0!854 lt!397047))))))

(assert (=> d!109103 (= lt!397331 (insertStrictlySorted!273 (toList!5160 lt!397053) (_1!5770 (tuple2!11519 k0!854 lt!397047)) (_2!5770 (tuple2!11519 k0!854 lt!397047))))))

(assert (=> d!109103 (= (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397047)) lt!397332)))

(declare-fun b!878155 () Bool)

(declare-fun res!596313 () Bool)

(assert (=> b!878155 (=> (not res!596313) (not e!488920))))

(assert (=> b!878155 (= res!596313 (= (getValueByKey!420 (toList!5160 lt!397332) (_1!5770 (tuple2!11519 k0!854 lt!397047))) (Some!425 (_2!5770 (tuple2!11519 k0!854 lt!397047)))))))

(declare-fun b!878156 () Bool)

(assert (=> b!878156 (= e!488920 (contains!4227 (toList!5160 lt!397332) (tuple2!11519 k0!854 lt!397047)))))

(assert (= (and d!109103 res!596312) b!878155))

(assert (= (and b!878155 res!596313) b!878156))

(declare-fun m!818593 () Bool)

(assert (=> d!109103 m!818593))

(declare-fun m!818595 () Bool)

(assert (=> d!109103 m!818595))

(declare-fun m!818597 () Bool)

(assert (=> d!109103 m!818597))

(declare-fun m!818599 () Bool)

(assert (=> d!109103 m!818599))

(declare-fun m!818601 () Bool)

(assert (=> b!878155 m!818601))

(declare-fun m!818603 () Bool)

(assert (=> b!878156 m!818603))

(assert (=> d!108965 d!109103))

(declare-fun d!109105 () Bool)

(declare-fun e!488921 () Bool)

(assert (=> d!109105 e!488921))

(declare-fun res!596314 () Bool)

(assert (=> d!109105 (=> (not res!596314) (not e!488921))))

(declare-fun lt!397336 () ListLongMap!10289)

(assert (=> d!109105 (= res!596314 (contains!4226 lt!397336 (_1!5770 (tuple2!11519 k0!854 lt!397047))))))

(declare-fun lt!397335 () List!17355)

(assert (=> d!109105 (= lt!397336 (ListLongMap!10290 lt!397335))))

(declare-fun lt!397337 () Unit!29960)

(declare-fun lt!397334 () Unit!29960)

(assert (=> d!109105 (= lt!397337 lt!397334)))

(assert (=> d!109105 (= (getValueByKey!420 lt!397335 (_1!5770 (tuple2!11519 k0!854 lt!397047))) (Some!425 (_2!5770 (tuple2!11519 k0!854 lt!397047))))))

(assert (=> d!109105 (= lt!397334 (lemmaContainsTupThenGetReturnValue!234 lt!397335 (_1!5770 (tuple2!11519 k0!854 lt!397047)) (_2!5770 (tuple2!11519 k0!854 lt!397047))))))

(assert (=> d!109105 (= lt!397335 (insertStrictlySorted!273 (toList!5160 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052))) (_1!5770 (tuple2!11519 k0!854 lt!397047)) (_2!5770 (tuple2!11519 k0!854 lt!397047))))))

(assert (=> d!109105 (= (+!2505 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)) (tuple2!11519 k0!854 lt!397047)) lt!397336)))

(declare-fun b!878157 () Bool)

(declare-fun res!596315 () Bool)

(assert (=> b!878157 (=> (not res!596315) (not e!488921))))

(assert (=> b!878157 (= res!596315 (= (getValueByKey!420 (toList!5160 lt!397336) (_1!5770 (tuple2!11519 k0!854 lt!397047))) (Some!425 (_2!5770 (tuple2!11519 k0!854 lt!397047)))))))

(declare-fun b!878158 () Bool)

(assert (=> b!878158 (= e!488921 (contains!4227 (toList!5160 lt!397336) (tuple2!11519 k0!854 lt!397047)))))

(assert (= (and d!109105 res!596314) b!878157))

(assert (= (and b!878157 res!596315) b!878158))

(declare-fun m!818605 () Bool)

(assert (=> d!109105 m!818605))

(declare-fun m!818607 () Bool)

(assert (=> d!109105 m!818607))

(declare-fun m!818609 () Bool)

(assert (=> d!109105 m!818609))

(declare-fun m!818611 () Bool)

(assert (=> d!109105 m!818611))

(declare-fun m!818613 () Bool)

(assert (=> b!878157 m!818613))

(declare-fun m!818615 () Bool)

(assert (=> b!878158 m!818615))

(assert (=> d!108965 d!109105))

(assert (=> d!108965 d!108959))

(declare-fun d!109107 () Bool)

(assert (=> d!109107 (= (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397047)) (+!2505 (+!2505 lt!397053 (tuple2!11519 k0!854 lt!397052)) (tuple2!11519 k0!854 lt!397047)))))

(assert (=> d!109107 true))

(declare-fun _$24!45 () Unit!29960)

(assert (=> d!109107 (= (choose!1437 lt!397053 k0!854 lt!397052 lt!397047) _$24!45)))

(declare-fun bs!24640 () Bool)

(assert (= bs!24640 d!109107))

(assert (=> bs!24640 m!818123))

(assert (=> bs!24640 m!817873))

(assert (=> bs!24640 m!817873))

(assert (=> bs!24640 m!818125))

(assert (=> d!108965 d!109107))

(declare-fun d!109109 () Bool)

(declare-fun e!488922 () Bool)

(assert (=> d!109109 e!488922))

(declare-fun res!596316 () Bool)

(assert (=> d!109109 (=> (not res!596316) (not e!488922))))

(declare-fun lt!397340 () ListLongMap!10289)

(assert (=> d!109109 (= res!596316 (contains!4226 lt!397340 (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun lt!397339 () List!17355)

(assert (=> d!109109 (= lt!397340 (ListLongMap!10290 lt!397339))))

(declare-fun lt!397341 () Unit!29960)

(declare-fun lt!397338 () Unit!29960)

(assert (=> d!109109 (= lt!397341 lt!397338)))

(assert (=> d!109109 (= (getValueByKey!420 lt!397339 (_1!5770 (tuple2!11519 k0!854 v!557))) (Some!425 (_2!5770 (tuple2!11519 k0!854 v!557))))))

(assert (=> d!109109 (= lt!397338 (lemmaContainsTupThenGetReturnValue!234 lt!397339 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))))))

(assert (=> d!109109 (= lt!397339 (insertStrictlySorted!273 (toList!5160 call!38854) (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))))))

(assert (=> d!109109 (= (+!2505 call!38854 (tuple2!11519 k0!854 v!557)) lt!397340)))

(declare-fun b!878159 () Bool)

(declare-fun res!596317 () Bool)

(assert (=> b!878159 (=> (not res!596317) (not e!488922))))

(assert (=> b!878159 (= res!596317 (= (getValueByKey!420 (toList!5160 lt!397340) (_1!5770 (tuple2!11519 k0!854 v!557))) (Some!425 (_2!5770 (tuple2!11519 k0!854 v!557)))))))

(declare-fun b!878160 () Bool)

(assert (=> b!878160 (= e!488922 (contains!4227 (toList!5160 lt!397340) (tuple2!11519 k0!854 v!557)))))

(assert (= (and d!109109 res!596316) b!878159))

(assert (= (and b!878159 res!596317) b!878160))

(declare-fun m!818617 () Bool)

(assert (=> d!109109 m!818617))

(declare-fun m!818619 () Bool)

(assert (=> d!109109 m!818619))

(declare-fun m!818621 () Bool)

(assert (=> d!109109 m!818621))

(declare-fun m!818623 () Bool)

(assert (=> d!109109 m!818623))

(declare-fun m!818625 () Bool)

(assert (=> b!878159 m!818625))

(declare-fun m!818627 () Bool)

(assert (=> b!878160 m!818627))

(assert (=> b!877832 d!109109))

(declare-fun c!93025 () Bool)

(declare-fun bm!38886 () Bool)

(declare-fun call!38889 () Bool)

(assert (=> bm!38886 (= call!38889 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!93025 (Cons!17352 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!92946 (Cons!17352 (select (arr!24532 _keys!868) #b00000000000000000000000000000000) Nil!17353) Nil!17353)) (ite c!92946 (Cons!17352 (select (arr!24532 _keys!868) #b00000000000000000000000000000000) Nil!17353) Nil!17353))))))

(declare-fun b!878161 () Bool)

(declare-fun e!488926 () Bool)

(assert (=> b!878161 (= e!488926 (contains!4228 (ite c!92946 (Cons!17352 (select (arr!24532 _keys!868) #b00000000000000000000000000000000) Nil!17353) Nil!17353) (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!878162 () Bool)

(declare-fun e!488923 () Bool)

(declare-fun e!488925 () Bool)

(assert (=> b!878162 (= e!488923 e!488925)))

(declare-fun res!596318 () Bool)

(assert (=> b!878162 (=> (not res!596318) (not e!488925))))

(assert (=> b!878162 (= res!596318 (not e!488926))))

(declare-fun res!596319 () Bool)

(assert (=> b!878162 (=> (not res!596319) (not e!488926))))

(assert (=> b!878162 (= res!596319 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!878163 () Bool)

(declare-fun e!488924 () Bool)

(assert (=> b!878163 (= e!488924 call!38889)))

(declare-fun d!109111 () Bool)

(declare-fun res!596320 () Bool)

(assert (=> d!109111 (=> res!596320 e!488923)))

(assert (=> d!109111 (= res!596320 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(assert (=> d!109111 (= (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92946 (Cons!17352 (select (arr!24532 _keys!868) #b00000000000000000000000000000000) Nil!17353) Nil!17353)) e!488923)))

(declare-fun b!878164 () Bool)

(assert (=> b!878164 (= e!488925 e!488924)))

(assert (=> b!878164 (= c!93025 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!878165 () Bool)

(assert (=> b!878165 (= e!488924 call!38889)))

(assert (= (and d!109111 (not res!596320)) b!878162))

(assert (= (and b!878162 res!596319) b!878161))

(assert (= (and b!878162 res!596318) b!878164))

(assert (= (and b!878164 c!93025) b!878163))

(assert (= (and b!878164 (not c!93025)) b!878165))

(assert (= (or b!878163 b!878165) bm!38886))

(assert (=> bm!38886 m!818581))

(declare-fun m!818629 () Bool)

(assert (=> bm!38886 m!818629))

(assert (=> b!878161 m!818581))

(assert (=> b!878161 m!818581))

(declare-fun m!818631 () Bool)

(assert (=> b!878161 m!818631))

(assert (=> b!878162 m!818581))

(assert (=> b!878162 m!818581))

(assert (=> b!878162 m!818589))

(assert (=> b!878164 m!818581))

(assert (=> b!878164 m!818581))

(assert (=> b!878164 m!818589))

(assert (=> bm!38859 d!109111))

(assert (=> b!877886 d!108951))

(declare-fun lt!397342 () Bool)

(declare-fun d!109113 () Bool)

(assert (=> d!109113 (= lt!397342 (select (content!391 (toList!5160 lt!397156)) (tuple2!11519 k0!854 v!557)))))

(declare-fun e!488927 () Bool)

(assert (=> d!109113 (= lt!397342 e!488927)))

(declare-fun res!596321 () Bool)

(assert (=> d!109113 (=> (not res!596321) (not e!488927))))

(assert (=> d!109113 (= res!596321 ((_ is Cons!17351) (toList!5160 lt!397156)))))

(assert (=> d!109113 (= (contains!4227 (toList!5160 lt!397156) (tuple2!11519 k0!854 v!557)) lt!397342)))

(declare-fun b!878166 () Bool)

(declare-fun e!488928 () Bool)

(assert (=> b!878166 (= e!488927 e!488928)))

(declare-fun res!596322 () Bool)

(assert (=> b!878166 (=> res!596322 e!488928)))

(assert (=> b!878166 (= res!596322 (= (h!18488 (toList!5160 lt!397156)) (tuple2!11519 k0!854 v!557)))))

(declare-fun b!878167 () Bool)

(assert (=> b!878167 (= e!488928 (contains!4227 (t!24432 (toList!5160 lt!397156)) (tuple2!11519 k0!854 v!557)))))

(assert (= (and d!109113 res!596321) b!878166))

(assert (= (and b!878166 (not res!596322)) b!878167))

(declare-fun m!818633 () Bool)

(assert (=> d!109113 m!818633))

(declare-fun m!818635 () Bool)

(assert (=> d!109113 m!818635))

(declare-fun m!818637 () Bool)

(assert (=> b!878167 m!818637))

(assert (=> b!877840 d!109113))

(declare-fun b!878168 () Bool)

(declare-fun e!488929 () ListLongMap!10289)

(assert (=> b!878168 (= e!488929 (ListLongMap!10290 Nil!17352))))

(declare-fun b!878169 () Bool)

(declare-fun lt!397344 () Unit!29960)

(declare-fun lt!397346 () Unit!29960)

(assert (=> b!878169 (= lt!397344 lt!397346)))

(declare-fun lt!397349 () (_ BitVec 64))

(declare-fun lt!397348 () ListLongMap!10289)

(declare-fun lt!397345 () V!28281)

(declare-fun lt!397347 () (_ BitVec 64))

(assert (=> b!878169 (not (contains!4226 (+!2505 lt!397348 (tuple2!11519 lt!397349 lt!397345)) lt!397347))))

(assert (=> b!878169 (= lt!397346 (addStillNotContains!204 lt!397348 lt!397349 lt!397345 lt!397347))))

(assert (=> b!878169 (= lt!397347 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!878169 (= lt!397345 (get!12922 (select (arr!24533 lt!397049) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!878169 (= lt!397349 (select (arr!24532 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001)))))

(declare-fun call!38890 () ListLongMap!10289)

(assert (=> b!878169 (= lt!397348 call!38890)))

(declare-fun e!488934 () ListLongMap!10289)

(assert (=> b!878169 (= e!488934 (+!2505 call!38890 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001)) (get!12922 (select (arr!24533 lt!397049) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!878170 () Bool)

(declare-fun e!488933 () Bool)

(declare-fun e!488931 () Bool)

(assert (=> b!878170 (= e!488933 e!488931)))

(declare-fun c!93026 () Bool)

(assert (=> b!878170 (= c!93026 (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun b!878171 () Bool)

(declare-fun e!488930 () Bool)

(assert (=> b!878171 (= e!488930 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!878171 (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!878172 () Bool)

(declare-fun res!596324 () Bool)

(declare-fun e!488932 () Bool)

(assert (=> b!878172 (=> (not res!596324) (not e!488932))))

(declare-fun lt!397343 () ListLongMap!10289)

(assert (=> b!878172 (= res!596324 (not (contains!4226 lt!397343 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!878173 () Bool)

(assert (=> b!878173 (= e!488929 e!488934)))

(declare-fun c!93027 () Bool)

(assert (=> b!878173 (= c!93027 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(declare-fun b!878174 () Bool)

(assert (=> b!878174 (= e!488931 (isEmpty!669 lt!397343))))

(declare-fun d!109115 () Bool)

(assert (=> d!109115 e!488932))

(declare-fun res!596326 () Bool)

(assert (=> d!109115 (=> (not res!596326) (not e!488932))))

(assert (=> d!109115 (= res!596326 (not (contains!4226 lt!397343 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109115 (= lt!397343 e!488929)))

(declare-fun c!93029 () Bool)

(assert (=> d!109115 (= c!93029 (bvsge (bvadd from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(assert (=> d!109115 (validMask!0 mask!1196)))

(assert (=> d!109115 (= (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696) lt!397343)))

(declare-fun b!878175 () Bool)

(declare-fun e!488935 () Bool)

(assert (=> b!878175 (= e!488933 e!488935)))

(assert (=> b!878175 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun res!596325 () Bool)

(assert (=> b!878175 (= res!596325 (contains!4226 lt!397343 (select (arr!24532 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!878175 (=> (not res!596325) (not e!488935))))

(declare-fun b!878176 () Bool)

(assert (=> b!878176 (= e!488932 e!488933)))

(declare-fun c!93028 () Bool)

(assert (=> b!878176 (= c!93028 e!488930)))

(declare-fun res!596323 () Bool)

(assert (=> b!878176 (=> (not res!596323) (not e!488930))))

(assert (=> b!878176 (= res!596323 (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun b!878177 () Bool)

(assert (=> b!878177 (= e!488934 call!38890)))

(declare-fun b!878178 () Bool)

(assert (=> b!878178 (= e!488931 (= lt!397343 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!878179 () Bool)

(assert (=> b!878179 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(assert (=> b!878179 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24974 lt!397049)))))

(assert (=> b!878179 (= e!488935 (= (apply!377 lt!397343 (select (arr!24532 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))) (get!12922 (select (arr!24533 lt!397049) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38887 () Bool)

(assert (=> bm!38887 (= call!38890 (getCurrentListMapNoExtraKeys!3202 _keys!868 lt!397049 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!109115 c!93029) b!878168))

(assert (= (and d!109115 (not c!93029)) b!878173))

(assert (= (and b!878173 c!93027) b!878169))

(assert (= (and b!878173 (not c!93027)) b!878177))

(assert (= (or b!878169 b!878177) bm!38887))

(assert (= (and d!109115 res!596326) b!878172))

(assert (= (and b!878172 res!596324) b!878176))

(assert (= (and b!878176 res!596323) b!878171))

(assert (= (and b!878176 c!93028) b!878175))

(assert (= (and b!878176 (not c!93028)) b!878170))

(assert (= (and b!878175 res!596325) b!878179))

(assert (= (and b!878170 c!93026) b!878178))

(assert (= (and b!878170 (not c!93026)) b!878174))

(declare-fun b_lambda!12307 () Bool)

(assert (=> (not b_lambda!12307) (not b!878169)))

(assert (=> b!878169 t!24431))

(declare-fun b_and!25057 () Bool)

(assert (= b_and!25055 (and (=> t!24431 result!9493) b_and!25057)))

(declare-fun b_lambda!12309 () Bool)

(assert (=> (not b_lambda!12309) (not b!878179)))

(assert (=> b!878179 t!24431))

(declare-fun b_and!25059 () Bool)

(assert (= b_and!25057 (and (=> t!24431 result!9493) b_and!25059)))

(declare-fun m!818639 () Bool)

(assert (=> b!878171 m!818639))

(assert (=> b!878171 m!818639))

(declare-fun m!818641 () Bool)

(assert (=> b!878171 m!818641))

(declare-fun m!818643 () Bool)

(assert (=> b!878172 m!818643))

(declare-fun m!818645 () Bool)

(assert (=> b!878179 m!818645))

(assert (=> b!878179 m!817885))

(declare-fun m!818647 () Bool)

(assert (=> b!878179 m!818647))

(assert (=> b!878179 m!817885))

(assert (=> b!878179 m!818639))

(declare-fun m!818649 () Bool)

(assert (=> b!878179 m!818649))

(assert (=> b!878179 m!818639))

(assert (=> b!878179 m!818645))

(declare-fun m!818651 () Bool)

(assert (=> b!878169 m!818651))

(declare-fun m!818653 () Bool)

(assert (=> b!878169 m!818653))

(assert (=> b!878169 m!817885))

(assert (=> b!878169 m!818645))

(declare-fun m!818655 () Bool)

(assert (=> b!878169 m!818655))

(declare-fun m!818657 () Bool)

(assert (=> b!878169 m!818657))

(assert (=> b!878169 m!818645))

(assert (=> b!878169 m!817885))

(assert (=> b!878169 m!818647))

(assert (=> b!878169 m!818639))

(assert (=> b!878169 m!818655))

(declare-fun m!818659 () Bool)

(assert (=> bm!38887 m!818659))

(declare-fun m!818661 () Bool)

(assert (=> b!878174 m!818661))

(assert (=> b!878175 m!818639))

(assert (=> b!878175 m!818639))

(declare-fun m!818663 () Bool)

(assert (=> b!878175 m!818663))

(declare-fun m!818665 () Bool)

(assert (=> d!109115 m!818665))

(assert (=> d!109115 m!817911))

(assert (=> b!878173 m!818639))

(assert (=> b!878173 m!818639))

(assert (=> b!878173 m!818641))

(assert (=> b!878178 m!818659))

(assert (=> bm!38855 d!109115))

(declare-fun d!109117 () Bool)

(declare-fun e!488936 () Bool)

(assert (=> d!109117 e!488936))

(declare-fun res!596327 () Bool)

(assert (=> d!109117 (=> (not res!596327) (not e!488936))))

(declare-fun lt!397352 () ListLongMap!10289)

(assert (=> d!109117 (= res!596327 (contains!4226 lt!397352 (_1!5770 (tuple2!11519 lt!397135 lt!397131))))))

(declare-fun lt!397351 () List!17355)

(assert (=> d!109117 (= lt!397352 (ListLongMap!10290 lt!397351))))

(declare-fun lt!397353 () Unit!29960)

(declare-fun lt!397350 () Unit!29960)

(assert (=> d!109117 (= lt!397353 lt!397350)))

(assert (=> d!109117 (= (getValueByKey!420 lt!397351 (_1!5770 (tuple2!11519 lt!397135 lt!397131))) (Some!425 (_2!5770 (tuple2!11519 lt!397135 lt!397131))))))

(assert (=> d!109117 (= lt!397350 (lemmaContainsTupThenGetReturnValue!234 lt!397351 (_1!5770 (tuple2!11519 lt!397135 lt!397131)) (_2!5770 (tuple2!11519 lt!397135 lt!397131))))))

(assert (=> d!109117 (= lt!397351 (insertStrictlySorted!273 (toList!5160 lt!397134) (_1!5770 (tuple2!11519 lt!397135 lt!397131)) (_2!5770 (tuple2!11519 lt!397135 lt!397131))))))

(assert (=> d!109117 (= (+!2505 lt!397134 (tuple2!11519 lt!397135 lt!397131)) lt!397352)))

(declare-fun b!878180 () Bool)

(declare-fun res!596328 () Bool)

(assert (=> b!878180 (=> (not res!596328) (not e!488936))))

(assert (=> b!878180 (= res!596328 (= (getValueByKey!420 (toList!5160 lt!397352) (_1!5770 (tuple2!11519 lt!397135 lt!397131))) (Some!425 (_2!5770 (tuple2!11519 lt!397135 lt!397131)))))))

(declare-fun b!878181 () Bool)

(assert (=> b!878181 (= e!488936 (contains!4227 (toList!5160 lt!397352) (tuple2!11519 lt!397135 lt!397131)))))

(assert (= (and d!109117 res!596327) b!878180))

(assert (= (and b!878180 res!596328) b!878181))

(declare-fun m!818667 () Bool)

(assert (=> d!109117 m!818667))

(declare-fun m!818669 () Bool)

(assert (=> d!109117 m!818669))

(declare-fun m!818671 () Bool)

(assert (=> d!109117 m!818671))

(declare-fun m!818673 () Bool)

(assert (=> d!109117 m!818673))

(declare-fun m!818675 () Bool)

(assert (=> b!878180 m!818675))

(declare-fun m!818677 () Bool)

(assert (=> b!878181 m!818677))

(assert (=> b!877803 d!109117))

(declare-fun d!109119 () Bool)

(declare-fun e!488937 () Bool)

(assert (=> d!109119 e!488937))

(declare-fun res!596329 () Bool)

(assert (=> d!109119 (=> (not res!596329) (not e!488937))))

(declare-fun lt!397356 () ListLongMap!10289)

(assert (=> d!109119 (= res!596329 (contains!4226 lt!397356 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!397355 () List!17355)

(assert (=> d!109119 (= lt!397356 (ListLongMap!10290 lt!397355))))

(declare-fun lt!397357 () Unit!29960)

(declare-fun lt!397354 () Unit!29960)

(assert (=> d!109119 (= lt!397357 lt!397354)))

(assert (=> d!109119 (= (getValueByKey!420 lt!397355 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!425 (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109119 (= lt!397354 (lemmaContainsTupThenGetReturnValue!234 lt!397355 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109119 (= lt!397355 (insertStrictlySorted!273 (toList!5160 call!38847) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109119 (= (+!2505 call!38847 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!397356)))

(declare-fun b!878182 () Bool)

(declare-fun res!596330 () Bool)

(assert (=> b!878182 (=> (not res!596330) (not e!488937))))

(assert (=> b!878182 (= res!596330 (= (getValueByKey!420 (toList!5160 lt!397356) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!425 (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!878183 () Bool)

(assert (=> b!878183 (= e!488937 (contains!4227 (toList!5160 lt!397356) (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109119 res!596329) b!878182))

(assert (= (and b!878182 res!596330) b!878183))

(declare-fun m!818679 () Bool)

(assert (=> d!109119 m!818679))

(declare-fun m!818681 () Bool)

(assert (=> d!109119 m!818681))

(declare-fun m!818683 () Bool)

(assert (=> d!109119 m!818683))

(declare-fun m!818685 () Bool)

(assert (=> d!109119 m!818685))

(declare-fun m!818687 () Bool)

(assert (=> b!878182 m!818687))

(declare-fun m!818689 () Bool)

(assert (=> b!878183 m!818689))

(assert (=> b!877803 d!109119))

(assert (=> b!877803 d!109053))

(declare-fun d!109121 () Bool)

(assert (=> d!109121 (not (contains!4226 (+!2505 lt!397134 (tuple2!11519 lt!397135 lt!397131)) lt!397133))))

(declare-fun lt!397358 () Unit!29960)

(assert (=> d!109121 (= lt!397358 (choose!1439 lt!397134 lt!397135 lt!397131 lt!397133))))

(declare-fun e!488938 () Bool)

(assert (=> d!109121 e!488938))

(declare-fun res!596331 () Bool)

(assert (=> d!109121 (=> (not res!596331) (not e!488938))))

(assert (=> d!109121 (= res!596331 (not (contains!4226 lt!397134 lt!397133)))))

(assert (=> d!109121 (= (addStillNotContains!204 lt!397134 lt!397135 lt!397131 lt!397133) lt!397358)))

(declare-fun b!878184 () Bool)

(assert (=> b!878184 (= e!488938 (not (= lt!397135 lt!397133)))))

(assert (= (and d!109121 res!596331) b!878184))

(assert (=> d!109121 m!818041))

(assert (=> d!109121 m!818041))

(assert (=> d!109121 m!818043))

(declare-fun m!818691 () Bool)

(assert (=> d!109121 m!818691))

(declare-fun m!818693 () Bool)

(assert (=> d!109121 m!818693))

(assert (=> b!877803 d!109121))

(declare-fun d!109123 () Bool)

(declare-fun e!488940 () Bool)

(assert (=> d!109123 e!488940))

(declare-fun res!596332 () Bool)

(assert (=> d!109123 (=> res!596332 e!488940)))

(declare-fun lt!397359 () Bool)

(assert (=> d!109123 (= res!596332 (not lt!397359))))

(declare-fun lt!397361 () Bool)

(assert (=> d!109123 (= lt!397359 lt!397361)))

(declare-fun lt!397362 () Unit!29960)

(declare-fun e!488939 () Unit!29960)

(assert (=> d!109123 (= lt!397362 e!488939)))

(declare-fun c!93030 () Bool)

(assert (=> d!109123 (= c!93030 lt!397361)))

(assert (=> d!109123 (= lt!397361 (containsKey!403 (toList!5160 (+!2505 lt!397134 (tuple2!11519 lt!397135 lt!397131))) lt!397133))))

(assert (=> d!109123 (= (contains!4226 (+!2505 lt!397134 (tuple2!11519 lt!397135 lt!397131)) lt!397133) lt!397359)))

(declare-fun b!878185 () Bool)

(declare-fun lt!397360 () Unit!29960)

(assert (=> b!878185 (= e!488939 lt!397360)))

(assert (=> b!878185 (= lt!397360 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 (+!2505 lt!397134 (tuple2!11519 lt!397135 lt!397131))) lt!397133))))

(assert (=> b!878185 (isDefined!313 (getValueByKey!420 (toList!5160 (+!2505 lt!397134 (tuple2!11519 lt!397135 lt!397131))) lt!397133))))

(declare-fun b!878186 () Bool)

(declare-fun Unit!29978 () Unit!29960)

(assert (=> b!878186 (= e!488939 Unit!29978)))

(declare-fun b!878187 () Bool)

(assert (=> b!878187 (= e!488940 (isDefined!313 (getValueByKey!420 (toList!5160 (+!2505 lt!397134 (tuple2!11519 lt!397135 lt!397131))) lt!397133)))))

(assert (= (and d!109123 c!93030) b!878185))

(assert (= (and d!109123 (not c!93030)) b!878186))

(assert (= (and d!109123 (not res!596332)) b!878187))

(declare-fun m!818695 () Bool)

(assert (=> d!109123 m!818695))

(declare-fun m!818697 () Bool)

(assert (=> b!878185 m!818697))

(declare-fun m!818699 () Bool)

(assert (=> b!878185 m!818699))

(assert (=> b!878185 m!818699))

(declare-fun m!818701 () Bool)

(assert (=> b!878185 m!818701))

(assert (=> b!878187 m!818699))

(assert (=> b!878187 m!818699))

(assert (=> b!878187 m!818701))

(assert (=> b!877803 d!109123))

(assert (=> b!877906 d!109075))

(declare-fun d!109125 () Bool)

(declare-fun lt!397363 () Bool)

(assert (=> d!109125 (= lt!397363 (select (content!391 (toList!5160 lt!397164)) lt!397048))))

(declare-fun e!488941 () Bool)

(assert (=> d!109125 (= lt!397363 e!488941)))

(declare-fun res!596333 () Bool)

(assert (=> d!109125 (=> (not res!596333) (not e!488941))))

(assert (=> d!109125 (= res!596333 ((_ is Cons!17351) (toList!5160 lt!397164)))))

(assert (=> d!109125 (= (contains!4227 (toList!5160 lt!397164) lt!397048) lt!397363)))

(declare-fun b!878188 () Bool)

(declare-fun e!488942 () Bool)

(assert (=> b!878188 (= e!488941 e!488942)))

(declare-fun res!596334 () Bool)

(assert (=> b!878188 (=> res!596334 e!488942)))

(assert (=> b!878188 (= res!596334 (= (h!18488 (toList!5160 lt!397164)) lt!397048))))

(declare-fun b!878189 () Bool)

(assert (=> b!878189 (= e!488942 (contains!4227 (t!24432 (toList!5160 lt!397164)) lt!397048))))

(assert (= (and d!109125 res!596333) b!878188))

(assert (= (and b!878188 (not res!596334)) b!878189))

(declare-fun m!818703 () Bool)

(assert (=> d!109125 m!818703))

(declare-fun m!818705 () Bool)

(assert (=> d!109125 m!818705))

(declare-fun m!818707 () Bool)

(assert (=> b!878189 m!818707))

(assert (=> b!877844 d!109125))

(declare-fun d!109127 () Bool)

(assert (=> d!109127 (= (apply!377 lt!397136 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12926 (getValueByKey!420 (toList!5160 lt!397136) (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))))

(declare-fun bs!24641 () Bool)

(assert (= bs!24641 d!109127))

(assert (=> bs!24641 m!818025))

(assert (=> bs!24641 m!818539))

(assert (=> bs!24641 m!818539))

(declare-fun m!818709 () Bool)

(assert (=> bs!24641 m!818709))

(assert (=> b!877825 d!109127))

(declare-fun d!109129 () Bool)

(declare-fun c!93031 () Bool)

(assert (=> d!109129 (= c!93031 ((_ is ValueCellFull!8273) (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun e!488943 () V!28281)

(assert (=> d!109129 (= (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488943)))

(declare-fun b!878190 () Bool)

(assert (=> b!878190 (= e!488943 (get!12924 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!878191 () Bool)

(assert (=> b!878191 (= e!488943 (get!12925 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109129 c!93031) b!878190))

(assert (= (and d!109129 (not c!93031)) b!878191))

(assert (=> b!878190 m!818055))

(assert (=> b!878190 m!817885))

(declare-fun m!818711 () Bool)

(assert (=> b!878190 m!818711))

(assert (=> b!878191 m!818055))

(assert (=> b!878191 m!817885))

(declare-fun m!818713 () Bool)

(assert (=> b!878191 m!818713))

(assert (=> b!877825 d!109129))

(assert (=> b!877888 d!108951))

(assert (=> b!877881 d!109115))

(declare-fun lt!397364 () Bool)

(declare-fun d!109131 () Bool)

(assert (=> d!109131 (= lt!397364 (select (content!391 (toList!5160 lt!397160)) (tuple2!11519 k0!854 lt!397052)))))

(declare-fun e!488944 () Bool)

(assert (=> d!109131 (= lt!397364 e!488944)))

(declare-fun res!596335 () Bool)

(assert (=> d!109131 (=> (not res!596335) (not e!488944))))

(assert (=> d!109131 (= res!596335 ((_ is Cons!17351) (toList!5160 lt!397160)))))

(assert (=> d!109131 (= (contains!4227 (toList!5160 lt!397160) (tuple2!11519 k0!854 lt!397052)) lt!397364)))

(declare-fun b!878192 () Bool)

(declare-fun e!488945 () Bool)

(assert (=> b!878192 (= e!488944 e!488945)))

(declare-fun res!596336 () Bool)

(assert (=> b!878192 (=> res!596336 e!488945)))

(assert (=> b!878192 (= res!596336 (= (h!18488 (toList!5160 lt!397160)) (tuple2!11519 k0!854 lt!397052)))))

(declare-fun b!878193 () Bool)

(assert (=> b!878193 (= e!488945 (contains!4227 (t!24432 (toList!5160 lt!397160)) (tuple2!11519 k0!854 lt!397052)))))

(assert (= (and d!109131 res!596335) b!878192))

(assert (= (and b!878192 (not res!596336)) b!878193))

(declare-fun m!818715 () Bool)

(assert (=> d!109131 m!818715))

(declare-fun m!818717 () Bool)

(assert (=> d!109131 m!818717))

(declare-fun m!818719 () Bool)

(assert (=> b!878193 m!818719))

(assert (=> b!877842 d!109131))

(assert (=> b!877805 d!109035))

(assert (=> b!877908 d!109075))

(declare-fun d!109133 () Bool)

(declare-fun e!488947 () Bool)

(assert (=> d!109133 e!488947))

(declare-fun res!596337 () Bool)

(assert (=> d!109133 (=> res!596337 e!488947)))

(declare-fun lt!397365 () Bool)

(assert (=> d!109133 (= res!596337 (not lt!397365))))

(declare-fun lt!397367 () Bool)

(assert (=> d!109133 (= lt!397365 lt!397367)))

(declare-fun lt!397368 () Unit!29960)

(declare-fun e!488946 () Unit!29960)

(assert (=> d!109133 (= lt!397368 e!488946)))

(declare-fun c!93032 () Bool)

(assert (=> d!109133 (= c!93032 lt!397367)))

(assert (=> d!109133 (= lt!397367 (containsKey!403 (toList!5160 lt!397197) (select (arr!24532 _keys!868) from!1053)))))

(assert (=> d!109133 (= (contains!4226 lt!397197 (select (arr!24532 _keys!868) from!1053)) lt!397365)))

(declare-fun b!878194 () Bool)

(declare-fun lt!397366 () Unit!29960)

(assert (=> b!878194 (= e!488946 lt!397366)))

(assert (=> b!878194 (= lt!397366 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397197) (select (arr!24532 _keys!868) from!1053)))))

(assert (=> b!878194 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397197) (select (arr!24532 _keys!868) from!1053)))))

(declare-fun b!878195 () Bool)

(declare-fun Unit!29979 () Unit!29960)

(assert (=> b!878195 (= e!488946 Unit!29979)))

(declare-fun b!878196 () Bool)

(assert (=> b!878196 (= e!488947 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397197) (select (arr!24532 _keys!868) from!1053))))))

(assert (= (and d!109133 c!93032) b!878194))

(assert (= (and d!109133 (not c!93032)) b!878195))

(assert (= (and d!109133 (not res!596337)) b!878196))

(assert (=> d!109133 m!817883))

(declare-fun m!818721 () Bool)

(assert (=> d!109133 m!818721))

(assert (=> b!878194 m!817883))

(declare-fun m!818723 () Bool)

(assert (=> b!878194 m!818723))

(assert (=> b!878194 m!817883))

(assert (=> b!878194 m!818377))

(assert (=> b!878194 m!818377))

(declare-fun m!818725 () Bool)

(assert (=> b!878194 m!818725))

(assert (=> b!878196 m!817883))

(assert (=> b!878196 m!818377))

(assert (=> b!878196 m!818377))

(assert (=> b!878196 m!818725))

(assert (=> b!877890 d!109133))

(declare-fun d!109135 () Bool)

(declare-fun e!488949 () Bool)

(assert (=> d!109135 e!488949))

(declare-fun res!596338 () Bool)

(assert (=> d!109135 (=> res!596338 e!488949)))

(declare-fun lt!397369 () Bool)

(assert (=> d!109135 (= res!596338 (not lt!397369))))

(declare-fun lt!397371 () Bool)

(assert (=> d!109135 (= lt!397369 lt!397371)))

(declare-fun lt!397372 () Unit!29960)

(declare-fun e!488948 () Unit!29960)

(assert (=> d!109135 (= lt!397372 e!488948)))

(declare-fun c!93033 () Bool)

(assert (=> d!109135 (= c!93033 lt!397371)))

(assert (=> d!109135 (= lt!397371 (containsKey!403 (toList!5160 lt!397179) (_1!5770 (tuple2!11519 k0!854 v!557))))))

(assert (=> d!109135 (= (contains!4226 lt!397179 (_1!5770 (tuple2!11519 k0!854 v!557))) lt!397369)))

(declare-fun b!878197 () Bool)

(declare-fun lt!397370 () Unit!29960)

(assert (=> b!878197 (= e!488948 lt!397370)))

(assert (=> b!878197 (= lt!397370 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397179) (_1!5770 (tuple2!11519 k0!854 v!557))))))

(assert (=> b!878197 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397179) (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!878198 () Bool)

(declare-fun Unit!29980 () Unit!29960)

(assert (=> b!878198 (= e!488948 Unit!29980)))

(declare-fun b!878199 () Bool)

(assert (=> b!878199 (= e!488949 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397179) (_1!5770 (tuple2!11519 k0!854 v!557)))))))

(assert (= (and d!109135 c!93033) b!878197))

(assert (= (and d!109135 (not c!93033)) b!878198))

(assert (= (and d!109135 (not res!596338)) b!878199))

(declare-fun m!818727 () Bool)

(assert (=> d!109135 m!818727))

(declare-fun m!818729 () Bool)

(assert (=> b!878197 m!818729))

(assert (=> b!878197 m!818165))

(assert (=> b!878197 m!818165))

(declare-fun m!818731 () Bool)

(assert (=> b!878197 m!818731))

(assert (=> b!878199 m!818165))

(assert (=> b!878199 m!818165))

(assert (=> b!878199 m!818731))

(assert (=> d!108975 d!109135))

(declare-fun b!878201 () Bool)

(declare-fun e!488950 () Option!426)

(declare-fun e!488951 () Option!426)

(assert (=> b!878201 (= e!488950 e!488951)))

(declare-fun c!93035 () Bool)

(assert (=> b!878201 (= c!93035 (and ((_ is Cons!17351) lt!397178) (not (= (_1!5770 (h!18488 lt!397178)) (_1!5770 (tuple2!11519 k0!854 v!557))))))))

(declare-fun b!878202 () Bool)

(assert (=> b!878202 (= e!488951 (getValueByKey!420 (t!24432 lt!397178) (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!878200 () Bool)

(assert (=> b!878200 (= e!488950 (Some!425 (_2!5770 (h!18488 lt!397178))))))

(declare-fun c!93034 () Bool)

(declare-fun d!109137 () Bool)

(assert (=> d!109137 (= c!93034 (and ((_ is Cons!17351) lt!397178) (= (_1!5770 (h!18488 lt!397178)) (_1!5770 (tuple2!11519 k0!854 v!557)))))))

(assert (=> d!109137 (= (getValueByKey!420 lt!397178 (_1!5770 (tuple2!11519 k0!854 v!557))) e!488950)))

(declare-fun b!878203 () Bool)

(assert (=> b!878203 (= e!488951 None!424)))

(assert (= (and d!109137 c!93034) b!878200))

(assert (= (and d!109137 (not c!93034)) b!878201))

(assert (= (and b!878201 c!93035) b!878202))

(assert (= (and b!878201 (not c!93035)) b!878203))

(declare-fun m!818733 () Bool)

(assert (=> b!878202 m!818733))

(assert (=> d!108975 d!109137))

(declare-fun d!109139 () Bool)

(assert (=> d!109139 (= (getValueByKey!420 lt!397178 (_1!5770 (tuple2!11519 k0!854 v!557))) (Some!425 (_2!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun lt!397373 () Unit!29960)

(assert (=> d!109139 (= lt!397373 (choose!1438 lt!397178 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun e!488952 () Bool)

(assert (=> d!109139 e!488952))

(declare-fun res!596339 () Bool)

(assert (=> d!109139 (=> (not res!596339) (not e!488952))))

(assert (=> d!109139 (= res!596339 (isStrictlySorted!449 lt!397178))))

(assert (=> d!109139 (= (lemmaContainsTupThenGetReturnValue!234 lt!397178 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))) lt!397373)))

(declare-fun b!878204 () Bool)

(declare-fun res!596340 () Bool)

(assert (=> b!878204 (=> (not res!596340) (not e!488952))))

(assert (=> b!878204 (= res!596340 (containsKey!403 lt!397178 (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!878205 () Bool)

(assert (=> b!878205 (= e!488952 (contains!4227 lt!397178 (tuple2!11519 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557)))))))

(assert (= (and d!109139 res!596339) b!878204))

(assert (= (and b!878204 res!596340) b!878205))

(assert (=> d!109139 m!818159))

(declare-fun m!818735 () Bool)

(assert (=> d!109139 m!818735))

(declare-fun m!818737 () Bool)

(assert (=> d!109139 m!818737))

(declare-fun m!818739 () Bool)

(assert (=> b!878204 m!818739))

(declare-fun m!818741 () Bool)

(assert (=> b!878205 m!818741))

(assert (=> d!108975 d!109139))

(declare-fun b!878206 () Bool)

(declare-fun e!488954 () List!17355)

(declare-fun call!38893 () List!17355)

(assert (=> b!878206 (= e!488954 call!38893)))

(declare-fun c!93036 () Bool)

(declare-fun b!878207 () Bool)

(declare-fun e!488957 () List!17355)

(declare-fun c!93039 () Bool)

(assert (=> b!878207 (= e!488957 (ite c!93036 (t!24432 (toList!5160 call!38832)) (ite c!93039 (Cons!17351 (h!18488 (toList!5160 call!38832)) (t!24432 (toList!5160 call!38832))) Nil!17352)))))

(declare-fun b!878208 () Bool)

(declare-fun res!596341 () Bool)

(declare-fun e!488956 () Bool)

(assert (=> b!878208 (=> (not res!596341) (not e!488956))))

(declare-fun lt!397374 () List!17355)

(assert (=> b!878208 (= res!596341 (containsKey!403 lt!397374 (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!878209 () Bool)

(declare-fun e!488953 () List!17355)

(assert (=> b!878209 (= e!488953 e!488954)))

(assert (=> b!878209 (= c!93036 (and ((_ is Cons!17351) (toList!5160 call!38832)) (= (_1!5770 (h!18488 (toList!5160 call!38832))) (_1!5770 (tuple2!11519 k0!854 v!557)))))))

(declare-fun b!878211 () Bool)

(declare-fun e!488955 () List!17355)

(declare-fun call!38892 () List!17355)

(assert (=> b!878211 (= e!488955 call!38892)))

(declare-fun b!878212 () Bool)

(assert (=> b!878212 (= e!488957 (insertStrictlySorted!273 (t!24432 (toList!5160 call!38832)) (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!878213 () Bool)

(declare-fun call!38891 () List!17355)

(assert (=> b!878213 (= e!488953 call!38891)))

(declare-fun b!878214 () Bool)

(assert (=> b!878214 (= c!93039 (and ((_ is Cons!17351) (toList!5160 call!38832)) (bvsgt (_1!5770 (h!18488 (toList!5160 call!38832))) (_1!5770 (tuple2!11519 k0!854 v!557)))))))

(assert (=> b!878214 (= e!488954 e!488955)))

(declare-fun b!878215 () Bool)

(assert (=> b!878215 (= e!488956 (contains!4227 lt!397374 (tuple2!11519 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557)))))))

(declare-fun bm!38888 () Bool)

(assert (=> bm!38888 (= call!38892 call!38893)))

(declare-fun b!878210 () Bool)

(assert (=> b!878210 (= e!488955 call!38892)))

(declare-fun d!109141 () Bool)

(assert (=> d!109141 e!488956))

(declare-fun res!596342 () Bool)

(assert (=> d!109141 (=> (not res!596342) (not e!488956))))

(assert (=> d!109141 (= res!596342 (isStrictlySorted!449 lt!397374))))

(assert (=> d!109141 (= lt!397374 e!488953)))

(declare-fun c!93038 () Bool)

(assert (=> d!109141 (= c!93038 (and ((_ is Cons!17351) (toList!5160 call!38832)) (bvslt (_1!5770 (h!18488 (toList!5160 call!38832))) (_1!5770 (tuple2!11519 k0!854 v!557)))))))

(assert (=> d!109141 (isStrictlySorted!449 (toList!5160 call!38832))))

(assert (=> d!109141 (= (insertStrictlySorted!273 (toList!5160 call!38832) (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))) lt!397374)))

(declare-fun bm!38889 () Bool)

(assert (=> bm!38889 (= call!38891 ($colon$colon!535 e!488957 (ite c!93038 (h!18488 (toList!5160 call!38832)) (tuple2!11519 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))))))))

(declare-fun c!93037 () Bool)

(assert (=> bm!38889 (= c!93037 c!93038)))

(declare-fun bm!38890 () Bool)

(assert (=> bm!38890 (= call!38893 call!38891)))

(assert (= (and d!109141 c!93038) b!878213))

(assert (= (and d!109141 (not c!93038)) b!878209))

(assert (= (and b!878209 c!93036) b!878206))

(assert (= (and b!878209 (not c!93036)) b!878214))

(assert (= (and b!878214 c!93039) b!878210))

(assert (= (and b!878214 (not c!93039)) b!878211))

(assert (= (or b!878210 b!878211) bm!38888))

(assert (= (or b!878206 bm!38888) bm!38890))

(assert (= (or b!878213 bm!38890) bm!38889))

(assert (= (and bm!38889 c!93037) b!878212))

(assert (= (and bm!38889 (not c!93037)) b!878207))

(assert (= (and d!109141 res!596342) b!878208))

(assert (= (and b!878208 res!596341) b!878215))

(declare-fun m!818743 () Bool)

(assert (=> b!878212 m!818743))

(declare-fun m!818745 () Bool)

(assert (=> bm!38889 m!818745))

(declare-fun m!818747 () Bool)

(assert (=> b!878208 m!818747))

(declare-fun m!818749 () Bool)

(assert (=> b!878215 m!818749))

(declare-fun m!818751 () Bool)

(assert (=> d!109141 m!818751))

(declare-fun m!818753 () Bool)

(assert (=> d!109141 m!818753))

(assert (=> d!108975 d!109141))

(declare-fun d!109143 () Bool)

(assert (=> d!109143 (= (isEmpty!669 lt!397129) (isEmpty!670 (toList!5160 lt!397129)))))

(declare-fun bs!24642 () Bool)

(assert (= bs!24642 d!109143))

(declare-fun m!818755 () Bool)

(assert (=> bs!24642 m!818755))

(assert (=> b!877808 d!109143))

(declare-fun b!878216 () Bool)

(declare-fun e!488958 () ListLongMap!10289)

(assert (=> b!878216 (= e!488958 (ListLongMap!10290 Nil!17352))))

(declare-fun b!878217 () Bool)

(declare-fun lt!397376 () Unit!29960)

(declare-fun lt!397378 () Unit!29960)

(assert (=> b!878217 (= lt!397376 lt!397378)))

(declare-fun lt!397379 () (_ BitVec 64))

(declare-fun lt!397377 () V!28281)

(declare-fun lt!397380 () ListLongMap!10289)

(declare-fun lt!397381 () (_ BitVec 64))

(assert (=> b!878217 (not (contains!4226 (+!2505 lt!397380 (tuple2!11519 lt!397381 lt!397377)) lt!397379))))

(assert (=> b!878217 (= lt!397378 (addStillNotContains!204 lt!397380 lt!397381 lt!397377 lt!397379))))

(assert (=> b!878217 (= lt!397379 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!878217 (= lt!397377 (get!12922 (select (arr!24533 _values!688) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!878217 (= lt!397381 (select (arr!24532 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001)))))

(declare-fun call!38894 () ListLongMap!10289)

(assert (=> b!878217 (= lt!397380 call!38894)))

(declare-fun e!488963 () ListLongMap!10289)

(assert (=> b!878217 (= e!488963 (+!2505 call!38894 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001)) (get!12922 (select (arr!24533 _values!688) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!878218 () Bool)

(declare-fun e!488962 () Bool)

(declare-fun e!488960 () Bool)

(assert (=> b!878218 (= e!488962 e!488960)))

(declare-fun c!93040 () Bool)

(assert (=> b!878218 (= c!93040 (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun b!878219 () Bool)

(declare-fun e!488959 () Bool)

(assert (=> b!878219 (= e!488959 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!878219 (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!878220 () Bool)

(declare-fun res!596344 () Bool)

(declare-fun e!488961 () Bool)

(assert (=> b!878220 (=> (not res!596344) (not e!488961))))

(declare-fun lt!397375 () ListLongMap!10289)

(assert (=> b!878220 (= res!596344 (not (contains!4226 lt!397375 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!878221 () Bool)

(assert (=> b!878221 (= e!488958 e!488963)))

(declare-fun c!93041 () Bool)

(assert (=> b!878221 (= c!93041 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(declare-fun b!878222 () Bool)

(assert (=> b!878222 (= e!488960 (isEmpty!669 lt!397375))))

(declare-fun d!109145 () Bool)

(assert (=> d!109145 e!488961))

(declare-fun res!596346 () Bool)

(assert (=> d!109145 (=> (not res!596346) (not e!488961))))

(assert (=> d!109145 (= res!596346 (not (contains!4226 lt!397375 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109145 (= lt!397375 e!488958)))

(declare-fun c!93043 () Bool)

(assert (=> d!109145 (= c!93043 (bvsge (bvadd from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(assert (=> d!109145 (validMask!0 mask!1196)))

(assert (=> d!109145 (= (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696) lt!397375)))

(declare-fun b!878223 () Bool)

(declare-fun e!488964 () Bool)

(assert (=> b!878223 (= e!488962 e!488964)))

(assert (=> b!878223 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun res!596345 () Bool)

(assert (=> b!878223 (= res!596345 (contains!4226 lt!397375 (select (arr!24532 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!878223 (=> (not res!596345) (not e!488964))))

(declare-fun b!878224 () Bool)

(assert (=> b!878224 (= e!488961 e!488962)))

(declare-fun c!93042 () Bool)

(assert (=> b!878224 (= c!93042 e!488959)))

(declare-fun res!596343 () Bool)

(assert (=> b!878224 (=> (not res!596343) (not e!488959))))

(assert (=> b!878224 (= res!596343 (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun b!878225 () Bool)

(assert (=> b!878225 (= e!488963 call!38894)))

(declare-fun b!878226 () Bool)

(assert (=> b!878226 (= e!488960 (= lt!397375 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!878227 () Bool)

(assert (=> b!878227 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(assert (=> b!878227 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24974 _values!688)))))

(assert (=> b!878227 (= e!488964 (= (apply!377 lt!397375 (select (arr!24532 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))) (get!12922 (select (arr!24533 _values!688) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38891 () Bool)

(assert (=> bm!38891 (= call!38894 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!109145 c!93043) b!878216))

(assert (= (and d!109145 (not c!93043)) b!878221))

(assert (= (and b!878221 c!93041) b!878217))

(assert (= (and b!878221 (not c!93041)) b!878225))

(assert (= (or b!878217 b!878225) bm!38891))

(assert (= (and d!109145 res!596346) b!878220))

(assert (= (and b!878220 res!596344) b!878224))

(assert (= (and b!878224 res!596343) b!878219))

(assert (= (and b!878224 c!93042) b!878223))

(assert (= (and b!878224 (not c!93042)) b!878218))

(assert (= (and b!878223 res!596345) b!878227))

(assert (= (and b!878218 c!93040) b!878226))

(assert (= (and b!878218 (not c!93040)) b!878222))

(declare-fun b_lambda!12311 () Bool)

(assert (=> (not b_lambda!12311) (not b!878217)))

(assert (=> b!878217 t!24431))

(declare-fun b_and!25061 () Bool)

(assert (= b_and!25059 (and (=> t!24431 result!9493) b_and!25061)))

(declare-fun b_lambda!12313 () Bool)

(assert (=> (not b_lambda!12313) (not b!878227)))

(assert (=> b!878227 t!24431))

(declare-fun b_and!25063 () Bool)

(assert (= b_and!25061 (and (=> t!24431 result!9493) b_and!25063)))

(assert (=> b!878219 m!818639))

(assert (=> b!878219 m!818639))

(assert (=> b!878219 m!818641))

(declare-fun m!818757 () Bool)

(assert (=> b!878220 m!818757))

(declare-fun m!818759 () Bool)

(assert (=> b!878227 m!818759))

(assert (=> b!878227 m!817885))

(declare-fun m!818761 () Bool)

(assert (=> b!878227 m!818761))

(assert (=> b!878227 m!817885))

(assert (=> b!878227 m!818639))

(declare-fun m!818763 () Bool)

(assert (=> b!878227 m!818763))

(assert (=> b!878227 m!818639))

(assert (=> b!878227 m!818759))

(declare-fun m!818765 () Bool)

(assert (=> b!878217 m!818765))

(declare-fun m!818767 () Bool)

(assert (=> b!878217 m!818767))

(assert (=> b!878217 m!817885))

(assert (=> b!878217 m!818759))

(declare-fun m!818769 () Bool)

(assert (=> b!878217 m!818769))

(declare-fun m!818771 () Bool)

(assert (=> b!878217 m!818771))

(assert (=> b!878217 m!818759))

(assert (=> b!878217 m!817885))

(assert (=> b!878217 m!818761))

(assert (=> b!878217 m!818639))

(assert (=> b!878217 m!818769))

(declare-fun m!818773 () Bool)

(assert (=> bm!38891 m!818773))

(declare-fun m!818775 () Bool)

(assert (=> b!878222 m!818775))

(assert (=> b!878223 m!818639))

(assert (=> b!878223 m!818639))

(declare-fun m!818777 () Bool)

(assert (=> b!878223 m!818777))

(declare-fun m!818779 () Bool)

(assert (=> d!109145 m!818779))

(assert (=> d!109145 m!817911))

(assert (=> b!878221 m!818639))

(assert (=> b!878221 m!818639))

(assert (=> b!878221 m!818641))

(assert (=> b!878226 m!818773))

(assert (=> b!877893 d!109145))

(declare-fun d!109147 () Bool)

(declare-fun e!488966 () Bool)

(assert (=> d!109147 e!488966))

(declare-fun res!596347 () Bool)

(assert (=> d!109147 (=> res!596347 e!488966)))

(declare-fun lt!397382 () Bool)

(assert (=> d!109147 (= res!596347 (not lt!397382))))

(declare-fun lt!397384 () Bool)

(assert (=> d!109147 (= lt!397382 lt!397384)))

(declare-fun lt!397385 () Unit!29960)

(declare-fun e!488965 () Unit!29960)

(assert (=> d!109147 (= lt!397385 e!488965)))

(declare-fun c!93044 () Bool)

(assert (=> d!109147 (= c!93044 lt!397384)))

(assert (=> d!109147 (= lt!397384 (containsKey!403 (toList!5160 lt!397156) (_1!5770 (tuple2!11519 k0!854 v!557))))))

(assert (=> d!109147 (= (contains!4226 lt!397156 (_1!5770 (tuple2!11519 k0!854 v!557))) lt!397382)))

(declare-fun b!878228 () Bool)

(declare-fun lt!397383 () Unit!29960)

(assert (=> b!878228 (= e!488965 lt!397383)))

(assert (=> b!878228 (= lt!397383 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397156) (_1!5770 (tuple2!11519 k0!854 v!557))))))

(assert (=> b!878228 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397156) (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!878229 () Bool)

(declare-fun Unit!29981 () Unit!29960)

(assert (=> b!878229 (= e!488965 Unit!29981)))

(declare-fun b!878230 () Bool)

(assert (=> b!878230 (= e!488966 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397156) (_1!5770 (tuple2!11519 k0!854 v!557)))))))

(assert (= (and d!109147 c!93044) b!878228))

(assert (= (and d!109147 (not c!93044)) b!878229))

(assert (= (and d!109147 (not res!596347)) b!878230))

(declare-fun m!818781 () Bool)

(assert (=> d!109147 m!818781))

(declare-fun m!818783 () Bool)

(assert (=> b!878228 m!818783))

(assert (=> b!878228 m!818091))

(assert (=> b!878228 m!818091))

(declare-fun m!818785 () Bool)

(assert (=> b!878228 m!818785))

(assert (=> b!878230 m!818091))

(assert (=> b!878230 m!818091))

(assert (=> b!878230 m!818785))

(assert (=> d!108957 d!109147))

(declare-fun b!878232 () Bool)

(declare-fun e!488967 () Option!426)

(declare-fun e!488968 () Option!426)

(assert (=> b!878232 (= e!488967 e!488968)))

(declare-fun c!93046 () Bool)

(assert (=> b!878232 (= c!93046 (and ((_ is Cons!17351) lt!397155) (not (= (_1!5770 (h!18488 lt!397155)) (_1!5770 (tuple2!11519 k0!854 v!557))))))))

(declare-fun b!878233 () Bool)

(assert (=> b!878233 (= e!488968 (getValueByKey!420 (t!24432 lt!397155) (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!878231 () Bool)

(assert (=> b!878231 (= e!488967 (Some!425 (_2!5770 (h!18488 lt!397155))))))

(declare-fun c!93045 () Bool)

(declare-fun d!109149 () Bool)

(assert (=> d!109149 (= c!93045 (and ((_ is Cons!17351) lt!397155) (= (_1!5770 (h!18488 lt!397155)) (_1!5770 (tuple2!11519 k0!854 v!557)))))))

(assert (=> d!109149 (= (getValueByKey!420 lt!397155 (_1!5770 (tuple2!11519 k0!854 v!557))) e!488967)))

(declare-fun b!878234 () Bool)

(assert (=> b!878234 (= e!488968 None!424)))

(assert (= (and d!109149 c!93045) b!878231))

(assert (= (and d!109149 (not c!93045)) b!878232))

(assert (= (and b!878232 c!93046) b!878233))

(assert (= (and b!878232 (not c!93046)) b!878234))

(declare-fun m!818787 () Bool)

(assert (=> b!878233 m!818787))

(assert (=> d!108957 d!109149))

(declare-fun d!109151 () Bool)

(assert (=> d!109151 (= (getValueByKey!420 lt!397155 (_1!5770 (tuple2!11519 k0!854 v!557))) (Some!425 (_2!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun lt!397386 () Unit!29960)

(assert (=> d!109151 (= lt!397386 (choose!1438 lt!397155 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun e!488969 () Bool)

(assert (=> d!109151 e!488969))

(declare-fun res!596348 () Bool)

(assert (=> d!109151 (=> (not res!596348) (not e!488969))))

(assert (=> d!109151 (= res!596348 (isStrictlySorted!449 lt!397155))))

(assert (=> d!109151 (= (lemmaContainsTupThenGetReturnValue!234 lt!397155 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))) lt!397386)))

(declare-fun b!878235 () Bool)

(declare-fun res!596349 () Bool)

(assert (=> b!878235 (=> (not res!596349) (not e!488969))))

(assert (=> b!878235 (= res!596349 (containsKey!403 lt!397155 (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!878236 () Bool)

(assert (=> b!878236 (= e!488969 (contains!4227 lt!397155 (tuple2!11519 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557)))))))

(assert (= (and d!109151 res!596348) b!878235))

(assert (= (and b!878235 res!596349) b!878236))

(assert (=> d!109151 m!818085))

(declare-fun m!818789 () Bool)

(assert (=> d!109151 m!818789))

(declare-fun m!818791 () Bool)

(assert (=> d!109151 m!818791))

(declare-fun m!818793 () Bool)

(assert (=> b!878235 m!818793))

(declare-fun m!818795 () Bool)

(assert (=> b!878236 m!818795))

(assert (=> d!108957 d!109151))

(declare-fun b!878237 () Bool)

(declare-fun e!488971 () List!17355)

(declare-fun call!38897 () List!17355)

(assert (=> b!878237 (= e!488971 call!38897)))

(declare-fun b!878238 () Bool)

(declare-fun c!93047 () Bool)

(declare-fun c!93050 () Bool)

(declare-fun e!488974 () List!17355)

(assert (=> b!878238 (= e!488974 (ite c!93047 (t!24432 (toList!5160 lt!397054)) (ite c!93050 (Cons!17351 (h!18488 (toList!5160 lt!397054)) (t!24432 (toList!5160 lt!397054))) Nil!17352)))))

(declare-fun b!878239 () Bool)

(declare-fun res!596350 () Bool)

(declare-fun e!488973 () Bool)

(assert (=> b!878239 (=> (not res!596350) (not e!488973))))

(declare-fun lt!397387 () List!17355)

(assert (=> b!878239 (= res!596350 (containsKey!403 lt!397387 (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!878240 () Bool)

(declare-fun e!488970 () List!17355)

(assert (=> b!878240 (= e!488970 e!488971)))

(assert (=> b!878240 (= c!93047 (and ((_ is Cons!17351) (toList!5160 lt!397054)) (= (_1!5770 (h!18488 (toList!5160 lt!397054))) (_1!5770 (tuple2!11519 k0!854 v!557)))))))

(declare-fun b!878242 () Bool)

(declare-fun e!488972 () List!17355)

(declare-fun call!38896 () List!17355)

(assert (=> b!878242 (= e!488972 call!38896)))

(declare-fun b!878243 () Bool)

(assert (=> b!878243 (= e!488974 (insertStrictlySorted!273 (t!24432 (toList!5160 lt!397054)) (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!878244 () Bool)

(declare-fun call!38895 () List!17355)

(assert (=> b!878244 (= e!488970 call!38895)))

(declare-fun b!878245 () Bool)

(assert (=> b!878245 (= c!93050 (and ((_ is Cons!17351) (toList!5160 lt!397054)) (bvsgt (_1!5770 (h!18488 (toList!5160 lt!397054))) (_1!5770 (tuple2!11519 k0!854 v!557)))))))

(assert (=> b!878245 (= e!488971 e!488972)))

(declare-fun b!878246 () Bool)

(assert (=> b!878246 (= e!488973 (contains!4227 lt!397387 (tuple2!11519 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557)))))))

(declare-fun bm!38892 () Bool)

(assert (=> bm!38892 (= call!38896 call!38897)))

(declare-fun b!878241 () Bool)

(assert (=> b!878241 (= e!488972 call!38896)))

(declare-fun d!109153 () Bool)

(assert (=> d!109153 e!488973))

(declare-fun res!596351 () Bool)

(assert (=> d!109153 (=> (not res!596351) (not e!488973))))

(assert (=> d!109153 (= res!596351 (isStrictlySorted!449 lt!397387))))

(assert (=> d!109153 (= lt!397387 e!488970)))

(declare-fun c!93049 () Bool)

(assert (=> d!109153 (= c!93049 (and ((_ is Cons!17351) (toList!5160 lt!397054)) (bvslt (_1!5770 (h!18488 (toList!5160 lt!397054))) (_1!5770 (tuple2!11519 k0!854 v!557)))))))

(assert (=> d!109153 (isStrictlySorted!449 (toList!5160 lt!397054))))

(assert (=> d!109153 (= (insertStrictlySorted!273 (toList!5160 lt!397054) (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))) lt!397387)))

(declare-fun bm!38893 () Bool)

(assert (=> bm!38893 (= call!38895 ($colon$colon!535 e!488974 (ite c!93049 (h!18488 (toList!5160 lt!397054)) (tuple2!11519 (_1!5770 (tuple2!11519 k0!854 v!557)) (_2!5770 (tuple2!11519 k0!854 v!557))))))))

(declare-fun c!93048 () Bool)

(assert (=> bm!38893 (= c!93048 c!93049)))

(declare-fun bm!38894 () Bool)

(assert (=> bm!38894 (= call!38897 call!38895)))

(assert (= (and d!109153 c!93049) b!878244))

(assert (= (and d!109153 (not c!93049)) b!878240))

(assert (= (and b!878240 c!93047) b!878237))

(assert (= (and b!878240 (not c!93047)) b!878245))

(assert (= (and b!878245 c!93050) b!878241))

(assert (= (and b!878245 (not c!93050)) b!878242))

(assert (= (or b!878241 b!878242) bm!38892))

(assert (= (or b!878237 bm!38892) bm!38894))

(assert (= (or b!878244 bm!38894) bm!38893))

(assert (= (and bm!38893 c!93048) b!878243))

(assert (= (and bm!38893 (not c!93048)) b!878238))

(assert (= (and d!109153 res!596351) b!878239))

(assert (= (and b!878239 res!596350) b!878246))

(declare-fun m!818797 () Bool)

(assert (=> b!878243 m!818797))

(declare-fun m!818799 () Bool)

(assert (=> bm!38893 m!818799))

(declare-fun m!818801 () Bool)

(assert (=> b!878239 m!818801))

(declare-fun m!818803 () Bool)

(assert (=> b!878246 m!818803))

(declare-fun m!818805 () Bool)

(assert (=> d!109153 m!818805))

(declare-fun m!818807 () Bool)

(assert (=> d!109153 m!818807))

(assert (=> d!108957 d!109153))

(declare-fun d!109155 () Bool)

(assert (=> d!109155 (= (get!12925 (select (arr!24533 _values!688) from!1053) lt!397051) lt!397051)))

(assert (=> b!877850 d!109155))

(declare-fun b!878248 () Bool)

(declare-fun e!488975 () Option!426)

(declare-fun e!488976 () Option!426)

(assert (=> b!878248 (= e!488975 e!488976)))

(declare-fun c!93052 () Bool)

(assert (=> b!878248 (= c!93052 (and ((_ is Cons!17351) (toList!5160 lt!397171)) (not (= (_1!5770 (h!18488 (toList!5160 lt!397171))) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))))

(declare-fun b!878249 () Bool)

(assert (=> b!878249 (= e!488976 (getValueByKey!420 (t!24432 (toList!5160 lt!397171)) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))))))

(declare-fun b!878247 () Bool)

(assert (=> b!878247 (= e!488975 (Some!425 (_2!5770 (h!18488 (toList!5160 lt!397171)))))))

(declare-fun c!93051 () Bool)

(declare-fun d!109157 () Bool)

(assert (=> d!109157 (= c!93051 (and ((_ is Cons!17351) (toList!5160 lt!397171)) (= (_1!5770 (h!18488 (toList!5160 lt!397171))) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047)))))))

(assert (=> d!109157 (= (getValueByKey!420 (toList!5160 lt!397171) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) from!1053) lt!397047))) e!488975)))

(declare-fun b!878250 () Bool)

(assert (=> b!878250 (= e!488976 None!424)))

(assert (= (and d!109157 c!93051) b!878247))

(assert (= (and d!109157 (not c!93051)) b!878248))

(assert (= (and b!878248 c!93052) b!878249))

(assert (= (and b!878248 (not c!93052)) b!878250))

(declare-fun m!818809 () Bool)

(assert (=> b!878249 m!818809))

(assert (=> b!877853 d!109157))

(assert (=> bm!38856 d!109145))

(declare-fun d!109159 () Bool)

(declare-fun e!488978 () Bool)

(assert (=> d!109159 e!488978))

(declare-fun res!596352 () Bool)

(assert (=> d!109159 (=> res!596352 e!488978)))

(declare-fun lt!397388 () Bool)

(assert (=> d!109159 (= res!596352 (not lt!397388))))

(declare-fun lt!397390 () Bool)

(assert (=> d!109159 (= lt!397388 lt!397390)))

(declare-fun lt!397391 () Unit!29960)

(declare-fun e!488977 () Unit!29960)

(assert (=> d!109159 (= lt!397391 e!488977)))

(declare-fun c!93053 () Bool)

(assert (=> d!109159 (= c!93053 lt!397390)))

(assert (=> d!109159 (= lt!397390 (containsKey!403 (toList!5160 lt!397136) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109159 (= (contains!4226 lt!397136 #b0000000000000000000000000000000000000000000000000000000000000000) lt!397388)))

(declare-fun b!878251 () Bool)

(declare-fun lt!397389 () Unit!29960)

(assert (=> b!878251 (= e!488977 lt!397389)))

(assert (=> b!878251 (= lt!397389 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397136) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!878251 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397136) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!878252 () Bool)

(declare-fun Unit!29982 () Unit!29960)

(assert (=> b!878252 (= e!488977 Unit!29982)))

(declare-fun b!878253 () Bool)

(assert (=> b!878253 (= e!488978 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397136) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109159 c!93053) b!878251))

(assert (= (and d!109159 (not c!93053)) b!878252))

(assert (= (and d!109159 (not res!596352)) b!878253))

(declare-fun m!818811 () Bool)

(assert (=> d!109159 m!818811))

(declare-fun m!818813 () Bool)

(assert (=> b!878251 m!818813))

(declare-fun m!818815 () Bool)

(assert (=> b!878251 m!818815))

(assert (=> b!878251 m!818815))

(declare-fun m!818817 () Bool)

(assert (=> b!878251 m!818817))

(assert (=> b!878253 m!818815))

(assert (=> b!878253 m!818815))

(assert (=> b!878253 m!818817))

(assert (=> d!108945 d!109159))

(assert (=> d!108945 d!108955))

(declare-fun b!878254 () Bool)

(declare-fun e!488979 () ListLongMap!10289)

(assert (=> b!878254 (= e!488979 (ListLongMap!10290 Nil!17352))))

(declare-fun b!878255 () Bool)

(declare-fun lt!397393 () Unit!29960)

(declare-fun lt!397395 () Unit!29960)

(assert (=> b!878255 (= lt!397393 lt!397395)))

(declare-fun lt!397394 () V!28281)

(declare-fun lt!397397 () ListLongMap!10289)

(declare-fun lt!397396 () (_ BitVec 64))

(declare-fun lt!397398 () (_ BitVec 64))

(assert (=> b!878255 (not (contains!4226 (+!2505 lt!397397 (tuple2!11519 lt!397398 lt!397394)) lt!397396))))

(assert (=> b!878255 (= lt!397395 (addStillNotContains!204 lt!397397 lt!397398 lt!397394 lt!397396))))

(assert (=> b!878255 (= lt!397396 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!878255 (= lt!397394 (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!878255 (= lt!397398 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(declare-fun call!38898 () ListLongMap!10289)

(assert (=> b!878255 (= lt!397397 call!38898)))

(declare-fun e!488984 () ListLongMap!10289)

(assert (=> b!878255 (= e!488984 (+!2505 call!38898 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!878256 () Bool)

(declare-fun e!488983 () Bool)

(declare-fun e!488981 () Bool)

(assert (=> b!878256 (= e!488983 e!488981)))

(declare-fun c!93054 () Bool)

(assert (=> b!878256 (= c!93054 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun b!878257 () Bool)

(declare-fun e!488980 () Bool)

(assert (=> b!878257 (= e!488980 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!878257 (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!878258 () Bool)

(declare-fun res!596354 () Bool)

(declare-fun e!488982 () Bool)

(assert (=> b!878258 (=> (not res!596354) (not e!488982))))

(declare-fun lt!397392 () ListLongMap!10289)

(assert (=> b!878258 (= res!596354 (not (contains!4226 lt!397392 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!878259 () Bool)

(assert (=> b!878259 (= e!488979 e!488984)))

(declare-fun c!93055 () Bool)

(assert (=> b!878259 (= c!93055 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(declare-fun b!878260 () Bool)

(assert (=> b!878260 (= e!488981 (isEmpty!669 lt!397392))))

(declare-fun d!109161 () Bool)

(assert (=> d!109161 e!488982))

(declare-fun res!596356 () Bool)

(assert (=> d!109161 (=> (not res!596356) (not e!488982))))

(assert (=> d!109161 (= res!596356 (not (contains!4226 lt!397392 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109161 (= lt!397392 e!488979)))

(declare-fun c!93057 () Bool)

(assert (=> d!109161 (= c!93057 (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(assert (=> d!109161 (validMask!0 mask!1196)))

(assert (=> d!109161 (= (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696) lt!397392)))

(declare-fun b!878261 () Bool)

(declare-fun e!488985 () Bool)

(assert (=> b!878261 (= e!488983 e!488985)))

(assert (=> b!878261 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun res!596355 () Bool)

(assert (=> b!878261 (= res!596355 (contains!4226 lt!397392 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!878261 (=> (not res!596355) (not e!488985))))

(declare-fun b!878262 () Bool)

(assert (=> b!878262 (= e!488982 e!488983)))

(declare-fun c!93056 () Bool)

(assert (=> b!878262 (= c!93056 e!488980)))

(declare-fun res!596353 () Bool)

(assert (=> b!878262 (=> (not res!596353) (not e!488980))))

(assert (=> b!878262 (= res!596353 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(declare-fun b!878263 () Bool)

(assert (=> b!878263 (= e!488984 call!38898)))

(declare-fun b!878264 () Bool)

(assert (=> b!878264 (= e!488981 (= lt!397392 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!878265 () Bool)

(assert (=> b!878265 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24973 _keys!868)))))

(assert (=> b!878265 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24974 _values!688)))))

(assert (=> b!878265 (= e!488985 (= (apply!377 lt!397392 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))) (get!12922 (select (arr!24533 _values!688) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38895 () Bool)

(assert (=> bm!38895 (= call!38898 (getCurrentListMapNoExtraKeys!3202 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!109161 c!93057) b!878254))

(assert (= (and d!109161 (not c!93057)) b!878259))

(assert (= (and b!878259 c!93055) b!878255))

(assert (= (and b!878259 (not c!93055)) b!878263))

(assert (= (or b!878255 b!878263) bm!38895))

(assert (= (and d!109161 res!596356) b!878258))

(assert (= (and b!878258 res!596354) b!878262))

(assert (= (and b!878262 res!596353) b!878257))

(assert (= (and b!878262 c!93056) b!878261))

(assert (= (and b!878262 (not c!93056)) b!878256))

(assert (= (and b!878261 res!596355) b!878265))

(assert (= (and b!878256 c!93054) b!878264))

(assert (= (and b!878256 (not c!93054)) b!878260))

(declare-fun b_lambda!12315 () Bool)

(assert (=> (not b_lambda!12315) (not b!878255)))

(assert (=> b!878255 t!24431))

(declare-fun b_and!25065 () Bool)

(assert (= b_and!25063 (and (=> t!24431 result!9493) b_and!25065)))

(declare-fun b_lambda!12317 () Bool)

(assert (=> (not b_lambda!12317) (not b!878265)))

(assert (=> b!878265 t!24431))

(declare-fun b_and!25067 () Bool)

(assert (= b_and!25065 (and (=> t!24431 result!9493) b_and!25067)))

(assert (=> b!878257 m!818249))

(assert (=> b!878257 m!818249))

(assert (=> b!878257 m!818251))

(declare-fun m!818819 () Bool)

(assert (=> b!878258 m!818819))

(declare-fun m!818821 () Bool)

(assert (=> b!878265 m!818821))

(assert (=> b!878265 m!817885))

(declare-fun m!818823 () Bool)

(assert (=> b!878265 m!818823))

(assert (=> b!878265 m!817885))

(assert (=> b!878265 m!818249))

(declare-fun m!818825 () Bool)

(assert (=> b!878265 m!818825))

(assert (=> b!878265 m!818249))

(assert (=> b!878265 m!818821))

(declare-fun m!818827 () Bool)

(assert (=> b!878255 m!818827))

(declare-fun m!818829 () Bool)

(assert (=> b!878255 m!818829))

(assert (=> b!878255 m!817885))

(assert (=> b!878255 m!818821))

(declare-fun m!818831 () Bool)

(assert (=> b!878255 m!818831))

(declare-fun m!818833 () Bool)

(assert (=> b!878255 m!818833))

(assert (=> b!878255 m!818821))

(assert (=> b!878255 m!817885))

(assert (=> b!878255 m!818823))

(assert (=> b!878255 m!818249))

(assert (=> b!878255 m!818831))

(declare-fun m!818835 () Bool)

(assert (=> bm!38895 m!818835))

(declare-fun m!818837 () Bool)

(assert (=> b!878260 m!818837))

(assert (=> b!878261 m!818249))

(assert (=> b!878261 m!818249))

(declare-fun m!818839 () Bool)

(assert (=> b!878261 m!818839))

(declare-fun m!818841 () Bool)

(assert (=> d!109161 m!818841))

(assert (=> d!109161 m!817911))

(assert (=> b!878259 m!818249))

(assert (=> b!878259 m!818249))

(assert (=> b!878259 m!818251))

(assert (=> b!878264 m!818835))

(assert (=> bm!38844 d!109161))

(declare-fun d!109163 () Bool)

(declare-fun e!488986 () Bool)

(assert (=> d!109163 e!488986))

(declare-fun res!596357 () Bool)

(assert (=> d!109163 (=> (not res!596357) (not e!488986))))

(declare-fun lt!397401 () ListLongMap!10289)

(assert (=> d!109163 (= res!596357 (contains!4226 lt!397401 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!397400 () List!17355)

(assert (=> d!109163 (= lt!397401 (ListLongMap!10290 lt!397400))))

(declare-fun lt!397402 () Unit!29960)

(declare-fun lt!397399 () Unit!29960)

(assert (=> d!109163 (= lt!397402 lt!397399)))

(assert (=> d!109163 (= (getValueByKey!420 lt!397400 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!425 (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109163 (= lt!397399 (lemmaContainsTupThenGetReturnValue!234 lt!397400 (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109163 (= lt!397400 (insertStrictlySorted!273 (toList!5160 call!38848) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!109163 (= (+!2505 call!38848 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!397401)))

(declare-fun b!878266 () Bool)

(declare-fun res!596358 () Bool)

(assert (=> b!878266 (=> (not res!596358) (not e!488986))))

(assert (=> b!878266 (= res!596358 (= (getValueByKey!420 (toList!5160 lt!397401) (_1!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!425 (_2!5770 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!878267 () Bool)

(assert (=> b!878267 (= e!488986 (contains!4227 (toList!5160 lt!397401) (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 lt!397049) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!109163 res!596357) b!878266))

(assert (= (and b!878266 res!596358) b!878267))

(declare-fun m!818843 () Bool)

(assert (=> d!109163 m!818843))

(declare-fun m!818845 () Bool)

(assert (=> d!109163 m!818845))

(declare-fun m!818847 () Bool)

(assert (=> d!109163 m!818847))

(declare-fun m!818849 () Bool)

(assert (=> d!109163 m!818849))

(declare-fun m!818851 () Bool)

(assert (=> b!878266 m!818851))

(declare-fun m!818853 () Bool)

(assert (=> b!878267 m!818853))

(assert (=> b!877815 d!109163))

(declare-fun d!109165 () Bool)

(assert (=> d!109165 (not (contains!4226 (+!2505 lt!397141 (tuple2!11519 lt!397142 lt!397138)) lt!397140))))

(declare-fun lt!397403 () Unit!29960)

(assert (=> d!109165 (= lt!397403 (choose!1439 lt!397141 lt!397142 lt!397138 lt!397140))))

(declare-fun e!488987 () Bool)

(assert (=> d!109165 e!488987))

(declare-fun res!596359 () Bool)

(assert (=> d!109165 (=> (not res!596359) (not e!488987))))

(assert (=> d!109165 (= res!596359 (not (contains!4226 lt!397141 lt!397140)))))

(assert (=> d!109165 (= (addStillNotContains!204 lt!397141 lt!397142 lt!397138 lt!397140) lt!397403)))

(declare-fun b!878268 () Bool)

(assert (=> b!878268 (= e!488987 (not (= lt!397142 lt!397140)))))

(assert (= (and d!109165 res!596359) b!878268))

(assert (=> d!109165 m!818065))

(assert (=> d!109165 m!818065))

(assert (=> d!109165 m!818067))

(declare-fun m!818855 () Bool)

(assert (=> d!109165 m!818855))

(declare-fun m!818857 () Bool)

(assert (=> d!109165 m!818857))

(assert (=> b!877815 d!109165))

(assert (=> b!877815 d!109129))

(declare-fun d!109167 () Bool)

(declare-fun e!488988 () Bool)

(assert (=> d!109167 e!488988))

(declare-fun res!596360 () Bool)

(assert (=> d!109167 (=> (not res!596360) (not e!488988))))

(declare-fun lt!397406 () ListLongMap!10289)

(assert (=> d!109167 (= res!596360 (contains!4226 lt!397406 (_1!5770 (tuple2!11519 lt!397142 lt!397138))))))

(declare-fun lt!397405 () List!17355)

(assert (=> d!109167 (= lt!397406 (ListLongMap!10290 lt!397405))))

(declare-fun lt!397407 () Unit!29960)

(declare-fun lt!397404 () Unit!29960)

(assert (=> d!109167 (= lt!397407 lt!397404)))

(assert (=> d!109167 (= (getValueByKey!420 lt!397405 (_1!5770 (tuple2!11519 lt!397142 lt!397138))) (Some!425 (_2!5770 (tuple2!11519 lt!397142 lt!397138))))))

(assert (=> d!109167 (= lt!397404 (lemmaContainsTupThenGetReturnValue!234 lt!397405 (_1!5770 (tuple2!11519 lt!397142 lt!397138)) (_2!5770 (tuple2!11519 lt!397142 lt!397138))))))

(assert (=> d!109167 (= lt!397405 (insertStrictlySorted!273 (toList!5160 lt!397141) (_1!5770 (tuple2!11519 lt!397142 lt!397138)) (_2!5770 (tuple2!11519 lt!397142 lt!397138))))))

(assert (=> d!109167 (= (+!2505 lt!397141 (tuple2!11519 lt!397142 lt!397138)) lt!397406)))

(declare-fun b!878269 () Bool)

(declare-fun res!596361 () Bool)

(assert (=> b!878269 (=> (not res!596361) (not e!488988))))

(assert (=> b!878269 (= res!596361 (= (getValueByKey!420 (toList!5160 lt!397406) (_1!5770 (tuple2!11519 lt!397142 lt!397138))) (Some!425 (_2!5770 (tuple2!11519 lt!397142 lt!397138)))))))

(declare-fun b!878270 () Bool)

(assert (=> b!878270 (= e!488988 (contains!4227 (toList!5160 lt!397406) (tuple2!11519 lt!397142 lt!397138)))))

(assert (= (and d!109167 res!596360) b!878269))

(assert (= (and b!878269 res!596361) b!878270))

(declare-fun m!818859 () Bool)

(assert (=> d!109167 m!818859))

(declare-fun m!818861 () Bool)

(assert (=> d!109167 m!818861))

(declare-fun m!818863 () Bool)

(assert (=> d!109167 m!818863))

(declare-fun m!818865 () Bool)

(assert (=> d!109167 m!818865))

(declare-fun m!818867 () Bool)

(assert (=> b!878269 m!818867))

(declare-fun m!818869 () Bool)

(assert (=> b!878270 m!818869))

(assert (=> b!877815 d!109167))

(declare-fun d!109169 () Bool)

(declare-fun e!488990 () Bool)

(assert (=> d!109169 e!488990))

(declare-fun res!596362 () Bool)

(assert (=> d!109169 (=> res!596362 e!488990)))

(declare-fun lt!397408 () Bool)

(assert (=> d!109169 (= res!596362 (not lt!397408))))

(declare-fun lt!397410 () Bool)

(assert (=> d!109169 (= lt!397408 lt!397410)))

(declare-fun lt!397411 () Unit!29960)

(declare-fun e!488989 () Unit!29960)

(assert (=> d!109169 (= lt!397411 e!488989)))

(declare-fun c!93058 () Bool)

(assert (=> d!109169 (= c!93058 lt!397410)))

(assert (=> d!109169 (= lt!397410 (containsKey!403 (toList!5160 (+!2505 lt!397141 (tuple2!11519 lt!397142 lt!397138))) lt!397140))))

(assert (=> d!109169 (= (contains!4226 (+!2505 lt!397141 (tuple2!11519 lt!397142 lt!397138)) lt!397140) lt!397408)))

(declare-fun b!878271 () Bool)

(declare-fun lt!397409 () Unit!29960)

(assert (=> b!878271 (= e!488989 lt!397409)))

(assert (=> b!878271 (= lt!397409 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 (+!2505 lt!397141 (tuple2!11519 lt!397142 lt!397138))) lt!397140))))

(assert (=> b!878271 (isDefined!313 (getValueByKey!420 (toList!5160 (+!2505 lt!397141 (tuple2!11519 lt!397142 lt!397138))) lt!397140))))

(declare-fun b!878272 () Bool)

(declare-fun Unit!29983 () Unit!29960)

(assert (=> b!878272 (= e!488989 Unit!29983)))

(declare-fun b!878273 () Bool)

(assert (=> b!878273 (= e!488990 (isDefined!313 (getValueByKey!420 (toList!5160 (+!2505 lt!397141 (tuple2!11519 lt!397142 lt!397138))) lt!397140)))))

(assert (= (and d!109169 c!93058) b!878271))

(assert (= (and d!109169 (not c!93058)) b!878272))

(assert (= (and d!109169 (not res!596362)) b!878273))

(declare-fun m!818871 () Bool)

(assert (=> d!109169 m!818871))

(declare-fun m!818873 () Bool)

(assert (=> b!878271 m!818873))

(declare-fun m!818875 () Bool)

(assert (=> b!878271 m!818875))

(assert (=> b!878271 m!818875))

(declare-fun m!818877 () Bool)

(assert (=> b!878271 m!818877))

(assert (=> b!878273 m!818875))

(assert (=> b!878273 m!818875))

(assert (=> b!878273 m!818877))

(assert (=> b!877815 d!109169))

(declare-fun b!878275 () Bool)

(declare-fun e!488991 () Option!426)

(declare-fun e!488992 () Option!426)

(assert (=> b!878275 (= e!488991 e!488992)))

(declare-fun c!93060 () Bool)

(assert (=> b!878275 (= c!93060 (and ((_ is Cons!17351) (toList!5160 lt!397175)) (not (= (_1!5770 (h!18488 (toList!5160 lt!397175))) (_1!5770 lt!397048)))))))

(declare-fun b!878276 () Bool)

(assert (=> b!878276 (= e!488992 (getValueByKey!420 (t!24432 (toList!5160 lt!397175)) (_1!5770 lt!397048)))))

(declare-fun b!878274 () Bool)

(assert (=> b!878274 (= e!488991 (Some!425 (_2!5770 (h!18488 (toList!5160 lt!397175)))))))

(declare-fun d!109171 () Bool)

(declare-fun c!93059 () Bool)

(assert (=> d!109171 (= c!93059 (and ((_ is Cons!17351) (toList!5160 lt!397175)) (= (_1!5770 (h!18488 (toList!5160 lt!397175))) (_1!5770 lt!397048))))))

(assert (=> d!109171 (= (getValueByKey!420 (toList!5160 lt!397175) (_1!5770 lt!397048)) e!488991)))

(declare-fun b!878277 () Bool)

(assert (=> b!878277 (= e!488992 None!424)))

(assert (= (and d!109171 c!93059) b!878274))

(assert (= (and d!109171 (not c!93059)) b!878275))

(assert (= (and b!878275 c!93060) b!878276))

(assert (= (and b!878275 (not c!93060)) b!878277))

(declare-fun m!818879 () Bool)

(assert (=> b!878276 m!818879))

(assert (=> b!877855 d!109171))

(assert (=> b!877812 d!109161))

(declare-fun d!109173 () Bool)

(declare-fun e!488994 () Bool)

(assert (=> d!109173 e!488994))

(declare-fun res!596363 () Bool)

(assert (=> d!109173 (=> res!596363 e!488994)))

(declare-fun lt!397412 () Bool)

(assert (=> d!109173 (= res!596363 (not lt!397412))))

(declare-fun lt!397414 () Bool)

(assert (=> d!109173 (= lt!397412 lt!397414)))

(declare-fun lt!397415 () Unit!29960)

(declare-fun e!488993 () Unit!29960)

(assert (=> d!109173 (= lt!397415 e!488993)))

(declare-fun c!93061 () Bool)

(assert (=> d!109173 (= c!93061 lt!397414)))

(assert (=> d!109173 (= lt!397414 (containsKey!403 (toList!5160 lt!397190) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109173 (= (contains!4226 lt!397190 #b1000000000000000000000000000000000000000000000000000000000000000) lt!397412)))

(declare-fun b!878278 () Bool)

(declare-fun lt!397413 () Unit!29960)

(assert (=> b!878278 (= e!488993 lt!397413)))

(assert (=> b!878278 (= lt!397413 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397190) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!878278 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397190) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!878279 () Bool)

(declare-fun Unit!29984 () Unit!29960)

(assert (=> b!878279 (= e!488993 Unit!29984)))

(declare-fun b!878280 () Bool)

(assert (=> b!878280 (= e!488994 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397190) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109173 c!93061) b!878278))

(assert (= (and d!109173 (not c!93061)) b!878279))

(assert (= (and d!109173 (not res!596363)) b!878280))

(declare-fun m!818881 () Bool)

(assert (=> d!109173 m!818881))

(declare-fun m!818883 () Bool)

(assert (=> b!878278 m!818883))

(declare-fun m!818885 () Bool)

(assert (=> b!878278 m!818885))

(assert (=> b!878278 m!818885))

(declare-fun m!818887 () Bool)

(assert (=> b!878278 m!818887))

(assert (=> b!878280 m!818885))

(assert (=> b!878280 m!818885))

(assert (=> b!878280 m!818887))

(assert (=> b!877875 d!109173))

(declare-fun d!109175 () Bool)

(declare-fun e!488996 () Bool)

(assert (=> d!109175 e!488996))

(declare-fun res!596364 () Bool)

(assert (=> d!109175 (=> res!596364 e!488996)))

(declare-fun lt!397416 () Bool)

(assert (=> d!109175 (= res!596364 (not lt!397416))))

(declare-fun lt!397418 () Bool)

(assert (=> d!109175 (= lt!397416 lt!397418)))

(declare-fun lt!397419 () Unit!29960)

(declare-fun e!488995 () Unit!29960)

(assert (=> d!109175 (= lt!397419 e!488995)))

(declare-fun c!93062 () Bool)

(assert (=> d!109175 (= c!93062 lt!397418)))

(assert (=> d!109175 (= lt!397418 (containsKey!403 (toList!5160 lt!397197) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109175 (= (contains!4226 lt!397197 #b0000000000000000000000000000000000000000000000000000000000000000) lt!397416)))

(declare-fun b!878281 () Bool)

(declare-fun lt!397417 () Unit!29960)

(assert (=> b!878281 (= e!488995 lt!397417)))

(assert (=> b!878281 (= lt!397417 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5160 lt!397197) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!878281 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397197) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!878282 () Bool)

(declare-fun Unit!29985 () Unit!29960)

(assert (=> b!878282 (= e!488995 Unit!29985)))

(declare-fun b!878283 () Bool)

(assert (=> b!878283 (= e!488996 (isDefined!313 (getValueByKey!420 (toList!5160 lt!397197) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109175 c!93062) b!878281))

(assert (= (and d!109175 (not c!93062)) b!878282))

(assert (= (and d!109175 (not res!596364)) b!878283))

(declare-fun m!818889 () Bool)

(assert (=> d!109175 m!818889))

(declare-fun m!818891 () Bool)

(assert (=> b!878281 m!818891))

(declare-fun m!818893 () Bool)

(assert (=> b!878281 m!818893))

(assert (=> b!878281 m!818893))

(declare-fun m!818895 () Bool)

(assert (=> b!878281 m!818895))

(assert (=> b!878283 m!818893))

(assert (=> b!878283 m!818893))

(assert (=> b!878283 m!818895))

(assert (=> d!108981 d!109175))

(assert (=> d!108981 d!108955))

(declare-fun b!878285 () Bool)

(declare-fun e!488997 () Option!426)

(declare-fun e!488998 () Option!426)

(assert (=> b!878285 (= e!488997 e!488998)))

(declare-fun c!93064 () Bool)

(assert (=> b!878285 (= c!93064 (and ((_ is Cons!17351) (toList!5160 lt!397179)) (not (= (_1!5770 (h!18488 (toList!5160 lt!397179))) (_1!5770 (tuple2!11519 k0!854 v!557))))))))

(declare-fun b!878286 () Bool)

(assert (=> b!878286 (= e!488998 (getValueByKey!420 (t!24432 (toList!5160 lt!397179)) (_1!5770 (tuple2!11519 k0!854 v!557))))))

(declare-fun b!878284 () Bool)

(assert (=> b!878284 (= e!488997 (Some!425 (_2!5770 (h!18488 (toList!5160 lt!397179)))))))

(declare-fun d!109177 () Bool)

(declare-fun c!93063 () Bool)

(assert (=> d!109177 (= c!93063 (and ((_ is Cons!17351) (toList!5160 lt!397179)) (= (_1!5770 (h!18488 (toList!5160 lt!397179))) (_1!5770 (tuple2!11519 k0!854 v!557)))))))

(assert (=> d!109177 (= (getValueByKey!420 (toList!5160 lt!397179) (_1!5770 (tuple2!11519 k0!854 v!557))) e!488997)))

(declare-fun b!878287 () Bool)

(assert (=> b!878287 (= e!488998 None!424)))

(assert (= (and d!109177 c!93063) b!878284))

(assert (= (and d!109177 (not c!93063)) b!878285))

(assert (= (and b!878285 c!93064) b!878286))

(assert (= (and b!878285 (not c!93064)) b!878287))

(declare-fun m!818897 () Bool)

(assert (=> b!878286 m!818897))

(assert (=> b!877857 d!109177))

(assert (=> b!877817 d!109035))

(declare-fun b!878288 () Bool)

(declare-fun e!488999 () ListLongMap!10289)

(assert (=> b!878288 (= e!488999 (ListLongMap!10290 Nil!17352))))

(declare-fun b!878289 () Bool)

(declare-fun lt!397421 () Unit!29960)

(declare-fun lt!397423 () Unit!29960)

(assert (=> b!878289 (= lt!397421 lt!397423)))

(declare-fun lt!397422 () V!28281)

(declare-fun lt!397424 () (_ BitVec 64))

(declare-fun lt!397426 () (_ BitVec 64))

(declare-fun lt!397425 () ListLongMap!10289)

(assert (=> b!878289 (not (contains!4226 (+!2505 lt!397425 (tuple2!11519 lt!397426 lt!397422)) lt!397424))))

(assert (=> b!878289 (= lt!397423 (addStillNotContains!204 lt!397425 lt!397426 lt!397422 lt!397424))))

(assert (=> b!878289 (= lt!397424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!878289 (= lt!397422 (get!12922 (select (arr!24533 (array!51022 (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24974 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!878289 (= lt!397426 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!38899 () ListLongMap!10289)

(assert (=> b!878289 (= lt!397425 call!38899)))

(declare-fun e!489004 () ListLongMap!10289)

(assert (=> b!878289 (= e!489004 (+!2505 call!38899 (tuple2!11519 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12922 (select (arr!24533 (array!51022 (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24974 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!878290 () Bool)

(declare-fun e!489003 () Bool)

(declare-fun e!489001 () Bool)

(assert (=> b!878290 (= e!489003 e!489001)))

(declare-fun c!93065 () Bool)

(assert (=> b!878290 (= c!93065 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(declare-fun b!878291 () Bool)

(declare-fun e!489000 () Bool)

(assert (=> b!878291 (= e!489000 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!878291 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!878292 () Bool)

(declare-fun res!596366 () Bool)

(declare-fun e!489002 () Bool)

(assert (=> b!878292 (=> (not res!596366) (not e!489002))))

(declare-fun lt!397420 () ListLongMap!10289)

(assert (=> b!878292 (= res!596366 (not (contains!4226 lt!397420 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!878293 () Bool)

(assert (=> b!878293 (= e!488999 e!489004)))

(declare-fun c!93066 () Bool)

(assert (=> b!878293 (= c!93066 (validKeyInArray!0 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!878294 () Bool)

(assert (=> b!878294 (= e!489001 (isEmpty!669 lt!397420))))

(declare-fun d!109179 () Bool)

(assert (=> d!109179 e!489002))

(declare-fun res!596368 () Bool)

(assert (=> d!109179 (=> (not res!596368) (not e!489002))))

(assert (=> d!109179 (= res!596368 (not (contains!4226 lt!397420 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109179 (= lt!397420 e!488999)))

(declare-fun c!93068 () Bool)

(assert (=> d!109179 (= c!93068 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(assert (=> d!109179 (validMask!0 mask!1196)))

(assert (=> d!109179 (= (getCurrentListMapNoExtraKeys!3202 _keys!868 (array!51022 (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24974 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397420)))

(declare-fun b!878295 () Bool)

(declare-fun e!489005 () Bool)

(assert (=> b!878295 (= e!489003 e!489005)))

(assert (=> b!878295 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(declare-fun res!596367 () Bool)

(assert (=> b!878295 (= res!596367 (contains!4226 lt!397420 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!878295 (=> (not res!596367) (not e!489005))))

(declare-fun b!878296 () Bool)

(assert (=> b!878296 (= e!489002 e!489003)))

(declare-fun c!93067 () Bool)

(assert (=> b!878296 (= c!93067 e!489000)))

(declare-fun res!596365 () Bool)

(assert (=> b!878296 (=> (not res!596365) (not e!489000))))

(assert (=> b!878296 (= res!596365 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(declare-fun b!878297 () Bool)

(assert (=> b!878297 (= e!489004 call!38899)))

(declare-fun b!878298 () Bool)

(assert (=> b!878298 (= e!489001 (= lt!397420 (getCurrentListMapNoExtraKeys!3202 _keys!868 (array!51022 (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24974 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!878299 () Bool)

(assert (=> b!878299 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24973 _keys!868)))))

(assert (=> b!878299 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24974 (array!51022 (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24974 _values!688)))))))

(assert (=> b!878299 (= e!489005 (= (apply!377 lt!397420 (select (arr!24532 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12922 (select (arr!24533 (array!51022 (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24974 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38896 () Bool)

(assert (=> bm!38896 (= call!38899 (getCurrentListMapNoExtraKeys!3202 _keys!868 (array!51022 (store (arr!24533 _values!688) i!612 (ValueCellFull!8273 v!557)) (size!24974 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!109179 c!93068) b!878288))

(assert (= (and d!109179 (not c!93068)) b!878293))

(assert (= (and b!878293 c!93066) b!878289))

(assert (= (and b!878293 (not c!93066)) b!878297))

(assert (= (or b!878289 b!878297) bm!38896))

(assert (= (and d!109179 res!596368) b!878292))

(assert (= (and b!878292 res!596366) b!878296))

(assert (= (and b!878296 res!596365) b!878291))

(assert (= (and b!878296 c!93067) b!878295))

(assert (= (and b!878296 (not c!93067)) b!878290))

(assert (= (and b!878295 res!596367) b!878299))

(assert (= (and b!878290 c!93065) b!878298))

(assert (= (and b!878290 (not c!93065)) b!878294))

(declare-fun b_lambda!12319 () Bool)

(assert (=> (not b_lambda!12319) (not b!878289)))

(assert (=> b!878289 t!24431))

(declare-fun b_and!25069 () Bool)

(assert (= b_and!25067 (and (=> t!24431 result!9493) b_and!25069)))

(declare-fun b_lambda!12321 () Bool)

(assert (=> (not b_lambda!12321) (not b!878299)))

(assert (=> b!878299 t!24431))

(declare-fun b_and!25071 () Bool)

(assert (= b_and!25069 (and (=> t!24431 result!9493) b_and!25071)))

(assert (=> b!878291 m!818025))

(assert (=> b!878291 m!818025))

(assert (=> b!878291 m!818027))

(declare-fun m!818899 () Bool)

(assert (=> b!878292 m!818899))

(declare-fun m!818901 () Bool)

(assert (=> b!878299 m!818901))

(assert (=> b!878299 m!817885))

(declare-fun m!818903 () Bool)

(assert (=> b!878299 m!818903))

(assert (=> b!878299 m!817885))

(assert (=> b!878299 m!818025))

(declare-fun m!818905 () Bool)

(assert (=> b!878299 m!818905))

(assert (=> b!878299 m!818025))

(assert (=> b!878299 m!818901))

(declare-fun m!818907 () Bool)

(assert (=> b!878289 m!818907))

(declare-fun m!818909 () Bool)

(assert (=> b!878289 m!818909))

(assert (=> b!878289 m!817885))

(assert (=> b!878289 m!818901))

(declare-fun m!818911 () Bool)

(assert (=> b!878289 m!818911))

(declare-fun m!818913 () Bool)

(assert (=> b!878289 m!818913))

(assert (=> b!878289 m!818901))

(assert (=> b!878289 m!817885))

(assert (=> b!878289 m!818903))

(assert (=> b!878289 m!818025))

(assert (=> b!878289 m!818911))

(declare-fun m!818915 () Bool)

(assert (=> bm!38896 m!818915))

(declare-fun m!818917 () Bool)

(assert (=> b!878294 m!818917))

(assert (=> b!878295 m!818025))

(assert (=> b!878295 m!818025))

(declare-fun m!818919 () Bool)

(assert (=> b!878295 m!818919))

(declare-fun m!818921 () Bool)

(assert (=> d!109179 m!818921))

(assert (=> d!109179 m!817911))

(assert (=> b!878293 m!818025))

(assert (=> b!878293 m!818025))

(assert (=> b!878293 m!818027))

(assert (=> b!878298 m!818915))

(assert (=> bm!38850 d!109179))

(declare-fun b!878300 () Bool)

(declare-fun e!489007 () Bool)

(assert (=> b!878300 (= e!489007 tp_is_empty!17425)))

(declare-fun mapIsEmpty!27759 () Bool)

(declare-fun mapRes!27759 () Bool)

(assert (=> mapIsEmpty!27759 mapRes!27759))

(declare-fun condMapEmpty!27759 () Bool)

(declare-fun mapDefault!27759 () ValueCell!8273)

(assert (=> mapNonEmpty!27758 (= condMapEmpty!27759 (= mapRest!27758 ((as const (Array (_ BitVec 32) ValueCell!8273)) mapDefault!27759)))))

(declare-fun e!489006 () Bool)

(assert (=> mapNonEmpty!27758 (= tp!53237 (and e!489006 mapRes!27759))))

(declare-fun b!878301 () Bool)

(assert (=> b!878301 (= e!489006 tp_is_empty!17425)))

(declare-fun mapNonEmpty!27759 () Bool)

(declare-fun tp!53238 () Bool)

(assert (=> mapNonEmpty!27759 (= mapRes!27759 (and tp!53238 e!489007))))

(declare-fun mapValue!27759 () ValueCell!8273)

(declare-fun mapRest!27759 () (Array (_ BitVec 32) ValueCell!8273))

(declare-fun mapKey!27759 () (_ BitVec 32))

(assert (=> mapNonEmpty!27759 (= mapRest!27758 (store mapRest!27759 mapKey!27759 mapValue!27759))))

(assert (= (and mapNonEmpty!27758 condMapEmpty!27759) mapIsEmpty!27759))

(assert (= (and mapNonEmpty!27758 (not condMapEmpty!27759)) mapNonEmpty!27759))

(assert (= (and mapNonEmpty!27759 ((_ is ValueCellFull!8273) mapValue!27759)) b!878300))

(assert (= (and mapNonEmpty!27758 ((_ is ValueCellFull!8273) mapDefault!27759)) b!878301))

(declare-fun m!818923 () Bool)

(assert (=> mapNonEmpty!27759 m!818923))

(declare-fun b_lambda!12323 () Bool)

(assert (= b_lambda!12311 (or (and start!74606 b_free!15181) b_lambda!12323)))

(declare-fun b_lambda!12325 () Bool)

(assert (= b_lambda!12305 (or (and start!74606 b_free!15181) b_lambda!12325)))

(declare-fun b_lambda!12327 () Bool)

(assert (= b_lambda!12307 (or (and start!74606 b_free!15181) b_lambda!12327)))

(declare-fun b_lambda!12329 () Bool)

(assert (= b_lambda!12315 (or (and start!74606 b_free!15181) b_lambda!12329)))

(declare-fun b_lambda!12331 () Bool)

(assert (= b_lambda!12317 (or (and start!74606 b_free!15181) b_lambda!12331)))

(declare-fun b_lambda!12333 () Bool)

(assert (= b_lambda!12309 (or (and start!74606 b_free!15181) b_lambda!12333)))

(declare-fun b_lambda!12335 () Bool)

(assert (= b_lambda!12313 (or (and start!74606 b_free!15181) b_lambda!12335)))

(declare-fun b_lambda!12337 () Bool)

(assert (= b_lambda!12303 (or (and start!74606 b_free!15181) b_lambda!12337)))

(declare-fun b_lambda!12339 () Bool)

(assert (= b_lambda!12321 (or (and start!74606 b_free!15181) b_lambda!12339)))

(declare-fun b_lambda!12341 () Bool)

(assert (= b_lambda!12319 (or (and start!74606 b_free!15181) b_lambda!12341)))

(check-sat (not b!878197) (not b_lambda!12337) (not b!878158) (not d!109165) (not b!878024) (not b!878027) (not d!109133) (not b!878269) (not d!109069) (not b!878276) (not b!877963) (not b!878179) (not b!878175) (not b!878235) (not d!109051) (not b!878129) (not b!878018) (not b!878152) (not b!878194) (not b!877959) (not b!878079) (not b!878228) (not d!109031) (not bm!38878) (not b!878182) (not b!878227) (not d!109091) (not b!878249) (not d!108993) (not b!878150) (not b!877961) (not bm!38893) (not d!109163) (not b!878046) (not b!877937) (not b!878083) (not b!878092) (not b!878025) (not b!878143) (not b!878136) (not d!109007) (not d!109087) (not b!878063) (not b!877944) (not d!109109) (not d!109097) (not d!109105) (not b!878178) (not b!878108) (not b!878180) (not d!109059) (not b!877938) (not b!878167) (not b!878223) (not b!878164) (not d!109119) (not d!109009) (not b!878283) (not b_lambda!12291) (not b!878117) (not b!878036) (not b!878230) (not b_lambda!12329) (not d!109159) (not b!878003) (not b_lambda!12327) (not b!878123) (not b!877943) (not b!878121) (not b!878289) (not b!878146) (not b!878191) (not b!877936) (not b!878236) (not b!878293) (not d!109115) (not b_lambda!12339) (not d!109015) (not b!878019) (not b!878139) (not b!878219) (not b!878173) (not d!109121) (not d!109089) (not b!878159) (not b!878266) (not b!877972) (not b!878045) (not d!109043) tp_is_empty!17425 (not d!109147) (not d!108989) (not b!877996) (not b!878174) (not b!878264) (not b!878222) (not b!878160) (not d!108999) (not b!878126) (not bm!38889) (not b!878172) (not d!109179) (not b!877955) (not b_lambda!12335) (not b!878239) (not bm!38886) (not b!878294) (not b!878048) (not b!878255) (not b!878021) (not b!877926) (not b_lambda!12269) (not b!878104) (not b!878156) (not b!878118) (not b!878221) (not b!878246) (not b!878155) (not b!877940) (not b!878149) (not bm!38891) (not b_lambda!12325) (not bm!38868) (not bm!38887) (not b!878162) (not b!878132) (not d!109095) (not d!109107) (not b!878253) (not d!109117) (not b!878212) (not b!878271) (not b!878292) (not d!109127) (not b!878000) (not b!878171) (not d!109023) (not b!878016) (not b!878112) (not b!878243) (not d!109077) (not b_lambda!12301) (not b!878295) (not b!878257) (not b!877924) (not d!109083) (not b!878259) (not b_lambda!12333) (not b!878291) (not b_lambda!12323) (not b!878196) (not b_lambda!12299) (not d!109013) (not b!878102) (not b!878053) (not b!878204) (not d!109073) (not d!109143) (not b!878043) (not b!878273) (not d!109153) (not b!878278) (not b!878181) (not d!109173) (not b!878215) (not b!878093) (not b!878044) (not b_lambda!12341) (not d!109103) (not bm!38883) (not b!878154) (not b!877934) (not d!109123) (not b!878115) (not b!878217) (not d!109071) (not b!878169) (not b!878270) (not d!109125) (not bm!38895) (not d!109061) (not b!877973) (not b!878267) (not b!878099) (not b!878094) (not b!878183) (not b!878012) (not b!878096) (not d!109113) b_and!25071 (not b!878033) (not b!878261) (not b!878144) (not b!878040) (not b!878208) (not d!109145) (not d!109135) (not b_next!15181) (not d!109161) (not b!878205) (not b_lambda!12293) (not b!878189) (not bm!38877) (not b!878233) (not b!878017) (not b!878057) (not d!109065) (not b!878187) (not d!109175) (not b!878226) (not d!109049) (not b!878202) (not b!878088) (not d!109131) (not d!109085) (not d!109045) (not b!878022) (not b!877939) (not b!878251) (not b!878220) (not d!109039) (not b!878298) (not d!109029) (not d!108991) (not d!108985) (not b!878193) (not b!878090) (not bm!38860) (not b!878030) (not b_lambda!12289) (not b!878055) (not d!109063) (not b!878185) (not b!878140) (not b!878190) (not b!877932) (not b!878097) (not b!878105) (not b!878120) (not d!109057) (not b!878082) (not b!878299) (not b!878161) (not d!109151) (not b_lambda!12287) (not d!109139) (not d!109019) (not d!109005) (not bm!38885) (not d!109055) (not b!878265) (not d!109141) (not b_lambda!12331) (not b_lambda!12297) (not mapNonEmpty!27759) (not d!109027) (not b!878014) (not b!878260) (not d!109001) (not bm!38871) (not b!878128) (not b!878032) (not b!877966) (not b!878199) (not b!878157) (not b!878142) (not bm!38896) (not b!878148) (not d!109167) (not b_lambda!12295) (not b!878286) (not d!109021) (not b!878009) (not bm!38880) (not b!878281) (not b!878089) (not d!109169) (not d!109079) (not b!878280) (not b!878258) (not d!109093))
(check-sat b_and!25071 (not b_next!15181))
