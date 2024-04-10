; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113034 () Bool)

(assert start!113034)

(declare-fun b_free!31085 () Bool)

(declare-fun b_next!31085 () Bool)

(assert (=> start!113034 (= b_free!31085 (not b_next!31085))))

(declare-fun tp!109060 () Bool)

(declare-fun b_and!50115 () Bool)

(assert (=> start!113034 (= tp!109060 b_and!50115)))

(declare-fun b!1339740 () Bool)

(declare-fun e!763116 () Bool)

(declare-fun tp_is_empty!37085 () Bool)

(assert (=> b!1339740 (= e!763116 tp_is_empty!37085)))

(declare-fun mapIsEmpty!57334 () Bool)

(declare-fun mapRes!57334 () Bool)

(assert (=> mapIsEmpty!57334 mapRes!57334))

(declare-fun b!1339741 () Bool)

(declare-fun res!888737 () Bool)

(declare-fun e!763117 () Bool)

(assert (=> b!1339741 (=> (not res!888737) (not e!763117))))

(declare-datatypes ((array!91026 0))(
  ( (array!91027 (arr!43969 (Array (_ BitVec 32) (_ BitVec 64))) (size!44519 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91026)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91026 (_ BitVec 32)) Bool)

(assert (=> b!1339741 (= res!888737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339742 () Bool)

(declare-fun res!888741 () Bool)

(assert (=> b!1339742 (=> (not res!888741) (not e!763117))))

(declare-datatypes ((List!31124 0))(
  ( (Nil!31121) (Cons!31120 (h!32329 (_ BitVec 64)) (t!45456 List!31124)) )
))
(declare-fun arrayNoDuplicates!0 (array!91026 (_ BitVec 32) List!31124) Bool)

(assert (=> b!1339742 (= res!888741 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31121))))

(declare-fun b!1339743 () Bool)

(declare-fun res!888739 () Bool)

(assert (=> b!1339743 (=> (not res!888739) (not e!763117))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1339743 (= res!888739 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44519 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339744 () Bool)

(declare-fun e!763114 () Bool)

(assert (=> b!1339744 (= e!763114 tp_is_empty!37085)))

(declare-fun res!888738 () Bool)

(assert (=> start!113034 (=> (not res!888738) (not e!763117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113034 (= res!888738 (validMask!0 mask!1977))))

(assert (=> start!113034 e!763117))

(assert (=> start!113034 tp_is_empty!37085))

(assert (=> start!113034 true))

(declare-fun array_inv!33155 (array!91026) Bool)

(assert (=> start!113034 (array_inv!33155 _keys!1571)))

(declare-datatypes ((V!54549 0))(
  ( (V!54550 (val!18617 Int)) )
))
(declare-datatypes ((ValueCell!17644 0))(
  ( (ValueCellFull!17644 (v!21265 V!54549)) (EmptyCell!17644) )
))
(declare-datatypes ((array!91028 0))(
  ( (array!91029 (arr!43970 (Array (_ BitVec 32) ValueCell!17644)) (size!44520 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91028)

(declare-fun e!763118 () Bool)

(declare-fun array_inv!33156 (array!91028) Bool)

(assert (=> start!113034 (and (array_inv!33156 _values!1303) e!763118)))

(assert (=> start!113034 tp!109060))

(declare-fun b!1339745 () Bool)

(assert (=> b!1339745 (= e!763118 (and e!763114 mapRes!57334))))

(declare-fun condMapEmpty!57334 () Bool)

(declare-fun mapDefault!57334 () ValueCell!17644)

