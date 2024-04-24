; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79266 () Bool)

(assert start!79266)

(declare-fun b_free!17311 () Bool)

(declare-fun b_next!17311 () Bool)

(assert (=> start!79266 (= b_free!17311 (not b_next!17311))))

(declare-fun tp!60374 () Bool)

(declare-fun b_and!28369 () Bool)

(assert (=> start!79266 (= tp!60374 b_and!28369)))

(declare-fun b!928960 () Bool)

(declare-datatypes ((Unit!31392 0))(
  ( (Unit!31393) )
))
(declare-fun e!521634 () Unit!31392)

(declare-fun e!521633 () Unit!31392)

(assert (=> b!928960 (= e!521634 e!521633)))

(declare-fun lt!418850 () (_ BitVec 64))

(declare-datatypes ((array!55651 0))(
  ( (array!55652 (arr!26766 (Array (_ BitVec 32) (_ BitVec 64))) (size!27226 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55651)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!928960 (= lt!418850 (select (arr!26766 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97240 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928960 (= c!97240 (validKeyInArray!0 lt!418850))))

(declare-fun b!928961 () Bool)

(declare-fun res!625370 () Bool)

(declare-fun e!521636 () Bool)

(assert (=> b!928961 (=> (not res!625370) (not e!521636))))

(assert (=> b!928961 (= res!625370 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27226 _keys!1487))))))

(declare-fun b!928962 () Bool)

(declare-fun e!521632 () Bool)

(assert (=> b!928962 (= e!521632 (not true))))

(declare-fun e!521641 () Bool)

(assert (=> b!928962 e!521641))

(declare-fun res!625369 () Bool)

(assert (=> b!928962 (=> (not res!625369) (not e!521641))))

(declare-datatypes ((V!31391 0))(
  ( (V!31392 (val!9960 Int)) )
))
(declare-datatypes ((tuple2!12996 0))(
  ( (tuple2!12997 (_1!6509 (_ BitVec 64)) (_2!6509 V!31391)) )
))
(declare-datatypes ((List!18802 0))(
  ( (Nil!18799) (Cons!18798 (h!19950 tuple2!12996) (t!26835 List!18802)) )
))
(declare-datatypes ((ListLongMap!11695 0))(
  ( (ListLongMap!11696 (toList!5863 List!18802)) )
))
(declare-fun lt!418856 () ListLongMap!11695)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4935 (ListLongMap!11695 (_ BitVec 64)) Bool)

(assert (=> b!928962 (= res!625369 (contains!4935 lt!418856 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9428 0))(
  ( (ValueCellFull!9428 (v!12475 V!31391)) (EmptyCell!9428) )
))
(declare-datatypes ((array!55653 0))(
  ( (array!55654 (arr!26767 (Array (_ BitVec 32) ValueCell!9428)) (size!27227 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55653)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31391)

(declare-fun minValue!1173 () V!31391)

(declare-fun getCurrentListMap!3113 (array!55651 array!55653 (_ BitVec 32) (_ BitVec 32) V!31391 V!31391 (_ BitVec 32) Int) ListLongMap!11695)

(assert (=> b!928962 (= lt!418856 (getCurrentListMap!3113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31391)

(declare-fun lt!418860 () Unit!31392)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!102 (array!55651 array!55653 (_ BitVec 32) (_ BitVec 32) V!31391 V!31391 (_ BitVec 64) V!31391 (_ BitVec 32) Int) Unit!31392)

(assert (=> b!928962 (= lt!418860 (lemmaListMapApplyFromThenApplyFromZero!102 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928963 () Bool)

(declare-fun e!521631 () Bool)

(assert (=> b!928963 (= e!521631 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928964 () Bool)

(declare-fun e!521638 () Bool)

(declare-fun e!521635 () Bool)

(assert (=> b!928964 (= e!521638 e!521635)))

(declare-fun res!625366 () Bool)

(assert (=> b!928964 (=> (not res!625366) (not e!521635))))

(declare-fun lt!418855 () V!31391)

(assert (=> b!928964 (= res!625366 (and (= lt!418855 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!418861 () ListLongMap!11695)

(declare-fun apply!713 (ListLongMap!11695 (_ BitVec 64)) V!31391)

(assert (=> b!928964 (= lt!418855 (apply!713 lt!418861 k0!1099))))

(declare-fun b!928966 () Bool)

(declare-fun Unit!31394 () Unit!31392)

(assert (=> b!928966 (= e!521633 Unit!31394)))

(declare-fun b!928967 () Bool)

(declare-fun e!521629 () Bool)

(declare-fun e!521630 () Bool)

(declare-fun mapRes!31485 () Bool)

(assert (=> b!928967 (= e!521629 (and e!521630 mapRes!31485))))

(declare-fun condMapEmpty!31485 () Bool)

(declare-fun mapDefault!31485 () ValueCell!9428)

(assert (=> b!928967 (= condMapEmpty!31485 (= (arr!26767 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9428)) mapDefault!31485)))))

(declare-fun b!928968 () Bool)

(declare-fun res!625367 () Bool)

(assert (=> b!928968 (=> (not res!625367) (not e!521636))))

(assert (=> b!928968 (= res!625367 (and (= (size!27227 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27226 _keys!1487) (size!27227 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928969 () Bool)

(declare-fun e!521640 () Bool)

(assert (=> b!928969 (= e!521635 e!521640)))

(declare-fun res!625368 () Bool)

(assert (=> b!928969 (=> (not res!625368) (not e!521640))))

(assert (=> b!928969 (= res!625368 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27226 _keys!1487)))))

(declare-fun lt!418857 () Unit!31392)

(assert (=> b!928969 (= lt!418857 e!521634)))

(declare-fun c!97241 () Bool)

(assert (=> b!928969 (= c!97241 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31485 () Bool)

(declare-fun tp!60375 () Bool)

(declare-fun e!521639 () Bool)

(assert (=> mapNonEmpty!31485 (= mapRes!31485 (and tp!60375 e!521639))))

(declare-fun mapRest!31485 () (Array (_ BitVec 32) ValueCell!9428))

(declare-fun mapKey!31485 () (_ BitVec 32))

(declare-fun mapValue!31485 () ValueCell!9428)

(assert (=> mapNonEmpty!31485 (= (arr!26767 _values!1231) (store mapRest!31485 mapKey!31485 mapValue!31485))))

(declare-fun b!928970 () Bool)

(assert (=> b!928970 (= e!521641 (= (apply!713 lt!418856 k0!1099) v!791))))

(declare-fun mapIsEmpty!31485 () Bool)

(assert (=> mapIsEmpty!31485 mapRes!31485))

(declare-fun b!928971 () Bool)

(assert (=> b!928971 (= e!521636 e!521638)))

(declare-fun res!625371 () Bool)

(assert (=> b!928971 (=> (not res!625371) (not e!521638))))

(assert (=> b!928971 (= res!625371 (contains!4935 lt!418861 k0!1099))))

(assert (=> b!928971 (= lt!418861 (getCurrentListMap!3113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928972 () Bool)

(declare-fun Unit!31395 () Unit!31392)

(assert (=> b!928972 (= e!521634 Unit!31395)))

(declare-fun b!928973 () Bool)

(declare-fun tp_is_empty!19819 () Bool)

(assert (=> b!928973 (= e!521630 tp_is_empty!19819)))

(declare-fun b!928974 () Bool)

(declare-fun res!625365 () Bool)

(assert (=> b!928974 (=> (not res!625365) (not e!521636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55651 (_ BitVec 32)) Bool)

(assert (=> b!928974 (= res!625365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928975 () Bool)

(declare-fun arrayContainsKey!0 (array!55651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928975 (= e!521631 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun res!625364 () Bool)

(assert (=> start!79266 (=> (not res!625364) (not e!521636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79266 (= res!625364 (validMask!0 mask!1881))))

(assert (=> start!79266 e!521636))

(assert (=> start!79266 true))

(assert (=> start!79266 tp_is_empty!19819))

(declare-fun array_inv!20942 (array!55653) Bool)

(assert (=> start!79266 (and (array_inv!20942 _values!1231) e!521629)))

(assert (=> start!79266 tp!60374))

(declare-fun array_inv!20943 (array!55651) Bool)

(assert (=> start!79266 (array_inv!20943 _keys!1487)))

(declare-fun b!928965 () Bool)

(declare-fun res!625373 () Bool)

(assert (=> b!928965 (=> (not res!625373) (not e!521636))))

(declare-datatypes ((List!18803 0))(
  ( (Nil!18800) (Cons!18799 (h!19951 (_ BitVec 64)) (t!26836 List!18803)) )
))
(declare-fun arrayNoDuplicates!0 (array!55651 (_ BitVec 32) List!18803) Bool)

(assert (=> b!928965 (= res!625373 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18800))))

(declare-fun b!928976 () Bool)

(assert (=> b!928976 (= e!521640 e!521632)))

(declare-fun res!625372 () Bool)

(assert (=> b!928976 (=> (not res!625372) (not e!521632))))

(declare-fun lt!418859 () ListLongMap!11695)

(assert (=> b!928976 (= res!625372 (contains!4935 lt!418859 k0!1099))))

(assert (=> b!928976 (= lt!418859 (getCurrentListMap!3113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928977 () Bool)

(declare-fun res!625374 () Bool)

(assert (=> b!928977 (=> (not res!625374) (not e!521632))))

(assert (=> b!928977 (= res!625374 (= (apply!713 lt!418859 k0!1099) v!791))))

(declare-fun b!928978 () Bool)

(assert (=> b!928978 (= e!521639 tp_is_empty!19819)))

(declare-fun b!928979 () Bool)

(declare-fun lt!418852 () ListLongMap!11695)

(assert (=> b!928979 (= (apply!713 lt!418852 k0!1099) lt!418855)))

(declare-fun lt!418863 () V!31391)

(declare-fun lt!418865 () Unit!31392)

(declare-fun addApplyDifferent!407 (ListLongMap!11695 (_ BitVec 64) V!31391 (_ BitVec 64)) Unit!31392)

(assert (=> b!928979 (= lt!418865 (addApplyDifferent!407 lt!418861 lt!418850 lt!418863 k0!1099))))

(assert (=> b!928979 (not (= lt!418850 k0!1099))))

(declare-fun lt!418854 () Unit!31392)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55651 (_ BitVec 64) (_ BitVec 32) List!18803) Unit!31392)

(assert (=> b!928979 (= lt!418854 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18800))))

(assert (=> b!928979 e!521631))

(declare-fun c!97242 () Bool)

(assert (=> b!928979 (= c!97242 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418862 () Unit!31392)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!262 (array!55651 array!55653 (_ BitVec 32) (_ BitVec 32) V!31391 V!31391 (_ BitVec 64) (_ BitVec 32) Int) Unit!31392)

(assert (=> b!928979 (= lt!418862 (lemmaListMapContainsThenArrayContainsFrom!262 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!928979 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18800)))

(declare-fun lt!418858 () Unit!31392)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55651 (_ BitVec 32) (_ BitVec 32)) Unit!31392)

(assert (=> b!928979 (= lt!418858 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!928979 (contains!4935 lt!418852 k0!1099)))

(declare-fun lt!418851 () tuple2!12996)

(declare-fun +!2771 (ListLongMap!11695 tuple2!12996) ListLongMap!11695)

(assert (=> b!928979 (= lt!418852 (+!2771 lt!418861 lt!418851))))

(declare-fun lt!418864 () Unit!31392)

(declare-fun addStillContains!480 (ListLongMap!11695 (_ BitVec 64) V!31391 (_ BitVec 64)) Unit!31392)

(assert (=> b!928979 (= lt!418864 (addStillContains!480 lt!418861 lt!418850 lt!418863 k0!1099))))

(assert (=> b!928979 (= (getCurrentListMap!3113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2771 (getCurrentListMap!3113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418851))))

(assert (=> b!928979 (= lt!418851 (tuple2!12997 lt!418850 lt!418863))))

(declare-fun get!14110 (ValueCell!9428 V!31391) V!31391)

(declare-fun dynLambda!1568 (Int (_ BitVec 64)) V!31391)

(assert (=> b!928979 (= lt!418863 (get!14110 (select (arr!26767 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1568 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418853 () Unit!31392)

(declare-fun lemmaListMapRecursiveValidKeyArray!151 (array!55651 array!55653 (_ BitVec 32) (_ BitVec 32) V!31391 V!31391 (_ BitVec 32) Int) Unit!31392)

(assert (=> b!928979 (= lt!418853 (lemmaListMapRecursiveValidKeyArray!151 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!928979 (= e!521633 lt!418865)))

(assert (= (and start!79266 res!625364) b!928968))

(assert (= (and b!928968 res!625367) b!928974))

(assert (= (and b!928974 res!625365) b!928965))

(assert (= (and b!928965 res!625373) b!928961))

(assert (= (and b!928961 res!625370) b!928971))

(assert (= (and b!928971 res!625371) b!928964))

(assert (= (and b!928964 res!625366) b!928969))

(assert (= (and b!928969 c!97241) b!928960))

(assert (= (and b!928969 (not c!97241)) b!928972))

(assert (= (and b!928960 c!97240) b!928979))

(assert (= (and b!928960 (not c!97240)) b!928966))

(assert (= (and b!928979 c!97242) b!928975))

(assert (= (and b!928979 (not c!97242)) b!928963))

(assert (= (and b!928969 res!625368) b!928976))

(assert (= (and b!928976 res!625372) b!928977))

(assert (= (and b!928977 res!625374) b!928962))

(assert (= (and b!928962 res!625369) b!928970))

(assert (= (and b!928967 condMapEmpty!31485) mapIsEmpty!31485))

(assert (= (and b!928967 (not condMapEmpty!31485)) mapNonEmpty!31485))

(get-info :version)

(assert (= (and mapNonEmpty!31485 ((_ is ValueCellFull!9428) mapValue!31485)) b!928978))

(assert (= (and b!928967 ((_ is ValueCellFull!9428) mapDefault!31485)) b!928973))

(assert (= start!79266 b!928967))

(declare-fun b_lambda!13827 () Bool)

(assert (=> (not b_lambda!13827) (not b!928979)))

(declare-fun t!26834 () Bool)

(declare-fun tb!5883 () Bool)

(assert (=> (and start!79266 (= defaultEntry!1235 defaultEntry!1235) t!26834) tb!5883))

(declare-fun result!11597 () Bool)

(assert (=> tb!5883 (= result!11597 tp_is_empty!19819)))

(assert (=> b!928979 t!26834))

(declare-fun b_and!28371 () Bool)

(assert (= b_and!28369 (and (=> t!26834 result!11597) b_and!28371)))

(declare-fun m!864109 () Bool)

(assert (=> b!928965 m!864109))

(declare-fun m!864111 () Bool)

(assert (=> b!928979 m!864111))

(declare-fun m!864113 () Bool)

(assert (=> b!928979 m!864113))

(declare-fun m!864115 () Bool)

(assert (=> b!928979 m!864115))

(declare-fun m!864117 () Bool)

(assert (=> b!928979 m!864117))

(declare-fun m!864119 () Bool)

(assert (=> b!928979 m!864119))

(assert (=> b!928979 m!864119))

(declare-fun m!864121 () Bool)

(assert (=> b!928979 m!864121))

(declare-fun m!864123 () Bool)

(assert (=> b!928979 m!864123))

(declare-fun m!864125 () Bool)

(assert (=> b!928979 m!864125))

(declare-fun m!864127 () Bool)

(assert (=> b!928979 m!864127))

(declare-fun m!864129 () Bool)

(assert (=> b!928979 m!864129))

(assert (=> b!928979 m!864121))

(declare-fun m!864131 () Bool)

(assert (=> b!928979 m!864131))

(declare-fun m!864133 () Bool)

(assert (=> b!928979 m!864133))

(declare-fun m!864135 () Bool)

(assert (=> b!928979 m!864135))

(assert (=> b!928979 m!864115))

(declare-fun m!864137 () Bool)

(assert (=> b!928979 m!864137))

(declare-fun m!864139 () Bool)

(assert (=> b!928979 m!864139))

(declare-fun m!864141 () Bool)

(assert (=> b!928979 m!864141))

(declare-fun m!864143 () Bool)

(assert (=> b!928975 m!864143))

(declare-fun m!864145 () Bool)

(assert (=> b!928970 m!864145))

(declare-fun m!864147 () Bool)

(assert (=> b!928969 m!864147))

(declare-fun m!864149 () Bool)

(assert (=> b!928971 m!864149))

(declare-fun m!864151 () Bool)

(assert (=> b!928971 m!864151))

(declare-fun m!864153 () Bool)

(assert (=> b!928962 m!864153))

(declare-fun m!864155 () Bool)

(assert (=> b!928962 m!864155))

(declare-fun m!864157 () Bool)

(assert (=> b!928962 m!864157))

(declare-fun m!864159 () Bool)

(assert (=> b!928976 m!864159))

(assert (=> b!928976 m!864125))

(declare-fun m!864161 () Bool)

(assert (=> start!79266 m!864161))

(declare-fun m!864163 () Bool)

(assert (=> start!79266 m!864163))

(declare-fun m!864165 () Bool)

(assert (=> start!79266 m!864165))

(declare-fun m!864167 () Bool)

(assert (=> b!928964 m!864167))

(declare-fun m!864169 () Bool)

(assert (=> b!928974 m!864169))

(declare-fun m!864171 () Bool)

(assert (=> b!928977 m!864171))

(declare-fun m!864173 () Bool)

(assert (=> b!928960 m!864173))

(declare-fun m!864175 () Bool)

(assert (=> b!928960 m!864175))

(declare-fun m!864177 () Bool)

(assert (=> mapNonEmpty!31485 m!864177))

(check-sat (not b!928977) (not mapNonEmpty!31485) (not b!928970) (not b!928964) (not b!928971) (not b!928960) tp_is_empty!19819 (not b!928962) (not b_next!17311) (not b!928965) (not b!928979) (not b!928976) (not b!928974) b_and!28371 (not b!928969) (not b!928975) (not b_lambda!13827) (not start!79266))
(check-sat b_and!28371 (not b_next!17311))
