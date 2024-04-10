; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84886 () Bool)

(assert start!84886)

(declare-fun res!663029 () Bool)

(declare-fun e!559533 () Bool)

(assert (=> start!84886 (=> (not res!663029) (not e!559533))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84886 (= res!663029 (validMask!0 mask!2471))))

(assert (=> start!84886 e!559533))

(assert (=> start!84886 true))

(declare-datatypes ((V!36137 0))(
  ( (V!36138 (val!11733 Int)) )
))
(declare-datatypes ((ValueCell!11201 0))(
  ( (ValueCellFull!11201 (v!14310 V!36137)) (EmptyCell!11201) )
))
(declare-datatypes ((array!62699 0))(
  ( (array!62700 (arr!30194 (Array (_ BitVec 32) ValueCell!11201)) (size!30673 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62699)

(declare-fun e!559532 () Bool)

(declare-fun array_inv!23321 (array!62699) Bool)

(assert (=> start!84886 (and (array_inv!23321 _values!1551) e!559532)))

(declare-datatypes ((array!62701 0))(
  ( (array!62702 (arr!30195 (Array (_ BitVec 32) (_ BitVec 64))) (size!30674 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62701)

(declare-fun array_inv!23322 (array!62701) Bool)

(assert (=> start!84886 (array_inv!23322 _keys!1945)))

(declare-fun b!991971 () Bool)

(declare-fun e!559531 () Bool)

(declare-fun tp_is_empty!23365 () Bool)

(assert (=> b!991971 (= e!559531 tp_is_empty!23365)))

(declare-fun b!991972 () Bool)

(declare-fun res!663030 () Bool)

(assert (=> b!991972 (=> (not res!663030) (not e!559533))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991972 (= res!663030 (and (= (size!30673 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30674 _keys!1945) (size!30673 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991973 () Bool)

(declare-fun mapRes!37119 () Bool)

(assert (=> b!991973 (= e!559532 (and e!559531 mapRes!37119))))

(declare-fun condMapEmpty!37119 () Bool)

(declare-fun mapDefault!37119 () ValueCell!11201)

