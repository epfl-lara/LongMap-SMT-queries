; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79278 () Bool)

(assert start!79278)

(declare-fun b_free!17491 () Bool)

(declare-fun b_next!17491 () Bool)

(assert (=> start!79278 (= b_free!17491 (not b_next!17491))))

(declare-fun tp!60913 () Bool)

(declare-fun b_and!28557 () Bool)

(assert (=> start!79278 (= tp!60913 b_and!28557)))

(declare-fun b!931005 () Bool)

(declare-fun e!522847 () Bool)

(declare-fun e!522843 () Bool)

(assert (=> b!931005 (= e!522847 e!522843)))

(declare-fun res!626992 () Bool)

(assert (=> b!931005 (=> (not res!626992) (not e!522843))))

(declare-datatypes ((V!31631 0))(
  ( (V!31632 (val!10050 Int)) )
))
(declare-datatypes ((tuple2!13158 0))(
  ( (tuple2!13159 (_1!6590 (_ BitVec 64)) (_2!6590 V!31631)) )
))
(declare-datatypes ((List!18946 0))(
  ( (Nil!18943) (Cons!18942 (h!20088 tuple2!13158) (t!27003 List!18946)) )
))
(declare-datatypes ((ListLongMap!11855 0))(
  ( (ListLongMap!11856 (toList!5943 List!18946)) )
))
(declare-fun lt!419352 () ListLongMap!11855)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4991 (ListLongMap!11855 (_ BitVec 64)) Bool)

(assert (=> b!931005 (= res!626992 (contains!4991 lt!419352 k!1099))))

(declare-datatypes ((array!55938 0))(
  ( (array!55939 (arr!26914 (Array (_ BitVec 32) (_ BitVec 64))) (size!27373 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55938)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9518 0))(
  ( (ValueCellFull!9518 (v!12568 V!31631)) (EmptyCell!9518) )
))
(declare-datatypes ((array!55940 0))(
  ( (array!55941 (arr!26915 (Array (_ BitVec 32) ValueCell!9518)) (size!27374 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55940)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31631)

(declare-fun minValue!1173 () V!31631)

(declare-fun getCurrentListMap!3182 (array!55938 array!55940 (_ BitVec 32) (_ BitVec 32) V!31631 V!31631 (_ BitVec 32) Int) ListLongMap!11855)

(assert (=> b!931005 (= lt!419352 (getCurrentListMap!3182 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931006 () Bool)

(assert (=> b!931006 (= e!522843 false)))

(declare-fun lt!419353 () V!31631)

(declare-fun apply!764 (ListLongMap!11855 (_ BitVec 64)) V!31631)

(assert (=> b!931006 (= lt!419353 (apply!764 lt!419352 k!1099))))

(declare-fun mapNonEmpty!31755 () Bool)

(declare-fun mapRes!31755 () Bool)

(declare-fun tp!60914 () Bool)

(declare-fun e!522846 () Bool)

(assert (=> mapNonEmpty!31755 (= mapRes!31755 (and tp!60914 e!522846))))

(declare-fun mapRest!31755 () (Array (_ BitVec 32) ValueCell!9518))

(declare-fun mapKey!31755 () (_ BitVec 32))

(declare-fun mapValue!31755 () ValueCell!9518)

(assert (=> mapNonEmpty!31755 (= (arr!26915 _values!1231) (store mapRest!31755 mapKey!31755 mapValue!31755))))

(declare-fun res!626990 () Bool)

(assert (=> start!79278 (=> (not res!626990) (not e!522847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79278 (= res!626990 (validMask!0 mask!1881))))

(assert (=> start!79278 e!522847))

(assert (=> start!79278 true))

(declare-fun e!522844 () Bool)

(declare-fun array_inv!20946 (array!55940) Bool)

(assert (=> start!79278 (and (array_inv!20946 _values!1231) e!522844)))

(assert (=> start!79278 tp!60913))

(declare-fun array_inv!20947 (array!55938) Bool)

(assert (=> start!79278 (array_inv!20947 _keys!1487)))

(declare-fun tp_is_empty!19999 () Bool)

(assert (=> start!79278 tp_is_empty!19999))

(declare-fun b!931007 () Bool)

(assert (=> b!931007 (= e!522846 tp_is_empty!19999)))

(declare-fun b!931008 () Bool)

(declare-fun e!522845 () Bool)

(assert (=> b!931008 (= e!522845 tp_is_empty!19999)))

(declare-fun b!931009 () Bool)

(assert (=> b!931009 (= e!522844 (and e!522845 mapRes!31755))))

(declare-fun condMapEmpty!31755 () Bool)

(declare-fun mapDefault!31755 () ValueCell!9518)

