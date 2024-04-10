; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96114 () Bool)

(assert start!96114)

(declare-fun b_free!22767 () Bool)

(declare-fun b_next!22767 () Bool)

(assert (=> start!96114 (= b_free!22767 (not b_next!22767))))

(declare-fun tp!80150 () Bool)

(declare-fun b_and!36209 () Bool)

(assert (=> start!96114 (= tp!80150 b_and!36209)))

(declare-fun b!1090623 () Bool)

(declare-fun e!622894 () Bool)

(declare-fun e!622895 () Bool)

(declare-fun mapRes!41908 () Bool)

(assert (=> b!1090623 (= e!622894 (and e!622895 mapRes!41908))))

(declare-fun condMapEmpty!41908 () Bool)

(declare-datatypes ((V!40819 0))(
  ( (V!40820 (val!13441 Int)) )
))
(declare-datatypes ((ValueCell!12675 0))(
  ( (ValueCellFull!12675 (v!16062 V!40819)) (EmptyCell!12675) )
))
(declare-datatypes ((array!70459 0))(
  ( (array!70460 (arr!33903 (Array (_ BitVec 32) ValueCell!12675)) (size!34439 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70459)

(declare-fun mapDefault!41908 () ValueCell!12675)

(assert (=> b!1090623 (= condMapEmpty!41908 (= (arr!33903 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12675)) mapDefault!41908)))))

(declare-fun res!727597 () Bool)

(declare-fun e!622896 () Bool)

(assert (=> start!96114 (=> (not res!727597) (not e!622896))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96114 (= res!727597 (validMask!0 mask!1414))))

(assert (=> start!96114 e!622896))

(assert (=> start!96114 tp!80150))

(assert (=> start!96114 true))

(declare-fun tp_is_empty!26769 () Bool)

(assert (=> start!96114 tp_is_empty!26769))

(declare-datatypes ((array!70461 0))(
  ( (array!70462 (arr!33904 (Array (_ BitVec 32) (_ BitVec 64))) (size!34440 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70461)

(declare-fun array_inv!26142 (array!70461) Bool)

(assert (=> start!96114 (array_inv!26142 _keys!1070)))

(declare-fun array_inv!26143 (array!70459) Bool)

(assert (=> start!96114 (and (array_inv!26143 _values!874) e!622894)))

(declare-fun b!1090624 () Bool)

(declare-fun res!727594 () Bool)

(assert (=> b!1090624 (=> (not res!727594) (not e!622896))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090624 (= res!727594 (and (= (size!34439 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34440 _keys!1070) (size!34439 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090625 () Bool)

(declare-fun e!622898 () Bool)

(assert (=> b!1090625 (= e!622898 true)))

(declare-datatypes ((tuple2!17086 0))(
  ( (tuple2!17087 (_1!8554 (_ BitVec 64)) (_2!8554 V!40819)) )
))
(declare-datatypes ((List!23673 0))(
  ( (Nil!23670) (Cons!23669 (h!24878 tuple2!17086) (t!33498 List!23673)) )
))
(declare-datatypes ((ListLongMap!15055 0))(
  ( (ListLongMap!15056 (toList!7543 List!23673)) )
))
(declare-fun lt!486707 () ListLongMap!15055)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!486702 () ListLongMap!15055)

(declare-fun -!866 (ListLongMap!15055 (_ BitVec 64)) ListLongMap!15055)

(assert (=> b!1090625 (= (-!866 lt!486707 k0!904) lt!486702)))

(declare-fun minValue!831 () V!40819)

(declare-fun lt!486700 () ListLongMap!15055)

(declare-datatypes ((Unit!35898 0))(
  ( (Unit!35899) )
))
(declare-fun lt!486705 () Unit!35898)

(declare-fun addRemoveCommutativeForDiffKeys!90 (ListLongMap!15055 (_ BitVec 64) V!40819 (_ BitVec 64)) Unit!35898)

(assert (=> b!1090625 (= lt!486705 (addRemoveCommutativeForDiffKeys!90 lt!486700 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapNonEmpty!41908 () Bool)

(declare-fun tp!80149 () Bool)

(declare-fun e!622891 () Bool)

(assert (=> mapNonEmpty!41908 (= mapRes!41908 (and tp!80149 e!622891))))

(declare-fun mapRest!41908 () (Array (_ BitVec 32) ValueCell!12675))

(declare-fun mapKey!41908 () (_ BitVec 32))

(declare-fun mapValue!41908 () ValueCell!12675)

(assert (=> mapNonEmpty!41908 (= (arr!33903 _values!874) (store mapRest!41908 mapKey!41908 mapValue!41908))))

(declare-fun b!1090626 () Bool)

(assert (=> b!1090626 (= e!622895 tp_is_empty!26769)))

(declare-fun b!1090627 () Bool)

(declare-fun e!622892 () Bool)

(assert (=> b!1090627 (= e!622892 e!622898)))

(declare-fun res!727591 () Bool)

(assert (=> b!1090627 (=> res!727591 e!622898)))

(assert (=> b!1090627 (= res!727591 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!486701 () ListLongMap!15055)

(assert (=> b!1090627 (= lt!486701 lt!486707)))

(declare-fun lt!486709 () tuple2!17086)

(declare-fun +!3331 (ListLongMap!15055 tuple2!17086) ListLongMap!15055)

(assert (=> b!1090627 (= lt!486707 (+!3331 lt!486700 lt!486709))))

(declare-fun lt!486708 () ListLongMap!15055)

(assert (=> b!1090627 (= lt!486708 lt!486702)))

(declare-fun lt!486698 () ListLongMap!15055)

(assert (=> b!1090627 (= lt!486702 (+!3331 lt!486698 lt!486709))))

(declare-fun lt!486699 () ListLongMap!15055)

(assert (=> b!1090627 (= lt!486708 (+!3331 lt!486699 lt!486709))))

(assert (=> b!1090627 (= lt!486709 (tuple2!17087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090628 () Bool)

(declare-fun res!727590 () Bool)

(declare-fun e!622893 () Bool)

(assert (=> b!1090628 (=> (not res!727590) (not e!622893))))

(declare-fun lt!486704 () array!70461)

(declare-datatypes ((List!23674 0))(
  ( (Nil!23671) (Cons!23670 (h!24879 (_ BitVec 64)) (t!33499 List!23674)) )
))
(declare-fun arrayNoDuplicates!0 (array!70461 (_ BitVec 32) List!23674) Bool)

(assert (=> b!1090628 (= res!727590 (arrayNoDuplicates!0 lt!486704 #b00000000000000000000000000000000 Nil!23671))))

(declare-fun b!1090629 () Bool)

(declare-fun res!727592 () Bool)

(assert (=> b!1090629 (=> (not res!727592) (not e!622896))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090629 (= res!727592 (= (select (arr!33904 _keys!1070) i!650) k0!904))))

(declare-fun b!1090630 () Bool)

(assert (=> b!1090630 (= e!622896 e!622893)))

(declare-fun res!727595 () Bool)

(assert (=> b!1090630 (=> (not res!727595) (not e!622893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70461 (_ BitVec 32)) Bool)

(assert (=> b!1090630 (= res!727595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486704 mask!1414))))

(assert (=> b!1090630 (= lt!486704 (array!70462 (store (arr!33904 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34440 _keys!1070)))))

(declare-fun b!1090631 () Bool)

(assert (=> b!1090631 (= e!622891 tp_is_empty!26769)))

(declare-fun b!1090632 () Bool)

(declare-fun res!727596 () Bool)

(assert (=> b!1090632 (=> (not res!727596) (not e!622896))))

(assert (=> b!1090632 (= res!727596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090633 () Bool)

(assert (=> b!1090633 (= e!622893 (not e!622892))))

(declare-fun res!727598 () Bool)

(assert (=> b!1090633 (=> res!727598 e!622892)))

(assert (=> b!1090633 (= res!727598 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40819)

(declare-fun getCurrentListMap!4308 (array!70461 array!70459 (_ BitVec 32) (_ BitVec 32) V!40819 V!40819 (_ BitVec 32) Int) ListLongMap!15055)

(assert (=> b!1090633 (= lt!486701 (getCurrentListMap!4308 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486706 () array!70459)

(assert (=> b!1090633 (= lt!486708 (getCurrentListMap!4308 lt!486704 lt!486706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1090633 (and (= lt!486699 lt!486698) (= lt!486698 lt!486699))))

(assert (=> b!1090633 (= lt!486698 (-!866 lt!486700 k0!904))))

(declare-fun lt!486703 () Unit!35898)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!127 (array!70461 array!70459 (_ BitVec 32) (_ BitVec 32) V!40819 V!40819 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35898)

(assert (=> b!1090633 (= lt!486703 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!127 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4068 (array!70461 array!70459 (_ BitVec 32) (_ BitVec 32) V!40819 V!40819 (_ BitVec 32) Int) ListLongMap!15055)

(assert (=> b!1090633 (= lt!486699 (getCurrentListMapNoExtraKeys!4068 lt!486704 lt!486706 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2205 (Int (_ BitVec 64)) V!40819)

(assert (=> b!1090633 (= lt!486706 (array!70460 (store (arr!33903 _values!874) i!650 (ValueCellFull!12675 (dynLambda!2205 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34439 _values!874)))))

(assert (=> b!1090633 (= lt!486700 (getCurrentListMapNoExtraKeys!4068 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090633 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486697 () Unit!35898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70461 (_ BitVec 64) (_ BitVec 32)) Unit!35898)

(assert (=> b!1090633 (= lt!486697 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090634 () Bool)

(declare-fun res!727593 () Bool)

(assert (=> b!1090634 (=> (not res!727593) (not e!622896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090634 (= res!727593 (validKeyInArray!0 k0!904))))

(declare-fun b!1090635 () Bool)

(declare-fun res!727599 () Bool)

(assert (=> b!1090635 (=> (not res!727599) (not e!622896))))

(assert (=> b!1090635 (= res!727599 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23671))))

(declare-fun mapIsEmpty!41908 () Bool)

(assert (=> mapIsEmpty!41908 mapRes!41908))

(declare-fun b!1090636 () Bool)

(declare-fun res!727589 () Bool)

(assert (=> b!1090636 (=> (not res!727589) (not e!622896))))

(assert (=> b!1090636 (= res!727589 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34440 _keys!1070))))))

(assert (= (and start!96114 res!727597) b!1090624))

(assert (= (and b!1090624 res!727594) b!1090632))

(assert (= (and b!1090632 res!727596) b!1090635))

(assert (= (and b!1090635 res!727599) b!1090636))

(assert (= (and b!1090636 res!727589) b!1090634))

(assert (= (and b!1090634 res!727593) b!1090629))

(assert (= (and b!1090629 res!727592) b!1090630))

(assert (= (and b!1090630 res!727595) b!1090628))

(assert (= (and b!1090628 res!727590) b!1090633))

(assert (= (and b!1090633 (not res!727598)) b!1090627))

(assert (= (and b!1090627 (not res!727591)) b!1090625))

(assert (= (and b!1090623 condMapEmpty!41908) mapIsEmpty!41908))

(assert (= (and b!1090623 (not condMapEmpty!41908)) mapNonEmpty!41908))

(get-info :version)

(assert (= (and mapNonEmpty!41908 ((_ is ValueCellFull!12675) mapValue!41908)) b!1090631))

(assert (= (and b!1090623 ((_ is ValueCellFull!12675) mapDefault!41908)) b!1090626))

(assert (= start!96114 b!1090623))

(declare-fun b_lambda!17437 () Bool)

(assert (=> (not b_lambda!17437) (not b!1090633)))

(declare-fun t!33497 () Bool)

(declare-fun tb!7645 () Bool)

(assert (=> (and start!96114 (= defaultEntry!882 defaultEntry!882) t!33497) tb!7645))

(declare-fun result!15809 () Bool)

(assert (=> tb!7645 (= result!15809 tp_is_empty!26769)))

(assert (=> b!1090633 t!33497))

(declare-fun b_and!36211 () Bool)

(assert (= b_and!36209 (and (=> t!33497 result!15809) b_and!36211)))

(declare-fun m!1010063 () Bool)

(assert (=> b!1090633 m!1010063))

(declare-fun m!1010065 () Bool)

(assert (=> b!1090633 m!1010065))

(declare-fun m!1010067 () Bool)

(assert (=> b!1090633 m!1010067))

(declare-fun m!1010069 () Bool)

(assert (=> b!1090633 m!1010069))

(declare-fun m!1010071 () Bool)

(assert (=> b!1090633 m!1010071))

(declare-fun m!1010073 () Bool)

(assert (=> b!1090633 m!1010073))

(declare-fun m!1010075 () Bool)

(assert (=> b!1090633 m!1010075))

(declare-fun m!1010077 () Bool)

(assert (=> b!1090633 m!1010077))

(declare-fun m!1010079 () Bool)

(assert (=> b!1090633 m!1010079))

(declare-fun m!1010081 () Bool)

(assert (=> b!1090633 m!1010081))

(declare-fun m!1010083 () Bool)

(assert (=> b!1090629 m!1010083))

(declare-fun m!1010085 () Bool)

(assert (=> b!1090627 m!1010085))

(declare-fun m!1010087 () Bool)

(assert (=> b!1090627 m!1010087))

(declare-fun m!1010089 () Bool)

(assert (=> b!1090627 m!1010089))

(declare-fun m!1010091 () Bool)

(assert (=> b!1090635 m!1010091))

(declare-fun m!1010093 () Bool)

(assert (=> mapNonEmpty!41908 m!1010093))

(declare-fun m!1010095 () Bool)

(assert (=> b!1090632 m!1010095))

(declare-fun m!1010097 () Bool)

(assert (=> b!1090625 m!1010097))

(declare-fun m!1010099 () Bool)

(assert (=> b!1090625 m!1010099))

(declare-fun m!1010101 () Bool)

(assert (=> start!96114 m!1010101))

(declare-fun m!1010103 () Bool)

(assert (=> start!96114 m!1010103))

(declare-fun m!1010105 () Bool)

(assert (=> start!96114 m!1010105))

(declare-fun m!1010107 () Bool)

(assert (=> b!1090634 m!1010107))

(declare-fun m!1010109 () Bool)

(assert (=> b!1090628 m!1010109))

(declare-fun m!1010111 () Bool)

(assert (=> b!1090630 m!1010111))

(declare-fun m!1010113 () Bool)

(assert (=> b!1090630 m!1010113))

(check-sat (not b!1090635) (not b!1090627) (not b_next!22767) (not b!1090628) (not b!1090633) (not b!1090632) (not b!1090625) (not b_lambda!17437) tp_is_empty!26769 b_and!36211 (not b!1090630) (not b!1090634) (not mapNonEmpty!41908) (not start!96114))
(check-sat b_and!36211 (not b_next!22767))
