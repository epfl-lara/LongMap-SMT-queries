; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107192 () Bool)

(assert start!107192)

(declare-fun b!1270687 () Bool)

(declare-fun e!724410 () Bool)

(assert (=> b!1270687 (= e!724410 false)))

(declare-fun lt!574580 () Bool)

(declare-datatypes ((array!82933 0))(
  ( (array!82934 (arr!40004 (Array (_ BitVec 32) (_ BitVec 64))) (size!40542 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82933)

(declare-datatypes ((List!28577 0))(
  ( (Nil!28574) (Cons!28573 (h!29782 (_ BitVec 64)) (t!42098 List!28577)) )
))
(declare-fun arrayNoDuplicates!0 (array!82933 (_ BitVec 32) List!28577) Bool)

(assert (=> b!1270687 (= lt!574580 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28574))))

(declare-fun b!1270688 () Bool)

(declare-fun e!724414 () Bool)

(declare-fun tp_is_empty!32881 () Bool)

(assert (=> b!1270688 (= e!724414 tp_is_empty!32881)))

(declare-fun res!845543 () Bool)

(assert (=> start!107192 (=> (not res!845543) (not e!724410))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107192 (= res!845543 (validMask!0 mask!1730))))

(assert (=> start!107192 e!724410))

(declare-datatypes ((V!49035 0))(
  ( (V!49036 (val!16515 Int)) )
))
(declare-datatypes ((ValueCell!15587 0))(
  ( (ValueCellFull!15587 (v!19151 V!49035)) (EmptyCell!15587) )
))
(declare-datatypes ((array!82935 0))(
  ( (array!82936 (arr!40005 (Array (_ BitVec 32) ValueCell!15587)) (size!40543 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82935)

(declare-fun e!724412 () Bool)

(declare-fun array_inv!30591 (array!82935) Bool)

(assert (=> start!107192 (and (array_inv!30591 _values!1134) e!724412)))

(assert (=> start!107192 true))

(declare-fun array_inv!30592 (array!82933) Bool)

(assert (=> start!107192 (array_inv!30592 _keys!1364)))

(declare-fun mapIsEmpty!50902 () Bool)

(declare-fun mapRes!50902 () Bool)

(assert (=> mapIsEmpty!50902 mapRes!50902))

(declare-fun b!1270689 () Bool)

(declare-fun e!724411 () Bool)

(assert (=> b!1270689 (= e!724411 tp_is_empty!32881)))

(declare-fun mapNonEmpty!50902 () Bool)

(declare-fun tp!97244 () Bool)

(assert (=> mapNonEmpty!50902 (= mapRes!50902 (and tp!97244 e!724411))))

(declare-fun mapValue!50902 () ValueCell!15587)

(declare-fun mapKey!50902 () (_ BitVec 32))

(declare-fun mapRest!50902 () (Array (_ BitVec 32) ValueCell!15587))

(assert (=> mapNonEmpty!50902 (= (arr!40005 _values!1134) (store mapRest!50902 mapKey!50902 mapValue!50902))))

(declare-fun b!1270690 () Bool)

(assert (=> b!1270690 (= e!724412 (and e!724414 mapRes!50902))))

(declare-fun condMapEmpty!50902 () Bool)

(declare-fun mapDefault!50902 () ValueCell!15587)

(assert (=> b!1270690 (= condMapEmpty!50902 (= (arr!40005 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15587)) mapDefault!50902)))))

(declare-fun b!1270691 () Bool)

(declare-fun res!845541 () Bool)

(assert (=> b!1270691 (=> (not res!845541) (not e!724410))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270691 (= res!845541 (and (= (size!40543 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40542 _keys!1364) (size!40543 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270692 () Bool)

(declare-fun res!845542 () Bool)

(assert (=> b!1270692 (=> (not res!845542) (not e!724410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82933 (_ BitVec 32)) Bool)

(assert (=> b!1270692 (= res!845542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107192 res!845543) b!1270691))

(assert (= (and b!1270691 res!845541) b!1270692))

(assert (= (and b!1270692 res!845542) b!1270687))

(assert (= (and b!1270690 condMapEmpty!50902) mapIsEmpty!50902))

(assert (= (and b!1270690 (not condMapEmpty!50902)) mapNonEmpty!50902))

(get-info :version)

(assert (= (and mapNonEmpty!50902 ((_ is ValueCellFull!15587) mapValue!50902)) b!1270689))

(assert (= (and b!1270690 ((_ is ValueCellFull!15587) mapDefault!50902)) b!1270688))

(assert (= start!107192 b!1270690))

(declare-fun m!1168431 () Bool)

(assert (=> b!1270687 m!1168431))

(declare-fun m!1168433 () Bool)

(assert (=> start!107192 m!1168433))

(declare-fun m!1168435 () Bool)

(assert (=> start!107192 m!1168435))

(declare-fun m!1168437 () Bool)

(assert (=> start!107192 m!1168437))

(declare-fun m!1168439 () Bool)

(assert (=> mapNonEmpty!50902 m!1168439))

(declare-fun m!1168441 () Bool)

(assert (=> b!1270692 m!1168441))

(check-sat (not b!1270687) tp_is_empty!32881 (not mapNonEmpty!50902) (not b!1270692) (not start!107192))
(check-sat)
