; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72802 () Bool)

(assert start!72802)

(declare-fun b!844836 () Bool)

(declare-fun res!573984 () Bool)

(declare-fun e!471620 () Bool)

(assert (=> b!844836 (=> (not res!573984) (not e!471620))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844836 (= res!573984 (validMask!0 mask!1196))))

(declare-fun b!844837 () Bool)

(declare-fun e!471622 () Bool)

(declare-fun tp_is_empty!15871 () Bool)

(assert (=> b!844837 (= e!471622 tp_is_empty!15871)))

(declare-fun mapNonEmpty!25406 () Bool)

(declare-fun mapRes!25406 () Bool)

(declare-fun tp!48725 () Bool)

(assert (=> mapNonEmpty!25406 (= mapRes!25406 (and tp!48725 e!471622))))

(declare-datatypes ((V!26209 0))(
  ( (V!26210 (val!7983 Int)) )
))
(declare-datatypes ((ValueCell!7496 0))(
  ( (ValueCellFull!7496 (v!10402 V!26209)) (EmptyCell!7496) )
))
(declare-fun mapRest!25406 () (Array (_ BitVec 32) ValueCell!7496))

(declare-fun mapKey!25406 () (_ BitVec 32))

(declare-fun mapValue!25406 () ValueCell!7496)

(declare-datatypes ((array!47965 0))(
  ( (array!47966 (arr!23014 (Array (_ BitVec 32) ValueCell!7496)) (size!23456 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47965)

(assert (=> mapNonEmpty!25406 (= (arr!23014 _values!688) (store mapRest!25406 mapKey!25406 mapValue!25406))))

(declare-fun b!844838 () Bool)

(declare-fun e!471623 () Bool)

(declare-fun e!471621 () Bool)

(assert (=> b!844838 (= e!471623 (and e!471621 mapRes!25406))))

(declare-fun condMapEmpty!25406 () Bool)

(declare-fun mapDefault!25406 () ValueCell!7496)

(assert (=> b!844838 (= condMapEmpty!25406 (= (arr!23014 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7496)) mapDefault!25406)))))

(declare-fun b!844840 () Bool)

(declare-fun res!573987 () Bool)

(assert (=> b!844840 (=> (not res!573987) (not e!471620))))

(declare-datatypes ((array!47967 0))(
  ( (array!47968 (arr!23015 (Array (_ BitVec 32) (_ BitVec 64))) (size!23457 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47967)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47967 (_ BitVec 32)) Bool)

(assert (=> b!844840 (= res!573987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573985 () Bool)

(assert (=> start!72802 (=> (not res!573985) (not e!471620))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72802 (= res!573985 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23457 _keys!868))))))

(assert (=> start!72802 e!471620))

(assert (=> start!72802 true))

(declare-fun array_inv!18360 (array!47967) Bool)

(assert (=> start!72802 (array_inv!18360 _keys!868)))

(declare-fun array_inv!18361 (array!47965) Bool)

(assert (=> start!72802 (and (array_inv!18361 _values!688) e!471623)))

(declare-fun b!844839 () Bool)

(declare-fun res!573986 () Bool)

(assert (=> b!844839 (=> (not res!573986) (not e!471620))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844839 (= res!573986 (and (= (size!23456 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23457 _keys!868) (size!23456 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844841 () Bool)

(assert (=> b!844841 (= e!471620 false)))

(declare-fun lt!381137 () Bool)

(declare-datatypes ((List!16311 0))(
  ( (Nil!16308) (Cons!16307 (h!17438 (_ BitVec 64)) (t!22673 List!16311)) )
))
(declare-fun arrayNoDuplicates!0 (array!47967 (_ BitVec 32) List!16311) Bool)

(assert (=> b!844841 (= lt!381137 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16308))))

(declare-fun mapIsEmpty!25406 () Bool)

(assert (=> mapIsEmpty!25406 mapRes!25406))

(declare-fun b!844842 () Bool)

(assert (=> b!844842 (= e!471621 tp_is_empty!15871)))

(assert (= (and start!72802 res!573985) b!844836))

(assert (= (and b!844836 res!573984) b!844839))

(assert (= (and b!844839 res!573986) b!844840))

(assert (= (and b!844840 res!573987) b!844841))

(assert (= (and b!844838 condMapEmpty!25406) mapIsEmpty!25406))

(assert (= (and b!844838 (not condMapEmpty!25406)) mapNonEmpty!25406))

(get-info :version)

(assert (= (and mapNonEmpty!25406 ((_ is ValueCellFull!7496) mapValue!25406)) b!844837))

(assert (= (and b!844838 ((_ is ValueCellFull!7496) mapDefault!25406)) b!844842))

(assert (= start!72802 b!844838))

(declare-fun m!786299 () Bool)

(assert (=> b!844840 m!786299))

(declare-fun m!786301 () Bool)

(assert (=> b!844841 m!786301))

(declare-fun m!786303 () Bool)

(assert (=> start!72802 m!786303))

(declare-fun m!786305 () Bool)

(assert (=> start!72802 m!786305))

(declare-fun m!786307 () Bool)

(assert (=> mapNonEmpty!25406 m!786307))

(declare-fun m!786309 () Bool)

(assert (=> b!844836 m!786309))

(check-sat (not b!844836) tp_is_empty!15871 (not b!844840) (not mapNonEmpty!25406) (not start!72802) (not b!844841))
(check-sat)
