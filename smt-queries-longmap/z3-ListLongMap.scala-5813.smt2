; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75118 () Bool)

(assert start!75118)

(declare-fun b_free!15469 () Bool)

(declare-fun b_next!15469 () Bool)

(assert (=> start!75118 (= b_free!15469 (not b_next!15469))))

(declare-fun tp!54110 () Bool)

(declare-fun b_and!25647 () Bool)

(assert (=> start!75118 (= tp!54110 b_and!25647)))

(declare-fun b!885136 () Bool)

(declare-datatypes ((Unit!30174 0))(
  ( (Unit!30175) )
))
(declare-fun e!492666 () Unit!30174)

(declare-fun Unit!30176 () Unit!30174)

(assert (=> b!885136 (= e!492666 Unit!30176)))

(declare-fun lt!400856 () Unit!30174)

(declare-datatypes ((array!51591 0))(
  ( (array!51592 (arr!24810 (Array (_ BitVec 32) (_ BitVec 64))) (size!25251 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51591)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51591 (_ BitVec 32) (_ BitVec 32)) Unit!30174)

(assert (=> b!885136 (= lt!400856 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17570 0))(
  ( (Nil!17567) (Cons!17566 (h!18703 (_ BitVec 64)) (t!24833 List!17570)) )
))
(declare-fun arrayNoDuplicates!0 (array!51591 (_ BitVec 32) List!17570) Bool)

(assert (=> b!885136 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17567)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!400853 () Unit!30174)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51591 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30174)

(assert (=> b!885136 (= lt!400853 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!885136 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400855 () Unit!30174)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51591 (_ BitVec 64) (_ BitVec 32) List!17570) Unit!30174)

(assert (=> b!885136 (= lt!400855 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17567))))

(assert (=> b!885136 false))

(declare-fun b!885137 () Bool)

(declare-fun e!492663 () Bool)

(declare-fun e!492662 () Bool)

(assert (=> b!885137 (= e!492663 e!492662)))

(declare-fun res!601058 () Bool)

(assert (=> b!885137 (=> (not res!601058) (not e!492662))))

(assert (=> b!885137 (= res!601058 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28665 0))(
  ( (V!28666 (val!8904 Int)) )
))
(declare-datatypes ((ValueCell!8417 0))(
  ( (ValueCellFull!8417 (v!11373 V!28665)) (EmptyCell!8417) )
))
(declare-datatypes ((array!51593 0))(
  ( (array!51594 (arr!24811 (Array (_ BitVec 32) ValueCell!8417)) (size!25252 (_ BitVec 32))) )
))
(declare-fun lt!400851 () array!51593)

(declare-fun minValue!654 () V!28665)

(declare-fun zeroValue!654 () V!28665)

(declare-datatypes ((tuple2!11738 0))(
  ( (tuple2!11739 (_1!5880 (_ BitVec 64)) (_2!5880 V!28665)) )
))
(declare-datatypes ((List!17571 0))(
  ( (Nil!17568) (Cons!17567 (h!18704 tuple2!11738) (t!24834 List!17571)) )
))
(declare-datatypes ((ListLongMap!10509 0))(
  ( (ListLongMap!10510 (toList!5270 List!17571)) )
))
(declare-fun lt!400860 () ListLongMap!10509)

(declare-fun getCurrentListMapNoExtraKeys!3306 (array!51591 array!51593 (_ BitVec 32) (_ BitVec 32) V!28665 V!28665 (_ BitVec 32) Int) ListLongMap!10509)

(assert (=> b!885137 (= lt!400860 (getCurrentListMapNoExtraKeys!3306 _keys!868 lt!400851 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28665)

(declare-fun _values!688 () array!51593)

(assert (=> b!885137 (= lt!400851 (array!51594 (store (arr!24811 _values!688) i!612 (ValueCellFull!8417 v!557)) (size!25252 _values!688)))))

(declare-fun lt!400849 () ListLongMap!10509)

(assert (=> b!885137 (= lt!400849 (getCurrentListMapNoExtraKeys!3306 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!885138 () Bool)

(declare-fun res!601057 () Bool)

(assert (=> b!885138 (=> (not res!601057) (not e!492663))))

(assert (=> b!885138 (= res!601057 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17567))))

(declare-fun mapNonEmpty!28206 () Bool)

(declare-fun mapRes!28206 () Bool)

(declare-fun tp!54111 () Bool)

(declare-fun e!492669 () Bool)

(assert (=> mapNonEmpty!28206 (= mapRes!28206 (and tp!54111 e!492669))))

(declare-fun mapRest!28206 () (Array (_ BitVec 32) ValueCell!8417))

(declare-fun mapValue!28206 () ValueCell!8417)

(declare-fun mapKey!28206 () (_ BitVec 32))

(assert (=> mapNonEmpty!28206 (= (arr!24811 _values!688) (store mapRest!28206 mapKey!28206 mapValue!28206))))

(declare-fun b!885139 () Bool)

(declare-fun res!601048 () Bool)

(assert (=> b!885139 (=> (not res!601048) (not e!492663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51591 (_ BitVec 32)) Bool)

(assert (=> b!885139 (= res!601048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!885140 () Bool)

(declare-fun tp_is_empty!17713 () Bool)

(assert (=> b!885140 (= e!492669 tp_is_empty!17713)))

(declare-fun res!601050 () Bool)

(assert (=> start!75118 (=> (not res!601050) (not e!492663))))

(assert (=> start!75118 (= res!601050 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25251 _keys!868))))))

(assert (=> start!75118 e!492663))

(assert (=> start!75118 tp_is_empty!17713))

(assert (=> start!75118 true))

(assert (=> start!75118 tp!54110))

(declare-fun array_inv!19570 (array!51591) Bool)

(assert (=> start!75118 (array_inv!19570 _keys!868)))

(declare-fun e!492668 () Bool)

(declare-fun array_inv!19571 (array!51593) Bool)

(assert (=> start!75118 (and (array_inv!19571 _values!688) e!492668)))

(declare-fun b!885141 () Bool)

(declare-fun e!492661 () Bool)

(assert (=> b!885141 (= e!492662 (not e!492661))))

(declare-fun res!601056 () Bool)

(assert (=> b!885141 (=> res!601056 e!492661)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!885141 (= res!601056 (not (validKeyInArray!0 (select (arr!24810 _keys!868) from!1053))))))

(declare-fun lt!400857 () ListLongMap!10509)

(declare-fun lt!400854 () ListLongMap!10509)

(assert (=> b!885141 (= lt!400857 lt!400854)))

(declare-fun lt!400861 () ListLongMap!10509)

(declare-fun lt!400848 () tuple2!11738)

(declare-fun +!2582 (ListLongMap!10509 tuple2!11738) ListLongMap!10509)

(assert (=> b!885141 (= lt!400854 (+!2582 lt!400861 lt!400848))))

(assert (=> b!885141 (= lt!400857 (getCurrentListMapNoExtraKeys!3306 _keys!868 lt!400851 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!885141 (= lt!400848 (tuple2!11739 k0!854 v!557))))

(assert (=> b!885141 (= lt!400861 (getCurrentListMapNoExtraKeys!3306 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400863 () Unit!30174)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!743 (array!51591 array!51593 (_ BitVec 32) (_ BitVec 32) V!28665 V!28665 (_ BitVec 32) (_ BitVec 64) V!28665 (_ BitVec 32) Int) Unit!30174)

(assert (=> b!885141 (= lt!400863 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!743 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!885142 () Bool)

(declare-fun res!601052 () Bool)

(assert (=> b!885142 (=> (not res!601052) (not e!492663))))

(assert (=> b!885142 (= res!601052 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25251 _keys!868))))))

(declare-fun b!885143 () Bool)

(declare-fun e!492667 () Bool)

(assert (=> b!885143 (= e!492661 e!492667)))

(declare-fun res!601055 () Bool)

(assert (=> b!885143 (=> res!601055 e!492667)))

(assert (=> b!885143 (= res!601055 (= k0!854 (select (arr!24810 _keys!868) from!1053)))))

(assert (=> b!885143 (not (= (select (arr!24810 _keys!868) from!1053) k0!854))))

(declare-fun lt!400862 () Unit!30174)

(assert (=> b!885143 (= lt!400862 e!492666)))

(declare-fun c!93391 () Bool)

(assert (=> b!885143 (= c!93391 (= (select (arr!24810 _keys!868) from!1053) k0!854))))

(declare-fun lt!400850 () ListLongMap!10509)

(assert (=> b!885143 (= lt!400860 lt!400850)))

(declare-fun lt!400858 () tuple2!11738)

(assert (=> b!885143 (= lt!400850 (+!2582 lt!400854 lt!400858))))

(declare-fun lt!400852 () V!28665)

(assert (=> b!885143 (= lt!400858 (tuple2!11739 (select (arr!24810 _keys!868) from!1053) lt!400852))))

(declare-fun get!13094 (ValueCell!8417 V!28665) V!28665)

(declare-fun dynLambda!1299 (Int (_ BitVec 64)) V!28665)

(assert (=> b!885143 (= lt!400852 (get!13094 (select (arr!24811 _values!688) from!1053) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!885144 () Bool)

(declare-fun Unit!30177 () Unit!30174)

(assert (=> b!885144 (= e!492666 Unit!30177)))

(declare-fun b!885145 () Bool)

(assert (=> b!885145 (= e!492667 (= lt!400860 (+!2582 lt!400849 lt!400848)))))

(assert (=> b!885145 (= lt!400850 (+!2582 (+!2582 lt!400861 lt!400858) lt!400848))))

(declare-fun lt!400859 () Unit!30174)

(declare-fun addCommutativeForDiffKeys!548 (ListLongMap!10509 (_ BitVec 64) V!28665 (_ BitVec 64) V!28665) Unit!30174)

(assert (=> b!885145 (= lt!400859 (addCommutativeForDiffKeys!548 lt!400861 k0!854 v!557 (select (arr!24810 _keys!868) from!1053) lt!400852))))

(declare-fun mapIsEmpty!28206 () Bool)

(assert (=> mapIsEmpty!28206 mapRes!28206))

(declare-fun b!885146 () Bool)

(declare-fun e!492664 () Bool)

(assert (=> b!885146 (= e!492668 (and e!492664 mapRes!28206))))

(declare-fun condMapEmpty!28206 () Bool)

(declare-fun mapDefault!28206 () ValueCell!8417)

(assert (=> b!885146 (= condMapEmpty!28206 (= (arr!24811 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8417)) mapDefault!28206)))))

(declare-fun b!885147 () Bool)

(declare-fun res!601049 () Bool)

(assert (=> b!885147 (=> (not res!601049) (not e!492663))))

(assert (=> b!885147 (= res!601049 (validKeyInArray!0 k0!854))))

(declare-fun b!885148 () Bool)

(declare-fun res!601051 () Bool)

(assert (=> b!885148 (=> (not res!601051) (not e!492663))))

(assert (=> b!885148 (= res!601051 (and (= (size!25252 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25251 _keys!868) (size!25252 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!885149 () Bool)

(assert (=> b!885149 (= e!492664 tp_is_empty!17713)))

(declare-fun b!885150 () Bool)

(declare-fun res!601054 () Bool)

(assert (=> b!885150 (=> (not res!601054) (not e!492663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!885150 (= res!601054 (validMask!0 mask!1196))))

(declare-fun b!885151 () Bool)

(declare-fun res!601053 () Bool)

(assert (=> b!885151 (=> (not res!601053) (not e!492663))))

(assert (=> b!885151 (= res!601053 (and (= (select (arr!24810 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!75118 res!601050) b!885150))

(assert (= (and b!885150 res!601054) b!885148))

(assert (= (and b!885148 res!601051) b!885139))

(assert (= (and b!885139 res!601048) b!885138))

(assert (= (and b!885138 res!601057) b!885142))

(assert (= (and b!885142 res!601052) b!885147))

(assert (= (and b!885147 res!601049) b!885151))

(assert (= (and b!885151 res!601053) b!885137))

(assert (= (and b!885137 res!601058) b!885141))

(assert (= (and b!885141 (not res!601056)) b!885143))

(assert (= (and b!885143 c!93391) b!885136))

(assert (= (and b!885143 (not c!93391)) b!885144))

(assert (= (and b!885143 (not res!601055)) b!885145))

(assert (= (and b!885146 condMapEmpty!28206) mapIsEmpty!28206))

(assert (= (and b!885146 (not condMapEmpty!28206)) mapNonEmpty!28206))

(get-info :version)

(assert (= (and mapNonEmpty!28206 ((_ is ValueCellFull!8417) mapValue!28206)) b!885140))

(assert (= (and b!885146 ((_ is ValueCellFull!8417) mapDefault!28206)) b!885149))

(assert (= start!75118 b!885146))

(declare-fun b_lambda!12761 () Bool)

(assert (=> (not b_lambda!12761) (not b!885143)))

(declare-fun t!24832 () Bool)

(declare-fun tb!5119 () Bool)

(assert (=> (and start!75118 (= defaultEntry!696 defaultEntry!696) t!24832) tb!5119))

(declare-fun result!9881 () Bool)

(assert (=> tb!5119 (= result!9881 tp_is_empty!17713)))

(assert (=> b!885143 t!24832))

(declare-fun b_and!25649 () Bool)

(assert (= b_and!25647 (and (=> t!24832 result!9881) b_and!25649)))

(declare-fun m!825687 () Bool)

(assert (=> b!885139 m!825687))

(declare-fun m!825689 () Bool)

(assert (=> b!885145 m!825689))

(declare-fun m!825691 () Bool)

(assert (=> b!885145 m!825691))

(declare-fun m!825693 () Bool)

(assert (=> b!885145 m!825693))

(assert (=> b!885145 m!825691))

(declare-fun m!825695 () Bool)

(assert (=> b!885145 m!825695))

(declare-fun m!825697 () Bool)

(assert (=> b!885145 m!825697))

(assert (=> b!885145 m!825695))

(declare-fun m!825699 () Bool)

(assert (=> b!885143 m!825699))

(declare-fun m!825701 () Bool)

(assert (=> b!885143 m!825701))

(declare-fun m!825703 () Bool)

(assert (=> b!885143 m!825703))

(declare-fun m!825705 () Bool)

(assert (=> b!885143 m!825705))

(assert (=> b!885143 m!825701))

(assert (=> b!885143 m!825695))

(assert (=> b!885143 m!825703))

(declare-fun m!825707 () Bool)

(assert (=> b!885137 m!825707))

(declare-fun m!825709 () Bool)

(assert (=> b!885137 m!825709))

(declare-fun m!825711 () Bool)

(assert (=> b!885137 m!825711))

(declare-fun m!825713 () Bool)

(assert (=> b!885147 m!825713))

(declare-fun m!825715 () Bool)

(assert (=> b!885151 m!825715))

(declare-fun m!825717 () Bool)

(assert (=> start!75118 m!825717))

(declare-fun m!825719 () Bool)

(assert (=> start!75118 m!825719))

(declare-fun m!825721 () Bool)

(assert (=> b!885136 m!825721))

(declare-fun m!825723 () Bool)

(assert (=> b!885136 m!825723))

(declare-fun m!825725 () Bool)

(assert (=> b!885136 m!825725))

(declare-fun m!825727 () Bool)

(assert (=> b!885136 m!825727))

(declare-fun m!825729 () Bool)

(assert (=> b!885136 m!825729))

(declare-fun m!825731 () Bool)

(assert (=> b!885141 m!825731))

(declare-fun m!825733 () Bool)

(assert (=> b!885141 m!825733))

(declare-fun m!825735 () Bool)

(assert (=> b!885141 m!825735))

(assert (=> b!885141 m!825695))

(declare-fun m!825737 () Bool)

(assert (=> b!885141 m!825737))

(assert (=> b!885141 m!825695))

(declare-fun m!825739 () Bool)

(assert (=> b!885141 m!825739))

(declare-fun m!825741 () Bool)

(assert (=> mapNonEmpty!28206 m!825741))

(declare-fun m!825743 () Bool)

(assert (=> b!885150 m!825743))

(declare-fun m!825745 () Bool)

(assert (=> b!885138 m!825745))

(check-sat (not b_next!15469) (not b!885141) tp_is_empty!17713 (not b!885137) (not b!885143) (not b!885138) b_and!25649 (not b!885136) (not b!885147) (not start!75118) (not mapNonEmpty!28206) (not b!885139) (not b_lambda!12761) (not b!885145) (not b!885150))
(check-sat b_and!25649 (not b_next!15469))
(get-model)

(declare-fun b_lambda!12767 () Bool)

(assert (= b_lambda!12761 (or (and start!75118 b_free!15469) b_lambda!12767)))

(check-sat (not b_next!15469) (not b!885141) tp_is_empty!17713 (not b!885139) (not b!885137) (not b!885143) (not b_lambda!12767) (not b!885138) b_and!25649 (not b!885136) (not b!885147) (not start!75118) (not mapNonEmpty!28206) (not b!885145) (not b!885150))
(check-sat b_and!25649 (not b_next!15469))
(get-model)

(declare-fun d!109529 () Bool)

(declare-fun e!492726 () Bool)

(assert (=> d!109529 e!492726))

(declare-fun res!601130 () Bool)

(assert (=> d!109529 (=> (not res!601130) (not e!492726))))

(declare-fun lt!400968 () ListLongMap!10509)

(declare-fun contains!4257 (ListLongMap!10509 (_ BitVec 64)) Bool)

(assert (=> d!109529 (= res!601130 (contains!4257 lt!400968 (_1!5880 lt!400848)))))

(declare-fun lt!400969 () List!17571)

(assert (=> d!109529 (= lt!400968 (ListLongMap!10510 lt!400969))))

(declare-fun lt!400971 () Unit!30174)

(declare-fun lt!400970 () Unit!30174)

(assert (=> d!109529 (= lt!400971 lt!400970)))

(declare-datatypes ((Option!434 0))(
  ( (Some!433 (v!11379 V!28665)) (None!432) )
))
(declare-fun getValueByKey!428 (List!17571 (_ BitVec 64)) Option!434)

(assert (=> d!109529 (= (getValueByKey!428 lt!400969 (_1!5880 lt!400848)) (Some!433 (_2!5880 lt!400848)))))

(declare-fun lemmaContainsTupThenGetReturnValue!242 (List!17571 (_ BitVec 64) V!28665) Unit!30174)

(assert (=> d!109529 (= lt!400970 (lemmaContainsTupThenGetReturnValue!242 lt!400969 (_1!5880 lt!400848) (_2!5880 lt!400848)))))

(declare-fun insertStrictlySorted!281 (List!17571 (_ BitVec 64) V!28665) List!17571)

(assert (=> d!109529 (= lt!400969 (insertStrictlySorted!281 (toList!5270 lt!400849) (_1!5880 lt!400848) (_2!5880 lt!400848)))))

(assert (=> d!109529 (= (+!2582 lt!400849 lt!400848) lt!400968)))

(declare-fun b!885258 () Bool)

(declare-fun res!601129 () Bool)

(assert (=> b!885258 (=> (not res!601129) (not e!492726))))

(assert (=> b!885258 (= res!601129 (= (getValueByKey!428 (toList!5270 lt!400968) (_1!5880 lt!400848)) (Some!433 (_2!5880 lt!400848))))))

(declare-fun b!885259 () Bool)

(declare-fun contains!4258 (List!17571 tuple2!11738) Bool)

(assert (=> b!885259 (= e!492726 (contains!4258 (toList!5270 lt!400968) lt!400848))))

(assert (= (and d!109529 res!601130) b!885258))

(assert (= (and b!885258 res!601129) b!885259))

(declare-fun m!825867 () Bool)

(assert (=> d!109529 m!825867))

(declare-fun m!825869 () Bool)

(assert (=> d!109529 m!825869))

(declare-fun m!825871 () Bool)

(assert (=> d!109529 m!825871))

(declare-fun m!825873 () Bool)

(assert (=> d!109529 m!825873))

(declare-fun m!825875 () Bool)

(assert (=> b!885258 m!825875))

(declare-fun m!825877 () Bool)

(assert (=> b!885259 m!825877))

(assert (=> b!885145 d!109529))

(declare-fun d!109531 () Bool)

(declare-fun e!492727 () Bool)

(assert (=> d!109531 e!492727))

(declare-fun res!601132 () Bool)

(assert (=> d!109531 (=> (not res!601132) (not e!492727))))

(declare-fun lt!400972 () ListLongMap!10509)

(assert (=> d!109531 (= res!601132 (contains!4257 lt!400972 (_1!5880 lt!400848)))))

(declare-fun lt!400973 () List!17571)

(assert (=> d!109531 (= lt!400972 (ListLongMap!10510 lt!400973))))

(declare-fun lt!400975 () Unit!30174)

(declare-fun lt!400974 () Unit!30174)

(assert (=> d!109531 (= lt!400975 lt!400974)))

(assert (=> d!109531 (= (getValueByKey!428 lt!400973 (_1!5880 lt!400848)) (Some!433 (_2!5880 lt!400848)))))

(assert (=> d!109531 (= lt!400974 (lemmaContainsTupThenGetReturnValue!242 lt!400973 (_1!5880 lt!400848) (_2!5880 lt!400848)))))

(assert (=> d!109531 (= lt!400973 (insertStrictlySorted!281 (toList!5270 (+!2582 lt!400861 lt!400858)) (_1!5880 lt!400848) (_2!5880 lt!400848)))))

(assert (=> d!109531 (= (+!2582 (+!2582 lt!400861 lt!400858) lt!400848) lt!400972)))

(declare-fun b!885260 () Bool)

(declare-fun res!601131 () Bool)

(assert (=> b!885260 (=> (not res!601131) (not e!492727))))

(assert (=> b!885260 (= res!601131 (= (getValueByKey!428 (toList!5270 lt!400972) (_1!5880 lt!400848)) (Some!433 (_2!5880 lt!400848))))))

(declare-fun b!885261 () Bool)

(assert (=> b!885261 (= e!492727 (contains!4258 (toList!5270 lt!400972) lt!400848))))

(assert (= (and d!109531 res!601132) b!885260))

(assert (= (and b!885260 res!601131) b!885261))

(declare-fun m!825879 () Bool)

(assert (=> d!109531 m!825879))

(declare-fun m!825881 () Bool)

(assert (=> d!109531 m!825881))

(declare-fun m!825883 () Bool)

(assert (=> d!109531 m!825883))

(declare-fun m!825885 () Bool)

(assert (=> d!109531 m!825885))

(declare-fun m!825887 () Bool)

(assert (=> b!885260 m!825887))

(declare-fun m!825889 () Bool)

(assert (=> b!885261 m!825889))

(assert (=> b!885145 d!109531))

(declare-fun d!109533 () Bool)

(declare-fun e!492728 () Bool)

(assert (=> d!109533 e!492728))

(declare-fun res!601134 () Bool)

(assert (=> d!109533 (=> (not res!601134) (not e!492728))))

(declare-fun lt!400976 () ListLongMap!10509)

(assert (=> d!109533 (= res!601134 (contains!4257 lt!400976 (_1!5880 lt!400858)))))

(declare-fun lt!400977 () List!17571)

(assert (=> d!109533 (= lt!400976 (ListLongMap!10510 lt!400977))))

(declare-fun lt!400979 () Unit!30174)

(declare-fun lt!400978 () Unit!30174)

(assert (=> d!109533 (= lt!400979 lt!400978)))

(assert (=> d!109533 (= (getValueByKey!428 lt!400977 (_1!5880 lt!400858)) (Some!433 (_2!5880 lt!400858)))))

(assert (=> d!109533 (= lt!400978 (lemmaContainsTupThenGetReturnValue!242 lt!400977 (_1!5880 lt!400858) (_2!5880 lt!400858)))))

(assert (=> d!109533 (= lt!400977 (insertStrictlySorted!281 (toList!5270 lt!400861) (_1!5880 lt!400858) (_2!5880 lt!400858)))))

(assert (=> d!109533 (= (+!2582 lt!400861 lt!400858) lt!400976)))

(declare-fun b!885262 () Bool)

(declare-fun res!601133 () Bool)

(assert (=> b!885262 (=> (not res!601133) (not e!492728))))

(assert (=> b!885262 (= res!601133 (= (getValueByKey!428 (toList!5270 lt!400976) (_1!5880 lt!400858)) (Some!433 (_2!5880 lt!400858))))))

(declare-fun b!885263 () Bool)

(assert (=> b!885263 (= e!492728 (contains!4258 (toList!5270 lt!400976) lt!400858))))

(assert (= (and d!109533 res!601134) b!885262))

(assert (= (and b!885262 res!601133) b!885263))

(declare-fun m!825891 () Bool)

(assert (=> d!109533 m!825891))

(declare-fun m!825893 () Bool)

(assert (=> d!109533 m!825893))

(declare-fun m!825895 () Bool)

(assert (=> d!109533 m!825895))

(declare-fun m!825897 () Bool)

(assert (=> d!109533 m!825897))

(declare-fun m!825899 () Bool)

(assert (=> b!885262 m!825899))

(declare-fun m!825901 () Bool)

(assert (=> b!885263 m!825901))

(assert (=> b!885145 d!109533))

(declare-fun d!109535 () Bool)

(assert (=> d!109535 (= (+!2582 (+!2582 lt!400861 (tuple2!11739 k0!854 v!557)) (tuple2!11739 (select (arr!24810 _keys!868) from!1053) lt!400852)) (+!2582 (+!2582 lt!400861 (tuple2!11739 (select (arr!24810 _keys!868) from!1053) lt!400852)) (tuple2!11739 k0!854 v!557)))))

(declare-fun lt!400982 () Unit!30174)

(declare-fun choose!1447 (ListLongMap!10509 (_ BitVec 64) V!28665 (_ BitVec 64) V!28665) Unit!30174)

(assert (=> d!109535 (= lt!400982 (choose!1447 lt!400861 k0!854 v!557 (select (arr!24810 _keys!868) from!1053) lt!400852))))

(assert (=> d!109535 (not (= k0!854 (select (arr!24810 _keys!868) from!1053)))))

(assert (=> d!109535 (= (addCommutativeForDiffKeys!548 lt!400861 k0!854 v!557 (select (arr!24810 _keys!868) from!1053) lt!400852) lt!400982)))

(declare-fun bs!24795 () Bool)

(assert (= bs!24795 d!109535))

(declare-fun m!825903 () Bool)

(assert (=> bs!24795 m!825903))

(assert (=> bs!24795 m!825903))

(declare-fun m!825905 () Bool)

(assert (=> bs!24795 m!825905))

(declare-fun m!825907 () Bool)

(assert (=> bs!24795 m!825907))

(assert (=> bs!24795 m!825907))

(declare-fun m!825909 () Bool)

(assert (=> bs!24795 m!825909))

(assert (=> bs!24795 m!825695))

(declare-fun m!825911 () Bool)

(assert (=> bs!24795 m!825911))

(assert (=> b!885145 d!109535))

(declare-fun d!109537 () Bool)

(assert (=> d!109537 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17567)))

(declare-fun lt!400985 () Unit!30174)

(declare-fun choose!39 (array!51591 (_ BitVec 32) (_ BitVec 32)) Unit!30174)

(assert (=> d!109537 (= lt!400985 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!109537 (bvslt (size!25251 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109537 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!400985)))

(declare-fun bs!24796 () Bool)

(assert (= bs!24796 d!109537))

(assert (=> bs!24796 m!825721))

(declare-fun m!825913 () Bool)

(assert (=> bs!24796 m!825913))

(assert (=> b!885136 d!109537))

(declare-fun d!109539 () Bool)

(assert (=> d!109539 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400988 () Unit!30174)

(declare-fun choose!114 (array!51591 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30174)

(assert (=> d!109539 (= lt!400988 (choose!114 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> d!109539 (bvsge i!612 #b00000000000000000000000000000000)))

(assert (=> d!109539 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)) lt!400988)))

(declare-fun bs!24797 () Bool)

(assert (= bs!24797 d!109539))

(assert (=> bs!24797 m!825729))

(declare-fun m!825915 () Bool)

(assert (=> bs!24797 m!825915))

(assert (=> b!885136 d!109539))

(declare-fun d!109541 () Bool)

(assert (=> d!109541 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25251 _keys!868)) (not (= (select (arr!24810 _keys!868) from!1053) k0!854)))))

(declare-fun lt!400991 () Unit!30174)

(declare-fun choose!21 (array!51591 (_ BitVec 64) (_ BitVec 32) List!17570) Unit!30174)

(assert (=> d!109541 (= lt!400991 (choose!21 _keys!868 k0!854 from!1053 Nil!17567))))

(assert (=> d!109541 (bvslt (size!25251 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109541 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17567) lt!400991)))

(declare-fun bs!24798 () Bool)

(assert (= bs!24798 d!109541))

(assert (=> bs!24798 m!825695))

(declare-fun m!825917 () Bool)

(assert (=> bs!24798 m!825917))

(assert (=> b!885136 d!109541))

(declare-fun d!109543 () Bool)

(declare-fun res!601139 () Bool)

(declare-fun e!492733 () Bool)

(assert (=> d!109543 (=> res!601139 e!492733)))

(assert (=> d!109543 (= res!601139 (= (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) k0!854))))

(assert (=> d!109543 (= (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053)) e!492733)))

(declare-fun b!885268 () Bool)

(declare-fun e!492734 () Bool)

(assert (=> b!885268 (= e!492733 e!492734)))

(declare-fun res!601140 () Bool)

(assert (=> b!885268 (=> (not res!601140) (not e!492734))))

(assert (=> b!885268 (= res!601140 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!25251 _keys!868)))))

(declare-fun b!885269 () Bool)

(assert (=> b!885269 (= e!492734 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (= (and d!109543 (not res!601139)) b!885268))

(assert (= (and b!885268 res!601140) b!885269))

(declare-fun m!825919 () Bool)

(assert (=> d!109543 m!825919))

(declare-fun m!825921 () Bool)

(assert (=> b!885269 m!825921))

(assert (=> b!885136 d!109543))

(declare-fun b!885280 () Bool)

(declare-fun e!492745 () Bool)

(declare-fun e!492743 () Bool)

(assert (=> b!885280 (= e!492745 e!492743)))

(declare-fun c!93400 () Bool)

(assert (=> b!885280 (= c!93400 (validKeyInArray!0 (select (arr!24810 _keys!868) from!1053)))))

(declare-fun call!39033 () Bool)

(declare-fun bm!39030 () Bool)

(assert (=> bm!39030 (= call!39033 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!93400 (Cons!17566 (select (arr!24810 _keys!868) from!1053) Nil!17567) Nil!17567)))))

(declare-fun b!885281 () Bool)

(assert (=> b!885281 (= e!492743 call!39033)))

(declare-fun b!885282 () Bool)

(declare-fun e!492744 () Bool)

(declare-fun contains!4259 (List!17570 (_ BitVec 64)) Bool)

(assert (=> b!885282 (= e!492744 (contains!4259 Nil!17567 (select (arr!24810 _keys!868) from!1053)))))

(declare-fun b!885283 () Bool)

(declare-fun e!492746 () Bool)

(assert (=> b!885283 (= e!492746 e!492745)))

(declare-fun res!601148 () Bool)

(assert (=> b!885283 (=> (not res!601148) (not e!492745))))

(assert (=> b!885283 (= res!601148 (not e!492744))))

(declare-fun res!601149 () Bool)

(assert (=> b!885283 (=> (not res!601149) (not e!492744))))

(assert (=> b!885283 (= res!601149 (validKeyInArray!0 (select (arr!24810 _keys!868) from!1053)))))

(declare-fun b!885284 () Bool)

(assert (=> b!885284 (= e!492743 call!39033)))

(declare-fun d!109545 () Bool)

(declare-fun res!601147 () Bool)

(assert (=> d!109545 (=> res!601147 e!492746)))

(assert (=> d!109545 (= res!601147 (bvsge from!1053 (size!25251 _keys!868)))))

(assert (=> d!109545 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17567) e!492746)))

(assert (= (and d!109545 (not res!601147)) b!885283))

(assert (= (and b!885283 res!601149) b!885282))

(assert (= (and b!885283 res!601148) b!885280))

(assert (= (and b!885280 c!93400) b!885284))

(assert (= (and b!885280 (not c!93400)) b!885281))

(assert (= (or b!885284 b!885281) bm!39030))

(assert (=> b!885280 m!825695))

(assert (=> b!885280 m!825695))

(assert (=> b!885280 m!825737))

(assert (=> bm!39030 m!825695))

(declare-fun m!825923 () Bool)

(assert (=> bm!39030 m!825923))

(assert (=> b!885282 m!825695))

(assert (=> b!885282 m!825695))

(declare-fun m!825925 () Bool)

(assert (=> b!885282 m!825925))

(assert (=> b!885283 m!825695))

(assert (=> b!885283 m!825695))

(assert (=> b!885283 m!825737))

(assert (=> b!885136 d!109545))

(declare-fun d!109547 () Bool)

(assert (=> d!109547 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!885150 d!109547))

(declare-fun d!109549 () Bool)

(declare-fun e!492761 () Bool)

(assert (=> d!109549 e!492761))

(declare-fun res!601159 () Bool)

(assert (=> d!109549 (=> (not res!601159) (not e!492761))))

(declare-fun lt!401008 () ListLongMap!10509)

(assert (=> d!109549 (= res!601159 (not (contains!4257 lt!401008 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!492764 () ListLongMap!10509)

(assert (=> d!109549 (= lt!401008 e!492764)))

(declare-fun c!93411 () Bool)

(assert (=> d!109549 (= c!93411 (bvsge from!1053 (size!25251 _keys!868)))))

(assert (=> d!109549 (validMask!0 mask!1196)))

(assert (=> d!109549 (= (getCurrentListMapNoExtraKeys!3306 _keys!868 lt!400851 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!401008)))

(declare-fun e!492762 () Bool)

(declare-fun b!885309 () Bool)

(assert (=> b!885309 (= e!492762 (= lt!401008 (getCurrentListMapNoExtraKeys!3306 _keys!868 lt!400851 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!885310 () Bool)

(declare-fun lt!401007 () Unit!30174)

(declare-fun lt!401006 () Unit!30174)

(assert (=> b!885310 (= lt!401007 lt!401006)))

(declare-fun lt!401010 () (_ BitVec 64))

(declare-fun lt!401012 () ListLongMap!10509)

(declare-fun lt!401009 () V!28665)

(declare-fun lt!401011 () (_ BitVec 64))

(assert (=> b!885310 (not (contains!4257 (+!2582 lt!401012 (tuple2!11739 lt!401011 lt!401009)) lt!401010))))

(declare-fun addStillNotContains!212 (ListLongMap!10509 (_ BitVec 64) V!28665 (_ BitVec 64)) Unit!30174)

(assert (=> b!885310 (= lt!401006 (addStillNotContains!212 lt!401012 lt!401011 lt!401009 lt!401010))))

(assert (=> b!885310 (= lt!401010 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!885310 (= lt!401009 (get!13094 (select (arr!24811 lt!400851) from!1053) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!885310 (= lt!401011 (select (arr!24810 _keys!868) from!1053))))

(declare-fun call!39036 () ListLongMap!10509)

(assert (=> b!885310 (= lt!401012 call!39036)))

(declare-fun e!492767 () ListLongMap!10509)

(assert (=> b!885310 (= e!492767 (+!2582 call!39036 (tuple2!11739 (select (arr!24810 _keys!868) from!1053) (get!13094 (select (arr!24811 lt!400851) from!1053) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!885311 () Bool)

(declare-fun e!492766 () Bool)

(assert (=> b!885311 (= e!492766 (validKeyInArray!0 (select (arr!24810 _keys!868) from!1053)))))

(assert (=> b!885311 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!885312 () Bool)

(assert (=> b!885312 (= e!492764 (ListLongMap!10510 Nil!17568))))

(declare-fun b!885313 () Bool)

(declare-fun res!601161 () Bool)

(assert (=> b!885313 (=> (not res!601161) (not e!492761))))

(assert (=> b!885313 (= res!601161 (not (contains!4257 lt!401008 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!39033 () Bool)

(assert (=> bm!39033 (= call!39036 (getCurrentListMapNoExtraKeys!3306 _keys!868 lt!400851 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!885314 () Bool)

(assert (=> b!885314 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25251 _keys!868)))))

(assert (=> b!885314 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25252 lt!400851)))))

(declare-fun e!492763 () Bool)

(declare-fun apply!385 (ListLongMap!10509 (_ BitVec 64)) V!28665)

(assert (=> b!885314 (= e!492763 (= (apply!385 lt!401008 (select (arr!24810 _keys!868) from!1053)) (get!13094 (select (arr!24811 lt!400851) from!1053) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!885315 () Bool)

(declare-fun e!492765 () Bool)

(assert (=> b!885315 (= e!492761 e!492765)))

(declare-fun c!93412 () Bool)

(assert (=> b!885315 (= c!93412 e!492766)))

(declare-fun res!601158 () Bool)

(assert (=> b!885315 (=> (not res!601158) (not e!492766))))

(assert (=> b!885315 (= res!601158 (bvslt from!1053 (size!25251 _keys!868)))))

(declare-fun b!885316 () Bool)

(declare-fun isEmpty!678 (ListLongMap!10509) Bool)

(assert (=> b!885316 (= e!492762 (isEmpty!678 lt!401008))))

(declare-fun b!885317 () Bool)

(assert (=> b!885317 (= e!492765 e!492762)))

(declare-fun c!93410 () Bool)

(assert (=> b!885317 (= c!93410 (bvslt from!1053 (size!25251 _keys!868)))))

(declare-fun b!885318 () Bool)

(assert (=> b!885318 (= e!492764 e!492767)))

(declare-fun c!93409 () Bool)

(assert (=> b!885318 (= c!93409 (validKeyInArray!0 (select (arr!24810 _keys!868) from!1053)))))

(declare-fun b!885319 () Bool)

(assert (=> b!885319 (= e!492765 e!492763)))

(assert (=> b!885319 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25251 _keys!868)))))

(declare-fun res!601160 () Bool)

(assert (=> b!885319 (= res!601160 (contains!4257 lt!401008 (select (arr!24810 _keys!868) from!1053)))))

(assert (=> b!885319 (=> (not res!601160) (not e!492763))))

(declare-fun b!885320 () Bool)

(assert (=> b!885320 (= e!492767 call!39036)))

(assert (= (and d!109549 c!93411) b!885312))

(assert (= (and d!109549 (not c!93411)) b!885318))

(assert (= (and b!885318 c!93409) b!885310))

(assert (= (and b!885318 (not c!93409)) b!885320))

(assert (= (or b!885310 b!885320) bm!39033))

(assert (= (and d!109549 res!601159) b!885313))

(assert (= (and b!885313 res!601161) b!885315))

(assert (= (and b!885315 res!601158) b!885311))

(assert (= (and b!885315 c!93412) b!885319))

(assert (= (and b!885315 (not c!93412)) b!885317))

(assert (= (and b!885319 res!601160) b!885314))

(assert (= (and b!885317 c!93410) b!885309))

(assert (= (and b!885317 (not c!93410)) b!885316))

(declare-fun b_lambda!12769 () Bool)

(assert (=> (not b_lambda!12769) (not b!885310)))

(assert (=> b!885310 t!24832))

(declare-fun b_and!25659 () Bool)

(assert (= b_and!25649 (and (=> t!24832 result!9881) b_and!25659)))

(declare-fun b_lambda!12771 () Bool)

(assert (=> (not b_lambda!12771) (not b!885314)))

(assert (=> b!885314 t!24832))

(declare-fun b_and!25661 () Bool)

(assert (= b_and!25659 (and (=> t!24832 result!9881) b_and!25661)))

(declare-fun m!825927 () Bool)

(assert (=> b!885310 m!825927))

(declare-fun m!825929 () Bool)

(assert (=> b!885310 m!825929))

(declare-fun m!825931 () Bool)

(assert (=> b!885310 m!825931))

(declare-fun m!825933 () Bool)

(assert (=> b!885310 m!825933))

(assert (=> b!885310 m!825927))

(assert (=> b!885310 m!825703))

(declare-fun m!825935 () Bool)

(assert (=> b!885310 m!825935))

(assert (=> b!885310 m!825703))

(assert (=> b!885310 m!825695))

(declare-fun m!825937 () Bool)

(assert (=> b!885310 m!825937))

(assert (=> b!885310 m!825929))

(assert (=> b!885311 m!825695))

(assert (=> b!885311 m!825695))

(assert (=> b!885311 m!825737))

(assert (=> b!885318 m!825695))

(assert (=> b!885318 m!825695))

(assert (=> b!885318 m!825737))

(declare-fun m!825939 () Bool)

(assert (=> bm!39033 m!825939))

(declare-fun m!825941 () Bool)

(assert (=> b!885313 m!825941))

(declare-fun m!825943 () Bool)

(assert (=> d!109549 m!825943))

(assert (=> d!109549 m!825743))

(declare-fun m!825945 () Bool)

(assert (=> b!885316 m!825945))

(assert (=> b!885319 m!825695))

(assert (=> b!885319 m!825695))

(declare-fun m!825947 () Bool)

(assert (=> b!885319 m!825947))

(assert (=> b!885309 m!825939))

(assert (=> b!885314 m!825927))

(assert (=> b!885314 m!825927))

(assert (=> b!885314 m!825703))

(assert (=> b!885314 m!825935))

(assert (=> b!885314 m!825695))

(declare-fun m!825949 () Bool)

(assert (=> b!885314 m!825949))

(assert (=> b!885314 m!825703))

(assert (=> b!885314 m!825695))

(assert (=> b!885137 d!109549))

(declare-fun d!109551 () Bool)

(declare-fun e!492768 () Bool)

(assert (=> d!109551 e!492768))

(declare-fun res!601163 () Bool)

(assert (=> d!109551 (=> (not res!601163) (not e!492768))))

(declare-fun lt!401015 () ListLongMap!10509)

(assert (=> d!109551 (= res!601163 (not (contains!4257 lt!401015 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!492771 () ListLongMap!10509)

(assert (=> d!109551 (= lt!401015 e!492771)))

(declare-fun c!93415 () Bool)

(assert (=> d!109551 (= c!93415 (bvsge from!1053 (size!25251 _keys!868)))))

(assert (=> d!109551 (validMask!0 mask!1196)))

(assert (=> d!109551 (= (getCurrentListMapNoExtraKeys!3306 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!401015)))

(declare-fun e!492769 () Bool)

(declare-fun b!885321 () Bool)

(assert (=> b!885321 (= e!492769 (= lt!401015 (getCurrentListMapNoExtraKeys!3306 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!885322 () Bool)

(declare-fun lt!401014 () Unit!30174)

(declare-fun lt!401013 () Unit!30174)

(assert (=> b!885322 (= lt!401014 lt!401013)))

(declare-fun lt!401017 () (_ BitVec 64))

(declare-fun lt!401016 () V!28665)

(declare-fun lt!401019 () ListLongMap!10509)

(declare-fun lt!401018 () (_ BitVec 64))

(assert (=> b!885322 (not (contains!4257 (+!2582 lt!401019 (tuple2!11739 lt!401018 lt!401016)) lt!401017))))

(assert (=> b!885322 (= lt!401013 (addStillNotContains!212 lt!401019 lt!401018 lt!401016 lt!401017))))

(assert (=> b!885322 (= lt!401017 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!885322 (= lt!401016 (get!13094 (select (arr!24811 _values!688) from!1053) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!885322 (= lt!401018 (select (arr!24810 _keys!868) from!1053))))

(declare-fun call!39037 () ListLongMap!10509)

(assert (=> b!885322 (= lt!401019 call!39037)))

(declare-fun e!492774 () ListLongMap!10509)

(assert (=> b!885322 (= e!492774 (+!2582 call!39037 (tuple2!11739 (select (arr!24810 _keys!868) from!1053) (get!13094 (select (arr!24811 _values!688) from!1053) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!885323 () Bool)

(declare-fun e!492773 () Bool)

(assert (=> b!885323 (= e!492773 (validKeyInArray!0 (select (arr!24810 _keys!868) from!1053)))))

(assert (=> b!885323 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!885324 () Bool)

(assert (=> b!885324 (= e!492771 (ListLongMap!10510 Nil!17568))))

(declare-fun b!885325 () Bool)

(declare-fun res!601165 () Bool)

(assert (=> b!885325 (=> (not res!601165) (not e!492768))))

(assert (=> b!885325 (= res!601165 (not (contains!4257 lt!401015 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!39034 () Bool)

(assert (=> bm!39034 (= call!39037 (getCurrentListMapNoExtraKeys!3306 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!885326 () Bool)

(assert (=> b!885326 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25251 _keys!868)))))

(assert (=> b!885326 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25252 _values!688)))))

(declare-fun e!492770 () Bool)

(assert (=> b!885326 (= e!492770 (= (apply!385 lt!401015 (select (arr!24810 _keys!868) from!1053)) (get!13094 (select (arr!24811 _values!688) from!1053) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!885327 () Bool)

(declare-fun e!492772 () Bool)

(assert (=> b!885327 (= e!492768 e!492772)))

(declare-fun c!93416 () Bool)

(assert (=> b!885327 (= c!93416 e!492773)))

(declare-fun res!601162 () Bool)

(assert (=> b!885327 (=> (not res!601162) (not e!492773))))

(assert (=> b!885327 (= res!601162 (bvslt from!1053 (size!25251 _keys!868)))))

(declare-fun b!885328 () Bool)

(assert (=> b!885328 (= e!492769 (isEmpty!678 lt!401015))))

(declare-fun b!885329 () Bool)

(assert (=> b!885329 (= e!492772 e!492769)))

(declare-fun c!93414 () Bool)

(assert (=> b!885329 (= c!93414 (bvslt from!1053 (size!25251 _keys!868)))))

(declare-fun b!885330 () Bool)

(assert (=> b!885330 (= e!492771 e!492774)))

(declare-fun c!93413 () Bool)

(assert (=> b!885330 (= c!93413 (validKeyInArray!0 (select (arr!24810 _keys!868) from!1053)))))

(declare-fun b!885331 () Bool)

(assert (=> b!885331 (= e!492772 e!492770)))

(assert (=> b!885331 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25251 _keys!868)))))

(declare-fun res!601164 () Bool)

(assert (=> b!885331 (= res!601164 (contains!4257 lt!401015 (select (arr!24810 _keys!868) from!1053)))))

(assert (=> b!885331 (=> (not res!601164) (not e!492770))))

(declare-fun b!885332 () Bool)

(assert (=> b!885332 (= e!492774 call!39037)))

(assert (= (and d!109551 c!93415) b!885324))

(assert (= (and d!109551 (not c!93415)) b!885330))

(assert (= (and b!885330 c!93413) b!885322))

(assert (= (and b!885330 (not c!93413)) b!885332))

(assert (= (or b!885322 b!885332) bm!39034))

(assert (= (and d!109551 res!601163) b!885325))

(assert (= (and b!885325 res!601165) b!885327))

(assert (= (and b!885327 res!601162) b!885323))

(assert (= (and b!885327 c!93416) b!885331))

(assert (= (and b!885327 (not c!93416)) b!885329))

(assert (= (and b!885331 res!601164) b!885326))

(assert (= (and b!885329 c!93414) b!885321))

(assert (= (and b!885329 (not c!93414)) b!885328))

(declare-fun b_lambda!12773 () Bool)

(assert (=> (not b_lambda!12773) (not b!885322)))

(assert (=> b!885322 t!24832))

(declare-fun b_and!25663 () Bool)

(assert (= b_and!25661 (and (=> t!24832 result!9881) b_and!25663)))

(declare-fun b_lambda!12775 () Bool)

(assert (=> (not b_lambda!12775) (not b!885326)))

(assert (=> b!885326 t!24832))

(declare-fun b_and!25665 () Bool)

(assert (= b_and!25663 (and (=> t!24832 result!9881) b_and!25665)))

(assert (=> b!885322 m!825701))

(declare-fun m!825951 () Bool)

(assert (=> b!885322 m!825951))

(declare-fun m!825953 () Bool)

(assert (=> b!885322 m!825953))

(declare-fun m!825955 () Bool)

(assert (=> b!885322 m!825955))

(assert (=> b!885322 m!825701))

(assert (=> b!885322 m!825703))

(assert (=> b!885322 m!825705))

(assert (=> b!885322 m!825703))

(assert (=> b!885322 m!825695))

(declare-fun m!825957 () Bool)

(assert (=> b!885322 m!825957))

(assert (=> b!885322 m!825951))

(assert (=> b!885323 m!825695))

(assert (=> b!885323 m!825695))

(assert (=> b!885323 m!825737))

(assert (=> b!885330 m!825695))

(assert (=> b!885330 m!825695))

(assert (=> b!885330 m!825737))

(declare-fun m!825959 () Bool)

(assert (=> bm!39034 m!825959))

(declare-fun m!825961 () Bool)

(assert (=> b!885325 m!825961))

(declare-fun m!825963 () Bool)

(assert (=> d!109551 m!825963))

(assert (=> d!109551 m!825743))

(declare-fun m!825965 () Bool)

(assert (=> b!885328 m!825965))

(assert (=> b!885331 m!825695))

(assert (=> b!885331 m!825695))

(declare-fun m!825967 () Bool)

(assert (=> b!885331 m!825967))

(assert (=> b!885321 m!825959))

(assert (=> b!885326 m!825701))

(assert (=> b!885326 m!825701))

(assert (=> b!885326 m!825703))

(assert (=> b!885326 m!825705))

(assert (=> b!885326 m!825695))

(declare-fun m!825969 () Bool)

(assert (=> b!885326 m!825969))

(assert (=> b!885326 m!825703))

(assert (=> b!885326 m!825695))

(assert (=> b!885137 d!109551))

(declare-fun d!109553 () Bool)

(declare-fun e!492775 () Bool)

(assert (=> d!109553 e!492775))

(declare-fun res!601167 () Bool)

(assert (=> d!109553 (=> (not res!601167) (not e!492775))))

(declare-fun lt!401022 () ListLongMap!10509)

(assert (=> d!109553 (= res!601167 (not (contains!4257 lt!401022 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!492778 () ListLongMap!10509)

(assert (=> d!109553 (= lt!401022 e!492778)))

(declare-fun c!93419 () Bool)

(assert (=> d!109553 (= c!93419 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25251 _keys!868)))))

(assert (=> d!109553 (validMask!0 mask!1196)))

(assert (=> d!109553 (= (getCurrentListMapNoExtraKeys!3306 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!401022)))

(declare-fun b!885333 () Bool)

(declare-fun e!492776 () Bool)

(assert (=> b!885333 (= e!492776 (= lt!401022 (getCurrentListMapNoExtraKeys!3306 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!885334 () Bool)

(declare-fun lt!401021 () Unit!30174)

(declare-fun lt!401020 () Unit!30174)

(assert (=> b!885334 (= lt!401021 lt!401020)))

(declare-fun lt!401023 () V!28665)

(declare-fun lt!401026 () ListLongMap!10509)

(declare-fun lt!401025 () (_ BitVec 64))

(declare-fun lt!401024 () (_ BitVec 64))

(assert (=> b!885334 (not (contains!4257 (+!2582 lt!401026 (tuple2!11739 lt!401025 lt!401023)) lt!401024))))

(assert (=> b!885334 (= lt!401020 (addStillNotContains!212 lt!401026 lt!401025 lt!401023 lt!401024))))

(assert (=> b!885334 (= lt!401024 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!885334 (= lt!401023 (get!13094 (select (arr!24811 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!885334 (= lt!401025 (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!39038 () ListLongMap!10509)

(assert (=> b!885334 (= lt!401026 call!39038)))

(declare-fun e!492781 () ListLongMap!10509)

(assert (=> b!885334 (= e!492781 (+!2582 call!39038 (tuple2!11739 (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13094 (select (arr!24811 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!885335 () Bool)

(declare-fun e!492780 () Bool)

(assert (=> b!885335 (= e!492780 (validKeyInArray!0 (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!885335 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!885336 () Bool)

(assert (=> b!885336 (= e!492778 (ListLongMap!10510 Nil!17568))))

(declare-fun b!885337 () Bool)

(declare-fun res!601169 () Bool)

(assert (=> b!885337 (=> (not res!601169) (not e!492775))))

(assert (=> b!885337 (= res!601169 (not (contains!4257 lt!401022 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!39035 () Bool)

(assert (=> bm!39035 (= call!39038 (getCurrentListMapNoExtraKeys!3306 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!885338 () Bool)

(assert (=> b!885338 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25251 _keys!868)))))

(assert (=> b!885338 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25252 _values!688)))))

(declare-fun e!492777 () Bool)

(assert (=> b!885338 (= e!492777 (= (apply!385 lt!401022 (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13094 (select (arr!24811 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!885339 () Bool)

(declare-fun e!492779 () Bool)

(assert (=> b!885339 (= e!492775 e!492779)))

(declare-fun c!93420 () Bool)

(assert (=> b!885339 (= c!93420 e!492780)))

(declare-fun res!601166 () Bool)

(assert (=> b!885339 (=> (not res!601166) (not e!492780))))

(assert (=> b!885339 (= res!601166 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25251 _keys!868)))))

(declare-fun b!885340 () Bool)

(assert (=> b!885340 (= e!492776 (isEmpty!678 lt!401022))))

(declare-fun b!885341 () Bool)

(assert (=> b!885341 (= e!492779 e!492776)))

(declare-fun c!93418 () Bool)

(assert (=> b!885341 (= c!93418 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25251 _keys!868)))))

(declare-fun b!885342 () Bool)

(assert (=> b!885342 (= e!492778 e!492781)))

(declare-fun c!93417 () Bool)

(assert (=> b!885342 (= c!93417 (validKeyInArray!0 (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!885343 () Bool)

(assert (=> b!885343 (= e!492779 e!492777)))

(assert (=> b!885343 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25251 _keys!868)))))

(declare-fun res!601168 () Bool)

(assert (=> b!885343 (= res!601168 (contains!4257 lt!401022 (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!885343 (=> (not res!601168) (not e!492777))))

(declare-fun b!885344 () Bool)

(assert (=> b!885344 (= e!492781 call!39038)))

(assert (= (and d!109553 c!93419) b!885336))

(assert (= (and d!109553 (not c!93419)) b!885342))

(assert (= (and b!885342 c!93417) b!885334))

(assert (= (and b!885342 (not c!93417)) b!885344))

(assert (= (or b!885334 b!885344) bm!39035))

(assert (= (and d!109553 res!601167) b!885337))

(assert (= (and b!885337 res!601169) b!885339))

(assert (= (and b!885339 res!601166) b!885335))

(assert (= (and b!885339 c!93420) b!885343))

(assert (= (and b!885339 (not c!93420)) b!885341))

(assert (= (and b!885343 res!601168) b!885338))

(assert (= (and b!885341 c!93418) b!885333))

(assert (= (and b!885341 (not c!93418)) b!885340))

(declare-fun b_lambda!12777 () Bool)

(assert (=> (not b_lambda!12777) (not b!885334)))

(assert (=> b!885334 t!24832))

(declare-fun b_and!25667 () Bool)

(assert (= b_and!25665 (and (=> t!24832 result!9881) b_and!25667)))

(declare-fun b_lambda!12779 () Bool)

(assert (=> (not b_lambda!12779) (not b!885338)))

(assert (=> b!885338 t!24832))

(declare-fun b_and!25669 () Bool)

(assert (= b_and!25667 (and (=> t!24832 result!9881) b_and!25669)))

(declare-fun m!825971 () Bool)

(assert (=> b!885334 m!825971))

(declare-fun m!825973 () Bool)

(assert (=> b!885334 m!825973))

(declare-fun m!825975 () Bool)

(assert (=> b!885334 m!825975))

(declare-fun m!825977 () Bool)

(assert (=> b!885334 m!825977))

(assert (=> b!885334 m!825971))

(assert (=> b!885334 m!825703))

(declare-fun m!825979 () Bool)

(assert (=> b!885334 m!825979))

(assert (=> b!885334 m!825703))

(assert (=> b!885334 m!825919))

(declare-fun m!825981 () Bool)

(assert (=> b!885334 m!825981))

(assert (=> b!885334 m!825973))

(assert (=> b!885335 m!825919))

(assert (=> b!885335 m!825919))

(declare-fun m!825983 () Bool)

(assert (=> b!885335 m!825983))

(assert (=> b!885342 m!825919))

(assert (=> b!885342 m!825919))

(assert (=> b!885342 m!825983))

(declare-fun m!825985 () Bool)

(assert (=> bm!39035 m!825985))

(declare-fun m!825987 () Bool)

(assert (=> b!885337 m!825987))

(declare-fun m!825989 () Bool)

(assert (=> d!109553 m!825989))

(assert (=> d!109553 m!825743))

(declare-fun m!825991 () Bool)

(assert (=> b!885340 m!825991))

(assert (=> b!885343 m!825919))

(assert (=> b!885343 m!825919))

(declare-fun m!825993 () Bool)

(assert (=> b!885343 m!825993))

(assert (=> b!885333 m!825985))

(assert (=> b!885338 m!825971))

(assert (=> b!885338 m!825971))

(assert (=> b!885338 m!825703))

(assert (=> b!885338 m!825979))

(assert (=> b!885338 m!825919))

(declare-fun m!825995 () Bool)

(assert (=> b!885338 m!825995))

(assert (=> b!885338 m!825703))

(assert (=> b!885338 m!825919))

(assert (=> b!885141 d!109553))

(declare-fun d!109555 () Bool)

(assert (=> d!109555 (= (validKeyInArray!0 (select (arr!24810 _keys!868) from!1053)) (and (not (= (select (arr!24810 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24810 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!885141 d!109555))

(declare-fun d!109557 () Bool)

(declare-fun e!492782 () Bool)

(assert (=> d!109557 e!492782))

(declare-fun res!601171 () Bool)

(assert (=> d!109557 (=> (not res!601171) (not e!492782))))

(declare-fun lt!401029 () ListLongMap!10509)

(assert (=> d!109557 (= res!601171 (not (contains!4257 lt!401029 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!492785 () ListLongMap!10509)

(assert (=> d!109557 (= lt!401029 e!492785)))

(declare-fun c!93423 () Bool)

(assert (=> d!109557 (= c!93423 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25251 _keys!868)))))

(assert (=> d!109557 (validMask!0 mask!1196)))

(assert (=> d!109557 (= (getCurrentListMapNoExtraKeys!3306 _keys!868 lt!400851 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!401029)))

(declare-fun e!492783 () Bool)

(declare-fun b!885345 () Bool)

(assert (=> b!885345 (= e!492783 (= lt!401029 (getCurrentListMapNoExtraKeys!3306 _keys!868 lt!400851 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!885346 () Bool)

(declare-fun lt!401028 () Unit!30174)

(declare-fun lt!401027 () Unit!30174)

(assert (=> b!885346 (= lt!401028 lt!401027)))

(declare-fun lt!401031 () (_ BitVec 64))

(declare-fun lt!401030 () V!28665)

(declare-fun lt!401033 () ListLongMap!10509)

(declare-fun lt!401032 () (_ BitVec 64))

(assert (=> b!885346 (not (contains!4257 (+!2582 lt!401033 (tuple2!11739 lt!401032 lt!401030)) lt!401031))))

(assert (=> b!885346 (= lt!401027 (addStillNotContains!212 lt!401033 lt!401032 lt!401030 lt!401031))))

(assert (=> b!885346 (= lt!401031 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!885346 (= lt!401030 (get!13094 (select (arr!24811 lt!400851) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!885346 (= lt!401032 (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun call!39039 () ListLongMap!10509)

(assert (=> b!885346 (= lt!401033 call!39039)))

(declare-fun e!492788 () ListLongMap!10509)

(assert (=> b!885346 (= e!492788 (+!2582 call!39039 (tuple2!11739 (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13094 (select (arr!24811 lt!400851) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!885347 () Bool)

(declare-fun e!492787 () Bool)

(assert (=> b!885347 (= e!492787 (validKeyInArray!0 (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!885347 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!885348 () Bool)

(assert (=> b!885348 (= e!492785 (ListLongMap!10510 Nil!17568))))

(declare-fun b!885349 () Bool)

(declare-fun res!601173 () Bool)

(assert (=> b!885349 (=> (not res!601173) (not e!492782))))

(assert (=> b!885349 (= res!601173 (not (contains!4257 lt!401029 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!39036 () Bool)

(assert (=> bm!39036 (= call!39039 (getCurrentListMapNoExtraKeys!3306 _keys!868 lt!400851 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!885350 () Bool)

(assert (=> b!885350 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25251 _keys!868)))))

(assert (=> b!885350 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25252 lt!400851)))))

(declare-fun e!492784 () Bool)

(assert (=> b!885350 (= e!492784 (= (apply!385 lt!401029 (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13094 (select (arr!24811 lt!400851) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!885351 () Bool)

(declare-fun e!492786 () Bool)

(assert (=> b!885351 (= e!492782 e!492786)))

(declare-fun c!93424 () Bool)

(assert (=> b!885351 (= c!93424 e!492787)))

(declare-fun res!601170 () Bool)

(assert (=> b!885351 (=> (not res!601170) (not e!492787))))

(assert (=> b!885351 (= res!601170 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25251 _keys!868)))))

(declare-fun b!885352 () Bool)

(assert (=> b!885352 (= e!492783 (isEmpty!678 lt!401029))))

(declare-fun b!885353 () Bool)

(assert (=> b!885353 (= e!492786 e!492783)))

(declare-fun c!93422 () Bool)

(assert (=> b!885353 (= c!93422 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25251 _keys!868)))))

(declare-fun b!885354 () Bool)

(assert (=> b!885354 (= e!492785 e!492788)))

(declare-fun c!93421 () Bool)

(assert (=> b!885354 (= c!93421 (validKeyInArray!0 (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!885355 () Bool)

(assert (=> b!885355 (= e!492786 e!492784)))

(assert (=> b!885355 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25251 _keys!868)))))

(declare-fun res!601172 () Bool)

(assert (=> b!885355 (= res!601172 (contains!4257 lt!401029 (select (arr!24810 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!885355 (=> (not res!601172) (not e!492784))))

(declare-fun b!885356 () Bool)

(assert (=> b!885356 (= e!492788 call!39039)))

(assert (= (and d!109557 c!93423) b!885348))

(assert (= (and d!109557 (not c!93423)) b!885354))

(assert (= (and b!885354 c!93421) b!885346))

(assert (= (and b!885354 (not c!93421)) b!885356))

(assert (= (or b!885346 b!885356) bm!39036))

(assert (= (and d!109557 res!601171) b!885349))

(assert (= (and b!885349 res!601173) b!885351))

(assert (= (and b!885351 res!601170) b!885347))

(assert (= (and b!885351 c!93424) b!885355))

(assert (= (and b!885351 (not c!93424)) b!885353))

(assert (= (and b!885355 res!601172) b!885350))

(assert (= (and b!885353 c!93422) b!885345))

(assert (= (and b!885353 (not c!93422)) b!885352))

(declare-fun b_lambda!12781 () Bool)

(assert (=> (not b_lambda!12781) (not b!885346)))

(assert (=> b!885346 t!24832))

(declare-fun b_and!25671 () Bool)

(assert (= b_and!25669 (and (=> t!24832 result!9881) b_and!25671)))

(declare-fun b_lambda!12783 () Bool)

(assert (=> (not b_lambda!12783) (not b!885350)))

(assert (=> b!885350 t!24832))

(declare-fun b_and!25673 () Bool)

(assert (= b_and!25671 (and (=> t!24832 result!9881) b_and!25673)))

(declare-fun m!825997 () Bool)

(assert (=> b!885346 m!825997))

(declare-fun m!825999 () Bool)

(assert (=> b!885346 m!825999))

(declare-fun m!826001 () Bool)

(assert (=> b!885346 m!826001))

(declare-fun m!826003 () Bool)

(assert (=> b!885346 m!826003))

(assert (=> b!885346 m!825997))

(assert (=> b!885346 m!825703))

(declare-fun m!826005 () Bool)

(assert (=> b!885346 m!826005))

(assert (=> b!885346 m!825703))

(assert (=> b!885346 m!825919))

(declare-fun m!826007 () Bool)

(assert (=> b!885346 m!826007))

(assert (=> b!885346 m!825999))

(assert (=> b!885347 m!825919))

(assert (=> b!885347 m!825919))

(assert (=> b!885347 m!825983))

(assert (=> b!885354 m!825919))

(assert (=> b!885354 m!825919))

(assert (=> b!885354 m!825983))

(declare-fun m!826009 () Bool)

(assert (=> bm!39036 m!826009))

(declare-fun m!826011 () Bool)

(assert (=> b!885349 m!826011))

(declare-fun m!826013 () Bool)

(assert (=> d!109557 m!826013))

(assert (=> d!109557 m!825743))

(declare-fun m!826015 () Bool)

(assert (=> b!885352 m!826015))

(assert (=> b!885355 m!825919))

(assert (=> b!885355 m!825919))

(declare-fun m!826017 () Bool)

(assert (=> b!885355 m!826017))

(assert (=> b!885345 m!826009))

(assert (=> b!885350 m!825997))

(assert (=> b!885350 m!825997))

(assert (=> b!885350 m!825703))

(assert (=> b!885350 m!826005))

(assert (=> b!885350 m!825919))

(declare-fun m!826019 () Bool)

(assert (=> b!885350 m!826019))

(assert (=> b!885350 m!825703))

(assert (=> b!885350 m!825919))

(assert (=> b!885141 d!109557))

(declare-fun b!885363 () Bool)

(declare-fun e!492793 () Bool)

(declare-fun e!492794 () Bool)

(assert (=> b!885363 (= e!492793 e!492794)))

(declare-fun c!93427 () Bool)

(assert (=> b!885363 (= c!93427 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun call!39044 () ListLongMap!10509)

(declare-fun bm!39041 () Bool)

(assert (=> bm!39041 (= call!39044 (getCurrentListMapNoExtraKeys!3306 _keys!868 (array!51594 (store (arr!24811 _values!688) i!612 (ValueCellFull!8417 v!557)) (size!25252 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!39042 () Bool)

(declare-fun call!39045 () ListLongMap!10509)

(assert (=> bm!39042 (= call!39045 (getCurrentListMapNoExtraKeys!3306 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun d!109559 () Bool)

(assert (=> d!109559 e!492793))

(declare-fun res!601176 () Bool)

(assert (=> d!109559 (=> (not res!601176) (not e!492793))))

(assert (=> d!109559 (= res!601176 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25252 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25252 _values!688))))))))

(declare-fun lt!401036 () Unit!30174)

(declare-fun choose!1448 (array!51591 array!51593 (_ BitVec 32) (_ BitVec 32) V!28665 V!28665 (_ BitVec 32) (_ BitVec 64) V!28665 (_ BitVec 32) Int) Unit!30174)

(assert (=> d!109559 (= lt!401036 (choose!1448 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109559 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25251 _keys!868)))))

(assert (=> d!109559 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!743 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!401036)))

(declare-fun b!885364 () Bool)

(assert (=> b!885364 (= e!492794 (= call!39044 (+!2582 call!39045 (tuple2!11739 k0!854 v!557))))))

(declare-fun b!885365 () Bool)

(assert (=> b!885365 (= e!492794 (= call!39044 call!39045))))

(assert (= (and d!109559 res!601176) b!885363))

(assert (= (and b!885363 c!93427) b!885364))

(assert (= (and b!885363 (not c!93427)) b!885365))

(assert (= (or b!885364 b!885365) bm!39042))

(assert (= (or b!885364 b!885365) bm!39041))

(assert (=> bm!39041 m!825709))

(declare-fun m!826021 () Bool)

(assert (=> bm!39041 m!826021))

(assert (=> bm!39042 m!825735))

(declare-fun m!826023 () Bool)

(assert (=> d!109559 m!826023))

(declare-fun m!826025 () Bool)

(assert (=> b!885364 m!826025))

(assert (=> b!885141 d!109559))

(declare-fun d!109561 () Bool)

(declare-fun e!492795 () Bool)

(assert (=> d!109561 e!492795))

(declare-fun res!601178 () Bool)

(assert (=> d!109561 (=> (not res!601178) (not e!492795))))

(declare-fun lt!401037 () ListLongMap!10509)

(assert (=> d!109561 (= res!601178 (contains!4257 lt!401037 (_1!5880 lt!400848)))))

(declare-fun lt!401038 () List!17571)

(assert (=> d!109561 (= lt!401037 (ListLongMap!10510 lt!401038))))

(declare-fun lt!401040 () Unit!30174)

(declare-fun lt!401039 () Unit!30174)

(assert (=> d!109561 (= lt!401040 lt!401039)))

(assert (=> d!109561 (= (getValueByKey!428 lt!401038 (_1!5880 lt!400848)) (Some!433 (_2!5880 lt!400848)))))

(assert (=> d!109561 (= lt!401039 (lemmaContainsTupThenGetReturnValue!242 lt!401038 (_1!5880 lt!400848) (_2!5880 lt!400848)))))

(assert (=> d!109561 (= lt!401038 (insertStrictlySorted!281 (toList!5270 lt!400861) (_1!5880 lt!400848) (_2!5880 lt!400848)))))

(assert (=> d!109561 (= (+!2582 lt!400861 lt!400848) lt!401037)))

(declare-fun b!885366 () Bool)

(declare-fun res!601177 () Bool)

(assert (=> b!885366 (=> (not res!601177) (not e!492795))))

(assert (=> b!885366 (= res!601177 (= (getValueByKey!428 (toList!5270 lt!401037) (_1!5880 lt!400848)) (Some!433 (_2!5880 lt!400848))))))

(declare-fun b!885367 () Bool)

(assert (=> b!885367 (= e!492795 (contains!4258 (toList!5270 lt!401037) lt!400848))))

(assert (= (and d!109561 res!601178) b!885366))

(assert (= (and b!885366 res!601177) b!885367))

(declare-fun m!826027 () Bool)

(assert (=> d!109561 m!826027))

(declare-fun m!826029 () Bool)

(assert (=> d!109561 m!826029))

(declare-fun m!826031 () Bool)

(assert (=> d!109561 m!826031))

(declare-fun m!826033 () Bool)

(assert (=> d!109561 m!826033))

(declare-fun m!826035 () Bool)

(assert (=> b!885366 m!826035))

(declare-fun m!826037 () Bool)

(assert (=> b!885367 m!826037))

(assert (=> b!885141 d!109561))

(declare-fun d!109563 () Bool)

(assert (=> d!109563 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!885147 d!109563))

(declare-fun b!885368 () Bool)

(declare-fun e!492798 () Bool)

(declare-fun e!492796 () Bool)

(assert (=> b!885368 (= e!492798 e!492796)))

(declare-fun c!93428 () Bool)

(assert (=> b!885368 (= c!93428 (validKeyInArray!0 (select (arr!24810 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!39043 () Bool)

(declare-fun call!39046 () Bool)

(assert (=> bm!39043 (= call!39046 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93428 (Cons!17566 (select (arr!24810 _keys!868) #b00000000000000000000000000000000) Nil!17567) Nil!17567)))))

(declare-fun b!885369 () Bool)

(assert (=> b!885369 (= e!492796 call!39046)))

(declare-fun b!885370 () Bool)

(declare-fun e!492797 () Bool)

(assert (=> b!885370 (= e!492797 (contains!4259 Nil!17567 (select (arr!24810 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!885371 () Bool)

(declare-fun e!492799 () Bool)

(assert (=> b!885371 (= e!492799 e!492798)))

(declare-fun res!601180 () Bool)

(assert (=> b!885371 (=> (not res!601180) (not e!492798))))

(assert (=> b!885371 (= res!601180 (not e!492797))))

(declare-fun res!601181 () Bool)

(assert (=> b!885371 (=> (not res!601181) (not e!492797))))

(assert (=> b!885371 (= res!601181 (validKeyInArray!0 (select (arr!24810 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!885372 () Bool)

(assert (=> b!885372 (= e!492796 call!39046)))

(declare-fun d!109565 () Bool)

(declare-fun res!601179 () Bool)

(assert (=> d!109565 (=> res!601179 e!492799)))

(assert (=> d!109565 (= res!601179 (bvsge #b00000000000000000000000000000000 (size!25251 _keys!868)))))

(assert (=> d!109565 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17567) e!492799)))

(assert (= (and d!109565 (not res!601179)) b!885371))

(assert (= (and b!885371 res!601181) b!885370))

(assert (= (and b!885371 res!601180) b!885368))

(assert (= (and b!885368 c!93428) b!885372))

(assert (= (and b!885368 (not c!93428)) b!885369))

(assert (= (or b!885372 b!885369) bm!39043))

(declare-fun m!826039 () Bool)

(assert (=> b!885368 m!826039))

(assert (=> b!885368 m!826039))

(declare-fun m!826041 () Bool)

(assert (=> b!885368 m!826041))

(assert (=> bm!39043 m!826039))

(declare-fun m!826043 () Bool)

(assert (=> bm!39043 m!826043))

(assert (=> b!885370 m!826039))

(assert (=> b!885370 m!826039))

(declare-fun m!826045 () Bool)

(assert (=> b!885370 m!826045))

(assert (=> b!885371 m!826039))

(assert (=> b!885371 m!826039))

(assert (=> b!885371 m!826041))

(assert (=> b!885138 d!109565))

(declare-fun d!109567 () Bool)

(assert (=> d!109567 (= (array_inv!19570 _keys!868) (bvsge (size!25251 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!75118 d!109567))

(declare-fun d!109569 () Bool)

(assert (=> d!109569 (= (array_inv!19571 _values!688) (bvsge (size!25252 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!75118 d!109569))

(declare-fun d!109571 () Bool)

(declare-fun e!492800 () Bool)

(assert (=> d!109571 e!492800))

(declare-fun res!601183 () Bool)

(assert (=> d!109571 (=> (not res!601183) (not e!492800))))

(declare-fun lt!401041 () ListLongMap!10509)

(assert (=> d!109571 (= res!601183 (contains!4257 lt!401041 (_1!5880 lt!400858)))))

(declare-fun lt!401042 () List!17571)

(assert (=> d!109571 (= lt!401041 (ListLongMap!10510 lt!401042))))

(declare-fun lt!401044 () Unit!30174)

(declare-fun lt!401043 () Unit!30174)

(assert (=> d!109571 (= lt!401044 lt!401043)))

(assert (=> d!109571 (= (getValueByKey!428 lt!401042 (_1!5880 lt!400858)) (Some!433 (_2!5880 lt!400858)))))

(assert (=> d!109571 (= lt!401043 (lemmaContainsTupThenGetReturnValue!242 lt!401042 (_1!5880 lt!400858) (_2!5880 lt!400858)))))

(assert (=> d!109571 (= lt!401042 (insertStrictlySorted!281 (toList!5270 lt!400854) (_1!5880 lt!400858) (_2!5880 lt!400858)))))

(assert (=> d!109571 (= (+!2582 lt!400854 lt!400858) lt!401041)))

(declare-fun b!885373 () Bool)

(declare-fun res!601182 () Bool)

(assert (=> b!885373 (=> (not res!601182) (not e!492800))))

(assert (=> b!885373 (= res!601182 (= (getValueByKey!428 (toList!5270 lt!401041) (_1!5880 lt!400858)) (Some!433 (_2!5880 lt!400858))))))

(declare-fun b!885374 () Bool)

(assert (=> b!885374 (= e!492800 (contains!4258 (toList!5270 lt!401041) lt!400858))))

(assert (= (and d!109571 res!601183) b!885373))

(assert (= (and b!885373 res!601182) b!885374))

(declare-fun m!826047 () Bool)

(assert (=> d!109571 m!826047))

(declare-fun m!826049 () Bool)

(assert (=> d!109571 m!826049))

(declare-fun m!826051 () Bool)

(assert (=> d!109571 m!826051))

(declare-fun m!826053 () Bool)

(assert (=> d!109571 m!826053))

(declare-fun m!826055 () Bool)

(assert (=> b!885373 m!826055))

(declare-fun m!826057 () Bool)

(assert (=> b!885374 m!826057))

(assert (=> b!885143 d!109571))

(declare-fun d!109573 () Bool)

(declare-fun c!93431 () Bool)

(assert (=> d!109573 (= c!93431 ((_ is ValueCellFull!8417) (select (arr!24811 _values!688) from!1053)))))

(declare-fun e!492803 () V!28665)

(assert (=> d!109573 (= (get!13094 (select (arr!24811 _values!688) from!1053) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!492803)))

(declare-fun b!885379 () Bool)

(declare-fun get!13096 (ValueCell!8417 V!28665) V!28665)

(assert (=> b!885379 (= e!492803 (get!13096 (select (arr!24811 _values!688) from!1053) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!885380 () Bool)

(declare-fun get!13097 (ValueCell!8417 V!28665) V!28665)

(assert (=> b!885380 (= e!492803 (get!13097 (select (arr!24811 _values!688) from!1053) (dynLambda!1299 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109573 c!93431) b!885379))

(assert (= (and d!109573 (not c!93431)) b!885380))

(assert (=> b!885379 m!825701))

(assert (=> b!885379 m!825703))

(declare-fun m!826059 () Bool)

(assert (=> b!885379 m!826059))

(assert (=> b!885380 m!825701))

(assert (=> b!885380 m!825703))

(declare-fun m!826061 () Bool)

(assert (=> b!885380 m!826061))

(assert (=> b!885143 d!109573))

(declare-fun b!885389 () Bool)

(declare-fun e!492811 () Bool)

(declare-fun e!492810 () Bool)

(assert (=> b!885389 (= e!492811 e!492810)))

(declare-fun c!93434 () Bool)

(assert (=> b!885389 (= c!93434 (validKeyInArray!0 (select (arr!24810 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!885390 () Bool)

(declare-fun e!492812 () Bool)

(declare-fun call!39049 () Bool)

(assert (=> b!885390 (= e!492812 call!39049)))

(declare-fun bm!39046 () Bool)

(assert (=> bm!39046 (= call!39049 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!885391 () Bool)

(assert (=> b!885391 (= e!492810 call!39049)))

(declare-fun d!109575 () Bool)

(declare-fun res!601188 () Bool)

(assert (=> d!109575 (=> res!601188 e!492811)))

(assert (=> d!109575 (= res!601188 (bvsge #b00000000000000000000000000000000 (size!25251 _keys!868)))))

(assert (=> d!109575 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!492811)))

(declare-fun b!885392 () Bool)

(assert (=> b!885392 (= e!492810 e!492812)))

(declare-fun lt!401051 () (_ BitVec 64))

(assert (=> b!885392 (= lt!401051 (select (arr!24810 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!401052 () Unit!30174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51591 (_ BitVec 64) (_ BitVec 32)) Unit!30174)

(assert (=> b!885392 (= lt!401052 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!401051 #b00000000000000000000000000000000))))

(assert (=> b!885392 (arrayContainsKey!0 _keys!868 lt!401051 #b00000000000000000000000000000000)))

(declare-fun lt!401053 () Unit!30174)

(assert (=> b!885392 (= lt!401053 lt!401052)))

(declare-fun res!601189 () Bool)

(declare-datatypes ((SeekEntryResult!8712 0))(
  ( (MissingZero!8712 (index!37219 (_ BitVec 32))) (Found!8712 (index!37220 (_ BitVec 32))) (Intermediate!8712 (undefined!9524 Bool) (index!37221 (_ BitVec 32)) (x!74941 (_ BitVec 32))) (Undefined!8712) (MissingVacant!8712 (index!37222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51591 (_ BitVec 32)) SeekEntryResult!8712)

(assert (=> b!885392 (= res!601189 (= (seekEntryOrOpen!0 (select (arr!24810 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8712 #b00000000000000000000000000000000)))))

(assert (=> b!885392 (=> (not res!601189) (not e!492812))))

(assert (= (and d!109575 (not res!601188)) b!885389))

(assert (= (and b!885389 c!93434) b!885392))

(assert (= (and b!885389 (not c!93434)) b!885391))

(assert (= (and b!885392 res!601189) b!885390))

(assert (= (or b!885390 b!885391) bm!39046))

(assert (=> b!885389 m!826039))

(assert (=> b!885389 m!826039))

(assert (=> b!885389 m!826041))

(declare-fun m!826063 () Bool)

(assert (=> bm!39046 m!826063))

(assert (=> b!885392 m!826039))

(declare-fun m!826065 () Bool)

(assert (=> b!885392 m!826065))

(declare-fun m!826067 () Bool)

(assert (=> b!885392 m!826067))

(assert (=> b!885392 m!826039))

(declare-fun m!826069 () Bool)

(assert (=> b!885392 m!826069))

(assert (=> b!885139 d!109575))

(declare-fun mapIsEmpty!28215 () Bool)

(declare-fun mapRes!28215 () Bool)

(assert (=> mapIsEmpty!28215 mapRes!28215))

(declare-fun b!885399 () Bool)

(declare-fun e!492818 () Bool)

(assert (=> b!885399 (= e!492818 tp_is_empty!17713)))

(declare-fun mapNonEmpty!28215 () Bool)

(declare-fun tp!54126 () Bool)

(assert (=> mapNonEmpty!28215 (= mapRes!28215 (and tp!54126 e!492818))))

(declare-fun mapKey!28215 () (_ BitVec 32))

(declare-fun mapRest!28215 () (Array (_ BitVec 32) ValueCell!8417))

(declare-fun mapValue!28215 () ValueCell!8417)

(assert (=> mapNonEmpty!28215 (= mapRest!28206 (store mapRest!28215 mapKey!28215 mapValue!28215))))

(declare-fun condMapEmpty!28215 () Bool)

(declare-fun mapDefault!28215 () ValueCell!8417)

(assert (=> mapNonEmpty!28206 (= condMapEmpty!28215 (= mapRest!28206 ((as const (Array (_ BitVec 32) ValueCell!8417)) mapDefault!28215)))))

(declare-fun e!492817 () Bool)

(assert (=> mapNonEmpty!28206 (= tp!54111 (and e!492817 mapRes!28215))))

(declare-fun b!885400 () Bool)

(assert (=> b!885400 (= e!492817 tp_is_empty!17713)))

(assert (= (and mapNonEmpty!28206 condMapEmpty!28215) mapIsEmpty!28215))

(assert (= (and mapNonEmpty!28206 (not condMapEmpty!28215)) mapNonEmpty!28215))

(assert (= (and mapNonEmpty!28215 ((_ is ValueCellFull!8417) mapValue!28215)) b!885399))

(assert (= (and mapNonEmpty!28206 ((_ is ValueCellFull!8417) mapDefault!28215)) b!885400))

(declare-fun m!826071 () Bool)

(assert (=> mapNonEmpty!28215 m!826071))

(declare-fun b_lambda!12785 () Bool)

(assert (= b_lambda!12781 (or (and start!75118 b_free!15469) b_lambda!12785)))

(declare-fun b_lambda!12787 () Bool)

(assert (= b_lambda!12779 (or (and start!75118 b_free!15469) b_lambda!12787)))

(declare-fun b_lambda!12789 () Bool)

(assert (= b_lambda!12777 (or (and start!75118 b_free!15469) b_lambda!12789)))

(declare-fun b_lambda!12791 () Bool)

(assert (= b_lambda!12769 (or (and start!75118 b_free!15469) b_lambda!12791)))

(declare-fun b_lambda!12793 () Bool)

(assert (= b_lambda!12771 (or (and start!75118 b_free!15469) b_lambda!12793)))

(declare-fun b_lambda!12795 () Bool)

(assert (= b_lambda!12783 (or (and start!75118 b_free!15469) b_lambda!12795)))

(declare-fun b_lambda!12797 () Bool)

(assert (= b_lambda!12773 (or (and start!75118 b_free!15469) b_lambda!12797)))

(declare-fun b_lambda!12799 () Bool)

(assert (= b_lambda!12775 (or (and start!75118 b_free!15469) b_lambda!12799)))

(check-sat (not b!885364) (not b!885260) (not d!109533) (not b!885280) (not b!885326) (not b!885380) (not b_next!15469) (not d!109553) (not b!885333) (not b!885330) (not b!885342) (not d!109531) (not b!885345) (not b!885321) (not d!109529) (not b_lambda!12795) (not b!885263) (not d!109537) (not bm!39035) (not b!885355) (not b!885334) (not b!885350) (not b!885392) (not d!109571) (not b!885328) (not b!885269) (not b!885379) (not b!885325) (not b!885338) (not bm!39041) (not b!885282) (not b!885316) (not b!885367) (not b!885319) (not b!885346) (not b!885259) (not bm!39042) (not b!885354) (not b!885389) tp_is_empty!17713 (not d!109557) (not d!109551) (not b!885368) (not b!885314) (not b!885347) (not b!885371) (not b_lambda!12785) (not b!885262) (not bm!39034) (not d!109559) (not b!885335) b_and!25673 (not d!109549) (not d!109535) (not bm!39036) (not bm!39043) (not d!109541) (not bm!39046) (not b!885337) (not b!885340) (not bm!39030) (not b!885261) (not b!885349) (not b_lambda!12791) (not b!885322) (not b_lambda!12799) (not b_lambda!12767) (not b!885258) (not d!109539) (not d!109561) (not b!885331) (not b!885309) (not b!885283) (not b_lambda!12787) (not b!885311) (not mapNonEmpty!28215) (not b!885313) (not b!885366) (not b_lambda!12793) (not b_lambda!12789) (not b_lambda!12797) (not b!885323) (not b!885370) (not b!885352) (not b!885310) (not bm!39033) (not b!885373) (not b!885318) (not b!885343) (not b!885374))
(check-sat b_and!25673 (not b_next!15469))
