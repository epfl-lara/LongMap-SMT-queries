; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72570 () Bool)

(assert start!72570)

(declare-fun b!842450 () Bool)

(declare-fun res!572595 () Bool)

(declare-fun e!469894 () Bool)

(assert (=> b!842450 (=> (not res!572595) (not e!469894))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842450 (= res!572595 (validMask!0 mask!1196))))

(declare-fun b!842451 () Bool)

(assert (=> b!842451 (= e!469894 false)))

(declare-fun lt!380998 () Bool)

(declare-datatypes ((array!47516 0))(
  ( (array!47517 (arr!22789 (Array (_ BitVec 32) (_ BitVec 64))) (size!23229 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47516)

(declare-datatypes ((List!16211 0))(
  ( (Nil!16208) (Cons!16207 (h!17338 (_ BitVec 64)) (t!22582 List!16211)) )
))
(declare-fun arrayNoDuplicates!0 (array!47516 (_ BitVec 32) List!16211) Bool)

(assert (=> b!842451 (= lt!380998 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16208))))

(declare-fun b!842452 () Bool)

(declare-fun e!469896 () Bool)

(declare-fun tp_is_empty!15621 () Bool)

(assert (=> b!842452 (= e!469896 tp_is_empty!15621)))

(declare-fun mapIsEmpty!25031 () Bool)

(declare-fun mapRes!25031 () Bool)

(assert (=> mapIsEmpty!25031 mapRes!25031))

(declare-fun b!842453 () Bool)

(declare-fun res!572597 () Bool)

(assert (=> b!842453 (=> (not res!572597) (not e!469894))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25875 0))(
  ( (V!25876 (val!7858 Int)) )
))
(declare-datatypes ((ValueCell!7371 0))(
  ( (ValueCellFull!7371 (v!10283 V!25875)) (EmptyCell!7371) )
))
(declare-datatypes ((array!47518 0))(
  ( (array!47519 (arr!22790 (Array (_ BitVec 32) ValueCell!7371)) (size!23230 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47518)

(assert (=> b!842453 (= res!572597 (and (= (size!23230 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23229 _keys!868) (size!23230 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!572594 () Bool)

(assert (=> start!72570 (=> (not res!572594) (not e!469894))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72570 (= res!572594 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23229 _keys!868))))))

(assert (=> start!72570 e!469894))

(assert (=> start!72570 true))

(declare-fun array_inv!18136 (array!47516) Bool)

(assert (=> start!72570 (array_inv!18136 _keys!868)))

(declare-fun e!469897 () Bool)

(declare-fun array_inv!18137 (array!47518) Bool)

(assert (=> start!72570 (and (array_inv!18137 _values!688) e!469897)))

(declare-fun b!842454 () Bool)

(declare-fun res!572596 () Bool)

(assert (=> b!842454 (=> (not res!572596) (not e!469894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47516 (_ BitVec 32)) Bool)

(assert (=> b!842454 (= res!572596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842455 () Bool)

(declare-fun e!469893 () Bool)

(assert (=> b!842455 (= e!469897 (and e!469893 mapRes!25031))))

(declare-fun condMapEmpty!25031 () Bool)

(declare-fun mapDefault!25031 () ValueCell!7371)

(assert (=> b!842455 (= condMapEmpty!25031 (= (arr!22790 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7371)) mapDefault!25031)))))

(declare-fun b!842456 () Bool)

(assert (=> b!842456 (= e!469893 tp_is_empty!15621)))

(declare-fun mapNonEmpty!25031 () Bool)

(declare-fun tp!48349 () Bool)

(assert (=> mapNonEmpty!25031 (= mapRes!25031 (and tp!48349 e!469896))))

(declare-fun mapKey!25031 () (_ BitVec 32))

(declare-fun mapValue!25031 () ValueCell!7371)

(declare-fun mapRest!25031 () (Array (_ BitVec 32) ValueCell!7371))

(assert (=> mapNonEmpty!25031 (= (arr!22790 _values!688) (store mapRest!25031 mapKey!25031 mapValue!25031))))

(assert (= (and start!72570 res!572594) b!842450))

(assert (= (and b!842450 res!572595) b!842453))

(assert (= (and b!842453 res!572597) b!842454))

(assert (= (and b!842454 res!572596) b!842451))

(assert (= (and b!842455 condMapEmpty!25031) mapIsEmpty!25031))

(assert (= (and b!842455 (not condMapEmpty!25031)) mapNonEmpty!25031))

(get-info :version)

(assert (= (and mapNonEmpty!25031 ((_ is ValueCellFull!7371) mapValue!25031)) b!842452))

(assert (= (and b!842455 ((_ is ValueCellFull!7371) mapDefault!25031)) b!842456))

(assert (= start!72570 b!842455))

(declare-fun m!785553 () Bool)

(assert (=> b!842451 m!785553))

(declare-fun m!785555 () Bool)

(assert (=> mapNonEmpty!25031 m!785555))

(declare-fun m!785557 () Bool)

(assert (=> start!72570 m!785557))

(declare-fun m!785559 () Bool)

(assert (=> start!72570 m!785559))

(declare-fun m!785561 () Bool)

(assert (=> b!842450 m!785561))

(declare-fun m!785563 () Bool)

(assert (=> b!842454 m!785563))

(check-sat (not mapNonEmpty!25031) (not b!842451) tp_is_empty!15621 (not b!842450) (not start!72570) (not b!842454))
(check-sat)
