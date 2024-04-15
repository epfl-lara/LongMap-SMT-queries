; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82480 () Bool)

(assert start!82480)

(declare-fun b!961221 () Bool)

(declare-fun e!541969 () Bool)

(assert (=> b!961221 (= e!541969 false)))

(declare-fun lt!430523 () Bool)

(declare-datatypes ((array!58896 0))(
  ( (array!58897 (arr!28317 (Array (_ BitVec 32) (_ BitVec 64))) (size!28798 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58896)

(declare-datatypes ((List!19704 0))(
  ( (Nil!19701) (Cons!19700 (h!20862 (_ BitVec 64)) (t!28058 List!19704)) )
))
(declare-fun arrayNoDuplicates!0 (array!58896 (_ BitVec 32) List!19704) Bool)

(assert (=> b!961221 (= lt!430523 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19701))))

(declare-fun b!961222 () Bool)

(declare-fun res!643374 () Bool)

(assert (=> b!961222 (=> (not res!643374) (not e!541969))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33561 0))(
  ( (V!33562 (val!10767 Int)) )
))
(declare-datatypes ((ValueCell!10235 0))(
  ( (ValueCellFull!10235 (v!13324 V!33561)) (EmptyCell!10235) )
))
(declare-datatypes ((array!58898 0))(
  ( (array!58899 (arr!28318 (Array (_ BitVec 32) ValueCell!10235)) (size!28799 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58898)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961222 (= res!643374 (and (= (size!28799 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28798 _keys!1686) (size!28799 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961223 () Bool)

(declare-fun e!541970 () Bool)

(declare-fun tp_is_empty!21433 () Bool)

(assert (=> b!961223 (= e!541970 tp_is_empty!21433)))

(declare-fun b!961224 () Bool)

(declare-fun e!541972 () Bool)

(assert (=> b!961224 (= e!541972 tp_is_empty!21433)))

(declare-fun res!643376 () Bool)

(assert (=> start!82480 (=> (not res!643376) (not e!541969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82480 (= res!643376 (validMask!0 mask!2110))))

(assert (=> start!82480 e!541969))

(assert (=> start!82480 true))

(declare-fun e!541971 () Bool)

(declare-fun array_inv!21997 (array!58898) Bool)

(assert (=> start!82480 (and (array_inv!21997 _values!1400) e!541971)))

(declare-fun array_inv!21998 (array!58896) Bool)

(assert (=> start!82480 (array_inv!21998 _keys!1686)))

(declare-fun b!961225 () Bool)

(declare-fun res!643375 () Bool)

(assert (=> b!961225 (=> (not res!643375) (not e!541969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58896 (_ BitVec 32)) Bool)

(assert (=> b!961225 (= res!643375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961226 () Bool)

(declare-fun mapRes!34144 () Bool)

(assert (=> b!961226 (= e!541971 (and e!541970 mapRes!34144))))

(declare-fun condMapEmpty!34144 () Bool)

(declare-fun mapDefault!34144 () ValueCell!10235)

(assert (=> b!961226 (= condMapEmpty!34144 (= (arr!28318 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10235)) mapDefault!34144)))))

(declare-fun mapNonEmpty!34144 () Bool)

(declare-fun tp!65074 () Bool)

(assert (=> mapNonEmpty!34144 (= mapRes!34144 (and tp!65074 e!541972))))

(declare-fun mapRest!34144 () (Array (_ BitVec 32) ValueCell!10235))

(declare-fun mapKey!34144 () (_ BitVec 32))

(declare-fun mapValue!34144 () ValueCell!10235)

(assert (=> mapNonEmpty!34144 (= (arr!28318 _values!1400) (store mapRest!34144 mapKey!34144 mapValue!34144))))

(declare-fun mapIsEmpty!34144 () Bool)

(assert (=> mapIsEmpty!34144 mapRes!34144))

(assert (= (and start!82480 res!643376) b!961222))

(assert (= (and b!961222 res!643374) b!961225))

(assert (= (and b!961225 res!643375) b!961221))

(assert (= (and b!961226 condMapEmpty!34144) mapIsEmpty!34144))

(assert (= (and b!961226 (not condMapEmpty!34144)) mapNonEmpty!34144))

(get-info :version)

(assert (= (and mapNonEmpty!34144 ((_ is ValueCellFull!10235) mapValue!34144)) b!961224))

(assert (= (and b!961226 ((_ is ValueCellFull!10235) mapDefault!34144)) b!961223))

(assert (= start!82480 b!961226))

(declare-fun m!890647 () Bool)

(assert (=> b!961221 m!890647))

(declare-fun m!890649 () Bool)

(assert (=> start!82480 m!890649))

(declare-fun m!890651 () Bool)

(assert (=> start!82480 m!890651))

(declare-fun m!890653 () Bool)

(assert (=> start!82480 m!890653))

(declare-fun m!890655 () Bool)

(assert (=> b!961225 m!890655))

(declare-fun m!890657 () Bool)

(assert (=> mapNonEmpty!34144 m!890657))

(check-sat (not b!961221) tp_is_empty!21433 (not b!961225) (not start!82480) (not mapNonEmpty!34144))
(check-sat)
