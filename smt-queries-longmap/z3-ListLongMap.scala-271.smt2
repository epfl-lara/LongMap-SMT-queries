; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4454 () Bool)

(assert start!4454)

(declare-fun b_free!1215 () Bool)

(declare-fun b_next!1215 () Bool)

(assert (=> start!4454 (= b_free!1215 (not b_next!1215))))

(declare-fun tp!5082 () Bool)

(declare-fun b_and!2037 () Bool)

(assert (=> start!4454 (= tp!5082 b_and!2037)))

(declare-fun b!34441 () Bool)

(declare-fun res!20892 () Bool)

(declare-fun e!21846 () Bool)

(assert (=> b!34441 (=> (not res!20892) (not e!21846))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34441 (= res!20892 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1900 () Bool)

(declare-fun mapRes!1900 () Bool)

(declare-fun tp!5083 () Bool)

(declare-fun e!21848 () Bool)

(assert (=> mapNonEmpty!1900 (= mapRes!1900 (and tp!5083 e!21848))))

(declare-datatypes ((V!1917 0))(
  ( (V!1918 (val!811 Int)) )
))
(declare-datatypes ((ValueCell!585 0))(
  ( (ValueCellFull!585 (v!1906 V!1917)) (EmptyCell!585) )
))
(declare-datatypes ((array!2355 0))(
  ( (array!2356 (arr!1125 (Array (_ BitVec 32) ValueCell!585)) (size!1226 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2355)

(declare-fun mapValue!1900 () ValueCell!585)

(declare-fun mapKey!1900 () (_ BitVec 32))

(declare-fun mapRest!1900 () (Array (_ BitVec 32) ValueCell!585))

(assert (=> mapNonEmpty!1900 (= (arr!1125 _values!1501) (store mapRest!1900 mapKey!1900 mapValue!1900))))

(declare-fun b!34442 () Bool)

(assert (=> b!34442 (= e!21846 false)))

(declare-datatypes ((array!2357 0))(
  ( (array!2358 (arr!1126 (Array (_ BitVec 32) (_ BitVec 64))) (size!1227 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2357)

(declare-datatypes ((SeekEntryResult!144 0))(
  ( (MissingZero!144 (index!2698 (_ BitVec 32))) (Found!144 (index!2699 (_ BitVec 32))) (Intermediate!144 (undefined!956 Bool) (index!2700 (_ BitVec 32)) (x!6914 (_ BitVec 32))) (Undefined!144) (MissingVacant!144 (index!2701 (_ BitVec 32))) )
))
(declare-fun lt!12780 () SeekEntryResult!144)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2357 (_ BitVec 32)) SeekEntryResult!144)

(assert (=> b!34442 (= lt!12780 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34443 () Bool)

(declare-fun res!20895 () Bool)

(assert (=> b!34443 (=> (not res!20895) (not e!21846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2357 (_ BitVec 32)) Bool)

(assert (=> b!34443 (= res!20895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34444 () Bool)

(declare-fun e!21847 () Bool)

(declare-fun e!21850 () Bool)

(assert (=> b!34444 (= e!21847 (and e!21850 mapRes!1900))))

(declare-fun condMapEmpty!1900 () Bool)

(declare-fun mapDefault!1900 () ValueCell!585)

(assert (=> b!34444 (= condMapEmpty!1900 (= (arr!1125 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!585)) mapDefault!1900)))))

(declare-fun b!34446 () Bool)

(declare-fun tp_is_empty!1569 () Bool)

(assert (=> b!34446 (= e!21848 tp_is_empty!1569)))

(declare-fun mapIsEmpty!1900 () Bool)

(assert (=> mapIsEmpty!1900 mapRes!1900))

(declare-fun b!34447 () Bool)

(declare-fun res!20889 () Bool)

(assert (=> b!34447 (=> (not res!20889) (not e!21846))))

(declare-datatypes ((List!907 0))(
  ( (Nil!904) (Cons!903 (h!1470 (_ BitVec 64)) (t!3612 List!907)) )
))
(declare-fun arrayNoDuplicates!0 (array!2357 (_ BitVec 32) List!907) Bool)

(assert (=> b!34447 (= res!20889 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!904))))

(declare-fun b!34448 () Bool)

(assert (=> b!34448 (= e!21850 tp_is_empty!1569)))

(declare-fun b!34445 () Bool)

(declare-fun res!20894 () Bool)

(assert (=> b!34445 (=> (not res!20894) (not e!21846))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1917)

(declare-fun minValue!1443 () V!1917)

(declare-datatypes ((tuple2!1320 0))(
  ( (tuple2!1321 (_1!671 (_ BitVec 64)) (_2!671 V!1917)) )
))
(declare-datatypes ((List!908 0))(
  ( (Nil!905) (Cons!904 (h!1471 tuple2!1320) (t!3613 List!908)) )
))
(declare-datatypes ((ListLongMap!897 0))(
  ( (ListLongMap!898 (toList!464 List!908)) )
))
(declare-fun contains!410 (ListLongMap!897 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!288 (array!2357 array!2355 (_ BitVec 32) (_ BitVec 32) V!1917 V!1917 (_ BitVec 32) Int) ListLongMap!897)

(assert (=> b!34445 (= res!20894 (not (contains!410 (getCurrentListMap!288 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!20891 () Bool)

(assert (=> start!4454 (=> (not res!20891) (not e!21846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4454 (= res!20891 (validMask!0 mask!2294))))

(assert (=> start!4454 e!21846))

(assert (=> start!4454 true))

(assert (=> start!4454 tp!5082))

(declare-fun array_inv!795 (array!2355) Bool)

(assert (=> start!4454 (and (array_inv!795 _values!1501) e!21847)))

(declare-fun array_inv!796 (array!2357) Bool)

(assert (=> start!4454 (array_inv!796 _keys!1833)))

(assert (=> start!4454 tp_is_empty!1569))

(declare-fun b!34449 () Bool)

(declare-fun res!20893 () Bool)

(assert (=> b!34449 (=> (not res!20893) (not e!21846))))

(declare-fun arrayContainsKey!0 (array!2357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34449 (= res!20893 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34450 () Bool)

(declare-fun res!20890 () Bool)

(assert (=> b!34450 (=> (not res!20890) (not e!21846))))

(assert (=> b!34450 (= res!20890 (and (= (size!1226 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1227 _keys!1833) (size!1226 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!4454 res!20891) b!34450))

(assert (= (and b!34450 res!20890) b!34443))

(assert (= (and b!34443 res!20895) b!34447))

(assert (= (and b!34447 res!20889) b!34441))

(assert (= (and b!34441 res!20892) b!34445))

(assert (= (and b!34445 res!20894) b!34449))

(assert (= (and b!34449 res!20893) b!34442))

(assert (= (and b!34444 condMapEmpty!1900) mapIsEmpty!1900))

(assert (= (and b!34444 (not condMapEmpty!1900)) mapNonEmpty!1900))

(get-info :version)

(assert (= (and mapNonEmpty!1900 ((_ is ValueCellFull!585) mapValue!1900)) b!34446))

(assert (= (and b!34444 ((_ is ValueCellFull!585) mapDefault!1900)) b!34448))

(assert (= start!4454 b!34444))

(declare-fun m!27769 () Bool)

(assert (=> start!4454 m!27769))

(declare-fun m!27771 () Bool)

(assert (=> start!4454 m!27771))

(declare-fun m!27773 () Bool)

(assert (=> start!4454 m!27773))

(declare-fun m!27775 () Bool)

(assert (=> b!34443 m!27775))

(declare-fun m!27777 () Bool)

(assert (=> b!34445 m!27777))

(assert (=> b!34445 m!27777))

(declare-fun m!27779 () Bool)

(assert (=> b!34445 m!27779))

(declare-fun m!27781 () Bool)

(assert (=> b!34447 m!27781))

(declare-fun m!27783 () Bool)

(assert (=> b!34441 m!27783))

(declare-fun m!27785 () Bool)

(assert (=> b!34442 m!27785))

(declare-fun m!27787 () Bool)

(assert (=> mapNonEmpty!1900 m!27787))

(declare-fun m!27789 () Bool)

(assert (=> b!34449 m!27789))

(check-sat (not b!34442) (not b!34445) (not start!4454) b_and!2037 tp_is_empty!1569 (not b!34441) (not b!34449) (not b_next!1215) (not b!34447) (not mapNonEmpty!1900) (not b!34443))
(check-sat b_and!2037 (not b_next!1215))
