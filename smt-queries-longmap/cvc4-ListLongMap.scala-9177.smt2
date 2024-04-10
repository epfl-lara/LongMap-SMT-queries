; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110376 () Bool)

(assert start!110376)

(declare-fun b!1306200 () Bool)

(declare-fun e!745142 () Bool)

(declare-datatypes ((array!86970 0))(
  ( (array!86971 (arr!41969 (Array (_ BitVec 32) (_ BitVec 64))) (size!42519 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86970)

(assert (=> b!1306200 (= e!745142 (bvsgt #b00000000000000000000000000000000 (size!42519 _keys!1628)))))

(declare-fun mapIsEmpty!54085 () Bool)

(declare-fun mapRes!54085 () Bool)

(assert (=> mapIsEmpty!54085 mapRes!54085))

(declare-fun b!1306201 () Bool)

(declare-fun e!745139 () Bool)

(declare-fun e!745141 () Bool)

(assert (=> b!1306201 (= e!745139 (and e!745141 mapRes!54085))))

(declare-fun condMapEmpty!54085 () Bool)

(declare-datatypes ((V!51741 0))(
  ( (V!51742 (val!17564 Int)) )
))
(declare-datatypes ((ValueCell!16591 0))(
  ( (ValueCellFull!16591 (v!20190 V!51741)) (EmptyCell!16591) )
))
(declare-datatypes ((array!86972 0))(
  ( (array!86973 (arr!41970 (Array (_ BitVec 32) ValueCell!16591)) (size!42520 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86972)

(declare-fun mapDefault!54085 () ValueCell!16591)

