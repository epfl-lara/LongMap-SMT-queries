; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113442 () Bool)

(assert start!113442)

(declare-fun b_free!31493 () Bool)

(declare-fun b_next!31493 () Bool)

(assert (=> start!113442 (= b_free!31493 (not b_next!31493))))

(declare-fun tp!110283 () Bool)

(declare-fun b_and!50781 () Bool)

(assert (=> start!113442 (= tp!110283 b_and!50781)))

(declare-fun b!1346685 () Bool)

(declare-fun res!893591 () Bool)

(declare-fun e!766258 () Bool)

(assert (=> b!1346685 (=> (not res!893591) (not e!766258))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91818 0))(
  ( (array!91819 (arr!44365 (Array (_ BitVec 32) (_ BitVec 64))) (size!44915 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91818)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55093 0))(
  ( (V!55094 (val!18821 Int)) )
))
(declare-datatypes ((ValueCell!17848 0))(
  ( (ValueCellFull!17848 (v!21469 V!55093)) (EmptyCell!17848) )
))
(declare-datatypes ((array!91820 0))(
  ( (array!91821 (arr!44366 (Array (_ BitVec 32) ValueCell!17848)) (size!44916 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91820)

(assert (=> b!1346685 (= res!893591 (and (= (size!44916 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44915 _keys!1571) (size!44916 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346686 () Bool)

(declare-fun res!893592 () Bool)

(assert (=> b!1346686 (=> (not res!893592) (not e!766258))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346686 (= res!893592 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44915 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!893589 () Bool)

(assert (=> start!113442 (=> (not res!893589) (not e!766258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113442 (= res!893589 (validMask!0 mask!1977))))

(assert (=> start!113442 e!766258))

(declare-fun tp_is_empty!37493 () Bool)

(assert (=> start!113442 tp_is_empty!37493))

(assert (=> start!113442 true))

(declare-fun array_inv!33423 (array!91818) Bool)

(assert (=> start!113442 (array_inv!33423 _keys!1571)))

(declare-fun e!766259 () Bool)

(declare-fun array_inv!33424 (array!91820) Bool)

(assert (=> start!113442 (and (array_inv!33424 _values!1303) e!766259)))

(assert (=> start!113442 tp!110283))

(declare-fun mapIsEmpty!57946 () Bool)

(declare-fun mapRes!57946 () Bool)

(assert (=> mapIsEmpty!57946 mapRes!57946))

(declare-fun b!1346687 () Bool)

(declare-fun e!766256 () Bool)

(assert (=> b!1346687 (= e!766259 (and e!766256 mapRes!57946))))

(declare-fun condMapEmpty!57946 () Bool)

(declare-fun mapDefault!57946 () ValueCell!17848)

