; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3764 () Bool)

(assert start!3764)

(declare-fun b!26270 () Bool)

(declare-fun e!17082 () Bool)

(declare-fun e!17083 () Bool)

(declare-fun mapRes!1144 () Bool)

(assert (=> b!26270 (= e!17082 (and e!17083 mapRes!1144))))

(declare-fun condMapEmpty!1144 () Bool)

(declare-datatypes ((V!1271 0))(
  ( (V!1272 (val!569 Int)) )
))
(declare-datatypes ((ValueCell!343 0))(
  ( (ValueCellFull!343 (v!1655 V!1271)) (EmptyCell!343) )
))
(declare-datatypes ((array!1417 0))(
  ( (array!1418 (arr!666 (Array (_ BitVec 32) ValueCell!343)) (size!767 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1417)

(declare-fun mapDefault!1144 () ValueCell!343)

