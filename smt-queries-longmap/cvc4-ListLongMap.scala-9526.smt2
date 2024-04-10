; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113022 () Bool)

(assert start!113022)

(declare-fun b_free!31073 () Bool)

(declare-fun b_next!31073 () Bool)

(assert (=> start!113022 (= b_free!31073 (not b_next!31073))))

(declare-fun tp!109023 () Bool)

(declare-fun b_and!50103 () Bool)

(assert (=> start!113022 (= tp!109023 b_and!50103)))

(declare-fun b!1339596 () Bool)

(declare-fun res!888647 () Bool)

(declare-fun e!763027 () Bool)

(assert (=> b!1339596 (=> (not res!888647) (not e!763027))))

(declare-datatypes ((array!91002 0))(
  ( (array!91003 (arr!43957 (Array (_ BitVec 32) (_ BitVec 64))) (size!44507 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91002)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91002 (_ BitVec 32)) Bool)

(assert (=> b!1339596 (= res!888647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339597 () Bool)

(declare-fun res!888649 () Bool)

(assert (=> b!1339597 (=> (not res!888649) (not e!763027))))

(declare-datatypes ((List!31117 0))(
  ( (Nil!31114) (Cons!31113 (h!32322 (_ BitVec 64)) (t!45449 List!31117)) )
))
(declare-fun arrayNoDuplicates!0 (array!91002 (_ BitVec 32) List!31117) Bool)

(assert (=> b!1339597 (= res!888649 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31114))))

(declare-fun b!1339598 () Bool)

(declare-fun e!763026 () Bool)

(declare-fun tp_is_empty!37073 () Bool)

(assert (=> b!1339598 (= e!763026 tp_is_empty!37073)))

(declare-fun b!1339599 () Bool)

(declare-fun res!888650 () Bool)

(assert (=> b!1339599 (=> (not res!888650) (not e!763027))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1339599 (= res!888650 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44507 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339600 () Bool)

(declare-fun e!763025 () Bool)

(assert (=> b!1339600 (= e!763025 tp_is_empty!37073)))

(declare-fun res!888651 () Bool)

(assert (=> start!113022 (=> (not res!888651) (not e!763027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113022 (= res!888651 (validMask!0 mask!1977))))

(assert (=> start!113022 e!763027))

(assert (=> start!113022 tp_is_empty!37073))

(assert (=> start!113022 true))

(declare-fun array_inv!33147 (array!91002) Bool)

(assert (=> start!113022 (array_inv!33147 _keys!1571)))

(declare-datatypes ((V!54533 0))(
  ( (V!54534 (val!18611 Int)) )
))
(declare-datatypes ((ValueCell!17638 0))(
  ( (ValueCellFull!17638 (v!21259 V!54533)) (EmptyCell!17638) )
))
(declare-datatypes ((array!91004 0))(
  ( (array!91005 (arr!43958 (Array (_ BitVec 32) ValueCell!17638)) (size!44508 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91004)

(declare-fun e!763024 () Bool)

(declare-fun array_inv!33148 (array!91004) Bool)

(assert (=> start!113022 (and (array_inv!33148 _values!1303) e!763024)))

(assert (=> start!113022 tp!109023))

(declare-fun b!1339601 () Bool)

(declare-fun mapRes!57316 () Bool)

(assert (=> b!1339601 (= e!763024 (and e!763025 mapRes!57316))))

(declare-fun condMapEmpty!57316 () Bool)

(declare-fun mapDefault!57316 () ValueCell!17638)

