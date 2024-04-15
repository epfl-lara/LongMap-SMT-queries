; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79412 () Bool)

(assert start!79412)

(declare-fun b_free!17617 () Bool)

(declare-fun b_next!17617 () Bool)

(assert (=> start!79412 (= b_free!17617 (not b_next!17617))))

(declare-fun tp!61295 () Bool)

(declare-fun b_and!28767 () Bool)

(assert (=> start!79412 (= tp!61295 b_and!28767)))

(declare-fun b!933395 () Bool)

(declare-fun e!524094 () Bool)

(declare-fun tp_is_empty!20125 () Bool)

(assert (=> b!933395 (= e!524094 tp_is_empty!20125)))

(declare-fun b!933396 () Bool)

(declare-fun e!524096 () Bool)

(assert (=> b!933396 (= e!524096 (not true))))

(declare-datatypes ((array!56151 0))(
  ( (array!56152 (arr!27020 (Array (_ BitVec 32) (_ BitVec 64))) (size!27481 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56151)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!19066 0))(
  ( (Nil!19063) (Cons!19062 (h!20208 (_ BitVec 64)) (t!27218 List!19066)) )
))
(declare-fun arrayNoDuplicates!0 (array!56151 (_ BitVec 32) List!19066) Bool)

(assert (=> b!933396 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19063)))

(declare-datatypes ((Unit!31416 0))(
  ( (Unit!31417) )
))
(declare-fun lt!420266 () Unit!31416)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56151 (_ BitVec 32) (_ BitVec 32)) Unit!31416)

(assert (=> b!933396 (= lt!420266 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!31799 0))(
  ( (V!31800 (val!10113 Int)) )
))
(declare-datatypes ((tuple2!13316 0))(
  ( (tuple2!13317 (_1!6669 (_ BitVec 64)) (_2!6669 V!31799)) )
))
(declare-datatypes ((List!19067 0))(
  ( (Nil!19064) (Cons!19063 (h!20209 tuple2!13316) (t!27219 List!19067)) )
))
(declare-datatypes ((ListLongMap!12003 0))(
  ( (ListLongMap!12004 (toList!6017 List!19067)) )
))
(declare-fun lt!420268 () ListLongMap!12003)

(declare-fun lt!420267 () tuple2!13316)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5014 (ListLongMap!12003 (_ BitVec 64)) Bool)

(declare-fun +!2823 (ListLongMap!12003 tuple2!13316) ListLongMap!12003)

(assert (=> b!933396 (contains!5014 (+!2823 lt!420268 lt!420267) k0!1099)))

(declare-fun lt!420265 () Unit!31416)

(declare-fun lt!420270 () (_ BitVec 64))

(declare-fun lt!420269 () V!31799)

(declare-fun addStillContains!512 (ListLongMap!12003 (_ BitVec 64) V!31799 (_ BitVec 64)) Unit!31416)

(assert (=> b!933396 (= lt!420265 (addStillContains!512 lt!420268 lt!420270 lt!420269 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9581 0))(
  ( (ValueCellFull!9581 (v!12631 V!31799)) (EmptyCell!9581) )
))
(declare-datatypes ((array!56153 0))(
  ( (array!56154 (arr!27021 (Array (_ BitVec 32) ValueCell!9581)) (size!27482 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56153)

(declare-fun zeroValue!1173 () V!31799)

(declare-fun minValue!1173 () V!31799)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3189 (array!56151 array!56153 (_ BitVec 32) (_ BitVec 32) V!31799 V!31799 (_ BitVec 32) Int) ListLongMap!12003)

(assert (=> b!933396 (= (getCurrentListMap!3189 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2823 (getCurrentListMap!3189 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420267))))

(assert (=> b!933396 (= lt!420267 (tuple2!13317 lt!420270 lt!420269))))

(declare-fun get!14227 (ValueCell!9581 V!31799) V!31799)

(declare-fun dynLambda!1579 (Int (_ BitVec 64)) V!31799)

(assert (=> b!933396 (= lt!420269 (get!14227 (select (arr!27021 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1579 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420264 () Unit!31416)

(declare-fun lemmaListMapRecursiveValidKeyArray!187 (array!56151 array!56153 (_ BitVec 32) (_ BitVec 32) V!31799 V!31799 (_ BitVec 32) Int) Unit!31416)

(assert (=> b!933396 (= lt!420264 (lemmaListMapRecursiveValidKeyArray!187 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933397 () Bool)

(declare-fun res!628746 () Bool)

(declare-fun e!524098 () Bool)

(assert (=> b!933397 (=> (not res!628746) (not e!524098))))

(assert (=> b!933397 (= res!628746 (and (= (size!27482 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27481 _keys!1487) (size!27482 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933398 () Bool)

(declare-fun res!628751 () Bool)

(declare-fun e!524093 () Bool)

(assert (=> b!933398 (=> (not res!628751) (not e!524093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933398 (= res!628751 (validKeyInArray!0 k0!1099))))

(declare-fun b!933399 () Bool)

(assert (=> b!933399 (= e!524098 e!524093)))

(declare-fun res!628745 () Bool)

(assert (=> b!933399 (=> (not res!628745) (not e!524093))))

(assert (=> b!933399 (= res!628745 (contains!5014 lt!420268 k0!1099))))

(assert (=> b!933399 (= lt!420268 (getCurrentListMap!3189 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933400 () Bool)

(declare-fun e!524097 () Bool)

(declare-fun mapRes!31947 () Bool)

(assert (=> b!933400 (= e!524097 (and e!524094 mapRes!31947))))

(declare-fun condMapEmpty!31947 () Bool)

(declare-fun mapDefault!31947 () ValueCell!9581)

(assert (=> b!933400 (= condMapEmpty!31947 (= (arr!27021 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9581)) mapDefault!31947)))))

(declare-fun b!933401 () Bool)

(declare-fun res!628754 () Bool)

(assert (=> b!933401 (=> (not res!628754) (not e!524093))))

(declare-fun v!791 () V!31799)

(declare-fun apply!804 (ListLongMap!12003 (_ BitVec 64)) V!31799)

(assert (=> b!933401 (= res!628754 (= (apply!804 lt!420268 k0!1099) v!791))))

(declare-fun b!933402 () Bool)

(declare-fun res!628747 () Bool)

(assert (=> b!933402 (=> (not res!628747) (not e!524093))))

(assert (=> b!933402 (= res!628747 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933403 () Bool)

(assert (=> b!933403 (= e!524093 e!524096)))

(declare-fun res!628752 () Bool)

(assert (=> b!933403 (=> (not res!628752) (not e!524096))))

(assert (=> b!933403 (= res!628752 (validKeyInArray!0 lt!420270))))

(assert (=> b!933403 (= lt!420270 (select (arr!27020 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31947 () Bool)

(declare-fun tp!61296 () Bool)

(declare-fun e!524095 () Bool)

(assert (=> mapNonEmpty!31947 (= mapRes!31947 (and tp!61296 e!524095))))

(declare-fun mapKey!31947 () (_ BitVec 32))

(declare-fun mapRest!31947 () (Array (_ BitVec 32) ValueCell!9581))

(declare-fun mapValue!31947 () ValueCell!9581)

(assert (=> mapNonEmpty!31947 (= (arr!27021 _values!1231) (store mapRest!31947 mapKey!31947 mapValue!31947))))

(declare-fun res!628753 () Bool)

(assert (=> start!79412 (=> (not res!628753) (not e!524098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79412 (= res!628753 (validMask!0 mask!1881))))

(assert (=> start!79412 e!524098))

(assert (=> start!79412 true))

(assert (=> start!79412 tp_is_empty!20125))

(declare-fun array_inv!21100 (array!56153) Bool)

(assert (=> start!79412 (and (array_inv!21100 _values!1231) e!524097)))

(assert (=> start!79412 tp!61295))

(declare-fun array_inv!21101 (array!56151) Bool)

(assert (=> start!79412 (array_inv!21101 _keys!1487)))

(declare-fun b!933404 () Bool)

(declare-fun res!628749 () Bool)

(assert (=> b!933404 (=> (not res!628749) (not e!524098))))

(assert (=> b!933404 (= res!628749 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19063))))

(declare-fun b!933405 () Bool)

(declare-fun res!628748 () Bool)

(assert (=> b!933405 (=> (not res!628748) (not e!524098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56151 (_ BitVec 32)) Bool)

(assert (=> b!933405 (= res!628748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31947 () Bool)

(assert (=> mapIsEmpty!31947 mapRes!31947))

(declare-fun b!933406 () Bool)

(declare-fun res!628750 () Bool)

(assert (=> b!933406 (=> (not res!628750) (not e!524098))))

(assert (=> b!933406 (= res!628750 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27481 _keys!1487))))))

(declare-fun b!933407 () Bool)

(assert (=> b!933407 (= e!524095 tp_is_empty!20125)))

(assert (= (and start!79412 res!628753) b!933397))

(assert (= (and b!933397 res!628746) b!933405))

(assert (= (and b!933405 res!628748) b!933404))

(assert (= (and b!933404 res!628749) b!933406))

(assert (= (and b!933406 res!628750) b!933399))

(assert (= (and b!933399 res!628745) b!933401))

(assert (= (and b!933401 res!628754) b!933402))

(assert (= (and b!933402 res!628747) b!933398))

(assert (= (and b!933398 res!628751) b!933403))

(assert (= (and b!933403 res!628752) b!933396))

(assert (= (and b!933400 condMapEmpty!31947) mapIsEmpty!31947))

(assert (= (and b!933400 (not condMapEmpty!31947)) mapNonEmpty!31947))

(get-info :version)

(assert (= (and mapNonEmpty!31947 ((_ is ValueCellFull!9581) mapValue!31947)) b!933407))

(assert (= (and b!933400 ((_ is ValueCellFull!9581) mapDefault!31947)) b!933395))

(assert (= start!79412 b!933400))

(declare-fun b_lambda!13933 () Bool)

(assert (=> (not b_lambda!13933) (not b!933396)))

(declare-fun t!27217 () Bool)

(declare-fun tb!6003 () Bool)

(assert (=> (and start!79412 (= defaultEntry!1235 defaultEntry!1235) t!27217) tb!6003))

(declare-fun result!11839 () Bool)

(assert (=> tb!6003 (= result!11839 tp_is_empty!20125)))

(assert (=> b!933396 t!27217))

(declare-fun b_and!28769 () Bool)

(assert (= b_and!28767 (and (=> t!27217 result!11839) b_and!28769)))

(declare-fun m!867041 () Bool)

(assert (=> b!933401 m!867041))

(declare-fun m!867043 () Bool)

(assert (=> b!933404 m!867043))

(declare-fun m!867045 () Bool)

(assert (=> b!933399 m!867045))

(declare-fun m!867047 () Bool)

(assert (=> b!933399 m!867047))

(declare-fun m!867049 () Bool)

(assert (=> start!79412 m!867049))

(declare-fun m!867051 () Bool)

(assert (=> start!79412 m!867051))

(declare-fun m!867053 () Bool)

(assert (=> start!79412 m!867053))

(declare-fun m!867055 () Bool)

(assert (=> mapNonEmpty!31947 m!867055))

(declare-fun m!867057 () Bool)

(assert (=> b!933396 m!867057))

(declare-fun m!867059 () Bool)

(assert (=> b!933396 m!867059))

(declare-fun m!867061 () Bool)

(assert (=> b!933396 m!867061))

(declare-fun m!867063 () Bool)

(assert (=> b!933396 m!867063))

(assert (=> b!933396 m!867057))

(assert (=> b!933396 m!867059))

(declare-fun m!867065 () Bool)

(assert (=> b!933396 m!867065))

(declare-fun m!867067 () Bool)

(assert (=> b!933396 m!867067))

(assert (=> b!933396 m!867061))

(declare-fun m!867069 () Bool)

(assert (=> b!933396 m!867069))

(declare-fun m!867071 () Bool)

(assert (=> b!933396 m!867071))

(declare-fun m!867073 () Bool)

(assert (=> b!933396 m!867073))

(declare-fun m!867075 () Bool)

(assert (=> b!933396 m!867075))

(declare-fun m!867077 () Bool)

(assert (=> b!933396 m!867077))

(assert (=> b!933396 m!867073))

(declare-fun m!867079 () Bool)

(assert (=> b!933396 m!867079))

(declare-fun m!867081 () Bool)

(assert (=> b!933405 m!867081))

(declare-fun m!867083 () Bool)

(assert (=> b!933403 m!867083))

(declare-fun m!867085 () Bool)

(assert (=> b!933403 m!867085))

(declare-fun m!867087 () Bool)

(assert (=> b!933398 m!867087))

(check-sat (not b!933398) (not b!933404) (not b!933401) (not mapNonEmpty!31947) (not start!79412) (not b!933396) (not b!933405) (not b_lambda!13933) (not b!933403) tp_is_empty!20125 b_and!28769 (not b!933399) (not b_next!17617))
(check-sat b_and!28769 (not b_next!17617))
