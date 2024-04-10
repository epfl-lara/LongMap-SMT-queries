; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111616 () Bool)

(assert start!111616)

(declare-fun b_free!30273 () Bool)

(declare-fun b_next!30273 () Bool)

(assert (=> start!111616 (= b_free!30273 (not b_next!30273))))

(declare-fun tp!106295 () Bool)

(declare-fun b_and!48705 () Bool)

(assert (=> start!111616 (= tp!106295 b_and!48705)))

(declare-fun mapNonEmpty!55787 () Bool)

(declare-fun mapRes!55787 () Bool)

(declare-fun tp!106294 () Bool)

(declare-fun e!753888 () Bool)

(assert (=> mapNonEmpty!55787 (= mapRes!55787 (and tp!106294 e!753888))))

(declare-fun mapKey!55787 () (_ BitVec 32))

(declare-datatypes ((V!53227 0))(
  ( (V!53228 (val!18121 Int)) )
))
(declare-datatypes ((ValueCell!17148 0))(
  ( (ValueCellFull!17148 (v!20751 V!53227)) (EmptyCell!17148) )
))
(declare-datatypes ((array!89108 0))(
  ( (array!89109 (arr!43028 (Array (_ BitVec 32) ValueCell!17148)) (size!43578 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89108)

(declare-fun mapRest!55787 () (Array (_ BitVec 32) ValueCell!17148))

(declare-fun mapValue!55787 () ValueCell!17148)

(assert (=> mapNonEmpty!55787 (= (arr!43028 _values!1337) (store mapRest!55787 mapKey!55787 mapValue!55787))))

(declare-fun b!1321995 () Bool)

(declare-fun e!753886 () Bool)

(assert (=> b!1321995 (= e!753886 (not true))))

(declare-datatypes ((tuple2!23340 0))(
  ( (tuple2!23341 (_1!11681 (_ BitVec 64)) (_2!11681 V!53227)) )
))
(declare-datatypes ((List!30488 0))(
  ( (Nil!30485) (Cons!30484 (h!31693 tuple2!23340) (t!44310 List!30488)) )
))
(declare-datatypes ((ListLongMap!20997 0))(
  ( (ListLongMap!20998 (toList!10514 List!30488)) )
))
(declare-fun lt!587827 () ListLongMap!20997)

(declare-fun lt!587832 () tuple2!23340)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8669 (ListLongMap!20997 (_ BitVec 64)) Bool)

(declare-fun +!4570 (ListLongMap!20997 tuple2!23340) ListLongMap!20997)

(assert (=> b!1321995 (contains!8669 (+!4570 lt!587827 lt!587832) k0!1164)))

(declare-fun zeroValue!1279 () V!53227)

(declare-datatypes ((Unit!43560 0))(
  ( (Unit!43561) )
))
(declare-fun lt!587825 () Unit!43560)

(declare-fun addStillContains!1119 (ListLongMap!20997 (_ BitVec 64) V!53227 (_ BitVec 64)) Unit!43560)

(assert (=> b!1321995 (= lt!587825 (addStillContains!1119 lt!587827 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1321995 (contains!8669 lt!587827 k0!1164)))

(declare-datatypes ((array!89110 0))(
  ( (array!89111 (arr!43029 (Array (_ BitVec 32) (_ BitVec 64))) (size!43579 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89110)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!587828 () V!53227)

(declare-fun lt!587829 () Unit!43560)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!166 ((_ BitVec 64) (_ BitVec 64) V!53227 ListLongMap!20997) Unit!43560)

(assert (=> b!1321995 (= lt!587829 (lemmaInListMapAfterAddingDiffThenInBefore!166 k0!1164 (select (arr!43029 _keys!1609) from!2000) lt!587828 lt!587827))))

(declare-fun lt!587831 () ListLongMap!20997)

(assert (=> b!1321995 (contains!8669 lt!587831 k0!1164)))

(declare-fun lt!587826 () Unit!43560)

(assert (=> b!1321995 (= lt!587826 (lemmaInListMapAfterAddingDiffThenInBefore!166 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587831))))

(declare-fun lt!587824 () ListLongMap!20997)

(assert (=> b!1321995 (contains!8669 lt!587824 k0!1164)))

(declare-fun minValue!1279 () V!53227)

(declare-fun lt!587830 () Unit!43560)

(assert (=> b!1321995 (= lt!587830 (lemmaInListMapAfterAddingDiffThenInBefore!166 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587824))))

(assert (=> b!1321995 (= lt!587824 (+!4570 lt!587831 lt!587832))))

(assert (=> b!1321995 (= lt!587832 (tuple2!23341 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1321995 (= lt!587831 (+!4570 lt!587827 (tuple2!23341 (select (arr!43029 _keys!1609) from!2000) lt!587828)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21652 (ValueCell!17148 V!53227) V!53227)

(declare-fun dynLambda!3509 (Int (_ BitVec 64)) V!53227)

(assert (=> b!1321995 (= lt!587828 (get!21652 (select (arr!43028 _values!1337) from!2000) (dynLambda!3509 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6205 (array!89110 array!89108 (_ BitVec 32) (_ BitVec 32) V!53227 V!53227 (_ BitVec 32) Int) ListLongMap!20997)

(assert (=> b!1321995 (= lt!587827 (getCurrentListMapNoExtraKeys!6205 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapIsEmpty!55787 () Bool)

(assert (=> mapIsEmpty!55787 mapRes!55787))

(declare-fun res!877457 () Bool)

(assert (=> start!111616 (=> (not res!877457) (not e!753886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111616 (= res!877457 (validMask!0 mask!2019))))

(assert (=> start!111616 e!753886))

(declare-fun array_inv!32485 (array!89110) Bool)

(assert (=> start!111616 (array_inv!32485 _keys!1609)))

(assert (=> start!111616 true))

(declare-fun tp_is_empty!36093 () Bool)

(assert (=> start!111616 tp_is_empty!36093))

(declare-fun e!753887 () Bool)

(declare-fun array_inv!32486 (array!89108) Bool)

(assert (=> start!111616 (and (array_inv!32486 _values!1337) e!753887)))

(assert (=> start!111616 tp!106295))

(declare-fun b!1321996 () Bool)

(declare-fun res!877454 () Bool)

(assert (=> b!1321996 (=> (not res!877454) (not e!753886))))

(assert (=> b!1321996 (= res!877454 (and (= (size!43578 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43579 _keys!1609) (size!43578 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321997 () Bool)

(declare-fun res!877459 () Bool)

(assert (=> b!1321997 (=> (not res!877459) (not e!753886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89110 (_ BitVec 32)) Bool)

(assert (=> b!1321997 (= res!877459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321998 () Bool)

(declare-fun res!877455 () Bool)

(assert (=> b!1321998 (=> (not res!877455) (not e!753886))))

(declare-fun getCurrentListMap!5515 (array!89110 array!89108 (_ BitVec 32) (_ BitVec 32) V!53227 V!53227 (_ BitVec 32) Int) ListLongMap!20997)

(assert (=> b!1321998 (= res!877455 (contains!8669 (getCurrentListMap!5515 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321999 () Bool)

(assert (=> b!1321999 (= e!753888 tp_is_empty!36093)))

(declare-fun b!1322000 () Bool)

(declare-fun res!877453 () Bool)

(assert (=> b!1322000 (=> (not res!877453) (not e!753886))))

(assert (=> b!1322000 (= res!877453 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43579 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322001 () Bool)

(declare-fun res!877460 () Bool)

(assert (=> b!1322001 (=> (not res!877460) (not e!753886))))

(declare-datatypes ((List!30489 0))(
  ( (Nil!30486) (Cons!30485 (h!31694 (_ BitVec 64)) (t!44311 List!30489)) )
))
(declare-fun arrayNoDuplicates!0 (array!89110 (_ BitVec 32) List!30489) Bool)

(assert (=> b!1322001 (= res!877460 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30486))))

(declare-fun b!1322002 () Bool)

(declare-fun res!877458 () Bool)

(assert (=> b!1322002 (=> (not res!877458) (not e!753886))))

(assert (=> b!1322002 (= res!877458 (not (= (select (arr!43029 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322003 () Bool)

(declare-fun e!753889 () Bool)

(assert (=> b!1322003 (= e!753889 tp_is_empty!36093)))

(declare-fun b!1322004 () Bool)

(declare-fun res!877456 () Bool)

(assert (=> b!1322004 (=> (not res!877456) (not e!753886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322004 (= res!877456 (validKeyInArray!0 (select (arr!43029 _keys!1609) from!2000)))))

(declare-fun b!1322005 () Bool)

(assert (=> b!1322005 (= e!753887 (and e!753889 mapRes!55787))))

(declare-fun condMapEmpty!55787 () Bool)

(declare-fun mapDefault!55787 () ValueCell!17148)

(assert (=> b!1322005 (= condMapEmpty!55787 (= (arr!43028 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17148)) mapDefault!55787)))))

(assert (= (and start!111616 res!877457) b!1321996))

(assert (= (and b!1321996 res!877454) b!1321997))

(assert (= (and b!1321997 res!877459) b!1322001))

(assert (= (and b!1322001 res!877460) b!1322000))

(assert (= (and b!1322000 res!877453) b!1321998))

(assert (= (and b!1321998 res!877455) b!1322002))

(assert (= (and b!1322002 res!877458) b!1322004))

(assert (= (and b!1322004 res!877456) b!1321995))

(assert (= (and b!1322005 condMapEmpty!55787) mapIsEmpty!55787))

(assert (= (and b!1322005 (not condMapEmpty!55787)) mapNonEmpty!55787))

(get-info :version)

(assert (= (and mapNonEmpty!55787 ((_ is ValueCellFull!17148) mapValue!55787)) b!1321999))

(assert (= (and b!1322005 ((_ is ValueCellFull!17148) mapDefault!55787)) b!1322003))

(assert (= start!111616 b!1322005))

(declare-fun b_lambda!23599 () Bool)

(assert (=> (not b_lambda!23599) (not b!1321995)))

(declare-fun t!44309 () Bool)

(declare-fun tb!11625 () Bool)

(assert (=> (and start!111616 (= defaultEntry!1340 defaultEntry!1340) t!44309) tb!11625))

(declare-fun result!24305 () Bool)

(assert (=> tb!11625 (= result!24305 tp_is_empty!36093)))

(assert (=> b!1321995 t!44309))

(declare-fun b_and!48707 () Bool)

(assert (= b_and!48705 (and (=> t!44309 result!24305) b_and!48707)))

(declare-fun m!1210091 () Bool)

(assert (=> mapNonEmpty!55787 m!1210091))

(declare-fun m!1210093 () Bool)

(assert (=> b!1322002 m!1210093))

(declare-fun m!1210095 () Bool)

(assert (=> b!1321998 m!1210095))

(assert (=> b!1321998 m!1210095))

(declare-fun m!1210097 () Bool)

(assert (=> b!1321998 m!1210097))

(assert (=> b!1322004 m!1210093))

(assert (=> b!1322004 m!1210093))

(declare-fun m!1210099 () Bool)

(assert (=> b!1322004 m!1210099))

(declare-fun m!1210101 () Bool)

(assert (=> b!1321997 m!1210101))

(declare-fun m!1210103 () Bool)

(assert (=> b!1321995 m!1210103))

(declare-fun m!1210105 () Bool)

(assert (=> b!1321995 m!1210105))

(declare-fun m!1210107 () Bool)

(assert (=> b!1321995 m!1210107))

(declare-fun m!1210109 () Bool)

(assert (=> b!1321995 m!1210109))

(declare-fun m!1210111 () Bool)

(assert (=> b!1321995 m!1210111))

(declare-fun m!1210113 () Bool)

(assert (=> b!1321995 m!1210113))

(declare-fun m!1210115 () Bool)

(assert (=> b!1321995 m!1210115))

(declare-fun m!1210117 () Bool)

(assert (=> b!1321995 m!1210117))

(declare-fun m!1210119 () Bool)

(assert (=> b!1321995 m!1210119))

(declare-fun m!1210121 () Bool)

(assert (=> b!1321995 m!1210121))

(declare-fun m!1210123 () Bool)

(assert (=> b!1321995 m!1210123))

(assert (=> b!1321995 m!1210113))

(assert (=> b!1321995 m!1210109))

(declare-fun m!1210125 () Bool)

(assert (=> b!1321995 m!1210125))

(assert (=> b!1321995 m!1210093))

(declare-fun m!1210127 () Bool)

(assert (=> b!1321995 m!1210127))

(assert (=> b!1321995 m!1210093))

(declare-fun m!1210129 () Bool)

(assert (=> b!1321995 m!1210129))

(assert (=> b!1321995 m!1210121))

(declare-fun m!1210131 () Bool)

(assert (=> b!1321995 m!1210131))

(declare-fun m!1210133 () Bool)

(assert (=> start!111616 m!1210133))

(declare-fun m!1210135 () Bool)

(assert (=> start!111616 m!1210135))

(declare-fun m!1210137 () Bool)

(assert (=> start!111616 m!1210137))

(declare-fun m!1210139 () Bool)

(assert (=> b!1322001 m!1210139))

(check-sat (not b!1322004) tp_is_empty!36093 (not start!111616) (not b!1322001) (not b_next!30273) (not b!1321997) (not b_lambda!23599) (not mapNonEmpty!55787) b_and!48707 (not b!1321998) (not b!1321995))
(check-sat b_and!48707 (not b_next!30273))
