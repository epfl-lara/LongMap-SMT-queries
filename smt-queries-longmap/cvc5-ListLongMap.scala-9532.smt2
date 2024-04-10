; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113054 () Bool)

(assert start!113054)

(declare-fun b_free!31105 () Bool)

(declare-fun b_next!31105 () Bool)

(assert (=> start!113054 (= b_free!31105 (not b_next!31105))))

(declare-fun tp!109120 () Bool)

(declare-fun b_and!50135 () Bool)

(assert (=> start!113054 (= tp!109120 b_and!50135)))

(declare-fun mapNonEmpty!57364 () Bool)

(declare-fun mapRes!57364 () Bool)

(declare-fun tp!109119 () Bool)

(declare-fun e!763268 () Bool)

(assert (=> mapNonEmpty!57364 (= mapRes!57364 (and tp!109119 e!763268))))

(declare-datatypes ((V!54577 0))(
  ( (V!54578 (val!18627 Int)) )
))
(declare-datatypes ((ValueCell!17654 0))(
  ( (ValueCellFull!17654 (v!21275 V!54577)) (EmptyCell!17654) )
))
(declare-fun mapRest!57364 () (Array (_ BitVec 32) ValueCell!17654))

(declare-fun mapValue!57364 () ValueCell!17654)

(declare-fun mapKey!57364 () (_ BitVec 32))

(declare-datatypes ((array!91064 0))(
  ( (array!91065 (arr!43988 (Array (_ BitVec 32) ValueCell!17654)) (size!44538 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91064)

(assert (=> mapNonEmpty!57364 (= (arr!43988 _values!1303) (store mapRest!57364 mapKey!57364 mapValue!57364))))

(declare-fun b!1339980 () Bool)

(declare-fun res!888888 () Bool)

(declare-fun e!763267 () Bool)

(assert (=> b!1339980 (=> (not res!888888) (not e!763267))))

(declare-datatypes ((array!91066 0))(
  ( (array!91067 (arr!43989 (Array (_ BitVec 32) (_ BitVec 64))) (size!44539 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91066)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91066 (_ BitVec 32)) Bool)

(assert (=> b!1339980 (= res!888888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339981 () Bool)

(declare-fun res!888890 () Bool)

(assert (=> b!1339981 (=> (not res!888890) (not e!763267))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339981 (= res!888890 (and (= (size!44538 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44539 _keys!1571) (size!44538 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57364 () Bool)

(assert (=> mapIsEmpty!57364 mapRes!57364))

(declare-fun b!1339982 () Bool)

(declare-fun res!888891 () Bool)

(assert (=> b!1339982 (=> (not res!888891) (not e!763267))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1339982 (= res!888891 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44539 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339983 () Bool)

(declare-fun e!763266 () Bool)

(declare-fun e!763264 () Bool)

(assert (=> b!1339983 (= e!763266 (and e!763264 mapRes!57364))))

(declare-fun condMapEmpty!57364 () Bool)

(declare-fun mapDefault!57364 () ValueCell!17654)

