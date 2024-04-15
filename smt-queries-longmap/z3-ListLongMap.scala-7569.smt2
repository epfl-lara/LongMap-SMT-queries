; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95728 () Bool)

(assert start!95728)

(declare-fun b_free!22387 () Bool)

(declare-fun b_next!22387 () Bool)

(assert (=> start!95728 (= b_free!22387 (not b_next!22387))))

(declare-fun tp!79009 () Bool)

(declare-fun b_and!35423 () Bool)

(assert (=> start!95728 (= tp!79009 b_and!35423)))

(declare-fun b!1082412 () Bool)

(declare-fun e!618567 () Bool)

(assert (=> b!1082412 (= e!618567 (not true))))

(declare-datatypes ((V!40313 0))(
  ( (V!40314 (val!13251 Int)) )
))
(declare-datatypes ((tuple2!16848 0))(
  ( (tuple2!16849 (_1!8435 (_ BitVec 64)) (_2!8435 V!40313)) )
))
(declare-datatypes ((List!23415 0))(
  ( (Nil!23412) (Cons!23411 (h!24620 tuple2!16848) (t!32851 List!23415)) )
))
(declare-datatypes ((ListLongMap!14817 0))(
  ( (ListLongMap!14818 (toList!7424 List!23415)) )
))
(declare-fun lt!479460 () ListLongMap!14817)

(declare-fun lt!479465 () ListLongMap!14817)

(assert (=> b!1082412 (and (= lt!479460 lt!479465) (= lt!479465 lt!479460))))

(declare-fun lt!479461 () ListLongMap!14817)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!703 (ListLongMap!14817 (_ BitVec 64)) ListLongMap!14817)

(assert (=> b!1082412 (= lt!479465 (-!703 lt!479461 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40313)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((Unit!35441 0))(
  ( (Unit!35442) )
))
(declare-fun lt!479463 () Unit!35441)

(declare-fun zeroValue!831 () V!40313)

(declare-datatypes ((array!69648 0))(
  ( (array!69649 (arr!33498 (Array (_ BitVec 32) (_ BitVec 64))) (size!34036 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69648)

(declare-datatypes ((ValueCell!12485 0))(
  ( (ValueCellFull!12485 (v!15871 V!40313)) (EmptyCell!12485) )
))
(declare-datatypes ((array!69650 0))(
  ( (array!69651 (arr!33499 (Array (_ BitVec 32) ValueCell!12485)) (size!34037 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69650)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1 (array!69648 array!69650 (_ BitVec 32) (_ BitVec 32) V!40313 V!40313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35441)

(assert (=> b!1082412 (= lt!479463 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479462 () array!69648)

(declare-fun getCurrentListMapNoExtraKeys!3987 (array!69648 array!69650 (_ BitVec 32) (_ BitVec 32) V!40313 V!40313 (_ BitVec 32) Int) ListLongMap!14817)

(declare-fun dynLambda!2058 (Int (_ BitVec 64)) V!40313)

(assert (=> b!1082412 (= lt!479460 (getCurrentListMapNoExtraKeys!3987 lt!479462 (array!69651 (store (arr!33499 _values!874) i!650 (ValueCellFull!12485 (dynLambda!2058 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34037 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1082412 (= lt!479461 (getCurrentListMapNoExtraKeys!3987 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082412 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!479464 () Unit!35441)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69648 (_ BitVec 64) (_ BitVec 32)) Unit!35441)

(assert (=> b!1082412 (= lt!479464 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1082413 () Bool)

(declare-fun e!618568 () Bool)

(declare-fun tp_is_empty!26389 () Bool)

(assert (=> b!1082413 (= e!618568 tp_is_empty!26389)))

(declare-fun b!1082414 () Bool)

(declare-fun e!618569 () Bool)

(declare-fun mapRes!41338 () Bool)

(assert (=> b!1082414 (= e!618569 (and e!618568 mapRes!41338))))

(declare-fun condMapEmpty!41338 () Bool)

(declare-fun mapDefault!41338 () ValueCell!12485)

(assert (=> b!1082414 (= condMapEmpty!41338 (= (arr!33499 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12485)) mapDefault!41338)))))

(declare-fun b!1082415 () Bool)

(declare-fun res!721559 () Bool)

(declare-fun e!618572 () Bool)

(assert (=> b!1082415 (=> (not res!721559) (not e!618572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082415 (= res!721559 (validKeyInArray!0 k0!904))))

(declare-fun res!721558 () Bool)

(assert (=> start!95728 (=> (not res!721558) (not e!618572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95728 (= res!721558 (validMask!0 mask!1414))))

(assert (=> start!95728 e!618572))

(assert (=> start!95728 tp!79009))

(assert (=> start!95728 true))

(assert (=> start!95728 tp_is_empty!26389))

(declare-fun array_inv!25894 (array!69648) Bool)

(assert (=> start!95728 (array_inv!25894 _keys!1070)))

(declare-fun array_inv!25895 (array!69650) Bool)

(assert (=> start!95728 (and (array_inv!25895 _values!874) e!618569)))

(declare-fun b!1082416 () Bool)

(declare-fun res!721557 () Bool)

(assert (=> b!1082416 (=> (not res!721557) (not e!618572))))

(declare-datatypes ((List!23416 0))(
  ( (Nil!23413) (Cons!23412 (h!24621 (_ BitVec 64)) (t!32852 List!23416)) )
))
(declare-fun arrayNoDuplicates!0 (array!69648 (_ BitVec 32) List!23416) Bool)

(assert (=> b!1082416 (= res!721557 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23413))))

(declare-fun b!1082417 () Bool)

(declare-fun res!721553 () Bool)

(assert (=> b!1082417 (=> (not res!721553) (not e!618567))))

(assert (=> b!1082417 (= res!721553 (arrayNoDuplicates!0 lt!479462 #b00000000000000000000000000000000 Nil!23413))))

(declare-fun b!1082418 () Bool)

(declare-fun res!721554 () Bool)

(assert (=> b!1082418 (=> (not res!721554) (not e!618572))))

(assert (=> b!1082418 (= res!721554 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34036 _keys!1070))))))

(declare-fun b!1082419 () Bool)

(assert (=> b!1082419 (= e!618572 e!618567)))

(declare-fun res!721552 () Bool)

(assert (=> b!1082419 (=> (not res!721552) (not e!618567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69648 (_ BitVec 32)) Bool)

(assert (=> b!1082419 (= res!721552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479462 mask!1414))))

(assert (=> b!1082419 (= lt!479462 (array!69649 (store (arr!33498 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34036 _keys!1070)))))

(declare-fun b!1082420 () Bool)

(declare-fun res!721555 () Bool)

(assert (=> b!1082420 (=> (not res!721555) (not e!618572))))

(assert (=> b!1082420 (= res!721555 (and (= (size!34037 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34036 _keys!1070) (size!34037 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41338 () Bool)

(declare-fun tp!79010 () Bool)

(declare-fun e!618571 () Bool)

(assert (=> mapNonEmpty!41338 (= mapRes!41338 (and tp!79010 e!618571))))

(declare-fun mapValue!41338 () ValueCell!12485)

(declare-fun mapRest!41338 () (Array (_ BitVec 32) ValueCell!12485))

(declare-fun mapKey!41338 () (_ BitVec 32))

(assert (=> mapNonEmpty!41338 (= (arr!33499 _values!874) (store mapRest!41338 mapKey!41338 mapValue!41338))))

(declare-fun b!1082421 () Bool)

(assert (=> b!1082421 (= e!618571 tp_is_empty!26389)))

(declare-fun b!1082422 () Bool)

(declare-fun res!721560 () Bool)

(assert (=> b!1082422 (=> (not res!721560) (not e!618572))))

(assert (=> b!1082422 (= res!721560 (= (select (arr!33498 _keys!1070) i!650) k0!904))))

(declare-fun b!1082423 () Bool)

(declare-fun res!721556 () Bool)

(assert (=> b!1082423 (=> (not res!721556) (not e!618572))))

(assert (=> b!1082423 (= res!721556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41338 () Bool)

(assert (=> mapIsEmpty!41338 mapRes!41338))

(assert (= (and start!95728 res!721558) b!1082420))

(assert (= (and b!1082420 res!721555) b!1082423))

(assert (= (and b!1082423 res!721556) b!1082416))

(assert (= (and b!1082416 res!721557) b!1082418))

(assert (= (and b!1082418 res!721554) b!1082415))

(assert (= (and b!1082415 res!721559) b!1082422))

(assert (= (and b!1082422 res!721560) b!1082419))

(assert (= (and b!1082419 res!721552) b!1082417))

(assert (= (and b!1082417 res!721553) b!1082412))

(assert (= (and b!1082414 condMapEmpty!41338) mapIsEmpty!41338))

(assert (= (and b!1082414 (not condMapEmpty!41338)) mapNonEmpty!41338))

(get-info :version)

(assert (= (and mapNonEmpty!41338 ((_ is ValueCellFull!12485) mapValue!41338)) b!1082421))

(assert (= (and b!1082414 ((_ is ValueCellFull!12485) mapDefault!41338)) b!1082413))

(assert (= start!95728 b!1082414))

(declare-fun b_lambda!17035 () Bool)

(assert (=> (not b_lambda!17035) (not b!1082412)))

(declare-fun t!32850 () Bool)

(declare-fun tb!7257 () Bool)

(assert (=> (and start!95728 (= defaultEntry!882 defaultEntry!882) t!32850) tb!7257))

(declare-fun result!15041 () Bool)

(assert (=> tb!7257 (= result!15041 tp_is_empty!26389)))

(assert (=> b!1082412 t!32850))

(declare-fun b_and!35425 () Bool)

(assert (= b_and!35423 (and (=> t!32850 result!15041) b_and!35425)))

(declare-fun m!999611 () Bool)

(assert (=> b!1082423 m!999611))

(declare-fun m!999613 () Bool)

(assert (=> b!1082415 m!999613))

(declare-fun m!999615 () Bool)

(assert (=> b!1082417 m!999615))

(declare-fun m!999617 () Bool)

(assert (=> start!95728 m!999617))

(declare-fun m!999619 () Bool)

(assert (=> start!95728 m!999619))

(declare-fun m!999621 () Bool)

(assert (=> start!95728 m!999621))

(declare-fun m!999623 () Bool)

(assert (=> b!1082422 m!999623))

(declare-fun m!999625 () Bool)

(assert (=> b!1082419 m!999625))

(declare-fun m!999627 () Bool)

(assert (=> b!1082419 m!999627))

(declare-fun m!999629 () Bool)

(assert (=> b!1082412 m!999629))

(declare-fun m!999631 () Bool)

(assert (=> b!1082412 m!999631))

(declare-fun m!999633 () Bool)

(assert (=> b!1082412 m!999633))

(declare-fun m!999635 () Bool)

(assert (=> b!1082412 m!999635))

(declare-fun m!999637 () Bool)

(assert (=> b!1082412 m!999637))

(declare-fun m!999639 () Bool)

(assert (=> b!1082412 m!999639))

(declare-fun m!999641 () Bool)

(assert (=> b!1082412 m!999641))

(declare-fun m!999643 () Bool)

(assert (=> b!1082412 m!999643))

(declare-fun m!999645 () Bool)

(assert (=> b!1082416 m!999645))

(declare-fun m!999647 () Bool)

(assert (=> mapNonEmpty!41338 m!999647))

(check-sat (not b_lambda!17035) (not b!1082423) (not b!1082412) tp_is_empty!26389 (not b!1082415) (not b!1082416) (not b!1082419) (not start!95728) (not b_next!22387) (not mapNonEmpty!41338) b_and!35425 (not b!1082417))
(check-sat b_and!35425 (not b_next!22387))
