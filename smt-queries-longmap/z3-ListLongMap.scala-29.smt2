; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!606 () Bool)

(assert start!606)

(declare-fun b_free!79 () Bool)

(declare-fun b_next!79 () Bool)

(assert (=> start!606 (= b_free!79 (not b_next!79))))

(declare-fun tp!454 () Bool)

(declare-fun b_and!217 () Bool)

(assert (=> start!606 (= tp!454 b_and!217)))

(declare-fun mapIsEmpty!194 () Bool)

(declare-fun mapRes!194 () Bool)

(assert (=> mapIsEmpty!194 mapRes!194))

(declare-fun b!3763 () Bool)

(declare-fun res!5354 () Bool)

(declare-fun e!1892 () Bool)

(assert (=> b!3763 (=> (not res!5354) (not e!1892))))

(declare-datatypes ((array!243 0))(
  ( (array!244 (arr!114 (Array (_ BitVec 32) (_ BitVec 64))) (size!176 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!243)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!243 (_ BitVec 32)) Bool)

(assert (=> b!3763 (= res!5354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3764 () Bool)

(declare-fun e!1893 () Bool)

(declare-fun e!1891 () Bool)

(assert (=> b!3764 (= e!1893 (and e!1891 mapRes!194))))

(declare-fun condMapEmpty!194 () Bool)

(declare-datatypes ((V!387 0))(
  ( (V!388 (val!84 Int)) )
))
(declare-datatypes ((ValueCell!62 0))(
  ( (ValueCellFull!62 (v!1171 V!387)) (EmptyCell!62) )
))
(declare-datatypes ((array!245 0))(
  ( (array!246 (arr!115 (Array (_ BitVec 32) ValueCell!62)) (size!177 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!245)

(declare-fun mapDefault!194 () ValueCell!62)

(assert (=> b!3764 (= condMapEmpty!194 (= (arr!115 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!62)) mapDefault!194)))))

(declare-fun b!3765 () Bool)

(assert (=> b!3765 (= e!1892 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!387)

(declare-fun lt!519 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!387)

(declare-datatypes ((tuple2!64 0))(
  ( (tuple2!65 (_1!32 (_ BitVec 64)) (_2!32 V!387)) )
))
(declare-datatypes ((List!71 0))(
  ( (Nil!68) (Cons!67 (h!633 tuple2!64) (t!2198 List!71)) )
))
(declare-datatypes ((ListLongMap!69 0))(
  ( (ListLongMap!70 (toList!50 List!71)) )
))
(declare-fun contains!20 (ListLongMap!69 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!9 (array!243 array!245 (_ BitVec 32) (_ BitVec 32) V!387 V!387 (_ BitVec 32) Int) ListLongMap!69)

(assert (=> b!3765 (= lt!519 (contains!20 (getCurrentListMap!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!3766 () Bool)

(declare-fun tp_is_empty!157 () Bool)

(assert (=> b!3766 (= e!1891 tp_is_empty!157)))

(declare-fun b!3767 () Bool)

(declare-fun e!1895 () Bool)

(assert (=> b!3767 (= e!1895 tp_is_empty!157)))

(declare-fun b!3768 () Bool)

(declare-fun res!5356 () Bool)

(assert (=> b!3768 (=> (not res!5356) (not e!1892))))

(declare-datatypes ((List!72 0))(
  ( (Nil!69) (Cons!68 (h!634 (_ BitVec 64)) (t!2199 List!72)) )
))
(declare-fun arrayNoDuplicates!0 (array!243 (_ BitVec 32) List!72) Bool)

(assert (=> b!3768 (= res!5356 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!69))))

(declare-fun res!5353 () Bool)

(assert (=> start!606 (=> (not res!5353) (not e!1892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!606 (= res!5353 (validMask!0 mask!2250))))

(assert (=> start!606 e!1892))

(assert (=> start!606 tp!454))

(assert (=> start!606 true))

(declare-fun array_inv!77 (array!245) Bool)

(assert (=> start!606 (and (array_inv!77 _values!1492) e!1893)))

(assert (=> start!606 tp_is_empty!157))

(declare-fun array_inv!78 (array!243) Bool)

(assert (=> start!606 (array_inv!78 _keys!1806)))

(declare-fun mapNonEmpty!194 () Bool)

(declare-fun tp!455 () Bool)

(assert (=> mapNonEmpty!194 (= mapRes!194 (and tp!455 e!1895))))

(declare-fun mapRest!194 () (Array (_ BitVec 32) ValueCell!62))

(declare-fun mapValue!194 () ValueCell!62)

(declare-fun mapKey!194 () (_ BitVec 32))

(assert (=> mapNonEmpty!194 (= (arr!115 _values!1492) (store mapRest!194 mapKey!194 mapValue!194))))

(declare-fun b!3769 () Bool)

(declare-fun res!5355 () Bool)

(assert (=> b!3769 (=> (not res!5355) (not e!1892))))

(assert (=> b!3769 (= res!5355 (and (= (size!177 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!176 _keys!1806) (size!177 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(assert (= (and start!606 res!5353) b!3769))

(assert (= (and b!3769 res!5355) b!3763))

(assert (= (and b!3763 res!5354) b!3768))

(assert (= (and b!3768 res!5356) b!3765))

(assert (= (and b!3764 condMapEmpty!194) mapIsEmpty!194))

(assert (= (and b!3764 (not condMapEmpty!194)) mapNonEmpty!194))

(get-info :version)

(assert (= (and mapNonEmpty!194 ((_ is ValueCellFull!62) mapValue!194)) b!3767))

(assert (= (and b!3764 ((_ is ValueCellFull!62) mapDefault!194)) b!3766))

(assert (= start!606 b!3764))

(declare-fun m!1871 () Bool)

(assert (=> b!3765 m!1871))

(assert (=> b!3765 m!1871))

(declare-fun m!1873 () Bool)

(assert (=> b!3765 m!1873))

(declare-fun m!1875 () Bool)

(assert (=> b!3768 m!1875))

(declare-fun m!1877 () Bool)

(assert (=> mapNonEmpty!194 m!1877))

(declare-fun m!1879 () Bool)

(assert (=> start!606 m!1879))

(declare-fun m!1881 () Bool)

(assert (=> start!606 m!1881))

(declare-fun m!1883 () Bool)

(assert (=> start!606 m!1883))

(declare-fun m!1885 () Bool)

(assert (=> b!3763 m!1885))

(check-sat (not mapNonEmpty!194) (not b!3765) tp_is_empty!157 (not b!3763) (not b!3768) (not b_next!79) b_and!217 (not start!606))
(check-sat b_and!217 (not b_next!79))
