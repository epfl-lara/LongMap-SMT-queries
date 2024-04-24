; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113572 () Bool)

(assert start!113572)

(declare-fun b_free!31399 () Bool)

(declare-fun b_next!31399 () Bool)

(assert (=> start!113572 (= b_free!31399 (not b_next!31399))))

(declare-fun tp!110001 () Bool)

(declare-fun b_and!50653 () Bool)

(assert (=> start!113572 (= tp!110001 b_and!50653)))

(declare-fun b!1346481 () Bool)

(declare-fun e!766346 () Bool)

(assert (=> b!1346481 (= e!766346 (not true))))

(declare-datatypes ((V!54969 0))(
  ( (V!54970 (val!18774 Int)) )
))
(declare-datatypes ((tuple2!24238 0))(
  ( (tuple2!24239 (_1!12130 (_ BitVec 64)) (_2!12130 V!54969)) )
))
(declare-datatypes ((List!31383 0))(
  ( (Nil!31380) (Cons!31379 (h!32597 tuple2!24238) (t!45931 List!31383)) )
))
(declare-datatypes ((ListLongMap!21903 0))(
  ( (ListLongMap!21904 (toList!10967 List!31383)) )
))
(declare-fun lt!595775 () ListLongMap!21903)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9155 (ListLongMap!21903 (_ BitVec 64)) Bool)

(assert (=> b!1346481 (contains!9155 lt!595775 k0!1142)))

(declare-datatypes ((array!91745 0))(
  ( (array!91746 (arr!44324 (Array (_ BitVec 32) (_ BitVec 64))) (size!44875 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91745)

(declare-fun lt!595773 () V!54969)

(declare-datatypes ((Unit!44052 0))(
  ( (Unit!44053) )
))
(declare-fun lt!595774 () Unit!44052)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!382 ((_ BitVec 64) (_ BitVec 64) V!54969 ListLongMap!21903) Unit!44052)

(assert (=> b!1346481 (= lt!595774 (lemmaInListMapAfterAddingDiffThenInBefore!382 k0!1142 (select (arr!44324 _keys!1571) from!1960) lt!595773 lt!595775))))

(declare-fun b!1346482 () Bool)

(declare-fun e!766341 () Bool)

(assert (=> b!1346482 (= e!766341 e!766346)))

(declare-fun res!893068 () Bool)

(assert (=> b!1346482 (=> (not res!893068) (not e!766346))))

(declare-fun +!4862 (ListLongMap!21903 tuple2!24238) ListLongMap!21903)

(assert (=> b!1346482 (= res!893068 (contains!9155 (+!4862 lt!595775 (tuple2!24239 (select (arr!44324 _keys!1571) from!1960) lt!595773)) k0!1142))))

(declare-fun minValue!1245 () V!54969)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54969)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17801 0))(
  ( (ValueCellFull!17801 (v!21417 V!54969)) (EmptyCell!17801) )
))
(declare-datatypes ((array!91747 0))(
  ( (array!91748 (arr!44325 (Array (_ BitVec 32) ValueCell!17801)) (size!44876 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91747)

(declare-fun getCurrentListMapNoExtraKeys!6511 (array!91745 array!91747 (_ BitVec 32) (_ BitVec 32) V!54969 V!54969 (_ BitVec 32) Int) ListLongMap!21903)

(assert (=> b!1346482 (= lt!595775 (getCurrentListMapNoExtraKeys!6511 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22404 (ValueCell!17801 V!54969) V!54969)

(declare-fun dynLambda!3816 (Int (_ BitVec 64)) V!54969)

(assert (=> b!1346482 (= lt!595773 (get!22404 (select (arr!44325 _values!1303) from!1960) (dynLambda!3816 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1346483 () Bool)

(declare-fun res!893062 () Bool)

(assert (=> b!1346483 (=> (not res!893062) (not e!766341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91745 (_ BitVec 32)) Bool)

(assert (=> b!1346483 (= res!893062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346484 () Bool)

(declare-fun res!893070 () Bool)

(assert (=> b!1346484 (=> (not res!893070) (not e!766341))))

(assert (=> b!1346484 (= res!893070 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44875 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57805 () Bool)

(declare-fun mapRes!57805 () Bool)

(assert (=> mapIsEmpty!57805 mapRes!57805))

(declare-fun b!1346486 () Bool)

(declare-fun e!766344 () Bool)

(declare-fun tp_is_empty!37399 () Bool)

(assert (=> b!1346486 (= e!766344 tp_is_empty!37399)))

(declare-fun mapNonEmpty!57805 () Bool)

(declare-fun tp!110002 () Bool)

(assert (=> mapNonEmpty!57805 (= mapRes!57805 (and tp!110002 e!766344))))

(declare-fun mapRest!57805 () (Array (_ BitVec 32) ValueCell!17801))

(declare-fun mapKey!57805 () (_ BitVec 32))

(declare-fun mapValue!57805 () ValueCell!17801)

(assert (=> mapNonEmpty!57805 (= (arr!44325 _values!1303) (store mapRest!57805 mapKey!57805 mapValue!57805))))

(declare-fun b!1346487 () Bool)

(declare-fun res!893072 () Bool)

(assert (=> b!1346487 (=> (not res!893072) (not e!766341))))

(assert (=> b!1346487 (= res!893072 (and (= (size!44876 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44875 _keys!1571) (size!44876 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346488 () Bool)

(declare-fun res!893066 () Bool)

(assert (=> b!1346488 (=> (not res!893066) (not e!766341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346488 (= res!893066 (validKeyInArray!0 (select (arr!44324 _keys!1571) from!1960)))))

(declare-fun b!1346489 () Bool)

(declare-fun res!893064 () Bool)

(assert (=> b!1346489 (=> (not res!893064) (not e!766346))))

(assert (=> b!1346489 (= res!893064 (not (= k0!1142 (select (arr!44324 _keys!1571) from!1960))))))

(declare-fun b!1346490 () Bool)

(declare-fun res!893063 () Bool)

(assert (=> b!1346490 (=> (not res!893063) (not e!766341))))

(assert (=> b!1346490 (= res!893063 (not (= (select (arr!44324 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1346491 () Bool)

(declare-fun res!893065 () Bool)

(assert (=> b!1346491 (=> (not res!893065) (not e!766341))))

(declare-fun getCurrentListMap!5909 (array!91745 array!91747 (_ BitVec 32) (_ BitVec 32) V!54969 V!54969 (_ BitVec 32) Int) ListLongMap!21903)

(assert (=> b!1346491 (= res!893065 (contains!9155 (getCurrentListMap!5909 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346492 () Bool)

(declare-fun res!893067 () Bool)

(assert (=> b!1346492 (=> (not res!893067) (not e!766341))))

(declare-datatypes ((List!31384 0))(
  ( (Nil!31381) (Cons!31380 (h!32598 (_ BitVec 64)) (t!45932 List!31384)) )
))
(declare-fun arrayNoDuplicates!0 (array!91745 (_ BitVec 32) List!31384) Bool)

(assert (=> b!1346492 (= res!893067 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31381))))

(declare-fun res!893071 () Bool)

(assert (=> start!113572 (=> (not res!893071) (not e!766341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113572 (= res!893071 (validMask!0 mask!1977))))

(assert (=> start!113572 e!766341))

(assert (=> start!113572 tp_is_empty!37399))

(assert (=> start!113572 true))

(declare-fun array_inv!33669 (array!91745) Bool)

(assert (=> start!113572 (array_inv!33669 _keys!1571)))

(declare-fun e!766342 () Bool)

(declare-fun array_inv!33670 (array!91747) Bool)

(assert (=> start!113572 (and (array_inv!33670 _values!1303) e!766342)))

(assert (=> start!113572 tp!110001))

(declare-fun b!1346485 () Bool)

(declare-fun res!893069 () Bool)

(assert (=> b!1346485 (=> (not res!893069) (not e!766341))))

(assert (=> b!1346485 (= res!893069 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1346493 () Bool)

(declare-fun e!766345 () Bool)

(assert (=> b!1346493 (= e!766345 tp_is_empty!37399)))

(declare-fun b!1346494 () Bool)

(assert (=> b!1346494 (= e!766342 (and e!766345 mapRes!57805))))

(declare-fun condMapEmpty!57805 () Bool)

(declare-fun mapDefault!57805 () ValueCell!17801)

(assert (=> b!1346494 (= condMapEmpty!57805 (= (arr!44325 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17801)) mapDefault!57805)))))

(assert (= (and start!113572 res!893071) b!1346487))

(assert (= (and b!1346487 res!893072) b!1346483))

(assert (= (and b!1346483 res!893062) b!1346492))

(assert (= (and b!1346492 res!893067) b!1346484))

(assert (= (and b!1346484 res!893070) b!1346491))

(assert (= (and b!1346491 res!893065) b!1346490))

(assert (= (and b!1346490 res!893063) b!1346488))

(assert (= (and b!1346488 res!893066) b!1346485))

(assert (= (and b!1346485 res!893069) b!1346482))

(assert (= (and b!1346482 res!893068) b!1346489))

(assert (= (and b!1346489 res!893064) b!1346481))

(assert (= (and b!1346494 condMapEmpty!57805) mapIsEmpty!57805))

(assert (= (and b!1346494 (not condMapEmpty!57805)) mapNonEmpty!57805))

(get-info :version)

(assert (= (and mapNonEmpty!57805 ((_ is ValueCellFull!17801) mapValue!57805)) b!1346486))

(assert (= (and b!1346494 ((_ is ValueCellFull!17801) mapDefault!57805)) b!1346493))

(assert (= start!113572 b!1346494))

(declare-fun b_lambda!24515 () Bool)

(assert (=> (not b_lambda!24515) (not b!1346482)))

(declare-fun t!45930 () Bool)

(declare-fun tb!12351 () Bool)

(assert (=> (and start!113572 (= defaultEntry!1306 defaultEntry!1306) t!45930) tb!12351))

(declare-fun result!25801 () Bool)

(assert (=> tb!12351 (= result!25801 tp_is_empty!37399)))

(assert (=> b!1346482 t!45930))

(declare-fun b_and!50655 () Bool)

(assert (= b_and!50653 (and (=> t!45930 result!25801) b_and!50655)))

(declare-fun m!1234221 () Bool)

(assert (=> b!1346490 m!1234221))

(declare-fun m!1234223 () Bool)

(assert (=> b!1346482 m!1234223))

(declare-fun m!1234225 () Bool)

(assert (=> b!1346482 m!1234225))

(declare-fun m!1234227 () Bool)

(assert (=> b!1346482 m!1234227))

(assert (=> b!1346482 m!1234223))

(assert (=> b!1346482 m!1234225))

(declare-fun m!1234229 () Bool)

(assert (=> b!1346482 m!1234229))

(assert (=> b!1346482 m!1234221))

(assert (=> b!1346482 m!1234229))

(declare-fun m!1234231 () Bool)

(assert (=> b!1346482 m!1234231))

(declare-fun m!1234233 () Bool)

(assert (=> b!1346482 m!1234233))

(assert (=> b!1346489 m!1234221))

(declare-fun m!1234235 () Bool)

(assert (=> b!1346492 m!1234235))

(declare-fun m!1234237 () Bool)

(assert (=> b!1346491 m!1234237))

(assert (=> b!1346491 m!1234237))

(declare-fun m!1234239 () Bool)

(assert (=> b!1346491 m!1234239))

(declare-fun m!1234241 () Bool)

(assert (=> mapNonEmpty!57805 m!1234241))

(declare-fun m!1234243 () Bool)

(assert (=> b!1346483 m!1234243))

(assert (=> b!1346488 m!1234221))

(assert (=> b!1346488 m!1234221))

(declare-fun m!1234245 () Bool)

(assert (=> b!1346488 m!1234245))

(declare-fun m!1234247 () Bool)

(assert (=> b!1346481 m!1234247))

(assert (=> b!1346481 m!1234221))

(assert (=> b!1346481 m!1234221))

(declare-fun m!1234249 () Bool)

(assert (=> b!1346481 m!1234249))

(declare-fun m!1234251 () Bool)

(assert (=> start!113572 m!1234251))

(declare-fun m!1234253 () Bool)

(assert (=> start!113572 m!1234253))

(declare-fun m!1234255 () Bool)

(assert (=> start!113572 m!1234255))

(check-sat tp_is_empty!37399 (not b!1346491) (not start!113572) (not b!1346483) (not b!1346482) (not b!1346481) (not b_lambda!24515) (not b_next!31399) (not mapNonEmpty!57805) (not b!1346488) b_and!50655 (not b!1346492))
(check-sat b_and!50655 (not b_next!31399))
