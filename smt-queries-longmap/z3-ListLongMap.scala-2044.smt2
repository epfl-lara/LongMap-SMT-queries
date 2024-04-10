; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35434 () Bool)

(assert start!35434)

(declare-fun b_free!7821 () Bool)

(declare-fun b_next!7821 () Bool)

(assert (=> start!35434 (= b_free!7821 (not b_next!7821))))

(declare-fun tp!27249 () Bool)

(declare-fun b_and!15063 () Bool)

(assert (=> start!35434 (= tp!27249 b_and!15063)))

(declare-fun b!354776 () Bool)

(declare-fun e!217449 () Bool)

(declare-fun tp_is_empty!7887 () Bool)

(assert (=> b!354776 (= e!217449 tp_is_empty!7887)))

(declare-fun mapIsEmpty!13338 () Bool)

(declare-fun mapRes!13338 () Bool)

(assert (=> mapIsEmpty!13338 mapRes!13338))

(declare-fun b!354777 () Bool)

(declare-fun res!196695 () Bool)

(declare-fun e!217451 () Bool)

(assert (=> b!354777 (=> (not res!196695) (not e!217451))))

(declare-datatypes ((array!19355 0))(
  ( (array!19356 (arr!9171 (Array (_ BitVec 32) (_ BitVec 64))) (size!9523 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19355)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354777 (= res!196695 (validKeyInArray!0 (select (arr!9171 _keys!1456) from!1805)))))

(declare-fun b!354778 () Bool)

(declare-fun res!196692 () Bool)

(assert (=> b!354778 (=> (not res!196692) (not e!217451))))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!354778 (= res!196692 (= (select (arr!9171 _keys!1456) from!1805) k0!1077))))

(declare-fun b!354779 () Bool)

(declare-fun res!196690 () Bool)

(assert (=> b!354779 (=> (not res!196690) (not e!217451))))

(assert (=> b!354779 (= res!196690 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9523 _keys!1456))))))

(declare-fun b!354780 () Bool)

(declare-fun res!196694 () Bool)

(assert (=> b!354780 (=> (not res!196694) (not e!217451))))

(declare-datatypes ((List!5309 0))(
  ( (Nil!5306) (Cons!5305 (h!6161 (_ BitVec 64)) (t!10459 List!5309)) )
))
(declare-fun arrayNoDuplicates!0 (array!19355 (_ BitVec 32) List!5309) Bool)

(assert (=> b!354780 (= res!196694 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5306))))

(declare-fun res!196696 () Bool)

(assert (=> start!35434 (=> (not res!196696) (not e!217451))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35434 (= res!196696 (validMask!0 mask!1842))))

(assert (=> start!35434 e!217451))

(assert (=> start!35434 tp_is_empty!7887))

(assert (=> start!35434 true))

(assert (=> start!35434 tp!27249))

(declare-fun array_inv!6740 (array!19355) Bool)

(assert (=> start!35434 (array_inv!6740 _keys!1456)))

(declare-datatypes ((V!11493 0))(
  ( (V!11494 (val!3988 Int)) )
))
(declare-datatypes ((ValueCell!3600 0))(
  ( (ValueCellFull!3600 (v!6182 V!11493)) (EmptyCell!3600) )
))
(declare-datatypes ((array!19357 0))(
  ( (array!19358 (arr!9172 (Array (_ BitVec 32) ValueCell!3600)) (size!9524 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19357)

(declare-fun e!217447 () Bool)

(declare-fun array_inv!6741 (array!19357) Bool)

(assert (=> start!35434 (and (array_inv!6741 _values!1208) e!217447)))

(declare-fun mapNonEmpty!13338 () Bool)

(declare-fun tp!27248 () Bool)

(assert (=> mapNonEmpty!13338 (= mapRes!13338 (and tp!27248 e!217449))))

(declare-fun mapKey!13338 () (_ BitVec 32))

(declare-fun mapValue!13338 () ValueCell!3600)

(declare-fun mapRest!13338 () (Array (_ BitVec 32) ValueCell!3600))

(assert (=> mapNonEmpty!13338 (= (arr!9172 _values!1208) (store mapRest!13338 mapKey!13338 mapValue!13338))))

(declare-fun b!354781 () Bool)

(declare-fun res!196689 () Bool)

(assert (=> b!354781 (=> (not res!196689) (not e!217451))))

(assert (=> b!354781 (= res!196689 (validKeyInArray!0 k0!1077))))

(declare-fun b!354782 () Bool)

(assert (=> b!354782 (= e!217451 (not true))))

(declare-fun minValue!1150 () V!11493)

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11493)

(declare-datatypes ((tuple2!5666 0))(
  ( (tuple2!5667 (_1!2844 (_ BitVec 64)) (_2!2844 V!11493)) )
))
(declare-datatypes ((List!5310 0))(
  ( (Nil!5307) (Cons!5306 (h!6162 tuple2!5666) (t!10460 List!5310)) )
))
(declare-datatypes ((ListLongMap!4579 0))(
  ( (ListLongMap!4580 (toList!2305 List!5310)) )
))
(declare-fun contains!2385 (ListLongMap!4579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1826 (array!19355 array!19357 (_ BitVec 32) (_ BitVec 32) V!11493 V!11493 (_ BitVec 32) Int) ListLongMap!4579)

(assert (=> b!354782 (contains!2385 (getCurrentListMap!1826 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9171 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10932 0))(
  ( (Unit!10933) )
))
(declare-fun lt!165746 () Unit!10932)

(declare-fun lemmaValidKeyInArrayIsInListMap!183 (array!19355 array!19357 (_ BitVec 32) (_ BitVec 32) V!11493 V!11493 (_ BitVec 32) Int) Unit!10932)

(assert (=> b!354782 (= lt!165746 (lemmaValidKeyInArrayIsInListMap!183 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!354783 () Bool)

(declare-fun e!217450 () Bool)

(assert (=> b!354783 (= e!217450 tp_is_empty!7887)))

(declare-fun b!354784 () Bool)

(declare-fun res!196691 () Bool)

(assert (=> b!354784 (=> (not res!196691) (not e!217451))))

(declare-fun arrayContainsKey!0 (array!19355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354784 (= res!196691 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354785 () Bool)

(declare-fun res!196693 () Bool)

(assert (=> b!354785 (=> (not res!196693) (not e!217451))))

(assert (=> b!354785 (= res!196693 (and (= (size!9524 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9523 _keys!1456) (size!9524 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354786 () Bool)

(declare-fun res!196688 () Bool)

(assert (=> b!354786 (=> (not res!196688) (not e!217451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19355 (_ BitVec 32)) Bool)

(assert (=> b!354786 (= res!196688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354787 () Bool)

(assert (=> b!354787 (= e!217447 (and e!217450 mapRes!13338))))

(declare-fun condMapEmpty!13338 () Bool)

(declare-fun mapDefault!13338 () ValueCell!3600)

(assert (=> b!354787 (= condMapEmpty!13338 (= (arr!9172 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3600)) mapDefault!13338)))))

(assert (= (and start!35434 res!196696) b!354785))

(assert (= (and b!354785 res!196693) b!354786))

(assert (= (and b!354786 res!196688) b!354780))

(assert (= (and b!354780 res!196694) b!354781))

(assert (= (and b!354781 res!196689) b!354779))

(assert (= (and b!354779 res!196690) b!354784))

(assert (= (and b!354784 res!196691) b!354778))

(assert (= (and b!354778 res!196692) b!354777))

(assert (= (and b!354777 res!196695) b!354782))

(assert (= (and b!354787 condMapEmpty!13338) mapIsEmpty!13338))

(assert (= (and b!354787 (not condMapEmpty!13338)) mapNonEmpty!13338))

(get-info :version)

(assert (= (and mapNonEmpty!13338 ((_ is ValueCellFull!3600) mapValue!13338)) b!354776))

(assert (= (and b!354787 ((_ is ValueCellFull!3600) mapDefault!13338)) b!354783))

(assert (= start!35434 b!354787))

(declare-fun m!353679 () Bool)

(assert (=> b!354781 m!353679))

(declare-fun m!353681 () Bool)

(assert (=> b!354780 m!353681))

(declare-fun m!353683 () Bool)

(assert (=> b!354778 m!353683))

(declare-fun m!353685 () Bool)

(assert (=> b!354784 m!353685))

(declare-fun m!353687 () Bool)

(assert (=> mapNonEmpty!13338 m!353687))

(declare-fun m!353689 () Bool)

(assert (=> b!354786 m!353689))

(declare-fun m!353691 () Bool)

(assert (=> start!35434 m!353691))

(declare-fun m!353693 () Bool)

(assert (=> start!35434 m!353693))

(declare-fun m!353695 () Bool)

(assert (=> start!35434 m!353695))

(assert (=> b!354777 m!353683))

(assert (=> b!354777 m!353683))

(declare-fun m!353697 () Bool)

(assert (=> b!354777 m!353697))

(declare-fun m!353699 () Bool)

(assert (=> b!354782 m!353699))

(assert (=> b!354782 m!353683))

(assert (=> b!354782 m!353699))

(assert (=> b!354782 m!353683))

(declare-fun m!353701 () Bool)

(assert (=> b!354782 m!353701))

(declare-fun m!353703 () Bool)

(assert (=> b!354782 m!353703))

(check-sat (not b!354782) (not mapNonEmpty!13338) b_and!15063 (not b!354784) (not b!354780) (not b!354781) (not b!354786) (not b!354777) (not b_next!7821) (not start!35434) tp_is_empty!7887)
(check-sat b_and!15063 (not b_next!7821))
