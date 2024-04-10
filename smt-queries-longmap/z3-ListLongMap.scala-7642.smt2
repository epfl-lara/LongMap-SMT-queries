; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96174 () Bool)

(assert start!96174)

(declare-fun b_free!22827 () Bool)

(declare-fun b_next!22827 () Bool)

(assert (=> start!96174 (= b_free!22827 (not b_next!22827))))

(declare-fun tp!80330 () Bool)

(declare-fun b_and!36329 () Bool)

(assert (=> start!96174 (= tp!80330 b_and!36329)))

(declare-fun res!728581 () Bool)

(declare-fun e!623612 () Bool)

(assert (=> start!96174 (=> (not res!728581) (not e!623612))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96174 (= res!728581 (validMask!0 mask!1414))))

(assert (=> start!96174 e!623612))

(assert (=> start!96174 tp!80330))

(assert (=> start!96174 true))

(declare-fun tp_is_empty!26829 () Bool)

(assert (=> start!96174 tp_is_empty!26829))

(declare-datatypes ((array!70577 0))(
  ( (array!70578 (arr!33962 (Array (_ BitVec 32) (_ BitVec 64))) (size!34498 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70577)

(declare-fun array_inv!26182 (array!70577) Bool)

(assert (=> start!96174 (array_inv!26182 _keys!1070)))

(declare-datatypes ((V!40899 0))(
  ( (V!40900 (val!13471 Int)) )
))
(declare-datatypes ((ValueCell!12705 0))(
  ( (ValueCellFull!12705 (v!16092 V!40899)) (EmptyCell!12705) )
))
(declare-datatypes ((array!70579 0))(
  ( (array!70580 (arr!33963 (Array (_ BitVec 32) ValueCell!12705)) (size!34499 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70579)

(declare-fun e!623614 () Bool)

(declare-fun array_inv!26183 (array!70579) Bool)

(assert (=> start!96174 (and (array_inv!26183 _values!874) e!623614)))

(declare-fun b!1091943 () Bool)

(declare-fun res!728587 () Bool)

(assert (=> b!1091943 (=> (not res!728587) (not e!623612))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091943 (= res!728587 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34498 _keys!1070))))))

(declare-fun b!1091944 () Bool)

(declare-fun res!728584 () Bool)

(assert (=> b!1091944 (=> (not res!728584) (not e!623612))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1091944 (= res!728584 (= (select (arr!33962 _keys!1070) i!650) k0!904))))

(declare-fun b!1091945 () Bool)

(declare-fun res!728589 () Bool)

(declare-fun e!623615 () Bool)

(assert (=> b!1091945 (=> (not res!728589) (not e!623615))))

(declare-fun lt!487867 () array!70577)

(declare-datatypes ((List!23722 0))(
  ( (Nil!23719) (Cons!23718 (h!24927 (_ BitVec 64)) (t!33607 List!23722)) )
))
(declare-fun arrayNoDuplicates!0 (array!70577 (_ BitVec 32) List!23722) Bool)

(assert (=> b!1091945 (= res!728589 (arrayNoDuplicates!0 lt!487867 #b00000000000000000000000000000000 Nil!23719))))

(declare-fun b!1091946 () Bool)

(declare-fun e!623618 () Bool)

(assert (=> b!1091946 (= e!623615 (not e!623618))))

(declare-fun res!728586 () Bool)

(assert (=> b!1091946 (=> res!728586 e!623618)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091946 (= res!728586 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40899)

(declare-datatypes ((tuple2!17138 0))(
  ( (tuple2!17139 (_1!8580 (_ BitVec 64)) (_2!8580 V!40899)) )
))
(declare-datatypes ((List!23723 0))(
  ( (Nil!23720) (Cons!23719 (h!24928 tuple2!17138) (t!33608 List!23723)) )
))
(declare-datatypes ((ListLongMap!15107 0))(
  ( (ListLongMap!15108 (toList!7569 List!23723)) )
))
(declare-fun lt!487870 () ListLongMap!15107)

(declare-fun zeroValue!831 () V!40899)

(declare-fun getCurrentListMap!4326 (array!70577 array!70579 (_ BitVec 32) (_ BitVec 32) V!40899 V!40899 (_ BitVec 32) Int) ListLongMap!15107)

(assert (=> b!1091946 (= lt!487870 (getCurrentListMap!4326 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487868 () array!70579)

(declare-fun lt!487879 () ListLongMap!15107)

(assert (=> b!1091946 (= lt!487879 (getCurrentListMap!4326 lt!487867 lt!487868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487871 () ListLongMap!15107)

(declare-fun lt!487876 () ListLongMap!15107)

(assert (=> b!1091946 (and (= lt!487871 lt!487876) (= lt!487876 lt!487871))))

(declare-fun lt!487878 () ListLongMap!15107)

(declare-fun -!889 (ListLongMap!15107 (_ BitVec 64)) ListLongMap!15107)

(assert (=> b!1091946 (= lt!487876 (-!889 lt!487878 k0!904))))

(declare-datatypes ((Unit!35944 0))(
  ( (Unit!35945) )
))
(declare-fun lt!487872 () Unit!35944)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!145 (array!70577 array!70579 (_ BitVec 32) (_ BitVec 32) V!40899 V!40899 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35944)

(assert (=> b!1091946 (= lt!487872 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!145 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4086 (array!70577 array!70579 (_ BitVec 32) (_ BitVec 32) V!40899 V!40899 (_ BitVec 32) Int) ListLongMap!15107)

(assert (=> b!1091946 (= lt!487871 (getCurrentListMapNoExtraKeys!4086 lt!487867 lt!487868 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2223 (Int (_ BitVec 64)) V!40899)

(assert (=> b!1091946 (= lt!487868 (array!70580 (store (arr!33963 _values!874) i!650 (ValueCellFull!12705 (dynLambda!2223 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34499 _values!874)))))

(assert (=> b!1091946 (= lt!487878 (getCurrentListMapNoExtraKeys!4086 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091946 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487875 () Unit!35944)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70577 (_ BitVec 64) (_ BitVec 32)) Unit!35944)

(assert (=> b!1091946 (= lt!487875 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091947 () Bool)

(declare-fun e!623617 () Bool)

(assert (=> b!1091947 (= e!623617 tp_is_empty!26829)))

(declare-fun b!1091948 () Bool)

(declare-fun res!728588 () Bool)

(assert (=> b!1091948 (=> (not res!728588) (not e!623612))))

(assert (=> b!1091948 (= res!728588 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23719))))

(declare-fun b!1091949 () Bool)

(declare-fun res!728579 () Bool)

(assert (=> b!1091949 (=> (not res!728579) (not e!623612))))

(assert (=> b!1091949 (= res!728579 (and (= (size!34499 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34498 _keys!1070) (size!34499 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091950 () Bool)

(declare-fun e!623611 () Bool)

(assert (=> b!1091950 (= e!623611 true)))

(declare-fun lt!487874 () ListLongMap!15107)

(declare-fun lt!487873 () ListLongMap!15107)

(assert (=> b!1091950 (= (-!889 lt!487874 k0!904) lt!487873)))

(declare-fun lt!487877 () Unit!35944)

(declare-fun addRemoveCommutativeForDiffKeys!110 (ListLongMap!15107 (_ BitVec 64) V!40899 (_ BitVec 64)) Unit!35944)

(assert (=> b!1091950 (= lt!487877 (addRemoveCommutativeForDiffKeys!110 lt!487878 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091951 () Bool)

(assert (=> b!1091951 (= e!623612 e!623615)))

(declare-fun res!728583 () Bool)

(assert (=> b!1091951 (=> (not res!728583) (not e!623615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70577 (_ BitVec 32)) Bool)

(assert (=> b!1091951 (= res!728583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487867 mask!1414))))

(assert (=> b!1091951 (= lt!487867 (array!70578 (store (arr!33962 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34498 _keys!1070)))))

(declare-fun mapIsEmpty!41998 () Bool)

(declare-fun mapRes!41998 () Bool)

(assert (=> mapIsEmpty!41998 mapRes!41998))

(declare-fun b!1091952 () Bool)

(assert (=> b!1091952 (= e!623614 (and e!623617 mapRes!41998))))

(declare-fun condMapEmpty!41998 () Bool)

(declare-fun mapDefault!41998 () ValueCell!12705)

(assert (=> b!1091952 (= condMapEmpty!41998 (= (arr!33963 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12705)) mapDefault!41998)))))

(declare-fun b!1091953 () Bool)

(assert (=> b!1091953 (= e!623618 e!623611)))

(declare-fun res!728580 () Bool)

(assert (=> b!1091953 (=> res!728580 e!623611)))

(assert (=> b!1091953 (= res!728580 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1091953 (= lt!487870 lt!487874)))

(declare-fun lt!487869 () tuple2!17138)

(declare-fun +!3350 (ListLongMap!15107 tuple2!17138) ListLongMap!15107)

(assert (=> b!1091953 (= lt!487874 (+!3350 lt!487878 lt!487869))))

(assert (=> b!1091953 (= lt!487879 lt!487873)))

(assert (=> b!1091953 (= lt!487873 (+!3350 lt!487876 lt!487869))))

(assert (=> b!1091953 (= lt!487879 (+!3350 lt!487871 lt!487869))))

(assert (=> b!1091953 (= lt!487869 (tuple2!17139 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091954 () Bool)

(declare-fun res!728585 () Bool)

(assert (=> b!1091954 (=> (not res!728585) (not e!623612))))

(assert (=> b!1091954 (= res!728585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41998 () Bool)

(declare-fun tp!80329 () Bool)

(declare-fun e!623616 () Bool)

(assert (=> mapNonEmpty!41998 (= mapRes!41998 (and tp!80329 e!623616))))

(declare-fun mapValue!41998 () ValueCell!12705)

(declare-fun mapKey!41998 () (_ BitVec 32))

(declare-fun mapRest!41998 () (Array (_ BitVec 32) ValueCell!12705))

(assert (=> mapNonEmpty!41998 (= (arr!33963 _values!874) (store mapRest!41998 mapKey!41998 mapValue!41998))))

(declare-fun b!1091955 () Bool)

(assert (=> b!1091955 (= e!623616 tp_is_empty!26829)))

(declare-fun b!1091956 () Bool)

(declare-fun res!728582 () Bool)

(assert (=> b!1091956 (=> (not res!728582) (not e!623612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091956 (= res!728582 (validKeyInArray!0 k0!904))))

(assert (= (and start!96174 res!728581) b!1091949))

(assert (= (and b!1091949 res!728579) b!1091954))

(assert (= (and b!1091954 res!728585) b!1091948))

(assert (= (and b!1091948 res!728588) b!1091943))

(assert (= (and b!1091943 res!728587) b!1091956))

(assert (= (and b!1091956 res!728582) b!1091944))

(assert (= (and b!1091944 res!728584) b!1091951))

(assert (= (and b!1091951 res!728583) b!1091945))

(assert (= (and b!1091945 res!728589) b!1091946))

(assert (= (and b!1091946 (not res!728586)) b!1091953))

(assert (= (and b!1091953 (not res!728580)) b!1091950))

(assert (= (and b!1091952 condMapEmpty!41998) mapIsEmpty!41998))

(assert (= (and b!1091952 (not condMapEmpty!41998)) mapNonEmpty!41998))

(get-info :version)

(assert (= (and mapNonEmpty!41998 ((_ is ValueCellFull!12705) mapValue!41998)) b!1091955))

(assert (= (and b!1091952 ((_ is ValueCellFull!12705) mapDefault!41998)) b!1091947))

(assert (= start!96174 b!1091952))

(declare-fun b_lambda!17497 () Bool)

(assert (=> (not b_lambda!17497) (not b!1091946)))

(declare-fun t!33606 () Bool)

(declare-fun tb!7705 () Bool)

(assert (=> (and start!96174 (= defaultEntry!882 defaultEntry!882) t!33606) tb!7705))

(declare-fun result!15929 () Bool)

(assert (=> tb!7705 (= result!15929 tp_is_empty!26829)))

(assert (=> b!1091946 t!33606))

(declare-fun b_and!36331 () Bool)

(assert (= b_and!36329 (and (=> t!33606 result!15929) b_and!36331)))

(declare-fun m!1011623 () Bool)

(assert (=> b!1091951 m!1011623))

(declare-fun m!1011625 () Bool)

(assert (=> b!1091951 m!1011625))

(declare-fun m!1011627 () Bool)

(assert (=> b!1091948 m!1011627))

(declare-fun m!1011629 () Bool)

(assert (=> b!1091953 m!1011629))

(declare-fun m!1011631 () Bool)

(assert (=> b!1091953 m!1011631))

(declare-fun m!1011633 () Bool)

(assert (=> b!1091953 m!1011633))

(declare-fun m!1011635 () Bool)

(assert (=> b!1091956 m!1011635))

(declare-fun m!1011637 () Bool)

(assert (=> b!1091954 m!1011637))

(declare-fun m!1011639 () Bool)

(assert (=> start!96174 m!1011639))

(declare-fun m!1011641 () Bool)

(assert (=> start!96174 m!1011641))

(declare-fun m!1011643 () Bool)

(assert (=> start!96174 m!1011643))

(declare-fun m!1011645 () Bool)

(assert (=> b!1091950 m!1011645))

(declare-fun m!1011647 () Bool)

(assert (=> b!1091950 m!1011647))

(declare-fun m!1011649 () Bool)

(assert (=> mapNonEmpty!41998 m!1011649))

(declare-fun m!1011651 () Bool)

(assert (=> b!1091946 m!1011651))

(declare-fun m!1011653 () Bool)

(assert (=> b!1091946 m!1011653))

(declare-fun m!1011655 () Bool)

(assert (=> b!1091946 m!1011655))

(declare-fun m!1011657 () Bool)

(assert (=> b!1091946 m!1011657))

(declare-fun m!1011659 () Bool)

(assert (=> b!1091946 m!1011659))

(declare-fun m!1011661 () Bool)

(assert (=> b!1091946 m!1011661))

(declare-fun m!1011663 () Bool)

(assert (=> b!1091946 m!1011663))

(declare-fun m!1011665 () Bool)

(assert (=> b!1091946 m!1011665))

(declare-fun m!1011667 () Bool)

(assert (=> b!1091946 m!1011667))

(declare-fun m!1011669 () Bool)

(assert (=> b!1091946 m!1011669))

(declare-fun m!1011671 () Bool)

(assert (=> b!1091945 m!1011671))

(declare-fun m!1011673 () Bool)

(assert (=> b!1091944 m!1011673))

(check-sat (not b!1091946) tp_is_empty!26829 (not b_lambda!17497) (not start!96174) (not b!1091953) (not b!1091950) (not mapNonEmpty!41998) (not b_next!22827) (not b!1091948) (not b!1091951) (not b!1091956) (not b!1091945) (not b!1091954) b_and!36331)
(check-sat b_and!36331 (not b_next!22827))
