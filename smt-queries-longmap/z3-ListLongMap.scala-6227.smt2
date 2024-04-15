; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79616 () Bool)

(assert start!79616)

(declare-fun b_free!17683 () Bool)

(declare-fun b_next!17683 () Bool)

(assert (=> start!79616 (= b_free!17683 (not b_next!17683))))

(declare-fun tp!61505 () Bool)

(declare-fun b_and!28931 () Bool)

(assert (=> start!79616 (= tp!61505 b_and!28931)))

(declare-fun b!935815 () Bool)

(declare-fun e!525458 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((V!31887 0))(
  ( (V!31888 (val!10146 Int)) )
))
(declare-datatypes ((ValueCell!9614 0))(
  ( (ValueCellFull!9614 (v!12670 V!31887)) (EmptyCell!9614) )
))
(declare-datatypes ((array!56291 0))(
  ( (array!56292 (arr!27086 (Array (_ BitVec 32) ValueCell!9614)) (size!27547 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56291)

(assert (=> b!935815 (= e!525458 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27547 _values!1231))))))

(declare-fun lt!421738 () (_ BitVec 64))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!935815 (not (= lt!421738 k0!1099))))

(declare-datatypes ((Unit!31478 0))(
  ( (Unit!31479) )
))
(declare-fun lt!421743 () Unit!31478)

(declare-datatypes ((array!56293 0))(
  ( (array!56294 (arr!27087 (Array (_ BitVec 32) (_ BitVec 64))) (size!27548 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56293)

(declare-datatypes ((List!19124 0))(
  ( (Nil!19121) (Cons!19120 (h!20266 (_ BitVec 64)) (t!27342 List!19124)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56293 (_ BitVec 64) (_ BitVec 32) List!19124) Unit!31478)

(assert (=> b!935815 (= lt!421743 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19121))))

(declare-fun e!525451 () Bool)

(assert (=> b!935815 e!525451))

(declare-fun c!97291 () Bool)

(assert (=> b!935815 (= c!97291 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421744 () Unit!31478)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31887)

(declare-fun minValue!1173 () V!31887)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!291 (array!56293 array!56291 (_ BitVec 32) (_ BitVec 32) V!31887 V!31887 (_ BitVec 64) (_ BitVec 32) Int) Unit!31478)

(assert (=> b!935815 (= lt!421744 (lemmaListMapContainsThenArrayContainsFrom!291 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56293 (_ BitVec 32) List!19124) Bool)

(assert (=> b!935815 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19121)))

(declare-fun lt!421739 () Unit!31478)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56293 (_ BitVec 32) (_ BitVec 32)) Unit!31478)

(assert (=> b!935815 (= lt!421739 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13376 0))(
  ( (tuple2!13377 (_1!6699 (_ BitVec 64)) (_2!6699 V!31887)) )
))
(declare-datatypes ((List!19125 0))(
  ( (Nil!19122) (Cons!19121 (h!20267 tuple2!13376) (t!27343 List!19125)) )
))
(declare-datatypes ((ListLongMap!12063 0))(
  ( (ListLongMap!12064 (toList!6047 List!19125)) )
))
(declare-fun lt!421742 () ListLongMap!12063)

(declare-fun lt!421741 () tuple2!13376)

(declare-fun contains!5052 (ListLongMap!12063 (_ BitVec 64)) Bool)

(declare-fun +!2844 (ListLongMap!12063 tuple2!13376) ListLongMap!12063)

(assert (=> b!935815 (contains!5052 (+!2844 lt!421742 lt!421741) k0!1099)))

(declare-fun lt!421745 () V!31887)

(declare-fun lt!421746 () Unit!31478)

(declare-fun addStillContains!533 (ListLongMap!12063 (_ BitVec 64) V!31887 (_ BitVec 64)) Unit!31478)

(assert (=> b!935815 (= lt!421746 (addStillContains!533 lt!421742 lt!421738 lt!421745 k0!1099))))

(declare-fun getCurrentListMap!3214 (array!56293 array!56291 (_ BitVec 32) (_ BitVec 32) V!31887 V!31887 (_ BitVec 32) Int) ListLongMap!12063)

(assert (=> b!935815 (= (getCurrentListMap!3214 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2844 (getCurrentListMap!3214 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421741))))

(assert (=> b!935815 (= lt!421741 (tuple2!13377 lt!421738 lt!421745))))

(declare-fun get!14282 (ValueCell!9614 V!31887) V!31887)

(declare-fun dynLambda!1600 (Int (_ BitVec 64)) V!31887)

(assert (=> b!935815 (= lt!421745 (get!14282 (select (arr!27086 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1600 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421740 () Unit!31478)

(declare-fun lemmaListMapRecursiveValidKeyArray!208 (array!56293 array!56291 (_ BitVec 32) (_ BitVec 32) V!31887 V!31887 (_ BitVec 32) Int) Unit!31478)

(assert (=> b!935815 (= lt!421740 (lemmaListMapRecursiveValidKeyArray!208 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935816 () Bool)

(declare-fun res!630211 () Bool)

(declare-fun e!525457 () Bool)

(assert (=> b!935816 (=> (not res!630211) (not e!525457))))

(assert (=> b!935816 (= res!630211 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935817 () Bool)

(declare-fun res!630214 () Bool)

(assert (=> b!935817 (=> (not res!630214) (not e!525457))))

(declare-fun v!791 () V!31887)

(declare-fun apply!825 (ListLongMap!12063 (_ BitVec 64)) V!31887)

(assert (=> b!935817 (= res!630214 (= (apply!825 lt!421742 k0!1099) v!791))))

(declare-fun res!630210 () Bool)

(declare-fun e!525452 () Bool)

(assert (=> start!79616 (=> (not res!630210) (not e!525452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79616 (= res!630210 (validMask!0 mask!1881))))

(assert (=> start!79616 e!525452))

(assert (=> start!79616 true))

(declare-fun tp_is_empty!20191 () Bool)

(assert (=> start!79616 tp_is_empty!20191))

(declare-fun e!525453 () Bool)

(declare-fun array_inv!21138 (array!56291) Bool)

(assert (=> start!79616 (and (array_inv!21138 _values!1231) e!525453)))

(assert (=> start!79616 tp!61505))

(declare-fun array_inv!21139 (array!56293) Bool)

(assert (=> start!79616 (array_inv!21139 _keys!1487)))

(declare-fun b!935818 () Bool)

(declare-fun res!630209 () Bool)

(assert (=> b!935818 (=> (not res!630209) (not e!525452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56293 (_ BitVec 32)) Bool)

(assert (=> b!935818 (= res!630209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935819 () Bool)

(declare-fun res!630206 () Bool)

(assert (=> b!935819 (=> (not res!630206) (not e!525457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935819 (= res!630206 (validKeyInArray!0 k0!1099))))

(declare-fun b!935820 () Bool)

(declare-fun arrayContainsKey!0 (array!56293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935820 (= e!525451 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!935821 () Bool)

(assert (=> b!935821 (= e!525452 e!525457)))

(declare-fun res!630212 () Bool)

(assert (=> b!935821 (=> (not res!630212) (not e!525457))))

(assert (=> b!935821 (= res!630212 (contains!5052 lt!421742 k0!1099))))

(assert (=> b!935821 (= lt!421742 (getCurrentListMap!3214 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935822 () Bool)

(declare-fun e!525454 () Bool)

(declare-fun mapRes!32058 () Bool)

(assert (=> b!935822 (= e!525453 (and e!525454 mapRes!32058))))

(declare-fun condMapEmpty!32058 () Bool)

(declare-fun mapDefault!32058 () ValueCell!9614)

(assert (=> b!935822 (= condMapEmpty!32058 (= (arr!27086 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9614)) mapDefault!32058)))))

(declare-fun b!935823 () Bool)

(declare-fun res!630213 () Bool)

(assert (=> b!935823 (=> (not res!630213) (not e!525452))))

(assert (=> b!935823 (= res!630213 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27548 _keys!1487))))))

(declare-fun b!935824 () Bool)

(declare-fun res!630208 () Bool)

(assert (=> b!935824 (=> (not res!630208) (not e!525452))))

(assert (=> b!935824 (= res!630208 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19121))))

(declare-fun b!935825 () Bool)

(assert (=> b!935825 (= e!525451 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935826 () Bool)

(declare-fun e!525455 () Bool)

(assert (=> b!935826 (= e!525455 tp_is_empty!20191)))

(declare-fun b!935827 () Bool)

(assert (=> b!935827 (= e!525457 e!525458)))

(declare-fun res!630207 () Bool)

(assert (=> b!935827 (=> (not res!630207) (not e!525458))))

(assert (=> b!935827 (= res!630207 (validKeyInArray!0 lt!421738))))

(assert (=> b!935827 (= lt!421738 (select (arr!27087 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!32058 () Bool)

(assert (=> mapIsEmpty!32058 mapRes!32058))

(declare-fun mapNonEmpty!32058 () Bool)

(declare-fun tp!61506 () Bool)

(assert (=> mapNonEmpty!32058 (= mapRes!32058 (and tp!61506 e!525455))))

(declare-fun mapRest!32058 () (Array (_ BitVec 32) ValueCell!9614))

(declare-fun mapKey!32058 () (_ BitVec 32))

(declare-fun mapValue!32058 () ValueCell!9614)

(assert (=> mapNonEmpty!32058 (= (arr!27086 _values!1231) (store mapRest!32058 mapKey!32058 mapValue!32058))))

(declare-fun b!935828 () Bool)

(declare-fun res!630215 () Bool)

(assert (=> b!935828 (=> (not res!630215) (not e!525452))))

(assert (=> b!935828 (= res!630215 (and (= (size!27547 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27548 _keys!1487) (size!27547 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935829 () Bool)

(assert (=> b!935829 (= e!525454 tp_is_empty!20191)))

(assert (= (and start!79616 res!630210) b!935828))

(assert (= (and b!935828 res!630215) b!935818))

(assert (= (and b!935818 res!630209) b!935824))

(assert (= (and b!935824 res!630208) b!935823))

(assert (= (and b!935823 res!630213) b!935821))

(assert (= (and b!935821 res!630212) b!935817))

(assert (= (and b!935817 res!630214) b!935816))

(assert (= (and b!935816 res!630211) b!935819))

(assert (= (and b!935819 res!630206) b!935827))

(assert (= (and b!935827 res!630207) b!935815))

(assert (= (and b!935815 c!97291) b!935820))

(assert (= (and b!935815 (not c!97291)) b!935825))

(assert (= (and b!935822 condMapEmpty!32058) mapIsEmpty!32058))

(assert (= (and b!935822 (not condMapEmpty!32058)) mapNonEmpty!32058))

(get-info :version)

(assert (= (and mapNonEmpty!32058 ((_ is ValueCellFull!9614) mapValue!32058)) b!935826))

(assert (= (and b!935822 ((_ is ValueCellFull!9614) mapDefault!32058)) b!935829))

(assert (= start!79616 b!935822))

(declare-fun b_lambda!14071 () Bool)

(assert (=> (not b_lambda!14071) (not b!935815)))

(declare-fun t!27341 () Bool)

(declare-fun tb!6069 () Bool)

(assert (=> (and start!79616 (= defaultEntry!1235 defaultEntry!1235) t!27341) tb!6069))

(declare-fun result!11979 () Bool)

(assert (=> tb!6069 (= result!11979 tp_is_empty!20191)))

(assert (=> b!935815 t!27341))

(declare-fun b_and!28933 () Bool)

(assert (= b_and!28931 (and (=> t!27341 result!11979) b_and!28933)))

(declare-fun m!869843 () Bool)

(assert (=> start!79616 m!869843))

(declare-fun m!869845 () Bool)

(assert (=> start!79616 m!869845))

(declare-fun m!869847 () Bool)

(assert (=> start!79616 m!869847))

(declare-fun m!869849 () Bool)

(assert (=> b!935817 m!869849))

(declare-fun m!869851 () Bool)

(assert (=> b!935819 m!869851))

(declare-fun m!869853 () Bool)

(assert (=> mapNonEmpty!32058 m!869853))

(declare-fun m!869855 () Bool)

(assert (=> b!935827 m!869855))

(declare-fun m!869857 () Bool)

(assert (=> b!935827 m!869857))

(declare-fun m!869859 () Bool)

(assert (=> b!935818 m!869859))

(declare-fun m!869861 () Bool)

(assert (=> b!935820 m!869861))

(declare-fun m!869863 () Bool)

(assert (=> b!935821 m!869863))

(declare-fun m!869865 () Bool)

(assert (=> b!935821 m!869865))

(declare-fun m!869867 () Bool)

(assert (=> b!935824 m!869867))

(declare-fun m!869869 () Bool)

(assert (=> b!935815 m!869869))

(declare-fun m!869871 () Bool)

(assert (=> b!935815 m!869871))

(declare-fun m!869873 () Bool)

(assert (=> b!935815 m!869873))

(declare-fun m!869875 () Bool)

(assert (=> b!935815 m!869875))

(declare-fun m!869877 () Bool)

(assert (=> b!935815 m!869877))

(declare-fun m!869879 () Bool)

(assert (=> b!935815 m!869879))

(assert (=> b!935815 m!869877))

(assert (=> b!935815 m!869879))

(declare-fun m!869881 () Bool)

(assert (=> b!935815 m!869881))

(declare-fun m!869883 () Bool)

(assert (=> b!935815 m!869883))

(declare-fun m!869885 () Bool)

(assert (=> b!935815 m!869885))

(assert (=> b!935815 m!869875))

(declare-fun m!869887 () Bool)

(assert (=> b!935815 m!869887))

(declare-fun m!869889 () Bool)

(assert (=> b!935815 m!869889))

(declare-fun m!869891 () Bool)

(assert (=> b!935815 m!869891))

(declare-fun m!869893 () Bool)

(assert (=> b!935815 m!869893))

(assert (=> b!935815 m!869869))

(declare-fun m!869895 () Bool)

(assert (=> b!935815 m!869895))

(check-sat (not b!935820) tp_is_empty!20191 (not b!935821) (not b!935815) (not b_next!17683) (not b!935817) (not b!935824) (not b!935819) (not start!79616) b_and!28933 (not b!935818) (not b_lambda!14071) (not mapNonEmpty!32058) (not b!935827))
(check-sat b_and!28933 (not b_next!17683))
