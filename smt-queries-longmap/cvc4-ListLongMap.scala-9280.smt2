; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111032 () Bool)

(assert start!111032)

(declare-fun b_free!29867 () Bool)

(declare-fun b_next!29867 () Bool)

(assert (=> start!111032 (= b_free!29867 (not b_next!29867))))

(declare-fun tp!104923 () Bool)

(declare-fun b_and!48075 () Bool)

(assert (=> start!111032 (= tp!104923 b_and!48075)))

(declare-fun b!1314578 () Bool)

(declare-fun res!872724 () Bool)

(declare-fun e!749867 () Bool)

(assert (=> b!1314578 (=> (not res!872724) (not e!749867))))

(declare-datatypes ((array!88162 0))(
  ( (array!88163 (arr!42561 (Array (_ BitVec 32) (_ BitVec 64))) (size!43111 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88162)

(declare-datatypes ((List!30185 0))(
  ( (Nil!30182) (Cons!30181 (h!31390 (_ BitVec 64)) (t!43791 List!30185)) )
))
(declare-fun arrayNoDuplicates!0 (array!88162 (_ BitVec 32) List!30185) Bool)

(assert (=> b!1314578 (= res!872724 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30182))))

(declare-fun b!1314579 () Bool)

(assert (=> b!1314579 (= e!749867 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52565 0))(
  ( (V!52566 (val!17873 Int)) )
))
(declare-fun minValue!1296 () V!52565)

(declare-datatypes ((ValueCell!16900 0))(
  ( (ValueCellFull!16900 (v!20500 V!52565)) (EmptyCell!16900) )
))
(declare-datatypes ((array!88164 0))(
  ( (array!88165 (arr!42562 (Array (_ BitVec 32) ValueCell!16900)) (size!43112 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88164)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!52565)

(declare-fun lt!585810 () Bool)

(declare-datatypes ((tuple2!23048 0))(
  ( (tuple2!23049 (_1!11535 (_ BitVec 64)) (_2!11535 V!52565)) )
))
(declare-datatypes ((List!30186 0))(
  ( (Nil!30183) (Cons!30182 (h!31391 tuple2!23048) (t!43792 List!30186)) )
))
(declare-datatypes ((ListLongMap!20705 0))(
  ( (ListLongMap!20706 (toList!10368 List!30186)) )
))
(declare-fun contains!8518 (ListLongMap!20705 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5381 (array!88162 array!88164 (_ BitVec 32) (_ BitVec 32) V!52565 V!52565 (_ BitVec 32) Int) ListLongMap!20705)

(assert (=> b!1314579 (= lt!585810 (contains!8518 (getCurrentListMap!5381 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1314580 () Bool)

(declare-fun e!749864 () Bool)

(declare-fun tp_is_empty!35597 () Bool)

(assert (=> b!1314580 (= e!749864 tp_is_empty!35597)))

(declare-fun mapIsEmpty!55024 () Bool)

(declare-fun mapRes!55024 () Bool)

(assert (=> mapIsEmpty!55024 mapRes!55024))

(declare-fun b!1314581 () Bool)

(declare-fun res!872721 () Bool)

(assert (=> b!1314581 (=> (not res!872721) (not e!749867))))

(assert (=> b!1314581 (= res!872721 (and (= (size!43112 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43111 _keys!1628) (size!43112 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55024 () Bool)

(declare-fun tp!104922 () Bool)

(assert (=> mapNonEmpty!55024 (= mapRes!55024 (and tp!104922 e!749864))))

(declare-fun mapKey!55024 () (_ BitVec 32))

(declare-fun mapValue!55024 () ValueCell!16900)

(declare-fun mapRest!55024 () (Array (_ BitVec 32) ValueCell!16900))

(assert (=> mapNonEmpty!55024 (= (arr!42562 _values!1354) (store mapRest!55024 mapKey!55024 mapValue!55024))))

(declare-fun b!1314582 () Bool)

(declare-fun e!749865 () Bool)

(assert (=> b!1314582 (= e!749865 tp_is_empty!35597)))

(declare-fun b!1314583 () Bool)

(declare-fun e!749863 () Bool)

(assert (=> b!1314583 (= e!749863 (and e!749865 mapRes!55024))))

(declare-fun condMapEmpty!55024 () Bool)

(declare-fun mapDefault!55024 () ValueCell!16900)

