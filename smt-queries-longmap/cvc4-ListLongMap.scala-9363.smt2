; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111618 () Bool)

(assert start!111618)

(declare-fun b_free!30275 () Bool)

(declare-fun b_next!30275 () Bool)

(assert (=> start!111618 (= b_free!30275 (not b_next!30275))))

(declare-fun tp!106300 () Bool)

(declare-fun b_and!48709 () Bool)

(assert (=> start!111618 (= tp!106300 b_and!48709)))

(declare-fun mapNonEmpty!55790 () Bool)

(declare-fun mapRes!55790 () Bool)

(declare-fun tp!106301 () Bool)

(declare-fun e!753901 () Bool)

(assert (=> mapNonEmpty!55790 (= mapRes!55790 (and tp!106301 e!753901))))

(declare-fun mapKey!55790 () (_ BitVec 32))

(declare-datatypes ((V!53229 0))(
  ( (V!53230 (val!18122 Int)) )
))
(declare-datatypes ((ValueCell!17149 0))(
  ( (ValueCellFull!17149 (v!20752 V!53229)) (EmptyCell!17149) )
))
(declare-fun mapValue!55790 () ValueCell!17149)

(declare-fun mapRest!55790 () (Array (_ BitVec 32) ValueCell!17149))

(declare-datatypes ((array!89112 0))(
  ( (array!89113 (arr!43030 (Array (_ BitVec 32) ValueCell!17149)) (size!43580 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89112)

(assert (=> mapNonEmpty!55790 (= (arr!43030 _values!1337) (store mapRest!55790 mapKey!55790 mapValue!55790))))

(declare-fun b!1322030 () Bool)

(declare-fun res!877481 () Bool)

(declare-fun e!753904 () Bool)

(assert (=> b!1322030 (=> (not res!877481) (not e!753904))))

(declare-datatypes ((array!89114 0))(
  ( (array!89115 (arr!43031 (Array (_ BitVec 32) (_ BitVec 64))) (size!43581 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89114)

(declare-datatypes ((List!30490 0))(
  ( (Nil!30487) (Cons!30486 (h!31695 (_ BitVec 64)) (t!44314 List!30490)) )
))
(declare-fun arrayNoDuplicates!0 (array!89114 (_ BitVec 32) List!30490) Bool)

(assert (=> b!1322030 (= res!877481 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30487))))

(declare-fun mapIsEmpty!55790 () Bool)

(assert (=> mapIsEmpty!55790 mapRes!55790))

(declare-fun b!1322031 () Bool)

(declare-fun res!877483 () Bool)

(assert (=> b!1322031 (=> (not res!877483) (not e!753904))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53229)

(declare-fun minValue!1279 () V!53229)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23342 0))(
  ( (tuple2!23343 (_1!11682 (_ BitVec 64)) (_2!11682 V!53229)) )
))
(declare-datatypes ((List!30491 0))(
  ( (Nil!30488) (Cons!30487 (h!31696 tuple2!23342) (t!44315 List!30491)) )
))
(declare-datatypes ((ListLongMap!20999 0))(
  ( (ListLongMap!21000 (toList!10515 List!30491)) )
))
(declare-fun contains!8670 (ListLongMap!20999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5516 (array!89114 array!89112 (_ BitVec 32) (_ BitVec 32) V!53229 V!53229 (_ BitVec 32) Int) ListLongMap!20999)

(assert (=> b!1322031 (= res!877483 (contains!8670 (getCurrentListMap!5516 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1322032 () Bool)

(declare-fun e!753903 () Bool)

(declare-fun e!753900 () Bool)

(assert (=> b!1322032 (= e!753903 (and e!753900 mapRes!55790))))

(declare-fun condMapEmpty!55790 () Bool)

(declare-fun mapDefault!55790 () ValueCell!17149)

