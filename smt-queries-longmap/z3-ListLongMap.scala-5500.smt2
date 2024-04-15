; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72766 () Bool)

(assert start!72766)

(declare-fun b!844458 () Bool)

(declare-fun res!573768 () Bool)

(declare-fun e!471351 () Bool)

(assert (=> b!844458 (=> (not res!573768) (not e!471351))))

(declare-datatypes ((array!47893 0))(
  ( (array!47894 (arr!22978 (Array (_ BitVec 32) (_ BitVec 64))) (size!23420 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47893)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47893 (_ BitVec 32)) Bool)

(assert (=> b!844458 (= res!573768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844459 () Bool)

(declare-fun e!471352 () Bool)

(declare-fun e!471354 () Bool)

(declare-fun mapRes!25352 () Bool)

(assert (=> b!844459 (= e!471352 (and e!471354 mapRes!25352))))

(declare-fun condMapEmpty!25352 () Bool)

(declare-datatypes ((V!26161 0))(
  ( (V!26162 (val!7965 Int)) )
))
(declare-datatypes ((ValueCell!7478 0))(
  ( (ValueCellFull!7478 (v!10384 V!26161)) (EmptyCell!7478) )
))
(declare-datatypes ((array!47895 0))(
  ( (array!47896 (arr!22979 (Array (_ BitVec 32) ValueCell!7478)) (size!23421 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47895)

(declare-fun mapDefault!25352 () ValueCell!7478)

(assert (=> b!844459 (= condMapEmpty!25352 (= (arr!22979 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7478)) mapDefault!25352)))))

(declare-fun mapNonEmpty!25352 () Bool)

(declare-fun tp!48671 () Bool)

(declare-fun e!471353 () Bool)

(assert (=> mapNonEmpty!25352 (= mapRes!25352 (and tp!48671 e!471353))))

(declare-fun mapRest!25352 () (Array (_ BitVec 32) ValueCell!7478))

(declare-fun mapValue!25352 () ValueCell!7478)

(declare-fun mapKey!25352 () (_ BitVec 32))

(assert (=> mapNonEmpty!25352 (= (arr!22979 _values!688) (store mapRest!25352 mapKey!25352 mapValue!25352))))

(declare-fun mapIsEmpty!25352 () Bool)

(assert (=> mapIsEmpty!25352 mapRes!25352))

(declare-fun b!844461 () Bool)

(declare-fun res!573770 () Bool)

(assert (=> b!844461 (=> (not res!573770) (not e!471351))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844461 (= res!573770 (and (= (size!23421 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23420 _keys!868) (size!23421 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!573771 () Bool)

(assert (=> start!72766 (=> (not res!573771) (not e!471351))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72766 (= res!573771 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23420 _keys!868))))))

(assert (=> start!72766 e!471351))

(assert (=> start!72766 true))

(declare-fun array_inv!18336 (array!47893) Bool)

(assert (=> start!72766 (array_inv!18336 _keys!868)))

(declare-fun array_inv!18337 (array!47895) Bool)

(assert (=> start!72766 (and (array_inv!18337 _values!688) e!471352)))

(declare-fun b!844460 () Bool)

(declare-fun res!573769 () Bool)

(assert (=> b!844460 (=> (not res!573769) (not e!471351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844460 (= res!573769 (validMask!0 mask!1196))))

(declare-fun b!844462 () Bool)

(declare-fun tp_is_empty!15835 () Bool)

(assert (=> b!844462 (= e!471353 tp_is_empty!15835)))

(declare-fun b!844463 () Bool)

(assert (=> b!844463 (= e!471354 tp_is_empty!15835)))

(declare-fun b!844464 () Bool)

(assert (=> b!844464 (= e!471351 false)))

(declare-fun lt!381083 () Bool)

(declare-datatypes ((List!16294 0))(
  ( (Nil!16291) (Cons!16290 (h!17421 (_ BitVec 64)) (t!22656 List!16294)) )
))
(declare-fun arrayNoDuplicates!0 (array!47893 (_ BitVec 32) List!16294) Bool)

(assert (=> b!844464 (= lt!381083 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16291))))

(assert (= (and start!72766 res!573771) b!844460))

(assert (= (and b!844460 res!573769) b!844461))

(assert (= (and b!844461 res!573770) b!844458))

(assert (= (and b!844458 res!573768) b!844464))

(assert (= (and b!844459 condMapEmpty!25352) mapIsEmpty!25352))

(assert (= (and b!844459 (not condMapEmpty!25352)) mapNonEmpty!25352))

(get-info :version)

(assert (= (and mapNonEmpty!25352 ((_ is ValueCellFull!7478) mapValue!25352)) b!844462))

(assert (= (and b!844459 ((_ is ValueCellFull!7478) mapDefault!25352)) b!844463))

(assert (= start!72766 b!844459))

(declare-fun m!786083 () Bool)

(assert (=> b!844458 m!786083))

(declare-fun m!786085 () Bool)

(assert (=> b!844464 m!786085))

(declare-fun m!786087 () Bool)

(assert (=> start!72766 m!786087))

(declare-fun m!786089 () Bool)

(assert (=> start!72766 m!786089))

(declare-fun m!786091 () Bool)

(assert (=> mapNonEmpty!25352 m!786091))

(declare-fun m!786093 () Bool)

(assert (=> b!844460 m!786093))

(check-sat (not mapNonEmpty!25352) (not b!844464) (not b!844460) (not start!72766) (not b!844458) tp_is_empty!15835)
(check-sat)
