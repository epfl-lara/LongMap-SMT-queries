; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95584 () Bool)

(assert start!95584)

(declare-fun b!1079781 () Bool)

(declare-fun e!617311 () Bool)

(declare-fun tp_is_empty!26239 () Bool)

(assert (=> b!1079781 (= e!617311 tp_is_empty!26239)))

(declare-fun b!1079782 () Bool)

(declare-fun e!617310 () Bool)

(declare-fun e!617314 () Bool)

(declare-fun mapRes!41113 () Bool)

(assert (=> b!1079782 (= e!617310 (and e!617314 mapRes!41113))))

(declare-fun condMapEmpty!41113 () Bool)

(declare-datatypes ((V!40113 0))(
  ( (V!40114 (val!13176 Int)) )
))
(declare-datatypes ((ValueCell!12410 0))(
  ( (ValueCellFull!12410 (v!15797 V!40113)) (EmptyCell!12410) )
))
(declare-datatypes ((array!69433 0))(
  ( (array!69434 (arr!33390 (Array (_ BitVec 32) ValueCell!12410)) (size!33926 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69433)

(declare-fun mapDefault!41113 () ValueCell!12410)

