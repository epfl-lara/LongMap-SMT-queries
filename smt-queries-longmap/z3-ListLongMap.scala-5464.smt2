; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72736 () Bool)

(assert start!72736)

(declare-fun b!843332 () Bool)

(declare-fun e!470463 () Bool)

(declare-fun tp_is_empty!15619 () Bool)

(assert (=> b!843332 (= e!470463 tp_is_empty!15619)))

(declare-fun b!843333 () Bool)

(declare-fun e!470464 () Bool)

(assert (=> b!843333 (= e!470464 false)))

(declare-fun lt!381356 () Bool)

(declare-datatypes ((array!47531 0))(
  ( (array!47532 (arr!22792 (Array (_ BitVec 32) (_ BitVec 64))) (size!23233 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47531)

(declare-datatypes ((List!16134 0))(
  ( (Nil!16131) (Cons!16130 (h!17267 (_ BitVec 64)) (t!22497 List!16134)) )
))
(declare-fun arrayNoDuplicates!0 (array!47531 (_ BitVec 32) List!16134) Bool)

(assert (=> b!843333 (= lt!381356 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16131))))

(declare-fun b!843334 () Bool)

(declare-fun e!470461 () Bool)

(assert (=> b!843334 (= e!470461 tp_is_empty!15619)))

(declare-fun b!843335 () Bool)

(declare-fun res!572927 () Bool)

(assert (=> b!843335 (=> (not res!572927) (not e!470464))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47531 (_ BitVec 32)) Bool)

(assert (=> b!843335 (= res!572927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25028 () Bool)

(declare-fun mapRes!25028 () Bool)

(assert (=> mapIsEmpty!25028 mapRes!25028))

(declare-fun b!843336 () Bool)

(declare-fun res!572929 () Bool)

(assert (=> b!843336 (=> (not res!572929) (not e!470464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843336 (= res!572929 (validMask!0 mask!1196))))

(declare-fun b!843337 () Bool)

(declare-fun res!572926 () Bool)

(assert (=> b!843337 (=> (not res!572926) (not e!470464))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25873 0))(
  ( (V!25874 (val!7857 Int)) )
))
(declare-datatypes ((ValueCell!7370 0))(
  ( (ValueCellFull!7370 (v!10282 V!25873)) (EmptyCell!7370) )
))
(declare-datatypes ((array!47533 0))(
  ( (array!47534 (arr!22793 (Array (_ BitVec 32) ValueCell!7370)) (size!23234 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47533)

(assert (=> b!843337 (= res!572926 (and (= (size!23234 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23233 _keys!868) (size!23234 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843338 () Bool)

(declare-fun e!470460 () Bool)

(assert (=> b!843338 (= e!470460 (and e!470461 mapRes!25028))))

(declare-fun condMapEmpty!25028 () Bool)

(declare-fun mapDefault!25028 () ValueCell!7370)

(assert (=> b!843338 (= condMapEmpty!25028 (= (arr!22793 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7370)) mapDefault!25028)))))

(declare-fun res!572928 () Bool)

(assert (=> start!72736 (=> (not res!572928) (not e!470464))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72736 (= res!572928 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23233 _keys!868))))))

(assert (=> start!72736 e!470464))

(assert (=> start!72736 true))

(declare-fun array_inv!18184 (array!47531) Bool)

(assert (=> start!72736 (array_inv!18184 _keys!868)))

(declare-fun array_inv!18185 (array!47533) Bool)

(assert (=> start!72736 (and (array_inv!18185 _values!688) e!470460)))

(declare-fun mapNonEmpty!25028 () Bool)

(declare-fun tp!48347 () Bool)

(assert (=> mapNonEmpty!25028 (= mapRes!25028 (and tp!48347 e!470463))))

(declare-fun mapValue!25028 () ValueCell!7370)

(declare-fun mapKey!25028 () (_ BitVec 32))

(declare-fun mapRest!25028 () (Array (_ BitVec 32) ValueCell!7370))

(assert (=> mapNonEmpty!25028 (= (arr!22793 _values!688) (store mapRest!25028 mapKey!25028 mapValue!25028))))

(assert (= (and start!72736 res!572928) b!843336))

(assert (= (and b!843336 res!572929) b!843337))

(assert (= (and b!843337 res!572926) b!843335))

(assert (= (and b!843335 res!572927) b!843333))

(assert (= (and b!843338 condMapEmpty!25028) mapIsEmpty!25028))

(assert (= (and b!843338 (not condMapEmpty!25028)) mapNonEmpty!25028))

(get-info :version)

(assert (= (and mapNonEmpty!25028 ((_ is ValueCellFull!7370) mapValue!25028)) b!843332))

(assert (= (and b!843338 ((_ is ValueCellFull!7370) mapDefault!25028)) b!843334))

(assert (= start!72736 b!843338))

(declare-fun m!786833 () Bool)

(assert (=> mapNonEmpty!25028 m!786833))

(declare-fun m!786835 () Bool)

(assert (=> b!843333 m!786835))

(declare-fun m!786837 () Bool)

(assert (=> b!843335 m!786837))

(declare-fun m!786839 () Bool)

(assert (=> b!843336 m!786839))

(declare-fun m!786841 () Bool)

(assert (=> start!72736 m!786841))

(declare-fun m!786843 () Bool)

(assert (=> start!72736 m!786843))

(check-sat tp_is_empty!15619 (not mapNonEmpty!25028) (not b!843333) (not b!843335) (not start!72736) (not b!843336))
(check-sat)
