; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113294 () Bool)

(assert start!113294)

(declare-fun b_free!31345 () Bool)

(declare-fun b_next!31345 () Bool)

(assert (=> start!113294 (= b_free!31345 (not b_next!31345))))

(declare-fun tp!109840 () Bool)

(declare-fun b_and!50567 () Bool)

(assert (=> start!113294 (= tp!109840 b_and!50567)))

(declare-fun b!1344231 () Bool)

(declare-fun res!891868 () Bool)

(declare-fun e!765064 () Bool)

(assert (=> b!1344231 (=> (not res!891868) (not e!765064))))

(declare-datatypes ((array!91532 0))(
  ( (array!91533 (arr!44222 (Array (_ BitVec 32) (_ BitVec 64))) (size!44772 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91532)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91532 (_ BitVec 32)) Bool)

(assert (=> b!1344231 (= res!891868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344232 () Bool)

(declare-fun res!891867 () Bool)

(assert (=> b!1344232 (=> (not res!891867) (not e!765064))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1344232 (= res!891867 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44772 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344233 () Bool)

(declare-fun e!765065 () Bool)

(declare-fun tp_is_empty!37345 () Bool)

(assert (=> b!1344233 (= e!765065 tp_is_empty!37345)))

(declare-fun b!1344234 () Bool)

(declare-fun e!765068 () Bool)

(assert (=> b!1344234 (= e!765068 tp_is_empty!37345)))

(declare-fun mapIsEmpty!57724 () Bool)

(declare-fun mapRes!57724 () Bool)

(assert (=> mapIsEmpty!57724 mapRes!57724))

(declare-fun b!1344235 () Bool)

(declare-fun res!891870 () Bool)

(assert (=> b!1344235 (=> (not res!891870) (not e!765064))))

(declare-datatypes ((List!31313 0))(
  ( (Nil!31310) (Cons!31309 (h!32518 (_ BitVec 64)) (t!45837 List!31313)) )
))
(declare-fun arrayNoDuplicates!0 (array!91532 (_ BitVec 32) List!31313) Bool)

(assert (=> b!1344235 (= res!891870 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31310))))

(declare-fun mapNonEmpty!57724 () Bool)

(declare-fun tp!109839 () Bool)

(assert (=> mapNonEmpty!57724 (= mapRes!57724 (and tp!109839 e!765065))))

(declare-fun mapKey!57724 () (_ BitVec 32))

(declare-datatypes ((V!54897 0))(
  ( (V!54898 (val!18747 Int)) )
))
(declare-datatypes ((ValueCell!17774 0))(
  ( (ValueCellFull!17774 (v!21395 V!54897)) (EmptyCell!17774) )
))
(declare-fun mapValue!57724 () ValueCell!17774)

(declare-fun mapRest!57724 () (Array (_ BitVec 32) ValueCell!17774))

(declare-datatypes ((array!91534 0))(
  ( (array!91535 (arr!44223 (Array (_ BitVec 32) ValueCell!17774)) (size!44773 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91534)

(assert (=> mapNonEmpty!57724 (= (arr!44223 _values!1303) (store mapRest!57724 mapKey!57724 mapValue!57724))))

(declare-fun b!1344236 () Bool)

(declare-fun res!891866 () Bool)

(assert (=> b!1344236 (=> (not res!891866) (not e!765064))))

(assert (=> b!1344236 (= res!891866 (and (= (size!44773 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44772 _keys!1571) (size!44773 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344237 () Bool)

(declare-fun e!765067 () Bool)

(assert (=> b!1344237 (= e!765067 (and e!765068 mapRes!57724))))

(declare-fun condMapEmpty!57724 () Bool)

(declare-fun mapDefault!57724 () ValueCell!17774)

