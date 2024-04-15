; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84244 () Bool)

(assert start!84244)

(declare-fun b!985592 () Bool)

(declare-fun e!555550 () Bool)

(declare-fun tp_is_empty!23065 () Bool)

(assert (=> b!985592 (= e!555550 tp_is_empty!23065)))

(declare-fun mapNonEmpty!36626 () Bool)

(declare-fun mapRes!36626 () Bool)

(declare-fun tp!69482 () Bool)

(assert (=> mapNonEmpty!36626 (= mapRes!36626 (and tp!69482 e!555550))))

(declare-datatypes ((V!35737 0))(
  ( (V!35738 (val!11583 Int)) )
))
(declare-datatypes ((ValueCell!11051 0))(
  ( (ValueCellFull!11051 (v!14144 V!35737)) (EmptyCell!11051) )
))
(declare-fun mapRest!36626 () (Array (_ BitVec 32) ValueCell!11051))

(declare-fun mapKey!36626 () (_ BitVec 32))

(declare-fun mapValue!36626 () ValueCell!11051)

(declare-datatypes ((array!62032 0))(
  ( (array!62033 (arr!29874 (Array (_ BitVec 32) ValueCell!11051)) (size!30355 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62032)

(assert (=> mapNonEmpty!36626 (= (arr!29874 _values!1278) (store mapRest!36626 mapKey!36626 mapValue!36626))))

(declare-fun b!985593 () Bool)

(declare-fun e!555553 () Bool)

(assert (=> b!985593 (= e!555553 false)))

(declare-fun lt!437157 () Bool)

(declare-datatypes ((array!62034 0))(
  ( (array!62035 (arr!29875 (Array (_ BitVec 32) (_ BitVec 64))) (size!30356 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62034)

(declare-datatypes ((List!20753 0))(
  ( (Nil!20750) (Cons!20749 (h!21911 (_ BitVec 64)) (t!29643 List!20753)) )
))
(declare-fun arrayNoDuplicates!0 (array!62034 (_ BitVec 32) List!20753) Bool)

(assert (=> b!985593 (= lt!437157 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20750))))

(declare-fun mapIsEmpty!36626 () Bool)

(assert (=> mapIsEmpty!36626 mapRes!36626))

(declare-fun res!659565 () Bool)

(assert (=> start!84244 (=> (not res!659565) (not e!555553))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84244 (= res!659565 (validMask!0 mask!1948))))

(assert (=> start!84244 e!555553))

(assert (=> start!84244 true))

(declare-fun e!555551 () Bool)

(declare-fun array_inv!23099 (array!62032) Bool)

(assert (=> start!84244 (and (array_inv!23099 _values!1278) e!555551)))

(declare-fun array_inv!23100 (array!62034) Bool)

(assert (=> start!84244 (array_inv!23100 _keys!1544)))

(declare-fun b!985594 () Bool)

(declare-fun e!555552 () Bool)

(assert (=> b!985594 (= e!555551 (and e!555552 mapRes!36626))))

(declare-fun condMapEmpty!36626 () Bool)

(declare-fun mapDefault!36626 () ValueCell!11051)

(assert (=> b!985594 (= condMapEmpty!36626 (= (arr!29874 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11051)) mapDefault!36626)))))

(declare-fun b!985595 () Bool)

(declare-fun res!659563 () Bool)

(assert (=> b!985595 (=> (not res!659563) (not e!555553))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985595 (= res!659563 (and (= (size!30355 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30356 _keys!1544) (size!30355 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985596 () Bool)

(declare-fun res!659564 () Bool)

(assert (=> b!985596 (=> (not res!659564) (not e!555553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62034 (_ BitVec 32)) Bool)

(assert (=> b!985596 (= res!659564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985597 () Bool)

(assert (=> b!985597 (= e!555552 tp_is_empty!23065)))

(assert (= (and start!84244 res!659565) b!985595))

(assert (= (and b!985595 res!659563) b!985596))

(assert (= (and b!985596 res!659564) b!985593))

(assert (= (and b!985594 condMapEmpty!36626) mapIsEmpty!36626))

(assert (= (and b!985594 (not condMapEmpty!36626)) mapNonEmpty!36626))

(get-info :version)

(assert (= (and mapNonEmpty!36626 ((_ is ValueCellFull!11051) mapValue!36626)) b!985592))

(assert (= (and b!985594 ((_ is ValueCellFull!11051) mapDefault!36626)) b!985597))

(assert (= start!84244 b!985594))

(declare-fun m!912113 () Bool)

(assert (=> mapNonEmpty!36626 m!912113))

(declare-fun m!912115 () Bool)

(assert (=> b!985593 m!912115))

(declare-fun m!912117 () Bool)

(assert (=> start!84244 m!912117))

(declare-fun m!912119 () Bool)

(assert (=> start!84244 m!912119))

(declare-fun m!912121 () Bool)

(assert (=> start!84244 m!912121))

(declare-fun m!912123 () Bool)

(assert (=> b!985596 m!912123))

(check-sat (not mapNonEmpty!36626) tp_is_empty!23065 (not b!985593) (not start!84244) (not b!985596))
(check-sat)
