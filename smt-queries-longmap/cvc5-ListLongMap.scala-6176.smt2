; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79164 () Bool)

(assert start!79164)

(declare-fun b_free!17377 () Bool)

(declare-fun b_next!17377 () Bool)

(assert (=> start!79164 (= b_free!17377 (not b_next!17377))))

(declare-fun tp!60572 () Bool)

(declare-fun b_and!28443 () Bool)

(assert (=> start!79164 (= tp!60572 b_and!28443)))

(declare-fun mapNonEmpty!31584 () Bool)

(declare-fun mapRes!31584 () Bool)

(declare-fun tp!60571 () Bool)

(declare-fun e!521817 () Bool)

(assert (=> mapNonEmpty!31584 (= mapRes!31584 (and tp!60571 e!521817))))

(declare-datatypes ((V!31479 0))(
  ( (V!31480 (val!9993 Int)) )
))
(declare-datatypes ((ValueCell!9461 0))(
  ( (ValueCellFull!9461 (v!12511 V!31479)) (EmptyCell!9461) )
))
(declare-fun mapValue!31584 () ValueCell!9461)

(declare-fun mapRest!31584 () (Array (_ BitVec 32) ValueCell!9461))

(declare-fun mapKey!31584 () (_ BitVec 32))

(declare-datatypes ((array!55724 0))(
  ( (array!55725 (arr!26807 (Array (_ BitVec 32) ValueCell!9461)) (size!27266 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55724)

(assert (=> mapNonEmpty!31584 (= (arr!26807 _values!1231) (store mapRest!31584 mapKey!31584 mapValue!31584))))

(declare-fun b!929243 () Bool)

(declare-fun e!521819 () Bool)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55726 0))(
  ( (array!55727 (arr!26808 (Array (_ BitVec 32) (_ BitVec 64))) (size!27267 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55726)

(assert (=> b!929243 (= e!521819 (and (bvsle from!1844 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (size!27267 _keys!1487))))))

(declare-fun mapIsEmpty!31584 () Bool)

(assert (=> mapIsEmpty!31584 mapRes!31584))

(declare-fun b!929244 () Bool)

(declare-fun e!521816 () Bool)

(declare-fun e!521821 () Bool)

(assert (=> b!929244 (= e!521816 (and e!521821 mapRes!31584))))

(declare-fun condMapEmpty!31584 () Bool)

(declare-fun mapDefault!31584 () ValueCell!9461)

