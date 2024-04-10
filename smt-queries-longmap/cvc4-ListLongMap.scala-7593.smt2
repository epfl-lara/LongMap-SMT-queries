; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95882 () Bool)

(assert start!95882)

(declare-fun b_free!22535 () Bool)

(declare-fun b_next!22535 () Bool)

(assert (=> start!95882 (= b_free!22535 (not b_next!22535))))

(declare-fun tp!79454 () Bool)

(declare-fun b_and!35745 () Bool)

(assert (=> start!95882 (= tp!79454 b_and!35745)))

(declare-fun mapNonEmpty!41560 () Bool)

(declare-fun mapRes!41560 () Bool)

(declare-fun tp!79453 () Bool)

(declare-fun e!620111 () Bool)

(assert (=> mapNonEmpty!41560 (= mapRes!41560 (and tp!79453 e!620111))))

(declare-datatypes ((V!40509 0))(
  ( (V!40510 (val!13325 Int)) )
))
(declare-datatypes ((ValueCell!12559 0))(
  ( (ValueCellFull!12559 (v!15946 V!40509)) (EmptyCell!12559) )
))
(declare-fun mapRest!41560 () (Array (_ BitVec 32) ValueCell!12559))

(declare-fun mapValue!41560 () ValueCell!12559)

(declare-datatypes ((array!70009 0))(
  ( (array!70010 (arr!33678 (Array (_ BitVec 32) ValueCell!12559)) (size!34214 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70009)

(declare-fun mapKey!41560 () (_ BitVec 32))

(assert (=> mapNonEmpty!41560 (= (arr!33678 _values!874) (store mapRest!41560 mapKey!41560 mapValue!41560))))

(declare-fun res!723744 () Bool)

(declare-fun e!620108 () Bool)

(assert (=> start!95882 (=> (not res!723744) (not e!620108))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95882 (= res!723744 (validMask!0 mask!1414))))

(assert (=> start!95882 e!620108))

(assert (=> start!95882 tp!79454))

(assert (=> start!95882 true))

(declare-fun tp_is_empty!26537 () Bool)

(assert (=> start!95882 tp_is_empty!26537))

(declare-datatypes ((array!70011 0))(
  ( (array!70012 (arr!33679 (Array (_ BitVec 32) (_ BitVec 64))) (size!34215 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70011)

(declare-fun array_inv!25990 (array!70011) Bool)

(assert (=> start!95882 (array_inv!25990 _keys!1070)))

(declare-fun e!620114 () Bool)

(declare-fun array_inv!25991 (array!70009) Bool)

(assert (=> start!95882 (and (array_inv!25991 _values!874) e!620114)))

(declare-fun b!1085501 () Bool)

(declare-fun e!620113 () Bool)

(assert (=> b!1085501 (= e!620113 tp_is_empty!26537)))

(declare-fun b!1085502 () Bool)

(declare-fun res!723748 () Bool)

(declare-fun e!620109 () Bool)

(assert (=> b!1085502 (=> (not res!723748) (not e!620109))))

(declare-fun lt!481769 () array!70011)

(declare-datatypes ((List!23485 0))(
  ( (Nil!23482) (Cons!23481 (h!24690 (_ BitVec 64)) (t!33078 List!23485)) )
))
(declare-fun arrayNoDuplicates!0 (array!70011 (_ BitVec 32) List!23485) Bool)

(assert (=> b!1085502 (= res!723748 (arrayNoDuplicates!0 lt!481769 #b00000000000000000000000000000000 Nil!23482))))

(declare-fun b!1085503 () Bool)

(assert (=> b!1085503 (= e!620108 e!620109)))

(declare-fun res!723753 () Bool)

(assert (=> b!1085503 (=> (not res!723753) (not e!620109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70011 (_ BitVec 32)) Bool)

(assert (=> b!1085503 (= res!723753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481769 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085503 (= lt!481769 (array!70012 (store (arr!33679 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34215 _keys!1070)))))

(declare-fun b!1085504 () Bool)

(declare-fun e!620110 () Bool)

(assert (=> b!1085504 (= e!620109 (not e!620110))))

(declare-fun res!723751 () Bool)

(assert (=> b!1085504 (=> res!723751 e!620110)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085504 (= res!723751 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40509)

(declare-fun minValue!831 () V!40509)

(declare-datatypes ((tuple2!16896 0))(
  ( (tuple2!16897 (_1!8459 (_ BitVec 64)) (_2!8459 V!40509)) )
))
(declare-datatypes ((List!23486 0))(
  ( (Nil!23483) (Cons!23482 (h!24691 tuple2!16896) (t!33079 List!23486)) )
))
(declare-datatypes ((ListLongMap!14865 0))(
  ( (ListLongMap!14866 (toList!7448 List!23486)) )
))
(declare-fun lt!481771 () ListLongMap!14865)

(declare-fun getCurrentListMap!4233 (array!70011 array!70009 (_ BitVec 32) (_ BitVec 32) V!40509 V!40509 (_ BitVec 32) Int) ListLongMap!14865)

(assert (=> b!1085504 (= lt!481771 (getCurrentListMap!4233 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481761 () array!70009)

(declare-fun lt!481762 () ListLongMap!14865)

(assert (=> b!1085504 (= lt!481762 (getCurrentListMap!4233 lt!481769 lt!481761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481766 () ListLongMap!14865)

(declare-fun lt!481768 () ListLongMap!14865)

(assert (=> b!1085504 (and (= lt!481766 lt!481768) (= lt!481768 lt!481766))))

(declare-fun lt!481764 () ListLongMap!14865)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!774 (ListLongMap!14865 (_ BitVec 64)) ListLongMap!14865)

(assert (=> b!1085504 (= lt!481768 (-!774 lt!481764 k!904))))

(declare-datatypes ((Unit!35714 0))(
  ( (Unit!35715) )
))
(declare-fun lt!481756 () Unit!35714)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!52 (array!70011 array!70009 (_ BitVec 32) (_ BitVec 32) V!40509 V!40509 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35714)

(assert (=> b!1085504 (= lt!481756 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!52 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3993 (array!70011 array!70009 (_ BitVec 32) (_ BitVec 32) V!40509 V!40509 (_ BitVec 32) Int) ListLongMap!14865)

(assert (=> b!1085504 (= lt!481766 (getCurrentListMapNoExtraKeys!3993 lt!481769 lt!481761 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2130 (Int (_ BitVec 64)) V!40509)

(assert (=> b!1085504 (= lt!481761 (array!70010 (store (arr!33678 _values!874) i!650 (ValueCellFull!12559 (dynLambda!2130 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34214 _values!874)))))

(assert (=> b!1085504 (= lt!481764 (getCurrentListMapNoExtraKeys!3993 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085504 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!481760 () Unit!35714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70011 (_ BitVec 64) (_ BitVec 32)) Unit!35714)

(assert (=> b!1085504 (= lt!481760 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1085505 () Bool)

(assert (=> b!1085505 (= e!620111 tp_is_empty!26537)))

(declare-fun mapIsEmpty!41560 () Bool)

(assert (=> mapIsEmpty!41560 mapRes!41560))

(declare-fun b!1085506 () Bool)

(declare-fun res!723746 () Bool)

(assert (=> b!1085506 (=> (not res!723746) (not e!620108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085506 (= res!723746 (validKeyInArray!0 k!904))))

(declare-fun b!1085507 () Bool)

(declare-fun res!723743 () Bool)

(assert (=> b!1085507 (=> (not res!723743) (not e!620108))))

(assert (=> b!1085507 (= res!723743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085508 () Bool)

(declare-fun res!723745 () Bool)

(assert (=> b!1085508 (=> (not res!723745) (not e!620108))))

(assert (=> b!1085508 (= res!723745 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34215 _keys!1070))))))

(declare-fun b!1085509 () Bool)

(declare-fun res!723750 () Bool)

(assert (=> b!1085509 (=> (not res!723750) (not e!620108))))

(assert (=> b!1085509 (= res!723750 (= (select (arr!33679 _keys!1070) i!650) k!904))))

(declare-fun b!1085510 () Bool)

(declare-fun e!620107 () Bool)

(assert (=> b!1085510 (= e!620107 true)))

(declare-fun lt!481763 () tuple2!16896)

(declare-fun lt!481767 () ListLongMap!14865)

(declare-fun lt!481759 () ListLongMap!14865)

(declare-fun +!3256 (ListLongMap!14865 tuple2!16896) ListLongMap!14865)

(assert (=> b!1085510 (= (-!774 lt!481759 k!904) (+!3256 lt!481767 lt!481763))))

(declare-fun lt!481770 () Unit!35714)

(declare-fun lt!481758 () ListLongMap!14865)

(declare-fun addRemoveCommutativeForDiffKeys!12 (ListLongMap!14865 (_ BitVec 64) V!40509 (_ BitVec 64)) Unit!35714)

(assert (=> b!1085510 (= lt!481770 (addRemoveCommutativeForDiffKeys!12 lt!481758 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1085511 () Bool)

(assert (=> b!1085511 (= e!620114 (and e!620113 mapRes!41560))))

(declare-fun condMapEmpty!41560 () Bool)

(declare-fun mapDefault!41560 () ValueCell!12559)

