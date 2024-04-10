; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107014 () Bool)

(assert start!107014)

(declare-fun mapNonEmpty!50635 () Bool)

(declare-fun mapRes!50635 () Bool)

(declare-fun tp!96814 () Bool)

(declare-fun e!723105 () Bool)

(assert (=> mapNonEmpty!50635 (= mapRes!50635 (and tp!96814 e!723105))))

(declare-datatypes ((V!48797 0))(
  ( (V!48798 (val!16426 Int)) )
))
(declare-datatypes ((ValueCell!15498 0))(
  ( (ValueCellFull!15498 (v!19063 V!48797)) (EmptyCell!15498) )
))
(declare-datatypes ((array!82676 0))(
  ( (array!82677 (arr!39875 (Array (_ BitVec 32) ValueCell!15498)) (size!40411 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82676)

(declare-fun mapKey!50635 () (_ BitVec 32))

(declare-fun mapValue!50635 () ValueCell!15498)

(declare-fun mapRest!50635 () (Array (_ BitVec 32) ValueCell!15498))

(assert (=> mapNonEmpty!50635 (= (arr!39875 _values!1134) (store mapRest!50635 mapKey!50635 mapValue!50635))))

(declare-fun b!1268825 () Bool)

(declare-fun e!723106 () Bool)

(declare-fun e!723104 () Bool)

(assert (=> b!1268825 (= e!723106 (and e!723104 mapRes!50635))))

(declare-fun condMapEmpty!50635 () Bool)

(declare-fun mapDefault!50635 () ValueCell!15498)

(assert (=> b!1268825 (= condMapEmpty!50635 (= (arr!39875 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15498)) mapDefault!50635)))))

(declare-fun mapIsEmpty!50635 () Bool)

(assert (=> mapIsEmpty!50635 mapRes!50635))

(declare-fun b!1268826 () Bool)

(declare-fun e!723107 () Bool)

(assert (=> b!1268826 (= e!723107 false)))

(declare-fun lt!574491 () Bool)

(declare-datatypes ((array!82678 0))(
  ( (array!82679 (arr!39876 (Array (_ BitVec 32) (_ BitVec 64))) (size!40412 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82678)

(declare-datatypes ((List!28396 0))(
  ( (Nil!28393) (Cons!28392 (h!29601 (_ BitVec 64)) (t!41925 List!28396)) )
))
(declare-fun arrayNoDuplicates!0 (array!82678 (_ BitVec 32) List!28396) Bool)

(assert (=> b!1268826 (= lt!574491 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28393))))

(declare-fun b!1268827 () Bool)

(declare-fun tp_is_empty!32703 () Bool)

(assert (=> b!1268827 (= e!723104 tp_is_empty!32703)))

(declare-fun b!1268828 () Bool)

(declare-fun res!844445 () Bool)

(assert (=> b!1268828 (=> (not res!844445) (not e!723107))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82678 (_ BitVec 32)) Bool)

(assert (=> b!1268828 (= res!844445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!844443 () Bool)

(assert (=> start!107014 (=> (not res!844443) (not e!723107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107014 (= res!844443 (validMask!0 mask!1730))))

(assert (=> start!107014 e!723107))

(declare-fun array_inv!30341 (array!82676) Bool)

(assert (=> start!107014 (and (array_inv!30341 _values!1134) e!723106)))

(assert (=> start!107014 true))

(declare-fun array_inv!30342 (array!82678) Bool)

(assert (=> start!107014 (array_inv!30342 _keys!1364)))

(declare-fun b!1268829 () Bool)

(declare-fun res!844444 () Bool)

(assert (=> b!1268829 (=> (not res!844444) (not e!723107))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268829 (= res!844444 (and (= (size!40411 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40412 _keys!1364) (size!40411 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268830 () Bool)

(assert (=> b!1268830 (= e!723105 tp_is_empty!32703)))

(assert (= (and start!107014 res!844443) b!1268829))

(assert (= (and b!1268829 res!844444) b!1268828))

(assert (= (and b!1268828 res!844445) b!1268826))

(assert (= (and b!1268825 condMapEmpty!50635) mapIsEmpty!50635))

(assert (= (and b!1268825 (not condMapEmpty!50635)) mapNonEmpty!50635))

(get-info :version)

(assert (= (and mapNonEmpty!50635 ((_ is ValueCellFull!15498) mapValue!50635)) b!1268830))

(assert (= (and b!1268825 ((_ is ValueCellFull!15498) mapDefault!50635)) b!1268827))

(assert (= start!107014 b!1268825))

(declare-fun m!1167539 () Bool)

(assert (=> mapNonEmpty!50635 m!1167539))

(declare-fun m!1167541 () Bool)

(assert (=> b!1268826 m!1167541))

(declare-fun m!1167543 () Bool)

(assert (=> b!1268828 m!1167543))

(declare-fun m!1167545 () Bool)

(assert (=> start!107014 m!1167545))

(declare-fun m!1167547 () Bool)

(assert (=> start!107014 m!1167547))

(declare-fun m!1167549 () Bool)

(assert (=> start!107014 m!1167549))

(check-sat tp_is_empty!32703 (not mapNonEmpty!50635) (not start!107014) (not b!1268828) (not b!1268826))
(check-sat)
