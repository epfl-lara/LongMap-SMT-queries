; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79678 () Bool)

(assert start!79678)

(declare-fun b_free!17727 () Bool)

(declare-fun b_next!17727 () Bool)

(assert (=> start!79678 (= b_free!17727 (not b_next!17727))))

(declare-fun tp!61636 () Bool)

(declare-fun b_and!29045 () Bool)

(assert (=> start!79678 (= tp!61636 b_and!29045)))

(declare-fun b!937138 () Bool)

(declare-fun res!630830 () Bool)

(declare-fun e!526228 () Bool)

(assert (=> b!937138 (=> (not res!630830) (not e!526228))))

(declare-datatypes ((array!56410 0))(
  ( (array!56411 (arr!27145 (Array (_ BitVec 32) (_ BitVec 64))) (size!27604 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56410)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31945 0))(
  ( (V!31946 (val!10168 Int)) )
))
(declare-datatypes ((ValueCell!9636 0))(
  ( (ValueCellFull!9636 (v!12693 V!31945)) (EmptyCell!9636) )
))
(declare-datatypes ((array!56412 0))(
  ( (array!56413 (arr!27146 (Array (_ BitVec 32) ValueCell!9636)) (size!27605 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56412)

(assert (=> b!937138 (= res!630830 (and (= (size!27605 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27604 _keys!1487) (size!27605 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937139 () Bool)

(declare-fun res!630828 () Bool)

(assert (=> b!937139 (=> (not res!630828) (not e!526228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56410 (_ BitVec 32)) Bool)

(assert (=> b!937139 (= res!630828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937140 () Bool)

(declare-datatypes ((Unit!31628 0))(
  ( (Unit!31629) )
))
(declare-fun e!526232 () Unit!31628)

(declare-fun Unit!31630 () Unit!31628)

(assert (=> b!937140 (= e!526232 Unit!31630)))

(declare-fun b!937141 () Bool)

(declare-datatypes ((tuple2!13354 0))(
  ( (tuple2!13355 (_1!6688 (_ BitVec 64)) (_2!6688 V!31945)) )
))
(declare-datatypes ((List!19133 0))(
  ( (Nil!19130) (Cons!19129 (h!20275 tuple2!13354) (t!27404 List!19133)) )
))
(declare-datatypes ((ListLongMap!12051 0))(
  ( (ListLongMap!12052 (toList!6041 List!19133)) )
))
(declare-fun lt!422770 () ListLongMap!12051)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!422771 () V!31945)

(declare-fun apply!843 (ListLongMap!12051 (_ BitVec 64)) V!31945)

(assert (=> b!937141 (= (apply!843 lt!422770 k0!1099) lt!422771)))

(declare-fun lt!422778 () (_ BitVec 64))

(declare-fun lt!422768 () V!31945)

(declare-fun lt!422769 () ListLongMap!12051)

(declare-fun lt!422772 () Unit!31628)

(declare-fun addApplyDifferent!429 (ListLongMap!12051 (_ BitVec 64) V!31945 (_ BitVec 64)) Unit!31628)

(assert (=> b!937141 (= lt!422772 (addApplyDifferent!429 lt!422769 lt!422778 lt!422768 k0!1099))))

(assert (=> b!937141 (not (= lt!422778 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!422779 () Unit!31628)

(declare-datatypes ((List!19134 0))(
  ( (Nil!19131) (Cons!19130 (h!20276 (_ BitVec 64)) (t!27405 List!19134)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56410 (_ BitVec 64) (_ BitVec 32) List!19134) Unit!31628)

(assert (=> b!937141 (= lt!422779 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19131))))

(declare-fun e!526230 () Bool)

(assert (=> b!937141 e!526230))

(declare-fun c!97522 () Bool)

(assert (=> b!937141 (= c!97522 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!422773 () Unit!31628)

(declare-fun zeroValue!1173 () V!31945)

(declare-fun minValue!1173 () V!31945)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!302 (array!56410 array!56412 (_ BitVec 32) (_ BitVec 32) V!31945 V!31945 (_ BitVec 64) (_ BitVec 32) Int) Unit!31628)

(assert (=> b!937141 (= lt!422773 (lemmaListMapContainsThenArrayContainsFrom!302 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56410 (_ BitVec 32) List!19134) Bool)

(assert (=> b!937141 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19131)))

(declare-fun lt!422774 () Unit!31628)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56410 (_ BitVec 32) (_ BitVec 32)) Unit!31628)

(assert (=> b!937141 (= lt!422774 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5100 (ListLongMap!12051 (_ BitVec 64)) Bool)

(assert (=> b!937141 (contains!5100 lt!422770 k0!1099)))

(declare-fun lt!422780 () tuple2!13354)

(declare-fun +!2830 (ListLongMap!12051 tuple2!13354) ListLongMap!12051)

(assert (=> b!937141 (= lt!422770 (+!2830 lt!422769 lt!422780))))

(declare-fun lt!422777 () Unit!31628)

(declare-fun addStillContains!549 (ListLongMap!12051 (_ BitVec 64) V!31945 (_ BitVec 64)) Unit!31628)

(assert (=> b!937141 (= lt!422777 (addStillContains!549 lt!422769 lt!422778 lt!422768 k0!1099))))

(declare-fun getCurrentListMap!3276 (array!56410 array!56412 (_ BitVec 32) (_ BitVec 32) V!31945 V!31945 (_ BitVec 32) Int) ListLongMap!12051)

(assert (=> b!937141 (= (getCurrentListMap!3276 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2830 (getCurrentListMap!3276 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422780))))

(assert (=> b!937141 (= lt!422780 (tuple2!13355 lt!422778 lt!422768))))

(declare-fun get!14310 (ValueCell!9636 V!31945) V!31945)

(declare-fun dynLambda!1619 (Int (_ BitVec 64)) V!31945)

(assert (=> b!937141 (= lt!422768 (get!14310 (select (arr!27146 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1619 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422775 () Unit!31628)

(declare-fun lemmaListMapRecursiveValidKeyArray!220 (array!56410 array!56412 (_ BitVec 32) (_ BitVec 32) V!31945 V!31945 (_ BitVec 32) Int) Unit!31628)

(assert (=> b!937141 (= lt!422775 (lemmaListMapRecursiveValidKeyArray!220 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!526229 () Unit!31628)

(assert (=> b!937141 (= e!526229 lt!422772)))

(declare-fun b!937142 () Bool)

(declare-fun e!526235 () Bool)

(declare-fun tp_is_empty!20235 () Bool)

(assert (=> b!937142 (= e!526235 tp_is_empty!20235)))

(declare-fun b!937143 () Bool)

(declare-fun res!630831 () Bool)

(assert (=> b!937143 (=> (not res!630831) (not e!526228))))

(assert (=> b!937143 (= res!630831 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27604 _keys!1487))))))

(declare-fun b!937144 () Bool)

(declare-fun res!630826 () Bool)

(assert (=> b!937144 (=> (not res!630826) (not e!526228))))

(assert (=> b!937144 (= res!630826 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19131))))

(declare-fun mapNonEmpty!32124 () Bool)

(declare-fun mapRes!32124 () Bool)

(declare-fun tp!61637 () Bool)

(declare-fun e!526234 () Bool)

(assert (=> mapNonEmpty!32124 (= mapRes!32124 (and tp!61637 e!526234))))

(declare-fun mapValue!32124 () ValueCell!9636)

(declare-fun mapKey!32124 () (_ BitVec 32))

(declare-fun mapRest!32124 () (Array (_ BitVec 32) ValueCell!9636))

(assert (=> mapNonEmpty!32124 (= (arr!27146 _values!1231) (store mapRest!32124 mapKey!32124 mapValue!32124))))

(declare-fun b!937145 () Bool)

(assert (=> b!937145 (= e!526230 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32124 () Bool)

(assert (=> mapIsEmpty!32124 mapRes!32124))

(declare-fun b!937146 () Bool)

(declare-fun e!526233 () Bool)

(assert (=> b!937146 (= e!526228 e!526233)))

(declare-fun res!630827 () Bool)

(assert (=> b!937146 (=> (not res!630827) (not e!526233))))

(assert (=> b!937146 (= res!630827 (contains!5100 lt!422769 k0!1099))))

(assert (=> b!937146 (= lt!422769 (getCurrentListMap!3276 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937147 () Bool)

(assert (=> b!937147 (= e!526232 e!526229)))

(assert (=> b!937147 (= lt!422778 (select (arr!27145 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97524 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937147 (= c!97524 (validKeyInArray!0 lt!422778))))

(declare-fun b!937148 () Bool)

(declare-fun e!526231 () Bool)

(assert (=> b!937148 (= e!526231 (and e!526235 mapRes!32124))))

(declare-fun condMapEmpty!32124 () Bool)

(declare-fun mapDefault!32124 () ValueCell!9636)

(assert (=> b!937148 (= condMapEmpty!32124 (= (arr!27146 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9636)) mapDefault!32124)))))

(declare-fun b!937149 () Bool)

(assert (=> b!937149 (= e!526234 tp_is_empty!20235)))

(declare-fun res!630832 () Bool)

(assert (=> start!79678 (=> (not res!630832) (not e!526228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79678 (= res!630832 (validMask!0 mask!1881))))

(assert (=> start!79678 e!526228))

(assert (=> start!79678 true))

(assert (=> start!79678 tp_is_empty!20235))

(declare-fun array_inv!21120 (array!56412) Bool)

(assert (=> start!79678 (and (array_inv!21120 _values!1231) e!526231)))

(assert (=> start!79678 tp!61636))

(declare-fun array_inv!21121 (array!56410) Bool)

(assert (=> start!79678 (array_inv!21121 _keys!1487)))

(declare-fun b!937150 () Bool)

(declare-fun e!526236 () Bool)

(assert (=> b!937150 (= e!526236 false)))

(declare-fun lt!422776 () Unit!31628)

(assert (=> b!937150 (= lt!422776 e!526232)))

(declare-fun c!97523 () Bool)

(assert (=> b!937150 (= c!97523 (validKeyInArray!0 k0!1099))))

(declare-fun b!937151 () Bool)

(declare-fun Unit!31631 () Unit!31628)

(assert (=> b!937151 (= e!526229 Unit!31631)))

(declare-fun b!937152 () Bool)

(assert (=> b!937152 (= e!526233 e!526236)))

(declare-fun res!630829 () Bool)

(assert (=> b!937152 (=> (not res!630829) (not e!526236))))

(declare-fun v!791 () V!31945)

(assert (=> b!937152 (= res!630829 (and (= lt!422771 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937152 (= lt!422771 (apply!843 lt!422769 k0!1099))))

(declare-fun b!937153 () Bool)

(declare-fun arrayContainsKey!0 (array!56410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937153 (= e!526230 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(assert (= (and start!79678 res!630832) b!937138))

(assert (= (and b!937138 res!630830) b!937139))

(assert (= (and b!937139 res!630828) b!937144))

(assert (= (and b!937144 res!630826) b!937143))

(assert (= (and b!937143 res!630831) b!937146))

(assert (= (and b!937146 res!630827) b!937152))

(assert (= (and b!937152 res!630829) b!937150))

(assert (= (and b!937150 c!97523) b!937147))

(assert (= (and b!937150 (not c!97523)) b!937140))

(assert (= (and b!937147 c!97524) b!937141))

(assert (= (and b!937147 (not c!97524)) b!937151))

(assert (= (and b!937141 c!97522) b!937153))

(assert (= (and b!937141 (not c!97522)) b!937145))

(assert (= (and b!937148 condMapEmpty!32124) mapIsEmpty!32124))

(assert (= (and b!937148 (not condMapEmpty!32124)) mapNonEmpty!32124))

(get-info :version)

(assert (= (and mapNonEmpty!32124 ((_ is ValueCellFull!9636) mapValue!32124)) b!937149))

(assert (= (and b!937148 ((_ is ValueCellFull!9636) mapDefault!32124)) b!937142))

(assert (= start!79678 b!937148))

(declare-fun b_lambda!14133 () Bool)

(assert (=> (not b_lambda!14133) (not b!937141)))

(declare-fun t!27403 () Bool)

(declare-fun tb!6121 () Bool)

(assert (=> (and start!79678 (= defaultEntry!1235 defaultEntry!1235) t!27403) tb!6121))

(declare-fun result!12075 () Bool)

(assert (=> tb!6121 (= result!12075 tp_is_empty!20235)))

(assert (=> b!937141 t!27403))

(declare-fun b_and!29047 () Bool)

(assert (= b_and!29045 (and (=> t!27403 result!12075) b_and!29047)))

(declare-fun m!871853 () Bool)

(assert (=> b!937147 m!871853))

(declare-fun m!871855 () Bool)

(assert (=> b!937147 m!871855))

(declare-fun m!871857 () Bool)

(assert (=> b!937152 m!871857))

(declare-fun m!871859 () Bool)

(assert (=> b!937150 m!871859))

(declare-fun m!871861 () Bool)

(assert (=> b!937141 m!871861))

(declare-fun m!871863 () Bool)

(assert (=> b!937141 m!871863))

(declare-fun m!871865 () Bool)

(assert (=> b!937141 m!871865))

(declare-fun m!871867 () Bool)

(assert (=> b!937141 m!871867))

(declare-fun m!871869 () Bool)

(assert (=> b!937141 m!871869))

(declare-fun m!871871 () Bool)

(assert (=> b!937141 m!871871))

(declare-fun m!871873 () Bool)

(assert (=> b!937141 m!871873))

(assert (=> b!937141 m!871865))

(assert (=> b!937141 m!871869))

(declare-fun m!871875 () Bool)

(assert (=> b!937141 m!871875))

(declare-fun m!871877 () Bool)

(assert (=> b!937141 m!871877))

(declare-fun m!871879 () Bool)

(assert (=> b!937141 m!871879))

(declare-fun m!871881 () Bool)

(assert (=> b!937141 m!871881))

(declare-fun m!871883 () Bool)

(assert (=> b!937141 m!871883))

(declare-fun m!871885 () Bool)

(assert (=> b!937141 m!871885))

(declare-fun m!871887 () Bool)

(assert (=> b!937141 m!871887))

(declare-fun m!871889 () Bool)

(assert (=> b!937141 m!871889))

(assert (=> b!937141 m!871871))

(declare-fun m!871891 () Bool)

(assert (=> b!937141 m!871891))

(declare-fun m!871893 () Bool)

(assert (=> b!937146 m!871893))

(declare-fun m!871895 () Bool)

(assert (=> b!937146 m!871895))

(declare-fun m!871897 () Bool)

(assert (=> b!937139 m!871897))

(declare-fun m!871899 () Bool)

(assert (=> b!937144 m!871899))

(declare-fun m!871901 () Bool)

(assert (=> mapNonEmpty!32124 m!871901))

(declare-fun m!871903 () Bool)

(assert (=> start!79678 m!871903))

(declare-fun m!871905 () Bool)

(assert (=> start!79678 m!871905))

(declare-fun m!871907 () Bool)

(assert (=> start!79678 m!871907))

(declare-fun m!871909 () Bool)

(assert (=> b!937153 m!871909))

(check-sat (not b!937146) (not b!937153) b_and!29047 (not mapNonEmpty!32124) (not b!937152) (not b!937147) tp_is_empty!20235 (not start!79678) (not b_next!17727) (not b!937150) (not b!937144) (not b_lambda!14133) (not b!937141) (not b!937139))
(check-sat b_and!29047 (not b_next!17727))
