; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72466 () Bool)

(assert start!72466)

(declare-fun b!838553 () Bool)

(declare-fun e!468111 () Bool)

(declare-fun e!468112 () Bool)

(declare-fun mapRes!24623 () Bool)

(assert (=> b!838553 (= e!468111 (and e!468112 mapRes!24623))))

(declare-fun condMapEmpty!24623 () Bool)

(declare-datatypes ((V!25513 0))(
  ( (V!25514 (val!7722 Int)) )
))
(declare-datatypes ((ValueCell!7235 0))(
  ( (ValueCellFull!7235 (v!10147 V!25513)) (EmptyCell!7235) )
))
(declare-datatypes ((array!46997 0))(
  ( (array!46998 (arr!22525 (Array (_ BitVec 32) ValueCell!7235)) (size!22966 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46997)

(declare-fun mapDefault!24623 () ValueCell!7235)

(assert (=> b!838553 (= condMapEmpty!24623 (= (arr!22525 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7235)) mapDefault!24623)))))

(declare-fun b!838554 () Bool)

(declare-fun res!570012 () Bool)

(declare-fun e!468113 () Bool)

(assert (=> b!838554 (=> (not res!570012) (not e!468113))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!46999 0))(
  ( (array!47000 (arr!22526 (Array (_ BitVec 32) (_ BitVec 64))) (size!22967 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46999)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838554 (= res!570012 (and (= (size!22966 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22967 _keys!868) (size!22966 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!24623 () Bool)

(declare-fun tp!47618 () Bool)

(declare-fun e!468115 () Bool)

(assert (=> mapNonEmpty!24623 (= mapRes!24623 (and tp!47618 e!468115))))

(declare-fun mapRest!24623 () (Array (_ BitVec 32) ValueCell!7235))

(declare-fun mapKey!24623 () (_ BitVec 32))

(declare-fun mapValue!24623 () ValueCell!7235)

(assert (=> mapNonEmpty!24623 (= (arr!22525 _values!688) (store mapRest!24623 mapKey!24623 mapValue!24623))))

(declare-fun b!838555 () Bool)

(declare-fun tp_is_empty!15349 () Bool)

(assert (=> b!838555 (= e!468112 tp_is_empty!15349)))

(declare-fun b!838556 () Bool)

(declare-fun res!570013 () Bool)

(assert (=> b!838556 (=> (not res!570013) (not e!468113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46999 (_ BitVec 32)) Bool)

(assert (=> b!838556 (= res!570013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!570011 () Bool)

(assert (=> start!72466 (=> (not res!570011) (not e!468113))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72466 (= res!570011 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22967 _keys!868))))))

(assert (=> start!72466 e!468113))

(assert (=> start!72466 true))

(declare-fun array_inv!17994 (array!46999) Bool)

(assert (=> start!72466 (array_inv!17994 _keys!868)))

(declare-fun array_inv!17995 (array!46997) Bool)

(assert (=> start!72466 (and (array_inv!17995 _values!688) e!468111)))

(declare-fun b!838557 () Bool)

(assert (=> b!838557 (= e!468115 tp_is_empty!15349)))

(declare-fun b!838558 () Bool)

(declare-fun res!570010 () Bool)

(assert (=> b!838558 (=> (not res!570010) (not e!468113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838558 (= res!570010 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!24623 () Bool)

(assert (=> mapIsEmpty!24623 mapRes!24623))

(declare-fun b!838559 () Bool)

(assert (=> b!838559 (= e!468113 false)))

(declare-fun lt!380951 () Bool)

(declare-datatypes ((List!15938 0))(
  ( (Nil!15935) (Cons!15934 (h!17071 (_ BitVec 64)) (t!22301 List!15938)) )
))
(declare-fun arrayNoDuplicates!0 (array!46999 (_ BitVec 32) List!15938) Bool)

(assert (=> b!838559 (= lt!380951 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15935))))

(assert (= (and start!72466 res!570011) b!838558))

(assert (= (and b!838558 res!570010) b!838554))

(assert (= (and b!838554 res!570012) b!838556))

(assert (= (and b!838556 res!570013) b!838559))

(assert (= (and b!838553 condMapEmpty!24623) mapIsEmpty!24623))

(assert (= (and b!838553 (not condMapEmpty!24623)) mapNonEmpty!24623))

(get-info :version)

(assert (= (and mapNonEmpty!24623 ((_ is ValueCellFull!7235) mapValue!24623)) b!838557))

(assert (= (and b!838553 ((_ is ValueCellFull!7235) mapDefault!24623)) b!838555))

(assert (= start!72466 b!838553))

(declare-fun m!783701 () Bool)

(assert (=> mapNonEmpty!24623 m!783701))

(declare-fun m!783703 () Bool)

(assert (=> start!72466 m!783703))

(declare-fun m!783705 () Bool)

(assert (=> start!72466 m!783705))

(declare-fun m!783707 () Bool)

(assert (=> b!838559 m!783707))

(declare-fun m!783709 () Bool)

(assert (=> b!838558 m!783709))

(declare-fun m!783711 () Bool)

(assert (=> b!838556 m!783711))

(check-sat (not b!838559) (not b!838558) (not start!72466) (not mapNonEmpty!24623) (not b!838556) tp_is_empty!15349)
(check-sat)
