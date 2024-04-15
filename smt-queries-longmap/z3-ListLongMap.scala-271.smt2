; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4442 () Bool)

(assert start!4442)

(declare-fun b_free!1213 () Bool)

(declare-fun b_next!1213 () Bool)

(assert (=> start!4442 (= b_free!1213 (not b_next!1213))))

(declare-fun tp!5076 () Bool)

(declare-fun b_and!2029 () Bool)

(assert (=> start!4442 (= tp!5076 b_and!2029)))

(declare-fun b!34357 () Bool)

(declare-fun res!20839 () Bool)

(declare-fun e!21792 () Bool)

(assert (=> b!34357 (=> (not res!20839) (not e!21792))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34357 (= res!20839 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1897 () Bool)

(declare-fun mapRes!1897 () Bool)

(assert (=> mapIsEmpty!1897 mapRes!1897))

(declare-fun mapNonEmpty!1897 () Bool)

(declare-fun tp!5077 () Bool)

(declare-fun e!21790 () Bool)

(assert (=> mapNonEmpty!1897 (= mapRes!1897 (and tp!5077 e!21790))))

(declare-datatypes ((V!1915 0))(
  ( (V!1916 (val!810 Int)) )
))
(declare-datatypes ((ValueCell!584 0))(
  ( (ValueCellFull!584 (v!1904 V!1915)) (EmptyCell!584) )
))
(declare-datatypes ((array!2323 0))(
  ( (array!2324 (arr!1109 (Array (_ BitVec 32) ValueCell!584)) (size!1210 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2323)

(declare-fun mapKey!1897 () (_ BitVec 32))

(declare-fun mapValue!1897 () ValueCell!584)

(declare-fun mapRest!1897 () (Array (_ BitVec 32) ValueCell!584))

(assert (=> mapNonEmpty!1897 (= (arr!1109 _values!1501) (store mapRest!1897 mapKey!1897 mapValue!1897))))

(declare-fun b!34358 () Bool)

(declare-fun res!20842 () Bool)

(assert (=> b!34358 (=> (not res!20842) (not e!21792))))

(declare-datatypes ((array!2325 0))(
  ( (array!2326 (arr!1110 (Array (_ BitVec 32) (_ BitVec 64))) (size!1211 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2325)

(declare-datatypes ((List!895 0))(
  ( (Nil!892) (Cons!891 (h!1458 (_ BitVec 64)) (t!3593 List!895)) )
))
(declare-fun arrayNoDuplicates!0 (array!2325 (_ BitVec 32) List!895) Bool)

(assert (=> b!34358 (= res!20842 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!892))))

(declare-fun b!34359 () Bool)

(declare-fun tp_is_empty!1567 () Bool)

(assert (=> b!34359 (= e!21790 tp_is_empty!1567)))

(declare-fun b!34360 () Bool)

(assert (=> b!34360 (= e!21792 false)))

(declare-datatypes ((SeekEntryResult!150 0))(
  ( (MissingZero!150 (index!2722 (_ BitVec 32))) (Found!150 (index!2723 (_ BitVec 32))) (Intermediate!150 (undefined!962 Bool) (index!2724 (_ BitVec 32)) (x!6920 (_ BitVec 32))) (Undefined!150) (MissingVacant!150 (index!2725 (_ BitVec 32))) )
))
(declare-fun lt!12773 () SeekEntryResult!150)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2325 (_ BitVec 32)) SeekEntryResult!150)

(assert (=> b!34360 (= lt!12773 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun res!20837 () Bool)

(assert (=> start!4442 (=> (not res!20837) (not e!21792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4442 (= res!20837 (validMask!0 mask!2294))))

(assert (=> start!4442 e!21792))

(assert (=> start!4442 true))

(assert (=> start!4442 tp!5076))

(declare-fun e!21788 () Bool)

(declare-fun array_inv!787 (array!2323) Bool)

(assert (=> start!4442 (and (array_inv!787 _values!1501) e!21788)))

(declare-fun array_inv!788 (array!2325) Bool)

(assert (=> start!4442 (array_inv!788 _keys!1833)))

(assert (=> start!4442 tp_is_empty!1567))

(declare-fun b!34361 () Bool)

(declare-fun res!20836 () Bool)

(assert (=> b!34361 (=> (not res!20836) (not e!21792))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1915)

(declare-fun minValue!1443 () V!1915)

(declare-datatypes ((tuple2!1312 0))(
  ( (tuple2!1313 (_1!667 (_ BitVec 64)) (_2!667 V!1915)) )
))
(declare-datatypes ((List!896 0))(
  ( (Nil!893) (Cons!892 (h!1459 tuple2!1312) (t!3594 List!896)) )
))
(declare-datatypes ((ListLongMap!877 0))(
  ( (ListLongMap!878 (toList!454 List!896)) )
))
(declare-fun contains!401 (ListLongMap!877 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!273 (array!2325 array!2323 (_ BitVec 32) (_ BitVec 32) V!1915 V!1915 (_ BitVec 32) Int) ListLongMap!877)

(assert (=> b!34361 (= res!20836 (not (contains!401 (getCurrentListMap!273 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34362 () Bool)

(declare-fun res!20841 () Bool)

(assert (=> b!34362 (=> (not res!20841) (not e!21792))))

(declare-fun arrayContainsKey!0 (array!2325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34362 (= res!20841 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34363 () Bool)

(declare-fun e!21791 () Bool)

(assert (=> b!34363 (= e!21791 tp_is_empty!1567)))

(declare-fun b!34364 () Bool)

(assert (=> b!34364 (= e!21788 (and e!21791 mapRes!1897))))

(declare-fun condMapEmpty!1897 () Bool)

(declare-fun mapDefault!1897 () ValueCell!584)

(assert (=> b!34364 (= condMapEmpty!1897 (= (arr!1109 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!584)) mapDefault!1897)))))

(declare-fun b!34365 () Bool)

(declare-fun res!20840 () Bool)

(assert (=> b!34365 (=> (not res!20840) (not e!21792))))

(assert (=> b!34365 (= res!20840 (and (= (size!1210 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1211 _keys!1833) (size!1210 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34366 () Bool)

(declare-fun res!20838 () Bool)

(assert (=> b!34366 (=> (not res!20838) (not e!21792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2325 (_ BitVec 32)) Bool)

(assert (=> b!34366 (= res!20838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!4442 res!20837) b!34365))

(assert (= (and b!34365 res!20840) b!34366))

(assert (= (and b!34366 res!20838) b!34358))

(assert (= (and b!34358 res!20842) b!34357))

(assert (= (and b!34357 res!20839) b!34361))

(assert (= (and b!34361 res!20836) b!34362))

(assert (= (and b!34362 res!20841) b!34360))

(assert (= (and b!34364 condMapEmpty!1897) mapIsEmpty!1897))

(assert (= (and b!34364 (not condMapEmpty!1897)) mapNonEmpty!1897))

(get-info :version)

(assert (= (and mapNonEmpty!1897 ((_ is ValueCellFull!584) mapValue!1897)) b!34359))

(assert (= (and b!34364 ((_ is ValueCellFull!584) mapDefault!1897)) b!34363))

(assert (= start!4442 b!34364))

(declare-fun m!27677 () Bool)

(assert (=> start!4442 m!27677))

(declare-fun m!27679 () Bool)

(assert (=> start!4442 m!27679))

(declare-fun m!27681 () Bool)

(assert (=> start!4442 m!27681))

(declare-fun m!27683 () Bool)

(assert (=> b!34362 m!27683))

(declare-fun m!27685 () Bool)

(assert (=> b!34357 m!27685))

(declare-fun m!27687 () Bool)

(assert (=> b!34358 m!27687))

(declare-fun m!27689 () Bool)

(assert (=> b!34361 m!27689))

(assert (=> b!34361 m!27689))

(declare-fun m!27691 () Bool)

(assert (=> b!34361 m!27691))

(declare-fun m!27693 () Bool)

(assert (=> b!34360 m!27693))

(declare-fun m!27695 () Bool)

(assert (=> b!34366 m!27695))

(declare-fun m!27697 () Bool)

(assert (=> mapNonEmpty!1897 m!27697))

(check-sat tp_is_empty!1567 (not b!34357) (not b_next!1213) (not mapNonEmpty!1897) (not b!34366) (not b!34360) (not b!34362) (not start!4442) b_and!2029 (not b!34358) (not b!34361))
(check-sat b_and!2029 (not b_next!1213))
