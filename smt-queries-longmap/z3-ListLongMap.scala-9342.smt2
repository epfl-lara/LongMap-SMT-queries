; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111488 () Bool)

(assert start!111488)

(declare-fun b_free!30145 () Bool)

(declare-fun b_next!30145 () Bool)

(assert (=> start!111488 (= b_free!30145 (not b_next!30145))))

(declare-fun tp!105911 () Bool)

(declare-fun b_and!48431 () Bool)

(assert (=> start!111488 (= tp!105911 b_and!48431)))

(declare-fun b!1319685 () Bool)

(declare-fun e!752892 () Bool)

(declare-fun tp_is_empty!35965 () Bool)

(assert (=> b!1319685 (= e!752892 tp_is_empty!35965)))

(declare-fun b!1319686 () Bool)

(declare-fun res!875893 () Bool)

(declare-fun e!752894 () Bool)

(assert (=> b!1319686 (=> (not res!875893) (not e!752894))))

(declare-datatypes ((array!88793 0))(
  ( (array!88794 (arr!42871 (Array (_ BitVec 32) (_ BitVec 64))) (size!43423 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88793)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319686 (= res!875893 (validKeyInArray!0 (select (arr!42871 _keys!1609) from!2000)))))

(declare-fun b!1319687 () Bool)

(declare-fun res!875889 () Bool)

(assert (=> b!1319687 (=> (not res!875889) (not e!752894))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1319687 (= res!875889 (not (= (select (arr!42871 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!875891 () Bool)

(assert (=> start!111488 (=> (not res!875891) (not e!752894))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111488 (= res!875891 (validMask!0 mask!2019))))

(assert (=> start!111488 e!752894))

(declare-fun array_inv!32559 (array!88793) Bool)

(assert (=> start!111488 (array_inv!32559 _keys!1609)))

(assert (=> start!111488 true))

(assert (=> start!111488 tp_is_empty!35965))

(declare-datatypes ((V!53057 0))(
  ( (V!53058 (val!18057 Int)) )
))
(declare-datatypes ((ValueCell!17084 0))(
  ( (ValueCellFull!17084 (v!20686 V!53057)) (EmptyCell!17084) )
))
(declare-datatypes ((array!88795 0))(
  ( (array!88796 (arr!42872 (Array (_ BitVec 32) ValueCell!17084)) (size!43424 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88795)

(declare-fun e!752893 () Bool)

(declare-fun array_inv!32560 (array!88795) Bool)

(assert (=> start!111488 (and (array_inv!32560 _values!1337) e!752893)))

(assert (=> start!111488 tp!105911))

(declare-fun b!1319688 () Bool)

(assert (=> b!1319688 (= e!752894 (not true))))

(declare-datatypes ((tuple2!23328 0))(
  ( (tuple2!23329 (_1!11675 (_ BitVec 64)) (_2!11675 V!53057)) )
))
(declare-datatypes ((List!30467 0))(
  ( (Nil!30464) (Cons!30463 (h!31672 tuple2!23328) (t!44153 List!30467)) )
))
(declare-datatypes ((ListLongMap!20985 0))(
  ( (ListLongMap!20986 (toList!10508 List!30467)) )
))
(declare-fun lt!586531 () ListLongMap!20985)

(declare-fun contains!8591 (ListLongMap!20985 (_ BitVec 64)) Bool)

(assert (=> b!1319688 (contains!8591 lt!586531 k0!1164)))

(declare-datatypes ((Unit!43293 0))(
  ( (Unit!43294) )
))
(declare-fun lt!586530 () Unit!43293)

(declare-fun zeroValue!1279 () V!53057)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!120 ((_ BitVec 64) (_ BitVec 64) V!53057 ListLongMap!20985) Unit!43293)

(assert (=> b!1319688 (= lt!586530 (lemmaInListMapAfterAddingDiffThenInBefore!120 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586531))))

(declare-fun lt!586533 () ListLongMap!20985)

(assert (=> b!1319688 (contains!8591 lt!586533 k0!1164)))

(declare-fun minValue!1279 () V!53057)

(declare-fun lt!586532 () Unit!43293)

(assert (=> b!1319688 (= lt!586532 (lemmaInListMapAfterAddingDiffThenInBefore!120 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586533))))

(declare-fun +!4555 (ListLongMap!20985 tuple2!23328) ListLongMap!20985)

(assert (=> b!1319688 (= lt!586533 (+!4555 lt!586531 (tuple2!23329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6188 (array!88793 array!88795 (_ BitVec 32) (_ BitVec 32) V!53057 V!53057 (_ BitVec 32) Int) ListLongMap!20985)

(declare-fun get!21562 (ValueCell!17084 V!53057) V!53057)

(declare-fun dynLambda!3485 (Int (_ BitVec 64)) V!53057)

(assert (=> b!1319688 (= lt!586531 (+!4555 (getCurrentListMapNoExtraKeys!6188 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23329 (select (arr!42871 _keys!1609) from!2000) (get!21562 (select (arr!42872 _values!1337) from!2000) (dynLambda!3485 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1319689 () Bool)

(declare-fun res!875890 () Bool)

(assert (=> b!1319689 (=> (not res!875890) (not e!752894))))

(declare-datatypes ((List!30468 0))(
  ( (Nil!30465) (Cons!30464 (h!31673 (_ BitVec 64)) (t!44154 List!30468)) )
))
(declare-fun arrayNoDuplicates!0 (array!88793 (_ BitVec 32) List!30468) Bool)

(assert (=> b!1319689 (= res!875890 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30465))))

(declare-fun b!1319690 () Bool)

(declare-fun e!752896 () Bool)

(assert (=> b!1319690 (= e!752896 tp_is_empty!35965)))

(declare-fun mapNonEmpty!55595 () Bool)

(declare-fun mapRes!55595 () Bool)

(declare-fun tp!105912 () Bool)

(assert (=> mapNonEmpty!55595 (= mapRes!55595 (and tp!105912 e!752892))))

(declare-fun mapKey!55595 () (_ BitVec 32))

(declare-fun mapValue!55595 () ValueCell!17084)

(declare-fun mapRest!55595 () (Array (_ BitVec 32) ValueCell!17084))

(assert (=> mapNonEmpty!55595 (= (arr!42872 _values!1337) (store mapRest!55595 mapKey!55595 mapValue!55595))))

(declare-fun b!1319691 () Bool)

(declare-fun res!875892 () Bool)

(assert (=> b!1319691 (=> (not res!875892) (not e!752894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88793 (_ BitVec 32)) Bool)

(assert (=> b!1319691 (= res!875892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319692 () Bool)

(declare-fun res!875894 () Bool)

(assert (=> b!1319692 (=> (not res!875894) (not e!752894))))

(declare-fun getCurrentListMap!5399 (array!88793 array!88795 (_ BitVec 32) (_ BitVec 32) V!53057 V!53057 (_ BitVec 32) Int) ListLongMap!20985)

(assert (=> b!1319692 (= res!875894 (contains!8591 (getCurrentListMap!5399 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319693 () Bool)

(declare-fun res!875895 () Bool)

(assert (=> b!1319693 (=> (not res!875895) (not e!752894))))

(assert (=> b!1319693 (= res!875895 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43423 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319694 () Bool)

(assert (=> b!1319694 (= e!752893 (and e!752896 mapRes!55595))))

(declare-fun condMapEmpty!55595 () Bool)

(declare-fun mapDefault!55595 () ValueCell!17084)

(assert (=> b!1319694 (= condMapEmpty!55595 (= (arr!42872 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17084)) mapDefault!55595)))))

(declare-fun mapIsEmpty!55595 () Bool)

(assert (=> mapIsEmpty!55595 mapRes!55595))

(declare-fun b!1319695 () Bool)

(declare-fun res!875888 () Bool)

(assert (=> b!1319695 (=> (not res!875888) (not e!752894))))

(assert (=> b!1319695 (= res!875888 (and (= (size!43424 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43423 _keys!1609) (size!43424 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111488 res!875891) b!1319695))

(assert (= (and b!1319695 res!875888) b!1319691))

(assert (= (and b!1319691 res!875892) b!1319689))

(assert (= (and b!1319689 res!875890) b!1319693))

(assert (= (and b!1319693 res!875895) b!1319692))

(assert (= (and b!1319692 res!875894) b!1319687))

(assert (= (and b!1319687 res!875889) b!1319686))

(assert (= (and b!1319686 res!875893) b!1319688))

(assert (= (and b!1319694 condMapEmpty!55595) mapIsEmpty!55595))

(assert (= (and b!1319694 (not condMapEmpty!55595)) mapNonEmpty!55595))

(get-info :version)

(assert (= (and mapNonEmpty!55595 ((_ is ValueCellFull!17084) mapValue!55595)) b!1319685))

(assert (= (and b!1319694 ((_ is ValueCellFull!17084) mapDefault!55595)) b!1319690))

(assert (= start!111488 b!1319694))

(declare-fun b_lambda!23461 () Bool)

(assert (=> (not b_lambda!23461) (not b!1319688)))

(declare-fun t!44152 () Bool)

(declare-fun tb!11489 () Bool)

(assert (=> (and start!111488 (= defaultEntry!1340 defaultEntry!1340) t!44152) tb!11489))

(declare-fun result!24041 () Bool)

(assert (=> tb!11489 (= result!24041 tp_is_empty!35965)))

(assert (=> b!1319688 t!44152))

(declare-fun b_and!48433 () Bool)

(assert (= b_and!48431 (and (=> t!44152 result!24041) b_and!48433)))

(declare-fun m!1206855 () Bool)

(assert (=> b!1319688 m!1206855))

(declare-fun m!1206857 () Bool)

(assert (=> b!1319688 m!1206857))

(declare-fun m!1206859 () Bool)

(assert (=> b!1319688 m!1206859))

(declare-fun m!1206861 () Bool)

(assert (=> b!1319688 m!1206861))

(declare-fun m!1206863 () Bool)

(assert (=> b!1319688 m!1206863))

(assert (=> b!1319688 m!1206863))

(assert (=> b!1319688 m!1206857))

(declare-fun m!1206865 () Bool)

(assert (=> b!1319688 m!1206865))

(declare-fun m!1206867 () Bool)

(assert (=> b!1319688 m!1206867))

(declare-fun m!1206869 () Bool)

(assert (=> b!1319688 m!1206869))

(declare-fun m!1206871 () Bool)

(assert (=> b!1319688 m!1206871))

(assert (=> b!1319688 m!1206859))

(declare-fun m!1206873 () Bool)

(assert (=> b!1319688 m!1206873))

(declare-fun m!1206875 () Bool)

(assert (=> b!1319688 m!1206875))

(declare-fun m!1206877 () Bool)

(assert (=> mapNonEmpty!55595 m!1206877))

(declare-fun m!1206879 () Bool)

(assert (=> b!1319689 m!1206879))

(declare-fun m!1206881 () Bool)

(assert (=> b!1319692 m!1206881))

(assert (=> b!1319692 m!1206881))

(declare-fun m!1206883 () Bool)

(assert (=> b!1319692 m!1206883))

(declare-fun m!1206885 () Bool)

(assert (=> start!111488 m!1206885))

(declare-fun m!1206887 () Bool)

(assert (=> start!111488 m!1206887))

(declare-fun m!1206889 () Bool)

(assert (=> start!111488 m!1206889))

(assert (=> b!1319687 m!1206869))

(declare-fun m!1206891 () Bool)

(assert (=> b!1319691 m!1206891))

(assert (=> b!1319686 m!1206869))

(assert (=> b!1319686 m!1206869))

(declare-fun m!1206893 () Bool)

(assert (=> b!1319686 m!1206893))

(check-sat (not b_lambda!23461) (not b!1319692) (not b!1319691) (not b_next!30145) (not mapNonEmpty!55595) (not start!111488) (not b!1319688) b_and!48433 (not b!1319686) (not b!1319689) tp_is_empty!35965)
(check-sat b_and!48433 (not b_next!30145))
