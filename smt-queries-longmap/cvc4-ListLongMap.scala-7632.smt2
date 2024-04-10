; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96116 () Bool)

(assert start!96116)

(declare-fun b_free!22769 () Bool)

(declare-fun b_next!22769 () Bool)

(assert (=> start!96116 (= b_free!22769 (not b_next!22769))))

(declare-fun tp!80156 () Bool)

(declare-fun b_and!36213 () Bool)

(assert (=> start!96116 (= tp!80156 b_and!36213)))

(declare-fun b!1090667 () Bool)

(declare-fun e!622921 () Bool)

(declare-fun e!622922 () Bool)

(assert (=> b!1090667 (= e!622921 e!622922)))

(declare-fun res!727626 () Bool)

(assert (=> b!1090667 (=> (not res!727626) (not e!622922))))

(declare-datatypes ((array!70463 0))(
  ( (array!70464 (arr!33905 (Array (_ BitVec 32) (_ BitVec 64))) (size!34441 (_ BitVec 32))) )
))
(declare-fun lt!486746 () array!70463)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70463 (_ BitVec 32)) Bool)

(assert (=> b!1090667 (= res!727626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486746 mask!1414))))

(declare-fun _keys!1070 () array!70463)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090667 (= lt!486746 (array!70464 (store (arr!33905 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34441 _keys!1070)))))

(declare-fun b!1090668 () Bool)

(declare-fun e!622915 () Bool)

(assert (=> b!1090668 (= e!622922 (not e!622915))))

(declare-fun res!727627 () Bool)

(assert (=> b!1090668 (=> res!727627 e!622915)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090668 (= res!727627 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40821 0))(
  ( (V!40822 (val!13442 Int)) )
))
(declare-fun minValue!831 () V!40821)

(declare-fun zeroValue!831 () V!40821)

(declare-datatypes ((ValueCell!12676 0))(
  ( (ValueCellFull!12676 (v!16063 V!40821)) (EmptyCell!12676) )
))
(declare-datatypes ((array!70465 0))(
  ( (array!70466 (arr!33906 (Array (_ BitVec 32) ValueCell!12676)) (size!34442 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70465)

(declare-datatypes ((tuple2!17088 0))(
  ( (tuple2!17089 (_1!8555 (_ BitVec 64)) (_2!8555 V!40821)) )
))
(declare-datatypes ((List!23675 0))(
  ( (Nil!23672) (Cons!23671 (h!24880 tuple2!17088) (t!33502 List!23675)) )
))
(declare-datatypes ((ListLongMap!15057 0))(
  ( (ListLongMap!15058 (toList!7544 List!23675)) )
))
(declare-fun lt!486745 () ListLongMap!15057)

(declare-fun getCurrentListMap!4309 (array!70463 array!70465 (_ BitVec 32) (_ BitVec 32) V!40821 V!40821 (_ BitVec 32) Int) ListLongMap!15057)

(assert (=> b!1090668 (= lt!486745 (getCurrentListMap!4309 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486748 () ListLongMap!15057)

(declare-fun lt!486737 () array!70465)

(assert (=> b!1090668 (= lt!486748 (getCurrentListMap!4309 lt!486746 lt!486737 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486741 () ListLongMap!15057)

(declare-fun lt!486738 () ListLongMap!15057)

(assert (=> b!1090668 (and (= lt!486741 lt!486738) (= lt!486738 lt!486741))))

(declare-fun lt!486736 () ListLongMap!15057)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!867 (ListLongMap!15057 (_ BitVec 64)) ListLongMap!15057)

(assert (=> b!1090668 (= lt!486738 (-!867 lt!486736 k!904))))

(declare-datatypes ((Unit!35900 0))(
  ( (Unit!35901) )
))
(declare-fun lt!486743 () Unit!35900)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!128 (array!70463 array!70465 (_ BitVec 32) (_ BitVec 32) V!40821 V!40821 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35900)

(assert (=> b!1090668 (= lt!486743 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!128 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4069 (array!70463 array!70465 (_ BitVec 32) (_ BitVec 32) V!40821 V!40821 (_ BitVec 32) Int) ListLongMap!15057)

(assert (=> b!1090668 (= lt!486741 (getCurrentListMapNoExtraKeys!4069 lt!486746 lt!486737 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2206 (Int (_ BitVec 64)) V!40821)

(assert (=> b!1090668 (= lt!486737 (array!70466 (store (arr!33906 _values!874) i!650 (ValueCellFull!12676 (dynLambda!2206 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34442 _values!874)))))

(assert (=> b!1090668 (= lt!486736 (getCurrentListMapNoExtraKeys!4069 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090668 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!486747 () Unit!35900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70463 (_ BitVec 64) (_ BitVec 32)) Unit!35900)

(assert (=> b!1090668 (= lt!486747 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1090669 () Bool)

(declare-fun res!727625 () Bool)

(assert (=> b!1090669 (=> (not res!727625) (not e!622921))))

(assert (=> b!1090669 (= res!727625 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34441 _keys!1070))))))

(declare-fun mapNonEmpty!41911 () Bool)

(declare-fun mapRes!41911 () Bool)

(declare-fun tp!80155 () Bool)

(declare-fun e!622917 () Bool)

(assert (=> mapNonEmpty!41911 (= mapRes!41911 (and tp!80155 e!622917))))

(declare-fun mapRest!41911 () (Array (_ BitVec 32) ValueCell!12676))

(declare-fun mapKey!41911 () (_ BitVec 32))

(declare-fun mapValue!41911 () ValueCell!12676)

(assert (=> mapNonEmpty!41911 (= (arr!33906 _values!874) (store mapRest!41911 mapKey!41911 mapValue!41911))))

(declare-fun mapIsEmpty!41911 () Bool)

(assert (=> mapIsEmpty!41911 mapRes!41911))

(declare-fun b!1090671 () Bool)

(declare-fun res!727624 () Bool)

(assert (=> b!1090671 (=> (not res!727624) (not e!622921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090671 (= res!727624 (validKeyInArray!0 k!904))))

(declare-fun b!1090672 () Bool)

(declare-fun res!727630 () Bool)

(assert (=> b!1090672 (=> (not res!727630) (not e!622921))))

(assert (=> b!1090672 (= res!727630 (= (select (arr!33905 _keys!1070) i!650) k!904))))

(declare-fun b!1090673 () Bool)

(declare-fun e!622920 () Bool)

(assert (=> b!1090673 (= e!622915 e!622920)))

(declare-fun res!727622 () Bool)

(assert (=> b!1090673 (=> res!727622 e!622920)))

(assert (=> b!1090673 (= res!727622 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!486740 () ListLongMap!15057)

(assert (=> b!1090673 (= lt!486745 lt!486740)))

(declare-fun lt!486739 () tuple2!17088)

(declare-fun +!3332 (ListLongMap!15057 tuple2!17088) ListLongMap!15057)

(assert (=> b!1090673 (= lt!486740 (+!3332 lt!486736 lt!486739))))

(declare-fun lt!486742 () ListLongMap!15057)

(assert (=> b!1090673 (= lt!486748 lt!486742)))

(assert (=> b!1090673 (= lt!486742 (+!3332 lt!486738 lt!486739))))

(assert (=> b!1090673 (= lt!486748 (+!3332 lt!486741 lt!486739))))

(assert (=> b!1090673 (= lt!486739 (tuple2!17089 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090674 () Bool)

(declare-fun res!727628 () Bool)

(assert (=> b!1090674 (=> (not res!727628) (not e!622921))))

(declare-datatypes ((List!23676 0))(
  ( (Nil!23673) (Cons!23672 (h!24881 (_ BitVec 64)) (t!33503 List!23676)) )
))
(declare-fun arrayNoDuplicates!0 (array!70463 (_ BitVec 32) List!23676) Bool)

(assert (=> b!1090674 (= res!727628 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23673))))

(declare-fun b!1090675 () Bool)

(declare-fun res!727632 () Bool)

(assert (=> b!1090675 (=> (not res!727632) (not e!622921))))

(assert (=> b!1090675 (= res!727632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090676 () Bool)

(assert (=> b!1090676 (= e!622920 true)))

(assert (=> b!1090676 (= (-!867 lt!486740 k!904) lt!486742)))

(declare-fun lt!486744 () Unit!35900)

(declare-fun addRemoveCommutativeForDiffKeys!91 (ListLongMap!15057 (_ BitVec 64) V!40821 (_ BitVec 64)) Unit!35900)

(assert (=> b!1090676 (= lt!486744 (addRemoveCommutativeForDiffKeys!91 lt!486736 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1090677 () Bool)

(declare-fun res!727629 () Bool)

(assert (=> b!1090677 (=> (not res!727629) (not e!622922))))

(assert (=> b!1090677 (= res!727629 (arrayNoDuplicates!0 lt!486746 #b00000000000000000000000000000000 Nil!23673))))

(declare-fun b!1090678 () Bool)

(declare-fun e!622919 () Bool)

(declare-fun tp_is_empty!26771 () Bool)

(assert (=> b!1090678 (= e!622919 tp_is_empty!26771)))

(declare-fun res!727623 () Bool)

(assert (=> start!96116 (=> (not res!727623) (not e!622921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96116 (= res!727623 (validMask!0 mask!1414))))

(assert (=> start!96116 e!622921))

(assert (=> start!96116 tp!80156))

(assert (=> start!96116 true))

(assert (=> start!96116 tp_is_empty!26771))

(declare-fun array_inv!26144 (array!70463) Bool)

(assert (=> start!96116 (array_inv!26144 _keys!1070)))

(declare-fun e!622918 () Bool)

(declare-fun array_inv!26145 (array!70465) Bool)

(assert (=> start!96116 (and (array_inv!26145 _values!874) e!622918)))

(declare-fun b!1090670 () Bool)

(declare-fun res!727631 () Bool)

(assert (=> b!1090670 (=> (not res!727631) (not e!622921))))

(assert (=> b!1090670 (= res!727631 (and (= (size!34442 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34441 _keys!1070) (size!34442 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090679 () Bool)

(assert (=> b!1090679 (= e!622917 tp_is_empty!26771)))

(declare-fun b!1090680 () Bool)

(assert (=> b!1090680 (= e!622918 (and e!622919 mapRes!41911))))

(declare-fun condMapEmpty!41911 () Bool)

(declare-fun mapDefault!41911 () ValueCell!12676)

