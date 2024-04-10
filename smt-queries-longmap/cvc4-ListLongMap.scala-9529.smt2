; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113040 () Bool)

(assert start!113040)

(declare-fun b_free!31091 () Bool)

(declare-fun b_next!31091 () Bool)

(assert (=> start!113040 (= b_free!31091 (not b_next!31091))))

(declare-fun tp!109078 () Bool)

(declare-fun b_and!50121 () Bool)

(assert (=> start!113040 (= tp!109078 b_and!50121)))

(declare-fun b!1339812 () Bool)

(declare-fun res!888786 () Bool)

(declare-fun e!763159 () Bool)

(assert (=> b!1339812 (=> (not res!888786) (not e!763159))))

(declare-datatypes ((array!91036 0))(
  ( (array!91037 (arr!43974 (Array (_ BitVec 32) (_ BitVec 64))) (size!44524 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91036)

(declare-datatypes ((List!31127 0))(
  ( (Nil!31124) (Cons!31123 (h!32332 (_ BitVec 64)) (t!45459 List!31127)) )
))
(declare-fun arrayNoDuplicates!0 (array!91036 (_ BitVec 32) List!31127) Bool)

(assert (=> b!1339812 (= res!888786 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31124))))

(declare-fun b!1339813 () Bool)

(declare-fun e!763160 () Bool)

(declare-fun tp_is_empty!37091 () Bool)

(assert (=> b!1339813 (= e!763160 tp_is_empty!37091)))

(declare-fun b!1339814 () Bool)

(assert (=> b!1339814 (= e!763159 false)))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((V!54557 0))(
  ( (V!54558 (val!18620 Int)) )
))
(declare-fun zeroValue!1245 () V!54557)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17647 0))(
  ( (ValueCellFull!17647 (v!21268 V!54557)) (EmptyCell!17647) )
))
(declare-datatypes ((array!91038 0))(
  ( (array!91039 (arr!43975 (Array (_ BitVec 32) ValueCell!17647)) (size!44525 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91038)

(declare-fun minValue!1245 () V!54557)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun lt!593931 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((tuple2!23960 0))(
  ( (tuple2!23961 (_1!11991 (_ BitVec 64)) (_2!11991 V!54557)) )
))
(declare-datatypes ((List!31128 0))(
  ( (Nil!31125) (Cons!31124 (h!32333 tuple2!23960) (t!45460 List!31128)) )
))
(declare-datatypes ((ListLongMap!21617 0))(
  ( (ListLongMap!21618 (toList!10824 List!31128)) )
))
(declare-fun contains!9000 (ListLongMap!21617 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5793 (array!91036 array!91038 (_ BitVec 32) (_ BitVec 32) V!54557 V!54557 (_ BitVec 32) Int) ListLongMap!21617)

(assert (=> b!1339814 (= lt!593931 (contains!9000 (getCurrentListMap!5793 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun res!888785 () Bool)

(assert (=> start!113040 (=> (not res!888785) (not e!763159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113040 (= res!888785 (validMask!0 mask!1977))))

(assert (=> start!113040 e!763159))

(assert (=> start!113040 tp_is_empty!37091))

(assert (=> start!113040 true))

(declare-fun array_inv!33159 (array!91036) Bool)

(assert (=> start!113040 (array_inv!33159 _keys!1571)))

(declare-fun e!763161 () Bool)

(declare-fun array_inv!33160 (array!91038) Bool)

(assert (=> start!113040 (and (array_inv!33160 _values!1303) e!763161)))

(assert (=> start!113040 tp!109078))

(declare-fun b!1339815 () Bool)

(declare-fun e!763162 () Bool)

(assert (=> b!1339815 (= e!763162 tp_is_empty!37091)))

(declare-fun mapIsEmpty!57343 () Bool)

(declare-fun mapRes!57343 () Bool)

(assert (=> mapIsEmpty!57343 mapRes!57343))

(declare-fun b!1339816 () Bool)

(assert (=> b!1339816 (= e!763161 (and e!763160 mapRes!57343))))

(declare-fun condMapEmpty!57343 () Bool)

(declare-fun mapDefault!57343 () ValueCell!17647)

