; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7398 () Bool)

(assert start!7398)

(declare-fun b!47470 () Bool)

(declare-fun e!30401 () Bool)

(assert (=> b!47470 (= e!30401 false)))

(declare-fun lt!20423 () Bool)

(declare-datatypes ((array!3135 0))(
  ( (array!3136 (arr!1502 (Array (_ BitVec 32) (_ BitVec 64))) (size!1724 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3135)

(declare-datatypes ((List!1260 0))(
  ( (Nil!1257) (Cons!1256 (h!1836 (_ BitVec 64)) (t!4288 List!1260)) )
))
(declare-fun arrayNoDuplicates!0 (array!3135 (_ BitVec 32) List!1260) Bool)

(assert (=> b!47470 (= lt!20423 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1257))))

(declare-fun mapIsEmpty!2096 () Bool)

(declare-fun mapRes!2096 () Bool)

(assert (=> mapIsEmpty!2096 mapRes!2096))

(declare-fun b!47471 () Bool)

(declare-fun e!30402 () Bool)

(declare-fun e!30403 () Bool)

(assert (=> b!47471 (= e!30402 (and e!30403 mapRes!2096))))

(declare-fun condMapEmpty!2096 () Bool)

(declare-datatypes ((V!2447 0))(
  ( (V!2448 (val!1056 Int)) )
))
(declare-datatypes ((ValueCell!728 0))(
  ( (ValueCellFull!728 (v!2117 V!2447)) (EmptyCell!728) )
))
(declare-datatypes ((array!3137 0))(
  ( (array!3138 (arr!1503 (Array (_ BitVec 32) ValueCell!728)) (size!1725 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3137)

(declare-fun mapDefault!2096 () ValueCell!728)

