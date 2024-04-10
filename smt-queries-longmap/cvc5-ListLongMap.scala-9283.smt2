; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111046 () Bool)

(assert start!111046)

(declare-fun b_free!29881 () Bool)

(declare-fun b_next!29881 () Bool)

(assert (=> start!111046 (= b_free!29881 (not b_next!29881))))

(declare-fun tp!104964 () Bool)

(declare-fun b_and!48089 () Bool)

(assert (=> start!111046 (= tp!104964 b_and!48089)))

(declare-fun mapNonEmpty!55045 () Bool)

(declare-fun mapRes!55045 () Bool)

(declare-fun tp!104965 () Bool)

(declare-fun e!749968 () Bool)

(assert (=> mapNonEmpty!55045 (= mapRes!55045 (and tp!104965 e!749968))))

(declare-datatypes ((V!52585 0))(
  ( (V!52586 (val!17880 Int)) )
))
(declare-datatypes ((ValueCell!16907 0))(
  ( (ValueCellFull!16907 (v!20507 V!52585)) (EmptyCell!16907) )
))
(declare-fun mapRest!55045 () (Array (_ BitVec 32) ValueCell!16907))

(declare-fun mapValue!55045 () ValueCell!16907)

(declare-fun mapKey!55045 () (_ BitVec 32))

(declare-datatypes ((array!88190 0))(
  ( (array!88191 (arr!42575 (Array (_ BitVec 32) ValueCell!16907)) (size!43125 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88190)

(assert (=> mapNonEmpty!55045 (= (arr!42575 _values!1354) (store mapRest!55045 mapKey!55045 mapValue!55045))))

(declare-fun b!1314746 () Bool)

(declare-fun e!749971 () Bool)

(declare-fun tp_is_empty!35611 () Bool)

(assert (=> b!1314746 (= e!749971 tp_is_empty!35611)))

(declare-fun b!1314747 () Bool)

(declare-fun e!749970 () Bool)

(assert (=> b!1314747 (= e!749970 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88192 0))(
  ( (array!88193 (arr!42576 (Array (_ BitVec 32) (_ BitVec 64))) (size!43126 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88192)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52585)

(declare-fun zeroValue!1296 () V!52585)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585831 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((tuple2!23060 0))(
  ( (tuple2!23061 (_1!11541 (_ BitVec 64)) (_2!11541 V!52585)) )
))
(declare-datatypes ((List!30196 0))(
  ( (Nil!30193) (Cons!30192 (h!31401 tuple2!23060) (t!43802 List!30196)) )
))
(declare-datatypes ((ListLongMap!20717 0))(
  ( (ListLongMap!20718 (toList!10374 List!30196)) )
))
(declare-fun contains!8524 (ListLongMap!20717 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5387 (array!88192 array!88190 (_ BitVec 32) (_ BitVec 32) V!52585 V!52585 (_ BitVec 32) Int) ListLongMap!20717)

(assert (=> b!1314747 (= lt!585831 (contains!8524 (getCurrentListMap!5387 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1314748 () Bool)

(declare-fun res!872827 () Bool)

(assert (=> b!1314748 (=> (not res!872827) (not e!749970))))

(declare-datatypes ((List!30197 0))(
  ( (Nil!30194) (Cons!30193 (h!31402 (_ BitVec 64)) (t!43803 List!30197)) )
))
(declare-fun arrayNoDuplicates!0 (array!88192 (_ BitVec 32) List!30197) Bool)

(assert (=> b!1314748 (= res!872827 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30194))))

(declare-fun b!1314749 () Bool)

(declare-fun res!872829 () Bool)

(assert (=> b!1314749 (=> (not res!872829) (not e!749970))))

(assert (=> b!1314749 (= res!872829 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43126 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314750 () Bool)

(declare-fun res!872826 () Bool)

(assert (=> b!1314750 (=> (not res!872826) (not e!749970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88192 (_ BitVec 32)) Bool)

(assert (=> b!1314750 (= res!872826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!872828 () Bool)

(assert (=> start!111046 (=> (not res!872828) (not e!749970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111046 (= res!872828 (validMask!0 mask!2040))))

(assert (=> start!111046 e!749970))

(assert (=> start!111046 tp!104964))

(declare-fun array_inv!32151 (array!88192) Bool)

(assert (=> start!111046 (array_inv!32151 _keys!1628)))

(assert (=> start!111046 true))

(assert (=> start!111046 tp_is_empty!35611))

(declare-fun e!749969 () Bool)

(declare-fun array_inv!32152 (array!88190) Bool)

(assert (=> start!111046 (and (array_inv!32152 _values!1354) e!749969)))

(declare-fun b!1314751 () Bool)

(assert (=> b!1314751 (= e!749969 (and e!749971 mapRes!55045))))

(declare-fun condMapEmpty!55045 () Bool)

(declare-fun mapDefault!55045 () ValueCell!16907)

