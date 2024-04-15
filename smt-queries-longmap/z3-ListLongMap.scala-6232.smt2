; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79646 () Bool)

(assert start!79646)

(declare-fun b_free!17713 () Bool)

(declare-fun b_next!17713 () Bool)

(assert (=> start!79646 (= b_free!17713 (not b_next!17713))))

(declare-fun tp!61595 () Bool)

(declare-fun b_and!28991 () Bool)

(assert (=> start!79646 (= tp!61595 b_and!28991)))

(declare-fun b!936549 () Bool)

(declare-fun res!630572 () Bool)

(declare-fun e!525876 () Bool)

(assert (=> b!936549 (=> (not res!630572) (not e!525876))))

(declare-datatypes ((array!56349 0))(
  ( (array!56350 (arr!27115 (Array (_ BitVec 32) (_ BitVec 64))) (size!27576 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56349)

(declare-datatypes ((List!19145 0))(
  ( (Nil!19142) (Cons!19141 (h!20287 (_ BitVec 64)) (t!27393 List!19145)) )
))
(declare-fun arrayNoDuplicates!0 (array!56349 (_ BitVec 32) List!19145) Bool)

(assert (=> b!936549 (= res!630572 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19142))))

(declare-fun b!936550 () Bool)

(declare-datatypes ((Unit!31507 0))(
  ( (Unit!31508) )
))
(declare-fun e!525870 () Unit!31507)

(declare-fun Unit!31509 () Unit!31507)

(assert (=> b!936550 (= e!525870 Unit!31509)))

(declare-fun b!936551 () Bool)

(declare-fun res!630571 () Bool)

(assert (=> b!936551 (=> (not res!630571) (not e!525876))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56349 (_ BitVec 32)) Bool)

(assert (=> b!936551 (= res!630571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936552 () Bool)

(declare-fun e!525878 () Bool)

(assert (=> b!936552 (= e!525878 false)))

(declare-fun lt!422267 () Unit!31507)

(declare-fun e!525875 () Unit!31507)

(assert (=> b!936552 (= lt!422267 e!525875)))

(declare-fun c!97395 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936552 (= c!97395 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!32103 () Bool)

(declare-fun mapRes!32103 () Bool)

(assert (=> mapIsEmpty!32103 mapRes!32103))

(declare-fun b!936553 () Bool)

(declare-fun e!525871 () Bool)

(declare-fun e!525872 () Bool)

(assert (=> b!936553 (= e!525871 (and e!525872 mapRes!32103))))

(declare-fun condMapEmpty!32103 () Bool)

(declare-datatypes ((V!31927 0))(
  ( (V!31928 (val!10161 Int)) )
))
(declare-datatypes ((ValueCell!9629 0))(
  ( (ValueCellFull!9629 (v!12685 V!31927)) (EmptyCell!9629) )
))
(declare-datatypes ((array!56351 0))(
  ( (array!56352 (arr!27116 (Array (_ BitVec 32) ValueCell!9629)) (size!27577 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56351)

(declare-fun mapDefault!32103 () ValueCell!9629)

(assert (=> b!936553 (= condMapEmpty!32103 (= (arr!27116 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9629)) mapDefault!32103)))))

(declare-fun mapNonEmpty!32103 () Bool)

(declare-fun tp!61596 () Bool)

(declare-fun e!525873 () Bool)

(assert (=> mapNonEmpty!32103 (= mapRes!32103 (and tp!61596 e!525873))))

(declare-fun mapRest!32103 () (Array (_ BitVec 32) ValueCell!9629))

(declare-fun mapValue!32103 () ValueCell!9629)

(declare-fun mapKey!32103 () (_ BitVec 32))

(assert (=> mapNonEmpty!32103 (= (arr!27116 _values!1231) (store mapRest!32103 mapKey!32103 mapValue!32103))))

(declare-fun res!630570 () Bool)

(assert (=> start!79646 (=> (not res!630570) (not e!525876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79646 (= res!630570 (validMask!0 mask!1881))))

(assert (=> start!79646 e!525876))

(assert (=> start!79646 true))

(declare-fun tp_is_empty!20221 () Bool)

(assert (=> start!79646 tp_is_empty!20221))

(declare-fun array_inv!21160 (array!56351) Bool)

(assert (=> start!79646 (and (array_inv!21160 _values!1231) e!525871)))

(assert (=> start!79646 tp!61595))

(declare-fun array_inv!21161 (array!56349) Bool)

(assert (=> start!79646 (array_inv!21161 _keys!1487)))

(declare-fun b!936554 () Bool)

(declare-fun res!630573 () Bool)

(assert (=> b!936554 (=> (not res!630573) (not e!525876))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!936554 (= res!630573 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27576 _keys!1487))))))

(declare-fun b!936555 () Bool)

(declare-datatypes ((tuple2!13400 0))(
  ( (tuple2!13401 (_1!6711 (_ BitVec 64)) (_2!6711 V!31927)) )
))
(declare-datatypes ((List!19146 0))(
  ( (Nil!19143) (Cons!19142 (h!20288 tuple2!13400) (t!27394 List!19146)) )
))
(declare-datatypes ((ListLongMap!12087 0))(
  ( (ListLongMap!12088 (toList!6059 List!19146)) )
))
(declare-fun lt!422260 () ListLongMap!12087)

(declare-fun lt!422263 () V!31927)

(declare-fun apply!834 (ListLongMap!12087 (_ BitVec 64)) V!31927)

(assert (=> b!936555 (= (apply!834 lt!422260 k0!1099) lt!422263)))

(declare-fun lt!422269 () V!31927)

(declare-fun lt!422266 () ListLongMap!12087)

(declare-fun lt!422270 () Unit!31507)

(declare-fun lt!422261 () (_ BitVec 64))

(declare-fun addApplyDifferent!420 (ListLongMap!12087 (_ BitVec 64) V!31927 (_ BitVec 64)) Unit!31507)

(assert (=> b!936555 (= lt!422270 (addApplyDifferent!420 lt!422266 lt!422261 lt!422269 k0!1099))))

(assert (=> b!936555 (not (= lt!422261 k0!1099))))

(declare-fun lt!422271 () Unit!31507)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56349 (_ BitVec 64) (_ BitVec 32) List!19145) Unit!31507)

(assert (=> b!936555 (= lt!422271 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19142))))

(declare-fun e!525869 () Bool)

(assert (=> b!936555 e!525869))

(declare-fun c!97394 () Bool)

(assert (=> b!936555 (= c!97394 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun lt!422265 () Unit!31507)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31927)

(declare-fun minValue!1173 () V!31927)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!298 (array!56349 array!56351 (_ BitVec 32) (_ BitVec 32) V!31927 V!31927 (_ BitVec 64) (_ BitVec 32) Int) Unit!31507)

(assert (=> b!936555 (= lt!422265 (lemmaListMapContainsThenArrayContainsFrom!298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!936555 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19142)))

(declare-fun lt!422262 () Unit!31507)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56349 (_ BitVec 32) (_ BitVec 32)) Unit!31507)

(assert (=> b!936555 (= lt!422262 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5062 (ListLongMap!12087 (_ BitVec 64)) Bool)

(assert (=> b!936555 (contains!5062 lt!422260 k0!1099)))

(declare-fun lt!422259 () tuple2!13400)

(declare-fun +!2851 (ListLongMap!12087 tuple2!13400) ListLongMap!12087)

(assert (=> b!936555 (= lt!422260 (+!2851 lt!422266 lt!422259))))

(declare-fun lt!422268 () Unit!31507)

(declare-fun addStillContains!540 (ListLongMap!12087 (_ BitVec 64) V!31927 (_ BitVec 64)) Unit!31507)

(assert (=> b!936555 (= lt!422268 (addStillContains!540 lt!422266 lt!422261 lt!422269 k0!1099))))

(declare-fun getCurrentListMap!3224 (array!56349 array!56351 (_ BitVec 32) (_ BitVec 32) V!31927 V!31927 (_ BitVec 32) Int) ListLongMap!12087)

(assert (=> b!936555 (= (getCurrentListMap!3224 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2851 (getCurrentListMap!3224 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422259))))

(assert (=> b!936555 (= lt!422259 (tuple2!13401 lt!422261 lt!422269))))

(declare-fun get!14299 (ValueCell!9629 V!31927) V!31927)

(declare-fun dynLambda!1607 (Int (_ BitVec 64)) V!31927)

(assert (=> b!936555 (= lt!422269 (get!14299 (select (arr!27116 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1607 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422264 () Unit!31507)

(declare-fun lemmaListMapRecursiveValidKeyArray!215 (array!56349 array!56351 (_ BitVec 32) (_ BitVec 32) V!31927 V!31927 (_ BitVec 32) Int) Unit!31507)

(assert (=> b!936555 (= lt!422264 (lemmaListMapRecursiveValidKeyArray!215 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!936555 (= e!525870 lt!422270)))

(declare-fun b!936556 () Bool)

(declare-fun Unit!31510 () Unit!31507)

(assert (=> b!936556 (= e!525875 Unit!31510)))

(declare-fun b!936557 () Bool)

(assert (=> b!936557 (= e!525872 tp_is_empty!20221)))

(declare-fun b!936558 () Bool)

(declare-fun e!525874 () Bool)

(assert (=> b!936558 (= e!525874 e!525878)))

(declare-fun res!630575 () Bool)

(assert (=> b!936558 (=> (not res!630575) (not e!525878))))

(declare-fun v!791 () V!31927)

(assert (=> b!936558 (= res!630575 (and (= lt!422263 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!936558 (= lt!422263 (apply!834 lt!422266 k0!1099))))

(declare-fun b!936559 () Bool)

(assert (=> b!936559 (= e!525875 e!525870)))

(assert (=> b!936559 (= lt!422261 (select (arr!27115 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97396 () Bool)

(assert (=> b!936559 (= c!97396 (validKeyInArray!0 lt!422261))))

(declare-fun b!936560 () Bool)

(declare-fun arrayContainsKey!0 (array!56349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936560 (= e!525869 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!936561 () Bool)

(declare-fun res!630574 () Bool)

(assert (=> b!936561 (=> (not res!630574) (not e!525876))))

(assert (=> b!936561 (= res!630574 (and (= (size!27577 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27576 _keys!1487) (size!27577 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936562 () Bool)

(assert (=> b!936562 (= e!525869 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936563 () Bool)

(assert (=> b!936563 (= e!525876 e!525874)))

(declare-fun res!630569 () Bool)

(assert (=> b!936563 (=> (not res!630569) (not e!525874))))

(assert (=> b!936563 (= res!630569 (contains!5062 lt!422266 k0!1099))))

(assert (=> b!936563 (= lt!422266 (getCurrentListMap!3224 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936564 () Bool)

(assert (=> b!936564 (= e!525873 tp_is_empty!20221)))

(assert (= (and start!79646 res!630570) b!936561))

(assert (= (and b!936561 res!630574) b!936551))

(assert (= (and b!936551 res!630571) b!936549))

(assert (= (and b!936549 res!630572) b!936554))

(assert (= (and b!936554 res!630573) b!936563))

(assert (= (and b!936563 res!630569) b!936558))

(assert (= (and b!936558 res!630575) b!936552))

(assert (= (and b!936552 c!97395) b!936559))

(assert (= (and b!936552 (not c!97395)) b!936556))

(assert (= (and b!936559 c!97396) b!936555))

(assert (= (and b!936559 (not c!97396)) b!936550))

(assert (= (and b!936555 c!97394) b!936560))

(assert (= (and b!936555 (not c!97394)) b!936562))

(assert (= (and b!936553 condMapEmpty!32103) mapIsEmpty!32103))

(assert (= (and b!936553 (not condMapEmpty!32103)) mapNonEmpty!32103))

(get-info :version)

(assert (= (and mapNonEmpty!32103 ((_ is ValueCellFull!9629) mapValue!32103)) b!936564))

(assert (= (and b!936553 ((_ is ValueCellFull!9629) mapDefault!32103)) b!936557))

(assert (= start!79646 b!936553))

(declare-fun b_lambda!14101 () Bool)

(assert (=> (not b_lambda!14101) (not b!936555)))

(declare-fun t!27392 () Bool)

(declare-fun tb!6099 () Bool)

(assert (=> (and start!79646 (= defaultEntry!1235 defaultEntry!1235) t!27392) tb!6099))

(declare-fun result!12039 () Bool)

(assert (=> tb!6099 (= result!12039 tp_is_empty!20221)))

(assert (=> b!936555 t!27392))

(declare-fun b_and!28993 () Bool)

(assert (= b_and!28991 (and (=> t!27392 result!12039) b_and!28993)))

(declare-fun m!870689 () Bool)

(assert (=> b!936552 m!870689))

(declare-fun m!870691 () Bool)

(assert (=> b!936549 m!870691))

(declare-fun m!870693 () Bool)

(assert (=> b!936560 m!870693))

(declare-fun m!870695 () Bool)

(assert (=> b!936551 m!870695))

(declare-fun m!870697 () Bool)

(assert (=> mapNonEmpty!32103 m!870697))

(declare-fun m!870699 () Bool)

(assert (=> b!936559 m!870699))

(declare-fun m!870701 () Bool)

(assert (=> b!936559 m!870701))

(declare-fun m!870703 () Bool)

(assert (=> b!936555 m!870703))

(declare-fun m!870705 () Bool)

(assert (=> b!936555 m!870705))

(declare-fun m!870707 () Bool)

(assert (=> b!936555 m!870707))

(declare-fun m!870709 () Bool)

(assert (=> b!936555 m!870709))

(declare-fun m!870711 () Bool)

(assert (=> b!936555 m!870711))

(declare-fun m!870713 () Bool)

(assert (=> b!936555 m!870713))

(declare-fun m!870715 () Bool)

(assert (=> b!936555 m!870715))

(declare-fun m!870717 () Bool)

(assert (=> b!936555 m!870717))

(declare-fun m!870719 () Bool)

(assert (=> b!936555 m!870719))

(declare-fun m!870721 () Bool)

(assert (=> b!936555 m!870721))

(declare-fun m!870723 () Bool)

(assert (=> b!936555 m!870723))

(declare-fun m!870725 () Bool)

(assert (=> b!936555 m!870725))

(declare-fun m!870727 () Bool)

(assert (=> b!936555 m!870727))

(assert (=> b!936555 m!870707))

(assert (=> b!936555 m!870713))

(declare-fun m!870729 () Bool)

(assert (=> b!936555 m!870729))

(assert (=> b!936555 m!870709))

(declare-fun m!870731 () Bool)

(assert (=> b!936555 m!870731))

(declare-fun m!870733 () Bool)

(assert (=> b!936555 m!870733))

(declare-fun m!870735 () Bool)

(assert (=> b!936558 m!870735))

(declare-fun m!870737 () Bool)

(assert (=> b!936563 m!870737))

(declare-fun m!870739 () Bool)

(assert (=> b!936563 m!870739))

(declare-fun m!870741 () Bool)

(assert (=> start!79646 m!870741))

(declare-fun m!870743 () Bool)

(assert (=> start!79646 m!870743))

(declare-fun m!870745 () Bool)

(assert (=> start!79646 m!870745))

(check-sat (not b!936558) (not start!79646) b_and!28993 (not b!936551) (not b!936560) (not b_next!17713) (not b!936552) (not b!936549) tp_is_empty!20221 (not b_lambda!14101) (not mapNonEmpty!32103) (not b!936563) (not b!936559) (not b!936555))
(check-sat b_and!28993 (not b_next!17713))
