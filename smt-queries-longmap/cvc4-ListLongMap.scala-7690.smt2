; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96490 () Bool)

(assert start!96490)

(declare-fun b_free!23069 () Bool)

(declare-fun b_next!23069 () Bool)

(assert (=> start!96490 (= b_free!23069 (not b_next!23069))))

(declare-fun tp!81133 () Bool)

(declare-fun b_and!36801 () Bool)

(assert (=> start!96490 (= tp!81133 b_and!36801)))

(declare-fun b!1097404 () Bool)

(declare-fun e!626322 () Bool)

(declare-fun e!626326 () Bool)

(declare-fun mapRes!42439 () Bool)

(assert (=> b!1097404 (= e!626322 (and e!626326 mapRes!42439))))

(declare-fun condMapEmpty!42439 () Bool)

(declare-datatypes ((V!41285 0))(
  ( (V!41286 (val!13616 Int)) )
))
(declare-datatypes ((ValueCell!12850 0))(
  ( (ValueCellFull!12850 (v!16237 V!41285)) (EmptyCell!12850) )
))
(declare-datatypes ((array!71149 0))(
  ( (array!71150 (arr!34246 (Array (_ BitVec 32) ValueCell!12850)) (size!34782 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71149)

(declare-fun mapDefault!42439 () ValueCell!12850)

