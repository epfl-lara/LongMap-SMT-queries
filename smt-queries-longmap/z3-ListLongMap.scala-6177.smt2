; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79338 () Bool)

(assert start!79338)

(declare-fun b_free!17383 () Bool)

(declare-fun b_next!17383 () Bool)

(assert (=> start!79338 (= b_free!17383 (not b_next!17383))))

(declare-fun tp!60590 () Bool)

(declare-fun b_and!28459 () Bool)

(assert (=> start!79338 (= tp!60590 b_and!28459)))

(declare-fun b!930238 () Bool)

(declare-fun e!522454 () Bool)

(declare-fun e!522452 () Bool)

(assert (=> b!930238 (= e!522454 e!522452)))

(declare-fun res!626150 () Bool)

(assert (=> b!930238 (=> (not res!626150) (not e!522452))))

(declare-datatypes ((V!31487 0))(
  ( (V!31488 (val!9996 Int)) )
))
(declare-datatypes ((tuple2!13058 0))(
  ( (tuple2!13059 (_1!6540 (_ BitVec 64)) (_2!6540 V!31487)) )
))
(declare-datatypes ((List!18860 0))(
  ( (Nil!18857) (Cons!18856 (h!20008 tuple2!13058) (t!26909 List!18860)) )
))
(declare-datatypes ((ListLongMap!11757 0))(
  ( (ListLongMap!11758 (toList!5894 List!18860)) )
))
(declare-fun lt!419407 () ListLongMap!11757)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4964 (ListLongMap!11757 (_ BitVec 64)) Bool)

(assert (=> b!930238 (= res!626150 (contains!4964 lt!419407 k0!1099))))

(declare-datatypes ((array!55791 0))(
  ( (array!55792 (arr!26836 (Array (_ BitVec 32) (_ BitVec 64))) (size!27296 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55791)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9464 0))(
  ( (ValueCellFull!9464 (v!12511 V!31487)) (EmptyCell!9464) )
))
(declare-datatypes ((array!55793 0))(
  ( (array!55794 (arr!26837 (Array (_ BitVec 32) ValueCell!9464)) (size!27297 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55793)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31487)

(declare-fun minValue!1173 () V!31487)

(declare-fun getCurrentListMap!3142 (array!55791 array!55793 (_ BitVec 32) (_ BitVec 32) V!31487 V!31487 (_ BitVec 32) Int) ListLongMap!11757)

(assert (=> b!930238 (= lt!419407 (getCurrentListMap!3142 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930239 () Bool)

(declare-fun res!626151 () Bool)

(assert (=> b!930239 (=> (not res!626151) (not e!522454))))

(assert (=> b!930239 (= res!626151 (and (= (size!27297 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27296 _keys!1487) (size!27297 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930240 () Bool)

(assert (=> b!930240 (= e!522452 false)))

(declare-fun lt!419408 () Bool)

(assert (=> b!930240 (= lt!419408 (contains!4964 (getCurrentListMap!3142 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!930241 () Bool)

(declare-fun res!626155 () Bool)

(assert (=> b!930241 (=> (not res!626155) (not e!522452))))

(assert (=> b!930241 (= res!626155 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930242 () Bool)

(declare-fun e!522455 () Bool)

(declare-fun tp_is_empty!19891 () Bool)

(assert (=> b!930242 (= e!522455 tp_is_empty!19891)))

(declare-fun res!626153 () Bool)

(assert (=> start!79338 (=> (not res!626153) (not e!522454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79338 (= res!626153 (validMask!0 mask!1881))))

(assert (=> start!79338 e!522454))

(assert (=> start!79338 true))

(assert (=> start!79338 tp_is_empty!19891))

(declare-fun e!522456 () Bool)

(declare-fun array_inv!20996 (array!55793) Bool)

(assert (=> start!79338 (and (array_inv!20996 _values!1231) e!522456)))

(assert (=> start!79338 tp!60590))

(declare-fun array_inv!20997 (array!55791) Bool)

(assert (=> start!79338 (array_inv!20997 _keys!1487)))

(declare-fun b!930243 () Bool)

(declare-fun res!626157 () Bool)

(assert (=> b!930243 (=> (not res!626157) (not e!522454))))

(declare-datatypes ((List!18861 0))(
  ( (Nil!18858) (Cons!18857 (h!20009 (_ BitVec 64)) (t!26910 List!18861)) )
))
(declare-fun arrayNoDuplicates!0 (array!55791 (_ BitVec 32) List!18861) Bool)

(assert (=> b!930243 (= res!626157 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18858))))

(declare-fun b!930244 () Bool)

(declare-fun e!522457 () Bool)

(declare-fun mapRes!31593 () Bool)

(assert (=> b!930244 (= e!522456 (and e!522457 mapRes!31593))))

(declare-fun condMapEmpty!31593 () Bool)

(declare-fun mapDefault!31593 () ValueCell!9464)

(assert (=> b!930244 (= condMapEmpty!31593 (= (arr!26837 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9464)) mapDefault!31593)))))

(declare-fun b!930245 () Bool)

(declare-fun res!626156 () Bool)

(assert (=> b!930245 (=> (not res!626156) (not e!522452))))

(declare-fun v!791 () V!31487)

(declare-fun apply!739 (ListLongMap!11757 (_ BitVec 64)) V!31487)

(assert (=> b!930245 (= res!626156 (= (apply!739 lt!419407 k0!1099) v!791))))

(declare-fun b!930246 () Bool)

(declare-fun res!626152 () Bool)

(assert (=> b!930246 (=> (not res!626152) (not e!522454))))

(assert (=> b!930246 (= res!626152 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27296 _keys!1487))))))

(declare-fun mapIsEmpty!31593 () Bool)

(assert (=> mapIsEmpty!31593 mapRes!31593))

(declare-fun b!930247 () Bool)

(assert (=> b!930247 (= e!522457 tp_is_empty!19891)))

(declare-fun b!930248 () Bool)

(declare-fun res!626154 () Bool)

(assert (=> b!930248 (=> (not res!626154) (not e!522454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55791 (_ BitVec 32)) Bool)

(assert (=> b!930248 (= res!626154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31593 () Bool)

(declare-fun tp!60591 () Bool)

(assert (=> mapNonEmpty!31593 (= mapRes!31593 (and tp!60591 e!522455))))

(declare-fun mapValue!31593 () ValueCell!9464)

(declare-fun mapRest!31593 () (Array (_ BitVec 32) ValueCell!9464))

(declare-fun mapKey!31593 () (_ BitVec 32))

(assert (=> mapNonEmpty!31593 (= (arr!26837 _values!1231) (store mapRest!31593 mapKey!31593 mapValue!31593))))

(assert (= (and start!79338 res!626153) b!930239))

(assert (= (and b!930239 res!626151) b!930248))

(assert (= (and b!930248 res!626154) b!930243))

(assert (= (and b!930243 res!626157) b!930246))

(assert (= (and b!930246 res!626152) b!930238))

(assert (= (and b!930238 res!626150) b!930245))

(assert (= (and b!930245 res!626156) b!930241))

(assert (= (and b!930241 res!626155) b!930240))

(assert (= (and b!930244 condMapEmpty!31593) mapIsEmpty!31593))

(assert (= (and b!930244 (not condMapEmpty!31593)) mapNonEmpty!31593))

(get-info :version)

(assert (= (and mapNonEmpty!31593 ((_ is ValueCellFull!9464) mapValue!31593)) b!930242))

(assert (= (and b!930244 ((_ is ValueCellFull!9464) mapDefault!31593)) b!930247))

(assert (= start!79338 b!930244))

(declare-fun m!865225 () Bool)

(assert (=> b!930248 m!865225))

(declare-fun m!865227 () Bool)

(assert (=> b!930243 m!865227))

(declare-fun m!865229 () Bool)

(assert (=> b!930245 m!865229))

(declare-fun m!865231 () Bool)

(assert (=> start!79338 m!865231))

(declare-fun m!865233 () Bool)

(assert (=> start!79338 m!865233))

(declare-fun m!865235 () Bool)

(assert (=> start!79338 m!865235))

(declare-fun m!865237 () Bool)

(assert (=> b!930238 m!865237))

(declare-fun m!865239 () Bool)

(assert (=> b!930238 m!865239))

(declare-fun m!865241 () Bool)

(assert (=> mapNonEmpty!31593 m!865241))

(declare-fun m!865243 () Bool)

(assert (=> b!930240 m!865243))

(assert (=> b!930240 m!865243))

(declare-fun m!865245 () Bool)

(assert (=> b!930240 m!865245))

(check-sat tp_is_empty!19891 (not b!930243) (not b!930240) (not b!930238) (not b!930248) (not mapNonEmpty!31593) (not b!930245) (not b_next!17383) b_and!28459 (not start!79338))
(check-sat b_and!28459 (not b_next!17383))
