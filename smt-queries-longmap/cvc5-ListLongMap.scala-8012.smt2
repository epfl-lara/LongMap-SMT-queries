; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98912 () Bool)

(assert start!98912)

(declare-fun b_free!24517 () Bool)

(declare-fun b_next!24517 () Bool)

(assert (=> start!98912 (= b_free!24517 (not b_next!24517))))

(declare-fun tp!86262 () Bool)

(declare-fun b_and!39883 () Bool)

(assert (=> start!98912 (= tp!86262 b_and!39883)))

(declare-fun b!1158794 () Bool)

(declare-fun res!769304 () Bool)

(declare-fun e!658972 () Bool)

(assert (=> b!1158794 (=> (not res!769304) (not e!658972))))

(declare-datatypes ((array!74935 0))(
  ( (array!74936 (arr!36118 (Array (_ BitVec 32) (_ BitVec 64))) (size!36654 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74935)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43857 0))(
  ( (V!43858 (val!14580 Int)) )
))
(declare-datatypes ((ValueCell!13814 0))(
  ( (ValueCellFull!13814 (v!17217 V!43857)) (EmptyCell!13814) )
))
(declare-datatypes ((array!74937 0))(
  ( (array!74938 (arr!36119 (Array (_ BitVec 32) ValueCell!13814)) (size!36655 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74937)

(assert (=> b!1158794 (= res!769304 (and (= (size!36655 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36654 _keys!1208) (size!36655 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!55743 () Bool)

(declare-fun call!55748 () Bool)

(declare-fun call!55747 () Bool)

(assert (=> bm!55743 (= call!55748 call!55747)))

(declare-fun b!1158795 () Bool)

(declare-fun e!658978 () Bool)

(assert (=> b!1158795 (= e!658972 e!658978)))

(declare-fun res!769302 () Bool)

(assert (=> b!1158795 (=> (not res!769302) (not e!658978))))

(declare-fun lt!520803 () array!74935)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74935 (_ BitVec 32)) Bool)

(assert (=> b!1158795 (= res!769302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520803 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158795 (= lt!520803 (array!74936 (store (arr!36118 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36654 _keys!1208)))))

(declare-fun b!1158796 () Bool)

(declare-fun e!658983 () Bool)

(declare-datatypes ((tuple2!18560 0))(
  ( (tuple2!18561 (_1!9291 (_ BitVec 64)) (_2!9291 V!43857)) )
))
(declare-datatypes ((List!25299 0))(
  ( (Nil!25296) (Cons!25295 (h!26504 tuple2!18560) (t!36808 List!25299)) )
))
(declare-datatypes ((ListLongMap!16529 0))(
  ( (ListLongMap!16530 (toList!8280 List!25299)) )
))
(declare-fun call!55753 () ListLongMap!16529)

(declare-fun call!55750 () ListLongMap!16529)

(assert (=> b!1158796 (= e!658983 (= call!55753 call!55750))))

(declare-fun b!1158797 () Bool)

(declare-datatypes ((Unit!38185 0))(
  ( (Unit!38186) )
))
(declare-fun e!658974 () Unit!38185)

(declare-fun lt!520798 () Unit!38185)

(assert (=> b!1158797 (= e!658974 lt!520798)))

(declare-fun call!55749 () Unit!38185)

(assert (=> b!1158797 (= lt!520798 call!55749)))

(assert (=> b!1158797 call!55748))

(declare-fun b!1158798 () Bool)

(declare-fun e!658982 () Bool)

(declare-fun e!658969 () Bool)

(declare-fun mapRes!45395 () Bool)

(assert (=> b!1158798 (= e!658982 (and e!658969 mapRes!45395))))

(declare-fun condMapEmpty!45395 () Bool)

(declare-fun mapDefault!45395 () ValueCell!13814)

