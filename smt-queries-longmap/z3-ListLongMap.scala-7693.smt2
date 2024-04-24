; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96792 () Bool)

(assert start!96792)

(declare-fun b_free!23083 () Bool)

(declare-fun b_next!23083 () Bool)

(assert (=> start!96792 (= b_free!23083 (not b_next!23083))))

(declare-fun tp!81181 () Bool)

(declare-fun b_and!36867 () Bool)

(assert (=> start!96792 (= tp!81181 b_and!36867)))

(declare-fun b!1099433 () Bool)

(declare-fun res!733385 () Bool)

(declare-fun e!627599 () Bool)

(assert (=> b!1099433 (=> (not res!733385) (not e!627599))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099433 (= res!733385 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!42466 () Bool)

(declare-fun mapRes!42466 () Bool)

(assert (=> mapIsEmpty!42466 mapRes!42466))

(declare-fun b!1099434 () Bool)

(declare-fun e!627597 () Bool)

(assert (=> b!1099434 (= e!627597 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904)))))

(declare-fun e!627598 () Bool)

(assert (=> b!1099434 e!627598))

(declare-fun res!733386 () Bool)

(assert (=> b!1099434 (=> (not res!733386) (not e!627598))))

(declare-datatypes ((V!41305 0))(
  ( (V!41306 (val!13623 Int)) )
))
(declare-datatypes ((tuple2!17316 0))(
  ( (tuple2!17317 (_1!8669 (_ BitVec 64)) (_2!8669 V!41305)) )
))
(declare-datatypes ((List!23939 0))(
  ( (Nil!23936) (Cons!23935 (h!25153 tuple2!17316) (t!34060 List!23939)) )
))
(declare-datatypes ((ListLongMap!15293 0))(
  ( (ListLongMap!15294 (toList!7662 List!23939)) )
))
(declare-fun lt!491607 () ListLongMap!15293)

(declare-fun lt!491612 () ListLongMap!15293)

(declare-fun lt!491610 () tuple2!17316)

(declare-fun lt!491609 () tuple2!17316)

(declare-fun +!3396 (ListLongMap!15293 tuple2!17316) ListLongMap!15293)

(assert (=> b!1099434 (= res!733386 (= lt!491612 (+!3396 (+!3396 lt!491607 lt!491609) lt!491610)))))

(declare-fun minValue!831 () V!41305)

(assert (=> b!1099434 (= lt!491610 (tuple2!17317 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun zeroValue!831 () V!41305)

(assert (=> b!1099434 (= lt!491609 (tuple2!17317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099435 () Bool)

(declare-fun e!627600 () Bool)

(assert (=> b!1099435 (= e!627599 e!627600)))

(declare-fun res!733384 () Bool)

(assert (=> b!1099435 (=> (not res!733384) (not e!627600))))

(declare-datatypes ((array!71211 0))(
  ( (array!71212 (arr!34269 (Array (_ BitVec 32) (_ BitVec 64))) (size!34806 (_ BitVec 32))) )
))
(declare-fun lt!491606 () array!71211)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71211 (_ BitVec 32)) Bool)

(assert (=> b!1099435 (= res!733384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491606 mask!1414))))

(declare-fun _keys!1070 () array!71211)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1099435 (= lt!491606 (array!71212 (store (arr!34269 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34806 _keys!1070)))))

(declare-fun b!1099437 () Bool)

(declare-fun res!733395 () Bool)

(assert (=> b!1099437 (=> (not res!733395) (not e!627599))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12857 0))(
  ( (ValueCellFull!12857 (v!16242 V!41305)) (EmptyCell!12857) )
))
(declare-datatypes ((array!71213 0))(
  ( (array!71214 (arr!34270 (Array (_ BitVec 32) ValueCell!12857)) (size!34807 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71213)

(assert (=> b!1099437 (= res!733395 (and (= (size!34807 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34806 _keys!1070) (size!34807 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1099438 () Bool)

(declare-fun res!733392 () Bool)

(assert (=> b!1099438 (=> (not res!733392) (not e!627599))))

(assert (=> b!1099438 (= res!733392 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34806 _keys!1070))))))

(declare-fun b!1099439 () Bool)

(declare-fun lt!491605 () ListLongMap!15293)

(assert (=> b!1099439 (= e!627598 (= lt!491612 (+!3396 (+!3396 lt!491605 lt!491609) lt!491610)))))

(declare-fun b!1099440 () Bool)

(declare-fun e!627601 () Bool)

(declare-fun e!627602 () Bool)

(assert (=> b!1099440 (= e!627601 (and e!627602 mapRes!42466))))

(declare-fun condMapEmpty!42466 () Bool)

(declare-fun mapDefault!42466 () ValueCell!12857)

(assert (=> b!1099440 (= condMapEmpty!42466 (= (arr!34270 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12857)) mapDefault!42466)))))

(declare-fun b!1099441 () Bool)

(declare-fun e!627595 () Bool)

(declare-fun tp_is_empty!27133 () Bool)

(assert (=> b!1099441 (= e!627595 tp_is_empty!27133)))

(declare-fun mapNonEmpty!42466 () Bool)

(declare-fun tp!81182 () Bool)

(assert (=> mapNonEmpty!42466 (= mapRes!42466 (and tp!81182 e!627595))))

(declare-fun mapKey!42466 () (_ BitVec 32))

(declare-fun mapValue!42466 () ValueCell!12857)

(declare-fun mapRest!42466 () (Array (_ BitVec 32) ValueCell!12857))

(assert (=> mapNonEmpty!42466 (= (arr!34270 _values!874) (store mapRest!42466 mapKey!42466 mapValue!42466))))

(declare-fun b!1099442 () Bool)

(declare-fun res!733394 () Bool)

(assert (=> b!1099442 (=> (not res!733394) (not e!627600))))

(declare-datatypes ((List!23940 0))(
  ( (Nil!23937) (Cons!23936 (h!25154 (_ BitVec 64)) (t!34061 List!23940)) )
))
(declare-fun arrayNoDuplicates!0 (array!71211 (_ BitVec 32) List!23940) Bool)

(assert (=> b!1099442 (= res!733394 (arrayNoDuplicates!0 lt!491606 #b00000000000000000000000000000000 Nil!23937))))

(declare-fun b!1099443 () Bool)

(assert (=> b!1099443 (= e!627600 (not e!627597))))

(declare-fun res!733389 () Bool)

(assert (=> b!1099443 (=> res!733389 e!627597)))

(assert (=> b!1099443 (= res!733389 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!491604 () ListLongMap!15293)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4372 (array!71211 array!71213 (_ BitVec 32) (_ BitVec 32) V!41305 V!41305 (_ BitVec 32) Int) ListLongMap!15293)

(assert (=> b!1099443 (= lt!491604 (getCurrentListMap!4372 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491608 () array!71213)

(assert (=> b!1099443 (= lt!491612 (getCurrentListMap!4372 lt!491606 lt!491608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1099443 (and (= lt!491607 lt!491605) (= lt!491605 lt!491607))))

(declare-fun lt!491603 () ListLongMap!15293)

(declare-fun -!934 (ListLongMap!15293 (_ BitVec 64)) ListLongMap!15293)

(assert (=> b!1099443 (= lt!491605 (-!934 lt!491603 k0!904))))

(declare-datatypes ((Unit!36111 0))(
  ( (Unit!36112) )
))
(declare-fun lt!491611 () Unit!36111)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!206 (array!71211 array!71213 (_ BitVec 32) (_ BitVec 32) V!41305 V!41305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36111)

(assert (=> b!1099443 (= lt!491611 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!206 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4213 (array!71211 array!71213 (_ BitVec 32) (_ BitVec 32) V!41305 V!41305 (_ BitVec 32) Int) ListLongMap!15293)

(assert (=> b!1099443 (= lt!491607 (getCurrentListMapNoExtraKeys!4213 lt!491606 lt!491608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2331 (Int (_ BitVec 64)) V!41305)

(assert (=> b!1099443 (= lt!491608 (array!71214 (store (arr!34270 _values!874) i!650 (ValueCellFull!12857 (dynLambda!2331 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34807 _values!874)))))

(assert (=> b!1099443 (= lt!491603 (getCurrentListMapNoExtraKeys!4213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1099443 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491602 () Unit!36111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71211 (_ BitVec 64) (_ BitVec 32)) Unit!36111)

(assert (=> b!1099443 (= lt!491602 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1099444 () Bool)

(declare-fun res!733388 () Bool)

(assert (=> b!1099444 (=> (not res!733388) (not e!627599))))

(assert (=> b!1099444 (= res!733388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1099445 () Bool)

(assert (=> b!1099445 (= e!627602 tp_is_empty!27133)))

(declare-fun b!1099436 () Bool)

(declare-fun res!733390 () Bool)

(assert (=> b!1099436 (=> (not res!733390) (not e!627599))))

(assert (=> b!1099436 (= res!733390 (= (select (arr!34269 _keys!1070) i!650) k0!904))))

(declare-fun res!733391 () Bool)

(assert (=> start!96792 (=> (not res!733391) (not e!627599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96792 (= res!733391 (validMask!0 mask!1414))))

(assert (=> start!96792 e!627599))

(assert (=> start!96792 tp!81181))

(assert (=> start!96792 true))

(assert (=> start!96792 tp_is_empty!27133))

(declare-fun array_inv!26424 (array!71211) Bool)

(assert (=> start!96792 (array_inv!26424 _keys!1070)))

(declare-fun array_inv!26425 (array!71213) Bool)

(assert (=> start!96792 (and (array_inv!26425 _values!874) e!627601)))

(declare-fun b!1099446 () Bool)

(declare-fun res!733393 () Bool)

(assert (=> b!1099446 (=> (not res!733393) (not e!627598))))

(assert (=> b!1099446 (= res!733393 (= lt!491604 (+!3396 (+!3396 lt!491603 lt!491609) lt!491610)))))

(declare-fun b!1099447 () Bool)

(declare-fun res!733387 () Bool)

(assert (=> b!1099447 (=> (not res!733387) (not e!627599))))

(assert (=> b!1099447 (= res!733387 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23937))))

(assert (= (and start!96792 res!733391) b!1099437))

(assert (= (and b!1099437 res!733395) b!1099444))

(assert (= (and b!1099444 res!733388) b!1099447))

(assert (= (and b!1099447 res!733387) b!1099438))

(assert (= (and b!1099438 res!733392) b!1099433))

(assert (= (and b!1099433 res!733385) b!1099436))

(assert (= (and b!1099436 res!733390) b!1099435))

(assert (= (and b!1099435 res!733384) b!1099442))

(assert (= (and b!1099442 res!733394) b!1099443))

(assert (= (and b!1099443 (not res!733389)) b!1099434))

(assert (= (and b!1099434 res!733386) b!1099446))

(assert (= (and b!1099446 res!733393) b!1099439))

(assert (= (and b!1099440 condMapEmpty!42466) mapIsEmpty!42466))

(assert (= (and b!1099440 (not condMapEmpty!42466)) mapNonEmpty!42466))

(get-info :version)

(assert (= (and mapNonEmpty!42466 ((_ is ValueCellFull!12857) mapValue!42466)) b!1099441))

(assert (= (and b!1099440 ((_ is ValueCellFull!12857) mapDefault!42466)) b!1099445))

(assert (= start!96792 b!1099440))

(declare-fun b_lambda!17811 () Bool)

(assert (=> (not b_lambda!17811) (not b!1099443)))

(declare-fun t!34059 () Bool)

(declare-fun tb!7941 () Bool)

(assert (=> (and start!96792 (= defaultEntry!882 defaultEntry!882) t!34059) tb!7941))

(declare-fun result!16417 () Bool)

(assert (=> tb!7941 (= result!16417 tp_is_empty!27133)))

(assert (=> b!1099443 t!34059))

(declare-fun b_and!36869 () Bool)

(assert (= b_and!36867 (and (=> t!34059 result!16417) b_and!36869)))

(declare-fun m!1019365 () Bool)

(assert (=> mapNonEmpty!42466 m!1019365))

(declare-fun m!1019367 () Bool)

(assert (=> b!1099443 m!1019367))

(declare-fun m!1019369 () Bool)

(assert (=> b!1099443 m!1019369))

(declare-fun m!1019371 () Bool)

(assert (=> b!1099443 m!1019371))

(declare-fun m!1019373 () Bool)

(assert (=> b!1099443 m!1019373))

(declare-fun m!1019375 () Bool)

(assert (=> b!1099443 m!1019375))

(declare-fun m!1019377 () Bool)

(assert (=> b!1099443 m!1019377))

(declare-fun m!1019379 () Bool)

(assert (=> b!1099443 m!1019379))

(declare-fun m!1019381 () Bool)

(assert (=> b!1099443 m!1019381))

(declare-fun m!1019383 () Bool)

(assert (=> b!1099443 m!1019383))

(declare-fun m!1019385 () Bool)

(assert (=> b!1099443 m!1019385))

(declare-fun m!1019387 () Bool)

(assert (=> b!1099436 m!1019387))

(declare-fun m!1019389 () Bool)

(assert (=> b!1099442 m!1019389))

(declare-fun m!1019391 () Bool)

(assert (=> b!1099444 m!1019391))

(declare-fun m!1019393 () Bool)

(assert (=> b!1099439 m!1019393))

(assert (=> b!1099439 m!1019393))

(declare-fun m!1019395 () Bool)

(assert (=> b!1099439 m!1019395))

(declare-fun m!1019397 () Bool)

(assert (=> start!96792 m!1019397))

(declare-fun m!1019399 () Bool)

(assert (=> start!96792 m!1019399))

(declare-fun m!1019401 () Bool)

(assert (=> start!96792 m!1019401))

(declare-fun m!1019403 () Bool)

(assert (=> b!1099435 m!1019403))

(declare-fun m!1019405 () Bool)

(assert (=> b!1099435 m!1019405))

(declare-fun m!1019407 () Bool)

(assert (=> b!1099447 m!1019407))

(declare-fun m!1019409 () Bool)

(assert (=> b!1099434 m!1019409))

(assert (=> b!1099434 m!1019409))

(declare-fun m!1019411 () Bool)

(assert (=> b!1099434 m!1019411))

(declare-fun m!1019413 () Bool)

(assert (=> b!1099446 m!1019413))

(assert (=> b!1099446 m!1019413))

(declare-fun m!1019415 () Bool)

(assert (=> b!1099446 m!1019415))

(declare-fun m!1019417 () Bool)

(assert (=> b!1099433 m!1019417))

(check-sat b_and!36869 (not start!96792) (not b!1099444) (not b!1099434) (not mapNonEmpty!42466) (not b!1099433) (not b_lambda!17811) (not b!1099443) (not b!1099439) (not b_next!23083) (not b!1099442) (not b!1099435) (not b!1099447) tp_is_empty!27133 (not b!1099446))
(check-sat b_and!36869 (not b_next!23083))
(get-model)

(declare-fun b_lambda!17817 () Bool)

(assert (= b_lambda!17811 (or (and start!96792 b_free!23083) b_lambda!17817)))

(check-sat b_and!36869 (not start!96792) (not b!1099444) (not b!1099434) (not mapNonEmpty!42466) (not b!1099433) (not b_lambda!17817) (not b!1099443) (not b!1099439) (not b_next!23083) (not b!1099442) (not b!1099435) (not b!1099447) tp_is_empty!27133 (not b!1099446))
(check-sat b_and!36869 (not b_next!23083))
(get-model)

(declare-fun b!1099552 () Bool)

(declare-fun e!627657 () Bool)

(declare-fun call!45926 () Bool)

(assert (=> b!1099552 (= e!627657 call!45926)))

(declare-fun b!1099553 () Bool)

(declare-fun e!627659 () Bool)

(assert (=> b!1099553 (= e!627659 e!627657)))

(declare-fun lt!491686 () (_ BitVec 64))

(assert (=> b!1099553 (= lt!491686 (select (arr!34269 lt!491606) #b00000000000000000000000000000000))))

(declare-fun lt!491685 () Unit!36111)

(assert (=> b!1099553 (= lt!491685 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!491606 lt!491686 #b00000000000000000000000000000000))))

(assert (=> b!1099553 (arrayContainsKey!0 lt!491606 lt!491686 #b00000000000000000000000000000000)))

(declare-fun lt!491687 () Unit!36111)

(assert (=> b!1099553 (= lt!491687 lt!491685)))

(declare-fun res!733473 () Bool)

(declare-datatypes ((SeekEntryResult!9864 0))(
  ( (MissingZero!9864 (index!41827 (_ BitVec 32))) (Found!9864 (index!41828 (_ BitVec 32))) (Intermediate!9864 (undefined!10676 Bool) (index!41829 (_ BitVec 32)) (x!98754 (_ BitVec 32))) (Undefined!9864) (MissingVacant!9864 (index!41830 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71211 (_ BitVec 32)) SeekEntryResult!9864)

(assert (=> b!1099553 (= res!733473 (= (seekEntryOrOpen!0 (select (arr!34269 lt!491606) #b00000000000000000000000000000000) lt!491606 mask!1414) (Found!9864 #b00000000000000000000000000000000)))))

(assert (=> b!1099553 (=> (not res!733473) (not e!627657))))

(declare-fun b!1099554 () Bool)

(assert (=> b!1099554 (= e!627659 call!45926)))

(declare-fun d!130839 () Bool)

(declare-fun res!733472 () Bool)

(declare-fun e!627658 () Bool)

(assert (=> d!130839 (=> res!733472 e!627658)))

(assert (=> d!130839 (= res!733472 (bvsge #b00000000000000000000000000000000 (size!34806 lt!491606)))))

(assert (=> d!130839 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491606 mask!1414) e!627658)))

(declare-fun bm!45923 () Bool)

(assert (=> bm!45923 (= call!45926 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!491606 mask!1414))))

(declare-fun b!1099555 () Bool)

(assert (=> b!1099555 (= e!627658 e!627659)))

(declare-fun c!108873 () Bool)

(assert (=> b!1099555 (= c!108873 (validKeyInArray!0 (select (arr!34269 lt!491606) #b00000000000000000000000000000000)))))

(assert (= (and d!130839 (not res!733472)) b!1099555))

(assert (= (and b!1099555 c!108873) b!1099553))

(assert (= (and b!1099555 (not c!108873)) b!1099554))

(assert (= (and b!1099553 res!733473) b!1099552))

(assert (= (or b!1099552 b!1099554) bm!45923))

(declare-fun m!1019527 () Bool)

(assert (=> b!1099553 m!1019527))

(declare-fun m!1019529 () Bool)

(assert (=> b!1099553 m!1019529))

(declare-fun m!1019531 () Bool)

(assert (=> b!1099553 m!1019531))

(assert (=> b!1099553 m!1019527))

(declare-fun m!1019533 () Bool)

(assert (=> b!1099553 m!1019533))

(declare-fun m!1019535 () Bool)

(assert (=> bm!45923 m!1019535))

(assert (=> b!1099555 m!1019527))

(assert (=> b!1099555 m!1019527))

(declare-fun m!1019537 () Bool)

(assert (=> b!1099555 m!1019537))

(assert (=> b!1099435 d!130839))

(declare-fun b!1099556 () Bool)

(declare-fun e!627660 () Bool)

(declare-fun call!45927 () Bool)

(assert (=> b!1099556 (= e!627660 call!45927)))

(declare-fun b!1099557 () Bool)

(declare-fun e!627662 () Bool)

(assert (=> b!1099557 (= e!627662 e!627660)))

(declare-fun lt!491689 () (_ BitVec 64))

(assert (=> b!1099557 (= lt!491689 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491688 () Unit!36111)

(assert (=> b!1099557 (= lt!491688 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!491689 #b00000000000000000000000000000000))))

(assert (=> b!1099557 (arrayContainsKey!0 _keys!1070 lt!491689 #b00000000000000000000000000000000)))

(declare-fun lt!491690 () Unit!36111)

(assert (=> b!1099557 (= lt!491690 lt!491688)))

(declare-fun res!733475 () Bool)

(assert (=> b!1099557 (= res!733475 (= (seekEntryOrOpen!0 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9864 #b00000000000000000000000000000000)))))

(assert (=> b!1099557 (=> (not res!733475) (not e!627660))))

(declare-fun b!1099558 () Bool)

(assert (=> b!1099558 (= e!627662 call!45927)))

(declare-fun d!130841 () Bool)

(declare-fun res!733474 () Bool)

(declare-fun e!627661 () Bool)

(assert (=> d!130841 (=> res!733474 e!627661)))

(assert (=> d!130841 (= res!733474 (bvsge #b00000000000000000000000000000000 (size!34806 _keys!1070)))))

(assert (=> d!130841 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!627661)))

(declare-fun bm!45924 () Bool)

(assert (=> bm!45924 (= call!45927 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1099559 () Bool)

(assert (=> b!1099559 (= e!627661 e!627662)))

(declare-fun c!108874 () Bool)

(assert (=> b!1099559 (= c!108874 (validKeyInArray!0 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130841 (not res!733474)) b!1099559))

(assert (= (and b!1099559 c!108874) b!1099557))

(assert (= (and b!1099559 (not c!108874)) b!1099558))

(assert (= (and b!1099557 res!733475) b!1099556))

(assert (= (or b!1099556 b!1099558) bm!45924))

(declare-fun m!1019539 () Bool)

(assert (=> b!1099557 m!1019539))

(declare-fun m!1019541 () Bool)

(assert (=> b!1099557 m!1019541))

(declare-fun m!1019543 () Bool)

(assert (=> b!1099557 m!1019543))

(assert (=> b!1099557 m!1019539))

(declare-fun m!1019545 () Bool)

(assert (=> b!1099557 m!1019545))

(declare-fun m!1019547 () Bool)

(assert (=> bm!45924 m!1019547))

(assert (=> b!1099559 m!1019539))

(assert (=> b!1099559 m!1019539))

(declare-fun m!1019549 () Bool)

(assert (=> b!1099559 m!1019549))

(assert (=> b!1099444 d!130841))

(declare-fun d!130843 () Bool)

(declare-fun e!627665 () Bool)

(assert (=> d!130843 e!627665))

(declare-fun res!733480 () Bool)

(assert (=> d!130843 (=> (not res!733480) (not e!627665))))

(declare-fun lt!491699 () ListLongMap!15293)

(declare-fun contains!6407 (ListLongMap!15293 (_ BitVec 64)) Bool)

(assert (=> d!130843 (= res!733480 (contains!6407 lt!491699 (_1!8669 lt!491610)))))

(declare-fun lt!491702 () List!23939)

(assert (=> d!130843 (= lt!491699 (ListLongMap!15294 lt!491702))))

(declare-fun lt!491701 () Unit!36111)

(declare-fun lt!491700 () Unit!36111)

(assert (=> d!130843 (= lt!491701 lt!491700)))

(declare-datatypes ((Option!667 0))(
  ( (Some!666 (v!16245 V!41305)) (None!665) )
))
(declare-fun getValueByKey!616 (List!23939 (_ BitVec 64)) Option!667)

(assert (=> d!130843 (= (getValueByKey!616 lt!491702 (_1!8669 lt!491610)) (Some!666 (_2!8669 lt!491610)))))

(declare-fun lemmaContainsTupThenGetReturnValue!298 (List!23939 (_ BitVec 64) V!41305) Unit!36111)

(assert (=> d!130843 (= lt!491700 (lemmaContainsTupThenGetReturnValue!298 lt!491702 (_1!8669 lt!491610) (_2!8669 lt!491610)))))

(declare-fun insertStrictlySorted!391 (List!23939 (_ BitVec 64) V!41305) List!23939)

(assert (=> d!130843 (= lt!491702 (insertStrictlySorted!391 (toList!7662 (+!3396 lt!491607 lt!491609)) (_1!8669 lt!491610) (_2!8669 lt!491610)))))

(assert (=> d!130843 (= (+!3396 (+!3396 lt!491607 lt!491609) lt!491610) lt!491699)))

(declare-fun b!1099564 () Bool)

(declare-fun res!733481 () Bool)

(assert (=> b!1099564 (=> (not res!733481) (not e!627665))))

(assert (=> b!1099564 (= res!733481 (= (getValueByKey!616 (toList!7662 lt!491699) (_1!8669 lt!491610)) (Some!666 (_2!8669 lt!491610))))))

(declare-fun b!1099565 () Bool)

(declare-fun contains!6408 (List!23939 tuple2!17316) Bool)

(assert (=> b!1099565 (= e!627665 (contains!6408 (toList!7662 lt!491699) lt!491610))))

(assert (= (and d!130843 res!733480) b!1099564))

(assert (= (and b!1099564 res!733481) b!1099565))

(declare-fun m!1019551 () Bool)

(assert (=> d!130843 m!1019551))

(declare-fun m!1019553 () Bool)

(assert (=> d!130843 m!1019553))

(declare-fun m!1019555 () Bool)

(assert (=> d!130843 m!1019555))

(declare-fun m!1019557 () Bool)

(assert (=> d!130843 m!1019557))

(declare-fun m!1019559 () Bool)

(assert (=> b!1099564 m!1019559))

(declare-fun m!1019561 () Bool)

(assert (=> b!1099565 m!1019561))

(assert (=> b!1099434 d!130843))

(declare-fun d!130845 () Bool)

(declare-fun e!627666 () Bool)

(assert (=> d!130845 e!627666))

(declare-fun res!733482 () Bool)

(assert (=> d!130845 (=> (not res!733482) (not e!627666))))

(declare-fun lt!491703 () ListLongMap!15293)

(assert (=> d!130845 (= res!733482 (contains!6407 lt!491703 (_1!8669 lt!491609)))))

(declare-fun lt!491706 () List!23939)

(assert (=> d!130845 (= lt!491703 (ListLongMap!15294 lt!491706))))

(declare-fun lt!491705 () Unit!36111)

(declare-fun lt!491704 () Unit!36111)

(assert (=> d!130845 (= lt!491705 lt!491704)))

(assert (=> d!130845 (= (getValueByKey!616 lt!491706 (_1!8669 lt!491609)) (Some!666 (_2!8669 lt!491609)))))

(assert (=> d!130845 (= lt!491704 (lemmaContainsTupThenGetReturnValue!298 lt!491706 (_1!8669 lt!491609) (_2!8669 lt!491609)))))

(assert (=> d!130845 (= lt!491706 (insertStrictlySorted!391 (toList!7662 lt!491607) (_1!8669 lt!491609) (_2!8669 lt!491609)))))

(assert (=> d!130845 (= (+!3396 lt!491607 lt!491609) lt!491703)))

(declare-fun b!1099566 () Bool)

(declare-fun res!733483 () Bool)

(assert (=> b!1099566 (=> (not res!733483) (not e!627666))))

(assert (=> b!1099566 (= res!733483 (= (getValueByKey!616 (toList!7662 lt!491703) (_1!8669 lt!491609)) (Some!666 (_2!8669 lt!491609))))))

(declare-fun b!1099567 () Bool)

(assert (=> b!1099567 (= e!627666 (contains!6408 (toList!7662 lt!491703) lt!491609))))

(assert (= (and d!130845 res!733482) b!1099566))

(assert (= (and b!1099566 res!733483) b!1099567))

(declare-fun m!1019563 () Bool)

(assert (=> d!130845 m!1019563))

(declare-fun m!1019565 () Bool)

(assert (=> d!130845 m!1019565))

(declare-fun m!1019567 () Bool)

(assert (=> d!130845 m!1019567))

(declare-fun m!1019569 () Bool)

(assert (=> d!130845 m!1019569))

(declare-fun m!1019571 () Bool)

(assert (=> b!1099566 m!1019571))

(declare-fun m!1019573 () Bool)

(assert (=> b!1099567 m!1019573))

(assert (=> b!1099434 d!130845))

(declare-fun d!130847 () Bool)

(declare-fun e!627667 () Bool)

(assert (=> d!130847 e!627667))

(declare-fun res!733484 () Bool)

(assert (=> d!130847 (=> (not res!733484) (not e!627667))))

(declare-fun lt!491707 () ListLongMap!15293)

(assert (=> d!130847 (= res!733484 (contains!6407 lt!491707 (_1!8669 lt!491610)))))

(declare-fun lt!491710 () List!23939)

(assert (=> d!130847 (= lt!491707 (ListLongMap!15294 lt!491710))))

(declare-fun lt!491709 () Unit!36111)

(declare-fun lt!491708 () Unit!36111)

(assert (=> d!130847 (= lt!491709 lt!491708)))

(assert (=> d!130847 (= (getValueByKey!616 lt!491710 (_1!8669 lt!491610)) (Some!666 (_2!8669 lt!491610)))))

(assert (=> d!130847 (= lt!491708 (lemmaContainsTupThenGetReturnValue!298 lt!491710 (_1!8669 lt!491610) (_2!8669 lt!491610)))))

(assert (=> d!130847 (= lt!491710 (insertStrictlySorted!391 (toList!7662 (+!3396 lt!491605 lt!491609)) (_1!8669 lt!491610) (_2!8669 lt!491610)))))

(assert (=> d!130847 (= (+!3396 (+!3396 lt!491605 lt!491609) lt!491610) lt!491707)))

(declare-fun b!1099568 () Bool)

(declare-fun res!733485 () Bool)

(assert (=> b!1099568 (=> (not res!733485) (not e!627667))))

(assert (=> b!1099568 (= res!733485 (= (getValueByKey!616 (toList!7662 lt!491707) (_1!8669 lt!491610)) (Some!666 (_2!8669 lt!491610))))))

(declare-fun b!1099569 () Bool)

(assert (=> b!1099569 (= e!627667 (contains!6408 (toList!7662 lt!491707) lt!491610))))

(assert (= (and d!130847 res!733484) b!1099568))

(assert (= (and b!1099568 res!733485) b!1099569))

(declare-fun m!1019575 () Bool)

(assert (=> d!130847 m!1019575))

(declare-fun m!1019577 () Bool)

(assert (=> d!130847 m!1019577))

(declare-fun m!1019579 () Bool)

(assert (=> d!130847 m!1019579))

(declare-fun m!1019581 () Bool)

(assert (=> d!130847 m!1019581))

(declare-fun m!1019583 () Bool)

(assert (=> b!1099568 m!1019583))

(declare-fun m!1019585 () Bool)

(assert (=> b!1099569 m!1019585))

(assert (=> b!1099439 d!130847))

(declare-fun d!130849 () Bool)

(declare-fun e!627668 () Bool)

(assert (=> d!130849 e!627668))

(declare-fun res!733486 () Bool)

(assert (=> d!130849 (=> (not res!733486) (not e!627668))))

(declare-fun lt!491711 () ListLongMap!15293)

(assert (=> d!130849 (= res!733486 (contains!6407 lt!491711 (_1!8669 lt!491609)))))

(declare-fun lt!491714 () List!23939)

(assert (=> d!130849 (= lt!491711 (ListLongMap!15294 lt!491714))))

(declare-fun lt!491713 () Unit!36111)

(declare-fun lt!491712 () Unit!36111)

(assert (=> d!130849 (= lt!491713 lt!491712)))

(assert (=> d!130849 (= (getValueByKey!616 lt!491714 (_1!8669 lt!491609)) (Some!666 (_2!8669 lt!491609)))))

(assert (=> d!130849 (= lt!491712 (lemmaContainsTupThenGetReturnValue!298 lt!491714 (_1!8669 lt!491609) (_2!8669 lt!491609)))))

(assert (=> d!130849 (= lt!491714 (insertStrictlySorted!391 (toList!7662 lt!491605) (_1!8669 lt!491609) (_2!8669 lt!491609)))))

(assert (=> d!130849 (= (+!3396 lt!491605 lt!491609) lt!491711)))

(declare-fun b!1099570 () Bool)

(declare-fun res!733487 () Bool)

(assert (=> b!1099570 (=> (not res!733487) (not e!627668))))

(assert (=> b!1099570 (= res!733487 (= (getValueByKey!616 (toList!7662 lt!491711) (_1!8669 lt!491609)) (Some!666 (_2!8669 lt!491609))))))

(declare-fun b!1099571 () Bool)

(assert (=> b!1099571 (= e!627668 (contains!6408 (toList!7662 lt!491711) lt!491609))))

(assert (= (and d!130849 res!733486) b!1099570))

(assert (= (and b!1099570 res!733487) b!1099571))

(declare-fun m!1019587 () Bool)

(assert (=> d!130849 m!1019587))

(declare-fun m!1019589 () Bool)

(assert (=> d!130849 m!1019589))

(declare-fun m!1019591 () Bool)

(assert (=> d!130849 m!1019591))

(declare-fun m!1019593 () Bool)

(assert (=> d!130849 m!1019593))

(declare-fun m!1019595 () Bool)

(assert (=> b!1099570 m!1019595))

(declare-fun m!1019597 () Bool)

(assert (=> b!1099571 m!1019597))

(assert (=> b!1099439 d!130849))

(declare-fun d!130851 () Bool)

(declare-fun res!733492 () Bool)

(declare-fun e!627673 () Bool)

(assert (=> d!130851 (=> res!733492 e!627673)))

(assert (=> d!130851 (= res!733492 (= (select (arr!34269 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130851 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!627673)))

(declare-fun b!1099576 () Bool)

(declare-fun e!627674 () Bool)

(assert (=> b!1099576 (= e!627673 e!627674)))

(declare-fun res!733493 () Bool)

(assert (=> b!1099576 (=> (not res!733493) (not e!627674))))

(assert (=> b!1099576 (= res!733493 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34806 _keys!1070)))))

(declare-fun b!1099577 () Bool)

(assert (=> b!1099577 (= e!627674 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130851 (not res!733492)) b!1099576))

(assert (= (and b!1099576 res!733493) b!1099577))

(assert (=> d!130851 m!1019539))

(declare-fun m!1019599 () Bool)

(assert (=> b!1099577 m!1019599))

(assert (=> b!1099443 d!130851))

(declare-fun call!45943 () ListLongMap!15293)

(declare-fun bm!45939 () Bool)

(assert (=> bm!45939 (= call!45943 (getCurrentListMapNoExtraKeys!4213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099620 () Bool)

(declare-fun e!627708 () Bool)

(declare-fun e!627704 () Bool)

(assert (=> b!1099620 (= e!627708 e!627704)))

(declare-fun res!733516 () Bool)

(declare-fun call!45942 () Bool)

(assert (=> b!1099620 (= res!733516 call!45942)))

(assert (=> b!1099620 (=> (not res!733516) (not e!627704))))

(declare-fun e!627705 () Bool)

(declare-fun b!1099621 () Bool)

(declare-fun lt!491769 () ListLongMap!15293)

(declare-fun apply!954 (ListLongMap!15293 (_ BitVec 64)) V!41305)

(declare-fun get!17648 (ValueCell!12857 V!41305) V!41305)

(assert (=> b!1099621 (= e!627705 (= (apply!954 lt!491769 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000)) (get!17648 (select (arr!34270 _values!874) #b00000000000000000000000000000000) (dynLambda!2331 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099621 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34807 _values!874)))))

(assert (=> b!1099621 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34806 _keys!1070)))))

(declare-fun b!1099622 () Bool)

(declare-fun e!627701 () Bool)

(declare-fun e!627712 () Bool)

(assert (=> b!1099622 (= e!627701 e!627712)))

(declare-fun res!733513 () Bool)

(declare-fun call!45946 () Bool)

(assert (=> b!1099622 (= res!733513 call!45946)))

(assert (=> b!1099622 (=> (not res!733513) (not e!627712))))

(declare-fun b!1099623 () Bool)

(assert (=> b!1099623 (= e!627712 (= (apply!954 lt!491769 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1099624 () Bool)

(assert (=> b!1099624 (= e!627701 (not call!45946))))

(declare-fun b!1099625 () Bool)

(declare-fun e!627703 () Bool)

(assert (=> b!1099625 (= e!627703 (validKeyInArray!0 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45940 () Bool)

(assert (=> bm!45940 (= call!45942 (contains!6407 lt!491769 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099627 () Bool)

(declare-fun e!627702 () Bool)

(assert (=> b!1099627 (= e!627702 e!627701)))

(declare-fun c!108892 () Bool)

(assert (=> b!1099627 (= c!108892 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099628 () Bool)

(declare-fun e!627707 () Unit!36111)

(declare-fun Unit!36117 () Unit!36111)

(assert (=> b!1099628 (= e!627707 Unit!36117)))

(declare-fun b!1099629 () Bool)

(declare-fun e!627711 () ListLongMap!15293)

(declare-fun call!45944 () ListLongMap!15293)

(assert (=> b!1099629 (= e!627711 call!45944)))

(declare-fun b!1099630 () Bool)

(declare-fun res!733517 () Bool)

(assert (=> b!1099630 (=> (not res!733517) (not e!627702))))

(declare-fun e!627709 () Bool)

(assert (=> b!1099630 (= res!733517 e!627709)))

(declare-fun res!733512 () Bool)

(assert (=> b!1099630 (=> res!733512 e!627709)))

(assert (=> b!1099630 (= res!733512 (not e!627703))))

(declare-fun res!733518 () Bool)

(assert (=> b!1099630 (=> (not res!733518) (not e!627703))))

(assert (=> b!1099630 (= res!733518 (bvslt #b00000000000000000000000000000000 (size!34806 _keys!1070)))))

(declare-fun bm!45941 () Bool)

(assert (=> bm!45941 (= call!45946 (contains!6407 lt!491769 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099631 () Bool)

(declare-fun e!627710 () ListLongMap!15293)

(declare-fun call!45948 () ListLongMap!15293)

(assert (=> b!1099631 (= e!627710 call!45948)))

(declare-fun b!1099632 () Bool)

(assert (=> b!1099632 (= e!627704 (= (apply!954 lt!491769 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1099633 () Bool)

(declare-fun e!627706 () ListLongMap!15293)

(declare-fun call!45947 () ListLongMap!15293)

(assert (=> b!1099633 (= e!627706 (+!3396 call!45947 (tuple2!17317 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!45942 () Bool)

(declare-fun call!45945 () ListLongMap!15293)

(assert (=> bm!45942 (= call!45944 call!45945)))

(declare-fun b!1099634 () Bool)

(declare-fun res!733520 () Bool)

(assert (=> b!1099634 (=> (not res!733520) (not e!627702))))

(assert (=> b!1099634 (= res!733520 e!627708)))

(declare-fun c!108891 () Bool)

(assert (=> b!1099634 (= c!108891 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45943 () Bool)

(assert (=> bm!45943 (= call!45945 call!45943)))

(declare-fun c!108887 () Bool)

(declare-fun c!108889 () Bool)

(declare-fun bm!45944 () Bool)

(assert (=> bm!45944 (= call!45947 (+!3396 (ite c!108887 call!45943 (ite c!108889 call!45945 call!45944)) (ite (or c!108887 c!108889) (tuple2!17317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17317 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!45945 () Bool)

(assert (=> bm!45945 (= call!45948 call!45947)))

(declare-fun b!1099635 () Bool)

(declare-fun lt!491779 () Unit!36111)

(assert (=> b!1099635 (= e!627707 lt!491779)))

(declare-fun lt!491767 () ListLongMap!15293)

(assert (=> b!1099635 (= lt!491767 (getCurrentListMapNoExtraKeys!4213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491765 () (_ BitVec 64))

(assert (=> b!1099635 (= lt!491765 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491773 () (_ BitVec 64))

(assert (=> b!1099635 (= lt!491773 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491771 () Unit!36111)

(declare-fun addStillContains!658 (ListLongMap!15293 (_ BitVec 64) V!41305 (_ BitVec 64)) Unit!36111)

(assert (=> b!1099635 (= lt!491771 (addStillContains!658 lt!491767 lt!491765 zeroValue!831 lt!491773))))

(assert (=> b!1099635 (contains!6407 (+!3396 lt!491767 (tuple2!17317 lt!491765 zeroValue!831)) lt!491773)))

(declare-fun lt!491775 () Unit!36111)

(assert (=> b!1099635 (= lt!491775 lt!491771)))

(declare-fun lt!491772 () ListLongMap!15293)

(assert (=> b!1099635 (= lt!491772 (getCurrentListMapNoExtraKeys!4213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491768 () (_ BitVec 64))

(assert (=> b!1099635 (= lt!491768 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491780 () (_ BitVec 64))

(assert (=> b!1099635 (= lt!491780 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491770 () Unit!36111)

(declare-fun addApplyDifferent!514 (ListLongMap!15293 (_ BitVec 64) V!41305 (_ BitVec 64)) Unit!36111)

(assert (=> b!1099635 (= lt!491770 (addApplyDifferent!514 lt!491772 lt!491768 minValue!831 lt!491780))))

(assert (=> b!1099635 (= (apply!954 (+!3396 lt!491772 (tuple2!17317 lt!491768 minValue!831)) lt!491780) (apply!954 lt!491772 lt!491780))))

(declare-fun lt!491759 () Unit!36111)

(assert (=> b!1099635 (= lt!491759 lt!491770)))

(declare-fun lt!491777 () ListLongMap!15293)

(assert (=> b!1099635 (= lt!491777 (getCurrentListMapNoExtraKeys!4213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491764 () (_ BitVec 64))

(assert (=> b!1099635 (= lt!491764 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491763 () (_ BitVec 64))

(assert (=> b!1099635 (= lt!491763 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491760 () Unit!36111)

(assert (=> b!1099635 (= lt!491760 (addApplyDifferent!514 lt!491777 lt!491764 zeroValue!831 lt!491763))))

(assert (=> b!1099635 (= (apply!954 (+!3396 lt!491777 (tuple2!17317 lt!491764 zeroValue!831)) lt!491763) (apply!954 lt!491777 lt!491763))))

(declare-fun lt!491776 () Unit!36111)

(assert (=> b!1099635 (= lt!491776 lt!491760)))

(declare-fun lt!491766 () ListLongMap!15293)

(assert (=> b!1099635 (= lt!491766 (getCurrentListMapNoExtraKeys!4213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491762 () (_ BitVec 64))

(assert (=> b!1099635 (= lt!491762 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491778 () (_ BitVec 64))

(assert (=> b!1099635 (= lt!491778 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1099635 (= lt!491779 (addApplyDifferent!514 lt!491766 lt!491762 minValue!831 lt!491778))))

(assert (=> b!1099635 (= (apply!954 (+!3396 lt!491766 (tuple2!17317 lt!491762 minValue!831)) lt!491778) (apply!954 lt!491766 lt!491778))))

(declare-fun b!1099636 () Bool)

(assert (=> b!1099636 (= e!627709 e!627705)))

(declare-fun res!733519 () Bool)

(assert (=> b!1099636 (=> (not res!733519) (not e!627705))))

(assert (=> b!1099636 (= res!733519 (contains!6407 lt!491769 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099636 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34806 _keys!1070)))))

(declare-fun b!1099637 () Bool)

(assert (=> b!1099637 (= e!627706 e!627710)))

(assert (=> b!1099637 (= c!108889 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099638 () Bool)

(assert (=> b!1099638 (= e!627711 call!45948)))

(declare-fun b!1099639 () Bool)

(assert (=> b!1099639 (= e!627708 (not call!45942))))

(declare-fun b!1099640 () Bool)

(declare-fun e!627713 () Bool)

(assert (=> b!1099640 (= e!627713 (validKeyInArray!0 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130853 () Bool)

(assert (=> d!130853 e!627702))

(declare-fun res!733515 () Bool)

(assert (=> d!130853 (=> (not res!733515) (not e!627702))))

(assert (=> d!130853 (= res!733515 (or (bvsge #b00000000000000000000000000000000 (size!34806 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34806 _keys!1070)))))))

(declare-fun lt!491774 () ListLongMap!15293)

(assert (=> d!130853 (= lt!491769 lt!491774)))

(declare-fun lt!491761 () Unit!36111)

(assert (=> d!130853 (= lt!491761 e!627707)))

(declare-fun c!108888 () Bool)

(assert (=> d!130853 (= c!108888 e!627713)))

(declare-fun res!733514 () Bool)

(assert (=> d!130853 (=> (not res!733514) (not e!627713))))

(assert (=> d!130853 (= res!733514 (bvslt #b00000000000000000000000000000000 (size!34806 _keys!1070)))))

(assert (=> d!130853 (= lt!491774 e!627706)))

(assert (=> d!130853 (= c!108887 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130853 (validMask!0 mask!1414)))

(assert (=> d!130853 (= (getCurrentListMap!4372 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491769)))

(declare-fun b!1099626 () Bool)

(declare-fun c!108890 () Bool)

(assert (=> b!1099626 (= c!108890 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1099626 (= e!627710 e!627711)))

(assert (= (and d!130853 c!108887) b!1099633))

(assert (= (and d!130853 (not c!108887)) b!1099637))

(assert (= (and b!1099637 c!108889) b!1099631))

(assert (= (and b!1099637 (not c!108889)) b!1099626))

(assert (= (and b!1099626 c!108890) b!1099638))

(assert (= (and b!1099626 (not c!108890)) b!1099629))

(assert (= (or b!1099638 b!1099629) bm!45942))

(assert (= (or b!1099631 bm!45942) bm!45943))

(assert (= (or b!1099631 b!1099638) bm!45945))

(assert (= (or b!1099633 bm!45943) bm!45939))

(assert (= (or b!1099633 bm!45945) bm!45944))

(assert (= (and d!130853 res!733514) b!1099640))

(assert (= (and d!130853 c!108888) b!1099635))

(assert (= (and d!130853 (not c!108888)) b!1099628))

(assert (= (and d!130853 res!733515) b!1099630))

(assert (= (and b!1099630 res!733518) b!1099625))

(assert (= (and b!1099630 (not res!733512)) b!1099636))

(assert (= (and b!1099636 res!733519) b!1099621))

(assert (= (and b!1099630 res!733517) b!1099634))

(assert (= (and b!1099634 c!108891) b!1099620))

(assert (= (and b!1099634 (not c!108891)) b!1099639))

(assert (= (and b!1099620 res!733516) b!1099632))

(assert (= (or b!1099620 b!1099639) bm!45940))

(assert (= (and b!1099634 res!733520) b!1099627))

(assert (= (and b!1099627 c!108892) b!1099622))

(assert (= (and b!1099627 (not c!108892)) b!1099624))

(assert (= (and b!1099622 res!733513) b!1099623))

(assert (= (or b!1099622 b!1099624) bm!45941))

(declare-fun b_lambda!17819 () Bool)

(assert (=> (not b_lambda!17819) (not b!1099621)))

(assert (=> b!1099621 t!34059))

(declare-fun b_and!36879 () Bool)

(assert (= b_and!36869 (and (=> t!34059 result!16417) b_and!36879)))

(assert (=> b!1099625 m!1019539))

(assert (=> b!1099625 m!1019539))

(assert (=> b!1099625 m!1019549))

(declare-fun m!1019601 () Bool)

(assert (=> bm!45940 m!1019601))

(assert (=> d!130853 m!1019397))

(assert (=> b!1099636 m!1019539))

(assert (=> b!1099636 m!1019539))

(declare-fun m!1019603 () Bool)

(assert (=> b!1099636 m!1019603))

(declare-fun m!1019605 () Bool)

(assert (=> b!1099623 m!1019605))

(assert (=> b!1099640 m!1019539))

(assert (=> b!1099640 m!1019539))

(assert (=> b!1099640 m!1019549))

(declare-fun m!1019607 () Bool)

(assert (=> b!1099621 m!1019607))

(assert (=> b!1099621 m!1019367))

(declare-fun m!1019609 () Bool)

(assert (=> b!1099621 m!1019609))

(assert (=> b!1099621 m!1019607))

(assert (=> b!1099621 m!1019539))

(assert (=> b!1099621 m!1019539))

(declare-fun m!1019611 () Bool)

(assert (=> b!1099621 m!1019611))

(assert (=> b!1099621 m!1019367))

(declare-fun m!1019613 () Bool)

(assert (=> b!1099633 m!1019613))

(declare-fun m!1019615 () Bool)

(assert (=> b!1099632 m!1019615))

(declare-fun m!1019617 () Bool)

(assert (=> b!1099635 m!1019617))

(declare-fun m!1019619 () Bool)

(assert (=> b!1099635 m!1019619))

(assert (=> b!1099635 m!1019617))

(declare-fun m!1019621 () Bool)

(assert (=> b!1099635 m!1019621))

(declare-fun m!1019623 () Bool)

(assert (=> b!1099635 m!1019623))

(declare-fun m!1019625 () Bool)

(assert (=> b!1099635 m!1019625))

(declare-fun m!1019627 () Bool)

(assert (=> b!1099635 m!1019627))

(assert (=> b!1099635 m!1019539))

(declare-fun m!1019629 () Bool)

(assert (=> b!1099635 m!1019629))

(assert (=> b!1099635 m!1019377))

(declare-fun m!1019631 () Bool)

(assert (=> b!1099635 m!1019631))

(declare-fun m!1019633 () Bool)

(assert (=> b!1099635 m!1019633))

(declare-fun m!1019635 () Bool)

(assert (=> b!1099635 m!1019635))

(assert (=> b!1099635 m!1019623))

(declare-fun m!1019637 () Bool)

(assert (=> b!1099635 m!1019637))

(declare-fun m!1019639 () Bool)

(assert (=> b!1099635 m!1019639))

(declare-fun m!1019641 () Bool)

(assert (=> b!1099635 m!1019641))

(assert (=> b!1099635 m!1019631))

(declare-fun m!1019643 () Bool)

(assert (=> b!1099635 m!1019643))

(declare-fun m!1019645 () Bool)

(assert (=> b!1099635 m!1019645))

(assert (=> b!1099635 m!1019637))

(declare-fun m!1019647 () Bool)

(assert (=> bm!45944 m!1019647))

(declare-fun m!1019649 () Bool)

(assert (=> bm!45941 m!1019649))

(assert (=> bm!45939 m!1019377))

(assert (=> b!1099443 d!130853))

(declare-fun d!130855 () Bool)

(declare-fun e!627719 () Bool)

(assert (=> d!130855 e!627719))

(declare-fun res!733523 () Bool)

(assert (=> d!130855 (=> (not res!733523) (not e!627719))))

(assert (=> d!130855 (= res!733523 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34806 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34806 _keys!1070))))))))

(declare-fun lt!491783 () Unit!36111)

(declare-fun choose!1768 (array!71211 array!71213 (_ BitVec 32) (_ BitVec 32) V!41305 V!41305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36111)

(assert (=> d!130855 (= lt!491783 (choose!1768 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130855 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34806 _keys!1070)))))

(assert (=> d!130855 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!206 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!491783)))

(declare-fun call!45953 () ListLongMap!15293)

(declare-fun bm!45950 () Bool)

(assert (=> bm!45950 (= call!45953 (getCurrentListMapNoExtraKeys!4213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099647 () Bool)

(declare-fun call!45954 () ListLongMap!15293)

(declare-fun e!627718 () Bool)

(assert (=> b!1099647 (= e!627718 (= call!45954 (-!934 call!45953 k0!904)))))

(assert (=> b!1099647 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34807 _values!874)))))

(declare-fun b!1099648 () Bool)

(assert (=> b!1099648 (= e!627719 e!627718)))

(declare-fun c!108895 () Bool)

(assert (=> b!1099648 (= c!108895 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun b!1099649 () Bool)

(assert (=> b!1099649 (= e!627718 (= call!45954 call!45953))))

(assert (=> b!1099649 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34807 _values!874)))))

(declare-fun bm!45951 () Bool)

(assert (=> bm!45951 (= call!45954 (getCurrentListMapNoExtraKeys!4213 (array!71212 (store (arr!34269 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34806 _keys!1070)) (array!71214 (store (arr!34270 _values!874) i!650 (ValueCellFull!12857 (dynLambda!2331 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34807 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (= (and d!130855 res!733523) b!1099648))

(assert (= (and b!1099648 c!108895) b!1099647))

(assert (= (and b!1099648 (not c!108895)) b!1099649))

(assert (= (or b!1099647 b!1099649) bm!45950))

(assert (= (or b!1099647 b!1099649) bm!45951))

(declare-fun b_lambda!17821 () Bool)

(assert (=> (not b_lambda!17821) (not bm!45951)))

(assert (=> bm!45951 t!34059))

(declare-fun b_and!36881 () Bool)

(assert (= b_and!36879 (and (=> t!34059 result!16417) b_and!36881)))

(declare-fun m!1019651 () Bool)

(assert (=> d!130855 m!1019651))

(assert (=> bm!45950 m!1019377))

(declare-fun m!1019653 () Bool)

(assert (=> b!1099647 m!1019653))

(assert (=> bm!45951 m!1019405))

(assert (=> bm!45951 m!1019367))

(assert (=> bm!45951 m!1019369))

(declare-fun m!1019655 () Bool)

(assert (=> bm!45951 m!1019655))

(assert (=> b!1099443 d!130855))

(declare-fun call!45956 () ListLongMap!15293)

(declare-fun bm!45952 () Bool)

(assert (=> bm!45952 (= call!45956 (getCurrentListMapNoExtraKeys!4213 lt!491606 lt!491608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1099650 () Bool)

(declare-fun e!627727 () Bool)

(declare-fun e!627723 () Bool)

(assert (=> b!1099650 (= e!627727 e!627723)))

(declare-fun res!733528 () Bool)

(declare-fun call!45955 () Bool)

(assert (=> b!1099650 (= res!733528 call!45955)))

(assert (=> b!1099650 (=> (not res!733528) (not e!627723))))

(declare-fun e!627724 () Bool)

(declare-fun lt!491794 () ListLongMap!15293)

(declare-fun b!1099651 () Bool)

(assert (=> b!1099651 (= e!627724 (= (apply!954 lt!491794 (select (arr!34269 lt!491606) #b00000000000000000000000000000000)) (get!17648 (select (arr!34270 lt!491608) #b00000000000000000000000000000000) (dynLambda!2331 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34807 lt!491608)))))

(assert (=> b!1099651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34806 lt!491606)))))

(declare-fun b!1099652 () Bool)

(declare-fun e!627720 () Bool)

(declare-fun e!627731 () Bool)

(assert (=> b!1099652 (= e!627720 e!627731)))

(declare-fun res!733525 () Bool)

(declare-fun call!45959 () Bool)

(assert (=> b!1099652 (= res!733525 call!45959)))

(assert (=> b!1099652 (=> (not res!733525) (not e!627731))))

(declare-fun b!1099653 () Bool)

(assert (=> b!1099653 (= e!627731 (= (apply!954 lt!491794 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1099654 () Bool)

(assert (=> b!1099654 (= e!627720 (not call!45959))))

(declare-fun b!1099655 () Bool)

(declare-fun e!627722 () Bool)

(assert (=> b!1099655 (= e!627722 (validKeyInArray!0 (select (arr!34269 lt!491606) #b00000000000000000000000000000000)))))

(declare-fun bm!45953 () Bool)

(assert (=> bm!45953 (= call!45955 (contains!6407 lt!491794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099657 () Bool)

(declare-fun e!627721 () Bool)

(assert (=> b!1099657 (= e!627721 e!627720)))

(declare-fun c!108901 () Bool)

(assert (=> b!1099657 (= c!108901 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099658 () Bool)

(declare-fun e!627726 () Unit!36111)

(declare-fun Unit!36118 () Unit!36111)

(assert (=> b!1099658 (= e!627726 Unit!36118)))

(declare-fun b!1099659 () Bool)

(declare-fun e!627730 () ListLongMap!15293)

(declare-fun call!45957 () ListLongMap!15293)

(assert (=> b!1099659 (= e!627730 call!45957)))

(declare-fun b!1099660 () Bool)

(declare-fun res!733529 () Bool)

(assert (=> b!1099660 (=> (not res!733529) (not e!627721))))

(declare-fun e!627728 () Bool)

(assert (=> b!1099660 (= res!733529 e!627728)))

(declare-fun res!733524 () Bool)

(assert (=> b!1099660 (=> res!733524 e!627728)))

(assert (=> b!1099660 (= res!733524 (not e!627722))))

(declare-fun res!733530 () Bool)

(assert (=> b!1099660 (=> (not res!733530) (not e!627722))))

(assert (=> b!1099660 (= res!733530 (bvslt #b00000000000000000000000000000000 (size!34806 lt!491606)))))

(declare-fun bm!45954 () Bool)

(assert (=> bm!45954 (= call!45959 (contains!6407 lt!491794 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1099661 () Bool)

(declare-fun e!627729 () ListLongMap!15293)

(declare-fun call!45961 () ListLongMap!15293)

(assert (=> b!1099661 (= e!627729 call!45961)))

(declare-fun b!1099662 () Bool)

(assert (=> b!1099662 (= e!627723 (= (apply!954 lt!491794 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1099663 () Bool)

(declare-fun e!627725 () ListLongMap!15293)

(declare-fun call!45960 () ListLongMap!15293)

(assert (=> b!1099663 (= e!627725 (+!3396 call!45960 (tuple2!17317 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!45955 () Bool)

(declare-fun call!45958 () ListLongMap!15293)

(assert (=> bm!45955 (= call!45957 call!45958)))

(declare-fun b!1099664 () Bool)

(declare-fun res!733532 () Bool)

(assert (=> b!1099664 (=> (not res!733532) (not e!627721))))

(assert (=> b!1099664 (= res!733532 e!627727)))

(declare-fun c!108900 () Bool)

(assert (=> b!1099664 (= c!108900 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45956 () Bool)

(assert (=> bm!45956 (= call!45958 call!45956)))

(declare-fun bm!45957 () Bool)

(declare-fun c!108898 () Bool)

(declare-fun c!108896 () Bool)

(assert (=> bm!45957 (= call!45960 (+!3396 (ite c!108896 call!45956 (ite c!108898 call!45958 call!45957)) (ite (or c!108896 c!108898) (tuple2!17317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17317 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!45958 () Bool)

(assert (=> bm!45958 (= call!45961 call!45960)))

(declare-fun b!1099665 () Bool)

(declare-fun lt!491804 () Unit!36111)

(assert (=> b!1099665 (= e!627726 lt!491804)))

(declare-fun lt!491792 () ListLongMap!15293)

(assert (=> b!1099665 (= lt!491792 (getCurrentListMapNoExtraKeys!4213 lt!491606 lt!491608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491790 () (_ BitVec 64))

(assert (=> b!1099665 (= lt!491790 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491798 () (_ BitVec 64))

(assert (=> b!1099665 (= lt!491798 (select (arr!34269 lt!491606) #b00000000000000000000000000000000))))

(declare-fun lt!491796 () Unit!36111)

(assert (=> b!1099665 (= lt!491796 (addStillContains!658 lt!491792 lt!491790 zeroValue!831 lt!491798))))

(assert (=> b!1099665 (contains!6407 (+!3396 lt!491792 (tuple2!17317 lt!491790 zeroValue!831)) lt!491798)))

(declare-fun lt!491800 () Unit!36111)

(assert (=> b!1099665 (= lt!491800 lt!491796)))

(declare-fun lt!491797 () ListLongMap!15293)

(assert (=> b!1099665 (= lt!491797 (getCurrentListMapNoExtraKeys!4213 lt!491606 lt!491608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491793 () (_ BitVec 64))

(assert (=> b!1099665 (= lt!491793 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491805 () (_ BitVec 64))

(assert (=> b!1099665 (= lt!491805 (select (arr!34269 lt!491606) #b00000000000000000000000000000000))))

(declare-fun lt!491795 () Unit!36111)

(assert (=> b!1099665 (= lt!491795 (addApplyDifferent!514 lt!491797 lt!491793 minValue!831 lt!491805))))

(assert (=> b!1099665 (= (apply!954 (+!3396 lt!491797 (tuple2!17317 lt!491793 minValue!831)) lt!491805) (apply!954 lt!491797 lt!491805))))

(declare-fun lt!491784 () Unit!36111)

(assert (=> b!1099665 (= lt!491784 lt!491795)))

(declare-fun lt!491802 () ListLongMap!15293)

(assert (=> b!1099665 (= lt!491802 (getCurrentListMapNoExtraKeys!4213 lt!491606 lt!491608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491789 () (_ BitVec 64))

(assert (=> b!1099665 (= lt!491789 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491788 () (_ BitVec 64))

(assert (=> b!1099665 (= lt!491788 (select (arr!34269 lt!491606) #b00000000000000000000000000000000))))

(declare-fun lt!491785 () Unit!36111)

(assert (=> b!1099665 (= lt!491785 (addApplyDifferent!514 lt!491802 lt!491789 zeroValue!831 lt!491788))))

(assert (=> b!1099665 (= (apply!954 (+!3396 lt!491802 (tuple2!17317 lt!491789 zeroValue!831)) lt!491788) (apply!954 lt!491802 lt!491788))))

(declare-fun lt!491801 () Unit!36111)

(assert (=> b!1099665 (= lt!491801 lt!491785)))

(declare-fun lt!491791 () ListLongMap!15293)

(assert (=> b!1099665 (= lt!491791 (getCurrentListMapNoExtraKeys!4213 lt!491606 lt!491608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491787 () (_ BitVec 64))

(assert (=> b!1099665 (= lt!491787 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491803 () (_ BitVec 64))

(assert (=> b!1099665 (= lt!491803 (select (arr!34269 lt!491606) #b00000000000000000000000000000000))))

(assert (=> b!1099665 (= lt!491804 (addApplyDifferent!514 lt!491791 lt!491787 minValue!831 lt!491803))))

(assert (=> b!1099665 (= (apply!954 (+!3396 lt!491791 (tuple2!17317 lt!491787 minValue!831)) lt!491803) (apply!954 lt!491791 lt!491803))))

(declare-fun b!1099666 () Bool)

(assert (=> b!1099666 (= e!627728 e!627724)))

(declare-fun res!733531 () Bool)

(assert (=> b!1099666 (=> (not res!733531) (not e!627724))))

(assert (=> b!1099666 (= res!733531 (contains!6407 lt!491794 (select (arr!34269 lt!491606) #b00000000000000000000000000000000)))))

(assert (=> b!1099666 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34806 lt!491606)))))

(declare-fun b!1099667 () Bool)

(assert (=> b!1099667 (= e!627725 e!627729)))

(assert (=> b!1099667 (= c!108898 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1099668 () Bool)

(assert (=> b!1099668 (= e!627730 call!45961)))

(declare-fun b!1099669 () Bool)

(assert (=> b!1099669 (= e!627727 (not call!45955))))

(declare-fun b!1099670 () Bool)

(declare-fun e!627732 () Bool)

(assert (=> b!1099670 (= e!627732 (validKeyInArray!0 (select (arr!34269 lt!491606) #b00000000000000000000000000000000)))))

(declare-fun d!130857 () Bool)

(assert (=> d!130857 e!627721))

(declare-fun res!733527 () Bool)

(assert (=> d!130857 (=> (not res!733527) (not e!627721))))

(assert (=> d!130857 (= res!733527 (or (bvsge #b00000000000000000000000000000000 (size!34806 lt!491606)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34806 lt!491606)))))))

(declare-fun lt!491799 () ListLongMap!15293)

(assert (=> d!130857 (= lt!491794 lt!491799)))

(declare-fun lt!491786 () Unit!36111)

(assert (=> d!130857 (= lt!491786 e!627726)))

(declare-fun c!108897 () Bool)

(assert (=> d!130857 (= c!108897 e!627732)))

(declare-fun res!733526 () Bool)

(assert (=> d!130857 (=> (not res!733526) (not e!627732))))

(assert (=> d!130857 (= res!733526 (bvslt #b00000000000000000000000000000000 (size!34806 lt!491606)))))

(assert (=> d!130857 (= lt!491799 e!627725)))

(assert (=> d!130857 (= c!108896 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130857 (validMask!0 mask!1414)))

(assert (=> d!130857 (= (getCurrentListMap!4372 lt!491606 lt!491608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491794)))

(declare-fun b!1099656 () Bool)

(declare-fun c!108899 () Bool)

(assert (=> b!1099656 (= c!108899 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1099656 (= e!627729 e!627730)))

(assert (= (and d!130857 c!108896) b!1099663))

(assert (= (and d!130857 (not c!108896)) b!1099667))

(assert (= (and b!1099667 c!108898) b!1099661))

(assert (= (and b!1099667 (not c!108898)) b!1099656))

(assert (= (and b!1099656 c!108899) b!1099668))

(assert (= (and b!1099656 (not c!108899)) b!1099659))

(assert (= (or b!1099668 b!1099659) bm!45955))

(assert (= (or b!1099661 bm!45955) bm!45956))

(assert (= (or b!1099661 b!1099668) bm!45958))

(assert (= (or b!1099663 bm!45956) bm!45952))

(assert (= (or b!1099663 bm!45958) bm!45957))

(assert (= (and d!130857 res!733526) b!1099670))

(assert (= (and d!130857 c!108897) b!1099665))

(assert (= (and d!130857 (not c!108897)) b!1099658))

(assert (= (and d!130857 res!733527) b!1099660))

(assert (= (and b!1099660 res!733530) b!1099655))

(assert (= (and b!1099660 (not res!733524)) b!1099666))

(assert (= (and b!1099666 res!733531) b!1099651))

(assert (= (and b!1099660 res!733529) b!1099664))

(assert (= (and b!1099664 c!108900) b!1099650))

(assert (= (and b!1099664 (not c!108900)) b!1099669))

(assert (= (and b!1099650 res!733528) b!1099662))

(assert (= (or b!1099650 b!1099669) bm!45953))

(assert (= (and b!1099664 res!733532) b!1099657))

(assert (= (and b!1099657 c!108901) b!1099652))

(assert (= (and b!1099657 (not c!108901)) b!1099654))

(assert (= (and b!1099652 res!733525) b!1099653))

(assert (= (or b!1099652 b!1099654) bm!45954))

(declare-fun b_lambda!17823 () Bool)

(assert (=> (not b_lambda!17823) (not b!1099651)))

(assert (=> b!1099651 t!34059))

(declare-fun b_and!36883 () Bool)

(assert (= b_and!36881 (and (=> t!34059 result!16417) b_and!36883)))

(assert (=> b!1099655 m!1019527))

(assert (=> b!1099655 m!1019527))

(assert (=> b!1099655 m!1019537))

(declare-fun m!1019657 () Bool)

(assert (=> bm!45953 m!1019657))

(assert (=> d!130857 m!1019397))

(assert (=> b!1099666 m!1019527))

(assert (=> b!1099666 m!1019527))

(declare-fun m!1019659 () Bool)

(assert (=> b!1099666 m!1019659))

(declare-fun m!1019661 () Bool)

(assert (=> b!1099653 m!1019661))

(assert (=> b!1099670 m!1019527))

(assert (=> b!1099670 m!1019527))

(assert (=> b!1099670 m!1019537))

(declare-fun m!1019663 () Bool)

(assert (=> b!1099651 m!1019663))

(assert (=> b!1099651 m!1019367))

(declare-fun m!1019665 () Bool)

(assert (=> b!1099651 m!1019665))

(assert (=> b!1099651 m!1019663))

(assert (=> b!1099651 m!1019527))

(assert (=> b!1099651 m!1019527))

(declare-fun m!1019667 () Bool)

(assert (=> b!1099651 m!1019667))

(assert (=> b!1099651 m!1019367))

(declare-fun m!1019669 () Bool)

(assert (=> b!1099663 m!1019669))

(declare-fun m!1019671 () Bool)

(assert (=> b!1099662 m!1019671))

(declare-fun m!1019673 () Bool)

(assert (=> b!1099665 m!1019673))

(declare-fun m!1019675 () Bool)

(assert (=> b!1099665 m!1019675))

(assert (=> b!1099665 m!1019673))

(declare-fun m!1019677 () Bool)

(assert (=> b!1099665 m!1019677))

(declare-fun m!1019679 () Bool)

(assert (=> b!1099665 m!1019679))

(declare-fun m!1019681 () Bool)

(assert (=> b!1099665 m!1019681))

(declare-fun m!1019683 () Bool)

(assert (=> b!1099665 m!1019683))

(assert (=> b!1099665 m!1019527))

(declare-fun m!1019685 () Bool)

(assert (=> b!1099665 m!1019685))

(assert (=> b!1099665 m!1019381))

(declare-fun m!1019687 () Bool)

(assert (=> b!1099665 m!1019687))

(declare-fun m!1019689 () Bool)

(assert (=> b!1099665 m!1019689))

(declare-fun m!1019691 () Bool)

(assert (=> b!1099665 m!1019691))

(assert (=> b!1099665 m!1019679))

(declare-fun m!1019693 () Bool)

(assert (=> b!1099665 m!1019693))

(declare-fun m!1019695 () Bool)

(assert (=> b!1099665 m!1019695))

(declare-fun m!1019697 () Bool)

(assert (=> b!1099665 m!1019697))

(assert (=> b!1099665 m!1019687))

(declare-fun m!1019699 () Bool)

(assert (=> b!1099665 m!1019699))

(declare-fun m!1019701 () Bool)

(assert (=> b!1099665 m!1019701))

(assert (=> b!1099665 m!1019693))

(declare-fun m!1019703 () Bool)

(assert (=> bm!45957 m!1019703))

(declare-fun m!1019705 () Bool)

(assert (=> bm!45954 m!1019705))

(assert (=> bm!45952 m!1019381))

(assert (=> b!1099443 d!130857))

(declare-fun b!1099695 () Bool)

(declare-fun res!733543 () Bool)

(declare-fun e!627751 () Bool)

(assert (=> b!1099695 (=> (not res!733543) (not e!627751))))

(declare-fun lt!491822 () ListLongMap!15293)

(assert (=> b!1099695 (= res!733543 (not (contains!6407 lt!491822 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1099696 () Bool)

(declare-fun e!627748 () Bool)

(declare-fun isEmpty!967 (ListLongMap!15293) Bool)

(assert (=> b!1099696 (= e!627748 (isEmpty!967 lt!491822))))

(declare-fun d!130859 () Bool)

(assert (=> d!130859 e!627751))

(declare-fun res!733541 () Bool)

(assert (=> d!130859 (=> (not res!733541) (not e!627751))))

(assert (=> d!130859 (= res!733541 (not (contains!6407 lt!491822 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!627750 () ListLongMap!15293)

(assert (=> d!130859 (= lt!491822 e!627750)))

(declare-fun c!108910 () Bool)

(assert (=> d!130859 (= c!108910 (bvsge #b00000000000000000000000000000000 (size!34806 lt!491606)))))

(assert (=> d!130859 (validMask!0 mask!1414)))

(assert (=> d!130859 (= (getCurrentListMapNoExtraKeys!4213 lt!491606 lt!491608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491822)))

(declare-fun b!1099697 () Bool)

(assert (=> b!1099697 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34806 lt!491606)))))

(assert (=> b!1099697 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34807 lt!491608)))))

(declare-fun e!627747 () Bool)

(assert (=> b!1099697 (= e!627747 (= (apply!954 lt!491822 (select (arr!34269 lt!491606) #b00000000000000000000000000000000)) (get!17648 (select (arr!34270 lt!491608) #b00000000000000000000000000000000) (dynLambda!2331 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1099698 () Bool)

(declare-fun e!627749 () Bool)

(assert (=> b!1099698 (= e!627749 e!627747)))

(assert (=> b!1099698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34806 lt!491606)))))

(declare-fun res!733542 () Bool)

(assert (=> b!1099698 (= res!733542 (contains!6407 lt!491822 (select (arr!34269 lt!491606) #b00000000000000000000000000000000)))))

(assert (=> b!1099698 (=> (not res!733542) (not e!627747))))

(declare-fun b!1099699 () Bool)

(assert (=> b!1099699 (= e!627751 e!627749)))

(declare-fun c!108911 () Bool)

(declare-fun e!627752 () Bool)

(assert (=> b!1099699 (= c!108911 e!627752)))

(declare-fun res!733544 () Bool)

(assert (=> b!1099699 (=> (not res!733544) (not e!627752))))

(assert (=> b!1099699 (= res!733544 (bvslt #b00000000000000000000000000000000 (size!34806 lt!491606)))))

(declare-fun b!1099700 () Bool)

(assert (=> b!1099700 (= e!627749 e!627748)))

(declare-fun c!108912 () Bool)

(assert (=> b!1099700 (= c!108912 (bvslt #b00000000000000000000000000000000 (size!34806 lt!491606)))))

(declare-fun b!1099701 () Bool)

(assert (=> b!1099701 (= e!627748 (= lt!491822 (getCurrentListMapNoExtraKeys!4213 lt!491606 lt!491608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1099702 () Bool)

(declare-fun e!627753 () ListLongMap!15293)

(assert (=> b!1099702 (= e!627750 e!627753)))

(declare-fun c!108913 () Bool)

(assert (=> b!1099702 (= c!108913 (validKeyInArray!0 (select (arr!34269 lt!491606) #b00000000000000000000000000000000)))))

(declare-fun b!1099703 () Bool)

(declare-fun lt!491824 () Unit!36111)

(declare-fun lt!491825 () Unit!36111)

(assert (=> b!1099703 (= lt!491824 lt!491825)))

(declare-fun lt!491820 () (_ BitVec 64))

(declare-fun lt!491823 () V!41305)

(declare-fun lt!491826 () (_ BitVec 64))

(declare-fun lt!491821 () ListLongMap!15293)

(assert (=> b!1099703 (not (contains!6407 (+!3396 lt!491821 (tuple2!17317 lt!491826 lt!491823)) lt!491820))))

(declare-fun addStillNotContains!275 (ListLongMap!15293 (_ BitVec 64) V!41305 (_ BitVec 64)) Unit!36111)

(assert (=> b!1099703 (= lt!491825 (addStillNotContains!275 lt!491821 lt!491826 lt!491823 lt!491820))))

(assert (=> b!1099703 (= lt!491820 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099703 (= lt!491823 (get!17648 (select (arr!34270 lt!491608) #b00000000000000000000000000000000) (dynLambda!2331 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099703 (= lt!491826 (select (arr!34269 lt!491606) #b00000000000000000000000000000000))))

(declare-fun call!45964 () ListLongMap!15293)

(assert (=> b!1099703 (= lt!491821 call!45964)))

(assert (=> b!1099703 (= e!627753 (+!3396 call!45964 (tuple2!17317 (select (arr!34269 lt!491606) #b00000000000000000000000000000000) (get!17648 (select (arr!34270 lt!491608) #b00000000000000000000000000000000) (dynLambda!2331 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1099704 () Bool)

(assert (=> b!1099704 (= e!627750 (ListLongMap!15294 Nil!23936))))

(declare-fun bm!45961 () Bool)

(assert (=> bm!45961 (= call!45964 (getCurrentListMapNoExtraKeys!4213 lt!491606 lt!491608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099705 () Bool)

(assert (=> b!1099705 (= e!627753 call!45964)))

(declare-fun b!1099706 () Bool)

(assert (=> b!1099706 (= e!627752 (validKeyInArray!0 (select (arr!34269 lt!491606) #b00000000000000000000000000000000)))))

(assert (=> b!1099706 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!130859 c!108910) b!1099704))

(assert (= (and d!130859 (not c!108910)) b!1099702))

(assert (= (and b!1099702 c!108913) b!1099703))

(assert (= (and b!1099702 (not c!108913)) b!1099705))

(assert (= (or b!1099703 b!1099705) bm!45961))

(assert (= (and d!130859 res!733541) b!1099695))

(assert (= (and b!1099695 res!733543) b!1099699))

(assert (= (and b!1099699 res!733544) b!1099706))

(assert (= (and b!1099699 c!108911) b!1099698))

(assert (= (and b!1099699 (not c!108911)) b!1099700))

(assert (= (and b!1099698 res!733542) b!1099697))

(assert (= (and b!1099700 c!108912) b!1099701))

(assert (= (and b!1099700 (not c!108912)) b!1099696))

(declare-fun b_lambda!17825 () Bool)

(assert (=> (not b_lambda!17825) (not b!1099697)))

(assert (=> b!1099697 t!34059))

(declare-fun b_and!36885 () Bool)

(assert (= b_and!36883 (and (=> t!34059 result!16417) b_and!36885)))

(declare-fun b_lambda!17827 () Bool)

(assert (=> (not b_lambda!17827) (not b!1099703)))

(assert (=> b!1099703 t!34059))

(declare-fun b_and!36887 () Bool)

(assert (= b_and!36885 (and (=> t!34059 result!16417) b_and!36887)))

(declare-fun m!1019707 () Bool)

(assert (=> b!1099703 m!1019707))

(assert (=> b!1099703 m!1019663))

(assert (=> b!1099703 m!1019367))

(assert (=> b!1099703 m!1019665))

(assert (=> b!1099703 m!1019367))

(declare-fun m!1019709 () Bool)

(assert (=> b!1099703 m!1019709))

(assert (=> b!1099703 m!1019527))

(declare-fun m!1019711 () Bool)

(assert (=> b!1099703 m!1019711))

(assert (=> b!1099703 m!1019663))

(assert (=> b!1099703 m!1019707))

(declare-fun m!1019713 () Bool)

(assert (=> b!1099703 m!1019713))

(assert (=> b!1099702 m!1019527))

(assert (=> b!1099702 m!1019527))

(assert (=> b!1099702 m!1019537))

(declare-fun m!1019715 () Bool)

(assert (=> d!130859 m!1019715))

(assert (=> d!130859 m!1019397))

(assert (=> b!1099697 m!1019527))

(declare-fun m!1019717 () Bool)

(assert (=> b!1099697 m!1019717))

(assert (=> b!1099697 m!1019663))

(assert (=> b!1099697 m!1019367))

(assert (=> b!1099697 m!1019665))

(assert (=> b!1099697 m!1019367))

(assert (=> b!1099697 m!1019663))

(assert (=> b!1099697 m!1019527))

(declare-fun m!1019719 () Bool)

(assert (=> b!1099696 m!1019719))

(declare-fun m!1019721 () Bool)

(assert (=> b!1099695 m!1019721))

(assert (=> b!1099698 m!1019527))

(assert (=> b!1099698 m!1019527))

(declare-fun m!1019723 () Bool)

(assert (=> b!1099698 m!1019723))

(declare-fun m!1019725 () Bool)

(assert (=> b!1099701 m!1019725))

(assert (=> bm!45961 m!1019725))

(assert (=> b!1099706 m!1019527))

(assert (=> b!1099706 m!1019527))

(assert (=> b!1099706 m!1019537))

(assert (=> b!1099443 d!130859))

(declare-fun d!130861 () Bool)

(declare-fun lt!491829 () ListLongMap!15293)

(assert (=> d!130861 (not (contains!6407 lt!491829 k0!904))))

(declare-fun removeStrictlySorted!78 (List!23939 (_ BitVec 64)) List!23939)

(assert (=> d!130861 (= lt!491829 (ListLongMap!15294 (removeStrictlySorted!78 (toList!7662 lt!491603) k0!904)))))

(assert (=> d!130861 (= (-!934 lt!491603 k0!904) lt!491829)))

(declare-fun bs!32287 () Bool)

(assert (= bs!32287 d!130861))

(declare-fun m!1019727 () Bool)

(assert (=> bs!32287 m!1019727))

(declare-fun m!1019729 () Bool)

(assert (=> bs!32287 m!1019729))

(assert (=> b!1099443 d!130861))

(declare-fun b!1099707 () Bool)

(declare-fun res!733547 () Bool)

(declare-fun e!627758 () Bool)

(assert (=> b!1099707 (=> (not res!733547) (not e!627758))))

(declare-fun lt!491832 () ListLongMap!15293)

(assert (=> b!1099707 (= res!733547 (not (contains!6407 lt!491832 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1099708 () Bool)

(declare-fun e!627755 () Bool)

(assert (=> b!1099708 (= e!627755 (isEmpty!967 lt!491832))))

(declare-fun d!130863 () Bool)

(assert (=> d!130863 e!627758))

(declare-fun res!733545 () Bool)

(assert (=> d!130863 (=> (not res!733545) (not e!627758))))

(assert (=> d!130863 (= res!733545 (not (contains!6407 lt!491832 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!627757 () ListLongMap!15293)

(assert (=> d!130863 (= lt!491832 e!627757)))

(declare-fun c!108914 () Bool)

(assert (=> d!130863 (= c!108914 (bvsge #b00000000000000000000000000000000 (size!34806 _keys!1070)))))

(assert (=> d!130863 (validMask!0 mask!1414)))

(assert (=> d!130863 (= (getCurrentListMapNoExtraKeys!4213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491832)))

(declare-fun b!1099709 () Bool)

(assert (=> b!1099709 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34806 _keys!1070)))))

(assert (=> b!1099709 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34807 _values!874)))))

(declare-fun e!627754 () Bool)

(assert (=> b!1099709 (= e!627754 (= (apply!954 lt!491832 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000)) (get!17648 (select (arr!34270 _values!874) #b00000000000000000000000000000000) (dynLambda!2331 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1099710 () Bool)

(declare-fun e!627756 () Bool)

(assert (=> b!1099710 (= e!627756 e!627754)))

(assert (=> b!1099710 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34806 _keys!1070)))))

(declare-fun res!733546 () Bool)

(assert (=> b!1099710 (= res!733546 (contains!6407 lt!491832 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099710 (=> (not res!733546) (not e!627754))))

(declare-fun b!1099711 () Bool)

(assert (=> b!1099711 (= e!627758 e!627756)))

(declare-fun c!108915 () Bool)

(declare-fun e!627759 () Bool)

(assert (=> b!1099711 (= c!108915 e!627759)))

(declare-fun res!733548 () Bool)

(assert (=> b!1099711 (=> (not res!733548) (not e!627759))))

(assert (=> b!1099711 (= res!733548 (bvslt #b00000000000000000000000000000000 (size!34806 _keys!1070)))))

(declare-fun b!1099712 () Bool)

(assert (=> b!1099712 (= e!627756 e!627755)))

(declare-fun c!108916 () Bool)

(assert (=> b!1099712 (= c!108916 (bvslt #b00000000000000000000000000000000 (size!34806 _keys!1070)))))

(declare-fun b!1099713 () Bool)

(assert (=> b!1099713 (= e!627755 (= lt!491832 (getCurrentListMapNoExtraKeys!4213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1099714 () Bool)

(declare-fun e!627760 () ListLongMap!15293)

(assert (=> b!1099714 (= e!627757 e!627760)))

(declare-fun c!108917 () Bool)

(assert (=> b!1099714 (= c!108917 (validKeyInArray!0 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099715 () Bool)

(declare-fun lt!491834 () Unit!36111)

(declare-fun lt!491835 () Unit!36111)

(assert (=> b!1099715 (= lt!491834 lt!491835)))

(declare-fun lt!491836 () (_ BitVec 64))

(declare-fun lt!491831 () ListLongMap!15293)

(declare-fun lt!491830 () (_ BitVec 64))

(declare-fun lt!491833 () V!41305)

(assert (=> b!1099715 (not (contains!6407 (+!3396 lt!491831 (tuple2!17317 lt!491836 lt!491833)) lt!491830))))

(assert (=> b!1099715 (= lt!491835 (addStillNotContains!275 lt!491831 lt!491836 lt!491833 lt!491830))))

(assert (=> b!1099715 (= lt!491830 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1099715 (= lt!491833 (get!17648 (select (arr!34270 _values!874) #b00000000000000000000000000000000) (dynLambda!2331 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1099715 (= lt!491836 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun call!45965 () ListLongMap!15293)

(assert (=> b!1099715 (= lt!491831 call!45965)))

(assert (=> b!1099715 (= e!627760 (+!3396 call!45965 (tuple2!17317 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000) (get!17648 (select (arr!34270 _values!874) #b00000000000000000000000000000000) (dynLambda!2331 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1099716 () Bool)

(assert (=> b!1099716 (= e!627757 (ListLongMap!15294 Nil!23936))))

(declare-fun bm!45962 () Bool)

(assert (=> bm!45962 (= call!45965 (getCurrentListMapNoExtraKeys!4213 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1099717 () Bool)

(assert (=> b!1099717 (= e!627760 call!45965)))

(declare-fun b!1099718 () Bool)

(assert (=> b!1099718 (= e!627759 (validKeyInArray!0 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1099718 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!130863 c!108914) b!1099716))

(assert (= (and d!130863 (not c!108914)) b!1099714))

(assert (= (and b!1099714 c!108917) b!1099715))

(assert (= (and b!1099714 (not c!108917)) b!1099717))

(assert (= (or b!1099715 b!1099717) bm!45962))

(assert (= (and d!130863 res!733545) b!1099707))

(assert (= (and b!1099707 res!733547) b!1099711))

(assert (= (and b!1099711 res!733548) b!1099718))

(assert (= (and b!1099711 c!108915) b!1099710))

(assert (= (and b!1099711 (not c!108915)) b!1099712))

(assert (= (and b!1099710 res!733546) b!1099709))

(assert (= (and b!1099712 c!108916) b!1099713))

(assert (= (and b!1099712 (not c!108916)) b!1099708))

(declare-fun b_lambda!17829 () Bool)

(assert (=> (not b_lambda!17829) (not b!1099709)))

(assert (=> b!1099709 t!34059))

(declare-fun b_and!36889 () Bool)

(assert (= b_and!36887 (and (=> t!34059 result!16417) b_and!36889)))

(declare-fun b_lambda!17831 () Bool)

(assert (=> (not b_lambda!17831) (not b!1099715)))

(assert (=> b!1099715 t!34059))

(declare-fun b_and!36891 () Bool)

(assert (= b_and!36889 (and (=> t!34059 result!16417) b_and!36891)))

(declare-fun m!1019731 () Bool)

(assert (=> b!1099715 m!1019731))

(assert (=> b!1099715 m!1019607))

(assert (=> b!1099715 m!1019367))

(assert (=> b!1099715 m!1019609))

(assert (=> b!1099715 m!1019367))

(declare-fun m!1019733 () Bool)

(assert (=> b!1099715 m!1019733))

(assert (=> b!1099715 m!1019539))

(declare-fun m!1019735 () Bool)

(assert (=> b!1099715 m!1019735))

(assert (=> b!1099715 m!1019607))

(assert (=> b!1099715 m!1019731))

(declare-fun m!1019737 () Bool)

(assert (=> b!1099715 m!1019737))

(assert (=> b!1099714 m!1019539))

(assert (=> b!1099714 m!1019539))

(assert (=> b!1099714 m!1019549))

(declare-fun m!1019739 () Bool)

(assert (=> d!130863 m!1019739))

(assert (=> d!130863 m!1019397))

(assert (=> b!1099709 m!1019539))

(declare-fun m!1019741 () Bool)

(assert (=> b!1099709 m!1019741))

(assert (=> b!1099709 m!1019607))

(assert (=> b!1099709 m!1019367))

(assert (=> b!1099709 m!1019609))

(assert (=> b!1099709 m!1019367))

(assert (=> b!1099709 m!1019607))

(assert (=> b!1099709 m!1019539))

(declare-fun m!1019743 () Bool)

(assert (=> b!1099708 m!1019743))

(declare-fun m!1019745 () Bool)

(assert (=> b!1099707 m!1019745))

(assert (=> b!1099710 m!1019539))

(assert (=> b!1099710 m!1019539))

(declare-fun m!1019747 () Bool)

(assert (=> b!1099710 m!1019747))

(declare-fun m!1019749 () Bool)

(assert (=> b!1099713 m!1019749))

(assert (=> bm!45962 m!1019749))

(assert (=> b!1099718 m!1019539))

(assert (=> b!1099718 m!1019539))

(assert (=> b!1099718 m!1019549))

(assert (=> b!1099443 d!130863))

(declare-fun d!130865 () Bool)

(assert (=> d!130865 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491839 () Unit!36111)

(declare-fun choose!13 (array!71211 (_ BitVec 64) (_ BitVec 32)) Unit!36111)

(assert (=> d!130865 (= lt!491839 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130865 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130865 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!491839)))

(declare-fun bs!32288 () Bool)

(assert (= bs!32288 d!130865))

(assert (=> bs!32288 m!1019379))

(declare-fun m!1019751 () Bool)

(assert (=> bs!32288 m!1019751))

(assert (=> b!1099443 d!130865))

(declare-fun d!130867 () Bool)

(assert (=> d!130867 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96792 d!130867))

(declare-fun d!130869 () Bool)

(assert (=> d!130869 (= (array_inv!26424 _keys!1070) (bvsge (size!34806 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96792 d!130869))

(declare-fun d!130871 () Bool)

(assert (=> d!130871 (= (array_inv!26425 _values!874) (bvsge (size!34807 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96792 d!130871))

(declare-fun bm!45965 () Bool)

(declare-fun call!45968 () Bool)

(declare-fun c!108920 () Bool)

(assert (=> bm!45965 (= call!45968 (arrayNoDuplicates!0 lt!491606 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108920 (Cons!23936 (select (arr!34269 lt!491606) #b00000000000000000000000000000000) Nil!23937) Nil!23937)))))

(declare-fun b!1099729 () Bool)

(declare-fun e!627770 () Bool)

(declare-fun e!627771 () Bool)

(assert (=> b!1099729 (= e!627770 e!627771)))

(declare-fun res!733556 () Bool)

(assert (=> b!1099729 (=> (not res!733556) (not e!627771))))

(declare-fun e!627772 () Bool)

(assert (=> b!1099729 (= res!733556 (not e!627772))))

(declare-fun res!733557 () Bool)

(assert (=> b!1099729 (=> (not res!733557) (not e!627772))))

(assert (=> b!1099729 (= res!733557 (validKeyInArray!0 (select (arr!34269 lt!491606) #b00000000000000000000000000000000)))))

(declare-fun b!1099730 () Bool)

(declare-fun e!627769 () Bool)

(assert (=> b!1099730 (= e!627769 call!45968)))

(declare-fun b!1099731 () Bool)

(assert (=> b!1099731 (= e!627769 call!45968)))

(declare-fun b!1099732 () Bool)

(assert (=> b!1099732 (= e!627771 e!627769)))

(assert (=> b!1099732 (= c!108920 (validKeyInArray!0 (select (arr!34269 lt!491606) #b00000000000000000000000000000000)))))

(declare-fun d!130873 () Bool)

(declare-fun res!733555 () Bool)

(assert (=> d!130873 (=> res!733555 e!627770)))

(assert (=> d!130873 (= res!733555 (bvsge #b00000000000000000000000000000000 (size!34806 lt!491606)))))

(assert (=> d!130873 (= (arrayNoDuplicates!0 lt!491606 #b00000000000000000000000000000000 Nil!23937) e!627770)))

(declare-fun b!1099733 () Bool)

(declare-fun contains!6409 (List!23940 (_ BitVec 64)) Bool)

(assert (=> b!1099733 (= e!627772 (contains!6409 Nil!23937 (select (arr!34269 lt!491606) #b00000000000000000000000000000000)))))

(assert (= (and d!130873 (not res!733555)) b!1099729))

(assert (= (and b!1099729 res!733557) b!1099733))

(assert (= (and b!1099729 res!733556) b!1099732))

(assert (= (and b!1099732 c!108920) b!1099731))

(assert (= (and b!1099732 (not c!108920)) b!1099730))

(assert (= (or b!1099731 b!1099730) bm!45965))

(assert (=> bm!45965 m!1019527))

(declare-fun m!1019753 () Bool)

(assert (=> bm!45965 m!1019753))

(assert (=> b!1099729 m!1019527))

(assert (=> b!1099729 m!1019527))

(assert (=> b!1099729 m!1019537))

(assert (=> b!1099732 m!1019527))

(assert (=> b!1099732 m!1019527))

(assert (=> b!1099732 m!1019537))

(assert (=> b!1099733 m!1019527))

(assert (=> b!1099733 m!1019527))

(declare-fun m!1019755 () Bool)

(assert (=> b!1099733 m!1019755))

(assert (=> b!1099442 d!130873))

(declare-fun d!130875 () Bool)

(assert (=> d!130875 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1099433 d!130875))

(declare-fun bm!45966 () Bool)

(declare-fun call!45969 () Bool)

(declare-fun c!108921 () Bool)

(assert (=> bm!45966 (= call!45969 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108921 (Cons!23936 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000) Nil!23937) Nil!23937)))))

(declare-fun b!1099734 () Bool)

(declare-fun e!627774 () Bool)

(declare-fun e!627775 () Bool)

(assert (=> b!1099734 (= e!627774 e!627775)))

(declare-fun res!733559 () Bool)

(assert (=> b!1099734 (=> (not res!733559) (not e!627775))))

(declare-fun e!627776 () Bool)

(assert (=> b!1099734 (= res!733559 (not e!627776))))

(declare-fun res!733560 () Bool)

(assert (=> b!1099734 (=> (not res!733560) (not e!627776))))

(assert (=> b!1099734 (= res!733560 (validKeyInArray!0 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1099735 () Bool)

(declare-fun e!627773 () Bool)

(assert (=> b!1099735 (= e!627773 call!45969)))

(declare-fun b!1099736 () Bool)

(assert (=> b!1099736 (= e!627773 call!45969)))

(declare-fun b!1099737 () Bool)

(assert (=> b!1099737 (= e!627775 e!627773)))

(assert (=> b!1099737 (= c!108921 (validKeyInArray!0 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130877 () Bool)

(declare-fun res!733558 () Bool)

(assert (=> d!130877 (=> res!733558 e!627774)))

(assert (=> d!130877 (= res!733558 (bvsge #b00000000000000000000000000000000 (size!34806 _keys!1070)))))

(assert (=> d!130877 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23937) e!627774)))

(declare-fun b!1099738 () Bool)

(assert (=> b!1099738 (= e!627776 (contains!6409 Nil!23937 (select (arr!34269 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130877 (not res!733558)) b!1099734))

(assert (= (and b!1099734 res!733560) b!1099738))

(assert (= (and b!1099734 res!733559) b!1099737))

(assert (= (and b!1099737 c!108921) b!1099736))

(assert (= (and b!1099737 (not c!108921)) b!1099735))

(assert (= (or b!1099736 b!1099735) bm!45966))

(assert (=> bm!45966 m!1019539))

(declare-fun m!1019757 () Bool)

(assert (=> bm!45966 m!1019757))

(assert (=> b!1099734 m!1019539))

(assert (=> b!1099734 m!1019539))

(assert (=> b!1099734 m!1019549))

(assert (=> b!1099737 m!1019539))

(assert (=> b!1099737 m!1019539))

(assert (=> b!1099737 m!1019549))

(assert (=> b!1099738 m!1019539))

(assert (=> b!1099738 m!1019539))

(declare-fun m!1019759 () Bool)

(assert (=> b!1099738 m!1019759))

(assert (=> b!1099447 d!130877))

(declare-fun d!130879 () Bool)

(declare-fun e!627777 () Bool)

(assert (=> d!130879 e!627777))

(declare-fun res!733561 () Bool)

(assert (=> d!130879 (=> (not res!733561) (not e!627777))))

(declare-fun lt!491840 () ListLongMap!15293)

(assert (=> d!130879 (= res!733561 (contains!6407 lt!491840 (_1!8669 lt!491610)))))

(declare-fun lt!491843 () List!23939)

(assert (=> d!130879 (= lt!491840 (ListLongMap!15294 lt!491843))))

(declare-fun lt!491842 () Unit!36111)

(declare-fun lt!491841 () Unit!36111)

(assert (=> d!130879 (= lt!491842 lt!491841)))

(assert (=> d!130879 (= (getValueByKey!616 lt!491843 (_1!8669 lt!491610)) (Some!666 (_2!8669 lt!491610)))))

(assert (=> d!130879 (= lt!491841 (lemmaContainsTupThenGetReturnValue!298 lt!491843 (_1!8669 lt!491610) (_2!8669 lt!491610)))))

(assert (=> d!130879 (= lt!491843 (insertStrictlySorted!391 (toList!7662 (+!3396 lt!491603 lt!491609)) (_1!8669 lt!491610) (_2!8669 lt!491610)))))

(assert (=> d!130879 (= (+!3396 (+!3396 lt!491603 lt!491609) lt!491610) lt!491840)))

(declare-fun b!1099739 () Bool)

(declare-fun res!733562 () Bool)

(assert (=> b!1099739 (=> (not res!733562) (not e!627777))))

(assert (=> b!1099739 (= res!733562 (= (getValueByKey!616 (toList!7662 lt!491840) (_1!8669 lt!491610)) (Some!666 (_2!8669 lt!491610))))))

(declare-fun b!1099740 () Bool)

(assert (=> b!1099740 (= e!627777 (contains!6408 (toList!7662 lt!491840) lt!491610))))

(assert (= (and d!130879 res!733561) b!1099739))

(assert (= (and b!1099739 res!733562) b!1099740))

(declare-fun m!1019761 () Bool)

(assert (=> d!130879 m!1019761))

(declare-fun m!1019763 () Bool)

(assert (=> d!130879 m!1019763))

(declare-fun m!1019765 () Bool)

(assert (=> d!130879 m!1019765))

(declare-fun m!1019767 () Bool)

(assert (=> d!130879 m!1019767))

(declare-fun m!1019769 () Bool)

(assert (=> b!1099739 m!1019769))

(declare-fun m!1019771 () Bool)

(assert (=> b!1099740 m!1019771))

(assert (=> b!1099446 d!130879))

(declare-fun d!130881 () Bool)

(declare-fun e!627778 () Bool)

(assert (=> d!130881 e!627778))

(declare-fun res!733563 () Bool)

(assert (=> d!130881 (=> (not res!733563) (not e!627778))))

(declare-fun lt!491844 () ListLongMap!15293)

(assert (=> d!130881 (= res!733563 (contains!6407 lt!491844 (_1!8669 lt!491609)))))

(declare-fun lt!491847 () List!23939)

(assert (=> d!130881 (= lt!491844 (ListLongMap!15294 lt!491847))))

(declare-fun lt!491846 () Unit!36111)

(declare-fun lt!491845 () Unit!36111)

(assert (=> d!130881 (= lt!491846 lt!491845)))

(assert (=> d!130881 (= (getValueByKey!616 lt!491847 (_1!8669 lt!491609)) (Some!666 (_2!8669 lt!491609)))))

(assert (=> d!130881 (= lt!491845 (lemmaContainsTupThenGetReturnValue!298 lt!491847 (_1!8669 lt!491609) (_2!8669 lt!491609)))))

(assert (=> d!130881 (= lt!491847 (insertStrictlySorted!391 (toList!7662 lt!491603) (_1!8669 lt!491609) (_2!8669 lt!491609)))))

(assert (=> d!130881 (= (+!3396 lt!491603 lt!491609) lt!491844)))

(declare-fun b!1099741 () Bool)

(declare-fun res!733564 () Bool)

(assert (=> b!1099741 (=> (not res!733564) (not e!627778))))

(assert (=> b!1099741 (= res!733564 (= (getValueByKey!616 (toList!7662 lt!491844) (_1!8669 lt!491609)) (Some!666 (_2!8669 lt!491609))))))

(declare-fun b!1099742 () Bool)

(assert (=> b!1099742 (= e!627778 (contains!6408 (toList!7662 lt!491844) lt!491609))))

(assert (= (and d!130881 res!733563) b!1099741))

(assert (= (and b!1099741 res!733564) b!1099742))

(declare-fun m!1019773 () Bool)

(assert (=> d!130881 m!1019773))

(declare-fun m!1019775 () Bool)

(assert (=> d!130881 m!1019775))

(declare-fun m!1019777 () Bool)

(assert (=> d!130881 m!1019777))

(declare-fun m!1019779 () Bool)

(assert (=> d!130881 m!1019779))

(declare-fun m!1019781 () Bool)

(assert (=> b!1099741 m!1019781))

(declare-fun m!1019783 () Bool)

(assert (=> b!1099742 m!1019783))

(assert (=> b!1099446 d!130881))

(declare-fun condMapEmpty!42475 () Bool)

(declare-fun mapDefault!42475 () ValueCell!12857)

(assert (=> mapNonEmpty!42466 (= condMapEmpty!42475 (= mapRest!42466 ((as const (Array (_ BitVec 32) ValueCell!12857)) mapDefault!42475)))))

(declare-fun e!627784 () Bool)

(declare-fun mapRes!42475 () Bool)

(assert (=> mapNonEmpty!42466 (= tp!81182 (and e!627784 mapRes!42475))))

(declare-fun mapIsEmpty!42475 () Bool)

(assert (=> mapIsEmpty!42475 mapRes!42475))

(declare-fun b!1099750 () Bool)

(assert (=> b!1099750 (= e!627784 tp_is_empty!27133)))

(declare-fun mapNonEmpty!42475 () Bool)

(declare-fun tp!81197 () Bool)

(declare-fun e!627783 () Bool)

(assert (=> mapNonEmpty!42475 (= mapRes!42475 (and tp!81197 e!627783))))

(declare-fun mapKey!42475 () (_ BitVec 32))

(declare-fun mapRest!42475 () (Array (_ BitVec 32) ValueCell!12857))

(declare-fun mapValue!42475 () ValueCell!12857)

(assert (=> mapNonEmpty!42475 (= mapRest!42466 (store mapRest!42475 mapKey!42475 mapValue!42475))))

(declare-fun b!1099749 () Bool)

(assert (=> b!1099749 (= e!627783 tp_is_empty!27133)))

(assert (= (and mapNonEmpty!42466 condMapEmpty!42475) mapIsEmpty!42475))

(assert (= (and mapNonEmpty!42466 (not condMapEmpty!42475)) mapNonEmpty!42475))

(assert (= (and mapNonEmpty!42475 ((_ is ValueCellFull!12857) mapValue!42475)) b!1099749))

(assert (= (and mapNonEmpty!42466 ((_ is ValueCellFull!12857) mapDefault!42475)) b!1099750))

(declare-fun m!1019785 () Bool)

(assert (=> mapNonEmpty!42475 m!1019785))

(declare-fun b_lambda!17833 () Bool)

(assert (= b_lambda!17825 (or (and start!96792 b_free!23083) b_lambda!17833)))

(declare-fun b_lambda!17835 () Bool)

(assert (= b_lambda!17819 (or (and start!96792 b_free!23083) b_lambda!17835)))

(declare-fun b_lambda!17837 () Bool)

(assert (= b_lambda!17821 (or (and start!96792 b_free!23083) b_lambda!17837)))

(declare-fun b_lambda!17839 () Bool)

(assert (= b_lambda!17829 (or (and start!96792 b_free!23083) b_lambda!17839)))

(declare-fun b_lambda!17841 () Bool)

(assert (= b_lambda!17827 (or (and start!96792 b_free!23083) b_lambda!17841)))

(declare-fun b_lambda!17843 () Bool)

(assert (= b_lambda!17823 (or (and start!96792 b_free!23083) b_lambda!17843)))

(declare-fun b_lambda!17845 () Bool)

(assert (= b_lambda!17831 (or (and start!96792 b_free!23083) b_lambda!17845)))

(check-sat (not b!1099737) (not bm!45939) (not bm!45941) (not d!130863) (not b!1099698) (not b!1099635) (not b!1099565) (not b!1099707) (not d!130859) (not bm!45954) (not b!1099740) (not b!1099636) (not d!130861) (not b!1099567) (not b!1099651) (not b!1099715) (not b_lambda!17833) (not b_lambda!17841) (not b!1099655) (not b!1099571) (not b!1099663) (not d!130865) (not b!1099709) (not bm!45924) (not b!1099703) (not bm!45952) (not d!130845) (not d!130857) (not b!1099742) (not bm!45953) (not b!1099739) (not b!1099706) (not b!1099569) (not b!1099621) (not bm!45944) (not b!1099734) (not b!1099647) (not b_lambda!17845) (not b!1099713) (not bm!45962) (not b!1099568) (not bm!45965) (not d!130843) (not b!1099557) (not d!130855) (not b_lambda!17835) (not mapNonEmpty!42475) (not b_lambda!17843) (not b!1099640) (not b!1099732) (not bm!45951) (not b!1099566) (not b!1099733) (not d!130881) (not bm!45923) (not bm!45940) (not b!1099702) (not b!1099695) (not d!130847) (not d!130849) (not bm!45950) (not b!1099625) (not bm!45966) (not b!1099729) (not b!1099570) (not b!1099718) (not b_lambda!17817) (not b!1099564) (not b!1099741) b_and!36891 (not b!1099555) (not bm!45957) (not b_lambda!17837) (not b!1099697) (not b!1099708) (not b!1099665) (not b!1099632) (not b!1099559) (not b_next!23083) (not b!1099666) (not b!1099623) (not b!1099577) (not b!1099662) (not bm!45961) (not b!1099653) (not d!130853) (not b!1099714) tp_is_empty!27133 (not d!130879) (not b!1099633) (not b_lambda!17839) (not b!1099670) (not b!1099701) (not b!1099696) (not b!1099738) (not b!1099710) (not b!1099553))
(check-sat b_and!36891 (not b_next!23083))
