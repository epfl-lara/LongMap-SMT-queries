; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82490 () Bool)

(assert start!82490)

(declare-fun b_free!18589 () Bool)

(declare-fun b_next!18589 () Bool)

(assert (=> start!82490 (= b_free!18589 (not b_next!18589))))

(declare-fun tp!64737 () Bool)

(declare-fun b_and!30087 () Bool)

(assert (=> start!82490 (= tp!64737 b_and!30087)))

(declare-fun b!960677 () Bool)

(declare-fun e!541614 () Bool)

(assert (=> b!960677 (= e!541614 false)))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33385 0))(
  ( (V!33386 (val!10701 Int)) )
))
(declare-fun minValue!1328 () V!33385)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58726 0))(
  ( (array!58727 (arr!28232 (Array (_ BitVec 32) (_ BitVec 64))) (size!28712 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58726)

(declare-datatypes ((ValueCell!10169 0))(
  ( (ValueCellFull!10169 (v!13255 V!33385)) (EmptyCell!10169) )
))
(declare-datatypes ((array!58728 0))(
  ( (array!58729 (arr!28233 (Array (_ BitVec 32) ValueCell!10169)) (size!28713 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58728)

(declare-fun lt!430936 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33385)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13782 0))(
  ( (tuple2!13783 (_1!6902 (_ BitVec 64)) (_2!6902 V!33385)) )
))
(declare-datatypes ((List!19613 0))(
  ( (Nil!19610) (Cons!19609 (h!20777 tuple2!13782) (t!27968 List!19613)) )
))
(declare-datatypes ((ListLongMap!12481 0))(
  ( (ListLongMap!12482 (toList!6256 List!19613)) )
))
(declare-fun contains!5368 (ListLongMap!12481 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3489 (array!58726 array!58728 (_ BitVec 32) (_ BitVec 32) V!33385 V!33385 (_ BitVec 32) Int) ListLongMap!12481)

(assert (=> b!960677 (= lt!430936 (contains!5368 (getCurrentListMap!3489 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28232 _keys!1668) i!793)))))

(declare-fun b!960678 () Bool)

(declare-fun res!642804 () Bool)

(assert (=> b!960678 (=> (not res!642804) (not e!541614))))

(assert (=> b!960678 (= res!642804 (and (= (size!28713 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28712 _keys!1668) (size!28713 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33931 () Bool)

(declare-fun mapRes!33931 () Bool)

(assert (=> mapIsEmpty!33931 mapRes!33931))

(declare-fun b!960679 () Bool)

(declare-fun res!642801 () Bool)

(assert (=> b!960679 (=> (not res!642801) (not e!541614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58726 (_ BitVec 32)) Bool)

(assert (=> b!960679 (= res!642801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!642805 () Bool)

(assert (=> start!82490 (=> (not res!642805) (not e!541614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82490 (= res!642805 (validMask!0 mask!2088))))

(assert (=> start!82490 e!541614))

(assert (=> start!82490 true))

(declare-fun tp_is_empty!21301 () Bool)

(assert (=> start!82490 tp_is_empty!21301))

(declare-fun array_inv!21963 (array!58726) Bool)

(assert (=> start!82490 (array_inv!21963 _keys!1668)))

(declare-fun e!541617 () Bool)

(declare-fun array_inv!21964 (array!58728) Bool)

(assert (=> start!82490 (and (array_inv!21964 _values!1386) e!541617)))

(assert (=> start!82490 tp!64737))

(declare-fun b!960680 () Bool)

(declare-fun res!642800 () Bool)

(assert (=> b!960680 (=> (not res!642800) (not e!541614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960680 (= res!642800 (validKeyInArray!0 (select (arr!28232 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33931 () Bool)

(declare-fun tp!64738 () Bool)

(declare-fun e!541613 () Bool)

(assert (=> mapNonEmpty!33931 (= mapRes!33931 (and tp!64738 e!541613))))

(declare-fun mapKey!33931 () (_ BitVec 32))

(declare-fun mapRest!33931 () (Array (_ BitVec 32) ValueCell!10169))

(declare-fun mapValue!33931 () ValueCell!10169)

(assert (=> mapNonEmpty!33931 (= (arr!28233 _values!1386) (store mapRest!33931 mapKey!33931 mapValue!33931))))

(declare-fun b!960681 () Bool)

(declare-fun res!642803 () Bool)

(assert (=> b!960681 (=> (not res!642803) (not e!541614))))

(declare-datatypes ((List!19614 0))(
  ( (Nil!19611) (Cons!19610 (h!20778 (_ BitVec 64)) (t!27969 List!19614)) )
))
(declare-fun arrayNoDuplicates!0 (array!58726 (_ BitVec 32) List!19614) Bool)

(assert (=> b!960681 (= res!642803 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19611))))

(declare-fun b!960682 () Bool)

(assert (=> b!960682 (= e!541613 tp_is_empty!21301)))

(declare-fun b!960683 () Bool)

(declare-fun res!642802 () Bool)

(assert (=> b!960683 (=> (not res!642802) (not e!541614))))

(assert (=> b!960683 (= res!642802 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28712 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28712 _keys!1668))))))

(declare-fun b!960684 () Bool)

(declare-fun e!541615 () Bool)

(assert (=> b!960684 (= e!541617 (and e!541615 mapRes!33931))))

(declare-fun condMapEmpty!33931 () Bool)

(declare-fun mapDefault!33931 () ValueCell!10169)

(assert (=> b!960684 (= condMapEmpty!33931 (= (arr!28233 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10169)) mapDefault!33931)))))

(declare-fun b!960685 () Bool)

(assert (=> b!960685 (= e!541615 tp_is_empty!21301)))

(assert (= (and start!82490 res!642805) b!960678))

(assert (= (and b!960678 res!642804) b!960679))

(assert (= (and b!960679 res!642801) b!960681))

(assert (= (and b!960681 res!642803) b!960683))

(assert (= (and b!960683 res!642802) b!960680))

(assert (= (and b!960680 res!642800) b!960677))

(assert (= (and b!960684 condMapEmpty!33931) mapIsEmpty!33931))

(assert (= (and b!960684 (not condMapEmpty!33931)) mapNonEmpty!33931))

(get-info :version)

(assert (= (and mapNonEmpty!33931 ((_ is ValueCellFull!10169) mapValue!33931)) b!960682))

(assert (= (and b!960684 ((_ is ValueCellFull!10169) mapDefault!33931)) b!960685))

(assert (= start!82490 b!960684))

(declare-fun m!891483 () Bool)

(assert (=> mapNonEmpty!33931 m!891483))

(declare-fun m!891485 () Bool)

(assert (=> b!960677 m!891485))

(declare-fun m!891487 () Bool)

(assert (=> b!960677 m!891487))

(assert (=> b!960677 m!891485))

(assert (=> b!960677 m!891487))

(declare-fun m!891489 () Bool)

(assert (=> b!960677 m!891489))

(declare-fun m!891491 () Bool)

(assert (=> start!82490 m!891491))

(declare-fun m!891493 () Bool)

(assert (=> start!82490 m!891493))

(declare-fun m!891495 () Bool)

(assert (=> start!82490 m!891495))

(declare-fun m!891497 () Bool)

(assert (=> b!960681 m!891497))

(declare-fun m!891499 () Bool)

(assert (=> b!960679 m!891499))

(assert (=> b!960680 m!891487))

(assert (=> b!960680 m!891487))

(declare-fun m!891501 () Bool)

(assert (=> b!960680 m!891501))

(check-sat tp_is_empty!21301 (not b!960677) (not b!960679) (not mapNonEmpty!33931) b_and!30087 (not b_next!18589) (not b!960680) (not b!960681) (not start!82490))
(check-sat b_and!30087 (not b_next!18589))
