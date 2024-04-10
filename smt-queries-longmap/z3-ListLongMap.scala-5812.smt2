; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74946 () Bool)

(assert start!74946)

(declare-fun b_free!15465 () Bool)

(declare-fun b_next!15465 () Bool)

(assert (=> start!74946 (= b_free!15465 (not b_next!15465))))

(declare-fun tp!54098 () Bool)

(declare-fun b_and!25629 () Bool)

(assert (=> start!74946 (= tp!54098 b_and!25629)))

(declare-fun b!884133 () Bool)

(declare-datatypes ((Unit!30186 0))(
  ( (Unit!30187) )
))
(declare-fun e!492033 () Unit!30186)

(declare-fun Unit!30188 () Unit!30186)

(assert (=> b!884133 (= e!492033 Unit!30188)))

(declare-fun lt!400393 () Unit!30186)

(declare-datatypes ((array!51544 0))(
  ( (array!51545 (arr!24791 (Array (_ BitVec 32) (_ BitVec 64))) (size!25231 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51544)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51544 (_ BitVec 32) (_ BitVec 32)) Unit!30186)

(assert (=> b!884133 (= lt!400393 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17609 0))(
  ( (Nil!17606) (Cons!17605 (h!18736 (_ BitVec 64)) (t!24876 List!17609)) )
))
(declare-fun arrayNoDuplicates!0 (array!51544 (_ BitVec 32) List!17609) Bool)

(assert (=> b!884133 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17606)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!400397 () Unit!30186)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30186)

(assert (=> b!884133 (= lt!400397 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884133 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400395 () Unit!30186)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51544 (_ BitVec 64) (_ BitVec 32) List!17609) Unit!30186)

(assert (=> b!884133 (= lt!400395 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17606))))

(assert (=> b!884133 false))

(declare-fun b!884134 () Bool)

(declare-fun res!600638 () Bool)

(declare-fun e!492026 () Bool)

(assert (=> b!884134 (=> (not res!600638) (not e!492026))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51544 (_ BitVec 32)) Bool)

(assert (=> b!884134 (= res!600638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884135 () Bool)

(declare-fun res!600639 () Bool)

(assert (=> b!884135 (=> (not res!600639) (not e!492026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884135 (= res!600639 (validMask!0 mask!1196))))

(declare-fun b!884136 () Bool)

(declare-fun e!492025 () Bool)

(declare-fun tp_is_empty!17709 () Bool)

(assert (=> b!884136 (= e!492025 tp_is_empty!17709)))

(declare-fun b!884137 () Bool)

(declare-fun e!492031 () Bool)

(declare-fun mapRes!28200 () Bool)

(assert (=> b!884137 (= e!492031 (and e!492025 mapRes!28200))))

(declare-fun condMapEmpty!28200 () Bool)

(declare-datatypes ((V!28659 0))(
  ( (V!28660 (val!8902 Int)) )
))
(declare-datatypes ((ValueCell!8415 0))(
  ( (ValueCellFull!8415 (v!11371 V!28659)) (EmptyCell!8415) )
))
(declare-datatypes ((array!51546 0))(
  ( (array!51547 (arr!24792 (Array (_ BitVec 32) ValueCell!8415)) (size!25232 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51546)

(declare-fun mapDefault!28200 () ValueCell!8415)

(assert (=> b!884137 (= condMapEmpty!28200 (= (arr!24792 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8415)) mapDefault!28200)))))

(declare-fun res!600643 () Bool)

(assert (=> start!74946 (=> (not res!600643) (not e!492026))))

(assert (=> start!74946 (= res!600643 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25231 _keys!868))))))

(assert (=> start!74946 e!492026))

(assert (=> start!74946 tp_is_empty!17709))

(assert (=> start!74946 true))

(assert (=> start!74946 tp!54098))

(declare-fun array_inv!19516 (array!51544) Bool)

(assert (=> start!74946 (array_inv!19516 _keys!868)))

(declare-fun array_inv!19517 (array!51546) Bool)

(assert (=> start!74946 (and (array_inv!19517 _values!688) e!492031)))

(declare-fun b!884138 () Bool)

(declare-fun res!600642 () Bool)

(assert (=> b!884138 (=> (not res!600642) (not e!492026))))

(assert (=> b!884138 (= res!600642 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17606))))

(declare-fun mapNonEmpty!28200 () Bool)

(declare-fun tp!54097 () Bool)

(declare-fun e!492028 () Bool)

(assert (=> mapNonEmpty!28200 (= mapRes!28200 (and tp!54097 e!492028))))

(declare-fun mapKey!28200 () (_ BitVec 32))

(declare-fun mapValue!28200 () ValueCell!8415)

(declare-fun mapRest!28200 () (Array (_ BitVec 32) ValueCell!8415))

(assert (=> mapNonEmpty!28200 (= (arr!24792 _values!688) (store mapRest!28200 mapKey!28200 mapValue!28200))))

(declare-fun b!884139 () Bool)

(declare-fun res!600648 () Bool)

(assert (=> b!884139 (=> (not res!600648) (not e!492026))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!884139 (= res!600648 (and (= (size!25232 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25231 _keys!868) (size!25232 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884140 () Bool)

(declare-fun res!600644 () Bool)

(assert (=> b!884140 (=> (not res!600644) (not e!492026))))

(assert (=> b!884140 (= res!600644 (and (= (select (arr!24791 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!884141 () Bool)

(declare-fun e!492027 () Bool)

(declare-fun e!492029 () Bool)

(assert (=> b!884141 (= e!492027 (not e!492029))))

(declare-fun res!600641 () Bool)

(assert (=> b!884141 (=> res!600641 e!492029)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884141 (= res!600641 (not (validKeyInArray!0 (select (arr!24791 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11802 0))(
  ( (tuple2!11803 (_1!5912 (_ BitVec 64)) (_2!5912 V!28659)) )
))
(declare-datatypes ((List!17610 0))(
  ( (Nil!17607) (Cons!17606 (h!18737 tuple2!11802) (t!24877 List!17610)) )
))
(declare-datatypes ((ListLongMap!10571 0))(
  ( (ListLongMap!10572 (toList!5301 List!17610)) )
))
(declare-fun lt!400399 () ListLongMap!10571)

(declare-fun lt!400401 () ListLongMap!10571)

(assert (=> b!884141 (= lt!400399 lt!400401)))

(declare-fun lt!400398 () ListLongMap!10571)

(declare-fun lt!400392 () tuple2!11802)

(declare-fun +!2570 (ListLongMap!10571 tuple2!11802) ListLongMap!10571)

(assert (=> b!884141 (= lt!400401 (+!2570 lt!400398 lt!400392))))

(declare-fun lt!400402 () array!51546)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28659)

(declare-fun zeroValue!654 () V!28659)

(declare-fun getCurrentListMapNoExtraKeys!3260 (array!51544 array!51546 (_ BitVec 32) (_ BitVec 32) V!28659 V!28659 (_ BitVec 32) Int) ListLongMap!10571)

(assert (=> b!884141 (= lt!400399 (getCurrentListMapNoExtraKeys!3260 _keys!868 lt!400402 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!28659)

(assert (=> b!884141 (= lt!400392 (tuple2!11803 k0!854 v!557))))

(assert (=> b!884141 (= lt!400398 (getCurrentListMapNoExtraKeys!3260 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400404 () Unit!30186)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!753 (array!51544 array!51546 (_ BitVec 32) (_ BitVec 32) V!28659 V!28659 (_ BitVec 32) (_ BitVec 64) V!28659 (_ BitVec 32) Int) Unit!30186)

(assert (=> b!884141 (= lt!400404 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!753 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884142 () Bool)

(declare-fun e!492030 () Bool)

(assert (=> b!884142 (= e!492030 true)))

(declare-fun lt!400394 () ListLongMap!10571)

(declare-fun lt!400406 () tuple2!11802)

(assert (=> b!884142 (= lt!400394 (+!2570 (+!2570 lt!400398 lt!400406) lt!400392))))

(declare-fun lt!400403 () Unit!30186)

(declare-fun lt!400400 () V!28659)

(declare-fun addCommutativeForDiffKeys!553 (ListLongMap!10571 (_ BitVec 64) V!28659 (_ BitVec 64) V!28659) Unit!30186)

(assert (=> b!884142 (= lt!400403 (addCommutativeForDiffKeys!553 lt!400398 k0!854 v!557 (select (arr!24791 _keys!868) from!1053) lt!400400))))

(declare-fun b!884143 () Bool)

(declare-fun Unit!30189 () Unit!30186)

(assert (=> b!884143 (= e!492033 Unit!30189)))

(declare-fun b!884144 () Bool)

(assert (=> b!884144 (= e!492028 tp_is_empty!17709)))

(declare-fun b!884145 () Bool)

(declare-fun res!600647 () Bool)

(assert (=> b!884145 (=> (not res!600647) (not e!492026))))

(assert (=> b!884145 (= res!600647 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!28200 () Bool)

(assert (=> mapIsEmpty!28200 mapRes!28200))

(declare-fun b!884146 () Bool)

(declare-fun res!600645 () Bool)

(assert (=> b!884146 (=> (not res!600645) (not e!492026))))

(assert (=> b!884146 (= res!600645 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25231 _keys!868))))))

(declare-fun b!884147 () Bool)

(assert (=> b!884147 (= e!492029 e!492030)))

(declare-fun res!600646 () Bool)

(assert (=> b!884147 (=> res!600646 e!492030)))

(assert (=> b!884147 (= res!600646 (= k0!854 (select (arr!24791 _keys!868) from!1053)))))

(assert (=> b!884147 (not (= (select (arr!24791 _keys!868) from!1053) k0!854))))

(declare-fun lt!400396 () Unit!30186)

(assert (=> b!884147 (= lt!400396 e!492033)))

(declare-fun c!93103 () Bool)

(assert (=> b!884147 (= c!93103 (= (select (arr!24791 _keys!868) from!1053) k0!854))))

(declare-fun lt!400405 () ListLongMap!10571)

(assert (=> b!884147 (= lt!400405 lt!400394)))

(assert (=> b!884147 (= lt!400394 (+!2570 lt!400401 lt!400406))))

(assert (=> b!884147 (= lt!400406 (tuple2!11803 (select (arr!24791 _keys!868) from!1053) lt!400400))))

(declare-fun get!13067 (ValueCell!8415 V!28659) V!28659)

(declare-fun dynLambda!1280 (Int (_ BitVec 64)) V!28659)

(assert (=> b!884147 (= lt!400400 (get!13067 (select (arr!24792 _values!688) from!1053) (dynLambda!1280 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884148 () Bool)

(assert (=> b!884148 (= e!492026 e!492027)))

(declare-fun res!600640 () Bool)

(assert (=> b!884148 (=> (not res!600640) (not e!492027))))

(assert (=> b!884148 (= res!600640 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!884148 (= lt!400405 (getCurrentListMapNoExtraKeys!3260 _keys!868 lt!400402 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884148 (= lt!400402 (array!51547 (store (arr!24792 _values!688) i!612 (ValueCellFull!8415 v!557)) (size!25232 _values!688)))))

(declare-fun lt!400391 () ListLongMap!10571)

(assert (=> b!884148 (= lt!400391 (getCurrentListMapNoExtraKeys!3260 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74946 res!600643) b!884135))

(assert (= (and b!884135 res!600639) b!884139))

(assert (= (and b!884139 res!600648) b!884134))

(assert (= (and b!884134 res!600638) b!884138))

(assert (= (and b!884138 res!600642) b!884146))

(assert (= (and b!884146 res!600645) b!884145))

(assert (= (and b!884145 res!600647) b!884140))

(assert (= (and b!884140 res!600644) b!884148))

(assert (= (and b!884148 res!600640) b!884141))

(assert (= (and b!884141 (not res!600641)) b!884147))

(assert (= (and b!884147 c!93103) b!884133))

(assert (= (and b!884147 (not c!93103)) b!884143))

(assert (= (and b!884147 (not res!600646)) b!884142))

(assert (= (and b!884137 condMapEmpty!28200) mapIsEmpty!28200))

(assert (= (and b!884137 (not condMapEmpty!28200)) mapNonEmpty!28200))

(get-info :version)

(assert (= (and mapNonEmpty!28200 ((_ is ValueCellFull!8415) mapValue!28200)) b!884144))

(assert (= (and b!884137 ((_ is ValueCellFull!8415) mapDefault!28200)) b!884136))

(assert (= start!74946 b!884137))

(declare-fun b_lambda!12743 () Bool)

(assert (=> (not b_lambda!12743) (not b!884147)))

(declare-fun t!24875 () Bool)

(declare-fun tb!5123 () Bool)

(assert (=> (and start!74946 (= defaultEntry!696 defaultEntry!696) t!24875) tb!5123))

(declare-fun result!9881 () Bool)

(assert (=> tb!5123 (= result!9881 tp_is_empty!17709)))

(assert (=> b!884147 t!24875))

(declare-fun b_and!25631 () Bool)

(assert (= b_and!25629 (and (=> t!24875 result!9881) b_and!25631)))

(declare-fun m!824277 () Bool)

(assert (=> b!884147 m!824277))

(declare-fun m!824279 () Bool)

(assert (=> b!884147 m!824279))

(declare-fun m!824281 () Bool)

(assert (=> b!884147 m!824281))

(assert (=> b!884147 m!824277))

(declare-fun m!824283 () Bool)

(assert (=> b!884147 m!824283))

(declare-fun m!824285 () Bool)

(assert (=> b!884147 m!824285))

(assert (=> b!884147 m!824279))

(declare-fun m!824287 () Bool)

(assert (=> start!74946 m!824287))

(declare-fun m!824289 () Bool)

(assert (=> start!74946 m!824289))

(declare-fun m!824291 () Bool)

(assert (=> b!884141 m!824291))

(declare-fun m!824293 () Bool)

(assert (=> b!884141 m!824293))

(assert (=> b!884141 m!824285))

(declare-fun m!824295 () Bool)

(assert (=> b!884141 m!824295))

(assert (=> b!884141 m!824285))

(declare-fun m!824297 () Bool)

(assert (=> b!884141 m!824297))

(declare-fun m!824299 () Bool)

(assert (=> b!884141 m!824299))

(declare-fun m!824301 () Bool)

(assert (=> b!884142 m!824301))

(assert (=> b!884142 m!824301))

(declare-fun m!824303 () Bool)

(assert (=> b!884142 m!824303))

(assert (=> b!884142 m!824285))

(assert (=> b!884142 m!824285))

(declare-fun m!824305 () Bool)

(assert (=> b!884142 m!824305))

(declare-fun m!824307 () Bool)

(assert (=> b!884138 m!824307))

(declare-fun m!824309 () Bool)

(assert (=> b!884134 m!824309))

(declare-fun m!824311 () Bool)

(assert (=> b!884133 m!824311))

(declare-fun m!824313 () Bool)

(assert (=> b!884133 m!824313))

(declare-fun m!824315 () Bool)

(assert (=> b!884133 m!824315))

(declare-fun m!824317 () Bool)

(assert (=> b!884133 m!824317))

(declare-fun m!824319 () Bool)

(assert (=> b!884133 m!824319))

(declare-fun m!824321 () Bool)

(assert (=> mapNonEmpty!28200 m!824321))

(declare-fun m!824323 () Bool)

(assert (=> b!884135 m!824323))

(declare-fun m!824325 () Bool)

(assert (=> b!884140 m!824325))

(declare-fun m!824327 () Bool)

(assert (=> b!884145 m!824327))

(declare-fun m!824329 () Bool)

(assert (=> b!884148 m!824329))

(declare-fun m!824331 () Bool)

(assert (=> b!884148 m!824331))

(declare-fun m!824333 () Bool)

(assert (=> b!884148 m!824333))

(check-sat (not b!884145) (not b!884134) b_and!25631 (not b!884133) (not mapNonEmpty!28200) (not b!884135) (not b_next!15465) (not b!884148) tp_is_empty!17709 (not start!74946) (not b!884138) (not b!884142) (not b!884147) (not b_lambda!12743) (not b!884141))
(check-sat b_and!25631 (not b_next!15465))
