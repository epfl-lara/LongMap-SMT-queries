; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84342 () Bool)

(assert start!84342)

(declare-fun b!986578 () Bool)

(declare-fun e!556302 () Bool)

(declare-fun tp_is_empty!23145 () Bool)

(assert (=> b!986578 (= e!556302 tp_is_empty!23145)))

(declare-fun mapIsEmpty!36746 () Bool)

(declare-fun mapRes!36746 () Bool)

(assert (=> mapIsEmpty!36746 mapRes!36746))

(declare-fun res!660060 () Bool)

(declare-fun e!556298 () Bool)

(assert (=> start!84342 (=> (not res!660060) (not e!556298))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84342 (= res!660060 (validMask!0 mask!1948))))

(assert (=> start!84342 e!556298))

(assert (=> start!84342 true))

(declare-datatypes ((V!35843 0))(
  ( (V!35844 (val!11623 Int)) )
))
(declare-datatypes ((ValueCell!11091 0))(
  ( (ValueCellFull!11091 (v!14185 V!35843)) (EmptyCell!11091) )
))
(declare-datatypes ((array!62251 0))(
  ( (array!62252 (arr!29983 (Array (_ BitVec 32) ValueCell!11091)) (size!30462 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62251)

(declare-fun e!556300 () Bool)

(declare-fun array_inv!23173 (array!62251) Bool)

(assert (=> start!84342 (and (array_inv!23173 _values!1278) e!556300)))

(declare-datatypes ((array!62253 0))(
  ( (array!62254 (arr!29984 (Array (_ BitVec 32) (_ BitVec 64))) (size!30463 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62253)

(declare-fun array_inv!23174 (array!62253) Bool)

(assert (=> start!84342 (array_inv!23174 _keys!1544)))

(declare-fun b!986579 () Bool)

(declare-fun res!660062 () Bool)

(assert (=> b!986579 (=> (not res!660062) (not e!556298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62253 (_ BitVec 32)) Bool)

(assert (=> b!986579 (= res!660062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986580 () Bool)

(declare-fun e!556301 () Bool)

(assert (=> b!986580 (= e!556301 tp_is_empty!23145)))

(declare-fun b!986581 () Bool)

(declare-fun res!660061 () Bool)

(assert (=> b!986581 (=> (not res!660061) (not e!556298))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986581 (= res!660061 (and (= (size!30462 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30463 _keys!1544) (size!30462 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36746 () Bool)

(declare-fun tp!69601 () Bool)

(assert (=> mapNonEmpty!36746 (= mapRes!36746 (and tp!69601 e!556301))))

(declare-fun mapKey!36746 () (_ BitVec 32))

(declare-fun mapRest!36746 () (Array (_ BitVec 32) ValueCell!11091))

(declare-fun mapValue!36746 () ValueCell!11091)

(assert (=> mapNonEmpty!36746 (= (arr!29983 _values!1278) (store mapRest!36746 mapKey!36746 mapValue!36746))))

(declare-fun b!986582 () Bool)

(assert (=> b!986582 (= e!556300 (and e!556302 mapRes!36746))))

(declare-fun condMapEmpty!36746 () Bool)

(declare-fun mapDefault!36746 () ValueCell!11091)

(assert (=> b!986582 (= condMapEmpty!36746 (= (arr!29983 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11091)) mapDefault!36746)))))

(declare-fun b!986583 () Bool)

(assert (=> b!986583 (= e!556298 false)))

(declare-fun lt!437513 () Bool)

(declare-datatypes ((List!20745 0))(
  ( (Nil!20742) (Cons!20741 (h!21903 (_ BitVec 64)) (t!29644 List!20745)) )
))
(declare-fun arrayNoDuplicates!0 (array!62253 (_ BitVec 32) List!20745) Bool)

(assert (=> b!986583 (= lt!437513 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20742))))

(assert (= (and start!84342 res!660060) b!986581))

(assert (= (and b!986581 res!660061) b!986579))

(assert (= (and b!986579 res!660062) b!986583))

(assert (= (and b!986582 condMapEmpty!36746) mapIsEmpty!36746))

(assert (= (and b!986582 (not condMapEmpty!36746)) mapNonEmpty!36746))

(get-info :version)

(assert (= (and mapNonEmpty!36746 ((_ is ValueCellFull!11091) mapValue!36746)) b!986580))

(assert (= (and b!986582 ((_ is ValueCellFull!11091) mapDefault!36746)) b!986578))

(assert (= start!84342 b!986582))

(declare-fun m!913363 () Bool)

(assert (=> start!84342 m!913363))

(declare-fun m!913365 () Bool)

(assert (=> start!84342 m!913365))

(declare-fun m!913367 () Bool)

(assert (=> start!84342 m!913367))

(declare-fun m!913369 () Bool)

(assert (=> b!986579 m!913369))

(declare-fun m!913371 () Bool)

(assert (=> mapNonEmpty!36746 m!913371))

(declare-fun m!913373 () Bool)

(assert (=> b!986583 m!913373))

(check-sat (not mapNonEmpty!36746) (not b!986583) (not b!986579) (not start!84342) tp_is_empty!23145)
(check-sat)
