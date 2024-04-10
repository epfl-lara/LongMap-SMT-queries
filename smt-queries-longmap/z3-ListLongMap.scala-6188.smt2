; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79238 () Bool)

(assert start!79238)

(declare-fun b_free!17451 () Bool)

(declare-fun b_next!17451 () Bool)

(assert (=> start!79238 (= b_free!17451 (not b_next!17451))))

(declare-fun tp!60794 () Bool)

(declare-fun b_and!28517 () Bool)

(assert (=> start!79238 (= tp!60794 b_and!28517)))

(declare-fun b!930453 () Bool)

(declare-fun e!522482 () Bool)

(declare-fun e!522485 () Bool)

(assert (=> b!930453 (= e!522482 e!522485)))

(declare-fun res!626623 () Bool)

(assert (=> b!930453 (=> (not res!626623) (not e!522485))))

(declare-datatypes ((V!31577 0))(
  ( (V!31578 (val!10030 Int)) )
))
(declare-datatypes ((tuple2!13124 0))(
  ( (tuple2!13125 (_1!6573 (_ BitVec 64)) (_2!6573 V!31577)) )
))
(declare-datatypes ((List!18916 0))(
  ( (Nil!18913) (Cons!18912 (h!20058 tuple2!13124) (t!26973 List!18916)) )
))
(declare-datatypes ((ListLongMap!11821 0))(
  ( (ListLongMap!11822 (toList!5926 List!18916)) )
))
(declare-fun lt!419236 () ListLongMap!11821)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4977 (ListLongMap!11821 (_ BitVec 64)) Bool)

(assert (=> b!930453 (= res!626623 (contains!4977 lt!419236 k0!1099))))

(declare-datatypes ((array!55864 0))(
  ( (array!55865 (arr!26877 (Array (_ BitVec 32) (_ BitVec 64))) (size!27336 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55864)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9498 0))(
  ( (ValueCellFull!9498 (v!12548 V!31577)) (EmptyCell!9498) )
))
(declare-datatypes ((array!55866 0))(
  ( (array!55867 (arr!26878 (Array (_ BitVec 32) ValueCell!9498)) (size!27337 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55866)

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31577)

(declare-fun minValue!1173 () V!31577)

(declare-fun getCurrentListMap!3168 (array!55864 array!55866 (_ BitVec 32) (_ BitVec 32) V!31577 V!31577 (_ BitVec 32) Int) ListLongMap!11821)

(assert (=> b!930453 (= lt!419236 (getCurrentListMap!3168 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930454 () Bool)

(declare-fun res!626620 () Bool)

(assert (=> b!930454 (=> (not res!626620) (not e!522482))))

(declare-datatypes ((List!18917 0))(
  ( (Nil!18914) (Cons!18913 (h!20059 (_ BitVec 64)) (t!26974 List!18917)) )
))
(declare-fun arrayNoDuplicates!0 (array!55864 (_ BitVec 32) List!18917) Bool)

(assert (=> b!930454 (= res!626620 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18914))))

(declare-fun b!930455 () Bool)

(declare-fun res!626626 () Bool)

(assert (=> b!930455 (=> (not res!626626) (not e!522485))))

(declare-fun v!791 () V!31577)

(declare-fun apply!748 (ListLongMap!11821 (_ BitVec 64)) V!31577)

(assert (=> b!930455 (= res!626626 (= (apply!748 lt!419236 k0!1099) v!791))))

(declare-fun mapNonEmpty!31695 () Bool)

(declare-fun mapRes!31695 () Bool)

(declare-fun tp!60793 () Bool)

(declare-fun e!522486 () Bool)

(assert (=> mapNonEmpty!31695 (= mapRes!31695 (and tp!60793 e!522486))))

(declare-fun mapRest!31695 () (Array (_ BitVec 32) ValueCell!9498))

(declare-fun mapValue!31695 () ValueCell!9498)

(declare-fun mapKey!31695 () (_ BitVec 32))

(assert (=> mapNonEmpty!31695 (= (arr!26878 _values!1231) (store mapRest!31695 mapKey!31695 mapValue!31695))))

(declare-fun res!626619 () Bool)

(assert (=> start!79238 (=> (not res!626619) (not e!522482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79238 (= res!626619 (validMask!0 mask!1881))))

(assert (=> start!79238 e!522482))

(assert (=> start!79238 true))

(declare-fun tp_is_empty!19959 () Bool)

(assert (=> start!79238 tp_is_empty!19959))

(declare-fun e!522483 () Bool)

(declare-fun array_inv!20918 (array!55866) Bool)

(assert (=> start!79238 (and (array_inv!20918 _values!1231) e!522483)))

(assert (=> start!79238 tp!60794))

(declare-fun array_inv!20919 (array!55864) Bool)

(assert (=> start!79238 (array_inv!20919 _keys!1487)))

(declare-fun b!930456 () Bool)

(declare-fun res!626622 () Bool)

(assert (=> b!930456 (=> (not res!626622) (not e!522482))))

(assert (=> b!930456 (= res!626622 (and (= (size!27337 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27336 _keys!1487) (size!27337 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930457 () Bool)

(declare-fun res!626625 () Bool)

(assert (=> b!930457 (=> (not res!626625) (not e!522485))))

(assert (=> b!930457 (= res!626625 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930458 () Bool)

(assert (=> b!930458 (= e!522485 (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27336 _keys!1487)))))

(declare-fun b!930459 () Bool)

(declare-fun e!522484 () Bool)

(assert (=> b!930459 (= e!522484 tp_is_empty!19959)))

(declare-fun b!930460 () Bool)

(assert (=> b!930460 (= e!522483 (and e!522484 mapRes!31695))))

(declare-fun condMapEmpty!31695 () Bool)

(declare-fun mapDefault!31695 () ValueCell!9498)

(assert (=> b!930460 (= condMapEmpty!31695 (= (arr!26878 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9498)) mapDefault!31695)))))

(declare-fun b!930461 () Bool)

(assert (=> b!930461 (= e!522486 tp_is_empty!19959)))

(declare-fun mapIsEmpty!31695 () Bool)

(assert (=> mapIsEmpty!31695 mapRes!31695))

(declare-fun b!930462 () Bool)

(declare-fun res!626618 () Bool)

(assert (=> b!930462 (=> (not res!626618) (not e!522482))))

(assert (=> b!930462 (= res!626618 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27336 _keys!1487))))))

(declare-fun b!930463 () Bool)

(declare-fun res!626621 () Bool)

(assert (=> b!930463 (=> (not res!626621) (not e!522482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55864 (_ BitVec 32)) Bool)

(assert (=> b!930463 (= res!626621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930464 () Bool)

(declare-fun res!626624 () Bool)

(assert (=> b!930464 (=> (not res!626624) (not e!522485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!930464 (= res!626624 (validKeyInArray!0 k0!1099))))

(assert (= (and start!79238 res!626619) b!930456))

(assert (= (and b!930456 res!626622) b!930463))

(assert (= (and b!930463 res!626621) b!930454))

(assert (= (and b!930454 res!626620) b!930462))

(assert (= (and b!930462 res!626618) b!930453))

(assert (= (and b!930453 res!626623) b!930455))

(assert (= (and b!930455 res!626626) b!930457))

(assert (= (and b!930457 res!626625) b!930464))

(assert (= (and b!930464 res!626624) b!930458))

(assert (= (and b!930460 condMapEmpty!31695) mapIsEmpty!31695))

(assert (= (and b!930460 (not condMapEmpty!31695)) mapNonEmpty!31695))

(get-info :version)

(assert (= (and mapNonEmpty!31695 ((_ is ValueCellFull!9498) mapValue!31695)) b!930461))

(assert (= (and b!930460 ((_ is ValueCellFull!9498) mapDefault!31695)) b!930459))

(assert (= start!79238 b!930460))

(declare-fun m!864665 () Bool)

(assert (=> b!930463 m!864665))

(declare-fun m!864667 () Bool)

(assert (=> start!79238 m!864667))

(declare-fun m!864669 () Bool)

(assert (=> start!79238 m!864669))

(declare-fun m!864671 () Bool)

(assert (=> start!79238 m!864671))

(declare-fun m!864673 () Bool)

(assert (=> b!930453 m!864673))

(declare-fun m!864675 () Bool)

(assert (=> b!930453 m!864675))

(declare-fun m!864677 () Bool)

(assert (=> b!930454 m!864677))

(declare-fun m!864679 () Bool)

(assert (=> b!930464 m!864679))

(declare-fun m!864681 () Bool)

(assert (=> b!930455 m!864681))

(declare-fun m!864683 () Bool)

(assert (=> mapNonEmpty!31695 m!864683))

(check-sat (not b_next!17451) (not b!930453) (not b!930455) (not b!930464) tp_is_empty!19959 (not b!930454) (not mapNonEmpty!31695) b_and!28517 (not b!930463) (not start!79238))
(check-sat b_and!28517 (not b_next!17451))
