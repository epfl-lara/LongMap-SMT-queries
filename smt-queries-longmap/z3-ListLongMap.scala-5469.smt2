; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72580 () Bool)

(assert start!72580)

(declare-fun b!842505 () Bool)

(declare-fun e!469956 () Bool)

(declare-fun tp_is_empty!15649 () Bool)

(assert (=> b!842505 (= e!469956 tp_is_empty!15649)))

(declare-fun mapNonEmpty!25073 () Bool)

(declare-fun mapRes!25073 () Bool)

(declare-fun tp!48392 () Bool)

(declare-fun e!469958 () Bool)

(assert (=> mapNonEmpty!25073 (= mapRes!25073 (and tp!48392 e!469958))))

(declare-fun mapKey!25073 () (_ BitVec 32))

(declare-datatypes ((V!25913 0))(
  ( (V!25914 (val!7872 Int)) )
))
(declare-datatypes ((ValueCell!7385 0))(
  ( (ValueCellFull!7385 (v!10291 V!25913)) (EmptyCell!7385) )
))
(declare-fun mapRest!25073 () (Array (_ BitVec 32) ValueCell!7385))

(declare-fun mapValue!25073 () ValueCell!7385)

(declare-datatypes ((array!47549 0))(
  ( (array!47550 (arr!22806 (Array (_ BitVec 32) ValueCell!7385)) (size!23248 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47549)

(assert (=> mapNonEmpty!25073 (= (arr!22806 _values!688) (store mapRest!25073 mapKey!25073 mapValue!25073))))

(declare-fun b!842506 () Bool)

(declare-fun e!469955 () Bool)

(assert (=> b!842506 (= e!469955 false)))

(declare-fun lt!380804 () Bool)

(declare-datatypes ((array!47551 0))(
  ( (array!47552 (arr!22807 (Array (_ BitVec 32) (_ BitVec 64))) (size!23249 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47551)

(declare-datatypes ((List!16233 0))(
  ( (Nil!16230) (Cons!16229 (h!17360 (_ BitVec 64)) (t!22595 List!16233)) )
))
(declare-fun arrayNoDuplicates!0 (array!47551 (_ BitVec 32) List!16233) Bool)

(assert (=> b!842506 (= lt!380804 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16230))))

(declare-fun b!842507 () Bool)

(declare-fun res!572653 () Bool)

(assert (=> b!842507 (=> (not res!572653) (not e!469955))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!842507 (= res!572653 (and (= (size!23248 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23249 _keys!868) (size!23248 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25073 () Bool)

(assert (=> mapIsEmpty!25073 mapRes!25073))

(declare-fun b!842508 () Bool)

(declare-fun res!572652 () Bool)

(assert (=> b!842508 (=> (not res!572652) (not e!469955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842508 (= res!572652 (validMask!0 mask!1196))))

(declare-fun res!572654 () Bool)

(assert (=> start!72580 (=> (not res!572654) (not e!469955))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72580 (= res!572654 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23249 _keys!868))))))

(assert (=> start!72580 e!469955))

(assert (=> start!72580 true))

(declare-fun array_inv!18214 (array!47551) Bool)

(assert (=> start!72580 (array_inv!18214 _keys!868)))

(declare-fun e!469957 () Bool)

(declare-fun array_inv!18215 (array!47549) Bool)

(assert (=> start!72580 (and (array_inv!18215 _values!688) e!469957)))

(declare-fun b!842509 () Bool)

(assert (=> b!842509 (= e!469957 (and e!469956 mapRes!25073))))

(declare-fun condMapEmpty!25073 () Bool)

(declare-fun mapDefault!25073 () ValueCell!7385)

(assert (=> b!842509 (= condMapEmpty!25073 (= (arr!22806 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7385)) mapDefault!25073)))))

(declare-fun b!842510 () Bool)

(declare-fun res!572655 () Bool)

(assert (=> b!842510 (=> (not res!572655) (not e!469955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47551 (_ BitVec 32)) Bool)

(assert (=> b!842510 (= res!572655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842511 () Bool)

(assert (=> b!842511 (= e!469958 tp_is_empty!15649)))

(assert (= (and start!72580 res!572654) b!842508))

(assert (= (and b!842508 res!572652) b!842507))

(assert (= (and b!842507 res!572653) b!842510))

(assert (= (and b!842510 res!572655) b!842506))

(assert (= (and b!842509 condMapEmpty!25073) mapIsEmpty!25073))

(assert (= (and b!842509 (not condMapEmpty!25073)) mapNonEmpty!25073))

(get-info :version)

(assert (= (and mapNonEmpty!25073 ((_ is ValueCellFull!7385) mapValue!25073)) b!842511))

(assert (= (and b!842509 ((_ is ValueCellFull!7385) mapDefault!25073)) b!842505))

(assert (= start!72580 b!842509))

(declare-fun m!784967 () Bool)

(assert (=> mapNonEmpty!25073 m!784967))

(declare-fun m!784969 () Bool)

(assert (=> b!842508 m!784969))

(declare-fun m!784971 () Bool)

(assert (=> b!842510 m!784971))

(declare-fun m!784973 () Bool)

(assert (=> start!72580 m!784973))

(declare-fun m!784975 () Bool)

(assert (=> start!72580 m!784975))

(declare-fun m!784977 () Bool)

(assert (=> b!842506 m!784977))

(check-sat (not start!72580) (not b!842508) tp_is_empty!15649 (not b!842506) (not mapNonEmpty!25073) (not b!842510))
(check-sat)
