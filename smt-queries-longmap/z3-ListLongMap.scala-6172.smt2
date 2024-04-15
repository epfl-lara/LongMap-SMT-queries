; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79122 () Bool)

(assert start!79122)

(declare-fun b_free!17353 () Bool)

(declare-fun b_next!17353 () Bool)

(assert (=> start!79122 (= b_free!17353 (not b_next!17353))))

(declare-fun tp!60500 () Bool)

(declare-fun b_and!28393 () Bool)

(assert (=> start!79122 (= tp!60500 b_and!28393)))

(declare-fun b!928678 () Bool)

(declare-fun e!521456 () Bool)

(declare-fun e!521453 () Bool)

(assert (=> b!928678 (= e!521456 e!521453)))

(declare-fun res!625414 () Bool)

(assert (=> b!928678 (=> (not res!625414) (not e!521453))))

(declare-datatypes ((V!31447 0))(
  ( (V!31448 (val!9981 Int)) )
))
(declare-datatypes ((tuple2!13096 0))(
  ( (tuple2!13097 (_1!6559 (_ BitVec 64)) (_2!6559 V!31447)) )
))
(declare-datatypes ((List!18863 0))(
  ( (Nil!18860) (Cons!18859 (h!20005 tuple2!13096) (t!26911 List!18863)) )
))
(declare-datatypes ((ListLongMap!11783 0))(
  ( (ListLongMap!11784 (toList!5907 List!18863)) )
))
(declare-fun lt!418730 () ListLongMap!11783)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4917 (ListLongMap!11783 (_ BitVec 64)) Bool)

(assert (=> b!928678 (= res!625414 (contains!4917 lt!418730 k0!1099))))

(declare-datatypes ((array!55649 0))(
  ( (array!55650 (arr!26770 (Array (_ BitVec 32) (_ BitVec 64))) (size!27231 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55649)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9449 0))(
  ( (ValueCellFull!9449 (v!12498 V!31447)) (EmptyCell!9449) )
))
(declare-datatypes ((array!55651 0))(
  ( (array!55652 (arr!26771 (Array (_ BitVec 32) ValueCell!9449)) (size!27232 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55651)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31447)

(declare-fun minValue!1173 () V!31447)

(declare-fun getCurrentListMap!3091 (array!55649 array!55651 (_ BitVec 32) (_ BitVec 32) V!31447 V!31447 (_ BitVec 32) Int) ListLongMap!11783)

(assert (=> b!928678 (= lt!418730 (getCurrentListMap!3091 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928679 () Bool)

(declare-fun res!625413 () Bool)

(assert (=> b!928679 (=> (not res!625413) (not e!521456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55649 (_ BitVec 32)) Bool)

(assert (=> b!928679 (= res!625413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928680 () Bool)

(declare-fun res!625416 () Bool)

(assert (=> b!928680 (=> (not res!625416) (not e!521456))))

(assert (=> b!928680 (= res!625416 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27231 _keys!1487))))))

(declare-fun b!928681 () Bool)

(declare-fun e!521452 () Bool)

(declare-fun tp_is_empty!19861 () Bool)

(assert (=> b!928681 (= e!521452 tp_is_empty!19861)))

(declare-fun b!928682 () Bool)

(declare-fun res!625417 () Bool)

(assert (=> b!928682 (=> (not res!625417) (not e!521456))))

(declare-datatypes ((List!18864 0))(
  ( (Nil!18861) (Cons!18860 (h!20006 (_ BitVec 64)) (t!26912 List!18864)) )
))
(declare-fun arrayNoDuplicates!0 (array!55649 (_ BitVec 32) List!18864) Bool)

(assert (=> b!928682 (= res!625417 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18861))))

(declare-fun b!928683 () Bool)

(declare-fun e!521455 () Bool)

(declare-fun e!521454 () Bool)

(declare-fun mapRes!31548 () Bool)

(assert (=> b!928683 (= e!521455 (and e!521454 mapRes!31548))))

(declare-fun condMapEmpty!31548 () Bool)

(declare-fun mapDefault!31548 () ValueCell!9449)

(assert (=> b!928683 (= condMapEmpty!31548 (= (arr!26771 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9449)) mapDefault!31548)))))

(declare-fun b!928684 () Bool)

(assert (=> b!928684 (= e!521454 tp_is_empty!19861)))

(declare-fun mapIsEmpty!31548 () Bool)

(assert (=> mapIsEmpty!31548 mapRes!31548))

(declare-fun mapNonEmpty!31548 () Bool)

(declare-fun tp!60501 () Bool)

(assert (=> mapNonEmpty!31548 (= mapRes!31548 (and tp!60501 e!521452))))

(declare-fun mapKey!31548 () (_ BitVec 32))

(declare-fun mapValue!31548 () ValueCell!9449)

(declare-fun mapRest!31548 () (Array (_ BitVec 32) ValueCell!9449))

(assert (=> mapNonEmpty!31548 (= (arr!26771 _values!1231) (store mapRest!31548 mapKey!31548 mapValue!31548))))

(declare-fun res!625418 () Bool)

(assert (=> start!79122 (=> (not res!625418) (not e!521456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79122 (= res!625418 (validMask!0 mask!1881))))

(assert (=> start!79122 e!521456))

(assert (=> start!79122 true))

(declare-fun array_inv!20932 (array!55651) Bool)

(assert (=> start!79122 (and (array_inv!20932 _values!1231) e!521455)))

(assert (=> start!79122 tp!60500))

(declare-fun array_inv!20933 (array!55649) Bool)

(assert (=> start!79122 (array_inv!20933 _keys!1487)))

(assert (=> start!79122 tp_is_empty!19861))

(declare-fun b!928685 () Bool)

(declare-fun res!625415 () Bool)

(assert (=> b!928685 (=> (not res!625415) (not e!521456))))

(assert (=> b!928685 (= res!625415 (and (= (size!27232 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27231 _keys!1487) (size!27232 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928686 () Bool)

(assert (=> b!928686 (= e!521453 false)))

(declare-fun lt!418729 () V!31447)

(declare-fun apply!715 (ListLongMap!11783 (_ BitVec 64)) V!31447)

(assert (=> b!928686 (= lt!418729 (apply!715 lt!418730 k0!1099))))

(assert (= (and start!79122 res!625418) b!928685))

(assert (= (and b!928685 res!625415) b!928679))

(assert (= (and b!928679 res!625413) b!928682))

(assert (= (and b!928682 res!625417) b!928680))

(assert (= (and b!928680 res!625416) b!928678))

(assert (= (and b!928678 res!625414) b!928686))

(assert (= (and b!928683 condMapEmpty!31548) mapIsEmpty!31548))

(assert (= (and b!928683 (not condMapEmpty!31548)) mapNonEmpty!31548))

(get-info :version)

(assert (= (and mapNonEmpty!31548 ((_ is ValueCellFull!9449) mapValue!31548)) b!928681))

(assert (= (and b!928683 ((_ is ValueCellFull!9449) mapDefault!31548)) b!928684))

(assert (= start!79122 b!928683))

(declare-fun m!862903 () Bool)

(assert (=> start!79122 m!862903))

(declare-fun m!862905 () Bool)

(assert (=> start!79122 m!862905))

(declare-fun m!862907 () Bool)

(assert (=> start!79122 m!862907))

(declare-fun m!862909 () Bool)

(assert (=> b!928679 m!862909))

(declare-fun m!862911 () Bool)

(assert (=> b!928682 m!862911))

(declare-fun m!862913 () Bool)

(assert (=> b!928678 m!862913))

(declare-fun m!862915 () Bool)

(assert (=> b!928678 m!862915))

(declare-fun m!862917 () Bool)

(assert (=> b!928686 m!862917))

(declare-fun m!862919 () Bool)

(assert (=> mapNonEmpty!31548 m!862919))

(check-sat (not start!79122) tp_is_empty!19861 (not mapNonEmpty!31548) (not b!928679) (not b!928678) b_and!28393 (not b!928686) (not b!928682) (not b_next!17353))
(check-sat b_and!28393 (not b_next!17353))
