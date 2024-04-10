; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79646 () Bool)

(assert start!79646)

(declare-fun b_free!17695 () Bool)

(declare-fun b_next!17695 () Bool)

(assert (=> start!79646 (= b_free!17695 (not b_next!17695))))

(declare-fun tp!61540 () Bool)

(declare-fun b_and!28981 () Bool)

(assert (=> start!79646 (= tp!61540 b_and!28981)))

(declare-fun mapIsEmpty!32076 () Bool)

(declare-fun mapRes!32076 () Bool)

(assert (=> mapIsEmpty!32076 mapRes!32076))

(declare-fun mapNonEmpty!32076 () Bool)

(declare-fun tp!61541 () Bool)

(declare-fun e!525747 () Bool)

(assert (=> mapNonEmpty!32076 (= mapRes!32076 (and tp!61541 e!525747))))

(declare-datatypes ((V!31903 0))(
  ( (V!31904 (val!10152 Int)) )
))
(declare-datatypes ((ValueCell!9620 0))(
  ( (ValueCellFull!9620 (v!12677 V!31903)) (EmptyCell!9620) )
))
(declare-fun mapValue!32076 () ValueCell!9620)

(declare-fun mapKey!32076 () (_ BitVec 32))

(declare-datatypes ((array!56348 0))(
  ( (array!56349 (arr!27114 (Array (_ BitVec 32) ValueCell!9620)) (size!27573 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56348)

(declare-fun mapRest!32076 () (Array (_ BitVec 32) ValueCell!9620))

(assert (=> mapNonEmpty!32076 (= (arr!27114 _values!1231) (store mapRest!32076 mapKey!32076 mapValue!32076))))

(declare-fun b!936338 () Bool)

(declare-datatypes ((Unit!31581 0))(
  ( (Unit!31582) )
))
(declare-fun e!525751 () Unit!31581)

(declare-fun Unit!31583 () Unit!31581)

(assert (=> b!936338 (= e!525751 Unit!31583)))

(declare-fun res!630491 () Bool)

(declare-fun e!525756 () Bool)

(assert (=> start!79646 (=> (not res!630491) (not e!525756))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79646 (= res!630491 (validMask!0 mask!1881))))

(assert (=> start!79646 e!525756))

(assert (=> start!79646 true))

(declare-fun tp_is_empty!20203 () Bool)

(assert (=> start!79646 tp_is_empty!20203))

(declare-fun e!525749 () Bool)

(declare-fun array_inv!21096 (array!56348) Bool)

(assert (=> start!79646 (and (array_inv!21096 _values!1231) e!525749)))

(assert (=> start!79646 tp!61540))

(declare-datatypes ((array!56350 0))(
  ( (array!56351 (arr!27115 (Array (_ BitVec 32) (_ BitVec 64))) (size!27574 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56350)

(declare-fun array_inv!21097 (array!56350) Bool)

(assert (=> start!79646 (array_inv!21097 _keys!1487)))

(declare-fun b!936339 () Bool)

(declare-fun e!525753 () Bool)

(assert (=> b!936339 (= e!525749 (and e!525753 mapRes!32076))))

(declare-fun condMapEmpty!32076 () Bool)

(declare-fun mapDefault!32076 () ValueCell!9620)

