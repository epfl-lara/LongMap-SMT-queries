; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112578 () Bool)

(assert start!112578)

(declare-fun b_free!30973 () Bool)

(declare-fun b_next!30973 () Bool)

(assert (=> start!112578 (= b_free!30973 (not b_next!30973))))

(declare-fun tp!108555 () Bool)

(declare-fun b_and!49881 () Bool)

(assert (=> start!112578 (= tp!108555 b_and!49881)))

(declare-fun b!1335425 () Bool)

(declare-fun res!886290 () Bool)

(declare-fun e!760579 () Bool)

(assert (=> b!1335425 (=> (not res!886290) (not e!760579))))

(declare-datatypes ((V!54281 0))(
  ( (V!54282 (val!18516 Int)) )
))
(declare-datatypes ((ValueCell!17543 0))(
  ( (ValueCellFull!17543 (v!21153 V!54281)) (EmptyCell!17543) )
))
(declare-datatypes ((array!90626 0))(
  ( (array!90627 (arr!43779 (Array (_ BitVec 32) ValueCell!17543)) (size!44329 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90626)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90628 0))(
  ( (array!90629 (arr!43780 (Array (_ BitVec 32) (_ BitVec 64))) (size!44330 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90628)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54281)

(declare-fun zeroValue!1262 () V!54281)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23876 0))(
  ( (tuple2!23877 (_1!11949 (_ BitVec 64)) (_2!11949 V!54281)) )
))
(declare-datatypes ((List!31018 0))(
  ( (Nil!31015) (Cons!31014 (h!32223 tuple2!23876) (t!45282 List!31018)) )
))
(declare-datatypes ((ListLongMap!21533 0))(
  ( (ListLongMap!21534 (toList!10782 List!31018)) )
))
(declare-fun contains!8946 (ListLongMap!21533 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5756 (array!90628 array!90626 (_ BitVec 32) (_ BitVec 32) V!54281 V!54281 (_ BitVec 32) Int) ListLongMap!21533)

(assert (=> b!1335425 (= res!886290 (contains!8946 (getCurrentListMap!5756 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapIsEmpty!56998 () Bool)

(declare-fun mapRes!56998 () Bool)

(assert (=> mapIsEmpty!56998 mapRes!56998))

(declare-fun b!1335426 () Bool)

(assert (=> b!1335426 (= e!760579 false)))

(declare-fun lt!592456 () ListLongMap!21533)

(declare-fun getCurrentListMapNoExtraKeys!6368 (array!90628 array!90626 (_ BitVec 32) (_ BitVec 32) V!54281 V!54281 (_ BitVec 32) Int) ListLongMap!21533)

(assert (=> b!1335426 (= lt!592456 (getCurrentListMapNoExtraKeys!6368 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1335427 () Bool)

(declare-fun res!886295 () Bool)

(assert (=> b!1335427 (=> (not res!886295) (not e!760579))))

(assert (=> b!1335427 (= res!886295 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1335428 () Bool)

(declare-fun res!886293 () Bool)

(assert (=> b!1335428 (=> (not res!886293) (not e!760579))))

(assert (=> b!1335428 (= res!886293 (and (= (size!44329 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44330 _keys!1590) (size!44329 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335429 () Bool)

(declare-fun res!886296 () Bool)

(assert (=> b!1335429 (=> (not res!886296) (not e!760579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335429 (= res!886296 (validKeyInArray!0 (select (arr!43780 _keys!1590) from!1980)))))

(declare-fun b!1335430 () Bool)

(declare-fun e!760578 () Bool)

(declare-fun e!760581 () Bool)

(assert (=> b!1335430 (= e!760578 (and e!760581 mapRes!56998))))

(declare-fun condMapEmpty!56998 () Bool)

(declare-fun mapDefault!56998 () ValueCell!17543)

