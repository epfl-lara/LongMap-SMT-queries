; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79232 () Bool)

(assert start!79232)

(declare-fun b_free!17445 () Bool)

(declare-fun b_next!17445 () Bool)

(assert (=> start!79232 (= b_free!17445 (not b_next!17445))))

(declare-fun tp!60776 () Bool)

(declare-fun b_and!28511 () Bool)

(assert (=> start!79232 (= tp!60776 b_and!28511)))

(declare-fun b!930357 () Bool)

(declare-fun e!522432 () Bool)

(declare-fun tp_is_empty!19953 () Bool)

(assert (=> b!930357 (= e!522432 tp_is_empty!19953)))

(declare-fun res!626553 () Bool)

(declare-fun e!522430 () Bool)

(assert (=> start!79232 (=> (not res!626553) (not e!522430))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79232 (= res!626553 (validMask!0 mask!1881))))

(assert (=> start!79232 e!522430))

(assert (=> start!79232 true))

(declare-datatypes ((V!31569 0))(
  ( (V!31570 (val!10027 Int)) )
))
(declare-datatypes ((ValueCell!9495 0))(
  ( (ValueCellFull!9495 (v!12545 V!31569)) (EmptyCell!9495) )
))
(declare-datatypes ((array!55852 0))(
  ( (array!55853 (arr!26871 (Array (_ BitVec 32) ValueCell!9495)) (size!27330 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55852)

(declare-fun e!522428 () Bool)

(declare-fun array_inv!20912 (array!55852) Bool)

(assert (=> start!79232 (and (array_inv!20912 _values!1231) e!522428)))

(assert (=> start!79232 tp!60776))

(declare-datatypes ((array!55854 0))(
  ( (array!55855 (arr!26872 (Array (_ BitVec 32) (_ BitVec 64))) (size!27331 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55854)

(declare-fun array_inv!20913 (array!55854) Bool)

(assert (=> start!79232 (array_inv!20913 _keys!1487)))

(assert (=> start!79232 tp_is_empty!19953))

(declare-fun b!930358 () Bool)

(declare-fun res!626552 () Bool)

(assert (=> b!930358 (=> (not res!626552) (not e!522430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55854 (_ BitVec 32)) Bool)

(assert (=> b!930358 (= res!626552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930359 () Bool)

(declare-fun res!626554 () Bool)

(assert (=> b!930359 (=> (not res!626554) (not e!522430))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930359 (= res!626554 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27331 _keys!1487))))))

(declare-fun mapNonEmpty!31686 () Bool)

(declare-fun mapRes!31686 () Bool)

(declare-fun tp!60775 () Bool)

(assert (=> mapNonEmpty!31686 (= mapRes!31686 (and tp!60775 e!522432))))

(declare-fun mapKey!31686 () (_ BitVec 32))

(declare-fun mapValue!31686 () ValueCell!9495)

(declare-fun mapRest!31686 () (Array (_ BitVec 32) ValueCell!9495))

(assert (=> mapNonEmpty!31686 (= (arr!26871 _values!1231) (store mapRest!31686 mapKey!31686 mapValue!31686))))

(declare-fun b!930360 () Bool)

(declare-fun res!626551 () Bool)

(assert (=> b!930360 (=> (not res!626551) (not e!522430))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930360 (= res!626551 (and (= (size!27330 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27331 _keys!1487) (size!27330 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930361 () Bool)

(declare-fun e!522431 () Bool)

(assert (=> b!930361 (= e!522430 e!522431)))

(declare-fun res!626549 () Bool)

(assert (=> b!930361 (=> (not res!626549) (not e!522431))))

(declare-datatypes ((tuple2!13118 0))(
  ( (tuple2!13119 (_1!6570 (_ BitVec 64)) (_2!6570 V!31569)) )
))
(declare-datatypes ((List!18910 0))(
  ( (Nil!18907) (Cons!18906 (h!20052 tuple2!13118) (t!26967 List!18910)) )
))
(declare-datatypes ((ListLongMap!11815 0))(
  ( (ListLongMap!11816 (toList!5923 List!18910)) )
))
(declare-fun lt!419224 () ListLongMap!11815)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4974 (ListLongMap!11815 (_ BitVec 64)) Bool)

(assert (=> b!930361 (= res!626549 (contains!4974 lt!419224 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31569)

(declare-fun minValue!1173 () V!31569)

(declare-fun getCurrentListMap!3165 (array!55854 array!55852 (_ BitVec 32) (_ BitVec 32) V!31569 V!31569 (_ BitVec 32) Int) ListLongMap!11815)

(assert (=> b!930361 (= lt!419224 (getCurrentListMap!3165 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930362 () Bool)

(declare-fun e!522433 () Bool)

(assert (=> b!930362 (= e!522428 (and e!522433 mapRes!31686))))

(declare-fun condMapEmpty!31686 () Bool)

(declare-fun mapDefault!31686 () ValueCell!9495)

(assert (=> b!930362 (= condMapEmpty!31686 (= (arr!26871 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9495)) mapDefault!31686)))))

(declare-fun b!930363 () Bool)

(declare-fun res!626550 () Bool)

(assert (=> b!930363 (=> (not res!626550) (not e!522430))))

(declare-datatypes ((List!18911 0))(
  ( (Nil!18908) (Cons!18907 (h!20053 (_ BitVec 64)) (t!26968 List!18911)) )
))
(declare-fun arrayNoDuplicates!0 (array!55854 (_ BitVec 32) List!18911) Bool)

(assert (=> b!930363 (= res!626550 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18908))))

(declare-fun b!930364 () Bool)

(assert (=> b!930364 (= e!522433 tp_is_empty!19953)))

(declare-fun b!930365 () Bool)

(assert (=> b!930365 (= e!522431 false)))

(declare-fun lt!419223 () V!31569)

(declare-fun apply!745 (ListLongMap!11815 (_ BitVec 64)) V!31569)

(assert (=> b!930365 (= lt!419223 (apply!745 lt!419224 k0!1099))))

(declare-fun mapIsEmpty!31686 () Bool)

(assert (=> mapIsEmpty!31686 mapRes!31686))

(assert (= (and start!79232 res!626553) b!930360))

(assert (= (and b!930360 res!626551) b!930358))

(assert (= (and b!930358 res!626552) b!930363))

(assert (= (and b!930363 res!626550) b!930359))

(assert (= (and b!930359 res!626554) b!930361))

(assert (= (and b!930361 res!626549) b!930365))

(assert (= (and b!930362 condMapEmpty!31686) mapIsEmpty!31686))

(assert (= (and b!930362 (not condMapEmpty!31686)) mapNonEmpty!31686))

(get-info :version)

(assert (= (and mapNonEmpty!31686 ((_ is ValueCellFull!9495) mapValue!31686)) b!930357))

(assert (= (and b!930362 ((_ is ValueCellFull!9495) mapDefault!31686)) b!930364))

(assert (= start!79232 b!930362))

(declare-fun m!864609 () Bool)

(assert (=> start!79232 m!864609))

(declare-fun m!864611 () Bool)

(assert (=> start!79232 m!864611))

(declare-fun m!864613 () Bool)

(assert (=> start!79232 m!864613))

(declare-fun m!864615 () Bool)

(assert (=> b!930365 m!864615))

(declare-fun m!864617 () Bool)

(assert (=> mapNonEmpty!31686 m!864617))

(declare-fun m!864619 () Bool)

(assert (=> b!930358 m!864619))

(declare-fun m!864621 () Bool)

(assert (=> b!930361 m!864621))

(declare-fun m!864623 () Bool)

(assert (=> b!930361 m!864623))

(declare-fun m!864625 () Bool)

(assert (=> b!930363 m!864625))

(check-sat (not b!930363) (not b_next!17445) b_and!28511 (not b!930361) (not start!79232) (not mapNonEmpty!31686) (not b!930358) tp_is_empty!19953 (not b!930365))
(check-sat b_and!28511 (not b_next!17445))
