; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112182 () Bool)

(assert start!112182)

(declare-fun b_free!30577 () Bool)

(declare-fun b_next!30577 () Bool)

(assert (=> start!112182 (= b_free!30577 (not b_next!30577))))

(declare-fun tp!107367 () Bool)

(declare-fun b_and!49227 () Bool)

(assert (=> start!112182 (= tp!107367 b_and!49227)))

(declare-fun b!1328616 () Bool)

(declare-fun res!881522 () Bool)

(declare-fun e!757531 () Bool)

(assert (=> b!1328616 (=> (not res!881522) (not e!757531))))

(declare-datatypes ((array!89868 0))(
  ( (array!89869 (arr!43400 (Array (_ BitVec 32) (_ BitVec 64))) (size!43950 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89868)

(declare-datatypes ((List!30735 0))(
  ( (Nil!30732) (Cons!30731 (h!31940 (_ BitVec 64)) (t!44741 List!30735)) )
))
(declare-fun arrayNoDuplicates!0 (array!89868 (_ BitVec 32) List!30735) Bool)

(assert (=> b!1328616 (= res!881522 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30732))))

(declare-fun res!881520 () Bool)

(assert (=> start!112182 (=> (not res!881520) (not e!757531))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112182 (= res!881520 (validMask!0 mask!1998))))

(assert (=> start!112182 e!757531))

(declare-datatypes ((V!53753 0))(
  ( (V!53754 (val!18318 Int)) )
))
(declare-datatypes ((ValueCell!17345 0))(
  ( (ValueCellFull!17345 (v!20955 V!53753)) (EmptyCell!17345) )
))
(declare-datatypes ((array!89870 0))(
  ( (array!89871 (arr!43401 (Array (_ BitVec 32) ValueCell!17345)) (size!43951 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89870)

(declare-fun e!757528 () Bool)

(declare-fun array_inv!32745 (array!89870) Bool)

(assert (=> start!112182 (and (array_inv!32745 _values!1320) e!757528)))

(assert (=> start!112182 true))

(declare-fun array_inv!32746 (array!89868) Bool)

(assert (=> start!112182 (array_inv!32746 _keys!1590)))

(assert (=> start!112182 tp!107367))

(declare-fun tp_is_empty!36487 () Bool)

(assert (=> start!112182 tp_is_empty!36487))

(declare-fun b!1328617 () Bool)

(declare-fun res!881519 () Bool)

(assert (=> b!1328617 (=> (not res!881519) (not e!757531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89868 (_ BitVec 32)) Bool)

(assert (=> b!1328617 (= res!881519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328618 () Bool)

(declare-fun e!757529 () Bool)

(declare-fun mapRes!56404 () Bool)

(assert (=> b!1328618 (= e!757528 (and e!757529 mapRes!56404))))

(declare-fun condMapEmpty!56404 () Bool)

(declare-fun mapDefault!56404 () ValueCell!17345)

