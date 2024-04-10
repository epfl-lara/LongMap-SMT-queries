; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113212 () Bool)

(assert start!113212)

(declare-fun b_free!31263 () Bool)

(declare-fun b_next!31263 () Bool)

(assert (=> start!113212 (= b_free!31263 (not b_next!31263))))

(declare-fun tp!109594 () Bool)

(declare-fun b_and!50433 () Bool)

(assert (=> start!113212 (= tp!109594 b_and!50433)))

(declare-fun b!1342891 () Bool)

(declare-fun res!890949 () Bool)

(declare-fun e!764450 () Bool)

(assert (=> b!1342891 (=> (not res!890949) (not e!764450))))

(declare-datatypes ((array!91374 0))(
  ( (array!91375 (arr!44143 (Array (_ BitVec 32) (_ BitVec 64))) (size!44693 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91374)

(declare-datatypes ((List!31255 0))(
  ( (Nil!31252) (Cons!31251 (h!32460 (_ BitVec 64)) (t!45729 List!31255)) )
))
(declare-fun arrayNoDuplicates!0 (array!91374 (_ BitVec 32) List!31255) Bool)

(assert (=> b!1342891 (= res!890949 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31252))))

(declare-fun b!1342892 () Bool)

(declare-fun res!890954 () Bool)

(assert (=> b!1342892 (=> (not res!890954) (not e!764450))))

(declare-datatypes ((V!54787 0))(
  ( (V!54788 (val!18706 Int)) )
))
(declare-fun minValue!1245 () V!54787)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54787)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17733 0))(
  ( (ValueCellFull!17733 (v!21354 V!54787)) (EmptyCell!17733) )
))
(declare-datatypes ((array!91376 0))(
  ( (array!91377 (arr!44144 (Array (_ BitVec 32) ValueCell!17733)) (size!44694 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91376)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24098 0))(
  ( (tuple2!24099 (_1!12060 (_ BitVec 64)) (_2!12060 V!54787)) )
))
(declare-datatypes ((List!31256 0))(
  ( (Nil!31253) (Cons!31252 (h!32461 tuple2!24098) (t!45730 List!31256)) )
))
(declare-datatypes ((ListLongMap!21755 0))(
  ( (ListLongMap!21756 (toList!10893 List!31256)) )
))
(declare-fun contains!9069 (ListLongMap!21755 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5856 (array!91374 array!91376 (_ BitVec 32) (_ BitVec 32) V!54787 V!54787 (_ BitVec 32) Int) ListLongMap!21755)

(assert (=> b!1342892 (= res!890954 (contains!9069 (getCurrentListMap!5856 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!890952 () Bool)

(assert (=> start!113212 (=> (not res!890952) (not e!764450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113212 (= res!890952 (validMask!0 mask!1977))))

(assert (=> start!113212 e!764450))

(declare-fun tp_is_empty!37263 () Bool)

(assert (=> start!113212 tp_is_empty!37263))

(assert (=> start!113212 true))

(declare-fun array_inv!33275 (array!91374) Bool)

(assert (=> start!113212 (array_inv!33275 _keys!1571)))

(declare-fun e!764449 () Bool)

(declare-fun array_inv!33276 (array!91376) Bool)

(assert (=> start!113212 (and (array_inv!33276 _values!1303) e!764449)))

(assert (=> start!113212 tp!109594))

(declare-fun mapNonEmpty!57601 () Bool)

(declare-fun mapRes!57601 () Bool)

(declare-fun tp!109593 () Bool)

(declare-fun e!764453 () Bool)

(assert (=> mapNonEmpty!57601 (= mapRes!57601 (and tp!109593 e!764453))))

(declare-fun mapRest!57601 () (Array (_ BitVec 32) ValueCell!17733))

(declare-fun mapKey!57601 () (_ BitVec 32))

(declare-fun mapValue!57601 () ValueCell!17733)

(assert (=> mapNonEmpty!57601 (= (arr!44144 _values!1303) (store mapRest!57601 mapKey!57601 mapValue!57601))))

(declare-fun b!1342893 () Bool)

(declare-fun res!890951 () Bool)

(assert (=> b!1342893 (=> (not res!890951) (not e!764450))))

(assert (=> b!1342893 (= res!890951 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342894 () Bool)

(assert (=> b!1342894 (= e!764453 tp_is_empty!37263)))

(declare-fun b!1342895 () Bool)

(declare-fun res!890955 () Bool)

(assert (=> b!1342895 (=> (not res!890955) (not e!764450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91374 (_ BitVec 32)) Bool)

(assert (=> b!1342895 (= res!890955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342896 () Bool)

(declare-fun res!890948 () Bool)

(assert (=> b!1342896 (=> (not res!890948) (not e!764450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342896 (= res!890948 (validKeyInArray!0 (select (arr!44143 _keys!1571) from!1960)))))

(declare-fun b!1342897 () Bool)

(declare-fun res!890950 () Bool)

(assert (=> b!1342897 (=> (not res!890950) (not e!764450))))

(assert (=> b!1342897 (= res!890950 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44693 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342898 () Bool)

(declare-fun e!764452 () Bool)

(assert (=> b!1342898 (= e!764452 tp_is_empty!37263)))

(declare-fun mapIsEmpty!57601 () Bool)

(assert (=> mapIsEmpty!57601 mapRes!57601))

(declare-fun b!1342899 () Bool)

(declare-fun res!890947 () Bool)

(assert (=> b!1342899 (=> (not res!890947) (not e!764450))))

(assert (=> b!1342899 (= res!890947 (not (= (select (arr!44143 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342900 () Bool)

(assert (=> b!1342900 (= e!764449 (and e!764452 mapRes!57601))))

(declare-fun condMapEmpty!57601 () Bool)

(declare-fun mapDefault!57601 () ValueCell!17733)

(assert (=> b!1342900 (= condMapEmpty!57601 (= (arr!44144 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17733)) mapDefault!57601)))))

(declare-fun b!1342901 () Bool)

(declare-fun res!890953 () Bool)

(assert (=> b!1342901 (=> (not res!890953) (not e!764450))))

(assert (=> b!1342901 (= res!890953 (and (= (size!44694 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44693 _keys!1571) (size!44694 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342902 () Bool)

(assert (=> b!1342902 (= e!764450 (not true))))

(declare-fun lt!594669 () ListLongMap!21755)

(declare-fun +!4801 (ListLongMap!21755 tuple2!24098) ListLongMap!21755)

(assert (=> b!1342902 (contains!9069 (+!4801 lt!594669 (tuple2!24099 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44079 0))(
  ( (Unit!44080) )
))
(declare-fun lt!594666 () Unit!44079)

(declare-fun addStillContains!1194 (ListLongMap!21755 (_ BitVec 64) V!54787 (_ BitVec 64)) Unit!44079)

(assert (=> b!1342902 (= lt!594666 (addStillContains!1194 lt!594669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1342902 (contains!9069 lt!594669 k0!1142)))

(declare-fun lt!594665 () V!54787)

(declare-fun lt!594664 () Unit!44079)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!370 ((_ BitVec 64) (_ BitVec 64) V!54787 ListLongMap!21755) Unit!44079)

(assert (=> b!1342902 (= lt!594664 (lemmaInListMapAfterAddingDiffThenInBefore!370 k0!1142 (select (arr!44143 _keys!1571) from!1960) lt!594665 lt!594669))))

(declare-fun lt!594667 () ListLongMap!21755)

(assert (=> b!1342902 (contains!9069 lt!594667 k0!1142)))

(declare-fun lt!594668 () Unit!44079)

(assert (=> b!1342902 (= lt!594668 (lemmaInListMapAfterAddingDiffThenInBefore!370 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594667))))

(assert (=> b!1342902 (= lt!594667 (+!4801 lt!594669 (tuple2!24099 (select (arr!44143 _keys!1571) from!1960) lt!594665)))))

(declare-fun get!22294 (ValueCell!17733 V!54787) V!54787)

(declare-fun dynLambda!3740 (Int (_ BitVec 64)) V!54787)

(assert (=> b!1342902 (= lt!594665 (get!22294 (select (arr!44144 _values!1303) from!1960) (dynLambda!3740 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6443 (array!91374 array!91376 (_ BitVec 32) (_ BitVec 32) V!54787 V!54787 (_ BitVec 32) Int) ListLongMap!21755)

(assert (=> b!1342902 (= lt!594669 (getCurrentListMapNoExtraKeys!6443 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(assert (= (and start!113212 res!890952) b!1342901))

(assert (= (and b!1342901 res!890953) b!1342895))

(assert (= (and b!1342895 res!890955) b!1342891))

(assert (= (and b!1342891 res!890949) b!1342897))

(assert (= (and b!1342897 res!890950) b!1342892))

(assert (= (and b!1342892 res!890954) b!1342899))

(assert (= (and b!1342899 res!890947) b!1342896))

(assert (= (and b!1342896 res!890948) b!1342893))

(assert (= (and b!1342893 res!890951) b!1342902))

(assert (= (and b!1342900 condMapEmpty!57601) mapIsEmpty!57601))

(assert (= (and b!1342900 (not condMapEmpty!57601)) mapNonEmpty!57601))

(get-info :version)

(assert (= (and mapNonEmpty!57601 ((_ is ValueCellFull!17733) mapValue!57601)) b!1342894))

(assert (= (and b!1342900 ((_ is ValueCellFull!17733) mapDefault!57601)) b!1342898))

(assert (= start!113212 b!1342900))

(declare-fun b_lambda!24439 () Bool)

(assert (=> (not b_lambda!24439) (not b!1342902)))

(declare-fun t!45728 () Bool)

(declare-fun tb!12277 () Bool)

(assert (=> (and start!113212 (= defaultEntry!1306 defaultEntry!1306) t!45728) tb!12277))

(declare-fun result!25645 () Bool)

(assert (=> tb!12277 (= result!25645 tp_is_empty!37263)))

(assert (=> b!1342902 t!45728))

(declare-fun b_and!50435 () Bool)

(assert (= b_and!50433 (and (=> t!45728 result!25645) b_and!50435)))

(declare-fun m!1230519 () Bool)

(assert (=> b!1342899 m!1230519))

(declare-fun m!1230521 () Bool)

(assert (=> mapNonEmpty!57601 m!1230521))

(assert (=> b!1342896 m!1230519))

(assert (=> b!1342896 m!1230519))

(declare-fun m!1230523 () Bool)

(assert (=> b!1342896 m!1230523))

(declare-fun m!1230525 () Bool)

(assert (=> b!1342892 m!1230525))

(assert (=> b!1342892 m!1230525))

(declare-fun m!1230527 () Bool)

(assert (=> b!1342892 m!1230527))

(declare-fun m!1230529 () Bool)

(assert (=> start!113212 m!1230529))

(declare-fun m!1230531 () Bool)

(assert (=> start!113212 m!1230531))

(declare-fun m!1230533 () Bool)

(assert (=> start!113212 m!1230533))

(declare-fun m!1230535 () Bool)

(assert (=> b!1342891 m!1230535))

(declare-fun m!1230537 () Bool)

(assert (=> b!1342902 m!1230537))

(declare-fun m!1230539 () Bool)

(assert (=> b!1342902 m!1230539))

(declare-fun m!1230541 () Bool)

(assert (=> b!1342902 m!1230541))

(declare-fun m!1230543 () Bool)

(assert (=> b!1342902 m!1230543))

(declare-fun m!1230545 () Bool)

(assert (=> b!1342902 m!1230545))

(declare-fun m!1230547 () Bool)

(assert (=> b!1342902 m!1230547))

(declare-fun m!1230549 () Bool)

(assert (=> b!1342902 m!1230549))

(declare-fun m!1230551 () Bool)

(assert (=> b!1342902 m!1230551))

(assert (=> b!1342902 m!1230545))

(declare-fun m!1230553 () Bool)

(assert (=> b!1342902 m!1230553))

(assert (=> b!1342902 m!1230519))

(declare-fun m!1230555 () Bool)

(assert (=> b!1342902 m!1230555))

(declare-fun m!1230557 () Bool)

(assert (=> b!1342902 m!1230557))

(assert (=> b!1342902 m!1230547))

(declare-fun m!1230559 () Bool)

(assert (=> b!1342902 m!1230559))

(assert (=> b!1342902 m!1230519))

(assert (=> b!1342902 m!1230537))

(declare-fun m!1230561 () Bool)

(assert (=> b!1342895 m!1230561))

(check-sat (not b_lambda!24439) (not mapNonEmpty!57601) (not start!113212) (not b!1342896) (not b!1342895) b_and!50435 (not b!1342891) tp_is_empty!37263 (not b!1342902) (not b!1342892) (not b_next!31263))
(check-sat b_and!50435 (not b_next!31263))
