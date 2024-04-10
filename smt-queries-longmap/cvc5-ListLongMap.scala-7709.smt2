; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96862 () Bool)

(assert start!96862)

(declare-fun b_free!23179 () Bool)

(declare-fun b_next!23179 () Bool)

(assert (=> start!96862 (= b_free!23179 (not b_next!23179))))

(declare-fun tp!81494 () Bool)

(declare-fun b_and!37161 () Bool)

(assert (=> start!96862 (= tp!81494 b_and!37161)))

(declare-fun b!1101808 () Bool)

(declare-fun res!735161 () Bool)

(declare-fun e!628903 () Bool)

(assert (=> b!1101808 (=> (not res!735161) (not e!628903))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101808 (= res!735161 (validKeyInArray!0 k!904))))

(declare-fun b!1101809 () Bool)

(declare-fun e!628901 () Bool)

(declare-fun e!628902 () Bool)

(declare-fun mapRes!42634 () Bool)

(assert (=> b!1101809 (= e!628901 (and e!628902 mapRes!42634))))

(declare-fun condMapEmpty!42634 () Bool)

(declare-datatypes ((V!41433 0))(
  ( (V!41434 (val!13671 Int)) )
))
(declare-datatypes ((ValueCell!12905 0))(
  ( (ValueCellFull!12905 (v!16302 V!41433)) (EmptyCell!12905) )
))
(declare-datatypes ((array!71381 0))(
  ( (array!71382 (arr!34352 (Array (_ BitVec 32) ValueCell!12905)) (size!34888 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71381)

(declare-fun mapDefault!42634 () ValueCell!12905)

