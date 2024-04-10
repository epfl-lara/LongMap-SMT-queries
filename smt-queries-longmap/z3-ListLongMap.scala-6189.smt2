; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79244 () Bool)

(assert start!79244)

(declare-fun b_free!17457 () Bool)

(declare-fun b_next!17457 () Bool)

(assert (=> start!79244 (= b_free!17457 (not b_next!17457))))

(declare-fun tp!60812 () Bool)

(declare-fun b_and!28523 () Bool)

(assert (=> start!79244 (= tp!60812 b_and!28523)))

(declare-fun b!930547 () Bool)

(declare-fun e!522538 () Bool)

(assert (=> b!930547 (= e!522538 false)))

(declare-datatypes ((V!31585 0))(
  ( (V!31586 (val!10033 Int)) )
))
(declare-fun lt!419251 () V!31585)

(declare-datatypes ((tuple2!13130 0))(
  ( (tuple2!13131 (_1!6576 (_ BitVec 64)) (_2!6576 V!31585)) )
))
(declare-datatypes ((List!18922 0))(
  ( (Nil!18919) (Cons!18918 (h!20064 tuple2!13130) (t!26979 List!18922)) )
))
(declare-datatypes ((ListLongMap!11827 0))(
  ( (ListLongMap!11828 (toList!5929 List!18922)) )
))
(declare-fun lt!419250 () ListLongMap!11827)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!751 (ListLongMap!11827 (_ BitVec 64)) V!31585)

(assert (=> b!930547 (= lt!419251 (apply!751 lt!419250 k0!1099))))

(declare-fun b!930548 () Bool)

(declare-fun e!522537 () Bool)

(declare-fun tp_is_empty!19965 () Bool)

(assert (=> b!930548 (= e!522537 tp_is_empty!19965)))

(declare-fun b!930549 () Bool)

(declare-fun res!626687 () Bool)

(declare-fun e!522539 () Bool)

(assert (=> b!930549 (=> (not res!626687) (not e!522539))))

(declare-datatypes ((array!55876 0))(
  ( (array!55877 (arr!26883 (Array (_ BitVec 32) (_ BitVec 64))) (size!27342 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55876)

(declare-datatypes ((List!18923 0))(
  ( (Nil!18920) (Cons!18919 (h!20065 (_ BitVec 64)) (t!26980 List!18923)) )
))
(declare-fun arrayNoDuplicates!0 (array!55876 (_ BitVec 32) List!18923) Bool)

(assert (=> b!930549 (= res!626687 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18920))))

(declare-fun mapNonEmpty!31704 () Bool)

(declare-fun mapRes!31704 () Bool)

(declare-fun tp!60811 () Bool)

(declare-fun e!522540 () Bool)

(assert (=> mapNonEmpty!31704 (= mapRes!31704 (and tp!60811 e!522540))))

(declare-datatypes ((ValueCell!9501 0))(
  ( (ValueCellFull!9501 (v!12551 V!31585)) (EmptyCell!9501) )
))
(declare-fun mapValue!31704 () ValueCell!9501)

(declare-fun mapRest!31704 () (Array (_ BitVec 32) ValueCell!9501))

(declare-fun mapKey!31704 () (_ BitVec 32))

(declare-datatypes ((array!55878 0))(
  ( (array!55879 (arr!26884 (Array (_ BitVec 32) ValueCell!9501)) (size!27343 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55878)

(assert (=> mapNonEmpty!31704 (= (arr!26884 _values!1231) (store mapRest!31704 mapKey!31704 mapValue!31704))))

(declare-fun b!930550 () Bool)

(assert (=> b!930550 (= e!522539 e!522538)))

(declare-fun res!626685 () Bool)

(assert (=> b!930550 (=> (not res!626685) (not e!522538))))

(declare-fun contains!4979 (ListLongMap!11827 (_ BitVec 64)) Bool)

(assert (=> b!930550 (= res!626685 (contains!4979 lt!419250 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31585)

(declare-fun minValue!1173 () V!31585)

(declare-fun getCurrentListMap!3170 (array!55876 array!55878 (_ BitVec 32) (_ BitVec 32) V!31585 V!31585 (_ BitVec 32) Int) ListLongMap!11827)

(assert (=> b!930550 (= lt!419250 (getCurrentListMap!3170 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930551 () Bool)

(declare-fun res!626684 () Bool)

(assert (=> b!930551 (=> (not res!626684) (not e!522539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55876 (_ BitVec 32)) Bool)

(assert (=> b!930551 (= res!626684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930552 () Bool)

(declare-fun res!626689 () Bool)

(assert (=> b!930552 (=> (not res!626689) (not e!522539))))

(assert (=> b!930552 (= res!626689 (and (= (size!27343 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27342 _keys!1487) (size!27343 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31704 () Bool)

(assert (=> mapIsEmpty!31704 mapRes!31704))

(declare-fun b!930546 () Bool)

(declare-fun e!522541 () Bool)

(assert (=> b!930546 (= e!522541 (and e!522537 mapRes!31704))))

(declare-fun condMapEmpty!31704 () Bool)

(declare-fun mapDefault!31704 () ValueCell!9501)

(assert (=> b!930546 (= condMapEmpty!31704 (= (arr!26884 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9501)) mapDefault!31704)))))

(declare-fun res!626686 () Bool)

(assert (=> start!79244 (=> (not res!626686) (not e!522539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79244 (= res!626686 (validMask!0 mask!1881))))

(assert (=> start!79244 e!522539))

(assert (=> start!79244 true))

(declare-fun array_inv!20922 (array!55878) Bool)

(assert (=> start!79244 (and (array_inv!20922 _values!1231) e!522541)))

(assert (=> start!79244 tp!60812))

(declare-fun array_inv!20923 (array!55876) Bool)

(assert (=> start!79244 (array_inv!20923 _keys!1487)))

(assert (=> start!79244 tp_is_empty!19965))

(declare-fun b!930553 () Bool)

(assert (=> b!930553 (= e!522540 tp_is_empty!19965)))

(declare-fun b!930554 () Bool)

(declare-fun res!626688 () Bool)

(assert (=> b!930554 (=> (not res!626688) (not e!522539))))

(assert (=> b!930554 (= res!626688 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27342 _keys!1487))))))

(assert (= (and start!79244 res!626686) b!930552))

(assert (= (and b!930552 res!626689) b!930551))

(assert (= (and b!930551 res!626684) b!930549))

(assert (= (and b!930549 res!626687) b!930554))

(assert (= (and b!930554 res!626688) b!930550))

(assert (= (and b!930550 res!626685) b!930547))

(assert (= (and b!930546 condMapEmpty!31704) mapIsEmpty!31704))

(assert (= (and b!930546 (not condMapEmpty!31704)) mapNonEmpty!31704))

(get-info :version)

(assert (= (and mapNonEmpty!31704 ((_ is ValueCellFull!9501) mapValue!31704)) b!930553))

(assert (= (and b!930546 ((_ is ValueCellFull!9501) mapDefault!31704)) b!930548))

(assert (= start!79244 b!930546))

(declare-fun m!864723 () Bool)

(assert (=> b!930550 m!864723))

(declare-fun m!864725 () Bool)

(assert (=> b!930550 m!864725))

(declare-fun m!864727 () Bool)

(assert (=> start!79244 m!864727))

(declare-fun m!864729 () Bool)

(assert (=> start!79244 m!864729))

(declare-fun m!864731 () Bool)

(assert (=> start!79244 m!864731))

(declare-fun m!864733 () Bool)

(assert (=> b!930547 m!864733))

(declare-fun m!864735 () Bool)

(assert (=> mapNonEmpty!31704 m!864735))

(declare-fun m!864737 () Bool)

(assert (=> b!930549 m!864737))

(declare-fun m!864739 () Bool)

(assert (=> b!930551 m!864739))

(check-sat tp_is_empty!19965 (not mapNonEmpty!31704) (not start!79244) (not b_next!17457) (not b!930549) (not b!930547) (not b!930550) b_and!28523 (not b!930551))
(check-sat b_and!28523 (not b_next!17457))
