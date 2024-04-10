; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83138 () Bool)

(assert start!83138)

(declare-fun b_free!19131 () Bool)

(declare-fun b_next!19131 () Bool)

(assert (=> start!83138 (= b_free!19131 (not b_next!19131))))

(declare-fun tp!66672 () Bool)

(declare-fun b_and!30619 () Bool)

(assert (=> start!83138 (= tp!66672 b_and!30619)))

(declare-fun b!969863 () Bool)

(declare-fun res!649141 () Bool)

(declare-fun e!546781 () Bool)

(assert (=> b!969863 (=> (not res!649141) (not e!546781))))

(declare-datatypes ((array!60119 0))(
  ( (array!60120 (arr!28923 (Array (_ BitVec 32) (_ BitVec 64))) (size!29402 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60119)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60119 (_ BitVec 32)) Bool)

(assert (=> b!969863 (= res!649141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35053 () Bool)

(declare-fun mapRes!35053 () Bool)

(declare-fun tp!66671 () Bool)

(declare-fun e!546784 () Bool)

(assert (=> mapNonEmpty!35053 (= mapRes!35053 (and tp!66671 e!546784))))

(declare-datatypes ((V!34355 0))(
  ( (V!34356 (val!11065 Int)) )
))
(declare-datatypes ((ValueCell!10533 0))(
  ( (ValueCellFull!10533 (v!13624 V!34355)) (EmptyCell!10533) )
))
(declare-datatypes ((array!60121 0))(
  ( (array!60122 (arr!28924 (Array (_ BitVec 32) ValueCell!10533)) (size!29403 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60121)

(declare-fun mapValue!35053 () ValueCell!10533)

(declare-fun mapKey!35053 () (_ BitVec 32))

(declare-fun mapRest!35053 () (Array (_ BitVec 32) ValueCell!10533))

(assert (=> mapNonEmpty!35053 (= (arr!28924 _values!1425) (store mapRest!35053 mapKey!35053 mapValue!35053))))

(declare-fun b!969864 () Bool)

(declare-fun e!546780 () Bool)

(declare-fun tp_is_empty!22029 () Bool)

(assert (=> b!969864 (= e!546780 tp_is_empty!22029)))

(declare-fun b!969865 () Bool)

(assert (=> b!969865 (= e!546781 false)))

(declare-fun lt!431684 () Bool)

(declare-fun zeroValue!1367 () V!34355)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34355)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14174 0))(
  ( (tuple2!14175 (_1!7098 (_ BitVec 64)) (_2!7098 V!34355)) )
))
(declare-datatypes ((List!20043 0))(
  ( (Nil!20040) (Cons!20039 (h!21201 tuple2!14174) (t!28406 List!20043)) )
))
(declare-datatypes ((ListLongMap!12871 0))(
  ( (ListLongMap!12872 (toList!6451 List!20043)) )
))
(declare-fun contains!5555 (ListLongMap!12871 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3684 (array!60119 array!60121 (_ BitVec 32) (_ BitVec 32) V!34355 V!34355 (_ BitVec 32) Int) ListLongMap!12871)

(assert (=> b!969865 (= lt!431684 (contains!5555 (getCurrentListMap!3684 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28923 _keys!1717) i!822)))))

(declare-fun b!969866 () Bool)

(declare-fun e!546782 () Bool)

(assert (=> b!969866 (= e!546782 (and e!546780 mapRes!35053))))

(declare-fun condMapEmpty!35053 () Bool)

(declare-fun mapDefault!35053 () ValueCell!10533)

(assert (=> b!969866 (= condMapEmpty!35053 (= (arr!28924 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10533)) mapDefault!35053)))))

(declare-fun mapIsEmpty!35053 () Bool)

(assert (=> mapIsEmpty!35053 mapRes!35053))

(declare-fun res!649146 () Bool)

(assert (=> start!83138 (=> (not res!649146) (not e!546781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83138 (= res!649146 (validMask!0 mask!2147))))

(assert (=> start!83138 e!546781))

(assert (=> start!83138 true))

(declare-fun array_inv!22389 (array!60121) Bool)

(assert (=> start!83138 (and (array_inv!22389 _values!1425) e!546782)))

(assert (=> start!83138 tp_is_empty!22029))

(assert (=> start!83138 tp!66672))

(declare-fun array_inv!22390 (array!60119) Bool)

(assert (=> start!83138 (array_inv!22390 _keys!1717)))

(declare-fun b!969867 () Bool)

(declare-fun res!649143 () Bool)

(assert (=> b!969867 (=> (not res!649143) (not e!546781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969867 (= res!649143 (validKeyInArray!0 (select (arr!28923 _keys!1717) i!822)))))

(declare-fun b!969868 () Bool)

(assert (=> b!969868 (= e!546784 tp_is_empty!22029)))

(declare-fun b!969869 () Bool)

(declare-fun res!649142 () Bool)

(assert (=> b!969869 (=> (not res!649142) (not e!546781))))

(declare-datatypes ((List!20044 0))(
  ( (Nil!20041) (Cons!20040 (h!21202 (_ BitVec 64)) (t!28407 List!20044)) )
))
(declare-fun arrayNoDuplicates!0 (array!60119 (_ BitVec 32) List!20044) Bool)

(assert (=> b!969869 (= res!649142 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20041))))

(declare-fun b!969870 () Bool)

(declare-fun res!649145 () Bool)

(assert (=> b!969870 (=> (not res!649145) (not e!546781))))

(assert (=> b!969870 (= res!649145 (and (= (size!29403 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29402 _keys!1717) (size!29403 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969871 () Bool)

(declare-fun res!649144 () Bool)

(assert (=> b!969871 (=> (not res!649144) (not e!546781))))

(assert (=> b!969871 (= res!649144 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29402 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29402 _keys!1717))))))

(assert (= (and start!83138 res!649146) b!969870))

(assert (= (and b!969870 res!649145) b!969863))

(assert (= (and b!969863 res!649141) b!969869))

(assert (= (and b!969869 res!649142) b!969871))

(assert (= (and b!969871 res!649144) b!969867))

(assert (= (and b!969867 res!649143) b!969865))

(assert (= (and b!969866 condMapEmpty!35053) mapIsEmpty!35053))

(assert (= (and b!969866 (not condMapEmpty!35053)) mapNonEmpty!35053))

(get-info :version)

(assert (= (and mapNonEmpty!35053 ((_ is ValueCellFull!10533) mapValue!35053)) b!969868))

(assert (= (and b!969866 ((_ is ValueCellFull!10533) mapDefault!35053)) b!969864))

(assert (= start!83138 b!969866))

(declare-fun m!897747 () Bool)

(assert (=> mapNonEmpty!35053 m!897747))

(declare-fun m!897749 () Bool)

(assert (=> b!969867 m!897749))

(assert (=> b!969867 m!897749))

(declare-fun m!897751 () Bool)

(assert (=> b!969867 m!897751))

(declare-fun m!897753 () Bool)

(assert (=> b!969863 m!897753))

(declare-fun m!897755 () Bool)

(assert (=> b!969865 m!897755))

(assert (=> b!969865 m!897749))

(assert (=> b!969865 m!897755))

(assert (=> b!969865 m!897749))

(declare-fun m!897757 () Bool)

(assert (=> b!969865 m!897757))

(declare-fun m!897759 () Bool)

(assert (=> b!969869 m!897759))

(declare-fun m!897761 () Bool)

(assert (=> start!83138 m!897761))

(declare-fun m!897763 () Bool)

(assert (=> start!83138 m!897763))

(declare-fun m!897765 () Bool)

(assert (=> start!83138 m!897765))

(check-sat (not b!969863) (not b!969867) (not b_next!19131) tp_is_empty!22029 (not b!969869) b_and!30619 (not b!969865) (not mapNonEmpty!35053) (not start!83138))
(check-sat b_and!30619 (not b_next!19131))
