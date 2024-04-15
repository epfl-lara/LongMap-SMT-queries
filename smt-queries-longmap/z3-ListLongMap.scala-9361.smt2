; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111602 () Bool)

(assert start!111602)

(declare-fun b_free!30259 () Bool)

(declare-fun b_next!30259 () Bool)

(assert (=> start!111602 (= b_free!30259 (not b_next!30259))))

(declare-fun tp!106254 () Bool)

(declare-fun b_and!48659 () Bool)

(assert (=> start!111602 (= tp!106254 b_and!48659)))

(declare-fun b!1321680 () Bool)

(declare-fun res!877256 () Bool)

(declare-fun e!753747 () Bool)

(assert (=> b!1321680 (=> (not res!877256) (not e!753747))))

(declare-datatypes ((array!89011 0))(
  ( (array!89012 (arr!42980 (Array (_ BitVec 32) (_ BitVec 64))) (size!43532 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89011)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1321680 (= res!877256 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43532 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321681 () Bool)

(declare-fun res!877260 () Bool)

(assert (=> b!1321681 (=> (not res!877260) (not e!753747))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89011 (_ BitVec 32)) Bool)

(assert (=> b!1321681 (= res!877260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321682 () Bool)

(declare-fun e!753748 () Bool)

(declare-fun tp_is_empty!36079 () Bool)

(assert (=> b!1321682 (= e!753748 tp_is_empty!36079)))

(declare-fun b!1321683 () Bool)

(declare-fun res!877262 () Bool)

(assert (=> b!1321683 (=> (not res!877262) (not e!753747))))

(declare-datatypes ((List!30544 0))(
  ( (Nil!30541) (Cons!30540 (h!31749 (_ BitVec 64)) (t!44344 List!30544)) )
))
(declare-fun arrayNoDuplicates!0 (array!89011 (_ BitVec 32) List!30544) Bool)

(assert (=> b!1321683 (= res!877262 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30541))))

(declare-fun b!1321684 () Bool)

(declare-fun e!753749 () Bool)

(assert (=> b!1321684 (= e!753749 tp_is_empty!36079)))

(declare-fun b!1321685 () Bool)

(declare-fun e!753750 () Bool)

(declare-fun mapRes!55766 () Bool)

(assert (=> b!1321685 (= e!753750 (and e!753749 mapRes!55766))))

(declare-fun condMapEmpty!55766 () Bool)

(declare-datatypes ((V!53209 0))(
  ( (V!53210 (val!18114 Int)) )
))
(declare-datatypes ((ValueCell!17141 0))(
  ( (ValueCellFull!17141 (v!20743 V!53209)) (EmptyCell!17141) )
))
(declare-datatypes ((array!89013 0))(
  ( (array!89014 (arr!42981 (Array (_ BitVec 32) ValueCell!17141)) (size!43533 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89013)

(declare-fun mapDefault!55766 () ValueCell!17141)

(assert (=> b!1321685 (= condMapEmpty!55766 (= (arr!42981 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17141)) mapDefault!55766)))))

(declare-fun b!1321686 () Bool)

(declare-fun res!877259 () Bool)

(assert (=> b!1321686 (=> (not res!877259) (not e!753747))))

(assert (=> b!1321686 (= res!877259 (not (= (select (arr!42980 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!55766 () Bool)

(assert (=> mapIsEmpty!55766 mapRes!55766))

(declare-fun b!1321687 () Bool)

(declare-fun res!877263 () Bool)

(assert (=> b!1321687 (=> (not res!877263) (not e!753747))))

(assert (=> b!1321687 (= res!877263 (and (= (size!43533 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43532 _keys!1609) (size!43533 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55766 () Bool)

(declare-fun tp!106253 () Bool)

(assert (=> mapNonEmpty!55766 (= mapRes!55766 (and tp!106253 e!753748))))

(declare-fun mapKey!55766 () (_ BitVec 32))

(declare-fun mapValue!55766 () ValueCell!17141)

(declare-fun mapRest!55766 () (Array (_ BitVec 32) ValueCell!17141))

(assert (=> mapNonEmpty!55766 (= (arr!42981 _values!1337) (store mapRest!55766 mapKey!55766 mapValue!55766))))

(declare-fun b!1321688 () Bool)

(assert (=> b!1321688 (= e!753747 (not true))))

(declare-datatypes ((tuple2!23410 0))(
  ( (tuple2!23411 (_1!11716 (_ BitVec 64)) (_2!11716 V!53209)) )
))
(declare-datatypes ((List!30545 0))(
  ( (Nil!30542) (Cons!30541 (h!31750 tuple2!23410) (t!44345 List!30545)) )
))
(declare-datatypes ((ListLongMap!21067 0))(
  ( (ListLongMap!21068 (toList!10549 List!30545)) )
))
(declare-fun lt!587469 () ListLongMap!21067)

(declare-fun contains!8632 (ListLongMap!21067 (_ BitVec 64)) Bool)

(assert (=> b!1321688 (contains!8632 lt!587469 k0!1164)))

(declare-datatypes ((Unit!43367 0))(
  ( (Unit!43368) )
))
(declare-fun lt!587464 () Unit!43367)

(declare-fun lt!587468 () V!53209)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!157 ((_ BitVec 64) (_ BitVec 64) V!53209 ListLongMap!21067) Unit!43367)

(assert (=> b!1321688 (= lt!587464 (lemmaInListMapAfterAddingDiffThenInBefore!157 k0!1164 (select (arr!42980 _keys!1609) from!2000) lt!587468 lt!587469))))

(declare-fun lt!587463 () ListLongMap!21067)

(assert (=> b!1321688 (contains!8632 lt!587463 k0!1164)))

(declare-fun zeroValue!1279 () V!53209)

(declare-fun lt!587466 () Unit!43367)

(assert (=> b!1321688 (= lt!587466 (lemmaInListMapAfterAddingDiffThenInBefore!157 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587463))))

(declare-fun lt!587467 () ListLongMap!21067)

(assert (=> b!1321688 (contains!8632 lt!587467 k0!1164)))

(declare-fun lt!587465 () Unit!43367)

(declare-fun minValue!1279 () V!53209)

(assert (=> b!1321688 (= lt!587465 (lemmaInListMapAfterAddingDiffThenInBefore!157 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587467))))

(declare-fun +!4592 (ListLongMap!21067 tuple2!23410) ListLongMap!21067)

(assert (=> b!1321688 (= lt!587467 (+!4592 lt!587463 (tuple2!23411 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321688 (= lt!587463 (+!4592 lt!587469 (tuple2!23411 (select (arr!42980 _keys!1609) from!2000) lt!587468)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21637 (ValueCell!17141 V!53209) V!53209)

(declare-fun dynLambda!3522 (Int (_ BitVec 64)) V!53209)

(assert (=> b!1321688 (= lt!587468 (get!21637 (select (arr!42981 _values!1337) from!2000) (dynLambda!3522 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6225 (array!89011 array!89013 (_ BitVec 32) (_ BitVec 32) V!53209 V!53209 (_ BitVec 32) Int) ListLongMap!21067)

(assert (=> b!1321688 (= lt!587469 (getCurrentListMapNoExtraKeys!6225 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321689 () Bool)

(declare-fun res!877261 () Bool)

(assert (=> b!1321689 (=> (not res!877261) (not e!753747))))

(declare-fun getCurrentListMap!5434 (array!89011 array!89013 (_ BitVec 32) (_ BitVec 32) V!53209 V!53209 (_ BitVec 32) Int) ListLongMap!21067)

(assert (=> b!1321689 (= res!877261 (contains!8632 (getCurrentListMap!5434 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321690 () Bool)

(declare-fun res!877258 () Bool)

(assert (=> b!1321690 (=> (not res!877258) (not e!753747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321690 (= res!877258 (validKeyInArray!0 (select (arr!42980 _keys!1609) from!2000)))))

(declare-fun res!877257 () Bool)

(assert (=> start!111602 (=> (not res!877257) (not e!753747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111602 (= res!877257 (validMask!0 mask!2019))))

(assert (=> start!111602 e!753747))

(declare-fun array_inv!32631 (array!89011) Bool)

(assert (=> start!111602 (array_inv!32631 _keys!1609)))

(assert (=> start!111602 true))

(assert (=> start!111602 tp_is_empty!36079))

(declare-fun array_inv!32632 (array!89013) Bool)

(assert (=> start!111602 (and (array_inv!32632 _values!1337) e!753750)))

(assert (=> start!111602 tp!106254))

(assert (= (and start!111602 res!877257) b!1321687))

(assert (= (and b!1321687 res!877263) b!1321681))

(assert (= (and b!1321681 res!877260) b!1321683))

(assert (= (and b!1321683 res!877262) b!1321680))

(assert (= (and b!1321680 res!877256) b!1321689))

(assert (= (and b!1321689 res!877261) b!1321686))

(assert (= (and b!1321686 res!877259) b!1321690))

(assert (= (and b!1321690 res!877258) b!1321688))

(assert (= (and b!1321685 condMapEmpty!55766) mapIsEmpty!55766))

(assert (= (and b!1321685 (not condMapEmpty!55766)) mapNonEmpty!55766))

(get-info :version)

(assert (= (and mapNonEmpty!55766 ((_ is ValueCellFull!17141) mapValue!55766)) b!1321682))

(assert (= (and b!1321685 ((_ is ValueCellFull!17141) mapDefault!55766)) b!1321684))

(assert (= start!111602 b!1321685))

(declare-fun b_lambda!23575 () Bool)

(assert (=> (not b_lambda!23575) (not b!1321688)))

(declare-fun t!44343 () Bool)

(declare-fun tb!11603 () Bool)

(assert (=> (and start!111602 (= defaultEntry!1340 defaultEntry!1340) t!44343) tb!11603))

(declare-fun result!24269 () Bool)

(assert (=> tb!11603 (= result!24269 tp_is_empty!36079)))

(assert (=> b!1321688 t!44343))

(declare-fun b_and!48661 () Bool)

(assert (= b_and!48659 (and (=> t!44343 result!24269) b_and!48661)))

(declare-fun m!1209243 () Bool)

(assert (=> b!1321690 m!1209243))

(assert (=> b!1321690 m!1209243))

(declare-fun m!1209245 () Bool)

(assert (=> b!1321690 m!1209245))

(declare-fun m!1209247 () Bool)

(assert (=> b!1321688 m!1209247))

(declare-fun m!1209249 () Bool)

(assert (=> b!1321688 m!1209249))

(declare-fun m!1209251 () Bool)

(assert (=> b!1321688 m!1209251))

(declare-fun m!1209253 () Bool)

(assert (=> b!1321688 m!1209253))

(declare-fun m!1209255 () Bool)

(assert (=> b!1321688 m!1209255))

(declare-fun m!1209257 () Bool)

(assert (=> b!1321688 m!1209257))

(assert (=> b!1321688 m!1209253))

(assert (=> b!1321688 m!1209249))

(declare-fun m!1209259 () Bool)

(assert (=> b!1321688 m!1209259))

(declare-fun m!1209261 () Bool)

(assert (=> b!1321688 m!1209261))

(declare-fun m!1209263 () Bool)

(assert (=> b!1321688 m!1209263))

(declare-fun m!1209265 () Bool)

(assert (=> b!1321688 m!1209265))

(assert (=> b!1321688 m!1209243))

(declare-fun m!1209267 () Bool)

(assert (=> b!1321688 m!1209267))

(declare-fun m!1209269 () Bool)

(assert (=> b!1321688 m!1209269))

(assert (=> b!1321688 m!1209243))

(declare-fun m!1209271 () Bool)

(assert (=> b!1321681 m!1209271))

(declare-fun m!1209273 () Bool)

(assert (=> mapNonEmpty!55766 m!1209273))

(declare-fun m!1209275 () Bool)

(assert (=> b!1321689 m!1209275))

(assert (=> b!1321689 m!1209275))

(declare-fun m!1209277 () Bool)

(assert (=> b!1321689 m!1209277))

(declare-fun m!1209279 () Bool)

(assert (=> start!111602 m!1209279))

(declare-fun m!1209281 () Bool)

(assert (=> start!111602 m!1209281))

(declare-fun m!1209283 () Bool)

(assert (=> start!111602 m!1209283))

(assert (=> b!1321686 m!1209243))

(declare-fun m!1209285 () Bool)

(assert (=> b!1321683 m!1209285))

(check-sat b_and!48661 (not b!1321681) (not b_next!30259) (not b!1321689) (not mapNonEmpty!55766) tp_is_empty!36079 (not start!111602) (not b!1321683) (not b!1321690) (not b!1321688) (not b_lambda!23575))
(check-sat b_and!48661 (not b_next!30259))
