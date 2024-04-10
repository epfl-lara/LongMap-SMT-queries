; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95446 () Bool)

(assert start!95446)

(declare-fun mapNonEmpty!40966 () Bool)

(declare-fun mapRes!40966 () Bool)

(declare-fun tp!78428 () Bool)

(declare-fun e!616366 () Bool)

(assert (=> mapNonEmpty!40966 (= mapRes!40966 (and tp!78428 e!616366))))

(declare-datatypes ((V!39989 0))(
  ( (V!39990 (val!13130 Int)) )
))
(declare-datatypes ((ValueCell!12364 0))(
  ( (ValueCellFull!12364 (v!15750 V!39989)) (EmptyCell!12364) )
))
(declare-fun mapValue!40966 () ValueCell!12364)

(declare-datatypes ((array!69245 0))(
  ( (array!69246 (arr!33299 (Array (_ BitVec 32) ValueCell!12364)) (size!33835 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69245)

(declare-fun mapRest!40966 () (Array (_ BitVec 32) ValueCell!12364))

(declare-fun mapKey!40966 () (_ BitVec 32))

(assert (=> mapNonEmpty!40966 (= (arr!33299 _values!874) (store mapRest!40966 mapKey!40966 mapValue!40966))))

(declare-fun b!1077995 () Bool)

(declare-fun res!718293 () Bool)

(declare-fun e!616365 () Bool)

(assert (=> b!1077995 (=> (not res!718293) (not e!616365))))

(declare-datatypes ((array!69247 0))(
  ( (array!69248 (arr!33300 (Array (_ BitVec 32) (_ BitVec 64))) (size!33836 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69247)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1077995 (= res!718293 (= (select (arr!33300 _keys!1070) i!650) k!904))))

(declare-fun b!1077996 () Bool)

(declare-fun res!718298 () Bool)

(assert (=> b!1077996 (=> (not res!718298) (not e!616365))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077996 (= res!718298 (and (= (size!33835 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33836 _keys!1070) (size!33835 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077997 () Bool)

(declare-datatypes ((List!23229 0))(
  ( (Nil!23226) (Cons!23225 (h!24434 (_ BitVec 64)) (t!32588 List!23229)) )
))
(declare-fun noDuplicate!1578 (List!23229) Bool)

(assert (=> b!1077997 (= e!616365 (not (noDuplicate!1578 Nil!23226)))))

(declare-fun b!1077998 () Bool)

(declare-fun res!718299 () Bool)

(assert (=> b!1077998 (=> (not res!718299) (not e!616365))))

(declare-fun arrayNoDuplicates!0 (array!69247 (_ BitVec 32) List!23229) Bool)

(assert (=> b!1077998 (= res!718299 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23226))))

(declare-fun res!718297 () Bool)

(assert (=> start!95446 (=> (not res!718297) (not e!616365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95446 (= res!718297 (validMask!0 mask!1414))))

(assert (=> start!95446 e!616365))

(assert (=> start!95446 true))

(declare-fun array_inv!25724 (array!69247) Bool)

(assert (=> start!95446 (array_inv!25724 _keys!1070)))

(declare-fun e!616364 () Bool)

(declare-fun array_inv!25725 (array!69245) Bool)

(assert (=> start!95446 (and (array_inv!25725 _values!874) e!616364)))

(declare-fun b!1077999 () Bool)

(declare-fun res!718294 () Bool)

(assert (=> b!1077999 (=> (not res!718294) (not e!616365))))

(assert (=> b!1077999 (= res!718294 (and (bvsle #b00000000000000000000000000000000 (size!33836 _keys!1070)) (bvslt (size!33836 _keys!1070) #b01111111111111111111111111111111)))))

(declare-fun b!1078000 () Bool)

(declare-fun res!718295 () Bool)

(assert (=> b!1078000 (=> (not res!718295) (not e!616365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69247 (_ BitVec 32)) Bool)

(assert (=> b!1078000 (= res!718295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!69248 (store (arr!33300 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33836 _keys!1070)) mask!1414))))

(declare-fun b!1078001 () Bool)

(declare-fun tp_is_empty!26147 () Bool)

(assert (=> b!1078001 (= e!616366 tp_is_empty!26147)))

(declare-fun b!1078002 () Bool)

(declare-fun e!616363 () Bool)

(assert (=> b!1078002 (= e!616363 tp_is_empty!26147)))

(declare-fun mapIsEmpty!40966 () Bool)

(assert (=> mapIsEmpty!40966 mapRes!40966))

(declare-fun b!1078003 () Bool)

(assert (=> b!1078003 (= e!616364 (and e!616363 mapRes!40966))))

(declare-fun condMapEmpty!40966 () Bool)

(declare-fun mapDefault!40966 () ValueCell!12364)

