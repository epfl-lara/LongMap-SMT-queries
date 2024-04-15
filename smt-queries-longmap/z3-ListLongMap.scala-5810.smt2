; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74914 () Bool)

(assert start!74914)

(declare-fun b_free!15451 () Bool)

(declare-fun b_next!15451 () Bool)

(assert (=> start!74914 (= b_free!15451 (not b_next!15451))))

(declare-fun tp!54056 () Bool)

(declare-fun b_and!25575 () Bool)

(assert (=> start!74914 (= tp!54056 b_and!25575)))

(declare-fun b!883551 () Bool)

(declare-fun res!600304 () Bool)

(declare-fun e!491697 () Bool)

(assert (=> b!883551 (=> (not res!600304) (not e!491697))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883551 (= res!600304 (validKeyInArray!0 k0!854))))

(declare-fun b!883552 () Bool)

(declare-fun e!491701 () Bool)

(declare-fun tp_is_empty!17695 () Bool)

(assert (=> b!883552 (= e!491701 tp_is_empty!17695)))

(declare-fun b!883553 () Bool)

(declare-datatypes ((Unit!30106 0))(
  ( (Unit!30107) )
))
(declare-fun e!491698 () Unit!30106)

(declare-fun Unit!30108 () Unit!30106)

(assert (=> b!883553 (= e!491698 Unit!30108)))

(declare-fun lt!399859 () Unit!30106)

(declare-datatypes ((array!51497 0))(
  ( (array!51498 (arr!24768 (Array (_ BitVec 32) (_ BitVec 64))) (size!25210 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51497)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51497 (_ BitVec 32) (_ BitVec 32)) Unit!30106)

(assert (=> b!883553 (= lt!399859 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17601 0))(
  ( (Nil!17598) (Cons!17597 (h!18728 (_ BitVec 64)) (t!24845 List!17601)) )
))
(declare-fun arrayNoDuplicates!0 (array!51497 (_ BitVec 32) List!17601) Bool)

(assert (=> b!883553 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17598)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!399863 () Unit!30106)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51497 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30106)

(assert (=> b!883553 (= lt!399863 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883553 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399862 () Unit!30106)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51497 (_ BitVec 64) (_ BitVec 32) List!17601) Unit!30106)

(assert (=> b!883553 (= lt!399862 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17598))))

(assert (=> b!883553 false))

(declare-fun b!883554 () Bool)

(declare-fun e!491700 () Bool)

(declare-fun e!491696 () Bool)

(assert (=> b!883554 (= e!491700 (not e!491696))))

(declare-fun res!600306 () Bool)

(assert (=> b!883554 (=> res!600306 e!491696)))

(assert (=> b!883554 (= res!600306 (not (validKeyInArray!0 (select (arr!24768 _keys!868) from!1053))))))

(declare-datatypes ((V!28641 0))(
  ( (V!28642 (val!8895 Int)) )
))
(declare-datatypes ((tuple2!11804 0))(
  ( (tuple2!11805 (_1!5913 (_ BitVec 64)) (_2!5913 V!28641)) )
))
(declare-datatypes ((List!17602 0))(
  ( (Nil!17599) (Cons!17598 (h!18729 tuple2!11804) (t!24846 List!17602)) )
))
(declare-datatypes ((ListLongMap!10563 0))(
  ( (ListLongMap!10564 (toList!5297 List!17602)) )
))
(declare-fun lt!399861 () ListLongMap!10563)

(declare-fun lt!399855 () ListLongMap!10563)

(assert (=> b!883554 (= lt!399861 lt!399855)))

(declare-fun lt!399854 () ListLongMap!10563)

(declare-fun v!557 () V!28641)

(declare-fun +!2589 (ListLongMap!10563 tuple2!11804) ListLongMap!10563)

(assert (=> b!883554 (= lt!399855 (+!2589 lt!399854 (tuple2!11805 k0!854 v!557)))))

(declare-datatypes ((ValueCell!8408 0))(
  ( (ValueCellFull!8408 (v!11358 V!28641)) (EmptyCell!8408) )
))
(declare-datatypes ((array!51499 0))(
  ( (array!51500 (arr!24769 (Array (_ BitVec 32) ValueCell!8408)) (size!25211 (_ BitVec 32))) )
))
(declare-fun lt!399857 () array!51499)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28641)

(declare-fun zeroValue!654 () V!28641)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3288 (array!51497 array!51499 (_ BitVec 32) (_ BitVec 32) V!28641 V!28641 (_ BitVec 32) Int) ListLongMap!10563)

(assert (=> b!883554 (= lt!399861 (getCurrentListMapNoExtraKeys!3288 _keys!868 lt!399857 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51499)

(assert (=> b!883554 (= lt!399854 (getCurrentListMapNoExtraKeys!3288 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399856 () Unit!30106)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!753 (array!51497 array!51499 (_ BitVec 32) (_ BitVec 32) V!28641 V!28641 (_ BitVec 32) (_ BitVec 64) V!28641 (_ BitVec 32) Int) Unit!30106)

(assert (=> b!883554 (= lt!399856 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!753 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883555 () Bool)

(declare-fun e!491695 () Bool)

(assert (=> b!883555 (= e!491695 tp_is_empty!17695)))

(declare-fun b!883556 () Bool)

(declare-fun res!600307 () Bool)

(assert (=> b!883556 (=> (not res!600307) (not e!491697))))

(assert (=> b!883556 (= res!600307 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17598))))

(declare-fun b!883557 () Bool)

(declare-fun res!600310 () Bool)

(assert (=> b!883557 (=> (not res!600310) (not e!491697))))

(assert (=> b!883557 (= res!600310 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25210 _keys!868))))))

(declare-fun b!883558 () Bool)

(assert (=> b!883558 (= e!491697 e!491700)))

(declare-fun res!600312 () Bool)

(assert (=> b!883558 (=> (not res!600312) (not e!491700))))

(assert (=> b!883558 (= res!600312 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399858 () ListLongMap!10563)

(assert (=> b!883558 (= lt!399858 (getCurrentListMapNoExtraKeys!3288 _keys!868 lt!399857 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883558 (= lt!399857 (array!51500 (store (arr!24769 _values!688) i!612 (ValueCellFull!8408 v!557)) (size!25211 _values!688)))))

(declare-fun lt!399860 () ListLongMap!10563)

(assert (=> b!883558 (= lt!399860 (getCurrentListMapNoExtraKeys!3288 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!28179 () Bool)

(declare-fun mapRes!28179 () Bool)

(assert (=> mapIsEmpty!28179 mapRes!28179))

(declare-fun b!883559 () Bool)

(declare-fun Unit!30109 () Unit!30106)

(assert (=> b!883559 (= e!491698 Unit!30109)))

(declare-fun res!600311 () Bool)

(assert (=> start!74914 (=> (not res!600311) (not e!491697))))

(assert (=> start!74914 (= res!600311 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25210 _keys!868))))))

(assert (=> start!74914 e!491697))

(assert (=> start!74914 tp_is_empty!17695))

(assert (=> start!74914 true))

(assert (=> start!74914 tp!54056))

(declare-fun array_inv!19550 (array!51497) Bool)

(assert (=> start!74914 (array_inv!19550 _keys!868)))

(declare-fun e!491699 () Bool)

(declare-fun array_inv!19551 (array!51499) Bool)

(assert (=> start!74914 (and (array_inv!19551 _values!688) e!491699)))

(declare-fun b!883560 () Bool)

(declare-fun res!600309 () Bool)

(assert (=> b!883560 (=> (not res!600309) (not e!491697))))

(assert (=> b!883560 (= res!600309 (and (= (select (arr!24768 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883561 () Bool)

(assert (=> b!883561 (= e!491699 (and e!491695 mapRes!28179))))

(declare-fun condMapEmpty!28179 () Bool)

(declare-fun mapDefault!28179 () ValueCell!8408)

(assert (=> b!883561 (= condMapEmpty!28179 (= (arr!24769 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8408)) mapDefault!28179)))))

(declare-fun mapNonEmpty!28179 () Bool)

(declare-fun tp!54057 () Bool)

(assert (=> mapNonEmpty!28179 (= mapRes!28179 (and tp!54057 e!491701))))

(declare-fun mapRest!28179 () (Array (_ BitVec 32) ValueCell!8408))

(declare-fun mapValue!28179 () ValueCell!8408)

(declare-fun mapKey!28179 () (_ BitVec 32))

(assert (=> mapNonEmpty!28179 (= (arr!24769 _values!688) (store mapRest!28179 mapKey!28179 mapValue!28179))))

(declare-fun b!883562 () Bool)

(declare-fun res!600308 () Bool)

(assert (=> b!883562 (=> (not res!600308) (not e!491697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51497 (_ BitVec 32)) Bool)

(assert (=> b!883562 (= res!600308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883563 () Bool)

(declare-fun res!600313 () Bool)

(assert (=> b!883563 (=> (not res!600313) (not e!491697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883563 (= res!600313 (validMask!0 mask!1196))))

(declare-fun b!883564 () Bool)

(assert (=> b!883564 (= e!491696 (not (= k0!854 (select (arr!24768 _keys!868) from!1053))))))

(assert (=> b!883564 (not (= (select (arr!24768 _keys!868) from!1053) k0!854))))

(declare-fun lt!399864 () Unit!30106)

(assert (=> b!883564 (= lt!399864 e!491698)))

(declare-fun c!93017 () Bool)

(assert (=> b!883564 (= c!93017 (= (select (arr!24768 _keys!868) from!1053) k0!854))))

(declare-fun get!13060 (ValueCell!8408 V!28641) V!28641)

(declare-fun dynLambda!1274 (Int (_ BitVec 64)) V!28641)

(assert (=> b!883564 (= lt!399858 (+!2589 lt!399855 (tuple2!11805 (select (arr!24768 _keys!868) from!1053) (get!13060 (select (arr!24769 _values!688) from!1053) (dynLambda!1274 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883565 () Bool)

(declare-fun res!600305 () Bool)

(assert (=> b!883565 (=> (not res!600305) (not e!491697))))

(assert (=> b!883565 (= res!600305 (and (= (size!25211 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25210 _keys!868) (size!25211 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74914 res!600311) b!883563))

(assert (= (and b!883563 res!600313) b!883565))

(assert (= (and b!883565 res!600305) b!883562))

(assert (= (and b!883562 res!600308) b!883556))

(assert (= (and b!883556 res!600307) b!883557))

(assert (= (and b!883557 res!600310) b!883551))

(assert (= (and b!883551 res!600304) b!883560))

(assert (= (and b!883560 res!600309) b!883558))

(assert (= (and b!883558 res!600312) b!883554))

(assert (= (and b!883554 (not res!600306)) b!883564))

(assert (= (and b!883564 c!93017) b!883553))

(assert (= (and b!883564 (not c!93017)) b!883559))

(assert (= (and b!883561 condMapEmpty!28179) mapIsEmpty!28179))

(assert (= (and b!883561 (not condMapEmpty!28179)) mapNonEmpty!28179))

(get-info :version)

(assert (= (and mapNonEmpty!28179 ((_ is ValueCellFull!8408) mapValue!28179)) b!883552))

(assert (= (and b!883561 ((_ is ValueCellFull!8408) mapDefault!28179)) b!883555))

(assert (= start!74914 b!883561))

(declare-fun b_lambda!12711 () Bool)

(assert (=> (not b_lambda!12711) (not b!883564)))

(declare-fun t!24844 () Bool)

(declare-fun tb!5101 () Bool)

(assert (=> (and start!74914 (= defaultEntry!696 defaultEntry!696) t!24844) tb!5101))

(declare-fun result!9845 () Bool)

(assert (=> tb!5101 (= result!9845 tp_is_empty!17695)))

(assert (=> b!883564 t!24844))

(declare-fun b_and!25577 () Bool)

(assert (= b_and!25575 (and (=> t!24844 result!9845) b_and!25577)))

(declare-fun m!823131 () Bool)

(assert (=> b!883554 m!823131))

(declare-fun m!823133 () Bool)

(assert (=> b!883554 m!823133))

(declare-fun m!823135 () Bool)

(assert (=> b!883554 m!823135))

(assert (=> b!883554 m!823133))

(declare-fun m!823137 () Bool)

(assert (=> b!883554 m!823137))

(declare-fun m!823139 () Bool)

(assert (=> b!883554 m!823139))

(declare-fun m!823141 () Bool)

(assert (=> b!883554 m!823141))

(declare-fun m!823143 () Bool)

(assert (=> b!883562 m!823143))

(declare-fun m!823145 () Bool)

(assert (=> start!74914 m!823145))

(declare-fun m!823147 () Bool)

(assert (=> start!74914 m!823147))

(declare-fun m!823149 () Bool)

(assert (=> b!883560 m!823149))

(declare-fun m!823151 () Bool)

(assert (=> b!883553 m!823151))

(declare-fun m!823153 () Bool)

(assert (=> b!883553 m!823153))

(declare-fun m!823155 () Bool)

(assert (=> b!883553 m!823155))

(declare-fun m!823157 () Bool)

(assert (=> b!883553 m!823157))

(declare-fun m!823159 () Bool)

(assert (=> b!883553 m!823159))

(declare-fun m!823161 () Bool)

(assert (=> b!883563 m!823161))

(declare-fun m!823163 () Bool)

(assert (=> mapNonEmpty!28179 m!823163))

(declare-fun m!823165 () Bool)

(assert (=> b!883564 m!823165))

(declare-fun m!823167 () Bool)

(assert (=> b!883564 m!823167))

(declare-fun m!823169 () Bool)

(assert (=> b!883564 m!823169))

(assert (=> b!883564 m!823133))

(assert (=> b!883564 m!823167))

(declare-fun m!823171 () Bool)

(assert (=> b!883564 m!823171))

(assert (=> b!883564 m!823165))

(declare-fun m!823173 () Bool)

(assert (=> b!883556 m!823173))

(declare-fun m!823175 () Bool)

(assert (=> b!883551 m!823175))

(declare-fun m!823177 () Bool)

(assert (=> b!883558 m!823177))

(declare-fun m!823179 () Bool)

(assert (=> b!883558 m!823179))

(declare-fun m!823181 () Bool)

(assert (=> b!883558 m!823181))

(check-sat (not start!74914) (not mapNonEmpty!28179) (not b!883558) b_and!25577 (not b_next!15451) (not b!883553) tp_is_empty!17695 (not b!883551) (not b!883556) (not b!883563) (not b!883564) (not b!883562) (not b_lambda!12711) (not b!883554))
(check-sat b_and!25577 (not b_next!15451))
