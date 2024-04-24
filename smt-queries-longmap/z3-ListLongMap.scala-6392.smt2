; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82316 () Bool)

(assert start!82316)

(declare-fun b!958394 () Bool)

(declare-fun res!641300 () Bool)

(declare-fun e!540308 () Bool)

(assert (=> b!958394 (=> (not res!641300) (not e!540308))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58390 0))(
  ( (array!58391 (arr!28064 (Array (_ BitVec 32) (_ BitVec 64))) (size!28544 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58390)

(declare-datatypes ((V!33153 0))(
  ( (V!33154 (val!10614 Int)) )
))
(declare-datatypes ((ValueCell!10082 0))(
  ( (ValueCellFull!10082 (v!13168 V!33153)) (EmptyCell!10082) )
))
(declare-datatypes ((array!58392 0))(
  ( (array!58393 (arr!28065 (Array (_ BitVec 32) ValueCell!10082)) (size!28545 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58392)

(assert (=> b!958394 (= res!641300 (and (= (size!28545 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28544 _keys!1668) (size!28545 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33670 () Bool)

(declare-fun mapRes!33670 () Bool)

(declare-fun tp!64276 () Bool)

(declare-fun e!540310 () Bool)

(assert (=> mapNonEmpty!33670 (= mapRes!33670 (and tp!64276 e!540310))))

(declare-fun mapRest!33670 () (Array (_ BitVec 32) ValueCell!10082))

(declare-fun mapKey!33670 () (_ BitVec 32))

(declare-fun mapValue!33670 () ValueCell!10082)

(assert (=> mapNonEmpty!33670 (= (arr!28065 _values!1386) (store mapRest!33670 mapKey!33670 mapValue!33670))))

(declare-fun mapIsEmpty!33670 () Bool)

(assert (=> mapIsEmpty!33670 mapRes!33670))

(declare-fun res!641302 () Bool)

(assert (=> start!82316 (=> (not res!641302) (not e!540308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82316 (= res!641302 (validMask!0 mask!2088))))

(assert (=> start!82316 e!540308))

(assert (=> start!82316 true))

(declare-fun e!540312 () Bool)

(declare-fun array_inv!21839 (array!58392) Bool)

(assert (=> start!82316 (and (array_inv!21839 _values!1386) e!540312)))

(declare-fun array_inv!21840 (array!58390) Bool)

(assert (=> start!82316 (array_inv!21840 _keys!1668)))

(declare-fun b!958395 () Bool)

(declare-fun res!641301 () Bool)

(assert (=> b!958395 (=> (not res!641301) (not e!540308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58390 (_ BitVec 32)) Bool)

(assert (=> b!958395 (= res!641301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958396 () Bool)

(declare-fun e!540311 () Bool)

(declare-fun tp_is_empty!21127 () Bool)

(assert (=> b!958396 (= e!540311 tp_is_empty!21127)))

(declare-fun b!958397 () Bool)

(assert (=> b!958397 (= e!540308 false)))

(declare-fun lt!430693 () Bool)

(declare-datatypes ((List!19507 0))(
  ( (Nil!19504) (Cons!19503 (h!20671 (_ BitVec 64)) (t!27862 List!19507)) )
))
(declare-fun arrayNoDuplicates!0 (array!58390 (_ BitVec 32) List!19507) Bool)

(assert (=> b!958397 (= lt!430693 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19504))))

(declare-fun b!958398 () Bool)

(assert (=> b!958398 (= e!540312 (and e!540311 mapRes!33670))))

(declare-fun condMapEmpty!33670 () Bool)

(declare-fun mapDefault!33670 () ValueCell!10082)

(assert (=> b!958398 (= condMapEmpty!33670 (= (arr!28065 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10082)) mapDefault!33670)))))

(declare-fun b!958399 () Bool)

(assert (=> b!958399 (= e!540310 tp_is_empty!21127)))

(assert (= (and start!82316 res!641302) b!958394))

(assert (= (and b!958394 res!641300) b!958395))

(assert (= (and b!958395 res!641301) b!958397))

(assert (= (and b!958398 condMapEmpty!33670) mapIsEmpty!33670))

(assert (= (and b!958398 (not condMapEmpty!33670)) mapNonEmpty!33670))

(get-info :version)

(assert (= (and mapNonEmpty!33670 ((_ is ValueCellFull!10082) mapValue!33670)) b!958399))

(assert (= (and b!958398 ((_ is ValueCellFull!10082) mapDefault!33670)) b!958396))

(assert (= start!82316 b!958398))

(declare-fun m!889743 () Bool)

(assert (=> mapNonEmpty!33670 m!889743))

(declare-fun m!889745 () Bool)

(assert (=> start!82316 m!889745))

(declare-fun m!889747 () Bool)

(assert (=> start!82316 m!889747))

(declare-fun m!889749 () Bool)

(assert (=> start!82316 m!889749))

(declare-fun m!889751 () Bool)

(assert (=> b!958395 m!889751))

(declare-fun m!889753 () Bool)

(assert (=> b!958397 m!889753))

(check-sat (not b!958395) (not mapNonEmpty!33670) (not b!958397) tp_is_empty!21127 (not start!82316))
(check-sat)
