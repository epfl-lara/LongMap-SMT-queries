; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106978 () Bool)

(assert start!106978)

(declare-fun b!1268501 () Bool)

(declare-fun res!844282 () Bool)

(declare-fun e!722837 () Bool)

(assert (=> b!1268501 (=> (not res!844282) (not e!722837))))

(declare-datatypes ((array!82608 0))(
  ( (array!82609 (arr!39841 (Array (_ BitVec 32) (_ BitVec 64))) (size!40377 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82608)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82608 (_ BitVec 32)) Bool)

(assert (=> b!1268501 (= res!844282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268502 () Bool)

(declare-fun e!722834 () Bool)

(declare-fun tp_is_empty!32667 () Bool)

(assert (=> b!1268502 (= e!722834 tp_is_empty!32667)))

(declare-fun b!1268503 () Bool)

(declare-fun res!844283 () Bool)

(assert (=> b!1268503 (=> (not res!844283) (not e!722837))))

(declare-datatypes ((V!48749 0))(
  ( (V!48750 (val!16408 Int)) )
))
(declare-datatypes ((ValueCell!15480 0))(
  ( (ValueCellFull!15480 (v!19045 V!48749)) (EmptyCell!15480) )
))
(declare-datatypes ((array!82610 0))(
  ( (array!82611 (arr!39842 (Array (_ BitVec 32) ValueCell!15480)) (size!40378 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82610)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268503 (= res!844283 (and (= (size!40378 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40377 _keys!1364) (size!40378 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268504 () Bool)

(declare-fun e!722836 () Bool)

(declare-fun mapRes!50581 () Bool)

(assert (=> b!1268504 (= e!722836 (and e!722834 mapRes!50581))))

(declare-fun condMapEmpty!50581 () Bool)

(declare-fun mapDefault!50581 () ValueCell!15480)

(assert (=> b!1268504 (= condMapEmpty!50581 (= (arr!39842 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15480)) mapDefault!50581)))))

(declare-fun mapIsEmpty!50581 () Bool)

(assert (=> mapIsEmpty!50581 mapRes!50581))

(declare-fun res!844281 () Bool)

(assert (=> start!106978 (=> (not res!844281) (not e!722837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106978 (= res!844281 (validMask!0 mask!1730))))

(assert (=> start!106978 e!722837))

(declare-fun array_inv!30315 (array!82610) Bool)

(assert (=> start!106978 (and (array_inv!30315 _values!1134) e!722836)))

(assert (=> start!106978 true))

(declare-fun array_inv!30316 (array!82608) Bool)

(assert (=> start!106978 (array_inv!30316 _keys!1364)))

(declare-fun b!1268505 () Bool)

(declare-fun e!722838 () Bool)

(assert (=> b!1268505 (= e!722838 tp_is_empty!32667)))

(declare-fun mapNonEmpty!50581 () Bool)

(declare-fun tp!96760 () Bool)

(assert (=> mapNonEmpty!50581 (= mapRes!50581 (and tp!96760 e!722838))))

(declare-fun mapValue!50581 () ValueCell!15480)

(declare-fun mapKey!50581 () (_ BitVec 32))

(declare-fun mapRest!50581 () (Array (_ BitVec 32) ValueCell!15480))

(assert (=> mapNonEmpty!50581 (= (arr!39842 _values!1134) (store mapRest!50581 mapKey!50581 mapValue!50581))))

(declare-fun b!1268506 () Bool)

(assert (=> b!1268506 (= e!722837 false)))

(declare-fun lt!574437 () Bool)

(declare-datatypes ((List!28384 0))(
  ( (Nil!28381) (Cons!28380 (h!29589 (_ BitVec 64)) (t!41913 List!28384)) )
))
(declare-fun arrayNoDuplicates!0 (array!82608 (_ BitVec 32) List!28384) Bool)

(assert (=> b!1268506 (= lt!574437 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28381))))

(assert (= (and start!106978 res!844281) b!1268503))

(assert (= (and b!1268503 res!844283) b!1268501))

(assert (= (and b!1268501 res!844282) b!1268506))

(assert (= (and b!1268504 condMapEmpty!50581) mapIsEmpty!50581))

(assert (= (and b!1268504 (not condMapEmpty!50581)) mapNonEmpty!50581))

(get-info :version)

(assert (= (and mapNonEmpty!50581 ((_ is ValueCellFull!15480) mapValue!50581)) b!1268505))

(assert (= (and b!1268504 ((_ is ValueCellFull!15480) mapDefault!50581)) b!1268502))

(assert (= start!106978 b!1268504))

(declare-fun m!1167323 () Bool)

(assert (=> b!1268501 m!1167323))

(declare-fun m!1167325 () Bool)

(assert (=> start!106978 m!1167325))

(declare-fun m!1167327 () Bool)

(assert (=> start!106978 m!1167327))

(declare-fun m!1167329 () Bool)

(assert (=> start!106978 m!1167329))

(declare-fun m!1167331 () Bool)

(assert (=> mapNonEmpty!50581 m!1167331))

(declare-fun m!1167333 () Bool)

(assert (=> b!1268506 m!1167333))

(check-sat (not start!106978) (not mapNonEmpty!50581) tp_is_empty!32667 (not b!1268501) (not b!1268506))
(check-sat)
