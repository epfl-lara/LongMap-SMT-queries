; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79418 () Bool)

(assert start!79418)

(declare-fun b_free!17605 () Bool)

(declare-fun b_next!17605 () Bool)

(assert (=> start!79418 (= b_free!17605 (not b_next!17605))))

(declare-fun tp!61259 () Bool)

(declare-fun b_and!28769 () Bool)

(assert (=> start!79418 (= tp!61259 b_and!28769)))

(declare-fun b!933388 () Bool)

(declare-fun res!628676 () Bool)

(declare-fun e!524120 () Bool)

(assert (=> b!933388 (=> (not res!628676) (not e!524120))))

(declare-datatypes ((array!56162 0))(
  ( (array!56163 (arr!27025 (Array (_ BitVec 32) (_ BitVec 64))) (size!27484 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56162)

(declare-datatypes ((List!19031 0))(
  ( (Nil!19028) (Cons!19027 (h!20173 (_ BitVec 64)) (t!27180 List!19031)) )
))
(declare-fun arrayNoDuplicates!0 (array!56162 (_ BitVec 32) List!19031) Bool)

(assert (=> b!933388 (= res!628676 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19028))))

(declare-fun b!933389 () Bool)

(declare-fun e!524119 () Bool)

(declare-fun e!524116 () Bool)

(assert (=> b!933389 (= e!524119 e!524116)))

(declare-fun res!628683 () Bool)

(assert (=> b!933389 (=> (not res!628683) (not e!524116))))

(declare-fun lt!420378 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933389 (= res!628683 (validKeyInArray!0 lt!420378))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933389 (= lt!420378 (select (arr!27025 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31929 () Bool)

(declare-fun mapRes!31929 () Bool)

(declare-fun tp!61258 () Bool)

(declare-fun e!524118 () Bool)

(assert (=> mapNonEmpty!31929 (= mapRes!31929 (and tp!61258 e!524118))))

(declare-datatypes ((V!31783 0))(
  ( (V!31784 (val!10107 Int)) )
))
(declare-datatypes ((ValueCell!9575 0))(
  ( (ValueCellFull!9575 (v!12626 V!31783)) (EmptyCell!9575) )
))
(declare-fun mapValue!31929 () ValueCell!9575)

(declare-fun mapKey!31929 () (_ BitVec 32))

(declare-fun mapRest!31929 () (Array (_ BitVec 32) ValueCell!9575))

(declare-datatypes ((array!56164 0))(
  ( (array!56165 (arr!27026 (Array (_ BitVec 32) ValueCell!9575)) (size!27485 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56164)

(assert (=> mapNonEmpty!31929 (= (arr!27026 _values!1231) (store mapRest!31929 mapKey!31929 mapValue!31929))))

(declare-fun b!933390 () Bool)

(declare-fun res!628675 () Bool)

(assert (=> b!933390 (=> (not res!628675) (not e!524120))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!933390 (= res!628675 (and (= (size!27485 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27484 _keys!1487) (size!27485 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933391 () Bool)

(declare-fun res!628679 () Bool)

(assert (=> b!933391 (=> (not res!628679) (not e!524119))))

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!933391 (= res!628679 (validKeyInArray!0 k!1099))))

(declare-fun mapIsEmpty!31929 () Bool)

(assert (=> mapIsEmpty!31929 mapRes!31929))

(declare-fun b!933392 () Bool)

(declare-fun res!628680 () Bool)

(assert (=> b!933392 (=> (not res!628680) (not e!524120))))

(assert (=> b!933392 (= res!628680 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27484 _keys!1487))))))

(declare-fun b!933393 () Bool)

(declare-fun tp_is_empty!20113 () Bool)

(assert (=> b!933393 (= e!524118 tp_is_empty!20113)))

(declare-fun res!628677 () Bool)

(assert (=> start!79418 (=> (not res!628677) (not e!524120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79418 (= res!628677 (validMask!0 mask!1881))))

(assert (=> start!79418 e!524120))

(assert (=> start!79418 true))

(assert (=> start!79418 tp_is_empty!20113))

(declare-fun e!524117 () Bool)

(declare-fun array_inv!21036 (array!56164) Bool)

(assert (=> start!79418 (and (array_inv!21036 _values!1231) e!524117)))

(assert (=> start!79418 tp!61259))

(declare-fun array_inv!21037 (array!56162) Bool)

(assert (=> start!79418 (array_inv!21037 _keys!1487)))

(declare-fun b!933394 () Bool)

(declare-fun res!628682 () Bool)

(assert (=> b!933394 (=> (not res!628682) (not e!524119))))

(assert (=> b!933394 (= res!628682 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933395 () Bool)

(declare-fun e!524121 () Bool)

(assert (=> b!933395 (= e!524121 tp_is_empty!20113)))

(declare-fun b!933396 () Bool)

(assert (=> b!933396 (= e!524117 (and e!524121 mapRes!31929))))

(declare-fun condMapEmpty!31929 () Bool)

(declare-fun mapDefault!31929 () ValueCell!9575)

