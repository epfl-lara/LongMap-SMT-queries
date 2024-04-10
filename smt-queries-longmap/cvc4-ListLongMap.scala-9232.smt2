; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110744 () Bool)

(assert start!110744)

(declare-fun b_free!29579 () Bool)

(declare-fun b_next!29579 () Bool)

(assert (=> start!110744 (= b_free!29579 (not b_next!29579))))

(declare-fun tp!104058 () Bool)

(declare-fun b_and!47787 () Bool)

(assert (=> start!110744 (= tp!104058 b_and!47787)))

(declare-fun b!1310735 () Bool)

(declare-fun res!870175 () Bool)

(declare-fun e!747704 () Bool)

(assert (=> b!1310735 (=> (not res!870175) (not e!747704))))

(declare-datatypes ((array!87606 0))(
  ( (array!87607 (arr!42283 (Array (_ BitVec 32) (_ BitVec 64))) (size!42833 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87606)

(declare-datatypes ((List!29985 0))(
  ( (Nil!29982) (Cons!29981 (h!31190 (_ BitVec 64)) (t!43591 List!29985)) )
))
(declare-fun arrayNoDuplicates!0 (array!87606 (_ BitVec 32) List!29985) Bool)

(assert (=> b!1310735 (= res!870175 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29982))))

(declare-fun b!1310736 () Bool)

(declare-fun res!870174 () Bool)

(assert (=> b!1310736 (=> (not res!870174) (not e!747704))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52181 0))(
  ( (V!52182 (val!17729 Int)) )
))
(declare-datatypes ((ValueCell!16756 0))(
  ( (ValueCellFull!16756 (v!20356 V!52181)) (EmptyCell!16756) )
))
(declare-datatypes ((array!87608 0))(
  ( (array!87609 (arr!42284 (Array (_ BitVec 32) ValueCell!16756)) (size!42834 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87608)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310736 (= res!870174 (and (= (size!42834 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42833 _keys!1628) (size!42834 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310737 () Bool)

(assert (=> b!1310737 (= e!747704 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52181)

(declare-fun zeroValue!1296 () V!52181)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585387 () Bool)

(declare-datatypes ((tuple2!22846 0))(
  ( (tuple2!22847 (_1!11434 (_ BitVec 64)) (_2!11434 V!52181)) )
))
(declare-datatypes ((List!29986 0))(
  ( (Nil!29983) (Cons!29982 (h!31191 tuple2!22846) (t!43592 List!29986)) )
))
(declare-datatypes ((ListLongMap!20503 0))(
  ( (ListLongMap!20504 (toList!10267 List!29986)) )
))
(declare-fun contains!8417 (ListLongMap!20503 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5280 (array!87606 array!87608 (_ BitVec 32) (_ BitVec 32) V!52181 V!52181 (_ BitVec 32) Int) ListLongMap!20503)

(assert (=> b!1310737 (= lt!585387 (contains!8417 (getCurrentListMap!5280 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1310738 () Bool)

(declare-fun res!870176 () Bool)

(assert (=> b!1310738 (=> (not res!870176) (not e!747704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87606 (_ BitVec 32)) Bool)

(assert (=> b!1310738 (= res!870176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!870173 () Bool)

(assert (=> start!110744 (=> (not res!870173) (not e!747704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110744 (= res!870173 (validMask!0 mask!2040))))

(assert (=> start!110744 e!747704))

(assert (=> start!110744 tp!104058))

(declare-fun array_inv!31953 (array!87606) Bool)

(assert (=> start!110744 (array_inv!31953 _keys!1628)))

(assert (=> start!110744 true))

(declare-fun tp_is_empty!35309 () Bool)

(assert (=> start!110744 tp_is_empty!35309))

(declare-fun e!747707 () Bool)

(declare-fun array_inv!31954 (array!87608) Bool)

(assert (=> start!110744 (and (array_inv!31954 _values!1354) e!747707)))

(declare-fun mapNonEmpty!54592 () Bool)

(declare-fun mapRes!54592 () Bool)

(declare-fun tp!104059 () Bool)

(declare-fun e!747705 () Bool)

(assert (=> mapNonEmpty!54592 (= mapRes!54592 (and tp!104059 e!747705))))

(declare-fun mapRest!54592 () (Array (_ BitVec 32) ValueCell!16756))

(declare-fun mapValue!54592 () ValueCell!16756)

(declare-fun mapKey!54592 () (_ BitVec 32))

(assert (=> mapNonEmpty!54592 (= (arr!42284 _values!1354) (store mapRest!54592 mapKey!54592 mapValue!54592))))

(declare-fun mapIsEmpty!54592 () Bool)

(assert (=> mapIsEmpty!54592 mapRes!54592))

(declare-fun b!1310739 () Bool)

(declare-fun res!870177 () Bool)

(assert (=> b!1310739 (=> (not res!870177) (not e!747704))))

(assert (=> b!1310739 (= res!870177 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42833 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310740 () Bool)

(assert (=> b!1310740 (= e!747705 tp_is_empty!35309)))

(declare-fun b!1310741 () Bool)

(declare-fun e!747706 () Bool)

(assert (=> b!1310741 (= e!747706 tp_is_empty!35309)))

(declare-fun b!1310742 () Bool)

(assert (=> b!1310742 (= e!747707 (and e!747706 mapRes!54592))))

(declare-fun condMapEmpty!54592 () Bool)

(declare-fun mapDefault!54592 () ValueCell!16756)

