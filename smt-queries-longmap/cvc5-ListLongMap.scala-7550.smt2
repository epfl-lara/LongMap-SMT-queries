; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95620 () Bool)

(assert start!95620)

(declare-fun b_free!22273 () Bool)

(declare-fun b_next!22273 () Bool)

(assert (=> start!95620 (= b_free!22273 (not b_next!22273))))

(declare-fun tp!78667 () Bool)

(declare-fun b_and!35251 () Bool)

(assert (=> start!95620 (= tp!78667 b_and!35251)))

(declare-fun b!1080429 () Bool)

(declare-fun res!720082 () Bool)

(declare-fun e!617638 () Bool)

(assert (=> b!1080429 (=> (not res!720082) (not e!617638))))

(declare-datatypes ((array!69501 0))(
  ( (array!69502 (arr!33424 (Array (_ BitVec 32) (_ BitVec 64))) (size!33960 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69501)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69501 (_ BitVec 32)) Bool)

(assert (=> b!1080429 (= res!720082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080430 () Bool)

(declare-fun res!720085 () Bool)

(assert (=> b!1080430 (=> (not res!720085) (not e!617638))))

(declare-datatypes ((List!23290 0))(
  ( (Nil!23287) (Cons!23286 (h!24495 (_ BitVec 64)) (t!32649 List!23290)) )
))
(declare-fun arrayNoDuplicates!0 (array!69501 (_ BitVec 32) List!23290) Bool)

(assert (=> b!1080430 (= res!720085 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23287))))

(declare-fun b!1080431 () Bool)

(declare-fun e!617639 () Bool)

(assert (=> b!1080431 (= e!617639 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40161 0))(
  ( (V!40162 (val!13194 Int)) )
))
(declare-fun minValue!831 () V!40161)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16710 0))(
  ( (tuple2!16711 (_1!8366 (_ BitVec 64)) (_2!8366 V!40161)) )
))
(declare-datatypes ((List!23291 0))(
  ( (Nil!23288) (Cons!23287 (h!24496 tuple2!16710) (t!32650 List!23291)) )
))
(declare-datatypes ((ListLongMap!14679 0))(
  ( (ListLongMap!14680 (toList!7355 List!23291)) )
))
(declare-fun lt!479015 () ListLongMap!14679)

(declare-fun zeroValue!831 () V!40161)

(declare-datatypes ((ValueCell!12428 0))(
  ( (ValueCellFull!12428 (v!15815 V!40161)) (EmptyCell!12428) )
))
(declare-datatypes ((array!69503 0))(
  ( (array!69504 (arr!33425 (Array (_ BitVec 32) ValueCell!12428)) (size!33961 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69503)

(declare-fun getCurrentListMapNoExtraKeys!3903 (array!69501 array!69503 (_ BitVec 32) (_ BitVec 32) V!40161 V!40161 (_ BitVec 32) Int) ListLongMap!14679)

(assert (=> b!1080431 (= lt!479015 (getCurrentListMapNoExtraKeys!3903 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080431 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35530 0))(
  ( (Unit!35531) )
))
(declare-fun lt!479016 () Unit!35530)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69501 (_ BitVec 64) (_ BitVec 32)) Unit!35530)

(assert (=> b!1080431 (= lt!479016 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1080432 () Bool)

(declare-fun e!617637 () Bool)

(declare-fun tp_is_empty!26275 () Bool)

(assert (=> b!1080432 (= e!617637 tp_is_empty!26275)))

(declare-fun mapIsEmpty!41167 () Bool)

(declare-fun mapRes!41167 () Bool)

(assert (=> mapIsEmpty!41167 mapRes!41167))

(declare-fun b!1080433 () Bool)

(declare-fun res!720090 () Bool)

(assert (=> b!1080433 (=> (not res!720090) (not e!617639))))

(declare-fun lt!479017 () array!69501)

(assert (=> b!1080433 (= res!720090 (arrayNoDuplicates!0 lt!479017 #b00000000000000000000000000000000 Nil!23287))))

(declare-fun res!720086 () Bool)

(assert (=> start!95620 (=> (not res!720086) (not e!617638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95620 (= res!720086 (validMask!0 mask!1414))))

(assert (=> start!95620 e!617638))

(assert (=> start!95620 tp!78667))

(assert (=> start!95620 true))

(assert (=> start!95620 tp_is_empty!26275))

(declare-fun array_inv!25808 (array!69501) Bool)

(assert (=> start!95620 (array_inv!25808 _keys!1070)))

(declare-fun e!617636 () Bool)

(declare-fun array_inv!25809 (array!69503) Bool)

(assert (=> start!95620 (and (array_inv!25809 _values!874) e!617636)))

(declare-fun b!1080434 () Bool)

(declare-fun e!617634 () Bool)

(assert (=> b!1080434 (= e!617634 tp_is_empty!26275)))

(declare-fun b!1080435 () Bool)

(declare-fun res!720084 () Bool)

(assert (=> b!1080435 (=> (not res!720084) (not e!617638))))

(assert (=> b!1080435 (= res!720084 (and (= (size!33961 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33960 _keys!1070) (size!33961 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080436 () Bool)

(declare-fun res!720083 () Bool)

(assert (=> b!1080436 (=> (not res!720083) (not e!617638))))

(assert (=> b!1080436 (= res!720083 (= (select (arr!33424 _keys!1070) i!650) k!904))))

(declare-fun b!1080437 () Bool)

(assert (=> b!1080437 (= e!617636 (and e!617637 mapRes!41167))))

(declare-fun condMapEmpty!41167 () Bool)

(declare-fun mapDefault!41167 () ValueCell!12428)

