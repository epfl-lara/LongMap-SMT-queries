; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104710 () Bool)

(assert start!104710)

(declare-fun b_free!26527 () Bool)

(declare-fun b_next!26527 () Bool)

(assert (=> start!104710 (= b_free!26527 (not b_next!26527))))

(declare-fun tp!93067 () Bool)

(declare-fun b_and!44291 () Bool)

(assert (=> start!104710 (= tp!93067 b_and!44291)))

(declare-fun b!1248350 () Bool)

(declare-fun e!708361 () Bool)

(declare-fun tp_is_empty!31429 () Bool)

(assert (=> b!1248350 (= e!708361 tp_is_empty!31429)))

(declare-fun b!1248351 () Bool)

(declare-fun res!832858 () Bool)

(declare-fun e!708363 () Bool)

(assert (=> b!1248351 (=> (not res!832858) (not e!708363))))

(declare-datatypes ((array!80550 0))(
  ( (array!80551 (arr!38843 (Array (_ BitVec 32) (_ BitVec 64))) (size!39379 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80550)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80550 (_ BitVec 32)) Bool)

(assert (=> b!1248351 (= res!832858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248352 () Bool)

(declare-fun e!708360 () Bool)

(declare-fun e!708364 () Bool)

(declare-fun mapRes!48901 () Bool)

(assert (=> b!1248352 (= e!708360 (and e!708364 mapRes!48901))))

(declare-fun condMapEmpty!48901 () Bool)

(declare-datatypes ((V!47271 0))(
  ( (V!47272 (val!15777 Int)) )
))
(declare-datatypes ((ValueCell!14951 0))(
  ( (ValueCellFull!14951 (v!18473 V!47271)) (EmptyCell!14951) )
))
(declare-datatypes ((array!80552 0))(
  ( (array!80553 (arr!38844 (Array (_ BitVec 32) ValueCell!14951)) (size!39380 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80552)

(declare-fun mapDefault!48901 () ValueCell!14951)

