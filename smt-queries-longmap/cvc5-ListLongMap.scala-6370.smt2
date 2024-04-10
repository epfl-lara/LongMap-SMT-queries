; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81956 () Bool)

(assert start!81956)

(declare-fun b!955987 () Bool)

(declare-fun e!538571 () Bool)

(declare-fun e!538570 () Bool)

(declare-fun mapRes!33454 () Bool)

(assert (=> b!955987 (= e!538571 (and e!538570 mapRes!33454))))

(declare-fun condMapEmpty!33454 () Bool)

(declare-datatypes ((V!32977 0))(
  ( (V!32978 (val!10548 Int)) )
))
(declare-datatypes ((ValueCell!10016 0))(
  ( (ValueCellFull!10016 (v!13103 V!32977)) (EmptyCell!10016) )
))
(declare-datatypes ((array!58091 0))(
  ( (array!58092 (arr!27925 (Array (_ BitVec 32) ValueCell!10016)) (size!28404 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58091)

(declare-fun mapDefault!33454 () ValueCell!10016)

