; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79622 () Bool)

(assert start!79622)

(declare-fun b_free!17689 () Bool)

(declare-fun b_next!17689 () Bool)

(assert (=> start!79622 (= b_free!17689 (not b_next!17689))))

(declare-fun tp!61523 () Bool)

(declare-fun b_and!28943 () Bool)

(assert (=> start!79622 (= tp!61523 b_and!28943)))

(declare-fun b!935956 () Bool)

(declare-fun res!630301 () Bool)

(declare-fun e!525527 () Bool)

(assert (=> b!935956 (=> (not res!630301) (not e!525527))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935956 (= res!630301 (validKeyInArray!0 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!935957 () Bool)

(declare-fun e!525524 () Bool)

(declare-datatypes ((array!56303 0))(
  ( (array!56304 (arr!27092 (Array (_ BitVec 32) (_ BitVec 64))) (size!27553 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56303)

(declare-fun arrayContainsKey!0 (array!56303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935957 (= e!525524 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!32067 () Bool)

(declare-fun mapRes!32067 () Bool)

(assert (=> mapIsEmpty!32067 mapRes!32067))

(declare-fun b!935958 () Bool)

(declare-fun res!630296 () Bool)

(assert (=> b!935958 (=> (not res!630296) (not e!525527))))

(assert (=> b!935958 (= res!630296 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935959 () Bool)

(declare-fun e!525526 () Bool)

(declare-fun tp_is_empty!20197 () Bool)

(assert (=> b!935959 (= e!525526 tp_is_empty!20197)))

(declare-fun b!935960 () Bool)

(declare-fun res!630305 () Bool)

(declare-fun e!525528 () Bool)

(assert (=> b!935960 (=> (not res!630305) (not e!525528))))

(declare-datatypes ((List!19129 0))(
  ( (Nil!19126) (Cons!19125 (h!20271 (_ BitVec 64)) (t!27353 List!19129)) )
))
(declare-fun arrayNoDuplicates!0 (array!56303 (_ BitVec 32) List!19129) Bool)

(assert (=> b!935960 (= res!630305 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19126))))

(declare-fun b!935961 () Bool)

(declare-fun res!630297 () Bool)

(assert (=> b!935961 (=> (not res!630297) (not e!525528))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31895 0))(
  ( (V!31896 (val!10149 Int)) )
))
(declare-datatypes ((ValueCell!9617 0))(
  ( (ValueCellFull!9617 (v!12673 V!31895)) (EmptyCell!9617) )
))
(declare-datatypes ((array!56305 0))(
  ( (array!56306 (arr!27093 (Array (_ BitVec 32) ValueCell!9617)) (size!27554 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56305)

(assert (=> b!935961 (= res!630297 (and (= (size!27554 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27553 _keys!1487) (size!27554 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935962 () Bool)

(declare-fun res!630303 () Bool)

(assert (=> b!935962 (=> (not res!630303) (not e!525528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56303 (_ BitVec 32)) Bool)

(assert (=> b!935962 (= res!630303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!32067 () Bool)

(declare-fun tp!61524 () Bool)

(declare-fun e!525525 () Bool)

(assert (=> mapNonEmpty!32067 (= mapRes!32067 (and tp!61524 e!525525))))

(declare-fun mapValue!32067 () ValueCell!9617)

(declare-fun mapRest!32067 () (Array (_ BitVec 32) ValueCell!9617))

(declare-fun mapKey!32067 () (_ BitVec 32))

(assert (=> mapNonEmpty!32067 (= (arr!27093 _values!1231) (store mapRest!32067 mapKey!32067 mapValue!32067))))

(declare-fun b!935964 () Bool)

(assert (=> b!935964 (= e!525525 tp_is_empty!20197)))

(declare-fun b!935965 () Bool)

(declare-fun e!525523 () Bool)

(assert (=> b!935965 (= e!525523 (and e!525526 mapRes!32067))))

(declare-fun condMapEmpty!32067 () Bool)

(declare-fun mapDefault!32067 () ValueCell!9617)

(assert (=> b!935965 (= condMapEmpty!32067 (= (arr!27093 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9617)) mapDefault!32067)))))

(declare-fun b!935966 () Bool)

(assert (=> b!935966 (= e!525524 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935967 () Bool)

(declare-fun res!630302 () Bool)

(assert (=> b!935967 (=> (not res!630302) (not e!525527))))

(declare-fun v!791 () V!31895)

(declare-datatypes ((tuple2!13380 0))(
  ( (tuple2!13381 (_1!6701 (_ BitVec 64)) (_2!6701 V!31895)) )
))
(declare-datatypes ((List!19130 0))(
  ( (Nil!19127) (Cons!19126 (h!20272 tuple2!13380) (t!27354 List!19130)) )
))
(declare-datatypes ((ListLongMap!12067 0))(
  ( (ListLongMap!12068 (toList!6049 List!19130)) )
))
(declare-fun lt!421827 () ListLongMap!12067)

(declare-fun apply!826 (ListLongMap!12067 (_ BitVec 64)) V!31895)

(assert (=> b!935967 (= res!630302 (= (apply!826 lt!421827 k0!1099) v!791))))

(declare-fun b!935968 () Bool)

(declare-fun e!525529 () Bool)

(assert (=> b!935968 (= e!525527 e!525529)))

(declare-fun res!630304 () Bool)

(assert (=> b!935968 (=> (not res!630304) (not e!525529))))

(declare-fun lt!421823 () (_ BitVec 64))

(assert (=> b!935968 (= res!630304 (validKeyInArray!0 lt!421823))))

(assert (=> b!935968 (= lt!421823 (select (arr!27092 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935969 () Bool)

(assert (=> b!935969 (= e!525528 e!525527)))

(declare-fun res!630300 () Bool)

(assert (=> b!935969 (=> (not res!630300) (not e!525527))))

(declare-fun contains!5054 (ListLongMap!12067 (_ BitVec 64)) Bool)

(assert (=> b!935969 (= res!630300 (contains!5054 lt!421827 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31895)

(declare-fun minValue!1173 () V!31895)

(declare-fun getCurrentListMap!3216 (array!56303 array!56305 (_ BitVec 32) (_ BitVec 32) V!31895 V!31895 (_ BitVec 32) Int) ListLongMap!12067)

(assert (=> b!935969 (= lt!421827 (getCurrentListMap!3216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935970 () Bool)

(assert (=> b!935970 (= e!525529 (not (not (= k0!1099 lt!421823))))))

(assert (=> b!935970 (not (= lt!421823 k0!1099))))

(declare-datatypes ((Unit!31482 0))(
  ( (Unit!31483) )
))
(declare-fun lt!421819 () Unit!31482)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56303 (_ BitVec 64) (_ BitVec 32) List!19129) Unit!31482)

(assert (=> b!935970 (= lt!421819 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19126))))

(assert (=> b!935970 e!525524))

(declare-fun c!97300 () Bool)

(assert (=> b!935970 (= c!97300 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421826 () Unit!31482)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!293 (array!56303 array!56305 (_ BitVec 32) (_ BitVec 32) V!31895 V!31895 (_ BitVec 64) (_ BitVec 32) Int) Unit!31482)

(assert (=> b!935970 (= lt!421826 (lemmaListMapContainsThenArrayContainsFrom!293 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!935970 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19126)))

(declare-fun lt!421824 () Unit!31482)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56303 (_ BitVec 32) (_ BitVec 32)) Unit!31482)

(assert (=> b!935970 (= lt!421824 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421821 () tuple2!13380)

(declare-fun +!2846 (ListLongMap!12067 tuple2!13380) ListLongMap!12067)

(assert (=> b!935970 (contains!5054 (+!2846 lt!421827 lt!421821) k0!1099)))

(declare-fun lt!421820 () V!31895)

(declare-fun lt!421822 () Unit!31482)

(declare-fun addStillContains!535 (ListLongMap!12067 (_ BitVec 64) V!31895 (_ BitVec 64)) Unit!31482)

(assert (=> b!935970 (= lt!421822 (addStillContains!535 lt!421827 lt!421823 lt!421820 k0!1099))))

(assert (=> b!935970 (= (getCurrentListMap!3216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2846 (getCurrentListMap!3216 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421821))))

(assert (=> b!935970 (= lt!421821 (tuple2!13381 lt!421823 lt!421820))))

(declare-fun get!14286 (ValueCell!9617 V!31895) V!31895)

(declare-fun dynLambda!1602 (Int (_ BitVec 64)) V!31895)

(assert (=> b!935970 (= lt!421820 (get!14286 (select (arr!27093 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1602 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421825 () Unit!31482)

(declare-fun lemmaListMapRecursiveValidKeyArray!210 (array!56303 array!56305 (_ BitVec 32) (_ BitVec 32) V!31895 V!31895 (_ BitVec 32) Int) Unit!31482)

(assert (=> b!935970 (= lt!421825 (lemmaListMapRecursiveValidKeyArray!210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935963 () Bool)

(declare-fun res!630299 () Bool)

(assert (=> b!935963 (=> (not res!630299) (not e!525528))))

(assert (=> b!935963 (= res!630299 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27553 _keys!1487))))))

(declare-fun res!630298 () Bool)

(assert (=> start!79622 (=> (not res!630298) (not e!525528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79622 (= res!630298 (validMask!0 mask!1881))))

(assert (=> start!79622 e!525528))

(assert (=> start!79622 true))

(assert (=> start!79622 tp_is_empty!20197))

(declare-fun array_inv!21142 (array!56305) Bool)

(assert (=> start!79622 (and (array_inv!21142 _values!1231) e!525523)))

(assert (=> start!79622 tp!61523))

(declare-fun array_inv!21143 (array!56303) Bool)

(assert (=> start!79622 (array_inv!21143 _keys!1487)))

(assert (= (and start!79622 res!630298) b!935961))

(assert (= (and b!935961 res!630297) b!935962))

(assert (= (and b!935962 res!630303) b!935960))

(assert (= (and b!935960 res!630305) b!935963))

(assert (= (and b!935963 res!630299) b!935969))

(assert (= (and b!935969 res!630300) b!935967))

(assert (= (and b!935967 res!630302) b!935958))

(assert (= (and b!935958 res!630296) b!935956))

(assert (= (and b!935956 res!630301) b!935968))

(assert (= (and b!935968 res!630304) b!935970))

(assert (= (and b!935970 c!97300) b!935957))

(assert (= (and b!935970 (not c!97300)) b!935966))

(assert (= (and b!935965 condMapEmpty!32067) mapIsEmpty!32067))

(assert (= (and b!935965 (not condMapEmpty!32067)) mapNonEmpty!32067))

(get-info :version)

(assert (= (and mapNonEmpty!32067 ((_ is ValueCellFull!9617) mapValue!32067)) b!935964))

(assert (= (and b!935965 ((_ is ValueCellFull!9617) mapDefault!32067)) b!935959))

(assert (= start!79622 b!935965))

(declare-fun b_lambda!14077 () Bool)

(assert (=> (not b_lambda!14077) (not b!935970)))

(declare-fun t!27352 () Bool)

(declare-fun tb!6075 () Bool)

(assert (=> (and start!79622 (= defaultEntry!1235 defaultEntry!1235) t!27352) tb!6075))

(declare-fun result!11991 () Bool)

(assert (=> tb!6075 (= result!11991 tp_is_empty!20197)))

(assert (=> b!935970 t!27352))

(declare-fun b_and!28945 () Bool)

(assert (= b_and!28943 (and (=> t!27352 result!11991) b_and!28945)))

(declare-fun m!870005 () Bool)

(assert (=> b!935956 m!870005))

(declare-fun m!870007 () Bool)

(assert (=> start!79622 m!870007))

(declare-fun m!870009 () Bool)

(assert (=> start!79622 m!870009))

(declare-fun m!870011 () Bool)

(assert (=> start!79622 m!870011))

(declare-fun m!870013 () Bool)

(assert (=> b!935962 m!870013))

(declare-fun m!870015 () Bool)

(assert (=> b!935957 m!870015))

(declare-fun m!870017 () Bool)

(assert (=> mapNonEmpty!32067 m!870017))

(declare-fun m!870019 () Bool)

(assert (=> b!935970 m!870019))

(declare-fun m!870021 () Bool)

(assert (=> b!935970 m!870021))

(declare-fun m!870023 () Bool)

(assert (=> b!935970 m!870023))

(declare-fun m!870025 () Bool)

(assert (=> b!935970 m!870025))

(assert (=> b!935970 m!870019))

(declare-fun m!870027 () Bool)

(assert (=> b!935970 m!870027))

(declare-fun m!870029 () Bool)

(assert (=> b!935970 m!870029))

(declare-fun m!870031 () Bool)

(assert (=> b!935970 m!870031))

(declare-fun m!870033 () Bool)

(assert (=> b!935970 m!870033))

(declare-fun m!870035 () Bool)

(assert (=> b!935970 m!870035))

(declare-fun m!870037 () Bool)

(assert (=> b!935970 m!870037))

(declare-fun m!870039 () Bool)

(assert (=> b!935970 m!870039))

(declare-fun m!870041 () Bool)

(assert (=> b!935970 m!870041))

(assert (=> b!935970 m!870023))

(assert (=> b!935970 m!870025))

(declare-fun m!870043 () Bool)

(assert (=> b!935970 m!870043))

(assert (=> b!935970 m!870039))

(declare-fun m!870045 () Bool)

(assert (=> b!935970 m!870045))

(declare-fun m!870047 () Bool)

(assert (=> b!935967 m!870047))

(declare-fun m!870049 () Bool)

(assert (=> b!935968 m!870049))

(declare-fun m!870051 () Bool)

(assert (=> b!935968 m!870051))

(declare-fun m!870053 () Bool)

(assert (=> b!935969 m!870053))

(declare-fun m!870055 () Bool)

(assert (=> b!935969 m!870055))

(declare-fun m!870057 () Bool)

(assert (=> b!935960 m!870057))

(check-sat (not b!935970) (not b_next!17689) (not b!935967) b_and!28945 (not b!935956) (not start!79622) (not b!935968) (not b!935960) (not b!935957) (not mapNonEmpty!32067) (not b_lambda!14077) (not b!935969) tp_is_empty!20197 (not b!935962))
(check-sat b_and!28945 (not b_next!17689))
