; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84334 () Bool)

(assert start!84334)

(declare-fun b!986429 () Bool)

(declare-fun res!659997 () Bool)

(declare-fun e!556225 () Bool)

(assert (=> b!986429 (=> (not res!659997) (not e!556225))))

(declare-datatypes ((array!62202 0))(
  ( (array!62203 (arr!29959 (Array (_ BitVec 32) (_ BitVec 64))) (size!30440 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62202)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62202 (_ BitVec 32)) Bool)

(assert (=> b!986429 (= res!659997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986430 () Bool)

(declare-fun e!556229 () Bool)

(declare-fun tp_is_empty!23155 () Bool)

(assert (=> b!986430 (= e!556229 tp_is_empty!23155)))

(declare-fun b!986431 () Bool)

(assert (=> b!986431 (= e!556225 false)))

(declare-fun lt!437292 () Bool)

(declare-datatypes ((List!20783 0))(
  ( (Nil!20780) (Cons!20779 (h!21941 (_ BitVec 64)) (t!29673 List!20783)) )
))
(declare-fun arrayNoDuplicates!0 (array!62202 (_ BitVec 32) List!20783) Bool)

(assert (=> b!986431 (= lt!437292 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20780))))

(declare-fun b!986433 () Bool)

(declare-fun res!659996 () Bool)

(assert (=> b!986433 (=> (not res!659996) (not e!556225))))

(declare-datatypes ((V!35857 0))(
  ( (V!35858 (val!11628 Int)) )
))
(declare-datatypes ((ValueCell!11096 0))(
  ( (ValueCellFull!11096 (v!14189 V!35857)) (EmptyCell!11096) )
))
(declare-datatypes ((array!62204 0))(
  ( (array!62205 (arr!29960 (Array (_ BitVec 32) ValueCell!11096)) (size!30441 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62204)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986433 (= res!659996 (and (= (size!30441 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30440 _keys!1544) (size!30441 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986434 () Bool)

(declare-fun e!556227 () Bool)

(declare-fun mapRes!36761 () Bool)

(assert (=> b!986434 (= e!556227 (and e!556229 mapRes!36761))))

(declare-fun condMapEmpty!36761 () Bool)

(declare-fun mapDefault!36761 () ValueCell!11096)

(assert (=> b!986434 (= condMapEmpty!36761 (= (arr!29960 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11096)) mapDefault!36761)))))

(declare-fun b!986432 () Bool)

(declare-fun e!556226 () Bool)

(assert (=> b!986432 (= e!556226 tp_is_empty!23155)))

(declare-fun res!659995 () Bool)

(assert (=> start!84334 (=> (not res!659995) (not e!556225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84334 (= res!659995 (validMask!0 mask!1948))))

(assert (=> start!84334 e!556225))

(assert (=> start!84334 true))

(declare-fun array_inv!23165 (array!62204) Bool)

(assert (=> start!84334 (and (array_inv!23165 _values!1278) e!556227)))

(declare-fun array_inv!23166 (array!62202) Bool)

(assert (=> start!84334 (array_inv!23166 _keys!1544)))

(declare-fun mapIsEmpty!36761 () Bool)

(assert (=> mapIsEmpty!36761 mapRes!36761))

(declare-fun mapNonEmpty!36761 () Bool)

(declare-fun tp!69617 () Bool)

(assert (=> mapNonEmpty!36761 (= mapRes!36761 (and tp!69617 e!556226))))

(declare-fun mapValue!36761 () ValueCell!11096)

(declare-fun mapRest!36761 () (Array (_ BitVec 32) ValueCell!11096))

(declare-fun mapKey!36761 () (_ BitVec 32))

(assert (=> mapNonEmpty!36761 (= (arr!29960 _values!1278) (store mapRest!36761 mapKey!36761 mapValue!36761))))

(assert (= (and start!84334 res!659995) b!986433))

(assert (= (and b!986433 res!659996) b!986429))

(assert (= (and b!986429 res!659997) b!986431))

(assert (= (and b!986434 condMapEmpty!36761) mapIsEmpty!36761))

(assert (= (and b!986434 (not condMapEmpty!36761)) mapNonEmpty!36761))

(get-info :version)

(assert (= (and mapNonEmpty!36761 ((_ is ValueCellFull!11096) mapValue!36761)) b!986432))

(assert (= (and b!986434 ((_ is ValueCellFull!11096) mapDefault!36761)) b!986430))

(assert (= start!84334 b!986434))

(declare-fun m!912665 () Bool)

(assert (=> b!986429 m!912665))

(declare-fun m!912667 () Bool)

(assert (=> b!986431 m!912667))

(declare-fun m!912669 () Bool)

(assert (=> start!84334 m!912669))

(declare-fun m!912671 () Bool)

(assert (=> start!84334 m!912671))

(declare-fun m!912673 () Bool)

(assert (=> start!84334 m!912673))

(declare-fun m!912675 () Bool)

(assert (=> mapNonEmpty!36761 m!912675))

(check-sat tp_is_empty!23155 (not mapNonEmpty!36761) (not b!986431) (not b!986429) (not start!84334))
(check-sat)
