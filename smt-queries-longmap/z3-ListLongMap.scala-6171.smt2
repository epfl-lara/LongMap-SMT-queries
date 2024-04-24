; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79302 () Bool)

(assert start!79302)

(declare-fun b_free!17347 () Bool)

(declare-fun b_next!17347 () Bool)

(assert (=> start!79302 (= b_free!17347 (not b_next!17347))))

(declare-fun tp!60482 () Bool)

(declare-fun b_and!28423 () Bool)

(assert (=> start!79302 (= tp!60482 b_and!28423)))

(declare-fun b!929739 () Bool)

(declare-fun res!625818 () Bool)

(declare-fun e!522128 () Bool)

(assert (=> b!929739 (=> (not res!625818) (not e!522128))))

(declare-datatypes ((array!55723 0))(
  ( (array!55724 (arr!26802 (Array (_ BitVec 32) (_ BitVec 64))) (size!27262 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55723)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31439 0))(
  ( (V!31440 (val!9978 Int)) )
))
(declare-datatypes ((ValueCell!9446 0))(
  ( (ValueCellFull!9446 (v!12493 V!31439)) (EmptyCell!9446) )
))
(declare-datatypes ((array!55725 0))(
  ( (array!55726 (arr!26803 (Array (_ BitVec 32) ValueCell!9446)) (size!27263 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55725)

(assert (=> b!929739 (= res!625818 (and (= (size!27263 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27262 _keys!1487) (size!27263 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929740 () Bool)

(declare-fun res!625817 () Bool)

(assert (=> b!929740 (=> (not res!625817) (not e!522128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55723 (_ BitVec 32)) Bool)

(assert (=> b!929740 (= res!625817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929741 () Bool)

(declare-fun e!522129 () Bool)

(declare-fun e!522133 () Bool)

(declare-fun mapRes!31539 () Bool)

(assert (=> b!929741 (= e!522129 (and e!522133 mapRes!31539))))

(declare-fun condMapEmpty!31539 () Bool)

(declare-fun mapDefault!31539 () ValueCell!9446)

(assert (=> b!929741 (= condMapEmpty!31539 (= (arr!26803 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9446)) mapDefault!31539)))))

(declare-fun b!929742 () Bool)

(declare-fun e!522131 () Bool)

(declare-fun tp_is_empty!19855 () Bool)

(assert (=> b!929742 (= e!522131 tp_is_empty!19855)))

(declare-fun mapNonEmpty!31539 () Bool)

(declare-fun tp!60483 () Bool)

(assert (=> mapNonEmpty!31539 (= mapRes!31539 (and tp!60483 e!522131))))

(declare-fun mapValue!31539 () ValueCell!9446)

(declare-fun mapKey!31539 () (_ BitVec 32))

(declare-fun mapRest!31539 () (Array (_ BitVec 32) ValueCell!9446))

(assert (=> mapNonEmpty!31539 (= (arr!26803 _values!1231) (store mapRest!31539 mapKey!31539 mapValue!31539))))

(declare-fun b!929743 () Bool)

(declare-fun res!625816 () Bool)

(assert (=> b!929743 (=> (not res!625816) (not e!522128))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929743 (= res!625816 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27262 _keys!1487))))))

(declare-fun b!929744 () Bool)

(declare-fun e!522130 () Bool)

(assert (=> b!929744 (= e!522128 e!522130)))

(declare-fun res!625815 () Bool)

(assert (=> b!929744 (=> (not res!625815) (not e!522130))))

(declare-datatypes ((tuple2!13032 0))(
  ( (tuple2!13033 (_1!6527 (_ BitVec 64)) (_2!6527 V!31439)) )
))
(declare-datatypes ((List!18837 0))(
  ( (Nil!18834) (Cons!18833 (h!19985 tuple2!13032) (t!26886 List!18837)) )
))
(declare-datatypes ((ListLongMap!11731 0))(
  ( (ListLongMap!11732 (toList!5881 List!18837)) )
))
(declare-fun lt!419309 () ListLongMap!11731)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4951 (ListLongMap!11731 (_ BitVec 64)) Bool)

(assert (=> b!929744 (= res!625815 (contains!4951 lt!419309 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31439)

(declare-fun minValue!1173 () V!31439)

(declare-fun getCurrentListMap!3129 (array!55723 array!55725 (_ BitVec 32) (_ BitVec 32) V!31439 V!31439 (_ BitVec 32) Int) ListLongMap!11731)

(assert (=> b!929744 (= lt!419309 (getCurrentListMap!3129 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929745 () Bool)

(declare-fun res!625814 () Bool)

(assert (=> b!929745 (=> (not res!625814) (not e!522128))))

(declare-datatypes ((List!18838 0))(
  ( (Nil!18835) (Cons!18834 (h!19986 (_ BitVec 64)) (t!26887 List!18838)) )
))
(declare-fun arrayNoDuplicates!0 (array!55723 (_ BitVec 32) List!18838) Bool)

(assert (=> b!929745 (= res!625814 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18835))))

(declare-fun mapIsEmpty!31539 () Bool)

(assert (=> mapIsEmpty!31539 mapRes!31539))

(declare-fun b!929746 () Bool)

(assert (=> b!929746 (= e!522133 tp_is_empty!19855)))

(declare-fun b!929747 () Bool)

(assert (=> b!929747 (= e!522130 false)))

(declare-fun lt!419308 () V!31439)

(declare-fun apply!729 (ListLongMap!11731 (_ BitVec 64)) V!31439)

(assert (=> b!929747 (= lt!419308 (apply!729 lt!419309 k0!1099))))

(declare-fun res!625813 () Bool)

(assert (=> start!79302 (=> (not res!625813) (not e!522128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79302 (= res!625813 (validMask!0 mask!1881))))

(assert (=> start!79302 e!522128))

(assert (=> start!79302 true))

(declare-fun array_inv!20974 (array!55725) Bool)

(assert (=> start!79302 (and (array_inv!20974 _values!1231) e!522129)))

(assert (=> start!79302 tp!60482))

(declare-fun array_inv!20975 (array!55723) Bool)

(assert (=> start!79302 (array_inv!20975 _keys!1487)))

(assert (=> start!79302 tp_is_empty!19855))

(assert (= (and start!79302 res!625813) b!929739))

(assert (= (and b!929739 res!625818) b!929740))

(assert (= (and b!929740 res!625817) b!929745))

(assert (= (and b!929745 res!625814) b!929743))

(assert (= (and b!929743 res!625816) b!929744))

(assert (= (and b!929744 res!625815) b!929747))

(assert (= (and b!929741 condMapEmpty!31539) mapIsEmpty!31539))

(assert (= (and b!929741 (not condMapEmpty!31539)) mapNonEmpty!31539))

(get-info :version)

(assert (= (and mapNonEmpty!31539 ((_ is ValueCellFull!9446) mapValue!31539)) b!929742))

(assert (= (and b!929741 ((_ is ValueCellFull!9446) mapDefault!31539)) b!929746))

(assert (= start!79302 b!929741))

(declare-fun m!864901 () Bool)

(assert (=> b!929740 m!864901))

(declare-fun m!864903 () Bool)

(assert (=> b!929744 m!864903))

(declare-fun m!864905 () Bool)

(assert (=> b!929744 m!864905))

(declare-fun m!864907 () Bool)

(assert (=> b!929747 m!864907))

(declare-fun m!864909 () Bool)

(assert (=> mapNonEmpty!31539 m!864909))

(declare-fun m!864911 () Bool)

(assert (=> b!929745 m!864911))

(declare-fun m!864913 () Bool)

(assert (=> start!79302 m!864913))

(declare-fun m!864915 () Bool)

(assert (=> start!79302 m!864915))

(declare-fun m!864917 () Bool)

(assert (=> start!79302 m!864917))

(check-sat (not start!79302) b_and!28423 (not mapNonEmpty!31539) tp_is_empty!19855 (not b!929745) (not b_next!17347) (not b!929740) (not b!929747) (not b!929744))
(check-sat b_and!28423 (not b_next!17347))
