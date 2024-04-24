; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79520 () Bool)

(assert start!79520)

(declare-fun b_free!17539 () Bool)

(declare-fun b_next!17539 () Bool)

(assert (=> start!79520 (= b_free!17539 (not b_next!17539))))

(declare-fun tp!61062 () Bool)

(declare-fun b_and!28647 () Bool)

(assert (=> start!79520 (= tp!61062 b_and!28647)))

(declare-fun b!932938 () Bool)

(declare-fun res!628034 () Bool)

(declare-fun e!524008 () Bool)

(assert (=> b!932938 (=> (not res!628034) (not e!524008))))

(declare-datatypes ((array!56091 0))(
  ( (array!56092 (arr!26985 (Array (_ BitVec 32) (_ BitVec 64))) (size!27445 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56091)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31695 0))(
  ( (V!31696 (val!10074 Int)) )
))
(declare-datatypes ((ValueCell!9542 0))(
  ( (ValueCellFull!9542 (v!12590 V!31695)) (EmptyCell!9542) )
))
(declare-datatypes ((array!56093 0))(
  ( (array!56094 (arr!26986 (Array (_ BitVec 32) ValueCell!9542)) (size!27446 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56093)

(assert (=> b!932938 (= res!628034 (and (= (size!27446 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27445 _keys!1487) (size!27446 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932939 () Bool)

(declare-fun res!628037 () Bool)

(assert (=> b!932939 (=> (not res!628037) (not e!524008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56091 (_ BitVec 32)) Bool)

(assert (=> b!932939 (= res!628037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932940 () Bool)

(declare-fun e!524009 () Bool)

(declare-fun e!524006 () Bool)

(assert (=> b!932940 (= e!524009 e!524006)))

(declare-fun res!628036 () Bool)

(assert (=> b!932940 (=> (not res!628036) (not e!524006))))

(declare-fun lt!420079 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932940 (= res!628036 (validKeyInArray!0 lt!420079))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932940 (= lt!420079 (select (arr!26985 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932941 () Bool)

(declare-fun res!628032 () Bool)

(assert (=> b!932941 (=> (not res!628032) (not e!524008))))

(declare-datatypes ((List!18970 0))(
  ( (Nil!18967) (Cons!18966 (h!20118 (_ BitVec 64)) (t!27045 List!18970)) )
))
(declare-fun arrayNoDuplicates!0 (array!56091 (_ BitVec 32) List!18970) Bool)

(assert (=> b!932941 (= res!628032 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18967))))

(declare-fun b!932942 () Bool)

(declare-fun e!524004 () Bool)

(declare-fun tp_is_empty!20047 () Bool)

(assert (=> b!932942 (= e!524004 tp_is_empty!20047)))

(declare-fun res!628038 () Bool)

(assert (=> start!79520 (=> (not res!628038) (not e!524008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79520 (= res!628038 (validMask!0 mask!1881))))

(assert (=> start!79520 e!524008))

(assert (=> start!79520 true))

(assert (=> start!79520 tp_is_empty!20047))

(declare-fun e!524010 () Bool)

(declare-fun array_inv!21088 (array!56093) Bool)

(assert (=> start!79520 (and (array_inv!21088 _values!1231) e!524010)))

(assert (=> start!79520 tp!61062))

(declare-fun array_inv!21089 (array!56091) Bool)

(assert (=> start!79520 (array_inv!21089 _keys!1487)))

(declare-fun b!932943 () Bool)

(declare-fun e!524005 () Bool)

(declare-fun mapRes!31830 () Bool)

(assert (=> b!932943 (= e!524010 (and e!524005 mapRes!31830))))

(declare-fun condMapEmpty!31830 () Bool)

(declare-fun mapDefault!31830 () ValueCell!9542)

(assert (=> b!932943 (= condMapEmpty!31830 (= (arr!26986 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9542)) mapDefault!31830)))))

(declare-fun b!932944 () Bool)

(declare-fun res!628035 () Bool)

(assert (=> b!932944 (=> (not res!628035) (not e!524009))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31695)

(declare-datatypes ((tuple2!13186 0))(
  ( (tuple2!13187 (_1!6604 (_ BitVec 64)) (_2!6604 V!31695)) )
))
(declare-datatypes ((List!18971 0))(
  ( (Nil!18968) (Cons!18967 (h!20119 tuple2!13186) (t!27046 List!18971)) )
))
(declare-datatypes ((ListLongMap!11885 0))(
  ( (ListLongMap!11886 (toList!5958 List!18971)) )
))
(declare-fun lt!420080 () ListLongMap!11885)

(declare-fun apply!786 (ListLongMap!11885 (_ BitVec 64)) V!31695)

(assert (=> b!932944 (= res!628035 (= (apply!786 lt!420080 k0!1099) v!791))))

(declare-fun b!932945 () Bool)

(declare-fun res!628029 () Bool)

(assert (=> b!932945 (=> (not res!628029) (not e!524009))))

(assert (=> b!932945 (= res!628029 (validKeyInArray!0 k0!1099))))

(declare-fun b!932946 () Bool)

(assert (=> b!932946 (= e!524008 e!524009)))

(declare-fun res!628033 () Bool)

(assert (=> b!932946 (=> (not res!628033) (not e!524009))))

(declare-fun contains!5024 (ListLongMap!11885 (_ BitVec 64)) Bool)

(assert (=> b!932946 (= res!628033 (contains!5024 lt!420080 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31695)

(declare-fun minValue!1173 () V!31695)

(declare-fun getCurrentListMap!3201 (array!56091 array!56093 (_ BitVec 32) (_ BitVec 32) V!31695 V!31695 (_ BitVec 32) Int) ListLongMap!11885)

(assert (=> b!932946 (= lt!420080 (getCurrentListMap!3201 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932947 () Bool)

(declare-fun res!628030 () Bool)

(assert (=> b!932947 (=> (not res!628030) (not e!524009))))

(assert (=> b!932947 (= res!628030 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31830 () Bool)

(assert (=> mapIsEmpty!31830 mapRes!31830))

(declare-fun b!932948 () Bool)

(assert (=> b!932948 (= e!524005 tp_is_empty!20047)))

(declare-fun b!932949 () Bool)

(assert (=> b!932949 (= e!524006 (not true))))

(declare-fun lt!420076 () tuple2!13186)

(declare-fun +!2788 (ListLongMap!11885 tuple2!13186) ListLongMap!11885)

(assert (=> b!932949 (contains!5024 (+!2788 lt!420080 lt!420076) k0!1099)))

(declare-fun lt!420078 () V!31695)

(declare-datatypes ((Unit!31446 0))(
  ( (Unit!31447) )
))
(declare-fun lt!420077 () Unit!31446)

(declare-fun addStillContains!491 (ListLongMap!11885 (_ BitVec 64) V!31695 (_ BitVec 64)) Unit!31446)

(assert (=> b!932949 (= lt!420077 (addStillContains!491 lt!420080 lt!420079 lt!420078 k0!1099))))

(assert (=> b!932949 (= (getCurrentListMap!3201 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2788 (getCurrentListMap!3201 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420076))))

(assert (=> b!932949 (= lt!420076 (tuple2!13187 lt!420079 lt!420078))))

(declare-fun get!14206 (ValueCell!9542 V!31695) V!31695)

(declare-fun dynLambda!1585 (Int (_ BitVec 64)) V!31695)

(assert (=> b!932949 (= lt!420078 (get!14206 (select (arr!26986 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1585 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420081 () Unit!31446)

(declare-fun lemmaListMapRecursiveValidKeyArray!168 (array!56091 array!56093 (_ BitVec 32) (_ BitVec 32) V!31695 V!31695 (_ BitVec 32) Int) Unit!31446)

(assert (=> b!932949 (= lt!420081 (lemmaListMapRecursiveValidKeyArray!168 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932950 () Bool)

(declare-fun res!628031 () Bool)

(assert (=> b!932950 (=> (not res!628031) (not e!524008))))

(assert (=> b!932950 (= res!628031 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27445 _keys!1487))))))

(declare-fun mapNonEmpty!31830 () Bool)

(declare-fun tp!61061 () Bool)

(assert (=> mapNonEmpty!31830 (= mapRes!31830 (and tp!61061 e!524004))))

(declare-fun mapRest!31830 () (Array (_ BitVec 32) ValueCell!9542))

(declare-fun mapValue!31830 () ValueCell!9542)

(declare-fun mapKey!31830 () (_ BitVec 32))

(assert (=> mapNonEmpty!31830 (= (arr!26986 _values!1231) (store mapRest!31830 mapKey!31830 mapValue!31830))))

(assert (= (and start!79520 res!628038) b!932938))

(assert (= (and b!932938 res!628034) b!932939))

(assert (= (and b!932939 res!628037) b!932941))

(assert (= (and b!932941 res!628032) b!932950))

(assert (= (and b!932950 res!628031) b!932946))

(assert (= (and b!932946 res!628033) b!932944))

(assert (= (and b!932944 res!628035) b!932947))

(assert (= (and b!932947 res!628030) b!932945))

(assert (= (and b!932945 res!628029) b!932940))

(assert (= (and b!932940 res!628036) b!932949))

(assert (= (and b!932943 condMapEmpty!31830) mapIsEmpty!31830))

(assert (= (and b!932943 (not condMapEmpty!31830)) mapNonEmpty!31830))

(get-info :version)

(assert (= (and mapNonEmpty!31830 ((_ is ValueCellFull!9542) mapValue!31830)) b!932942))

(assert (= (and b!932943 ((_ is ValueCellFull!9542) mapDefault!31830)) b!932948))

(assert (= start!79520 b!932943))

(declare-fun b_lambda!13887 () Bool)

(assert (=> (not b_lambda!13887) (not b!932949)))

(declare-fun t!27044 () Bool)

(declare-fun tb!5925 () Bool)

(assert (=> (and start!79520 (= defaultEntry!1235 defaultEntry!1235) t!27044) tb!5925))

(declare-fun result!11683 () Bool)

(assert (=> tb!5925 (= result!11683 tp_is_empty!20047)))

(assert (=> b!932949 t!27044))

(declare-fun b_and!28649 () Bool)

(assert (= b_and!28647 (and (=> t!27044 result!11683) b_and!28649)))

(declare-fun m!867269 () Bool)

(assert (=> start!79520 m!867269))

(declare-fun m!867271 () Bool)

(assert (=> start!79520 m!867271))

(declare-fun m!867273 () Bool)

(assert (=> start!79520 m!867273))

(declare-fun m!867275 () Bool)

(assert (=> b!932949 m!867275))

(declare-fun m!867277 () Bool)

(assert (=> b!932949 m!867277))

(declare-fun m!867279 () Bool)

(assert (=> b!932949 m!867279))

(declare-fun m!867281 () Bool)

(assert (=> b!932949 m!867281))

(declare-fun m!867283 () Bool)

(assert (=> b!932949 m!867283))

(declare-fun m!867285 () Bool)

(assert (=> b!932949 m!867285))

(assert (=> b!932949 m!867277))

(assert (=> b!932949 m!867279))

(declare-fun m!867287 () Bool)

(assert (=> b!932949 m!867287))

(declare-fun m!867289 () Bool)

(assert (=> b!932949 m!867289))

(assert (=> b!932949 m!867283))

(assert (=> b!932949 m!867275))

(declare-fun m!867291 () Bool)

(assert (=> b!932949 m!867291))

(declare-fun m!867293 () Bool)

(assert (=> b!932949 m!867293))

(declare-fun m!867295 () Bool)

(assert (=> b!932944 m!867295))

(declare-fun m!867297 () Bool)

(assert (=> b!932939 m!867297))

(declare-fun m!867299 () Bool)

(assert (=> mapNonEmpty!31830 m!867299))

(declare-fun m!867301 () Bool)

(assert (=> b!932946 m!867301))

(declare-fun m!867303 () Bool)

(assert (=> b!932946 m!867303))

(declare-fun m!867305 () Bool)

(assert (=> b!932941 m!867305))

(declare-fun m!867307 () Bool)

(assert (=> b!932945 m!867307))

(declare-fun m!867309 () Bool)

(assert (=> b!932940 m!867309))

(declare-fun m!867311 () Bool)

(assert (=> b!932940 m!867311))

(check-sat (not start!79520) (not b_next!17539) tp_is_empty!20047 (not b!932940) (not b_lambda!13887) b_and!28649 (not mapNonEmpty!31830) (not b!932946) (not b!932944) (not b!932939) (not b!932941) (not b!932949) (not b!932945))
(check-sat b_and!28649 (not b_next!17539))
