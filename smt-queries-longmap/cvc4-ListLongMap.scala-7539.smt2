; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95558 () Bool)

(assert start!95558)

(declare-fun b!1079313 () Bool)

(declare-fun res!719247 () Bool)

(declare-fun e!617078 () Bool)

(assert (=> b!1079313 (=> (not res!719247) (not e!617078))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69381 0))(
  ( (array!69382 (arr!33364 (Array (_ BitVec 32) (_ BitVec 64))) (size!33900 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69381)

(declare-datatypes ((V!40077 0))(
  ( (V!40078 (val!13163 Int)) )
))
(declare-datatypes ((ValueCell!12397 0))(
  ( (ValueCellFull!12397 (v!15784 V!40077)) (EmptyCell!12397) )
))
(declare-datatypes ((array!69383 0))(
  ( (array!69384 (arr!33365 (Array (_ BitVec 32) ValueCell!12397)) (size!33901 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69383)

(assert (=> b!1079313 (= res!719247 (and (= (size!33901 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33900 _keys!1070) (size!33901 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079314 () Bool)

(declare-fun res!719245 () Bool)

(assert (=> b!1079314 (=> (not res!719245) (not e!617078))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079314 (= res!719245 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!41074 () Bool)

(declare-fun mapRes!41074 () Bool)

(declare-fun tp!78536 () Bool)

(declare-fun e!617079 () Bool)

(assert (=> mapNonEmpty!41074 (= mapRes!41074 (and tp!78536 e!617079))))

(declare-fun mapRest!41074 () (Array (_ BitVec 32) ValueCell!12397))

(declare-fun mapKey!41074 () (_ BitVec 32))

(declare-fun mapValue!41074 () ValueCell!12397)

(assert (=> mapNonEmpty!41074 (= (arr!33365 _values!874) (store mapRest!41074 mapKey!41074 mapValue!41074))))

(declare-fun b!1079315 () Bool)

(declare-fun res!719251 () Bool)

(declare-fun e!617077 () Bool)

(assert (=> b!1079315 (=> (not res!719251) (not e!617077))))

(declare-fun lt!478792 () array!69381)

(declare-datatypes ((List!23256 0))(
  ( (Nil!23253) (Cons!23252 (h!24461 (_ BitVec 64)) (t!32615 List!23256)) )
))
(declare-fun arrayNoDuplicates!0 (array!69381 (_ BitVec 32) List!23256) Bool)

(assert (=> b!1079315 (= res!719251 (arrayNoDuplicates!0 lt!478792 #b00000000000000000000000000000000 Nil!23253))))

(declare-fun b!1079316 () Bool)

(assert (=> b!1079316 (= e!617078 e!617077)))

(declare-fun res!719246 () Bool)

(assert (=> b!1079316 (=> (not res!719246) (not e!617077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69381 (_ BitVec 32)) Bool)

(assert (=> b!1079316 (= res!719246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478792 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079316 (= lt!478792 (array!69382 (store (arr!33364 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33900 _keys!1070)))))

(declare-fun b!1079317 () Bool)

(declare-fun res!719248 () Bool)

(assert (=> b!1079317 (=> (not res!719248) (not e!617078))))

(assert (=> b!1079317 (= res!719248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079318 () Bool)

(declare-fun e!617076 () Bool)

(declare-fun e!617081 () Bool)

(assert (=> b!1079318 (= e!617076 (and e!617081 mapRes!41074))))

(declare-fun condMapEmpty!41074 () Bool)

(declare-fun mapDefault!41074 () ValueCell!12397)

