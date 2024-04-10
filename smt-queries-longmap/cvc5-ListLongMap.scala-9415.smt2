; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112098 () Bool)

(assert start!112098)

(declare-fun res!881021 () Bool)

(declare-fun e!756897 () Bool)

(assert (=> start!112098 (=> (not res!881021) (not e!756897))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112098 (= res!881021 (validMask!0 mask!1998))))

(assert (=> start!112098 e!756897))

(assert (=> start!112098 true))

(declare-datatypes ((V!53641 0))(
  ( (V!53642 (val!18276 Int)) )
))
(declare-datatypes ((ValueCell!17303 0))(
  ( (ValueCellFull!17303 (v!20913 V!53641)) (EmptyCell!17303) )
))
(declare-datatypes ((array!89714 0))(
  ( (array!89715 (arr!43323 (Array (_ BitVec 32) ValueCell!17303)) (size!43873 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89714)

(declare-fun e!756899 () Bool)

(declare-fun array_inv!32699 (array!89714) Bool)

(assert (=> start!112098 (and (array_inv!32699 _values!1320) e!756899)))

(declare-datatypes ((array!89716 0))(
  ( (array!89717 (arr!43324 (Array (_ BitVec 32) (_ BitVec 64))) (size!43874 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89716)

(declare-fun array_inv!32700 (array!89716) Bool)

(assert (=> start!112098 (array_inv!32700 _keys!1590)))

(declare-fun mapIsEmpty!56278 () Bool)

(declare-fun mapRes!56278 () Bool)

(assert (=> mapIsEmpty!56278 mapRes!56278))

(declare-fun b!1327739 () Bool)

(assert (=> b!1327739 (= e!756897 false)))

(declare-fun lt!590746 () Bool)

(declare-datatypes ((List!30697 0))(
  ( (Nil!30694) (Cons!30693 (h!31902 (_ BitVec 64)) (t!44703 List!30697)) )
))
(declare-fun arrayNoDuplicates!0 (array!89716 (_ BitVec 32) List!30697) Bool)

(assert (=> b!1327739 (= lt!590746 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30694))))

(declare-fun b!1327740 () Bool)

(declare-fun e!756898 () Bool)

(declare-fun tp_is_empty!36403 () Bool)

(assert (=> b!1327740 (= e!756898 tp_is_empty!36403)))

(declare-fun mapNonEmpty!56278 () Bool)

(declare-fun tp!107185 () Bool)

(declare-fun e!756901 () Bool)

(assert (=> mapNonEmpty!56278 (= mapRes!56278 (and tp!107185 e!756901))))

(declare-fun mapRest!56278 () (Array (_ BitVec 32) ValueCell!17303))

(declare-fun mapKey!56278 () (_ BitVec 32))

(declare-fun mapValue!56278 () ValueCell!17303)

(assert (=> mapNonEmpty!56278 (= (arr!43323 _values!1320) (store mapRest!56278 mapKey!56278 mapValue!56278))))

(declare-fun b!1327741 () Bool)

(assert (=> b!1327741 (= e!756899 (and e!756898 mapRes!56278))))

(declare-fun condMapEmpty!56278 () Bool)

(declare-fun mapDefault!56278 () ValueCell!17303)

