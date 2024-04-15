; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35646 () Bool)

(assert start!35646)

(declare-fun b_free!7915 () Bool)

(declare-fun b_next!7915 () Bool)

(assert (=> start!35646 (= b_free!7915 (not b_next!7915))))

(declare-fun tp!27729 () Bool)

(declare-fun b_and!15131 () Bool)

(assert (=> start!35646 (= tp!27729 b_and!15131)))

(declare-fun b!357876 () Bool)

(declare-fun res!198923 () Bool)

(declare-fun e!219044 () Bool)

(assert (=> b!357876 (=> (not res!198923) (not e!219044))))

(declare-datatypes ((array!19777 0))(
  ( (array!19778 (arr!9382 (Array (_ BitVec 32) (_ BitVec 64))) (size!9735 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19777)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357876 (= res!198923 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357877 () Bool)

(declare-fun e!219040 () Bool)

(declare-fun tp_is_empty!8113 () Bool)

(assert (=> b!357877 (= e!219040 tp_is_empty!8113)))

(declare-fun b!357878 () Bool)

(declare-fun res!198920 () Bool)

(assert (=> b!357878 (=> (not res!198920) (not e!219044))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19777 (_ BitVec 32)) Bool)

(assert (=> b!357878 (= res!198920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357879 () Bool)

(declare-fun e!219043 () Bool)

(assert (=> b!357879 (= e!219043 (bvsle #b00000000000000000000000000000000 (size!9735 _keys!1456)))))

(declare-datatypes ((V!11795 0))(
  ( (V!11796 (val!4101 Int)) )
))
(declare-fun minValue!1150 () V!11795)

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((ValueCell!3713 0))(
  ( (ValueCellFull!3713 (v!6289 V!11795)) (EmptyCell!3713) )
))
(declare-datatypes ((array!19779 0))(
  ( (array!19780 (arr!9383 (Array (_ BitVec 32) ValueCell!3713)) (size!9736 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19779)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11795)

(declare-datatypes ((tuple2!5704 0))(
  ( (tuple2!5705 (_1!2863 (_ BitVec 64)) (_2!2863 V!11795)) )
))
(declare-datatypes ((List!5389 0))(
  ( (Nil!5386) (Cons!5385 (h!6241 tuple2!5704) (t!10530 List!5389)) )
))
(declare-datatypes ((ListLongMap!4607 0))(
  ( (ListLongMap!4608 (toList!2319 List!5389)) )
))
(declare-fun contains!2409 (ListLongMap!4607 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1824 (array!19777 array!19779 (_ BitVec 32) (_ BitVec 32) V!11795 V!11795 (_ BitVec 32) Int) ListLongMap!4607)

(assert (=> b!357879 (contains!2409 (getCurrentListMap!1824 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-datatypes ((Unit!11030 0))(
  ( (Unit!11031) )
))
(declare-fun lt!165924 () Unit!11030)

(declare-fun lemmaArrayContainsKeyThenInListMap!357 (array!19777 array!19779 (_ BitVec 32) (_ BitVec 32) V!11795 V!11795 (_ BitVec 64) (_ BitVec 32) Int) Unit!11030)

(assert (=> b!357879 (= lt!165924 (lemmaArrayContainsKeyThenInListMap!357 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun res!198925 () Bool)

(assert (=> start!35646 (=> (not res!198925) (not e!219044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35646 (= res!198925 (validMask!0 mask!1842))))

(assert (=> start!35646 e!219044))

(assert (=> start!35646 tp_is_empty!8113))

(assert (=> start!35646 true))

(assert (=> start!35646 tp!27729))

(declare-fun array_inv!6922 (array!19777) Bool)

(assert (=> start!35646 (array_inv!6922 _keys!1456)))

(declare-fun e!219045 () Bool)

(declare-fun array_inv!6923 (array!19779) Bool)

(assert (=> start!35646 (and (array_inv!6923 _values!1208) e!219045)))

(declare-fun b!357880 () Bool)

(declare-fun res!198919 () Bool)

(assert (=> b!357880 (=> (not res!198919) (not e!219044))))

(assert (=> b!357880 (= res!198919 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9735 _keys!1456))))))

(declare-fun mapNonEmpty!13677 () Bool)

(declare-fun mapRes!13677 () Bool)

(declare-fun tp!27728 () Bool)

(assert (=> mapNonEmpty!13677 (= mapRes!13677 (and tp!27728 e!219040))))

(declare-fun mapRest!13677 () (Array (_ BitVec 32) ValueCell!3713))

(declare-fun mapKey!13677 () (_ BitVec 32))

(declare-fun mapValue!13677 () ValueCell!3713)

(assert (=> mapNonEmpty!13677 (= (arr!9383 _values!1208) (store mapRest!13677 mapKey!13677 mapValue!13677))))

(declare-fun b!357881 () Bool)

(declare-fun res!198924 () Bool)

(assert (=> b!357881 (=> (not res!198924) (not e!219044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357881 (= res!198924 (validKeyInArray!0 k0!1077))))

(declare-fun b!357882 () Bool)

(assert (=> b!357882 (= e!219044 (not e!219043))))

(declare-fun res!198917 () Bool)

(assert (=> b!357882 (=> res!198917 e!219043)))

(assert (=> b!357882 (= res!198917 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9735 _keys!1456))))))

(assert (=> b!357882 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!165925 () Unit!11030)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!39 (array!19777 array!19779 (_ BitVec 32) (_ BitVec 32) V!11795 V!11795 (_ BitVec 64) (_ BitVec 32)) Unit!11030)

(assert (=> b!357882 (= lt!165925 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!39 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13677 () Bool)

(assert (=> mapIsEmpty!13677 mapRes!13677))

(declare-fun b!357883 () Bool)

(declare-fun res!198922 () Bool)

(assert (=> b!357883 (=> (not res!198922) (not e!219044))))

(declare-datatypes ((List!5390 0))(
  ( (Nil!5387) (Cons!5386 (h!6242 (_ BitVec 64)) (t!10531 List!5390)) )
))
(declare-fun arrayNoDuplicates!0 (array!19777 (_ BitVec 32) List!5390) Bool)

(assert (=> b!357883 (= res!198922 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5387))))

(declare-fun b!357884 () Bool)

(declare-fun e!219041 () Bool)

(assert (=> b!357884 (= e!219045 (and e!219041 mapRes!13677))))

(declare-fun condMapEmpty!13677 () Bool)

(declare-fun mapDefault!13677 () ValueCell!3713)

(assert (=> b!357884 (= condMapEmpty!13677 (= (arr!9383 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3713)) mapDefault!13677)))))

(declare-fun b!357885 () Bool)

(assert (=> b!357885 (= e!219041 tp_is_empty!8113)))

(declare-fun b!357886 () Bool)

(declare-fun res!198918 () Bool)

(assert (=> b!357886 (=> (not res!198918) (not e!219044))))

(assert (=> b!357886 (= res!198918 (and (= (size!9736 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9735 _keys!1456) (size!9736 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357887 () Bool)

(declare-fun res!198921 () Bool)

(assert (=> b!357887 (=> (not res!198921) (not e!219044))))

(assert (=> b!357887 (= res!198921 (not (= (select (arr!9382 _keys!1456) from!1805) k0!1077)))))

(assert (= (and start!35646 res!198925) b!357886))

(assert (= (and b!357886 res!198918) b!357878))

(assert (= (and b!357878 res!198920) b!357883))

(assert (= (and b!357883 res!198922) b!357881))

(assert (= (and b!357881 res!198924) b!357880))

(assert (= (and b!357880 res!198919) b!357876))

(assert (= (and b!357876 res!198923) b!357887))

(assert (= (and b!357887 res!198921) b!357882))

(assert (= (and b!357882 (not res!198917)) b!357879))

(assert (= (and b!357884 condMapEmpty!13677) mapIsEmpty!13677))

(assert (= (and b!357884 (not condMapEmpty!13677)) mapNonEmpty!13677))

(get-info :version)

(assert (= (and mapNonEmpty!13677 ((_ is ValueCellFull!3713) mapValue!13677)) b!357877))

(assert (= (and b!357884 ((_ is ValueCellFull!3713) mapDefault!13677)) b!357885))

(assert (= start!35646 b!357884))

(declare-fun m!355341 () Bool)

(assert (=> b!357881 m!355341))

(declare-fun m!355343 () Bool)

(assert (=> b!357887 m!355343))

(declare-fun m!355345 () Bool)

(assert (=> b!357878 m!355345))

(declare-fun m!355347 () Bool)

(assert (=> mapNonEmpty!13677 m!355347))

(declare-fun m!355349 () Bool)

(assert (=> b!357876 m!355349))

(declare-fun m!355351 () Bool)

(assert (=> b!357883 m!355351))

(declare-fun m!355353 () Bool)

(assert (=> start!35646 m!355353))

(declare-fun m!355355 () Bool)

(assert (=> start!35646 m!355355))

(declare-fun m!355357 () Bool)

(assert (=> start!35646 m!355357))

(declare-fun m!355359 () Bool)

(assert (=> b!357879 m!355359))

(assert (=> b!357879 m!355359))

(declare-fun m!355361 () Bool)

(assert (=> b!357879 m!355361))

(declare-fun m!355363 () Bool)

(assert (=> b!357879 m!355363))

(declare-fun m!355365 () Bool)

(assert (=> b!357882 m!355365))

(declare-fun m!355367 () Bool)

(assert (=> b!357882 m!355367))

(check-sat tp_is_empty!8113 b_and!15131 (not start!35646) (not mapNonEmpty!13677) (not b_next!7915) (not b!357879) (not b!357876) (not b!357883) (not b!357878) (not b!357882) (not b!357881))
(check-sat b_and!15131 (not b_next!7915))
