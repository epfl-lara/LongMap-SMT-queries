; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79186 () Bool)

(assert start!79186)

(declare-fun b_free!17399 () Bool)

(declare-fun b_next!17399 () Bool)

(assert (=> start!79186 (= b_free!17399 (not b_next!17399))))

(declare-fun tp!60637 () Bool)

(declare-fun b_and!28465 () Bool)

(assert (=> start!79186 (= tp!60637 b_and!28465)))

(declare-fun b!929599 () Bool)

(declare-fun res!626000 () Bool)

(declare-fun e!522017 () Bool)

(assert (=> b!929599 (=> (not res!626000) (not e!522017))))

(declare-datatypes ((array!55768 0))(
  ( (array!55769 (arr!26829 (Array (_ BitVec 32) (_ BitVec 64))) (size!27288 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55768)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31507 0))(
  ( (V!31508 (val!10004 Int)) )
))
(declare-datatypes ((ValueCell!9472 0))(
  ( (ValueCellFull!9472 (v!12522 V!31507)) (EmptyCell!9472) )
))
(declare-datatypes ((array!55770 0))(
  ( (array!55771 (arr!26830 (Array (_ BitVec 32) ValueCell!9472)) (size!27289 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55770)

(assert (=> b!929599 (= res!626000 (and (= (size!27289 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27288 _keys!1487) (size!27289 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929601 () Bool)

(declare-fun res!626003 () Bool)

(assert (=> b!929601 (=> (not res!626003) (not e!522017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55768 (_ BitVec 32)) Bool)

(assert (=> b!929601 (= res!626003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929602 () Bool)

(declare-fun res!626005 () Bool)

(assert (=> b!929602 (=> (not res!626005) (not e!522017))))

(declare-datatypes ((List!18876 0))(
  ( (Nil!18873) (Cons!18872 (h!20018 (_ BitVec 64)) (t!26933 List!18876)) )
))
(declare-fun arrayNoDuplicates!0 (array!55768 (_ BitVec 32) List!18876) Bool)

(assert (=> b!929602 (= res!626005 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18873))))

(declare-fun b!929603 () Bool)

(declare-fun res!625999 () Bool)

(assert (=> b!929603 (=> (not res!625999) (not e!522017))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929603 (= res!625999 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27288 _keys!1487))))))

(declare-fun b!929604 () Bool)

(declare-fun e!522015 () Bool)

(assert (=> b!929604 (= e!522017 e!522015)))

(declare-fun res!626001 () Bool)

(assert (=> b!929604 (=> (not res!626001) (not e!522015))))

(declare-datatypes ((tuple2!13082 0))(
  ( (tuple2!13083 (_1!6552 (_ BitVec 64)) (_2!6552 V!31507)) )
))
(declare-datatypes ((List!18877 0))(
  ( (Nil!18874) (Cons!18873 (h!20019 tuple2!13082) (t!26934 List!18877)) )
))
(declare-datatypes ((ListLongMap!11779 0))(
  ( (ListLongMap!11780 (toList!5905 List!18877)) )
))
(declare-fun lt!419094 () ListLongMap!11779)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4957 (ListLongMap!11779 (_ BitVec 64)) Bool)

(assert (=> b!929604 (= res!626001 (contains!4957 lt!419094 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31507)

(declare-fun minValue!1173 () V!31507)

(declare-fun getCurrentListMap!3148 (array!55768 array!55770 (_ BitVec 32) (_ BitVec 32) V!31507 V!31507 (_ BitVec 32) Int) ListLongMap!11779)

(assert (=> b!929604 (= lt!419094 (getCurrentListMap!3148 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31617 () Bool)

(declare-fun mapRes!31617 () Bool)

(declare-fun tp!60638 () Bool)

(declare-fun e!522014 () Bool)

(assert (=> mapNonEmpty!31617 (= mapRes!31617 (and tp!60638 e!522014))))

(declare-fun mapRest!31617 () (Array (_ BitVec 32) ValueCell!9472))

(declare-fun mapValue!31617 () ValueCell!9472)

(declare-fun mapKey!31617 () (_ BitVec 32))

(assert (=> mapNonEmpty!31617 (= (arr!26830 _values!1231) (store mapRest!31617 mapKey!31617 mapValue!31617))))

(declare-fun b!929605 () Bool)

(assert (=> b!929605 (= e!522015 false)))

(declare-fun lt!419095 () Bool)

(assert (=> b!929605 (= lt!419095 (contains!4957 (getCurrentListMap!3148 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k!1099))))

(declare-fun b!929600 () Bool)

(declare-fun res!626004 () Bool)

(assert (=> b!929600 (=> (not res!626004) (not e!522015))))

(assert (=> b!929600 (= res!626004 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun res!626002 () Bool)

(assert (=> start!79186 (=> (not res!626002) (not e!522017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79186 (= res!626002 (validMask!0 mask!1881))))

(assert (=> start!79186 e!522017))

(assert (=> start!79186 true))

(declare-fun tp_is_empty!19907 () Bool)

(assert (=> start!79186 tp_is_empty!19907))

(declare-fun e!522018 () Bool)

(declare-fun array_inv!20876 (array!55770) Bool)

(assert (=> start!79186 (and (array_inv!20876 _values!1231) e!522018)))

(assert (=> start!79186 tp!60637))

(declare-fun array_inv!20877 (array!55768) Bool)

(assert (=> start!79186 (array_inv!20877 _keys!1487)))

(declare-fun b!929606 () Bool)

(declare-fun e!522019 () Bool)

(assert (=> b!929606 (= e!522019 tp_is_empty!19907)))

(declare-fun b!929607 () Bool)

(assert (=> b!929607 (= e!522018 (and e!522019 mapRes!31617))))

(declare-fun condMapEmpty!31617 () Bool)

(declare-fun mapDefault!31617 () ValueCell!9472)

