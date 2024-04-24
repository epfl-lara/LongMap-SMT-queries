; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80032 () Bool)

(assert start!80032)

(declare-fun b_free!17761 () Bool)

(declare-fun b_next!17761 () Bool)

(assert (=> start!80032 (= b_free!17761 (not b_next!17761))))

(declare-fun tp!61748 () Bool)

(declare-fun b_and!29171 () Bool)

(assert (=> start!80032 (= tp!61748 b_and!29171)))

(declare-fun mapNonEmpty!32183 () Bool)

(declare-fun mapRes!32183 () Bool)

(declare-fun tp!61747 () Bool)

(declare-fun e!528036 () Bool)

(assert (=> mapNonEmpty!32183 (= mapRes!32183 (and tp!61747 e!528036))))

(declare-datatypes ((V!31991 0))(
  ( (V!31992 (val!10185 Int)) )
))
(declare-datatypes ((ValueCell!9653 0))(
  ( (ValueCellFull!9653 (v!12713 V!31991)) (EmptyCell!9653) )
))
(declare-fun mapRest!32183 () (Array (_ BitVec 32) ValueCell!9653))

(declare-fun mapValue!32183 () ValueCell!9653)

(declare-datatypes ((array!56531 0))(
  ( (array!56532 (arr!27199 (Array (_ BitVec 32) ValueCell!9653)) (size!27659 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56531)

(declare-fun mapKey!32183 () (_ BitVec 32))

(assert (=> mapNonEmpty!32183 (= (arr!27199 _values!1231) (store mapRest!32183 mapKey!32183 mapValue!32183))))

(declare-fun b!939992 () Bool)

(declare-fun res!632046 () Bool)

(declare-fun e!528035 () Bool)

(assert (=> b!939992 (=> (not res!632046) (not e!528035))))

(declare-datatypes ((array!56533 0))(
  ( (array!56534 (arr!27200 (Array (_ BitVec 32) (_ BitVec 64))) (size!27660 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56533)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!939992 (= res!632046 (and (= (size!27659 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27660 _keys!1487) (size!27659 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!939993 () Bool)

(declare-fun e!528030 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!939993 (= e!528030 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!939994 () Bool)

(declare-fun res!632041 () Bool)

(assert (=> b!939994 (=> (not res!632041) (not e!528035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56533 (_ BitVec 32)) Bool)

(assert (=> b!939994 (= res!632041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!939995 () Bool)

(declare-fun res!632043 () Bool)

(declare-fun e!528028 () Bool)

(assert (=> b!939995 (=> (not res!632043) (not e!528028))))

(declare-fun v!791 () V!31991)

(declare-datatypes ((tuple2!13372 0))(
  ( (tuple2!13373 (_1!6697 (_ BitVec 64)) (_2!6697 V!31991)) )
))
(declare-datatypes ((List!19151 0))(
  ( (Nil!19148) (Cons!19147 (h!20299 tuple2!13372) (t!27448 List!19151)) )
))
(declare-datatypes ((ListLongMap!12071 0))(
  ( (ListLongMap!12072 (toList!6051 List!19151)) )
))
(declare-fun lt!424646 () ListLongMap!12071)

(declare-fun apply!867 (ListLongMap!12071 (_ BitVec 64)) V!31991)

(assert (=> b!939995 (= res!632043 (= (apply!867 lt!424646 k0!1099) v!791))))

(declare-fun b!939996 () Bool)

(declare-datatypes ((Unit!31713 0))(
  ( (Unit!31714) )
))
(declare-fun e!528039 () Unit!31713)

(declare-fun e!528038 () Unit!31713)

(assert (=> b!939996 (= e!528039 e!528038)))

(declare-fun lt!424645 () (_ BitVec 64))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!939996 (= lt!424645 (select (arr!27200 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!98237 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939996 (= c!98237 (validKeyInArray!0 lt!424645))))

(declare-fun res!632047 () Bool)

(assert (=> start!80032 (=> (not res!632047) (not e!528035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!80032 (= res!632047 (validMask!0 mask!1881))))

(assert (=> start!80032 e!528035))

(assert (=> start!80032 true))

(declare-fun tp_is_empty!20269 () Bool)

(assert (=> start!80032 tp_is_empty!20269))

(declare-fun e!528034 () Bool)

(declare-fun array_inv!21238 (array!56531) Bool)

(assert (=> start!80032 (and (array_inv!21238 _values!1231) e!528034)))

(assert (=> start!80032 tp!61748))

(declare-fun array_inv!21239 (array!56533) Bool)

(assert (=> start!80032 (array_inv!21239 _keys!1487)))

(declare-fun b!939997 () Bool)

(declare-fun arrayContainsKey!0 (array!56533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939997 (= e!528030 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!939998 () Bool)

(declare-fun e!528032 () Bool)

(assert (=> b!939998 (= e!528032 e!528028)))

(declare-fun res!632040 () Bool)

(assert (=> b!939998 (=> (not res!632040) (not e!528028))))

(declare-fun contains!5125 (ListLongMap!12071 (_ BitVec 64)) Bool)

(assert (=> b!939998 (= res!632040 (contains!5125 lt!424646 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31991)

(declare-fun minValue!1173 () V!31991)

(declare-fun getCurrentListMap!3286 (array!56533 array!56531 (_ BitVec 32) (_ BitVec 32) V!31991 V!31991 (_ BitVec 32) Int) ListLongMap!12071)

(assert (=> b!939998 (= lt!424646 (getCurrentListMap!3286 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939999 () Bool)

(declare-fun e!528029 () Bool)

(assert (=> b!939999 (= e!528029 e!528032)))

(declare-fun res!632042 () Bool)

(assert (=> b!939999 (=> (not res!632042) (not e!528032))))

(assert (=> b!939999 (= res!632042 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27660 _keys!1487)))))

(declare-fun lt!424649 () Unit!31713)

(assert (=> b!939999 (= lt!424649 e!528039)))

(declare-fun c!98238 () Bool)

(assert (=> b!939999 (= c!98238 (validKeyInArray!0 k0!1099))))

(declare-fun b!940000 () Bool)

(assert (=> b!940000 (= e!528036 tp_is_empty!20269)))

(declare-fun b!940001 () Bool)

(declare-fun lt!424644 () ListLongMap!12071)

(declare-fun lt!424651 () V!31991)

(assert (=> b!940001 (= (apply!867 lt!424644 k0!1099) lt!424651)))

(declare-fun lt!424643 () ListLongMap!12071)

(declare-fun lt!424641 () Unit!31713)

(declare-fun lt!424639 () V!31991)

(declare-fun addApplyDifferent!441 (ListLongMap!12071 (_ BitVec 64) V!31991 (_ BitVec 64)) Unit!31713)

(assert (=> b!940001 (= lt!424641 (addApplyDifferent!441 lt!424643 lt!424645 lt!424639 k0!1099))))

(assert (=> b!940001 (not (= lt!424645 k0!1099))))

(declare-fun lt!424647 () Unit!31713)

(declare-datatypes ((List!19152 0))(
  ( (Nil!19149) (Cons!19148 (h!20300 (_ BitVec 64)) (t!27449 List!19152)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56533 (_ BitVec 64) (_ BitVec 32) List!19152) Unit!31713)

(assert (=> b!940001 (= lt!424647 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19149))))

(assert (=> b!940001 e!528030))

(declare-fun c!98239 () Bool)

(assert (=> b!940001 (= c!98239 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!424648 () Unit!31713)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!311 (array!56533 array!56531 (_ BitVec 32) (_ BitVec 32) V!31991 V!31991 (_ BitVec 64) (_ BitVec 32) Int) Unit!31713)

(assert (=> b!940001 (= lt!424648 (lemmaListMapContainsThenArrayContainsFrom!311 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56533 (_ BitVec 32) List!19152) Bool)

(assert (=> b!940001 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19149)))

(declare-fun lt!424650 () Unit!31713)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56533 (_ BitVec 32) (_ BitVec 32)) Unit!31713)

(assert (=> b!940001 (= lt!424650 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!940001 (contains!5125 lt!424644 k0!1099)))

(declare-fun lt!424652 () tuple2!13372)

(declare-fun +!2857 (ListLongMap!12071 tuple2!13372) ListLongMap!12071)

(assert (=> b!940001 (= lt!424644 (+!2857 lt!424643 lt!424652))))

(declare-fun lt!424640 () Unit!31713)

(declare-fun addStillContains!560 (ListLongMap!12071 (_ BitVec 64) V!31991 (_ BitVec 64)) Unit!31713)

(assert (=> b!940001 (= lt!424640 (addStillContains!560 lt!424643 lt!424645 lt!424639 k0!1099))))

(assert (=> b!940001 (= (getCurrentListMap!3286 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2857 (getCurrentListMap!3286 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424652))))

(assert (=> b!940001 (= lt!424652 (tuple2!13373 lt!424645 lt!424639))))

(declare-fun get!14367 (ValueCell!9653 V!31991) V!31991)

(declare-fun dynLambda!1654 (Int (_ BitVec 64)) V!31991)

(assert (=> b!940001 (= lt!424639 (get!14367 (select (arr!27199 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1654 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424642 () Unit!31713)

(declare-fun lemmaListMapRecursiveValidKeyArray!237 (array!56533 array!56531 (_ BitVec 32) (_ BitVec 32) V!31991 V!31991 (_ BitVec 32) Int) Unit!31713)

(assert (=> b!940001 (= lt!424642 (lemmaListMapRecursiveValidKeyArray!237 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!940001 (= e!528038 lt!424641)))

(declare-fun b!940002 () Bool)

(declare-fun Unit!31715 () Unit!31713)

(assert (=> b!940002 (= e!528038 Unit!31715)))

(declare-fun b!940003 () Bool)

(assert (=> b!940003 (= e!528028 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) from!1844))))

(declare-fun b!940004 () Bool)

(declare-fun Unit!31716 () Unit!31713)

(assert (=> b!940004 (= e!528039 Unit!31716)))

(declare-fun b!940005 () Bool)

(declare-fun e!528033 () Bool)

(assert (=> b!940005 (= e!528034 (and e!528033 mapRes!32183))))

(declare-fun condMapEmpty!32183 () Bool)

(declare-fun mapDefault!32183 () ValueCell!9653)

(assert (=> b!940005 (= condMapEmpty!32183 (= (arr!27199 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9653)) mapDefault!32183)))))

(declare-fun mapIsEmpty!32183 () Bool)

(assert (=> mapIsEmpty!32183 mapRes!32183))

(declare-fun b!940006 () Bool)

(declare-fun res!632049 () Bool)

(assert (=> b!940006 (=> (not res!632049) (not e!528035))))

(assert (=> b!940006 (= res!632049 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19149))))

(declare-fun b!940007 () Bool)

(declare-fun e!528031 () Bool)

(assert (=> b!940007 (= e!528031 e!528029)))

(declare-fun res!632045 () Bool)

(assert (=> b!940007 (=> (not res!632045) (not e!528029))))

(assert (=> b!940007 (= res!632045 (and (= lt!424651 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!940007 (= lt!424651 (apply!867 lt!424643 k0!1099))))

(declare-fun b!940008 () Bool)

(assert (=> b!940008 (= e!528033 tp_is_empty!20269)))

(declare-fun b!940009 () Bool)

(assert (=> b!940009 (= e!528035 e!528031)))

(declare-fun res!632048 () Bool)

(assert (=> b!940009 (=> (not res!632048) (not e!528031))))

(assert (=> b!940009 (= res!632048 (contains!5125 lt!424643 k0!1099))))

(assert (=> b!940009 (= lt!424643 (getCurrentListMap!3286 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!940010 () Bool)

(declare-fun res!632044 () Bool)

(assert (=> b!940010 (=> (not res!632044) (not e!528035))))

(assert (=> b!940010 (= res!632044 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27660 _keys!1487))))))

(assert (= (and start!80032 res!632047) b!939992))

(assert (= (and b!939992 res!632046) b!939994))

(assert (= (and b!939994 res!632041) b!940006))

(assert (= (and b!940006 res!632049) b!940010))

(assert (= (and b!940010 res!632044) b!940009))

(assert (= (and b!940009 res!632048) b!940007))

(assert (= (and b!940007 res!632045) b!939999))

(assert (= (and b!939999 c!98238) b!939996))

(assert (= (and b!939999 (not c!98238)) b!940004))

(assert (= (and b!939996 c!98237) b!940001))

(assert (= (and b!939996 (not c!98237)) b!940002))

(assert (= (and b!940001 c!98239) b!939997))

(assert (= (and b!940001 (not c!98239)) b!939993))

(assert (= (and b!939999 res!632042) b!939998))

(assert (= (and b!939998 res!632040) b!939995))

(assert (= (and b!939995 res!632043) b!940003))

(assert (= (and b!940005 condMapEmpty!32183) mapIsEmpty!32183))

(assert (= (and b!940005 (not condMapEmpty!32183)) mapNonEmpty!32183))

(get-info :version)

(assert (= (and mapNonEmpty!32183 ((_ is ValueCellFull!9653) mapValue!32183)) b!940000))

(assert (= (and b!940005 ((_ is ValueCellFull!9653) mapDefault!32183)) b!940008))

(assert (= start!80032 b!940005))

(declare-fun b_lambda!14281 () Bool)

(assert (=> (not b_lambda!14281) (not b!940001)))

(declare-fun t!27447 () Bool)

(declare-fun tb!6147 () Bool)

(assert (=> (and start!80032 (= defaultEntry!1235 defaultEntry!1235) t!27447) tb!6147))

(declare-fun result!12139 () Bool)

(assert (=> tb!6147 (= result!12139 tp_is_empty!20269)))

(assert (=> b!940001 t!27447))

(declare-fun b_and!29173 () Bool)

(assert (= b_and!29171 (and (=> t!27447 result!12139) b_and!29173)))

(declare-fun m!876201 () Bool)

(assert (=> b!939999 m!876201))

(declare-fun m!876203 () Bool)

(assert (=> b!939994 m!876203))

(declare-fun m!876205 () Bool)

(assert (=> b!940009 m!876205))

(declare-fun m!876207 () Bool)

(assert (=> b!940009 m!876207))

(declare-fun m!876209 () Bool)

(assert (=> b!940007 m!876209))

(declare-fun m!876211 () Bool)

(assert (=> b!939995 m!876211))

(declare-fun m!876213 () Bool)

(assert (=> start!80032 m!876213))

(declare-fun m!876215 () Bool)

(assert (=> start!80032 m!876215))

(declare-fun m!876217 () Bool)

(assert (=> start!80032 m!876217))

(declare-fun m!876219 () Bool)

(assert (=> b!940006 m!876219))

(declare-fun m!876221 () Bool)

(assert (=> b!940001 m!876221))

(declare-fun m!876223 () Bool)

(assert (=> b!940001 m!876223))

(declare-fun m!876225 () Bool)

(assert (=> b!940001 m!876225))

(declare-fun m!876227 () Bool)

(assert (=> b!940001 m!876227))

(declare-fun m!876229 () Bool)

(assert (=> b!940001 m!876229))

(declare-fun m!876231 () Bool)

(assert (=> b!940001 m!876231))

(declare-fun m!876233 () Bool)

(assert (=> b!940001 m!876233))

(declare-fun m!876235 () Bool)

(assert (=> b!940001 m!876235))

(assert (=> b!940001 m!876229))

(assert (=> b!940001 m!876233))

(declare-fun m!876237 () Bool)

(assert (=> b!940001 m!876237))

(declare-fun m!876239 () Bool)

(assert (=> b!940001 m!876239))

(declare-fun m!876241 () Bool)

(assert (=> b!940001 m!876241))

(declare-fun m!876243 () Bool)

(assert (=> b!940001 m!876243))

(declare-fun m!876245 () Bool)

(assert (=> b!940001 m!876245))

(declare-fun m!876247 () Bool)

(assert (=> b!940001 m!876247))

(declare-fun m!876249 () Bool)

(assert (=> b!940001 m!876249))

(assert (=> b!940001 m!876221))

(declare-fun m!876251 () Bool)

(assert (=> b!940001 m!876251))

(declare-fun m!876253 () Bool)

(assert (=> b!939997 m!876253))

(declare-fun m!876255 () Bool)

(assert (=> b!939996 m!876255))

(declare-fun m!876257 () Bool)

(assert (=> b!939996 m!876257))

(declare-fun m!876259 () Bool)

(assert (=> b!939998 m!876259))

(assert (=> b!939998 m!876239))

(declare-fun m!876261 () Bool)

(assert (=> mapNonEmpty!32183 m!876261))

(check-sat (not b!939998) (not b!940009) (not b!939994) (not start!80032) (not b_next!17761) (not b!940006) (not b!940001) (not b!939999) (not b!939997) (not mapNonEmpty!32183) (not b!940007) b_and!29173 (not b!939996) (not b_lambda!14281) tp_is_empty!20269 (not b!939995))
(check-sat b_and!29173 (not b_next!17761))
