; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113362 () Bool)

(assert start!113362)

(declare-fun b_free!31413 () Bool)

(declare-fun b_next!31413 () Bool)

(assert (=> start!113362 (= b_free!31413 (not b_next!31413))))

(declare-fun tp!110043 () Bool)

(declare-fun b_and!50679 () Bool)

(assert (=> start!113362 (= tp!110043 b_and!50679)))

(declare-fun b!1345490 () Bool)

(declare-fun res!892780 () Bool)

(declare-fun e!765626 () Bool)

(assert (=> b!1345490 (=> (not res!892780) (not e!765626))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91666 0))(
  ( (array!91667 (arr!44289 (Array (_ BitVec 32) (_ BitVec 64))) (size!44839 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91666)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345490 (= res!892780 (not (= k0!1142 (select (arr!44289 _keys!1571) from!1960))))))

(declare-fun b!1345491 () Bool)

(declare-fun e!765627 () Bool)

(declare-fun tp_is_empty!37413 () Bool)

(assert (=> b!1345491 (= e!765627 tp_is_empty!37413)))

(declare-fun mapNonEmpty!57826 () Bool)

(declare-fun mapRes!57826 () Bool)

(declare-fun tp!110044 () Bool)

(declare-fun e!765624 () Bool)

(assert (=> mapNonEmpty!57826 (= mapRes!57826 (and tp!110044 e!765624))))

(declare-fun mapKey!57826 () (_ BitVec 32))

(declare-datatypes ((V!54987 0))(
  ( (V!54988 (val!18781 Int)) )
))
(declare-datatypes ((ValueCell!17808 0))(
  ( (ValueCellFull!17808 (v!21429 V!54987)) (EmptyCell!17808) )
))
(declare-datatypes ((array!91668 0))(
  ( (array!91669 (arr!44290 (Array (_ BitVec 32) ValueCell!17808)) (size!44840 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91668)

(declare-fun mapRest!57826 () (Array (_ BitVec 32) ValueCell!17808))

(declare-fun mapValue!57826 () ValueCell!17808)

(assert (=> mapNonEmpty!57826 (= (arr!44290 _values!1303) (store mapRest!57826 mapKey!57826 mapValue!57826))))

(declare-fun b!1345493 () Bool)

(declare-fun res!892778 () Bool)

(declare-fun e!765625 () Bool)

(assert (=> b!1345493 (=> (not res!892778) (not e!765625))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345493 (= res!892778 (and (= (size!44840 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44839 _keys!1571) (size!44840 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345494 () Bool)

(declare-fun res!892784 () Bool)

(assert (=> b!1345494 (=> (not res!892784) (not e!765625))))

(assert (=> b!1345494 (= res!892784 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345495 () Bool)

(declare-fun res!892783 () Bool)

(assert (=> b!1345495 (=> (not res!892783) (not e!765625))))

(declare-fun minValue!1245 () V!54987)

(declare-fun zeroValue!1245 () V!54987)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24210 0))(
  ( (tuple2!24211 (_1!12116 (_ BitVec 64)) (_2!12116 V!54987)) )
))
(declare-datatypes ((List!31365 0))(
  ( (Nil!31362) (Cons!31361 (h!32570 tuple2!24210) (t!45935 List!31365)) )
))
(declare-datatypes ((ListLongMap!21867 0))(
  ( (ListLongMap!21868 (toList!10949 List!31365)) )
))
(declare-fun contains!9125 (ListLongMap!21867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5902 (array!91666 array!91668 (_ BitVec 32) (_ BitVec 32) V!54987 V!54987 (_ BitVec 32) Int) ListLongMap!21867)

(assert (=> b!1345495 (= res!892783 (contains!9125 (getCurrentListMap!5902 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57826 () Bool)

(assert (=> mapIsEmpty!57826 mapRes!57826))

(declare-fun b!1345496 () Bool)

(declare-fun res!892782 () Bool)

(assert (=> b!1345496 (=> (not res!892782) (not e!765625))))

(assert (=> b!1345496 (= res!892782 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44839 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345497 () Bool)

(declare-fun res!892777 () Bool)

(assert (=> b!1345497 (=> (not res!892777) (not e!765625))))

(declare-datatypes ((List!31366 0))(
  ( (Nil!31363) (Cons!31362 (h!32571 (_ BitVec 64)) (t!45936 List!31366)) )
))
(declare-fun arrayNoDuplicates!0 (array!91666 (_ BitVec 32) List!31366) Bool)

(assert (=> b!1345497 (= res!892777 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31363))))

(declare-fun b!1345498 () Bool)

(declare-fun res!892785 () Bool)

(assert (=> b!1345498 (=> (not res!892785) (not e!765625))))

(assert (=> b!1345498 (= res!892785 (not (= (select (arr!44289 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345499 () Bool)

(declare-fun res!892779 () Bool)

(assert (=> b!1345499 (=> (not res!892779) (not e!765625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91666 (_ BitVec 32)) Bool)

(assert (=> b!1345499 (= res!892779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345500 () Bool)

(assert (=> b!1345500 (= e!765624 tp_is_empty!37413)))

(declare-fun b!1345501 () Bool)

(declare-fun e!765629 () Bool)

(assert (=> b!1345501 (= e!765629 (and e!765627 mapRes!57826))))

(declare-fun condMapEmpty!57826 () Bool)

(declare-fun mapDefault!57826 () ValueCell!17808)

(assert (=> b!1345501 (= condMapEmpty!57826 (= (arr!44290 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17808)) mapDefault!57826)))))

(declare-fun b!1345502 () Bool)

(assert (=> b!1345502 (= e!765626 (not true))))

(declare-fun lt!595361 () ListLongMap!21867)

(assert (=> b!1345502 (contains!9125 lt!595361 k0!1142)))

(declare-fun lt!595362 () V!54987)

(declare-datatypes ((Unit!44131 0))(
  ( (Unit!44132) )
))
(declare-fun lt!595360 () Unit!44131)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!396 ((_ BitVec 64) (_ BitVec 64) V!54987 ListLongMap!21867) Unit!44131)

(assert (=> b!1345502 (= lt!595360 (lemmaInListMapAfterAddingDiffThenInBefore!396 k0!1142 (select (arr!44289 _keys!1571) from!1960) lt!595362 lt!595361))))

(declare-fun b!1345503 () Bool)

(assert (=> b!1345503 (= e!765625 e!765626)))

(declare-fun res!892776 () Bool)

(assert (=> b!1345503 (=> (not res!892776) (not e!765626))))

(declare-fun +!4830 (ListLongMap!21867 tuple2!24210) ListLongMap!21867)

(assert (=> b!1345503 (= res!892776 (contains!9125 (+!4830 lt!595361 (tuple2!24211 (select (arr!44289 _keys!1571) from!1960) lt!595362)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6472 (array!91666 array!91668 (_ BitVec 32) (_ BitVec 32) V!54987 V!54987 (_ BitVec 32) Int) ListLongMap!21867)

(assert (=> b!1345503 (= lt!595361 (getCurrentListMapNoExtraKeys!6472 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22373 (ValueCell!17808 V!54987) V!54987)

(declare-fun dynLambda!3769 (Int (_ BitVec 64)) V!54987)

(assert (=> b!1345503 (= lt!595362 (get!22373 (select (arr!44290 _values!1303) from!1960) (dynLambda!3769 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!892775 () Bool)

(assert (=> start!113362 (=> (not res!892775) (not e!765625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113362 (= res!892775 (validMask!0 mask!1977))))

(assert (=> start!113362 e!765625))

(assert (=> start!113362 tp_is_empty!37413))

(assert (=> start!113362 true))

(declare-fun array_inv!33375 (array!91666) Bool)

(assert (=> start!113362 (array_inv!33375 _keys!1571)))

(declare-fun array_inv!33376 (array!91668) Bool)

(assert (=> start!113362 (and (array_inv!33376 _values!1303) e!765629)))

(assert (=> start!113362 tp!110043))

(declare-fun b!1345492 () Bool)

(declare-fun res!892781 () Bool)

(assert (=> b!1345492 (=> (not res!892781) (not e!765625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345492 (= res!892781 (validKeyInArray!0 (select (arr!44289 _keys!1571) from!1960)))))

(assert (= (and start!113362 res!892775) b!1345493))

(assert (= (and b!1345493 res!892778) b!1345499))

(assert (= (and b!1345499 res!892779) b!1345497))

(assert (= (and b!1345497 res!892777) b!1345496))

(assert (= (and b!1345496 res!892782) b!1345495))

(assert (= (and b!1345495 res!892783) b!1345498))

(assert (= (and b!1345498 res!892785) b!1345492))

(assert (= (and b!1345492 res!892781) b!1345494))

(assert (= (and b!1345494 res!892784) b!1345503))

(assert (= (and b!1345503 res!892776) b!1345490))

(assert (= (and b!1345490 res!892780) b!1345502))

(assert (= (and b!1345501 condMapEmpty!57826) mapIsEmpty!57826))

(assert (= (and b!1345501 (not condMapEmpty!57826)) mapNonEmpty!57826))

(get-info :version)

(assert (= (and mapNonEmpty!57826 ((_ is ValueCellFull!17808) mapValue!57826)) b!1345500))

(assert (= (and b!1345501 ((_ is ValueCellFull!17808) mapDefault!57826)) b!1345491))

(assert (= start!113362 b!1345501))

(declare-fun b_lambda!24535 () Bool)

(assert (=> (not b_lambda!24535) (not b!1345503)))

(declare-fun t!45934 () Bool)

(declare-fun tb!12373 () Bool)

(assert (=> (and start!113362 (= defaultEntry!1306 defaultEntry!1306) t!45934) tb!12373))

(declare-fun result!25837 () Bool)

(assert (=> tb!12373 (= result!25837 tp_is_empty!37413)))

(assert (=> b!1345503 t!45934))

(declare-fun b_and!50681 () Bool)

(assert (= b_and!50679 (and (=> t!45934 result!25837) b_and!50681)))

(declare-fun m!1232875 () Bool)

(assert (=> start!113362 m!1232875))

(declare-fun m!1232877 () Bool)

(assert (=> start!113362 m!1232877))

(declare-fun m!1232879 () Bool)

(assert (=> start!113362 m!1232879))

(declare-fun m!1232881 () Bool)

(assert (=> b!1345499 m!1232881))

(declare-fun m!1232883 () Bool)

(assert (=> b!1345498 m!1232883))

(assert (=> b!1345490 m!1232883))

(declare-fun m!1232885 () Bool)

(assert (=> b!1345495 m!1232885))

(assert (=> b!1345495 m!1232885))

(declare-fun m!1232887 () Bool)

(assert (=> b!1345495 m!1232887))

(declare-fun m!1232889 () Bool)

(assert (=> b!1345503 m!1232889))

(declare-fun m!1232891 () Bool)

(assert (=> b!1345503 m!1232891))

(declare-fun m!1232893 () Bool)

(assert (=> b!1345503 m!1232893))

(declare-fun m!1232895 () Bool)

(assert (=> b!1345503 m!1232895))

(declare-fun m!1232897 () Bool)

(assert (=> b!1345503 m!1232897))

(assert (=> b!1345503 m!1232893))

(assert (=> b!1345503 m!1232895))

(assert (=> b!1345503 m!1232883))

(assert (=> b!1345503 m!1232889))

(declare-fun m!1232899 () Bool)

(assert (=> b!1345503 m!1232899))

(declare-fun m!1232901 () Bool)

(assert (=> mapNonEmpty!57826 m!1232901))

(assert (=> b!1345492 m!1232883))

(assert (=> b!1345492 m!1232883))

(declare-fun m!1232903 () Bool)

(assert (=> b!1345492 m!1232903))

(declare-fun m!1232905 () Bool)

(assert (=> b!1345502 m!1232905))

(assert (=> b!1345502 m!1232883))

(assert (=> b!1345502 m!1232883))

(declare-fun m!1232907 () Bool)

(assert (=> b!1345502 m!1232907))

(declare-fun m!1232909 () Bool)

(assert (=> b!1345497 m!1232909))

(check-sat (not start!113362) (not b!1345492) (not b!1345495) tp_is_empty!37413 (not b_lambda!24535) b_and!50681 (not mapNonEmpty!57826) (not b!1345502) (not b!1345503) (not b_next!31413) (not b!1345497) (not b!1345499))
(check-sat b_and!50681 (not b_next!31413))
