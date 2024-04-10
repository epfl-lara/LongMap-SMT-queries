; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79218 () Bool)

(assert start!79218)

(declare-fun b_free!17431 () Bool)

(declare-fun b_next!17431 () Bool)

(assert (=> start!79218 (= b_free!17431 (not b_next!17431))))

(declare-fun tp!60734 () Bool)

(declare-fun b_and!28497 () Bool)

(assert (=> start!79218 (= tp!60734 b_and!28497)))

(declare-fun b!930129 () Bool)

(declare-fun res!626392 () Bool)

(declare-fun e!522302 () Bool)

(assert (=> b!930129 (=> (not res!626392) (not e!522302))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31551 0))(
  ( (V!31552 (val!10020 Int)) )
))
(declare-datatypes ((ValueCell!9488 0))(
  ( (ValueCellFull!9488 (v!12538 V!31551)) (EmptyCell!9488) )
))
(declare-datatypes ((array!55826 0))(
  ( (array!55827 (arr!26858 (Array (_ BitVec 32) ValueCell!9488)) (size!27317 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55826)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((array!55828 0))(
  ( (array!55829 (arr!26859 (Array (_ BitVec 32) (_ BitVec 64))) (size!27318 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55828)

(declare-fun zeroValue!1173 () V!31551)

(declare-fun minValue!1173 () V!31551)

(declare-datatypes ((tuple2!13108 0))(
  ( (tuple2!13109 (_1!6565 (_ BitVec 64)) (_2!6565 V!31551)) )
))
(declare-datatypes ((List!18900 0))(
  ( (Nil!18897) (Cons!18896 (h!20042 tuple2!13108) (t!26957 List!18900)) )
))
(declare-datatypes ((ListLongMap!11805 0))(
  ( (ListLongMap!11806 (toList!5918 List!18900)) )
))
(declare-fun contains!4969 (ListLongMap!11805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3160 (array!55828 array!55826 (_ BitVec 32) (_ BitVec 32) V!31551 V!31551 (_ BitVec 32) Int) ListLongMap!11805)

(assert (=> b!930129 (= res!626392 (contains!4969 (getCurrentListMap!3160 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k!1099))))

(declare-fun mapNonEmpty!31665 () Bool)

(declare-fun mapRes!31665 () Bool)

(declare-fun tp!60733 () Bool)

(declare-fun e!522307 () Bool)

(assert (=> mapNonEmpty!31665 (= mapRes!31665 (and tp!60733 e!522307))))

(declare-fun mapKey!31665 () (_ BitVec 32))

(declare-fun mapValue!31665 () ValueCell!9488)

(declare-fun mapRest!31665 () (Array (_ BitVec 32) ValueCell!9488))

(assert (=> mapNonEmpty!31665 (= (arr!26858 _values!1231) (store mapRest!31665 mapKey!31665 mapValue!31665))))

(declare-fun b!930130 () Bool)

(declare-fun res!626390 () Bool)

(declare-fun e!522303 () Bool)

(assert (=> b!930130 (=> (not res!626390) (not e!522303))))

(assert (=> b!930130 (= res!626390 (and (= (size!27317 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27318 _keys!1487) (size!27317 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930131 () Bool)

(declare-fun res!626388 () Bool)

(assert (=> b!930131 (=> (not res!626388) (not e!522303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55828 (_ BitVec 32)) Bool)

(assert (=> b!930131 (= res!626388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930132 () Bool)

(assert (=> b!930132 (= e!522303 e!522302)))

(declare-fun res!626389 () Bool)

(assert (=> b!930132 (=> (not res!626389) (not e!522302))))

(declare-fun lt!419188 () ListLongMap!11805)

(assert (=> b!930132 (= res!626389 (contains!4969 lt!419188 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930132 (= lt!419188 (getCurrentListMap!3160 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930133 () Bool)

(assert (=> b!930133 (= e!522302 (bvsgt #b00000000000000000000000000000000 (size!27318 _keys!1487)))))

(declare-fun b!930134 () Bool)

(declare-fun res!626387 () Bool)

(assert (=> b!930134 (=> (not res!626387) (not e!522302))))

(declare-fun v!791 () V!31551)

(declare-fun apply!740 (ListLongMap!11805 (_ BitVec 64)) V!31551)

(assert (=> b!930134 (= res!626387 (= (apply!740 lt!419188 k!1099) v!791))))

(declare-fun res!626385 () Bool)

(assert (=> start!79218 (=> (not res!626385) (not e!522303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79218 (= res!626385 (validMask!0 mask!1881))))

(assert (=> start!79218 e!522303))

(assert (=> start!79218 true))

(declare-fun tp_is_empty!19939 () Bool)

(assert (=> start!79218 tp_is_empty!19939))

(declare-fun e!522305 () Bool)

(declare-fun array_inv!20900 (array!55826) Bool)

(assert (=> start!79218 (and (array_inv!20900 _values!1231) e!522305)))

(assert (=> start!79218 tp!60734))

(declare-fun array_inv!20901 (array!55828) Bool)

(assert (=> start!79218 (array_inv!20901 _keys!1487)))

(declare-fun b!930135 () Bool)

(declare-fun e!522306 () Bool)

(assert (=> b!930135 (= e!522306 tp_is_empty!19939)))

(declare-fun b!930136 () Bool)

(declare-fun res!626386 () Bool)

(assert (=> b!930136 (=> (not res!626386) (not e!522302))))

(assert (=> b!930136 (= res!626386 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930137 () Bool)

(declare-fun res!626391 () Bool)

(assert (=> b!930137 (=> (not res!626391) (not e!522303))))

(declare-datatypes ((List!18901 0))(
  ( (Nil!18898) (Cons!18897 (h!20043 (_ BitVec 64)) (t!26958 List!18901)) )
))
(declare-fun arrayNoDuplicates!0 (array!55828 (_ BitVec 32) List!18901) Bool)

(assert (=> b!930137 (= res!626391 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18898))))

(declare-fun b!930138 () Bool)

(declare-fun res!626384 () Bool)

(assert (=> b!930138 (=> (not res!626384) (not e!522303))))

(assert (=> b!930138 (= res!626384 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27318 _keys!1487))))))

(declare-fun b!930139 () Bool)

(assert (=> b!930139 (= e!522307 tp_is_empty!19939)))

(declare-fun b!930140 () Bool)

(assert (=> b!930140 (= e!522305 (and e!522306 mapRes!31665))))

(declare-fun condMapEmpty!31665 () Bool)

(declare-fun mapDefault!31665 () ValueCell!9488)

