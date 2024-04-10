; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110990 () Bool)

(assert start!110990)

(declare-fun b_free!29825 () Bool)

(declare-fun b_next!29825 () Bool)

(assert (=> start!110990 (= b_free!29825 (not b_next!29825))))

(declare-fun tp!104797 () Bool)

(declare-fun b_and!48033 () Bool)

(assert (=> start!110990 (= tp!104797 b_and!48033)))

(declare-fun res!872372 () Bool)

(declare-fun e!749549 () Bool)

(assert (=> start!110990 (=> (not res!872372) (not e!749549))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110990 (= res!872372 (validMask!0 mask!2040))))

(assert (=> start!110990 e!749549))

(assert (=> start!110990 tp!104797))

(declare-datatypes ((array!88082 0))(
  ( (array!88083 (arr!42521 (Array (_ BitVec 32) (_ BitVec 64))) (size!43071 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88082)

(declare-fun array_inv!32121 (array!88082) Bool)

(assert (=> start!110990 (array_inv!32121 _keys!1628)))

(assert (=> start!110990 true))

(declare-fun tp_is_empty!35555 () Bool)

(assert (=> start!110990 tp_is_empty!35555))

(declare-datatypes ((V!52509 0))(
  ( (V!52510 (val!17852 Int)) )
))
(declare-datatypes ((ValueCell!16879 0))(
  ( (ValueCellFull!16879 (v!20479 V!52509)) (EmptyCell!16879) )
))
(declare-datatypes ((array!88084 0))(
  ( (array!88085 (arr!42522 (Array (_ BitVec 32) ValueCell!16879)) (size!43072 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88084)

(declare-fun e!749550 () Bool)

(declare-fun array_inv!32122 (array!88084) Bool)

(assert (=> start!110990 (and (array_inv!32122 _values!1354) e!749550)))

(declare-fun b!1314038 () Bool)

(assert (=> b!1314038 (= e!749549 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52509)

(declare-fun zeroValue!1296 () V!52509)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585747 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23018 0))(
  ( (tuple2!23019 (_1!11520 (_ BitVec 64)) (_2!11520 V!52509)) )
))
(declare-datatypes ((List!30155 0))(
  ( (Nil!30152) (Cons!30151 (h!31360 tuple2!23018) (t!43761 List!30155)) )
))
(declare-datatypes ((ListLongMap!20675 0))(
  ( (ListLongMap!20676 (toList!10353 List!30155)) )
))
(declare-fun contains!8503 (ListLongMap!20675 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5366 (array!88082 array!88084 (_ BitVec 32) (_ BitVec 32) V!52509 V!52509 (_ BitVec 32) Int) ListLongMap!20675)

(assert (=> b!1314038 (= lt!585747 (contains!8503 (getCurrentListMap!5366 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1314039 () Bool)

(declare-fun res!872369 () Bool)

(assert (=> b!1314039 (=> (not res!872369) (not e!749549))))

(assert (=> b!1314039 (= res!872369 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43071 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314040 () Bool)

(declare-fun e!749551 () Bool)

(assert (=> b!1314040 (= e!749551 tp_is_empty!35555)))

(declare-fun b!1314041 () Bool)

(declare-fun res!872371 () Bool)

(assert (=> b!1314041 (=> (not res!872371) (not e!749549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88082 (_ BitVec 32)) Bool)

(assert (=> b!1314041 (= res!872371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314042 () Bool)

(declare-fun e!749548 () Bool)

(declare-fun mapRes!54961 () Bool)

(assert (=> b!1314042 (= e!749550 (and e!749548 mapRes!54961))))

(declare-fun condMapEmpty!54961 () Bool)

(declare-fun mapDefault!54961 () ValueCell!16879)

