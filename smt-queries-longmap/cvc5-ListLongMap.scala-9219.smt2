; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110662 () Bool)

(assert start!110662)

(declare-fun b_free!29497 () Bool)

(declare-fun b_next!29497 () Bool)

(assert (=> start!110662 (= b_free!29497 (not b_next!29497))))

(declare-fun tp!103813 () Bool)

(declare-fun b_and!47705 () Bool)

(assert (=> start!110662 (= tp!103813 b_and!47705)))

(declare-fun b!1309427 () Bool)

(declare-fun res!869234 () Bool)

(declare-fun e!747088 () Bool)

(assert (=> b!1309427 (=> (not res!869234) (not e!747088))))

(declare-datatypes ((array!87446 0))(
  ( (array!87447 (arr!42203 (Array (_ BitVec 32) (_ BitVec 64))) (size!42753 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87446)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309427 (= res!869234 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42753 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309428 () Bool)

(declare-fun e!747089 () Bool)

(declare-fun tp_is_empty!35227 () Bool)

(assert (=> b!1309428 (= e!747089 tp_is_empty!35227)))

(declare-fun b!1309429 () Bool)

(declare-fun res!869237 () Bool)

(assert (=> b!1309429 (=> (not res!869237) (not e!747088))))

(declare-datatypes ((List!29920 0))(
  ( (Nil!29917) (Cons!29916 (h!31125 (_ BitVec 64)) (t!43526 List!29920)) )
))
(declare-fun arrayNoDuplicates!0 (array!87446 (_ BitVec 32) List!29920) Bool)

(assert (=> b!1309429 (= res!869237 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29917))))

(declare-fun mapIsEmpty!54469 () Bool)

(declare-fun mapRes!54469 () Bool)

(assert (=> mapIsEmpty!54469 mapRes!54469))

(declare-fun b!1309430 () Bool)

(declare-fun res!869235 () Bool)

(assert (=> b!1309430 (=> (not res!869235) (not e!747088))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87446 (_ BitVec 32)) Bool)

(assert (=> b!1309430 (= res!869235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309431 () Bool)

(assert (=> b!1309431 (= e!747088 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585264 () Bool)

(declare-datatypes ((V!52073 0))(
  ( (V!52074 (val!17688 Int)) )
))
(declare-fun minValue!1296 () V!52073)

(declare-datatypes ((ValueCell!16715 0))(
  ( (ValueCellFull!16715 (v!20315 V!52073)) (EmptyCell!16715) )
))
(declare-datatypes ((array!87448 0))(
  ( (array!87449 (arr!42204 (Array (_ BitVec 32) ValueCell!16715)) (size!42754 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87448)

(declare-fun zeroValue!1296 () V!52073)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22776 0))(
  ( (tuple2!22777 (_1!11399 (_ BitVec 64)) (_2!11399 V!52073)) )
))
(declare-datatypes ((List!29921 0))(
  ( (Nil!29918) (Cons!29917 (h!31126 tuple2!22776) (t!43527 List!29921)) )
))
(declare-datatypes ((ListLongMap!20433 0))(
  ( (ListLongMap!20434 (toList!10232 List!29921)) )
))
(declare-fun contains!8382 (ListLongMap!20433 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5245 (array!87446 array!87448 (_ BitVec 32) (_ BitVec 32) V!52073 V!52073 (_ BitVec 32) Int) ListLongMap!20433)

(assert (=> b!1309431 (= lt!585264 (contains!8382 (getCurrentListMap!5245 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1309432 () Bool)

(declare-fun res!869238 () Bool)

(assert (=> b!1309432 (=> (not res!869238) (not e!747088))))

(assert (=> b!1309432 (= res!869238 (and (= (size!42754 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42753 _keys!1628) (size!42754 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309433 () Bool)

(declare-fun e!747090 () Bool)

(assert (=> b!1309433 (= e!747090 (and e!747089 mapRes!54469))))

(declare-fun condMapEmpty!54469 () Bool)

(declare-fun mapDefault!54469 () ValueCell!16715)

