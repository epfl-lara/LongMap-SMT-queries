; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96102 () Bool)

(assert start!96102)

(declare-fun b_free!22755 () Bool)

(declare-fun b_next!22755 () Bool)

(assert (=> start!96102 (= b_free!22755 (not b_next!22755))))

(declare-fun tp!80114 () Bool)

(declare-fun b_and!36185 () Bool)

(assert (=> start!96102 (= tp!80114 b_and!36185)))

(declare-fun b!1090359 () Bool)

(declare-fun e!622751 () Bool)

(declare-fun e!622747 () Bool)

(assert (=> b!1090359 (= e!622751 e!622747)))

(declare-fun res!727392 () Bool)

(assert (=> b!1090359 (=> (not res!727392) (not e!622747))))

(declare-datatypes ((array!70437 0))(
  ( (array!70438 (arr!33892 (Array (_ BitVec 32) (_ BitVec 64))) (size!34428 (_ BitVec 32))) )
))
(declare-fun lt!486473 () array!70437)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70437 (_ BitVec 32)) Bool)

(assert (=> b!1090359 (= res!727392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486473 mask!1414))))

(declare-fun _keys!1070 () array!70437)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090359 (= lt!486473 (array!70438 (store (arr!33892 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34428 _keys!1070)))))

(declare-fun b!1090360 () Bool)

(declare-fun res!727391 () Bool)

(assert (=> b!1090360 (=> (not res!727391) (not e!622747))))

(declare-datatypes ((List!23665 0))(
  ( (Nil!23662) (Cons!23661 (h!24870 (_ BitVec 64)) (t!33478 List!23665)) )
))
(declare-fun arrayNoDuplicates!0 (array!70437 (_ BitVec 32) List!23665) Bool)

(assert (=> b!1090360 (= res!727391 (arrayNoDuplicates!0 lt!486473 #b00000000000000000000000000000000 Nil!23662))))

(declare-fun b!1090361 () Bool)

(declare-fun e!622750 () Bool)

(assert (=> b!1090361 (= e!622747 (not e!622750))))

(declare-fun res!727395 () Bool)

(assert (=> b!1090361 (=> res!727395 e!622750)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090361 (= res!727395 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40803 0))(
  ( (V!40804 (val!13435 Int)) )
))
(declare-datatypes ((tuple2!17076 0))(
  ( (tuple2!17077 (_1!8549 (_ BitVec 64)) (_2!8549 V!40803)) )
))
(declare-datatypes ((List!23666 0))(
  ( (Nil!23663) (Cons!23662 (h!24871 tuple2!17076) (t!33479 List!23666)) )
))
(declare-datatypes ((ListLongMap!15045 0))(
  ( (ListLongMap!15046 (toList!7538 List!23666)) )
))
(declare-fun lt!486466 () ListLongMap!15045)

(declare-fun minValue!831 () V!40803)

(declare-fun zeroValue!831 () V!40803)

(declare-datatypes ((ValueCell!12669 0))(
  ( (ValueCellFull!12669 (v!16056 V!40803)) (EmptyCell!12669) )
))
(declare-datatypes ((array!70439 0))(
  ( (array!70440 (arr!33893 (Array (_ BitVec 32) ValueCell!12669)) (size!34429 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70439)

(declare-fun getCurrentListMap!4306 (array!70437 array!70439 (_ BitVec 32) (_ BitVec 32) V!40803 V!40803 (_ BitVec 32) Int) ListLongMap!15045)

(assert (=> b!1090361 (= lt!486466 (getCurrentListMap!4306 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486472 () ListLongMap!15045)

(declare-fun lt!486468 () array!70439)

(assert (=> b!1090361 (= lt!486472 (getCurrentListMap!4306 lt!486473 lt!486468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486470 () ListLongMap!15045)

(declare-fun lt!486471 () ListLongMap!15045)

(assert (=> b!1090361 (and (= lt!486470 lt!486471) (= lt!486471 lt!486470))))

(declare-fun lt!486467 () ListLongMap!15045)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!863 (ListLongMap!15045 (_ BitVec 64)) ListLongMap!15045)

(assert (=> b!1090361 (= lt!486471 (-!863 lt!486467 k0!904))))

(declare-datatypes ((Unit!35892 0))(
  ( (Unit!35893) )
))
(declare-fun lt!486464 () Unit!35892)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!125 (array!70437 array!70439 (_ BitVec 32) (_ BitVec 32) V!40803 V!40803 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35892)

(assert (=> b!1090361 (= lt!486464 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!125 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4066 (array!70437 array!70439 (_ BitVec 32) (_ BitVec 32) V!40803 V!40803 (_ BitVec 32) Int) ListLongMap!15045)

(assert (=> b!1090361 (= lt!486470 (getCurrentListMapNoExtraKeys!4066 lt!486473 lt!486468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2203 (Int (_ BitVec 64)) V!40803)

(assert (=> b!1090361 (= lt!486468 (array!70440 (store (arr!33893 _values!874) i!650 (ValueCellFull!12669 (dynLambda!2203 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34429 _values!874)))))

(assert (=> b!1090361 (= lt!486467 (getCurrentListMapNoExtraKeys!4066 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090361 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486469 () Unit!35892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70437 (_ BitVec 64) (_ BitVec 32)) Unit!35892)

(assert (=> b!1090361 (= lt!486469 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090362 () Bool)

(declare-fun res!727397 () Bool)

(assert (=> b!1090362 (=> (not res!727397) (not e!622751))))

(assert (=> b!1090362 (= res!727397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090363 () Bool)

(declare-fun res!727398 () Bool)

(assert (=> b!1090363 (=> (not res!727398) (not e!622751))))

(assert (=> b!1090363 (= res!727398 (= (select (arr!33892 _keys!1070) i!650) k0!904))))

(declare-fun b!1090364 () Bool)

(declare-fun res!727400 () Bool)

(assert (=> b!1090364 (=> (not res!727400) (not e!622751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090364 (= res!727400 (validKeyInArray!0 k0!904))))

(declare-fun b!1090365 () Bool)

(declare-fun e!622754 () Bool)

(declare-fun tp_is_empty!26757 () Bool)

(assert (=> b!1090365 (= e!622754 tp_is_empty!26757)))

(declare-fun b!1090366 () Bool)

(declare-fun res!727396 () Bool)

(assert (=> b!1090366 (=> (not res!727396) (not e!622751))))

(assert (=> b!1090366 (= res!727396 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23662))))

(declare-fun b!1090367 () Bool)

(declare-fun e!622752 () Bool)

(assert (=> b!1090367 (= e!622750 e!622752)))

(declare-fun res!727399 () Bool)

(assert (=> b!1090367 (=> res!727399 e!622752)))

(assert (=> b!1090367 (= res!727399 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!486463 () ListLongMap!15045)

(assert (=> b!1090367 (= lt!486466 lt!486463)))

(declare-fun lt!486475 () tuple2!17076)

(declare-fun +!3327 (ListLongMap!15045 tuple2!17076) ListLongMap!15045)

(assert (=> b!1090367 (= lt!486463 (+!3327 lt!486467 lt!486475))))

(declare-fun lt!486465 () ListLongMap!15045)

(assert (=> b!1090367 (= lt!486472 lt!486465)))

(assert (=> b!1090367 (= lt!486465 (+!3327 lt!486471 lt!486475))))

(assert (=> b!1090367 (= lt!486472 (+!3327 lt!486470 lt!486475))))

(assert (=> b!1090367 (= lt!486475 (tuple2!17077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090368 () Bool)

(assert (=> b!1090368 (= e!622752 true)))

(assert (=> b!1090368 (= (-!863 lt!486463 k0!904) lt!486465)))

(declare-fun lt!486474 () Unit!35892)

(declare-fun addRemoveCommutativeForDiffKeys!87 (ListLongMap!15045 (_ BitVec 64) V!40803 (_ BitVec 64)) Unit!35892)

(assert (=> b!1090368 (= lt!486474 (addRemoveCommutativeForDiffKeys!87 lt!486467 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1090369 () Bool)

(declare-fun e!622753 () Bool)

(assert (=> b!1090369 (= e!622753 tp_is_empty!26757)))

(declare-fun mapNonEmpty!41890 () Bool)

(declare-fun mapRes!41890 () Bool)

(declare-fun tp!80113 () Bool)

(assert (=> mapNonEmpty!41890 (= mapRes!41890 (and tp!80113 e!622753))))

(declare-fun mapValue!41890 () ValueCell!12669)

(declare-fun mapRest!41890 () (Array (_ BitVec 32) ValueCell!12669))

(declare-fun mapKey!41890 () (_ BitVec 32))

(assert (=> mapNonEmpty!41890 (= (arr!33893 _values!874) (store mapRest!41890 mapKey!41890 mapValue!41890))))

(declare-fun mapIsEmpty!41890 () Bool)

(assert (=> mapIsEmpty!41890 mapRes!41890))

(declare-fun b!1090370 () Bool)

(declare-fun e!622748 () Bool)

(assert (=> b!1090370 (= e!622748 (and e!622754 mapRes!41890))))

(declare-fun condMapEmpty!41890 () Bool)

(declare-fun mapDefault!41890 () ValueCell!12669)

(assert (=> b!1090370 (= condMapEmpty!41890 (= (arr!33893 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12669)) mapDefault!41890)))))

(declare-fun b!1090371 () Bool)

(declare-fun res!727401 () Bool)

(assert (=> b!1090371 (=> (not res!727401) (not e!622751))))

(assert (=> b!1090371 (= res!727401 (and (= (size!34429 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34428 _keys!1070) (size!34429 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090372 () Bool)

(declare-fun res!727393 () Bool)

(assert (=> b!1090372 (=> (not res!727393) (not e!622751))))

(assert (=> b!1090372 (= res!727393 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34428 _keys!1070))))))

(declare-fun res!727394 () Bool)

(assert (=> start!96102 (=> (not res!727394) (not e!622751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96102 (= res!727394 (validMask!0 mask!1414))))

(assert (=> start!96102 e!622751))

(assert (=> start!96102 tp!80114))

(assert (=> start!96102 true))

(assert (=> start!96102 tp_is_empty!26757))

(declare-fun array_inv!26138 (array!70437) Bool)

(assert (=> start!96102 (array_inv!26138 _keys!1070)))

(declare-fun array_inv!26139 (array!70439) Bool)

(assert (=> start!96102 (and (array_inv!26139 _values!874) e!622748)))

(assert (= (and start!96102 res!727394) b!1090371))

(assert (= (and b!1090371 res!727401) b!1090362))

(assert (= (and b!1090362 res!727397) b!1090366))

(assert (= (and b!1090366 res!727396) b!1090372))

(assert (= (and b!1090372 res!727393) b!1090364))

(assert (= (and b!1090364 res!727400) b!1090363))

(assert (= (and b!1090363 res!727398) b!1090359))

(assert (= (and b!1090359 res!727392) b!1090360))

(assert (= (and b!1090360 res!727391) b!1090361))

(assert (= (and b!1090361 (not res!727395)) b!1090367))

(assert (= (and b!1090367 (not res!727399)) b!1090368))

(assert (= (and b!1090370 condMapEmpty!41890) mapIsEmpty!41890))

(assert (= (and b!1090370 (not condMapEmpty!41890)) mapNonEmpty!41890))

(get-info :version)

(assert (= (and mapNonEmpty!41890 ((_ is ValueCellFull!12669) mapValue!41890)) b!1090369))

(assert (= (and b!1090370 ((_ is ValueCellFull!12669) mapDefault!41890)) b!1090365))

(assert (= start!96102 b!1090370))

(declare-fun b_lambda!17425 () Bool)

(assert (=> (not b_lambda!17425) (not b!1090361)))

(declare-fun t!33477 () Bool)

(declare-fun tb!7633 () Bool)

(assert (=> (and start!96102 (= defaultEntry!882 defaultEntry!882) t!33477) tb!7633))

(declare-fun result!15785 () Bool)

(assert (=> tb!7633 (= result!15785 tp_is_empty!26757)))

(assert (=> b!1090361 t!33477))

(declare-fun b_and!36187 () Bool)

(assert (= b_and!36185 (and (=> t!33477 result!15785) b_and!36187)))

(declare-fun m!1009751 () Bool)

(assert (=> b!1090361 m!1009751))

(declare-fun m!1009753 () Bool)

(assert (=> b!1090361 m!1009753))

(declare-fun m!1009755 () Bool)

(assert (=> b!1090361 m!1009755))

(declare-fun m!1009757 () Bool)

(assert (=> b!1090361 m!1009757))

(declare-fun m!1009759 () Bool)

(assert (=> b!1090361 m!1009759))

(declare-fun m!1009761 () Bool)

(assert (=> b!1090361 m!1009761))

(declare-fun m!1009763 () Bool)

(assert (=> b!1090361 m!1009763))

(declare-fun m!1009765 () Bool)

(assert (=> b!1090361 m!1009765))

(declare-fun m!1009767 () Bool)

(assert (=> b!1090361 m!1009767))

(declare-fun m!1009769 () Bool)

(assert (=> b!1090361 m!1009769))

(declare-fun m!1009771 () Bool)

(assert (=> b!1090363 m!1009771))

(declare-fun m!1009773 () Bool)

(assert (=> b!1090362 m!1009773))

(declare-fun m!1009775 () Bool)

(assert (=> b!1090360 m!1009775))

(declare-fun m!1009777 () Bool)

(assert (=> b!1090366 m!1009777))

(declare-fun m!1009779 () Bool)

(assert (=> b!1090367 m!1009779))

(declare-fun m!1009781 () Bool)

(assert (=> b!1090367 m!1009781))

(declare-fun m!1009783 () Bool)

(assert (=> b!1090367 m!1009783))

(declare-fun m!1009785 () Bool)

(assert (=> b!1090364 m!1009785))

(declare-fun m!1009787 () Bool)

(assert (=> mapNonEmpty!41890 m!1009787))

(declare-fun m!1009789 () Bool)

(assert (=> b!1090359 m!1009789))

(declare-fun m!1009791 () Bool)

(assert (=> b!1090359 m!1009791))

(declare-fun m!1009793 () Bool)

(assert (=> start!96102 m!1009793))

(declare-fun m!1009795 () Bool)

(assert (=> start!96102 m!1009795))

(declare-fun m!1009797 () Bool)

(assert (=> start!96102 m!1009797))

(declare-fun m!1009799 () Bool)

(assert (=> b!1090368 m!1009799))

(declare-fun m!1009801 () Bool)

(assert (=> b!1090368 m!1009801))

(check-sat (not b!1090360) (not b!1090366) (not b_next!22755) tp_is_empty!26757 (not b!1090359) (not start!96102) (not b!1090362) (not b!1090361) (not b!1090368) (not b!1090364) b_and!36187 (not mapNonEmpty!41890) (not b!1090367) (not b_lambda!17425))
(check-sat b_and!36187 (not b_next!22755))
