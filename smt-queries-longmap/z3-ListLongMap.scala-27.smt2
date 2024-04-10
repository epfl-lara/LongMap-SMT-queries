; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!596 () Bool)

(assert start!596)

(declare-fun b_free!69 () Bool)

(declare-fun b_next!69 () Bool)

(assert (=> start!596 (= b_free!69 (not b_next!69))))

(declare-fun tp!424 () Bool)

(declare-fun b_and!207 () Bool)

(assert (=> start!596 (= tp!424 b_and!207)))

(declare-fun b!3658 () Bool)

(declare-fun e!1819 () Bool)

(declare-fun tp_is_empty!147 () Bool)

(assert (=> b!3658 (= e!1819 tp_is_empty!147)))

(declare-fun b!3659 () Bool)

(declare-fun res!5294 () Bool)

(declare-fun e!1816 () Bool)

(assert (=> b!3659 (=> (not res!5294) (not e!1816))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!233 0))(
  ( (array!234 (arr!109 (Array (_ BitVec 32) (_ BitVec 64))) (size!171 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!233)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-datatypes ((V!373 0))(
  ( (V!374 (val!79 Int)) )
))
(declare-datatypes ((ValueCell!57 0))(
  ( (ValueCellFull!57 (v!1166 V!373)) (EmptyCell!57) )
))
(declare-datatypes ((array!235 0))(
  ( (array!236 (arr!110 (Array (_ BitVec 32) ValueCell!57)) (size!172 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!235)

(assert (=> b!3659 (= res!5294 (and (= (size!172 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!171 _keys!1806) (size!172 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!5293 () Bool)

(assert (=> start!596 (=> (not res!5293) (not e!1816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!596 (= res!5293 (validMask!0 mask!2250))))

(assert (=> start!596 e!1816))

(assert (=> start!596 tp!424))

(assert (=> start!596 true))

(declare-fun e!1820 () Bool)

(declare-fun array_inv!77 (array!235) Bool)

(assert (=> start!596 (and (array_inv!77 _values!1492) e!1820)))

(assert (=> start!596 tp_is_empty!147))

(declare-fun array_inv!78 (array!233) Bool)

(assert (=> start!596 (array_inv!78 _keys!1806)))

(declare-fun b!3660 () Bool)

(declare-fun e!1818 () Bool)

(declare-fun mapRes!179 () Bool)

(assert (=> b!3660 (= e!1820 (and e!1818 mapRes!179))))

(declare-fun condMapEmpty!179 () Bool)

(declare-fun mapDefault!179 () ValueCell!57)

(assert (=> b!3660 (= condMapEmpty!179 (= (arr!110 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!57)) mapDefault!179)))))

(declare-fun b!3661 () Bool)

(assert (=> b!3661 (= e!1816 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!373)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun lt!504 () Bool)

(declare-fun zeroValue!1434 () V!373)

(declare-datatypes ((tuple2!54 0))(
  ( (tuple2!55 (_1!27 (_ BitVec 64)) (_2!27 V!373)) )
))
(declare-datatypes ((List!64 0))(
  ( (Nil!61) (Cons!60 (h!626 tuple2!54) (t!2191 List!64)) )
))
(declare-datatypes ((ListLongMap!59 0))(
  ( (ListLongMap!60 (toList!45 List!64)) )
))
(declare-fun contains!15 (ListLongMap!59 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4 (array!233 array!235 (_ BitVec 32) (_ BitVec 32) V!373 V!373 (_ BitVec 32) Int) ListLongMap!59)

(assert (=> b!3661 (= lt!504 (contains!15 (getCurrentListMap!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!3662 () Bool)

(declare-fun res!5296 () Bool)

(assert (=> b!3662 (=> (not res!5296) (not e!1816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!233 (_ BitVec 32)) Bool)

(assert (=> b!3662 (= res!5296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3663 () Bool)

(declare-fun res!5295 () Bool)

(assert (=> b!3663 (=> (not res!5295) (not e!1816))))

(declare-datatypes ((List!65 0))(
  ( (Nil!62) (Cons!61 (h!627 (_ BitVec 64)) (t!2192 List!65)) )
))
(declare-fun arrayNoDuplicates!0 (array!233 (_ BitVec 32) List!65) Bool)

(assert (=> b!3663 (= res!5295 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!62))))

(declare-fun b!3664 () Bool)

(assert (=> b!3664 (= e!1818 tp_is_empty!147)))

(declare-fun mapNonEmpty!179 () Bool)

(declare-fun tp!425 () Bool)

(assert (=> mapNonEmpty!179 (= mapRes!179 (and tp!425 e!1819))))

(declare-fun mapRest!179 () (Array (_ BitVec 32) ValueCell!57))

(declare-fun mapKey!179 () (_ BitVec 32))

(declare-fun mapValue!179 () ValueCell!57)

(assert (=> mapNonEmpty!179 (= (arr!110 _values!1492) (store mapRest!179 mapKey!179 mapValue!179))))

(declare-fun mapIsEmpty!179 () Bool)

(assert (=> mapIsEmpty!179 mapRes!179))

(assert (= (and start!596 res!5293) b!3659))

(assert (= (and b!3659 res!5294) b!3662))

(assert (= (and b!3662 res!5296) b!3663))

(assert (= (and b!3663 res!5295) b!3661))

(assert (= (and b!3660 condMapEmpty!179) mapIsEmpty!179))

(assert (= (and b!3660 (not condMapEmpty!179)) mapNonEmpty!179))

(get-info :version)

(assert (= (and mapNonEmpty!179 ((_ is ValueCellFull!57) mapValue!179)) b!3658))

(assert (= (and b!3660 ((_ is ValueCellFull!57) mapDefault!179)) b!3664))

(assert (= start!596 b!3660))

(declare-fun m!1791 () Bool)

(assert (=> start!596 m!1791))

(declare-fun m!1793 () Bool)

(assert (=> start!596 m!1793))

(declare-fun m!1795 () Bool)

(assert (=> start!596 m!1795))

(declare-fun m!1797 () Bool)

(assert (=> b!3661 m!1797))

(assert (=> b!3661 m!1797))

(declare-fun m!1799 () Bool)

(assert (=> b!3661 m!1799))

(declare-fun m!1801 () Bool)

(assert (=> mapNonEmpty!179 m!1801))

(declare-fun m!1803 () Bool)

(assert (=> b!3663 m!1803))

(declare-fun m!1805 () Bool)

(assert (=> b!3662 m!1805))

(check-sat (not start!596) (not b!3661) (not b!3662) (not mapNonEmpty!179) (not b_next!69) b_and!207 tp_is_empty!147 (not b!3663))
(check-sat b_and!207 (not b_next!69))
