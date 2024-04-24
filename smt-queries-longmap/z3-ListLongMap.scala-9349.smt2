; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111754 () Bool)

(assert start!111754)

(declare-fun b_free!30187 () Bool)

(declare-fun b_next!30187 () Bool)

(assert (=> start!111754 (= b_free!30187 (not b_next!30187))))

(declare-fun tp!106037 () Bool)

(declare-fun b_and!48535 () Bool)

(assert (=> start!111754 (= tp!106037 b_and!48535)))

(declare-fun mapNonEmpty!55658 () Bool)

(declare-fun mapRes!55658 () Bool)

(declare-fun tp!106036 () Bool)

(declare-fun e!754083 () Bool)

(assert (=> mapNonEmpty!55658 (= mapRes!55658 (and tp!106036 e!754083))))

(declare-datatypes ((V!53113 0))(
  ( (V!53114 (val!18078 Int)) )
))
(declare-datatypes ((ValueCell!17105 0))(
  ( (ValueCellFull!17105 (v!20703 V!53113)) (EmptyCell!17105) )
))
(declare-datatypes ((array!89021 0))(
  ( (array!89022 (arr!42980 (Array (_ BitVec 32) ValueCell!17105)) (size!43531 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89021)

(declare-fun mapValue!55658 () ValueCell!17105)

(declare-fun mapRest!55658 () (Array (_ BitVec 32) ValueCell!17105))

(declare-fun mapKey!55658 () (_ BitVec 32))

(assert (=> mapNonEmpty!55658 (= (arr!42980 _values!1337) (store mapRest!55658 mapKey!55658 mapValue!55658))))

(declare-fun b!1321789 () Bool)

(declare-fun e!754084 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1321789 (= e!754084 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23312 0))(
  ( (tuple2!23313 (_1!11667 (_ BitVec 64)) (_2!11667 V!53113)) )
))
(declare-datatypes ((List!30468 0))(
  ( (Nil!30465) (Cons!30464 (h!31682 tuple2!23312) (t!44196 List!30468)) )
))
(declare-datatypes ((ListLongMap!20977 0))(
  ( (ListLongMap!20978 (toList!10504 List!30468)) )
))
(declare-fun lt!587446 () ListLongMap!20977)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8671 (ListLongMap!20977 (_ BitVec 64)) Bool)

(assert (=> b!1321789 (contains!8671 lt!587446 k0!1164)))

(declare-fun zeroValue!1279 () V!53113)

(declare-datatypes ((Unit!43463 0))(
  ( (Unit!43464) )
))
(declare-fun lt!587447 () Unit!43463)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!143 ((_ BitVec 64) (_ BitVec 64) V!53113 ListLongMap!20977) Unit!43463)

(assert (=> b!1321789 (= lt!587447 (lemmaInListMapAfterAddingDiffThenInBefore!143 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587446))))

(declare-fun lt!587444 () ListLongMap!20977)

(assert (=> b!1321789 (contains!8671 lt!587444 k0!1164)))

(declare-fun minValue!1279 () V!53113)

(declare-fun lt!587445 () Unit!43463)

(assert (=> b!1321789 (= lt!587445 (lemmaInListMapAfterAddingDiffThenInBefore!143 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587444))))

(declare-fun +!4588 (ListLongMap!20977 tuple2!23312) ListLongMap!20977)

(assert (=> b!1321789 (= lt!587444 (+!4588 lt!587446 (tuple2!23313 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!89023 0))(
  ( (array!89024 (arr!42981 (Array (_ BitVec 32) (_ BitVec 64))) (size!43532 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89023)

(declare-fun getCurrentListMapNoExtraKeys!6227 (array!89023 array!89021 (_ BitVec 32) (_ BitVec 32) V!53113 V!53113 (_ BitVec 32) Int) ListLongMap!20977)

(declare-fun get!21645 (ValueCell!17105 V!53113) V!53113)

(declare-fun dynLambda!3542 (Int (_ BitVec 64)) V!53113)

(assert (=> b!1321789 (= lt!587446 (+!4588 (getCurrentListMapNoExtraKeys!6227 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23313 (select (arr!42981 _keys!1609) from!2000) (get!21645 (select (arr!42980 _values!1337) from!2000) (dynLambda!3542 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!55658 () Bool)

(assert (=> mapIsEmpty!55658 mapRes!55658))

(declare-fun b!1321790 () Bool)

(declare-fun tp_is_empty!36007 () Bool)

(assert (=> b!1321790 (= e!754083 tp_is_empty!36007)))

(declare-fun res!876941 () Bool)

(assert (=> start!111754 (=> (not res!876941) (not e!754084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111754 (= res!876941 (validMask!0 mask!2019))))

(assert (=> start!111754 e!754084))

(declare-fun array_inv!32725 (array!89023) Bool)

(assert (=> start!111754 (array_inv!32725 _keys!1609)))

(assert (=> start!111754 true))

(assert (=> start!111754 tp_is_empty!36007))

(declare-fun e!754085 () Bool)

(declare-fun array_inv!32726 (array!89021) Bool)

(assert (=> start!111754 (and (array_inv!32726 _values!1337) e!754085)))

(assert (=> start!111754 tp!106037))

(declare-fun b!1321791 () Bool)

(declare-fun res!876943 () Bool)

(assert (=> b!1321791 (=> (not res!876943) (not e!754084))))

(assert (=> b!1321791 (= res!876943 (and (= (size!43531 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43532 _keys!1609) (size!43531 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321792 () Bool)

(declare-fun res!876940 () Bool)

(assert (=> b!1321792 (=> (not res!876940) (not e!754084))))

(assert (=> b!1321792 (= res!876940 (not (= (select (arr!42981 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321793 () Bool)

(declare-fun res!876944 () Bool)

(assert (=> b!1321793 (=> (not res!876944) (not e!754084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321793 (= res!876944 (validKeyInArray!0 (select (arr!42981 _keys!1609) from!2000)))))

(declare-fun b!1321794 () Bool)

(declare-fun res!876946 () Bool)

(assert (=> b!1321794 (=> (not res!876946) (not e!754084))))

(declare-datatypes ((List!30469 0))(
  ( (Nil!30466) (Cons!30465 (h!31683 (_ BitVec 64)) (t!44197 List!30469)) )
))
(declare-fun arrayNoDuplicates!0 (array!89023 (_ BitVec 32) List!30469) Bool)

(assert (=> b!1321794 (= res!876946 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30466))))

(declare-fun b!1321795 () Bool)

(declare-fun res!876942 () Bool)

(assert (=> b!1321795 (=> (not res!876942) (not e!754084))))

(assert (=> b!1321795 (= res!876942 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43532 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321796 () Bool)

(declare-fun e!754087 () Bool)

(assert (=> b!1321796 (= e!754087 tp_is_empty!36007)))

(declare-fun b!1321797 () Bool)

(declare-fun res!876939 () Bool)

(assert (=> b!1321797 (=> (not res!876939) (not e!754084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89023 (_ BitVec 32)) Bool)

(assert (=> b!1321797 (= res!876939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321798 () Bool)

(assert (=> b!1321798 (= e!754085 (and e!754087 mapRes!55658))))

(declare-fun condMapEmpty!55658 () Bool)

(declare-fun mapDefault!55658 () ValueCell!17105)

(assert (=> b!1321798 (= condMapEmpty!55658 (= (arr!42980 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17105)) mapDefault!55658)))))

(declare-fun b!1321799 () Bool)

(declare-fun res!876945 () Bool)

(assert (=> b!1321799 (=> (not res!876945) (not e!754084))))

(declare-fun getCurrentListMap!5500 (array!89023 array!89021 (_ BitVec 32) (_ BitVec 32) V!53113 V!53113 (_ BitVec 32) Int) ListLongMap!20977)

(assert (=> b!1321799 (= res!876945 (contains!8671 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111754 res!876941) b!1321791))

(assert (= (and b!1321791 res!876943) b!1321797))

(assert (= (and b!1321797 res!876939) b!1321794))

(assert (= (and b!1321794 res!876946) b!1321795))

(assert (= (and b!1321795 res!876942) b!1321799))

(assert (= (and b!1321799 res!876945) b!1321792))

(assert (= (and b!1321792 res!876940) b!1321793))

(assert (= (and b!1321793 res!876944) b!1321789))

(assert (= (and b!1321798 condMapEmpty!55658) mapIsEmpty!55658))

(assert (= (and b!1321798 (not condMapEmpty!55658)) mapNonEmpty!55658))

(get-info :version)

(assert (= (and mapNonEmpty!55658 ((_ is ValueCellFull!17105) mapValue!55658)) b!1321790))

(assert (= (and b!1321798 ((_ is ValueCellFull!17105) mapDefault!55658)) b!1321796))

(assert (= start!111754 b!1321798))

(declare-fun b_lambda!23507 () Bool)

(assert (=> (not b_lambda!23507) (not b!1321789)))

(declare-fun t!44195 () Bool)

(declare-fun tb!11531 () Bool)

(assert (=> (and start!111754 (= defaultEntry!1340 defaultEntry!1340) t!44195) tb!11531))

(declare-fun result!24125 () Bool)

(assert (=> tb!11531 (= result!24125 tp_is_empty!36007)))

(assert (=> b!1321789 t!44195))

(declare-fun b_and!48537 () Bool)

(assert (= b_and!48535 (and (=> t!44195 result!24125) b_and!48537)))

(declare-fun m!1209809 () Bool)

(assert (=> start!111754 m!1209809))

(declare-fun m!1209811 () Bool)

(assert (=> start!111754 m!1209811))

(declare-fun m!1209813 () Bool)

(assert (=> start!111754 m!1209813))

(declare-fun m!1209815 () Bool)

(assert (=> b!1321797 m!1209815))

(declare-fun m!1209817 () Bool)

(assert (=> b!1321789 m!1209817))

(declare-fun m!1209819 () Bool)

(assert (=> b!1321789 m!1209819))

(declare-fun m!1209821 () Bool)

(assert (=> b!1321789 m!1209821))

(assert (=> b!1321789 m!1209821))

(assert (=> b!1321789 m!1209819))

(declare-fun m!1209823 () Bool)

(assert (=> b!1321789 m!1209823))

(declare-fun m!1209825 () Bool)

(assert (=> b!1321789 m!1209825))

(declare-fun m!1209827 () Bool)

(assert (=> b!1321789 m!1209827))

(declare-fun m!1209829 () Bool)

(assert (=> b!1321789 m!1209829))

(declare-fun m!1209831 () Bool)

(assert (=> b!1321789 m!1209831))

(assert (=> b!1321789 m!1209827))

(declare-fun m!1209833 () Bool)

(assert (=> b!1321789 m!1209833))

(declare-fun m!1209835 () Bool)

(assert (=> b!1321789 m!1209835))

(declare-fun m!1209837 () Bool)

(assert (=> b!1321789 m!1209837))

(declare-fun m!1209839 () Bool)

(assert (=> b!1321794 m!1209839))

(declare-fun m!1209841 () Bool)

(assert (=> b!1321799 m!1209841))

(assert (=> b!1321799 m!1209841))

(declare-fun m!1209843 () Bool)

(assert (=> b!1321799 m!1209843))

(assert (=> b!1321792 m!1209825))

(declare-fun m!1209845 () Bool)

(assert (=> mapNonEmpty!55658 m!1209845))

(assert (=> b!1321793 m!1209825))

(assert (=> b!1321793 m!1209825))

(declare-fun m!1209847 () Bool)

(assert (=> b!1321793 m!1209847))

(check-sat (not b!1321799) (not b_next!30187) (not b!1321789) (not b!1321797) b_and!48537 (not b!1321794) (not start!111754) (not b!1321793) tp_is_empty!36007 (not b_lambda!23507) (not mapNonEmpty!55658))
(check-sat b_and!48537 (not b_next!30187))
