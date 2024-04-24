; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72766 () Bool)

(assert start!72766)

(declare-fun b!843647 () Bool)

(declare-fun e!470685 () Bool)

(declare-fun tp_is_empty!15649 () Bool)

(assert (=> b!843647 (= e!470685 tp_is_empty!15649)))

(declare-fun b!843648 () Bool)

(declare-fun e!470686 () Bool)

(assert (=> b!843648 (= e!470686 tp_is_empty!15649)))

(declare-fun b!843650 () Bool)

(declare-fun res!573109 () Bool)

(declare-fun e!470689 () Bool)

(assert (=> b!843650 (=> (not res!573109) (not e!470689))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843650 (= res!573109 (validMask!0 mask!1196))))

(declare-fun b!843651 () Bool)

(declare-fun e!470687 () Bool)

(declare-fun mapRes!25073 () Bool)

(assert (=> b!843651 (= e!470687 (and e!470685 mapRes!25073))))

(declare-fun condMapEmpty!25073 () Bool)

(declare-datatypes ((V!25913 0))(
  ( (V!25914 (val!7872 Int)) )
))
(declare-datatypes ((ValueCell!7385 0))(
  ( (ValueCellFull!7385 (v!10297 V!25913)) (EmptyCell!7385) )
))
(declare-datatypes ((array!47589 0))(
  ( (array!47590 (arr!22821 (Array (_ BitVec 32) ValueCell!7385)) (size!23262 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47589)

(declare-fun mapDefault!25073 () ValueCell!7385)

(assert (=> b!843651 (= condMapEmpty!25073 (= (arr!22821 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7385)) mapDefault!25073)))))

(declare-fun mapNonEmpty!25073 () Bool)

(declare-fun tp!48392 () Bool)

(assert (=> mapNonEmpty!25073 (= mapRes!25073 (and tp!48392 e!470686))))

(declare-fun mapValue!25073 () ValueCell!7385)

(declare-fun mapKey!25073 () (_ BitVec 32))

(declare-fun mapRest!25073 () (Array (_ BitVec 32) ValueCell!7385))

(assert (=> mapNonEmpty!25073 (= (arr!22821 _values!688) (store mapRest!25073 mapKey!25073 mapValue!25073))))

(declare-fun mapIsEmpty!25073 () Bool)

(assert (=> mapIsEmpty!25073 mapRes!25073))

(declare-fun b!843649 () Bool)

(assert (=> b!843649 (= e!470689 false)))

(declare-fun lt!381401 () Bool)

(declare-datatypes ((array!47591 0))(
  ( (array!47592 (arr!22822 (Array (_ BitVec 32) (_ BitVec 64))) (size!23263 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47591)

(declare-datatypes ((List!16146 0))(
  ( (Nil!16143) (Cons!16142 (h!17279 (_ BitVec 64)) (t!22509 List!16146)) )
))
(declare-fun arrayNoDuplicates!0 (array!47591 (_ BitVec 32) List!16146) Bool)

(assert (=> b!843649 (= lt!381401 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16143))))

(declare-fun res!573108 () Bool)

(assert (=> start!72766 (=> (not res!573108) (not e!470689))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72766 (= res!573108 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23263 _keys!868))))))

(assert (=> start!72766 e!470689))

(assert (=> start!72766 true))

(declare-fun array_inv!18206 (array!47591) Bool)

(assert (=> start!72766 (array_inv!18206 _keys!868)))

(declare-fun array_inv!18207 (array!47589) Bool)

(assert (=> start!72766 (and (array_inv!18207 _values!688) e!470687)))

(declare-fun b!843652 () Bool)

(declare-fun res!573107 () Bool)

(assert (=> b!843652 (=> (not res!573107) (not e!470689))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843652 (= res!573107 (and (= (size!23262 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23263 _keys!868) (size!23262 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843653 () Bool)

(declare-fun res!573106 () Bool)

(assert (=> b!843653 (=> (not res!573106) (not e!470689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47591 (_ BitVec 32)) Bool)

(assert (=> b!843653 (= res!573106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72766 res!573108) b!843650))

(assert (= (and b!843650 res!573109) b!843652))

(assert (= (and b!843652 res!573107) b!843653))

(assert (= (and b!843653 res!573106) b!843649))

(assert (= (and b!843651 condMapEmpty!25073) mapIsEmpty!25073))

(assert (= (and b!843651 (not condMapEmpty!25073)) mapNonEmpty!25073))

(get-info :version)

(assert (= (and mapNonEmpty!25073 ((_ is ValueCellFull!7385) mapValue!25073)) b!843648))

(assert (= (and b!843651 ((_ is ValueCellFull!7385) mapDefault!25073)) b!843647))

(assert (= start!72766 b!843651))

(declare-fun m!787013 () Bool)

(assert (=> mapNonEmpty!25073 m!787013))

(declare-fun m!787015 () Bool)

(assert (=> b!843649 m!787015))

(declare-fun m!787017 () Bool)

(assert (=> b!843650 m!787017))

(declare-fun m!787019 () Bool)

(assert (=> b!843653 m!787019))

(declare-fun m!787021 () Bool)

(assert (=> start!72766 m!787021))

(declare-fun m!787023 () Bool)

(assert (=> start!72766 m!787023))

(check-sat (not mapNonEmpty!25073) (not start!72766) (not b!843650) (not b!843653) (not b!843649) tp_is_empty!15649)
(check-sat)
