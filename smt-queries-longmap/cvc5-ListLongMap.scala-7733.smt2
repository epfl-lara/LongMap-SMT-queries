; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97126 () Bool)

(assert start!97126)

(declare-fun mapIsEmpty!42874 () Bool)

(declare-fun mapRes!42874 () Bool)

(assert (=> mapIsEmpty!42874 mapRes!42874))

(declare-fun b!1104740 () Bool)

(declare-fun res!737070 () Bool)

(declare-fun e!630575 () Bool)

(assert (=> b!1104740 (=> (not res!737070) (not e!630575))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104740 (= res!737070 (validMask!0 mask!1564))))

(declare-fun b!1104741 () Bool)

(declare-fun e!630573 () Bool)

(declare-fun e!630572 () Bool)

(assert (=> b!1104741 (= e!630573 (and e!630572 mapRes!42874))))

(declare-fun condMapEmpty!42874 () Bool)

(declare-datatypes ((V!41625 0))(
  ( (V!41626 (val!13743 Int)) )
))
(declare-datatypes ((ValueCell!12977 0))(
  ( (ValueCellFull!12977 (v!16376 V!41625)) (EmptyCell!12977) )
))
(declare-datatypes ((array!71669 0))(
  ( (array!71670 (arr!34488 (Array (_ BitVec 32) ValueCell!12977)) (size!35024 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71669)

(declare-fun mapDefault!42874 () ValueCell!12977)

