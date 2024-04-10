; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110860 () Bool)

(assert start!110860)

(declare-fun b_free!29695 () Bool)

(declare-fun b_next!29695 () Bool)

(assert (=> start!110860 (= b_free!29695 (not b_next!29695))))

(declare-fun tp!104407 () Bool)

(declare-fun b_and!47903 () Bool)

(assert (=> start!110860 (= tp!104407 b_and!47903)))

(declare-fun b!1312423 () Bool)

(declare-fun res!871346 () Bool)

(declare-fun e!748577 () Bool)

(assert (=> b!1312423 (=> (not res!871346) (not e!748577))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87836 0))(
  ( (array!87837 (arr!42398 (Array (_ BitVec 32) (_ BitVec 64))) (size!42948 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87836)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52337 0))(
  ( (V!52338 (val!17787 Int)) )
))
(declare-fun minValue!1296 () V!52337)

(declare-datatypes ((ValueCell!16814 0))(
  ( (ValueCellFull!16814 (v!20414 V!52337)) (EmptyCell!16814) )
))
(declare-datatypes ((array!87838 0))(
  ( (array!87839 (arr!42399 (Array (_ BitVec 32) ValueCell!16814)) (size!42949 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87838)

(declare-fun zeroValue!1296 () V!52337)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22928 0))(
  ( (tuple2!22929 (_1!11475 (_ BitVec 64)) (_2!11475 V!52337)) )
))
(declare-datatypes ((List!30066 0))(
  ( (Nil!30063) (Cons!30062 (h!31271 tuple2!22928) (t!43672 List!30066)) )
))
(declare-datatypes ((ListLongMap!20585 0))(
  ( (ListLongMap!20586 (toList!10308 List!30066)) )
))
(declare-fun contains!8458 (ListLongMap!20585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5321 (array!87836 array!87838 (_ BitVec 32) (_ BitVec 32) V!52337 V!52337 (_ BitVec 32) Int) ListLongMap!20585)

(assert (=> b!1312423 (= res!871346 (contains!8458 (getCurrentListMap!5321 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1312424 () Bool)

(assert (=> b!1312424 (= e!748577 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))))

(assert (=> b!1312424 (contains!8458 (getCurrentListMap!5321 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43382 0))(
  ( (Unit!43383) )
))
(declare-fun lt!585561 () Unit!43382)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!18 (array!87836 array!87838 (_ BitVec 32) (_ BitVec 32) V!52337 V!52337 (_ BitVec 64) (_ BitVec 32) Int) Unit!43382)

(assert (=> b!1312424 (= lt!585561 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!18 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312425 () Bool)

(declare-fun res!871343 () Bool)

(assert (=> b!1312425 (=> (not res!871343) (not e!748577))))

(assert (=> b!1312425 (= res!871343 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312426 () Bool)

(declare-fun res!871339 () Bool)

(assert (=> b!1312426 (=> (not res!871339) (not e!748577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87836 (_ BitVec 32)) Bool)

(assert (=> b!1312426 (= res!871339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312427 () Bool)

(declare-fun res!871341 () Bool)

(assert (=> b!1312427 (=> (not res!871341) (not e!748577))))

(declare-datatypes ((List!30067 0))(
  ( (Nil!30064) (Cons!30063 (h!31272 (_ BitVec 64)) (t!43673 List!30067)) )
))
(declare-fun arrayNoDuplicates!0 (array!87836 (_ BitVec 32) List!30067) Bool)

(assert (=> b!1312427 (= res!871341 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30064))))

(declare-fun b!1312428 () Bool)

(declare-fun e!748573 () Bool)

(declare-fun tp_is_empty!35425 () Bool)

(assert (=> b!1312428 (= e!748573 tp_is_empty!35425)))

(declare-fun res!871340 () Bool)

(assert (=> start!110860 (=> (not res!871340) (not e!748577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110860 (= res!871340 (validMask!0 mask!2040))))

(assert (=> start!110860 e!748577))

(assert (=> start!110860 tp!104407))

(declare-fun array_inv!32037 (array!87836) Bool)

(assert (=> start!110860 (array_inv!32037 _keys!1628)))

(assert (=> start!110860 true))

(assert (=> start!110860 tp_is_empty!35425))

(declare-fun e!748574 () Bool)

(declare-fun array_inv!32038 (array!87838) Bool)

(assert (=> start!110860 (and (array_inv!32038 _values!1354) e!748574)))

(declare-fun b!1312429 () Bool)

(declare-fun res!871345 () Bool)

(assert (=> b!1312429 (=> (not res!871345) (not e!748577))))

(assert (=> b!1312429 (= res!871345 (and (= (size!42949 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42948 _keys!1628) (size!42949 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312430 () Bool)

(declare-fun res!871342 () Bool)

(assert (=> b!1312430 (=> (not res!871342) (not e!748577))))

(assert (=> b!1312430 (= res!871342 (not (= (select (arr!42398 _keys!1628) from!2020) k!1175)))))

(declare-fun mapNonEmpty!54766 () Bool)

(declare-fun mapRes!54766 () Bool)

(declare-fun tp!104406 () Bool)

(declare-fun e!748576 () Bool)

(assert (=> mapNonEmpty!54766 (= mapRes!54766 (and tp!104406 e!748576))))

(declare-fun mapValue!54766 () ValueCell!16814)

(declare-fun mapKey!54766 () (_ BitVec 32))

(declare-fun mapRest!54766 () (Array (_ BitVec 32) ValueCell!16814))

(assert (=> mapNonEmpty!54766 (= (arr!42399 _values!1354) (store mapRest!54766 mapKey!54766 mapValue!54766))))

(declare-fun b!1312431 () Bool)

(assert (=> b!1312431 (= e!748574 (and e!748573 mapRes!54766))))

(declare-fun condMapEmpty!54766 () Bool)

(declare-fun mapDefault!54766 () ValueCell!16814)

