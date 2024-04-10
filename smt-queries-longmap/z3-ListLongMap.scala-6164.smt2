; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79094 () Bool)

(assert start!79094)

(declare-fun b_free!17307 () Bool)

(declare-fun b_next!17307 () Bool)

(assert (=> start!79094 (= b_free!17307 (not b_next!17307))))

(declare-fun tp!60362 () Bool)

(declare-fun b_and!28351 () Bool)

(assert (=> start!79094 (= tp!60362 b_and!28351)))

(declare-fun b!927933 () Bool)

(declare-fun res!624960 () Bool)

(declare-fun e!520975 () Bool)

(assert (=> b!927933 (=> (not res!624960) (not e!520975))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31385 0))(
  ( (V!31386 (val!9958 Int)) )
))
(declare-fun v!791 () V!31385)

(declare-datatypes ((tuple2!13004 0))(
  ( (tuple2!13005 (_1!6513 (_ BitVec 64)) (_2!6513 V!31385)) )
))
(declare-datatypes ((List!18804 0))(
  ( (Nil!18801) (Cons!18800 (h!19946 tuple2!13004) (t!26841 List!18804)) )
))
(declare-datatypes ((ListLongMap!11701 0))(
  ( (ListLongMap!11702 (toList!5866 List!18804)) )
))
(declare-fun lt!418394 () ListLongMap!11701)

(declare-fun apply!696 (ListLongMap!11701 (_ BitVec 64)) V!31385)

(assert (=> b!927933 (= res!624960 (= (apply!696 lt!418394 k0!1099) v!791))))

(declare-fun b!927934 () Bool)

(declare-fun res!624957 () Bool)

(declare-fun e!520980 () Bool)

(assert (=> b!927934 (=> (not res!624957) (not e!520980))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55590 0))(
  ( (array!55591 (arr!26740 (Array (_ BitVec 32) (_ BitVec 64))) (size!27199 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55590)

(assert (=> b!927934 (= res!624957 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27199 _keys!1487))))))

(declare-fun b!927935 () Bool)

(declare-fun e!520977 () Bool)

(declare-fun tp_is_empty!19815 () Bool)

(assert (=> b!927935 (= e!520977 tp_is_empty!19815)))

(declare-fun b!927936 () Bool)

(declare-fun res!624964 () Bool)

(assert (=> b!927936 (=> (not res!624964) (not e!520980))))

(declare-datatypes ((List!18805 0))(
  ( (Nil!18802) (Cons!18801 (h!19947 (_ BitVec 64)) (t!26842 List!18805)) )
))
(declare-fun arrayNoDuplicates!0 (array!55590 (_ BitVec 32) List!18805) Bool)

(assert (=> b!927936 (= res!624964 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18802))))

(declare-fun mapIsEmpty!31479 () Bool)

(declare-fun mapRes!31479 () Bool)

(assert (=> mapIsEmpty!31479 mapRes!31479))

(declare-fun b!927937 () Bool)

(declare-fun e!520981 () Bool)

(declare-fun arrayContainsKey!0 (array!55590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927937 (= e!520981 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun lt!418404 () ListLongMap!11701)

(declare-fun e!520978 () Bool)

(declare-fun b!927938 () Bool)

(assert (=> b!927938 (= e!520978 (= (apply!696 lt!418404 k0!1099) v!791))))

(declare-fun mapNonEmpty!31479 () Bool)

(declare-fun tp!60361 () Bool)

(declare-fun e!520969 () Bool)

(assert (=> mapNonEmpty!31479 (= mapRes!31479 (and tp!60361 e!520969))))

(declare-datatypes ((ValueCell!9426 0))(
  ( (ValueCellFull!9426 (v!12476 V!31385)) (EmptyCell!9426) )
))
(declare-fun mapRest!31479 () (Array (_ BitVec 32) ValueCell!9426))

(declare-fun mapValue!31479 () ValueCell!9426)

(declare-datatypes ((array!55592 0))(
  ( (array!55593 (arr!26741 (Array (_ BitVec 32) ValueCell!9426)) (size!27200 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55592)

(declare-fun mapKey!31479 () (_ BitVec 32))

(assert (=> mapNonEmpty!31479 (= (arr!26741 _values!1231) (store mapRest!31479 mapKey!31479 mapValue!31479))))

(declare-fun b!927939 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!927939 (= e!520981 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927940 () Bool)

(declare-fun res!624955 () Bool)

(assert (=> b!927940 (=> (not res!624955) (not e!520980))))

(declare-fun mask!1881 () (_ BitVec 32))

(assert (=> b!927940 (= res!624955 (and (= (size!27200 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27199 _keys!1487) (size!27200 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927941 () Bool)

(declare-fun e!520972 () Bool)

(assert (=> b!927941 (= e!520972 (and e!520977 mapRes!31479))))

(declare-fun condMapEmpty!31479 () Bool)

(declare-fun mapDefault!31479 () ValueCell!9426)

(assert (=> b!927941 (= condMapEmpty!31479 (= (arr!26741 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9426)) mapDefault!31479)))))

(declare-fun b!927942 () Bool)

(declare-fun lt!418396 () ListLongMap!11701)

(declare-fun lt!418393 () V!31385)

(assert (=> b!927942 (= (apply!696 lt!418396 k0!1099) lt!418393)))

(declare-fun lt!418402 () V!31385)

(declare-fun lt!418400 () ListLongMap!11701)

(declare-datatypes ((Unit!31394 0))(
  ( (Unit!31395) )
))
(declare-fun lt!418397 () Unit!31394)

(declare-fun lt!418401 () (_ BitVec 64))

(declare-fun addApplyDifferent!410 (ListLongMap!11701 (_ BitVec 64) V!31385 (_ BitVec 64)) Unit!31394)

(assert (=> b!927942 (= lt!418397 (addApplyDifferent!410 lt!418400 lt!418401 lt!418402 k0!1099))))

(assert (=> b!927942 (not (= lt!418401 k0!1099))))

(declare-fun lt!418398 () Unit!31394)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55590 (_ BitVec 64) (_ BitVec 32) List!18805) Unit!31394)

(assert (=> b!927942 (= lt!418398 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18802))))

(assert (=> b!927942 e!520981))

(declare-fun c!96940 () Bool)

(assert (=> b!927942 (= c!96940 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418406 () Unit!31394)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31385)

(declare-fun minValue!1173 () V!31385)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!261 (array!55590 array!55592 (_ BitVec 32) (_ BitVec 32) V!31385 V!31385 (_ BitVec 64) (_ BitVec 32) Int) Unit!31394)

(assert (=> b!927942 (= lt!418406 (lemmaListMapContainsThenArrayContainsFrom!261 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!927942 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18802)))

(declare-fun lt!418399 () Unit!31394)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55590 (_ BitVec 32) (_ BitVec 32)) Unit!31394)

(assert (=> b!927942 (= lt!418399 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4924 (ListLongMap!11701 (_ BitVec 64)) Bool)

(assert (=> b!927942 (contains!4924 lt!418396 k0!1099)))

(declare-fun lt!418395 () tuple2!13004)

(declare-fun +!2754 (ListLongMap!11701 tuple2!13004) ListLongMap!11701)

(assert (=> b!927942 (= lt!418396 (+!2754 lt!418400 lt!418395))))

(declare-fun lt!418408 () Unit!31394)

(declare-fun addStillContains!478 (ListLongMap!11701 (_ BitVec 64) V!31385 (_ BitVec 64)) Unit!31394)

(assert (=> b!927942 (= lt!418408 (addStillContains!478 lt!418400 lt!418401 lt!418402 k0!1099))))

(declare-fun getCurrentListMap!3115 (array!55590 array!55592 (_ BitVec 32) (_ BitVec 32) V!31385 V!31385 (_ BitVec 32) Int) ListLongMap!11701)

(assert (=> b!927942 (= (getCurrentListMap!3115 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2754 (getCurrentListMap!3115 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418395))))

(assert (=> b!927942 (= lt!418395 (tuple2!13005 lt!418401 lt!418402))))

(declare-fun get!14079 (ValueCell!9426 V!31385) V!31385)

(declare-fun dynLambda!1543 (Int (_ BitVec 64)) V!31385)

(assert (=> b!927942 (= lt!418402 (get!14079 (select (arr!26741 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1543 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418405 () Unit!31394)

(declare-fun lemmaListMapRecursiveValidKeyArray!144 (array!55590 array!55592 (_ BitVec 32) (_ BitVec 32) V!31385 V!31385 (_ BitVec 32) Int) Unit!31394)

(assert (=> b!927942 (= lt!418405 (lemmaListMapRecursiveValidKeyArray!144 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520974 () Unit!31394)

(assert (=> b!927942 (= e!520974 lt!418397)))

(declare-fun b!927943 () Bool)

(declare-fun e!520970 () Unit!31394)

(declare-fun Unit!31396 () Unit!31394)

(assert (=> b!927943 (= e!520970 Unit!31396)))

(declare-fun res!624954 () Bool)

(assert (=> start!79094 (=> (not res!624954) (not e!520980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79094 (= res!624954 (validMask!0 mask!1881))))

(assert (=> start!79094 e!520980))

(assert (=> start!79094 true))

(assert (=> start!79094 tp_is_empty!19815))

(declare-fun array_inv!20820 (array!55592) Bool)

(assert (=> start!79094 (and (array_inv!20820 _values!1231) e!520972)))

(assert (=> start!79094 tp!60362))

(declare-fun array_inv!20821 (array!55590) Bool)

(assert (=> start!79094 (array_inv!20821 _keys!1487)))

(declare-fun b!927944 () Bool)

(assert (=> b!927944 (= e!520975 (not true))))

(assert (=> b!927944 e!520978))

(declare-fun res!624962 () Bool)

(assert (=> b!927944 (=> (not res!624962) (not e!520978))))

(assert (=> b!927944 (= res!624962 (contains!4924 lt!418404 k0!1099))))

(assert (=> b!927944 (= lt!418404 (getCurrentListMap!3115 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!418407 () Unit!31394)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!95 (array!55590 array!55592 (_ BitVec 32) (_ BitVec 32) V!31385 V!31385 (_ BitVec 64) V!31385 (_ BitVec 32) Int) Unit!31394)

(assert (=> b!927944 (= lt!418407 (lemmaListMapApplyFromThenApplyFromZero!95 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927945 () Bool)

(declare-fun e!520971 () Bool)

(declare-fun e!520976 () Bool)

(assert (=> b!927945 (= e!520971 e!520976)))

(declare-fun res!624963 () Bool)

(assert (=> b!927945 (=> (not res!624963) (not e!520976))))

(assert (=> b!927945 (= res!624963 (and (= lt!418393 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!927945 (= lt!418393 (apply!696 lt!418400 k0!1099))))

(declare-fun b!927946 () Bool)

(declare-fun e!520979 () Bool)

(assert (=> b!927946 (= e!520976 e!520979)))

(declare-fun res!624959 () Bool)

(assert (=> b!927946 (=> (not res!624959) (not e!520979))))

(assert (=> b!927946 (= res!624959 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27199 _keys!1487)))))

(declare-fun lt!418403 () Unit!31394)

(assert (=> b!927946 (= lt!418403 e!520970)))

(declare-fun c!96942 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927946 (= c!96942 (validKeyInArray!0 k0!1099))))

(declare-fun b!927947 () Bool)

(assert (=> b!927947 (= e!520970 e!520974)))

(assert (=> b!927947 (= lt!418401 (select (arr!26740 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96941 () Bool)

(assert (=> b!927947 (= c!96941 (validKeyInArray!0 lt!418401))))

(declare-fun b!927948 () Bool)

(assert (=> b!927948 (= e!520979 e!520975)))

(declare-fun res!624956 () Bool)

(assert (=> b!927948 (=> (not res!624956) (not e!520975))))

(assert (=> b!927948 (= res!624956 (contains!4924 lt!418394 k0!1099))))

(assert (=> b!927948 (= lt!418394 (getCurrentListMap!3115 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927949 () Bool)

(declare-fun res!624958 () Bool)

(assert (=> b!927949 (=> (not res!624958) (not e!520980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55590 (_ BitVec 32)) Bool)

(assert (=> b!927949 (= res!624958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!927950 () Bool)

(assert (=> b!927950 (= e!520969 tp_is_empty!19815)))

(declare-fun b!927951 () Bool)

(declare-fun Unit!31397 () Unit!31394)

(assert (=> b!927951 (= e!520974 Unit!31397)))

(declare-fun b!927952 () Bool)

(assert (=> b!927952 (= e!520980 e!520971)))

(declare-fun res!624961 () Bool)

(assert (=> b!927952 (=> (not res!624961) (not e!520971))))

(assert (=> b!927952 (= res!624961 (contains!4924 lt!418400 k0!1099))))

(assert (=> b!927952 (= lt!418400 (getCurrentListMap!3115 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79094 res!624954) b!927940))

(assert (= (and b!927940 res!624955) b!927949))

(assert (= (and b!927949 res!624958) b!927936))

(assert (= (and b!927936 res!624964) b!927934))

(assert (= (and b!927934 res!624957) b!927952))

(assert (= (and b!927952 res!624961) b!927945))

(assert (= (and b!927945 res!624963) b!927946))

(assert (= (and b!927946 c!96942) b!927947))

(assert (= (and b!927946 (not c!96942)) b!927943))

(assert (= (and b!927947 c!96941) b!927942))

(assert (= (and b!927947 (not c!96941)) b!927951))

(assert (= (and b!927942 c!96940) b!927937))

(assert (= (and b!927942 (not c!96940)) b!927939))

(assert (= (and b!927946 res!624959) b!927948))

(assert (= (and b!927948 res!624956) b!927933))

(assert (= (and b!927933 res!624960) b!927944))

(assert (= (and b!927944 res!624962) b!927938))

(assert (= (and b!927941 condMapEmpty!31479) mapIsEmpty!31479))

(assert (= (and b!927941 (not condMapEmpty!31479)) mapNonEmpty!31479))

(get-info :version)

(assert (= (and mapNonEmpty!31479 ((_ is ValueCellFull!9426) mapValue!31479)) b!927950))

(assert (= (and b!927941 ((_ is ValueCellFull!9426) mapDefault!31479)) b!927935))

(assert (= start!79094 b!927941))

(declare-fun b_lambda!13809 () Bool)

(assert (=> (not b_lambda!13809) (not b!927942)))

(declare-fun t!26840 () Bool)

(declare-fun tb!5887 () Bool)

(assert (=> (and start!79094 (= defaultEntry!1235 defaultEntry!1235) t!26840) tb!5887))

(declare-fun result!11597 () Bool)

(assert (=> tb!5887 (= result!11597 tp_is_empty!19815)))

(assert (=> b!927942 t!26840))

(declare-fun b_and!28353 () Bool)

(assert (= b_and!28351 (and (=> t!26840 result!11597) b_and!28353)))

(declare-fun m!862675 () Bool)

(assert (=> b!927946 m!862675))

(declare-fun m!862677 () Bool)

(assert (=> b!927942 m!862677))

(declare-fun m!862679 () Bool)

(assert (=> b!927942 m!862679))

(declare-fun m!862681 () Bool)

(assert (=> b!927942 m!862681))

(declare-fun m!862683 () Bool)

(assert (=> b!927942 m!862683))

(declare-fun m!862685 () Bool)

(assert (=> b!927942 m!862685))

(declare-fun m!862687 () Bool)

(assert (=> b!927942 m!862687))

(assert (=> b!927942 m!862683))

(assert (=> b!927942 m!862685))

(declare-fun m!862689 () Bool)

(assert (=> b!927942 m!862689))

(declare-fun m!862691 () Bool)

(assert (=> b!927942 m!862691))

(declare-fun m!862693 () Bool)

(assert (=> b!927942 m!862693))

(declare-fun m!862695 () Bool)

(assert (=> b!927942 m!862695))

(declare-fun m!862697 () Bool)

(assert (=> b!927942 m!862697))

(declare-fun m!862699 () Bool)

(assert (=> b!927942 m!862699))

(declare-fun m!862701 () Bool)

(assert (=> b!927942 m!862701))

(assert (=> b!927942 m!862699))

(declare-fun m!862703 () Bool)

(assert (=> b!927942 m!862703))

(declare-fun m!862705 () Bool)

(assert (=> b!927942 m!862705))

(declare-fun m!862707 () Bool)

(assert (=> b!927942 m!862707))

(declare-fun m!862709 () Bool)

(assert (=> b!927945 m!862709))

(declare-fun m!862711 () Bool)

(assert (=> b!927948 m!862711))

(assert (=> b!927948 m!862691))

(declare-fun m!862713 () Bool)

(assert (=> b!927936 m!862713))

(declare-fun m!862715 () Bool)

(assert (=> b!927938 m!862715))

(declare-fun m!862717 () Bool)

(assert (=> start!79094 m!862717))

(declare-fun m!862719 () Bool)

(assert (=> start!79094 m!862719))

(declare-fun m!862721 () Bool)

(assert (=> start!79094 m!862721))

(declare-fun m!862723 () Bool)

(assert (=> b!927949 m!862723))

(declare-fun m!862725 () Bool)

(assert (=> b!927937 m!862725))

(declare-fun m!862727 () Bool)

(assert (=> mapNonEmpty!31479 m!862727))

(declare-fun m!862729 () Bool)

(assert (=> b!927944 m!862729))

(declare-fun m!862731 () Bool)

(assert (=> b!927944 m!862731))

(declare-fun m!862733 () Bool)

(assert (=> b!927944 m!862733))

(declare-fun m!862735 () Bool)

(assert (=> b!927933 m!862735))

(declare-fun m!862737 () Bool)

(assert (=> b!927947 m!862737))

(declare-fun m!862739 () Bool)

(assert (=> b!927947 m!862739))

(declare-fun m!862741 () Bool)

(assert (=> b!927952 m!862741))

(declare-fun m!862743 () Bool)

(assert (=> b!927952 m!862743))

(check-sat (not b!927949) (not b!927944) b_and!28353 (not b_next!17307) (not b!927945) (not b!927938) (not b!927933) (not start!79094) (not b!927952) (not b!927948) (not b!927942) (not b_lambda!13809) (not b!927937) tp_is_empty!19815 (not b!927946) (not mapNonEmpty!31479) (not b!927947) (not b!927936))
(check-sat b_and!28353 (not b_next!17307))
