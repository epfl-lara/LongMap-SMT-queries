; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111440 () Bool)

(assert start!111440)

(declare-fun b_free!30097 () Bool)

(declare-fun b_next!30097 () Bool)

(assert (=> start!111440 (= b_free!30097 (not b_next!30097))))

(declare-fun tp!105767 () Bool)

(declare-fun b_and!48335 () Bool)

(assert (=> start!111440 (= tp!105767 b_and!48335)))

(declare-fun b!1318845 () Bool)

(declare-fun res!875314 () Bool)

(declare-fun e!752532 () Bool)

(assert (=> b!1318845 (=> (not res!875314) (not e!752532))))

(declare-datatypes ((array!88701 0))(
  ( (array!88702 (arr!42825 (Array (_ BitVec 32) (_ BitVec 64))) (size!43377 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88701)

(declare-datatypes ((List!30433 0))(
  ( (Nil!30430) (Cons!30429 (h!31638 (_ BitVec 64)) (t!44071 List!30433)) )
))
(declare-fun arrayNoDuplicates!0 (array!88701 (_ BitVec 32) List!30433) Bool)

(assert (=> b!1318845 (= res!875314 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30430))))

(declare-fun b!1318846 () Bool)

(declare-fun res!875316 () Bool)

(assert (=> b!1318846 (=> (not res!875316) (not e!752532))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318846 (= res!875316 (validKeyInArray!0 (select (arr!42825 _keys!1609) from!2000)))))

(declare-fun b!1318847 () Bool)

(assert (=> b!1318847 (= e!752532 (not true))))

(declare-datatypes ((V!52993 0))(
  ( (V!52994 (val!18033 Int)) )
))
(declare-datatypes ((tuple2!23296 0))(
  ( (tuple2!23297 (_1!11659 (_ BitVec 64)) (_2!11659 V!52993)) )
))
(declare-datatypes ((List!30434 0))(
  ( (Nil!30431) (Cons!30430 (h!31639 tuple2!23296) (t!44072 List!30434)) )
))
(declare-datatypes ((ListLongMap!20953 0))(
  ( (ListLongMap!20954 (toList!10492 List!30434)) )
))
(declare-fun lt!586364 () ListLongMap!20953)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8575 (ListLongMap!20953 (_ BitVec 64)) Bool)

(assert (=> b!1318847 (contains!8575 lt!586364 k0!1164)))

(declare-datatypes ((Unit!43265 0))(
  ( (Unit!43266) )
))
(declare-fun lt!586365 () Unit!43265)

(declare-fun minValue!1279 () V!52993)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!106 ((_ BitVec 64) (_ BitVec 64) V!52993 ListLongMap!20953) Unit!43265)

(assert (=> b!1318847 (= lt!586365 (lemmaInListMapAfterAddingDiffThenInBefore!106 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586364))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52993)

(declare-datatypes ((ValueCell!17060 0))(
  ( (ValueCellFull!17060 (v!20662 V!52993)) (EmptyCell!17060) )
))
(declare-datatypes ((array!88703 0))(
  ( (array!88704 (arr!42826 (Array (_ BitVec 32) ValueCell!17060)) (size!43378 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88703)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun +!4541 (ListLongMap!20953 tuple2!23296) ListLongMap!20953)

(declare-fun getCurrentListMapNoExtraKeys!6174 (array!88701 array!88703 (_ BitVec 32) (_ BitVec 32) V!52993 V!52993 (_ BitVec 32) Int) ListLongMap!20953)

(declare-fun get!21532 (ValueCell!17060 V!52993) V!52993)

(declare-fun dynLambda!3471 (Int (_ BitVec 64)) V!52993)

(assert (=> b!1318847 (= lt!586364 (+!4541 (+!4541 (getCurrentListMapNoExtraKeys!6174 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23297 (select (arr!42825 _keys!1609) from!2000) (get!21532 (select (arr!42826 _values!1337) from!2000) (dynLambda!3471 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23297 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1318848 () Bool)

(declare-fun res!875318 () Bool)

(assert (=> b!1318848 (=> (not res!875318) (not e!752532))))

(assert (=> b!1318848 (= res!875318 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43377 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!875312 () Bool)

(assert (=> start!111440 (=> (not res!875312) (not e!752532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111440 (= res!875312 (validMask!0 mask!2019))))

(assert (=> start!111440 e!752532))

(declare-fun array_inv!32521 (array!88701) Bool)

(assert (=> start!111440 (array_inv!32521 _keys!1609)))

(assert (=> start!111440 true))

(declare-fun tp_is_empty!35917 () Bool)

(assert (=> start!111440 tp_is_empty!35917))

(declare-fun e!752533 () Bool)

(declare-fun array_inv!32522 (array!88703) Bool)

(assert (=> start!111440 (and (array_inv!32522 _values!1337) e!752533)))

(assert (=> start!111440 tp!105767))

(declare-fun mapIsEmpty!55523 () Bool)

(declare-fun mapRes!55523 () Bool)

(assert (=> mapIsEmpty!55523 mapRes!55523))

(declare-fun b!1318849 () Bool)

(declare-fun e!752535 () Bool)

(assert (=> b!1318849 (= e!752533 (and e!752535 mapRes!55523))))

(declare-fun condMapEmpty!55523 () Bool)

(declare-fun mapDefault!55523 () ValueCell!17060)

(assert (=> b!1318849 (= condMapEmpty!55523 (= (arr!42826 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17060)) mapDefault!55523)))))

(declare-fun b!1318850 () Bool)

(assert (=> b!1318850 (= e!752535 tp_is_empty!35917)))

(declare-fun b!1318851 () Bool)

(declare-fun res!875319 () Bool)

(assert (=> b!1318851 (=> (not res!875319) (not e!752532))))

(assert (=> b!1318851 (= res!875319 (and (= (size!43378 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43377 _keys!1609) (size!43378 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318852 () Bool)

(declare-fun res!875315 () Bool)

(assert (=> b!1318852 (=> (not res!875315) (not e!752532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88701 (_ BitVec 32)) Bool)

(assert (=> b!1318852 (= res!875315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318853 () Bool)

(declare-fun res!875317 () Bool)

(assert (=> b!1318853 (=> (not res!875317) (not e!752532))))

(declare-fun getCurrentListMap!5385 (array!88701 array!88703 (_ BitVec 32) (_ BitVec 32) V!52993 V!52993 (_ BitVec 32) Int) ListLongMap!20953)

(assert (=> b!1318853 (= res!875317 (contains!8575 (getCurrentListMap!5385 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318854 () Bool)

(declare-fun e!752534 () Bool)

(assert (=> b!1318854 (= e!752534 tp_is_empty!35917)))

(declare-fun mapNonEmpty!55523 () Bool)

(declare-fun tp!105768 () Bool)

(assert (=> mapNonEmpty!55523 (= mapRes!55523 (and tp!105768 e!752534))))

(declare-fun mapRest!55523 () (Array (_ BitVec 32) ValueCell!17060))

(declare-fun mapValue!55523 () ValueCell!17060)

(declare-fun mapKey!55523 () (_ BitVec 32))

(assert (=> mapNonEmpty!55523 (= (arr!42826 _values!1337) (store mapRest!55523 mapKey!55523 mapValue!55523))))

(declare-fun b!1318855 () Bool)

(declare-fun res!875313 () Bool)

(assert (=> b!1318855 (=> (not res!875313) (not e!752532))))

(assert (=> b!1318855 (= res!875313 (not (= (select (arr!42825 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111440 res!875312) b!1318851))

(assert (= (and b!1318851 res!875319) b!1318852))

(assert (= (and b!1318852 res!875315) b!1318845))

(assert (= (and b!1318845 res!875314) b!1318848))

(assert (= (and b!1318848 res!875318) b!1318853))

(assert (= (and b!1318853 res!875317) b!1318855))

(assert (= (and b!1318855 res!875313) b!1318846))

(assert (= (and b!1318846 res!875316) b!1318847))

(assert (= (and b!1318849 condMapEmpty!55523) mapIsEmpty!55523))

(assert (= (and b!1318849 (not condMapEmpty!55523)) mapNonEmpty!55523))

(get-info :version)

(assert (= (and mapNonEmpty!55523 ((_ is ValueCellFull!17060) mapValue!55523)) b!1318854))

(assert (= (and b!1318849 ((_ is ValueCellFull!17060) mapDefault!55523)) b!1318850))

(assert (= start!111440 b!1318849))

(declare-fun b_lambda!23413 () Bool)

(assert (=> (not b_lambda!23413) (not b!1318847)))

(declare-fun t!44070 () Bool)

(declare-fun tb!11441 () Bool)

(assert (=> (and start!111440 (= defaultEntry!1340 defaultEntry!1340) t!44070) tb!11441))

(declare-fun result!23945 () Bool)

(assert (=> tb!11441 (= result!23945 tp_is_empty!35917)))

(assert (=> b!1318847 t!44070))

(declare-fun b_and!48337 () Bool)

(assert (= b_and!48335 (and (=> t!44070 result!23945) b_and!48337)))

(declare-fun m!1205979 () Bool)

(assert (=> b!1318845 m!1205979))

(declare-fun m!1205981 () Bool)

(assert (=> b!1318853 m!1205981))

(assert (=> b!1318853 m!1205981))

(declare-fun m!1205983 () Bool)

(assert (=> b!1318853 m!1205983))

(declare-fun m!1205985 () Bool)

(assert (=> b!1318852 m!1205985))

(declare-fun m!1205987 () Bool)

(assert (=> b!1318846 m!1205987))

(assert (=> b!1318846 m!1205987))

(declare-fun m!1205989 () Bool)

(assert (=> b!1318846 m!1205989))

(declare-fun m!1205991 () Bool)

(assert (=> start!111440 m!1205991))

(declare-fun m!1205993 () Bool)

(assert (=> start!111440 m!1205993))

(declare-fun m!1205995 () Bool)

(assert (=> start!111440 m!1205995))

(assert (=> b!1318855 m!1205987))

(declare-fun m!1205997 () Bool)

(assert (=> mapNonEmpty!55523 m!1205997))

(declare-fun m!1205999 () Bool)

(assert (=> b!1318847 m!1205999))

(declare-fun m!1206001 () Bool)

(assert (=> b!1318847 m!1206001))

(declare-fun m!1206003 () Bool)

(assert (=> b!1318847 m!1206003))

(assert (=> b!1318847 m!1206001))

(declare-fun m!1206005 () Bool)

(assert (=> b!1318847 m!1206005))

(declare-fun m!1206007 () Bool)

(assert (=> b!1318847 m!1206007))

(declare-fun m!1206009 () Bool)

(assert (=> b!1318847 m!1206009))

(assert (=> b!1318847 m!1206005))

(declare-fun m!1206011 () Bool)

(assert (=> b!1318847 m!1206011))

(assert (=> b!1318847 m!1206009))

(assert (=> b!1318847 m!1206003))

(declare-fun m!1206013 () Bool)

(assert (=> b!1318847 m!1206013))

(assert (=> b!1318847 m!1205987))

(check-sat (not b!1318846) tp_is_empty!35917 (not b!1318852) (not b!1318847) (not b_lambda!23413) (not b!1318845) (not b!1318853) b_and!48337 (not mapNonEmpty!55523) (not b_next!30097) (not start!111440))
(check-sat b_and!48337 (not b_next!30097))
