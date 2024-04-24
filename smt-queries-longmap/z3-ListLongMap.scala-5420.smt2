; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72472 () Bool)

(assert start!72472)

(declare-fun res!570049 () Bool)

(declare-fun e!468156 () Bool)

(assert (=> start!72472 (=> (not res!570049) (not e!468156))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47009 0))(
  ( (array!47010 (arr!22531 (Array (_ BitVec 32) (_ BitVec 64))) (size!22972 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47009)

(assert (=> start!72472 (= res!570049 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22972 _keys!868))))))

(assert (=> start!72472 e!468156))

(assert (=> start!72472 true))

(declare-fun array_inv!18000 (array!47009) Bool)

(assert (=> start!72472 (array_inv!18000 _keys!868)))

(declare-datatypes ((V!25521 0))(
  ( (V!25522 (val!7725 Int)) )
))
(declare-datatypes ((ValueCell!7238 0))(
  ( (ValueCellFull!7238 (v!10150 V!25521)) (EmptyCell!7238) )
))
(declare-datatypes ((array!47011 0))(
  ( (array!47012 (arr!22532 (Array (_ BitVec 32) ValueCell!7238)) (size!22973 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47011)

(declare-fun e!468160 () Bool)

(declare-fun array_inv!18001 (array!47011) Bool)

(assert (=> start!72472 (and (array_inv!18001 _values!688) e!468160)))

(declare-fun b!838616 () Bool)

(declare-fun e!468159 () Bool)

(declare-fun tp_is_empty!15355 () Bool)

(assert (=> b!838616 (= e!468159 tp_is_empty!15355)))

(declare-fun b!838617 () Bool)

(declare-fun mapRes!24632 () Bool)

(assert (=> b!838617 (= e!468160 (and e!468159 mapRes!24632))))

(declare-fun condMapEmpty!24632 () Bool)

(declare-fun mapDefault!24632 () ValueCell!7238)

(assert (=> b!838617 (= condMapEmpty!24632 (= (arr!22532 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7238)) mapDefault!24632)))))

(declare-fun b!838618 () Bool)

(declare-fun res!570047 () Bool)

(assert (=> b!838618 (=> (not res!570047) (not e!468156))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47009 (_ BitVec 32)) Bool)

(assert (=> b!838618 (= res!570047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838619 () Bool)

(declare-fun res!570046 () Bool)

(assert (=> b!838619 (=> (not res!570046) (not e!468156))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838619 (= res!570046 (and (= (size!22973 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22972 _keys!868) (size!22973 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838620 () Bool)

(declare-fun e!468158 () Bool)

(assert (=> b!838620 (= e!468158 tp_is_empty!15355)))

(declare-fun mapNonEmpty!24632 () Bool)

(declare-fun tp!47627 () Bool)

(assert (=> mapNonEmpty!24632 (= mapRes!24632 (and tp!47627 e!468158))))

(declare-fun mapValue!24632 () ValueCell!7238)

(declare-fun mapRest!24632 () (Array (_ BitVec 32) ValueCell!7238))

(declare-fun mapKey!24632 () (_ BitVec 32))

(assert (=> mapNonEmpty!24632 (= (arr!22532 _values!688) (store mapRest!24632 mapKey!24632 mapValue!24632))))

(declare-fun b!838621 () Bool)

(declare-fun res!570048 () Bool)

(assert (=> b!838621 (=> (not res!570048) (not e!468156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838621 (= res!570048 (validMask!0 mask!1196))))

(declare-fun b!838622 () Bool)

(assert (=> b!838622 (= e!468156 false)))

(declare-fun lt!380960 () Bool)

(declare-datatypes ((List!15939 0))(
  ( (Nil!15936) (Cons!15935 (h!17072 (_ BitVec 64)) (t!22302 List!15939)) )
))
(declare-fun arrayNoDuplicates!0 (array!47009 (_ BitVec 32) List!15939) Bool)

(assert (=> b!838622 (= lt!380960 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15936))))

(declare-fun mapIsEmpty!24632 () Bool)

(assert (=> mapIsEmpty!24632 mapRes!24632))

(assert (= (and start!72472 res!570049) b!838621))

(assert (= (and b!838621 res!570048) b!838619))

(assert (= (and b!838619 res!570046) b!838618))

(assert (= (and b!838618 res!570047) b!838622))

(assert (= (and b!838617 condMapEmpty!24632) mapIsEmpty!24632))

(assert (= (and b!838617 (not condMapEmpty!24632)) mapNonEmpty!24632))

(get-info :version)

(assert (= (and mapNonEmpty!24632 ((_ is ValueCellFull!7238) mapValue!24632)) b!838620))

(assert (= (and b!838617 ((_ is ValueCellFull!7238) mapDefault!24632)) b!838616))

(assert (= start!72472 b!838617))

(declare-fun m!783737 () Bool)

(assert (=> b!838622 m!783737))

(declare-fun m!783739 () Bool)

(assert (=> b!838621 m!783739))

(declare-fun m!783741 () Bool)

(assert (=> mapNonEmpty!24632 m!783741))

(declare-fun m!783743 () Bool)

(assert (=> start!72472 m!783743))

(declare-fun m!783745 () Bool)

(assert (=> start!72472 m!783745))

(declare-fun m!783747 () Bool)

(assert (=> b!838618 m!783747))

(check-sat tp_is_empty!15355 (not b!838618) (not start!72472) (not b!838621) (not b!838622) (not mapNonEmpty!24632))
(check-sat)
