; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105326 () Bool)

(assert start!105326)

(declare-fun b_free!26999 () Bool)

(declare-fun b_next!26999 () Bool)

(assert (=> start!105326 (= b_free!26999 (not b_next!26999))))

(declare-fun tp!94508 () Bool)

(declare-fun b_and!44837 () Bool)

(assert (=> start!105326 (= tp!94508 b_and!44837)))

(declare-fun b!1254973 () Bool)

(declare-fun e!713188 () Bool)

(declare-fun e!713185 () Bool)

(declare-fun mapRes!49633 () Bool)

(assert (=> b!1254973 (= e!713188 (and e!713185 mapRes!49633))))

(declare-fun condMapEmpty!49633 () Bool)

(declare-datatypes ((V!47899 0))(
  ( (V!47900 (val!16013 Int)) )
))
(declare-datatypes ((ValueCell!15187 0))(
  ( (ValueCellFull!15187 (v!18713 V!47899)) (EmptyCell!15187) )
))
(declare-datatypes ((array!81458 0))(
  ( (array!81459 (arr!39289 (Array (_ BitVec 32) ValueCell!15187)) (size!39825 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81458)

(declare-fun mapDefault!49633 () ValueCell!15187)

