; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84262 () Bool)

(assert start!84262)

(declare-fun mapNonEmpty!36653 () Bool)

(declare-fun mapRes!36653 () Bool)

(declare-fun tp!69509 () Bool)

(declare-fun e!555686 () Bool)

(assert (=> mapNonEmpty!36653 (= mapRes!36653 (and tp!69509 e!555686))))

(declare-datatypes ((V!35761 0))(
  ( (V!35762 (val!11592 Int)) )
))
(declare-datatypes ((ValueCell!11060 0))(
  ( (ValueCellFull!11060 (v!14153 V!35761)) (EmptyCell!11060) )
))
(declare-datatypes ((array!62068 0))(
  ( (array!62069 (arr!29892 (Array (_ BitVec 32) ValueCell!11060)) (size!30373 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62068)

(declare-fun mapKey!36653 () (_ BitVec 32))

(declare-fun mapRest!36653 () (Array (_ BitVec 32) ValueCell!11060))

(declare-fun mapValue!36653 () ValueCell!11060)

(assert (=> mapNonEmpty!36653 (= (arr!29892 _values!1278) (store mapRest!36653 mapKey!36653 mapValue!36653))))

(declare-fun b!985754 () Bool)

(declare-fun res!659644 () Bool)

(declare-fun e!555685 () Bool)

(assert (=> b!985754 (=> (not res!659644) (not e!555685))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62070 0))(
  ( (array!62071 (arr!29893 (Array (_ BitVec 32) (_ BitVec 64))) (size!30374 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62070)

(assert (=> b!985754 (= res!659644 (and (= (size!30373 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30374 _keys!1544) (size!30373 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36653 () Bool)

(assert (=> mapIsEmpty!36653 mapRes!36653))

(declare-fun b!985755 () Bool)

(assert (=> b!985755 (= e!555685 false)))

(declare-fun lt!437184 () Bool)

(declare-datatypes ((List!20761 0))(
  ( (Nil!20758) (Cons!20757 (h!21919 (_ BitVec 64)) (t!29651 List!20761)) )
))
(declare-fun arrayNoDuplicates!0 (array!62070 (_ BitVec 32) List!20761) Bool)

(assert (=> b!985755 (= lt!437184 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20758))))

(declare-fun b!985756 () Bool)

(declare-fun res!659645 () Bool)

(assert (=> b!985756 (=> (not res!659645) (not e!555685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62070 (_ BitVec 32)) Bool)

(assert (=> b!985756 (= res!659645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985757 () Bool)

(declare-fun e!555688 () Bool)

(declare-fun e!555689 () Bool)

(assert (=> b!985757 (= e!555688 (and e!555689 mapRes!36653))))

(declare-fun condMapEmpty!36653 () Bool)

(declare-fun mapDefault!36653 () ValueCell!11060)

(assert (=> b!985757 (= condMapEmpty!36653 (= (arr!29892 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11060)) mapDefault!36653)))))

(declare-fun res!659646 () Bool)

(assert (=> start!84262 (=> (not res!659646) (not e!555685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84262 (= res!659646 (validMask!0 mask!1948))))

(assert (=> start!84262 e!555685))

(assert (=> start!84262 true))

(declare-fun array_inv!23111 (array!62068) Bool)

(assert (=> start!84262 (and (array_inv!23111 _values!1278) e!555688)))

(declare-fun array_inv!23112 (array!62070) Bool)

(assert (=> start!84262 (array_inv!23112 _keys!1544)))

(declare-fun b!985758 () Bool)

(declare-fun tp_is_empty!23083 () Bool)

(assert (=> b!985758 (= e!555689 tp_is_empty!23083)))

(declare-fun b!985759 () Bool)

(assert (=> b!985759 (= e!555686 tp_is_empty!23083)))

(assert (= (and start!84262 res!659646) b!985754))

(assert (= (and b!985754 res!659644) b!985756))

(assert (= (and b!985756 res!659645) b!985755))

(assert (= (and b!985757 condMapEmpty!36653) mapIsEmpty!36653))

(assert (= (and b!985757 (not condMapEmpty!36653)) mapNonEmpty!36653))

(get-info :version)

(assert (= (and mapNonEmpty!36653 ((_ is ValueCellFull!11060) mapValue!36653)) b!985759))

(assert (= (and b!985757 ((_ is ValueCellFull!11060) mapDefault!36653)) b!985758))

(assert (= start!84262 b!985757))

(declare-fun m!912221 () Bool)

(assert (=> mapNonEmpty!36653 m!912221))

(declare-fun m!912223 () Bool)

(assert (=> b!985755 m!912223))

(declare-fun m!912225 () Bool)

(assert (=> b!985756 m!912225))

(declare-fun m!912227 () Bool)

(assert (=> start!84262 m!912227))

(declare-fun m!912229 () Bool)

(assert (=> start!84262 m!912229))

(declare-fun m!912231 () Bool)

(assert (=> start!84262 m!912231))

(check-sat (not start!84262) (not b!985755) (not b!985756) tp_is_empty!23083 (not mapNonEmpty!36653))
(check-sat)
