; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4272 () Bool)

(assert start!4272)

(declare-fun b_free!1141 () Bool)

(declare-fun b_next!1141 () Bool)

(assert (=> start!4272 (= b_free!1141 (not b_next!1141))))

(declare-fun tp!4849 () Bool)

(declare-fun b_and!1945 () Bool)

(assert (=> start!4272 (= tp!4849 b_and!1945)))

(declare-fun res!19844 () Bool)

(declare-fun e!20753 () Bool)

(assert (=> start!4272 (=> (not res!19844) (not e!20753))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4272 (= res!19844 (validMask!0 mask!2294))))

(assert (=> start!4272 e!20753))

(assert (=> start!4272 true))

(assert (=> start!4272 tp!4849))

(declare-datatypes ((V!1819 0))(
  ( (V!1820 (val!774 Int)) )
))
(declare-datatypes ((ValueCell!548 0))(
  ( (ValueCellFull!548 (v!1865 V!1819)) (EmptyCell!548) )
))
(declare-datatypes ((array!2191 0))(
  ( (array!2192 (arr!1047 (Array (_ BitVec 32) ValueCell!548)) (size!1148 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2191)

(declare-fun e!20751 () Bool)

(declare-fun array_inv!719 (array!2191) Bool)

(assert (=> start!4272 (and (array_inv!719 _values!1501) e!20751)))

(declare-datatypes ((array!2193 0))(
  ( (array!2194 (arr!1048 (Array (_ BitVec 32) (_ BitVec 64))) (size!1149 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2193)

(declare-fun array_inv!720 (array!2193) Bool)

(assert (=> start!4272 (array_inv!720 _keys!1833)))

(declare-fun tp_is_empty!1495 () Bool)

(assert (=> start!4272 tp_is_empty!1495))

(declare-fun b!32666 () Bool)

(declare-fun e!20750 () Bool)

(assert (=> b!32666 (= e!20750 tp_is_empty!1495)))

(declare-fun b!32667 () Bool)

(declare-fun e!20755 () Bool)

(assert (=> b!32667 (= e!20755 tp_is_empty!1495)))

(declare-fun b!32668 () Bool)

(declare-fun e!20752 () Bool)

(assert (=> b!32668 (= e!20752 (not (= (size!1149 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((tuple2!1248 0))(
  ( (tuple2!1249 (_1!635 (_ BitVec 64)) (_2!635 V!1819)) )
))
(declare-datatypes ((List!843 0))(
  ( (Nil!840) (Cons!839 (h!1406 tuple2!1248) (t!3534 List!843)) )
))
(declare-datatypes ((ListLongMap!819 0))(
  ( (ListLongMap!820 (toList!425 List!843)) )
))
(declare-fun lt!11832 () ListLongMap!819)

(declare-fun lt!11830 () (_ BitVec 32))

(declare-fun contains!369 (ListLongMap!819 (_ BitVec 64)) Bool)

(assert (=> b!32668 (contains!369 lt!11832 (select (arr!1048 _keys!1833) lt!11830))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!727 0))(
  ( (Unit!728) )
))
(declare-fun lt!11831 () Unit!727)

(declare-fun zeroValue!1443 () V!1819)

(declare-fun minValue!1443 () V!1819)

(declare-fun lemmaValidKeyInArrayIsInListMap!49 (array!2193 array!2191 (_ BitVec 32) (_ BitVec 32) V!1819 V!1819 (_ BitVec 32) Int) Unit!727)

(assert (=> b!32668 (= lt!11831 (lemmaValidKeyInArrayIsInListMap!49 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11830 defaultEntry!1504))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2193 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32668 (= lt!11830 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1777 () Bool)

(declare-fun mapRes!1777 () Bool)

(assert (=> mapIsEmpty!1777 mapRes!1777))

(declare-fun b!32669 () Bool)

(declare-fun res!19845 () Bool)

(assert (=> b!32669 (=> (not res!19845) (not e!20752))))

(declare-fun arrayContainsKey!0 (array!2193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32669 (= res!19845 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32670 () Bool)

(declare-fun res!19841 () Bool)

(assert (=> b!32670 (=> (not res!19841) (not e!20753))))

(declare-datatypes ((List!844 0))(
  ( (Nil!841) (Cons!840 (h!1407 (_ BitVec 64)) (t!3535 List!844)) )
))
(declare-fun arrayNoDuplicates!0 (array!2193 (_ BitVec 32) List!844) Bool)

(assert (=> b!32670 (= res!19841 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!841))))

(declare-fun b!32671 () Bool)

(declare-fun res!19846 () Bool)

(assert (=> b!32671 (=> (not res!19846) (not e!20753))))

(assert (=> b!32671 (= res!19846 (and (= (size!1148 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1149 _keys!1833) (size!1148 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1777 () Bool)

(declare-fun tp!4848 () Bool)

(assert (=> mapNonEmpty!1777 (= mapRes!1777 (and tp!4848 e!20755))))

(declare-fun mapKey!1777 () (_ BitVec 32))

(declare-fun mapValue!1777 () ValueCell!548)

(declare-fun mapRest!1777 () (Array (_ BitVec 32) ValueCell!548))

(assert (=> mapNonEmpty!1777 (= (arr!1047 _values!1501) (store mapRest!1777 mapKey!1777 mapValue!1777))))

(declare-fun b!32672 () Bool)

(assert (=> b!32672 (= e!20753 e!20752)))

(declare-fun res!19843 () Bool)

(assert (=> b!32672 (=> (not res!19843) (not e!20752))))

(assert (=> b!32672 (= res!19843 (not (contains!369 lt!11832 k0!1304)))))

(declare-fun getCurrentListMap!250 (array!2193 array!2191 (_ BitVec 32) (_ BitVec 32) V!1819 V!1819 (_ BitVec 32) Int) ListLongMap!819)

(assert (=> b!32672 (= lt!11832 (getCurrentListMap!250 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32673 () Bool)

(declare-fun res!19842 () Bool)

(assert (=> b!32673 (=> (not res!19842) (not e!20753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2193 (_ BitVec 32)) Bool)

(assert (=> b!32673 (= res!19842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32674 () Bool)

(declare-fun res!19847 () Bool)

(assert (=> b!32674 (=> (not res!19847) (not e!20753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32674 (= res!19847 (validKeyInArray!0 k0!1304))))

(declare-fun b!32675 () Bool)

(assert (=> b!32675 (= e!20751 (and e!20750 mapRes!1777))))

(declare-fun condMapEmpty!1777 () Bool)

(declare-fun mapDefault!1777 () ValueCell!548)

(assert (=> b!32675 (= condMapEmpty!1777 (= (arr!1047 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!548)) mapDefault!1777)))))

(assert (= (and start!4272 res!19844) b!32671))

(assert (= (and b!32671 res!19846) b!32673))

(assert (= (and b!32673 res!19842) b!32670))

(assert (= (and b!32670 res!19841) b!32674))

(assert (= (and b!32674 res!19847) b!32672))

(assert (= (and b!32672 res!19843) b!32669))

(assert (= (and b!32669 res!19845) b!32668))

(assert (= (and b!32675 condMapEmpty!1777) mapIsEmpty!1777))

(assert (= (and b!32675 (not condMapEmpty!1777)) mapNonEmpty!1777))

(get-info :version)

(assert (= (and mapNonEmpty!1777 ((_ is ValueCellFull!548) mapValue!1777)) b!32667))

(assert (= (and b!32675 ((_ is ValueCellFull!548) mapDefault!1777)) b!32666))

(assert (= start!4272 b!32675))

(declare-fun m!26037 () Bool)

(assert (=> b!32668 m!26037))

(assert (=> b!32668 m!26037))

(declare-fun m!26039 () Bool)

(assert (=> b!32668 m!26039))

(declare-fun m!26041 () Bool)

(assert (=> b!32668 m!26041))

(declare-fun m!26043 () Bool)

(assert (=> b!32668 m!26043))

(declare-fun m!26045 () Bool)

(assert (=> b!32673 m!26045))

(declare-fun m!26047 () Bool)

(assert (=> mapNonEmpty!1777 m!26047))

(declare-fun m!26049 () Bool)

(assert (=> b!32670 m!26049))

(declare-fun m!26051 () Bool)

(assert (=> b!32674 m!26051))

(declare-fun m!26053 () Bool)

(assert (=> start!4272 m!26053))

(declare-fun m!26055 () Bool)

(assert (=> start!4272 m!26055))

(declare-fun m!26057 () Bool)

(assert (=> start!4272 m!26057))

(declare-fun m!26059 () Bool)

(assert (=> b!32669 m!26059))

(declare-fun m!26061 () Bool)

(assert (=> b!32672 m!26061))

(declare-fun m!26063 () Bool)

(assert (=> b!32672 m!26063))

(check-sat (not b!32668) (not b_next!1141) tp_is_empty!1495 (not b!32673) b_and!1945 (not mapNonEmpty!1777) (not b!32669) (not b!32674) (not b!32672) (not b!32670) (not start!4272))
(check-sat b_and!1945 (not b_next!1141))
