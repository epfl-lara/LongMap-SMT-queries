; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79182 () Bool)

(assert start!79182)

(declare-fun b_free!17395 () Bool)

(declare-fun b_next!17395 () Bool)

(assert (=> start!79182 (= b_free!17395 (not b_next!17395))))

(declare-fun tp!60626 () Bool)

(declare-fun b_and!28461 () Bool)

(assert (=> start!79182 (= tp!60626 b_and!28461)))

(declare-fun b!929533 () Bool)

(declare-fun res!625951 () Bool)

(declare-fun e!521980 () Bool)

(assert (=> b!929533 (=> (not res!625951) (not e!521980))))

(declare-datatypes ((array!55760 0))(
  ( (array!55761 (arr!26825 (Array (_ BitVec 32) (_ BitVec 64))) (size!27284 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55760)

(declare-datatypes ((List!18872 0))(
  ( (Nil!18869) (Cons!18868 (h!20014 (_ BitVec 64)) (t!26929 List!18872)) )
))
(declare-fun arrayNoDuplicates!0 (array!55760 (_ BitVec 32) List!18872) Bool)

(assert (=> b!929533 (= res!625951 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18869))))

(declare-fun b!929534 () Bool)

(declare-fun e!521981 () Bool)

(declare-fun tp_is_empty!19903 () Bool)

(assert (=> b!929534 (= e!521981 tp_is_empty!19903)))

(declare-fun b!929535 () Bool)

(declare-fun res!625950 () Bool)

(declare-fun e!521983 () Bool)

(assert (=> b!929535 (=> (not res!625950) (not e!521983))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31503 0))(
  ( (V!31504 (val!10002 Int)) )
))
(declare-fun v!791 () V!31503)

(declare-datatypes ((tuple2!13078 0))(
  ( (tuple2!13079 (_1!6550 (_ BitVec 64)) (_2!6550 V!31503)) )
))
(declare-datatypes ((List!18873 0))(
  ( (Nil!18870) (Cons!18869 (h!20015 tuple2!13078) (t!26930 List!18873)) )
))
(declare-datatypes ((ListLongMap!11775 0))(
  ( (ListLongMap!11776 (toList!5903 List!18873)) )
))
(declare-fun lt!419082 () ListLongMap!11775)

(declare-fun apply!728 (ListLongMap!11775 (_ BitVec 64)) V!31503)

(assert (=> b!929535 (= res!625950 (= (apply!728 lt!419082 k!1099) v!791))))

(declare-fun b!929536 () Bool)

(declare-fun res!625957 () Bool)

(assert (=> b!929536 (=> (not res!625957) (not e!521980))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929536 (= res!625957 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27284 _keys!1487))))))

(declare-fun mapNonEmpty!31611 () Bool)

(declare-fun mapRes!31611 () Bool)

(declare-fun tp!60625 () Bool)

(declare-fun e!521978 () Bool)

(assert (=> mapNonEmpty!31611 (= mapRes!31611 (and tp!60625 e!521978))))

(declare-datatypes ((ValueCell!9470 0))(
  ( (ValueCellFull!9470 (v!12520 V!31503)) (EmptyCell!9470) )
))
(declare-fun mapRest!31611 () (Array (_ BitVec 32) ValueCell!9470))

(declare-fun mapValue!31611 () ValueCell!9470)

(declare-datatypes ((array!55762 0))(
  ( (array!55763 (arr!26826 (Array (_ BitVec 32) ValueCell!9470)) (size!27285 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55762)

(declare-fun mapKey!31611 () (_ BitVec 32))

(assert (=> mapNonEmpty!31611 (= (arr!26826 _values!1231) (store mapRest!31611 mapKey!31611 mapValue!31611))))

(declare-fun mapIsEmpty!31611 () Bool)

(assert (=> mapIsEmpty!31611 mapRes!31611))

(declare-fun b!929537 () Bool)

(declare-fun e!521982 () Bool)

(assert (=> b!929537 (= e!521982 (and e!521981 mapRes!31611))))

(declare-fun condMapEmpty!31611 () Bool)

(declare-fun mapDefault!31611 () ValueCell!9470)

