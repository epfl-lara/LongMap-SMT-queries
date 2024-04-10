; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107008 () Bool)

(assert start!107008)

(declare-fun b!1268771 () Bool)

(declare-fun e!723063 () Bool)

(assert (=> b!1268771 (= e!723063 false)))

(declare-fun lt!574482 () Bool)

(declare-datatypes ((array!82664 0))(
  ( (array!82665 (arr!39869 (Array (_ BitVec 32) (_ BitVec 64))) (size!40405 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82664)

(declare-datatypes ((List!28394 0))(
  ( (Nil!28391) (Cons!28390 (h!29599 (_ BitVec 64)) (t!41923 List!28394)) )
))
(declare-fun arrayNoDuplicates!0 (array!82664 (_ BitVec 32) List!28394) Bool)

(assert (=> b!1268771 (= lt!574482 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28391))))

(declare-fun b!1268772 () Bool)

(declare-fun res!844417 () Bool)

(assert (=> b!1268772 (=> (not res!844417) (not e!723063))))

(declare-datatypes ((V!48789 0))(
  ( (V!48790 (val!16423 Int)) )
))
(declare-datatypes ((ValueCell!15495 0))(
  ( (ValueCellFull!15495 (v!19060 V!48789)) (EmptyCell!15495) )
))
(declare-datatypes ((array!82666 0))(
  ( (array!82667 (arr!39870 (Array (_ BitVec 32) ValueCell!15495)) (size!40406 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82666)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268772 (= res!844417 (and (= (size!40406 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40405 _keys!1364) (size!40406 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!844416 () Bool)

(assert (=> start!107008 (=> (not res!844416) (not e!723063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107008 (= res!844416 (validMask!0 mask!1730))))

(assert (=> start!107008 e!723063))

(declare-fun e!723061 () Bool)

(declare-fun array_inv!30335 (array!82666) Bool)

(assert (=> start!107008 (and (array_inv!30335 _values!1134) e!723061)))

(assert (=> start!107008 true))

(declare-fun array_inv!30336 (array!82664) Bool)

(assert (=> start!107008 (array_inv!30336 _keys!1364)))

(declare-fun mapNonEmpty!50626 () Bool)

(declare-fun mapRes!50626 () Bool)

(declare-fun tp!96805 () Bool)

(declare-fun e!723059 () Bool)

(assert (=> mapNonEmpty!50626 (= mapRes!50626 (and tp!96805 e!723059))))

(declare-fun mapKey!50626 () (_ BitVec 32))

(declare-fun mapValue!50626 () ValueCell!15495)

(declare-fun mapRest!50626 () (Array (_ BitVec 32) ValueCell!15495))

(assert (=> mapNonEmpty!50626 (= (arr!39870 _values!1134) (store mapRest!50626 mapKey!50626 mapValue!50626))))

(declare-fun b!1268773 () Bool)

(declare-fun tp_is_empty!32697 () Bool)

(assert (=> b!1268773 (= e!723059 tp_is_empty!32697)))

(declare-fun mapIsEmpty!50626 () Bool)

(assert (=> mapIsEmpty!50626 mapRes!50626))

(declare-fun b!1268774 () Bool)

(declare-fun e!723062 () Bool)

(assert (=> b!1268774 (= e!723061 (and e!723062 mapRes!50626))))

(declare-fun condMapEmpty!50626 () Bool)

(declare-fun mapDefault!50626 () ValueCell!15495)

(assert (=> b!1268774 (= condMapEmpty!50626 (= (arr!39870 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15495)) mapDefault!50626)))))

(declare-fun b!1268775 () Bool)

(assert (=> b!1268775 (= e!723062 tp_is_empty!32697)))

(declare-fun b!1268776 () Bool)

(declare-fun res!844418 () Bool)

(assert (=> b!1268776 (=> (not res!844418) (not e!723063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82664 (_ BitVec 32)) Bool)

(assert (=> b!1268776 (= res!844418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107008 res!844416) b!1268772))

(assert (= (and b!1268772 res!844417) b!1268776))

(assert (= (and b!1268776 res!844418) b!1268771))

(assert (= (and b!1268774 condMapEmpty!50626) mapIsEmpty!50626))

(assert (= (and b!1268774 (not condMapEmpty!50626)) mapNonEmpty!50626))

(get-info :version)

(assert (= (and mapNonEmpty!50626 ((_ is ValueCellFull!15495) mapValue!50626)) b!1268773))

(assert (= (and b!1268774 ((_ is ValueCellFull!15495) mapDefault!50626)) b!1268775))

(assert (= start!107008 b!1268774))

(declare-fun m!1167503 () Bool)

(assert (=> b!1268771 m!1167503))

(declare-fun m!1167505 () Bool)

(assert (=> start!107008 m!1167505))

(declare-fun m!1167507 () Bool)

(assert (=> start!107008 m!1167507))

(declare-fun m!1167509 () Bool)

(assert (=> start!107008 m!1167509))

(declare-fun m!1167511 () Bool)

(assert (=> mapNonEmpty!50626 m!1167511))

(declare-fun m!1167513 () Bool)

(assert (=> b!1268776 m!1167513))

(check-sat (not b!1268776) (not start!107008) (not b!1268771) tp_is_empty!32697 (not mapNonEmpty!50626))
(check-sat)
