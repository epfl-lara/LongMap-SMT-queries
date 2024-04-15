; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83142 () Bool)

(assert start!83142)

(declare-fun b_free!19153 () Bool)

(declare-fun b_next!19153 () Bool)

(assert (=> start!83142 (= b_free!19153 (not b_next!19153))))

(declare-fun tp!66739 () Bool)

(declare-fun b_and!30615 () Bool)

(assert (=> start!83142 (= tp!66739 b_and!30615)))

(declare-fun mapNonEmpty!35086 () Bool)

(declare-fun mapRes!35086 () Bool)

(declare-fun tp!66738 () Bool)

(declare-fun e!546799 () Bool)

(assert (=> mapNonEmpty!35086 (= mapRes!35086 (and tp!66738 e!546799))))

(declare-datatypes ((V!34385 0))(
  ( (V!34386 (val!11076 Int)) )
))
(declare-datatypes ((ValueCell!10544 0))(
  ( (ValueCellFull!10544 (v!13634 V!34385)) (EmptyCell!10544) )
))
(declare-fun mapRest!35086 () (Array (_ BitVec 32) ValueCell!10544))

(declare-datatypes ((array!60092 0))(
  ( (array!60093 (arr!28910 (Array (_ BitVec 32) ValueCell!10544)) (size!29391 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60092)

(declare-fun mapValue!35086 () ValueCell!10544)

(declare-fun mapKey!35086 () (_ BitVec 32))

(assert (=> mapNonEmpty!35086 (= (arr!28910 _values!1425) (store mapRest!35086 mapKey!35086 mapValue!35086))))

(declare-fun b!969930 () Bool)

(declare-fun res!649242 () Bool)

(declare-fun e!546800 () Bool)

(assert (=> b!969930 (=> (not res!649242) (not e!546800))))

(declare-datatypes ((array!60094 0))(
  ( (array!60095 (arr!28911 (Array (_ BitVec 32) (_ BitVec 64))) (size!29392 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60094)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60094 (_ BitVec 32)) Bool)

(assert (=> b!969930 (= res!649242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!649238 () Bool)

(assert (=> start!83142 (=> (not res!649238) (not e!546800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83142 (= res!649238 (validMask!0 mask!2147))))

(assert (=> start!83142 e!546800))

(assert (=> start!83142 true))

(declare-fun e!546798 () Bool)

(declare-fun array_inv!22439 (array!60092) Bool)

(assert (=> start!83142 (and (array_inv!22439 _values!1425) e!546798)))

(declare-fun tp_is_empty!22051 () Bool)

(assert (=> start!83142 tp_is_empty!22051))

(assert (=> start!83142 tp!66739))

(declare-fun array_inv!22440 (array!60094) Bool)

(assert (=> start!83142 (array_inv!22440 _keys!1717)))

(declare-fun b!969931 () Bool)

(declare-fun e!546797 () Bool)

(assert (=> b!969931 (= e!546797 tp_is_empty!22051)))

(declare-fun b!969932 () Bool)

(declare-fun res!649239 () Bool)

(assert (=> b!969932 (=> (not res!649239) (not e!546800))))

(declare-datatypes ((List!20092 0))(
  ( (Nil!20089) (Cons!20088 (h!21250 (_ BitVec 64)) (t!28446 List!20092)) )
))
(declare-fun arrayNoDuplicates!0 (array!60094 (_ BitVec 32) List!20092) Bool)

(assert (=> b!969932 (= res!649239 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20089))))

(declare-fun b!969933 () Bool)

(declare-fun res!649241 () Bool)

(assert (=> b!969933 (=> (not res!649241) (not e!546800))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!969933 (= res!649241 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29392 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29392 _keys!1717))))))

(declare-fun mapIsEmpty!35086 () Bool)

(assert (=> mapIsEmpty!35086 mapRes!35086))

(declare-fun b!969934 () Bool)

(declare-fun res!649243 () Bool)

(assert (=> b!969934 (=> (not res!649243) (not e!546800))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969934 (= res!649243 (and (= (size!29391 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29392 _keys!1717) (size!29391 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969935 () Bool)

(assert (=> b!969935 (= e!546800 false)))

(declare-fun zeroValue!1367 () V!34385)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34385)

(declare-fun lt!431472 () Bool)

(declare-datatypes ((tuple2!14272 0))(
  ( (tuple2!14273 (_1!7147 (_ BitVec 64)) (_2!7147 V!34385)) )
))
(declare-datatypes ((List!20093 0))(
  ( (Nil!20090) (Cons!20089 (h!21251 tuple2!14272) (t!28447 List!20093)) )
))
(declare-datatypes ((ListLongMap!12959 0))(
  ( (ListLongMap!12960 (toList!6495 List!20093)) )
))
(declare-fun contains!5543 (ListLongMap!12959 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3657 (array!60094 array!60092 (_ BitVec 32) (_ BitVec 32) V!34385 V!34385 (_ BitVec 32) Int) ListLongMap!12959)

(assert (=> b!969935 (= lt!431472 (contains!5543 (getCurrentListMap!3657 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28911 _keys!1717) i!822)))))

(declare-fun b!969936 () Bool)

(assert (=> b!969936 (= e!546798 (and e!546797 mapRes!35086))))

(declare-fun condMapEmpty!35086 () Bool)

(declare-fun mapDefault!35086 () ValueCell!10544)

(assert (=> b!969936 (= condMapEmpty!35086 (= (arr!28910 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10544)) mapDefault!35086)))))

(declare-fun b!969937 () Bool)

(assert (=> b!969937 (= e!546799 tp_is_empty!22051)))

(declare-fun b!969938 () Bool)

(declare-fun res!649240 () Bool)

(assert (=> b!969938 (=> (not res!649240) (not e!546800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969938 (= res!649240 (validKeyInArray!0 (select (arr!28911 _keys!1717) i!822)))))

(assert (= (and start!83142 res!649238) b!969934))

(assert (= (and b!969934 res!649243) b!969930))

(assert (= (and b!969930 res!649242) b!969932))

(assert (= (and b!969932 res!649239) b!969933))

(assert (= (and b!969933 res!649241) b!969938))

(assert (= (and b!969938 res!649240) b!969935))

(assert (= (and b!969936 condMapEmpty!35086) mapIsEmpty!35086))

(assert (= (and b!969936 (not condMapEmpty!35086)) mapNonEmpty!35086))

(get-info :version)

(assert (= (and mapNonEmpty!35086 ((_ is ValueCellFull!10544) mapValue!35086)) b!969937))

(assert (= (and b!969936 ((_ is ValueCellFull!10544) mapDefault!35086)) b!969931))

(assert (= start!83142 b!969936))

(declare-fun m!897209 () Bool)

(assert (=> b!969938 m!897209))

(assert (=> b!969938 m!897209))

(declare-fun m!897211 () Bool)

(assert (=> b!969938 m!897211))

(declare-fun m!897213 () Bool)

(assert (=> b!969930 m!897213))

(declare-fun m!897215 () Bool)

(assert (=> start!83142 m!897215))

(declare-fun m!897217 () Bool)

(assert (=> start!83142 m!897217))

(declare-fun m!897219 () Bool)

(assert (=> start!83142 m!897219))

(declare-fun m!897221 () Bool)

(assert (=> mapNonEmpty!35086 m!897221))

(declare-fun m!897223 () Bool)

(assert (=> b!969935 m!897223))

(assert (=> b!969935 m!897209))

(assert (=> b!969935 m!897223))

(assert (=> b!969935 m!897209))

(declare-fun m!897225 () Bool)

(assert (=> b!969935 m!897225))

(declare-fun m!897227 () Bool)

(assert (=> b!969932 m!897227))

(check-sat (not mapNonEmpty!35086) (not b!969938) b_and!30615 (not b!969930) tp_is_empty!22051 (not start!83142) (not b!969935) (not b!969932) (not b_next!19153))
(check-sat b_and!30615 (not b_next!19153))
