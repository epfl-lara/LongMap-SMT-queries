; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110660 () Bool)

(assert start!110660)

(declare-fun b_free!29495 () Bool)

(declare-fun b_next!29495 () Bool)

(assert (=> start!110660 (= b_free!29495 (not b_next!29495))))

(declare-fun tp!103807 () Bool)

(declare-fun b_and!47703 () Bool)

(assert (=> start!110660 (= tp!103807 b_and!47703)))

(declare-fun b!1309403 () Bool)

(declare-fun res!869220 () Bool)

(declare-fun e!747077 () Bool)

(assert (=> b!1309403 (=> (not res!869220) (not e!747077))))

(declare-datatypes ((array!87442 0))(
  ( (array!87443 (arr!42201 (Array (_ BitVec 32) (_ BitVec 64))) (size!42751 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87442)

(declare-datatypes ((List!29918 0))(
  ( (Nil!29915) (Cons!29914 (h!31123 (_ BitVec 64)) (t!43524 List!29918)) )
))
(declare-fun arrayNoDuplicates!0 (array!87442 (_ BitVec 32) List!29918) Bool)

(assert (=> b!1309403 (= res!869220 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29915))))

(declare-fun mapIsEmpty!54466 () Bool)

(declare-fun mapRes!54466 () Bool)

(assert (=> mapIsEmpty!54466 mapRes!54466))

(declare-fun mapNonEmpty!54466 () Bool)

(declare-fun tp!103806 () Bool)

(declare-fun e!747076 () Bool)

(assert (=> mapNonEmpty!54466 (= mapRes!54466 (and tp!103806 e!747076))))

(declare-fun mapKey!54466 () (_ BitVec 32))

(declare-datatypes ((V!52069 0))(
  ( (V!52070 (val!17687 Int)) )
))
(declare-datatypes ((ValueCell!16714 0))(
  ( (ValueCellFull!16714 (v!20314 V!52069)) (EmptyCell!16714) )
))
(declare-datatypes ((array!87444 0))(
  ( (array!87445 (arr!42202 (Array (_ BitVec 32) ValueCell!16714)) (size!42752 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87444)

(declare-fun mapRest!54466 () (Array (_ BitVec 32) ValueCell!16714))

(declare-fun mapValue!54466 () ValueCell!16714)

(assert (=> mapNonEmpty!54466 (= (arr!42202 _values!1354) (store mapRest!54466 mapKey!54466 mapValue!54466))))

(declare-fun b!1309404 () Bool)

(declare-fun res!869221 () Bool)

(assert (=> b!1309404 (=> (not res!869221) (not e!747077))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87442 (_ BitVec 32)) Bool)

(assert (=> b!1309404 (= res!869221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309405 () Bool)

(declare-fun res!869222 () Bool)

(assert (=> b!1309405 (=> (not res!869222) (not e!747077))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309405 (= res!869222 (and (= (size!42752 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42751 _keys!1628) (size!42752 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309406 () Bool)

(declare-fun res!869219 () Bool)

(assert (=> b!1309406 (=> (not res!869219) (not e!747077))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309406 (= res!869219 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42751 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309407 () Bool)

(declare-fun e!747075 () Bool)

(declare-fun tp_is_empty!35225 () Bool)

(assert (=> b!1309407 (= e!747075 tp_is_empty!35225)))

(declare-fun b!1309408 () Bool)

(assert (=> b!1309408 (= e!747076 tp_is_empty!35225)))

(declare-fun b!1309409 () Bool)

(assert (=> b!1309409 (= e!747077 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585261 () Bool)

(declare-fun minValue!1296 () V!52069)

(declare-fun zeroValue!1296 () V!52069)

(declare-datatypes ((tuple2!22774 0))(
  ( (tuple2!22775 (_1!11398 (_ BitVec 64)) (_2!11398 V!52069)) )
))
(declare-datatypes ((List!29919 0))(
  ( (Nil!29916) (Cons!29915 (h!31124 tuple2!22774) (t!43525 List!29919)) )
))
(declare-datatypes ((ListLongMap!20431 0))(
  ( (ListLongMap!20432 (toList!10231 List!29919)) )
))
(declare-fun contains!8381 (ListLongMap!20431 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5244 (array!87442 array!87444 (_ BitVec 32) (_ BitVec 32) V!52069 V!52069 (_ BitVec 32) Int) ListLongMap!20431)

(assert (=> b!1309409 (= lt!585261 (contains!8381 (getCurrentListMap!5244 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1309410 () Bool)

(declare-fun e!747074 () Bool)

(assert (=> b!1309410 (= e!747074 (and e!747075 mapRes!54466))))

(declare-fun condMapEmpty!54466 () Bool)

(declare-fun mapDefault!54466 () ValueCell!16714)

