; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82354 () Bool)

(assert start!82354)

(declare-fun b_free!18621 () Bool)

(declare-fun b_next!18621 () Bool)

(assert (=> start!82354 (= b_free!18621 (not b_next!18621))))

(declare-fun tp!64833 () Bool)

(declare-fun b_and!30109 () Bool)

(assert (=> start!82354 (= tp!64833 b_and!30109)))

(declare-fun b!960206 () Bool)

(declare-fun res!642748 () Bool)

(declare-fun e!541275 () Bool)

(assert (=> b!960206 (=> (not res!642748) (not e!541275))))

(declare-datatypes ((array!58757 0))(
  ( (array!58758 (arr!28252 (Array (_ BitVec 32) (_ BitVec 64))) (size!28731 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58757)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58757 (_ BitVec 32)) Bool)

(assert (=> b!960206 (= res!642748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!960207 () Bool)

(declare-fun res!642746 () Bool)

(assert (=> b!960207 (=> (not res!642746) (not e!541275))))

(declare-datatypes ((V!33427 0))(
  ( (V!33428 (val!10717 Int)) )
))
(declare-datatypes ((ValueCell!10185 0))(
  ( (ValueCellFull!10185 (v!13274 V!33427)) (EmptyCell!10185) )
))
(declare-datatypes ((array!58759 0))(
  ( (array!58760 (arr!28253 (Array (_ BitVec 32) ValueCell!10185)) (size!28732 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58759)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!960207 (= res!642746 (and (= (size!28732 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28731 _keys!1668) (size!28732 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!960208 () Bool)

(assert (=> b!960208 (= e!541275 false)))

(declare-fun minValue!1328 () V!33427)

(declare-fun defaultEntry!1389 () Int)

(declare-fun lt!430623 () Bool)

(declare-fun zeroValue!1328 () V!33427)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13826 0))(
  ( (tuple2!13827 (_1!6924 (_ BitVec 64)) (_2!6924 V!33427)) )
))
(declare-datatypes ((List!19646 0))(
  ( (Nil!19643) (Cons!19642 (h!20804 tuple2!13826) (t!28009 List!19646)) )
))
(declare-datatypes ((ListLongMap!12523 0))(
  ( (ListLongMap!12524 (toList!6277 List!19646)) )
))
(declare-fun contains!5376 (ListLongMap!12523 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3510 (array!58757 array!58759 (_ BitVec 32) (_ BitVec 32) V!33427 V!33427 (_ BitVec 32) Int) ListLongMap!12523)

(assert (=> b!960208 (= lt!430623 (contains!5376 (getCurrentListMap!3510 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28252 _keys!1668) i!793)))))

(declare-fun b!960209 () Bool)

(declare-fun e!541273 () Bool)

(declare-fun tp_is_empty!21333 () Bool)

(assert (=> b!960209 (= e!541273 tp_is_empty!21333)))

(declare-fun mapNonEmpty!33979 () Bool)

(declare-fun mapRes!33979 () Bool)

(declare-fun tp!64832 () Bool)

(assert (=> mapNonEmpty!33979 (= mapRes!33979 (and tp!64832 e!541273))))

(declare-fun mapRest!33979 () (Array (_ BitVec 32) ValueCell!10185))

(declare-fun mapValue!33979 () ValueCell!10185)

(declare-fun mapKey!33979 () (_ BitVec 32))

(assert (=> mapNonEmpty!33979 (= (arr!28253 _values!1386) (store mapRest!33979 mapKey!33979 mapValue!33979))))

(declare-fun b!960210 () Bool)

(declare-fun res!642747 () Bool)

(assert (=> b!960210 (=> (not res!642747) (not e!541275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!960210 (= res!642747 (validKeyInArray!0 (select (arr!28252 _keys!1668) i!793)))))

(declare-fun b!960212 () Bool)

(declare-fun res!642745 () Bool)

(assert (=> b!960212 (=> (not res!642745) (not e!541275))))

(assert (=> b!960212 (= res!642745 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28731 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28731 _keys!1668))))))

(declare-fun b!960213 () Bool)

(declare-fun e!541272 () Bool)

(declare-fun e!541274 () Bool)

(assert (=> b!960213 (= e!541272 (and e!541274 mapRes!33979))))

(declare-fun condMapEmpty!33979 () Bool)

(declare-fun mapDefault!33979 () ValueCell!10185)

(assert (=> b!960213 (= condMapEmpty!33979 (= (arr!28253 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10185)) mapDefault!33979)))))

(declare-fun b!960214 () Bool)

(declare-fun res!642749 () Bool)

(assert (=> b!960214 (=> (not res!642749) (not e!541275))))

(declare-datatypes ((List!19647 0))(
  ( (Nil!19644) (Cons!19643 (h!20805 (_ BitVec 64)) (t!28010 List!19647)) )
))
(declare-fun arrayNoDuplicates!0 (array!58757 (_ BitVec 32) List!19647) Bool)

(assert (=> b!960214 (= res!642749 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19644))))

(declare-fun mapIsEmpty!33979 () Bool)

(assert (=> mapIsEmpty!33979 mapRes!33979))

(declare-fun res!642744 () Bool)

(assert (=> start!82354 (=> (not res!642744) (not e!541275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82354 (= res!642744 (validMask!0 mask!2088))))

(assert (=> start!82354 e!541275))

(assert (=> start!82354 true))

(assert (=> start!82354 tp_is_empty!21333))

(declare-fun array_inv!21893 (array!58757) Bool)

(assert (=> start!82354 (array_inv!21893 _keys!1668)))

(declare-fun array_inv!21894 (array!58759) Bool)

(assert (=> start!82354 (and (array_inv!21894 _values!1386) e!541272)))

(assert (=> start!82354 tp!64833))

(declare-fun b!960211 () Bool)

(assert (=> b!960211 (= e!541274 tp_is_empty!21333)))

(assert (= (and start!82354 res!642744) b!960207))

(assert (= (and b!960207 res!642746) b!960206))

(assert (= (and b!960206 res!642748) b!960214))

(assert (= (and b!960214 res!642749) b!960212))

(assert (= (and b!960212 res!642745) b!960210))

(assert (= (and b!960210 res!642747) b!960208))

(assert (= (and b!960213 condMapEmpty!33979) mapIsEmpty!33979))

(assert (= (and b!960213 (not condMapEmpty!33979)) mapNonEmpty!33979))

(get-info :version)

(assert (= (and mapNonEmpty!33979 ((_ is ValueCellFull!10185) mapValue!33979)) b!960209))

(assert (= (and b!960213 ((_ is ValueCellFull!10185) mapDefault!33979)) b!960211))

(assert (= start!82354 b!960213))

(declare-fun m!890509 () Bool)

(assert (=> start!82354 m!890509))

(declare-fun m!890511 () Bool)

(assert (=> start!82354 m!890511))

(declare-fun m!890513 () Bool)

(assert (=> start!82354 m!890513))

(declare-fun m!890515 () Bool)

(assert (=> b!960210 m!890515))

(assert (=> b!960210 m!890515))

(declare-fun m!890517 () Bool)

(assert (=> b!960210 m!890517))

(declare-fun m!890519 () Bool)

(assert (=> b!960206 m!890519))

(declare-fun m!890521 () Bool)

(assert (=> b!960208 m!890521))

(assert (=> b!960208 m!890515))

(assert (=> b!960208 m!890521))

(assert (=> b!960208 m!890515))

(declare-fun m!890523 () Bool)

(assert (=> b!960208 m!890523))

(declare-fun m!890525 () Bool)

(assert (=> b!960214 m!890525))

(declare-fun m!890527 () Bool)

(assert (=> mapNonEmpty!33979 m!890527))

(check-sat (not b_next!18621) (not mapNonEmpty!33979) (not b!960208) b_and!30109 (not b!960210) (not b!960214) (not b!960206) tp_is_empty!21333 (not start!82354))
(check-sat b_and!30109 (not b_next!18621))
