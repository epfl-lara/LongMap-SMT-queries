; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43248 () Bool)

(assert start!43248)

(declare-fun b_free!12115 () Bool)

(declare-fun b_next!12115 () Bool)

(assert (=> start!43248 (= b_free!12115 (not b_next!12115))))

(declare-fun tp!42615 () Bool)

(declare-fun b_and!20867 () Bool)

(assert (=> start!43248 (= tp!42615 b_and!20867)))

(declare-fun b!479174 () Bool)

(declare-fun e!281878 () Bool)

(declare-fun e!281876 () Bool)

(declare-fun mapRes!22138 () Bool)

(assert (=> b!479174 (= e!281878 (and e!281876 mapRes!22138))))

(declare-fun condMapEmpty!22138 () Bool)

(declare-datatypes ((V!19241 0))(
  ( (V!19242 (val!6861 Int)) )
))
(declare-datatypes ((ValueCell!6452 0))(
  ( (ValueCellFull!6452 (v!9150 V!19241)) (EmptyCell!6452) )
))
(declare-datatypes ((array!30929 0))(
  ( (array!30930 (arr!14871 (Array (_ BitVec 32) ValueCell!6452)) (size!15229 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30929)

(declare-fun mapDefault!22138 () ValueCell!6452)

