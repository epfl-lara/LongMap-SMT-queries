; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72306 () Bool)

(assert start!72306)

(declare-fun b!837734 () Bool)

(declare-fun e!467591 () Bool)

(declare-fun e!467592 () Bool)

(declare-fun mapRes!24635 () Bool)

(assert (=> b!837734 (= e!467591 (and e!467592 mapRes!24635))))

(declare-fun condMapEmpty!24635 () Bool)

(declare-datatypes ((V!25523 0))(
  ( (V!25524 (val!7726 Int)) )
))
(declare-datatypes ((ValueCell!7239 0))(
  ( (ValueCellFull!7239 (v!10151 V!25523)) (EmptyCell!7239) )
))
(declare-datatypes ((array!47012 0))(
  ( (array!47013 (arr!22537 (Array (_ BitVec 32) ValueCell!7239)) (size!22977 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47012)

(declare-fun mapDefault!24635 () ValueCell!7239)

(assert (=> b!837734 (= condMapEmpty!24635 (= (arr!22537 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7239)) mapDefault!24635)))))

(declare-fun b!837735 () Bool)

(declare-fun e!467590 () Bool)

(declare-fun tp_is_empty!15357 () Bool)

(assert (=> b!837735 (= e!467590 tp_is_empty!15357)))

(declare-fun b!837736 () Bool)

(assert (=> b!837736 (= e!467592 tp_is_empty!15357)))

(declare-fun b!837737 () Bool)

(declare-fun res!569716 () Bool)

(declare-fun e!467593 () Bool)

(assert (=> b!837737 (=> (not res!569716) (not e!467593))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837737 (= res!569716 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24635 () Bool)

(declare-fun tp!47629 () Bool)

(assert (=> mapNonEmpty!24635 (= mapRes!24635 (and tp!47629 e!467590))))

(declare-fun mapKey!24635 () (_ BitVec 32))

(declare-fun mapValue!24635 () ValueCell!7239)

(declare-fun mapRest!24635 () (Array (_ BitVec 32) ValueCell!7239))

(assert (=> mapNonEmpty!24635 (= (arr!22537 _values!688) (store mapRest!24635 mapKey!24635 mapValue!24635))))

(declare-fun b!837739 () Bool)

(declare-fun res!569715 () Bool)

(assert (=> b!837739 (=> (not res!569715) (not e!467593))))

(declare-datatypes ((array!47014 0))(
  ( (array!47015 (arr!22538 (Array (_ BitVec 32) (_ BitVec 64))) (size!22978 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47014)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47014 (_ BitVec 32)) Bool)

(assert (=> b!837739 (= res!569715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837740 () Bool)

(assert (=> b!837740 (= e!467593 false)))

(declare-fun lt!380602 () Bool)

(declare-datatypes ((List!16037 0))(
  ( (Nil!16034) (Cons!16033 (h!17164 (_ BitVec 64)) (t!22408 List!16037)) )
))
(declare-fun arrayNoDuplicates!0 (array!47014 (_ BitVec 32) List!16037) Bool)

(assert (=> b!837740 (= lt!380602 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16034))))

(declare-fun mapIsEmpty!24635 () Bool)

(assert (=> mapIsEmpty!24635 mapRes!24635))

(declare-fun res!569717 () Bool)

(assert (=> start!72306 (=> (not res!569717) (not e!467593))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72306 (= res!569717 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22978 _keys!868))))))

(assert (=> start!72306 e!467593))

(assert (=> start!72306 true))

(declare-fun array_inv!17962 (array!47014) Bool)

(assert (=> start!72306 (array_inv!17962 _keys!868)))

(declare-fun array_inv!17963 (array!47012) Bool)

(assert (=> start!72306 (and (array_inv!17963 _values!688) e!467591)))

(declare-fun b!837738 () Bool)

(declare-fun res!569714 () Bool)

(assert (=> b!837738 (=> (not res!569714) (not e!467593))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837738 (= res!569714 (and (= (size!22977 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22978 _keys!868) (size!22977 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72306 res!569717) b!837737))

(assert (= (and b!837737 res!569716) b!837738))

(assert (= (and b!837738 res!569714) b!837739))

(assert (= (and b!837739 res!569715) b!837740))

(assert (= (and b!837734 condMapEmpty!24635) mapIsEmpty!24635))

(assert (= (and b!837734 (not condMapEmpty!24635)) mapNonEmpty!24635))

(get-info :version)

(assert (= (and mapNonEmpty!24635 ((_ is ValueCellFull!7239) mapValue!24635)) b!837735))

(assert (= (and b!837734 ((_ is ValueCellFull!7239) mapDefault!24635)) b!837736))

(assert (= start!72306 b!837734))

(declare-fun m!782457 () Bool)

(assert (=> b!837740 m!782457))

(declare-fun m!782459 () Bool)

(assert (=> b!837737 m!782459))

(declare-fun m!782461 () Bool)

(assert (=> b!837739 m!782461))

(declare-fun m!782463 () Bool)

(assert (=> mapNonEmpty!24635 m!782463))

(declare-fun m!782465 () Bool)

(assert (=> start!72306 m!782465))

(declare-fun m!782467 () Bool)

(assert (=> start!72306 m!782467))

(check-sat (not b!837739) tp_is_empty!15357 (not start!72306) (not b!837737) (not mapNonEmpty!24635) (not b!837740))
(check-sat)
