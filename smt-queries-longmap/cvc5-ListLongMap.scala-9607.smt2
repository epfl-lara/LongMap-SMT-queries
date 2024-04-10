; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113562 () Bool)

(assert start!113562)

(declare-fun b_free!31555 () Bool)

(declare-fun b_next!31555 () Bool)

(assert (=> start!113562 (= b_free!31555 (not b_next!31555))))

(declare-fun tp!110473 () Bool)

(declare-fun b_and!50899 () Bool)

(assert (=> start!113562 (= tp!110473 b_and!50899)))

(declare-fun b!1348187 () Bool)

(declare-fun e!766965 () Bool)

(declare-fun e!766967 () Bool)

(declare-fun mapRes!58043 () Bool)

(assert (=> b!1348187 (= e!766965 (and e!766967 mapRes!58043))))

(declare-fun condMapEmpty!58043 () Bool)

(declare-datatypes ((V!55177 0))(
  ( (V!55178 (val!18852 Int)) )
))
(declare-datatypes ((ValueCell!17879 0))(
  ( (ValueCellFull!17879 (v!21503 V!55177)) (EmptyCell!17879) )
))
(declare-datatypes ((array!91940 0))(
  ( (array!91941 (arr!44425 (Array (_ BitVec 32) ValueCell!17879)) (size!44975 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91940)

(declare-fun mapDefault!58043 () ValueCell!17879)

