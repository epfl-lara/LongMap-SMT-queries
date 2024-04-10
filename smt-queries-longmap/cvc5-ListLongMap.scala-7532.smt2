; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95496 () Bool)

(assert start!95496)

(declare-fun b!1078451 () Bool)

(declare-fun res!718617 () Bool)

(declare-fun e!616624 () Bool)

(assert (=> b!1078451 (=> (not res!718617) (not e!616624))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69289 0))(
  ( (array!69290 (arr!33319 (Array (_ BitVec 32) (_ BitVec 64))) (size!33855 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69289)

(declare-datatypes ((V!40017 0))(
  ( (V!40018 (val!13140 Int)) )
))
(declare-datatypes ((ValueCell!12374 0))(
  ( (ValueCellFull!12374 (v!15761 V!40017)) (EmptyCell!12374) )
))
(declare-datatypes ((array!69291 0))(
  ( (array!69292 (arr!33320 (Array (_ BitVec 32) ValueCell!12374)) (size!33856 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69291)

(assert (=> b!1078451 (= res!718617 (and (= (size!33856 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33855 _keys!1070) (size!33856 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078452 () Bool)

(declare-fun res!718620 () Bool)

(assert (=> b!1078452 (=> (not res!718620) (not e!616624))))

(declare-datatypes ((List!23239 0))(
  ( (Nil!23236) (Cons!23235 (h!24444 (_ BitVec 64)) (t!32598 List!23239)) )
))
(declare-fun arrayNoDuplicates!0 (array!69289 (_ BitVec 32) List!23239) Bool)

(assert (=> b!1078452 (= res!718620 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23236))))

(declare-fun b!1078453 () Bool)

(declare-fun e!616625 () Bool)

(assert (=> b!1078453 (= e!616625 false)))

(declare-fun lt!478638 () Bool)

(declare-fun lt!478639 () array!69289)

(assert (=> b!1078453 (= lt!478638 (arrayNoDuplicates!0 lt!478639 #b00000000000000000000000000000000 Nil!23236))))

(declare-fun b!1078454 () Bool)

(declare-fun res!718619 () Bool)

(assert (=> b!1078454 (=> (not res!718619) (not e!616624))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078454 (= res!718619 (= (select (arr!33319 _keys!1070) i!650) k!904))))

(declare-fun mapIsEmpty!41002 () Bool)

(declare-fun mapRes!41002 () Bool)

(assert (=> mapIsEmpty!41002 mapRes!41002))

(declare-fun res!718615 () Bool)

(assert (=> start!95496 (=> (not res!718615) (not e!616624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95496 (= res!718615 (validMask!0 mask!1414))))

(assert (=> start!95496 e!616624))

(assert (=> start!95496 true))

(declare-fun array_inv!25736 (array!69289) Bool)

(assert (=> start!95496 (array_inv!25736 _keys!1070)))

(declare-fun e!616626 () Bool)

(declare-fun array_inv!25737 (array!69291) Bool)

(assert (=> start!95496 (and (array_inv!25737 _values!874) e!616626)))

(declare-fun b!1078455 () Bool)

(declare-fun res!718621 () Bool)

(assert (=> b!1078455 (=> (not res!718621) (not e!616624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078455 (= res!718621 (validKeyInArray!0 k!904))))

(declare-fun b!1078456 () Bool)

(declare-fun res!718614 () Bool)

(assert (=> b!1078456 (=> (not res!718614) (not e!616624))))

(assert (=> b!1078456 (= res!718614 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33855 _keys!1070))))))

(declare-fun b!1078457 () Bool)

(declare-fun e!616627 () Bool)

(declare-fun tp_is_empty!26167 () Bool)

(assert (=> b!1078457 (= e!616627 tp_is_empty!26167)))

(declare-fun b!1078458 () Bool)

(declare-fun res!718618 () Bool)

(assert (=> b!1078458 (=> (not res!718618) (not e!616624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69289 (_ BitVec 32)) Bool)

(assert (=> b!1078458 (= res!718618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078459 () Bool)

(assert (=> b!1078459 (= e!616626 (and e!616627 mapRes!41002))))

(declare-fun condMapEmpty!41002 () Bool)

(declare-fun mapDefault!41002 () ValueCell!12374)

