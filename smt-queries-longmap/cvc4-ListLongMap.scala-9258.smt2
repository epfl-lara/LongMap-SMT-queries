; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110900 () Bool)

(assert start!110900)

(declare-fun b_free!29735 () Bool)

(declare-fun b_next!29735 () Bool)

(assert (=> start!110900 (= b_free!29735 (not b_next!29735))))

(declare-fun tp!104526 () Bool)

(declare-fun b_and!47943 () Bool)

(assert (=> start!110900 (= tp!104526 b_and!47943)))

(declare-fun b!1312931 () Bool)

(declare-fun e!748875 () Bool)

(assert (=> b!1312931 (= e!748875 false)))

(declare-fun lt!585621 () Bool)

(declare-datatypes ((array!87912 0))(
  ( (array!87913 (arr!42436 (Array (_ BitVec 32) (_ BitVec 64))) (size!42986 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87912)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52389 0))(
  ( (V!52390 (val!17807 Int)) )
))
(declare-fun minValue!1296 () V!52389)

(declare-datatypes ((ValueCell!16834 0))(
  ( (ValueCellFull!16834 (v!20434 V!52389)) (EmptyCell!16834) )
))
(declare-datatypes ((array!87914 0))(
  ( (array!87915 (arr!42437 (Array (_ BitVec 32) ValueCell!16834)) (size!42987 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87914)

(declare-fun zeroValue!1296 () V!52389)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22954 0))(
  ( (tuple2!22955 (_1!11488 (_ BitVec 64)) (_2!11488 V!52389)) )
))
(declare-datatypes ((List!30091 0))(
  ( (Nil!30088) (Cons!30087 (h!31296 tuple2!22954) (t!43697 List!30091)) )
))
(declare-datatypes ((ListLongMap!20611 0))(
  ( (ListLongMap!20612 (toList!10321 List!30091)) )
))
(declare-fun contains!8471 (ListLongMap!20611 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5334 (array!87912 array!87914 (_ BitVec 32) (_ BitVec 32) V!52389 V!52389 (_ BitVec 32) Int) ListLongMap!20611)

(assert (=> b!1312931 (= lt!585621 (contains!8471 (getCurrentListMap!5334 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1312932 () Bool)

(declare-fun res!871671 () Bool)

(assert (=> b!1312932 (=> (not res!871671) (not e!748875))))

(declare-datatypes ((List!30092 0))(
  ( (Nil!30089) (Cons!30088 (h!31297 (_ BitVec 64)) (t!43698 List!30092)) )
))
(declare-fun arrayNoDuplicates!0 (array!87912 (_ BitVec 32) List!30092) Bool)

(assert (=> b!1312932 (= res!871671 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30089))))

(declare-fun mapNonEmpty!54826 () Bool)

(declare-fun mapRes!54826 () Bool)

(declare-fun tp!104527 () Bool)

(declare-fun e!748874 () Bool)

(assert (=> mapNonEmpty!54826 (= mapRes!54826 (and tp!104527 e!748874))))

(declare-fun mapKey!54826 () (_ BitVec 32))

(declare-fun mapValue!54826 () ValueCell!16834)

(declare-fun mapRest!54826 () (Array (_ BitVec 32) ValueCell!16834))

(assert (=> mapNonEmpty!54826 (= (arr!42437 _values!1354) (store mapRest!54826 mapKey!54826 mapValue!54826))))

(declare-fun b!1312933 () Bool)

(declare-fun res!871669 () Bool)

(assert (=> b!1312933 (=> (not res!871669) (not e!748875))))

(assert (=> b!1312933 (= res!871669 (and (= (size!42987 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42986 _keys!1628) (size!42987 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312934 () Bool)

(declare-fun res!871670 () Bool)

(assert (=> b!1312934 (=> (not res!871670) (not e!748875))))

(assert (=> b!1312934 (= res!871670 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42986 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!871668 () Bool)

(assert (=> start!110900 (=> (not res!871668) (not e!748875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110900 (= res!871668 (validMask!0 mask!2040))))

(assert (=> start!110900 e!748875))

(assert (=> start!110900 tp!104526))

(declare-fun array_inv!32057 (array!87912) Bool)

(assert (=> start!110900 (array_inv!32057 _keys!1628)))

(assert (=> start!110900 true))

(declare-fun tp_is_empty!35465 () Bool)

(assert (=> start!110900 tp_is_empty!35465))

(declare-fun e!748876 () Bool)

(declare-fun array_inv!32058 (array!87914) Bool)

(assert (=> start!110900 (and (array_inv!32058 _values!1354) e!748876)))

(declare-fun b!1312935 () Bool)

(declare-fun res!871667 () Bool)

(assert (=> b!1312935 (=> (not res!871667) (not e!748875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87912 (_ BitVec 32)) Bool)

(assert (=> b!1312935 (= res!871667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312936 () Bool)

(assert (=> b!1312936 (= e!748874 tp_is_empty!35465)))

(declare-fun b!1312937 () Bool)

(declare-fun e!748873 () Bool)

(assert (=> b!1312937 (= e!748876 (and e!748873 mapRes!54826))))

(declare-fun condMapEmpty!54826 () Bool)

(declare-fun mapDefault!54826 () ValueCell!16834)

