; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111008 () Bool)

(assert start!111008)

(declare-fun b_free!29843 () Bool)

(declare-fun b_next!29843 () Bool)

(assert (=> start!111008 (= b_free!29843 (not b_next!29843))))

(declare-fun tp!104851 () Bool)

(declare-fun b_and!48051 () Bool)

(assert (=> start!111008 (= tp!104851 b_and!48051)))

(declare-fun b!1314286 () Bool)

(declare-fun e!749684 () Bool)

(declare-fun tp_is_empty!35573 () Bool)

(assert (=> b!1314286 (= e!749684 tp_is_empty!35573)))

(declare-fun b!1314287 () Bool)

(declare-fun res!872542 () Bool)

(declare-fun e!749686 () Bool)

(assert (=> b!1314287 (=> (not res!872542) (not e!749686))))

(declare-datatypes ((array!88118 0))(
  ( (array!88119 (arr!42539 (Array (_ BitVec 32) (_ BitVec 64))) (size!43089 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88118)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1314287 (= res!872542 (validKeyInArray!0 (select (arr!42539 _keys!1628) from!2020)))))

(declare-fun b!1314288 () Bool)

(declare-fun res!872544 () Bool)

(assert (=> b!1314288 (=> (not res!872544) (not e!749686))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314288 (= res!872544 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1314289 () Bool)

(declare-fun res!872543 () Bool)

(assert (=> b!1314289 (=> (not res!872543) (not e!749686))))

(declare-datatypes ((List!30167 0))(
  ( (Nil!30164) (Cons!30163 (h!31372 (_ BitVec 64)) (t!43773 List!30167)) )
))
(declare-fun arrayNoDuplicates!0 (array!88118 (_ BitVec 32) List!30167) Bool)

(assert (=> b!1314289 (= res!872543 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30164))))

(declare-fun b!1314290 () Bool)

(declare-fun e!749687 () Bool)

(assert (=> b!1314290 (= e!749687 tp_is_empty!35573)))

(declare-fun mapNonEmpty!54988 () Bool)

(declare-fun mapRes!54988 () Bool)

(declare-fun tp!104850 () Bool)

(assert (=> mapNonEmpty!54988 (= mapRes!54988 (and tp!104850 e!749684))))

(declare-datatypes ((V!52533 0))(
  ( (V!52534 (val!17861 Int)) )
))
(declare-datatypes ((ValueCell!16888 0))(
  ( (ValueCellFull!16888 (v!20488 V!52533)) (EmptyCell!16888) )
))
(declare-fun mapValue!54988 () ValueCell!16888)

(declare-fun mapRest!54988 () (Array (_ BitVec 32) ValueCell!16888))

(declare-datatypes ((array!88120 0))(
  ( (array!88121 (arr!42540 (Array (_ BitVec 32) ValueCell!16888)) (size!43090 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88120)

(declare-fun mapKey!54988 () (_ BitVec 32))

(assert (=> mapNonEmpty!54988 (= (arr!42540 _values!1354) (store mapRest!54988 mapKey!54988 mapValue!54988))))

(declare-fun b!1314291 () Bool)

(declare-fun res!872540 () Bool)

(assert (=> b!1314291 (=> (not res!872540) (not e!749686))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88118 (_ BitVec 32)) Bool)

(assert (=> b!1314291 (= res!872540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!872536 () Bool)

(assert (=> start!111008 (=> (not res!872536) (not e!749686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111008 (= res!872536 (validMask!0 mask!2040))))

(assert (=> start!111008 e!749686))

(assert (=> start!111008 tp!104851))

(declare-fun array_inv!32133 (array!88118) Bool)

(assert (=> start!111008 (array_inv!32133 _keys!1628)))

(assert (=> start!111008 true))

(assert (=> start!111008 tp_is_empty!35573))

(declare-fun e!749685 () Bool)

(declare-fun array_inv!32134 (array!88120) Bool)

(assert (=> start!111008 (and (array_inv!32134 _values!1354) e!749685)))

(declare-fun mapIsEmpty!54988 () Bool)

(assert (=> mapIsEmpty!54988 mapRes!54988))

(declare-fun b!1314292 () Bool)

(declare-fun res!872539 () Bool)

(assert (=> b!1314292 (=> (not res!872539) (not e!749686))))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1314292 (= res!872539 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43089 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314293 () Bool)

(declare-fun res!872541 () Bool)

(assert (=> b!1314293 (=> (not res!872541) (not e!749686))))

(assert (=> b!1314293 (= res!872541 (and (= (size!43090 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43089 _keys!1628) (size!43090 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314294 () Bool)

(assert (=> b!1314294 (= e!749686 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52533)

(declare-fun zeroValue!1296 () V!52533)

(declare-datatypes ((tuple2!23030 0))(
  ( (tuple2!23031 (_1!11526 (_ BitVec 64)) (_2!11526 V!52533)) )
))
(declare-datatypes ((List!30168 0))(
  ( (Nil!30165) (Cons!30164 (h!31373 tuple2!23030) (t!43774 List!30168)) )
))
(declare-datatypes ((ListLongMap!20687 0))(
  ( (ListLongMap!20688 (toList!10359 List!30168)) )
))
(declare-fun contains!8509 (ListLongMap!20687 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5372 (array!88118 array!88120 (_ BitVec 32) (_ BitVec 32) V!52533 V!52533 (_ BitVec 32) Int) ListLongMap!20687)

(assert (=> b!1314294 (contains!8509 (getCurrentListMap!5372 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43388 0))(
  ( (Unit!43389) )
))
(declare-fun lt!585774 () Unit!43388)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!20 (array!88118 array!88120 (_ BitVec 32) (_ BitVec 32) V!52533 V!52533 (_ BitVec 64) (_ BitVec 32) Int) Unit!43388)

(assert (=> b!1314294 (= lt!585774 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!20 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1314295 () Bool)

(declare-fun res!872538 () Bool)

(assert (=> b!1314295 (=> (not res!872538) (not e!749686))))

(assert (=> b!1314295 (= res!872538 (not (= (select (arr!42539 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1314296 () Bool)

(assert (=> b!1314296 (= e!749685 (and e!749687 mapRes!54988))))

(declare-fun condMapEmpty!54988 () Bool)

(declare-fun mapDefault!54988 () ValueCell!16888)

