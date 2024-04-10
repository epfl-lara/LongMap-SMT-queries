; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95422 () Bool)

(assert start!95422)

(declare-fun b!1077750 () Bool)

(declare-fun res!718129 () Bool)

(declare-fun e!616244 () Bool)

(assert (=> b!1077750 (=> (not res!718129) (not e!616244))))

(declare-datatypes ((array!69219 0))(
  ( (array!69220 (arr!33287 (Array (_ BitVec 32) (_ BitVec 64))) (size!33823 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69219)

(declare-datatypes ((List!23226 0))(
  ( (Nil!23223) (Cons!23222 (h!24431 (_ BitVec 64)) (t!32585 List!23226)) )
))
(declare-fun arrayNoDuplicates!0 (array!69219 (_ BitVec 32) List!23226) Bool)

(assert (=> b!1077750 (= res!718129 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23223))))

(declare-fun b!1077751 () Bool)

(declare-fun e!616243 () Bool)

(declare-fun e!616246 () Bool)

(declare-fun mapRes!40945 () Bool)

(assert (=> b!1077751 (= e!616243 (and e!616246 mapRes!40945))))

(declare-fun condMapEmpty!40945 () Bool)

(declare-datatypes ((V!39973 0))(
  ( (V!39974 (val!13124 Int)) )
))
(declare-datatypes ((ValueCell!12358 0))(
  ( (ValueCellFull!12358 (v!15744 V!39973)) (EmptyCell!12358) )
))
(declare-datatypes ((array!69221 0))(
  ( (array!69222 (arr!33288 (Array (_ BitVec 32) ValueCell!12358)) (size!33824 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69221)

(declare-fun mapDefault!40945 () ValueCell!12358)

