; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95926 () Bool)

(assert start!95926)

(declare-fun b_free!22579 () Bool)

(declare-fun b_next!22579 () Bool)

(assert (=> start!95926 (= b_free!22579 (not b_next!22579))))

(declare-fun tp!79585 () Bool)

(declare-fun b_and!35833 () Bool)

(assert (=> start!95926 (= tp!79585 b_and!35833)))

(declare-fun b!1086469 () Bool)

(declare-fun e!620638 () Bool)

(assert (=> b!1086469 (= e!620638 true)))

(declare-fun k!904 () (_ BitVec 64))

(declare-datatypes ((V!40569 0))(
  ( (V!40570 (val!13347 Int)) )
))
(declare-datatypes ((tuple2!16930 0))(
  ( (tuple2!16931 (_1!8476 (_ BitVec 64)) (_2!8476 V!40569)) )
))
(declare-fun lt!482885 () tuple2!16930)

(declare-datatypes ((List!23520 0))(
  ( (Nil!23517) (Cons!23516 (h!24725 tuple2!16930) (t!33157 List!23520)) )
))
(declare-datatypes ((ListLongMap!14899 0))(
  ( (ListLongMap!14900 (toList!7465 List!23520)) )
))
(declare-fun lt!482891 () ListLongMap!14899)

(declare-fun lt!482886 () ListLongMap!14899)

(declare-fun -!791 (ListLongMap!14899 (_ BitVec 64)) ListLongMap!14899)

(declare-fun +!3272 (ListLongMap!14899 tuple2!16930) ListLongMap!14899)

(assert (=> b!1086469 (= (-!791 lt!482891 k!904) (+!3272 lt!482886 lt!482885))))

(declare-fun minValue!831 () V!40569)

(declare-fun lt!482882 () ListLongMap!14899)

(declare-datatypes ((Unit!35748 0))(
  ( (Unit!35749) )
))
(declare-fun lt!482880 () Unit!35748)

(declare-fun addRemoveCommutativeForDiffKeys!28 (ListLongMap!14899 (_ BitVec 64) V!40569 (_ BitVec 64)) Unit!35748)

(assert (=> b!1086469 (= lt!482880 (addRemoveCommutativeForDiffKeys!28 lt!482882 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1086470 () Bool)

(declare-fun res!724476 () Bool)

(declare-fun e!620641 () Bool)

(assert (=> b!1086470 (=> (not res!724476) (not e!620641))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70095 0))(
  ( (array!70096 (arr!33721 (Array (_ BitVec 32) (_ BitVec 64))) (size!34257 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70095)

(declare-datatypes ((ValueCell!12581 0))(
  ( (ValueCellFull!12581 (v!15968 V!40569)) (EmptyCell!12581) )
))
(declare-datatypes ((array!70097 0))(
  ( (array!70098 (arr!33722 (Array (_ BitVec 32) ValueCell!12581)) (size!34258 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70097)

(assert (=> b!1086470 (= res!724476 (and (= (size!34258 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34257 _keys!1070) (size!34258 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086471 () Bool)

(declare-fun e!620639 () Bool)

(assert (=> b!1086471 (= e!620639 e!620638)))

(declare-fun res!724471 () Bool)

(assert (=> b!1086471 (=> res!724471 e!620638)))

(assert (=> b!1086471 (= res!724471 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!482877 () ListLongMap!14899)

(assert (=> b!1086471 (= lt!482886 lt!482877)))

(assert (=> b!1086471 (= lt!482886 (-!791 lt!482882 k!904))))

(declare-fun lt!482878 () Unit!35748)

(declare-fun zeroValue!831 () V!40569)

(declare-fun lt!482888 () ListLongMap!14899)

(assert (=> b!1086471 (= lt!482878 (addRemoveCommutativeForDiffKeys!28 lt!482888 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!482890 () ListLongMap!14899)

(assert (=> b!1086471 (= lt!482890 (+!3272 lt!482877 lt!482885))))

(declare-fun lt!482893 () ListLongMap!14899)

(declare-fun lt!482883 () tuple2!16930)

(assert (=> b!1086471 (= lt!482877 (+!3272 lt!482893 lt!482883))))

(declare-fun lt!482879 () ListLongMap!14899)

(assert (=> b!1086471 (= lt!482879 lt!482891)))

(assert (=> b!1086471 (= lt!482891 (+!3272 lt!482882 lt!482885))))

(assert (=> b!1086471 (= lt!482882 (+!3272 lt!482888 lt!482883))))

(declare-fun lt!482892 () ListLongMap!14899)

(assert (=> b!1086471 (= lt!482890 (+!3272 (+!3272 lt!482892 lt!482883) lt!482885))))

(assert (=> b!1086471 (= lt!482885 (tuple2!16931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086471 (= lt!482883 (tuple2!16931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086472 () Bool)

(declare-fun res!724470 () Bool)

(assert (=> b!1086472 (=> (not res!724470) (not e!620641))))

(declare-datatypes ((List!23521 0))(
  ( (Nil!23518) (Cons!23517 (h!24726 (_ BitVec 64)) (t!33158 List!23521)) )
))
(declare-fun arrayNoDuplicates!0 (array!70095 (_ BitVec 32) List!23521) Bool)

(assert (=> b!1086472 (= res!724470 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23518))))

(declare-fun b!1086473 () Bool)

(declare-fun e!620637 () Bool)

(declare-fun tp_is_empty!26581 () Bool)

(assert (=> b!1086473 (= e!620637 tp_is_empty!26581)))

(declare-fun res!724474 () Bool)

(assert (=> start!95926 (=> (not res!724474) (not e!620641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95926 (= res!724474 (validMask!0 mask!1414))))

(assert (=> start!95926 e!620641))

(assert (=> start!95926 tp!79585))

(assert (=> start!95926 true))

(assert (=> start!95926 tp_is_empty!26581))

(declare-fun array_inv!26020 (array!70095) Bool)

(assert (=> start!95926 (array_inv!26020 _keys!1070)))

(declare-fun e!620636 () Bool)

(declare-fun array_inv!26021 (array!70097) Bool)

(assert (=> start!95926 (and (array_inv!26021 _values!874) e!620636)))

(declare-fun b!1086474 () Bool)

(declare-fun res!724472 () Bool)

(assert (=> b!1086474 (=> (not res!724472) (not e!620641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086474 (= res!724472 (validKeyInArray!0 k!904))))

(declare-fun b!1086475 () Bool)

(declare-fun e!620642 () Bool)

(assert (=> b!1086475 (= e!620642 (not e!620639))))

(declare-fun res!724469 () Bool)

(assert (=> b!1086475 (=> res!724469 e!620639)))

(assert (=> b!1086475 (= res!724469 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4245 (array!70095 array!70097 (_ BitVec 32) (_ BitVec 32) V!40569 V!40569 (_ BitVec 32) Int) ListLongMap!14899)

(assert (=> b!1086475 (= lt!482879 (getCurrentListMap!4245 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482881 () array!70095)

(declare-fun lt!482887 () array!70097)

(assert (=> b!1086475 (= lt!482890 (getCurrentListMap!4245 lt!482881 lt!482887 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1086475 (and (= lt!482892 lt!482893) (= lt!482893 lt!482892))))

(assert (=> b!1086475 (= lt!482893 (-!791 lt!482888 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!482884 () Unit!35748)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!64 (array!70095 array!70097 (_ BitVec 32) (_ BitVec 32) V!40569 V!40569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35748)

(assert (=> b!1086475 (= lt!482884 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!64 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4005 (array!70095 array!70097 (_ BitVec 32) (_ BitVec 32) V!40569 V!40569 (_ BitVec 32) Int) ListLongMap!14899)

(assert (=> b!1086475 (= lt!482892 (getCurrentListMapNoExtraKeys!4005 lt!482881 lt!482887 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2142 (Int (_ BitVec 64)) V!40569)

(assert (=> b!1086475 (= lt!482887 (array!70098 (store (arr!33722 _values!874) i!650 (ValueCellFull!12581 (dynLambda!2142 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34258 _values!874)))))

(assert (=> b!1086475 (= lt!482888 (getCurrentListMapNoExtraKeys!4005 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086475 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!482889 () Unit!35748)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70095 (_ BitVec 64) (_ BitVec 32)) Unit!35748)

(assert (=> b!1086475 (= lt!482889 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapIsEmpty!41626 () Bool)

(declare-fun mapRes!41626 () Bool)

(assert (=> mapIsEmpty!41626 mapRes!41626))

(declare-fun b!1086476 () Bool)

(declare-fun res!724473 () Bool)

(assert (=> b!1086476 (=> (not res!724473) (not e!620641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70095 (_ BitVec 32)) Bool)

(assert (=> b!1086476 (= res!724473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086477 () Bool)

(declare-fun res!724477 () Bool)

(assert (=> b!1086477 (=> (not res!724477) (not e!620641))))

(assert (=> b!1086477 (= res!724477 (= (select (arr!33721 _keys!1070) i!650) k!904))))

(declare-fun mapNonEmpty!41626 () Bool)

(declare-fun tp!79586 () Bool)

(declare-fun e!620635 () Bool)

(assert (=> mapNonEmpty!41626 (= mapRes!41626 (and tp!79586 e!620635))))

(declare-fun mapKey!41626 () (_ BitVec 32))

(declare-fun mapRest!41626 () (Array (_ BitVec 32) ValueCell!12581))

(declare-fun mapValue!41626 () ValueCell!12581)

(assert (=> mapNonEmpty!41626 (= (arr!33722 _values!874) (store mapRest!41626 mapKey!41626 mapValue!41626))))

(declare-fun b!1086478 () Bool)

(assert (=> b!1086478 (= e!620636 (and e!620637 mapRes!41626))))

(declare-fun condMapEmpty!41626 () Bool)

(declare-fun mapDefault!41626 () ValueCell!12581)

