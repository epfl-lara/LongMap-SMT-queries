; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84282 () Bool)

(assert start!84282)

(declare-fun res!659765 () Bool)

(declare-fun e!555848 () Bool)

(assert (=> start!84282 (=> (not res!659765) (not e!555848))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84282 (= res!659765 (validMask!0 mask!1948))))

(assert (=> start!84282 e!555848))

(assert (=> start!84282 true))

(declare-datatypes ((V!35763 0))(
  ( (V!35764 (val!11593 Int)) )
))
(declare-datatypes ((ValueCell!11061 0))(
  ( (ValueCellFull!11061 (v!14155 V!35763)) (EmptyCell!11061) )
))
(declare-datatypes ((array!62141 0))(
  ( (array!62142 (arr!29928 (Array (_ BitVec 32) ValueCell!11061)) (size!30407 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62141)

(declare-fun e!555852 () Bool)

(declare-fun array_inv!23129 (array!62141) Bool)

(assert (=> start!84282 (and (array_inv!23129 _values!1278) e!555852)))

(declare-datatypes ((array!62143 0))(
  ( (array!62144 (arr!29929 (Array (_ BitVec 32) (_ BitVec 64))) (size!30408 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62143)

(declare-fun array_inv!23130 (array!62143) Bool)

(assert (=> start!84282 (array_inv!23130 _keys!1544)))

(declare-fun b!986011 () Bool)

(declare-fun res!659763 () Bool)

(assert (=> b!986011 (=> (not res!659763) (not e!555848))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986011 (= res!659763 (and (= (size!30407 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30408 _keys!1544) (size!30407 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986012 () Bool)

(declare-fun e!555849 () Bool)

(declare-fun mapRes!36656 () Bool)

(assert (=> b!986012 (= e!555852 (and e!555849 mapRes!36656))))

(declare-fun condMapEmpty!36656 () Bool)

(declare-fun mapDefault!36656 () ValueCell!11061)

(assert (=> b!986012 (= condMapEmpty!36656 (= (arr!29928 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11061)) mapDefault!36656)))))

(declare-fun mapIsEmpty!36656 () Bool)

(assert (=> mapIsEmpty!36656 mapRes!36656))

(declare-fun b!986013 () Bool)

(assert (=> b!986013 (= e!555848 false)))

(declare-fun lt!437423 () Bool)

(declare-datatypes ((List!20725 0))(
  ( (Nil!20722) (Cons!20721 (h!21883 (_ BitVec 64)) (t!29624 List!20725)) )
))
(declare-fun arrayNoDuplicates!0 (array!62143 (_ BitVec 32) List!20725) Bool)

(assert (=> b!986013 (= lt!437423 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20722))))

(declare-fun mapNonEmpty!36656 () Bool)

(declare-fun tp!69511 () Bool)

(declare-fun e!555850 () Bool)

(assert (=> mapNonEmpty!36656 (= mapRes!36656 (and tp!69511 e!555850))))

(declare-fun mapValue!36656 () ValueCell!11061)

(declare-fun mapKey!36656 () (_ BitVec 32))

(declare-fun mapRest!36656 () (Array (_ BitVec 32) ValueCell!11061))

(assert (=> mapNonEmpty!36656 (= (arr!29928 _values!1278) (store mapRest!36656 mapKey!36656 mapValue!36656))))

(declare-fun b!986014 () Bool)

(declare-fun res!659764 () Bool)

(assert (=> b!986014 (=> (not res!659764) (not e!555848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62143 (_ BitVec 32)) Bool)

(assert (=> b!986014 (= res!659764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986015 () Bool)

(declare-fun tp_is_empty!23085 () Bool)

(assert (=> b!986015 (= e!555849 tp_is_empty!23085)))

(declare-fun b!986016 () Bool)

(assert (=> b!986016 (= e!555850 tp_is_empty!23085)))

(assert (= (and start!84282 res!659765) b!986011))

(assert (= (and b!986011 res!659763) b!986014))

(assert (= (and b!986014 res!659764) b!986013))

(assert (= (and b!986012 condMapEmpty!36656) mapIsEmpty!36656))

(assert (= (and b!986012 (not condMapEmpty!36656)) mapNonEmpty!36656))

(get-info :version)

(assert (= (and mapNonEmpty!36656 ((_ is ValueCellFull!11061) mapValue!36656)) b!986016))

(assert (= (and b!986012 ((_ is ValueCellFull!11061) mapDefault!36656)) b!986015))

(assert (= start!84282 b!986012))

(declare-fun m!912991 () Bool)

(assert (=> start!84282 m!912991))

(declare-fun m!912993 () Bool)

(assert (=> start!84282 m!912993))

(declare-fun m!912995 () Bool)

(assert (=> start!84282 m!912995))

(declare-fun m!912997 () Bool)

(assert (=> b!986013 m!912997))

(declare-fun m!912999 () Bool)

(assert (=> mapNonEmpty!36656 m!912999))

(declare-fun m!913001 () Bool)

(assert (=> b!986014 m!913001))

(check-sat tp_is_empty!23085 (not mapNonEmpty!36656) (not start!84282) (not b!986013) (not b!986014))
(check-sat)
