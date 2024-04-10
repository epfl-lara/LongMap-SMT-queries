; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79684 () Bool)

(assert start!79684)

(declare-fun b_free!17733 () Bool)

(declare-fun b_next!17733 () Bool)

(assert (=> start!79684 (= b_free!17733 (not b_next!17733))))

(declare-fun tp!61655 () Bool)

(declare-fun b_and!29057 () Bool)

(assert (=> start!79684 (= tp!61655 b_and!29057)))

(declare-fun b!937288 () Bool)

(declare-datatypes ((Unit!31640 0))(
  ( (Unit!31641) )
))
(declare-fun e!526319 () Unit!31640)

(declare-fun Unit!31642 () Unit!31640)

(assert (=> b!937288 (= e!526319 Unit!31642)))

(declare-fun b!937289 () Bool)

(declare-fun res!630893 () Bool)

(declare-fun e!526324 () Bool)

(assert (=> b!937289 (=> (not res!630893) (not e!526324))))

(declare-datatypes ((array!56422 0))(
  ( (array!56423 (arr!27151 (Array (_ BitVec 32) (_ BitVec 64))) (size!27610 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56422)

(declare-datatypes ((List!19137 0))(
  ( (Nil!19134) (Cons!19133 (h!20279 (_ BitVec 64)) (t!27414 List!19137)) )
))
(declare-fun arrayNoDuplicates!0 (array!56422 (_ BitVec 32) List!19137) Bool)

(assert (=> b!937289 (= res!630893 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19134))))

(declare-fun b!937290 () Bool)

(declare-fun e!526323 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!937290 (= e!526323 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937291 () Bool)

(declare-fun res!630891 () Bool)

(assert (=> b!937291 (=> (not res!630891) (not e!526324))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56422 (_ BitVec 32)) Bool)

(assert (=> b!937291 (= res!630891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937292 () Bool)

(declare-fun e!526320 () Bool)

(assert (=> b!937292 (= e!526320 false)))

(declare-fun lt!422892 () Unit!31640)

(assert (=> b!937292 (= lt!422892 e!526319)))

(declare-fun c!97550 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937292 (= c!97550 (validKeyInArray!0 k0!1099))))

(declare-fun b!937293 () Bool)

(declare-fun e!526317 () Bool)

(declare-fun tp_is_empty!20241 () Bool)

(assert (=> b!937293 (= e!526317 tp_is_empty!20241)))

(declare-fun b!937294 () Bool)

(declare-fun e!526318 () Bool)

(declare-fun mapRes!32133 () Bool)

(assert (=> b!937294 (= e!526318 (and e!526317 mapRes!32133))))

(declare-fun condMapEmpty!32133 () Bool)

(declare-datatypes ((V!31953 0))(
  ( (V!31954 (val!10171 Int)) )
))
(declare-datatypes ((ValueCell!9639 0))(
  ( (ValueCellFull!9639 (v!12696 V!31953)) (EmptyCell!9639) )
))
(declare-datatypes ((array!56424 0))(
  ( (array!56425 (arr!27152 (Array (_ BitVec 32) ValueCell!9639)) (size!27611 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56424)

(declare-fun mapDefault!32133 () ValueCell!9639)

(assert (=> b!937294 (= condMapEmpty!32133 (= (arr!27152 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9639)) mapDefault!32133)))))

(declare-fun b!937295 () Bool)

(declare-fun e!526325 () Unit!31640)

(assert (=> b!937295 (= e!526319 e!526325)))

(declare-fun lt!422893 () (_ BitVec 64))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!937295 (= lt!422893 (select (arr!27151 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97551 () Bool)

(assert (=> b!937295 (= c!97551 (validKeyInArray!0 lt!422893))))

(declare-fun res!630889 () Bool)

(assert (=> start!79684 (=> (not res!630889) (not e!526324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79684 (= res!630889 (validMask!0 mask!1881))))

(assert (=> start!79684 e!526324))

(assert (=> start!79684 true))

(assert (=> start!79684 tp_is_empty!20241))

(declare-fun array_inv!21124 (array!56424) Bool)

(assert (=> start!79684 (and (array_inv!21124 _values!1231) e!526318)))

(assert (=> start!79684 tp!61655))

(declare-fun array_inv!21125 (array!56422) Bool)

(assert (=> start!79684 (array_inv!21125 _keys!1487)))

(declare-fun b!937296 () Bool)

(declare-fun e!526322 () Bool)

(assert (=> b!937296 (= e!526322 tp_is_empty!20241)))

(declare-fun b!937297 () Bool)

(declare-fun res!630895 () Bool)

(assert (=> b!937297 (=> (not res!630895) (not e!526324))))

(assert (=> b!937297 (= res!630895 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27610 _keys!1487))))))

(declare-fun mapIsEmpty!32133 () Bool)

(assert (=> mapIsEmpty!32133 mapRes!32133))

(declare-fun mapNonEmpty!32133 () Bool)

(declare-fun tp!61654 () Bool)

(assert (=> mapNonEmpty!32133 (= mapRes!32133 (and tp!61654 e!526322))))

(declare-fun mapRest!32133 () (Array (_ BitVec 32) ValueCell!9639))

(declare-fun mapValue!32133 () ValueCell!9639)

(declare-fun mapKey!32133 () (_ BitVec 32))

(assert (=> mapNonEmpty!32133 (= (arr!27152 _values!1231) (store mapRest!32133 mapKey!32133 mapValue!32133))))

(declare-fun b!937298 () Bool)

(declare-datatypes ((tuple2!13358 0))(
  ( (tuple2!13359 (_1!6690 (_ BitVec 64)) (_2!6690 V!31953)) )
))
(declare-datatypes ((List!19138 0))(
  ( (Nil!19135) (Cons!19134 (h!20280 tuple2!13358) (t!27415 List!19138)) )
))
(declare-datatypes ((ListLongMap!12055 0))(
  ( (ListLongMap!12056 (toList!6043 List!19138)) )
))
(declare-fun lt!422894 () ListLongMap!12055)

(declare-fun lt!422891 () V!31953)

(declare-fun apply!845 (ListLongMap!12055 (_ BitVec 64)) V!31953)

(assert (=> b!937298 (= (apply!845 lt!422894 k0!1099) lt!422891)))

(declare-fun lt!422888 () V!31953)

(declare-fun lt!422895 () ListLongMap!12055)

(declare-fun lt!422885 () Unit!31640)

(declare-fun addApplyDifferent!431 (ListLongMap!12055 (_ BitVec 64) V!31953 (_ BitVec 64)) Unit!31640)

(assert (=> b!937298 (= lt!422885 (addApplyDifferent!431 lt!422895 lt!422893 lt!422888 k0!1099))))

(assert (=> b!937298 (not (= lt!422893 k0!1099))))

(declare-fun lt!422887 () Unit!31640)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56422 (_ BitVec 64) (_ BitVec 32) List!19137) Unit!31640)

(assert (=> b!937298 (= lt!422887 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19134))))

(assert (=> b!937298 e!526323))

(declare-fun c!97549 () Bool)

(assert (=> b!937298 (= c!97549 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422890 () Unit!31640)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31953)

(declare-fun minValue!1173 () V!31953)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!304 (array!56422 array!56424 (_ BitVec 32) (_ BitVec 32) V!31953 V!31953 (_ BitVec 64) (_ BitVec 32) Int) Unit!31640)

(assert (=> b!937298 (= lt!422890 (lemmaListMapContainsThenArrayContainsFrom!304 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!937298 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19134)))

(declare-fun lt!422896 () Unit!31640)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56422 (_ BitVec 32) (_ BitVec 32)) Unit!31640)

(assert (=> b!937298 (= lt!422896 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5102 (ListLongMap!12055 (_ BitVec 64)) Bool)

(assert (=> b!937298 (contains!5102 lt!422894 k0!1099)))

(declare-fun lt!422897 () tuple2!13358)

(declare-fun +!2832 (ListLongMap!12055 tuple2!13358) ListLongMap!12055)

(assert (=> b!937298 (= lt!422894 (+!2832 lt!422895 lt!422897))))

(declare-fun lt!422886 () Unit!31640)

(declare-fun addStillContains!551 (ListLongMap!12055 (_ BitVec 64) V!31953 (_ BitVec 64)) Unit!31640)

(assert (=> b!937298 (= lt!422886 (addStillContains!551 lt!422895 lt!422893 lt!422888 k0!1099))))

(declare-fun getCurrentListMap!3278 (array!56422 array!56424 (_ BitVec 32) (_ BitVec 32) V!31953 V!31953 (_ BitVec 32) Int) ListLongMap!12055)

(assert (=> b!937298 (= (getCurrentListMap!3278 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2832 (getCurrentListMap!3278 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422897))))

(assert (=> b!937298 (= lt!422897 (tuple2!13359 lt!422893 lt!422888))))

(declare-fun get!14314 (ValueCell!9639 V!31953) V!31953)

(declare-fun dynLambda!1621 (Int (_ BitVec 64)) V!31953)

(assert (=> b!937298 (= lt!422888 (get!14314 (select (arr!27152 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1621 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422889 () Unit!31640)

(declare-fun lemmaListMapRecursiveValidKeyArray!222 (array!56422 array!56424 (_ BitVec 32) (_ BitVec 32) V!31953 V!31953 (_ BitVec 32) Int) Unit!31640)

(assert (=> b!937298 (= lt!422889 (lemmaListMapRecursiveValidKeyArray!222 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!937298 (= e!526325 lt!422885)))

(declare-fun b!937299 () Bool)

(declare-fun Unit!31643 () Unit!31640)

(assert (=> b!937299 (= e!526325 Unit!31643)))

(declare-fun b!937300 () Bool)

(declare-fun e!526326 () Bool)

(assert (=> b!937300 (= e!526324 e!526326)))

(declare-fun res!630892 () Bool)

(assert (=> b!937300 (=> (not res!630892) (not e!526326))))

(assert (=> b!937300 (= res!630892 (contains!5102 lt!422895 k0!1099))))

(assert (=> b!937300 (= lt!422895 (getCurrentListMap!3278 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!937301 () Bool)

(assert (=> b!937301 (= e!526326 e!526320)))

(declare-fun res!630894 () Bool)

(assert (=> b!937301 (=> (not res!630894) (not e!526320))))

(declare-fun v!791 () V!31953)

(assert (=> b!937301 (= res!630894 (and (= lt!422891 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!937301 (= lt!422891 (apply!845 lt!422895 k0!1099))))

(declare-fun b!937302 () Bool)

(declare-fun arrayContainsKey!0 (array!56422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937302 (= e!526323 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937303 () Bool)

(declare-fun res!630890 () Bool)

(assert (=> b!937303 (=> (not res!630890) (not e!526324))))

(assert (=> b!937303 (= res!630890 (and (= (size!27611 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27610 _keys!1487) (size!27611 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79684 res!630889) b!937303))

(assert (= (and b!937303 res!630890) b!937291))

(assert (= (and b!937291 res!630891) b!937289))

(assert (= (and b!937289 res!630893) b!937297))

(assert (= (and b!937297 res!630895) b!937300))

(assert (= (and b!937300 res!630892) b!937301))

(assert (= (and b!937301 res!630894) b!937292))

(assert (= (and b!937292 c!97550) b!937295))

(assert (= (and b!937292 (not c!97550)) b!937288))

(assert (= (and b!937295 c!97551) b!937298))

(assert (= (and b!937295 (not c!97551)) b!937299))

(assert (= (and b!937298 c!97549) b!937302))

(assert (= (and b!937298 (not c!97549)) b!937290))

(assert (= (and b!937294 condMapEmpty!32133) mapIsEmpty!32133))

(assert (= (and b!937294 (not condMapEmpty!32133)) mapNonEmpty!32133))

(get-info :version)

(assert (= (and mapNonEmpty!32133 ((_ is ValueCellFull!9639) mapValue!32133)) b!937296))

(assert (= (and b!937294 ((_ is ValueCellFull!9639) mapDefault!32133)) b!937293))

(assert (= start!79684 b!937294))

(declare-fun b_lambda!14139 () Bool)

(assert (=> (not b_lambda!14139) (not b!937298)))

(declare-fun t!27413 () Bool)

(declare-fun tb!6127 () Bool)

(assert (=> (and start!79684 (= defaultEntry!1235 defaultEntry!1235) t!27413) tb!6127))

(declare-fun result!12087 () Bool)

(assert (=> tb!6127 (= result!12087 tp_is_empty!20241)))

(assert (=> b!937298 t!27413))

(declare-fun b_and!29059 () Bool)

(assert (= b_and!29057 (and (=> t!27413 result!12087) b_and!29059)))

(declare-fun m!872027 () Bool)

(assert (=> b!937300 m!872027))

(declare-fun m!872029 () Bool)

(assert (=> b!937300 m!872029))

(declare-fun m!872031 () Bool)

(assert (=> b!937301 m!872031))

(declare-fun m!872033 () Bool)

(assert (=> b!937298 m!872033))

(declare-fun m!872035 () Bool)

(assert (=> b!937298 m!872035))

(declare-fun m!872037 () Bool)

(assert (=> b!937298 m!872037))

(declare-fun m!872039 () Bool)

(assert (=> b!937298 m!872039))

(declare-fun m!872041 () Bool)

(assert (=> b!937298 m!872041))

(declare-fun m!872043 () Bool)

(assert (=> b!937298 m!872043))

(assert (=> b!937298 m!872039))

(assert (=> b!937298 m!872043))

(declare-fun m!872045 () Bool)

(assert (=> b!937298 m!872045))

(declare-fun m!872047 () Bool)

(assert (=> b!937298 m!872047))

(declare-fun m!872049 () Bool)

(assert (=> b!937298 m!872049))

(declare-fun m!872051 () Bool)

(assert (=> b!937298 m!872051))

(declare-fun m!872053 () Bool)

(assert (=> b!937298 m!872053))

(assert (=> b!937298 m!872035))

(declare-fun m!872055 () Bool)

(assert (=> b!937298 m!872055))

(declare-fun m!872057 () Bool)

(assert (=> b!937298 m!872057))

(declare-fun m!872059 () Bool)

(assert (=> b!937298 m!872059))

(declare-fun m!872061 () Bool)

(assert (=> b!937298 m!872061))

(declare-fun m!872063 () Bool)

(assert (=> b!937298 m!872063))

(declare-fun m!872065 () Bool)

(assert (=> mapNonEmpty!32133 m!872065))

(declare-fun m!872067 () Bool)

(assert (=> b!937302 m!872067))

(declare-fun m!872069 () Bool)

(assert (=> b!937289 m!872069))

(declare-fun m!872071 () Bool)

(assert (=> start!79684 m!872071))

(declare-fun m!872073 () Bool)

(assert (=> start!79684 m!872073))

(declare-fun m!872075 () Bool)

(assert (=> start!79684 m!872075))

(declare-fun m!872077 () Bool)

(assert (=> b!937291 m!872077))

(declare-fun m!872079 () Bool)

(assert (=> b!937295 m!872079))

(declare-fun m!872081 () Bool)

(assert (=> b!937295 m!872081))

(declare-fun m!872083 () Bool)

(assert (=> b!937292 m!872083))

(check-sat (not b!937295) (not b!937291) (not start!79684) (not b_lambda!14139) b_and!29059 (not b!937289) (not mapNonEmpty!32133) tp_is_empty!20241 (not b!937298) (not b!937292) (not b_next!17733) (not b!937302) (not b!937301) (not b!937300))
(check-sat b_and!29059 (not b_next!17733))
