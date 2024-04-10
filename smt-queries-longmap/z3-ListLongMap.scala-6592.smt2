; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83438 () Bool)

(assert start!83438)

(declare-fun b_free!19431 () Bool)

(declare-fun b_next!19431 () Bool)

(assert (=> start!83438 (= b_free!19431 (not b_next!19431))))

(declare-fun tp!67572 () Bool)

(declare-fun b_and!31033 () Bool)

(assert (=> start!83438 (= tp!67572 b_and!31033)))

(declare-fun b!974559 () Bool)

(declare-fun res!652376 () Bool)

(declare-fun e!549288 () Bool)

(assert (=> b!974559 (=> (not res!652376) (not e!549288))))

(declare-datatypes ((array!60697 0))(
  ( (array!60698 (arr!29212 (Array (_ BitVec 32) (_ BitVec 64))) (size!29691 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60697)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60697 (_ BitVec 32)) Bool)

(assert (=> b!974559 (= res!652376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974560 () Bool)

(declare-fun res!652377 () Bool)

(assert (=> b!974560 (=> (not res!652377) (not e!549288))))

(declare-datatypes ((List!20270 0))(
  ( (Nil!20267) (Cons!20266 (h!21428 (_ BitVec 64)) (t!28747 List!20270)) )
))
(declare-fun arrayNoDuplicates!0 (array!60697 (_ BitVec 32) List!20270) Bool)

(assert (=> b!974560 (= res!652377 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20267))))

(declare-fun b!974561 () Bool)

(declare-fun res!652378 () Bool)

(assert (=> b!974561 (=> (not res!652378) (not e!549288))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974561 (= res!652378 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29691 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29691 _keys!1717))))))

(declare-fun b!974562 () Bool)

(declare-fun e!549287 () Bool)

(declare-fun tp_is_empty!22329 () Bool)

(assert (=> b!974562 (= e!549287 tp_is_empty!22329)))

(declare-fun b!974563 () Bool)

(declare-fun res!652374 () Bool)

(assert (=> b!974563 (=> (not res!652374) (not e!549288))))

(declare-datatypes ((V!34755 0))(
  ( (V!34756 (val!11215 Int)) )
))
(declare-datatypes ((ValueCell!10683 0))(
  ( (ValueCellFull!10683 (v!13774 V!34755)) (EmptyCell!10683) )
))
(declare-datatypes ((array!60699 0))(
  ( (array!60700 (arr!29213 (Array (_ BitVec 32) ValueCell!10683)) (size!29692 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60699)

(declare-fun zeroValue!1367 () V!34755)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34755)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14418 0))(
  ( (tuple2!14419 (_1!7220 (_ BitVec 64)) (_2!7220 V!34755)) )
))
(declare-datatypes ((List!20271 0))(
  ( (Nil!20268) (Cons!20267 (h!21429 tuple2!14418) (t!28748 List!20271)) )
))
(declare-datatypes ((ListLongMap!13115 0))(
  ( (ListLongMap!13116 (toList!6573 List!20271)) )
))
(declare-fun contains!5659 (ListLongMap!13115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3806 (array!60697 array!60699 (_ BitVec 32) (_ BitVec 32) V!34755 V!34755 (_ BitVec 32) Int) ListLongMap!13115)

(assert (=> b!974563 (= res!652374 (contains!5659 (getCurrentListMap!3806 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29212 _keys!1717) i!822)))))

(declare-fun b!974564 () Bool)

(declare-fun e!549289 () Bool)

(assert (=> b!974564 (= e!549289 (bvsgt (bvsub from!2118 #b00000000000000000000000000000001) (size!29691 _keys!1717)))))

(declare-fun res!652379 () Bool)

(assert (=> start!83438 (=> (not res!652379) (not e!549288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83438 (= res!652379 (validMask!0 mask!2147))))

(assert (=> start!83438 e!549288))

(assert (=> start!83438 true))

(declare-fun e!549292 () Bool)

(declare-fun array_inv!22591 (array!60699) Bool)

(assert (=> start!83438 (and (array_inv!22591 _values!1425) e!549292)))

(assert (=> start!83438 tp_is_empty!22329))

(assert (=> start!83438 tp!67572))

(declare-fun array_inv!22592 (array!60697) Bool)

(assert (=> start!83438 (array_inv!22592 _keys!1717)))

(declare-fun b!974565 () Bool)

(declare-fun res!652375 () Bool)

(assert (=> b!974565 (=> (not res!652375) (not e!549288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974565 (= res!652375 (validKeyInArray!0 (select (arr!29212 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35503 () Bool)

(declare-fun mapRes!35503 () Bool)

(assert (=> mapIsEmpty!35503 mapRes!35503))

(declare-fun mapNonEmpty!35503 () Bool)

(declare-fun tp!67571 () Bool)

(assert (=> mapNonEmpty!35503 (= mapRes!35503 (and tp!67571 e!549287))))

(declare-fun mapValue!35503 () ValueCell!10683)

(declare-fun mapKey!35503 () (_ BitVec 32))

(declare-fun mapRest!35503 () (Array (_ BitVec 32) ValueCell!10683))

(assert (=> mapNonEmpty!35503 (= (arr!29213 _values!1425) (store mapRest!35503 mapKey!35503 mapValue!35503))))

(declare-fun b!974566 () Bool)

(assert (=> b!974566 (= e!549288 e!549289)))

(declare-fun res!652380 () Bool)

(assert (=> b!974566 (=> (not res!652380) (not e!549289))))

(assert (=> b!974566 (= res!652380 (not (validKeyInArray!0 (select (arr!29212 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun lt!432782 () ListLongMap!13115)

(assert (=> b!974566 (= lt!432782 (getCurrentListMap!3806 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974567 () Bool)

(declare-fun res!652373 () Bool)

(assert (=> b!974567 (=> (not res!652373) (not e!549288))))

(assert (=> b!974567 (= res!652373 (and (= (size!29692 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29691 _keys!1717) (size!29692 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974568 () Bool)

(declare-fun e!549291 () Bool)

(assert (=> b!974568 (= e!549292 (and e!549291 mapRes!35503))))

(declare-fun condMapEmpty!35503 () Bool)

(declare-fun mapDefault!35503 () ValueCell!10683)

(assert (=> b!974568 (= condMapEmpty!35503 (= (arr!29213 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10683)) mapDefault!35503)))))

(declare-fun b!974569 () Bool)

(assert (=> b!974569 (= e!549291 tp_is_empty!22329)))

(assert (= (and start!83438 res!652379) b!974567))

(assert (= (and b!974567 res!652373) b!974559))

(assert (= (and b!974559 res!652376) b!974560))

(assert (= (and b!974560 res!652377) b!974561))

(assert (= (and b!974561 res!652378) b!974565))

(assert (= (and b!974565 res!652375) b!974563))

(assert (= (and b!974563 res!652374) b!974566))

(assert (= (and b!974566 res!652380) b!974564))

(assert (= (and b!974568 condMapEmpty!35503) mapIsEmpty!35503))

(assert (= (and b!974568 (not condMapEmpty!35503)) mapNonEmpty!35503))

(get-info :version)

(assert (= (and mapNonEmpty!35503 ((_ is ValueCellFull!10683) mapValue!35503)) b!974562))

(assert (= (and b!974568 ((_ is ValueCellFull!10683) mapDefault!35503)) b!974569))

(assert (= start!83438 b!974568))

(declare-fun m!902049 () Bool)

(assert (=> b!974563 m!902049))

(declare-fun m!902051 () Bool)

(assert (=> b!974563 m!902051))

(assert (=> b!974563 m!902049))

(assert (=> b!974563 m!902051))

(declare-fun m!902053 () Bool)

(assert (=> b!974563 m!902053))

(declare-fun m!902055 () Bool)

(assert (=> start!83438 m!902055))

(declare-fun m!902057 () Bool)

(assert (=> start!83438 m!902057))

(declare-fun m!902059 () Bool)

(assert (=> start!83438 m!902059))

(declare-fun m!902061 () Bool)

(assert (=> b!974560 m!902061))

(declare-fun m!902063 () Bool)

(assert (=> mapNonEmpty!35503 m!902063))

(declare-fun m!902065 () Bool)

(assert (=> b!974559 m!902065))

(declare-fun m!902067 () Bool)

(assert (=> b!974566 m!902067))

(assert (=> b!974566 m!902067))

(declare-fun m!902069 () Bool)

(assert (=> b!974566 m!902069))

(declare-fun m!902071 () Bool)

(assert (=> b!974566 m!902071))

(assert (=> b!974565 m!902051))

(assert (=> b!974565 m!902051))

(declare-fun m!902073 () Bool)

(assert (=> b!974565 m!902073))

(check-sat (not b!974560) (not b!974566) (not mapNonEmpty!35503) (not b!974563) (not start!83438) (not b!974565) tp_is_empty!22329 (not b!974559) b_and!31033 (not b_next!19431))
(check-sat b_and!31033 (not b_next!19431))
