; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4466 () Bool)

(assert start!4466)

(declare-fun b_free!1227 () Bool)

(declare-fun b_next!1227 () Bool)

(assert (=> start!4466 (= b_free!1227 (not b_next!1227))))

(declare-fun tp!5118 () Bool)

(declare-fun b_and!2049 () Bool)

(assert (=> start!4466 (= tp!5118 b_and!2049)))

(declare-fun b!34621 () Bool)

(declare-fun e!21938 () Bool)

(declare-fun tp_is_empty!1581 () Bool)

(assert (=> b!34621 (= e!21938 tp_is_empty!1581)))

(declare-fun b!34622 () Bool)

(declare-fun e!21940 () Bool)

(assert (=> b!34622 (= e!21940 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((array!2379 0))(
  ( (array!2380 (arr!1137 (Array (_ BitVec 32) (_ BitVec 64))) (size!1238 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2379)

(declare-datatypes ((SeekEntryResult!148 0))(
  ( (MissingZero!148 (index!2714 (_ BitVec 32))) (Found!148 (index!2715 (_ BitVec 32))) (Intermediate!148 (undefined!960 Bool) (index!2716 (_ BitVec 32)) (x!6934 (_ BitVec 32))) (Undefined!148) (MissingVacant!148 (index!2717 (_ BitVec 32))) )
))
(declare-fun lt!12798 () SeekEntryResult!148)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2379 (_ BitVec 32)) SeekEntryResult!148)

(assert (=> b!34622 (= lt!12798 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun res!21020 () Bool)

(assert (=> start!4466 (=> (not res!21020) (not e!21940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4466 (= res!21020 (validMask!0 mask!2294))))

(assert (=> start!4466 e!21940))

(assert (=> start!4466 true))

(assert (=> start!4466 tp!5118))

(declare-datatypes ((V!1933 0))(
  ( (V!1934 (val!817 Int)) )
))
(declare-datatypes ((ValueCell!591 0))(
  ( (ValueCellFull!591 (v!1912 V!1933)) (EmptyCell!591) )
))
(declare-datatypes ((array!2381 0))(
  ( (array!2382 (arr!1138 (Array (_ BitVec 32) ValueCell!591)) (size!1239 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2381)

(declare-fun e!21937 () Bool)

(declare-fun array_inv!805 (array!2381) Bool)

(assert (=> start!4466 (and (array_inv!805 _values!1501) e!21937)))

(declare-fun array_inv!806 (array!2379) Bool)

(assert (=> start!4466 (array_inv!806 _keys!1833)))

(assert (=> start!4466 tp_is_empty!1581))

(declare-fun b!34623 () Bool)

(declare-fun e!21936 () Bool)

(declare-fun mapRes!1918 () Bool)

(assert (=> b!34623 (= e!21937 (and e!21936 mapRes!1918))))

(declare-fun condMapEmpty!1918 () Bool)

(declare-fun mapDefault!1918 () ValueCell!591)

(assert (=> b!34623 (= condMapEmpty!1918 (= (arr!1138 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!591)) mapDefault!1918)))))

(declare-fun b!34624 () Bool)

(declare-fun res!21018 () Bool)

(assert (=> b!34624 (=> (not res!21018) (not e!21940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34624 (= res!21018 (validKeyInArray!0 k0!1304))))

(declare-fun b!34625 () Bool)

(declare-fun res!21021 () Bool)

(assert (=> b!34625 (=> (not res!21021) (not e!21940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2379 (_ BitVec 32)) Bool)

(assert (=> b!34625 (= res!21021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1918 () Bool)

(assert (=> mapIsEmpty!1918 mapRes!1918))

(declare-fun b!34626 () Bool)

(declare-fun res!21019 () Bool)

(assert (=> b!34626 (=> (not res!21019) (not e!21940))))

(declare-datatypes ((List!915 0))(
  ( (Nil!912) (Cons!911 (h!1478 (_ BitVec 64)) (t!3620 List!915)) )
))
(declare-fun arrayNoDuplicates!0 (array!2379 (_ BitVec 32) List!915) Bool)

(assert (=> b!34626 (= res!21019 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!912))))

(declare-fun b!34627 () Bool)

(declare-fun res!21017 () Bool)

(assert (=> b!34627 (=> (not res!21017) (not e!21940))))

(declare-fun arrayContainsKey!0 (array!2379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34627 (= res!21017 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!1918 () Bool)

(declare-fun tp!5119 () Bool)

(assert (=> mapNonEmpty!1918 (= mapRes!1918 (and tp!5119 e!21938))))

(declare-fun mapRest!1918 () (Array (_ BitVec 32) ValueCell!591))

(declare-fun mapValue!1918 () ValueCell!591)

(declare-fun mapKey!1918 () (_ BitVec 32))

(assert (=> mapNonEmpty!1918 (= (arr!1138 _values!1501) (store mapRest!1918 mapKey!1918 mapValue!1918))))

(declare-fun b!34628 () Bool)

(declare-fun res!21016 () Bool)

(assert (=> b!34628 (=> (not res!21016) (not e!21940))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!34628 (= res!21016 (and (= (size!1239 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1238 _keys!1833) (size!1239 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34629 () Bool)

(assert (=> b!34629 (= e!21936 tp_is_empty!1581)))

(declare-fun b!34630 () Bool)

(declare-fun res!21015 () Bool)

(assert (=> b!34630 (=> (not res!21015) (not e!21940))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1933)

(declare-fun minValue!1443 () V!1933)

(declare-datatypes ((tuple2!1328 0))(
  ( (tuple2!1329 (_1!675 (_ BitVec 64)) (_2!675 V!1933)) )
))
(declare-datatypes ((List!916 0))(
  ( (Nil!913) (Cons!912 (h!1479 tuple2!1328) (t!3621 List!916)) )
))
(declare-datatypes ((ListLongMap!905 0))(
  ( (ListLongMap!906 (toList!468 List!916)) )
))
(declare-fun contains!414 (ListLongMap!905 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!292 (array!2379 array!2381 (_ BitVec 32) (_ BitVec 32) V!1933 V!1933 (_ BitVec 32) Int) ListLongMap!905)

(assert (=> b!34630 (= res!21015 (not (contains!414 (getCurrentListMap!292 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(assert (= (and start!4466 res!21020) b!34628))

(assert (= (and b!34628 res!21016) b!34625))

(assert (= (and b!34625 res!21021) b!34626))

(assert (= (and b!34626 res!21019) b!34624))

(assert (= (and b!34624 res!21018) b!34630))

(assert (= (and b!34630 res!21015) b!34627))

(assert (= (and b!34627 res!21017) b!34622))

(assert (= (and b!34623 condMapEmpty!1918) mapIsEmpty!1918))

(assert (= (and b!34623 (not condMapEmpty!1918)) mapNonEmpty!1918))

(get-info :version)

(assert (= (and mapNonEmpty!1918 ((_ is ValueCellFull!591) mapValue!1918)) b!34621))

(assert (= (and b!34623 ((_ is ValueCellFull!591) mapDefault!1918)) b!34629))

(assert (= start!4466 b!34623))

(declare-fun m!27901 () Bool)

(assert (=> start!4466 m!27901))

(declare-fun m!27903 () Bool)

(assert (=> start!4466 m!27903))

(declare-fun m!27905 () Bool)

(assert (=> start!4466 m!27905))

(declare-fun m!27907 () Bool)

(assert (=> b!34624 m!27907))

(declare-fun m!27909 () Bool)

(assert (=> b!34626 m!27909))

(declare-fun m!27911 () Bool)

(assert (=> b!34630 m!27911))

(assert (=> b!34630 m!27911))

(declare-fun m!27913 () Bool)

(assert (=> b!34630 m!27913))

(declare-fun m!27915 () Bool)

(assert (=> b!34627 m!27915))

(declare-fun m!27917 () Bool)

(assert (=> mapNonEmpty!1918 m!27917))

(declare-fun m!27919 () Bool)

(assert (=> b!34625 m!27919))

(declare-fun m!27921 () Bool)

(assert (=> b!34622 m!27921))

(check-sat tp_is_empty!1581 (not b!34626) (not b!34624) (not b!34622) (not start!4466) (not mapNonEmpty!1918) (not b!34627) (not b!34625) b_and!2049 (not b_next!1227) (not b!34630))
(check-sat b_and!2049 (not b_next!1227))
