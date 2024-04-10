; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72588 () Bool)

(assert start!72588)

(declare-fun mapIsEmpty!25058 () Bool)

(declare-fun mapRes!25058 () Bool)

(assert (=> mapIsEmpty!25058 mapRes!25058))

(declare-fun b!842639 () Bool)

(declare-fun e!470029 () Bool)

(declare-fun tp_is_empty!15639 () Bool)

(assert (=> b!842639 (= e!470029 tp_is_empty!15639)))

(declare-fun mapNonEmpty!25058 () Bool)

(declare-fun tp!48376 () Bool)

(declare-fun e!470030 () Bool)

(assert (=> mapNonEmpty!25058 (= mapRes!25058 (and tp!48376 e!470030))))

(declare-fun mapKey!25058 () (_ BitVec 32))

(declare-datatypes ((V!25899 0))(
  ( (V!25900 (val!7867 Int)) )
))
(declare-datatypes ((ValueCell!7380 0))(
  ( (ValueCellFull!7380 (v!10292 V!25899)) (EmptyCell!7380) )
))
(declare-fun mapRest!25058 () (Array (_ BitVec 32) ValueCell!7380))

(declare-fun mapValue!25058 () ValueCell!7380)

(declare-datatypes ((array!47548 0))(
  ( (array!47549 (arr!22805 (Array (_ BitVec 32) ValueCell!7380)) (size!23245 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47548)

(assert (=> mapNonEmpty!25058 (= (arr!22805 _values!688) (store mapRest!25058 mapKey!25058 mapValue!25058))))

(declare-fun b!842641 () Bool)

(declare-fun e!470032 () Bool)

(assert (=> b!842641 (= e!470032 (and e!470029 mapRes!25058))))

(declare-fun condMapEmpty!25058 () Bool)

(declare-fun mapDefault!25058 () ValueCell!7380)

(assert (=> b!842641 (= condMapEmpty!25058 (= (arr!22805 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7380)) mapDefault!25058)))))

(declare-fun b!842642 () Bool)

(declare-fun res!572704 () Bool)

(declare-fun e!470031 () Bool)

(assert (=> b!842642 (=> (not res!572704) (not e!470031))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47550 0))(
  ( (array!47551 (arr!22806 (Array (_ BitVec 32) (_ BitVec 64))) (size!23246 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47550)

(assert (=> b!842642 (= res!572704 (and (= (size!23245 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23246 _keys!868) (size!23245 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842643 () Bool)

(declare-fun res!572705 () Bool)

(assert (=> b!842643 (=> (not res!572705) (not e!470031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842643 (= res!572705 (validMask!0 mask!1196))))

(declare-fun b!842640 () Bool)

(assert (=> b!842640 (= e!470031 false)))

(declare-fun lt!381025 () Bool)

(declare-datatypes ((List!16217 0))(
  ( (Nil!16214) (Cons!16213 (h!17344 (_ BitVec 64)) (t!22588 List!16217)) )
))
(declare-fun arrayNoDuplicates!0 (array!47550 (_ BitVec 32) List!16217) Bool)

(assert (=> b!842640 (= lt!381025 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16214))))

(declare-fun res!572703 () Bool)

(assert (=> start!72588 (=> (not res!572703) (not e!470031))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72588 (= res!572703 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23246 _keys!868))))))

(assert (=> start!72588 e!470031))

(assert (=> start!72588 true))

(declare-fun array_inv!18148 (array!47550) Bool)

(assert (=> start!72588 (array_inv!18148 _keys!868)))

(declare-fun array_inv!18149 (array!47548) Bool)

(assert (=> start!72588 (and (array_inv!18149 _values!688) e!470032)))

(declare-fun b!842644 () Bool)

(assert (=> b!842644 (= e!470030 tp_is_empty!15639)))

(declare-fun b!842645 () Bool)

(declare-fun res!572702 () Bool)

(assert (=> b!842645 (=> (not res!572702) (not e!470031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47550 (_ BitVec 32)) Bool)

(assert (=> b!842645 (= res!572702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72588 res!572703) b!842643))

(assert (= (and b!842643 res!572705) b!842642))

(assert (= (and b!842642 res!572704) b!842645))

(assert (= (and b!842645 res!572702) b!842640))

(assert (= (and b!842641 condMapEmpty!25058) mapIsEmpty!25058))

(assert (= (and b!842641 (not condMapEmpty!25058)) mapNonEmpty!25058))

(get-info :version)

(assert (= (and mapNonEmpty!25058 ((_ is ValueCellFull!7380) mapValue!25058)) b!842644))

(assert (= (and b!842641 ((_ is ValueCellFull!7380) mapDefault!25058)) b!842639))

(assert (= start!72588 b!842641))

(declare-fun m!785661 () Bool)

(assert (=> start!72588 m!785661))

(declare-fun m!785663 () Bool)

(assert (=> start!72588 m!785663))

(declare-fun m!785665 () Bool)

(assert (=> b!842640 m!785665))

(declare-fun m!785667 () Bool)

(assert (=> b!842643 m!785667))

(declare-fun m!785669 () Bool)

(assert (=> b!842645 m!785669))

(declare-fun m!785671 () Bool)

(assert (=> mapNonEmpty!25058 m!785671))

(check-sat (not b!842645) (not start!72588) (not mapNonEmpty!25058) (not b!842643) tp_is_empty!15639 (not b!842640))
(check-sat)
