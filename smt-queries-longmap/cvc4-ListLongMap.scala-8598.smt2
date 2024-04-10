; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104822 () Bool)

(assert start!104822)

(declare-fun b_free!26627 () Bool)

(declare-fun b_next!26627 () Bool)

(assert (=> start!104822 (= b_free!26627 (not b_next!26627))))

(declare-fun tp!93370 () Bool)

(declare-fun b_and!44395 () Bool)

(assert (=> start!104822 (= tp!93370 b_and!44395)))

(declare-fun b!1249473 () Bool)

(declare-fun e!709159 () Bool)

(declare-fun tp_is_empty!31529 () Bool)

(assert (=> b!1249473 (= e!709159 tp_is_empty!31529)))

(declare-fun b!1249474 () Bool)

(declare-fun res!833485 () Bool)

(declare-fun e!709162 () Bool)

(assert (=> b!1249474 (=> (not res!833485) (not e!709162))))

(declare-datatypes ((array!80740 0))(
  ( (array!80741 (arr!38937 (Array (_ BitVec 32) (_ BitVec 64))) (size!39473 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80740)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80740 (_ BitVec 32)) Bool)

(assert (=> b!1249474 (= res!833485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249475 () Bool)

(declare-fun e!709161 () Bool)

(declare-fun e!709160 () Bool)

(declare-fun mapRes!49054 () Bool)

(assert (=> b!1249475 (= e!709161 (and e!709160 mapRes!49054))))

(declare-fun condMapEmpty!49054 () Bool)

(declare-datatypes ((V!47403 0))(
  ( (V!47404 (val!15827 Int)) )
))
(declare-datatypes ((ValueCell!15001 0))(
  ( (ValueCellFull!15001 (v!18523 V!47403)) (EmptyCell!15001) )
))
(declare-datatypes ((array!80742 0))(
  ( (array!80743 (arr!38938 (Array (_ BitVec 32) ValueCell!15001)) (size!39474 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80742)

(declare-fun mapDefault!49054 () ValueCell!15001)

