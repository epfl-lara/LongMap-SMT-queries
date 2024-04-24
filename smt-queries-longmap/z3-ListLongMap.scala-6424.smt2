; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82508 () Bool)

(assert start!82508)

(declare-fun b_free!18607 () Bool)

(declare-fun b_next!18607 () Bool)

(assert (=> start!82508 (= b_free!18607 (not b_next!18607))))

(declare-fun tp!64791 () Bool)

(declare-fun b_and!30105 () Bool)

(assert (=> start!82508 (= tp!64791 b_and!30105)))

(declare-fun mapNonEmpty!33958 () Bool)

(declare-fun mapRes!33958 () Bool)

(declare-fun tp!64792 () Bool)

(declare-fun e!541748 () Bool)

(assert (=> mapNonEmpty!33958 (= mapRes!33958 (and tp!64792 e!541748))))

(declare-fun mapKey!33958 () (_ BitVec 32))

(declare-datatypes ((V!33409 0))(
  ( (V!33410 (val!10710 Int)) )
))
(declare-datatypes ((ValueCell!10178 0))(
  ( (ValueCellFull!10178 (v!13264 V!33409)) (EmptyCell!10178) )
))
(declare-fun mapValue!33958 () ValueCell!10178)

(declare-fun mapRest!33958 () (Array (_ BitVec 32) ValueCell!10178))

(declare-datatypes ((array!58760 0))(
  ( (array!58761 (arr!28249 (Array (_ BitVec 32) ValueCell!10178)) (size!28729 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58760)

(assert (=> mapNonEmpty!33958 (= (arr!28249 _values!1386) (store mapRest!33958 mapKey!33958 mapValue!33958))))

(declare-fun b!960920 () Bool)

(declare-fun res!642967 () Bool)

(declare-fun e!541750 () Bool)

(assert (=> b!960920 (=> (not res!642967) (not e!541750))))

(declare-datatypes ((array!58762 0))(
  ( (array!58763 (arr!28250 (Array (_ BitVec 32) (_ BitVec 64))) (size!28730 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58762)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960920 (= res!642967 (validKeyInArray!0 (select (arr!28250 _keys!1668) i!793)))))

(declare-fun b!960921 () Bool)

(declare-fun res!642963 () Bool)

(assert (=> b!960921 (=> (not res!642963) (not e!541750))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58762 (_ BitVec 32)) Bool)

(assert (=> b!960921 (= res!642963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960922 () Bool)

(declare-fun res!642964 () Bool)

(assert (=> b!960922 (=> (not res!642964) (not e!541750))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!960922 (= res!642964 (and (= (size!28729 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28730 _keys!1668) (size!28729 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33958 () Bool)

(assert (=> mapIsEmpty!33958 mapRes!33958))

(declare-fun b!960923 () Bool)

(declare-fun res!642965 () Bool)

(assert (=> b!960923 (=> (not res!642965) (not e!541750))))

(declare-datatypes ((List!19627 0))(
  ( (Nil!19624) (Cons!19623 (h!20791 (_ BitVec 64)) (t!27982 List!19627)) )
))
(declare-fun arrayNoDuplicates!0 (array!58762 (_ BitVec 32) List!19627) Bool)

(assert (=> b!960923 (= res!642965 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19624))))

(declare-fun b!960924 () Bool)

(declare-fun e!541749 () Bool)

(declare-fun e!541751 () Bool)

(assert (=> b!960924 (= e!541749 (and e!541751 mapRes!33958))))

(declare-fun condMapEmpty!33958 () Bool)

(declare-fun mapDefault!33958 () ValueCell!10178)

(assert (=> b!960924 (= condMapEmpty!33958 (= (arr!28249 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10178)) mapDefault!33958)))))

(declare-fun b!960925 () Bool)

(declare-fun tp_is_empty!21319 () Bool)

(assert (=> b!960925 (= e!541751 tp_is_empty!21319)))

(declare-fun b!960926 () Bool)

(assert (=> b!960926 (= e!541748 tp_is_empty!21319)))

(declare-fun b!960928 () Bool)

(declare-fun res!642962 () Bool)

(assert (=> b!960928 (=> (not res!642962) (not e!541750))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!960928 (= res!642962 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28730 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28730 _keys!1668))))))

(declare-fun res!642966 () Bool)

(assert (=> start!82508 (=> (not res!642966) (not e!541750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82508 (= res!642966 (validMask!0 mask!2088))))

(assert (=> start!82508 e!541750))

(assert (=> start!82508 true))

(assert (=> start!82508 tp_is_empty!21319))

(declare-fun array_inv!21977 (array!58762) Bool)

(assert (=> start!82508 (array_inv!21977 _keys!1668)))

(declare-fun array_inv!21978 (array!58760) Bool)

(assert (=> start!82508 (and (array_inv!21978 _values!1386) e!541749)))

(assert (=> start!82508 tp!64791))

(declare-fun b!960927 () Bool)

(assert (=> b!960927 (= e!541750 false)))

(declare-fun minValue!1328 () V!33409)

(declare-fun lt!430963 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33409)

(declare-datatypes ((tuple2!13796 0))(
  ( (tuple2!13797 (_1!6909 (_ BitVec 64)) (_2!6909 V!33409)) )
))
(declare-datatypes ((List!19628 0))(
  ( (Nil!19625) (Cons!19624 (h!20792 tuple2!13796) (t!27983 List!19628)) )
))
(declare-datatypes ((ListLongMap!12495 0))(
  ( (ListLongMap!12496 (toList!6263 List!19628)) )
))
(declare-fun contains!5375 (ListLongMap!12495 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3496 (array!58762 array!58760 (_ BitVec 32) (_ BitVec 32) V!33409 V!33409 (_ BitVec 32) Int) ListLongMap!12495)

(assert (=> b!960927 (= lt!430963 (contains!5375 (getCurrentListMap!3496 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28250 _keys!1668) i!793)))))

(assert (= (and start!82508 res!642966) b!960922))

(assert (= (and b!960922 res!642964) b!960921))

(assert (= (and b!960921 res!642963) b!960923))

(assert (= (and b!960923 res!642965) b!960928))

(assert (= (and b!960928 res!642962) b!960920))

(assert (= (and b!960920 res!642967) b!960927))

(assert (= (and b!960924 condMapEmpty!33958) mapIsEmpty!33958))

(assert (= (and b!960924 (not condMapEmpty!33958)) mapNonEmpty!33958))

(get-info :version)

(assert (= (and mapNonEmpty!33958 ((_ is ValueCellFull!10178) mapValue!33958)) b!960926))

(assert (= (and b!960924 ((_ is ValueCellFull!10178) mapDefault!33958)) b!960925))

(assert (= start!82508 b!960924))

(declare-fun m!891663 () Bool)

(assert (=> b!960923 m!891663))

(declare-fun m!891665 () Bool)

(assert (=> b!960920 m!891665))

(assert (=> b!960920 m!891665))

(declare-fun m!891667 () Bool)

(assert (=> b!960920 m!891667))

(declare-fun m!891669 () Bool)

(assert (=> b!960921 m!891669))

(declare-fun m!891671 () Bool)

(assert (=> b!960927 m!891671))

(assert (=> b!960927 m!891665))

(assert (=> b!960927 m!891671))

(assert (=> b!960927 m!891665))

(declare-fun m!891673 () Bool)

(assert (=> b!960927 m!891673))

(declare-fun m!891675 () Bool)

(assert (=> start!82508 m!891675))

(declare-fun m!891677 () Bool)

(assert (=> start!82508 m!891677))

(declare-fun m!891679 () Bool)

(assert (=> start!82508 m!891679))

(declare-fun m!891681 () Bool)

(assert (=> mapNonEmpty!33958 m!891681))

(check-sat (not mapNonEmpty!33958) (not b_next!18607) (not b!960927) b_and!30105 (not start!82508) (not b!960921) (not b!960920) tp_is_empty!21319 (not b!960923))
(check-sat b_and!30105 (not b_next!18607))
