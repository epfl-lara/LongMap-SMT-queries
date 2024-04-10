; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95632 () Bool)

(assert start!95632)

(declare-fun b_free!22285 () Bool)

(declare-fun b_next!22285 () Bool)

(assert (=> start!95632 (= b_free!22285 (not b_next!22285))))

(declare-fun tp!78703 () Bool)

(declare-fun b_and!35263 () Bool)

(assert (=> start!95632 (= tp!78703 b_and!35263)))

(declare-fun b!1080645 () Bool)

(declare-fun res!720250 () Bool)

(declare-fun e!617742 () Bool)

(assert (=> b!1080645 (=> (not res!720250) (not e!617742))))

(declare-datatypes ((array!69525 0))(
  ( (array!69526 (arr!33436 (Array (_ BitVec 32) (_ BitVec 64))) (size!33972 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69525)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69525 (_ BitVec 32)) Bool)

(assert (=> b!1080645 (= res!720250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080646 () Bool)

(declare-fun e!617746 () Bool)

(declare-fun e!617747 () Bool)

(declare-fun mapRes!41185 () Bool)

(assert (=> b!1080646 (= e!617746 (and e!617747 mapRes!41185))))

(declare-fun condMapEmpty!41185 () Bool)

(declare-datatypes ((V!40177 0))(
  ( (V!40178 (val!13200 Int)) )
))
(declare-datatypes ((ValueCell!12434 0))(
  ( (ValueCellFull!12434 (v!15821 V!40177)) (EmptyCell!12434) )
))
(declare-datatypes ((array!69527 0))(
  ( (array!69528 (arr!33437 (Array (_ BitVec 32) ValueCell!12434)) (size!33973 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69527)

(declare-fun mapDefault!41185 () ValueCell!12434)

