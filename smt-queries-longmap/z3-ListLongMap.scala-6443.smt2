; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82500 () Bool)

(assert start!82500)

(declare-fun b!961478 () Bool)

(declare-fun res!643494 () Bool)

(declare-fun e!542135 () Bool)

(assert (=> b!961478 (=> (not res!643494) (not e!542135))))

(declare-datatypes ((array!58967 0))(
  ( (array!58968 (arr!28352 (Array (_ BitVec 32) (_ BitVec 64))) (size!28831 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58967)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58967 (_ BitVec 32)) Bool)

(assert (=> b!961478 (= res!643494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961479 () Bool)

(declare-fun e!542131 () Bool)

(declare-fun tp_is_empty!21435 () Bool)

(assert (=> b!961479 (= e!542131 tp_is_empty!21435)))

(declare-fun mapIsEmpty!34147 () Bool)

(declare-fun mapRes!34147 () Bool)

(assert (=> mapIsEmpty!34147 mapRes!34147))

(declare-fun res!643493 () Bool)

(assert (=> start!82500 (=> (not res!643493) (not e!542135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82500 (= res!643493 (validMask!0 mask!2110))))

(assert (=> start!82500 e!542135))

(assert (=> start!82500 true))

(declare-datatypes ((V!33563 0))(
  ( (V!33564 (val!10768 Int)) )
))
(declare-datatypes ((ValueCell!10236 0))(
  ( (ValueCellFull!10236 (v!13326 V!33563)) (EmptyCell!10236) )
))
(declare-datatypes ((array!58969 0))(
  ( (array!58970 (arr!28353 (Array (_ BitVec 32) ValueCell!10236)) (size!28832 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58969)

(declare-fun e!542133 () Bool)

(declare-fun array_inv!21971 (array!58969) Bool)

(assert (=> start!82500 (and (array_inv!21971 _values!1400) e!542133)))

(declare-fun array_inv!21972 (array!58967) Bool)

(assert (=> start!82500 (array_inv!21972 _keys!1686)))

(declare-fun mapNonEmpty!34147 () Bool)

(declare-fun tp!65076 () Bool)

(assert (=> mapNonEmpty!34147 (= mapRes!34147 (and tp!65076 e!542131))))

(declare-fun mapValue!34147 () ValueCell!10236)

(declare-fun mapRest!34147 () (Array (_ BitVec 32) ValueCell!10236))

(declare-fun mapKey!34147 () (_ BitVec 32))

(assert (=> mapNonEmpty!34147 (= (arr!28353 _values!1400) (store mapRest!34147 mapKey!34147 mapValue!34147))))

(declare-fun b!961480 () Bool)

(declare-fun e!542134 () Bool)

(assert (=> b!961480 (= e!542133 (and e!542134 mapRes!34147))))

(declare-fun condMapEmpty!34147 () Bool)

(declare-fun mapDefault!34147 () ValueCell!10236)

(assert (=> b!961480 (= condMapEmpty!34147 (= (arr!28353 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10236)) mapDefault!34147)))))

(declare-fun b!961481 () Bool)

(assert (=> b!961481 (= e!542134 tp_is_empty!21435)))

(declare-fun b!961482 () Bool)

(assert (=> b!961482 (= e!542135 false)))

(declare-fun lt!430762 () Bool)

(declare-datatypes ((List!19692 0))(
  ( (Nil!19689) (Cons!19688 (h!20850 (_ BitVec 64)) (t!28055 List!19692)) )
))
(declare-fun arrayNoDuplicates!0 (array!58967 (_ BitVec 32) List!19692) Bool)

(assert (=> b!961482 (= lt!430762 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19689))))

(declare-fun b!961483 () Bool)

(declare-fun res!643495 () Bool)

(assert (=> b!961483 (=> (not res!643495) (not e!542135))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961483 (= res!643495 (and (= (size!28832 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28831 _keys!1686) (size!28832 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82500 res!643493) b!961483))

(assert (= (and b!961483 res!643495) b!961478))

(assert (= (and b!961478 res!643494) b!961482))

(assert (= (and b!961480 condMapEmpty!34147) mapIsEmpty!34147))

(assert (= (and b!961480 (not condMapEmpty!34147)) mapNonEmpty!34147))

(get-info :version)

(assert (= (and mapNonEmpty!34147 ((_ is ValueCellFull!10236) mapValue!34147)) b!961479))

(assert (= (and b!961480 ((_ is ValueCellFull!10236) mapDefault!34147)) b!961481))

(assert (= start!82500 b!961480))

(declare-fun m!891417 () Bool)

(assert (=> b!961478 m!891417))

(declare-fun m!891419 () Bool)

(assert (=> start!82500 m!891419))

(declare-fun m!891421 () Bool)

(assert (=> start!82500 m!891421))

(declare-fun m!891423 () Bool)

(assert (=> start!82500 m!891423))

(declare-fun m!891425 () Bool)

(assert (=> mapNonEmpty!34147 m!891425))

(declare-fun m!891427 () Bool)

(assert (=> b!961482 m!891427))

(check-sat (not start!82500) (not b!961482) tp_is_empty!21435 (not mapNonEmpty!34147) (not b!961478))
(check-sat)
