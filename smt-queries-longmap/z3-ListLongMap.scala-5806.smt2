; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75076 () Bool)

(assert start!75076)

(declare-fun b_free!15427 () Bool)

(declare-fun b_next!15427 () Bool)

(assert (=> start!75076 (= b_free!15427 (not b_next!15427))))

(declare-fun tp!53985 () Bool)

(declare-fun b_and!25563 () Bool)

(assert (=> start!75076 (= tp!53985 b_and!25563)))

(declare-fun mapNonEmpty!28143 () Bool)

(declare-fun mapRes!28143 () Bool)

(declare-fun tp!53984 () Bool)

(declare-fun e!492139 () Bool)

(assert (=> mapNonEmpty!28143 (= mapRes!28143 (and tp!53984 e!492139))))

(declare-fun mapKey!28143 () (_ BitVec 32))

(declare-datatypes ((V!28609 0))(
  ( (V!28610 (val!8883 Int)) )
))
(declare-datatypes ((ValueCell!8396 0))(
  ( (ValueCellFull!8396 (v!11352 V!28609)) (EmptyCell!8396) )
))
(declare-fun mapValue!28143 () ValueCell!8396)

(declare-datatypes ((array!51509 0))(
  ( (array!51510 (arr!24769 (Array (_ BitVec 32) ValueCell!8396)) (size!25210 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51509)

(declare-fun mapRest!28143 () (Array (_ BitVec 32) ValueCell!8396))

(assert (=> mapNonEmpty!28143 (= (arr!24769 _values!688) (store mapRest!28143 mapKey!28143 mapValue!28143))))

(declare-fun b!884129 () Bool)

(declare-fun tp_is_empty!17671 () Bool)

(assert (=> b!884129 (= e!492139 tp_is_empty!17671)))

(declare-fun b!884130 () Bool)

(declare-fun e!492141 () Bool)

(declare-fun e!492137 () Bool)

(assert (=> b!884130 (= e!492141 (and e!492137 mapRes!28143))))

(declare-fun condMapEmpty!28143 () Bool)

(declare-fun mapDefault!28143 () ValueCell!8396)

(assert (=> b!884130 (= condMapEmpty!28143 (= (arr!24769 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8396)) mapDefault!28143)))))

(declare-fun b!884131 () Bool)

(declare-fun res!600401 () Bool)

(declare-fun e!492144 () Bool)

(assert (=> b!884131 (=> (not res!600401) (not e!492144))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51511 0))(
  ( (array!51512 (arr!24770 (Array (_ BitVec 32) (_ BitVec 64))) (size!25211 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51511)

(assert (=> b!884131 (= res!600401 (and (= (size!25210 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25211 _keys!868) (size!25210 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884132 () Bool)

(declare-fun res!600403 () Bool)

(assert (=> b!884132 (=> (not res!600403) (not e!492144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51511 (_ BitVec 32)) Bool)

(assert (=> b!884132 (= res!600403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884133 () Bool)

(declare-fun res!600399 () Bool)

(assert (=> b!884133 (=> (not res!600399) (not e!492144))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!884133 (= res!600399 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25211 _keys!868))))))

(declare-fun b!884134 () Bool)

(declare-fun res!600405 () Bool)

(assert (=> b!884134 (=> (not res!600405) (not e!492144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884134 (= res!600405 (validMask!0 mask!1196))))

(declare-fun b!884135 () Bool)

(declare-datatypes ((Unit!30106 0))(
  ( (Unit!30107) )
))
(declare-fun e!492143 () Unit!30106)

(declare-fun Unit!30108 () Unit!30106)

(assert (=> b!884135 (= e!492143 Unit!30108)))

(declare-fun b!884136 () Bool)

(declare-fun res!600398 () Bool)

(assert (=> b!884136 (=> (not res!600398) (not e!492144))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!884136 (= res!600398 (and (= (select (arr!24770 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!600407 () Bool)

(assert (=> start!75076 (=> (not res!600407) (not e!492144))))

(assert (=> start!75076 (= res!600407 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25211 _keys!868))))))

(assert (=> start!75076 e!492144))

(assert (=> start!75076 tp_is_empty!17671))

(assert (=> start!75076 true))

(assert (=> start!75076 tp!53985))

(declare-fun array_inv!19546 (array!51511) Bool)

(assert (=> start!75076 (array_inv!19546 _keys!868)))

(declare-fun array_inv!19547 (array!51509) Bool)

(assert (=> start!75076 (and (array_inv!19547 _values!688) e!492141)))

(declare-fun b!884137 () Bool)

(declare-fun Unit!30109 () Unit!30106)

(assert (=> b!884137 (= e!492143 Unit!30109)))

(declare-fun lt!400058 () Unit!30106)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51511 (_ BitVec 32) (_ BitVec 32)) Unit!30106)

(assert (=> b!884137 (= lt!400058 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17537 0))(
  ( (Nil!17534) (Cons!17533 (h!18670 (_ BitVec 64)) (t!24758 List!17537)) )
))
(declare-fun arrayNoDuplicates!0 (array!51511 (_ BitVec 32) List!17537) Bool)

(assert (=> b!884137 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17534)))

(declare-fun lt!400060 () Unit!30106)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51511 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30106)

(assert (=> b!884137 (= lt!400060 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884137 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400063 () Unit!30106)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51511 (_ BitVec 64) (_ BitVec 32) List!17537) Unit!30106)

(assert (=> b!884137 (= lt!400063 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17534))))

(assert (=> b!884137 false))

(declare-fun b!884138 () Bool)

(declare-fun res!600402 () Bool)

(assert (=> b!884138 (=> (not res!600402) (not e!492144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884138 (= res!600402 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!28143 () Bool)

(assert (=> mapIsEmpty!28143 mapRes!28143))

(declare-fun b!884139 () Bool)

(declare-fun e!492142 () Bool)

(assert (=> b!884139 (= e!492144 e!492142)))

(declare-fun res!600404 () Bool)

(assert (=> b!884139 (=> (not res!600404) (not e!492142))))

(assert (=> b!884139 (= res!600404 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!400056 () array!51509)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11706 0))(
  ( (tuple2!11707 (_1!5864 (_ BitVec 64)) (_2!5864 V!28609)) )
))
(declare-datatypes ((List!17538 0))(
  ( (Nil!17535) (Cons!17534 (h!18671 tuple2!11706) (t!24759 List!17538)) )
))
(declare-datatypes ((ListLongMap!10477 0))(
  ( (ListLongMap!10478 (toList!5254 List!17538)) )
))
(declare-fun lt!400059 () ListLongMap!10477)

(declare-fun minValue!654 () V!28609)

(declare-fun zeroValue!654 () V!28609)

(declare-fun getCurrentListMapNoExtraKeys!3293 (array!51511 array!51509 (_ BitVec 32) (_ BitVec 32) V!28609 V!28609 (_ BitVec 32) Int) ListLongMap!10477)

(assert (=> b!884139 (= lt!400059 (getCurrentListMapNoExtraKeys!3293 _keys!868 lt!400056 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28609)

(assert (=> b!884139 (= lt!400056 (array!51510 (store (arr!24769 _values!688) i!612 (ValueCellFull!8396 v!557)) (size!25210 _values!688)))))

(declare-fun lt!400062 () ListLongMap!10477)

(assert (=> b!884139 (= lt!400062 (getCurrentListMapNoExtraKeys!3293 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884140 () Bool)

(declare-fun e!492138 () Bool)

(assert (=> b!884140 (= e!492138 (bvslt from!1053 (size!25211 _keys!868)))))

(declare-fun lt!400064 () Unit!30106)

(assert (=> b!884140 (= lt!400064 e!492143)))

(declare-fun c!93328 () Bool)

(assert (=> b!884140 (= c!93328 (= (select (arr!24770 _keys!868) from!1053) k0!854))))

(declare-fun lt!400057 () ListLongMap!10477)

(declare-fun +!2566 (ListLongMap!10477 tuple2!11706) ListLongMap!10477)

(declare-fun get!13064 (ValueCell!8396 V!28609) V!28609)

(declare-fun dynLambda!1283 (Int (_ BitVec 64)) V!28609)

(assert (=> b!884140 (= lt!400059 (+!2566 lt!400057 (tuple2!11707 (select (arr!24770 _keys!868) from!1053) (get!13064 (select (arr!24769 _values!688) from!1053) (dynLambda!1283 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884141 () Bool)

(declare-fun res!600400 () Bool)

(assert (=> b!884141 (=> (not res!600400) (not e!492144))))

(assert (=> b!884141 (= res!600400 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17534))))

(declare-fun b!884142 () Bool)

(assert (=> b!884142 (= e!492137 tp_is_empty!17671)))

(declare-fun b!884143 () Bool)

(assert (=> b!884143 (= e!492142 (not e!492138))))

(declare-fun res!600406 () Bool)

(assert (=> b!884143 (=> res!600406 e!492138)))

(assert (=> b!884143 (= res!600406 (not (validKeyInArray!0 (select (arr!24770 _keys!868) from!1053))))))

(declare-fun lt!400061 () ListLongMap!10477)

(assert (=> b!884143 (= lt!400061 lt!400057)))

(declare-fun lt!400055 () ListLongMap!10477)

(assert (=> b!884143 (= lt!400057 (+!2566 lt!400055 (tuple2!11707 k0!854 v!557)))))

(assert (=> b!884143 (= lt!400061 (getCurrentListMapNoExtraKeys!3293 _keys!868 lt!400056 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!884143 (= lt!400055 (getCurrentListMapNoExtraKeys!3293 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400065 () Unit!30106)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!730 (array!51511 array!51509 (_ BitVec 32) (_ BitVec 32) V!28609 V!28609 (_ BitVec 32) (_ BitVec 64) V!28609 (_ BitVec 32) Int) Unit!30106)

(assert (=> b!884143 (= lt!400065 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!730 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!75076 res!600407) b!884134))

(assert (= (and b!884134 res!600405) b!884131))

(assert (= (and b!884131 res!600401) b!884132))

(assert (= (and b!884132 res!600403) b!884141))

(assert (= (and b!884141 res!600400) b!884133))

(assert (= (and b!884133 res!600399) b!884138))

(assert (= (and b!884138 res!600402) b!884136))

(assert (= (and b!884136 res!600398) b!884139))

(assert (= (and b!884139 res!600404) b!884143))

(assert (= (and b!884143 (not res!600406)) b!884140))

(assert (= (and b!884140 c!93328) b!884137))

(assert (= (and b!884140 (not c!93328)) b!884135))

(assert (= (and b!884130 condMapEmpty!28143) mapIsEmpty!28143))

(assert (= (and b!884130 (not condMapEmpty!28143)) mapNonEmpty!28143))

(get-info :version)

(assert (= (and mapNonEmpty!28143 ((_ is ValueCellFull!8396) mapValue!28143)) b!884129))

(assert (= (and b!884130 ((_ is ValueCellFull!8396) mapDefault!28143)) b!884142))

(assert (= start!75076 b!884130))

(declare-fun b_lambda!12719 () Bool)

(assert (=> (not b_lambda!12719) (not b!884140)))

(declare-fun t!24757 () Bool)

(declare-fun tb!5077 () Bool)

(assert (=> (and start!75076 (= defaultEntry!696 defaultEntry!696) t!24757) tb!5077))

(declare-fun result!9797 () Bool)

(assert (=> tb!5077 (= result!9797 tp_is_empty!17671)))

(assert (=> b!884140 t!24757))

(declare-fun b_and!25565 () Bool)

(assert (= b_and!25563 (and (=> t!24757 result!9797) b_and!25565)))

(declare-fun m!824559 () Bool)

(assert (=> b!884134 m!824559))

(declare-fun m!824561 () Bool)

(assert (=> b!884138 m!824561))

(declare-fun m!824563 () Bool)

(assert (=> b!884139 m!824563))

(declare-fun m!824565 () Bool)

(assert (=> b!884139 m!824565))

(declare-fun m!824567 () Bool)

(assert (=> b!884139 m!824567))

(declare-fun m!824569 () Bool)

(assert (=> b!884140 m!824569))

(declare-fun m!824571 () Bool)

(assert (=> b!884140 m!824571))

(declare-fun m!824573 () Bool)

(assert (=> b!884140 m!824573))

(assert (=> b!884140 m!824569))

(declare-fun m!824575 () Bool)

(assert (=> b!884140 m!824575))

(declare-fun m!824577 () Bool)

(assert (=> b!884140 m!824577))

(assert (=> b!884140 m!824571))

(declare-fun m!824579 () Bool)

(assert (=> b!884141 m!824579))

(declare-fun m!824581 () Bool)

(assert (=> b!884132 m!824581))

(declare-fun m!824583 () Bool)

(assert (=> b!884143 m!824583))

(declare-fun m!824585 () Bool)

(assert (=> b!884143 m!824585))

(assert (=> b!884143 m!824577))

(declare-fun m!824587 () Bool)

(assert (=> b!884143 m!824587))

(assert (=> b!884143 m!824577))

(declare-fun m!824589 () Bool)

(assert (=> b!884143 m!824589))

(declare-fun m!824591 () Bool)

(assert (=> b!884143 m!824591))

(declare-fun m!824593 () Bool)

(assert (=> mapNonEmpty!28143 m!824593))

(declare-fun m!824595 () Bool)

(assert (=> b!884137 m!824595))

(declare-fun m!824597 () Bool)

(assert (=> b!884137 m!824597))

(declare-fun m!824599 () Bool)

(assert (=> b!884137 m!824599))

(declare-fun m!824601 () Bool)

(assert (=> b!884137 m!824601))

(declare-fun m!824603 () Bool)

(assert (=> b!884137 m!824603))

(declare-fun m!824605 () Bool)

(assert (=> start!75076 m!824605))

(declare-fun m!824607 () Bool)

(assert (=> start!75076 m!824607))

(declare-fun m!824609 () Bool)

(assert (=> b!884136 m!824609))

(check-sat (not b!884137) (not b!884139) (not b!884132) (not b_next!15427) tp_is_empty!17671 (not b!884138) b_and!25565 (not b!884143) (not b!884140) (not mapNonEmpty!28143) (not b_lambda!12719) (not start!75076) (not b!884141) (not b!884134))
(check-sat b_and!25565 (not b_next!15427))
