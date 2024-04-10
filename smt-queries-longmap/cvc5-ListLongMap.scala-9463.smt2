; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112386 () Bool)

(assert start!112386)

(declare-fun b_free!30781 () Bool)

(declare-fun b_next!30781 () Bool)

(assert (=> start!112386 (= b_free!30781 (not b_next!30781))))

(declare-fun tp!107980 () Bool)

(declare-fun b_and!49617 () Bool)

(assert (=> start!112386 (= tp!107980 b_and!49617)))

(declare-fun b!1332401 () Bool)

(declare-fun res!884204 () Bool)

(declare-fun e!759061 () Bool)

(assert (=> b!1332401 (=> (not res!884204) (not e!759061))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90262 0))(
  ( (array!90263 (arr!43597 (Array (_ BitVec 32) (_ BitVec 64))) (size!44147 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90262)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1332401 (= res!884204 (not (= (select (arr!43597 _keys!1590) from!1980) k!1153)))))

(declare-fun res!884207 () Bool)

(assert (=> start!112386 (=> (not res!884207) (not e!759061))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112386 (= res!884207 (validMask!0 mask!1998))))

(assert (=> start!112386 e!759061))

(declare-datatypes ((V!54025 0))(
  ( (V!54026 (val!18420 Int)) )
))
(declare-datatypes ((ValueCell!17447 0))(
  ( (ValueCellFull!17447 (v!21057 V!54025)) (EmptyCell!17447) )
))
(declare-datatypes ((array!90264 0))(
  ( (array!90265 (arr!43598 (Array (_ BitVec 32) ValueCell!17447)) (size!44148 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90264)

(declare-fun e!759059 () Bool)

(declare-fun array_inv!32883 (array!90264) Bool)

(assert (=> start!112386 (and (array_inv!32883 _values!1320) e!759059)))

(assert (=> start!112386 true))

(declare-fun array_inv!32884 (array!90262) Bool)

(assert (=> start!112386 (array_inv!32884 _keys!1590)))

(assert (=> start!112386 tp!107980))

(declare-fun tp_is_empty!36691 () Bool)

(assert (=> start!112386 tp_is_empty!36691))

(declare-fun b!1332402 () Bool)

(declare-fun e!759057 () Bool)

(declare-fun mapRes!56710 () Bool)

(assert (=> b!1332402 (= e!759059 (and e!759057 mapRes!56710))))

(declare-fun condMapEmpty!56710 () Bool)

(declare-fun mapDefault!56710 () ValueCell!17447)

