; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79404 () Bool)

(assert start!79404)

(declare-fun b_free!17591 () Bool)

(declare-fun b_next!17591 () Bool)

(assert (=> start!79404 (= b_free!17591 (not b_next!17591))))

(declare-fun tp!61217 () Bool)

(declare-fun b_and!28741 () Bool)

(assert (=> start!79404 (= tp!61217 b_and!28741)))

(declare-fun b!933101 () Bool)

(declare-fun res!628466 () Bool)

(declare-fun e!523969 () Bool)

(assert (=> b!933101 (=> (not res!628466) (not e!523969))))

(declare-datatypes ((array!56134 0))(
  ( (array!56135 (arr!27011 (Array (_ BitVec 32) (_ BitVec 64))) (size!27470 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56134)

(declare-datatypes ((List!19019 0))(
  ( (Nil!19016) (Cons!19015 (h!20161 (_ BitVec 64)) (t!27154 List!19019)) )
))
(declare-fun arrayNoDuplicates!0 (array!56134 (_ BitVec 32) List!19019) Bool)

(assert (=> b!933101 (= res!628466 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19016))))

(declare-fun b!933102 () Bool)

(declare-fun res!628467 () Bool)

(declare-fun e!523971 () Bool)

(assert (=> b!933102 (=> (not res!628467) (not e!523971))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31763 0))(
  ( (V!31764 (val!10100 Int)) )
))
(declare-fun v!791 () V!31763)

(declare-datatypes ((tuple2!13238 0))(
  ( (tuple2!13239 (_1!6630 (_ BitVec 64)) (_2!6630 V!31763)) )
))
(declare-datatypes ((List!19020 0))(
  ( (Nil!19017) (Cons!19016 (h!20162 tuple2!13238) (t!27155 List!19020)) )
))
(declare-datatypes ((ListLongMap!11935 0))(
  ( (ListLongMap!11936 (toList!5983 List!19020)) )
))
(declare-fun lt!420233 () ListLongMap!11935)

(declare-fun apply!796 (ListLongMap!11935 (_ BitVec 64)) V!31763)

(assert (=> b!933102 (= res!628467 (= (apply!796 lt!420233 k!1099) v!791))))

(declare-fun b!933103 () Bool)

(declare-fun res!628468 () Bool)

(assert (=> b!933103 (=> (not res!628468) (not e!523971))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933103 (= res!628468 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!628470 () Bool)

(assert (=> start!79404 (=> (not res!628470) (not e!523969))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79404 (= res!628470 (validMask!0 mask!1881))))

(assert (=> start!79404 e!523969))

(assert (=> start!79404 true))

(declare-fun tp_is_empty!20099 () Bool)

(assert (=> start!79404 tp_is_empty!20099))

(declare-datatypes ((ValueCell!9568 0))(
  ( (ValueCellFull!9568 (v!12619 V!31763)) (EmptyCell!9568) )
))
(declare-datatypes ((array!56136 0))(
  ( (array!56137 (arr!27012 (Array (_ BitVec 32) ValueCell!9568)) (size!27471 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56136)

(declare-fun e!523970 () Bool)

(declare-fun array_inv!21024 (array!56136) Bool)

(assert (=> start!79404 (and (array_inv!21024 _values!1231) e!523970)))

(assert (=> start!79404 tp!61217))

(declare-fun array_inv!21025 (array!56134) Bool)

(assert (=> start!79404 (array_inv!21025 _keys!1487)))

(declare-fun b!933104 () Bool)

(declare-fun res!628469 () Bool)

(assert (=> b!933104 (=> (not res!628469) (not e!523969))))

(assert (=> b!933104 (= res!628469 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27470 _keys!1487))))))

(declare-fun b!933105 () Bool)

(assert (=> b!933105 (= e!523969 e!523971)))

(declare-fun res!628471 () Bool)

(assert (=> b!933105 (=> (not res!628471) (not e!523971))))

(declare-fun contains!5032 (ListLongMap!11935 (_ BitVec 64)) Bool)

(assert (=> b!933105 (= res!628471 (contains!5032 lt!420233 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31763)

(declare-fun minValue!1173 () V!31763)

(declare-fun getCurrentListMap!3221 (array!56134 array!56136 (_ BitVec 32) (_ BitVec 32) V!31763 V!31763 (_ BitVec 32) Int) ListLongMap!11935)

(assert (=> b!933105 (= lt!420233 (getCurrentListMap!3221 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933106 () Bool)

(declare-fun e!523973 () Bool)

(assert (=> b!933106 (= e!523971 e!523973)))

(declare-fun res!628474 () Bool)

(assert (=> b!933106 (=> (not res!628474) (not e!523973))))

(declare-fun lt!420227 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933106 (= res!628474 (validKeyInArray!0 lt!420227))))

(assert (=> b!933106 (= lt!420227 (select (arr!27011 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31908 () Bool)

(declare-fun mapRes!31908 () Bool)

(assert (=> mapIsEmpty!31908 mapRes!31908))

(declare-fun b!933107 () Bool)

(declare-fun res!628465 () Bool)

(assert (=> b!933107 (=> (not res!628465) (not e!523971))))

(assert (=> b!933107 (= res!628465 (validKeyInArray!0 k!1099))))

(declare-fun mapNonEmpty!31908 () Bool)

(declare-fun tp!61216 () Bool)

(declare-fun e!523968 () Bool)

(assert (=> mapNonEmpty!31908 (= mapRes!31908 (and tp!61216 e!523968))))

(declare-fun mapKey!31908 () (_ BitVec 32))

(declare-fun mapValue!31908 () ValueCell!9568)

(declare-fun mapRest!31908 () (Array (_ BitVec 32) ValueCell!9568))

(assert (=> mapNonEmpty!31908 (= (arr!27012 _values!1231) (store mapRest!31908 mapKey!31908 mapValue!31908))))

(declare-fun b!933108 () Bool)

(declare-fun res!628472 () Bool)

(assert (=> b!933108 (=> (not res!628472) (not e!523969))))

(assert (=> b!933108 (= res!628472 (and (= (size!27471 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27470 _keys!1487) (size!27471 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933109 () Bool)

(assert (=> b!933109 (= e!523968 tp_is_empty!20099)))

(declare-fun b!933110 () Bool)

(declare-fun e!523972 () Bool)

(assert (=> b!933110 (= e!523970 (and e!523972 mapRes!31908))))

(declare-fun condMapEmpty!31908 () Bool)

(declare-fun mapDefault!31908 () ValueCell!9568)

