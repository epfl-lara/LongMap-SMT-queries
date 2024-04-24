; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113428 () Bool)

(assert start!113428)

(declare-fun b_free!31255 () Bool)

(declare-fun b_next!31255 () Bool)

(assert (=> start!113428 (= b_free!31255 (not b_next!31255))))

(declare-fun tp!109570 () Bool)

(declare-fun b_and!50419 () Bool)

(assert (=> start!113428 (= tp!109570 b_and!50419)))

(declare-fun b!1344038 () Bool)

(declare-fun res!891361 () Bool)

(declare-fun e!765236 () Bool)

(assert (=> b!1344038 (=> (not res!891361) (not e!765236))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1344038 (= res!891361 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57589 () Bool)

(declare-fun mapRes!57589 () Bool)

(assert (=> mapIsEmpty!57589 mapRes!57589))

(declare-fun res!891364 () Bool)

(assert (=> start!113428 (=> (not res!891364) (not e!765236))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113428 (= res!891364 (validMask!0 mask!1977))))

(assert (=> start!113428 e!765236))

(declare-fun tp_is_empty!37255 () Bool)

(assert (=> start!113428 tp_is_empty!37255))

(assert (=> start!113428 true))

(declare-datatypes ((array!91473 0))(
  ( (array!91474 (arr!44188 (Array (_ BitVec 32) (_ BitVec 64))) (size!44739 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91473)

(declare-fun array_inv!33579 (array!91473) Bool)

(assert (=> start!113428 (array_inv!33579 _keys!1571)))

(declare-datatypes ((V!54777 0))(
  ( (V!54778 (val!18702 Int)) )
))
(declare-datatypes ((ValueCell!17729 0))(
  ( (ValueCellFull!17729 (v!21345 V!54777)) (EmptyCell!17729) )
))
(declare-datatypes ((array!91475 0))(
  ( (array!91476 (arr!44189 (Array (_ BitVec 32) ValueCell!17729)) (size!44740 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91475)

(declare-fun e!765235 () Bool)

(declare-fun array_inv!33580 (array!91475) Bool)

(assert (=> start!113428 (and (array_inv!33580 _values!1303) e!765235)))

(assert (=> start!113428 tp!109570))

(declare-fun b!1344039 () Bool)

(declare-fun e!765232 () Bool)

(assert (=> b!1344039 (= e!765232 tp_is_empty!37255)))

(declare-fun b!1344040 () Bool)

(declare-fun res!891362 () Bool)

(assert (=> b!1344040 (=> (not res!891362) (not e!765236))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344040 (= res!891362 (validKeyInArray!0 (select (arr!44188 _keys!1571) from!1960)))))

(declare-fun b!1344041 () Bool)

(declare-fun res!891363 () Bool)

(assert (=> b!1344041 (=> (not res!891363) (not e!765236))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1344041 (= res!891363 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44739 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344042 () Bool)

(declare-fun res!891365 () Bool)

(assert (=> b!1344042 (=> (not res!891365) (not e!765236))))

(declare-fun minValue!1245 () V!54777)

(declare-fun zeroValue!1245 () V!54777)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24140 0))(
  ( (tuple2!24141 (_1!12081 (_ BitVec 64)) (_2!12081 V!54777)) )
))
(declare-datatypes ((List!31288 0))(
  ( (Nil!31285) (Cons!31284 (h!32502 tuple2!24140) (t!45746 List!31288)) )
))
(declare-datatypes ((ListLongMap!21805 0))(
  ( (ListLongMap!21806 (toList!10918 List!31288)) )
))
(declare-fun contains!9106 (ListLongMap!21805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5864 (array!91473 array!91475 (_ BitVec 32) (_ BitVec 32) V!54777 V!54777 (_ BitVec 32) Int) ListLongMap!21805)

(assert (=> b!1344042 (= res!891365 (contains!9106 (getCurrentListMap!5864 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344043 () Bool)

(declare-fun res!891358 () Bool)

(assert (=> b!1344043 (=> (not res!891358) (not e!765236))))

(assert (=> b!1344043 (= res!891358 (and (= (size!44740 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44739 _keys!1571) (size!44740 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344044 () Bool)

(declare-fun e!765234 () Bool)

(assert (=> b!1344044 (= e!765234 tp_is_empty!37255)))

(declare-fun mapNonEmpty!57589 () Bool)

(declare-fun tp!109569 () Bool)

(assert (=> mapNonEmpty!57589 (= mapRes!57589 (and tp!109569 e!765232))))

(declare-fun mapRest!57589 () (Array (_ BitVec 32) ValueCell!17729))

(declare-fun mapValue!57589 () ValueCell!17729)

(declare-fun mapKey!57589 () (_ BitVec 32))

(assert (=> mapNonEmpty!57589 (= (arr!44189 _values!1303) (store mapRest!57589 mapKey!57589 mapValue!57589))))

(declare-fun b!1344045 () Bool)

(declare-fun res!891359 () Bool)

(assert (=> b!1344045 (=> (not res!891359) (not e!765236))))

(assert (=> b!1344045 (= res!891359 (not (= (select (arr!44188 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1344046 () Bool)

(assert (=> b!1344046 (= e!765236 (not true))))

(declare-fun lt!595079 () ListLongMap!21805)

(assert (=> b!1344046 (contains!9106 lt!595079 k0!1142)))

(declare-datatypes ((Unit!44008 0))(
  ( (Unit!44009) )
))
(declare-fun lt!595076 () Unit!44008)

(declare-fun lt!595077 () V!54777)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!360 ((_ BitVec 64) (_ BitVec 64) V!54777 ListLongMap!21805) Unit!44008)

(assert (=> b!1344046 (= lt!595076 (lemmaInListMapAfterAddingDiffThenInBefore!360 k0!1142 (select (arr!44188 _keys!1571) from!1960) lt!595077 lt!595079))))

(declare-fun lt!595078 () ListLongMap!21805)

(assert (=> b!1344046 (contains!9106 lt!595078 k0!1142)))

(declare-fun lt!595075 () Unit!44008)

(assert (=> b!1344046 (= lt!595075 (lemmaInListMapAfterAddingDiffThenInBefore!360 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595078))))

(declare-fun +!4834 (ListLongMap!21805 tuple2!24140) ListLongMap!21805)

(assert (=> b!1344046 (= lt!595078 (+!4834 lt!595079 (tuple2!24141 (select (arr!44188 _keys!1571) from!1960) lt!595077)))))

(declare-fun get!22328 (ValueCell!17729 V!54777) V!54777)

(declare-fun dynLambda!3788 (Int (_ BitVec 64)) V!54777)

(assert (=> b!1344046 (= lt!595077 (get!22328 (select (arr!44189 _values!1303) from!1960) (dynLambda!3788 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6483 (array!91473 array!91475 (_ BitVec 32) (_ BitVec 32) V!54777 V!54777 (_ BitVec 32) Int) ListLongMap!21805)

(assert (=> b!1344046 (= lt!595079 (getCurrentListMapNoExtraKeys!6483 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1344047 () Bool)

(declare-fun res!891357 () Bool)

(assert (=> b!1344047 (=> (not res!891357) (not e!765236))))

(declare-datatypes ((List!31289 0))(
  ( (Nil!31286) (Cons!31285 (h!32503 (_ BitVec 64)) (t!45747 List!31289)) )
))
(declare-fun arrayNoDuplicates!0 (array!91473 (_ BitVec 32) List!31289) Bool)

(assert (=> b!1344047 (= res!891357 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31286))))

(declare-fun b!1344048 () Bool)

(declare-fun res!891360 () Bool)

(assert (=> b!1344048 (=> (not res!891360) (not e!765236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91473 (_ BitVec 32)) Bool)

(assert (=> b!1344048 (= res!891360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344049 () Bool)

(assert (=> b!1344049 (= e!765235 (and e!765234 mapRes!57589))))

(declare-fun condMapEmpty!57589 () Bool)

(declare-fun mapDefault!57589 () ValueCell!17729)

(assert (=> b!1344049 (= condMapEmpty!57589 (= (arr!44189 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17729)) mapDefault!57589)))))

(assert (= (and start!113428 res!891364) b!1344043))

(assert (= (and b!1344043 res!891358) b!1344048))

(assert (= (and b!1344048 res!891360) b!1344047))

(assert (= (and b!1344047 res!891357) b!1344041))

(assert (= (and b!1344041 res!891363) b!1344042))

(assert (= (and b!1344042 res!891365) b!1344045))

(assert (= (and b!1344045 res!891359) b!1344040))

(assert (= (and b!1344040 res!891362) b!1344038))

(assert (= (and b!1344038 res!891361) b!1344046))

(assert (= (and b!1344049 condMapEmpty!57589) mapIsEmpty!57589))

(assert (= (and b!1344049 (not condMapEmpty!57589)) mapNonEmpty!57589))

(get-info :version)

(assert (= (and mapNonEmpty!57589 ((_ is ValueCellFull!17729) mapValue!57589)) b!1344039))

(assert (= (and b!1344049 ((_ is ValueCellFull!17729) mapDefault!57589)) b!1344044))

(assert (= start!113428 b!1344049))

(declare-fun b_lambda!24425 () Bool)

(assert (=> (not b_lambda!24425) (not b!1344046)))

(declare-fun t!45745 () Bool)

(declare-fun tb!12261 () Bool)

(assert (=> (and start!113428 (= defaultEntry!1306 defaultEntry!1306) t!45745) tb!12261))

(declare-fun result!25621 () Bool)

(assert (=> tb!12261 (= result!25621 tp_is_empty!37255)))

(assert (=> b!1344046 t!45745))

(declare-fun b_and!50421 () Bool)

(assert (= b_and!50419 (and (=> t!45745 result!25621) b_and!50421)))

(declare-fun m!1231959 () Bool)

(assert (=> b!1344046 m!1231959))

(declare-fun m!1231961 () Bool)

(assert (=> b!1344046 m!1231961))

(declare-fun m!1231963 () Bool)

(assert (=> b!1344046 m!1231963))

(declare-fun m!1231965 () Bool)

(assert (=> b!1344046 m!1231965))

(declare-fun m!1231967 () Bool)

(assert (=> b!1344046 m!1231967))

(declare-fun m!1231969 () Bool)

(assert (=> b!1344046 m!1231969))

(assert (=> b!1344046 m!1231963))

(assert (=> b!1344046 m!1231965))

(declare-fun m!1231971 () Bool)

(assert (=> b!1344046 m!1231971))

(declare-fun m!1231973 () Bool)

(assert (=> b!1344046 m!1231973))

(assert (=> b!1344046 m!1231971))

(declare-fun m!1231975 () Bool)

(assert (=> b!1344046 m!1231975))

(declare-fun m!1231977 () Bool)

(assert (=> b!1344046 m!1231977))

(declare-fun m!1231979 () Bool)

(assert (=> mapNonEmpty!57589 m!1231979))

(declare-fun m!1231981 () Bool)

(assert (=> b!1344047 m!1231981))

(assert (=> b!1344045 m!1231971))

(declare-fun m!1231983 () Bool)

(assert (=> b!1344048 m!1231983))

(assert (=> b!1344040 m!1231971))

(assert (=> b!1344040 m!1231971))

(declare-fun m!1231985 () Bool)

(assert (=> b!1344040 m!1231985))

(declare-fun m!1231987 () Bool)

(assert (=> b!1344042 m!1231987))

(assert (=> b!1344042 m!1231987))

(declare-fun m!1231989 () Bool)

(assert (=> b!1344042 m!1231989))

(declare-fun m!1231991 () Bool)

(assert (=> start!113428 m!1231991))

(declare-fun m!1231993 () Bool)

(assert (=> start!113428 m!1231993))

(declare-fun m!1231995 () Bool)

(assert (=> start!113428 m!1231995))

(check-sat (not b!1344047) (not mapNonEmpty!57589) (not b!1344042) (not start!113428) (not b_lambda!24425) (not b!1344040) (not b!1344048) (not b!1344046) b_and!50421 tp_is_empty!37255 (not b_next!31255))
(check-sat b_and!50421 (not b_next!31255))
