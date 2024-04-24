; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96096 () Bool)

(assert start!96096)

(declare-fun b_free!22513 () Bool)

(declare-fun b_next!22513 () Bool)

(assert (=> start!96096 (= b_free!22513 (not b_next!22513))))

(declare-fun tp!79388 () Bool)

(declare-fun b_and!35711 () Bool)

(assert (=> start!96096 (= tp!79388 b_and!35711)))

(declare-fun b!1086344 () Bool)

(declare-fun e!620704 () Bool)

(declare-fun e!620702 () Bool)

(declare-fun mapRes!41527 () Bool)

(assert (=> b!1086344 (= e!620704 (and e!620702 mapRes!41527))))

(declare-fun condMapEmpty!41527 () Bool)

(declare-datatypes ((V!40481 0))(
  ( (V!40482 (val!13314 Int)) )
))
(declare-datatypes ((ValueCell!12548 0))(
  ( (ValueCellFull!12548 (v!15931 V!40481)) (EmptyCell!12548) )
))
(declare-datatypes ((array!70005 0))(
  ( (array!70006 (arr!33670 (Array (_ BitVec 32) ValueCell!12548)) (size!34207 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70005)

(declare-fun mapDefault!41527 () ValueCell!12548)

(assert (=> b!1086344 (= condMapEmpty!41527 (= (arr!33670 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12548)) mapDefault!41527)))))

(declare-fun b!1086345 () Bool)

(declare-fun e!620705 () Bool)

(assert (=> b!1086345 (= e!620705 true)))

(declare-fun k0!904 () (_ BitVec 64))

(declare-datatypes ((tuple2!16884 0))(
  ( (tuple2!16885 (_1!8453 (_ BitVec 64)) (_2!8453 V!40481)) )
))
(declare-datatypes ((List!23483 0))(
  ( (Nil!23480) (Cons!23479 (h!24697 tuple2!16884) (t!33046 List!23483)) )
))
(declare-datatypes ((ListLongMap!14861 0))(
  ( (ListLongMap!14862 (toList!7446 List!23483)) )
))
(declare-fun lt!481717 () ListLongMap!14861)

(declare-fun lt!481718 () tuple2!16884)

(declare-fun lt!481710 () ListLongMap!14861)

(declare-fun -!758 (ListLongMap!14861 (_ BitVec 64)) ListLongMap!14861)

(declare-fun +!3271 (ListLongMap!14861 tuple2!16884) ListLongMap!14861)

(assert (=> b!1086345 (= (-!758 lt!481717 k0!904) (+!3271 lt!481710 lt!481718))))

(declare-fun minValue!831 () V!40481)

(declare-datatypes ((Unit!35683 0))(
  ( (Unit!35684) )
))
(declare-fun lt!481722 () Unit!35683)

(declare-fun lt!481723 () ListLongMap!14861)

(declare-fun addRemoveCommutativeForDiffKeys!5 (ListLongMap!14861 (_ BitVec 64) V!40481 (_ BitVec 64)) Unit!35683)

(assert (=> b!1086345 (= lt!481722 (addRemoveCommutativeForDiffKeys!5 lt!481723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086346 () Bool)

(declare-fun res!723911 () Bool)

(declare-fun e!620703 () Bool)

(assert (=> b!1086346 (=> (not res!723911) (not e!620703))))

(declare-datatypes ((array!70007 0))(
  ( (array!70008 (arr!33671 (Array (_ BitVec 32) (_ BitVec 64))) (size!34208 (_ BitVec 32))) )
))
(declare-fun lt!481725 () array!70007)

(declare-datatypes ((List!23484 0))(
  ( (Nil!23481) (Cons!23480 (h!24698 (_ BitVec 64)) (t!33047 List!23484)) )
))
(declare-fun arrayNoDuplicates!0 (array!70007 (_ BitVec 32) List!23484) Bool)

(assert (=> b!1086346 (= res!723911 (arrayNoDuplicates!0 lt!481725 #b00000000000000000000000000000000 Nil!23481))))

(declare-fun b!1086348 () Bool)

(declare-fun e!620701 () Bool)

(assert (=> b!1086348 (= e!620701 e!620705)))

(declare-fun res!723906 () Bool)

(assert (=> b!1086348 (=> res!723906 e!620705)))

(assert (=> b!1086348 (= res!723906 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!481711 () ListLongMap!14861)

(assert (=> b!1086348 (= lt!481710 lt!481711)))

(assert (=> b!1086348 (= lt!481710 (-!758 lt!481723 k0!904))))

(declare-fun lt!481709 () Unit!35683)

(declare-fun lt!481720 () ListLongMap!14861)

(declare-fun zeroValue!831 () V!40481)

(assert (=> b!1086348 (= lt!481709 (addRemoveCommutativeForDiffKeys!5 lt!481720 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!481721 () ListLongMap!14861)

(assert (=> b!1086348 (= lt!481721 (+!3271 lt!481711 lt!481718))))

(declare-fun lt!481713 () ListLongMap!14861)

(declare-fun lt!481716 () tuple2!16884)

(assert (=> b!1086348 (= lt!481711 (+!3271 lt!481713 lt!481716))))

(declare-fun lt!481719 () ListLongMap!14861)

(assert (=> b!1086348 (= lt!481719 lt!481717)))

(assert (=> b!1086348 (= lt!481717 (+!3271 lt!481723 lt!481718))))

(assert (=> b!1086348 (= lt!481723 (+!3271 lt!481720 lt!481716))))

(declare-fun lt!481714 () ListLongMap!14861)

(assert (=> b!1086348 (= lt!481721 (+!3271 (+!3271 lt!481714 lt!481716) lt!481718))))

(assert (=> b!1086348 (= lt!481718 (tuple2!16885 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086348 (= lt!481716 (tuple2!16885 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086349 () Bool)

(declare-fun tp_is_empty!26515 () Bool)

(assert (=> b!1086349 (= e!620702 tp_is_empty!26515)))

(declare-fun b!1086350 () Bool)

(declare-fun res!723902 () Bool)

(declare-fun e!620698 () Bool)

(assert (=> b!1086350 (=> (not res!723902) (not e!620698))))

(declare-fun _keys!1070 () array!70007)

(assert (=> b!1086350 (= res!723902 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23481))))

(declare-fun b!1086351 () Bool)

(assert (=> b!1086351 (= e!620698 e!620703)))

(declare-fun res!723909 () Bool)

(assert (=> b!1086351 (=> (not res!723909) (not e!620703))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70007 (_ BitVec 32)) Bool)

(assert (=> b!1086351 (= res!723909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481725 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086351 (= lt!481725 (array!70008 (store (arr!33671 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34208 _keys!1070)))))

(declare-fun b!1086352 () Bool)

(declare-fun res!723907 () Bool)

(assert (=> b!1086352 (=> (not res!723907) (not e!620698))))

(assert (=> b!1086352 (= res!723907 (= (select (arr!33671 _keys!1070) i!650) k0!904))))

(declare-fun b!1086353 () Bool)

(declare-fun res!723912 () Bool)

(assert (=> b!1086353 (=> (not res!723912) (not e!620698))))

(assert (=> b!1086353 (= res!723912 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34208 _keys!1070))))))

(declare-fun b!1086354 () Bool)

(assert (=> b!1086354 (= e!620703 (not e!620701))))

(declare-fun res!723908 () Bool)

(assert (=> b!1086354 (=> res!723908 e!620701)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086354 (= res!723908 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4218 (array!70007 array!70005 (_ BitVec 32) (_ BitVec 32) V!40481 V!40481 (_ BitVec 32) Int) ListLongMap!14861)

(assert (=> b!1086354 (= lt!481719 (getCurrentListMap!4218 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481715 () array!70005)

(assert (=> b!1086354 (= lt!481721 (getCurrentListMap!4218 lt!481725 lt!481715 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1086354 (and (= lt!481714 lt!481713) (= lt!481713 lt!481714))))

(assert (=> b!1086354 (= lt!481713 (-!758 lt!481720 k0!904))))

(declare-fun lt!481712 () Unit!35683)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!47 (array!70007 array!70005 (_ BitVec 32) (_ BitVec 32) V!40481 V!40481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35683)

(assert (=> b!1086354 (= lt!481712 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!47 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4023 (array!70007 array!70005 (_ BitVec 32) (_ BitVec 32) V!40481 V!40481 (_ BitVec 32) Int) ListLongMap!14861)

(assert (=> b!1086354 (= lt!481714 (getCurrentListMapNoExtraKeys!4023 lt!481725 lt!481715 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2144 (Int (_ BitVec 64)) V!40481)

(assert (=> b!1086354 (= lt!481715 (array!70006 (store (arr!33670 _values!874) i!650 (ValueCellFull!12548 (dynLambda!2144 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34207 _values!874)))))

(assert (=> b!1086354 (= lt!481720 (getCurrentListMapNoExtraKeys!4023 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086354 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481724 () Unit!35683)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70007 (_ BitVec 64) (_ BitVec 32)) Unit!35683)

(assert (=> b!1086354 (= lt!481724 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086355 () Bool)

(declare-fun res!723910 () Bool)

(assert (=> b!1086355 (=> (not res!723910) (not e!620698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086355 (= res!723910 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41527 () Bool)

(declare-fun tp!79387 () Bool)

(declare-fun e!620700 () Bool)

(assert (=> mapNonEmpty!41527 (= mapRes!41527 (and tp!79387 e!620700))))

(declare-fun mapRest!41527 () (Array (_ BitVec 32) ValueCell!12548))

(declare-fun mapKey!41527 () (_ BitVec 32))

(declare-fun mapValue!41527 () ValueCell!12548)

(assert (=> mapNonEmpty!41527 (= (arr!33670 _values!874) (store mapRest!41527 mapKey!41527 mapValue!41527))))

(declare-fun b!1086356 () Bool)

(assert (=> b!1086356 (= e!620700 tp_is_empty!26515)))

(declare-fun res!723905 () Bool)

(assert (=> start!96096 (=> (not res!723905) (not e!620698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96096 (= res!723905 (validMask!0 mask!1414))))

(assert (=> start!96096 e!620698))

(assert (=> start!96096 tp!79388))

(assert (=> start!96096 true))

(assert (=> start!96096 tp_is_empty!26515))

(declare-fun array_inv!26028 (array!70007) Bool)

(assert (=> start!96096 (array_inv!26028 _keys!1070)))

(declare-fun array_inv!26029 (array!70005) Bool)

(assert (=> start!96096 (and (array_inv!26029 _values!874) e!620704)))

(declare-fun b!1086347 () Bool)

(declare-fun res!723903 () Bool)

(assert (=> b!1086347 (=> (not res!723903) (not e!620698))))

(assert (=> b!1086347 (= res!723903 (and (= (size!34207 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34208 _keys!1070) (size!34207 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086357 () Bool)

(declare-fun res!723904 () Bool)

(assert (=> b!1086357 (=> (not res!723904) (not e!620698))))

(assert (=> b!1086357 (= res!723904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41527 () Bool)

(assert (=> mapIsEmpty!41527 mapRes!41527))

(assert (= (and start!96096 res!723905) b!1086347))

(assert (= (and b!1086347 res!723903) b!1086357))

(assert (= (and b!1086357 res!723904) b!1086350))

(assert (= (and b!1086350 res!723902) b!1086353))

(assert (= (and b!1086353 res!723912) b!1086355))

(assert (= (and b!1086355 res!723910) b!1086352))

(assert (= (and b!1086352 res!723907) b!1086351))

(assert (= (and b!1086351 res!723909) b!1086346))

(assert (= (and b!1086346 res!723911) b!1086354))

(assert (= (and b!1086354 (not res!723908)) b!1086348))

(assert (= (and b!1086348 (not res!723906)) b!1086345))

(assert (= (and b!1086344 condMapEmpty!41527) mapIsEmpty!41527))

(assert (= (and b!1086344 (not condMapEmpty!41527)) mapNonEmpty!41527))

(get-info :version)

(assert (= (and mapNonEmpty!41527 ((_ is ValueCellFull!12548) mapValue!41527)) b!1086356))

(assert (= (and b!1086344 ((_ is ValueCellFull!12548) mapDefault!41527)) b!1086349))

(assert (= start!96096 b!1086344))

(declare-fun b_lambda!17193 () Bool)

(assert (=> (not b_lambda!17193) (not b!1086354)))

(declare-fun t!33045 () Bool)

(declare-fun tb!7383 () Bool)

(assert (=> (and start!96096 (= defaultEntry!882 defaultEntry!882) t!33045) tb!7383))

(declare-fun result!15293 () Bool)

(assert (=> tb!7383 (= result!15293 tp_is_empty!26515)))

(assert (=> b!1086354 t!33045))

(declare-fun b_and!35713 () Bool)

(assert (= b_and!35711 (and (=> t!33045 result!15293) b_and!35713)))

(declare-fun m!1004543 () Bool)

(assert (=> b!1086355 m!1004543))

(declare-fun m!1004545 () Bool)

(assert (=> b!1086354 m!1004545))

(declare-fun m!1004547 () Bool)

(assert (=> b!1086354 m!1004547))

(declare-fun m!1004549 () Bool)

(assert (=> b!1086354 m!1004549))

(declare-fun m!1004551 () Bool)

(assert (=> b!1086354 m!1004551))

(declare-fun m!1004553 () Bool)

(assert (=> b!1086354 m!1004553))

(declare-fun m!1004555 () Bool)

(assert (=> b!1086354 m!1004555))

(declare-fun m!1004557 () Bool)

(assert (=> b!1086354 m!1004557))

(declare-fun m!1004559 () Bool)

(assert (=> b!1086354 m!1004559))

(declare-fun m!1004561 () Bool)

(assert (=> b!1086354 m!1004561))

(declare-fun m!1004563 () Bool)

(assert (=> b!1086354 m!1004563))

(declare-fun m!1004565 () Bool)

(assert (=> b!1086357 m!1004565))

(declare-fun m!1004567 () Bool)

(assert (=> b!1086352 m!1004567))

(declare-fun m!1004569 () Bool)

(assert (=> start!96096 m!1004569))

(declare-fun m!1004571 () Bool)

(assert (=> start!96096 m!1004571))

(declare-fun m!1004573 () Bool)

(assert (=> start!96096 m!1004573))

(declare-fun m!1004575 () Bool)

(assert (=> b!1086346 m!1004575))

(declare-fun m!1004577 () Bool)

(assert (=> b!1086345 m!1004577))

(declare-fun m!1004579 () Bool)

(assert (=> b!1086345 m!1004579))

(declare-fun m!1004581 () Bool)

(assert (=> b!1086345 m!1004581))

(declare-fun m!1004583 () Bool)

(assert (=> mapNonEmpty!41527 m!1004583))

(declare-fun m!1004585 () Bool)

(assert (=> b!1086351 m!1004585))

(declare-fun m!1004587 () Bool)

(assert (=> b!1086351 m!1004587))

(declare-fun m!1004589 () Bool)

(assert (=> b!1086350 m!1004589))

(declare-fun m!1004591 () Bool)

(assert (=> b!1086348 m!1004591))

(declare-fun m!1004593 () Bool)

(assert (=> b!1086348 m!1004593))

(declare-fun m!1004595 () Bool)

(assert (=> b!1086348 m!1004595))

(declare-fun m!1004597 () Bool)

(assert (=> b!1086348 m!1004597))

(declare-fun m!1004599 () Bool)

(assert (=> b!1086348 m!1004599))

(declare-fun m!1004601 () Bool)

(assert (=> b!1086348 m!1004601))

(assert (=> b!1086348 m!1004601))

(declare-fun m!1004603 () Bool)

(assert (=> b!1086348 m!1004603))

(declare-fun m!1004605 () Bool)

(assert (=> b!1086348 m!1004605))

(check-sat (not b!1086351) (not b!1086350) (not b!1086346) (not b_lambda!17193) (not b!1086354) (not b!1086355) b_and!35713 (not b!1086348) (not start!96096) (not b!1086357) (not b_next!22513) (not b!1086345) (not mapNonEmpty!41527) tp_is_empty!26515)
(check-sat b_and!35713 (not b_next!22513))
