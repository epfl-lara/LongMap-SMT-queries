; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107026 () Bool)

(assert start!107026)

(declare-fun b!1268933 () Bool)

(declare-fun e!723195 () Bool)

(assert (=> b!1268933 (= e!723195 false)))

(declare-fun lt!574509 () Bool)

(declare-datatypes ((array!82698 0))(
  ( (array!82699 (arr!39886 (Array (_ BitVec 32) (_ BitVec 64))) (size!40422 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82698)

(declare-datatypes ((List!28401 0))(
  ( (Nil!28398) (Cons!28397 (h!29606 (_ BitVec 64)) (t!41930 List!28401)) )
))
(declare-fun arrayNoDuplicates!0 (array!82698 (_ BitVec 32) List!28401) Bool)

(assert (=> b!1268933 (= lt!574509 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28398))))

(declare-fun res!844497 () Bool)

(assert (=> start!107026 (=> (not res!844497) (not e!723195))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107026 (= res!844497 (validMask!0 mask!1730))))

(assert (=> start!107026 e!723195))

(declare-datatypes ((V!48813 0))(
  ( (V!48814 (val!16432 Int)) )
))
(declare-datatypes ((ValueCell!15504 0))(
  ( (ValueCellFull!15504 (v!19069 V!48813)) (EmptyCell!15504) )
))
(declare-datatypes ((array!82700 0))(
  ( (array!82701 (arr!39887 (Array (_ BitVec 32) ValueCell!15504)) (size!40423 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82700)

(declare-fun e!723194 () Bool)

(declare-fun array_inv!30349 (array!82700) Bool)

(assert (=> start!107026 (and (array_inv!30349 _values!1134) e!723194)))

(assert (=> start!107026 true))

(declare-fun array_inv!30350 (array!82698) Bool)

(assert (=> start!107026 (array_inv!30350 _keys!1364)))

(declare-fun b!1268934 () Bool)

(declare-fun res!844498 () Bool)

(assert (=> b!1268934 (=> (not res!844498) (not e!723195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82698 (_ BitVec 32)) Bool)

(assert (=> b!1268934 (= res!844498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268935 () Bool)

(declare-fun e!723198 () Bool)

(declare-fun tp_is_empty!32715 () Bool)

(assert (=> b!1268935 (= e!723198 tp_is_empty!32715)))

(declare-fun b!1268936 () Bool)

(declare-fun mapRes!50653 () Bool)

(assert (=> b!1268936 (= e!723194 (and e!723198 mapRes!50653))))

(declare-fun condMapEmpty!50653 () Bool)

(declare-fun mapDefault!50653 () ValueCell!15504)

(assert (=> b!1268936 (= condMapEmpty!50653 (= (arr!39887 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15504)) mapDefault!50653)))))

(declare-fun b!1268937 () Bool)

(declare-fun e!723196 () Bool)

(assert (=> b!1268937 (= e!723196 tp_is_empty!32715)))

(declare-fun b!1268938 () Bool)

(declare-fun res!844499 () Bool)

(assert (=> b!1268938 (=> (not res!844499) (not e!723195))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268938 (= res!844499 (and (= (size!40423 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40422 _keys!1364) (size!40423 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50653 () Bool)

(assert (=> mapIsEmpty!50653 mapRes!50653))

(declare-fun mapNonEmpty!50653 () Bool)

(declare-fun tp!96832 () Bool)

(assert (=> mapNonEmpty!50653 (= mapRes!50653 (and tp!96832 e!723196))))

(declare-fun mapRest!50653 () (Array (_ BitVec 32) ValueCell!15504))

(declare-fun mapKey!50653 () (_ BitVec 32))

(declare-fun mapValue!50653 () ValueCell!15504)

(assert (=> mapNonEmpty!50653 (= (arr!39887 _values!1134) (store mapRest!50653 mapKey!50653 mapValue!50653))))

(assert (= (and start!107026 res!844497) b!1268938))

(assert (= (and b!1268938 res!844499) b!1268934))

(assert (= (and b!1268934 res!844498) b!1268933))

(assert (= (and b!1268936 condMapEmpty!50653) mapIsEmpty!50653))

(assert (= (and b!1268936 (not condMapEmpty!50653)) mapNonEmpty!50653))

(get-info :version)

(assert (= (and mapNonEmpty!50653 ((_ is ValueCellFull!15504) mapValue!50653)) b!1268937))

(assert (= (and b!1268936 ((_ is ValueCellFull!15504) mapDefault!50653)) b!1268935))

(assert (= start!107026 b!1268936))

(declare-fun m!1167611 () Bool)

(assert (=> b!1268933 m!1167611))

(declare-fun m!1167613 () Bool)

(assert (=> start!107026 m!1167613))

(declare-fun m!1167615 () Bool)

(assert (=> start!107026 m!1167615))

(declare-fun m!1167617 () Bool)

(assert (=> start!107026 m!1167617))

(declare-fun m!1167619 () Bool)

(assert (=> b!1268934 m!1167619))

(declare-fun m!1167621 () Bool)

(assert (=> mapNonEmpty!50653 m!1167621))

(check-sat (not start!107026) (not b!1268933) tp_is_empty!32715 (not b!1268934) (not mapNonEmpty!50653))
(check-sat)
