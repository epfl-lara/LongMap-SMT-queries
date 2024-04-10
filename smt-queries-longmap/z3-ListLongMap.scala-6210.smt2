; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79396 () Bool)

(assert start!79396)

(declare-fun b_free!17583 () Bool)

(declare-fun b_next!17583 () Bool)

(assert (=> start!79396 (= b_free!17583 (not b_next!17583))))

(declare-fun tp!61193 () Bool)

(declare-fun b_and!28725 () Bool)

(assert (=> start!79396 (= tp!61193 b_and!28725)))

(declare-fun b!932937 () Bool)

(declare-fun res!628349 () Bool)

(declare-fun e!523884 () Bool)

(assert (=> b!932937 (=> (not res!628349) (not e!523884))))

(declare-datatypes ((array!56118 0))(
  ( (array!56119 (arr!27003 (Array (_ BitVec 32) (_ BitVec 64))) (size!27462 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56118)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31753 0))(
  ( (V!31754 (val!10096 Int)) )
))
(declare-datatypes ((ValueCell!9564 0))(
  ( (ValueCellFull!9564 (v!12615 V!31753)) (EmptyCell!9564) )
))
(declare-datatypes ((array!56120 0))(
  ( (array!56121 (arr!27004 (Array (_ BitVec 32) ValueCell!9564)) (size!27463 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56120)

(assert (=> b!932937 (= res!628349 (and (= (size!27463 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27462 _keys!1487) (size!27463 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932938 () Bool)

(declare-fun e!523888 () Bool)

(declare-fun e!523885 () Bool)

(assert (=> b!932938 (= e!523888 e!523885)))

(declare-fun res!628352 () Bool)

(assert (=> b!932938 (=> (not res!628352) (not e!523885))))

(declare-fun lt!420149 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932938 (= res!628352 (validKeyInArray!0 lt!420149))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932938 (= lt!420149 (select (arr!27003 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932939 () Bool)

(declare-fun res!628346 () Bool)

(assert (=> b!932939 (=> (not res!628346) (not e!523884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56118 (_ BitVec 32)) Bool)

(assert (=> b!932939 (= res!628346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31896 () Bool)

(declare-fun mapRes!31896 () Bool)

(assert (=> mapIsEmpty!31896 mapRes!31896))

(declare-fun b!932940 () Bool)

(declare-fun res!628348 () Bool)

(assert (=> b!932940 (=> (not res!628348) (not e!523888))))

(assert (=> b!932940 (= res!628348 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932941 () Bool)

(declare-fun e!523889 () Bool)

(declare-fun tp_is_empty!20091 () Bool)

(assert (=> b!932941 (= e!523889 tp_is_empty!20091)))

(declare-fun b!932942 () Bool)

(declare-fun e!523890 () Bool)

(declare-fun e!523886 () Bool)

(assert (=> b!932942 (= e!523890 (and e!523886 mapRes!31896))))

(declare-fun condMapEmpty!31896 () Bool)

(declare-fun mapDefault!31896 () ValueCell!9564)

(assert (=> b!932942 (= condMapEmpty!31896 (= (arr!27004 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9564)) mapDefault!31896)))))

(declare-fun b!932943 () Bool)

(declare-fun res!628345 () Bool)

(assert (=> b!932943 (=> (not res!628345) (not e!523884))))

(assert (=> b!932943 (= res!628345 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27462 _keys!1487))))))

(declare-fun b!932944 () Bool)

(declare-fun res!628350 () Bool)

(assert (=> b!932944 (=> (not res!628350) (not e!523888))))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!932944 (= res!628350 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31896 () Bool)

(declare-fun tp!61192 () Bool)

(assert (=> mapNonEmpty!31896 (= mapRes!31896 (and tp!61192 e!523889))))

(declare-fun mapKey!31896 () (_ BitVec 32))

(declare-fun mapRest!31896 () (Array (_ BitVec 32) ValueCell!9564))

(declare-fun mapValue!31896 () ValueCell!9564)

(assert (=> mapNonEmpty!31896 (= (arr!27004 _values!1231) (store mapRest!31896 mapKey!31896 mapValue!31896))))

(declare-fun b!932945 () Bool)

(assert (=> b!932945 (= e!523885 (not true))))

(declare-datatypes ((List!19012 0))(
  ( (Nil!19009) (Cons!19008 (h!20154 (_ BitVec 64)) (t!27139 List!19012)) )
))
(declare-fun arrayNoDuplicates!0 (array!56118 (_ BitVec 32) List!19012) Bool)

(assert (=> b!932945 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19009)))

(declare-datatypes ((Unit!31481 0))(
  ( (Unit!31482) )
))
(declare-fun lt!420143 () Unit!31481)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56118 (_ BitVec 32) (_ BitVec 32)) Unit!31481)

(assert (=> b!932945 (= lt!420143 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13230 0))(
  ( (tuple2!13231 (_1!6626 (_ BitVec 64)) (_2!6626 V!31753)) )
))
(declare-datatypes ((List!19013 0))(
  ( (Nil!19010) (Cons!19009 (h!20155 tuple2!13230) (t!27140 List!19013)) )
))
(declare-datatypes ((ListLongMap!11927 0))(
  ( (ListLongMap!11928 (toList!5979 List!19013)) )
))
(declare-fun lt!420145 () ListLongMap!11927)

(declare-fun lt!420147 () tuple2!13230)

(declare-fun contains!5028 (ListLongMap!11927 (_ BitVec 64)) Bool)

(declare-fun +!2783 (ListLongMap!11927 tuple2!13230) ListLongMap!11927)

(assert (=> b!932945 (contains!5028 (+!2783 lt!420145 lt!420147) k0!1099)))

(declare-fun lt!420148 () Unit!31481)

(declare-fun lt!420144 () V!31753)

(declare-fun addStillContains!502 (ListLongMap!11927 (_ BitVec 64) V!31753 (_ BitVec 64)) Unit!31481)

(assert (=> b!932945 (= lt!420148 (addStillContains!502 lt!420145 lt!420149 lt!420144 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31753)

(declare-fun minValue!1173 () V!31753)

(declare-fun getCurrentListMap!3217 (array!56118 array!56120 (_ BitVec 32) (_ BitVec 32) V!31753 V!31753 (_ BitVec 32) Int) ListLongMap!11927)

(assert (=> b!932945 (= (getCurrentListMap!3217 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2783 (getCurrentListMap!3217 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420147))))

(assert (=> b!932945 (= lt!420147 (tuple2!13231 lt!420149 lt!420144))))

(declare-fun get!14203 (ValueCell!9564 V!31753) V!31753)

(declare-fun dynLambda!1572 (Int (_ BitVec 64)) V!31753)

(assert (=> b!932945 (= lt!420144 (get!14203 (select (arr!27004 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1572 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420146 () Unit!31481)

(declare-fun lemmaListMapRecursiveValidKeyArray!173 (array!56118 array!56120 (_ BitVec 32) (_ BitVec 32) V!31753 V!31753 (_ BitVec 32) Int) Unit!31481)

(assert (=> b!932945 (= lt!420146 (lemmaListMapRecursiveValidKeyArray!173 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!628347 () Bool)

(assert (=> start!79396 (=> (not res!628347) (not e!523884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79396 (= res!628347 (validMask!0 mask!1881))))

(assert (=> start!79396 e!523884))

(assert (=> start!79396 true))

(assert (=> start!79396 tp_is_empty!20091))

(declare-fun array_inv!21016 (array!56120) Bool)

(assert (=> start!79396 (and (array_inv!21016 _values!1231) e!523890)))

(assert (=> start!79396 tp!61193))

(declare-fun array_inv!21017 (array!56118) Bool)

(assert (=> start!79396 (array_inv!21017 _keys!1487)))

(declare-fun b!932946 () Bool)

(declare-fun res!628354 () Bool)

(assert (=> b!932946 (=> (not res!628354) (not e!523884))))

(assert (=> b!932946 (= res!628354 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19009))))

(declare-fun b!932947 () Bool)

(declare-fun res!628351 () Bool)

(assert (=> b!932947 (=> (not res!628351) (not e!523888))))

(declare-fun v!791 () V!31753)

(declare-fun apply!792 (ListLongMap!11927 (_ BitVec 64)) V!31753)

(assert (=> b!932947 (= res!628351 (= (apply!792 lt!420145 k0!1099) v!791))))

(declare-fun b!932948 () Bool)

(assert (=> b!932948 (= e!523884 e!523888)))

(declare-fun res!628353 () Bool)

(assert (=> b!932948 (=> (not res!628353) (not e!523888))))

(assert (=> b!932948 (= res!628353 (contains!5028 lt!420145 k0!1099))))

(assert (=> b!932948 (= lt!420145 (getCurrentListMap!3217 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932949 () Bool)

(assert (=> b!932949 (= e!523886 tp_is_empty!20091)))

(assert (= (and start!79396 res!628347) b!932937))

(assert (= (and b!932937 res!628349) b!932939))

(assert (= (and b!932939 res!628346) b!932946))

(assert (= (and b!932946 res!628354) b!932943))

(assert (= (and b!932943 res!628345) b!932948))

(assert (= (and b!932948 res!628353) b!932947))

(assert (= (and b!932947 res!628351) b!932940))

(assert (= (and b!932940 res!628348) b!932944))

(assert (= (and b!932944 res!628350) b!932938))

(assert (= (and b!932938 res!628352) b!932945))

(assert (= (and b!932942 condMapEmpty!31896) mapIsEmpty!31896))

(assert (= (and b!932942 (not condMapEmpty!31896)) mapNonEmpty!31896))

(get-info :version)

(assert (= (and mapNonEmpty!31896 ((_ is ValueCellFull!9564) mapValue!31896)) b!932941))

(assert (= (and b!932942 ((_ is ValueCellFull!9564) mapDefault!31896)) b!932949))

(assert (= start!79396 b!932942))

(declare-fun b_lambda!13917 () Bool)

(assert (=> (not b_lambda!13917) (not b!932945)))

(declare-fun t!27138 () Bool)

(declare-fun tb!5977 () Bool)

(assert (=> (and start!79396 (= defaultEntry!1235 defaultEntry!1235) t!27138) tb!5977))

(declare-fun result!11779 () Bool)

(assert (=> tb!5977 (= result!11779 tp_is_empty!20091)))

(assert (=> b!932945 t!27138))

(declare-fun b_and!28727 () Bool)

(assert (= b_and!28725 (and (=> t!27138 result!11779) b_and!28727)))

(declare-fun m!866983 () Bool)

(assert (=> b!932948 m!866983))

(declare-fun m!866985 () Bool)

(assert (=> b!932948 m!866985))

(declare-fun m!866987 () Bool)

(assert (=> b!932945 m!866987))

(declare-fun m!866989 () Bool)

(assert (=> b!932945 m!866989))

(declare-fun m!866991 () Bool)

(assert (=> b!932945 m!866991))

(assert (=> b!932945 m!866989))

(assert (=> b!932945 m!866991))

(declare-fun m!866993 () Bool)

(assert (=> b!932945 m!866993))

(declare-fun m!866995 () Bool)

(assert (=> b!932945 m!866995))

(assert (=> b!932945 m!866987))

(declare-fun m!866997 () Bool)

(assert (=> b!932945 m!866997))

(declare-fun m!866999 () Bool)

(assert (=> b!932945 m!866999))

(declare-fun m!867001 () Bool)

(assert (=> b!932945 m!867001))

(declare-fun m!867003 () Bool)

(assert (=> b!932945 m!867003))

(declare-fun m!867005 () Bool)

(assert (=> b!932945 m!867005))

(declare-fun m!867007 () Bool)

(assert (=> b!932945 m!867007))

(assert (=> b!932945 m!867005))

(declare-fun m!867009 () Bool)

(assert (=> b!932945 m!867009))

(declare-fun m!867011 () Bool)

(assert (=> b!932944 m!867011))

(declare-fun m!867013 () Bool)

(assert (=> b!932938 m!867013))

(declare-fun m!867015 () Bool)

(assert (=> b!932938 m!867015))

(declare-fun m!867017 () Bool)

(assert (=> mapNonEmpty!31896 m!867017))

(declare-fun m!867019 () Bool)

(assert (=> b!932947 m!867019))

(declare-fun m!867021 () Bool)

(assert (=> b!932939 m!867021))

(declare-fun m!867023 () Bool)

(assert (=> b!932946 m!867023))

(declare-fun m!867025 () Bool)

(assert (=> start!79396 m!867025))

(declare-fun m!867027 () Bool)

(assert (=> start!79396 m!867027))

(declare-fun m!867029 () Bool)

(assert (=> start!79396 m!867029))

(check-sat (not b_lambda!13917) (not b!932948) (not b!932945) (not b!932944) (not mapNonEmpty!31896) (not b!932939) tp_is_empty!20091 (not b_next!17583) b_and!28727 (not start!79396) (not b!932947) (not b!932946) (not b!932938))
(check-sat b_and!28727 (not b_next!17583))
