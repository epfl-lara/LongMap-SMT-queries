; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84496 () Bool)

(assert start!84496)

(declare-fun b!987355 () Bool)

(declare-fun res!660343 () Bool)

(declare-fun e!556776 () Bool)

(assert (=> b!987355 (=> (not res!660343) (not e!556776))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35825 0))(
  ( (V!35826 (val!11616 Int)) )
))
(declare-datatypes ((ValueCell!11084 0))(
  ( (ValueCellFull!11084 (v!14175 V!35825)) (EmptyCell!11084) )
))
(declare-datatypes ((array!62266 0))(
  ( (array!62267 (arr!29986 (Array (_ BitVec 32) ValueCell!11084)) (size!30466 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62266)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62268 0))(
  ( (array!62269 (arr!29987 (Array (_ BitVec 32) (_ BitVec 64))) (size!30467 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62268)

(assert (=> b!987355 (= res!660343 (and (= (size!30466 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30467 _keys!1544) (size!30466 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987356 () Bool)

(declare-fun res!660342 () Bool)

(assert (=> b!987356 (=> (not res!660342) (not e!556776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62268 (_ BitVec 32)) Bool)

(assert (=> b!987356 (= res!660342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987357 () Bool)

(declare-fun e!556777 () Bool)

(declare-fun tp_is_empty!23131 () Bool)

(assert (=> b!987357 (= e!556777 tp_is_empty!23131)))

(declare-fun b!987358 () Bool)

(declare-fun e!556779 () Bool)

(declare-fun mapRes!36725 () Bool)

(assert (=> b!987358 (= e!556779 (and e!556777 mapRes!36725))))

(declare-fun condMapEmpty!36725 () Bool)

(declare-fun mapDefault!36725 () ValueCell!11084)

(assert (=> b!987358 (= condMapEmpty!36725 (= (arr!29986 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11084)) mapDefault!36725)))))

(declare-fun res!660341 () Bool)

(assert (=> start!84496 (=> (not res!660341) (not e!556776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84496 (= res!660341 (validMask!0 mask!1948))))

(assert (=> start!84496 e!556776))

(assert (=> start!84496 true))

(declare-fun array_inv!23191 (array!62266) Bool)

(assert (=> start!84496 (and (array_inv!23191 _values!1278) e!556779)))

(declare-fun array_inv!23192 (array!62268) Bool)

(assert (=> start!84496 (array_inv!23192 _keys!1544)))

(declare-fun b!987359 () Bool)

(declare-fun e!556775 () Bool)

(assert (=> b!987359 (= e!556775 tp_is_empty!23131)))

(declare-fun mapIsEmpty!36725 () Bool)

(assert (=> mapIsEmpty!36725 mapRes!36725))

(declare-fun mapNonEmpty!36725 () Bool)

(declare-fun tp!69581 () Bool)

(assert (=> mapNonEmpty!36725 (= mapRes!36725 (and tp!69581 e!556775))))

(declare-fun mapKey!36725 () (_ BitVec 32))

(declare-fun mapValue!36725 () ValueCell!11084)

(declare-fun mapRest!36725 () (Array (_ BitVec 32) ValueCell!11084))

(assert (=> mapNonEmpty!36725 (= (arr!29986 _values!1278) (store mapRest!36725 mapKey!36725 mapValue!36725))))

(declare-fun b!987360 () Bool)

(assert (=> b!987360 (= e!556776 false)))

(declare-fun lt!437853 () Bool)

(declare-datatypes ((List!20740 0))(
  ( (Nil!20737) (Cons!20736 (h!21904 (_ BitVec 64)) (t!29631 List!20740)) )
))
(declare-fun arrayNoDuplicates!0 (array!62268 (_ BitVec 32) List!20740) Bool)

(assert (=> b!987360 (= lt!437853 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20737))))

(assert (= (and start!84496 res!660341) b!987355))

(assert (= (and b!987355 res!660343) b!987356))

(assert (= (and b!987356 res!660342) b!987360))

(assert (= (and b!987358 condMapEmpty!36725) mapIsEmpty!36725))

(assert (= (and b!987358 (not condMapEmpty!36725)) mapNonEmpty!36725))

(get-info :version)

(assert (= (and mapNonEmpty!36725 ((_ is ValueCellFull!11084) mapValue!36725)) b!987359))

(assert (= (and b!987358 ((_ is ValueCellFull!11084) mapDefault!36725)) b!987357))

(assert (= start!84496 b!987358))

(declare-fun m!914573 () Bool)

(assert (=> b!987356 m!914573))

(declare-fun m!914575 () Bool)

(assert (=> start!84496 m!914575))

(declare-fun m!914577 () Bool)

(assert (=> start!84496 m!914577))

(declare-fun m!914579 () Bool)

(assert (=> start!84496 m!914579))

(declare-fun m!914581 () Bool)

(assert (=> mapNonEmpty!36725 m!914581))

(declare-fun m!914583 () Bool)

(assert (=> b!987360 m!914583))

(check-sat (not start!84496) (not b!987356) tp_is_empty!23131 (not b!987360) (not mapNonEmpty!36725))
(check-sat)
