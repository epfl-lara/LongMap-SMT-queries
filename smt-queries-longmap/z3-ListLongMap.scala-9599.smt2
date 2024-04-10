; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113458 () Bool)

(assert start!113458)

(declare-fun b_free!31509 () Bool)

(declare-fun b_next!31509 () Bool)

(assert (=> start!113458 (= b_free!31509 (not b_next!31509))))

(declare-fun tp!110331 () Bool)

(declare-fun b_and!50797 () Bool)

(assert (=> start!113458 (= tp!110331 b_and!50797)))

(declare-fun b!1346933 () Bool)

(declare-fun res!893769 () Bool)

(declare-fun e!766376 () Bool)

(assert (=> b!1346933 (=> (not res!893769) (not e!766376))))

(declare-datatypes ((array!91850 0))(
  ( (array!91851 (arr!44381 (Array (_ BitVec 32) (_ BitVec 64))) (size!44931 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91850)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91850 (_ BitVec 32)) Bool)

(assert (=> b!1346933 (= res!893769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346934 () Bool)

(declare-fun res!893770 () Bool)

(assert (=> b!1346934 (=> (not res!893770) (not e!766376))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346934 (= res!893770 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1346935 () Bool)

(declare-fun res!893766 () Bool)

(assert (=> b!1346935 (=> (not res!893766) (not e!766376))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346935 (= res!893766 (not (= (select (arr!44381 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1346936 () Bool)

(declare-fun e!766378 () Bool)

(declare-fun tp_is_empty!37509 () Bool)

(assert (=> b!1346936 (= e!766378 tp_is_empty!37509)))

(declare-fun b!1346937 () Bool)

(declare-fun res!893772 () Bool)

(assert (=> b!1346937 (=> (not res!893772) (not e!766376))))

(declare-datatypes ((V!55115 0))(
  ( (V!55116 (val!18829 Int)) )
))
(declare-fun minValue!1245 () V!55115)

(declare-fun zeroValue!1245 () V!55115)

(declare-datatypes ((ValueCell!17856 0))(
  ( (ValueCellFull!17856 (v!21477 V!55115)) (EmptyCell!17856) )
))
(declare-datatypes ((array!91852 0))(
  ( (array!91853 (arr!44382 (Array (_ BitVec 32) ValueCell!17856)) (size!44932 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91852)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24272 0))(
  ( (tuple2!24273 (_1!12147 (_ BitVec 64)) (_2!12147 V!55115)) )
))
(declare-datatypes ((List!31427 0))(
  ( (Nil!31424) (Cons!31423 (h!32632 tuple2!24272) (t!46017 List!31427)) )
))
(declare-datatypes ((ListLongMap!21929 0))(
  ( (ListLongMap!21930 (toList!10980 List!31427)) )
))
(declare-fun contains!9156 (ListLongMap!21929 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5932 (array!91850 array!91852 (_ BitVec 32) (_ BitVec 32) V!55115 V!55115 (_ BitVec 32) Int) ListLongMap!21929)

(assert (=> b!1346937 (= res!893772 (contains!9156 (getCurrentListMap!5932 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346939 () Bool)

(declare-fun e!766379 () Bool)

(declare-fun e!766375 () Bool)

(declare-fun mapRes!57970 () Bool)

(assert (=> b!1346939 (= e!766379 (and e!766375 mapRes!57970))))

(declare-fun condMapEmpty!57970 () Bool)

(declare-fun mapDefault!57970 () ValueCell!17856)

(assert (=> b!1346939 (= condMapEmpty!57970 (= (arr!44382 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17856)) mapDefault!57970)))))

(declare-fun mapNonEmpty!57970 () Bool)

(declare-fun tp!110332 () Bool)

(assert (=> mapNonEmpty!57970 (= mapRes!57970 (and tp!110332 e!766378))))

(declare-fun mapRest!57970 () (Array (_ BitVec 32) ValueCell!17856))

(declare-fun mapValue!57970 () ValueCell!17856)

(declare-fun mapKey!57970 () (_ BitVec 32))

(assert (=> mapNonEmpty!57970 (= (arr!44382 _values!1303) (store mapRest!57970 mapKey!57970 mapValue!57970))))

(declare-fun b!1346940 () Bool)

(declare-fun res!893768 () Bool)

(assert (=> b!1346940 (=> (not res!893768) (not e!766376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346940 (= res!893768 (validKeyInArray!0 (select (arr!44381 _keys!1571) from!1960)))))

(declare-fun b!1346941 () Bool)

(declare-fun res!893767 () Bool)

(assert (=> b!1346941 (=> (not res!893767) (not e!766376))))

(declare-datatypes ((List!31428 0))(
  ( (Nil!31425) (Cons!31424 (h!32633 (_ BitVec 64)) (t!46018 List!31428)) )
))
(declare-fun arrayNoDuplicates!0 (array!91850 (_ BitVec 32) List!31428) Bool)

(assert (=> b!1346941 (= res!893767 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31425))))

(declare-fun b!1346942 () Bool)

(declare-fun res!893765 () Bool)

(assert (=> b!1346942 (=> (not res!893765) (not e!766376))))

(assert (=> b!1346942 (= res!893765 (and (= (size!44932 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44931 _keys!1571) (size!44932 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57970 () Bool)

(assert (=> mapIsEmpty!57970 mapRes!57970))

(declare-fun b!1346943 () Bool)

(declare-fun res!893771 () Bool)

(assert (=> b!1346943 (=> (not res!893771) (not e!766376))))

(assert (=> b!1346943 (= res!893771 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44931 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346944 () Bool)

(assert (=> b!1346944 (= e!766376 (bvsge from!1960 (size!44932 _values!1303)))))

(declare-fun lt!595557 () ListLongMap!21929)

(declare-fun getCurrentListMapNoExtraKeys!6481 (array!91850 array!91852 (_ BitVec 32) (_ BitVec 32) V!55115 V!55115 (_ BitVec 32) Int) ListLongMap!21929)

(assert (=> b!1346944 (= lt!595557 (getCurrentListMapNoExtraKeys!6481 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun res!893764 () Bool)

(assert (=> start!113458 (=> (not res!893764) (not e!766376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113458 (= res!893764 (validMask!0 mask!1977))))

(assert (=> start!113458 e!766376))

(assert (=> start!113458 tp_is_empty!37509))

(assert (=> start!113458 true))

(declare-fun array_inv!33435 (array!91850) Bool)

(assert (=> start!113458 (array_inv!33435 _keys!1571)))

(declare-fun array_inv!33436 (array!91852) Bool)

(assert (=> start!113458 (and (array_inv!33436 _values!1303) e!766379)))

(assert (=> start!113458 tp!110331))

(declare-fun b!1346938 () Bool)

(assert (=> b!1346938 (= e!766375 tp_is_empty!37509)))

(assert (= (and start!113458 res!893764) b!1346942))

(assert (= (and b!1346942 res!893765) b!1346933))

(assert (= (and b!1346933 res!893769) b!1346941))

(assert (= (and b!1346941 res!893767) b!1346943))

(assert (= (and b!1346943 res!893771) b!1346937))

(assert (= (and b!1346937 res!893772) b!1346935))

(assert (= (and b!1346935 res!893766) b!1346940))

(assert (= (and b!1346940 res!893768) b!1346934))

(assert (= (and b!1346934 res!893770) b!1346944))

(assert (= (and b!1346939 condMapEmpty!57970) mapIsEmpty!57970))

(assert (= (and b!1346939 (not condMapEmpty!57970)) mapNonEmpty!57970))

(get-info :version)

(assert (= (and mapNonEmpty!57970 ((_ is ValueCellFull!17856) mapValue!57970)) b!1346936))

(assert (= (and b!1346939 ((_ is ValueCellFull!17856) mapDefault!57970)) b!1346938))

(assert (= start!113458 b!1346939))

(declare-fun m!1233899 () Bool)

(assert (=> b!1346940 m!1233899))

(assert (=> b!1346940 m!1233899))

(declare-fun m!1233901 () Bool)

(assert (=> b!1346940 m!1233901))

(assert (=> b!1346935 m!1233899))

(declare-fun m!1233903 () Bool)

(assert (=> b!1346933 m!1233903))

(declare-fun m!1233905 () Bool)

(assert (=> b!1346937 m!1233905))

(assert (=> b!1346937 m!1233905))

(declare-fun m!1233907 () Bool)

(assert (=> b!1346937 m!1233907))

(declare-fun m!1233909 () Bool)

(assert (=> b!1346941 m!1233909))

(declare-fun m!1233911 () Bool)

(assert (=> start!113458 m!1233911))

(declare-fun m!1233913 () Bool)

(assert (=> start!113458 m!1233913))

(declare-fun m!1233915 () Bool)

(assert (=> start!113458 m!1233915))

(declare-fun m!1233917 () Bool)

(assert (=> b!1346944 m!1233917))

(declare-fun m!1233919 () Bool)

(assert (=> mapNonEmpty!57970 m!1233919))

(check-sat b_and!50797 (not start!113458) (not mapNonEmpty!57970) (not b!1346933) (not b_next!31509) (not b!1346937) (not b!1346944) (not b!1346940) tp_is_empty!37509 (not b!1346941))
(check-sat b_and!50797 (not b_next!31509))
