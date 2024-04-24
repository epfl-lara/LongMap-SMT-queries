; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84466 () Bool)

(assert start!84466)

(declare-fun b!987058 () Bool)

(declare-fun res!660179 () Bool)

(declare-fun e!556551 () Bool)

(assert (=> b!987058 (=> (not res!660179) (not e!556551))))

(declare-datatypes ((array!62210 0))(
  ( (array!62211 (arr!29958 (Array (_ BitVec 32) (_ BitVec 64))) (size!30438 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62210)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62210 (_ BitVec 32)) Bool)

(assert (=> b!987058 (= res!660179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!660180 () Bool)

(assert (=> start!84466 (=> (not res!660180) (not e!556551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84466 (= res!660180 (validMask!0 mask!1948))))

(assert (=> start!84466 e!556551))

(assert (=> start!84466 true))

(declare-datatypes ((V!35785 0))(
  ( (V!35786 (val!11601 Int)) )
))
(declare-datatypes ((ValueCell!11069 0))(
  ( (ValueCellFull!11069 (v!14160 V!35785)) (EmptyCell!11069) )
))
(declare-datatypes ((array!62212 0))(
  ( (array!62213 (arr!29959 (Array (_ BitVec 32) ValueCell!11069)) (size!30439 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62212)

(declare-fun e!556553 () Bool)

(declare-fun array_inv!23171 (array!62212) Bool)

(assert (=> start!84466 (and (array_inv!23171 _values!1278) e!556553)))

(declare-fun array_inv!23172 (array!62210) Bool)

(assert (=> start!84466 (array_inv!23172 _keys!1544)))

(declare-fun b!987059 () Bool)

(declare-fun e!556554 () Bool)

(declare-fun tp_is_empty!23101 () Bool)

(assert (=> b!987059 (= e!556554 tp_is_empty!23101)))

(declare-fun b!987060 () Bool)

(declare-fun e!556552 () Bool)

(assert (=> b!987060 (= e!556552 tp_is_empty!23101)))

(declare-fun b!987061 () Bool)

(declare-fun res!660181 () Bool)

(assert (=> b!987061 (=> (not res!660181) (not e!556551))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987061 (= res!660181 (and (= (size!30439 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30438 _keys!1544) (size!30439 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987062 () Bool)

(declare-fun mapRes!36680 () Bool)

(assert (=> b!987062 (= e!556553 (and e!556554 mapRes!36680))))

(declare-fun condMapEmpty!36680 () Bool)

(declare-fun mapDefault!36680 () ValueCell!11069)

(assert (=> b!987062 (= condMapEmpty!36680 (= (arr!29959 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11069)) mapDefault!36680)))))

(declare-fun mapNonEmpty!36680 () Bool)

(declare-fun tp!69536 () Bool)

(assert (=> mapNonEmpty!36680 (= mapRes!36680 (and tp!69536 e!556552))))

(declare-fun mapKey!36680 () (_ BitVec 32))

(declare-fun mapRest!36680 () (Array (_ BitVec 32) ValueCell!11069))

(declare-fun mapValue!36680 () ValueCell!11069)

(assert (=> mapNonEmpty!36680 (= (arr!29959 _values!1278) (store mapRest!36680 mapKey!36680 mapValue!36680))))

(declare-fun b!987063 () Bool)

(assert (=> b!987063 (= e!556551 false)))

(declare-fun lt!437808 () Bool)

(declare-datatypes ((List!20732 0))(
  ( (Nil!20729) (Cons!20728 (h!21896 (_ BitVec 64)) (t!29623 List!20732)) )
))
(declare-fun arrayNoDuplicates!0 (array!62210 (_ BitVec 32) List!20732) Bool)

(assert (=> b!987063 (= lt!437808 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20729))))

(declare-fun mapIsEmpty!36680 () Bool)

(assert (=> mapIsEmpty!36680 mapRes!36680))

(assert (= (and start!84466 res!660180) b!987061))

(assert (= (and b!987061 res!660181) b!987058))

(assert (= (and b!987058 res!660179) b!987063))

(assert (= (and b!987062 condMapEmpty!36680) mapIsEmpty!36680))

(assert (= (and b!987062 (not condMapEmpty!36680)) mapNonEmpty!36680))

(get-info :version)

(assert (= (and mapNonEmpty!36680 ((_ is ValueCellFull!11069) mapValue!36680)) b!987060))

(assert (= (and b!987062 ((_ is ValueCellFull!11069) mapDefault!36680)) b!987059))

(assert (= start!84466 b!987062))

(declare-fun m!914381 () Bool)

(assert (=> b!987058 m!914381))

(declare-fun m!914383 () Bool)

(assert (=> start!84466 m!914383))

(declare-fun m!914385 () Bool)

(assert (=> start!84466 m!914385))

(declare-fun m!914387 () Bool)

(assert (=> start!84466 m!914387))

(declare-fun m!914389 () Bool)

(assert (=> mapNonEmpty!36680 m!914389))

(declare-fun m!914391 () Bool)

(assert (=> b!987063 m!914391))

(check-sat (not mapNonEmpty!36680) tp_is_empty!23101 (not start!84466) (not b!987063) (not b!987058))
(check-sat)
