; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79630 () Bool)

(assert start!79630)

(declare-fun b_free!17679 () Bool)

(declare-fun b_next!17679 () Bool)

(assert (=> start!79630 (= b_free!17679 (not b_next!17679))))

(declare-fun tp!61492 () Bool)

(declare-fun b_and!28949 () Bool)

(assert (=> start!79630 (= tp!61492 b_and!28949)))

(declare-fun b!935960 () Bool)

(declare-fun e!525556 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56316 0))(
  ( (array!56317 (arr!27098 (Array (_ BitVec 32) (_ BitVec 64))) (size!27557 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56316)

(assert (=> b!935960 (= e!525556 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27557 _keys!1487))))))

(declare-fun lt!421921 () (_ BitVec 64))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!935960 (not (= lt!421921 k0!1099))))

(declare-datatypes ((Unit!31567 0))(
  ( (Unit!31568) )
))
(declare-fun lt!421924 () Unit!31567)

(declare-datatypes ((List!19097 0))(
  ( (Nil!19094) (Cons!19093 (h!20239 (_ BitVec 64)) (t!27320 List!19097)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56316 (_ BitVec 64) (_ BitVec 32) List!19097) Unit!31567)

(assert (=> b!935960 (= lt!421924 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19094))))

(declare-fun e!525555 () Bool)

(assert (=> b!935960 e!525555))

(declare-fun c!97350 () Bool)

(assert (=> b!935960 (= c!97350 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!421925 () Unit!31567)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31881 0))(
  ( (V!31882 (val!10144 Int)) )
))
(declare-datatypes ((ValueCell!9612 0))(
  ( (ValueCellFull!9612 (v!12669 V!31881)) (EmptyCell!9612) )
))
(declare-datatypes ((array!56318 0))(
  ( (array!56319 (arr!27099 (Array (_ BitVec 32) ValueCell!9612)) (size!27558 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56318)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31881)

(declare-fun minValue!1173 () V!31881)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!288 (array!56316 array!56318 (_ BitVec 32) (_ BitVec 32) V!31881 V!31881 (_ BitVec 64) (_ BitVec 32) Int) Unit!31567)

(assert (=> b!935960 (= lt!421925 (lemmaListMapContainsThenArrayContainsFrom!288 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56316 (_ BitVec 32) List!19097) Bool)

(assert (=> b!935960 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19094)))

(declare-fun lt!421928 () Unit!31567)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56316 (_ BitVec 32) (_ BitVec 32)) Unit!31567)

(assert (=> b!935960 (= lt!421928 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13316 0))(
  ( (tuple2!13317 (_1!6669 (_ BitVec 64)) (_2!6669 V!31881)) )
))
(declare-datatypes ((List!19098 0))(
  ( (Nil!19095) (Cons!19094 (h!20240 tuple2!13316) (t!27321 List!19098)) )
))
(declare-datatypes ((ListLongMap!12013 0))(
  ( (ListLongMap!12014 (toList!6022 List!19098)) )
))
(declare-fun lt!421923 () ListLongMap!12013)

(declare-fun lt!421920 () tuple2!13316)

(declare-fun contains!5083 (ListLongMap!12013 (_ BitVec 64)) Bool)

(declare-fun +!2816 (ListLongMap!12013 tuple2!13316) ListLongMap!12013)

(assert (=> b!935960 (contains!5083 (+!2816 lt!421923 lt!421920) k0!1099)))

(declare-fun lt!421926 () V!31881)

(declare-fun lt!421922 () Unit!31567)

(declare-fun addStillContains!535 (ListLongMap!12013 (_ BitVec 64) V!31881 (_ BitVec 64)) Unit!31567)

(assert (=> b!935960 (= lt!421922 (addStillContains!535 lt!421923 lt!421921 lt!421926 k0!1099))))

(declare-fun getCurrentListMap!3259 (array!56316 array!56318 (_ BitVec 32) (_ BitVec 32) V!31881 V!31881 (_ BitVec 32) Int) ListLongMap!12013)

(assert (=> b!935960 (= (getCurrentListMap!3259 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2816 (getCurrentListMap!3259 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421920))))

(assert (=> b!935960 (= lt!421920 (tuple2!13317 lt!421921 lt!421926))))

(declare-fun get!14280 (ValueCell!9612 V!31881) V!31881)

(declare-fun dynLambda!1605 (Int (_ BitVec 64)) V!31881)

(assert (=> b!935960 (= lt!421926 (get!14280 (select (arr!27099 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1605 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421927 () Unit!31567)

(declare-fun lemmaListMapRecursiveValidKeyArray!206 (array!56316 array!56318 (_ BitVec 32) (_ BitVec 32) V!31881 V!31881 (_ BitVec 32) Int) Unit!31567)

(assert (=> b!935960 (= lt!421927 (lemmaListMapRecursiveValidKeyArray!206 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935961 () Bool)

(declare-fun res!630263 () Bool)

(declare-fun e!525553 () Bool)

(assert (=> b!935961 (=> (not res!630263) (not e!525553))))

(assert (=> b!935961 (= res!630263 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27557 _keys!1487))))))

(declare-fun b!935962 () Bool)

(declare-fun res!630259 () Bool)

(assert (=> b!935962 (=> (not res!630259) (not e!525553))))

(assert (=> b!935962 (= res!630259 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19094))))

(declare-fun b!935963 () Bool)

(declare-fun e!525552 () Bool)

(assert (=> b!935963 (= e!525552 e!525556)))

(declare-fun res!630264 () Bool)

(assert (=> b!935963 (=> (not res!630264) (not e!525556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935963 (= res!630264 (validKeyInArray!0 lt!421921))))

(assert (=> b!935963 (= lt!421921 (select (arr!27098 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935964 () Bool)

(declare-fun res!630262 () Bool)

(assert (=> b!935964 (=> (not res!630262) (not e!525553))))

(assert (=> b!935964 (= res!630262 (and (= (size!27558 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27557 _keys!1487) (size!27558 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935965 () Bool)

(declare-fun res!630260 () Bool)

(assert (=> b!935965 (=> (not res!630260) (not e!525553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56316 (_ BitVec 32)) Bool)

(assert (=> b!935965 (= res!630260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935966 () Bool)

(declare-fun arrayContainsKey!0 (array!56316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935966 (= e!525555 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!32052 () Bool)

(declare-fun mapRes!32052 () Bool)

(assert (=> mapIsEmpty!32052 mapRes!32052))

(declare-fun b!935967 () Bool)

(declare-fun res!630261 () Bool)

(assert (=> b!935967 (=> (not res!630261) (not e!525552))))

(assert (=> b!935967 (= res!630261 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935968 () Bool)

(declare-fun e!525558 () Bool)

(declare-fun e!525557 () Bool)

(assert (=> b!935968 (= e!525558 (and e!525557 mapRes!32052))))

(declare-fun condMapEmpty!32052 () Bool)

(declare-fun mapDefault!32052 () ValueCell!9612)

(assert (=> b!935968 (= condMapEmpty!32052 (= (arr!27099 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9612)) mapDefault!32052)))))

(declare-fun b!935969 () Bool)

(declare-fun e!525551 () Bool)

(declare-fun tp_is_empty!20187 () Bool)

(assert (=> b!935969 (= e!525551 tp_is_empty!20187)))

(declare-fun b!935970 () Bool)

(assert (=> b!935970 (= e!525555 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32052 () Bool)

(declare-fun tp!61493 () Bool)

(assert (=> mapNonEmpty!32052 (= mapRes!32052 (and tp!61493 e!525551))))

(declare-fun mapRest!32052 () (Array (_ BitVec 32) ValueCell!9612))

(declare-fun mapKey!32052 () (_ BitVec 32))

(declare-fun mapValue!32052 () ValueCell!9612)

(assert (=> mapNonEmpty!32052 (= (arr!27099 _values!1231) (store mapRest!32052 mapKey!32052 mapValue!32052))))

(declare-fun b!935971 () Bool)

(assert (=> b!935971 (= e!525553 e!525552)))

(declare-fun res!630258 () Bool)

(assert (=> b!935971 (=> (not res!630258) (not e!525552))))

(assert (=> b!935971 (= res!630258 (contains!5083 lt!421923 k0!1099))))

(assert (=> b!935971 (= lt!421923 (getCurrentListMap!3259 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935972 () Bool)

(declare-fun res!630265 () Bool)

(assert (=> b!935972 (=> (not res!630265) (not e!525552))))

(declare-fun v!791 () V!31881)

(declare-fun apply!824 (ListLongMap!12013 (_ BitVec 64)) V!31881)

(assert (=> b!935972 (= res!630265 (= (apply!824 lt!421923 k0!1099) v!791))))

(declare-fun res!630257 () Bool)

(assert (=> start!79630 (=> (not res!630257) (not e!525553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79630 (= res!630257 (validMask!0 mask!1881))))

(assert (=> start!79630 e!525553))

(assert (=> start!79630 true))

(assert (=> start!79630 tp_is_empty!20187))

(declare-fun array_inv!21088 (array!56318) Bool)

(assert (=> start!79630 (and (array_inv!21088 _values!1231) e!525558)))

(assert (=> start!79630 tp!61492))

(declare-fun array_inv!21089 (array!56316) Bool)

(assert (=> start!79630 (array_inv!21089 _keys!1487)))

(declare-fun b!935973 () Bool)

(declare-fun res!630256 () Bool)

(assert (=> b!935973 (=> (not res!630256) (not e!525552))))

(assert (=> b!935973 (= res!630256 (validKeyInArray!0 k0!1099))))

(declare-fun b!935974 () Bool)

(assert (=> b!935974 (= e!525557 tp_is_empty!20187)))

(assert (= (and start!79630 res!630257) b!935964))

(assert (= (and b!935964 res!630262) b!935965))

(assert (= (and b!935965 res!630260) b!935962))

(assert (= (and b!935962 res!630259) b!935961))

(assert (= (and b!935961 res!630263) b!935971))

(assert (= (and b!935971 res!630258) b!935972))

(assert (= (and b!935972 res!630265) b!935967))

(assert (= (and b!935967 res!630261) b!935973))

(assert (= (and b!935973 res!630256) b!935963))

(assert (= (and b!935963 res!630264) b!935960))

(assert (= (and b!935960 c!97350) b!935966))

(assert (= (and b!935960 (not c!97350)) b!935970))

(assert (= (and b!935968 condMapEmpty!32052) mapIsEmpty!32052))

(assert (= (and b!935968 (not condMapEmpty!32052)) mapNonEmpty!32052))

(get-info :version)

(assert (= (and mapNonEmpty!32052 ((_ is ValueCellFull!9612) mapValue!32052)) b!935969))

(assert (= (and b!935968 ((_ is ValueCellFull!9612) mapDefault!32052)) b!935974))

(assert (= start!79630 b!935968))

(declare-fun b_lambda!14085 () Bool)

(assert (=> (not b_lambda!14085) (not b!935960)))

(declare-fun t!27319 () Bool)

(declare-fun tb!6073 () Bool)

(assert (=> (and start!79630 (= defaultEntry!1235 defaultEntry!1235) t!27319) tb!6073))

(declare-fun result!11979 () Bool)

(assert (=> tb!6073 (= result!11979 tp_is_empty!20187)))

(assert (=> b!935960 t!27319))

(declare-fun b_and!28951 () Bool)

(assert (= b_and!28949 (and (=> t!27319 result!11979) b_and!28951)))

(declare-fun m!870493 () Bool)

(assert (=> b!935965 m!870493))

(declare-fun m!870495 () Bool)

(assert (=> b!935962 m!870495))

(declare-fun m!870497 () Bool)

(assert (=> b!935960 m!870497))

(declare-fun m!870499 () Bool)

(assert (=> b!935960 m!870499))

(declare-fun m!870501 () Bool)

(assert (=> b!935960 m!870501))

(declare-fun m!870503 () Bool)

(assert (=> b!935960 m!870503))

(declare-fun m!870505 () Bool)

(assert (=> b!935960 m!870505))

(declare-fun m!870507 () Bool)

(assert (=> b!935960 m!870507))

(assert (=> b!935960 m!870505))

(declare-fun m!870509 () Bool)

(assert (=> b!935960 m!870509))

(declare-fun m!870511 () Bool)

(assert (=> b!935960 m!870511))

(declare-fun m!870513 () Bool)

(assert (=> b!935960 m!870513))

(declare-fun m!870515 () Bool)

(assert (=> b!935960 m!870515))

(assert (=> b!935960 m!870503))

(declare-fun m!870517 () Bool)

(assert (=> b!935960 m!870517))

(assert (=> b!935960 m!870507))

(assert (=> b!935960 m!870499))

(declare-fun m!870519 () Bool)

(assert (=> b!935960 m!870519))

(declare-fun m!870521 () Bool)

(assert (=> b!935960 m!870521))

(declare-fun m!870523 () Bool)

(assert (=> b!935960 m!870523))

(declare-fun m!870525 () Bool)

(assert (=> b!935971 m!870525))

(declare-fun m!870527 () Bool)

(assert (=> b!935971 m!870527))

(declare-fun m!870529 () Bool)

(assert (=> start!79630 m!870529))

(declare-fun m!870531 () Bool)

(assert (=> start!79630 m!870531))

(declare-fun m!870533 () Bool)

(assert (=> start!79630 m!870533))

(declare-fun m!870535 () Bool)

(assert (=> b!935966 m!870535))

(declare-fun m!870537 () Bool)

(assert (=> mapNonEmpty!32052 m!870537))

(declare-fun m!870539 () Bool)

(assert (=> b!935972 m!870539))

(declare-fun m!870541 () Bool)

(assert (=> b!935973 m!870541))

(declare-fun m!870543 () Bool)

(assert (=> b!935963 m!870543))

(declare-fun m!870545 () Bool)

(assert (=> b!935963 m!870545))

(check-sat (not b!935971) (not b!935965) b_and!28951 (not b!935972) (not b!935973) (not b_next!17679) (not b!935963) (not b_lambda!14085) (not b!935960) tp_is_empty!20187 (not start!79630) (not b!935966) (not b!935962) (not mapNonEmpty!32052))
(check-sat b_and!28951 (not b_next!17679))
