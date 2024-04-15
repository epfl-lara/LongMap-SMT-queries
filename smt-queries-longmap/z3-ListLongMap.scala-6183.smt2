; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79188 () Bool)

(assert start!79188)

(declare-fun b_free!17419 () Bool)

(declare-fun b_next!17419 () Bool)

(assert (=> start!79188 (= b_free!17419 (not b_next!17419))))

(declare-fun tp!60698 () Bool)

(declare-fun b_and!28459 () Bool)

(assert (=> start!79188 (= tp!60698 b_and!28459)))

(declare-fun mapNonEmpty!31647 () Bool)

(declare-fun mapRes!31647 () Bool)

(declare-fun tp!60699 () Bool)

(declare-fun e!522049 () Bool)

(assert (=> mapNonEmpty!31647 (= mapRes!31647 (and tp!60699 e!522049))))

(declare-datatypes ((V!31535 0))(
  ( (V!31536 (val!10014 Int)) )
))
(declare-datatypes ((ValueCell!9482 0))(
  ( (ValueCellFull!9482 (v!12531 V!31535)) (EmptyCell!9482) )
))
(declare-fun mapRest!31647 () (Array (_ BitVec 32) ValueCell!9482))

(declare-datatypes ((array!55771 0))(
  ( (array!55772 (arr!26831 (Array (_ BitVec 32) ValueCell!9482)) (size!27292 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55771)

(declare-fun mapValue!31647 () ValueCell!9482)

(declare-fun mapKey!31647 () (_ BitVec 32))

(assert (=> mapNonEmpty!31647 (= (arr!26831 _values!1231) (store mapRest!31647 mapKey!31647 mapValue!31647))))

(declare-fun b!929690 () Bool)

(declare-fun res!626130 () Bool)

(declare-fun e!522048 () Bool)

(assert (=> b!929690 (=> (not res!626130) (not e!522048))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929690 (= res!626130 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929691 () Bool)

(assert (=> b!929691 (= e!522048 false)))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!418918 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!55773 0))(
  ( (array!55774 (arr!26832 (Array (_ BitVec 32) (_ BitVec 64))) (size!27293 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55773)

(declare-fun zeroValue!1173 () V!31535)

(declare-fun minValue!1173 () V!31535)

(declare-datatypes ((tuple2!13148 0))(
  ( (tuple2!13149 (_1!6585 (_ BitVec 64)) (_2!6585 V!31535)) )
))
(declare-datatypes ((List!18909 0))(
  ( (Nil!18906) (Cons!18905 (h!20051 tuple2!13148) (t!26957 List!18909)) )
))
(declare-datatypes ((ListLongMap!11835 0))(
  ( (ListLongMap!11836 (toList!5933 List!18909)) )
))
(declare-fun contains!4939 (ListLongMap!11835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3113 (array!55773 array!55771 (_ BitVec 32) (_ BitVec 32) V!31535 V!31535 (_ BitVec 32) Int) ListLongMap!11835)

(assert (=> b!929691 (= lt!418918 (contains!4939 (getCurrentListMap!3113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!929692 () Bool)

(declare-fun res!626132 () Bool)

(declare-fun e!522046 () Bool)

(assert (=> b!929692 (=> (not res!626132) (not e!522046))))

(assert (=> b!929692 (= res!626132 (and (= (size!27292 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27293 _keys!1487) (size!27292 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929693 () Bool)

(declare-fun e!522047 () Bool)

(declare-fun tp_is_empty!19927 () Bool)

(assert (=> b!929693 (= e!522047 tp_is_empty!19927)))

(declare-fun b!929694 () Bool)

(declare-fun e!522051 () Bool)

(assert (=> b!929694 (= e!522051 (and e!522047 mapRes!31647))))

(declare-fun condMapEmpty!31647 () Bool)

(declare-fun mapDefault!31647 () ValueCell!9482)

(assert (=> b!929694 (= condMapEmpty!31647 (= (arr!26831 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9482)) mapDefault!31647)))))

(declare-fun b!929695 () Bool)

(declare-fun res!626135 () Bool)

(assert (=> b!929695 (=> (not res!626135) (not e!522048))))

(declare-fun lt!418919 () ListLongMap!11835)

(declare-fun v!791 () V!31535)

(declare-fun apply!736 (ListLongMap!11835 (_ BitVec 64)) V!31535)

(assert (=> b!929695 (= res!626135 (= (apply!736 lt!418919 k0!1099) v!791))))

(declare-fun res!626128 () Bool)

(assert (=> start!79188 (=> (not res!626128) (not e!522046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79188 (= res!626128 (validMask!0 mask!1881))))

(assert (=> start!79188 e!522046))

(assert (=> start!79188 true))

(assert (=> start!79188 tp_is_empty!19927))

(declare-fun array_inv!20966 (array!55771) Bool)

(assert (=> start!79188 (and (array_inv!20966 _values!1231) e!522051)))

(assert (=> start!79188 tp!60698))

(declare-fun array_inv!20967 (array!55773) Bool)

(assert (=> start!79188 (array_inv!20967 _keys!1487)))

(declare-fun b!929696 () Bool)

(assert (=> b!929696 (= e!522049 tp_is_empty!19927)))

(declare-fun b!929697 () Bool)

(assert (=> b!929697 (= e!522046 e!522048)))

(declare-fun res!626133 () Bool)

(assert (=> b!929697 (=> (not res!626133) (not e!522048))))

(assert (=> b!929697 (= res!626133 (contains!4939 lt!418919 k0!1099))))

(assert (=> b!929697 (= lt!418919 (getCurrentListMap!3113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929698 () Bool)

(declare-fun res!626134 () Bool)

(assert (=> b!929698 (=> (not res!626134) (not e!522046))))

(assert (=> b!929698 (= res!626134 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27293 _keys!1487))))))

(declare-fun b!929699 () Bool)

(declare-fun res!626129 () Bool)

(assert (=> b!929699 (=> (not res!626129) (not e!522046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55773 (_ BitVec 32)) Bool)

(assert (=> b!929699 (= res!626129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929700 () Bool)

(declare-fun res!626131 () Bool)

(assert (=> b!929700 (=> (not res!626131) (not e!522046))))

(declare-datatypes ((List!18910 0))(
  ( (Nil!18907) (Cons!18906 (h!20052 (_ BitVec 64)) (t!26958 List!18910)) )
))
(declare-fun arrayNoDuplicates!0 (array!55773 (_ BitVec 32) List!18910) Bool)

(assert (=> b!929700 (= res!626131 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18907))))

(declare-fun mapIsEmpty!31647 () Bool)

(assert (=> mapIsEmpty!31647 mapRes!31647))

(assert (= (and start!79188 res!626128) b!929692))

(assert (= (and b!929692 res!626132) b!929699))

(assert (= (and b!929699 res!626129) b!929700))

(assert (= (and b!929700 res!626131) b!929698))

(assert (= (and b!929698 res!626134) b!929697))

(assert (= (and b!929697 res!626133) b!929695))

(assert (= (and b!929695 res!626135) b!929690))

(assert (= (and b!929690 res!626130) b!929691))

(assert (= (and b!929694 condMapEmpty!31647) mapIsEmpty!31647))

(assert (= (and b!929694 (not condMapEmpty!31647)) mapNonEmpty!31647))

(get-info :version)

(assert (= (and mapNonEmpty!31647 ((_ is ValueCellFull!9482) mapValue!31647)) b!929696))

(assert (= (and b!929694 ((_ is ValueCellFull!9482) mapDefault!31647)) b!929693))

(assert (= start!79188 b!929694))

(declare-fun m!863569 () Bool)

(assert (=> b!929691 m!863569))

(assert (=> b!929691 m!863569))

(declare-fun m!863571 () Bool)

(assert (=> b!929691 m!863571))

(declare-fun m!863573 () Bool)

(assert (=> b!929695 m!863573))

(declare-fun m!863575 () Bool)

(assert (=> b!929699 m!863575))

(declare-fun m!863577 () Bool)

(assert (=> b!929700 m!863577))

(declare-fun m!863579 () Bool)

(assert (=> mapNonEmpty!31647 m!863579))

(declare-fun m!863581 () Bool)

(assert (=> b!929697 m!863581))

(declare-fun m!863583 () Bool)

(assert (=> b!929697 m!863583))

(declare-fun m!863585 () Bool)

(assert (=> start!79188 m!863585))

(declare-fun m!863587 () Bool)

(assert (=> start!79188 m!863587))

(declare-fun m!863589 () Bool)

(assert (=> start!79188 m!863589))

(check-sat (not b!929699) (not b!929695) tp_is_empty!19927 (not b!929691) (not b_next!17419) (not b!929700) b_and!28459 (not mapNonEmpty!31647) (not b!929697) (not start!79188))
(check-sat b_and!28459 (not b_next!17419))
