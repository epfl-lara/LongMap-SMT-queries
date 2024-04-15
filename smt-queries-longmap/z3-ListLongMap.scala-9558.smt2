; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113210 () Bool)

(assert start!113210)

(declare-fun b_free!31261 () Bool)

(declare-fun b_next!31261 () Bool)

(assert (=> start!113210 (= b_free!31261 (not b_next!31261))))

(declare-fun tp!109588 () Bool)

(declare-fun b_and!50411 () Bool)

(assert (=> start!113210 (= tp!109588 b_and!50411)))

(declare-fun b!1342783 () Bool)

(declare-fun res!890892 () Bool)

(declare-fun e!764401 () Bool)

(assert (=> b!1342783 (=> (not res!890892) (not e!764401))))

(declare-datatypes ((array!91313 0))(
  ( (array!91314 (arr!44113 (Array (_ BitVec 32) (_ BitVec 64))) (size!44665 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91313)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342783 (= res!890892 (validKeyInArray!0 (select (arr!44113 _keys!1571) from!1960)))))

(declare-fun b!1342784 () Bool)

(declare-fun e!764403 () Bool)

(declare-fun tp_is_empty!37261 () Bool)

(assert (=> b!1342784 (= e!764403 tp_is_empty!37261)))

(declare-fun b!1342785 () Bool)

(declare-fun res!890891 () Bool)

(assert (=> b!1342785 (=> (not res!890891) (not e!764401))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91313 (_ BitVec 32)) Bool)

(assert (=> b!1342785 (= res!890891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57598 () Bool)

(declare-fun mapRes!57598 () Bool)

(assert (=> mapIsEmpty!57598 mapRes!57598))

(declare-fun b!1342786 () Bool)

(assert (=> b!1342786 (= e!764401 (not true))))

(declare-datatypes ((V!54785 0))(
  ( (V!54786 (val!18705 Int)) )
))
(declare-datatypes ((tuple2!24156 0))(
  ( (tuple2!24157 (_1!12089 (_ BitVec 64)) (_2!12089 V!54785)) )
))
(declare-datatypes ((List!31300 0))(
  ( (Nil!31297) (Cons!31296 (h!32505 tuple2!24156) (t!45764 List!31300)) )
))
(declare-datatypes ((ListLongMap!21813 0))(
  ( (ListLongMap!21814 (toList!10922 List!31300)) )
))
(declare-fun lt!594465 () ListLongMap!21813)

(declare-fun zeroValue!1245 () V!54785)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9027 (ListLongMap!21813 (_ BitVec 64)) Bool)

(declare-fun +!4824 (ListLongMap!21813 tuple2!24156) ListLongMap!21813)

(assert (=> b!1342786 (contains!9027 (+!4824 lt!594465 (tuple2!24157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!43890 0))(
  ( (Unit!43891) )
))
(declare-fun lt!594464 () Unit!43890)

(declare-fun addStillContains!1188 (ListLongMap!21813 (_ BitVec 64) V!54785 (_ BitVec 64)) Unit!43890)

(assert (=> b!1342786 (= lt!594464 (addStillContains!1188 lt!594465 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1342786 (contains!9027 lt!594465 k0!1142)))

(declare-fun lt!594460 () Unit!43890)

(declare-fun lt!594463 () V!54785)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!363 ((_ BitVec 64) (_ BitVec 64) V!54785 ListLongMap!21813) Unit!43890)

(assert (=> b!1342786 (= lt!594460 (lemmaInListMapAfterAddingDiffThenInBefore!363 k0!1142 (select (arr!44113 _keys!1571) from!1960) lt!594463 lt!594465))))

(declare-fun lt!594461 () ListLongMap!21813)

(assert (=> b!1342786 (contains!9027 lt!594461 k0!1142)))

(declare-fun lt!594462 () Unit!43890)

(assert (=> b!1342786 (= lt!594462 (lemmaInListMapAfterAddingDiffThenInBefore!363 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594461))))

(assert (=> b!1342786 (= lt!594461 (+!4824 lt!594465 (tuple2!24157 (select (arr!44113 _keys!1571) from!1960) lt!594463)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17732 0))(
  ( (ValueCellFull!17732 (v!21352 V!54785)) (EmptyCell!17732) )
))
(declare-datatypes ((array!91315 0))(
  ( (array!91316 (arr!44114 (Array (_ BitVec 32) ValueCell!17732)) (size!44666 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91315)

(declare-fun get!22284 (ValueCell!17732 V!54785) V!54785)

(declare-fun dynLambda!3754 (Int (_ BitVec 64)) V!54785)

(assert (=> b!1342786 (= lt!594463 (get!22284 (select (arr!44114 _values!1303) from!1960) (dynLambda!3754 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54785)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6467 (array!91313 array!91315 (_ BitVec 32) (_ BitVec 32) V!54785 V!54785 (_ BitVec 32) Int) ListLongMap!21813)

(assert (=> b!1342786 (= lt!594465 (getCurrentListMapNoExtraKeys!6467 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342787 () Bool)

(declare-fun res!890899 () Bool)

(assert (=> b!1342787 (=> (not res!890899) (not e!764401))))

(declare-fun getCurrentListMap!5772 (array!91313 array!91315 (_ BitVec 32) (_ BitVec 32) V!54785 V!54785 (_ BitVec 32) Int) ListLongMap!21813)

(assert (=> b!1342787 (= res!890899 (contains!9027 (getCurrentListMap!5772 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342788 () Bool)

(declare-fun res!890897 () Bool)

(assert (=> b!1342788 (=> (not res!890897) (not e!764401))))

(declare-datatypes ((List!31301 0))(
  ( (Nil!31298) (Cons!31297 (h!32506 (_ BitVec 64)) (t!45765 List!31301)) )
))
(declare-fun arrayNoDuplicates!0 (array!91313 (_ BitVec 32) List!31301) Bool)

(assert (=> b!1342788 (= res!890897 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31298))))

(declare-fun b!1342789 () Bool)

(declare-fun e!764404 () Bool)

(assert (=> b!1342789 (= e!764404 tp_is_empty!37261)))

(declare-fun mapNonEmpty!57598 () Bool)

(declare-fun tp!109589 () Bool)

(assert (=> mapNonEmpty!57598 (= mapRes!57598 (and tp!109589 e!764404))))

(declare-fun mapValue!57598 () ValueCell!17732)

(declare-fun mapRest!57598 () (Array (_ BitVec 32) ValueCell!17732))

(declare-fun mapKey!57598 () (_ BitVec 32))

(assert (=> mapNonEmpty!57598 (= (arr!44114 _values!1303) (store mapRest!57598 mapKey!57598 mapValue!57598))))

(declare-fun res!890898 () Bool)

(assert (=> start!113210 (=> (not res!890898) (not e!764401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113210 (= res!890898 (validMask!0 mask!1977))))

(assert (=> start!113210 e!764401))

(assert (=> start!113210 tp_is_empty!37261))

(assert (=> start!113210 true))

(declare-fun array_inv!33443 (array!91313) Bool)

(assert (=> start!113210 (array_inv!33443 _keys!1571)))

(declare-fun e!764402 () Bool)

(declare-fun array_inv!33444 (array!91315) Bool)

(assert (=> start!113210 (and (array_inv!33444 _values!1303) e!764402)))

(assert (=> start!113210 tp!109588))

(declare-fun b!1342790 () Bool)

(declare-fun res!890893 () Bool)

(assert (=> b!1342790 (=> (not res!890893) (not e!764401))))

(assert (=> b!1342790 (= res!890893 (and (= (size!44666 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44665 _keys!1571) (size!44666 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342791 () Bool)

(declare-fun res!890894 () Bool)

(assert (=> b!1342791 (=> (not res!890894) (not e!764401))))

(assert (=> b!1342791 (= res!890894 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44665 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342792 () Bool)

(assert (=> b!1342792 (= e!764402 (and e!764403 mapRes!57598))))

(declare-fun condMapEmpty!57598 () Bool)

(declare-fun mapDefault!57598 () ValueCell!17732)

(assert (=> b!1342792 (= condMapEmpty!57598 (= (arr!44114 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17732)) mapDefault!57598)))))

(declare-fun b!1342793 () Bool)

(declare-fun res!890895 () Bool)

(assert (=> b!1342793 (=> (not res!890895) (not e!764401))))

(assert (=> b!1342793 (= res!890895 (not (= (select (arr!44113 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342794 () Bool)

(declare-fun res!890896 () Bool)

(assert (=> b!1342794 (=> (not res!890896) (not e!764401))))

(assert (=> b!1342794 (= res!890896 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!113210 res!890898) b!1342790))

(assert (= (and b!1342790 res!890893) b!1342785))

(assert (= (and b!1342785 res!890891) b!1342788))

(assert (= (and b!1342788 res!890897) b!1342791))

(assert (= (and b!1342791 res!890894) b!1342787))

(assert (= (and b!1342787 res!890899) b!1342793))

(assert (= (and b!1342793 res!890895) b!1342783))

(assert (= (and b!1342783 res!890892) b!1342794))

(assert (= (and b!1342794 res!890896) b!1342786))

(assert (= (and b!1342792 condMapEmpty!57598) mapIsEmpty!57598))

(assert (= (and b!1342792 (not condMapEmpty!57598)) mapNonEmpty!57598))

(get-info :version)

(assert (= (and mapNonEmpty!57598 ((_ is ValueCellFull!17732) mapValue!57598)) b!1342789))

(assert (= (and b!1342792 ((_ is ValueCellFull!17732) mapDefault!57598)) b!1342784))

(assert (= start!113210 b!1342792))

(declare-fun b_lambda!24427 () Bool)

(assert (=> (not b_lambda!24427) (not b!1342786)))

(declare-fun t!45763 () Bool)

(declare-fun tb!12267 () Bool)

(assert (=> (and start!113210 (= defaultEntry!1306 defaultEntry!1306) t!45763) tb!12267))

(declare-fun result!25633 () Bool)

(assert (=> tb!12267 (= result!25633 tp_is_empty!37261)))

(assert (=> b!1342786 t!45763))

(declare-fun b_and!50413 () Bool)

(assert (= b_and!50411 (and (=> t!45763 result!25633) b_and!50413)))

(declare-fun m!1229959 () Bool)

(assert (=> mapNonEmpty!57598 m!1229959))

(declare-fun m!1229961 () Bool)

(assert (=> b!1342787 m!1229961))

(assert (=> b!1342787 m!1229961))

(declare-fun m!1229963 () Bool)

(assert (=> b!1342787 m!1229963))

(declare-fun m!1229965 () Bool)

(assert (=> b!1342785 m!1229965))

(declare-fun m!1229967 () Bool)

(assert (=> b!1342788 m!1229967))

(declare-fun m!1229969 () Bool)

(assert (=> b!1342786 m!1229969))

(declare-fun m!1229971 () Bool)

(assert (=> b!1342786 m!1229971))

(declare-fun m!1229973 () Bool)

(assert (=> b!1342786 m!1229973))

(declare-fun m!1229975 () Bool)

(assert (=> b!1342786 m!1229975))

(declare-fun m!1229977 () Bool)

(assert (=> b!1342786 m!1229977))

(declare-fun m!1229979 () Bool)

(assert (=> b!1342786 m!1229979))

(declare-fun m!1229981 () Bool)

(assert (=> b!1342786 m!1229981))

(declare-fun m!1229983 () Bool)

(assert (=> b!1342786 m!1229983))

(assert (=> b!1342786 m!1229979))

(declare-fun m!1229985 () Bool)

(assert (=> b!1342786 m!1229985))

(declare-fun m!1229987 () Bool)

(assert (=> b!1342786 m!1229987))

(declare-fun m!1229989 () Bool)

(assert (=> b!1342786 m!1229989))

(declare-fun m!1229991 () Bool)

(assert (=> b!1342786 m!1229991))

(assert (=> b!1342786 m!1229989))

(assert (=> b!1342786 m!1229973))

(assert (=> b!1342786 m!1229977))

(declare-fun m!1229993 () Bool)

(assert (=> b!1342786 m!1229993))

(assert (=> b!1342793 m!1229979))

(assert (=> b!1342783 m!1229979))

(assert (=> b!1342783 m!1229979))

(declare-fun m!1229995 () Bool)

(assert (=> b!1342783 m!1229995))

(declare-fun m!1229997 () Bool)

(assert (=> start!113210 m!1229997))

(declare-fun m!1229999 () Bool)

(assert (=> start!113210 m!1229999))

(declare-fun m!1230001 () Bool)

(assert (=> start!113210 m!1230001))

(check-sat (not start!113210) tp_is_empty!37261 b_and!50413 (not b!1342783) (not mapNonEmpty!57598) (not b!1342786) (not b_lambda!24427) (not b!1342787) (not b!1342785) (not b!1342788) (not b_next!31261))
(check-sat b_and!50413 (not b_next!31261))
