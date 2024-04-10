; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112018 () Bool)

(assert start!112018)

(declare-fun mapIsEmpty!56209 () Bool)

(declare-fun mapRes!56209 () Bool)

(assert (=> mapIsEmpty!56209 mapRes!56209))

(declare-fun b!1327285 () Bool)

(declare-fun e!756534 () Bool)

(declare-fun tp_is_empty!36367 () Bool)

(assert (=> b!1327285 (= e!756534 tp_is_empty!36367)))

(declare-fun b!1327286 () Bool)

(declare-fun e!756535 () Bool)

(assert (=> b!1327286 (= e!756535 tp_is_empty!36367)))

(declare-fun res!880792 () Bool)

(declare-fun e!756532 () Bool)

(assert (=> start!112018 (=> (not res!880792) (not e!756532))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112018 (= res!880792 (validMask!0 mask!1998))))

(assert (=> start!112018 e!756532))

(assert (=> start!112018 true))

(declare-datatypes ((V!53593 0))(
  ( (V!53594 (val!18258 Int)) )
))
(declare-datatypes ((ValueCell!17285 0))(
  ( (ValueCellFull!17285 (v!20894 V!53593)) (EmptyCell!17285) )
))
(declare-datatypes ((array!89642 0))(
  ( (array!89643 (arr!43292 (Array (_ BitVec 32) ValueCell!17285)) (size!43842 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89642)

(declare-fun e!756536 () Bool)

(declare-fun array_inv!32677 (array!89642) Bool)

(assert (=> start!112018 (and (array_inv!32677 _values!1320) e!756536)))

(declare-datatypes ((array!89644 0))(
  ( (array!89645 (arr!43293 (Array (_ BitVec 32) (_ BitVec 64))) (size!43843 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89644)

(declare-fun array_inv!32678 (array!89644) Bool)

(assert (=> start!112018 (array_inv!32678 _keys!1590)))

(declare-fun mapNonEmpty!56209 () Bool)

(declare-fun tp!107116 () Bool)

(assert (=> mapNonEmpty!56209 (= mapRes!56209 (and tp!107116 e!756534))))

(declare-fun mapKey!56209 () (_ BitVec 32))

(declare-fun mapValue!56209 () ValueCell!17285)

(declare-fun mapRest!56209 () (Array (_ BitVec 32) ValueCell!17285))

(assert (=> mapNonEmpty!56209 (= (arr!43292 _values!1320) (store mapRest!56209 mapKey!56209 mapValue!56209))))

(declare-fun b!1327287 () Bool)

(assert (=> b!1327287 (= e!756536 (and e!756535 mapRes!56209))))

(declare-fun condMapEmpty!56209 () Bool)

(declare-fun mapDefault!56209 () ValueCell!17285)

