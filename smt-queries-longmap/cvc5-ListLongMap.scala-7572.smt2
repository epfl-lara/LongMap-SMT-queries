; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95752 () Bool)

(assert start!95752)

(declare-fun b_free!22405 () Bool)

(declare-fun b_next!22405 () Bool)

(assert (=> start!95752 (= b_free!22405 (not b_next!22405))))

(declare-fun tp!79063 () Bool)

(declare-fun b_and!35485 () Bool)

(assert (=> start!95752 (= tp!79063 b_and!35485)))

(declare-fun b!1082907 () Bool)

(declare-fun res!721865 () Bool)

(declare-fun e!618823 () Bool)

(assert (=> b!1082907 (=> (not res!721865) (not e!618823))))

(declare-datatypes ((array!69759 0))(
  ( (array!69760 (arr!33553 (Array (_ BitVec 32) (_ BitVec 64))) (size!34089 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69759)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69759 (_ BitVec 32)) Bool)

(assert (=> b!1082907 (= res!721865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082908 () Bool)

(declare-fun res!721872 () Bool)

(assert (=> b!1082908 (=> (not res!721872) (not e!618823))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40337 0))(
  ( (V!40338 (val!13260 Int)) )
))
(declare-datatypes ((ValueCell!12494 0))(
  ( (ValueCellFull!12494 (v!15881 V!40337)) (EmptyCell!12494) )
))
(declare-datatypes ((array!69761 0))(
  ( (array!69762 (arr!33554 (Array (_ BitVec 32) ValueCell!12494)) (size!34090 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69761)

(assert (=> b!1082908 (= res!721872 (and (= (size!34090 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34089 _keys!1070) (size!34090 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082909 () Bool)

(declare-fun e!618827 () Bool)

(declare-fun tp_is_empty!26407 () Bool)

(assert (=> b!1082909 (= e!618827 tp_is_empty!26407)))

(declare-fun b!1082910 () Bool)

(declare-fun res!721868 () Bool)

(assert (=> b!1082910 (=> (not res!721868) (not e!618823))))

(declare-datatypes ((List!23387 0))(
  ( (Nil!23384) (Cons!23383 (h!24592 (_ BitVec 64)) (t!32850 List!23387)) )
))
(declare-fun arrayNoDuplicates!0 (array!69759 (_ BitVec 32) List!23387) Bool)

(assert (=> b!1082910 (= res!721868 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23384))))

(declare-fun b!1082911 () Bool)

(declare-fun res!721871 () Bool)

(assert (=> b!1082911 (=> (not res!721871) (not e!618823))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082911 (= res!721871 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34089 _keys!1070))))))

(declare-fun res!721866 () Bool)

(assert (=> start!95752 (=> (not res!721866) (not e!618823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95752 (= res!721866 (validMask!0 mask!1414))))

(assert (=> start!95752 e!618823))

(assert (=> start!95752 tp!79063))

(assert (=> start!95752 true))

(assert (=> start!95752 tp_is_empty!26407))

(declare-fun array_inv!25896 (array!69759) Bool)

(assert (=> start!95752 (array_inv!25896 _keys!1070)))

(declare-fun e!618822 () Bool)

(declare-fun array_inv!25897 (array!69761) Bool)

(assert (=> start!95752 (and (array_inv!25897 _values!874) e!618822)))

(declare-fun b!1082912 () Bool)

(declare-fun e!618826 () Bool)

(assert (=> b!1082912 (= e!618826 (not true))))

(declare-datatypes ((tuple2!16800 0))(
  ( (tuple2!16801 (_1!8411 (_ BitVec 64)) (_2!8411 V!40337)) )
))
(declare-datatypes ((List!23388 0))(
  ( (Nil!23385) (Cons!23384 (h!24593 tuple2!16800) (t!32851 List!23388)) )
))
(declare-datatypes ((ListLongMap!14769 0))(
  ( (ListLongMap!14770 (toList!7400 List!23388)) )
))
(declare-fun lt!479822 () ListLongMap!14769)

(declare-fun lt!479823 () ListLongMap!14769)

(assert (=> b!1082912 (and (= lt!479822 lt!479823) (= lt!479823 lt!479822))))

(declare-fun lt!479826 () ListLongMap!14769)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!727 (ListLongMap!14769 (_ BitVec 64)) ListLongMap!14769)

(assert (=> b!1082912 (= lt!479823 (-!727 lt!479826 k!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40337)

(declare-datatypes ((Unit!35620 0))(
  ( (Unit!35621) )
))
(declare-fun lt!479827 () Unit!35620)

(declare-fun zeroValue!831 () V!40337)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!7 (array!69759 array!69761 (_ BitVec 32) (_ BitVec 32) V!40337 V!40337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35620)

(assert (=> b!1082912 (= lt!479827 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!7 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479825 () array!69759)

(declare-fun getCurrentListMapNoExtraKeys!3948 (array!69759 array!69761 (_ BitVec 32) (_ BitVec 32) V!40337 V!40337 (_ BitVec 32) Int) ListLongMap!14769)

(declare-fun dynLambda!2085 (Int (_ BitVec 64)) V!40337)

(assert (=> b!1082912 (= lt!479822 (getCurrentListMapNoExtraKeys!3948 lt!479825 (array!69762 (store (arr!33554 _values!874) i!650 (ValueCellFull!12494 (dynLambda!2085 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34090 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082912 (= lt!479826 (getCurrentListMapNoExtraKeys!3948 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082912 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!479824 () Unit!35620)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69759 (_ BitVec 64) (_ BitVec 32)) Unit!35620)

(assert (=> b!1082912 (= lt!479824 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1082913 () Bool)

(assert (=> b!1082913 (= e!618823 e!618826)))

(declare-fun res!721869 () Bool)

(assert (=> b!1082913 (=> (not res!721869) (not e!618826))))

(assert (=> b!1082913 (= res!721869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479825 mask!1414))))

(assert (=> b!1082913 (= lt!479825 (array!69760 (store (arr!33553 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34089 _keys!1070)))))

(declare-fun mapIsEmpty!41365 () Bool)

(declare-fun mapRes!41365 () Bool)

(assert (=> mapIsEmpty!41365 mapRes!41365))

(declare-fun b!1082914 () Bool)

(declare-fun e!618824 () Bool)

(assert (=> b!1082914 (= e!618822 (and e!618824 mapRes!41365))))

(declare-fun condMapEmpty!41365 () Bool)

(declare-fun mapDefault!41365 () ValueCell!12494)

