; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79852 () Bool)

(assert start!79852)

(declare-fun b_free!17767 () Bool)

(declare-fun b_next!17767 () Bool)

(assert (=> start!79852 (= b_free!17767 (not b_next!17767))))

(declare-fun tp!61765 () Bool)

(declare-fun b_and!29147 () Bool)

(assert (=> start!79852 (= tp!61765 b_and!29147)))

(declare-fun b!939029 () Bool)

(declare-fun e!527413 () Bool)

(declare-fun e!527411 () Bool)

(assert (=> b!939029 (= e!527413 e!527411)))

(declare-fun res!631684 () Bool)

(assert (=> b!939029 (=> (not res!631684) (not e!527411))))

(declare-datatypes ((V!31999 0))(
  ( (V!32000 (val!10188 Int)) )
))
(declare-datatypes ((tuple2!13446 0))(
  ( (tuple2!13447 (_1!6734 (_ BitVec 64)) (_2!6734 V!31999)) )
))
(declare-datatypes ((List!19187 0))(
  ( (Nil!19184) (Cons!19183 (h!20329 tuple2!13446) (t!27489 List!19187)) )
))
(declare-datatypes ((ListLongMap!12133 0))(
  ( (ListLongMap!12134 (toList!6082 List!19187)) )
))
(declare-fun lt!424181 () ListLongMap!12133)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5087 (ListLongMap!12133 (_ BitVec 64)) Bool)

(assert (=> b!939029 (= res!631684 (contains!5087 lt!424181 k0!1099))))

(declare-datatypes ((array!56461 0))(
  ( (array!56462 (arr!27169 (Array (_ BitVec 32) (_ BitVec 64))) (size!27630 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56461)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9656 0))(
  ( (ValueCellFull!9656 (v!12718 V!31999)) (EmptyCell!9656) )
))
(declare-datatypes ((array!56463 0))(
  ( (array!56464 (arr!27170 (Array (_ BitVec 32) ValueCell!9656)) (size!27631 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56463)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31999)

(declare-fun minValue!1173 () V!31999)

(declare-fun getCurrentListMap!3245 (array!56461 array!56463 (_ BitVec 32) (_ BitVec 32) V!31999 V!31999 (_ BitVec 32) Int) ListLongMap!12133)

(assert (=> b!939029 (= lt!424181 (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!939030 () Bool)

(declare-datatypes ((Unit!31633 0))(
  ( (Unit!31634) )
))
(declare-fun e!527412 () Unit!31633)

(declare-fun Unit!31635 () Unit!31633)

(assert (=> b!939030 (= e!527412 Unit!31635)))

(declare-fun b!939031 () Bool)

(declare-fun res!631686 () Bool)

(assert (=> b!939031 (=> (not res!631686) (not e!527413))))

(assert (=> b!939031 (= res!631686 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27630 _keys!1487))))))

(declare-fun b!939032 () Bool)

(declare-fun e!527410 () Unit!31633)

(assert (=> b!939032 (= e!527410 e!527412)))

(declare-fun lt!424184 () (_ BitVec 64))

(assert (=> b!939032 (= lt!424184 (select (arr!27169 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97918 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939032 (= c!97918 (validKeyInArray!0 lt!424184))))

(declare-fun b!939034 () Bool)

(declare-fun res!631687 () Bool)

(assert (=> b!939034 (=> (not res!631687) (not e!527413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56461 (_ BitVec 32)) Bool)

(assert (=> b!939034 (= res!631687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!939035 () Bool)

(declare-fun e!527414 () Bool)

(declare-fun e!527420 () Bool)

(assert (=> b!939035 (= e!527414 e!527420)))

(declare-fun res!631679 () Bool)

(assert (=> b!939035 (=> (not res!631679) (not e!527420))))

(declare-fun lt!424174 () ListLongMap!12133)

(assert (=> b!939035 (= res!631679 (contains!5087 lt!424174 k0!1099))))

(assert (=> b!939035 (= lt!424174 (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939036 () Bool)

(declare-fun e!527416 () Bool)

(assert (=> b!939036 (= e!527416 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!939037 () Bool)

(declare-fun e!527408 () Bool)

(assert (=> b!939037 (= e!527408 e!527414)))

(declare-fun res!631685 () Bool)

(assert (=> b!939037 (=> (not res!631685) (not e!527414))))

(assert (=> b!939037 (= res!631685 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27630 _keys!1487)))))

(declare-fun lt!424182 () Unit!31633)

(assert (=> b!939037 (= lt!424182 e!527410)))

(declare-fun c!97919 () Bool)

(assert (=> b!939037 (= c!97919 (validKeyInArray!0 k0!1099))))

(declare-fun b!939038 () Bool)

(declare-fun e!527417 () Bool)

(declare-fun e!527415 () Bool)

(declare-fun mapRes!32192 () Bool)

(assert (=> b!939038 (= e!527417 (and e!527415 mapRes!32192))))

(declare-fun condMapEmpty!32192 () Bool)

(declare-fun mapDefault!32192 () ValueCell!9656)

(assert (=> b!939038 (= condMapEmpty!32192 (= (arr!27170 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9656)) mapDefault!32192)))))

(declare-fun b!939039 () Bool)

(declare-fun lt!424177 () ListLongMap!12133)

(declare-fun lt!424178 () V!31999)

(declare-fun apply!855 (ListLongMap!12133 (_ BitVec 64)) V!31999)

(assert (=> b!939039 (= (apply!855 lt!424177 k0!1099) lt!424178)))

(declare-fun lt!424189 () Unit!31633)

(declare-fun lt!424186 () V!31999)

(declare-fun addApplyDifferent!437 (ListLongMap!12133 (_ BitVec 64) V!31999 (_ BitVec 64)) Unit!31633)

(assert (=> b!939039 (= lt!424189 (addApplyDifferent!437 lt!424181 lt!424184 lt!424186 k0!1099))))

(assert (=> b!939039 (not (= lt!424184 k0!1099))))

(declare-fun lt!424183 () Unit!31633)

(declare-datatypes ((List!19188 0))(
  ( (Nil!19185) (Cons!19184 (h!20330 (_ BitVec 64)) (t!27490 List!19188)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56461 (_ BitVec 64) (_ BitVec 32) List!19188) Unit!31633)

(assert (=> b!939039 (= lt!424183 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19185))))

(assert (=> b!939039 e!527416))

(declare-fun c!97917 () Bool)

(assert (=> b!939039 (= c!97917 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!424188 () Unit!31633)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!315 (array!56461 array!56463 (_ BitVec 32) (_ BitVec 32) V!31999 V!31999 (_ BitVec 64) (_ BitVec 32) Int) Unit!31633)

(assert (=> b!939039 (= lt!424188 (lemmaListMapContainsThenArrayContainsFrom!315 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56461 (_ BitVec 32) List!19188) Bool)

(assert (=> b!939039 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19185)))

(declare-fun lt!424176 () Unit!31633)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56461 (_ BitVec 32) (_ BitVec 32)) Unit!31633)

(assert (=> b!939039 (= lt!424176 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!939039 (contains!5087 lt!424177 k0!1099)))

(declare-fun lt!424187 () tuple2!13446)

(declare-fun +!2868 (ListLongMap!12133 tuple2!13446) ListLongMap!12133)

(assert (=> b!939039 (= lt!424177 (+!2868 lt!424181 lt!424187))))

(declare-fun lt!424179 () Unit!31633)

(declare-fun addStillContains!557 (ListLongMap!12133 (_ BitVec 64) V!31999 (_ BitVec 64)) Unit!31633)

(assert (=> b!939039 (= lt!424179 (addStillContains!557 lt!424181 lt!424184 lt!424186 k0!1099))))

(assert (=> b!939039 (= (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2868 (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424187))))

(assert (=> b!939039 (= lt!424187 (tuple2!13447 lt!424184 lt!424186))))

(declare-fun get!14340 (ValueCell!9656 V!31999) V!31999)

(declare-fun dynLambda!1624 (Int (_ BitVec 64)) V!31999)

(assert (=> b!939039 (= lt!424186 (get!14340 (select (arr!27170 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1624 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424190 () Unit!31633)

(declare-fun lemmaListMapRecursiveValidKeyArray!232 (array!56461 array!56463 (_ BitVec 32) (_ BitVec 32) V!31999 V!31999 (_ BitVec 32) Int) Unit!31633)

(assert (=> b!939039 (= lt!424190 (lemmaListMapRecursiveValidKeyArray!232 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!939039 (= e!527412 lt!424189)))

(declare-fun mapIsEmpty!32192 () Bool)

(assert (=> mapIsEmpty!32192 mapRes!32192))

(declare-fun b!939040 () Bool)

(declare-fun e!527419 () Bool)

(declare-fun tp_is_empty!20275 () Bool)

(assert (=> b!939040 (= e!527419 tp_is_empty!20275)))

(declare-fun mapNonEmpty!32192 () Bool)

(declare-fun tp!61766 () Bool)

(assert (=> mapNonEmpty!32192 (= mapRes!32192 (and tp!61766 e!527419))))

(declare-fun mapValue!32192 () ValueCell!9656)

(declare-fun mapRest!32192 () (Array (_ BitVec 32) ValueCell!9656))

(declare-fun mapKey!32192 () (_ BitVec 32))

(assert (=> mapNonEmpty!32192 (= (arr!27170 _values!1231) (store mapRest!32192 mapKey!32192 mapValue!32192))))

(declare-fun b!939041 () Bool)

(assert (=> b!939041 (= e!527415 tp_is_empty!20275)))

(declare-fun b!939042 () Bool)

(declare-fun res!631682 () Bool)

(assert (=> b!939042 (=> (not res!631682) (not e!527420))))

(declare-fun v!791 () V!31999)

(assert (=> b!939042 (= res!631682 (= (apply!855 lt!424174 k0!1099) v!791))))

(declare-fun b!939043 () Bool)

(declare-fun arrayContainsKey!0 (array!56461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939043 (= e!527416 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!939044 () Bool)

(assert (=> b!939044 (= e!527420 (not true))))

(declare-fun lt!424185 () V!31999)

(declare-fun lt!424175 () ListLongMap!12133)

(assert (=> b!939044 (= lt!424185 (apply!855 lt!424175 k0!1099))))

(declare-fun e!527409 () Bool)

(assert (=> b!939044 e!527409))

(declare-fun res!631683 () Bool)

(assert (=> b!939044 (=> (not res!631683) (not e!527409))))

(assert (=> b!939044 (= res!631683 (contains!5087 lt!424175 k0!1099))))

(assert (=> b!939044 (= lt!424175 (getCurrentListMap!3245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!424180 () Unit!31633)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!109 (array!56461 array!56463 (_ BitVec 32) (_ BitVec 32) V!31999 V!31999 (_ BitVec 64) V!31999 (_ BitVec 32) Int) Unit!31633)

(assert (=> b!939044 (= lt!424180 (lemmaListMapApplyFromThenApplyFromZero!109 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!939045 () Bool)

(declare-fun res!631680 () Bool)

(assert (=> b!939045 (=> (not res!631680) (not e!527413))))

(assert (=> b!939045 (= res!631680 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19185))))

(declare-fun b!939046 () Bool)

(declare-fun Unit!31636 () Unit!31633)

(assert (=> b!939046 (= e!527410 Unit!31636)))

(declare-fun b!939047 () Bool)

(assert (=> b!939047 (= e!527409 (= (apply!855 lt!424175 k0!1099) v!791))))

(declare-fun b!939048 () Bool)

(assert (=> b!939048 (= e!527411 e!527408)))

(declare-fun res!631688 () Bool)

(assert (=> b!939048 (=> (not res!631688) (not e!527408))))

(assert (=> b!939048 (= res!631688 (and (= lt!424178 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!939048 (= lt!424178 (apply!855 lt!424181 k0!1099))))

(declare-fun res!631681 () Bool)

(assert (=> start!79852 (=> (not res!631681) (not e!527413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79852 (= res!631681 (validMask!0 mask!1881))))

(assert (=> start!79852 e!527413))

(assert (=> start!79852 true))

(assert (=> start!79852 tp_is_empty!20275))

(declare-fun array_inv!21198 (array!56463) Bool)

(assert (=> start!79852 (and (array_inv!21198 _values!1231) e!527417)))

(assert (=> start!79852 tp!61765))

(declare-fun array_inv!21199 (array!56461) Bool)

(assert (=> start!79852 (array_inv!21199 _keys!1487)))

(declare-fun b!939033 () Bool)

(declare-fun res!631678 () Bool)

(assert (=> b!939033 (=> (not res!631678) (not e!527413))))

(assert (=> b!939033 (= res!631678 (and (= (size!27631 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27630 _keys!1487) (size!27631 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!79852 res!631681) b!939033))

(assert (= (and b!939033 res!631678) b!939034))

(assert (= (and b!939034 res!631687) b!939045))

(assert (= (and b!939045 res!631680) b!939031))

(assert (= (and b!939031 res!631686) b!939029))

(assert (= (and b!939029 res!631684) b!939048))

(assert (= (and b!939048 res!631688) b!939037))

(assert (= (and b!939037 c!97919) b!939032))

(assert (= (and b!939037 (not c!97919)) b!939046))

(assert (= (and b!939032 c!97918) b!939039))

(assert (= (and b!939032 (not c!97918)) b!939030))

(assert (= (and b!939039 c!97917) b!939043))

(assert (= (and b!939039 (not c!97917)) b!939036))

(assert (= (and b!939037 res!631685) b!939035))

(assert (= (and b!939035 res!631679) b!939042))

(assert (= (and b!939042 res!631682) b!939044))

(assert (= (and b!939044 res!631683) b!939047))

(assert (= (and b!939038 condMapEmpty!32192) mapIsEmpty!32192))

(assert (= (and b!939038 (not condMapEmpty!32192)) mapNonEmpty!32192))

(get-info :version)

(assert (= (and mapNonEmpty!32192 ((_ is ValueCellFull!9656) mapValue!32192)) b!939040))

(assert (= (and b!939038 ((_ is ValueCellFull!9656) mapDefault!32192)) b!939041))

(assert (= start!79852 b!939038))

(declare-fun b_lambda!14255 () Bool)

(assert (=> (not b_lambda!14255) (not b!939039)))

(declare-fun t!27488 () Bool)

(declare-fun tb!6153 () Bool)

(assert (=> (and start!79852 (= defaultEntry!1235 defaultEntry!1235) t!27488) tb!6153))

(declare-fun result!12151 () Bool)

(assert (=> tb!6153 (= result!12151 tp_is_empty!20275)))

(assert (=> b!939039 t!27488))

(declare-fun b_and!29149 () Bool)

(assert (= b_and!29147 (and (=> t!27488 result!12151) b_and!29149)))

(declare-fun m!874335 () Bool)

(assert (=> b!939047 m!874335))

(declare-fun m!874337 () Bool)

(assert (=> b!939042 m!874337))

(declare-fun m!874339 () Bool)

(assert (=> b!939045 m!874339))

(declare-fun m!874341 () Bool)

(assert (=> b!939029 m!874341))

(declare-fun m!874343 () Bool)

(assert (=> b!939029 m!874343))

(declare-fun m!874345 () Bool)

(assert (=> b!939034 m!874345))

(declare-fun m!874347 () Bool)

(assert (=> b!939032 m!874347))

(declare-fun m!874349 () Bool)

(assert (=> b!939032 m!874349))

(declare-fun m!874351 () Bool)

(assert (=> b!939035 m!874351))

(declare-fun m!874353 () Bool)

(assert (=> b!939035 m!874353))

(assert (=> b!939044 m!874335))

(declare-fun m!874355 () Bool)

(assert (=> b!939044 m!874355))

(declare-fun m!874357 () Bool)

(assert (=> b!939044 m!874357))

(declare-fun m!874359 () Bool)

(assert (=> b!939044 m!874359))

(declare-fun m!874361 () Bool)

(assert (=> b!939037 m!874361))

(declare-fun m!874363 () Bool)

(assert (=> mapNonEmpty!32192 m!874363))

(declare-fun m!874365 () Bool)

(assert (=> b!939039 m!874365))

(declare-fun m!874367 () Bool)

(assert (=> b!939039 m!874367))

(declare-fun m!874369 () Bool)

(assert (=> b!939039 m!874369))

(declare-fun m!874371 () Bool)

(assert (=> b!939039 m!874371))

(declare-fun m!874373 () Bool)

(assert (=> b!939039 m!874373))

(declare-fun m!874375 () Bool)

(assert (=> b!939039 m!874375))

(declare-fun m!874377 () Bool)

(assert (=> b!939039 m!874377))

(declare-fun m!874379 () Bool)

(assert (=> b!939039 m!874379))

(declare-fun m!874381 () Bool)

(assert (=> b!939039 m!874381))

(declare-fun m!874383 () Bool)

(assert (=> b!939039 m!874383))

(assert (=> b!939039 m!874367))

(assert (=> b!939039 m!874369))

(declare-fun m!874385 () Bool)

(assert (=> b!939039 m!874385))

(declare-fun m!874387 () Bool)

(assert (=> b!939039 m!874387))

(declare-fun m!874389 () Bool)

(assert (=> b!939039 m!874389))

(assert (=> b!939039 m!874353))

(assert (=> b!939039 m!874387))

(declare-fun m!874391 () Bool)

(assert (=> b!939039 m!874391))

(declare-fun m!874393 () Bool)

(assert (=> b!939039 m!874393))

(declare-fun m!874395 () Bool)

(assert (=> b!939048 m!874395))

(declare-fun m!874397 () Bool)

(assert (=> b!939043 m!874397))

(declare-fun m!874399 () Bool)

(assert (=> start!79852 m!874399))

(declare-fun m!874401 () Bool)

(assert (=> start!79852 m!874401))

(declare-fun m!874403 () Bool)

(assert (=> start!79852 m!874403))

(check-sat (not b!939039) (not b!939043) (not b!939044) (not b!939048) (not b!939035) (not b_lambda!14255) (not b!939042) (not start!79852) (not b!939045) (not b!939037) (not b!939032) (not mapNonEmpty!32192) (not b!939029) tp_is_empty!20275 (not b!939047) (not b_next!17767) (not b!939034) b_and!29149)
(check-sat b_and!29149 (not b_next!17767))
