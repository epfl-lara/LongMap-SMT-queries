; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82310 () Bool)

(assert start!82310)

(declare-fun res!641274 () Bool)

(declare-fun e!540266 () Bool)

(assert (=> start!82310 (=> (not res!641274) (not e!540266))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82310 (= res!641274 (validMask!0 mask!2088))))

(assert (=> start!82310 e!540266))

(assert (=> start!82310 true))

(declare-datatypes ((V!33145 0))(
  ( (V!33146 (val!10611 Int)) )
))
(declare-datatypes ((ValueCell!10079 0))(
  ( (ValueCellFull!10079 (v!13165 V!33145)) (EmptyCell!10079) )
))
(declare-datatypes ((array!58380 0))(
  ( (array!58381 (arr!28059 (Array (_ BitVec 32) ValueCell!10079)) (size!28539 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58380)

(declare-fun e!540264 () Bool)

(declare-fun array_inv!21837 (array!58380) Bool)

(assert (=> start!82310 (and (array_inv!21837 _values!1386) e!540264)))

(declare-datatypes ((array!58382 0))(
  ( (array!58383 (arr!28060 (Array (_ BitVec 32) (_ BitVec 64))) (size!28540 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58382)

(declare-fun array_inv!21838 (array!58382) Bool)

(assert (=> start!82310 (array_inv!21838 _keys!1668)))

(declare-fun mapNonEmpty!33661 () Bool)

(declare-fun mapRes!33661 () Bool)

(declare-fun tp!64267 () Bool)

(declare-fun e!540263 () Bool)

(assert (=> mapNonEmpty!33661 (= mapRes!33661 (and tp!64267 e!540263))))

(declare-fun mapValue!33661 () ValueCell!10079)

(declare-fun mapKey!33661 () (_ BitVec 32))

(declare-fun mapRest!33661 () (Array (_ BitVec 32) ValueCell!10079))

(assert (=> mapNonEmpty!33661 (= (arr!28059 _values!1386) (store mapRest!33661 mapKey!33661 mapValue!33661))))

(declare-fun b!958340 () Bool)

(declare-fun res!641273 () Bool)

(assert (=> b!958340 (=> (not res!641273) (not e!540266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58382 (_ BitVec 32)) Bool)

(assert (=> b!958340 (= res!641273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958341 () Bool)

(declare-fun e!540265 () Bool)

(declare-fun tp_is_empty!21121 () Bool)

(assert (=> b!958341 (= e!540265 tp_is_empty!21121)))

(declare-fun b!958342 () Bool)

(assert (=> b!958342 (= e!540264 (and e!540265 mapRes!33661))))

(declare-fun condMapEmpty!33661 () Bool)

(declare-fun mapDefault!33661 () ValueCell!10079)

(assert (=> b!958342 (= condMapEmpty!33661 (= (arr!28059 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10079)) mapDefault!33661)))))

(declare-fun b!958343 () Bool)

(declare-fun res!641275 () Bool)

(assert (=> b!958343 (=> (not res!641275) (not e!540266))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!958343 (= res!641275 (and (= (size!28539 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28540 _keys!1668) (size!28539 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958344 () Bool)

(assert (=> b!958344 (= e!540266 false)))

(declare-fun lt!430684 () Bool)

(declare-datatypes ((List!19505 0))(
  ( (Nil!19502) (Cons!19501 (h!20669 (_ BitVec 64)) (t!27860 List!19505)) )
))
(declare-fun arrayNoDuplicates!0 (array!58382 (_ BitVec 32) List!19505) Bool)

(assert (=> b!958344 (= lt!430684 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19502))))

(declare-fun mapIsEmpty!33661 () Bool)

(assert (=> mapIsEmpty!33661 mapRes!33661))

(declare-fun b!958345 () Bool)

(assert (=> b!958345 (= e!540263 tp_is_empty!21121)))

(assert (= (and start!82310 res!641274) b!958343))

(assert (= (and b!958343 res!641275) b!958340))

(assert (= (and b!958340 res!641273) b!958344))

(assert (= (and b!958342 condMapEmpty!33661) mapIsEmpty!33661))

(assert (= (and b!958342 (not condMapEmpty!33661)) mapNonEmpty!33661))

(get-info :version)

(assert (= (and mapNonEmpty!33661 ((_ is ValueCellFull!10079) mapValue!33661)) b!958345))

(assert (= (and b!958342 ((_ is ValueCellFull!10079) mapDefault!33661)) b!958341))

(assert (= start!82310 b!958342))

(declare-fun m!889707 () Bool)

(assert (=> start!82310 m!889707))

(declare-fun m!889709 () Bool)

(assert (=> start!82310 m!889709))

(declare-fun m!889711 () Bool)

(assert (=> start!82310 m!889711))

(declare-fun m!889713 () Bool)

(assert (=> mapNonEmpty!33661 m!889713))

(declare-fun m!889715 () Bool)

(assert (=> b!958340 m!889715))

(declare-fun m!889717 () Bool)

(assert (=> b!958344 m!889717))

(check-sat tp_is_empty!21121 (not mapNonEmpty!33661) (not b!958340) (not start!82310) (not b!958344))
(check-sat)
