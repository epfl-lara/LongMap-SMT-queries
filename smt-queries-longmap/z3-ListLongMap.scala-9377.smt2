; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111698 () Bool)

(assert start!111698)

(declare-fun b_free!30355 () Bool)

(declare-fun b_next!30355 () Bool)

(assert (=> start!111698 (= b_free!30355 (not b_next!30355))))

(declare-fun tp!106541 () Bool)

(declare-fun b_and!48851 () Bool)

(assert (=> start!111698 (= tp!106541 b_and!48851)))

(declare-fun b!1323360 () Bool)

(declare-fun res!878411 () Bool)

(declare-fun e!754467 () Bool)

(assert (=> b!1323360 (=> (not res!878411) (not e!754467))))

(declare-datatypes ((array!89199 0))(
  ( (array!89200 (arr!43074 (Array (_ BitVec 32) (_ BitVec 64))) (size!43626 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89199)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53337 0))(
  ( (V!53338 (val!18162 Int)) )
))
(declare-datatypes ((ValueCell!17189 0))(
  ( (ValueCellFull!17189 (v!20791 V!53337)) (EmptyCell!17189) )
))
(declare-datatypes ((array!89201 0))(
  ( (array!89202 (arr!43075 (Array (_ BitVec 32) ValueCell!17189)) (size!43627 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89201)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1323360 (= res!878411 (and (= (size!43627 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43626 _keys!1609) (size!43627 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323361 () Bool)

(declare-fun e!754469 () Bool)

(declare-fun e!754468 () Bool)

(declare-fun mapRes!55910 () Bool)

(assert (=> b!1323361 (= e!754469 (and e!754468 mapRes!55910))))

(declare-fun condMapEmpty!55910 () Bool)

(declare-fun mapDefault!55910 () ValueCell!17189)

(assert (=> b!1323361 (= condMapEmpty!55910 (= (arr!43075 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17189)) mapDefault!55910)))))

(declare-fun b!1323362 () Bool)

(assert (=> b!1323362 (= e!754467 (not true))))

(declare-datatypes ((tuple2!23480 0))(
  ( (tuple2!23481 (_1!11751 (_ BitVec 64)) (_2!11751 V!53337)) )
))
(declare-datatypes ((List!30614 0))(
  ( (Nil!30611) (Cons!30610 (h!31819 tuple2!23480) (t!44510 List!30614)) )
))
(declare-datatypes ((ListLongMap!21137 0))(
  ( (ListLongMap!21138 (toList!10584 List!30614)) )
))
(declare-fun lt!588847 () ListLongMap!21137)

(declare-fun minValue!1279 () V!53337)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8667 (ListLongMap!21137 (_ BitVec 64)) Bool)

(declare-fun +!4622 (ListLongMap!21137 tuple2!23480) ListLongMap!21137)

(assert (=> b!1323362 (contains!8667 (+!4622 lt!588847 (tuple2!23481 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43427 0))(
  ( (Unit!43428) )
))
(declare-fun lt!588843 () Unit!43427)

(declare-fun addStillContains!1146 (ListLongMap!21137 (_ BitVec 64) V!53337 (_ BitVec 64)) Unit!43427)

(assert (=> b!1323362 (= lt!588843 (addStillContains!1146 lt!588847 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323362 (contains!8667 lt!588847 k0!1164)))

(declare-fun lt!588840 () ListLongMap!21137)

(declare-fun lt!588841 () tuple2!23480)

(assert (=> b!1323362 (= lt!588847 (+!4622 lt!588840 lt!588841))))

(declare-fun zeroValue!1279 () V!53337)

(declare-fun lt!588842 () Unit!43427)

(assert (=> b!1323362 (= lt!588842 (addStillContains!1146 lt!588840 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323362 (contains!8667 lt!588840 k0!1164)))

(declare-fun lt!588846 () Unit!43427)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!588839 () V!53337)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!187 ((_ BitVec 64) (_ BitVec 64) V!53337 ListLongMap!21137) Unit!43427)

(assert (=> b!1323362 (= lt!588846 (lemmaInListMapAfterAddingDiffThenInBefore!187 k0!1164 (select (arr!43074 _keys!1609) from!2000) lt!588839 lt!588840))))

(declare-fun lt!588845 () ListLongMap!21137)

(assert (=> b!1323362 (contains!8667 lt!588845 k0!1164)))

(declare-fun lt!588849 () Unit!43427)

(assert (=> b!1323362 (= lt!588849 (lemmaInListMapAfterAddingDiffThenInBefore!187 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588845))))

(declare-fun lt!588844 () ListLongMap!21137)

(assert (=> b!1323362 (contains!8667 lt!588844 k0!1164)))

(declare-fun lt!588848 () Unit!43427)

(assert (=> b!1323362 (= lt!588848 (lemmaInListMapAfterAddingDiffThenInBefore!187 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588844))))

(assert (=> b!1323362 (= lt!588844 (+!4622 lt!588845 lt!588841))))

(assert (=> b!1323362 (= lt!588841 (tuple2!23481 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323362 (= lt!588845 (+!4622 lt!588840 (tuple2!23481 (select (arr!43074 _keys!1609) from!2000) lt!588839)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21699 (ValueCell!17189 V!53337) V!53337)

(declare-fun dynLambda!3552 (Int (_ BitVec 64)) V!53337)

(assert (=> b!1323362 (= lt!588839 (get!21699 (select (arr!43075 _values!1337) from!2000) (dynLambda!3552 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6255 (array!89199 array!89201 (_ BitVec 32) (_ BitVec 32) V!53337 V!53337 (_ BitVec 32) Int) ListLongMap!21137)

(assert (=> b!1323362 (= lt!588840 (getCurrentListMapNoExtraKeys!6255 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapIsEmpty!55910 () Bool)

(assert (=> mapIsEmpty!55910 mapRes!55910))

(declare-fun b!1323363 () Bool)

(declare-fun res!878412 () Bool)

(assert (=> b!1323363 (=> (not res!878412) (not e!754467))))

(declare-fun getCurrentListMap!5465 (array!89199 array!89201 (_ BitVec 32) (_ BitVec 32) V!53337 V!53337 (_ BitVec 32) Int) ListLongMap!21137)

(assert (=> b!1323363 (= res!878412 (contains!8667 (getCurrentListMap!5465 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!878408 () Bool)

(assert (=> start!111698 (=> (not res!878408) (not e!754467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111698 (= res!878408 (validMask!0 mask!2019))))

(assert (=> start!111698 e!754467))

(declare-fun array_inv!32703 (array!89199) Bool)

(assert (=> start!111698 (array_inv!32703 _keys!1609)))

(assert (=> start!111698 true))

(declare-fun tp_is_empty!36175 () Bool)

(assert (=> start!111698 tp_is_empty!36175))

(declare-fun array_inv!32704 (array!89201) Bool)

(assert (=> start!111698 (and (array_inv!32704 _values!1337) e!754469)))

(assert (=> start!111698 tp!106541))

(declare-fun b!1323364 () Bool)

(declare-fun res!878410 () Bool)

(assert (=> b!1323364 (=> (not res!878410) (not e!754467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323364 (= res!878410 (validKeyInArray!0 (select (arr!43074 _keys!1609) from!2000)))))

(declare-fun b!1323365 () Bool)

(declare-fun res!878409 () Bool)

(assert (=> b!1323365 (=> (not res!878409) (not e!754467))))

(declare-datatypes ((List!30615 0))(
  ( (Nil!30612) (Cons!30611 (h!31820 (_ BitVec 64)) (t!44511 List!30615)) )
))
(declare-fun arrayNoDuplicates!0 (array!89199 (_ BitVec 32) List!30615) Bool)

(assert (=> b!1323365 (= res!878409 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30612))))

(declare-fun b!1323366 () Bool)

(declare-fun res!878415 () Bool)

(assert (=> b!1323366 (=> (not res!878415) (not e!754467))))

(assert (=> b!1323366 (= res!878415 (not (= (select (arr!43074 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323367 () Bool)

(declare-fun e!754470 () Bool)

(assert (=> b!1323367 (= e!754470 tp_is_empty!36175)))

(declare-fun mapNonEmpty!55910 () Bool)

(declare-fun tp!106542 () Bool)

(assert (=> mapNonEmpty!55910 (= mapRes!55910 (and tp!106542 e!754470))))

(declare-fun mapKey!55910 () (_ BitVec 32))

(declare-fun mapValue!55910 () ValueCell!17189)

(declare-fun mapRest!55910 () (Array (_ BitVec 32) ValueCell!17189))

(assert (=> mapNonEmpty!55910 (= (arr!43075 _values!1337) (store mapRest!55910 mapKey!55910 mapValue!55910))))

(declare-fun b!1323368 () Bool)

(declare-fun res!878414 () Bool)

(assert (=> b!1323368 (=> (not res!878414) (not e!754467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89199 (_ BitVec 32)) Bool)

(assert (=> b!1323368 (= res!878414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323369 () Bool)

(declare-fun res!878413 () Bool)

(assert (=> b!1323369 (=> (not res!878413) (not e!754467))))

(assert (=> b!1323369 (= res!878413 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43626 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323370 () Bool)

(assert (=> b!1323370 (= e!754468 tp_is_empty!36175)))

(assert (= (and start!111698 res!878408) b!1323360))

(assert (= (and b!1323360 res!878411) b!1323368))

(assert (= (and b!1323368 res!878414) b!1323365))

(assert (= (and b!1323365 res!878409) b!1323369))

(assert (= (and b!1323369 res!878413) b!1323363))

(assert (= (and b!1323363 res!878412) b!1323366))

(assert (= (and b!1323366 res!878415) b!1323364))

(assert (= (and b!1323364 res!878410) b!1323362))

(assert (= (and b!1323361 condMapEmpty!55910) mapIsEmpty!55910))

(assert (= (and b!1323361 (not condMapEmpty!55910)) mapNonEmpty!55910))

(get-info :version)

(assert (= (and mapNonEmpty!55910 ((_ is ValueCellFull!17189) mapValue!55910)) b!1323367))

(assert (= (and b!1323361 ((_ is ValueCellFull!17189) mapDefault!55910)) b!1323370))

(assert (= start!111698 b!1323361))

(declare-fun b_lambda!23671 () Bool)

(assert (=> (not b_lambda!23671) (not b!1323362)))

(declare-fun t!44509 () Bool)

(declare-fun tb!11699 () Bool)

(assert (=> (and start!111698 (= defaultEntry!1340 defaultEntry!1340) t!44509) tb!11699))

(declare-fun result!24461 () Bool)

(assert (=> tb!11699 (= result!24461 tp_is_empty!36175)))

(assert (=> b!1323362 t!44509))

(declare-fun b_and!48853 () Bool)

(assert (= b_and!48851 (and (=> t!44509 result!24461) b_and!48853)))

(declare-fun m!1211715 () Bool)

(assert (=> b!1323362 m!1211715))

(declare-fun m!1211717 () Bool)

(assert (=> b!1323362 m!1211717))

(declare-fun m!1211719 () Bool)

(assert (=> b!1323362 m!1211719))

(declare-fun m!1211721 () Bool)

(assert (=> b!1323362 m!1211721))

(declare-fun m!1211723 () Bool)

(assert (=> b!1323362 m!1211723))

(declare-fun m!1211725 () Bool)

(assert (=> b!1323362 m!1211725))

(declare-fun m!1211727 () Bool)

(assert (=> b!1323362 m!1211727))

(declare-fun m!1211729 () Bool)

(assert (=> b!1323362 m!1211729))

(declare-fun m!1211731 () Bool)

(assert (=> b!1323362 m!1211731))

(declare-fun m!1211733 () Bool)

(assert (=> b!1323362 m!1211733))

(declare-fun m!1211735 () Bool)

(assert (=> b!1323362 m!1211735))

(assert (=> b!1323362 m!1211717))

(declare-fun m!1211737 () Bool)

(assert (=> b!1323362 m!1211737))

(declare-fun m!1211739 () Bool)

(assert (=> b!1323362 m!1211739))

(declare-fun m!1211741 () Bool)

(assert (=> b!1323362 m!1211741))

(declare-fun m!1211743 () Bool)

(assert (=> b!1323362 m!1211743))

(assert (=> b!1323362 m!1211731))

(declare-fun m!1211745 () Bool)

(assert (=> b!1323362 m!1211745))

(declare-fun m!1211747 () Bool)

(assert (=> b!1323362 m!1211747))

(declare-fun m!1211749 () Bool)

(assert (=> b!1323362 m!1211749))

(declare-fun m!1211751 () Bool)

(assert (=> b!1323362 m!1211751))

(assert (=> b!1323362 m!1211729))

(assert (=> b!1323362 m!1211747))

(declare-fun m!1211753 () Bool)

(assert (=> start!111698 m!1211753))

(declare-fun m!1211755 () Bool)

(assert (=> start!111698 m!1211755))

(declare-fun m!1211757 () Bool)

(assert (=> start!111698 m!1211757))

(assert (=> b!1323364 m!1211717))

(assert (=> b!1323364 m!1211717))

(declare-fun m!1211759 () Bool)

(assert (=> b!1323364 m!1211759))

(declare-fun m!1211761 () Bool)

(assert (=> b!1323368 m!1211761))

(declare-fun m!1211763 () Bool)

(assert (=> mapNonEmpty!55910 m!1211763))

(declare-fun m!1211765 () Bool)

(assert (=> b!1323365 m!1211765))

(assert (=> b!1323366 m!1211717))

(declare-fun m!1211767 () Bool)

(assert (=> b!1323363 m!1211767))

(assert (=> b!1323363 m!1211767))

(declare-fun m!1211769 () Bool)

(assert (=> b!1323363 m!1211769))

(check-sat (not b_lambda!23671) (not b!1323363) (not b!1323364) tp_is_empty!36175 b_and!48853 (not b!1323368) (not b!1323365) (not b_next!30355) (not start!111698) (not mapNonEmpty!55910) (not b!1323362))
(check-sat b_and!48853 (not b_next!30355))
