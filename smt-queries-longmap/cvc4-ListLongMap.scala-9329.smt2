; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111414 () Bool)

(assert start!111414)

(declare-fun b_free!30071 () Bool)

(declare-fun b_next!30071 () Bool)

(assert (=> start!111414 (= b_free!30071 (not b_next!30071))))

(declare-fun tp!105688 () Bool)

(declare-fun b_and!48301 () Bool)

(assert (=> start!111414 (= tp!105688 b_and!48301)))

(declare-fun b!1318460 () Bool)

(declare-fun e!752371 () Bool)

(declare-fun e!752373 () Bool)

(declare-fun mapRes!55484 () Bool)

(assert (=> b!1318460 (= e!752371 (and e!752373 mapRes!55484))))

(declare-fun condMapEmpty!55484 () Bool)

(declare-datatypes ((V!52957 0))(
  ( (V!52958 (val!18020 Int)) )
))
(declare-datatypes ((ValueCell!17047 0))(
  ( (ValueCellFull!17047 (v!20650 V!52957)) (EmptyCell!17047) )
))
(declare-datatypes ((array!88728 0))(
  ( (array!88729 (arr!42838 (Array (_ BitVec 32) ValueCell!17047)) (size!43388 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88728)

(declare-fun mapDefault!55484 () ValueCell!17047)

