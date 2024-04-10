; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95704 () Bool)

(assert start!95704)

(declare-fun b_free!22357 () Bool)

(declare-fun b_next!22357 () Bool)

(assert (=> start!95704 (= b_free!22357 (not b_next!22357))))

(declare-fun tp!78920 () Bool)

(declare-fun b_and!35389 () Bool)

(assert (=> start!95704 (= tp!78920 b_and!35389)))

(declare-fun b!1081995 () Bool)

(declare-fun res!721219 () Bool)

(declare-fun e!618395 () Bool)

(assert (=> b!1081995 (=> (not res!721219) (not e!618395))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69665 0))(
  ( (array!69666 (arr!33506 (Array (_ BitVec 32) (_ BitVec 64))) (size!34042 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69665)

(declare-datatypes ((V!40273 0))(
  ( (V!40274 (val!13236 Int)) )
))
(declare-datatypes ((ValueCell!12470 0))(
  ( (ValueCellFull!12470 (v!15857 V!40273)) (EmptyCell!12470) )
))
(declare-datatypes ((array!69667 0))(
  ( (array!69668 (arr!33507 (Array (_ BitVec 32) ValueCell!12470)) (size!34043 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69667)

(assert (=> b!1081995 (= res!721219 (and (= (size!34043 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34042 _keys!1070) (size!34043 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081996 () Bool)

(declare-fun res!721221 () Bool)

(declare-fun e!618394 () Bool)

(assert (=> b!1081996 (=> (not res!721221) (not e!618394))))

(declare-fun lt!479476 () array!69665)

(declare-datatypes ((List!23353 0))(
  ( (Nil!23350) (Cons!23349 (h!24558 (_ BitVec 64)) (t!32768 List!23353)) )
))
(declare-fun arrayNoDuplicates!0 (array!69665 (_ BitVec 32) List!23353) Bool)

(assert (=> b!1081996 (= res!721221 (arrayNoDuplicates!0 lt!479476 #b00000000000000000000000000000000 Nil!23350))))

(declare-fun b!1081997 () Bool)

(declare-fun res!721218 () Bool)

(assert (=> b!1081997 (=> (not res!721218) (not e!618395))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081997 (= res!721218 (= (select (arr!33506 _keys!1070) i!650) k!904))))

(declare-fun b!1081998 () Bool)

(declare-fun res!721223 () Bool)

(assert (=> b!1081998 (=> (not res!721223) (not e!618395))))

(assert (=> b!1081998 (= res!721223 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23350))))

(declare-fun b!1081999 () Bool)

(declare-fun res!721217 () Bool)

(assert (=> b!1081999 (=> (not res!721217) (not e!618395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69665 (_ BitVec 32)) Bool)

(assert (=> b!1081999 (= res!721217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41293 () Bool)

(declare-fun mapRes!41293 () Bool)

(assert (=> mapIsEmpty!41293 mapRes!41293))

(declare-fun res!721220 () Bool)

(assert (=> start!95704 (=> (not res!721220) (not e!618395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95704 (= res!721220 (validMask!0 mask!1414))))

(assert (=> start!95704 e!618395))

(assert (=> start!95704 tp!78920))

(assert (=> start!95704 true))

(declare-fun tp_is_empty!26359 () Bool)

(assert (=> start!95704 tp_is_empty!26359))

(declare-fun array_inv!25866 (array!69665) Bool)

(assert (=> start!95704 (array_inv!25866 _keys!1070)))

(declare-fun e!618393 () Bool)

(declare-fun array_inv!25867 (array!69667) Bool)

(assert (=> start!95704 (and (array_inv!25867 _values!874) e!618393)))

(declare-fun b!1082000 () Bool)

(declare-fun e!618391 () Bool)

(assert (=> b!1082000 (= e!618393 (and e!618391 mapRes!41293))))

(declare-fun condMapEmpty!41293 () Bool)

(declare-fun mapDefault!41293 () ValueCell!12470)

