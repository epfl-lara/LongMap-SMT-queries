; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!602 () Bool)

(assert start!602)

(declare-fun b_free!75 () Bool)

(declare-fun b_next!75 () Bool)

(assert (=> start!602 (= b_free!75 (not b_next!75))))

(declare-fun tp!442 () Bool)

(declare-fun b_and!213 () Bool)

(assert (=> start!602 (= tp!442 b_and!213)))

(declare-fun b!3721 () Bool)

(declare-fun res!5331 () Bool)

(declare-fun e!1861 () Bool)

(assert (=> b!3721 (=> (not res!5331) (not e!1861))))

(declare-datatypes ((array!243 0))(
  ( (array!244 (arr!114 (Array (_ BitVec 32) (_ BitVec 64))) (size!176 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!243)

(declare-datatypes ((List!67 0))(
  ( (Nil!64) (Cons!63 (h!629 (_ BitVec 64)) (t!2194 List!67)) )
))
(declare-fun arrayNoDuplicates!0 (array!243 (_ BitVec 32) List!67) Bool)

(assert (=> b!3721 (= res!5331 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!64))))

(declare-fun mapNonEmpty!188 () Bool)

(declare-fun mapRes!188 () Bool)

(declare-fun tp!443 () Bool)

(declare-fun e!1863 () Bool)

(assert (=> mapNonEmpty!188 (= mapRes!188 (and tp!443 e!1863))))

(declare-fun mapKey!188 () (_ BitVec 32))

(declare-datatypes ((V!381 0))(
  ( (V!382 (val!82 Int)) )
))
(declare-datatypes ((ValueCell!60 0))(
  ( (ValueCellFull!60 (v!1169 V!381)) (EmptyCell!60) )
))
(declare-datatypes ((array!245 0))(
  ( (array!246 (arr!115 (Array (_ BitVec 32) ValueCell!60)) (size!177 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!245)

(declare-fun mapRest!188 () (Array (_ BitVec 32) ValueCell!60))

(declare-fun mapValue!188 () ValueCell!60)

(assert (=> mapNonEmpty!188 (= (arr!115 _values!1492) (store mapRest!188 mapKey!188 mapValue!188))))

(declare-fun b!3722 () Bool)

(assert (=> b!3722 (= e!1861 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!513 () Bool)

(declare-fun minValue!1434 () V!381)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!381)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((tuple2!56 0))(
  ( (tuple2!57 (_1!28 (_ BitVec 64)) (_2!28 V!381)) )
))
(declare-datatypes ((List!68 0))(
  ( (Nil!65) (Cons!64 (h!630 tuple2!56) (t!2195 List!68)) )
))
(declare-datatypes ((ListLongMap!61 0))(
  ( (ListLongMap!62 (toList!46 List!68)) )
))
(declare-fun contains!16 (ListLongMap!61 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5 (array!243 array!245 (_ BitVec 32) (_ BitVec 32) V!381 V!381 (_ BitVec 32) Int) ListLongMap!61)

(assert (=> b!3722 (= lt!513 (contains!16 (getCurrentListMap!5 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapIsEmpty!188 () Bool)

(assert (=> mapIsEmpty!188 mapRes!188))

(declare-fun b!3723 () Bool)

(declare-fun res!5330 () Bool)

(assert (=> b!3723 (=> (not res!5330) (not e!1861))))

(assert (=> b!3723 (= res!5330 (and (= (size!177 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!176 _keys!1806) (size!177 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3724 () Bool)

(declare-fun e!1865 () Bool)

(declare-fun e!1862 () Bool)

(assert (=> b!3724 (= e!1865 (and e!1862 mapRes!188))))

(declare-fun condMapEmpty!188 () Bool)

(declare-fun mapDefault!188 () ValueCell!60)

(assert (=> b!3724 (= condMapEmpty!188 (= (arr!115 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!60)) mapDefault!188)))))

(declare-fun res!5332 () Bool)

(assert (=> start!602 (=> (not res!5332) (not e!1861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!602 (= res!5332 (validMask!0 mask!2250))))

(assert (=> start!602 e!1861))

(assert (=> start!602 tp!442))

(assert (=> start!602 true))

(declare-fun array_inv!81 (array!245) Bool)

(assert (=> start!602 (and (array_inv!81 _values!1492) e!1865)))

(declare-fun tp_is_empty!153 () Bool)

(assert (=> start!602 tp_is_empty!153))

(declare-fun array_inv!82 (array!243) Bool)

(assert (=> start!602 (array_inv!82 _keys!1806)))

(declare-fun b!3725 () Bool)

(declare-fun res!5329 () Bool)

(assert (=> b!3725 (=> (not res!5329) (not e!1861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!243 (_ BitVec 32)) Bool)

(assert (=> b!3725 (= res!5329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3726 () Bool)

(assert (=> b!3726 (= e!1862 tp_is_empty!153)))

(declare-fun b!3727 () Bool)

(assert (=> b!3727 (= e!1863 tp_is_empty!153)))

(assert (= (and start!602 res!5332) b!3723))

(assert (= (and b!3723 res!5330) b!3725))

(assert (= (and b!3725 res!5329) b!3721))

(assert (= (and b!3721 res!5331) b!3722))

(assert (= (and b!3724 condMapEmpty!188) mapIsEmpty!188))

(assert (= (and b!3724 (not condMapEmpty!188)) mapNonEmpty!188))

(get-info :version)

(assert (= (and mapNonEmpty!188 ((_ is ValueCellFull!60) mapValue!188)) b!3727))

(assert (= (and b!3724 ((_ is ValueCellFull!60) mapDefault!188)) b!3726))

(assert (= start!602 b!3724))

(declare-fun m!1839 () Bool)

(assert (=> b!3725 m!1839))

(declare-fun m!1841 () Bool)

(assert (=> b!3721 m!1841))

(declare-fun m!1843 () Bool)

(assert (=> mapNonEmpty!188 m!1843))

(declare-fun m!1845 () Bool)

(assert (=> b!3722 m!1845))

(assert (=> b!3722 m!1845))

(declare-fun m!1847 () Bool)

(assert (=> b!3722 m!1847))

(declare-fun m!1849 () Bool)

(assert (=> start!602 m!1849))

(declare-fun m!1851 () Bool)

(assert (=> start!602 m!1851))

(declare-fun m!1853 () Bool)

(assert (=> start!602 m!1853))

(check-sat (not start!602) (not b_next!75) (not b!3725) (not mapNonEmpty!188) (not b!3722) b_and!213 (not b!3721) tp_is_empty!153)
(check-sat b_and!213 (not b_next!75))