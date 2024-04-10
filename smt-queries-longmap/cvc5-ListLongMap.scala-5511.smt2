; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72850 () Bool)

(assert start!72850)

(declare-fun b_free!13765 () Bool)

(declare-fun b_next!13765 () Bool)

(assert (=> start!72850 (= b_free!13765 (not b_next!13765))))

(declare-fun tp!48798 () Bool)

(declare-fun b_and!22851 () Bool)

(assert (=> start!72850 (= tp!48798 b_and!22851)))

(declare-fun mapIsEmpty!25451 () Bool)

(declare-fun mapRes!25451 () Bool)

(assert (=> mapIsEmpty!25451 mapRes!25451))

(declare-fun b!845506 () Bool)

(declare-fun res!574390 () Bool)

(declare-fun e!471997 () Bool)

(assert (=> b!845506 (=> (not res!574390) (not e!471997))))

(declare-datatypes ((array!48022 0))(
  ( (array!48023 (arr!23042 (Array (_ BitVec 32) (_ BitVec 64))) (size!23482 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48022)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48022 (_ BitVec 32)) Bool)

(assert (=> b!845506 (= res!574390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845507 () Bool)

(declare-fun e!471993 () Bool)

(declare-fun e!471995 () Bool)

(assert (=> b!845507 (= e!471993 (and e!471995 mapRes!25451))))

(declare-fun condMapEmpty!25451 () Bool)

(declare-datatypes ((V!26249 0))(
  ( (V!26250 (val!7998 Int)) )
))
(declare-datatypes ((ValueCell!7511 0))(
  ( (ValueCellFull!7511 (v!10423 V!26249)) (EmptyCell!7511) )
))
(declare-datatypes ((array!48024 0))(
  ( (array!48025 (arr!23043 (Array (_ BitVec 32) ValueCell!7511)) (size!23483 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48024)

(declare-fun mapDefault!25451 () ValueCell!7511)

