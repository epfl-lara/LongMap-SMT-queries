; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112140 () Bool)

(assert start!112140)

(declare-fun mapNonEmpty!56341 () Bool)

(declare-fun mapRes!56341 () Bool)

(declare-fun tp!107248 () Bool)

(declare-fun e!757213 () Bool)

(assert (=> mapNonEmpty!56341 (= mapRes!56341 (and tp!107248 e!757213))))

(declare-datatypes ((V!53697 0))(
  ( (V!53698 (val!18297 Int)) )
))
(declare-datatypes ((ValueCell!17324 0))(
  ( (ValueCellFull!17324 (v!20934 V!53697)) (EmptyCell!17324) )
))
(declare-datatypes ((array!89788 0))(
  ( (array!89789 (arr!43360 (Array (_ BitVec 32) ValueCell!17324)) (size!43910 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89788)

(declare-fun mapRest!56341 () (Array (_ BitVec 32) ValueCell!17324))

(declare-fun mapValue!56341 () ValueCell!17324)

(declare-fun mapKey!56341 () (_ BitVec 32))

(assert (=> mapNonEmpty!56341 (= (arr!43360 _values!1320) (store mapRest!56341 mapKey!56341 mapValue!56341))))

(declare-fun res!881211 () Bool)

(declare-fun e!757216 () Bool)

(assert (=> start!112140 (=> (not res!881211) (not e!757216))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112140 (= res!881211 (validMask!0 mask!1998))))

(assert (=> start!112140 e!757216))

(assert (=> start!112140 true))

(declare-fun e!757215 () Bool)

(declare-fun array_inv!32721 (array!89788) Bool)

(assert (=> start!112140 (and (array_inv!32721 _values!1320) e!757215)))

(declare-datatypes ((array!89790 0))(
  ( (array!89791 (arr!43361 (Array (_ BitVec 32) (_ BitVec 64))) (size!43911 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89790)

(declare-fun array_inv!32722 (array!89790) Bool)

(assert (=> start!112140 (array_inv!32722 _keys!1590)))

(declare-fun b!1328119 () Bool)

(declare-fun e!757212 () Bool)

(assert (=> b!1328119 (= e!757215 (and e!757212 mapRes!56341))))

(declare-fun condMapEmpty!56341 () Bool)

(declare-fun mapDefault!56341 () ValueCell!17324)

