; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95672 () Bool)

(assert start!95672)

(declare-fun b_free!22325 () Bool)

(declare-fun b_next!22325 () Bool)

(assert (=> start!95672 (= b_free!22325 (not b_next!22325))))

(declare-fun tp!78824 () Bool)

(declare-fun b_and!35325 () Bool)

(assert (=> start!95672 (= tp!78824 b_and!35325)))

(declare-fun b!1081387 () Bool)

(declare-fun e!618102 () Bool)

(declare-fun tp_is_empty!26327 () Bool)

(assert (=> b!1081387 (= e!618102 tp_is_empty!26327)))

(declare-fun b!1081388 () Bool)

(declare-fun res!720787 () Bool)

(declare-fun e!618106 () Bool)

(assert (=> b!1081388 (=> (not res!720787) (not e!618106))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081388 (= res!720787 (validKeyInArray!0 k!904))))

(declare-fun res!720791 () Bool)

(assert (=> start!95672 (=> (not res!720791) (not e!618106))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95672 (= res!720791 (validMask!0 mask!1414))))

(assert (=> start!95672 e!618106))

(assert (=> start!95672 tp!78824))

(assert (=> start!95672 true))

(assert (=> start!95672 tp_is_empty!26327))

(declare-datatypes ((array!69601 0))(
  ( (array!69602 (arr!33474 (Array (_ BitVec 32) (_ BitVec 64))) (size!34010 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69601)

(declare-fun array_inv!25840 (array!69601) Bool)

(assert (=> start!95672 (array_inv!25840 _keys!1070)))

(declare-datatypes ((V!40229 0))(
  ( (V!40230 (val!13220 Int)) )
))
(declare-datatypes ((ValueCell!12454 0))(
  ( (ValueCellFull!12454 (v!15841 V!40229)) (EmptyCell!12454) )
))
(declare-datatypes ((array!69603 0))(
  ( (array!69604 (arr!33475 (Array (_ BitVec 32) ValueCell!12454)) (size!34011 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69603)

(declare-fun e!618104 () Bool)

(declare-fun array_inv!25841 (array!69603) Bool)

(assert (=> start!95672 (and (array_inv!25841 _values!874) e!618104)))

(declare-fun b!1081389 () Bool)

(declare-fun e!618107 () Bool)

(assert (=> b!1081389 (= e!618107 (not true))))

(declare-fun minValue!831 () V!40229)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!479284 () array!69601)

(declare-fun zeroValue!831 () V!40229)

(declare-datatypes ((tuple2!16750 0))(
  ( (tuple2!16751 (_1!8386 (_ BitVec 64)) (_2!8386 V!40229)) )
))
(declare-datatypes ((List!23329 0))(
  ( (Nil!23326) (Cons!23325 (h!24534 tuple2!16750) (t!32712 List!23329)) )
))
(declare-datatypes ((ListLongMap!14719 0))(
  ( (ListLongMap!14720 (toList!7375 List!23329)) )
))
(declare-fun lt!479286 () ListLongMap!14719)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3923 (array!69601 array!69603 (_ BitVec 32) (_ BitVec 32) V!40229 V!40229 (_ BitVec 32) Int) ListLongMap!14719)

(declare-fun dynLambda!2060 (Int (_ BitVec 64)) V!40229)

(assert (=> b!1081389 (= lt!479286 (getCurrentListMapNoExtraKeys!3923 lt!479284 (array!69604 (store (arr!33475 _values!874) i!650 (ValueCellFull!12454 (dynLambda!2060 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34011 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479285 () ListLongMap!14719)

(assert (=> b!1081389 (= lt!479285 (getCurrentListMapNoExtraKeys!3923 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081389 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35570 0))(
  ( (Unit!35571) )
))
(declare-fun lt!479287 () Unit!35570)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69601 (_ BitVec 64) (_ BitVec 32)) Unit!35570)

(assert (=> b!1081389 (= lt!479287 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1081390 () Bool)

(declare-fun res!720788 () Bool)

(assert (=> b!1081390 (=> (not res!720788) (not e!618106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69601 (_ BitVec 32)) Bool)

(assert (=> b!1081390 (= res!720788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1081391 () Bool)

(declare-fun res!720789 () Bool)

(assert (=> b!1081391 (=> (not res!720789) (not e!618106))))

(assert (=> b!1081391 (= res!720789 (and (= (size!34011 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34010 _keys!1070) (size!34011 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081392 () Bool)

(declare-fun res!720786 () Bool)

(assert (=> b!1081392 (=> (not res!720786) (not e!618106))))

(assert (=> b!1081392 (= res!720786 (= (select (arr!33474 _keys!1070) i!650) k!904))))

(declare-fun b!1081393 () Bool)

(declare-fun res!720784 () Bool)

(assert (=> b!1081393 (=> (not res!720784) (not e!618106))))

(assert (=> b!1081393 (= res!720784 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34010 _keys!1070))))))

(declare-fun mapIsEmpty!41245 () Bool)

(declare-fun mapRes!41245 () Bool)

(assert (=> mapIsEmpty!41245 mapRes!41245))

(declare-fun b!1081394 () Bool)

(declare-fun e!618105 () Bool)

(assert (=> b!1081394 (= e!618104 (and e!618105 mapRes!41245))))

(declare-fun condMapEmpty!41245 () Bool)

(declare-fun mapDefault!41245 () ValueCell!12454)

