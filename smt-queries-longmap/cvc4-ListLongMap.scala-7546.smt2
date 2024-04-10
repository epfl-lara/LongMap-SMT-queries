; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95600 () Bool)

(assert start!95600)

(declare-fun b_free!22253 () Bool)

(declare-fun b_next!22253 () Bool)

(assert (=> start!95600 (= b_free!22253 (not b_next!22253))))

(declare-fun tp!78608 () Bool)

(declare-fun b_and!35231 () Bool)

(assert (=> start!95600 (= tp!78608 b_and!35231)))

(declare-fun b!1080069 () Bool)

(declare-fun res!719817 () Bool)

(declare-fun e!617458 () Bool)

(assert (=> b!1080069 (=> (not res!719817) (not e!617458))))

(declare-datatypes ((array!69463 0))(
  ( (array!69464 (arr!33405 (Array (_ BitVec 32) (_ BitVec 64))) (size!33941 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69463)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69463 (_ BitVec 32)) Bool)

(assert (=> b!1080069 (= res!719817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080070 () Bool)

(declare-fun e!617457 () Bool)

(declare-fun e!617459 () Bool)

(declare-fun mapRes!41137 () Bool)

(assert (=> b!1080070 (= e!617457 (and e!617459 mapRes!41137))))

(declare-fun condMapEmpty!41137 () Bool)

(declare-datatypes ((V!40133 0))(
  ( (V!40134 (val!13184 Int)) )
))
(declare-datatypes ((ValueCell!12418 0))(
  ( (ValueCellFull!12418 (v!15805 V!40133)) (EmptyCell!12418) )
))
(declare-datatypes ((array!69465 0))(
  ( (array!69466 (arr!33406 (Array (_ BitVec 32) ValueCell!12418)) (size!33942 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69465)

(declare-fun mapDefault!41137 () ValueCell!12418)

