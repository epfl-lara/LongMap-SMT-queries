; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96592 () Bool)

(assert start!96592)

(declare-fun b_free!23093 () Bool)

(declare-fun b_next!23093 () Bool)

(assert (=> start!96592 (= b_free!23093 (not b_next!23093))))

(declare-fun tp!81215 () Bool)

(declare-fun b_and!36891 () Bool)

(assert (=> start!96592 (= tp!81215 b_and!36891)))

(declare-fun b!1098533 () Bool)

(declare-fun res!733124 () Bool)

(declare-fun e!626989 () Bool)

(assert (=> b!1098533 (=> (not res!733124) (not e!626989))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71199 0))(
  ( (array!71200 (arr!34268 (Array (_ BitVec 32) (_ BitVec 64))) (size!34804 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71199)

(declare-datatypes ((V!41317 0))(
  ( (V!41318 (val!13628 Int)) )
))
(declare-datatypes ((ValueCell!12862 0))(
  ( (ValueCellFull!12862 (v!16252 V!41317)) (EmptyCell!12862) )
))
(declare-datatypes ((array!71201 0))(
  ( (array!71202 (arr!34269 (Array (_ BitVec 32) ValueCell!12862)) (size!34805 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71201)

(assert (=> b!1098533 (= res!733124 (and (= (size!34805 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34804 _keys!1070) (size!34805 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098534 () Bool)

(declare-fun e!626992 () Bool)

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1098534 (= e!626992 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904)))))

(declare-datatypes ((tuple2!17310 0))(
  ( (tuple2!17311 (_1!8666 (_ BitVec 64)) (_2!8666 V!41317)) )
))
(declare-datatypes ((List!23931 0))(
  ( (Nil!23928) (Cons!23927 (h!25136 tuple2!17310) (t!34070 List!23931)) )
))
(declare-datatypes ((ListLongMap!15279 0))(
  ( (ListLongMap!15280 (toList!7655 List!23931)) )
))
(declare-fun lt!491448 () ListLongMap!15279)

(declare-fun lt!491449 () ListLongMap!15279)

(declare-fun -!944 (ListLongMap!15279 (_ BitVec 64)) ListLongMap!15279)

(assert (=> b!1098534 (= (-!944 lt!491448 k!904) lt!491449)))

(declare-fun lt!491452 () ListLongMap!15279)

(declare-datatypes ((Unit!36126 0))(
  ( (Unit!36127) )
))
(declare-fun lt!491451 () Unit!36126)

(declare-fun zeroValue!831 () V!41317)

(declare-fun addRemoveCommutativeForDiffKeys!116 (ListLongMap!15279 (_ BitVec 64) V!41317 (_ BitVec 64)) Unit!36126)

(assert (=> b!1098534 (= lt!491451 (addRemoveCommutativeForDiffKeys!116 lt!491452 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!491458 () ListLongMap!15279)

(declare-fun lt!491453 () tuple2!17310)

(declare-fun +!3364 (ListLongMap!15279 tuple2!17310) ListLongMap!15279)

(assert (=> b!1098534 (= lt!491458 (+!3364 lt!491449 lt!491453))))

(declare-fun lt!491450 () ListLongMap!15279)

(declare-fun lt!491446 () tuple2!17310)

(assert (=> b!1098534 (= lt!491449 (+!3364 lt!491450 lt!491446))))

(declare-fun lt!491456 () ListLongMap!15279)

(assert (=> b!1098534 (= lt!491456 (+!3364 lt!491448 lt!491453))))

(assert (=> b!1098534 (= lt!491448 (+!3364 lt!491452 lt!491446))))

(declare-fun lt!491457 () ListLongMap!15279)

(assert (=> b!1098534 (= lt!491458 (+!3364 (+!3364 lt!491457 lt!491446) lt!491453))))

(declare-fun minValue!831 () V!41317)

(assert (=> b!1098534 (= lt!491453 (tuple2!17311 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098534 (= lt!491446 (tuple2!17311 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1098535 () Bool)

(declare-fun res!733130 () Bool)

(assert (=> b!1098535 (=> (not res!733130) (not e!626989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098535 (= res!733130 (validKeyInArray!0 k!904))))

(declare-fun b!1098536 () Bool)

(declare-fun e!626990 () Bool)

(declare-fun tp_is_empty!27143 () Bool)

(assert (=> b!1098536 (= e!626990 tp_is_empty!27143)))

(declare-fun b!1098537 () Bool)

(declare-fun e!626986 () Bool)

(assert (=> b!1098537 (= e!626989 e!626986)))

(declare-fun res!733123 () Bool)

(assert (=> b!1098537 (=> (not res!733123) (not e!626986))))

(declare-fun lt!491445 () array!71199)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71199 (_ BitVec 32)) Bool)

(assert (=> b!1098537 (= res!733123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491445 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1098537 (= lt!491445 (array!71200 (store (arr!34268 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34804 _keys!1070)))))

(declare-fun b!1098538 () Bool)

(declare-fun e!626991 () Bool)

(declare-fun e!626987 () Bool)

(declare-fun mapRes!42484 () Bool)

(assert (=> b!1098538 (= e!626991 (and e!626987 mapRes!42484))))

(declare-fun condMapEmpty!42484 () Bool)

(declare-fun mapDefault!42484 () ValueCell!12862)

