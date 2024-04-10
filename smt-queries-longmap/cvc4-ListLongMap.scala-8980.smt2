; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108644 () Bool)

(assert start!108644)

(declare-fun b_free!28157 () Bool)

(declare-fun b_next!28157 () Bool)

(assert (=> start!108644 (= b_free!28157 (not b_next!28157))))

(declare-fun tp!99587 () Bool)

(declare-fun b_and!46223 () Bool)

(assert (=> start!108644 (= tp!99587 b_and!46223)))

(declare-fun mapIsEmpty!52253 () Bool)

(declare-fun mapRes!52253 () Bool)

(assert (=> mapIsEmpty!52253 mapRes!52253))

(declare-fun b!1282421 () Bool)

(declare-fun e!732738 () Bool)

(declare-fun tp_is_empty!33797 () Bool)

(assert (=> b!1282421 (= e!732738 tp_is_empty!33797)))

(declare-fun b!1282422 () Bool)

(declare-fun e!732740 () Bool)

(assert (=> b!1282422 (= e!732740 tp_is_empty!33797)))

(declare-fun b!1282423 () Bool)

(declare-fun res!851822 () Bool)

(declare-fun e!732739 () Bool)

(assert (=> b!1282423 (=> (not res!851822) (not e!732739))))

(declare-datatypes ((array!84664 0))(
  ( (array!84665 (arr!40834 (Array (_ BitVec 32) (_ BitVec 64))) (size!41384 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84664)

(declare-datatypes ((List!28931 0))(
  ( (Nil!28928) (Cons!28927 (h!30136 (_ BitVec 64)) (t!42475 List!28931)) )
))
(declare-fun arrayNoDuplicates!0 (array!84664 (_ BitVec 32) List!28931) Bool)

(assert (=> b!1282423 (= res!851822 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28928))))

(declare-fun b!1282424 () Bool)

(declare-fun res!851824 () Bool)

(assert (=> b!1282424 (=> (not res!851824) (not e!732739))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50165 0))(
  ( (V!50166 (val!16973 Int)) )
))
(declare-datatypes ((ValueCell!16000 0))(
  ( (ValueCellFull!16000 (v!19575 V!50165)) (EmptyCell!16000) )
))
(declare-datatypes ((array!84666 0))(
  ( (array!84667 (arr!40835 (Array (_ BitVec 32) ValueCell!16000)) (size!41385 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84666)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282424 (= res!851824 (and (= (size!41385 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41384 _keys!1741) (size!41385 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282425 () Bool)

(declare-fun e!732736 () Bool)

(assert (=> b!1282425 (= e!732736 (and e!732740 mapRes!52253))))

(declare-fun condMapEmpty!52253 () Bool)

(declare-fun mapDefault!52253 () ValueCell!16000)

