; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107228 () Bool)

(assert start!107228)

(declare-fun b!1271075 () Bool)

(declare-fun e!724713 () Bool)

(declare-fun tp_is_empty!32917 () Bool)

(assert (=> b!1271075 (= e!724713 tp_is_empty!32917)))

(declare-fun mapIsEmpty!50956 () Bool)

(declare-fun mapRes!50956 () Bool)

(assert (=> mapIsEmpty!50956 mapRes!50956))

(declare-fun res!845731 () Bool)

(declare-fun e!724712 () Bool)

(assert (=> start!107228 (=> (not res!845731) (not e!724712))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107228 (= res!845731 (validMask!0 mask!1730))))

(assert (=> start!107228 e!724712))

(declare-datatypes ((V!49083 0))(
  ( (V!49084 (val!16533 Int)) )
))
(declare-datatypes ((ValueCell!15605 0))(
  ( (ValueCellFull!15605 (v!19170 V!49083)) (EmptyCell!15605) )
))
(declare-datatypes ((array!83090 0))(
  ( (array!83091 (arr!40082 (Array (_ BitVec 32) ValueCell!15605)) (size!40618 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83090)

(declare-fun e!724711 () Bool)

(declare-fun array_inv!30487 (array!83090) Bool)

(assert (=> start!107228 (and (array_inv!30487 _values!1134) e!724711)))

(assert (=> start!107228 true))

(declare-datatypes ((array!83092 0))(
  ( (array!83093 (arr!40083 (Array (_ BitVec 32) (_ BitVec 64))) (size!40619 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83092)

(declare-fun array_inv!30488 (array!83092) Bool)

(assert (=> start!107228 (array_inv!30488 _keys!1364)))

(declare-fun mapNonEmpty!50956 () Bool)

(declare-fun tp!97297 () Bool)

(assert (=> mapNonEmpty!50956 (= mapRes!50956 (and tp!97297 e!724713))))

(declare-fun mapKey!50956 () (_ BitVec 32))

(declare-fun mapValue!50956 () ValueCell!15605)

(declare-fun mapRest!50956 () (Array (_ BitVec 32) ValueCell!15605))

(assert (=> mapNonEmpty!50956 (= (arr!40082 _values!1134) (store mapRest!50956 mapKey!50956 mapValue!50956))))

(declare-fun b!1271076 () Bool)

(declare-fun e!724710 () Bool)

(assert (=> b!1271076 (= e!724710 tp_is_empty!32917)))

(declare-fun b!1271077 () Bool)

(declare-fun res!845730 () Bool)

(assert (=> b!1271077 (=> (not res!845730) (not e!724712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83092 (_ BitVec 32)) Bool)

(assert (=> b!1271077 (= res!845730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271078 () Bool)

(assert (=> b!1271078 (= e!724711 (and e!724710 mapRes!50956))))

(declare-fun condMapEmpty!50956 () Bool)

(declare-fun mapDefault!50956 () ValueCell!15605)

