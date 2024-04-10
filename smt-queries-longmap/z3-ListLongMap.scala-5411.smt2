; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72222 () Bool)

(assert start!72222)

(declare-fun b!837051 () Bool)

(declare-fun res!569319 () Bool)

(declare-fun e!467114 () Bool)

(assert (=> b!837051 (=> (not res!569319) (not e!467114))))

(declare-datatypes ((array!46904 0))(
  ( (array!46905 (arr!22486 (Array (_ BitVec 32) (_ BitVec 64))) (size!22926 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46904)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46904 (_ BitVec 32)) Bool)

(assert (=> b!837051 (= res!569319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24545 () Bool)

(declare-fun mapRes!24545 () Bool)

(assert (=> mapIsEmpty!24545 mapRes!24545))

(declare-fun b!837053 () Bool)

(declare-fun e!467112 () Bool)

(declare-fun e!467110 () Bool)

(assert (=> b!837053 (= e!467112 (and e!467110 mapRes!24545))))

(declare-fun condMapEmpty!24545 () Bool)

(declare-datatypes ((V!25451 0))(
  ( (V!25452 (val!7699 Int)) )
))
(declare-datatypes ((ValueCell!7212 0))(
  ( (ValueCellFull!7212 (v!10123 V!25451)) (EmptyCell!7212) )
))
(declare-datatypes ((array!46906 0))(
  ( (array!46907 (arr!22487 (Array (_ BitVec 32) ValueCell!7212)) (size!22927 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46906)

(declare-fun mapDefault!24545 () ValueCell!7212)

(assert (=> b!837053 (= condMapEmpty!24545 (= (arr!22487 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7212)) mapDefault!24545)))))

(declare-fun b!837054 () Bool)

(declare-fun e!467113 () Bool)

(declare-fun tp_is_empty!15303 () Bool)

(assert (=> b!837054 (= e!467113 tp_is_empty!15303)))

(declare-fun b!837055 () Bool)

(declare-fun res!569317 () Bool)

(assert (=> b!837055 (=> (not res!569317) (not e!467114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837055 (= res!569317 (validMask!0 mask!1196))))

(declare-fun res!569316 () Bool)

(assert (=> start!72222 (=> (not res!569316) (not e!467114))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72222 (= res!569316 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22926 _keys!868))))))

(assert (=> start!72222 e!467114))

(assert (=> start!72222 true))

(declare-fun array_inv!17930 (array!46904) Bool)

(assert (=> start!72222 (array_inv!17930 _keys!868)))

(declare-fun array_inv!17931 (array!46906) Bool)

(assert (=> start!72222 (and (array_inv!17931 _values!688) e!467112)))

(declare-fun b!837052 () Bool)

(assert (=> b!837052 (= e!467114 (bvsgt #b00000000000000000000000000000000 (size!22926 _keys!868)))))

(declare-fun b!837056 () Bool)

(declare-fun res!569318 () Bool)

(assert (=> b!837056 (=> (not res!569318) (not e!467114))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837056 (= res!569318 (and (= (size!22927 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22926 _keys!868) (size!22927 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837057 () Bool)

(assert (=> b!837057 (= e!467110 tp_is_empty!15303)))

(declare-fun mapNonEmpty!24545 () Bool)

(declare-fun tp!47539 () Bool)

(assert (=> mapNonEmpty!24545 (= mapRes!24545 (and tp!47539 e!467113))))

(declare-fun mapKey!24545 () (_ BitVec 32))

(declare-fun mapRest!24545 () (Array (_ BitVec 32) ValueCell!7212))

(declare-fun mapValue!24545 () ValueCell!7212)

(assert (=> mapNonEmpty!24545 (= (arr!22487 _values!688) (store mapRest!24545 mapKey!24545 mapValue!24545))))

(assert (= (and start!72222 res!569316) b!837055))

(assert (= (and b!837055 res!569317) b!837056))

(assert (= (and b!837056 res!569318) b!837051))

(assert (= (and b!837051 res!569319) b!837052))

(assert (= (and b!837053 condMapEmpty!24545) mapIsEmpty!24545))

(assert (= (and b!837053 (not condMapEmpty!24545)) mapNonEmpty!24545))

(get-info :version)

(assert (= (and mapNonEmpty!24545 ((_ is ValueCellFull!7212) mapValue!24545)) b!837054))

(assert (= (and b!837053 ((_ is ValueCellFull!7212) mapDefault!24545)) b!837057))

(assert (= start!72222 b!837053))

(declare-fun m!782071 () Bool)

(assert (=> b!837051 m!782071))

(declare-fun m!782073 () Bool)

(assert (=> b!837055 m!782073))

(declare-fun m!782075 () Bool)

(assert (=> start!72222 m!782075))

(declare-fun m!782077 () Bool)

(assert (=> start!72222 m!782077))

(declare-fun m!782079 () Bool)

(assert (=> mapNonEmpty!24545 m!782079))

(check-sat tp_is_empty!15303 (not b!837055) (not mapNonEmpty!24545) (not start!72222) (not b!837051))
(check-sat)
