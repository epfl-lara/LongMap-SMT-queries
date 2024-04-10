; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79170 () Bool)

(assert start!79170)

(declare-fun b_free!17383 () Bool)

(declare-fun b_next!17383 () Bool)

(assert (=> start!79170 (= b_free!17383 (not b_next!17383))))

(declare-fun tp!60590 () Bool)

(declare-fun b_and!28449 () Bool)

(assert (=> start!79170 (= tp!60590 b_and!28449)))

(declare-fun b!929335 () Bool)

(declare-fun e!521875 () Bool)

(assert (=> b!929335 (= e!521875 false)))

(declare-fun lt!419047 () Bool)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31487 0))(
  ( (V!31488 (val!9996 Int)) )
))
(declare-datatypes ((ValueCell!9464 0))(
  ( (ValueCellFull!9464 (v!12514 V!31487)) (EmptyCell!9464) )
))
(declare-datatypes ((array!55736 0))(
  ( (array!55737 (arr!26813 (Array (_ BitVec 32) ValueCell!9464)) (size!27272 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55736)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((array!55738 0))(
  ( (array!55739 (arr!26814 (Array (_ BitVec 32) (_ BitVec 64))) (size!27273 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55738)

(declare-fun zeroValue!1173 () V!31487)

(declare-fun minValue!1173 () V!31487)

(declare-datatypes ((tuple2!13068 0))(
  ( (tuple2!13069 (_1!6545 (_ BitVec 64)) (_2!6545 V!31487)) )
))
(declare-datatypes ((List!18861 0))(
  ( (Nil!18858) (Cons!18857 (h!20003 tuple2!13068) (t!26918 List!18861)) )
))
(declare-datatypes ((ListLongMap!11765 0))(
  ( (ListLongMap!11766 (toList!5898 List!18861)) )
))
(declare-fun contains!4951 (ListLongMap!11765 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3142 (array!55738 array!55736 (_ BitVec 32) (_ BitVec 32) V!31487 V!31487 (_ BitVec 32) Int) ListLongMap!11765)

(assert (=> b!929335 (= lt!419047 (contains!4951 (getCurrentListMap!3142 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k!1099))))

(declare-fun b!929336 () Bool)

(declare-fun res!625811 () Bool)

(declare-fun e!521871 () Bool)

(assert (=> b!929336 (=> (not res!625811) (not e!521871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55738 (_ BitVec 32)) Bool)

(assert (=> b!929336 (= res!625811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31593 () Bool)

(declare-fun mapRes!31593 () Bool)

(declare-fun tp!60589 () Bool)

(declare-fun e!521872 () Bool)

(assert (=> mapNonEmpty!31593 (= mapRes!31593 (and tp!60589 e!521872))))

(declare-fun mapKey!31593 () (_ BitVec 32))

(declare-fun mapRest!31593 () (Array (_ BitVec 32) ValueCell!9464))

(declare-fun mapValue!31593 () ValueCell!9464)

(assert (=> mapNonEmpty!31593 (= (arr!26813 _values!1231) (store mapRest!31593 mapKey!31593 mapValue!31593))))

(declare-fun b!929337 () Bool)

(assert (=> b!929337 (= e!521871 e!521875)))

(declare-fun res!625809 () Bool)

(assert (=> b!929337 (=> (not res!625809) (not e!521875))))

(declare-fun lt!419046 () ListLongMap!11765)

(assert (=> b!929337 (= res!625809 (contains!4951 lt!419046 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929337 (= lt!419046 (getCurrentListMap!3142 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929338 () Bool)

(declare-fun tp_is_empty!19891 () Bool)

(assert (=> b!929338 (= e!521872 tp_is_empty!19891)))

(declare-fun b!929339 () Bool)

(declare-fun res!625813 () Bool)

(assert (=> b!929339 (=> (not res!625813) (not e!521875))))

(assert (=> b!929339 (= res!625813 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31593 () Bool)

(assert (=> mapIsEmpty!31593 mapRes!31593))

(declare-fun b!929340 () Bool)

(declare-fun res!625808 () Bool)

(assert (=> b!929340 (=> (not res!625808) (not e!521871))))

(declare-datatypes ((List!18862 0))(
  ( (Nil!18859) (Cons!18858 (h!20004 (_ BitVec 64)) (t!26919 List!18862)) )
))
(declare-fun arrayNoDuplicates!0 (array!55738 (_ BitVec 32) List!18862) Bool)

(assert (=> b!929340 (= res!625808 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18859))))

(declare-fun b!929342 () Bool)

(declare-fun res!625806 () Bool)

(assert (=> b!929342 (=> (not res!625806) (not e!521871))))

(assert (=> b!929342 (= res!625806 (and (= (size!27272 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27273 _keys!1487) (size!27272 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929343 () Bool)

(declare-fun e!521870 () Bool)

(assert (=> b!929343 (= e!521870 tp_is_empty!19891)))

(declare-fun b!929344 () Bool)

(declare-fun res!625812 () Bool)

(assert (=> b!929344 (=> (not res!625812) (not e!521871))))

(assert (=> b!929344 (= res!625812 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27273 _keys!1487))))))

(declare-fun b!929345 () Bool)

(declare-fun res!625807 () Bool)

(assert (=> b!929345 (=> (not res!625807) (not e!521875))))

(declare-fun v!791 () V!31487)

(declare-fun apply!724 (ListLongMap!11765 (_ BitVec 64)) V!31487)

(assert (=> b!929345 (= res!625807 (= (apply!724 lt!419046 k!1099) v!791))))

(declare-fun res!625810 () Bool)

(assert (=> start!79170 (=> (not res!625810) (not e!521871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79170 (= res!625810 (validMask!0 mask!1881))))

(assert (=> start!79170 e!521871))

(assert (=> start!79170 true))

(assert (=> start!79170 tp_is_empty!19891))

(declare-fun e!521873 () Bool)

(declare-fun array_inv!20866 (array!55736) Bool)

(assert (=> start!79170 (and (array_inv!20866 _values!1231) e!521873)))

(assert (=> start!79170 tp!60590))

(declare-fun array_inv!20867 (array!55738) Bool)

(assert (=> start!79170 (array_inv!20867 _keys!1487)))

(declare-fun b!929341 () Bool)

(assert (=> b!929341 (= e!521873 (and e!521870 mapRes!31593))))

(declare-fun condMapEmpty!31593 () Bool)

(declare-fun mapDefault!31593 () ValueCell!9464)

