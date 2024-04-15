; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79400 () Bool)

(assert start!79400)

(declare-fun b_free!17605 () Bool)

(declare-fun b_next!17605 () Bool)

(assert (=> start!79400 (= b_free!17605 (not b_next!17605))))

(declare-fun tp!61259 () Bool)

(declare-fun b_and!28743 () Bool)

(assert (=> start!79400 (= tp!61259 b_and!28743)))

(declare-fun mapNonEmpty!31929 () Bool)

(declare-fun mapRes!31929 () Bool)

(declare-fun tp!61260 () Bool)

(declare-fun e!523969 () Bool)

(assert (=> mapNonEmpty!31929 (= mapRes!31929 (and tp!61260 e!523969))))

(declare-datatypes ((V!31783 0))(
  ( (V!31784 (val!10107 Int)) )
))
(declare-datatypes ((ValueCell!9575 0))(
  ( (ValueCellFull!9575 (v!12625 V!31783)) (EmptyCell!9575) )
))
(declare-fun mapRest!31929 () (Array (_ BitVec 32) ValueCell!9575))

(declare-datatypes ((array!56129 0))(
  ( (array!56130 (arr!27009 (Array (_ BitVec 32) ValueCell!9575)) (size!27470 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56129)

(declare-fun mapValue!31929 () ValueCell!9575)

(declare-fun mapKey!31929 () (_ BitVec 32))

(assert (=> mapNonEmpty!31929 (= (arr!27009 _values!1231) (store mapRest!31929 mapKey!31929 mapValue!31929))))

(declare-fun res!628574 () Bool)

(declare-fun e!523971 () Bool)

(assert (=> start!79400 (=> (not res!628574) (not e!523971))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79400 (= res!628574 (validMask!0 mask!1881))))

(assert (=> start!79400 e!523971))

(assert (=> start!79400 true))

(declare-fun tp_is_empty!20113 () Bool)

(assert (=> start!79400 tp_is_empty!20113))

(declare-fun e!523967 () Bool)

(declare-fun array_inv!21092 (array!56129) Bool)

(assert (=> start!79400 (and (array_inv!21092 _values!1231) e!523967)))

(assert (=> start!79400 tp!61259))

(declare-datatypes ((array!56131 0))(
  ( (array!56132 (arr!27010 (Array (_ BitVec 32) (_ BitVec 64))) (size!27471 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56131)

(declare-fun array_inv!21093 (array!56131) Bool)

(assert (=> start!79400 (array_inv!21093 _keys!1487)))

(declare-fun b!933149 () Bool)

(declare-fun e!523973 () Bool)

(assert (=> b!933149 (= e!523973 (not true))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!19056 0))(
  ( (Nil!19053) (Cons!19052 (h!20198 (_ BitVec 64)) (t!27196 List!19056)) )
))
(declare-fun arrayNoDuplicates!0 (array!56131 (_ BitVec 32) List!19056) Bool)

(assert (=> b!933149 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19053)))

(declare-datatypes ((Unit!31408 0))(
  ( (Unit!31409) )
))
(declare-fun lt!420142 () Unit!31408)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56131 (_ BitVec 32) (_ BitVec 32)) Unit!31408)

(assert (=> b!933149 (= lt!420142 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13306 0))(
  ( (tuple2!13307 (_1!6664 (_ BitVec 64)) (_2!6664 V!31783)) )
))
(declare-datatypes ((List!19057 0))(
  ( (Nil!19054) (Cons!19053 (h!20199 tuple2!13306) (t!27197 List!19057)) )
))
(declare-datatypes ((ListLongMap!11993 0))(
  ( (ListLongMap!11994 (toList!6012 List!19057)) )
))
(declare-fun lt!420141 () ListLongMap!11993)

(declare-fun lt!420144 () tuple2!13306)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5009 (ListLongMap!11993 (_ BitVec 64)) Bool)

(declare-fun +!2819 (ListLongMap!11993 tuple2!13306) ListLongMap!11993)

(assert (=> b!933149 (contains!5009 (+!2819 lt!420141 lt!420144) k0!1099)))

(declare-fun lt!420143 () Unit!31408)

(declare-fun lt!420139 () V!31783)

(declare-fun lt!420138 () (_ BitVec 64))

(declare-fun addStillContains!508 (ListLongMap!11993 (_ BitVec 64) V!31783 (_ BitVec 64)) Unit!31408)

(assert (=> b!933149 (= lt!420143 (addStillContains!508 lt!420141 lt!420138 lt!420139 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31783)

(declare-fun minValue!1173 () V!31783)

(declare-fun getCurrentListMap!3184 (array!56131 array!56129 (_ BitVec 32) (_ BitVec 32) V!31783 V!31783 (_ BitVec 32) Int) ListLongMap!11993)

(assert (=> b!933149 (= (getCurrentListMap!3184 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2819 (getCurrentListMap!3184 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420144))))

(assert (=> b!933149 (= lt!420144 (tuple2!13307 lt!420138 lt!420139))))

(declare-fun get!14219 (ValueCell!9575 V!31783) V!31783)

(declare-fun dynLambda!1575 (Int (_ BitVec 64)) V!31783)

(assert (=> b!933149 (= lt!420139 (get!14219 (select (arr!27009 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1575 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420140 () Unit!31408)

(declare-fun lemmaListMapRecursiveValidKeyArray!183 (array!56131 array!56129 (_ BitVec 32) (_ BitVec 32) V!31783 V!31783 (_ BitVec 32) Int) Unit!31408)

(assert (=> b!933149 (= lt!420140 (lemmaListMapRecursiveValidKeyArray!183 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933150 () Bool)

(declare-fun e!523968 () Bool)

(assert (=> b!933150 (= e!523967 (and e!523968 mapRes!31929))))

(declare-fun condMapEmpty!31929 () Bool)

(declare-fun mapDefault!31929 () ValueCell!9575)

(assert (=> b!933150 (= condMapEmpty!31929 (= (arr!27009 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9575)) mapDefault!31929)))))

(declare-fun b!933151 () Bool)

(declare-fun e!523970 () Bool)

(assert (=> b!933151 (= e!523971 e!523970)))

(declare-fun res!628566 () Bool)

(assert (=> b!933151 (=> (not res!628566) (not e!523970))))

(assert (=> b!933151 (= res!628566 (contains!5009 lt!420141 k0!1099))))

(assert (=> b!933151 (= lt!420141 (getCurrentListMap!3184 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933152 () Bool)

(declare-fun res!628570 () Bool)

(assert (=> b!933152 (=> (not res!628570) (not e!523971))))

(assert (=> b!933152 (= res!628570 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27471 _keys!1487))))))

(declare-fun b!933153 () Bool)

(declare-fun res!628569 () Bool)

(assert (=> b!933153 (=> (not res!628569) (not e!523970))))

(declare-fun v!791 () V!31783)

(declare-fun apply!800 (ListLongMap!11993 (_ BitVec 64)) V!31783)

(assert (=> b!933153 (= res!628569 (= (apply!800 lt!420141 k0!1099) v!791))))

(declare-fun b!933154 () Bool)

(declare-fun res!628572 () Bool)

(assert (=> b!933154 (=> (not res!628572) (not e!523971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56131 (_ BitVec 32)) Bool)

(assert (=> b!933154 (= res!628572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933155 () Bool)

(declare-fun res!628567 () Bool)

(assert (=> b!933155 (=> (not res!628567) (not e!523971))))

(assert (=> b!933155 (= res!628567 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19053))))

(declare-fun b!933156 () Bool)

(assert (=> b!933156 (= e!523968 tp_is_empty!20113)))

(declare-fun b!933157 () Bool)

(declare-fun res!628568 () Bool)

(assert (=> b!933157 (=> (not res!628568) (not e!523970))))

(assert (=> b!933157 (= res!628568 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31929 () Bool)

(assert (=> mapIsEmpty!31929 mapRes!31929))

(declare-fun b!933158 () Bool)

(declare-fun res!628573 () Bool)

(assert (=> b!933158 (=> (not res!628573) (not e!523970))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933158 (= res!628573 (validKeyInArray!0 k0!1099))))

(declare-fun b!933159 () Bool)

(assert (=> b!933159 (= e!523969 tp_is_empty!20113)))

(declare-fun b!933160 () Bool)

(assert (=> b!933160 (= e!523970 e!523973)))

(declare-fun res!628565 () Bool)

(assert (=> b!933160 (=> (not res!628565) (not e!523973))))

(assert (=> b!933160 (= res!628565 (validKeyInArray!0 lt!420138))))

(assert (=> b!933160 (= lt!420138 (select (arr!27010 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933161 () Bool)

(declare-fun res!628571 () Bool)

(assert (=> b!933161 (=> (not res!628571) (not e!523971))))

(assert (=> b!933161 (= res!628571 (and (= (size!27470 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27471 _keys!1487) (size!27470 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79400 res!628574) b!933161))

(assert (= (and b!933161 res!628571) b!933154))

(assert (= (and b!933154 res!628572) b!933155))

(assert (= (and b!933155 res!628567) b!933152))

(assert (= (and b!933152 res!628570) b!933151))

(assert (= (and b!933151 res!628566) b!933153))

(assert (= (and b!933153 res!628569) b!933157))

(assert (= (and b!933157 res!628568) b!933158))

(assert (= (and b!933158 res!628573) b!933160))

(assert (= (and b!933160 res!628565) b!933149))

(assert (= (and b!933150 condMapEmpty!31929) mapIsEmpty!31929))

(assert (= (and b!933150 (not condMapEmpty!31929)) mapNonEmpty!31929))

(get-info :version)

(assert (= (and mapNonEmpty!31929 ((_ is ValueCellFull!9575) mapValue!31929)) b!933159))

(assert (= (and b!933150 ((_ is ValueCellFull!9575) mapDefault!31929)) b!933156))

(assert (= start!79400 b!933150))

(declare-fun b_lambda!13921 () Bool)

(assert (=> (not b_lambda!13921) (not b!933149)))

(declare-fun t!27195 () Bool)

(declare-fun tb!5991 () Bool)

(assert (=> (and start!79400 (= defaultEntry!1235 defaultEntry!1235) t!27195) tb!5991))

(declare-fun result!11815 () Bool)

(assert (=> tb!5991 (= result!11815 tp_is_empty!20113)))

(assert (=> b!933149 t!27195))

(declare-fun b_and!28745 () Bool)

(assert (= b_and!28743 (and (=> t!27195 result!11815) b_and!28745)))

(declare-fun m!866753 () Bool)

(assert (=> b!933158 m!866753))

(declare-fun m!866755 () Bool)

(assert (=> b!933155 m!866755))

(declare-fun m!866757 () Bool)

(assert (=> mapNonEmpty!31929 m!866757))

(declare-fun m!866759 () Bool)

(assert (=> start!79400 m!866759))

(declare-fun m!866761 () Bool)

(assert (=> start!79400 m!866761))

(declare-fun m!866763 () Bool)

(assert (=> start!79400 m!866763))

(declare-fun m!866765 () Bool)

(assert (=> b!933154 m!866765))

(declare-fun m!866767 () Bool)

(assert (=> b!933149 m!866767))

(assert (=> b!933149 m!866767))

(declare-fun m!866769 () Bool)

(assert (=> b!933149 m!866769))

(declare-fun m!866771 () Bool)

(assert (=> b!933149 m!866771))

(declare-fun m!866773 () Bool)

(assert (=> b!933149 m!866773))

(declare-fun m!866775 () Bool)

(assert (=> b!933149 m!866775))

(assert (=> b!933149 m!866775))

(declare-fun m!866777 () Bool)

(assert (=> b!933149 m!866777))

(declare-fun m!866779 () Bool)

(assert (=> b!933149 m!866779))

(declare-fun m!866781 () Bool)

(assert (=> b!933149 m!866781))

(declare-fun m!866783 () Bool)

(assert (=> b!933149 m!866783))

(declare-fun m!866785 () Bool)

(assert (=> b!933149 m!866785))

(assert (=> b!933149 m!866777))

(declare-fun m!866787 () Bool)

(assert (=> b!933149 m!866787))

(assert (=> b!933149 m!866771))

(declare-fun m!866789 () Bool)

(assert (=> b!933149 m!866789))

(declare-fun m!866791 () Bool)

(assert (=> b!933160 m!866791))

(declare-fun m!866793 () Bool)

(assert (=> b!933160 m!866793))

(declare-fun m!866795 () Bool)

(assert (=> b!933151 m!866795))

(declare-fun m!866797 () Bool)

(assert (=> b!933151 m!866797))

(declare-fun m!866799 () Bool)

(assert (=> b!933153 m!866799))

(check-sat (not start!79400) (not b!933158) (not mapNonEmpty!31929) tp_is_empty!20113 (not b!933160) (not b_lambda!13921) (not b!933151) (not b!933155) b_and!28745 (not b!933153) (not b!933149) (not b_next!17605) (not b!933154))
(check-sat b_and!28745 (not b_next!17605))
