; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79676 () Bool)

(assert start!79676)

(declare-fun b_free!17743 () Bool)

(declare-fun b_next!17743 () Bool)

(assert (=> start!79676 (= b_free!17743 (not b_next!17743))))

(declare-fun tp!61686 () Bool)

(declare-fun b_and!29051 () Bool)

(assert (=> start!79676 (= tp!61686 b_and!29051)))

(declare-fun b!937299 () Bool)

(declare-fun e!526327 () Bool)

(declare-fun e!526328 () Bool)

(declare-fun mapRes!32148 () Bool)

(assert (=> b!937299 (= e!526327 (and e!526328 mapRes!32148))))

(declare-fun condMapEmpty!32148 () Bool)

(declare-datatypes ((V!31967 0))(
  ( (V!31968 (val!10176 Int)) )
))
(declare-datatypes ((ValueCell!9644 0))(
  ( (ValueCellFull!9644 (v!12700 V!31967)) (EmptyCell!9644) )
))
(declare-datatypes ((array!56409 0))(
  ( (array!56410 (arr!27145 (Array (_ BitVec 32) ValueCell!9644)) (size!27606 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56409)

(declare-fun mapDefault!32148 () ValueCell!9644)

(assert (=> b!937299 (= condMapEmpty!32148 (= (arr!27145 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9644)) mapDefault!32148)))))

(declare-fun b!937300 () Bool)

(declare-fun e!526325 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56411 0))(
  ( (array!56412 (arr!27146 (Array (_ BitVec 32) (_ BitVec 64))) (size!27607 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56411)

(assert (=> b!937300 (= e!526325 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27607 _keys!1487)))))

(declare-datatypes ((Unit!31556 0))(
  ( (Unit!31557) )
))
(declare-fun lt!422846 () Unit!31556)

(declare-fun e!526323 () Unit!31556)

(assert (=> b!937300 (= lt!422846 e!526323)))

(declare-fun c!97529 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937300 (= c!97529 (validKeyInArray!0 k0!1099))))

(declare-fun b!937301 () Bool)

(declare-fun res!630885 () Bool)

(declare-fun e!526319 () Bool)

(assert (=> b!937301 (=> (not res!630885) (not e!526319))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56411 (_ BitVec 32)) Bool)

(assert (=> b!937301 (= res!630885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!32148 () Bool)

(assert (=> mapIsEmpty!32148 mapRes!32148))

(declare-fun b!937302 () Bool)

(declare-fun e!526321 () Bool)

(declare-fun tp_is_empty!20251 () Bool)

(assert (=> b!937302 (= e!526321 tp_is_empty!20251)))

(declare-fun b!937303 () Bool)

(declare-fun res!630887 () Bool)

(assert (=> b!937303 (=> (not res!630887) (not e!526319))))

(declare-datatypes ((List!19171 0))(
  ( (Nil!19168) (Cons!19167 (h!20313 (_ BitVec 64)) (t!27449 List!19171)) )
))
(declare-fun arrayNoDuplicates!0 (array!56411 (_ BitVec 32) List!19171) Bool)

(assert (=> b!937303 (= res!630887 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19168))))

(declare-fun b!937304 () Bool)

(declare-datatypes ((tuple2!13426 0))(
  ( (tuple2!13427 (_1!6724 (_ BitVec 64)) (_2!6724 V!31967)) )
))
(declare-datatypes ((List!19172 0))(
  ( (Nil!19169) (Cons!19168 (h!20314 tuple2!13426) (t!27450 List!19172)) )
))
(declare-datatypes ((ListLongMap!12113 0))(
  ( (ListLongMap!12114 (toList!6072 List!19172)) )
))
(declare-fun lt!422853 () ListLongMap!12113)

(declare-fun lt!422845 () V!31967)

(declare-fun apply!847 (ListLongMap!12113 (_ BitVec 64)) V!31967)

(assert (=> b!937304 (= (apply!847 lt!422853 k0!1099) lt!422845)))

(declare-fun lt!422850 () ListLongMap!12113)

(declare-fun lt!422852 () V!31967)

(declare-fun lt!422854 () (_ BitVec 64))

(declare-fun lt!422855 () Unit!31556)

(declare-fun addApplyDifferent!431 (ListLongMap!12113 (_ BitVec 64) V!31967 (_ BitVec 64)) Unit!31556)

(assert (=> b!937304 (= lt!422855 (addApplyDifferent!431 lt!422850 lt!422854 lt!422852 k0!1099))))

(assert (=> b!937304 (not (= lt!422854 k0!1099))))

(declare-fun lt!422849 () Unit!31556)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56411 (_ BitVec 64) (_ BitVec 32) List!19171) Unit!31556)

(assert (=> b!937304 (= lt!422849 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19168))))

(declare-fun e!526326 () Bool)

(assert (=> b!937304 e!526326))

(declare-fun c!97531 () Bool)

(assert (=> b!937304 (= c!97531 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!422844 () Unit!31556)

(declare-fun zeroValue!1173 () V!31967)

(declare-fun minValue!1173 () V!31967)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!309 (array!56411 array!56409 (_ BitVec 32) (_ BitVec 32) V!31967 V!31967 (_ BitVec 64) (_ BitVec 32) Int) Unit!31556)

(assert (=> b!937304 (= lt!422844 (lemmaListMapContainsThenArrayContainsFrom!309 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!937304 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19168)))

(declare-fun lt!422847 () Unit!31556)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56411 (_ BitVec 32) (_ BitVec 32)) Unit!31556)

(assert (=> b!937304 (= lt!422847 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5074 (ListLongMap!12113 (_ BitVec 64)) Bool)

(assert (=> b!937304 (contains!5074 lt!422853 k0!1099)))

(declare-fun lt!422851 () tuple2!13426)

(declare-fun +!2862 (ListLongMap!12113 tuple2!13426) ListLongMap!12113)

(assert (=> b!937304 (= lt!422853 (+!2862 lt!422850 lt!422851))))

(declare-fun lt!422848 () Unit!31556)

(declare-fun addStillContains!551 (ListLongMap!12113 (_ BitVec 64) V!31967 (_ BitVec 64)) Unit!31556)

(assert (=> b!937304 (= lt!422848 (addStillContains!551 lt!422850 lt!422854 lt!422852 k0!1099))))

(declare-fun getCurrentListMap!3236 (array!56411 array!56409 (_ BitVec 32) (_ BitVec 32) V!31967 V!31967 (_ BitVec 32) Int) ListLongMap!12113)

(assert (=> b!937304 (= (getCurrentListMap!3236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2862 (getCurrentListMap!3236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422851))))

(assert (=> b!937304 (= lt!422851 (tuple2!13427 lt!422854 lt!422852))))

(declare-fun get!14320 (ValueCell!9644 V!31967) V!31967)

(declare-fun dynLambda!1618 (Int (_ BitVec 64)) V!31967)

(assert (=> b!937304 (= lt!422852 (get!14320 (select (arr!27145 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1618 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422856 () Unit!31556)

(declare-fun lemmaListMapRecursiveValidKeyArray!226 (array!56411 array!56409 (_ BitVec 32) (_ BitVec 32) V!31967 V!31967 (_ BitVec 32) Int) Unit!31556)

(assert (=> b!937304 (= lt!422856 (lemmaListMapRecursiveValidKeyArray!226 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526322 () Unit!31556)

(assert (=> b!937304 (= e!526322 lt!422855)))

(declare-fun b!937305 () Bool)

(declare-fun Unit!31558 () Unit!31556)

(assert (=> b!937305 (= e!526323 Unit!31558)))

(declare-fun b!937306 () Bool)

(declare-fun Unit!31559 () Unit!31556)

(assert (=> b!937306 (= e!526322 Unit!31559)))

(declare-fun res!630886 () Bool)

(assert (=> start!79676 (=> (not res!630886) (not e!526319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79676 (= res!630886 (validMask!0 mask!1881))))

(assert (=> start!79676 e!526319))

(assert (=> start!79676 true))

(assert (=> start!79676 tp_is_empty!20251))

(declare-fun array_inv!21178 (array!56409) Bool)

(assert (=> start!79676 (and (array_inv!21178 _values!1231) e!526327)))

(assert (=> start!79676 tp!61686))

(declare-fun array_inv!21179 (array!56411) Bool)

(assert (=> start!79676 (array_inv!21179 _keys!1487)))

(declare-fun mapNonEmpty!32148 () Bool)

(declare-fun tp!61685 () Bool)

(assert (=> mapNonEmpty!32148 (= mapRes!32148 (and tp!61685 e!526321))))

(declare-fun mapRest!32148 () (Array (_ BitVec 32) ValueCell!9644))

(declare-fun mapValue!32148 () ValueCell!9644)

(declare-fun mapKey!32148 () (_ BitVec 32))

(assert (=> mapNonEmpty!32148 (= (arr!27145 _values!1231) (store mapRest!32148 mapKey!32148 mapValue!32148))))

(declare-fun b!937307 () Bool)

(declare-fun e!526320 () Bool)

(assert (=> b!937307 (= e!526319 e!526320)))

(declare-fun res!630884 () Bool)

(assert (=> b!937307 (=> (not res!630884) (not e!526320))))

(assert (=> b!937307 (= res!630884 (contains!5074 lt!422850 k0!1099))))

(assert (=> b!937307 (= lt!422850 (getCurrentListMap!3236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937308 () Bool)

(assert (=> b!937308 (= e!526328 tp_is_empty!20251)))

(declare-fun b!937309 () Bool)

(assert (=> b!937309 (= e!526320 e!526325)))

(declare-fun res!630890 () Bool)

(assert (=> b!937309 (=> (not res!630890) (not e!526325))))

(declare-fun v!791 () V!31967)

(assert (=> b!937309 (= res!630890 (and (= lt!422845 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937309 (= lt!422845 (apply!847 lt!422850 k0!1099))))

(declare-fun b!937310 () Bool)

(assert (=> b!937310 (= e!526326 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937311 () Bool)

(assert (=> b!937311 (= e!526323 e!526322)))

(assert (=> b!937311 (= lt!422854 (select (arr!27146 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97530 () Bool)

(assert (=> b!937311 (= c!97530 (validKeyInArray!0 lt!422854))))

(declare-fun b!937312 () Bool)

(declare-fun res!630888 () Bool)

(assert (=> b!937312 (=> (not res!630888) (not e!526319))))

(assert (=> b!937312 (= res!630888 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27607 _keys!1487))))))

(declare-fun b!937313 () Bool)

(declare-fun res!630889 () Bool)

(assert (=> b!937313 (=> (not res!630889) (not e!526319))))

(assert (=> b!937313 (= res!630889 (and (= (size!27606 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27607 _keys!1487) (size!27606 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937314 () Bool)

(declare-fun arrayContainsKey!0 (array!56411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937314 (= e!526326 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(assert (= (and start!79676 res!630886) b!937313))

(assert (= (and b!937313 res!630889) b!937301))

(assert (= (and b!937301 res!630885) b!937303))

(assert (= (and b!937303 res!630887) b!937312))

(assert (= (and b!937312 res!630888) b!937307))

(assert (= (and b!937307 res!630884) b!937309))

(assert (= (and b!937309 res!630890) b!937300))

(assert (= (and b!937300 c!97529) b!937311))

(assert (= (and b!937300 (not c!97529)) b!937305))

(assert (= (and b!937311 c!97530) b!937304))

(assert (= (and b!937311 (not c!97530)) b!937306))

(assert (= (and b!937304 c!97531) b!937314))

(assert (= (and b!937304 (not c!97531)) b!937310))

(assert (= (and b!937299 condMapEmpty!32148) mapIsEmpty!32148))

(assert (= (and b!937299 (not condMapEmpty!32148)) mapNonEmpty!32148))

(get-info :version)

(assert (= (and mapNonEmpty!32148 ((_ is ValueCellFull!9644) mapValue!32148)) b!937302))

(assert (= (and b!937299 ((_ is ValueCellFull!9644) mapDefault!32148)) b!937308))

(assert (= start!79676 b!937299))

(declare-fun b_lambda!14131 () Bool)

(assert (=> (not b_lambda!14131) (not b!937304)))

(declare-fun t!27448 () Bool)

(declare-fun tb!6129 () Bool)

(assert (=> (and start!79676 (= defaultEntry!1235 defaultEntry!1235) t!27448) tb!6129))

(declare-fun result!12099 () Bool)

(assert (=> tb!6129 (= result!12099 tp_is_empty!20251)))

(assert (=> b!937304 t!27448))

(declare-fun b_and!29053 () Bool)

(assert (= b_and!29051 (and (=> t!27448 result!12099) b_and!29053)))

(declare-fun m!871559 () Bool)

(assert (=> b!937314 m!871559))

(declare-fun m!871561 () Bool)

(assert (=> b!937307 m!871561))

(declare-fun m!871563 () Bool)

(assert (=> b!937307 m!871563))

(declare-fun m!871565 () Bool)

(assert (=> b!937309 m!871565))

(declare-fun m!871567 () Bool)

(assert (=> b!937311 m!871567))

(declare-fun m!871569 () Bool)

(assert (=> b!937311 m!871569))

(declare-fun m!871571 () Bool)

(assert (=> b!937303 m!871571))

(declare-fun m!871573 () Bool)

(assert (=> mapNonEmpty!32148 m!871573))

(declare-fun m!871575 () Bool)

(assert (=> b!937301 m!871575))

(declare-fun m!871577 () Bool)

(assert (=> b!937304 m!871577))

(declare-fun m!871579 () Bool)

(assert (=> b!937304 m!871579))

(declare-fun m!871581 () Bool)

(assert (=> b!937304 m!871581))

(declare-fun m!871583 () Bool)

(assert (=> b!937304 m!871583))

(declare-fun m!871585 () Bool)

(assert (=> b!937304 m!871585))

(declare-fun m!871587 () Bool)

(assert (=> b!937304 m!871587))

(declare-fun m!871589 () Bool)

(assert (=> b!937304 m!871589))

(declare-fun m!871591 () Bool)

(assert (=> b!937304 m!871591))

(declare-fun m!871593 () Bool)

(assert (=> b!937304 m!871593))

(declare-fun m!871595 () Bool)

(assert (=> b!937304 m!871595))

(declare-fun m!871597 () Bool)

(assert (=> b!937304 m!871597))

(declare-fun m!871599 () Bool)

(assert (=> b!937304 m!871599))

(declare-fun m!871601 () Bool)

(assert (=> b!937304 m!871601))

(assert (=> b!937304 m!871587))

(assert (=> b!937304 m!871589))

(declare-fun m!871603 () Bool)

(assert (=> b!937304 m!871603))

(declare-fun m!871605 () Bool)

(assert (=> b!937304 m!871605))

(assert (=> b!937304 m!871603))

(declare-fun m!871607 () Bool)

(assert (=> b!937304 m!871607))

(declare-fun m!871609 () Bool)

(assert (=> start!79676 m!871609))

(declare-fun m!871611 () Bool)

(assert (=> start!79676 m!871611))

(declare-fun m!871613 () Bool)

(assert (=> start!79676 m!871613))

(declare-fun m!871615 () Bool)

(assert (=> b!937300 m!871615))

(check-sat (not b!937311) (not b!937304) (not b_lambda!14131) (not mapNonEmpty!32148) (not b_next!17743) (not b!937300) (not b!937309) b_and!29053 (not b!937307) (not b!937301) (not b!937303) (not b!937314) tp_is_empty!20251 (not start!79676))
(check-sat b_and!29053 (not b_next!17743))
