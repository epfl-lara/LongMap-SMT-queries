; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112290 () Bool)

(assert start!112290)

(declare-fun b_free!30685 () Bool)

(declare-fun b_next!30685 () Bool)

(assert (=> start!112290 (= b_free!30685 (not b_next!30685))))

(declare-fun tp!107691 () Bool)

(declare-fun b_and!49425 () Bool)

(assert (=> start!112290 (= tp!107691 b_and!49425)))

(declare-fun b!1330577 () Bool)

(declare-fun e!758339 () Bool)

(declare-fun tp_is_empty!36595 () Bool)

(assert (=> b!1330577 (= e!758339 tp_is_empty!36595)))

(declare-fun mapNonEmpty!56566 () Bool)

(declare-fun mapRes!56566 () Bool)

(declare-fun tp!107692 () Bool)

(declare-fun e!758340 () Bool)

(assert (=> mapNonEmpty!56566 (= mapRes!56566 (and tp!107692 e!758340))))

(declare-datatypes ((V!53897 0))(
  ( (V!53898 (val!18372 Int)) )
))
(declare-datatypes ((ValueCell!17399 0))(
  ( (ValueCellFull!17399 (v!21009 V!53897)) (EmptyCell!17399) )
))
(declare-fun mapRest!56566 () (Array (_ BitVec 32) ValueCell!17399))

(declare-datatypes ((array!90074 0))(
  ( (array!90075 (arr!43503 (Array (_ BitVec 32) ValueCell!17399)) (size!44053 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90074)

(declare-fun mapKey!56566 () (_ BitVec 32))

(declare-fun mapValue!56566 () ValueCell!17399)

(assert (=> mapNonEmpty!56566 (= (arr!43503 _values!1320) (store mapRest!56566 mapKey!56566 mapValue!56566))))

(declare-fun b!1330578 () Bool)

(declare-fun res!882908 () Bool)

(declare-fun e!758337 () Bool)

(assert (=> b!1330578 (=> (not res!882908) (not e!758337))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90076 0))(
  ( (array!90077 (arr!43504 (Array (_ BitVec 32) (_ BitVec 64))) (size!44054 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90076)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1330578 (= res!882908 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44054 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56566 () Bool)

(assert (=> mapIsEmpty!56566 mapRes!56566))

(declare-fun b!1330579 () Bool)

(declare-fun res!882907 () Bool)

(assert (=> b!1330579 (=> (not res!882907) (not e!758337))))

(declare-datatypes ((List!30810 0))(
  ( (Nil!30807) (Cons!30806 (h!32015 (_ BitVec 64)) (t!44908 List!30810)) )
))
(declare-fun arrayNoDuplicates!0 (array!90076 (_ BitVec 32) List!30810) Bool)

(assert (=> b!1330579 (= res!882907 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30807))))

(declare-fun b!1330580 () Bool)

(declare-fun res!882904 () Bool)

(assert (=> b!1330580 (=> (not res!882904) (not e!758337))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90076 (_ BitVec 32)) Bool)

(assert (=> b!1330580 (= res!882904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330581 () Bool)

(assert (=> b!1330581 (= e!758337 (not true))))

(declare-datatypes ((tuple2!23660 0))(
  ( (tuple2!23661 (_1!11841 (_ BitVec 64)) (_2!11841 V!53897)) )
))
(declare-datatypes ((List!30811 0))(
  ( (Nil!30808) (Cons!30807 (h!32016 tuple2!23660) (t!44909 List!30811)) )
))
(declare-datatypes ((ListLongMap!21317 0))(
  ( (ListLongMap!21318 (toList!10674 List!30811)) )
))
(declare-fun lt!591195 () ListLongMap!21317)

(declare-fun contains!8838 (ListLongMap!21317 (_ BitVec 64)) Bool)

(assert (=> b!1330581 (contains!8838 lt!591195 k!1153)))

(declare-fun lt!591198 () V!53897)

(declare-datatypes ((Unit!43791 0))(
  ( (Unit!43792) )
))
(declare-fun lt!591199 () Unit!43791)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!258 ((_ BitVec 64) (_ BitVec 64) V!53897 ListLongMap!21317) Unit!43791)

(assert (=> b!1330581 (= lt!591199 (lemmaInListMapAfterAddingDiffThenInBefore!258 k!1153 (select (arr!43504 _keys!1590) from!1980) lt!591198 lt!591195))))

(declare-fun lt!591197 () ListLongMap!21317)

(assert (=> b!1330581 (contains!8838 lt!591197 k!1153)))

(declare-fun lt!591196 () Unit!43791)

(declare-fun minValue!1262 () V!53897)

(assert (=> b!1330581 (= lt!591196 (lemmaInListMapAfterAddingDiffThenInBefore!258 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591197))))

(declare-fun +!4671 (ListLongMap!21317 tuple2!23660) ListLongMap!21317)

(assert (=> b!1330581 (= lt!591197 (+!4671 lt!591195 (tuple2!23661 (select (arr!43504 _keys!1590) from!1980) lt!591198)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21929 (ValueCell!17399 V!53897) V!53897)

(declare-fun dynLambda!3610 (Int (_ BitVec 64)) V!53897)

(assert (=> b!1330581 (= lt!591198 (get!21929 (select (arr!43503 _values!1320) from!1980) (dynLambda!3610 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53897)

(declare-fun getCurrentListMapNoExtraKeys!6309 (array!90076 array!90074 (_ BitVec 32) (_ BitVec 32) V!53897 V!53897 (_ BitVec 32) Int) ListLongMap!21317)

(assert (=> b!1330581 (= lt!591195 (getCurrentListMapNoExtraKeys!6309 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330582 () Bool)

(declare-fun res!882905 () Bool)

(assert (=> b!1330582 (=> (not res!882905) (not e!758337))))

(declare-fun getCurrentListMap!5661 (array!90076 array!90074 (_ BitVec 32) (_ BitVec 32) V!53897 V!53897 (_ BitVec 32) Int) ListLongMap!21317)

(assert (=> b!1330582 (= res!882905 (contains!8838 (getCurrentListMap!5661 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1330583 () Bool)

(declare-fun res!882906 () Bool)

(assert (=> b!1330583 (=> (not res!882906) (not e!758337))))

(assert (=> b!1330583 (= res!882906 (not (= (select (arr!43504 _keys!1590) from!1980) k!1153)))))

(declare-fun res!882910 () Bool)

(assert (=> start!112290 (=> (not res!882910) (not e!758337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112290 (= res!882910 (validMask!0 mask!1998))))

(assert (=> start!112290 e!758337))

(declare-fun e!758341 () Bool)

(declare-fun array_inv!32817 (array!90074) Bool)

(assert (=> start!112290 (and (array_inv!32817 _values!1320) e!758341)))

(assert (=> start!112290 true))

(declare-fun array_inv!32818 (array!90076) Bool)

(assert (=> start!112290 (array_inv!32818 _keys!1590)))

(assert (=> start!112290 tp!107691))

(assert (=> start!112290 tp_is_empty!36595))

(declare-fun b!1330584 () Bool)

(declare-fun res!882911 () Bool)

(assert (=> b!1330584 (=> (not res!882911) (not e!758337))))

(assert (=> b!1330584 (= res!882911 (and (= (size!44053 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44054 _keys!1590) (size!44053 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330585 () Bool)

(declare-fun res!882909 () Bool)

(assert (=> b!1330585 (=> (not res!882909) (not e!758337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330585 (= res!882909 (validKeyInArray!0 (select (arr!43504 _keys!1590) from!1980)))))

(declare-fun b!1330586 () Bool)

(assert (=> b!1330586 (= e!758340 tp_is_empty!36595)))

(declare-fun b!1330587 () Bool)

(assert (=> b!1330587 (= e!758341 (and e!758339 mapRes!56566))))

(declare-fun condMapEmpty!56566 () Bool)

(declare-fun mapDefault!56566 () ValueCell!17399)

