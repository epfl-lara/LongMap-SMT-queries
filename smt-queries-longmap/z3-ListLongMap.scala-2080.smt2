; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35634 () Bool)

(assert start!35634)

(declare-fun b_free!7903 () Bool)

(declare-fun b_next!7903 () Bool)

(assert (=> start!35634 (= b_free!7903 (not b_next!7903))))

(declare-fun tp!27692 () Bool)

(declare-fun b_and!15159 () Bool)

(assert (=> start!35634 (= tp!27692 b_and!15159)))

(declare-fun b!357882 () Bool)

(declare-fun e!219078 () Bool)

(declare-fun tp_is_empty!8101 () Bool)

(assert (=> b!357882 (= e!219078 tp_is_empty!8101)))

(declare-fun b!357883 () Bool)

(declare-fun res!198881 () Bool)

(declare-fun e!219075 () Bool)

(assert (=> b!357883 (=> (not res!198881) (not e!219075))))

(declare-datatypes ((array!19752 0))(
  ( (array!19753 (arr!9369 (Array (_ BitVec 32) (_ BitVec 64))) (size!9721 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19752)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!357883 (= res!198881 (not (= (select (arr!9369 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357884 () Bool)

(declare-fun e!219079 () Bool)

(declare-fun e!219077 () Bool)

(declare-fun mapRes!13659 () Bool)

(assert (=> b!357884 (= e!219079 (and e!219077 mapRes!13659))))

(declare-fun condMapEmpty!13659 () Bool)

(declare-datatypes ((V!11779 0))(
  ( (V!11780 (val!4095 Int)) )
))
(declare-datatypes ((ValueCell!3707 0))(
  ( (ValueCellFull!3707 (v!6290 V!11779)) (EmptyCell!3707) )
))
(declare-datatypes ((array!19754 0))(
  ( (array!19755 (arr!9370 (Array (_ BitVec 32) ValueCell!3707)) (size!9722 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19754)

(declare-fun mapDefault!13659 () ValueCell!3707)

(assert (=> b!357884 (= condMapEmpty!13659 (= (arr!9370 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3707)) mapDefault!13659)))))

(declare-fun res!198885 () Bool)

(assert (=> start!35634 (=> (not res!198885) (not e!219075))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35634 (= res!198885 (validMask!0 mask!1842))))

(assert (=> start!35634 e!219075))

(assert (=> start!35634 tp_is_empty!8101))

(assert (=> start!35634 true))

(assert (=> start!35634 tp!27692))

(declare-fun array_inv!6922 (array!19752) Bool)

(assert (=> start!35634 (array_inv!6922 _keys!1456)))

(declare-fun array_inv!6923 (array!19754) Bool)

(assert (=> start!35634 (and (array_inv!6923 _values!1208) e!219079)))

(declare-fun b!357885 () Bool)

(declare-fun res!198888 () Bool)

(assert (=> b!357885 (=> (not res!198888) (not e!219075))))

(assert (=> b!357885 (= res!198888 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9721 _keys!1456))))))

(declare-fun b!357886 () Bool)

(declare-fun res!198886 () Bool)

(assert (=> b!357886 (=> (not res!198886) (not e!219075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357886 (= res!198886 (validKeyInArray!0 k0!1077))))

(declare-fun b!357887 () Bool)

(declare-fun e!219074 () Bool)

(assert (=> b!357887 (= e!219074 true)))

(declare-fun minValue!1150 () V!11779)

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11779)

(declare-datatypes ((tuple2!5638 0))(
  ( (tuple2!5639 (_1!2830 (_ BitVec 64)) (_2!2830 V!11779)) )
))
(declare-datatypes ((List!5320 0))(
  ( (Nil!5317) (Cons!5316 (h!6172 tuple2!5638) (t!10462 List!5320)) )
))
(declare-datatypes ((ListLongMap!4553 0))(
  ( (ListLongMap!4554 (toList!2292 List!5320)) )
))
(declare-fun contains!2391 (ListLongMap!4553 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1820 (array!19752 array!19754 (_ BitVec 32) (_ BitVec 32) V!11779 V!11779 (_ BitVec 32) Int) ListLongMap!4553)

(assert (=> b!357887 (contains!2391 (getCurrentListMap!1820 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-datatypes ((Unit!11021 0))(
  ( (Unit!11022) )
))
(declare-fun lt!166141 () Unit!11021)

(declare-fun lemmaArrayContainsKeyThenInListMap!359 (array!19752 array!19754 (_ BitVec 32) (_ BitVec 32) V!11779 V!11779 (_ BitVec 64) (_ BitVec 32) Int) Unit!11021)

(assert (=> b!357887 (= lt!166141 (lemmaArrayContainsKeyThenInListMap!359 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357888 () Bool)

(assert (=> b!357888 (= e!219075 (not e!219074))))

(declare-fun res!198887 () Bool)

(assert (=> b!357888 (=> res!198887 e!219074)))

(assert (=> b!357888 (= res!198887 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9721 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!19752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357888 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166142 () Unit!11021)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!36 (array!19752 array!19754 (_ BitVec 32) (_ BitVec 32) V!11779 V!11779 (_ BitVec 64) (_ BitVec 32)) Unit!11021)

(assert (=> b!357888 (= lt!166142 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!36 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357889 () Bool)

(declare-fun res!198882 () Bool)

(assert (=> b!357889 (=> (not res!198882) (not e!219075))))

(declare-datatypes ((List!5321 0))(
  ( (Nil!5318) (Cons!5317 (h!6173 (_ BitVec 64)) (t!10463 List!5321)) )
))
(declare-fun arrayNoDuplicates!0 (array!19752 (_ BitVec 32) List!5321) Bool)

(assert (=> b!357889 (= res!198882 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5318))))

(declare-fun mapIsEmpty!13659 () Bool)

(assert (=> mapIsEmpty!13659 mapRes!13659))

(declare-fun mapNonEmpty!13659 () Bool)

(declare-fun tp!27693 () Bool)

(assert (=> mapNonEmpty!13659 (= mapRes!13659 (and tp!27693 e!219078))))

(declare-fun mapValue!13659 () ValueCell!3707)

(declare-fun mapRest!13659 () (Array (_ BitVec 32) ValueCell!3707))

(declare-fun mapKey!13659 () (_ BitVec 32))

(assert (=> mapNonEmpty!13659 (= (arr!9370 _values!1208) (store mapRest!13659 mapKey!13659 mapValue!13659))))

(declare-fun b!357890 () Bool)

(assert (=> b!357890 (= e!219077 tp_is_empty!8101)))

(declare-fun b!357891 () Bool)

(declare-fun res!198884 () Bool)

(assert (=> b!357891 (=> (not res!198884) (not e!219075))))

(assert (=> b!357891 (= res!198884 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357892 () Bool)

(declare-fun res!198883 () Bool)

(assert (=> b!357892 (=> (not res!198883) (not e!219075))))

(assert (=> b!357892 (= res!198883 (and (= (size!9722 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9721 _keys!1456) (size!9722 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357893 () Bool)

(declare-fun res!198889 () Bool)

(assert (=> b!357893 (=> (not res!198889) (not e!219075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19752 (_ BitVec 32)) Bool)

(assert (=> b!357893 (= res!198889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35634 res!198885) b!357892))

(assert (= (and b!357892 res!198883) b!357893))

(assert (= (and b!357893 res!198889) b!357889))

(assert (= (and b!357889 res!198882) b!357886))

(assert (= (and b!357886 res!198886) b!357885))

(assert (= (and b!357885 res!198888) b!357891))

(assert (= (and b!357891 res!198884) b!357883))

(assert (= (and b!357883 res!198881) b!357888))

(assert (= (and b!357888 (not res!198887)) b!357887))

(assert (= (and b!357884 condMapEmpty!13659) mapIsEmpty!13659))

(assert (= (and b!357884 (not condMapEmpty!13659)) mapNonEmpty!13659))

(get-info :version)

(assert (= (and mapNonEmpty!13659 ((_ is ValueCellFull!3707) mapValue!13659)) b!357882))

(assert (= (and b!357884 ((_ is ValueCellFull!3707) mapDefault!13659)) b!357890))

(assert (= start!35634 b!357884))

(declare-fun m!356127 () Bool)

(assert (=> b!357889 m!356127))

(declare-fun m!356129 () Bool)

(assert (=> b!357893 m!356129))

(declare-fun m!356131 () Bool)

(assert (=> b!357888 m!356131))

(declare-fun m!356133 () Bool)

(assert (=> b!357888 m!356133))

(declare-fun m!356135 () Bool)

(assert (=> mapNonEmpty!13659 m!356135))

(declare-fun m!356137 () Bool)

(assert (=> b!357887 m!356137))

(assert (=> b!357887 m!356137))

(declare-fun m!356139 () Bool)

(assert (=> b!357887 m!356139))

(declare-fun m!356141 () Bool)

(assert (=> b!357887 m!356141))

(declare-fun m!356143 () Bool)

(assert (=> b!357883 m!356143))

(declare-fun m!356145 () Bool)

(assert (=> b!357886 m!356145))

(declare-fun m!356147 () Bool)

(assert (=> b!357891 m!356147))

(declare-fun m!356149 () Bool)

(assert (=> start!35634 m!356149))

(declare-fun m!356151 () Bool)

(assert (=> start!35634 m!356151))

(declare-fun m!356153 () Bool)

(assert (=> start!35634 m!356153))

(check-sat (not b!357893) tp_is_empty!8101 (not start!35634) (not b!357891) (not b!357887) (not mapNonEmpty!13659) (not b!357888) (not b!357886) (not b!357889) b_and!15159 (not b_next!7903))
(check-sat b_and!15159 (not b_next!7903))
