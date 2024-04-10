; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96022 () Bool)

(assert start!96022)

(declare-fun b_free!22675 () Bool)

(declare-fun b_next!22675 () Bool)

(assert (=> start!96022 (= b_free!22675 (not b_next!22675))))

(declare-fun tp!79874 () Bool)

(declare-fun b_and!36025 () Bool)

(assert (=> start!96022 (= tp!79874 b_and!36025)))

(declare-fun b!1088590 () Bool)

(declare-fun e!621789 () Bool)

(declare-fun e!621791 () Bool)

(assert (=> b!1088590 (= e!621789 e!621791)))

(declare-fun res!726069 () Bool)

(assert (=> b!1088590 (=> (not res!726069) (not e!621791))))

(declare-datatypes ((array!70279 0))(
  ( (array!70280 (arr!33813 (Array (_ BitVec 32) (_ BitVec 64))) (size!34349 (_ BitVec 32))) )
))
(declare-fun lt!484930 () array!70279)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70279 (_ BitVec 32)) Bool)

(assert (=> b!1088590 (= res!726069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484930 mask!1414))))

(declare-fun _keys!1070 () array!70279)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088590 (= lt!484930 (array!70280 (store (arr!33813 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34349 _keys!1070)))))

(declare-fun b!1088591 () Bool)

(declare-fun res!726065 () Bool)

(assert (=> b!1088591 (=> (not res!726065) (not e!621789))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1088591 (= res!726065 (= (select (arr!33813 _keys!1070) i!650) k!904))))

(declare-fun b!1088592 () Bool)

(declare-fun res!726063 () Bool)

(assert (=> b!1088592 (=> (not res!726063) (not e!621789))))

(declare-datatypes ((List!23595 0))(
  ( (Nil!23592) (Cons!23591 (h!24800 (_ BitVec 64)) (t!33328 List!23595)) )
))
(declare-fun arrayNoDuplicates!0 (array!70279 (_ BitVec 32) List!23595) Bool)

(assert (=> b!1088592 (= res!726063 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23592))))

(declare-fun b!1088593 () Bool)

(declare-fun res!726062 () Bool)

(assert (=> b!1088593 (=> (not res!726062) (not e!621791))))

(assert (=> b!1088593 (= res!726062 (arrayNoDuplicates!0 lt!484930 #b00000000000000000000000000000000 Nil!23592))))

(declare-fun b!1088594 () Bool)

(declare-fun res!726070 () Bool)

(assert (=> b!1088594 (=> (not res!726070) (not e!621789))))

(assert (=> b!1088594 (= res!726070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41770 () Bool)

(declare-fun mapRes!41770 () Bool)

(assert (=> mapIsEmpty!41770 mapRes!41770))

(declare-fun b!1088595 () Bool)

(declare-fun res!726072 () Bool)

(assert (=> b!1088595 (=> (not res!726072) (not e!621789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088595 (= res!726072 (validKeyInArray!0 k!904))))

(declare-fun b!1088596 () Bool)

(declare-fun e!621792 () Bool)

(declare-fun e!621794 () Bool)

(assert (=> b!1088596 (= e!621792 (and e!621794 mapRes!41770))))

(declare-fun condMapEmpty!41770 () Bool)

(declare-datatypes ((V!40697 0))(
  ( (V!40698 (val!13395 Int)) )
))
(declare-datatypes ((ValueCell!12629 0))(
  ( (ValueCellFull!12629 (v!16016 V!40697)) (EmptyCell!12629) )
))
(declare-datatypes ((array!70281 0))(
  ( (array!70282 (arr!33814 (Array (_ BitVec 32) ValueCell!12629)) (size!34350 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70281)

(declare-fun mapDefault!41770 () ValueCell!12629)

