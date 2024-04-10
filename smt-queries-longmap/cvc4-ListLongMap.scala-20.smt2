; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!546 () Bool)

(assert start!546)

(declare-fun b!3249 () Bool)

(declare-fun e!1491 () Bool)

(declare-fun tp_is_empty!107 () Bool)

(assert (=> b!3249 (= e!1491 tp_is_empty!107)))

(declare-fun b!3250 () Bool)

(declare-fun e!1489 () Bool)

(assert (=> b!3250 (= e!1489 false)))

(declare-fun lt!444 () Bool)

(declare-datatypes ((array!153 0))(
  ( (array!154 (arr!70 (Array (_ BitVec 32) (_ BitVec 64))) (size!132 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!153)

(declare-datatypes ((List!50 0))(
  ( (Nil!47) (Cons!46 (h!612 (_ BitVec 64)) (t!2177 List!50)) )
))
(declare-fun arrayNoDuplicates!0 (array!153 (_ BitVec 32) List!50) Bool)

(assert (=> b!3250 (= lt!444 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!47))))

(declare-fun b!3251 () Bool)

(declare-fun e!1492 () Bool)

(assert (=> b!3251 (= e!1492 tp_is_empty!107)))

(declare-fun mapIsEmpty!116 () Bool)

(declare-fun mapRes!116 () Bool)

(assert (=> mapIsEmpty!116 mapRes!116))

(declare-fun b!3252 () Bool)

(declare-fun e!1493 () Bool)

(assert (=> b!3252 (= e!1493 (and e!1491 mapRes!116))))

(declare-fun condMapEmpty!116 () Bool)

(declare-datatypes ((V!319 0))(
  ( (V!320 (val!59 Int)) )
))
(declare-datatypes ((ValueCell!37 0))(
  ( (ValueCellFull!37 (v!1146 V!319)) (EmptyCell!37) )
))
(declare-datatypes ((array!155 0))(
  ( (array!156 (arr!71 (Array (_ BitVec 32) ValueCell!37)) (size!133 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!155)

(declare-fun mapDefault!116 () ValueCell!37)

