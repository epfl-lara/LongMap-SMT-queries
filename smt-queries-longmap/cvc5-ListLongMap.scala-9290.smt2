; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111088 () Bool)

(assert start!111088)

(declare-fun b_free!29923 () Bool)

(declare-fun b_next!29923 () Bool)

(assert (=> start!111088 (= b_free!29923 (not b_next!29923))))

(declare-fun tp!105090 () Bool)

(declare-fun b_and!48131 () Bool)

(assert (=> start!111088 (= tp!105090 b_and!48131)))

(declare-fun mapIsEmpty!55108 () Bool)

(declare-fun mapRes!55108 () Bool)

(assert (=> mapIsEmpty!55108 mapRes!55108))

(declare-fun b!1315286 () Bool)

(declare-fun e!750285 () Bool)

(declare-fun tp_is_empty!35653 () Bool)

(assert (=> b!1315286 (= e!750285 tp_is_empty!35653)))

(declare-fun b!1315287 () Bool)

(declare-fun res!873177 () Bool)

(declare-fun e!750283 () Bool)

(assert (=> b!1315287 (=> (not res!873177) (not e!750283))))

(declare-datatypes ((array!88270 0))(
  ( (array!88271 (arr!42615 (Array (_ BitVec 32) (_ BitVec 64))) (size!43165 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88270)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1315287 (= res!873177 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43165 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315288 () Bool)

(declare-fun res!873178 () Bool)

(assert (=> b!1315288 (=> (not res!873178) (not e!750283))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52641 0))(
  ( (V!52642 (val!17901 Int)) )
))
(declare-datatypes ((ValueCell!16928 0))(
  ( (ValueCellFull!16928 (v!20528 V!52641)) (EmptyCell!16928) )
))
(declare-datatypes ((array!88272 0))(
  ( (array!88273 (arr!42616 (Array (_ BitVec 32) ValueCell!16928)) (size!43166 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88272)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315288 (= res!873178 (and (= (size!43166 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43165 _keys!1628) (size!43166 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315289 () Bool)

(assert (=> b!1315289 (= e!750283 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585894 () Bool)

(declare-fun minValue!1296 () V!52641)

(declare-fun zeroValue!1296 () V!52641)

(declare-datatypes ((tuple2!23092 0))(
  ( (tuple2!23093 (_1!11557 (_ BitVec 64)) (_2!11557 V!52641)) )
))
(declare-datatypes ((List!30227 0))(
  ( (Nil!30224) (Cons!30223 (h!31432 tuple2!23092) (t!43833 List!30227)) )
))
(declare-datatypes ((ListLongMap!20749 0))(
  ( (ListLongMap!20750 (toList!10390 List!30227)) )
))
(declare-fun contains!8540 (ListLongMap!20749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5403 (array!88270 array!88272 (_ BitVec 32) (_ BitVec 32) V!52641 V!52641 (_ BitVec 32) Int) ListLongMap!20749)

(assert (=> b!1315289 (= lt!585894 (contains!8540 (getCurrentListMap!5403 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun res!873179 () Bool)

(assert (=> start!111088 (=> (not res!873179) (not e!750283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111088 (= res!873179 (validMask!0 mask!2040))))

(assert (=> start!111088 e!750283))

(assert (=> start!111088 tp!105090))

(declare-fun array_inv!32185 (array!88270) Bool)

(assert (=> start!111088 (array_inv!32185 _keys!1628)))

(assert (=> start!111088 true))

(assert (=> start!111088 tp_is_empty!35653))

(declare-fun e!750284 () Bool)

(declare-fun array_inv!32186 (array!88272) Bool)

(assert (=> start!111088 (and (array_inv!32186 _values!1354) e!750284)))

(declare-fun b!1315290 () Bool)

(declare-fun res!873176 () Bool)

(assert (=> b!1315290 (=> (not res!873176) (not e!750283))))

(declare-datatypes ((List!30228 0))(
  ( (Nil!30225) (Cons!30224 (h!31433 (_ BitVec 64)) (t!43834 List!30228)) )
))
(declare-fun arrayNoDuplicates!0 (array!88270 (_ BitVec 32) List!30228) Bool)

(assert (=> b!1315290 (= res!873176 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30225))))

(declare-fun mapNonEmpty!55108 () Bool)

(declare-fun tp!105091 () Bool)

(assert (=> mapNonEmpty!55108 (= mapRes!55108 (and tp!105091 e!750285))))

(declare-fun mapKey!55108 () (_ BitVec 32))

(declare-fun mapValue!55108 () ValueCell!16928)

(declare-fun mapRest!55108 () (Array (_ BitVec 32) ValueCell!16928))

(assert (=> mapNonEmpty!55108 (= (arr!42616 _values!1354) (store mapRest!55108 mapKey!55108 mapValue!55108))))

(declare-fun b!1315291 () Bool)

(declare-fun e!750287 () Bool)

(assert (=> b!1315291 (= e!750287 tp_is_empty!35653)))

(declare-fun b!1315292 () Bool)

(assert (=> b!1315292 (= e!750284 (and e!750287 mapRes!55108))))

(declare-fun condMapEmpty!55108 () Bool)

(declare-fun mapDefault!55108 () ValueCell!16928)

