; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100040 () Bool)

(assert start!100040)

(declare-fun b_free!25619 () Bool)

(declare-fun b_next!25619 () Bool)

(assert (=> start!100040 (= b_free!25619 (not b_next!25619))))

(declare-fun tp!89570 () Bool)

(declare-fun b_and!42105 () Bool)

(assert (=> start!100040 (= tp!89570 b_and!42105)))

(declare-fun b!1192220 () Bool)

(declare-fun e!677669 () Bool)

(declare-fun e!677671 () Bool)

(declare-fun mapRes!47051 () Bool)

(assert (=> b!1192220 (= e!677669 (and e!677671 mapRes!47051))))

(declare-fun condMapEmpty!47051 () Bool)

(declare-datatypes ((V!45325 0))(
  ( (V!45326 (val!15131 Int)) )
))
(declare-datatypes ((ValueCell!14365 0))(
  ( (ValueCellFull!14365 (v!17769 V!45325)) (EmptyCell!14365) )
))
(declare-datatypes ((array!77087 0))(
  ( (array!77088 (arr!37193 (Array (_ BitVec 32) ValueCell!14365)) (size!37729 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77087)

(declare-fun mapDefault!47051 () ValueCell!14365)

