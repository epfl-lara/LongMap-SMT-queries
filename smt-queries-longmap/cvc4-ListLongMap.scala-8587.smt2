; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104756 () Bool)

(assert start!104756)

(declare-fun b_free!26561 () Bool)

(declare-fun b_next!26561 () Bool)

(assert (=> start!104756 (= b_free!26561 (not b_next!26561))))

(declare-fun tp!93172 () Bool)

(declare-fun b_and!44329 () Bool)

(assert (=> start!104756 (= tp!93172 b_and!44329)))

(declare-fun b!1248780 () Bool)

(declare-fun e!708665 () Bool)

(declare-fun tp_is_empty!31463 () Bool)

(assert (=> b!1248780 (= e!708665 tp_is_empty!31463)))

(declare-fun b!1248781 () Bool)

(declare-fun e!708663 () Bool)

(declare-fun mapRes!48955 () Bool)

(assert (=> b!1248781 (= e!708663 (and e!708665 mapRes!48955))))

(declare-fun condMapEmpty!48955 () Bool)

(declare-datatypes ((V!47315 0))(
  ( (V!47316 (val!15794 Int)) )
))
(declare-datatypes ((ValueCell!14968 0))(
  ( (ValueCellFull!14968 (v!18490 V!47315)) (EmptyCell!14968) )
))
(declare-datatypes ((array!80614 0))(
  ( (array!80615 (arr!38874 (Array (_ BitVec 32) ValueCell!14968)) (size!39410 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80614)

(declare-fun mapDefault!48955 () ValueCell!14968)

