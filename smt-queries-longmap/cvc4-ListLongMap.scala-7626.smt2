; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96080 () Bool)

(assert start!96080)

(declare-fun b_free!22733 () Bool)

(declare-fun b_next!22733 () Bool)

(assert (=> start!96080 (= b_free!22733 (not b_next!22733))))

(declare-fun tp!80048 () Bool)

(declare-fun b_and!36141 () Bool)

(assert (=> start!96080 (= tp!80048 b_and!36141)))

(declare-fun b!1089874 () Bool)

(declare-fun res!727034 () Bool)

(declare-fun e!622490 () Bool)

(assert (=> b!1089874 (=> (not res!727034) (not e!622490))))

(declare-datatypes ((array!70393 0))(
  ( (array!70394 (arr!33870 (Array (_ BitVec 32) (_ BitVec 64))) (size!34406 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70393)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089874 (= res!727034 (= (select (arr!33870 _keys!1070) i!650) k!904))))

(declare-fun b!1089875 () Bool)

(declare-fun res!727028 () Bool)

(assert (=> b!1089875 (=> (not res!727028) (not e!622490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089875 (= res!727028 (validKeyInArray!0 k!904))))

(declare-fun b!1089876 () Bool)

(declare-fun res!727029 () Bool)

(declare-fun e!622485 () Bool)

(assert (=> b!1089876 (=> (not res!727029) (not e!622485))))

(declare-datatypes ((V!40773 0))(
  ( (V!40774 (val!13424 Int)) )
))
(declare-datatypes ((tuple2!17056 0))(
  ( (tuple2!17057 (_1!8539 (_ BitVec 64)) (_2!8539 V!40773)) )
))
(declare-fun lt!486046 () tuple2!17056)

(declare-datatypes ((List!23645 0))(
  ( (Nil!23642) (Cons!23641 (h!24850 tuple2!17056) (t!33436 List!23645)) )
))
(declare-datatypes ((ListLongMap!15025 0))(
  ( (ListLongMap!15026 (toList!7528 List!23645)) )
))
(declare-fun lt!486039 () ListLongMap!15025)

(declare-fun lt!486044 () ListLongMap!15025)

(declare-fun +!3319 (ListLongMap!15025 tuple2!17056) ListLongMap!15025)

(assert (=> b!1089876 (= res!727029 (= lt!486044 (+!3319 lt!486039 lt!486046)))))

(declare-fun b!1089877 () Bool)

(declare-fun res!727038 () Bool)

(assert (=> b!1089877 (=> (not res!727038) (not e!622490))))

(declare-datatypes ((List!23646 0))(
  ( (Nil!23643) (Cons!23642 (h!24851 (_ BitVec 64)) (t!33437 List!23646)) )
))
(declare-fun arrayNoDuplicates!0 (array!70393 (_ BitVec 32) List!23646) Bool)

(assert (=> b!1089877 (= res!727038 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23643))))

(declare-fun b!1089878 () Bool)

(declare-fun e!622484 () Bool)

(assert (=> b!1089878 (= e!622490 e!622484)))

(declare-fun res!727027 () Bool)

(assert (=> b!1089878 (=> (not res!727027) (not e!622484))))

(declare-fun lt!486041 () array!70393)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70393 (_ BitVec 32)) Bool)

(assert (=> b!1089878 (= res!727027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486041 mask!1414))))

(assert (=> b!1089878 (= lt!486041 (array!70394 (store (arr!33870 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34406 _keys!1070)))))

(declare-fun mapIsEmpty!41857 () Bool)

(declare-fun mapRes!41857 () Bool)

(assert (=> mapIsEmpty!41857 mapRes!41857))

(declare-fun b!1089879 () Bool)

(declare-fun res!727036 () Bool)

(assert (=> b!1089879 (=> (not res!727036) (not e!622484))))

(assert (=> b!1089879 (= res!727036 (arrayNoDuplicates!0 lt!486041 #b00000000000000000000000000000000 Nil!23643))))

(declare-fun mapNonEmpty!41857 () Bool)

(declare-fun tp!80047 () Bool)

(declare-fun e!622489 () Bool)

(assert (=> mapNonEmpty!41857 (= mapRes!41857 (and tp!80047 e!622489))))

(declare-datatypes ((ValueCell!12658 0))(
  ( (ValueCellFull!12658 (v!16045 V!40773)) (EmptyCell!12658) )
))
(declare-datatypes ((array!70395 0))(
  ( (array!70396 (arr!33871 (Array (_ BitVec 32) ValueCell!12658)) (size!34407 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70395)

(declare-fun mapValue!41857 () ValueCell!12658)

(declare-fun mapKey!41857 () (_ BitVec 32))

(declare-fun mapRest!41857 () (Array (_ BitVec 32) ValueCell!12658))

(assert (=> mapNonEmpty!41857 (= (arr!33871 _values!874) (store mapRest!41857 mapKey!41857 mapValue!41857))))

(declare-fun res!727030 () Bool)

(assert (=> start!96080 (=> (not res!727030) (not e!622490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96080 (= res!727030 (validMask!0 mask!1414))))

(assert (=> start!96080 e!622490))

(assert (=> start!96080 tp!80048))

(assert (=> start!96080 true))

(declare-fun tp_is_empty!26735 () Bool)

(assert (=> start!96080 tp_is_empty!26735))

(declare-fun array_inv!26118 (array!70393) Bool)

(assert (=> start!96080 (array_inv!26118 _keys!1070)))

(declare-fun e!622488 () Bool)

(declare-fun array_inv!26119 (array!70395) Bool)

(assert (=> start!96080 (and (array_inv!26119 _values!874) e!622488)))

(declare-fun b!1089880 () Bool)

(declare-fun e!622487 () Bool)

(assert (=> b!1089880 (= e!622484 (not e!622487))))

(declare-fun res!727033 () Bool)

(assert (=> b!1089880 (=> res!727033 e!622487)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089880 (= res!727033 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40773)

(declare-fun lt!486042 () ListLongMap!15025)

(declare-fun zeroValue!831 () V!40773)

(declare-fun getCurrentListMap!4297 (array!70393 array!70395 (_ BitVec 32) (_ BitVec 32) V!40773 V!40773 (_ BitVec 32) Int) ListLongMap!15025)

(assert (=> b!1089880 (= lt!486042 (getCurrentListMap!4297 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486040 () array!70395)

(assert (=> b!1089880 (= lt!486044 (getCurrentListMap!4297 lt!486041 lt!486040 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486037 () ListLongMap!15025)

(assert (=> b!1089880 (and (= lt!486037 lt!486039) (= lt!486039 lt!486037))))

(declare-fun lt!486043 () ListLongMap!15025)

(declare-fun -!853 (ListLongMap!15025 (_ BitVec 64)) ListLongMap!15025)

(assert (=> b!1089880 (= lt!486039 (-!853 lt!486043 k!904))))

(declare-datatypes ((Unit!35872 0))(
  ( (Unit!35873) )
))
(declare-fun lt!486038 () Unit!35872)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!116 (array!70393 array!70395 (_ BitVec 32) (_ BitVec 32) V!40773 V!40773 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35872)

(assert (=> b!1089880 (= lt!486038 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!116 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4057 (array!70393 array!70395 (_ BitVec 32) (_ BitVec 32) V!40773 V!40773 (_ BitVec 32) Int) ListLongMap!15025)

(assert (=> b!1089880 (= lt!486037 (getCurrentListMapNoExtraKeys!4057 lt!486041 lt!486040 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2194 (Int (_ BitVec 64)) V!40773)

(assert (=> b!1089880 (= lt!486040 (array!70396 (store (arr!33871 _values!874) i!650 (ValueCellFull!12658 (dynLambda!2194 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34407 _values!874)))))

(assert (=> b!1089880 (= lt!486043 (getCurrentListMapNoExtraKeys!4057 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089880 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!486045 () Unit!35872)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70393 (_ BitVec 64) (_ BitVec 32)) Unit!35872)

(assert (=> b!1089880 (= lt!486045 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1089881 () Bool)

(declare-fun res!727037 () Bool)

(assert (=> b!1089881 (=> (not res!727037) (not e!622490))))

(assert (=> b!1089881 (= res!727037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089882 () Bool)

(declare-fun e!622486 () Bool)

(assert (=> b!1089882 (= e!622486 tp_is_empty!26735)))

(declare-fun b!1089883 () Bool)

(assert (=> b!1089883 (= e!622487 true)))

(assert (=> b!1089883 e!622485))

(declare-fun res!727031 () Bool)

(assert (=> b!1089883 (=> (not res!727031) (not e!622485))))

(assert (=> b!1089883 (= res!727031 (= lt!486044 (+!3319 lt!486037 lt!486046)))))

(assert (=> b!1089883 (= lt!486046 (tuple2!17057 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1089884 () Bool)

(declare-fun res!727032 () Bool)

(assert (=> b!1089884 (=> (not res!727032) (not e!622490))))

(assert (=> b!1089884 (= res!727032 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34406 _keys!1070))))))

(declare-fun b!1089885 () Bool)

(declare-fun res!727035 () Bool)

(assert (=> b!1089885 (=> (not res!727035) (not e!622490))))

(assert (=> b!1089885 (= res!727035 (and (= (size!34407 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34406 _keys!1070) (size!34407 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089886 () Bool)

(assert (=> b!1089886 (= e!622489 tp_is_empty!26735)))

(declare-fun b!1089887 () Bool)

(assert (=> b!1089887 (= e!622485 (= lt!486042 (+!3319 lt!486043 lt!486046)))))

(declare-fun b!1089888 () Bool)

(assert (=> b!1089888 (= e!622488 (and e!622486 mapRes!41857))))

(declare-fun condMapEmpty!41857 () Bool)

(declare-fun mapDefault!41857 () ValueCell!12658)

