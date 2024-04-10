; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79262 () Bool)

(assert start!79262)

(declare-fun b_free!17475 () Bool)

(declare-fun b_next!17475 () Bool)

(assert (=> start!79262 (= b_free!17475 (not b_next!17475))))

(declare-fun tp!60866 () Bool)

(declare-fun b_and!28541 () Bool)

(assert (=> start!79262 (= tp!60866 b_and!28541)))

(declare-fun mapNonEmpty!31731 () Bool)

(declare-fun mapRes!31731 () Bool)

(declare-fun tp!60865 () Bool)

(declare-fun e!522699 () Bool)

(assert (=> mapNonEmpty!31731 (= mapRes!31731 (and tp!60865 e!522699))))

(declare-fun mapKey!31731 () (_ BitVec 32))

(declare-datatypes ((V!31609 0))(
  ( (V!31610 (val!10042 Int)) )
))
(declare-datatypes ((ValueCell!9510 0))(
  ( (ValueCellFull!9510 (v!12560 V!31609)) (EmptyCell!9510) )
))
(declare-fun mapValue!31731 () ValueCell!9510)

(declare-fun mapRest!31731 () (Array (_ BitVec 32) ValueCell!9510))

(declare-datatypes ((array!55906 0))(
  ( (array!55907 (arr!26898 (Array (_ BitVec 32) ValueCell!9510)) (size!27357 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55906)

(assert (=> mapNonEmpty!31731 (= (arr!26898 _values!1231) (store mapRest!31731 mapKey!31731 mapValue!31731))))

(declare-fun b!930789 () Bool)

(declare-fun res!626846 () Bool)

(declare-fun e!522698 () Bool)

(assert (=> b!930789 (=> (not res!626846) (not e!522698))))

(declare-datatypes ((array!55908 0))(
  ( (array!55909 (arr!26899 (Array (_ BitVec 32) (_ BitVec 64))) (size!27358 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55908)

(declare-datatypes ((List!18933 0))(
  ( (Nil!18930) (Cons!18929 (h!20075 (_ BitVec 64)) (t!26990 List!18933)) )
))
(declare-fun arrayNoDuplicates!0 (array!55908 (_ BitVec 32) List!18933) Bool)

(assert (=> b!930789 (= res!626846 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18930))))

(declare-fun b!930790 () Bool)

(declare-fun e!522701 () Bool)

(declare-fun tp_is_empty!19983 () Bool)

(assert (=> b!930790 (= e!522701 tp_is_empty!19983)))

(declare-fun mapIsEmpty!31731 () Bool)

(assert (=> mapIsEmpty!31731 mapRes!31731))

(declare-fun b!930791 () Bool)

(declare-fun e!522702 () Bool)

(assert (=> b!930791 (= e!522702 false)))

(declare-fun lt!419304 () V!31609)

(declare-datatypes ((tuple2!13144 0))(
  ( (tuple2!13145 (_1!6583 (_ BitVec 64)) (_2!6583 V!31609)) )
))
(declare-datatypes ((List!18934 0))(
  ( (Nil!18931) (Cons!18930 (h!20076 tuple2!13144) (t!26991 List!18934)) )
))
(declare-datatypes ((ListLongMap!11841 0))(
  ( (ListLongMap!11842 (toList!5936 List!18934)) )
))
(declare-fun lt!419305 () ListLongMap!11841)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!758 (ListLongMap!11841 (_ BitVec 64)) V!31609)

(assert (=> b!930791 (= lt!419304 (apply!758 lt!419305 k0!1099))))

(declare-fun b!930792 () Bool)

(declare-fun e!522703 () Bool)

(assert (=> b!930792 (= e!522703 (and e!522701 mapRes!31731))))

(declare-fun condMapEmpty!31731 () Bool)

(declare-fun mapDefault!31731 () ValueCell!9510)

(assert (=> b!930792 (= condMapEmpty!31731 (= (arr!26898 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9510)) mapDefault!31731)))))

(declare-fun b!930793 () Bool)

(declare-fun res!626850 () Bool)

(assert (=> b!930793 (=> (not res!626850) (not e!522698))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930793 (= res!626850 (and (= (size!27357 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27358 _keys!1487) (size!27357 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930794 () Bool)

(declare-fun res!626851 () Bool)

(assert (=> b!930794 (=> (not res!626851) (not e!522698))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930794 (= res!626851 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27358 _keys!1487))))))

(declare-fun res!626848 () Bool)

(assert (=> start!79262 (=> (not res!626848) (not e!522698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79262 (= res!626848 (validMask!0 mask!1881))))

(assert (=> start!79262 e!522698))

(assert (=> start!79262 true))

(declare-fun array_inv!20934 (array!55906) Bool)

(assert (=> start!79262 (and (array_inv!20934 _values!1231) e!522703)))

(assert (=> start!79262 tp!60866))

(declare-fun array_inv!20935 (array!55908) Bool)

(assert (=> start!79262 (array_inv!20935 _keys!1487)))

(assert (=> start!79262 tp_is_empty!19983))

(declare-fun b!930795 () Bool)

(declare-fun res!626847 () Bool)

(assert (=> b!930795 (=> (not res!626847) (not e!522698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55908 (_ BitVec 32)) Bool)

(assert (=> b!930795 (= res!626847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930796 () Bool)

(assert (=> b!930796 (= e!522698 e!522702)))

(declare-fun res!626849 () Bool)

(assert (=> b!930796 (=> (not res!626849) (not e!522702))))

(declare-fun contains!4984 (ListLongMap!11841 (_ BitVec 64)) Bool)

(assert (=> b!930796 (= res!626849 (contains!4984 lt!419305 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31609)

(declare-fun minValue!1173 () V!31609)

(declare-fun getCurrentListMap!3175 (array!55908 array!55906 (_ BitVec 32) (_ BitVec 32) V!31609 V!31609 (_ BitVec 32) Int) ListLongMap!11841)

(assert (=> b!930796 (= lt!419305 (getCurrentListMap!3175 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930797 () Bool)

(assert (=> b!930797 (= e!522699 tp_is_empty!19983)))

(assert (= (and start!79262 res!626848) b!930793))

(assert (= (and b!930793 res!626850) b!930795))

(assert (= (and b!930795 res!626847) b!930789))

(assert (= (and b!930789 res!626846) b!930794))

(assert (= (and b!930794 res!626851) b!930796))

(assert (= (and b!930796 res!626849) b!930791))

(assert (= (and b!930792 condMapEmpty!31731) mapIsEmpty!31731))

(assert (= (and b!930792 (not condMapEmpty!31731)) mapNonEmpty!31731))

(get-info :version)

(assert (= (and mapNonEmpty!31731 ((_ is ValueCellFull!9510) mapValue!31731)) b!930797))

(assert (= (and b!930792 ((_ is ValueCellFull!9510) mapDefault!31731)) b!930790))

(assert (= start!79262 b!930792))

(declare-fun m!864885 () Bool)

(assert (=> start!79262 m!864885))

(declare-fun m!864887 () Bool)

(assert (=> start!79262 m!864887))

(declare-fun m!864889 () Bool)

(assert (=> start!79262 m!864889))

(declare-fun m!864891 () Bool)

(assert (=> b!930796 m!864891))

(declare-fun m!864893 () Bool)

(assert (=> b!930796 m!864893))

(declare-fun m!864895 () Bool)

(assert (=> b!930789 m!864895))

(declare-fun m!864897 () Bool)

(assert (=> b!930795 m!864897))

(declare-fun m!864899 () Bool)

(assert (=> b!930791 m!864899))

(declare-fun m!864901 () Bool)

(assert (=> mapNonEmpty!31731 m!864901))

(check-sat (not start!79262) tp_is_empty!19983 (not mapNonEmpty!31731) (not b!930791) b_and!28541 (not b!930795) (not b!930789) (not b!930796) (not b_next!17475))
(check-sat b_and!28541 (not b_next!17475))
