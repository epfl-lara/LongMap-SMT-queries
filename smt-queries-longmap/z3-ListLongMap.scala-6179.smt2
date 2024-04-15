; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79164 () Bool)

(assert start!79164)

(declare-fun b_free!17395 () Bool)

(declare-fun b_next!17395 () Bool)

(assert (=> start!79164 (= b_free!17395 (not b_next!17395))))

(declare-fun tp!60626 () Bool)

(declare-fun b_and!28435 () Bool)

(assert (=> start!79164 (= tp!60626 b_and!28435)))

(declare-fun b!929294 () Bool)

(declare-fun res!625844 () Bool)

(declare-fun e!521831 () Bool)

(assert (=> b!929294 (=> (not res!625844) (not e!521831))))

(declare-datatypes ((array!55727 0))(
  ( (array!55728 (arr!26809 (Array (_ BitVec 32) (_ BitVec 64))) (size!27270 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55727)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55727 (_ BitVec 32)) Bool)

(assert (=> b!929294 (= res!625844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929295 () Bool)

(declare-fun e!521835 () Bool)

(assert (=> b!929295 (= e!521831 e!521835)))

(declare-fun res!625847 () Bool)

(assert (=> b!929295 (=> (not res!625847) (not e!521835))))

(declare-datatypes ((V!31503 0))(
  ( (V!31504 (val!10002 Int)) )
))
(declare-datatypes ((tuple2!13128 0))(
  ( (tuple2!13129 (_1!6575 (_ BitVec 64)) (_2!6575 V!31503)) )
))
(declare-datatypes ((List!18891 0))(
  ( (Nil!18888) (Cons!18887 (h!20033 tuple2!13128) (t!26939 List!18891)) )
))
(declare-datatypes ((ListLongMap!11815 0))(
  ( (ListLongMap!11816 (toList!5923 List!18891)) )
))
(declare-fun lt!418846 () ListLongMap!11815)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4930 (ListLongMap!11815 (_ BitVec 64)) Bool)

(assert (=> b!929295 (= res!625847 (contains!4930 lt!418846 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9470 0))(
  ( (ValueCellFull!9470 (v!12519 V!31503)) (EmptyCell!9470) )
))
(declare-datatypes ((array!55729 0))(
  ( (array!55730 (arr!26810 (Array (_ BitVec 32) ValueCell!9470)) (size!27271 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55729)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31503)

(declare-fun minValue!1173 () V!31503)

(declare-fun getCurrentListMap!3104 (array!55727 array!55729 (_ BitVec 32) (_ BitVec 32) V!31503 V!31503 (_ BitVec 32) Int) ListLongMap!11815)

(assert (=> b!929295 (= lt!418846 (getCurrentListMap!3104 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929296 () Bool)

(declare-fun res!625841 () Bool)

(assert (=> b!929296 (=> (not res!625841) (not e!521835))))

(assert (=> b!929296 (= res!625841 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929297 () Bool)

(declare-fun res!625845 () Bool)

(assert (=> b!929297 (=> (not res!625845) (not e!521835))))

(declare-fun v!791 () V!31503)

(declare-fun apply!727 (ListLongMap!11815 (_ BitVec 64)) V!31503)

(assert (=> b!929297 (= res!625845 (= (apply!727 lt!418846 k0!1099) v!791))))

(declare-fun res!625840 () Bool)

(assert (=> start!79164 (=> (not res!625840) (not e!521831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79164 (= res!625840 (validMask!0 mask!1881))))

(assert (=> start!79164 e!521831))

(assert (=> start!79164 true))

(declare-fun tp_is_empty!19903 () Bool)

(assert (=> start!79164 tp_is_empty!19903))

(declare-fun e!521834 () Bool)

(declare-fun array_inv!20950 (array!55729) Bool)

(assert (=> start!79164 (and (array_inv!20950 _values!1231) e!521834)))

(assert (=> start!79164 tp!60626))

(declare-fun array_inv!20951 (array!55727) Bool)

(assert (=> start!79164 (array_inv!20951 _keys!1487)))

(declare-fun mapNonEmpty!31611 () Bool)

(declare-fun mapRes!31611 () Bool)

(declare-fun tp!60627 () Bool)

(declare-fun e!521830 () Bool)

(assert (=> mapNonEmpty!31611 (= mapRes!31611 (and tp!60627 e!521830))))

(declare-fun mapKey!31611 () (_ BitVec 32))

(declare-fun mapValue!31611 () ValueCell!9470)

(declare-fun mapRest!31611 () (Array (_ BitVec 32) ValueCell!9470))

(assert (=> mapNonEmpty!31611 (= (arr!26810 _values!1231) (store mapRest!31611 mapKey!31611 mapValue!31611))))

(declare-fun b!929298 () Bool)

(declare-fun e!521833 () Bool)

(assert (=> b!929298 (= e!521833 tp_is_empty!19903)))

(declare-fun mapIsEmpty!31611 () Bool)

(assert (=> mapIsEmpty!31611 mapRes!31611))

(declare-fun b!929299 () Bool)

(declare-fun res!625842 () Bool)

(assert (=> b!929299 (=> (not res!625842) (not e!521831))))

(assert (=> b!929299 (= res!625842 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27270 _keys!1487))))))

(declare-fun b!929300 () Bool)

(assert (=> b!929300 (= e!521830 tp_is_empty!19903)))

(declare-fun b!929301 () Bool)

(declare-fun res!625843 () Bool)

(assert (=> b!929301 (=> (not res!625843) (not e!521831))))

(assert (=> b!929301 (= res!625843 (and (= (size!27271 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27270 _keys!1487) (size!27271 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929302 () Bool)

(assert (=> b!929302 (= e!521834 (and e!521833 mapRes!31611))))

(declare-fun condMapEmpty!31611 () Bool)

(declare-fun mapDefault!31611 () ValueCell!9470)

(assert (=> b!929302 (= condMapEmpty!31611 (= (arr!26810 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9470)) mapDefault!31611)))))

(declare-fun b!929303 () Bool)

(declare-fun res!625846 () Bool)

(assert (=> b!929303 (=> (not res!625846) (not e!521831))))

(declare-datatypes ((List!18892 0))(
  ( (Nil!18889) (Cons!18888 (h!20034 (_ BitVec 64)) (t!26940 List!18892)) )
))
(declare-fun arrayNoDuplicates!0 (array!55727 (_ BitVec 32) List!18892) Bool)

(assert (=> b!929303 (= res!625846 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18889))))

(declare-fun b!929304 () Bool)

(assert (=> b!929304 (= e!521835 false)))

(declare-fun lt!418847 () Bool)

(assert (=> b!929304 (= lt!418847 (contains!4930 (getCurrentListMap!3104 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(assert (= (and start!79164 res!625840) b!929301))

(assert (= (and b!929301 res!625843) b!929294))

(assert (= (and b!929294 res!625844) b!929303))

(assert (= (and b!929303 res!625846) b!929299))

(assert (= (and b!929299 res!625842) b!929295))

(assert (= (and b!929295 res!625847) b!929297))

(assert (= (and b!929297 res!625845) b!929296))

(assert (= (and b!929296 res!625841) b!929304))

(assert (= (and b!929302 condMapEmpty!31611) mapIsEmpty!31611))

(assert (= (and b!929302 (not condMapEmpty!31611)) mapNonEmpty!31611))

(get-info :version)

(assert (= (and mapNonEmpty!31611 ((_ is ValueCellFull!9470) mapValue!31611)) b!929300))

(assert (= (and b!929302 ((_ is ValueCellFull!9470) mapDefault!31611)) b!929298))

(assert (= start!79164 b!929302))

(declare-fun m!863305 () Bool)

(assert (=> mapNonEmpty!31611 m!863305))

(declare-fun m!863307 () Bool)

(assert (=> b!929297 m!863307))

(declare-fun m!863309 () Bool)

(assert (=> b!929294 m!863309))

(declare-fun m!863311 () Bool)

(assert (=> b!929303 m!863311))

(declare-fun m!863313 () Bool)

(assert (=> b!929304 m!863313))

(assert (=> b!929304 m!863313))

(declare-fun m!863315 () Bool)

(assert (=> b!929304 m!863315))

(declare-fun m!863317 () Bool)

(assert (=> start!79164 m!863317))

(declare-fun m!863319 () Bool)

(assert (=> start!79164 m!863319))

(declare-fun m!863321 () Bool)

(assert (=> start!79164 m!863321))

(declare-fun m!863323 () Bool)

(assert (=> b!929295 m!863323))

(declare-fun m!863325 () Bool)

(assert (=> b!929295 m!863325))

(check-sat (not b!929295) b_and!28435 (not b!929294) (not b_next!17395) (not start!79164) (not b!929303) tp_is_empty!19903 (not b!929297) (not b!929304) (not mapNonEmpty!31611))
(check-sat b_and!28435 (not b_next!17395))
