; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96000 () Bool)

(assert start!96000)

(declare-fun b_free!22417 () Bool)

(declare-fun b_next!22417 () Bool)

(assert (=> start!96000 (= b_free!22417 (not b_next!22417))))

(declare-fun tp!79100 () Bool)

(declare-fun b_and!35519 () Bool)

(assert (=> start!96000 (= tp!79100 b_and!35519)))

(declare-fun b!1084462 () Bool)

(declare-fun res!722556 () Bool)

(declare-fun e!619785 () Bool)

(assert (=> b!1084462 (=> (not res!722556) (not e!619785))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084462 (= res!722556 (validKeyInArray!0 k0!904))))

(declare-fun b!1084464 () Bool)

(declare-fun res!722550 () Bool)

(assert (=> b!1084464 (=> (not res!722550) (not e!619785))))

(declare-datatypes ((array!69819 0))(
  ( (array!69820 (arr!33577 (Array (_ BitVec 32) (_ BitVec 64))) (size!34114 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69819)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084464 (= res!722550 (= (select (arr!33577 _keys!1070) i!650) k0!904))))

(declare-fun b!1084465 () Bool)

(declare-fun res!722554 () Bool)

(assert (=> b!1084465 (=> (not res!722554) (not e!619785))))

(declare-datatypes ((List!23408 0))(
  ( (Nil!23405) (Cons!23404 (h!24622 (_ BitVec 64)) (t!32875 List!23408)) )
))
(declare-fun arrayNoDuplicates!0 (array!69819 (_ BitVec 32) List!23408) Bool)

(assert (=> b!1084465 (= res!722554 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23405))))

(declare-fun b!1084466 () Bool)

(declare-fun res!722552 () Bool)

(assert (=> b!1084466 (=> (not res!722552) (not e!619785))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69819 (_ BitVec 32)) Bool)

(assert (=> b!1084466 (= res!722552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!41383 () Bool)

(declare-fun mapRes!41383 () Bool)

(declare-fun tp!79099 () Bool)

(declare-fun e!619786 () Bool)

(assert (=> mapNonEmpty!41383 (= mapRes!41383 (and tp!79099 e!619786))))

(declare-datatypes ((V!40353 0))(
  ( (V!40354 (val!13266 Int)) )
))
(declare-datatypes ((ValueCell!12500 0))(
  ( (ValueCellFull!12500 (v!15883 V!40353)) (EmptyCell!12500) )
))
(declare-datatypes ((array!69821 0))(
  ( (array!69822 (arr!33578 (Array (_ BitVec 32) ValueCell!12500)) (size!34115 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69821)

(declare-fun mapValue!41383 () ValueCell!12500)

(declare-fun mapKey!41383 () (_ BitVec 32))

(declare-fun mapRest!41383 () (Array (_ BitVec 32) ValueCell!12500))

(assert (=> mapNonEmpty!41383 (= (arr!33578 _values!874) (store mapRest!41383 mapKey!41383 mapValue!41383))))

(declare-fun b!1084467 () Bool)

(declare-fun res!722555 () Bool)

(declare-fun e!619789 () Bool)

(assert (=> b!1084467 (=> (not res!722555) (not e!619789))))

(declare-fun lt!480446 () array!69819)

(assert (=> b!1084467 (= res!722555 (arrayNoDuplicates!0 lt!480446 #b00000000000000000000000000000000 Nil!23405))))

(declare-fun mapIsEmpty!41383 () Bool)

(assert (=> mapIsEmpty!41383 mapRes!41383))

(declare-fun b!1084463 () Bool)

(assert (=> b!1084463 (= e!619789 (not true))))

(declare-datatypes ((tuple2!16814 0))(
  ( (tuple2!16815 (_1!8418 (_ BitVec 64)) (_2!8418 V!40353)) )
))
(declare-datatypes ((List!23409 0))(
  ( (Nil!23406) (Cons!23405 (h!24623 tuple2!16814) (t!32876 List!23409)) )
))
(declare-datatypes ((ListLongMap!14791 0))(
  ( (ListLongMap!14792 (toList!7411 List!23409)) )
))
(declare-fun lt!480447 () ListLongMap!14791)

(declare-fun lt!480445 () ListLongMap!14791)

(assert (=> b!1084463 (and (= lt!480447 lt!480445) (= lt!480445 lt!480447))))

(declare-fun lt!480448 () ListLongMap!14791)

(declare-fun -!723 (ListLongMap!14791 (_ BitVec 64)) ListLongMap!14791)

(assert (=> b!1084463 (= lt!480445 (-!723 lt!480448 k0!904))))

(declare-fun minValue!831 () V!40353)

(declare-datatypes ((Unit!35613 0))(
  ( (Unit!35614) )
))
(declare-fun lt!480449 () Unit!35613)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40353)

(declare-fun defaultEntry!882 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!12 (array!69819 array!69821 (_ BitVec 32) (_ BitVec 32) V!40353 V!40353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35613)

(assert (=> b!1084463 (= lt!480449 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!12 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3988 (array!69819 array!69821 (_ BitVec 32) (_ BitVec 32) V!40353 V!40353 (_ BitVec 32) Int) ListLongMap!14791)

(declare-fun dynLambda!2109 (Int (_ BitVec 64)) V!40353)

(assert (=> b!1084463 (= lt!480447 (getCurrentListMapNoExtraKeys!3988 lt!480446 (array!69822 (store (arr!33578 _values!874) i!650 (ValueCellFull!12500 (dynLambda!2109 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34115 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1084463 (= lt!480448 (getCurrentListMapNoExtraKeys!3988 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084463 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480450 () Unit!35613)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69819 (_ BitVec 64) (_ BitVec 32)) Unit!35613)

(assert (=> b!1084463 (= lt!480450 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!722551 () Bool)

(assert (=> start!96000 (=> (not res!722551) (not e!619785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96000 (= res!722551 (validMask!0 mask!1414))))

(assert (=> start!96000 e!619785))

(assert (=> start!96000 tp!79100))

(assert (=> start!96000 true))

(declare-fun tp_is_empty!26419 () Bool)

(assert (=> start!96000 tp_is_empty!26419))

(declare-fun array_inv!25964 (array!69819) Bool)

(assert (=> start!96000 (array_inv!25964 _keys!1070)))

(declare-fun e!619790 () Bool)

(declare-fun array_inv!25965 (array!69821) Bool)

(assert (=> start!96000 (and (array_inv!25965 _values!874) e!619790)))

(declare-fun b!1084468 () Bool)

(declare-fun res!722549 () Bool)

(assert (=> b!1084468 (=> (not res!722549) (not e!619785))))

(assert (=> b!1084468 (= res!722549 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34114 _keys!1070))))))

(declare-fun b!1084469 () Bool)

(declare-fun e!619788 () Bool)

(assert (=> b!1084469 (= e!619790 (and e!619788 mapRes!41383))))

(declare-fun condMapEmpty!41383 () Bool)

(declare-fun mapDefault!41383 () ValueCell!12500)

(assert (=> b!1084469 (= condMapEmpty!41383 (= (arr!33578 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12500)) mapDefault!41383)))))

(declare-fun b!1084470 () Bool)

(assert (=> b!1084470 (= e!619786 tp_is_empty!26419)))

(declare-fun b!1084471 () Bool)

(assert (=> b!1084471 (= e!619785 e!619789)))

(declare-fun res!722553 () Bool)

(assert (=> b!1084471 (=> (not res!722553) (not e!619789))))

(assert (=> b!1084471 (= res!722553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480446 mask!1414))))

(assert (=> b!1084471 (= lt!480446 (array!69820 (store (arr!33577 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34114 _keys!1070)))))

(declare-fun b!1084472 () Bool)

(declare-fun res!722548 () Bool)

(assert (=> b!1084472 (=> (not res!722548) (not e!619785))))

(assert (=> b!1084472 (= res!722548 (and (= (size!34115 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34114 _keys!1070) (size!34115 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084473 () Bool)

(assert (=> b!1084473 (= e!619788 tp_is_empty!26419)))

(assert (= (and start!96000 res!722551) b!1084472))

(assert (= (and b!1084472 res!722548) b!1084466))

(assert (= (and b!1084466 res!722552) b!1084465))

(assert (= (and b!1084465 res!722554) b!1084468))

(assert (= (and b!1084468 res!722549) b!1084462))

(assert (= (and b!1084462 res!722556) b!1084464))

(assert (= (and b!1084464 res!722550) b!1084471))

(assert (= (and b!1084471 res!722553) b!1084467))

(assert (= (and b!1084467 res!722555) b!1084463))

(assert (= (and b!1084469 condMapEmpty!41383) mapIsEmpty!41383))

(assert (= (and b!1084469 (not condMapEmpty!41383)) mapNonEmpty!41383))

(get-info :version)

(assert (= (and mapNonEmpty!41383 ((_ is ValueCellFull!12500) mapValue!41383)) b!1084470))

(assert (= (and b!1084469 ((_ is ValueCellFull!12500) mapDefault!41383)) b!1084473))

(assert (= start!96000 b!1084469))

(declare-fun b_lambda!17097 () Bool)

(assert (=> (not b_lambda!17097) (not b!1084463)))

(declare-fun t!32874 () Bool)

(declare-fun tb!7287 () Bool)

(assert (=> (and start!96000 (= defaultEntry!882 defaultEntry!882) t!32874) tb!7287))

(declare-fun result!15101 () Bool)

(assert (=> tb!7287 (= result!15101 tp_is_empty!26419)))

(assert (=> b!1084463 t!32874))

(declare-fun b_and!35521 () Bool)

(assert (= b_and!35519 (and (=> t!32874 result!15101) b_and!35521)))

(declare-fun m!1002479 () Bool)

(assert (=> start!96000 m!1002479))

(declare-fun m!1002481 () Bool)

(assert (=> start!96000 m!1002481))

(declare-fun m!1002483 () Bool)

(assert (=> start!96000 m!1002483))

(declare-fun m!1002485 () Bool)

(assert (=> b!1084464 m!1002485))

(declare-fun m!1002487 () Bool)

(assert (=> mapNonEmpty!41383 m!1002487))

(declare-fun m!1002489 () Bool)

(assert (=> b!1084463 m!1002489))

(declare-fun m!1002491 () Bool)

(assert (=> b!1084463 m!1002491))

(declare-fun m!1002493 () Bool)

(assert (=> b!1084463 m!1002493))

(declare-fun m!1002495 () Bool)

(assert (=> b!1084463 m!1002495))

(declare-fun m!1002497 () Bool)

(assert (=> b!1084463 m!1002497))

(declare-fun m!1002499 () Bool)

(assert (=> b!1084463 m!1002499))

(declare-fun m!1002501 () Bool)

(assert (=> b!1084463 m!1002501))

(declare-fun m!1002503 () Bool)

(assert (=> b!1084463 m!1002503))

(declare-fun m!1002505 () Bool)

(assert (=> b!1084466 m!1002505))

(declare-fun m!1002507 () Bool)

(assert (=> b!1084465 m!1002507))

(declare-fun m!1002509 () Bool)

(assert (=> b!1084471 m!1002509))

(declare-fun m!1002511 () Bool)

(assert (=> b!1084471 m!1002511))

(declare-fun m!1002513 () Bool)

(assert (=> b!1084467 m!1002513))

(declare-fun m!1002515 () Bool)

(assert (=> b!1084462 m!1002515))

(check-sat (not b_lambda!17097) (not b!1084471) (not b_next!22417) (not b!1084467) (not b!1084466) (not b!1084462) tp_is_empty!26419 (not b!1084463) b_and!35521 (not mapNonEmpty!41383) (not b!1084465) (not start!96000))
(check-sat b_and!35521 (not b_next!22417))
