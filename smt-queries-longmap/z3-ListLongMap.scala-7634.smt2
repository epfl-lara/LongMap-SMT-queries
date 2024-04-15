; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96118 () Bool)

(assert start!96118)

(declare-fun b_free!22777 () Bool)

(declare-fun b_next!22777 () Bool)

(assert (=> start!96118 (= b_free!22777 (not b_next!22777))))

(declare-fun tp!80179 () Bool)

(declare-fun b_and!36203 () Bool)

(assert (=> start!96118 (= tp!80179 b_and!36203)))

(declare-fun b!1090690 () Bool)

(declare-fun res!727691 () Bool)

(declare-fun e!622919 () Bool)

(assert (=> b!1090690 (=> (not res!727691) (not e!622919))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090690 (= res!727691 (validKeyInArray!0 k0!904))))

(declare-fun b!1090691 () Bool)

(declare-fun e!622925 () Bool)

(declare-fun e!622922 () Bool)

(declare-fun mapRes!41923 () Bool)

(assert (=> b!1090691 (= e!622925 (and e!622922 mapRes!41923))))

(declare-fun condMapEmpty!41923 () Bool)

(declare-datatypes ((V!40833 0))(
  ( (V!40834 (val!13446 Int)) )
))
(declare-datatypes ((ValueCell!12680 0))(
  ( (ValueCellFull!12680 (v!16066 V!40833)) (EmptyCell!12680) )
))
(declare-datatypes ((array!70400 0))(
  ( (array!70401 (arr!33874 (Array (_ BitVec 32) ValueCell!12680)) (size!34412 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70400)

(declare-fun mapDefault!41923 () ValueCell!12680)

(assert (=> b!1090691 (= condMapEmpty!41923 (= (arr!33874 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12680)) mapDefault!41923)))))

(declare-fun b!1090692 () Bool)

(declare-fun e!622920 () Bool)

(declare-fun tp_is_empty!26779 () Bool)

(assert (=> b!1090692 (= e!622920 tp_is_empty!26779)))

(declare-fun b!1090693 () Bool)

(assert (=> b!1090693 (= e!622922 tp_is_empty!26779)))

(declare-fun b!1090694 () Bool)

(declare-fun res!727693 () Bool)

(assert (=> b!1090694 (=> (not res!727693) (not e!622919))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70402 0))(
  ( (array!70403 (arr!33875 (Array (_ BitVec 32) (_ BitVec 64))) (size!34413 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70402)

(assert (=> b!1090694 (= res!727693 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34413 _keys!1070))))))

(declare-fun mapIsEmpty!41923 () Bool)

(assert (=> mapIsEmpty!41923 mapRes!41923))

(declare-fun b!1090695 () Bool)

(declare-fun res!727695 () Bool)

(assert (=> b!1090695 (=> (not res!727695) (not e!622919))))

(declare-datatypes ((List!23714 0))(
  ( (Nil!23711) (Cons!23710 (h!24919 (_ BitVec 64)) (t!33540 List!23714)) )
))
(declare-fun arrayNoDuplicates!0 (array!70402 (_ BitVec 32) List!23714) Bool)

(assert (=> b!1090695 (= res!727695 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23711))))

(declare-fun b!1090696 () Bool)

(declare-fun res!727694 () Bool)

(assert (=> b!1090696 (=> (not res!727694) (not e!622919))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090696 (= res!727694 (and (= (size!34412 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34413 _keys!1070) (size!34412 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!727689 () Bool)

(assert (=> start!96118 (=> (not res!727689) (not e!622919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96118 (= res!727689 (validMask!0 mask!1414))))

(assert (=> start!96118 e!622919))

(assert (=> start!96118 tp!80179))

(assert (=> start!96118 true))

(assert (=> start!96118 tp_is_empty!26779))

(declare-fun array_inv!26156 (array!70402) Bool)

(assert (=> start!96118 (array_inv!26156 _keys!1070)))

(declare-fun array_inv!26157 (array!70400) Bool)

(assert (=> start!96118 (and (array_inv!26157 _values!874) e!622925)))

(declare-fun b!1090697 () Bool)

(declare-fun res!727688 () Bool)

(assert (=> b!1090697 (=> (not res!727688) (not e!622919))))

(assert (=> b!1090697 (= res!727688 (= (select (arr!33875 _keys!1070) i!650) k0!904))))

(declare-fun b!1090698 () Bool)

(declare-fun e!622923 () Bool)

(assert (=> b!1090698 (= e!622919 e!622923)))

(declare-fun res!727690 () Bool)

(assert (=> b!1090698 (=> (not res!727690) (not e!622923))))

(declare-fun lt!486704 () array!70402)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70402 (_ BitVec 32)) Bool)

(assert (=> b!1090698 (= res!727690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486704 mask!1414))))

(assert (=> b!1090698 (= lt!486704 (array!70403 (store (arr!33875 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34413 _keys!1070)))))

(declare-fun b!1090699 () Bool)

(declare-fun e!622924 () Bool)

(assert (=> b!1090699 (= e!622923 (not e!622924))))

(declare-fun res!727692 () Bool)

(assert (=> b!1090699 (=> res!727692 e!622924)))

(assert (=> b!1090699 (= res!727692 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40833)

(declare-datatypes ((tuple2!17148 0))(
  ( (tuple2!17149 (_1!8585 (_ BitVec 64)) (_2!8585 V!40833)) )
))
(declare-datatypes ((List!23715 0))(
  ( (Nil!23712) (Cons!23711 (h!24920 tuple2!17148) (t!33541 List!23715)) )
))
(declare-datatypes ((ListLongMap!15117 0))(
  ( (ListLongMap!15118 (toList!7574 List!23715)) )
))
(declare-fun lt!486701 () ListLongMap!15117)

(declare-fun zeroValue!831 () V!40833)

(declare-fun getCurrentListMap!4244 (array!70402 array!70400 (_ BitVec 32) (_ BitVec 32) V!40833 V!40833 (_ BitVec 32) Int) ListLongMap!15117)

(assert (=> b!1090699 (= lt!486701 (getCurrentListMap!4244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486697 () ListLongMap!15117)

(declare-fun lt!486696 () array!70400)

(assert (=> b!1090699 (= lt!486697 (getCurrentListMap!4244 lt!486704 lt!486696 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486695 () ListLongMap!15117)

(declare-fun lt!486694 () ListLongMap!15117)

(assert (=> b!1090699 (and (= lt!486695 lt!486694) (= lt!486694 lt!486695))))

(declare-fun lt!486692 () ListLongMap!15117)

(declare-fun -!848 (ListLongMap!15117 (_ BitVec 64)) ListLongMap!15117)

(assert (=> b!1090699 (= lt!486694 (-!848 lt!486692 k0!904))))

(declare-datatypes ((Unit!35731 0))(
  ( (Unit!35732) )
))
(declare-fun lt!486703 () Unit!35731)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!128 (array!70402 array!70400 (_ BitVec 32) (_ BitVec 32) V!40833 V!40833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35731)

(assert (=> b!1090699 (= lt!486703 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!128 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4114 (array!70402 array!70400 (_ BitVec 32) (_ BitVec 32) V!40833 V!40833 (_ BitVec 32) Int) ListLongMap!15117)

(assert (=> b!1090699 (= lt!486695 (getCurrentListMapNoExtraKeys!4114 lt!486704 lt!486696 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2185 (Int (_ BitVec 64)) V!40833)

(assert (=> b!1090699 (= lt!486696 (array!70401 (store (arr!33874 _values!874) i!650 (ValueCellFull!12680 (dynLambda!2185 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34412 _values!874)))))

(assert (=> b!1090699 (= lt!486692 (getCurrentListMapNoExtraKeys!4114 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090699 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486700 () Unit!35731)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70402 (_ BitVec 64) (_ BitVec 32)) Unit!35731)

(assert (=> b!1090699 (= lt!486700 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090700 () Bool)

(declare-fun res!727685 () Bool)

(assert (=> b!1090700 (=> (not res!727685) (not e!622923))))

(assert (=> b!1090700 (= res!727685 (arrayNoDuplicates!0 lt!486704 #b00000000000000000000000000000000 Nil!23711))))

(declare-fun b!1090701 () Bool)

(declare-fun e!622921 () Bool)

(assert (=> b!1090701 (= e!622924 e!622921)))

(declare-fun res!727687 () Bool)

(assert (=> b!1090701 (=> res!727687 e!622921)))

(assert (=> b!1090701 (= res!727687 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!486698 () ListLongMap!15117)

(assert (=> b!1090701 (= lt!486701 lt!486698)))

(declare-fun lt!486699 () tuple2!17148)

(declare-fun +!3364 (ListLongMap!15117 tuple2!17148) ListLongMap!15117)

(assert (=> b!1090701 (= lt!486698 (+!3364 lt!486692 lt!486699))))

(declare-fun lt!486693 () ListLongMap!15117)

(assert (=> b!1090701 (= lt!486697 lt!486693)))

(assert (=> b!1090701 (= lt!486693 (+!3364 lt!486694 lt!486699))))

(assert (=> b!1090701 (= lt!486697 (+!3364 lt!486695 lt!486699))))

(assert (=> b!1090701 (= lt!486699 (tuple2!17149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090702 () Bool)

(declare-fun res!727686 () Bool)

(assert (=> b!1090702 (=> (not res!727686) (not e!622919))))

(assert (=> b!1090702 (= res!727686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090703 () Bool)

(assert (=> b!1090703 (= e!622921 true)))

(assert (=> b!1090703 (= (-!848 lt!486698 k0!904) lt!486693)))

(declare-fun lt!486702 () Unit!35731)

(declare-fun addRemoveCommutativeForDiffKeys!93 (ListLongMap!15117 (_ BitVec 64) V!40833 (_ BitVec 64)) Unit!35731)

(assert (=> b!1090703 (= lt!486702 (addRemoveCommutativeForDiffKeys!93 lt!486692 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapNonEmpty!41923 () Bool)

(declare-fun tp!80180 () Bool)

(assert (=> mapNonEmpty!41923 (= mapRes!41923 (and tp!80180 e!622920))))

(declare-fun mapKey!41923 () (_ BitVec 32))

(declare-fun mapValue!41923 () ValueCell!12680)

(declare-fun mapRest!41923 () (Array (_ BitVec 32) ValueCell!12680))

(assert (=> mapNonEmpty!41923 (= (arr!33874 _values!874) (store mapRest!41923 mapKey!41923 mapValue!41923))))

(assert (= (and start!96118 res!727689) b!1090696))

(assert (= (and b!1090696 res!727694) b!1090702))

(assert (= (and b!1090702 res!727686) b!1090695))

(assert (= (and b!1090695 res!727695) b!1090694))

(assert (= (and b!1090694 res!727693) b!1090690))

(assert (= (and b!1090690 res!727691) b!1090697))

(assert (= (and b!1090697 res!727688) b!1090698))

(assert (= (and b!1090698 res!727690) b!1090700))

(assert (= (and b!1090700 res!727685) b!1090699))

(assert (= (and b!1090699 (not res!727692)) b!1090701))

(assert (= (and b!1090701 (not res!727687)) b!1090703))

(assert (= (and b!1090691 condMapEmpty!41923) mapIsEmpty!41923))

(assert (= (and b!1090691 (not condMapEmpty!41923)) mapNonEmpty!41923))

(get-info :version)

(assert (= (and mapNonEmpty!41923 ((_ is ValueCellFull!12680) mapValue!41923)) b!1090692))

(assert (= (and b!1090691 ((_ is ValueCellFull!12680) mapDefault!41923)) b!1090693))

(assert (= start!96118 b!1090691))

(declare-fun b_lambda!17425 () Bool)

(assert (=> (not b_lambda!17425) (not b!1090699)))

(declare-fun t!33539 () Bool)

(declare-fun tb!7647 () Bool)

(assert (=> (and start!96118 (= defaultEntry!882 defaultEntry!882) t!33539) tb!7647))

(declare-fun result!15821 () Bool)

(assert (=> tb!7647 (= result!15821 tp_is_empty!26779)))

(assert (=> b!1090699 t!33539))

(declare-fun b_and!36205 () Bool)

(assert (= b_and!36203 (and (=> t!33539 result!15821) b_and!36205)))

(declare-fun m!1009697 () Bool)

(assert (=> b!1090702 m!1009697))

(declare-fun m!1009699 () Bool)

(assert (=> mapNonEmpty!41923 m!1009699))

(declare-fun m!1009701 () Bool)

(assert (=> start!96118 m!1009701))

(declare-fun m!1009703 () Bool)

(assert (=> start!96118 m!1009703))

(declare-fun m!1009705 () Bool)

(assert (=> start!96118 m!1009705))

(declare-fun m!1009707 () Bool)

(assert (=> b!1090698 m!1009707))

(declare-fun m!1009709 () Bool)

(assert (=> b!1090698 m!1009709))

(declare-fun m!1009711 () Bool)

(assert (=> b!1090690 m!1009711))

(declare-fun m!1009713 () Bool)

(assert (=> b!1090699 m!1009713))

(declare-fun m!1009715 () Bool)

(assert (=> b!1090699 m!1009715))

(declare-fun m!1009717 () Bool)

(assert (=> b!1090699 m!1009717))

(declare-fun m!1009719 () Bool)

(assert (=> b!1090699 m!1009719))

(declare-fun m!1009721 () Bool)

(assert (=> b!1090699 m!1009721))

(declare-fun m!1009723 () Bool)

(assert (=> b!1090699 m!1009723))

(declare-fun m!1009725 () Bool)

(assert (=> b!1090699 m!1009725))

(declare-fun m!1009727 () Bool)

(assert (=> b!1090699 m!1009727))

(declare-fun m!1009729 () Bool)

(assert (=> b!1090699 m!1009729))

(declare-fun m!1009731 () Bool)

(assert (=> b!1090699 m!1009731))

(declare-fun m!1009733 () Bool)

(assert (=> b!1090700 m!1009733))

(declare-fun m!1009735 () Bool)

(assert (=> b!1090697 m!1009735))

(declare-fun m!1009737 () Bool)

(assert (=> b!1090695 m!1009737))

(declare-fun m!1009739 () Bool)

(assert (=> b!1090701 m!1009739))

(declare-fun m!1009741 () Bool)

(assert (=> b!1090701 m!1009741))

(declare-fun m!1009743 () Bool)

(assert (=> b!1090701 m!1009743))

(declare-fun m!1009745 () Bool)

(assert (=> b!1090703 m!1009745))

(declare-fun m!1009747 () Bool)

(assert (=> b!1090703 m!1009747))

(check-sat (not b!1090700) (not b_lambda!17425) (not b!1090703) (not mapNonEmpty!41923) (not b_next!22777) (not b!1090690) tp_is_empty!26779 (not b!1090702) (not b!1090695) (not b!1090699) b_and!36205 (not start!96118) (not b!1090701) (not b!1090698))
(check-sat b_and!36205 (not b_next!22777))
