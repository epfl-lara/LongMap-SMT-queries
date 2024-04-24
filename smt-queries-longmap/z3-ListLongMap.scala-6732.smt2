; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84532 () Bool)

(assert start!84532)

(declare-fun res!660532 () Bool)

(declare-fun e!557049 () Bool)

(assert (=> start!84532 (=> (not res!660532) (not e!557049))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84532 (= res!660532 (validMask!0 mask!1948))))

(assert (=> start!84532 e!557049))

(assert (=> start!84532 true))

(declare-datatypes ((V!35873 0))(
  ( (V!35874 (val!11634 Int)) )
))
(declare-datatypes ((ValueCell!11102 0))(
  ( (ValueCellFull!11102 (v!14193 V!35873)) (EmptyCell!11102) )
))
(declare-datatypes ((array!62336 0))(
  ( (array!62337 (arr!30021 (Array (_ BitVec 32) ValueCell!11102)) (size!30501 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62336)

(declare-fun e!557047 () Bool)

(declare-fun array_inv!23215 (array!62336) Bool)

(assert (=> start!84532 (and (array_inv!23215 _values!1278) e!557047)))

(declare-datatypes ((array!62338 0))(
  ( (array!62339 (arr!30022 (Array (_ BitVec 32) (_ BitVec 64))) (size!30502 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62338)

(declare-fun array_inv!23216 (array!62338) Bool)

(assert (=> start!84532 (array_inv!23216 _keys!1544)))

(declare-fun b!987706 () Bool)

(assert (=> b!987706 (= e!557049 false)))

(declare-fun lt!437907 () Bool)

(declare-datatypes ((List!20749 0))(
  ( (Nil!20746) (Cons!20745 (h!21913 (_ BitVec 64)) (t!29640 List!20749)) )
))
(declare-fun arrayNoDuplicates!0 (array!62338 (_ BitVec 32) List!20749) Bool)

(assert (=> b!987706 (= lt!437907 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20746))))

(declare-fun b!987707 () Bool)

(declare-fun e!557046 () Bool)

(declare-fun mapRes!36779 () Bool)

(assert (=> b!987707 (= e!557047 (and e!557046 mapRes!36779))))

(declare-fun condMapEmpty!36779 () Bool)

(declare-fun mapDefault!36779 () ValueCell!11102)

(assert (=> b!987707 (= condMapEmpty!36779 (= (arr!30021 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11102)) mapDefault!36779)))))

(declare-fun mapNonEmpty!36779 () Bool)

(declare-fun tp!69635 () Bool)

(declare-fun e!557045 () Bool)

(assert (=> mapNonEmpty!36779 (= mapRes!36779 (and tp!69635 e!557045))))

(declare-fun mapValue!36779 () ValueCell!11102)

(declare-fun mapKey!36779 () (_ BitVec 32))

(declare-fun mapRest!36779 () (Array (_ BitVec 32) ValueCell!11102))

(assert (=> mapNonEmpty!36779 (= (arr!30021 _values!1278) (store mapRest!36779 mapKey!36779 mapValue!36779))))

(declare-fun b!987708 () Bool)

(declare-fun tp_is_empty!23167 () Bool)

(assert (=> b!987708 (= e!557045 tp_is_empty!23167)))

(declare-fun b!987709 () Bool)

(declare-fun res!660531 () Bool)

(assert (=> b!987709 (=> (not res!660531) (not e!557049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62338 (_ BitVec 32)) Bool)

(assert (=> b!987709 (= res!660531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36779 () Bool)

(assert (=> mapIsEmpty!36779 mapRes!36779))

(declare-fun b!987710 () Bool)

(assert (=> b!987710 (= e!557046 tp_is_empty!23167)))

(declare-fun b!987711 () Bool)

(declare-fun res!660530 () Bool)

(assert (=> b!987711 (=> (not res!660530) (not e!557049))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987711 (= res!660530 (and (= (size!30501 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30502 _keys!1544) (size!30501 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84532 res!660532) b!987711))

(assert (= (and b!987711 res!660530) b!987709))

(assert (= (and b!987709 res!660531) b!987706))

(assert (= (and b!987707 condMapEmpty!36779) mapIsEmpty!36779))

(assert (= (and b!987707 (not condMapEmpty!36779)) mapNonEmpty!36779))

(get-info :version)

(assert (= (and mapNonEmpty!36779 ((_ is ValueCellFull!11102) mapValue!36779)) b!987708))

(assert (= (and b!987707 ((_ is ValueCellFull!11102) mapDefault!36779)) b!987710))

(assert (= start!84532 b!987707))

(declare-fun m!914801 () Bool)

(assert (=> start!84532 m!914801))

(declare-fun m!914803 () Bool)

(assert (=> start!84532 m!914803))

(declare-fun m!914805 () Bool)

(assert (=> start!84532 m!914805))

(declare-fun m!914807 () Bool)

(assert (=> b!987706 m!914807))

(declare-fun m!914809 () Bool)

(assert (=> mapNonEmpty!36779 m!914809))

(declare-fun m!914811 () Bool)

(assert (=> b!987709 m!914811))

(check-sat (not start!84532) (not mapNonEmpty!36779) tp_is_empty!23167 (not b!987709) (not b!987706))
(check-sat)
