; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96154 () Bool)

(assert start!96154)

(declare-fun b_free!22807 () Bool)

(declare-fun b_next!22807 () Bool)

(assert (=> start!96154 (= b_free!22807 (not b_next!22807))))

(declare-fun tp!80269 () Bool)

(declare-fun b_and!36289 () Bool)

(assert (=> start!96154 (= tp!80269 b_and!36289)))

(declare-fun b!1091503 () Bool)

(declare-fun res!728255 () Bool)

(declare-fun e!623377 () Bool)

(assert (=> b!1091503 (=> (not res!728255) (not e!623377))))

(declare-datatypes ((array!70537 0))(
  ( (array!70538 (arr!33942 (Array (_ BitVec 32) (_ BitVec 64))) (size!34478 (_ BitVec 32))) )
))
(declare-fun lt!487486 () array!70537)

(declare-datatypes ((List!23707 0))(
  ( (Nil!23704) (Cons!23703 (h!24912 (_ BitVec 64)) (t!33572 List!23707)) )
))
(declare-fun arrayNoDuplicates!0 (array!70537 (_ BitVec 32) List!23707) Bool)

(assert (=> b!1091503 (= res!728255 (arrayNoDuplicates!0 lt!487486 #b00000000000000000000000000000000 Nil!23704))))

(declare-fun b!1091504 () Bool)

(declare-fun res!728252 () Bool)

(declare-fun e!623373 () Bool)

(assert (=> b!1091504 (=> (not res!728252) (not e!623373))))

(declare-fun _keys!1070 () array!70537)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70537 (_ BitVec 32)) Bool)

(assert (=> b!1091504 (= res!728252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091505 () Bool)

(declare-fun e!623378 () Bool)

(declare-fun tp_is_empty!26809 () Bool)

(assert (=> b!1091505 (= e!623378 tp_is_empty!26809)))

(declare-fun b!1091506 () Bool)

(declare-fun e!623374 () Bool)

(declare-fun e!623375 () Bool)

(declare-fun mapRes!41968 () Bool)

(assert (=> b!1091506 (= e!623374 (and e!623375 mapRes!41968))))

(declare-fun condMapEmpty!41968 () Bool)

(declare-datatypes ((V!40873 0))(
  ( (V!40874 (val!13461 Int)) )
))
(declare-datatypes ((ValueCell!12695 0))(
  ( (ValueCellFull!12695 (v!16082 V!40873)) (EmptyCell!12695) )
))
(declare-datatypes ((array!70539 0))(
  ( (array!70540 (arr!33943 (Array (_ BitVec 32) ValueCell!12695)) (size!34479 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70539)

(declare-fun mapDefault!41968 () ValueCell!12695)

