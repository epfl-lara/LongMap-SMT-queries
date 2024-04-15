; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72274 () Bool)

(assert start!72274)

(declare-fun mapIsEmpty!24614 () Bool)

(declare-fun mapRes!24614 () Bool)

(assert (=> mapIsEmpty!24614 mapRes!24614))

(declare-fun b!837348 () Bool)

(declare-fun e!467336 () Bool)

(declare-fun tp_is_empty!15343 () Bool)

(assert (=> b!837348 (= e!467336 tp_is_empty!15343)))

(declare-fun b!837349 () Bool)

(declare-fun e!467337 () Bool)

(assert (=> b!837349 (= e!467337 tp_is_empty!15343)))

(declare-fun res!569523 () Bool)

(declare-fun e!467338 () Bool)

(assert (=> start!72274 (=> (not res!569523) (not e!467338))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!46953 0))(
  ( (array!46954 (arr!22508 (Array (_ BitVec 32) (_ BitVec 64))) (size!22950 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46953)

(assert (=> start!72274 (= res!569523 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22950 _keys!868))))))

(assert (=> start!72274 e!467338))

(assert (=> start!72274 true))

(declare-fun array_inv!18006 (array!46953) Bool)

(assert (=> start!72274 (array_inv!18006 _keys!868)))

(declare-datatypes ((V!25505 0))(
  ( (V!25506 (val!7719 Int)) )
))
(declare-datatypes ((ValueCell!7232 0))(
  ( (ValueCellFull!7232 (v!10138 V!25505)) (EmptyCell!7232) )
))
(declare-datatypes ((array!46955 0))(
  ( (array!46956 (arr!22509 (Array (_ BitVec 32) ValueCell!7232)) (size!22951 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46955)

(declare-fun e!467339 () Bool)

(declare-fun array_inv!18007 (array!46955) Bool)

(assert (=> start!72274 (and (array_inv!18007 _values!688) e!467339)))

(declare-fun b!837350 () Bool)

(assert (=> b!837350 (= e!467339 (and e!467337 mapRes!24614))))

(declare-fun condMapEmpty!24614 () Bool)

(declare-fun mapDefault!24614 () ValueCell!7232)

(assert (=> b!837350 (= condMapEmpty!24614 (= (arr!22509 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7232)) mapDefault!24614)))))

(declare-fun b!837351 () Bool)

(assert (=> b!837351 (= e!467338 false)))

(declare-fun lt!380345 () Bool)

(declare-datatypes ((List!16031 0))(
  ( (Nil!16028) (Cons!16027 (h!17158 (_ BitVec 64)) (t!22393 List!16031)) )
))
(declare-fun arrayNoDuplicates!0 (array!46953 (_ BitVec 32) List!16031) Bool)

(assert (=> b!837351 (= lt!380345 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16028))))

(declare-fun b!837352 () Bool)

(declare-fun res!569522 () Bool)

(assert (=> b!837352 (=> (not res!569522) (not e!467338))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!837352 (= res!569522 (and (= (size!22951 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22950 _keys!868) (size!22951 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837353 () Bool)

(declare-fun res!569521 () Bool)

(assert (=> b!837353 (=> (not res!569521) (not e!467338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837353 (= res!569521 (validMask!0 mask!1196))))

(declare-fun b!837354 () Bool)

(declare-fun res!569520 () Bool)

(assert (=> b!837354 (=> (not res!569520) (not e!467338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46953 (_ BitVec 32)) Bool)

(assert (=> b!837354 (= res!569520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24614 () Bool)

(declare-fun tp!47609 () Bool)

(assert (=> mapNonEmpty!24614 (= mapRes!24614 (and tp!47609 e!467336))))

(declare-fun mapRest!24614 () (Array (_ BitVec 32) ValueCell!7232))

(declare-fun mapValue!24614 () ValueCell!7232)

(declare-fun mapKey!24614 () (_ BitVec 32))

(assert (=> mapNonEmpty!24614 (= (arr!22509 _values!688) (store mapRest!24614 mapKey!24614 mapValue!24614))))

(assert (= (and start!72274 res!569523) b!837353))

(assert (= (and b!837353 res!569521) b!837352))

(assert (= (and b!837352 res!569522) b!837354))

(assert (= (and b!837354 res!569520) b!837351))

(assert (= (and b!837350 condMapEmpty!24614) mapIsEmpty!24614))

(assert (= (and b!837350 (not condMapEmpty!24614)) mapNonEmpty!24614))

(get-info :version)

(assert (= (and mapNonEmpty!24614 ((_ is ValueCellFull!7232) mapValue!24614)) b!837348))

(assert (= (and b!837350 ((_ is ValueCellFull!7232) mapDefault!24614)) b!837349))

(assert (= start!72274 b!837350))

(declare-fun m!781619 () Bool)

(assert (=> b!837354 m!781619))

(declare-fun m!781621 () Bool)

(assert (=> start!72274 m!781621))

(declare-fun m!781623 () Bool)

(assert (=> start!72274 m!781623))

(declare-fun m!781625 () Bool)

(assert (=> b!837353 m!781625))

(declare-fun m!781627 () Bool)

(assert (=> mapNonEmpty!24614 m!781627))

(declare-fun m!781629 () Bool)

(assert (=> b!837351 m!781629))

(check-sat (not b!837351) (not start!72274) (not b!837354) tp_is_empty!15343 (not mapNonEmpty!24614) (not b!837353))
(check-sat)
