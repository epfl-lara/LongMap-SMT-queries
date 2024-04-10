; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35740 () Bool)

(assert start!35740)

(declare-fun b_free!7923 () Bool)

(declare-fun b_next!7923 () Bool)

(assert (=> start!35740 (= b_free!7923 (not b_next!7923))))

(declare-fun tp!27861 () Bool)

(declare-fun b_and!15165 () Bool)

(assert (=> start!35740 (= tp!27861 b_and!15165)))

(declare-fun b!359024 () Bool)

(declare-fun res!199566 () Bool)

(declare-fun e!219824 () Bool)

(assert (=> b!359024 (=> (not res!199566) (not e!219824))))

(declare-datatypes ((array!19945 0))(
  ( (array!19946 (arr!9466 (Array (_ BitVec 32) (_ BitVec 64))) (size!9818 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19945)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359024 (= res!199566 (validKeyInArray!0 (select (arr!9466 _keys!1456) from!1805)))))

(declare-fun b!359025 () Bool)

(declare-fun res!199564 () Bool)

(assert (=> b!359025 (=> (not res!199564) (not e!219824))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!359025 (= res!199564 (validKeyInArray!0 k0!1077))))

(declare-fun b!359026 () Bool)

(declare-fun res!199560 () Bool)

(assert (=> b!359026 (=> (not res!199560) (not e!219824))))

(declare-datatypes ((List!5451 0))(
  ( (Nil!5448) (Cons!5447 (h!6303 (_ BitVec 64)) (t!10601 List!5451)) )
))
(declare-fun arrayNoDuplicates!0 (array!19945 (_ BitVec 32) List!5451) Bool)

(assert (=> b!359026 (= res!199560 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5448))))

(declare-fun mapNonEmpty!13797 () Bool)

(declare-fun mapRes!13797 () Bool)

(declare-fun tp!27860 () Bool)

(declare-fun e!219827 () Bool)

(assert (=> mapNonEmpty!13797 (= mapRes!13797 (and tp!27860 e!219827))))

(declare-fun mapKey!13797 () (_ BitVec 32))

(declare-datatypes ((V!11901 0))(
  ( (V!11902 (val!4141 Int)) )
))
(declare-datatypes ((ValueCell!3753 0))(
  ( (ValueCellFull!3753 (v!6335 V!11901)) (EmptyCell!3753) )
))
(declare-fun mapRest!13797 () (Array (_ BitVec 32) ValueCell!3753))

(declare-datatypes ((array!19947 0))(
  ( (array!19948 (arr!9467 (Array (_ BitVec 32) ValueCell!3753)) (size!9819 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19947)

(declare-fun mapValue!13797 () ValueCell!3753)

(assert (=> mapNonEmpty!13797 (= (arr!9467 _values!1208) (store mapRest!13797 mapKey!13797 mapValue!13797))))

(declare-fun b!359027 () Bool)

(declare-fun res!199563 () Bool)

(assert (=> b!359027 (=> (not res!199563) (not e!219824))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19945 (_ BitVec 32)) Bool)

(assert (=> b!359027 (= res!199563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359028 () Bool)

(declare-fun e!219825 () Bool)

(declare-fun tp_is_empty!8193 () Bool)

(assert (=> b!359028 (= e!219825 tp_is_empty!8193)))

(declare-fun b!359029 () Bool)

(declare-fun e!219823 () Bool)

(assert (=> b!359029 (= e!219823 (and e!219825 mapRes!13797))))

(declare-fun condMapEmpty!13797 () Bool)

(declare-fun mapDefault!13797 () ValueCell!3753)

(assert (=> b!359029 (= condMapEmpty!13797 (= (arr!9467 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3753)) mapDefault!13797)))))

(declare-fun b!359030 () Bool)

(declare-fun res!199561 () Bool)

(assert (=> b!359030 (=> (not res!199561) (not e!219824))))

(declare-fun arrayContainsKey!0 (array!19945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359030 (= res!199561 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun res!199565 () Bool)

(assert (=> start!35740 (=> (not res!199565) (not e!219824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35740 (= res!199565 (validMask!0 mask!1842))))

(assert (=> start!35740 e!219824))

(assert (=> start!35740 tp_is_empty!8193))

(assert (=> start!35740 true))

(assert (=> start!35740 tp!27861))

(declare-fun array_inv!6964 (array!19945) Bool)

(assert (=> start!35740 (array_inv!6964 _keys!1456)))

(declare-fun array_inv!6965 (array!19947) Bool)

(assert (=> start!35740 (and (array_inv!6965 _values!1208) e!219823)))

(declare-fun b!359031 () Bool)

(assert (=> b!359031 (= e!219827 tp_is_empty!8193)))

(declare-fun b!359032 () Bool)

(declare-fun res!199567 () Bool)

(assert (=> b!359032 (=> (not res!199567) (not e!219824))))

(assert (=> b!359032 (= res!199567 (= (select (arr!9466 _keys!1456) from!1805) k0!1077))))

(declare-fun b!359033 () Bool)

(declare-fun res!199562 () Bool)

(assert (=> b!359033 (=> (not res!199562) (not e!219824))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359033 (= res!199562 (and (= (size!9819 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9818 _keys!1456) (size!9819 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359034 () Bool)

(declare-datatypes ((tuple2!5730 0))(
  ( (tuple2!5731 (_1!2876 (_ BitVec 64)) (_2!2876 V!11901)) )
))
(declare-datatypes ((List!5452 0))(
  ( (Nil!5449) (Cons!5448 (h!6304 tuple2!5730) (t!10602 List!5452)) )
))
(declare-datatypes ((ListLongMap!4643 0))(
  ( (ListLongMap!4644 (toList!2337 List!5452)) )
))
(declare-fun lt!166273 () ListLongMap!4643)

(declare-fun contains!2417 (ListLongMap!4643 (_ BitVec 64)) Bool)

(assert (=> b!359034 (= e!219824 (not (contains!2417 lt!166273 k0!1077)))))

(assert (=> b!359034 (contains!2417 lt!166273 (select (arr!9466 _keys!1456) from!1805))))

(declare-fun minValue!1150 () V!11901)

(declare-fun defaultEntry!1216 () Int)

(declare-fun zeroValue!1150 () V!11901)

(declare-fun getCurrentListMap!1858 (array!19945 array!19947 (_ BitVec 32) (_ BitVec 32) V!11901 V!11901 (_ BitVec 32) Int) ListLongMap!4643)

(assert (=> b!359034 (= lt!166273 (getCurrentListMap!1858 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216))))

(declare-datatypes ((Unit!11050 0))(
  ( (Unit!11051) )
))
(declare-fun lt!166274 () Unit!11050)

(declare-fun lemmaValidKeyInArrayIsInListMap!199 (array!19945 array!19947 (_ BitVec 32) (_ BitVec 32) V!11901 V!11901 (_ BitVec 32) Int) Unit!11050)

(assert (=> b!359034 (= lt!166274 (lemmaValidKeyInArrayIsInListMap!199 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!359035 () Bool)

(declare-fun res!199559 () Bool)

(assert (=> b!359035 (=> (not res!199559) (not e!219824))))

(assert (=> b!359035 (= res!199559 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9818 _keys!1456))))))

(declare-fun mapIsEmpty!13797 () Bool)

(assert (=> mapIsEmpty!13797 mapRes!13797))

(assert (= (and start!35740 res!199565) b!359033))

(assert (= (and b!359033 res!199562) b!359027))

(assert (= (and b!359027 res!199563) b!359026))

(assert (= (and b!359026 res!199560) b!359025))

(assert (= (and b!359025 res!199564) b!359035))

(assert (= (and b!359035 res!199559) b!359030))

(assert (= (and b!359030 res!199561) b!359032))

(assert (= (and b!359032 res!199567) b!359024))

(assert (= (and b!359024 res!199566) b!359034))

(assert (= (and b!359029 condMapEmpty!13797) mapIsEmpty!13797))

(assert (= (and b!359029 (not condMapEmpty!13797)) mapNonEmpty!13797))

(get-info :version)

(assert (= (and mapNonEmpty!13797 ((_ is ValueCellFull!3753) mapValue!13797)) b!359031))

(assert (= (and b!359029 ((_ is ValueCellFull!3753) mapDefault!13797)) b!359028))

(assert (= start!35740 b!359029))

(declare-fun m!356651 () Bool)

(assert (=> b!359030 m!356651))

(declare-fun m!356653 () Bool)

(assert (=> b!359025 m!356653))

(declare-fun m!356655 () Bool)

(assert (=> b!359032 m!356655))

(declare-fun m!356657 () Bool)

(assert (=> b!359027 m!356657))

(declare-fun m!356659 () Bool)

(assert (=> mapNonEmpty!13797 m!356659))

(assert (=> b!359024 m!356655))

(assert (=> b!359024 m!356655))

(declare-fun m!356661 () Bool)

(assert (=> b!359024 m!356661))

(declare-fun m!356663 () Bool)

(assert (=> start!35740 m!356663))

(declare-fun m!356665 () Bool)

(assert (=> start!35740 m!356665))

(declare-fun m!356667 () Bool)

(assert (=> start!35740 m!356667))

(declare-fun m!356669 () Bool)

(assert (=> b!359026 m!356669))

(assert (=> b!359034 m!356655))

(declare-fun m!356671 () Bool)

(assert (=> b!359034 m!356671))

(declare-fun m!356673 () Bool)

(assert (=> b!359034 m!356673))

(assert (=> b!359034 m!356655))

(declare-fun m!356675 () Bool)

(assert (=> b!359034 m!356675))

(declare-fun m!356677 () Bool)

(assert (=> b!359034 m!356677))

(check-sat (not b!359034) (not start!35740) (not b!359026) tp_is_empty!8193 (not mapNonEmpty!13797) (not b!359030) (not b!359024) (not b_next!7923) b_and!15165 (not b!359025) (not b!359027))
(check-sat b_and!15165 (not b_next!7923))
