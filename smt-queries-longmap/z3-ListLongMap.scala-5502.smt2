; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72964 () Bool)

(assert start!72964)

(declare-fun b!845726 () Bool)

(declare-fun e!472172 () Bool)

(declare-fun tp_is_empty!15847 () Bool)

(assert (=> b!845726 (= e!472172 tp_is_empty!15847)))

(declare-fun b!845727 () Bool)

(declare-fun res!574295 () Bool)

(declare-fun e!472173 () Bool)

(assert (=> b!845727 (=> (not res!574295) (not e!472173))))

(declare-datatypes ((array!47963 0))(
  ( (array!47964 (arr!23008 (Array (_ BitVec 32) (_ BitVec 64))) (size!23449 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47963)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47963 (_ BitVec 32)) Bool)

(assert (=> b!845727 (= res!574295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845728 () Bool)

(declare-fun e!472171 () Bool)

(assert (=> b!845728 (= e!472171 tp_is_empty!15847)))

(declare-fun b!845729 () Bool)

(assert (=> b!845729 (= e!472173 false)))

(declare-fun lt!381698 () Bool)

(declare-datatypes ((List!16213 0))(
  ( (Nil!16210) (Cons!16209 (h!17346 (_ BitVec 64)) (t!22576 List!16213)) )
))
(declare-fun arrayNoDuplicates!0 (array!47963 (_ BitVec 32) List!16213) Bool)

(assert (=> b!845729 (= lt!381698 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16210))))

(declare-fun b!845730 () Bool)

(declare-fun e!472170 () Bool)

(declare-fun mapRes!25370 () Bool)

(assert (=> b!845730 (= e!472170 (and e!472171 mapRes!25370))))

(declare-fun condMapEmpty!25370 () Bool)

(declare-datatypes ((V!26177 0))(
  ( (V!26178 (val!7971 Int)) )
))
(declare-datatypes ((ValueCell!7484 0))(
  ( (ValueCellFull!7484 (v!10396 V!26177)) (EmptyCell!7484) )
))
(declare-datatypes ((array!47965 0))(
  ( (array!47966 (arr!23009 (Array (_ BitVec 32) ValueCell!7484)) (size!23450 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47965)

(declare-fun mapDefault!25370 () ValueCell!7484)

(assert (=> b!845730 (= condMapEmpty!25370 (= (arr!23009 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7484)) mapDefault!25370)))))

(declare-fun b!845731 () Bool)

(declare-fun res!574296 () Bool)

(assert (=> b!845731 (=> (not res!574296) (not e!472173))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845731 (= res!574296 (and (= (size!23450 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23449 _keys!868) (size!23450 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25370 () Bool)

(assert (=> mapIsEmpty!25370 mapRes!25370))

(declare-fun res!574297 () Bool)

(assert (=> start!72964 (=> (not res!574297) (not e!472173))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72964 (= res!574297 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23449 _keys!868))))))

(assert (=> start!72964 e!472173))

(assert (=> start!72964 true))

(declare-fun array_inv!18340 (array!47963) Bool)

(assert (=> start!72964 (array_inv!18340 _keys!868)))

(declare-fun array_inv!18341 (array!47965) Bool)

(assert (=> start!72964 (and (array_inv!18341 _values!688) e!472170)))

(declare-fun mapNonEmpty!25370 () Bool)

(declare-fun tp!48689 () Bool)

(assert (=> mapNonEmpty!25370 (= mapRes!25370 (and tp!48689 e!472172))))

(declare-fun mapKey!25370 () (_ BitVec 32))

(declare-fun mapValue!25370 () ValueCell!7484)

(declare-fun mapRest!25370 () (Array (_ BitVec 32) ValueCell!7484))

(assert (=> mapNonEmpty!25370 (= (arr!23009 _values!688) (store mapRest!25370 mapKey!25370 mapValue!25370))))

(declare-fun b!845732 () Bool)

(declare-fun res!574294 () Bool)

(assert (=> b!845732 (=> (not res!574294) (not e!472173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845732 (= res!574294 (validMask!0 mask!1196))))

(assert (= (and start!72964 res!574297) b!845732))

(assert (= (and b!845732 res!574294) b!845731))

(assert (= (and b!845731 res!574296) b!845727))

(assert (= (and b!845727 res!574295) b!845729))

(assert (= (and b!845730 condMapEmpty!25370) mapIsEmpty!25370))

(assert (= (and b!845730 (not condMapEmpty!25370)) mapNonEmpty!25370))

(get-info :version)

(assert (= (and mapNonEmpty!25370 ((_ is ValueCellFull!7484) mapValue!25370)) b!845726))

(assert (= (and b!845730 ((_ is ValueCellFull!7484) mapDefault!25370)) b!845728))

(assert (= start!72964 b!845730))

(declare-fun m!788201 () Bool)

(assert (=> start!72964 m!788201))

(declare-fun m!788203 () Bool)

(assert (=> start!72964 m!788203))

(declare-fun m!788205 () Bool)

(assert (=> b!845732 m!788205))

(declare-fun m!788207 () Bool)

(assert (=> b!845729 m!788207))

(declare-fun m!788209 () Bool)

(assert (=> b!845727 m!788209))

(declare-fun m!788211 () Bool)

(assert (=> mapNonEmpty!25370 m!788211))

(check-sat tp_is_empty!15847 (not b!845727) (not b!845729) (not mapNonEmpty!25370) (not b!845732) (not start!72964))
(check-sat)
