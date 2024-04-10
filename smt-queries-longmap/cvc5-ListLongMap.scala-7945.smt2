; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98510 () Bool)

(assert start!98510)

(declare-fun b_free!24115 () Bool)

(declare-fun b_next!24115 () Bool)

(assert (=> start!98510 (= b_free!24115 (not b_next!24115))))

(declare-fun tp!85056 () Bool)

(declare-fun b_and!39079 () Bool)

(assert (=> start!98510 (= tp!85056 b_and!39079)))

(declare-fun b!1140426 () Bool)

(declare-fun e!648842 () Bool)

(declare-fun e!648841 () Bool)

(declare-fun mapRes!44792 () Bool)

(assert (=> b!1140426 (= e!648842 (and e!648841 mapRes!44792))))

(declare-fun condMapEmpty!44792 () Bool)

(declare-datatypes ((V!43321 0))(
  ( (V!43322 (val!14379 Int)) )
))
(declare-datatypes ((ValueCell!13613 0))(
  ( (ValueCellFull!13613 (v!17016 V!43321)) (EmptyCell!13613) )
))
(declare-datatypes ((array!74149 0))(
  ( (array!74150 (arr!35725 (Array (_ BitVec 32) ValueCell!13613)) (size!36261 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74149)

(declare-fun mapDefault!44792 () ValueCell!13613)

