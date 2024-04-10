; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113394 () Bool)

(assert start!113394)

(declare-fun b_free!31445 () Bool)

(declare-fun b_next!31445 () Bool)

(assert (=> start!113394 (= b_free!31445 (not b_next!31445))))

(declare-fun tp!110140 () Bool)

(declare-fun b_and!50733 () Bool)

(assert (=> start!113394 (= tp!110140 b_and!50733)))

(declare-fun res!893202 () Bool)

(declare-fun e!765899 () Bool)

(assert (=> start!113394 (=> (not res!893202) (not e!765899))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113394 (= res!893202 (validMask!0 mask!1977))))

(assert (=> start!113394 e!765899))

(declare-fun tp_is_empty!37445 () Bool)

(assert (=> start!113394 tp_is_empty!37445))

(assert (=> start!113394 true))

(declare-datatypes ((array!91728 0))(
  ( (array!91729 (arr!44320 (Array (_ BitVec 32) (_ BitVec 64))) (size!44870 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91728)

(declare-fun array_inv!33397 (array!91728) Bool)

(assert (=> start!113394 (array_inv!33397 _keys!1571)))

(declare-datatypes ((V!55029 0))(
  ( (V!55030 (val!18797 Int)) )
))
(declare-datatypes ((ValueCell!17824 0))(
  ( (ValueCellFull!17824 (v!21445 V!55029)) (EmptyCell!17824) )
))
(declare-datatypes ((array!91730 0))(
  ( (array!91731 (arr!44321 (Array (_ BitVec 32) ValueCell!17824)) (size!44871 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91730)

(declare-fun e!765895 () Bool)

(declare-fun array_inv!33398 (array!91730) Bool)

(assert (=> start!113394 (and (array_inv!33398 _values!1303) e!765895)))

(assert (=> start!113394 tp!110140))

(declare-fun b!1346082 () Bool)

(declare-fun res!893201 () Bool)

(assert (=> b!1346082 (=> (not res!893201) (not e!765899))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346082 (= res!893201 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44870 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346083 () Bool)

(declare-fun e!765896 () Bool)

(declare-fun mapRes!57874 () Bool)

(assert (=> b!1346083 (= e!765895 (and e!765896 mapRes!57874))))

(declare-fun condMapEmpty!57874 () Bool)

(declare-fun mapDefault!57874 () ValueCell!17824)

