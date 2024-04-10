; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79200 () Bool)

(assert start!79200)

(declare-fun b_free!17413 () Bool)

(declare-fun b_next!17413 () Bool)

(assert (=> start!79200 (= b_free!17413 (not b_next!17413))))

(declare-fun tp!60680 () Bool)

(declare-fun b_and!28479 () Bool)

(assert (=> start!79200 (= tp!60680 b_and!28479)))

(declare-fun b!929830 () Bool)

(declare-fun res!626166 () Bool)

(declare-fun e!522143 () Bool)

(assert (=> b!929830 (=> (not res!626166) (not e!522143))))

(declare-datatypes ((array!55792 0))(
  ( (array!55793 (arr!26841 (Array (_ BitVec 32) (_ BitVec 64))) (size!27300 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55792)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31527 0))(
  ( (V!31528 (val!10011 Int)) )
))
(declare-datatypes ((ValueCell!9479 0))(
  ( (ValueCellFull!9479 (v!12529 V!31527)) (EmptyCell!9479) )
))
(declare-datatypes ((array!55794 0))(
  ( (array!55795 (arr!26842 (Array (_ BitVec 32) ValueCell!9479)) (size!27301 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55794)

(assert (=> b!929830 (= res!626166 (and (= (size!27301 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27300 _keys!1487) (size!27301 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929831 () Bool)

(declare-fun e!522142 () Bool)

(assert (=> b!929831 (= e!522143 e!522142)))

(declare-fun res!626168 () Bool)

(assert (=> b!929831 (=> (not res!626168) (not e!522142))))

(declare-datatypes ((tuple2!13092 0))(
  ( (tuple2!13093 (_1!6557 (_ BitVec 64)) (_2!6557 V!31527)) )
))
(declare-datatypes ((List!18885 0))(
  ( (Nil!18882) (Cons!18881 (h!20027 tuple2!13092) (t!26942 List!18885)) )
))
(declare-datatypes ((ListLongMap!11789 0))(
  ( (ListLongMap!11790 (toList!5910 List!18885)) )
))
(declare-fun lt!419137 () ListLongMap!11789)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4962 (ListLongMap!11789 (_ BitVec 64)) Bool)

(assert (=> b!929831 (= res!626168 (contains!4962 lt!419137 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31527)

(declare-fun minValue!1173 () V!31527)

(declare-fun getCurrentListMap!3153 (array!55792 array!55794 (_ BitVec 32) (_ BitVec 32) V!31527 V!31527 (_ BitVec 32) Int) ListLongMap!11789)

(assert (=> b!929831 (= lt!419137 (getCurrentListMap!3153 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929832 () Bool)

(assert (=> b!929832 (= e!522142 false)))

(declare-fun lt!419136 () Bool)

(assert (=> b!929832 (= lt!419136 (contains!4962 (getCurrentListMap!3153 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k!1099))))

(declare-fun mapIsEmpty!31638 () Bool)

(declare-fun mapRes!31638 () Bool)

(assert (=> mapIsEmpty!31638 mapRes!31638))

(declare-fun b!929833 () Bool)

(declare-fun res!626170 () Bool)

(assert (=> b!929833 (=> (not res!626170) (not e!522143))))

(declare-datatypes ((List!18886 0))(
  ( (Nil!18883) (Cons!18882 (h!20028 (_ BitVec 64)) (t!26943 List!18886)) )
))
(declare-fun arrayNoDuplicates!0 (array!55792 (_ BitVec 32) List!18886) Bool)

(assert (=> b!929833 (= res!626170 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18883))))

(declare-fun b!929834 () Bool)

(declare-fun e!522145 () Bool)

(declare-fun e!522144 () Bool)

(assert (=> b!929834 (= e!522145 (and e!522144 mapRes!31638))))

(declare-fun condMapEmpty!31638 () Bool)

(declare-fun mapDefault!31638 () ValueCell!9479)

