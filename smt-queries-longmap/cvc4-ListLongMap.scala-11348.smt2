; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131996 () Bool)

(assert start!131996)

(declare-fun b_free!31709 () Bool)

(declare-fun b_next!31709 () Bool)

(assert (=> start!131996 (= b_free!31709 (not b_next!31709))))

(declare-fun tp!111378 () Bool)

(declare-fun b_and!51119 () Bool)

(assert (=> start!131996 (= tp!111378 b_and!51119)))

(declare-fun b!1546457 () Bool)

(declare-fun res!1060252 () Bool)

(declare-fun e!860802 () Bool)

(assert (=> b!1546457 (=> (not res!1060252) (not e!860802))))

(declare-datatypes ((array!103176 0))(
  ( (array!103177 (arr!49790 (Array (_ BitVec 32) (_ BitVec 64))) (size!50340 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103176)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103176 (_ BitVec 32)) Bool)

(assert (=> b!1546457 (= res!1060252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58681 () Bool)

(declare-fun mapRes!58681 () Bool)

(assert (=> mapIsEmpty!58681 mapRes!58681))

(declare-fun b!1546458 () Bool)

(declare-fun res!1060256 () Bool)

(assert (=> b!1546458 (=> (not res!1060256) (not e!860802))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((V!59089 0))(
  ( (V!59090 (val!19070 Int)) )
))
(declare-datatypes ((ValueCell!18082 0))(
  ( (ValueCellFull!18082 (v!21871 V!59089)) (EmptyCell!18082) )
))
(declare-datatypes ((array!103178 0))(
  ( (array!103179 (arr!49791 (Array (_ BitVec 32) ValueCell!18082)) (size!50341 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103178)

(assert (=> b!1546458 (= res!1060256 (and (= (size!50341 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50340 _keys!618) (size!50341 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546459 () Bool)

(declare-datatypes ((tuple2!24522 0))(
  ( (tuple2!24523 (_1!12272 (_ BitVec 64)) (_2!12272 V!59089)) )
))
(declare-datatypes ((List!36029 0))(
  ( (Nil!36026) (Cons!36025 (h!37470 tuple2!24522) (t!50723 List!36029)) )
))
(declare-datatypes ((ListLongMap!22131 0))(
  ( (ListLongMap!22132 (toList!11081 List!36029)) )
))
(declare-fun e!860797 () ListLongMap!22131)

(declare-fun call!69547 () ListLongMap!22131)

(assert (=> b!1546459 (= e!860797 call!69547)))

(declare-fun b!1546460 () Bool)

(declare-fun res!1060254 () Bool)

(declare-fun e!860795 () Bool)

(assert (=> b!1546460 (=> (not res!1060254) (not e!860795))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546460 (= res!1060254 (validKeyInArray!0 (select (arr!49790 _keys!618) from!762)))))

(declare-fun b!1546461 () Bool)

(declare-fun e!860801 () Bool)

(declare-fun e!860794 () Bool)

(assert (=> b!1546461 (= e!860801 (and e!860794 mapRes!58681))))

(declare-fun condMapEmpty!58681 () Bool)

(declare-fun mapDefault!58681 () ValueCell!18082)

