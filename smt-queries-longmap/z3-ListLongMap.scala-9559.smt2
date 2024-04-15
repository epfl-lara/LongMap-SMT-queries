; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113216 () Bool)

(assert start!113216)

(declare-fun b_free!31267 () Bool)

(declare-fun b_next!31267 () Bool)

(assert (=> start!113216 (= b_free!31267 (not b_next!31267))))

(declare-fun tp!109607 () Bool)

(declare-fun b_and!50423 () Bool)

(assert (=> start!113216 (= tp!109607 b_and!50423)))

(declare-fun b!1342897 () Bool)

(declare-fun res!890976 () Bool)

(declare-fun e!764450 () Bool)

(assert (=> b!1342897 (=> (not res!890976) (not e!764450))))

(declare-datatypes ((array!91325 0))(
  ( (array!91326 (arr!44119 (Array (_ BitVec 32) (_ BitVec 64))) (size!44671 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91325)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342897 (= res!890976 (validKeyInArray!0 (select (arr!44119 _keys!1571) from!1960)))))

(declare-fun b!1342898 () Bool)

(declare-fun res!890978 () Bool)

(assert (=> b!1342898 (=> (not res!890978) (not e!764450))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342898 (= res!890978 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44671 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342899 () Bool)

(declare-fun e!764446 () Bool)

(declare-fun e!764447 () Bool)

(declare-fun mapRes!57607 () Bool)

(assert (=> b!1342899 (= e!764446 (and e!764447 mapRes!57607))))

(declare-fun condMapEmpty!57607 () Bool)

(declare-datatypes ((V!54793 0))(
  ( (V!54794 (val!18708 Int)) )
))
(declare-datatypes ((ValueCell!17735 0))(
  ( (ValueCellFull!17735 (v!21355 V!54793)) (EmptyCell!17735) )
))
(declare-datatypes ((array!91327 0))(
  ( (array!91328 (arr!44120 (Array (_ BitVec 32) ValueCell!17735)) (size!44672 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91327)

(declare-fun mapDefault!57607 () ValueCell!17735)

(assert (=> b!1342899 (= condMapEmpty!57607 (= (arr!44120 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17735)) mapDefault!57607)))))

(declare-fun b!1342900 () Bool)

(declare-fun tp_is_empty!37267 () Bool)

(assert (=> b!1342900 (= e!764447 tp_is_empty!37267)))

(declare-fun res!890974 () Bool)

(assert (=> start!113216 (=> (not res!890974) (not e!764450))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113216 (= res!890974 (validMask!0 mask!1977))))

(assert (=> start!113216 e!764450))

(assert (=> start!113216 tp_is_empty!37267))

(assert (=> start!113216 true))

(declare-fun array_inv!33447 (array!91325) Bool)

(assert (=> start!113216 (array_inv!33447 _keys!1571)))

(declare-fun array_inv!33448 (array!91327) Bool)

(assert (=> start!113216 (and (array_inv!33448 _values!1303) e!764446)))

(assert (=> start!113216 tp!109607))

(declare-fun b!1342901 () Bool)

(declare-fun res!890977 () Bool)

(assert (=> b!1342901 (=> (not res!890977) (not e!764450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91325 (_ BitVec 32)) Bool)

(assert (=> b!1342901 (= res!890977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57607 () Bool)

(assert (=> mapIsEmpty!57607 mapRes!57607))

(declare-fun b!1342902 () Bool)

(assert (=> b!1342902 (= e!764450 (not true))))

(declare-datatypes ((tuple2!24160 0))(
  ( (tuple2!24161 (_1!12091 (_ BitVec 64)) (_2!12091 V!54793)) )
))
(declare-datatypes ((List!31305 0))(
  ( (Nil!31302) (Cons!31301 (h!32510 tuple2!24160) (t!45775 List!31305)) )
))
(declare-datatypes ((ListLongMap!21817 0))(
  ( (ListLongMap!21818 (toList!10924 List!31305)) )
))
(declare-fun lt!594519 () ListLongMap!21817)

(declare-fun zeroValue!1245 () V!54793)

(declare-fun contains!9029 (ListLongMap!21817 (_ BitVec 64)) Bool)

(declare-fun +!4826 (ListLongMap!21817 tuple2!24160) ListLongMap!21817)

(assert (=> b!1342902 (contains!9029 (+!4826 lt!594519 (tuple2!24161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!43894 0))(
  ( (Unit!43895) )
))
(declare-fun lt!594515 () Unit!43894)

(declare-fun addStillContains!1190 (ListLongMap!21817 (_ BitVec 64) V!54793 (_ BitVec 64)) Unit!43894)

(assert (=> b!1342902 (= lt!594515 (addStillContains!1190 lt!594519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1342902 (contains!9029 lt!594519 k0!1142)))

(declare-fun lt!594518 () Unit!43894)

(declare-fun lt!594514 () V!54793)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!365 ((_ BitVec 64) (_ BitVec 64) V!54793 ListLongMap!21817) Unit!43894)

(assert (=> b!1342902 (= lt!594518 (lemmaInListMapAfterAddingDiffThenInBefore!365 k0!1142 (select (arr!44119 _keys!1571) from!1960) lt!594514 lt!594519))))

(declare-fun lt!594516 () ListLongMap!21817)

(assert (=> b!1342902 (contains!9029 lt!594516 k0!1142)))

(declare-fun lt!594517 () Unit!43894)

(assert (=> b!1342902 (= lt!594517 (lemmaInListMapAfterAddingDiffThenInBefore!365 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594516))))

(assert (=> b!1342902 (= lt!594516 (+!4826 lt!594519 (tuple2!24161 (select (arr!44119 _keys!1571) from!1960) lt!594514)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22288 (ValueCell!17735 V!54793) V!54793)

(declare-fun dynLambda!3756 (Int (_ BitVec 64)) V!54793)

(assert (=> b!1342902 (= lt!594514 (get!22288 (select (arr!44120 _values!1303) from!1960) (dynLambda!3756 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54793)

(declare-fun getCurrentListMapNoExtraKeys!6469 (array!91325 array!91327 (_ BitVec 32) (_ BitVec 32) V!54793 V!54793 (_ BitVec 32) Int) ListLongMap!21817)

(assert (=> b!1342902 (= lt!594519 (getCurrentListMapNoExtraKeys!6469 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342903 () Bool)

(declare-fun res!890972 () Bool)

(assert (=> b!1342903 (=> (not res!890972) (not e!764450))))

(assert (=> b!1342903 (= res!890972 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57607 () Bool)

(declare-fun tp!109606 () Bool)

(declare-fun e!764449 () Bool)

(assert (=> mapNonEmpty!57607 (= mapRes!57607 (and tp!109606 e!764449))))

(declare-fun mapValue!57607 () ValueCell!17735)

(declare-fun mapKey!57607 () (_ BitVec 32))

(declare-fun mapRest!57607 () (Array (_ BitVec 32) ValueCell!17735))

(assert (=> mapNonEmpty!57607 (= (arr!44120 _values!1303) (store mapRest!57607 mapKey!57607 mapValue!57607))))

(declare-fun b!1342904 () Bool)

(declare-fun res!890979 () Bool)

(assert (=> b!1342904 (=> (not res!890979) (not e!764450))))

(assert (=> b!1342904 (= res!890979 (not (= (select (arr!44119 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342905 () Bool)

(declare-fun res!890980 () Bool)

(assert (=> b!1342905 (=> (not res!890980) (not e!764450))))

(declare-datatypes ((List!31306 0))(
  ( (Nil!31303) (Cons!31302 (h!32511 (_ BitVec 64)) (t!45776 List!31306)) )
))
(declare-fun arrayNoDuplicates!0 (array!91325 (_ BitVec 32) List!31306) Bool)

(assert (=> b!1342905 (= res!890980 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31303))))

(declare-fun b!1342906 () Bool)

(declare-fun res!890975 () Bool)

(assert (=> b!1342906 (=> (not res!890975) (not e!764450))))

(assert (=> b!1342906 (= res!890975 (and (= (size!44672 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44671 _keys!1571) (size!44672 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342907 () Bool)

(assert (=> b!1342907 (= e!764449 tp_is_empty!37267)))

(declare-fun b!1342908 () Bool)

(declare-fun res!890973 () Bool)

(assert (=> b!1342908 (=> (not res!890973) (not e!764450))))

(declare-fun getCurrentListMap!5773 (array!91325 array!91327 (_ BitVec 32) (_ BitVec 32) V!54793 V!54793 (_ BitVec 32) Int) ListLongMap!21817)

(assert (=> b!1342908 (= res!890973 (contains!9029 (getCurrentListMap!5773 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113216 res!890974) b!1342906))

(assert (= (and b!1342906 res!890975) b!1342901))

(assert (= (and b!1342901 res!890977) b!1342905))

(assert (= (and b!1342905 res!890980) b!1342898))

(assert (= (and b!1342898 res!890978) b!1342908))

(assert (= (and b!1342908 res!890973) b!1342904))

(assert (= (and b!1342904 res!890979) b!1342897))

(assert (= (and b!1342897 res!890976) b!1342903))

(assert (= (and b!1342903 res!890972) b!1342902))

(assert (= (and b!1342899 condMapEmpty!57607) mapIsEmpty!57607))

(assert (= (and b!1342899 (not condMapEmpty!57607)) mapNonEmpty!57607))

(get-info :version)

(assert (= (and mapNonEmpty!57607 ((_ is ValueCellFull!17735) mapValue!57607)) b!1342907))

(assert (= (and b!1342899 ((_ is ValueCellFull!17735) mapDefault!57607)) b!1342900))

(assert (= start!113216 b!1342899))

(declare-fun b_lambda!24433 () Bool)

(assert (=> (not b_lambda!24433) (not b!1342902)))

(declare-fun t!45774 () Bool)

(declare-fun tb!12273 () Bool)

(assert (=> (and start!113216 (= defaultEntry!1306 defaultEntry!1306) t!45774) tb!12273))

(declare-fun result!25645 () Bool)

(assert (=> tb!12273 (= result!25645 tp_is_empty!37267)))

(assert (=> b!1342902 t!45774))

(declare-fun b_and!50425 () Bool)

(assert (= b_and!50423 (and (=> t!45774 result!25645) b_and!50425)))

(declare-fun m!1230091 () Bool)

(assert (=> b!1342902 m!1230091))

(declare-fun m!1230093 () Bool)

(assert (=> b!1342902 m!1230093))

(declare-fun m!1230095 () Bool)

(assert (=> b!1342902 m!1230095))

(declare-fun m!1230097 () Bool)

(assert (=> b!1342902 m!1230097))

(declare-fun m!1230099 () Bool)

(assert (=> b!1342902 m!1230099))

(declare-fun m!1230101 () Bool)

(assert (=> b!1342902 m!1230101))

(declare-fun m!1230103 () Bool)

(assert (=> b!1342902 m!1230103))

(assert (=> b!1342902 m!1230099))

(declare-fun m!1230105 () Bool)

(assert (=> b!1342902 m!1230105))

(assert (=> b!1342902 m!1230101))

(declare-fun m!1230107 () Bool)

(assert (=> b!1342902 m!1230107))

(assert (=> b!1342902 m!1230107))

(declare-fun m!1230109 () Bool)

(assert (=> b!1342902 m!1230109))

(declare-fun m!1230111 () Bool)

(assert (=> b!1342902 m!1230111))

(declare-fun m!1230113 () Bool)

(assert (=> b!1342902 m!1230113))

(declare-fun m!1230115 () Bool)

(assert (=> b!1342902 m!1230115))

(assert (=> b!1342902 m!1230113))

(declare-fun m!1230117 () Bool)

(assert (=> mapNonEmpty!57607 m!1230117))

(declare-fun m!1230119 () Bool)

(assert (=> b!1342901 m!1230119))

(declare-fun m!1230121 () Bool)

(assert (=> b!1342905 m!1230121))

(declare-fun m!1230123 () Bool)

(assert (=> b!1342908 m!1230123))

(assert (=> b!1342908 m!1230123))

(declare-fun m!1230125 () Bool)

(assert (=> b!1342908 m!1230125))

(assert (=> b!1342904 m!1230113))

(assert (=> b!1342897 m!1230113))

(assert (=> b!1342897 m!1230113))

(declare-fun m!1230127 () Bool)

(assert (=> b!1342897 m!1230127))

(declare-fun m!1230129 () Bool)

(assert (=> start!113216 m!1230129))

(declare-fun m!1230131 () Bool)

(assert (=> start!113216 m!1230131))

(declare-fun m!1230133 () Bool)

(assert (=> start!113216 m!1230133))

(check-sat (not b!1342908) (not start!113216) (not b!1342905) (not b_lambda!24433) (not b_next!31267) (not b!1342902) (not b!1342901) tp_is_empty!37267 (not mapNonEmpty!57607) (not b!1342897) b_and!50425)
(check-sat b_and!50425 (not b_next!31267))
