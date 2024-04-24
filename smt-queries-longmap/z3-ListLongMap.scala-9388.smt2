; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111988 () Bool)

(assert start!111988)

(declare-fun b_free!30421 () Bool)

(declare-fun b_next!30421 () Bool)

(assert (=> start!111988 (= b_free!30421 (not b_next!30421))))

(declare-fun tp!106739 () Bool)

(declare-fun b_and!48961 () Bool)

(assert (=> start!111988 (= tp!106739 b_and!48961)))

(declare-fun b!1325647 () Bool)

(declare-fun res!879554 () Bool)

(declare-fun e!755839 () Bool)

(assert (=> b!1325647 (=> (not res!879554) (not e!755839))))

(declare-datatypes ((array!89483 0))(
  ( (array!89484 (arr!43211 (Array (_ BitVec 32) (_ BitVec 64))) (size!43762 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89483)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325647 (= res!879554 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43762 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325648 () Bool)

(declare-fun res!879552 () Bool)

(assert (=> b!1325648 (=> (not res!879552) (not e!755839))))

(declare-datatypes ((V!53425 0))(
  ( (V!53426 (val!18195 Int)) )
))
(declare-datatypes ((ValueCell!17222 0))(
  ( (ValueCellFull!17222 (v!20820 V!53425)) (EmptyCell!17222) )
))
(declare-datatypes ((array!89485 0))(
  ( (array!89486 (arr!43212 (Array (_ BitVec 32) ValueCell!17222)) (size!43763 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89485)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1325648 (= res!879552 (and (= (size!43763 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43762 _keys!1609) (size!43763 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325649 () Bool)

(declare-fun res!879555 () Bool)

(assert (=> b!1325649 (=> (not res!879555) (not e!755839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89483 (_ BitVec 32)) Bool)

(assert (=> b!1325649 (= res!879555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325650 () Bool)

(declare-fun e!755841 () Bool)

(declare-fun tp_is_empty!36241 () Bool)

(assert (=> b!1325650 (= e!755841 tp_is_empty!36241)))

(declare-fun b!1325651 () Bool)

(assert (=> b!1325651 (= e!755839 false)))

(declare-fun zeroValue!1279 () V!53425)

(declare-fun minValue!1279 () V!53425)

(declare-fun lt!589940 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23496 0))(
  ( (tuple2!23497 (_1!11759 (_ BitVec 64)) (_2!11759 V!53425)) )
))
(declare-datatypes ((List!30648 0))(
  ( (Nil!30645) (Cons!30644 (h!31862 tuple2!23496) (t!44566 List!30648)) )
))
(declare-datatypes ((ListLongMap!21161 0))(
  ( (ListLongMap!21162 (toList!10596 List!30648)) )
))
(declare-fun contains!8763 (ListLongMap!21161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5579 (array!89483 array!89485 (_ BitVec 32) (_ BitVec 32) V!53425 V!53425 (_ BitVec 32) Int) ListLongMap!21161)

(assert (=> b!1325651 (= lt!589940 (contains!8763 (getCurrentListMap!5579 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!879556 () Bool)

(assert (=> start!111988 (=> (not res!879556) (not e!755839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111988 (= res!879556 (validMask!0 mask!2019))))

(assert (=> start!111988 e!755839))

(declare-fun array_inv!32893 (array!89483) Bool)

(assert (=> start!111988 (array_inv!32893 _keys!1609)))

(assert (=> start!111988 true))

(assert (=> start!111988 tp_is_empty!36241))

(declare-fun e!755842 () Bool)

(declare-fun array_inv!32894 (array!89485) Bool)

(assert (=> start!111988 (and (array_inv!32894 _values!1337) e!755842)))

(assert (=> start!111988 tp!106739))

(declare-fun b!1325652 () Bool)

(declare-fun e!755840 () Bool)

(declare-fun mapRes!56009 () Bool)

(assert (=> b!1325652 (= e!755842 (and e!755840 mapRes!56009))))

(declare-fun condMapEmpty!56009 () Bool)

(declare-fun mapDefault!56009 () ValueCell!17222)

(assert (=> b!1325652 (= condMapEmpty!56009 (= (arr!43212 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17222)) mapDefault!56009)))))

(declare-fun mapIsEmpty!56009 () Bool)

(assert (=> mapIsEmpty!56009 mapRes!56009))

(declare-fun mapNonEmpty!56009 () Bool)

(declare-fun tp!106738 () Bool)

(assert (=> mapNonEmpty!56009 (= mapRes!56009 (and tp!106738 e!755841))))

(declare-fun mapKey!56009 () (_ BitVec 32))

(declare-fun mapRest!56009 () (Array (_ BitVec 32) ValueCell!17222))

(declare-fun mapValue!56009 () ValueCell!17222)

(assert (=> mapNonEmpty!56009 (= (arr!43212 _values!1337) (store mapRest!56009 mapKey!56009 mapValue!56009))))

(declare-fun b!1325653 () Bool)

(assert (=> b!1325653 (= e!755840 tp_is_empty!36241)))

(declare-fun b!1325654 () Bool)

(declare-fun res!879553 () Bool)

(assert (=> b!1325654 (=> (not res!879553) (not e!755839))))

(declare-datatypes ((List!30649 0))(
  ( (Nil!30646) (Cons!30645 (h!31863 (_ BitVec 64)) (t!44567 List!30649)) )
))
(declare-fun arrayNoDuplicates!0 (array!89483 (_ BitVec 32) List!30649) Bool)

(assert (=> b!1325654 (= res!879553 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30646))))

(assert (= (and start!111988 res!879556) b!1325648))

(assert (= (and b!1325648 res!879552) b!1325649))

(assert (= (and b!1325649 res!879555) b!1325654))

(assert (= (and b!1325654 res!879553) b!1325647))

(assert (= (and b!1325647 res!879554) b!1325651))

(assert (= (and b!1325652 condMapEmpty!56009) mapIsEmpty!56009))

(assert (= (and b!1325652 (not condMapEmpty!56009)) mapNonEmpty!56009))

(get-info :version)

(assert (= (and mapNonEmpty!56009 ((_ is ValueCellFull!17222) mapValue!56009)) b!1325650))

(assert (= (and b!1325652 ((_ is ValueCellFull!17222) mapDefault!56009)) b!1325653))

(assert (= start!111988 b!1325652))

(declare-fun m!1214837 () Bool)

(assert (=> b!1325651 m!1214837))

(assert (=> b!1325651 m!1214837))

(declare-fun m!1214839 () Bool)

(assert (=> b!1325651 m!1214839))

(declare-fun m!1214841 () Bool)

(assert (=> b!1325649 m!1214841))

(declare-fun m!1214843 () Bool)

(assert (=> start!111988 m!1214843))

(declare-fun m!1214845 () Bool)

(assert (=> start!111988 m!1214845))

(declare-fun m!1214847 () Bool)

(assert (=> start!111988 m!1214847))

(declare-fun m!1214849 () Bool)

(assert (=> mapNonEmpty!56009 m!1214849))

(declare-fun m!1214851 () Bool)

(assert (=> b!1325654 m!1214851))

(check-sat tp_is_empty!36241 (not b!1325651) (not b!1325654) (not b_next!30421) (not start!111988) b_and!48961 (not b!1325649) (not mapNonEmpty!56009))
(check-sat b_and!48961 (not b_next!30421))
