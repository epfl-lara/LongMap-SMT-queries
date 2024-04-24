; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35604 () Bool)

(assert start!35604)

(declare-fun b_free!7873 () Bool)

(declare-fun b_next!7873 () Bool)

(assert (=> start!35604 (= b_free!7873 (not b_next!7873))))

(declare-fun tp!27602 () Bool)

(declare-fun b_and!15129 () Bool)

(assert (=> start!35604 (= tp!27602 b_and!15129)))

(declare-fun b!357342 () Bool)

(declare-fun e!218805 () Bool)

(declare-fun e!218809 () Bool)

(declare-fun mapRes!13614 () Bool)

(assert (=> b!357342 (= e!218805 (and e!218809 mapRes!13614))))

(declare-fun condMapEmpty!13614 () Bool)

(declare-datatypes ((V!11739 0))(
  ( (V!11740 (val!4080 Int)) )
))
(declare-datatypes ((ValueCell!3692 0))(
  ( (ValueCellFull!3692 (v!6275 V!11739)) (EmptyCell!3692) )
))
(declare-datatypes ((array!19692 0))(
  ( (array!19693 (arr!9339 (Array (_ BitVec 32) ValueCell!3692)) (size!9691 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19692)

(declare-fun mapDefault!13614 () ValueCell!3692)

(assert (=> b!357342 (= condMapEmpty!13614 (= (arr!9339 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3692)) mapDefault!13614)))))

(declare-fun b!357343 () Bool)

(declare-fun res!198477 () Bool)

(declare-fun e!218806 () Bool)

(assert (=> b!357343 (=> (not res!198477) (not e!218806))))

(declare-datatypes ((array!19694 0))(
  ( (array!19695 (arr!9340 (Array (_ BitVec 32) (_ BitVec 64))) (size!9692 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19694)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19694 (_ BitVec 32)) Bool)

(assert (=> b!357343 (= res!198477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13614 () Bool)

(declare-fun tp!27603 () Bool)

(declare-fun e!218808 () Bool)

(assert (=> mapNonEmpty!13614 (= mapRes!13614 (and tp!27603 e!218808))))

(declare-fun mapKey!13614 () (_ BitVec 32))

(declare-fun mapValue!13614 () ValueCell!3692)

(declare-fun mapRest!13614 () (Array (_ BitVec 32) ValueCell!3692))

(assert (=> mapNonEmpty!13614 (= (arr!9339 _values!1208) (store mapRest!13614 mapKey!13614 mapValue!13614))))

(declare-fun b!357344 () Bool)

(declare-fun tp_is_empty!8071 () Bool)

(assert (=> b!357344 (= e!218808 tp_is_empty!8071)))

(declare-fun b!357345 () Bool)

(declare-fun res!198484 () Bool)

(assert (=> b!357345 (=> (not res!198484) (not e!218806))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357345 (= res!198484 (validKeyInArray!0 k0!1077))))

(declare-fun b!357346 () Bool)

(declare-fun res!198481 () Bool)

(assert (=> b!357346 (=> (not res!198481) (not e!218806))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!357346 (= res!198481 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9692 _keys!1456))))))

(declare-fun mapIsEmpty!13614 () Bool)

(assert (=> mapIsEmpty!13614 mapRes!13614))

(declare-fun b!357347 () Bool)

(declare-fun res!198479 () Bool)

(assert (=> b!357347 (=> (not res!198479) (not e!218806))))

(assert (=> b!357347 (= res!198479 (not (= (select (arr!9340 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!357348 () Bool)

(declare-fun e!218807 () Bool)

(assert (=> b!357348 (= e!218807 true)))

(declare-fun minValue!1150 () V!11739)

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11739)

(declare-datatypes ((tuple2!5616 0))(
  ( (tuple2!5617 (_1!2819 (_ BitVec 64)) (_2!2819 V!11739)) )
))
(declare-datatypes ((List!5296 0))(
  ( (Nil!5293) (Cons!5292 (h!6148 tuple2!5616) (t!10438 List!5296)) )
))
(declare-datatypes ((ListLongMap!4531 0))(
  ( (ListLongMap!4532 (toList!2281 List!5296)) )
))
(declare-fun contains!2380 (ListLongMap!4531 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1809 (array!19694 array!19692 (_ BitVec 32) (_ BitVec 32) V!11739 V!11739 (_ BitVec 32) Int) ListLongMap!4531)

(assert (=> b!357348 (contains!2380 (getCurrentListMap!1809 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) k0!1077)))

(declare-datatypes ((Unit!10997 0))(
  ( (Unit!10998) )
))
(declare-fun lt!166051 () Unit!10997)

(declare-fun lemmaArrayContainsKeyThenInListMap!348 (array!19694 array!19692 (_ BitVec 32) (_ BitVec 32) V!11739 V!11739 (_ BitVec 64) (_ BitVec 32) Int) Unit!10997)

(assert (=> b!357348 (= lt!166051 (lemmaArrayContainsKeyThenInListMap!348 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805) defaultEntry!1216))))

(declare-fun b!357349 () Bool)

(assert (=> b!357349 (= e!218809 tp_is_empty!8071)))

(declare-fun b!357350 () Bool)

(assert (=> b!357350 (= e!218806 (not e!218807))))

(declare-fun res!198483 () Bool)

(assert (=> b!357350 (=> res!198483 e!218807)))

(assert (=> b!357350 (= res!198483 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9692 _keys!1456))))))

(declare-fun arrayContainsKey!0 (array!19694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357350 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun lt!166052 () Unit!10997)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!27 (array!19694 array!19692 (_ BitVec 32) (_ BitVec 32) V!11739 V!11739 (_ BitVec 64) (_ BitVec 32)) Unit!10997)

(assert (=> b!357350 (= lt!166052 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!27 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!357351 () Bool)

(declare-fun res!198478 () Bool)

(assert (=> b!357351 (=> (not res!198478) (not e!218806))))

(declare-datatypes ((List!5297 0))(
  ( (Nil!5294) (Cons!5293 (h!6149 (_ BitVec 64)) (t!10439 List!5297)) )
))
(declare-fun arrayNoDuplicates!0 (array!19694 (_ BitVec 32) List!5297) Bool)

(assert (=> b!357351 (= res!198478 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5294))))

(declare-fun b!357352 () Bool)

(declare-fun res!198480 () Bool)

(assert (=> b!357352 (=> (not res!198480) (not e!218806))))

(assert (=> b!357352 (= res!198480 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun res!198476 () Bool)

(assert (=> start!35604 (=> (not res!198476) (not e!218806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35604 (= res!198476 (validMask!0 mask!1842))))

(assert (=> start!35604 e!218806))

(assert (=> start!35604 tp_is_empty!8071))

(assert (=> start!35604 true))

(assert (=> start!35604 tp!27602))

(declare-fun array_inv!6898 (array!19694) Bool)

(assert (=> start!35604 (array_inv!6898 _keys!1456)))

(declare-fun array_inv!6899 (array!19692) Bool)

(assert (=> start!35604 (and (array_inv!6899 _values!1208) e!218805)))

(declare-fun b!357353 () Bool)

(declare-fun res!198482 () Bool)

(assert (=> b!357353 (=> (not res!198482) (not e!218806))))

(assert (=> b!357353 (= res!198482 (and (= (size!9691 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9692 _keys!1456) (size!9691 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35604 res!198476) b!357353))

(assert (= (and b!357353 res!198482) b!357343))

(assert (= (and b!357343 res!198477) b!357351))

(assert (= (and b!357351 res!198478) b!357345))

(assert (= (and b!357345 res!198484) b!357346))

(assert (= (and b!357346 res!198481) b!357352))

(assert (= (and b!357352 res!198480) b!357347))

(assert (= (and b!357347 res!198479) b!357350))

(assert (= (and b!357350 (not res!198483)) b!357348))

(assert (= (and b!357342 condMapEmpty!13614) mapIsEmpty!13614))

(assert (= (and b!357342 (not condMapEmpty!13614)) mapNonEmpty!13614))

(get-info :version)

(assert (= (and mapNonEmpty!13614 ((_ is ValueCellFull!3692) mapValue!13614)) b!357344))

(assert (= (and b!357342 ((_ is ValueCellFull!3692) mapDefault!13614)) b!357349))

(assert (= start!35604 b!357342))

(declare-fun m!355707 () Bool)

(assert (=> b!357348 m!355707))

(assert (=> b!357348 m!355707))

(declare-fun m!355709 () Bool)

(assert (=> b!357348 m!355709))

(declare-fun m!355711 () Bool)

(assert (=> b!357348 m!355711))

(declare-fun m!355713 () Bool)

(assert (=> b!357352 m!355713))

(declare-fun m!355715 () Bool)

(assert (=> b!357347 m!355715))

(declare-fun m!355717 () Bool)

(assert (=> b!357343 m!355717))

(declare-fun m!355719 () Bool)

(assert (=> b!357345 m!355719))

(declare-fun m!355721 () Bool)

(assert (=> start!35604 m!355721))

(declare-fun m!355723 () Bool)

(assert (=> start!35604 m!355723))

(declare-fun m!355725 () Bool)

(assert (=> start!35604 m!355725))

(declare-fun m!355727 () Bool)

(assert (=> mapNonEmpty!13614 m!355727))

(declare-fun m!355729 () Bool)

(assert (=> b!357351 m!355729))

(declare-fun m!355731 () Bool)

(assert (=> b!357350 m!355731))

(declare-fun m!355733 () Bool)

(assert (=> b!357350 m!355733))

(check-sat (not b!357343) (not mapNonEmpty!13614) (not start!35604) (not b!357350) b_and!15129 (not b_next!7873) (not b!357351) (not b!357348) (not b!357352) tp_is_empty!8071 (not b!357345))
(check-sat b_and!15129 (not b_next!7873))
