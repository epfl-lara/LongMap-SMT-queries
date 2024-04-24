; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79290 () Bool)

(assert start!79290)

(declare-fun b_free!17335 () Bool)

(declare-fun b_next!17335 () Bool)

(assert (=> start!79290 (= b_free!17335 (not b_next!17335))))

(declare-fun tp!60447 () Bool)

(declare-fun b_and!28411 () Bool)

(assert (=> start!79290 (= tp!60447 b_and!28411)))

(declare-fun b!929577 () Bool)

(declare-fun e!522020 () Bool)

(declare-fun e!522024 () Bool)

(assert (=> b!929577 (= e!522020 e!522024)))

(declare-fun res!625705 () Bool)

(assert (=> b!929577 (=> (not res!625705) (not e!522024))))

(declare-datatypes ((V!31423 0))(
  ( (V!31424 (val!9972 Int)) )
))
(declare-datatypes ((tuple2!13020 0))(
  ( (tuple2!13021 (_1!6521 (_ BitVec 64)) (_2!6521 V!31423)) )
))
(declare-datatypes ((List!18826 0))(
  ( (Nil!18823) (Cons!18822 (h!19974 tuple2!13020) (t!26875 List!18826)) )
))
(declare-datatypes ((ListLongMap!11719 0))(
  ( (ListLongMap!11720 (toList!5875 List!18826)) )
))
(declare-fun lt!419273 () ListLongMap!11719)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4946 (ListLongMap!11719 (_ BitVec 64)) Bool)

(assert (=> b!929577 (= res!625705 (contains!4946 lt!419273 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9440 0))(
  ( (ValueCellFull!9440 (v!12487 V!31423)) (EmptyCell!9440) )
))
(declare-datatypes ((array!55699 0))(
  ( (array!55700 (arr!26790 (Array (_ BitVec 32) ValueCell!9440)) (size!27250 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55699)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((array!55701 0))(
  ( (array!55702 (arr!26791 (Array (_ BitVec 32) (_ BitVec 64))) (size!27251 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55701)

(declare-fun zeroValue!1173 () V!31423)

(declare-fun minValue!1173 () V!31423)

(declare-fun getCurrentListMap!3124 (array!55701 array!55699 (_ BitVec 32) (_ BitVec 32) V!31423 V!31423 (_ BitVec 32) Int) ListLongMap!11719)

(assert (=> b!929577 (= lt!419273 (getCurrentListMap!3124 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31521 () Bool)

(declare-fun mapRes!31521 () Bool)

(assert (=> mapIsEmpty!31521 mapRes!31521))

(declare-fun b!929578 () Bool)

(declare-fun res!625708 () Bool)

(assert (=> b!929578 (=> (not res!625708) (not e!522020))))

(assert (=> b!929578 (= res!625708 (and (= (size!27250 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27251 _keys!1487) (size!27250 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929579 () Bool)

(declare-fun e!522025 () Bool)

(declare-fun tp_is_empty!19843 () Bool)

(assert (=> b!929579 (= e!522025 tp_is_empty!19843)))

(declare-fun b!929580 () Bool)

(declare-fun e!522023 () Bool)

(assert (=> b!929580 (= e!522023 (and e!522025 mapRes!31521))))

(declare-fun condMapEmpty!31521 () Bool)

(declare-fun mapDefault!31521 () ValueCell!9440)

(assert (=> b!929580 (= condMapEmpty!31521 (= (arr!26790 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9440)) mapDefault!31521)))))

(declare-fun mapNonEmpty!31521 () Bool)

(declare-fun tp!60446 () Bool)

(declare-fun e!522022 () Bool)

(assert (=> mapNonEmpty!31521 (= mapRes!31521 (and tp!60446 e!522022))))

(declare-fun mapRest!31521 () (Array (_ BitVec 32) ValueCell!9440))

(declare-fun mapKey!31521 () (_ BitVec 32))

(declare-fun mapValue!31521 () ValueCell!9440)

(assert (=> mapNonEmpty!31521 (= (arr!26790 _values!1231) (store mapRest!31521 mapKey!31521 mapValue!31521))))

(declare-fun b!929581 () Bool)

(declare-fun res!625709 () Bool)

(assert (=> b!929581 (=> (not res!625709) (not e!522020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55701 (_ BitVec 32)) Bool)

(assert (=> b!929581 (= res!625709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929582 () Bool)

(declare-fun res!625710 () Bool)

(assert (=> b!929582 (=> (not res!625710) (not e!522020))))

(assert (=> b!929582 (= res!625710 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27251 _keys!1487))))))

(declare-fun b!929583 () Bool)

(declare-fun res!625706 () Bool)

(assert (=> b!929583 (=> (not res!625706) (not e!522020))))

(declare-datatypes ((List!18827 0))(
  ( (Nil!18824) (Cons!18823 (h!19975 (_ BitVec 64)) (t!26876 List!18827)) )
))
(declare-fun arrayNoDuplicates!0 (array!55701 (_ BitVec 32) List!18827) Bool)

(assert (=> b!929583 (= res!625706 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18824))))

(declare-fun b!929584 () Bool)

(assert (=> b!929584 (= e!522022 tp_is_empty!19843)))

(declare-fun res!625707 () Bool)

(assert (=> start!79290 (=> (not res!625707) (not e!522020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79290 (= res!625707 (validMask!0 mask!1881))))

(assert (=> start!79290 e!522020))

(assert (=> start!79290 true))

(declare-fun array_inv!20964 (array!55699) Bool)

(assert (=> start!79290 (and (array_inv!20964 _values!1231) e!522023)))

(assert (=> start!79290 tp!60447))

(declare-fun array_inv!20965 (array!55701) Bool)

(assert (=> start!79290 (array_inv!20965 _keys!1487)))

(assert (=> start!79290 tp_is_empty!19843))

(declare-fun b!929585 () Bool)

(assert (=> b!929585 (= e!522024 false)))

(declare-fun lt!419272 () V!31423)

(declare-fun apply!725 (ListLongMap!11719 (_ BitVec 64)) V!31423)

(assert (=> b!929585 (= lt!419272 (apply!725 lt!419273 k0!1099))))

(assert (= (and start!79290 res!625707) b!929578))

(assert (= (and b!929578 res!625708) b!929581))

(assert (= (and b!929581 res!625709) b!929583))

(assert (= (and b!929583 res!625706) b!929582))

(assert (= (and b!929582 res!625710) b!929577))

(assert (= (and b!929577 res!625705) b!929585))

(assert (= (and b!929580 condMapEmpty!31521) mapIsEmpty!31521))

(assert (= (and b!929580 (not condMapEmpty!31521)) mapNonEmpty!31521))

(get-info :version)

(assert (= (and mapNonEmpty!31521 ((_ is ValueCellFull!9440) mapValue!31521)) b!929584))

(assert (= (and b!929580 ((_ is ValueCellFull!9440) mapDefault!31521)) b!929579))

(assert (= start!79290 b!929580))

(declare-fun m!864793 () Bool)

(assert (=> mapNonEmpty!31521 m!864793))

(declare-fun m!864795 () Bool)

(assert (=> b!929577 m!864795))

(declare-fun m!864797 () Bool)

(assert (=> b!929577 m!864797))

(declare-fun m!864799 () Bool)

(assert (=> b!929583 m!864799))

(declare-fun m!864801 () Bool)

(assert (=> b!929581 m!864801))

(declare-fun m!864803 () Bool)

(assert (=> start!79290 m!864803))

(declare-fun m!864805 () Bool)

(assert (=> start!79290 m!864805))

(declare-fun m!864807 () Bool)

(assert (=> start!79290 m!864807))

(declare-fun m!864809 () Bool)

(assert (=> b!929585 m!864809))

(check-sat (not mapNonEmpty!31521) (not b!929581) b_and!28411 (not start!79290) (not b!929577) (not b!929583) tp_is_empty!19843 (not b_next!17335) (not b!929585))
(check-sat b_and!28411 (not b_next!17335))
