; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113348 () Bool)

(assert start!113348)

(declare-fun b_free!31399 () Bool)

(declare-fun b_next!31399 () Bool)

(assert (=> start!113348 (= b_free!31399 (not b_next!31399))))

(declare-fun tp!110001 () Bool)

(declare-fun b_and!50651 () Bool)

(assert (=> start!113348 (= tp!110001 b_and!50651)))

(declare-fun b!1345182 () Bool)

(declare-fun res!892548 () Bool)

(declare-fun e!765503 () Bool)

(assert (=> b!1345182 (=> (not res!892548) (not e!765503))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91638 0))(
  ( (array!91639 (arr!44275 (Array (_ BitVec 32) (_ BitVec 64))) (size!44825 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91638)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345182 (= res!892548 (not (= (select (arr!44275 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1345183 () Bool)

(declare-fun e!765502 () Bool)

(declare-fun tp_is_empty!37399 () Bool)

(assert (=> b!1345183 (= e!765502 tp_is_empty!37399)))

(declare-fun b!1345184 () Bool)

(declare-fun res!892551 () Bool)

(declare-fun e!765500 () Bool)

(assert (=> b!1345184 (=> (not res!892551) (not e!765500))))

(assert (=> b!1345184 (= res!892551 (not (= k!1142 (select (arr!44275 _keys!1571) from!1960))))))

(declare-fun b!1345185 () Bool)

(declare-fun res!892546 () Bool)

(assert (=> b!1345185 (=> (not res!892546) (not e!765503))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345185 (= res!892546 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345186 () Bool)

(declare-fun e!765499 () Bool)

(assert (=> b!1345186 (= e!765499 tp_is_empty!37399)))

(declare-fun mapNonEmpty!57805 () Bool)

(declare-fun mapRes!57805 () Bool)

(declare-fun tp!110002 () Bool)

(assert (=> mapNonEmpty!57805 (= mapRes!57805 (and tp!110002 e!765499))))

(declare-datatypes ((V!54969 0))(
  ( (V!54970 (val!18774 Int)) )
))
(declare-datatypes ((ValueCell!17801 0))(
  ( (ValueCellFull!17801 (v!21422 V!54969)) (EmptyCell!17801) )
))
(declare-fun mapValue!57805 () ValueCell!17801)

(declare-fun mapKey!57805 () (_ BitVec 32))

(declare-fun mapRest!57805 () (Array (_ BitVec 32) ValueCell!17801))

(declare-datatypes ((array!91640 0))(
  ( (array!91641 (arr!44276 (Array (_ BitVec 32) ValueCell!17801)) (size!44826 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91640)

(assert (=> mapNonEmpty!57805 (= (arr!44276 _values!1303) (store mapRest!57805 mapKey!57805 mapValue!57805))))

(declare-fun b!1345187 () Bool)

(declare-fun res!892545 () Bool)

(assert (=> b!1345187 (=> (not res!892545) (not e!765503))))

(declare-fun minValue!1245 () V!54969)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54969)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24200 0))(
  ( (tuple2!24201 (_1!12111 (_ BitVec 64)) (_2!12111 V!54969)) )
))
(declare-datatypes ((List!31356 0))(
  ( (Nil!31353) (Cons!31352 (h!32561 tuple2!24200) (t!45912 List!31356)) )
))
(declare-datatypes ((ListLongMap!21857 0))(
  ( (ListLongMap!21858 (toList!10944 List!31356)) )
))
(declare-fun contains!9120 (ListLongMap!21857 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5898 (array!91638 array!91640 (_ BitVec 32) (_ BitVec 32) V!54969 V!54969 (_ BitVec 32) Int) ListLongMap!21857)

(assert (=> b!1345187 (= res!892545 (contains!9120 (getCurrentListMap!5898 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1345188 () Bool)

(declare-fun res!892549 () Bool)

(assert (=> b!1345188 (=> (not res!892549) (not e!765503))))

(declare-datatypes ((List!31357 0))(
  ( (Nil!31354) (Cons!31353 (h!32562 (_ BitVec 64)) (t!45913 List!31357)) )
))
(declare-fun arrayNoDuplicates!0 (array!91638 (_ BitVec 32) List!31357) Bool)

(assert (=> b!1345188 (= res!892549 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31354))))

(declare-fun b!1345189 () Bool)

(declare-fun e!765498 () Bool)

(assert (=> b!1345189 (= e!765498 (and e!765502 mapRes!57805))))

(declare-fun condMapEmpty!57805 () Bool)

(declare-fun mapDefault!57805 () ValueCell!17801)

