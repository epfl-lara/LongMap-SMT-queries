; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35724 () Bool)

(assert start!35724)

(declare-fun b_free!7921 () Bool)

(declare-fun b_next!7921 () Bool)

(assert (=> start!35724 (= b_free!7921 (not b_next!7921))))

(declare-fun tp!27854 () Bool)

(declare-fun b_and!15137 () Bool)

(assert (=> start!35724 (= tp!27854 b_and!15137)))

(declare-fun res!199403 () Bool)

(declare-fun e!219634 () Bool)

(assert (=> start!35724 (=> (not res!199403) (not e!219634))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35724 (= res!199403 (validMask!0 mask!1842))))

(assert (=> start!35724 e!219634))

(declare-fun tp_is_empty!8191 () Bool)

(assert (=> start!35724 tp_is_empty!8191))

(assert (=> start!35724 true))

(assert (=> start!35724 tp!27854))

(declare-datatypes ((array!19923 0))(
  ( (array!19924 (arr!9455 (Array (_ BitVec 32) (_ BitVec 64))) (size!9808 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19923)

(declare-fun array_inv!6980 (array!19923) Bool)

(assert (=> start!35724 (array_inv!6980 _keys!1456)))

(declare-datatypes ((V!11899 0))(
  ( (V!11900 (val!4140 Int)) )
))
(declare-datatypes ((ValueCell!3752 0))(
  ( (ValueCellFull!3752 (v!6328 V!11899)) (EmptyCell!3752) )
))
(declare-datatypes ((array!19925 0))(
  ( (array!19926 (arr!9456 (Array (_ BitVec 32) ValueCell!3752)) (size!9809 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19925)

(declare-fun e!219635 () Bool)

(declare-fun array_inv!6981 (array!19925) Bool)

(assert (=> start!35724 (and (array_inv!6981 _values!1208) e!219635)))

(declare-fun b!358713 () Bool)

(declare-fun e!219636 () Bool)

(assert (=> b!358713 (= e!219636 tp_is_empty!8191)))

(declare-fun b!358714 () Bool)

(declare-fun res!199405 () Bool)

(assert (=> b!358714 (=> (not res!199405) (not e!219634))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!358714 (= res!199405 (validKeyInArray!0 (select (arr!9455 _keys!1456) from!1805)))))

(declare-fun mapIsEmpty!13794 () Bool)

(declare-fun mapRes!13794 () Bool)

(assert (=> mapIsEmpty!13794 mapRes!13794))

(declare-fun b!358715 () Bool)

(declare-fun res!199408 () Bool)

(assert (=> b!358715 (=> (not res!199408) (not e!219634))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!358715 (= res!199408 (= (select (arr!9455 _keys!1456) from!1805) k0!1077))))

(declare-fun b!358716 () Bool)

(declare-fun e!219633 () Bool)

(assert (=> b!358716 (= e!219633 tp_is_empty!8191)))

(declare-fun b!358717 () Bool)

(assert (=> b!358717 (= e!219635 (and e!219636 mapRes!13794))))

(declare-fun condMapEmpty!13794 () Bool)

(declare-fun mapDefault!13794 () ValueCell!3752)

(assert (=> b!358717 (= condMapEmpty!13794 (= (arr!9456 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3752)) mapDefault!13794)))))

(declare-fun b!358718 () Bool)

(declare-fun res!199404 () Bool)

(assert (=> b!358718 (=> (not res!199404) (not e!219634))))

(declare-fun arrayContainsKey!0 (array!19923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!358718 (= res!199404 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!358719 () Bool)

(declare-fun res!199411 () Bool)

(assert (=> b!358719 (=> (not res!199411) (not e!219634))))

(assert (=> b!358719 (= res!199411 (validKeyInArray!0 k0!1077))))

(declare-fun b!358720 () Bool)

(declare-datatypes ((tuple2!5706 0))(
  ( (tuple2!5707 (_1!2864 (_ BitVec 64)) (_2!2864 V!11899)) )
))
(declare-datatypes ((List!5414 0))(
  ( (Nil!5411) (Cons!5410 (h!6266 tuple2!5706) (t!10555 List!5414)) )
))
(declare-datatypes ((ListLongMap!4609 0))(
  ( (ListLongMap!4610 (toList!2320 List!5414)) )
))
(declare-fun lt!166032 () ListLongMap!4609)

(declare-fun contains!2410 (ListLongMap!4609 (_ BitVec 64)) Bool)

(assert (=> b!358720 (= e!219634 (not (contains!2410 lt!166032 k0!1077)))))

(assert (=> b!358720 (contains!2410 lt!166032 (select (arr!9455 _keys!1456) from!1805))))

(declare-fun minValue!1150 () V!11899)

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11899)

(declare-fun getCurrentListMap!1825 (array!19923 array!19925 (_ BitVec 32) (_ BitVec 32) V!11899 V!11899 (_ BitVec 32) Int) ListLongMap!4609)

(assert (=> b!358720 (= lt!166032 (getCurrentListMap!1825 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216))))

(declare-datatypes ((Unit!11034 0))(
  ( (Unit!11035) )
))
(declare-fun lt!166033 () Unit!11034)

(declare-fun lemmaValidKeyInArrayIsInListMap!198 (array!19923 array!19925 (_ BitVec 32) (_ BitVec 32) V!11899 V!11899 (_ BitVec 32) Int) Unit!11034)

(assert (=> b!358720 (= lt!166033 (lemmaValidKeyInArrayIsInListMap!198 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun mapNonEmpty!13794 () Bool)

(declare-fun tp!27855 () Bool)

(assert (=> mapNonEmpty!13794 (= mapRes!13794 (and tp!27855 e!219633))))

(declare-fun mapValue!13794 () ValueCell!3752)

(declare-fun mapKey!13794 () (_ BitVec 32))

(declare-fun mapRest!13794 () (Array (_ BitVec 32) ValueCell!3752))

(assert (=> mapNonEmpty!13794 (= (arr!9456 _values!1208) (store mapRest!13794 mapKey!13794 mapValue!13794))))

(declare-fun b!358721 () Bool)

(declare-fun res!199410 () Bool)

(assert (=> b!358721 (=> (not res!199410) (not e!219634))))

(assert (=> b!358721 (= res!199410 (and (= (size!9809 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9808 _keys!1456) (size!9809 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358722 () Bool)

(declare-fun res!199406 () Bool)

(assert (=> b!358722 (=> (not res!199406) (not e!219634))))

(assert (=> b!358722 (= res!199406 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9808 _keys!1456))))))

(declare-fun b!358723 () Bool)

(declare-fun res!199409 () Bool)

(assert (=> b!358723 (=> (not res!199409) (not e!219634))))

(declare-datatypes ((List!5415 0))(
  ( (Nil!5412) (Cons!5411 (h!6267 (_ BitVec 64)) (t!10556 List!5415)) )
))
(declare-fun arrayNoDuplicates!0 (array!19923 (_ BitVec 32) List!5415) Bool)

(assert (=> b!358723 (= res!199409 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5412))))

(declare-fun b!358724 () Bool)

(declare-fun res!199407 () Bool)

(assert (=> b!358724 (=> (not res!199407) (not e!219634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19923 (_ BitVec 32)) Bool)

(assert (=> b!358724 (= res!199407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35724 res!199403) b!358721))

(assert (= (and b!358721 res!199410) b!358724))

(assert (= (and b!358724 res!199407) b!358723))

(assert (= (and b!358723 res!199409) b!358719))

(assert (= (and b!358719 res!199411) b!358722))

(assert (= (and b!358722 res!199406) b!358718))

(assert (= (and b!358718 res!199404) b!358715))

(assert (= (and b!358715 res!199408) b!358714))

(assert (= (and b!358714 res!199405) b!358720))

(assert (= (and b!358717 condMapEmpty!13794) mapIsEmpty!13794))

(assert (= (and b!358717 (not condMapEmpty!13794)) mapNonEmpty!13794))

(get-info :version)

(assert (= (and mapNonEmpty!13794 ((_ is ValueCellFull!3752) mapValue!13794)) b!358716))

(assert (= (and b!358717 ((_ is ValueCellFull!3752) mapDefault!13794)) b!358713))

(assert (= start!35724 b!358717))

(declare-fun m!355893 () Bool)

(assert (=> b!358715 m!355893))

(declare-fun m!355895 () Bool)

(assert (=> b!358718 m!355895))

(assert (=> b!358714 m!355893))

(assert (=> b!358714 m!355893))

(declare-fun m!355897 () Bool)

(assert (=> b!358714 m!355897))

(declare-fun m!355899 () Bool)

(assert (=> b!358723 m!355899))

(declare-fun m!355901 () Bool)

(assert (=> mapNonEmpty!13794 m!355901))

(declare-fun m!355903 () Bool)

(assert (=> b!358719 m!355903))

(assert (=> b!358720 m!355893))

(declare-fun m!355905 () Bool)

(assert (=> b!358720 m!355905))

(assert (=> b!358720 m!355893))

(declare-fun m!355907 () Bool)

(assert (=> b!358720 m!355907))

(declare-fun m!355909 () Bool)

(assert (=> b!358720 m!355909))

(declare-fun m!355911 () Bool)

(assert (=> b!358720 m!355911))

(declare-fun m!355913 () Bool)

(assert (=> start!35724 m!355913))

(declare-fun m!355915 () Bool)

(assert (=> start!35724 m!355915))

(declare-fun m!355917 () Bool)

(assert (=> start!35724 m!355917))

(declare-fun m!355919 () Bool)

(assert (=> b!358724 m!355919))

(check-sat (not b!358723) (not b!358720) b_and!15137 (not b!358718) (not start!35724) (not b!358719) (not mapNonEmpty!13794) (not b_next!7921) (not b!358724) (not b!358714) tp_is_empty!8191)
(check-sat b_and!15137 (not b_next!7921))
