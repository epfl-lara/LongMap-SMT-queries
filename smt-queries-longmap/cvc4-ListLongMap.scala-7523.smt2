; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95404 () Bool)

(assert start!95404)

(declare-fun b!1077518 () Bool)

(declare-fun e!616111 () Bool)

(declare-fun tp_is_empty!26117 () Bool)

(assert (=> b!1077518 (= e!616111 tp_is_empty!26117)))

(declare-fun b!1077519 () Bool)

(declare-fun e!616108 () Bool)

(declare-fun e!616112 () Bool)

(declare-fun mapRes!40918 () Bool)

(assert (=> b!1077519 (= e!616108 (and e!616112 mapRes!40918))))

(declare-fun condMapEmpty!40918 () Bool)

(declare-datatypes ((V!39949 0))(
  ( (V!39950 (val!13115 Int)) )
))
(declare-datatypes ((ValueCell!12349 0))(
  ( (ValueCellFull!12349 (v!15735 V!39949)) (EmptyCell!12349) )
))
(declare-datatypes ((array!69187 0))(
  ( (array!69188 (arr!33271 (Array (_ BitVec 32) ValueCell!12349)) (size!33807 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69187)

(declare-fun mapDefault!40918 () ValueCell!12349)

