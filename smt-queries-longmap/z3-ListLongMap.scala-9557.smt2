; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113204 () Bool)

(assert start!113204)

(declare-fun b_free!31255 () Bool)

(declare-fun b_next!31255 () Bool)

(assert (=> start!113204 (= b_free!31255 (not b_next!31255))))

(declare-fun tp!109570 () Bool)

(declare-fun b_and!50399 () Bool)

(assert (=> start!113204 (= tp!109570 b_and!50399)))

(declare-fun b!1342669 () Bool)

(declare-fun res!890816 () Bool)

(declare-fun e!764360 () Bool)

(assert (=> b!1342669 (=> (not res!890816) (not e!764360))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91301 0))(
  ( (array!91302 (arr!44107 (Array (_ BitVec 32) (_ BitVec 64))) (size!44659 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91301)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54777 0))(
  ( (V!54778 (val!18702 Int)) )
))
(declare-datatypes ((ValueCell!17729 0))(
  ( (ValueCellFull!17729 (v!21349 V!54777)) (EmptyCell!17729) )
))
(declare-datatypes ((array!91303 0))(
  ( (array!91304 (arr!44108 (Array (_ BitVec 32) ValueCell!17729)) (size!44660 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91303)

(assert (=> b!1342669 (= res!890816 (and (= (size!44660 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44659 _keys!1571) (size!44660 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57589 () Bool)

(declare-fun mapRes!57589 () Bool)

(assert (=> mapIsEmpty!57589 mapRes!57589))

(declare-fun b!1342670 () Bool)

(declare-fun res!890817 () Bool)

(assert (=> b!1342670 (=> (not res!890817) (not e!764360))))

(declare-fun minValue!1245 () V!54777)

(declare-fun zeroValue!1245 () V!54777)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24150 0))(
  ( (tuple2!24151 (_1!12086 (_ BitVec 64)) (_2!12086 V!54777)) )
))
(declare-datatypes ((List!31294 0))(
  ( (Nil!31291) (Cons!31290 (h!32499 tuple2!24150) (t!45752 List!31294)) )
))
(declare-datatypes ((ListLongMap!21807 0))(
  ( (ListLongMap!21808 (toList!10919 List!31294)) )
))
(declare-fun contains!9024 (ListLongMap!21807 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5769 (array!91301 array!91303 (_ BitVec 32) (_ BitVec 32) V!54777 V!54777 (_ BitVec 32) Int) ListLongMap!21807)

(assert (=> b!1342670 (= res!890817 (contains!9024 (getCurrentListMap!5769 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342671 () Bool)

(declare-fun e!764358 () Bool)

(declare-fun tp_is_empty!37255 () Bool)

(assert (=> b!1342671 (= e!764358 tp_is_empty!37255)))

(declare-fun mapNonEmpty!57589 () Bool)

(declare-fun tp!109571 () Bool)

(declare-fun e!764357 () Bool)

(assert (=> mapNonEmpty!57589 (= mapRes!57589 (and tp!109571 e!764357))))

(declare-fun mapKey!57589 () (_ BitVec 32))

(declare-fun mapRest!57589 () (Array (_ BitVec 32) ValueCell!17729))

(declare-fun mapValue!57589 () ValueCell!17729)

(assert (=> mapNonEmpty!57589 (= (arr!44108 _values!1303) (store mapRest!57589 mapKey!57589 mapValue!57589))))

(declare-fun b!1342672 () Bool)

(declare-fun res!890818 () Bool)

(assert (=> b!1342672 (=> (not res!890818) (not e!764360))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342672 (= res!890818 (validKeyInArray!0 (select (arr!44107 _keys!1571) from!1960)))))

(declare-fun b!1342673 () Bool)

(declare-fun res!890810 () Bool)

(assert (=> b!1342673 (=> (not res!890810) (not e!764360))))

(declare-datatypes ((List!31295 0))(
  ( (Nil!31292) (Cons!31291 (h!32500 (_ BitVec 64)) (t!45753 List!31295)) )
))
(declare-fun arrayNoDuplicates!0 (array!91301 (_ BitVec 32) List!31295) Bool)

(assert (=> b!1342673 (= res!890810 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31292))))

(declare-fun b!1342675 () Bool)

(declare-fun res!890812 () Bool)

(assert (=> b!1342675 (=> (not res!890812) (not e!764360))))

(assert (=> b!1342675 (= res!890812 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342676 () Bool)

(declare-fun e!764356 () Bool)

(assert (=> b!1342676 (= e!764356 (and e!764358 mapRes!57589))))

(declare-fun condMapEmpty!57589 () Bool)

(declare-fun mapDefault!57589 () ValueCell!17729)

(assert (=> b!1342676 (= condMapEmpty!57589 (= (arr!44108 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17729)) mapDefault!57589)))))

(declare-fun b!1342677 () Bool)

(assert (=> b!1342677 (= e!764360 (not true))))

(declare-fun lt!594413 () ListLongMap!21807)

(assert (=> b!1342677 (contains!9024 lt!594413 k0!1142)))

(declare-datatypes ((Unit!43884 0))(
  ( (Unit!43885) )
))
(declare-fun lt!594415 () Unit!43884)

(declare-fun lt!594417 () V!54777)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!360 ((_ BitVec 64) (_ BitVec 64) V!54777 ListLongMap!21807) Unit!43884)

(assert (=> b!1342677 (= lt!594415 (lemmaInListMapAfterAddingDiffThenInBefore!360 k0!1142 (select (arr!44107 _keys!1571) from!1960) lt!594417 lt!594413))))

(declare-fun lt!594416 () ListLongMap!21807)

(assert (=> b!1342677 (contains!9024 lt!594416 k0!1142)))

(declare-fun lt!594414 () Unit!43884)

(assert (=> b!1342677 (= lt!594414 (lemmaInListMapAfterAddingDiffThenInBefore!360 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594416))))

(declare-fun +!4821 (ListLongMap!21807 tuple2!24150) ListLongMap!21807)

(assert (=> b!1342677 (= lt!594416 (+!4821 lt!594413 (tuple2!24151 (select (arr!44107 _keys!1571) from!1960) lt!594417)))))

(declare-fun get!22279 (ValueCell!17729 V!54777) V!54777)

(declare-fun dynLambda!3751 (Int (_ BitVec 64)) V!54777)

(assert (=> b!1342677 (= lt!594417 (get!22279 (select (arr!44108 _values!1303) from!1960) (dynLambda!3751 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6464 (array!91301 array!91303 (_ BitVec 32) (_ BitVec 32) V!54777 V!54777 (_ BitVec 32) Int) ListLongMap!21807)

(assert (=> b!1342677 (= lt!594413 (getCurrentListMapNoExtraKeys!6464 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342678 () Bool)

(declare-fun res!890811 () Bool)

(assert (=> b!1342678 (=> (not res!890811) (not e!764360))))

(assert (=> b!1342678 (= res!890811 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44659 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342679 () Bool)

(declare-fun res!890813 () Bool)

(assert (=> b!1342679 (=> (not res!890813) (not e!764360))))

(assert (=> b!1342679 (= res!890813 (not (= (select (arr!44107 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342680 () Bool)

(assert (=> b!1342680 (= e!764357 tp_is_empty!37255)))

(declare-fun b!1342674 () Bool)

(declare-fun res!890814 () Bool)

(assert (=> b!1342674 (=> (not res!890814) (not e!764360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91301 (_ BitVec 32)) Bool)

(assert (=> b!1342674 (= res!890814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!890815 () Bool)

(assert (=> start!113204 (=> (not res!890815) (not e!764360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113204 (= res!890815 (validMask!0 mask!1977))))

(assert (=> start!113204 e!764360))

(assert (=> start!113204 tp_is_empty!37255))

(assert (=> start!113204 true))

(declare-fun array_inv!33439 (array!91301) Bool)

(assert (=> start!113204 (array_inv!33439 _keys!1571)))

(declare-fun array_inv!33440 (array!91303) Bool)

(assert (=> start!113204 (and (array_inv!33440 _values!1303) e!764356)))

(assert (=> start!113204 tp!109570))

(assert (= (and start!113204 res!890815) b!1342669))

(assert (= (and b!1342669 res!890816) b!1342674))

(assert (= (and b!1342674 res!890814) b!1342673))

(assert (= (and b!1342673 res!890810) b!1342678))

(assert (= (and b!1342678 res!890811) b!1342670))

(assert (= (and b!1342670 res!890817) b!1342679))

(assert (= (and b!1342679 res!890813) b!1342672))

(assert (= (and b!1342672 res!890818) b!1342675))

(assert (= (and b!1342675 res!890812) b!1342677))

(assert (= (and b!1342676 condMapEmpty!57589) mapIsEmpty!57589))

(assert (= (and b!1342676 (not condMapEmpty!57589)) mapNonEmpty!57589))

(get-info :version)

(assert (= (and mapNonEmpty!57589 ((_ is ValueCellFull!17729) mapValue!57589)) b!1342680))

(assert (= (and b!1342676 ((_ is ValueCellFull!17729) mapDefault!57589)) b!1342671))

(assert (= start!113204 b!1342676))

(declare-fun b_lambda!24421 () Bool)

(assert (=> (not b_lambda!24421) (not b!1342677)))

(declare-fun t!45751 () Bool)

(declare-fun tb!12261 () Bool)

(assert (=> (and start!113204 (= defaultEntry!1306 defaultEntry!1306) t!45751) tb!12261))

(declare-fun result!25621 () Bool)

(assert (=> tb!12261 (= result!25621 tp_is_empty!37255)))

(assert (=> b!1342677 t!45751))

(declare-fun b_and!50401 () Bool)

(assert (= b_and!50399 (and (=> t!45751 result!25621) b_and!50401)))

(declare-fun m!1229845 () Bool)

(assert (=> b!1342679 m!1229845))

(declare-fun m!1229847 () Bool)

(assert (=> b!1342674 m!1229847))

(declare-fun m!1229849 () Bool)

(assert (=> b!1342677 m!1229849))

(declare-fun m!1229851 () Bool)

(assert (=> b!1342677 m!1229851))

(declare-fun m!1229853 () Bool)

(assert (=> b!1342677 m!1229853))

(declare-fun m!1229855 () Bool)

(assert (=> b!1342677 m!1229855))

(declare-fun m!1229857 () Bool)

(assert (=> b!1342677 m!1229857))

(assert (=> b!1342677 m!1229855))

(assert (=> b!1342677 m!1229845))

(declare-fun m!1229859 () Bool)

(assert (=> b!1342677 m!1229859))

(assert (=> b!1342677 m!1229845))

(assert (=> b!1342677 m!1229853))

(declare-fun m!1229861 () Bool)

(assert (=> b!1342677 m!1229861))

(declare-fun m!1229863 () Bool)

(assert (=> b!1342677 m!1229863))

(declare-fun m!1229865 () Bool)

(assert (=> b!1342677 m!1229865))

(declare-fun m!1229867 () Bool)

(assert (=> start!113204 m!1229867))

(declare-fun m!1229869 () Bool)

(assert (=> start!113204 m!1229869))

(declare-fun m!1229871 () Bool)

(assert (=> start!113204 m!1229871))

(declare-fun m!1229873 () Bool)

(assert (=> b!1342670 m!1229873))

(assert (=> b!1342670 m!1229873))

(declare-fun m!1229875 () Bool)

(assert (=> b!1342670 m!1229875))

(assert (=> b!1342672 m!1229845))

(assert (=> b!1342672 m!1229845))

(declare-fun m!1229877 () Bool)

(assert (=> b!1342672 m!1229877))

(declare-fun m!1229879 () Bool)

(assert (=> b!1342673 m!1229879))

(declare-fun m!1229881 () Bool)

(assert (=> mapNonEmpty!57589 m!1229881))

(check-sat (not b_lambda!24421) (not b!1342674) (not b!1342673) (not mapNonEmpty!57589) (not b!1342672) (not b!1342670) (not start!113204) (not b_next!31255) (not b!1342677) tp_is_empty!37255 b_and!50401)
(check-sat b_and!50401 (not b_next!31255))
