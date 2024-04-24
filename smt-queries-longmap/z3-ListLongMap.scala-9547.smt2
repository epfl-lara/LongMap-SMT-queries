; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113368 () Bool)

(assert start!113368)

(declare-fun b_free!31195 () Bool)

(declare-fun b_next!31195 () Bool)

(assert (=> start!113368 (= b_free!31195 (not b_next!31195))))

(declare-fun tp!109390 () Bool)

(declare-fun b_and!50299 () Bool)

(assert (=> start!113368 (= tp!109390 b_and!50299)))

(declare-fun b!1342898 () Bool)

(declare-fun res!890547 () Bool)

(declare-fun e!764785 () Bool)

(assert (=> b!1342898 (=> (not res!890547) (not e!764785))))

(declare-datatypes ((array!91359 0))(
  ( (array!91360 (arr!44131 (Array (_ BitVec 32) (_ BitVec 64))) (size!44682 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91359)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91359 (_ BitVec 32)) Bool)

(assert (=> b!1342898 (= res!890547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342899 () Bool)

(declare-fun res!890552 () Bool)

(assert (=> b!1342899 (=> (not res!890552) (not e!764785))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342899 (= res!890552 (not (= (select (arr!44131 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342900 () Bool)

(declare-fun res!890550 () Bool)

(assert (=> b!1342900 (=> (not res!890550) (not e!764785))))

(declare-datatypes ((V!54697 0))(
  ( (V!54698 (val!18672 Int)) )
))
(declare-fun minValue!1245 () V!54697)

(declare-fun zeroValue!1245 () V!54697)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17699 0))(
  ( (ValueCellFull!17699 (v!21315 V!54697)) (EmptyCell!17699) )
))
(declare-datatypes ((array!91361 0))(
  ( (array!91362 (arr!44132 (Array (_ BitVec 32) ValueCell!17699)) (size!44683 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91361)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24098 0))(
  ( (tuple2!24099 (_1!12060 (_ BitVec 64)) (_2!12060 V!54697)) )
))
(declare-datatypes ((List!31251 0))(
  ( (Nil!31248) (Cons!31247 (h!32465 tuple2!24098) (t!45649 List!31251)) )
))
(declare-datatypes ((ListLongMap!21763 0))(
  ( (ListLongMap!21764 (toList!10897 List!31251)) )
))
(declare-fun contains!9085 (ListLongMap!21763 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5846 (array!91359 array!91361 (_ BitVec 32) (_ BitVec 32) V!54697 V!54697 (_ BitVec 32) Int) ListLongMap!21763)

(assert (=> b!1342900 (= res!890550 (contains!9085 (getCurrentListMap!5846 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342901 () Bool)

(declare-fun e!764783 () Bool)

(declare-fun tp_is_empty!37195 () Bool)

(assert (=> b!1342901 (= e!764783 tp_is_empty!37195)))

(declare-fun mapNonEmpty!57499 () Bool)

(declare-fun mapRes!57499 () Bool)

(declare-fun tp!109389 () Bool)

(assert (=> mapNonEmpty!57499 (= mapRes!57499 (and tp!109389 e!764783))))

(declare-fun mapKey!57499 () (_ BitVec 32))

(declare-fun mapRest!57499 () (Array (_ BitVec 32) ValueCell!17699))

(declare-fun mapValue!57499 () ValueCell!17699)

(assert (=> mapNonEmpty!57499 (= (arr!44132 _values!1303) (store mapRest!57499 mapKey!57499 mapValue!57499))))

(declare-fun res!890549 () Bool)

(assert (=> start!113368 (=> (not res!890549) (not e!764785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113368 (= res!890549 (validMask!0 mask!1977))))

(assert (=> start!113368 e!764785))

(assert (=> start!113368 tp_is_empty!37195))

(assert (=> start!113368 true))

(declare-fun array_inv!33537 (array!91359) Bool)

(assert (=> start!113368 (array_inv!33537 _keys!1571)))

(declare-fun e!764786 () Bool)

(declare-fun array_inv!33538 (array!91361) Bool)

(assert (=> start!113368 (and (array_inv!33538 _values!1303) e!764786)))

(assert (=> start!113368 tp!109390))

(declare-fun b!1342902 () Bool)

(declare-fun res!890551 () Bool)

(assert (=> b!1342902 (=> (not res!890551) (not e!764785))))

(assert (=> b!1342902 (= res!890551 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57499 () Bool)

(assert (=> mapIsEmpty!57499 mapRes!57499))

(declare-fun b!1342903 () Bool)

(declare-fun res!890554 () Bool)

(assert (=> b!1342903 (=> (not res!890554) (not e!764785))))

(declare-datatypes ((List!31252 0))(
  ( (Nil!31249) (Cons!31248 (h!32466 (_ BitVec 64)) (t!45650 List!31252)) )
))
(declare-fun arrayNoDuplicates!0 (array!91359 (_ BitVec 32) List!31252) Bool)

(assert (=> b!1342903 (= res!890554 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31249))))

(declare-fun b!1342904 () Bool)

(declare-fun e!764784 () Bool)

(assert (=> b!1342904 (= e!764784 tp_is_empty!37195)))

(declare-fun b!1342905 () Bool)

(declare-fun res!890555 () Bool)

(assert (=> b!1342905 (=> (not res!890555) (not e!764785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342905 (= res!890555 (validKeyInArray!0 (select (arr!44131 _keys!1571) from!1960)))))

(declare-fun b!1342906 () Bool)

(assert (=> b!1342906 (= e!764785 (not true))))

(declare-fun lt!594646 () ListLongMap!21763)

(assert (=> b!1342906 (contains!9085 lt!594646 k0!1142)))

(declare-datatypes ((Unit!43970 0))(
  ( (Unit!43971) )
))
(declare-fun lt!594647 () Unit!43970)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!341 ((_ BitVec 64) (_ BitVec 64) V!54697 ListLongMap!21763) Unit!43970)

(assert (=> b!1342906 (= lt!594647 (lemmaInListMapAfterAddingDiffThenInBefore!341 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594646))))

(declare-fun +!4815 (ListLongMap!21763 tuple2!24098) ListLongMap!21763)

(declare-fun getCurrentListMapNoExtraKeys!6464 (array!91359 array!91361 (_ BitVec 32) (_ BitVec 32) V!54697 V!54697 (_ BitVec 32) Int) ListLongMap!21763)

(declare-fun get!22289 (ValueCell!17699 V!54697) V!54697)

(declare-fun dynLambda!3769 (Int (_ BitVec 64)) V!54697)

(assert (=> b!1342906 (= lt!594646 (+!4815 (getCurrentListMapNoExtraKeys!6464 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24099 (select (arr!44131 _keys!1571) from!1960) (get!22289 (select (arr!44132 _values!1303) from!1960) (dynLambda!3769 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1342907 () Bool)

(assert (=> b!1342907 (= e!764786 (and e!764784 mapRes!57499))))

(declare-fun condMapEmpty!57499 () Bool)

(declare-fun mapDefault!57499 () ValueCell!17699)

(assert (=> b!1342907 (= condMapEmpty!57499 (= (arr!44132 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17699)) mapDefault!57499)))))

(declare-fun b!1342908 () Bool)

(declare-fun res!890548 () Bool)

(assert (=> b!1342908 (=> (not res!890548) (not e!764785))))

(assert (=> b!1342908 (= res!890548 (and (= (size!44683 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44682 _keys!1571) (size!44683 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342909 () Bool)

(declare-fun res!890553 () Bool)

(assert (=> b!1342909 (=> (not res!890553) (not e!764785))))

(assert (=> b!1342909 (= res!890553 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44682 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113368 res!890549) b!1342908))

(assert (= (and b!1342908 res!890548) b!1342898))

(assert (= (and b!1342898 res!890547) b!1342903))

(assert (= (and b!1342903 res!890554) b!1342909))

(assert (= (and b!1342909 res!890553) b!1342900))

(assert (= (and b!1342900 res!890550) b!1342899))

(assert (= (and b!1342899 res!890552) b!1342905))

(assert (= (and b!1342905 res!890555) b!1342902))

(assert (= (and b!1342902 res!890551) b!1342906))

(assert (= (and b!1342907 condMapEmpty!57499) mapIsEmpty!57499))

(assert (= (and b!1342907 (not condMapEmpty!57499)) mapNonEmpty!57499))

(get-info :version)

(assert (= (and mapNonEmpty!57499 ((_ is ValueCellFull!17699) mapValue!57499)) b!1342901))

(assert (= (and b!1342907 ((_ is ValueCellFull!17699) mapDefault!57499)) b!1342904))

(assert (= start!113368 b!1342907))

(declare-fun b_lambda!24365 () Bool)

(assert (=> (not b_lambda!24365) (not b!1342906)))

(declare-fun t!45648 () Bool)

(declare-fun tb!12201 () Bool)

(assert (=> (and start!113368 (= defaultEntry!1306 defaultEntry!1306) t!45648) tb!12201))

(declare-fun result!25501 () Bool)

(assert (=> tb!12201 (= result!25501 tp_is_empty!37195)))

(assert (=> b!1342906 t!45648))

(declare-fun b_and!50301 () Bool)

(assert (= b_and!50299 (and (=> t!45648 result!25501) b_and!50301)))

(declare-fun m!1230831 () Bool)

(assert (=> b!1342905 m!1230831))

(assert (=> b!1342905 m!1230831))

(declare-fun m!1230833 () Bool)

(assert (=> b!1342905 m!1230833))

(declare-fun m!1230835 () Bool)

(assert (=> b!1342900 m!1230835))

(assert (=> b!1342900 m!1230835))

(declare-fun m!1230837 () Bool)

(assert (=> b!1342900 m!1230837))

(declare-fun m!1230839 () Bool)

(assert (=> mapNonEmpty!57499 m!1230839))

(declare-fun m!1230841 () Bool)

(assert (=> b!1342898 m!1230841))

(declare-fun m!1230843 () Bool)

(assert (=> b!1342903 m!1230843))

(declare-fun m!1230845 () Bool)

(assert (=> start!113368 m!1230845))

(declare-fun m!1230847 () Bool)

(assert (=> start!113368 m!1230847))

(declare-fun m!1230849 () Bool)

(assert (=> start!113368 m!1230849))

(declare-fun m!1230851 () Bool)

(assert (=> b!1342906 m!1230851))

(declare-fun m!1230853 () Bool)

(assert (=> b!1342906 m!1230853))

(declare-fun m!1230855 () Bool)

(assert (=> b!1342906 m!1230855))

(declare-fun m!1230857 () Bool)

(assert (=> b!1342906 m!1230857))

(assert (=> b!1342906 m!1230851))

(declare-fun m!1230859 () Bool)

(assert (=> b!1342906 m!1230859))

(assert (=> b!1342906 m!1230853))

(assert (=> b!1342906 m!1230855))

(declare-fun m!1230861 () Bool)

(assert (=> b!1342906 m!1230861))

(declare-fun m!1230863 () Bool)

(assert (=> b!1342906 m!1230863))

(assert (=> b!1342906 m!1230831))

(assert (=> b!1342899 m!1230831))

(check-sat (not b!1342898) tp_is_empty!37195 (not b_lambda!24365) b_and!50301 (not b!1342903) (not start!113368) (not mapNonEmpty!57499) (not b!1342905) (not b!1342906) (not b!1342900) (not b_next!31195))
(check-sat b_and!50301 (not b_next!31195))
