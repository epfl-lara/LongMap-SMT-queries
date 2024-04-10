; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100064 () Bool)

(assert start!100064)

(declare-fun b_free!25643 () Bool)

(declare-fun b_next!25643 () Bool)

(assert (=> start!100064 (= b_free!25643 (not b_next!25643))))

(declare-fun tp!89643 () Bool)

(declare-fun b_and!42153 () Bool)

(assert (=> start!100064 (= tp!89643 b_and!42153)))

(declare-fun b!1192784 () Bool)

(declare-fun e!677956 () Bool)

(declare-fun e!677960 () Bool)

(declare-fun mapRes!47087 () Bool)

(assert (=> b!1192784 (= e!677956 (and e!677960 mapRes!47087))))

(declare-fun condMapEmpty!47087 () Bool)

(declare-datatypes ((V!45357 0))(
  ( (V!45358 (val!15143 Int)) )
))
(declare-datatypes ((ValueCell!14377 0))(
  ( (ValueCellFull!14377 (v!17781 V!45357)) (EmptyCell!14377) )
))
(declare-datatypes ((array!77131 0))(
  ( (array!77132 (arr!37215 (Array (_ BitVec 32) ValueCell!14377)) (size!37751 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77131)

(declare-fun mapDefault!47087 () ValueCell!14377)

