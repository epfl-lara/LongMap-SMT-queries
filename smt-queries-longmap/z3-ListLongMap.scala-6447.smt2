; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82504 () Bool)

(assert start!82504)

(declare-fun b!961437 () Bool)

(declare-fun res!643482 () Bool)

(declare-fun e!542152 () Bool)

(assert (=> b!961437 (=> (not res!643482) (not e!542152))))

(declare-datatypes ((array!58944 0))(
  ( (array!58945 (arr!28341 (Array (_ BitVec 32) (_ BitVec 64))) (size!28822 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58944)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58944 (_ BitVec 32)) Bool)

(assert (=> b!961437 (= res!643482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961438 () Bool)

(declare-fun e!542151 () Bool)

(declare-fun e!542148 () Bool)

(declare-fun mapRes!34180 () Bool)

(assert (=> b!961438 (= e!542151 (and e!542148 mapRes!34180))))

(declare-fun condMapEmpty!34180 () Bool)

(declare-datatypes ((V!33593 0))(
  ( (V!33594 (val!10779 Int)) )
))
(declare-datatypes ((ValueCell!10247 0))(
  ( (ValueCellFull!10247 (v!13336 V!33593)) (EmptyCell!10247) )
))
(declare-datatypes ((array!58946 0))(
  ( (array!58947 (arr!28342 (Array (_ BitVec 32) ValueCell!10247)) (size!28823 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58946)

(declare-fun mapDefault!34180 () ValueCell!10247)

(assert (=> b!961438 (= condMapEmpty!34180 (= (arr!28342 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10247)) mapDefault!34180)))))

(declare-fun b!961439 () Bool)

(declare-fun res!643484 () Bool)

(assert (=> b!961439 (=> (not res!643484) (not e!542152))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961439 (= res!643484 (and (= (size!28823 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28822 _keys!1686) (size!28823 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34180 () Bool)

(declare-fun tp!65110 () Bool)

(declare-fun e!542149 () Bool)

(assert (=> mapNonEmpty!34180 (= mapRes!34180 (and tp!65110 e!542149))))

(declare-fun mapRest!34180 () (Array (_ BitVec 32) ValueCell!10247))

(declare-fun mapKey!34180 () (_ BitVec 32))

(declare-fun mapValue!34180 () ValueCell!10247)

(assert (=> mapNonEmpty!34180 (= (arr!28342 _values!1400) (store mapRest!34180 mapKey!34180 mapValue!34180))))

(declare-fun b!961440 () Bool)

(declare-fun tp_is_empty!21457 () Bool)

(assert (=> b!961440 (= e!542149 tp_is_empty!21457)))

(declare-fun res!643483 () Bool)

(assert (=> start!82504 (=> (not res!643483) (not e!542152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82504 (= res!643483 (validMask!0 mask!2110))))

(assert (=> start!82504 e!542152))

(assert (=> start!82504 true))

(declare-fun array_inv!22017 (array!58946) Bool)

(assert (=> start!82504 (and (array_inv!22017 _values!1400) e!542151)))

(declare-fun array_inv!22018 (array!58944) Bool)

(assert (=> start!82504 (array_inv!22018 _keys!1686)))

(declare-fun b!961441 () Bool)

(assert (=> b!961441 (= e!542148 tp_is_empty!21457)))

(declare-fun b!961442 () Bool)

(assert (=> b!961442 (= e!542152 false)))

(declare-fun lt!430559 () Bool)

(declare-datatypes ((List!19712 0))(
  ( (Nil!19709) (Cons!19708 (h!20870 (_ BitVec 64)) (t!28066 List!19712)) )
))
(declare-fun arrayNoDuplicates!0 (array!58944 (_ BitVec 32) List!19712) Bool)

(assert (=> b!961442 (= lt!430559 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19709))))

(declare-fun mapIsEmpty!34180 () Bool)

(assert (=> mapIsEmpty!34180 mapRes!34180))

(assert (= (and start!82504 res!643483) b!961439))

(assert (= (and b!961439 res!643484) b!961437))

(assert (= (and b!961437 res!643482) b!961442))

(assert (= (and b!961438 condMapEmpty!34180) mapIsEmpty!34180))

(assert (= (and b!961438 (not condMapEmpty!34180)) mapNonEmpty!34180))

(get-info :version)

(assert (= (and mapNonEmpty!34180 ((_ is ValueCellFull!10247) mapValue!34180)) b!961440))

(assert (= (and b!961438 ((_ is ValueCellFull!10247) mapDefault!34180)) b!961441))

(assert (= start!82504 b!961438))

(declare-fun m!890791 () Bool)

(assert (=> b!961437 m!890791))

(declare-fun m!890793 () Bool)

(assert (=> mapNonEmpty!34180 m!890793))

(declare-fun m!890795 () Bool)

(assert (=> start!82504 m!890795))

(declare-fun m!890797 () Bool)

(assert (=> start!82504 m!890797))

(declare-fun m!890799 () Bool)

(assert (=> start!82504 m!890799))

(declare-fun m!890801 () Bool)

(assert (=> b!961442 m!890801))

(check-sat tp_is_empty!21457 (not b!961442) (not mapNonEmpty!34180) (not start!82504) (not b!961437))
(check-sat)
