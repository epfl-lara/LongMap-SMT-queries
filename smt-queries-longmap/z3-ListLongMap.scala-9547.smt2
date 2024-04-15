; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113144 () Bool)

(assert start!113144)

(declare-fun b_free!31195 () Bool)

(declare-fun b_next!31195 () Bool)

(assert (=> start!113144 (= b_free!31195 (not b_next!31195))))

(declare-fun tp!109390 () Bool)

(declare-fun b_and!50279 () Bool)

(assert (=> start!113144 (= tp!109390 b_and!50279)))

(declare-fun b!1341529 () Bool)

(declare-fun res!890008 () Bool)

(declare-fun e!763909 () Bool)

(assert (=> b!1341529 (=> (not res!890008) (not e!763909))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341529 (= res!890008 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57499 () Bool)

(declare-fun mapRes!57499 () Bool)

(assert (=> mapIsEmpty!57499 mapRes!57499))

(declare-fun res!890001 () Bool)

(assert (=> start!113144 (=> (not res!890001) (not e!763909))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113144 (= res!890001 (validMask!0 mask!1977))))

(assert (=> start!113144 e!763909))

(declare-fun tp_is_empty!37195 () Bool)

(assert (=> start!113144 tp_is_empty!37195))

(assert (=> start!113144 true))

(declare-datatypes ((array!91183 0))(
  ( (array!91184 (arr!44048 (Array (_ BitVec 32) (_ BitVec 64))) (size!44600 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91183)

(declare-fun array_inv!33397 (array!91183) Bool)

(assert (=> start!113144 (array_inv!33397 _keys!1571)))

(declare-datatypes ((V!54697 0))(
  ( (V!54698 (val!18672 Int)) )
))
(declare-datatypes ((ValueCell!17699 0))(
  ( (ValueCellFull!17699 (v!21319 V!54697)) (EmptyCell!17699) )
))
(declare-datatypes ((array!91185 0))(
  ( (array!91186 (arr!44049 (Array (_ BitVec 32) ValueCell!17699)) (size!44601 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91185)

(declare-fun e!763907 () Bool)

(declare-fun array_inv!33398 (array!91185) Bool)

(assert (=> start!113144 (and (array_inv!33398 _values!1303) e!763907)))

(assert (=> start!113144 tp!109390))

(declare-fun b!1341530 () Bool)

(declare-fun res!890007 () Bool)

(assert (=> b!1341530 (=> (not res!890007) (not e!763909))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341530 (= res!890007 (validKeyInArray!0 (select (arr!44048 _keys!1571) from!1960)))))

(declare-fun b!1341531 () Bool)

(declare-fun res!890002 () Bool)

(assert (=> b!1341531 (=> (not res!890002) (not e!763909))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1341531 (= res!890002 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44600 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57499 () Bool)

(declare-fun tp!109391 () Bool)

(declare-fun e!763906 () Bool)

(assert (=> mapNonEmpty!57499 (= mapRes!57499 (and tp!109391 e!763906))))

(declare-fun mapValue!57499 () ValueCell!17699)

(declare-fun mapRest!57499 () (Array (_ BitVec 32) ValueCell!17699))

(declare-fun mapKey!57499 () (_ BitVec 32))

(assert (=> mapNonEmpty!57499 (= (arr!44049 _values!1303) (store mapRest!57499 mapKey!57499 mapValue!57499))))

(declare-fun b!1341532 () Bool)

(declare-fun res!890003 () Bool)

(assert (=> b!1341532 (=> (not res!890003) (not e!763909))))

(assert (=> b!1341532 (= res!890003 (not (= (select (arr!44048 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341533 () Bool)

(assert (=> b!1341533 (= e!763906 tp_is_empty!37195)))

(declare-fun b!1341534 () Bool)

(declare-fun res!890006 () Bool)

(assert (=> b!1341534 (=> (not res!890006) (not e!763909))))

(declare-fun minValue!1245 () V!54697)

(declare-fun zeroValue!1245 () V!54697)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24096 0))(
  ( (tuple2!24097 (_1!12059 (_ BitVec 64)) (_2!12059 V!54697)) )
))
(declare-datatypes ((List!31246 0))(
  ( (Nil!31243) (Cons!31242 (h!32451 tuple2!24096) (t!45644 List!31246)) )
))
(declare-datatypes ((ListLongMap!21753 0))(
  ( (ListLongMap!21754 (toList!10892 List!31246)) )
))
(declare-fun contains!8997 (ListLongMap!21753 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5745 (array!91183 array!91185 (_ BitVec 32) (_ BitVec 32) V!54697 V!54697 (_ BitVec 32) Int) ListLongMap!21753)

(assert (=> b!1341534 (= res!890006 (contains!8997 (getCurrentListMap!5745 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341535 () Bool)

(declare-fun e!763910 () Bool)

(assert (=> b!1341535 (= e!763907 (and e!763910 mapRes!57499))))

(declare-fun condMapEmpty!57499 () Bool)

(declare-fun mapDefault!57499 () ValueCell!17699)

(assert (=> b!1341535 (= condMapEmpty!57499 (= (arr!44049 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17699)) mapDefault!57499)))))

(declare-fun b!1341536 () Bool)

(declare-fun res!890000 () Bool)

(assert (=> b!1341536 (=> (not res!890000) (not e!763909))))

(declare-datatypes ((List!31247 0))(
  ( (Nil!31244) (Cons!31243 (h!32452 (_ BitVec 64)) (t!45645 List!31247)) )
))
(declare-fun arrayNoDuplicates!0 (array!91183 (_ BitVec 32) List!31247) Bool)

(assert (=> b!1341536 (= res!890000 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31244))))

(declare-fun b!1341537 () Bool)

(assert (=> b!1341537 (= e!763909 (not true))))

(declare-fun lt!593984 () ListLongMap!21753)

(assert (=> b!1341537 (contains!8997 lt!593984 k0!1142)))

(declare-datatypes ((Unit!43836 0))(
  ( (Unit!43837) )
))
(declare-fun lt!593985 () Unit!43836)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!336 ((_ BitVec 64) (_ BitVec 64) V!54697 ListLongMap!21753) Unit!43836)

(assert (=> b!1341537 (= lt!593985 (lemmaInListMapAfterAddingDiffThenInBefore!336 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593984))))

(declare-fun +!4797 (ListLongMap!21753 tuple2!24096) ListLongMap!21753)

(declare-fun getCurrentListMapNoExtraKeys!6440 (array!91183 array!91185 (_ BitVec 32) (_ BitVec 32) V!54697 V!54697 (_ BitVec 32) Int) ListLongMap!21753)

(declare-fun get!22235 (ValueCell!17699 V!54697) V!54697)

(declare-fun dynLambda!3727 (Int (_ BitVec 64)) V!54697)

(assert (=> b!1341537 (= lt!593984 (+!4797 (getCurrentListMapNoExtraKeys!6440 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24097 (select (arr!44048 _keys!1571) from!1960) (get!22235 (select (arr!44049 _values!1303) from!1960) (dynLambda!3727 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341538 () Bool)

(assert (=> b!1341538 (= e!763910 tp_is_empty!37195)))

(declare-fun b!1341539 () Bool)

(declare-fun res!890005 () Bool)

(assert (=> b!1341539 (=> (not res!890005) (not e!763909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91183 (_ BitVec 32)) Bool)

(assert (=> b!1341539 (= res!890005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341540 () Bool)

(declare-fun res!890004 () Bool)

(assert (=> b!1341540 (=> (not res!890004) (not e!763909))))

(assert (=> b!1341540 (= res!890004 (and (= (size!44601 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44600 _keys!1571) (size!44601 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113144 res!890001) b!1341540))

(assert (= (and b!1341540 res!890004) b!1341539))

(assert (= (and b!1341539 res!890005) b!1341536))

(assert (= (and b!1341536 res!890000) b!1341531))

(assert (= (and b!1341531 res!890002) b!1341534))

(assert (= (and b!1341534 res!890006) b!1341532))

(assert (= (and b!1341532 res!890003) b!1341530))

(assert (= (and b!1341530 res!890007) b!1341529))

(assert (= (and b!1341529 res!890008) b!1341537))

(assert (= (and b!1341535 condMapEmpty!57499) mapIsEmpty!57499))

(assert (= (and b!1341535 (not condMapEmpty!57499)) mapNonEmpty!57499))

(get-info :version)

(assert (= (and mapNonEmpty!57499 ((_ is ValueCellFull!17699) mapValue!57499)) b!1341533))

(assert (= (and b!1341535 ((_ is ValueCellFull!17699) mapDefault!57499)) b!1341538))

(assert (= start!113144 b!1341535))

(declare-fun b_lambda!24361 () Bool)

(assert (=> (not b_lambda!24361) (not b!1341537)))

(declare-fun t!45643 () Bool)

(declare-fun tb!12201 () Bool)

(assert (=> (and start!113144 (= defaultEntry!1306 defaultEntry!1306) t!45643) tb!12201))

(declare-fun result!25501 () Bool)

(assert (=> tb!12201 (= result!25501 tp_is_empty!37195)))

(assert (=> b!1341537 t!45643))

(declare-fun b_and!50281 () Bool)

(assert (= b_and!50279 (and (=> t!45643 result!25501) b_and!50281)))

(declare-fun m!1228717 () Bool)

(assert (=> b!1341532 m!1228717))

(declare-fun m!1228719 () Bool)

(assert (=> b!1341537 m!1228719))

(declare-fun m!1228721 () Bool)

(assert (=> b!1341537 m!1228721))

(declare-fun m!1228723 () Bool)

(assert (=> b!1341537 m!1228723))

(declare-fun m!1228725 () Bool)

(assert (=> b!1341537 m!1228725))

(assert (=> b!1341537 m!1228719))

(declare-fun m!1228727 () Bool)

(assert (=> b!1341537 m!1228727))

(assert (=> b!1341537 m!1228721))

(declare-fun m!1228729 () Bool)

(assert (=> b!1341537 m!1228729))

(assert (=> b!1341537 m!1228723))

(declare-fun m!1228731 () Bool)

(assert (=> b!1341537 m!1228731))

(assert (=> b!1341537 m!1228717))

(declare-fun m!1228733 () Bool)

(assert (=> start!113144 m!1228733))

(declare-fun m!1228735 () Bool)

(assert (=> start!113144 m!1228735))

(declare-fun m!1228737 () Bool)

(assert (=> start!113144 m!1228737))

(declare-fun m!1228739 () Bool)

(assert (=> b!1341534 m!1228739))

(assert (=> b!1341534 m!1228739))

(declare-fun m!1228741 () Bool)

(assert (=> b!1341534 m!1228741))

(declare-fun m!1228743 () Bool)

(assert (=> mapNonEmpty!57499 m!1228743))

(assert (=> b!1341530 m!1228717))

(assert (=> b!1341530 m!1228717))

(declare-fun m!1228745 () Bool)

(assert (=> b!1341530 m!1228745))

(declare-fun m!1228747 () Bool)

(assert (=> b!1341539 m!1228747))

(declare-fun m!1228749 () Bool)

(assert (=> b!1341536 m!1228749))

(check-sat (not b!1341536) (not b!1341530) (not b!1341539) b_and!50281 (not b!1341534) (not mapNonEmpty!57499) (not start!113144) (not b!1341537) tp_is_empty!37195 (not b_next!31195) (not b_lambda!24361))
(check-sat b_and!50281 (not b_next!31195))
