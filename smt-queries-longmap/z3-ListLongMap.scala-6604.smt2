; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83490 () Bool)

(assert start!83490)

(declare-fun b_free!19495 () Bool)

(declare-fun b_next!19495 () Bool)

(assert (=> start!83490 (= b_free!19495 (not b_next!19495))))

(declare-fun tp!67773 () Bool)

(declare-fun b_and!31071 () Bool)

(assert (=> start!83490 (= tp!67773 b_and!31071)))

(declare-fun b!975340 () Bool)

(declare-fun e!549670 () Bool)

(declare-fun tp_is_empty!22399 () Bool)

(assert (=> b!975340 (= e!549670 tp_is_empty!22399)))

(declare-fun b!975341 () Bool)

(declare-fun res!652969 () Bool)

(declare-fun e!549674 () Bool)

(assert (=> b!975341 (=> (not res!652969) (not e!549674))))

(declare-datatypes ((array!60758 0))(
  ( (array!60759 (arr!29243 (Array (_ BitVec 32) (_ BitVec 64))) (size!29724 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60758)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60758 (_ BitVec 32)) Bool)

(assert (=> b!975341 (= res!652969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975342 () Bool)

(declare-fun res!652973 () Bool)

(assert (=> b!975342 (=> (not res!652973) (not e!549674))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975342 (= res!652973 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29724 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29724 _keys!1717))))))

(declare-fun b!975343 () Bool)

(declare-fun res!652975 () Bool)

(assert (=> b!975343 (=> (not res!652975) (not e!549674))))

(declare-datatypes ((List!20339 0))(
  ( (Nil!20336) (Cons!20335 (h!21497 (_ BitVec 64)) (t!28807 List!20339)) )
))
(declare-fun arrayNoDuplicates!0 (array!60758 (_ BitVec 32) List!20339) Bool)

(assert (=> b!975343 (= res!652975 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20336))))

(declare-fun b!975344 () Bool)

(declare-fun res!652970 () Bool)

(assert (=> b!975344 (=> (not res!652970) (not e!549674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975344 (= res!652970 (validKeyInArray!0 (select (arr!29243 _keys!1717) i!822)))))

(declare-fun b!975345 () Bool)

(declare-fun e!549672 () Bool)

(assert (=> b!975345 (= e!549672 tp_is_empty!22399)))

(declare-fun b!975346 () Bool)

(declare-fun res!652971 () Bool)

(assert (=> b!975346 (=> (not res!652971) (not e!549674))))

(declare-datatypes ((V!34849 0))(
  ( (V!34850 (val!11250 Int)) )
))
(declare-datatypes ((ValueCell!10718 0))(
  ( (ValueCellFull!10718 (v!13808 V!34849)) (EmptyCell!10718) )
))
(declare-datatypes ((array!60760 0))(
  ( (array!60761 (arr!29244 (Array (_ BitVec 32) ValueCell!10718)) (size!29725 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60760)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!975346 (= res!652971 (and (= (size!29725 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29724 _keys!1717) (size!29725 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975347 () Bool)

(declare-fun res!652972 () Bool)

(assert (=> b!975347 (=> (not res!652972) (not e!549674))))

(declare-fun zeroValue!1367 () V!34849)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34849)

(declare-datatypes ((tuple2!14532 0))(
  ( (tuple2!14533 (_1!7277 (_ BitVec 64)) (_2!7277 V!34849)) )
))
(declare-datatypes ((List!20340 0))(
  ( (Nil!20337) (Cons!20336 (h!21498 tuple2!14532) (t!28808 List!20340)) )
))
(declare-datatypes ((ListLongMap!13219 0))(
  ( (ListLongMap!13220 (toList!6625 List!20340)) )
))
(declare-fun contains!5656 (ListLongMap!13219 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3787 (array!60758 array!60760 (_ BitVec 32) (_ BitVec 32) V!34849 V!34849 (_ BitVec 32) Int) ListLongMap!13219)

(assert (=> b!975347 (= res!652972 (contains!5656 (getCurrentListMap!3787 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29243 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35608 () Bool)

(declare-fun mapRes!35608 () Bool)

(declare-fun tp!67774 () Bool)

(assert (=> mapNonEmpty!35608 (= mapRes!35608 (and tp!67774 e!549672))))

(declare-fun mapKey!35608 () (_ BitVec 32))

(declare-fun mapRest!35608 () (Array (_ BitVec 32) ValueCell!10718))

(declare-fun mapValue!35608 () ValueCell!10718)

(assert (=> mapNonEmpty!35608 (= (arr!29244 _values!1425) (store mapRest!35608 mapKey!35608 mapValue!35608))))

(declare-fun b!975348 () Bool)

(declare-fun e!549671 () Bool)

(assert (=> b!975348 (= e!549671 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29724 _keys!1717)))))

(declare-fun res!652974 () Bool)

(assert (=> start!83490 (=> (not res!652974) (not e!549674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83490 (= res!652974 (validMask!0 mask!2147))))

(assert (=> start!83490 e!549674))

(assert (=> start!83490 true))

(declare-fun e!549673 () Bool)

(declare-fun array_inv!22663 (array!60760) Bool)

(assert (=> start!83490 (and (array_inv!22663 _values!1425) e!549673)))

(assert (=> start!83490 tp_is_empty!22399))

(assert (=> start!83490 tp!67773))

(declare-fun array_inv!22664 (array!60758) Bool)

(assert (=> start!83490 (array_inv!22664 _keys!1717)))

(declare-fun mapIsEmpty!35608 () Bool)

(assert (=> mapIsEmpty!35608 mapRes!35608))

(declare-fun b!975349 () Bool)

(assert (=> b!975349 (= e!549674 e!549671)))

(declare-fun res!652968 () Bool)

(assert (=> b!975349 (=> (not res!652968) (not e!549671))))

(assert (=> b!975349 (= res!652968 (validKeyInArray!0 (select (arr!29243 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun lt!432642 () ListLongMap!13219)

(assert (=> b!975349 (= lt!432642 (getCurrentListMap!3787 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975350 () Bool)

(assert (=> b!975350 (= e!549673 (and e!549670 mapRes!35608))))

(declare-fun condMapEmpty!35608 () Bool)

(declare-fun mapDefault!35608 () ValueCell!10718)

(assert (=> b!975350 (= condMapEmpty!35608 (= (arr!29244 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10718)) mapDefault!35608)))))

(assert (= (and start!83490 res!652974) b!975346))

(assert (= (and b!975346 res!652971) b!975341))

(assert (= (and b!975341 res!652969) b!975343))

(assert (= (and b!975343 res!652975) b!975342))

(assert (= (and b!975342 res!652973) b!975344))

(assert (= (and b!975344 res!652970) b!975347))

(assert (= (and b!975347 res!652972) b!975349))

(assert (= (and b!975349 res!652968) b!975348))

(assert (= (and b!975350 condMapEmpty!35608) mapIsEmpty!35608))

(assert (= (and b!975350 (not condMapEmpty!35608)) mapNonEmpty!35608))

(get-info :version)

(assert (= (and mapNonEmpty!35608 ((_ is ValueCellFull!10718) mapValue!35608)) b!975345))

(assert (= (and b!975350 ((_ is ValueCellFull!10718) mapDefault!35608)) b!975340))

(assert (= start!83490 b!975350))

(declare-fun m!902027 () Bool)

(assert (=> b!975349 m!902027))

(assert (=> b!975349 m!902027))

(declare-fun m!902029 () Bool)

(assert (=> b!975349 m!902029))

(declare-fun m!902031 () Bool)

(assert (=> b!975349 m!902031))

(declare-fun m!902033 () Bool)

(assert (=> mapNonEmpty!35608 m!902033))

(declare-fun m!902035 () Bool)

(assert (=> start!83490 m!902035))

(declare-fun m!902037 () Bool)

(assert (=> start!83490 m!902037))

(declare-fun m!902039 () Bool)

(assert (=> start!83490 m!902039))

(declare-fun m!902041 () Bool)

(assert (=> b!975347 m!902041))

(declare-fun m!902043 () Bool)

(assert (=> b!975347 m!902043))

(assert (=> b!975347 m!902041))

(assert (=> b!975347 m!902043))

(declare-fun m!902045 () Bool)

(assert (=> b!975347 m!902045))

(declare-fun m!902047 () Bool)

(assert (=> b!975343 m!902047))

(assert (=> b!975344 m!902043))

(assert (=> b!975344 m!902043))

(declare-fun m!902049 () Bool)

(assert (=> b!975344 m!902049))

(declare-fun m!902051 () Bool)

(assert (=> b!975341 m!902051))

(check-sat (not mapNonEmpty!35608) (not b!975343) b_and!31071 (not start!83490) (not b_next!19495) tp_is_empty!22399 (not b!975347) (not b!975349) (not b!975344) (not b!975341))
(check-sat b_and!31071 (not b_next!19495))
