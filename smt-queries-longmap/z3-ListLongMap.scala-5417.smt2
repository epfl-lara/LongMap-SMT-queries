; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72288 () Bool)

(assert start!72288)

(declare-fun b!837545 () Bool)

(declare-fun e!467458 () Bool)

(assert (=> b!837545 (= e!467458 false)))

(declare-fun lt!380575 () Bool)

(declare-datatypes ((array!46976 0))(
  ( (array!46977 (arr!22519 (Array (_ BitVec 32) (_ BitVec 64))) (size!22959 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46976)

(declare-datatypes ((List!16030 0))(
  ( (Nil!16027) (Cons!16026 (h!17157 (_ BitVec 64)) (t!22401 List!16030)) )
))
(declare-fun arrayNoDuplicates!0 (array!46976 (_ BitVec 32) List!16030) Bool)

(assert (=> b!837545 (= lt!380575 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16027))))

(declare-fun b!837546 () Bool)

(declare-fun res!569608 () Bool)

(assert (=> b!837546 (=> (not res!569608) (not e!467458))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!25499 0))(
  ( (V!25500 (val!7717 Int)) )
))
(declare-datatypes ((ValueCell!7230 0))(
  ( (ValueCellFull!7230 (v!10142 V!25499)) (EmptyCell!7230) )
))
(declare-datatypes ((array!46978 0))(
  ( (array!46979 (arr!22520 (Array (_ BitVec 32) ValueCell!7230)) (size!22960 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46978)

(assert (=> b!837546 (= res!569608 (and (= (size!22960 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22959 _keys!868) (size!22960 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!24608 () Bool)

(declare-fun mapRes!24608 () Bool)

(assert (=> mapIsEmpty!24608 mapRes!24608))

(declare-fun b!837547 () Bool)

(declare-fun e!467457 () Bool)

(declare-fun tp_is_empty!15339 () Bool)

(assert (=> b!837547 (= e!467457 tp_is_empty!15339)))

(declare-fun mapNonEmpty!24608 () Bool)

(declare-fun tp!47602 () Bool)

(declare-fun e!467455 () Bool)

(assert (=> mapNonEmpty!24608 (= mapRes!24608 (and tp!47602 e!467455))))

(declare-fun mapValue!24608 () ValueCell!7230)

(declare-fun mapRest!24608 () (Array (_ BitVec 32) ValueCell!7230))

(declare-fun mapKey!24608 () (_ BitVec 32))

(assert (=> mapNonEmpty!24608 (= (arr!22520 _values!688) (store mapRest!24608 mapKey!24608 mapValue!24608))))

(declare-fun b!837548 () Bool)

(declare-fun res!569607 () Bool)

(assert (=> b!837548 (=> (not res!569607) (not e!467458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837548 (= res!569607 (validMask!0 mask!1196))))

(declare-fun b!837549 () Bool)

(assert (=> b!837549 (= e!467455 tp_is_empty!15339)))

(declare-fun b!837551 () Bool)

(declare-fun e!467456 () Bool)

(assert (=> b!837551 (= e!467456 (and e!467457 mapRes!24608))))

(declare-fun condMapEmpty!24608 () Bool)

(declare-fun mapDefault!24608 () ValueCell!7230)

(assert (=> b!837551 (= condMapEmpty!24608 (= (arr!22520 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7230)) mapDefault!24608)))))

(declare-fun b!837550 () Bool)

(declare-fun res!569606 () Bool)

(assert (=> b!837550 (=> (not res!569606) (not e!467458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46976 (_ BitVec 32)) Bool)

(assert (=> b!837550 (= res!569606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!569609 () Bool)

(assert (=> start!72288 (=> (not res!569609) (not e!467458))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72288 (= res!569609 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22959 _keys!868))))))

(assert (=> start!72288 e!467458))

(assert (=> start!72288 true))

(declare-fun array_inv!17948 (array!46976) Bool)

(assert (=> start!72288 (array_inv!17948 _keys!868)))

(declare-fun array_inv!17949 (array!46978) Bool)

(assert (=> start!72288 (and (array_inv!17949 _values!688) e!467456)))

(assert (= (and start!72288 res!569609) b!837548))

(assert (= (and b!837548 res!569607) b!837546))

(assert (= (and b!837546 res!569608) b!837550))

(assert (= (and b!837550 res!569606) b!837545))

(assert (= (and b!837551 condMapEmpty!24608) mapIsEmpty!24608))

(assert (= (and b!837551 (not condMapEmpty!24608)) mapNonEmpty!24608))

(get-info :version)

(assert (= (and mapNonEmpty!24608 ((_ is ValueCellFull!7230) mapValue!24608)) b!837549))

(assert (= (and b!837551 ((_ is ValueCellFull!7230) mapDefault!24608)) b!837547))

(assert (= start!72288 b!837551))

(declare-fun m!782349 () Bool)

(assert (=> b!837550 m!782349))

(declare-fun m!782351 () Bool)

(assert (=> b!837548 m!782351))

(declare-fun m!782353 () Bool)

(assert (=> start!72288 m!782353))

(declare-fun m!782355 () Bool)

(assert (=> start!72288 m!782355))

(declare-fun m!782357 () Bool)

(assert (=> b!837545 m!782357))

(declare-fun m!782359 () Bool)

(assert (=> mapNonEmpty!24608 m!782359))

(check-sat (not start!72288) (not b!837550) (not b!837548) (not b!837545) (not mapNonEmpty!24608) tp_is_empty!15339)
(check-sat)
