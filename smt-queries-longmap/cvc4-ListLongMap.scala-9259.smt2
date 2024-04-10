; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110906 () Bool)

(assert start!110906)

(declare-fun b_free!29741 () Bool)

(declare-fun b_next!29741 () Bool)

(assert (=> start!110906 (= b_free!29741 (not b_next!29741))))

(declare-fun tp!104544 () Bool)

(declare-fun b_and!47949 () Bool)

(assert (=> start!110906 (= tp!104544 b_and!47949)))

(declare-fun mapIsEmpty!54835 () Bool)

(declare-fun mapRes!54835 () Bool)

(assert (=> mapIsEmpty!54835 mapRes!54835))

(declare-fun res!871712 () Bool)

(declare-fun e!748920 () Bool)

(assert (=> start!110906 (=> (not res!871712) (not e!748920))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110906 (= res!871712 (validMask!0 mask!2040))))

(assert (=> start!110906 e!748920))

(assert (=> start!110906 tp!104544))

(declare-datatypes ((array!87924 0))(
  ( (array!87925 (arr!42442 (Array (_ BitVec 32) (_ BitVec 64))) (size!42992 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87924)

(declare-fun array_inv!32061 (array!87924) Bool)

(assert (=> start!110906 (array_inv!32061 _keys!1628)))

(assert (=> start!110906 true))

(declare-fun tp_is_empty!35471 () Bool)

(assert (=> start!110906 tp_is_empty!35471))

(declare-datatypes ((V!52397 0))(
  ( (V!52398 (val!17810 Int)) )
))
(declare-datatypes ((ValueCell!16837 0))(
  ( (ValueCellFull!16837 (v!20437 V!52397)) (EmptyCell!16837) )
))
(declare-datatypes ((array!87926 0))(
  ( (array!87927 (arr!42443 (Array (_ BitVec 32) ValueCell!16837)) (size!42993 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87926)

(declare-fun e!748919 () Bool)

(declare-fun array_inv!32062 (array!87926) Bool)

(assert (=> start!110906 (and (array_inv!32062 _values!1354) e!748919)))

(declare-fun b!1313003 () Bool)

(assert (=> b!1313003 (= e!748920 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52397)

(declare-fun zeroValue!1296 () V!52397)

(declare-fun lt!585630 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22960 0))(
  ( (tuple2!22961 (_1!11491 (_ BitVec 64)) (_2!11491 V!52397)) )
))
(declare-datatypes ((List!30096 0))(
  ( (Nil!30093) (Cons!30092 (h!31301 tuple2!22960) (t!43702 List!30096)) )
))
(declare-datatypes ((ListLongMap!20617 0))(
  ( (ListLongMap!20618 (toList!10324 List!30096)) )
))
(declare-fun contains!8474 (ListLongMap!20617 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5337 (array!87924 array!87926 (_ BitVec 32) (_ BitVec 32) V!52397 V!52397 (_ BitVec 32) Int) ListLongMap!20617)

(assert (=> b!1313003 (= lt!585630 (contains!8474 (getCurrentListMap!5337 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1313004 () Bool)

(declare-fun e!748918 () Bool)

(assert (=> b!1313004 (= e!748918 tp_is_empty!35471)))

(declare-fun b!1313005 () Bool)

(declare-fun res!871716 () Bool)

(assert (=> b!1313005 (=> (not res!871716) (not e!748920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87924 (_ BitVec 32)) Bool)

(assert (=> b!1313005 (= res!871716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313006 () Bool)

(declare-fun res!871714 () Bool)

(assert (=> b!1313006 (=> (not res!871714) (not e!748920))))

(assert (=> b!1313006 (= res!871714 (and (= (size!42993 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42992 _keys!1628) (size!42993 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313007 () Bool)

(declare-fun res!871715 () Bool)

(assert (=> b!1313007 (=> (not res!871715) (not e!748920))))

(assert (=> b!1313007 (= res!871715 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42992 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54835 () Bool)

(declare-fun tp!104545 () Bool)

(assert (=> mapNonEmpty!54835 (= mapRes!54835 (and tp!104545 e!748918))))

(declare-fun mapRest!54835 () (Array (_ BitVec 32) ValueCell!16837))

(declare-fun mapKey!54835 () (_ BitVec 32))

(declare-fun mapValue!54835 () ValueCell!16837)

(assert (=> mapNonEmpty!54835 (= (arr!42443 _values!1354) (store mapRest!54835 mapKey!54835 mapValue!54835))))

(declare-fun b!1313008 () Bool)

(declare-fun e!748921 () Bool)

(assert (=> b!1313008 (= e!748921 tp_is_empty!35471)))

(declare-fun b!1313009 () Bool)

(declare-fun res!871713 () Bool)

(assert (=> b!1313009 (=> (not res!871713) (not e!748920))))

(declare-datatypes ((List!30097 0))(
  ( (Nil!30094) (Cons!30093 (h!31302 (_ BitVec 64)) (t!43703 List!30097)) )
))
(declare-fun arrayNoDuplicates!0 (array!87924 (_ BitVec 32) List!30097) Bool)

(assert (=> b!1313009 (= res!871713 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30094))))

(declare-fun b!1313010 () Bool)

(assert (=> b!1313010 (= e!748919 (and e!748921 mapRes!54835))))

(declare-fun condMapEmpty!54835 () Bool)

(declare-fun mapDefault!54835 () ValueCell!16837)

