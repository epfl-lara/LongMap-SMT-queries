; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79376 () Bool)

(assert start!79376)

(declare-fun b_free!17581 () Bool)

(declare-fun b_next!17581 () Bool)

(assert (=> start!79376 (= b_free!17581 (not b_next!17581))))

(declare-fun tp!61187 () Bool)

(declare-fun b_and!28695 () Bool)

(assert (=> start!79376 (= tp!61187 b_and!28695)))

(declare-fun b!932657 () Bool)

(declare-fun res!628209 () Bool)

(declare-fun e!523717 () Bool)

(assert (=> b!932657 (=> (not res!628209) (not e!523717))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932657 (= res!628209 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932658 () Bool)

(declare-fun res!628211 () Bool)

(declare-fun e!523716 () Bool)

(assert (=> b!932658 (=> (not res!628211) (not e!523716))))

(declare-datatypes ((array!56083 0))(
  ( (array!56084 (arr!26986 (Array (_ BitVec 32) (_ BitVec 64))) (size!27447 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56083)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31751 0))(
  ( (V!31752 (val!10095 Int)) )
))
(declare-datatypes ((ValueCell!9563 0))(
  ( (ValueCellFull!9563 (v!12613 V!31751)) (EmptyCell!9563) )
))
(declare-datatypes ((array!56085 0))(
  ( (array!56086 (arr!26987 (Array (_ BitVec 32) ValueCell!9563)) (size!27448 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56085)

(assert (=> b!932658 (= res!628211 (and (= (size!27448 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27447 _keys!1487) (size!27448 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932660 () Bool)

(declare-fun e!523721 () Bool)

(declare-fun tp_is_empty!20089 () Bool)

(assert (=> b!932660 (= e!523721 tp_is_empty!20089)))

(declare-fun mapIsEmpty!31893 () Bool)

(declare-fun mapRes!31893 () Bool)

(assert (=> mapIsEmpty!31893 mapRes!31893))

(declare-fun b!932661 () Bool)

(declare-fun res!628212 () Bool)

(assert (=> b!932661 (=> (not res!628212) (not e!523717))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932661 (= res!628212 (validKeyInArray!0 k0!1099))))

(declare-fun b!932662 () Bool)

(declare-fun e!523719 () Bool)

(assert (=> b!932662 (= e!523717 e!523719)))

(declare-fun res!628210 () Bool)

(assert (=> b!932662 (=> (not res!628210) (not e!523719))))

(declare-fun lt!419888 () (_ BitVec 64))

(assert (=> b!932662 (= res!628210 (validKeyInArray!0 lt!419888))))

(assert (=> b!932662 (= lt!419888 (select (arr!26986 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31893 () Bool)

(declare-fun tp!61188 () Bool)

(assert (=> mapNonEmpty!31893 (= mapRes!31893 (and tp!61188 e!523721))))

(declare-fun mapValue!31893 () ValueCell!9563)

(declare-fun mapKey!31893 () (_ BitVec 32))

(declare-fun mapRest!31893 () (Array (_ BitVec 32) ValueCell!9563))

(assert (=> mapNonEmpty!31893 (= (arr!26987 _values!1231) (store mapRest!31893 mapKey!31893 mapValue!31893))))

(declare-fun b!932663 () Bool)

(declare-fun e!523715 () Bool)

(declare-fun e!523718 () Bool)

(assert (=> b!932663 (= e!523715 (and e!523718 mapRes!31893))))

(declare-fun condMapEmpty!31893 () Bool)

(declare-fun mapDefault!31893 () ValueCell!9563)

(assert (=> b!932663 (= condMapEmpty!31893 (= (arr!26987 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9563)) mapDefault!31893)))))

(declare-fun b!932664 () Bool)

(assert (=> b!932664 (= e!523716 e!523717)))

(declare-fun res!628205 () Bool)

(assert (=> b!932664 (=> (not res!628205) (not e!523717))))

(declare-datatypes ((tuple2!13284 0))(
  ( (tuple2!13285 (_1!6653 (_ BitVec 64)) (_2!6653 V!31751)) )
))
(declare-datatypes ((List!19034 0))(
  ( (Nil!19031) (Cons!19030 (h!20176 tuple2!13284) (t!27150 List!19034)) )
))
(declare-datatypes ((ListLongMap!11971 0))(
  ( (ListLongMap!11972 (toList!6001 List!19034)) )
))
(declare-fun lt!419892 () ListLongMap!11971)

(declare-fun contains!4998 (ListLongMap!11971 (_ BitVec 64)) Bool)

(assert (=> b!932664 (= res!628205 (contains!4998 lt!419892 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31751)

(declare-fun minValue!1173 () V!31751)

(declare-fun getCurrentListMap!3173 (array!56083 array!56085 (_ BitVec 32) (_ BitVec 32) V!31751 V!31751 (_ BitVec 32) Int) ListLongMap!11971)

(assert (=> b!932664 (= lt!419892 (getCurrentListMap!3173 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932665 () Bool)

(assert (=> b!932665 (= e!523718 tp_is_empty!20089)))

(declare-fun b!932659 () Bool)

(declare-fun res!628206 () Bool)

(assert (=> b!932659 (=> (not res!628206) (not e!523717))))

(declare-fun v!791 () V!31751)

(declare-fun apply!790 (ListLongMap!11971 (_ BitVec 64)) V!31751)

(assert (=> b!932659 (= res!628206 (= (apply!790 lt!419892 k0!1099) v!791))))

(declare-fun res!628214 () Bool)

(assert (=> start!79376 (=> (not res!628214) (not e!523716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79376 (= res!628214 (validMask!0 mask!1881))))

(assert (=> start!79376 e!523716))

(assert (=> start!79376 true))

(assert (=> start!79376 tp_is_empty!20089))

(declare-fun array_inv!21070 (array!56085) Bool)

(assert (=> start!79376 (and (array_inv!21070 _values!1231) e!523715)))

(assert (=> start!79376 tp!61187))

(declare-fun array_inv!21071 (array!56083) Bool)

(assert (=> start!79376 (array_inv!21071 _keys!1487)))

(declare-fun b!932666 () Bool)

(declare-fun res!628213 () Bool)

(assert (=> b!932666 (=> (not res!628213) (not e!523716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56083 (_ BitVec 32)) Bool)

(assert (=> b!932666 (= res!628213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932667 () Bool)

(declare-fun res!628207 () Bool)

(assert (=> b!932667 (=> (not res!628207) (not e!523716))))

(declare-datatypes ((List!19035 0))(
  ( (Nil!19032) (Cons!19031 (h!20177 (_ BitVec 64)) (t!27151 List!19035)) )
))
(declare-fun arrayNoDuplicates!0 (array!56083 (_ BitVec 32) List!19035) Bool)

(assert (=> b!932667 (= res!628207 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19032))))

(declare-fun b!932668 () Bool)

(declare-fun res!628208 () Bool)

(assert (=> b!932668 (=> (not res!628208) (not e!523716))))

(assert (=> b!932668 (= res!628208 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27447 _keys!1487))))))

(declare-fun b!932669 () Bool)

(assert (=> b!932669 (= e!523719 (not true))))

(assert (=> b!932669 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19032)))

(declare-datatypes ((Unit!31386 0))(
  ( (Unit!31387) )
))
(declare-fun lt!419889 () Unit!31386)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56083 (_ BitVec 32) (_ BitVec 32)) Unit!31386)

(assert (=> b!932669 (= lt!419889 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419890 () tuple2!13284)

(declare-fun +!2808 (ListLongMap!11971 tuple2!13284) ListLongMap!11971)

(assert (=> b!932669 (contains!4998 (+!2808 lt!419892 lt!419890) k0!1099)))

(declare-fun lt!419887 () Unit!31386)

(declare-fun lt!419891 () V!31751)

(declare-fun addStillContains!497 (ListLongMap!11971 (_ BitVec 64) V!31751 (_ BitVec 64)) Unit!31386)

(assert (=> b!932669 (= lt!419887 (addStillContains!497 lt!419892 lt!419888 lt!419891 k0!1099))))

(assert (=> b!932669 (= (getCurrentListMap!3173 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2808 (getCurrentListMap!3173 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419890))))

(assert (=> b!932669 (= lt!419890 (tuple2!13285 lt!419888 lt!419891))))

(declare-fun get!14200 (ValueCell!9563 V!31751) V!31751)

(declare-fun dynLambda!1564 (Int (_ BitVec 64)) V!31751)

(assert (=> b!932669 (= lt!419891 (get!14200 (select (arr!26987 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1564 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419886 () Unit!31386)

(declare-fun lemmaListMapRecursiveValidKeyArray!172 (array!56083 array!56085 (_ BitVec 32) (_ BitVec 32) V!31751 V!31751 (_ BitVec 32) Int) Unit!31386)

(assert (=> b!932669 (= lt!419886 (lemmaListMapRecursiveValidKeyArray!172 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!79376 res!628214) b!932658))

(assert (= (and b!932658 res!628211) b!932666))

(assert (= (and b!932666 res!628213) b!932667))

(assert (= (and b!932667 res!628207) b!932668))

(assert (= (and b!932668 res!628208) b!932664))

(assert (= (and b!932664 res!628205) b!932659))

(assert (= (and b!932659 res!628206) b!932657))

(assert (= (and b!932657 res!628209) b!932661))

(assert (= (and b!932661 res!628212) b!932662))

(assert (= (and b!932662 res!628210) b!932669))

(assert (= (and b!932663 condMapEmpty!31893) mapIsEmpty!31893))

(assert (= (and b!932663 (not condMapEmpty!31893)) mapNonEmpty!31893))

(get-info :version)

(assert (= (and mapNonEmpty!31893 ((_ is ValueCellFull!9563) mapValue!31893)) b!932660))

(assert (= (and b!932663 ((_ is ValueCellFull!9563) mapDefault!31893)) b!932665))

(assert (= start!79376 b!932663))

(declare-fun b_lambda!13897 () Bool)

(assert (=> (not b_lambda!13897) (not b!932669)))

(declare-fun t!27149 () Bool)

(declare-fun tb!5967 () Bool)

(assert (=> (and start!79376 (= defaultEntry!1235 defaultEntry!1235) t!27149) tb!5967))

(declare-fun result!11767 () Bool)

(assert (=> tb!5967 (= result!11767 tp_is_empty!20089)))

(assert (=> b!932669 t!27149))

(declare-fun b_and!28697 () Bool)

(assert (= b_and!28695 (and (=> t!27149 result!11767) b_and!28697)))

(declare-fun m!866177 () Bool)

(assert (=> b!932666 m!866177))

(declare-fun m!866179 () Bool)

(assert (=> b!932662 m!866179))

(declare-fun m!866181 () Bool)

(assert (=> b!932662 m!866181))

(declare-fun m!866183 () Bool)

(assert (=> mapNonEmpty!31893 m!866183))

(declare-fun m!866185 () Bool)

(assert (=> start!79376 m!866185))

(declare-fun m!866187 () Bool)

(assert (=> start!79376 m!866187))

(declare-fun m!866189 () Bool)

(assert (=> start!79376 m!866189))

(declare-fun m!866191 () Bool)

(assert (=> b!932661 m!866191))

(declare-fun m!866193 () Bool)

(assert (=> b!932667 m!866193))

(declare-fun m!866195 () Bool)

(assert (=> b!932664 m!866195))

(declare-fun m!866197 () Bool)

(assert (=> b!932664 m!866197))

(declare-fun m!866199 () Bool)

(assert (=> b!932669 m!866199))

(declare-fun m!866201 () Bool)

(assert (=> b!932669 m!866201))

(declare-fun m!866203 () Bool)

(assert (=> b!932669 m!866203))

(declare-fun m!866205 () Bool)

(assert (=> b!932669 m!866205))

(declare-fun m!866207 () Bool)

(assert (=> b!932669 m!866207))

(declare-fun m!866209 () Bool)

(assert (=> b!932669 m!866209))

(declare-fun m!866211 () Bool)

(assert (=> b!932669 m!866211))

(declare-fun m!866213 () Bool)

(assert (=> b!932669 m!866213))

(assert (=> b!932669 m!866201))

(assert (=> b!932669 m!866203))

(declare-fun m!866215 () Bool)

(assert (=> b!932669 m!866215))

(assert (=> b!932669 m!866211))

(declare-fun m!866217 () Bool)

(assert (=> b!932669 m!866217))

(declare-fun m!866219 () Bool)

(assert (=> b!932669 m!866219))

(assert (=> b!932669 m!866207))

(declare-fun m!866221 () Bool)

(assert (=> b!932669 m!866221))

(declare-fun m!866223 () Bool)

(assert (=> b!932659 m!866223))

(check-sat (not start!79376) (not b!932666) b_and!28697 (not mapNonEmpty!31893) tp_is_empty!20089 (not b!932662) (not b!932661) (not b!932664) (not b!932669) (not b_lambda!13897) (not b!932667) (not b!932659) (not b_next!17581))
(check-sat b_and!28697 (not b_next!17581))
