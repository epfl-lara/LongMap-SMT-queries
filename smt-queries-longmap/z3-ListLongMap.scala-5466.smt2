; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72582 () Bool)

(assert start!72582)

(declare-fun mapIsEmpty!25049 () Bool)

(declare-fun mapRes!25049 () Bool)

(assert (=> mapIsEmpty!25049 mapRes!25049))

(declare-fun res!572667 () Bool)

(declare-fun e!469985 () Bool)

(assert (=> start!72582 (=> (not res!572667) (not e!469985))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47536 0))(
  ( (array!47537 (arr!22799 (Array (_ BitVec 32) (_ BitVec 64))) (size!23239 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47536)

(assert (=> start!72582 (= res!572667 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23239 _keys!868))))))

(assert (=> start!72582 e!469985))

(assert (=> start!72582 true))

(declare-fun array_inv!18142 (array!47536) Bool)

(assert (=> start!72582 (array_inv!18142 _keys!868)))

(declare-datatypes ((V!25891 0))(
  ( (V!25892 (val!7864 Int)) )
))
(declare-datatypes ((ValueCell!7377 0))(
  ( (ValueCellFull!7377 (v!10289 V!25891)) (EmptyCell!7377) )
))
(declare-datatypes ((array!47538 0))(
  ( (array!47539 (arr!22800 (Array (_ BitVec 32) ValueCell!7377)) (size!23240 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47538)

(declare-fun e!469987 () Bool)

(declare-fun array_inv!18143 (array!47538) Bool)

(assert (=> start!72582 (and (array_inv!18143 _values!688) e!469987)))

(declare-fun b!842576 () Bool)

(declare-fun res!572666 () Bool)

(assert (=> b!842576 (=> (not res!572666) (not e!469985))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47536 (_ BitVec 32)) Bool)

(assert (=> b!842576 (= res!572666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842577 () Bool)

(declare-fun e!469983 () Bool)

(assert (=> b!842577 (= e!469987 (and e!469983 mapRes!25049))))

(declare-fun condMapEmpty!25049 () Bool)

(declare-fun mapDefault!25049 () ValueCell!7377)

(assert (=> b!842577 (= condMapEmpty!25049 (= (arr!22800 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7377)) mapDefault!25049)))))

(declare-fun b!842578 () Bool)

(assert (=> b!842578 (= e!469985 false)))

(declare-fun lt!381016 () Bool)

(declare-datatypes ((List!16214 0))(
  ( (Nil!16211) (Cons!16210 (h!17341 (_ BitVec 64)) (t!22585 List!16214)) )
))
(declare-fun arrayNoDuplicates!0 (array!47536 (_ BitVec 32) List!16214) Bool)

(assert (=> b!842578 (= lt!381016 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16211))))

(declare-fun b!842579 () Bool)

(declare-fun e!469984 () Bool)

(declare-fun tp_is_empty!15633 () Bool)

(assert (=> b!842579 (= e!469984 tp_is_empty!15633)))

(declare-fun mapNonEmpty!25049 () Bool)

(declare-fun tp!48367 () Bool)

(assert (=> mapNonEmpty!25049 (= mapRes!25049 (and tp!48367 e!469984))))

(declare-fun mapKey!25049 () (_ BitVec 32))

(declare-fun mapRest!25049 () (Array (_ BitVec 32) ValueCell!7377))

(declare-fun mapValue!25049 () ValueCell!7377)

(assert (=> mapNonEmpty!25049 (= (arr!22800 _values!688) (store mapRest!25049 mapKey!25049 mapValue!25049))))

(declare-fun b!842580 () Bool)

(declare-fun res!572668 () Bool)

(assert (=> b!842580 (=> (not res!572668) (not e!469985))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842580 (= res!572668 (and (= (size!23240 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23239 _keys!868) (size!23240 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842581 () Bool)

(declare-fun res!572669 () Bool)

(assert (=> b!842581 (=> (not res!572669) (not e!469985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842581 (= res!572669 (validMask!0 mask!1196))))

(declare-fun b!842582 () Bool)

(assert (=> b!842582 (= e!469983 tp_is_empty!15633)))

(assert (= (and start!72582 res!572667) b!842581))

(assert (= (and b!842581 res!572669) b!842580))

(assert (= (and b!842580 res!572668) b!842576))

(assert (= (and b!842576 res!572666) b!842578))

(assert (= (and b!842577 condMapEmpty!25049) mapIsEmpty!25049))

(assert (= (and b!842577 (not condMapEmpty!25049)) mapNonEmpty!25049))

(get-info :version)

(assert (= (and mapNonEmpty!25049 ((_ is ValueCellFull!7377) mapValue!25049)) b!842579))

(assert (= (and b!842577 ((_ is ValueCellFull!7377) mapDefault!25049)) b!842582))

(assert (= start!72582 b!842577))

(declare-fun m!785625 () Bool)

(assert (=> b!842578 m!785625))

(declare-fun m!785627 () Bool)

(assert (=> b!842576 m!785627))

(declare-fun m!785629 () Bool)

(assert (=> start!72582 m!785629))

(declare-fun m!785631 () Bool)

(assert (=> start!72582 m!785631))

(declare-fun m!785633 () Bool)

(assert (=> b!842581 m!785633))

(declare-fun m!785635 () Bool)

(assert (=> mapNonEmpty!25049 m!785635))

(check-sat (not start!72582) (not b!842576) (not mapNonEmpty!25049) (not b!842581) (not b!842578) tp_is_empty!15633)
(check-sat)
