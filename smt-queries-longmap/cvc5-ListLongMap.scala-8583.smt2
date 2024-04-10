; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104716 () Bool)

(assert start!104716)

(declare-fun b_free!26533 () Bool)

(declare-fun b_next!26533 () Bool)

(assert (=> start!104716 (= b_free!26533 (not b_next!26533))))

(declare-fun tp!93086 () Bool)

(declare-fun b_and!44297 () Bool)

(assert (=> start!104716 (= tp!93086 b_and!44297)))

(declare-fun b!1248413 () Bool)

(declare-fun e!708405 () Bool)

(declare-fun e!708408 () Bool)

(declare-fun mapRes!48910 () Bool)

(assert (=> b!1248413 (= e!708405 (and e!708408 mapRes!48910))))

(declare-fun condMapEmpty!48910 () Bool)

(declare-datatypes ((V!47279 0))(
  ( (V!47280 (val!15780 Int)) )
))
(declare-datatypes ((ValueCell!14954 0))(
  ( (ValueCellFull!14954 (v!18476 V!47279)) (EmptyCell!14954) )
))
(declare-datatypes ((array!80562 0))(
  ( (array!80563 (arr!38849 (Array (_ BitVec 32) ValueCell!14954)) (size!39385 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80562)

(declare-fun mapDefault!48910 () ValueCell!14954)

