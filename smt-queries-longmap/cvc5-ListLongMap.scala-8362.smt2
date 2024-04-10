; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101754 () Bool)

(assert start!101754)

(declare-fun b_free!26443 () Bool)

(declare-fun b_next!26443 () Bool)

(assert (=> start!101754 (= b_free!26443 (not b_next!26443))))

(declare-fun tp!92375 () Bool)

(declare-fun b_and!44147 () Bool)

(assert (=> start!101754 (= tp!92375 b_and!44147)))

(declare-fun b!1225195 () Bool)

(declare-fun e!695872 () Bool)

(declare-fun e!695865 () Bool)

(declare-fun mapRes!48619 () Bool)

(assert (=> b!1225195 (= e!695872 (and e!695865 mapRes!48619))))

(declare-fun condMapEmpty!48619 () Bool)

(declare-datatypes ((V!46657 0))(
  ( (V!46658 (val!15630 Int)) )
))
(declare-datatypes ((ValueCell!14864 0))(
  ( (ValueCellFull!14864 (v!18292 V!46657)) (EmptyCell!14864) )
))
(declare-datatypes ((array!79077 0))(
  ( (array!79078 (arr!38165 (Array (_ BitVec 32) ValueCell!14864)) (size!38701 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79077)

(declare-fun mapDefault!48619 () ValueCell!14864)

