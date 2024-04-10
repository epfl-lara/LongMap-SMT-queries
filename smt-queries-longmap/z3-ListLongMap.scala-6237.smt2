; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79696 () Bool)

(assert start!79696)

(declare-fun b_free!17745 () Bool)

(declare-fun b_next!17745 () Bool)

(assert (=> start!79696 (= b_free!17745 (not b_next!17745))))

(declare-fun tp!61690 () Bool)

(declare-fun b_and!29081 () Bool)

(assert (=> start!79696 (= tp!61690 b_and!29081)))

(declare-fun b!937588 () Bool)

(declare-fun res!631015 () Bool)

(declare-fun e!526503 () Bool)

(assert (=> b!937588 (=> (not res!631015) (not e!526503))))

(declare-datatypes ((array!56446 0))(
  ( (array!56447 (arr!27163 (Array (_ BitVec 32) (_ BitVec 64))) (size!27622 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56446)

(declare-datatypes ((List!19149 0))(
  ( (Nil!19146) (Cons!19145 (h!20291 (_ BitVec 64)) (t!27438 List!19149)) )
))
(declare-fun arrayNoDuplicates!0 (array!56446 (_ BitVec 32) List!19149) Bool)

(assert (=> b!937588 (= res!631015 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19146))))

(declare-fun b!937589 () Bool)

(declare-fun e!526497 () Bool)

(declare-fun tp_is_empty!20253 () Bool)

(assert (=> b!937589 (= e!526497 tp_is_empty!20253)))

(declare-fun mapNonEmpty!32151 () Bool)

(declare-fun mapRes!32151 () Bool)

(declare-fun tp!61691 () Bool)

(declare-fun e!526506 () Bool)

(assert (=> mapNonEmpty!32151 (= mapRes!32151 (and tp!61691 e!526506))))

(declare-datatypes ((V!31969 0))(
  ( (V!31970 (val!10177 Int)) )
))
(declare-datatypes ((ValueCell!9645 0))(
  ( (ValueCellFull!9645 (v!12702 V!31969)) (EmptyCell!9645) )
))
(declare-fun mapRest!32151 () (Array (_ BitVec 32) ValueCell!9645))

(declare-fun mapValue!32151 () ValueCell!9645)

(declare-fun mapKey!32151 () (_ BitVec 32))

(declare-datatypes ((array!56448 0))(
  ( (array!56449 (arr!27164 (Array (_ BitVec 32) ValueCell!9645)) (size!27623 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56448)

(assert (=> mapNonEmpty!32151 (= (arr!27164 _values!1231) (store mapRest!32151 mapKey!32151 mapValue!32151))))

(declare-fun mapIsEmpty!32151 () Bool)

(assert (=> mapIsEmpty!32151 mapRes!32151))

(declare-fun b!937590 () Bool)

(assert (=> b!937590 (= e!526506 tp_is_empty!20253)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!526502 () Bool)

(declare-fun b!937591 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937591 (= e!526502 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937592 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!937592 (= e!526502 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937593 () Bool)

(declare-fun e!526501 () Bool)

(assert (=> b!937593 (= e!526501 (and e!526497 mapRes!32151))))

(declare-fun condMapEmpty!32151 () Bool)

(declare-fun mapDefault!32151 () ValueCell!9645)

(assert (=> b!937593 (= condMapEmpty!32151 (= (arr!27164 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9645)) mapDefault!32151)))))

(declare-fun b!937594 () Bool)

(declare-fun e!526504 () Bool)

(assert (=> b!937594 (= e!526503 e!526504)))

(declare-fun res!631016 () Bool)

(assert (=> b!937594 (=> (not res!631016) (not e!526504))))

(declare-datatypes ((tuple2!13370 0))(
  ( (tuple2!13371 (_1!6696 (_ BitVec 64)) (_2!6696 V!31969)) )
))
(declare-datatypes ((List!19150 0))(
  ( (Nil!19147) (Cons!19146 (h!20292 tuple2!13370) (t!27439 List!19150)) )
))
(declare-datatypes ((ListLongMap!12067 0))(
  ( (ListLongMap!12068 (toList!6049 List!19150)) )
))
(declare-fun lt!423130 () ListLongMap!12067)

(declare-fun contains!5108 (ListLongMap!12067 (_ BitVec 64)) Bool)

(assert (=> b!937594 (= res!631016 (contains!5108 lt!423130 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31969)

(declare-fun minValue!1173 () V!31969)

(declare-fun getCurrentListMap!3284 (array!56446 array!56448 (_ BitVec 32) (_ BitVec 32) V!31969 V!31969 (_ BitVec 32) Int) ListLongMap!12067)

(assert (=> b!937594 (= lt!423130 (getCurrentListMap!3284 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937595 () Bool)

(declare-fun e!526498 () Bool)

(assert (=> b!937595 (= e!526504 e!526498)))

(declare-fun res!631018 () Bool)

(assert (=> b!937595 (=> (not res!631018) (not e!526498))))

(declare-fun v!791 () V!31969)

(declare-fun lt!423124 () V!31969)

(assert (=> b!937595 (= res!631018 (and (= lt!423124 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!851 (ListLongMap!12067 (_ BitVec 64)) V!31969)

(assert (=> b!937595 (= lt!423124 (apply!851 lt!423130 k0!1099))))

(declare-fun b!937596 () Bool)

(declare-fun res!631019 () Bool)

(assert (=> b!937596 (=> (not res!631019) (not e!526503))))

(assert (=> b!937596 (= res!631019 (and (= (size!27623 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27622 _keys!1487) (size!27623 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937597 () Bool)

(declare-datatypes ((Unit!31660 0))(
  ( (Unit!31661) )
))
(declare-fun e!526500 () Unit!31660)

(declare-fun Unit!31662 () Unit!31660)

(assert (=> b!937597 (= e!526500 Unit!31662)))

(declare-fun b!937598 () Bool)

(assert (=> b!937598 (= e!526498 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27622 _keys!1487)))))

(declare-fun lt!423120 () Unit!31660)

(declare-fun e!526499 () Unit!31660)

(assert (=> b!937598 (= lt!423120 e!526499)))

(declare-fun c!97603 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937598 (= c!97603 (validKeyInArray!0 k0!1099))))

(declare-fun b!937599 () Bool)

(declare-fun res!631021 () Bool)

(assert (=> b!937599 (=> (not res!631021) (not e!526503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56446 (_ BitVec 32)) Bool)

(assert (=> b!937599 (= res!631021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937600 () Bool)

(assert (=> b!937600 (= e!526499 e!526500)))

(declare-fun lt!423129 () (_ BitVec 64))

(assert (=> b!937600 (= lt!423129 (select (arr!27163 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97604 () Bool)

(assert (=> b!937600 (= c!97604 (validKeyInArray!0 lt!423129))))

(declare-fun b!937601 () Bool)

(declare-fun Unit!31663 () Unit!31660)

(assert (=> b!937601 (= e!526499 Unit!31663)))

(declare-fun res!631020 () Bool)

(assert (=> start!79696 (=> (not res!631020) (not e!526503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79696 (= res!631020 (validMask!0 mask!1881))))

(assert (=> start!79696 e!526503))

(assert (=> start!79696 true))

(assert (=> start!79696 tp_is_empty!20253))

(declare-fun array_inv!21130 (array!56448) Bool)

(assert (=> start!79696 (and (array_inv!21130 _values!1231) e!526501)))

(assert (=> start!79696 tp!61690))

(declare-fun array_inv!21131 (array!56446) Bool)

(assert (=> start!79696 (array_inv!21131 _keys!1487)))

(declare-fun b!937602 () Bool)

(declare-fun lt!423128 () ListLongMap!12067)

(assert (=> b!937602 (= (apply!851 lt!423128 k0!1099) lt!423124)))

(declare-fun lt!423122 () Unit!31660)

(declare-fun lt!423126 () V!31969)

(declare-fun addApplyDifferent!437 (ListLongMap!12067 (_ BitVec 64) V!31969 (_ BitVec 64)) Unit!31660)

(assert (=> b!937602 (= lt!423122 (addApplyDifferent!437 lt!423130 lt!423129 lt!423126 k0!1099))))

(assert (=> b!937602 (not (= lt!423129 k0!1099))))

(declare-fun lt!423119 () Unit!31660)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56446 (_ BitVec 64) (_ BitVec 32) List!19149) Unit!31660)

(assert (=> b!937602 (= lt!423119 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19146))))

(assert (=> b!937602 e!526502))

(declare-fun c!97605 () Bool)

(assert (=> b!937602 (= c!97605 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423127 () Unit!31660)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!310 (array!56446 array!56448 (_ BitVec 32) (_ BitVec 32) V!31969 V!31969 (_ BitVec 64) (_ BitVec 32) Int) Unit!31660)

(assert (=> b!937602 (= lt!423127 (lemmaListMapContainsThenArrayContainsFrom!310 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!937602 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19146)))

(declare-fun lt!423123 () Unit!31660)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56446 (_ BitVec 32) (_ BitVec 32)) Unit!31660)

(assert (=> b!937602 (= lt!423123 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937602 (contains!5108 lt!423128 k0!1099)))

(declare-fun lt!423121 () tuple2!13370)

(declare-fun +!2838 (ListLongMap!12067 tuple2!13370) ListLongMap!12067)

(assert (=> b!937602 (= lt!423128 (+!2838 lt!423130 lt!423121))))

(declare-fun lt!423125 () Unit!31660)

(declare-fun addStillContains!557 (ListLongMap!12067 (_ BitVec 64) V!31969 (_ BitVec 64)) Unit!31660)

(assert (=> b!937602 (= lt!423125 (addStillContains!557 lt!423130 lt!423129 lt!423126 k0!1099))))

(assert (=> b!937602 (= (getCurrentListMap!3284 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2838 (getCurrentListMap!3284 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423121))))

(assert (=> b!937602 (= lt!423121 (tuple2!13371 lt!423129 lt!423126))))

(declare-fun get!14324 (ValueCell!9645 V!31969) V!31969)

(declare-fun dynLambda!1627 (Int (_ BitVec 64)) V!31969)

(assert (=> b!937602 (= lt!423126 (get!14324 (select (arr!27164 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1627 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423131 () Unit!31660)

(declare-fun lemmaListMapRecursiveValidKeyArray!228 (array!56446 array!56448 (_ BitVec 32) (_ BitVec 32) V!31969 V!31969 (_ BitVec 32) Int) Unit!31660)

(assert (=> b!937602 (= lt!423131 (lemmaListMapRecursiveValidKeyArray!228 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!937602 (= e!526500 lt!423122)))

(declare-fun b!937603 () Bool)

(declare-fun res!631017 () Bool)

(assert (=> b!937603 (=> (not res!631017) (not e!526503))))

(assert (=> b!937603 (= res!631017 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27622 _keys!1487))))))

(assert (= (and start!79696 res!631020) b!937596))

(assert (= (and b!937596 res!631019) b!937599))

(assert (= (and b!937599 res!631021) b!937588))

(assert (= (and b!937588 res!631015) b!937603))

(assert (= (and b!937603 res!631017) b!937594))

(assert (= (and b!937594 res!631016) b!937595))

(assert (= (and b!937595 res!631018) b!937598))

(assert (= (and b!937598 c!97603) b!937600))

(assert (= (and b!937598 (not c!97603)) b!937601))

(assert (= (and b!937600 c!97604) b!937602))

(assert (= (and b!937600 (not c!97604)) b!937597))

(assert (= (and b!937602 c!97605) b!937591))

(assert (= (and b!937602 (not c!97605)) b!937592))

(assert (= (and b!937593 condMapEmpty!32151) mapIsEmpty!32151))

(assert (= (and b!937593 (not condMapEmpty!32151)) mapNonEmpty!32151))

(get-info :version)

(assert (= (and mapNonEmpty!32151 ((_ is ValueCellFull!9645) mapValue!32151)) b!937590))

(assert (= (and b!937593 ((_ is ValueCellFull!9645) mapDefault!32151)) b!937589))

(assert (= start!79696 b!937593))

(declare-fun b_lambda!14151 () Bool)

(assert (=> (not b_lambda!14151) (not b!937602)))

(declare-fun t!27437 () Bool)

(declare-fun tb!6139 () Bool)

(assert (=> (and start!79696 (= defaultEntry!1235 defaultEntry!1235) t!27437) tb!6139))

(declare-fun result!12111 () Bool)

(assert (=> tb!6139 (= result!12111 tp_is_empty!20253)))

(assert (=> b!937602 t!27437))

(declare-fun b_and!29083 () Bool)

(assert (= b_and!29081 (and (=> t!27437 result!12111) b_and!29083)))

(declare-fun m!872375 () Bool)

(assert (=> start!79696 m!872375))

(declare-fun m!872377 () Bool)

(assert (=> start!79696 m!872377))

(declare-fun m!872379 () Bool)

(assert (=> start!79696 m!872379))

(declare-fun m!872381 () Bool)

(assert (=> b!937594 m!872381))

(declare-fun m!872383 () Bool)

(assert (=> b!937594 m!872383))

(declare-fun m!872385 () Bool)

(assert (=> b!937599 m!872385))

(declare-fun m!872387 () Bool)

(assert (=> b!937591 m!872387))

(declare-fun m!872389 () Bool)

(assert (=> b!937588 m!872389))

(declare-fun m!872391 () Bool)

(assert (=> b!937600 m!872391))

(declare-fun m!872393 () Bool)

(assert (=> b!937600 m!872393))

(declare-fun m!872395 () Bool)

(assert (=> b!937602 m!872395))

(declare-fun m!872397 () Bool)

(assert (=> b!937602 m!872397))

(declare-fun m!872399 () Bool)

(assert (=> b!937602 m!872399))

(declare-fun m!872401 () Bool)

(assert (=> b!937602 m!872401))

(declare-fun m!872403 () Bool)

(assert (=> b!937602 m!872403))

(declare-fun m!872405 () Bool)

(assert (=> b!937602 m!872405))

(declare-fun m!872407 () Bool)

(assert (=> b!937602 m!872407))

(declare-fun m!872409 () Bool)

(assert (=> b!937602 m!872409))

(assert (=> b!937602 m!872407))

(assert (=> b!937602 m!872409))

(declare-fun m!872411 () Bool)

(assert (=> b!937602 m!872411))

(declare-fun m!872413 () Bool)

(assert (=> b!937602 m!872413))

(declare-fun m!872415 () Bool)

(assert (=> b!937602 m!872415))

(declare-fun m!872417 () Bool)

(assert (=> b!937602 m!872417))

(declare-fun m!872419 () Bool)

(assert (=> b!937602 m!872419))

(assert (=> b!937602 m!872397))

(declare-fun m!872421 () Bool)

(assert (=> b!937602 m!872421))

(declare-fun m!872423 () Bool)

(assert (=> b!937602 m!872423))

(declare-fun m!872425 () Bool)

(assert (=> b!937602 m!872425))

(declare-fun m!872427 () Bool)

(assert (=> b!937595 m!872427))

(declare-fun m!872429 () Bool)

(assert (=> mapNonEmpty!32151 m!872429))

(declare-fun m!872431 () Bool)

(assert (=> b!937598 m!872431))

(check-sat b_and!29083 (not b!937599) (not b!937602) (not b_lambda!14151) (not b!937595) (not b_next!17745) (not start!79696) (not b!937594) (not b!937598) (not b!937600) (not b!937591) (not b!937588) tp_is_empty!20253 (not mapNonEmpty!32151))
(check-sat b_and!29083 (not b_next!17745))
