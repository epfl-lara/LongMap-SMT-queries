; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96914 () Bool)

(assert start!96914)

(declare-fun b_free!23207 () Bool)

(declare-fun b_next!23207 () Bool)

(assert (=> start!96914 (= b_free!23207 (not b_next!23207))))

(declare-fun tp!81581 () Bool)

(declare-fun b_and!37231 () Bool)

(assert (=> start!96914 (= tp!81581 b_and!37231)))

(declare-fun b!1102581 () Bool)

(declare-fun res!735673 () Bool)

(declare-fun e!629325 () Bool)

(assert (=> b!1102581 (=> (not res!735673) (not e!629325))))

(declare-datatypes ((array!71435 0))(
  ( (array!71436 (arr!34378 (Array (_ BitVec 32) (_ BitVec 64))) (size!34914 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71435)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71435 (_ BitVec 32)) Bool)

(assert (=> b!1102581 (= res!735673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102582 () Bool)

(declare-fun res!735671 () Bool)

(assert (=> b!1102582 (=> (not res!735671) (not e!629325))))

(declare-datatypes ((List!24022 0))(
  ( (Nil!24019) (Cons!24018 (h!25227 (_ BitVec 64)) (t!34275 List!24022)) )
))
(declare-fun arrayNoDuplicates!0 (array!71435 (_ BitVec 32) List!24022) Bool)

(assert (=> b!1102582 (= res!735671 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24019))))

(declare-fun b!1102583 () Bool)

(declare-fun res!735670 () Bool)

(assert (=> b!1102583 (=> (not res!735670) (not e!629325))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102583 (= res!735670 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34914 _keys!1070))))))

(declare-fun b!1102584 () Bool)

(declare-fun res!735668 () Bool)

(assert (=> b!1102584 (=> (not res!735668) (not e!629325))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102584 (= res!735668 (validKeyInArray!0 k!904))))

(declare-fun res!735669 () Bool)

(assert (=> start!96914 (=> (not res!735669) (not e!629325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96914 (= res!735669 (validMask!0 mask!1414))))

(assert (=> start!96914 e!629325))

(assert (=> start!96914 tp!81581))

(assert (=> start!96914 true))

(declare-fun tp_is_empty!27257 () Bool)

(assert (=> start!96914 tp_is_empty!27257))

(declare-fun array_inv!26478 (array!71435) Bool)

(assert (=> start!96914 (array_inv!26478 _keys!1070)))

(declare-datatypes ((V!41469 0))(
  ( (V!41470 (val!13685 Int)) )
))
(declare-datatypes ((ValueCell!12919 0))(
  ( (ValueCellFull!12919 (v!16316 V!41469)) (EmptyCell!12919) )
))
(declare-datatypes ((array!71437 0))(
  ( (array!71438 (arr!34379 (Array (_ BitVec 32) ValueCell!12919)) (size!34915 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71437)

(declare-fun e!629329 () Bool)

(declare-fun array_inv!26479 (array!71437) Bool)

(assert (=> start!96914 (and (array_inv!26479 _values!874) e!629329)))

(declare-fun mapNonEmpty!42679 () Bool)

(declare-fun mapRes!42679 () Bool)

(declare-fun tp!81580 () Bool)

(declare-fun e!629324 () Bool)

(assert (=> mapNonEmpty!42679 (= mapRes!42679 (and tp!81580 e!629324))))

(declare-fun mapKey!42679 () (_ BitVec 32))

(declare-fun mapValue!42679 () ValueCell!12919)

(declare-fun mapRest!42679 () (Array (_ BitVec 32) ValueCell!12919))

(assert (=> mapNonEmpty!42679 (= (arr!34379 _values!874) (store mapRest!42679 mapKey!42679 mapValue!42679))))

(declare-fun b!1102585 () Bool)

(declare-fun e!629328 () Bool)

(assert (=> b!1102585 (= e!629325 e!629328)))

(declare-fun res!735672 () Bool)

(assert (=> b!1102585 (=> (not res!735672) (not e!629328))))

(declare-fun lt!494721 () array!71435)

(assert (=> b!1102585 (= res!735672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494721 mask!1414))))

(assert (=> b!1102585 (= lt!494721 (array!71436 (store (arr!34378 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34914 _keys!1070)))))

(declare-fun b!1102586 () Bool)

(declare-fun res!735665 () Bool)

(assert (=> b!1102586 (=> (not res!735665) (not e!629325))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1102586 (= res!735665 (and (= (size!34915 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34914 _keys!1070) (size!34915 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1102587 () Bool)

(declare-fun res!735666 () Bool)

(assert (=> b!1102587 (=> (not res!735666) (not e!629328))))

(assert (=> b!1102587 (= res!735666 (arrayNoDuplicates!0 lt!494721 #b00000000000000000000000000000000 Nil!24019))))

(declare-fun mapIsEmpty!42679 () Bool)

(assert (=> mapIsEmpty!42679 mapRes!42679))

(declare-fun b!1102588 () Bool)

(declare-fun res!735667 () Bool)

(assert (=> b!1102588 (=> (not res!735667) (not e!629325))))

(assert (=> b!1102588 (= res!735667 (= (select (arr!34378 _keys!1070) i!650) k!904))))

(declare-fun b!1102589 () Bool)

(assert (=> b!1102589 (= e!629324 tp_is_empty!27257)))

(declare-fun b!1102590 () Bool)

(assert (=> b!1102590 (= e!629328 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41469)

(declare-datatypes ((tuple2!17406 0))(
  ( (tuple2!17407 (_1!8714 (_ BitVec 64)) (_2!8714 V!41469)) )
))
(declare-datatypes ((List!24023 0))(
  ( (Nil!24020) (Cons!24019 (h!25228 tuple2!17406) (t!34276 List!24023)) )
))
(declare-datatypes ((ListLongMap!15375 0))(
  ( (ListLongMap!15376 (toList!7703 List!24023)) )
))
(declare-fun lt!494716 () ListLongMap!15375)

(declare-fun zeroValue!831 () V!41469)

(declare-fun getCurrentListMap!4407 (array!71435 array!71437 (_ BitVec 32) (_ BitVec 32) V!41469 V!41469 (_ BitVec 32) Int) ListLongMap!15375)

(assert (=> b!1102590 (= lt!494716 (getCurrentListMap!4407 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494717 () array!71437)

(declare-fun lt!494718 () ListLongMap!15375)

(assert (=> b!1102590 (= lt!494718 (getCurrentListMap!4407 lt!494721 lt!494717 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494724 () ListLongMap!15375)

(declare-fun lt!494723 () ListLongMap!15375)

(assert (=> b!1102590 (and (= lt!494724 lt!494723) (= lt!494723 lt!494724))))

(declare-fun lt!494719 () ListLongMap!15375)

(declare-fun -!986 (ListLongMap!15375 (_ BitVec 64)) ListLongMap!15375)

(assert (=> b!1102590 (= lt!494723 (-!986 lt!494719 k!904))))

(declare-datatypes ((Unit!36226 0))(
  ( (Unit!36227) )
))
(declare-fun lt!494720 () Unit!36226)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!233 (array!71435 array!71437 (_ BitVec 32) (_ BitVec 32) V!41469 V!41469 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36226)

(assert (=> b!1102590 (= lt!494720 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!233 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4203 (array!71435 array!71437 (_ BitVec 32) (_ BitVec 32) V!41469 V!41469 (_ BitVec 32) Int) ListLongMap!15375)

(assert (=> b!1102590 (= lt!494724 (getCurrentListMapNoExtraKeys!4203 lt!494721 lt!494717 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2338 (Int (_ BitVec 64)) V!41469)

(assert (=> b!1102590 (= lt!494717 (array!71438 (store (arr!34379 _values!874) i!650 (ValueCellFull!12919 (dynLambda!2338 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34915 _values!874)))))

(assert (=> b!1102590 (= lt!494719 (getCurrentListMapNoExtraKeys!4203 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102590 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!494722 () Unit!36226)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71435 (_ BitVec 64) (_ BitVec 32)) Unit!36226)

(assert (=> b!1102590 (= lt!494722 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1102591 () Bool)

(declare-fun e!629326 () Bool)

(assert (=> b!1102591 (= e!629326 tp_is_empty!27257)))

(declare-fun b!1102592 () Bool)

(assert (=> b!1102592 (= e!629329 (and e!629326 mapRes!42679))))

(declare-fun condMapEmpty!42679 () Bool)

(declare-fun mapDefault!42679 () ValueCell!12919)

