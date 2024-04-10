; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95582 () Bool)

(assert start!95582)

(declare-fun b!1079745 () Bool)

(declare-fun res!719576 () Bool)

(declare-fun e!617296 () Bool)

(assert (=> b!1079745 (=> (not res!719576) (not e!617296))))

(declare-datatypes ((array!69429 0))(
  ( (array!69430 (arr!33388 (Array (_ BitVec 32) (_ BitVec 64))) (size!33924 (_ BitVec 32))) )
))
(declare-fun lt!478864 () array!69429)

(declare-datatypes ((List!23268 0))(
  ( (Nil!23265) (Cons!23264 (h!24473 (_ BitVec 64)) (t!32627 List!23268)) )
))
(declare-fun arrayNoDuplicates!0 (array!69429 (_ BitVec 32) List!23268) Bool)

(assert (=> b!1079745 (= res!719576 (arrayNoDuplicates!0 lt!478864 #b00000000000000000000000000000000 Nil!23265))))

(declare-fun b!1079746 () Bool)

(assert (=> b!1079746 (= e!617296 (not true))))

(declare-fun _keys!1070 () array!69429)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079746 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35502 0))(
  ( (Unit!35503) )
))
(declare-fun lt!478863 () Unit!35502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69429 (_ BitVec 64) (_ BitVec 32)) Unit!35502)

(assert (=> b!1079746 (= lt!478863 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1079747 () Bool)

(declare-fun e!617294 () Bool)

(declare-fun tp_is_empty!26237 () Bool)

(assert (=> b!1079747 (= e!617294 tp_is_empty!26237)))

(declare-fun b!1079748 () Bool)

(declare-fun e!617297 () Bool)

(assert (=> b!1079748 (= e!617297 e!617296)))

(declare-fun res!719573 () Bool)

(assert (=> b!1079748 (=> (not res!719573) (not e!617296))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69429 (_ BitVec 32)) Bool)

(assert (=> b!1079748 (= res!719573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478864 mask!1414))))

(assert (=> b!1079748 (= lt!478864 (array!69430 (store (arr!33388 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33924 _keys!1070)))))

(declare-fun b!1079749 () Bool)

(declare-fun res!719572 () Bool)

(assert (=> b!1079749 (=> (not res!719572) (not e!617297))))

(assert (=> b!1079749 (= res!719572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079750 () Bool)

(declare-fun res!719574 () Bool)

(assert (=> b!1079750 (=> (not res!719574) (not e!617297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079750 (= res!719574 (validKeyInArray!0 k!904))))

(declare-fun b!1079751 () Bool)

(declare-fun e!617292 () Bool)

(declare-fun e!617295 () Bool)

(declare-fun mapRes!41110 () Bool)

(assert (=> b!1079751 (= e!617292 (and e!617295 mapRes!41110))))

(declare-fun condMapEmpty!41110 () Bool)

(declare-datatypes ((V!40109 0))(
  ( (V!40110 (val!13175 Int)) )
))
(declare-datatypes ((ValueCell!12409 0))(
  ( (ValueCellFull!12409 (v!15796 V!40109)) (EmptyCell!12409) )
))
(declare-datatypes ((array!69431 0))(
  ( (array!69432 (arr!33389 (Array (_ BitVec 32) ValueCell!12409)) (size!33925 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69431)

(declare-fun mapDefault!41110 () ValueCell!12409)

