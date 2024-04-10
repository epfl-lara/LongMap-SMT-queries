; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95424 () Bool)

(assert start!95424)

(declare-fun b!1077783 () Bool)

(declare-fun e!616261 () Bool)

(declare-datatypes ((array!69223 0))(
  ( (array!69224 (arr!33289 (Array (_ BitVec 32) (_ BitVec 64))) (size!33825 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69223)

(assert (=> b!1077783 (= e!616261 (and (bvsle #b00000000000000000000000000000000 (size!33825 _keys!1070)) (bvsge (size!33825 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1077784 () Bool)

(declare-fun e!616258 () Bool)

(declare-fun e!616262 () Bool)

(declare-fun mapRes!40948 () Bool)

(assert (=> b!1077784 (= e!616258 (and e!616262 mapRes!40948))))

(declare-fun condMapEmpty!40948 () Bool)

(declare-datatypes ((V!39977 0))(
  ( (V!39978 (val!13125 Int)) )
))
(declare-datatypes ((ValueCell!12359 0))(
  ( (ValueCellFull!12359 (v!15745 V!39977)) (EmptyCell!12359) )
))
(declare-datatypes ((array!69225 0))(
  ( (array!69226 (arr!33290 (Array (_ BitVec 32) ValueCell!12359)) (size!33826 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69225)

(declare-fun mapDefault!40948 () ValueCell!12359)

