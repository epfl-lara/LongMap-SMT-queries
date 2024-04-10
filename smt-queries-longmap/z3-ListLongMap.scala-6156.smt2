; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79046 () Bool)

(assert start!79046)

(declare-fun b_free!17259 () Bool)

(declare-fun b_next!17259 () Bool)

(assert (=> start!79046 (= b_free!17259 (not b_next!17259))))

(declare-fun tp!60218 () Bool)

(declare-fun b_and!28255 () Bool)

(assert (=> start!79046 (= tp!60218 b_and!28255)))

(declare-fun mapNonEmpty!31407 () Bool)

(declare-fun mapRes!31407 () Bool)

(declare-fun tp!60217 () Bool)

(declare-fun e!520039 () Bool)

(assert (=> mapNonEmpty!31407 (= mapRes!31407 (and tp!60217 e!520039))))

(declare-datatypes ((V!31321 0))(
  ( (V!31322 (val!9934 Int)) )
))
(declare-datatypes ((ValueCell!9402 0))(
  ( (ValueCellFull!9402 (v!12452 V!31321)) (EmptyCell!9402) )
))
(declare-fun mapRest!31407 () (Array (_ BitVec 32) ValueCell!9402))

(declare-fun mapKey!31407 () (_ BitVec 32))

(declare-datatypes ((array!55500 0))(
  ( (array!55501 (arr!26695 (Array (_ BitVec 32) ValueCell!9402)) (size!27154 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55500)

(declare-fun mapValue!31407 () ValueCell!9402)

(assert (=> mapNonEmpty!31407 (= (arr!26695 _values!1231) (store mapRest!31407 mapKey!31407 mapValue!31407))))

(declare-fun b!926445 () Bool)

(declare-datatypes ((tuple2!12962 0))(
  ( (tuple2!12963 (_1!6492 (_ BitVec 64)) (_2!6492 V!31321)) )
))
(declare-datatypes ((List!18763 0))(
  ( (Nil!18760) (Cons!18759 (h!19905 tuple2!12962) (t!26752 List!18763)) )
))
(declare-datatypes ((ListLongMap!11659 0))(
  ( (ListLongMap!11660 (toList!5845 List!18763)) )
))
(declare-fun lt!417247 () ListLongMap!11659)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!417253 () V!31321)

(declare-fun apply!675 (ListLongMap!11659 (_ BitVec 64)) V!31321)

(assert (=> b!926445 (= (apply!675 lt!417247 k0!1099) lt!417253)))

(declare-datatypes ((Unit!31321 0))(
  ( (Unit!31322) )
))
(declare-fun lt!417255 () Unit!31321)

(declare-fun lt!417243 () ListLongMap!11659)

(declare-fun lt!417251 () (_ BitVec 64))

(declare-fun lt!417241 () V!31321)

(declare-fun addApplyDifferent!394 (ListLongMap!11659 (_ BitVec 64) V!31321 (_ BitVec 64)) Unit!31321)

(assert (=> b!926445 (= lt!417255 (addApplyDifferent!394 lt!417243 lt!417251 lt!417241 k0!1099))))

(assert (=> b!926445 (not (= lt!417251 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417244 () Unit!31321)

(declare-datatypes ((array!55502 0))(
  ( (array!55503 (arr!26696 (Array (_ BitVec 32) (_ BitVec 64))) (size!27155 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55502)

(declare-datatypes ((List!18764 0))(
  ( (Nil!18761) (Cons!18760 (h!19906 (_ BitVec 64)) (t!26753 List!18764)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55502 (_ BitVec 64) (_ BitVec 32) List!18764) Unit!31321)

(assert (=> b!926445 (= lt!417244 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18761))))

(declare-fun e!520042 () Bool)

(assert (=> b!926445 e!520042))

(declare-fun c!96725 () Bool)

(assert (=> b!926445 (= c!96725 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!417242 () Unit!31321)

(declare-fun zeroValue!1173 () V!31321)

(declare-fun minValue!1173 () V!31321)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!245 (array!55502 array!55500 (_ BitVec 32) (_ BitVec 32) V!31321 V!31321 (_ BitVec 64) (_ BitVec 32) Int) Unit!31321)

(assert (=> b!926445 (= lt!417242 (lemmaListMapContainsThenArrayContainsFrom!245 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55502 (_ BitVec 32) List!18764) Bool)

(assert (=> b!926445 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18761)))

(declare-fun lt!417252 () Unit!31321)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55502 (_ BitVec 32) (_ BitVec 32)) Unit!31321)

(assert (=> b!926445 (= lt!417252 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4904 (ListLongMap!11659 (_ BitVec 64)) Bool)

(assert (=> b!926445 (contains!4904 lt!417247 k0!1099)))

(declare-fun lt!417246 () tuple2!12962)

(declare-fun +!2738 (ListLongMap!11659 tuple2!12962) ListLongMap!11659)

(assert (=> b!926445 (= lt!417247 (+!2738 lt!417243 lt!417246))))

(declare-fun lt!417248 () Unit!31321)

(declare-fun addStillContains!462 (ListLongMap!11659 (_ BitVec 64) V!31321 (_ BitVec 64)) Unit!31321)

(assert (=> b!926445 (= lt!417248 (addStillContains!462 lt!417243 lt!417251 lt!417241 k0!1099))))

(declare-fun getCurrentListMap!3095 (array!55502 array!55500 (_ BitVec 32) (_ BitVec 32) V!31321 V!31321 (_ BitVec 32) Int) ListLongMap!11659)

(assert (=> b!926445 (= (getCurrentListMap!3095 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2738 (getCurrentListMap!3095 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417246))))

(assert (=> b!926445 (= lt!417246 (tuple2!12963 lt!417251 lt!417241))))

(declare-fun get!14047 (ValueCell!9402 V!31321) V!31321)

(declare-fun dynLambda!1527 (Int (_ BitVec 64)) V!31321)

(assert (=> b!926445 (= lt!417241 (get!14047 (select (arr!26695 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1527 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417245 () Unit!31321)

(declare-fun lemmaListMapRecursiveValidKeyArray!128 (array!55502 array!55500 (_ BitVec 32) (_ BitVec 32) V!31321 V!31321 (_ BitVec 32) Int) Unit!31321)

(assert (=> b!926445 (= lt!417245 (lemmaListMapRecursiveValidKeyArray!128 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520040 () Unit!31321)

(assert (=> b!926445 (= e!520040 lt!417255)))

(declare-fun b!926447 () Bool)

(assert (=> b!926447 (= e!520042 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926448 () Bool)

(declare-fun e!520044 () Unit!31321)

(assert (=> b!926448 (= e!520044 e!520040)))

(assert (=> b!926448 (= lt!417251 (select (arr!26696 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96724 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926448 (= c!96724 (validKeyInArray!0 lt!417251))))

(declare-fun b!926449 () Bool)

(declare-fun e!520033 () Bool)

(declare-fun tp_is_empty!19767 () Bool)

(assert (=> b!926449 (= e!520033 tp_is_empty!19767)))

(declare-fun b!926450 () Bool)

(declare-fun e!520041 () Bool)

(assert (=> b!926450 (= e!520041 (not true))))

(declare-fun e!520035 () Bool)

(assert (=> b!926450 e!520035))

(declare-fun res!624165 () Bool)

(assert (=> b!926450 (=> (not res!624165) (not e!520035))))

(declare-fun lt!417256 () ListLongMap!11659)

(assert (=> b!926450 (= res!624165 (contains!4904 lt!417256 k0!1099))))

(assert (=> b!926450 (= lt!417256 (getCurrentListMap!3095 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31321)

(declare-fun lt!417254 () Unit!31321)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!80 (array!55502 array!55500 (_ BitVec 32) (_ BitVec 32) V!31321 V!31321 (_ BitVec 64) V!31321 (_ BitVec 32) Int) Unit!31321)

(assert (=> b!926450 (= lt!417254 (lemmaListMapApplyFromThenApplyFromZero!80 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926451 () Bool)

(declare-fun e!520034 () Bool)

(declare-fun e!520036 () Bool)

(assert (=> b!926451 (= e!520034 e!520036)))

(declare-fun res!624170 () Bool)

(assert (=> b!926451 (=> (not res!624170) (not e!520036))))

(assert (=> b!926451 (= res!624170 (contains!4904 lt!417243 k0!1099))))

(assert (=> b!926451 (= lt!417243 (getCurrentListMap!3095 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926452 () Bool)

(declare-fun res!624166 () Bool)

(assert (=> b!926452 (=> (not res!624166) (not e!520034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55502 (_ BitVec 32)) Bool)

(assert (=> b!926452 (= res!624166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926453 () Bool)

(declare-fun res!624167 () Bool)

(assert (=> b!926453 (=> (not res!624167) (not e!520041))))

(declare-fun lt!417249 () ListLongMap!11659)

(assert (=> b!926453 (= res!624167 (= (apply!675 lt!417249 k0!1099) v!791))))

(declare-fun b!926454 () Bool)

(declare-fun e!520038 () Bool)

(declare-fun e!520043 () Bool)

(assert (=> b!926454 (= e!520038 e!520043)))

(declare-fun res!624164 () Bool)

(assert (=> b!926454 (=> (not res!624164) (not e!520043))))

(assert (=> b!926454 (= res!624164 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27155 _keys!1487)))))

(declare-fun lt!417250 () Unit!31321)

(assert (=> b!926454 (= lt!417250 e!520044)))

(declare-fun c!96726 () Bool)

(assert (=> b!926454 (= c!96726 (validKeyInArray!0 k0!1099))))

(declare-fun b!926455 () Bool)

(declare-fun e!520037 () Bool)

(assert (=> b!926455 (= e!520037 (and e!520033 mapRes!31407))))

(declare-fun condMapEmpty!31407 () Bool)

(declare-fun mapDefault!31407 () ValueCell!9402)

(assert (=> b!926455 (= condMapEmpty!31407 (= (arr!26695 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9402)) mapDefault!31407)))))

(declare-fun b!926456 () Bool)

(assert (=> b!926456 (= e!520035 (= (apply!675 lt!417256 k0!1099) v!791))))

(declare-fun b!926457 () Bool)

(assert (=> b!926457 (= e!520036 e!520038)))

(declare-fun res!624168 () Bool)

(assert (=> b!926457 (=> (not res!624168) (not e!520038))))

(assert (=> b!926457 (= res!624168 (and (= lt!417253 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926457 (= lt!417253 (apply!675 lt!417243 k0!1099))))

(declare-fun res!624171 () Bool)

(assert (=> start!79046 (=> (not res!624171) (not e!520034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79046 (= res!624171 (validMask!0 mask!1881))))

(assert (=> start!79046 e!520034))

(assert (=> start!79046 true))

(assert (=> start!79046 tp_is_empty!19767))

(declare-fun array_inv!20790 (array!55500) Bool)

(assert (=> start!79046 (and (array_inv!20790 _values!1231) e!520037)))

(assert (=> start!79046 tp!60218))

(declare-fun array_inv!20791 (array!55502) Bool)

(assert (=> start!79046 (array_inv!20791 _keys!1487)))

(declare-fun b!926446 () Bool)

(assert (=> b!926446 (= e!520043 e!520041)))

(declare-fun res!624162 () Bool)

(assert (=> b!926446 (=> (not res!624162) (not e!520041))))

(assert (=> b!926446 (= res!624162 (contains!4904 lt!417249 k0!1099))))

(assert (=> b!926446 (= lt!417249 (getCurrentListMap!3095 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926458 () Bool)

(declare-fun res!624172 () Bool)

(assert (=> b!926458 (=> (not res!624172) (not e!520034))))

(assert (=> b!926458 (= res!624172 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18761))))

(declare-fun b!926459 () Bool)

(assert (=> b!926459 (= e!520039 tp_is_empty!19767)))

(declare-fun b!926460 () Bool)

(declare-fun res!624163 () Bool)

(assert (=> b!926460 (=> (not res!624163) (not e!520034))))

(assert (=> b!926460 (= res!624163 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27155 _keys!1487))))))

(declare-fun b!926461 () Bool)

(declare-fun res!624169 () Bool)

(assert (=> b!926461 (=> (not res!624169) (not e!520034))))

(assert (=> b!926461 (= res!624169 (and (= (size!27154 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27155 _keys!1487) (size!27154 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926462 () Bool)

(declare-fun Unit!31323 () Unit!31321)

(assert (=> b!926462 (= e!520040 Unit!31323)))

(declare-fun b!926463 () Bool)

(declare-fun Unit!31324 () Unit!31321)

(assert (=> b!926463 (= e!520044 Unit!31324)))

(declare-fun b!926464 () Bool)

(declare-fun arrayContainsKey!0 (array!55502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926464 (= e!520042 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapIsEmpty!31407 () Bool)

(assert (=> mapIsEmpty!31407 mapRes!31407))

(assert (= (and start!79046 res!624171) b!926461))

(assert (= (and b!926461 res!624169) b!926452))

(assert (= (and b!926452 res!624166) b!926458))

(assert (= (and b!926458 res!624172) b!926460))

(assert (= (and b!926460 res!624163) b!926451))

(assert (= (and b!926451 res!624170) b!926457))

(assert (= (and b!926457 res!624168) b!926454))

(assert (= (and b!926454 c!96726) b!926448))

(assert (= (and b!926454 (not c!96726)) b!926463))

(assert (= (and b!926448 c!96724) b!926445))

(assert (= (and b!926448 (not c!96724)) b!926462))

(assert (= (and b!926445 c!96725) b!926464))

(assert (= (and b!926445 (not c!96725)) b!926447))

(assert (= (and b!926454 res!624164) b!926446))

(assert (= (and b!926446 res!624162) b!926453))

(assert (= (and b!926453 res!624167) b!926450))

(assert (= (and b!926450 res!624165) b!926456))

(assert (= (and b!926455 condMapEmpty!31407) mapIsEmpty!31407))

(assert (= (and b!926455 (not condMapEmpty!31407)) mapNonEmpty!31407))

(get-info :version)

(assert (= (and mapNonEmpty!31407 ((_ is ValueCellFull!9402) mapValue!31407)) b!926459))

(assert (= (and b!926455 ((_ is ValueCellFull!9402) mapDefault!31407)) b!926449))

(assert (= start!79046 b!926455))

(declare-fun b_lambda!13761 () Bool)

(assert (=> (not b_lambda!13761) (not b!926445)))

(declare-fun t!26751 () Bool)

(declare-fun tb!5839 () Bool)

(assert (=> (and start!79046 (= defaultEntry!1235 defaultEntry!1235) t!26751) tb!5839))

(declare-fun result!11501 () Bool)

(assert (=> tb!5839 (= result!11501 tp_is_empty!19767)))

(assert (=> b!926445 t!26751))

(declare-fun b_and!28257 () Bool)

(assert (= b_and!28255 (and (=> t!26751 result!11501) b_and!28257)))

(declare-fun m!860995 () Bool)

(assert (=> b!926450 m!860995))

(declare-fun m!860997 () Bool)

(assert (=> b!926450 m!860997))

(declare-fun m!860999 () Bool)

(assert (=> b!926450 m!860999))

(declare-fun m!861001 () Bool)

(assert (=> b!926464 m!861001))

(declare-fun m!861003 () Bool)

(assert (=> b!926452 m!861003))

(declare-fun m!861005 () Bool)

(assert (=> b!926446 m!861005))

(declare-fun m!861007 () Bool)

(assert (=> b!926446 m!861007))

(declare-fun m!861009 () Bool)

(assert (=> b!926448 m!861009))

(declare-fun m!861011 () Bool)

(assert (=> b!926448 m!861011))

(declare-fun m!861013 () Bool)

(assert (=> start!79046 m!861013))

(declare-fun m!861015 () Bool)

(assert (=> start!79046 m!861015))

(declare-fun m!861017 () Bool)

(assert (=> start!79046 m!861017))

(declare-fun m!861019 () Bool)

(assert (=> b!926458 m!861019))

(declare-fun m!861021 () Bool)

(assert (=> b!926454 m!861021))

(declare-fun m!861023 () Bool)

(assert (=> b!926445 m!861023))

(declare-fun m!861025 () Bool)

(assert (=> b!926445 m!861025))

(declare-fun m!861027 () Bool)

(assert (=> b!926445 m!861027))

(declare-fun m!861029 () Bool)

(assert (=> b!926445 m!861029))

(declare-fun m!861031 () Bool)

(assert (=> b!926445 m!861031))

(declare-fun m!861033 () Bool)

(assert (=> b!926445 m!861033))

(assert (=> b!926445 m!861027))

(declare-fun m!861035 () Bool)

(assert (=> b!926445 m!861035))

(assert (=> b!926445 m!861007))

(declare-fun m!861037 () Bool)

(assert (=> b!926445 m!861037))

(declare-fun m!861039 () Bool)

(assert (=> b!926445 m!861039))

(declare-fun m!861041 () Bool)

(assert (=> b!926445 m!861041))

(declare-fun m!861043 () Bool)

(assert (=> b!926445 m!861043))

(assert (=> b!926445 m!861033))

(declare-fun m!861045 () Bool)

(assert (=> b!926445 m!861045))

(assert (=> b!926445 m!861029))

(declare-fun m!861047 () Bool)

(assert (=> b!926445 m!861047))

(declare-fun m!861049 () Bool)

(assert (=> b!926445 m!861049))

(declare-fun m!861051 () Bool)

(assert (=> b!926445 m!861051))

(declare-fun m!861053 () Bool)

(assert (=> mapNonEmpty!31407 m!861053))

(declare-fun m!861055 () Bool)

(assert (=> b!926456 m!861055))

(declare-fun m!861057 () Bool)

(assert (=> b!926457 m!861057))

(declare-fun m!861059 () Bool)

(assert (=> b!926453 m!861059))

(declare-fun m!861061 () Bool)

(assert (=> b!926451 m!861061))

(declare-fun m!861063 () Bool)

(assert (=> b!926451 m!861063))

(check-sat (not b!926456) (not b!926446) tp_is_empty!19767 b_and!28257 (not b_lambda!13761) (not b!926445) (not b_next!17259) (not b!926458) (not b!926451) (not b!926464) (not b!926457) (not b!926448) (not b!926453) (not b!926450) (not start!79046) (not b!926454) (not b!926452) (not mapNonEmpty!31407))
(check-sat b_and!28257 (not b_next!17259))
