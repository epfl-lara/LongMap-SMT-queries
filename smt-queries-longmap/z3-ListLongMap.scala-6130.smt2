; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78890 () Bool)

(assert start!78890)

(declare-fun b_free!17103 () Bool)

(declare-fun b_next!17103 () Bool)

(assert (=> start!78890 (= b_free!17103 (not b_next!17103))))

(declare-fun tp!59750 () Bool)

(declare-fun b_and!27943 () Bool)

(assert (=> start!78890 (= tp!59750 b_and!27943)))

(declare-fun mapNonEmpty!31173 () Bool)

(declare-fun mapRes!31173 () Bool)

(declare-fun tp!59749 () Bool)

(declare-fun e!517427 () Bool)

(assert (=> mapNonEmpty!31173 (= mapRes!31173 (and tp!59749 e!517427))))

(declare-fun mapKey!31173 () (_ BitVec 32))

(declare-datatypes ((V!31113 0))(
  ( (V!31114 (val!9856 Int)) )
))
(declare-datatypes ((ValueCell!9324 0))(
  ( (ValueCellFull!9324 (v!12374 V!31113)) (EmptyCell!9324) )
))
(declare-fun mapValue!31173 () ValueCell!9324)

(declare-datatypes ((array!55198 0))(
  ( (array!55199 (arr!26544 (Array (_ BitVec 32) ValueCell!9324)) (size!27003 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55198)

(declare-fun mapRest!31173 () (Array (_ BitVec 32) ValueCell!9324))

(assert (=> mapNonEmpty!31173 (= (arr!26544 _values!1231) (store mapRest!31173 mapKey!31173 mapValue!31173))))

(declare-fun b!922142 () Bool)

(declare-fun res!621859 () Bool)

(declare-fun e!517429 () Bool)

(assert (=> b!922142 (=> (not res!621859) (not e!517429))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55200 0))(
  ( (array!55201 (arr!26545 (Array (_ BitVec 32) (_ BitVec 64))) (size!27004 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55200)

(assert (=> b!922142 (= res!621859 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27004 _keys!1487))))))

(declare-fun b!922143 () Bool)

(declare-fun e!517430 () Bool)

(declare-fun e!517426 () Bool)

(assert (=> b!922143 (= e!517430 e!517426)))

(declare-fun res!621856 () Bool)

(assert (=> b!922143 (=> (not res!621856) (not e!517426))))

(declare-fun lt!414068 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922143 (= res!621856 (validKeyInArray!0 lt!414068))))

(assert (=> b!922143 (= lt!414068 (select (arr!26545 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!922144 () Bool)

(assert (=> b!922144 (= e!517429 e!517430)))

(declare-fun res!621861 () Bool)

(assert (=> b!922144 (=> (not res!621861) (not e!517430))))

(declare-datatypes ((tuple2!12820 0))(
  ( (tuple2!12821 (_1!6421 (_ BitVec 64)) (_2!6421 V!31113)) )
))
(declare-datatypes ((List!18625 0))(
  ( (Nil!18622) (Cons!18621 (h!19767 tuple2!12820) (t!26458 List!18625)) )
))
(declare-datatypes ((ListLongMap!11517 0))(
  ( (ListLongMap!11518 (toList!5774 List!18625)) )
))
(declare-fun lt!414066 () ListLongMap!11517)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4837 (ListLongMap!11517 (_ BitVec 64)) Bool)

(assert (=> b!922144 (= res!621861 (contains!4837 lt!414066 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31113)

(declare-fun minValue!1173 () V!31113)

(declare-fun getCurrentListMap!3028 (array!55200 array!55198 (_ BitVec 32) (_ BitVec 32) V!31113 V!31113 (_ BitVec 32) Int) ListLongMap!11517)

(assert (=> b!922144 (= lt!414066 (getCurrentListMap!3028 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!922145 () Bool)

(assert (=> b!922145 (= e!517426 (not true))))

(assert (=> b!922145 (not (= lt!414068 k0!1099))))

(declare-datatypes ((Unit!31110 0))(
  ( (Unit!31111) )
))
(declare-fun lt!414072 () Unit!31110)

(declare-datatypes ((List!18626 0))(
  ( (Nil!18623) (Cons!18622 (h!19768 (_ BitVec 64)) (t!26459 List!18626)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55200 (_ BitVec 64) (_ BitVec 32) List!18626) Unit!31110)

(assert (=> b!922145 (= lt!414072 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18623))))

(declare-fun e!517428 () Bool)

(assert (=> b!922145 e!517428))

(declare-fun c!96156 () Bool)

(assert (=> b!922145 (= c!96156 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414073 () Unit!31110)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!188 (array!55200 array!55198 (_ BitVec 32) (_ BitVec 32) V!31113 V!31113 (_ BitVec 64) (_ BitVec 32) Int) Unit!31110)

(assert (=> b!922145 (= lt!414073 (lemmaListMapContainsThenArrayContainsFrom!188 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55200 (_ BitVec 32) List!18626) Bool)

(assert (=> b!922145 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18623)))

(declare-fun lt!414065 () Unit!31110)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55200 (_ BitVec 32) (_ BitVec 32)) Unit!31110)

(assert (=> b!922145 (= lt!414065 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414071 () tuple2!12820)

(declare-fun +!2681 (ListLongMap!11517 tuple2!12820) ListLongMap!11517)

(assert (=> b!922145 (contains!4837 (+!2681 lt!414066 lt!414071) k0!1099)))

(declare-fun lt!414067 () Unit!31110)

(declare-fun lt!414069 () V!31113)

(declare-fun addStillContains!405 (ListLongMap!11517 (_ BitVec 64) V!31113 (_ BitVec 64)) Unit!31110)

(assert (=> b!922145 (= lt!414067 (addStillContains!405 lt!414066 lt!414068 lt!414069 k0!1099))))

(assert (=> b!922145 (= (getCurrentListMap!3028 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2681 (getCurrentListMap!3028 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414071))))

(assert (=> b!922145 (= lt!414071 (tuple2!12821 lt!414068 lt!414069))))

(declare-fun get!13938 (ValueCell!9324 V!31113) V!31113)

(declare-fun dynLambda!1470 (Int (_ BitVec 64)) V!31113)

(assert (=> b!922145 (= lt!414069 (get!13938 (select (arr!26544 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1470 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414070 () Unit!31110)

(declare-fun lemmaListMapRecursiveValidKeyArray!71 (array!55200 array!55198 (_ BitVec 32) (_ BitVec 32) V!31113 V!31113 (_ BitVec 32) Int) Unit!31110)

(assert (=> b!922145 (= lt!414070 (lemmaListMapRecursiveValidKeyArray!71 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!922146 () Bool)

(declare-fun res!621855 () Bool)

(assert (=> b!922146 (=> (not res!621855) (not e!517429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55200 (_ BitVec 32)) Bool)

(assert (=> b!922146 (= res!621855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922147 () Bool)

(declare-fun arrayContainsKey!0 (array!55200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922147 (= e!517428 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!922148 () Bool)

(declare-fun e!517425 () Bool)

(declare-fun e!517432 () Bool)

(assert (=> b!922148 (= e!517425 (and e!517432 mapRes!31173))))

(declare-fun condMapEmpty!31173 () Bool)

(declare-fun mapDefault!31173 () ValueCell!9324)

(assert (=> b!922148 (= condMapEmpty!31173 (= (arr!26544 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9324)) mapDefault!31173)))))

(declare-fun b!922149 () Bool)

(declare-fun res!621853 () Bool)

(assert (=> b!922149 (=> (not res!621853) (not e!517430))))

(declare-fun v!791 () V!31113)

(declare-fun apply!612 (ListLongMap!11517 (_ BitVec 64)) V!31113)

(assert (=> b!922149 (= res!621853 (= (apply!612 lt!414066 k0!1099) v!791))))

(declare-fun b!922151 () Bool)

(declare-fun tp_is_empty!19611 () Bool)

(assert (=> b!922151 (= e!517432 tp_is_empty!19611)))

(declare-fun mapIsEmpty!31173 () Bool)

(assert (=> mapIsEmpty!31173 mapRes!31173))

(declare-fun b!922152 () Bool)

(declare-fun res!621862 () Bool)

(assert (=> b!922152 (=> (not res!621862) (not e!517429))))

(assert (=> b!922152 (= res!621862 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18623))))

(declare-fun b!922153 () Bool)

(declare-fun res!621860 () Bool)

(assert (=> b!922153 (=> (not res!621860) (not e!517430))))

(assert (=> b!922153 (= res!621860 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!922154 () Bool)

(assert (=> b!922154 (= e!517427 tp_is_empty!19611)))

(declare-fun b!922155 () Bool)

(declare-fun res!621857 () Bool)

(assert (=> b!922155 (=> (not res!621857) (not e!517430))))

(assert (=> b!922155 (= res!621857 (validKeyInArray!0 k0!1099))))

(declare-fun b!922156 () Bool)

(declare-fun res!621858 () Bool)

(assert (=> b!922156 (=> (not res!621858) (not e!517429))))

(assert (=> b!922156 (= res!621858 (and (= (size!27003 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27004 _keys!1487) (size!27003 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!922150 () Bool)

(assert (=> b!922150 (= e!517428 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!621854 () Bool)

(assert (=> start!78890 (=> (not res!621854) (not e!517429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78890 (= res!621854 (validMask!0 mask!1881))))

(assert (=> start!78890 e!517429))

(assert (=> start!78890 true))

(assert (=> start!78890 tp_is_empty!19611))

(declare-fun array_inv!20676 (array!55198) Bool)

(assert (=> start!78890 (and (array_inv!20676 _values!1231) e!517425)))

(assert (=> start!78890 tp!59750))

(declare-fun array_inv!20677 (array!55200) Bool)

(assert (=> start!78890 (array_inv!20677 _keys!1487)))

(assert (= (and start!78890 res!621854) b!922156))

(assert (= (and b!922156 res!621858) b!922146))

(assert (= (and b!922146 res!621855) b!922152))

(assert (= (and b!922152 res!621862) b!922142))

(assert (= (and b!922142 res!621859) b!922144))

(assert (= (and b!922144 res!621861) b!922149))

(assert (= (and b!922149 res!621853) b!922153))

(assert (= (and b!922153 res!621860) b!922155))

(assert (= (and b!922155 res!621857) b!922143))

(assert (= (and b!922143 res!621856) b!922145))

(assert (= (and b!922145 c!96156) b!922147))

(assert (= (and b!922145 (not c!96156)) b!922150))

(assert (= (and b!922148 condMapEmpty!31173) mapIsEmpty!31173))

(assert (= (and b!922148 (not condMapEmpty!31173)) mapNonEmpty!31173))

(get-info :version)

(assert (= (and mapNonEmpty!31173 ((_ is ValueCellFull!9324) mapValue!31173)) b!922154))

(assert (= (and b!922148 ((_ is ValueCellFull!9324) mapDefault!31173)) b!922151))

(assert (= start!78890 b!922148))

(declare-fun b_lambda!13605 () Bool)

(assert (=> (not b_lambda!13605) (not b!922145)))

(declare-fun t!26457 () Bool)

(declare-fun tb!5683 () Bool)

(assert (=> (and start!78890 (= defaultEntry!1235 defaultEntry!1235) t!26457) tb!5683))

(declare-fun result!11189 () Bool)

(assert (=> tb!5683 (= result!11189 tp_is_empty!19611)))

(assert (=> b!922145 t!26457))

(declare-fun b_and!27945 () Bool)

(assert (= b_and!27943 (and (=> t!26457 result!11189) b_and!27945)))

(declare-fun m!856167 () Bool)

(assert (=> mapNonEmpty!31173 m!856167))

(declare-fun m!856169 () Bool)

(assert (=> b!922149 m!856169))

(declare-fun m!856171 () Bool)

(assert (=> b!922144 m!856171))

(declare-fun m!856173 () Bool)

(assert (=> b!922144 m!856173))

(declare-fun m!856175 () Bool)

(assert (=> b!922155 m!856175))

(declare-fun m!856177 () Bool)

(assert (=> b!922146 m!856177))

(declare-fun m!856179 () Bool)

(assert (=> b!922143 m!856179))

(declare-fun m!856181 () Bool)

(assert (=> b!922143 m!856181))

(declare-fun m!856183 () Bool)

(assert (=> b!922147 m!856183))

(declare-fun m!856185 () Bool)

(assert (=> b!922152 m!856185))

(declare-fun m!856187 () Bool)

(assert (=> b!922145 m!856187))

(declare-fun m!856189 () Bool)

(assert (=> b!922145 m!856189))

(declare-fun m!856191 () Bool)

(assert (=> b!922145 m!856191))

(declare-fun m!856193 () Bool)

(assert (=> b!922145 m!856193))

(declare-fun m!856195 () Bool)

(assert (=> b!922145 m!856195))

(assert (=> b!922145 m!856187))

(assert (=> b!922145 m!856195))

(declare-fun m!856197 () Bool)

(assert (=> b!922145 m!856197))

(declare-fun m!856199 () Bool)

(assert (=> b!922145 m!856199))

(declare-fun m!856201 () Bool)

(assert (=> b!922145 m!856201))

(declare-fun m!856203 () Bool)

(assert (=> b!922145 m!856203))

(declare-fun m!856205 () Bool)

(assert (=> b!922145 m!856205))

(declare-fun m!856207 () Bool)

(assert (=> b!922145 m!856207))

(assert (=> b!922145 m!856197))

(declare-fun m!856209 () Bool)

(assert (=> b!922145 m!856209))

(declare-fun m!856211 () Bool)

(assert (=> b!922145 m!856211))

(assert (=> b!922145 m!856209))

(declare-fun m!856213 () Bool)

(assert (=> b!922145 m!856213))

(declare-fun m!856215 () Bool)

(assert (=> start!78890 m!856215))

(declare-fun m!856217 () Bool)

(assert (=> start!78890 m!856217))

(declare-fun m!856219 () Bool)

(assert (=> start!78890 m!856219))

(check-sat (not b!922143) (not b!922155) (not b_lambda!13605) (not b_next!17103) b_and!27945 (not b!922144) (not start!78890) tp_is_empty!19611 (not mapNonEmpty!31173) (not b!922147) (not b!922146) (not b!922152) (not b!922149) (not b!922145))
(check-sat b_and!27945 (not b_next!17103))
