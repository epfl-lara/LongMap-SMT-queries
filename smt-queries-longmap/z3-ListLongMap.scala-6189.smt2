; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79224 () Bool)

(assert start!79224)

(declare-fun b_free!17455 () Bool)

(declare-fun b_next!17455 () Bool)

(assert (=> start!79224 (= b_free!17455 (not b_next!17455))))

(declare-fun tp!60807 () Bool)

(declare-fun b_and!28495 () Bool)

(assert (=> start!79224 (= tp!60807 b_and!28495)))

(declare-fun b!930280 () Bool)

(declare-fun e!522374 () Bool)

(declare-fun e!522371 () Bool)

(declare-fun mapRes!31701 () Bool)

(assert (=> b!930280 (= e!522374 (and e!522371 mapRes!31701))))

(declare-fun condMapEmpty!31701 () Bool)

(declare-datatypes ((V!31583 0))(
  ( (V!31584 (val!10032 Int)) )
))
(declare-datatypes ((ValueCell!9500 0))(
  ( (ValueCellFull!9500 (v!12549 V!31583)) (EmptyCell!9500) )
))
(declare-datatypes ((array!55839 0))(
  ( (array!55840 (arr!26865 (Array (_ BitVec 32) ValueCell!9500)) (size!27326 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55839)

(declare-fun mapDefault!31701 () ValueCell!9500)

(assert (=> b!930280 (= condMapEmpty!31701 (= (arr!26865 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9500)) mapDefault!31701)))))

(declare-fun b!930281 () Bool)

(declare-fun e!522373 () Bool)

(assert (=> b!930281 (= e!522373 false)))

(declare-fun lt!419008 () V!31583)

(declare-datatypes ((tuple2!13180 0))(
  ( (tuple2!13181 (_1!6601 (_ BitVec 64)) (_2!6601 V!31583)) )
))
(declare-datatypes ((List!18935 0))(
  ( (Nil!18932) (Cons!18931 (h!20077 tuple2!13180) (t!26983 List!18935)) )
))
(declare-datatypes ((ListLongMap!11867 0))(
  ( (ListLongMap!11868 (toList!5949 List!18935)) )
))
(declare-fun lt!419009 () ListLongMap!11867)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!746 (ListLongMap!11867 (_ BitVec 64)) V!31583)

(assert (=> b!930281 (= lt!419008 (apply!746 lt!419009 k0!1099))))

(declare-fun b!930282 () Bool)

(declare-fun res!626560 () Bool)

(declare-fun e!522375 () Bool)

(assert (=> b!930282 (=> (not res!626560) (not e!522375))))

(declare-datatypes ((array!55841 0))(
  ( (array!55842 (arr!26866 (Array (_ BitVec 32) (_ BitVec 64))) (size!27327 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55841)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55841 (_ BitVec 32)) Bool)

(assert (=> b!930282 (= res!626560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31701 () Bool)

(declare-fun tp!60806 () Bool)

(declare-fun e!522372 () Bool)

(assert (=> mapNonEmpty!31701 (= mapRes!31701 (and tp!60806 e!522372))))

(declare-fun mapRest!31701 () (Array (_ BitVec 32) ValueCell!9500))

(declare-fun mapValue!31701 () ValueCell!9500)

(declare-fun mapKey!31701 () (_ BitVec 32))

(assert (=> mapNonEmpty!31701 (= (arr!26865 _values!1231) (store mapRest!31701 mapKey!31701 mapValue!31701))))

(declare-fun b!930283 () Bool)

(declare-fun tp_is_empty!19963 () Bool)

(assert (=> b!930283 (= e!522371 tp_is_empty!19963)))

(declare-fun mapIsEmpty!31701 () Bool)

(assert (=> mapIsEmpty!31701 mapRes!31701))

(declare-fun b!930284 () Bool)

(declare-fun res!626559 () Bool)

(assert (=> b!930284 (=> (not res!626559) (not e!522375))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930284 (= res!626559 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27327 _keys!1487))))))

(declare-fun b!930286 () Bool)

(declare-fun res!626556 () Bool)

(assert (=> b!930286 (=> (not res!626556) (not e!522375))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930286 (= res!626556 (and (= (size!27326 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27327 _keys!1487) (size!27326 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930287 () Bool)

(assert (=> b!930287 (= e!522372 tp_is_empty!19963)))

(declare-fun b!930288 () Bool)

(assert (=> b!930288 (= e!522375 e!522373)))

(declare-fun res!626557 () Bool)

(assert (=> b!930288 (=> (not res!626557) (not e!522373))))

(declare-fun contains!4953 (ListLongMap!11867 (_ BitVec 64)) Bool)

(assert (=> b!930288 (= res!626557 (contains!4953 lt!419009 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31583)

(declare-fun minValue!1173 () V!31583)

(declare-fun getCurrentListMap!3127 (array!55841 array!55839 (_ BitVec 32) (_ BitVec 32) V!31583 V!31583 (_ BitVec 32) Int) ListLongMap!11867)

(assert (=> b!930288 (= lt!419009 (getCurrentListMap!3127 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!626561 () Bool)

(assert (=> start!79224 (=> (not res!626561) (not e!522375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79224 (= res!626561 (validMask!0 mask!1881))))

(assert (=> start!79224 e!522375))

(assert (=> start!79224 true))

(declare-fun array_inv!20984 (array!55839) Bool)

(assert (=> start!79224 (and (array_inv!20984 _values!1231) e!522374)))

(assert (=> start!79224 tp!60807))

(declare-fun array_inv!20985 (array!55841) Bool)

(assert (=> start!79224 (array_inv!20985 _keys!1487)))

(assert (=> start!79224 tp_is_empty!19963))

(declare-fun b!930285 () Bool)

(declare-fun res!626558 () Bool)

(assert (=> b!930285 (=> (not res!626558) (not e!522375))))

(declare-datatypes ((List!18936 0))(
  ( (Nil!18933) (Cons!18932 (h!20078 (_ BitVec 64)) (t!26984 List!18936)) )
))
(declare-fun arrayNoDuplicates!0 (array!55841 (_ BitVec 32) List!18936) Bool)

(assert (=> b!930285 (= res!626558 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18933))))

(assert (= (and start!79224 res!626561) b!930286))

(assert (= (and b!930286 res!626556) b!930282))

(assert (= (and b!930282 res!626560) b!930285))

(assert (= (and b!930285 res!626558) b!930284))

(assert (= (and b!930284 res!626559) b!930288))

(assert (= (and b!930288 res!626557) b!930281))

(assert (= (and b!930280 condMapEmpty!31701) mapIsEmpty!31701))

(assert (= (and b!930280 (not condMapEmpty!31701)) mapNonEmpty!31701))

(get-info :version)

(assert (= (and mapNonEmpty!31701 ((_ is ValueCellFull!9500) mapValue!31701)) b!930287))

(assert (= (and b!930280 ((_ is ValueCellFull!9500) mapDefault!31701)) b!930283))

(assert (= start!79224 b!930280))

(declare-fun m!863947 () Bool)

(assert (=> b!930282 m!863947))

(declare-fun m!863949 () Bool)

(assert (=> b!930281 m!863949))

(declare-fun m!863951 () Bool)

(assert (=> b!930285 m!863951))

(declare-fun m!863953 () Bool)

(assert (=> b!930288 m!863953))

(declare-fun m!863955 () Bool)

(assert (=> b!930288 m!863955))

(declare-fun m!863957 () Bool)

(assert (=> start!79224 m!863957))

(declare-fun m!863959 () Bool)

(assert (=> start!79224 m!863959))

(declare-fun m!863961 () Bool)

(assert (=> start!79224 m!863961))

(declare-fun m!863963 () Bool)

(assert (=> mapNonEmpty!31701 m!863963))

(check-sat (not b!930282) (not b!930285) (not b_next!17455) (not b!930281) (not start!79224) tp_is_empty!19963 b_and!28495 (not b!930288) (not mapNonEmpty!31701))
(check-sat b_and!28495 (not b_next!17455))
