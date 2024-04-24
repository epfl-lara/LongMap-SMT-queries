; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79808 () Bool)

(assert start!79808)

(declare-fun b_free!17689 () Bool)

(declare-fun b_next!17689 () Bool)

(assert (=> start!79808 (= b_free!17689 (not b_next!17689))))

(declare-fun tp!61523 () Bool)

(declare-fun b_and!28979 () Bool)

(assert (=> start!79808 (= tp!61523 b_and!28979)))

(declare-fun b!937098 () Bool)

(declare-fun e!526259 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!422424 () (_ BitVec 64))

(assert (=> b!937098 (= e!526259 (not (not (= k0!1099 lt!422424))))))

(assert (=> b!937098 (not (= lt!422424 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((Unit!31560 0))(
  ( (Unit!31561) )
))
(declare-fun lt!422420 () Unit!31560)

(declare-datatypes ((array!56387 0))(
  ( (array!56388 (arr!27129 (Array (_ BitVec 32) (_ BitVec 64))) (size!27589 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56387)

(declare-datatypes ((List!19090 0))(
  ( (Nil!19087) (Cons!19086 (h!20238 (_ BitVec 64)) (t!27315 List!19090)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56387 (_ BitVec 64) (_ BitVec 32) List!19090) Unit!31560)

(assert (=> b!937098 (= lt!422420 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19087))))

(declare-fun e!526257 () Bool)

(assert (=> b!937098 e!526257))

(declare-fun c!97647 () Bool)

(assert (=> b!937098 (= c!97647 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!422417 () Unit!31560)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31895 0))(
  ( (V!31896 (val!10149 Int)) )
))
(declare-datatypes ((ValueCell!9617 0))(
  ( (ValueCellFull!9617 (v!12671 V!31895)) (EmptyCell!9617) )
))
(declare-datatypes ((array!56389 0))(
  ( (array!56390 (arr!27130 (Array (_ BitVec 32) ValueCell!9617)) (size!27590 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56389)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31895)

(declare-fun minValue!1173 () V!31895)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!289 (array!56387 array!56389 (_ BitVec 32) (_ BitVec 32) V!31895 V!31895 (_ BitVec 64) (_ BitVec 32) Int) Unit!31560)

(assert (=> b!937098 (= lt!422417 (lemmaListMapContainsThenArrayContainsFrom!289 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56387 (_ BitVec 32) List!19090) Bool)

(assert (=> b!937098 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19087)))

(declare-fun lt!422421 () Unit!31560)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56387 (_ BitVec 32) (_ BitVec 32)) Unit!31560)

(assert (=> b!937098 (= lt!422421 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13310 0))(
  ( (tuple2!13311 (_1!6666 (_ BitVec 64)) (_2!6666 V!31895)) )
))
(declare-datatypes ((List!19091 0))(
  ( (Nil!19088) (Cons!19087 (h!20239 tuple2!13310) (t!27316 List!19091)) )
))
(declare-datatypes ((ListLongMap!12009 0))(
  ( (ListLongMap!12010 (toList!6020 List!19091)) )
))
(declare-fun lt!422423 () ListLongMap!12009)

(declare-fun lt!422419 () tuple2!13310)

(declare-fun contains!5092 (ListLongMap!12009 (_ BitVec 64)) Bool)

(declare-fun +!2835 (ListLongMap!12009 tuple2!13310) ListLongMap!12009)

(assert (=> b!937098 (contains!5092 (+!2835 lt!422423 lt!422419) k0!1099)))

(declare-fun lt!422422 () Unit!31560)

(declare-fun lt!422418 () V!31895)

(declare-fun addStillContains!538 (ListLongMap!12009 (_ BitVec 64) V!31895 (_ BitVec 64)) Unit!31560)

(assert (=> b!937098 (= lt!422422 (addStillContains!538 lt!422423 lt!422424 lt!422418 k0!1099))))

(declare-fun getCurrentListMap!3257 (array!56387 array!56389 (_ BitVec 32) (_ BitVec 32) V!31895 V!31895 (_ BitVec 32) Int) ListLongMap!12009)

(assert (=> b!937098 (= (getCurrentListMap!3257 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2835 (getCurrentListMap!3257 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422419))))

(assert (=> b!937098 (= lt!422419 (tuple2!13311 lt!422424 lt!422418))))

(declare-fun get!14315 (ValueCell!9617 V!31895) V!31895)

(declare-fun dynLambda!1632 (Int (_ BitVec 64)) V!31895)

(assert (=> b!937098 (= lt!422418 (get!14315 (select (arr!27130 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1632 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422416 () Unit!31560)

(declare-fun lemmaListMapRecursiveValidKeyArray!215 (array!56387 array!56389 (_ BitVec 32) (_ BitVec 32) V!31895 V!31895 (_ BitVec 32) Int) Unit!31560)

(assert (=> b!937098 (= lt!422416 (lemmaListMapRecursiveValidKeyArray!215 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!937099 () Bool)

(declare-fun e!526253 () Bool)

(declare-fun e!526260 () Bool)

(declare-fun mapRes!32067 () Bool)

(assert (=> b!937099 (= e!526253 (and e!526260 mapRes!32067))))

(declare-fun condMapEmpty!32067 () Bool)

(declare-fun mapDefault!32067 () ValueCell!9617)

(assert (=> b!937099 (= condMapEmpty!32067 (= (arr!27130 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9617)) mapDefault!32067)))))

(declare-fun b!937100 () Bool)

(declare-fun res!630758 () Bool)

(declare-fun e!526258 () Bool)

(assert (=> b!937100 (=> (not res!630758) (not e!526258))))

(assert (=> b!937100 (= res!630758 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19087))))

(declare-fun res!630755 () Bool)

(assert (=> start!79808 (=> (not res!630755) (not e!526258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79808 (= res!630755 (validMask!0 mask!1881))))

(assert (=> start!79808 e!526258))

(assert (=> start!79808 true))

(declare-fun tp_is_empty!20197 () Bool)

(assert (=> start!79808 tp_is_empty!20197))

(declare-fun array_inv!21188 (array!56389) Bool)

(assert (=> start!79808 (and (array_inv!21188 _values!1231) e!526253)))

(assert (=> start!79808 tp!61523))

(declare-fun array_inv!21189 (array!56387) Bool)

(assert (=> start!79808 (array_inv!21189 _keys!1487)))

(declare-fun b!937101 () Bool)

(declare-fun res!630753 () Bool)

(declare-fun e!526254 () Bool)

(assert (=> b!937101 (=> (not res!630753) (not e!526254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!937101 (= res!630753 (validKeyInArray!0 k0!1099))))

(declare-fun b!937102 () Bool)

(declare-fun res!630754 () Bool)

(assert (=> b!937102 (=> (not res!630754) (not e!526258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56387 (_ BitVec 32)) Bool)

(assert (=> b!937102 (= res!630754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!937103 () Bool)

(assert (=> b!937103 (= e!526257 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!937104 () Bool)

(declare-fun res!630756 () Bool)

(assert (=> b!937104 (=> (not res!630756) (not e!526254))))

(assert (=> b!937104 (= res!630756 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!32067 () Bool)

(declare-fun tp!61524 () Bool)

(declare-fun e!526256 () Bool)

(assert (=> mapNonEmpty!32067 (= mapRes!32067 (and tp!61524 e!526256))))

(declare-fun mapRest!32067 () (Array (_ BitVec 32) ValueCell!9617))

(declare-fun mapKey!32067 () (_ BitVec 32))

(declare-fun mapValue!32067 () ValueCell!9617)

(assert (=> mapNonEmpty!32067 (= (arr!27130 _values!1231) (store mapRest!32067 mapKey!32067 mapValue!32067))))

(declare-fun b!937105 () Bool)

(declare-fun res!630759 () Bool)

(assert (=> b!937105 (=> (not res!630759) (not e!526254))))

(declare-fun v!791 () V!31895)

(declare-fun apply!840 (ListLongMap!12009 (_ BitVec 64)) V!31895)

(assert (=> b!937105 (= res!630759 (= (apply!840 lt!422423 k0!1099) v!791))))

(declare-fun b!937106 () Bool)

(assert (=> b!937106 (= e!526256 tp_is_empty!20197)))

(declare-fun b!937107 () Bool)

(declare-fun res!630752 () Bool)

(assert (=> b!937107 (=> (not res!630752) (not e!526258))))

(assert (=> b!937107 (= res!630752 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27589 _keys!1487))))))

(declare-fun mapIsEmpty!32067 () Bool)

(assert (=> mapIsEmpty!32067 mapRes!32067))

(declare-fun b!937108 () Bool)

(assert (=> b!937108 (= e!526254 e!526259)))

(declare-fun res!630751 () Bool)

(assert (=> b!937108 (=> (not res!630751) (not e!526259))))

(assert (=> b!937108 (= res!630751 (validKeyInArray!0 lt!422424))))

(assert (=> b!937108 (= lt!422424 (select (arr!27129 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!937109 () Bool)

(assert (=> b!937109 (= e!526260 tp_is_empty!20197)))

(declare-fun b!937110 () Bool)

(declare-fun res!630750 () Bool)

(assert (=> b!937110 (=> (not res!630750) (not e!526258))))

(assert (=> b!937110 (= res!630750 (and (= (size!27590 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27589 _keys!1487) (size!27590 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!937111 () Bool)

(declare-fun arrayContainsKey!0 (array!56387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!937111 (= e!526257 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!937112 () Bool)

(assert (=> b!937112 (= e!526258 e!526254)))

(declare-fun res!630757 () Bool)

(assert (=> b!937112 (=> (not res!630757) (not e!526254))))

(assert (=> b!937112 (= res!630757 (contains!5092 lt!422423 k0!1099))))

(assert (=> b!937112 (= lt!422423 (getCurrentListMap!3257 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79808 res!630755) b!937110))

(assert (= (and b!937110 res!630750) b!937102))

(assert (= (and b!937102 res!630754) b!937100))

(assert (= (and b!937100 res!630758) b!937107))

(assert (= (and b!937107 res!630752) b!937112))

(assert (= (and b!937112 res!630757) b!937105))

(assert (= (and b!937105 res!630759) b!937104))

(assert (= (and b!937104 res!630756) b!937101))

(assert (= (and b!937101 res!630753) b!937108))

(assert (= (and b!937108 res!630751) b!937098))

(assert (= (and b!937098 c!97647) b!937111))

(assert (= (and b!937098 (not c!97647)) b!937103))

(assert (= (and b!937099 condMapEmpty!32067) mapIsEmpty!32067))

(assert (= (and b!937099 (not condMapEmpty!32067)) mapNonEmpty!32067))

(get-info :version)

(assert (= (and mapNonEmpty!32067 ((_ is ValueCellFull!9617) mapValue!32067)) b!937106))

(assert (= (and b!937099 ((_ is ValueCellFull!9617) mapDefault!32067)) b!937109))

(assert (= start!79808 b!937099))

(declare-fun b_lambda!14109 () Bool)

(assert (=> (not b_lambda!14109) (not b!937098)))

(declare-fun t!27314 () Bool)

(declare-fun tb!6075 () Bool)

(assert (=> (and start!79808 (= defaultEntry!1235 defaultEntry!1235) t!27314) tb!6075))

(declare-fun result!11991 () Bool)

(assert (=> tb!6075 (= result!11991 tp_is_empty!20197)))

(assert (=> b!937098 t!27314))

(declare-fun b_and!28981 () Bool)

(assert (= b_and!28979 (and (=> t!27314 result!11991) b_and!28981)))

(declare-fun m!872057 () Bool)

(assert (=> b!937101 m!872057))

(declare-fun m!872059 () Bool)

(assert (=> mapNonEmpty!32067 m!872059))

(declare-fun m!872061 () Bool)

(assert (=> b!937105 m!872061))

(declare-fun m!872063 () Bool)

(assert (=> b!937112 m!872063))

(declare-fun m!872065 () Bool)

(assert (=> b!937112 m!872065))

(declare-fun m!872067 () Bool)

(assert (=> b!937111 m!872067))

(declare-fun m!872069 () Bool)

(assert (=> b!937108 m!872069))

(declare-fun m!872071 () Bool)

(assert (=> b!937108 m!872071))

(declare-fun m!872073 () Bool)

(assert (=> start!79808 m!872073))

(declare-fun m!872075 () Bool)

(assert (=> start!79808 m!872075))

(declare-fun m!872077 () Bool)

(assert (=> start!79808 m!872077))

(declare-fun m!872079 () Bool)

(assert (=> b!937100 m!872079))

(declare-fun m!872081 () Bool)

(assert (=> b!937098 m!872081))

(declare-fun m!872083 () Bool)

(assert (=> b!937098 m!872083))

(declare-fun m!872085 () Bool)

(assert (=> b!937098 m!872085))

(declare-fun m!872087 () Bool)

(assert (=> b!937098 m!872087))

(declare-fun m!872089 () Bool)

(assert (=> b!937098 m!872089))

(declare-fun m!872091 () Bool)

(assert (=> b!937098 m!872091))

(assert (=> b!937098 m!872081))

(assert (=> b!937098 m!872089))

(assert (=> b!937098 m!872091))

(declare-fun m!872093 () Bool)

(assert (=> b!937098 m!872093))

(declare-fun m!872095 () Bool)

(assert (=> b!937098 m!872095))

(declare-fun m!872097 () Bool)

(assert (=> b!937098 m!872097))

(declare-fun m!872099 () Bool)

(assert (=> b!937098 m!872099))

(declare-fun m!872101 () Bool)

(assert (=> b!937098 m!872101))

(declare-fun m!872103 () Bool)

(assert (=> b!937098 m!872103))

(declare-fun m!872105 () Bool)

(assert (=> b!937098 m!872105))

(assert (=> b!937098 m!872101))

(declare-fun m!872107 () Bool)

(assert (=> b!937098 m!872107))

(declare-fun m!872109 () Bool)

(assert (=> b!937102 m!872109))

(check-sat tp_is_empty!20197 (not b!937105) (not b!937100) (not b_next!17689) (not b!937101) (not b!937102) (not mapNonEmpty!32067) (not b!937098) b_and!28981 (not b!937108) (not b!937112) (not b_lambda!14109) (not start!79808) (not b!937111))
(check-sat b_and!28981 (not b_next!17689))
