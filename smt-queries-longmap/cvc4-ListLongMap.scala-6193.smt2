; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79270 () Bool)

(assert start!79270)

(declare-fun b_free!17483 () Bool)

(declare-fun b_next!17483 () Bool)

(assert (=> start!79270 (= b_free!17483 (not b_next!17483))))

(declare-fun tp!60889 () Bool)

(declare-fun b_and!28549 () Bool)

(assert (=> start!79270 (= tp!60889 b_and!28549)))

(declare-fun b!930897 () Bool)

(declare-fun res!626919 () Bool)

(declare-fun e!522770 () Bool)

(assert (=> b!930897 (=> (not res!626919) (not e!522770))))

(declare-datatypes ((array!55922 0))(
  ( (array!55923 (arr!26906 (Array (_ BitVec 32) (_ BitVec 64))) (size!27365 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55922)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31619 0))(
  ( (V!31620 (val!10046 Int)) )
))
(declare-datatypes ((ValueCell!9514 0))(
  ( (ValueCellFull!9514 (v!12564 V!31619)) (EmptyCell!9514) )
))
(declare-datatypes ((array!55924 0))(
  ( (array!55925 (arr!26907 (Array (_ BitVec 32) ValueCell!9514)) (size!27366 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55924)

(assert (=> b!930897 (= res!626919 (and (= (size!27366 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27365 _keys!1487) (size!27366 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!626918 () Bool)

(assert (=> start!79270 (=> (not res!626918) (not e!522770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79270 (= res!626918 (validMask!0 mask!1881))))

(assert (=> start!79270 e!522770))

(assert (=> start!79270 true))

(declare-fun e!522775 () Bool)

(declare-fun array_inv!20940 (array!55924) Bool)

(assert (=> start!79270 (and (array_inv!20940 _values!1231) e!522775)))

(assert (=> start!79270 tp!60889))

(declare-fun array_inv!20941 (array!55922) Bool)

(assert (=> start!79270 (array_inv!20941 _keys!1487)))

(declare-fun tp_is_empty!19991 () Bool)

(assert (=> start!79270 tp_is_empty!19991))

(declare-fun b!930898 () Bool)

(declare-fun e!522771 () Bool)

(assert (=> b!930898 (= e!522770 e!522771)))

(declare-fun res!626922 () Bool)

(assert (=> b!930898 (=> (not res!626922) (not e!522771))))

(declare-datatypes ((tuple2!13150 0))(
  ( (tuple2!13151 (_1!6586 (_ BitVec 64)) (_2!6586 V!31619)) )
))
(declare-datatypes ((List!18940 0))(
  ( (Nil!18937) (Cons!18936 (h!20082 tuple2!13150) (t!26997 List!18940)) )
))
(declare-datatypes ((ListLongMap!11847 0))(
  ( (ListLongMap!11848 (toList!5939 List!18940)) )
))
(declare-fun lt!419329 () ListLongMap!11847)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4987 (ListLongMap!11847 (_ BitVec 64)) Bool)

(assert (=> b!930898 (= res!626922 (contains!4987 lt!419329 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31619)

(declare-fun minValue!1173 () V!31619)

(declare-fun getCurrentListMap!3178 (array!55922 array!55924 (_ BitVec 32) (_ BitVec 32) V!31619 V!31619 (_ BitVec 32) Int) ListLongMap!11847)

(assert (=> b!930898 (= lt!419329 (getCurrentListMap!3178 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930899 () Bool)

(declare-fun e!522772 () Bool)

(assert (=> b!930899 (= e!522772 tp_is_empty!19991)))

(declare-fun b!930900 () Bool)

(declare-fun res!626923 () Bool)

(assert (=> b!930900 (=> (not res!626923) (not e!522770))))

(assert (=> b!930900 (= res!626923 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27365 _keys!1487))))))

(declare-fun b!930901 () Bool)

(declare-fun e!522773 () Bool)

(declare-fun mapRes!31743 () Bool)

(assert (=> b!930901 (= e!522775 (and e!522773 mapRes!31743))))

(declare-fun condMapEmpty!31743 () Bool)

(declare-fun mapDefault!31743 () ValueCell!9514)

