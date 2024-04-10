; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95462 () Bool)

(assert start!95462)

(declare-fun mapIsEmpty!40972 () Bool)

(declare-fun mapRes!40972 () Bool)

(assert (=> mapIsEmpty!40972 mapRes!40972))

(declare-fun b!1078080 () Bool)

(declare-fun res!718355 () Bool)

(declare-fun e!616419 () Bool)

(assert (=> b!1078080 (=> (not res!718355) (not e!616419))))

(declare-datatypes ((array!69251 0))(
  ( (array!69252 (arr!33301 (Array (_ BitVec 32) (_ BitVec 64))) (size!33837 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69251)

(assert (=> b!1078080 (= res!718355 (and (bvsle #b00000000000000000000000000000000 (size!33837 _keys!1070)) (bvslt (size!33837 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1078081 () Bool)

(declare-fun res!718350 () Bool)

(assert (=> b!1078081 (=> (not res!718350) (not e!616419))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!39993 0))(
  ( (V!39994 (val!13131 Int)) )
))
(declare-datatypes ((ValueCell!12365 0))(
  ( (ValueCellFull!12365 (v!15751 V!39993)) (EmptyCell!12365) )
))
(declare-datatypes ((array!69253 0))(
  ( (array!69254 (arr!33302 (Array (_ BitVec 32) ValueCell!12365)) (size!33838 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69253)

(assert (=> b!1078081 (= res!718350 (and (= (size!33838 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33837 _keys!1070) (size!33838 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078082 () Bool)

(declare-fun e!616421 () Bool)

(declare-datatypes ((List!23230 0))(
  ( (Nil!23227) (Cons!23226 (h!24435 (_ BitVec 64)) (t!32589 List!23230)) )
))
(declare-fun contains!6371 (List!23230 (_ BitVec 64)) Bool)

(assert (=> b!1078082 (= e!616421 (contains!6371 Nil!23227 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1078083 () Bool)

(declare-fun res!718353 () Bool)

(assert (=> b!1078083 (=> (not res!718353) (not e!616419))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078083 (= res!718353 (validKeyInArray!0 k!904))))

(declare-fun b!1078084 () Bool)

(declare-fun e!616420 () Bool)

(declare-fun e!616418 () Bool)

(assert (=> b!1078084 (= e!616420 (and e!616418 mapRes!40972))))

(declare-fun condMapEmpty!40972 () Bool)

(declare-fun mapDefault!40972 () ValueCell!12365)

