; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104636 () Bool)

(assert start!104636)

(declare-fun mapIsEmpty!48808 () Bool)

(declare-fun mapRes!48808 () Bool)

(assert (=> mapIsEmpty!48808 mapRes!48808))

(declare-fun b!1247619 () Bool)

(declare-fun res!832459 () Bool)

(declare-fun e!707838 () Bool)

(assert (=> b!1247619 (=> (not res!832459) (not e!707838))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80351 0))(
  ( (array!80352 (arr!38745 (Array (_ BitVec 32) (_ BitVec 64))) (size!39283 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80351)

(declare-datatypes ((V!47191 0))(
  ( (V!47192 (val!15747 Int)) )
))
(declare-datatypes ((ValueCell!14921 0))(
  ( (ValueCellFull!14921 (v!18442 V!47191)) (EmptyCell!14921) )
))
(declare-datatypes ((array!80353 0))(
  ( (array!80354 (arr!38746 (Array (_ BitVec 32) ValueCell!14921)) (size!39284 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80353)

(assert (=> b!1247619 (= res!832459 (and (= (size!39284 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39283 _keys!1118) (size!39284 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247620 () Bool)

(declare-fun e!707839 () Bool)

(declare-fun tp_is_empty!31369 () Bool)

(assert (=> b!1247620 (= e!707839 tp_is_empty!31369)))

(declare-fun res!832460 () Bool)

(assert (=> start!104636 (=> (not res!832460) (not e!707838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104636 (= res!832460 (validMask!0 mask!1466))))

(assert (=> start!104636 e!707838))

(assert (=> start!104636 true))

(declare-fun array_inv!29707 (array!80351) Bool)

(assert (=> start!104636 (array_inv!29707 _keys!1118)))

(declare-fun e!707840 () Bool)

(declare-fun array_inv!29708 (array!80353) Bool)

(assert (=> start!104636 (and (array_inv!29708 _values!914) e!707840)))

(declare-fun b!1247621 () Bool)

(declare-fun e!707841 () Bool)

(assert (=> b!1247621 (= e!707841 tp_is_empty!31369)))

(declare-fun b!1247622 () Bool)

(assert (=> b!1247622 (= e!707838 false)))

(declare-fun lt!563126 () Bool)

(declare-datatypes ((List!27600 0))(
  ( (Nil!27597) (Cons!27596 (h!28805 (_ BitVec 64)) (t!41060 List!27600)) )
))
(declare-fun arrayNoDuplicates!0 (array!80351 (_ BitVec 32) List!27600) Bool)

(assert (=> b!1247622 (= lt!563126 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27597))))

(declare-fun mapNonEmpty!48808 () Bool)

(declare-fun tp!92909 () Bool)

(assert (=> mapNonEmpty!48808 (= mapRes!48808 (and tp!92909 e!707839))))

(declare-fun mapRest!48808 () (Array (_ BitVec 32) ValueCell!14921))

(declare-fun mapValue!48808 () ValueCell!14921)

(declare-fun mapKey!48808 () (_ BitVec 32))

(assert (=> mapNonEmpty!48808 (= (arr!38746 _values!914) (store mapRest!48808 mapKey!48808 mapValue!48808))))

(declare-fun b!1247623 () Bool)

(assert (=> b!1247623 (= e!707840 (and e!707841 mapRes!48808))))

(declare-fun condMapEmpty!48808 () Bool)

(declare-fun mapDefault!48808 () ValueCell!14921)

(assert (=> b!1247623 (= condMapEmpty!48808 (= (arr!38746 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14921)) mapDefault!48808)))))

(declare-fun b!1247624 () Bool)

(declare-fun res!832458 () Bool)

(assert (=> b!1247624 (=> (not res!832458) (not e!707838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80351 (_ BitVec 32)) Bool)

(assert (=> b!1247624 (= res!832458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104636 res!832460) b!1247619))

(assert (= (and b!1247619 res!832459) b!1247624))

(assert (= (and b!1247624 res!832458) b!1247622))

(assert (= (and b!1247623 condMapEmpty!48808) mapIsEmpty!48808))

(assert (= (and b!1247623 (not condMapEmpty!48808)) mapNonEmpty!48808))

(get-info :version)

(assert (= (and mapNonEmpty!48808 ((_ is ValueCellFull!14921) mapValue!48808)) b!1247620))

(assert (= (and b!1247623 ((_ is ValueCellFull!14921) mapDefault!48808)) b!1247621))

(assert (= start!104636 b!1247623))

(declare-fun m!1148603 () Bool)

(assert (=> start!104636 m!1148603))

(declare-fun m!1148605 () Bool)

(assert (=> start!104636 m!1148605))

(declare-fun m!1148607 () Bool)

(assert (=> start!104636 m!1148607))

(declare-fun m!1148609 () Bool)

(assert (=> b!1247622 m!1148609))

(declare-fun m!1148611 () Bool)

(assert (=> mapNonEmpty!48808 m!1148611))

(declare-fun m!1148613 () Bool)

(assert (=> b!1247624 m!1148613))

(check-sat (not b!1247624) tp_is_empty!31369 (not mapNonEmpty!48808) (not b!1247622) (not start!104636))
(check-sat)
