; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112260 () Bool)

(assert start!112260)

(declare-fun b_free!30655 () Bool)

(declare-fun b_next!30655 () Bool)

(assert (=> start!112260 (= b_free!30655 (not b_next!30655))))

(declare-fun tp!107602 () Bool)

(declare-fun b_and!49365 () Bool)

(assert (=> start!112260 (= tp!107602 b_and!49365)))

(declare-fun b!1330007 () Bool)

(declare-fun res!882503 () Bool)

(declare-fun e!758115 () Bool)

(assert (=> b!1330007 (=> (not res!882503) (not e!758115))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90020 0))(
  ( (array!90021 (arr!43476 (Array (_ BitVec 32) (_ BitVec 64))) (size!44026 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90020)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1330007 (= res!882503 (not (= (select (arr!43476 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1330008 () Bool)

(declare-fun res!882504 () Bool)

(assert (=> b!1330008 (=> (not res!882504) (not e!758115))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330008 (= res!882504 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330009 () Bool)

(declare-fun res!882506 () Bool)

(assert (=> b!1330009 (=> (not res!882506) (not e!758115))))

(declare-datatypes ((V!53857 0))(
  ( (V!53858 (val!18357 Int)) )
))
(declare-datatypes ((ValueCell!17384 0))(
  ( (ValueCellFull!17384 (v!20994 V!53857)) (EmptyCell!17384) )
))
(declare-datatypes ((array!90022 0))(
  ( (array!90023 (arr!43477 (Array (_ BitVec 32) ValueCell!17384)) (size!44027 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90022)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1330009 (= res!882506 (and (= (size!44027 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44026 _keys!1590) (size!44027 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56521 () Bool)

(declare-fun mapRes!56521 () Bool)

(declare-fun tp!107601 () Bool)

(declare-fun e!758112 () Bool)

(assert (=> mapNonEmpty!56521 (= mapRes!56521 (and tp!107601 e!758112))))

(declare-fun mapValue!56521 () ValueCell!17384)

(declare-fun mapRest!56521 () (Array (_ BitVec 32) ValueCell!17384))

(declare-fun mapKey!56521 () (_ BitVec 32))

(assert (=> mapNonEmpty!56521 (= (arr!43477 _values!1320) (store mapRest!56521 mapKey!56521 mapValue!56521))))

(declare-fun b!1330010 () Bool)

(declare-fun res!882507 () Bool)

(assert (=> b!1330010 (=> (not res!882507) (not e!758115))))

(assert (=> b!1330010 (= res!882507 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44026 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330011 () Bool)

(declare-fun res!882501 () Bool)

(assert (=> b!1330011 (=> (not res!882501) (not e!758115))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53857)

(declare-fun zeroValue!1262 () V!53857)

(declare-datatypes ((tuple2!23636 0))(
  ( (tuple2!23637 (_1!11829 (_ BitVec 64)) (_2!11829 V!53857)) )
))
(declare-datatypes ((List!30789 0))(
  ( (Nil!30786) (Cons!30785 (h!31994 tuple2!23636) (t!44857 List!30789)) )
))
(declare-datatypes ((ListLongMap!21293 0))(
  ( (ListLongMap!21294 (toList!10662 List!30789)) )
))
(declare-fun contains!8826 (ListLongMap!21293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5650 (array!90020 array!90022 (_ BitVec 32) (_ BitVec 32) V!53857 V!53857 (_ BitVec 32) Int) ListLongMap!21293)

(assert (=> b!1330011 (= res!882501 (contains!8826 (getCurrentListMap!5650 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1330012 () Bool)

(declare-fun res!882502 () Bool)

(assert (=> b!1330012 (=> (not res!882502) (not e!758115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330012 (= res!882502 (validKeyInArray!0 (select (arr!43476 _keys!1590) from!1980)))))

(declare-fun b!1330014 () Bool)

(declare-fun tp_is_empty!36565 () Bool)

(assert (=> b!1330014 (= e!758112 tp_is_empty!36565)))

(declare-fun mapIsEmpty!56521 () Bool)

(assert (=> mapIsEmpty!56521 mapRes!56521))

(declare-fun b!1330015 () Bool)

(declare-fun e!758113 () Bool)

(declare-fun e!758114 () Bool)

(assert (=> b!1330015 (= e!758113 (and e!758114 mapRes!56521))))

(declare-fun condMapEmpty!56521 () Bool)

(declare-fun mapDefault!56521 () ValueCell!17384)

