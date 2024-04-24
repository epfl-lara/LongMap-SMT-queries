; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112154 () Bool)

(assert start!112154)

(declare-fun b_free!30529 () Bool)

(declare-fun b_next!30529 () Bool)

(assert (=> start!112154 (= b_free!30529 (not b_next!30529))))

(declare-fun tp!107067 () Bool)

(declare-fun b_and!49155 () Bool)

(assert (=> start!112154 (= tp!107067 b_and!49155)))

(declare-fun b!1327837 () Bool)

(declare-fun res!880945 () Bool)

(declare-fun e!756907 () Bool)

(assert (=> b!1327837 (=> (not res!880945) (not e!756907))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53569 0))(
  ( (V!53570 (val!18249 Int)) )
))
(declare-fun zeroValue!1279 () V!53569)

(declare-datatypes ((ValueCell!17276 0))(
  ( (ValueCellFull!17276 (v!20877 V!53569)) (EmptyCell!17276) )
))
(declare-datatypes ((array!89699 0))(
  ( (array!89700 (arr!43318 (Array (_ BitVec 32) ValueCell!17276)) (size!43869 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89699)

(declare-fun minValue!1279 () V!53569)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!89701 0))(
  ( (array!89702 (arr!43319 (Array (_ BitVec 32) (_ BitVec 64))) (size!43870 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89701)

(declare-datatypes ((tuple2!23574 0))(
  ( (tuple2!23575 (_1!11798 (_ BitVec 64)) (_2!11798 V!53569)) )
))
(declare-datatypes ((List!30725 0))(
  ( (Nil!30722) (Cons!30721 (h!31939 tuple2!23574) (t!44717 List!30725)) )
))
(declare-datatypes ((ListLongMap!21239 0))(
  ( (ListLongMap!21240 (toList!10635 List!30725)) )
))
(declare-fun contains!8803 (ListLongMap!21239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5612 (array!89701 array!89699 (_ BitVec 32) (_ BitVec 32) V!53569 V!53569 (_ BitVec 32) Int) ListLongMap!21239)

(assert (=> b!1327837 (= res!880945 (contains!8803 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1327838 () Bool)

(declare-fun e!756910 () Bool)

(declare-fun tp_is_empty!36349 () Bool)

(assert (=> b!1327838 (= e!756910 tp_is_empty!36349)))

(declare-fun b!1327839 () Bool)

(declare-fun res!880948 () Bool)

(assert (=> b!1327839 (=> (not res!880948) (not e!756907))))

(declare-datatypes ((List!30726 0))(
  ( (Nil!30723) (Cons!30722 (h!31940 (_ BitVec 64)) (t!44718 List!30726)) )
))
(declare-fun arrayNoDuplicates!0 (array!89701 (_ BitVec 32) List!30726) Bool)

(assert (=> b!1327839 (= res!880948 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30723))))

(declare-fun b!1327840 () Bool)

(declare-fun res!880947 () Bool)

(assert (=> b!1327840 (=> (not res!880947) (not e!756907))))

(assert (=> b!1327840 (= res!880947 (not (= (select (arr!43319 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!880950 () Bool)

(assert (=> start!112154 (=> (not res!880950) (not e!756907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112154 (= res!880950 (validMask!0 mask!2019))))

(assert (=> start!112154 e!756907))

(declare-fun array_inv!32961 (array!89701) Bool)

(assert (=> start!112154 (array_inv!32961 _keys!1609)))

(assert (=> start!112154 true))

(assert (=> start!112154 tp_is_empty!36349))

(declare-fun e!756909 () Bool)

(declare-fun array_inv!32962 (array!89699) Bool)

(assert (=> start!112154 (and (array_inv!32962 _values!1337) e!756909)))

(assert (=> start!112154 tp!107067))

(declare-fun b!1327841 () Bool)

(declare-fun mapRes!56175 () Bool)

(assert (=> b!1327841 (= e!756909 (and e!756910 mapRes!56175))))

(declare-fun condMapEmpty!56175 () Bool)

(declare-fun mapDefault!56175 () ValueCell!17276)

(assert (=> b!1327841 (= condMapEmpty!56175 (= (arr!43318 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17276)) mapDefault!56175)))))

(declare-fun b!1327842 () Bool)

(declare-fun res!880943 () Bool)

(assert (=> b!1327842 (=> (not res!880943) (not e!756907))))

(assert (=> b!1327842 (= res!880943 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43870 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1327843 () Bool)

(declare-fun res!880949 () Bool)

(assert (=> b!1327843 (=> (not res!880949) (not e!756907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89701 (_ BitVec 32)) Bool)

(assert (=> b!1327843 (= res!880949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!56175 () Bool)

(declare-fun tp!107066 () Bool)

(declare-fun e!756906 () Bool)

(assert (=> mapNonEmpty!56175 (= mapRes!56175 (and tp!107066 e!756906))))

(declare-fun mapRest!56175 () (Array (_ BitVec 32) ValueCell!17276))

(declare-fun mapKey!56175 () (_ BitVec 32))

(declare-fun mapValue!56175 () ValueCell!17276)

(assert (=> mapNonEmpty!56175 (= (arr!43318 _values!1337) (store mapRest!56175 mapKey!56175 mapValue!56175))))

(declare-fun b!1327844 () Bool)

(declare-fun res!880944 () Bool)

(assert (=> b!1327844 (=> (not res!880944) (not e!756907))))

(assert (=> b!1327844 (= res!880944 (and (= (size!43869 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43870 _keys!1609) (size!43869 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1327845 () Bool)

(assert (=> b!1327845 (= e!756906 tp_is_empty!36349)))

(declare-fun b!1327846 () Bool)

(declare-fun res!880946 () Bool)

(assert (=> b!1327846 (=> (not res!880946) (not e!756907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327846 (= res!880946 (validKeyInArray!0 (select (arr!43319 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!56175 () Bool)

(assert (=> mapIsEmpty!56175 mapRes!56175))

(declare-fun b!1327847 () Bool)

(assert (=> b!1327847 (= e!756907 (not (contains!8803 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k0!1164)))))

(declare-fun lt!590651 () ListLongMap!21239)

(declare-fun +!4678 (ListLongMap!21239 tuple2!23574) ListLongMap!21239)

(assert (=> b!1327847 (contains!8803 (+!4678 lt!590651 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43649 0))(
  ( (Unit!43650) )
))
(declare-fun lt!590653 () Unit!43649)

(declare-fun addStillContains!1170 (ListLongMap!21239 (_ BitVec 64) V!53569 (_ BitVec 64)) Unit!43649)

(assert (=> b!1327847 (= lt!590653 (addStillContains!1170 lt!590651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1327847 (contains!8803 lt!590651 k0!1164)))

(declare-fun lt!590645 () ListLongMap!21239)

(declare-fun lt!590652 () tuple2!23574)

(assert (=> b!1327847 (= lt!590651 (+!4678 lt!590645 lt!590652))))

(declare-fun lt!590648 () Unit!43649)

(assert (=> b!1327847 (= lt!590648 (addStillContains!1170 lt!590645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1327847 (contains!8803 lt!590645 k0!1164)))

(declare-fun lt!590650 () Unit!43649)

(declare-fun lt!590649 () V!53569)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!228 ((_ BitVec 64) (_ BitVec 64) V!53569 ListLongMap!21239) Unit!43649)

(assert (=> b!1327847 (= lt!590650 (lemmaInListMapAfterAddingDiffThenInBefore!228 k0!1164 (select (arr!43319 _keys!1609) from!2000) lt!590649 lt!590645))))

(declare-fun lt!590654 () ListLongMap!21239)

(assert (=> b!1327847 (contains!8803 lt!590654 k0!1164)))

(declare-fun lt!590644 () Unit!43649)

(assert (=> b!1327847 (= lt!590644 (lemmaInListMapAfterAddingDiffThenInBefore!228 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590654))))

(declare-fun lt!590647 () ListLongMap!21239)

(assert (=> b!1327847 (contains!8803 lt!590647 k0!1164)))

(declare-fun lt!590646 () Unit!43649)

(assert (=> b!1327847 (= lt!590646 (lemmaInListMapAfterAddingDiffThenInBefore!228 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590647))))

(assert (=> b!1327847 (= lt!590647 (+!4678 lt!590654 lt!590652))))

(assert (=> b!1327847 (= lt!590652 (tuple2!23575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1327847 (= lt!590654 (+!4678 lt!590645 (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649)))))

(declare-fun get!21852 (ValueCell!17276 V!53569) V!53569)

(declare-fun dynLambda!3632 (Int (_ BitVec 64)) V!53569)

(assert (=> b!1327847 (= lt!590649 (get!21852 (select (arr!43318 _values!1337) from!2000) (dynLambda!3632 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6322 (array!89701 array!89699 (_ BitVec 32) (_ BitVec 32) V!53569 V!53569 (_ BitVec 32) Int) ListLongMap!21239)

(assert (=> b!1327847 (= lt!590645 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(assert (= (and start!112154 res!880950) b!1327844))

(assert (= (and b!1327844 res!880944) b!1327843))

(assert (= (and b!1327843 res!880949) b!1327839))

(assert (= (and b!1327839 res!880948) b!1327842))

(assert (= (and b!1327842 res!880943) b!1327837))

(assert (= (and b!1327837 res!880945) b!1327840))

(assert (= (and b!1327840 res!880947) b!1327846))

(assert (= (and b!1327846 res!880946) b!1327847))

(assert (= (and b!1327841 condMapEmpty!56175) mapIsEmpty!56175))

(assert (= (and b!1327841 (not condMapEmpty!56175)) mapNonEmpty!56175))

(get-info :version)

(assert (= (and mapNonEmpty!56175 ((_ is ValueCellFull!17276) mapValue!56175)) b!1327845))

(assert (= (and b!1327841 ((_ is ValueCellFull!17276) mapDefault!56175)) b!1327838))

(assert (= start!112154 b!1327841))

(declare-fun b_lambda!23801 () Bool)

(assert (=> (not b_lambda!23801) (not b!1327847)))

(declare-fun t!44716 () Bool)

(declare-fun tb!11795 () Bool)

(assert (=> (and start!112154 (= defaultEntry!1340 defaultEntry!1340) t!44716) tb!11795))

(declare-fun result!24655 () Bool)

(assert (=> tb!11795 (= result!24655 tp_is_empty!36349)))

(assert (=> b!1327847 t!44716))

(declare-fun b_and!49157 () Bool)

(assert (= b_and!49155 (and (=> t!44716 result!24655) b_and!49157)))

(declare-fun m!1217169 () Bool)

(assert (=> b!1327840 m!1217169))

(declare-fun m!1217171 () Bool)

(assert (=> b!1327847 m!1217171))

(declare-fun m!1217173 () Bool)

(assert (=> b!1327847 m!1217173))

(declare-fun m!1217175 () Bool)

(assert (=> b!1327847 m!1217175))

(declare-fun m!1217177 () Bool)

(assert (=> b!1327847 m!1217177))

(declare-fun m!1217179 () Bool)

(assert (=> b!1327847 m!1217179))

(declare-fun m!1217181 () Bool)

(assert (=> b!1327847 m!1217181))

(declare-fun m!1217183 () Bool)

(assert (=> b!1327847 m!1217183))

(declare-fun m!1217185 () Bool)

(assert (=> b!1327847 m!1217185))

(assert (=> b!1327847 m!1217183))

(assert (=> b!1327847 m!1217179))

(declare-fun m!1217187 () Bool)

(assert (=> b!1327847 m!1217187))

(assert (=> b!1327847 m!1217169))

(declare-fun m!1217189 () Bool)

(assert (=> b!1327847 m!1217189))

(declare-fun m!1217191 () Bool)

(assert (=> b!1327847 m!1217191))

(assert (=> b!1327847 m!1217171))

(declare-fun m!1217193 () Bool)

(assert (=> b!1327847 m!1217193))

(declare-fun m!1217195 () Bool)

(assert (=> b!1327847 m!1217195))

(declare-fun m!1217197 () Bool)

(assert (=> b!1327847 m!1217197))

(assert (=> b!1327847 m!1217197))

(declare-fun m!1217199 () Bool)

(assert (=> b!1327847 m!1217199))

(declare-fun m!1217201 () Bool)

(assert (=> b!1327847 m!1217201))

(declare-fun m!1217203 () Bool)

(assert (=> b!1327847 m!1217203))

(declare-fun m!1217205 () Bool)

(assert (=> b!1327847 m!1217205))

(declare-fun m!1217207 () Bool)

(assert (=> b!1327847 m!1217207))

(declare-fun m!1217209 () Bool)

(assert (=> b!1327847 m!1217209))

(assert (=> b!1327847 m!1217169))

(assert (=> b!1327846 m!1217169))

(assert (=> b!1327846 m!1217169))

(declare-fun m!1217211 () Bool)

(assert (=> b!1327846 m!1217211))

(declare-fun m!1217213 () Bool)

(assert (=> mapNonEmpty!56175 m!1217213))

(declare-fun m!1217215 () Bool)

(assert (=> b!1327837 m!1217215))

(assert (=> b!1327837 m!1217215))

(declare-fun m!1217217 () Bool)

(assert (=> b!1327837 m!1217217))

(declare-fun m!1217219 () Bool)

(assert (=> b!1327839 m!1217219))

(declare-fun m!1217221 () Bool)

(assert (=> b!1327843 m!1217221))

(declare-fun m!1217223 () Bool)

(assert (=> start!112154 m!1217223))

(declare-fun m!1217225 () Bool)

(assert (=> start!112154 m!1217225))

(declare-fun m!1217227 () Bool)

(assert (=> start!112154 m!1217227))

(check-sat tp_is_empty!36349 (not b!1327846) b_and!49157 (not b!1327837) (not b_lambda!23801) (not mapNonEmpty!56175) (not b!1327839) (not b!1327843) (not start!112154) (not b!1327847) (not b_next!30529))
(check-sat b_and!49157 (not b_next!30529))
(get-model)

(declare-fun b_lambda!23807 () Bool)

(assert (= b_lambda!23801 (or (and start!112154 b_free!30529) b_lambda!23807)))

(check-sat tp_is_empty!36349 (not b!1327846) b_and!49157 (not b!1327837) (not b_lambda!23807) (not mapNonEmpty!56175) (not b!1327839) (not b!1327843) (not start!112154) (not b!1327847) (not b_next!30529))
(check-sat b_and!49157 (not b_next!30529))
(get-model)

(declare-fun b!1327930 () Bool)

(declare-fun e!756951 () Bool)

(declare-fun e!756952 () Bool)

(assert (=> b!1327930 (= e!756951 e!756952)))

(declare-fun res!881007 () Bool)

(assert (=> b!1327930 (=> (not res!881007) (not e!756952))))

(declare-fun e!756949 () Bool)

(assert (=> b!1327930 (= res!881007 (not e!756949))))

(declare-fun res!881005 () Bool)

(assert (=> b!1327930 (=> (not res!881005) (not e!756949))))

(assert (=> b!1327930 (= res!881005 (validKeyInArray!0 (select (arr!43319 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun bm!64798 () Bool)

(declare-fun call!64801 () Bool)

(declare-fun c!126155 () Bool)

(assert (=> bm!64798 (= call!64801 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126155 (Cons!30722 (select (arr!43319 _keys!1609) #b00000000000000000000000000000000) Nil!30723) Nil!30723)))))

(declare-fun b!1327931 () Bool)

(declare-fun e!756950 () Bool)

(assert (=> b!1327931 (= e!756950 call!64801)))

(declare-fun d!143533 () Bool)

(declare-fun res!881006 () Bool)

(assert (=> d!143533 (=> res!881006 e!756951)))

(assert (=> d!143533 (= res!881006 (bvsge #b00000000000000000000000000000000 (size!43870 _keys!1609)))))

(assert (=> d!143533 (= (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30723) e!756951)))

(declare-fun b!1327932 () Bool)

(declare-fun contains!8805 (List!30726 (_ BitVec 64)) Bool)

(assert (=> b!1327932 (= e!756949 (contains!8805 Nil!30723 (select (arr!43319 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1327933 () Bool)

(assert (=> b!1327933 (= e!756952 e!756950)))

(assert (=> b!1327933 (= c!126155 (validKeyInArray!0 (select (arr!43319 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1327934 () Bool)

(assert (=> b!1327934 (= e!756950 call!64801)))

(assert (= (and d!143533 (not res!881006)) b!1327930))

(assert (= (and b!1327930 res!881005) b!1327932))

(assert (= (and b!1327930 res!881007) b!1327933))

(assert (= (and b!1327933 c!126155) b!1327934))

(assert (= (and b!1327933 (not c!126155)) b!1327931))

(assert (= (or b!1327934 b!1327931) bm!64798))

(declare-fun m!1217349 () Bool)

(assert (=> b!1327930 m!1217349))

(assert (=> b!1327930 m!1217349))

(declare-fun m!1217351 () Bool)

(assert (=> b!1327930 m!1217351))

(assert (=> bm!64798 m!1217349))

(declare-fun m!1217353 () Bool)

(assert (=> bm!64798 m!1217353))

(assert (=> b!1327932 m!1217349))

(assert (=> b!1327932 m!1217349))

(declare-fun m!1217355 () Bool)

(assert (=> b!1327932 m!1217355))

(assert (=> b!1327933 m!1217349))

(assert (=> b!1327933 m!1217349))

(assert (=> b!1327933 m!1217351))

(assert (=> b!1327839 d!143533))

(declare-fun b!1327943 () Bool)

(declare-fun e!756959 () Bool)

(declare-fun call!64804 () Bool)

(assert (=> b!1327943 (= e!756959 call!64804)))

(declare-fun bm!64801 () Bool)

(assert (=> bm!64801 (= call!64804 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun d!143535 () Bool)

(declare-fun res!881013 () Bool)

(declare-fun e!756960 () Bool)

(assert (=> d!143535 (=> res!881013 e!756960)))

(assert (=> d!143535 (= res!881013 (bvsge #b00000000000000000000000000000000 (size!43870 _keys!1609)))))

(assert (=> d!143535 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!756960)))

(declare-fun b!1327944 () Bool)

(assert (=> b!1327944 (= e!756960 e!756959)))

(declare-fun c!126158 () Bool)

(assert (=> b!1327944 (= c!126158 (validKeyInArray!0 (select (arr!43319 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1327945 () Bool)

(declare-fun e!756961 () Bool)

(assert (=> b!1327945 (= e!756959 e!756961)))

(declare-fun lt!590727 () (_ BitVec 64))

(assert (=> b!1327945 (= lt!590727 (select (arr!43319 _keys!1609) #b00000000000000000000000000000000))))

(declare-fun lt!590728 () Unit!43649)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89701 (_ BitVec 64) (_ BitVec 32)) Unit!43649)

(assert (=> b!1327945 (= lt!590728 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590727 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1327945 (arrayContainsKey!0 _keys!1609 lt!590727 #b00000000000000000000000000000000)))

(declare-fun lt!590729 () Unit!43649)

(assert (=> b!1327945 (= lt!590729 lt!590728)))

(declare-fun res!881012 () Bool)

(declare-datatypes ((SeekEntryResult!9997 0))(
  ( (MissingZero!9997 (index!42359 (_ BitVec 32))) (Found!9997 (index!42360 (_ BitVec 32))) (Intermediate!9997 (undefined!10809 Bool) (index!42361 (_ BitVec 32)) (x!118270 (_ BitVec 32))) (Undefined!9997) (MissingVacant!9997 (index!42362 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89701 (_ BitVec 32)) SeekEntryResult!9997)

(assert (=> b!1327945 (= res!881012 (= (seekEntryOrOpen!0 (select (arr!43319 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!9997 #b00000000000000000000000000000000)))))

(assert (=> b!1327945 (=> (not res!881012) (not e!756961))))

(declare-fun b!1327946 () Bool)

(assert (=> b!1327946 (= e!756961 call!64804)))

(assert (= (and d!143535 (not res!881013)) b!1327944))

(assert (= (and b!1327944 c!126158) b!1327945))

(assert (= (and b!1327944 (not c!126158)) b!1327943))

(assert (= (and b!1327945 res!881012) b!1327946))

(assert (= (or b!1327946 b!1327943) bm!64801))

(declare-fun m!1217357 () Bool)

(assert (=> bm!64801 m!1217357))

(assert (=> b!1327944 m!1217349))

(assert (=> b!1327944 m!1217349))

(assert (=> b!1327944 m!1217351))

(assert (=> b!1327945 m!1217349))

(declare-fun m!1217359 () Bool)

(assert (=> b!1327945 m!1217359))

(declare-fun m!1217361 () Bool)

(assert (=> b!1327945 m!1217361))

(assert (=> b!1327945 m!1217349))

(declare-fun m!1217363 () Bool)

(assert (=> b!1327945 m!1217363))

(assert (=> b!1327843 d!143535))

(declare-fun d!143537 () Bool)

(declare-fun e!756964 () Bool)

(assert (=> d!143537 e!756964))

(declare-fun res!881018 () Bool)

(assert (=> d!143537 (=> (not res!881018) (not e!756964))))

(declare-fun lt!590740 () ListLongMap!21239)

(assert (=> d!143537 (= res!881018 (contains!8803 lt!590740 (_1!11798 lt!590652)))))

(declare-fun lt!590739 () List!30725)

(assert (=> d!143537 (= lt!590740 (ListLongMap!21240 lt!590739))))

(declare-fun lt!590741 () Unit!43649)

(declare-fun lt!590738 () Unit!43649)

(assert (=> d!143537 (= lt!590741 lt!590738)))

(declare-datatypes ((Option!760 0))(
  ( (Some!759 (v!20880 V!53569)) (None!758) )
))
(declare-fun getValueByKey!709 (List!30725 (_ BitVec 64)) Option!760)

(assert (=> d!143537 (= (getValueByKey!709 lt!590739 (_1!11798 lt!590652)) (Some!759 (_2!11798 lt!590652)))))

(declare-fun lemmaContainsTupThenGetReturnValue!359 (List!30725 (_ BitVec 64) V!53569) Unit!43649)

(assert (=> d!143537 (= lt!590738 (lemmaContainsTupThenGetReturnValue!359 lt!590739 (_1!11798 lt!590652) (_2!11798 lt!590652)))))

(declare-fun insertStrictlySorted!488 (List!30725 (_ BitVec 64) V!53569) List!30725)

(assert (=> d!143537 (= lt!590739 (insertStrictlySorted!488 (toList!10635 lt!590654) (_1!11798 lt!590652) (_2!11798 lt!590652)))))

(assert (=> d!143537 (= (+!4678 lt!590654 lt!590652) lt!590740)))

(declare-fun b!1327951 () Bool)

(declare-fun res!881019 () Bool)

(assert (=> b!1327951 (=> (not res!881019) (not e!756964))))

(assert (=> b!1327951 (= res!881019 (= (getValueByKey!709 (toList!10635 lt!590740) (_1!11798 lt!590652)) (Some!759 (_2!11798 lt!590652))))))

(declare-fun b!1327952 () Bool)

(declare-fun contains!8806 (List!30725 tuple2!23574) Bool)

(assert (=> b!1327952 (= e!756964 (contains!8806 (toList!10635 lt!590740) lt!590652))))

(assert (= (and d!143537 res!881018) b!1327951))

(assert (= (and b!1327951 res!881019) b!1327952))

(declare-fun m!1217365 () Bool)

(assert (=> d!143537 m!1217365))

(declare-fun m!1217367 () Bool)

(assert (=> d!143537 m!1217367))

(declare-fun m!1217369 () Bool)

(assert (=> d!143537 m!1217369))

(declare-fun m!1217371 () Bool)

(assert (=> d!143537 m!1217371))

(declare-fun m!1217373 () Bool)

(assert (=> b!1327951 m!1217373))

(declare-fun m!1217375 () Bool)

(assert (=> b!1327952 m!1217375))

(assert (=> b!1327847 d!143537))

(declare-fun d!143539 () Bool)

(assert (=> d!143539 (contains!8803 lt!590647 k0!1164)))

(declare-fun lt!590744 () Unit!43649)

(declare-fun choose!1953 ((_ BitVec 64) (_ BitVec 64) V!53569 ListLongMap!21239) Unit!43649)

(assert (=> d!143539 (= lt!590744 (choose!1953 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590647))))

(assert (=> d!143539 (contains!8803 (+!4678 lt!590647 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(assert (=> d!143539 (= (lemmaInListMapAfterAddingDiffThenInBefore!228 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590647) lt!590744)))

(declare-fun bs!37962 () Bool)

(assert (= bs!37962 d!143539))

(assert (=> bs!37962 m!1217201))

(declare-fun m!1217377 () Bool)

(assert (=> bs!37962 m!1217377))

(declare-fun m!1217379 () Bool)

(assert (=> bs!37962 m!1217379))

(assert (=> bs!37962 m!1217379))

(declare-fun m!1217381 () Bool)

(assert (=> bs!37962 m!1217381))

(assert (=> b!1327847 d!143539))

(declare-fun d!143541 () Bool)

(declare-fun e!756970 () Bool)

(assert (=> d!143541 e!756970))

(declare-fun res!881022 () Bool)

(assert (=> d!143541 (=> res!881022 e!756970)))

(declare-fun lt!590756 () Bool)

(assert (=> d!143541 (= res!881022 (not lt!590756))))

(declare-fun lt!590755 () Bool)

(assert (=> d!143541 (= lt!590756 lt!590755)))

(declare-fun lt!590753 () Unit!43649)

(declare-fun e!756969 () Unit!43649)

(assert (=> d!143541 (= lt!590753 e!756969)))

(declare-fun c!126161 () Bool)

(assert (=> d!143541 (= c!126161 lt!590755)))

(declare-fun containsKey!735 (List!30725 (_ BitVec 64)) Bool)

(assert (=> d!143541 (= lt!590755 (containsKey!735 (toList!10635 lt!590645) k0!1164))))

(assert (=> d!143541 (= (contains!8803 lt!590645 k0!1164) lt!590756)))

(declare-fun b!1327959 () Bool)

(declare-fun lt!590754 () Unit!43649)

(assert (=> b!1327959 (= e!756969 lt!590754)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!481 (List!30725 (_ BitVec 64)) Unit!43649)

(assert (=> b!1327959 (= lt!590754 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10635 lt!590645) k0!1164))))

(declare-fun isDefined!518 (Option!760) Bool)

(assert (=> b!1327959 (isDefined!518 (getValueByKey!709 (toList!10635 lt!590645) k0!1164))))

(declare-fun b!1327960 () Bool)

(declare-fun Unit!43651 () Unit!43649)

(assert (=> b!1327960 (= e!756969 Unit!43651)))

(declare-fun b!1327961 () Bool)

(assert (=> b!1327961 (= e!756970 (isDefined!518 (getValueByKey!709 (toList!10635 lt!590645) k0!1164)))))

(assert (= (and d!143541 c!126161) b!1327959))

(assert (= (and d!143541 (not c!126161)) b!1327960))

(assert (= (and d!143541 (not res!881022)) b!1327961))

(declare-fun m!1217383 () Bool)

(assert (=> d!143541 m!1217383))

(declare-fun m!1217385 () Bool)

(assert (=> b!1327959 m!1217385))

(declare-fun m!1217387 () Bool)

(assert (=> b!1327959 m!1217387))

(assert (=> b!1327959 m!1217387))

(declare-fun m!1217389 () Bool)

(assert (=> b!1327959 m!1217389))

(assert (=> b!1327961 m!1217387))

(assert (=> b!1327961 m!1217387))

(assert (=> b!1327961 m!1217389))

(assert (=> b!1327847 d!143541))

(declare-fun d!143543 () Bool)

(declare-fun c!126164 () Bool)

(assert (=> d!143543 (= c!126164 ((_ is ValueCellFull!17276) (select (arr!43318 _values!1337) from!2000)))))

(declare-fun e!756973 () V!53569)

(assert (=> d!143543 (= (get!21852 (select (arr!43318 _values!1337) from!2000) (dynLambda!3632 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!756973)))

(declare-fun b!1327966 () Bool)

(declare-fun get!21853 (ValueCell!17276 V!53569) V!53569)

(assert (=> b!1327966 (= e!756973 (get!21853 (select (arr!43318 _values!1337) from!2000) (dynLambda!3632 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1327967 () Bool)

(declare-fun get!21854 (ValueCell!17276 V!53569) V!53569)

(assert (=> b!1327967 (= e!756973 (get!21854 (select (arr!43318 _values!1337) from!2000) (dynLambda!3632 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143543 c!126164) b!1327966))

(assert (= (and d!143543 (not c!126164)) b!1327967))

(assert (=> b!1327966 m!1217183))

(assert (=> b!1327966 m!1217179))

(declare-fun m!1217391 () Bool)

(assert (=> b!1327966 m!1217391))

(assert (=> b!1327967 m!1217183))

(assert (=> b!1327967 m!1217179))

(declare-fun m!1217393 () Bool)

(assert (=> b!1327967 m!1217393))

(assert (=> b!1327847 d!143543))

(declare-fun d!143545 () Bool)

(declare-fun e!756975 () Bool)

(assert (=> d!143545 e!756975))

(declare-fun res!881023 () Bool)

(assert (=> d!143545 (=> res!881023 e!756975)))

(declare-fun lt!590760 () Bool)

(assert (=> d!143545 (= res!881023 (not lt!590760))))

(declare-fun lt!590759 () Bool)

(assert (=> d!143545 (= lt!590760 lt!590759)))

(declare-fun lt!590757 () Unit!43649)

(declare-fun e!756974 () Unit!43649)

(assert (=> d!143545 (= lt!590757 e!756974)))

(declare-fun c!126165 () Bool)

(assert (=> d!143545 (= c!126165 lt!590759)))

(assert (=> d!143545 (= lt!590759 (containsKey!735 (toList!10635 lt!590647) k0!1164))))

(assert (=> d!143545 (= (contains!8803 lt!590647 k0!1164) lt!590760)))

(declare-fun b!1327968 () Bool)

(declare-fun lt!590758 () Unit!43649)

(assert (=> b!1327968 (= e!756974 lt!590758)))

(assert (=> b!1327968 (= lt!590758 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10635 lt!590647) k0!1164))))

(assert (=> b!1327968 (isDefined!518 (getValueByKey!709 (toList!10635 lt!590647) k0!1164))))

(declare-fun b!1327969 () Bool)

(declare-fun Unit!43652 () Unit!43649)

(assert (=> b!1327969 (= e!756974 Unit!43652)))

(declare-fun b!1327970 () Bool)

(assert (=> b!1327970 (= e!756975 (isDefined!518 (getValueByKey!709 (toList!10635 lt!590647) k0!1164)))))

(assert (= (and d!143545 c!126165) b!1327968))

(assert (= (and d!143545 (not c!126165)) b!1327969))

(assert (= (and d!143545 (not res!881023)) b!1327970))

(declare-fun m!1217395 () Bool)

(assert (=> d!143545 m!1217395))

(declare-fun m!1217397 () Bool)

(assert (=> b!1327968 m!1217397))

(declare-fun m!1217399 () Bool)

(assert (=> b!1327968 m!1217399))

(assert (=> b!1327968 m!1217399))

(declare-fun m!1217401 () Bool)

(assert (=> b!1327968 m!1217401))

(assert (=> b!1327970 m!1217399))

(assert (=> b!1327970 m!1217399))

(assert (=> b!1327970 m!1217401))

(assert (=> b!1327847 d!143545))

(declare-fun d!143547 () Bool)

(declare-fun e!756976 () Bool)

(assert (=> d!143547 e!756976))

(declare-fun res!881024 () Bool)

(assert (=> d!143547 (=> (not res!881024) (not e!756976))))

(declare-fun lt!590763 () ListLongMap!21239)

(assert (=> d!143547 (= res!881024 (contains!8803 lt!590763 (_1!11798 (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649))))))

(declare-fun lt!590762 () List!30725)

(assert (=> d!143547 (= lt!590763 (ListLongMap!21240 lt!590762))))

(declare-fun lt!590764 () Unit!43649)

(declare-fun lt!590761 () Unit!43649)

(assert (=> d!143547 (= lt!590764 lt!590761)))

(assert (=> d!143547 (= (getValueByKey!709 lt!590762 (_1!11798 (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649))) (Some!759 (_2!11798 (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649))))))

(assert (=> d!143547 (= lt!590761 (lemmaContainsTupThenGetReturnValue!359 lt!590762 (_1!11798 (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649)) (_2!11798 (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649))))))

(assert (=> d!143547 (= lt!590762 (insertStrictlySorted!488 (toList!10635 lt!590645) (_1!11798 (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649)) (_2!11798 (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649))))))

(assert (=> d!143547 (= (+!4678 lt!590645 (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649)) lt!590763)))

(declare-fun b!1327971 () Bool)

(declare-fun res!881025 () Bool)

(assert (=> b!1327971 (=> (not res!881025) (not e!756976))))

(assert (=> b!1327971 (= res!881025 (= (getValueByKey!709 (toList!10635 lt!590763) (_1!11798 (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649))) (Some!759 (_2!11798 (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649)))))))

(declare-fun b!1327972 () Bool)

(assert (=> b!1327972 (= e!756976 (contains!8806 (toList!10635 lt!590763) (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649)))))

(assert (= (and d!143547 res!881024) b!1327971))

(assert (= (and b!1327971 res!881025) b!1327972))

(declare-fun m!1217403 () Bool)

(assert (=> d!143547 m!1217403))

(declare-fun m!1217405 () Bool)

(assert (=> d!143547 m!1217405))

(declare-fun m!1217407 () Bool)

(assert (=> d!143547 m!1217407))

(declare-fun m!1217409 () Bool)

(assert (=> d!143547 m!1217409))

(declare-fun m!1217411 () Bool)

(assert (=> b!1327971 m!1217411))

(declare-fun m!1217413 () Bool)

(assert (=> b!1327972 m!1217413))

(assert (=> b!1327847 d!143547))

(declare-fun d!143549 () Bool)

(declare-fun e!756977 () Bool)

(assert (=> d!143549 e!756977))

(declare-fun res!881026 () Bool)

(assert (=> d!143549 (=> (not res!881026) (not e!756977))))

(declare-fun lt!590767 () ListLongMap!21239)

(assert (=> d!143549 (= res!881026 (contains!8803 lt!590767 (_1!11798 lt!590652)))))

(declare-fun lt!590766 () List!30725)

(assert (=> d!143549 (= lt!590767 (ListLongMap!21240 lt!590766))))

(declare-fun lt!590768 () Unit!43649)

(declare-fun lt!590765 () Unit!43649)

(assert (=> d!143549 (= lt!590768 lt!590765)))

(assert (=> d!143549 (= (getValueByKey!709 lt!590766 (_1!11798 lt!590652)) (Some!759 (_2!11798 lt!590652)))))

(assert (=> d!143549 (= lt!590765 (lemmaContainsTupThenGetReturnValue!359 lt!590766 (_1!11798 lt!590652) (_2!11798 lt!590652)))))

(assert (=> d!143549 (= lt!590766 (insertStrictlySorted!488 (toList!10635 lt!590645) (_1!11798 lt!590652) (_2!11798 lt!590652)))))

(assert (=> d!143549 (= (+!4678 lt!590645 lt!590652) lt!590767)))

(declare-fun b!1327973 () Bool)

(declare-fun res!881027 () Bool)

(assert (=> b!1327973 (=> (not res!881027) (not e!756977))))

(assert (=> b!1327973 (= res!881027 (= (getValueByKey!709 (toList!10635 lt!590767) (_1!11798 lt!590652)) (Some!759 (_2!11798 lt!590652))))))

(declare-fun b!1327974 () Bool)

(assert (=> b!1327974 (= e!756977 (contains!8806 (toList!10635 lt!590767) lt!590652))))

(assert (= (and d!143549 res!881026) b!1327973))

(assert (= (and b!1327973 res!881027) b!1327974))

(declare-fun m!1217415 () Bool)

(assert (=> d!143549 m!1217415))

(declare-fun m!1217417 () Bool)

(assert (=> d!143549 m!1217417))

(declare-fun m!1217419 () Bool)

(assert (=> d!143549 m!1217419))

(declare-fun m!1217421 () Bool)

(assert (=> d!143549 m!1217421))

(declare-fun m!1217423 () Bool)

(assert (=> b!1327973 m!1217423))

(declare-fun m!1217425 () Bool)

(assert (=> b!1327974 m!1217425))

(assert (=> b!1327847 d!143549))

(declare-fun d!143551 () Bool)

(assert (=> d!143551 (contains!8803 (+!4678 lt!590651 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-fun lt!590771 () Unit!43649)

(declare-fun choose!1954 (ListLongMap!21239 (_ BitVec 64) V!53569 (_ BitVec 64)) Unit!43649)

(assert (=> d!143551 (= lt!590771 (choose!1954 lt!590651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> d!143551 (contains!8803 lt!590651 k0!1164)))

(assert (=> d!143551 (= (addStillContains!1170 lt!590651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164) lt!590771)))

(declare-fun bs!37963 () Bool)

(assert (= bs!37963 d!143551))

(assert (=> bs!37963 m!1217197))

(assert (=> bs!37963 m!1217197))

(assert (=> bs!37963 m!1217199))

(declare-fun m!1217427 () Bool)

(assert (=> bs!37963 m!1217427))

(assert (=> bs!37963 m!1217193))

(assert (=> b!1327847 d!143551))

(declare-fun d!143553 () Bool)

(declare-fun e!756979 () Bool)

(assert (=> d!143553 e!756979))

(declare-fun res!881028 () Bool)

(assert (=> d!143553 (=> res!881028 e!756979)))

(declare-fun lt!590775 () Bool)

(assert (=> d!143553 (= res!881028 (not lt!590775))))

(declare-fun lt!590774 () Bool)

(assert (=> d!143553 (= lt!590775 lt!590774)))

(declare-fun lt!590772 () Unit!43649)

(declare-fun e!756978 () Unit!43649)

(assert (=> d!143553 (= lt!590772 e!756978)))

(declare-fun c!126166 () Bool)

(assert (=> d!143553 (= c!126166 lt!590774)))

(assert (=> d!143553 (= lt!590774 (containsKey!735 (toList!10635 lt!590651) k0!1164))))

(assert (=> d!143553 (= (contains!8803 lt!590651 k0!1164) lt!590775)))

(declare-fun b!1327976 () Bool)

(declare-fun lt!590773 () Unit!43649)

(assert (=> b!1327976 (= e!756978 lt!590773)))

(assert (=> b!1327976 (= lt!590773 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10635 lt!590651) k0!1164))))

(assert (=> b!1327976 (isDefined!518 (getValueByKey!709 (toList!10635 lt!590651) k0!1164))))

(declare-fun b!1327977 () Bool)

(declare-fun Unit!43653 () Unit!43649)

(assert (=> b!1327977 (= e!756978 Unit!43653)))

(declare-fun b!1327978 () Bool)

(assert (=> b!1327978 (= e!756979 (isDefined!518 (getValueByKey!709 (toList!10635 lt!590651) k0!1164)))))

(assert (= (and d!143553 c!126166) b!1327976))

(assert (= (and d!143553 (not c!126166)) b!1327977))

(assert (= (and d!143553 (not res!881028)) b!1327978))

(declare-fun m!1217429 () Bool)

(assert (=> d!143553 m!1217429))

(declare-fun m!1217431 () Bool)

(assert (=> b!1327976 m!1217431))

(declare-fun m!1217433 () Bool)

(assert (=> b!1327976 m!1217433))

(assert (=> b!1327976 m!1217433))

(declare-fun m!1217435 () Bool)

(assert (=> b!1327976 m!1217435))

(assert (=> b!1327978 m!1217433))

(assert (=> b!1327978 m!1217433))

(assert (=> b!1327978 m!1217435))

(assert (=> b!1327847 d!143553))

(declare-fun d!143555 () Bool)

(declare-fun e!756981 () Bool)

(assert (=> d!143555 e!756981))

(declare-fun res!881029 () Bool)

(assert (=> d!143555 (=> res!881029 e!756981)))

(declare-fun lt!590779 () Bool)

(assert (=> d!143555 (= res!881029 (not lt!590779))))

(declare-fun lt!590778 () Bool)

(assert (=> d!143555 (= lt!590779 lt!590778)))

(declare-fun lt!590776 () Unit!43649)

(declare-fun e!756980 () Unit!43649)

(assert (=> d!143555 (= lt!590776 e!756980)))

(declare-fun c!126167 () Bool)

(assert (=> d!143555 (= c!126167 lt!590778)))

(assert (=> d!143555 (= lt!590778 (containsKey!735 (toList!10635 (+!4678 lt!590651 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (=> d!143555 (= (contains!8803 (+!4678 lt!590651 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164) lt!590779)))

(declare-fun b!1327979 () Bool)

(declare-fun lt!590777 () Unit!43649)

(assert (=> b!1327979 (= e!756980 lt!590777)))

(assert (=> b!1327979 (= lt!590777 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10635 (+!4678 lt!590651 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (=> b!1327979 (isDefined!518 (getValueByKey!709 (toList!10635 (+!4678 lt!590651 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-fun b!1327980 () Bool)

(declare-fun Unit!43654 () Unit!43649)

(assert (=> b!1327980 (= e!756980 Unit!43654)))

(declare-fun b!1327981 () Bool)

(assert (=> b!1327981 (= e!756981 (isDefined!518 (getValueByKey!709 (toList!10635 (+!4678 lt!590651 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164)))))

(assert (= (and d!143555 c!126167) b!1327979))

(assert (= (and d!143555 (not c!126167)) b!1327980))

(assert (= (and d!143555 (not res!881029)) b!1327981))

(declare-fun m!1217437 () Bool)

(assert (=> d!143555 m!1217437))

(declare-fun m!1217439 () Bool)

(assert (=> b!1327979 m!1217439))

(declare-fun m!1217441 () Bool)

(assert (=> b!1327979 m!1217441))

(assert (=> b!1327979 m!1217441))

(declare-fun m!1217443 () Bool)

(assert (=> b!1327979 m!1217443))

(assert (=> b!1327981 m!1217441))

(assert (=> b!1327981 m!1217441))

(assert (=> b!1327981 m!1217443))

(assert (=> b!1327847 d!143555))

(declare-fun d!143557 () Bool)

(assert (=> d!143557 (contains!8803 (+!4678 lt!590645 (tuple2!23575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) k0!1164)))

(declare-fun lt!590780 () Unit!43649)

(assert (=> d!143557 (= lt!590780 (choose!1954 lt!590645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> d!143557 (contains!8803 lt!590645 k0!1164)))

(assert (=> d!143557 (= (addStillContains!1170 lt!590645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164) lt!590780)))

(declare-fun bs!37964 () Bool)

(assert (= bs!37964 d!143557))

(declare-fun m!1217445 () Bool)

(assert (=> bs!37964 m!1217445))

(assert (=> bs!37964 m!1217445))

(declare-fun m!1217447 () Bool)

(assert (=> bs!37964 m!1217447))

(declare-fun m!1217449 () Bool)

(assert (=> bs!37964 m!1217449))

(assert (=> bs!37964 m!1217185))

(assert (=> b!1327847 d!143557))

(declare-fun d!143559 () Bool)

(declare-fun e!756982 () Bool)

(assert (=> d!143559 e!756982))

(declare-fun res!881030 () Bool)

(assert (=> d!143559 (=> (not res!881030) (not e!756982))))

(declare-fun lt!590783 () ListLongMap!21239)

(assert (=> d!143559 (= res!881030 (contains!8803 lt!590783 (_1!11798 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!590782 () List!30725)

(assert (=> d!143559 (= lt!590783 (ListLongMap!21240 lt!590782))))

(declare-fun lt!590784 () Unit!43649)

(declare-fun lt!590781 () Unit!43649)

(assert (=> d!143559 (= lt!590784 lt!590781)))

(assert (=> d!143559 (= (getValueByKey!709 lt!590782 (_1!11798 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!759 (_2!11798 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143559 (= lt!590781 (lemmaContainsTupThenGetReturnValue!359 lt!590782 (_1!11798 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11798 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143559 (= lt!590782 (insertStrictlySorted!488 (toList!10635 lt!590651) (_1!11798 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11798 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143559 (= (+!4678 lt!590651 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!590783)))

(declare-fun b!1327982 () Bool)

(declare-fun res!881031 () Bool)

(assert (=> b!1327982 (=> (not res!881031) (not e!756982))))

(assert (=> b!1327982 (= res!881031 (= (getValueByKey!709 (toList!10635 lt!590783) (_1!11798 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!759 (_2!11798 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1327983 () Bool)

(assert (=> b!1327983 (= e!756982 (contains!8806 (toList!10635 lt!590783) (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!143559 res!881030) b!1327982))

(assert (= (and b!1327982 res!881031) b!1327983))

(declare-fun m!1217451 () Bool)

(assert (=> d!143559 m!1217451))

(declare-fun m!1217453 () Bool)

(assert (=> d!143559 m!1217453))

(declare-fun m!1217455 () Bool)

(assert (=> d!143559 m!1217455))

(declare-fun m!1217457 () Bool)

(assert (=> d!143559 m!1217457))

(declare-fun m!1217459 () Bool)

(assert (=> b!1327982 m!1217459))

(declare-fun m!1217461 () Bool)

(assert (=> b!1327983 m!1217461))

(assert (=> b!1327847 d!143559))

(declare-fun d!143561 () Bool)

(declare-fun e!756984 () Bool)

(assert (=> d!143561 e!756984))

(declare-fun res!881032 () Bool)

(assert (=> d!143561 (=> res!881032 e!756984)))

(declare-fun lt!590788 () Bool)

(assert (=> d!143561 (= res!881032 (not lt!590788))))

(declare-fun lt!590787 () Bool)

(assert (=> d!143561 (= lt!590788 lt!590787)))

(declare-fun lt!590785 () Unit!43649)

(declare-fun e!756983 () Unit!43649)

(assert (=> d!143561 (= lt!590785 e!756983)))

(declare-fun c!126168 () Bool)

(assert (=> d!143561 (= c!126168 lt!590787)))

(assert (=> d!143561 (= lt!590787 (containsKey!735 (toList!10635 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (=> d!143561 (= (contains!8803 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k0!1164) lt!590788)))

(declare-fun b!1327984 () Bool)

(declare-fun lt!590786 () Unit!43649)

(assert (=> b!1327984 (= e!756983 lt!590786)))

(assert (=> b!1327984 (= lt!590786 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10635 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (=> b!1327984 (isDefined!518 (getValueByKey!709 (toList!10635 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-fun b!1327985 () Bool)

(declare-fun Unit!43655 () Unit!43649)

(assert (=> b!1327985 (= e!756983 Unit!43655)))

(declare-fun b!1327986 () Bool)

(assert (=> b!1327986 (= e!756984 (isDefined!518 (getValueByKey!709 (toList!10635 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143561 c!126168) b!1327984))

(assert (= (and d!143561 (not c!126168)) b!1327985))

(assert (= (and d!143561 (not res!881032)) b!1327986))

(declare-fun m!1217463 () Bool)

(assert (=> d!143561 m!1217463))

(declare-fun m!1217465 () Bool)

(assert (=> b!1327984 m!1217465))

(declare-fun m!1217467 () Bool)

(assert (=> b!1327984 m!1217467))

(assert (=> b!1327984 m!1217467))

(declare-fun m!1217469 () Bool)

(assert (=> b!1327984 m!1217469))

(assert (=> b!1327986 m!1217467))

(assert (=> b!1327986 m!1217467))

(assert (=> b!1327986 m!1217469))

(assert (=> b!1327847 d!143561))

(declare-fun d!143563 () Bool)

(declare-fun e!756999 () Bool)

(assert (=> d!143563 e!756999))

(declare-fun res!881044 () Bool)

(assert (=> d!143563 (=> (not res!881044) (not e!756999))))

(declare-fun lt!590805 () ListLongMap!21239)

(assert (=> d!143563 (= res!881044 (not (contains!8803 lt!590805 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!757000 () ListLongMap!21239)

(assert (=> d!143563 (= lt!590805 e!757000)))

(declare-fun c!126180 () Bool)

(assert (=> d!143563 (= c!126180 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43870 _keys!1609)))))

(assert (=> d!143563 (validMask!0 mask!2019)))

(assert (=> d!143563 (= (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!590805)))

(declare-fun b!1328011 () Bool)

(declare-fun res!881041 () Bool)

(assert (=> b!1328011 (=> (not res!881041) (not e!756999))))

(assert (=> b!1328011 (= res!881041 (not (contains!8803 lt!590805 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1328012 () Bool)

(declare-fun lt!590809 () Unit!43649)

(declare-fun lt!590808 () Unit!43649)

(assert (=> b!1328012 (= lt!590809 lt!590808)))

(declare-fun lt!590803 () (_ BitVec 64))

(declare-fun lt!590807 () ListLongMap!21239)

(declare-fun lt!590804 () V!53569)

(declare-fun lt!590806 () (_ BitVec 64))

(assert (=> b!1328012 (not (contains!8803 (+!4678 lt!590807 (tuple2!23575 lt!590803 lt!590804)) lt!590806))))

(declare-fun addStillNotContains!495 (ListLongMap!21239 (_ BitVec 64) V!53569 (_ BitVec 64)) Unit!43649)

(assert (=> b!1328012 (= lt!590808 (addStillNotContains!495 lt!590807 lt!590803 lt!590804 lt!590806))))

(assert (=> b!1328012 (= lt!590806 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1328012 (= lt!590804 (get!21852 (select (arr!43318 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3632 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1328012 (= lt!590803 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun call!64807 () ListLongMap!21239)

(assert (=> b!1328012 (= lt!590807 call!64807)))

(declare-fun e!757003 () ListLongMap!21239)

(assert (=> b!1328012 (= e!757003 (+!4678 call!64807 (tuple2!23575 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21852 (select (arr!43318 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3632 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1328013 () Bool)

(assert (=> b!1328013 (= e!757003 call!64807)))

(declare-fun b!1328014 () Bool)

(assert (=> b!1328014 (= e!757000 e!757003)))

(declare-fun c!126179 () Bool)

(assert (=> b!1328014 (= c!126179 (validKeyInArray!0 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1328015 () Bool)

(declare-fun e!757004 () Bool)

(declare-fun isEmpty!1082 (ListLongMap!21239) Bool)

(assert (=> b!1328015 (= e!757004 (isEmpty!1082 lt!590805))))

(declare-fun b!1328016 () Bool)

(declare-fun e!757005 () Bool)

(assert (=> b!1328016 (= e!757005 (validKeyInArray!0 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1328016 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))

(declare-fun b!1328017 () Bool)

(declare-fun e!757001 () Bool)

(assert (=> b!1328017 (= e!757001 e!757004)))

(declare-fun c!126177 () Bool)

(assert (=> b!1328017 (= c!126177 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43870 _keys!1609)))))

(declare-fun b!1328018 () Bool)

(assert (=> b!1328018 (= e!757004 (= lt!590805 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun b!1328019 () Bool)

(declare-fun e!757002 () Bool)

(assert (=> b!1328019 (= e!757001 e!757002)))

(assert (=> b!1328019 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43870 _keys!1609)))))

(declare-fun res!881043 () Bool)

(assert (=> b!1328019 (= res!881043 (contains!8803 lt!590805 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1328019 (=> (not res!881043) (not e!757002))))

(declare-fun b!1328020 () Bool)

(assert (=> b!1328020 (= e!757000 (ListLongMap!21240 Nil!30722))))

(declare-fun b!1328021 () Bool)

(assert (=> b!1328021 (= e!756999 e!757001)))

(declare-fun c!126178 () Bool)

(assert (=> b!1328021 (= c!126178 e!757005)))

(declare-fun res!881042 () Bool)

(assert (=> b!1328021 (=> (not res!881042) (not e!757005))))

(assert (=> b!1328021 (= res!881042 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43870 _keys!1609)))))

(declare-fun b!1328022 () Bool)

(assert (=> b!1328022 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43870 _keys!1609)))))

(assert (=> b!1328022 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43869 _values!1337)))))

(declare-fun apply!1039 (ListLongMap!21239 (_ BitVec 64)) V!53569)

(assert (=> b!1328022 (= e!757002 (= (apply!1039 lt!590805 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21852 (select (arr!43318 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3632 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!64804 () Bool)

(assert (=> bm!64804 (= call!64807 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(assert (= (and d!143563 c!126180) b!1328020))

(assert (= (and d!143563 (not c!126180)) b!1328014))

(assert (= (and b!1328014 c!126179) b!1328012))

(assert (= (and b!1328014 (not c!126179)) b!1328013))

(assert (= (or b!1328012 b!1328013) bm!64804))

(assert (= (and d!143563 res!881044) b!1328011))

(assert (= (and b!1328011 res!881041) b!1328021))

(assert (= (and b!1328021 res!881042) b!1328016))

(assert (= (and b!1328021 c!126178) b!1328019))

(assert (= (and b!1328021 (not c!126178)) b!1328017))

(assert (= (and b!1328019 res!881043) b!1328022))

(assert (= (and b!1328017 c!126177) b!1328018))

(assert (= (and b!1328017 (not c!126177)) b!1328015))

(declare-fun b_lambda!23809 () Bool)

(assert (=> (not b_lambda!23809) (not b!1328012)))

(assert (=> b!1328012 t!44716))

(declare-fun b_and!49167 () Bool)

(assert (= b_and!49157 (and (=> t!44716 result!24655) b_and!49167)))

(declare-fun b_lambda!23811 () Bool)

(assert (=> (not b_lambda!23811) (not b!1328022)))

(assert (=> b!1328022 t!44716))

(declare-fun b_and!49169 () Bool)

(assert (= b_and!49167 (and (=> t!44716 result!24655) b_and!49169)))

(declare-fun m!1217471 () Bool)

(assert (=> d!143563 m!1217471))

(assert (=> d!143563 m!1217223))

(declare-fun m!1217473 () Bool)

(assert (=> b!1328019 m!1217473))

(assert (=> b!1328019 m!1217473))

(declare-fun m!1217475 () Bool)

(assert (=> b!1328019 m!1217475))

(declare-fun m!1217477 () Bool)

(assert (=> b!1328015 m!1217477))

(assert (=> b!1328014 m!1217473))

(assert (=> b!1328014 m!1217473))

(declare-fun m!1217479 () Bool)

(assert (=> b!1328014 m!1217479))

(assert (=> b!1328022 m!1217473))

(declare-fun m!1217481 () Bool)

(assert (=> b!1328022 m!1217481))

(declare-fun m!1217483 () Bool)

(assert (=> b!1328022 m!1217483))

(assert (=> b!1328022 m!1217179))

(declare-fun m!1217485 () Bool)

(assert (=> b!1328022 m!1217485))

(assert (=> b!1328022 m!1217179))

(assert (=> b!1328022 m!1217473))

(assert (=> b!1328022 m!1217483))

(declare-fun m!1217487 () Bool)

(assert (=> b!1328018 m!1217487))

(assert (=> b!1328016 m!1217473))

(assert (=> b!1328016 m!1217473))

(assert (=> b!1328016 m!1217479))

(declare-fun m!1217489 () Bool)

(assert (=> b!1328011 m!1217489))

(declare-fun m!1217491 () Bool)

(assert (=> b!1328012 m!1217491))

(assert (=> b!1328012 m!1217483))

(assert (=> b!1328012 m!1217179))

(assert (=> b!1328012 m!1217485))

(declare-fun m!1217493 () Bool)

(assert (=> b!1328012 m!1217493))

(declare-fun m!1217495 () Bool)

(assert (=> b!1328012 m!1217495))

(assert (=> b!1328012 m!1217179))

(declare-fun m!1217497 () Bool)

(assert (=> b!1328012 m!1217497))

(assert (=> b!1328012 m!1217473))

(assert (=> b!1328012 m!1217483))

(assert (=> b!1328012 m!1217493))

(assert (=> bm!64804 m!1217487))

(assert (=> b!1327847 d!143563))

(declare-fun d!143565 () Bool)

(assert (=> d!143565 (contains!8803 lt!590645 k0!1164)))

(declare-fun lt!590810 () Unit!43649)

(assert (=> d!143565 (= lt!590810 (choose!1953 k0!1164 (select (arr!43319 _keys!1609) from!2000) lt!590649 lt!590645))))

(assert (=> d!143565 (contains!8803 (+!4678 lt!590645 (tuple2!23575 (select (arr!43319 _keys!1609) from!2000) lt!590649)) k0!1164)))

(assert (=> d!143565 (= (lemmaInListMapAfterAddingDiffThenInBefore!228 k0!1164 (select (arr!43319 _keys!1609) from!2000) lt!590649 lt!590645) lt!590810)))

(declare-fun bs!37965 () Bool)

(assert (= bs!37965 d!143565))

(assert (=> bs!37965 m!1217185))

(assert (=> bs!37965 m!1217169))

(declare-fun m!1217499 () Bool)

(assert (=> bs!37965 m!1217499))

(assert (=> bs!37965 m!1217203))

(assert (=> bs!37965 m!1217203))

(declare-fun m!1217501 () Bool)

(assert (=> bs!37965 m!1217501))

(assert (=> b!1327847 d!143565))

(declare-fun d!143567 () Bool)

(assert (=> d!143567 (contains!8803 lt!590654 k0!1164)))

(declare-fun lt!590811 () Unit!43649)

(assert (=> d!143567 (= lt!590811 (choose!1953 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590654))))

(assert (=> d!143567 (contains!8803 (+!4678 lt!590654 (tuple2!23575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) k0!1164)))

(assert (=> d!143567 (= (lemmaInListMapAfterAddingDiffThenInBefore!228 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590654) lt!590811)))

(declare-fun bs!37966 () Bool)

(assert (= bs!37966 d!143567))

(assert (=> bs!37966 m!1217207))

(declare-fun m!1217503 () Bool)

(assert (=> bs!37966 m!1217503))

(declare-fun m!1217505 () Bool)

(assert (=> bs!37966 m!1217505))

(assert (=> bs!37966 m!1217505))

(declare-fun m!1217507 () Bool)

(assert (=> bs!37966 m!1217507))

(assert (=> b!1327847 d!143567))

(declare-fun bm!64819 () Bool)

(declare-fun call!64828 () Bool)

(declare-fun lt!590872 () ListLongMap!21239)

(assert (=> bm!64819 (= call!64828 (contains!8803 lt!590872 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64820 () Bool)

(declare-fun call!64822 () Bool)

(assert (=> bm!64820 (= call!64822 (contains!8803 lt!590872 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328065 () Bool)

(declare-fun e!757038 () Bool)

(assert (=> b!1328065 (= e!757038 (validKeyInArray!0 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1328066 () Bool)

(declare-fun e!757043 () Bool)

(declare-fun e!757037 () Bool)

(assert (=> b!1328066 (= e!757043 e!757037)))

(declare-fun res!881067 () Bool)

(assert (=> b!1328066 (= res!881067 call!64822)))

(assert (=> b!1328066 (=> (not res!881067) (not e!757037))))

(declare-fun e!757035 () Bool)

(declare-fun b!1328067 () Bool)

(assert (=> b!1328067 (= e!757035 (= (apply!1039 lt!590872 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21852 (select (arr!43318 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3632 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1328067 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43869 _values!1337)))))

(assert (=> b!1328067 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43870 _keys!1609)))))

(declare-fun d!143569 () Bool)

(declare-fun e!757041 () Bool)

(assert (=> d!143569 e!757041))

(declare-fun res!881071 () Bool)

(assert (=> d!143569 (=> (not res!881071) (not e!757041))))

(assert (=> d!143569 (= res!881071 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43870 _keys!1609)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43870 _keys!1609)))))))

(declare-fun lt!590860 () ListLongMap!21239)

(assert (=> d!143569 (= lt!590872 lt!590860)))

(declare-fun lt!590862 () Unit!43649)

(declare-fun e!757032 () Unit!43649)

(assert (=> d!143569 (= lt!590862 e!757032)))

(declare-fun c!126195 () Bool)

(declare-fun e!757033 () Bool)

(assert (=> d!143569 (= c!126195 e!757033)))

(declare-fun res!881066 () Bool)

(assert (=> d!143569 (=> (not res!881066) (not e!757033))))

(assert (=> d!143569 (= res!881066 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43870 _keys!1609)))))

(declare-fun e!757042 () ListLongMap!21239)

(assert (=> d!143569 (= lt!590860 e!757042)))

(declare-fun c!126196 () Bool)

(assert (=> d!143569 (= c!126196 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143569 (validMask!0 mask!2019)))

(assert (=> d!143569 (= (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!590872)))

(declare-fun b!1328068 () Bool)

(declare-fun e!757040 () ListLongMap!21239)

(declare-fun call!64827 () ListLongMap!21239)

(assert (=> b!1328068 (= e!757040 call!64827)))

(declare-fun b!1328069 () Bool)

(assert (=> b!1328069 (= e!757042 e!757040)))

(declare-fun c!126193 () Bool)

(assert (=> b!1328069 (= c!126193 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1328070 () Bool)

(declare-fun res!881063 () Bool)

(assert (=> b!1328070 (=> (not res!881063) (not e!757041))))

(declare-fun e!757044 () Bool)

(assert (=> b!1328070 (= res!881063 e!757044)))

(declare-fun c!126197 () Bool)

(assert (=> b!1328070 (= c!126197 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64821 () Bool)

(declare-fun call!64825 () ListLongMap!21239)

(declare-fun call!64823 () ListLongMap!21239)

(assert (=> bm!64821 (= call!64825 call!64823)))

(declare-fun b!1328071 () Bool)

(declare-fun res!881068 () Bool)

(assert (=> b!1328071 (=> (not res!881068) (not e!757041))))

(declare-fun e!757034 () Bool)

(assert (=> b!1328071 (= res!881068 e!757034)))

(declare-fun res!881070 () Bool)

(assert (=> b!1328071 (=> res!881070 e!757034)))

(assert (=> b!1328071 (= res!881070 (not e!757038))))

(declare-fun res!881069 () Bool)

(assert (=> b!1328071 (=> (not res!881069) (not e!757038))))

(assert (=> b!1328071 (= res!881069 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43870 _keys!1609)))))

(declare-fun b!1328072 () Bool)

(declare-fun e!757036 () Bool)

(assert (=> b!1328072 (= e!757036 (= (apply!1039 lt!590872 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun bm!64822 () Bool)

(declare-fun call!64824 () ListLongMap!21239)

(assert (=> bm!64822 (= call!64827 call!64824)))

(declare-fun bm!64823 () Bool)

(declare-fun call!64826 () ListLongMap!21239)

(assert (=> bm!64823 (= call!64823 call!64826)))

(declare-fun b!1328073 () Bool)

(assert (=> b!1328073 (= e!757041 e!757043)))

(declare-fun c!126194 () Bool)

(assert (=> b!1328073 (= c!126194 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1328074 () Bool)

(assert (=> b!1328074 (= e!757037 (= (apply!1039 lt!590872 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun bm!64824 () Bool)

(assert (=> bm!64824 (= call!64826 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1328075 () Bool)

(assert (=> b!1328075 (= e!757042 (+!4678 call!64824 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun b!1328076 () Bool)

(declare-fun e!757039 () ListLongMap!21239)

(assert (=> b!1328076 (= e!757039 call!64825)))

(declare-fun b!1328077 () Bool)

(assert (=> b!1328077 (= e!757044 (not call!64828))))

(declare-fun b!1328078 () Bool)

(assert (=> b!1328078 (= e!757039 call!64827)))

(declare-fun b!1328079 () Bool)

(declare-fun lt!590874 () Unit!43649)

(assert (=> b!1328079 (= e!757032 lt!590874)))

(declare-fun lt!590873 () ListLongMap!21239)

(assert (=> b!1328079 (= lt!590873 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590856 () (_ BitVec 64))

(assert (=> b!1328079 (= lt!590856 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590869 () (_ BitVec 64))

(assert (=> b!1328079 (= lt!590869 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590877 () Unit!43649)

(assert (=> b!1328079 (= lt!590877 (addStillContains!1170 lt!590873 lt!590856 zeroValue!1279 lt!590869))))

(assert (=> b!1328079 (contains!8803 (+!4678 lt!590873 (tuple2!23575 lt!590856 zeroValue!1279)) lt!590869)))

(declare-fun lt!590876 () Unit!43649)

(assert (=> b!1328079 (= lt!590876 lt!590877)))

(declare-fun lt!590866 () ListLongMap!21239)

(assert (=> b!1328079 (= lt!590866 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590861 () (_ BitVec 64))

(assert (=> b!1328079 (= lt!590861 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590867 () (_ BitVec 64))

(assert (=> b!1328079 (= lt!590867 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590859 () Unit!43649)

(declare-fun addApplyDifferent!568 (ListLongMap!21239 (_ BitVec 64) V!53569 (_ BitVec 64)) Unit!43649)

(assert (=> b!1328079 (= lt!590859 (addApplyDifferent!568 lt!590866 lt!590861 minValue!1279 lt!590867))))

(assert (=> b!1328079 (= (apply!1039 (+!4678 lt!590866 (tuple2!23575 lt!590861 minValue!1279)) lt!590867) (apply!1039 lt!590866 lt!590867))))

(declare-fun lt!590858 () Unit!43649)

(assert (=> b!1328079 (= lt!590858 lt!590859)))

(declare-fun lt!590870 () ListLongMap!21239)

(assert (=> b!1328079 (= lt!590870 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590864 () (_ BitVec 64))

(assert (=> b!1328079 (= lt!590864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590857 () (_ BitVec 64))

(assert (=> b!1328079 (= lt!590857 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590865 () Unit!43649)

(assert (=> b!1328079 (= lt!590865 (addApplyDifferent!568 lt!590870 lt!590864 zeroValue!1279 lt!590857))))

(assert (=> b!1328079 (= (apply!1039 (+!4678 lt!590870 (tuple2!23575 lt!590864 zeroValue!1279)) lt!590857) (apply!1039 lt!590870 lt!590857))))

(declare-fun lt!590868 () Unit!43649)

(assert (=> b!1328079 (= lt!590868 lt!590865)))

(declare-fun lt!590875 () ListLongMap!21239)

(assert (=> b!1328079 (= lt!590875 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590863 () (_ BitVec 64))

(assert (=> b!1328079 (= lt!590863 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590871 () (_ BitVec 64))

(assert (=> b!1328079 (= lt!590871 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(assert (=> b!1328079 (= lt!590874 (addApplyDifferent!568 lt!590875 lt!590863 minValue!1279 lt!590871))))

(assert (=> b!1328079 (= (apply!1039 (+!4678 lt!590875 (tuple2!23575 lt!590863 minValue!1279)) lt!590871) (apply!1039 lt!590875 lt!590871))))

(declare-fun b!1328080 () Bool)

(assert (=> b!1328080 (= e!757033 (validKeyInArray!0 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun bm!64825 () Bool)

(assert (=> bm!64825 (= call!64824 (+!4678 (ite c!126196 call!64826 (ite c!126193 call!64823 call!64825)) (ite (or c!126196 c!126193) (tuple2!23575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1328081 () Bool)

(declare-fun Unit!43656 () Unit!43649)

(assert (=> b!1328081 (= e!757032 Unit!43656)))

(declare-fun b!1328082 () Bool)

(declare-fun c!126198 () Bool)

(assert (=> b!1328082 (= c!126198 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1328082 (= e!757040 e!757039)))

(declare-fun b!1328083 () Bool)

(assert (=> b!1328083 (= e!757044 e!757036)))

(declare-fun res!881065 () Bool)

(assert (=> b!1328083 (= res!881065 call!64828)))

(assert (=> b!1328083 (=> (not res!881065) (not e!757036))))

(declare-fun b!1328084 () Bool)

(assert (=> b!1328084 (= e!757034 e!757035)))

(declare-fun res!881064 () Bool)

(assert (=> b!1328084 (=> (not res!881064) (not e!757035))))

(assert (=> b!1328084 (= res!881064 (contains!8803 lt!590872 (select (arr!43319 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1328084 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43870 _keys!1609)))))

(declare-fun b!1328085 () Bool)

(assert (=> b!1328085 (= e!757043 (not call!64822))))

(assert (= (and d!143569 c!126196) b!1328075))

(assert (= (and d!143569 (not c!126196)) b!1328069))

(assert (= (and b!1328069 c!126193) b!1328068))

(assert (= (and b!1328069 (not c!126193)) b!1328082))

(assert (= (and b!1328082 c!126198) b!1328078))

(assert (= (and b!1328082 (not c!126198)) b!1328076))

(assert (= (or b!1328078 b!1328076) bm!64821))

(assert (= (or b!1328068 bm!64821) bm!64823))

(assert (= (or b!1328068 b!1328078) bm!64822))

(assert (= (or b!1328075 bm!64823) bm!64824))

(assert (= (or b!1328075 bm!64822) bm!64825))

(assert (= (and d!143569 res!881066) b!1328080))

(assert (= (and d!143569 c!126195) b!1328079))

(assert (= (and d!143569 (not c!126195)) b!1328081))

(assert (= (and d!143569 res!881071) b!1328071))

(assert (= (and b!1328071 res!881069) b!1328065))

(assert (= (and b!1328071 (not res!881070)) b!1328084))

(assert (= (and b!1328084 res!881064) b!1328067))

(assert (= (and b!1328071 res!881068) b!1328070))

(assert (= (and b!1328070 c!126197) b!1328083))

(assert (= (and b!1328070 (not c!126197)) b!1328077))

(assert (= (and b!1328083 res!881065) b!1328072))

(assert (= (or b!1328083 b!1328077) bm!64819))

(assert (= (and b!1328070 res!881063) b!1328073))

(assert (= (and b!1328073 c!126194) b!1328066))

(assert (= (and b!1328073 (not c!126194)) b!1328085))

(assert (= (and b!1328066 res!881067) b!1328074))

(assert (= (or b!1328066 b!1328085) bm!64820))

(declare-fun b_lambda!23813 () Bool)

(assert (=> (not b_lambda!23813) (not b!1328067)))

(assert (=> b!1328067 t!44716))

(declare-fun b_and!49171 () Bool)

(assert (= b_and!49169 (and (=> t!44716 result!24655) b_and!49171)))

(assert (=> b!1328067 m!1217483))

(assert (=> b!1328067 m!1217473))

(declare-fun m!1217509 () Bool)

(assert (=> b!1328067 m!1217509))

(assert (=> b!1328067 m!1217483))

(assert (=> b!1328067 m!1217179))

(assert (=> b!1328067 m!1217485))

(assert (=> b!1328067 m!1217473))

(assert (=> b!1328067 m!1217179))

(assert (=> b!1328065 m!1217473))

(assert (=> b!1328065 m!1217473))

(assert (=> b!1328065 m!1217479))

(assert (=> bm!64824 m!1217177))

(assert (=> d!143569 m!1217223))

(declare-fun m!1217511 () Bool)

(assert (=> bm!64825 m!1217511))

(assert (=> b!1328084 m!1217473))

(assert (=> b!1328084 m!1217473))

(declare-fun m!1217513 () Bool)

(assert (=> b!1328084 m!1217513))

(declare-fun m!1217515 () Bool)

(assert (=> b!1328079 m!1217515))

(declare-fun m!1217517 () Bool)

(assert (=> b!1328079 m!1217517))

(declare-fun m!1217519 () Bool)

(assert (=> b!1328079 m!1217519))

(assert (=> b!1328079 m!1217473))

(assert (=> b!1328079 m!1217515))

(assert (=> b!1328079 m!1217177))

(declare-fun m!1217521 () Bool)

(assert (=> b!1328079 m!1217521))

(declare-fun m!1217523 () Bool)

(assert (=> b!1328079 m!1217523))

(declare-fun m!1217525 () Bool)

(assert (=> b!1328079 m!1217525))

(declare-fun m!1217527 () Bool)

(assert (=> b!1328079 m!1217527))

(declare-fun m!1217529 () Bool)

(assert (=> b!1328079 m!1217529))

(assert (=> b!1328079 m!1217519))

(declare-fun m!1217531 () Bool)

(assert (=> b!1328079 m!1217531))

(declare-fun m!1217533 () Bool)

(assert (=> b!1328079 m!1217533))

(assert (=> b!1328079 m!1217529))

(declare-fun m!1217535 () Bool)

(assert (=> b!1328079 m!1217535))

(assert (=> b!1328079 m!1217533))

(declare-fun m!1217537 () Bool)

(assert (=> b!1328079 m!1217537))

(declare-fun m!1217539 () Bool)

(assert (=> b!1328079 m!1217539))

(declare-fun m!1217541 () Bool)

(assert (=> b!1328079 m!1217541))

(declare-fun m!1217543 () Bool)

(assert (=> b!1328079 m!1217543))

(declare-fun m!1217545 () Bool)

(assert (=> b!1328072 m!1217545))

(declare-fun m!1217547 () Bool)

(assert (=> bm!64819 m!1217547))

(assert (=> b!1328080 m!1217473))

(assert (=> b!1328080 m!1217473))

(assert (=> b!1328080 m!1217479))

(declare-fun m!1217549 () Bool)

(assert (=> b!1328075 m!1217549))

(declare-fun m!1217551 () Bool)

(assert (=> bm!64820 m!1217551))

(declare-fun m!1217553 () Bool)

(assert (=> b!1328074 m!1217553))

(assert (=> b!1327847 d!143569))

(declare-fun d!143571 () Bool)

(declare-fun e!757046 () Bool)

(assert (=> d!143571 e!757046))

(declare-fun res!881072 () Bool)

(assert (=> d!143571 (=> res!881072 e!757046)))

(declare-fun lt!590881 () Bool)

(assert (=> d!143571 (= res!881072 (not lt!590881))))

(declare-fun lt!590880 () Bool)

(assert (=> d!143571 (= lt!590881 lt!590880)))

(declare-fun lt!590878 () Unit!43649)

(declare-fun e!757045 () Unit!43649)

(assert (=> d!143571 (= lt!590878 e!757045)))

(declare-fun c!126199 () Bool)

(assert (=> d!143571 (= c!126199 lt!590880)))

(assert (=> d!143571 (= lt!590880 (containsKey!735 (toList!10635 lt!590654) k0!1164))))

(assert (=> d!143571 (= (contains!8803 lt!590654 k0!1164) lt!590881)))

(declare-fun b!1328086 () Bool)

(declare-fun lt!590879 () Unit!43649)

(assert (=> b!1328086 (= e!757045 lt!590879)))

(assert (=> b!1328086 (= lt!590879 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10635 lt!590654) k0!1164))))

(assert (=> b!1328086 (isDefined!518 (getValueByKey!709 (toList!10635 lt!590654) k0!1164))))

(declare-fun b!1328087 () Bool)

(declare-fun Unit!43657 () Unit!43649)

(assert (=> b!1328087 (= e!757045 Unit!43657)))

(declare-fun b!1328088 () Bool)

(assert (=> b!1328088 (= e!757046 (isDefined!518 (getValueByKey!709 (toList!10635 lt!590654) k0!1164)))))

(assert (= (and d!143571 c!126199) b!1328086))

(assert (= (and d!143571 (not c!126199)) b!1328087))

(assert (= (and d!143571 (not res!881072)) b!1328088))

(declare-fun m!1217555 () Bool)

(assert (=> d!143571 m!1217555))

(declare-fun m!1217557 () Bool)

(assert (=> b!1328086 m!1217557))

(declare-fun m!1217559 () Bool)

(assert (=> b!1328086 m!1217559))

(assert (=> b!1328086 m!1217559))

(declare-fun m!1217561 () Bool)

(assert (=> b!1328086 m!1217561))

(assert (=> b!1328088 m!1217559))

(assert (=> b!1328088 m!1217559))

(assert (=> b!1328088 m!1217561))

(assert (=> b!1327847 d!143571))

(declare-fun d!143573 () Bool)

(assert (=> d!143573 (= (validKeyInArray!0 (select (arr!43319 _keys!1609) from!2000)) (and (not (= (select (arr!43319 _keys!1609) from!2000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43319 _keys!1609) from!2000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1327846 d!143573))

(declare-fun d!143575 () Bool)

(declare-fun e!757048 () Bool)

(assert (=> d!143575 e!757048))

(declare-fun res!881073 () Bool)

(assert (=> d!143575 (=> res!881073 e!757048)))

(declare-fun lt!590885 () Bool)

(assert (=> d!143575 (= res!881073 (not lt!590885))))

(declare-fun lt!590884 () Bool)

(assert (=> d!143575 (= lt!590885 lt!590884)))

(declare-fun lt!590882 () Unit!43649)

(declare-fun e!757047 () Unit!43649)

(assert (=> d!143575 (= lt!590882 e!757047)))

(declare-fun c!126200 () Bool)

(assert (=> d!143575 (= c!126200 lt!590884)))

(assert (=> d!143575 (= lt!590884 (containsKey!735 (toList!10635 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> d!143575 (= (contains!8803 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164) lt!590885)))

(declare-fun b!1328089 () Bool)

(declare-fun lt!590883 () Unit!43649)

(assert (=> b!1328089 (= e!757047 lt!590883)))

(assert (=> b!1328089 (= lt!590883 (lemmaContainsKeyImpliesGetValueByKeyDefined!481 (toList!10635 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> b!1328089 (isDefined!518 (getValueByKey!709 (toList!10635 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun b!1328090 () Bool)

(declare-fun Unit!43658 () Unit!43649)

(assert (=> b!1328090 (= e!757047 Unit!43658)))

(declare-fun b!1328091 () Bool)

(assert (=> b!1328091 (= e!757048 (isDefined!518 (getValueByKey!709 (toList!10635 (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143575 c!126200) b!1328089))

(assert (= (and d!143575 (not c!126200)) b!1328090))

(assert (= (and d!143575 (not res!881073)) b!1328091))

(declare-fun m!1217563 () Bool)

(assert (=> d!143575 m!1217563))

(declare-fun m!1217565 () Bool)

(assert (=> b!1328089 m!1217565))

(declare-fun m!1217567 () Bool)

(assert (=> b!1328089 m!1217567))

(assert (=> b!1328089 m!1217567))

(declare-fun m!1217569 () Bool)

(assert (=> b!1328089 m!1217569))

(assert (=> b!1328091 m!1217567))

(assert (=> b!1328091 m!1217567))

(assert (=> b!1328091 m!1217569))

(assert (=> b!1327837 d!143575))

(declare-fun bm!64826 () Bool)

(declare-fun call!64835 () Bool)

(declare-fun lt!590902 () ListLongMap!21239)

(assert (=> bm!64826 (= call!64835 (contains!8803 lt!590902 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64827 () Bool)

(declare-fun call!64829 () Bool)

(assert (=> bm!64827 (= call!64829 (contains!8803 lt!590902 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328092 () Bool)

(declare-fun e!757055 () Bool)

(assert (=> b!1328092 (= e!757055 (validKeyInArray!0 (select (arr!43319 _keys!1609) from!2000)))))

(declare-fun b!1328093 () Bool)

(declare-fun e!757060 () Bool)

(declare-fun e!757054 () Bool)

(assert (=> b!1328093 (= e!757060 e!757054)))

(declare-fun res!881078 () Bool)

(assert (=> b!1328093 (= res!881078 call!64829)))

(assert (=> b!1328093 (=> (not res!881078) (not e!757054))))

(declare-fun b!1328094 () Bool)

(declare-fun e!757052 () Bool)

(assert (=> b!1328094 (= e!757052 (= (apply!1039 lt!590902 (select (arr!43319 _keys!1609) from!2000)) (get!21852 (select (arr!43318 _values!1337) from!2000) (dynLambda!3632 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1328094 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43869 _values!1337)))))

(assert (=> b!1328094 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43870 _keys!1609)))))

(declare-fun d!143577 () Bool)

(declare-fun e!757058 () Bool)

(assert (=> d!143577 e!757058))

(declare-fun res!881082 () Bool)

(assert (=> d!143577 (=> (not res!881082) (not e!757058))))

(assert (=> d!143577 (= res!881082 (or (bvsge from!2000 (size!43870 _keys!1609)) (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43870 _keys!1609)))))))

(declare-fun lt!590890 () ListLongMap!21239)

(assert (=> d!143577 (= lt!590902 lt!590890)))

(declare-fun lt!590892 () Unit!43649)

(declare-fun e!757049 () Unit!43649)

(assert (=> d!143577 (= lt!590892 e!757049)))

(declare-fun c!126203 () Bool)

(declare-fun e!757050 () Bool)

(assert (=> d!143577 (= c!126203 e!757050)))

(declare-fun res!881077 () Bool)

(assert (=> d!143577 (=> (not res!881077) (not e!757050))))

(assert (=> d!143577 (= res!881077 (bvslt from!2000 (size!43870 _keys!1609)))))

(declare-fun e!757059 () ListLongMap!21239)

(assert (=> d!143577 (= lt!590890 e!757059)))

(declare-fun c!126204 () Bool)

(assert (=> d!143577 (= c!126204 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143577 (validMask!0 mask!2019)))

(assert (=> d!143577 (= (getCurrentListMap!5612 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!590902)))

(declare-fun b!1328095 () Bool)

(declare-fun e!757057 () ListLongMap!21239)

(declare-fun call!64834 () ListLongMap!21239)

(assert (=> b!1328095 (= e!757057 call!64834)))

(declare-fun b!1328096 () Bool)

(assert (=> b!1328096 (= e!757059 e!757057)))

(declare-fun c!126201 () Bool)

(assert (=> b!1328096 (= c!126201 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1328097 () Bool)

(declare-fun res!881074 () Bool)

(assert (=> b!1328097 (=> (not res!881074) (not e!757058))))

(declare-fun e!757061 () Bool)

(assert (=> b!1328097 (= res!881074 e!757061)))

(declare-fun c!126205 () Bool)

(assert (=> b!1328097 (= c!126205 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64828 () Bool)

(declare-fun call!64832 () ListLongMap!21239)

(declare-fun call!64830 () ListLongMap!21239)

(assert (=> bm!64828 (= call!64832 call!64830)))

(declare-fun b!1328098 () Bool)

(declare-fun res!881079 () Bool)

(assert (=> b!1328098 (=> (not res!881079) (not e!757058))))

(declare-fun e!757051 () Bool)

(assert (=> b!1328098 (= res!881079 e!757051)))

(declare-fun res!881081 () Bool)

(assert (=> b!1328098 (=> res!881081 e!757051)))

(assert (=> b!1328098 (= res!881081 (not e!757055))))

(declare-fun res!881080 () Bool)

(assert (=> b!1328098 (=> (not res!881080) (not e!757055))))

(assert (=> b!1328098 (= res!881080 (bvslt from!2000 (size!43870 _keys!1609)))))

(declare-fun b!1328099 () Bool)

(declare-fun e!757053 () Bool)

(assert (=> b!1328099 (= e!757053 (= (apply!1039 lt!590902 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun bm!64829 () Bool)

(declare-fun call!64831 () ListLongMap!21239)

(assert (=> bm!64829 (= call!64834 call!64831)))

(declare-fun bm!64830 () Bool)

(declare-fun call!64833 () ListLongMap!21239)

(assert (=> bm!64830 (= call!64830 call!64833)))

(declare-fun b!1328100 () Bool)

(assert (=> b!1328100 (= e!757058 e!757060)))

(declare-fun c!126202 () Bool)

(assert (=> b!1328100 (= c!126202 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1328101 () Bool)

(assert (=> b!1328101 (= e!757054 (= (apply!1039 lt!590902 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun bm!64831 () Bool)

(assert (=> bm!64831 (= call!64833 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun b!1328102 () Bool)

(assert (=> b!1328102 (= e!757059 (+!4678 call!64831 (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun b!1328103 () Bool)

(declare-fun e!757056 () ListLongMap!21239)

(assert (=> b!1328103 (= e!757056 call!64832)))

(declare-fun b!1328104 () Bool)

(assert (=> b!1328104 (= e!757061 (not call!64835))))

(declare-fun b!1328105 () Bool)

(assert (=> b!1328105 (= e!757056 call!64834)))

(declare-fun b!1328106 () Bool)

(declare-fun lt!590904 () Unit!43649)

(assert (=> b!1328106 (= e!757049 lt!590904)))

(declare-fun lt!590903 () ListLongMap!21239)

(assert (=> b!1328106 (= lt!590903 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590886 () (_ BitVec 64))

(assert (=> b!1328106 (= lt!590886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590899 () (_ BitVec 64))

(assert (=> b!1328106 (= lt!590899 (select (arr!43319 _keys!1609) from!2000))))

(declare-fun lt!590907 () Unit!43649)

(assert (=> b!1328106 (= lt!590907 (addStillContains!1170 lt!590903 lt!590886 zeroValue!1279 lt!590899))))

(assert (=> b!1328106 (contains!8803 (+!4678 lt!590903 (tuple2!23575 lt!590886 zeroValue!1279)) lt!590899)))

(declare-fun lt!590906 () Unit!43649)

(assert (=> b!1328106 (= lt!590906 lt!590907)))

(declare-fun lt!590896 () ListLongMap!21239)

(assert (=> b!1328106 (= lt!590896 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590891 () (_ BitVec 64))

(assert (=> b!1328106 (= lt!590891 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590897 () (_ BitVec 64))

(assert (=> b!1328106 (= lt!590897 (select (arr!43319 _keys!1609) from!2000))))

(declare-fun lt!590889 () Unit!43649)

(assert (=> b!1328106 (= lt!590889 (addApplyDifferent!568 lt!590896 lt!590891 minValue!1279 lt!590897))))

(assert (=> b!1328106 (= (apply!1039 (+!4678 lt!590896 (tuple2!23575 lt!590891 minValue!1279)) lt!590897) (apply!1039 lt!590896 lt!590897))))

(declare-fun lt!590888 () Unit!43649)

(assert (=> b!1328106 (= lt!590888 lt!590889)))

(declare-fun lt!590900 () ListLongMap!21239)

(assert (=> b!1328106 (= lt!590900 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590894 () (_ BitVec 64))

(assert (=> b!1328106 (= lt!590894 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590887 () (_ BitVec 64))

(assert (=> b!1328106 (= lt!590887 (select (arr!43319 _keys!1609) from!2000))))

(declare-fun lt!590895 () Unit!43649)

(assert (=> b!1328106 (= lt!590895 (addApplyDifferent!568 lt!590900 lt!590894 zeroValue!1279 lt!590887))))

(assert (=> b!1328106 (= (apply!1039 (+!4678 lt!590900 (tuple2!23575 lt!590894 zeroValue!1279)) lt!590887) (apply!1039 lt!590900 lt!590887))))

(declare-fun lt!590898 () Unit!43649)

(assert (=> b!1328106 (= lt!590898 lt!590895)))

(declare-fun lt!590905 () ListLongMap!21239)

(assert (=> b!1328106 (= lt!590905 (getCurrentListMapNoExtraKeys!6322 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590893 () (_ BitVec 64))

(assert (=> b!1328106 (= lt!590893 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590901 () (_ BitVec 64))

(assert (=> b!1328106 (= lt!590901 (select (arr!43319 _keys!1609) from!2000))))

(assert (=> b!1328106 (= lt!590904 (addApplyDifferent!568 lt!590905 lt!590893 minValue!1279 lt!590901))))

(assert (=> b!1328106 (= (apply!1039 (+!4678 lt!590905 (tuple2!23575 lt!590893 minValue!1279)) lt!590901) (apply!1039 lt!590905 lt!590901))))

(declare-fun b!1328107 () Bool)

(assert (=> b!1328107 (= e!757050 (validKeyInArray!0 (select (arr!43319 _keys!1609) from!2000)))))

(declare-fun bm!64832 () Bool)

(assert (=> bm!64832 (= call!64831 (+!4678 (ite c!126204 call!64833 (ite c!126201 call!64830 call!64832)) (ite (or c!126204 c!126201) (tuple2!23575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1328108 () Bool)

(declare-fun Unit!43659 () Unit!43649)

(assert (=> b!1328108 (= e!757049 Unit!43659)))

(declare-fun b!1328109 () Bool)

(declare-fun c!126206 () Bool)

(assert (=> b!1328109 (= c!126206 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1328109 (= e!757057 e!757056)))

(declare-fun b!1328110 () Bool)

(assert (=> b!1328110 (= e!757061 e!757053)))

(declare-fun res!881076 () Bool)

(assert (=> b!1328110 (= res!881076 call!64835)))

(assert (=> b!1328110 (=> (not res!881076) (not e!757053))))

(declare-fun b!1328111 () Bool)

(assert (=> b!1328111 (= e!757051 e!757052)))

(declare-fun res!881075 () Bool)

(assert (=> b!1328111 (=> (not res!881075) (not e!757052))))

(assert (=> b!1328111 (= res!881075 (contains!8803 lt!590902 (select (arr!43319 _keys!1609) from!2000)))))

(assert (=> b!1328111 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43870 _keys!1609)))))

(declare-fun b!1328112 () Bool)

(assert (=> b!1328112 (= e!757060 (not call!64829))))

(assert (= (and d!143577 c!126204) b!1328102))

(assert (= (and d!143577 (not c!126204)) b!1328096))

(assert (= (and b!1328096 c!126201) b!1328095))

(assert (= (and b!1328096 (not c!126201)) b!1328109))

(assert (= (and b!1328109 c!126206) b!1328105))

(assert (= (and b!1328109 (not c!126206)) b!1328103))

(assert (= (or b!1328105 b!1328103) bm!64828))

(assert (= (or b!1328095 bm!64828) bm!64830))

(assert (= (or b!1328095 b!1328105) bm!64829))

(assert (= (or b!1328102 bm!64830) bm!64831))

(assert (= (or b!1328102 bm!64829) bm!64832))

(assert (= (and d!143577 res!881077) b!1328107))

(assert (= (and d!143577 c!126203) b!1328106))

(assert (= (and d!143577 (not c!126203)) b!1328108))

(assert (= (and d!143577 res!881082) b!1328098))

(assert (= (and b!1328098 res!881080) b!1328092))

(assert (= (and b!1328098 (not res!881081)) b!1328111))

(assert (= (and b!1328111 res!881075) b!1328094))

(assert (= (and b!1328098 res!881079) b!1328097))

(assert (= (and b!1328097 c!126205) b!1328110))

(assert (= (and b!1328097 (not c!126205)) b!1328104))

(assert (= (and b!1328110 res!881076) b!1328099))

(assert (= (or b!1328110 b!1328104) bm!64826))

(assert (= (and b!1328097 res!881074) b!1328100))

(assert (= (and b!1328100 c!126202) b!1328093))

(assert (= (and b!1328100 (not c!126202)) b!1328112))

(assert (= (and b!1328093 res!881078) b!1328101))

(assert (= (or b!1328093 b!1328112) bm!64827))

(declare-fun b_lambda!23815 () Bool)

(assert (=> (not b_lambda!23815) (not b!1328094)))

(assert (=> b!1328094 t!44716))

(declare-fun b_and!49173 () Bool)

(assert (= b_and!49171 (and (=> t!44716 result!24655) b_and!49173)))

(assert (=> b!1328094 m!1217183))

(assert (=> b!1328094 m!1217169))

(declare-fun m!1217571 () Bool)

(assert (=> b!1328094 m!1217571))

(assert (=> b!1328094 m!1217183))

(assert (=> b!1328094 m!1217179))

(assert (=> b!1328094 m!1217187))

(assert (=> b!1328094 m!1217169))

(assert (=> b!1328094 m!1217179))

(assert (=> b!1328092 m!1217169))

(assert (=> b!1328092 m!1217169))

(assert (=> b!1328092 m!1217211))

(declare-fun m!1217573 () Bool)

(assert (=> bm!64831 m!1217573))

(assert (=> d!143577 m!1217223))

(declare-fun m!1217575 () Bool)

(assert (=> bm!64832 m!1217575))

(assert (=> b!1328111 m!1217169))

(assert (=> b!1328111 m!1217169))

(declare-fun m!1217577 () Bool)

(assert (=> b!1328111 m!1217577))

(declare-fun m!1217579 () Bool)

(assert (=> b!1328106 m!1217579))

(declare-fun m!1217581 () Bool)

(assert (=> b!1328106 m!1217581))

(declare-fun m!1217583 () Bool)

(assert (=> b!1328106 m!1217583))

(assert (=> b!1328106 m!1217169))

(assert (=> b!1328106 m!1217579))

(assert (=> b!1328106 m!1217573))

(declare-fun m!1217585 () Bool)

(assert (=> b!1328106 m!1217585))

(declare-fun m!1217587 () Bool)

(assert (=> b!1328106 m!1217587))

(declare-fun m!1217589 () Bool)

(assert (=> b!1328106 m!1217589))

(declare-fun m!1217591 () Bool)

(assert (=> b!1328106 m!1217591))

(declare-fun m!1217593 () Bool)

(assert (=> b!1328106 m!1217593))

(assert (=> b!1328106 m!1217583))

(declare-fun m!1217595 () Bool)

(assert (=> b!1328106 m!1217595))

(declare-fun m!1217597 () Bool)

(assert (=> b!1328106 m!1217597))

(assert (=> b!1328106 m!1217593))

(declare-fun m!1217599 () Bool)

(assert (=> b!1328106 m!1217599))

(assert (=> b!1328106 m!1217597))

(declare-fun m!1217601 () Bool)

(assert (=> b!1328106 m!1217601))

(declare-fun m!1217603 () Bool)

(assert (=> b!1328106 m!1217603))

(declare-fun m!1217605 () Bool)

(assert (=> b!1328106 m!1217605))

(declare-fun m!1217607 () Bool)

(assert (=> b!1328106 m!1217607))

(declare-fun m!1217609 () Bool)

(assert (=> b!1328099 m!1217609))

(declare-fun m!1217611 () Bool)

(assert (=> bm!64826 m!1217611))

(assert (=> b!1328107 m!1217169))

(assert (=> b!1328107 m!1217169))

(assert (=> b!1328107 m!1217211))

(declare-fun m!1217613 () Bool)

(assert (=> b!1328102 m!1217613))

(declare-fun m!1217615 () Bool)

(assert (=> bm!64827 m!1217615))

(declare-fun m!1217617 () Bool)

(assert (=> b!1328101 m!1217617))

(assert (=> b!1327837 d!143577))

(declare-fun d!143579 () Bool)

(assert (=> d!143579 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!112154 d!143579))

(declare-fun d!143581 () Bool)

(assert (=> d!143581 (= (array_inv!32961 _keys!1609) (bvsge (size!43870 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!112154 d!143581))

(declare-fun d!143583 () Bool)

(assert (=> d!143583 (= (array_inv!32962 _values!1337) (bvsge (size!43869 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!112154 d!143583))

(declare-fun mapNonEmpty!56184 () Bool)

(declare-fun mapRes!56184 () Bool)

(declare-fun tp!107082 () Bool)

(declare-fun e!757067 () Bool)

(assert (=> mapNonEmpty!56184 (= mapRes!56184 (and tp!107082 e!757067))))

(declare-fun mapRest!56184 () (Array (_ BitVec 32) ValueCell!17276))

(declare-fun mapValue!56184 () ValueCell!17276)

(declare-fun mapKey!56184 () (_ BitVec 32))

(assert (=> mapNonEmpty!56184 (= mapRest!56175 (store mapRest!56184 mapKey!56184 mapValue!56184))))

(declare-fun b!1328120 () Bool)

(declare-fun e!757066 () Bool)

(assert (=> b!1328120 (= e!757066 tp_is_empty!36349)))

(declare-fun condMapEmpty!56184 () Bool)

(declare-fun mapDefault!56184 () ValueCell!17276)

(assert (=> mapNonEmpty!56175 (= condMapEmpty!56184 (= mapRest!56175 ((as const (Array (_ BitVec 32) ValueCell!17276)) mapDefault!56184)))))

(assert (=> mapNonEmpty!56175 (= tp!107066 (and e!757066 mapRes!56184))))

(declare-fun b!1328119 () Bool)

(assert (=> b!1328119 (= e!757067 tp_is_empty!36349)))

(declare-fun mapIsEmpty!56184 () Bool)

(assert (=> mapIsEmpty!56184 mapRes!56184))

(assert (= (and mapNonEmpty!56175 condMapEmpty!56184) mapIsEmpty!56184))

(assert (= (and mapNonEmpty!56175 (not condMapEmpty!56184)) mapNonEmpty!56184))

(assert (= (and mapNonEmpty!56184 ((_ is ValueCellFull!17276) mapValue!56184)) b!1328119))

(assert (= (and mapNonEmpty!56175 ((_ is ValueCellFull!17276) mapDefault!56184)) b!1328120))

(declare-fun m!1217619 () Bool)

(assert (=> mapNonEmpty!56184 m!1217619))

(declare-fun b_lambda!23817 () Bool)

(assert (= b_lambda!23811 (or (and start!112154 b_free!30529) b_lambda!23817)))

(declare-fun b_lambda!23819 () Bool)

(assert (= b_lambda!23809 (or (and start!112154 b_free!30529) b_lambda!23819)))

(declare-fun b_lambda!23821 () Bool)

(assert (= b_lambda!23813 (or (and start!112154 b_free!30529) b_lambda!23821)))

(declare-fun b_lambda!23823 () Bool)

(assert (= b_lambda!23815 (or (and start!112154 b_free!30529) b_lambda!23823)))

(check-sat (not bm!64804) (not d!143549) (not bm!64820) (not b!1328065) (not b!1328089) (not d!143557) (not b!1328102) (not b!1328086) (not b!1327974) (not d!143569) (not b!1327979) (not b!1328014) (not b!1327967) (not d!143545) (not d!143551) (not b!1328088) (not d!143555) (not d!143575) (not b!1327982) (not b!1328092) (not b!1328106) (not mapNonEmpty!56184) (not bm!64831) tp_is_empty!36349 (not b!1327973) (not b!1327961) (not b!1327952) (not b!1327968) (not b!1328022) (not b!1327986) (not b!1328019) (not bm!64827) (not bm!64832) (not b_lambda!23821) (not d!143541) (not d!143539) (not b!1328111) (not d!143537) (not d!143561) (not b!1327951) (not b_lambda!23817) (not b!1328011) (not b!1327945) (not b!1327983) (not d!143571) (not b!1328015) (not b!1327972) (not d!143553) (not b!1327970) (not b!1328079) (not b!1328084) (not d!143567) (not bm!64798) (not b!1328107) (not b!1327944) (not b!1327959) (not b!1327971) (not bm!64826) (not b!1327930) (not b_lambda!23807) (not b_lambda!23819) (not b!1328016) (not b!1328099) (not b!1328080) (not b!1328075) (not b!1327966) b_and!49173 (not b!1327976) (not b!1328067) (not d!143563) (not b_next!30529) (not b!1328074) (not b!1328072) (not b_lambda!23823) (not b!1328101) (not b!1327933) (not d!143565) (not b!1328094) (not d!143559) (not b!1328091) (not bm!64825) (not d!143577) (not b!1327981) (not bm!64801) (not bm!64819) (not b!1327984) (not b!1327978) (not b!1327932) (not bm!64824) (not d!143547) (not b!1328012) (not b!1328018))
(check-sat b_and!49173 (not b_next!30529))
