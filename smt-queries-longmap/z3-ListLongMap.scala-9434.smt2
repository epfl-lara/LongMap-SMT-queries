; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112214 () Bool)

(assert start!112214)

(declare-fun b_free!30609 () Bool)

(declare-fun b_next!30609 () Bool)

(assert (=> start!112214 (= b_free!30609 (not b_next!30609))))

(declare-fun tp!107464 () Bool)

(declare-fun b_and!49273 () Bool)

(assert (=> start!112214 (= tp!107464 b_and!49273)))

(declare-fun b!1329133 () Bool)

(declare-fun e!757768 () Bool)

(declare-fun tp_is_empty!36519 () Bool)

(assert (=> b!1329133 (= e!757768 tp_is_empty!36519)))

(declare-fun b!1329134 () Bool)

(declare-fun res!881884 () Bool)

(declare-fun e!757771 () Bool)

(assert (=> b!1329134 (=> (not res!881884) (not e!757771))))

(declare-datatypes ((V!53795 0))(
  ( (V!53796 (val!18334 Int)) )
))
(declare-datatypes ((ValueCell!17361 0))(
  ( (ValueCellFull!17361 (v!20971 V!53795)) (EmptyCell!17361) )
))
(declare-datatypes ((array!89930 0))(
  ( (array!89931 (arr!43431 (Array (_ BitVec 32) ValueCell!17361)) (size!43981 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89930)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89932 0))(
  ( (array!89933 (arr!43432 (Array (_ BitVec 32) (_ BitVec 64))) (size!43982 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89932)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53795)

(declare-fun zeroValue!1262 () V!53795)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23602 0))(
  ( (tuple2!23603 (_1!11812 (_ BitVec 64)) (_2!11812 V!53795)) )
))
(declare-datatypes ((List!30757 0))(
  ( (Nil!30754) (Cons!30753 (h!31962 tuple2!23602) (t!44779 List!30757)) )
))
(declare-datatypes ((ListLongMap!21259 0))(
  ( (ListLongMap!21260 (toList!10645 List!30757)) )
))
(declare-fun contains!8809 (ListLongMap!21259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5635 (array!89932 array!89930 (_ BitVec 32) (_ BitVec 32) V!53795 V!53795 (_ BitVec 32) Int) ListLongMap!21259)

(assert (=> b!1329134 (= res!881884 (contains!8809 (getCurrentListMap!5635 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329135 () Bool)

(declare-fun res!881885 () Bool)

(assert (=> b!1329135 (=> (not res!881885) (not e!757771))))

(assert (=> b!1329135 (= res!881885 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!56452 () Bool)

(declare-fun mapRes!56452 () Bool)

(declare-fun tp!107463 () Bool)

(declare-fun e!757767 () Bool)

(assert (=> mapNonEmpty!56452 (= mapRes!56452 (and tp!107463 e!757767))))

(declare-fun mapRest!56452 () (Array (_ BitVec 32) ValueCell!17361))

(declare-fun mapValue!56452 () ValueCell!17361)

(declare-fun mapKey!56452 () (_ BitVec 32))

(assert (=> mapNonEmpty!56452 (= (arr!43431 _values!1320) (store mapRest!56452 mapKey!56452 mapValue!56452))))

(declare-fun b!1329136 () Bool)

(declare-fun res!881886 () Bool)

(assert (=> b!1329136 (=> (not res!881886) (not e!757771))))

(declare-datatypes ((List!30758 0))(
  ( (Nil!30755) (Cons!30754 (h!31963 (_ BitVec 64)) (t!44780 List!30758)) )
))
(declare-fun arrayNoDuplicates!0 (array!89932 (_ BitVec 32) List!30758) Bool)

(assert (=> b!1329136 (= res!881886 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30755))))

(declare-fun b!1329137 () Bool)

(declare-fun e!757770 () Bool)

(assert (=> b!1329137 (= e!757770 (and e!757768 mapRes!56452))))

(declare-fun condMapEmpty!56452 () Bool)

(declare-fun mapDefault!56452 () ValueCell!17361)

(assert (=> b!1329137 (= condMapEmpty!56452 (= (arr!43431 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17361)) mapDefault!56452)))))

(declare-fun b!1329138 () Bool)

(declare-fun res!881883 () Bool)

(assert (=> b!1329138 (=> (not res!881883) (not e!757771))))

(assert (=> b!1329138 (= res!881883 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43982 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329139 () Bool)

(declare-fun res!881881 () Bool)

(assert (=> b!1329139 (=> (not res!881881) (not e!757771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89932 (_ BitVec 32)) Bool)

(assert (=> b!1329139 (= res!881881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!881880 () Bool)

(assert (=> start!112214 (=> (not res!881880) (not e!757771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112214 (= res!881880 (validMask!0 mask!1998))))

(assert (=> start!112214 e!757771))

(declare-fun array_inv!32769 (array!89930) Bool)

(assert (=> start!112214 (and (array_inv!32769 _values!1320) e!757770)))

(assert (=> start!112214 true))

(declare-fun array_inv!32770 (array!89932) Bool)

(assert (=> start!112214 (array_inv!32770 _keys!1590)))

(assert (=> start!112214 tp!107464))

(assert (=> start!112214 tp_is_empty!36519))

(declare-fun b!1329140 () Bool)

(declare-fun res!881882 () Bool)

(assert (=> b!1329140 (=> (not res!881882) (not e!757771))))

(assert (=> b!1329140 (= res!881882 (not (= (select (arr!43432 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329141 () Bool)

(declare-fun res!881879 () Bool)

(assert (=> b!1329141 (=> (not res!881879) (not e!757771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329141 (= res!881879 (validKeyInArray!0 (select (arr!43432 _keys!1590) from!1980)))))

(declare-fun b!1329142 () Bool)

(assert (=> b!1329142 (= e!757767 tp_is_empty!36519)))

(declare-fun b!1329143 () Bool)

(assert (=> b!1329143 (= e!757771 (not true))))

(declare-fun lt!590908 () ListLongMap!21259)

(assert (=> b!1329143 (contains!8809 lt!590908 k0!1153)))

(declare-datatypes ((Unit!43741 0))(
  ( (Unit!43742) )
))
(declare-fun lt!590907 () Unit!43741)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!233 ((_ BitVec 64) (_ BitVec 64) V!53795 ListLongMap!21259) Unit!43741)

(assert (=> b!1329143 (= lt!590907 (lemmaInListMapAfterAddingDiffThenInBefore!233 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590908))))

(declare-fun +!4646 (ListLongMap!21259 tuple2!23602) ListLongMap!21259)

(declare-fun getCurrentListMapNoExtraKeys!6284 (array!89932 array!89930 (_ BitVec 32) (_ BitVec 32) V!53795 V!53795 (_ BitVec 32) Int) ListLongMap!21259)

(declare-fun get!21878 (ValueCell!17361 V!53795) V!53795)

(declare-fun dynLambda!3585 (Int (_ BitVec 64)) V!53795)

(assert (=> b!1329143 (= lt!590908 (+!4646 (getCurrentListMapNoExtraKeys!6284 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23603 (select (arr!43432 _keys!1590) from!1980) (get!21878 (select (arr!43431 _values!1320) from!1980) (dynLambda!3585 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329144 () Bool)

(declare-fun res!881878 () Bool)

(assert (=> b!1329144 (=> (not res!881878) (not e!757771))))

(assert (=> b!1329144 (= res!881878 (and (= (size!43981 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43982 _keys!1590) (size!43981 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56452 () Bool)

(assert (=> mapIsEmpty!56452 mapRes!56452))

(assert (= (and start!112214 res!881880) b!1329144))

(assert (= (and b!1329144 res!881878) b!1329139))

(assert (= (and b!1329139 res!881881) b!1329136))

(assert (= (and b!1329136 res!881886) b!1329138))

(assert (= (and b!1329138 res!881883) b!1329134))

(assert (= (and b!1329134 res!881884) b!1329140))

(assert (= (and b!1329140 res!881882) b!1329141))

(assert (= (and b!1329141 res!881879) b!1329135))

(assert (= (and b!1329135 res!881885) b!1329143))

(assert (= (and b!1329137 condMapEmpty!56452) mapIsEmpty!56452))

(assert (= (and b!1329137 (not condMapEmpty!56452)) mapNonEmpty!56452))

(get-info :version)

(assert (= (and mapNonEmpty!56452 ((_ is ValueCellFull!17361) mapValue!56452)) b!1329142))

(assert (= (and b!1329137 ((_ is ValueCellFull!17361) mapDefault!56452)) b!1329133))

(assert (= start!112214 b!1329137))

(declare-fun b_lambda!23869 () Bool)

(assert (=> (not b_lambda!23869) (not b!1329143)))

(declare-fun t!44778 () Bool)

(declare-fun tb!11825 () Bool)

(assert (=> (and start!112214 (= defaultEntry!1323 defaultEntry!1323) t!44778) tb!11825))

(declare-fun result!24721 () Bool)

(assert (=> tb!11825 (= result!24721 tp_is_empty!36519)))

(assert (=> b!1329143 t!44778))

(declare-fun b_and!49275 () Bool)

(assert (= b_and!49273 (and (=> t!44778 result!24721) b_and!49275)))

(declare-fun m!1217923 () Bool)

(assert (=> b!1329134 m!1217923))

(assert (=> b!1329134 m!1217923))

(declare-fun m!1217925 () Bool)

(assert (=> b!1329134 m!1217925))

(declare-fun m!1217927 () Bool)

(assert (=> b!1329140 m!1217927))

(assert (=> b!1329141 m!1217927))

(assert (=> b!1329141 m!1217927))

(declare-fun m!1217929 () Bool)

(assert (=> b!1329141 m!1217929))

(declare-fun m!1217931 () Bool)

(assert (=> b!1329136 m!1217931))

(declare-fun m!1217933 () Bool)

(assert (=> b!1329139 m!1217933))

(declare-fun m!1217935 () Bool)

(assert (=> mapNonEmpty!56452 m!1217935))

(declare-fun m!1217937 () Bool)

(assert (=> start!112214 m!1217937))

(declare-fun m!1217939 () Bool)

(assert (=> start!112214 m!1217939))

(declare-fun m!1217941 () Bool)

(assert (=> start!112214 m!1217941))

(declare-fun m!1217943 () Bool)

(assert (=> b!1329143 m!1217943))

(declare-fun m!1217945 () Bool)

(assert (=> b!1329143 m!1217945))

(declare-fun m!1217947 () Bool)

(assert (=> b!1329143 m!1217947))

(declare-fun m!1217949 () Bool)

(assert (=> b!1329143 m!1217949))

(assert (=> b!1329143 m!1217943))

(declare-fun m!1217951 () Bool)

(assert (=> b!1329143 m!1217951))

(declare-fun m!1217953 () Bool)

(assert (=> b!1329143 m!1217953))

(assert (=> b!1329143 m!1217945))

(assert (=> b!1329143 m!1217927))

(assert (=> b!1329143 m!1217949))

(declare-fun m!1217955 () Bool)

(assert (=> b!1329143 m!1217955))

(check-sat (not b!1329143) (not mapNonEmpty!56452) (not b!1329141) b_and!49275 (not b!1329136) tp_is_empty!36519 (not b!1329139) (not b!1329134) (not b_next!30609) (not b_lambda!23869) (not start!112214))
(check-sat b_and!49275 (not b_next!30609))
