; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82494 () Bool)

(assert start!82494)

(declare-fun b!961424 () Bool)

(declare-fun res!643467 () Bool)

(declare-fun e!542089 () Bool)

(assert (=> b!961424 (=> (not res!643467) (not e!542089))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33555 0))(
  ( (V!33556 (val!10765 Int)) )
))
(declare-datatypes ((ValueCell!10233 0))(
  ( (ValueCellFull!10233 (v!13323 V!33555)) (EmptyCell!10233) )
))
(declare-datatypes ((array!58955 0))(
  ( (array!58956 (arr!28346 (Array (_ BitVec 32) ValueCell!10233)) (size!28825 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58955)

(declare-datatypes ((array!58957 0))(
  ( (array!58958 (arr!28347 (Array (_ BitVec 32) (_ BitVec 64))) (size!28826 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58957)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961424 (= res!643467 (and (= (size!28825 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28826 _keys!1686) (size!28825 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961425 () Bool)

(declare-fun e!542086 () Bool)

(declare-fun tp_is_empty!21429 () Bool)

(assert (=> b!961425 (= e!542086 tp_is_empty!21429)))

(declare-fun b!961426 () Bool)

(assert (=> b!961426 (= e!542089 false)))

(declare-fun lt!430753 () Bool)

(declare-datatypes ((List!19690 0))(
  ( (Nil!19687) (Cons!19686 (h!20848 (_ BitVec 64)) (t!28053 List!19690)) )
))
(declare-fun arrayNoDuplicates!0 (array!58957 (_ BitVec 32) List!19690) Bool)

(assert (=> b!961426 (= lt!430753 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19687))))

(declare-fun b!961427 () Bool)

(declare-fun res!643468 () Bool)

(assert (=> b!961427 (=> (not res!643468) (not e!542089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58957 (_ BitVec 32)) Bool)

(assert (=> b!961427 (= res!643468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34138 () Bool)

(declare-fun mapRes!34138 () Bool)

(declare-fun tp!65067 () Bool)

(assert (=> mapNonEmpty!34138 (= mapRes!34138 (and tp!65067 e!542086))))

(declare-fun mapRest!34138 () (Array (_ BitVec 32) ValueCell!10233))

(declare-fun mapValue!34138 () ValueCell!10233)

(declare-fun mapKey!34138 () (_ BitVec 32))

(assert (=> mapNonEmpty!34138 (= (arr!28346 _values!1400) (store mapRest!34138 mapKey!34138 mapValue!34138))))

(declare-fun b!961428 () Bool)

(declare-fun e!542090 () Bool)

(assert (=> b!961428 (= e!542090 tp_is_empty!21429)))

(declare-fun b!961429 () Bool)

(declare-fun e!542087 () Bool)

(assert (=> b!961429 (= e!542087 (and e!542090 mapRes!34138))))

(declare-fun condMapEmpty!34138 () Bool)

(declare-fun mapDefault!34138 () ValueCell!10233)

(assert (=> b!961429 (= condMapEmpty!34138 (= (arr!28346 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10233)) mapDefault!34138)))))

(declare-fun res!643466 () Bool)

(assert (=> start!82494 (=> (not res!643466) (not e!542089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82494 (= res!643466 (validMask!0 mask!2110))))

(assert (=> start!82494 e!542089))

(assert (=> start!82494 true))

(declare-fun array_inv!21965 (array!58955) Bool)

(assert (=> start!82494 (and (array_inv!21965 _values!1400) e!542087)))

(declare-fun array_inv!21966 (array!58957) Bool)

(assert (=> start!82494 (array_inv!21966 _keys!1686)))

(declare-fun mapIsEmpty!34138 () Bool)

(assert (=> mapIsEmpty!34138 mapRes!34138))

(assert (= (and start!82494 res!643466) b!961424))

(assert (= (and b!961424 res!643467) b!961427))

(assert (= (and b!961427 res!643468) b!961426))

(assert (= (and b!961429 condMapEmpty!34138) mapIsEmpty!34138))

(assert (= (and b!961429 (not condMapEmpty!34138)) mapNonEmpty!34138))

(get-info :version)

(assert (= (and mapNonEmpty!34138 ((_ is ValueCellFull!10233) mapValue!34138)) b!961425))

(assert (= (and b!961429 ((_ is ValueCellFull!10233) mapDefault!34138)) b!961428))

(assert (= start!82494 b!961429))

(declare-fun m!891381 () Bool)

(assert (=> b!961426 m!891381))

(declare-fun m!891383 () Bool)

(assert (=> b!961427 m!891383))

(declare-fun m!891385 () Bool)

(assert (=> mapNonEmpty!34138 m!891385))

(declare-fun m!891387 () Bool)

(assert (=> start!82494 m!891387))

(declare-fun m!891389 () Bool)

(assert (=> start!82494 m!891389))

(declare-fun m!891391 () Bool)

(assert (=> start!82494 m!891391))

(check-sat (not b!961427) tp_is_empty!21429 (not b!961426) (not mapNonEmpty!34138) (not start!82494))
(check-sat)
