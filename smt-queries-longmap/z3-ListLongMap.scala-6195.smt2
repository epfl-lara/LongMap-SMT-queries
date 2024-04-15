; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79260 () Bool)

(assert start!79260)

(declare-fun b_free!17491 () Bool)

(declare-fun b_next!17491 () Bool)

(assert (=> start!79260 (= b_free!17491 (not b_next!17491))))

(declare-fun tp!60915 () Bool)

(declare-fun b_and!28531 () Bool)

(assert (=> start!79260 (= tp!60915 b_and!28531)))

(declare-fun b!930766 () Bool)

(declare-fun res!626885 () Bool)

(declare-fun e!522694 () Bool)

(assert (=> b!930766 (=> (not res!626885) (not e!522694))))

(declare-datatypes ((array!55907 0))(
  ( (array!55908 (arr!26899 (Array (_ BitVec 32) (_ BitVec 64))) (size!27360 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55907)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31631 0))(
  ( (V!31632 (val!10050 Int)) )
))
(declare-datatypes ((ValueCell!9518 0))(
  ( (ValueCellFull!9518 (v!12567 V!31631)) (EmptyCell!9518) )
))
(declare-datatypes ((array!55909 0))(
  ( (array!55910 (arr!26900 (Array (_ BitVec 32) ValueCell!9518)) (size!27361 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55909)

(assert (=> b!930766 (= res!626885 (and (= (size!27361 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27360 _keys!1487) (size!27361 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930767 () Bool)

(declare-fun res!626881 () Bool)

(assert (=> b!930767 (=> (not res!626881) (not e!522694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55907 (_ BitVec 32)) Bool)

(assert (=> b!930767 (= res!626881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930768 () Bool)

(declare-fun e!522697 () Bool)

(declare-fun e!522699 () Bool)

(declare-fun mapRes!31755 () Bool)

(assert (=> b!930768 (= e!522697 (and e!522699 mapRes!31755))))

(declare-fun condMapEmpty!31755 () Bool)

(declare-fun mapDefault!31755 () ValueCell!9518)

(assert (=> b!930768 (= condMapEmpty!31755 (= (arr!26900 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9518)) mapDefault!31755)))))

(declare-fun mapIsEmpty!31755 () Bool)

(assert (=> mapIsEmpty!31755 mapRes!31755))

(declare-fun b!930769 () Bool)

(declare-fun res!626883 () Bool)

(assert (=> b!930769 (=> (not res!626883) (not e!522694))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930769 (= res!626883 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27360 _keys!1487))))))

(declare-fun res!626882 () Bool)

(assert (=> start!79260 (=> (not res!626882) (not e!522694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79260 (= res!626882 (validMask!0 mask!1881))))

(assert (=> start!79260 e!522694))

(assert (=> start!79260 true))

(declare-fun array_inv!21004 (array!55909) Bool)

(assert (=> start!79260 (and (array_inv!21004 _values!1231) e!522697)))

(assert (=> start!79260 tp!60915))

(declare-fun array_inv!21005 (array!55907) Bool)

(assert (=> start!79260 (array_inv!21005 _keys!1487)))

(declare-fun tp_is_empty!19999 () Bool)

(assert (=> start!79260 tp_is_empty!19999))

(declare-fun b!930770 () Bool)

(declare-fun res!626880 () Bool)

(assert (=> b!930770 (=> (not res!626880) (not e!522694))))

(declare-datatypes ((List!18961 0))(
  ( (Nil!18958) (Cons!18957 (h!20103 (_ BitVec 64)) (t!27009 List!18961)) )
))
(declare-fun arrayNoDuplicates!0 (array!55907 (_ BitVec 32) List!18961) Bool)

(assert (=> b!930770 (= res!626880 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18958))))

(declare-fun b!930771 () Bool)

(declare-fun e!522696 () Bool)

(assert (=> b!930771 (= e!522696 tp_is_empty!19999)))

(declare-fun b!930772 () Bool)

(assert (=> b!930772 (= e!522699 tp_is_empty!19999)))

(declare-fun mapNonEmpty!31755 () Bool)

(declare-fun tp!60914 () Bool)

(assert (=> mapNonEmpty!31755 (= mapRes!31755 (and tp!60914 e!522696))))

(declare-fun mapValue!31755 () ValueCell!9518)

(declare-fun mapKey!31755 () (_ BitVec 32))

(declare-fun mapRest!31755 () (Array (_ BitVec 32) ValueCell!9518))

(assert (=> mapNonEmpty!31755 (= (arr!26900 _values!1231) (store mapRest!31755 mapKey!31755 mapValue!31755))))

(declare-fun b!930773 () Bool)

(declare-fun e!522695 () Bool)

(assert (=> b!930773 (= e!522694 e!522695)))

(declare-fun res!626884 () Bool)

(assert (=> b!930773 (=> (not res!626884) (not e!522695))))

(declare-datatypes ((tuple2!13204 0))(
  ( (tuple2!13205 (_1!6613 (_ BitVec 64)) (_2!6613 V!31631)) )
))
(declare-datatypes ((List!18962 0))(
  ( (Nil!18959) (Cons!18958 (h!20104 tuple2!13204) (t!27010 List!18962)) )
))
(declare-datatypes ((ListLongMap!11891 0))(
  ( (ListLongMap!11892 (toList!5961 List!18962)) )
))
(declare-fun lt!419116 () ListLongMap!11891)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4963 (ListLongMap!11891 (_ BitVec 64)) Bool)

(assert (=> b!930773 (= res!626884 (contains!4963 lt!419116 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31631)

(declare-fun minValue!1173 () V!31631)

(declare-fun getCurrentListMap!3137 (array!55907 array!55909 (_ BitVec 32) (_ BitVec 32) V!31631 V!31631 (_ BitVec 32) Int) ListLongMap!11891)

(assert (=> b!930773 (= lt!419116 (getCurrentListMap!3137 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930774 () Bool)

(assert (=> b!930774 (= e!522695 false)))

(declare-fun lt!419117 () V!31631)

(declare-fun apply!757 (ListLongMap!11891 (_ BitVec 64)) V!31631)

(assert (=> b!930774 (= lt!419117 (apply!757 lt!419116 k0!1099))))

(assert (= (and start!79260 res!626882) b!930766))

(assert (= (and b!930766 res!626885) b!930767))

(assert (= (and b!930767 res!626881) b!930770))

(assert (= (and b!930770 res!626880) b!930769))

(assert (= (and b!930769 res!626883) b!930773))

(assert (= (and b!930773 res!626884) b!930774))

(assert (= (and b!930768 condMapEmpty!31755) mapIsEmpty!31755))

(assert (= (and b!930768 (not condMapEmpty!31755)) mapNonEmpty!31755))

(get-info :version)

(assert (= (and mapNonEmpty!31755 ((_ is ValueCellFull!9518) mapValue!31755)) b!930771))

(assert (= (and b!930768 ((_ is ValueCellFull!9518) mapDefault!31755)) b!930772))

(assert (= start!79260 b!930768))

(declare-fun m!864271 () Bool)

(assert (=> b!930767 m!864271))

(declare-fun m!864273 () Bool)

(assert (=> b!930770 m!864273))

(declare-fun m!864275 () Bool)

(assert (=> b!930773 m!864275))

(declare-fun m!864277 () Bool)

(assert (=> b!930773 m!864277))

(declare-fun m!864279 () Bool)

(assert (=> start!79260 m!864279))

(declare-fun m!864281 () Bool)

(assert (=> start!79260 m!864281))

(declare-fun m!864283 () Bool)

(assert (=> start!79260 m!864283))

(declare-fun m!864285 () Bool)

(assert (=> mapNonEmpty!31755 m!864285))

(declare-fun m!864287 () Bool)

(assert (=> b!930774 m!864287))

(check-sat (not mapNonEmpty!31755) (not b!930770) b_and!28531 (not b!930773) tp_is_empty!19999 (not b_next!17491) (not b!930774) (not b!930767) (not start!79260))
(check-sat b_and!28531 (not b_next!17491))
