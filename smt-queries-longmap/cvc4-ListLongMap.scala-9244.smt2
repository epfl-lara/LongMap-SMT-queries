; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110816 () Bool)

(assert start!110816)

(declare-fun b_free!29651 () Bool)

(declare-fun b_next!29651 () Bool)

(assert (=> start!110816 (= b_free!29651 (not b_next!29651))))

(declare-fun tp!104275 () Bool)

(declare-fun b_and!47859 () Bool)

(assert (=> start!110816 (= tp!104275 b_and!47859)))

(declare-fun res!870748 () Bool)

(declare-fun e!748246 () Bool)

(assert (=> start!110816 (=> (not res!870748) (not e!748246))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110816 (= res!870748 (validMask!0 mask!2040))))

(assert (=> start!110816 e!748246))

(assert (=> start!110816 tp!104275))

(declare-datatypes ((array!87750 0))(
  ( (array!87751 (arr!42355 (Array (_ BitVec 32) (_ BitVec 64))) (size!42905 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87750)

(declare-fun array_inv!32009 (array!87750) Bool)

(assert (=> start!110816 (array_inv!32009 _keys!1628)))

(assert (=> start!110816 true))

(declare-fun tp_is_empty!35381 () Bool)

(assert (=> start!110816 tp_is_empty!35381))

(declare-datatypes ((V!52277 0))(
  ( (V!52278 (val!17765 Int)) )
))
(declare-datatypes ((ValueCell!16792 0))(
  ( (ValueCellFull!16792 (v!20392 V!52277)) (EmptyCell!16792) )
))
(declare-datatypes ((array!87752 0))(
  ( (array!87753 (arr!42356 (Array (_ BitVec 32) ValueCell!16792)) (size!42906 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87752)

(declare-fun e!748243 () Bool)

(declare-fun array_inv!32010 (array!87752) Bool)

(assert (=> start!110816 (and (array_inv!32010 _values!1354) e!748243)))

(declare-fun b!1311631 () Bool)

(declare-fun e!748247 () Bool)

(assert (=> b!1311631 (= e!748247 tp_is_empty!35381)))

(declare-fun b!1311632 () Bool)

(declare-fun e!748245 () Bool)

(assert (=> b!1311632 (= e!748245 tp_is_empty!35381)))

(declare-fun b!1311633 () Bool)

(declare-fun res!870752 () Bool)

(assert (=> b!1311633 (=> (not res!870752) (not e!748246))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311633 (= res!870752 (validKeyInArray!0 (select (arr!42355 _keys!1628) from!2020)))))

(declare-fun b!1311634 () Bool)

(declare-fun res!870750 () Bool)

(assert (=> b!1311634 (=> (not res!870750) (not e!748246))))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1311634 (= res!870750 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42905 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311635 () Bool)

(declare-fun res!870747 () Bool)

(assert (=> b!1311635 (=> (not res!870747) (not e!748246))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52277)

(declare-fun zeroValue!1296 () V!52277)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22894 0))(
  ( (tuple2!22895 (_1!11458 (_ BitVec 64)) (_2!11458 V!52277)) )
))
(declare-datatypes ((List!30035 0))(
  ( (Nil!30032) (Cons!30031 (h!31240 tuple2!22894) (t!43641 List!30035)) )
))
(declare-datatypes ((ListLongMap!20551 0))(
  ( (ListLongMap!20552 (toList!10291 List!30035)) )
))
(declare-fun contains!8441 (ListLongMap!20551 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5304 (array!87750 array!87752 (_ BitVec 32) (_ BitVec 32) V!52277 V!52277 (_ BitVec 32) Int) ListLongMap!20551)

(assert (=> b!1311635 (= res!870747 (contains!8441 (getCurrentListMap!5304 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!54700 () Bool)

(declare-fun mapRes!54700 () Bool)

(declare-fun tp!104274 () Bool)

(assert (=> mapNonEmpty!54700 (= mapRes!54700 (and tp!104274 e!748247))))

(declare-fun mapValue!54700 () ValueCell!16792)

(declare-fun mapRest!54700 () (Array (_ BitVec 32) ValueCell!16792))

(declare-fun mapKey!54700 () (_ BitVec 32))

(assert (=> mapNonEmpty!54700 (= (arr!42356 _values!1354) (store mapRest!54700 mapKey!54700 mapValue!54700))))

(declare-fun b!1311636 () Bool)

(assert (=> b!1311636 (= e!748246 (not true))))

(assert (=> b!1311636 (contains!8441 (getCurrentListMap!5304 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43350 0))(
  ( (Unit!43351) )
))
(declare-fun lt!585495 () Unit!43350)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!2 (array!87750 array!87752 (_ BitVec 32) (_ BitVec 32) V!52277 V!52277 (_ BitVec 64) (_ BitVec 32) Int) Unit!43350)

(assert (=> b!1311636 (= lt!585495 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!2 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun mapIsEmpty!54700 () Bool)

(assert (=> mapIsEmpty!54700 mapRes!54700))

(declare-fun b!1311637 () Bool)

(declare-fun res!870746 () Bool)

(assert (=> b!1311637 (=> (not res!870746) (not e!748246))))

(assert (=> b!1311637 (= res!870746 (and (= (size!42906 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42905 _keys!1628) (size!42906 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311638 () Bool)

(declare-fun res!870749 () Bool)

(assert (=> b!1311638 (=> (not res!870749) (not e!748246))))

(assert (=> b!1311638 (= res!870749 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1311639 () Bool)

(declare-fun res!870751 () Bool)

(assert (=> b!1311639 (=> (not res!870751) (not e!748246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87750 (_ BitVec 32)) Bool)

(assert (=> b!1311639 (= res!870751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311640 () Bool)

(assert (=> b!1311640 (= e!748243 (and e!748245 mapRes!54700))))

(declare-fun condMapEmpty!54700 () Bool)

(declare-fun mapDefault!54700 () ValueCell!16792)

