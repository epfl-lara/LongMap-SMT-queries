; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79364 () Bool)

(assert start!79364)

(declare-fun b_free!17569 () Bool)

(declare-fun b_next!17569 () Bool)

(assert (=> start!79364 (= b_free!17569 (not b_next!17569))))

(declare-fun tp!61152 () Bool)

(declare-fun b_and!28671 () Bool)

(assert (=> start!79364 (= tp!61152 b_and!28671)))

(declare-fun b!932411 () Bool)

(declare-fun e!523591 () Bool)

(declare-fun e!523589 () Bool)

(assert (=> b!932411 (= e!523591 e!523589)))

(declare-fun res!628027 () Bool)

(assert (=> b!932411 (=> (not res!628027) (not e!523589))))

(declare-fun lt!419764 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932411 (= res!628027 (validKeyInArray!0 lt!419764))))

(declare-datatypes ((array!56061 0))(
  ( (array!56062 (arr!26975 (Array (_ BitVec 32) (_ BitVec 64))) (size!27436 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56061)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932411 (= lt!419764 (select (arr!26975 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932412 () Bool)

(declare-fun res!628033 () Bool)

(declare-fun e!523592 () Bool)

(assert (=> b!932412 (=> (not res!628033) (not e!523592))))

(declare-datatypes ((List!19025 0))(
  ( (Nil!19022) (Cons!19021 (h!20167 (_ BitVec 64)) (t!27129 List!19025)) )
))
(declare-fun arrayNoDuplicates!0 (array!56061 (_ BitVec 32) List!19025) Bool)

(assert (=> b!932412 (= res!628033 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19022))))

(declare-fun mapNonEmpty!31875 () Bool)

(declare-fun mapRes!31875 () Bool)

(declare-fun tp!61151 () Bool)

(declare-fun e!523590 () Bool)

(assert (=> mapNonEmpty!31875 (= mapRes!31875 (and tp!61151 e!523590))))

(declare-datatypes ((V!31735 0))(
  ( (V!31736 (val!10089 Int)) )
))
(declare-datatypes ((ValueCell!9557 0))(
  ( (ValueCellFull!9557 (v!12607 V!31735)) (EmptyCell!9557) )
))
(declare-fun mapRest!31875 () (Array (_ BitVec 32) ValueCell!9557))

(declare-fun mapKey!31875 () (_ BitVec 32))

(declare-datatypes ((array!56063 0))(
  ( (array!56064 (arr!26976 (Array (_ BitVec 32) ValueCell!9557)) (size!27437 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56063)

(declare-fun mapValue!31875 () ValueCell!9557)

(assert (=> mapNonEmpty!31875 (= (arr!26976 _values!1231) (store mapRest!31875 mapKey!31875 mapValue!31875))))

(declare-fun b!932413 () Bool)

(assert (=> b!932413 (= e!523589 (not true))))

(assert (=> b!932413 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19022)))

(declare-datatypes ((Unit!31380 0))(
  ( (Unit!31381) )
))
(declare-fun lt!419760 () Unit!31380)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56061 (_ BitVec 32) (_ BitVec 32)) Unit!31380)

(assert (=> b!932413 (= lt!419760 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13274 0))(
  ( (tuple2!13275 (_1!6648 (_ BitVec 64)) (_2!6648 V!31735)) )
))
(declare-datatypes ((List!19026 0))(
  ( (Nil!19023) (Cons!19022 (h!20168 tuple2!13274) (t!27130 List!19026)) )
))
(declare-datatypes ((ListLongMap!11961 0))(
  ( (ListLongMap!11962 (toList!5996 List!19026)) )
))
(declare-fun lt!419761 () ListLongMap!11961)

(declare-fun lt!419763 () tuple2!13274)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4994 (ListLongMap!11961 (_ BitVec 64)) Bool)

(declare-fun +!2805 (ListLongMap!11961 tuple2!13274) ListLongMap!11961)

(assert (=> b!932413 (contains!4994 (+!2805 lt!419761 lt!419763) k0!1099)))

(declare-fun lt!419762 () Unit!31380)

(declare-fun lt!419766 () V!31735)

(declare-fun addStillContains!494 (ListLongMap!11961 (_ BitVec 64) V!31735 (_ BitVec 64)) Unit!31380)

(assert (=> b!932413 (= lt!419762 (addStillContains!494 lt!419761 lt!419764 lt!419766 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31735)

(declare-fun minValue!1173 () V!31735)

(declare-fun getCurrentListMap!3169 (array!56061 array!56063 (_ BitVec 32) (_ BitVec 32) V!31735 V!31735 (_ BitVec 32) Int) ListLongMap!11961)

(assert (=> b!932413 (= (getCurrentListMap!3169 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2805 (getCurrentListMap!3169 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419763))))

(assert (=> b!932413 (= lt!419763 (tuple2!13275 lt!419764 lt!419766))))

(declare-fun get!14193 (ValueCell!9557 V!31735) V!31735)

(declare-fun dynLambda!1561 (Int (_ BitVec 64)) V!31735)

(assert (=> b!932413 (= lt!419766 (get!14193 (select (arr!26976 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1561 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419765 () Unit!31380)

(declare-fun lemmaListMapRecursiveValidKeyArray!169 (array!56061 array!56063 (_ BitVec 32) (_ BitVec 32) V!31735 V!31735 (_ BitVec 32) Int) Unit!31380)

(assert (=> b!932413 (= lt!419765 (lemmaListMapRecursiveValidKeyArray!169 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932414 () Bool)

(declare-fun res!628034 () Bool)

(assert (=> b!932414 (=> (not res!628034) (not e!523591))))

(assert (=> b!932414 (= res!628034 (validKeyInArray!0 k0!1099))))

(declare-fun b!932415 () Bool)

(declare-fun res!628025 () Bool)

(assert (=> b!932415 (=> (not res!628025) (not e!523592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56061 (_ BitVec 32)) Bool)

(assert (=> b!932415 (= res!628025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932416 () Bool)

(declare-fun tp_is_empty!20077 () Bool)

(assert (=> b!932416 (= e!523590 tp_is_empty!20077)))

(declare-fun b!932417 () Bool)

(declare-fun res!628026 () Bool)

(assert (=> b!932417 (=> (not res!628026) (not e!523592))))

(assert (=> b!932417 (= res!628026 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27436 _keys!1487))))))

(declare-fun b!932418 () Bool)

(declare-fun res!628028 () Bool)

(assert (=> b!932418 (=> (not res!628028) (not e!523591))))

(declare-fun v!791 () V!31735)

(declare-fun apply!786 (ListLongMap!11961 (_ BitVec 64)) V!31735)

(assert (=> b!932418 (= res!628028 (= (apply!786 lt!419761 k0!1099) v!791))))

(declare-fun b!932419 () Bool)

(declare-fun res!628029 () Bool)

(assert (=> b!932419 (=> (not res!628029) (not e!523592))))

(assert (=> b!932419 (= res!628029 (and (= (size!27437 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27436 _keys!1487) (size!27437 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31875 () Bool)

(assert (=> mapIsEmpty!31875 mapRes!31875))

(declare-fun b!932420 () Bool)

(declare-fun res!628032 () Bool)

(assert (=> b!932420 (=> (not res!628032) (not e!523591))))

(assert (=> b!932420 (= res!628032 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932421 () Bool)

(declare-fun e!523594 () Bool)

(declare-fun e!523593 () Bool)

(assert (=> b!932421 (= e!523594 (and e!523593 mapRes!31875))))

(declare-fun condMapEmpty!31875 () Bool)

(declare-fun mapDefault!31875 () ValueCell!9557)

(assert (=> b!932421 (= condMapEmpty!31875 (= (arr!26976 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9557)) mapDefault!31875)))))

(declare-fun b!932422 () Bool)

(assert (=> b!932422 (= e!523592 e!523591)))

(declare-fun res!628030 () Bool)

(assert (=> b!932422 (=> (not res!628030) (not e!523591))))

(assert (=> b!932422 (= res!628030 (contains!4994 lt!419761 k0!1099))))

(assert (=> b!932422 (= lt!419761 (getCurrentListMap!3169 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932423 () Bool)

(assert (=> b!932423 (= e!523593 tp_is_empty!20077)))

(declare-fun res!628031 () Bool)

(assert (=> start!79364 (=> (not res!628031) (not e!523592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79364 (= res!628031 (validMask!0 mask!1881))))

(assert (=> start!79364 e!523592))

(assert (=> start!79364 true))

(assert (=> start!79364 tp_is_empty!20077))

(declare-fun array_inv!21062 (array!56063) Bool)

(assert (=> start!79364 (and (array_inv!21062 _values!1231) e!523594)))

(assert (=> start!79364 tp!61152))

(declare-fun array_inv!21063 (array!56061) Bool)

(assert (=> start!79364 (array_inv!21063 _keys!1487)))

(assert (= (and start!79364 res!628031) b!932419))

(assert (= (and b!932419 res!628029) b!932415))

(assert (= (and b!932415 res!628025) b!932412))

(assert (= (and b!932412 res!628033) b!932417))

(assert (= (and b!932417 res!628026) b!932422))

(assert (= (and b!932422 res!628030) b!932418))

(assert (= (and b!932418 res!628028) b!932420))

(assert (= (and b!932420 res!628032) b!932414))

(assert (= (and b!932414 res!628034) b!932411))

(assert (= (and b!932411 res!628027) b!932413))

(assert (= (and b!932421 condMapEmpty!31875) mapIsEmpty!31875))

(assert (= (and b!932421 (not condMapEmpty!31875)) mapNonEmpty!31875))

(get-info :version)

(assert (= (and mapNonEmpty!31875 ((_ is ValueCellFull!9557) mapValue!31875)) b!932416))

(assert (= (and b!932421 ((_ is ValueCellFull!9557) mapDefault!31875)) b!932423))

(assert (= start!79364 b!932421))

(declare-fun b_lambda!13885 () Bool)

(assert (=> (not b_lambda!13885) (not b!932413)))

(declare-fun t!27128 () Bool)

(declare-fun tb!5955 () Bool)

(assert (=> (and start!79364 (= defaultEntry!1235 defaultEntry!1235) t!27128) tb!5955))

(declare-fun result!11743 () Bool)

(assert (=> tb!5955 (= result!11743 tp_is_empty!20077)))

(assert (=> b!932413 t!27128))

(declare-fun b_and!28673 () Bool)

(assert (= b_and!28671 (and (=> t!27128 result!11743) b_and!28673)))

(declare-fun m!865889 () Bool)

(assert (=> b!932411 m!865889))

(declare-fun m!865891 () Bool)

(assert (=> b!932411 m!865891))

(declare-fun m!865893 () Bool)

(assert (=> b!932415 m!865893))

(declare-fun m!865895 () Bool)

(assert (=> mapNonEmpty!31875 m!865895))

(declare-fun m!865897 () Bool)

(assert (=> start!79364 m!865897))

(declare-fun m!865899 () Bool)

(assert (=> start!79364 m!865899))

(declare-fun m!865901 () Bool)

(assert (=> start!79364 m!865901))

(declare-fun m!865903 () Bool)

(assert (=> b!932414 m!865903))

(declare-fun m!865905 () Bool)

(assert (=> b!932413 m!865905))

(declare-fun m!865907 () Bool)

(assert (=> b!932413 m!865907))

(declare-fun m!865909 () Bool)

(assert (=> b!932413 m!865909))

(assert (=> b!932413 m!865905))

(declare-fun m!865911 () Bool)

(assert (=> b!932413 m!865911))

(declare-fun m!865913 () Bool)

(assert (=> b!932413 m!865913))

(declare-fun m!865915 () Bool)

(assert (=> b!932413 m!865915))

(declare-fun m!865917 () Bool)

(assert (=> b!932413 m!865917))

(assert (=> b!932413 m!865909))

(assert (=> b!932413 m!865913))

(declare-fun m!865919 () Bool)

(assert (=> b!932413 m!865919))

(declare-fun m!865921 () Bool)

(assert (=> b!932413 m!865921))

(declare-fun m!865923 () Bool)

(assert (=> b!932413 m!865923))

(declare-fun m!865925 () Bool)

(assert (=> b!932413 m!865925))

(assert (=> b!932413 m!865915))

(declare-fun m!865927 () Bool)

(assert (=> b!932413 m!865927))

(declare-fun m!865929 () Bool)

(assert (=> b!932422 m!865929))

(declare-fun m!865931 () Bool)

(assert (=> b!932422 m!865931))

(declare-fun m!865933 () Bool)

(assert (=> b!932412 m!865933))

(declare-fun m!865935 () Bool)

(assert (=> b!932418 m!865935))

(check-sat (not b!932414) (not b!932411) (not b_next!17569) (not mapNonEmpty!31875) (not b!932418) (not b!932412) (not b!932415) (not b!932422) (not b!932413) tp_is_empty!20077 (not start!79364) b_and!28673 (not b_lambda!13885))
(check-sat b_and!28673 (not b_next!17569))
