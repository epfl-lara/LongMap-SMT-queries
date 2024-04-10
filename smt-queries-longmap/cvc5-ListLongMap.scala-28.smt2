; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!600 () Bool)

(assert start!600)

(declare-fun b_free!73 () Bool)

(declare-fun b_next!73 () Bool)

(assert (=> start!600 (= b_free!73 (not b_next!73))))

(declare-fun tp!436 () Bool)

(declare-fun b_and!211 () Bool)

(assert (=> start!600 (= tp!436 b_and!211)))

(declare-fun b!3700 () Bool)

(declare-fun e!1847 () Bool)

(declare-fun e!1846 () Bool)

(declare-fun mapRes!185 () Bool)

(assert (=> b!3700 (= e!1847 (and e!1846 mapRes!185))))

(declare-fun condMapEmpty!185 () Bool)

(declare-datatypes ((V!379 0))(
  ( (V!380 (val!81 Int)) )
))
(declare-datatypes ((ValueCell!59 0))(
  ( (ValueCellFull!59 (v!1168 V!379)) (EmptyCell!59) )
))
(declare-datatypes ((array!241 0))(
  ( (array!242 (arr!113 (Array (_ BitVec 32) ValueCell!59)) (size!175 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!241)

(declare-fun mapDefault!185 () ValueCell!59)

