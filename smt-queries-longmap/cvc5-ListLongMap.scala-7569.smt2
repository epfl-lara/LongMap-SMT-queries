; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95734 () Bool)

(assert start!95734)

(declare-fun b_free!22387 () Bool)

(declare-fun b_next!22387 () Bool)

(assert (=> start!95734 (= b_free!22387 (not b_next!22387))))

(declare-fun tp!79010 () Bool)

(declare-fun b_and!35449 () Bool)

(assert (=> start!95734 (= tp!79010 b_and!35449)))

(declare-fun b!1082565 () Bool)

(declare-fun e!618664 () Bool)

(declare-fun tp_is_empty!26389 () Bool)

(assert (=> b!1082565 (= e!618664 tp_is_empty!26389)))

(declare-fun mapNonEmpty!41338 () Bool)

(declare-fun mapRes!41338 () Bool)

(declare-fun tp!79009 () Bool)

(declare-fun e!618662 () Bool)

(assert (=> mapNonEmpty!41338 (= mapRes!41338 (and tp!79009 e!618662))))

(declare-datatypes ((V!40313 0))(
  ( (V!40314 (val!13251 Int)) )
))
(declare-datatypes ((ValueCell!12485 0))(
  ( (ValueCellFull!12485 (v!15872 V!40313)) (EmptyCell!12485) )
))
(declare-datatypes ((array!69725 0))(
  ( (array!69726 (arr!33536 (Array (_ BitVec 32) ValueCell!12485)) (size!34072 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69725)

(declare-fun mapRest!41338 () (Array (_ BitVec 32) ValueCell!12485))

(declare-fun mapValue!41338 () ValueCell!12485)

(declare-fun mapKey!41338 () (_ BitVec 32))

(assert (=> mapNonEmpty!41338 (= (arr!33536 _values!874) (store mapRest!41338 mapKey!41338 mapValue!41338))))

(declare-fun b!1082566 () Bool)

(declare-fun res!721627 () Bool)

(declare-fun e!618663 () Bool)

(assert (=> b!1082566 (=> (not res!721627) (not e!618663))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69727 0))(
  ( (array!69728 (arr!33537 (Array (_ BitVec 32) (_ BitVec 64))) (size!34073 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69727)

(assert (=> b!1082566 (= res!721627 (and (= (size!34072 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34073 _keys!1070) (size!34072 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082567 () Bool)

(declare-fun res!721621 () Bool)

(assert (=> b!1082567 (=> (not res!721621) (not e!618663))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082567 (= res!721621 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34073 _keys!1070))))))

(declare-fun b!1082568 () Bool)

(declare-fun res!721626 () Bool)

(assert (=> b!1082568 (=> (not res!721626) (not e!618663))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1082568 (= res!721626 (= (select (arr!33537 _keys!1070) i!650) k!904))))

(declare-fun b!1082569 () Bool)

(declare-fun res!721622 () Bool)

(assert (=> b!1082569 (=> (not res!721622) (not e!618663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082569 (= res!721622 (validKeyInArray!0 k!904))))

(declare-fun b!1082570 () Bool)

(declare-fun res!721623 () Bool)

(declare-fun e!618661 () Bool)

(assert (=> b!1082570 (=> (not res!721623) (not e!618661))))

(declare-fun lt!479661 () array!69727)

(declare-datatypes ((List!23374 0))(
  ( (Nil!23371) (Cons!23370 (h!24579 (_ BitVec 64)) (t!32819 List!23374)) )
))
(declare-fun arrayNoDuplicates!0 (array!69727 (_ BitVec 32) List!23374) Bool)

(assert (=> b!1082570 (= res!721623 (arrayNoDuplicates!0 lt!479661 #b00000000000000000000000000000000 Nil!23371))))

(declare-fun b!1082571 () Bool)

(assert (=> b!1082571 (= e!618663 e!618661)))

(declare-fun res!721625 () Bool)

(assert (=> b!1082571 (=> (not res!721625) (not e!618661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69727 (_ BitVec 32)) Bool)

(assert (=> b!1082571 (= res!721625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479661 mask!1414))))

(assert (=> b!1082571 (= lt!479661 (array!69728 (store (arr!33537 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34073 _keys!1070)))))

(declare-fun b!1082572 () Bool)

(declare-fun res!721629 () Bool)

(assert (=> b!1082572 (=> (not res!721629) (not e!618663))))

(assert (=> b!1082572 (= res!721629 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23371))))

(declare-fun b!1082574 () Bool)

(assert (=> b!1082574 (= e!618661 (not true))))

(declare-datatypes ((tuple2!16788 0))(
  ( (tuple2!16789 (_1!8405 (_ BitVec 64)) (_2!8405 V!40313)) )
))
(declare-datatypes ((List!23375 0))(
  ( (Nil!23372) (Cons!23371 (h!24580 tuple2!16788) (t!32820 List!23375)) )
))
(declare-datatypes ((ListLongMap!14757 0))(
  ( (ListLongMap!14758 (toList!7394 List!23375)) )
))
(declare-fun lt!479664 () ListLongMap!14757)

(declare-fun lt!479665 () ListLongMap!14757)

(assert (=> b!1082574 (and (= lt!479664 lt!479665) (= lt!479665 lt!479664))))

(declare-fun lt!479660 () ListLongMap!14757)

(declare-fun -!721 (ListLongMap!14757 (_ BitVec 64)) ListLongMap!14757)

(assert (=> b!1082574 (= lt!479665 (-!721 lt!479660 k!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40313)

(declare-fun zeroValue!831 () V!40313)

(declare-datatypes ((Unit!35608 0))(
  ( (Unit!35609) )
))
(declare-fun lt!479663 () Unit!35608)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1 (array!69727 array!69725 (_ BitVec 32) (_ BitVec 32) V!40313 V!40313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35608)

(assert (=> b!1082574 (= lt!479663 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3942 (array!69727 array!69725 (_ BitVec 32) (_ BitVec 32) V!40313 V!40313 (_ BitVec 32) Int) ListLongMap!14757)

(declare-fun dynLambda!2079 (Int (_ BitVec 64)) V!40313)

(assert (=> b!1082574 (= lt!479664 (getCurrentListMapNoExtraKeys!3942 lt!479661 (array!69726 (store (arr!33536 _values!874) i!650 (ValueCellFull!12485 (dynLambda!2079 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34072 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082574 (= lt!479660 (getCurrentListMapNoExtraKeys!3942 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082574 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!479662 () Unit!35608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69727 (_ BitVec 64) (_ BitVec 32)) Unit!35608)

(assert (=> b!1082574 (= lt!479662 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun mapIsEmpty!41338 () Bool)

(assert (=> mapIsEmpty!41338 mapRes!41338))

(declare-fun b!1082575 () Bool)

(declare-fun res!721624 () Bool)

(assert (=> b!1082575 (=> (not res!721624) (not e!618663))))

(assert (=> b!1082575 (= res!721624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082576 () Bool)

(assert (=> b!1082576 (= e!618662 tp_is_empty!26389)))

(declare-fun b!1082573 () Bool)

(declare-fun e!618665 () Bool)

(assert (=> b!1082573 (= e!618665 (and e!618664 mapRes!41338))))

(declare-fun condMapEmpty!41338 () Bool)

(declare-fun mapDefault!41338 () ValueCell!12485)

