; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4448 () Bool)

(assert start!4448)

(declare-fun b_free!1219 () Bool)

(declare-fun b_next!1219 () Bool)

(assert (=> start!4448 (= b_free!1219 (not b_next!1219))))

(declare-fun tp!5095 () Bool)

(declare-fun b_and!2035 () Bool)

(assert (=> start!4448 (= tp!5095 b_and!2035)))

(declare-fun b!34447 () Bool)

(declare-fun res!20902 () Bool)

(declare-fun e!21835 () Bool)

(assert (=> b!34447 (=> (not res!20902) (not e!21835))))

(declare-datatypes ((array!2335 0))(
  ( (array!2336 (arr!1115 (Array (_ BitVec 32) (_ BitVec 64))) (size!1216 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2335)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34447 (= res!20902 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34448 () Bool)

(declare-fun res!20904 () Bool)

(assert (=> b!34448 (=> (not res!20904) (not e!21835))))

(declare-datatypes ((V!1923 0))(
  ( (V!1924 (val!813 Int)) )
))
(declare-datatypes ((ValueCell!587 0))(
  ( (ValueCellFull!587 (v!1907 V!1923)) (EmptyCell!587) )
))
(declare-datatypes ((array!2337 0))(
  ( (array!2338 (arr!1116 (Array (_ BitVec 32) ValueCell!587)) (size!1217 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2337)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!34448 (= res!20904 (and (= (size!1217 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1216 _keys!1833) (size!1217 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1906 () Bool)

(declare-fun mapRes!1906 () Bool)

(declare-fun tp!5094 () Bool)

(declare-fun e!21834 () Bool)

(assert (=> mapNonEmpty!1906 (= mapRes!1906 (and tp!5094 e!21834))))

(declare-fun mapKey!1906 () (_ BitVec 32))

(declare-fun mapRest!1906 () (Array (_ BitVec 32) ValueCell!587))

(declare-fun mapValue!1906 () ValueCell!587)

(assert (=> mapNonEmpty!1906 (= (arr!1116 _values!1501) (store mapRest!1906 mapKey!1906 mapValue!1906))))

(declare-fun b!34449 () Bool)

(assert (=> b!34449 (= e!21835 false)))

(declare-datatypes ((SeekEntryResult!151 0))(
  ( (MissingZero!151 (index!2726 (_ BitVec 32))) (Found!151 (index!2727 (_ BitVec 32))) (Intermediate!151 (undefined!963 Bool) (index!2728 (_ BitVec 32)) (x!6929 (_ BitVec 32))) (Undefined!151) (MissingVacant!151 (index!2729 (_ BitVec 32))) )
))
(declare-fun lt!12782 () SeekEntryResult!151)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2335 (_ BitVec 32)) SeekEntryResult!151)

(assert (=> b!34449 (= lt!12782 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34450 () Bool)

(declare-fun res!20901 () Bool)

(assert (=> b!34450 (=> (not res!20901) (not e!21835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2335 (_ BitVec 32)) Bool)

(assert (=> b!34450 (= res!20901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34451 () Bool)

(declare-fun res!20905 () Bool)

(assert (=> b!34451 (=> (not res!20905) (not e!21835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34451 (= res!20905 (validKeyInArray!0 k0!1304))))

(declare-fun res!20903 () Bool)

(assert (=> start!4448 (=> (not res!20903) (not e!21835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4448 (= res!20903 (validMask!0 mask!2294))))

(assert (=> start!4448 e!21835))

(assert (=> start!4448 true))

(assert (=> start!4448 tp!5095))

(declare-fun e!21836 () Bool)

(declare-fun array_inv!789 (array!2337) Bool)

(assert (=> start!4448 (and (array_inv!789 _values!1501) e!21836)))

(declare-fun array_inv!790 (array!2335) Bool)

(assert (=> start!4448 (array_inv!790 _keys!1833)))

(declare-fun tp_is_empty!1573 () Bool)

(assert (=> start!4448 tp_is_empty!1573))

(declare-fun b!34452 () Bool)

(declare-fun e!21837 () Bool)

(assert (=> b!34452 (= e!21836 (and e!21837 mapRes!1906))))

(declare-fun condMapEmpty!1906 () Bool)

(declare-fun mapDefault!1906 () ValueCell!587)

(assert (=> b!34452 (= condMapEmpty!1906 (= (arr!1116 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!587)) mapDefault!1906)))))

(declare-fun b!34453 () Bool)

(declare-fun res!20900 () Bool)

(assert (=> b!34453 (=> (not res!20900) (not e!21835))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1923)

(declare-fun minValue!1443 () V!1923)

(declare-datatypes ((tuple2!1316 0))(
  ( (tuple2!1317 (_1!669 (_ BitVec 64)) (_2!669 V!1923)) )
))
(declare-datatypes ((List!899 0))(
  ( (Nil!896) (Cons!895 (h!1462 tuple2!1316) (t!3597 List!899)) )
))
(declare-datatypes ((ListLongMap!881 0))(
  ( (ListLongMap!882 (toList!456 List!899)) )
))
(declare-fun contains!403 (ListLongMap!881 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!275 (array!2335 array!2337 (_ BitVec 32) (_ BitVec 32) V!1923 V!1923 (_ BitVec 32) Int) ListLongMap!881)

(assert (=> b!34453 (= res!20900 (not (contains!403 (getCurrentListMap!275 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34454 () Bool)

(assert (=> b!34454 (= e!21837 tp_is_empty!1573)))

(declare-fun mapIsEmpty!1906 () Bool)

(assert (=> mapIsEmpty!1906 mapRes!1906))

(declare-fun b!34455 () Bool)

(declare-fun res!20899 () Bool)

(assert (=> b!34455 (=> (not res!20899) (not e!21835))))

(declare-datatypes ((List!900 0))(
  ( (Nil!897) (Cons!896 (h!1463 (_ BitVec 64)) (t!3598 List!900)) )
))
(declare-fun arrayNoDuplicates!0 (array!2335 (_ BitVec 32) List!900) Bool)

(assert (=> b!34455 (= res!20899 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!897))))

(declare-fun b!34456 () Bool)

(assert (=> b!34456 (= e!21834 tp_is_empty!1573)))

(assert (= (and start!4448 res!20903) b!34448))

(assert (= (and b!34448 res!20904) b!34450))

(assert (= (and b!34450 res!20901) b!34455))

(assert (= (and b!34455 res!20899) b!34451))

(assert (= (and b!34451 res!20905) b!34453))

(assert (= (and b!34453 res!20900) b!34447))

(assert (= (and b!34447 res!20902) b!34449))

(assert (= (and b!34452 condMapEmpty!1906) mapIsEmpty!1906))

(assert (= (and b!34452 (not condMapEmpty!1906)) mapNonEmpty!1906))

(get-info :version)

(assert (= (and mapNonEmpty!1906 ((_ is ValueCellFull!587) mapValue!1906)) b!34456))

(assert (= (and b!34452 ((_ is ValueCellFull!587) mapDefault!1906)) b!34454))

(assert (= start!4448 b!34452))

(declare-fun m!27743 () Bool)

(assert (=> b!34453 m!27743))

(assert (=> b!34453 m!27743))

(declare-fun m!27745 () Bool)

(assert (=> b!34453 m!27745))

(declare-fun m!27747 () Bool)

(assert (=> start!4448 m!27747))

(declare-fun m!27749 () Bool)

(assert (=> start!4448 m!27749))

(declare-fun m!27751 () Bool)

(assert (=> start!4448 m!27751))

(declare-fun m!27753 () Bool)

(assert (=> b!34451 m!27753))

(declare-fun m!27755 () Bool)

(assert (=> b!34449 m!27755))

(declare-fun m!27757 () Bool)

(assert (=> b!34455 m!27757))

(declare-fun m!27759 () Bool)

(assert (=> mapNonEmpty!1906 m!27759))

(declare-fun m!27761 () Bool)

(assert (=> b!34447 m!27761))

(declare-fun m!27763 () Bool)

(assert (=> b!34450 m!27763))

(check-sat (not b!34449) (not b!34450) (not b!34447) (not mapNonEmpty!1906) (not b!34453) tp_is_empty!1573 (not start!4448) (not b!34455) b_and!2035 (not b_next!1219) (not b!34451))
(check-sat b_and!2035 (not b_next!1219))
