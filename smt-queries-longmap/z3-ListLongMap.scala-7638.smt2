; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96384 () Bool)

(assert start!96384)

(declare-fun b_free!22801 () Bool)

(declare-fun b_next!22801 () Bool)

(assert (=> start!96384 (= b_free!22801 (not b_next!22801))))

(declare-fun tp!80252 () Bool)

(declare-fun b_and!36287 () Bool)

(assert (=> start!96384 (= tp!80252 b_and!36287)))

(declare-fun mapNonEmpty!41959 () Bool)

(declare-fun mapRes!41959 () Bool)

(declare-fun tp!80251 () Bool)

(declare-fun e!624161 () Bool)

(assert (=> mapNonEmpty!41959 (= mapRes!41959 (and tp!80251 e!624161))))

(declare-datatypes ((V!40865 0))(
  ( (V!40866 (val!13458 Int)) )
))
(declare-datatypes ((ValueCell!12692 0))(
  ( (ValueCellFull!12692 (v!16075 V!40865)) (EmptyCell!12692) )
))
(declare-fun mapValue!41959 () ValueCell!12692)

(declare-fun mapKey!41959 () (_ BitVec 32))

(declare-datatypes ((array!70561 0))(
  ( (array!70562 (arr!33948 (Array (_ BitVec 32) ValueCell!12692)) (size!34485 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70561)

(declare-fun mapRest!41959 () (Array (_ BitVec 32) ValueCell!12692))

(assert (=> mapNonEmpty!41959 (= (arr!33948 _values!874) (store mapRest!41959 mapKey!41959 mapValue!41959))))

(declare-fun b!1092699 () Bool)

(declare-fun e!624160 () Bool)

(declare-fun tp_is_empty!26803 () Bool)

(assert (=> b!1092699 (= e!624160 tp_is_empty!26803)))

(declare-fun b!1092700 () Bool)

(declare-fun res!728674 () Bool)

(declare-fun e!624154 () Bool)

(assert (=> b!1092700 (=> (not res!728674) (not e!624154))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70563 0))(
  ( (array!70564 (arr!33949 (Array (_ BitVec 32) (_ BitVec 64))) (size!34486 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70563)

(assert (=> b!1092700 (= res!728674 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34486 _keys!1070))))))

(declare-fun b!1092701 () Bool)

(declare-fun res!728680 () Bool)

(assert (=> b!1092701 (=> (not res!728680) (not e!624154))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092701 (= res!728680 (and (= (size!34485 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34486 _keys!1070) (size!34485 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092702 () Bool)

(declare-fun e!624157 () Bool)

(declare-fun e!624156 () Bool)

(assert (=> b!1092702 (= e!624157 e!624156)))

(declare-fun res!728673 () Bool)

(assert (=> b!1092702 (=> res!728673 e!624156)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1092702 (= res!728673 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17118 0))(
  ( (tuple2!17119 (_1!8570 (_ BitVec 64)) (_2!8570 V!40865)) )
))
(declare-datatypes ((List!23711 0))(
  ( (Nil!23708) (Cons!23707 (h!24925 tuple2!17118) (t!33562 List!23711)) )
))
(declare-datatypes ((ListLongMap!15095 0))(
  ( (ListLongMap!15096 (toList!7563 List!23711)) )
))
(declare-fun lt!487882 () ListLongMap!15095)

(declare-fun lt!487876 () ListLongMap!15095)

(assert (=> b!1092702 (= lt!487882 lt!487876)))

(declare-fun lt!487887 () ListLongMap!15095)

(declare-fun lt!487885 () tuple2!17118)

(declare-fun +!3378 (ListLongMap!15095 tuple2!17118) ListLongMap!15095)

(assert (=> b!1092702 (= lt!487876 (+!3378 lt!487887 lt!487885))))

(declare-fun lt!487875 () ListLongMap!15095)

(declare-fun lt!487884 () ListLongMap!15095)

(assert (=> b!1092702 (= lt!487875 lt!487884)))

(declare-fun lt!487880 () ListLongMap!15095)

(assert (=> b!1092702 (= lt!487884 (+!3378 lt!487880 lt!487885))))

(declare-fun lt!487881 () ListLongMap!15095)

(assert (=> b!1092702 (= lt!487875 (+!3378 lt!487881 lt!487885))))

(declare-fun minValue!831 () V!40865)

(assert (=> b!1092702 (= lt!487885 (tuple2!17119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1092703 () Bool)

(assert (=> b!1092703 (= e!624156 true)))

(declare-fun -!868 (ListLongMap!15095 (_ BitVec 64)) ListLongMap!15095)

(assert (=> b!1092703 (= (-!868 lt!487876 k0!904) lt!487884)))

(declare-datatypes ((Unit!35903 0))(
  ( (Unit!35904) )
))
(declare-fun lt!487886 () Unit!35903)

(declare-fun addRemoveCommutativeForDiffKeys!101 (ListLongMap!15095 (_ BitVec 64) V!40865 (_ BitVec 64)) Unit!35903)

(assert (=> b!1092703 (= lt!487886 (addRemoveCommutativeForDiffKeys!101 lt!487887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1092704 () Bool)

(declare-fun res!728681 () Bool)

(assert (=> b!1092704 (=> (not res!728681) (not e!624154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70563 (_ BitVec 32)) Bool)

(assert (=> b!1092704 (= res!728681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092698 () Bool)

(declare-fun e!624155 () Bool)

(assert (=> b!1092698 (= e!624154 e!624155)))

(declare-fun res!728677 () Bool)

(assert (=> b!1092698 (=> (not res!728677) (not e!624155))))

(declare-fun lt!487879 () array!70563)

(assert (=> b!1092698 (= res!728677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487879 mask!1414))))

(assert (=> b!1092698 (= lt!487879 (array!70564 (store (arr!33949 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34486 _keys!1070)))))

(declare-fun res!728678 () Bool)

(assert (=> start!96384 (=> (not res!728678) (not e!624154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96384 (= res!728678 (validMask!0 mask!1414))))

(assert (=> start!96384 e!624154))

(assert (=> start!96384 tp!80252))

(assert (=> start!96384 true))

(assert (=> start!96384 tp_is_empty!26803))

(declare-fun array_inv!26214 (array!70563) Bool)

(assert (=> start!96384 (array_inv!26214 _keys!1070)))

(declare-fun e!624159 () Bool)

(declare-fun array_inv!26215 (array!70561) Bool)

(assert (=> start!96384 (and (array_inv!26215 _values!874) e!624159)))

(declare-fun b!1092705 () Bool)

(assert (=> b!1092705 (= e!624161 tp_is_empty!26803)))

(declare-fun b!1092706 () Bool)

(declare-fun res!728679 () Bool)

(assert (=> b!1092706 (=> (not res!728679) (not e!624154))))

(declare-datatypes ((List!23712 0))(
  ( (Nil!23709) (Cons!23708 (h!24926 (_ BitVec 64)) (t!33563 List!23712)) )
))
(declare-fun arrayNoDuplicates!0 (array!70563 (_ BitVec 32) List!23712) Bool)

(assert (=> b!1092706 (= res!728679 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23709))))

(declare-fun b!1092707 () Bool)

(assert (=> b!1092707 (= e!624159 (and e!624160 mapRes!41959))))

(declare-fun condMapEmpty!41959 () Bool)

(declare-fun mapDefault!41959 () ValueCell!12692)

(assert (=> b!1092707 (= condMapEmpty!41959 (= (arr!33948 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12692)) mapDefault!41959)))))

(declare-fun b!1092708 () Bool)

(assert (=> b!1092708 (= e!624155 (not e!624157))))

(declare-fun res!728672 () Bool)

(assert (=> b!1092708 (=> res!728672 e!624157)))

(assert (=> b!1092708 (= res!728672 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40865)

(declare-fun getCurrentListMap!4314 (array!70563 array!70561 (_ BitVec 32) (_ BitVec 32) V!40865 V!40865 (_ BitVec 32) Int) ListLongMap!15095)

(assert (=> b!1092708 (= lt!487882 (getCurrentListMap!4314 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487878 () array!70561)

(assert (=> b!1092708 (= lt!487875 (getCurrentListMap!4314 lt!487879 lt!487878 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1092708 (and (= lt!487881 lt!487880) (= lt!487880 lt!487881))))

(assert (=> b!1092708 (= lt!487880 (-!868 lt!487887 k0!904))))

(declare-fun lt!487877 () Unit!35903)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!143 (array!70563 array!70561 (_ BitVec 32) (_ BitVec 32) V!40865 V!40865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35903)

(assert (=> b!1092708 (= lt!487877 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!143 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4119 (array!70563 array!70561 (_ BitVec 32) (_ BitVec 32) V!40865 V!40865 (_ BitVec 32) Int) ListLongMap!15095)

(assert (=> b!1092708 (= lt!487881 (getCurrentListMapNoExtraKeys!4119 lt!487879 lt!487878 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2240 (Int (_ BitVec 64)) V!40865)

(assert (=> b!1092708 (= lt!487878 (array!70562 (store (arr!33948 _values!874) i!650 (ValueCellFull!12692 (dynLambda!2240 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34485 _values!874)))))

(assert (=> b!1092708 (= lt!487887 (getCurrentListMapNoExtraKeys!4119 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092708 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487883 () Unit!35903)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70563 (_ BitVec 64) (_ BitVec 32)) Unit!35903)

(assert (=> b!1092708 (= lt!487883 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092709 () Bool)

(declare-fun res!728676 () Bool)

(assert (=> b!1092709 (=> (not res!728676) (not e!624154))))

(assert (=> b!1092709 (= res!728676 (= (select (arr!33949 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41959 () Bool)

(assert (=> mapIsEmpty!41959 mapRes!41959))

(declare-fun b!1092710 () Bool)

(declare-fun res!728675 () Bool)

(assert (=> b!1092710 (=> (not res!728675) (not e!624154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092710 (= res!728675 (validKeyInArray!0 k0!904))))

(declare-fun b!1092711 () Bool)

(declare-fun res!728682 () Bool)

(assert (=> b!1092711 (=> (not res!728682) (not e!624155))))

(assert (=> b!1092711 (= res!728682 (arrayNoDuplicates!0 lt!487879 #b00000000000000000000000000000000 Nil!23709))))

(assert (= (and start!96384 res!728678) b!1092701))

(assert (= (and b!1092701 res!728680) b!1092704))

(assert (= (and b!1092704 res!728681) b!1092706))

(assert (= (and b!1092706 res!728679) b!1092700))

(assert (= (and b!1092700 res!728674) b!1092710))

(assert (= (and b!1092710 res!728675) b!1092709))

(assert (= (and b!1092709 res!728676) b!1092698))

(assert (= (and b!1092698 res!728677) b!1092711))

(assert (= (and b!1092711 res!728682) b!1092708))

(assert (= (and b!1092708 (not res!728672)) b!1092702))

(assert (= (and b!1092702 (not res!728673)) b!1092703))

(assert (= (and b!1092707 condMapEmpty!41959) mapIsEmpty!41959))

(assert (= (and b!1092707 (not condMapEmpty!41959)) mapNonEmpty!41959))

(get-info :version)

(assert (= (and mapNonEmpty!41959 ((_ is ValueCellFull!12692) mapValue!41959)) b!1092705))

(assert (= (and b!1092707 ((_ is ValueCellFull!12692) mapDefault!41959)) b!1092699))

(assert (= start!96384 b!1092707))

(declare-fun b_lambda!17481 () Bool)

(assert (=> (not b_lambda!17481) (not b!1092708)))

(declare-fun t!33561 () Bool)

(declare-fun tb!7671 () Bool)

(assert (=> (and start!96384 (= defaultEntry!882 defaultEntry!882) t!33561) tb!7671))

(declare-fun result!15869 () Bool)

(assert (=> tb!7671 (= result!15869 tp_is_empty!26803)))

(assert (=> b!1092708 t!33561))

(declare-fun b_and!36289 () Bool)

(assert (= b_and!36287 (and (=> t!33561 result!15869) b_and!36289)))

(declare-fun m!1012619 () Bool)

(assert (=> b!1092703 m!1012619))

(declare-fun m!1012621 () Bool)

(assert (=> b!1092703 m!1012621))

(declare-fun m!1012623 () Bool)

(assert (=> b!1092711 m!1012623))

(declare-fun m!1012625 () Bool)

(assert (=> b!1092708 m!1012625))

(declare-fun m!1012627 () Bool)

(assert (=> b!1092708 m!1012627))

(declare-fun m!1012629 () Bool)

(assert (=> b!1092708 m!1012629))

(declare-fun m!1012631 () Bool)

(assert (=> b!1092708 m!1012631))

(declare-fun m!1012633 () Bool)

(assert (=> b!1092708 m!1012633))

(declare-fun m!1012635 () Bool)

(assert (=> b!1092708 m!1012635))

(declare-fun m!1012637 () Bool)

(assert (=> b!1092708 m!1012637))

(declare-fun m!1012639 () Bool)

(assert (=> b!1092708 m!1012639))

(declare-fun m!1012641 () Bool)

(assert (=> b!1092708 m!1012641))

(declare-fun m!1012643 () Bool)

(assert (=> b!1092708 m!1012643))

(declare-fun m!1012645 () Bool)

(assert (=> b!1092702 m!1012645))

(declare-fun m!1012647 () Bool)

(assert (=> b!1092702 m!1012647))

(declare-fun m!1012649 () Bool)

(assert (=> b!1092702 m!1012649))

(declare-fun m!1012651 () Bool)

(assert (=> mapNonEmpty!41959 m!1012651))

(declare-fun m!1012653 () Bool)

(assert (=> b!1092710 m!1012653))

(declare-fun m!1012655 () Bool)

(assert (=> b!1092704 m!1012655))

(declare-fun m!1012657 () Bool)

(assert (=> b!1092706 m!1012657))

(declare-fun m!1012659 () Bool)

(assert (=> b!1092709 m!1012659))

(declare-fun m!1012661 () Bool)

(assert (=> b!1092698 m!1012661))

(declare-fun m!1012663 () Bool)

(assert (=> b!1092698 m!1012663))

(declare-fun m!1012665 () Bool)

(assert (=> start!96384 m!1012665))

(declare-fun m!1012667 () Bool)

(assert (=> start!96384 m!1012667))

(declare-fun m!1012669 () Bool)

(assert (=> start!96384 m!1012669))

(check-sat (not b!1092703) (not start!96384) tp_is_empty!26803 b_and!36289 (not b!1092711) (not b!1092710) (not b!1092706) (not b!1092704) (not b_next!22801) (not b!1092702) (not b_lambda!17481) (not b!1092698) (not b!1092708) (not mapNonEmpty!41959))
(check-sat b_and!36289 (not b_next!22801))
