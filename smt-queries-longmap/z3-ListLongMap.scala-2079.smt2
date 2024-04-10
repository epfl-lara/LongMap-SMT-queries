; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35644 () Bool)

(assert start!35644)

(declare-fun b_free!7899 () Bool)

(declare-fun b_next!7899 () Bool)

(assert (=> start!35644 (= b_free!7899 (not b_next!7899))))

(declare-fun tp!27681 () Bool)

(declare-fun b_and!15141 () Bool)

(assert (=> start!35644 (= tp!27681 b_and!15141)))

(declare-fun b!357863 () Bool)

(declare-fun res!198838 () Bool)

(declare-fun e!219074 () Bool)

(assert (=> b!357863 (=> (not res!198838) (not e!219074))))

(declare-datatypes ((array!19761 0))(
  ( (array!19762 (arr!9374 (Array (_ BitVec 32) (_ BitVec 64))) (size!9726 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19761)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357863 (= res!198838 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357864 () Bool)

(declare-fun res!198833 () Bool)

(assert (=> b!357864 (=> (not res!198833) (not e!219074))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357864 (= res!198833 (validKeyInArray!0 k0!1077))))

(declare-fun b!357865 () Bool)

(declare-fun res!198831 () Bool)

(assert (=> b!357865 (=> (not res!198831) (not e!219074))))

(assert (=> b!357865 (= res!198831 (not (= (select (arr!9374 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357866 () Bool)

(declare-fun e!219072 () Bool)

(declare-fun tp_is_empty!8097 () Bool)

(assert (=> b!357866 (= e!219072 tp_is_empty!8097)))

(declare-fun b!357867 () Bool)

(declare-fun e!219077 () Bool)

(assert (=> b!357867 (= e!219077 tp_is_empty!8097)))

(declare-fun b!357868 () Bool)

(declare-fun res!198830 () Bool)

(assert (=> b!357868 (=> (not res!198830) (not e!219074))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19761 (_ BitVec 32)) Bool)

(assert (=> b!357868 (= res!198830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357870 () Bool)

(declare-fun e!219075 () Bool)

(declare-fun mapRes!13653 () Bool)

(assert (=> b!357870 (= e!219075 (and e!219077 mapRes!13653))))

(declare-fun condMapEmpty!13653 () Bool)

(declare-datatypes ((V!11773 0))(
  ( (V!11774 (val!4093 Int)) )
))
(declare-datatypes ((ValueCell!3705 0))(
  ( (ValueCellFull!3705 (v!6287 V!11773)) (EmptyCell!3705) )
))
(declare-datatypes ((array!19763 0))(
  ( (array!19764 (arr!9375 (Array (_ BitVec 32) ValueCell!3705)) (size!9727 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19763)

(declare-fun mapDefault!13653 () ValueCell!3705)

(assert (=> b!357870 (= condMapEmpty!13653 (= (arr!9375 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3705)) mapDefault!13653)))))

(declare-fun b!357871 () Bool)

(declare-fun res!198835 () Bool)

(assert (=> b!357871 (=> (not res!198835) (not e!219074))))

(assert (=> b!357871 (= res!198835 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9726 _keys!1456))))))

(declare-fun b!357872 () Bool)

(declare-fun res!198836 () Bool)

(assert (=> b!357872 (=> (not res!198836) (not e!219074))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!357872 (= res!198836 (and (= (size!9727 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9726 _keys!1456) (size!9727 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13653 () Bool)

(assert (=> mapIsEmpty!13653 mapRes!13653))

(declare-fun mapNonEmpty!13653 () Bool)

(declare-fun tp!27680 () Bool)

(assert (=> mapNonEmpty!13653 (= mapRes!13653 (and tp!27680 e!219072))))

(declare-fun mapKey!13653 () (_ BitVec 32))

(declare-fun mapValue!13653 () ValueCell!3705)

(declare-fun mapRest!13653 () (Array (_ BitVec 32) ValueCell!3705))

(assert (=> mapNonEmpty!13653 (= (arr!9375 _values!1208) (store mapRest!13653 mapKey!13653 mapValue!13653))))

(declare-fun res!198834 () Bool)

(assert (=> start!35644 (=> (not res!198834) (not e!219074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35644 (= res!198834 (validMask!0 mask!1842))))

(assert (=> start!35644 e!219074))

(assert (=> start!35644 tp_is_empty!8097))

(assert (=> start!35644 true))

(assert (=> start!35644 tp!27681))

(declare-fun array_inv!6890 (array!19761) Bool)

(assert (=> start!35644 (array_inv!6890 _keys!1456)))

(declare-fun array_inv!6891 (array!19763) Bool)

(assert (=> start!35644 (and (array_inv!6891 _values!1208) e!219075)))

(declare-fun b!357869 () Bool)

(declare-fun e!219073 () Bool)

(assert (=> b!357869 (= e!219074 (not e!219073))))

(declare-fun res!198832 () Bool)

(assert (=> b!357869 (=> res!198832 e!219073)))

(assert (=> b!357869 (= res!198832 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9726 _keys!1456))))))

(assert (=> b!357869 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((Unit!11032 0))(
  ( (Unit!11033) )
))
(declare-fun lt!166112 () Unit!11032)

(declare-fun minValue!1150 () V!11773)

(declare-fun zeroValue!1150 () V!11773)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!35 (array!19761 array!19763 (_ BitVec 32) (_ BitVec 32) V!11773 V!11773 (_ BitVec 64) (_ BitVec 32)) Unit!11032)

(assert (=> b!357869 (= lt!166112 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!35 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357873 () Bool)

(declare-fun res!198837 () Bool)

(assert (=> b!357873 (=> (not res!198837) (not e!219074))))

(declare-datatypes ((List!5410 0))(
  ( (Nil!5407) (Cons!5406 (h!6262 (_ BitVec 64)) (t!10560 List!5410)) )
))
(declare-fun arrayNoDuplicates!0 (array!19761 (_ BitVec 32) List!5410) Bool)

(assert (=> b!357873 (= res!198837 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5407))))

(declare-fun b!357874 () Bool)

(assert (=> b!357874 (= e!219073 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5716 0))(
  ( (tuple2!5717 (_1!2869 (_ BitVec 64)) (_2!2869 V!11773)) )
))
(declare-datatypes ((List!5411 0))(
  ( (Nil!5408) (Cons!5407 (h!6263 tuple2!5716) (t!10561 List!5411)) )
))
(declare-datatypes ((ListLongMap!4629 0))(
  ( (ListLongMap!4630 (toList!2330 List!5411)) )
))
(declare-fun contains!2410 (ListLongMap!4629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1851 (array!19761 array!19763 (_ BitVec 32) (_ BitVec 32) V!11773 V!11773 (_ BitVec 32) Int) ListLongMap!4629)

(assert (=> b!357874 (contains!2410 (getCurrentListMap!1851 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!166111 () Unit!11032)

(declare-fun lemmaArrayContainsKeyThenInListMap!346 (array!19761 array!19763 (_ BitVec 32) (_ BitVec 32) V!11773 V!11773 (_ BitVec 64) (_ BitVec 32) Int) Unit!11032)

(assert (=> b!357874 (= lt!166111 (lemmaArrayContainsKeyThenInListMap!346 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(assert (= (and start!35644 res!198834) b!357872))

(assert (= (and b!357872 res!198836) b!357868))

(assert (= (and b!357868 res!198830) b!357873))

(assert (= (and b!357873 res!198837) b!357864))

(assert (= (and b!357864 res!198833) b!357871))

(assert (= (and b!357871 res!198835) b!357863))

(assert (= (and b!357863 res!198838) b!357865))

(assert (= (and b!357865 res!198831) b!357869))

(assert (= (and b!357869 (not res!198832)) b!357874))

(assert (= (and b!357870 condMapEmpty!13653) mapIsEmpty!13653))

(assert (= (and b!357870 (not condMapEmpty!13653)) mapNonEmpty!13653))

(get-info :version)

(assert (= (and mapNonEmpty!13653 ((_ is ValueCellFull!3705) mapValue!13653)) b!357866))

(assert (= (and b!357870 ((_ is ValueCellFull!3705) mapDefault!13653)) b!357867))

(assert (= start!35644 b!357870))

(declare-fun m!355847 () Bool)

(assert (=> b!357873 m!355847))

(declare-fun m!355849 () Bool)

(assert (=> b!357864 m!355849))

(declare-fun m!355851 () Bool)

(assert (=> b!357874 m!355851))

(assert (=> b!357874 m!355851))

(declare-fun m!355853 () Bool)

(assert (=> b!357874 m!355853))

(declare-fun m!355855 () Bool)

(assert (=> b!357874 m!355855))

(declare-fun m!355857 () Bool)

(assert (=> b!357865 m!355857))

(declare-fun m!355859 () Bool)

(assert (=> b!357869 m!355859))

(declare-fun m!355861 () Bool)

(assert (=> b!357869 m!355861))

(declare-fun m!355863 () Bool)

(assert (=> b!357863 m!355863))

(declare-fun m!355865 () Bool)

(assert (=> start!35644 m!355865))

(declare-fun m!355867 () Bool)

(assert (=> start!35644 m!355867))

(declare-fun m!355869 () Bool)

(assert (=> start!35644 m!355869))

(declare-fun m!355871 () Bool)

(assert (=> mapNonEmpty!13653 m!355871))

(declare-fun m!355873 () Bool)

(assert (=> b!357868 m!355873))

(check-sat (not mapNonEmpty!13653) (not b!357868) (not b_next!7899) (not start!35644) (not b!357863) b_and!15141 (not b!357874) tp_is_empty!8097 (not b!357864) (not b!357873) (not b!357869))
(check-sat b_and!15141 (not b_next!7899))
