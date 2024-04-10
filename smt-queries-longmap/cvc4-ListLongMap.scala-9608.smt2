; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113598 () Bool)

(assert start!113598)

(declare-fun b_free!31565 () Bool)

(declare-fun b_next!31565 () Bool)

(assert (=> start!113598 (= b_free!31565 (not b_next!31565))))

(declare-fun tp!110506 () Bool)

(declare-fun b_and!50923 () Bool)

(assert (=> start!113598 (= tp!110506 b_and!50923)))

(declare-fun b!1348532 () Bool)

(declare-fun res!894730 () Bool)

(declare-fun e!767159 () Bool)

(assert (=> b!1348532 (=> (not res!894730) (not e!767159))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91958 0))(
  ( (array!91959 (arr!44433 (Array (_ BitVec 32) (_ BitVec 64))) (size!44983 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91958)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1348532 (= res!894730 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44983 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348533 () Bool)

(declare-fun res!894727 () Bool)

(assert (=> b!1348533 (=> (not res!894727) (not e!767159))))

(declare-datatypes ((List!31466 0))(
  ( (Nil!31463) (Cons!31462 (h!32671 (_ BitVec 64)) (t!46104 List!31466)) )
))
(declare-fun arrayNoDuplicates!0 (array!91958 (_ BitVec 32) List!31466) Bool)

(assert (=> b!1348533 (= res!894727 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31463))))

(declare-fun b!1348534 () Bool)

(declare-fun e!767160 () Bool)

(declare-fun tp_is_empty!37565 () Bool)

(assert (=> b!1348534 (= e!767160 tp_is_empty!37565)))

(declare-fun b!1348535 () Bool)

(assert (=> b!1348535 (= e!767159 false)))

(declare-datatypes ((V!55189 0))(
  ( (V!55190 (val!18857 Int)) )
))
(declare-fun minValue!1245 () V!55189)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17884 0))(
  ( (ValueCellFull!17884 (v!21509 V!55189)) (EmptyCell!17884) )
))
(declare-datatypes ((array!91960 0))(
  ( (array!91961 (arr!44434 (Array (_ BitVec 32) ValueCell!17884)) (size!44984 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91960)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!55189)

(declare-fun lt!596177 () Bool)

(declare-datatypes ((tuple2!24314 0))(
  ( (tuple2!24315 (_1!12168 (_ BitVec 64)) (_2!12168 V!55189)) )
))
(declare-datatypes ((List!31467 0))(
  ( (Nil!31464) (Cons!31463 (h!32672 tuple2!24314) (t!46105 List!31467)) )
))
(declare-datatypes ((ListLongMap!21971 0))(
  ( (ListLongMap!21972 (toList!11001 List!31467)) )
))
(declare-fun contains!9181 (ListLongMap!21971 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5950 (array!91958 array!91960 (_ BitVec 32) (_ BitVec 32) V!55189 V!55189 (_ BitVec 32) Int) ListLongMap!21971)

(assert (=> b!1348535 (= lt!596177 (contains!9181 (getCurrentListMap!5950 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun res!894731 () Bool)

(assert (=> start!113598 (=> (not res!894731) (not e!767159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113598 (= res!894731 (validMask!0 mask!1977))))

(assert (=> start!113598 e!767159))

(assert (=> start!113598 tp_is_empty!37565))

(assert (=> start!113598 true))

(declare-fun array_inv!33471 (array!91958) Bool)

(assert (=> start!113598 (array_inv!33471 _keys!1571)))

(declare-fun e!767161 () Bool)

(declare-fun array_inv!33472 (array!91960) Bool)

(assert (=> start!113598 (and (array_inv!33472 _values!1303) e!767161)))

(assert (=> start!113598 tp!110506))

(declare-fun b!1348536 () Bool)

(declare-fun e!767163 () Bool)

(declare-fun mapRes!58061 () Bool)

(assert (=> b!1348536 (= e!767161 (and e!767163 mapRes!58061))))

(declare-fun condMapEmpty!58061 () Bool)

(declare-fun mapDefault!58061 () ValueCell!17884)

