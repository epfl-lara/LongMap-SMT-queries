; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110726 () Bool)

(assert start!110726)

(declare-fun b_free!29561 () Bool)

(declare-fun b_next!29561 () Bool)

(assert (=> start!110726 (= b_free!29561 (not b_next!29561))))

(declare-fun tp!104004 () Bool)

(declare-fun b_and!47769 () Bool)

(assert (=> start!110726 (= tp!104004 b_and!47769)))

(declare-fun b!1310443 () Bool)

(declare-fun res!869964 () Bool)

(declare-fun e!747570 () Bool)

(assert (=> b!1310443 (=> (not res!869964) (not e!747570))))

(declare-datatypes ((array!87570 0))(
  ( (array!87571 (arr!42265 (Array (_ BitVec 32) (_ BitVec 64))) (size!42815 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87570)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87570 (_ BitVec 32)) Bool)

(assert (=> b!1310443 (= res!869964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310445 () Bool)

(declare-fun res!869968 () Bool)

(assert (=> b!1310445 (=> (not res!869968) (not e!747570))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310445 (= res!869968 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310446 () Bool)

(declare-fun res!869967 () Bool)

(assert (=> b!1310446 (=> (not res!869967) (not e!747570))))

(declare-datatypes ((List!29968 0))(
  ( (Nil!29965) (Cons!29964 (h!31173 (_ BitVec 64)) (t!43574 List!29968)) )
))
(declare-fun arrayNoDuplicates!0 (array!87570 (_ BitVec 32) List!29968) Bool)

(assert (=> b!1310446 (= res!869967 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29965))))

(declare-fun b!1310447 () Bool)

(declare-fun res!869970 () Bool)

(assert (=> b!1310447 (=> (not res!869970) (not e!747570))))

(declare-datatypes ((V!52157 0))(
  ( (V!52158 (val!17720 Int)) )
))
(declare-datatypes ((ValueCell!16747 0))(
  ( (ValueCellFull!16747 (v!20347 V!52157)) (EmptyCell!16747) )
))
(declare-datatypes ((array!87572 0))(
  ( (array!87573 (arr!42266 (Array (_ BitVec 32) ValueCell!16747)) (size!42816 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87572)

(assert (=> b!1310447 (= res!869970 (and (= (size!42816 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42815 _keys!1628) (size!42816 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!54565 () Bool)

(declare-fun mapRes!54565 () Bool)

(declare-fun tp!104005 () Bool)

(declare-fun e!747568 () Bool)

(assert (=> mapNonEmpty!54565 (= mapRes!54565 (and tp!104005 e!747568))))

(declare-fun mapKey!54565 () (_ BitVec 32))

(declare-fun mapRest!54565 () (Array (_ BitVec 32) ValueCell!16747))

(declare-fun mapValue!54565 () ValueCell!16747)

(assert (=> mapNonEmpty!54565 (= (arr!42266 _values!1354) (store mapRest!54565 mapKey!54565 mapValue!54565))))

(declare-fun b!1310448 () Bool)

(declare-fun res!869966 () Bool)

(assert (=> b!1310448 (=> (not res!869966) (not e!747570))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310448 (= res!869966 (validKeyInArray!0 (select (arr!42265 _keys!1628) from!2020)))))

(declare-fun b!1310449 () Bool)

(declare-fun res!869969 () Bool)

(assert (=> b!1310449 (=> (not res!869969) (not e!747570))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52157)

(declare-fun zeroValue!1296 () V!52157)

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22830 0))(
  ( (tuple2!22831 (_1!11426 (_ BitVec 64)) (_2!11426 V!52157)) )
))
(declare-datatypes ((List!29969 0))(
  ( (Nil!29966) (Cons!29965 (h!31174 tuple2!22830) (t!43575 List!29969)) )
))
(declare-datatypes ((ListLongMap!20487 0))(
  ( (ListLongMap!20488 (toList!10259 List!29969)) )
))
(declare-fun contains!8409 (ListLongMap!20487 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5272 (array!87570 array!87572 (_ BitVec 32) (_ BitVec 32) V!52157 V!52157 (_ BitVec 32) Int) ListLongMap!20487)

(assert (=> b!1310449 (= res!869969 (contains!8409 (getCurrentListMap!5272 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1310444 () Bool)

(assert (=> b!1310444 (= e!747570 (not true))))

(assert (=> b!1310444 (contains!8409 (getCurrentListMap!5272 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43336 0))(
  ( (Unit!43337) )
))
(declare-fun lt!585360 () Unit!43336)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!14 (array!87570 array!87572 (_ BitVec 32) (_ BitVec 32) V!52157 V!52157 (_ BitVec 64) (_ BitVec 32) Int) Unit!43336)

(assert (=> b!1310444 (= lt!585360 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!14 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun res!869965 () Bool)

(assert (=> start!110726 (=> (not res!869965) (not e!747570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110726 (= res!869965 (validMask!0 mask!2040))))

(assert (=> start!110726 e!747570))

(assert (=> start!110726 tp!104004))

(declare-fun array_inv!31939 (array!87570) Bool)

(assert (=> start!110726 (array_inv!31939 _keys!1628)))

(assert (=> start!110726 true))

(declare-fun tp_is_empty!35291 () Bool)

(assert (=> start!110726 tp_is_empty!35291))

(declare-fun e!747571 () Bool)

(declare-fun array_inv!31940 (array!87572) Bool)

(assert (=> start!110726 (and (array_inv!31940 _values!1354) e!747571)))

(declare-fun mapIsEmpty!54565 () Bool)

(assert (=> mapIsEmpty!54565 mapRes!54565))

(declare-fun b!1310450 () Bool)

(assert (=> b!1310450 (= e!747568 tp_is_empty!35291)))

(declare-fun b!1310451 () Bool)

(declare-fun e!747572 () Bool)

(assert (=> b!1310451 (= e!747572 tp_is_empty!35291)))

(declare-fun b!1310452 () Bool)

(declare-fun res!869962 () Bool)

(assert (=> b!1310452 (=> (not res!869962) (not e!747570))))

(assert (=> b!1310452 (= res!869962 (not (= (select (arr!42265 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1310453 () Bool)

(assert (=> b!1310453 (= e!747571 (and e!747572 mapRes!54565))))

(declare-fun condMapEmpty!54565 () Bool)

(declare-fun mapDefault!54565 () ValueCell!16747)

