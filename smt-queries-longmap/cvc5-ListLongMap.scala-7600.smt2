; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95920 () Bool)

(assert start!95920)

(declare-fun b_free!22573 () Bool)

(declare-fun b_next!22573 () Bool)

(assert (=> start!95920 (= b_free!22573 (not b_next!22573))))

(declare-fun tp!79567 () Bool)

(declare-fun b_and!35821 () Bool)

(assert (=> start!95920 (= tp!79567 b_and!35821)))

(declare-fun b!1086337 () Bool)

(declare-fun res!724374 () Bool)

(declare-fun e!620563 () Bool)

(assert (=> b!1086337 (=> (not res!724374) (not e!620563))))

(declare-datatypes ((array!70085 0))(
  ( (array!70086 (arr!33716 (Array (_ BitVec 32) (_ BitVec 64))) (size!34252 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70085)

(declare-datatypes ((List!23516 0))(
  ( (Nil!23513) (Cons!23512 (h!24721 (_ BitVec 64)) (t!33147 List!23516)) )
))
(declare-fun arrayNoDuplicates!0 (array!70085 (_ BitVec 32) List!23516) Bool)

(assert (=> b!1086337 (= res!724374 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23513))))

(declare-fun b!1086339 () Bool)

(declare-fun e!620570 () Bool)

(declare-fun tp_is_empty!26575 () Bool)

(assert (=> b!1086339 (= e!620570 tp_is_empty!26575)))

(declare-fun b!1086340 () Bool)

(declare-fun res!724376 () Bool)

(assert (=> b!1086340 (=> (not res!724376) (not e!620563))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086340 (= res!724376 (validKeyInArray!0 k!904))))

(declare-fun b!1086341 () Bool)

(declare-fun e!620564 () Bool)

(assert (=> b!1086341 (= e!620564 tp_is_empty!26575)))

(declare-fun b!1086342 () Bool)

(declare-fun e!620565 () Bool)

(assert (=> b!1086342 (= e!620563 e!620565)))

(declare-fun res!724375 () Bool)

(assert (=> b!1086342 (=> (not res!724375) (not e!620565))))

(declare-fun lt!482727 () array!70085)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70085 (_ BitVec 32)) Bool)

(assert (=> b!1086342 (= res!724375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482727 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086342 (= lt!482727 (array!70086 (store (arr!33716 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34252 _keys!1070)))))

(declare-fun b!1086343 () Bool)

(declare-fun res!724373 () Bool)

(assert (=> b!1086343 (=> (not res!724373) (not e!620563))))

(assert (=> b!1086343 (= res!724373 (= (select (arr!33716 _keys!1070) i!650) k!904))))

(declare-fun b!1086344 () Bool)

(declare-fun res!724371 () Bool)

(assert (=> b!1086344 (=> (not res!724371) (not e!620563))))

(assert (=> b!1086344 (= res!724371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086345 () Bool)

(declare-fun e!620568 () Bool)

(assert (=> b!1086345 (= e!620568 true)))

(declare-datatypes ((V!40561 0))(
  ( (V!40562 (val!13344 Int)) )
))
(declare-datatypes ((tuple2!16926 0))(
  ( (tuple2!16927 (_1!8474 (_ BitVec 64)) (_2!8474 V!40561)) )
))
(declare-fun lt!482737 () tuple2!16926)

(declare-datatypes ((List!23517 0))(
  ( (Nil!23514) (Cons!23513 (h!24722 tuple2!16926) (t!33148 List!23517)) )
))
(declare-datatypes ((ListLongMap!14895 0))(
  ( (ListLongMap!14896 (toList!7463 List!23517)) )
))
(declare-fun lt!482728 () ListLongMap!14895)

(declare-fun lt!482738 () ListLongMap!14895)

(declare-fun -!789 (ListLongMap!14895 (_ BitVec 64)) ListLongMap!14895)

(declare-fun +!3270 (ListLongMap!14895 tuple2!16926) ListLongMap!14895)

(assert (=> b!1086345 (= (-!789 lt!482728 k!904) (+!3270 lt!482738 lt!482737))))

(declare-datatypes ((Unit!35744 0))(
  ( (Unit!35745) )
))
(declare-fun lt!482735 () Unit!35744)

(declare-fun lt!482730 () ListLongMap!14895)

(declare-fun minValue!831 () V!40561)

(declare-fun addRemoveCommutativeForDiffKeys!26 (ListLongMap!14895 (_ BitVec 64) V!40561 (_ BitVec 64)) Unit!35744)

(assert (=> b!1086345 (= lt!482735 (addRemoveCommutativeForDiffKeys!26 lt!482730 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1086346 () Bool)

(declare-fun e!620567 () Bool)

(assert (=> b!1086346 (= e!620565 (not e!620567))))

(declare-fun res!724380 () Bool)

(assert (=> b!1086346 (=> res!724380 e!620567)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086346 (= res!724380 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((ValueCell!12578 0))(
  ( (ValueCellFull!12578 (v!15965 V!40561)) (EmptyCell!12578) )
))
(declare-datatypes ((array!70087 0))(
  ( (array!70088 (arr!33717 (Array (_ BitVec 32) ValueCell!12578)) (size!34253 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70087)

(declare-fun zeroValue!831 () V!40561)

(declare-fun lt!482740 () ListLongMap!14895)

(declare-fun getCurrentListMap!4243 (array!70085 array!70087 (_ BitVec 32) (_ BitVec 32) V!40561 V!40561 (_ BitVec 32) Int) ListLongMap!14895)

(assert (=> b!1086346 (= lt!482740 (getCurrentListMap!4243 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482729 () array!70087)

(declare-fun lt!482732 () ListLongMap!14895)

(assert (=> b!1086346 (= lt!482732 (getCurrentListMap!4243 lt!482727 lt!482729 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482736 () ListLongMap!14895)

(declare-fun lt!482731 () ListLongMap!14895)

(assert (=> b!1086346 (and (= lt!482736 lt!482731) (= lt!482731 lt!482736))))

(declare-fun lt!482734 () ListLongMap!14895)

(assert (=> b!1086346 (= lt!482731 (-!789 lt!482734 k!904))))

(declare-fun lt!482726 () Unit!35744)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!62 (array!70085 array!70087 (_ BitVec 32) (_ BitVec 32) V!40561 V!40561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35744)

(assert (=> b!1086346 (= lt!482726 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!62 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4003 (array!70085 array!70087 (_ BitVec 32) (_ BitVec 32) V!40561 V!40561 (_ BitVec 32) Int) ListLongMap!14895)

(assert (=> b!1086346 (= lt!482736 (getCurrentListMapNoExtraKeys!4003 lt!482727 lt!482729 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2140 (Int (_ BitVec 64)) V!40561)

(assert (=> b!1086346 (= lt!482729 (array!70088 (store (arr!33717 _values!874) i!650 (ValueCellFull!12578 (dynLambda!2140 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34253 _values!874)))))

(assert (=> b!1086346 (= lt!482734 (getCurrentListMapNoExtraKeys!4003 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086346 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!482733 () Unit!35744)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70085 (_ BitVec 64) (_ BitVec 32)) Unit!35744)

(assert (=> b!1086346 (= lt!482733 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapIsEmpty!41617 () Bool)

(declare-fun mapRes!41617 () Bool)

(assert (=> mapIsEmpty!41617 mapRes!41617))

(declare-fun mapNonEmpty!41617 () Bool)

(declare-fun tp!79568 () Bool)

(assert (=> mapNonEmpty!41617 (= mapRes!41617 (and tp!79568 e!620570))))

(declare-fun mapValue!41617 () ValueCell!12578)

(declare-fun mapKey!41617 () (_ BitVec 32))

(declare-fun mapRest!41617 () (Array (_ BitVec 32) ValueCell!12578))

(assert (=> mapNonEmpty!41617 (= (arr!33717 _values!874) (store mapRest!41617 mapKey!41617 mapValue!41617))))

(declare-fun b!1086347 () Bool)

(declare-fun res!724370 () Bool)

(assert (=> b!1086347 (=> (not res!724370) (not e!620565))))

(assert (=> b!1086347 (= res!724370 (arrayNoDuplicates!0 lt!482727 #b00000000000000000000000000000000 Nil!23513))))

(declare-fun res!724377 () Bool)

(assert (=> start!95920 (=> (not res!724377) (not e!620563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95920 (= res!724377 (validMask!0 mask!1414))))

(assert (=> start!95920 e!620563))

(assert (=> start!95920 tp!79567))

(assert (=> start!95920 true))

(assert (=> start!95920 tp_is_empty!26575))

(declare-fun array_inv!26016 (array!70085) Bool)

(assert (=> start!95920 (array_inv!26016 _keys!1070)))

(declare-fun e!620569 () Bool)

(declare-fun array_inv!26017 (array!70087) Bool)

(assert (=> start!95920 (and (array_inv!26017 _values!874) e!620569)))

(declare-fun b!1086338 () Bool)

(declare-fun res!724379 () Bool)

(assert (=> b!1086338 (=> (not res!724379) (not e!620563))))

(assert (=> b!1086338 (= res!724379 (and (= (size!34253 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34252 _keys!1070) (size!34253 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086348 () Bool)

(declare-fun res!724378 () Bool)

(assert (=> b!1086348 (=> (not res!724378) (not e!620563))))

(assert (=> b!1086348 (= res!724378 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34252 _keys!1070))))))

(declare-fun b!1086349 () Bool)

(assert (=> b!1086349 (= e!620567 e!620568)))

(declare-fun res!724372 () Bool)

(assert (=> b!1086349 (=> res!724372 e!620568)))

(assert (=> b!1086349 (= res!724372 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!482724 () ListLongMap!14895)

(assert (=> b!1086349 (= lt!482738 lt!482724)))

(assert (=> b!1086349 (= lt!482738 (-!789 lt!482730 k!904))))

(declare-fun lt!482725 () Unit!35744)

(assert (=> b!1086349 (= lt!482725 (addRemoveCommutativeForDiffKeys!26 lt!482734 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(assert (=> b!1086349 (= lt!482732 (+!3270 lt!482724 lt!482737))))

(declare-fun lt!482739 () tuple2!16926)

(assert (=> b!1086349 (= lt!482724 (+!3270 lt!482731 lt!482739))))

(assert (=> b!1086349 (= lt!482740 lt!482728)))

(assert (=> b!1086349 (= lt!482728 (+!3270 lt!482730 lt!482737))))

(assert (=> b!1086349 (= lt!482730 (+!3270 lt!482734 lt!482739))))

(assert (=> b!1086349 (= lt!482732 (+!3270 (+!3270 lt!482736 lt!482739) lt!482737))))

(assert (=> b!1086349 (= lt!482737 (tuple2!16927 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086349 (= lt!482739 (tuple2!16927 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086350 () Bool)

(assert (=> b!1086350 (= e!620569 (and e!620564 mapRes!41617))))

(declare-fun condMapEmpty!41617 () Bool)

(declare-fun mapDefault!41617 () ValueCell!12578)

