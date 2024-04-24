; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72460 () Bool)

(assert start!72460)

(declare-fun res!569976 () Bool)

(declare-fun e!468069 () Bool)

(assert (=> start!72460 (=> (not res!569976) (not e!468069))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!46985 0))(
  ( (array!46986 (arr!22519 (Array (_ BitVec 32) (_ BitVec 64))) (size!22960 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46985)

(assert (=> start!72460 (= res!569976 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22960 _keys!868))))))

(assert (=> start!72460 e!468069))

(assert (=> start!72460 true))

(declare-fun array_inv!17992 (array!46985) Bool)

(assert (=> start!72460 (array_inv!17992 _keys!868)))

(declare-datatypes ((V!25505 0))(
  ( (V!25506 (val!7719 Int)) )
))
(declare-datatypes ((ValueCell!7232 0))(
  ( (ValueCellFull!7232 (v!10144 V!25505)) (EmptyCell!7232) )
))
(declare-datatypes ((array!46987 0))(
  ( (array!46988 (arr!22520 (Array (_ BitVec 32) ValueCell!7232)) (size!22961 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46987)

(declare-fun e!468066 () Bool)

(declare-fun array_inv!17993 (array!46987) Bool)

(assert (=> start!72460 (and (array_inv!17993 _values!688) e!468066)))

(declare-fun b!838490 () Bool)

(declare-fun e!468070 () Bool)

(declare-fun tp_is_empty!15343 () Bool)

(assert (=> b!838490 (= e!468070 tp_is_empty!15343)))

(declare-fun mapIsEmpty!24614 () Bool)

(declare-fun mapRes!24614 () Bool)

(assert (=> mapIsEmpty!24614 mapRes!24614))

(declare-fun b!838491 () Bool)

(declare-fun e!468067 () Bool)

(assert (=> b!838491 (= e!468066 (and e!468067 mapRes!24614))))

(declare-fun condMapEmpty!24614 () Bool)

(declare-fun mapDefault!24614 () ValueCell!7232)

(assert (=> b!838491 (= condMapEmpty!24614 (= (arr!22520 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7232)) mapDefault!24614)))))

(declare-fun b!838492 () Bool)

(assert (=> b!838492 (= e!468069 false)))

(declare-fun lt!380942 () Bool)

(declare-datatypes ((List!15936 0))(
  ( (Nil!15933) (Cons!15932 (h!17069 (_ BitVec 64)) (t!22299 List!15936)) )
))
(declare-fun arrayNoDuplicates!0 (array!46985 (_ BitVec 32) List!15936) Bool)

(assert (=> b!838492 (= lt!380942 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15933))))

(declare-fun b!838493 () Bool)

(declare-fun res!569977 () Bool)

(assert (=> b!838493 (=> (not res!569977) (not e!468069))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!838493 (= res!569977 (and (= (size!22961 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22960 _keys!868) (size!22961 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838494 () Bool)

(declare-fun res!569975 () Bool)

(assert (=> b!838494 (=> (not res!569975) (not e!468069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838494 (= res!569975 (validMask!0 mask!1196))))

(declare-fun b!838495 () Bool)

(declare-fun res!569974 () Bool)

(assert (=> b!838495 (=> (not res!569974) (not e!468069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46985 (_ BitVec 32)) Bool)

(assert (=> b!838495 (= res!569974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24614 () Bool)

(declare-fun tp!47609 () Bool)

(assert (=> mapNonEmpty!24614 (= mapRes!24614 (and tp!47609 e!468070))))

(declare-fun mapKey!24614 () (_ BitVec 32))

(declare-fun mapRest!24614 () (Array (_ BitVec 32) ValueCell!7232))

(declare-fun mapValue!24614 () ValueCell!7232)

(assert (=> mapNonEmpty!24614 (= (arr!22520 _values!688) (store mapRest!24614 mapKey!24614 mapValue!24614))))

(declare-fun b!838496 () Bool)

(assert (=> b!838496 (= e!468067 tp_is_empty!15343)))

(assert (= (and start!72460 res!569976) b!838494))

(assert (= (and b!838494 res!569975) b!838493))

(assert (= (and b!838493 res!569977) b!838495))

(assert (= (and b!838495 res!569974) b!838492))

(assert (= (and b!838491 condMapEmpty!24614) mapIsEmpty!24614))

(assert (= (and b!838491 (not condMapEmpty!24614)) mapNonEmpty!24614))

(get-info :version)

(assert (= (and mapNonEmpty!24614 ((_ is ValueCellFull!7232) mapValue!24614)) b!838490))

(assert (= (and b!838491 ((_ is ValueCellFull!7232) mapDefault!24614)) b!838496))

(assert (= start!72460 b!838491))

(declare-fun m!783665 () Bool)

(assert (=> b!838492 m!783665))

(declare-fun m!783667 () Bool)

(assert (=> mapNonEmpty!24614 m!783667))

(declare-fun m!783669 () Bool)

(assert (=> b!838494 m!783669))

(declare-fun m!783671 () Bool)

(assert (=> start!72460 m!783671))

(declare-fun m!783673 () Bool)

(assert (=> start!72460 m!783673))

(declare-fun m!783675 () Bool)

(assert (=> b!838495 m!783675))

(check-sat tp_is_empty!15343 (not b!838492) (not start!72460) (not b!838495) (not b!838494) (not mapNonEmpty!24614))
(check-sat)
