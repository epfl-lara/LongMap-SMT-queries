; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110908 () Bool)

(assert start!110908)

(declare-fun b_free!29743 () Bool)

(declare-fun b_next!29743 () Bool)

(assert (=> start!110908 (= b_free!29743 (not b_next!29743))))

(declare-fun tp!104550 () Bool)

(declare-fun b_and!47951 () Bool)

(assert (=> start!110908 (= tp!104550 b_and!47951)))

(declare-fun b!1313027 () Bool)

(declare-fun e!748937 () Bool)

(assert (=> b!1313027 (= e!748937 false)))

(declare-datatypes ((array!87928 0))(
  ( (array!87929 (arr!42444 (Array (_ BitVec 32) (_ BitVec 64))) (size!42994 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87928)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52401 0))(
  ( (V!52402 (val!17811 Int)) )
))
(declare-fun minValue!1296 () V!52401)

(declare-datatypes ((ValueCell!16838 0))(
  ( (ValueCellFull!16838 (v!20438 V!52401)) (EmptyCell!16838) )
))
(declare-datatypes ((array!87930 0))(
  ( (array!87931 (arr!42445 (Array (_ BitVec 32) ValueCell!16838)) (size!42995 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87930)

(declare-fun zeroValue!1296 () V!52401)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585633 () Bool)

(declare-datatypes ((tuple2!22962 0))(
  ( (tuple2!22963 (_1!11492 (_ BitVec 64)) (_2!11492 V!52401)) )
))
(declare-datatypes ((List!30098 0))(
  ( (Nil!30095) (Cons!30094 (h!31303 tuple2!22962) (t!43704 List!30098)) )
))
(declare-datatypes ((ListLongMap!20619 0))(
  ( (ListLongMap!20620 (toList!10325 List!30098)) )
))
(declare-fun contains!8475 (ListLongMap!20619 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5338 (array!87928 array!87930 (_ BitVec 32) (_ BitVec 32) V!52401 V!52401 (_ BitVec 32) Int) ListLongMap!20619)

(assert (=> b!1313027 (= lt!585633 (contains!8475 (getCurrentListMap!5338 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1313028 () Bool)

(declare-fun e!748934 () Bool)

(declare-fun tp_is_empty!35473 () Bool)

(assert (=> b!1313028 (= e!748934 tp_is_empty!35473)))

(declare-fun b!1313030 () Bool)

(declare-fun res!871728 () Bool)

(assert (=> b!1313030 (=> (not res!871728) (not e!748937))))

(declare-datatypes ((List!30099 0))(
  ( (Nil!30096) (Cons!30095 (h!31304 (_ BitVec 64)) (t!43705 List!30099)) )
))
(declare-fun arrayNoDuplicates!0 (array!87928 (_ BitVec 32) List!30099) Bool)

(assert (=> b!1313030 (= res!871728 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30096))))

(declare-fun b!1313031 () Bool)

(declare-fun res!871731 () Bool)

(assert (=> b!1313031 (=> (not res!871731) (not e!748937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87928 (_ BitVec 32)) Bool)

(assert (=> b!1313031 (= res!871731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313032 () Bool)

(declare-fun res!871729 () Bool)

(assert (=> b!1313032 (=> (not res!871729) (not e!748937))))

(assert (=> b!1313032 (= res!871729 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42994 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313029 () Bool)

(declare-fun e!748933 () Bool)

(assert (=> b!1313029 (= e!748933 tp_is_empty!35473)))

(declare-fun res!871727 () Bool)

(assert (=> start!110908 (=> (not res!871727) (not e!748937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110908 (= res!871727 (validMask!0 mask!2040))))

(assert (=> start!110908 e!748937))

(assert (=> start!110908 tp!104550))

(declare-fun array_inv!32063 (array!87928) Bool)

(assert (=> start!110908 (array_inv!32063 _keys!1628)))

(assert (=> start!110908 true))

(assert (=> start!110908 tp_is_empty!35473))

(declare-fun e!748936 () Bool)

(declare-fun array_inv!32064 (array!87930) Bool)

(assert (=> start!110908 (and (array_inv!32064 _values!1354) e!748936)))

(declare-fun mapIsEmpty!54838 () Bool)

(declare-fun mapRes!54838 () Bool)

(assert (=> mapIsEmpty!54838 mapRes!54838))

(declare-fun mapNonEmpty!54838 () Bool)

(declare-fun tp!104551 () Bool)

(assert (=> mapNonEmpty!54838 (= mapRes!54838 (and tp!104551 e!748934))))

(declare-fun mapRest!54838 () (Array (_ BitVec 32) ValueCell!16838))

(declare-fun mapKey!54838 () (_ BitVec 32))

(declare-fun mapValue!54838 () ValueCell!16838)

(assert (=> mapNonEmpty!54838 (= (arr!42445 _values!1354) (store mapRest!54838 mapKey!54838 mapValue!54838))))

(declare-fun b!1313033 () Bool)

(declare-fun res!871730 () Bool)

(assert (=> b!1313033 (=> (not res!871730) (not e!748937))))

(assert (=> b!1313033 (= res!871730 (and (= (size!42995 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42994 _keys!1628) (size!42995 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313034 () Bool)

(assert (=> b!1313034 (= e!748936 (and e!748933 mapRes!54838))))

(declare-fun condMapEmpty!54838 () Bool)

(declare-fun mapDefault!54838 () ValueCell!16838)

