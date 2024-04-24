; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72748 () Bool)

(assert start!72748)

(declare-fun mapNonEmpty!25046 () Bool)

(declare-fun mapRes!25046 () Bool)

(declare-fun tp!48365 () Bool)

(declare-fun e!470552 () Bool)

(assert (=> mapNonEmpty!25046 (= mapRes!25046 (and tp!48365 e!470552))))

(declare-datatypes ((V!25889 0))(
  ( (V!25890 (val!7863 Int)) )
))
(declare-datatypes ((ValueCell!7376 0))(
  ( (ValueCellFull!7376 (v!10288 V!25889)) (EmptyCell!7376) )
))
(declare-fun mapValue!25046 () ValueCell!7376)

(declare-fun mapRest!25046 () (Array (_ BitVec 32) ValueCell!7376))

(declare-fun mapKey!25046 () (_ BitVec 32))

(declare-datatypes ((array!47555 0))(
  ( (array!47556 (arr!22804 (Array (_ BitVec 32) ValueCell!7376)) (size!23245 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47555)

(assert (=> mapNonEmpty!25046 (= (arr!22804 _values!688) (store mapRest!25046 mapKey!25046 mapValue!25046))))

(declare-fun b!843458 () Bool)

(declare-fun e!470550 () Bool)

(assert (=> b!843458 (= e!470550 false)))

(declare-fun lt!381374 () Bool)

(declare-datatypes ((array!47557 0))(
  ( (array!47558 (arr!22805 (Array (_ BitVec 32) (_ BitVec 64))) (size!23246 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47557)

(declare-datatypes ((List!16140 0))(
  ( (Nil!16137) (Cons!16136 (h!17273 (_ BitVec 64)) (t!22503 List!16140)) )
))
(declare-fun arrayNoDuplicates!0 (array!47557 (_ BitVec 32) List!16140) Bool)

(assert (=> b!843458 (= lt!381374 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16137))))

(declare-fun res!572998 () Bool)

(assert (=> start!72748 (=> (not res!572998) (not e!470550))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72748 (= res!572998 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23246 _keys!868))))))

(assert (=> start!72748 e!470550))

(assert (=> start!72748 true))

(declare-fun array_inv!18192 (array!47557) Bool)

(assert (=> start!72748 (array_inv!18192 _keys!868)))

(declare-fun e!470553 () Bool)

(declare-fun array_inv!18193 (array!47555) Bool)

(assert (=> start!72748 (and (array_inv!18193 _values!688) e!470553)))

(declare-fun b!843459 () Bool)

(declare-fun res!572999 () Bool)

(assert (=> b!843459 (=> (not res!572999) (not e!470550))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47557 (_ BitVec 32)) Bool)

(assert (=> b!843459 (= res!572999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843460 () Bool)

(declare-fun e!470551 () Bool)

(declare-fun tp_is_empty!15631 () Bool)

(assert (=> b!843460 (= e!470551 tp_is_empty!15631)))

(declare-fun b!843461 () Bool)

(declare-fun res!573001 () Bool)

(assert (=> b!843461 (=> (not res!573001) (not e!470550))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843461 (= res!573001 (and (= (size!23245 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23246 _keys!868) (size!23245 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25046 () Bool)

(assert (=> mapIsEmpty!25046 mapRes!25046))

(declare-fun b!843462 () Bool)

(assert (=> b!843462 (= e!470552 tp_is_empty!15631)))

(declare-fun b!843463 () Bool)

(assert (=> b!843463 (= e!470553 (and e!470551 mapRes!25046))))

(declare-fun condMapEmpty!25046 () Bool)

(declare-fun mapDefault!25046 () ValueCell!7376)

(assert (=> b!843463 (= condMapEmpty!25046 (= (arr!22804 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7376)) mapDefault!25046)))))

(declare-fun b!843464 () Bool)

(declare-fun res!573000 () Bool)

(assert (=> b!843464 (=> (not res!573000) (not e!470550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843464 (= res!573000 (validMask!0 mask!1196))))

(assert (= (and start!72748 res!572998) b!843464))

(assert (= (and b!843464 res!573000) b!843461))

(assert (= (and b!843461 res!573001) b!843459))

(assert (= (and b!843459 res!572999) b!843458))

(assert (= (and b!843463 condMapEmpty!25046) mapIsEmpty!25046))

(assert (= (and b!843463 (not condMapEmpty!25046)) mapNonEmpty!25046))

(get-info :version)

(assert (= (and mapNonEmpty!25046 ((_ is ValueCellFull!7376) mapValue!25046)) b!843462))

(assert (= (and b!843463 ((_ is ValueCellFull!7376) mapDefault!25046)) b!843460))

(assert (= start!72748 b!843463))

(declare-fun m!786905 () Bool)

(assert (=> mapNonEmpty!25046 m!786905))

(declare-fun m!786907 () Bool)

(assert (=> b!843458 m!786907))

(declare-fun m!786909 () Bool)

(assert (=> start!72748 m!786909))

(declare-fun m!786911 () Bool)

(assert (=> start!72748 m!786911))

(declare-fun m!786913 () Bool)

(assert (=> b!843459 m!786913))

(declare-fun m!786915 () Bool)

(assert (=> b!843464 m!786915))

(check-sat (not b!843464) (not mapNonEmpty!25046) tp_is_empty!15631 (not b!843458) (not b!843459) (not start!72748))
(check-sat)
