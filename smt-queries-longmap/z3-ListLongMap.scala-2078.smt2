; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35638 () Bool)

(assert start!35638)

(declare-fun b_free!7893 () Bool)

(declare-fun b_next!7893 () Bool)

(assert (=> start!35638 (= b_free!7893 (not b_next!7893))))

(declare-fun tp!27663 () Bool)

(declare-fun b_and!15135 () Bool)

(assert (=> start!35638 (= tp!27663 b_and!15135)))

(declare-fun b!357755 () Bool)

(declare-fun e!219023 () Bool)

(assert (=> b!357755 (= e!219023 true)))

(declare-datatypes ((V!11765 0))(
  ( (V!11766 (val!4090 Int)) )
))
(declare-fun minValue!1150 () V!11765)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun defaultEntry!1216 () Int)

(declare-datatypes ((array!19749 0))(
  ( (array!19750 (arr!9368 (Array (_ BitVec 32) (_ BitVec 64))) (size!9720 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19749)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-datatypes ((ValueCell!3702 0))(
  ( (ValueCellFull!3702 (v!6284 V!11765)) (EmptyCell!3702) )
))
(declare-datatypes ((array!19751 0))(
  ( (array!19752 (arr!9369 (Array (_ BitVec 32) ValueCell!3702)) (size!9721 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19751)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11765)

(declare-datatypes ((tuple2!5714 0))(
  ( (tuple2!5715 (_1!2868 (_ BitVec 64)) (_2!2868 V!11765)) )
))
(declare-datatypes ((List!5406 0))(
  ( (Nil!5403) (Cons!5402 (h!6258 tuple2!5714) (t!10556 List!5406)) )
))
(declare-datatypes ((ListLongMap!4627 0))(
  ( (ListLongMap!4628 (toList!2329 List!5406)) )
))
(declare-fun contains!2409 (ListLongMap!4627 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1850 (array!19749 array!19751 (_ BitVec 32) (_ BitVec 32) V!11765 V!11765 (_ BitVec 32) Int) ListLongMap!4627)

(assert (=> b!357755 (contains!2409 (getCurrentListMap!1850 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((Unit!11028 0))(
  ( (Unit!11029) )
))
(declare-fun lt!166093 () Unit!11028)

(declare-fun lemmaArrayContainsKeyThenInListMap!345 (array!19749 array!19751 (_ BitVec 32) (_ BitVec 32) V!11765 V!11765 (_ BitVec 64) (_ BitVec 32) Int) Unit!11028)

(assert (=> b!357755 (= lt!166093 (lemmaArrayContainsKeyThenInListMap!345 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357756 () Bool)

(declare-fun res!198751 () Bool)

(declare-fun e!219019 () Bool)

(assert (=> b!357756 (=> (not res!198751) (not e!219019))))

(assert (=> b!357756 (= res!198751 (and (= (size!9721 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9720 _keys!1456) (size!9721 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357757 () Bool)

(declare-fun e!219020 () Bool)

(declare-fun tp_is_empty!8091 () Bool)

(assert (=> b!357757 (= e!219020 tp_is_empty!8091)))

(declare-fun b!357758 () Bool)

(declare-fun res!198755 () Bool)

(assert (=> b!357758 (=> (not res!198755) (not e!219019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19749 (_ BitVec 32)) Bool)

(assert (=> b!357758 (= res!198755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357759 () Bool)

(declare-fun e!219021 () Bool)

(declare-fun mapRes!13644 () Bool)

(assert (=> b!357759 (= e!219021 (and e!219020 mapRes!13644))))

(declare-fun condMapEmpty!13644 () Bool)

(declare-fun mapDefault!13644 () ValueCell!3702)

(assert (=> b!357759 (= condMapEmpty!13644 (= (arr!9369 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3702)) mapDefault!13644)))))

(declare-fun b!357760 () Bool)

(declare-fun res!198754 () Bool)

(assert (=> b!357760 (=> (not res!198754) (not e!219019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357760 (= res!198754 (validKeyInArray!0 k0!1077))))

(declare-fun mapNonEmpty!13644 () Bool)

(declare-fun tp!27662 () Bool)

(declare-fun e!219018 () Bool)

(assert (=> mapNonEmpty!13644 (= mapRes!13644 (and tp!27662 e!219018))))

(declare-fun mapKey!13644 () (_ BitVec 32))

(declare-fun mapRest!13644 () (Array (_ BitVec 32) ValueCell!3702))

(declare-fun mapValue!13644 () ValueCell!3702)

(assert (=> mapNonEmpty!13644 (= (arr!9369 _values!1208) (store mapRest!13644 mapKey!13644 mapValue!13644))))

(declare-fun b!357761 () Bool)

(declare-fun res!198749 () Bool)

(assert (=> b!357761 (=> (not res!198749) (not e!219019))))

(declare-fun arrayContainsKey!0 (array!19749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357761 (= res!198749 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357762 () Bool)

(declare-fun res!198757 () Bool)

(assert (=> b!357762 (=> (not res!198757) (not e!219019))))

(declare-datatypes ((List!5407 0))(
  ( (Nil!5404) (Cons!5403 (h!6259 (_ BitVec 64)) (t!10557 List!5407)) )
))
(declare-fun arrayNoDuplicates!0 (array!19749 (_ BitVec 32) List!5407) Bool)

(assert (=> b!357762 (= res!198757 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5404))))

(declare-fun mapIsEmpty!13644 () Bool)

(assert (=> mapIsEmpty!13644 mapRes!13644))

(declare-fun b!357764 () Bool)

(declare-fun res!198752 () Bool)

(assert (=> b!357764 (=> (not res!198752) (not e!219019))))

(assert (=> b!357764 (= res!198752 (not (= (select (arr!9368 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357765 () Bool)

(assert (=> b!357765 (= e!219018 tp_is_empty!8091)))

(declare-fun b!357766 () Bool)

(declare-fun res!198753 () Bool)

(assert (=> b!357766 (=> (not res!198753) (not e!219019))))

(assert (=> b!357766 (= res!198753 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9720 _keys!1456))))))

(declare-fun res!198756 () Bool)

(assert (=> start!35638 (=> (not res!198756) (not e!219019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35638 (= res!198756 (validMask!0 mask!1842))))

(assert (=> start!35638 e!219019))

(assert (=> start!35638 tp_is_empty!8091))

(assert (=> start!35638 true))

(assert (=> start!35638 tp!27663))

(declare-fun array_inv!6884 (array!19749) Bool)

(assert (=> start!35638 (array_inv!6884 _keys!1456)))

(declare-fun array_inv!6885 (array!19751) Bool)

(assert (=> start!35638 (and (array_inv!6885 _values!1208) e!219021)))

(declare-fun b!357763 () Bool)

(assert (=> b!357763 (= e!219019 (not e!219023))))

(declare-fun res!198750 () Bool)

(assert (=> b!357763 (=> res!198750 e!219023)))

(assert (=> b!357763 (= res!198750 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9720 _keys!1456))))))

(assert (=> b!357763 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166094 () Unit!11028)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!33 (array!19749 array!19751 (_ BitVec 32) (_ BitVec 32) V!11765 V!11765 (_ BitVec 64) (_ BitVec 32)) Unit!11028)

(assert (=> b!357763 (= lt!166094 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!33 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(assert (= (and start!35638 res!198756) b!357756))

(assert (= (and b!357756 res!198751) b!357758))

(assert (= (and b!357758 res!198755) b!357762))

(assert (= (and b!357762 res!198757) b!357760))

(assert (= (and b!357760 res!198754) b!357766))

(assert (= (and b!357766 res!198753) b!357761))

(assert (= (and b!357761 res!198749) b!357764))

(assert (= (and b!357764 res!198752) b!357763))

(assert (= (and b!357763 (not res!198750)) b!357755))

(assert (= (and b!357759 condMapEmpty!13644) mapIsEmpty!13644))

(assert (= (and b!357759 (not condMapEmpty!13644)) mapNonEmpty!13644))

(get-info :version)

(assert (= (and mapNonEmpty!13644 ((_ is ValueCellFull!3702) mapValue!13644)) b!357765))

(assert (= (and b!357759 ((_ is ValueCellFull!3702) mapDefault!13644)) b!357757))

(assert (= start!35638 b!357759))

(declare-fun m!355763 () Bool)

(assert (=> mapNonEmpty!13644 m!355763))

(declare-fun m!355765 () Bool)

(assert (=> b!357762 m!355765))

(declare-fun m!355767 () Bool)

(assert (=> b!357764 m!355767))

(declare-fun m!355769 () Bool)

(assert (=> b!357760 m!355769))

(declare-fun m!355771 () Bool)

(assert (=> start!35638 m!355771))

(declare-fun m!355773 () Bool)

(assert (=> start!35638 m!355773))

(declare-fun m!355775 () Bool)

(assert (=> start!35638 m!355775))

(declare-fun m!355777 () Bool)

(assert (=> b!357761 m!355777))

(declare-fun m!355779 () Bool)

(assert (=> b!357763 m!355779))

(declare-fun m!355781 () Bool)

(assert (=> b!357763 m!355781))

(declare-fun m!355783 () Bool)

(assert (=> b!357755 m!355783))

(assert (=> b!357755 m!355783))

(declare-fun m!355785 () Bool)

(assert (=> b!357755 m!355785))

(declare-fun m!355787 () Bool)

(assert (=> b!357755 m!355787))

(declare-fun m!355789 () Bool)

(assert (=> b!357758 m!355789))

(check-sat b_and!15135 (not mapNonEmpty!13644) (not b!357760) (not b!357762) (not b!357761) (not b!357758) tp_is_empty!8091 (not b_next!7893) (not b!357763) (not b!357755) (not start!35638))
(check-sat b_and!15135 (not b_next!7893))
