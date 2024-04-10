; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112132 () Bool)

(assert start!112132)

(declare-fun b!1328045 () Bool)

(declare-fun e!757154 () Bool)

(assert (=> b!1328045 (= e!757154 false)))

(declare-fun lt!590797 () Bool)

(declare-datatypes ((array!89774 0))(
  ( (array!89775 (arr!43353 (Array (_ BitVec 32) (_ BitVec 64))) (size!43903 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89774)

(declare-datatypes ((List!30708 0))(
  ( (Nil!30705) (Cons!30704 (h!31913 (_ BitVec 64)) (t!44714 List!30708)) )
))
(declare-fun arrayNoDuplicates!0 (array!89774 (_ BitVec 32) List!30708) Bool)

(assert (=> b!1328045 (= lt!590797 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30705))))

(declare-fun mapNonEmpty!56329 () Bool)

(declare-fun mapRes!56329 () Bool)

(declare-fun tp!107236 () Bool)

(declare-fun e!757153 () Bool)

(assert (=> mapNonEmpty!56329 (= mapRes!56329 (and tp!107236 e!757153))))

(declare-datatypes ((V!53685 0))(
  ( (V!53686 (val!18293 Int)) )
))
(declare-datatypes ((ValueCell!17320 0))(
  ( (ValueCellFull!17320 (v!20930 V!53685)) (EmptyCell!17320) )
))
(declare-datatypes ((array!89776 0))(
  ( (array!89777 (arr!43354 (Array (_ BitVec 32) ValueCell!17320)) (size!43904 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89776)

(declare-fun mapRest!56329 () (Array (_ BitVec 32) ValueCell!17320))

(declare-fun mapValue!56329 () ValueCell!17320)

(declare-fun mapKey!56329 () (_ BitVec 32))

(assert (=> mapNonEmpty!56329 (= (arr!43354 _values!1320) (store mapRest!56329 mapKey!56329 mapValue!56329))))

(declare-fun b!1328046 () Bool)

(declare-fun e!757152 () Bool)

(declare-fun e!757155 () Bool)

(assert (=> b!1328046 (= e!757152 (and e!757155 mapRes!56329))))

(declare-fun condMapEmpty!56329 () Bool)

(declare-fun mapDefault!56329 () ValueCell!17320)

