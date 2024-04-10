; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95160 () Bool)

(assert start!95160)

(declare-fun b_free!22217 () Bool)

(declare-fun b_next!22217 () Bool)

(assert (=> start!95160 (= b_free!22217 (not b_next!22217))))

(declare-fun tp!78139 () Bool)

(declare-fun b_and!35159 () Bool)

(assert (=> start!95160 (= tp!78139 b_and!35159)))

(declare-fun b!1075647 () Bool)

(declare-fun e!614772 () Bool)

(declare-fun e!614774 () Bool)

(declare-fun mapRes!40777 () Bool)

(assert (=> b!1075647 (= e!614772 (and e!614774 mapRes!40777))))

(declare-fun condMapEmpty!40777 () Bool)

(declare-datatypes ((V!39837 0))(
  ( (V!39838 (val!13064 Int)) )
))
(declare-datatypes ((ValueCell!12310 0))(
  ( (ValueCellFull!12310 (v!15689 V!39837)) (EmptyCell!12310) )
))
(declare-datatypes ((array!69023 0))(
  ( (array!69024 (arr!33197 (Array (_ BitVec 32) ValueCell!12310)) (size!33733 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69023)

(declare-fun mapDefault!40777 () ValueCell!12310)

