; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111380 () Bool)

(assert start!111380)

(declare-fun b_free!30037 () Bool)

(declare-fun b_next!30037 () Bool)

(assert (=> start!111380 (= b_free!30037 (not b_next!30037))))

(declare-fun tp!105587 () Bool)

(declare-fun b_and!48257 () Bool)

(assert (=> start!111380 (= tp!105587 b_and!48257)))

(declare-fun res!874698 () Bool)

(declare-fun e!752118 () Bool)

(assert (=> start!111380 (=> (not res!874698) (not e!752118))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111380 (= res!874698 (validMask!0 mask!2019))))

(assert (=> start!111380 e!752118))

(declare-datatypes ((array!88666 0))(
  ( (array!88667 (arr!42807 (Array (_ BitVec 32) (_ BitVec 64))) (size!43357 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88666)

(declare-fun array_inv!32331 (array!88666) Bool)

(assert (=> start!111380 (array_inv!32331 _keys!1609)))

(assert (=> start!111380 true))

(declare-fun tp_is_empty!35857 () Bool)

(assert (=> start!111380 tp_is_empty!35857))

(declare-datatypes ((V!52913 0))(
  ( (V!52914 (val!18003 Int)) )
))
(declare-datatypes ((ValueCell!17030 0))(
  ( (ValueCellFull!17030 (v!20633 V!52913)) (EmptyCell!17030) )
))
(declare-datatypes ((array!88668 0))(
  ( (array!88669 (arr!42808 (Array (_ BitVec 32) ValueCell!17030)) (size!43358 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88668)

(declare-fun e!752119 () Bool)

(declare-fun array_inv!32332 (array!88668) Bool)

(assert (=> start!111380 (and (array_inv!32332 _values!1337) e!752119)))

(assert (=> start!111380 tp!105587))

(declare-fun mapIsEmpty!55433 () Bool)

(declare-fun mapRes!55433 () Bool)

(assert (=> mapIsEmpty!55433 mapRes!55433))

(declare-fun b!1317964 () Bool)

(declare-fun res!874700 () Bool)

(assert (=> b!1317964 (=> (not res!874700) (not e!752118))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317964 (= res!874700 (and (= (size!43358 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43357 _keys!1609) (size!43358 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55433 () Bool)

(declare-fun tp!105586 () Bool)

(declare-fun e!752116 () Bool)

(assert (=> mapNonEmpty!55433 (= mapRes!55433 (and tp!105586 e!752116))))

(declare-fun mapRest!55433 () (Array (_ BitVec 32) ValueCell!17030))

(declare-fun mapValue!55433 () ValueCell!17030)

(declare-fun mapKey!55433 () (_ BitVec 32))

(assert (=> mapNonEmpty!55433 (= (arr!42808 _values!1337) (store mapRest!55433 mapKey!55433 mapValue!55433))))

(declare-fun b!1317965 () Bool)

(declare-fun e!752115 () Bool)

(assert (=> b!1317965 (= e!752115 tp_is_empty!35857)))

(declare-fun b!1317966 () Bool)

(assert (=> b!1317966 (= e!752118 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52913)

(declare-fun minValue!1279 () V!52913)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun lt!586431 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23172 0))(
  ( (tuple2!23173 (_1!11597 (_ BitVec 64)) (_2!11597 V!52913)) )
))
(declare-datatypes ((List!30330 0))(
  ( (Nil!30327) (Cons!30326 (h!31535 tuple2!23172) (t!43938 List!30330)) )
))
(declare-datatypes ((ListLongMap!20829 0))(
  ( (ListLongMap!20830 (toList!10430 List!30330)) )
))
(declare-fun contains!8585 (ListLongMap!20829 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5443 (array!88666 array!88668 (_ BitVec 32) (_ BitVec 32) V!52913 V!52913 (_ BitVec 32) Int) ListLongMap!20829)

(assert (=> b!1317966 (= lt!586431 (contains!8585 (getCurrentListMap!5443 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1317967 () Bool)

(assert (=> b!1317967 (= e!752119 (and e!752115 mapRes!55433))))

(declare-fun condMapEmpty!55433 () Bool)

(declare-fun mapDefault!55433 () ValueCell!17030)

