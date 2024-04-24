; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72388 () Bool)

(assert start!72388)

(declare-fun b!837933 () Bool)

(declare-fun res!569649 () Bool)

(declare-fun e!467681 () Bool)

(assert (=> b!837933 (=> (not res!569649) (not e!467681))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!46897 0))(
  ( (array!46898 (arr!22478 (Array (_ BitVec 32) (_ BitVec 64))) (size!22919 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46897)

(declare-datatypes ((V!25449 0))(
  ( (V!25450 (val!7698 Int)) )
))
(declare-datatypes ((ValueCell!7211 0))(
  ( (ValueCellFull!7211 (v!10122 V!25449)) (EmptyCell!7211) )
))
(declare-datatypes ((array!46899 0))(
  ( (array!46900 (arr!22479 (Array (_ BitVec 32) ValueCell!7211)) (size!22920 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46899)

(assert (=> b!837933 (= res!569649 (and (= (size!22920 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22919 _keys!868) (size!22920 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837934 () Bool)

(declare-fun e!467678 () Bool)

(declare-fun e!467679 () Bool)

(declare-fun mapRes!24542 () Bool)

(assert (=> b!837934 (= e!467678 (and e!467679 mapRes!24542))))

(declare-fun condMapEmpty!24542 () Bool)

(declare-fun mapDefault!24542 () ValueCell!7211)

(assert (=> b!837934 (= condMapEmpty!24542 (= (arr!22479 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7211)) mapDefault!24542)))))

(declare-fun b!837935 () Bool)

(declare-fun res!569648 () Bool)

(assert (=> b!837935 (=> (not res!569648) (not e!467681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46897 (_ BitVec 32)) Bool)

(assert (=> b!837935 (= res!569648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837936 () Bool)

(declare-fun e!467680 () Bool)

(declare-fun tp_is_empty!15301 () Bool)

(assert (=> b!837936 (= e!467680 tp_is_empty!15301)))

(declare-fun b!837937 () Bool)

(assert (=> b!837937 (= e!467679 tp_is_empty!15301)))

(declare-fun res!569650 () Bool)

(assert (=> start!72388 (=> (not res!569650) (not e!467681))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72388 (= res!569650 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22919 _keys!868))))))

(assert (=> start!72388 e!467681))

(assert (=> start!72388 true))

(declare-fun array_inv!17960 (array!46897) Bool)

(assert (=> start!72388 (array_inv!17960 _keys!868)))

(declare-fun array_inv!17961 (array!46899) Bool)

(assert (=> start!72388 (and (array_inv!17961 _values!688) e!467678)))

(declare-fun b!837938 () Bool)

(declare-fun res!569651 () Bool)

(assert (=> b!837938 (=> (not res!569651) (not e!467681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837938 (= res!569651 (validMask!0 mask!1196))))

(declare-fun b!837939 () Bool)

(assert (=> b!837939 (= e!467681 (bvsgt #b00000000000000000000000000000000 (size!22919 _keys!868)))))

(declare-fun mapIsEmpty!24542 () Bool)

(assert (=> mapIsEmpty!24542 mapRes!24542))

(declare-fun mapNonEmpty!24542 () Bool)

(declare-fun tp!47537 () Bool)

(assert (=> mapNonEmpty!24542 (= mapRes!24542 (and tp!47537 e!467680))))

(declare-fun mapKey!24542 () (_ BitVec 32))

(declare-fun mapRest!24542 () (Array (_ BitVec 32) ValueCell!7211))

(declare-fun mapValue!24542 () ValueCell!7211)

(assert (=> mapNonEmpty!24542 (= (arr!22479 _values!688) (store mapRest!24542 mapKey!24542 mapValue!24542))))

(assert (= (and start!72388 res!569650) b!837938))

(assert (= (and b!837938 res!569651) b!837933))

(assert (= (and b!837933 res!569649) b!837935))

(assert (= (and b!837935 res!569648) b!837939))

(assert (= (and b!837934 condMapEmpty!24542) mapIsEmpty!24542))

(assert (= (and b!837934 (not condMapEmpty!24542)) mapNonEmpty!24542))

(get-info :version)

(assert (= (and mapNonEmpty!24542 ((_ is ValueCellFull!7211) mapValue!24542)) b!837936))

(assert (= (and b!837934 ((_ is ValueCellFull!7211) mapDefault!24542)) b!837937))

(assert (= start!72388 b!837934))

(declare-fun m!783353 () Bool)

(assert (=> b!837935 m!783353))

(declare-fun m!783355 () Bool)

(assert (=> start!72388 m!783355))

(declare-fun m!783357 () Bool)

(assert (=> start!72388 m!783357))

(declare-fun m!783359 () Bool)

(assert (=> b!837938 m!783359))

(declare-fun m!783361 () Bool)

(assert (=> mapNonEmpty!24542 m!783361))

(check-sat (not b!837935) (not b!837938) tp_is_empty!15301 (not start!72388) (not mapNonEmpty!24542))
(check-sat)
