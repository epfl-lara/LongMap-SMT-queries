; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111880 () Bool)

(assert start!111880)

(declare-fun b_free!30479 () Bool)

(declare-fun b_next!30479 () Bool)

(assert (=> start!111880 (= b_free!30479 (not b_next!30479))))

(declare-fun tp!106917 () Bool)

(declare-fun b_and!49053 () Bool)

(assert (=> start!111880 (= tp!106917 b_and!49053)))

(declare-fun b!1325663 () Bool)

(declare-fun res!879828 () Bool)

(declare-fun e!755692 () Bool)

(assert (=> b!1325663 (=> (not res!879828) (not e!755692))))

(declare-datatypes ((array!89506 0))(
  ( (array!89507 (arr!43226 (Array (_ BitVec 32) (_ BitVec 64))) (size!43776 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89506)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1325663 (= res!879828 (not (= (select (arr!43226 _keys!1609) from!2000) k!1164)))))

(declare-fun mapIsEmpty!56100 () Bool)

(declare-fun mapRes!56100 () Bool)

(assert (=> mapIsEmpty!56100 mapRes!56100))

(declare-fun mapNonEmpty!56100 () Bool)

(declare-fun tp!106916 () Bool)

(declare-fun e!755691 () Bool)

(assert (=> mapNonEmpty!56100 (= mapRes!56100 (and tp!106916 e!755691))))

(declare-datatypes ((V!53501 0))(
  ( (V!53502 (val!18224 Int)) )
))
(declare-datatypes ((ValueCell!17251 0))(
  ( (ValueCellFull!17251 (v!20857 V!53501)) (EmptyCell!17251) )
))
(declare-datatypes ((array!89508 0))(
  ( (array!89509 (arr!43227 (Array (_ BitVec 32) ValueCell!17251)) (size!43777 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89508)

(declare-fun mapRest!56100 () (Array (_ BitVec 32) ValueCell!17251))

(declare-fun mapValue!56100 () ValueCell!17251)

(declare-fun mapKey!56100 () (_ BitVec 32))

(assert (=> mapNonEmpty!56100 (= (arr!43227 _values!1337) (store mapRest!56100 mapKey!56100 mapValue!56100))))

(declare-fun res!879827 () Bool)

(assert (=> start!111880 (=> (not res!879827) (not e!755692))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111880 (= res!879827 (validMask!0 mask!2019))))

(assert (=> start!111880 e!755692))

(declare-fun array_inv!32627 (array!89506) Bool)

(assert (=> start!111880 (array_inv!32627 _keys!1609)))

(assert (=> start!111880 true))

(declare-fun tp_is_empty!36299 () Bool)

(assert (=> start!111880 tp_is_empty!36299))

(declare-fun e!755689 () Bool)

(declare-fun array_inv!32628 (array!89508) Bool)

(assert (=> start!111880 (and (array_inv!32628 _values!1337) e!755689)))

(assert (=> start!111880 tp!106917))

(declare-fun b!1325664 () Bool)

(declare-fun e!755688 () Bool)

(assert (=> b!1325664 (= e!755689 (and e!755688 mapRes!56100))))

(declare-fun condMapEmpty!56100 () Bool)

(declare-fun mapDefault!56100 () ValueCell!17251)

