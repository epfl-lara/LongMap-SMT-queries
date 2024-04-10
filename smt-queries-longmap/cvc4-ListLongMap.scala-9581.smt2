; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113352 () Bool)

(assert start!113352)

(declare-fun b_free!31403 () Bool)

(declare-fun b_next!31403 () Bool)

(assert (=> start!113352 (= b_free!31403 (not b_next!31403))))

(declare-fun tp!110013 () Bool)

(declare-fun b_and!50659 () Bool)

(assert (=> start!113352 (= tp!110013 b_and!50659)))

(declare-fun b!1345270 () Bool)

(declare-fun res!892615 () Bool)

(declare-fun e!765536 () Bool)

(assert (=> b!1345270 (=> (not res!892615) (not e!765536))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91646 0))(
  ( (array!91647 (arr!44279 (Array (_ BitVec 32) (_ BitVec 64))) (size!44829 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91646)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345270 (= res!892615 (not (= (select (arr!44279 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1345271 () Bool)

(declare-fun res!892612 () Bool)

(assert (=> b!1345271 (=> (not res!892612) (not e!765536))))

(declare-datatypes ((V!54973 0))(
  ( (V!54974 (val!18776 Int)) )
))
(declare-fun minValue!1245 () V!54973)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54973)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17803 0))(
  ( (ValueCellFull!17803 (v!21424 V!54973)) (EmptyCell!17803) )
))
(declare-datatypes ((array!91648 0))(
  ( (array!91649 (arr!44280 (Array (_ BitVec 32) ValueCell!17803)) (size!44830 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91648)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24204 0))(
  ( (tuple2!24205 (_1!12113 (_ BitVec 64)) (_2!12113 V!54973)) )
))
(declare-datatypes ((List!31360 0))(
  ( (Nil!31357) (Cons!31356 (h!32565 tuple2!24204) (t!45920 List!31360)) )
))
(declare-datatypes ((ListLongMap!21861 0))(
  ( (ListLongMap!21862 (toList!10946 List!31360)) )
))
(declare-fun contains!9122 (ListLongMap!21861 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5900 (array!91646 array!91648 (_ BitVec 32) (_ BitVec 32) V!54973 V!54973 (_ BitVec 32) Int) ListLongMap!21861)

(assert (=> b!1345271 (= res!892612 (contains!9122 (getCurrentListMap!5900 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1345272 () Bool)

(declare-fun e!765535 () Bool)

(declare-fun e!765534 () Bool)

(declare-fun mapRes!57811 () Bool)

(assert (=> b!1345272 (= e!765535 (and e!765534 mapRes!57811))))

(declare-fun condMapEmpty!57811 () Bool)

(declare-fun mapDefault!57811 () ValueCell!17803)

