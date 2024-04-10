; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113384 () Bool)

(assert start!113384)

(declare-fun b_free!31435 () Bool)

(declare-fun b_next!31435 () Bool)

(assert (=> start!113384 (= b_free!31435 (not b_next!31435))))

(declare-fun tp!110110 () Bool)

(declare-fun b_and!50723 () Bool)

(assert (=> start!113384 (= tp!110110 b_and!50723)))

(declare-fun b!1345962 () Bool)

(declare-fun res!893126 () Bool)

(declare-fun e!765824 () Bool)

(assert (=> b!1345962 (=> (not res!893126) (not e!765824))))

(declare-datatypes ((array!91710 0))(
  ( (array!91711 (arr!44311 (Array (_ BitVec 32) (_ BitVec 64))) (size!44861 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91710)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91710 (_ BitVec 32)) Bool)

(assert (=> b!1345962 (= res!893126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345963 () Bool)

(declare-fun e!765821 () Bool)

(declare-fun tp_is_empty!37435 () Bool)

(assert (=> b!1345963 (= e!765821 tp_is_empty!37435)))

(declare-fun b!1345964 () Bool)

(assert (=> b!1345964 (= e!765824 false)))

(declare-datatypes ((V!55017 0))(
  ( (V!55018 (val!18792 Int)) )
))
(declare-fun minValue!1245 () V!55017)

(declare-fun lt!595455 () Bool)

(declare-fun zeroValue!1245 () V!55017)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17819 0))(
  ( (ValueCellFull!17819 (v!21440 V!55017)) (EmptyCell!17819) )
))
(declare-datatypes ((array!91712 0))(
  ( (array!91713 (arr!44312 (Array (_ BitVec 32) ValueCell!17819)) (size!44862 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91712)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24226 0))(
  ( (tuple2!24227 (_1!12124 (_ BitVec 64)) (_2!12124 V!55017)) )
))
(declare-datatypes ((List!31382 0))(
  ( (Nil!31379) (Cons!31378 (h!32587 tuple2!24226) (t!45972 List!31382)) )
))
(declare-datatypes ((ListLongMap!21883 0))(
  ( (ListLongMap!21884 (toList!10957 List!31382)) )
))
(declare-fun contains!9133 (ListLongMap!21883 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5909 (array!91710 array!91712 (_ BitVec 32) (_ BitVec 32) V!55017 V!55017 (_ BitVec 32) Int) ListLongMap!21883)

(assert (=> b!1345964 (= lt!595455 (contains!9133 (getCurrentListMap!5909 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1345965 () Bool)

(declare-fun e!765820 () Bool)

(declare-fun mapRes!57859 () Bool)

(assert (=> b!1345965 (= e!765820 (and e!765821 mapRes!57859))))

(declare-fun condMapEmpty!57859 () Bool)

(declare-fun mapDefault!57859 () ValueCell!17819)

