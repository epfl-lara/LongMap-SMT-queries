; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109370 () Bool)

(assert start!109370)

(declare-fun b_free!28859 () Bool)

(declare-fun b_next!28859 () Bool)

(assert (=> start!109370 (= b_free!28859 (not b_next!28859))))

(declare-fun tp!101696 () Bool)

(declare-fun b_and!46949 () Bool)

(assert (=> start!109370 (= tp!101696 b_and!46949)))

(declare-fun b!1294602 () Bool)

(declare-fun e!738726 () Bool)

(declare-fun e!738728 () Bool)

(declare-fun mapRes!53309 () Bool)

(assert (=> b!1294602 (= e!738726 (and e!738728 mapRes!53309))))

(declare-fun condMapEmpty!53309 () Bool)

(declare-datatypes ((V!51101 0))(
  ( (V!51102 (val!17324 Int)) )
))
(declare-datatypes ((ValueCell!16351 0))(
  ( (ValueCellFull!16351 (v!19927 V!51101)) (EmptyCell!16351) )
))
(declare-datatypes ((array!86020 0))(
  ( (array!86021 (arr!41511 (Array (_ BitVec 32) ValueCell!16351)) (size!42061 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86020)

(declare-fun mapDefault!53309 () ValueCell!16351)

