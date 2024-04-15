; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83376 () Bool)

(assert start!83376)

(declare-fun b_free!19387 () Bool)

(declare-fun b_next!19387 () Bool)

(assert (=> start!83376 (= b_free!19387 (not b_next!19387))))

(declare-fun tp!67441 () Bool)

(declare-fun b_and!30963 () Bool)

(assert (=> start!83376 (= tp!67441 b_and!30963)))

(declare-fun b!973655 () Bool)

(declare-fun res!651801 () Bool)

(declare-fun e!548807 () Bool)

(assert (=> b!973655 (=> (not res!651801) (not e!548807))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34697 0))(
  ( (V!34698 (val!11193 Int)) )
))
(declare-datatypes ((ValueCell!10661 0))(
  ( (ValueCellFull!10661 (v!13751 V!34697)) (EmptyCell!10661) )
))
(declare-datatypes ((array!60538 0))(
  ( (array!60539 (arr!29133 (Array (_ BitVec 32) ValueCell!10661)) (size!29614 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60538)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60540 0))(
  ( (array!60541 (arr!29134 (Array (_ BitVec 32) (_ BitVec 64))) (size!29615 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60540)

(assert (=> b!973655 (= res!651801 (and (= (size!29614 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29615 _keys!1717) (size!29614 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35437 () Bool)

(declare-fun mapRes!35437 () Bool)

(assert (=> mapIsEmpty!35437 mapRes!35437))

(declare-fun b!973656 () Bool)

(declare-fun e!548804 () Bool)

(declare-fun tp_is_empty!22285 () Bool)

(assert (=> b!973656 (= e!548804 tp_is_empty!22285)))

(declare-fun b!973657 () Bool)

(declare-fun e!548805 () Bool)

(assert (=> b!973657 (= e!548805 tp_is_empty!22285)))

(declare-fun res!651798 () Bool)

(assert (=> start!83376 (=> (not res!651798) (not e!548807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83376 (= res!651798 (validMask!0 mask!2147))))

(assert (=> start!83376 e!548807))

(assert (=> start!83376 true))

(declare-fun e!548808 () Bool)

(declare-fun array_inv!22587 (array!60538) Bool)

(assert (=> start!83376 (and (array_inv!22587 _values!1425) e!548808)))

(assert (=> start!83376 tp_is_empty!22285))

(assert (=> start!83376 tp!67441))

(declare-fun array_inv!22588 (array!60540) Bool)

(assert (=> start!83376 (array_inv!22588 _keys!1717)))

(declare-fun b!973658 () Bool)

(declare-fun res!651796 () Bool)

(assert (=> b!973658 (=> (not res!651796) (not e!548807))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973658 (= res!651796 (validKeyInArray!0 (select (arr!29134 _keys!1717) i!822)))))

(declare-fun b!973659 () Bool)

(declare-fun res!651799 () Bool)

(assert (=> b!973659 (=> (not res!651799) (not e!548807))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973659 (= res!651799 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29615 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29615 _keys!1717))))))

(declare-fun mapNonEmpty!35437 () Bool)

(declare-fun tp!67440 () Bool)

(assert (=> mapNonEmpty!35437 (= mapRes!35437 (and tp!67440 e!548804))))

(declare-fun mapKey!35437 () (_ BitVec 32))

(declare-fun mapValue!35437 () ValueCell!10661)

(declare-fun mapRest!35437 () (Array (_ BitVec 32) ValueCell!10661))

(assert (=> mapNonEmpty!35437 (= (arr!29133 _values!1425) (store mapRest!35437 mapKey!35437 mapValue!35437))))

(declare-fun b!973660 () Bool)

(declare-fun res!651800 () Bool)

(assert (=> b!973660 (=> (not res!651800) (not e!548807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60540 (_ BitVec 32)) Bool)

(assert (=> b!973660 (= res!651800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973661 () Bool)

(declare-fun res!651797 () Bool)

(assert (=> b!973661 (=> (not res!651797) (not e!548807))))

(declare-datatypes ((List!20255 0))(
  ( (Nil!20252) (Cons!20251 (h!21413 (_ BitVec 64)) (t!28723 List!20255)) )
))
(declare-fun arrayNoDuplicates!0 (array!60540 (_ BitVec 32) List!20255) Bool)

(assert (=> b!973661 (= res!651797 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20252))))

(declare-fun b!973662 () Bool)

(assert (=> b!973662 (= e!548808 (and e!548805 mapRes!35437))))

(declare-fun condMapEmpty!35437 () Bool)

(declare-fun mapDefault!35437 () ValueCell!10661)

(assert (=> b!973662 (= condMapEmpty!35437 (= (arr!29133 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10661)) mapDefault!35437)))))

(declare-fun b!973663 () Bool)

(assert (=> b!973663 (= e!548807 false)))

(declare-fun zeroValue!1367 () V!34697)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34697)

(declare-datatypes ((tuple2!14448 0))(
  ( (tuple2!14449 (_1!7235 (_ BitVec 64)) (_2!7235 V!34697)) )
))
(declare-datatypes ((List!20256 0))(
  ( (Nil!20253) (Cons!20252 (h!21414 tuple2!14448) (t!28724 List!20256)) )
))
(declare-datatypes ((ListLongMap!13135 0))(
  ( (ListLongMap!13136 (toList!6583 List!20256)) )
))
(declare-fun lt!432480 () ListLongMap!13135)

(declare-fun getCurrentListMap!3745 (array!60540 array!60538 (_ BitVec 32) (_ BitVec 32) V!34697 V!34697 (_ BitVec 32) Int) ListLongMap!13135)

(assert (=> b!973663 (= lt!432480 (getCurrentListMap!3745 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973664 () Bool)

(declare-fun res!651802 () Bool)

(assert (=> b!973664 (=> (not res!651802) (not e!548807))))

(declare-fun contains!5623 (ListLongMap!13135 (_ BitVec 64)) Bool)

(assert (=> b!973664 (= res!651802 (contains!5623 (getCurrentListMap!3745 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29134 _keys!1717) i!822)))))

(assert (= (and start!83376 res!651798) b!973655))

(assert (= (and b!973655 res!651801) b!973660))

(assert (= (and b!973660 res!651800) b!973661))

(assert (= (and b!973661 res!651797) b!973659))

(assert (= (and b!973659 res!651799) b!973658))

(assert (= (and b!973658 res!651796) b!973664))

(assert (= (and b!973664 res!651802) b!973663))

(assert (= (and b!973662 condMapEmpty!35437) mapIsEmpty!35437))

(assert (= (and b!973662 (not condMapEmpty!35437)) mapNonEmpty!35437))

(get-info :version)

(assert (= (and mapNonEmpty!35437 ((_ is ValueCellFull!10661) mapValue!35437)) b!973656))

(assert (= (and b!973662 ((_ is ValueCellFull!10661) mapDefault!35437)) b!973657))

(assert (= start!83376 b!973662))

(declare-fun m!900803 () Bool)

(assert (=> b!973661 m!900803))

(declare-fun m!900805 () Bool)

(assert (=> b!973658 m!900805))

(assert (=> b!973658 m!900805))

(declare-fun m!900807 () Bool)

(assert (=> b!973658 m!900807))

(declare-fun m!900809 () Bool)

(assert (=> b!973663 m!900809))

(declare-fun m!900811 () Bool)

(assert (=> b!973660 m!900811))

(declare-fun m!900813 () Bool)

(assert (=> mapNonEmpty!35437 m!900813))

(declare-fun m!900815 () Bool)

(assert (=> b!973664 m!900815))

(assert (=> b!973664 m!900805))

(assert (=> b!973664 m!900815))

(assert (=> b!973664 m!900805))

(declare-fun m!900817 () Bool)

(assert (=> b!973664 m!900817))

(declare-fun m!900819 () Bool)

(assert (=> start!83376 m!900819))

(declare-fun m!900821 () Bool)

(assert (=> start!83376 m!900821))

(declare-fun m!900823 () Bool)

(assert (=> start!83376 m!900823))

(check-sat (not b!973664) (not b!973658) (not b!973660) (not mapNonEmpty!35437) tp_is_empty!22285 (not b!973661) (not start!83376) (not b_next!19387) (not b!973663) b_and!30963)
(check-sat b_and!30963 (not b_next!19387))
