; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113326 () Bool)

(assert start!113326)

(declare-fun b_free!31153 () Bool)

(declare-fun b_next!31153 () Bool)

(assert (=> start!113326 (= b_free!31153 (not b_next!31153))))

(declare-fun tp!109263 () Bool)

(declare-fun b_and!50215 () Bool)

(assert (=> start!113326 (= tp!109263 b_and!50215)))

(declare-fun b!1342100 () Bool)

(declare-fun e!764468 () Bool)

(declare-fun e!764471 () Bool)

(declare-fun mapRes!57436 () Bool)

(assert (=> b!1342100 (= e!764468 (and e!764471 mapRes!57436))))

(declare-fun condMapEmpty!57436 () Bool)

(declare-datatypes ((V!54641 0))(
  ( (V!54642 (val!18651 Int)) )
))
(declare-datatypes ((ValueCell!17678 0))(
  ( (ValueCellFull!17678 (v!21294 V!54641)) (EmptyCell!17678) )
))
(declare-datatypes ((array!91279 0))(
  ( (array!91280 (arr!44091 (Array (_ BitVec 32) ValueCell!17678)) (size!44642 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91279)

(declare-fun mapDefault!57436 () ValueCell!17678)

(assert (=> b!1342100 (= condMapEmpty!57436 (= (arr!44091 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17678)) mapDefault!57436)))))

(declare-fun b!1342101 () Bool)

(declare-fun res!889981 () Bool)

(declare-fun e!764467 () Bool)

(assert (=> b!1342101 (=> (not res!889981) (not e!764467))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342101 (= res!889981 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342102 () Bool)

(declare-fun res!889982 () Bool)

(assert (=> b!1342102 (=> (not res!889982) (not e!764467))))

(declare-datatypes ((array!91281 0))(
  ( (array!91282 (arr!44092 (Array (_ BitVec 32) (_ BitVec 64))) (size!44643 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91281)

(declare-datatypes ((List!31223 0))(
  ( (Nil!31220) (Cons!31219 (h!32437 (_ BitVec 64)) (t!45579 List!31223)) )
))
(declare-fun arrayNoDuplicates!0 (array!91281 (_ BitVec 32) List!31223) Bool)

(assert (=> b!1342102 (= res!889982 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31220))))

(declare-fun b!1342103 () Bool)

(declare-fun res!889983 () Bool)

(assert (=> b!1342103 (=> (not res!889983) (not e!764467))))

(declare-fun minValue!1245 () V!54641)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54641)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24068 0))(
  ( (tuple2!24069 (_1!12045 (_ BitVec 64)) (_2!12045 V!54641)) )
))
(declare-datatypes ((List!31224 0))(
  ( (Nil!31221) (Cons!31220 (h!32438 tuple2!24068) (t!45580 List!31224)) )
))
(declare-datatypes ((ListLongMap!21733 0))(
  ( (ListLongMap!21734 (toList!10882 List!31224)) )
))
(declare-fun contains!9070 (ListLongMap!21733 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5834 (array!91281 array!91279 (_ BitVec 32) (_ BitVec 32) V!54641 V!54641 (_ BitVec 32) Int) ListLongMap!21733)

(assert (=> b!1342103 (= res!889983 (contains!9070 (getCurrentListMap!5834 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342104 () Bool)

(assert (=> b!1342104 (= e!764467 (not true))))

(declare-fun lt!594521 () ListLongMap!21733)

(assert (=> b!1342104 (contains!9070 lt!594521 k0!1142)))

(declare-datatypes ((Unit!43940 0))(
  ( (Unit!43941) )
))
(declare-fun lt!594520 () Unit!43940)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!326 ((_ BitVec 64) (_ BitVec 64) V!54641 ListLongMap!21733) Unit!43940)

(assert (=> b!1342104 (= lt!594520 (lemmaInListMapAfterAddingDiffThenInBefore!326 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594521))))

(declare-fun +!4800 (ListLongMap!21733 tuple2!24068) ListLongMap!21733)

(declare-fun getCurrentListMapNoExtraKeys!6449 (array!91281 array!91279 (_ BitVec 32) (_ BitVec 32) V!54641 V!54641 (_ BitVec 32) Int) ListLongMap!21733)

(declare-fun get!22260 (ValueCell!17678 V!54641) V!54641)

(declare-fun dynLambda!3754 (Int (_ BitVec 64)) V!54641)

(assert (=> b!1342104 (= lt!594521 (+!4800 (getCurrentListMapNoExtraKeys!6449 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24069 (select (arr!44092 _keys!1571) from!1960) (get!22260 (select (arr!44091 _values!1303) from!1960) (dynLambda!3754 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1342105 () Bool)

(declare-fun res!889987 () Bool)

(assert (=> b!1342105 (=> (not res!889987) (not e!764467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91281 (_ BitVec 32)) Bool)

(assert (=> b!1342105 (= res!889987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342106 () Bool)

(declare-fun res!889984 () Bool)

(assert (=> b!1342106 (=> (not res!889984) (not e!764467))))

(assert (=> b!1342106 (= res!889984 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44643 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57436 () Bool)

(assert (=> mapIsEmpty!57436 mapRes!57436))

(declare-fun b!1342108 () Bool)

(declare-fun res!889980 () Bool)

(assert (=> b!1342108 (=> (not res!889980) (not e!764467))))

(assert (=> b!1342108 (= res!889980 (not (= (select (arr!44092 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342109 () Bool)

(declare-fun res!889988 () Bool)

(assert (=> b!1342109 (=> (not res!889988) (not e!764467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342109 (= res!889988 (validKeyInArray!0 (select (arr!44092 _keys!1571) from!1960)))))

(declare-fun b!1342107 () Bool)

(declare-fun e!764470 () Bool)

(declare-fun tp_is_empty!37153 () Bool)

(assert (=> b!1342107 (= e!764470 tp_is_empty!37153)))

(declare-fun res!889985 () Bool)

(assert (=> start!113326 (=> (not res!889985) (not e!764467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113326 (= res!889985 (validMask!0 mask!1977))))

(assert (=> start!113326 e!764467))

(assert (=> start!113326 tp_is_empty!37153))

(assert (=> start!113326 true))

(declare-fun array_inv!33505 (array!91281) Bool)

(assert (=> start!113326 (array_inv!33505 _keys!1571)))

(declare-fun array_inv!33506 (array!91279) Bool)

(assert (=> start!113326 (and (array_inv!33506 _values!1303) e!764468)))

(assert (=> start!113326 tp!109263))

(declare-fun b!1342110 () Bool)

(declare-fun res!889986 () Bool)

(assert (=> b!1342110 (=> (not res!889986) (not e!764467))))

(assert (=> b!1342110 (= res!889986 (and (= (size!44642 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44643 _keys!1571) (size!44642 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57436 () Bool)

(declare-fun tp!109264 () Bool)

(assert (=> mapNonEmpty!57436 (= mapRes!57436 (and tp!109264 e!764470))))

(declare-fun mapValue!57436 () ValueCell!17678)

(declare-fun mapRest!57436 () (Array (_ BitVec 32) ValueCell!17678))

(declare-fun mapKey!57436 () (_ BitVec 32))

(assert (=> mapNonEmpty!57436 (= (arr!44091 _values!1303) (store mapRest!57436 mapKey!57436 mapValue!57436))))

(declare-fun b!1342111 () Bool)

(assert (=> b!1342111 (= e!764471 tp_is_empty!37153)))

(assert (= (and start!113326 res!889985) b!1342110))

(assert (= (and b!1342110 res!889986) b!1342105))

(assert (= (and b!1342105 res!889987) b!1342102))

(assert (= (and b!1342102 res!889982) b!1342106))

(assert (= (and b!1342106 res!889984) b!1342103))

(assert (= (and b!1342103 res!889983) b!1342108))

(assert (= (and b!1342108 res!889980) b!1342109))

(assert (= (and b!1342109 res!889988) b!1342101))

(assert (= (and b!1342101 res!889981) b!1342104))

(assert (= (and b!1342100 condMapEmpty!57436) mapIsEmpty!57436))

(assert (= (and b!1342100 (not condMapEmpty!57436)) mapNonEmpty!57436))

(get-info :version)

(assert (= (and mapNonEmpty!57436 ((_ is ValueCellFull!17678) mapValue!57436)) b!1342107))

(assert (= (and b!1342100 ((_ is ValueCellFull!17678) mapDefault!57436)) b!1342111))

(assert (= start!113326 b!1342100))

(declare-fun b_lambda!24323 () Bool)

(assert (=> (not b_lambda!24323) (not b!1342104)))

(declare-fun t!45578 () Bool)

(declare-fun tb!12159 () Bool)

(assert (=> (and start!113326 (= defaultEntry!1306 defaultEntry!1306) t!45578) tb!12159))

(declare-fun result!25417 () Bool)

(assert (=> tb!12159 (= result!25417 tp_is_empty!37153)))

(assert (=> b!1342104 t!45578))

(declare-fun b_and!50217 () Bool)

(assert (= b_and!50215 (and (=> t!45578 result!25417) b_and!50217)))

(declare-fun m!1230117 () Bool)

(assert (=> mapNonEmpty!57436 m!1230117))

(declare-fun m!1230119 () Bool)

(assert (=> start!113326 m!1230119))

(declare-fun m!1230121 () Bool)

(assert (=> start!113326 m!1230121))

(declare-fun m!1230123 () Bool)

(assert (=> start!113326 m!1230123))

(declare-fun m!1230125 () Bool)

(assert (=> b!1342103 m!1230125))

(assert (=> b!1342103 m!1230125))

(declare-fun m!1230127 () Bool)

(assert (=> b!1342103 m!1230127))

(declare-fun m!1230129 () Bool)

(assert (=> b!1342102 m!1230129))

(declare-fun m!1230131 () Bool)

(assert (=> b!1342105 m!1230131))

(declare-fun m!1230133 () Bool)

(assert (=> b!1342104 m!1230133))

(declare-fun m!1230135 () Bool)

(assert (=> b!1342104 m!1230135))

(declare-fun m!1230137 () Bool)

(assert (=> b!1342104 m!1230137))

(declare-fun m!1230139 () Bool)

(assert (=> b!1342104 m!1230139))

(assert (=> b!1342104 m!1230133))

(declare-fun m!1230141 () Bool)

(assert (=> b!1342104 m!1230141))

(assert (=> b!1342104 m!1230135))

(declare-fun m!1230143 () Bool)

(assert (=> b!1342104 m!1230143))

(assert (=> b!1342104 m!1230137))

(declare-fun m!1230145 () Bool)

(assert (=> b!1342104 m!1230145))

(declare-fun m!1230147 () Bool)

(assert (=> b!1342104 m!1230147))

(assert (=> b!1342108 m!1230147))

(assert (=> b!1342109 m!1230147))

(assert (=> b!1342109 m!1230147))

(declare-fun m!1230149 () Bool)

(assert (=> b!1342109 m!1230149))

(check-sat (not b_next!31153) (not b_lambda!24323) (not b!1342104) (not start!113326) (not b!1342102) (not b!1342105) tp_is_empty!37153 b_and!50217 (not mapNonEmpty!57436) (not b!1342103) (not b!1342109))
(check-sat b_and!50217 (not b_next!31153))
