; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110842 () Bool)

(assert start!110842)

(declare-fun b_free!29677 () Bool)

(declare-fun b_next!29677 () Bool)

(assert (=> start!110842 (= b_free!29677 (not b_next!29677))))

(declare-fun tp!104353 () Bool)

(declare-fun b_and!47885 () Bool)

(assert (=> start!110842 (= tp!104353 b_and!47885)))

(declare-fun b!1312099 () Bool)

(declare-fun res!871097 () Bool)

(declare-fun e!748441 () Bool)

(assert (=> b!1312099 (=> (not res!871097) (not e!748441))))

(declare-datatypes ((array!87802 0))(
  ( (array!87803 (arr!42381 (Array (_ BitVec 32) (_ BitVec 64))) (size!42931 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87802)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312099 (= res!871097 (validKeyInArray!0 (select (arr!42381 _keys!1628) from!2020)))))

(declare-fun b!1312100 () Bool)

(declare-fun res!871102 () Bool)

(assert (=> b!1312100 (=> (not res!871102) (not e!748441))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87802 (_ BitVec 32)) Bool)

(assert (=> b!1312100 (= res!871102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312101 () Bool)

(declare-fun res!871099 () Bool)

(assert (=> b!1312101 (=> (not res!871099) (not e!748441))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312101 (= res!871099 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312102 () Bool)

(declare-fun res!871100 () Bool)

(assert (=> b!1312102 (=> (not res!871100) (not e!748441))))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1312102 (= res!871100 (not (= (select (arr!42381 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1312103 () Bool)

(assert (=> b!1312103 (= e!748441 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((V!52313 0))(
  ( (V!52314 (val!17778 Int)) )
))
(declare-fun minValue!1296 () V!52313)

(declare-datatypes ((ValueCell!16805 0))(
  ( (ValueCellFull!16805 (v!20405 V!52313)) (EmptyCell!16805) )
))
(declare-datatypes ((array!87804 0))(
  ( (array!87805 (arr!42382 (Array (_ BitVec 32) ValueCell!16805)) (size!42932 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87804)

(declare-fun zeroValue!1296 () V!52313)

(declare-datatypes ((tuple2!22914 0))(
  ( (tuple2!22915 (_1!11468 (_ BitVec 64)) (_2!11468 V!52313)) )
))
(declare-datatypes ((List!30053 0))(
  ( (Nil!30050) (Cons!30049 (h!31258 tuple2!22914) (t!43659 List!30053)) )
))
(declare-datatypes ((ListLongMap!20571 0))(
  ( (ListLongMap!20572 (toList!10301 List!30053)) )
))
(declare-fun contains!8451 (ListLongMap!20571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5314 (array!87802 array!87804 (_ BitVec 32) (_ BitVec 32) V!52313 V!52313 (_ BitVec 32) Int) ListLongMap!20571)

(assert (=> b!1312103 (contains!8451 (getCurrentListMap!5314 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43368 0))(
  ( (Unit!43369) )
))
(declare-fun lt!585534 () Unit!43368)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!11 (array!87802 array!87804 (_ BitVec 32) (_ BitVec 32) V!52313 V!52313 (_ BitVec 64) (_ BitVec 32) Int) Unit!43368)

(assert (=> b!1312103 (= lt!585534 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!11 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun mapIsEmpty!54739 () Bool)

(declare-fun mapRes!54739 () Bool)

(assert (=> mapIsEmpty!54739 mapRes!54739))

(declare-fun mapNonEmpty!54739 () Bool)

(declare-fun tp!104352 () Bool)

(declare-fun e!748439 () Bool)

(assert (=> mapNonEmpty!54739 (= mapRes!54739 (and tp!104352 e!748439))))

(declare-fun mapKey!54739 () (_ BitVec 32))

(declare-fun mapValue!54739 () ValueCell!16805)

(declare-fun mapRest!54739 () (Array (_ BitVec 32) ValueCell!16805))

(assert (=> mapNonEmpty!54739 (= (arr!42382 _values!1354) (store mapRest!54739 mapKey!54739 mapValue!54739))))

(declare-fun b!1312105 () Bool)

(declare-fun e!748438 () Bool)

(declare-fun e!748440 () Bool)

(assert (=> b!1312105 (= e!748438 (and e!748440 mapRes!54739))))

(declare-fun condMapEmpty!54739 () Bool)

(declare-fun mapDefault!54739 () ValueCell!16805)

