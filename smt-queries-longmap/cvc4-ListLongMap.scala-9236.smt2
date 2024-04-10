; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110768 () Bool)

(assert start!110768)

(declare-fun b_free!29603 () Bool)

(declare-fun b_next!29603 () Bool)

(assert (=> start!110768 (= b_free!29603 (not b_next!29603))))

(declare-fun tp!104130 () Bool)

(declare-fun b_and!47811 () Bool)

(assert (=> start!110768 (= tp!104130 b_and!47811)))

(declare-fun b!1311023 () Bool)

(declare-fun res!870355 () Bool)

(declare-fun e!747885 () Bool)

(assert (=> b!1311023 (=> (not res!870355) (not e!747885))))

(declare-datatypes ((array!87654 0))(
  ( (array!87655 (arr!42307 (Array (_ BitVec 32) (_ BitVec 64))) (size!42857 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87654)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87654 (_ BitVec 32)) Bool)

(assert (=> b!1311023 (= res!870355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54628 () Bool)

(declare-fun mapRes!54628 () Bool)

(assert (=> mapIsEmpty!54628 mapRes!54628))

(declare-fun b!1311024 () Bool)

(declare-fun e!747886 () Bool)

(declare-fun tp_is_empty!35333 () Bool)

(assert (=> b!1311024 (= e!747886 tp_is_empty!35333)))

(declare-fun res!870357 () Bool)

(assert (=> start!110768 (=> (not res!870357) (not e!747885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110768 (= res!870357 (validMask!0 mask!2040))))

(assert (=> start!110768 e!747885))

(assert (=> start!110768 tp!104130))

(declare-fun array_inv!31971 (array!87654) Bool)

(assert (=> start!110768 (array_inv!31971 _keys!1628)))

(assert (=> start!110768 true))

(assert (=> start!110768 tp_is_empty!35333))

(declare-datatypes ((V!52213 0))(
  ( (V!52214 (val!17741 Int)) )
))
(declare-datatypes ((ValueCell!16768 0))(
  ( (ValueCellFull!16768 (v!20368 V!52213)) (EmptyCell!16768) )
))
(declare-datatypes ((array!87656 0))(
  ( (array!87657 (arr!42308 (Array (_ BitVec 32) ValueCell!16768)) (size!42858 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87656)

(declare-fun e!747887 () Bool)

(declare-fun array_inv!31972 (array!87656) Bool)

(assert (=> start!110768 (and (array_inv!31972 _values!1354) e!747887)))

(declare-fun b!1311025 () Bool)

(declare-fun res!870356 () Bool)

(assert (=> b!1311025 (=> (not res!870356) (not e!747885))))

(declare-datatypes ((List!30002 0))(
  ( (Nil!29999) (Cons!29998 (h!31207 (_ BitVec 64)) (t!43608 List!30002)) )
))
(declare-fun arrayNoDuplicates!0 (array!87654 (_ BitVec 32) List!30002) Bool)

(assert (=> b!1311025 (= res!870356 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29999))))

(declare-fun b!1311026 () Bool)

(assert (=> b!1311026 (= e!747885 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun lt!585423 () Bool)

(declare-fun minValue!1296 () V!52213)

(declare-fun zeroValue!1296 () V!52213)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22862 0))(
  ( (tuple2!22863 (_1!11442 (_ BitVec 64)) (_2!11442 V!52213)) )
))
(declare-datatypes ((List!30003 0))(
  ( (Nil!30000) (Cons!29999 (h!31208 tuple2!22862) (t!43609 List!30003)) )
))
(declare-datatypes ((ListLongMap!20519 0))(
  ( (ListLongMap!20520 (toList!10275 List!30003)) )
))
(declare-fun contains!8425 (ListLongMap!20519 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5288 (array!87654 array!87656 (_ BitVec 32) (_ BitVec 32) V!52213 V!52213 (_ BitVec 32) Int) ListLongMap!20519)

(assert (=> b!1311026 (= lt!585423 (contains!8425 (getCurrentListMap!5288 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!54628 () Bool)

(declare-fun tp!104131 () Bool)

(assert (=> mapNonEmpty!54628 (= mapRes!54628 (and tp!104131 e!747886))))

(declare-fun mapKey!54628 () (_ BitVec 32))

(declare-fun mapValue!54628 () ValueCell!16768)

(declare-fun mapRest!54628 () (Array (_ BitVec 32) ValueCell!16768))

(assert (=> mapNonEmpty!54628 (= (arr!42308 _values!1354) (store mapRest!54628 mapKey!54628 mapValue!54628))))

(declare-fun b!1311027 () Bool)

(declare-fun e!747883 () Bool)

(assert (=> b!1311027 (= e!747883 tp_is_empty!35333)))

(declare-fun b!1311028 () Bool)

(assert (=> b!1311028 (= e!747887 (and e!747883 mapRes!54628))))

(declare-fun condMapEmpty!54628 () Bool)

(declare-fun mapDefault!54628 () ValueCell!16768)

