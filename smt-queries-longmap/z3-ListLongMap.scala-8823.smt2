; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107386 () Bool)

(assert start!107386)

(declare-fun res!845954 () Bool)

(declare-fun e!725062 () Bool)

(assert (=> start!107386 (=> (not res!845954) (not e!725062))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107386 (= res!845954 (validMask!0 mask!1730))))

(assert (=> start!107386 e!725062))

(declare-datatypes ((V!48995 0))(
  ( (V!48996 (val!16500 Int)) )
))
(declare-datatypes ((ValueCell!15572 0))(
  ( (ValueCellFull!15572 (v!19132 V!48995)) (EmptyCell!15572) )
))
(declare-datatypes ((array!82993 0))(
  ( (array!82994 (arr!40029 (Array (_ BitVec 32) ValueCell!15572)) (size!40566 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82993)

(declare-fun e!725063 () Bool)

(declare-fun array_inv!30621 (array!82993) Bool)

(assert (=> start!107386 (and (array_inv!30621 _values!1134) e!725063)))

(assert (=> start!107386 true))

(declare-datatypes ((array!82995 0))(
  ( (array!82996 (arr!40030 (Array (_ BitVec 32) (_ BitVec 64))) (size!40567 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82995)

(declare-fun array_inv!30622 (array!82995) Bool)

(assert (=> start!107386 (array_inv!30622 _keys!1364)))

(declare-fun b!1271786 () Bool)

(declare-fun res!845955 () Bool)

(assert (=> b!1271786 (=> (not res!845955) (not e!725062))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271786 (= res!845955 (and (= (size!40566 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40567 _keys!1364) (size!40566 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50857 () Bool)

(declare-fun mapRes!50857 () Bool)

(assert (=> mapIsEmpty!50857 mapRes!50857))

(declare-fun b!1271787 () Bool)

(declare-fun res!845953 () Bool)

(assert (=> b!1271787 (=> (not res!845953) (not e!725062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82995 (_ BitVec 32)) Bool)

(assert (=> b!1271787 (= res!845953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50857 () Bool)

(declare-fun tp!97198 () Bool)

(declare-fun e!725064 () Bool)

(assert (=> mapNonEmpty!50857 (= mapRes!50857 (and tp!97198 e!725064))))

(declare-fun mapValue!50857 () ValueCell!15572)

(declare-fun mapKey!50857 () (_ BitVec 32))

(declare-fun mapRest!50857 () (Array (_ BitVec 32) ValueCell!15572))

(assert (=> mapNonEmpty!50857 (= (arr!40029 _values!1134) (store mapRest!50857 mapKey!50857 mapValue!50857))))

(declare-fun b!1271788 () Bool)

(declare-fun e!725065 () Bool)

(assert (=> b!1271788 (= e!725063 (and e!725065 mapRes!50857))))

(declare-fun condMapEmpty!50857 () Bool)

(declare-fun mapDefault!50857 () ValueCell!15572)

(assert (=> b!1271788 (= condMapEmpty!50857 (= (arr!40029 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15572)) mapDefault!50857)))))

(declare-fun b!1271789 () Bool)

(assert (=> b!1271789 (= e!725062 false)))

(declare-fun lt!575197 () Bool)

(declare-datatypes ((List!28522 0))(
  ( (Nil!28519) (Cons!28518 (h!29736 (_ BitVec 64)) (t!42043 List!28522)) )
))
(declare-fun arrayNoDuplicates!0 (array!82995 (_ BitVec 32) List!28522) Bool)

(assert (=> b!1271789 (= lt!575197 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28519))))

(declare-fun b!1271790 () Bool)

(declare-fun tp_is_empty!32851 () Bool)

(assert (=> b!1271790 (= e!725065 tp_is_empty!32851)))

(declare-fun b!1271791 () Bool)

(assert (=> b!1271791 (= e!725064 tp_is_empty!32851)))

(assert (= (and start!107386 res!845954) b!1271786))

(assert (= (and b!1271786 res!845955) b!1271787))

(assert (= (and b!1271787 res!845953) b!1271789))

(assert (= (and b!1271788 condMapEmpty!50857) mapIsEmpty!50857))

(assert (= (and b!1271788 (not condMapEmpty!50857)) mapNonEmpty!50857))

(get-info :version)

(assert (= (and mapNonEmpty!50857 ((_ is ValueCellFull!15572) mapValue!50857)) b!1271791))

(assert (= (and b!1271788 ((_ is ValueCellFull!15572) mapDefault!50857)) b!1271790))

(assert (= start!107386 b!1271788))

(declare-fun m!1170363 () Bool)

(assert (=> start!107386 m!1170363))

(declare-fun m!1170365 () Bool)

(assert (=> start!107386 m!1170365))

(declare-fun m!1170367 () Bool)

(assert (=> start!107386 m!1170367))

(declare-fun m!1170369 () Bool)

(assert (=> b!1271787 m!1170369))

(declare-fun m!1170371 () Bool)

(assert (=> mapNonEmpty!50857 m!1170371))

(declare-fun m!1170373 () Bool)

(assert (=> b!1271789 m!1170373))

(check-sat (not b!1271789) (not mapNonEmpty!50857) tp_is_empty!32851 (not b!1271787) (not start!107386))
(check-sat)
