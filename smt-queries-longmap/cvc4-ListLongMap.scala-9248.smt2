; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110840 () Bool)

(assert start!110840)

(declare-fun b_free!29675 () Bool)

(declare-fun b_next!29675 () Bool)

(assert (=> start!110840 (= b_free!29675 (not b_next!29675))))

(declare-fun tp!104346 () Bool)

(declare-fun b_and!47883 () Bool)

(assert (=> start!110840 (= tp!104346 b_and!47883)))

(declare-fun mapIsEmpty!54736 () Bool)

(declare-fun mapRes!54736 () Bool)

(assert (=> mapIsEmpty!54736 mapRes!54736))

(declare-fun b!1312063 () Bool)

(declare-fun res!871074 () Bool)

(declare-fun e!748425 () Bool)

(assert (=> b!1312063 (=> (not res!871074) (not e!748425))))

(declare-datatypes ((array!87798 0))(
  ( (array!87799 (arr!42379 (Array (_ BitVec 32) (_ BitVec 64))) (size!42929 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87798)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87798 (_ BitVec 32)) Bool)

(assert (=> b!1312063 (= res!871074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312064 () Bool)

(declare-fun e!748424 () Bool)

(declare-fun tp_is_empty!35405 () Bool)

(assert (=> b!1312064 (= e!748424 tp_is_empty!35405)))

(declare-fun b!1312065 () Bool)

(declare-fun res!871071 () Bool)

(assert (=> b!1312065 (=> (not res!871071) (not e!748425))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312065 (= res!871071 (validKeyInArray!0 (select (arr!42379 _keys!1628) from!2020)))))

(declare-fun res!871076 () Bool)

(assert (=> start!110840 (=> (not res!871076) (not e!748425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110840 (= res!871076 (validMask!0 mask!2040))))

(assert (=> start!110840 e!748425))

(assert (=> start!110840 tp!104346))

(declare-fun array_inv!32025 (array!87798) Bool)

(assert (=> start!110840 (array_inv!32025 _keys!1628)))

(assert (=> start!110840 true))

(assert (=> start!110840 tp_is_empty!35405))

(declare-datatypes ((V!52309 0))(
  ( (V!52310 (val!17777 Int)) )
))
(declare-datatypes ((ValueCell!16804 0))(
  ( (ValueCellFull!16804 (v!20404 V!52309)) (EmptyCell!16804) )
))
(declare-datatypes ((array!87800 0))(
  ( (array!87801 (arr!42380 (Array (_ BitVec 32) ValueCell!16804)) (size!42930 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87800)

(declare-fun e!748427 () Bool)

(declare-fun array_inv!32026 (array!87800) Bool)

(assert (=> start!110840 (and (array_inv!32026 _values!1354) e!748427)))

(declare-fun b!1312066 () Bool)

(declare-fun res!871077 () Bool)

(assert (=> b!1312066 (=> (not res!871077) (not e!748425))))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1312066 (= res!871077 (not (= (select (arr!42379 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1312067 () Bool)

(declare-fun res!871073 () Bool)

(assert (=> b!1312067 (=> (not res!871073) (not e!748425))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312067 (= res!871073 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312068 () Bool)

(declare-fun res!871070 () Bool)

(assert (=> b!1312068 (=> (not res!871070) (not e!748425))))

(assert (=> b!1312068 (= res!871070 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42929 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312069 () Bool)

(declare-fun res!871072 () Bool)

(assert (=> b!1312069 (=> (not res!871072) (not e!748425))))

(declare-datatypes ((List!30051 0))(
  ( (Nil!30048) (Cons!30047 (h!31256 (_ BitVec 64)) (t!43657 List!30051)) )
))
(declare-fun arrayNoDuplicates!0 (array!87798 (_ BitVec 32) List!30051) Bool)

(assert (=> b!1312069 (= res!871072 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30048))))

(declare-fun b!1312070 () Bool)

(assert (=> b!1312070 (= e!748425 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52309)

(declare-fun zeroValue!1296 () V!52309)

(declare-datatypes ((tuple2!22912 0))(
  ( (tuple2!22913 (_1!11467 (_ BitVec 64)) (_2!11467 V!52309)) )
))
(declare-datatypes ((List!30052 0))(
  ( (Nil!30049) (Cons!30048 (h!31257 tuple2!22912) (t!43658 List!30052)) )
))
(declare-datatypes ((ListLongMap!20569 0))(
  ( (ListLongMap!20570 (toList!10300 List!30052)) )
))
(declare-fun contains!8450 (ListLongMap!20569 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5313 (array!87798 array!87800 (_ BitVec 32) (_ BitVec 32) V!52309 V!52309 (_ BitVec 32) Int) ListLongMap!20569)

(assert (=> b!1312070 (contains!8450 (getCurrentListMap!5313 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43366 0))(
  ( (Unit!43367) )
))
(declare-fun lt!585531 () Unit!43366)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!10 (array!87798 array!87800 (_ BitVec 32) (_ BitVec 32) V!52309 V!52309 (_ BitVec 64) (_ BitVec 32) Int) Unit!43366)

(assert (=> b!1312070 (= lt!585531 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!10 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312071 () Bool)

(declare-fun e!748426 () Bool)

(assert (=> b!1312071 (= e!748426 tp_is_empty!35405)))

(declare-fun b!1312072 () Bool)

(declare-fun res!871075 () Bool)

(assert (=> b!1312072 (=> (not res!871075) (not e!748425))))

(assert (=> b!1312072 (= res!871075 (and (= (size!42930 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42929 _keys!1628) (size!42930 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312073 () Bool)

(declare-fun res!871069 () Bool)

(assert (=> b!1312073 (=> (not res!871069) (not e!748425))))

(assert (=> b!1312073 (= res!871069 (contains!8450 (getCurrentListMap!5313 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1312074 () Bool)

(assert (=> b!1312074 (= e!748427 (and e!748424 mapRes!54736))))

(declare-fun condMapEmpty!54736 () Bool)

(declare-fun mapDefault!54736 () ValueCell!16804)

