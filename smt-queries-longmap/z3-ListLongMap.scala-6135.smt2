; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79086 () Bool)

(assert start!79086)

(declare-fun b_free!17131 () Bool)

(declare-fun b_next!17131 () Bool)

(assert (=> start!79086 (= b_free!17131 (not b_next!17131))))

(declare-fun tp!59835 () Bool)

(declare-fun b_and!28009 () Bool)

(assert (=> start!79086 (= tp!59835 b_and!28009)))

(declare-fun b!923703 () Bool)

(declare-fun res!622618 () Bool)

(declare-fun e!518348 () Bool)

(assert (=> b!923703 (=> (not res!622618) (not e!518348))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!923703 (= res!622618 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!923704 () Bool)

(declare-fun e!518346 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!923704 (= e!518346 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923705 () Bool)

(declare-fun e!518345 () Bool)

(declare-fun tp_is_empty!19639 () Bool)

(assert (=> b!923705 (= e!518345 tp_is_empty!19639)))

(declare-fun b!923706 () Bool)

(declare-fun e!518343 () Bool)

(assert (=> b!923706 (= e!518343 tp_is_empty!19639)))

(declare-fun b!923707 () Bool)

(declare-fun e!518350 () Bool)

(assert (=> b!923707 (= e!518350 (not true))))

(declare-fun lt!414806 () (_ BitVec 64))

(assert (=> b!923707 (not (= lt!414806 k0!1099))))

(declare-datatypes ((Unit!31130 0))(
  ( (Unit!31131) )
))
(declare-fun lt!414810 () Unit!31130)

(declare-datatypes ((array!55301 0))(
  ( (array!55302 (arr!26591 (Array (_ BitVec 32) (_ BitVec 64))) (size!27051 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55301)

(declare-datatypes ((List!18652 0))(
  ( (Nil!18649) (Cons!18648 (h!19800 (_ BitVec 64)) (t!26505 List!18652)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55301 (_ BitVec 64) (_ BitVec 32) List!18652) Unit!31130)

(assert (=> b!923707 (= lt!414810 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18649))))

(assert (=> b!923707 e!518346))

(declare-fun c!96480 () Bool)

(assert (=> b!923707 (= c!96480 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!414808 () Unit!31130)

(declare-datatypes ((V!31151 0))(
  ( (V!31152 (val!9870 Int)) )
))
(declare-datatypes ((ValueCell!9338 0))(
  ( (ValueCellFull!9338 (v!12385 V!31151)) (EmptyCell!9338) )
))
(declare-datatypes ((array!55303 0))(
  ( (array!55304 (arr!26592 (Array (_ BitVec 32) ValueCell!9338)) (size!27052 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55303)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31151)

(declare-fun minValue!1173 () V!31151)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!200 (array!55301 array!55303 (_ BitVec 32) (_ BitVec 32) V!31151 V!31151 (_ BitVec 64) (_ BitVec 32) Int) Unit!31130)

(assert (=> b!923707 (= lt!414808 (lemmaListMapContainsThenArrayContainsFrom!200 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55301 (_ BitVec 32) List!18652) Bool)

(assert (=> b!923707 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18649)))

(declare-fun lt!414812 () Unit!31130)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55301 (_ BitVec 32) (_ BitVec 32)) Unit!31130)

(assert (=> b!923707 (= lt!414812 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12836 0))(
  ( (tuple2!12837 (_1!6429 (_ BitVec 64)) (_2!6429 V!31151)) )
))
(declare-datatypes ((List!18653 0))(
  ( (Nil!18650) (Cons!18649 (h!19801 tuple2!12836) (t!26506 List!18653)) )
))
(declare-datatypes ((ListLongMap!11535 0))(
  ( (ListLongMap!11536 (toList!5783 List!18653)) )
))
(declare-fun lt!414811 () ListLongMap!11535)

(declare-fun lt!414805 () tuple2!12836)

(declare-fun contains!4856 (ListLongMap!11535 (_ BitVec 64)) Bool)

(declare-fun +!2709 (ListLongMap!11535 tuple2!12836) ListLongMap!11535)

(assert (=> b!923707 (contains!4856 (+!2709 lt!414811 lt!414805) k0!1099)))

(declare-fun lt!414804 () V!31151)

(declare-fun lt!414809 () Unit!31130)

(declare-fun addStillContains!418 (ListLongMap!11535 (_ BitVec 64) V!31151 (_ BitVec 64)) Unit!31130)

(assert (=> b!923707 (= lt!414809 (addStillContains!418 lt!414811 lt!414806 lt!414804 k0!1099))))

(declare-fun getCurrentListMap!3034 (array!55301 array!55303 (_ BitVec 32) (_ BitVec 32) V!31151 V!31151 (_ BitVec 32) Int) ListLongMap!11535)

(assert (=> b!923707 (= (getCurrentListMap!3034 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2709 (getCurrentListMap!3034 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414805))))

(assert (=> b!923707 (= lt!414805 (tuple2!12837 lt!414806 lt!414804))))

(declare-fun get!13988 (ValueCell!9338 V!31151) V!31151)

(declare-fun dynLambda!1506 (Int (_ BitVec 64)) V!31151)

(assert (=> b!923707 (= lt!414804 (get!13988 (select (arr!26592 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1506 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414807 () Unit!31130)

(declare-fun lemmaListMapRecursiveValidKeyArray!89 (array!55301 array!55303 (_ BitVec 32) (_ BitVec 32) V!31151 V!31151 (_ BitVec 32) Int) Unit!31130)

(assert (=> b!923707 (= lt!414807 (lemmaListMapRecursiveValidKeyArray!89 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923708 () Bool)

(assert (=> b!923708 (= e!518348 e!518350)))

(declare-fun res!622625 () Bool)

(assert (=> b!923708 (=> (not res!622625) (not e!518350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923708 (= res!622625 (validKeyInArray!0 lt!414806))))

(assert (=> b!923708 (= lt!414806 (select (arr!26591 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31215 () Bool)

(declare-fun mapRes!31215 () Bool)

(assert (=> mapIsEmpty!31215 mapRes!31215))

(declare-fun b!923709 () Bool)

(declare-fun res!622626 () Bool)

(declare-fun e!518349 () Bool)

(assert (=> b!923709 (=> (not res!622626) (not e!518349))))

(assert (=> b!923709 (= res!622626 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18649))))

(declare-fun b!923710 () Bool)

(declare-fun res!622622 () Bool)

(assert (=> b!923710 (=> (not res!622622) (not e!518348))))

(assert (=> b!923710 (= res!622622 (validKeyInArray!0 k0!1099))))

(declare-fun b!923711 () Bool)

(declare-fun res!622617 () Bool)

(assert (=> b!923711 (=> (not res!622617) (not e!518348))))

(declare-fun v!791 () V!31151)

(declare-fun apply!639 (ListLongMap!11535 (_ BitVec 64)) V!31151)

(assert (=> b!923711 (= res!622617 (= (apply!639 lt!414811 k0!1099) v!791))))

(declare-fun res!622621 () Bool)

(assert (=> start!79086 (=> (not res!622621) (not e!518349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79086 (= res!622621 (validMask!0 mask!1881))))

(assert (=> start!79086 e!518349))

(assert (=> start!79086 true))

(assert (=> start!79086 tp_is_empty!19639))

(declare-fun e!518344 () Bool)

(declare-fun array_inv!20812 (array!55303) Bool)

(assert (=> start!79086 (and (array_inv!20812 _values!1231) e!518344)))

(assert (=> start!79086 tp!59835))

(declare-fun array_inv!20813 (array!55301) Bool)

(assert (=> start!79086 (array_inv!20813 _keys!1487)))

(declare-fun b!923712 () Bool)

(declare-fun arrayContainsKey!0 (array!55301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923712 (= e!518346 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapNonEmpty!31215 () Bool)

(declare-fun tp!59834 () Bool)

(assert (=> mapNonEmpty!31215 (= mapRes!31215 (and tp!59834 e!518343))))

(declare-fun mapValue!31215 () ValueCell!9338)

(declare-fun mapRest!31215 () (Array (_ BitVec 32) ValueCell!9338))

(declare-fun mapKey!31215 () (_ BitVec 32))

(assert (=> mapNonEmpty!31215 (= (arr!26592 _values!1231) (store mapRest!31215 mapKey!31215 mapValue!31215))))

(declare-fun b!923713 () Bool)

(declare-fun res!622624 () Bool)

(assert (=> b!923713 (=> (not res!622624) (not e!518349))))

(assert (=> b!923713 (= res!622624 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27051 _keys!1487))))))

(declare-fun b!923714 () Bool)

(assert (=> b!923714 (= e!518344 (and e!518345 mapRes!31215))))

(declare-fun condMapEmpty!31215 () Bool)

(declare-fun mapDefault!31215 () ValueCell!9338)

(assert (=> b!923714 (= condMapEmpty!31215 (= (arr!26592 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9338)) mapDefault!31215)))))

(declare-fun b!923715 () Bool)

(declare-fun res!622619 () Bool)

(assert (=> b!923715 (=> (not res!622619) (not e!518349))))

(assert (=> b!923715 (= res!622619 (and (= (size!27052 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27051 _keys!1487) (size!27052 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923716 () Bool)

(declare-fun res!622623 () Bool)

(assert (=> b!923716 (=> (not res!622623) (not e!518349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55301 (_ BitVec 32)) Bool)

(assert (=> b!923716 (= res!622623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923717 () Bool)

(assert (=> b!923717 (= e!518349 e!518348)))

(declare-fun res!622620 () Bool)

(assert (=> b!923717 (=> (not res!622620) (not e!518348))))

(assert (=> b!923717 (= res!622620 (contains!4856 lt!414811 k0!1099))))

(assert (=> b!923717 (= lt!414811 (getCurrentListMap!3034 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79086 res!622621) b!923715))

(assert (= (and b!923715 res!622619) b!923716))

(assert (= (and b!923716 res!622623) b!923709))

(assert (= (and b!923709 res!622626) b!923713))

(assert (= (and b!923713 res!622624) b!923717))

(assert (= (and b!923717 res!622620) b!923711))

(assert (= (and b!923711 res!622617) b!923703))

(assert (= (and b!923703 res!622618) b!923710))

(assert (= (and b!923710 res!622622) b!923708))

(assert (= (and b!923708 res!622625) b!923707))

(assert (= (and b!923707 c!96480) b!923712))

(assert (= (and b!923707 (not c!96480)) b!923704))

(assert (= (and b!923714 condMapEmpty!31215) mapIsEmpty!31215))

(assert (= (and b!923714 (not condMapEmpty!31215)) mapNonEmpty!31215))

(get-info :version)

(assert (= (and mapNonEmpty!31215 ((_ is ValueCellFull!9338) mapValue!31215)) b!923706))

(assert (= (and b!923714 ((_ is ValueCellFull!9338) mapDefault!31215)) b!923705))

(assert (= start!79086 b!923714))

(declare-fun b_lambda!13647 () Bool)

(assert (=> (not b_lambda!13647) (not b!923707)))

(declare-fun t!26504 () Bool)

(declare-fun tb!5703 () Bool)

(assert (=> (and start!79086 (= defaultEntry!1235 defaultEntry!1235) t!26504) tb!5703))

(declare-fun result!11237 () Bool)

(assert (=> tb!5703 (= result!11237 tp_is_empty!19639)))

(assert (=> b!923707 t!26504))

(declare-fun b_and!28011 () Bool)

(assert (= b_and!28009 (and (=> t!26504 result!11237) b_and!28011)))

(declare-fun m!858217 () Bool)

(assert (=> b!923707 m!858217))

(assert (=> b!923707 m!858217))

(declare-fun m!858219 () Bool)

(assert (=> b!923707 m!858219))

(declare-fun m!858221 () Bool)

(assert (=> b!923707 m!858221))

(declare-fun m!858223 () Bool)

(assert (=> b!923707 m!858223))

(declare-fun m!858225 () Bool)

(assert (=> b!923707 m!858225))

(declare-fun m!858227 () Bool)

(assert (=> b!923707 m!858227))

(assert (=> b!923707 m!858223))

(assert (=> b!923707 m!858225))

(declare-fun m!858229 () Bool)

(assert (=> b!923707 m!858229))

(declare-fun m!858231 () Bool)

(assert (=> b!923707 m!858231))

(declare-fun m!858233 () Bool)

(assert (=> b!923707 m!858233))

(declare-fun m!858235 () Bool)

(assert (=> b!923707 m!858235))

(declare-fun m!858237 () Bool)

(assert (=> b!923707 m!858237))

(declare-fun m!858239 () Bool)

(assert (=> b!923707 m!858239))

(declare-fun m!858241 () Bool)

(assert (=> b!923707 m!858241))

(assert (=> b!923707 m!858237))

(declare-fun m!858243 () Bool)

(assert (=> b!923707 m!858243))

(declare-fun m!858245 () Bool)

(assert (=> b!923716 m!858245))

(declare-fun m!858247 () Bool)

(assert (=> mapNonEmpty!31215 m!858247))

(declare-fun m!858249 () Bool)

(assert (=> b!923711 m!858249))

(declare-fun m!858251 () Bool)

(assert (=> b!923709 m!858251))

(declare-fun m!858253 () Bool)

(assert (=> b!923717 m!858253))

(declare-fun m!858255 () Bool)

(assert (=> b!923717 m!858255))

(declare-fun m!858257 () Bool)

(assert (=> b!923710 m!858257))

(declare-fun m!858259 () Bool)

(assert (=> start!79086 m!858259))

(declare-fun m!858261 () Bool)

(assert (=> start!79086 m!858261))

(declare-fun m!858263 () Bool)

(assert (=> start!79086 m!858263))

(declare-fun m!858265 () Bool)

(assert (=> b!923708 m!858265))

(declare-fun m!858267 () Bool)

(assert (=> b!923708 m!858267))

(declare-fun m!858269 () Bool)

(assert (=> b!923712 m!858269))

(check-sat (not b!923708) (not mapNonEmpty!31215) tp_is_empty!19639 (not b!923707) (not b!923711) (not b!923717) (not b!923710) (not b!923709) (not b_next!17131) (not b!923712) (not b!923716) (not b_lambda!13647) b_and!28011 (not start!79086))
(check-sat b_and!28011 (not b_next!17131))
