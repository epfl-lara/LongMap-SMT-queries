; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72284 () Bool)

(assert start!72284)

(declare-fun b!837503 () Bool)

(declare-fun res!569584 () Bool)

(declare-fun e!467428 () Bool)

(assert (=> b!837503 (=> (not res!569584) (not e!467428))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!46968 0))(
  ( (array!46969 (arr!22515 (Array (_ BitVec 32) (_ BitVec 64))) (size!22955 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46968)

(declare-datatypes ((V!25493 0))(
  ( (V!25494 (val!7715 Int)) )
))
(declare-datatypes ((ValueCell!7228 0))(
  ( (ValueCellFull!7228 (v!10140 V!25493)) (EmptyCell!7228) )
))
(declare-datatypes ((array!46970 0))(
  ( (array!46971 (arr!22516 (Array (_ BitVec 32) ValueCell!7228)) (size!22956 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46970)

(assert (=> b!837503 (= res!569584 (and (= (size!22956 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22955 _keys!868) (size!22956 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837504 () Bool)

(declare-fun res!569585 () Bool)

(assert (=> b!837504 (=> (not res!569585) (not e!467428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837504 (= res!569585 (validMask!0 mask!1196))))

(declare-fun b!837505 () Bool)

(declare-fun e!467426 () Bool)

(declare-fun e!467425 () Bool)

(declare-fun mapRes!24602 () Bool)

(assert (=> b!837505 (= e!467426 (and e!467425 mapRes!24602))))

(declare-fun condMapEmpty!24602 () Bool)

(declare-fun mapDefault!24602 () ValueCell!7228)

