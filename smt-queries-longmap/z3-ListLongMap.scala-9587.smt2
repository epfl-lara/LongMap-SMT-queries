; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113608 () Bool)

(assert start!113608)

(declare-fun b_free!31435 () Bool)

(declare-fun b_next!31435 () Bool)

(assert (=> start!113608 (= b_free!31435 (not b_next!31435))))

(declare-fun tp!110109 () Bool)

(declare-fun b_and!50725 () Bool)

(assert (=> start!113608 (= tp!110109 b_and!50725)))

(declare-fun b!1347261 () Bool)

(declare-fun e!766667 () Bool)

(assert (=> b!1347261 (= e!766667 false)))

(declare-datatypes ((V!55017 0))(
  ( (V!55018 (val!18792 Int)) )
))
(declare-fun minValue!1245 () V!55017)

(declare-fun lt!595931 () Bool)

(declare-datatypes ((array!91815 0))(
  ( (array!91816 (arr!44359 (Array (_ BitVec 32) (_ BitVec 64))) (size!44910 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91815)

(declare-fun zeroValue!1245 () V!55017)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17819 0))(
  ( (ValueCellFull!17819 (v!21435 V!55017)) (EmptyCell!17819) )
))
(declare-datatypes ((array!91817 0))(
  ( (array!91818 (arr!44360 (Array (_ BitVec 32) ValueCell!17819)) (size!44911 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91817)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((tuple2!24266 0))(
  ( (tuple2!24267 (_1!12144 (_ BitVec 64)) (_2!12144 V!55017)) )
))
(declare-datatypes ((List!31409 0))(
  ( (Nil!31406) (Cons!31405 (h!32623 tuple2!24266) (t!45991 List!31409)) )
))
(declare-datatypes ((ListLongMap!21931 0))(
  ( (ListLongMap!21932 (toList!10981 List!31409)) )
))
(declare-fun contains!9169 (ListLongMap!21931 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5921 (array!91815 array!91817 (_ BitVec 32) (_ BitVec 32) V!55017 V!55017 (_ BitVec 32) Int) ListLongMap!21931)

(assert (=> b!1347261 (= lt!595931 (contains!9169 (getCurrentListMap!5921 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347262 () Bool)

(declare-fun e!766663 () Bool)

(declare-fun tp_is_empty!37435 () Bool)

(assert (=> b!1347262 (= e!766663 tp_is_empty!37435)))

(declare-fun b!1347263 () Bool)

(declare-fun e!766666 () Bool)

(declare-fun e!766665 () Bool)

(declare-fun mapRes!57859 () Bool)

(assert (=> b!1347263 (= e!766666 (and e!766665 mapRes!57859))))

(declare-fun condMapEmpty!57859 () Bool)

(declare-fun mapDefault!57859 () ValueCell!17819)

(assert (=> b!1347263 (= condMapEmpty!57859 (= (arr!44360 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17819)) mapDefault!57859)))))

(declare-fun res!893644 () Bool)

(assert (=> start!113608 (=> (not res!893644) (not e!766667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113608 (= res!893644 (validMask!0 mask!1977))))

(assert (=> start!113608 e!766667))

(assert (=> start!113608 tp_is_empty!37435))

(assert (=> start!113608 true))

(declare-fun array_inv!33693 (array!91815) Bool)

(assert (=> start!113608 (array_inv!33693 _keys!1571)))

(declare-fun array_inv!33694 (array!91817) Bool)

(assert (=> start!113608 (and (array_inv!33694 _values!1303) e!766666)))

(assert (=> start!113608 tp!110109))

(declare-fun b!1347264 () Bool)

(declare-fun res!893646 () Bool)

(assert (=> b!1347264 (=> (not res!893646) (not e!766667))))

(assert (=> b!1347264 (= res!893646 (and (= (size!44911 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44910 _keys!1571) (size!44911 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57859 () Bool)

(assert (=> mapIsEmpty!57859 mapRes!57859))

(declare-fun mapNonEmpty!57859 () Bool)

(declare-fun tp!110110 () Bool)

(assert (=> mapNonEmpty!57859 (= mapRes!57859 (and tp!110110 e!766663))))

(declare-fun mapValue!57859 () ValueCell!17819)

(declare-fun mapKey!57859 () (_ BitVec 32))

(declare-fun mapRest!57859 () (Array (_ BitVec 32) ValueCell!17819))

(assert (=> mapNonEmpty!57859 (= (arr!44360 _values!1303) (store mapRest!57859 mapKey!57859 mapValue!57859))))

(declare-fun b!1347265 () Bool)

(declare-fun res!893648 () Bool)

(assert (=> b!1347265 (=> (not res!893648) (not e!766667))))

(declare-datatypes ((List!31410 0))(
  ( (Nil!31407) (Cons!31406 (h!32624 (_ BitVec 64)) (t!45992 List!31410)) )
))
(declare-fun arrayNoDuplicates!0 (array!91815 (_ BitVec 32) List!31410) Bool)

(assert (=> b!1347265 (= res!893648 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31407))))

(declare-fun b!1347266 () Bool)

(declare-fun res!893647 () Bool)

(assert (=> b!1347266 (=> (not res!893647) (not e!766667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91815 (_ BitVec 32)) Bool)

(assert (=> b!1347266 (= res!893647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347267 () Bool)

(declare-fun res!893645 () Bool)

(assert (=> b!1347267 (=> (not res!893645) (not e!766667))))

(assert (=> b!1347267 (= res!893645 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44910 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347268 () Bool)

(assert (=> b!1347268 (= e!766665 tp_is_empty!37435)))

(assert (= (and start!113608 res!893644) b!1347264))

(assert (= (and b!1347264 res!893646) b!1347266))

(assert (= (and b!1347266 res!893647) b!1347265))

(assert (= (and b!1347265 res!893648) b!1347267))

(assert (= (and b!1347267 res!893645) b!1347261))

(assert (= (and b!1347263 condMapEmpty!57859) mapIsEmpty!57859))

(assert (= (and b!1347263 (not condMapEmpty!57859)) mapNonEmpty!57859))

(get-info :version)

(assert (= (and mapNonEmpty!57859 ((_ is ValueCellFull!17819) mapValue!57859)) b!1347262))

(assert (= (and b!1347263 ((_ is ValueCellFull!17819) mapDefault!57859)) b!1347268))

(assert (= start!113608 b!1347263))

(declare-fun m!1234869 () Bool)

(assert (=> mapNonEmpty!57859 m!1234869))

(declare-fun m!1234871 () Bool)

(assert (=> start!113608 m!1234871))

(declare-fun m!1234873 () Bool)

(assert (=> start!113608 m!1234873))

(declare-fun m!1234875 () Bool)

(assert (=> start!113608 m!1234875))

(declare-fun m!1234877 () Bool)

(assert (=> b!1347265 m!1234877))

(declare-fun m!1234879 () Bool)

(assert (=> b!1347261 m!1234879))

(assert (=> b!1347261 m!1234879))

(declare-fun m!1234881 () Bool)

(assert (=> b!1347261 m!1234881))

(declare-fun m!1234883 () Bool)

(assert (=> b!1347266 m!1234883))

(check-sat (not mapNonEmpty!57859) (not b!1347265) b_and!50725 tp_is_empty!37435 (not b_next!31435) (not start!113608) (not b!1347266) (not b!1347261))
(check-sat b_and!50725 (not b_next!31435))
