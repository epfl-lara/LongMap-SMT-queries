; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95818 () Bool)

(assert start!95818)

(declare-fun b_free!22471 () Bool)

(declare-fun b_next!22471 () Bool)

(assert (=> start!95818 (= b_free!22471 (not b_next!22471))))

(declare-fun tp!79261 () Bool)

(declare-fun b_and!35617 () Bool)

(assert (=> start!95818 (= tp!79261 b_and!35617)))

(declare-fun b!1084161 () Bool)

(declare-fun e!619420 () Bool)

(declare-fun e!619419 () Bool)

(assert (=> b!1084161 (= e!619420 e!619419)))

(declare-fun res!722759 () Bool)

(assert (=> b!1084161 (=> (not res!722759) (not e!619419))))

(declare-datatypes ((array!69887 0))(
  ( (array!69888 (arr!33617 (Array (_ BitVec 32) (_ BitVec 64))) (size!34153 (_ BitVec 32))) )
))
(declare-fun lt!480511 () array!69887)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69887 (_ BitVec 32)) Bool)

(assert (=> b!1084161 (= res!722759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480511 mask!1414))))

(declare-fun _keys!1070 () array!69887)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084161 (= lt!480511 (array!69888 (store (arr!33617 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34153 _keys!1070)))))

(declare-fun b!1084162 () Bool)

(declare-fun e!619416 () Bool)

(declare-fun e!619421 () Bool)

(declare-fun mapRes!41464 () Bool)

(assert (=> b!1084162 (= e!619416 (and e!619421 mapRes!41464))))

(declare-fun condMapEmpty!41464 () Bool)

(declare-datatypes ((V!40425 0))(
  ( (V!40426 (val!13293 Int)) )
))
(declare-datatypes ((ValueCell!12527 0))(
  ( (ValueCellFull!12527 (v!15914 V!40425)) (EmptyCell!12527) )
))
(declare-datatypes ((array!69889 0))(
  ( (array!69890 (arr!33618 (Array (_ BitVec 32) ValueCell!12527)) (size!34154 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69889)

(declare-fun mapDefault!41464 () ValueCell!12527)

