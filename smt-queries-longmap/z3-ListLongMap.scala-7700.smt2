; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96706 () Bool)

(assert start!96706)

(declare-fun b_free!23127 () Bool)

(declare-fun b_next!23127 () Bool)

(assert (=> start!96706 (= b_free!23127 (not b_next!23127))))

(declare-fun tp!81326 () Bool)

(declare-fun b_and!37001 () Bool)

(assert (=> start!96706 (= tp!81326 b_and!37001)))

(declare-fun b!1099864 () Bool)

(declare-fun res!733945 () Bool)

(declare-fun e!627773 () Bool)

(assert (=> b!1099864 (=> (not res!733945) (not e!627773))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71271 0))(
  ( (array!71272 (arr!34301 (Array (_ BitVec 32) (_ BitVec 64))) (size!34837 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71271)

(declare-datatypes ((V!41363 0))(
  ( (V!41364 (val!13645 Int)) )
))
(declare-datatypes ((ValueCell!12879 0))(
  ( (ValueCellFull!12879 (v!16272 V!41363)) (EmptyCell!12879) )
))
(declare-datatypes ((array!71273 0))(
  ( (array!71274 (arr!34302 (Array (_ BitVec 32) ValueCell!12879)) (size!34838 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71273)

(assert (=> b!1099864 (= res!733945 (and (= (size!34838 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34837 _keys!1070) (size!34838 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1099865 () Bool)

(declare-fun e!627774 () Bool)

(declare-fun e!627772 () Bool)

(declare-fun mapRes!42544 () Bool)

(assert (=> b!1099865 (= e!627774 (and e!627772 mapRes!42544))))

(declare-fun condMapEmpty!42544 () Bool)

(declare-fun mapDefault!42544 () ValueCell!12879)

(assert (=> b!1099865 (= condMapEmpty!42544 (= (arr!34302 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12879)) mapDefault!42544)))))

(declare-fun res!733947 () Bool)

(assert (=> start!96706 (=> (not res!733947) (not e!627773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96706 (= res!733947 (validMask!0 mask!1414))))

(assert (=> start!96706 e!627773))

(assert (=> start!96706 tp!81326))

(assert (=> start!96706 true))

(declare-fun tp_is_empty!27177 () Bool)

(assert (=> start!96706 tp_is_empty!27177))

(declare-fun array_inv!26422 (array!71271) Bool)

(assert (=> start!96706 (array_inv!26422 _keys!1070)))

(declare-fun array_inv!26423 (array!71273) Bool)

(assert (=> start!96706 (and (array_inv!26423 _values!874) e!627774)))

(declare-datatypes ((tuple2!17342 0))(
  ( (tuple2!17343 (_1!8682 (_ BitVec 64)) (_2!8682 V!41363)) )
))
(declare-datatypes ((List!23960 0))(
  ( (Nil!23957) (Cons!23956 (h!25165 tuple2!17342) (t!34133 List!23960)) )
))
(declare-datatypes ((ListLongMap!15311 0))(
  ( (ListLongMap!15312 (toList!7671 List!23960)) )
))
(declare-fun lt!492614 () ListLongMap!15311)

(declare-fun lt!492621 () tuple2!17342)

(declare-fun lt!492616 () ListLongMap!15311)

(declare-fun b!1099866 () Bool)

(declare-fun e!627775 () Bool)

(declare-fun +!3378 (ListLongMap!15311 tuple2!17342) ListLongMap!15311)

(assert (=> b!1099866 (= e!627775 (= lt!492616 (+!3378 lt!492614 lt!492621)))))

(declare-fun b!1099867 () Bool)

(declare-fun res!733941 () Bool)

(assert (=> b!1099867 (=> (not res!733941) (not e!627773))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099867 (= res!733941 (validKeyInArray!0 k0!904))))

(declare-fun b!1099868 () Bool)

(declare-fun e!627768 () Bool)

(assert (=> b!1099868 (= e!627768 tp_is_empty!27177)))

(declare-fun mapIsEmpty!42544 () Bool)

(assert (=> mapIsEmpty!42544 mapRes!42544))

(declare-fun b!1099869 () Bool)

(declare-fun res!733942 () Bool)

(assert (=> b!1099869 (=> (not res!733942) (not e!627773))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1099869 (= res!733942 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34837 _keys!1070))))))

(declare-fun b!1099870 () Bool)

(declare-fun res!733939 () Bool)

(declare-fun e!627769 () Bool)

(assert (=> b!1099870 (=> (not res!733939) (not e!627769))))

(declare-fun lt!492622 () array!71271)

(declare-datatypes ((List!23961 0))(
  ( (Nil!23958) (Cons!23957 (h!25166 (_ BitVec 64)) (t!34134 List!23961)) )
))
(declare-fun arrayNoDuplicates!0 (array!71271 (_ BitVec 32) List!23961) Bool)

(assert (=> b!1099870 (= res!733939 (arrayNoDuplicates!0 lt!492622 #b00000000000000000000000000000000 Nil!23958))))

(declare-fun b!1099871 () Bool)

(assert (=> b!1099871 (= e!627773 e!627769)))

(declare-fun res!733940 () Bool)

(assert (=> b!1099871 (=> (not res!733940) (not e!627769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71271 (_ BitVec 32)) Bool)

(assert (=> b!1099871 (= res!733940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492622 mask!1414))))

(assert (=> b!1099871 (= lt!492622 (array!71272 (store (arr!34301 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34837 _keys!1070)))))

(declare-fun b!1099872 () Bool)

(declare-fun res!733938 () Bool)

(assert (=> b!1099872 (=> (not res!733938) (not e!627773))))

(assert (=> b!1099872 (= res!733938 (= (select (arr!34301 _keys!1070) i!650) k0!904))))

(declare-fun lt!492618 () ListLongMap!15311)

(declare-fun lt!492619 () ListLongMap!15311)

(declare-fun e!627771 () Bool)

(declare-fun b!1099873 () Bool)

(assert (=> b!1099873 (= e!627771 (= lt!492619 (+!3378 lt!492618 lt!492621)))))

(assert (=> b!1099873 e!627775))

(declare-fun res!733944 () Bool)

(assert (=> b!1099873 (=> (not res!733944) (not e!627775))))

(declare-fun lt!492617 () ListLongMap!15311)

(assert (=> b!1099873 (= res!733944 (= lt!492619 (+!3378 lt!492617 lt!492621)))))

(declare-fun zeroValue!831 () V!41363)

(assert (=> b!1099873 (= lt!492621 (tuple2!17343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099874 () Bool)

(declare-fun res!733946 () Bool)

(assert (=> b!1099874 (=> (not res!733946) (not e!627773))))

(assert (=> b!1099874 (= res!733946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42544 () Bool)

(declare-fun tp!81325 () Bool)

(assert (=> mapNonEmpty!42544 (= mapRes!42544 (and tp!81325 e!627768))))

(declare-fun mapKey!42544 () (_ BitVec 32))

(declare-fun mapValue!42544 () ValueCell!12879)

(declare-fun mapRest!42544 () (Array (_ BitVec 32) ValueCell!12879))

(assert (=> mapNonEmpty!42544 (= (arr!34302 _values!874) (store mapRest!42544 mapKey!42544 mapValue!42544))))

(declare-fun b!1099875 () Bool)

(declare-fun res!733948 () Bool)

(assert (=> b!1099875 (=> (not res!733948) (not e!627773))))

(assert (=> b!1099875 (= res!733948 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23958))))

(declare-fun b!1099876 () Bool)

(assert (=> b!1099876 (= e!627772 tp_is_empty!27177)))

(declare-fun b!1099877 () Bool)

(assert (=> b!1099877 (= e!627769 (not e!627771))))

(declare-fun res!733943 () Bool)

(assert (=> b!1099877 (=> res!733943 e!627771)))

(assert (=> b!1099877 (= res!733943 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41363)

(declare-fun getCurrentListMap!4384 (array!71271 array!71273 (_ BitVec 32) (_ BitVec 32) V!41363 V!41363 (_ BitVec 32) Int) ListLongMap!15311)

(assert (=> b!1099877 (= lt!492616 (getCurrentListMap!4384 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492620 () array!71273)

(assert (=> b!1099877 (= lt!492619 (getCurrentListMap!4384 lt!492622 lt!492620 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1099877 (and (= lt!492617 lt!492618) (= lt!492618 lt!492617))))

(declare-fun -!959 (ListLongMap!15311 (_ BitVec 64)) ListLongMap!15311)

(assert (=> b!1099877 (= lt!492618 (-!959 lt!492614 k0!904))))

(declare-datatypes ((Unit!36162 0))(
  ( (Unit!36163) )
))
(declare-fun lt!492615 () Unit!36162)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!210 (array!71271 array!71273 (_ BitVec 32) (_ BitVec 32) V!41363 V!41363 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36162)

(assert (=> b!1099877 (= lt!492615 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!210 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4180 (array!71271 array!71273 (_ BitVec 32) (_ BitVec 32) V!41363 V!41363 (_ BitVec 32) Int) ListLongMap!15311)

(assert (=> b!1099877 (= lt!492617 (getCurrentListMapNoExtraKeys!4180 lt!492622 lt!492620 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2315 (Int (_ BitVec 64)) V!41363)

(assert (=> b!1099877 (= lt!492620 (array!71274 (store (arr!34302 _values!874) i!650 (ValueCellFull!12879 (dynLambda!2315 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34838 _values!874)))))

(assert (=> b!1099877 (= lt!492614 (getCurrentListMapNoExtraKeys!4180 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099877 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492623 () Unit!36162)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71271 (_ BitVec 64) (_ BitVec 32)) Unit!36162)

(assert (=> b!1099877 (= lt!492623 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!96706 res!733947) b!1099864))

(assert (= (and b!1099864 res!733945) b!1099874))

(assert (= (and b!1099874 res!733946) b!1099875))

(assert (= (and b!1099875 res!733948) b!1099869))

(assert (= (and b!1099869 res!733942) b!1099867))

(assert (= (and b!1099867 res!733941) b!1099872))

(assert (= (and b!1099872 res!733938) b!1099871))

(assert (= (and b!1099871 res!733940) b!1099870))

(assert (= (and b!1099870 res!733939) b!1099877))

(assert (= (and b!1099877 (not res!733943)) b!1099873))

(assert (= (and b!1099873 res!733944) b!1099866))

(assert (= (and b!1099865 condMapEmpty!42544) mapIsEmpty!42544))

(assert (= (and b!1099865 (not condMapEmpty!42544)) mapNonEmpty!42544))

(get-info :version)

(assert (= (and mapNonEmpty!42544 ((_ is ValueCellFull!12879) mapValue!42544)) b!1099868))

(assert (= (and b!1099865 ((_ is ValueCellFull!12879) mapDefault!42544)) b!1099876))

(assert (= start!96706 b!1099865))

(declare-fun b_lambda!17965 () Bool)

(assert (=> (not b_lambda!17965) (not b!1099877)))

(declare-fun t!34132 () Bool)

(declare-fun tb!7993 () Bool)

(assert (=> (and start!96706 (= defaultEntry!882 defaultEntry!882) t!34132) tb!7993))

(declare-fun result!16521 () Bool)

(assert (=> tb!7993 (= result!16521 tp_is_empty!27177)))

(assert (=> b!1099877 t!34132))

(declare-fun b_and!37003 () Bool)

(assert (= b_and!37001 (and (=> t!34132 result!16521) b_and!37003)))

(declare-fun m!1019873 () Bool)

(assert (=> b!1099871 m!1019873))

(declare-fun m!1019875 () Bool)

(assert (=> b!1099871 m!1019875))

(declare-fun m!1019877 () Bool)

(assert (=> b!1099867 m!1019877))

(declare-fun m!1019879 () Bool)

(assert (=> b!1099872 m!1019879))

(declare-fun m!1019881 () Bool)

(assert (=> b!1099870 m!1019881))

(declare-fun m!1019883 () Bool)

(assert (=> b!1099873 m!1019883))

(declare-fun m!1019885 () Bool)

(assert (=> b!1099873 m!1019885))

(declare-fun m!1019887 () Bool)

(assert (=> b!1099875 m!1019887))

(declare-fun m!1019889 () Bool)

(assert (=> b!1099874 m!1019889))

(declare-fun m!1019891 () Bool)

(assert (=> start!96706 m!1019891))

(declare-fun m!1019893 () Bool)

(assert (=> start!96706 m!1019893))

(declare-fun m!1019895 () Bool)

(assert (=> start!96706 m!1019895))

(declare-fun m!1019897 () Bool)

(assert (=> mapNonEmpty!42544 m!1019897))

(declare-fun m!1019899 () Bool)

(assert (=> b!1099866 m!1019899))

(declare-fun m!1019901 () Bool)

(assert (=> b!1099877 m!1019901))

(declare-fun m!1019903 () Bool)

(assert (=> b!1099877 m!1019903))

(declare-fun m!1019905 () Bool)

(assert (=> b!1099877 m!1019905))

(declare-fun m!1019907 () Bool)

(assert (=> b!1099877 m!1019907))

(declare-fun m!1019909 () Bool)

(assert (=> b!1099877 m!1019909))

(declare-fun m!1019911 () Bool)

(assert (=> b!1099877 m!1019911))

(declare-fun m!1019913 () Bool)

(assert (=> b!1099877 m!1019913))

(declare-fun m!1019915 () Bool)

(assert (=> b!1099877 m!1019915))

(declare-fun m!1019917 () Bool)

(assert (=> b!1099877 m!1019917))

(declare-fun m!1019919 () Bool)

(assert (=> b!1099877 m!1019919))

(check-sat tp_is_empty!27177 (not b_next!23127) (not start!96706) (not b!1099871) (not b!1099875) (not mapNonEmpty!42544) (not b!1099873) (not b!1099870) b_and!37003 (not b!1099874) (not b!1099877) (not b!1099866) (not b_lambda!17965) (not b!1099867))
(check-sat b_and!37003 (not b_next!23127))
