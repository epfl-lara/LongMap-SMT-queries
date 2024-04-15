; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84238 () Bool)

(assert start!84238)

(declare-fun mapIsEmpty!36617 () Bool)

(declare-fun mapRes!36617 () Bool)

(assert (=> mapIsEmpty!36617 mapRes!36617))

(declare-fun b!985538 () Bool)

(declare-fun e!555508 () Bool)

(assert (=> b!985538 (= e!555508 false)))

(declare-fun lt!437148 () Bool)

(declare-datatypes ((array!62020 0))(
  ( (array!62021 (arr!29868 (Array (_ BitVec 32) (_ BitVec 64))) (size!30349 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62020)

(declare-datatypes ((List!20750 0))(
  ( (Nil!20747) (Cons!20746 (h!21908 (_ BitVec 64)) (t!29640 List!20750)) )
))
(declare-fun arrayNoDuplicates!0 (array!62020 (_ BitVec 32) List!20750) Bool)

(assert (=> b!985538 (= lt!437148 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20747))))

(declare-fun mapNonEmpty!36617 () Bool)

(declare-fun tp!69473 () Bool)

(declare-fun e!555506 () Bool)

(assert (=> mapNonEmpty!36617 (= mapRes!36617 (and tp!69473 e!555506))))

(declare-datatypes ((V!35729 0))(
  ( (V!35730 (val!11580 Int)) )
))
(declare-datatypes ((ValueCell!11048 0))(
  ( (ValueCellFull!11048 (v!14141 V!35729)) (EmptyCell!11048) )
))
(declare-fun mapValue!36617 () ValueCell!11048)

(declare-datatypes ((array!62022 0))(
  ( (array!62023 (arr!29869 (Array (_ BitVec 32) ValueCell!11048)) (size!30350 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62022)

(declare-fun mapRest!36617 () (Array (_ BitVec 32) ValueCell!11048))

(declare-fun mapKey!36617 () (_ BitVec 32))

(assert (=> mapNonEmpty!36617 (= (arr!29869 _values!1278) (store mapRest!36617 mapKey!36617 mapValue!36617))))

(declare-fun b!985539 () Bool)

(declare-fun e!555507 () Bool)

(declare-fun tp_is_empty!23059 () Bool)

(assert (=> b!985539 (= e!555507 tp_is_empty!23059)))

(declare-fun b!985540 () Bool)

(declare-fun res!659537 () Bool)

(assert (=> b!985540 (=> (not res!659537) (not e!555508))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985540 (= res!659537 (and (= (size!30350 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30349 _keys!1544) (size!30350 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985541 () Bool)

(declare-fun res!659538 () Bool)

(assert (=> b!985541 (=> (not res!659538) (not e!555508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62020 (_ BitVec 32)) Bool)

(assert (=> b!985541 (= res!659538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985542 () Bool)

(declare-fun e!555505 () Bool)

(assert (=> b!985542 (= e!555505 (and e!555507 mapRes!36617))))

(declare-fun condMapEmpty!36617 () Bool)

(declare-fun mapDefault!36617 () ValueCell!11048)

(assert (=> b!985542 (= condMapEmpty!36617 (= (arr!29869 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11048)) mapDefault!36617)))))

(declare-fun b!985543 () Bool)

(assert (=> b!985543 (= e!555506 tp_is_empty!23059)))

(declare-fun res!659536 () Bool)

(assert (=> start!84238 (=> (not res!659536) (not e!555508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84238 (= res!659536 (validMask!0 mask!1948))))

(assert (=> start!84238 e!555508))

(assert (=> start!84238 true))

(declare-fun array_inv!23093 (array!62022) Bool)

(assert (=> start!84238 (and (array_inv!23093 _values!1278) e!555505)))

(declare-fun array_inv!23094 (array!62020) Bool)

(assert (=> start!84238 (array_inv!23094 _keys!1544)))

(assert (= (and start!84238 res!659536) b!985540))

(assert (= (and b!985540 res!659537) b!985541))

(assert (= (and b!985541 res!659538) b!985538))

(assert (= (and b!985542 condMapEmpty!36617) mapIsEmpty!36617))

(assert (= (and b!985542 (not condMapEmpty!36617)) mapNonEmpty!36617))

(get-info :version)

(assert (= (and mapNonEmpty!36617 ((_ is ValueCellFull!11048) mapValue!36617)) b!985543))

(assert (= (and b!985542 ((_ is ValueCellFull!11048) mapDefault!36617)) b!985539))

(assert (= start!84238 b!985542))

(declare-fun m!912077 () Bool)

(assert (=> b!985538 m!912077))

(declare-fun m!912079 () Bool)

(assert (=> mapNonEmpty!36617 m!912079))

(declare-fun m!912081 () Bool)

(assert (=> b!985541 m!912081))

(declare-fun m!912083 () Bool)

(assert (=> start!84238 m!912083))

(declare-fun m!912085 () Bool)

(assert (=> start!84238 m!912085))

(declare-fun m!912087 () Bool)

(assert (=> start!84238 m!912087))

(check-sat (not start!84238) (not b!985538) tp_is_empty!23059 (not mapNonEmpty!36617) (not b!985541))
(check-sat)
