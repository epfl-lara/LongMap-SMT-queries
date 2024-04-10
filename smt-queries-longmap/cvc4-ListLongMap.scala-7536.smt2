; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95524 () Bool)

(assert start!95524)

(declare-fun b!1078939 () Bool)

(declare-fun res!718980 () Bool)

(declare-fun e!616879 () Bool)

(assert (=> b!1078939 (=> (not res!718980) (not e!616879))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69345 0))(
  ( (array!69346 (arr!33347 (Array (_ BitVec 32) (_ BitVec 64))) (size!33883 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69345)

(declare-datatypes ((V!40053 0))(
  ( (V!40054 (val!13154 Int)) )
))
(declare-datatypes ((ValueCell!12388 0))(
  ( (ValueCellFull!12388 (v!15775 V!40053)) (EmptyCell!12388) )
))
(declare-datatypes ((array!69347 0))(
  ( (array!69348 (arr!33348 (Array (_ BitVec 32) ValueCell!12388)) (size!33884 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69347)

(assert (=> b!1078939 (= res!718980 (and (= (size!33884 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33883 _keys!1070) (size!33884 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078940 () Bool)

(declare-fun e!616875 () Bool)

(assert (=> b!1078940 (= e!616875 (not (or (bvsge #b00000000000000000000000000000000 (size!33883 _keys!1070)) (bvslt (size!33883 _keys!1070) #b01111111111111111111111111111111))))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078940 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35478 0))(
  ( (Unit!35479) )
))
(declare-fun lt!478722 () Unit!35478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69345 (_ BitVec 64) (_ BitVec 32)) Unit!35478)

(assert (=> b!1078940 (= lt!478722 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapNonEmpty!41044 () Bool)

(declare-fun mapRes!41044 () Bool)

(declare-fun tp!78506 () Bool)

(declare-fun e!616874 () Bool)

(assert (=> mapNonEmpty!41044 (= mapRes!41044 (and tp!78506 e!616874))))

(declare-fun mapKey!41044 () (_ BitVec 32))

(declare-fun mapValue!41044 () ValueCell!12388)

(declare-fun mapRest!41044 () (Array (_ BitVec 32) ValueCell!12388))

(assert (=> mapNonEmpty!41044 (= (arr!33348 _values!874) (store mapRest!41044 mapKey!41044 mapValue!41044))))

(declare-fun b!1078942 () Bool)

(declare-fun tp_is_empty!26195 () Bool)

(assert (=> b!1078942 (= e!616874 tp_is_empty!26195)))

(declare-fun b!1078943 () Bool)

(declare-fun e!616876 () Bool)

(declare-fun e!616877 () Bool)

(assert (=> b!1078943 (= e!616876 (and e!616877 mapRes!41044))))

(declare-fun condMapEmpty!41044 () Bool)

(declare-fun mapDefault!41044 () ValueCell!12388)

