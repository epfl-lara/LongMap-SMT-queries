; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79206 () Bool)

(assert start!79206)

(declare-fun b_free!17419 () Bool)

(declare-fun b_next!17419 () Bool)

(assert (=> start!79206 (= b_free!17419 (not b_next!17419))))

(declare-fun tp!60697 () Bool)

(declare-fun b_and!28485 () Bool)

(assert (=> start!79206 (= tp!60697 b_and!28485)))

(declare-fun b!929929 () Bool)

(declare-fun res!626243 () Bool)

(declare-fun e!522194 () Bool)

(assert (=> b!929929 (=> (not res!626243) (not e!522194))))

(declare-datatypes ((array!55804 0))(
  ( (array!55805 (arr!26847 (Array (_ BitVec 32) (_ BitVec 64))) (size!27306 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55804)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55804 (_ BitVec 32)) Bool)

(assert (=> b!929929 (= res!626243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929930 () Bool)

(declare-fun res!626239 () Bool)

(declare-fun e!522195 () Bool)

(assert (=> b!929930 (=> (not res!626239) (not e!522195))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31535 0))(
  ( (V!31536 (val!10014 Int)) )
))
(declare-fun v!791 () V!31535)

(declare-datatypes ((tuple2!13098 0))(
  ( (tuple2!13099 (_1!6560 (_ BitVec 64)) (_2!6560 V!31535)) )
))
(declare-datatypes ((List!18891 0))(
  ( (Nil!18888) (Cons!18887 (h!20033 tuple2!13098) (t!26948 List!18891)) )
))
(declare-datatypes ((ListLongMap!11795 0))(
  ( (ListLongMap!11796 (toList!5913 List!18891)) )
))
(declare-fun lt!419155 () ListLongMap!11795)

(declare-fun apply!736 (ListLongMap!11795 (_ BitVec 64)) V!31535)

(assert (=> b!929930 (= res!626239 (= (apply!736 lt!419155 k!1099) v!791))))

(declare-fun b!929931 () Bool)

(assert (=> b!929931 (= e!522194 e!522195)))

(declare-fun res!626245 () Bool)

(assert (=> b!929931 (=> (not res!626245) (not e!522195))))

(declare-fun contains!4965 (ListLongMap!11795 (_ BitVec 64)) Bool)

(assert (=> b!929931 (= res!626245 (contains!4965 lt!419155 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9482 0))(
  ( (ValueCellFull!9482 (v!12532 V!31535)) (EmptyCell!9482) )
))
(declare-datatypes ((array!55806 0))(
  ( (array!55807 (arr!26848 (Array (_ BitVec 32) ValueCell!9482)) (size!27307 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55806)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31535)

(declare-fun minValue!1173 () V!31535)

(declare-fun getCurrentListMap!3156 (array!55804 array!55806 (_ BitVec 32) (_ BitVec 32) V!31535 V!31535 (_ BitVec 32) Int) ListLongMap!11795)

(assert (=> b!929931 (= lt!419155 (getCurrentListMap!3156 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929932 () Bool)

(declare-fun res!626240 () Bool)

(assert (=> b!929932 (=> (not res!626240) (not e!522194))))

(assert (=> b!929932 (= res!626240 (and (= (size!27307 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27306 _keys!1487) (size!27307 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31647 () Bool)

(declare-fun mapRes!31647 () Bool)

(assert (=> mapIsEmpty!31647 mapRes!31647))

(declare-fun mapNonEmpty!31647 () Bool)

(declare-fun tp!60698 () Bool)

(declare-fun e!522198 () Bool)

(assert (=> mapNonEmpty!31647 (= mapRes!31647 (and tp!60698 e!522198))))

(declare-fun mapRest!31647 () (Array (_ BitVec 32) ValueCell!9482))

(declare-fun mapValue!31647 () ValueCell!9482)

(declare-fun mapKey!31647 () (_ BitVec 32))

(assert (=> mapNonEmpty!31647 (= (arr!26848 _values!1231) (store mapRest!31647 mapKey!31647 mapValue!31647))))

(declare-fun res!626241 () Bool)

(assert (=> start!79206 (=> (not res!626241) (not e!522194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79206 (= res!626241 (validMask!0 mask!1881))))

(assert (=> start!79206 e!522194))

(assert (=> start!79206 true))

(declare-fun tp_is_empty!19927 () Bool)

(assert (=> start!79206 tp_is_empty!19927))

(declare-fun e!522197 () Bool)

(declare-fun array_inv!20890 (array!55806) Bool)

(assert (=> start!79206 (and (array_inv!20890 _values!1231) e!522197)))

(assert (=> start!79206 tp!60697))

(declare-fun array_inv!20891 (array!55804) Bool)

(assert (=> start!79206 (array_inv!20891 _keys!1487)))

(declare-fun b!929933 () Bool)

(declare-fun e!522199 () Bool)

(assert (=> b!929933 (= e!522199 tp_is_empty!19927)))

(declare-fun b!929934 () Bool)

(assert (=> b!929934 (= e!522195 false)))

(declare-fun lt!419154 () Bool)

(assert (=> b!929934 (= lt!419154 (contains!4965 (getCurrentListMap!3156 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k!1099))))

(declare-fun b!929935 () Bool)

(assert (=> b!929935 (= e!522197 (and e!522199 mapRes!31647))))

(declare-fun condMapEmpty!31647 () Bool)

(declare-fun mapDefault!31647 () ValueCell!9482)

