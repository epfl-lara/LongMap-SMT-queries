; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113162 () Bool)

(assert start!113162)

(declare-fun b_free!31213 () Bool)

(declare-fun b_next!31213 () Bool)

(assert (=> start!113162 (= b_free!31213 (not b_next!31213))))

(declare-fun tp!109445 () Bool)

(declare-fun b_and!50315 () Bool)

(assert (=> start!113162 (= tp!109445 b_and!50315)))

(declare-fun b!1341871 () Bool)

(declare-fun res!890244 () Bool)

(declare-fun e!764044 () Bool)

(assert (=> b!1341871 (=> (not res!890244) (not e!764044))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341871 (= res!890244 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341872 () Bool)

(declare-fun e!764045 () Bool)

(declare-fun tp_is_empty!37213 () Bool)

(assert (=> b!1341872 (= e!764045 tp_is_empty!37213)))

(declare-fun b!1341873 () Bool)

(declare-fun res!890247 () Bool)

(assert (=> b!1341873 (=> (not res!890247) (not e!764044))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91219 0))(
  ( (array!91220 (arr!44066 (Array (_ BitVec 32) (_ BitVec 64))) (size!44618 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91219)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341873 (= res!890247 (not (= (select (arr!44066 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341874 () Bool)

(declare-fun res!890243 () Bool)

(assert (=> b!1341874 (=> (not res!890243) (not e!764044))))

(assert (=> b!1341874 (= res!890243 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44618 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341875 () Bool)

(declare-fun res!890246 () Bool)

(assert (=> b!1341875 (=> (not res!890246) (not e!764044))))

(declare-datatypes ((V!54721 0))(
  ( (V!54722 (val!18681 Int)) )
))
(declare-fun minValue!1245 () V!54721)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54721)

(declare-datatypes ((ValueCell!17708 0))(
  ( (ValueCellFull!17708 (v!21328 V!54721)) (EmptyCell!17708) )
))
(declare-datatypes ((array!91221 0))(
  ( (array!91222 (arr!44067 (Array (_ BitVec 32) ValueCell!17708)) (size!44619 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91221)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24114 0))(
  ( (tuple2!24115 (_1!12068 (_ BitVec 64)) (_2!12068 V!54721)) )
))
(declare-datatypes ((List!31263 0))(
  ( (Nil!31260) (Cons!31259 (h!32468 tuple2!24114) (t!45679 List!31263)) )
))
(declare-datatypes ((ListLongMap!21771 0))(
  ( (ListLongMap!21772 (toList!10901 List!31263)) )
))
(declare-fun contains!9006 (ListLongMap!21771 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5753 (array!91219 array!91221 (_ BitVec 32) (_ BitVec 32) V!54721 V!54721 (_ BitVec 32) Int) ListLongMap!21771)

(assert (=> b!1341875 (= res!890246 (contains!9006 (getCurrentListMap!5753 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341876 () Bool)

(declare-fun res!890249 () Bool)

(assert (=> b!1341876 (=> (not res!890249) (not e!764044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341876 (= res!890249 (validKeyInArray!0 (select (arr!44066 _keys!1571) from!1960)))))

(declare-fun b!1341877 () Bool)

(declare-fun e!764041 () Bool)

(assert (=> b!1341877 (= e!764041 tp_is_empty!37213)))

(declare-fun res!890248 () Bool)

(assert (=> start!113162 (=> (not res!890248) (not e!764044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113162 (= res!890248 (validMask!0 mask!1977))))

(assert (=> start!113162 e!764044))

(assert (=> start!113162 tp_is_empty!37213))

(assert (=> start!113162 true))

(declare-fun array_inv!33411 (array!91219) Bool)

(assert (=> start!113162 (array_inv!33411 _keys!1571)))

(declare-fun e!764042 () Bool)

(declare-fun array_inv!33412 (array!91221) Bool)

(assert (=> start!113162 (and (array_inv!33412 _values!1303) e!764042)))

(assert (=> start!113162 tp!109445))

(declare-fun mapIsEmpty!57526 () Bool)

(declare-fun mapRes!57526 () Bool)

(assert (=> mapIsEmpty!57526 mapRes!57526))

(declare-fun b!1341878 () Bool)

(declare-fun res!890245 () Bool)

(assert (=> b!1341878 (=> (not res!890245) (not e!764044))))

(assert (=> b!1341878 (= res!890245 (and (= (size!44619 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44618 _keys!1571) (size!44619 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341879 () Bool)

(declare-fun res!890250 () Bool)

(assert (=> b!1341879 (=> (not res!890250) (not e!764044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91219 (_ BitVec 32)) Bool)

(assert (=> b!1341879 (= res!890250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341880 () Bool)

(declare-fun res!890251 () Bool)

(assert (=> b!1341880 (=> (not res!890251) (not e!764044))))

(declare-datatypes ((List!31264 0))(
  ( (Nil!31261) (Cons!31260 (h!32469 (_ BitVec 64)) (t!45680 List!31264)) )
))
(declare-fun arrayNoDuplicates!0 (array!91219 (_ BitVec 32) List!31264) Bool)

(assert (=> b!1341880 (= res!890251 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31261))))

(declare-fun b!1341881 () Bool)

(assert (=> b!1341881 (= e!764044 (not true))))

(declare-fun lt!594099 () ListLongMap!21771)

(assert (=> b!1341881 (contains!9006 lt!594099 k0!1142)))

(declare-datatypes ((Unit!43852 0))(
  ( (Unit!43853) )
))
(declare-fun lt!594102 () Unit!43852)

(declare-fun lt!594100 () V!54721)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!344 ((_ BitVec 64) (_ BitVec 64) V!54721 ListLongMap!21771) Unit!43852)

(assert (=> b!1341881 (= lt!594102 (lemmaInListMapAfterAddingDiffThenInBefore!344 k0!1142 (select (arr!44066 _keys!1571) from!1960) lt!594100 lt!594099))))

(declare-fun lt!594098 () ListLongMap!21771)

(assert (=> b!1341881 (contains!9006 lt!594098 k0!1142)))

(declare-fun lt!594101 () Unit!43852)

(assert (=> b!1341881 (= lt!594101 (lemmaInListMapAfterAddingDiffThenInBefore!344 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594098))))

(declare-fun +!4805 (ListLongMap!21771 tuple2!24114) ListLongMap!21771)

(assert (=> b!1341881 (= lt!594098 (+!4805 lt!594099 (tuple2!24115 (select (arr!44066 _keys!1571) from!1960) lt!594100)))))

(declare-fun get!22249 (ValueCell!17708 V!54721) V!54721)

(declare-fun dynLambda!3735 (Int (_ BitVec 64)) V!54721)

(assert (=> b!1341881 (= lt!594100 (get!22249 (select (arr!44067 _values!1303) from!1960) (dynLambda!3735 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6448 (array!91219 array!91221 (_ BitVec 32) (_ BitVec 32) V!54721 V!54721 (_ BitVec 32) Int) ListLongMap!21771)

(assert (=> b!1341881 (= lt!594099 (getCurrentListMapNoExtraKeys!6448 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1341882 () Bool)

(assert (=> b!1341882 (= e!764042 (and e!764045 mapRes!57526))))

(declare-fun condMapEmpty!57526 () Bool)

(declare-fun mapDefault!57526 () ValueCell!17708)

(assert (=> b!1341882 (= condMapEmpty!57526 (= (arr!44067 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17708)) mapDefault!57526)))))

(declare-fun mapNonEmpty!57526 () Bool)

(declare-fun tp!109444 () Bool)

(assert (=> mapNonEmpty!57526 (= mapRes!57526 (and tp!109444 e!764041))))

(declare-fun mapValue!57526 () ValueCell!17708)

(declare-fun mapRest!57526 () (Array (_ BitVec 32) ValueCell!17708))

(declare-fun mapKey!57526 () (_ BitVec 32))

(assert (=> mapNonEmpty!57526 (= (arr!44067 _values!1303) (store mapRest!57526 mapKey!57526 mapValue!57526))))

(assert (= (and start!113162 res!890248) b!1341878))

(assert (= (and b!1341878 res!890245) b!1341879))

(assert (= (and b!1341879 res!890250) b!1341880))

(assert (= (and b!1341880 res!890251) b!1341874))

(assert (= (and b!1341874 res!890243) b!1341875))

(assert (= (and b!1341875 res!890246) b!1341873))

(assert (= (and b!1341873 res!890247) b!1341876))

(assert (= (and b!1341876 res!890249) b!1341871))

(assert (= (and b!1341871 res!890244) b!1341881))

(assert (= (and b!1341882 condMapEmpty!57526) mapIsEmpty!57526))

(assert (= (and b!1341882 (not condMapEmpty!57526)) mapNonEmpty!57526))

(get-info :version)

(assert (= (and mapNonEmpty!57526 ((_ is ValueCellFull!17708) mapValue!57526)) b!1341877))

(assert (= (and b!1341882 ((_ is ValueCellFull!17708) mapDefault!57526)) b!1341872))

(assert (= start!113162 b!1341882))

(declare-fun b_lambda!24379 () Bool)

(assert (=> (not b_lambda!24379) (not b!1341881)))

(declare-fun t!45678 () Bool)

(declare-fun tb!12219 () Bool)

(assert (=> (and start!113162 (= defaultEntry!1306 defaultEntry!1306) t!45678) tb!12219))

(declare-fun result!25537 () Bool)

(assert (=> tb!12219 (= result!25537 tp_is_empty!37213)))

(assert (=> b!1341881 t!45678))

(declare-fun b_and!50317 () Bool)

(assert (= b_and!50315 (and (=> t!45678 result!25537) b_and!50317)))

(declare-fun m!1229047 () Bool)

(assert (=> mapNonEmpty!57526 m!1229047))

(declare-fun m!1229049 () Bool)

(assert (=> b!1341881 m!1229049))

(declare-fun m!1229051 () Bool)

(assert (=> b!1341881 m!1229051))

(declare-fun m!1229053 () Bool)

(assert (=> b!1341881 m!1229053))

(declare-fun m!1229055 () Bool)

(assert (=> b!1341881 m!1229055))

(declare-fun m!1229057 () Bool)

(assert (=> b!1341881 m!1229057))

(declare-fun m!1229059 () Bool)

(assert (=> b!1341881 m!1229059))

(declare-fun m!1229061 () Bool)

(assert (=> b!1341881 m!1229061))

(assert (=> b!1341881 m!1229055))

(declare-fun m!1229063 () Bool)

(assert (=> b!1341881 m!1229063))

(declare-fun m!1229065 () Bool)

(assert (=> b!1341881 m!1229065))

(assert (=> b!1341881 m!1229057))

(declare-fun m!1229067 () Bool)

(assert (=> b!1341881 m!1229067))

(assert (=> b!1341881 m!1229049))

(declare-fun m!1229069 () Bool)

(assert (=> start!113162 m!1229069))

(declare-fun m!1229071 () Bool)

(assert (=> start!113162 m!1229071))

(declare-fun m!1229073 () Bool)

(assert (=> start!113162 m!1229073))

(assert (=> b!1341873 m!1229049))

(declare-fun m!1229075 () Bool)

(assert (=> b!1341875 m!1229075))

(assert (=> b!1341875 m!1229075))

(declare-fun m!1229077 () Bool)

(assert (=> b!1341875 m!1229077))

(declare-fun m!1229079 () Bool)

(assert (=> b!1341880 m!1229079))

(declare-fun m!1229081 () Bool)

(assert (=> b!1341879 m!1229081))

(assert (=> b!1341876 m!1229049))

(assert (=> b!1341876 m!1229049))

(declare-fun m!1229083 () Bool)

(assert (=> b!1341876 m!1229083))

(check-sat (not b!1341875) (not b!1341876) b_and!50317 (not b!1341881) (not b!1341879) tp_is_empty!37213 (not start!113162) (not b!1341880) (not b_lambda!24379) (not b_next!31213) (not mapNonEmpty!57526))
(check-sat b_and!50317 (not b_next!31213))
