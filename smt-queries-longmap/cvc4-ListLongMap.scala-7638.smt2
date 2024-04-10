; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96152 () Bool)

(assert start!96152)

(declare-fun b_free!22805 () Bool)

(declare-fun b_next!22805 () Bool)

(assert (=> start!96152 (= b_free!22805 (not b_next!22805))))

(declare-fun tp!80263 () Bool)

(declare-fun b_and!36285 () Bool)

(assert (=> start!96152 (= tp!80263 b_and!36285)))

(declare-fun b!1091459 () Bool)

(declare-fun e!623347 () Bool)

(declare-fun tp_is_empty!26807 () Bool)

(assert (=> b!1091459 (= e!623347 tp_is_empty!26807)))

(declare-fun b!1091460 () Bool)

(declare-fun res!728223 () Bool)

(declare-fun e!623352 () Bool)

(assert (=> b!1091460 (=> (not res!728223) (not e!623352))))

(declare-datatypes ((array!70533 0))(
  ( (array!70534 (arr!33940 (Array (_ BitVec 32) (_ BitVec 64))) (size!34476 (_ BitVec 32))) )
))
(declare-fun lt!487450 () array!70533)

(declare-datatypes ((List!23705 0))(
  ( (Nil!23702) (Cons!23701 (h!24910 (_ BitVec 64)) (t!33568 List!23705)) )
))
(declare-fun arrayNoDuplicates!0 (array!70533 (_ BitVec 32) List!23705) Bool)

(assert (=> b!1091460 (= res!728223 (arrayNoDuplicates!0 lt!487450 #b00000000000000000000000000000000 Nil!23702))))

(declare-fun b!1091461 () Bool)

(declare-fun res!728221 () Bool)

(declare-fun e!623348 () Bool)

(assert (=> b!1091461 (=> (not res!728221) (not e!623348))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091461 (= res!728221 (validKeyInArray!0 k!904))))

(declare-fun b!1091462 () Bool)

(declare-fun e!623354 () Bool)

(assert (=> b!1091462 (= e!623354 true)))

(declare-datatypes ((V!40869 0))(
  ( (V!40870 (val!13460 Int)) )
))
(declare-datatypes ((tuple2!17122 0))(
  ( (tuple2!17123 (_1!8572 (_ BitVec 64)) (_2!8572 V!40869)) )
))
(declare-datatypes ((List!23706 0))(
  ( (Nil!23703) (Cons!23702 (h!24911 tuple2!17122) (t!33569 List!23706)) )
))
(declare-datatypes ((ListLongMap!15091 0))(
  ( (ListLongMap!15092 (toList!7561 List!23706)) )
))
(declare-fun lt!487439 () ListLongMap!15091)

(declare-fun lt!487440 () ListLongMap!15091)

(declare-fun -!882 (ListLongMap!15091 (_ BitVec 64)) ListLongMap!15091)

(assert (=> b!1091462 (= (-!882 lt!487439 k!904) lt!487440)))

(declare-datatypes ((Unit!35930 0))(
  ( (Unit!35931) )
))
(declare-fun lt!487444 () Unit!35930)

(declare-fun minValue!831 () V!40869)

(declare-fun lt!487445 () ListLongMap!15091)

(declare-fun addRemoveCommutativeForDiffKeys!104 (ListLongMap!15091 (_ BitVec 64) V!40869 (_ BitVec 64)) Unit!35930)

(assert (=> b!1091462 (= lt!487444 (addRemoveCommutativeForDiffKeys!104 lt!487445 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1091463 () Bool)

(declare-fun res!728219 () Bool)

(assert (=> b!1091463 (=> (not res!728219) (not e!623348))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun _keys!1070 () array!70533)

(declare-datatypes ((ValueCell!12694 0))(
  ( (ValueCellFull!12694 (v!16081 V!40869)) (EmptyCell!12694) )
))
(declare-datatypes ((array!70535 0))(
  ( (array!70536 (arr!33941 (Array (_ BitVec 32) ValueCell!12694)) (size!34477 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70535)

(assert (=> b!1091463 (= res!728219 (and (= (size!34477 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34476 _keys!1070) (size!34477 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091464 () Bool)

(declare-fun e!623349 () Bool)

(declare-fun mapRes!41965 () Bool)

(assert (=> b!1091464 (= e!623349 (and e!623347 mapRes!41965))))

(declare-fun condMapEmpty!41965 () Bool)

(declare-fun mapDefault!41965 () ValueCell!12694)

