; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79690 () Bool)

(assert start!79690)

(declare-fun b_free!17739 () Bool)

(declare-fun b_next!17739 () Bool)

(assert (=> start!79690 (= b_free!17739 (not b_next!17739))))

(declare-fun tp!61673 () Bool)

(declare-fun b_and!29069 () Bool)

(assert (=> start!79690 (= tp!61673 b_and!29069)))

(declare-fun b!937438 () Bool)

(declare-fun e!526414 () Bool)

(declare-fun tp_is_empty!20247 () Bool)

(assert (=> b!937438 (= e!526414 tp_is_empty!20247)))

(declare-fun b!937439 () Bool)

(declare-fun e!526413 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!937439 (= e!526413 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937440 () Bool)

(declare-datatypes ((Unit!31650 0))(
  ( (Unit!31651) )
))
(declare-fun e!526416 () Unit!31650)

(declare-fun e!526415 () Unit!31650)

(assert (=> b!937440 (= e!526416 e!526415)))

(declare-fun lt!423004 () (_ BitVec 64))

(declare-datatypes ((array!56434 0))(
  ( (array!56435 (arr!27157 (Array (_ BitVec 32) (_ BitVec 64))) (size!27616 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56434)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!937440 (= lt!423004 (select (arr!27157 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97578 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937440 (= c!97578 (validKeyInArray!0 lt!423004))))

(declare-fun b!937441 () Bool)

(declare-fun e!526411 () Bool)

(declare-fun e!526408 () Bool)

(declare-fun mapRes!32142 () Bool)

(assert (=> b!937441 (= e!526411 (and e!526408 mapRes!32142))))

(declare-fun condMapEmpty!32142 () Bool)

(declare-datatypes ((V!31961 0))(
  ( (V!31962 (val!10174 Int)) )
))
(declare-datatypes ((ValueCell!9642 0))(
  ( (ValueCellFull!9642 (v!12699 V!31961)) (EmptyCell!9642) )
))
(declare-datatypes ((array!56436 0))(
  ( (array!56437 (arr!27158 (Array (_ BitVec 32) ValueCell!9642)) (size!27617 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56436)

(declare-fun mapDefault!32142 () ValueCell!9642)

(assert (=> b!937441 (= condMapEmpty!32142 (= (arr!27158 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9642)) mapDefault!32142)))))

(declare-fun b!937442 () Bool)

(declare-fun Unit!31652 () Unit!31650)

(assert (=> b!937442 (= e!526416 Unit!31652)))

(declare-fun b!937443 () Bool)

(declare-fun e!526412 () Bool)

(declare-fun e!526407 () Bool)

(assert (=> b!937443 (= e!526412 e!526407)))

(declare-fun res!630952 () Bool)

(assert (=> b!937443 (=> (not res!630952) (not e!526407))))

(declare-fun v!791 () V!31961)

(declare-fun lt!423008 () V!31961)

(assert (=> b!937443 (= res!630952 (and (= lt!423008 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!13364 0))(
  ( (tuple2!13365 (_1!6693 (_ BitVec 64)) (_2!6693 V!31961)) )
))
(declare-datatypes ((List!19143 0))(
  ( (Nil!19140) (Cons!19139 (h!20285 tuple2!13364) (t!27426 List!19143)) )
))
(declare-datatypes ((ListLongMap!12061 0))(
  ( (ListLongMap!12062 (toList!6046 List!19143)) )
))
(declare-fun lt!423013 () ListLongMap!12061)

(declare-fun apply!848 (ListLongMap!12061 (_ BitVec 64)) V!31961)

(assert (=> b!937443 (= lt!423008 (apply!848 lt!423013 k0!1099))))

(declare-fun b!937444 () Bool)

(declare-fun res!630958 () Bool)

(declare-fun e!526409 () Bool)

(assert (=> b!937444 (=> (not res!630958) (not e!526409))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56434 (_ BitVec 32)) Bool)

(assert (=> b!937444 (= res!630958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937445 () Bool)

(declare-fun res!630953 () Bool)

(assert (=> b!937445 (=> (not res!630953) (not e!526409))))

(declare-datatypes ((List!19144 0))(
  ( (Nil!19141) (Cons!19140 (h!20286 (_ BitVec 64)) (t!27427 List!19144)) )
))
(declare-fun arrayNoDuplicates!0 (array!56434 (_ BitVec 32) List!19144) Bool)

(assert (=> b!937445 (= res!630953 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19141))))

(declare-fun b!937446 () Bool)

(assert (=> b!937446 (= e!526408 tp_is_empty!20247)))

(declare-fun b!937447 () Bool)

(declare-fun res!630957 () Bool)

(assert (=> b!937447 (=> (not res!630957) (not e!526409))))

(assert (=> b!937447 (= res!630957 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27616 _keys!1487))))))

(declare-fun mapNonEmpty!32142 () Bool)

(declare-fun tp!61672 () Bool)

(assert (=> mapNonEmpty!32142 (= mapRes!32142 (and tp!61672 e!526414))))

(declare-fun mapValue!32142 () ValueCell!9642)

(declare-fun mapRest!32142 () (Array (_ BitVec 32) ValueCell!9642))

(declare-fun mapKey!32142 () (_ BitVec 32))

(assert (=> mapNonEmpty!32142 (= (arr!27158 _values!1231) (store mapRest!32142 mapKey!32142 mapValue!32142))))

(declare-fun b!937448 () Bool)

(declare-fun arrayContainsKey!0 (array!56434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937448 (= e!526413 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937449 () Bool)

(assert (=> b!937449 (= e!526407 false)))

(declare-fun lt!423014 () Unit!31650)

(assert (=> b!937449 (= lt!423014 e!526416)))

(declare-fun c!97576 () Bool)

(assert (=> b!937449 (= c!97576 (validKeyInArray!0 k0!1099))))

(declare-fun b!937450 () Bool)

(assert (=> b!937450 (= e!526409 e!526412)))

(declare-fun res!630955 () Bool)

(assert (=> b!937450 (=> (not res!630955) (not e!526412))))

(declare-fun contains!5105 (ListLongMap!12061 (_ BitVec 64)) Bool)

(assert (=> b!937450 (= res!630955 (contains!5105 lt!423013 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31961)

(declare-fun minValue!1173 () V!31961)

(declare-fun getCurrentListMap!3281 (array!56434 array!56436 (_ BitVec 32) (_ BitVec 32) V!31961 V!31961 (_ BitVec 32) Int) ListLongMap!12061)

(assert (=> b!937450 (= lt!423013 (getCurrentListMap!3281 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937451 () Bool)

(declare-fun Unit!31653 () Unit!31650)

(assert (=> b!937451 (= e!526415 Unit!31653)))

(declare-fun res!630956 () Bool)

(assert (=> start!79690 (=> (not res!630956) (not e!526409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79690 (= res!630956 (validMask!0 mask!1881))))

(assert (=> start!79690 e!526409))

(assert (=> start!79690 true))

(assert (=> start!79690 tp_is_empty!20247))

(declare-fun array_inv!21128 (array!56436) Bool)

(assert (=> start!79690 (and (array_inv!21128 _values!1231) e!526411)))

(assert (=> start!79690 tp!61673))

(declare-fun array_inv!21129 (array!56434) Bool)

(assert (=> start!79690 (array_inv!21129 _keys!1487)))

(declare-fun mapIsEmpty!32142 () Bool)

(assert (=> mapIsEmpty!32142 mapRes!32142))

(declare-fun b!937452 () Bool)

(declare-fun lt!423011 () ListLongMap!12061)

(assert (=> b!937452 (= (apply!848 lt!423011 k0!1099) lt!423008)))

(declare-fun lt!423006 () V!31961)

(declare-fun lt!423010 () Unit!31650)

(declare-fun addApplyDifferent!434 (ListLongMap!12061 (_ BitVec 64) V!31961 (_ BitVec 64)) Unit!31650)

(assert (=> b!937452 (= lt!423010 (addApplyDifferent!434 lt!423013 lt!423004 lt!423006 k0!1099))))

(assert (=> b!937452 (not (= lt!423004 k0!1099))))

(declare-fun lt!423012 () Unit!31650)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56434 (_ BitVec 64) (_ BitVec 32) List!19144) Unit!31650)

(assert (=> b!937452 (= lt!423012 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19141))))

(assert (=> b!937452 e!526413))

(declare-fun c!97577 () Bool)

(assert (=> b!937452 (= c!97577 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423003 () Unit!31650)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!307 (array!56434 array!56436 (_ BitVec 32) (_ BitVec 32) V!31961 V!31961 (_ BitVec 64) (_ BitVec 32) Int) Unit!31650)

(assert (=> b!937452 (= lt!423003 (lemmaListMapContainsThenArrayContainsFrom!307 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!937452 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19141)))

(declare-fun lt!423002 () Unit!31650)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56434 (_ BitVec 32) (_ BitVec 32)) Unit!31650)

(assert (=> b!937452 (= lt!423002 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!937452 (contains!5105 lt!423011 k0!1099)))

(declare-fun lt!423005 () tuple2!13364)

(declare-fun +!2835 (ListLongMap!12061 tuple2!13364) ListLongMap!12061)

(assert (=> b!937452 (= lt!423011 (+!2835 lt!423013 lt!423005))))

(declare-fun lt!423009 () Unit!31650)

(declare-fun addStillContains!554 (ListLongMap!12061 (_ BitVec 64) V!31961 (_ BitVec 64)) Unit!31650)

(assert (=> b!937452 (= lt!423009 (addStillContains!554 lt!423013 lt!423004 lt!423006 k0!1099))))

(assert (=> b!937452 (= (getCurrentListMap!3281 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2835 (getCurrentListMap!3281 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423005))))

(assert (=> b!937452 (= lt!423005 (tuple2!13365 lt!423004 lt!423006))))

(declare-fun get!14319 (ValueCell!9642 V!31961) V!31961)

(declare-fun dynLambda!1624 (Int (_ BitVec 64)) V!31961)

(assert (=> b!937452 (= lt!423006 (get!14319 (select (arr!27158 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1624 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423007 () Unit!31650)

(declare-fun lemmaListMapRecursiveValidKeyArray!225 (array!56434 array!56436 (_ BitVec 32) (_ BitVec 32) V!31961 V!31961 (_ BitVec 32) Int) Unit!31650)

(assert (=> b!937452 (= lt!423007 (lemmaListMapRecursiveValidKeyArray!225 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!937452 (= e!526415 lt!423010)))

(declare-fun b!937453 () Bool)

(declare-fun res!630954 () Bool)

(assert (=> b!937453 (=> (not res!630954) (not e!526409))))

(assert (=> b!937453 (= res!630954 (and (= (size!27617 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27616 _keys!1487) (size!27617 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79690 res!630956) b!937453))

(assert (= (and b!937453 res!630954) b!937444))

(assert (= (and b!937444 res!630958) b!937445))

(assert (= (and b!937445 res!630953) b!937447))

(assert (= (and b!937447 res!630957) b!937450))

(assert (= (and b!937450 res!630955) b!937443))

(assert (= (and b!937443 res!630952) b!937449))

(assert (= (and b!937449 c!97576) b!937440))

(assert (= (and b!937449 (not c!97576)) b!937442))

(assert (= (and b!937440 c!97578) b!937452))

(assert (= (and b!937440 (not c!97578)) b!937451))

(assert (= (and b!937452 c!97577) b!937448))

(assert (= (and b!937452 (not c!97577)) b!937439))

(assert (= (and b!937441 condMapEmpty!32142) mapIsEmpty!32142))

(assert (= (and b!937441 (not condMapEmpty!32142)) mapNonEmpty!32142))

(get-info :version)

(assert (= (and mapNonEmpty!32142 ((_ is ValueCellFull!9642) mapValue!32142)) b!937438))

(assert (= (and b!937441 ((_ is ValueCellFull!9642) mapDefault!32142)) b!937446))

(assert (= start!79690 b!937441))

(declare-fun b_lambda!14145 () Bool)

(assert (=> (not b_lambda!14145) (not b!937452)))

(declare-fun t!27425 () Bool)

(declare-fun tb!6133 () Bool)

(assert (=> (and start!79690 (= defaultEntry!1235 defaultEntry!1235) t!27425) tb!6133))

(declare-fun result!12099 () Bool)

(assert (=> tb!6133 (= result!12099 tp_is_empty!20247)))

(assert (=> b!937452 t!27425))

(declare-fun b_and!29071 () Bool)

(assert (= b_and!29069 (and (=> t!27425 result!12099) b_and!29071)))

(declare-fun m!872201 () Bool)

(assert (=> mapNonEmpty!32142 m!872201))

(declare-fun m!872203 () Bool)

(assert (=> b!937449 m!872203))

(declare-fun m!872205 () Bool)

(assert (=> b!937448 m!872205))

(declare-fun m!872207 () Bool)

(assert (=> b!937444 m!872207))

(declare-fun m!872209 () Bool)

(assert (=> b!937452 m!872209))

(declare-fun m!872211 () Bool)

(assert (=> b!937452 m!872211))

(declare-fun m!872213 () Bool)

(assert (=> b!937452 m!872213))

(declare-fun m!872215 () Bool)

(assert (=> b!937452 m!872215))

(declare-fun m!872217 () Bool)

(assert (=> b!937452 m!872217))

(declare-fun m!872219 () Bool)

(assert (=> b!937452 m!872219))

(declare-fun m!872221 () Bool)

(assert (=> b!937452 m!872221))

(declare-fun m!872223 () Bool)

(assert (=> b!937452 m!872223))

(declare-fun m!872225 () Bool)

(assert (=> b!937452 m!872225))

(declare-fun m!872227 () Bool)

(assert (=> b!937452 m!872227))

(declare-fun m!872229 () Bool)

(assert (=> b!937452 m!872229))

(declare-fun m!872231 () Bool)

(assert (=> b!937452 m!872231))

(assert (=> b!937452 m!872213))

(assert (=> b!937452 m!872217))

(declare-fun m!872233 () Bool)

(assert (=> b!937452 m!872233))

(declare-fun m!872235 () Bool)

(assert (=> b!937452 m!872235))

(declare-fun m!872237 () Bool)

(assert (=> b!937452 m!872237))

(assert (=> b!937452 m!872235))

(declare-fun m!872239 () Bool)

(assert (=> b!937452 m!872239))

(declare-fun m!872241 () Bool)

(assert (=> b!937450 m!872241))

(declare-fun m!872243 () Bool)

(assert (=> b!937450 m!872243))

(declare-fun m!872245 () Bool)

(assert (=> b!937443 m!872245))

(declare-fun m!872247 () Bool)

(assert (=> start!79690 m!872247))

(declare-fun m!872249 () Bool)

(assert (=> start!79690 m!872249))

(declare-fun m!872251 () Bool)

(assert (=> start!79690 m!872251))

(declare-fun m!872253 () Bool)

(assert (=> b!937445 m!872253))

(declare-fun m!872255 () Bool)

(assert (=> b!937440 m!872255))

(declare-fun m!872257 () Bool)

(assert (=> b!937440 m!872257))

(check-sat (not b!937449) (not b!937445) (not start!79690) b_and!29071 (not b!937452) (not mapNonEmpty!32142) (not b!937450) (not b!937440) (not b_lambda!14145) tp_is_empty!20247 (not b!937444) (not b_next!17739) (not b!937443) (not b!937448))
(check-sat b_and!29071 (not b_next!17739))
