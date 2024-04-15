; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79206 () Bool)

(assert start!79206)

(declare-fun b_free!17437 () Bool)

(declare-fun b_next!17437 () Bool)

(assert (=> start!79206 (= b_free!17437 (not b_next!17437))))

(declare-fun tp!60752 () Bool)

(declare-fun b_and!28477 () Bool)

(assert (=> start!79206 (= tp!60752 b_and!28477)))

(declare-fun b!929996 () Bool)

(declare-fun e!522208 () Bool)

(declare-fun tp_is_empty!19945 () Bool)

(assert (=> b!929996 (= e!522208 tp_is_empty!19945)))

(declare-fun b!929997 () Bool)

(declare-fun e!522212 () Bool)

(declare-fun mapRes!31674 () Bool)

(assert (=> b!929997 (= e!522212 (and e!522208 mapRes!31674))))

(declare-fun condMapEmpty!31674 () Bool)

(declare-datatypes ((V!31559 0))(
  ( (V!31560 (val!10023 Int)) )
))
(declare-datatypes ((ValueCell!9491 0))(
  ( (ValueCellFull!9491 (v!12540 V!31559)) (EmptyCell!9491) )
))
(declare-datatypes ((array!55803 0))(
  ( (array!55804 (arr!26847 (Array (_ BitVec 32) ValueCell!9491)) (size!27308 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55803)

(declare-fun mapDefault!31674 () ValueCell!9491)

(assert (=> b!929997 (= condMapEmpty!31674 (= (arr!26847 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9491)) mapDefault!31674)))))

(declare-fun mapNonEmpty!31674 () Bool)

(declare-fun tp!60753 () Bool)

(declare-fun e!522211 () Bool)

(assert (=> mapNonEmpty!31674 (= mapRes!31674 (and tp!60753 e!522211))))

(declare-fun mapKey!31674 () (_ BitVec 32))

(declare-fun mapValue!31674 () ValueCell!9491)

(declare-fun mapRest!31674 () (Array (_ BitVec 32) ValueCell!9491))

(assert (=> mapNonEmpty!31674 (= (arr!26847 _values!1231) (store mapRest!31674 mapKey!31674 mapValue!31674))))

(declare-fun b!929998 () Bool)

(declare-fun res!626356 () Bool)

(declare-fun e!522210 () Bool)

(assert (=> b!929998 (=> (not res!626356) (not e!522210))))

(declare-datatypes ((array!55805 0))(
  ( (array!55806 (arr!26848 (Array (_ BitVec 32) (_ BitVec 64))) (size!27309 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55805)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55805 (_ BitVec 32)) Bool)

(assert (=> b!929998 (= res!626356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929999 () Bool)

(assert (=> b!929999 (= e!522211 tp_is_empty!19945)))

(declare-fun b!930000 () Bool)

(declare-fun res!626360 () Bool)

(declare-fun e!522213 () Bool)

(assert (=> b!930000 (=> (not res!626360) (not e!522213))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31559)

(declare-datatypes ((tuple2!13162 0))(
  ( (tuple2!13163 (_1!6592 (_ BitVec 64)) (_2!6592 V!31559)) )
))
(declare-datatypes ((List!18920 0))(
  ( (Nil!18917) (Cons!18916 (h!20062 tuple2!13162) (t!26968 List!18920)) )
))
(declare-datatypes ((ListLongMap!11849 0))(
  ( (ListLongMap!11850 (toList!5940 List!18920)) )
))
(declare-fun lt!418964 () ListLongMap!11849)

(declare-fun apply!741 (ListLongMap!11849 (_ BitVec 64)) V!31559)

(assert (=> b!930000 (= res!626360 (= (apply!741 lt!418964 k0!1099) v!791))))

(declare-fun mapIsEmpty!31674 () Bool)

(assert (=> mapIsEmpty!31674 mapRes!31674))

(declare-fun b!930001 () Bool)

(declare-fun res!626354 () Bool)

(assert (=> b!930001 (=> (not res!626354) (not e!522210))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!930001 (= res!626354 (and (= (size!27308 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27309 _keys!1487) (size!27308 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930002 () Bool)

(assert (=> b!930002 (= e!522213 false)))

(declare-fun lt!418963 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31559)

(declare-fun minValue!1173 () V!31559)

(declare-fun contains!4945 (ListLongMap!11849 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3119 (array!55805 array!55803 (_ BitVec 32) (_ BitVec 32) V!31559 V!31559 (_ BitVec 32) Int) ListLongMap!11849)

(assert (=> b!930002 (= lt!418963 (contains!4945 (getCurrentListMap!3119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!930003 () Bool)

(declare-fun res!626357 () Bool)

(assert (=> b!930003 (=> (not res!626357) (not e!522210))))

(declare-datatypes ((List!18921 0))(
  ( (Nil!18918) (Cons!18917 (h!20063 (_ BitVec 64)) (t!26969 List!18921)) )
))
(declare-fun arrayNoDuplicates!0 (array!55805 (_ BitVec 32) List!18921) Bool)

(assert (=> b!930003 (= res!626357 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18918))))

(declare-fun b!930004 () Bool)

(declare-fun res!626353 () Bool)

(assert (=> b!930004 (=> (not res!626353) (not e!522213))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930004 (= res!626353 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930005 () Bool)

(assert (=> b!930005 (= e!522210 e!522213)))

(declare-fun res!626358 () Bool)

(assert (=> b!930005 (=> (not res!626358) (not e!522213))))

(assert (=> b!930005 (= res!626358 (contains!4945 lt!418964 k0!1099))))

(assert (=> b!930005 (= lt!418964 (getCurrentListMap!3119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!626359 () Bool)

(assert (=> start!79206 (=> (not res!626359) (not e!522210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79206 (= res!626359 (validMask!0 mask!1881))))

(assert (=> start!79206 e!522210))

(assert (=> start!79206 true))

(assert (=> start!79206 tp_is_empty!19945))

(declare-fun array_inv!20976 (array!55803) Bool)

(assert (=> start!79206 (and (array_inv!20976 _values!1231) e!522212)))

(assert (=> start!79206 tp!60752))

(declare-fun array_inv!20977 (array!55805) Bool)

(assert (=> start!79206 (array_inv!20977 _keys!1487)))

(declare-fun b!930006 () Bool)

(declare-fun res!626355 () Bool)

(assert (=> b!930006 (=> (not res!626355) (not e!522210))))

(assert (=> b!930006 (= res!626355 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27309 _keys!1487))))))

(assert (= (and start!79206 res!626359) b!930001))

(assert (= (and b!930001 res!626354) b!929998))

(assert (= (and b!929998 res!626356) b!930003))

(assert (= (and b!930003 res!626357) b!930006))

(assert (= (and b!930006 res!626355) b!930005))

(assert (= (and b!930005 res!626358) b!930000))

(assert (= (and b!930000 res!626360) b!930004))

(assert (= (and b!930004 res!626353) b!930002))

(assert (= (and b!929997 condMapEmpty!31674) mapIsEmpty!31674))

(assert (= (and b!929997 (not condMapEmpty!31674)) mapNonEmpty!31674))

(get-info :version)

(assert (= (and mapNonEmpty!31674 ((_ is ValueCellFull!9491) mapValue!31674)) b!929999))

(assert (= (and b!929997 ((_ is ValueCellFull!9491) mapDefault!31674)) b!929996))

(assert (= start!79206 b!929997))

(declare-fun m!863767 () Bool)

(assert (=> start!79206 m!863767))

(declare-fun m!863769 () Bool)

(assert (=> start!79206 m!863769))

(declare-fun m!863771 () Bool)

(assert (=> start!79206 m!863771))

(declare-fun m!863773 () Bool)

(assert (=> b!930003 m!863773))

(declare-fun m!863775 () Bool)

(assert (=> b!929998 m!863775))

(declare-fun m!863777 () Bool)

(assert (=> b!930005 m!863777))

(declare-fun m!863779 () Bool)

(assert (=> b!930005 m!863779))

(declare-fun m!863781 () Bool)

(assert (=> b!930000 m!863781))

(declare-fun m!863783 () Bool)

(assert (=> b!930002 m!863783))

(assert (=> b!930002 m!863783))

(declare-fun m!863785 () Bool)

(assert (=> b!930002 m!863785))

(declare-fun m!863787 () Bool)

(assert (=> mapNonEmpty!31674 m!863787))

(check-sat (not b!930002) (not b!930005) (not b!930003) (not start!79206) (not b!930000) b_and!28477 tp_is_empty!19945 (not b_next!17437) (not b!929998) (not mapNonEmpty!31674))
(check-sat b_and!28477 (not b_next!17437))
