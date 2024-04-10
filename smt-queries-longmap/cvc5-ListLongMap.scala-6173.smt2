; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79146 () Bool)

(assert start!79146)

(declare-fun b_free!17359 () Bool)

(declare-fun b_next!17359 () Bool)

(assert (=> start!79146 (= b_free!17359 (not b_next!17359))))

(declare-fun tp!60518 () Bool)

(declare-fun b_and!28425 () Bool)

(assert (=> start!79146 (= tp!60518 b_and!28425)))

(declare-fun b!928998 () Bool)

(declare-fun e!521658 () Bool)

(declare-fun tp_is_empty!19867 () Bool)

(assert (=> b!928998 (= e!521658 tp_is_empty!19867)))

(declare-fun b!928999 () Bool)

(declare-fun res!625580 () Bool)

(declare-fun e!521655 () Bool)

(assert (=> b!928999 (=> (not res!625580) (not e!521655))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55688 0))(
  ( (array!55689 (arr!26789 (Array (_ BitVec 32) (_ BitVec 64))) (size!27248 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55688)

(assert (=> b!928999 (= res!625580 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27248 _keys!1487))))))

(declare-fun b!929000 () Bool)

(declare-fun res!625581 () Bool)

(assert (=> b!929000 (=> (not res!625581) (not e!521655))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55688 (_ BitVec 32)) Bool)

(assert (=> b!929000 (= res!625581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929001 () Bool)

(declare-fun res!625582 () Bool)

(assert (=> b!929001 (=> (not res!625582) (not e!521655))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31455 0))(
  ( (V!31456 (val!9984 Int)) )
))
(declare-datatypes ((ValueCell!9452 0))(
  ( (ValueCellFull!9452 (v!12502 V!31455)) (EmptyCell!9452) )
))
(declare-datatypes ((array!55690 0))(
  ( (array!55691 (arr!26790 (Array (_ BitVec 32) ValueCell!9452)) (size!27249 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55690)

(assert (=> b!929001 (= res!625582 (and (= (size!27249 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27248 _keys!1487) (size!27249 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929002 () Bool)

(declare-fun e!521656 () Bool)

(declare-fun mapRes!31557 () Bool)

(assert (=> b!929002 (= e!521656 (and e!521658 mapRes!31557))))

(declare-fun condMapEmpty!31557 () Bool)

(declare-fun mapDefault!31557 () ValueCell!9452)

