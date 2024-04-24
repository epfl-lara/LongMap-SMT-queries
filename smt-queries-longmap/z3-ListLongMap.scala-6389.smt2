; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82298 () Bool)

(assert start!82298)

(declare-fun b!958232 () Bool)

(declare-fun e!540177 () Bool)

(declare-fun e!540176 () Bool)

(declare-fun mapRes!33643 () Bool)

(assert (=> b!958232 (= e!540177 (and e!540176 mapRes!33643))))

(declare-fun condMapEmpty!33643 () Bool)

(declare-datatypes ((V!33129 0))(
  ( (V!33130 (val!10605 Int)) )
))
(declare-datatypes ((ValueCell!10073 0))(
  ( (ValueCellFull!10073 (v!13159 V!33129)) (EmptyCell!10073) )
))
(declare-datatypes ((array!58358 0))(
  ( (array!58359 (arr!28048 (Array (_ BitVec 32) ValueCell!10073)) (size!28528 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58358)

(declare-fun mapDefault!33643 () ValueCell!10073)

(assert (=> b!958232 (= condMapEmpty!33643 (= (arr!28048 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10073)) mapDefault!33643)))))

(declare-fun b!958233 () Bool)

(declare-fun tp_is_empty!21109 () Bool)

(assert (=> b!958233 (= e!540176 tp_is_empty!21109)))

(declare-fun mapNonEmpty!33643 () Bool)

(declare-fun tp!64249 () Bool)

(declare-fun e!540175 () Bool)

(assert (=> mapNonEmpty!33643 (= mapRes!33643 (and tp!64249 e!540175))))

(declare-fun mapValue!33643 () ValueCell!10073)

(declare-fun mapKey!33643 () (_ BitVec 32))

(declare-fun mapRest!33643 () (Array (_ BitVec 32) ValueCell!10073))

(assert (=> mapNonEmpty!33643 (= (arr!28048 _values!1386) (store mapRest!33643 mapKey!33643 mapValue!33643))))

(declare-fun mapIsEmpty!33643 () Bool)

(assert (=> mapIsEmpty!33643 mapRes!33643))

(declare-fun b!958234 () Bool)

(declare-fun res!641220 () Bool)

(declare-fun e!540174 () Bool)

(assert (=> b!958234 (=> (not res!641220) (not e!540174))))

(declare-datatypes ((array!58360 0))(
  ( (array!58361 (arr!28049 (Array (_ BitVec 32) (_ BitVec 64))) (size!28529 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58360)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58360 (_ BitVec 32)) Bool)

(assert (=> b!958234 (= res!641220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!641219 () Bool)

(assert (=> start!82298 (=> (not res!641219) (not e!540174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82298 (= res!641219 (validMask!0 mask!2088))))

(assert (=> start!82298 e!540174))

(assert (=> start!82298 true))

(declare-fun array_inv!21829 (array!58358) Bool)

(assert (=> start!82298 (and (array_inv!21829 _values!1386) e!540177)))

(declare-fun array_inv!21830 (array!58360) Bool)

(assert (=> start!82298 (array_inv!21830 _keys!1668)))

(declare-fun b!958235 () Bool)

(assert (=> b!958235 (= e!540175 tp_is_empty!21109)))

(declare-fun b!958236 () Bool)

(assert (=> b!958236 (= e!540174 false)))

(declare-fun lt!430666 () Bool)

(declare-datatypes ((List!19501 0))(
  ( (Nil!19498) (Cons!19497 (h!20665 (_ BitVec 64)) (t!27856 List!19501)) )
))
(declare-fun arrayNoDuplicates!0 (array!58360 (_ BitVec 32) List!19501) Bool)

(assert (=> b!958236 (= lt!430666 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19498))))

(declare-fun b!958237 () Bool)

(declare-fun res!641221 () Bool)

(assert (=> b!958237 (=> (not res!641221) (not e!540174))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!958237 (= res!641221 (and (= (size!28528 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28529 _keys!1668) (size!28528 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(assert (= (and start!82298 res!641219) b!958237))

(assert (= (and b!958237 res!641221) b!958234))

(assert (= (and b!958234 res!641220) b!958236))

(assert (= (and b!958232 condMapEmpty!33643) mapIsEmpty!33643))

(assert (= (and b!958232 (not condMapEmpty!33643)) mapNonEmpty!33643))

(get-info :version)

(assert (= (and mapNonEmpty!33643 ((_ is ValueCellFull!10073) mapValue!33643)) b!958235))

(assert (= (and b!958232 ((_ is ValueCellFull!10073) mapDefault!33643)) b!958233))

(assert (= start!82298 b!958232))

(declare-fun m!889635 () Bool)

(assert (=> mapNonEmpty!33643 m!889635))

(declare-fun m!889637 () Bool)

(assert (=> b!958234 m!889637))

(declare-fun m!889639 () Bool)

(assert (=> start!82298 m!889639))

(declare-fun m!889641 () Bool)

(assert (=> start!82298 m!889641))

(declare-fun m!889643 () Bool)

(assert (=> start!82298 m!889643))

(declare-fun m!889645 () Bool)

(assert (=> b!958236 m!889645))

(check-sat (not b!958234) (not start!82298) (not b!958236) (not mapNonEmpty!33643) tp_is_empty!21109)
(check-sat)
