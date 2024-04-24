; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84478 () Bool)

(assert start!84478)

(declare-fun b!987193 () Bool)

(declare-fun e!556641 () Bool)

(declare-fun tp_is_empty!23113 () Bool)

(assert (=> b!987193 (= e!556641 tp_is_empty!23113)))

(declare-fun mapIsEmpty!36698 () Bool)

(declare-fun mapRes!36698 () Bool)

(assert (=> mapIsEmpty!36698 mapRes!36698))

(declare-fun b!987194 () Bool)

(declare-fun e!556643 () Bool)

(assert (=> b!987194 (= e!556643 false)))

(declare-fun lt!437826 () Bool)

(declare-datatypes ((array!62230 0))(
  ( (array!62231 (arr!29968 (Array (_ BitVec 32) (_ BitVec 64))) (size!30448 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62230)

(declare-datatypes ((List!20735 0))(
  ( (Nil!20732) (Cons!20731 (h!21899 (_ BitVec 64)) (t!29626 List!20735)) )
))
(declare-fun arrayNoDuplicates!0 (array!62230 (_ BitVec 32) List!20735) Bool)

(assert (=> b!987194 (= lt!437826 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20732))))

(declare-fun b!987195 () Bool)

(declare-fun e!556644 () Bool)

(assert (=> b!987195 (= e!556644 (and e!556641 mapRes!36698))))

(declare-fun condMapEmpty!36698 () Bool)

(declare-datatypes ((V!35801 0))(
  ( (V!35802 (val!11607 Int)) )
))
(declare-datatypes ((ValueCell!11075 0))(
  ( (ValueCellFull!11075 (v!14166 V!35801)) (EmptyCell!11075) )
))
(declare-datatypes ((array!62232 0))(
  ( (array!62233 (arr!29969 (Array (_ BitVec 32) ValueCell!11075)) (size!30449 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62232)

(declare-fun mapDefault!36698 () ValueCell!11075)

(assert (=> b!987195 (= condMapEmpty!36698 (= (arr!29969 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11075)) mapDefault!36698)))))

(declare-fun b!987196 () Bool)

(declare-fun e!556640 () Bool)

(assert (=> b!987196 (= e!556640 tp_is_empty!23113)))

(declare-fun b!987197 () Bool)

(declare-fun res!660262 () Bool)

(assert (=> b!987197 (=> (not res!660262) (not e!556643))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987197 (= res!660262 (and (= (size!30449 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30448 _keys!1544) (size!30449 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36698 () Bool)

(declare-fun tp!69554 () Bool)

(assert (=> mapNonEmpty!36698 (= mapRes!36698 (and tp!69554 e!556640))))

(declare-fun mapValue!36698 () ValueCell!11075)

(declare-fun mapKey!36698 () (_ BitVec 32))

(declare-fun mapRest!36698 () (Array (_ BitVec 32) ValueCell!11075))

(assert (=> mapNonEmpty!36698 (= (arr!29969 _values!1278) (store mapRest!36698 mapKey!36698 mapValue!36698))))

(declare-fun b!987198 () Bool)

(declare-fun res!660261 () Bool)

(assert (=> b!987198 (=> (not res!660261) (not e!556643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62230 (_ BitVec 32)) Bool)

(assert (=> b!987198 (= res!660261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!660260 () Bool)

(assert (=> start!84478 (=> (not res!660260) (not e!556643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84478 (= res!660260 (validMask!0 mask!1948))))

(assert (=> start!84478 e!556643))

(assert (=> start!84478 true))

(declare-fun array_inv!23179 (array!62232) Bool)

(assert (=> start!84478 (and (array_inv!23179 _values!1278) e!556644)))

(declare-fun array_inv!23180 (array!62230) Bool)

(assert (=> start!84478 (array_inv!23180 _keys!1544)))

(assert (= (and start!84478 res!660260) b!987197))

(assert (= (and b!987197 res!660262) b!987198))

(assert (= (and b!987198 res!660261) b!987194))

(assert (= (and b!987195 condMapEmpty!36698) mapIsEmpty!36698))

(assert (= (and b!987195 (not condMapEmpty!36698)) mapNonEmpty!36698))

(get-info :version)

(assert (= (and mapNonEmpty!36698 ((_ is ValueCellFull!11075) mapValue!36698)) b!987196))

(assert (= (and b!987195 ((_ is ValueCellFull!11075) mapDefault!36698)) b!987193))

(assert (= start!84478 b!987195))

(declare-fun m!914465 () Bool)

(assert (=> b!987194 m!914465))

(declare-fun m!914467 () Bool)

(assert (=> mapNonEmpty!36698 m!914467))

(declare-fun m!914469 () Bool)

(assert (=> b!987198 m!914469))

(declare-fun m!914471 () Bool)

(assert (=> start!84478 m!914471))

(declare-fun m!914473 () Bool)

(assert (=> start!84478 m!914473))

(declare-fun m!914475 () Bool)

(assert (=> start!84478 m!914475))

(check-sat (not mapNonEmpty!36698) tp_is_empty!23113 (not b!987194) (not b!987198) (not start!84478))
(check-sat)
