; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112308 () Bool)

(assert start!112308)

(declare-fun b_free!30703 () Bool)

(declare-fun b_next!30703 () Bool)

(assert (=> start!112308 (= b_free!30703 (not b_next!30703))))

(declare-fun tp!107746 () Bool)

(declare-fun b_and!49461 () Bool)

(assert (=> start!112308 (= tp!107746 b_and!49461)))

(declare-fun b!1330919 () Bool)

(declare-fun e!758474 () Bool)

(declare-fun tp_is_empty!36613 () Bool)

(assert (=> b!1330919 (= e!758474 tp_is_empty!36613)))

(declare-fun b!1330921 () Bool)

(declare-fun res!883155 () Bool)

(declare-fun e!758473 () Bool)

(assert (=> b!1330921 (=> (not res!883155) (not e!758473))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90110 0))(
  ( (array!90111 (arr!43521 (Array (_ BitVec 32) (_ BitVec 64))) (size!44071 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90110)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1330921 (= res!883155 (not (= (select (arr!43521 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1330922 () Bool)

(declare-fun res!883152 () Bool)

(assert (=> b!1330922 (=> (not res!883152) (not e!758473))))

(declare-datatypes ((V!53921 0))(
  ( (V!53922 (val!18381 Int)) )
))
(declare-datatypes ((ValueCell!17408 0))(
  ( (ValueCellFull!17408 (v!21018 V!53921)) (EmptyCell!17408) )
))
(declare-datatypes ((array!90112 0))(
  ( (array!90113 (arr!43522 (Array (_ BitVec 32) ValueCell!17408)) (size!44072 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90112)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53921)

(declare-fun zeroValue!1262 () V!53921)

(declare-datatypes ((tuple2!23674 0))(
  ( (tuple2!23675 (_1!11848 (_ BitVec 64)) (_2!11848 V!53921)) )
))
(declare-datatypes ((List!30824 0))(
  ( (Nil!30821) (Cons!30820 (h!32029 tuple2!23674) (t!44940 List!30824)) )
))
(declare-datatypes ((ListLongMap!21331 0))(
  ( (ListLongMap!21332 (toList!10681 List!30824)) )
))
(declare-fun contains!8845 (ListLongMap!21331 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5667 (array!90110 array!90112 (_ BitVec 32) (_ BitVec 32) V!53921 V!53921 (_ BitVec 32) Int) ListLongMap!21331)

(assert (=> b!1330922 (= res!883152 (contains!8845 (getCurrentListMap!5667 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1330923 () Bool)

(declare-fun res!883147 () Bool)

(assert (=> b!1330923 (=> (not res!883147) (not e!758473))))

(assert (=> b!1330923 (= res!883147 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330924 () Bool)

(declare-fun e!758475 () Bool)

(declare-fun e!758472 () Bool)

(declare-fun mapRes!56593 () Bool)

(assert (=> b!1330924 (= e!758475 (and e!758472 mapRes!56593))))

(declare-fun condMapEmpty!56593 () Bool)

(declare-fun mapDefault!56593 () ValueCell!17408)

