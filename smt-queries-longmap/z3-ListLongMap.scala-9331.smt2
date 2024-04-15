; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111422 () Bool)

(assert start!111422)

(declare-fun b_free!30079 () Bool)

(declare-fun b_next!30079 () Bool)

(assert (=> start!111422 (= b_free!30079 (not b_next!30079))))

(declare-fun tp!105714 () Bool)

(declare-fun b_and!48299 () Bool)

(assert (=> start!111422 (= tp!105714 b_and!48299)))

(declare-fun b!1318530 () Bool)

(declare-fun res!875101 () Bool)

(declare-fun e!752400 () Bool)

(assert (=> b!1318530 (=> (not res!875101) (not e!752400))))

(declare-datatypes ((array!88665 0))(
  ( (array!88666 (arr!42807 (Array (_ BitVec 32) (_ BitVec 64))) (size!43359 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88665)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318530 (= res!875101 (validKeyInArray!0 (select (arr!42807 _keys!1609) from!2000)))))

(declare-fun res!875096 () Bool)

(assert (=> start!111422 (=> (not res!875096) (not e!752400))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111422 (= res!875096 (validMask!0 mask!2019))))

(assert (=> start!111422 e!752400))

(declare-fun array_inv!32507 (array!88665) Bool)

(assert (=> start!111422 (array_inv!32507 _keys!1609)))

(assert (=> start!111422 true))

(declare-fun tp_is_empty!35899 () Bool)

(assert (=> start!111422 tp_is_empty!35899))

(declare-datatypes ((V!52969 0))(
  ( (V!52970 (val!18024 Int)) )
))
(declare-datatypes ((ValueCell!17051 0))(
  ( (ValueCellFull!17051 (v!20653 V!52969)) (EmptyCell!17051) )
))
(declare-datatypes ((array!88667 0))(
  ( (array!88668 (arr!42808 (Array (_ BitVec 32) ValueCell!17051)) (size!43360 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88667)

(declare-fun e!752399 () Bool)

(declare-fun array_inv!32508 (array!88667) Bool)

(assert (=> start!111422 (and (array_inv!32508 _values!1337) e!752399)))

(assert (=> start!111422 tp!105714))

(declare-fun b!1318531 () Bool)

(declare-fun res!875103 () Bool)

(assert (=> b!1318531 (=> (not res!875103) (not e!752400))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318531 (= res!875103 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43359 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318532 () Bool)

(declare-fun res!875097 () Bool)

(assert (=> b!1318532 (=> (not res!875097) (not e!752400))))

(assert (=> b!1318532 (= res!875097 (not (= (select (arr!42807 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1318533 () Bool)

(declare-fun res!875099 () Bool)

(assert (=> b!1318533 (=> (not res!875099) (not e!752400))))

(assert (=> b!1318533 (= res!875099 (and (= (size!43360 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43359 _keys!1609) (size!43360 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318534 () Bool)

(assert (=> b!1318534 (= e!752400 (not true))))

(declare-datatypes ((tuple2!23280 0))(
  ( (tuple2!23281 (_1!11651 (_ BitVec 64)) (_2!11651 V!52969)) )
))
(declare-datatypes ((List!30417 0))(
  ( (Nil!30414) (Cons!30413 (h!31622 tuple2!23280) (t!44037 List!30417)) )
))
(declare-datatypes ((ListLongMap!20937 0))(
  ( (ListLongMap!20938 (toList!10484 List!30417)) )
))
(declare-fun lt!586310 () ListLongMap!20937)

(declare-fun contains!8567 (ListLongMap!20937 (_ BitVec 64)) Bool)

(assert (=> b!1318534 (contains!8567 lt!586310 k0!1164)))

(declare-datatypes ((Unit!43253 0))(
  ( (Unit!43254) )
))
(declare-fun lt!586311 () Unit!43253)

(declare-fun minValue!1279 () V!52969)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!100 ((_ BitVec 64) (_ BitVec 64) V!52969 ListLongMap!20937) Unit!43253)

(assert (=> b!1318534 (= lt!586311 (lemmaInListMapAfterAddingDiffThenInBefore!100 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586310))))

(declare-fun zeroValue!1279 () V!52969)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4535 (ListLongMap!20937 tuple2!23280) ListLongMap!20937)

(declare-fun getCurrentListMapNoExtraKeys!6168 (array!88665 array!88667 (_ BitVec 32) (_ BitVec 32) V!52969 V!52969 (_ BitVec 32) Int) ListLongMap!20937)

(declare-fun get!21520 (ValueCell!17051 V!52969) V!52969)

(declare-fun dynLambda!3465 (Int (_ BitVec 64)) V!52969)

(assert (=> b!1318534 (= lt!586310 (+!4535 (+!4535 (getCurrentListMapNoExtraKeys!6168 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23281 (select (arr!42807 _keys!1609) from!2000) (get!21520 (select (arr!42808 _values!1337) from!2000) (dynLambda!3465 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23281 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1318535 () Bool)

(declare-fun res!875100 () Bool)

(assert (=> b!1318535 (=> (not res!875100) (not e!752400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88665 (_ BitVec 32)) Bool)

(assert (=> b!1318535 (= res!875100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318536 () Bool)

(declare-fun res!875102 () Bool)

(assert (=> b!1318536 (=> (not res!875102) (not e!752400))))

(declare-datatypes ((List!30418 0))(
  ( (Nil!30415) (Cons!30414 (h!31623 (_ BitVec 64)) (t!44038 List!30418)) )
))
(declare-fun arrayNoDuplicates!0 (array!88665 (_ BitVec 32) List!30418) Bool)

(assert (=> b!1318536 (= res!875102 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30415))))

(declare-fun b!1318537 () Bool)

(declare-fun e!752401 () Bool)

(assert (=> b!1318537 (= e!752401 tp_is_empty!35899)))

(declare-fun mapIsEmpty!55496 () Bool)

(declare-fun mapRes!55496 () Bool)

(assert (=> mapIsEmpty!55496 mapRes!55496))

(declare-fun b!1318538 () Bool)

(declare-fun res!875098 () Bool)

(assert (=> b!1318538 (=> (not res!875098) (not e!752400))))

(declare-fun getCurrentListMap!5377 (array!88665 array!88667 (_ BitVec 32) (_ BitVec 32) V!52969 V!52969 (_ BitVec 32) Int) ListLongMap!20937)

(assert (=> b!1318538 (= res!875098 (contains!8567 (getCurrentListMap!5377 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55496 () Bool)

(declare-fun tp!105713 () Bool)

(assert (=> mapNonEmpty!55496 (= mapRes!55496 (and tp!105713 e!752401))))

(declare-fun mapValue!55496 () ValueCell!17051)

(declare-fun mapKey!55496 () (_ BitVec 32))

(declare-fun mapRest!55496 () (Array (_ BitVec 32) ValueCell!17051))

(assert (=> mapNonEmpty!55496 (= (arr!42808 _values!1337) (store mapRest!55496 mapKey!55496 mapValue!55496))))

(declare-fun b!1318539 () Bool)

(declare-fun e!752398 () Bool)

(assert (=> b!1318539 (= e!752399 (and e!752398 mapRes!55496))))

(declare-fun condMapEmpty!55496 () Bool)

(declare-fun mapDefault!55496 () ValueCell!17051)

(assert (=> b!1318539 (= condMapEmpty!55496 (= (arr!42808 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17051)) mapDefault!55496)))))

(declare-fun b!1318540 () Bool)

(assert (=> b!1318540 (= e!752398 tp_is_empty!35899)))

(assert (= (and start!111422 res!875096) b!1318533))

(assert (= (and b!1318533 res!875099) b!1318535))

(assert (= (and b!1318535 res!875100) b!1318536))

(assert (= (and b!1318536 res!875102) b!1318531))

(assert (= (and b!1318531 res!875103) b!1318538))

(assert (= (and b!1318538 res!875098) b!1318532))

(assert (= (and b!1318532 res!875097) b!1318530))

(assert (= (and b!1318530 res!875101) b!1318534))

(assert (= (and b!1318539 condMapEmpty!55496) mapIsEmpty!55496))

(assert (= (and b!1318539 (not condMapEmpty!55496)) mapNonEmpty!55496))

(get-info :version)

(assert (= (and mapNonEmpty!55496 ((_ is ValueCellFull!17051) mapValue!55496)) b!1318537))

(assert (= (and b!1318539 ((_ is ValueCellFull!17051) mapDefault!55496)) b!1318540))

(assert (= start!111422 b!1318539))

(declare-fun b_lambda!23395 () Bool)

(assert (=> (not b_lambda!23395) (not b!1318534)))

(declare-fun t!44036 () Bool)

(declare-fun tb!11423 () Bool)

(assert (=> (and start!111422 (= defaultEntry!1340 defaultEntry!1340) t!44036) tb!11423))

(declare-fun result!23909 () Bool)

(assert (=> tb!11423 (= result!23909 tp_is_empty!35899)))

(assert (=> b!1318534 t!44036))

(declare-fun b_and!48301 () Bool)

(assert (= b_and!48299 (and (=> t!44036 result!23909) b_and!48301)))

(declare-fun m!1205655 () Bool)

(assert (=> start!111422 m!1205655))

(declare-fun m!1205657 () Bool)

(assert (=> start!111422 m!1205657))

(declare-fun m!1205659 () Bool)

(assert (=> start!111422 m!1205659))

(declare-fun m!1205661 () Bool)

(assert (=> b!1318530 m!1205661))

(assert (=> b!1318530 m!1205661))

(declare-fun m!1205663 () Bool)

(assert (=> b!1318530 m!1205663))

(declare-fun m!1205665 () Bool)

(assert (=> b!1318536 m!1205665))

(declare-fun m!1205667 () Bool)

(assert (=> b!1318538 m!1205667))

(assert (=> b!1318538 m!1205667))

(declare-fun m!1205669 () Bool)

(assert (=> b!1318538 m!1205669))

(declare-fun m!1205671 () Bool)

(assert (=> b!1318535 m!1205671))

(assert (=> b!1318532 m!1205661))

(declare-fun m!1205673 () Bool)

(assert (=> b!1318534 m!1205673))

(declare-fun m!1205675 () Bool)

(assert (=> b!1318534 m!1205675))

(declare-fun m!1205677 () Bool)

(assert (=> b!1318534 m!1205677))

(assert (=> b!1318534 m!1205675))

(declare-fun m!1205679 () Bool)

(assert (=> b!1318534 m!1205679))

(declare-fun m!1205681 () Bool)

(assert (=> b!1318534 m!1205681))

(assert (=> b!1318534 m!1205679))

(declare-fun m!1205683 () Bool)

(assert (=> b!1318534 m!1205683))

(assert (=> b!1318534 m!1205681))

(assert (=> b!1318534 m!1205677))

(declare-fun m!1205685 () Bool)

(assert (=> b!1318534 m!1205685))

(declare-fun m!1205687 () Bool)

(assert (=> b!1318534 m!1205687))

(assert (=> b!1318534 m!1205661))

(declare-fun m!1205689 () Bool)

(assert (=> mapNonEmpty!55496 m!1205689))

(check-sat (not b!1318536) (not mapNonEmpty!55496) (not b!1318534) (not b_lambda!23395) (not b!1318538) (not b_next!30079) b_and!48301 (not start!111422) (not b!1318535) tp_is_empty!35899 (not b!1318530))
(check-sat b_and!48301 (not b_next!30079))
