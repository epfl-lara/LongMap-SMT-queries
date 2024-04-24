; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96306 () Bool)

(assert start!96306)

(declare-fun b_free!22723 () Bool)

(declare-fun b_next!22723 () Bool)

(assert (=> start!96306 (= b_free!22723 (not b_next!22723))))

(declare-fun tp!80017 () Bool)

(declare-fun b_and!36131 () Bool)

(assert (=> start!96306 (= tp!80017 b_and!36131)))

(declare-fun b!1090973 () Bool)

(declare-fun res!727384 () Bool)

(declare-fun e!623218 () Bool)

(assert (=> b!1090973 (=> (not res!727384) (not e!623218))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70409 0))(
  ( (array!70410 (arr!33872 (Array (_ BitVec 32) (_ BitVec 64))) (size!34409 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70409)

(assert (=> b!1090973 (= res!727384 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34409 _keys!1070))))))

(declare-fun b!1090974 () Bool)

(declare-fun e!623219 () Bool)

(assert (=> b!1090974 (= e!623219 (bvsle #b00000000000000000000000000000000 (size!34409 _keys!1070)))))

(declare-datatypes ((V!40761 0))(
  ( (V!40762 (val!13419 Int)) )
))
(declare-datatypes ((tuple2!17060 0))(
  ( (tuple2!17061 (_1!8541 (_ BitVec 64)) (_2!8541 V!40761)) )
))
(declare-datatypes ((List!23652 0))(
  ( (Nil!23649) (Cons!23648 (h!24866 tuple2!17060) (t!33425 List!23652)) )
))
(declare-datatypes ((ListLongMap!15037 0))(
  ( (ListLongMap!15038 (toList!7534 List!23652)) )
))
(declare-fun lt!486384 () ListLongMap!15037)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!486387 () ListLongMap!15037)

(declare-fun -!843 (ListLongMap!15037 (_ BitVec 64)) ListLongMap!15037)

(assert (=> b!1090974 (= (-!843 lt!486384 k0!904) lt!486387)))

(declare-datatypes ((Unit!35853 0))(
  ( (Unit!35854) )
))
(declare-fun lt!486383 () Unit!35853)

(declare-fun lt!486391 () ListLongMap!15037)

(declare-fun zeroValue!831 () V!40761)

(declare-fun addRemoveCommutativeForDiffKeys!81 (ListLongMap!15037 (_ BitVec 64) V!40761 (_ BitVec 64)) Unit!35853)

(assert (=> b!1090974 (= lt!486383 (addRemoveCommutativeForDiffKeys!81 lt!486391 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1090975 () Bool)

(declare-fun res!727380 () Bool)

(assert (=> b!1090975 (=> (not res!727380) (not e!623218))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12653 0))(
  ( (ValueCellFull!12653 (v!16036 V!40761)) (EmptyCell!12653) )
))
(declare-datatypes ((array!70411 0))(
  ( (array!70412 (arr!33873 (Array (_ BitVec 32) ValueCell!12653)) (size!34410 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70411)

(assert (=> b!1090975 (= res!727380 (and (= (size!34410 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34409 _keys!1070) (size!34410 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090977 () Bool)

(declare-fun e!623225 () Bool)

(declare-fun tp_is_empty!26725 () Bool)

(assert (=> b!1090977 (= e!623225 tp_is_empty!26725)))

(declare-fun b!1090978 () Bool)

(declare-fun res!727376 () Bool)

(assert (=> b!1090978 (=> (not res!727376) (not e!623218))))

(declare-datatypes ((List!23653 0))(
  ( (Nil!23650) (Cons!23649 (h!24867 (_ BitVec 64)) (t!33426 List!23653)) )
))
(declare-fun arrayNoDuplicates!0 (array!70409 (_ BitVec 32) List!23653) Bool)

(assert (=> b!1090978 (= res!727376 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23650))))

(declare-fun b!1090979 () Bool)

(declare-fun e!623220 () Bool)

(assert (=> b!1090979 (= e!623220 tp_is_empty!26725)))

(declare-fun b!1090980 () Bool)

(declare-fun e!623223 () Bool)

(assert (=> b!1090980 (= e!623218 e!623223)))

(declare-fun res!727385 () Bool)

(assert (=> b!1090980 (=> (not res!727385) (not e!623223))))

(declare-fun lt!486386 () array!70409)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70409 (_ BitVec 32)) Bool)

(assert (=> b!1090980 (= res!727385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486386 mask!1414))))

(assert (=> b!1090980 (= lt!486386 (array!70410 (store (arr!33872 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34409 _keys!1070)))))

(declare-fun b!1090981 () Bool)

(declare-fun e!623222 () Bool)

(assert (=> b!1090981 (= e!623223 (not e!623222))))

(declare-fun res!727382 () Bool)

(assert (=> b!1090981 (=> res!727382 e!623222)))

(assert (=> b!1090981 (= res!727382 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40761)

(declare-fun lt!486388 () ListLongMap!15037)

(declare-fun getCurrentListMap!4290 (array!70409 array!70411 (_ BitVec 32) (_ BitVec 32) V!40761 V!40761 (_ BitVec 32) Int) ListLongMap!15037)

(assert (=> b!1090981 (= lt!486388 (getCurrentListMap!4290 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486390 () array!70411)

(declare-fun lt!486381 () ListLongMap!15037)

(assert (=> b!1090981 (= lt!486381 (getCurrentListMap!4290 lt!486386 lt!486390 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486393 () ListLongMap!15037)

(declare-fun lt!486389 () ListLongMap!15037)

(assert (=> b!1090981 (and (= lt!486393 lt!486389) (= lt!486389 lt!486393))))

(assert (=> b!1090981 (= lt!486389 (-!843 lt!486391 k0!904))))

(declare-fun lt!486385 () Unit!35853)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!119 (array!70409 array!70411 (_ BitVec 32) (_ BitVec 32) V!40761 V!40761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35853)

(assert (=> b!1090981 (= lt!486385 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!119 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4095 (array!70409 array!70411 (_ BitVec 32) (_ BitVec 32) V!40761 V!40761 (_ BitVec 32) Int) ListLongMap!15037)

(assert (=> b!1090981 (= lt!486393 (getCurrentListMapNoExtraKeys!4095 lt!486386 lt!486390 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2216 (Int (_ BitVec 64)) V!40761)

(assert (=> b!1090981 (= lt!486390 (array!70412 (store (arr!33873 _values!874) i!650 (ValueCellFull!12653 (dynLambda!2216 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34410 _values!874)))))

(assert (=> b!1090981 (= lt!486391 (getCurrentListMapNoExtraKeys!4095 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090981 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486392 () Unit!35853)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70409 (_ BitVec 64) (_ BitVec 32)) Unit!35853)

(assert (=> b!1090981 (= lt!486392 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090982 () Bool)

(declare-fun res!727377 () Bool)

(assert (=> b!1090982 (=> (not res!727377) (not e!623218))))

(assert (=> b!1090982 (= res!727377 (= (select (arr!33872 _keys!1070) i!650) k0!904))))

(declare-fun res!727379 () Bool)

(assert (=> start!96306 (=> (not res!727379) (not e!623218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96306 (= res!727379 (validMask!0 mask!1414))))

(assert (=> start!96306 e!623218))

(assert (=> start!96306 tp!80017))

(assert (=> start!96306 true))

(assert (=> start!96306 tp_is_empty!26725))

(declare-fun array_inv!26172 (array!70409) Bool)

(assert (=> start!96306 (array_inv!26172 _keys!1070)))

(declare-fun e!623221 () Bool)

(declare-fun array_inv!26173 (array!70411) Bool)

(assert (=> start!96306 (and (array_inv!26173 _values!874) e!623221)))

(declare-fun b!1090976 () Bool)

(assert (=> b!1090976 (= e!623222 e!623219)))

(declare-fun res!727386 () Bool)

(assert (=> b!1090976 (=> res!727386 e!623219)))

(assert (=> b!1090976 (= res!727386 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1090976 (= lt!486381 lt!486387)))

(declare-fun lt!486382 () tuple2!17060)

(declare-fun +!3352 (ListLongMap!15037 tuple2!17060) ListLongMap!15037)

(assert (=> b!1090976 (= lt!486387 (+!3352 lt!486389 lt!486382))))

(assert (=> b!1090976 (= lt!486388 lt!486384)))

(assert (=> b!1090976 (= lt!486384 (+!3352 lt!486391 lt!486382))))

(assert (=> b!1090976 (= lt!486381 (+!3352 lt!486393 lt!486382))))

(assert (=> b!1090976 (= lt!486382 (tuple2!17061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1090983 () Bool)

(declare-fun mapRes!41842 () Bool)

(assert (=> b!1090983 (= e!623221 (and e!623220 mapRes!41842))))

(declare-fun condMapEmpty!41842 () Bool)

(declare-fun mapDefault!41842 () ValueCell!12653)

(assert (=> b!1090983 (= condMapEmpty!41842 (= (arr!33873 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12653)) mapDefault!41842)))))

(declare-fun b!1090984 () Bool)

(declare-fun res!727383 () Bool)

(assert (=> b!1090984 (=> (not res!727383) (not e!623218))))

(assert (=> b!1090984 (= res!727383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41842 () Bool)

(declare-fun tp!80018 () Bool)

(assert (=> mapNonEmpty!41842 (= mapRes!41842 (and tp!80018 e!623225))))

(declare-fun mapRest!41842 () (Array (_ BitVec 32) ValueCell!12653))

(declare-fun mapValue!41842 () ValueCell!12653)

(declare-fun mapKey!41842 () (_ BitVec 32))

(assert (=> mapNonEmpty!41842 (= (arr!33873 _values!874) (store mapRest!41842 mapKey!41842 mapValue!41842))))

(declare-fun b!1090985 () Bool)

(declare-fun res!727381 () Bool)

(assert (=> b!1090985 (=> (not res!727381) (not e!623218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090985 (= res!727381 (validKeyInArray!0 k0!904))))

(declare-fun b!1090986 () Bool)

(declare-fun res!727378 () Bool)

(assert (=> b!1090986 (=> (not res!727378) (not e!623223))))

(assert (=> b!1090986 (= res!727378 (arrayNoDuplicates!0 lt!486386 #b00000000000000000000000000000000 Nil!23650))))

(declare-fun mapIsEmpty!41842 () Bool)

(assert (=> mapIsEmpty!41842 mapRes!41842))

(assert (= (and start!96306 res!727379) b!1090975))

(assert (= (and b!1090975 res!727380) b!1090984))

(assert (= (and b!1090984 res!727383) b!1090978))

(assert (= (and b!1090978 res!727376) b!1090973))

(assert (= (and b!1090973 res!727384) b!1090985))

(assert (= (and b!1090985 res!727381) b!1090982))

(assert (= (and b!1090982 res!727377) b!1090980))

(assert (= (and b!1090980 res!727385) b!1090986))

(assert (= (and b!1090986 res!727378) b!1090981))

(assert (= (and b!1090981 (not res!727382)) b!1090976))

(assert (= (and b!1090976 (not res!727386)) b!1090974))

(assert (= (and b!1090983 condMapEmpty!41842) mapIsEmpty!41842))

(assert (= (and b!1090983 (not condMapEmpty!41842)) mapNonEmpty!41842))

(get-info :version)

(assert (= (and mapNonEmpty!41842 ((_ is ValueCellFull!12653) mapValue!41842)) b!1090977))

(assert (= (and b!1090983 ((_ is ValueCellFull!12653) mapDefault!41842)) b!1090979))

(assert (= start!96306 b!1090983))

(declare-fun b_lambda!17403 () Bool)

(assert (=> (not b_lambda!17403) (not b!1090981)))

(declare-fun t!33424 () Bool)

(declare-fun tb!7593 () Bool)

(assert (=> (and start!96306 (= defaultEntry!882 defaultEntry!882) t!33424) tb!7593))

(declare-fun result!15713 () Bool)

(assert (=> tb!7593 (= result!15713 tp_is_empty!26725)))

(assert (=> b!1090981 t!33424))

(declare-fun b_and!36133 () Bool)

(assert (= b_and!36131 (and (=> t!33424 result!15713) b_and!36133)))

(declare-fun m!1010603 () Bool)

(assert (=> b!1090974 m!1010603))

(declare-fun m!1010605 () Bool)

(assert (=> b!1090974 m!1010605))

(declare-fun m!1010607 () Bool)

(assert (=> b!1090984 m!1010607))

(declare-fun m!1010609 () Bool)

(assert (=> b!1090978 m!1010609))

(declare-fun m!1010611 () Bool)

(assert (=> mapNonEmpty!41842 m!1010611))

(declare-fun m!1010613 () Bool)

(assert (=> b!1090981 m!1010613))

(declare-fun m!1010615 () Bool)

(assert (=> b!1090981 m!1010615))

(declare-fun m!1010617 () Bool)

(assert (=> b!1090981 m!1010617))

(declare-fun m!1010619 () Bool)

(assert (=> b!1090981 m!1010619))

(declare-fun m!1010621 () Bool)

(assert (=> b!1090981 m!1010621))

(declare-fun m!1010623 () Bool)

(assert (=> b!1090981 m!1010623))

(declare-fun m!1010625 () Bool)

(assert (=> b!1090981 m!1010625))

(declare-fun m!1010627 () Bool)

(assert (=> b!1090981 m!1010627))

(declare-fun m!1010629 () Bool)

(assert (=> b!1090981 m!1010629))

(declare-fun m!1010631 () Bool)

(assert (=> b!1090981 m!1010631))

(declare-fun m!1010633 () Bool)

(assert (=> b!1090980 m!1010633))

(declare-fun m!1010635 () Bool)

(assert (=> b!1090980 m!1010635))

(declare-fun m!1010637 () Bool)

(assert (=> b!1090976 m!1010637))

(declare-fun m!1010639 () Bool)

(assert (=> b!1090976 m!1010639))

(declare-fun m!1010641 () Bool)

(assert (=> b!1090976 m!1010641))

(declare-fun m!1010643 () Bool)

(assert (=> start!96306 m!1010643))

(declare-fun m!1010645 () Bool)

(assert (=> start!96306 m!1010645))

(declare-fun m!1010647 () Bool)

(assert (=> start!96306 m!1010647))

(declare-fun m!1010649 () Bool)

(assert (=> b!1090985 m!1010649))

(declare-fun m!1010651 () Bool)

(assert (=> b!1090986 m!1010651))

(declare-fun m!1010653 () Bool)

(assert (=> b!1090982 m!1010653))

(check-sat (not start!96306) (not b!1090984) (not b!1090985) (not b!1090976) (not b_next!22723) (not b!1090986) b_and!36133 tp_is_empty!26725 (not b_lambda!17403) (not mapNonEmpty!41842) (not b!1090981) (not b!1090980) (not b!1090978) (not b!1090974))
(check-sat b_and!36133 (not b_next!22723))
