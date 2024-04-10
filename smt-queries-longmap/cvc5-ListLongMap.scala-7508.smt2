; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95204 () Bool)

(assert start!95204)

(declare-fun b_free!22225 () Bool)

(declare-fun b_next!22225 () Bool)

(assert (=> start!95204 (= b_free!22225 (not b_next!22225))))

(declare-fun tp!78170 () Bool)

(declare-fun b_and!35191 () Bool)

(assert (=> start!95204 (= tp!78170 b_and!35191)))

(declare-fun b!1076119 () Bool)

(declare-fun e!615089 () Bool)

(declare-fun e!615087 () Bool)

(declare-fun mapRes!40795 () Bool)

(assert (=> b!1076119 (= e!615089 (and e!615087 mapRes!40795))))

(declare-fun condMapEmpty!40795 () Bool)

(declare-datatypes ((V!39849 0))(
  ( (V!39850 (val!13068 Int)) )
))
(declare-datatypes ((ValueCell!12314 0))(
  ( (ValueCellFull!12314 (v!15695 V!39849)) (EmptyCell!12314) )
))
(declare-datatypes ((array!69041 0))(
  ( (array!69042 (arr!33204 (Array (_ BitVec 32) ValueCell!12314)) (size!33740 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69041)

(declare-fun mapDefault!40795 () ValueCell!12314)

