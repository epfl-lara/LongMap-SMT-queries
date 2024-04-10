; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110462 () Bool)

(assert start!110462)

(declare-fun b!1306768 () Bool)

(declare-fun e!745588 () Bool)

(declare-fun tp_is_empty!35027 () Bool)

(assert (=> b!1306768 (= e!745588 tp_is_empty!35027)))

(declare-fun b!1306769 () Bool)

(declare-fun e!745591 () Bool)

(declare-fun e!745592 () Bool)

(declare-fun mapRes!54169 () Bool)

(assert (=> b!1306769 (= e!745591 (and e!745592 mapRes!54169))))

(declare-fun condMapEmpty!54169 () Bool)

(declare-datatypes ((V!51805 0))(
  ( (V!51806 (val!17588 Int)) )
))
(declare-datatypes ((ValueCell!16615 0))(
  ( (ValueCellFull!16615 (v!20215 V!51805)) (EmptyCell!16615) )
))
(declare-datatypes ((array!87066 0))(
  ( (array!87067 (arr!42013 (Array (_ BitVec 32) ValueCell!16615)) (size!42563 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87066)

(declare-fun mapDefault!54169 () ValueCell!16615)

