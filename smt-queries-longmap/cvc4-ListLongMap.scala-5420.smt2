; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72308 () Bool)

(assert start!72308)

(declare-fun mapIsEmpty!24638 () Bool)

(declare-fun mapRes!24638 () Bool)

(assert (=> mapIsEmpty!24638 mapRes!24638))

(declare-fun b!837755 () Bool)

(declare-fun res!569728 () Bool)

(declare-fun e!467604 () Bool)

(assert (=> b!837755 (=> (not res!569728) (not e!467604))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47016 0))(
  ( (array!47017 (arr!22539 (Array (_ BitVec 32) (_ BitVec 64))) (size!22979 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47016)

(declare-datatypes ((V!25525 0))(
  ( (V!25526 (val!7727 Int)) )
))
(declare-datatypes ((ValueCell!7240 0))(
  ( (ValueCellFull!7240 (v!10152 V!25525)) (EmptyCell!7240) )
))
(declare-datatypes ((array!47018 0))(
  ( (array!47019 (arr!22540 (Array (_ BitVec 32) ValueCell!7240)) (size!22980 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47018)

(assert (=> b!837755 (= res!569728 (and (= (size!22980 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22979 _keys!868) (size!22980 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837756 () Bool)

(declare-fun res!569729 () Bool)

(assert (=> b!837756 (=> (not res!569729) (not e!467604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837756 (= res!569729 (validMask!0 mask!1196))))

(declare-fun b!837757 () Bool)

(declare-fun res!569727 () Bool)

(assert (=> b!837757 (=> (not res!569727) (not e!467604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47016 (_ BitVec 32)) Bool)

(assert (=> b!837757 (= res!569727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837758 () Bool)

(declare-fun e!467607 () Bool)

(declare-fun e!467605 () Bool)

(assert (=> b!837758 (= e!467607 (and e!467605 mapRes!24638))))

(declare-fun condMapEmpty!24638 () Bool)

(declare-fun mapDefault!24638 () ValueCell!7240)

