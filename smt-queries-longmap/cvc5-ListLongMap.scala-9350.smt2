; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111536 () Bool)

(assert start!111536)

(declare-fun b_free!30193 () Bool)

(declare-fun b_next!30193 () Bool)

(assert (=> start!111536 (= b_free!30193 (not b_next!30193))))

(declare-fun tp!106054 () Bool)

(declare-fun b_and!48545 () Bool)

(assert (=> start!111536 (= tp!106054 b_and!48545)))

(declare-fun b!1320595 () Bool)

(declare-fun res!876498 () Bool)

(declare-fun e!753286 () Bool)

(assert (=> b!1320595 (=> (not res!876498) (not e!753286))))

(declare-datatypes ((array!88956 0))(
  ( (array!88957 (arr!42952 (Array (_ BitVec 32) (_ BitVec 64))) (size!43502 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88956)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1320595 (= res!876498 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43502 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320596 () Bool)

(declare-fun res!876495 () Bool)

(assert (=> b!1320596 (=> (not res!876495) (not e!753286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320596 (= res!876495 (validKeyInArray!0 (select (arr!42952 _keys!1609) from!2000)))))

(declare-fun b!1320597 () Bool)

(declare-fun e!753287 () Bool)

(declare-fun tp_is_empty!36013 () Bool)

(assert (=> b!1320597 (= e!753287 tp_is_empty!36013)))

(declare-fun b!1320599 () Bool)

(declare-fun res!876499 () Bool)

(assert (=> b!1320599 (=> (not res!876499) (not e!753286))))

(declare-datatypes ((List!30433 0))(
  ( (Nil!30430) (Cons!30429 (h!31638 (_ BitVec 64)) (t!44175 List!30433)) )
))
(declare-fun arrayNoDuplicates!0 (array!88956 (_ BitVec 32) List!30433) Bool)

(assert (=> b!1320599 (= res!876499 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30430))))

(declare-fun b!1320600 () Bool)

(declare-fun res!876493 () Bool)

(assert (=> b!1320600 (=> (not res!876493) (not e!753286))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88956 (_ BitVec 32)) Bool)

(assert (=> b!1320600 (= res!876493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55667 () Bool)

(declare-fun mapRes!55667 () Bool)

(declare-fun tp!106055 () Bool)

(declare-fun e!753288 () Bool)

(assert (=> mapNonEmpty!55667 (= mapRes!55667 (and tp!106055 e!753288))))

(declare-datatypes ((V!53121 0))(
  ( (V!53122 (val!18081 Int)) )
))
(declare-datatypes ((ValueCell!17108 0))(
  ( (ValueCellFull!17108 (v!20711 V!53121)) (EmptyCell!17108) )
))
(declare-fun mapRest!55667 () (Array (_ BitVec 32) ValueCell!17108))

(declare-datatypes ((array!88958 0))(
  ( (array!88959 (arr!42953 (Array (_ BitVec 32) ValueCell!17108)) (size!43503 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88958)

(declare-fun mapKey!55667 () (_ BitVec 32))

(declare-fun mapValue!55667 () ValueCell!17108)

(assert (=> mapNonEmpty!55667 (= (arr!42953 _values!1337) (store mapRest!55667 mapKey!55667 mapValue!55667))))

(declare-fun mapIsEmpty!55667 () Bool)

(assert (=> mapIsEmpty!55667 mapRes!55667))

(declare-fun b!1320601 () Bool)

(declare-fun res!876496 () Bool)

(assert (=> b!1320601 (=> (not res!876496) (not e!753286))))

(assert (=> b!1320601 (= res!876496 (not (= (select (arr!42952 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1320602 () Bool)

(declare-fun e!753285 () Bool)

(assert (=> b!1320602 (= e!753285 (and e!753287 mapRes!55667))))

(declare-fun condMapEmpty!55667 () Bool)

(declare-fun mapDefault!55667 () ValueCell!17108)

