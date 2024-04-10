; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95992 () Bool)

(assert start!95992)

(declare-fun b_free!22645 () Bool)

(declare-fun b_next!22645 () Bool)

(assert (=> start!95992 (= b_free!22645 (not b_next!22645))))

(declare-fun tp!79784 () Bool)

(declare-fun b_and!35965 () Bool)

(assert (=> start!95992 (= tp!79784 b_and!35965)))

(declare-fun b!1087930 () Bool)

(declare-fun e!621434 () Bool)

(declare-fun tp_is_empty!26647 () Bool)

(assert (=> b!1087930 (= e!621434 tp_is_empty!26647)))

(declare-fun b!1087931 () Bool)

(declare-fun res!725573 () Bool)

(declare-fun e!621429 () Bool)

(assert (=> b!1087931 (=> (not res!725573) (not e!621429))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087931 (= res!725573 (validKeyInArray!0 k!904))))

(declare-fun res!725572 () Bool)

(assert (=> start!95992 (=> (not res!725572) (not e!621429))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95992 (= res!725572 (validMask!0 mask!1414))))

(assert (=> start!95992 e!621429))

(assert (=> start!95992 tp!79784))

(assert (=> start!95992 true))

(assert (=> start!95992 tp_is_empty!26647))

(declare-datatypes ((array!70219 0))(
  ( (array!70220 (arr!33783 (Array (_ BitVec 32) (_ BitVec 64))) (size!34319 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70219)

(declare-fun array_inv!26054 (array!70219) Bool)

(assert (=> start!95992 (array_inv!26054 _keys!1070)))

(declare-datatypes ((V!40657 0))(
  ( (V!40658 (val!13380 Int)) )
))
(declare-datatypes ((ValueCell!12614 0))(
  ( (ValueCellFull!12614 (v!16001 V!40657)) (EmptyCell!12614) )
))
(declare-datatypes ((array!70221 0))(
  ( (array!70222 (arr!33784 (Array (_ BitVec 32) ValueCell!12614)) (size!34320 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70221)

(declare-fun e!621430 () Bool)

(declare-fun array_inv!26055 (array!70221) Bool)

(assert (=> start!95992 (and (array_inv!26055 _values!874) e!621430)))

(declare-fun mapNonEmpty!41725 () Bool)

(declare-fun mapRes!41725 () Bool)

(declare-fun tp!79783 () Bool)

(assert (=> mapNonEmpty!41725 (= mapRes!41725 (and tp!79783 e!621434))))

(declare-fun mapValue!41725 () ValueCell!12614)

(declare-fun mapRest!41725 () (Array (_ BitVec 32) ValueCell!12614))

(declare-fun mapKey!41725 () (_ BitVec 32))

(assert (=> mapNonEmpty!41725 (= (arr!33784 _values!874) (store mapRest!41725 mapKey!41725 mapValue!41725))))

(declare-fun b!1087932 () Bool)

(declare-fun res!725576 () Bool)

(declare-fun e!621428 () Bool)

(assert (=> b!1087932 (=> (not res!725576) (not e!621428))))

(declare-fun lt!484347 () array!70219)

(declare-datatypes ((List!23568 0))(
  ( (Nil!23565) (Cons!23564 (h!24773 (_ BitVec 64)) (t!33271 List!23568)) )
))
(declare-fun arrayNoDuplicates!0 (array!70219 (_ BitVec 32) List!23568) Bool)

(assert (=> b!1087932 (= res!725576 (arrayNoDuplicates!0 lt!484347 #b00000000000000000000000000000000 Nil!23565))))

(declare-fun b!1087933 () Bool)

(declare-fun e!621431 () Bool)

(assert (=> b!1087933 (= e!621431 tp_is_empty!26647)))

(declare-fun b!1087934 () Bool)

(declare-fun e!621433 () Bool)

(assert (=> b!1087934 (= e!621428 (not e!621433))))

(declare-fun res!725577 () Bool)

(assert (=> b!1087934 (=> res!725577 e!621433)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1087934 (= res!725577 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40657)

(declare-datatypes ((tuple2!16982 0))(
  ( (tuple2!16983 (_1!8502 (_ BitVec 64)) (_2!8502 V!40657)) )
))
(declare-datatypes ((List!23569 0))(
  ( (Nil!23566) (Cons!23565 (h!24774 tuple2!16982) (t!33272 List!23569)) )
))
(declare-datatypes ((ListLongMap!14951 0))(
  ( (ListLongMap!14952 (toList!7491 List!23569)) )
))
(declare-fun lt!484357 () ListLongMap!14951)

(declare-fun zeroValue!831 () V!40657)

(declare-fun getCurrentListMap!4265 (array!70219 array!70221 (_ BitVec 32) (_ BitVec 32) V!40657 V!40657 (_ BitVec 32) Int) ListLongMap!14951)

(assert (=> b!1087934 (= lt!484357 (getCurrentListMap!4265 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484345 () ListLongMap!14951)

(declare-fun lt!484351 () array!70221)

(assert (=> b!1087934 (= lt!484345 (getCurrentListMap!4265 lt!484347 lt!484351 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484350 () ListLongMap!14951)

(declare-fun lt!484346 () ListLongMap!14951)

(assert (=> b!1087934 (and (= lt!484350 lt!484346) (= lt!484346 lt!484350))))

(declare-fun lt!484348 () ListLongMap!14951)

(declare-fun -!816 (ListLongMap!14951 (_ BitVec 64)) ListLongMap!14951)

(assert (=> b!1087934 (= lt!484346 (-!816 lt!484348 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35798 0))(
  ( (Unit!35799) )
))
(declare-fun lt!484353 () Unit!35798)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!84 (array!70219 array!70221 (_ BitVec 32) (_ BitVec 32) V!40657 V!40657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35798)

(assert (=> b!1087934 (= lt!484353 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!84 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4025 (array!70219 array!70221 (_ BitVec 32) (_ BitVec 32) V!40657 V!40657 (_ BitVec 32) Int) ListLongMap!14951)

(assert (=> b!1087934 (= lt!484350 (getCurrentListMapNoExtraKeys!4025 lt!484347 lt!484351 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2162 (Int (_ BitVec 64)) V!40657)

(assert (=> b!1087934 (= lt!484351 (array!70222 (store (arr!33784 _values!874) i!650 (ValueCellFull!12614 (dynLambda!2162 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34320 _values!874)))))

(assert (=> b!1087934 (= lt!484348 (getCurrentListMapNoExtraKeys!4025 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1087934 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!484352 () Unit!35798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70219 (_ BitVec 64) (_ BitVec 32)) Unit!35798)

(assert (=> b!1087934 (= lt!484352 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1087935 () Bool)

(declare-fun res!725574 () Bool)

(assert (=> b!1087935 (=> (not res!725574) (not e!621429))))

(assert (=> b!1087935 (= res!725574 (= (select (arr!33783 _keys!1070) i!650) k!904))))

(declare-fun b!1087936 () Bool)

(declare-fun e!621427 () Bool)

(assert (=> b!1087936 (= e!621427 true)))

(declare-fun lt!484354 () ListLongMap!14951)

(declare-fun lt!484356 () ListLongMap!14951)

(assert (=> b!1087936 (= (-!816 lt!484354 k!904) lt!484356)))

(declare-fun lt!484349 () Unit!35798)

(declare-fun addRemoveCommutativeForDiffKeys!47 (ListLongMap!14951 (_ BitVec 64) V!40657 (_ BitVec 64)) Unit!35798)

(assert (=> b!1087936 (= lt!484349 (addRemoveCommutativeForDiffKeys!47 lt!484348 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1087937 () Bool)

(assert (=> b!1087937 (= e!621433 e!621427)))

(declare-fun res!725571 () Bool)

(assert (=> b!1087937 (=> res!725571 e!621427)))

(assert (=> b!1087937 (= res!725571 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(assert (=> b!1087937 (= lt!484345 lt!484356)))

(declare-fun lt!484355 () tuple2!16982)

(declare-fun +!3292 (ListLongMap!14951 tuple2!16982) ListLongMap!14951)

(assert (=> b!1087937 (= lt!484356 (+!3292 lt!484346 lt!484355))))

(assert (=> b!1087937 (= lt!484357 lt!484354)))

(assert (=> b!1087937 (= lt!484354 (+!3292 lt!484348 lt!484355))))

(assert (=> b!1087937 (= lt!484345 (+!3292 lt!484350 lt!484355))))

(assert (=> b!1087937 (= lt!484355 (tuple2!16983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun mapIsEmpty!41725 () Bool)

(assert (=> mapIsEmpty!41725 mapRes!41725))

(declare-fun b!1087938 () Bool)

(declare-fun res!725568 () Bool)

(assert (=> b!1087938 (=> (not res!725568) (not e!621429))))

(assert (=> b!1087938 (= res!725568 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23565))))

(declare-fun b!1087939 () Bool)

(assert (=> b!1087939 (= e!621429 e!621428)))

(declare-fun res!725575 () Bool)

(assert (=> b!1087939 (=> (not res!725575) (not e!621428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70219 (_ BitVec 32)) Bool)

(assert (=> b!1087939 (= res!725575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484347 mask!1414))))

(assert (=> b!1087939 (= lt!484347 (array!70220 (store (arr!33783 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34319 _keys!1070)))))

(declare-fun b!1087940 () Bool)

(declare-fun res!725570 () Bool)

(assert (=> b!1087940 (=> (not res!725570) (not e!621429))))

(assert (=> b!1087940 (= res!725570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1087941 () Bool)

(assert (=> b!1087941 (= e!621430 (and e!621431 mapRes!41725))))

(declare-fun condMapEmpty!41725 () Bool)

(declare-fun mapDefault!41725 () ValueCell!12614)

