; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106892 () Bool)

(assert start!106892)

(declare-fun mapNonEmpty!50503 () Bool)

(declare-fun mapRes!50503 () Bool)

(declare-fun tp!96682 () Bool)

(declare-fun e!722425 () Bool)

(assert (=> mapNonEmpty!50503 (= mapRes!50503 (and tp!96682 e!722425))))

(declare-datatypes ((V!48693 0))(
  ( (V!48694 (val!16387 Int)) )
))
(declare-datatypes ((ValueCell!15459 0))(
  ( (ValueCellFull!15459 (v!19023 V!48693)) (EmptyCell!15459) )
))
(declare-datatypes ((array!82516 0))(
  ( (array!82517 (arr!39800 (Array (_ BitVec 32) ValueCell!15459)) (size!40336 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82516)

(declare-fun mapRest!50503 () (Array (_ BitVec 32) ValueCell!15459))

(declare-fun mapValue!50503 () ValueCell!15459)

(declare-fun mapKey!50503 () (_ BitVec 32))

(assert (=> mapNonEmpty!50503 (= (arr!39800 _values!1134) (store mapRest!50503 mapKey!50503 mapValue!50503))))

(declare-fun mapIsEmpty!50503 () Bool)

(assert (=> mapIsEmpty!50503 mapRes!50503))

(declare-fun b!1268005 () Bool)

(declare-fun e!722427 () Bool)

(declare-fun e!722426 () Bool)

(assert (=> b!1268005 (= e!722427 (and e!722426 mapRes!50503))))

(declare-fun condMapEmpty!50503 () Bool)

(declare-fun mapDefault!50503 () ValueCell!15459)

(assert (=> b!1268005 (= condMapEmpty!50503 (= (arr!39800 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15459)) mapDefault!50503)))))

(declare-fun b!1268006 () Bool)

(declare-fun tp_is_empty!32625 () Bool)

(assert (=> b!1268006 (= e!722425 tp_is_empty!32625)))

(declare-fun res!844038 () Bool)

(declare-fun e!722428 () Bool)

(assert (=> start!106892 (=> (not res!844038) (not e!722428))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106892 (= res!844038 (validMask!0 mask!1730))))

(assert (=> start!106892 e!722428))

(declare-fun array_inv!30289 (array!82516) Bool)

(assert (=> start!106892 (and (array_inv!30289 _values!1134) e!722427)))

(assert (=> start!106892 true))

(declare-datatypes ((array!82518 0))(
  ( (array!82519 (arr!39801 (Array (_ BitVec 32) (_ BitVec 64))) (size!40337 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82518)

(declare-fun array_inv!30290 (array!82518) Bool)

(assert (=> start!106892 (array_inv!30290 _keys!1364)))

(declare-fun b!1268007 () Bool)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268007 (= e!722428 (and (= (size!40336 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40337 _keys!1364) (size!40336 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011) (not (= (size!40337 _keys!1364) (bvadd #b00000000000000000000000000000001 mask!1730)))))))

(declare-fun b!1268008 () Bool)

(assert (=> b!1268008 (= e!722426 tp_is_empty!32625)))

(assert (= (and start!106892 res!844038) b!1268007))

(assert (= (and b!1268005 condMapEmpty!50503) mapIsEmpty!50503))

(assert (= (and b!1268005 (not condMapEmpty!50503)) mapNonEmpty!50503))

(get-info :version)

(assert (= (and mapNonEmpty!50503 ((_ is ValueCellFull!15459) mapValue!50503)) b!1268006))

(assert (= (and b!1268005 ((_ is ValueCellFull!15459) mapDefault!50503)) b!1268008))

(assert (= start!106892 b!1268005))

(declare-fun m!1167015 () Bool)

(assert (=> mapNonEmpty!50503 m!1167015))

(declare-fun m!1167017 () Bool)

(assert (=> start!106892 m!1167017))

(declare-fun m!1167019 () Bool)

(assert (=> start!106892 m!1167019))

(declare-fun m!1167021 () Bool)

(assert (=> start!106892 m!1167021))

(check-sat (not start!106892) (not mapNonEmpty!50503) tp_is_empty!32625)
(check-sat)
