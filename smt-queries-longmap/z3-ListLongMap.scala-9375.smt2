; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111910 () Bool)

(assert start!111910)

(declare-fun b_free!30343 () Bool)

(declare-fun b_next!30343 () Bool)

(assert (=> start!111910 (= b_free!30343 (not b_next!30343))))

(declare-fun tp!106505 () Bool)

(declare-fun b_and!48847 () Bool)

(assert (=> start!111910 (= tp!106505 b_and!48847)))

(declare-fun mapNonEmpty!55892 () Bool)

(declare-fun mapRes!55892 () Bool)

(declare-fun tp!106504 () Bool)

(declare-fun e!755257 () Bool)

(assert (=> mapNonEmpty!55892 (= mapRes!55892 (and tp!106504 e!755257))))

(declare-datatypes ((V!53321 0))(
  ( (V!53322 (val!18156 Int)) )
))
(declare-datatypes ((ValueCell!17183 0))(
  ( (ValueCellFull!17183 (v!20781 V!53321)) (EmptyCell!17183) )
))
(declare-fun mapRest!55892 () (Array (_ BitVec 32) ValueCell!17183))

(declare-fun mapKey!55892 () (_ BitVec 32))

(declare-fun mapValue!55892 () ValueCell!17183)

(declare-datatypes ((array!89331 0))(
  ( (array!89332 (arr!43135 (Array (_ BitVec 32) ValueCell!17183)) (size!43686 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89331)

(assert (=> mapNonEmpty!55892 (= (arr!43135 _values!1337) (store mapRest!55892 mapKey!55892 mapValue!55892))))

(declare-fun b!1324519 () Bool)

(declare-fun res!878811 () Bool)

(declare-fun e!755253 () Bool)

(assert (=> b!1324519 (=> (not res!878811) (not e!755253))))

(declare-datatypes ((array!89333 0))(
  ( (array!89334 (arr!43136 (Array (_ BitVec 32) (_ BitVec 64))) (size!43687 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89333)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1324519 (= res!878811 (and (= (size!43686 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43687 _keys!1609) (size!43686 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324520 () Bool)

(declare-fun e!755254 () Bool)

(declare-fun tp_is_empty!36163 () Bool)

(assert (=> b!1324520 (= e!755254 tp_is_empty!36163)))

(declare-fun res!878812 () Bool)

(assert (=> start!111910 (=> (not res!878812) (not e!755253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111910 (= res!878812 (validMask!0 mask!2019))))

(assert (=> start!111910 e!755253))

(declare-fun array_inv!32839 (array!89333) Bool)

(assert (=> start!111910 (array_inv!32839 _keys!1609)))

(assert (=> start!111910 true))

(assert (=> start!111910 tp_is_empty!36163))

(declare-fun e!755256 () Bool)

(declare-fun array_inv!32840 (array!89331) Bool)

(assert (=> start!111910 (and (array_inv!32840 _values!1337) e!755256)))

(assert (=> start!111910 tp!106505))

(declare-fun b!1324521 () Bool)

(declare-fun res!878816 () Bool)

(assert (=> b!1324521 (=> (not res!878816) (not e!755253))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324521 (= res!878816 (validKeyInArray!0 (select (arr!43136 _keys!1609) from!2000)))))

(declare-fun b!1324522 () Bool)

(assert (=> b!1324522 (= e!755256 (and e!755254 mapRes!55892))))

(declare-fun condMapEmpty!55892 () Bool)

(declare-fun mapDefault!55892 () ValueCell!17183)

(assert (=> b!1324522 (= condMapEmpty!55892 (= (arr!43135 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17183)) mapDefault!55892)))))

(declare-fun b!1324523 () Bool)

(declare-fun res!878815 () Bool)

(assert (=> b!1324523 (=> (not res!878815) (not e!755253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89333 (_ BitVec 32)) Bool)

(assert (=> b!1324523 (= res!878815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324524 () Bool)

(declare-fun res!878813 () Bool)

(assert (=> b!1324524 (=> (not res!878813) (not e!755253))))

(declare-fun zeroValue!1279 () V!53321)

(declare-fun minValue!1279 () V!53321)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23446 0))(
  ( (tuple2!23447 (_1!11734 (_ BitVec 64)) (_2!11734 V!53321)) )
))
(declare-datatypes ((List!30596 0))(
  ( (Nil!30593) (Cons!30592 (h!31810 tuple2!23446) (t!44480 List!30596)) )
))
(declare-datatypes ((ListLongMap!21111 0))(
  ( (ListLongMap!21112 (toList!10571 List!30596)) )
))
(declare-fun contains!8738 (ListLongMap!21111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5556 (array!89333 array!89331 (_ BitVec 32) (_ BitVec 32) V!53321 V!53321 (_ BitVec 32) Int) ListLongMap!21111)

(assert (=> b!1324524 (= res!878813 (contains!8738 (getCurrentListMap!5556 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55892 () Bool)

(assert (=> mapIsEmpty!55892 mapRes!55892))

(declare-fun b!1324525 () Bool)

(declare-fun res!878817 () Bool)

(assert (=> b!1324525 (=> (not res!878817) (not e!755253))))

(assert (=> b!1324525 (= res!878817 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43687 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324526 () Bool)

(declare-fun res!878814 () Bool)

(assert (=> b!1324526 (=> (not res!878814) (not e!755253))))

(assert (=> b!1324526 (= res!878814 (not (= (select (arr!43136 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324527 () Bool)

(declare-fun res!878818 () Bool)

(assert (=> b!1324527 (=> (not res!878818) (not e!755253))))

(declare-datatypes ((List!30597 0))(
  ( (Nil!30594) (Cons!30593 (h!31811 (_ BitVec 64)) (t!44481 List!30597)) )
))
(declare-fun arrayNoDuplicates!0 (array!89333 (_ BitVec 32) List!30597) Bool)

(assert (=> b!1324527 (= res!878818 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30594))))

(declare-fun b!1324528 () Bool)

(assert (=> b!1324528 (= e!755253 (not true))))

(declare-fun lt!589311 () ListLongMap!21111)

(declare-fun +!4643 (ListLongMap!21111 tuple2!23446) ListLongMap!21111)

(assert (=> b!1324528 (contains!8738 (+!4643 lt!589311 (tuple2!23447 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43573 0))(
  ( (Unit!43574) )
))
(declare-fun lt!589304 () Unit!43573)

(declare-fun addStillContains!1155 (ListLongMap!21111 (_ BitVec 64) V!53321 (_ BitVec 64)) Unit!43573)

(assert (=> b!1324528 (= lt!589304 (addStillContains!1155 lt!589311 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1324528 (contains!8738 lt!589311 k0!1164)))

(declare-fun lt!589307 () ListLongMap!21111)

(declare-fun lt!589305 () tuple2!23446)

(assert (=> b!1324528 (= lt!589311 (+!4643 lt!589307 lt!589305))))

(declare-fun lt!589312 () Unit!43573)

(assert (=> b!1324528 (= lt!589312 (addStillContains!1155 lt!589307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1324528 (contains!8738 lt!589307 k0!1164)))

(declare-fun lt!589309 () Unit!43573)

(declare-fun lt!589313 () V!53321)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!198 ((_ BitVec 64) (_ BitVec 64) V!53321 ListLongMap!21111) Unit!43573)

(assert (=> b!1324528 (= lt!589309 (lemmaInListMapAfterAddingDiffThenInBefore!198 k0!1164 (select (arr!43136 _keys!1609) from!2000) lt!589313 lt!589307))))

(declare-fun lt!589303 () ListLongMap!21111)

(assert (=> b!1324528 (contains!8738 lt!589303 k0!1164)))

(declare-fun lt!589308 () Unit!43573)

(assert (=> b!1324528 (= lt!589308 (lemmaInListMapAfterAddingDiffThenInBefore!198 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589303))))

(declare-fun lt!589310 () ListLongMap!21111)

(assert (=> b!1324528 (contains!8738 lt!589310 k0!1164)))

(declare-fun lt!589306 () Unit!43573)

(assert (=> b!1324528 (= lt!589306 (lemmaInListMapAfterAddingDiffThenInBefore!198 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589310))))

(assert (=> b!1324528 (= lt!589310 (+!4643 lt!589303 lt!589305))))

(assert (=> b!1324528 (= lt!589305 (tuple2!23447 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1324528 (= lt!589303 (+!4643 lt!589307 (tuple2!23447 (select (arr!43136 _keys!1609) from!2000) lt!589313)))))

(declare-fun get!21752 (ValueCell!17183 V!53321) V!53321)

(declare-fun dynLambda!3597 (Int (_ BitVec 64)) V!53321)

(assert (=> b!1324528 (= lt!589313 (get!21752 (select (arr!43135 _values!1337) from!2000) (dynLambda!3597 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6282 (array!89333 array!89331 (_ BitVec 32) (_ BitVec 32) V!53321 V!53321 (_ BitVec 32) Int) ListLongMap!21111)

(assert (=> b!1324528 (= lt!589307 (getCurrentListMapNoExtraKeys!6282 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1324529 () Bool)

(assert (=> b!1324529 (= e!755257 tp_is_empty!36163)))

(assert (= (and start!111910 res!878812) b!1324519))

(assert (= (and b!1324519 res!878811) b!1324523))

(assert (= (and b!1324523 res!878815) b!1324527))

(assert (= (and b!1324527 res!878818) b!1324525))

(assert (= (and b!1324525 res!878817) b!1324524))

(assert (= (and b!1324524 res!878813) b!1324526))

(assert (= (and b!1324526 res!878814) b!1324521))

(assert (= (and b!1324521 res!878816) b!1324528))

(assert (= (and b!1324522 condMapEmpty!55892) mapIsEmpty!55892))

(assert (= (and b!1324522 (not condMapEmpty!55892)) mapNonEmpty!55892))

(get-info :version)

(assert (= (and mapNonEmpty!55892 ((_ is ValueCellFull!17183) mapValue!55892)) b!1324529))

(assert (= (and b!1324522 ((_ is ValueCellFull!17183) mapDefault!55892)) b!1324520))

(assert (= start!111910 b!1324522))

(declare-fun b_lambda!23663 () Bool)

(assert (=> (not b_lambda!23663) (not b!1324528)))

(declare-fun t!44479 () Bool)

(declare-fun tb!11687 () Bool)

(assert (=> (and start!111910 (= defaultEntry!1340 defaultEntry!1340) t!44479) tb!11687))

(declare-fun result!24437 () Bool)

(assert (=> tb!11687 (= result!24437 tp_is_empty!36163)))

(assert (=> b!1324528 t!44479))

(declare-fun b_and!48849 () Bool)

(assert (= b_and!48847 (and (=> t!44479 result!24437) b_and!48849)))

(declare-fun m!1213493 () Bool)

(assert (=> b!1324526 m!1213493))

(declare-fun m!1213495 () Bool)

(assert (=> b!1324524 m!1213495))

(assert (=> b!1324524 m!1213495))

(declare-fun m!1213497 () Bool)

(assert (=> b!1324524 m!1213497))

(declare-fun m!1213499 () Bool)

(assert (=> start!111910 m!1213499))

(declare-fun m!1213501 () Bool)

(assert (=> start!111910 m!1213501))

(declare-fun m!1213503 () Bool)

(assert (=> start!111910 m!1213503))

(declare-fun m!1213505 () Bool)

(assert (=> b!1324528 m!1213505))

(declare-fun m!1213507 () Bool)

(assert (=> b!1324528 m!1213507))

(declare-fun m!1213509 () Bool)

(assert (=> b!1324528 m!1213509))

(declare-fun m!1213511 () Bool)

(assert (=> b!1324528 m!1213511))

(declare-fun m!1213513 () Bool)

(assert (=> b!1324528 m!1213513))

(declare-fun m!1213515 () Bool)

(assert (=> b!1324528 m!1213515))

(declare-fun m!1213517 () Bool)

(assert (=> b!1324528 m!1213517))

(declare-fun m!1213519 () Bool)

(assert (=> b!1324528 m!1213519))

(declare-fun m!1213521 () Bool)

(assert (=> b!1324528 m!1213521))

(declare-fun m!1213523 () Bool)

(assert (=> b!1324528 m!1213523))

(declare-fun m!1213525 () Bool)

(assert (=> b!1324528 m!1213525))

(declare-fun m!1213527 () Bool)

(assert (=> b!1324528 m!1213527))

(declare-fun m!1213529 () Bool)

(assert (=> b!1324528 m!1213529))

(assert (=> b!1324528 m!1213513))

(assert (=> b!1324528 m!1213507))

(declare-fun m!1213531 () Bool)

(assert (=> b!1324528 m!1213531))

(declare-fun m!1213533 () Bool)

(assert (=> b!1324528 m!1213533))

(assert (=> b!1324528 m!1213515))

(declare-fun m!1213535 () Bool)

(assert (=> b!1324528 m!1213535))

(declare-fun m!1213537 () Bool)

(assert (=> b!1324528 m!1213537))

(assert (=> b!1324528 m!1213493))

(declare-fun m!1213539 () Bool)

(assert (=> b!1324528 m!1213539))

(assert (=> b!1324528 m!1213493))

(assert (=> b!1324521 m!1213493))

(assert (=> b!1324521 m!1213493))

(declare-fun m!1213541 () Bool)

(assert (=> b!1324521 m!1213541))

(declare-fun m!1213543 () Bool)

(assert (=> b!1324523 m!1213543))

(declare-fun m!1213545 () Bool)

(assert (=> mapNonEmpty!55892 m!1213545))

(declare-fun m!1213547 () Bool)

(assert (=> b!1324527 m!1213547))

(check-sat tp_is_empty!36163 (not b!1324521) (not b!1324528) b_and!48849 (not start!111910) (not b!1324524) (not b_next!30343) (not b!1324523) (not mapNonEmpty!55892) (not b!1324527) (not b_lambda!23663))
(check-sat b_and!48849 (not b_next!30343))
