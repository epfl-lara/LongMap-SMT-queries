; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113606 () Bool)

(assert start!113606)

(declare-fun b_free!31573 () Bool)

(declare-fun b_next!31573 () Bool)

(assert (=> start!113606 (= b_free!31573 (not b_next!31573))))

(declare-fun tp!110530 () Bool)

(declare-fun b_and!50931 () Bool)

(assert (=> start!113606 (= tp!110530 b_and!50931)))

(declare-fun b!1348663 () Bool)

(declare-fun e!767219 () Bool)

(declare-fun tp_is_empty!37573 () Bool)

(assert (=> b!1348663 (= e!767219 tp_is_empty!37573)))

(declare-fun b!1348664 () Bool)

(declare-fun res!894824 () Bool)

(declare-fun e!767222 () Bool)

(assert (=> b!1348664 (=> (not res!894824) (not e!767222))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91974 0))(
  ( (array!91975 (arr!44441 (Array (_ BitVec 32) (_ BitVec 64))) (size!44991 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91974)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55201 0))(
  ( (V!55202 (val!18861 Int)) )
))
(declare-datatypes ((ValueCell!17888 0))(
  ( (ValueCellFull!17888 (v!21513 V!55201)) (EmptyCell!17888) )
))
(declare-datatypes ((array!91976 0))(
  ( (array!91977 (arr!44442 (Array (_ BitVec 32) ValueCell!17888)) (size!44992 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91976)

(assert (=> b!1348664 (= res!894824 (and (= (size!44992 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44991 _keys!1571) (size!44992 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348665 () Bool)

(declare-fun res!894823 () Bool)

(assert (=> b!1348665 (=> (not res!894823) (not e!767222))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348665 (= res!894823 (validKeyInArray!0 (select (arr!44441 _keys!1571) from!1960)))))

(declare-fun res!894825 () Bool)

(assert (=> start!113606 (=> (not res!894825) (not e!767222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113606 (= res!894825 (validMask!0 mask!1977))))

(assert (=> start!113606 e!767222))

(assert (=> start!113606 tp_is_empty!37573))

(assert (=> start!113606 true))

(declare-fun array_inv!33477 (array!91974) Bool)

(assert (=> start!113606 (array_inv!33477 _keys!1571)))

(declare-fun e!767220 () Bool)

(declare-fun array_inv!33478 (array!91976) Bool)

(assert (=> start!113606 (and (array_inv!33478 _values!1303) e!767220)))

(assert (=> start!113606 tp!110530))

(declare-fun b!1348666 () Bool)

(declare-fun res!894829 () Bool)

(assert (=> b!1348666 (=> (not res!894829) (not e!767222))))

(declare-fun minValue!1245 () V!55201)

(declare-fun zeroValue!1245 () V!55201)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24322 0))(
  ( (tuple2!24323 (_1!12172 (_ BitVec 64)) (_2!12172 V!55201)) )
))
(declare-datatypes ((List!31474 0))(
  ( (Nil!31471) (Cons!31470 (h!32679 tuple2!24322) (t!46114 List!31474)) )
))
(declare-datatypes ((ListLongMap!21979 0))(
  ( (ListLongMap!21980 (toList!11005 List!31474)) )
))
(declare-fun contains!9185 (ListLongMap!21979 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5954 (array!91974 array!91976 (_ BitVec 32) (_ BitVec 32) V!55201 V!55201 (_ BitVec 32) Int) ListLongMap!21979)

(assert (=> b!1348666 (= res!894829 (contains!9185 (getCurrentListMap!5954 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1348667 () Bool)

(declare-fun +!4849 (ListLongMap!21979 tuple2!24322) ListLongMap!21979)

(declare-fun getCurrentListMapNoExtraKeys!6495 (array!91974 array!91976 (_ BitVec 32) (_ BitVec 32) V!55201 V!55201 (_ BitVec 32) Int) ListLongMap!21979)

(declare-fun get!22451 (ValueCell!17888 V!55201) V!55201)

(declare-fun dynLambda!3788 (Int (_ BitVec 64)) V!55201)

(assert (=> b!1348667 (= e!767222 (not (contains!9185 (+!4849 (getCurrentListMapNoExtraKeys!6495 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24323 (select (arr!44441 _keys!1571) from!1960) (get!22451 (select (arr!44442 _values!1303) from!1960) (dynLambda!3788 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k!1142)))))

(declare-fun b!1348668 () Bool)

(declare-fun res!894828 () Bool)

(assert (=> b!1348668 (=> (not res!894828) (not e!767222))))

(declare-datatypes ((List!31475 0))(
  ( (Nil!31472) (Cons!31471 (h!32680 (_ BitVec 64)) (t!46115 List!31475)) )
))
(declare-fun arrayNoDuplicates!0 (array!91974 (_ BitVec 32) List!31475) Bool)

(assert (=> b!1348668 (= res!894828 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31472))))

(declare-fun b!1348669 () Bool)

(declare-fun res!894826 () Bool)

(assert (=> b!1348669 (=> (not res!894826) (not e!767222))))

(assert (=> b!1348669 (= res!894826 (not (= (select (arr!44441 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1348670 () Bool)

(declare-fun res!894827 () Bool)

(assert (=> b!1348670 (=> (not res!894827) (not e!767222))))

(assert (=> b!1348670 (= res!894827 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1348671 () Bool)

(declare-fun e!767221 () Bool)

(assert (=> b!1348671 (= e!767221 tp_is_empty!37573)))

(declare-fun b!1348672 () Bool)

(declare-fun mapRes!58073 () Bool)

(assert (=> b!1348672 (= e!767220 (and e!767219 mapRes!58073))))

(declare-fun condMapEmpty!58073 () Bool)

(declare-fun mapDefault!58073 () ValueCell!17888)

