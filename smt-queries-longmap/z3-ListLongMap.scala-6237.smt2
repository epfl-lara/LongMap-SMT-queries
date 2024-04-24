; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79862 () Bool)

(assert start!79862)

(declare-fun b_free!17743 () Bool)

(declare-fun b_next!17743 () Bool)

(assert (=> start!79862 (= b_free!17743 (not b_next!17743))))

(declare-fun tp!61685 () Bool)

(declare-fun b_and!29087 () Bool)

(assert (=> start!79862 (= tp!61685 b_and!29087)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun e!527055 () Bool)

(declare-fun b!938441 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!56491 0))(
  ( (array!56492 (arr!27181 (Array (_ BitVec 32) (_ BitVec 64))) (size!27641 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56491)

(declare-fun arrayContainsKey!0 (array!56491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!938441 (= e!527055 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun res!631341 () Bool)

(declare-fun e!527049 () Bool)

(assert (=> start!79862 (=> (not res!631341) (not e!527049))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79862 (= res!631341 (validMask!0 mask!1881))))

(assert (=> start!79862 e!527049))

(assert (=> start!79862 true))

(declare-fun tp_is_empty!20251 () Bool)

(assert (=> start!79862 tp_is_empty!20251))

(declare-datatypes ((V!31967 0))(
  ( (V!31968 (val!10176 Int)) )
))
(declare-datatypes ((ValueCell!9644 0))(
  ( (ValueCellFull!9644 (v!12698 V!31967)) (EmptyCell!9644) )
))
(declare-datatypes ((array!56493 0))(
  ( (array!56494 (arr!27182 (Array (_ BitVec 32) ValueCell!9644)) (size!27642 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56493)

(declare-fun e!527056 () Bool)

(declare-fun array_inv!21228 (array!56493) Bool)

(assert (=> start!79862 (and (array_inv!21228 _values!1231) e!527056)))

(assert (=> start!79862 tp!61685))

(declare-fun array_inv!21229 (array!56491) Bool)

(assert (=> start!79862 (array_inv!21229 _keys!1487)))

(declare-fun b!938442 () Bool)

(declare-datatypes ((Unit!31637 0))(
  ( (Unit!31638) )
))
(declare-fun e!527058 () Unit!31637)

(declare-fun e!527053 () Unit!31637)

(assert (=> b!938442 (= e!527058 e!527053)))

(declare-fun lt!423445 () (_ BitVec 64))

(assert (=> b!938442 (= lt!423445 (select (arr!27181 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97878 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!938442 (= c!97878 (validKeyInArray!0 lt!423445))))

(declare-fun b!938443 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!938443 (= e!527055 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!938444 () Bool)

(declare-fun res!631339 () Bool)

(assert (=> b!938444 (=> (not res!631339) (not e!527049))))

(declare-datatypes ((List!19134 0))(
  ( (Nil!19131) (Cons!19130 (h!20282 (_ BitVec 64)) (t!27413 List!19134)) )
))
(declare-fun arrayNoDuplicates!0 (array!56491 (_ BitVec 32) List!19134) Bool)

(assert (=> b!938444 (= res!631339 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19131))))

(declare-fun b!938445 () Bool)

(declare-fun Unit!31639 () Unit!31637)

(assert (=> b!938445 (= e!527053 Unit!31639)))

(declare-fun mapIsEmpty!32148 () Bool)

(declare-fun mapRes!32148 () Bool)

(assert (=> mapIsEmpty!32148 mapRes!32148))

(declare-fun b!938446 () Bool)

(declare-fun e!527054 () Bool)

(assert (=> b!938446 (= e!527049 e!527054)))

(declare-fun res!631344 () Bool)

(assert (=> b!938446 (=> (not res!631344) (not e!527054))))

(declare-datatypes ((tuple2!13354 0))(
  ( (tuple2!13355 (_1!6688 (_ BitVec 64)) (_2!6688 V!31967)) )
))
(declare-datatypes ((List!19135 0))(
  ( (Nil!19132) (Cons!19131 (h!20283 tuple2!13354) (t!27414 List!19135)) )
))
(declare-datatypes ((ListLongMap!12053 0))(
  ( (ListLongMap!12054 (toList!6042 List!19135)) )
))
(declare-fun lt!423441 () ListLongMap!12053)

(declare-fun contains!5113 (ListLongMap!12053 (_ BitVec 64)) Bool)

(assert (=> b!938446 (= res!631344 (contains!5113 lt!423441 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31967)

(declare-fun minValue!1173 () V!31967)

(declare-fun getCurrentListMap!3278 (array!56491 array!56493 (_ BitVec 32) (_ BitVec 32) V!31967 V!31967 (_ BitVec 32) Int) ListLongMap!12053)

(assert (=> b!938446 (= lt!423441 (getCurrentListMap!3278 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!938447 () Bool)

(declare-fun res!631343 () Bool)

(assert (=> b!938447 (=> (not res!631343) (not e!527049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56491 (_ BitVec 32)) Bool)

(assert (=> b!938447 (= res!631343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!938448 () Bool)

(declare-fun res!631338 () Bool)

(assert (=> b!938448 (=> (not res!631338) (not e!527049))))

(assert (=> b!938448 (= res!631338 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27641 _keys!1487))))))

(declare-fun b!938449 () Bool)

(declare-fun res!631342 () Bool)

(assert (=> b!938449 (=> (not res!631342) (not e!527049))))

(assert (=> b!938449 (= res!631342 (and (= (size!27642 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27641 _keys!1487) (size!27642 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!938450 () Bool)

(declare-fun e!527052 () Bool)

(assert (=> b!938450 (= e!527052 tp_is_empty!20251)))

(declare-fun b!938451 () Bool)

(declare-fun e!527051 () Bool)

(assert (=> b!938451 (= e!527051 tp_is_empty!20251)))

(declare-fun b!938452 () Bool)

(declare-fun e!527057 () Bool)

(assert (=> b!938452 (= e!527057 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27641 _keys!1487)))))

(declare-fun lt!423442 () Unit!31637)

(assert (=> b!938452 (= lt!423442 e!527058)))

(declare-fun c!97876 () Bool)

(assert (=> b!938452 (= c!97876 (validKeyInArray!0 k0!1099))))

(declare-fun b!938453 () Bool)

(declare-fun Unit!31640 () Unit!31637)

(assert (=> b!938453 (= e!527058 Unit!31640)))

(declare-fun mapNonEmpty!32148 () Bool)

(declare-fun tp!61686 () Bool)

(assert (=> mapNonEmpty!32148 (= mapRes!32148 (and tp!61686 e!527052))))

(declare-fun mapKey!32148 () (_ BitVec 32))

(declare-fun mapRest!32148 () (Array (_ BitVec 32) ValueCell!9644))

(declare-fun mapValue!32148 () ValueCell!9644)

(assert (=> mapNonEmpty!32148 (= (arr!27182 _values!1231) (store mapRest!32148 mapKey!32148 mapValue!32148))))

(declare-fun b!938454 () Bool)

(assert (=> b!938454 (= e!527056 (and e!527051 mapRes!32148))))

(declare-fun condMapEmpty!32148 () Bool)

(declare-fun mapDefault!32148 () ValueCell!9644)

(assert (=> b!938454 (= condMapEmpty!32148 (= (arr!27182 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9644)) mapDefault!32148)))))

(declare-fun b!938455 () Bool)

(assert (=> b!938455 (= e!527054 e!527057)))

(declare-fun res!631340 () Bool)

(assert (=> b!938455 (=> (not res!631340) (not e!527057))))

(declare-fun lt!423450 () V!31967)

(declare-fun v!791 () V!31967)

(assert (=> b!938455 (= res!631340 (and (= lt!423450 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!859 (ListLongMap!12053 (_ BitVec 64)) V!31967)

(assert (=> b!938455 (= lt!423450 (apply!859 lt!423441 k0!1099))))

(declare-fun b!938456 () Bool)

(declare-fun lt!423448 () ListLongMap!12053)

(assert (=> b!938456 (= (apply!859 lt!423448 k0!1099) lt!423450)))

(declare-fun lt!423449 () V!31967)

(declare-fun lt!423452 () Unit!31637)

(declare-fun addApplyDifferent!435 (ListLongMap!12053 (_ BitVec 64) V!31967 (_ BitVec 64)) Unit!31637)

(assert (=> b!938456 (= lt!423452 (addApplyDifferent!435 lt!423441 lt!423445 lt!423449 k0!1099))))

(assert (=> b!938456 (not (= lt!423445 k0!1099))))

(declare-fun lt!423447 () Unit!31637)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56491 (_ BitVec 64) (_ BitVec 32) List!19134) Unit!31637)

(assert (=> b!938456 (= lt!423447 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19131))))

(assert (=> b!938456 e!527055))

(declare-fun c!97877 () Bool)

(assert (=> b!938456 (= c!97877 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423453 () Unit!31637)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!305 (array!56491 array!56493 (_ BitVec 32) (_ BitVec 32) V!31967 V!31967 (_ BitVec 64) (_ BitVec 32) Int) Unit!31637)

(assert (=> b!938456 (= lt!423453 (lemmaListMapContainsThenArrayContainsFrom!305 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!938456 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19131)))

(declare-fun lt!423451 () Unit!31637)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56491 (_ BitVec 32) (_ BitVec 32)) Unit!31637)

(assert (=> b!938456 (= lt!423451 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!938456 (contains!5113 lt!423448 k0!1099)))

(declare-fun lt!423443 () tuple2!13354)

(declare-fun +!2851 (ListLongMap!12053 tuple2!13354) ListLongMap!12053)

(assert (=> b!938456 (= lt!423448 (+!2851 lt!423441 lt!423443))))

(declare-fun lt!423446 () Unit!31637)

(declare-fun addStillContains!554 (ListLongMap!12053 (_ BitVec 64) V!31967 (_ BitVec 64)) Unit!31637)

(assert (=> b!938456 (= lt!423446 (addStillContains!554 lt!423441 lt!423445 lt!423449 k0!1099))))

(assert (=> b!938456 (= (getCurrentListMap!3278 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2851 (getCurrentListMap!3278 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423443))))

(assert (=> b!938456 (= lt!423443 (tuple2!13355 lt!423445 lt!423449))))

(declare-fun get!14349 (ValueCell!9644 V!31967) V!31967)

(declare-fun dynLambda!1648 (Int (_ BitVec 64)) V!31967)

(assert (=> b!938456 (= lt!423449 (get!14349 (select (arr!27182 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1648 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423444 () Unit!31637)

(declare-fun lemmaListMapRecursiveValidKeyArray!231 (array!56491 array!56493 (_ BitVec 32) (_ BitVec 32) V!31967 V!31967 (_ BitVec 32) Int) Unit!31637)

(assert (=> b!938456 (= lt!423444 (lemmaListMapRecursiveValidKeyArray!231 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!938456 (= e!527053 lt!423452)))

(assert (= (and start!79862 res!631341) b!938449))

(assert (= (and b!938449 res!631342) b!938447))

(assert (= (and b!938447 res!631343) b!938444))

(assert (= (and b!938444 res!631339) b!938448))

(assert (= (and b!938448 res!631338) b!938446))

(assert (= (and b!938446 res!631344) b!938455))

(assert (= (and b!938455 res!631340) b!938452))

(assert (= (and b!938452 c!97876) b!938442))

(assert (= (and b!938452 (not c!97876)) b!938453))

(assert (= (and b!938442 c!97878) b!938456))

(assert (= (and b!938442 (not c!97878)) b!938445))

(assert (= (and b!938456 c!97877) b!938441))

(assert (= (and b!938456 (not c!97877)) b!938443))

(assert (= (and b!938454 condMapEmpty!32148) mapIsEmpty!32148))

(assert (= (and b!938454 (not condMapEmpty!32148)) mapNonEmpty!32148))

(get-info :version)

(assert (= (and mapNonEmpty!32148 ((_ is ValueCellFull!9644) mapValue!32148)) b!938450))

(assert (= (and b!938454 ((_ is ValueCellFull!9644) mapDefault!32148)) b!938451))

(assert (= start!79862 b!938454))

(declare-fun b_lambda!14163 () Bool)

(assert (=> (not b_lambda!14163) (not b!938456)))

(declare-fun t!27412 () Bool)

(declare-fun tb!6129 () Bool)

(assert (=> (and start!79862 (= defaultEntry!1235 defaultEntry!1235) t!27412) tb!6129))

(declare-fun result!12099 () Bool)

(assert (=> tb!6129 (= result!12099 tp_is_empty!20251)))

(assert (=> b!938456 t!27412))

(declare-fun b_and!29089 () Bool)

(assert (= b_and!29087 (and (=> t!27412 result!12099) b_and!29089)))

(declare-fun m!873611 () Bool)

(assert (=> b!938456 m!873611))

(declare-fun m!873613 () Bool)

(assert (=> b!938456 m!873613))

(declare-fun m!873615 () Bool)

(assert (=> b!938456 m!873615))

(declare-fun m!873617 () Bool)

(assert (=> b!938456 m!873617))

(declare-fun m!873619 () Bool)

(assert (=> b!938456 m!873619))

(declare-fun m!873621 () Bool)

(assert (=> b!938456 m!873621))

(declare-fun m!873623 () Bool)

(assert (=> b!938456 m!873623))

(declare-fun m!873625 () Bool)

(assert (=> b!938456 m!873625))

(assert (=> b!938456 m!873617))

(assert (=> b!938456 m!873619))

(declare-fun m!873627 () Bool)

(assert (=> b!938456 m!873627))

(declare-fun m!873629 () Bool)

(assert (=> b!938456 m!873629))

(declare-fun m!873631 () Bool)

(assert (=> b!938456 m!873631))

(declare-fun m!873633 () Bool)

(assert (=> b!938456 m!873633))

(declare-fun m!873635 () Bool)

(assert (=> b!938456 m!873635))

(declare-fun m!873637 () Bool)

(assert (=> b!938456 m!873637))

(declare-fun m!873639 () Bool)

(assert (=> b!938456 m!873639))

(assert (=> b!938456 m!873621))

(declare-fun m!873641 () Bool)

(assert (=> b!938456 m!873641))

(declare-fun m!873643 () Bool)

(assert (=> b!938446 m!873643))

(declare-fun m!873645 () Bool)

(assert (=> b!938446 m!873645))

(declare-fun m!873647 () Bool)

(assert (=> b!938442 m!873647))

(declare-fun m!873649 () Bool)

(assert (=> b!938442 m!873649))

(declare-fun m!873651 () Bool)

(assert (=> b!938447 m!873651))

(declare-fun m!873653 () Bool)

(assert (=> mapNonEmpty!32148 m!873653))

(declare-fun m!873655 () Bool)

(assert (=> b!938441 m!873655))

(declare-fun m!873657 () Bool)

(assert (=> b!938444 m!873657))

(declare-fun m!873659 () Bool)

(assert (=> b!938452 m!873659))

(declare-fun m!873661 () Bool)

(assert (=> b!938455 m!873661))

(declare-fun m!873663 () Bool)

(assert (=> start!79862 m!873663))

(declare-fun m!873665 () Bool)

(assert (=> start!79862 m!873665))

(declare-fun m!873667 () Bool)

(assert (=> start!79862 m!873667))

(check-sat b_and!29089 tp_is_empty!20251 (not mapNonEmpty!32148) (not b_lambda!14163) (not b!938455) (not b!938444) (not b!938447) (not b_next!17743) (not b!938456) (not b!938442) (not start!79862) (not b!938452) (not b!938441) (not b!938446))
(check-sat b_and!29089 (not b_next!17743))
