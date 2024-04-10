; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79162 () Bool)

(assert start!79162)

(declare-fun b_free!17375 () Bool)

(declare-fun b_next!17375 () Bool)

(assert (=> start!79162 (= b_free!17375 (not b_next!17375))))

(declare-fun tp!60565 () Bool)

(declare-fun b_and!28441 () Bool)

(assert (=> start!79162 (= tp!60565 b_and!28441)))

(declare-fun b!929214 () Bool)

(declare-fun e!521800 () Bool)

(assert (=> b!929214 (= e!521800 false)))

(declare-datatypes ((V!31475 0))(
  ( (V!31476 (val!9992 Int)) )
))
(declare-fun lt!419031 () V!31475)

(declare-datatypes ((tuple2!13064 0))(
  ( (tuple2!13065 (_1!6543 (_ BitVec 64)) (_2!6543 V!31475)) )
))
(declare-datatypes ((List!18857 0))(
  ( (Nil!18854) (Cons!18853 (h!19999 tuple2!13064) (t!26914 List!18857)) )
))
(declare-datatypes ((ListLongMap!11761 0))(
  ( (ListLongMap!11762 (toList!5896 List!18857)) )
))
(declare-fun lt!419032 () ListLongMap!11761)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!722 (ListLongMap!11761 (_ BitVec 64)) V!31475)

(assert (=> b!929214 (= lt!419031 (apply!722 lt!419032 k!1099))))

(declare-fun b!929215 () Bool)

(declare-fun e!521801 () Bool)

(declare-fun tp_is_empty!19883 () Bool)

(assert (=> b!929215 (= e!521801 tp_is_empty!19883)))

(declare-fun mapIsEmpty!31581 () Bool)

(declare-fun mapRes!31581 () Bool)

(assert (=> mapIsEmpty!31581 mapRes!31581))

(declare-fun b!929216 () Bool)

(declare-fun res!625725 () Bool)

(declare-fun e!521799 () Bool)

(assert (=> b!929216 (=> (not res!625725) (not e!521799))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55720 0))(
  ( (array!55721 (arr!26805 (Array (_ BitVec 32) (_ BitVec 64))) (size!27264 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55720)

(assert (=> b!929216 (= res!625725 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27264 _keys!1487))))))

(declare-fun b!929217 () Bool)

(declare-fun res!625726 () Bool)

(assert (=> b!929217 (=> (not res!625726) (not e!521799))))

(declare-datatypes ((List!18858 0))(
  ( (Nil!18855) (Cons!18854 (h!20000 (_ BitVec 64)) (t!26915 List!18858)) )
))
(declare-fun arrayNoDuplicates!0 (array!55720 (_ BitVec 32) List!18858) Bool)

(assert (=> b!929217 (= res!625726 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18855))))

(declare-fun b!929218 () Bool)

(declare-fun e!521798 () Bool)

(declare-fun e!521802 () Bool)

(assert (=> b!929218 (= e!521798 (and e!521802 mapRes!31581))))

(declare-fun condMapEmpty!31581 () Bool)

(declare-datatypes ((ValueCell!9460 0))(
  ( (ValueCellFull!9460 (v!12510 V!31475)) (EmptyCell!9460) )
))
(declare-datatypes ((array!55722 0))(
  ( (array!55723 (arr!26806 (Array (_ BitVec 32) ValueCell!9460)) (size!27265 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55722)

(declare-fun mapDefault!31581 () ValueCell!9460)

