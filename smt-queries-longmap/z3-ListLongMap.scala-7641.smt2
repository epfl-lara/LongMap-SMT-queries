; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96168 () Bool)

(assert start!96168)

(declare-fun b_free!22821 () Bool)

(declare-fun b_next!22821 () Bool)

(assert (=> start!96168 (= b_free!22821 (not b_next!22821))))

(declare-fun tp!80312 () Bool)

(declare-fun b_and!36317 () Bool)

(assert (=> start!96168 (= tp!80312 b_and!36317)))

(declare-fun b!1091811 () Bool)

(declare-fun e!623539 () Bool)

(declare-fun tp_is_empty!26823 () Bool)

(assert (=> b!1091811 (= e!623539 tp_is_empty!26823)))

(declare-fun b!1091812 () Bool)

(declare-fun res!728484 () Bool)

(declare-fun e!623542 () Bool)

(assert (=> b!1091812 (=> (not res!728484) (not e!623542))))

(declare-datatypes ((array!70565 0))(
  ( (array!70566 (arr!33956 (Array (_ BitVec 32) (_ BitVec 64))) (size!34492 (_ BitVec 32))) )
))
(declare-fun lt!487752 () array!70565)

(declare-datatypes ((List!23718 0))(
  ( (Nil!23715) (Cons!23714 (h!24923 (_ BitVec 64)) (t!33597 List!23718)) )
))
(declare-fun arrayNoDuplicates!0 (array!70565 (_ BitVec 32) List!23718) Bool)

(assert (=> b!1091812 (= res!728484 (arrayNoDuplicates!0 lt!487752 #b00000000000000000000000000000000 Nil!23715))))

(declare-fun b!1091813 () Bool)

(declare-fun res!728490 () Bool)

(declare-fun e!623540 () Bool)

(assert (=> b!1091813 (=> (not res!728490) (not e!623540))))

(declare-fun _keys!1070 () array!70565)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091813 (= res!728490 (= (select (arr!33956 _keys!1070) i!650) k0!904))))

(declare-fun b!1091814 () Bool)

(assert (=> b!1091814 (= e!623540 e!623542)))

(declare-fun res!728480 () Bool)

(assert (=> b!1091814 (=> (not res!728480) (not e!623542))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70565 (_ BitVec 32)) Bool)

(assert (=> b!1091814 (= res!728480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487752 mask!1414))))

(assert (=> b!1091814 (= lt!487752 (array!70566 (store (arr!33956 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34492 _keys!1070)))))

(declare-fun b!1091815 () Bool)

(declare-fun e!623545 () Bool)

(assert (=> b!1091815 (= e!623545 tp_is_empty!26823)))

(declare-fun b!1091816 () Bool)

(declare-fun res!728487 () Bool)

(assert (=> b!1091816 (=> (not res!728487) (not e!623540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091816 (= res!728487 (validKeyInArray!0 k0!904))))

(declare-fun b!1091817 () Bool)

(declare-fun res!728483 () Bool)

(assert (=> b!1091817 (=> (not res!728483) (not e!623540))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40891 0))(
  ( (V!40892 (val!13468 Int)) )
))
(declare-datatypes ((ValueCell!12702 0))(
  ( (ValueCellFull!12702 (v!16089 V!40891)) (EmptyCell!12702) )
))
(declare-datatypes ((array!70567 0))(
  ( (array!70568 (arr!33957 (Array (_ BitVec 32) ValueCell!12702)) (size!34493 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70567)

(assert (=> b!1091817 (= res!728483 (and (= (size!34493 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34492 _keys!1070) (size!34493 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091818 () Bool)

(declare-fun e!623546 () Bool)

(assert (=> b!1091818 (= e!623542 (not e!623546))))

(declare-fun res!728486 () Bool)

(assert (=> b!1091818 (=> res!728486 e!623546)))

(assert (=> b!1091818 (= res!728486 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40891)

(declare-datatypes ((tuple2!17134 0))(
  ( (tuple2!17135 (_1!8578 (_ BitVec 64)) (_2!8578 V!40891)) )
))
(declare-datatypes ((List!23719 0))(
  ( (Nil!23716) (Cons!23715 (h!24924 tuple2!17134) (t!33598 List!23719)) )
))
(declare-datatypes ((ListLongMap!15103 0))(
  ( (ListLongMap!15104 (toList!7567 List!23719)) )
))
(declare-fun lt!487754 () ListLongMap!15103)

(declare-fun zeroValue!831 () V!40891)

(declare-fun getCurrentListMap!4325 (array!70565 array!70567 (_ BitVec 32) (_ BitVec 32) V!40891 V!40891 (_ BitVec 32) Int) ListLongMap!15103)

(assert (=> b!1091818 (= lt!487754 (getCurrentListMap!4325 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487758 () ListLongMap!15103)

(declare-fun lt!487756 () array!70567)

(assert (=> b!1091818 (= lt!487758 (getCurrentListMap!4325 lt!487752 lt!487756 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487762 () ListLongMap!15103)

(declare-fun lt!487755 () ListLongMap!15103)

(assert (=> b!1091818 (and (= lt!487762 lt!487755) (= lt!487755 lt!487762))))

(declare-fun lt!487761 () ListLongMap!15103)

(declare-fun -!887 (ListLongMap!15103 (_ BitVec 64)) ListLongMap!15103)

(assert (=> b!1091818 (= lt!487755 (-!887 lt!487761 k0!904))))

(declare-datatypes ((Unit!35940 0))(
  ( (Unit!35941) )
))
(declare-fun lt!487751 () Unit!35940)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!144 (array!70565 array!70567 (_ BitVec 32) (_ BitVec 32) V!40891 V!40891 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35940)

(assert (=> b!1091818 (= lt!487751 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!144 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4085 (array!70565 array!70567 (_ BitVec 32) (_ BitVec 32) V!40891 V!40891 (_ BitVec 32) Int) ListLongMap!15103)

(assert (=> b!1091818 (= lt!487762 (getCurrentListMapNoExtraKeys!4085 lt!487752 lt!487756 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2222 (Int (_ BitVec 64)) V!40891)

(assert (=> b!1091818 (= lt!487756 (array!70568 (store (arr!33957 _values!874) i!650 (ValueCellFull!12702 (dynLambda!2222 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34493 _values!874)))))

(assert (=> b!1091818 (= lt!487761 (getCurrentListMapNoExtraKeys!4085 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091818 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487759 () Unit!35940)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70565 (_ BitVec 64) (_ BitVec 32)) Unit!35940)

(assert (=> b!1091818 (= lt!487759 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!41989 () Bool)

(declare-fun mapRes!41989 () Bool)

(declare-fun tp!80311 () Bool)

(assert (=> mapNonEmpty!41989 (= mapRes!41989 (and tp!80311 e!623539))))

(declare-fun mapKey!41989 () (_ BitVec 32))

(declare-fun mapRest!41989 () (Array (_ BitVec 32) ValueCell!12702))

(declare-fun mapValue!41989 () ValueCell!12702)

(assert (=> mapNonEmpty!41989 (= (arr!33957 _values!874) (store mapRest!41989 mapKey!41989 mapValue!41989))))

(declare-fun b!1091819 () Bool)

(declare-fun res!728489 () Bool)

(assert (=> b!1091819 (=> (not res!728489) (not e!623540))))

(assert (=> b!1091819 (= res!728489 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23715))))

(declare-fun b!1091820 () Bool)

(declare-fun res!728488 () Bool)

(assert (=> b!1091820 (=> (not res!728488) (not e!623540))))

(assert (=> b!1091820 (= res!728488 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34492 _keys!1070))))))

(declare-fun b!1091821 () Bool)

(declare-fun res!728481 () Bool)

(assert (=> b!1091821 (=> (not res!728481) (not e!623540))))

(assert (=> b!1091821 (= res!728481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!728485 () Bool)

(assert (=> start!96168 (=> (not res!728485) (not e!623540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96168 (= res!728485 (validMask!0 mask!1414))))

(assert (=> start!96168 e!623540))

(assert (=> start!96168 tp!80312))

(assert (=> start!96168 true))

(assert (=> start!96168 tp_is_empty!26823))

(declare-fun array_inv!26178 (array!70565) Bool)

(assert (=> start!96168 (array_inv!26178 _keys!1070)))

(declare-fun e!623544 () Bool)

(declare-fun array_inv!26179 (array!70567) Bool)

(assert (=> start!96168 (and (array_inv!26179 _values!874) e!623544)))

(declare-fun mapIsEmpty!41989 () Bool)

(assert (=> mapIsEmpty!41989 mapRes!41989))

(declare-fun b!1091822 () Bool)

(assert (=> b!1091822 (= e!623544 (and e!623545 mapRes!41989))))

(declare-fun condMapEmpty!41989 () Bool)

(declare-fun mapDefault!41989 () ValueCell!12702)

(assert (=> b!1091822 (= condMapEmpty!41989 (= (arr!33957 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12702)) mapDefault!41989)))))

(declare-fun b!1091823 () Bool)

(declare-fun e!623543 () Bool)

(assert (=> b!1091823 (= e!623543 true)))

(declare-fun lt!487760 () ListLongMap!15103)

(declare-fun lt!487753 () ListLongMap!15103)

(assert (=> b!1091823 (= (-!887 lt!487760 k0!904) lt!487753)))

(declare-fun lt!487757 () Unit!35940)

(declare-fun addRemoveCommutativeForDiffKeys!108 (ListLongMap!15103 (_ BitVec 64) V!40891 (_ BitVec 64)) Unit!35940)

(assert (=> b!1091823 (= lt!487757 (addRemoveCommutativeForDiffKeys!108 lt!487761 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091824 () Bool)

(assert (=> b!1091824 (= e!623546 e!623543)))

(declare-fun res!728482 () Bool)

(assert (=> b!1091824 (=> res!728482 e!623543)))

(assert (=> b!1091824 (= res!728482 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1091824 (= lt!487754 lt!487760)))

(declare-fun lt!487750 () tuple2!17134)

(declare-fun +!3349 (ListLongMap!15103 tuple2!17134) ListLongMap!15103)

(assert (=> b!1091824 (= lt!487760 (+!3349 lt!487761 lt!487750))))

(assert (=> b!1091824 (= lt!487758 lt!487753)))

(assert (=> b!1091824 (= lt!487753 (+!3349 lt!487755 lt!487750))))

(assert (=> b!1091824 (= lt!487758 (+!3349 lt!487762 lt!487750))))

(assert (=> b!1091824 (= lt!487750 (tuple2!17135 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (= (and start!96168 res!728485) b!1091817))

(assert (= (and b!1091817 res!728483) b!1091821))

(assert (= (and b!1091821 res!728481) b!1091819))

(assert (= (and b!1091819 res!728489) b!1091820))

(assert (= (and b!1091820 res!728488) b!1091816))

(assert (= (and b!1091816 res!728487) b!1091813))

(assert (= (and b!1091813 res!728490) b!1091814))

(assert (= (and b!1091814 res!728480) b!1091812))

(assert (= (and b!1091812 res!728484) b!1091818))

(assert (= (and b!1091818 (not res!728486)) b!1091824))

(assert (= (and b!1091824 (not res!728482)) b!1091823))

(assert (= (and b!1091822 condMapEmpty!41989) mapIsEmpty!41989))

(assert (= (and b!1091822 (not condMapEmpty!41989)) mapNonEmpty!41989))

(get-info :version)

(assert (= (and mapNonEmpty!41989 ((_ is ValueCellFull!12702) mapValue!41989)) b!1091811))

(assert (= (and b!1091822 ((_ is ValueCellFull!12702) mapDefault!41989)) b!1091815))

(assert (= start!96168 b!1091822))

(declare-fun b_lambda!17491 () Bool)

(assert (=> (not b_lambda!17491) (not b!1091818)))

(declare-fun t!33596 () Bool)

(declare-fun tb!7699 () Bool)

(assert (=> (and start!96168 (= defaultEntry!882 defaultEntry!882) t!33596) tb!7699))

(declare-fun result!15917 () Bool)

(assert (=> tb!7699 (= result!15917 tp_is_empty!26823)))

(assert (=> b!1091818 t!33596))

(declare-fun b_and!36319 () Bool)

(assert (= b_and!36317 (and (=> t!33596 result!15917) b_and!36319)))

(declare-fun m!1011467 () Bool)

(assert (=> mapNonEmpty!41989 m!1011467))

(declare-fun m!1011469 () Bool)

(assert (=> b!1091818 m!1011469))

(declare-fun m!1011471 () Bool)

(assert (=> b!1091818 m!1011471))

(declare-fun m!1011473 () Bool)

(assert (=> b!1091818 m!1011473))

(declare-fun m!1011475 () Bool)

(assert (=> b!1091818 m!1011475))

(declare-fun m!1011477 () Bool)

(assert (=> b!1091818 m!1011477))

(declare-fun m!1011479 () Bool)

(assert (=> b!1091818 m!1011479))

(declare-fun m!1011481 () Bool)

(assert (=> b!1091818 m!1011481))

(declare-fun m!1011483 () Bool)

(assert (=> b!1091818 m!1011483))

(declare-fun m!1011485 () Bool)

(assert (=> b!1091818 m!1011485))

(declare-fun m!1011487 () Bool)

(assert (=> b!1091818 m!1011487))

(declare-fun m!1011489 () Bool)

(assert (=> b!1091821 m!1011489))

(declare-fun m!1011491 () Bool)

(assert (=> b!1091819 m!1011491))

(declare-fun m!1011493 () Bool)

(assert (=> b!1091816 m!1011493))

(declare-fun m!1011495 () Bool)

(assert (=> b!1091823 m!1011495))

(declare-fun m!1011497 () Bool)

(assert (=> b!1091823 m!1011497))

(declare-fun m!1011499 () Bool)

(assert (=> b!1091824 m!1011499))

(declare-fun m!1011501 () Bool)

(assert (=> b!1091824 m!1011501))

(declare-fun m!1011503 () Bool)

(assert (=> b!1091824 m!1011503))

(declare-fun m!1011505 () Bool)

(assert (=> b!1091813 m!1011505))

(declare-fun m!1011507 () Bool)

(assert (=> b!1091812 m!1011507))

(declare-fun m!1011509 () Bool)

(assert (=> b!1091814 m!1011509))

(declare-fun m!1011511 () Bool)

(assert (=> b!1091814 m!1011511))

(declare-fun m!1011513 () Bool)

(assert (=> start!96168 m!1011513))

(declare-fun m!1011515 () Bool)

(assert (=> start!96168 m!1011515))

(declare-fun m!1011517 () Bool)

(assert (=> start!96168 m!1011517))

(check-sat b_and!36319 (not b_lambda!17491) (not b!1091824) (not b!1091818) (not b!1091816) (not b!1091814) tp_is_empty!26823 (not b!1091821) (not start!96168) (not b!1091812) (not b_next!22821) (not b!1091819) (not mapNonEmpty!41989) (not b!1091823))
(check-sat b_and!36319 (not b_next!22821))
