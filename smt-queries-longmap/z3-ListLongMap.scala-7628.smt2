; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96082 () Bool)

(assert start!96082)

(declare-fun b_free!22741 () Bool)

(declare-fun b_next!22741 () Bool)

(assert (=> start!96082 (= b_free!22741 (not b_next!22741))))

(declare-fun tp!80072 () Bool)

(declare-fun b_and!36131 () Bool)

(assert (=> start!96082 (= tp!80072 b_and!36131)))

(declare-fun b!1089898 () Bool)

(declare-fun e!622488 () Bool)

(declare-fun tp_is_empty!26743 () Bool)

(assert (=> b!1089898 (= e!622488 tp_is_empty!26743)))

(declare-fun mapIsEmpty!41869 () Bool)

(declare-fun mapRes!41869 () Bool)

(assert (=> mapIsEmpty!41869 mapRes!41869))

(declare-fun mapNonEmpty!41869 () Bool)

(declare-fun tp!80071 () Bool)

(assert (=> mapNonEmpty!41869 (= mapRes!41869 (and tp!80071 e!622488))))

(declare-datatypes ((V!40785 0))(
  ( (V!40786 (val!13428 Int)) )
))
(declare-datatypes ((ValueCell!12662 0))(
  ( (ValueCellFull!12662 (v!16048 V!40785)) (EmptyCell!12662) )
))
(declare-datatypes ((array!70328 0))(
  ( (array!70329 (arr!33838 (Array (_ BitVec 32) ValueCell!12662)) (size!34376 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70328)

(declare-fun mapValue!41869 () ValueCell!12662)

(declare-fun mapKey!41869 () (_ BitVec 32))

(declare-fun mapRest!41869 () (Array (_ BitVec 32) ValueCell!12662))

(assert (=> mapNonEmpty!41869 (= (arr!33838 _values!874) (store mapRest!41869 mapKey!41869 mapValue!41869))))

(declare-fun b!1089899 () Bool)

(declare-fun res!727094 () Bool)

(declare-fun e!622486 () Bool)

(assert (=> b!1089899 (=> (not res!727094) (not e!622486))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70330 0))(
  ( (array!70331 (arr!33839 (Array (_ BitVec 32) (_ BitVec 64))) (size!34377 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70330)

(assert (=> b!1089899 (= res!727094 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34377 _keys!1070))))))

(declare-fun b!1089900 () Bool)

(declare-fun res!727097 () Bool)

(declare-fun e!622490 () Bool)

(assert (=> b!1089900 (=> (not res!727097) (not e!622490))))

(declare-fun lt!485998 () array!70330)

(declare-datatypes ((List!23682 0))(
  ( (Nil!23679) (Cons!23678 (h!24887 (_ BitVec 64)) (t!33472 List!23682)) )
))
(declare-fun arrayNoDuplicates!0 (array!70330 (_ BitVec 32) List!23682) Bool)

(assert (=> b!1089900 (= res!727097 (arrayNoDuplicates!0 lt!485998 #b00000000000000000000000000000000 Nil!23679))))

(declare-fun b!1089901 () Bool)

(declare-fun e!622492 () Bool)

(assert (=> b!1089901 (= e!622490 (not e!622492))))

(declare-fun res!727092 () Bool)

(assert (=> b!1089901 (=> res!727092 e!622492)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089901 (= res!727092 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40785)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17116 0))(
  ( (tuple2!17117 (_1!8569 (_ BitVec 64)) (_2!8569 V!40785)) )
))
(declare-datatypes ((List!23683 0))(
  ( (Nil!23680) (Cons!23679 (h!24888 tuple2!17116) (t!33473 List!23683)) )
))
(declare-datatypes ((ListLongMap!15085 0))(
  ( (ListLongMap!15086 (toList!7558 List!23683)) )
))
(declare-fun lt!485992 () ListLongMap!15085)

(declare-fun zeroValue!831 () V!40785)

(declare-fun getCurrentListMap!4231 (array!70330 array!70328 (_ BitVec 32) (_ BitVec 32) V!40785 V!40785 (_ BitVec 32) Int) ListLongMap!15085)

(assert (=> b!1089901 (= lt!485992 (getCurrentListMap!4231 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485990 () ListLongMap!15085)

(declare-fun lt!485991 () array!70328)

(assert (=> b!1089901 (= lt!485990 (getCurrentListMap!4231 lt!485998 lt!485991 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485995 () ListLongMap!15085)

(declare-fun lt!486002 () ListLongMap!15085)

(assert (=> b!1089901 (and (= lt!485995 lt!486002) (= lt!486002 lt!485995))))

(declare-fun lt!485999 () ListLongMap!15085)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!833 (ListLongMap!15085 (_ BitVec 64)) ListLongMap!15085)

(assert (=> b!1089901 (= lt!486002 (-!833 lt!485999 k0!904))))

(declare-datatypes ((Unit!35701 0))(
  ( (Unit!35702) )
))
(declare-fun lt!485996 () Unit!35701)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!115 (array!70330 array!70328 (_ BitVec 32) (_ BitVec 32) V!40785 V!40785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35701)

(assert (=> b!1089901 (= lt!485996 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!115 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4101 (array!70330 array!70328 (_ BitVec 32) (_ BitVec 32) V!40785 V!40785 (_ BitVec 32) Int) ListLongMap!15085)

(assert (=> b!1089901 (= lt!485995 (getCurrentListMapNoExtraKeys!4101 lt!485998 lt!485991 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2172 (Int (_ BitVec 64)) V!40785)

(assert (=> b!1089901 (= lt!485991 (array!70329 (store (arr!33838 _values!874) i!650 (ValueCellFull!12662 (dynLambda!2172 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34376 _values!874)))))

(assert (=> b!1089901 (= lt!485999 (getCurrentListMapNoExtraKeys!4101 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089901 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485993 () Unit!35701)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70330 (_ BitVec 64) (_ BitVec 32)) Unit!35701)

(assert (=> b!1089901 (= lt!485993 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089902 () Bool)

(declare-fun res!727093 () Bool)

(assert (=> b!1089902 (=> (not res!727093) (not e!622486))))

(assert (=> b!1089902 (= res!727093 (and (= (size!34376 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34377 _keys!1070) (size!34376 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089903 () Bool)

(assert (=> b!1089903 (= e!622486 e!622490)))

(declare-fun res!727098 () Bool)

(assert (=> b!1089903 (=> (not res!727098) (not e!622490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70330 (_ BitVec 32)) Bool)

(assert (=> b!1089903 (= res!727098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485998 mask!1414))))

(assert (=> b!1089903 (= lt!485998 (array!70331 (store (arr!33839 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34377 _keys!1070)))))

(declare-fun b!1089904 () Bool)

(declare-fun e!622487 () Bool)

(assert (=> b!1089904 (= e!622487 true)))

(declare-fun lt!485994 () ListLongMap!15085)

(declare-fun lt!485997 () ListLongMap!15085)

(assert (=> b!1089904 (= (-!833 lt!485994 k0!904) lt!485997)))

(declare-fun lt!486000 () Unit!35701)

(declare-fun addRemoveCommutativeForDiffKeys!80 (ListLongMap!15085 (_ BitVec 64) V!40785 (_ BitVec 64)) Unit!35701)

(assert (=> b!1089904 (= lt!486000 (addRemoveCommutativeForDiffKeys!80 lt!485999 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1089905 () Bool)

(declare-fun res!727096 () Bool)

(assert (=> b!1089905 (=> (not res!727096) (not e!622486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089905 (= res!727096 (validKeyInArray!0 k0!904))))

(declare-fun b!1089906 () Bool)

(declare-fun e!622493 () Bool)

(declare-fun e!622491 () Bool)

(assert (=> b!1089906 (= e!622493 (and e!622491 mapRes!41869))))

(declare-fun condMapEmpty!41869 () Bool)

(declare-fun mapDefault!41869 () ValueCell!12662)

(assert (=> b!1089906 (= condMapEmpty!41869 (= (arr!33838 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12662)) mapDefault!41869)))))

(declare-fun b!1089907 () Bool)

(declare-fun res!727101 () Bool)

(assert (=> b!1089907 (=> (not res!727101) (not e!622486))))

(assert (=> b!1089907 (= res!727101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089909 () Bool)

(declare-fun res!727100 () Bool)

(assert (=> b!1089909 (=> (not res!727100) (not e!622486))))

(assert (=> b!1089909 (= res!727100 (= (select (arr!33839 _keys!1070) i!650) k0!904))))

(declare-fun b!1089910 () Bool)

(assert (=> b!1089910 (= e!622492 e!622487)))

(declare-fun res!727099 () Bool)

(assert (=> b!1089910 (=> res!727099 e!622487)))

(assert (=> b!1089910 (= res!727099 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1089910 (= lt!485992 lt!485994)))

(declare-fun lt!486001 () tuple2!17116)

(declare-fun +!3353 (ListLongMap!15085 tuple2!17116) ListLongMap!15085)

(assert (=> b!1089910 (= lt!485994 (+!3353 lt!485999 lt!486001))))

(assert (=> b!1089910 (= lt!485990 lt!485997)))

(assert (=> b!1089910 (= lt!485997 (+!3353 lt!486002 lt!486001))))

(assert (=> b!1089910 (= lt!485990 (+!3353 lt!485995 lt!486001))))

(assert (=> b!1089910 (= lt!486001 (tuple2!17117 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1089911 () Bool)

(assert (=> b!1089911 (= e!622491 tp_is_empty!26743)))

(declare-fun res!727091 () Bool)

(assert (=> start!96082 (=> (not res!727091) (not e!622486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96082 (= res!727091 (validMask!0 mask!1414))))

(assert (=> start!96082 e!622486))

(assert (=> start!96082 tp!80072))

(assert (=> start!96082 true))

(assert (=> start!96082 tp_is_empty!26743))

(declare-fun array_inv!26134 (array!70330) Bool)

(assert (=> start!96082 (array_inv!26134 _keys!1070)))

(declare-fun array_inv!26135 (array!70328) Bool)

(assert (=> start!96082 (and (array_inv!26135 _values!874) e!622493)))

(declare-fun b!1089908 () Bool)

(declare-fun res!727095 () Bool)

(assert (=> b!1089908 (=> (not res!727095) (not e!622486))))

(assert (=> b!1089908 (= res!727095 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23679))))

(assert (= (and start!96082 res!727091) b!1089902))

(assert (= (and b!1089902 res!727093) b!1089907))

(assert (= (and b!1089907 res!727101) b!1089908))

(assert (= (and b!1089908 res!727095) b!1089899))

(assert (= (and b!1089899 res!727094) b!1089905))

(assert (= (and b!1089905 res!727096) b!1089909))

(assert (= (and b!1089909 res!727100) b!1089903))

(assert (= (and b!1089903 res!727098) b!1089900))

(assert (= (and b!1089900 res!727097) b!1089901))

(assert (= (and b!1089901 (not res!727092)) b!1089910))

(assert (= (and b!1089910 (not res!727099)) b!1089904))

(assert (= (and b!1089906 condMapEmpty!41869) mapIsEmpty!41869))

(assert (= (and b!1089906 (not condMapEmpty!41869)) mapNonEmpty!41869))

(get-info :version)

(assert (= (and mapNonEmpty!41869 ((_ is ValueCellFull!12662) mapValue!41869)) b!1089898))

(assert (= (and b!1089906 ((_ is ValueCellFull!12662) mapDefault!41869)) b!1089911))

(assert (= start!96082 b!1089906))

(declare-fun b_lambda!17389 () Bool)

(assert (=> (not b_lambda!17389) (not b!1089901)))

(declare-fun t!33471 () Bool)

(declare-fun tb!7611 () Bool)

(assert (=> (and start!96082 (= defaultEntry!882 defaultEntry!882) t!33471) tb!7611))

(declare-fun result!15749 () Bool)

(assert (=> tb!7611 (= result!15749 tp_is_empty!26743)))

(assert (=> b!1089901 t!33471))

(declare-fun b_and!36133 () Bool)

(assert (= b_and!36131 (and (=> t!33471 result!15749) b_and!36133)))

(declare-fun m!1008761 () Bool)

(assert (=> b!1089905 m!1008761))

(declare-fun m!1008763 () Bool)

(assert (=> b!1089904 m!1008763))

(declare-fun m!1008765 () Bool)

(assert (=> b!1089904 m!1008765))

(declare-fun m!1008767 () Bool)

(assert (=> b!1089903 m!1008767))

(declare-fun m!1008769 () Bool)

(assert (=> b!1089903 m!1008769))

(declare-fun m!1008771 () Bool)

(assert (=> b!1089900 m!1008771))

(declare-fun m!1008773 () Bool)

(assert (=> mapNonEmpty!41869 m!1008773))

(declare-fun m!1008775 () Bool)

(assert (=> b!1089909 m!1008775))

(declare-fun m!1008777 () Bool)

(assert (=> b!1089907 m!1008777))

(declare-fun m!1008779 () Bool)

(assert (=> start!96082 m!1008779))

(declare-fun m!1008781 () Bool)

(assert (=> start!96082 m!1008781))

(declare-fun m!1008783 () Bool)

(assert (=> start!96082 m!1008783))

(declare-fun m!1008785 () Bool)

(assert (=> b!1089901 m!1008785))

(declare-fun m!1008787 () Bool)

(assert (=> b!1089901 m!1008787))

(declare-fun m!1008789 () Bool)

(assert (=> b!1089901 m!1008789))

(declare-fun m!1008791 () Bool)

(assert (=> b!1089901 m!1008791))

(declare-fun m!1008793 () Bool)

(assert (=> b!1089901 m!1008793))

(declare-fun m!1008795 () Bool)

(assert (=> b!1089901 m!1008795))

(declare-fun m!1008797 () Bool)

(assert (=> b!1089901 m!1008797))

(declare-fun m!1008799 () Bool)

(assert (=> b!1089901 m!1008799))

(declare-fun m!1008801 () Bool)

(assert (=> b!1089901 m!1008801))

(declare-fun m!1008803 () Bool)

(assert (=> b!1089901 m!1008803))

(declare-fun m!1008805 () Bool)

(assert (=> b!1089910 m!1008805))

(declare-fun m!1008807 () Bool)

(assert (=> b!1089910 m!1008807))

(declare-fun m!1008809 () Bool)

(assert (=> b!1089910 m!1008809))

(declare-fun m!1008811 () Bool)

(assert (=> b!1089908 m!1008811))

(check-sat (not mapNonEmpty!41869) (not b!1089907) tp_is_empty!26743 (not b!1089905) (not start!96082) (not b_next!22741) (not b_lambda!17389) (not b!1089901) b_and!36133 (not b!1089910) (not b!1089904) (not b!1089908) (not b!1089903) (not b!1089900))
(check-sat b_and!36133 (not b_next!22741))
