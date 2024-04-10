; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77514 () Bool)

(assert start!77514)

(declare-fun b_free!16099 () Bool)

(declare-fun b_next!16099 () Bool)

(assert (=> start!77514 (= b_free!16099 (not b_next!16099))))

(declare-fun tp!56558 () Bool)

(declare-fun b_and!26465 () Bool)

(assert (=> start!77514 (= tp!56558 b_and!26465)))

(declare-fun b!903173 () Bool)

(declare-fun e!505994 () Bool)

(declare-fun e!505993 () Bool)

(declare-fun mapRes!29488 () Bool)

(assert (=> b!903173 (= e!505994 (and e!505993 mapRes!29488))))

(declare-fun condMapEmpty!29488 () Bool)

(declare-datatypes ((V!29655 0))(
  ( (V!29656 (val!9309 Int)) )
))
(declare-datatypes ((ValueCell!8777 0))(
  ( (ValueCellFull!8777 (v!11814 V!29655)) (EmptyCell!8777) )
))
(declare-datatypes ((array!53094 0))(
  ( (array!53095 (arr!25506 (Array (_ BitVec 32) ValueCell!8777)) (size!25965 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53094)

(declare-fun mapDefault!29488 () ValueCell!8777)

