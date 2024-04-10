; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72318 () Bool)

(assert start!72318)

(declare-fun b!837860 () Bool)

(declare-fun e!467683 () Bool)

(declare-fun e!467679 () Bool)

(declare-fun mapRes!24653 () Bool)

(assert (=> b!837860 (= e!467683 (and e!467679 mapRes!24653))))

(declare-fun condMapEmpty!24653 () Bool)

(declare-datatypes ((V!25539 0))(
  ( (V!25540 (val!7732 Int)) )
))
(declare-datatypes ((ValueCell!7245 0))(
  ( (ValueCellFull!7245 (v!10157 V!25539)) (EmptyCell!7245) )
))
(declare-datatypes ((array!47034 0))(
  ( (array!47035 (arr!22548 (Array (_ BitVec 32) ValueCell!7245)) (size!22988 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47034)

(declare-fun mapDefault!24653 () ValueCell!7245)

(assert (=> b!837860 (= condMapEmpty!24653 (= (arr!22548 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7245)) mapDefault!24653)))))

(declare-fun b!837861 () Bool)

(declare-fun res!569787 () Bool)

(declare-fun e!467681 () Bool)

(assert (=> b!837861 (=> (not res!569787) (not e!467681))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837861 (= res!569787 (validMask!0 mask!1196))))

(declare-fun b!837862 () Bool)

(declare-fun res!569788 () Bool)

(assert (=> b!837862 (=> (not res!569788) (not e!467681))))

(declare-datatypes ((array!47036 0))(
  ( (array!47037 (arr!22549 (Array (_ BitVec 32) (_ BitVec 64))) (size!22989 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47036)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47036 (_ BitVec 32)) Bool)

(assert (=> b!837862 (= res!569788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24653 () Bool)

(assert (=> mapIsEmpty!24653 mapRes!24653))

(declare-fun res!569789 () Bool)

(assert (=> start!72318 (=> (not res!569789) (not e!467681))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72318 (= res!569789 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22989 _keys!868))))))

(assert (=> start!72318 e!467681))

(assert (=> start!72318 true))

(declare-fun array_inv!17968 (array!47036) Bool)

(assert (=> start!72318 (array_inv!17968 _keys!868)))

(declare-fun array_inv!17969 (array!47034) Bool)

(assert (=> start!72318 (and (array_inv!17969 _values!688) e!467683)))

(declare-fun b!837863 () Bool)

(declare-fun e!467680 () Bool)

(declare-fun tp_is_empty!15369 () Bool)

(assert (=> b!837863 (= e!467680 tp_is_empty!15369)))

(declare-fun b!837864 () Bool)

(declare-fun res!569786 () Bool)

(assert (=> b!837864 (=> (not res!569786) (not e!467681))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837864 (= res!569786 (and (= (size!22988 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22989 _keys!868) (size!22988 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837865 () Bool)

(assert (=> b!837865 (= e!467681 false)))

(declare-fun lt!380620 () Bool)

(declare-datatypes ((List!16041 0))(
  ( (Nil!16038) (Cons!16037 (h!17168 (_ BitVec 64)) (t!22412 List!16041)) )
))
(declare-fun arrayNoDuplicates!0 (array!47036 (_ BitVec 32) List!16041) Bool)

(assert (=> b!837865 (= lt!380620 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16038))))

(declare-fun mapNonEmpty!24653 () Bool)

(declare-fun tp!47647 () Bool)

(assert (=> mapNonEmpty!24653 (= mapRes!24653 (and tp!47647 e!467680))))

(declare-fun mapKey!24653 () (_ BitVec 32))

(declare-fun mapValue!24653 () ValueCell!7245)

(declare-fun mapRest!24653 () (Array (_ BitVec 32) ValueCell!7245))

(assert (=> mapNonEmpty!24653 (= (arr!22548 _values!688) (store mapRest!24653 mapKey!24653 mapValue!24653))))

(declare-fun b!837866 () Bool)

(assert (=> b!837866 (= e!467679 tp_is_empty!15369)))

(assert (= (and start!72318 res!569789) b!837861))

(assert (= (and b!837861 res!569787) b!837864))

(assert (= (and b!837864 res!569786) b!837862))

(assert (= (and b!837862 res!569788) b!837865))

(assert (= (and b!837860 condMapEmpty!24653) mapIsEmpty!24653))

(assert (= (and b!837860 (not condMapEmpty!24653)) mapNonEmpty!24653))

(get-info :version)

(assert (= (and mapNonEmpty!24653 ((_ is ValueCellFull!7245) mapValue!24653)) b!837863))

(assert (= (and b!837860 ((_ is ValueCellFull!7245) mapDefault!24653)) b!837866))

(assert (= start!72318 b!837860))

(declare-fun m!782529 () Bool)

(assert (=> b!837862 m!782529))

(declare-fun m!782531 () Bool)

(assert (=> b!837861 m!782531))

(declare-fun m!782533 () Bool)

(assert (=> mapNonEmpty!24653 m!782533))

(declare-fun m!782535 () Bool)

(assert (=> start!72318 m!782535))

(declare-fun m!782537 () Bool)

(assert (=> start!72318 m!782537))

(declare-fun m!782539 () Bool)

(assert (=> b!837865 m!782539))

(check-sat (not b!837861) tp_is_empty!15369 (not mapNonEmpty!24653) (not start!72318) (not b!837865) (not b!837862))
(check-sat)
