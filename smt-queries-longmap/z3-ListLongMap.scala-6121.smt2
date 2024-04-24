; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79002 () Bool)

(assert start!79002)

(declare-fun b_free!17047 () Bool)

(declare-fun b_next!17047 () Bool)

(assert (=> start!79002 (= b_free!17047 (not b_next!17047))))

(declare-fun tp!59582 () Bool)

(declare-fun b_and!27841 () Bool)

(assert (=> start!79002 (= tp!59582 b_and!27841)))

(declare-fun mapNonEmpty!31089 () Bool)

(declare-fun mapRes!31089 () Bool)

(declare-fun tp!59583 () Bool)

(declare-fun e!517282 () Bool)

(assert (=> mapNonEmpty!31089 (= mapRes!31089 (and tp!59583 e!517282))))

(declare-datatypes ((V!31039 0))(
  ( (V!31040 (val!9828 Int)) )
))
(declare-datatypes ((ValueCell!9296 0))(
  ( (ValueCellFull!9296 (v!12343 V!31039)) (EmptyCell!9296) )
))
(declare-fun mapRest!31089 () (Array (_ BitVec 32) ValueCell!9296))

(declare-fun mapKey!31089 () (_ BitVec 32))

(declare-fun mapValue!31089 () ValueCell!9296)

(declare-datatypes ((array!55135 0))(
  ( (array!55136 (arr!26508 (Array (_ BitVec 32) ValueCell!9296)) (size!26968 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55135)

(assert (=> mapNonEmpty!31089 (= (arr!26508 _values!1231) (store mapRest!31089 mapKey!31089 mapValue!31089))))

(declare-fun b!921547 () Bool)

(declare-fun e!517279 () Bool)

(assert (=> b!921547 (= e!517279 true)))

(declare-fun lt!413677 () Bool)

(declare-datatypes ((List!18576 0))(
  ( (Nil!18573) (Cons!18572 (h!19724 (_ BitVec 64)) (t!26345 List!18576)) )
))
(declare-fun contains!4804 (List!18576 (_ BitVec 64)) Bool)

(assert (=> b!921547 (= lt!413677 (contains!4804 Nil!18573 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921548 () Bool)

(declare-fun e!517277 () Bool)

(declare-fun e!517281 () Bool)

(assert (=> b!921548 (= e!517277 e!517281)))

(declare-fun res!621174 () Bool)

(assert (=> b!921548 (=> (not res!621174) (not e!517281))))

(declare-fun lt!413671 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921548 (= res!621174 (validKeyInArray!0 lt!413671))))

(declare-datatypes ((array!55137 0))(
  ( (array!55138 (arr!26509 (Array (_ BitVec 32) (_ BitVec 64))) (size!26969 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55137)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921548 (= lt!413671 (select (arr!26509 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921549 () Bool)

(declare-fun res!621176 () Bool)

(declare-fun e!517274 () Bool)

(assert (=> b!921549 (=> (not res!621176) (not e!517274))))

(assert (=> b!921549 (= res!621176 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26969 _keys!1487))))))

(declare-fun mapIsEmpty!31089 () Bool)

(assert (=> mapIsEmpty!31089 mapRes!31089))

(declare-fun b!921550 () Bool)

(declare-fun res!621181 () Bool)

(assert (=> b!921550 (=> (not res!621181) (not e!517277))))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!921550 (= res!621181 (validKeyInArray!0 k0!1099))))

(declare-fun b!921551 () Bool)

(declare-fun tp_is_empty!19555 () Bool)

(assert (=> b!921551 (= e!517282 tp_is_empty!19555)))

(declare-fun b!921552 () Bool)

(declare-fun res!621179 () Bool)

(assert (=> b!921552 (=> (not res!621179) (not e!517277))))

(assert (=> b!921552 (= res!621179 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!921553 () Bool)

(declare-fun e!517275 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!921553 (= e!517275 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921554 () Bool)

(declare-fun res!621182 () Bool)

(assert (=> b!921554 (=> res!621182 e!517279)))

(assert (=> b!921554 (= res!621182 (contains!4804 Nil!18573 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!621180 () Bool)

(assert (=> start!79002 (=> (not res!621180) (not e!517274))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79002 (= res!621180 (validMask!0 mask!1881))))

(assert (=> start!79002 e!517274))

(assert (=> start!79002 true))

(assert (=> start!79002 tp_is_empty!19555))

(declare-fun e!517280 () Bool)

(declare-fun array_inv!20752 (array!55135) Bool)

(assert (=> start!79002 (and (array_inv!20752 _values!1231) e!517280)))

(assert (=> start!79002 tp!59582))

(declare-fun array_inv!20753 (array!55137) Bool)

(assert (=> start!79002 (array_inv!20753 _keys!1487)))

(declare-fun b!921546 () Bool)

(declare-fun res!621185 () Bool)

(assert (=> b!921546 (=> (not res!621185) (not e!517277))))

(declare-fun v!791 () V!31039)

(declare-datatypes ((tuple2!12762 0))(
  ( (tuple2!12763 (_1!6392 (_ BitVec 64)) (_2!6392 V!31039)) )
))
(declare-datatypes ((List!18577 0))(
  ( (Nil!18574) (Cons!18573 (h!19725 tuple2!12762) (t!26346 List!18577)) )
))
(declare-datatypes ((ListLongMap!11461 0))(
  ( (ListLongMap!11462 (toList!5746 List!18577)) )
))
(declare-fun lt!413676 () ListLongMap!11461)

(declare-fun apply!611 (ListLongMap!11461 (_ BitVec 64)) V!31039)

(assert (=> b!921546 (= res!621185 (= (apply!611 lt!413676 k0!1099) v!791))))

(declare-fun b!921555 () Bool)

(declare-fun arrayContainsKey!0 (array!55137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921555 (= e!517275 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921556 () Bool)

(assert (=> b!921556 (= e!517281 (not e!517279))))

(declare-fun res!621184 () Bool)

(assert (=> b!921556 (=> res!621184 e!517279)))

(assert (=> b!921556 (= res!621184 (or (bvsge (size!26969 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26969 _keys!1487))))))

(assert (=> b!921556 e!517275))

(declare-fun c!96354 () Bool)

(assert (=> b!921556 (= c!96354 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31068 0))(
  ( (Unit!31069) )
))
(declare-fun lt!413678 () Unit!31068)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31039)

(declare-fun minValue!1173 () V!31039)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!169 (array!55137 array!55135 (_ BitVec 32) (_ BitVec 32) V!31039 V!31039 (_ BitVec 64) (_ BitVec 32) Int) Unit!31068)

(assert (=> b!921556 (= lt!413678 (lemmaListMapContainsThenArrayContainsFrom!169 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55137 (_ BitVec 32) List!18576) Bool)

(assert (=> b!921556 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18573)))

(declare-fun lt!413674 () Unit!31068)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55137 (_ BitVec 32) (_ BitVec 32)) Unit!31068)

(assert (=> b!921556 (= lt!413674 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413673 () tuple2!12762)

(declare-fun contains!4805 (ListLongMap!11461 (_ BitVec 64)) Bool)

(declare-fun +!2678 (ListLongMap!11461 tuple2!12762) ListLongMap!11461)

(assert (=> b!921556 (contains!4805 (+!2678 lt!413676 lt!413673) k0!1099)))

(declare-fun lt!413675 () V!31039)

(declare-fun lt!413670 () Unit!31068)

(declare-fun addStillContains!387 (ListLongMap!11461 (_ BitVec 64) V!31039 (_ BitVec 64)) Unit!31068)

(assert (=> b!921556 (= lt!413670 (addStillContains!387 lt!413676 lt!413671 lt!413675 k0!1099))))

(declare-fun getCurrentListMap!2999 (array!55137 array!55135 (_ BitVec 32) (_ BitVec 32) V!31039 V!31039 (_ BitVec 32) Int) ListLongMap!11461)

(assert (=> b!921556 (= (getCurrentListMap!2999 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2678 (getCurrentListMap!2999 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413673))))

(assert (=> b!921556 (= lt!413673 (tuple2!12763 lt!413671 lt!413675))))

(declare-fun get!13929 (ValueCell!9296 V!31039) V!31039)

(declare-fun dynLambda!1475 (Int (_ BitVec 64)) V!31039)

(assert (=> b!921556 (= lt!413675 (get!13929 (select (arr!26508 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1475 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413672 () Unit!31068)

(declare-fun lemmaListMapRecursiveValidKeyArray!58 (array!55137 array!55135 (_ BitVec 32) (_ BitVec 32) V!31039 V!31039 (_ BitVec 32) Int) Unit!31068)

(assert (=> b!921556 (= lt!413672 (lemmaListMapRecursiveValidKeyArray!58 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921557 () Bool)

(assert (=> b!921557 (= e!517274 e!517277)))

(declare-fun res!621183 () Bool)

(assert (=> b!921557 (=> (not res!621183) (not e!517277))))

(assert (=> b!921557 (= res!621183 (contains!4805 lt!413676 k0!1099))))

(assert (=> b!921557 (= lt!413676 (getCurrentListMap!2999 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921558 () Bool)

(declare-fun res!621186 () Bool)

(assert (=> b!921558 (=> res!621186 e!517279)))

(declare-fun noDuplicate!1343 (List!18576) Bool)

(assert (=> b!921558 (= res!621186 (not (noDuplicate!1343 Nil!18573)))))

(declare-fun b!921559 () Bool)

(declare-fun res!621175 () Bool)

(assert (=> b!921559 (=> (not res!621175) (not e!517274))))

(assert (=> b!921559 (= res!621175 (and (= (size!26968 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26969 _keys!1487) (size!26968 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921560 () Bool)

(declare-fun e!517276 () Bool)

(assert (=> b!921560 (= e!517280 (and e!517276 mapRes!31089))))

(declare-fun condMapEmpty!31089 () Bool)

(declare-fun mapDefault!31089 () ValueCell!9296)

(assert (=> b!921560 (= condMapEmpty!31089 (= (arr!26508 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9296)) mapDefault!31089)))))

(declare-fun b!921561 () Bool)

(declare-fun res!621178 () Bool)

(assert (=> b!921561 (=> (not res!621178) (not e!517274))))

(assert (=> b!921561 (= res!621178 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18573))))

(declare-fun b!921562 () Bool)

(assert (=> b!921562 (= e!517276 tp_is_empty!19555)))

(declare-fun b!921563 () Bool)

(declare-fun res!621177 () Bool)

(assert (=> b!921563 (=> (not res!621177) (not e!517274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55137 (_ BitVec 32)) Bool)

(assert (=> b!921563 (= res!621177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79002 res!621180) b!921559))

(assert (= (and b!921559 res!621175) b!921563))

(assert (= (and b!921563 res!621177) b!921561))

(assert (= (and b!921561 res!621178) b!921549))

(assert (= (and b!921549 res!621176) b!921557))

(assert (= (and b!921557 res!621183) b!921546))

(assert (= (and b!921546 res!621185) b!921552))

(assert (= (and b!921552 res!621179) b!921550))

(assert (= (and b!921550 res!621181) b!921548))

(assert (= (and b!921548 res!621174) b!921556))

(assert (= (and b!921556 c!96354) b!921555))

(assert (= (and b!921556 (not c!96354)) b!921553))

(assert (= (and b!921556 (not res!621184)) b!921558))

(assert (= (and b!921558 (not res!621186)) b!921554))

(assert (= (and b!921554 (not res!621182)) b!921547))

(assert (= (and b!921560 condMapEmpty!31089) mapIsEmpty!31089))

(assert (= (and b!921560 (not condMapEmpty!31089)) mapNonEmpty!31089))

(get-info :version)

(assert (= (and mapNonEmpty!31089 ((_ is ValueCellFull!9296) mapValue!31089)) b!921551))

(assert (= (and b!921560 ((_ is ValueCellFull!9296) mapDefault!31089)) b!921562))

(assert (= start!79002 b!921560))

(declare-fun b_lambda!13563 () Bool)

(assert (=> (not b_lambda!13563) (not b!921556)))

(declare-fun t!26344 () Bool)

(declare-fun tb!5619 () Bool)

(assert (=> (and start!79002 (= defaultEntry!1235 defaultEntry!1235) t!26344) tb!5619))

(declare-fun result!11069 () Bool)

(assert (=> tb!5619 (= result!11069 tp_is_empty!19555)))

(assert (=> b!921556 t!26344))

(declare-fun b_and!27843 () Bool)

(assert (= b_and!27841 (and (=> t!26344 result!11069) b_and!27843)))

(declare-fun m!855865 () Bool)

(assert (=> start!79002 m!855865))

(declare-fun m!855867 () Bool)

(assert (=> start!79002 m!855867))

(declare-fun m!855869 () Bool)

(assert (=> start!79002 m!855869))

(declare-fun m!855871 () Bool)

(assert (=> b!921548 m!855871))

(declare-fun m!855873 () Bool)

(assert (=> b!921548 m!855873))

(declare-fun m!855875 () Bool)

(assert (=> mapNonEmpty!31089 m!855875))

(declare-fun m!855877 () Bool)

(assert (=> b!921558 m!855877))

(declare-fun m!855879 () Bool)

(assert (=> b!921555 m!855879))

(declare-fun m!855881 () Bool)

(assert (=> b!921554 m!855881))

(declare-fun m!855883 () Bool)

(assert (=> b!921561 m!855883))

(declare-fun m!855885 () Bool)

(assert (=> b!921563 m!855885))

(declare-fun m!855887 () Bool)

(assert (=> b!921546 m!855887))

(declare-fun m!855889 () Bool)

(assert (=> b!921556 m!855889))

(declare-fun m!855891 () Bool)

(assert (=> b!921556 m!855891))

(declare-fun m!855893 () Bool)

(assert (=> b!921556 m!855893))

(declare-fun m!855895 () Bool)

(assert (=> b!921556 m!855895))

(declare-fun m!855897 () Bool)

(assert (=> b!921556 m!855897))

(assert (=> b!921556 m!855889))

(declare-fun m!855899 () Bool)

(assert (=> b!921556 m!855899))

(declare-fun m!855901 () Bool)

(assert (=> b!921556 m!855901))

(assert (=> b!921556 m!855897))

(assert (=> b!921556 m!855901))

(declare-fun m!855903 () Bool)

(assert (=> b!921556 m!855903))

(declare-fun m!855905 () Bool)

(assert (=> b!921556 m!855905))

(declare-fun m!855907 () Bool)

(assert (=> b!921556 m!855907))

(declare-fun m!855909 () Bool)

(assert (=> b!921556 m!855909))

(declare-fun m!855911 () Bool)

(assert (=> b!921556 m!855911))

(assert (=> b!921556 m!855893))

(declare-fun m!855913 () Bool)

(assert (=> b!921556 m!855913))

(declare-fun m!855915 () Bool)

(assert (=> b!921557 m!855915))

(declare-fun m!855917 () Bool)

(assert (=> b!921557 m!855917))

(declare-fun m!855919 () Bool)

(assert (=> b!921550 m!855919))

(declare-fun m!855921 () Bool)

(assert (=> b!921547 m!855921))

(check-sat b_and!27843 (not b!921548) tp_is_empty!19555 (not b!921558) (not b!921550) (not b!921555) (not b!921554) (not start!79002) (not b!921561) (not b!921556) (not b!921557) (not b!921546) (not mapNonEmpty!31089) (not b_lambda!13563) (not b_next!17047) (not b!921547) (not b!921563))
(check-sat b_and!27843 (not b_next!17047))
