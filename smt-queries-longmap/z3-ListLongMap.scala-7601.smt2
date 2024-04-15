; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95920 () Bool)

(assert start!95920)

(declare-fun b_free!22579 () Bool)

(declare-fun b_next!22579 () Bool)

(assert (=> start!95920 (= b_free!22579 (not b_next!22579))))

(declare-fun tp!79586 () Bool)

(declare-fun b_and!35807 () Bool)

(assert (=> start!95920 (= tp!79586 b_and!35807)))

(declare-fun mapNonEmpty!41626 () Bool)

(declare-fun mapRes!41626 () Bool)

(declare-fun tp!79585 () Bool)

(declare-fun e!620546 () Bool)

(assert (=> mapNonEmpty!41626 (= mapRes!41626 (and tp!79585 e!620546))))

(declare-datatypes ((V!40569 0))(
  ( (V!40570 (val!13347 Int)) )
))
(declare-datatypes ((ValueCell!12581 0))(
  ( (ValueCellFull!12581 (v!15967 V!40569)) (EmptyCell!12581) )
))
(declare-fun mapRest!41626 () (Array (_ BitVec 32) ValueCell!12581))

(declare-fun mapKey!41626 () (_ BitVec 32))

(declare-datatypes ((array!70016 0))(
  ( (array!70017 (arr!33682 (Array (_ BitVec 32) ValueCell!12581)) (size!34220 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70016)

(declare-fun mapValue!41626 () ValueCell!12581)

(assert (=> mapNonEmpty!41626 (= (arr!33682 _values!874) (store mapRest!41626 mapKey!41626 mapValue!41626))))

(declare-fun b!1086316 () Bool)

(declare-fun res!724408 () Bool)

(declare-fun e!620544 () Bool)

(assert (=> b!1086316 (=> (not res!724408) (not e!620544))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70018 0))(
  ( (array!70019 (arr!33683 (Array (_ BitVec 32) (_ BitVec 64))) (size!34221 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70018)

(assert (=> b!1086316 (= res!724408 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34221 _keys!1070))))))

(declare-fun res!724400 () Bool)

(assert (=> start!95920 (=> (not res!724400) (not e!620544))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95920 (= res!724400 (validMask!0 mask!1414))))

(assert (=> start!95920 e!620544))

(assert (=> start!95920 tp!79586))

(assert (=> start!95920 true))

(declare-fun tp_is_empty!26581 () Bool)

(assert (=> start!95920 tp_is_empty!26581))

(declare-fun array_inv!26028 (array!70018) Bool)

(assert (=> start!95920 (array_inv!26028 _keys!1070)))

(declare-fun e!620545 () Bool)

(declare-fun array_inv!26029 (array!70016) Bool)

(assert (=> start!95920 (and (array_inv!26029 _values!874) e!620545)))

(declare-fun b!1086317 () Bool)

(declare-fun res!724406 () Bool)

(assert (=> b!1086317 (=> (not res!724406) (not e!620544))))

(declare-datatypes ((List!23553 0))(
  ( (Nil!23550) (Cons!23549 (h!24758 (_ BitVec 64)) (t!33181 List!23553)) )
))
(declare-fun arrayNoDuplicates!0 (array!70018 (_ BitVec 32) List!23553) Bool)

(assert (=> b!1086317 (= res!724406 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23550))))

(declare-fun b!1086318 () Bool)

(declare-fun res!724404 () Bool)

(assert (=> b!1086318 (=> (not res!724404) (not e!620544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70018 (_ BitVec 32)) Bool)

(assert (=> b!1086318 (= res!724404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086319 () Bool)

(declare-fun e!620543 () Bool)

(assert (=> b!1086319 (= e!620543 tp_is_empty!26581)))

(declare-fun b!1086320 () Bool)

(declare-fun e!620542 () Bool)

(assert (=> b!1086320 (= e!620544 e!620542)))

(declare-fun res!724405 () Bool)

(assert (=> b!1086320 (=> (not res!724405) (not e!620542))))

(declare-fun lt!482687 () array!70018)

(assert (=> b!1086320 (= res!724405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!482687 mask!1414))))

(assert (=> b!1086320 (= lt!482687 (array!70019 (store (arr!33683 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34221 _keys!1070)))))

(declare-fun b!1086321 () Bool)

(assert (=> b!1086321 (= e!620546 tp_is_empty!26581)))

(declare-fun b!1086322 () Bool)

(assert (=> b!1086322 (= e!620545 (and e!620543 mapRes!41626))))

(declare-fun condMapEmpty!41626 () Bool)

(declare-fun mapDefault!41626 () ValueCell!12581)

(assert (=> b!1086322 (= condMapEmpty!41626 (= (arr!33682 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12581)) mapDefault!41626)))))

(declare-fun b!1086323 () Bool)

(declare-fun res!724403 () Bool)

(assert (=> b!1086323 (=> (not res!724403) (not e!620544))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1086323 (= res!724403 (= (select (arr!33683 _keys!1070) i!650) k0!904))))

(declare-fun b!1086324 () Bool)

(declare-fun res!724407 () Bool)

(assert (=> b!1086324 (=> (not res!724407) (not e!620542))))

(assert (=> b!1086324 (= res!724407 (arrayNoDuplicates!0 lt!482687 #b00000000000000000000000000000000 Nil!23550))))

(declare-fun mapIsEmpty!41626 () Bool)

(assert (=> mapIsEmpty!41626 mapRes!41626))

(declare-fun b!1086325 () Bool)

(declare-fun e!620549 () Bool)

(assert (=> b!1086325 (= e!620549 true)))

(declare-datatypes ((tuple2!16984 0))(
  ( (tuple2!16985 (_1!8503 (_ BitVec 64)) (_2!8503 V!40569)) )
))
(declare-fun lt!482692 () tuple2!16984)

(declare-datatypes ((List!23554 0))(
  ( (Nil!23551) (Cons!23550 (h!24759 tuple2!16984) (t!33182 List!23554)) )
))
(declare-datatypes ((ListLongMap!14953 0))(
  ( (ListLongMap!14954 (toList!7492 List!23554)) )
))
(declare-fun lt!482678 () ListLongMap!14953)

(declare-fun lt!482693 () ListLongMap!14953)

(declare-fun -!771 (ListLongMap!14953 (_ BitVec 64)) ListLongMap!14953)

(declare-fun +!3300 (ListLongMap!14953 tuple2!16984) ListLongMap!14953)

(assert (=> b!1086325 (= (-!771 lt!482678 k0!904) (+!3300 lt!482693 lt!482692))))

(declare-fun minValue!831 () V!40569)

(declare-fun lt!482677 () ListLongMap!14953)

(declare-datatypes ((Unit!35577 0))(
  ( (Unit!35578) )
))
(declare-fun lt!482688 () Unit!35577)

(declare-fun addRemoveCommutativeForDiffKeys!29 (ListLongMap!14953 (_ BitVec 64) V!40569 (_ BitVec 64)) Unit!35577)

(assert (=> b!1086325 (= lt!482688 (addRemoveCommutativeForDiffKeys!29 lt!482677 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1086326 () Bool)

(declare-fun e!620548 () Bool)

(assert (=> b!1086326 (= e!620542 (not e!620548))))

(declare-fun res!724409 () Bool)

(assert (=> b!1086326 (=> res!724409 e!620548)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086326 (= res!724409 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!482689 () ListLongMap!14953)

(declare-fun zeroValue!831 () V!40569)

(declare-fun getCurrentListMap!4176 (array!70018 array!70016 (_ BitVec 32) (_ BitVec 32) V!40569 V!40569 (_ BitVec 32) Int) ListLongMap!14953)

(assert (=> b!1086326 (= lt!482689 (getCurrentListMap!4176 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482685 () array!70016)

(declare-fun lt!482681 () ListLongMap!14953)

(assert (=> b!1086326 (= lt!482681 (getCurrentListMap!4176 lt!482687 lt!482685 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!482683 () ListLongMap!14953)

(declare-fun lt!482691 () ListLongMap!14953)

(assert (=> b!1086326 (and (= lt!482683 lt!482691) (= lt!482691 lt!482683))))

(declare-fun lt!482679 () ListLongMap!14953)

(assert (=> b!1086326 (= lt!482691 (-!771 lt!482679 k0!904))))

(declare-fun lt!482690 () Unit!35577)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!60 (array!70018 array!70016 (_ BitVec 32) (_ BitVec 32) V!40569 V!40569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35577)

(assert (=> b!1086326 (= lt!482690 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!60 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4046 (array!70018 array!70016 (_ BitVec 32) (_ BitVec 32) V!40569 V!40569 (_ BitVec 32) Int) ListLongMap!14953)

(assert (=> b!1086326 (= lt!482683 (getCurrentListMapNoExtraKeys!4046 lt!482687 lt!482685 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2117 (Int (_ BitVec 64)) V!40569)

(assert (=> b!1086326 (= lt!482685 (array!70017 (store (arr!33682 _values!874) i!650 (ValueCellFull!12581 (dynLambda!2117 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34220 _values!874)))))

(assert (=> b!1086326 (= lt!482679 (getCurrentListMapNoExtraKeys!4046 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086326 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!482682 () Unit!35577)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70018 (_ BitVec 64) (_ BitVec 32)) Unit!35577)

(assert (=> b!1086326 (= lt!482682 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086327 () Bool)

(declare-fun res!724401 () Bool)

(assert (=> b!1086327 (=> (not res!724401) (not e!620544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086327 (= res!724401 (validKeyInArray!0 k0!904))))

(declare-fun b!1086328 () Bool)

(assert (=> b!1086328 (= e!620548 e!620549)))

(declare-fun res!724410 () Bool)

(assert (=> b!1086328 (=> res!724410 e!620549)))

(assert (=> b!1086328 (= res!724410 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!482686 () ListLongMap!14953)

(assert (=> b!1086328 (= lt!482693 lt!482686)))

(assert (=> b!1086328 (= lt!482693 (-!771 lt!482677 k0!904))))

(declare-fun lt!482684 () Unit!35577)

(assert (=> b!1086328 (= lt!482684 (addRemoveCommutativeForDiffKeys!29 lt!482679 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1086328 (= lt!482681 (+!3300 lt!482686 lt!482692))))

(declare-fun lt!482680 () tuple2!16984)

(assert (=> b!1086328 (= lt!482686 (+!3300 lt!482691 lt!482680))))

(assert (=> b!1086328 (= lt!482689 lt!482678)))

(assert (=> b!1086328 (= lt!482678 (+!3300 lt!482677 lt!482692))))

(assert (=> b!1086328 (= lt!482677 (+!3300 lt!482679 lt!482680))))

(assert (=> b!1086328 (= lt!482681 (+!3300 (+!3300 lt!482683 lt!482680) lt!482692))))

(assert (=> b!1086328 (= lt!482692 (tuple2!16985 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086328 (= lt!482680 (tuple2!16985 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086329 () Bool)

(declare-fun res!724402 () Bool)

(assert (=> b!1086329 (=> (not res!724402) (not e!620544))))

(assert (=> b!1086329 (= res!724402 (and (= (size!34220 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34221 _keys!1070) (size!34220 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!95920 res!724400) b!1086329))

(assert (= (and b!1086329 res!724402) b!1086318))

(assert (= (and b!1086318 res!724404) b!1086317))

(assert (= (and b!1086317 res!724406) b!1086316))

(assert (= (and b!1086316 res!724408) b!1086327))

(assert (= (and b!1086327 res!724401) b!1086323))

(assert (= (and b!1086323 res!724403) b!1086320))

(assert (= (and b!1086320 res!724405) b!1086324))

(assert (= (and b!1086324 res!724407) b!1086326))

(assert (= (and b!1086326 (not res!724409)) b!1086328))

(assert (= (and b!1086328 (not res!724410)) b!1086325))

(assert (= (and b!1086322 condMapEmpty!41626) mapIsEmpty!41626))

(assert (= (and b!1086322 (not condMapEmpty!41626)) mapNonEmpty!41626))

(get-info :version)

(assert (= (and mapNonEmpty!41626 ((_ is ValueCellFull!12581) mapValue!41626)) b!1086321))

(assert (= (and b!1086322 ((_ is ValueCellFull!12581) mapDefault!41626)) b!1086319))

(assert (= start!95920 b!1086322))

(declare-fun b_lambda!17227 () Bool)

(assert (=> (not b_lambda!17227) (not b!1086326)))

(declare-fun t!33180 () Bool)

(declare-fun tb!7449 () Bool)

(assert (=> (and start!95920 (= defaultEntry!882 defaultEntry!882) t!33180) tb!7449))

(declare-fun result!15425 () Bool)

(assert (=> tb!7449 (= result!15425 tp_is_empty!26581)))

(assert (=> b!1086326 t!33180))

(declare-fun b_and!35809 () Bool)

(assert (= b_and!35807 (and (=> t!33180 result!15425) b_and!35809)))

(declare-fun m!1004357 () Bool)

(assert (=> b!1086325 m!1004357))

(declare-fun m!1004359 () Bool)

(assert (=> b!1086325 m!1004359))

(declare-fun m!1004361 () Bool)

(assert (=> b!1086325 m!1004361))

(declare-fun m!1004363 () Bool)

(assert (=> b!1086328 m!1004363))

(declare-fun m!1004365 () Bool)

(assert (=> b!1086328 m!1004365))

(declare-fun m!1004367 () Bool)

(assert (=> b!1086328 m!1004367))

(declare-fun m!1004369 () Bool)

(assert (=> b!1086328 m!1004369))

(declare-fun m!1004371 () Bool)

(assert (=> b!1086328 m!1004371))

(declare-fun m!1004373 () Bool)

(assert (=> b!1086328 m!1004373))

(declare-fun m!1004375 () Bool)

(assert (=> b!1086328 m!1004375))

(assert (=> b!1086328 m!1004363))

(declare-fun m!1004377 () Bool)

(assert (=> b!1086328 m!1004377))

(declare-fun m!1004379 () Bool)

(assert (=> b!1086318 m!1004379))

(declare-fun m!1004381 () Bool)

(assert (=> b!1086326 m!1004381))

(declare-fun m!1004383 () Bool)

(assert (=> b!1086326 m!1004383))

(declare-fun m!1004385 () Bool)

(assert (=> b!1086326 m!1004385))

(declare-fun m!1004387 () Bool)

(assert (=> b!1086326 m!1004387))

(declare-fun m!1004389 () Bool)

(assert (=> b!1086326 m!1004389))

(declare-fun m!1004391 () Bool)

(assert (=> b!1086326 m!1004391))

(declare-fun m!1004393 () Bool)

(assert (=> b!1086326 m!1004393))

(declare-fun m!1004395 () Bool)

(assert (=> b!1086326 m!1004395))

(declare-fun m!1004397 () Bool)

(assert (=> b!1086326 m!1004397))

(declare-fun m!1004399 () Bool)

(assert (=> b!1086326 m!1004399))

(declare-fun m!1004401 () Bool)

(assert (=> b!1086327 m!1004401))

(declare-fun m!1004403 () Bool)

(assert (=> b!1086323 m!1004403))

(declare-fun m!1004405 () Bool)

(assert (=> b!1086324 m!1004405))

(declare-fun m!1004407 () Bool)

(assert (=> start!95920 m!1004407))

(declare-fun m!1004409 () Bool)

(assert (=> start!95920 m!1004409))

(declare-fun m!1004411 () Bool)

(assert (=> start!95920 m!1004411))

(declare-fun m!1004413 () Bool)

(assert (=> b!1086320 m!1004413))

(declare-fun m!1004415 () Bool)

(assert (=> b!1086320 m!1004415))

(declare-fun m!1004417 () Bool)

(assert (=> mapNonEmpty!41626 m!1004417))

(declare-fun m!1004419 () Bool)

(assert (=> b!1086317 m!1004419))

(check-sat (not b!1086328) (not start!95920) tp_is_empty!26581 (not mapNonEmpty!41626) (not b!1086325) (not b!1086317) (not b!1086324) (not b_lambda!17227) (not b!1086326) b_and!35809 (not b!1086320) (not b!1086327) (not b!1086318) (not b_next!22579))
(check-sat b_and!35809 (not b_next!22579))
