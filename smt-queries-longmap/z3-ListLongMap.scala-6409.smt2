; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82252 () Bool)

(assert start!82252)

(declare-fun b_free!18525 () Bool)

(declare-fun b_next!18525 () Bool)

(assert (=> start!82252 (= b_free!18525 (not b_next!18525))))

(declare-fun tp!64535 () Bool)

(declare-fun b_and!30013 () Bool)

(assert (=> start!82252 (= tp!64535 b_and!30013)))

(declare-fun b!958766 () Bool)

(declare-fun res!641765 () Bool)

(declare-fun e!540508 () Bool)

(assert (=> b!958766 (=> (not res!641765) (not e!540508))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58561 0))(
  ( (array!58562 (arr!28154 (Array (_ BitVec 32) (_ BitVec 64))) (size!28633 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58561)

(declare-datatypes ((V!33291 0))(
  ( (V!33292 (val!10666 Int)) )
))
(declare-datatypes ((ValueCell!10134 0))(
  ( (ValueCellFull!10134 (v!13223 V!33291)) (EmptyCell!10134) )
))
(declare-datatypes ((array!58563 0))(
  ( (array!58564 (arr!28155 (Array (_ BitVec 32) ValueCell!10134)) (size!28634 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58563)

(assert (=> b!958766 (= res!641765 (and (= (size!28634 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28633 _keys!1668) (size!28634 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!641767 () Bool)

(assert (=> start!82252 (=> (not res!641767) (not e!540508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82252 (= res!641767 (validMask!0 mask!2088))))

(assert (=> start!82252 e!540508))

(assert (=> start!82252 true))

(declare-fun tp_is_empty!21231 () Bool)

(assert (=> start!82252 tp_is_empty!21231))

(declare-fun array_inv!21831 (array!58561) Bool)

(assert (=> start!82252 (array_inv!21831 _keys!1668)))

(declare-fun e!540509 () Bool)

(declare-fun array_inv!21832 (array!58563) Bool)

(assert (=> start!82252 (and (array_inv!21832 _values!1386) e!540509)))

(assert (=> start!82252 tp!64535))

(declare-fun b!958767 () Bool)

(declare-fun res!641768 () Bool)

(assert (=> b!958767 (=> (not res!641768) (not e!540508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58561 (_ BitVec 32)) Bool)

(assert (=> b!958767 (= res!641768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!33826 () Bool)

(declare-fun mapRes!33826 () Bool)

(declare-fun tp!64536 () Bool)

(declare-fun e!540506 () Bool)

(assert (=> mapNonEmpty!33826 (= mapRes!33826 (and tp!64536 e!540506))))

(declare-fun mapKey!33826 () (_ BitVec 32))

(declare-fun mapRest!33826 () (Array (_ BitVec 32) ValueCell!10134))

(declare-fun mapValue!33826 () ValueCell!10134)

(assert (=> mapNonEmpty!33826 (= (arr!28155 _values!1386) (store mapRest!33826 mapKey!33826 mapValue!33826))))

(declare-fun b!958768 () Bool)

(declare-fun e!540510 () Bool)

(assert (=> b!958768 (= e!540510 tp_is_empty!21231)))

(declare-fun mapIsEmpty!33826 () Bool)

(assert (=> mapIsEmpty!33826 mapRes!33826))

(declare-fun b!958769 () Bool)

(assert (=> b!958769 (= e!540509 (and e!540510 mapRes!33826))))

(declare-fun condMapEmpty!33826 () Bool)

(declare-fun mapDefault!33826 () ValueCell!10134)

(assert (=> b!958769 (= condMapEmpty!33826 (= (arr!28155 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10134)) mapDefault!33826)))))

(declare-fun b!958770 () Bool)

(declare-fun res!641766 () Bool)

(assert (=> b!958770 (=> (not res!641766) (not e!540508))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958770 (= res!641766 (validKeyInArray!0 (select (arr!28154 _keys!1668) i!793)))))

(declare-fun b!958771 () Bool)

(assert (=> b!958771 (= e!540506 tp_is_empty!21231)))

(declare-fun b!958772 () Bool)

(assert (=> b!958772 (= e!540508 false)))

(declare-fun minValue!1328 () V!33291)

(declare-fun defaultEntry!1389 () Int)

(declare-fun lt!430479 () Bool)

(declare-fun zeroValue!1328 () V!33291)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13752 0))(
  ( (tuple2!13753 (_1!6887 (_ BitVec 64)) (_2!6887 V!33291)) )
))
(declare-datatypes ((List!19572 0))(
  ( (Nil!19569) (Cons!19568 (h!20730 tuple2!13752) (t!27935 List!19572)) )
))
(declare-datatypes ((ListLongMap!12449 0))(
  ( (ListLongMap!12450 (toList!6240 List!19572)) )
))
(declare-fun contains!5341 (ListLongMap!12449 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3473 (array!58561 array!58563 (_ BitVec 32) (_ BitVec 32) V!33291 V!33291 (_ BitVec 32) Int) ListLongMap!12449)

(assert (=> b!958772 (= lt!430479 (contains!5341 (getCurrentListMap!3473 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28154 _keys!1668) i!793)))))

(declare-fun b!958773 () Bool)

(declare-fun res!641764 () Bool)

(assert (=> b!958773 (=> (not res!641764) (not e!540508))))

(assert (=> b!958773 (= res!641764 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28633 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28633 _keys!1668))))))

(declare-fun b!958774 () Bool)

(declare-fun res!641763 () Bool)

(assert (=> b!958774 (=> (not res!641763) (not e!540508))))

(declare-datatypes ((List!19573 0))(
  ( (Nil!19570) (Cons!19569 (h!20731 (_ BitVec 64)) (t!27936 List!19573)) )
))
(declare-fun arrayNoDuplicates!0 (array!58561 (_ BitVec 32) List!19573) Bool)

(assert (=> b!958774 (= res!641763 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19570))))

(assert (= (and start!82252 res!641767) b!958766))

(assert (= (and b!958766 res!641765) b!958767))

(assert (= (and b!958767 res!641768) b!958774))

(assert (= (and b!958774 res!641763) b!958773))

(assert (= (and b!958773 res!641764) b!958770))

(assert (= (and b!958770 res!641766) b!958772))

(assert (= (and b!958769 condMapEmpty!33826) mapIsEmpty!33826))

(assert (= (and b!958769 (not condMapEmpty!33826)) mapNonEmpty!33826))

(get-info :version)

(assert (= (and mapNonEmpty!33826 ((_ is ValueCellFull!10134) mapValue!33826)) b!958771))

(assert (= (and b!958769 ((_ is ValueCellFull!10134) mapDefault!33826)) b!958768))

(assert (= start!82252 b!958769))

(declare-fun m!889357 () Bool)

(assert (=> start!82252 m!889357))

(declare-fun m!889359 () Bool)

(assert (=> start!82252 m!889359))

(declare-fun m!889361 () Bool)

(assert (=> start!82252 m!889361))

(declare-fun m!889363 () Bool)

(assert (=> b!958770 m!889363))

(assert (=> b!958770 m!889363))

(declare-fun m!889365 () Bool)

(assert (=> b!958770 m!889365))

(declare-fun m!889367 () Bool)

(assert (=> b!958767 m!889367))

(declare-fun m!889369 () Bool)

(assert (=> mapNonEmpty!33826 m!889369))

(declare-fun m!889371 () Bool)

(assert (=> b!958774 m!889371))

(declare-fun m!889373 () Bool)

(assert (=> b!958772 m!889373))

(assert (=> b!958772 m!889363))

(assert (=> b!958772 m!889373))

(assert (=> b!958772 m!889363))

(declare-fun m!889375 () Bool)

(assert (=> b!958772 m!889375))

(check-sat (not b!958770) b_and!30013 (not b!958772) (not b_next!18525) tp_is_empty!21231 (not start!82252) (not b!958767) (not mapNonEmpty!33826) (not b!958774))
(check-sat b_and!30013 (not b_next!18525))
