; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84368 () Bool)

(assert start!84368)

(declare-fun b!986839 () Bool)

(declare-fun e!556494 () Bool)

(declare-fun e!556496 () Bool)

(declare-fun mapRes!36785 () Bool)

(assert (=> b!986839 (= e!556494 (and e!556496 mapRes!36785))))

(declare-fun condMapEmpty!36785 () Bool)

(declare-datatypes ((V!35877 0))(
  ( (V!35878 (val!11636 Int)) )
))
(declare-datatypes ((ValueCell!11104 0))(
  ( (ValueCellFull!11104 (v!14198 V!35877)) (EmptyCell!11104) )
))
(declare-datatypes ((array!62303 0))(
  ( (array!62304 (arr!30009 (Array (_ BitVec 32) ValueCell!11104)) (size!30488 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62303)

(declare-fun mapDefault!36785 () ValueCell!11104)

