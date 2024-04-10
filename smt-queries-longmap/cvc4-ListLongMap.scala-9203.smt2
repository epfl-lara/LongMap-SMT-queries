; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110570 () Bool)

(assert start!110570)

(declare-fun b_free!29405 () Bool)

(declare-fun b_next!29405 () Bool)

(assert (=> start!110570 (= b_free!29405 (not b_next!29405))))

(declare-fun tp!103537 () Bool)

(declare-fun b_and!47613 () Bool)

(assert (=> start!110570 (= tp!103537 b_and!47613)))

(declare-fun b!1308067 () Bool)

(declare-fun e!746402 () Bool)

(assert (=> b!1308067 (= e!746402 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87268 0))(
  ( (array!87269 (arr!42114 (Array (_ BitVec 32) (_ BitVec 64))) (size!42664 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87268)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!51949 0))(
  ( (V!51950 (val!17642 Int)) )
))
(declare-fun minValue!1296 () V!51949)

(declare-datatypes ((ValueCell!16669 0))(
  ( (ValueCellFull!16669 (v!20269 V!51949)) (EmptyCell!16669) )
))
(declare-datatypes ((array!87270 0))(
  ( (array!87271 (arr!42115 (Array (_ BitVec 32) ValueCell!16669)) (size!42665 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87270)

(declare-fun zeroValue!1296 () V!51949)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22714 0))(
  ( (tuple2!22715 (_1!11368 (_ BitVec 64)) (_2!11368 V!51949)) )
))
(declare-datatypes ((List!29856 0))(
  ( (Nil!29853) (Cons!29852 (h!31061 tuple2!22714) (t!43462 List!29856)) )
))
(declare-datatypes ((ListLongMap!20371 0))(
  ( (ListLongMap!20372 (toList!10201 List!29856)) )
))
(declare-fun contains!8351 (ListLongMap!20371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5214 (array!87268 array!87270 (_ BitVec 32) (_ BitVec 32) V!51949 V!51949 (_ BitVec 32) Int) ListLongMap!20371)

(assert (=> b!1308067 (contains!8351 (getCurrentListMap!5214 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43282 0))(
  ( (Unit!43283) )
))
(declare-fun lt!585126 () Unit!43282)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!5 (array!87268 array!87270 (_ BitVec 32) (_ BitVec 32) V!51949 V!51949 (_ BitVec 64) (_ BitVec 32) Int) Unit!43282)

(assert (=> b!1308067 (= lt!585126 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!5 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun mapIsEmpty!54331 () Bool)

(declare-fun mapRes!54331 () Bool)

(assert (=> mapIsEmpty!54331 mapRes!54331))

(declare-fun b!1308068 () Bool)

(declare-fun e!746399 () Bool)

(declare-fun tp_is_empty!35135 () Bool)

(assert (=> b!1308068 (= e!746399 tp_is_empty!35135)))

(declare-fun b!1308069 () Bool)

(declare-fun res!868290 () Bool)

(assert (=> b!1308069 (=> (not res!868290) (not e!746402))))

(declare-datatypes ((List!29857 0))(
  ( (Nil!29854) (Cons!29853 (h!31062 (_ BitVec 64)) (t!43463 List!29857)) )
))
(declare-fun arrayNoDuplicates!0 (array!87268 (_ BitVec 32) List!29857) Bool)

(assert (=> b!1308069 (= res!868290 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29854))))

(declare-fun b!1308070 () Bool)

(declare-fun e!746398 () Bool)

(assert (=> b!1308070 (= e!746398 tp_is_empty!35135)))

(declare-fun b!1308071 () Bool)

(declare-fun res!868288 () Bool)

(assert (=> b!1308071 (=> (not res!868288) (not e!746402))))

(assert (=> b!1308071 (= res!868288 (and (= (size!42665 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42664 _keys!1628) (size!42665 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308072 () Bool)

(declare-fun res!868294 () Bool)

(assert (=> b!1308072 (=> (not res!868294) (not e!746402))))

(assert (=> b!1308072 (= res!868294 (not (= (select (arr!42114 _keys!1628) from!2020) k!1175)))))

(declare-fun res!868295 () Bool)

(assert (=> start!110570 (=> (not res!868295) (not e!746402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110570 (= res!868295 (validMask!0 mask!2040))))

(assert (=> start!110570 e!746402))

(assert (=> start!110570 tp!103537))

(declare-fun array_inv!31829 (array!87268) Bool)

(assert (=> start!110570 (array_inv!31829 _keys!1628)))

(assert (=> start!110570 true))

(assert (=> start!110570 tp_is_empty!35135))

(declare-fun e!746400 () Bool)

(declare-fun array_inv!31830 (array!87270) Bool)

(assert (=> start!110570 (and (array_inv!31830 _values!1354) e!746400)))

(declare-fun mapNonEmpty!54331 () Bool)

(declare-fun tp!103536 () Bool)

(assert (=> mapNonEmpty!54331 (= mapRes!54331 (and tp!103536 e!746399))))

(declare-fun mapRest!54331 () (Array (_ BitVec 32) ValueCell!16669))

(declare-fun mapValue!54331 () ValueCell!16669)

(declare-fun mapKey!54331 () (_ BitVec 32))

(assert (=> mapNonEmpty!54331 (= (arr!42115 _values!1354) (store mapRest!54331 mapKey!54331 mapValue!54331))))

(declare-fun b!1308073 () Bool)

(declare-fun res!868292 () Bool)

(assert (=> b!1308073 (=> (not res!868292) (not e!746402))))

(assert (=> b!1308073 (= res!868292 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42664 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308074 () Bool)

(declare-fun res!868293 () Bool)

(assert (=> b!1308074 (=> (not res!868293) (not e!746402))))

(assert (=> b!1308074 (= res!868293 (contains!8351 (getCurrentListMap!5214 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1308075 () Bool)

(declare-fun res!868296 () Bool)

(assert (=> b!1308075 (=> (not res!868296) (not e!746402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87268 (_ BitVec 32)) Bool)

(assert (=> b!1308075 (= res!868296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308076 () Bool)

(declare-fun res!868289 () Bool)

(assert (=> b!1308076 (=> (not res!868289) (not e!746402))))

(assert (=> b!1308076 (= res!868289 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308077 () Bool)

(assert (=> b!1308077 (= e!746400 (and e!746398 mapRes!54331))))

(declare-fun condMapEmpty!54331 () Bool)

(declare-fun mapDefault!54331 () ValueCell!16669)

