; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35626 () Bool)

(assert start!35626)

(declare-fun b_free!7881 () Bool)

(declare-fun b_next!7881 () Bool)

(assert (=> start!35626 (= b_free!7881 (not b_next!7881))))

(declare-fun tp!27627 () Bool)

(declare-fun b_and!15123 () Bool)

(assert (=> start!35626 (= tp!27627 b_and!15123)))

(declare-fun b!357539 () Bool)

(declare-fun e!218912 () Bool)

(declare-fun tp_is_empty!8079 () Bool)

(assert (=> b!357539 (= e!218912 tp_is_empty!8079)))

(declare-fun b!357540 () Bool)

(declare-fun e!218914 () Bool)

(assert (=> b!357540 (= e!218914 tp_is_empty!8079)))

(declare-fun res!198591 () Bool)

(declare-fun e!218910 () Bool)

(assert (=> start!35626 (=> (not res!198591) (not e!218910))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35626 (= res!198591 (validMask!0 mask!1842))))

(assert (=> start!35626 e!218910))

(assert (=> start!35626 tp_is_empty!8079))

(assert (=> start!35626 true))

(assert (=> start!35626 tp!27627))

(declare-datatypes ((array!19725 0))(
  ( (array!19726 (arr!9356 (Array (_ BitVec 32) (_ BitVec 64))) (size!9708 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19725)

(declare-fun array_inv!6880 (array!19725) Bool)

(assert (=> start!35626 (array_inv!6880 _keys!1456)))

(declare-datatypes ((V!11749 0))(
  ( (V!11750 (val!4084 Int)) )
))
(declare-datatypes ((ValueCell!3696 0))(
  ( (ValueCellFull!3696 (v!6278 V!11749)) (EmptyCell!3696) )
))
(declare-datatypes ((array!19727 0))(
  ( (array!19728 (arr!9357 (Array (_ BitVec 32) ValueCell!3696)) (size!9709 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19727)

(declare-fun e!218915 () Bool)

(declare-fun array_inv!6881 (array!19727) Bool)

(assert (=> start!35626 (and (array_inv!6881 _values!1208) e!218915)))

(declare-fun b!357541 () Bool)

(declare-fun res!198589 () Bool)

(assert (=> b!357541 (=> (not res!198589) (not e!218910))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357541 (= res!198589 (validKeyInArray!0 k0!1077))))

(declare-fun b!357542 () Bool)

(declare-fun res!198587 () Bool)

(assert (=> b!357542 (=> (not res!198587) (not e!218910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19725 (_ BitVec 32)) Bool)

(assert (=> b!357542 (= res!198587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!357543 () Bool)

(declare-fun mapRes!13626 () Bool)

(assert (=> b!357543 (= e!218915 (and e!218912 mapRes!13626))))

(declare-fun condMapEmpty!13626 () Bool)

(declare-fun mapDefault!13626 () ValueCell!3696)

(assert (=> b!357543 (= condMapEmpty!13626 (= (arr!9357 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3696)) mapDefault!13626)))))

(declare-fun b!357544 () Bool)

(declare-fun res!198588 () Bool)

(assert (=> b!357544 (=> (not res!198588) (not e!218910))))

(declare-datatypes ((List!5399 0))(
  ( (Nil!5396) (Cons!5395 (h!6251 (_ BitVec 64)) (t!10549 List!5399)) )
))
(declare-fun arrayNoDuplicates!0 (array!19725 (_ BitVec 32) List!5399) Bool)

(assert (=> b!357544 (= res!198588 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5396))))

(declare-fun mapNonEmpty!13626 () Bool)

(declare-fun tp!27626 () Bool)

(assert (=> mapNonEmpty!13626 (= mapRes!13626 (and tp!27626 e!218914))))

(declare-fun mapValue!13626 () ValueCell!3696)

(declare-fun mapKey!13626 () (_ BitVec 32))

(declare-fun mapRest!13626 () (Array (_ BitVec 32) ValueCell!3696))

(assert (=> mapNonEmpty!13626 (= (arr!9357 _values!1208) (store mapRest!13626 mapKey!13626 mapValue!13626))))

(declare-fun b!357545 () Bool)

(declare-fun e!218911 () Bool)

(assert (=> b!357545 (= e!218911 true)))

(declare-fun minValue!1150 () V!11749)

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11749)

(declare-datatypes ((tuple2!5708 0))(
  ( (tuple2!5709 (_1!2865 (_ BitVec 64)) (_2!2865 V!11749)) )
))
(declare-datatypes ((List!5400 0))(
  ( (Nil!5397) (Cons!5396 (h!6252 tuple2!5708) (t!10550 List!5400)) )
))
(declare-datatypes ((ListLongMap!4621 0))(
  ( (ListLongMap!4622 (toList!2326 List!5400)) )
))
(declare-fun contains!2406 (ListLongMap!4621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1847 (array!19725 array!19727 (_ BitVec 32) (_ BitVec 32) V!11749 V!11749 (_ BitVec 32) Int) ListLongMap!4621)

(assert (=> b!357545 (contains!2406 (getCurrentListMap!1847 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((Unit!11020 0))(
  ( (Unit!11021) )
))
(declare-fun lt!166057 () Unit!11020)

(declare-fun lemmaArrayContainsKeyThenInListMap!342 (array!19725 array!19727 (_ BitVec 32) (_ BitVec 32) V!11749 V!11749 (_ BitVec 64) (_ BitVec 32) Int) Unit!11020)

(assert (=> b!357545 (= lt!166057 (lemmaArrayContainsKeyThenInListMap!342 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357546 () Bool)

(declare-fun res!198594 () Bool)

(assert (=> b!357546 (=> (not res!198594) (not e!218910))))

(assert (=> b!357546 (= res!198594 (and (= (size!9709 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9708 _keys!1456) (size!9709 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!357547 () Bool)

(declare-fun res!198592 () Bool)

(assert (=> b!357547 (=> (not res!198592) (not e!218910))))

(assert (=> b!357547 (= res!198592 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9708 _keys!1456))))))

(declare-fun b!357548 () Bool)

(assert (=> b!357548 (= e!218910 (not e!218911))))

(declare-fun res!198593 () Bool)

(assert (=> b!357548 (=> res!198593 e!218911)))

(assert (=> b!357548 (= res!198593 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9708 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!19725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357548 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166058 () Unit!11020)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!29 (array!19725 array!19727 (_ BitVec 32) (_ BitVec 32) V!11749 V!11749 (_ BitVec 64) (_ BitVec 32)) Unit!11020)

(assert (=> b!357548 (= lt!166058 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!29 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357549 () Bool)

(declare-fun res!198595 () Bool)

(assert (=> b!357549 (=> (not res!198595) (not e!218910))))

(assert (=> b!357549 (= res!198595 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!357550 () Bool)

(declare-fun res!198590 () Bool)

(assert (=> b!357550 (=> (not res!198590) (not e!218910))))

(assert (=> b!357550 (= res!198590 (not (= (select (arr!9356 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapIsEmpty!13626 () Bool)

(assert (=> mapIsEmpty!13626 mapRes!13626))

(assert (= (and start!35626 res!198591) b!357546))

(assert (= (and b!357546 res!198594) b!357542))

(assert (= (and b!357542 res!198587) b!357544))

(assert (= (and b!357544 res!198588) b!357541))

(assert (= (and b!357541 res!198589) b!357547))

(assert (= (and b!357547 res!198592) b!357549))

(assert (= (and b!357549 res!198595) b!357550))

(assert (= (and b!357550 res!198590) b!357548))

(assert (= (and b!357548 (not res!198593)) b!357545))

(assert (= (and b!357543 condMapEmpty!13626) mapIsEmpty!13626))

(assert (= (and b!357543 (not condMapEmpty!13626)) mapNonEmpty!13626))

(get-info :version)

(assert (= (and mapNonEmpty!13626 ((_ is ValueCellFull!3696) mapValue!13626)) b!357540))

(assert (= (and b!357543 ((_ is ValueCellFull!3696) mapDefault!13626)) b!357539))

(assert (= start!35626 b!357543))

(declare-fun m!355595 () Bool)

(assert (=> b!357548 m!355595))

(declare-fun m!355597 () Bool)

(assert (=> b!357548 m!355597))

(declare-fun m!355599 () Bool)

(assert (=> b!357544 m!355599))

(declare-fun m!355601 () Bool)

(assert (=> b!357541 m!355601))

(declare-fun m!355603 () Bool)

(assert (=> b!357545 m!355603))

(assert (=> b!357545 m!355603))

(declare-fun m!355605 () Bool)

(assert (=> b!357545 m!355605))

(declare-fun m!355607 () Bool)

(assert (=> b!357545 m!355607))

(declare-fun m!355609 () Bool)

(assert (=> b!357550 m!355609))

(declare-fun m!355611 () Bool)

(assert (=> b!357549 m!355611))

(declare-fun m!355613 () Bool)

(assert (=> start!35626 m!355613))

(declare-fun m!355615 () Bool)

(assert (=> start!35626 m!355615))

(declare-fun m!355617 () Bool)

(assert (=> start!35626 m!355617))

(declare-fun m!355619 () Bool)

(assert (=> mapNonEmpty!13626 m!355619))

(declare-fun m!355621 () Bool)

(assert (=> b!357542 m!355621))

(check-sat (not start!35626) (not b!357549) (not b!357541) (not b!357548) b_and!15123 (not b_next!7881) (not b!357545) (not b!357544) (not b!357542) tp_is_empty!8079 (not mapNonEmpty!13626))
(check-sat b_and!15123 (not b_next!7881))
