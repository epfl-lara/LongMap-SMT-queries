; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96336 () Bool)

(assert start!96336)

(declare-fun b_free!22753 () Bool)

(declare-fun b_next!22753 () Bool)

(assert (=> start!96336 (= b_free!22753 (not b_next!22753))))

(declare-fun tp!80107 () Bool)

(declare-fun b_and!36191 () Bool)

(assert (=> start!96336 (= tp!80107 b_and!36191)))

(declare-fun b!1091642 () Bool)

(declare-fun res!727885 () Bool)

(declare-fun e!623582 () Bool)

(assert (=> b!1091642 (=> (not res!727885) (not e!623582))))

(declare-datatypes ((array!70469 0))(
  ( (array!70470 (arr!33902 (Array (_ BitVec 32) (_ BitVec 64))) (size!34439 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70469)

(declare-datatypes ((List!23678 0))(
  ( (Nil!23675) (Cons!23674 (h!24892 (_ BitVec 64)) (t!33481 List!23678)) )
))
(declare-fun arrayNoDuplicates!0 (array!70469 (_ BitVec 32) List!23678) Bool)

(assert (=> b!1091642 (= res!727885 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23675))))

(declare-fun b!1091644 () Bool)

(declare-fun e!623578 () Bool)

(declare-fun e!623581 () Bool)

(assert (=> b!1091644 (= e!623578 (not e!623581))))

(declare-fun res!727890 () Bool)

(assert (=> b!1091644 (=> res!727890 e!623581)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091644 (= res!727890 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40801 0))(
  ( (V!40802 (val!13434 Int)) )
))
(declare-fun minValue!831 () V!40801)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17088 0))(
  ( (tuple2!17089 (_1!8555 (_ BitVec 64)) (_2!8555 V!40801)) )
))
(declare-datatypes ((List!23679 0))(
  ( (Nil!23676) (Cons!23675 (h!24893 tuple2!17088) (t!33482 List!23679)) )
))
(declare-datatypes ((ListLongMap!15065 0))(
  ( (ListLongMap!15066 (toList!7548 List!23679)) )
))
(declare-fun lt!486947 () ListLongMap!15065)

(declare-fun zeroValue!831 () V!40801)

(declare-datatypes ((ValueCell!12668 0))(
  ( (ValueCellFull!12668 (v!16051 V!40801)) (EmptyCell!12668) )
))
(declare-datatypes ((array!70471 0))(
  ( (array!70472 (arr!33903 (Array (_ BitVec 32) ValueCell!12668)) (size!34440 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70471)

(declare-fun getCurrentListMap!4301 (array!70469 array!70471 (_ BitVec 32) (_ BitVec 32) V!40801 V!40801 (_ BitVec 32) Int) ListLongMap!15065)

(assert (=> b!1091644 (= lt!486947 (getCurrentListMap!4301 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486948 () array!70469)

(declare-fun lt!486946 () ListLongMap!15065)

(declare-fun lt!486942 () array!70471)

(assert (=> b!1091644 (= lt!486946 (getCurrentListMap!4301 lt!486948 lt!486942 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486945 () ListLongMap!15065)

(declare-fun lt!486939 () ListLongMap!15065)

(assert (=> b!1091644 (and (= lt!486945 lt!486939) (= lt!486939 lt!486945))))

(declare-fun lt!486943 () ListLongMap!15065)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!855 (ListLongMap!15065 (_ BitVec 64)) ListLongMap!15065)

(assert (=> b!1091644 (= lt!486939 (-!855 lt!486943 k0!904))))

(declare-datatypes ((Unit!35877 0))(
  ( (Unit!35878) )
))
(declare-fun lt!486940 () Unit!35877)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!130 (array!70469 array!70471 (_ BitVec 32) (_ BitVec 32) V!40801 V!40801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35877)

(assert (=> b!1091644 (= lt!486940 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!130 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4106 (array!70469 array!70471 (_ BitVec 32) (_ BitVec 32) V!40801 V!40801 (_ BitVec 32) Int) ListLongMap!15065)

(assert (=> b!1091644 (= lt!486945 (getCurrentListMapNoExtraKeys!4106 lt!486948 lt!486942 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2227 (Int (_ BitVec 64)) V!40801)

(assert (=> b!1091644 (= lt!486942 (array!70472 (store (arr!33903 _values!874) i!650 (ValueCellFull!12668 (dynLambda!2227 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34440 _values!874)))))

(assert (=> b!1091644 (= lt!486943 (getCurrentListMapNoExtraKeys!4106 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091644 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486951 () Unit!35877)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70469 (_ BitVec 64) (_ BitVec 32)) Unit!35877)

(assert (=> b!1091644 (= lt!486951 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091645 () Bool)

(declare-fun e!623579 () Bool)

(declare-fun tp_is_empty!26755 () Bool)

(assert (=> b!1091645 (= e!623579 tp_is_empty!26755)))

(declare-fun b!1091646 () Bool)

(declare-fun res!727889 () Bool)

(assert (=> b!1091646 (=> (not res!727889) (not e!623578))))

(assert (=> b!1091646 (= res!727889 (arrayNoDuplicates!0 lt!486948 #b00000000000000000000000000000000 Nil!23675))))

(declare-fun mapIsEmpty!41887 () Bool)

(declare-fun mapRes!41887 () Bool)

(assert (=> mapIsEmpty!41887 mapRes!41887))

(declare-fun b!1091647 () Bool)

(declare-fun res!727880 () Bool)

(assert (=> b!1091647 (=> (not res!727880) (not e!623582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091647 (= res!727880 (validKeyInArray!0 k0!904))))

(declare-fun b!1091648 () Bool)

(declare-fun res!727883 () Bool)

(assert (=> b!1091648 (=> (not res!727883) (not e!623582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70469 (_ BitVec 32)) Bool)

(assert (=> b!1091648 (= res!727883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091649 () Bool)

(declare-fun res!727887 () Bool)

(assert (=> b!1091649 (=> (not res!727887) (not e!623582))))

(assert (=> b!1091649 (= res!727887 (= (select (arr!33902 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41887 () Bool)

(declare-fun tp!80108 () Bool)

(declare-fun e!623584 () Bool)

(assert (=> mapNonEmpty!41887 (= mapRes!41887 (and tp!80108 e!623584))))

(declare-fun mapKey!41887 () (_ BitVec 32))

(declare-fun mapValue!41887 () ValueCell!12668)

(declare-fun mapRest!41887 () (Array (_ BitVec 32) ValueCell!12668))

(assert (=> mapNonEmpty!41887 (= (arr!33903 _values!874) (store mapRest!41887 mapKey!41887 mapValue!41887))))

(declare-fun b!1091643 () Bool)

(declare-fun e!623580 () Bool)

(assert (=> b!1091643 (= e!623580 true)))

(declare-fun lt!486944 () ListLongMap!15065)

(declare-fun lt!486941 () ListLongMap!15065)

(assert (=> b!1091643 (= (-!855 lt!486944 k0!904) lt!486941)))

(declare-fun lt!486950 () Unit!35877)

(declare-fun addRemoveCommutativeForDiffKeys!89 (ListLongMap!15065 (_ BitVec 64) V!40801 (_ BitVec 64)) Unit!35877)

(assert (=> b!1091643 (= lt!486950 (addRemoveCommutativeForDiffKeys!89 lt!486943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun res!727886 () Bool)

(assert (=> start!96336 (=> (not res!727886) (not e!623582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96336 (= res!727886 (validMask!0 mask!1414))))

(assert (=> start!96336 e!623582))

(assert (=> start!96336 tp!80107))

(assert (=> start!96336 true))

(assert (=> start!96336 tp_is_empty!26755))

(declare-fun array_inv!26192 (array!70469) Bool)

(assert (=> start!96336 (array_inv!26192 _keys!1070)))

(declare-fun e!623585 () Bool)

(declare-fun array_inv!26193 (array!70471) Bool)

(assert (=> start!96336 (and (array_inv!26193 _values!874) e!623585)))

(declare-fun b!1091650 () Bool)

(assert (=> b!1091650 (= e!623585 (and e!623579 mapRes!41887))))

(declare-fun condMapEmpty!41887 () Bool)

(declare-fun mapDefault!41887 () ValueCell!12668)

(assert (=> b!1091650 (= condMapEmpty!41887 (= (arr!33903 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12668)) mapDefault!41887)))))

(declare-fun b!1091651 () Bool)

(assert (=> b!1091651 (= e!623582 e!623578)))

(declare-fun res!727884 () Bool)

(assert (=> b!1091651 (=> (not res!727884) (not e!623578))))

(assert (=> b!1091651 (= res!727884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486948 mask!1414))))

(assert (=> b!1091651 (= lt!486948 (array!70470 (store (arr!33902 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34439 _keys!1070)))))

(declare-fun b!1091652 () Bool)

(declare-fun res!727888 () Bool)

(assert (=> b!1091652 (=> (not res!727888) (not e!623582))))

(assert (=> b!1091652 (= res!727888 (and (= (size!34440 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34439 _keys!1070) (size!34440 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091653 () Bool)

(assert (=> b!1091653 (= e!623581 e!623580)))

(declare-fun res!727881 () Bool)

(assert (=> b!1091653 (=> res!727881 e!623580)))

(assert (=> b!1091653 (= res!727881 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1091653 (= lt!486947 lt!486944)))

(declare-fun lt!486949 () tuple2!17088)

(declare-fun +!3364 (ListLongMap!15065 tuple2!17088) ListLongMap!15065)

(assert (=> b!1091653 (= lt!486944 (+!3364 lt!486943 lt!486949))))

(assert (=> b!1091653 (= lt!486946 lt!486941)))

(assert (=> b!1091653 (= lt!486941 (+!3364 lt!486939 lt!486949))))

(assert (=> b!1091653 (= lt!486946 (+!3364 lt!486945 lt!486949))))

(assert (=> b!1091653 (= lt!486949 (tuple2!17089 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091654 () Bool)

(assert (=> b!1091654 (= e!623584 tp_is_empty!26755)))

(declare-fun b!1091655 () Bool)

(declare-fun res!727882 () Bool)

(assert (=> b!1091655 (=> (not res!727882) (not e!623582))))

(assert (=> b!1091655 (= res!727882 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34439 _keys!1070))))))

(assert (= (and start!96336 res!727886) b!1091652))

(assert (= (and b!1091652 res!727888) b!1091648))

(assert (= (and b!1091648 res!727883) b!1091642))

(assert (= (and b!1091642 res!727885) b!1091655))

(assert (= (and b!1091655 res!727882) b!1091647))

(assert (= (and b!1091647 res!727880) b!1091649))

(assert (= (and b!1091649 res!727887) b!1091651))

(assert (= (and b!1091651 res!727884) b!1091646))

(assert (= (and b!1091646 res!727889) b!1091644))

(assert (= (and b!1091644 (not res!727890)) b!1091653))

(assert (= (and b!1091653 (not res!727881)) b!1091643))

(assert (= (and b!1091650 condMapEmpty!41887) mapIsEmpty!41887))

(assert (= (and b!1091650 (not condMapEmpty!41887)) mapNonEmpty!41887))

(get-info :version)

(assert (= (and mapNonEmpty!41887 ((_ is ValueCellFull!12668) mapValue!41887)) b!1091654))

(assert (= (and b!1091650 ((_ is ValueCellFull!12668) mapDefault!41887)) b!1091645))

(assert (= start!96336 b!1091650))

(declare-fun b_lambda!17433 () Bool)

(assert (=> (not b_lambda!17433) (not b!1091644)))

(declare-fun t!33480 () Bool)

(declare-fun tb!7623 () Bool)

(assert (=> (and start!96336 (= defaultEntry!882 defaultEntry!882) t!33480) tb!7623))

(declare-fun result!15773 () Bool)

(assert (=> tb!7623 (= result!15773 tp_is_empty!26755)))

(assert (=> b!1091644 t!33480))

(declare-fun b_and!36193 () Bool)

(assert (= b_and!36191 (and (=> t!33480 result!15773) b_and!36193)))

(declare-fun m!1011371 () Bool)

(assert (=> b!1091646 m!1011371))

(declare-fun m!1011373 () Bool)

(assert (=> b!1091647 m!1011373))

(declare-fun m!1011375 () Bool)

(assert (=> b!1091648 m!1011375))

(declare-fun m!1011377 () Bool)

(assert (=> b!1091649 m!1011377))

(declare-fun m!1011379 () Bool)

(assert (=> b!1091643 m!1011379))

(declare-fun m!1011381 () Bool)

(assert (=> b!1091643 m!1011381))

(declare-fun m!1011383 () Bool)

(assert (=> b!1091644 m!1011383))

(declare-fun m!1011385 () Bool)

(assert (=> b!1091644 m!1011385))

(declare-fun m!1011387 () Bool)

(assert (=> b!1091644 m!1011387))

(declare-fun m!1011389 () Bool)

(assert (=> b!1091644 m!1011389))

(declare-fun m!1011391 () Bool)

(assert (=> b!1091644 m!1011391))

(declare-fun m!1011393 () Bool)

(assert (=> b!1091644 m!1011393))

(declare-fun m!1011395 () Bool)

(assert (=> b!1091644 m!1011395))

(declare-fun m!1011397 () Bool)

(assert (=> b!1091644 m!1011397))

(declare-fun m!1011399 () Bool)

(assert (=> b!1091644 m!1011399))

(declare-fun m!1011401 () Bool)

(assert (=> b!1091644 m!1011401))

(declare-fun m!1011403 () Bool)

(assert (=> b!1091653 m!1011403))

(declare-fun m!1011405 () Bool)

(assert (=> b!1091653 m!1011405))

(declare-fun m!1011407 () Bool)

(assert (=> b!1091653 m!1011407))

(declare-fun m!1011409 () Bool)

(assert (=> mapNonEmpty!41887 m!1011409))

(declare-fun m!1011411 () Bool)

(assert (=> start!96336 m!1011411))

(declare-fun m!1011413 () Bool)

(assert (=> start!96336 m!1011413))

(declare-fun m!1011415 () Bool)

(assert (=> start!96336 m!1011415))

(declare-fun m!1011417 () Bool)

(assert (=> b!1091642 m!1011417))

(declare-fun m!1011419 () Bool)

(assert (=> b!1091651 m!1011419))

(declare-fun m!1011421 () Bool)

(assert (=> b!1091651 m!1011421))

(check-sat (not mapNonEmpty!41887) (not b!1091648) (not b!1091647) tp_is_empty!26755 (not b!1091642) (not b!1091643) (not b!1091651) (not b_next!22753) (not b!1091644) b_and!36193 (not b!1091646) (not b_lambda!17433) (not start!96336) (not b!1091653))
(check-sat b_and!36193 (not b_next!22753))
