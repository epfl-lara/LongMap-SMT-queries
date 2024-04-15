; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95938 () Bool)

(assert start!95938)

(declare-fun b_free!22597 () Bool)

(declare-fun b_next!22597 () Bool)

(assert (=> start!95938 (= b_free!22597 (not b_next!22597))))

(declare-fun tp!79640 () Bool)

(declare-fun b_and!35843 () Bool)

(assert (=> start!95938 (= tp!79640 b_and!35843)))

(declare-fun b!1086712 () Bool)

(declare-fun e!620758 () Bool)

(declare-fun e!620761 () Bool)

(assert (=> b!1086712 (= e!620758 e!620761)))

(declare-fun res!724699 () Bool)

(assert (=> b!1086712 (=> res!724699 e!620761)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1086712 (= res!724699 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40593 0))(
  ( (V!40594 (val!13356 Int)) )
))
(declare-datatypes ((tuple2!17000 0))(
  ( (tuple2!17001 (_1!8511 (_ BitVec 64)) (_2!8511 V!40593)) )
))
(declare-datatypes ((List!23569 0))(
  ( (Nil!23566) (Cons!23565 (h!24774 tuple2!17000) (t!33215 List!23569)) )
))
(declare-datatypes ((ListLongMap!14969 0))(
  ( (ListLongMap!14970 (toList!7500 List!23569)) )
))
(declare-fun lt!483152 () ListLongMap!14969)

(declare-fun lt!483139 () ListLongMap!14969)

(assert (=> b!1086712 (= lt!483152 lt!483139)))

(declare-fun lt!483145 () ListLongMap!14969)

(declare-fun -!779 (ListLongMap!14969 (_ BitVec 64)) ListLongMap!14969)

(assert (=> b!1086712 (= lt!483152 (-!779 lt!483145 k0!904))))

(declare-datatypes ((Unit!35593 0))(
  ( (Unit!35594) )
))
(declare-fun lt!483138 () Unit!35593)

(declare-fun zeroValue!831 () V!40593)

(declare-fun lt!483149 () ListLongMap!14969)

(declare-fun addRemoveCommutativeForDiffKeys!36 (ListLongMap!14969 (_ BitVec 64) V!40593 (_ BitVec 64)) Unit!35593)

(assert (=> b!1086712 (= lt!483138 (addRemoveCommutativeForDiffKeys!36 lt!483149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!483144 () ListLongMap!14969)

(declare-fun lt!483150 () tuple2!17000)

(declare-fun +!3307 (ListLongMap!14969 tuple2!17000) ListLongMap!14969)

(assert (=> b!1086712 (= lt!483144 (+!3307 lt!483139 lt!483150))))

(declare-fun lt!483146 () ListLongMap!14969)

(declare-fun lt!483137 () tuple2!17000)

(assert (=> b!1086712 (= lt!483139 (+!3307 lt!483146 lt!483137))))

(declare-fun lt!483140 () ListLongMap!14969)

(declare-fun lt!483142 () ListLongMap!14969)

(assert (=> b!1086712 (= lt!483140 lt!483142)))

(assert (=> b!1086712 (= lt!483142 (+!3307 lt!483145 lt!483150))))

(assert (=> b!1086712 (= lt!483145 (+!3307 lt!483149 lt!483137))))

(declare-fun lt!483148 () ListLongMap!14969)

(assert (=> b!1086712 (= lt!483144 (+!3307 (+!3307 lt!483148 lt!483137) lt!483150))))

(declare-fun minValue!831 () V!40593)

(assert (=> b!1086712 (= lt!483150 (tuple2!17001 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086712 (= lt!483137 (tuple2!17001 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086713 () Bool)

(declare-fun res!724700 () Bool)

(declare-fun e!620759 () Bool)

(assert (=> b!1086713 (=> (not res!724700) (not e!620759))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70050 0))(
  ( (array!70051 (arr!33699 (Array (_ BitVec 32) (_ BitVec 64))) (size!34237 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70050)

(assert (=> b!1086713 (= res!724700 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34237 _keys!1070))))))

(declare-fun b!1086714 () Bool)

(assert (=> b!1086714 (= e!620761 true)))

(assert (=> b!1086714 (= (-!779 lt!483142 k0!904) (+!3307 lt!483152 lt!483150))))

(declare-fun lt!483136 () Unit!35593)

(assert (=> b!1086714 (= lt!483136 (addRemoveCommutativeForDiffKeys!36 lt!483145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086715 () Bool)

(declare-fun e!620763 () Bool)

(declare-fun tp_is_empty!26599 () Bool)

(assert (=> b!1086715 (= e!620763 tp_is_empty!26599)))

(declare-fun mapIsEmpty!41653 () Bool)

(declare-fun mapRes!41653 () Bool)

(assert (=> mapIsEmpty!41653 mapRes!41653))

(declare-fun b!1086716 () Bool)

(declare-fun res!724707 () Bool)

(declare-fun e!620765 () Bool)

(assert (=> b!1086716 (=> (not res!724707) (not e!620765))))

(declare-fun lt!483143 () array!70050)

(declare-datatypes ((List!23570 0))(
  ( (Nil!23567) (Cons!23566 (h!24775 (_ BitVec 64)) (t!33216 List!23570)) )
))
(declare-fun arrayNoDuplicates!0 (array!70050 (_ BitVec 32) List!23570) Bool)

(assert (=> b!1086716 (= res!724707 (arrayNoDuplicates!0 lt!483143 #b00000000000000000000000000000000 Nil!23567))))

(declare-fun b!1086717 () Bool)

(declare-fun res!724705 () Bool)

(assert (=> b!1086717 (=> (not res!724705) (not e!620759))))

(assert (=> b!1086717 (= res!724705 (= (select (arr!33699 _keys!1070) i!650) k0!904))))

(declare-fun b!1086718 () Bool)

(declare-fun res!724697 () Bool)

(assert (=> b!1086718 (=> (not res!724697) (not e!620759))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70050 (_ BitVec 32)) Bool)

(assert (=> b!1086718 (= res!724697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086719 () Bool)

(declare-fun res!724698 () Bool)

(assert (=> b!1086719 (=> (not res!724698) (not e!620759))))

(assert (=> b!1086719 (= res!724698 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23567))))

(declare-fun b!1086720 () Bool)

(declare-fun res!724706 () Bool)

(assert (=> b!1086720 (=> (not res!724706) (not e!620759))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12590 0))(
  ( (ValueCellFull!12590 (v!15976 V!40593)) (EmptyCell!12590) )
))
(declare-datatypes ((array!70052 0))(
  ( (array!70053 (arr!33700 (Array (_ BitVec 32) ValueCell!12590)) (size!34238 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70052)

(assert (=> b!1086720 (= res!724706 (and (= (size!34238 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34237 _keys!1070) (size!34238 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41653 () Bool)

(declare-fun tp!79639 () Bool)

(assert (=> mapNonEmpty!41653 (= mapRes!41653 (and tp!79639 e!620763))))

(declare-fun mapValue!41653 () ValueCell!12590)

(declare-fun mapRest!41653 () (Array (_ BitVec 32) ValueCell!12590))

(declare-fun mapKey!41653 () (_ BitVec 32))

(assert (=> mapNonEmpty!41653 (= (arr!33700 _values!874) (store mapRest!41653 mapKey!41653 mapValue!41653))))

(declare-fun b!1086722 () Bool)

(declare-fun e!620764 () Bool)

(assert (=> b!1086722 (= e!620764 tp_is_empty!26599)))

(declare-fun b!1086723 () Bool)

(assert (=> b!1086723 (= e!620765 (not e!620758))))

(declare-fun res!724702 () Bool)

(assert (=> b!1086723 (=> res!724702 e!620758)))

(assert (=> b!1086723 (= res!724702 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4184 (array!70050 array!70052 (_ BitVec 32) (_ BitVec 32) V!40593 V!40593 (_ BitVec 32) Int) ListLongMap!14969)

(assert (=> b!1086723 (= lt!483140 (getCurrentListMap!4184 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483141 () array!70052)

(assert (=> b!1086723 (= lt!483144 (getCurrentListMap!4184 lt!483143 lt!483141 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1086723 (and (= lt!483148 lt!483146) (= lt!483146 lt!483148))))

(assert (=> b!1086723 (= lt!483146 (-!779 lt!483149 k0!904))))

(declare-fun lt!483151 () Unit!35593)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!68 (array!70050 array!70052 (_ BitVec 32) (_ BitVec 32) V!40593 V!40593 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35593)

(assert (=> b!1086723 (= lt!483151 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!68 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4054 (array!70050 array!70052 (_ BitVec 32) (_ BitVec 32) V!40593 V!40593 (_ BitVec 32) Int) ListLongMap!14969)

(assert (=> b!1086723 (= lt!483148 (getCurrentListMapNoExtraKeys!4054 lt!483143 lt!483141 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2125 (Int (_ BitVec 64)) V!40593)

(assert (=> b!1086723 (= lt!483141 (array!70053 (store (arr!33700 _values!874) i!650 (ValueCellFull!12590 (dynLambda!2125 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34238 _values!874)))))

(assert (=> b!1086723 (= lt!483149 (getCurrentListMapNoExtraKeys!4054 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086723 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483147 () Unit!35593)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70050 (_ BitVec 64) (_ BitVec 32)) Unit!35593)

(assert (=> b!1086723 (= lt!483147 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086724 () Bool)

(assert (=> b!1086724 (= e!620759 e!620765)))

(declare-fun res!724701 () Bool)

(assert (=> b!1086724 (=> (not res!724701) (not e!620765))))

(assert (=> b!1086724 (= res!724701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483143 mask!1414))))

(assert (=> b!1086724 (= lt!483143 (array!70051 (store (arr!33699 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34237 _keys!1070)))))

(declare-fun b!1086725 () Bool)

(declare-fun e!620762 () Bool)

(assert (=> b!1086725 (= e!620762 (and e!620764 mapRes!41653))))

(declare-fun condMapEmpty!41653 () Bool)

(declare-fun mapDefault!41653 () ValueCell!12590)

(assert (=> b!1086725 (= condMapEmpty!41653 (= (arr!33700 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12590)) mapDefault!41653)))))

(declare-fun b!1086721 () Bool)

(declare-fun res!724703 () Bool)

(assert (=> b!1086721 (=> (not res!724703) (not e!620759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086721 (= res!724703 (validKeyInArray!0 k0!904))))

(declare-fun res!724704 () Bool)

(assert (=> start!95938 (=> (not res!724704) (not e!620759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95938 (= res!724704 (validMask!0 mask!1414))))

(assert (=> start!95938 e!620759))

(assert (=> start!95938 tp!79640))

(assert (=> start!95938 true))

(assert (=> start!95938 tp_is_empty!26599))

(declare-fun array_inv!26044 (array!70050) Bool)

(assert (=> start!95938 (array_inv!26044 _keys!1070)))

(declare-fun array_inv!26045 (array!70052) Bool)

(assert (=> start!95938 (and (array_inv!26045 _values!874) e!620762)))

(assert (= (and start!95938 res!724704) b!1086720))

(assert (= (and b!1086720 res!724706) b!1086718))

(assert (= (and b!1086718 res!724697) b!1086719))

(assert (= (and b!1086719 res!724698) b!1086713))

(assert (= (and b!1086713 res!724700) b!1086721))

(assert (= (and b!1086721 res!724703) b!1086717))

(assert (= (and b!1086717 res!724705) b!1086724))

(assert (= (and b!1086724 res!724701) b!1086716))

(assert (= (and b!1086716 res!724707) b!1086723))

(assert (= (and b!1086723 (not res!724702)) b!1086712))

(assert (= (and b!1086712 (not res!724699)) b!1086714))

(assert (= (and b!1086725 condMapEmpty!41653) mapIsEmpty!41653))

(assert (= (and b!1086725 (not condMapEmpty!41653)) mapNonEmpty!41653))

(get-info :version)

(assert (= (and mapNonEmpty!41653 ((_ is ValueCellFull!12590) mapValue!41653)) b!1086715))

(assert (= (and b!1086725 ((_ is ValueCellFull!12590) mapDefault!41653)) b!1086722))

(assert (= start!95938 b!1086725))

(declare-fun b_lambda!17245 () Bool)

(assert (=> (not b_lambda!17245) (not b!1086723)))

(declare-fun t!33214 () Bool)

(declare-fun tb!7467 () Bool)

(assert (=> (and start!95938 (= defaultEntry!882 defaultEntry!882) t!33214) tb!7467))

(declare-fun result!15461 () Bool)

(assert (=> tb!7467 (= result!15461 tp_is_empty!26599)))

(assert (=> b!1086723 t!33214))

(declare-fun b_and!35845 () Bool)

(assert (= b_and!35843 (and (=> t!33214 result!15461) b_and!35845)))

(declare-fun m!1004933 () Bool)

(assert (=> b!1086721 m!1004933))

(declare-fun m!1004935 () Bool)

(assert (=> start!95938 m!1004935))

(declare-fun m!1004937 () Bool)

(assert (=> start!95938 m!1004937))

(declare-fun m!1004939 () Bool)

(assert (=> start!95938 m!1004939))

(declare-fun m!1004941 () Bool)

(assert (=> b!1086714 m!1004941))

(declare-fun m!1004943 () Bool)

(assert (=> b!1086714 m!1004943))

(declare-fun m!1004945 () Bool)

(assert (=> b!1086714 m!1004945))

(declare-fun m!1004947 () Bool)

(assert (=> b!1086712 m!1004947))

(declare-fun m!1004949 () Bool)

(assert (=> b!1086712 m!1004949))

(declare-fun m!1004951 () Bool)

(assert (=> b!1086712 m!1004951))

(declare-fun m!1004953 () Bool)

(assert (=> b!1086712 m!1004953))

(declare-fun m!1004955 () Bool)

(assert (=> b!1086712 m!1004955))

(declare-fun m!1004957 () Bool)

(assert (=> b!1086712 m!1004957))

(assert (=> b!1086712 m!1004957))

(declare-fun m!1004959 () Bool)

(assert (=> b!1086712 m!1004959))

(declare-fun m!1004961 () Bool)

(assert (=> b!1086712 m!1004961))

(declare-fun m!1004963 () Bool)

(assert (=> b!1086716 m!1004963))

(declare-fun m!1004965 () Bool)

(assert (=> b!1086723 m!1004965))

(declare-fun m!1004967 () Bool)

(assert (=> b!1086723 m!1004967))

(declare-fun m!1004969 () Bool)

(assert (=> b!1086723 m!1004969))

(declare-fun m!1004971 () Bool)

(assert (=> b!1086723 m!1004971))

(declare-fun m!1004973 () Bool)

(assert (=> b!1086723 m!1004973))

(declare-fun m!1004975 () Bool)

(assert (=> b!1086723 m!1004975))

(declare-fun m!1004977 () Bool)

(assert (=> b!1086723 m!1004977))

(declare-fun m!1004979 () Bool)

(assert (=> b!1086723 m!1004979))

(declare-fun m!1004981 () Bool)

(assert (=> b!1086723 m!1004981))

(declare-fun m!1004983 () Bool)

(assert (=> b!1086723 m!1004983))

(declare-fun m!1004985 () Bool)

(assert (=> b!1086718 m!1004985))

(declare-fun m!1004987 () Bool)

(assert (=> mapNonEmpty!41653 m!1004987))

(declare-fun m!1004989 () Bool)

(assert (=> b!1086717 m!1004989))

(declare-fun m!1004991 () Bool)

(assert (=> b!1086719 m!1004991))

(declare-fun m!1004993 () Bool)

(assert (=> b!1086724 m!1004993))

(declare-fun m!1004995 () Bool)

(assert (=> b!1086724 m!1004995))

(check-sat (not b_next!22597) (not b!1086712) (not b!1086718) (not b!1086714) (not start!95938) (not b_lambda!17245) (not b!1086721) (not b!1086723) (not b!1086719) (not mapNonEmpty!41653) (not b!1086716) b_and!35845 tp_is_empty!26599 (not b!1086724))
(check-sat b_and!35845 (not b_next!22597))
