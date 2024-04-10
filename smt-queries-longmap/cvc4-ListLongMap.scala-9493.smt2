; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112570 () Bool)

(assert start!112570)

(declare-fun b_free!30965 () Bool)

(declare-fun b_next!30965 () Bool)

(assert (=> start!112570 (= b_free!30965 (not b_next!30965))))

(declare-fun tp!108532 () Bool)

(declare-fun b_and!49873 () Bool)

(assert (=> start!112570 (= tp!108532 b_and!49873)))

(declare-fun res!886221 () Bool)

(declare-fun e!760522 () Bool)

(assert (=> start!112570 (=> (not res!886221) (not e!760522))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112570 (= res!886221 (validMask!0 mask!1998))))

(assert (=> start!112570 e!760522))

(declare-datatypes ((V!54269 0))(
  ( (V!54270 (val!18512 Int)) )
))
(declare-datatypes ((ValueCell!17539 0))(
  ( (ValueCellFull!17539 (v!21149 V!54269)) (EmptyCell!17539) )
))
(declare-datatypes ((array!90610 0))(
  ( (array!90611 (arr!43771 (Array (_ BitVec 32) ValueCell!17539)) (size!44321 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90610)

(declare-fun e!760518 () Bool)

(declare-fun array_inv!33009 (array!90610) Bool)

(assert (=> start!112570 (and (array_inv!33009 _values!1320) e!760518)))

(assert (=> start!112570 true))

(declare-datatypes ((array!90612 0))(
  ( (array!90613 (arr!43772 (Array (_ BitVec 32) (_ BitVec 64))) (size!44322 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90612)

(declare-fun array_inv!33010 (array!90612) Bool)

(assert (=> start!112570 (array_inv!33010 _keys!1590)))

(assert (=> start!112570 tp!108532))

(declare-fun tp_is_empty!36875 () Bool)

(assert (=> start!112570 tp_is_empty!36875))

(declare-fun b!1335321 () Bool)

(declare-fun e!760520 () Bool)

(assert (=> b!1335321 (= e!760520 tp_is_empty!36875)))

(declare-fun b!1335322 () Bool)

(declare-fun e!760519 () Bool)

(assert (=> b!1335322 (= e!760519 tp_is_empty!36875)))

(declare-fun b!1335323 () Bool)

(declare-fun res!886220 () Bool)

(assert (=> b!1335323 (=> (not res!886220) (not e!760522))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1335323 (= res!886220 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44322 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335324 () Bool)

(declare-fun mapRes!56986 () Bool)

(assert (=> b!1335324 (= e!760518 (and e!760519 mapRes!56986))))

(declare-fun condMapEmpty!56986 () Bool)

(declare-fun mapDefault!56986 () ValueCell!17539)

