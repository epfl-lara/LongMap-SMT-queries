; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35646 () Bool)

(assert start!35646)

(declare-fun b_free!7915 () Bool)

(declare-fun b_next!7915 () Bool)

(assert (=> start!35646 (= b_free!7915 (not b_next!7915))))

(declare-fun tp!27729 () Bool)

(declare-fun b_and!15171 () Bool)

(assert (=> start!35646 (= tp!27729 b_and!15171)))

(declare-fun mapIsEmpty!13677 () Bool)

(declare-fun mapRes!13677 () Bool)

(assert (=> mapIsEmpty!13677 mapRes!13677))

(declare-fun b!358098 () Bool)

(declare-fun e!219182 () Bool)

(declare-fun e!219187 () Bool)

(assert (=> b!358098 (= e!219182 (not e!219187))))

(declare-fun res!199051 () Bool)

(assert (=> b!358098 (=> res!199051 e!219187)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19776 0))(
  ( (array!19777 (arr!9381 (Array (_ BitVec 32) (_ BitVec 64))) (size!9733 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19776)

(assert (=> b!358098 (= res!199051 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9733 _keys!1456))))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358098 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11795 0))(
  ( (V!11796 (val!4101 Int)) )
))
(declare-fun minValue!1150 () V!11795)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3713 0))(
  ( (ValueCellFull!3713 (v!6296 V!11795)) (EmptyCell!3713) )
))
(declare-datatypes ((array!19778 0))(
  ( (array!19779 (arr!9382 (Array (_ BitVec 32) ValueCell!3713)) (size!9734 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19778)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11795)

(declare-datatypes ((Unit!11029 0))(
  ( (Unit!11030) )
))
(declare-fun lt!166177 () Unit!11029)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!40 (array!19776 array!19778 (_ BitVec 32) (_ BitVec 32) V!11795 V!11795 (_ BitVec 64) (_ BitVec 32)) Unit!11029)

(assert (=> b!358098 (= lt!166177 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!40 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!358099 () Bool)

(declare-fun res!199046 () Bool)

(assert (=> b!358099 (=> (not res!199046) (not e!219182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358099 (= res!199046 (validKeyInArray!0 k0!1077))))

(declare-fun b!358100 () Bool)

(declare-fun e!219186 () Bool)

(declare-fun tp_is_empty!8113 () Bool)

(assert (=> b!358100 (= e!219186 tp_is_empty!8113)))

(declare-fun b!358101 () Bool)

(declare-fun e!219184 () Bool)

(assert (=> b!358101 (= e!219184 (and e!219186 mapRes!13677))))

(declare-fun condMapEmpty!13677 () Bool)

(declare-fun mapDefault!13677 () ValueCell!3713)

(assert (=> b!358101 (= condMapEmpty!13677 (= (arr!9382 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3713)) mapDefault!13677)))))

(declare-fun b!358102 () Bool)

(declare-fun res!199050 () Bool)

(assert (=> b!358102 (=> (not res!199050) (not e!219182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19776 (_ BitVec 32)) Bool)

(assert (=> b!358102 (= res!199050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358103 () Bool)

(declare-fun res!199043 () Bool)

(assert (=> b!358103 (=> (not res!199043) (not e!219182))))

(assert (=> b!358103 (= res!199043 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!358104 () Bool)

(declare-fun res!199049 () Bool)

(assert (=> b!358104 (=> (not res!199049) (not e!219182))))

(declare-datatypes ((List!5329 0))(
  ( (Nil!5326) (Cons!5325 (h!6181 (_ BitVec 64)) (t!10471 List!5329)) )
))
(declare-fun arrayNoDuplicates!0 (array!19776 (_ BitVec 32) List!5329) Bool)

(assert (=> b!358104 (= res!199049 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5326))))

(declare-fun b!358105 () Bool)

(declare-fun res!199047 () Bool)

(assert (=> b!358105 (=> (not res!199047) (not e!219182))))

(assert (=> b!358105 (= res!199047 (and (= (size!9734 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9733 _keys!1456) (size!9734 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13677 () Bool)

(declare-fun tp!27728 () Bool)

(declare-fun e!219183 () Bool)

(assert (=> mapNonEmpty!13677 (= mapRes!13677 (and tp!27728 e!219183))))

(declare-fun mapValue!13677 () ValueCell!3713)

(declare-fun mapKey!13677 () (_ BitVec 32))

(declare-fun mapRest!13677 () (Array (_ BitVec 32) ValueCell!3713))

(assert (=> mapNonEmpty!13677 (= (arr!9382 _values!1208) (store mapRest!13677 mapKey!13677 mapValue!13677))))

(declare-fun b!358106 () Bool)

(assert (=> b!358106 (= e!219183 tp_is_empty!8113)))

(declare-fun b!358107 () Bool)

(assert (=> b!358107 (= e!219187 (bvsle #b00000000000000000000000000000000 (size!9733 _keys!1456)))))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5646 0))(
  ( (tuple2!5647 (_1!2834 (_ BitVec 64)) (_2!2834 V!11795)) )
))
(declare-datatypes ((List!5330 0))(
  ( (Nil!5327) (Cons!5326 (h!6182 tuple2!5646) (t!10472 List!5330)) )
))
(declare-datatypes ((ListLongMap!4561 0))(
  ( (ListLongMap!4562 (toList!2296 List!5330)) )
))
(declare-fun contains!2395 (ListLongMap!4561 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1824 (array!19776 array!19778 (_ BitVec 32) (_ BitVec 32) V!11795 V!11795 (_ BitVec 32) Int) ListLongMap!4561)

(assert (=> b!358107 (contains!2395 (getCurrentListMap!1824 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!166178 () Unit!11029)

(declare-fun lemmaArrayContainsKeyThenInListMap!363 (array!19776 array!19778 (_ BitVec 32) (_ BitVec 32) V!11795 V!11795 (_ BitVec 64) (_ BitVec 32) Int) Unit!11029)

(assert (=> b!358107 (= lt!166178 (lemmaArrayContainsKeyThenInListMap!363 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!358108 () Bool)

(declare-fun res!199048 () Bool)

(assert (=> b!358108 (=> (not res!199048) (not e!219182))))

(assert (=> b!358108 (= res!199048 (not (= (select (arr!9381 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!358109 () Bool)

(declare-fun res!199045 () Bool)

(assert (=> b!358109 (=> (not res!199045) (not e!219182))))

(assert (=> b!358109 (= res!199045 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9733 _keys!1456))))))

(declare-fun res!199044 () Bool)

(assert (=> start!35646 (=> (not res!199044) (not e!219182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35646 (= res!199044 (validMask!0 mask!1842))))

(assert (=> start!35646 e!219182))

(assert (=> start!35646 tp_is_empty!8113))

(assert (=> start!35646 true))

(assert (=> start!35646 tp!27729))

(declare-fun array_inv!6934 (array!19776) Bool)

(assert (=> start!35646 (array_inv!6934 _keys!1456)))

(declare-fun array_inv!6935 (array!19778) Bool)

(assert (=> start!35646 (and (array_inv!6935 _values!1208) e!219184)))

(assert (= (and start!35646 res!199044) b!358105))

(assert (= (and b!358105 res!199047) b!358102))

(assert (= (and b!358102 res!199050) b!358104))

(assert (= (and b!358104 res!199049) b!358099))

(assert (= (and b!358099 res!199046) b!358109))

(assert (= (and b!358109 res!199045) b!358103))

(assert (= (and b!358103 res!199043) b!358108))

(assert (= (and b!358108 res!199048) b!358098))

(assert (= (and b!358098 (not res!199051)) b!358107))

(assert (= (and b!358101 condMapEmpty!13677) mapIsEmpty!13677))

(assert (= (and b!358101 (not condMapEmpty!13677)) mapNonEmpty!13677))

(get-info :version)

(assert (= (and mapNonEmpty!13677 ((_ is ValueCellFull!3713) mapValue!13677)) b!358106))

(assert (= (and b!358101 ((_ is ValueCellFull!3713) mapDefault!13677)) b!358100))

(assert (= start!35646 b!358101))

(declare-fun m!356295 () Bool)

(assert (=> b!358099 m!356295))

(declare-fun m!356297 () Bool)

(assert (=> mapNonEmpty!13677 m!356297))

(declare-fun m!356299 () Bool)

(assert (=> start!35646 m!356299))

(declare-fun m!356301 () Bool)

(assert (=> start!35646 m!356301))

(declare-fun m!356303 () Bool)

(assert (=> start!35646 m!356303))

(declare-fun m!356305 () Bool)

(assert (=> b!358108 m!356305))

(declare-fun m!356307 () Bool)

(assert (=> b!358098 m!356307))

(declare-fun m!356309 () Bool)

(assert (=> b!358098 m!356309))

(declare-fun m!356311 () Bool)

(assert (=> b!358102 m!356311))

(declare-fun m!356313 () Bool)

(assert (=> b!358104 m!356313))

(declare-fun m!356315 () Bool)

(assert (=> b!358103 m!356315))

(declare-fun m!356317 () Bool)

(assert (=> b!358107 m!356317))

(assert (=> b!358107 m!356317))

(declare-fun m!356319 () Bool)

(assert (=> b!358107 m!356319))

(declare-fun m!356321 () Bool)

(assert (=> b!358107 m!356321))

(check-sat b_and!15171 (not b_next!7915) (not start!35646) (not b!358102) (not b!358103) (not b!358107) (not b!358099) (not b!358098) (not mapNonEmpty!13677) tp_is_empty!8113 (not b!358104))
(check-sat b_and!15171 (not b_next!7915))
