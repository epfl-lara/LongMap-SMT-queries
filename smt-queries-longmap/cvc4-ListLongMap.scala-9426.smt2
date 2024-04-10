; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112168 () Bool)

(assert start!112168)

(declare-fun b_free!30563 () Bool)

(declare-fun b_next!30563 () Bool)

(assert (=> start!112168 (= b_free!30563 (not b_next!30563))))

(declare-fun tp!107326 () Bool)

(declare-fun b_and!49213 () Bool)

(assert (=> start!112168 (= tp!107326 b_and!49213)))

(declare-fun b!1328448 () Bool)

(declare-fun e!757422 () Bool)

(declare-fun tp_is_empty!36473 () Bool)

(assert (=> b!1328448 (= e!757422 tp_is_empty!36473)))

(declare-fun b!1328449 () Bool)

(declare-fun res!881416 () Bool)

(declare-fun e!757423 () Bool)

(assert (=> b!1328449 (=> (not res!881416) (not e!757423))))

(declare-datatypes ((array!89840 0))(
  ( (array!89841 (arr!43386 (Array (_ BitVec 32) (_ BitVec 64))) (size!43936 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89840)

(declare-datatypes ((List!30726 0))(
  ( (Nil!30723) (Cons!30722 (h!31931 (_ BitVec 64)) (t!44732 List!30726)) )
))
(declare-fun arrayNoDuplicates!0 (array!89840 (_ BitVec 32) List!30726) Bool)

(assert (=> b!1328449 (= res!881416 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30723))))

(declare-fun b!1328450 () Bool)

(declare-fun e!757426 () Bool)

(assert (=> b!1328450 (= e!757426 tp_is_empty!36473)))

(declare-fun mapIsEmpty!56383 () Bool)

(declare-fun mapRes!56383 () Bool)

(assert (=> mapIsEmpty!56383 mapRes!56383))

(declare-fun b!1328451 () Bool)

(declare-fun res!881415 () Bool)

(assert (=> b!1328451 (=> (not res!881415) (not e!757423))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1328451 (= res!881415 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43936 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56383 () Bool)

(declare-fun tp!107325 () Bool)

(assert (=> mapNonEmpty!56383 (= mapRes!56383 (and tp!107325 e!757422))))

(declare-datatypes ((V!53733 0))(
  ( (V!53734 (val!18311 Int)) )
))
(declare-datatypes ((ValueCell!17338 0))(
  ( (ValueCellFull!17338 (v!20948 V!53733)) (EmptyCell!17338) )
))
(declare-datatypes ((array!89842 0))(
  ( (array!89843 (arr!43387 (Array (_ BitVec 32) ValueCell!17338)) (size!43937 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89842)

(declare-fun mapRest!56383 () (Array (_ BitVec 32) ValueCell!17338))

(declare-fun mapKey!56383 () (_ BitVec 32))

(declare-fun mapValue!56383 () ValueCell!17338)

(assert (=> mapNonEmpty!56383 (= (arr!43387 _values!1320) (store mapRest!56383 mapKey!56383 mapValue!56383))))

(declare-fun res!881418 () Bool)

(assert (=> start!112168 (=> (not res!881418) (not e!757423))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112168 (= res!881418 (validMask!0 mask!1998))))

(assert (=> start!112168 e!757423))

(declare-fun e!757424 () Bool)

(declare-fun array_inv!32735 (array!89842) Bool)

(assert (=> start!112168 (and (array_inv!32735 _values!1320) e!757424)))

(assert (=> start!112168 true))

(declare-fun array_inv!32736 (array!89840) Bool)

(assert (=> start!112168 (array_inv!32736 _keys!1590)))

(assert (=> start!112168 tp!107326))

(assert (=> start!112168 tp_is_empty!36473))

(declare-fun b!1328452 () Bool)

(assert (=> b!1328452 (= e!757424 (and e!757426 mapRes!56383))))

(declare-fun condMapEmpty!56383 () Bool)

(declare-fun mapDefault!56383 () ValueCell!17338)

