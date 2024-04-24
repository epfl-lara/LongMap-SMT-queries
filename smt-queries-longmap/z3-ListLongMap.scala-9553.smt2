; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113404 () Bool)

(assert start!113404)

(declare-fun b_free!31231 () Bool)

(declare-fun b_next!31231 () Bool)

(assert (=> start!113404 (= b_free!31231 (not b_next!31231))))

(declare-fun tp!109497 () Bool)

(declare-fun b_and!50371 () Bool)

(assert (=> start!113404 (= tp!109497 b_and!50371)))

(declare-fun res!891035 () Bool)

(declare-fun e!765056 () Bool)

(assert (=> start!113404 (=> (not res!891035) (not e!765056))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113404 (= res!891035 (validMask!0 mask!1977))))

(assert (=> start!113404 e!765056))

(declare-fun tp_is_empty!37231 () Bool)

(assert (=> start!113404 tp_is_empty!37231))

(assert (=> start!113404 true))

(declare-datatypes ((array!91431 0))(
  ( (array!91432 (arr!44167 (Array (_ BitVec 32) (_ BitVec 64))) (size!44718 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91431)

(declare-fun array_inv!33567 (array!91431) Bool)

(assert (=> start!113404 (array_inv!33567 _keys!1571)))

(declare-datatypes ((V!54745 0))(
  ( (V!54746 (val!18690 Int)) )
))
(declare-datatypes ((ValueCell!17717 0))(
  ( (ValueCellFull!17717 (v!21333 V!54745)) (EmptyCell!17717) )
))
(declare-datatypes ((array!91433 0))(
  ( (array!91434 (arr!44168 (Array (_ BitVec 32) ValueCell!17717)) (size!44719 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91433)

(declare-fun e!765053 () Bool)

(declare-fun array_inv!33568 (array!91433) Bool)

(assert (=> start!113404 (and (array_inv!33568 _values!1303) e!765053)))

(assert (=> start!113404 tp!109497))

(declare-fun b!1343582 () Bool)

(declare-fun res!891036 () Bool)

(assert (=> b!1343582 (=> (not res!891036) (not e!765056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91431 (_ BitVec 32)) Bool)

(assert (=> b!1343582 (= res!891036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343583 () Bool)

(declare-fun e!765054 () Bool)

(assert (=> b!1343583 (= e!765054 tp_is_empty!37231)))

(declare-fun b!1343584 () Bool)

(declare-fun e!765052 () Bool)

(declare-fun mapRes!57553 () Bool)

(assert (=> b!1343584 (= e!765053 (and e!765052 mapRes!57553))))

(declare-fun condMapEmpty!57553 () Bool)

(declare-fun mapDefault!57553 () ValueCell!17717)

(assert (=> b!1343584 (= condMapEmpty!57553 (= (arr!44168 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17717)) mapDefault!57553)))))

(declare-fun b!1343585 () Bool)

(assert (=> b!1343585 (= e!765056 (not true))))

(declare-datatypes ((tuple2!24126 0))(
  ( (tuple2!24127 (_1!12074 (_ BitVec 64)) (_2!12074 V!54745)) )
))
(declare-datatypes ((List!31275 0))(
  ( (Nil!31272) (Cons!31271 (h!32489 tuple2!24126) (t!45709 List!31275)) )
))
(declare-datatypes ((ListLongMap!21791 0))(
  ( (ListLongMap!21792 (toList!10911 List!31275)) )
))
(declare-fun lt!594899 () ListLongMap!21791)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9099 (ListLongMap!21791 (_ BitVec 64)) Bool)

(assert (=> b!1343585 (contains!9099 lt!594899 k0!1142)))

(declare-datatypes ((Unit!43994 0))(
  ( (Unit!43995) )
))
(declare-fun lt!594896 () Unit!43994)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!594895 () V!54745)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!353 ((_ BitVec 64) (_ BitVec 64) V!54745 ListLongMap!21791) Unit!43994)

(assert (=> b!1343585 (= lt!594896 (lemmaInListMapAfterAddingDiffThenInBefore!353 k0!1142 (select (arr!44167 _keys!1571) from!1960) lt!594895 lt!594899))))

(declare-fun lt!594897 () ListLongMap!21791)

(assert (=> b!1343585 (contains!9099 lt!594897 k0!1142)))

(declare-fun lt!594898 () Unit!43994)

(declare-fun zeroValue!1245 () V!54745)

(assert (=> b!1343585 (= lt!594898 (lemmaInListMapAfterAddingDiffThenInBefore!353 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594897))))

(declare-fun +!4827 (ListLongMap!21791 tuple2!24126) ListLongMap!21791)

(assert (=> b!1343585 (= lt!594897 (+!4827 lt!594899 (tuple2!24127 (select (arr!44167 _keys!1571) from!1960) lt!594895)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22313 (ValueCell!17717 V!54745) V!54745)

(declare-fun dynLambda!3781 (Int (_ BitVec 64)) V!54745)

(assert (=> b!1343585 (= lt!594895 (get!22313 (select (arr!44168 _values!1303) from!1960) (dynLambda!3781 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54745)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6476 (array!91431 array!91433 (_ BitVec 32) (_ BitVec 32) V!54745 V!54745 (_ BitVec 32) Int) ListLongMap!21791)

(assert (=> b!1343585 (= lt!594899 (getCurrentListMapNoExtraKeys!6476 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343586 () Bool)

(assert (=> b!1343586 (= e!765052 tp_is_empty!37231)))

(declare-fun b!1343587 () Bool)

(declare-fun res!891037 () Bool)

(assert (=> b!1343587 (=> (not res!891037) (not e!765056))))

(assert (=> b!1343587 (= res!891037 (and (= (size!44719 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44718 _keys!1571) (size!44719 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57553 () Bool)

(assert (=> mapIsEmpty!57553 mapRes!57553))

(declare-fun b!1343588 () Bool)

(declare-fun res!891034 () Bool)

(assert (=> b!1343588 (=> (not res!891034) (not e!765056))))

(assert (=> b!1343588 (= res!891034 (not (= (select (arr!44167 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343589 () Bool)

(declare-fun res!891040 () Bool)

(assert (=> b!1343589 (=> (not res!891040) (not e!765056))))

(declare-fun getCurrentListMap!5859 (array!91431 array!91433 (_ BitVec 32) (_ BitVec 32) V!54745 V!54745 (_ BitVec 32) Int) ListLongMap!21791)

(assert (=> b!1343589 (= res!891040 (contains!9099 (getCurrentListMap!5859 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57553 () Bool)

(declare-fun tp!109498 () Bool)

(assert (=> mapNonEmpty!57553 (= mapRes!57553 (and tp!109498 e!765054))))

(declare-fun mapValue!57553 () ValueCell!17717)

(declare-fun mapRest!57553 () (Array (_ BitVec 32) ValueCell!17717))

(declare-fun mapKey!57553 () (_ BitVec 32))

(assert (=> mapNonEmpty!57553 (= (arr!44168 _values!1303) (store mapRest!57553 mapKey!57553 mapValue!57553))))

(declare-fun b!1343590 () Bool)

(declare-fun res!891039 () Bool)

(assert (=> b!1343590 (=> (not res!891039) (not e!765056))))

(assert (=> b!1343590 (= res!891039 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44718 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343591 () Bool)

(declare-fun res!891033 () Bool)

(assert (=> b!1343591 (=> (not res!891033) (not e!765056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343591 (= res!891033 (validKeyInArray!0 (select (arr!44167 _keys!1571) from!1960)))))

(declare-fun b!1343592 () Bool)

(declare-fun res!891041 () Bool)

(assert (=> b!1343592 (=> (not res!891041) (not e!765056))))

(assert (=> b!1343592 (= res!891041 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343593 () Bool)

(declare-fun res!891038 () Bool)

(assert (=> b!1343593 (=> (not res!891038) (not e!765056))))

(declare-datatypes ((List!31276 0))(
  ( (Nil!31273) (Cons!31272 (h!32490 (_ BitVec 64)) (t!45710 List!31276)) )
))
(declare-fun arrayNoDuplicates!0 (array!91431 (_ BitVec 32) List!31276) Bool)

(assert (=> b!1343593 (= res!891038 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31273))))

(assert (= (and start!113404 res!891035) b!1343587))

(assert (= (and b!1343587 res!891037) b!1343582))

(assert (= (and b!1343582 res!891036) b!1343593))

(assert (= (and b!1343593 res!891038) b!1343590))

(assert (= (and b!1343590 res!891039) b!1343589))

(assert (= (and b!1343589 res!891040) b!1343588))

(assert (= (and b!1343588 res!891034) b!1343591))

(assert (= (and b!1343591 res!891033) b!1343592))

(assert (= (and b!1343592 res!891041) b!1343585))

(assert (= (and b!1343584 condMapEmpty!57553) mapIsEmpty!57553))

(assert (= (and b!1343584 (not condMapEmpty!57553)) mapNonEmpty!57553))

(get-info :version)

(assert (= (and mapNonEmpty!57553 ((_ is ValueCellFull!17717) mapValue!57553)) b!1343583))

(assert (= (and b!1343584 ((_ is ValueCellFull!17717) mapDefault!57553)) b!1343586))

(assert (= start!113404 b!1343584))

(declare-fun b_lambda!24401 () Bool)

(assert (=> (not b_lambda!24401) (not b!1343585)))

(declare-fun t!45708 () Bool)

(declare-fun tb!12237 () Bool)

(assert (=> (and start!113404 (= defaultEntry!1306 defaultEntry!1306) t!45708) tb!12237))

(declare-fun result!25573 () Bool)

(assert (=> tb!12237 (= result!25573 tp_is_empty!37231)))

(assert (=> b!1343585 t!45708))

(declare-fun b_and!50373 () Bool)

(assert (= b_and!50371 (and (=> t!45708 result!25573) b_and!50373)))

(declare-fun m!1231503 () Bool)

(assert (=> b!1343582 m!1231503))

(declare-fun m!1231505 () Bool)

(assert (=> b!1343585 m!1231505))

(declare-fun m!1231507 () Bool)

(assert (=> b!1343585 m!1231507))

(declare-fun m!1231509 () Bool)

(assert (=> b!1343585 m!1231509))

(declare-fun m!1231511 () Bool)

(assert (=> b!1343585 m!1231511))

(declare-fun m!1231513 () Bool)

(assert (=> b!1343585 m!1231513))

(assert (=> b!1343585 m!1231509))

(declare-fun m!1231515 () Bool)

(assert (=> b!1343585 m!1231515))

(declare-fun m!1231517 () Bool)

(assert (=> b!1343585 m!1231517))

(assert (=> b!1343585 m!1231511))

(declare-fun m!1231519 () Bool)

(assert (=> b!1343585 m!1231519))

(declare-fun m!1231521 () Bool)

(assert (=> b!1343585 m!1231521))

(declare-fun m!1231523 () Bool)

(assert (=> b!1343585 m!1231523))

(assert (=> b!1343585 m!1231515))

(assert (=> b!1343591 m!1231515))

(assert (=> b!1343591 m!1231515))

(declare-fun m!1231525 () Bool)

(assert (=> b!1343591 m!1231525))

(declare-fun m!1231527 () Bool)

(assert (=> b!1343589 m!1231527))

(assert (=> b!1343589 m!1231527))

(declare-fun m!1231529 () Bool)

(assert (=> b!1343589 m!1231529))

(declare-fun m!1231531 () Bool)

(assert (=> mapNonEmpty!57553 m!1231531))

(declare-fun m!1231533 () Bool)

(assert (=> b!1343593 m!1231533))

(declare-fun m!1231535 () Bool)

(assert (=> start!113404 m!1231535))

(declare-fun m!1231537 () Bool)

(assert (=> start!113404 m!1231537))

(declare-fun m!1231539 () Bool)

(assert (=> start!113404 m!1231539))

(assert (=> b!1343588 m!1231515))

(check-sat tp_is_empty!37231 (not b!1343593) (not b_lambda!24401) (not b!1343585) (not mapNonEmpty!57553) (not b!1343591) b_and!50373 (not b!1343589) (not b!1343582) (not start!113404) (not b_next!31231))
(check-sat b_and!50373 (not b_next!31231))
