; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111380 () Bool)

(assert start!111380)

(declare-fun b_free!30037 () Bool)

(declare-fun b_next!30037 () Bool)

(assert (=> start!111380 (= b_free!30037 (not b_next!30037))))

(declare-fun tp!105588 () Bool)

(declare-fun b_and!48239 () Bool)

(assert (=> start!111380 (= tp!105588 b_and!48239)))

(declare-fun b!1317894 () Bool)

(declare-fun res!874667 () Bool)

(declare-fun e!752085 () Bool)

(assert (=> b!1317894 (=> (not res!874667) (not e!752085))))

(declare-datatypes ((array!88583 0))(
  ( (array!88584 (arr!42766 (Array (_ BitVec 32) (_ BitVec 64))) (size!43318 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88583)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1317894 (= res!874667 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43318 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317895 () Bool)

(declare-fun res!874671 () Bool)

(assert (=> b!1317895 (=> (not res!874671) (not e!752085))))

(declare-datatypes ((List!30388 0))(
  ( (Nil!30385) (Cons!30384 (h!31593 (_ BitVec 64)) (t!43988 List!30388)) )
))
(declare-fun arrayNoDuplicates!0 (array!88583 (_ BitVec 32) List!30388) Bool)

(assert (=> b!1317895 (= res!874671 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30385))))

(declare-fun b!1317896 () Bool)

(declare-fun res!874670 () Bool)

(assert (=> b!1317896 (=> (not res!874670) (not e!752085))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((V!52913 0))(
  ( (V!52914 (val!18003 Int)) )
))
(declare-datatypes ((ValueCell!17030 0))(
  ( (ValueCellFull!17030 (v!20632 V!52913)) (EmptyCell!17030) )
))
(declare-datatypes ((array!88585 0))(
  ( (array!88586 (arr!42767 (Array (_ BitVec 32) ValueCell!17030)) (size!43319 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88585)

(assert (=> b!1317896 (= res!874670 (and (= (size!43319 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43318 _keys!1609) (size!43319 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317897 () Bool)

(declare-fun e!752086 () Bool)

(declare-fun e!752082 () Bool)

(declare-fun mapRes!55433 () Bool)

(assert (=> b!1317897 (= e!752086 (and e!752082 mapRes!55433))))

(declare-fun condMapEmpty!55433 () Bool)

(declare-fun mapDefault!55433 () ValueCell!17030)

(assert (=> b!1317897 (= condMapEmpty!55433 (= (arr!42767 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17030)) mapDefault!55433)))))

(declare-fun mapNonEmpty!55433 () Bool)

(declare-fun tp!105587 () Bool)

(declare-fun e!752083 () Bool)

(assert (=> mapNonEmpty!55433 (= mapRes!55433 (and tp!105587 e!752083))))

(declare-fun mapKey!55433 () (_ BitVec 32))

(declare-fun mapRest!55433 () (Array (_ BitVec 32) ValueCell!17030))

(declare-fun mapValue!55433 () ValueCell!17030)

(assert (=> mapNonEmpty!55433 (= (arr!42767 _values!1337) (store mapRest!55433 mapKey!55433 mapValue!55433))))

(declare-fun b!1317898 () Bool)

(declare-fun res!874669 () Bool)

(assert (=> b!1317898 (=> (not res!874669) (not e!752085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88583 (_ BitVec 32)) Bool)

(assert (=> b!1317898 (= res!874669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317899 () Bool)

(declare-fun tp_is_empty!35857 () Bool)

(assert (=> b!1317899 (= e!752082 tp_is_empty!35857)))

(declare-fun b!1317900 () Bool)

(assert (=> b!1317900 (= e!752085 false)))

(declare-fun zeroValue!1279 () V!52913)

(declare-fun minValue!1279 () V!52913)

(declare-fun lt!586245 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23248 0))(
  ( (tuple2!23249 (_1!11635 (_ BitVec 64)) (_2!11635 V!52913)) )
))
(declare-datatypes ((List!30389 0))(
  ( (Nil!30386) (Cons!30385 (h!31594 tuple2!23248) (t!43989 List!30389)) )
))
(declare-datatypes ((ListLongMap!20905 0))(
  ( (ListLongMap!20906 (toList!10468 List!30389)) )
))
(declare-fun contains!8551 (ListLongMap!20905 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5363 (array!88583 array!88585 (_ BitVec 32) (_ BitVec 32) V!52913 V!52913 (_ BitVec 32) Int) ListLongMap!20905)

(assert (=> b!1317900 (= lt!586245 (contains!8551 (getCurrentListMap!5363 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1317901 () Bool)

(assert (=> b!1317901 (= e!752083 tp_is_empty!35857)))

(declare-fun mapIsEmpty!55433 () Bool)

(assert (=> mapIsEmpty!55433 mapRes!55433))

(declare-fun res!874668 () Bool)

(assert (=> start!111380 (=> (not res!874668) (not e!752085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111380 (= res!874668 (validMask!0 mask!2019))))

(assert (=> start!111380 e!752085))

(declare-fun array_inv!32477 (array!88583) Bool)

(assert (=> start!111380 (array_inv!32477 _keys!1609)))

(assert (=> start!111380 true))

(assert (=> start!111380 tp_is_empty!35857))

(declare-fun array_inv!32478 (array!88585) Bool)

(assert (=> start!111380 (and (array_inv!32478 _values!1337) e!752086)))

(assert (=> start!111380 tp!105588))

(assert (= (and start!111380 res!874668) b!1317896))

(assert (= (and b!1317896 res!874670) b!1317898))

(assert (= (and b!1317898 res!874669) b!1317895))

(assert (= (and b!1317895 res!874671) b!1317894))

(assert (= (and b!1317894 res!874667) b!1317900))

(assert (= (and b!1317897 condMapEmpty!55433) mapIsEmpty!55433))

(assert (= (and b!1317897 (not condMapEmpty!55433)) mapNonEmpty!55433))

(get-info :version)

(assert (= (and mapNonEmpty!55433 ((_ is ValueCellFull!17030) mapValue!55433)) b!1317901))

(assert (= (and b!1317897 ((_ is ValueCellFull!17030) mapDefault!55433)) b!1317899))

(assert (= start!111380 b!1317897))

(declare-fun m!1205127 () Bool)

(assert (=> b!1317900 m!1205127))

(assert (=> b!1317900 m!1205127))

(declare-fun m!1205129 () Bool)

(assert (=> b!1317900 m!1205129))

(declare-fun m!1205131 () Bool)

(assert (=> start!111380 m!1205131))

(declare-fun m!1205133 () Bool)

(assert (=> start!111380 m!1205133))

(declare-fun m!1205135 () Bool)

(assert (=> start!111380 m!1205135))

(declare-fun m!1205137 () Bool)

(assert (=> b!1317898 m!1205137))

(declare-fun m!1205139 () Bool)

(assert (=> mapNonEmpty!55433 m!1205139))

(declare-fun m!1205141 () Bool)

(assert (=> b!1317895 m!1205141))

(check-sat b_and!48239 (not b!1317895) (not b!1317900) tp_is_empty!35857 (not mapNonEmpty!55433) (not b_next!30037) (not start!111380) (not b!1317898))
(check-sat b_and!48239 (not b_next!30037))
