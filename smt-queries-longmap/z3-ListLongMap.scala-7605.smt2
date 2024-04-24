; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96186 () Bool)

(assert start!96186)

(declare-fun b_free!22603 () Bool)

(declare-fun b_next!22603 () Bool)

(assert (=> start!96186 (= b_free!22603 (not b_next!22603))))

(declare-fun tp!79657 () Bool)

(declare-fun b_and!35891 () Bool)

(assert (=> start!96186 (= tp!79657 b_and!35891)))

(declare-fun b!1088324 () Bool)

(declare-fun res!725389 () Bool)

(declare-fun e!621784 () Bool)

(assert (=> b!1088324 (=> (not res!725389) (not e!621784))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088324 (= res!725389 (validKeyInArray!0 k0!904))))

(declare-fun b!1088325 () Bool)

(declare-fun e!621782 () Bool)

(assert (=> b!1088325 (= e!621784 e!621782)))

(declare-fun res!725396 () Bool)

(assert (=> b!1088325 (=> (not res!725396) (not e!621782))))

(declare-datatypes ((array!70175 0))(
  ( (array!70176 (arr!33755 (Array (_ BitVec 32) (_ BitVec 64))) (size!34292 (_ BitVec 32))) )
))
(declare-fun lt!484015 () array!70175)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70175 (_ BitVec 32)) Bool)

(assert (=> b!1088325 (= res!725396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484015 mask!1414))))

(declare-fun _keys!1070 () array!70175)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088325 (= lt!484015 (array!70176 (store (arr!33755 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34292 _keys!1070)))))

(declare-fun b!1088326 () Bool)

(declare-fun e!621780 () Bool)

(declare-fun tp_is_empty!26605 () Bool)

(assert (=> b!1088326 (= e!621780 tp_is_empty!26605)))

(declare-fun b!1088327 () Bool)

(declare-fun res!725393 () Bool)

(assert (=> b!1088327 (=> (not res!725393) (not e!621784))))

(declare-datatypes ((List!23553 0))(
  ( (Nil!23550) (Cons!23549 (h!24767 (_ BitVec 64)) (t!33206 List!23553)) )
))
(declare-fun arrayNoDuplicates!0 (array!70175 (_ BitVec 32) List!23553) Bool)

(assert (=> b!1088327 (= res!725393 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23550))))

(declare-fun b!1088328 () Bool)

(declare-fun e!621779 () Bool)

(assert (=> b!1088328 (= e!621782 (not e!621779))))

(declare-fun res!725391 () Bool)

(assert (=> b!1088328 (=> res!725391 e!621779)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088328 (= res!725391 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40601 0))(
  ( (V!40602 (val!13359 Int)) )
))
(declare-datatypes ((tuple2!16958 0))(
  ( (tuple2!16959 (_1!8490 (_ BitVec 64)) (_2!8490 V!40601)) )
))
(declare-datatypes ((List!23554 0))(
  ( (Nil!23551) (Cons!23550 (h!24768 tuple2!16958) (t!33207 List!23554)) )
))
(declare-datatypes ((ListLongMap!14935 0))(
  ( (ListLongMap!14936 (toList!7483 List!23554)) )
))
(declare-fun lt!484017 () ListLongMap!14935)

(declare-fun minValue!831 () V!40601)

(declare-fun zeroValue!831 () V!40601)

(declare-datatypes ((ValueCell!12593 0))(
  ( (ValueCellFull!12593 (v!15976 V!40601)) (EmptyCell!12593) )
))
(declare-datatypes ((array!70177 0))(
  ( (array!70178 (arr!33756 (Array (_ BitVec 32) ValueCell!12593)) (size!34293 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70177)

(declare-fun getCurrentListMap!4248 (array!70175 array!70177 (_ BitVec 32) (_ BitVec 32) V!40601 V!40601 (_ BitVec 32) Int) ListLongMap!14935)

(assert (=> b!1088328 (= lt!484017 (getCurrentListMap!4248 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484020 () ListLongMap!14935)

(declare-fun lt!484009 () array!70177)

(assert (=> b!1088328 (= lt!484020 (getCurrentListMap!4248 lt!484015 lt!484009 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484007 () ListLongMap!14935)

(declare-fun lt!484019 () ListLongMap!14935)

(assert (=> b!1088328 (and (= lt!484007 lt!484019) (= lt!484019 lt!484007))))

(declare-fun lt!484014 () ListLongMap!14935)

(declare-fun -!795 (ListLongMap!14935 (_ BitVec 64)) ListLongMap!14935)

(assert (=> b!1088328 (= lt!484019 (-!795 lt!484014 k0!904))))

(declare-datatypes ((Unit!35757 0))(
  ( (Unit!35758) )
))
(declare-fun lt!484016 () Unit!35757)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!77 (array!70175 array!70177 (_ BitVec 32) (_ BitVec 32) V!40601 V!40601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35757)

(assert (=> b!1088328 (= lt!484016 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!77 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4053 (array!70175 array!70177 (_ BitVec 32) (_ BitVec 32) V!40601 V!40601 (_ BitVec 32) Int) ListLongMap!14935)

(assert (=> b!1088328 (= lt!484007 (getCurrentListMapNoExtraKeys!4053 lt!484015 lt!484009 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2174 (Int (_ BitVec 64)) V!40601)

(assert (=> b!1088328 (= lt!484009 (array!70178 (store (arr!33756 _values!874) i!650 (ValueCellFull!12593 (dynLambda!2174 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34293 _values!874)))))

(assert (=> b!1088328 (= lt!484014 (getCurrentListMapNoExtraKeys!4053 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088328 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484013 () Unit!35757)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70175 (_ BitVec 64) (_ BitVec 32)) Unit!35757)

(assert (=> b!1088328 (= lt!484013 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088329 () Bool)

(declare-fun res!725388 () Bool)

(assert (=> b!1088329 (=> (not res!725388) (not e!621784))))

(assert (=> b!1088329 (= res!725388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088330 () Bool)

(declare-fun e!621778 () Bool)

(assert (=> b!1088330 (= e!621778 true)))

(declare-fun lt!484006 () tuple2!16958)

(declare-fun lt!484005 () ListLongMap!14935)

(declare-fun lt!484018 () ListLongMap!14935)

(declare-fun +!3306 (ListLongMap!14935 tuple2!16958) ListLongMap!14935)

(assert (=> b!1088330 (= (-!795 lt!484018 k0!904) (+!3306 lt!484005 lt!484006))))

(declare-fun lt!484008 () ListLongMap!14935)

(declare-fun lt!484010 () Unit!35757)

(declare-fun addRemoveCommutativeForDiffKeys!40 (ListLongMap!14935 (_ BitVec 64) V!40601 (_ BitVec 64)) Unit!35757)

(assert (=> b!1088330 (= lt!484010 (addRemoveCommutativeForDiffKeys!40 lt!484008 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1088331 () Bool)

(declare-fun e!621781 () Bool)

(declare-fun mapRes!41662 () Bool)

(assert (=> b!1088331 (= e!621781 (and e!621780 mapRes!41662))))

(declare-fun condMapEmpty!41662 () Bool)

(declare-fun mapDefault!41662 () ValueCell!12593)

(assert (=> b!1088331 (= condMapEmpty!41662 (= (arr!33756 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12593)) mapDefault!41662)))))

(declare-fun b!1088332 () Bool)

(declare-fun res!725397 () Bool)

(assert (=> b!1088332 (=> (not res!725397) (not e!621784))))

(assert (=> b!1088332 (= res!725397 (= (select (arr!33755 _keys!1070) i!650) k0!904))))

(declare-fun b!1088333 () Bool)

(declare-fun res!725394 () Bool)

(assert (=> b!1088333 (=> (not res!725394) (not e!621784))))

(assert (=> b!1088333 (= res!725394 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34292 _keys!1070))))))

(declare-fun b!1088334 () Bool)

(declare-fun res!725392 () Bool)

(assert (=> b!1088334 (=> (not res!725392) (not e!621782))))

(assert (=> b!1088334 (= res!725392 (arrayNoDuplicates!0 lt!484015 #b00000000000000000000000000000000 Nil!23550))))

(declare-fun mapNonEmpty!41662 () Bool)

(declare-fun tp!79658 () Bool)

(declare-fun e!621783 () Bool)

(assert (=> mapNonEmpty!41662 (= mapRes!41662 (and tp!79658 e!621783))))

(declare-fun mapRest!41662 () (Array (_ BitVec 32) ValueCell!12593))

(declare-fun mapValue!41662 () ValueCell!12593)

(declare-fun mapKey!41662 () (_ BitVec 32))

(assert (=> mapNonEmpty!41662 (= (arr!33756 _values!874) (store mapRest!41662 mapKey!41662 mapValue!41662))))

(declare-fun res!725395 () Bool)

(assert (=> start!96186 (=> (not res!725395) (not e!621784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96186 (= res!725395 (validMask!0 mask!1414))))

(assert (=> start!96186 e!621784))

(assert (=> start!96186 tp!79657))

(assert (=> start!96186 true))

(assert (=> start!96186 tp_is_empty!26605))

(declare-fun array_inv!26090 (array!70175) Bool)

(assert (=> start!96186 (array_inv!26090 _keys!1070)))

(declare-fun array_inv!26091 (array!70177) Bool)

(assert (=> start!96186 (and (array_inv!26091 _values!874) e!621781)))

(declare-fun b!1088335 () Bool)

(declare-fun res!725390 () Bool)

(assert (=> b!1088335 (=> (not res!725390) (not e!621784))))

(assert (=> b!1088335 (= res!725390 (and (= (size!34293 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34292 _keys!1070) (size!34293 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088336 () Bool)

(assert (=> b!1088336 (= e!621783 tp_is_empty!26605)))

(declare-fun mapIsEmpty!41662 () Bool)

(assert (=> mapIsEmpty!41662 mapRes!41662))

(declare-fun b!1088337 () Bool)

(assert (=> b!1088337 (= e!621779 e!621778)))

(declare-fun res!725387 () Bool)

(assert (=> b!1088337 (=> res!725387 e!621778)))

(assert (=> b!1088337 (= res!725387 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!484012 () ListLongMap!14935)

(assert (=> b!1088337 (= lt!484005 lt!484012)))

(assert (=> b!1088337 (= lt!484005 (-!795 lt!484008 k0!904))))

(declare-fun lt!484004 () Unit!35757)

(assert (=> b!1088337 (= lt!484004 (addRemoveCommutativeForDiffKeys!40 lt!484014 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1088337 (= lt!484020 (+!3306 lt!484012 lt!484006))))

(declare-fun lt!484011 () tuple2!16958)

(assert (=> b!1088337 (= lt!484012 (+!3306 lt!484019 lt!484011))))

(assert (=> b!1088337 (= lt!484017 lt!484018)))

(assert (=> b!1088337 (= lt!484018 (+!3306 lt!484008 lt!484006))))

(assert (=> b!1088337 (= lt!484008 (+!3306 lt!484014 lt!484011))))

(assert (=> b!1088337 (= lt!484020 (+!3306 (+!3306 lt!484007 lt!484011) lt!484006))))

(assert (=> b!1088337 (= lt!484006 (tuple2!16959 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1088337 (= lt!484011 (tuple2!16959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(assert (= (and start!96186 res!725395) b!1088335))

(assert (= (and b!1088335 res!725390) b!1088329))

(assert (= (and b!1088329 res!725388) b!1088327))

(assert (= (and b!1088327 res!725393) b!1088333))

(assert (= (and b!1088333 res!725394) b!1088324))

(assert (= (and b!1088324 res!725389) b!1088332))

(assert (= (and b!1088332 res!725397) b!1088325))

(assert (= (and b!1088325 res!725396) b!1088334))

(assert (= (and b!1088334 res!725392) b!1088328))

(assert (= (and b!1088328 (not res!725391)) b!1088337))

(assert (= (and b!1088337 (not res!725387)) b!1088330))

(assert (= (and b!1088331 condMapEmpty!41662) mapIsEmpty!41662))

(assert (= (and b!1088331 (not condMapEmpty!41662)) mapNonEmpty!41662))

(get-info :version)

(assert (= (and mapNonEmpty!41662 ((_ is ValueCellFull!12593) mapValue!41662)) b!1088336))

(assert (= (and b!1088331 ((_ is ValueCellFull!12593) mapDefault!41662)) b!1088326))

(assert (= start!96186 b!1088331))

(declare-fun b_lambda!17283 () Bool)

(assert (=> (not b_lambda!17283) (not b!1088328)))

(declare-fun t!33205 () Bool)

(declare-fun tb!7473 () Bool)

(assert (=> (and start!96186 (= defaultEntry!882 defaultEntry!882) t!33205) tb!7473))

(declare-fun result!15473 () Bool)

(assert (=> tb!7473 (= result!15473 tp_is_empty!26605)))

(assert (=> b!1088328 t!33205))

(declare-fun b_and!35893 () Bool)

(assert (= b_and!35891 (and (=> t!33205 result!15473) b_and!35893)))

(declare-fun m!1007423 () Bool)

(assert (=> b!1088329 m!1007423))

(declare-fun m!1007425 () Bool)

(assert (=> b!1088337 m!1007425))

(declare-fun m!1007427 () Bool)

(assert (=> b!1088337 m!1007427))

(declare-fun m!1007429 () Bool)

(assert (=> b!1088337 m!1007429))

(declare-fun m!1007431 () Bool)

(assert (=> b!1088337 m!1007431))

(declare-fun m!1007433 () Bool)

(assert (=> b!1088337 m!1007433))

(assert (=> b!1088337 m!1007427))

(declare-fun m!1007435 () Bool)

(assert (=> b!1088337 m!1007435))

(declare-fun m!1007437 () Bool)

(assert (=> b!1088337 m!1007437))

(declare-fun m!1007439 () Bool)

(assert (=> b!1088337 m!1007439))

(declare-fun m!1007441 () Bool)

(assert (=> b!1088325 m!1007441))

(declare-fun m!1007443 () Bool)

(assert (=> b!1088325 m!1007443))

(declare-fun m!1007445 () Bool)

(assert (=> b!1088334 m!1007445))

(declare-fun m!1007447 () Bool)

(assert (=> b!1088332 m!1007447))

(declare-fun m!1007449 () Bool)

(assert (=> start!96186 m!1007449))

(declare-fun m!1007451 () Bool)

(assert (=> start!96186 m!1007451))

(declare-fun m!1007453 () Bool)

(assert (=> start!96186 m!1007453))

(declare-fun m!1007455 () Bool)

(assert (=> b!1088328 m!1007455))

(declare-fun m!1007457 () Bool)

(assert (=> b!1088328 m!1007457))

(declare-fun m!1007459 () Bool)

(assert (=> b!1088328 m!1007459))

(declare-fun m!1007461 () Bool)

(assert (=> b!1088328 m!1007461))

(declare-fun m!1007463 () Bool)

(assert (=> b!1088328 m!1007463))

(declare-fun m!1007465 () Bool)

(assert (=> b!1088328 m!1007465))

(declare-fun m!1007467 () Bool)

(assert (=> b!1088328 m!1007467))

(declare-fun m!1007469 () Bool)

(assert (=> b!1088328 m!1007469))

(declare-fun m!1007471 () Bool)

(assert (=> b!1088328 m!1007471))

(declare-fun m!1007473 () Bool)

(assert (=> b!1088328 m!1007473))

(declare-fun m!1007475 () Bool)

(assert (=> mapNonEmpty!41662 m!1007475))

(declare-fun m!1007477 () Bool)

(assert (=> b!1088330 m!1007477))

(declare-fun m!1007479 () Bool)

(assert (=> b!1088330 m!1007479))

(declare-fun m!1007481 () Bool)

(assert (=> b!1088330 m!1007481))

(declare-fun m!1007483 () Bool)

(assert (=> b!1088324 m!1007483))

(declare-fun m!1007485 () Bool)

(assert (=> b!1088327 m!1007485))

(check-sat (not b_lambda!17283) (not start!96186) (not b!1088328) (not b!1088329) (not b!1088325) (not b!1088327) tp_is_empty!26605 b_and!35893 (not mapNonEmpty!41662) (not b!1088330) (not b_next!22603) (not b!1088337) (not b!1088324) (not b!1088334))
(check-sat b_and!35893 (not b_next!22603))
