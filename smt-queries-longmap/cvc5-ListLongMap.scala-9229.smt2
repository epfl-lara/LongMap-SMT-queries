; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110722 () Bool)

(assert start!110722)

(declare-fun b_free!29557 () Bool)

(declare-fun b_next!29557 () Bool)

(assert (=> start!110722 (= b_free!29557 (not b_next!29557))))

(declare-fun tp!103993 () Bool)

(declare-fun b_and!47765 () Bool)

(assert (=> start!110722 (= tp!103993 b_and!47765)))

(declare-fun b!1310371 () Bool)

(declare-fun res!869909 () Bool)

(declare-fun e!747541 () Bool)

(assert (=> b!1310371 (=> (not res!869909) (not e!747541))))

(declare-datatypes ((array!87562 0))(
  ( (array!87563 (arr!42261 (Array (_ BitVec 32) (_ BitVec 64))) (size!42811 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87562)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310371 (= res!869909 (validKeyInArray!0 (select (arr!42261 _keys!1628) from!2020)))))

(declare-fun b!1310372 () Bool)

(declare-fun res!869912 () Bool)

(assert (=> b!1310372 (=> (not res!869912) (not e!747541))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87562 (_ BitVec 32)) Bool)

(assert (=> b!1310372 (= res!869912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!869914 () Bool)

(assert (=> start!110722 (=> (not res!869914) (not e!747541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110722 (= res!869914 (validMask!0 mask!2040))))

(assert (=> start!110722 e!747541))

(assert (=> start!110722 tp!103993))

(declare-fun array_inv!31935 (array!87562) Bool)

(assert (=> start!110722 (array_inv!31935 _keys!1628)))

(assert (=> start!110722 true))

(declare-fun tp_is_empty!35287 () Bool)

(assert (=> start!110722 tp_is_empty!35287))

(declare-datatypes ((V!52153 0))(
  ( (V!52154 (val!17718 Int)) )
))
(declare-datatypes ((ValueCell!16745 0))(
  ( (ValueCellFull!16745 (v!20345 V!52153)) (EmptyCell!16745) )
))
(declare-datatypes ((array!87564 0))(
  ( (array!87565 (arr!42262 (Array (_ BitVec 32) ValueCell!16745)) (size!42812 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87564)

(declare-fun e!747540 () Bool)

(declare-fun array_inv!31936 (array!87564) Bool)

(assert (=> start!110722 (and (array_inv!31936 _values!1354) e!747540)))

(declare-fun b!1310373 () Bool)

(declare-fun e!747542 () Bool)

(assert (=> b!1310373 (= e!747542 tp_is_empty!35287)))

(declare-fun b!1310374 () Bool)

(declare-fun res!869916 () Bool)

(assert (=> b!1310374 (=> (not res!869916) (not e!747541))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52153)

(declare-fun zeroValue!1296 () V!52153)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22826 0))(
  ( (tuple2!22827 (_1!11424 (_ BitVec 64)) (_2!11424 V!52153)) )
))
(declare-datatypes ((List!29964 0))(
  ( (Nil!29961) (Cons!29960 (h!31169 tuple2!22826) (t!43570 List!29964)) )
))
(declare-datatypes ((ListLongMap!20483 0))(
  ( (ListLongMap!20484 (toList!10257 List!29964)) )
))
(declare-fun contains!8407 (ListLongMap!20483 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5270 (array!87562 array!87564 (_ BitVec 32) (_ BitVec 32) V!52153 V!52153 (_ BitVec 32) Int) ListLongMap!20483)

(assert (=> b!1310374 (= res!869916 (contains!8407 (getCurrentListMap!5270 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1310375 () Bool)

(declare-fun e!747539 () Bool)

(assert (=> b!1310375 (= e!747539 tp_is_empty!35287)))

(declare-fun b!1310376 () Bool)

(declare-fun res!869908 () Bool)

(assert (=> b!1310376 (=> (not res!869908) (not e!747541))))

(assert (=> b!1310376 (= res!869908 (not (= (select (arr!42261 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1310377 () Bool)

(declare-fun res!869915 () Bool)

(assert (=> b!1310377 (=> (not res!869915) (not e!747541))))

(declare-datatypes ((List!29965 0))(
  ( (Nil!29962) (Cons!29961 (h!31170 (_ BitVec 64)) (t!43571 List!29965)) )
))
(declare-fun arrayNoDuplicates!0 (array!87562 (_ BitVec 32) List!29965) Bool)

(assert (=> b!1310377 (= res!869915 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29962))))

(declare-fun mapNonEmpty!54559 () Bool)

(declare-fun mapRes!54559 () Bool)

(declare-fun tp!103992 () Bool)

(assert (=> mapNonEmpty!54559 (= mapRes!54559 (and tp!103992 e!747539))))

(declare-fun mapKey!54559 () (_ BitVec 32))

(declare-fun mapRest!54559 () (Array (_ BitVec 32) ValueCell!16745))

(declare-fun mapValue!54559 () ValueCell!16745)

(assert (=> mapNonEmpty!54559 (= (arr!42262 _values!1354) (store mapRest!54559 mapKey!54559 mapValue!54559))))

(declare-fun b!1310378 () Bool)

(assert (=> b!1310378 (= e!747541 (not true))))

(assert (=> b!1310378 (contains!8407 (getCurrentListMap!5270 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43332 0))(
  ( (Unit!43333) )
))
(declare-fun lt!585354 () Unit!43332)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!12 (array!87562 array!87564 (_ BitVec 32) (_ BitVec 32) V!52153 V!52153 (_ BitVec 64) (_ BitVec 32) Int) Unit!43332)

(assert (=> b!1310378 (= lt!585354 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!12 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310379 () Bool)

(declare-fun res!869911 () Bool)

(assert (=> b!1310379 (=> (not res!869911) (not e!747541))))

(assert (=> b!1310379 (= res!869911 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42811 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310380 () Bool)

(declare-fun res!869913 () Bool)

(assert (=> b!1310380 (=> (not res!869913) (not e!747541))))

(assert (=> b!1310380 (= res!869913 (and (= (size!42812 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42811 _keys!1628) (size!42812 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54559 () Bool)

(assert (=> mapIsEmpty!54559 mapRes!54559))

(declare-fun b!1310381 () Bool)

(assert (=> b!1310381 (= e!747540 (and e!747542 mapRes!54559))))

(declare-fun condMapEmpty!54559 () Bool)

(declare-fun mapDefault!54559 () ValueCell!16745)

