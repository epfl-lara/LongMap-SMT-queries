; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4574 () Bool)

(assert start!4574)

(declare-fun b_free!1273 () Bool)

(declare-fun b_next!1273 () Bool)

(assert (=> start!4574 (= b_free!1273 (not b_next!1273))))

(declare-fun tp!5266 () Bool)

(declare-fun b_and!2101 () Bool)

(assert (=> start!4574 (= tp!5266 b_and!2101)))

(declare-fun b!35736 () Bool)

(declare-fun e!22578 () Bool)

(declare-fun e!22584 () Bool)

(declare-fun mapRes!1996 () Bool)

(assert (=> b!35736 (= e!22578 (and e!22584 mapRes!1996))))

(declare-fun condMapEmpty!1996 () Bool)

(declare-datatypes ((V!1995 0))(
  ( (V!1996 (val!840 Int)) )
))
(declare-datatypes ((ValueCell!614 0))(
  ( (ValueCellFull!614 (v!1938 V!1995)) (EmptyCell!614) )
))
(declare-datatypes ((array!2471 0))(
  ( (array!2472 (arr!1180 (Array (_ BitVec 32) ValueCell!614)) (size!1281 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2471)

(declare-fun mapDefault!1996 () ValueCell!614)

