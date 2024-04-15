; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96154 () Bool)

(assert start!96154)

(declare-fun b_free!22813 () Bool)

(declare-fun b_next!22813 () Bool)

(assert (=> start!96154 (= b_free!22813 (not b_next!22813))))

(declare-fun tp!80288 () Bool)

(declare-fun b_and!36275 () Bool)

(assert (=> start!96154 (= tp!80288 b_and!36275)))

(declare-fun mapNonEmpty!41977 () Bool)

(declare-fun mapRes!41977 () Bool)

(declare-fun tp!80287 () Bool)

(declare-fun e!623352 () Bool)

(assert (=> mapNonEmpty!41977 (= mapRes!41977 (and tp!80287 e!623352))))

(declare-datatypes ((V!40881 0))(
  ( (V!40882 (val!13464 Int)) )
))
(declare-datatypes ((ValueCell!12698 0))(
  ( (ValueCellFull!12698 (v!16084 V!40881)) (EmptyCell!12698) )
))
(declare-datatypes ((array!70470 0))(
  ( (array!70471 (arr!33909 (Array (_ BitVec 32) ValueCell!12698)) (size!34447 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70470)

(declare-fun mapRest!41977 () (Array (_ BitVec 32) ValueCell!12698))

(declare-fun mapKey!41977 () (_ BitVec 32))

(declare-fun mapValue!41977 () ValueCell!12698)

(assert (=> mapNonEmpty!41977 (= (arr!33909 _values!874) (store mapRest!41977 mapKey!41977 mapValue!41977))))

(declare-fun b!1091482 () Bool)

(declare-fun e!623351 () Bool)

(declare-fun e!623354 () Bool)

(assert (=> b!1091482 (= e!623351 (and e!623354 mapRes!41977))))

(declare-fun condMapEmpty!41977 () Bool)

(declare-fun mapDefault!41977 () ValueCell!12698)

(assert (=> b!1091482 (= condMapEmpty!41977 (= (arr!33909 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12698)) mapDefault!41977)))))

(declare-fun b!1091483 () Bool)

(declare-fun res!728287 () Bool)

(declare-fun e!623356 () Bool)

(assert (=> b!1091483 (=> (not res!728287) (not e!623356))))

(declare-datatypes ((array!70472 0))(
  ( (array!70473 (arr!33910 (Array (_ BitVec 32) (_ BitVec 64))) (size!34448 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70472)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091483 (= res!728287 (= (select (arr!33910 _keys!1070) i!650) k0!904))))

(declare-fun b!1091484 () Bool)

(declare-fun e!623355 () Bool)

(declare-fun e!623357 () Bool)

(assert (=> b!1091484 (= e!623355 (not e!623357))))

(declare-fun res!728284 () Bool)

(assert (=> b!1091484 (=> res!728284 e!623357)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091484 (= res!728284 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40881)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40881)

(declare-datatypes ((tuple2!17180 0))(
  ( (tuple2!17181 (_1!8601 (_ BitVec 64)) (_2!8601 V!40881)) )
))
(declare-datatypes ((List!23743 0))(
  ( (Nil!23740) (Cons!23739 (h!24948 tuple2!17180) (t!33605 List!23743)) )
))
(declare-datatypes ((ListLongMap!15149 0))(
  ( (ListLongMap!15150 (toList!7590 List!23743)) )
))
(declare-fun lt!487406 () ListLongMap!15149)

(declare-fun getCurrentListMap!4256 (array!70472 array!70470 (_ BitVec 32) (_ BitVec 32) V!40881 V!40881 (_ BitVec 32) Int) ListLongMap!15149)

(assert (=> b!1091484 (= lt!487406 (getCurrentListMap!4256 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487395 () array!70472)

(declare-fun lt!487404 () ListLongMap!15149)

(declare-fun lt!487397 () array!70470)

(assert (=> b!1091484 (= lt!487404 (getCurrentListMap!4256 lt!487395 lt!487397 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487394 () ListLongMap!15149)

(declare-fun lt!487400 () ListLongMap!15149)

(assert (=> b!1091484 (and (= lt!487394 lt!487400) (= lt!487400 lt!487394))))

(declare-fun lt!487405 () ListLongMap!15149)

(declare-fun -!862 (ListLongMap!15149 (_ BitVec 64)) ListLongMap!15149)

(assert (=> b!1091484 (= lt!487400 (-!862 lt!487405 k0!904))))

(declare-datatypes ((Unit!35759 0))(
  ( (Unit!35760) )
))
(declare-fun lt!487399 () Unit!35759)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!140 (array!70472 array!70470 (_ BitVec 32) (_ BitVec 32) V!40881 V!40881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35759)

(assert (=> b!1091484 (= lt!487399 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!140 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4126 (array!70472 array!70470 (_ BitVec 32) (_ BitVec 32) V!40881 V!40881 (_ BitVec 32) Int) ListLongMap!15149)

(assert (=> b!1091484 (= lt!487394 (getCurrentListMapNoExtraKeys!4126 lt!487395 lt!487397 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2197 (Int (_ BitVec 64)) V!40881)

(assert (=> b!1091484 (= lt!487397 (array!70471 (store (arr!33909 _values!874) i!650 (ValueCellFull!12698 (dynLambda!2197 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34447 _values!874)))))

(assert (=> b!1091484 (= lt!487405 (getCurrentListMapNoExtraKeys!4126 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091484 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487401 () Unit!35759)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70472 (_ BitVec 64) (_ BitVec 32)) Unit!35759)

(assert (=> b!1091484 (= lt!487401 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091485 () Bool)

(declare-fun e!623353 () Bool)

(assert (=> b!1091485 (= e!623357 e!623353)))

(declare-fun res!728280 () Bool)

(assert (=> b!1091485 (=> res!728280 e!623353)))

(assert (=> b!1091485 (= res!728280 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!487398 () ListLongMap!15149)

(assert (=> b!1091485 (= lt!487406 lt!487398)))

(declare-fun lt!487403 () tuple2!17180)

(declare-fun +!3378 (ListLongMap!15149 tuple2!17180) ListLongMap!15149)

(assert (=> b!1091485 (= lt!487398 (+!3378 lt!487405 lt!487403))))

(declare-fun lt!487402 () ListLongMap!15149)

(assert (=> b!1091485 (= lt!487404 lt!487402)))

(assert (=> b!1091485 (= lt!487402 (+!3378 lt!487400 lt!487403))))

(assert (=> b!1091485 (= lt!487404 (+!3378 lt!487394 lt!487403))))

(assert (=> b!1091485 (= lt!487403 (tuple2!17181 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091486 () Bool)

(declare-fun tp_is_empty!26815 () Bool)

(assert (=> b!1091486 (= e!623352 tp_is_empty!26815)))

(declare-fun res!728289 () Bool)

(assert (=> start!96154 (=> (not res!728289) (not e!623356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96154 (= res!728289 (validMask!0 mask!1414))))

(assert (=> start!96154 e!623356))

(assert (=> start!96154 tp!80288))

(assert (=> start!96154 true))

(assert (=> start!96154 tp_is_empty!26815))

(declare-fun array_inv!26184 (array!70472) Bool)

(assert (=> start!96154 (array_inv!26184 _keys!1070)))

(declare-fun array_inv!26185 (array!70470) Bool)

(assert (=> start!96154 (and (array_inv!26185 _values!874) e!623351)))

(declare-fun b!1091487 () Bool)

(declare-fun res!728288 () Bool)

(assert (=> b!1091487 (=> (not res!728288) (not e!623355))))

(declare-datatypes ((List!23744 0))(
  ( (Nil!23741) (Cons!23740 (h!24949 (_ BitVec 64)) (t!33606 List!23744)) )
))
(declare-fun arrayNoDuplicates!0 (array!70472 (_ BitVec 32) List!23744) Bool)

(assert (=> b!1091487 (= res!728288 (arrayNoDuplicates!0 lt!487395 #b00000000000000000000000000000000 Nil!23741))))

(declare-fun b!1091488 () Bool)

(declare-fun res!728279 () Bool)

(assert (=> b!1091488 (=> (not res!728279) (not e!623356))))

(assert (=> b!1091488 (= res!728279 (and (= (size!34447 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34448 _keys!1070) (size!34447 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091489 () Bool)

(declare-fun res!728285 () Bool)

(assert (=> b!1091489 (=> (not res!728285) (not e!623356))))

(assert (=> b!1091489 (= res!728285 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23741))))

(declare-fun b!1091490 () Bool)

(declare-fun res!728282 () Bool)

(assert (=> b!1091490 (=> (not res!728282) (not e!623356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091490 (= res!728282 (validKeyInArray!0 k0!904))))

(declare-fun b!1091491 () Bool)

(assert (=> b!1091491 (= e!623354 tp_is_empty!26815)))

(declare-fun b!1091492 () Bool)

(assert (=> b!1091492 (= e!623353 true)))

(assert (=> b!1091492 (= (-!862 lt!487398 k0!904) lt!487402)))

(declare-fun lt!487396 () Unit!35759)

(declare-fun addRemoveCommutativeForDiffKeys!105 (ListLongMap!15149 (_ BitVec 64) V!40881 (_ BitVec 64)) Unit!35759)

(assert (=> b!1091492 (= lt!487396 (addRemoveCommutativeForDiffKeys!105 lt!487405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091493 () Bool)

(declare-fun res!728281 () Bool)

(assert (=> b!1091493 (=> (not res!728281) (not e!623356))))

(assert (=> b!1091493 (= res!728281 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34448 _keys!1070))))))

(declare-fun b!1091494 () Bool)

(assert (=> b!1091494 (= e!623356 e!623355)))

(declare-fun res!728283 () Bool)

(assert (=> b!1091494 (=> (not res!728283) (not e!623355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70472 (_ BitVec 32)) Bool)

(assert (=> b!1091494 (= res!728283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487395 mask!1414))))

(assert (=> b!1091494 (= lt!487395 (array!70473 (store (arr!33910 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34448 _keys!1070)))))

(declare-fun b!1091495 () Bool)

(declare-fun res!728286 () Bool)

(assert (=> b!1091495 (=> (not res!728286) (not e!623356))))

(assert (=> b!1091495 (= res!728286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41977 () Bool)

(assert (=> mapIsEmpty!41977 mapRes!41977))

(assert (= (and start!96154 res!728289) b!1091488))

(assert (= (and b!1091488 res!728279) b!1091495))

(assert (= (and b!1091495 res!728286) b!1091489))

(assert (= (and b!1091489 res!728285) b!1091493))

(assert (= (and b!1091493 res!728281) b!1091490))

(assert (= (and b!1091490 res!728282) b!1091483))

(assert (= (and b!1091483 res!728287) b!1091494))

(assert (= (and b!1091494 res!728283) b!1091487))

(assert (= (and b!1091487 res!728288) b!1091484))

(assert (= (and b!1091484 (not res!728284)) b!1091485))

(assert (= (and b!1091485 (not res!728280)) b!1091492))

(assert (= (and b!1091482 condMapEmpty!41977) mapIsEmpty!41977))

(assert (= (and b!1091482 (not condMapEmpty!41977)) mapNonEmpty!41977))

(get-info :version)

(assert (= (and mapNonEmpty!41977 ((_ is ValueCellFull!12698) mapValue!41977)) b!1091486))

(assert (= (and b!1091482 ((_ is ValueCellFull!12698) mapDefault!41977)) b!1091491))

(assert (= start!96154 b!1091482))

(declare-fun b_lambda!17461 () Bool)

(assert (=> (not b_lambda!17461) (not b!1091484)))

(declare-fun t!33604 () Bool)

(declare-fun tb!7683 () Bool)

(assert (=> (and start!96154 (= defaultEntry!882 defaultEntry!882) t!33604) tb!7683))

(declare-fun result!15893 () Bool)

(assert (=> tb!7683 (= result!15893 tp_is_empty!26815)))

(assert (=> b!1091484 t!33604))

(declare-fun b_and!36277 () Bool)

(assert (= b_and!36275 (and (=> t!33604 result!15893) b_and!36277)))

(declare-fun m!1010633 () Bool)

(assert (=> b!1091487 m!1010633))

(declare-fun m!1010635 () Bool)

(assert (=> b!1091492 m!1010635))

(declare-fun m!1010637 () Bool)

(assert (=> b!1091492 m!1010637))

(declare-fun m!1010639 () Bool)

(assert (=> mapNonEmpty!41977 m!1010639))

(declare-fun m!1010641 () Bool)

(assert (=> b!1091484 m!1010641))

(declare-fun m!1010643 () Bool)

(assert (=> b!1091484 m!1010643))

(declare-fun m!1010645 () Bool)

(assert (=> b!1091484 m!1010645))

(declare-fun m!1010647 () Bool)

(assert (=> b!1091484 m!1010647))

(declare-fun m!1010649 () Bool)

(assert (=> b!1091484 m!1010649))

(declare-fun m!1010651 () Bool)

(assert (=> b!1091484 m!1010651))

(declare-fun m!1010653 () Bool)

(assert (=> b!1091484 m!1010653))

(declare-fun m!1010655 () Bool)

(assert (=> b!1091484 m!1010655))

(declare-fun m!1010657 () Bool)

(assert (=> b!1091484 m!1010657))

(declare-fun m!1010659 () Bool)

(assert (=> b!1091484 m!1010659))

(declare-fun m!1010661 () Bool)

(assert (=> b!1091489 m!1010661))

(declare-fun m!1010663 () Bool)

(assert (=> start!96154 m!1010663))

(declare-fun m!1010665 () Bool)

(assert (=> start!96154 m!1010665))

(declare-fun m!1010667 () Bool)

(assert (=> start!96154 m!1010667))

(declare-fun m!1010669 () Bool)

(assert (=> b!1091494 m!1010669))

(declare-fun m!1010671 () Bool)

(assert (=> b!1091494 m!1010671))

(declare-fun m!1010673 () Bool)

(assert (=> b!1091485 m!1010673))

(declare-fun m!1010675 () Bool)

(assert (=> b!1091485 m!1010675))

(declare-fun m!1010677 () Bool)

(assert (=> b!1091485 m!1010677))

(declare-fun m!1010679 () Bool)

(assert (=> b!1091483 m!1010679))

(declare-fun m!1010681 () Bool)

(assert (=> b!1091490 m!1010681))

(declare-fun m!1010683 () Bool)

(assert (=> b!1091495 m!1010683))

(check-sat (not b!1091490) (not b!1091489) (not mapNonEmpty!41977) (not start!96154) (not b!1091485) (not b!1091495) tp_is_empty!26815 b_and!36277 (not b_next!22813) (not b!1091487) (not b_lambda!17461) (not b!1091484) (not b!1091492) (not b!1091494))
(check-sat b_and!36277 (not b_next!22813))
