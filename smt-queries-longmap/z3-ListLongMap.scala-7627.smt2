; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96076 () Bool)

(assert start!96076)

(declare-fun b_free!22735 () Bool)

(declare-fun b_next!22735 () Bool)

(assert (=> start!96076 (= b_free!22735 (not b_next!22735))))

(declare-fun tp!80053 () Bool)

(declare-fun b_and!36119 () Bool)

(assert (=> start!96076 (= tp!80053 b_and!36119)))

(declare-fun b!1089766 () Bool)

(declare-fun res!727000 () Bool)

(declare-fun e!622417 () Bool)

(assert (=> b!1089766 (=> (not res!727000) (not e!622417))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089766 (= res!727000 (validKeyInArray!0 k0!904))))

(declare-fun b!1089767 () Bool)

(declare-fun res!726993 () Bool)

(assert (=> b!1089767 (=> (not res!726993) (not e!622417))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70316 0))(
  ( (array!70317 (arr!33832 (Array (_ BitVec 32) (_ BitVec 64))) (size!34370 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70316)

(assert (=> b!1089767 (= res!726993 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34370 _keys!1070))))))

(declare-fun b!1089768 () Bool)

(declare-fun e!622415 () Bool)

(declare-fun e!622421 () Bool)

(declare-fun mapRes!41860 () Bool)

(assert (=> b!1089768 (= e!622415 (and e!622421 mapRes!41860))))

(declare-fun condMapEmpty!41860 () Bool)

(declare-datatypes ((V!40777 0))(
  ( (V!40778 (val!13425 Int)) )
))
(declare-datatypes ((ValueCell!12659 0))(
  ( (ValueCellFull!12659 (v!16045 V!40777)) (EmptyCell!12659) )
))
(declare-datatypes ((array!70318 0))(
  ( (array!70319 (arr!33833 (Array (_ BitVec 32) ValueCell!12659)) (size!34371 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70318)

(declare-fun mapDefault!41860 () ValueCell!12659)

(assert (=> b!1089768 (= condMapEmpty!41860 (= (arr!33833 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12659)) mapDefault!41860)))))

(declare-fun b!1089769 () Bool)

(declare-fun e!622416 () Bool)

(assert (=> b!1089769 (= e!622417 e!622416)))

(declare-fun res!726994 () Bool)

(assert (=> b!1089769 (=> (not res!726994) (not e!622416))))

(declare-fun lt!485879 () array!70316)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70316 (_ BitVec 32)) Bool)

(assert (=> b!1089769 (= res!726994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485879 mask!1414))))

(assert (=> b!1089769 (= lt!485879 (array!70317 (store (arr!33832 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34370 _keys!1070)))))

(declare-fun b!1089770 () Bool)

(declare-fun e!622418 () Bool)

(assert (=> b!1089770 (= e!622418 true)))

(declare-datatypes ((tuple2!17110 0))(
  ( (tuple2!17111 (_1!8566 (_ BitVec 64)) (_2!8566 V!40777)) )
))
(declare-datatypes ((List!23677 0))(
  ( (Nil!23674) (Cons!23673 (h!24882 tuple2!17110) (t!33461 List!23677)) )
))
(declare-datatypes ((ListLongMap!15079 0))(
  ( (ListLongMap!15080 (toList!7555 List!23677)) )
))
(declare-fun lt!485876 () ListLongMap!15079)

(declare-fun lt!485880 () ListLongMap!15079)

(declare-fun -!830 (ListLongMap!15079 (_ BitVec 64)) ListLongMap!15079)

(assert (=> b!1089770 (= (-!830 lt!485876 k0!904) lt!485880)))

(declare-fun minValue!831 () V!40777)

(declare-datatypes ((Unit!35695 0))(
  ( (Unit!35696) )
))
(declare-fun lt!485874 () Unit!35695)

(declare-fun lt!485873 () ListLongMap!15079)

(declare-fun addRemoveCommutativeForDiffKeys!78 (ListLongMap!15079 (_ BitVec 64) V!40777 (_ BitVec 64)) Unit!35695)

(assert (=> b!1089770 (= lt!485874 (addRemoveCommutativeForDiffKeys!78 lt!485873 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1089771 () Bool)

(declare-fun res!727002 () Bool)

(assert (=> b!1089771 (=> (not res!727002) (not e!622417))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089771 (= res!727002 (and (= (size!34371 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34370 _keys!1070) (size!34371 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089772 () Bool)

(declare-fun tp_is_empty!26737 () Bool)

(assert (=> b!1089772 (= e!622421 tp_is_empty!26737)))

(declare-fun b!1089773 () Bool)

(declare-fun res!727001 () Bool)

(assert (=> b!1089773 (=> (not res!727001) (not e!622417))))

(declare-datatypes ((List!23678 0))(
  ( (Nil!23675) (Cons!23674 (h!24883 (_ BitVec 64)) (t!33462 List!23678)) )
))
(declare-fun arrayNoDuplicates!0 (array!70316 (_ BitVec 32) List!23678) Bool)

(assert (=> b!1089773 (= res!727001 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23675))))

(declare-fun mapIsEmpty!41860 () Bool)

(assert (=> mapIsEmpty!41860 mapRes!41860))

(declare-fun b!1089774 () Bool)

(declare-fun e!622414 () Bool)

(assert (=> b!1089774 (= e!622414 tp_is_empty!26737)))

(declare-fun b!1089775 () Bool)

(declare-fun e!622419 () Bool)

(assert (=> b!1089775 (= e!622416 (not e!622419))))

(declare-fun res!726995 () Bool)

(assert (=> b!1089775 (=> res!726995 e!622419)))

(assert (=> b!1089775 (= res!726995 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!485883 () ListLongMap!15079)

(declare-fun zeroValue!831 () V!40777)

(declare-fun getCurrentListMap!4229 (array!70316 array!70318 (_ BitVec 32) (_ BitVec 32) V!40777 V!40777 (_ BitVec 32) Int) ListLongMap!15079)

(assert (=> b!1089775 (= lt!485883 (getCurrentListMap!4229 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485884 () ListLongMap!15079)

(declare-fun lt!485882 () array!70318)

(assert (=> b!1089775 (= lt!485884 (getCurrentListMap!4229 lt!485879 lt!485882 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485878 () ListLongMap!15079)

(declare-fun lt!485875 () ListLongMap!15079)

(assert (=> b!1089775 (and (= lt!485878 lt!485875) (= lt!485875 lt!485878))))

(assert (=> b!1089775 (= lt!485875 (-!830 lt!485873 k0!904))))

(declare-fun lt!485877 () Unit!35695)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!113 (array!70316 array!70318 (_ BitVec 32) (_ BitVec 32) V!40777 V!40777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35695)

(assert (=> b!1089775 (= lt!485877 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!113 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4099 (array!70316 array!70318 (_ BitVec 32) (_ BitVec 32) V!40777 V!40777 (_ BitVec 32) Int) ListLongMap!15079)

(assert (=> b!1089775 (= lt!485878 (getCurrentListMapNoExtraKeys!4099 lt!485879 lt!485882 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2170 (Int (_ BitVec 64)) V!40777)

(assert (=> b!1089775 (= lt!485882 (array!70319 (store (arr!33833 _values!874) i!650 (ValueCellFull!12659 (dynLambda!2170 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34371 _values!874)))))

(assert (=> b!1089775 (= lt!485873 (getCurrentListMapNoExtraKeys!4099 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089775 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485881 () Unit!35695)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70316 (_ BitVec 64) (_ BitVec 32)) Unit!35695)

(assert (=> b!1089775 (= lt!485881 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089776 () Bool)

(assert (=> b!1089776 (= e!622419 e!622418)))

(declare-fun res!726998 () Bool)

(assert (=> b!1089776 (=> res!726998 e!622418)))

(assert (=> b!1089776 (= res!726998 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1089776 (= lt!485883 lt!485876)))

(declare-fun lt!485885 () tuple2!17110)

(declare-fun +!3352 (ListLongMap!15079 tuple2!17110) ListLongMap!15079)

(assert (=> b!1089776 (= lt!485876 (+!3352 lt!485873 lt!485885))))

(assert (=> b!1089776 (= lt!485884 lt!485880)))

(assert (=> b!1089776 (= lt!485880 (+!3352 lt!485875 lt!485885))))

(assert (=> b!1089776 (= lt!485884 (+!3352 lt!485878 lt!485885))))

(assert (=> b!1089776 (= lt!485885 (tuple2!17111 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1089777 () Bool)

(declare-fun res!726999 () Bool)

(assert (=> b!1089777 (=> (not res!726999) (not e!622416))))

(assert (=> b!1089777 (= res!726999 (arrayNoDuplicates!0 lt!485879 #b00000000000000000000000000000000 Nil!23675))))

(declare-fun mapNonEmpty!41860 () Bool)

(declare-fun tp!80054 () Bool)

(assert (=> mapNonEmpty!41860 (= mapRes!41860 (and tp!80054 e!622414))))

(declare-fun mapKey!41860 () (_ BitVec 32))

(declare-fun mapValue!41860 () ValueCell!12659)

(declare-fun mapRest!41860 () (Array (_ BitVec 32) ValueCell!12659))

(assert (=> mapNonEmpty!41860 (= (arr!33833 _values!874) (store mapRest!41860 mapKey!41860 mapValue!41860))))

(declare-fun res!726997 () Bool)

(assert (=> start!96076 (=> (not res!726997) (not e!622417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96076 (= res!726997 (validMask!0 mask!1414))))

(assert (=> start!96076 e!622417))

(assert (=> start!96076 tp!80053))

(assert (=> start!96076 true))

(assert (=> start!96076 tp_is_empty!26737))

(declare-fun array_inv!26130 (array!70316) Bool)

(assert (=> start!96076 (array_inv!26130 _keys!1070)))

(declare-fun array_inv!26131 (array!70318) Bool)

(assert (=> start!96076 (and (array_inv!26131 _values!874) e!622415)))

(declare-fun b!1089778 () Bool)

(declare-fun res!726992 () Bool)

(assert (=> b!1089778 (=> (not res!726992) (not e!622417))))

(assert (=> b!1089778 (= res!726992 (= (select (arr!33832 _keys!1070) i!650) k0!904))))

(declare-fun b!1089779 () Bool)

(declare-fun res!726996 () Bool)

(assert (=> b!1089779 (=> (not res!726996) (not e!622417))))

(assert (=> b!1089779 (= res!726996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96076 res!726997) b!1089771))

(assert (= (and b!1089771 res!727002) b!1089779))

(assert (= (and b!1089779 res!726996) b!1089773))

(assert (= (and b!1089773 res!727001) b!1089767))

(assert (= (and b!1089767 res!726993) b!1089766))

(assert (= (and b!1089766 res!727000) b!1089778))

(assert (= (and b!1089778 res!726992) b!1089769))

(assert (= (and b!1089769 res!726994) b!1089777))

(assert (= (and b!1089777 res!726999) b!1089775))

(assert (= (and b!1089775 (not res!726995)) b!1089776))

(assert (= (and b!1089776 (not res!726998)) b!1089770))

(assert (= (and b!1089768 condMapEmpty!41860) mapIsEmpty!41860))

(assert (= (and b!1089768 (not condMapEmpty!41860)) mapNonEmpty!41860))

(get-info :version)

(assert (= (and mapNonEmpty!41860 ((_ is ValueCellFull!12659) mapValue!41860)) b!1089774))

(assert (= (and b!1089768 ((_ is ValueCellFull!12659) mapDefault!41860)) b!1089772))

(assert (= start!96076 b!1089768))

(declare-fun b_lambda!17383 () Bool)

(assert (=> (not b_lambda!17383) (not b!1089775)))

(declare-fun t!33460 () Bool)

(declare-fun tb!7605 () Bool)

(assert (=> (and start!96076 (= defaultEntry!882 defaultEntry!882) t!33460) tb!7605))

(declare-fun result!15737 () Bool)

(assert (=> tb!7605 (= result!15737 tp_is_empty!26737)))

(assert (=> b!1089775 t!33460))

(declare-fun b_and!36121 () Bool)

(assert (= b_and!36119 (and (=> t!33460 result!15737) b_and!36121)))

(declare-fun m!1008605 () Bool)

(assert (=> b!1089773 m!1008605))

(declare-fun m!1008607 () Bool)

(assert (=> b!1089777 m!1008607))

(declare-fun m!1008609 () Bool)

(assert (=> b!1089778 m!1008609))

(declare-fun m!1008611 () Bool)

(assert (=> b!1089779 m!1008611))

(declare-fun m!1008613 () Bool)

(assert (=> b!1089770 m!1008613))

(declare-fun m!1008615 () Bool)

(assert (=> b!1089770 m!1008615))

(declare-fun m!1008617 () Bool)

(assert (=> b!1089776 m!1008617))

(declare-fun m!1008619 () Bool)

(assert (=> b!1089776 m!1008619))

(declare-fun m!1008621 () Bool)

(assert (=> b!1089776 m!1008621))

(declare-fun m!1008623 () Bool)

(assert (=> b!1089775 m!1008623))

(declare-fun m!1008625 () Bool)

(assert (=> b!1089775 m!1008625))

(declare-fun m!1008627 () Bool)

(assert (=> b!1089775 m!1008627))

(declare-fun m!1008629 () Bool)

(assert (=> b!1089775 m!1008629))

(declare-fun m!1008631 () Bool)

(assert (=> b!1089775 m!1008631))

(declare-fun m!1008633 () Bool)

(assert (=> b!1089775 m!1008633))

(declare-fun m!1008635 () Bool)

(assert (=> b!1089775 m!1008635))

(declare-fun m!1008637 () Bool)

(assert (=> b!1089775 m!1008637))

(declare-fun m!1008639 () Bool)

(assert (=> b!1089775 m!1008639))

(declare-fun m!1008641 () Bool)

(assert (=> b!1089775 m!1008641))

(declare-fun m!1008643 () Bool)

(assert (=> mapNonEmpty!41860 m!1008643))

(declare-fun m!1008645 () Bool)

(assert (=> b!1089769 m!1008645))

(declare-fun m!1008647 () Bool)

(assert (=> b!1089769 m!1008647))

(declare-fun m!1008649 () Bool)

(assert (=> start!96076 m!1008649))

(declare-fun m!1008651 () Bool)

(assert (=> start!96076 m!1008651))

(declare-fun m!1008653 () Bool)

(assert (=> start!96076 m!1008653))

(declare-fun m!1008655 () Bool)

(assert (=> b!1089766 m!1008655))

(check-sat tp_is_empty!26737 (not b!1089773) (not b!1089766) (not b_next!22735) (not b!1089779) (not b!1089775) (not b!1089770) (not b!1089777) (not b!1089776) (not b!1089769) (not b_lambda!17383) (not mapNonEmpty!41860) b_and!36121 (not start!96076))
(check-sat b_and!36121 (not b_next!22735))
