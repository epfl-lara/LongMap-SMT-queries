; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111776 () Bool)

(assert start!111776)

(declare-fun b_free!30433 () Bool)

(declare-fun b_next!30433 () Bool)

(assert (=> start!111776 (= b_free!30433 (not b_next!30433))))

(declare-fun tp!106774 () Bool)

(declare-fun b_and!48971 () Bool)

(assert (=> start!111776 (= tp!106774 b_and!48971)))

(declare-fun b!1324519 () Bool)

(declare-fun res!879153 () Bool)

(declare-fun e!755087 () Bool)

(assert (=> b!1324519 (=> (not res!879153) (not e!755087))))

(declare-datatypes ((array!89420 0))(
  ( (array!89421 (arr!43184 (Array (_ BitVec 32) (_ BitVec 64))) (size!43734 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89420)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1324519 (= res!879153 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43734 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324520 () Bool)

(declare-fun res!879152 () Bool)

(assert (=> b!1324520 (=> (not res!879152) (not e!755087))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89420 (_ BitVec 32)) Bool)

(assert (=> b!1324520 (= res!879152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324521 () Bool)

(assert (=> b!1324521 (= e!755087 false)))

(declare-datatypes ((V!53441 0))(
  ( (V!53442 (val!18201 Int)) )
))
(declare-fun zeroValue!1279 () V!53441)

(declare-datatypes ((ValueCell!17228 0))(
  ( (ValueCellFull!17228 (v!20831 V!53441)) (EmptyCell!17228) )
))
(declare-datatypes ((array!89422 0))(
  ( (array!89423 (arr!43185 (Array (_ BitVec 32) ValueCell!17228)) (size!43735 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89422)

(declare-fun minValue!1279 () V!53441)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589473 () Bool)

(declare-datatypes ((tuple2!23470 0))(
  ( (tuple2!23471 (_1!11746 (_ BitVec 64)) (_2!11746 V!53441)) )
))
(declare-datatypes ((List!30612 0))(
  ( (Nil!30609) (Cons!30608 (h!31817 tuple2!23470) (t!44538 List!30612)) )
))
(declare-datatypes ((ListLongMap!21127 0))(
  ( (ListLongMap!21128 (toList!10579 List!30612)) )
))
(declare-fun contains!8734 (ListLongMap!21127 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5575 (array!89420 array!89422 (_ BitVec 32) (_ BitVec 32) V!53441 V!53441 (_ BitVec 32) Int) ListLongMap!21127)

(assert (=> b!1324521 (= lt!589473 (contains!8734 (getCurrentListMap!5575 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1324522 () Bool)

(declare-fun e!755086 () Bool)

(declare-fun e!755085 () Bool)

(declare-fun mapRes!56027 () Bool)

(assert (=> b!1324522 (= e!755086 (and e!755085 mapRes!56027))))

(declare-fun condMapEmpty!56027 () Bool)

(declare-fun mapDefault!56027 () ValueCell!17228)

