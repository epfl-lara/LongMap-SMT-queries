; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107018 () Bool)

(assert start!107018)

(declare-fun b!1268797 () Bool)

(declare-fun e!723105 () Bool)

(declare-fun tp_is_empty!32707 () Bool)

(assert (=> b!1268797 (= e!723105 tp_is_empty!32707)))

(declare-fun b!1268798 () Bool)

(declare-fun e!723108 () Bool)

(assert (=> b!1268798 (= e!723108 false)))

(declare-fun lt!574319 () Bool)

(declare-datatypes ((array!82603 0))(
  ( (array!82604 (arr!39839 (Array (_ BitVec 32) (_ BitVec 64))) (size!40377 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82603)

(declare-datatypes ((List!28483 0))(
  ( (Nil!28480) (Cons!28479 (h!29688 (_ BitVec 64)) (t!42004 List!28483)) )
))
(declare-fun arrayNoDuplicates!0 (array!82603 (_ BitVec 32) List!28483) Bool)

(assert (=> b!1268798 (= lt!574319 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28480))))

(declare-fun mapNonEmpty!50641 () Bool)

(declare-fun mapRes!50641 () Bool)

(declare-fun tp!96821 () Bool)

(assert (=> mapNonEmpty!50641 (= mapRes!50641 (and tp!96821 e!723105))))

(declare-datatypes ((V!48803 0))(
  ( (V!48804 (val!16428 Int)) )
))
(declare-datatypes ((ValueCell!15500 0))(
  ( (ValueCellFull!15500 (v!19064 V!48803)) (EmptyCell!15500) )
))
(declare-datatypes ((array!82605 0))(
  ( (array!82606 (arr!39840 (Array (_ BitVec 32) ValueCell!15500)) (size!40378 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82605)

(declare-fun mapRest!50641 () (Array (_ BitVec 32) ValueCell!15500))

(declare-fun mapValue!50641 () ValueCell!15500)

(declare-fun mapKey!50641 () (_ BitVec 32))

(assert (=> mapNonEmpty!50641 (= (arr!39840 _values!1134) (store mapRest!50641 mapKey!50641 mapValue!50641))))

(declare-fun b!1268799 () Bool)

(declare-fun e!723107 () Bool)

(declare-fun e!723109 () Bool)

(assert (=> b!1268799 (= e!723107 (and e!723109 mapRes!50641))))

(declare-fun condMapEmpty!50641 () Bool)

(declare-fun mapDefault!50641 () ValueCell!15500)

(assert (=> b!1268799 (= condMapEmpty!50641 (= (arr!39840 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15500)) mapDefault!50641)))))

(declare-fun res!844436 () Bool)

(assert (=> start!107018 (=> (not res!844436) (not e!723108))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107018 (= res!844436 (validMask!0 mask!1730))))

(assert (=> start!107018 e!723108))

(declare-fun array_inv!30481 (array!82605) Bool)

(assert (=> start!107018 (and (array_inv!30481 _values!1134) e!723107)))

(assert (=> start!107018 true))

(declare-fun array_inv!30482 (array!82603) Bool)

(assert (=> start!107018 (array_inv!30482 _keys!1364)))

(declare-fun b!1268800 () Bool)

(assert (=> b!1268800 (= e!723109 tp_is_empty!32707)))

(declare-fun b!1268801 () Bool)

(declare-fun res!844434 () Bool)

(assert (=> b!1268801 (=> (not res!844434) (not e!723108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82603 (_ BitVec 32)) Bool)

(assert (=> b!1268801 (= res!844434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268802 () Bool)

(declare-fun res!844435 () Bool)

(assert (=> b!1268802 (=> (not res!844435) (not e!723108))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268802 (= res!844435 (and (= (size!40378 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40377 _keys!1364) (size!40378 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50641 () Bool)

(assert (=> mapIsEmpty!50641 mapRes!50641))

(assert (= (and start!107018 res!844436) b!1268802))

(assert (= (and b!1268802 res!844435) b!1268801))

(assert (= (and b!1268801 res!844434) b!1268798))

(assert (= (and b!1268799 condMapEmpty!50641) mapIsEmpty!50641))

(assert (= (and b!1268799 (not condMapEmpty!50641)) mapNonEmpty!50641))

(get-info :version)

(assert (= (and mapNonEmpty!50641 ((_ is ValueCellFull!15500) mapValue!50641)) b!1268797))

(assert (= (and b!1268799 ((_ is ValueCellFull!15500) mapDefault!50641)) b!1268800))

(assert (= start!107018 b!1268799))

(declare-fun m!1167063 () Bool)

(assert (=> b!1268798 m!1167063))

(declare-fun m!1167065 () Bool)

(assert (=> mapNonEmpty!50641 m!1167065))

(declare-fun m!1167067 () Bool)

(assert (=> start!107018 m!1167067))

(declare-fun m!1167069 () Bool)

(assert (=> start!107018 m!1167069))

(declare-fun m!1167071 () Bool)

(assert (=> start!107018 m!1167071))

(declare-fun m!1167073 () Bool)

(assert (=> b!1268801 m!1167073))

(check-sat (not start!107018) (not b!1268801) tp_is_empty!32707 (not b!1268798) (not mapNonEmpty!50641))
(check-sat)
