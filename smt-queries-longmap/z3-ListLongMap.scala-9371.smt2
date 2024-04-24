; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111886 () Bool)

(assert start!111886)

(declare-fun b_free!30319 () Bool)

(declare-fun b_next!30319 () Bool)

(assert (=> start!111886 (= b_free!30319 (not b_next!30319))))

(declare-fun tp!106432 () Bool)

(declare-fun b_and!48799 () Bool)

(assert (=> start!111886 (= tp!106432 b_and!48799)))

(declare-fun b!1324099 () Bool)

(declare-fun e!755073 () Bool)

(declare-fun tp_is_empty!36139 () Bool)

(assert (=> b!1324099 (= e!755073 tp_is_empty!36139)))

(declare-fun b!1324100 () Bool)

(declare-fun res!878525 () Bool)

(declare-fun e!755077 () Bool)

(assert (=> b!1324100 (=> (not res!878525) (not e!755077))))

(declare-datatypes ((array!89283 0))(
  ( (array!89284 (arr!43111 (Array (_ BitVec 32) (_ BitVec 64))) (size!43662 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89283)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324100 (= res!878525 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43662 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!878529 () Bool)

(assert (=> start!111886 (=> (not res!878529) (not e!755077))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111886 (= res!878529 (validMask!0 mask!2019))))

(assert (=> start!111886 e!755077))

(declare-fun array_inv!32821 (array!89283) Bool)

(assert (=> start!111886 (array_inv!32821 _keys!1609)))

(assert (=> start!111886 true))

(assert (=> start!111886 tp_is_empty!36139))

(declare-datatypes ((V!53289 0))(
  ( (V!53290 (val!18144 Int)) )
))
(declare-datatypes ((ValueCell!17171 0))(
  ( (ValueCellFull!17171 (v!20769 V!53289)) (EmptyCell!17171) )
))
(declare-datatypes ((array!89285 0))(
  ( (array!89286 (arr!43112 (Array (_ BitVec 32) ValueCell!17171)) (size!43663 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89285)

(declare-fun e!755075 () Bool)

(declare-fun array_inv!32822 (array!89285) Bool)

(assert (=> start!111886 (and (array_inv!32822 _values!1337) e!755075)))

(assert (=> start!111886 tp!106432))

(declare-fun b!1324101 () Bool)

(declare-fun res!878528 () Bool)

(assert (=> b!1324101 (=> (not res!878528) (not e!755077))))

(declare-datatypes ((List!30576 0))(
  ( (Nil!30573) (Cons!30572 (h!31790 (_ BitVec 64)) (t!44436 List!30576)) )
))
(declare-fun arrayNoDuplicates!0 (array!89283 (_ BitVec 32) List!30576) Bool)

(assert (=> b!1324101 (= res!878528 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30573))))

(declare-fun b!1324102 () Bool)

(declare-fun res!878526 () Bool)

(assert (=> b!1324102 (=> (not res!878526) (not e!755077))))

(declare-fun zeroValue!1279 () V!53289)

(declare-fun minValue!1279 () V!53289)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23426 0))(
  ( (tuple2!23427 (_1!11724 (_ BitVec 64)) (_2!11724 V!53289)) )
))
(declare-datatypes ((List!30577 0))(
  ( (Nil!30574) (Cons!30573 (h!31791 tuple2!23426) (t!44437 List!30577)) )
))
(declare-datatypes ((ListLongMap!21091 0))(
  ( (ListLongMap!21092 (toList!10561 List!30577)) )
))
(declare-fun contains!8728 (ListLongMap!21091 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5548 (array!89283 array!89285 (_ BitVec 32) (_ BitVec 32) V!53289 V!53289 (_ BitVec 32) Int) ListLongMap!21091)

(assert (=> b!1324102 (= res!878526 (contains!8728 (getCurrentListMap!5548 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324103 () Bool)

(declare-fun res!878530 () Bool)

(assert (=> b!1324103 (=> (not res!878530) (not e!755077))))

(assert (=> b!1324103 (= res!878530 (and (= (size!43663 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43662 _keys!1609) (size!43663 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55856 () Bool)

(declare-fun mapRes!55856 () Bool)

(assert (=> mapIsEmpty!55856 mapRes!55856))

(declare-fun b!1324104 () Bool)

(declare-fun e!755074 () Bool)

(assert (=> b!1324104 (= e!755074 tp_is_empty!36139)))

(declare-fun b!1324105 () Bool)

(assert (=> b!1324105 (= e!755075 (and e!755074 mapRes!55856))))

(declare-fun condMapEmpty!55856 () Bool)

(declare-fun mapDefault!55856 () ValueCell!17171)

(assert (=> b!1324105 (= condMapEmpty!55856 (= (arr!43112 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17171)) mapDefault!55856)))))

(declare-fun mapNonEmpty!55856 () Bool)

(declare-fun tp!106433 () Bool)

(assert (=> mapNonEmpty!55856 (= mapRes!55856 (and tp!106433 e!755073))))

(declare-fun mapKey!55856 () (_ BitVec 32))

(declare-fun mapValue!55856 () ValueCell!17171)

(declare-fun mapRest!55856 () (Array (_ BitVec 32) ValueCell!17171))

(assert (=> mapNonEmpty!55856 (= (arr!43112 _values!1337) (store mapRest!55856 mapKey!55856 mapValue!55856))))

(declare-fun b!1324106 () Bool)

(declare-fun res!878524 () Bool)

(assert (=> b!1324106 (=> (not res!878524) (not e!755077))))

(assert (=> b!1324106 (= res!878524 (not (= (select (arr!43111 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324107 () Bool)

(assert (=> b!1324107 (= e!755077 (not true))))

(declare-fun lt!588925 () ListLongMap!21091)

(declare-fun lt!588923 () tuple2!23426)

(declare-fun +!4636 (ListLongMap!21091 tuple2!23426) ListLongMap!21091)

(assert (=> b!1324107 (contains!8728 (+!4636 lt!588925 lt!588923) k0!1164)))

(declare-datatypes ((Unit!43559 0))(
  ( (Unit!43560) )
))
(declare-fun lt!588929 () Unit!43559)

(declare-fun addStillContains!1148 (ListLongMap!21091 (_ BitVec 64) V!53289 (_ BitVec 64)) Unit!43559)

(assert (=> b!1324107 (= lt!588929 (addStillContains!1148 lt!588925 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1324107 (contains!8728 lt!588925 k0!1164)))

(declare-fun lt!588927 () Unit!43559)

(declare-fun lt!588928 () V!53289)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!191 ((_ BitVec 64) (_ BitVec 64) V!53289 ListLongMap!21091) Unit!43559)

(assert (=> b!1324107 (= lt!588927 (lemmaInListMapAfterAddingDiffThenInBefore!191 k0!1164 (select (arr!43111 _keys!1609) from!2000) lt!588928 lt!588925))))

(declare-fun lt!588924 () ListLongMap!21091)

(assert (=> b!1324107 (contains!8728 lt!588924 k0!1164)))

(declare-fun lt!588926 () Unit!43559)

(assert (=> b!1324107 (= lt!588926 (lemmaInListMapAfterAddingDiffThenInBefore!191 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588924))))

(declare-fun lt!588922 () ListLongMap!21091)

(assert (=> b!1324107 (contains!8728 lt!588922 k0!1164)))

(declare-fun lt!588921 () Unit!43559)

(assert (=> b!1324107 (= lt!588921 (lemmaInListMapAfterAddingDiffThenInBefore!191 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588922))))

(assert (=> b!1324107 (= lt!588922 (+!4636 lt!588924 lt!588923))))

(assert (=> b!1324107 (= lt!588923 (tuple2!23427 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1324107 (= lt!588924 (+!4636 lt!588925 (tuple2!23427 (select (arr!43111 _keys!1609) from!2000) lt!588928)))))

(declare-fun get!21737 (ValueCell!17171 V!53289) V!53289)

(declare-fun dynLambda!3590 (Int (_ BitVec 64)) V!53289)

(assert (=> b!1324107 (= lt!588928 (get!21737 (select (arr!43112 _values!1337) from!2000) (dynLambda!3590 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6275 (array!89283 array!89285 (_ BitVec 32) (_ BitVec 32) V!53289 V!53289 (_ BitVec 32) Int) ListLongMap!21091)

(assert (=> b!1324107 (= lt!588925 (getCurrentListMapNoExtraKeys!6275 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1324108 () Bool)

(declare-fun res!878523 () Bool)

(assert (=> b!1324108 (=> (not res!878523) (not e!755077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324108 (= res!878523 (validKeyInArray!0 (select (arr!43111 _keys!1609) from!2000)))))

(declare-fun b!1324109 () Bool)

(declare-fun res!878527 () Bool)

(assert (=> b!1324109 (=> (not res!878527) (not e!755077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89283 (_ BitVec 32)) Bool)

(assert (=> b!1324109 (= res!878527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111886 res!878529) b!1324103))

(assert (= (and b!1324103 res!878530) b!1324109))

(assert (= (and b!1324109 res!878527) b!1324101))

(assert (= (and b!1324101 res!878528) b!1324100))

(assert (= (and b!1324100 res!878525) b!1324102))

(assert (= (and b!1324102 res!878526) b!1324106))

(assert (= (and b!1324106 res!878524) b!1324108))

(assert (= (and b!1324108 res!878523) b!1324107))

(assert (= (and b!1324105 condMapEmpty!55856) mapIsEmpty!55856))

(assert (= (and b!1324105 (not condMapEmpty!55856)) mapNonEmpty!55856))

(get-info :version)

(assert (= (and mapNonEmpty!55856 ((_ is ValueCellFull!17171) mapValue!55856)) b!1324099))

(assert (= (and b!1324105 ((_ is ValueCellFull!17171) mapDefault!55856)) b!1324104))

(assert (= start!111886 b!1324105))

(declare-fun b_lambda!23639 () Bool)

(assert (=> (not b_lambda!23639) (not b!1324107)))

(declare-fun t!44435 () Bool)

(declare-fun tb!11663 () Bool)

(assert (=> (and start!111886 (= defaultEntry!1340 defaultEntry!1340) t!44435) tb!11663))

(declare-fun result!24389 () Bool)

(assert (=> tb!11663 (= result!24389 tp_is_empty!36139)))

(assert (=> b!1324107 t!44435))

(declare-fun b_and!48801 () Bool)

(assert (= b_and!48799 (and (=> t!44435 result!24389) b_and!48801)))

(declare-fun m!1212839 () Bool)

(assert (=> mapNonEmpty!55856 m!1212839))

(declare-fun m!1212841 () Bool)

(assert (=> start!111886 m!1212841))

(declare-fun m!1212843 () Bool)

(assert (=> start!111886 m!1212843))

(declare-fun m!1212845 () Bool)

(assert (=> start!111886 m!1212845))

(declare-fun m!1212847 () Bool)

(assert (=> b!1324106 m!1212847))

(assert (=> b!1324108 m!1212847))

(assert (=> b!1324108 m!1212847))

(declare-fun m!1212849 () Bool)

(assert (=> b!1324108 m!1212849))

(declare-fun m!1212851 () Bool)

(assert (=> b!1324109 m!1212851))

(declare-fun m!1212853 () Bool)

(assert (=> b!1324107 m!1212853))

(declare-fun m!1212855 () Bool)

(assert (=> b!1324107 m!1212855))

(declare-fun m!1212857 () Bool)

(assert (=> b!1324107 m!1212857))

(declare-fun m!1212859 () Bool)

(assert (=> b!1324107 m!1212859))

(declare-fun m!1212861 () Bool)

(assert (=> b!1324107 m!1212861))

(declare-fun m!1212863 () Bool)

(assert (=> b!1324107 m!1212863))

(declare-fun m!1212865 () Bool)

(assert (=> b!1324107 m!1212865))

(declare-fun m!1212867 () Bool)

(assert (=> b!1324107 m!1212867))

(declare-fun m!1212869 () Bool)

(assert (=> b!1324107 m!1212869))

(declare-fun m!1212871 () Bool)

(assert (=> b!1324107 m!1212871))

(declare-fun m!1212873 () Bool)

(assert (=> b!1324107 m!1212873))

(declare-fun m!1212875 () Bool)

(assert (=> b!1324107 m!1212875))

(assert (=> b!1324107 m!1212847))

(declare-fun m!1212877 () Bool)

(assert (=> b!1324107 m!1212877))

(assert (=> b!1324107 m!1212867))

(assert (=> b!1324107 m!1212857))

(declare-fun m!1212879 () Bool)

(assert (=> b!1324107 m!1212879))

(assert (=> b!1324107 m!1212859))

(declare-fun m!1212881 () Bool)

(assert (=> b!1324107 m!1212881))

(assert (=> b!1324107 m!1212847))

(declare-fun m!1212883 () Bool)

(assert (=> b!1324101 m!1212883))

(declare-fun m!1212885 () Bool)

(assert (=> b!1324102 m!1212885))

(assert (=> b!1324102 m!1212885))

(declare-fun m!1212887 () Bool)

(assert (=> b!1324102 m!1212887))

(check-sat (not start!111886) (not b!1324107) (not b_next!30319) b_and!48801 (not b!1324108) (not b!1324102) (not b!1324101) tp_is_empty!36139 (not b!1324109) (not mapNonEmpty!55856) (not b_lambda!23639))
(check-sat b_and!48801 (not b_next!30319))
