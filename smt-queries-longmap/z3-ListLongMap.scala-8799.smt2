; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107242 () Bool)

(assert start!107242)

(declare-fun b!1270166 () Bool)

(declare-fun res!844982 () Bool)

(declare-fun e!723982 () Bool)

(assert (=> b!1270166 (=> (not res!844982) (not e!723982))))

(declare-datatypes ((array!82725 0))(
  ( (array!82726 (arr!39895 (Array (_ BitVec 32) (_ BitVec 64))) (size!40432 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82725)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82725 (_ BitVec 32)) Bool)

(assert (=> b!1270166 (= res!844982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!844983 () Bool)

(assert (=> start!107242 (=> (not res!844983) (not e!723982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107242 (= res!844983 (validMask!0 mask!1730))))

(assert (=> start!107242 e!723982))

(declare-datatypes ((V!48803 0))(
  ( (V!48804 (val!16428 Int)) )
))
(declare-datatypes ((ValueCell!15500 0))(
  ( (ValueCellFull!15500 (v!19060 V!48803)) (EmptyCell!15500) )
))
(declare-datatypes ((array!82727 0))(
  ( (array!82728 (arr!39896 (Array (_ BitVec 32) ValueCell!15500)) (size!40433 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82727)

(declare-fun e!723984 () Bool)

(declare-fun array_inv!30523 (array!82727) Bool)

(assert (=> start!107242 (and (array_inv!30523 _values!1134) e!723984)))

(assert (=> start!107242 true))

(declare-fun array_inv!30524 (array!82725) Bool)

(assert (=> start!107242 (array_inv!30524 _keys!1364)))

(declare-fun b!1270167 () Bool)

(declare-fun e!723981 () Bool)

(declare-fun mapRes!50641 () Bool)

(assert (=> b!1270167 (= e!723984 (and e!723981 mapRes!50641))))

(declare-fun condMapEmpty!50641 () Bool)

(declare-fun mapDefault!50641 () ValueCell!15500)

(assert (=> b!1270167 (= condMapEmpty!50641 (= (arr!39896 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15500)) mapDefault!50641)))))

(declare-fun mapIsEmpty!50641 () Bool)

(assert (=> mapIsEmpty!50641 mapRes!50641))

(declare-fun b!1270168 () Bool)

(declare-fun res!844981 () Bool)

(assert (=> b!1270168 (=> (not res!844981) (not e!723982))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270168 (= res!844981 (and (= (size!40433 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40432 _keys!1364) (size!40433 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50641 () Bool)

(declare-fun tp!96820 () Bool)

(declare-fun e!723985 () Bool)

(assert (=> mapNonEmpty!50641 (= mapRes!50641 (and tp!96820 e!723985))))

(declare-fun mapValue!50641 () ValueCell!15500)

(declare-fun mapRest!50641 () (Array (_ BitVec 32) ValueCell!15500))

(declare-fun mapKey!50641 () (_ BitVec 32))

(assert (=> mapNonEmpty!50641 (= (arr!39896 _values!1134) (store mapRest!50641 mapKey!50641 mapValue!50641))))

(declare-fun b!1270169 () Bool)

(assert (=> b!1270169 (= e!723982 false)))

(declare-fun lt!574981 () Bool)

(declare-datatypes ((List!28434 0))(
  ( (Nil!28431) (Cons!28430 (h!29648 (_ BitVec 64)) (t!41955 List!28434)) )
))
(declare-fun arrayNoDuplicates!0 (array!82725 (_ BitVec 32) List!28434) Bool)

(assert (=> b!1270169 (= lt!574981 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28431))))

(declare-fun b!1270170 () Bool)

(declare-fun tp_is_empty!32707 () Bool)

(assert (=> b!1270170 (= e!723981 tp_is_empty!32707)))

(declare-fun b!1270171 () Bool)

(assert (=> b!1270171 (= e!723985 tp_is_empty!32707)))

(assert (= (and start!107242 res!844983) b!1270168))

(assert (= (and b!1270168 res!844981) b!1270166))

(assert (= (and b!1270166 res!844982) b!1270169))

(assert (= (and b!1270167 condMapEmpty!50641) mapIsEmpty!50641))

(assert (= (and b!1270167 (not condMapEmpty!50641)) mapNonEmpty!50641))

(get-info :version)

(assert (= (and mapNonEmpty!50641 ((_ is ValueCellFull!15500) mapValue!50641)) b!1270171))

(assert (= (and b!1270167 ((_ is ValueCellFull!15500) mapDefault!50641)) b!1270170))

(assert (= start!107242 b!1270167))

(declare-fun m!1169175 () Bool)

(assert (=> b!1270166 m!1169175))

(declare-fun m!1169177 () Bool)

(assert (=> start!107242 m!1169177))

(declare-fun m!1169179 () Bool)

(assert (=> start!107242 m!1169179))

(declare-fun m!1169181 () Bool)

(assert (=> start!107242 m!1169181))

(declare-fun m!1169183 () Bool)

(assert (=> mapNonEmpty!50641 m!1169183))

(declare-fun m!1169185 () Bool)

(assert (=> b!1270169 m!1169185))

(check-sat (not b!1270169) (not mapNonEmpty!50641) tp_is_empty!32707 (not b!1270166) (not start!107242))
(check-sat)
