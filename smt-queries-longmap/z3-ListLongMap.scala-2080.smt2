; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35634 () Bool)

(assert start!35634)

(declare-fun b_free!7903 () Bool)

(declare-fun b_next!7903 () Bool)

(assert (=> start!35634 (= b_free!7903 (not b_next!7903))))

(declare-fun tp!27692 () Bool)

(declare-fun b_and!15119 () Bool)

(assert (=> start!35634 (= tp!27692 b_and!15119)))

(declare-fun b!357660 () Bool)

(declare-fun e!218936 () Bool)

(declare-fun e!218932 () Bool)

(declare-fun mapRes!13659 () Bool)

(assert (=> b!357660 (= e!218936 (and e!218932 mapRes!13659))))

(declare-fun condMapEmpty!13659 () Bool)

(declare-datatypes ((V!11779 0))(
  ( (V!11780 (val!4095 Int)) )
))
(declare-datatypes ((ValueCell!3707 0))(
  ( (ValueCellFull!3707 (v!6283 V!11779)) (EmptyCell!3707) )
))
(declare-datatypes ((array!19753 0))(
  ( (array!19754 (arr!9370 (Array (_ BitVec 32) ValueCell!3707)) (size!9723 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19753)

(declare-fun mapDefault!13659 () ValueCell!3707)

(assert (=> b!357660 (= condMapEmpty!13659 (= (arr!9370 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3707)) mapDefault!13659)))))

(declare-fun mapNonEmpty!13659 () Bool)

(declare-fun tp!27693 () Bool)

(declare-fun e!218937 () Bool)

(assert (=> mapNonEmpty!13659 (= mapRes!13659 (and tp!27693 e!218937))))

(declare-fun mapRest!13659 () (Array (_ BitVec 32) ValueCell!3707))

(declare-fun mapValue!13659 () ValueCell!3707)

(declare-fun mapKey!13659 () (_ BitVec 32))

(assert (=> mapNonEmpty!13659 (= (arr!9370 _values!1208) (store mapRest!13659 mapKey!13659 mapValue!13659))))

(declare-fun b!357661 () Bool)

(declare-fun res!198763 () Bool)

(declare-fun e!218933 () Bool)

(assert (=> b!357661 (=> (not res!198763) (not e!218933))))

(declare-datatypes ((array!19755 0))(
  ( (array!19756 (arr!9371 (Array (_ BitVec 32) (_ BitVec 64))) (size!9724 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19755)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!357661 (= res!198763 (not (= (select (arr!9371 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357662 () Bool)

(declare-fun res!198756 () Bool)

(assert (=> b!357662 (=> (not res!198756) (not e!218933))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!357662 (= res!198756 (and (= (size!9723 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9724 _keys!1456) (size!9723 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357663 () Bool)

(declare-fun tp_is_empty!8101 () Bool)

(assert (=> b!357663 (= e!218937 tp_is_empty!8101)))

(declare-fun b!357664 () Bool)

(declare-fun res!198760 () Bool)

(assert (=> b!357664 (=> (not res!198760) (not e!218933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19755 (_ BitVec 32)) Bool)

(assert (=> b!357664 (= res!198760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13659 () Bool)

(assert (=> mapIsEmpty!13659 mapRes!13659))

(declare-fun b!357666 () Bool)

(declare-fun res!198762 () Bool)

(assert (=> b!357666 (=> (not res!198762) (not e!218933))))

(assert (=> b!357666 (= res!198762 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9724 _keys!1456))))))

(declare-fun b!357667 () Bool)

(declare-fun res!198759 () Bool)

(assert (=> b!357667 (=> (not res!198759) (not e!218933))))

(declare-fun arrayContainsKey!0 (array!19755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357667 (= res!198759 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357668 () Bool)

(declare-fun e!218934 () Bool)

(assert (=> b!357668 (= e!218933 (not e!218934))))

(declare-fun res!198755 () Bool)

(assert (=> b!357668 (=> res!198755 e!218934)))

(assert (=> b!357668 (= res!198755 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9724 _keys!1456))))))

(assert (=> b!357668 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11779)

(declare-datatypes ((Unit!11020 0))(
  ( (Unit!11021) )
))
(declare-fun lt!165888 () Unit!11020)

(declare-fun zeroValue!1150 () V!11779)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!35 (array!19755 array!19753 (_ BitVec 32) (_ BitVec 32) V!11779 V!11779 (_ BitVec 64) (_ BitVec 32)) Unit!11020)

(assert (=> b!357668 (= lt!165888 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!35 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357669 () Bool)

(declare-fun res!198758 () Bool)

(assert (=> b!357669 (=> (not res!198758) (not e!218933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357669 (= res!198758 (validKeyInArray!0 k0!1077))))

(declare-fun b!357665 () Bool)

(assert (=> b!357665 (= e!218932 tp_is_empty!8101)))

(declare-fun res!198757 () Bool)

(assert (=> start!35634 (=> (not res!198757) (not e!218933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35634 (= res!198757 (validMask!0 mask!1842))))

(assert (=> start!35634 e!218933))

(assert (=> start!35634 tp_is_empty!8101))

(assert (=> start!35634 true))

(assert (=> start!35634 tp!27692))

(declare-fun array_inv!6912 (array!19755) Bool)

(assert (=> start!35634 (array_inv!6912 _keys!1456)))

(declare-fun array_inv!6913 (array!19753) Bool)

(assert (=> start!35634 (and (array_inv!6913 _values!1208) e!218936)))

(declare-fun b!357670 () Bool)

(declare-fun res!198761 () Bool)

(assert (=> b!357670 (=> (not res!198761) (not e!218933))))

(declare-datatypes ((List!5379 0))(
  ( (Nil!5376) (Cons!5375 (h!6231 (_ BitVec 64)) (t!10520 List!5379)) )
))
(declare-fun arrayNoDuplicates!0 (array!19755 (_ BitVec 32) List!5379) Bool)

(assert (=> b!357670 (= res!198761 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5376))))

(declare-fun b!357671 () Bool)

(assert (=> b!357671 (= e!218934 true)))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((tuple2!5694 0))(
  ( (tuple2!5695 (_1!2858 (_ BitVec 64)) (_2!2858 V!11779)) )
))
(declare-datatypes ((List!5380 0))(
  ( (Nil!5377) (Cons!5376 (h!6232 tuple2!5694) (t!10521 List!5380)) )
))
(declare-datatypes ((ListLongMap!4597 0))(
  ( (ListLongMap!4598 (toList!2314 List!5380)) )
))
(declare-fun contains!2404 (ListLongMap!4597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1819 (array!19755 array!19753 (_ BitVec 32) (_ BitVec 32) V!11779 V!11779 (_ BitVec 32) Int) ListLongMap!4597)

(assert (=> b!357671 (contains!2404 (getCurrentListMap!1819 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun lt!165889 () Unit!11020)

(declare-fun lemmaArrayContainsKeyThenInListMap!352 (array!19755 array!19753 (_ BitVec 32) (_ BitVec 32) V!11779 V!11779 (_ BitVec 64) (_ BitVec 32) Int) Unit!11020)

(assert (=> b!357671 (= lt!165889 (lemmaArrayContainsKeyThenInListMap!352 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(assert (= (and start!35634 res!198757) b!357662))

(assert (= (and b!357662 res!198756) b!357664))

(assert (= (and b!357664 res!198760) b!357670))

(assert (= (and b!357670 res!198761) b!357669))

(assert (= (and b!357669 res!198758) b!357666))

(assert (= (and b!357666 res!198762) b!357667))

(assert (= (and b!357667 res!198759) b!357661))

(assert (= (and b!357661 res!198763) b!357668))

(assert (= (and b!357668 (not res!198755)) b!357671))

(assert (= (and b!357660 condMapEmpty!13659) mapIsEmpty!13659))

(assert (= (and b!357660 (not condMapEmpty!13659)) mapNonEmpty!13659))

(get-info :version)

(assert (= (and mapNonEmpty!13659 ((_ is ValueCellFull!3707) mapValue!13659)) b!357663))

(assert (= (and b!357660 ((_ is ValueCellFull!3707) mapDefault!13659)) b!357665))

(assert (= start!35634 b!357660))

(declare-fun m!355173 () Bool)

(assert (=> b!357671 m!355173))

(assert (=> b!357671 m!355173))

(declare-fun m!355175 () Bool)

(assert (=> b!357671 m!355175))

(declare-fun m!355177 () Bool)

(assert (=> b!357671 m!355177))

(declare-fun m!355179 () Bool)

(assert (=> mapNonEmpty!13659 m!355179))

(declare-fun m!355181 () Bool)

(assert (=> start!35634 m!355181))

(declare-fun m!355183 () Bool)

(assert (=> start!35634 m!355183))

(declare-fun m!355185 () Bool)

(assert (=> start!35634 m!355185))

(declare-fun m!355187 () Bool)

(assert (=> b!357661 m!355187))

(declare-fun m!355189 () Bool)

(assert (=> b!357667 m!355189))

(declare-fun m!355191 () Bool)

(assert (=> b!357669 m!355191))

(declare-fun m!355193 () Bool)

(assert (=> b!357664 m!355193))

(declare-fun m!355195 () Bool)

(assert (=> b!357670 m!355195))

(declare-fun m!355197 () Bool)

(assert (=> b!357668 m!355197))

(declare-fun m!355199 () Bool)

(assert (=> b!357668 m!355199))

(check-sat b_and!15119 (not b!357670) (not b_next!7903) (not b!357668) tp_is_empty!8101 (not start!35634) (not b!357667) (not mapNonEmpty!13659) (not b!357664) (not b!357671) (not b!357669))
(check-sat b_and!15119 (not b_next!7903))
