; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79642 () Bool)

(assert start!79642)

(declare-fun b_free!17629 () Bool)

(declare-fun b_next!17629 () Bool)

(assert (=> start!79642 (= b_free!17629 (not b_next!17629))))

(declare-fun tp!61335 () Bool)

(declare-fun b_and!28835 () Bool)

(assert (=> start!79642 (= tp!61335 b_and!28835)))

(declare-fun b!934992 () Bool)

(declare-fun res!629466 () Bool)

(declare-fun e!525089 () Bool)

(assert (=> b!934992 (=> (not res!629466) (not e!525089))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934992 (= res!629466 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!629470 () Bool)

(declare-fun e!525083 () Bool)

(assert (=> start!79642 (=> (not res!629470) (not e!525083))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79642 (= res!629470 (validMask!0 mask!1881))))

(assert (=> start!79642 e!525083))

(assert (=> start!79642 true))

(declare-fun tp_is_empty!20137 () Bool)

(assert (=> start!79642 tp_is_empty!20137))

(declare-datatypes ((V!31815 0))(
  ( (V!31816 (val!10119 Int)) )
))
(declare-datatypes ((ValueCell!9587 0))(
  ( (ValueCellFull!9587 (v!12636 V!31815)) (EmptyCell!9587) )
))
(declare-datatypes ((array!56267 0))(
  ( (array!56268 (arr!27072 (Array (_ BitVec 32) ValueCell!9587)) (size!27532 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56267)

(declare-fun e!525088 () Bool)

(declare-fun array_inv!21154 (array!56267) Bool)

(assert (=> start!79642 (and (array_inv!21154 _values!1231) e!525088)))

(assert (=> start!79642 tp!61335))

(declare-datatypes ((array!56269 0))(
  ( (array!56270 (arr!27073 (Array (_ BitVec 32) (_ BitVec 64))) (size!27533 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56269)

(declare-fun array_inv!21155 (array!56269) Bool)

(assert (=> start!79642 (array_inv!21155 _keys!1487)))

(declare-fun e!525086 () Bool)

(declare-fun b!934993 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!934993 (= e!525086 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapNonEmpty!31968 () Bool)

(declare-fun mapRes!31968 () Bool)

(declare-fun tp!61334 () Bool)

(declare-fun e!525084 () Bool)

(assert (=> mapNonEmpty!31968 (= mapRes!31968 (and tp!61334 e!525084))))

(declare-fun mapKey!31968 () (_ BitVec 32))

(declare-fun mapValue!31968 () ValueCell!9587)

(declare-fun mapRest!31968 () (Array (_ BitVec 32) ValueCell!9587))

(assert (=> mapNonEmpty!31968 (= (arr!27072 _values!1231) (store mapRest!31968 mapKey!31968 mapValue!31968))))

(declare-fun b!934994 () Bool)

(declare-fun res!629465 () Bool)

(assert (=> b!934994 (=> (not res!629465) (not e!525089))))

(declare-fun v!791 () V!31815)

(declare-datatypes ((tuple2!13260 0))(
  ( (tuple2!13261 (_1!6641 (_ BitVec 64)) (_2!6641 V!31815)) )
))
(declare-datatypes ((List!19043 0))(
  ( (Nil!19040) (Cons!19039 (h!20191 tuple2!13260) (t!27208 List!19043)) )
))
(declare-datatypes ((ListLongMap!11959 0))(
  ( (ListLongMap!11960 (toList!5995 List!19043)) )
))
(declare-fun lt!421167 () ListLongMap!11959)

(declare-fun apply!819 (ListLongMap!11959 (_ BitVec 64)) V!31815)

(assert (=> b!934994 (= res!629465 (= (apply!819 lt!421167 k0!1099) v!791))))

(declare-fun b!934995 () Bool)

(declare-fun res!629469 () Bool)

(assert (=> b!934995 (=> (not res!629469) (not e!525083))))

(assert (=> b!934995 (= res!629469 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27533 _keys!1487))))))

(declare-fun mapIsEmpty!31968 () Bool)

(assert (=> mapIsEmpty!31968 mapRes!31968))

(declare-fun b!934996 () Bool)

(declare-fun e!525090 () Bool)

(assert (=> b!934996 (= e!525088 (and e!525090 mapRes!31968))))

(declare-fun condMapEmpty!31968 () Bool)

(declare-fun mapDefault!31968 () ValueCell!9587)

(assert (=> b!934996 (= condMapEmpty!31968 (= (arr!27072 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9587)) mapDefault!31968)))))

(declare-fun b!934997 () Bool)

(declare-fun e!525085 () Bool)

(assert (=> b!934997 (= e!525089 e!525085)))

(declare-fun res!629468 () Bool)

(assert (=> b!934997 (=> (not res!629468) (not e!525085))))

(declare-fun lt!421161 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!934997 (= res!629468 (validKeyInArray!0 lt!421161))))

(assert (=> b!934997 (= lt!421161 (select (arr!27073 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!934998 () Bool)

(declare-fun res!629463 () Bool)

(assert (=> b!934998 (=> (not res!629463) (not e!525083))))

(declare-datatypes ((List!19044 0))(
  ( (Nil!19041) (Cons!19040 (h!20192 (_ BitVec 64)) (t!27209 List!19044)) )
))
(declare-fun arrayNoDuplicates!0 (array!56269 (_ BitVec 32) List!19044) Bool)

(assert (=> b!934998 (= res!629463 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19041))))

(declare-fun b!934999 () Bool)

(assert (=> b!934999 (= e!525084 tp_is_empty!20137)))

(declare-fun b!935000 () Bool)

(assert (=> b!935000 (= e!525083 e!525089)))

(declare-fun res!629464 () Bool)

(assert (=> b!935000 (=> (not res!629464) (not e!525089))))

(declare-fun contains!5061 (ListLongMap!11959 (_ BitVec 64)) Bool)

(assert (=> b!935000 (= res!629464 (contains!5061 lt!421167 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31815)

(declare-fun minValue!1173 () V!31815)

(declare-fun getCurrentListMap!3236 (array!56269 array!56267 (_ BitVec 32) (_ BitVec 32) V!31815 V!31815 (_ BitVec 32) Int) ListLongMap!11959)

(assert (=> b!935000 (= lt!421167 (getCurrentListMap!3236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935001 () Bool)

(assert (=> b!935001 (= e!525086 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935002 () Bool)

(assert (=> b!935002 (= e!525085 (not true))))

(assert (=> b!935002 e!525086))

(declare-fun c!97416 () Bool)

(assert (=> b!935002 (= c!97416 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31515 0))(
  ( (Unit!31516) )
))
(declare-fun lt!421166 () Unit!31515)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!274 (array!56269 array!56267 (_ BitVec 32) (_ BitVec 32) V!31815 V!31815 (_ BitVec 64) (_ BitVec 32) Int) Unit!31515)

(assert (=> b!935002 (= lt!421166 (lemmaListMapContainsThenArrayContainsFrom!274 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!935002 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19041)))

(declare-fun lt!421168 () Unit!31515)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56269 (_ BitVec 32) (_ BitVec 32)) Unit!31515)

(assert (=> b!935002 (= lt!421168 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!421162 () tuple2!13260)

(declare-fun +!2820 (ListLongMap!11959 tuple2!13260) ListLongMap!11959)

(assert (=> b!935002 (contains!5061 (+!2820 lt!421167 lt!421162) k0!1099)))

(declare-fun lt!421163 () V!31815)

(declare-fun lt!421164 () Unit!31515)

(declare-fun addStillContains!523 (ListLongMap!11959 (_ BitVec 64) V!31815 (_ BitVec 64)) Unit!31515)

(assert (=> b!935002 (= lt!421164 (addStillContains!523 lt!421167 lt!421161 lt!421163 k0!1099))))

(assert (=> b!935002 (= (getCurrentListMap!3236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2820 (getCurrentListMap!3236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421162))))

(assert (=> b!935002 (= lt!421162 (tuple2!13261 lt!421161 lt!421163))))

(declare-fun get!14271 (ValueCell!9587 V!31815) V!31815)

(declare-fun dynLambda!1617 (Int (_ BitVec 64)) V!31815)

(assert (=> b!935002 (= lt!421163 (get!14271 (select (arr!27072 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1617 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421165 () Unit!31515)

(declare-fun lemmaListMapRecursiveValidKeyArray!200 (array!56269 array!56267 (_ BitVec 32) (_ BitVec 32) V!31815 V!31815 (_ BitVec 32) Int) Unit!31515)

(assert (=> b!935002 (= lt!421165 (lemmaListMapRecursiveValidKeyArray!200 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935003 () Bool)

(declare-fun res!629472 () Bool)

(assert (=> b!935003 (=> (not res!629472) (not e!525083))))

(assert (=> b!935003 (= res!629472 (and (= (size!27532 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27533 _keys!1487) (size!27532 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935004 () Bool)

(assert (=> b!935004 (= e!525090 tp_is_empty!20137)))

(declare-fun b!935005 () Bool)

(declare-fun res!629467 () Bool)

(assert (=> b!935005 (=> (not res!629467) (not e!525083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56269 (_ BitVec 32)) Bool)

(assert (=> b!935005 (= res!629467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!935006 () Bool)

(declare-fun res!629471 () Bool)

(assert (=> b!935006 (=> (not res!629471) (not e!525089))))

(assert (=> b!935006 (= res!629471 (validKeyInArray!0 k0!1099))))

(assert (= (and start!79642 res!629470) b!935003))

(assert (= (and b!935003 res!629472) b!935005))

(assert (= (and b!935005 res!629467) b!934998))

(assert (= (and b!934998 res!629463) b!934995))

(assert (= (and b!934995 res!629469) b!935000))

(assert (= (and b!935000 res!629464) b!934994))

(assert (= (and b!934994 res!629465) b!934992))

(assert (= (and b!934992 res!629466) b!935006))

(assert (= (and b!935006 res!629471) b!934997))

(assert (= (and b!934997 res!629468) b!935002))

(assert (= (and b!935002 c!97416) b!934993))

(assert (= (and b!935002 (not c!97416)) b!935001))

(assert (= (and b!934996 condMapEmpty!31968) mapIsEmpty!31968))

(assert (= (and b!934996 (not condMapEmpty!31968)) mapNonEmpty!31968))

(get-info :version)

(assert (= (and mapNonEmpty!31968 ((_ is ValueCellFull!9587) mapValue!31968)) b!934999))

(assert (= (and b!934996 ((_ is ValueCellFull!9587) mapDefault!31968)) b!935004))

(assert (= start!79642 b!934996))

(declare-fun b_lambda!13995 () Bool)

(assert (=> (not b_lambda!13995) (not b!935002)))

(declare-fun t!27207 () Bool)

(declare-fun tb!6015 () Bool)

(assert (=> (and start!79642 (= defaultEntry!1235 defaultEntry!1235) t!27207) tb!6015))

(declare-fun result!11865 () Bool)

(assert (=> tb!6015 (= result!11865 tp_is_empty!20137)))

(assert (=> b!935002 t!27207))

(declare-fun b_and!28837 () Bool)

(assert (= b_and!28835 (and (=> t!27207 result!11865) b_and!28837)))

(declare-fun m!869641 () Bool)

(assert (=> b!935005 m!869641))

(declare-fun m!869643 () Bool)

(assert (=> start!79642 m!869643))

(declare-fun m!869645 () Bool)

(assert (=> start!79642 m!869645))

(declare-fun m!869647 () Bool)

(assert (=> start!79642 m!869647))

(declare-fun m!869649 () Bool)

(assert (=> b!934997 m!869649))

(declare-fun m!869651 () Bool)

(assert (=> b!934997 m!869651))

(declare-fun m!869653 () Bool)

(assert (=> mapNonEmpty!31968 m!869653))

(declare-fun m!869655 () Bool)

(assert (=> b!934993 m!869655))

(declare-fun m!869657 () Bool)

(assert (=> b!934994 m!869657))

(declare-fun m!869659 () Bool)

(assert (=> b!934998 m!869659))

(declare-fun m!869661 () Bool)

(assert (=> b!935006 m!869661))

(declare-fun m!869663 () Bool)

(assert (=> b!935000 m!869663))

(declare-fun m!869665 () Bool)

(assert (=> b!935000 m!869665))

(declare-fun m!869667 () Bool)

(assert (=> b!935002 m!869667))

(declare-fun m!869669 () Bool)

(assert (=> b!935002 m!869669))

(declare-fun m!869671 () Bool)

(assert (=> b!935002 m!869671))

(assert (=> b!935002 m!869667))

(declare-fun m!869673 () Bool)

(assert (=> b!935002 m!869673))

(declare-fun m!869675 () Bool)

(assert (=> b!935002 m!869675))

(declare-fun m!869677 () Bool)

(assert (=> b!935002 m!869677))

(assert (=> b!935002 m!869673))

(assert (=> b!935002 m!869675))

(declare-fun m!869679 () Bool)

(assert (=> b!935002 m!869679))

(declare-fun m!869681 () Bool)

(assert (=> b!935002 m!869681))

(declare-fun m!869683 () Bool)

(assert (=> b!935002 m!869683))

(declare-fun m!869685 () Bool)

(assert (=> b!935002 m!869685))

(declare-fun m!869687 () Bool)

(assert (=> b!935002 m!869687))

(declare-fun m!869689 () Bool)

(assert (=> b!935002 m!869689))

(assert (=> b!935002 m!869683))

(declare-fun m!869691 () Bool)

(assert (=> b!935002 m!869691))

(check-sat (not b!935002) tp_is_empty!20137 (not b!934994) (not b!935000) (not b!934997) (not b_lambda!13995) (not b!934998) (not b!934993) (not start!79642) (not b_next!17629) (not b!935006) b_and!28837 (not b!935005) (not mapNonEmpty!31968))
(check-sat b_and!28837 (not b_next!17629))
