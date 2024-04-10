; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109444 () Bool)

(assert start!109444)

(declare-fun b_free!28933 () Bool)

(declare-fun b_next!28933 () Bool)

(assert (=> start!109444 (= b_free!28933 (not b_next!28933))))

(declare-fun tp!101917 () Bool)

(declare-fun b_and!47023 () Bool)

(assert (=> start!109444 (= tp!101917 b_and!47023)))

(declare-fun b!1295915 () Bool)

(declare-fun e!739372 () Bool)

(declare-fun e!739371 () Bool)

(declare-fun mapRes!53420 () Bool)

(assert (=> b!1295915 (= e!739372 (and e!739371 mapRes!53420))))

(declare-fun condMapEmpty!53420 () Bool)

(declare-datatypes ((V!51201 0))(
  ( (V!51202 (val!17361 Int)) )
))
(declare-datatypes ((ValueCell!16388 0))(
  ( (ValueCellFull!16388 (v!19964 V!51201)) (EmptyCell!16388) )
))
(declare-datatypes ((array!86166 0))(
  ( (array!86167 (arr!41584 (Array (_ BitVec 32) ValueCell!16388)) (size!42134 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86166)

(declare-fun mapDefault!53420 () ValueCell!16388)

