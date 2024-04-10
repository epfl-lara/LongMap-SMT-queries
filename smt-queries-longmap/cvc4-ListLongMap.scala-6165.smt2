; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79102 () Bool)

(assert start!79102)

(declare-fun b_free!17315 () Bool)

(declare-fun b_next!17315 () Bool)

(assert (=> start!79102 (= b_free!17315 (not b_next!17315))))

(declare-fun tp!60386 () Bool)

(declare-fun b_and!28367 () Bool)

(assert (=> start!79102 (= tp!60386 b_and!28367)))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31395 0))(
  ( (V!31396 (val!9962 Int)) )
))
(declare-fun v!791 () V!31395)

(declare-fun b!928181 () Bool)

(declare-fun e!521134 () Bool)

(declare-datatypes ((tuple2!13012 0))(
  ( (tuple2!13013 (_1!6517 (_ BitVec 64)) (_2!6517 V!31395)) )
))
(declare-datatypes ((List!18811 0))(
  ( (Nil!18808) (Cons!18807 (h!19953 tuple2!13012) (t!26856 List!18811)) )
))
(declare-datatypes ((ListLongMap!11709 0))(
  ( (ListLongMap!11710 (toList!5870 List!18811)) )
))
(declare-fun lt!418588 () ListLongMap!11709)

(declare-fun apply!700 (ListLongMap!11709 (_ BitVec 64)) V!31395)

(assert (=> b!928181 (= e!521134 (= (apply!700 lt!418588 k!1099) v!791))))

(declare-fun b!928182 () Bool)

(declare-fun res!625094 () Bool)

(declare-fun e!521128 () Bool)

(assert (=> b!928182 (=> (not res!625094) (not e!521128))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55606 0))(
  ( (array!55607 (arr!26748 (Array (_ BitVec 32) (_ BitVec 64))) (size!27207 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55606)

(assert (=> b!928182 (= res!625094 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27207 _keys!1487))))))

(declare-fun b!928183 () Bool)

(declare-datatypes ((Unit!31408 0))(
  ( (Unit!31409) )
))
(declare-fun e!521137 () Unit!31408)

(declare-fun e!521135 () Unit!31408)

(assert (=> b!928183 (= e!521137 e!521135)))

(declare-fun lt!418596 () (_ BitVec 64))

(assert (=> b!928183 (= lt!418596 (select (arr!26748 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96978 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928183 (= c!96978 (validKeyInArray!0 lt!418596))))

(declare-fun b!928184 () Bool)

(declare-fun e!521133 () Bool)

(declare-fun e!521127 () Bool)

(assert (=> b!928184 (= e!521133 e!521127)))

(declare-fun res!625087 () Bool)

(assert (=> b!928184 (=> (not res!625087) (not e!521127))))

(declare-fun lt!418592 () ListLongMap!11709)

(declare-fun contains!4927 (ListLongMap!11709 (_ BitVec 64)) Bool)

(assert (=> b!928184 (= res!625087 (contains!4927 lt!418592 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9430 0))(
  ( (ValueCellFull!9430 (v!12480 V!31395)) (EmptyCell!9430) )
))
(declare-datatypes ((array!55608 0))(
  ( (array!55609 (arr!26749 (Array (_ BitVec 32) ValueCell!9430)) (size!27208 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55608)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31395)

(declare-fun minValue!1173 () V!31395)

(declare-fun getCurrentListMap!3118 (array!55606 array!55608 (_ BitVec 32) (_ BitVec 32) V!31395 V!31395 (_ BitVec 32) Int) ListLongMap!11709)

(assert (=> b!928184 (= lt!418592 (getCurrentListMap!3118 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928185 () Bool)

(declare-fun Unit!31410 () Unit!31408)

(assert (=> b!928185 (= e!521135 Unit!31410)))

(declare-fun b!928186 () Bool)

(declare-fun e!521132 () Bool)

(declare-fun e!521131 () Bool)

(declare-fun mapRes!31491 () Bool)

(assert (=> b!928186 (= e!521132 (and e!521131 mapRes!31491))))

(declare-fun condMapEmpty!31491 () Bool)

(declare-fun mapDefault!31491 () ValueCell!9430)

