; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113354 () Bool)

(assert start!113354)

(declare-fun b_free!31405 () Bool)

(declare-fun b_next!31405 () Bool)

(assert (=> start!113354 (= b_free!31405 (not b_next!31405))))

(declare-fun tp!110019 () Bool)

(declare-fun b_and!50663 () Bool)

(assert (=> start!113354 (= tp!110019 b_and!50663)))

(declare-fun b!1345314 () Bool)

(declare-fun res!892649 () Bool)

(declare-fun e!765557 () Bool)

(assert (=> b!1345314 (=> (not res!892649) (not e!765557))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91650 0))(
  ( (array!91651 (arr!44281 (Array (_ BitVec 32) (_ BitVec 64))) (size!44831 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91650)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345314 (= res!892649 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44831 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!892646 () Bool)

(assert (=> start!113354 (=> (not res!892646) (not e!765557))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113354 (= res!892646 (validMask!0 mask!1977))))

(assert (=> start!113354 e!765557))

(declare-fun tp_is_empty!37405 () Bool)

(assert (=> start!113354 tp_is_empty!37405))

(assert (=> start!113354 true))

(declare-fun array_inv!33369 (array!91650) Bool)

(assert (=> start!113354 (array_inv!33369 _keys!1571)))

(declare-datatypes ((V!54977 0))(
  ( (V!54978 (val!18777 Int)) )
))
(declare-datatypes ((ValueCell!17804 0))(
  ( (ValueCellFull!17804 (v!21425 V!54977)) (EmptyCell!17804) )
))
(declare-datatypes ((array!91652 0))(
  ( (array!91653 (arr!44282 (Array (_ BitVec 32) ValueCell!17804)) (size!44832 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91652)

(declare-fun e!765553 () Bool)

(declare-fun array_inv!33370 (array!91652) Bool)

(assert (=> start!113354 (and (array_inv!33370 _values!1303) e!765553)))

(assert (=> start!113354 tp!110019))

(declare-fun b!1345315 () Bool)

(declare-fun res!892651 () Bool)

(assert (=> b!1345315 (=> (not res!892651) (not e!765557))))

(declare-datatypes ((List!31361 0))(
  ( (Nil!31358) (Cons!31357 (h!32566 (_ BitVec 64)) (t!45923 List!31361)) )
))
(declare-fun arrayNoDuplicates!0 (array!91650 (_ BitVec 32) List!31361) Bool)

(assert (=> b!1345315 (= res!892651 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31358))))

(declare-fun b!1345316 () Bool)

(declare-fun e!765556 () Bool)

(assert (=> b!1345316 (= e!765556 tp_is_empty!37405)))

(declare-fun b!1345317 () Bool)

(declare-fun e!765552 () Bool)

(assert (=> b!1345317 (= e!765552 tp_is_empty!37405)))

(declare-fun b!1345318 () Bool)

(declare-fun res!892647 () Bool)

(assert (=> b!1345318 (=> (not res!892647) (not e!765557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91650 (_ BitVec 32)) Bool)

(assert (=> b!1345318 (= res!892647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345319 () Bool)

(declare-fun res!892650 () Bool)

(assert (=> b!1345319 (=> (not res!892650) (not e!765557))))

(assert (=> b!1345319 (= res!892650 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345320 () Bool)

(declare-fun mapRes!57814 () Bool)

(assert (=> b!1345320 (= e!765553 (and e!765552 mapRes!57814))))

(declare-fun condMapEmpty!57814 () Bool)

(declare-fun mapDefault!57814 () ValueCell!17804)

