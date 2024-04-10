; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110746 () Bool)

(assert start!110746)

(declare-fun b_free!29581 () Bool)

(declare-fun b_next!29581 () Bool)

(assert (=> start!110746 (= b_free!29581 (not b_next!29581))))

(declare-fun tp!104064 () Bool)

(declare-fun b_and!47789 () Bool)

(assert (=> start!110746 (= tp!104064 b_and!47789)))

(declare-fun b!1310759 () Bool)

(declare-fun e!747721 () Bool)

(assert (=> b!1310759 (= e!747721 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87610 0))(
  ( (array!87611 (arr!42285 (Array (_ BitVec 32) (_ BitVec 64))) (size!42835 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87610)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52185 0))(
  ( (V!52186 (val!17730 Int)) )
))
(declare-fun minValue!1296 () V!52185)

(declare-datatypes ((ValueCell!16757 0))(
  ( (ValueCellFull!16757 (v!20357 V!52185)) (EmptyCell!16757) )
))
(declare-datatypes ((array!87612 0))(
  ( (array!87613 (arr!42286 (Array (_ BitVec 32) ValueCell!16757)) (size!42836 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87612)

(declare-fun zeroValue!1296 () V!52185)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun lt!585390 () Bool)

(declare-datatypes ((tuple2!22848 0))(
  ( (tuple2!22849 (_1!11435 (_ BitVec 64)) (_2!11435 V!52185)) )
))
(declare-datatypes ((List!29987 0))(
  ( (Nil!29984) (Cons!29983 (h!31192 tuple2!22848) (t!43593 List!29987)) )
))
(declare-datatypes ((ListLongMap!20505 0))(
  ( (ListLongMap!20506 (toList!10268 List!29987)) )
))
(declare-fun contains!8418 (ListLongMap!20505 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5281 (array!87610 array!87612 (_ BitVec 32) (_ BitVec 32) V!52185 V!52185 (_ BitVec 32) Int) ListLongMap!20505)

(assert (=> b!1310759 (= lt!585390 (contains!8418 (getCurrentListMap!5281 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun res!870189 () Bool)

(assert (=> start!110746 (=> (not res!870189) (not e!747721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110746 (= res!870189 (validMask!0 mask!2040))))

(assert (=> start!110746 e!747721))

(assert (=> start!110746 tp!104064))

(declare-fun array_inv!31955 (array!87610) Bool)

(assert (=> start!110746 (array_inv!31955 _keys!1628)))

(assert (=> start!110746 true))

(declare-fun tp_is_empty!35311 () Bool)

(assert (=> start!110746 tp_is_empty!35311))

(declare-fun e!747720 () Bool)

(declare-fun array_inv!31956 (array!87612) Bool)

(assert (=> start!110746 (and (array_inv!31956 _values!1354) e!747720)))

(declare-fun b!1310760 () Bool)

(declare-fun e!747718 () Bool)

(assert (=> b!1310760 (= e!747718 tp_is_empty!35311)))

(declare-fun mapNonEmpty!54595 () Bool)

(declare-fun mapRes!54595 () Bool)

(declare-fun tp!104065 () Bool)

(assert (=> mapNonEmpty!54595 (= mapRes!54595 (and tp!104065 e!747718))))

(declare-fun mapValue!54595 () ValueCell!16757)

(declare-fun mapRest!54595 () (Array (_ BitVec 32) ValueCell!16757))

(declare-fun mapKey!54595 () (_ BitVec 32))

(assert (=> mapNonEmpty!54595 (= (arr!42286 _values!1354) (store mapRest!54595 mapKey!54595 mapValue!54595))))

(declare-fun b!1310761 () Bool)

(declare-fun res!870191 () Bool)

(assert (=> b!1310761 (=> (not res!870191) (not e!747721))))

(declare-datatypes ((List!29988 0))(
  ( (Nil!29985) (Cons!29984 (h!31193 (_ BitVec 64)) (t!43594 List!29988)) )
))
(declare-fun arrayNoDuplicates!0 (array!87610 (_ BitVec 32) List!29988) Bool)

(assert (=> b!1310761 (= res!870191 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29985))))

(declare-fun b!1310762 () Bool)

(declare-fun e!747722 () Bool)

(assert (=> b!1310762 (= e!747722 tp_is_empty!35311)))

(declare-fun mapIsEmpty!54595 () Bool)

(assert (=> mapIsEmpty!54595 mapRes!54595))

(declare-fun b!1310763 () Bool)

(declare-fun res!870192 () Bool)

(assert (=> b!1310763 (=> (not res!870192) (not e!747721))))

(assert (=> b!1310763 (= res!870192 (and (= (size!42836 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42835 _keys!1628) (size!42836 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310764 () Bool)

(declare-fun res!870188 () Bool)

(assert (=> b!1310764 (=> (not res!870188) (not e!747721))))

(assert (=> b!1310764 (= res!870188 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42835 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310765 () Bool)

(declare-fun res!870190 () Bool)

(assert (=> b!1310765 (=> (not res!870190) (not e!747721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87610 (_ BitVec 32)) Bool)

(assert (=> b!1310765 (= res!870190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310766 () Bool)

(assert (=> b!1310766 (= e!747720 (and e!747722 mapRes!54595))))

(declare-fun condMapEmpty!54595 () Bool)

(declare-fun mapDefault!54595 () ValueCell!16757)

