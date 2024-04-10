; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111646 () Bool)

(assert start!111646)

(declare-fun b_free!30303 () Bool)

(declare-fun b_next!30303 () Bool)

(assert (=> start!111646 (= b_free!30303 (not b_next!30303))))

(declare-fun tp!106385 () Bool)

(declare-fun b_and!48765 () Bool)

(assert (=> start!111646 (= tp!106385 b_and!48765)))

(declare-fun res!877819 () Bool)

(declare-fun e!754114 () Bool)

(assert (=> start!111646 (=> (not res!877819) (not e!754114))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111646 (= res!877819 (validMask!0 mask!2019))))

(assert (=> start!111646 e!754114))

(declare-datatypes ((array!89168 0))(
  ( (array!89169 (arr!43058 (Array (_ BitVec 32) (_ BitVec 64))) (size!43608 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89168)

(declare-fun array_inv!32509 (array!89168) Bool)

(assert (=> start!111646 (array_inv!32509 _keys!1609)))

(assert (=> start!111646 true))

(declare-fun tp_is_empty!36123 () Bool)

(assert (=> start!111646 tp_is_empty!36123))

(declare-datatypes ((V!53267 0))(
  ( (V!53268 (val!18136 Int)) )
))
(declare-datatypes ((ValueCell!17163 0))(
  ( (ValueCellFull!17163 (v!20766 V!53267)) (EmptyCell!17163) )
))
(declare-datatypes ((array!89170 0))(
  ( (array!89171 (arr!43059 (Array (_ BitVec 32) ValueCell!17163)) (size!43609 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89170)

(declare-fun e!754112 () Bool)

(declare-fun array_inv!32510 (array!89170) Bool)

(assert (=> start!111646 (and (array_inv!32510 _values!1337) e!754112)))

(assert (=> start!111646 tp!106385))

(declare-fun mapIsEmpty!55832 () Bool)

(declare-fun mapRes!55832 () Bool)

(assert (=> mapIsEmpty!55832 mapRes!55832))

(declare-fun b!1322520 () Bool)

(declare-fun e!754110 () Bool)

(assert (=> b!1322520 (= e!754110 tp_is_empty!36123)))

(declare-fun b!1322521 () Bool)

(declare-fun res!877818 () Bool)

(assert (=> b!1322521 (=> (not res!877818) (not e!754114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89168 (_ BitVec 32)) Bool)

(assert (=> b!1322521 (= res!877818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55832 () Bool)

(declare-fun tp!106384 () Bool)

(assert (=> mapNonEmpty!55832 (= mapRes!55832 (and tp!106384 e!754110))))

(declare-fun mapKey!55832 () (_ BitVec 32))

(declare-fun mapValue!55832 () ValueCell!17163)

(declare-fun mapRest!55832 () (Array (_ BitVec 32) ValueCell!17163))

(assert (=> mapNonEmpty!55832 (= (arr!43059 _values!1337) (store mapRest!55832 mapKey!55832 mapValue!55832))))

(declare-fun b!1322522 () Bool)

(declare-fun res!877815 () Bool)

(assert (=> b!1322522 (=> (not res!877815) (not e!754114))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53267)

(declare-fun minValue!1279 () V!53267)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23368 0))(
  ( (tuple2!23369 (_1!11695 (_ BitVec 64)) (_2!11695 V!53267)) )
))
(declare-datatypes ((List!30513 0))(
  ( (Nil!30510) (Cons!30509 (h!31718 tuple2!23368) (t!44365 List!30513)) )
))
(declare-datatypes ((ListLongMap!21025 0))(
  ( (ListLongMap!21026 (toList!10528 List!30513)) )
))
(declare-fun contains!8683 (ListLongMap!21025 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5529 (array!89168 array!89170 (_ BitVec 32) (_ BitVec 32) V!53267 V!53267 (_ BitVec 32) Int) ListLongMap!21025)

(assert (=> b!1322522 (= res!877815 (contains!8683 (getCurrentListMap!5529 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322523 () Bool)

(declare-fun res!877813 () Bool)

(assert (=> b!1322523 (=> (not res!877813) (not e!754114))))

(assert (=> b!1322523 (= res!877813 (not (= (select (arr!43058 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322524 () Bool)

(declare-fun res!877814 () Bool)

(assert (=> b!1322524 (=> (not res!877814) (not e!754114))))

(assert (=> b!1322524 (= res!877814 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43608 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322525 () Bool)

(declare-fun e!754111 () Bool)

(assert (=> b!1322525 (= e!754112 (and e!754111 mapRes!55832))))

(declare-fun condMapEmpty!55832 () Bool)

(declare-fun mapDefault!55832 () ValueCell!17163)

(assert (=> b!1322525 (= condMapEmpty!55832 (= (arr!43059 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17163)) mapDefault!55832)))))

(declare-fun b!1322526 () Bool)

(assert (=> b!1322526 (= e!754111 tp_is_empty!36123)))

(declare-fun b!1322527 () Bool)

(declare-fun res!877816 () Bool)

(assert (=> b!1322527 (=> (not res!877816) (not e!754114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322527 (= res!877816 (validKeyInArray!0 (select (arr!43058 _keys!1609) from!2000)))))

(declare-fun b!1322528 () Bool)

(assert (=> b!1322528 (= e!754114 (not true))))

(declare-fun lt!588237 () ListLongMap!21025)

(declare-fun lt!588229 () tuple2!23368)

(declare-fun +!4580 (ListLongMap!21025 tuple2!23368) ListLongMap!21025)

(assert (=> b!1322528 (contains!8683 (+!4580 lt!588237 lt!588229) k0!1164)))

(declare-datatypes ((Unit!43580 0))(
  ( (Unit!43581) )
))
(declare-fun lt!588230 () Unit!43580)

(declare-fun addStillContains!1129 (ListLongMap!21025 (_ BitVec 64) V!53267 (_ BitVec 64)) Unit!43580)

(assert (=> b!1322528 (= lt!588230 (addStillContains!1129 lt!588237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322528 (contains!8683 lt!588237 k0!1164)))

(declare-fun lt!588235 () Unit!43580)

(declare-fun lt!588231 () V!53267)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!176 ((_ BitVec 64) (_ BitVec 64) V!53267 ListLongMap!21025) Unit!43580)

(assert (=> b!1322528 (= lt!588235 (lemmaInListMapAfterAddingDiffThenInBefore!176 k0!1164 (select (arr!43058 _keys!1609) from!2000) lt!588231 lt!588237))))

(declare-fun lt!588234 () ListLongMap!21025)

(assert (=> b!1322528 (contains!8683 lt!588234 k0!1164)))

(declare-fun lt!588232 () Unit!43580)

(assert (=> b!1322528 (= lt!588232 (lemmaInListMapAfterAddingDiffThenInBefore!176 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588234))))

(declare-fun lt!588236 () ListLongMap!21025)

(assert (=> b!1322528 (contains!8683 lt!588236 k0!1164)))

(declare-fun lt!588233 () Unit!43580)

(assert (=> b!1322528 (= lt!588233 (lemmaInListMapAfterAddingDiffThenInBefore!176 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588236))))

(assert (=> b!1322528 (= lt!588236 (+!4580 lt!588234 lt!588229))))

(assert (=> b!1322528 (= lt!588229 (tuple2!23369 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322528 (= lt!588234 (+!4580 lt!588237 (tuple2!23369 (select (arr!43058 _keys!1609) from!2000) lt!588231)))))

(declare-fun get!21672 (ValueCell!17163 V!53267) V!53267)

(declare-fun dynLambda!3519 (Int (_ BitVec 64)) V!53267)

(assert (=> b!1322528 (= lt!588231 (get!21672 (select (arr!43059 _values!1337) from!2000) (dynLambda!3519 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6215 (array!89168 array!89170 (_ BitVec 32) (_ BitVec 32) V!53267 V!53267 (_ BitVec 32) Int) ListLongMap!21025)

(assert (=> b!1322528 (= lt!588237 (getCurrentListMapNoExtraKeys!6215 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322529 () Bool)

(declare-fun res!877820 () Bool)

(assert (=> b!1322529 (=> (not res!877820) (not e!754114))))

(declare-datatypes ((List!30514 0))(
  ( (Nil!30511) (Cons!30510 (h!31719 (_ BitVec 64)) (t!44366 List!30514)) )
))
(declare-fun arrayNoDuplicates!0 (array!89168 (_ BitVec 32) List!30514) Bool)

(assert (=> b!1322529 (= res!877820 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30511))))

(declare-fun b!1322530 () Bool)

(declare-fun res!877817 () Bool)

(assert (=> b!1322530 (=> (not res!877817) (not e!754114))))

(assert (=> b!1322530 (= res!877817 (and (= (size!43609 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43608 _keys!1609) (size!43609 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111646 res!877819) b!1322530))

(assert (= (and b!1322530 res!877817) b!1322521))

(assert (= (and b!1322521 res!877818) b!1322529))

(assert (= (and b!1322529 res!877820) b!1322524))

(assert (= (and b!1322524 res!877814) b!1322522))

(assert (= (and b!1322522 res!877815) b!1322523))

(assert (= (and b!1322523 res!877813) b!1322527))

(assert (= (and b!1322527 res!877816) b!1322528))

(assert (= (and b!1322525 condMapEmpty!55832) mapIsEmpty!55832))

(assert (= (and b!1322525 (not condMapEmpty!55832)) mapNonEmpty!55832))

(get-info :version)

(assert (= (and mapNonEmpty!55832 ((_ is ValueCellFull!17163) mapValue!55832)) b!1322520))

(assert (= (and b!1322525 ((_ is ValueCellFull!17163) mapDefault!55832)) b!1322526))

(assert (= start!111646 b!1322525))

(declare-fun b_lambda!23629 () Bool)

(assert (=> (not b_lambda!23629) (not b!1322528)))

(declare-fun t!44364 () Bool)

(declare-fun tb!11655 () Bool)

(assert (=> (and start!111646 (= defaultEntry!1340 defaultEntry!1340) t!44364) tb!11655))

(declare-fun result!24365 () Bool)

(assert (=> tb!11655 (= result!24365 tp_is_empty!36123)))

(assert (=> b!1322528 t!44364))

(declare-fun b_and!48767 () Bool)

(assert (= b_and!48765 (and (=> t!44364 result!24365) b_and!48767)))

(declare-fun m!1210841 () Bool)

(assert (=> mapNonEmpty!55832 m!1210841))

(declare-fun m!1210843 () Bool)

(assert (=> b!1322527 m!1210843))

(assert (=> b!1322527 m!1210843))

(declare-fun m!1210845 () Bool)

(assert (=> b!1322527 m!1210845))

(declare-fun m!1210847 () Bool)

(assert (=> b!1322522 m!1210847))

(assert (=> b!1322522 m!1210847))

(declare-fun m!1210849 () Bool)

(assert (=> b!1322522 m!1210849))

(declare-fun m!1210851 () Bool)

(assert (=> b!1322528 m!1210851))

(declare-fun m!1210853 () Bool)

(assert (=> b!1322528 m!1210853))

(declare-fun m!1210855 () Bool)

(assert (=> b!1322528 m!1210855))

(declare-fun m!1210857 () Bool)

(assert (=> b!1322528 m!1210857))

(declare-fun m!1210859 () Bool)

(assert (=> b!1322528 m!1210859))

(assert (=> b!1322528 m!1210843))

(declare-fun m!1210861 () Bool)

(assert (=> b!1322528 m!1210861))

(assert (=> b!1322528 m!1210843))

(declare-fun m!1210863 () Bool)

(assert (=> b!1322528 m!1210863))

(declare-fun m!1210865 () Bool)

(assert (=> b!1322528 m!1210865))

(declare-fun m!1210867 () Bool)

(assert (=> b!1322528 m!1210867))

(declare-fun m!1210869 () Bool)

(assert (=> b!1322528 m!1210869))

(declare-fun m!1210871 () Bool)

(assert (=> b!1322528 m!1210871))

(declare-fun m!1210873 () Bool)

(assert (=> b!1322528 m!1210873))

(assert (=> b!1322528 m!1210859))

(assert (=> b!1322528 m!1210857))

(declare-fun m!1210875 () Bool)

(assert (=> b!1322528 m!1210875))

(assert (=> b!1322528 m!1210867))

(declare-fun m!1210877 () Bool)

(assert (=> b!1322528 m!1210877))

(declare-fun m!1210879 () Bool)

(assert (=> b!1322528 m!1210879))

(declare-fun m!1210881 () Bool)

(assert (=> b!1322529 m!1210881))

(declare-fun m!1210883 () Bool)

(assert (=> b!1322521 m!1210883))

(assert (=> b!1322523 m!1210843))

(declare-fun m!1210885 () Bool)

(assert (=> start!111646 m!1210885))

(declare-fun m!1210887 () Bool)

(assert (=> start!111646 m!1210887))

(declare-fun m!1210889 () Bool)

(assert (=> start!111646 m!1210889))

(check-sat b_and!48767 tp_is_empty!36123 (not b_next!30303) (not b_lambda!23629) (not start!111646) (not mapNonEmpty!55832) (not b!1322522) (not b!1322528) (not b!1322527) (not b!1322529) (not b!1322521))
(check-sat b_and!48767 (not b_next!30303))
