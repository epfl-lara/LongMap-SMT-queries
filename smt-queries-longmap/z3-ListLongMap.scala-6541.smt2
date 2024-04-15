; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83112 () Bool)

(assert start!83112)

(declare-fun b_free!19123 () Bool)

(declare-fun b_next!19123 () Bool)

(assert (=> start!83112 (= b_free!19123 (not b_next!19123))))

(declare-fun tp!66648 () Bool)

(declare-fun b_and!30585 () Bool)

(assert (=> start!83112 (= tp!66648 b_and!30585)))

(declare-fun mapIsEmpty!35041 () Bool)

(declare-fun mapRes!35041 () Bool)

(assert (=> mapIsEmpty!35041 mapRes!35041))

(declare-fun b!969516 () Bool)

(declare-fun e!546572 () Bool)

(declare-fun tp_is_empty!22021 () Bool)

(assert (=> b!969516 (= e!546572 tp_is_empty!22021)))

(declare-fun b!969517 () Bool)

(declare-fun e!546574 () Bool)

(assert (=> b!969517 (= e!546574 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun lt!431436 () Bool)

(declare-datatypes ((V!34345 0))(
  ( (V!34346 (val!11061 Int)) )
))
(declare-datatypes ((ValueCell!10529 0))(
  ( (ValueCellFull!10529 (v!13619 V!34345)) (EmptyCell!10529) )
))
(declare-datatypes ((array!60038 0))(
  ( (array!60039 (arr!28883 (Array (_ BitVec 32) ValueCell!10529)) (size!29364 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60038)

(declare-fun zeroValue!1367 () V!34345)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34345)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60040 0))(
  ( (array!60041 (arr!28884 (Array (_ BitVec 32) (_ BitVec 64))) (size!29365 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60040)

(declare-datatypes ((tuple2!14254 0))(
  ( (tuple2!14255 (_1!7138 (_ BitVec 64)) (_2!7138 V!34345)) )
))
(declare-datatypes ((List!20074 0))(
  ( (Nil!20071) (Cons!20070 (h!21232 tuple2!14254) (t!28428 List!20074)) )
))
(declare-datatypes ((ListLongMap!12941 0))(
  ( (ListLongMap!12942 (toList!6486 List!20074)) )
))
(declare-fun contains!5534 (ListLongMap!12941 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3648 (array!60040 array!60038 (_ BitVec 32) (_ BitVec 32) V!34345 V!34345 (_ BitVec 32) Int) ListLongMap!12941)

(assert (=> b!969517 (= lt!431436 (contains!5534 (getCurrentListMap!3648 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28884 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35041 () Bool)

(declare-fun tp!66649 () Bool)

(declare-fun e!546573 () Bool)

(assert (=> mapNonEmpty!35041 (= mapRes!35041 (and tp!66649 e!546573))))

(declare-fun mapRest!35041 () (Array (_ BitVec 32) ValueCell!10529))

(declare-fun mapKey!35041 () (_ BitVec 32))

(declare-fun mapValue!35041 () ValueCell!10529)

(assert (=> mapNonEmpty!35041 (= (arr!28883 _values!1425) (store mapRest!35041 mapKey!35041 mapValue!35041))))

(declare-fun b!969518 () Bool)

(declare-fun e!546576 () Bool)

(assert (=> b!969518 (= e!546576 (and e!546572 mapRes!35041))))

(declare-fun condMapEmpty!35041 () Bool)

(declare-fun mapDefault!35041 () ValueCell!10529)

(assert (=> b!969518 (= condMapEmpty!35041 (= (arr!28883 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10529)) mapDefault!35041)))))

(declare-fun b!969519 () Bool)

(declare-fun res!648959 () Bool)

(assert (=> b!969519 (=> (not res!648959) (not e!546574))))

(assert (=> b!969519 (= res!648959 (and (= (size!29364 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29365 _keys!1717) (size!29364 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!648962 () Bool)

(assert (=> start!83112 (=> (not res!648962) (not e!546574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83112 (= res!648962 (validMask!0 mask!2147))))

(assert (=> start!83112 e!546574))

(assert (=> start!83112 true))

(declare-fun array_inv!22419 (array!60038) Bool)

(assert (=> start!83112 (and (array_inv!22419 _values!1425) e!546576)))

(assert (=> start!83112 tp_is_empty!22021))

(assert (=> start!83112 tp!66648))

(declare-fun array_inv!22420 (array!60040) Bool)

(assert (=> start!83112 (array_inv!22420 _keys!1717)))

(declare-fun b!969520 () Bool)

(declare-fun res!648960 () Bool)

(assert (=> b!969520 (=> (not res!648960) (not e!546574))))

(declare-datatypes ((List!20075 0))(
  ( (Nil!20072) (Cons!20071 (h!21233 (_ BitVec 64)) (t!28429 List!20075)) )
))
(declare-fun arrayNoDuplicates!0 (array!60040 (_ BitVec 32) List!20075) Bool)

(assert (=> b!969520 (= res!648960 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20072))))

(declare-fun b!969521 () Bool)

(declare-fun res!648964 () Bool)

(assert (=> b!969521 (=> (not res!648964) (not e!546574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969521 (= res!648964 (validKeyInArray!0 (select (arr!28884 _keys!1717) i!822)))))

(declare-fun b!969522 () Bool)

(declare-fun res!648963 () Bool)

(assert (=> b!969522 (=> (not res!648963) (not e!546574))))

(assert (=> b!969522 (= res!648963 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29365 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29365 _keys!1717))))))

(declare-fun b!969523 () Bool)

(assert (=> b!969523 (= e!546573 tp_is_empty!22021)))

(declare-fun b!969524 () Bool)

(declare-fun res!648961 () Bool)

(assert (=> b!969524 (=> (not res!648961) (not e!546574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60040 (_ BitVec 32)) Bool)

(assert (=> b!969524 (= res!648961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83112 res!648962) b!969519))

(assert (= (and b!969519 res!648959) b!969524))

(assert (= (and b!969524 res!648961) b!969520))

(assert (= (and b!969520 res!648960) b!969522))

(assert (= (and b!969522 res!648963) b!969521))

(assert (= (and b!969521 res!648964) b!969517))

(assert (= (and b!969518 condMapEmpty!35041) mapIsEmpty!35041))

(assert (= (and b!969518 (not condMapEmpty!35041)) mapNonEmpty!35041))

(get-info :version)

(assert (= (and mapNonEmpty!35041 ((_ is ValueCellFull!10529) mapValue!35041)) b!969523))

(assert (= (and b!969518 ((_ is ValueCellFull!10529) mapDefault!35041)) b!969516))

(assert (= start!83112 b!969518))

(declare-fun m!896909 () Bool)

(assert (=> b!969520 m!896909))

(declare-fun m!896911 () Bool)

(assert (=> mapNonEmpty!35041 m!896911))

(declare-fun m!896913 () Bool)

(assert (=> b!969524 m!896913))

(declare-fun m!896915 () Bool)

(assert (=> start!83112 m!896915))

(declare-fun m!896917 () Bool)

(assert (=> start!83112 m!896917))

(declare-fun m!896919 () Bool)

(assert (=> start!83112 m!896919))

(declare-fun m!896921 () Bool)

(assert (=> b!969521 m!896921))

(assert (=> b!969521 m!896921))

(declare-fun m!896923 () Bool)

(assert (=> b!969521 m!896923))

(declare-fun m!896925 () Bool)

(assert (=> b!969517 m!896925))

(assert (=> b!969517 m!896921))

(assert (=> b!969517 m!896925))

(assert (=> b!969517 m!896921))

(declare-fun m!896927 () Bool)

(assert (=> b!969517 m!896927))

(check-sat (not b!969524) (not start!83112) tp_is_empty!22021 b_and!30585 (not b_next!19123) (not b!969517) (not b!969520) (not mapNonEmpty!35041) (not b!969521))
(check-sat b_and!30585 (not b_next!19123))
