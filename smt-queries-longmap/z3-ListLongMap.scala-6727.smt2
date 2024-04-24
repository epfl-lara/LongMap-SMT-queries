; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84502 () Bool)

(assert start!84502)

(declare-fun mapIsEmpty!36734 () Bool)

(declare-fun mapRes!36734 () Bool)

(assert (=> mapIsEmpty!36734 mapRes!36734))

(declare-fun b!987409 () Bool)

(declare-fun e!556823 () Bool)

(declare-fun tp_is_empty!23137 () Bool)

(assert (=> b!987409 (= e!556823 tp_is_empty!23137)))

(declare-fun mapNonEmpty!36734 () Bool)

(declare-fun tp!69590 () Bool)

(declare-fun e!556824 () Bool)

(assert (=> mapNonEmpty!36734 (= mapRes!36734 (and tp!69590 e!556824))))

(declare-datatypes ((V!35833 0))(
  ( (V!35834 (val!11619 Int)) )
))
(declare-datatypes ((ValueCell!11087 0))(
  ( (ValueCellFull!11087 (v!14178 V!35833)) (EmptyCell!11087) )
))
(declare-fun mapValue!36734 () ValueCell!11087)

(declare-fun mapRest!36734 () (Array (_ BitVec 32) ValueCell!11087))

(declare-datatypes ((array!62278 0))(
  ( (array!62279 (arr!29992 (Array (_ BitVec 32) ValueCell!11087)) (size!30472 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62278)

(declare-fun mapKey!36734 () (_ BitVec 32))

(assert (=> mapNonEmpty!36734 (= (arr!29992 _values!1278) (store mapRest!36734 mapKey!36734 mapValue!36734))))

(declare-fun b!987410 () Bool)

(declare-fun e!556821 () Bool)

(assert (=> b!987410 (= e!556821 (and e!556823 mapRes!36734))))

(declare-fun condMapEmpty!36734 () Bool)

(declare-fun mapDefault!36734 () ValueCell!11087)

(assert (=> b!987410 (= condMapEmpty!36734 (= (arr!29992 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11087)) mapDefault!36734)))))

(declare-fun b!987411 () Bool)

(declare-fun res!660370 () Bool)

(declare-fun e!556820 () Bool)

(assert (=> b!987411 (=> (not res!660370) (not e!556820))))

(declare-datatypes ((array!62280 0))(
  ( (array!62281 (arr!29993 (Array (_ BitVec 32) (_ BitVec 64))) (size!30473 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62280)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62280 (_ BitVec 32)) Bool)

(assert (=> b!987411 (= res!660370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!660369 () Bool)

(assert (=> start!84502 (=> (not res!660369) (not e!556820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84502 (= res!660369 (validMask!0 mask!1948))))

(assert (=> start!84502 e!556820))

(assert (=> start!84502 true))

(declare-fun array_inv!23195 (array!62278) Bool)

(assert (=> start!84502 (and (array_inv!23195 _values!1278) e!556821)))

(declare-fun array_inv!23196 (array!62280) Bool)

(assert (=> start!84502 (array_inv!23196 _keys!1544)))

(declare-fun b!987412 () Bool)

(assert (=> b!987412 (= e!556820 false)))

(declare-fun lt!437862 () Bool)

(declare-datatypes ((List!20741 0))(
  ( (Nil!20738) (Cons!20737 (h!21905 (_ BitVec 64)) (t!29632 List!20741)) )
))
(declare-fun arrayNoDuplicates!0 (array!62280 (_ BitVec 32) List!20741) Bool)

(assert (=> b!987412 (= lt!437862 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20738))))

(declare-fun b!987413 () Bool)

(assert (=> b!987413 (= e!556824 tp_is_empty!23137)))

(declare-fun b!987414 () Bool)

(declare-fun res!660368 () Bool)

(assert (=> b!987414 (=> (not res!660368) (not e!556820))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987414 (= res!660368 (and (= (size!30472 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30473 _keys!1544) (size!30472 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84502 res!660369) b!987414))

(assert (= (and b!987414 res!660368) b!987411))

(assert (= (and b!987411 res!660370) b!987412))

(assert (= (and b!987410 condMapEmpty!36734) mapIsEmpty!36734))

(assert (= (and b!987410 (not condMapEmpty!36734)) mapNonEmpty!36734))

(get-info :version)

(assert (= (and mapNonEmpty!36734 ((_ is ValueCellFull!11087) mapValue!36734)) b!987413))

(assert (= (and b!987410 ((_ is ValueCellFull!11087) mapDefault!36734)) b!987409))

(assert (= start!84502 b!987410))

(declare-fun m!914609 () Bool)

(assert (=> mapNonEmpty!36734 m!914609))

(declare-fun m!914611 () Bool)

(assert (=> b!987411 m!914611))

(declare-fun m!914613 () Bool)

(assert (=> start!84502 m!914613))

(declare-fun m!914615 () Bool)

(assert (=> start!84502 m!914615))

(declare-fun m!914617 () Bool)

(assert (=> start!84502 m!914617))

(declare-fun m!914619 () Bool)

(assert (=> b!987412 m!914619))

(check-sat (not b!987411) tp_is_empty!23137 (not start!84502) (not mapNonEmpty!36734) (not b!987412))
(check-sat)
