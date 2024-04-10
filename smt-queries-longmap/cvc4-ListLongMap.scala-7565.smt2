; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95714 () Bool)

(assert start!95714)

(declare-fun b_free!22367 () Bool)

(declare-fun b_next!22367 () Bool)

(assert (=> start!95714 (= b_free!22367 (not b_next!22367))))

(declare-fun tp!78950 () Bool)

(declare-fun b_and!35409 () Bool)

(assert (=> start!95714 (= tp!78950 b_and!35409)))

(declare-fun mapNonEmpty!41308 () Bool)

(declare-fun mapRes!41308 () Bool)

(declare-fun tp!78949 () Bool)

(declare-fun e!618483 () Bool)

(assert (=> mapNonEmpty!41308 (= mapRes!41308 (and tp!78949 e!618483))))

(declare-datatypes ((V!40285 0))(
  ( (V!40286 (val!13241 Int)) )
))
(declare-datatypes ((ValueCell!12475 0))(
  ( (ValueCellFull!12475 (v!15862 V!40285)) (EmptyCell!12475) )
))
(declare-datatypes ((array!69685 0))(
  ( (array!69686 (arr!33516 (Array (_ BitVec 32) ValueCell!12475)) (size!34052 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69685)

(declare-fun mapValue!41308 () ValueCell!12475)

(declare-fun mapRest!41308 () (Array (_ BitVec 32) ValueCell!12475))

(declare-fun mapKey!41308 () (_ BitVec 32))

(assert (=> mapNonEmpty!41308 (= (arr!33516 _values!874) (store mapRest!41308 mapKey!41308 mapValue!41308))))

(declare-fun b!1082185 () Bool)

(declare-fun res!721357 () Bool)

(declare-fun e!618482 () Bool)

(assert (=> b!1082185 (=> (not res!721357) (not e!618482))))

(declare-datatypes ((array!69687 0))(
  ( (array!69688 (arr!33517 (Array (_ BitVec 32) (_ BitVec 64))) (size!34053 (_ BitVec 32))) )
))
(declare-fun lt!479538 () array!69687)

(declare-datatypes ((List!23360 0))(
  ( (Nil!23357) (Cons!23356 (h!24565 (_ BitVec 64)) (t!32785 List!23360)) )
))
(declare-fun arrayNoDuplicates!0 (array!69687 (_ BitVec 32) List!23360) Bool)

(assert (=> b!1082185 (= res!721357 (arrayNoDuplicates!0 lt!479538 #b00000000000000000000000000000000 Nil!23357))))

(declare-fun mapIsEmpty!41308 () Bool)

(assert (=> mapIsEmpty!41308 mapRes!41308))

(declare-fun b!1082186 () Bool)

(declare-fun res!721356 () Bool)

(declare-fun e!618484 () Bool)

(assert (=> b!1082186 (=> (not res!721356) (not e!618484))))

(declare-fun _keys!1070 () array!69687)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082186 (= res!721356 (= (select (arr!33517 _keys!1070) i!650) k!904))))

(declare-fun b!1082187 () Bool)

(declare-fun res!721359 () Bool)

(assert (=> b!1082187 (=> (not res!721359) (not e!618484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082187 (= res!721359 (validKeyInArray!0 k!904))))

(declare-fun res!721354 () Bool)

(assert (=> start!95714 (=> (not res!721354) (not e!618484))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95714 (= res!721354 (validMask!0 mask!1414))))

(assert (=> start!95714 e!618484))

(assert (=> start!95714 tp!78950))

(assert (=> start!95714 true))

(declare-fun tp_is_empty!26369 () Bool)

(assert (=> start!95714 tp_is_empty!26369))

(declare-fun array_inv!25874 (array!69687) Bool)

(assert (=> start!95714 (array_inv!25874 _keys!1070)))

(declare-fun e!618480 () Bool)

(declare-fun array_inv!25875 (array!69685) Bool)

(assert (=> start!95714 (and (array_inv!25875 _values!874) e!618480)))

(declare-fun b!1082188 () Bool)

(assert (=> b!1082188 (= e!618483 tp_is_empty!26369)))

(declare-fun b!1082189 () Bool)

(declare-fun res!721351 () Bool)

(assert (=> b!1082189 (=> (not res!721351) (not e!618484))))

(assert (=> b!1082189 (= res!721351 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34053 _keys!1070))))))

(declare-fun b!1082190 () Bool)

(assert (=> b!1082190 (= e!618484 e!618482)))

(declare-fun res!721355 () Bool)

(assert (=> b!1082190 (=> (not res!721355) (not e!618482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69687 (_ BitVec 32)) Bool)

(assert (=> b!1082190 (= res!721355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479538 mask!1414))))

(assert (=> b!1082190 (= lt!479538 (array!69688 (store (arr!33517 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34053 _keys!1070)))))

(declare-fun b!1082191 () Bool)

(declare-fun res!721352 () Bool)

(assert (=> b!1082191 (=> (not res!721352) (not e!618484))))

(assert (=> b!1082191 (= res!721352 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23357))))

(declare-fun b!1082192 () Bool)

(declare-fun e!618485 () Bool)

(assert (=> b!1082192 (= e!618480 (and e!618485 mapRes!41308))))

(declare-fun condMapEmpty!41308 () Bool)

(declare-fun mapDefault!41308 () ValueCell!12475)

