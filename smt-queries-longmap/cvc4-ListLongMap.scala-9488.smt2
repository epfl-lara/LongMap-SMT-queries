; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112540 () Bool)

(assert start!112540)

(declare-fun b_free!30935 () Bool)

(declare-fun b_next!30935 () Bool)

(assert (=> start!112540 (= b_free!30935 (not b_next!30935))))

(declare-fun tp!108442 () Bool)

(declare-fun b_and!49843 () Bool)

(assert (=> start!112540 (= tp!108442 b_and!49843)))

(declare-fun mapIsEmpty!56941 () Bool)

(declare-fun mapRes!56941 () Bool)

(assert (=> mapIsEmpty!56941 mapRes!56941))

(declare-fun res!885972 () Bool)

(declare-fun e!760293 () Bool)

(assert (=> start!112540 (=> (not res!885972) (not e!760293))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112540 (= res!885972 (validMask!0 mask!1998))))

(assert (=> start!112540 e!760293))

(declare-datatypes ((V!54229 0))(
  ( (V!54230 (val!18497 Int)) )
))
(declare-datatypes ((ValueCell!17524 0))(
  ( (ValueCellFull!17524 (v!21134 V!54229)) (EmptyCell!17524) )
))
(declare-datatypes ((array!90552 0))(
  ( (array!90553 (arr!43742 (Array (_ BitVec 32) ValueCell!17524)) (size!44292 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90552)

(declare-fun e!760294 () Bool)

(declare-fun array_inv!32987 (array!90552) Bool)

(assert (=> start!112540 (and (array_inv!32987 _values!1320) e!760294)))

(assert (=> start!112540 true))

(declare-datatypes ((array!90554 0))(
  ( (array!90555 (arr!43743 (Array (_ BitVec 32) (_ BitVec 64))) (size!44293 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90554)

(declare-fun array_inv!32988 (array!90554) Bool)

(assert (=> start!112540 (array_inv!32988 _keys!1590)))

(assert (=> start!112540 tp!108442))

(declare-fun tp_is_empty!36845 () Bool)

(assert (=> start!112540 tp_is_empty!36845))

(declare-fun b!1334934 () Bool)

(declare-fun e!760297 () Bool)

(assert (=> b!1334934 (= e!760294 (and e!760297 mapRes!56941))))

(declare-fun condMapEmpty!56941 () Bool)

(declare-fun mapDefault!56941 () ValueCell!17524)

