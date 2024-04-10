; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72276 () Bool)

(assert start!72276)

(declare-fun b!837419 () Bool)

(declare-fun res!569536 () Bool)

(declare-fun e!467365 () Bool)

(assert (=> b!837419 (=> (not res!569536) (not e!467365))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837419 (= res!569536 (validMask!0 mask!1196))))

(declare-fun b!837420 () Bool)

(declare-fun res!569535 () Bool)

(assert (=> b!837420 (=> (not res!569535) (not e!467365))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!46954 0))(
  ( (array!46955 (arr!22508 (Array (_ BitVec 32) (_ BitVec 64))) (size!22948 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46954)

(declare-datatypes ((V!25483 0))(
  ( (V!25484 (val!7711 Int)) )
))
(declare-datatypes ((ValueCell!7224 0))(
  ( (ValueCellFull!7224 (v!10136 V!25483)) (EmptyCell!7224) )
))
(declare-datatypes ((array!46956 0))(
  ( (array!46957 (arr!22509 (Array (_ BitVec 32) ValueCell!7224)) (size!22949 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46956)

(assert (=> b!837420 (= res!569535 (and (= (size!22949 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22948 _keys!868) (size!22949 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837421 () Bool)

(assert (=> b!837421 (= e!467365 false)))

(declare-fun lt!380557 () Bool)

(declare-datatypes ((List!16027 0))(
  ( (Nil!16024) (Cons!16023 (h!17154 (_ BitVec 64)) (t!22398 List!16027)) )
))
(declare-fun arrayNoDuplicates!0 (array!46954 (_ BitVec 32) List!16027) Bool)

(assert (=> b!837421 (= lt!380557 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16024))))

(declare-fun res!569537 () Bool)

(assert (=> start!72276 (=> (not res!569537) (not e!467365))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72276 (= res!569537 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22948 _keys!868))))))

(assert (=> start!72276 e!467365))

(assert (=> start!72276 true))

(declare-fun array_inv!17944 (array!46954) Bool)

(assert (=> start!72276 (array_inv!17944 _keys!868)))

(declare-fun e!467367 () Bool)

(declare-fun array_inv!17945 (array!46956) Bool)

(assert (=> start!72276 (and (array_inv!17945 _values!688) e!467367)))

(declare-fun b!837422 () Bool)

(declare-fun e!467368 () Bool)

(declare-fun mapRes!24590 () Bool)

(assert (=> b!837422 (= e!467367 (and e!467368 mapRes!24590))))

(declare-fun condMapEmpty!24590 () Bool)

(declare-fun mapDefault!24590 () ValueCell!7224)

(assert (=> b!837422 (= condMapEmpty!24590 (= (arr!22509 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7224)) mapDefault!24590)))))

(declare-fun b!837423 () Bool)

(declare-fun tp_is_empty!15327 () Bool)

(assert (=> b!837423 (= e!467368 tp_is_empty!15327)))

(declare-fun b!837424 () Bool)

(declare-fun e!467364 () Bool)

(assert (=> b!837424 (= e!467364 tp_is_empty!15327)))

(declare-fun mapNonEmpty!24590 () Bool)

(declare-fun tp!47584 () Bool)

(assert (=> mapNonEmpty!24590 (= mapRes!24590 (and tp!47584 e!467364))))

(declare-fun mapRest!24590 () (Array (_ BitVec 32) ValueCell!7224))

(declare-fun mapKey!24590 () (_ BitVec 32))

(declare-fun mapValue!24590 () ValueCell!7224)

(assert (=> mapNonEmpty!24590 (= (arr!22509 _values!688) (store mapRest!24590 mapKey!24590 mapValue!24590))))

(declare-fun b!837425 () Bool)

(declare-fun res!569534 () Bool)

(assert (=> b!837425 (=> (not res!569534) (not e!467365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46954 (_ BitVec 32)) Bool)

(assert (=> b!837425 (= res!569534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24590 () Bool)

(assert (=> mapIsEmpty!24590 mapRes!24590))

(assert (= (and start!72276 res!569537) b!837419))

(assert (= (and b!837419 res!569536) b!837420))

(assert (= (and b!837420 res!569535) b!837425))

(assert (= (and b!837425 res!569534) b!837421))

(assert (= (and b!837422 condMapEmpty!24590) mapIsEmpty!24590))

(assert (= (and b!837422 (not condMapEmpty!24590)) mapNonEmpty!24590))

(get-info :version)

(assert (= (and mapNonEmpty!24590 ((_ is ValueCellFull!7224) mapValue!24590)) b!837424))

(assert (= (and b!837422 ((_ is ValueCellFull!7224) mapDefault!24590)) b!837423))

(assert (= start!72276 b!837422))

(declare-fun m!782277 () Bool)

(assert (=> b!837419 m!782277))

(declare-fun m!782279 () Bool)

(assert (=> mapNonEmpty!24590 m!782279))

(declare-fun m!782281 () Bool)

(assert (=> b!837425 m!782281))

(declare-fun m!782283 () Bool)

(assert (=> b!837421 m!782283))

(declare-fun m!782285 () Bool)

(assert (=> start!72276 m!782285))

(declare-fun m!782287 () Bool)

(assert (=> start!72276 m!782287))

(check-sat (not mapNonEmpty!24590) (not b!837421) tp_is_empty!15327 (not b!837425) (not b!837419) (not start!72276))
(check-sat)
