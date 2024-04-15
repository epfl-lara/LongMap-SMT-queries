; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82468 () Bool)

(assert start!82468)

(declare-fun b!961113 () Bool)

(declare-fun e!541880 () Bool)

(assert (=> b!961113 (= e!541880 false)))

(declare-fun lt!430505 () Bool)

(declare-datatypes ((array!58874 0))(
  ( (array!58875 (arr!28306 (Array (_ BitVec 32) (_ BitVec 64))) (size!28787 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58874)

(declare-datatypes ((List!19700 0))(
  ( (Nil!19697) (Cons!19696 (h!20858 (_ BitVec 64)) (t!28054 List!19700)) )
))
(declare-fun arrayNoDuplicates!0 (array!58874 (_ BitVec 32) List!19700) Bool)

(assert (=> b!961113 (= lt!430505 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19697))))

(declare-fun b!961114 () Bool)

(declare-fun res!643322 () Bool)

(assert (=> b!961114 (=> (not res!643322) (not e!541880))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58874 (_ BitVec 32)) Bool)

(assert (=> b!961114 (= res!643322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961115 () Bool)

(declare-fun res!643321 () Bool)

(assert (=> b!961115 (=> (not res!643321) (not e!541880))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33545 0))(
  ( (V!33546 (val!10761 Int)) )
))
(declare-datatypes ((ValueCell!10229 0))(
  ( (ValueCellFull!10229 (v!13318 V!33545)) (EmptyCell!10229) )
))
(declare-datatypes ((array!58876 0))(
  ( (array!58877 (arr!28307 (Array (_ BitVec 32) ValueCell!10229)) (size!28788 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58876)

(assert (=> b!961115 (= res!643321 (and (= (size!28788 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28787 _keys!1686) (size!28788 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun res!643320 () Bool)

(assert (=> start!82468 (=> (not res!643320) (not e!541880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82468 (= res!643320 (validMask!0 mask!2110))))

(assert (=> start!82468 e!541880))

(assert (=> start!82468 true))

(declare-fun e!541879 () Bool)

(declare-fun array_inv!21989 (array!58876) Bool)

(assert (=> start!82468 (and (array_inv!21989 _values!1400) e!541879)))

(declare-fun array_inv!21990 (array!58874) Bool)

(assert (=> start!82468 (array_inv!21990 _keys!1686)))

(declare-fun mapNonEmpty!34126 () Bool)

(declare-fun mapRes!34126 () Bool)

(declare-fun tp!65056 () Bool)

(declare-fun e!541878 () Bool)

(assert (=> mapNonEmpty!34126 (= mapRes!34126 (and tp!65056 e!541878))))

(declare-fun mapRest!34126 () (Array (_ BitVec 32) ValueCell!10229))

(declare-fun mapKey!34126 () (_ BitVec 32))

(declare-fun mapValue!34126 () ValueCell!10229)

(assert (=> mapNonEmpty!34126 (= (arr!28307 _values!1400) (store mapRest!34126 mapKey!34126 mapValue!34126))))

(declare-fun b!961116 () Bool)

(declare-fun e!541882 () Bool)

(assert (=> b!961116 (= e!541879 (and e!541882 mapRes!34126))))

(declare-fun condMapEmpty!34126 () Bool)

(declare-fun mapDefault!34126 () ValueCell!10229)

(assert (=> b!961116 (= condMapEmpty!34126 (= (arr!28307 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10229)) mapDefault!34126)))))

(declare-fun b!961117 () Bool)

(declare-fun tp_is_empty!21421 () Bool)

(assert (=> b!961117 (= e!541878 tp_is_empty!21421)))

(declare-fun mapIsEmpty!34126 () Bool)

(assert (=> mapIsEmpty!34126 mapRes!34126))

(declare-fun b!961118 () Bool)

(assert (=> b!961118 (= e!541882 tp_is_empty!21421)))

(assert (= (and start!82468 res!643320) b!961115))

(assert (= (and b!961115 res!643321) b!961114))

(assert (= (and b!961114 res!643322) b!961113))

(assert (= (and b!961116 condMapEmpty!34126) mapIsEmpty!34126))

(assert (= (and b!961116 (not condMapEmpty!34126)) mapNonEmpty!34126))

(get-info :version)

(assert (= (and mapNonEmpty!34126 ((_ is ValueCellFull!10229) mapValue!34126)) b!961117))

(assert (= (and b!961116 ((_ is ValueCellFull!10229) mapDefault!34126)) b!961118))

(assert (= start!82468 b!961116))

(declare-fun m!890575 () Bool)

(assert (=> b!961113 m!890575))

(declare-fun m!890577 () Bool)

(assert (=> b!961114 m!890577))

(declare-fun m!890579 () Bool)

(assert (=> start!82468 m!890579))

(declare-fun m!890581 () Bool)

(assert (=> start!82468 m!890581))

(declare-fun m!890583 () Bool)

(assert (=> start!82468 m!890583))

(declare-fun m!890585 () Bool)

(assert (=> mapNonEmpty!34126 m!890585))

(check-sat (not mapNonEmpty!34126) (not b!961113) (not b!961114) tp_is_empty!21421 (not start!82468))
(check-sat)
