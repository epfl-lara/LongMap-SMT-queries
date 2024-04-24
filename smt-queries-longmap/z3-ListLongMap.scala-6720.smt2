; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84460 () Bool)

(assert start!84460)

(declare-fun res!660154 () Bool)

(declare-fun e!556505 () Bool)

(assert (=> start!84460 (=> (not res!660154) (not e!556505))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84460 (= res!660154 (validMask!0 mask!1948))))

(assert (=> start!84460 e!556505))

(assert (=> start!84460 true))

(declare-datatypes ((V!35777 0))(
  ( (V!35778 (val!11598 Int)) )
))
(declare-datatypes ((ValueCell!11066 0))(
  ( (ValueCellFull!11066 (v!14157 V!35777)) (EmptyCell!11066) )
))
(declare-datatypes ((array!62198 0))(
  ( (array!62199 (arr!29952 (Array (_ BitVec 32) ValueCell!11066)) (size!30432 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62198)

(declare-fun e!556507 () Bool)

(declare-fun array_inv!23167 (array!62198) Bool)

(assert (=> start!84460 (and (array_inv!23167 _values!1278) e!556507)))

(declare-datatypes ((array!62200 0))(
  ( (array!62201 (arr!29953 (Array (_ BitVec 32) (_ BitVec 64))) (size!30433 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62200)

(declare-fun array_inv!23168 (array!62200) Bool)

(assert (=> start!84460 (array_inv!23168 _keys!1544)))

(declare-fun mapNonEmpty!36671 () Bool)

(declare-fun mapRes!36671 () Bool)

(declare-fun tp!69527 () Bool)

(declare-fun e!556509 () Bool)

(assert (=> mapNonEmpty!36671 (= mapRes!36671 (and tp!69527 e!556509))))

(declare-fun mapKey!36671 () (_ BitVec 32))

(declare-fun mapRest!36671 () (Array (_ BitVec 32) ValueCell!11066))

(declare-fun mapValue!36671 () ValueCell!11066)

(assert (=> mapNonEmpty!36671 (= (arr!29952 _values!1278) (store mapRest!36671 mapKey!36671 mapValue!36671))))

(declare-fun b!987004 () Bool)

(assert (=> b!987004 (= e!556505 false)))

(declare-fun lt!437799 () Bool)

(declare-datatypes ((List!20730 0))(
  ( (Nil!20727) (Cons!20726 (h!21894 (_ BitVec 64)) (t!29621 List!20730)) )
))
(declare-fun arrayNoDuplicates!0 (array!62200 (_ BitVec 32) List!20730) Bool)

(assert (=> b!987004 (= lt!437799 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20727))))

(declare-fun b!987005 () Bool)

(declare-fun tp_is_empty!23095 () Bool)

(assert (=> b!987005 (= e!556509 tp_is_empty!23095)))

(declare-fun b!987006 () Bool)

(declare-fun res!660153 () Bool)

(assert (=> b!987006 (=> (not res!660153) (not e!556505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62200 (_ BitVec 32)) Bool)

(assert (=> b!987006 (= res!660153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987007 () Bool)

(declare-fun e!556506 () Bool)

(assert (=> b!987007 (= e!556507 (and e!556506 mapRes!36671))))

(declare-fun condMapEmpty!36671 () Bool)

(declare-fun mapDefault!36671 () ValueCell!11066)

(assert (=> b!987007 (= condMapEmpty!36671 (= (arr!29952 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11066)) mapDefault!36671)))))

(declare-fun b!987008 () Bool)

(declare-fun res!660152 () Bool)

(assert (=> b!987008 (=> (not res!660152) (not e!556505))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987008 (= res!660152 (and (= (size!30432 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30433 _keys!1544) (size!30432 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987009 () Bool)

(assert (=> b!987009 (= e!556506 tp_is_empty!23095)))

(declare-fun mapIsEmpty!36671 () Bool)

(assert (=> mapIsEmpty!36671 mapRes!36671))

(assert (= (and start!84460 res!660154) b!987008))

(assert (= (and b!987008 res!660152) b!987006))

(assert (= (and b!987006 res!660153) b!987004))

(assert (= (and b!987007 condMapEmpty!36671) mapIsEmpty!36671))

(assert (= (and b!987007 (not condMapEmpty!36671)) mapNonEmpty!36671))

(get-info :version)

(assert (= (and mapNonEmpty!36671 ((_ is ValueCellFull!11066) mapValue!36671)) b!987005))

(assert (= (and b!987007 ((_ is ValueCellFull!11066) mapDefault!36671)) b!987009))

(assert (= start!84460 b!987007))

(declare-fun m!914345 () Bool)

(assert (=> start!84460 m!914345))

(declare-fun m!914347 () Bool)

(assert (=> start!84460 m!914347))

(declare-fun m!914349 () Bool)

(assert (=> start!84460 m!914349))

(declare-fun m!914351 () Bool)

(assert (=> mapNonEmpty!36671 m!914351))

(declare-fun m!914353 () Bool)

(assert (=> b!987004 m!914353))

(declare-fun m!914355 () Bool)

(assert (=> b!987006 m!914355))

(check-sat (not b!987004) (not b!987006) tp_is_empty!23095 (not start!84460) (not mapNonEmpty!36671))
(check-sat)
