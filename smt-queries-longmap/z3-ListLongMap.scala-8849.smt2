; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107542 () Bool)

(assert start!107542)

(declare-fun b!1273192 () Bool)

(declare-fun res!846659 () Bool)

(declare-fun e!726235 () Bool)

(assert (=> b!1273192 (=> (not res!846659) (not e!726235))))

(declare-datatypes ((V!49203 0))(
  ( (V!49204 (val!16578 Int)) )
))
(declare-datatypes ((ValueCell!15650 0))(
  ( (ValueCellFull!15650 (v!19210 V!49203)) (EmptyCell!15650) )
))
(declare-datatypes ((array!83279 0))(
  ( (array!83280 (arr!40172 (Array (_ BitVec 32) ValueCell!15650)) (size!40709 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83279)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83281 0))(
  ( (array!83282 (arr!40173 (Array (_ BitVec 32) (_ BitVec 64))) (size!40710 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83281)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1273192 (= res!846659 (and (= (size!40709 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40710 _keys!1364) (size!40709 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!846658 () Bool)

(assert (=> start!107542 (=> (not res!846658) (not e!726235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107542 (= res!846658 (validMask!0 mask!1730))))

(assert (=> start!107542 e!726235))

(declare-fun e!726231 () Bool)

(declare-fun array_inv!30719 (array!83279) Bool)

(assert (=> start!107542 (and (array_inv!30719 _values!1134) e!726231)))

(assert (=> start!107542 true))

(declare-fun array_inv!30720 (array!83281) Bool)

(assert (=> start!107542 (array_inv!30720 _keys!1364)))

(declare-fun b!1273193 () Bool)

(declare-fun e!726232 () Bool)

(declare-fun mapRes!51091 () Bool)

(assert (=> b!1273193 (= e!726231 (and e!726232 mapRes!51091))))

(declare-fun condMapEmpty!51091 () Bool)

(declare-fun mapDefault!51091 () ValueCell!15650)

(assert (=> b!1273193 (= condMapEmpty!51091 (= (arr!40172 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15650)) mapDefault!51091)))))

(declare-fun mapIsEmpty!51091 () Bool)

(assert (=> mapIsEmpty!51091 mapRes!51091))

(declare-fun b!1273194 () Bool)

(declare-fun tp_is_empty!33007 () Bool)

(assert (=> b!1273194 (= e!726232 tp_is_empty!33007)))

(declare-fun b!1273195 () Bool)

(declare-fun res!846660 () Bool)

(assert (=> b!1273195 (=> (not res!846660) (not e!726235))))

(declare-datatypes ((List!28569 0))(
  ( (Nil!28566) (Cons!28565 (h!29783 (_ BitVec 64)) (t!42090 List!28569)) )
))
(declare-fun arrayNoDuplicates!0 (array!83281 (_ BitVec 32) List!28569) Bool)

(assert (=> b!1273195 (= res!846660 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28566))))

(declare-fun b!1273196 () Bool)

(declare-fun e!726234 () Bool)

(assert (=> b!1273196 (= e!726234 tp_is_empty!33007)))

(declare-fun b!1273197 () Bool)

(declare-fun res!846657 () Bool)

(assert (=> b!1273197 (=> (not res!846657) (not e!726235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83281 (_ BitVec 32)) Bool)

(assert (=> b!1273197 (= res!846657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1273198 () Bool)

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1273198 (= e!726235 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40710 _keys!1364)) (bvslt from!1698 (size!40710 _keys!1364)) (bvslt (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!51091 () Bool)

(declare-fun tp!97432 () Bool)

(assert (=> mapNonEmpty!51091 (= mapRes!51091 (and tp!97432 e!726234))))

(declare-fun mapKey!51091 () (_ BitVec 32))

(declare-fun mapValue!51091 () ValueCell!15650)

(declare-fun mapRest!51091 () (Array (_ BitVec 32) ValueCell!15650))

(assert (=> mapNonEmpty!51091 (= (arr!40172 _values!1134) (store mapRest!51091 mapKey!51091 mapValue!51091))))

(assert (= (and start!107542 res!846658) b!1273192))

(assert (= (and b!1273192 res!846659) b!1273197))

(assert (= (and b!1273197 res!846657) b!1273195))

(assert (= (and b!1273195 res!846660) b!1273198))

(assert (= (and b!1273193 condMapEmpty!51091) mapIsEmpty!51091))

(assert (= (and b!1273193 (not condMapEmpty!51091)) mapNonEmpty!51091))

(get-info :version)

(assert (= (and mapNonEmpty!51091 ((_ is ValueCellFull!15650) mapValue!51091)) b!1273196))

(assert (= (and b!1273193 ((_ is ValueCellFull!15650) mapDefault!51091)) b!1273194))

(assert (= start!107542 b!1273193))

(declare-fun m!1171299 () Bool)

(assert (=> start!107542 m!1171299))

(declare-fun m!1171301 () Bool)

(assert (=> start!107542 m!1171301))

(declare-fun m!1171303 () Bool)

(assert (=> start!107542 m!1171303))

(declare-fun m!1171305 () Bool)

(assert (=> b!1273195 m!1171305))

(declare-fun m!1171307 () Bool)

(assert (=> b!1273197 m!1171307))

(declare-fun m!1171309 () Bool)

(assert (=> mapNonEmpty!51091 m!1171309))

(check-sat (not mapNonEmpty!51091) (not b!1273197) (not start!107542) tp_is_empty!33007 (not b!1273195))
(check-sat)
