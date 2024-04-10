; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112016 () Bool)

(assert start!112016)

(declare-fun mapNonEmpty!56206 () Bool)

(declare-fun mapRes!56206 () Bool)

(declare-fun tp!107113 () Bool)

(declare-fun e!756518 () Bool)

(assert (=> mapNonEmpty!56206 (= mapRes!56206 (and tp!107113 e!756518))))

(declare-datatypes ((V!53589 0))(
  ( (V!53590 (val!18257 Int)) )
))
(declare-datatypes ((ValueCell!17284 0))(
  ( (ValueCellFull!17284 (v!20893 V!53589)) (EmptyCell!17284) )
))
(declare-datatypes ((array!89640 0))(
  ( (array!89641 (arr!43291 (Array (_ BitVec 32) ValueCell!17284)) (size!43841 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89640)

(declare-fun mapKey!56206 () (_ BitVec 32))

(declare-fun mapRest!56206 () (Array (_ BitVec 32) ValueCell!17284))

(declare-fun mapValue!56206 () ValueCell!17284)

(assert (=> mapNonEmpty!56206 (= (arr!43291 _values!1320) (store mapRest!56206 mapKey!56206 mapValue!56206))))

(declare-fun mapIsEmpty!56206 () Bool)

(assert (=> mapIsEmpty!56206 mapRes!56206))

(declare-fun b!1327274 () Bool)

(declare-fun tp_is_empty!36365 () Bool)

(assert (=> b!1327274 (= e!756518 tp_is_empty!36365)))

(declare-fun b!1327275 () Bool)

(declare-fun e!756520 () Bool)

(declare-fun e!756519 () Bool)

(assert (=> b!1327275 (= e!756520 (and e!756519 mapRes!56206))))

(declare-fun condMapEmpty!56206 () Bool)

(declare-fun mapDefault!56206 () ValueCell!17284)

