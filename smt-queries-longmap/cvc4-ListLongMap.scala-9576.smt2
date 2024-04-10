; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113322 () Bool)

(assert start!113322)

(declare-fun b_free!31373 () Bool)

(declare-fun b_next!31373 () Bool)

(assert (=> start!113322 (= b_free!31373 (not b_next!31373))))

(declare-fun tp!109923 () Bool)

(declare-fun b_and!50599 () Bool)

(assert (=> start!113322 (= tp!109923 b_and!50599)))

(declare-fun b!1344630 () Bool)

(declare-fun e!765275 () Bool)

(declare-fun tp_is_empty!37373 () Bool)

(assert (=> b!1344630 (= e!765275 tp_is_empty!37373)))

(declare-fun b!1344631 () Bool)

(declare-fun res!892141 () Bool)

(declare-fun e!765276 () Bool)

(assert (=> b!1344631 (=> (not res!892141) (not e!765276))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1344631 (= res!892141 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1344632 () Bool)

(declare-fun res!892137 () Bool)

(assert (=> b!1344632 (=> (not res!892137) (not e!765276))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91586 0))(
  ( (array!91587 (arr!44249 (Array (_ BitVec 32) (_ BitVec 64))) (size!44799 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91586)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344632 (= res!892137 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44799 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344633 () Bool)

(declare-fun res!892143 () Bool)

(assert (=> b!1344633 (=> (not res!892143) (not e!765276))))

(declare-datatypes ((List!31335 0))(
  ( (Nil!31332) (Cons!31331 (h!32540 (_ BitVec 64)) (t!45865 List!31335)) )
))
(declare-fun arrayNoDuplicates!0 (array!91586 (_ BitVec 32) List!31335) Bool)

(assert (=> b!1344633 (= res!892143 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31332))))

(declare-fun b!1344634 () Bool)

(declare-fun res!892142 () Bool)

(assert (=> b!1344634 (=> (not res!892142) (not e!765276))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91586 (_ BitVec 32)) Bool)

(assert (=> b!1344634 (= res!892142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!892140 () Bool)

(assert (=> start!113322 (=> (not res!892140) (not e!765276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113322 (= res!892140 (validMask!0 mask!1977))))

(assert (=> start!113322 e!765276))

(assert (=> start!113322 tp_is_empty!37373))

(assert (=> start!113322 true))

(declare-fun array_inv!33349 (array!91586) Bool)

(assert (=> start!113322 (array_inv!33349 _keys!1571)))

(declare-datatypes ((V!54933 0))(
  ( (V!54934 (val!18761 Int)) )
))
(declare-datatypes ((ValueCell!17788 0))(
  ( (ValueCellFull!17788 (v!21409 V!54933)) (EmptyCell!17788) )
))
(declare-datatypes ((array!91588 0))(
  ( (array!91589 (arr!44250 (Array (_ BitVec 32) ValueCell!17788)) (size!44800 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91588)

(declare-fun e!765278 () Bool)

(declare-fun array_inv!33350 (array!91588) Bool)

(assert (=> start!113322 (and (array_inv!33350 _values!1303) e!765278)))

(assert (=> start!113322 tp!109923))

(declare-fun b!1344635 () Bool)

(declare-fun res!892139 () Bool)

(assert (=> b!1344635 (=> (not res!892139) (not e!765276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344635 (= res!892139 (validKeyInArray!0 (select (arr!44249 _keys!1571) from!1960)))))

(declare-fun b!1344636 () Bool)

(declare-fun e!765274 () Bool)

(assert (=> b!1344636 (= e!765274 tp_is_empty!37373)))

(declare-fun b!1344637 () Bool)

(declare-fun mapRes!57766 () Bool)

(assert (=> b!1344637 (= e!765278 (and e!765274 mapRes!57766))))

(declare-fun condMapEmpty!57766 () Bool)

(declare-fun mapDefault!57766 () ValueCell!17788)

