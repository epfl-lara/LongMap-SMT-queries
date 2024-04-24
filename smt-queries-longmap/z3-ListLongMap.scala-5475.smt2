; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72802 () Bool)

(assert start!72802)

(declare-fun b!844025 () Bool)

(declare-fun e!470956 () Bool)

(declare-fun e!470958 () Bool)

(declare-fun mapRes!25127 () Bool)

(assert (=> b!844025 (= e!470956 (and e!470958 mapRes!25127))))

(declare-fun condMapEmpty!25127 () Bool)

(declare-datatypes ((V!25961 0))(
  ( (V!25962 (val!7890 Int)) )
))
(declare-datatypes ((ValueCell!7403 0))(
  ( (ValueCellFull!7403 (v!10315 V!25961)) (EmptyCell!7403) )
))
(declare-datatypes ((array!47655 0))(
  ( (array!47656 (arr!22854 (Array (_ BitVec 32) ValueCell!7403)) (size!23295 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47655)

(declare-fun mapDefault!25127 () ValueCell!7403)

(assert (=> b!844025 (= condMapEmpty!25127 (= (arr!22854 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7403)) mapDefault!25127)))))

(declare-fun mapIsEmpty!25127 () Bool)

(assert (=> mapIsEmpty!25127 mapRes!25127))

(declare-fun b!844026 () Bool)

(declare-fun e!470955 () Bool)

(declare-fun tp_is_empty!15685 () Bool)

(assert (=> b!844026 (= e!470955 tp_is_empty!15685)))

(declare-fun b!844027 () Bool)

(declare-fun res!573325 () Bool)

(declare-fun e!470959 () Bool)

(assert (=> b!844027 (=> (not res!573325) (not e!470959))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844027 (= res!573325 (validMask!0 mask!1196))))

(declare-fun b!844028 () Bool)

(declare-fun res!573323 () Bool)

(assert (=> b!844028 (=> (not res!573323) (not e!470959))))

(declare-datatypes ((array!47657 0))(
  ( (array!47658 (arr!22855 (Array (_ BitVec 32) (_ BitVec 64))) (size!23296 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47657)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47657 (_ BitVec 32)) Bool)

(assert (=> b!844028 (= res!573323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25127 () Bool)

(declare-fun tp!48446 () Bool)

(assert (=> mapNonEmpty!25127 (= mapRes!25127 (and tp!48446 e!470955))))

(declare-fun mapKey!25127 () (_ BitVec 32))

(declare-fun mapRest!25127 () (Array (_ BitVec 32) ValueCell!7403))

(declare-fun mapValue!25127 () ValueCell!7403)

(assert (=> mapNonEmpty!25127 (= (arr!22854 _values!688) (store mapRest!25127 mapKey!25127 mapValue!25127))))

(declare-fun b!844029 () Bool)

(assert (=> b!844029 (= e!470958 tp_is_empty!15685)))

(declare-fun b!844030 () Bool)

(declare-fun res!573324 () Bool)

(assert (=> b!844030 (=> (not res!573324) (not e!470959))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844030 (= res!573324 (and (= (size!23295 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23296 _keys!868) (size!23295 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844031 () Bool)

(assert (=> b!844031 (= e!470959 false)))

(declare-fun lt!381455 () Bool)

(declare-datatypes ((List!16157 0))(
  ( (Nil!16154) (Cons!16153 (h!17290 (_ BitVec 64)) (t!22520 List!16157)) )
))
(declare-fun arrayNoDuplicates!0 (array!47657 (_ BitVec 32) List!16157) Bool)

(assert (=> b!844031 (= lt!381455 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16154))))

(declare-fun res!573322 () Bool)

(assert (=> start!72802 (=> (not res!573322) (not e!470959))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72802 (= res!573322 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23296 _keys!868))))))

(assert (=> start!72802 e!470959))

(assert (=> start!72802 true))

(declare-fun array_inv!18230 (array!47657) Bool)

(assert (=> start!72802 (array_inv!18230 _keys!868)))

(declare-fun array_inv!18231 (array!47655) Bool)

(assert (=> start!72802 (and (array_inv!18231 _values!688) e!470956)))

(assert (= (and start!72802 res!573322) b!844027))

(assert (= (and b!844027 res!573325) b!844030))

(assert (= (and b!844030 res!573324) b!844028))

(assert (= (and b!844028 res!573323) b!844031))

(assert (= (and b!844025 condMapEmpty!25127) mapIsEmpty!25127))

(assert (= (and b!844025 (not condMapEmpty!25127)) mapNonEmpty!25127))

(get-info :version)

(assert (= (and mapNonEmpty!25127 ((_ is ValueCellFull!7403) mapValue!25127)) b!844026))

(assert (= (and b!844025 ((_ is ValueCellFull!7403) mapDefault!25127)) b!844029))

(assert (= start!72802 b!844025))

(declare-fun m!787229 () Bool)

(assert (=> b!844028 m!787229))

(declare-fun m!787231 () Bool)

(assert (=> b!844027 m!787231))

(declare-fun m!787233 () Bool)

(assert (=> start!72802 m!787233))

(declare-fun m!787235 () Bool)

(assert (=> start!72802 m!787235))

(declare-fun m!787237 () Bool)

(assert (=> b!844031 m!787237))

(declare-fun m!787239 () Bool)

(assert (=> mapNonEmpty!25127 m!787239))

(check-sat (not mapNonEmpty!25127) (not b!844031) (not start!72802) (not b!844027) (not b!844028) tp_is_empty!15685)
(check-sat)
