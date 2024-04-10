; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111594 () Bool)

(assert start!111594)

(declare-fun b_free!30251 () Bool)

(declare-fun b_next!30251 () Bool)

(assert (=> start!111594 (= b_free!30251 (not b_next!30251))))

(declare-fun tp!106229 () Bool)

(declare-fun b_and!48661 () Bool)

(assert (=> start!111594 (= tp!106229 b_and!48661)))

(declare-fun res!877192 () Bool)

(declare-fun e!753720 () Bool)

(assert (=> start!111594 (=> (not res!877192) (not e!753720))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111594 (= res!877192 (validMask!0 mask!2019))))

(assert (=> start!111594 e!753720))

(declare-datatypes ((array!89066 0))(
  ( (array!89067 (arr!43007 (Array (_ BitVec 32) (_ BitVec 64))) (size!43557 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89066)

(declare-fun array_inv!32467 (array!89066) Bool)

(assert (=> start!111594 (array_inv!32467 _keys!1609)))

(assert (=> start!111594 true))

(declare-fun tp_is_empty!36071 () Bool)

(assert (=> start!111594 tp_is_empty!36071))

(declare-datatypes ((V!53197 0))(
  ( (V!53198 (val!18110 Int)) )
))
(declare-datatypes ((ValueCell!17137 0))(
  ( (ValueCellFull!17137 (v!20740 V!53197)) (EmptyCell!17137) )
))
(declare-datatypes ((array!89068 0))(
  ( (array!89069 (arr!43008 (Array (_ BitVec 32) ValueCell!17137)) (size!43558 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89068)

(declare-fun e!753724 () Bool)

(declare-fun array_inv!32468 (array!89068) Bool)

(assert (=> start!111594 (and (array_inv!32468 _values!1337) e!753724)))

(assert (=> start!111594 tp!106229))

(declare-fun b!1321610 () Bool)

(declare-fun res!877191 () Bool)

(assert (=> b!1321610 (=> (not res!877191) (not e!753720))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1321610 (= res!877191 (not (= (select (arr!43007 _keys!1609) from!2000) k!1164)))))

(declare-fun mapIsEmpty!55754 () Bool)

(declare-fun mapRes!55754 () Bool)

(assert (=> mapIsEmpty!55754 mapRes!55754))

(declare-fun b!1321611 () Bool)

(declare-fun e!753721 () Bool)

(assert (=> b!1321611 (= e!753721 tp_is_empty!36071)))

(declare-fun b!1321612 () Bool)

(declare-fun res!877189 () Bool)

(assert (=> b!1321612 (=> (not res!877189) (not e!753720))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53197)

(declare-fun minValue!1279 () V!53197)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23326 0))(
  ( (tuple2!23327 (_1!11674 (_ BitVec 64)) (_2!11674 V!53197)) )
))
(declare-datatypes ((List!30474 0))(
  ( (Nil!30471) (Cons!30470 (h!31679 tuple2!23326) (t!44274 List!30474)) )
))
(declare-datatypes ((ListLongMap!20983 0))(
  ( (ListLongMap!20984 (toList!10507 List!30474)) )
))
(declare-fun contains!8662 (ListLongMap!20983 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5508 (array!89066 array!89068 (_ BitVec 32) (_ BitVec 32) V!53197 V!53197 (_ BitVec 32) Int) ListLongMap!20983)

(assert (=> b!1321612 (= res!877189 (contains!8662 (getCurrentListMap!5508 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1321613 () Bool)

(declare-fun res!877194 () Bool)

(assert (=> b!1321613 (=> (not res!877194) (not e!753720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89066 (_ BitVec 32)) Bool)

(assert (=> b!1321613 (= res!877194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321614 () Bool)

(declare-fun res!877193 () Bool)

(assert (=> b!1321614 (=> (not res!877193) (not e!753720))))

(declare-datatypes ((List!30475 0))(
  ( (Nil!30472) (Cons!30471 (h!31680 (_ BitVec 64)) (t!44275 List!30475)) )
))
(declare-fun arrayNoDuplicates!0 (array!89066 (_ BitVec 32) List!30475) Bool)

(assert (=> b!1321614 (= res!877193 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30472))))

(declare-fun b!1321615 () Bool)

(declare-fun res!877196 () Bool)

(assert (=> b!1321615 (=> (not res!877196) (not e!753720))))

(assert (=> b!1321615 (= res!877196 (and (= (size!43558 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43557 _keys!1609) (size!43558 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321616 () Bool)

(declare-fun e!753723 () Bool)

(assert (=> b!1321616 (= e!753723 tp_is_empty!36071)))

(declare-fun b!1321617 () Bool)

(declare-fun res!877195 () Bool)

(assert (=> b!1321617 (=> (not res!877195) (not e!753720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321617 (= res!877195 (validKeyInArray!0 (select (arr!43007 _keys!1609) from!2000)))))

(declare-fun b!1321618 () Bool)

(declare-fun res!877190 () Bool)

(assert (=> b!1321618 (=> (not res!877190) (not e!753720))))

(assert (=> b!1321618 (= res!877190 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43557 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55754 () Bool)

(declare-fun tp!106228 () Bool)

(assert (=> mapNonEmpty!55754 (= mapRes!55754 (and tp!106228 e!753723))))

(declare-fun mapValue!55754 () ValueCell!17137)

(declare-fun mapRest!55754 () (Array (_ BitVec 32) ValueCell!17137))

(declare-fun mapKey!55754 () (_ BitVec 32))

(assert (=> mapNonEmpty!55754 (= (arr!43008 _values!1337) (store mapRest!55754 mapKey!55754 mapValue!55754))))

(declare-fun b!1321619 () Bool)

(assert (=> b!1321619 (= e!753724 (and e!753721 mapRes!55754))))

(declare-fun condMapEmpty!55754 () Bool)

(declare-fun mapDefault!55754 () ValueCell!17137)

