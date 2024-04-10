; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111682 () Bool)

(assert start!111682)

(declare-fun b_free!30339 () Bool)

(declare-fun b_next!30339 () Bool)

(assert (=> start!111682 (= b_free!30339 (not b_next!30339))))

(declare-fun tp!106492 () Bool)

(declare-fun b_and!48837 () Bool)

(assert (=> start!111682 (= tp!106492 b_and!48837)))

(declare-fun b!1323150 () Bool)

(declare-fun res!878248 () Bool)

(declare-fun e!754381 () Bool)

(assert (=> b!1323150 (=> (not res!878248) (not e!754381))))

(declare-datatypes ((array!89238 0))(
  ( (array!89239 (arr!43093 (Array (_ BitVec 32) (_ BitVec 64))) (size!43643 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89238)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53315 0))(
  ( (V!53316 (val!18154 Int)) )
))
(declare-datatypes ((ValueCell!17181 0))(
  ( (ValueCellFull!17181 (v!20784 V!53315)) (EmptyCell!17181) )
))
(declare-datatypes ((array!89240 0))(
  ( (array!89241 (arr!43094 (Array (_ BitVec 32) ValueCell!17181)) (size!43644 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89240)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1323150 (= res!878248 (and (= (size!43644 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43643 _keys!1609) (size!43644 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323151 () Bool)

(declare-fun res!878249 () Bool)

(assert (=> b!1323151 (=> (not res!878249) (not e!754381))))

(declare-datatypes ((List!30542 0))(
  ( (Nil!30539) (Cons!30538 (h!31747 (_ BitVec 64)) (t!44430 List!30542)) )
))
(declare-fun arrayNoDuplicates!0 (array!89238 (_ BitVec 32) List!30542) Bool)

(assert (=> b!1323151 (= res!878249 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30539))))

(declare-fun b!1323152 () Bool)

(declare-fun res!878250 () Bool)

(assert (=> b!1323152 (=> (not res!878250) (not e!754381))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323152 (= res!878250 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43643 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323153 () Bool)

(declare-fun res!878246 () Bool)

(assert (=> b!1323153 (=> (not res!878246) (not e!754381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89238 (_ BitVec 32)) Bool)

(assert (=> b!1323153 (= res!878246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323154 () Bool)

(declare-fun res!878245 () Bool)

(assert (=> b!1323154 (=> (not res!878245) (not e!754381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323154 (= res!878245 (validKeyInArray!0 (select (arr!43093 _keys!1609) from!2000)))))

(declare-fun b!1323155 () Bool)

(assert (=> b!1323155 (= e!754381 (not true))))

(declare-datatypes ((tuple2!23400 0))(
  ( (tuple2!23401 (_1!11711 (_ BitVec 64)) (_2!11711 V!53315)) )
))
(declare-datatypes ((List!30543 0))(
  ( (Nil!30540) (Cons!30539 (h!31748 tuple2!23400) (t!44431 List!30543)) )
))
(declare-datatypes ((ListLongMap!21057 0))(
  ( (ListLongMap!21058 (toList!10544 List!30543)) )
))
(declare-fun lt!588771 () ListLongMap!21057)

(declare-fun minValue!1279 () V!53315)

(declare-fun contains!8699 (ListLongMap!21057 (_ BitVec 64)) Bool)

(declare-fun +!4596 (ListLongMap!21057 tuple2!23400) ListLongMap!21057)

(assert (=> b!1323155 (contains!8699 (+!4596 lt!588771 (tuple2!23401 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43612 0))(
  ( (Unit!43613) )
))
(declare-fun lt!588770 () Unit!43612)

(declare-fun addStillContains!1145 (ListLongMap!21057 (_ BitVec 64) V!53315 (_ BitVec 64)) Unit!43612)

(assert (=> b!1323155 (= lt!588770 (addStillContains!1145 lt!588771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323155 (contains!8699 lt!588771 k0!1164)))

(declare-fun lt!588764 () ListLongMap!21057)

(declare-fun lt!588761 () tuple2!23400)

(assert (=> b!1323155 (= lt!588771 (+!4596 lt!588764 lt!588761))))

(declare-fun lt!588763 () Unit!43612)

(declare-fun zeroValue!1279 () V!53315)

(assert (=> b!1323155 (= lt!588763 (addStillContains!1145 lt!588764 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323155 (contains!8699 lt!588764 k0!1164)))

(declare-fun lt!588766 () Unit!43612)

(declare-fun lt!588762 () V!53315)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!192 ((_ BitVec 64) (_ BitVec 64) V!53315 ListLongMap!21057) Unit!43612)

(assert (=> b!1323155 (= lt!588766 (lemmaInListMapAfterAddingDiffThenInBefore!192 k0!1164 (select (arr!43093 _keys!1609) from!2000) lt!588762 lt!588764))))

(declare-fun lt!588769 () ListLongMap!21057)

(assert (=> b!1323155 (contains!8699 lt!588769 k0!1164)))

(declare-fun lt!588765 () Unit!43612)

(assert (=> b!1323155 (= lt!588765 (lemmaInListMapAfterAddingDiffThenInBefore!192 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588769))))

(declare-fun lt!588768 () ListLongMap!21057)

(assert (=> b!1323155 (contains!8699 lt!588768 k0!1164)))

(declare-fun lt!588767 () Unit!43612)

(assert (=> b!1323155 (= lt!588767 (lemmaInListMapAfterAddingDiffThenInBefore!192 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588768))))

(assert (=> b!1323155 (= lt!588768 (+!4596 lt!588769 lt!588761))))

(assert (=> b!1323155 (= lt!588761 (tuple2!23401 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323155 (= lt!588769 (+!4596 lt!588764 (tuple2!23401 (select (arr!43093 _keys!1609) from!2000) lt!588762)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21700 (ValueCell!17181 V!53315) V!53315)

(declare-fun dynLambda!3535 (Int (_ BitVec 64)) V!53315)

(assert (=> b!1323155 (= lt!588762 (get!21700 (select (arr!43094 _values!1337) from!2000) (dynLambda!3535 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6231 (array!89238 array!89240 (_ BitVec 32) (_ BitVec 32) V!53315 V!53315 (_ BitVec 32) Int) ListLongMap!21057)

(assert (=> b!1323155 (= lt!588764 (getCurrentListMapNoExtraKeys!6231 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323156 () Bool)

(declare-fun res!878252 () Bool)

(assert (=> b!1323156 (=> (not res!878252) (not e!754381))))

(declare-fun getCurrentListMap!5541 (array!89238 array!89240 (_ BitVec 32) (_ BitVec 32) V!53315 V!53315 (_ BitVec 32) Int) ListLongMap!21057)

(assert (=> b!1323156 (= res!878252 (contains!8699 (getCurrentListMap!5541 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323157 () Bool)

(declare-fun res!878251 () Bool)

(assert (=> b!1323157 (=> (not res!878251) (not e!754381))))

(assert (=> b!1323157 (= res!878251 (not (= (select (arr!43093 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55886 () Bool)

(declare-fun mapRes!55886 () Bool)

(declare-fun tp!106493 () Bool)

(declare-fun e!754380 () Bool)

(assert (=> mapNonEmpty!55886 (= mapRes!55886 (and tp!106493 e!754380))))

(declare-fun mapRest!55886 () (Array (_ BitVec 32) ValueCell!17181))

(declare-fun mapValue!55886 () ValueCell!17181)

(declare-fun mapKey!55886 () (_ BitVec 32))

(assert (=> mapNonEmpty!55886 (= (arr!43094 _values!1337) (store mapRest!55886 mapKey!55886 mapValue!55886))))

(declare-fun b!1323158 () Bool)

(declare-fun e!754382 () Bool)

(declare-fun tp_is_empty!36159 () Bool)

(assert (=> b!1323158 (= e!754382 tp_is_empty!36159)))

(declare-fun b!1323159 () Bool)

(assert (=> b!1323159 (= e!754380 tp_is_empty!36159)))

(declare-fun b!1323160 () Bool)

(declare-fun e!754383 () Bool)

(assert (=> b!1323160 (= e!754383 (and e!754382 mapRes!55886))))

(declare-fun condMapEmpty!55886 () Bool)

(declare-fun mapDefault!55886 () ValueCell!17181)

(assert (=> b!1323160 (= condMapEmpty!55886 (= (arr!43094 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17181)) mapDefault!55886)))))

(declare-fun mapIsEmpty!55886 () Bool)

(assert (=> mapIsEmpty!55886 mapRes!55886))

(declare-fun res!878247 () Bool)

(assert (=> start!111682 (=> (not res!878247) (not e!754381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111682 (= res!878247 (validMask!0 mask!2019))))

(assert (=> start!111682 e!754381))

(declare-fun array_inv!32535 (array!89238) Bool)

(assert (=> start!111682 (array_inv!32535 _keys!1609)))

(assert (=> start!111682 true))

(assert (=> start!111682 tp_is_empty!36159))

(declare-fun array_inv!32536 (array!89240) Bool)

(assert (=> start!111682 (and (array_inv!32536 _values!1337) e!754383)))

(assert (=> start!111682 tp!106492))

(assert (= (and start!111682 res!878247) b!1323150))

(assert (= (and b!1323150 res!878248) b!1323153))

(assert (= (and b!1323153 res!878246) b!1323151))

(assert (= (and b!1323151 res!878249) b!1323152))

(assert (= (and b!1323152 res!878250) b!1323156))

(assert (= (and b!1323156 res!878252) b!1323157))

(assert (= (and b!1323157 res!878251) b!1323154))

(assert (= (and b!1323154 res!878245) b!1323155))

(assert (= (and b!1323160 condMapEmpty!55886) mapIsEmpty!55886))

(assert (= (and b!1323160 (not condMapEmpty!55886)) mapNonEmpty!55886))

(get-info :version)

(assert (= (and mapNonEmpty!55886 ((_ is ValueCellFull!17181) mapValue!55886)) b!1323159))

(assert (= (and b!1323160 ((_ is ValueCellFull!17181) mapDefault!55886)) b!1323158))

(assert (= start!111682 b!1323160))

(declare-fun b_lambda!23665 () Bool)

(assert (=> (not b_lambda!23665) (not b!1323155)))

(declare-fun t!44429 () Bool)

(declare-fun tb!11691 () Bool)

(assert (=> (and start!111682 (= defaultEntry!1340 defaultEntry!1340) t!44429) tb!11691))

(declare-fun result!24437 () Bool)

(assert (=> tb!11691 (= result!24437 tp_is_empty!36159)))

(assert (=> b!1323155 t!44429))

(declare-fun b_and!48839 () Bool)

(assert (= b_and!48837 (and (=> t!44429 result!24437) b_and!48839)))

(declare-fun m!1211783 () Bool)

(assert (=> b!1323156 m!1211783))

(assert (=> b!1323156 m!1211783))

(declare-fun m!1211785 () Bool)

(assert (=> b!1323156 m!1211785))

(declare-fun m!1211787 () Bool)

(assert (=> b!1323153 m!1211787))

(declare-fun m!1211789 () Bool)

(assert (=> start!111682 m!1211789))

(declare-fun m!1211791 () Bool)

(assert (=> start!111682 m!1211791))

(declare-fun m!1211793 () Bool)

(assert (=> start!111682 m!1211793))

(declare-fun m!1211795 () Bool)

(assert (=> b!1323155 m!1211795))

(declare-fun m!1211797 () Bool)

(assert (=> b!1323155 m!1211797))

(declare-fun m!1211799 () Bool)

(assert (=> b!1323155 m!1211799))

(declare-fun m!1211801 () Bool)

(assert (=> b!1323155 m!1211801))

(declare-fun m!1211803 () Bool)

(assert (=> b!1323155 m!1211803))

(declare-fun m!1211805 () Bool)

(assert (=> b!1323155 m!1211805))

(declare-fun m!1211807 () Bool)

(assert (=> b!1323155 m!1211807))

(declare-fun m!1211809 () Bool)

(assert (=> b!1323155 m!1211809))

(declare-fun m!1211811 () Bool)

(assert (=> b!1323155 m!1211811))

(declare-fun m!1211813 () Bool)

(assert (=> b!1323155 m!1211813))

(declare-fun m!1211815 () Bool)

(assert (=> b!1323155 m!1211815))

(declare-fun m!1211817 () Bool)

(assert (=> b!1323155 m!1211817))

(declare-fun m!1211819 () Bool)

(assert (=> b!1323155 m!1211819))

(declare-fun m!1211821 () Bool)

(assert (=> b!1323155 m!1211821))

(declare-fun m!1211823 () Bool)

(assert (=> b!1323155 m!1211823))

(assert (=> b!1323155 m!1211813))

(assert (=> b!1323155 m!1211799))

(declare-fun m!1211825 () Bool)

(assert (=> b!1323155 m!1211825))

(assert (=> b!1323155 m!1211801))

(declare-fun m!1211827 () Bool)

(assert (=> b!1323155 m!1211827))

(assert (=> b!1323155 m!1211827))

(declare-fun m!1211829 () Bool)

(assert (=> b!1323155 m!1211829))

(declare-fun m!1211831 () Bool)

(assert (=> b!1323155 m!1211831))

(assert (=> b!1323154 m!1211827))

(assert (=> b!1323154 m!1211827))

(declare-fun m!1211833 () Bool)

(assert (=> b!1323154 m!1211833))

(declare-fun m!1211835 () Bool)

(assert (=> b!1323151 m!1211835))

(assert (=> b!1323157 m!1211827))

(declare-fun m!1211837 () Bool)

(assert (=> mapNonEmpty!55886 m!1211837))

(check-sat (not b!1323156) (not b_lambda!23665) (not b!1323155) (not b_next!30339) tp_is_empty!36159 (not b!1323153) (not mapNonEmpty!55886) b_and!48839 (not b!1323151) (not start!111682) (not b!1323154))
(check-sat b_and!48839 (not b_next!30339))
