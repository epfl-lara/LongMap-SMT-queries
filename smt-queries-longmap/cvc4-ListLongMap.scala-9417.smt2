; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112114 () Bool)

(assert start!112114)

(declare-fun b!1327884 () Bool)

(declare-fun e!757020 () Bool)

(declare-fun tp_is_empty!36419 () Bool)

(assert (=> b!1327884 (= e!757020 tp_is_empty!36419)))

(declare-fun mapNonEmpty!56302 () Bool)

(declare-fun mapRes!56302 () Bool)

(declare-fun tp!107209 () Bool)

(assert (=> mapNonEmpty!56302 (= mapRes!56302 (and tp!107209 e!757020))))

(declare-datatypes ((V!53661 0))(
  ( (V!53662 (val!18284 Int)) )
))
(declare-datatypes ((ValueCell!17311 0))(
  ( (ValueCellFull!17311 (v!20921 V!53661)) (EmptyCell!17311) )
))
(declare-datatypes ((array!89740 0))(
  ( (array!89741 (arr!43336 (Array (_ BitVec 32) ValueCell!17311)) (size!43886 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89740)

(declare-fun mapRest!56302 () (Array (_ BitVec 32) ValueCell!17311))

(declare-fun mapKey!56302 () (_ BitVec 32))

(declare-fun mapValue!56302 () ValueCell!17311)

(assert (=> mapNonEmpty!56302 (= (arr!43336 _values!1320) (store mapRest!56302 mapKey!56302 mapValue!56302))))

(declare-fun b!1327885 () Bool)

(declare-fun e!757019 () Bool)

(declare-fun e!757017 () Bool)

(assert (=> b!1327885 (= e!757019 (and e!757017 mapRes!56302))))

(declare-fun condMapEmpty!56302 () Bool)

(declare-fun mapDefault!56302 () ValueCell!17311)

