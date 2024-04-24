; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82574 () Bool)

(assert start!82574)

(declare-fun res!643564 () Bool)

(declare-fun e!542244 () Bool)

(assert (=> start!82574 (=> (not res!643564) (not e!542244))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82574 (= res!643564 (validMask!0 mask!2110))))

(assert (=> start!82574 e!542244))

(assert (=> start!82574 true))

(declare-datatypes ((V!33497 0))(
  ( (V!33498 (val!10743 Int)) )
))
(declare-datatypes ((ValueCell!10211 0))(
  ( (ValueCellFull!10211 (v!13297 V!33497)) (EmptyCell!10211) )
))
(declare-datatypes ((array!58890 0))(
  ( (array!58891 (arr!28314 (Array (_ BitVec 32) ValueCell!10211)) (size!28794 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58890)

(declare-fun e!542243 () Bool)

(declare-fun array_inv!22023 (array!58890) Bool)

(assert (=> start!82574 (and (array_inv!22023 _values!1400) e!542243)))

(declare-datatypes ((array!58892 0))(
  ( (array!58893 (arr!28315 (Array (_ BitVec 32) (_ BitVec 64))) (size!28795 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58892)

(declare-fun array_inv!22024 (array!58892) Bool)

(assert (=> start!82574 (array_inv!22024 _keys!1686)))

(declare-fun b!961819 () Bool)

(declare-fun e!542245 () Bool)

(declare-fun tp_is_empty!21385 () Bool)

(assert (=> b!961819 (= e!542245 tp_is_empty!21385)))

(declare-fun mapNonEmpty!34057 () Bool)

(declare-fun mapRes!34057 () Bool)

(declare-fun tp!64987 () Bool)

(assert (=> mapNonEmpty!34057 (= mapRes!34057 (and tp!64987 e!542245))))

(declare-fun mapValue!34057 () ValueCell!10211)

(declare-fun mapRest!34057 () (Array (_ BitVec 32) ValueCell!10211))

(declare-fun mapKey!34057 () (_ BitVec 32))

(assert (=> mapNonEmpty!34057 (= (arr!28314 _values!1400) (store mapRest!34057 mapKey!34057 mapValue!34057))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun b!961820 () Bool)

(assert (=> b!961820 (= e!542244 (and (= (size!28794 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28795 _keys!1686) (size!28794 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011) (not (= (size!28795 _keys!1686) (bvadd #b00000000000000000000000000000001 mask!2110)))))))

(declare-fun b!961821 () Bool)

(declare-fun e!542246 () Bool)

(assert (=> b!961821 (= e!542246 tp_is_empty!21385)))

(declare-fun b!961822 () Bool)

(assert (=> b!961822 (= e!542243 (and e!542246 mapRes!34057))))

(declare-fun condMapEmpty!34057 () Bool)

(declare-fun mapDefault!34057 () ValueCell!10211)

(assert (=> b!961822 (= condMapEmpty!34057 (= (arr!28314 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10211)) mapDefault!34057)))))

(declare-fun mapIsEmpty!34057 () Bool)

(assert (=> mapIsEmpty!34057 mapRes!34057))

(assert (= (and start!82574 res!643564) b!961820))

(assert (= (and b!961822 condMapEmpty!34057) mapIsEmpty!34057))

(assert (= (and b!961822 (not condMapEmpty!34057)) mapNonEmpty!34057))

(get-info :version)

(assert (= (and mapNonEmpty!34057 ((_ is ValueCellFull!10211) mapValue!34057)) b!961819))

(assert (= (and b!961822 ((_ is ValueCellFull!10211) mapDefault!34057)) b!961821))

(assert (= start!82574 b!961822))

(declare-fun m!892359 () Bool)

(assert (=> start!82574 m!892359))

(declare-fun m!892361 () Bool)

(assert (=> start!82574 m!892361))

(declare-fun m!892363 () Bool)

(assert (=> start!82574 m!892363))

(declare-fun m!892365 () Bool)

(assert (=> mapNonEmpty!34057 m!892365))

(check-sat (not start!82574) (not mapNonEmpty!34057) tp_is_empty!21385)
(check-sat)
