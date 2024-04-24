; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82322 () Bool)

(assert start!82322)

(declare-fun b!958448 () Bool)

(declare-fun e!540353 () Bool)

(assert (=> b!958448 (= e!540353 false)))

(declare-fun lt!430702 () Bool)

(declare-datatypes ((array!58400 0))(
  ( (array!58401 (arr!28069 (Array (_ BitVec 32) (_ BitVec 64))) (size!28549 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58400)

(declare-datatypes ((List!19509 0))(
  ( (Nil!19506) (Cons!19505 (h!20673 (_ BitVec 64)) (t!27864 List!19509)) )
))
(declare-fun arrayNoDuplicates!0 (array!58400 (_ BitVec 32) List!19509) Bool)

(assert (=> b!958448 (= lt!430702 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19506))))

(declare-fun res!641328 () Bool)

(assert (=> start!82322 (=> (not res!641328) (not e!540353))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82322 (= res!641328 (validMask!0 mask!2088))))

(assert (=> start!82322 e!540353))

(assert (=> start!82322 true))

(declare-datatypes ((V!33161 0))(
  ( (V!33162 (val!10617 Int)) )
))
(declare-datatypes ((ValueCell!10085 0))(
  ( (ValueCellFull!10085 (v!13171 V!33161)) (EmptyCell!10085) )
))
(declare-datatypes ((array!58402 0))(
  ( (array!58403 (arr!28070 (Array (_ BitVec 32) ValueCell!10085)) (size!28550 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58402)

(declare-fun e!540357 () Bool)

(declare-fun array_inv!21843 (array!58402) Bool)

(assert (=> start!82322 (and (array_inv!21843 _values!1386) e!540357)))

(declare-fun array_inv!21844 (array!58400) Bool)

(assert (=> start!82322 (array_inv!21844 _keys!1668)))

(declare-fun mapNonEmpty!33679 () Bool)

(declare-fun mapRes!33679 () Bool)

(declare-fun tp!64285 () Bool)

(declare-fun e!540355 () Bool)

(assert (=> mapNonEmpty!33679 (= mapRes!33679 (and tp!64285 e!540355))))

(declare-fun mapKey!33679 () (_ BitVec 32))

(declare-fun mapValue!33679 () ValueCell!10085)

(declare-fun mapRest!33679 () (Array (_ BitVec 32) ValueCell!10085))

(assert (=> mapNonEmpty!33679 (= (arr!28070 _values!1386) (store mapRest!33679 mapKey!33679 mapValue!33679))))

(declare-fun b!958449 () Bool)

(declare-fun e!540356 () Bool)

(assert (=> b!958449 (= e!540357 (and e!540356 mapRes!33679))))

(declare-fun condMapEmpty!33679 () Bool)

(declare-fun mapDefault!33679 () ValueCell!10085)

(assert (=> b!958449 (= condMapEmpty!33679 (= (arr!28070 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10085)) mapDefault!33679)))))

(declare-fun b!958450 () Bool)

(declare-fun tp_is_empty!21133 () Bool)

(assert (=> b!958450 (= e!540355 tp_is_empty!21133)))

(declare-fun b!958451 () Bool)

(declare-fun res!641329 () Bool)

(assert (=> b!958451 (=> (not res!641329) (not e!540353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58400 (_ BitVec 32)) Bool)

(assert (=> b!958451 (= res!641329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958452 () Bool)

(assert (=> b!958452 (= e!540356 tp_is_empty!21133)))

(declare-fun b!958453 () Bool)

(declare-fun res!641327 () Bool)

(assert (=> b!958453 (=> (not res!641327) (not e!540353))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!958453 (= res!641327 (and (= (size!28550 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28549 _keys!1668) (size!28550 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33679 () Bool)

(assert (=> mapIsEmpty!33679 mapRes!33679))

(assert (= (and start!82322 res!641328) b!958453))

(assert (= (and b!958453 res!641327) b!958451))

(assert (= (and b!958451 res!641329) b!958448))

(assert (= (and b!958449 condMapEmpty!33679) mapIsEmpty!33679))

(assert (= (and b!958449 (not condMapEmpty!33679)) mapNonEmpty!33679))

(get-info :version)

(assert (= (and mapNonEmpty!33679 ((_ is ValueCellFull!10085) mapValue!33679)) b!958450))

(assert (= (and b!958449 ((_ is ValueCellFull!10085) mapDefault!33679)) b!958452))

(assert (= start!82322 b!958449))

(declare-fun m!889779 () Bool)

(assert (=> b!958448 m!889779))

(declare-fun m!889781 () Bool)

(assert (=> start!82322 m!889781))

(declare-fun m!889783 () Bool)

(assert (=> start!82322 m!889783))

(declare-fun m!889785 () Bool)

(assert (=> start!82322 m!889785))

(declare-fun m!889787 () Bool)

(assert (=> mapNonEmpty!33679 m!889787))

(declare-fun m!889789 () Bool)

(assert (=> b!958451 m!889789))

(check-sat (not mapNonEmpty!33679) (not b!958451) (not start!82322) (not b!958448) tp_is_empty!21133)
(check-sat)
