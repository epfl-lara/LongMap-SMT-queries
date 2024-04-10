; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96060 () Bool)

(assert start!96060)

(declare-fun b_free!22713 () Bool)

(declare-fun b_next!22713 () Bool)

(assert (=> start!96060 (= b_free!22713 (not b_next!22713))))

(declare-fun tp!79988 () Bool)

(declare-fun b_and!36101 () Bool)

(assert (=> start!96060 (= tp!79988 b_and!36101)))

(declare-fun b!1089426 () Bool)

(declare-fun res!726692 () Bool)

(declare-fun e!622247 () Bool)

(assert (=> b!1089426 (=> (not res!726692) (not e!622247))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70353 0))(
  ( (array!70354 (arr!33850 (Array (_ BitVec 32) (_ BitVec 64))) (size!34386 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70353)

(assert (=> b!1089426 (= res!726692 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34386 _keys!1070))))))

(declare-fun b!1089427 () Bool)

(declare-fun res!726696 () Bool)

(assert (=> b!1089427 (=> (not res!726696) (not e!622247))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40747 0))(
  ( (V!40748 (val!13414 Int)) )
))
(declare-datatypes ((ValueCell!12648 0))(
  ( (ValueCellFull!12648 (v!16035 V!40747)) (EmptyCell!12648) )
))
(declare-datatypes ((array!70355 0))(
  ( (array!70356 (arr!33851 (Array (_ BitVec 32) ValueCell!12648)) (size!34387 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70355)

(declare-fun mask!1414 () (_ BitVec 32))

(assert (=> b!1089427 (= res!726696 (and (= (size!34387 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34386 _keys!1070) (size!34387 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!726695 () Bool)

(assert (=> start!96060 (=> (not res!726695) (not e!622247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96060 (= res!726695 (validMask!0 mask!1414))))

(assert (=> start!96060 e!622247))

(assert (=> start!96060 tp!79988))

(assert (=> start!96060 true))

(declare-fun tp_is_empty!26715 () Bool)

(assert (=> start!96060 tp_is_empty!26715))

(declare-fun array_inv!26108 (array!70353) Bool)

(assert (=> start!96060 (array_inv!26108 _keys!1070)))

(declare-fun e!622249 () Bool)

(declare-fun array_inv!26109 (array!70355) Bool)

(assert (=> start!96060 (and (array_inv!26109 _values!874) e!622249)))

(declare-fun b!1089428 () Bool)

(declare-fun e!622250 () Bool)

(assert (=> b!1089428 (= e!622250 tp_is_empty!26715)))

(declare-fun mapNonEmpty!41827 () Bool)

(declare-fun mapRes!41827 () Bool)

(declare-fun tp!79987 () Bool)

(declare-fun e!622244 () Bool)

(assert (=> mapNonEmpty!41827 (= mapRes!41827 (and tp!79987 e!622244))))

(declare-fun mapValue!41827 () ValueCell!12648)

(declare-fun mapKey!41827 () (_ BitVec 32))

(declare-fun mapRest!41827 () (Array (_ BitVec 32) ValueCell!12648))

(assert (=> mapNonEmpty!41827 (= (arr!33851 _values!874) (store mapRest!41827 mapKey!41827 mapValue!41827))))

(declare-fun b!1089429 () Bool)

(declare-fun e!622246 () Bool)

(declare-fun e!622248 () Bool)

(assert (=> b!1089429 (= e!622246 (not e!622248))))

(declare-fun res!726697 () Bool)

(assert (=> b!1089429 (=> res!726697 e!622248)))

(assert (=> b!1089429 (= res!726697 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun minValue!831 () V!40747)

(declare-datatypes ((tuple2!17040 0))(
  ( (tuple2!17041 (_1!8531 (_ BitVec 64)) (_2!8531 V!40747)) )
))
(declare-datatypes ((List!23629 0))(
  ( (Nil!23626) (Cons!23625 (h!24834 tuple2!17040) (t!33400 List!23629)) )
))
(declare-datatypes ((ListLongMap!15009 0))(
  ( (ListLongMap!15010 (toList!7520 List!23629)) )
))
(declare-fun lt!485676 () ListLongMap!15009)

(declare-fun zeroValue!831 () V!40747)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4291 (array!70353 array!70355 (_ BitVec 32) (_ BitVec 32) V!40747 V!40747 (_ BitVec 32) Int) ListLongMap!15009)

(assert (=> b!1089429 (= lt!485676 (getCurrentListMap!4291 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485671 () array!70355)

(declare-fun lt!485677 () array!70353)

(declare-fun lt!485681 () ListLongMap!15009)

(assert (=> b!1089429 (= lt!485681 (getCurrentListMap!4291 lt!485677 lt!485671 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485683 () ListLongMap!15009)

(declare-fun lt!485680 () ListLongMap!15009)

(assert (=> b!1089429 (and (= lt!485683 lt!485680) (= lt!485680 lt!485683))))

(declare-fun lt!485673 () ListLongMap!15009)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!845 (ListLongMap!15009 (_ BitVec 64)) ListLongMap!15009)

(assert (=> b!1089429 (= lt!485680 (-!845 lt!485673 k0!904))))

(declare-datatypes ((Unit!35856 0))(
  ( (Unit!35857) )
))
(declare-fun lt!485682 () Unit!35856)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!110 (array!70353 array!70355 (_ BitVec 32) (_ BitVec 32) V!40747 V!40747 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35856)

(assert (=> b!1089429 (= lt!485682 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!110 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4051 (array!70353 array!70355 (_ BitVec 32) (_ BitVec 32) V!40747 V!40747 (_ BitVec 32) Int) ListLongMap!15009)

(assert (=> b!1089429 (= lt!485683 (getCurrentListMapNoExtraKeys!4051 lt!485677 lt!485671 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2188 (Int (_ BitVec 64)) V!40747)

(assert (=> b!1089429 (= lt!485671 (array!70356 (store (arr!33851 _values!874) i!650 (ValueCellFull!12648 (dynLambda!2188 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34387 _values!874)))))

(assert (=> b!1089429 (= lt!485673 (getCurrentListMapNoExtraKeys!4051 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089429 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485678 () Unit!35856)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70353 (_ BitVec 64) (_ BitVec 32)) Unit!35856)

(assert (=> b!1089429 (= lt!485678 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089430 () Bool)

(assert (=> b!1089430 (= e!622244 tp_is_empty!26715)))

(declare-fun b!1089431 () Bool)

(declare-fun res!726699 () Bool)

(assert (=> b!1089431 (=> (not res!726699) (not e!622247))))

(assert (=> b!1089431 (= res!726699 (= (select (arr!33850 _keys!1070) i!650) k0!904))))

(declare-fun b!1089432 () Bool)

(declare-fun res!726690 () Bool)

(assert (=> b!1089432 (=> (not res!726690) (not e!622247))))

(declare-datatypes ((List!23630 0))(
  ( (Nil!23627) (Cons!23626 (h!24835 (_ BitVec 64)) (t!33401 List!23630)) )
))
(declare-fun arrayNoDuplicates!0 (array!70353 (_ BitVec 32) List!23630) Bool)

(assert (=> b!1089432 (= res!726690 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23627))))

(declare-fun b!1089433 () Bool)

(declare-fun res!726689 () Bool)

(assert (=> b!1089433 (=> (not res!726689) (not e!622247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70353 (_ BitVec 32)) Bool)

(assert (=> b!1089433 (= res!726689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41827 () Bool)

(assert (=> mapIsEmpty!41827 mapRes!41827))

(declare-fun b!1089434 () Bool)

(declare-fun e!622243 () Bool)

(assert (=> b!1089434 (= e!622243 true)))

(declare-fun lt!485679 () ListLongMap!15009)

(declare-fun lt!485675 () ListLongMap!15009)

(assert (=> b!1089434 (= (-!845 lt!485679 k0!904) lt!485675)))

(declare-fun lt!485674 () Unit!35856)

(declare-fun addRemoveCommutativeForDiffKeys!73 (ListLongMap!15009 (_ BitVec 64) V!40747 (_ BitVec 64)) Unit!35856)

(assert (=> b!1089434 (= lt!485674 (addRemoveCommutativeForDiffKeys!73 lt!485673 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089435 () Bool)

(assert (=> b!1089435 (= e!622247 e!622246)))

(declare-fun res!726694 () Bool)

(assert (=> b!1089435 (=> (not res!726694) (not e!622246))))

(assert (=> b!1089435 (= res!726694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485677 mask!1414))))

(assert (=> b!1089435 (= lt!485677 (array!70354 (store (arr!33850 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34386 _keys!1070)))))

(declare-fun b!1089436 () Bool)

(assert (=> b!1089436 (= e!622249 (and e!622250 mapRes!41827))))

(declare-fun condMapEmpty!41827 () Bool)

(declare-fun mapDefault!41827 () ValueCell!12648)

(assert (=> b!1089436 (= condMapEmpty!41827 (= (arr!33851 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12648)) mapDefault!41827)))))

(declare-fun b!1089437 () Bool)

(assert (=> b!1089437 (= e!622248 e!622243)))

(declare-fun res!726691 () Bool)

(assert (=> b!1089437 (=> res!726691 e!622243)))

(assert (=> b!1089437 (= res!726691 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1089437 (= lt!485681 lt!485675)))

(declare-fun lt!485672 () tuple2!17040)

(declare-fun +!3315 (ListLongMap!15009 tuple2!17040) ListLongMap!15009)

(assert (=> b!1089437 (= lt!485675 (+!3315 lt!485680 lt!485672))))

(assert (=> b!1089437 (= lt!485676 lt!485679)))

(assert (=> b!1089437 (= lt!485679 (+!3315 lt!485673 lt!485672))))

(assert (=> b!1089437 (= lt!485681 (+!3315 lt!485683 lt!485672))))

(assert (=> b!1089437 (= lt!485672 (tuple2!17041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089438 () Bool)

(declare-fun res!726693 () Bool)

(assert (=> b!1089438 (=> (not res!726693) (not e!622246))))

(assert (=> b!1089438 (= res!726693 (arrayNoDuplicates!0 lt!485677 #b00000000000000000000000000000000 Nil!23627))))

(declare-fun b!1089439 () Bool)

(declare-fun res!726698 () Bool)

(assert (=> b!1089439 (=> (not res!726698) (not e!622247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089439 (= res!726698 (validKeyInArray!0 k0!904))))

(assert (= (and start!96060 res!726695) b!1089427))

(assert (= (and b!1089427 res!726696) b!1089433))

(assert (= (and b!1089433 res!726689) b!1089432))

(assert (= (and b!1089432 res!726690) b!1089426))

(assert (= (and b!1089426 res!726692) b!1089439))

(assert (= (and b!1089439 res!726698) b!1089431))

(assert (= (and b!1089431 res!726699) b!1089435))

(assert (= (and b!1089435 res!726694) b!1089438))

(assert (= (and b!1089438 res!726693) b!1089429))

(assert (= (and b!1089429 (not res!726697)) b!1089437))

(assert (= (and b!1089437 (not res!726691)) b!1089434))

(assert (= (and b!1089436 condMapEmpty!41827) mapIsEmpty!41827))

(assert (= (and b!1089436 (not condMapEmpty!41827)) mapNonEmpty!41827))

(get-info :version)

(assert (= (and mapNonEmpty!41827 ((_ is ValueCellFull!12648) mapValue!41827)) b!1089430))

(assert (= (and b!1089436 ((_ is ValueCellFull!12648) mapDefault!41827)) b!1089428))

(assert (= start!96060 b!1089436))

(declare-fun b_lambda!17383 () Bool)

(assert (=> (not b_lambda!17383) (not b!1089429)))

(declare-fun t!33399 () Bool)

(declare-fun tb!7591 () Bool)

(assert (=> (and start!96060 (= defaultEntry!882 defaultEntry!882) t!33399) tb!7591))

(declare-fun result!15701 () Bool)

(assert (=> tb!7591 (= result!15701 tp_is_empty!26715)))

(assert (=> b!1089429 t!33399))

(declare-fun b_and!36103 () Bool)

(assert (= b_and!36101 (and (=> t!33399 result!15701) b_and!36103)))

(declare-fun m!1008671 () Bool)

(assert (=> b!1089437 m!1008671))

(declare-fun m!1008673 () Bool)

(assert (=> b!1089437 m!1008673))

(declare-fun m!1008675 () Bool)

(assert (=> b!1089437 m!1008675))

(declare-fun m!1008677 () Bool)

(assert (=> b!1089429 m!1008677))

(declare-fun m!1008679 () Bool)

(assert (=> b!1089429 m!1008679))

(declare-fun m!1008681 () Bool)

(assert (=> b!1089429 m!1008681))

(declare-fun m!1008683 () Bool)

(assert (=> b!1089429 m!1008683))

(declare-fun m!1008685 () Bool)

(assert (=> b!1089429 m!1008685))

(declare-fun m!1008687 () Bool)

(assert (=> b!1089429 m!1008687))

(declare-fun m!1008689 () Bool)

(assert (=> b!1089429 m!1008689))

(declare-fun m!1008691 () Bool)

(assert (=> b!1089429 m!1008691))

(declare-fun m!1008693 () Bool)

(assert (=> b!1089429 m!1008693))

(declare-fun m!1008695 () Bool)

(assert (=> b!1089429 m!1008695))

(declare-fun m!1008697 () Bool)

(assert (=> b!1089433 m!1008697))

(declare-fun m!1008699 () Bool)

(assert (=> b!1089435 m!1008699))

(declare-fun m!1008701 () Bool)

(assert (=> b!1089435 m!1008701))

(declare-fun m!1008703 () Bool)

(assert (=> b!1089431 m!1008703))

(declare-fun m!1008705 () Bool)

(assert (=> start!96060 m!1008705))

(declare-fun m!1008707 () Bool)

(assert (=> start!96060 m!1008707))

(declare-fun m!1008709 () Bool)

(assert (=> start!96060 m!1008709))

(declare-fun m!1008711 () Bool)

(assert (=> b!1089434 m!1008711))

(declare-fun m!1008713 () Bool)

(assert (=> b!1089434 m!1008713))

(declare-fun m!1008715 () Bool)

(assert (=> b!1089432 m!1008715))

(declare-fun m!1008717 () Bool)

(assert (=> b!1089439 m!1008717))

(declare-fun m!1008719 () Bool)

(assert (=> mapNonEmpty!41827 m!1008719))

(declare-fun m!1008721 () Bool)

(assert (=> b!1089438 m!1008721))

(check-sat (not b!1089429) (not b!1089439) (not b_next!22713) (not b!1089435) (not b!1089432) (not b!1089433) (not b!1089438) tp_is_empty!26715 (not mapNonEmpty!41827) (not start!96060) (not b_lambda!17383) (not b!1089434) (not b!1089437) b_and!36103)
(check-sat b_and!36103 (not b_next!22713))
