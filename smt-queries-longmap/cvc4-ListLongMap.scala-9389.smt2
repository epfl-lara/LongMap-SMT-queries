; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111774 () Bool)

(assert start!111774)

(declare-fun b_free!30431 () Bool)

(declare-fun b_next!30431 () Bool)

(assert (=> start!111774 (= b_free!30431 (not b_next!30431))))

(declare-fun tp!106769 () Bool)

(declare-fun b_and!48969 () Bool)

(assert (=> start!111774 (= tp!106769 b_and!48969)))

(declare-fun b!1324492 () Bool)

(declare-fun res!879139 () Bool)

(declare-fun e!755071 () Bool)

(assert (=> b!1324492 (=> (not res!879139) (not e!755071))))

(declare-datatypes ((array!89416 0))(
  ( (array!89417 (arr!43182 (Array (_ BitVec 32) (_ BitVec 64))) (size!43732 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89416)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324492 (= res!879139 (not (validKeyInArray!0 (select (arr!43182 _keys!1609) from!2000))))))

(declare-fun b!1324493 () Bool)

(declare-fun res!879134 () Bool)

(assert (=> b!1324493 (=> (not res!879134) (not e!755071))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1324493 (= res!879134 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43732 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56024 () Bool)

(declare-fun mapRes!56024 () Bool)

(assert (=> mapIsEmpty!56024 mapRes!56024))

(declare-fun b!1324494 () Bool)

(declare-fun res!879137 () Bool)

(assert (=> b!1324494 (=> (not res!879137) (not e!755071))))

(assert (=> b!1324494 (= res!879137 (not (= (select (arr!43182 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1324495 () Bool)

(declare-fun e!755070 () Bool)

(declare-fun tp_is_empty!36251 () Bool)

(assert (=> b!1324495 (= e!755070 tp_is_empty!36251)))

(declare-fun res!879140 () Bool)

(assert (=> start!111774 (=> (not res!879140) (not e!755071))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111774 (= res!879140 (validMask!0 mask!2019))))

(assert (=> start!111774 e!755071))

(declare-fun array_inv!32597 (array!89416) Bool)

(assert (=> start!111774 (array_inv!32597 _keys!1609)))

(assert (=> start!111774 true))

(assert (=> start!111774 tp_is_empty!36251))

(declare-datatypes ((V!53437 0))(
  ( (V!53438 (val!18200 Int)) )
))
(declare-datatypes ((ValueCell!17227 0))(
  ( (ValueCellFull!17227 (v!20830 V!53437)) (EmptyCell!17227) )
))
(declare-datatypes ((array!89418 0))(
  ( (array!89419 (arr!43183 (Array (_ BitVec 32) ValueCell!17227)) (size!43733 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89418)

(declare-fun e!755072 () Bool)

(declare-fun array_inv!32598 (array!89418) Bool)

(assert (=> start!111774 (and (array_inv!32598 _values!1337) e!755072)))

(assert (=> start!111774 tp!106769))

(declare-fun b!1324496 () Bool)

(declare-fun res!879135 () Bool)

(assert (=> b!1324496 (=> (not res!879135) (not e!755071))))

(declare-fun zeroValue!1279 () V!53437)

(declare-fun minValue!1279 () V!53437)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23468 0))(
  ( (tuple2!23469 (_1!11745 (_ BitVec 64)) (_2!11745 V!53437)) )
))
(declare-datatypes ((List!30610 0))(
  ( (Nil!30607) (Cons!30606 (h!31815 tuple2!23468) (t!44536 List!30610)) )
))
(declare-datatypes ((ListLongMap!21125 0))(
  ( (ListLongMap!21126 (toList!10578 List!30610)) )
))
(declare-fun contains!8733 (ListLongMap!21125 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5574 (array!89416 array!89418 (_ BitVec 32) (_ BitVec 32) V!53437 V!53437 (_ BitVec 32) Int) ListLongMap!21125)

(assert (=> b!1324496 (= res!879135 (contains!8733 (getCurrentListMap!5574 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1324497 () Bool)

(declare-fun res!879133 () Bool)

(assert (=> b!1324497 (=> (not res!879133) (not e!755071))))

(declare-datatypes ((List!30611 0))(
  ( (Nil!30608) (Cons!30607 (h!31816 (_ BitVec 64)) (t!44537 List!30611)) )
))
(declare-fun arrayNoDuplicates!0 (array!89416 (_ BitVec 32) List!30611) Bool)

(assert (=> b!1324497 (= res!879133 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30608))))

(declare-fun b!1324498 () Bool)

(declare-fun res!879136 () Bool)

(assert (=> b!1324498 (=> (not res!879136) (not e!755071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89416 (_ BitVec 32)) Bool)

(assert (=> b!1324498 (= res!879136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324499 () Bool)

(declare-fun e!755073 () Bool)

(assert (=> b!1324499 (= e!755073 tp_is_empty!36251)))

(declare-fun b!1324500 () Bool)

(assert (=> b!1324500 (= e!755072 (and e!755073 mapRes!56024))))

(declare-fun condMapEmpty!56024 () Bool)

(declare-fun mapDefault!56024 () ValueCell!17227)

