; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112664 () Bool)

(assert start!112664)

(declare-fun b_free!31001 () Bool)

(declare-fun b_next!31001 () Bool)

(assert (=> start!112664 (= b_free!31001 (not b_next!31001))))

(declare-fun tp!108643 () Bool)

(declare-fun b_and!49939 () Bool)

(assert (=> start!112664 (= tp!108643 b_and!49939)))

(declare-fun b!1336329 () Bool)

(declare-fun res!886827 () Bool)

(declare-fun e!761034 () Bool)

(assert (=> b!1336329 (=> (not res!886827) (not e!761034))))

(declare-datatypes ((V!54317 0))(
  ( (V!54318 (val!18530 Int)) )
))
(declare-datatypes ((ValueCell!17557 0))(
  ( (ValueCellFull!17557 (v!21170 V!54317)) (EmptyCell!17557) )
))
(declare-datatypes ((array!90682 0))(
  ( (array!90683 (arr!43806 (Array (_ BitVec 32) ValueCell!17557)) (size!44356 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90682)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90684 0))(
  ( (array!90685 (arr!43807 (Array (_ BitVec 32) (_ BitVec 64))) (size!44357 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90684)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54317)

(declare-fun zeroValue!1262 () V!54317)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23900 0))(
  ( (tuple2!23901 (_1!11961 (_ BitVec 64)) (_2!11961 V!54317)) )
))
(declare-datatypes ((List!31042 0))(
  ( (Nil!31039) (Cons!31038 (h!32247 tuple2!23900) (t!45324 List!31042)) )
))
(declare-datatypes ((ListLongMap!21557 0))(
  ( (ListLongMap!21558 (toList!10794 List!31042)) )
))
(declare-fun contains!8959 (ListLongMap!21557 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5766 (array!90684 array!90682 (_ BitVec 32) (_ BitVec 32) V!54317 V!54317 (_ BitVec 32) Int) ListLongMap!21557)

(assert (=> b!1336329 (= res!886827 (contains!8959 (getCurrentListMap!5766 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1336330 () Bool)

(declare-fun e!761032 () Bool)

(declare-fun e!761031 () Bool)

(declare-fun mapRes!57044 () Bool)

(assert (=> b!1336330 (= e!761032 (and e!761031 mapRes!57044))))

(declare-fun condMapEmpty!57044 () Bool)

(declare-fun mapDefault!57044 () ValueCell!17557)

