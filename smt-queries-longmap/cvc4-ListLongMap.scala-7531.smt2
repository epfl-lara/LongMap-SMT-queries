; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95494 () Bool)

(assert start!95494)

(declare-fun b!1078418 () Bool)

(declare-fun res!718594 () Bool)

(declare-fun e!616609 () Bool)

(assert (=> b!1078418 (=> (not res!718594) (not e!616609))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69285 0))(
  ( (array!69286 (arr!33317 (Array (_ BitVec 32) (_ BitVec 64))) (size!33853 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69285)

(declare-datatypes ((V!40013 0))(
  ( (V!40014 (val!13139 Int)) )
))
(declare-datatypes ((ValueCell!12373 0))(
  ( (ValueCellFull!12373 (v!15760 V!40013)) (EmptyCell!12373) )
))
(declare-datatypes ((array!69287 0))(
  ( (array!69288 (arr!33318 (Array (_ BitVec 32) ValueCell!12373)) (size!33854 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69287)

(assert (=> b!1078418 (= res!718594 (and (= (size!33854 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33853 _keys!1070) (size!33854 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078419 () Bool)

(declare-fun res!718596 () Bool)

(assert (=> b!1078419 (=> (not res!718596) (not e!616609))))

(declare-datatypes ((List!23238 0))(
  ( (Nil!23235) (Cons!23234 (h!24443 (_ BitVec 64)) (t!32597 List!23238)) )
))
(declare-fun arrayNoDuplicates!0 (array!69285 (_ BitVec 32) List!23238) Bool)

(assert (=> b!1078419 (= res!718596 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23235))))

(declare-fun b!1078420 () Bool)

(declare-fun e!616606 () Bool)

(declare-fun tp_is_empty!26165 () Bool)

(assert (=> b!1078420 (= e!616606 tp_is_empty!26165)))

(declare-fun res!718595 () Bool)

(assert (=> start!95494 (=> (not res!718595) (not e!616609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95494 (= res!718595 (validMask!0 mask!1414))))

(assert (=> start!95494 e!616609))

(assert (=> start!95494 true))

(declare-fun array_inv!25734 (array!69285) Bool)

(assert (=> start!95494 (array_inv!25734 _keys!1070)))

(declare-fun e!616608 () Bool)

(declare-fun array_inv!25735 (array!69287) Bool)

(assert (=> start!95494 (and (array_inv!25735 _values!874) e!616608)))

(declare-fun b!1078421 () Bool)

(declare-fun e!616604 () Bool)

(assert (=> b!1078421 (= e!616604 tp_is_empty!26165)))

(declare-fun b!1078422 () Bool)

(declare-fun res!718597 () Bool)

(assert (=> b!1078422 (=> (not res!718597) (not e!616609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69285 (_ BitVec 32)) Bool)

(assert (=> b!1078422 (= res!718597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!40999 () Bool)

(declare-fun mapRes!40999 () Bool)

(assert (=> mapIsEmpty!40999 mapRes!40999))

(declare-fun b!1078423 () Bool)

(declare-fun res!718590 () Bool)

(assert (=> b!1078423 (=> (not res!718590) (not e!616609))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078423 (= res!718590 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33853 _keys!1070))))))

(declare-fun b!1078424 () Bool)

(declare-fun e!616605 () Bool)

(assert (=> b!1078424 (= e!616605 false)))

(declare-fun lt!478632 () Bool)

(declare-fun lt!478633 () array!69285)

(assert (=> b!1078424 (= lt!478632 (arrayNoDuplicates!0 lt!478633 #b00000000000000000000000000000000 Nil!23235))))

(declare-fun b!1078425 () Bool)

(declare-fun res!718591 () Bool)

(assert (=> b!1078425 (=> (not res!718591) (not e!616609))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1078425 (= res!718591 (= (select (arr!33317 _keys!1070) i!650) k!904))))

(declare-fun mapNonEmpty!40999 () Bool)

(declare-fun tp!78461 () Bool)

(assert (=> mapNonEmpty!40999 (= mapRes!40999 (and tp!78461 e!616604))))

(declare-fun mapRest!40999 () (Array (_ BitVec 32) ValueCell!12373))

(declare-fun mapKey!40999 () (_ BitVec 32))

(declare-fun mapValue!40999 () ValueCell!12373)

(assert (=> mapNonEmpty!40999 (= (arr!33318 _values!874) (store mapRest!40999 mapKey!40999 mapValue!40999))))

(declare-fun b!1078426 () Bool)

(declare-fun res!718592 () Bool)

(assert (=> b!1078426 (=> (not res!718592) (not e!616609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078426 (= res!718592 (validKeyInArray!0 k!904))))

(declare-fun b!1078427 () Bool)

(assert (=> b!1078427 (= e!616609 e!616605)))

(declare-fun res!718593 () Bool)

(assert (=> b!1078427 (=> (not res!718593) (not e!616605))))

(assert (=> b!1078427 (= res!718593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478633 mask!1414))))

(assert (=> b!1078427 (= lt!478633 (array!69286 (store (arr!33317 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33853 _keys!1070)))))

(declare-fun b!1078428 () Bool)

(assert (=> b!1078428 (= e!616608 (and e!616606 mapRes!40999))))

(declare-fun condMapEmpty!40999 () Bool)

(declare-fun mapDefault!40999 () ValueCell!12373)

