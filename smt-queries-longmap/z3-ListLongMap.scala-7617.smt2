; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96258 () Bool)

(assert start!96258)

(declare-fun b_free!22675 () Bool)

(declare-fun b_next!22675 () Bool)

(assert (=> start!96258 (= b_free!22675 (not b_next!22675))))

(declare-fun tp!79874 () Bool)

(declare-fun b_and!36035 () Bool)

(assert (=> start!96258 (= tp!79874 b_and!36035)))

(declare-fun b!1089917 () Bool)

(declare-fun res!726586 () Bool)

(declare-fun e!622644 () Bool)

(assert (=> b!1089917 (=> (not res!726586) (not e!622644))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089917 (= res!726586 (validKeyInArray!0 k0!904))))

(declare-fun b!1089918 () Bool)

(declare-fun e!622646 () Bool)

(assert (=> b!1089918 (= e!622646 true)))

(declare-datatypes ((V!40697 0))(
  ( (V!40698 (val!13395 Int)) )
))
(declare-datatypes ((tuple2!17022 0))(
  ( (tuple2!17023 (_1!8522 (_ BitVec 64)) (_2!8522 V!40697)) )
))
(declare-datatypes ((List!23615 0))(
  ( (Nil!23612) (Cons!23611 (h!24829 tuple2!17022) (t!33340 List!23615)) )
))
(declare-datatypes ((ListLongMap!14999 0))(
  ( (ListLongMap!15000 (toList!7515 List!23615)) )
))
(declare-fun lt!485453 () ListLongMap!14999)

(declare-fun lt!485445 () ListLongMap!14999)

(declare-fun -!826 (ListLongMap!14999 (_ BitVec 64)) ListLongMap!14999)

(assert (=> b!1089918 (= (-!826 lt!485453 k0!904) lt!485445)))

(declare-fun lt!485457 () ListLongMap!14999)

(declare-datatypes ((Unit!35819 0))(
  ( (Unit!35820) )
))
(declare-fun lt!485449 () Unit!35819)

(declare-fun zeroValue!831 () V!40697)

(declare-fun addRemoveCommutativeForDiffKeys!64 (ListLongMap!14999 (_ BitVec 64) V!40697 (_ BitVec 64)) Unit!35819)

(assert (=> b!1089918 (= lt!485449 (addRemoveCommutativeForDiffKeys!64 lt!485457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089919 () Bool)

(declare-fun e!622649 () Bool)

(declare-fun e!622648 () Bool)

(assert (=> b!1089919 (= e!622649 (not e!622648))))

(declare-fun res!726593 () Bool)

(assert (=> b!1089919 (=> res!726593 e!622648)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089919 (= res!726593 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40697)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun lt!485456 () ListLongMap!14999)

(declare-datatypes ((array!70319 0))(
  ( (array!70320 (arr!33827 (Array (_ BitVec 32) (_ BitVec 64))) (size!34364 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70319)

(declare-datatypes ((ValueCell!12629 0))(
  ( (ValueCellFull!12629 (v!16012 V!40697)) (EmptyCell!12629) )
))
(declare-datatypes ((array!70321 0))(
  ( (array!70322 (arr!33828 (Array (_ BitVec 32) ValueCell!12629)) (size!34365 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70321)

(declare-fun getCurrentListMap!4274 (array!70319 array!70321 (_ BitVec 32) (_ BitVec 32) V!40697 V!40697 (_ BitVec 32) Int) ListLongMap!14999)

(assert (=> b!1089919 (= lt!485456 (getCurrentListMap!4274 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485452 () array!70321)

(declare-fun lt!485455 () array!70319)

(declare-fun lt!485447 () ListLongMap!14999)

(assert (=> b!1089919 (= lt!485447 (getCurrentListMap!4274 lt!485455 lt!485452 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485451 () ListLongMap!14999)

(declare-fun lt!485450 () ListLongMap!14999)

(assert (=> b!1089919 (and (= lt!485451 lt!485450) (= lt!485450 lt!485451))))

(assert (=> b!1089919 (= lt!485450 (-!826 lt!485457 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!485454 () Unit!35819)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!103 (array!70319 array!70321 (_ BitVec 32) (_ BitVec 32) V!40697 V!40697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35819)

(assert (=> b!1089919 (= lt!485454 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!103 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4079 (array!70319 array!70321 (_ BitVec 32) (_ BitVec 32) V!40697 V!40697 (_ BitVec 32) Int) ListLongMap!14999)

(assert (=> b!1089919 (= lt!485451 (getCurrentListMapNoExtraKeys!4079 lt!485455 lt!485452 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2200 (Int (_ BitVec 64)) V!40697)

(assert (=> b!1089919 (= lt!485452 (array!70322 (store (arr!33828 _values!874) i!650 (ValueCellFull!12629 (dynLambda!2200 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34365 _values!874)))))

(assert (=> b!1089919 (= lt!485457 (getCurrentListMapNoExtraKeys!4079 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089919 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485448 () Unit!35819)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70319 (_ BitVec 64) (_ BitVec 32)) Unit!35819)

(assert (=> b!1089919 (= lt!485448 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41770 () Bool)

(declare-fun mapRes!41770 () Bool)

(declare-fun tp!79873 () Bool)

(declare-fun e!622645 () Bool)

(assert (=> mapNonEmpty!41770 (= mapRes!41770 (and tp!79873 e!622645))))

(declare-fun mapValue!41770 () ValueCell!12629)

(declare-fun mapKey!41770 () (_ BitVec 32))

(declare-fun mapRest!41770 () (Array (_ BitVec 32) ValueCell!12629))

(assert (=> mapNonEmpty!41770 (= (arr!33828 _values!874) (store mapRest!41770 mapKey!41770 mapValue!41770))))

(declare-fun b!1089920 () Bool)

(declare-fun e!622647 () Bool)

(declare-fun e!622642 () Bool)

(assert (=> b!1089920 (= e!622647 (and e!622642 mapRes!41770))))

(declare-fun condMapEmpty!41770 () Bool)

(declare-fun mapDefault!41770 () ValueCell!12629)

(assert (=> b!1089920 (= condMapEmpty!41770 (= (arr!33828 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12629)) mapDefault!41770)))))

(declare-fun b!1089922 () Bool)

(declare-fun res!726590 () Bool)

(assert (=> b!1089922 (=> (not res!726590) (not e!622644))))

(assert (=> b!1089922 (= res!726590 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34364 _keys!1070))))))

(declare-fun b!1089923 () Bool)

(declare-fun res!726591 () Bool)

(assert (=> b!1089923 (=> (not res!726591) (not e!622649))))

(declare-datatypes ((List!23616 0))(
  ( (Nil!23613) (Cons!23612 (h!24830 (_ BitVec 64)) (t!33341 List!23616)) )
))
(declare-fun arrayNoDuplicates!0 (array!70319 (_ BitVec 32) List!23616) Bool)

(assert (=> b!1089923 (= res!726591 (arrayNoDuplicates!0 lt!485455 #b00000000000000000000000000000000 Nil!23613))))

(declare-fun b!1089924 () Bool)

(assert (=> b!1089924 (= e!622644 e!622649)))

(declare-fun res!726584 () Bool)

(assert (=> b!1089924 (=> (not res!726584) (not e!622649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70319 (_ BitVec 32)) Bool)

(assert (=> b!1089924 (= res!726584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485455 mask!1414))))

(assert (=> b!1089924 (= lt!485455 (array!70320 (store (arr!33827 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34364 _keys!1070)))))

(declare-fun b!1089925 () Bool)

(declare-fun res!726592 () Bool)

(assert (=> b!1089925 (=> (not res!726592) (not e!622644))))

(assert (=> b!1089925 (= res!726592 (and (= (size!34365 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34364 _keys!1070) (size!34365 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089926 () Bool)

(assert (=> b!1089926 (= e!622648 e!622646)))

(declare-fun res!726589 () Bool)

(assert (=> b!1089926 (=> res!726589 e!622646)))

(assert (=> b!1089926 (= res!726589 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1089926 (= lt!485447 lt!485445)))

(declare-fun lt!485446 () tuple2!17022)

(declare-fun +!3334 (ListLongMap!14999 tuple2!17022) ListLongMap!14999)

(assert (=> b!1089926 (= lt!485445 (+!3334 lt!485450 lt!485446))))

(assert (=> b!1089926 (= lt!485456 lt!485453)))

(assert (=> b!1089926 (= lt!485453 (+!3334 lt!485457 lt!485446))))

(assert (=> b!1089926 (= lt!485447 (+!3334 lt!485451 lt!485446))))

(assert (=> b!1089926 (= lt!485446 (tuple2!17023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089927 () Bool)

(declare-fun res!726594 () Bool)

(assert (=> b!1089927 (=> (not res!726594) (not e!622644))))

(assert (=> b!1089927 (= res!726594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089928 () Bool)

(declare-fun tp_is_empty!26677 () Bool)

(assert (=> b!1089928 (= e!622642 tp_is_empty!26677)))

(declare-fun b!1089929 () Bool)

(declare-fun res!726588 () Bool)

(assert (=> b!1089929 (=> (not res!726588) (not e!622644))))

(assert (=> b!1089929 (= res!726588 (= (select (arr!33827 _keys!1070) i!650) k0!904))))

(declare-fun res!726587 () Bool)

(assert (=> start!96258 (=> (not res!726587) (not e!622644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96258 (= res!726587 (validMask!0 mask!1414))))

(assert (=> start!96258 e!622644))

(assert (=> start!96258 tp!79874))

(assert (=> start!96258 true))

(assert (=> start!96258 tp_is_empty!26677))

(declare-fun array_inv!26136 (array!70319) Bool)

(assert (=> start!96258 (array_inv!26136 _keys!1070)))

(declare-fun array_inv!26137 (array!70321) Bool)

(assert (=> start!96258 (and (array_inv!26137 _values!874) e!622647)))

(declare-fun b!1089921 () Bool)

(declare-fun res!726585 () Bool)

(assert (=> b!1089921 (=> (not res!726585) (not e!622644))))

(assert (=> b!1089921 (= res!726585 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23613))))

(declare-fun mapIsEmpty!41770 () Bool)

(assert (=> mapIsEmpty!41770 mapRes!41770))

(declare-fun b!1089930 () Bool)

(assert (=> b!1089930 (= e!622645 tp_is_empty!26677)))

(assert (= (and start!96258 res!726587) b!1089925))

(assert (= (and b!1089925 res!726592) b!1089927))

(assert (= (and b!1089927 res!726594) b!1089921))

(assert (= (and b!1089921 res!726585) b!1089922))

(assert (= (and b!1089922 res!726590) b!1089917))

(assert (= (and b!1089917 res!726586) b!1089929))

(assert (= (and b!1089929 res!726588) b!1089924))

(assert (= (and b!1089924 res!726584) b!1089923))

(assert (= (and b!1089923 res!726591) b!1089919))

(assert (= (and b!1089919 (not res!726593)) b!1089926))

(assert (= (and b!1089926 (not res!726589)) b!1089918))

(assert (= (and b!1089920 condMapEmpty!41770) mapIsEmpty!41770))

(assert (= (and b!1089920 (not condMapEmpty!41770)) mapNonEmpty!41770))

(get-info :version)

(assert (= (and mapNonEmpty!41770 ((_ is ValueCellFull!12629) mapValue!41770)) b!1089930))

(assert (= (and b!1089920 ((_ is ValueCellFull!12629) mapDefault!41770)) b!1089928))

(assert (= start!96258 b!1089920))

(declare-fun b_lambda!17355 () Bool)

(assert (=> (not b_lambda!17355) (not b!1089919)))

(declare-fun t!33339 () Bool)

(declare-fun tb!7545 () Bool)

(assert (=> (and start!96258 (= defaultEntry!882 defaultEntry!882) t!33339) tb!7545))

(declare-fun result!15617 () Bool)

(assert (=> tb!7545 (= result!15617 tp_is_empty!26677)))

(assert (=> b!1089919 t!33339))

(declare-fun b_and!36037 () Bool)

(assert (= b_and!36035 (and (=> t!33339 result!15617) b_and!36037)))

(declare-fun m!1009355 () Bool)

(assert (=> b!1089924 m!1009355))

(declare-fun m!1009357 () Bool)

(assert (=> b!1089924 m!1009357))

(declare-fun m!1009359 () Bool)

(assert (=> b!1089926 m!1009359))

(declare-fun m!1009361 () Bool)

(assert (=> b!1089926 m!1009361))

(declare-fun m!1009363 () Bool)

(assert (=> b!1089926 m!1009363))

(declare-fun m!1009365 () Bool)

(assert (=> b!1089921 m!1009365))

(declare-fun m!1009367 () Bool)

(assert (=> b!1089919 m!1009367))

(declare-fun m!1009369 () Bool)

(assert (=> b!1089919 m!1009369))

(declare-fun m!1009371 () Bool)

(assert (=> b!1089919 m!1009371))

(declare-fun m!1009373 () Bool)

(assert (=> b!1089919 m!1009373))

(declare-fun m!1009375 () Bool)

(assert (=> b!1089919 m!1009375))

(declare-fun m!1009377 () Bool)

(assert (=> b!1089919 m!1009377))

(declare-fun m!1009379 () Bool)

(assert (=> b!1089919 m!1009379))

(declare-fun m!1009381 () Bool)

(assert (=> b!1089919 m!1009381))

(declare-fun m!1009383 () Bool)

(assert (=> b!1089919 m!1009383))

(declare-fun m!1009385 () Bool)

(assert (=> b!1089919 m!1009385))

(declare-fun m!1009387 () Bool)

(assert (=> b!1089917 m!1009387))

(declare-fun m!1009389 () Bool)

(assert (=> b!1089929 m!1009389))

(declare-fun m!1009391 () Bool)

(assert (=> start!96258 m!1009391))

(declare-fun m!1009393 () Bool)

(assert (=> start!96258 m!1009393))

(declare-fun m!1009395 () Bool)

(assert (=> start!96258 m!1009395))

(declare-fun m!1009397 () Bool)

(assert (=> b!1089927 m!1009397))

(declare-fun m!1009399 () Bool)

(assert (=> mapNonEmpty!41770 m!1009399))

(declare-fun m!1009401 () Bool)

(assert (=> b!1089923 m!1009401))

(declare-fun m!1009403 () Bool)

(assert (=> b!1089918 m!1009403))

(declare-fun m!1009405 () Bool)

(assert (=> b!1089918 m!1009405))

(check-sat (not start!96258) (not b!1089917) (not b!1089923) (not mapNonEmpty!41770) (not b_lambda!17355) (not b!1089921) (not b!1089918) (not b!1089926) (not b_next!22675) tp_is_empty!26677 (not b!1089919) (not b!1089927) (not b!1089924) b_and!36037)
(check-sat b_and!36037 (not b_next!22675))
