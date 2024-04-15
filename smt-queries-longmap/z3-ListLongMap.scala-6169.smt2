; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79104 () Bool)

(assert start!79104)

(declare-fun b_free!17335 () Bool)

(declare-fun b_next!17335 () Bool)

(assert (=> start!79104 (= b_free!17335 (not b_next!17335))))

(declare-fun tp!60446 () Bool)

(declare-fun b_and!28375 () Bool)

(assert (=> start!79104 (= tp!60446 b_and!28375)))

(declare-fun res!625256 () Bool)

(declare-fun e!521294 () Bool)

(assert (=> start!79104 (=> (not res!625256) (not e!521294))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79104 (= res!625256 (validMask!0 mask!1881))))

(assert (=> start!79104 e!521294))

(assert (=> start!79104 true))

(declare-datatypes ((V!31423 0))(
  ( (V!31424 (val!9972 Int)) )
))
(declare-datatypes ((ValueCell!9440 0))(
  ( (ValueCellFull!9440 (v!12489 V!31423)) (EmptyCell!9440) )
))
(declare-datatypes ((array!55617 0))(
  ( (array!55618 (arr!26754 (Array (_ BitVec 32) ValueCell!9440)) (size!27215 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55617)

(declare-fun e!521291 () Bool)

(declare-fun array_inv!20918 (array!55617) Bool)

(assert (=> start!79104 (and (array_inv!20918 _values!1231) e!521291)))

(assert (=> start!79104 tp!60446))

(declare-datatypes ((array!55619 0))(
  ( (array!55620 (arr!26755 (Array (_ BitVec 32) (_ BitVec 64))) (size!27216 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55619)

(declare-fun array_inv!20919 (array!55619) Bool)

(assert (=> start!79104 (array_inv!20919 _keys!1487)))

(declare-fun tp_is_empty!19843 () Bool)

(assert (=> start!79104 tp_is_empty!19843))

(declare-fun b!928435 () Bool)

(declare-fun e!521292 () Bool)

(assert (=> b!928435 (= e!521292 tp_is_empty!19843)))

(declare-fun b!928436 () Bool)

(declare-fun e!521295 () Bool)

(assert (=> b!928436 (= e!521294 e!521295)))

(declare-fun res!625255 () Bool)

(assert (=> b!928436 (=> (not res!625255) (not e!521295))))

(declare-datatypes ((tuple2!13086 0))(
  ( (tuple2!13087 (_1!6554 (_ BitVec 64)) (_2!6554 V!31423)) )
))
(declare-datatypes ((List!18853 0))(
  ( (Nil!18850) (Cons!18849 (h!19995 tuple2!13086) (t!26901 List!18853)) )
))
(declare-datatypes ((ListLongMap!11773 0))(
  ( (ListLongMap!11774 (toList!5902 List!18853)) )
))
(declare-fun lt!418675 () ListLongMap!11773)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4912 (ListLongMap!11773 (_ BitVec 64)) Bool)

(assert (=> b!928436 (= res!625255 (contains!4912 lt!418675 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31423)

(declare-fun minValue!1173 () V!31423)

(declare-fun getCurrentListMap!3086 (array!55619 array!55617 (_ BitVec 32) (_ BitVec 32) V!31423 V!31423 (_ BitVec 32) Int) ListLongMap!11773)

(assert (=> b!928436 (= lt!418675 (getCurrentListMap!3086 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928437 () Bool)

(declare-fun res!625254 () Bool)

(assert (=> b!928437 (=> (not res!625254) (not e!521294))))

(assert (=> b!928437 (= res!625254 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27216 _keys!1487))))))

(declare-fun mapNonEmpty!31521 () Bool)

(declare-fun mapRes!31521 () Bool)

(declare-fun tp!60447 () Bool)

(declare-fun e!521290 () Bool)

(assert (=> mapNonEmpty!31521 (= mapRes!31521 (and tp!60447 e!521290))))

(declare-fun mapKey!31521 () (_ BitVec 32))

(declare-fun mapRest!31521 () (Array (_ BitVec 32) ValueCell!9440))

(declare-fun mapValue!31521 () ValueCell!9440)

(assert (=> mapNonEmpty!31521 (= (arr!26754 _values!1231) (store mapRest!31521 mapKey!31521 mapValue!31521))))

(declare-fun b!928438 () Bool)

(declare-fun res!625253 () Bool)

(assert (=> b!928438 (=> (not res!625253) (not e!521294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55619 (_ BitVec 32)) Bool)

(assert (=> b!928438 (= res!625253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928439 () Bool)

(assert (=> b!928439 (= e!521295 false)))

(declare-fun lt!418676 () V!31423)

(declare-fun apply!710 (ListLongMap!11773 (_ BitVec 64)) V!31423)

(assert (=> b!928439 (= lt!418676 (apply!710 lt!418675 k0!1099))))

(declare-fun b!928440 () Bool)

(declare-fun res!625251 () Bool)

(assert (=> b!928440 (=> (not res!625251) (not e!521294))))

(declare-datatypes ((List!18854 0))(
  ( (Nil!18851) (Cons!18850 (h!19996 (_ BitVec 64)) (t!26902 List!18854)) )
))
(declare-fun arrayNoDuplicates!0 (array!55619 (_ BitVec 32) List!18854) Bool)

(assert (=> b!928440 (= res!625251 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18851))))

(declare-fun mapIsEmpty!31521 () Bool)

(assert (=> mapIsEmpty!31521 mapRes!31521))

(declare-fun b!928441 () Bool)

(declare-fun res!625252 () Bool)

(assert (=> b!928441 (=> (not res!625252) (not e!521294))))

(assert (=> b!928441 (= res!625252 (and (= (size!27215 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27216 _keys!1487) (size!27215 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928442 () Bool)

(assert (=> b!928442 (= e!521291 (and e!521292 mapRes!31521))))

(declare-fun condMapEmpty!31521 () Bool)

(declare-fun mapDefault!31521 () ValueCell!9440)

(assert (=> b!928442 (= condMapEmpty!31521 (= (arr!26754 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9440)) mapDefault!31521)))))

(declare-fun b!928443 () Bool)

(assert (=> b!928443 (= e!521290 tp_is_empty!19843)))

(assert (= (and start!79104 res!625256) b!928441))

(assert (= (and b!928441 res!625252) b!928438))

(assert (= (and b!928438 res!625253) b!928440))

(assert (= (and b!928440 res!625251) b!928437))

(assert (= (and b!928437 res!625254) b!928436))

(assert (= (and b!928436 res!625255) b!928439))

(assert (= (and b!928442 condMapEmpty!31521) mapIsEmpty!31521))

(assert (= (and b!928442 (not condMapEmpty!31521)) mapNonEmpty!31521))

(get-info :version)

(assert (= (and mapNonEmpty!31521 ((_ is ValueCellFull!9440) mapValue!31521)) b!928443))

(assert (= (and b!928442 ((_ is ValueCellFull!9440) mapDefault!31521)) b!928435))

(assert (= start!79104 b!928442))

(declare-fun m!862741 () Bool)

(assert (=> b!928439 m!862741))

(declare-fun m!862743 () Bool)

(assert (=> mapNonEmpty!31521 m!862743))

(declare-fun m!862745 () Bool)

(assert (=> b!928436 m!862745))

(declare-fun m!862747 () Bool)

(assert (=> b!928436 m!862747))

(declare-fun m!862749 () Bool)

(assert (=> b!928440 m!862749))

(declare-fun m!862751 () Bool)

(assert (=> start!79104 m!862751))

(declare-fun m!862753 () Bool)

(assert (=> start!79104 m!862753))

(declare-fun m!862755 () Bool)

(assert (=> start!79104 m!862755))

(declare-fun m!862757 () Bool)

(assert (=> b!928438 m!862757))

(check-sat (not b_next!17335) (not b!928440) (not b!928438) (not b!928436) (not start!79104) (not mapNonEmpty!31521) (not b!928439) b_and!28375 tp_is_empty!19843)
(check-sat b_and!28375 (not b_next!17335))
