; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79362 () Bool)

(assert start!79362)

(declare-fun b_free!17407 () Bool)

(declare-fun b_next!17407 () Bool)

(assert (=> start!79362 (= b_free!17407 (not b_next!17407))))

(declare-fun tp!60662 () Bool)

(declare-fun b_and!28483 () Bool)

(assert (=> start!79362 (= tp!60662 b_and!28483)))

(declare-fun b!930634 () Bool)

(declare-fun res!626443 () Bool)

(declare-fun e!522670 () Bool)

(assert (=> b!930634 (=> (not res!626443) (not e!522670))))

(declare-datatypes ((array!55839 0))(
  ( (array!55840 (arr!26860 (Array (_ BitVec 32) (_ BitVec 64))) (size!27320 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55839)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55839 (_ BitVec 32)) Bool)

(assert (=> b!930634 (= res!626443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!626444 () Bool)

(assert (=> start!79362 (=> (not res!626444) (not e!522670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79362 (= res!626444 (validMask!0 mask!1881))))

(assert (=> start!79362 e!522670))

(assert (=> start!79362 true))

(declare-fun tp_is_empty!19915 () Bool)

(assert (=> start!79362 tp_is_empty!19915))

(declare-datatypes ((V!31519 0))(
  ( (V!31520 (val!10008 Int)) )
))
(declare-datatypes ((ValueCell!9476 0))(
  ( (ValueCellFull!9476 (v!12523 V!31519)) (EmptyCell!9476) )
))
(declare-datatypes ((array!55841 0))(
  ( (array!55842 (arr!26861 (Array (_ BitVec 32) ValueCell!9476)) (size!27321 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55841)

(declare-fun e!522672 () Bool)

(declare-fun array_inv!21010 (array!55841) Bool)

(assert (=> start!79362 (and (array_inv!21010 _values!1231) e!522672)))

(assert (=> start!79362 tp!60662))

(declare-fun array_inv!21011 (array!55839) Bool)

(assert (=> start!79362 (array_inv!21011 _keys!1487)))

(declare-fun b!930635 () Bool)

(declare-fun res!626438 () Bool)

(assert (=> b!930635 (=> (not res!626438) (not e!522670))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930635 (= res!626438 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27320 _keys!1487))))))

(declare-fun mapNonEmpty!31629 () Bool)

(declare-fun mapRes!31629 () Bool)

(declare-fun tp!60663 () Bool)

(declare-fun e!522671 () Bool)

(assert (=> mapNonEmpty!31629 (= mapRes!31629 (and tp!60663 e!522671))))

(declare-fun mapRest!31629 () (Array (_ BitVec 32) ValueCell!9476))

(declare-fun mapKey!31629 () (_ BitVec 32))

(declare-fun mapValue!31629 () ValueCell!9476)

(assert (=> mapNonEmpty!31629 (= (arr!26861 _values!1231) (store mapRest!31629 mapKey!31629 mapValue!31629))))

(declare-fun b!930636 () Bool)

(declare-fun res!626441 () Bool)

(declare-fun e!522673 () Bool)

(assert (=> b!930636 (=> (not res!626441) (not e!522673))))

(assert (=> b!930636 (= res!626441 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930637 () Bool)

(declare-fun res!626440 () Bool)

(assert (=> b!930637 (=> (not res!626440) (not e!522670))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930637 (= res!626440 (and (= (size!27321 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27320 _keys!1487) (size!27321 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930638 () Bool)

(assert (=> b!930638 (= e!522671 tp_is_empty!19915)))

(declare-fun b!930639 () Bool)

(assert (=> b!930639 (= e!522673 false)))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!419480 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!31519)

(declare-fun minValue!1173 () V!31519)

(declare-datatypes ((tuple2!13082 0))(
  ( (tuple2!13083 (_1!6552 (_ BitVec 64)) (_2!6552 V!31519)) )
))
(declare-datatypes ((List!18877 0))(
  ( (Nil!18874) (Cons!18873 (h!20025 tuple2!13082) (t!26926 List!18877)) )
))
(declare-datatypes ((ListLongMap!11781 0))(
  ( (ListLongMap!11782 (toList!5906 List!18877)) )
))
(declare-fun contains!4975 (ListLongMap!11781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3153 (array!55839 array!55841 (_ BitVec 32) (_ BitVec 32) V!31519 V!31519 (_ BitVec 32) Int) ListLongMap!11781)

(assert (=> b!930639 (= lt!419480 (contains!4975 (getCurrentListMap!3153 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!930640 () Bool)

(assert (=> b!930640 (= e!522670 e!522673)))

(declare-fun res!626439 () Bool)

(assert (=> b!930640 (=> (not res!626439) (not e!522673))))

(declare-fun lt!419479 () ListLongMap!11781)

(assert (=> b!930640 (= res!626439 (contains!4975 lt!419479 k0!1099))))

(assert (=> b!930640 (= lt!419479 (getCurrentListMap!3153 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930641 () Bool)

(declare-fun e!522668 () Bool)

(assert (=> b!930641 (= e!522672 (and e!522668 mapRes!31629))))

(declare-fun condMapEmpty!31629 () Bool)

(declare-fun mapDefault!31629 () ValueCell!9476)

(assert (=> b!930641 (= condMapEmpty!31629 (= (arr!26861 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9476)) mapDefault!31629)))))

(declare-fun b!930642 () Bool)

(assert (=> b!930642 (= e!522668 tp_is_empty!19915)))

(declare-fun b!930643 () Bool)

(declare-fun res!626445 () Bool)

(assert (=> b!930643 (=> (not res!626445) (not e!522670))))

(declare-datatypes ((List!18878 0))(
  ( (Nil!18875) (Cons!18874 (h!20026 (_ BitVec 64)) (t!26927 List!18878)) )
))
(declare-fun arrayNoDuplicates!0 (array!55839 (_ BitVec 32) List!18878) Bool)

(assert (=> b!930643 (= res!626445 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18875))))

(declare-fun b!930644 () Bool)

(declare-fun res!626442 () Bool)

(assert (=> b!930644 (=> (not res!626442) (not e!522673))))

(declare-fun v!791 () V!31519)

(declare-fun apply!748 (ListLongMap!11781 (_ BitVec 64)) V!31519)

(assert (=> b!930644 (= res!626442 (= (apply!748 lt!419479 k0!1099) v!791))))

(declare-fun mapIsEmpty!31629 () Bool)

(assert (=> mapIsEmpty!31629 mapRes!31629))

(assert (= (and start!79362 res!626444) b!930637))

(assert (= (and b!930637 res!626440) b!930634))

(assert (= (and b!930634 res!626443) b!930643))

(assert (= (and b!930643 res!626445) b!930635))

(assert (= (and b!930635 res!626438) b!930640))

(assert (= (and b!930640 res!626439) b!930644))

(assert (= (and b!930644 res!626442) b!930636))

(assert (= (and b!930636 res!626441) b!930639))

(assert (= (and b!930641 condMapEmpty!31629) mapIsEmpty!31629))

(assert (= (and b!930641 (not condMapEmpty!31629)) mapNonEmpty!31629))

(get-info :version)

(assert (= (and mapNonEmpty!31629 ((_ is ValueCellFull!9476) mapValue!31629)) b!930638))

(assert (= (and b!930641 ((_ is ValueCellFull!9476) mapDefault!31629)) b!930642))

(assert (= start!79362 b!930641))

(declare-fun m!865489 () Bool)

(assert (=> mapNonEmpty!31629 m!865489))

(declare-fun m!865491 () Bool)

(assert (=> b!930639 m!865491))

(assert (=> b!930639 m!865491))

(declare-fun m!865493 () Bool)

(assert (=> b!930639 m!865493))

(declare-fun m!865495 () Bool)

(assert (=> b!930634 m!865495))

(declare-fun m!865497 () Bool)

(assert (=> b!930644 m!865497))

(declare-fun m!865499 () Bool)

(assert (=> b!930640 m!865499))

(declare-fun m!865501 () Bool)

(assert (=> b!930640 m!865501))

(declare-fun m!865503 () Bool)

(assert (=> b!930643 m!865503))

(declare-fun m!865505 () Bool)

(assert (=> start!79362 m!865505))

(declare-fun m!865507 () Bool)

(assert (=> start!79362 m!865507))

(declare-fun m!865509 () Bool)

(assert (=> start!79362 m!865509))

(check-sat (not b_next!17407) (not start!79362) (not b!930634) (not mapNonEmpty!31629) (not b!930639) (not b!930644) tp_is_empty!19915 b_and!28483 (not b!930643) (not b!930640))
(check-sat b_and!28483 (not b_next!17407))
