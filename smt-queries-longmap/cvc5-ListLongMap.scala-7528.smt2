; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95442 () Bool)

(assert start!95442)

(declare-fun b!1077923 () Bool)

(declare-fun res!718242 () Bool)

(declare-fun e!616336 () Bool)

(assert (=> b!1077923 (=> (not res!718242) (not e!616336))))

(declare-datatypes ((array!69237 0))(
  ( (array!69238 (arr!33295 (Array (_ BitVec 32) (_ BitVec 64))) (size!33831 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69237)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69237 (_ BitVec 32)) Bool)

(assert (=> b!1077923 (= res!718242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077924 () Bool)

(declare-fun res!718245 () Bool)

(assert (=> b!1077924 (=> (not res!718245) (not e!616336))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1077924 (= res!718245 (= (select (arr!33295 _keys!1070) i!650) k!904))))

(declare-fun b!1077925 () Bool)

(declare-fun res!718244 () Bool)

(assert (=> b!1077925 (=> (not res!718244) (not e!616336))))

(assert (=> b!1077925 (= res!718244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69238 (store (arr!33295 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33831 _keys!1070)) mask!1414))))

(declare-fun b!1077926 () Bool)

(declare-fun res!718240 () Bool)

(assert (=> b!1077926 (=> (not res!718240) (not e!616336))))

(assert (=> b!1077926 (= res!718240 (and (bvsle #b00000000000000000000000000000000 (size!33831 _keys!1070)) (bvslt (size!33831 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1077927 () Bool)

(declare-fun e!616335 () Bool)

(declare-fun e!616334 () Bool)

(declare-fun mapRes!40960 () Bool)

(assert (=> b!1077927 (= e!616335 (and e!616334 mapRes!40960))))

(declare-fun condMapEmpty!40960 () Bool)

(declare-datatypes ((V!39985 0))(
  ( (V!39986 (val!13128 Int)) )
))
(declare-datatypes ((ValueCell!12362 0))(
  ( (ValueCellFull!12362 (v!15748 V!39985)) (EmptyCell!12362) )
))
(declare-datatypes ((array!69239 0))(
  ( (array!69240 (arr!33296 (Array (_ BitVec 32) ValueCell!12362)) (size!33832 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69239)

(declare-fun mapDefault!40960 () ValueCell!12362)

