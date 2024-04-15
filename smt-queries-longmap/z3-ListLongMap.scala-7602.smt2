; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95926 () Bool)

(assert start!95926)

(declare-fun b_free!22585 () Bool)

(declare-fun b_next!22585 () Bool)

(assert (=> start!95926 (= b_free!22585 (not b_next!22585))))

(declare-fun tp!79603 () Bool)

(declare-fun b_and!35819 () Bool)

(assert (=> start!95926 (= tp!79603 b_and!35819)))

(declare-fun b!1086448 () Bool)

(declare-fun res!724504 () Bool)

(declare-fun e!620614 () Bool)

(assert (=> b!1086448 (=> (not res!724504) (not e!620614))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70028 0))(
  ( (array!70029 (arr!33688 (Array (_ BitVec 32) (_ BitVec 64))) (size!34226 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70028)

(declare-datatypes ((V!40577 0))(
  ( (V!40578 (val!13350 Int)) )
))
(declare-datatypes ((ValueCell!12584 0))(
  ( (ValueCellFull!12584 (v!15970 V!40577)) (EmptyCell!12584) )
))
(declare-datatypes ((array!70030 0))(
  ( (array!70031 (arr!33689 (Array (_ BitVec 32) ValueCell!12584)) (size!34227 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70030)

(assert (=> b!1086448 (= res!724504 (and (= (size!34227 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34226 _keys!1070) (size!34227 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086449 () Bool)

(declare-fun res!724505 () Bool)

(assert (=> b!1086449 (=> (not res!724505) (not e!620614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70028 (_ BitVec 32)) Bool)

(assert (=> b!1086449 (= res!724505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086450 () Bool)

(declare-fun e!620618 () Bool)

(declare-fun e!620620 () Bool)

(declare-fun mapRes!41635 () Bool)

(assert (=> b!1086450 (= e!620618 (and e!620620 mapRes!41635))))

(declare-fun condMapEmpty!41635 () Bool)

(declare-fun mapDefault!41635 () ValueCell!12584)

(assert (=> b!1086450 (= condMapEmpty!41635 (= (arr!33689 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12584)) mapDefault!41635)))))

(declare-fun b!1086451 () Bool)

(declare-fun res!724501 () Bool)

(declare-fun e!620621 () Bool)

(assert (=> b!1086451 (=> (not res!724501) (not e!620621))))

(declare-fun lt!482842 () array!70028)

(declare-datatypes ((List!23559 0))(
  ( (Nil!23556) (Cons!23555 (h!24764 (_ BitVec 64)) (t!33193 List!23559)) )
))
(declare-fun arrayNoDuplicates!0 (array!70028 (_ BitVec 32) List!23559) Bool)

(assert (=> b!1086451 (= res!724501 (arrayNoDuplicates!0 lt!482842 #b00000000000000000000000000000000 Nil!23556))))

(declare-fun b!1086452 () Bool)

(declare-fun e!620616 () Bool)

(declare-fun tp_is_empty!26587 () Bool)

(assert (=> b!1086452 (= e!620616 tp_is_empty!26587)))

(declare-fun mapIsEmpty!41635 () Bool)

(assert (=> mapIsEmpty!41635 mapRes!41635))

(declare-fun b!1086453 () Bool)

(declare-fun res!724503 () Bool)

(assert (=> b!1086453 (=> (not res!724503) (not e!620614))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086453 (= res!724503 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34226 _keys!1070))))))

(declare-fun b!1086454 () Bool)

(assert (=> b!1086454 (= e!620614 e!620621)))

(declare-fun res!724508 () Bool)

(assert (=> b!1086454 (=> (not res!724508) (not e!620621))))

(assert (=> b!1086454 (= res!724508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482842 mask!1414))))

(assert (=> b!1086454 (= lt!482842 (array!70029 (store (arr!33688 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34226 _keys!1070)))))

(declare-fun b!1086455 () Bool)

(declare-fun e!620617 () Bool)

(assert (=> b!1086455 (= e!620621 (not e!620617))))

(declare-fun res!724502 () Bool)

(assert (=> b!1086455 (=> res!724502 e!620617)))

(assert (=> b!1086455 (= res!724502 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40577)

(declare-datatypes ((tuple2!16990 0))(
  ( (tuple2!16991 (_1!8506 (_ BitVec 64)) (_2!8506 V!40577)) )
))
(declare-datatypes ((List!23560 0))(
  ( (Nil!23557) (Cons!23556 (h!24765 tuple2!16990) (t!33194 List!23560)) )
))
(declare-datatypes ((ListLongMap!14959 0))(
  ( (ListLongMap!14960 (toList!7495 List!23560)) )
))
(declare-fun lt!482830 () ListLongMap!14959)

(declare-fun zeroValue!831 () V!40577)

(declare-fun getCurrentListMap!4179 (array!70028 array!70030 (_ BitVec 32) (_ BitVec 32) V!40577 V!40577 (_ BitVec 32) Int) ListLongMap!14959)

(assert (=> b!1086455 (= lt!482830 (getCurrentListMap!4179 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482837 () array!70030)

(declare-fun lt!482838 () ListLongMap!14959)

(assert (=> b!1086455 (= lt!482838 (getCurrentListMap!4179 lt!482842 lt!482837 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482835 () ListLongMap!14959)

(declare-fun lt!482832 () ListLongMap!14959)

(assert (=> b!1086455 (and (= lt!482835 lt!482832) (= lt!482832 lt!482835))))

(declare-fun lt!482846 () ListLongMap!14959)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!774 (ListLongMap!14959 (_ BitVec 64)) ListLongMap!14959)

(assert (=> b!1086455 (= lt!482832 (-!774 lt!482846 k0!904))))

(declare-datatypes ((Unit!35583 0))(
  ( (Unit!35584) )
))
(declare-fun lt!482843 () Unit!35583)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!63 (array!70028 array!70030 (_ BitVec 32) (_ BitVec 32) V!40577 V!40577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35583)

(assert (=> b!1086455 (= lt!482843 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!63 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4049 (array!70028 array!70030 (_ BitVec 32) (_ BitVec 32) V!40577 V!40577 (_ BitVec 32) Int) ListLongMap!14959)

(assert (=> b!1086455 (= lt!482835 (getCurrentListMapNoExtraKeys!4049 lt!482842 lt!482837 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2120 (Int (_ BitVec 64)) V!40577)

(assert (=> b!1086455 (= lt!482837 (array!70031 (store (arr!33689 _values!874) i!650 (ValueCellFull!12584 (dynLambda!2120 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34227 _values!874)))))

(assert (=> b!1086455 (= lt!482846 (getCurrentListMapNoExtraKeys!4049 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086455 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482834 () Unit!35583)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70028 (_ BitVec 64) (_ BitVec 32)) Unit!35583)

(assert (=> b!1086455 (= lt!482834 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086456 () Bool)

(declare-fun e!620619 () Bool)

(assert (=> b!1086456 (= e!620617 e!620619)))

(declare-fun res!724509 () Bool)

(assert (=> b!1086456 (=> res!724509 e!620619)))

(assert (=> b!1086456 (= res!724509 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482845 () ListLongMap!14959)

(declare-fun lt!482839 () ListLongMap!14959)

(assert (=> b!1086456 (= lt!482845 lt!482839)))

(declare-fun lt!482833 () ListLongMap!14959)

(assert (=> b!1086456 (= lt!482845 (-!774 lt!482833 k0!904))))

(declare-fun lt!482831 () Unit!35583)

(declare-fun addRemoveCommutativeForDiffKeys!32 (ListLongMap!14959 (_ BitVec 64) V!40577 (_ BitVec 64)) Unit!35583)

(assert (=> b!1086456 (= lt!482831 (addRemoveCommutativeForDiffKeys!32 lt!482846 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!482836 () tuple2!16990)

(declare-fun +!3303 (ListLongMap!14959 tuple2!16990) ListLongMap!14959)

(assert (=> b!1086456 (= lt!482838 (+!3303 lt!482839 lt!482836))))

(declare-fun lt!482841 () tuple2!16990)

(assert (=> b!1086456 (= lt!482839 (+!3303 lt!482832 lt!482841))))

(declare-fun lt!482844 () ListLongMap!14959)

(assert (=> b!1086456 (= lt!482830 lt!482844)))

(assert (=> b!1086456 (= lt!482844 (+!3303 lt!482833 lt!482836))))

(assert (=> b!1086456 (= lt!482833 (+!3303 lt!482846 lt!482841))))

(assert (=> b!1086456 (= lt!482838 (+!3303 (+!3303 lt!482835 lt!482841) lt!482836))))

(assert (=> b!1086456 (= lt!482836 (tuple2!16991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086456 (= lt!482841 (tuple2!16991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086457 () Bool)

(declare-fun res!724500 () Bool)

(assert (=> b!1086457 (=> (not res!724500) (not e!620614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086457 (= res!724500 (validKeyInArray!0 k0!904))))

(declare-fun res!724499 () Bool)

(assert (=> start!95926 (=> (not res!724499) (not e!620614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95926 (= res!724499 (validMask!0 mask!1414))))

(assert (=> start!95926 e!620614))

(assert (=> start!95926 tp!79603))

(assert (=> start!95926 true))

(assert (=> start!95926 tp_is_empty!26587))

(declare-fun array_inv!26034 (array!70028) Bool)

(assert (=> start!95926 (array_inv!26034 _keys!1070)))

(declare-fun array_inv!26035 (array!70030) Bool)

(assert (=> start!95926 (and (array_inv!26035 _values!874) e!620618)))

(declare-fun b!1086458 () Bool)

(declare-fun res!724506 () Bool)

(assert (=> b!1086458 (=> (not res!724506) (not e!620614))))

(assert (=> b!1086458 (= res!724506 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23556))))

(declare-fun b!1086459 () Bool)

(declare-fun res!724507 () Bool)

(assert (=> b!1086459 (=> (not res!724507) (not e!620614))))

(assert (=> b!1086459 (= res!724507 (= (select (arr!33688 _keys!1070) i!650) k0!904))))

(declare-fun b!1086460 () Bool)

(assert (=> b!1086460 (= e!620620 tp_is_empty!26587)))

(declare-fun mapNonEmpty!41635 () Bool)

(declare-fun tp!79604 () Bool)

(assert (=> mapNonEmpty!41635 (= mapRes!41635 (and tp!79604 e!620616))))

(declare-fun mapKey!41635 () (_ BitVec 32))

(declare-fun mapValue!41635 () ValueCell!12584)

(declare-fun mapRest!41635 () (Array (_ BitVec 32) ValueCell!12584))

(assert (=> mapNonEmpty!41635 (= (arr!33689 _values!874) (store mapRest!41635 mapKey!41635 mapValue!41635))))

(declare-fun b!1086461 () Bool)

(assert (=> b!1086461 (= e!620619 true)))

(assert (=> b!1086461 (= (-!774 lt!482844 k0!904) (+!3303 lt!482845 lt!482836))))

(declare-fun lt!482840 () Unit!35583)

(assert (=> b!1086461 (= lt!482840 (addRemoveCommutativeForDiffKeys!32 lt!482833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(assert (= (and start!95926 res!724499) b!1086448))

(assert (= (and b!1086448 res!724504) b!1086449))

(assert (= (and b!1086449 res!724505) b!1086458))

(assert (= (and b!1086458 res!724506) b!1086453))

(assert (= (and b!1086453 res!724503) b!1086457))

(assert (= (and b!1086457 res!724500) b!1086459))

(assert (= (and b!1086459 res!724507) b!1086454))

(assert (= (and b!1086454 res!724508) b!1086451))

(assert (= (and b!1086451 res!724501) b!1086455))

(assert (= (and b!1086455 (not res!724502)) b!1086456))

(assert (= (and b!1086456 (not res!724509)) b!1086461))

(assert (= (and b!1086450 condMapEmpty!41635) mapIsEmpty!41635))

(assert (= (and b!1086450 (not condMapEmpty!41635)) mapNonEmpty!41635))

(get-info :version)

(assert (= (and mapNonEmpty!41635 ((_ is ValueCellFull!12584) mapValue!41635)) b!1086452))

(assert (= (and b!1086450 ((_ is ValueCellFull!12584) mapDefault!41635)) b!1086460))

(assert (= start!95926 b!1086450))

(declare-fun b_lambda!17233 () Bool)

(assert (=> (not b_lambda!17233) (not b!1086455)))

(declare-fun t!33192 () Bool)

(declare-fun tb!7455 () Bool)

(assert (=> (and start!95926 (= defaultEntry!882 defaultEntry!882) t!33192) tb!7455))

(declare-fun result!15437 () Bool)

(assert (=> tb!7455 (= result!15437 tp_is_empty!26587)))

(assert (=> b!1086455 t!33192))

(declare-fun b_and!35821 () Bool)

(assert (= b_and!35819 (and (=> t!33192 result!15437) b_and!35821)))

(declare-fun m!1004549 () Bool)

(assert (=> b!1086455 m!1004549))

(declare-fun m!1004551 () Bool)

(assert (=> b!1086455 m!1004551))

(declare-fun m!1004553 () Bool)

(assert (=> b!1086455 m!1004553))

(declare-fun m!1004555 () Bool)

(assert (=> b!1086455 m!1004555))

(declare-fun m!1004557 () Bool)

(assert (=> b!1086455 m!1004557))

(declare-fun m!1004559 () Bool)

(assert (=> b!1086455 m!1004559))

(declare-fun m!1004561 () Bool)

(assert (=> b!1086455 m!1004561))

(declare-fun m!1004563 () Bool)

(assert (=> b!1086455 m!1004563))

(declare-fun m!1004565 () Bool)

(assert (=> b!1086455 m!1004565))

(declare-fun m!1004567 () Bool)

(assert (=> b!1086455 m!1004567))

(declare-fun m!1004569 () Bool)

(assert (=> b!1086459 m!1004569))

(declare-fun m!1004571 () Bool)

(assert (=> start!95926 m!1004571))

(declare-fun m!1004573 () Bool)

(assert (=> start!95926 m!1004573))

(declare-fun m!1004575 () Bool)

(assert (=> start!95926 m!1004575))

(declare-fun m!1004577 () Bool)

(assert (=> b!1086456 m!1004577))

(declare-fun m!1004579 () Bool)

(assert (=> b!1086456 m!1004579))

(declare-fun m!1004581 () Bool)

(assert (=> b!1086456 m!1004581))

(declare-fun m!1004583 () Bool)

(assert (=> b!1086456 m!1004583))

(declare-fun m!1004585 () Bool)

(assert (=> b!1086456 m!1004585))

(assert (=> b!1086456 m!1004583))

(declare-fun m!1004587 () Bool)

(assert (=> b!1086456 m!1004587))

(declare-fun m!1004589 () Bool)

(assert (=> b!1086456 m!1004589))

(declare-fun m!1004591 () Bool)

(assert (=> b!1086456 m!1004591))

(declare-fun m!1004593 () Bool)

(assert (=> b!1086457 m!1004593))

(declare-fun m!1004595 () Bool)

(assert (=> b!1086461 m!1004595))

(declare-fun m!1004597 () Bool)

(assert (=> b!1086461 m!1004597))

(declare-fun m!1004599 () Bool)

(assert (=> b!1086461 m!1004599))

(declare-fun m!1004601 () Bool)

(assert (=> b!1086454 m!1004601))

(declare-fun m!1004603 () Bool)

(assert (=> b!1086454 m!1004603))

(declare-fun m!1004605 () Bool)

(assert (=> mapNonEmpty!41635 m!1004605))

(declare-fun m!1004607 () Bool)

(assert (=> b!1086451 m!1004607))

(declare-fun m!1004609 () Bool)

(assert (=> b!1086449 m!1004609))

(declare-fun m!1004611 () Bool)

(assert (=> b!1086458 m!1004611))

(check-sat (not b!1086457) b_and!35821 (not b!1086456) (not b!1086458) (not b!1086455) (not start!95926) (not b!1086451) (not mapNonEmpty!41635) (not b_next!22585) (not b!1086461) (not b!1086454) tp_is_empty!26587 (not b!1086449) (not b_lambda!17233))
(check-sat b_and!35821 (not b_next!22585))
