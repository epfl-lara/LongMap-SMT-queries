; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72304 () Bool)

(assert start!72304)

(declare-fun b!837713 () Bool)

(declare-fun e!467576 () Bool)

(assert (=> b!837713 (= e!467576 false)))

(declare-fun lt!380599 () Bool)

(declare-datatypes ((array!47008 0))(
  ( (array!47009 (arr!22535 (Array (_ BitVec 32) (_ BitVec 64))) (size!22975 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47008)

(declare-datatypes ((List!16036 0))(
  ( (Nil!16033) (Cons!16032 (h!17163 (_ BitVec 64)) (t!22407 List!16036)) )
))
(declare-fun arrayNoDuplicates!0 (array!47008 (_ BitVec 32) List!16036) Bool)

(assert (=> b!837713 (= lt!380599 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16033))))

(declare-fun res!569703 () Bool)

(assert (=> start!72304 (=> (not res!569703) (not e!467576))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72304 (= res!569703 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22975 _keys!868))))))

(assert (=> start!72304 e!467576))

(assert (=> start!72304 true))

(declare-fun array_inv!17960 (array!47008) Bool)

(assert (=> start!72304 (array_inv!17960 _keys!868)))

(declare-datatypes ((V!25521 0))(
  ( (V!25522 (val!7725 Int)) )
))
(declare-datatypes ((ValueCell!7238 0))(
  ( (ValueCellFull!7238 (v!10150 V!25521)) (EmptyCell!7238) )
))
(declare-datatypes ((array!47010 0))(
  ( (array!47011 (arr!22536 (Array (_ BitVec 32) ValueCell!7238)) (size!22976 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47010)

(declare-fun e!467575 () Bool)

(declare-fun array_inv!17961 (array!47010) Bool)

(assert (=> start!72304 (and (array_inv!17961 _values!688) e!467575)))

(declare-fun b!837714 () Bool)

(declare-fun res!569702 () Bool)

(assert (=> b!837714 (=> (not res!569702) (not e!467576))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837714 (= res!569702 (validMask!0 mask!1196))))

(declare-fun b!837715 () Bool)

(declare-fun res!569705 () Bool)

(assert (=> b!837715 (=> (not res!569705) (not e!467576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47008 (_ BitVec 32)) Bool)

(assert (=> b!837715 (= res!569705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24632 () Bool)

(declare-fun mapRes!24632 () Bool)

(declare-fun tp!47626 () Bool)

(declare-fun e!467574 () Bool)

(assert (=> mapNonEmpty!24632 (= mapRes!24632 (and tp!47626 e!467574))))

(declare-fun mapRest!24632 () (Array (_ BitVec 32) ValueCell!7238))

(declare-fun mapValue!24632 () ValueCell!7238)

(declare-fun mapKey!24632 () (_ BitVec 32))

(assert (=> mapNonEmpty!24632 (= (arr!22536 _values!688) (store mapRest!24632 mapKey!24632 mapValue!24632))))

(declare-fun b!837716 () Bool)

(declare-fun tp_is_empty!15355 () Bool)

(assert (=> b!837716 (= e!467574 tp_is_empty!15355)))

(declare-fun b!837717 () Bool)

(declare-fun res!569704 () Bool)

(assert (=> b!837717 (=> (not res!569704) (not e!467576))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837717 (= res!569704 (and (= (size!22976 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22975 _keys!868) (size!22976 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837718 () Bool)

(declare-fun e!467577 () Bool)

(assert (=> b!837718 (= e!467577 tp_is_empty!15355)))

(declare-fun mapIsEmpty!24632 () Bool)

(assert (=> mapIsEmpty!24632 mapRes!24632))

(declare-fun b!837719 () Bool)

(assert (=> b!837719 (= e!467575 (and e!467577 mapRes!24632))))

(declare-fun condMapEmpty!24632 () Bool)

(declare-fun mapDefault!24632 () ValueCell!7238)

