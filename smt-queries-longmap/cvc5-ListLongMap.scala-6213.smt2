; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79412 () Bool)

(assert start!79412)

(declare-fun b_free!17599 () Bool)

(declare-fun b_next!17599 () Bool)

(assert (=> start!79412 (= b_free!17599 (not b_next!17599))))

(declare-fun tp!61241 () Bool)

(declare-fun b_and!28757 () Bool)

(assert (=> start!79412 (= tp!61241 b_and!28757)))

(declare-fun res!628593 () Bool)

(declare-fun e!524058 () Bool)

(assert (=> start!79412 (=> (not res!628593) (not e!524058))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79412 (= res!628593 (validMask!0 mask!1881))))

(assert (=> start!79412 e!524058))

(assert (=> start!79412 true))

(declare-fun tp_is_empty!20107 () Bool)

(assert (=> start!79412 tp_is_empty!20107))

(declare-datatypes ((V!31775 0))(
  ( (V!31776 (val!10104 Int)) )
))
(declare-datatypes ((ValueCell!9572 0))(
  ( (ValueCellFull!9572 (v!12623 V!31775)) (EmptyCell!9572) )
))
(declare-datatypes ((array!56150 0))(
  ( (array!56151 (arr!27019 (Array (_ BitVec 32) ValueCell!9572)) (size!27478 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56150)

(declare-fun e!524056 () Bool)

(declare-fun array_inv!21030 (array!56150) Bool)

(assert (=> start!79412 (and (array_inv!21030 _values!1231) e!524056)))

(assert (=> start!79412 tp!61241))

(declare-datatypes ((array!56152 0))(
  ( (array!56153 (arr!27020 (Array (_ BitVec 32) (_ BitVec 64))) (size!27479 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56152)

(declare-fun array_inv!21031 (array!56152) Bool)

(assert (=> start!79412 (array_inv!21031 _keys!1487)))

(declare-fun b!933265 () Bool)

(declare-fun res!628592 () Bool)

(declare-fun e!524055 () Bool)

(assert (=> b!933265 (=> (not res!628592) (not e!524055))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933265 (= res!628592 (validKeyInArray!0 k!1099))))

(declare-fun b!933266 () Bool)

(declare-fun res!628588 () Bool)

(assert (=> b!933266 (=> (not res!628588) (not e!524058))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!933266 (= res!628588 (and (= (size!27478 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27479 _keys!1487) (size!27478 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31920 () Bool)

(declare-fun mapRes!31920 () Bool)

(declare-fun tp!61240 () Bool)

(declare-fun e!524054 () Bool)

(assert (=> mapNonEmpty!31920 (= mapRes!31920 (and tp!61240 e!524054))))

(declare-fun mapKey!31920 () (_ BitVec 32))

(declare-fun mapRest!31920 () (Array (_ BitVec 32) ValueCell!9572))

(declare-fun mapValue!31920 () ValueCell!9572)

(assert (=> mapNonEmpty!31920 (= (arr!27019 _values!1231) (store mapRest!31920 mapKey!31920 mapValue!31920))))

(declare-fun b!933267 () Bool)

(declare-fun res!628587 () Bool)

(assert (=> b!933267 (=> (not res!628587) (not e!524058))))

(declare-datatypes ((List!19027 0))(
  ( (Nil!19024) (Cons!19023 (h!20169 (_ BitVec 64)) (t!27170 List!19027)) )
))
(declare-fun arrayNoDuplicates!0 (array!56152 (_ BitVec 32) List!19027) Bool)

(assert (=> b!933267 (= res!628587 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19024))))

(declare-fun b!933268 () Bool)

(declare-fun res!628589 () Bool)

(assert (=> b!933268 (=> (not res!628589) (not e!524058))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933268 (= res!628589 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27479 _keys!1487))))))

(declare-fun b!933269 () Bool)

(declare-fun e!524057 () Bool)

(assert (=> b!933269 (= e!524055 e!524057)))

(declare-fun res!628586 () Bool)

(assert (=> b!933269 (=> (not res!628586) (not e!524057))))

(declare-fun lt!420312 () (_ BitVec 64))

(assert (=> b!933269 (= res!628586 (validKeyInArray!0 lt!420312))))

(assert (=> b!933269 (= lt!420312 (select (arr!27020 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933270 () Bool)

(assert (=> b!933270 (= e!524058 e!524055)))

(declare-fun res!628590 () Bool)

(assert (=> b!933270 (=> (not res!628590) (not e!524055))))

(declare-datatypes ((tuple2!13246 0))(
  ( (tuple2!13247 (_1!6634 (_ BitVec 64)) (_2!6634 V!31775)) )
))
(declare-datatypes ((List!19028 0))(
  ( (Nil!19025) (Cons!19024 (h!20170 tuple2!13246) (t!27171 List!19028)) )
))
(declare-datatypes ((ListLongMap!11943 0))(
  ( (ListLongMap!11944 (toList!5987 List!19028)) )
))
(declare-fun lt!420313 () ListLongMap!11943)

(declare-fun contains!5036 (ListLongMap!11943 (_ BitVec 64)) Bool)

(assert (=> b!933270 (= res!628590 (contains!5036 lt!420313 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31775)

(declare-fun minValue!1173 () V!31775)

(declare-fun getCurrentListMap!3225 (array!56152 array!56150 (_ BitVec 32) (_ BitVec 32) V!31775 V!31775 (_ BitVec 32) Int) ListLongMap!11943)

(assert (=> b!933270 (= lt!420313 (getCurrentListMap!3225 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31920 () Bool)

(assert (=> mapIsEmpty!31920 mapRes!31920))

(declare-fun b!933271 () Bool)

(declare-fun res!628585 () Bool)

(assert (=> b!933271 (=> (not res!628585) (not e!524058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56152 (_ BitVec 32)) Bool)

(assert (=> b!933271 (= res!628585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933272 () Bool)

(declare-fun e!524053 () Bool)

(assert (=> b!933272 (= e!524056 (and e!524053 mapRes!31920))))

(declare-fun condMapEmpty!31920 () Bool)

(declare-fun mapDefault!31920 () ValueCell!9572)

