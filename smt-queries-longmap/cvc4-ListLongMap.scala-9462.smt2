; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112384 () Bool)

(assert start!112384)

(declare-fun b_free!30779 () Bool)

(declare-fun b_next!30779 () Bool)

(assert (=> start!112384 (= b_free!30779 (not b_next!30779))))

(declare-fun tp!107974 () Bool)

(declare-fun b_and!49613 () Bool)

(assert (=> start!112384 (= tp!107974 b_and!49613)))

(declare-fun b!1332363 () Bool)

(declare-fun res!884175 () Bool)

(declare-fun e!759045 () Bool)

(assert (=> b!1332363 (=> (not res!884175) (not e!759045))))

(declare-datatypes ((V!54021 0))(
  ( (V!54022 (val!18419 Int)) )
))
(declare-datatypes ((ValueCell!17446 0))(
  ( (ValueCellFull!17446 (v!21056 V!54021)) (EmptyCell!17446) )
))
(declare-datatypes ((array!90258 0))(
  ( (array!90259 (arr!43595 (Array (_ BitVec 32) ValueCell!17446)) (size!44145 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90258)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90260 0))(
  ( (array!90261 (arr!43596 (Array (_ BitVec 32) (_ BitVec 64))) (size!44146 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90260)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1332363 (= res!884175 (and (= (size!44145 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44146 _keys!1590) (size!44145 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332364 () Bool)

(declare-fun res!884178 () Bool)

(assert (=> b!1332364 (=> (not res!884178) (not e!759045))))

(declare-datatypes ((List!30882 0))(
  ( (Nil!30879) (Cons!30878 (h!32087 (_ BitVec 64)) (t!45074 List!30882)) )
))
(declare-fun arrayNoDuplicates!0 (array!90260 (_ BitVec 32) List!30882) Bool)

(assert (=> b!1332364 (= res!884178 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30879))))

(declare-fun b!1332365 () Bool)

(declare-fun res!884181 () Bool)

(assert (=> b!1332365 (=> (not res!884181) (not e!759045))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332365 (= res!884181 (validKeyInArray!0 (select (arr!43596 _keys!1590) from!1980)))))

(declare-fun b!1332366 () Bool)

(declare-fun e!759043 () Bool)

(declare-fun e!759046 () Bool)

(declare-fun mapRes!56707 () Bool)

(assert (=> b!1332366 (= e!759043 (and e!759046 mapRes!56707))))

(declare-fun condMapEmpty!56707 () Bool)

(declare-fun mapDefault!56707 () ValueCell!17446)

