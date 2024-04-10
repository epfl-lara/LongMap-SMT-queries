; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82222 () Bool)

(assert start!82222)

(declare-fun b_free!18495 () Bool)

(declare-fun b_next!18495 () Bool)

(assert (=> start!82222 (= b_free!18495 (not b_next!18495))))

(declare-fun tp!64446 () Bool)

(declare-fun b_and!29983 () Bool)

(assert (=> start!82222 (= tp!64446 b_and!29983)))

(declare-fun b!958361 () Bool)

(declare-fun e!540281 () Bool)

(declare-fun tp_is_empty!21201 () Bool)

(assert (=> b!958361 (= e!540281 tp_is_empty!21201)))

(declare-fun b!958362 () Bool)

(declare-fun res!641496 () Bool)

(declare-fun e!540284 () Bool)

(assert (=> b!958362 (=> (not res!641496) (not e!540284))))

(declare-datatypes ((array!58503 0))(
  ( (array!58504 (arr!28125 (Array (_ BitVec 32) (_ BitVec 64))) (size!28604 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58503)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58503 (_ BitVec 32)) Bool)

(assert (=> b!958362 (= res!641496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958363 () Bool)

(assert (=> b!958363 (= e!540284 false)))

(declare-datatypes ((V!33251 0))(
  ( (V!33252 (val!10651 Int)) )
))
(declare-fun minValue!1328 () V!33251)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10119 0))(
  ( (ValueCellFull!10119 (v!13208 V!33251)) (EmptyCell!10119) )
))
(declare-datatypes ((array!58505 0))(
  ( (array!58506 (arr!28126 (Array (_ BitVec 32) ValueCell!10119)) (size!28605 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58505)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33251)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun lt!430434 () Bool)

(declare-datatypes ((tuple2!13732 0))(
  ( (tuple2!13733 (_1!6877 (_ BitVec 64)) (_2!6877 V!33251)) )
))
(declare-datatypes ((List!19553 0))(
  ( (Nil!19550) (Cons!19549 (h!20711 tuple2!13732) (t!27916 List!19553)) )
))
(declare-datatypes ((ListLongMap!12429 0))(
  ( (ListLongMap!12430 (toList!6230 List!19553)) )
))
(declare-fun contains!5331 (ListLongMap!12429 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3463 (array!58503 array!58505 (_ BitVec 32) (_ BitVec 32) V!33251 V!33251 (_ BitVec 32) Int) ListLongMap!12429)

(assert (=> b!958363 (= lt!430434 (contains!5331 (getCurrentListMap!3463 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28125 _keys!1668) i!793)))))

(declare-fun b!958364 () Bool)

(declare-fun e!540285 () Bool)

(declare-fun e!540283 () Bool)

(declare-fun mapRes!33781 () Bool)

(assert (=> b!958364 (= e!540285 (and e!540283 mapRes!33781))))

(declare-fun condMapEmpty!33781 () Bool)

(declare-fun mapDefault!33781 () ValueCell!10119)

(assert (=> b!958364 (= condMapEmpty!33781 (= (arr!28126 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10119)) mapDefault!33781)))))

(declare-fun b!958365 () Bool)

(declare-fun res!641494 () Bool)

(assert (=> b!958365 (=> (not res!641494) (not e!540284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958365 (= res!641494 (validKeyInArray!0 (select (arr!28125 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33781 () Bool)

(declare-fun tp!64445 () Bool)

(assert (=> mapNonEmpty!33781 (= mapRes!33781 (and tp!64445 e!540281))))

(declare-fun mapKey!33781 () (_ BitVec 32))

(declare-fun mapRest!33781 () (Array (_ BitVec 32) ValueCell!10119))

(declare-fun mapValue!33781 () ValueCell!10119)

(assert (=> mapNonEmpty!33781 (= (arr!28126 _values!1386) (store mapRest!33781 mapKey!33781 mapValue!33781))))

(declare-fun b!958366 () Bool)

(declare-fun res!641495 () Bool)

(assert (=> b!958366 (=> (not res!641495) (not e!540284))))

(assert (=> b!958366 (= res!641495 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28604 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28604 _keys!1668))))))

(declare-fun res!641498 () Bool)

(assert (=> start!82222 (=> (not res!641498) (not e!540284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82222 (= res!641498 (validMask!0 mask!2088))))

(assert (=> start!82222 e!540284))

(assert (=> start!82222 true))

(assert (=> start!82222 tp_is_empty!21201))

(declare-fun array_inv!21815 (array!58503) Bool)

(assert (=> start!82222 (array_inv!21815 _keys!1668)))

(declare-fun array_inv!21816 (array!58505) Bool)

(assert (=> start!82222 (and (array_inv!21816 _values!1386) e!540285)))

(assert (=> start!82222 tp!64446))

(declare-fun mapIsEmpty!33781 () Bool)

(assert (=> mapIsEmpty!33781 mapRes!33781))

(declare-fun b!958367 () Bool)

(declare-fun res!641497 () Bool)

(assert (=> b!958367 (=> (not res!641497) (not e!540284))))

(declare-datatypes ((List!19554 0))(
  ( (Nil!19551) (Cons!19550 (h!20712 (_ BitVec 64)) (t!27917 List!19554)) )
))
(declare-fun arrayNoDuplicates!0 (array!58503 (_ BitVec 32) List!19554) Bool)

(assert (=> b!958367 (= res!641497 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19551))))

(declare-fun b!958368 () Bool)

(declare-fun res!641493 () Bool)

(assert (=> b!958368 (=> (not res!641493) (not e!540284))))

(assert (=> b!958368 (= res!641493 (and (= (size!28605 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28604 _keys!1668) (size!28605 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958369 () Bool)

(assert (=> b!958369 (= e!540283 tp_is_empty!21201)))

(assert (= (and start!82222 res!641498) b!958368))

(assert (= (and b!958368 res!641493) b!958362))

(assert (= (and b!958362 res!641496) b!958367))

(assert (= (and b!958367 res!641497) b!958366))

(assert (= (and b!958366 res!641495) b!958365))

(assert (= (and b!958365 res!641494) b!958363))

(assert (= (and b!958364 condMapEmpty!33781) mapIsEmpty!33781))

(assert (= (and b!958364 (not condMapEmpty!33781)) mapNonEmpty!33781))

(get-info :version)

(assert (= (and mapNonEmpty!33781 ((_ is ValueCellFull!10119) mapValue!33781)) b!958361))

(assert (= (and b!958364 ((_ is ValueCellFull!10119) mapDefault!33781)) b!958369))

(assert (= start!82222 b!958364))

(declare-fun m!889057 () Bool)

(assert (=> mapNonEmpty!33781 m!889057))

(declare-fun m!889059 () Bool)

(assert (=> start!82222 m!889059))

(declare-fun m!889061 () Bool)

(assert (=> start!82222 m!889061))

(declare-fun m!889063 () Bool)

(assert (=> start!82222 m!889063))

(declare-fun m!889065 () Bool)

(assert (=> b!958362 m!889065))

(declare-fun m!889067 () Bool)

(assert (=> b!958367 m!889067))

(declare-fun m!889069 () Bool)

(assert (=> b!958363 m!889069))

(declare-fun m!889071 () Bool)

(assert (=> b!958363 m!889071))

(assert (=> b!958363 m!889069))

(assert (=> b!958363 m!889071))

(declare-fun m!889073 () Bool)

(assert (=> b!958363 m!889073))

(assert (=> b!958365 m!889071))

(assert (=> b!958365 m!889071))

(declare-fun m!889075 () Bool)

(assert (=> b!958365 m!889075))

(check-sat tp_is_empty!21201 (not b!958363) (not mapNonEmpty!33781) (not b_next!18495) (not b!958365) (not b!958367) (not start!82222) (not b!958362) b_and!29983)
(check-sat b_and!29983 (not b_next!18495))
