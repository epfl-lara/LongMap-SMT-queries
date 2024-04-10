; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4470 () Bool)

(assert start!4470)

(declare-fun b_free!1231 () Bool)

(declare-fun b_next!1231 () Bool)

(assert (=> start!4470 (= b_free!1231 (not b_next!1231))))

(declare-fun tp!5131 () Bool)

(declare-fun b_and!2053 () Bool)

(assert (=> start!4470 (= tp!5131 b_and!2053)))

(declare-fun b!34681 () Bool)

(declare-fun res!21059 () Bool)

(declare-fun e!21969 () Bool)

(assert (=> b!34681 (=> (not res!21059) (not e!21969))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34681 (= res!21059 (validKeyInArray!0 k!1304))))

(declare-fun b!34682 () Bool)

(declare-fun e!21970 () Bool)

(declare-fun e!21966 () Bool)

(declare-fun mapRes!1924 () Bool)

(assert (=> b!34682 (= e!21970 (and e!21966 mapRes!1924))))

(declare-fun condMapEmpty!1924 () Bool)

(declare-datatypes ((V!1939 0))(
  ( (V!1940 (val!819 Int)) )
))
(declare-datatypes ((ValueCell!593 0))(
  ( (ValueCellFull!593 (v!1914 V!1939)) (EmptyCell!593) )
))
(declare-datatypes ((array!2387 0))(
  ( (array!2388 (arr!1141 (Array (_ BitVec 32) ValueCell!593)) (size!1242 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2387)

(declare-fun mapDefault!1924 () ValueCell!593)

