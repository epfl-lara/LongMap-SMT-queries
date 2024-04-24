; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79648 () Bool)

(assert start!79648)

(declare-fun b_free!17635 () Bool)

(declare-fun b_next!17635 () Bool)

(assert (=> start!79648 (= b_free!17635 (not b_next!17635))))

(declare-fun tp!61352 () Bool)

(declare-fun b_and!28847 () Bool)

(assert (=> start!79648 (= tp!61352 b_and!28847)))

(declare-fun b!935133 () Bool)

(declare-fun res!629554 () Bool)

(declare-fun e!525160 () Bool)

(assert (=> b!935133 (=> (not res!629554) (not e!525160))))

(declare-datatypes ((array!56277 0))(
  ( (array!56278 (arr!27077 (Array (_ BitVec 32) (_ BitVec 64))) (size!27537 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56277)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56277 (_ BitVec 32)) Bool)

(assert (=> b!935133 (= res!629554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!629553 () Bool)

(assert (=> start!79648 (=> (not res!629553) (not e!525160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79648 (= res!629553 (validMask!0 mask!1881))))

(assert (=> start!79648 e!525160))

(assert (=> start!79648 true))

(declare-fun tp_is_empty!20143 () Bool)

(assert (=> start!79648 tp_is_empty!20143))

(declare-datatypes ((V!31823 0))(
  ( (V!31824 (val!10122 Int)) )
))
(declare-datatypes ((ValueCell!9590 0))(
  ( (ValueCellFull!9590 (v!12639 V!31823)) (EmptyCell!9590) )
))
(declare-datatypes ((array!56279 0))(
  ( (array!56280 (arr!27078 (Array (_ BitVec 32) ValueCell!9590)) (size!27538 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56279)

(declare-fun e!525156 () Bool)

(declare-fun array_inv!21156 (array!56279) Bool)

(assert (=> start!79648 (and (array_inv!21156 _values!1231) e!525156)))

(assert (=> start!79648 tp!61352))

(declare-fun array_inv!21157 (array!56277) Bool)

(assert (=> start!79648 (array_inv!21157 _keys!1487)))

(declare-fun b!935134 () Bool)

(declare-fun e!525162 () Bool)

(assert (=> b!935134 (= e!525162 tp_is_empty!20143)))

(declare-fun b!935135 () Bool)

(declare-fun res!629555 () Bool)

(declare-fun e!525159 () Bool)

(assert (=> b!935135 (=> (not res!629555) (not e!525159))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!935135 (= res!629555 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935136 () Bool)

(declare-fun res!629561 () Bool)

(assert (=> b!935136 (=> (not res!629561) (not e!525160))))

(assert (=> b!935136 (= res!629561 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27537 _keys!1487))))))

(declare-fun b!935137 () Bool)

(declare-fun e!525155 () Bool)

(assert (=> b!935137 (= e!525155 (not true))))

(declare-fun e!525161 () Bool)

(assert (=> b!935137 e!525161))

(declare-fun c!97425 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!935137 (= c!97425 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((Unit!31517 0))(
  ( (Unit!31518) )
))
(declare-fun lt!421233 () Unit!31517)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31823)

(declare-fun minValue!1173 () V!31823)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!275 (array!56277 array!56279 (_ BitVec 32) (_ BitVec 32) V!31823 V!31823 (_ BitVec 64) (_ BitVec 32) Int) Unit!31517)

(assert (=> b!935137 (= lt!421233 (lemmaListMapContainsThenArrayContainsFrom!275 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19045 0))(
  ( (Nil!19042) (Cons!19041 (h!20193 (_ BitVec 64)) (t!27216 List!19045)) )
))
(declare-fun arrayNoDuplicates!0 (array!56277 (_ BitVec 32) List!19045) Bool)

(assert (=> b!935137 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19042)))

(declare-fun lt!421238 () Unit!31517)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56277 (_ BitVec 32) (_ BitVec 32)) Unit!31517)

(assert (=> b!935137 (= lt!421238 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13262 0))(
  ( (tuple2!13263 (_1!6642 (_ BitVec 64)) (_2!6642 V!31823)) )
))
(declare-datatypes ((List!19046 0))(
  ( (Nil!19043) (Cons!19042 (h!20194 tuple2!13262) (t!27217 List!19046)) )
))
(declare-datatypes ((ListLongMap!11961 0))(
  ( (ListLongMap!11962 (toList!5996 List!19046)) )
))
(declare-fun lt!421235 () ListLongMap!11961)

(declare-fun lt!421237 () tuple2!13262)

(declare-fun contains!5062 (ListLongMap!11961 (_ BitVec 64)) Bool)

(declare-fun +!2821 (ListLongMap!11961 tuple2!13262) ListLongMap!11961)

(assert (=> b!935137 (contains!5062 (+!2821 lt!421235 lt!421237) k0!1099)))

(declare-fun lt!421239 () V!31823)

(declare-fun lt!421234 () Unit!31517)

(declare-fun lt!421236 () (_ BitVec 64))

(declare-fun addStillContains!524 (ListLongMap!11961 (_ BitVec 64) V!31823 (_ BitVec 64)) Unit!31517)

(assert (=> b!935137 (= lt!421234 (addStillContains!524 lt!421235 lt!421236 lt!421239 k0!1099))))

(declare-fun getCurrentListMap!3237 (array!56277 array!56279 (_ BitVec 32) (_ BitVec 32) V!31823 V!31823 (_ BitVec 32) Int) ListLongMap!11961)

(assert (=> b!935137 (= (getCurrentListMap!3237 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2821 (getCurrentListMap!3237 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421237))))

(assert (=> b!935137 (= lt!421237 (tuple2!13263 lt!421236 lt!421239))))

(declare-fun get!14274 (ValueCell!9590 V!31823) V!31823)

(declare-fun dynLambda!1618 (Int (_ BitVec 64)) V!31823)

(assert (=> b!935137 (= lt!421239 (get!14274 (select (arr!27078 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1618 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421240 () Unit!31517)

(declare-fun lemmaListMapRecursiveValidKeyArray!201 (array!56277 array!56279 (_ BitVec 32) (_ BitVec 32) V!31823 V!31823 (_ BitVec 32) Int) Unit!31517)

(assert (=> b!935137 (= lt!421240 (lemmaListMapRecursiveValidKeyArray!201 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935138 () Bool)

(declare-fun arrayContainsKey!0 (array!56277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935138 (= e!525161 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun mapNonEmpty!31977 () Bool)

(declare-fun mapRes!31977 () Bool)

(declare-fun tp!61353 () Bool)

(declare-fun e!525158 () Bool)

(assert (=> mapNonEmpty!31977 (= mapRes!31977 (and tp!61353 e!525158))))

(declare-fun mapValue!31977 () ValueCell!9590)

(declare-fun mapKey!31977 () (_ BitVec 32))

(declare-fun mapRest!31977 () (Array (_ BitVec 32) ValueCell!9590))

(assert (=> mapNonEmpty!31977 (= (arr!27078 _values!1231) (store mapRest!31977 mapKey!31977 mapValue!31977))))

(declare-fun b!935139 () Bool)

(assert (=> b!935139 (= e!525158 tp_is_empty!20143)))

(declare-fun b!935140 () Bool)

(assert (=> b!935140 (= e!525160 e!525159)))

(declare-fun res!629559 () Bool)

(assert (=> b!935140 (=> (not res!629559) (not e!525159))))

(assert (=> b!935140 (= res!629559 (contains!5062 lt!421235 k0!1099))))

(assert (=> b!935140 (= lt!421235 (getCurrentListMap!3237 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935141 () Bool)

(declare-fun res!629562 () Bool)

(assert (=> b!935141 (=> (not res!629562) (not e!525159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935141 (= res!629562 (validKeyInArray!0 k0!1099))))

(declare-fun mapIsEmpty!31977 () Bool)

(assert (=> mapIsEmpty!31977 mapRes!31977))

(declare-fun b!935142 () Bool)

(assert (=> b!935142 (= e!525159 e!525155)))

(declare-fun res!629558 () Bool)

(assert (=> b!935142 (=> (not res!629558) (not e!525155))))

(assert (=> b!935142 (= res!629558 (validKeyInArray!0 lt!421236))))

(assert (=> b!935142 (= lt!421236 (select (arr!27077 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935143 () Bool)

(assert (=> b!935143 (= e!525156 (and e!525162 mapRes!31977))))

(declare-fun condMapEmpty!31977 () Bool)

(declare-fun mapDefault!31977 () ValueCell!9590)

(assert (=> b!935143 (= condMapEmpty!31977 (= (arr!27078 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9590)) mapDefault!31977)))))

(declare-fun b!935144 () Bool)

(declare-fun res!629556 () Bool)

(assert (=> b!935144 (=> (not res!629556) (not e!525159))))

(declare-fun v!791 () V!31823)

(declare-fun apply!820 (ListLongMap!11961 (_ BitVec 64)) V!31823)

(assert (=> b!935144 (= res!629556 (= (apply!820 lt!421235 k0!1099) v!791))))

(declare-fun b!935145 () Bool)

(declare-fun res!629560 () Bool)

(assert (=> b!935145 (=> (not res!629560) (not e!525160))))

(assert (=> b!935145 (= res!629560 (and (= (size!27538 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27537 _keys!1487) (size!27538 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935146 () Bool)

(declare-fun res!629557 () Bool)

(assert (=> b!935146 (=> (not res!629557) (not e!525160))))

(assert (=> b!935146 (= res!629557 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19042))))

(declare-fun b!935147 () Bool)

(assert (=> b!935147 (= e!525161 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!79648 res!629553) b!935145))

(assert (= (and b!935145 res!629560) b!935133))

(assert (= (and b!935133 res!629554) b!935146))

(assert (= (and b!935146 res!629557) b!935136))

(assert (= (and b!935136 res!629561) b!935140))

(assert (= (and b!935140 res!629559) b!935144))

(assert (= (and b!935144 res!629556) b!935135))

(assert (= (and b!935135 res!629555) b!935141))

(assert (= (and b!935141 res!629562) b!935142))

(assert (= (and b!935142 res!629558) b!935137))

(assert (= (and b!935137 c!97425) b!935138))

(assert (= (and b!935137 (not c!97425)) b!935147))

(assert (= (and b!935143 condMapEmpty!31977) mapIsEmpty!31977))

(assert (= (and b!935143 (not condMapEmpty!31977)) mapNonEmpty!31977))

(get-info :version)

(assert (= (and mapNonEmpty!31977 ((_ is ValueCellFull!9590) mapValue!31977)) b!935139))

(assert (= (and b!935143 ((_ is ValueCellFull!9590) mapDefault!31977)) b!935134))

(assert (= start!79648 b!935143))

(declare-fun b_lambda!14001 () Bool)

(assert (=> (not b_lambda!14001) (not b!935137)))

(declare-fun t!27215 () Bool)

(declare-fun tb!6021 () Bool)

(assert (=> (and start!79648 (= defaultEntry!1235 defaultEntry!1235) t!27215) tb!6021))

(declare-fun result!11877 () Bool)

(assert (=> tb!6021 (= result!11877 tp_is_empty!20143)))

(assert (=> b!935137 t!27215))

(declare-fun b_and!28849 () Bool)

(assert (= b_and!28847 (and (=> t!27215 result!11877) b_and!28849)))

(declare-fun m!869797 () Bool)

(assert (=> b!935141 m!869797))

(declare-fun m!869799 () Bool)

(assert (=> b!935138 m!869799))

(declare-fun m!869801 () Bool)

(assert (=> mapNonEmpty!31977 m!869801))

(declare-fun m!869803 () Bool)

(assert (=> b!935142 m!869803))

(declare-fun m!869805 () Bool)

(assert (=> b!935142 m!869805))

(declare-fun m!869807 () Bool)

(assert (=> b!935144 m!869807))

(declare-fun m!869809 () Bool)

(assert (=> start!79648 m!869809))

(declare-fun m!869811 () Bool)

(assert (=> start!79648 m!869811))

(declare-fun m!869813 () Bool)

(assert (=> start!79648 m!869813))

(declare-fun m!869815 () Bool)

(assert (=> b!935133 m!869815))

(declare-fun m!869817 () Bool)

(assert (=> b!935146 m!869817))

(declare-fun m!869819 () Bool)

(assert (=> b!935140 m!869819))

(declare-fun m!869821 () Bool)

(assert (=> b!935140 m!869821))

(declare-fun m!869823 () Bool)

(assert (=> b!935137 m!869823))

(declare-fun m!869825 () Bool)

(assert (=> b!935137 m!869825))

(declare-fun m!869827 () Bool)

(assert (=> b!935137 m!869827))

(declare-fun m!869829 () Bool)

(assert (=> b!935137 m!869829))

(declare-fun m!869831 () Bool)

(assert (=> b!935137 m!869831))

(declare-fun m!869833 () Bool)

(assert (=> b!935137 m!869833))

(declare-fun m!869835 () Bool)

(assert (=> b!935137 m!869835))

(assert (=> b!935137 m!869823))

(declare-fun m!869837 () Bool)

(assert (=> b!935137 m!869837))

(assert (=> b!935137 m!869829))

(assert (=> b!935137 m!869831))

(declare-fun m!869839 () Bool)

(assert (=> b!935137 m!869839))

(declare-fun m!869841 () Bool)

(assert (=> b!935137 m!869841))

(declare-fun m!869843 () Bool)

(assert (=> b!935137 m!869843))

(declare-fun m!869845 () Bool)

(assert (=> b!935137 m!869845))

(assert (=> b!935137 m!869833))

(declare-fun m!869847 () Bool)

(assert (=> b!935137 m!869847))

(check-sat (not b!935146) (not b!935137) (not b!935133) (not start!79648) (not mapNonEmpty!31977) (not b!935142) b_and!28849 (not b!935140) (not b_lambda!14001) (not b_next!17635) tp_is_empty!20143 (not b!935141) (not b!935144) (not b!935138))
(check-sat b_and!28849 (not b_next!17635))
