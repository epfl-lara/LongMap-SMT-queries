; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112284 () Bool)

(assert start!112284)

(declare-fun b_free!30679 () Bool)

(declare-fun b_next!30679 () Bool)

(assert (=> start!112284 (= b_free!30679 (not b_next!30679))))

(declare-fun tp!107673 () Bool)

(declare-fun b_and!49413 () Bool)

(assert (=> start!112284 (= tp!107673 b_and!49413)))

(declare-fun b!1330463 () Bool)

(declare-fun res!882828 () Bool)

(declare-fun e!758296 () Bool)

(assert (=> b!1330463 (=> (not res!882828) (not e!758296))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90064 0))(
  ( (array!90065 (arr!43498 (Array (_ BitVec 32) (_ BitVec 64))) (size!44048 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90064)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1330463 (= res!882828 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44048 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330464 () Bool)

(declare-fun e!758293 () Bool)

(declare-fun tp_is_empty!36589 () Bool)

(assert (=> b!1330464 (= e!758293 tp_is_empty!36589)))

(declare-fun mapNonEmpty!56557 () Bool)

(declare-fun mapRes!56557 () Bool)

(declare-fun tp!107674 () Bool)

(assert (=> mapNonEmpty!56557 (= mapRes!56557 (and tp!107674 e!758293))))

(declare-datatypes ((V!53889 0))(
  ( (V!53890 (val!18369 Int)) )
))
(declare-datatypes ((ValueCell!17396 0))(
  ( (ValueCellFull!17396 (v!21006 V!53889)) (EmptyCell!17396) )
))
(declare-datatypes ((array!90066 0))(
  ( (array!90067 (arr!43499 (Array (_ BitVec 32) ValueCell!17396)) (size!44049 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90066)

(declare-fun mapValue!56557 () ValueCell!17396)

(declare-fun mapRest!56557 () (Array (_ BitVec 32) ValueCell!17396))

(declare-fun mapKey!56557 () (_ BitVec 32))

(assert (=> mapNonEmpty!56557 (= (arr!43499 _values!1320) (store mapRest!56557 mapKey!56557 mapValue!56557))))

(declare-fun b!1330465 () Bool)

(declare-fun e!758294 () Bool)

(assert (=> b!1330465 (= e!758294 tp_is_empty!36589)))

(declare-fun b!1330466 () Bool)

(declare-fun res!882831 () Bool)

(assert (=> b!1330466 (=> (not res!882831) (not e!758296))))

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1330466 (= res!882831 (and (= (size!44049 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44048 _keys!1590) (size!44049 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330467 () Bool)

(declare-fun res!882829 () Bool)

(assert (=> b!1330467 (=> (not res!882829) (not e!758296))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53889)

(declare-fun zeroValue!1262 () V!53889)

(declare-datatypes ((tuple2!23656 0))(
  ( (tuple2!23657 (_1!11839 (_ BitVec 64)) (_2!11839 V!53889)) )
))
(declare-datatypes ((List!30806 0))(
  ( (Nil!30803) (Cons!30802 (h!32011 tuple2!23656) (t!44898 List!30806)) )
))
(declare-datatypes ((ListLongMap!21313 0))(
  ( (ListLongMap!21314 (toList!10672 List!30806)) )
))
(declare-fun contains!8836 (ListLongMap!21313 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5659 (array!90064 array!90066 (_ BitVec 32) (_ BitVec 32) V!53889 V!53889 (_ BitVec 32) Int) ListLongMap!21313)

(assert (=> b!1330467 (= res!882829 (contains!8836 (getCurrentListMap!5659 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1330468 () Bool)

(declare-fun res!882827 () Bool)

(assert (=> b!1330468 (=> (not res!882827) (not e!758296))))

(assert (=> b!1330468 (= res!882827 (not (= (select (arr!43498 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1330469 () Bool)

(declare-fun res!882830 () Bool)

(assert (=> b!1330469 (=> (not res!882830) (not e!758296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90064 (_ BitVec 32)) Bool)

(assert (=> b!1330469 (= res!882830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56557 () Bool)

(assert (=> mapIsEmpty!56557 mapRes!56557))

(declare-fun b!1330470 () Bool)

(declare-fun res!882826 () Bool)

(assert (=> b!1330470 (=> (not res!882826) (not e!758296))))

(assert (=> b!1330470 (= res!882826 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330471 () Bool)

(declare-fun res!882823 () Bool)

(assert (=> b!1330471 (=> (not res!882823) (not e!758296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330471 (= res!882823 (validKeyInArray!0 (select (arr!43498 _keys!1590) from!1980)))))

(declare-fun b!1330472 () Bool)

(declare-fun res!882824 () Bool)

(assert (=> b!1330472 (=> (not res!882824) (not e!758296))))

(declare-datatypes ((List!30807 0))(
  ( (Nil!30804) (Cons!30803 (h!32012 (_ BitVec 64)) (t!44899 List!30807)) )
))
(declare-fun arrayNoDuplicates!0 (array!90064 (_ BitVec 32) List!30807) Bool)

(assert (=> b!1330472 (= res!882824 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30804))))

(declare-fun b!1330473 () Bool)

(declare-fun e!758292 () Bool)

(assert (=> b!1330473 (= e!758292 (and e!758294 mapRes!56557))))

(declare-fun condMapEmpty!56557 () Bool)

(declare-fun mapDefault!56557 () ValueCell!17396)

