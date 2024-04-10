; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110852 () Bool)

(assert start!110852)

(declare-fun b_free!29687 () Bool)

(declare-fun b_next!29687 () Bool)

(assert (=> start!110852 (= b_free!29687 (not b_next!29687))))

(declare-fun tp!104382 () Bool)

(declare-fun b_and!47895 () Bool)

(assert (=> start!110852 (= tp!104382 b_and!47895)))

(declare-fun b!1312279 () Bool)

(declare-fun res!871237 () Bool)

(declare-fun e!748517 () Bool)

(assert (=> b!1312279 (=> (not res!871237) (not e!748517))))

(declare-datatypes ((array!87822 0))(
  ( (array!87823 (arr!42391 (Array (_ BitVec 32) (_ BitVec 64))) (size!42941 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87822)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312279 (= res!871237 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42941 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312280 () Bool)

(declare-fun res!871235 () Bool)

(assert (=> b!1312280 (=> (not res!871235) (not e!748517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312280 (= res!871235 (validKeyInArray!0 (select (arr!42391 _keys!1628) from!2020)))))

(declare-fun mapNonEmpty!54754 () Bool)

(declare-fun mapRes!54754 () Bool)

(declare-fun tp!104383 () Bool)

(declare-fun e!748516 () Bool)

(assert (=> mapNonEmpty!54754 (= mapRes!54754 (and tp!104383 e!748516))))

(declare-datatypes ((V!52325 0))(
  ( (V!52326 (val!17783 Int)) )
))
(declare-datatypes ((ValueCell!16810 0))(
  ( (ValueCellFull!16810 (v!20410 V!52325)) (EmptyCell!16810) )
))
(declare-datatypes ((array!87824 0))(
  ( (array!87825 (arr!42392 (Array (_ BitVec 32) ValueCell!16810)) (size!42942 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87824)

(declare-fun mapValue!54754 () ValueCell!16810)

(declare-fun mapRest!54754 () (Array (_ BitVec 32) ValueCell!16810))

(declare-fun mapKey!54754 () (_ BitVec 32))

(assert (=> mapNonEmpty!54754 (= (arr!42392 _values!1354) (store mapRest!54754 mapKey!54754 mapValue!54754))))

(declare-fun b!1312281 () Bool)

(declare-fun res!871236 () Bool)

(assert (=> b!1312281 (=> (not res!871236) (not e!748517))))

(assert (=> b!1312281 (= res!871236 (not (= (select (arr!42391 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1312282 () Bool)

(assert (=> b!1312282 (= e!748517 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52325)

(declare-fun zeroValue!1296 () V!52325)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22922 0))(
  ( (tuple2!22923 (_1!11472 (_ BitVec 64)) (_2!11472 V!52325)) )
))
(declare-datatypes ((List!30060 0))(
  ( (Nil!30057) (Cons!30056 (h!31265 tuple2!22922) (t!43666 List!30060)) )
))
(declare-datatypes ((ListLongMap!20579 0))(
  ( (ListLongMap!20580 (toList!10305 List!30060)) )
))
(declare-fun contains!8455 (ListLongMap!20579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5318 (array!87822 array!87824 (_ BitVec 32) (_ BitVec 32) V!52325 V!52325 (_ BitVec 32) Int) ListLongMap!20579)

(assert (=> b!1312282 (contains!8455 (getCurrentListMap!5318 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43376 0))(
  ( (Unit!43377) )
))
(declare-fun lt!585549 () Unit!43376)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!15 (array!87822 array!87824 (_ BitVec 32) (_ BitVec 32) V!52325 V!52325 (_ BitVec 64) (_ BitVec 32) Int) Unit!43376)

(assert (=> b!1312282 (= lt!585549 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!15 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312283 () Bool)

(declare-fun e!748515 () Bool)

(declare-fun tp_is_empty!35417 () Bool)

(assert (=> b!1312283 (= e!748515 tp_is_empty!35417)))

(declare-fun b!1312284 () Bool)

(declare-fun res!871232 () Bool)

(assert (=> b!1312284 (=> (not res!871232) (not e!748517))))

(declare-datatypes ((List!30061 0))(
  ( (Nil!30058) (Cons!30057 (h!31266 (_ BitVec 64)) (t!43667 List!30061)) )
))
(declare-fun arrayNoDuplicates!0 (array!87822 (_ BitVec 32) List!30061) Bool)

(assert (=> b!1312284 (= res!871232 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30058))))

(declare-fun mapIsEmpty!54754 () Bool)

(assert (=> mapIsEmpty!54754 mapRes!54754))

(declare-fun b!1312286 () Bool)

(declare-fun res!871238 () Bool)

(assert (=> b!1312286 (=> (not res!871238) (not e!748517))))

(assert (=> b!1312286 (= res!871238 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312287 () Bool)

(declare-fun res!871231 () Bool)

(assert (=> b!1312287 (=> (not res!871231) (not e!748517))))

(assert (=> b!1312287 (= res!871231 (and (= (size!42942 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42941 _keys!1628) (size!42942 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312288 () Bool)

(declare-fun res!871234 () Bool)

(assert (=> b!1312288 (=> (not res!871234) (not e!748517))))

(assert (=> b!1312288 (= res!871234 (contains!8455 (getCurrentListMap!5318 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1312289 () Bool)

(declare-fun res!871233 () Bool)

(assert (=> b!1312289 (=> (not res!871233) (not e!748517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87822 (_ BitVec 32)) Bool)

(assert (=> b!1312289 (= res!871233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312290 () Bool)

(declare-fun e!748513 () Bool)

(assert (=> b!1312290 (= e!748513 (and e!748515 mapRes!54754))))

(declare-fun condMapEmpty!54754 () Bool)

(declare-fun mapDefault!54754 () ValueCell!16810)

