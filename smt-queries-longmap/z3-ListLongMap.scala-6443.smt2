; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82666 () Bool)

(assert start!82666)

(declare-fun b!962363 () Bool)

(declare-fun e!542700 () Bool)

(declare-fun e!542702 () Bool)

(declare-fun mapRes!34144 () Bool)

(assert (=> b!962363 (= e!542700 (and e!542702 mapRes!34144))))

(declare-fun condMapEmpty!34144 () Bool)

(declare-datatypes ((V!33561 0))(
  ( (V!33562 (val!10767 Int)) )
))
(declare-datatypes ((ValueCell!10235 0))(
  ( (ValueCellFull!10235 (v!13322 V!33561)) (EmptyCell!10235) )
))
(declare-datatypes ((array!58990 0))(
  ( (array!58991 (arr!28359 (Array (_ BitVec 32) ValueCell!10235)) (size!28839 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58990)

(declare-fun mapDefault!34144 () ValueCell!10235)

(assert (=> b!962363 (= condMapEmpty!34144 (= (arr!28359 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10235)) mapDefault!34144)))))

(declare-fun b!962364 () Bool)

(declare-fun res!643828 () Bool)

(declare-fun e!542699 () Bool)

(assert (=> b!962364 (=> (not res!643828) (not e!542699))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((array!58992 0))(
  ( (array!58993 (arr!28360 (Array (_ BitVec 32) (_ BitVec 64))) (size!28840 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58992)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!962364 (= res!643828 (and (= (size!28839 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28840 _keys!1686) (size!28839 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962365 () Bool)

(declare-fun res!643829 () Bool)

(assert (=> b!962365 (=> (not res!643829) (not e!542699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58992 (_ BitVec 32)) Bool)

(assert (=> b!962365 (= res!643829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34144 () Bool)

(assert (=> mapIsEmpty!34144 mapRes!34144))

(declare-fun b!962366 () Bool)

(declare-fun e!542698 () Bool)

(declare-fun tp_is_empty!21433 () Bool)

(assert (=> b!962366 (= e!542698 tp_is_empty!21433)))

(declare-fun b!962367 () Bool)

(assert (=> b!962367 (= e!542702 tp_is_empty!21433)))

(declare-fun mapNonEmpty!34144 () Bool)

(declare-fun tp!65074 () Bool)

(assert (=> mapNonEmpty!34144 (= mapRes!34144 (and tp!65074 e!542698))))

(declare-fun mapValue!34144 () ValueCell!10235)

(declare-fun mapRest!34144 () (Array (_ BitVec 32) ValueCell!10235))

(declare-fun mapKey!34144 () (_ BitVec 32))

(assert (=> mapNonEmpty!34144 (= (arr!28359 _values!1400) (store mapRest!34144 mapKey!34144 mapValue!34144))))

(declare-fun res!643830 () Bool)

(assert (=> start!82666 (=> (not res!643830) (not e!542699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82666 (= res!643830 (validMask!0 mask!2110))))

(assert (=> start!82666 e!542699))

(assert (=> start!82666 true))

(declare-fun array_inv!22053 (array!58990) Bool)

(assert (=> start!82666 (and (array_inv!22053 _values!1400) e!542700)))

(declare-fun array_inv!22054 (array!58992) Bool)

(assert (=> start!82666 (array_inv!22054 _keys!1686)))

(declare-fun b!962368 () Bool)

(assert (=> b!962368 (= e!542699 false)))

(declare-fun lt!431120 () Bool)

(declare-datatypes ((List!19671 0))(
  ( (Nil!19668) (Cons!19667 (h!20835 (_ BitVec 64)) (t!28026 List!19671)) )
))
(declare-fun arrayNoDuplicates!0 (array!58992 (_ BitVec 32) List!19671) Bool)

(assert (=> b!962368 (= lt!431120 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19668))))

(assert (= (and start!82666 res!643830) b!962364))

(assert (= (and b!962364 res!643828) b!962365))

(assert (= (and b!962365 res!643829) b!962368))

(assert (= (and b!962363 condMapEmpty!34144) mapIsEmpty!34144))

(assert (= (and b!962363 (not condMapEmpty!34144)) mapNonEmpty!34144))

(get-info :version)

(assert (= (and mapNonEmpty!34144 ((_ is ValueCellFull!10235) mapValue!34144)) b!962366))

(assert (= (and b!962363 ((_ is ValueCellFull!10235) mapDefault!34144)) b!962367))

(assert (= start!82666 b!962363))

(declare-fun m!892699 () Bool)

(assert (=> b!962365 m!892699))

(declare-fun m!892701 () Bool)

(assert (=> mapNonEmpty!34144 m!892701))

(declare-fun m!892703 () Bool)

(assert (=> start!82666 m!892703))

(declare-fun m!892705 () Bool)

(assert (=> start!82666 m!892705))

(declare-fun m!892707 () Bool)

(assert (=> start!82666 m!892707))

(declare-fun m!892709 () Bool)

(assert (=> b!962368 m!892709))

(check-sat tp_is_empty!21433 (not b!962365) (not b!962368) (not mapNonEmpty!34144) (not start!82666))
(check-sat)
