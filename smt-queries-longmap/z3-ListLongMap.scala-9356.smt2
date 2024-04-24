; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111796 () Bool)

(assert start!111796)

(declare-fun b_free!30229 () Bool)

(declare-fun b_next!30229 () Bool)

(assert (=> start!111796 (= b_free!30229 (not b_next!30229))))

(declare-fun tp!106162 () Bool)

(declare-fun b_and!48619 () Bool)

(assert (=> start!111796 (= tp!106162 b_and!48619)))

(declare-fun res!877444 () Bool)

(declare-fun e!754398 () Bool)

(assert (=> start!111796 (=> (not res!877444) (not e!754398))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111796 (= res!877444 (validMask!0 mask!2019))))

(assert (=> start!111796 e!754398))

(declare-datatypes ((array!89105 0))(
  ( (array!89106 (arr!43022 (Array (_ BitVec 32) (_ BitVec 64))) (size!43573 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89105)

(declare-fun array_inv!32753 (array!89105) Bool)

(assert (=> start!111796 (array_inv!32753 _keys!1609)))

(assert (=> start!111796 true))

(declare-fun tp_is_empty!36049 () Bool)

(assert (=> start!111796 tp_is_empty!36049))

(declare-datatypes ((V!53169 0))(
  ( (V!53170 (val!18099 Int)) )
))
(declare-datatypes ((ValueCell!17126 0))(
  ( (ValueCellFull!17126 (v!20724 V!53169)) (EmptyCell!17126) )
))
(declare-datatypes ((array!89107 0))(
  ( (array!89108 (arr!43023 (Array (_ BitVec 32) ValueCell!17126)) (size!43574 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89107)

(declare-fun e!754402 () Bool)

(declare-fun array_inv!32754 (array!89107) Bool)

(assert (=> start!111796 (and (array_inv!32754 _values!1337) e!754402)))

(assert (=> start!111796 tp!106162))

(declare-fun b!1322524 () Bool)

(declare-fun e!754401 () Bool)

(declare-fun mapRes!55721 () Bool)

(assert (=> b!1322524 (= e!754402 (and e!754401 mapRes!55721))))

(declare-fun condMapEmpty!55721 () Bool)

(declare-fun mapDefault!55721 () ValueCell!17126)

(assert (=> b!1322524 (= condMapEmpty!55721 (= (arr!43023 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17126)) mapDefault!55721)))))

(declare-fun b!1322525 () Bool)

(declare-fun res!877445 () Bool)

(assert (=> b!1322525 (=> (not res!877445) (not e!754398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89105 (_ BitVec 32)) Bool)

(assert (=> b!1322525 (= res!877445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55721 () Bool)

(declare-fun tp!106163 () Bool)

(declare-fun e!754400 () Bool)

(assert (=> mapNonEmpty!55721 (= mapRes!55721 (and tp!106163 e!754400))))

(declare-fun mapRest!55721 () (Array (_ BitVec 32) ValueCell!17126))

(declare-fun mapValue!55721 () ValueCell!17126)

(declare-fun mapKey!55721 () (_ BitVec 32))

(assert (=> mapNonEmpty!55721 (= (arr!43023 _values!1337) (store mapRest!55721 mapKey!55721 mapValue!55721))))

(declare-fun b!1322526 () Bool)

(declare-fun res!877443 () Bool)

(assert (=> b!1322526 (=> (not res!877443) (not e!754398))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1322526 (= res!877443 (and (= (size!43574 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43573 _keys!1609) (size!43574 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55721 () Bool)

(assert (=> mapIsEmpty!55721 mapRes!55721))

(declare-fun b!1322527 () Bool)

(declare-fun res!877447 () Bool)

(assert (=> b!1322527 (=> (not res!877447) (not e!754398))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322527 (= res!877447 (validKeyInArray!0 (select (arr!43022 _keys!1609) from!2000)))))

(declare-fun b!1322528 () Bool)

(declare-fun res!877450 () Bool)

(assert (=> b!1322528 (=> (not res!877450) (not e!754398))))

(declare-fun zeroValue!1279 () V!53169)

(declare-fun minValue!1279 () V!53169)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23350 0))(
  ( (tuple2!23351 (_1!11686 (_ BitVec 64)) (_2!11686 V!53169)) )
))
(declare-datatypes ((List!30503 0))(
  ( (Nil!30500) (Cons!30499 (h!31717 tuple2!23350) (t!44273 List!30503)) )
))
(declare-datatypes ((ListLongMap!21015 0))(
  ( (ListLongMap!21016 (toList!10523 List!30503)) )
))
(declare-fun contains!8690 (ListLongMap!21015 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5518 (array!89105 array!89107 (_ BitVec 32) (_ BitVec 32) V!53169 V!53169 (_ BitVec 32) Int) ListLongMap!21015)

(assert (=> b!1322528 (= res!877450 (contains!8690 (getCurrentListMap!5518 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322529 () Bool)

(declare-fun res!877449 () Bool)

(assert (=> b!1322529 (=> (not res!877449) (not e!754398))))

(declare-datatypes ((List!30504 0))(
  ( (Nil!30501) (Cons!30500 (h!31718 (_ BitVec 64)) (t!44274 List!30504)) )
))
(declare-fun arrayNoDuplicates!0 (array!89105 (_ BitVec 32) List!30504) Bool)

(assert (=> b!1322529 (= res!877449 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30501))))

(declare-fun b!1322530 () Bool)

(declare-fun res!877446 () Bool)

(assert (=> b!1322530 (=> (not res!877446) (not e!754398))))

(assert (=> b!1322530 (= res!877446 (not (= (select (arr!43022 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322531 () Bool)

(assert (=> b!1322531 (= e!754398 (not true))))

(declare-fun lt!587813 () ListLongMap!21015)

(assert (=> b!1322531 (contains!8690 lt!587813 k0!1164)))

(declare-fun lt!587812 () V!53169)

(declare-datatypes ((Unit!43491 0))(
  ( (Unit!43492) )
))
(declare-fun lt!587811 () Unit!43491)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!157 ((_ BitVec 64) (_ BitVec 64) V!53169 ListLongMap!21015) Unit!43491)

(assert (=> b!1322531 (= lt!587811 (lemmaInListMapAfterAddingDiffThenInBefore!157 k0!1164 (select (arr!43022 _keys!1609) from!2000) lt!587812 lt!587813))))

(declare-fun lt!587815 () ListLongMap!21015)

(assert (=> b!1322531 (contains!8690 lt!587815 k0!1164)))

(declare-fun lt!587814 () Unit!43491)

(assert (=> b!1322531 (= lt!587814 (lemmaInListMapAfterAddingDiffThenInBefore!157 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587815))))

(declare-fun lt!587810 () ListLongMap!21015)

(assert (=> b!1322531 (contains!8690 lt!587810 k0!1164)))

(declare-fun lt!587816 () Unit!43491)

(assert (=> b!1322531 (= lt!587816 (lemmaInListMapAfterAddingDiffThenInBefore!157 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587810))))

(declare-fun +!4602 (ListLongMap!21015 tuple2!23350) ListLongMap!21015)

(assert (=> b!1322531 (= lt!587810 (+!4602 lt!587815 (tuple2!23351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1322531 (= lt!587815 (+!4602 lt!587813 (tuple2!23351 (select (arr!43022 _keys!1609) from!2000) lt!587812)))))

(declare-fun get!21673 (ValueCell!17126 V!53169) V!53169)

(declare-fun dynLambda!3556 (Int (_ BitVec 64)) V!53169)

(assert (=> b!1322531 (= lt!587812 (get!21673 (select (arr!43023 _values!1337) from!2000) (dynLambda!3556 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6241 (array!89105 array!89107 (_ BitVec 32) (_ BitVec 32) V!53169 V!53169 (_ BitVec 32) Int) ListLongMap!21015)

(assert (=> b!1322531 (= lt!587813 (getCurrentListMapNoExtraKeys!6241 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322532 () Bool)

(assert (=> b!1322532 (= e!754401 tp_is_empty!36049)))

(declare-fun b!1322533 () Bool)

(assert (=> b!1322533 (= e!754400 tp_is_empty!36049)))

(declare-fun b!1322534 () Bool)

(declare-fun res!877448 () Bool)

(assert (=> b!1322534 (=> (not res!877448) (not e!754398))))

(assert (=> b!1322534 (= res!877448 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43573 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111796 res!877444) b!1322526))

(assert (= (and b!1322526 res!877443) b!1322525))

(assert (= (and b!1322525 res!877445) b!1322529))

(assert (= (and b!1322529 res!877449) b!1322534))

(assert (= (and b!1322534 res!877448) b!1322528))

(assert (= (and b!1322528 res!877450) b!1322530))

(assert (= (and b!1322530 res!877446) b!1322527))

(assert (= (and b!1322527 res!877447) b!1322531))

(assert (= (and b!1322524 condMapEmpty!55721) mapIsEmpty!55721))

(assert (= (and b!1322524 (not condMapEmpty!55721)) mapNonEmpty!55721))

(get-info :version)

(assert (= (and mapNonEmpty!55721 ((_ is ValueCellFull!17126) mapValue!55721)) b!1322533))

(assert (= (and b!1322524 ((_ is ValueCellFull!17126) mapDefault!55721)) b!1322532))

(assert (= start!111796 b!1322524))

(declare-fun b_lambda!23549 () Bool)

(assert (=> (not b_lambda!23549) (not b!1322531)))

(declare-fun t!44272 () Bool)

(declare-fun tb!11573 () Bool)

(assert (=> (and start!111796 (= defaultEntry!1340 defaultEntry!1340) t!44272) tb!11573))

(declare-fun result!24209 () Bool)

(assert (=> tb!11573 (= result!24209 tp_is_empty!36049)))

(assert (=> b!1322531 t!44272))

(declare-fun b_and!48621 () Bool)

(assert (= b_and!48619 (and (=> t!44272 result!24209) b_and!48621)))

(declare-fun m!1210697 () Bool)

(assert (=> b!1322525 m!1210697))

(declare-fun m!1210699 () Bool)

(assert (=> mapNonEmpty!55721 m!1210699))

(declare-fun m!1210701 () Bool)

(assert (=> start!111796 m!1210701))

(declare-fun m!1210703 () Bool)

(assert (=> start!111796 m!1210703))

(declare-fun m!1210705 () Bool)

(assert (=> start!111796 m!1210705))

(declare-fun m!1210707 () Bool)

(assert (=> b!1322527 m!1210707))

(assert (=> b!1322527 m!1210707))

(declare-fun m!1210709 () Bool)

(assert (=> b!1322527 m!1210709))

(declare-fun m!1210711 () Bool)

(assert (=> b!1322529 m!1210711))

(declare-fun m!1210713 () Bool)

(assert (=> b!1322531 m!1210713))

(declare-fun m!1210715 () Bool)

(assert (=> b!1322531 m!1210715))

(declare-fun m!1210717 () Bool)

(assert (=> b!1322531 m!1210717))

(declare-fun m!1210719 () Bool)

(assert (=> b!1322531 m!1210719))

(declare-fun m!1210721 () Bool)

(assert (=> b!1322531 m!1210721))

(declare-fun m!1210723 () Bool)

(assert (=> b!1322531 m!1210723))

(declare-fun m!1210725 () Bool)

(assert (=> b!1322531 m!1210725))

(declare-fun m!1210727 () Bool)

(assert (=> b!1322531 m!1210727))

(assert (=> b!1322531 m!1210725))

(assert (=> b!1322531 m!1210719))

(declare-fun m!1210729 () Bool)

(assert (=> b!1322531 m!1210729))

(assert (=> b!1322531 m!1210707))

(declare-fun m!1210731 () Bool)

(assert (=> b!1322531 m!1210731))

(declare-fun m!1210733 () Bool)

(assert (=> b!1322531 m!1210733))

(assert (=> b!1322531 m!1210707))

(declare-fun m!1210735 () Bool)

(assert (=> b!1322531 m!1210735))

(assert (=> b!1322530 m!1210707))

(declare-fun m!1210737 () Bool)

(assert (=> b!1322528 m!1210737))

(assert (=> b!1322528 m!1210737))

(declare-fun m!1210739 () Bool)

(assert (=> b!1322528 m!1210739))

(check-sat (not start!111796) (not b!1322528) tp_is_empty!36049 (not b_lambda!23549) (not b!1322529) (not b!1322531) b_and!48621 (not mapNonEmpty!55721) (not b!1322525) (not b_next!30229) (not b!1322527))
(check-sat b_and!48621 (not b_next!30229))
