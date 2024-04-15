; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82498 () Bool)

(assert start!82498)

(declare-fun b!961383 () Bool)

(declare-fun res!643456 () Bool)

(declare-fun e!542103 () Bool)

(assert (=> b!961383 (=> (not res!643456) (not e!542103))))

(declare-datatypes ((array!58932 0))(
  ( (array!58933 (arr!28335 (Array (_ BitVec 32) (_ BitVec 64))) (size!28816 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58932)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58932 (_ BitVec 32)) Bool)

(assert (=> b!961383 (= res!643456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961384 () Bool)

(assert (=> b!961384 (= e!542103 false)))

(declare-fun lt!430550 () Bool)

(declare-datatypes ((List!19710 0))(
  ( (Nil!19707) (Cons!19706 (h!20868 (_ BitVec 64)) (t!28064 List!19710)) )
))
(declare-fun arrayNoDuplicates!0 (array!58932 (_ BitVec 32) List!19710) Bool)

(assert (=> b!961384 (= lt!430550 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19707))))

(declare-fun res!643455 () Bool)

(assert (=> start!82498 (=> (not res!643455) (not e!542103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82498 (= res!643455 (validMask!0 mask!2110))))

(assert (=> start!82498 e!542103))

(assert (=> start!82498 true))

(declare-datatypes ((V!33585 0))(
  ( (V!33586 (val!10776 Int)) )
))
(declare-datatypes ((ValueCell!10244 0))(
  ( (ValueCellFull!10244 (v!13333 V!33585)) (EmptyCell!10244) )
))
(declare-datatypes ((array!58934 0))(
  ( (array!58935 (arr!28336 (Array (_ BitVec 32) ValueCell!10244)) (size!28817 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58934)

(declare-fun e!542105 () Bool)

(declare-fun array_inv!22011 (array!58934) Bool)

(assert (=> start!82498 (and (array_inv!22011 _values!1400) e!542105)))

(declare-fun array_inv!22012 (array!58932) Bool)

(assert (=> start!82498 (array_inv!22012 _keys!1686)))

(declare-fun mapNonEmpty!34171 () Bool)

(declare-fun mapRes!34171 () Bool)

(declare-fun tp!65101 () Bool)

(declare-fun e!542106 () Bool)

(assert (=> mapNonEmpty!34171 (= mapRes!34171 (and tp!65101 e!542106))))

(declare-fun mapValue!34171 () ValueCell!10244)

(declare-fun mapRest!34171 () (Array (_ BitVec 32) ValueCell!10244))

(declare-fun mapKey!34171 () (_ BitVec 32))

(assert (=> mapNonEmpty!34171 (= (arr!28336 _values!1400) (store mapRest!34171 mapKey!34171 mapValue!34171))))

(declare-fun b!961385 () Bool)

(declare-fun tp_is_empty!21451 () Bool)

(assert (=> b!961385 (= e!542106 tp_is_empty!21451)))

(declare-fun b!961386 () Bool)

(declare-fun e!542104 () Bool)

(assert (=> b!961386 (= e!542105 (and e!542104 mapRes!34171))))

(declare-fun condMapEmpty!34171 () Bool)

(declare-fun mapDefault!34171 () ValueCell!10244)

(assert (=> b!961386 (= condMapEmpty!34171 (= (arr!28336 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10244)) mapDefault!34171)))))

(declare-fun mapIsEmpty!34171 () Bool)

(assert (=> mapIsEmpty!34171 mapRes!34171))

(declare-fun b!961387 () Bool)

(assert (=> b!961387 (= e!542104 tp_is_empty!21451)))

(declare-fun b!961388 () Bool)

(declare-fun res!643457 () Bool)

(assert (=> b!961388 (=> (not res!643457) (not e!542103))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961388 (= res!643457 (and (= (size!28817 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28816 _keys!1686) (size!28817 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82498 res!643455) b!961388))

(assert (= (and b!961388 res!643457) b!961383))

(assert (= (and b!961383 res!643456) b!961384))

(assert (= (and b!961386 condMapEmpty!34171) mapIsEmpty!34171))

(assert (= (and b!961386 (not condMapEmpty!34171)) mapNonEmpty!34171))

(get-info :version)

(assert (= (and mapNonEmpty!34171 ((_ is ValueCellFull!10244) mapValue!34171)) b!961385))

(assert (= (and b!961386 ((_ is ValueCellFull!10244) mapDefault!34171)) b!961387))

(assert (= start!82498 b!961386))

(declare-fun m!890755 () Bool)

(assert (=> b!961383 m!890755))

(declare-fun m!890757 () Bool)

(assert (=> b!961384 m!890757))

(declare-fun m!890759 () Bool)

(assert (=> start!82498 m!890759))

(declare-fun m!890761 () Bool)

(assert (=> start!82498 m!890761))

(declare-fun m!890763 () Bool)

(assert (=> start!82498 m!890763))

(declare-fun m!890765 () Bool)

(assert (=> mapNonEmpty!34171 m!890765))

(check-sat (not b!961383) tp_is_empty!21451 (not start!82498) (not mapNonEmpty!34171) (not b!961384))
(check-sat)
