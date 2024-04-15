; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96244 () Bool)

(assert start!96244)

(declare-fun b_free!22903 () Bool)

(declare-fun b_next!22903 () Bool)

(assert (=> start!96244 (= b_free!22903 (not b_next!22903))))

(declare-fun tp!80557 () Bool)

(declare-fun b_and!36455 () Bool)

(assert (=> start!96244 (= tp!80557 b_and!36455)))

(declare-fun b!1093278 () Bool)

(declare-fun e!624246 () Bool)

(declare-fun e!624248 () Bool)

(assert (=> b!1093278 (= e!624246 e!624248)))

(declare-fun res!729588 () Bool)

(assert (=> b!1093278 (=> (not res!729588) (not e!624248))))

(declare-datatypes ((array!70642 0))(
  ( (array!70643 (arr!33995 (Array (_ BitVec 32) (_ BitVec 64))) (size!34533 (_ BitVec 32))) )
))
(declare-fun lt!488792 () array!70642)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70642 (_ BitVec 32)) Bool)

(assert (=> b!1093278 (= res!729588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488792 mask!1414))))

(declare-fun _keys!1070 () array!70642)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093278 (= lt!488792 (array!70643 (store (arr!33995 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34533 _keys!1070)))))

(declare-fun b!1093279 () Bool)

(declare-fun res!729584 () Bool)

(assert (=> b!1093279 (=> (not res!729584) (not e!624246))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1093279 (= res!729584 (= (select (arr!33995 _keys!1070) i!650) k0!904))))

(declare-fun b!1093280 () Bool)

(declare-fun e!624251 () Bool)

(declare-fun tp_is_empty!26905 () Bool)

(assert (=> b!1093280 (= e!624251 tp_is_empty!26905)))

(declare-fun b!1093281 () Bool)

(declare-fun e!624250 () Bool)

(declare-fun e!624249 () Bool)

(declare-fun mapRes!42112 () Bool)

(assert (=> b!1093281 (= e!624250 (and e!624249 mapRes!42112))))

(declare-fun condMapEmpty!42112 () Bool)

(declare-datatypes ((V!41001 0))(
  ( (V!41002 (val!13509 Int)) )
))
(declare-datatypes ((ValueCell!12743 0))(
  ( (ValueCellFull!12743 (v!16129 V!41001)) (EmptyCell!12743) )
))
(declare-datatypes ((array!70644 0))(
  ( (array!70645 (arr!33996 (Array (_ BitVec 32) ValueCell!12743)) (size!34534 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70644)

(declare-fun mapDefault!42112 () ValueCell!12743)

(assert (=> b!1093281 (= condMapEmpty!42112 (= (arr!33996 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12743)) mapDefault!42112)))))

(declare-fun b!1093282 () Bool)

(declare-fun res!729586 () Bool)

(assert (=> b!1093282 (=> (not res!729586) (not e!624246))))

(assert (=> b!1093282 (= res!729586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093283 () Bool)

(declare-fun res!729583 () Bool)

(assert (=> b!1093283 (=> (not res!729583) (not e!624246))))

(declare-datatypes ((List!23813 0))(
  ( (Nil!23810) (Cons!23809 (h!25018 (_ BitVec 64)) (t!33765 List!23813)) )
))
(declare-fun arrayNoDuplicates!0 (array!70642 (_ BitVec 32) List!23813) Bool)

(assert (=> b!1093283 (= res!729583 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23810))))

(declare-fun b!1093284 () Bool)

(declare-fun res!729585 () Bool)

(assert (=> b!1093284 (=> (not res!729585) (not e!624246))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093284 (= res!729585 (and (= (size!34534 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34533 _keys!1070) (size!34534 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093285 () Bool)

(declare-fun res!729580 () Bool)

(assert (=> b!1093285 (=> (not res!729580) (not e!624248))))

(assert (=> b!1093285 (= res!729580 (arrayNoDuplicates!0 lt!488792 #b00000000000000000000000000000000 Nil!23810))))

(declare-fun b!1093286 () Bool)

(declare-fun res!729587 () Bool)

(assert (=> b!1093286 (=> (not res!729587) (not e!624246))))

(assert (=> b!1093286 (= res!729587 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34533 _keys!1070))))))

(declare-fun b!1093287 () Bool)

(assert (=> b!1093287 (= e!624249 tp_is_empty!26905)))

(declare-fun b!1093288 () Bool)

(assert (=> b!1093288 (= e!624248 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41001)

(declare-datatypes ((tuple2!17246 0))(
  ( (tuple2!17247 (_1!8634 (_ BitVec 64)) (_2!8634 V!41001)) )
))
(declare-datatypes ((List!23814 0))(
  ( (Nil!23811) (Cons!23810 (h!25019 tuple2!17246) (t!33766 List!23814)) )
))
(declare-datatypes ((ListLongMap!15215 0))(
  ( (ListLongMap!15216 (toList!7623 List!23814)) )
))
(declare-fun lt!488797 () ListLongMap!15215)

(declare-fun zeroValue!831 () V!41001)

(declare-fun getCurrentListMap!4286 (array!70642 array!70644 (_ BitVec 32) (_ BitVec 32) V!41001 V!41001 (_ BitVec 32) Int) ListLongMap!15215)

(assert (=> b!1093288 (= lt!488797 (getCurrentListMap!4286 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488795 () ListLongMap!15215)

(declare-fun lt!488791 () array!70644)

(assert (=> b!1093288 (= lt!488795 (getCurrentListMap!4286 lt!488792 lt!488791 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488798 () ListLongMap!15215)

(declare-fun lt!488790 () ListLongMap!15215)

(assert (=> b!1093288 (and (= lt!488798 lt!488790) (= lt!488790 lt!488798))))

(declare-fun lt!488794 () ListLongMap!15215)

(declare-fun -!895 (ListLongMap!15215 (_ BitVec 64)) ListLongMap!15215)

(assert (=> b!1093288 (= lt!488790 (-!895 lt!488794 k0!904))))

(declare-datatypes ((Unit!35825 0))(
  ( (Unit!35826) )
))
(declare-fun lt!488793 () Unit!35825)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!170 (array!70642 array!70644 (_ BitVec 32) (_ BitVec 32) V!41001 V!41001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35825)

(assert (=> b!1093288 (= lt!488793 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!170 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4156 (array!70642 array!70644 (_ BitVec 32) (_ BitVec 32) V!41001 V!41001 (_ BitVec 32) Int) ListLongMap!15215)

(assert (=> b!1093288 (= lt!488798 (getCurrentListMapNoExtraKeys!4156 lt!488792 lt!488791 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2227 (Int (_ BitVec 64)) V!41001)

(assert (=> b!1093288 (= lt!488791 (array!70645 (store (arr!33996 _values!874) i!650 (ValueCellFull!12743 (dynLambda!2227 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34534 _values!874)))))

(assert (=> b!1093288 (= lt!488794 (getCurrentListMapNoExtraKeys!4156 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093288 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488796 () Unit!35825)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70642 (_ BitVec 64) (_ BitVec 32)) Unit!35825)

(assert (=> b!1093288 (= lt!488796 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!42112 () Bool)

(declare-fun tp!80558 () Bool)

(assert (=> mapNonEmpty!42112 (= mapRes!42112 (and tp!80558 e!624251))))

(declare-fun mapRest!42112 () (Array (_ BitVec 32) ValueCell!12743))

(declare-fun mapValue!42112 () ValueCell!12743)

(declare-fun mapKey!42112 () (_ BitVec 32))

(assert (=> mapNonEmpty!42112 (= (arr!33996 _values!874) (store mapRest!42112 mapKey!42112 mapValue!42112))))

(declare-fun mapIsEmpty!42112 () Bool)

(assert (=> mapIsEmpty!42112 mapRes!42112))

(declare-fun b!1093289 () Bool)

(declare-fun res!729582 () Bool)

(assert (=> b!1093289 (=> (not res!729582) (not e!624246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093289 (= res!729582 (validKeyInArray!0 k0!904))))

(declare-fun res!729581 () Bool)

(assert (=> start!96244 (=> (not res!729581) (not e!624246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96244 (= res!729581 (validMask!0 mask!1414))))

(assert (=> start!96244 e!624246))

(assert (=> start!96244 tp!80557))

(assert (=> start!96244 true))

(assert (=> start!96244 tp_is_empty!26905))

(declare-fun array_inv!26244 (array!70642) Bool)

(assert (=> start!96244 (array_inv!26244 _keys!1070)))

(declare-fun array_inv!26245 (array!70644) Bool)

(assert (=> start!96244 (and (array_inv!26245 _values!874) e!624250)))

(assert (= (and start!96244 res!729581) b!1093284))

(assert (= (and b!1093284 res!729585) b!1093282))

(assert (= (and b!1093282 res!729586) b!1093283))

(assert (= (and b!1093283 res!729583) b!1093286))

(assert (= (and b!1093286 res!729587) b!1093289))

(assert (= (and b!1093289 res!729582) b!1093279))

(assert (= (and b!1093279 res!729584) b!1093278))

(assert (= (and b!1093278 res!729588) b!1093285))

(assert (= (and b!1093285 res!729580) b!1093288))

(assert (= (and b!1093281 condMapEmpty!42112) mapIsEmpty!42112))

(assert (= (and b!1093281 (not condMapEmpty!42112)) mapNonEmpty!42112))

(get-info :version)

(assert (= (and mapNonEmpty!42112 ((_ is ValueCellFull!12743) mapValue!42112)) b!1093280))

(assert (= (and b!1093281 ((_ is ValueCellFull!12743) mapDefault!42112)) b!1093287))

(assert (= start!96244 b!1093281))

(declare-fun b_lambda!17551 () Bool)

(assert (=> (not b_lambda!17551) (not b!1093288)))

(declare-fun t!33764 () Bool)

(declare-fun tb!7773 () Bool)

(assert (=> (and start!96244 (= defaultEntry!882 defaultEntry!882) t!33764) tb!7773))

(declare-fun result!16073 () Bool)

(assert (=> tb!7773 (= result!16073 tp_is_empty!26905)))

(assert (=> b!1093288 t!33764))

(declare-fun b_and!36457 () Bool)

(assert (= b_and!36455 (and (=> t!33764 result!16073) b_and!36457)))

(declare-fun m!1012673 () Bool)

(assert (=> mapNonEmpty!42112 m!1012673))

(declare-fun m!1012675 () Bool)

(assert (=> b!1093278 m!1012675))

(declare-fun m!1012677 () Bool)

(assert (=> b!1093278 m!1012677))

(declare-fun m!1012679 () Bool)

(assert (=> b!1093289 m!1012679))

(declare-fun m!1012681 () Bool)

(assert (=> b!1093283 m!1012681))

(declare-fun m!1012683 () Bool)

(assert (=> b!1093279 m!1012683))

(declare-fun m!1012685 () Bool)

(assert (=> start!96244 m!1012685))

(declare-fun m!1012687 () Bool)

(assert (=> start!96244 m!1012687))

(declare-fun m!1012689 () Bool)

(assert (=> start!96244 m!1012689))

(declare-fun m!1012691 () Bool)

(assert (=> b!1093285 m!1012691))

(declare-fun m!1012693 () Bool)

(assert (=> b!1093282 m!1012693))

(declare-fun m!1012695 () Bool)

(assert (=> b!1093288 m!1012695))

(declare-fun m!1012697 () Bool)

(assert (=> b!1093288 m!1012697))

(declare-fun m!1012699 () Bool)

(assert (=> b!1093288 m!1012699))

(declare-fun m!1012701 () Bool)

(assert (=> b!1093288 m!1012701))

(declare-fun m!1012703 () Bool)

(assert (=> b!1093288 m!1012703))

(declare-fun m!1012705 () Bool)

(assert (=> b!1093288 m!1012705))

(declare-fun m!1012707 () Bool)

(assert (=> b!1093288 m!1012707))

(declare-fun m!1012709 () Bool)

(assert (=> b!1093288 m!1012709))

(declare-fun m!1012711 () Bool)

(assert (=> b!1093288 m!1012711))

(declare-fun m!1012713 () Bool)

(assert (=> b!1093288 m!1012713))

(check-sat (not b!1093289) (not start!96244) (not b_next!22903) (not b!1093282) (not b!1093283) (not b!1093288) (not b!1093285) tp_is_empty!26905 (not mapNonEmpty!42112) (not b_lambda!17551) b_and!36457 (not b!1093278))
(check-sat b_and!36457 (not b_next!22903))
