; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96298 () Bool)

(assert start!96298)

(declare-fun b!1094343 () Bool)

(declare-fun e!624773 () Bool)

(assert (=> b!1094343 (= e!624773 (not true))))

(declare-datatypes ((array!70821 0))(
  ( (array!70822 (arr!34084 (Array (_ BitVec 32) (_ BitVec 64))) (size!34620 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70821)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094343 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36022 0))(
  ( (Unit!36023) )
))
(declare-fun lt!489634 () Unit!36022)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70821 (_ BitVec 64) (_ BitVec 32)) Unit!36022)

(assert (=> b!1094343 (= lt!489634 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1094344 () Bool)

(declare-fun e!624771 () Bool)

(declare-fun tp_is_empty!26953 () Bool)

(assert (=> b!1094344 (= e!624771 tp_is_empty!26953)))

(declare-fun b!1094345 () Bool)

(declare-fun res!730305 () Bool)

(declare-fun e!624775 () Bool)

(assert (=> b!1094345 (=> (not res!730305) (not e!624775))))

(declare-datatypes ((List!23815 0))(
  ( (Nil!23812) (Cons!23811 (h!25020 (_ BitVec 64)) (t!33822 List!23815)) )
))
(declare-fun arrayNoDuplicates!0 (array!70821 (_ BitVec 32) List!23815) Bool)

(assert (=> b!1094345 (= res!730305 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23812))))

(declare-fun b!1094346 () Bool)

(declare-fun res!730300 () Bool)

(assert (=> b!1094346 (=> (not res!730300) (not e!624775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094346 (= res!730300 (validKeyInArray!0 k!904))))

(declare-fun b!1094347 () Bool)

(assert (=> b!1094347 (= e!624775 e!624773)))

(declare-fun res!730301 () Bool)

(assert (=> b!1094347 (=> (not res!730301) (not e!624773))))

(declare-fun lt!489633 () array!70821)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70821 (_ BitVec 32)) Bool)

(assert (=> b!1094347 (= res!730301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489633 mask!1414))))

(assert (=> b!1094347 (= lt!489633 (array!70822 (store (arr!34084 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34620 _keys!1070)))))

(declare-fun b!1094348 () Bool)

(declare-fun res!730299 () Bool)

(assert (=> b!1094348 (=> (not res!730299) (not e!624775))))

(assert (=> b!1094348 (= res!730299 (= (select (arr!34084 _keys!1070) i!650) k!904))))

(declare-fun b!1094349 () Bool)

(declare-fun res!730302 () Bool)

(assert (=> b!1094349 (=> (not res!730302) (not e!624775))))

(assert (=> b!1094349 (= res!730302 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34620 _keys!1070))))))

(declare-fun b!1094350 () Bool)

(declare-fun e!624776 () Bool)

(assert (=> b!1094350 (= e!624776 tp_is_empty!26953)))

(declare-fun mapIsEmpty!42184 () Bool)

(declare-fun mapRes!42184 () Bool)

(assert (=> mapIsEmpty!42184 mapRes!42184))

(declare-fun b!1094351 () Bool)

(declare-fun res!730297 () Bool)

(assert (=> b!1094351 (=> (not res!730297) (not e!624773))))

(assert (=> b!1094351 (= res!730297 (arrayNoDuplicates!0 lt!489633 #b00000000000000000000000000000000 Nil!23812))))

(declare-fun b!1094352 () Bool)

(declare-fun res!730303 () Bool)

(assert (=> b!1094352 (=> (not res!730303) (not e!624775))))

(assert (=> b!1094352 (= res!730303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094353 () Bool)

(declare-fun e!624772 () Bool)

(assert (=> b!1094353 (= e!624772 (and e!624771 mapRes!42184))))

(declare-fun condMapEmpty!42184 () Bool)

(declare-datatypes ((V!41065 0))(
  ( (V!41066 (val!13533 Int)) )
))
(declare-datatypes ((ValueCell!12767 0))(
  ( (ValueCellFull!12767 (v!16154 V!41065)) (EmptyCell!12767) )
))
(declare-datatypes ((array!70823 0))(
  ( (array!70824 (arr!34085 (Array (_ BitVec 32) ValueCell!12767)) (size!34621 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70823)

(declare-fun mapDefault!42184 () ValueCell!12767)

