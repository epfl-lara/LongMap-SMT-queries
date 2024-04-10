; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79672 () Bool)

(assert start!79672)

(declare-fun b_free!17721 () Bool)

(declare-fun b_next!17721 () Bool)

(assert (=> start!79672 (= b_free!17721 (not b_next!17721))))

(declare-fun tp!61619 () Bool)

(declare-fun b_and!29033 () Bool)

(assert (=> start!79672 (= tp!61619 b_and!29033)))

(declare-fun res!630767 () Bool)

(declare-fun e!526140 () Bool)

(assert (=> start!79672 (=> (not res!630767) (not e!526140))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79672 (= res!630767 (validMask!0 mask!1881))))

(assert (=> start!79672 e!526140))

(assert (=> start!79672 true))

(declare-fun tp_is_empty!20229 () Bool)

(assert (=> start!79672 tp_is_empty!20229))

(declare-datatypes ((V!31937 0))(
  ( (V!31938 (val!10165 Int)) )
))
(declare-datatypes ((ValueCell!9633 0))(
  ( (ValueCellFull!9633 (v!12690 V!31937)) (EmptyCell!9633) )
))
(declare-datatypes ((array!56398 0))(
  ( (array!56399 (arr!27139 (Array (_ BitVec 32) ValueCell!9633)) (size!27598 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56398)

(declare-fun e!526146 () Bool)

(declare-fun array_inv!21116 (array!56398) Bool)

(assert (=> start!79672 (and (array_inv!21116 _values!1231) e!526146)))

(assert (=> start!79672 tp!61619))

(declare-datatypes ((array!56400 0))(
  ( (array!56401 (arr!27140 (Array (_ BitVec 32) (_ BitVec 64))) (size!27599 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56400)

(declare-fun array_inv!21117 (array!56400) Bool)

(assert (=> start!79672 (array_inv!21117 _keys!1487)))

(declare-fun mapIsEmpty!32115 () Bool)

(declare-fun mapRes!32115 () Bool)

(assert (=> mapIsEmpty!32115 mapRes!32115))

(declare-fun b!936988 () Bool)

(declare-fun e!526137 () Bool)

(assert (=> b!936988 (= e!526140 e!526137)))

(declare-fun res!630764 () Bool)

(assert (=> b!936988 (=> (not res!630764) (not e!526137))))

(declare-datatypes ((tuple2!13350 0))(
  ( (tuple2!13351 (_1!6686 (_ BitVec 64)) (_2!6686 V!31937)) )
))
(declare-datatypes ((List!19129 0))(
  ( (Nil!19126) (Cons!19125 (h!20271 tuple2!13350) (t!27394 List!19129)) )
))
(declare-datatypes ((ListLongMap!12047 0))(
  ( (ListLongMap!12048 (toList!6039 List!19129)) )
))
(declare-fun lt!422661 () ListLongMap!12047)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5098 (ListLongMap!12047 (_ BitVec 64)) Bool)

(assert (=> b!936988 (= res!630764 (contains!5098 lt!422661 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31937)

(declare-fun minValue!1173 () V!31937)

(declare-fun getCurrentListMap!3274 (array!56400 array!56398 (_ BitVec 32) (_ BitVec 32) V!31937 V!31937 (_ BitVec 32) Int) ListLongMap!12047)

(assert (=> b!936988 (= lt!422661 (getCurrentListMap!3274 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936989 () Bool)

(declare-fun res!630765 () Bool)

(assert (=> b!936989 (=> (not res!630765) (not e!526140))))

(assert (=> b!936989 (= res!630765 (and (= (size!27598 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27599 _keys!1487) (size!27598 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936990 () Bool)

(declare-fun e!526143 () Bool)

(assert (=> b!936990 (= e!526143 tp_is_empty!20229)))

(declare-fun b!936991 () Bool)

(declare-fun e!526145 () Bool)

(assert (=> b!936991 (= e!526146 (and e!526145 mapRes!32115))))

(declare-fun condMapEmpty!32115 () Bool)

(declare-fun mapDefault!32115 () ValueCell!9633)

(assert (=> b!936991 (= condMapEmpty!32115 (= (arr!27139 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9633)) mapDefault!32115)))))

(declare-fun b!936992 () Bool)

(declare-fun res!630763 () Bool)

(assert (=> b!936992 (=> (not res!630763) (not e!526140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56400 (_ BitVec 32)) Bool)

(assert (=> b!936992 (= res!630763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936993 () Bool)

(declare-fun e!526138 () Bool)

(assert (=> b!936993 (= e!526138 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936994 () Bool)

(declare-fun e!526144 () Bool)

(assert (=> b!936994 (= e!526144 false)))

(declare-datatypes ((Unit!31616 0))(
  ( (Unit!31617) )
))
(declare-fun lt!422654 () Unit!31616)

(declare-fun e!526139 () Unit!31616)

(assert (=> b!936994 (= lt!422654 e!526139)))

(declare-fun c!97496 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936994 (= c!97496 (validKeyInArray!0 k0!1099))))

(declare-fun b!936995 () Bool)

(assert (=> b!936995 (= e!526145 tp_is_empty!20229)))

(declare-fun b!936996 () Bool)

(declare-fun res!630768 () Bool)

(assert (=> b!936996 (=> (not res!630768) (not e!526140))))

(assert (=> b!936996 (= res!630768 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27599 _keys!1487))))))

(declare-fun b!936997 () Bool)

(declare-fun lt!422662 () ListLongMap!12047)

(declare-fun lt!422652 () V!31937)

(declare-fun apply!841 (ListLongMap!12047 (_ BitVec 64)) V!31937)

(assert (=> b!936997 (= (apply!841 lt!422662 k0!1099) lt!422652)))

(declare-fun lt!422658 () V!31937)

(declare-fun lt!422653 () Unit!31616)

(declare-fun lt!422656 () (_ BitVec 64))

(declare-fun addApplyDifferent!427 (ListLongMap!12047 (_ BitVec 64) V!31937 (_ BitVec 64)) Unit!31616)

(assert (=> b!936997 (= lt!422653 (addApplyDifferent!427 lt!422661 lt!422656 lt!422658 k0!1099))))

(assert (=> b!936997 (not (= lt!422656 k0!1099))))

(declare-fun lt!422651 () Unit!31616)

(declare-datatypes ((List!19130 0))(
  ( (Nil!19127) (Cons!19126 (h!20272 (_ BitVec 64)) (t!27395 List!19130)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56400 (_ BitVec 64) (_ BitVec 32) List!19130) Unit!31616)

(assert (=> b!936997 (= lt!422651 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19127))))

(assert (=> b!936997 e!526138))

(declare-fun c!97497 () Bool)

(assert (=> b!936997 (= c!97497 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422655 () Unit!31616)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!300 (array!56400 array!56398 (_ BitVec 32) (_ BitVec 32) V!31937 V!31937 (_ BitVec 64) (_ BitVec 32) Int) Unit!31616)

(assert (=> b!936997 (= lt!422655 (lemmaListMapContainsThenArrayContainsFrom!300 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56400 (_ BitVec 32) List!19130) Bool)

(assert (=> b!936997 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19127)))

(declare-fun lt!422663 () Unit!31616)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56400 (_ BitVec 32) (_ BitVec 32)) Unit!31616)

(assert (=> b!936997 (= lt!422663 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!936997 (contains!5098 lt!422662 k0!1099)))

(declare-fun lt!422659 () tuple2!13350)

(declare-fun +!2828 (ListLongMap!12047 tuple2!13350) ListLongMap!12047)

(assert (=> b!936997 (= lt!422662 (+!2828 lt!422661 lt!422659))))

(declare-fun lt!422657 () Unit!31616)

(declare-fun addStillContains!547 (ListLongMap!12047 (_ BitVec 64) V!31937 (_ BitVec 64)) Unit!31616)

(assert (=> b!936997 (= lt!422657 (addStillContains!547 lt!422661 lt!422656 lt!422658 k0!1099))))

(assert (=> b!936997 (= (getCurrentListMap!3274 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2828 (getCurrentListMap!3274 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422659))))

(assert (=> b!936997 (= lt!422659 (tuple2!13351 lt!422656 lt!422658))))

(declare-fun get!14306 (ValueCell!9633 V!31937) V!31937)

(declare-fun dynLambda!1617 (Int (_ BitVec 64)) V!31937)

(assert (=> b!936997 (= lt!422658 (get!14306 (select (arr!27139 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1617 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422660 () Unit!31616)

(declare-fun lemmaListMapRecursiveValidKeyArray!218 (array!56400 array!56398 (_ BitVec 32) (_ BitVec 32) V!31937 V!31937 (_ BitVec 32) Int) Unit!31616)

(assert (=> b!936997 (= lt!422660 (lemmaListMapRecursiveValidKeyArray!218 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526141 () Unit!31616)

(assert (=> b!936997 (= e!526141 lt!422653)))

(declare-fun b!936998 () Bool)

(declare-fun Unit!31618 () Unit!31616)

(assert (=> b!936998 (= e!526139 Unit!31618)))

(declare-fun mapNonEmpty!32115 () Bool)

(declare-fun tp!61618 () Bool)

(assert (=> mapNonEmpty!32115 (= mapRes!32115 (and tp!61618 e!526143))))

(declare-fun mapRest!32115 () (Array (_ BitVec 32) ValueCell!9633))

(declare-fun mapKey!32115 () (_ BitVec 32))

(declare-fun mapValue!32115 () ValueCell!9633)

(assert (=> mapNonEmpty!32115 (= (arr!27139 _values!1231) (store mapRest!32115 mapKey!32115 mapValue!32115))))

(declare-fun b!936999 () Bool)

(assert (=> b!936999 (= e!526137 e!526144)))

(declare-fun res!630766 () Bool)

(assert (=> b!936999 (=> (not res!630766) (not e!526144))))

(declare-fun v!791 () V!31937)

(assert (=> b!936999 (= res!630766 (and (= lt!422652 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!936999 (= lt!422652 (apply!841 lt!422661 k0!1099))))

(declare-fun b!937000 () Bool)

(declare-fun Unit!31619 () Unit!31616)

(assert (=> b!937000 (= e!526141 Unit!31619)))

(declare-fun b!937001 () Bool)

(declare-fun res!630769 () Bool)

(assert (=> b!937001 (=> (not res!630769) (not e!526140))))

(assert (=> b!937001 (= res!630769 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19127))))

(declare-fun b!937002 () Bool)

(declare-fun arrayContainsKey!0 (array!56400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937002 (= e!526138 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937003 () Bool)

(assert (=> b!937003 (= e!526139 e!526141)))

(assert (=> b!937003 (= lt!422656 (select (arr!27140 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97495 () Bool)

(assert (=> b!937003 (= c!97495 (validKeyInArray!0 lt!422656))))

(assert (= (and start!79672 res!630767) b!936989))

(assert (= (and b!936989 res!630765) b!936992))

(assert (= (and b!936992 res!630763) b!937001))

(assert (= (and b!937001 res!630769) b!936996))

(assert (= (and b!936996 res!630768) b!936988))

(assert (= (and b!936988 res!630764) b!936999))

(assert (= (and b!936999 res!630766) b!936994))

(assert (= (and b!936994 c!97496) b!937003))

(assert (= (and b!936994 (not c!97496)) b!936998))

(assert (= (and b!937003 c!97495) b!936997))

(assert (= (and b!937003 (not c!97495)) b!937000))

(assert (= (and b!936997 c!97497) b!937002))

(assert (= (and b!936997 (not c!97497)) b!936993))

(assert (= (and b!936991 condMapEmpty!32115) mapIsEmpty!32115))

(assert (= (and b!936991 (not condMapEmpty!32115)) mapNonEmpty!32115))

(get-info :version)

(assert (= (and mapNonEmpty!32115 ((_ is ValueCellFull!9633) mapValue!32115)) b!936990))

(assert (= (and b!936991 ((_ is ValueCellFull!9633) mapDefault!32115)) b!936995))

(assert (= start!79672 b!936991))

(declare-fun b_lambda!14127 () Bool)

(assert (=> (not b_lambda!14127) (not b!936997)))

(declare-fun t!27393 () Bool)

(declare-fun tb!6115 () Bool)

(assert (=> (and start!79672 (= defaultEntry!1235 defaultEntry!1235) t!27393) tb!6115))

(declare-fun result!12063 () Bool)

(assert (=> tb!6115 (= result!12063 tp_is_empty!20229)))

(assert (=> b!936997 t!27393))

(declare-fun b_and!29035 () Bool)

(assert (= b_and!29033 (and (=> t!27393 result!12063) b_and!29035)))

(declare-fun m!871679 () Bool)

(assert (=> b!936992 m!871679))

(declare-fun m!871681 () Bool)

(assert (=> b!937003 m!871681))

(declare-fun m!871683 () Bool)

(assert (=> b!937003 m!871683))

(declare-fun m!871685 () Bool)

(assert (=> mapNonEmpty!32115 m!871685))

(declare-fun m!871687 () Bool)

(assert (=> b!936997 m!871687))

(declare-fun m!871689 () Bool)

(assert (=> b!936997 m!871689))

(declare-fun m!871691 () Bool)

(assert (=> b!936997 m!871691))

(declare-fun m!871693 () Bool)

(assert (=> b!936997 m!871693))

(declare-fun m!871695 () Bool)

(assert (=> b!936997 m!871695))

(assert (=> b!936997 m!871689))

(declare-fun m!871697 () Bool)

(assert (=> b!936997 m!871697))

(declare-fun m!871699 () Bool)

(assert (=> b!936997 m!871699))

(declare-fun m!871701 () Bool)

(assert (=> b!936997 m!871701))

(declare-fun m!871703 () Bool)

(assert (=> b!936997 m!871703))

(declare-fun m!871705 () Bool)

(assert (=> b!936997 m!871705))

(declare-fun m!871707 () Bool)

(assert (=> b!936997 m!871707))

(assert (=> b!936997 m!871695))

(declare-fun m!871709 () Bool)

(assert (=> b!936997 m!871709))

(declare-fun m!871711 () Bool)

(assert (=> b!936997 m!871711))

(assert (=> b!936997 m!871691))

(declare-fun m!871713 () Bool)

(assert (=> b!936997 m!871713))

(declare-fun m!871715 () Bool)

(assert (=> b!936997 m!871715))

(declare-fun m!871717 () Bool)

(assert (=> b!936997 m!871717))

(declare-fun m!871719 () Bool)

(assert (=> b!936999 m!871719))

(declare-fun m!871721 () Bool)

(assert (=> b!936988 m!871721))

(declare-fun m!871723 () Bool)

(assert (=> b!936988 m!871723))

(declare-fun m!871725 () Bool)

(assert (=> b!937002 m!871725))

(declare-fun m!871727 () Bool)

(assert (=> b!936994 m!871727))

(declare-fun m!871729 () Bool)

(assert (=> b!937001 m!871729))

(declare-fun m!871731 () Bool)

(assert (=> start!79672 m!871731))

(declare-fun m!871733 () Bool)

(assert (=> start!79672 m!871733))

(declare-fun m!871735 () Bool)

(assert (=> start!79672 m!871735))

(check-sat (not b!936997) tp_is_empty!20229 (not b_lambda!14127) (not b!936999) (not b!937002) (not mapNonEmpty!32115) (not b!936988) (not b!937001) (not b!937003) b_and!29035 (not b!936992) (not start!79672) (not b_next!17721) (not b!936994))
(check-sat b_and!29035 (not b_next!17721))
