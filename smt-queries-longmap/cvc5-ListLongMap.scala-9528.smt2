; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113030 () Bool)

(assert start!113030)

(declare-fun b_free!31081 () Bool)

(declare-fun b_next!31081 () Bool)

(assert (=> start!113030 (= b_free!31081 (not b_next!31081))))

(declare-fun tp!109047 () Bool)

(declare-fun b_and!50111 () Bool)

(assert (=> start!113030 (= tp!109047 b_and!50111)))

(declare-fun b!1339692 () Bool)

(declare-fun res!888711 () Bool)

(declare-fun e!763088 () Bool)

(assert (=> b!1339692 (=> (not res!888711) (not e!763088))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91018 0))(
  ( (array!91019 (arr!43965 (Array (_ BitVec 32) (_ BitVec 64))) (size!44515 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91018)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1339692 (= res!888711 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44515 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339693 () Bool)

(declare-fun e!763084 () Bool)

(declare-fun tp_is_empty!37081 () Bool)

(assert (=> b!1339693 (= e!763084 tp_is_empty!37081)))

(declare-fun mapIsEmpty!57328 () Bool)

(declare-fun mapRes!57328 () Bool)

(assert (=> mapIsEmpty!57328 mapRes!57328))

(declare-fun b!1339695 () Bool)

(declare-fun e!763086 () Bool)

(assert (=> b!1339695 (= e!763086 tp_is_empty!37081)))

(declare-fun b!1339696 () Bool)

(declare-fun res!888707 () Bool)

(assert (=> b!1339696 (=> (not res!888707) (not e!763088))))

(declare-datatypes ((List!31121 0))(
  ( (Nil!31118) (Cons!31117 (h!32326 (_ BitVec 64)) (t!45453 List!31121)) )
))
(declare-fun arrayNoDuplicates!0 (array!91018 (_ BitVec 32) List!31121) Bool)

(assert (=> b!1339696 (= res!888707 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31118))))

(declare-fun res!888709 () Bool)

(assert (=> start!113030 (=> (not res!888709) (not e!763088))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113030 (= res!888709 (validMask!0 mask!1977))))

(assert (=> start!113030 e!763088))

(assert (=> start!113030 tp_is_empty!37081))

(assert (=> start!113030 true))

(declare-fun array_inv!33151 (array!91018) Bool)

(assert (=> start!113030 (array_inv!33151 _keys!1571)))

(declare-datatypes ((V!54545 0))(
  ( (V!54546 (val!18615 Int)) )
))
(declare-datatypes ((ValueCell!17642 0))(
  ( (ValueCellFull!17642 (v!21263 V!54545)) (EmptyCell!17642) )
))
(declare-datatypes ((array!91020 0))(
  ( (array!91021 (arr!43966 (Array (_ BitVec 32) ValueCell!17642)) (size!44516 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91020)

(declare-fun e!763087 () Bool)

(declare-fun array_inv!33152 (array!91020) Bool)

(assert (=> start!113030 (and (array_inv!33152 _values!1303) e!763087)))

(assert (=> start!113030 tp!109047))

(declare-fun b!1339694 () Bool)

(assert (=> b!1339694 (= e!763087 (and e!763084 mapRes!57328))))

(declare-fun condMapEmpty!57328 () Bool)

(declare-fun mapDefault!57328 () ValueCell!17642)

