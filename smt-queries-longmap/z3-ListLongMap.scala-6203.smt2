; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79334 () Bool)

(assert start!79334)

(declare-fun b_free!17539 () Bool)

(declare-fun b_next!17539 () Bool)

(assert (=> start!79334 (= b_free!17539 (not b_next!17539))))

(declare-fun tp!61061 () Bool)

(declare-fun b_and!28611 () Bool)

(assert (=> start!79334 (= tp!61061 b_and!28611)))

(declare-fun res!627582 () Bool)

(declare-fun e!523276 () Bool)

(assert (=> start!79334 (=> (not res!627582) (not e!523276))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79334 (= res!627582 (validMask!0 mask!1881))))

(assert (=> start!79334 e!523276))

(assert (=> start!79334 true))

(declare-fun tp_is_empty!20047 () Bool)

(assert (=> start!79334 tp_is_empty!20047))

(declare-datatypes ((V!31695 0))(
  ( (V!31696 (val!10074 Int)) )
))
(declare-datatypes ((ValueCell!9542 0))(
  ( (ValueCellFull!9542 (v!12592 V!31695)) (EmptyCell!9542) )
))
(declare-datatypes ((array!56003 0))(
  ( (array!56004 (arr!26946 (Array (_ BitVec 32) ValueCell!9542)) (size!27407 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56003)

(declare-fun e!523279 () Bool)

(declare-fun array_inv!21040 (array!56003) Bool)

(assert (=> start!79334 (and (array_inv!21040 _values!1231) e!523279)))

(assert (=> start!79334 tp!61061))

(declare-datatypes ((array!56005 0))(
  ( (array!56006 (arr!26947 (Array (_ BitVec 32) (_ BitVec 64))) (size!27408 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56005)

(declare-fun array_inv!21041 (array!56005) Bool)

(assert (=> start!79334 (array_inv!21041 _keys!1487)))

(declare-fun b!931796 () Bool)

(declare-fun e!523277 () Bool)

(assert (=> b!931796 (= e!523277 (not true))))

(declare-datatypes ((tuple2!13248 0))(
  ( (tuple2!13249 (_1!6635 (_ BitVec 64)) (_2!6635 V!31695)) )
))
(declare-datatypes ((List!19002 0))(
  ( (Nil!18999) (Cons!18998 (h!20144 tuple2!13248) (t!27076 List!19002)) )
))
(declare-datatypes ((ListLongMap!11935 0))(
  ( (ListLongMap!11936 (toList!5983 List!19002)) )
))
(declare-fun lt!419484 () ListLongMap!11935)

(declare-fun lt!419483 () tuple2!13248)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4982 (ListLongMap!11935 (_ BitVec 64)) Bool)

(declare-fun +!2794 (ListLongMap!11935 tuple2!13248) ListLongMap!11935)

(assert (=> b!931796 (contains!4982 (+!2794 lt!419484 lt!419483) k0!1099)))

(declare-fun lt!419482 () (_ BitVec 64))

(declare-datatypes ((Unit!31358 0))(
  ( (Unit!31359) )
))
(declare-fun lt!419481 () Unit!31358)

(declare-fun lt!419480 () V!31695)

(declare-fun addStillContains!483 (ListLongMap!11935 (_ BitVec 64) V!31695 (_ BitVec 64)) Unit!31358)

(assert (=> b!931796 (= lt!419481 (addStillContains!483 lt!419484 lt!419482 lt!419480 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31695)

(declare-fun minValue!1173 () V!31695)

(declare-fun getCurrentListMap!3157 (array!56005 array!56003 (_ BitVec 32) (_ BitVec 32) V!31695 V!31695 (_ BitVec 32) Int) ListLongMap!11935)

(assert (=> b!931796 (= (getCurrentListMap!3157 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2794 (getCurrentListMap!3157 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419483))))

(assert (=> b!931796 (= lt!419483 (tuple2!13249 lt!419482 lt!419480))))

(declare-fun get!14172 (ValueCell!9542 V!31695) V!31695)

(declare-fun dynLambda!1550 (Int (_ BitVec 64)) V!31695)

(assert (=> b!931796 (= lt!419480 (get!14172 (select (arr!26946 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1550 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419479 () Unit!31358)

(declare-fun lemmaListMapRecursiveValidKeyArray!158 (array!56005 array!56003 (_ BitVec 32) (_ BitVec 32) V!31695 V!31695 (_ BitVec 32) Int) Unit!31358)

(assert (=> b!931796 (= lt!419479 (lemmaListMapRecursiveValidKeyArray!158 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931797 () Bool)

(declare-fun res!627577 () Bool)

(assert (=> b!931797 (=> (not res!627577) (not e!523276))))

(assert (=> b!931797 (= res!627577 (and (= (size!27407 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27408 _keys!1487) (size!27407 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931798 () Bool)

(declare-fun res!627578 () Bool)

(assert (=> b!931798 (=> (not res!627578) (not e!523276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56005 (_ BitVec 32)) Bool)

(assert (=> b!931798 (= res!627578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931799 () Bool)

(declare-fun e!523278 () Bool)

(assert (=> b!931799 (= e!523276 e!523278)))

(declare-fun res!627576 () Bool)

(assert (=> b!931799 (=> (not res!627576) (not e!523278))))

(assert (=> b!931799 (= res!627576 (contains!4982 lt!419484 k0!1099))))

(assert (=> b!931799 (= lt!419484 (getCurrentListMap!3157 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931800 () Bool)

(declare-fun res!627580 () Bool)

(assert (=> b!931800 (=> (not res!627580) (not e!523276))))

(assert (=> b!931800 (= res!627580 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27408 _keys!1487))))))

(declare-fun b!931801 () Bool)

(assert (=> b!931801 (= e!523278 e!523277)))

(declare-fun res!627584 () Bool)

(assert (=> b!931801 (=> (not res!627584) (not e!523277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931801 (= res!627584 (validKeyInArray!0 lt!419482))))

(assert (=> b!931801 (= lt!419482 (select (arr!26947 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31830 () Bool)

(declare-fun mapRes!31830 () Bool)

(assert (=> mapIsEmpty!31830 mapRes!31830))

(declare-fun b!931802 () Bool)

(declare-fun res!627583 () Bool)

(assert (=> b!931802 (=> (not res!627583) (not e!523278))))

(declare-fun v!791 () V!31695)

(declare-fun apply!775 (ListLongMap!11935 (_ BitVec 64)) V!31695)

(assert (=> b!931802 (= res!627583 (= (apply!775 lt!419484 k0!1099) v!791))))

(declare-fun b!931803 () Bool)

(declare-fun res!627581 () Bool)

(assert (=> b!931803 (=> (not res!627581) (not e!523276))))

(declare-datatypes ((List!19003 0))(
  ( (Nil!19000) (Cons!18999 (h!20145 (_ BitVec 64)) (t!27077 List!19003)) )
))
(declare-fun arrayNoDuplicates!0 (array!56005 (_ BitVec 32) List!19003) Bool)

(assert (=> b!931803 (= res!627581 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19000))))

(declare-fun b!931804 () Bool)

(declare-fun e!523280 () Bool)

(assert (=> b!931804 (= e!523280 tp_is_empty!20047)))

(declare-fun b!931805 () Bool)

(declare-fun e!523275 () Bool)

(assert (=> b!931805 (= e!523275 tp_is_empty!20047)))

(declare-fun mapNonEmpty!31830 () Bool)

(declare-fun tp!61062 () Bool)

(assert (=> mapNonEmpty!31830 (= mapRes!31830 (and tp!61062 e!523275))))

(declare-fun mapRest!31830 () (Array (_ BitVec 32) ValueCell!9542))

(declare-fun mapKey!31830 () (_ BitVec 32))

(declare-fun mapValue!31830 () ValueCell!9542)

(assert (=> mapNonEmpty!31830 (= (arr!26946 _values!1231) (store mapRest!31830 mapKey!31830 mapValue!31830))))

(declare-fun b!931806 () Bool)

(declare-fun res!627579 () Bool)

(assert (=> b!931806 (=> (not res!627579) (not e!523278))))

(assert (=> b!931806 (= res!627579 (validKeyInArray!0 k0!1099))))

(declare-fun b!931807 () Bool)

(assert (=> b!931807 (= e!523279 (and e!523280 mapRes!31830))))

(declare-fun condMapEmpty!31830 () Bool)

(declare-fun mapDefault!31830 () ValueCell!9542)

(assert (=> b!931807 (= condMapEmpty!31830 (= (arr!26946 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9542)) mapDefault!31830)))))

(declare-fun b!931808 () Bool)

(declare-fun res!627575 () Bool)

(assert (=> b!931808 (=> (not res!627575) (not e!523278))))

(assert (=> b!931808 (= res!627575 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!79334 res!627582) b!931797))

(assert (= (and b!931797 res!627577) b!931798))

(assert (= (and b!931798 res!627578) b!931803))

(assert (= (and b!931803 res!627581) b!931800))

(assert (= (and b!931800 res!627580) b!931799))

(assert (= (and b!931799 res!627576) b!931802))

(assert (= (and b!931802 res!627583) b!931808))

(assert (= (and b!931808 res!627575) b!931806))

(assert (= (and b!931806 res!627579) b!931801))

(assert (= (and b!931801 res!627584) b!931796))

(assert (= (and b!931807 condMapEmpty!31830) mapIsEmpty!31830))

(assert (= (and b!931807 (not condMapEmpty!31830)) mapNonEmpty!31830))

(get-info :version)

(assert (= (and mapNonEmpty!31830 ((_ is ValueCellFull!9542) mapValue!31830)) b!931805))

(assert (= (and b!931807 ((_ is ValueCellFull!9542) mapDefault!31830)) b!931804))

(assert (= start!79334 b!931807))

(declare-fun b_lambda!13855 () Bool)

(assert (=> (not b_lambda!13855) (not b!931796)))

(declare-fun t!27075 () Bool)

(declare-fun tb!5925 () Bool)

(assert (=> (and start!79334 (= defaultEntry!1235 defaultEntry!1235) t!27075) tb!5925))

(declare-fun result!11683 () Bool)

(assert (=> tb!5925 (= result!11683 tp_is_empty!20047)))

(assert (=> b!931796 t!27075))

(declare-fun b_and!28613 () Bool)

(assert (= b_and!28611 (and (=> t!27075 result!11683) b_and!28613)))

(declare-fun m!865217 () Bool)

(assert (=> b!931796 m!865217))

(declare-fun m!865219 () Bool)

(assert (=> b!931796 m!865219))

(declare-fun m!865221 () Bool)

(assert (=> b!931796 m!865221))

(declare-fun m!865223 () Bool)

(assert (=> b!931796 m!865223))

(assert (=> b!931796 m!865221))

(assert (=> b!931796 m!865223))

(declare-fun m!865225 () Bool)

(assert (=> b!931796 m!865225))

(declare-fun m!865227 () Bool)

(assert (=> b!931796 m!865227))

(declare-fun m!865229 () Bool)

(assert (=> b!931796 m!865229))

(declare-fun m!865231 () Bool)

(assert (=> b!931796 m!865231))

(assert (=> b!931796 m!865217))

(declare-fun m!865233 () Bool)

(assert (=> b!931796 m!865233))

(assert (=> b!931796 m!865229))

(declare-fun m!865235 () Bool)

(assert (=> b!931796 m!865235))

(declare-fun m!865237 () Bool)

(assert (=> b!931806 m!865237))

(declare-fun m!865239 () Bool)

(assert (=> b!931801 m!865239))

(declare-fun m!865241 () Bool)

(assert (=> b!931801 m!865241))

(declare-fun m!865243 () Bool)

(assert (=> b!931799 m!865243))

(declare-fun m!865245 () Bool)

(assert (=> b!931799 m!865245))

(declare-fun m!865247 () Bool)

(assert (=> b!931798 m!865247))

(declare-fun m!865249 () Bool)

(assert (=> b!931803 m!865249))

(declare-fun m!865251 () Bool)

(assert (=> start!79334 m!865251))

(declare-fun m!865253 () Bool)

(assert (=> start!79334 m!865253))

(declare-fun m!865255 () Bool)

(assert (=> start!79334 m!865255))

(declare-fun m!865257 () Bool)

(assert (=> mapNonEmpty!31830 m!865257))

(declare-fun m!865259 () Bool)

(assert (=> b!931802 m!865259))

(check-sat (not b!931796) b_and!28613 tp_is_empty!20047 (not start!79334) (not b!931803) (not b!931798) (not b!931799) (not b!931802) (not mapNonEmpty!31830) (not b!931801) (not b_lambda!13855) (not b_next!17539) (not b!931806))
(check-sat b_and!28613 (not b_next!17539))
