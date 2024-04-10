; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110854 () Bool)

(assert start!110854)

(declare-fun b_free!29689 () Bool)

(declare-fun b_next!29689 () Bool)

(assert (=> start!110854 (= b_free!29689 (not b_next!29689))))

(declare-fun tp!104388 () Bool)

(declare-fun b_and!47897 () Bool)

(assert (=> start!110854 (= tp!104388 b_and!47897)))

(declare-fun res!871261 () Bool)

(declare-fun e!748531 () Bool)

(assert (=> start!110854 (=> (not res!871261) (not e!748531))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110854 (= res!871261 (validMask!0 mask!2040))))

(assert (=> start!110854 e!748531))

(assert (=> start!110854 tp!104388))

(declare-datatypes ((array!87826 0))(
  ( (array!87827 (arr!42393 (Array (_ BitVec 32) (_ BitVec 64))) (size!42943 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87826)

(declare-fun array_inv!32033 (array!87826) Bool)

(assert (=> start!110854 (array_inv!32033 _keys!1628)))

(assert (=> start!110854 true))

(declare-fun tp_is_empty!35419 () Bool)

(assert (=> start!110854 tp_is_empty!35419))

(declare-datatypes ((V!52329 0))(
  ( (V!52330 (val!17784 Int)) )
))
(declare-datatypes ((ValueCell!16811 0))(
  ( (ValueCellFull!16811 (v!20411 V!52329)) (EmptyCell!16811) )
))
(declare-datatypes ((array!87828 0))(
  ( (array!87829 (arr!42394 (Array (_ BitVec 32) ValueCell!16811)) (size!42944 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87828)

(declare-fun e!748529 () Bool)

(declare-fun array_inv!32034 (array!87828) Bool)

(assert (=> start!110854 (and (array_inv!32034 _values!1354) e!748529)))

(declare-fun b!1312315 () Bool)

(assert (=> b!1312315 (= e!748531 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52329)

(declare-fun zeroValue!1296 () V!52329)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22924 0))(
  ( (tuple2!22925 (_1!11473 (_ BitVec 64)) (_2!11473 V!52329)) )
))
(declare-datatypes ((List!30062 0))(
  ( (Nil!30059) (Cons!30058 (h!31267 tuple2!22924) (t!43668 List!30062)) )
))
(declare-datatypes ((ListLongMap!20581 0))(
  ( (ListLongMap!20582 (toList!10306 List!30062)) )
))
(declare-fun contains!8456 (ListLongMap!20581 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5319 (array!87826 array!87828 (_ BitVec 32) (_ BitVec 32) V!52329 V!52329 (_ BitVec 32) Int) ListLongMap!20581)

(assert (=> b!1312315 (contains!8456 (getCurrentListMap!5319 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43378 0))(
  ( (Unit!43379) )
))
(declare-fun lt!585552 () Unit!43378)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!16 (array!87826 array!87828 (_ BitVec 32) (_ BitVec 32) V!52329 V!52329 (_ BitVec 64) (_ BitVec 32) Int) Unit!43378)

(assert (=> b!1312315 (= lt!585552 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!16 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun mapNonEmpty!54757 () Bool)

(declare-fun mapRes!54757 () Bool)

(declare-fun tp!104389 () Bool)

(declare-fun e!748532 () Bool)

(assert (=> mapNonEmpty!54757 (= mapRes!54757 (and tp!104389 e!748532))))

(declare-fun mapRest!54757 () (Array (_ BitVec 32) ValueCell!16811))

(declare-fun mapKey!54757 () (_ BitVec 32))

(declare-fun mapValue!54757 () ValueCell!16811)

(assert (=> mapNonEmpty!54757 (= (arr!42394 _values!1354) (store mapRest!54757 mapKey!54757 mapValue!54757))))

(declare-fun b!1312316 () Bool)

(declare-fun res!871262 () Bool)

(assert (=> b!1312316 (=> (not res!871262) (not e!748531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312316 (= res!871262 (validKeyInArray!0 (select (arr!42393 _keys!1628) from!2020)))))

(declare-fun b!1312317 () Bool)

(declare-fun res!871266 () Bool)

(assert (=> b!1312317 (=> (not res!871266) (not e!748531))))

(assert (=> b!1312317 (= res!871266 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312318 () Bool)

(declare-fun res!871258 () Bool)

(assert (=> b!1312318 (=> (not res!871258) (not e!748531))))

(assert (=> b!1312318 (= res!871258 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42943 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54757 () Bool)

(assert (=> mapIsEmpty!54757 mapRes!54757))

(declare-fun b!1312319 () Bool)

(declare-fun res!871259 () Bool)

(assert (=> b!1312319 (=> (not res!871259) (not e!748531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87826 (_ BitVec 32)) Bool)

(assert (=> b!1312319 (= res!871259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312320 () Bool)

(declare-fun res!871265 () Bool)

(assert (=> b!1312320 (=> (not res!871265) (not e!748531))))

(declare-datatypes ((List!30063 0))(
  ( (Nil!30060) (Cons!30059 (h!31268 (_ BitVec 64)) (t!43669 List!30063)) )
))
(declare-fun arrayNoDuplicates!0 (array!87826 (_ BitVec 32) List!30063) Bool)

(assert (=> b!1312320 (= res!871265 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30060))))

(declare-fun b!1312321 () Bool)

(declare-fun res!871260 () Bool)

(assert (=> b!1312321 (=> (not res!871260) (not e!748531))))

(assert (=> b!1312321 (= res!871260 (not (= (select (arr!42393 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1312322 () Bool)

(declare-fun res!871263 () Bool)

(assert (=> b!1312322 (=> (not res!871263) (not e!748531))))

(assert (=> b!1312322 (= res!871263 (and (= (size!42944 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42943 _keys!1628) (size!42944 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312323 () Bool)

(declare-fun res!871264 () Bool)

(assert (=> b!1312323 (=> (not res!871264) (not e!748531))))

(assert (=> b!1312323 (= res!871264 (contains!8456 (getCurrentListMap!5319 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1312324 () Bool)

(assert (=> b!1312324 (= e!748532 tp_is_empty!35419)))

(declare-fun b!1312325 () Bool)

(declare-fun e!748528 () Bool)

(assert (=> b!1312325 (= e!748528 tp_is_empty!35419)))

(declare-fun b!1312326 () Bool)

(assert (=> b!1312326 (= e!748529 (and e!748528 mapRes!54757))))

(declare-fun condMapEmpty!54757 () Bool)

(declare-fun mapDefault!54757 () ValueCell!16811)

